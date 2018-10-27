-- SCC-240 Bases de Dados 
-- Profa. Elaine Parros Machado de Sousa - 2018/1
-- Laboratório 2 - Exercícios SQL - DML
-- Felipe Scrochio Custódio - 9442688

-- a QA walks into a bar
-- he orders a beer
-- then -1
-- then asdijdfi
-- then 9999999999999

-------- Preparacao: remover todas as tabelas da pratica 1 --------

SELECT * FROM user_tables;

-- Resposta do comando: tablelas selecionadas
-- TABLE_NAME                     TABLESPACE_NAME                CLUSTER_NAME                   IOT_NAME                       STATUS     PCT_FREE   PCT_USED  INI_TRANS  MAX_TRANS INITIAL_EXTENT NEXT_EXTENT MIN_EXTENTS MAX_EXTENTS PCT_INCREASE  FREELISTS FREELIST_GROUPS LOG B   NUM_ROWS     BLOCKS EMPTY_BLOCKS  AVG_SPACE  CHAIN_CNT AVG_ROW_LEN AVG_SPACE_FREELIST_BLOCKS NUM_FREELIST_BLOCKS DEGREE     INSTANCES  CACHE TABLE_LO SAMPLE_SIZE LAST_ANALYZED               PAR IOT_TYPE     T S NES BUFFER_ FLASH_C CELL_FL ROW_MOVE GLO USE DURATION        SKIP_COR MON CLUSTER_OWNER                  DEPENDEN COMPRESS COMPRESS_FOR DRO REA SEG RESULT_
---------------------------- ------------------------------ ------------------------------ ------------------------------ -------- ---------- ---------- ---------- ---------- -------------- ----------- ----------- ----------- ------------ ---------- --------------- --- - ---------- ---------- ------------ ---------- ---------- ----------- ------------------------- ------------------- ---------- ---------- ----- -------- ----------- --------------------------- --- ------------ - - --- ------- ------- ------- -------- --- --- --------------- -------- --- ------------------------------ -------- -------- ------------ --- --- --- -------
-- CORES_UNIFORME                 USERS                                                                                        VALID            10                     1        255                                                                                            YES N                                                                                                                             1          1     N ENABLED                                          NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED NO  NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  NO  DEFAULT
-- DIRETOR                        USERS                                                                                        VALID            10                     1        255                                                                                            YES N          0          0            0          0          0           0                         0                   0          1          1     N ENABLED            0 16/05/18                    NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED YES NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  NO  DEFAULT
-- JOGA                           USERS                                                                                        VALID            10                     1        255          65536     1048576           1  2147483645                                         YES N          0          5            0          0          0           0                         0                   0          1          1     N ENABLED            0 19/05/18                    NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED YES NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  YES DEFAULT
-- JOGADOR                        USERS                                                                                        VALID            10                     1        255                                                                                            YES N          0          0            0          0          0           0                         0                   0          1          1     N ENABLED            0 16/05/18                    NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED YES NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  NO  DEFAULT
-- PARTIDA                        USERS                                                                                        VALID            10                     1        255                                                                                            YES N          0          0            0          0          0           0                         0                   0          1          1     N ENABLED            0 16/05/18                    NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED YES NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  NO  DEFAULT
-- POSICAO_JOGADOR                USERS                                                                                        VALID            10                     1        255                                                                                            YES N          0          0            0          0          0           0                         0                   0          1          1     N ENABLED            0 16/05/18                    NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED YES NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  NO  DEFAULT
-- TIMES                          USERS                                                                                        VALID            10                     1        255          65536     1048576           1  2147483645                                         YES N          0          5            0          0          0           0                         0                   0          1          1     N ENABLED            0 19/05/18                    NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED YES NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  YES DEFAULT
-- UNIFORME                       USERS                                                                                        VALID            10                     1        255                                                                                            YES N          0          0            0          0          0           0                         0                   0          1          1     N ENABLED            0 16/05/18                    NO               N N NO  DEFAULT DEFAULT DEFAULT DISABLED YES NO                  DISABLED YES                                DISABLED DISABLED              NO  NO  NO  DEFAULT

-- 8 linhas selecionadas. 

SELECT 'DROP TABLE '||table_name||' CASCADE CONSTRAINTS;' FROM user_tables;

