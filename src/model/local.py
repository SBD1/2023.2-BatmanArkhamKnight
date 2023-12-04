class Local:
    def __init__(self, id, regiao_id, acesso, origem_x, origem_y):
        self.id = id
        self.regiao_id = regiao_id
        self.acesso = acesso
        self.origem_x = origem_x
        self.origem_y = origem_y

    def __str__(self):
        return f"Local[id={self.id}, regiao_id={self.regiao_id}, acesso={self.acesso}, origem_x={self.origem_x}, origem_y={self.origem_y}]"
