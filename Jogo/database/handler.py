import psycopg2

from config.environment import DATABASE_CONNECTION

class DatabaseHandler:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connection = psycopg2.connect(**DATABASE_CONNECTION)
        return cls._instance
    
    def __init__(self):
        assert self._instance is not None
        self.connection = self._instance.connection
        
    def __del__(self):
        self.connection.close()