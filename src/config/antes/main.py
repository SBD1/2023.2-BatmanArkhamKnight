import sys
import os
import psycopg2
from config import config

def connect():
    connection = None

    try:
        params = config()
        print('Conectando...')
        connection = psycopg2.connect(**params)

        crsr = connection.cursor()
        print('PostgreSQL version: ')
        crsr.execute('SELECT version()')
        db_version = crsr.fetchone()
        print(db_version)
        crsr.close()

    except(Exception, psycopg2.DatabaseError) as error:
        print(error)

    finally:
        if connection is not None:
            connection.close()
            print('Database connection terminated')

if __name__ == "__main__":
    connect()

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