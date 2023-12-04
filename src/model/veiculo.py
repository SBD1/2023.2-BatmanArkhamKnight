class Veiculo:
    def __init__(self, id, local_id, HP, VEL, nome):
        self.id = id
        self.local_id = local_id
        self.HP = HP
        self.VEL = VEL
        self.nome = nome

    def __str__(self):
        return f"Veiculo[id={self.id}, local_id={self.local_id}, HP={self.HP}, VEL={self.VEL}, nome={self.nome}]"   