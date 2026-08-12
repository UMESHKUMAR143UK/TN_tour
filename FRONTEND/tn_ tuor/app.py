import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk, ImageFilter,ImageDraw
from db import get_connection
import os

class TourismApp:

    def __init__(self, root):

        self.root = root
        self.root.title("Tamil Nadu Tourism - NEW VERSION")
        self.root.geometry("1200x700")
        self.root.configure(bg="#F5F7F8")

        self.green = "#073B3A"
        self.light = "#E8F5F0"

        self.header()
        self.sidebar()

        self.content = tk.Frame(
        self.root,
        bg="#F5F7F8"
        )

        self.content.place(
        x=280,
        y=70,
        width=1200,
        height=630
        )

        self.show_home()


    # ==============================
    # HEADER
    # ==============================

    def header(self):

        self.header_frame = tk.Frame(
            self.root,
            bg=self.green
        )
        self.header_frame.place(
            x=0, y=0,
            width=1200, height=70
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
            x=10, y=10,
            width=40, height=40
        )

        tk.Label(
            self.header_frame,
            text="TAMIL NADU",
            font=("Georgia", 20, "bold"),
            bg=self.green,
            fg="white"
        ).place(x=70, y=10)

        tk.Label(
            self.header_frame,
            text="Tourist Information & AI Recommendation",
            font=("Arial", 10),
            bg=self.green,
            fg="white"
        ).place(x=72, y=42)


    # ==============================
    # SIDEBAR
    # ==============================

    def sidebar(self):

        self.sidebar_open = True

        self.sidebar_frame = tk.Frame(
            self.root,
            bg=self.green
        )
        self.sidebar_frame.place(
            x=0, y=70,
            width=280, height=630
        )

        self.sidebar_close_button = tk.Button(
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
        )
        self.sidebar_close_button.place(
            x=238, y=8,
            width=32, height=30
        )

        pages=[
            ("🏠", "Home"),
            ("📍", "District Details"),
            ("🚨", "Emergency Contacts"),
            ("🤖", "AI Recommendation")
        ]

        self.sidebar_buttons=[]

        for i,(icon,name) in enumerate(pages):
            btn=tk.Button(
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
                font=("Arial",10,"bold"),
                cursor="hand2",
                command=lambda p=name:self.open_page(p)
            )
            btn.place(
                x=10,
                y=50+i*42,
                width=255,
                height=35
            )
            self.sidebar_buttons.append((btn,icon,name))

        self.logout_button=tk.Button(
            self.sidebar_frame,
            text="🚪  Logout",
            bg="#087F5B",
            fg="white",
            activebackground="#19A88F",
            activeforeground="white",
            bd=0,
            relief="flat",
            font=("Arial",10,"bold"),
            cursor="hand2",
            command=self.logout
        )
        self.logout_button.place(
            x=10,y=575,
            width=255,height=35
        )

    def toggle_sidebar(self):

        if self.sidebar_open:
            self.sidebar_open=False
            self.sidebar_frame.place_forget()
            self.content.place(
                x=0,y=70,
                width=1200,height=630
            )
            self.menu_button.config(text="☰")
            self.menu_button.lift()
        else:
            self.sidebar_open=True
            self.sidebar_frame.place(
                x=0,y=70,
                width=280,height=630
            )
            self.content.place(
                x=280,y=70,
                width=920,height=630
            )
            self.menu_button.config(text="☰")
            self.sidebar_frame.lift()
            self.menu_button.lift()

    def open_page(self, page):

        self.clear()

        if page == "Home":
            self.show_home()

        elif page == "District Details":
            self.show_districts()

        elif page == "Emergency Contacts":
            self.show_emergency_contacts()

        elif page == "AI Recommendation":
            self.show_ai_recommendation()

        else:
            self.placeholder(page)


    # ==============================
    # HOME
    # ==============================

    def show_home(self):

        self.clear()

        # ==========================================
        # HOME CANVAS
        # ==========================================

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

        # ==========================================
        # BACKGROUND IMAGE
        # ==========================================

        try:

            home_bg_path = "images/home_bg.jpg"

            # If home_bg.jpg does not exist,
            # use the existing login background.
            if not os.path.isfile(home_bg_path):
                home_bg_path = "images/login_bg.jpg"

            home_bg = Image.open(
                home_bg_path
            ).convert("RGB")

            home_bg = home_bg.resize(
                (1200, 630),
                Image.Resampling.LANCZOS
            )

            home_bg = home_bg.filter(
                ImageFilter.GaussianBlur(2)
            )

            self.home_bg_img = ImageTk.PhotoImage(
                home_bg
            )

            canvas.create_image(
                0,
                0,
                image=self.home_bg_img,
                anchor="nw"
            )

        except Exception:

            canvas.configure(
                bg=self.green
            )

        # ==========================================
        # DARK APPLICATION OVERLAY
        # ==========================================

        canvas.create_rectangle(
            0,
            0,
            1200,
            630,
            fill="#073B3A",
            stipple="gray50",
            outline=""
        )

        # ==========================================
        # WELCOME
        # ==========================================

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

        # ==========================================
        # QUOTE
        # ==========================================

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

        # ==========================================
        # SEARCH BAR
        # ==========================================

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
        search_entry.insert(0, placeholder)

        def clear_placeholder(event):
            if search_entry.get() == placeholder:
                search_entry.delete(0, tk.END)

        def restore_placeholder(event):
            if not search_entry.get().strip():
                search_entry.insert(0, placeholder)

        search_entry.bind("<FocusIn>", clear_placeholder)
        search_entry.bind("<FocusOut>", restore_placeholder)
        search_entry.bind(
            "<Return>",
            lambda event: self.search_tourism(search_entry.get().strip())
        )

        search_button = tk.Button(
            search_frame,
            text="SEARCH",
            font=("Arial", 10, "bold"),
            bg="#087F6B",
            fg="white",
            activebackground="#19A88F",
            activeforeground="white",
            bd=0,
            cursor="hand2",
            command=lambda: self.search_tourism(search_entry.get().strip())
        )

        search_button.pack(
            side="right",
            fill="y",
            padx=5,
            pady=5
        )

        # ==========================================
        # SECTION TITLE
        # ==========================================

        canvas.create_text(
            460,
            265,
            text="Tamil Nadu Travel Essentials",
            font=("Georgia", 21, "bold"),
            fill="white"
        )

        # ==========================================
        # FEATURE CARDS
        # ==========================================

        items = [
            ("🌤", "BEST TIME", "October – March"),
            ("🍛", "TAMIL CUISINE", "Try authentic local food"),
            ("🛕", "MUST VISIT", "Temples • Beaches • Hills"),
            ("🧭", "TRAVEL TIP", "Plan your trip by district")
        ]

        card_x_positions = [0.04, 0.28, 0.52, 0.76]

        for (icon, title, description), x in zip(
            items,
            card_x_positions
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

        # ==========================================
        # TAMIL CULTURE SECTION
        # ==========================================

        culture = tk.Frame(
            self.content,
            bg="#073B3A",
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
            bg="#073B3A",
            fg="#8FF5DF"
        ).pack(
            pady=(16, 7)
        )

        tk.Label(
            culture,
            text=(
                "Explore traditional food, temples, festivals, "
                "arts, music and the unique culture of Tamil Nadu."
            ),
            font=("Arial", 10),
            bg="#073B3A",
            fg="white"
        ).pack()

        tk.Label(
            culture,
            text="🤖 AI Recommendation is available from the sidebar.",
            font=("Arial", 9, "italic"),
            bg="#073B3A",
            fg="#D8FFF7"
        ).pack(
            pady=6
        )



    # ==============================
    # DISTRICTS
    # ==============================

    # ==============================
    # SEARCH TOURISM
    # ==============================

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

        con = None
        cur = None

        try:
            con = get_connection()
            cur = con.cursor(dictionary=True)

            results = []

            # ======================================
            # 1. DISTRICTS
            # ======================================

            cur.execute(
                """
                SELECT district_id, district_name
                FROM districts
                WHERE district_name LIKE %s
                ORDER BY district_name LIMIT 20
                """,
                (f"%{keyword}%",)
            )

            for row in cur.fetchall():
                results.append({
                    "type": "District",
                    "name": row["district_name"],
                    "district_id": row["district_id"]
                })

            # ======================================
            # 2. TOURIST PLACES
            # ======================================

            cur.execute(
                """
                SELECT tp.place_id,
                       tp.place_name,
                       tp.district_id,
                       d.district_name
                FROM tourist_places tp
                         INNER JOIN districts d
                                    ON d.district_id = tp.district_id
                WHERE tp.place_name LIKE %s
                   OR tp.category LIKE %s
                   OR tp.description LIKE %s
                ORDER BY tp.place_name LIMIT 20
                """,
                (
                    f"%{keyword}%",
                    f"%{keyword}%",
                    f"%{keyword}%"
                )
            )

            for row in cur.fetchall():
                results.append({
                    "type": "Tourist Place",
                    "name": row["place_name"],
                    "district_id": row["district_id"],
                    "district_name": row["district_name"]
                })

            # ======================================
            # 3. HERITAGE SITES
            # ======================================

            cur.execute(
                """
                SELECT hs.heritage_id,
                       hs.heritage_name,
                       hs.district_id,
                       d.district_name
                FROM heritage_sites hs
                         INNER JOIN districts d
                                    ON d.district_id = hs.district_id
                WHERE hs.heritage_name LIKE %s
                   OR hs.heritage_type LIKE %s
                   OR hs.history LIKE %s
                ORDER BY hs.heritage_name LIMIT 20
                """,
                (
                    f"%{keyword}%",
                    f"%{keyword}%",
                    f"%{keyword}%"
                )
            )

            for row in cur.fetchall():
                results.append({
                    "type": "Heritage Site",
                    "name": row["heritage_name"],
                    "district_id": row["district_id"],
                    "district_name": row["district_name"]
                })

            # ======================================
            # 4. RESTAURANTS
            # ======================================

            cur.execute(
                """
                SELECT r.restaurant_id,
                       r.restaurant_name,
                       r.cuisine_type,
                       r.district_id,
                       d.district_name
                FROM restaurants r
                         LEFT JOIN districts d
                                   ON d.district_id = r.district_id
                WHERE r.restaurant_name LIKE %s
                   OR r.cuisine_type LIKE %s
                   OR r.address LIKE %s
                ORDER BY r.restaurant_name LIMIT 20
                """,
                (
                    f"%{keyword}%",
                    f"%{keyword}%",
                    f"%{keyword}%"
                )
            )

            for row in cur.fetchall():
                results.append({
                    "type": "Restaurant",
                    "name": row["restaurant_name"] or "Restaurant",
                    "district_id": row["district_id"],
                    "district_name": row["district_name"]
                })

            # ======================================
            # REMOVE DUPLICATES
            # ======================================

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

            results = unique

            # ======================================
            # NO RESULTS
            # ======================================

            if not results:
                messagebox.showinfo(
                    "Search",
                    f'No results found for "{keyword}".'
                )

                return

            # ======================================
            # SHOW RESULTS IN SAME PAGE
            # ======================================

            self.clear()

            bg_canvas = self.page_background()

            # ======================================
            # GLASS SEARCH PANEL
            # ======================================

            panel = self.create_glass_panel(
                bg_canvas,
                100,
                25,
                720,
                580
            )

            # PAGE TITLE
            panel.create_text(
                360,
                45,
                text=f'🔎 Search Results for "{keyword}"',
                font=("Georgia", 21, "bold"),
                fill="#23413D"
            )

            panel.create_text(
                360,
                82,
                text="Select a result to open its information.",
                font=("Arial", 10),
                fill="#23413D"
            )

            tk.Label(
                bg_canvas,
                text="Select a result to open its information.",
                font=("Arial", 11),
                bg="#E7EFEC",
                fg="#555555"
            ).pack(pady=(0, 15))

            tk.Button(
                bg_canvas,
                text="← BACK",
                bg="#087F6B",
                fg="white",
                activebackground="#19A88F",
                activeforeground="white",
                bd=0,
                font=("Arial", 10, "bold"),
                cursor="hand2",
                command=self.show_home
            ).pack(
                pady=(0, 10),
                ipadx=20,
                ipady=5
            )

            # ======================================
            # SEARCH RESULT AREA
            # ======================================

            results_frame = tk.Frame(
                panel,
                bg="#8FA9A3",
                padx=15,
                pady=10
            )

            results_frame.pack(
                fill="both",
                expand=True,
                padx=35,
                pady=(10, 20)
            )

            # ======================================
            # SEARCH RESULTS - NO SCROLLBAR
            # ======================================

            inner = tk.Frame(
                results_frame,
                bg="#E7EFEC"
            )

            inner.pack(
                fill="both",
                expand=True,
                padx=10,
                pady=10
            )

            # ======================================
            # OPEN RESULT
            # ======================================

            def open_result(item):

                cur.execute(
                    """
                    SELECT district_id, district_name
                    FROM districts
                    WHERE district_id = %s
                    """,
                    (item["district_id"],)
                )

                district = cur.fetchone()

                if district:

                    self.open_district(district)

                else:

                    messagebox.showerror(
                        "Search",
                        "District information was not found."
                    )

            # ======================================
            # RESULT BUTTONS
            # ======================================

            for item in results[:7]:
                district_name = item.get(
                    "district_name",
                    item["name"]
                )

                button = tk.Button(
                    inner,
                    text=(
                        f'📍 {item["name"]}\n'
                        f'   {item["type"]} • {district_name}'
                    ),
                    anchor="w",
                    justify="left",
                    padx=15,
                    pady=10,
                    bg="white",
                    fg=self.green,
                    activebackground="#DFF4EF",
                    activeforeground=self.green,
                    bd=1,
                    relief="solid",
                    font=("Arial", 11, "bold"),
                    cursor="hand2",
                    command=lambda item=item: open_result(item)
                )

                button.pack(
                    fill="x",
                    pady=5
                )

        except Exception as e:

            messagebox.showerror(
                "Search Error",
                f"Unable to complete the search.\n\n{e}"
            )

        finally:

            try:
                if cur:
                    cur.close()
            except Exception:
                pass

            try:
                if con:
                    con.close()
            except Exception:
                pass

    def page_background(self):
        """Create the same tourism background used on the Home page."""

        canvas = tk.Canvas(
            self.content,
            highlightthickness=0,
            bd=0
        )
        canvas.pack(fill="both", expand=True)

        try:
            bg_path = "images/home_bg.jpg"

            if not os.path.isfile(bg_path):
                bg_path = "images/login_bg.jpg"

            bg = Image.open(bg_path).convert("RGB")

            bg = bg.resize(
                (1200, 630),
                Image.Resampling.LANCZOS
            )

            bg = bg.filter(
                ImageFilter.GaussianBlur(1.5)
            )

            self.page_bg_img = ImageTk.PhotoImage(bg)

            canvas.create_image(
                0,
                0,
                image=self.page_bg_img,
                anchor="nw"
            )

            # Slight dark tourism overlay
            canvas.create_rectangle(
                0,
                0,
                1200,
                630,
                fill="#073B3A",
                stipple="gray50",
                outline=""
            )

        except Exception:
            canvas.configure(bg=self.green)

        return canvas

    # ==========================================
    # GLASS PANEL
    # ==========================================

    def create_glass_panel(
            self,
            parent,
            x,
            y,
            width,
            height
    ):

        try:

            # ==================================
            # LOAD SAME TOURISM BACKGROUND
            # ==================================

            bg_path = "images/home_bg.jpg"

            if not os.path.isfile(bg_path):
                bg_path = "images/login_bg.jpg"

            bg = Image.open(
                bg_path
            ).convert("RGB")

            bg = bg.resize(
                (1200, 630),
                Image.Resampling.LANCZOS
            )

            # ==================================
            # CROP AREA BEHIND GLASS PANEL
            # ==================================

            glass_part = bg.crop(
                (
                    x,
                    y,
                    x + width,
                    y + height
                )
            )

            # ==================================
            # BLUR
            # ==================================

            glass_part = glass_part.filter(
                ImageFilter.GaussianBlur(12)
            )

            # ==================================
            # GLASS TINT
            # ==================================

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

            # ==================================
            # CONVERT TO RGBA
            # ==================================

            glass = glass_part.convert(
                "RGBA"
            )

            # ==================================
            # ROUNDED CORNERS
            # ==================================

            mask = Image.new(
                "L",
                glass.size,
                0
            )

            draw = ImageDraw.Draw(mask)

            draw.rounded_rectangle(
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

            # ==================================
            # WHITE GLASS BORDER
            # ==================================

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

            # ==================================
            # HIGHLIGHT
            # ==================================

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

            # ==================================
            # PANEL CANVAS
            # ==================================

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

            # ==================================
            # KEEP IMAGE IN MEMORY
            # ==================================

            glass_img = ImageTk.PhotoImage(
                glass
            )

            if not hasattr(
                self,
                "glass_images"
            ):
                self.glass_images = []

            self.glass_images.append(
                glass_img
            )

            # ==================================
            # SHOW GLASS IMAGE
            # ==================================

            panel.create_image(
                0,
                0,
                image=glass_img,
                anchor="nw"
            )

            return panel

        except Exception as e:

            # Fallback if image processing fails

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

    def show_districts(self):

        self.clear()

        bg_canvas = self.page_background()

        # ==========================================
        # GLASS PANEL
        # ==========================================

        panel = self.create_glass_panel(
            bg_canvas,
            120,
            35,
            680,
            550
        )

        # ==========================================
        # TITLE
        # ==========================================

        panel.create_text(
            340,
            45,
            text='🔎 Search Results for',
            font=("Arial", 25, "bold"),
            fill="#23413D"
        )

        panel.create_text(
            340,
            82,
            text="Select a result to open its information.",
            font=("Arial", 10),
            fill="#23413D"
        )

        # ==========================================
        # DATABASE
        # ==========================================

        try:

            con = get_connection()

            cur = con.cursor(
                dictionary=True
            )

            cur.execute(
                "SELECT district_id, district_name "
                "FROM districts "
                "ORDER BY district_name"
            )

            districts = cur.fetchall()

            cur.close()
            con.close()

            # ======================================
            # DISTRICT BUTTONS
            # ======================================

            start_y = 105

            button_width = 125
            button_height = 34

            column_x = [
                80,
                225,
                370,
                515
            ]

            for i, district in enumerate(districts):
                row = i // 4
                column = i % 4

                x = column_x[column]

                y = start_y + (
                        row * 38
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

                    command=lambda d=district:
                    self.open_district(d)
                )

                panel.create_window(
                    x,
                    y,
                    window=button,
                    width=button_width,
                    height=button_height
                )

        except Exception as e:

            messagebox.showerror(
                "Database Error",
                str(e)
            )

    # ==============================
    # COMPLETE DISTRICT PAGE
    # ==============================

    def open_district(self, district):

        self.clear()

        district_id = district["district_id"]

        # ==========================================
        # SCROLLABLE DISTRICT PAGE
        # ==========================================

        canvas = tk.Canvas(
            self.content,
            bg="#F5F7F8",
            highlightthickness=0
        )

        scrollbar = tk.Scrollbar(
            self.content,
            orient="vertical",
            command=canvas.yview
        )

        page = tk.Frame(
            canvas,
            bg="#F5F7F8"
        )

        page.bind(
            "<Configure>",
            lambda e: canvas.configure(
                scrollregion=canvas.bbox("all")
            )
        )

        canvas.create_window(
            (0, 0),
            window=page,
            anchor="nw",
            width=880
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

        # Mouse wheel
        canvas.bind_all(
            "<MouseWheel>",
            lambda event: canvas.yview_scroll(
                int(-1 * (event.delta / 120)),
                "units"
            )
        )

        # ==========================================
        # DISTRICT HEADER
        # ==========================================

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
        ).pack(pady=(18, 2))

        tk.Label(
            header,
            text="Complete Tourism Information",
            font=("Arial", 12),
            bg=self.green,
            fg="white"
        ).pack()

        # ==========================================
        # DISTRICT IMAGE
        # ==========================================

        try:

            image_path = f"images/{district['district_name']}.jpg"

            image = Image.open(image_path)
            image = image.resize((600, 300))

            district_img = ImageTk.PhotoImage(image)

            image_label = tk.Label(
                page,
                image=district_img,
                bg="#F5F7F8"
            )

            image_label.image = district_img

            image_label.pack(
                pady=15
            )

        except Exception:
            pass

        # ==========================================
        # DATABASE
        # ==========================================

        try:

            con = get_connection()
            cur = con.cursor(dictionary=True)

            # ======================================
            # DISTRICT INFORMATION
            # ======================================

            cur.execute("""
                        SELECT *
                        FROM districts
                        WHERE district_id = %s
                        """, (district_id,))

            data = cur.fetchone()

            if data:
                self.add_section(
                    page,
                    "📍 DISTRICT INFORMATION"
                )

                info = (
                    f"District : {data['district_name']}\n\n"
                    f"Region : {data['region']}\n\n"
                    f"Headquarters : {data['headquarters']}\n\n"
                    f"Famous Places : {data['famous_places']}"
                )

                self.add_info_box(
                    page,
                    info
                )

            # ======================================
            # TOURIST PLACES
            # ======================================

            self.add_section(
                page,
                "📍 Tourist Places"
            )

            cur.execute("""
                        SELECT place_name,
                               category,
                               description,
                               best_season,
                               rating
                        FROM tourist_places
                        WHERE district_id = %s
                        """, (district_id,))

            places = cur.fetchall()

            if places:

                for place in places:
                    text = (
                        f"📍 {place['place_name']}\n"
                        f"Category : {place['category']}\n"
                        f"Description : {place['description']}\n"
                        f"Best Season : {place['best_season']}\n"
                        f"Rating : ⭐ {place['rating']}"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No Tourist Places Found."
                )

            # ======================================
            # HERITAGE
            # ======================================

            self.add_section(
                page,
                "🏛 Heritage Sites"
            )

            cur.execute("""
                        SELECT heritage_name,
                               heritage_type,
                               history,
                               unesco_status
                        FROM heritage_sites
                        WHERE district_id = %s
                        """, (district_id,))

            heritage = cur.fetchall()

            if heritage:

                for item in heritage:
                    text = (
                        f"🏛 {item['heritage_name']}\n"
                        f"Type : {item['heritage_type']}\n"
                        f"UNESCO : {item['unesco_status']}\n"
                        f"History : {item['history']}"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No Heritage Sites Found."
                )

            # ======================================
            # HANDICRAFTS
            # ======================================

            self.add_section(
                page,
                "🛍 Handicrafts"
            )

            cur.execute("""
                        SELECT craft_name,
                               craft_type,
                               material,
                               description
                        FROM handicrafts
                        WHERE district_id = %s
                        """, (district_id,))

            crafts = cur.fetchall()

            if crafts:

                for craft in crafts:
                    text = (
                        f"🛍 {craft['craft_name']}\n"
                        f"Type : {craft['craft_type']}\n"
                        f"Material : {craft['material']}\n"
                        f"Description : {craft['description']}"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No Handicrafts Found."
                )

            # ======================================
            # HOTELS
            # ======================================

            self.add_section(
                page,
                "🏨 Hotels"
            )

            cur.execute("""
                        SELECT hotel_name,
                               hotel_type,
                               star_rating,
                               address,
                               city,
                               phone,
                               price_per_night
                        FROM hotels
                        WHERE district_id = %s
                        """, (district_id,))

            hotels = cur.fetchall()

            if hotels:

                for hotel in hotels:
                    text = (
                        f"🏨 {hotel['hotel_name']}\n"
                        f"Type : {hotel['hotel_type']}\n"
                        f"Rating : ⭐ {hotel['star_rating']}\n"
                        f"Address : {hotel['address']}\n"
                        f"City : {hotel['city']}\n"
                        f"Phone : {hotel['phone']}\n"
                        f"Price : ₹{hotel['price_per_night']} / night"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No Hotels Found."
                )

            # ======================================
            # RESTAURANTS
            # ======================================

            self.add_section(
                page,
                "🍽 Restaurants"
            )

            cur.execute("""
                        SELECT restaurant_name,
                               cuisine_type,
                               address,
                               phone,
                               average_cost,
                               rating
                        FROM restaurants
                        WHERE district_id = %s
                        """, (district_id,))

            restaurants = cur.fetchall()

            if restaurants:

                for restaurant in restaurants:
                    text = (
                        f"🍽 {restaurant['restaurant_name']}\n"
                        f"Cuisine : {restaurant['cuisine_type']}\n"
                        f"Address : {restaurant['address']}\n"
                        f"Phone : {restaurant['phone']}\n"
                        f"Average Cost : ₹{restaurant['average_cost']}\n"
                        f"Rating : ⭐ {restaurant['rating']}"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No Restaurants Found."
                )

            # ======================================
            # TRANSPORT
            # ======================================

            self.add_section(
                page,
                "🚌 Transport"
            )

            cur.execute("""
                        SELECT transport_type,
                               service_name,
                               source,
                               destination,
                               contact_number,
                               description
                        FROM transport
                        WHERE district_id = %s
                        """, (district_id,))

            transports = cur.fetchall()

            if transports:

                for transport in transports:
                    text = (
                        f"🚌 {transport['service_name']}\n"
                        f"Type : {transport['transport_type']}\n"
                        f"From : {transport['source']}\n"
                        f"To : {transport['destination']}\n"
                        f"Contact : {transport['contact_number']}\n"
                        f"Details : {transport['description']}"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No Transport Information Found."
                )

            # ======================================
            # EVENTS
            # ======================================

            self.add_section(
                page,
                "📅 Events"
            )

            cur.execute("""
                        SELECT event_name,
                               event_type,
                               description,
                               event_date,
                               venue,
                               ticket_price
                        FROM events
                        WHERE district_id = %s
                        """, (district_id,))

            events = cur.fetchall()

            if events:

                for event in events:
                    text = (
                        f"📅 {event['event_name']}\n"
                        f"Type : {event['event_type']}\n"
                        f"Date : {event['event_date']}\n"
                        f"Venue : {event['venue']}\n"
                        f"Ticket : ₹{event['ticket_price']}\n"
                        f"Description : {event['description']}"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No Events Found."
                )

            # ======================================
            # GALLERY
            # ======================================

            self.add_section(
                page,
                "🖼 Gallery"
            )

            cur.execute("""
                        SELECT image_title,
                               image_path,
                               description
                        FROM galleries
                        WHERE district_id = %s
                        """, (district_id,))

            gallery = cur.fetchall()

            if gallery:

                for image in gallery:

                    # --------------------------------------
                    # CHECK IMAGE PATH
                    # --------------------------------------

                    image_path = os.path.join(
                        os.path.dirname(os.path.abspath(__file__)),
                        image["image_path"]
                    )

                    # If image does not exist, skip everything
                    if not os.path.isfile(image_path):
                        continue

                    # --------------------------------------
                    # SHOW TITLE
                    # --------------------------------------

                    self.add_section(
                        page,
                        f"🖼 {image['image_title']}"
                    )

                    # --------------------------------------
                    # SHOW IMAGE
                    # --------------------------------------

                    try:

                        gallery_image = Image.open(image_path)

                        gallery_image = gallery_image.resize(
                            (300, 165)
                        )

                        gallery_photo = ImageTk.PhotoImage(
                            gallery_image
                        )

                        image_label = tk.Label(
                            page,
                            image=gallery_photo,
                            bg="#F5F7F8"
                        )

                        image_label.image = gallery_photo

                        image_label.pack(
                            pady=10
                        )

                        # --------------------------------------
                        # SHOW DESCRIPTION
                        # --------------------------------------

                        self.add_info_box(
                            page,
                            image["description"] or ""
                        )

                    except Exception:
                        # If image cannot be opened, show nothing
                        continue

            else:

                self.add_empty(
                    page,
                    "No Gallery Images Found."
                )

            # ======================================
            # AI RECOMMENDATION
            # ======================================

            self.add_section(
                page,
                "🤖 AI Recommendation"
            )

            cur.execute("""
                        SELECT recommendation_title,
                               recommendation,
                               travel_type,
                               best_time_to_visit,
                               estimated_budget
                        FROM ai_recommendations
                        WHERE district_id = %s
                        """, (district_id,))

            recommendations = cur.fetchall()

            if recommendations:

                for rec in recommendations:
                    text = (
                        f"🤖 {rec['recommendation_title']}\n\n"
                        f"Recommendation : {rec['recommendation']}\n\n"
                        f"Travel Type : {rec['travel_type']}\n"
                        f"Best Time : {rec['best_time_to_visit']}\n"
                        f"Estimated Budget : {rec['estimated_budget']}"
                    )

                    self.add_info_box(
                        page,
                        text
                    )

            else:

                self.add_empty(
                    page,
                    "No AI Recommendations Found."
                )

            cur.close()
            con.close()

        except Exception as e:

            messagebox.showerror(
                "Database Error",
                str(e)
            )

        # ==========================================
        # BACK BUTTON
        # ==========================================

        tk.Button(
            page,
            text="⬅ Back to Districts",
            width=22,
            height=2,
            bg=self.green,
            fg="white",
            font=("Arial", 11, "bold"),
            command=self.show_districts
        ).pack(pady=30)

        # ==========================================
        # HELPER FUNCTIONS
        # ==========================================

    def add_section(self, parent, title):

        tk.Label(
            parent,
            text=title,
            font=("Arial", 18, "bold"),
            bg="#F5F7F8",
            fg=self.green
        ).pack(
            anchor="w",
            padx=30,
            pady=(20, 8)
        )

    def add_info_box(self, parent, text):

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

    def add_empty(self, parent, text):

        tk.Label(
            parent,
            text=text,
            font=("Arial", 10, "italic"),
            bg="#F5F7F8",
            fg="#777777"
        ).pack(
            anchor="w",
            padx=35,
            pady=5
        )

    # ==============================
    # OTHER MODULES
    # ==============================

    def clear(self):
        """Clear all widgets from the content area."""
        for widget in self.content.winfo_children():
            widget.destroy()

    def placeholder(self, name):

        tk.Label(
            self.content,
            text=name,
            font=("Arial", 27, "bold"),
            bg="#F5F7F8",
            fg=self.green
        ).pack(pady=100)

        tk.Label(
            self.content,
            text=f"{name} module will be connected here.",
            font=("Arial", 13),
            bg="#F5F7F8"
        ).pack()

        tk.Button(
            self.content,
            text="⬅ Back to Home",
            command=self.show_home,
            bg=self.green,
            fg="white"
        ).pack(pady=25)

    # ======================================
    # EMERGENCY CONTACTS
    # ======================================

    def show_emergency_contacts(self):

        self.clear()

        bg_canvas = self.page_background()

        # ==========================================
        # GLASS PANEL
        # ==========================================

        panel = self.create_glass_panel(
            bg_canvas,
            135,
            35,
            650,
            550
        )

        # ==========================================
        # TITLE
        # ==========================================

        panel.create_text(
            325,
            45,
            text="🚨 Emergency Contacts",
            font=("Arial", 25, "bold"),
            fill="#23413D"
        )

        # ==========================================
        # CONTACT DATA
        # ==========================================

        contacts = [
            ("🚓 Police", "100"),
            ("🚑 Ambulance", "108"),
            ("🚒 Fire & Rescue", "101"),
            ("📞 Emergency", "112"),
            ("👩 Women Helpline", "181"),
            ("👶 Child Helpline", "1098"),
            ("🛣 Road Accident Emergency", "1073")
        ]

        # ==========================================
        # CONTACT BOXES
        # ==========================================

        start_y = 105

        for i, (name, number) in enumerate(
                contacts
        ):
            y = start_y + (
                    i * 55
            )

            # Contact name
            panel.create_text(
                45,
                y,
                text=name,
                anchor="w",
                font=("Arial", 13, "bold"),
                fill="#23413D"
            )

            # Contact number
            panel.create_text(
                605,
                y,
                text=number,
                anchor="e",
                font=("Arial", 14, "bold"),
                fill="#B23A48"
            )

            # Separator
            panel.create_line(
                35,
                y + 22,
                615,
                y + 22,
                fill="#FFFFFF",
                width=1
            )

    # ======================================
    # AI RECOMMENDATION
    # ======================================

    def show_ai_recommendation(self):

        self.clear()

        bg_canvas = self.page_background()

        # ==========================================
        # GLASS PANEL
        # ==========================================

        panel = self.create_glass_panel(
            bg_canvas,
            135,
            20,
            650,
            585
        )

        # ==========================================
        # TITLE
        # ==========================================

        panel.create_text(
            325,
            45,
            text="🤖 AI Tourist Recommendation",
            font=("Arial", 23, "bold"),
            fill="#23413D"
        )

        # ==========================================
        # TRAVEL TYPE
        # ==========================================

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

        travel_box.config(
            bg="#174E4B",
            fg="white",
            activebackground="#087F6B",
            activeforeground="white",
            font=("Arial", 11),
            bd=1,
            highlightthickness=1,
            highlightbackground="#8FF5DF"
        )

        travel_box["menu"].config(
            bg="#174E4B",
            fg="white",
            activebackground="#087F6B",
            activeforeground="white"
        )

        panel.create_window(
            325,
            140,
            window=travel_box,
            width=190,
            height=35
        )

        # ==========================================
        # INTEREST
        # ==========================================

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

        interest_box.config(
            bg="#174E4B",
            fg="white",
            activebackground="#087F6B",
            activeforeground="white",
            font=("Arial", 11),
            bd=1,
            highlightthickness=1,
            highlightbackground="#8FF5DF"
        )

        interest_box["menu"].config(
            bg="#174E4B",
            fg="white",
            activebackground="#087F6B",
            activeforeground="white"
        )

        panel.create_window(
            325,
            235,
            window=interest_box,
            width=190,
            height=35
        )

        # ==========================================
        # RESULT
        # ==========================================

        result = tk.Label(
            panel,
            text="",
            font=("Arial", 12),
            bg="#DCEAE6",
            fg="#23413D",
            justify="left",
            padx=20,
            pady=15,
            highlightbackground="#FFFFFF",
            highlightthickness=1
        )

        panel.create_window(
            325,
            360,
            window=result,
            width=520,
            height=150
        )

        # ==========================================
        # RECOMMEND FUNCTION
        # ==========================================

        def recommend():
            interest = interest_var.get()

            data = {

                "Beach":
                    "🌊 Chennai\n"
                    "• Marina Beach\n"
                    "• Elliot Beach",

                "Heritage":
                    "🏛 Madurai\n"
                    "• Meenakshi Temple\n"
                    "• Palace\n\n"
                    "🏛 Thanjavur\n"
                    "• Brihadeeswarar Temple",

                "Nature":
                    "🌿 Nilgiris\n"
                    "• Ooty\n"
                    "• Coonoor",

                "Temple":
                    "🛕 Rameswaram\n"
                    "• Ramanathaswamy Temple",

                "Food":
                    "🍽 Madurai\n"
                    "• Jigarthanda\n"
                    "• Famous Food Streets"
            }

            result.config(
                text=data.get(
                    interest,
                    "Please select interest"
                )
            )

        # ==========================================
        # RECOMMEND BUTTON
        # ==========================================

        recommend_button = tk.Button(
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
            window=recommend_button,
            width=180,
            height=40
        )

    # ==============================
    # LOGOUT
    # ==============================

    def logout(self):

        if not messagebox.askyesno(
            "Logout",
            "Do you want to logout?"
        ):
            return

        try:
            import sys
            import subprocess

            login_path = os.path.join(
                os.path.dirname(os.path.abspath(__file__)),
                "login.py"
            )

            # Start a fresh login process first, then close this app.
            subprocess.Popen([sys.executable, login_path], cwd=os.path.dirname(login_path))
            self.root.destroy()

        except Exception as e:
            messagebox.showerror(
                "Logout Error",
                str(e)
            )


# ==============================
# START
# ==============================

if __name__ == "__main__":

    root = tk.Tk()

    app = TourismApp(root)

    root.mainloop()