class PCMelhoraEquip:
    def __init__(self, PC_id, equip_id, preco):
        self.PC_id = PC_id
        self.equip_id = equip_id
        self.preco = preco
        
    def __str__(self):
        return f"PCMelhoraEquip[PC_id={self.PC_id}, equip_id={self.equip_id}, preco={self.preco}]"