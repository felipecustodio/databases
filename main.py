#!/bin/usr/env python3
# -*- coding: utf-8 -*-

"""
SCC0240 - Bases de Dados - 2018/1
ICMC - USP
Profa. Dra. Elaine Parros M. de Sousa

Alunos:
Felipe Scrochio Custódio - 9442688
Gabriel Henrique Campos Scalici - 9292970
Danilo Moraes Costa - 8921972
Henrique Martins Loschiavo - 8936972
"""


try:
    import psycopg2
    import eel
    from termcolor import colored
    from configparser import ConfigParser
except Exception as e:
    print(e)
    print("Pacotes não instalados.")
    print("Instale os pacotes necessários com o seguinte comando:")
    print("pip install -r requirements.txt")

# https://github.com/ChrisKnott/Eel
# http://www.postgresqltutorial.com/postgresql-python/


@eel.expose
def hello_world():
    text = colored('HELLO, WORLD! ', 'yellow', attrs=['reverse', 'blink'])
    print(text)


def setup(filename='database.ini', section='postgresql'):
    """ Configura a conexão ao PostgreSQL """
    """ Utiliza arquivo de configuração database.ini """
    parser = ConfigParser()
    parser.read(filename)

    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    return db


def connect():
    try:
        # configurar os parâmetros de conexão
        params = setup()
        print('Conectando ao banco de dados PostgreSQL...')
        connection = psycopg2.connect(**params)

        # criar cursor
        cursor = connection.cursor()

        # conexão bem sucedida: mostrar versão
        text = colored('Banco de Dados PostgreSQL', 'green', attrs=['reverse', 'blink'])
        print(text)

        cursor.execute('SELECT version()')
        print("Conexão feita com sucesso. Bem-vindo!")
        print(cursor.fetchone())

    except (Exception, psycopg2.DatabaseError) as error:
        text = colored('ERRO:', 'yellow', attrs=['reverse', 'blink'])
        print(text + " Conexão ao banco de dados PostgreSQL falhou!")
        print("")
        print(str(error))


def main():
    # inicializar servidor web local
    eel.init('gui')

    # conectar ao banco de dados
    connect()

    # abrir interface gráfica
    eel.start('index.html')


if __name__ == '__main__':
    main()
