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
    import json
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


# conexão ao banco de dados
connection = None
cursor = None


# Requisições CRUD
@eel.expose
def select(table, columns):
    global connection
    global cursor

    print("Executando SELECT...")
    # "SELECT columns[0] columns[1] ... FROM table"

    # parsear colunas
    columns_content = ""
    for index, value in enumerate(columns):
        if (index < len(columns) - 1):
            columns_content += str(value) + ", "
        else:
            columns_content += str(value)

    # gerar query com dados do site
    query = "SELECT " + columns_content +  " FROM " + table

    text = colored('QUERY: ', 'yellow', attrs=['reverse', 'blink'])
    print(text + query)

    results = []
    try:
        # tentar executar a query
        cursor.execute(query)
        result = cursor.fetchall()

        # exibir resultado
        print("Resultado do SELECT: ")
        for value in result:
            results.append(str(value))
            print(value, end=", ")
        print("\n")
        return results
    except Exception as error:
        # caso SELECT dê erro, exibir erro e retornar lista vazia
        text = colored('ERRO:', 'yellow', attrs=['reverse', 'blink'])
        print("")
        print(str(error))
        return results


@eel.expose
def insert(table, values):
    global connection
    global cursor

    print("Executando INSERT...")

    # parsear dados
    values_content = ""
    for index, value in enumerate(values):
        if (index < len(values) - 1):
            values_content += str(value) + ", "
        else:
            values_content += str(value)

    # gerar query com dados do site
    query = "INSERT INTO" + table + "VALUES (" + values_content + ");"

    text = colored('QUERY: ', 'yellow', attrs=['reverse', 'blink'])
    print(text + query)

    try:
        # tentar executar a query
        cursor.execute(query)
        result =  cur.fetchone()[0]
    except Exception as error:
        # em caso de erro, retornar -1 para alertar no site que deu erro
        # exibir erro no terminal
        text = colored('ERRO:', 'yellow', attrs=['reverse', 'blink'])
        print("")
        print(str(error))
        result = -1 # deu errado, alertar no site

    # formatar esse resultado
    return result


@eel.expose
def delete(table, column, value):
    global connection
    global cursor

    print("Executando DELETE...")

    # gerar query com dados do site
    query = "DELETE FROM " + table + "WHERE " + str(column) + "=" + str(value)

    text = colored('QUERY: ', 'yellow', attrs=['reverse', 'blink'])
    print(text + query)

    try:
        # tentar executar a query
        cursor.execute(query)
        result = 1
    except Exception as error:
        # em caso de erro, retornar -1 para alertar no site que deu erro
        # exibir erro no terminal
        text = colored('ERRO:', 'yellow', attrs=['reverse', 'blink'])
        print("")
        print(str(error))
        result = -1 # deu errado, alertar no site

    # formatar esse resultado
    return result


@eel.expose
def update(table, column, value, condition_column, condition_value):
    global connection
    global cursor

    print("Executando UPDATE...")

    # gerar query com dados do site
    query = "UPDATE " + table + "SET " + str(column) + "=" + str(value) + " WHERE " + str(condition_column) + "=" + str(condition_value)

    text = colored('QUERY: ', 'yellow', attrs=['reverse', 'blink'])
    print(text + query)

    try:
        # tentar executar a query
        cursor.execute(query)
        result = 1
    except Exception as error:
        # em caso de erro, retornar -1 para alertar no site que deu erro
        # exibir erro no terminal
        text = colored('ERRO:', 'yellow', attrs=['reverse', 'blink'])
        print("")
        print(str(error))
        result = -1 # deu errado, alertar no site

    # formatar esse resultado
    return result


def setup(filename='database.ini', section='postgresql'):

    global connection
    global cursor

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

    global connection
    global cursor

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


def run_sql(filename):

    global connection
    global cursor

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

def main():
    global connection
    global cursor

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
    run_sql('drop.sql')

    print("Inicializando as tabelas do banco de dados...")
    run_sql('initialize.sql')

    print("Populando o banco de dados com tuplas iniciais...")
    run_sql('insert.sql')

    # abrir interface gráfica
    print("Abrindo a interface gráfica...")
    text = colored('SEJA BEM-VINDO A NEVERLAND!', 'yellow', attrs=['reverse', 'blink'])
    print('\n' + text)
    print("Navegue pelo site para conferir as funcionalidades.")

    try:
        eel.start('index.html', options=web_app_options)
    except (Exception) as e:
        text = colored('ERRO:', 'red', attrs=['reverse', 'blink'])
        print('\n' + text + str(e))

    # fechar conexão com o banco ao terminar
    cur.close()


if __name__ == '__main__':
    main()
