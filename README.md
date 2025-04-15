# 📘 Manual de Uso – Simulación del Proyecto 2

## 1. 🔧 Requisitos Previos

- Python 3.8 o superior
- PostgreSQL instalado y corriendo
- Git instalado (opcional, para clonar el repositorio)

---

## 2. 📅 Clonar el Repositorio

```bash
git clone https://github.com/Nery2004/Proyecto-2
cd Proyecto-2
```

---

## 3. ⚙️ Configuración del Entorno

### 3.1 Crear archivo `.env`

Crea un archivo `.env` en la raíz del proyecto con el siguiente formato, **reemplazando con tus credenciales de base de datos PostgreSQL**:

```env
DB_NAME=nombre_de_tu_base
DB_USER=usuario
DB_PASSWORD=contraseña
DB_HOST=localhost
DB_PORT=5432
```

---

## 4. 📦 Instalar Dependencias

Asegúrate de tener `pip` actualizado, luego instala los paquetes necesarios:

```bash
pip install -r requirements.txt
```

> Si no hay un archivo `requirements.txt`, instala manualmente:

```bash
pip install python-dotenv psycopg2
```

---

## 5. 🗓️ Verifica la Base de Datos

Asegúrate de tener creada y corriendo tu base de datos en PostgreSQL. 

Es **importante** ejecutar los siguientes archivos SQL **en orden** para preparar correctamente la estructura de la base de datos:

1. `ddl.sql` – Define las tablas y estructuras principales.
2. `triggers.sql` – Crea los triggers necesarios para la lógica del sistema.
3. `data.sql` – Inserta los datos iniciales necesarios para la simulación.

Puedes ejecutar estos scripts utilizando una herramienta como `psql` o PgAdmin.

---

## 6. 🚀 Ejecutar la Simulación

Corre el script principal (que seria el `Proyecto2.py`):

```bash
python Proyecto2.py
```

> Asegúrate de que el archivo carga correctamente las variables de entorno con:
```python
from dotenv import load_dotenv
load_dotenv()
```

---

## 7. 📋 Uso del Menú

Sigue las instrucciones que aparecen en consola. El menú te permitirá ejecutar las distintas simulaciones (creación de hilos, inserciones, etc.).

---

## 📎 Informe del Proyecto

Puedes consultar el informe completo del proyecto en el siguiente enlace:

[📄 Ver Informe del Proyecto](https://docs.google.com/document/d/1uIf2PTGPiybQlxxg5gLuptojGWXgvdKGLRGp5Ez-rns/edit?usp=sharing)

---

👍 Si tienes dudas o errores, revisa que:
- Las credenciales en `.env` sean correctas
- La base de datos esté corriendo
- Todos los paquetes estén instalados correctamente


---

📄 Proyecto creado por Nery2004, Dernait y Albu231311


