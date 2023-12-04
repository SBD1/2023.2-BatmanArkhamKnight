class Habilidade:
    def __init__(self, id, nome, descr, alcance):
        self.id = id
        self.nome = nome
        self.descr = descr
        self.alcance = alcance

    def __str__(self):
        return f"Habilidade[id={self.id}, nome={self.nome}, descr={self.descr}, alcance={self.alcance}]"
