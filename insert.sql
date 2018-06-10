-- INSERTS

-- BAR

INSERT INTO BAR
VALUES ('1');

INSERT INTO BAR
VALUES ('2');

INSERT INTO BAR
VALUES ('3');

INSERT INTO BAR
VALUES ('4');

INSERT INTO BAR
VALUES ('5');

-- FUNCIONARIOS

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.11', '361111111', 'ROBERTO DA SILVA', TO_DATE('10, 03, 1994',
      'DD, MM, YYYY'), 'FUNCIONARIO', '111111111111111', '3000', '1');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.12', '361111112', 'MARIA FONSECA', TO_DATE('10, 12, 1974',
        'DD, MM, YYYY'), 'FUNCIONARIO',  '111111111111112', '3000', '1');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.13', '361111113', 'PAULA CAMPOS', TO_DATE('12, 04, 1987',
        'DD, MM, YYYY'), 'FUNCIONARIO',  '111111111111113', '1000', '2');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.14', '361111114', 'LUIZ BARROS DA SILVA', TO_DATE('02, 11, 1969',
        'DD, MM, YYYY'), 'FUNCIONARIO',  '111111111111114', '3900', '2');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.15', '361111115', 'REGINALDO ALVES PEREIRA', TO_DATE('01, 04, 1976',
        'DD, MM, YYYY'), 'FUNCIONARIO', '111111111111115', '3000', '3');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.16', '361111116', 'MATHEUS LVES PEREIRA', TO_DATE('01, 05, 1996',
        'DD, MM, YYYY'), 'FUNCIONARIO', '111111111111116', '1900', '3');


-- PROPRIETARIO

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.21', '361111121', 'PABLO DA SILVA', TO_DATE('10, 03, 1994',
      'DD, MM, YYYY'), 'PROPRIETARIO', '1');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.22', '361111122', 'PIETRO SILVA', TO_DATE('10, 03, 1996',
       'DD, MM, YYYY'), 'PROPRIETARIO', '2');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.23', '361111123', 'FABIANO MOLINA', TO_DATE('10, 02, 1946',
        'DD, MM, YYYY'), 'PROPRIETARIO', '1');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.24', '361111124', 'CASSICO PEREIRA', TO_DATE('17, 12, 1940',
        'DD, MM, YYYY'), 'PROPRIETARIO', '2');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.25', '361111125', 'JULIANO FANTOZZI', TO_DATE('17, 12, 1998',
        'DD, MM, YYYY'), 'PROPRIETARIO', '2');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.26', '361111126', 'CARLOS CUSTODIO', TO_DATE('17, 12, 1968',
        'DD, MM, YYYY'), 'PROPRIETARIO', '1');


-- CLIENTES

-- DATA ALOCACAO

-- ALOCACAO

-- fantasia

INSERT INTO fantasia
VALUES('1133111111111', 'LEAO', 'MARROM', 'P');
INSERT INTO fantasia
VALUES('1133111111112', 'LEAO', 'MARROM', 'G');

INSERT INTO fantasia
VALUES('1133111111113', 'ANJO', 'BRANCO', 'P');
INSERT INTO fantasia
VALUES('1133111111114', 'ANJO', 'BRANCO', 'M');
INSERT INTO fantasia
VALUES('1133111111115', 'ANJO', 'BRANCO', 'G');

INSERT INTO fantasia
VALUES('1133111111116', 'CAPETA', 'VERMELHO', 'P');
INSERT INTO fantasia
VALUES('1133111111117', 'CAPETA', 'VERMELHO', 'X');

INSERT INTO fantasia
VALUES('1133111111118', 'CAMINHONEIRO', 'BEGE', 'X');
INSERT INTO fantasia
VALUES('1133111111119', 'CAMINHONEIRO', 'BEGE', 'G');
INSERT INTO fantasia
VALUES('1133111111120', 'CAMINHONEIRO', 'BEGE', 'G');

