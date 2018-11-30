#!/bin/usr/env python3
# -*- coding: utf-8 -*-

"""
SCC0540 - Bases de Dados - 2018/2
ICMC - USP
Profa. Dra. Elaine Parros M. de Sousa

Alunos:
Felipe Scrochio Custódio - 9442688
Henrique Martins Loschiavo - 8936972
"""

try:
    # database
    import psycopg2 # postgres
    from configparser import ConfigParser # .ini parser
    import os
    import sys
    # cli
    import click
    from pyfiglet import Figlet
    from termcolor import colored
    from prompt_toolkit import prompt
    from prompt_toolkit.history import FileHistory
    from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
    from prompt_toolkit.contrib.completers import WordCompleter
    from pygments.lexers.sql import SqlLexer
    from halo import Halo
except Exception as e:
    print(e)
    print("Pacotes não instalados.")
    print("Instale os pacotes necessários.")
    print("pip install --user -r requirements.txt")

# cli
figlet = Figlet(font='roman')
title = figlet.renderText("TUSCA")

SQLCompleter = WordCompleter(['SELECT', 'FROM', 'INSERT', 'UPDATE', 'DELETE', 'DROP'],
                             ignore_case=True)

menu = {
    1: "Realizar consulta",
    2: "Consultas especiais",
    3: "Sair"
}

menu_queries = {
    1: "Quantidade de...",
    2: "...",
    3: "...",
    4: "..."
}

error_tag = colored('[ERRO] ', 'red')

def parse_menu(choice):
    if (choice not in menu.keys()):
        print(error_tag + "Opção inválida")
        prompt("Pressione ENTER para continuar.")

    if (choice == 1):
        os.system("clear")
        print("Pressione Q para sair da tela de resultados.")
        print("Digite sua consulta.")
        user_input = prompt("\n[SQL] >> ",
                        history=FileHistory('history.txt'),
                        auto_suggest=AutoSuggestFromHistory(),
                        completer=SQLCompleter,
                        lexer=SqlLexer,
                        )
        run_query(user_input)

    if (choice == 2):
        os.system('clear')
        print(title)
        print("Consultas especiais")
        for index in menu_queries.keys():
            print("[" + str(index) + "] " + menu_queries[index])
        user_input = prompt(">> ")

        if (user_input not in menu_queries.keys()):
            print(error_tag + "Opção inválida")
            prompt("Pressione ENTER para continuar.")
            return


    if (choice == 3):
        # fechar conexão com o banco ao terminar
        print("Encerrando conexão...")
        cursor.close()
        prompt("Pressione qualquer tecla para sair.")
        exit()

# conexão ao banco de dados
connection = None
cursor = None

# Requisições CRUD
# SELECT
def select(table, columns):
    """ Requisição GET - SELECT """
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

    # gerar query
    query = "SELECT " + columns_content + " FROM " + table

    text = colored('QUERY:', 'yellow')
    print("\n" + text + " " + query)

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
        print("")
        print(error_tag + str(error))
        return results


# INSERT
def insert(table, values):
    """ Requisição CRUD - INSERT """
    global connection
    global cursor

    print("Executando INSERT...")

    # parsear dados
    values_content = ""
    for index, value in enumerate(values):
        if (index < len(values) - 1):
            values_content += "'" + str(value) + "'" + ", "
        else:
            values_content += "'" + str(value) + "'"

    # gerar query
    query = "INSERT INTO " + table + " VALUES (" + values_content + ");"

    text = colored('QUERY:', 'yellow')
    print("\n" + text + " " + query)

    try:
        # tentar executar a query
        cursor.execute(query)
        result = 1
    except Exception as error:
        # em caso de erro, retornar -1
        # exibir erro no terminal
        print("")
        print(error_tag + str(error))
        result = -1  # deu errado

    # formatar esse resultado
    return result


# DELETE
def delete(table, columns, values):
    """ Requisição CRUD - DELETE """
    global connection
    global cursor

    print("Executando DELETE...")
    # gerar query
    query = "DELETE FROM " + table + " WHERE " + str(columns[0]) + "=" + "'" + str(values[0]) + "'"
    # caso haja mais de uma condição, adicioná-las
    if (len(columns) > 1):
        for index, content in enumerate(columns):
            if (index > 0):
                query += " AND " + str(columns[index]) + "=" + "'" + str(values[index]) + "'"

    text = colored('QUERY:', 'yellow')
    print("\n" + text + " " + query)

    try:
        # tentar executar a query
        cursor.execute(query)
        result = 1
    except Exception as error:
        # em caso de erro, retornar -1
        # exibir erro no terminal
        print("")
        print(error_tag + str(error))
        result = -1  # deu errado

    # formatar esse resultado
    return result


