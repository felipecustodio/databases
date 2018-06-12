-- CLIENTE

INSERT INTO CLIENTE
VALUES ('455.111.111.31', '361111131', 'ARNOLD SCHWARZENEGGER', '1977-07-16', 'CLIENTE');

INSERT INTO CLIENTE
VALUES ('455.111.111.32', '361111132', 'JAY CUTLER', '1955-02-23', 'CLIENTE');

INSERT INTO CLIENTE
VALUES ('455.111.111.33', '361111133', 'BEN PAKULSKI', '1947-11-08', 'CLIENTE');

INSERT INTO CLIENTE
VALUES ('455.111.111.34', '361111134', 'GUNTER SCHLIERKAMP', '1924-05-10', 'CLIENTE');

INSERT INTO CLIENTE
VALUES ('455.111.111.35', '361111135', 'MARKUS RUHL', '1993-03-19', 'CLIENTE');

INSERT INTO CLIENTE
VALUES ('455.111.111.36', '361111136', 'DORIAN YATES', '1976-10-23', 'CLIENTE');

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

-- FUNCIONARIO

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.11', '361111111', 'ROBERTO DA SILVA', '1994-03-10', 'FUNCIONARIO', '111111111111111', '3000', '1');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.12', '361111112', 'MARIA FONSECA', '1974-12-10', 'FUNCIONARIO', '111111111111112', '3000', '1');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.13', '361111113', 'PAULA CAMPOS', '1987-04-12', 'FUNCIONARIO', '111111111111113', '1000', '2');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.14', '361111114', 'LUIZ BARROS DA SILVA', '1969-11-02', 'FUNCIONARIO', '111111111111114', '3900', '2');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.15', '361111115', 'REGINALDO ALVES PEREIRA', '1976-04-01', 'FUNCIONARIO', '111111111111115', '3000', '3');

INSERT INTO FUNCIONARIO
VALUES ('455.111.111.16', '361111116', 'MATHEUS LVES PEREIRA', '1996-05-01', 'FUNCIONARIO', '111111111111116', '1900', '3');

-- PROPRIETARIO

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.21', '361111121', 'PABLO DA SILVA', '1994-03-10', 'PROPRIETARIO', '1');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.22', '361111122', 'PIETRO SILVA', '1996-03-10', 'PROPRIETARIO', '2');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.23', '361111123', 'FABIANO MOLINA', '1946-02-10', 'PROPRIETARIO', '1');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.24', '361111124', 'CASSICO PEREIRA', '1940-12-17', 'PROPRIETARIO', '2');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.25', '361111125', 'JULIANO FANTOZZI', '1998-12-17', 'PROPRIETARIO', '2');

INSERT INTO PROPRIETARIO
VALUES ('455.111.111.26', '361111126', 'CARLOS CUSTODIO', '1968-12-17', 'PROPRIETARIO', '1');

-- DATA_ALOCACAO

--INSERT INTO DATA_ALOCACAO
--VALUES('DIA', 'HORA');

-- ALOCACAO

--INSERT INTO ALOCACAO
--VALUES('CPF_FUNCIONARIO', 'NRO_BALCAO', 'DIA (DATA_ALOCACAO)', 'HORA (DATA_ALOCACAO)', 'COMISSAO');

-- FANTASIA

INSERT INTO FANTASIA
VALUES ('1133111111111', 'LEAO', 'MARROM', 'P');
INSERT INTO FANTASIA
VALUES ('1133111111112', 'LEAO', 'MARROM', 'G');

INSERT INTO FANTASIA
VALUES ('1133111111113', 'ANJO', 'BRANCO', 'P');
INSERT INTO FANTASIA
VALUES ('1133111111114', 'ANJO', 'BRANCO', 'M');
INSERT INTO FANTASIA
VALUES ('1133111111115', 'ANJO', 'BRANCO', 'G');

INSERT INTO FANTASIA
VALUES ('1133111111116', 'CAPETA', 'VERMELHO', 'P');
INSERT INTO FANTASIA
VALUES ('1133111111117', 'CAPETA', 'VERMELHO', 'X');

INSERT INTO FANTASIA
VALUES ('1133111111118', 'CAMINHONEIRO', 'BEGE', 'X');
INSERT INTO FANTASIA
VALUES ('1133111111119', 'CAMINHONEIRO', 'BEGE', 'G');
INSERT INTO FANTASIA
VALUES ('1133111111120', 'CAMINHONEIRO', 'BEGE', 'G');

INSERT INTO FANTASIA
VALUES ('1133111111121', 'CORINGA', 'ROXA', 'P');
INSERT INTO FANTASIA
VALUES ('1133111111122', 'CORINGA', 'ROXA', 'M');
INSERT INTO FANTASIA
VALUES ('1133111111123', 'CORINGA', 'ROXA', 'M');

