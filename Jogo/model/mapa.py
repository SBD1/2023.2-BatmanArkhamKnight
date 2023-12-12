class Mapa:
    def __init__(self, id, nome, total_pts, tamanho_x, tamanho_y):
        self.id = id
        self.nome = nome
        self.total_pts = total_pts
        self.tamanho_x = tamanho_x
        self.tamanho_y = tamanho_y
    
    def __str__(self):
        return f"Mapa[id={self.id}, nome={self.nome}, total_pts={self.total_pts}, tamanho_x={self.tamanho_x}, tamanho_y={self.tamanho_y}]"