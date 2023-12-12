class CumpreMissao:
    def __init__(self, PC_id, missao_id, status):
        self.PC_id = PC_id
        self.missao_id = missao_id
        self.status = status

    def __str__(self):
        return f"CumpreMissao[PC_id={self.PC_id}, missao_id={self.missao_id}, status={self.status}]"
