import logging
import os
import subprocess
import sys
import tkinter as tk
from tkinter import messagebox

from PIL import Image, ImageDraw, ImageFilter, ImageTk

from db import get_connection
from online_data import get_current_weather


logger = logging.getLogger(__name__)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
IMAGE_DIR = os.path.join(BASE_DIR, "images")

BG_COLOR = "#F4F7FB"
TEXT = "#172B4D"
PRIMARY_DARK = "#0B2E59"
GREEN = PRIMARY_DARK


class TourismApp:

    def __init__(self, root):
        self.root = root
        self.root.title("Tamil Nadu Tourism - NEW VERSION")
        self.root.geometry("1400x630")
        self.root.minsize(900, 600)
        self.root.configure(bg=BG_COLOR)

        self.green = GREEN
        self.theme_hover = "#164A7A"
        self.sidebar_open = True

        self.header()
        self.sidebar()

        self.content = tk.Frame(
            self.root,
            bg=BG_COLOR
        )

        self._place_content()
        self.show_home()

    # =====================================================
    # WINDOW LAYOUT
    # =====================================================

    def _place_content(self):
        if self.sidebar_open:
            self.content.place(
                x=280,
                y=70,
                relwidth=1.0,
                width=-280,
                relheight=1.0,
                height=-70
            )
        else:
            self.content.place(
                x=0,
                y=70,
                relwidth=1.0,
                width=0,
                relheight=1.0,
                height=-70
            )

    def header(self):
        self.header_frame = tk.Frame(
            self.root,
            bg=self.green
        )
        self.header_frame.place(
            x=0,
            y=0,
            relwidth=1.0,
            height=70
        )

        self.menu_button = tk.Button(
            self.header_frame,
            text="☰",
            font=("Arial", 18, "bold"),
            bg=self.green,
            fg="white",
            activebackground="#087F5B",
            activeforeground="white",
            bd=0,
            relief="flat",
            cursor="hand2",
            command=self.toggle_sidebar
        )
        self.menu_button.place(
            x=10,
            y=10,
            width=40,
            height=40
        )

        tk.Label(
            self.header_frame,
            text="TAMIL NADU",
            font=("Georgia", 20, "bold"),
            bg=self.green,
            fg="white"
        ).place(
            x=70,
            y=10
        )

        tk.Label(
            self.header_frame,
            text="Tourist Information & Recommendation",
            font=("Arial", 10),
            bg=self.green,
            fg="white"
        ).place(
            x=72,
            y=42
        )

    def sidebar(self):
        self.sidebar_frame = tk.Frame(
            self.root,
            bg=self.green
        )

        self.sidebar_frame.place(
            x=0,
            y=70,
            width=280,
            relheight=1.0,
            height=-70
        )

        tk.Button(
            self.sidebar_frame,
            text="✕",
            font=("Arial", 13, "bold"),
            bg=self.green,
            fg="white",
            activebackground="#087F5B",
            activeforeground="white",
            bd=0,
            relief="flat",
            cursor="hand2",
            command=self.toggle_sidebar
        ).place(
            x=238,
            y=8,
            width=32,
            height=30
        )

        pages = [
            ("🏠", "Home"),
            ("📍", "District Details"),
            ("🚨", "Emergency Contacts"),
            ("🤖", "Recommendation")
        ]

        for i, (icon, name) in enumerate(pages):
            tk.Button(
                self.sidebar_frame,
                text=f"{icon}  {name}",
                anchor="w",
                padx=15,
                bg=self.green,
                fg="white",
                activebackground="#087F5B",
                activeforeground="white",
                bd=0,
                relief="flat",
                font=("Arial", 10, "bold"),
                cursor="hand2",
                command=lambda page=name: self.open_page(page)
            ).place(
                x=10,
                y=50 + i * 42,
                width=255,
                height=35
            )

        self.logout_button = tk.Button(
            self.sidebar_frame,
            text="🚪  Logout",
            bg="#164A7A",
            fg="white",
            activebackground="#19A88F",
            activeforeground="white",
            bd=0,
            relief="flat",
            font=("Arial", 10, "bold"),
            cursor="hand2",
            command=self.logout
        )

        self.logout_button.place(
            x=10,
            y=575,
            width=255,
            height=35
        )

        def open_url(url):
            webbrowser.open_new_tab(url)

        tn_link = tk.Label(self.sidebar_frame, text="🏞 Official TN Tourism", font=("Arial", 10),
                           bg=self.green, fg="white", cursor="hand2")
        tn_link.place(x=15, y=500)
        tn_link.bind("<Button-1>", lambda e: open_url("https://www.tamilnadutourism.tn.gov.in/"))

        map_link = tk.Label(self.sidebar_frame, text="🌎 Google Maps", font=("Arial", 10),
                            bg=self.green, fg="white", cursor="hand2")
        map_link.place(x=15, y=525)
        map_link.bind("<Button-1>", lambda e: open_url("https://maps.google.com/?q=Tamil+Nadu"))

    def toggle_sidebar(self):
        self.sidebar_open = not self.sidebar_open

        if self.sidebar_open:
            self.sidebar_frame.place(
                x=0,
                y=70,
                width=280,
                relheight=1.0,
                height=-70
            )
            self.sidebar_frame.lift()
        else:
            self.sidebar_frame.place_forget()

        self._place_content()
        self.menu_button.lift()

    def open_page(self, page):
        self.clear()

        pages = {
            "Home": self.show_home,
            "District Details": self.show_districts,
            "Emergency Contacts": self.show_emergency_contacts,
            "Recommendation": self.show_ai_recommendation
        }

        pages.get(
            page,
            lambda: self.placeholder(page)
        )()

    # =====================================================
    # HOME
    # =====================================================

    def show_home(self):
        self.clear()

        canvas = tk.Canvas(
            self.content,
            bg=self.green,
            highlightthickness=0,
            bd=0
        )
        canvas.pack(
            fill="both",
            expand=True
        )

        self._draw_background(
            canvas,
            "home_bg.jpg",
            blur=2
        )

        canvas.create_text(
            460,
            55,
            text="WELCOME TO TAMIL NADU",
            font=("Georgia", 28, "bold"),
            fill="white"
        )

        canvas.create_text(
            460,
            92,
            text="Explore • Experience • Remember",
            font=("Arial", 12),
            fill="#8FF5DF"
        )

        canvas.create_text(
            460,
            125,
            text="“Yathum oore yavarum kelir”",
            font=("Georgia", 13, "italic"),
            fill="white"
        )

        canvas.create_text(
            460,
            150,
            text="Every place is my home; Every person is my kin.",
            font=("Arial", 9),
            fill="#E8F5F0"
        )

        search_frame = tk.Frame(
            self.content,
            bg="#DCE7E3",
            highlightbackground="white",
            highlightthickness=1
        )

        search_frame.place(
            relx=0.10,
            rely=0.278,
            relwidth=0.80,
            height=46
        )

        search_entry = tk.Entry(
            search_frame,
            font=("Arial", 11),
            bd=0,
            relief="flat",
            bg="#DCE7E3",
            fg="#555555",
            insertbackground=self.green
        )

        search_entry.pack(
            side="left",
            fill="both",
            expand=True,
            padx=(15, 5)
        )

        placeholder = "Search district, tourist place or attraction..."
        search_entry.insert(
            0,
            placeholder
        )

        def clear_placeholder(_event):
            if search_entry.get() == placeholder:
                search_entry.delete(
                    0,
                    tk.END
                )

        def restore_placeholder(_event):
            if not search_entry.get().strip():
                search_entry.insert(
                    0,
                    placeholder
                )

        search_entry.bind(
            "<FocusIn>",
            clear_placeholder
        )

        search_entry.bind(
            "<FocusOut>",
            restore_placeholder
        )

        search_entry.bind(
            "<Return>",
            lambda _event: self.search_tourism(
                search_entry.get()
            )
        )

        tk.Button(
            search_frame,
            text="SEARCH",
            font=("Arial", 10, "bold"),
            bg="#087F6B",
            fg="white",
            activebackground="#19A88F",
            activeforeground="white",
            bd=0,
            cursor="hand2",
            command=lambda: self.search_tourism(
                search_entry.get()
            )
        ).pack(
            side="right",
            fill="y",
            padx=5,
            pady=5
        )

        canvas.create_text(
            460,
            265,
            text="Tamil Nadu Travel Essentials",
            font=("Georgia", 21, "bold"),
            fill="white"
        )

        items = [
            ("🌤", "BEST TIME", "October – March"),
            ("🍛", "TAMIL CUISINE", "Try authentic local food"),
            ("🛕", "MUST VISIT", "Temples • Beaches • Hills"),
            ("🧭", "TRAVEL TIP", "Plan your trip by district")
        ]

        for (icon, title, description), x in zip(
            items,
            [0.04, 0.28, 0.52, 0.76]
        ):
            card = tk.Frame(
                self.content,
                bg="#174E4B",
                highlightbackground="#9DEFE0",
                highlightthickness=1
            )

            card.place(
                relx=x,
                y=300,
                relwidth=0.19,
                height=145
            )

            tk.Label(
                card,
                text=icon,
                font=("Arial", 27),
                bg="#174E4B",
                fg="white"
            ).pack(
                pady=(14, 3)
            )

            tk.Label(
                card,
                text=title,
                font=("Arial", 10, "bold"),
                bg="#174E4B",
                fg="#8FF5DF"
            ).pack()

            tk.Label(
                card,
                text=description,
                font=("Arial", 8),
                bg="#174E4B",
                fg="white",
                wraplength=165,
                justify="center"
            ).pack(
                pady=5
            )

        culture = tk.Frame(
            self.content,
            bg=self.green,
            highlightbackground="#19C7B0",
            highlightthickness=1
        )

        culture.place(
            relx=0.035,
            rely=0.755,
            relwidth=0.93,
            height=105
        )

        tk.Label(
            culture,
            text="தமிழ்நாடு • தமிழ் உணவு • தமிழ் பண்பாடு • தமிழ் கலை",
            font=("Arial", 15, "bold"),
            bg=self.green,
            fg="#8FF5DF"
        ).pack(
            pady=(16, 7)
        )

        tk.Label(
            culture,
            text="Explore traditional food, temples, festivals, arts, music and the unique culture of Tamil Nadu.",
            font=("Arial", 10),
            bg=self.green,
            fg="white"
        ).pack()

        tk.Label(
            culture,
            text="🤖 Recommendation is available from the sidebar.",
            font=("Arial", 9, "italic"),
            bg=self.green,
            fg="#D8FFF7"
        ).pack(
            pady=6
        )

    # =====================================================
    # SEARCH
    # =====================================================

    def search_tourism(self, keyword):
        keyword = (keyword or "").strip()

        placeholder = "Search district, tourist place or attraction..."

        if keyword.lower() == placeholder.lower():
            keyword = ""

        if not keyword:
            messagebox.showwarning(
                "Search",
                "Please enter a district, tourist place or attraction."
            )
            return

        con = cur = None

        try:
            con = get_connection()
            cur = con.cursor(dictionary=True)

            like = f"%{keyword}%"
            results = []

            cur.execute(
                """
                SELECT district_id, district_name
                FROM districts
                WHERE district_name LIKE %s
                ORDER BY district_name
                LIMIT 20
                """,
                (like,)
            )

            results.extend(
                {
                    "type": "District",
                    "name": row["district_name"],
                    "district_id": row["district_id"],
                    "district_name": row["district_name"]
                }
                for row in cur.fetchall()
            )

            cur.execute(
                """
                SELECT
                    tp.place_name,
                    tp.district_id,
                    d.district_name
                FROM tourist_places tp
                INNER JOIN districts d
                    ON d.district_id = tp.district_id
                WHERE tp.place_name LIKE %s
                   OR tp.category LIKE %s
                   OR tp.description LIKE %s
                ORDER BY tp.place_name
                LIMIT 20
                """,
                (like, like, like)
            )

            results.extend(
                {
                    "type": "Tourist Place",
                    "name": row["place_name"],
                    "district_id": row["district_id"],
                    "district_name": row["district_name"]
                }
                for row in cur.fetchall()
            )

            cur.execute(
                """
                SELECT
                    hs.heritage_name,
                    hs.district_id,
                    d.district_name
                FROM heritage_sites hs
                INNER JOIN districts d
                    ON d.district_id = hs.district_id
                WHERE hs.heritage_name LIKE %s
                   OR hs.heritage_type LIKE %s
                   OR hs.history LIKE %s
                ORDER BY hs.heritage_name
                LIMIT 20
                """,
                (like, like, like)
            )

            results.extend(
                {
                    "type": "Heritage Site",
                    "name": row["heritage_name"],
                    "district_id": row["district_id"],
                    "district_name": row["district_name"]
                }
                for row in cur.fetchall()
            )

            cur.execute(
                """
                SELECT
                    r.restaurant_name,
                    r.district_id,
                    d.district_name
                FROM restaurants r
                LEFT JOIN districts d
                    ON d.district_id = r.district_id
                WHERE r.restaurant_name LIKE %s
                   OR r.cuisine_type LIKE %s
                   OR r.address LIKE %s
                ORDER BY r.restaurant_name
                LIMIT 20
                """,
                (like, like, like)
            )

            results.extend(
                {
                    "type": "Restaurant",
                    "name": row["restaurant_name"] or "Restaurant",
                    "district_id": row["district_id"],
                    "district_name": row["district_name"]
                }
                for row in cur.fetchall()
            )

            unique = []
            seen = set()

            for item in results:
                key = (
                    item["type"],
                    item["name"],
                    item["district_id"]
                )

                if key not in seen:
                    seen.add(key)
                    unique.append(item)

            if not unique:
                messagebox.showinfo(
                    "Search",
                    f'No results found for "{keyword}".'
                )
                return

            self._show_search_results(
                keyword,
                unique[:7]
            )

        except Exception as exc:
            logger.exception(
                "Tourism search failed for %r",
                keyword
            )

            messagebox.showerror(
                "Search Error",
                f"Unable to complete the search.\n\n{exc}"
            )

        finally:
            self._close_db(
                cur,
                con
            )

    def _show_search_results(self, keyword, results):
        self.clear()

        bg_canvas = self.page_background()

        # Enlarged and properly aligned glass panel container
        panel = self.create_glass_panel(
            bg_canvas,
            30,
            15,
            860,
            530
        )

        # Title positioned nicely at top-left
        panel.create_text(
            30,
            35,
            text=f'🔎 Search Results for "{keyword}"',
            font=("Georgia", 18, "bold"),
            fill="#23413D",
            anchor="w"
        )

        panel.create_text(
            30,
            62,
            text="Select a result to open its information.",
            font=("Arial", 10),
            fill="#23413D",
            anchor="w"
        )

        # Properly placed Back Button in top right corner inside card panel
        back_button = tk.Button(
            panel,
            text="← BACK",
            bg="#087F6B",
            fg="white",
            activebackground="#19A88F",
            activeforeground="white",
            bd=0,
            relief="flat",
            font=("Arial", 10, "bold"),
            cursor="hand2",
            command=self.show_home
        )

        panel.create_window(
            760, 35,
            window=back_button,
            width=100,
            height=34
        )

        # Uniform, full-width scrollable container frame for results
        container_frame = tk.Frame(
            panel,
            bg="#DCEAE6"
        )
        
        panel.create_window(
            430,
            300,
            window=container_frame,
            width=800,
            height=430
        )

        canvas = tk.Canvas(
            container_frame,
            bg="#DCEAE6",
            highlightthickness=0,
            bd=0
        )
        scrollbar = tk.Scrollbar(
            container_frame,
            orient="vertical",
            command=canvas.yview
        )

        results_inner = tk.Frame(
            canvas,
            bg="#DCEAE6"
        )

        results_inner.bind(
            "<Configure>",
            lambda _e: canvas.configure(scrollregion=canvas.bbox("all"))
        )

        canvas.create_window(
            (0, 0),
            window=results_inner,
            anchor="nw",
            width=780
        )

        canvas.configure(yscrollcommand=scrollbar.set)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        def scroll_search(event):
            canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")

        self.root.bind_all("<MouseWheel>", scroll_search)

        # Render symmetrical result cards
        for item in results:
            district_name = item.get(
                "district_name",
                item["name"]
            )

            card = tk.Frame(
                results_inner,
                bg="white",
                bd=1,
                relief="solid"
            )
            card.pack(
                fill="x",
                padx=5,
                pady=5
            )

            btn = tk.Button(
                card,
                text=(
                    f"📍 {item['name']}\n"
                    f"   {item['type']} • {district_name}"
                ),
                anchor="w",
                justify="left",
                padx=15,
                pady=10,
                bg="white",
                fg=self.green,
                activebackground="#DFF4EF",
                activeforeground=self.green,
                bd=0,
                relief="flat",
                font=("Arial", 11, "bold"),
                cursor="hand2",
                command=lambda result=item: self.open_district(result)
            )
            btn.pack(fill="both", expand=True)

    # =====================================================
    # BACKGROUND / GLASS
    # =====================================================

    def _image_path(
        self,
        filename,
        fallback="login_bg.jpg"
    ):
        path = os.path.join(
            IMAGE_DIR,
            filename
        )

        if os.path.isfile(path):
            return path

        return os.path.join(
            IMAGE_DIR,
            fallback
        )

    def _draw_background(
        self,
        canvas,
        filename,
        blur=0
    ):
        try:
            image = Image.open(
                self._image_path(filename)
            ).convert("RGB")

            image = image.resize(
                (1400, 630),
                Image.Resampling.LANCZOS
            )

            if blur:
                image = image.filter(
                    ImageFilter.GaussianBlur(blur)
                )

            photo = ImageTk.PhotoImage(image)

            self.home_bg_img = photo

            canvas.create_image(
                0,
                0,
                image=photo,
                anchor="nw"
            )

            return True

        except Exception as exc:
            logger.exception(
                "Unable to load background image: %s",
                exc
            )

            canvas.configure(
                bg=self.green
            )

            return False

    def page_background(self):
        canvas = tk.Canvas(
            self.content,
            highlightthickness=0,
            bd=0
        )

        canvas.pack(
            fill="both",
            expand=True
        )

        self._draw_background(
            canvas,
            "home_bg.jpg",
            blur=1.5
        )

        canvas.create_rectangle(
            0,
            0,
            1400,
            630,
            fill="#073B3A",
            stipple="gray50",
            outline=""
        )

        return canvas

    def create_glass_panel(
        self,
        parent,
        x,
        y,
        width,
        height
    ):
        try:
            bg = Image.open(
                self._image_path("home_bg.jpg")
            ).convert("RGB")

            bg = bg.resize(
                (1400, 630),
                Image.Resampling.LANCZOS
            )

            glass_part = bg.crop(
                (
                    x,
                    y,
                    x + width,
                    y + height
                )
            )

            glass_part = glass_part.filter(
                ImageFilter.GaussianBlur(12)
            )

            tint = Image.new(
                "RGB",
                glass_part.size,
                "#DCEAE6"
            )

            glass_part = Image.blend(
                glass_part,
                tint,
                0.45
            )

            glass = glass_part.convert(
                "RGBA"
            )

            mask = Image.new(
                "L",
                glass.size,
                0
            )

            ImageDraw.Draw(mask).rounded_rectangle(
                (
                    1,
                    1,
                    width - 2,
                    height - 2
                ),
                radius=28,
                fill=255
            )

            glass.putalpha(mask)

            draw = ImageDraw.Draw(glass)

            draw.rounded_rectangle(
                (
                    1,
                    1,
                    width - 2,
                    height - 2
                ),
                radius=28,
                outline=(255, 255, 255, 220),
                width=2
            )

            draw.rounded_rectangle(
                (
                    12,
                    12,
                    width - 12,
                    min(90, height - 12)
                ),
                radius=20,
                outline=(255, 255, 255, 90),
                width=1
            )

            panel = tk.Canvas(
                parent,
                width=width,
                height=height,
                highlightthickness=0,
                bd=0
            )

            panel.place(
                x=x,
                y=y
            )

            photo = ImageTk.PhotoImage(
                glass
            )

            if not hasattr(
                self,
                "glass_images"
            ):
                self.glass_images = []

            self.glass_images.append(
                photo
            )

            panel.create_image(
                0,
                0,
                image=photo,
                anchor="nw"
            )

            return panel

        except Exception as exc:
            logger.exception(
                "Unable to create glass panel: %s",
                exc
            )

            panel = tk.Canvas(
                parent,
                width=width,
                height=height,
                bg="#DCEAE6",
                highlightthickness=2,
                highlightbackground="white"
            )

            panel.place(
                x=x,
                y=y
            )

            return panel

    # =====================================================
    # DISTRICTS
    # =====================================================

    def show_districts(self):
        self.clear()

        bg_canvas = self.page_background()

        panel = self.create_glass_panel(
            bg_canvas,
            120,
            35,
            680,
            550
        )

        panel.create_text(
            340,
            45,
            text="📍 Tamil Nadu Districts",
            font=("Arial", 25, "bold"),
            fill="#23413D"
        )

        panel.create_text(
            340,
            82,
            text="Select a district to view details.",
            font=("Arial", 10),
            fill="#23413D"
        )

        con = cur = None

        try:
            con = get_connection()
            cur = con.cursor(
                dictionary=True
            )

            cur.execute(
                """
                SELECT district_id, district_name
                FROM districts
                ORDER BY district_name
                """
            )

            districts = cur.fetchall()

            start_y = 130
            columns = [
                80,
                225,
                370,
                515
            ]

            for i, district in enumerate(
                districts
            ):
                row, column = divmod(
                    i,
                    4
                )

                button = tk.Button(
                    panel,
                    text=district["district_name"],
                    bg="#DCEAE6",
                    fg="#23413D",
                    activebackground="#C9DDD7",
                    activeforeground="#23413D",
                    bd=1,
                    relief="solid",
                    font=("Arial", 9),
                    cursor="hand2",
                    command=lambda item=district: self.open_district(item)
                )

                panel.create_window(
                    columns[column],
                    start_y + row * 38,
                    window=button,
                    width=125,
                    height=34
                )

        except Exception as exc:
            logger.exception(
                "Unable to load districts"
            )

            messagebox.showerror(
                "Database Error",
                str(exc)
            )

        finally:
            self._close_db(
                cur,
                con
            )

    def open_district(self, district):
        self.clear()

        district_id = district["district_id"]

        canvas = tk.Canvas(
            self.content,
            bg=BG_COLOR,
            highlightthickness=0
        )

        scrollbar = tk.Scrollbar(
            self.content,
            orient="vertical",
            command=canvas.yview
        )

        page = tk.Frame(
            canvas,
            bg=BG_COLOR
        )

        page.bind(
            "<Configure>",
            lambda _event: canvas.configure(
                scrollregion=canvas.bbox("all")
            )
        )

        page_window = canvas.create_window(
            (0, 0),
            window=page,
            anchor="nw",
            width=880
        )

        def resize_page(event):
            canvas.itemconfigure(
                page_window,
                width=max(
                    event.width - 2,
                    880
                )
            )

        canvas.bind(
            "<Configure>",
            resize_page
        )

        canvas.configure(
            yscrollcommand=scrollbar.set
        )

        canvas.pack(
            side="left",
            fill="both",
            expand=True
        )

        scrollbar.pack(
            side="right",
            fill="y"
        )

        def scroll_page(event):
            canvas.yview_scroll(
                int(-1 * (event.delta / 120)),
                "units"
            )

        self.root.bind_all(
            "<MouseWheel>",
            scroll_page
        )

        header = tk.Frame(
            page,
            bg=self.green,
            height=120
        )

        header.pack(
            fill="x",
            padx=25,
            pady=(10, 5)
        )

        header.pack_propagate(False)

        tk.Label(
            header,
            text=f"🌴 {district['district_name']}",
            font=("Georgia", 28, "bold"),
            bg=self.green,
            fg="white"
        ).pack(
            pady=(18, 2)
        )

        tk.Label(
            header,
            text="Complete Tourism Information",
            font=("Arial", 12),
            bg=self.green,
            fg="white"
        ).pack()

        image_path = os.path.join(
            IMAGE_DIR,
            f"{district['district_name']}.jpg"
        )

        try:
            image = Image.open(
                image_path
            ).resize(
                (600, 300),
                Image.Resampling.LANCZOS
            )

            photo = ImageTk.PhotoImage(
                image
            )

            label = tk.Label(
                page,
                image=photo,
                bg=BG_COLOR
            )

            label.image = photo

            label.pack(
                pady=15
            )

        except Exception:
            logger.info(
                "District image not available: %s",
                image_path
            )

        con = cur = None

        try:
            con = get_connection()
            cur = con.cursor(
                dictionary=True
            )

            cur.execute(
                """
                SELECT *
                FROM districts
                WHERE district_id = %s
                """,
                (district_id,)
            )

            data = cur.fetchone()

            if data:
                self.add_section(
                    page,
                    "📍 DISTRICT INFORMATION"
                )

                self.add_info_box(
                    page,
                    f"District : {data['district_name']}\n\n"
                    f"Region : {data['region']}\n\n"
                    f"Headquarters : {data['headquarters']}\n\n"
                    f"Famous Places : {data['famous_places']}"
                )

            sections = [
                (
                    "📍 Tourist Places",
                    """
                    SELECT
                        place_name,
                        category,
                        description,
                        best_season,
                        rating
                    FROM tourist_places
                    WHERE district_id = %s
                    """,
                    lambda r: (
                        f"📍 {r['place_name']}\n"
                        f"Category : {r['category']}\n"
                        f"Description : {r['description']}\n"
                        f"Best Season : {r['best_season']}\n"
                        f"Rating : ⭐ {r['rating']}"
                    ),
                    "No Tourist Places Found."
                ),
                (
                    "🏛 Heritage Sites",
                    """
                    SELECT
                        heritage_name,
                        heritage_type,
                        history,
                        unesco_status
                    FROM heritage_sites
                    WHERE district_id = %s
                    """,
                    lambda r: (
                        f"🏛 {r['heritage_name']}\n"
                        f"Type : {r['heritage_type']}\n"
                        f"UNESCO : {r['unesco_status']}\n"
                        f"History : {r['history']}"
                    ),
                    "No Heritage Sites Found."
                ),
                (
                    "🛍 Handicrafts",
                    """
                    SELECT
                        craft_name,
                        craft_type,
                        material,
                        description
                    FROM handicrafts
                    WHERE district_id = %s
                    """,
                    lambda r: (
                        f"🛍 {r['craft_name']}\n"
                        f"Type : {r['craft_type']}\n"
                        f"Material : {r['material']}\n"
                        f"Description : {r['description']}"
                    ),
                    "No Handicrafts Found."
                ),
                (
                    "🏨 Hotels",
                    """
                    SELECT
                        hotel_name,
                        hotel_type,
                        star_rating,
                        address,
                        city,
                        phone,
                        price_per_night
                    FROM hotels
                    WHERE district_id = %s
                    """,
                    lambda r: (
                        f"🏨 {r['hotel_name']}\n"
                        f"Type : {r['hotel_type']}\n"
                        f"Rating : ⭐ {r['star_rating']}\n"
                        f"Address : {r['address']}\n"
                        f"City : {r['city']}\n"
                        f"Phone : {r['phone']}\n"
                        f"Price : ₹{r['price_per_night']} / night"
                    ),
                    "No Hotels Found."
                ),
                (
                    "🍽 Restaurants",
                    """
                    SELECT
                        restaurant_name,
                        cuisine_type,
                        address,
                        phone,
                        average_cost,
                        rating
                    FROM restaurants
                    WHERE district_id = %s
                    """,
                    lambda r: (
                        f"🍽 {r['restaurant_name']}\n"
                        f"Cuisine : {r['cuisine_type']}\n"
                        f"Address : {r['address']}\n"
                        f"Phone : {r['phone']}\n"
                        f"Average Cost : ₹{r['average_cost']}\n"
                        f"Rating : ⭐ {r['rating']}"
                    ),
                    "No Restaurants Found."
                ),
                (
                    "🚌 Transport",
                    """
                    SELECT
                        transport_type,
                        service_name,
                        source,
                        destination,
                        contact_number,
                        description
                    FROM transport
                    WHERE district_id = %s
                    """,
                    lambda r: (
                        f"🚌 {r['service_name']}\n"
                        f"Type : {r['transport_type']}\n"
                        f"From : {r['source']}\n"
                        f"To : {r['destination']}\n"
                        f"Contact : {r['contact_number']}\n"
                        f"Details : {r['description']}"
                    ),
                    "No Transport Information Found."
                ),
                (
                    "📅 Events",
                    """
                    SELECT
                        event_name,
                        event_type,
                        description,
                        event_date,
                        venue,
                        ticket_price
                    FROM events
                    WHERE district_id = %s
                    """,
                    lambda r: (
                        f"📅 {r['event_name']}\n"
                        f"Type : {r['event_type']}\n"
                        f"Date : {r['event_date']}\n"
                        f"Venue : {r['venue']}\n"
                        f"Ticket : ₹{r['ticket_price']}\n"
                        f"Description : {r['description']}"
                    ),
                    "No Events Found."
                )
            ]

            for title, query, formatter, empty_text in sections:
                self.add_section(
                    page,
                    title
                )

                cur.execute(
                    query,
                    (district_id,)
                )

                rows = cur.fetchall()

                if rows:
                    for row in rows:
                        self.add_info_box(
                            page,
                            formatter(row)
                        )
                else:
                    self.add_empty(
                        page,
                        empty_text
                    )

            self._add_gallery(
                page,
                cur,
                district_id
            )

            self._add_ai_recommendations(
                page,
                cur,
                district_id
            )

        except Exception as exc:
            logger.exception(
                "Unable to load district %s",
                district_id
            )

            messagebox.showerror(
                "Database Error",
                str(exc)
            )

        finally:
            self._close_db(
                cur,
                con
            )

        tk.Button(
            page,
            text="⬅ Back to Districts",
            width=22,
            height=2,
            bg=self.green,
            fg="white",
            font=("Arial", 11, "bold"),
            command=self.show_districts
        ).pack(
            pady=30
        )

    def _add_gallery(
        self,
        page,
        cur,
        district_id
    ):
        self.add_section(
            page,
            "🖼 Gallery"
        )

        cur.execute(
            """
            SELECT
                image_title,
                image_path,
                description
            FROM galleries
            WHERE district_id = %s
            """,
            (district_id,)
        )

        gallery = cur.fetchall()

        if not gallery:
            self.add_empty(
                page,
                "No Gallery Images Found."
            )
            return

        for item in gallery:
            image_path = os.path.join(
                BASE_DIR,
                item["image_path"]
            )

            if not os.path.isfile(image_path):
                logger.warning(
                    "Gallery image file not found: %s",
                    image_path
                )
                continue

            self.add_section(
                page,
                f"🖼 {item['image_title']}"
            )

            try:
                image = Image.open(
                    image_path
                ).resize(
                    (300, 165),
                    Image.Resampling.LANCZOS
                )

                photo = ImageTk.PhotoImage(
                    image
                )

                label = tk.Label(
                    page,
                    image=photo,
                    bg=BG_COLOR
                )

                label.image = photo

                label.pack(
                    pady=10
                )

                self.add_info_box(
                    page,
                    item["description"] or ""
                )

            except Exception:
                logger.exception(
                    "Unable to display gallery image: %s",
                    image_path
                )

    def _add_ai_recommendations(
        self,
        page,
        cur,
        district_id
    ):
        self.add_section(
            page,
            "🤖 AI Recommendation"
        )

        cur.execute(
            """
            SELECT
                recommendation_title,
                recommendation,
                travel_type,
                best_time_to_visit,
                estimated_budget
            FROM ai_recommendations
            WHERE district_id = %s
            """,
            (district_id,)
        )

        recommendations = cur.fetchall()

        if not recommendations:
            self.add_empty(
                page,
                "No AI Recommendations Found."
            )
            return

        for rec in recommendations:
            self.add_info_box(
                page,
                f"🤖 {rec['recommendation_title']}\n\n"
                f"Recommendation : {rec['recommendation']}\n\n"
                f"Travel Type : {rec['travel_type']}\n"
                f"Best Time : {rec['best_time_to_visit']}\n"
                f"Estimated Budget : {rec['estimated_budget']}"
            )

    # =====================================================
    # HELPERS
    # =====================================================

    @staticmethod
    def _close_db(cur, con):
        if cur:
            try:
                cur.close()
            except Exception:
                logger.exception(
                    "Unable to close database cursor"
                )

        if con:
            try:
                con.close()
            except Exception:
                logger.exception(
                    "Unable to close database connection"
                )

    @staticmethod
    def _style_option_menu(menu):
        menu.config(
            bg="#174E4B",
            fg="white",
            activebackground="#087F6B",
            activeforeground="white",
            font=("Arial", 11),
            bd=1,
            highlightthickness=1,
            highlightbackground="#8FF5DF"
        )

        menu["menu"].config(
            bg="#174E4B",
            fg="white",
            activebackground="#087F6B",
            activeforeground="white"
        )

    def add_section(
        self,
        parent,
        title
    ):
        tk.Label(
            parent,
            text=title,
            font=("Arial", 18, "bold"),
            bg=BG_COLOR,
            fg=self.green
        ).pack(
            anchor="w",
            padx=30,
            pady=(20, 8)
        )

    def add_info_box(
        self,
        parent,
        text
    ):
        box = tk.Frame(
            parent,
            bg="white",
            bd=1,
            relief="solid"
        )

        box.pack(
            fill="x",
            padx=30,
            pady=5
        )

        tk.Label(
            box,
            text=text,
            font=("Arial", 10),
            bg="white",
            justify="left",
            anchor="w",
            wraplength=780
        ).pack(
            fill="x",
            padx=15,
            pady=12
        )

    def add_empty(
        self,
        parent,
        text
    ):
        tk.Label(
            parent,
            text=text,
            font=("Arial", 10, "italic"),
            bg=BG_COLOR,
            fg="#777777"
        ).pack(
            anchor="w",
            padx=35,
            pady=5
        )

    def clear(self):
        self.root.unbind_all(
            "<MouseWheel>"
        )

        for widget in self.content.winfo_children():
            widget.destroy()

    def placeholder(self, name):
        tk.Label(
            self.content,
            text=name,
            font=("Arial", 27, "bold"),
            bg=BG_COLOR,
            fg=self.green
        ).pack(
            pady=100
        )

        tk.Label(
            self.content,
            text=f"{name} module will be connected here.",
            font=("Arial", 13),
            bg=BG_COLOR
        ).pack()

        tk.Button(
            self.content,
            text="⬅ Back to Home",
            command=self.show_home,
            bg=self.green,
            fg="white"
        ).pack(
            pady=25
        )

    # =====================================================
    # EMERGENCY CONTACTS
    # =====================================================

    def show_emergency_contacts(self):
        self.clear()

        bg_canvas = self.page_background()

        panel = self.create_glass_panel(
            bg_canvas,
            135,
            35,
            650,
            550
        )

        panel.create_text(
            325,
            45,
            text="🚨 Emergency Contacts",
            font=("Arial", 25, "bold"),
            fill="#23413D"
        )

        contacts = [
            ("🚓 Police", "100"),
            ("🚑 Ambulance", "108"),
            ("🚒 Fire & Rescue", "101"),
            ("📞 Emergency", "112"),
            ("👩 Women Helpline", "181"),
            ("👶 Child Helpline", "1098"),
            ("🛣 Road Accident Emergency", "1073")
        ]

        for i, (name, number) in enumerate(contacts):
            y = 105 + i * 55

            panel.create_text(
                45,
                y,
                text=name,
                anchor="w",
                font=("Arial", 13, "bold"),
                fill="#23413D"
            )

            panel.create_text(
                605,
                y,
                text=number,
                anchor="e",
                font=("Arial", 14, "bold"),
                fill="#B23A48"
            )

            panel.create_line(
                35,
                y + 22,
                615,
                y + 22,
                fill="white"
            )

    # =====================================================
    # AI RECOMMENDATION
    # =====================================================

    def show_ai_recommendation(self):
        self.clear()

        bg_canvas = self.page_background()

        panel = self.create_glass_panel(
            bg_canvas,
            135,
            20,
            650,
            585
        )

        panel.create_text(
            325,
            45,
            text="🤖 Tourist Recommendation",
            font=("Arial", 23, "bold"),
            fill="#23413D"
        )

        panel.create_text(
            325,
            100,
            text="Select Travel Type",
            font=("Arial", 12, "bold"),
            fill="#23413D"
        )

        travel_var = tk.StringVar()

        travel_box = tk.OptionMenu(
            panel,
            travel_var,
            "Family",
            "Friends",
            "Couple",
            "Solo"
        )

        self._style_option_menu(
            travel_box
        )

        panel.create_window(
            325,
            140,
            window=travel_box,
            width=190,
            height=35
        )

        panel.create_text(
            325,
            195,
            text="Select Interest",
            font=("Arial", 12, "bold"),
            fill="#23413D"
        )

        interest_var = tk.StringVar()

        interest_box = tk.OptionMenu(
            panel,
            interest_var,
            "Beach",
            "Heritage",
            "Nature",
            "Temple",
            "Food"
        )

        self._style_option_menu(
            interest_box
        )

        panel.create_window(
            325,
            235,
            window=interest_box,
            width=190,
            height=35
        )

        result = tk.Label(
            panel,
            text="",
            font=("Arial", 11),
            bg="#DCEAE6",
            fg="#23413D",
            justify="left",
            anchor="nw",
            padx=15,
            pady=12,
            wraplength=480,
            highlightbackground="white",
            highlightthickness=1
        )

        panel.create_window(
            325,
            360,
            window=result,
            width=520,
            height=170
        )

        def recommend():
            travel_type = travel_var.get().strip()
            interest = interest_var.get().strip()

            if not travel_type or not interest:
                result.config(
                    text="Please select both Travel Type and Interest."
                )
                return

            con = cur = None

            try:
                con = get_connection()

                cur = con.cursor(
                    dictionary=True
                )

                cur.execute(
                    """
                    SELECT
                        recommendation_title,
                        recommendation,
                        travel_type,
                        interest,
                        best_time_to_visit,
                        estimated_budget,
                        district_id
                    FROM ai_recommendations
                    WHERE travel_type = %s
                      AND interest = %s
                    ORDER BY recommendation_id
                    LIMIT 1
                    """,
                    (
                        travel_type,
                        interest
                    )
                )

                rec = cur.fetchone()

                if rec:
                    result.config(
                        text=(
                            f"🤖 {rec['recommendation_title']}\n\n"
                            f"{rec['recommendation']}\n\n"
                            f"Travel Type : {rec['travel_type']}\n"
                            f"Interest : {rec['interest']}\n"
                            f"Best Time : {rec['best_time_to_visit']}\n"
                            f"Estimated Budget : {rec['estimated_budget']}"
                        )
                    )

                else:
                    result.config(
                        text=(
                            "No recommendation found.\n\n"
                            f"Travel Type : {travel_type}\n"
                            f"Interest : {interest}"
                        )
                    )

            except Exception as exc:
                logger.exception(
                    "Unable to load recommendation"
                )

                messagebox.showerror(
                    "Database Error",
                    str(exc)
                )

            finally:
                self._close_db(
                    cur,
                    con
                )

        button = tk.Button(
            panel,
            text="🤖 Recommend",
            bg="#C9DDD7",
            fg="#23413D",
            activebackground="#B7D1C9",
            activeforeground="#23413D",
            font=("Arial", 12, "bold"),
            bd=1,
            relief="solid",
            cursor="hand2",
            command=recommend
        )

        panel.create_window(
            325,
            535,
            window=button,
            width=180,
            height=40
        )

    # =====================================================
    # LOGOUT
    # =====================================================

    def logout(self):
        if not messagebox.askyesno(
            "Logout",
            "Do you want to logout?"
        ):
            return

        try:
            login_path = os.path.join(
                BASE_DIR,
                "login.py"
            )

            subprocess.Popen(
                [
                    sys.executable,
                    login_path
                ],
                cwd=BASE_DIR
            )

            self.root.destroy()

        except Exception as exc:
            logger.exception(
                "Unable to start login screen"
            )

            messagebox.showerror(
                "Logout Error",
                str(exc)
            )


if __name__ == "__main__":
    root = tk.Tk()
    app = TourismApp(root)
    root.mainloop()