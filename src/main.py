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


    def start(self):


            printf("                      *         *                       ")
            printf("          ***          **********          ***          ")
            printf("       *****           **********           *****       ")
            printf("     *******           **********           *******     ")
            printf("   **********         ************         **********   ")
            printf("  ****************************************************  ")
            printf(" ****************************************************** ")
            printf("********************************************************")
            printf("********************************************************")
            printf("********************************************************")
            printf(" ****************************************************** ")
            printf("  ********      ************************      ********  ")
            printf("   *******       *     *********      *       *******   ")
            printf("     ******             *******              ******     ")
            printf("       *****             *****              *****       ")
            printf("          ***             ***              ***          ")
            printf("            **             *              **          \n")

            print('Escolha uma das opções abaixo(1-3):\n')

            print('1 - Criar Novo Personagem\n' +
                  '2 - Carregar Personagem\n' +
                  '3 - Sair\n\n\n')