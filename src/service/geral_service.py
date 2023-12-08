from model.pc import PC
from model.npc import NPC
from repositories.sala_repository import SalaRepository
import time
from repositories.pc_repository import PCRepository


class GeneralServices:
    def __init__(self):
        self.salaRepository = SalaRepository()
        self.pcRepository = PCRepository()

    def lutar(self, pc: PC, npc):
        print(npc)
        print('Escolha uma das opções abaixo(1-2):\n')

        opcao = input('1 - Lutar\n' +
            '2 - Fugir\n\n\n' +
            'Digite a opção desejada: \n')

        if opcao == '1':
            
            while pc.HP > 0 and npc.HP > 0:
                print('Você atacou o inimigo!')
                npc.HP -= PC.ATK
                print(f'Vida do inimigo: {npc.HP}')
                time.sleep(2)
                print('O inimigo atacou você!')
                pc.HP -= int(npc.ATK)
                print(f'Sua vida: {pc.HP}')
                time.sleep(2)
            
            self.pcRepository.updateVida(pc)
            print(pc)

            return print(npc)