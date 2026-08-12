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
window.resizable(False, False)


# =========================================================
# COLORS
# =========================================================

TEAL = "#073B3A"
LIGHT_TEAL = "#19C7B0"
WHITE = "#FFFFFF"


# =========================================================
# LOGIN DATA
# =========================================================

email_value = ""
password_value = ""

active_field = None


# =========================================================
# MYSQL LOGIN FUNCTION
# =========================================================

def login():

    global email_value
    global password_value

    email = email_value.strip()
    password = password_value.strip()

    if email == "" or password == "":
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
# BACKGROUND
# =========================================================

try:

    bg = Image.open(
        "images/login_bg.jpg"
    ).convert("RGB")

    bg = bg.resize(
        (1000, 600),
        Image.Resampling.LANCZOS
    )

except Exception:

    bg = Image.new(
        "RGB",
        (1000, 600),
        TEAL
    )


# Darken background

bg = ImageEnhance.Brightness(
    bg
).enhance(0.78)


# =========================================================
# CANVAS
# =========================================================

canvas = tk.Canvas(
    window,
    width=1000,
    height=600,
    bd=0,
    highlightthickness=0
)

canvas.pack(
    fill="both",
    expand=True
)


# =========================================================
# BACKGROUND IMAGE
# =========================================================

bg_img = ImageTk.PhotoImage(bg)

canvas.create_image(
    0,
    0,
    image=bg_img,
    anchor="nw"
)


# =========================================================
# GLASS PANEL
# =========================================================

panel_x = 300
panel_y = 35
panel_w = 400
panel_h = 530


glass_part = bg.crop(
    (
        panel_x,
        panel_y,
        panel_x + panel_w,
        panel_y + panel_h
    )
)

glass_part = glass_part.filter(
    ImageFilter.GaussianBlur(14)
)


glass_tint = Image.new(
    "RGB",
    (panel_w, panel_h),
    "#8FA9A3"
)


glass_part = Image.blend(
    glass_part,
    glass_tint,
    0.38
)


glass = glass_part.convert(
    "RGBA"
)


# =========================================================
# ROUNDED MASK
# =========================================================

mask = Image.new(
    "L",
    (panel_w, panel_h),
    0
)

mask_draw = ImageDraw.Draw(mask)

mask_draw.rounded_rectangle(
    (
        1,
        1,
        panel_w - 2,
        panel_h - 2
    ),
    radius=32,
    fill=255
)

glass.putalpha(mask)


# =========================================================
# GLASS BORDER
# =========================================================

glass_draw = ImageDraw.Draw(glass)

glass_draw.rounded_rectangle(
    (
        1,
        1,
        panel_w - 2,
        panel_h - 2
    ),
    radius=32,
    outline=(255, 255, 255, 220),
    width=2
)


# =========================================================
# GLASS HIGHLIGHT
# =========================================================

glass_draw.rounded_rectangle(
    (
        12,
        12,
        panel_w - 12,
        95
    ),
    radius=22,
    outline=(255, 255, 255, 90),
    width=1
)


glass_img = ImageTk.PhotoImage(
    glass
)

canvas.create_image(
    panel_x,
    panel_y,
    image=glass_img,
    anchor="nw"
)


# =========================================================
# LOGO
# =========================================================

try:

    logo = Image.open(
        "images/logo.png"
    ).convert("RGBA")

    logo = logo.resize(
        (80, 80),
        Image.Resampling.LANCZOS
    )

    logo_img = ImageTk.PhotoImage(
        logo
    )

    canvas.create_image(
        panel_x + 200,
        panel_y + 65,
        image=logo_img,
        anchor="center"
    )

except Exception:

    canvas.create_text(
        panel_x + 200,
        panel_y + 65,
        text="🌴",
        font=("Arial", 42),
        fill=WHITE
    )


# =========================================================
# TITLE
# =========================================================

canvas.create_text(
    panel_x + 200,
    panel_y + 125,
    text="TAMIL NADU",
    font=("Georgia", 27, "bold"),
    fill=WHITE
)

canvas.create_text(
    panel_x + 200,
    panel_y + 160,
    text="TOURISM",
    font=("Georgia", 17, "bold"),
    fill=LIGHT_TEAL
)

canvas.create_text(
    panel_x + 200,
    panel_y + 188,
    text="Tourist Information",
    font=("Arial", 10),
    fill=WHITE
)


# =========================================================
# FIELD POSITIONS
# =========================================================

field_x = panel_x + 45
field_w = 310
field_h = 50

email_y = panel_y + 225
password_y = panel_y + 290

button_y = panel_y + 360


# =========================================================
# GLASS FIELD FUNCTION
# =========================================================

