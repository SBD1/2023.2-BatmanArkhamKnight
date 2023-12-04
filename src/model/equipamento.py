class Equipamento:
    def __init__(self, id, nome, descr, preco):
        self.id = id
        self.nome = nome
        self.descr = descr
        self.preco = preco

    def __str__(self):
        return f"Equipamento[id={self.id}, nome={self.nome}, descr={self.descr}, preco={self.preco}]"