INSERT INTO FANTASIA
VALUES ('1133111112123', 'BATMAN', 'PRETO', 'G');
INSERT INTO FANTASIA
VALUES ('1133111111124', 'BATMAN', 'PRETO', 'M');

INSERT INTO FANTASIA
VALUES ('1133111111125', 'SUPERMAN', 'VERMELHO', 'P');
INSERT INTO FANTASIA
VALUES ('1133111111126', 'SUPERMAN', 'VERMELHO', 'M');
INSERT INTO FANTASIA
VALUES ('1133111111127', 'SUPERMAN', 'VERMELHO', 'G');

INSERT INTO FANTASIA
VALUES ('1133111111128', 'PESCADOR', 'BEGE', 'M');
INSERT INTO FANTASIA
VALUES ('1133111111129', 'PESCADOR', 'BEGE', 'G');

-- FESTA

INSERT INTO FESTA
VALUES ('2018-12-01', TO_DATE('01:30', 'HH:MI'), 'BALADA', '100');

-- CARNAVAL

-- BALADA

-- COMANDA

INSERT INTO COMANDA
VALUES ('12345111', '455.111.111.31', '100', '1133111111111', '2018-12-01', TO_DATE('01:30', 'HH:MI'));

-- ALUGUEL

INSERT INTO ALUGUEL
VALUES ('12345111', '1133111111122');

-- PALCO

INSERT INTO PALCO
VALUES ('1', TO_DATE('01:15', 'HH:MI'));

INSERT INTO PALCO
VALUES ('2', TO_DATE('01:00', 'HH:MI'));

INSERT INTO PALCO
VALUES ('3', TO_DATE('01:30', 'HH:MI'));

INSERT INTO PALCO
VALUES ('4', TO_DATE('01:45', 'HH:MI'));

INSERT INTO PALCO
VALUES ('5', TO_DATE('02:00', 'HH:MI'));

-- BANDA

INSERT INTO BANDA
VALUES ('ANNITA', TO_DATE('02:00', 'HH:MI'), 'FUNK', '30000');

INSERT INTO BANDA
VALUES ('AVIOES DO FORRO', TO_DATE('01:30', 'HH:MI'), 'FORRO', '8000');

INSERT INTO BANDA
VALUES ('KEVINHO', TO_DATE('02:00', 'HH:MI'), 'FUNK', '39000');

INSERT INTO BANDA
VALUES ('BONDE DO TIGRAO', TO_DATE('03:50', 'HH:MI'), 'FUNK', '20500');

INSERT INTO BANDA
VALUES ('MATHEUS E KAUA', TO_DATE('02:00', 'HH:MI'), 'SERTANEJO', '11000');

INSERT INTO BANDA
VALUES ('WESLEY SAFADAO', TO_DATE('02:10', 'HH:MI'), 'SERTANEJO', '83000');

INSERT INTO BANDA
VALUES ('GUSTAVO LIMA', TO_DATE('01:00', 'HH:MI'), 'SERTANEJO', '3000');

INSERT INTO BANDA
VALUES ('LUAN SANTANA', TO_DATE('01:20', 'HH:MI'), 'SERTANEJO', '30000');

INSERT INTO BANDA
VALUES ('PABLO VITTAR', TO_DATE('01:30', 'HH:MI'), 'FUNK', '30000');

-- SHOW_BANDA

INSERT INTO SHOW_BANDA
VALUES ('BONDE DO TIGRAO', '3', TO_DATE('16:30', 'HH:MI'), '2018-12-01');

INSERT INTO SHOW_BANDA
VALUES ('WESLEY SAFADAO', '2', TO_DATE('19:00', 'HH:MI'), '2018-12-01');

INSERT INTO SHOW_BANDA
VALUES ('AVIOES DO FORRO', '3', TO_DATE('19:00', 'HH:MI'), '2018-12-01');

-- CONTRATO_BANDA

