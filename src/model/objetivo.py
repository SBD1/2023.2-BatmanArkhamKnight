class Objetivo:
    def __init__(self, id, local_id, missao_id, status):
        self.id = id
        self.local_id = local_id
        self.missao_id = missao_id
        self.status = status

    def __str__(self):
        return f"Objetivo[id={self.id}, local_id={self.local_id}, missao_id={self.missao_id}, status={self.status}]"