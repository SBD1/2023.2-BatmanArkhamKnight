class PC:
    def __init__(self, person_id, NPC_alvo, HP, ATK, DEF, XP, furtividade, espaco, id_quadra, veic_id, descr):
        self.person_id = person_id
        self.NPC_alvo = NPC_alvo
        self.HP = HP
        self.ATK = ATK
        self.DEF = DEF
        self.XP = XP
        self.furtividade = furtividade
        self.espaco = espaco
        self.id_quadra = id_quadra
        self.veic_id = veic_id
        self.descr = descr
    
    def __str__(self):
        return f"PC[person_id={self.person_id}, NPC_alvo={self.NPC_alvo}, HP={self.HP}, ATK={self.ATK}, DEF={self.DEF}, XP={self.XP}, furtividade={self.furtividade}, espaco={self.espaco}, quadra_id={self.quadra_id}, veic_id={self.veic_id}, descr={self.descr}]"
