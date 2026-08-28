"""External information integration with timeout, validation and file caching.

Primary source: Open-Meteo Weather Forecast API.
Documentation: https://open-meteo.com/en/docs
No API key is required for the basic forecast endpoint used here.
"""
import hashlib
import json
import os
import time
from urllib.parse import urlencode
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
CACHE_DIR = os.path.join(BASE_DIR, "cache")
os.makedirs(CACHE_DIR, exist_ok=True)

API_URL = "https://api.open-meteo.com/v1/forecast"
CACHE_TTL = 30 * 60
TIMEOUT = 8


def _cache_file(latitude, longitude):
    key = f"{latitude:.4f}_{longitude:.4f}".encode("utf-8")
    digest = hashlib.sha256(key).hexdigest()[:20]
    return os.path.join(CACHE_DIR, f"weather_{digest}.json")


def _read_cache(path):
    try:
        with open(path, "r", encoding="utf-8") as file:
            payload = json.load(file)
        if time.time() - payload.get("cached_at", 0) <= CACHE_TTL:
            return payload.get("data")
    except (OSError, ValueError, TypeError):
        return None
    return None


def _write_cache(path, data):
    tmp = path + ".tmp"
    with open(tmp, "w", encoding="utf-8") as file:
        json.dump({"cached_at": time.time(), "data": data}, file)
    os.replace(tmp, path)


def _weather_label(code):
    codes = {
        0: "Clear sky", 1: "Mainly clear", 2: "Partly cloudy", 3: "Overcast",
        45: "Fog", 48: "Rime fog", 51: "Light drizzle", 53: "Drizzle",
        55: "Heavy drizzle", 61: "Light rain", 63: "Rain", 65: "Heavy rain",
        71: "Light snow", 73: "Snow", 75: "Heavy snow", 80: "Rain showers",
        81: "Rain showers", 82: "Heavy rain showers", 95: "Thunderstorm",
        96: "Thunderstorm with hail", 99: "Thunderstorm with hail",
    }
    return codes.get(code, "Current conditions")


def get_current_weather(latitude, longitude, force_refresh=False):
    """Fetch current conditions, falling back to cached data on network failure."""
    try:
        latitude = float(latitude)
        longitude = float(longitude)
        if not (-90 <= latitude <= 90 and -180 <= longitude <= 180):
            raise ValueError("Invalid latitude/longitude")
    except (TypeError, ValueError):
        return {"ok": False, "message": "Invalid location coordinates."}

    cache_file = _cache_file(latitude, longitude)
    if not force_refresh:
        cached = _read_cache(cache_file)
        if cached:
            return {"ok": True, "data": cached, "cached": True}

    params = urlencode({
        "latitude": latitude,
        "longitude": longitude,
        "current": "temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m",
        "timezone": "auto",
    })
    request = Request(
        f"{API_URL}?{params}",
        headers={"User-Agent": "TamilNaduTourism/1.0"},
    )
    try:
        with urlopen(request, timeout=TIMEOUT) as response:
            if response.status != 200:
                raise URLError(f"HTTP status {response.status}")
            payload = json.loads(response.read().decode("utf-8"))
        current = payload.get("current", {})
        result = {
            "temperature": current.get("temperature_2m"),
            "humidity": current.get("relative_humidity_2m"),
            "apparent_temperature": current.get("apparent_temperature"),
            "weather_code": current.get("weather_code"),
            "weather": _weather_label(current.get("weather_code")),
            "wind_speed": current.get("wind_speed_10m"),
            "timezone": payload.get("timezone", "Asia/Kolkata"),
            "observed_at": current.get("time"),
            "source": "Open-Meteo",
        }
        if result["temperature"] is None:
            raise ValueError("Weather API returned incomplete current data")
        _write_cache(cache_file, result)
        return {"ok": True, "data": result, "cached": False}
    except (HTTPError, URLError, TimeoutError, OSError, ValueError, json.JSONDecodeError) as exc:
        cached = None
        try:
            with open(cache_file, "r", encoding="utf-8") as file:
                cached = json.load(file).get("data")
        except (OSError, ValueError, TypeError):
            pass
        if cached:
            return {
                "ok": True,
                "data": cached,
                "cached": True,
                "stale": True,
                "message": "Live service unavailable; showing cached weather.",
            }
        return {
            "ok": False,
            "message": f"Online weather service unavailable: {exc}",
        }
