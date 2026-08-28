import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk, ImageFilter, ImageDraw, ImageEnhance

from db import get_connection
import app


# =========================================================
# WINDOW
# =========================================================

window = tk.Tk()
window.title("Tamil Nadu Tourism - Login")
window.geometry("1000x600")
window.resizable(True, True)

WHITE = "#FFFFFF"
TEAL = "#073B3A"
LIGHT_TEAL = "#19C7B0"

canvas = tk.Canvas(window, bd=0, highlightthickness=0)
canvas.pack(fill="both", expand=True)


# =========================================================
# BACKGROUND
# =========================================================

try:
    bg = Image.open("images/login_bg.jpg").convert("RGB")
except Exception:
    bg = Image.new("RGB", (1400, 900), TEAL)

bg = bg.resize((1400, 900), Image.Resampling.LANCZOS)
bg = ImageEnhance.Brightness(bg).enhance(1.0)

bg_img = ImageTk.PhotoImage(bg)
bg_id = canvas.create_image(0, 0, image=bg_img, anchor="nw")


# =========================================================
# LOGIN FUNCTION
# =========================================================

def login():
    email = email_entry.get().strip()
    password = password_entry.get().strip()

    if email == "Email":
        email = ""
    if password == "Password":
        password = ""

    if not email or not password:
        messagebox.showerror("Error", "Please enter Email and Password")
        return

    con = None
    cursor = None

    try:
        con = get_connection()
        cursor = con.cursor(dictionary=True)

        cursor.execute(
            "SELECT * FROM users WHERE email=%s AND password=%s",
            (email, password)
        )

        user = cursor.fetchone()

        if user:
            messagebox.showinfo("Success", "Login Successful")
            window.destroy()

            root = tk.Tk()
            app.TourismApp(root)
            root.mainloop()
        else:
            messagebox.showerror(
                "Login Failed",
                "Invalid Email or Password"
            )

    except Exception as e:
        messagebox.showerror("Database Error", str(e))

    finally:
        if cursor:
            cursor.close()
        if con:
            con.close()


# =========================================================
# PANEL SETTINGS
# =========================================================

PANEL_W = 400
PANEL_H = 530
FIELD_W = 310
FIELD_H = 50

panel_items = []


def add_item(item_id):
    panel_items.append(item_id)
    return item_id


# =========================================================
# PANEL POSITION
# =========================================================

window.update_idletasks()

panel_x = (canvas.winfo_width() - PANEL_W) // 2
panel_y = (canvas.winfo_height() - PANEL_H) // 2


# =========================================================
# GLASS PANEL
# =========================================================

glass_part = bg.crop(
    (
        (1400 - PANEL_W) // 2,
        (900 - PANEL_H) // 2,
        (1400 - PANEL_W) // 2 + PANEL_W,
        (900 - PANEL_H) // 2 + PANEL_H
    )
)

glass_part = glass_part.filter(ImageFilter.GaussianBlur(8))

glass_tint = Image.new(
    "RGB",
    (PANEL_W, PANEL_H),
    "#FFFFFF"
)

glass_part = Image.blend(
    glass_part,
    glass_tint,
    0.08
)

glass = glass_part.convert("RGBA")

mask = Image.new("L", (PANEL_W, PANEL_H), 0)
ImageDraw.Draw(mask).rounded_rectangle(
    (1, 1, PANEL_W - 2, PANEL_H - 2),
    radius=32,
    fill=255
)
glass.putalpha(mask)

glass_draw = ImageDraw.Draw(glass)

glass_draw.rounded_rectangle(
    (1, 1, PANEL_W - 2, PANEL_H - 2),
    radius=32,
    outline=(255, 255, 255, 220),
    width=2
)

glass_draw.rounded_rectangle(
    (12, 12, PANEL_W - 12, 95),
    radius=22,
    outline=(255, 255, 255, 90),
    width=1
)

glass_img = ImageTk.PhotoImage(glass)

add_item(canvas.create_image(
    panel_x,
    panel_y,
    image=glass_img,
    anchor="nw"
))


# =========================================================
# PANEL TEXT / LOGO
# =========================================================

def panel_text(x, y, text, font, fill=WHITE):
    return add_item(canvas.create_text(
        panel_x + x,
        panel_y + y,
        text=text,
        font=font,
        fill=fill
    ))


try:
    logo = Image.open("images/logo.png").convert("RGBA")
    logo = logo.resize((80, 80), Image.Resampling.LANCZOS)
    logo_img = ImageTk.PhotoImage(logo)

    add_item(canvas.create_image(
        panel_x + 200,
        panel_y + 65,
        image=logo_img,
        anchor="center"
    ))
except Exception:
    panel_text(200, 65, "🌴", ("Arial", 42))


