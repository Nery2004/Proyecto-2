import psycopg2
import os
import time
import threading
from dotenv import load_dotenv
from psycopg2 import extensions

load_dotenv()

def get_connection():
    return psycopg2.connect(
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT")
    )

levels = {
    "1": extensions.ISOLATION_LEVEL_READ_COMMITTED,
    "2": extensions.ISOLATION_LEVEL_REPEATABLE_READ,
    "3": extensions.ISOLATION_LEVEL_SERIALIZABLE
}

level_names = {
    "1": "READ COMMITTED",
    "2": "REPEATABLE READ",
    "3": "SERIALIZABLE"
}

results_lock = threading.Lock()
successful_reservations = 0
failed_reservations = 0
times = []
global_asiento = None

def attempt_reservation(isolation_level):
    global successful_reservations, failed_reservations, global_asiento
    start = time.time()
    conn = get_connection()
    conn.set_isolation_level(isolation_level)
    cursor = conn.cursor()

    try:
        cursor.execute("BEGIN")
        print(f"Hilo {threading.current_thread().name} inició transacción.")
        cursor.execute("SAVEPOINT sp1")

        try:
            print(f"Hilo {threading.current_thread().name} insertando en reservas.")
            cursor.execute("""
                INSERT INTO reservas (usuario_id, evento_id, estado_id, precio_total)
                VALUES (4, 1, 1, 50.00) RETURNING id
            """)
            new_reserva_id = cursor.fetchone()[0]
            print(f"Hilo {threading.current_thread().name} nueva reserva_id = {new_reserva_id}.")
        except Exception as e:
            print(f"Hilo {threading.current_thread().name} error en INSERT reservas: {e}")
            cursor.execute("ROLLBACK TO sp1")
            raise
        cursor.execute("SAVEPOINT sp2")

        try:
            print(f"Hilo {threading.current_thread().name} insertando en reservadetalle asiento {global_asiento}.")
            cursor.execute("""
                INSERT INTO reservadetalle (reserva_id, asiento_id)
                VALUES (%s, %s)
            """, (new_reserva_id, global_asiento))
        except Exception as e:
            print(f"Hilo {threading.current_thread().name} error en INSERT reservadetalle: {e}")
            cursor.execute("ROLLBACK TO sp2")
            raise
        cursor.execute("COMMIT")
        print(f"Hilo {threading.current_thread().name} COMMIT exitoso.")
        with results_lock:
            successful_reservations += 1

    except Exception as e:
        print(f"Hilo {threading.current_thread().name} error general: {e}")
        conn.rollback()
        with results_lock:
            failed_reservations += 1

    finally:
        cursor.close()
        conn.close()
    end = time.time()

    with results_lock:
        times.append(end - start)

def main():
    while True:
        global successful_reservations, failed_reservations, times, global_asiento
        successful_reservations = 0
        failed_reservations = 0
        times = []

        print("Elige el nivel de aislamiento:\n1) READ COMMITTED\n2) REPEATABLE READ\n3) SERIALIZABLE\n4) Salir")
        choice = input().strip()

        if choice == "4":
            break

        if choice not in levels:
            print("Opción no válida")
            continue

        isolation_level = levels[choice]
        isolation_name = level_names[choice]
        print("Elige la cantidad de hilos (5, 10, 20, 30):")

        try:
            num_threads = int(input().strip())
        except:
            print("Entrada inválida")
            continue

        print("Ingresa el asiento a reservar:")

        try:
            global_asiento = int(input().strip())
        except:
            print("Asiento inválido")
            continue

        threads = []

        for i in range(num_threads):
            t = threading.Thread(target=attempt_reservation, args=(isolation_level,), name=f"T{i+1}")
            threads.append(t)
            t.start()

        for t in threads:
            t.join()

        avg_time = sum(times) / len(times) if times else 0

        print(f"Usuarios concurrentes: {num_threads}")
        print(f"Nivel de aislamiento: {isolation_name}")
        print(f"Reservas exitosas: {successful_reservations}")
        print(f"Reservas fallidas: {failed_reservations}")
        print(f"Tiempo promedio: {avg_time:.6f} segundos")

main()