CREATE TABLE ARBITRO (
    CPF CHAR(15) NOT NULL,
    NOME VARCHAR(15),

    CONSTRAINT PF_ARB PRIMARY KEY (CPF)
);

CREATE TABLE ESPORTE (
    NOME CHAR(20),
    EQUIPAMENTOS TEXT,

    CONSTRAINT PK_ESPORTE PRIMARY KEY (NOME)
);


CREATE TABLE UNIVERSIDADE (
    SIGLA CHAR(20),
    NOME VARCHAR(25),
    RANK INTEGER,

    CONSTRAINT PK_SIGLA PRIMARY KEY (SIGLA)
);

CREATE TABLE TIME (
    ID VARCHAR(20),
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

CREATE TABLE GINASIO (
    ENDERECO VARCHAR(50) NOT NULL,
    CONSTRAINT PK_GINASIO PRIMARY KEY (ENDERECO)
);

CREATE TABLE PARTIDA (
    TIME1 VARCHAR(15) NOT NULL,
    TIME2 VARCHAR(15) NOT NULL,
    DATA_PARTIDA DATE NOT NULL,
    PLACAR CHAR(5) DEFAULT '0X0',
    HORA TIME,
    ARBITRO CHAR(15) NOT NULL,
    ENDERECO VARCHAR(50) NOT NULL,
    CONSTRAINT CK_PLACAR CHECK (PLACAR ~* '[0-9]+X{1}[0-9]+'),
    CONSTRAINT FK_T1 FOREIGN KEY (TIME1) REFERENCES TIME ON DELETE CASCADE,
    CONSTRAINT FK_T2 FOREIGN KEY (TIME2) REFERENCES TIME ON DELETE CASCADE,
    CONSTRAINT FK_ARB FOREIGN KEY (ARBITRO) REFERENCES ARBITRO ON DELETE CASCADE,
    CONSTRAINT FK_GIN FOREIGN KEY (ENDERECO) REFERENCES GINASIO,
    CONSTRAINT PK_PARTIDA PRIMARY KEY (TIME1, TIME2, DATA_PARTIDA)
);

CREATE TABLE JOGADOR (
    CPF CHAR(15) PRIMARY KEY,
    NOME VARCHAR(20),
    NUMERO CHAR(2),
    SEXO CHAR(1)
);

CREATE TABLE PARTICIPACAO (
    ANO DATE,
    TIME VARCHAR(20),
    JOGADOR VARCHAR(15),
    NUMERO CHAR(2),
    POSICAO CHAR(15),

    CONSTRAINT PK_PARTICIPACAO PRIMARY KEY (ANO, TIME, JOGADOR),
    CONSTRAINT FK_JOGADOR FOREIGN KEY (JOGADOR) REFERENCES JOGADOR(CPF),
    CONSTRAINT FK_TIME FOREIGN KEY (TIME) REFERENCES TIME(ID)
);
