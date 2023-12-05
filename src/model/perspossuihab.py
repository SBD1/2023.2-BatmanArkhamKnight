class PersPossuiHab:
    def __init__(self, person_id, hab_id):
        self.person_id = person_id
        self.hab_id = hab_id

    def __str__(self):
        return f"PersPossuiHab[person_id={self.person_id}, hab_id={self.hab_id}]"