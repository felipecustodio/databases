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
    import sys
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
        # sempre commitar após um comando, assim erros podem ser ignorados, porém exibidos
        connection.autocommit = True

        # criar cursor
        cursor = connection.cursor()

        # conexão bem sucedida: mostrar versão
        text = colored('Banco de Dados PostgreSQL', 'green', attrs=['reverse', 'blink'])
        print(text)

        cursor.execute('SELECT version()')
        print("Conexão feita com sucesso. Bem-vindo!")
        print(cursor.fetchone())

        return connection, cursor

    except (Exception, psycopg2.DatabaseError) as error:
        text = colored('ERRO:', 'yellow', attrs=['reverse', 'blink'])
        print(text + " Conexão ao banco de dados PostgreSQL falhou!")
        print("")
        print(str(error))
        sys.exit()


def run_sql(connection, cursor, filename):
    # ler arquivo SQL em um único buffer
    file = open(filename, 'r')
    sql = file.read()
    file.close()

    text = colored('Executando ' + filename, 'green', attrs=['reverse', 'blink'])
    print(text)

    # obter os comandos separando o arquivo por ';'
    commands = sql.split(';')

    # executar todos os comandos
    for command in commands[:-1]:
        if (len(command) > 0):
            command = command + ';'
            try:

                cursor.execute(command)
            except(Exception, psycopg2.DatabaseError) as error:
                text = colored('ERRO:', 'yellow', attrs=['reverse', 'blink'])
                print('\n' + text + command)
                print('\n' + str(error))
                print("Pressione qualquer tecla para continuar.", end=' ')
                input()


def main():

    web_app_options = {
	'mode': "chrome-app",
	'port': 8000,
    # modo incognito evita problemas com cache
	'chromeFlags': ["--incognito"]
    }

    # inicializar servidor web local
    eel.init('gui')

    # conectar ao banco de dados
    connection, cursor = connect()
    run_sql(connection, cursor, 'drop.sql')

    print("Inicializando as tabelas do banco de dados...")
    run_sql(connection, cursor, 'initialize.sql')

    print("Populando o banco de dados com tuplas iniciais...")
    run_sql(connection, cursor, 'insert.sql')

    # cursor.execute("""SELECT * from PESSOA""")

    # abrir interface gráfica
    print("Abrindo a interface gráfica...")
    text = colored('SEJA BEM-VINDO A NEVERLAND!', 'yellow', attrs=['reverse', 'blink'])
    print('\n' + text)
    print("Navegue pelo site para conferir as funcionalidades.")

    eel.start('index.html')

if __name__ == '__main__':
    main()
