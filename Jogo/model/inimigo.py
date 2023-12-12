class Inimigo:
    def __init__(self, NPC_id, nome_real, agressividade):
        self.NPC_id = NPC_id
        self.nome_real = nome_real
        self.agressividade = agressividade

    def __str__(self):
        return f"Inimigo[NPC_id={self.NPC_id}, nome_real={self.nome_real}, agressividade={self.agressividade}]"