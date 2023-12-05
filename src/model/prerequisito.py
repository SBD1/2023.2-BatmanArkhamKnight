class PreRequisito:
    def __init__(self, missao_id, missao_pre_req_id):
        self.missao_id = missao_id
        self.missao_pre_req_id = missao_pre_req_id

    def __str__(self):
        return f"PreRequisito[missao_id={self.missao_id}, missao_pre_req_id={self.missao_pre_req_id}]"