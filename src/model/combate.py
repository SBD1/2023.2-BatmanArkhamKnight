class Combate:
    def __init__(self, PC_id, NPC_id, distancia):
        self.PC_id = PC_id
        self.NPC_id = NPC_id
        self.distancia = distancia

    def __str__(self):
        return f"Combate[PC_id={self.PC_id}, NPC_id={self.NPC_id}, distancia={self.distancia}]"