from typing import Optional

from database.handler import DatabaseHandler
from model.quadra import Quadra
from model.inimigo import Inimigo
from model.pc import Pc

class QuadraRepository:
    def __init__(self) -> None:
        self.db = DatabaseHandler()
        
    def quadraAtual(self, pc: Pc):
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT id, nome FROM public.Quadra WHERE id = %s",
                    [pc.id_quadra]
                        )
                result = cursor.fetchone()

        print(result)
        quadraAtual = Quadra(*result)
            
        return quadraAtual
    
    def updateQuadra(self, pc: Pc, opcao: int) -> None:
        print(pc)
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                     "UPDATE public.Jogador SET id_quadra = %s WHERE id = %s ",
                    [opcao, pc.id]  
                 )
    
    def findQuadraById(self, id) -> Optional[Quadra]:
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT id, nome FROM public.quadra WHERE id = %s",
                    [id]
                )
                result = cursor.fetchone()
        
        if result is None:
            print(f'quadra com id {id} não encontrada!')
            return None
        
        quadra = Quadra(*result)
        
        return quadra

    def encontrarInimigos(self, pc: Pc):
       # print(user) 
        
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    """SELECT *
                        FROM public.comum
                        join public.inimigo on public.comum.id_inimigo = public.inimigo.id
                        join public.npc on public.npc.id_quadra = %s and public.inimigo.id_npc=npc.id;
                    """,
                        [pc.id_quadra])
                result = cursor.fetchone()
        print(result)

        inimigo = Comum(*result)

        return inimigo
    