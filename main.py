#!/bin/usr/env python3
# -*- coding: utf-8 -*-
try:
    import psycopg2
    import eel
    from termcolor import colored
    from configparser import ConfigParser
except:
    print("Pacotes não instalados.")
    print("Instale os pacotes necessários com o seguinte comando:")
    print("pip install -r requirements.txt")

# https://github.com/ChrisKnott/Eel
# http://www.postgresqltutorial.com/postgresql-python/

# http://localhost:8000/
# eel.init('gui')


# @eel.expose
# def hello_world():
#     text = colored('HELLO, WORLD! ', 'yellow', attrs=['reverse', 'blink'])
#     print(text)


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
        text = colored('ERRO:', 'red', attrs=['reverse', 'blink'])
        print(text + error)


# print("Initializing GUI...")
# eel.start('index.html', size=(800, 800))


if __name__ == '__main__':
    connect()
