import sys
import os

from typing import Optional
from service.pc_service import PCService



def clear():
    # os.system('cls')
    pass


class Main:

    def __init__(self):
        self.PCService = PCService()
        self.salaService = SalaService()
        self.salaRepository = SalaRepository()
        self.service = GeneralServices()
        self.inimigos = InimigoRepository()
        self.inventarioService = InventarioService()

        
    def start(self):

        print("batman\n")

        print('Escolha uma das opções abaixo(1-3):\n')

        print('1 - Criar Novo Personagem\n' +
              '2 - Carregar Personagem\n' +
              '3 - Sair\n\n\n')

        print('Digite a opção desejada: \n')

        inp = 0

        while (inp not in [1, 2, 3]):
            inp = input('> ')

            if inp == '1':
                self.activePC = self.PCService.create()
                self.play()
                sys.exit()
                
            if inp == '2':
                self.activePC = self.PCService.login()
                print(self.activePC)               
                
                self.play()
                sys.exit()

            if inp == '3':
                sys.exit()
                break

            else:
                print('\nOpção Inválida!')


    def play(self) -> Optional[bool]:
        print(f'Login bem-sucedido no personagem {self.activePC}')
        inp = 0

        while (inp not in [1, 2, 3]):
            # os.system('cls')
            print('Escolha uma das opções abaixo(1/2):\n')

            print('1 - Mover de sala\n' +
                '3 - Sair\n\n\n')

            print('Digite a opção desejada: \n')

            inp = input('> ')
            
            if inp == '1':

                if self.activePC != None and self.activeInventary != None:
                    self.activePC = self.salaService.mover(self.activePC)
                    self.checkSala(self.activePC)
            
            elif inp == '2':
                break
                
            else:
                print('\nOpção Inválida!')
        
        exit = input('Digite qualquer coisa para sair: ')
        if exit is not None:
            return False
    
    def lutar(self, activePC):
        print('Escolha uma das opções abaixo(1-2):\n')

        print('1 - Lutar\n' +
            '2 - Fugir\n\n\n')

        print('Digite a opção desejada: \n')

        inp = 0

        while (inp not in [1, 2]):
            inp = input('> ')

            if inp == '1':
                return print("lutei")
            
            elif inp == '2':
                self.activePC = self.salaService.mover(self.activePC)
                self.checkSala(self.activePC)    
            
            else:
                print('\nOpção Inválida!')

    def checkSala(self, activePC: PC = None) -> Optional[PC]:
        print(self.activeInventary)                

        if self.inimigos.encontrarInimigos(activePC) != None:
            print('Você encontrou um inimigo!')
            print(self.inimigos.encontrarInimigos(activePC))
            monstro = self.inimigos.encontrarInimigos(activePC)
            self.service.lutar(activePC, monstro)
        
        if self.inimigos.encontrarBoss(activePC) != None:
            print('Você encontrou um boss!')
            monstro = self.inimigos.encontrarBoss(activePC)
            self.service.lutar(activePC, monstro)
        
        if self.salaRepository.encontrarBau(activePC) != None:

            self.salaService.encontrarBau(activePC, self.activeInventary.id)
            print('teste' + str(self.activeInventary))


if __name__ == '__main__':
    game = Main()
    game.start()