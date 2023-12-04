class Missao:
    def __init__(self, id, nome, descr, pontos, NPC_id):
        self.id = id
        self.nome = nome
        self.descr = descr
        self.pontos = pontos
        self.NPC_id = NPC_id

    def __str__(self):
        return f"Missao[id={self.id}, nome={self.nome}, descr={self.descr}, pontos={self.pontos}, NPC_id={self.NPC_id}]"