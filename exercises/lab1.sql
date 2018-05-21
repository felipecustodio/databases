-- SCC-240 Bases de Dados
-- Profa. Elaine Parros Machado de Sousa - 2018/1
-- Laboratório 1 - Exercícios SQL
-- Felipe Scrochio Custódio - 9442688

-- TIME estava marcado como palavra reservada
-- na sintaxe do SQL

CREATE TABLE TIMES (
	NOME VARCHAR2(30) NOT NULL PRIMARY KEY,
	ESTADO CHAR(2),
	TIPO VARCHAR2(12),
	CONSTRAINT CHECK_TIPO CHECK (TIPO IN ('Amador', 'Profissional')),
	SALDO_GOLS NUMBER
);

CREATE TABLE JOGA (
	TIME1 VARCHAR(30) NOT NULL,
	TIME2 VARCHAR2(30) NOT NULL,
	CLASSICO NUMBER(1,0), -- Booleano
	-- Setar chaves primárias
	CONSTRAINT PK_JOGA
		PRIMARY KEY(TIME1, TIME2),
	-- Referenciar chaves estrangeiras
	CONSTRAINT FK1_JOGA
		FOREIGN KEY (TIME1) REFERENCES TIMES(NOME) ON DELETE CASCADE,
	CONSTRAINT FK2_JOGA
		FOREIGN KEY (TIME2) REFERENCES TIMES(NOME) ON DELETE CASCADE,
	-- Checar que os times são diferentes
	CONSTRAINT TIMES_DIFERENTES CHECK (TIME1 != TIME2)
);

-- LOCAL e DATA estavam marcados como palavras reservadas
-- na sintaxe do SQL.
CREATE TABLE PARTIDA (
	TIME1 VARCHAR(30) NOT NULL,
	TIME2 VARCHAR(30) NOT NULL,
	DATA_PARTIDA DATE NOT NULL,
	PLACAR_1 NUMBER(1) DEFAULT 0,
	PLACAR_2 NUMBER(1) DEFAULT 0,
	LOCAL_PARTIDA CHAR(50),
	-- Setar chave primária
	CONSTRAINT PK_PARTIDA
		PRIMARY KEY (TIME1, TIME2, DATA_PARTIDA),
	-- Referenciar chaves estrangeiras
	CONSTRAINT FK_PARTIDA
		FOREIGN KEY (TIME1, TIME2) REFERENCES JOGA(TIME1, TIME2) ON DELETE CASCADE
);

CREATE TABLE JOGADOR (
	CPF CHAR(14) NOT NULL,
	RG CHAR(8) NOT NULL,
	NOME VARCHAR2(30) NOT NULL,
	DATA_NASC DATE,
	NATURALIDADE VARCHAR2(30),
	TIME_ATUAL VARCHAR2(30) NOT NULL,

	-- Chave primária
	CONSTRAINT PK_JOGADOR
		PRIMARY KEY(CPF),
	-- Chave secundária (candidatas)
	CONSTRAINT PK2_JOGADOR
		UNIQUE (RG, NOME),
	-- Referenciar chave estrangeira
	CONSTRAINT FK_JOGADOR
		FOREIGN KEY (TIME_ATUAL) REFERENCES TIMES(NOME)
		ON DELETE CASCADE
);

CREATE TABLE POSICAO_JOGADOR (
	JOGADOR CHAR(14) NOT NULL,
	POSICAO CHAR(10) NOT NULL, -- maior nome: 'meio campo'

	-- Chave primária
	CONSTRAINT PK_POSICAO_JOGADOR
		PRIMARY KEY (JOGADOR, POSICAO),
	-- Chave estrangeira
	CONSTRAINT FK_POSICAO_JOGADOR
		FOREIGN KEY (JOGADOR) REFERENCES JOGADOR(CPF)
		ON DELETE CASCADE
);

CREATE TABLE DIRETOR (
	TIME_ATUAL VARCHAR2(30) NOT NULL,
	NOME VARCHAR2(30) NOT NULL,
	-- Chave primária
	CONSTRAINT PK_DIRETOR
		PRIMARY KEY (TIME_ATUAL, NOME),
	-- Chave estrangeira
	CONSTRAINT FK_DIRETOR
		FOREIGN KEY (TIME_ATUAL) REFERENCES TIMES(NOME)
		ON DELETE CASCADE
);

CREATE TABLE UNIFORME (
	NOME_TIME VARCHAR(30) NOT NULL,
	TIPO VARCHAR2(12),
	CONSTRAINT CHECK_TIPO_UNIFORME CHECK (TIPO IN ('titular', 'reserva')),
	COR_PRINCIPAL VARCHAR(30) NOT NULL,
	-- Chave primária
	CONSTRAINT PK_UNIFORME
		PRIMARY KEY (NOME_TIME, TIPO),
	-- Chave estrangeira
	CONSTRAINT FK_UNIFORME
		FOREIGN KEY (NOME_TIME) REFERENCES TIMES(NOME)
		ON DELETE CASCADE
);

-- Todas as tabelas foram criadas com sucesso

-- Inserções para teste

-- Testar restrição de tipo de time
INSERT INTO TIMES (NOME, ESTADO, TIPO, SALDO_GOLS)
VALUES ('PALMEIRAS', 'SP', 'PROFISSIONAL', 0);
-- ORA-02290: check constraint (F9442688.CHECK_TIPO) violated
-- Erro: criei a restrição imaginando que seria case-insensitive!
-- Solução: completar a restrição CHECK_TIPO

-- Times para teste
INSERT INTO TIMES (NOME, ESTADO, TIPO, SALDO_GOLS)
VALUES ('PALMEIRAS', 'SP', 'Profissional', 0);

INSERT INTO TIMES (NOME, ESTADO, TIPO, SALDO_GOLS)
VALUES ('SAO PAULO', 'SP', 'Profissional', 0);

-- Testar inserção de jogo com time que não existe
INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('PALMEIRAS', 'CORINTHIANS', 1)
-- Restrição funcionou:
-- ORA-02291: integrity constraint (F9442688.FK2_JOGA) violated - parent key not found

-- Testar inserção de jogo com time repetido
INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('PALMEIRAS', 'PALMEIRAS', 1)
-- Restrição funcionou:
-- ORA-02290: check constraint (F9442688.TIMES_DIFERENTES) violated

-- Testar mesma restrição, mas agora com case diferente
INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('PALMEIRAS', 'palmeiras', 1)
-- ORA-02291: integrity constraint (F9442688.FK2_JOGA) violated - parent key not found
-- Erro: PALMEIRAS != palmeiras, porém palmeiras não existe
-- Solução: Quando inserir nome, sempre jogar para lower ou upper case?

-- Criar jogo para testar partida
INSERT INTO JOGA (TIME1, TIME2, CLASSICO)
VALUES ('PALMEIRAS', 'SAO PAULO', 1)




-- Alterações
-- a) Mudar cor_principal para multivalorado
-- b) Inserir atributo atomico endereço na tabela jogador que pode ser nulo
-- c) Inserir atributo atomico na tabela jogador com valor default
-- d) Remover atributo CPF da tabela jogador
