from typing import Optional

from database.handler import DatabaseHandler
from model.quadra import Quadra
from model.npc import NPC
from model.pc import PC

class QuadraRepository:
    def __init__(self) -> None:
        self.db = DatabaseHandler()
        
    def quadraAtual(self, pc: PC):
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT id_quadra FROM public.Quadra WHERE id_quadra = %s",
                    [pc.id_quadra]
                        )
                result = cursor.fetchone()

        print(result)
        quadraAtual = Quadra(*result)
            
        return quadraAtual
    
    def updateQuadra(self, pc: PC, opcao: int) -> None:
        print(pc)
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                     "UPDATE public.PC SET id_quadra = %s WHERE id_quadra = %s ",
                    [opcao, pc.id]  
                 )
    
    def findQuadraById(self, id) -> Optional[Quadra]:
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT id_quadra, nome FROM public.quadra WHERE id_quadra = %s",
                    [id]
                )
                result = cursor.fetchone()
        
        if result is None:
            print(f'quadra com id {id} não encontrada!')
            return None
        
        quadra = Quadra(*result)
        
        return quadra

    def encontrarInimigos(self, pc: PC):
       # print(user) 
        
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    """SELECT *
                        FROM public.NPC
                        WHERE id_quadra = %s;
                    """,
                        [pc.id_quadra])
                result = cursor.fetchone()
        print(result)

        inimigo = NPC(*result)

        return inimigo
    