from os import environ as env

DATABASE_CONNECTION = {
    "dbname": env.get("DB_NAME") or "",
    "user": env.get("DB_USER") or "postgres",
    "password": env.get("DB_PASSWORD") or "pass",
    "host": env.get("DB_HOST") or "localhost",
    "port": env.get("DB_PORT") or "5432",
}