-- 'DROPTABLE'||TABLE_NAME||'CASCADECONSTRAINTS;'                
------------------------------------------------------------
-- DROP TABLE TIMES CASCADE CONSTRAINTS;
-- DROP TABLE JOGA CASCADE CONSTRAINTS;
-- DROP TABLE PARTIDA CASCADE CONSTRAINTS;
-- DROP TABLE JOGADOR CASCADE CONSTRAINTS;
-- DROP TABLE POSICAO_JOGADOR CASCADE CONSTRAINTS;
-- DROP TABLE DIRETOR CASCADE CONSTRAINTS;
-- DROP TABLE UNIFORME CASCADE CONSTRAINTS;
-- DROP TABLE CORES_UNIFORME CASCADE CONSTRAINTS;

-- 8 linhas selecionadas. 

 DROP TABLE TIMES CASCADE CONSTRAINTS;
 DROP TABLE JOGA CASCADE CONSTRAINTS;
 DROP TABLE PARTIDA CASCADE CONSTRAINTS;
 DROP TABLE JOGADOR CASCADE CONSTRAINTS;
 DROP TABLE POSICAO_JOGADOR CASCADE CONSTRAINTS;
 DROP TABLE DIRETOR CASCADE CONSTRAINTS;
 DROP TABLE UNIFORME CASCADE CONSTRAINTS;
 DROP TABLE CORES_UNIFORME CASCADE CONSTRAINTS;

-- Table TIMES eliminado.
-- Table JOGA eliminado.
-- Table PARTIDA eliminado.
-- Table JOGADOR eliminado.
-- Table POSICAO_JOGADOR eliminado.
-- Table DIRETOR eliminado.
-- Table UNIFORME eliminado.
-- Table CORES_UNIFORME eliminado.

-------- Carregar esquema novo --------
 
-- Table TIME criado.
-- Table JOGA criado.
-- Table PARTIDA criado.
-- Table JOGADOR criado.
-- Table POSICAO_JOGADOR criado.
-- Table DIRETOR criado.
-- Table UNIFORME criado.
 
  
-------- Operações --------

-- a) inserir duas tuplas em cada tabela

---- TIME ----
-- Restrições
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS)
VALUES ('Palmeiras', 'SP', 'abcdefg', 0);
-- ORA-02290: restrição de verificação (F9442688.CK_TIPO) violad

-- Inserir tuplas
INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS)
VALUES ('Palmeiras', 'SP', 'Profissional', 0);
-- 1 linha inserido

INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS)
VALUES ('Corinthians', 'SP', 'Profissional', 0);
-- 1 linha inserido

INSERT INTO TIME (NOME, ESTADO, TIPO, SALDO_GOLS)
VALUES ('Sao Paulo', 'SP', 'Profissional', 0);
-- 1 linha inserido


---- JOGA ----
-- Restrições
INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('Palmeiras', 'Corinthians', 0);
-- ORA-02290: restrição de verificação (F9442688.CK_CLASSICO) violada

INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('LA Lakers', 'Chicago Bulls', 'S');
-- ORA-02291: restrição de integridade (F9442688.FK_TIME2) violada - chave mãe não localizada

-- Inserir tuplas
INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('Palmeiras', 'Corinthians', 'S');
-- 1 linha inserido.

INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('Sao Paulo', 'Palmeiras', 'N');
-- 1 linha inserido.


---- PARTIDA ----
-- Restrições
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL)
VALUES ('', 'Corinthians', TO_DATE('2018/05/23', 'yyyy/mm/dd'), '0x0', 'Pacaembu');
-- ORA-01400: não é possível inserir NULL em ("F9442688"."PARTIDA"."TIME1")

INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL)
VALUES ('Palmeiras', 'Corinthians', TO_DATE('2018/05/23', 'yyyy/mm/dd'), DEFAULT, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
-- ORA-12899: valor muito grande para a coluna "F9442688"."PARTIDA"."LOCAL" (real: 46, máximo: 15)

-- Inserir tuplas
INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL)
VALUES ('Palmeiras', 'Corinthians', TO_DATE('2018/05/23', 'yyyy/mm/dd'), DEFAULT, 'Maracana');
-- 1 linha inserido.

INSERT INTO PARTIDA (TIME1, TIME2, DATA, PLACAR, LOCAL)
VALUES ('Sao Paulo', 'Palmeiras', TO_DATE('2018/05/23', 'yyyy/mm/dd'), DEFAULT, 'Maracana');
-- 1 linha inserido.

