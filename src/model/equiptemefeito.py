class EquipTemEfeito:
    def __init__(self, equip_id, efeito_id):
        self.equip_id = equip_id
        self.efeito_id = efeito_id
    
    def __str__(self):
        return f"EquipTemEfeito[equip_id={self.equip_id}, efeito_id={self.efeito_id}]"