INSERT INTO fantasia
VALUES('1133111111121', 'CORINGA', 'ROXA-VERDE', 'P');
INSERT INTO fantasia
VALUES('1133111111122', 'CORINGA', 'ROXA-VERDE', 'M');
INSERT INTO fantasia
VALUES('1133111111123', 'CORINGA', 'ROXA-VERDE', 'M');

INSERT INTO fantasia
VALUES('1133111112123', 'BATMAN', 'PRETO', 'G');
INSERT INTO fantasia
VALUES('1133111111124', 'BATMAN', 'PRETO', 'M');

INSERT INTO fantasia
VALUES('1133111111125', 'SUPERMAN', 'VERMELHO', 'P');
INSERT INTO fantasia
VALUES('1133111111126', 'SUPERMAN', 'VERMELHO', 'M');
INSERT INTO fantasia
VALUES('1133111111127', 'SUPERMAN', 'VERMELHO', 'G');

INSERT INTO fantasia
VALUES('1133111111128', 'PESCADOR', 'BEGE', 'M');
INSERT INTO fantasia
VALUES('1133111111129', 'PESCADOR', 'BEGE', 'G');

-- FESTA

-- CARNAVAL

-- BALADA

-- COMANDA

-- ALUGUEL

-- PALCO

-- BANDA

INSERT INTO BANDA
VALUES ('ANNITA', TO_DATE('02:00', 'HH:MI'), 'FUNK' ,'30000');

INSERT INTO BANDA
VALUES ('AVIOES DO FORRO', TO_DATE('01:30', 'HH:MI'), 'FORRO' ,'8000');

INSERT INTO BANDA
VALUES ('KEVINHO', TO_DATE('02:00', 'HH:MI'), 'FUNK' ,'39000');

INSERT INTO BANDA
VALUES ('BONDE DO TIGRAO', TO_DATE('03:50', 'HH:MI'), 'FUNK' ,'20500');

INSERT INTO BANDA
VALUES ('MATHEUS E KAUA', TO_DATE('02:00', 'HH:MI'), 'SERTANEJO' ,'11000');

INSERT INTO BANDA
VALUES ('WESLEY SAFADAO', TO_DATE('02:10', 'HH:MI'), 'SERTANEJO' ,'83000');

INSERT INTO BANDA
VALUES ('GUSTAVO LIMA', TO_DATE('01:00', 'HH:MI'), 'SERTANEJO' ,'3000');

INSERT INTO BANDA
VALUES ('LUAN SANTANA', TO_DATE('01:20', 'HH:MI'), 'SERTANEJO' ,'30000');

INSERT INTO BANDA
VALUES ('PABLO VITTAR', TO_DATE('01:30', 'HH:MI'), 'FUNK' ,'30000');

-- SHOW_BANDA

-- CONTRATO_BANDA

-- DJ

INSERT INTO DJ
VALUES ('HENRIQUE LOSCHIAVO', TO_DATE('02:00', 'HH:MI'), '100');

INSERT INTO DJ
VALUES ('ALOK', TO_DATE('02:00', 'HH:MI'), '23000');

INSERT INTO DJ
VALUES ('VEGAS', TO_DATE('01:30', 'HH:MI'), '15000');

INSERT INTO DJ
VALUES ('DAVID GUETTA', TO_DATE('01:50', 'HH:MI'), '30000');

INSERT INTO DJ
VALUES ('MARTIN GARRIX', TO_DATE('02:10', 'HH:MI'), '10000');

INSERT INTO DJ
VALUES ('STEVE AOKI', TO_DATE('03:00', 'HH:MI'), '22000');

INSERT INTO DJ
VALUES ('HARDWELL', TO_DATE('12:50', 'HH:MI'), '1000');

INSERT INTO DJ
VALUES ('CALVIN HARRIS', TO_DATE('01:20', 'HH:MI'), '25000');

-- SHOW_DJ

