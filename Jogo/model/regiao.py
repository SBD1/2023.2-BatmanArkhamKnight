class Regiao:
    def __init__(self, id, mapa_id, nome):
        self.id = id
        self.mapa_id = mapa_id
        self.nome = nome

    def __str__(self):
        return f"Regiao[id={self.id}, mapa_id={self.mapa_id}, nome={self.nome}]"