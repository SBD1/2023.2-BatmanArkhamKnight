from os import environ as env

DATABASE_CONNECTION = {
    "dbname": env.get("DB_NAME") or "trabaio",
    "user": env.get("DB_USER") or "bat_admin",
    "password": env.get("DB_PASSWORD") or "bat987",
    "host": env.get("DB_HOST") or "localhost",
    "port": env.get("DB_PORT") or "5432",
}