# UPDATE
def update(table, column, value, condition_columns, condition_values):
    """ Requisição CRUD - UPDATE """
    global connection
    global cursor

    print("Executando UPDATE...")

    table = str(table)

    updates = ""
    for index, content in enumerate(column):
        if (index < len(column) - 1):
            updates += str(column[index]) + "=" + "'" + str(value[index]) + "'" + ", "
        else:
            updates += str(column[index]) + "=" + "'" + str(value[index]) + "'"

    # gerar query
    query = "UPDATE " + table + " SET " + updates + " WHERE " + condition_columns[0] + "=" + "'" + condition_values[0] + "'"
    # caso haja mais de uma condição, adicioná-las
    if (len(condition_columns) > 1):
        for index, value in enumerate(condition_columns, start=1):
            query += " AND " + str(condition_columns[index]) + "=" + "'" + str(condition_values[index]) + "'"

    text = colored('QUERY:', 'yellow')
    print("\n" + text + " " + query)

    try:
        # tentar executar a query
        cursor.execute(query)
        result = 1
    except Exception as error:
        # em caso de erro, retornar -1
        # exibir erro no terminal
        print("")
        print(error_tag + str(error))
        result = -1  # deu errado

    # formatar esse resultado
    return result


def run_sql(filename):
    """ Executa todos os comandos de um arquivo .sql """
    global connection
    global cursor

    # ler arquivo SQL em um único buffer
    file = open(filename, 'r')
    sql = file.read()
    file.close()

    # text = colored('Executando ' + filename, 'green')
    # print(text)

    # obter os comandos separando o arquivo por ';'
    commands = sql.split(';')

    # executar todos os comandos
    for command in commands[:-1]:
        if (len(command) > 0):
            command = command + ';'
            try:
                cursor.execute(command)
            except(Exception, psycopg2.DatabaseError) as error:
                print('\n' + error_tag + command)
                print('\n' + str(error))


def run_query(query):
    """ Executa uma query SQL """
    global connection
    global cursor

    try:
        cursor.execute(query)
        result = cursor.fetchall()
        click.echo_via_pager(result)
    except(Exception, psycopg2.DatabaseError) as error:
        print('\n' + error_tag + query + '\n' + str(error))
        prompt()


def setup():
    """ Configura a conexão ao PostgreSQL """
    """ Utiliza arquivo de configuração database.ini """
    global connection
    global cursor

    parser = ConfigParser()
    parser.read('database.ini')

    db = {}
    if parser.has_section('postgresql'):
        params = parser.items('postgresql')
        for param in params:
            db[param[0]] = param[1]
    return db


def connect():
    """ Inicia a conexão ao PostgreSQL """
    global connection
    global cursor

    text = colored('Banco de Dados PostgreSQL', 'green')
    print(text)

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
        text = colored('SUCESSO:', 'green')
        print(text + " Conexão ao banco de dados feita com sucesso. Bem-vindo!")
        cursor.execute('SELECT version()')
        print('Versão: ' + str(cursor.fetchone()))

    except (Exception, psycopg2.DatabaseError) as error:
        print(error_tag + " Conexão ao banco de dados PostgreSQL falhou!")
        print("")
        print(str(error))
        sys.exit()


def test_connection():
    try:
        params = setup()
        conn = psycopg2.connect(**params)
        conn.close()
        return True
    except:
        return False


def main():
    global connection
    global cursor

    # conectar ao banco de dados
    connect()
    cursor.execute('SELECT version()')
    version = str(cursor.fetchone())

    # inicializar banco de dados
    with Halo(text='Inicializando banco...', spinner='dots'):
        run_sql('drop.sql')
        run_sql('initialize.sql')
        run_sql('insert.sql')

    # inicializar interface de linha de comando
    while True:
        os.system('clear')
        print(title)
        if (test_connection()):
            status = colored('[ONLINE]', 'green')
            print(status, end=" ")
            print(version.split(',')[0][2:])
        else:
            status = colored('[OFFLINE]', 'red')
            print(status)
        for index in menu.keys():
            print("[" + str(index) + "] " + menu[index])
        
        user_input = prompt(">> ")

        try:
            int(user_input)
        except Exception as e:
            print(error_tag + "Opção inválida")
            prompt("Pressione ENTER para continuar. ")
        else:
            parse_menu(int(user_input))


if __name__ == '__main__':
    main()
