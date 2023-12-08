from typing import Optional

from database.handler import DatabaseHandler
from model.pc import PC  


class PCRepository:
    def __init__(self) -> None:
        self.db = DatabaseHandler()

    def savePC(self, pc: PC) -> None:
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "INSERT INTO public.PC(NPC_alvo, HP, ATK, DEF, XP, furtividade, espaco, id_quadra, veic_id, descr) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    [pc.NPC_alvo, pc.HP, pc.ATK, pc.DEF, pc.XP, pc.furtividade, pc.espaco, pc.id_quadra, pc.veic_id, pc.descr]
                )

    def updatePC(self, pc: PC) -> None:
        assert pc.person_id is not None
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "UPDATE public.PC SET NPC_alvo = %s, HP = %s, ATK = %s, DEF = %s, XP = %s, furtividade = %s, espaco = %s, id_quadra = %s, veic_id = %s, descr = %s WHERE person_id = %s",
                    [pc.NPC_alvo, pc.HP, pc.ATK, pc.DEF, pc.XP, pc.furtividade, pc.espaco, pc.id_quadra, pc.veic_id, pc.descr, pc.person_id]
                )
    
    def deletePC(self, person_id) -> None:
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM public.PC WHERE person_id = %s",
                    [person_id]
                )
    
    
    def findPCById(self, person_id) -> Optional[PC]: 
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT person_id, NPC_alvo, HP, ATK, DEF, XP, furtividade, espaco, id_quadra, veic_id, descr FROM public.PC WHERE person_id = %s",
                    [person_id]
                )
                result = cursor.fetchone()
    
        if result is None:
            print(f'PC com id {person_id} não encontrado!')
            return None
        
        pc = PC(*result)
        
        return pc
    
    def findAllPCs(self) -> list[PC]: 
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "SELECT person_id, NPC_alvo, HP, ATK, DEF, XP, furtividade, espaco, id_quadra, veic_id, descr FROM public.PC" 
                    )
                result = cursor.fetchall()
        
        pcs = [PC(*row) for row in result]
        
        return pcs
    
    def updateHP(self, pc: PC) -> None:
        assert pc.person_id is not None
        with self.db.connection as conn:
            with conn.cursor() as cursor:
                cursor.execute(
                    "UPDATE public.PC SET HP = %s WHERE person_id = %s",
                    [pc.HP, pc.person_id]
                )