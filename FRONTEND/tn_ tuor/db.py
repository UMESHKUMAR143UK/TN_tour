import mysql.connector


def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="umesh1506",          # <-- Put your MySQL password here
        database="tn_tour"
    )