-- CONTRATO_DJ

-- FOOD-TRUCK
INSERT INTO FOOD_TRUCK
VALUES ('ACB1111', 'DOGAO', 'HOT-DOG', '455.111.111.21');

INSERT INTO FOOD_TRUCK
VALUES ('AAA2221', 'TEMAKI DELICIA', 'COMIDA JAPONESA', '455.111.111.22');

INSERT INTO FOOD_TRUCK
VALUES ('AAA2222', 'CHOURIPAN', 'LANCHE ARTESANAL', '455.111.111.22');

INSERT INTO FOOD_TRUCK
VALUES ('BBB1234', 'LANCHES FABIO', 'LANCHE', '455.111.111.23');

INSERT INTO FOOD_TRUCK
VALUES ('AAB1222', 'GRILL NOTA MIL', 'CHURRASCO', '455.111.111.24');

INSERT INTO FOOD_TRUCK
VALUES ('AAB2222', 'SUCOS NATURAIS', 'SUCO', '455.111.111.24');

INSERT INTO FOOD_TRUCK
VALUES ('AAB3222', 'LARICA MANEIRA', 'LANCHE', '455.111.111.25');

INSERT INTO FOOD_TRUCK
VALUES ('AAB4222', 'MISTAO', 'LANCHE', '455.111.111.25');

INSERT INTO FOOD_TRUCK
VALUES ('AAB5222', 'PIZZA NO CONE', 'PIZZA', '455.111.111.26');

-- PARTICIPACAO

-- COMIDA
INSERT INTO COMIDA
VALUES ('12', 'ACB1111', 'HOT-DOG ALEMAO', '8');

INSERT INTO COMIDA
VALUES ('9', 'ACB1111', 'HOT-DOG BRASILEIRINHO', '6');

INSERT INTO COMIDA
VALUES ('3', 'AAA2221', 'TEMAKI DE NUTELLA', '15');

INSERT INTO COMIDA
VALUES ('5', 'AAA2221', 'TEMAKI DE CHURROS', '20');

INSERT INTO COMIDA
VALUES ('3', 'AAA2222', 'BURGAO ANGUS', '36');

INSERT INTO COMIDA
VALUES ('2', 'AAA2222', 'BURGAO VEGANO TRISTE', '10');

INSERT INTO COMIDA
VALUES ('5', 'BBB1234', 'X MORTADELA', '12');

INSERT INTO COMIDA
VALUES ('7', 'BBB1234', 'X OVO', '11');
INSERT INTO COMIDA
VALUES ('6', 'AAB1222', 'ESPETO FRANGO', '7');

INSERT INTO COMIDA
VALUES ('2', 'AAB1222', 'ESPETO CALABRESA', '8');

INSERT INTO COMIDA
VALUES ('9', 'AAB2222', 'DETOX', '15');

INSERT INTO COMIDA
VALUES ('1', 'AAB2222', 'ABACAXI COM HORTELA', '12');

INSERT INTO COMIDA
VALUES ('6', 'AAB3222', 'SUPER X TUDO', '22');

INSERT INTO COMIDA
VALUES ('8', 'AAB3222', 'X DA CASA ESPECIAL', '25');

INSERT INTO COMIDA
VALUES ('1', 'AAB4222', 'BAURU PLUS', '13');

INSERT INTO COMIDA
VALUES ('9', 'AAB4222', 'MISTO MISERIA', '6');

INSERT INTO COMIDA
VALUES ('12', 'AAB5222', 'QUATRO QUEIJOS', '9');

INSERT INTO COMIDA
VALUES ('7', 'AAB5222', 'PORTUGUESA', '7');
-- REGISTRA_COMIDA

-- DATA_VENDA_COMIDA

-- VENDA_DE_COMIDA

-- BEBIDA

-- REGISTRA_BEBIDA

-- DATA_VENDA_BEBIDA

-- VENDA_BEBIDA