panel_text(200, 125, "TAMIL NADU", ("Georgia", 27, "bold"))
panel_text(200, 160, "TOUR", ("Georgia", 17, "bold"), LIGHT_TEAL)
panel_text(200, 188, "Tourist Information", ("Arial", 10))


# =========================================================
# FIELD POSITIONS
# =========================================================

field_x = panel_x + 45
email_y = panel_y + 225
password_y = panel_y + 290
button_y = panel_y + 360
button_x = field_x


# =========================================================
# FIELD BORDER
# =========================================================

def draw_field(y):
    add_item(canvas.create_rectangle(
        field_x,
        y,
        field_x + FIELD_W,
        y + FIELD_H,
        outline=WHITE,
        width=1
    ))

    add_item(canvas.create_line(
        field_x + 12,
        y + 1,
        field_x + FIELD_W - 12,
        y + 1,
        fill=WHITE
    ))


draw_field(email_y)
draw_field(password_y)


# =========================================================
# EMAIL INPUT
# =========================================================

email_entry = tk.Entry(
    window,
    font=("Arial", 12),
    fg=WHITE,
    bg="#526D69",
    insertbackground=WHITE,
    relief="flat",
    bd=0,
    highlightthickness=0
)

email_entry.insert(0, "Email")


def email_focus_in(event):
    if email_entry.get() == "Email":
        email_entry.delete(0, tk.END)


def email_focus_out(event):
    if not email_entry.get().strip():
        email_entry.insert(0, "Email")


email_entry.bind("<FocusIn>", email_focus_in)
email_entry.bind("<FocusOut>", email_focus_out)


# =========================================================
# PASSWORD INPUT
# =========================================================

password_entry = tk.Entry(
    window,
    font=("Arial", 12),
    fg=WHITE,
    bg="#526D69",
    insertbackground=WHITE,
    relief="flat",
    bd=0,
    highlightthickness=0
)

password_entry.insert(0, "Password")


def password_focus_in(event):
    if password_entry.get() == "Password":
        password_entry.delete(0, tk.END)
        password_entry.config(show="•")


def password_focus_out(event):
    if not password_entry.get().strip():
        password_entry.config(show="")
        password_entry.insert(0, "Password")


password_entry.bind("<FocusIn>", password_focus_in)
password_entry.bind("<FocusOut>", password_focus_out)


# =========================================================
# LOGIN BUTTON
# =========================================================

add_item(canvas.create_rectangle(
    button_x,
    button_y,
    button_x + FIELD_W,
    button_y + FIELD_H,
    outline=WHITE,
    width=1
))

add_item(canvas.create_text(
    button_x + FIELD_W // 2,
    button_y + FIELD_H // 2,
    text="LOGIN",
    font=("Arial", 13, "bold"),
    fill=WHITE
))


# =========================================================
# QUOTE
# =========================================================

panel_text(
    200,
    445,
    "“Yathum oore yavarum kelir”",
    ("Georgia", 12, "italic")
)

panel_text(
    200,
    470,
    "Every place is my home; Every person is my kin.",
    ("Arial", 9)
)


# =========================================================
# CENTER PANEL + INPUTS
# =========================================================

last_x = panel_x
last_y = panel_y


def center_panel(event=None):
    global last_x, last_y
    global field_x, email_y, password_y, button_x, button_y

    width = canvas.winfo_width()
    height = canvas.winfo_height()

    if width <= 1 or height <= 1:
        return

    new_x = (width - PANEL_W) // 2
    new_y = (height - PANEL_H) // 2

    dx = new_x - last_x
    dy = new_y - last_y

    for item in panel_items:
        canvas.move(item, dx, dy)

    last_x = new_x
    last_y = new_y

    field_x = new_x + 45
    email_y = new_y + 225
    password_y = new_y + 290
    button_x = field_x
    button_y = new_y + 360

    email_entry.place(
        x=field_x + 20,
        y=email_y + 8,
        width=FIELD_W - 40,
        height=34
    )

    password_entry.place(
        x=field_x + 20,
        y=password_y + 8,
        width=FIELD_W - 40,
        height=34
    )


canvas.bind("<Configure>", center_panel)


# =========================================================
# MOUSE / KEYBOARD
# =========================================================

def mouse_click(event):
    if (
        button_x <= event.x <= button_x + FIELD_W
        and button_y <= event.y <= button_y + FIELD_H
    ):
        login()


def mouse_move(event):
    if (
        button_x <= event.x <= button_x + FIELD_W
        and button_y <= event.y <= button_y + FIELD_H
    ):
        canvas.config(cursor="hand2")
    else:
        canvas.config(cursor="arrow")


canvas.bind("<Button-1>", mouse_click)
canvas.bind("<Motion>", mouse_move)
window.bind("<Return>", lambda event: login())


# =========================================================
# START
# =========================================================

center_panel()
window.mainloop()
