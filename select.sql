  -- PROPAGANDAS NO SITE DE DIVULGACAO DAS FESTAS
  -- BANDAS QUE VAO TOCAR
SELECT
  BANDA,
  HORA,
  DATA
FROM
  SHOW_BANDA
  -- DJ QUE VAO TOCAR
SELECT
  DJ,
  HORA,
  DATA
FROM
  SHOW_DJ
  -- BEBIDAS DISPONIVEIS NA FESTA
SELECT
  NOME
FROM
  BEBIDA
WHERE
  NOME IS NOT NULL
  -- COMIDAS DISPONIVEIS NA FESTA (NAO EXIBIR OS VALORES NULL)
SELECT
  NOME
FROM
  COMIDA
WHERE
  NOME IS NOT NULL
  --CLIENTE E TOTAL GASTO
SELECT
  cliente.nome,
  cliente.cpf,
  comanda.valor_total
FROM (
  SELECT
    nome,
    cpf
  FROM
    cliente) cliente
JOIN (
  SELECT
    valor_total,
    cpf_cliente
  FROM
    comanda) comanda
ON
  comanda.cpf_cliente = cliente.cpf
  --CLIENTE E TOTAL GASTO EM DIA ESPECIFICO (TROCAR DATA, POSSIBILIDADE DE FAZER QUERY DINAMICA)
SELECT
  cliente.nome,
  cliente.cpf,
  comanda.valor_total
FROM (
  SELECT
    nome,
    cpf
  FROM
    cliente) cliente
JOIN (
  SELECT
    valor_total,
    cpf_cliente
  FROM
    comanda
  WHERE
    dia_festa = '2018-12-01') comanda
ON
  comanda.cpf_cliente = cliente.cpf
  --LISTAR TODAS AS FANTASIAS ALUGADAS
SELECT
  fantasia.nome
FROM (
  SELECT
    nome,
    codigo_barras
  FROM
    fantasia) fantasia
JOIN (
  SELECT
    aluguel.codigo_fantasia
  FROM (
    SELECT
      codigo_fantasia,
      codigo
    FROM
      aluguel) aluguel
  JOIN (
    SELECT
      codigo
    FROM
      comanda) comanda
  ON
    comanda.codigo = aluguel.codigo ) alugel_comanda
ON
  fantasia.codigo_barras = alugel_comanda.codigo_fantasia
  -- LISTAR TODAS AS FANTASIAS ALUGADAS E O RESPECTIVO CLIENTE
SELECT
  fantasia.nome,
  alugel_comanda_cliente.nome
FROM (
  SELECT
    nome,
    codigo_barras
  FROM
    fantasia) fantasia
JOIN (
  SELECT
    aluguel.codigo_fantasia,
    comanda_cliente.nome
  FROM (
    SELECT
      codigo_fantasia,
      codigo
    FROM
      aluguel) aluguel
  JOIN (
    SELECT
      comanda.codigo,
      cliente.nome
    FROM (
      SELECT
        codigo,
        cpf_cliente
      FROM
        comanda) comanda
    JOIN (
      SELECT
        nome,
        cpf
      FROM
        cliente) cliente
    ON
      cliente.cpf = comanda.cpf_cliente) comanda_cliente
  ON
    comanda_cliente.codigo = aluguel.codigo) alugel_comanda_cliente
ON
  fantasia.codigo_barras = alugel_comanda_cliente.codigo_fantasia
  --VALOR TOTAL DAS COMANDAS DE CADA FESTA
SELECT
  festa.dia AS dia,
  festa.tipo AS tipo,
  SUM(comanda.valor_total) AS valor_total
FROM (
  SELECT
    dia,
    tipo
  FROM
    festa) festa
JOIN (
  SELECT
    dia_festa,
    valor_total
  FROM
    comanda) comanda
ON
  comanda.dia_festa = festa.dia
GROUP BY
  dia,
  tipo
  --VALOR TOTAL DE VENDAS DE BEBIDA EM UM DETERMINADO BAR, EM DETERMINADA FESTA
SELECT
  festa.dia AS dia,
  festa.tipo AS tipo,
  SUM(venda_bebida.valor_total) AS valor_total
FROM (
  SELECT
    dia,
    tipo
  FROM
    festa
  WHERE
    dia = '2018-12-01') festa
JOIN (
  SELECT
    dia,
    valor_total,
    nro_balcao
  FROM
    venda_bebida
  WHERE
    nro_balcao = '1') venda_bebida
ON
  venda_bebida.dia = festa.dia
GROUP BY
  festa.dia,
  tipo
  --LISTAR PROPRIETARIOS E SEUS FOOD TRUCKS
SELECT
  proprietario.nome AS Prorietario,
  f.nome AS Food_Truck
FROM (
  SELECT
    cpf,
    nome
  FROM
    proprietario) proprietario
LEFT JOIN (
  SELECT
    proprietario,
    nome
  FROM
    food_truck) f
ON
  proprietario.cpf = f.proprietario