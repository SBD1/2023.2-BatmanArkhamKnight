class PCEquipa:
    def __init__(self, PC_id, equip_id):
        self.PC_id = PC_id
        self.equip_id = equip_id
        
    def __str__(self):
        return f"PCEquipa[PC_id={self.PC_id}, equip_id={self.equip_id}]"