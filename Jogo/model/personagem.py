class Personagem:
    def __init__(self, id, tipo):
        self.id = id
        self.tipo = tipo
        
    def __str__(self):
        return f"Personagem[id={self.id}, tipo={self.tipo}]"