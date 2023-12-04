class Dialogo:
    def __init__(self, id, NPC_id, dial_texto, dial_numero, dial_falado):
        self.id = id
        self.NPC_id = NPC_id
        self.dial_texto = dial_texto
        self.dial_numero = dial_numero
        self.dial_falado = dial_falado

    def __str__(self):
        return f"Dialogo[id={self.id}, NPC_id={self.NPC_id}, dial_texto={self.dial_texto}, dial_numero={self.dial_numero}, dial_falado={self.dial_falado}]"