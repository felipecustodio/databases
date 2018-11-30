CREATE TABLE ARBITRO(
    CPF CHAR(15) NOT NULL,
    NOME VARCHAR(15),

    CONSTRAINT PF_ARB PRIMARY KEY (CPF)
);

CREATE TABLE ESPORTE(
    NOME CHAR(20),
    EQUIPAMENTOS TEXT,

    CONSTRAINT PK_ESPORTE PRIMARY KEY (NOME)
);

CREATE TABLE UNIVERSIDADE(
    SIGLA CHAR(15),
    NOME VARCHAR(25),
    RANK INTEGER,

    CONSTRAINT PK_SIGLA PRIMARY KEY (SIGLA)
);

CREATE TABLE TIME(
    ID VARCHAR(15),
    SIGLA CHAR(15) NOT NULL,
    ESPORTE CHAR(20) NOT NULL,
    SEXO CHAR(1) NOT NULL,
    ENDERECO VARCHAR(30),
    RANK INTEGER,
    NRO_JOGADORES INTEGER,
    LOGOTIPO TEXT,
    HOSPEDAGEM VARCHAR(30) NOT NULL,

    CONSTRAINT PK_TIME PRIMARY KEY (ID),
    CONSTRAINT SK_TIME UNIQUE (SIGLA, ESPORTE, SEXO),
    CONSTRAINT FK_SIGLA FOREIGN KEY (SIGLA) REFERENCES UNIVERSIDADE ON DELETE CASCADE,
    CONSTRAINT FK_ESPORTE FOREIGN KEY (ESPORTE) REFERENCES ESPORTE ON DELETE CASCADE
);

CREATE TABLE PARTIDA (
    time1 VARCHAR(15) NOT NULL,
    time2 VARCHAR(15) NOT NULL,
    data_partida date NOT NULL,
    placar CHAR(5) DEFAULT '0X0',
    hora TIME,
    arbitro CHAR(15) NOT NULL,
    CONSTRAINT ck_placar CHECK (PLACAR ~* '[0-9]+X{1}[0-9]+'),
    CONSTRAINT fk_t1 FOREIGN KEY (time1) REFERENCES time ON DELETE CASCADE,
    CONSTRAINT fk_t2 FOREIGN KEY (time2) REFERENCES time ON DELETE CASCADE,
    CONSTRAINT fk_arb FOREIGN KEY (arbitro) REFERENCES arbitro ON DELETE CASCADE,
    CONSTRAINT pk_partida PRIMARY KEY (time1, time2, data_partida)
);

CREATE TABLE JOGADOR(
    CPF CHAR(15) PRIMARY KEY,
    NOME VARCHAR(20),
    NUMERO CHAR(2),
    SEXO CHAR(1)
);

CREATE TABLE PARTICIPACAO(
    ANO DATE,
    TIME VARCHAR(15),
    JOGADOR VARCHAR(20),
    NUMERO CHAR(2),
    POSICAO CHAR(15),

    CONSTRAINT PK_PARTICIPACAO PRIMARY KEY (ANO, TIME, JOGADOR),
    CONSTRAINT FK_JOGADOR FOREIGN KEY (JOGADOR) REFERENCES JOGADOR(CPF)
);
