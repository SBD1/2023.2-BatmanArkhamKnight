class Efeito:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

    def __str__(self):
        return f"Efeito[id={self.id}, nome={self.nome}]"
