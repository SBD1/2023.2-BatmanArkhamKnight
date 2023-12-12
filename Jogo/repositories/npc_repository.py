from database.handler import DatabaseHandler
from model.pc import PC
from model.npc import NPC 

class NPCRepository:
    def __init__(self) -> None:
        self.db = DatabaseHandler()

    def encontrarNPCs(self, pc : PC):
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    """SELECT *
                       FROM NPC
                       WHERE id_quadra = %s;
                    """,
                    [pc.id_quadra])
                result = cursor.fetchone()

        if result is not None:
            npc = NPC(*result)
            return npc
        else:
            return None


