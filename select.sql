-- PROPAGANDAS NO SITE DE DIVULGACAO DAS FESTAS

-- BANDAS QUE VAO TOCAR
SELECT BANDA, HORA, DATA
FROM SHOW_BANDA

-- DJ QUE VAO TOCAR
SELECT DJ, HORA, DATA
FROM SHOW_DJ

-- BEBIDAS DISPONIVEIS NA FESTA
SELECT NOME
FROM BEBIDA
WHERE NOME IS NOT NULL

-- COMIDAS DISPONIVEIS NA FESTA (NAO EXIBIR OS VALORES NULL)
SELECT NOME
FROM COMIDA
WHERE NOME IS NOT NULL
