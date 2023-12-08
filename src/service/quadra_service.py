from typing import Optional

from model.quadra import Quadra
from repositories.quadra_repository import QuadraRepository
from repositories.pc_repository import PcRepository

from model.pc import Pc

class QuadraService:
    def __init__(self):
        self.quadraRepository = QuadraRepository()
        self.pcRepository = PcRepository()
    
    def getQuadra(self, pc):
        quadraAtual = self.quadraRepository.quadraAtual(pc)
        return quadraAtual
    
    def mover(self, pc: Pc) -> Optional[Pc]:
        quadraAtual = self.quadraRepository.quadraAtual(pc)
        
        inp = input("Você possui as seguintes opções:\n" +
                "L - Leste: Quadra " + str(quadraAtual.destinos[0]) + "\n" +
                "O - Oeste: Quadra " + str(quadraAtual.destinos[1]) + "\n" +
                "N - Norte: Quadra " + str(quadraAtual.destinos[2]) + "\n" +
                "S - Sul: Quadra " + str(quadraAtual.destinos[3]) + "\n"
                "Digite sua escolha: ")
        
        if inp == 'l' or inp == 'L':
            self.quadraRepository.updateQuadra(pc, quadraAtual.destinos[0])
        elif inp == 'o' or inp == 'O':
            self.quadraRepository.updateQuadra(pc, quadraAtual.destinos[1])
        elif inp == 'n' or inp == 'N':
            self.quadraRepository.updateQuadra(pc, quadraAtual.destinos[2])
        elif inp == 's' or inp == 'S':
            self.quadraRepository.updateQuadra(pc, quadraAtual.destinos[3])
        
        result = self.pcRepository.findPcByName(pc.nome)
        
        if result is not None:
            pc = result
        else:
            print('Pc not found')

        print(pc)

        return pc