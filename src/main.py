import sys
import os

from typing import Optional
from service.user_service import UserService
from service.sala_service import SalaService
from service.inventario_service import InventarioService

from repositories.sala_repository import SalaRepository

from model.users import User
from service.general_services import GeneralServices
from repositories.inimigo_repository import InimigoRepository
from model.inventario import Inventario

def clear():
    # os.system('cls')
    pass


class Main:

    def __init__(self):
        self.userService = UserService()
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
                self.activeUser = self.userService.create()
                self.activeInventary = self.inventarioService.getUserInventary(self.activeUser.id)
                self.play()
                sys.exit()
                
            if inp == '2':
                self.activeUser = self.userService.login()
                print(self.activeUser)
                self.activeInventary = self.inventarioService.getUserInventary(self.activeUser.id)                
                
                self.play()
                sys.exit()

            if inp == '3':
                sys.exit()
                break

            else:
                print('\nOpção Inválida!')


    def play(self) -> Optional[bool]:
        print(f'Login bem-sucedido no personagem {self.activeUser}')
        inp = 0

        while (inp not in [1, 2, 3]):
            # os.system('cls')
            print('Escolha uma das opções abaixo(1-3):\n')

            print('1 - Mover de sala\n' +
                '2 - Abrir inventario\n' +
                '3 - Sair\n\n\n')

            print('Digite a opção desejada: \n')

            inp = input('> ')
            
            if inp == '1':
                print('inventario do player: ', self.activeInventary)

                if self.activeUser != None and self.activeInventary != None:
                    self.activeUser = self.salaService.mover(self.activeUser)
                    self.checkSala(self.activeUser)
            
            elif inp == '2':
                result = self.inventarioService.getInventaryWithItems(self.activeUser.id)
                if result is not None:
                    print(self.activeInventary)
                    self.activeInventary = result
                    print(self.activeInventary)

            
            elif inp == '3':
                break
                
            else:
                print('\nOpção Inválida!')
        
        exit = input('Digite qualquer coisa para sair: ')
        if exit is not None:
            return False
    
    def lutar(self, activeUser):
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
                self.activeUser = self.salaService.mover(self.activeUser)
                self.checkSala(self.activeUser)    
            
            else:
                print('\nOpção Inválida!')

    def checkSala(self, activeUser: User = None) -> Optional[User]:
        print(self.activeInventary)                

        if self.inimigos.encontrarInimigos(activeUser) != None:
            print('Você encontrou um inimigo!')
            print(self.inimigos.encontrarInimigos(activeUser))
            monstro = self.inimigos.encontrarInimigos(activeUser)
            self.service.lutar(activeUser, monstro)
        
        if self.inimigos.encontrarBoss(activeUser) != None:
            print('Você encontrou um boss!')
            monstro = self.inimigos.encontrarBoss(activeUser)
            self.service.lutar(activeUser, monstro)
        
        if self.salaRepository.encontrarBau(activeUser) != None:

            self.salaService.encontrarBau(activeUser, self.activeInventary.id)
            print('teste' + str(self.activeInventary))


if __name__ == '__main__':
    game = Main()
    game.start()