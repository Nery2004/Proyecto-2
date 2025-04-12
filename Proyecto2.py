import threading
import time
import random
import psycopg2  

# ==========================
# CONFIGURACIÓN DE CONEXIÓN
# ==========================
def get_connection():
    return psycopg2.connect(
        dbname="tu_base",
        user="tu_usuario",
        password="tu_contraseña",
        host="localhost",
        port="5432"
    )
