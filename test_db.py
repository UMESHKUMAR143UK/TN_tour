from db import get_connection

try:
    con = get_connection()
    print("Database Connected Successfully!")
    con.close()
except Exception as e:
    print(e)