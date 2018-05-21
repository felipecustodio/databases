#!/bin/usr/env python3
# -*- coding: utf-8 -*-

import psycopg2
import eel
from termcolor import colored
# https://github.com/ChrisKnott/Eel
# http://www.postgresqltutorial.com/postgresql-python/

# http://localhost:8000/
eel.init('gui')


@eel.expose
def hello_world():
    text = colored('HELLO, WORLD! ', 'yellow', attrs=['reverse', 'blink'])
    print(text)


text = colored('Databases', 'red', attrs=['reverse', 'blink'])
print(text)

commands = ["INSERT", "SELECT", "ALTER", "DROP"]
text = colored('QUERY: ', 'red', attrs=['reverse', 'blink'])
query = "INSERT INTO JOGA (TIME1, TIME2, CLASSICO) VALUES ('PALMEIRAS', 'palmeiras', 1)"

for word in query.split():
    if (word in commands):
        word = colored(word, 'yellow', attrs=['reverse', 'blink'])
    print(word, end=' ')
print("")


print("Initializing GUI...")
eel.start('index.html', size=(800, 800))
