class DesbloqueiaEquip:
    def __init__(self, missao_id, equip_id):
        self.missao_id = missao_id
        self.equip_id = equip_id
        
    def __str__(self):
        return f"DesbloqueiaEquip[missao_id={self.missao_id}, equip_id={self.equip_id}]"