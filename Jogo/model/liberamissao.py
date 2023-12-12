class LiberaMissao:
    def __init__(self, missao_id, dial_id):
        self.missao_id = missao_id
        self.dial_id = dial_id
        
    def __str__(self):
        return f"LiberaMissao[missao_id={self.missao_id}, dial_id={self.dial_id}]"
