class NPC:
    def __init__(self, person_id, quadra_id, veic_id, nome, HP, ATK, DEF, Descr, NPC_foco):
        self.person_id = person_id
        self.quadra_id = quadra_id
        self.veic_id = veic_id
        self.nome = nome
        self.HP = HP
        self.ATK = ATK
        self.DEF = DEF
        self.Descr = Descr
        self.NPC_foco = NPC_foco
        
    def __str__(self):
        return f"NPC[person_id={self.person_id}, quadra_id={self.quadra_id}, veic_id={self.veic_id}, nome={self.nome}, HP={self.HP}, ATK={self.ATK}, DEF={self.DEF}, Descr={self.Descr}, NPC_foco={self.NPC_foco}]"