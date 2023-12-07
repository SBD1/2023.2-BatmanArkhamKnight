from typing import Optional
from model.pc import PC  
from repositories.pc_repository import PCRepository  

class PCService:
    def __init__(self):
        self.pcRepository = PCRepository()

    def create(self, descr=None) -> Optional[PC]:
        if descr is None:
            descr = input('Descreva o seu personagem: ')

        newPC = PC(NPC_alvo=None, HP=100, ATK=50, DEF=20, XP=0, furtividade=0, espaco=0, quadra_id=None, veic_id=None, descr=descr)

        self.pcRepository.savePC(newPC)

        foundPC = self.pcRepository.findPCByDescription(descr)

        return foundPC

    def login(self) -> Optional[PC]:
        print('Bem-vindo de volta! Os seguintes personagens estão disponíveis: \n')

        availablePCs = self.pcRepository.findAllPCs()
        availableDescriptions = []

        for pc in availablePCs:
            availableDescriptions.append(pc.descr)
            print(pc.descr)

        descr = input('\nDigite a descrição do seu personagem: ')

        if descr not in availableDescriptions:
            willCreateNewPC = input("O personagem informado não existe! Deseja criá-lo? (S/n)\n")
            if willCreateNewPC in ['s', 'S']:
                newPC = self.create(descr)
                return newPC
            else:
                return None
        else:
            return self.pcRepository.findPCByDescription(descr)