---- JOGADOR ----
-- Restrições
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
VALUES ('1111', '1111', 'Felipe', TO_DATE('1990/01/01', 'yyyy/mm/dd'), 'brasileiro', 'Palmeiras');
-- ORA-02290: restrição de verificação (F9442688.CK_CPF) violada

INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
VALUES ('111.111.111-11', '1111', 'Felipe', TO_DATE('1990/01/01', 'yyyy/mm/dd'), 'brasileiro', 'Grifinoria');
-- ORA-02291: restrição de integridade (F9442688.FK_TIME_JOGADOR) violada - chave mãe não localizada

-- Depois de inserir jogador 'Felipe', tentei repetir CPF
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
VALUES ('111.111.111-11', '1111', 'Gabriel', TO_DATE('1990/01/01', 'yyyy/mm/dd'), 'brasileiro', 'Palmeiras');
-- ORA-00001: restrição exclusiva (F9442688.PK_JOGADOR) violada

-- Inserir tuplas
INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
VALUES ('111.111.111-11', '1111', 'Felipe', TO_DATE('1990/01/01', 'yyyy/mm/dd'), 'brasileiro', 'Palmeiras');
-- 1 linha inserido.

INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
VALUES ('222.222.222-22', '1111', 'Gabriel', TO_DATE('1990/01/01', 'yyyy/mm/dd'), 'brasileiro', 'Sao Paulo');
-- 1 linha inserido.

INSERT INTO JOGADOR (CPF, RG, NOME, DATA_NASC, NATURALIDADE, TIME)
VALUES ('333.333.333-33', '1111', 'Henrique', TO_DATE('1990/01/01', 'yyyy/mm/dd'), 'brasileiro', 'Corinthians');
-- 1 linha inserido.


---- POSICAO_JOGADOR ----
-- Restrições
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)
VALUES ('Joao', 'Centroavante');
-- ORA-12899: valor muito grande para a coluna "F9442688"."POSICAO_JOGADOR"."POSICAO" (real: 12, máximo: 10)

-- Inserir tuplas
INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)
VALUES ('111.111.111-11', 'Goleiro');
-- 1 linha inserido.

INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)
VALUES ('222.222.222-22', 'Meia');
-- 1 linha inserido.

INSERT INTO POSICAO_JOGADOR (JOGADOR, POSICAO)
VALUES ('333.333.333-33', 'Atacante');
-- 1 linha inserido.

---- DIRETOR ----
-- Apenas restrições de null
INSERT INTO DIRETOR (TIME, NOME)
VALUES ('Sao Paulo', '');
-- ORA-01400: não é possível inserir NULL em ("F9442688"."DIRETOR"."NOME")

-- Inserir tuplas
INSERT INTO DIRETOR (TIME, NOME)
VALUES ('Palmeiras', 'Roberto');
-- 1 linha inserido

INSERT INTO DIRETOR (TIME, NOME)
VALUES ('Sao Paulo', 'Marina');
-- 1 linha inserido.

---- UNIFORME ----
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL)
VALUES ('Sao Paulo', 'Titular', 'Vermelho');
-- 1 linha inserido.
INSERT INTO UNIFORME (TIME, TIPO, COR_PRINCIPAL)
VALUES ('Palmeiras', 'Titular', 'Verde');
-- 1 linha inserido

-- b) tentar atualizar nome de time com jogador já cadastrado
UPDATE TIME
SET NOME = 'Grifinoria'
WHERE NOME = 'Sao Paulo';
-- ORA-02292: restrição de integridade (F9442688.FK_TIME1) violada - registro filho localizado

-- c) tentar modificar o estado de um time que já tenha um jogador cadastrado
UPDATE TIME
SET ESTADO = 'MT'
WHERE NOME = 'Sao Paulo';
-- Atualizou pois não existem restrições pra estado ou FK
-- 1 linha atualizado.

-- d) tentar modificar o time ao qual um jogador pertence.
---- d.1) com time já cadastrado
UPDATE JOGADOR
SET TIME = 'Corinthians'
WHERE NOME = 'Felipe';
-- 1 linha atualizado.

---- d.2) com time que não foi cadastrado
UPDATE JOGADOR
SET TIME = 'Grifinória'
WHERE NOME = 'Felipe';
-- ORA-02291: restrição de integridade (F9442688.FK_TIME_JOGADOR) violada - chave mãe não localizada

-- e) remover um time qualquer que já tenha pelo menos um jogador e que já tenha participado de algum jogo.





-------- Limpar todas as tabelas --------



-------- Comandos para as consultas Q --------