--INSERT INTO CONTRATO_BANDA
--VALUES ('NRO_CONTRATO', TO_DATE('01, 12, 2018', 'DD, MM, YYYY '), 'AVIOES DO FORRO', TO_DATE('19:00', 'HH:MI'), TO_DATE('19:00', 'HH:MI'), '';

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

INSERT INTO SHOW_DJ
VALUES ('1', 'HENRIQUE LOSCHIAVO', TO_DATE('01:00', 'HH:MI'), '2018-12-01');

INSERT INTO SHOW_DJ
VALUES ('1', 'STEVE AOKI', '2018-12-01');

INSERT INTO SHOW_DJ
VALUES ('3', 'DAVID GUETTA', TO_DATE('01:00', 'HH:MI'), '2018-12-01');

-- CONTRATO_DJ

-- FOOD-TRUCK

INSERT INTO FOOD_TRUCK
VALUES ('ACB1111', 'DOGAO', 'HOT - DOG', '455.111.111.21');

INSERT INTO FOOD_TRUCK
VALUES ('AAA2221', 'TEMAKI DELICIA', 'COMIDA JAPONESA', '455.111.111.22');

INSERT INTO FOOD_TRUCK
VALUES ('AAA2222', 'CHOURIPAN', 'LANCHE ARTESANAL', '455.111.111.22');

INSERT INTO FOOD_TRUCK
VALUES ('BBB1234', 'LANCHES FABIO', 'LANCHE', '455.111.111.23');

INSERT INTO FOOD_TRUCK
VALUES ('AAB1222', 'GRILL NOTA MIL ', 'CHURRASCO', '455.111.111.24');

INSERT INTO FOOD_TRUCK
VALUES ('AAB2222', 'SUCOS NATURAIS', 'SUCO', '455.111.111.24');

INSERT INTO FOOD_TRUCK
VALUES ('AAB3222', 'LARICA MANEIRA', 'LANCHE', '455.111.111.25');

INSERT INTO FOOD_TRUCK
VALUES ('AAB4222', 'MISTAO', 'LANCHE', '455.111.111.25');

INSERT INTO FOOD_TRUCK
VALUES ('AAB5222', 'PIZZA NO CONE', 'PIZZA', '455.111.111.26');

-- PARTICIPACAO

--INSERT INTO PARTICIPACAO
--VALUES ('PLACA', 'DIA (CARNAVAL)', 'HORA (CARNAVAL)');

-- COMIDA

INSERT INTO COMIDA
VALUES ('12', 'ACB1111', 'HOT - DOG ALEMAO', '8');

INSERT INTO COMIDA
VALUES ('9', 'ACB1111', 'HOT - DOG BRASILEIRINHO', '6');

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

INSERT INTO REGISTRA_COMIDA
VALUES ('12345111', '6', 'AAB1222');

INSERT INTO REGISTRA_COMIDA
VALUES ('12345111', '3', 'AAA2222');

INSERT INTO REGISTRA_COMIDA
VALUES ('12345111', '7', 'BBB1234');

-- DATA_VENDA_COMIDA

--INSERT INTO DATA_VENDA_COMIDA
--VALUES ('DIA', 'HORA');

-- VENDA_DE_COMIDA

--INSERT INTO VENDA_DE_COMIDA
--VALUES ('NOTA_FISCAL', 'DIA (DATA_VENDA_COMIDA)', 'HORA (DATA_VENDA_COMIDA)', 'CODIGO (REGISTRA_COMIDA)', 'NRO_CARDAPIO (REGISTRA_COMIDA)', 'PLACA (REGISTRA_COMIDA)', 'VALOR_TOTAL');

-- BEBIDA

INSERT INTO BEBIDA
VALUES ('1', '2121211111111', 'PITU', '10');

INSERT INTO BEBIDA
VALUES ('1', '2121211111112', 'COCA', '8');

INSERT INTO BEBIDA
VALUES ('2', '2121211111113', 'VODKA', '20');

INSERT INTO BEBIDA
VALUES ('2', '2121211111114', 'KVAS', '18');

INSERT INTO BEBIDA
VALUES ('3', '2121211111115', 'MORS', '16');

INSERT INTO BEBIDA
VALUES ('3', '2121211111116', 'RYAZHENKA', '22');

INSERT INTO BEBIDA
VALUES ('4', '2121211111117', 'CERVEJA', '9');

INSERT INTO BEBIDA
VALUES ('4', '2121211111118', 'VINHO', '15');

INSERT INTO BEBIDA
VALUES ('5', '2121211111119', 'TEQUILA', '14');

INSERT INTO BEBIDA
VALUES ('5', '2121211111120', 'CHOPP', '12');

-- REGISTRA_BEBIDA

INSERT INTO REGISTRA_BEBIDA
VALUES (12345111, '5', '2121211111120');

INSERT INTO REGISTRA_BEBIDA
VALUES (12345111, '4', '2121211111118');

INSERT INTO REGISTRA_BEBIDA
VALUES (12345111, '1', '2121211111111');

-- DATA_VENDA_BEBIDA

--INSERT INTO DATA_VENDA_BEBIDA
--VALUES ('DIA', 'HORA');

-- VENDA_BEBIDA

--INSERT INTO VENDA_BEBIDA
--VALUES ('NOTA_FISCAL', 'DIA (DATA_VENDA_BEBIDA)', 'HORA (DATA_VENDA_BEBIDA)', 'CODIGO (REGISTRA_BEBIDA)', 'NRO_BALCAO (REGISTRA_BEBIDA)', 'CODIGO_BARRAS (REGISTRA_BEBIDA)', 'VALOR_TOTAL');