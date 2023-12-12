class VeicPossuiHab:
    def __init__(self, veic_id, hab_id):
        self.veic_id = veic_id
        self.hab_id = hab_id

    def __str__(self):
        return f"VeicPossuiHab[veic_id={self.veic_id}, hab_id={self.hab_id}]"