def draw_glass_field(y):

    # Outer glass rectangle

    canvas.create_rectangle(
        field_x,
        y,
        field_x + field_w,
        y + field_h,
        outline="#FFFFFF",
        width=1,
        fill=""
    )

    # Inner soft highlight

    canvas.create_line(
        field_x + 12,
        y + 1,
        field_x + field_w - 12,
        y + 1,
        fill="#FFFFFF"
    )


# =========================================================
# EMAIL FIELD
# =========================================================

draw_glass_field(
    email_y
)


# Email placeholder

email_text_id = canvas.create_text(
    field_x + 20,
    email_y + field_h // 2,
    text="Email",
    anchor="w",
    font=("Arial", 12),
    fill="#FFFFFF"
)


# =========================================================
# PASSWORD FIELD
# =========================================================

draw_glass_field(
    password_y
)


password_text_id = canvas.create_text(
    field_x + 20,
    password_y + field_h // 2,
    text="Password",
    anchor="w",
    font=("Arial", 12),
    fill="#FFFFFF"
)


# =========================================================
# LOGIN BUTTON
# =========================================================

button_x = field_x


canvas.create_rectangle(
    button_x,
    button_y,
    button_x + field_w,
    button_y + field_h,
    outline="#FFFFFF",
    width=1
)


canvas.create_text(
    button_x + field_w // 2,
    button_y + field_h // 2,
    text="LOGIN",
    font=("Arial", 13, "bold"),
    fill=WHITE
)


# =========================================================
# QUOTE
# =========================================================

canvas.create_text(
    panel_x + 200,
    panel_y + 445,
    text="“Yathum oore yavarum kelir”",
    font=("Georgia", 12, "italic"),
    fill=WHITE
)

canvas.create_text(
    panel_x + 200,
    panel_y + 470,
    text="Every place is my home; Every person is my kin.",
    font=("Arial", 9),
    fill=WHITE
)


# =========================================================
# FIELD FOCUS
# =========================================================

def set_active(field):

    global active_field

    active_field = field

    if field == "email":

        canvas.itemconfig(
            email_text_id,
            fill=LIGHT_TEAL
        )

    else:

        canvas.itemconfig(
            password_text_id,
            fill=LIGHT_TEAL
        )


# =========================================================
# KEYBOARD INPUT
# =========================================================

def key_press(event):

    global email_value
    global password_value

    if active_field is None:
        return

    # ENTER

    if event.keysym == "Return":

        login()
        return

    # BACKSPACE

    if event.keysym == "BackSpace":

        if active_field == "email":

            email_value = email_value[:-1]

        else:

            password_value = password_value[:-1]

        update_fields()
        return

    # Ignore special keys

    if len(event.char) == 0:
        return

    # Normal character

    if active_field == "email":

        email_value += event.char

    else:

        password_value += event.char

    update_fields()


# =========================================================
# UPDATE FIELD TEXT
# =========================================================

def update_fields():

    # Email

    if email_value == "":

        canvas.itemconfig(
            email_text_id,
            text="Email"
        )

    else:

        canvas.itemconfig(
            email_text_id,
            text=email_value
        )


    # Password

    if password_value == "":

        canvas.itemconfig(
            password_text_id,
            text="Password"
        )

    else:

        canvas.itemconfig(
            password_text_id,
            text="•" * len(password_value)
        )


# =========================================================
# MOUSE CLICK
# =========================================================

def mouse_click(event):

    window.focus_force()
    canvas.focus_set()

    set_active(None)

    # Email

    if (
        field_x <= event.x <= field_x + field_w
        and
        email_y <= event.y <= email_y + field_h
    ):

        set_active("email")
        return


    # Password

    if (
        field_x <= event.x <= field_x + field_w
        and
        password_y <= event.y <= password_y + field_h
    ):

        set_active("password")
        return


    # Login button

    if (
        button_x <= event.x <= button_x + field_w
        and
        button_y <= event.y <= button_y + field_h
    ):

        login()


# =========================================================
# MOUSE MOVE
# =========================================================

def mouse_move(event):

    if (
        button_x <= event.x <= button_x + field_w
        and
        button_y <= event.y <= button_y + field_h
    ):

        canvas.configure(
            cursor="hand2"
        )

    else:

        canvas.configure(
            cursor="arrow"
        )


# =========================================================
# KEYBOARD BINDING
# =========================================================

window.bind(
    "<Key>",
    key_press
)

window.bind(
    "<Return>",
    lambda event: login()
)

window.bind(
    "<Button-1>",
    mouse_click
)

window.bind(
    "<Motion>",
    mouse_move
)


# =========================================================
# INITIAL FOCUS
# =========================================================

active_field = "email"

# Make the login window receive keyboard input.
window.focus_force()
canvas.focus_set()


# =========================================================
# START
# =========================================================

window.mainloop()
