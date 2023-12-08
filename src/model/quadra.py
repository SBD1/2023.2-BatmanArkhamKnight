class Quadra:
    def __init__(self, id_quadra, local_id, escalavel, coord_x, coord_y):
        self.id_quadra = id_quadra
        self.local_id = local_id
        self.escalavel = escalavel
        self.coord_x = coord_x
        self.coord_y = coord_y

    def __str__(self):
        return f"Quadra[id={self.id_quadra}, local_id={self.local_id}, escalavel={self.escalavel}, coord_x={self.coord_x}, coord_y={self.coord_y}]"