#!/bin/usr/env python3
# -*- coding: utf-8 -*-

import psycopg2
import eel
# https://github.com/ChrisKnott/Eel
# http://www.postgresqltutorial.com/postgresql-python/

# http://localhost:8000/
eel.init('gui')


@eel.expose
def hello_world():
    print("Hello, world!")
    return ("Hello, world!")


eel.start('index.html', size=(800, 800))
