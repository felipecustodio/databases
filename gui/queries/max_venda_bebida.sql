--VE BEBIDA QUE MAIS VENDEU, PEGA O NOME, RESOLVE PARA EMPATE
  SELECT
  bebida.nome, cod_max.vendas
FROM
(SELECT
  venda.codigo_barras, venda.vendas
FROM (
  SELECT
    MAX(VENDAS) as vendas
  FROM (
    SELECT
      COUNT(codigo_barras) AS vendas,codigo_barras
    FROM
      venda_bebida
     group by codigo_barras) venda) maximo
  INNER JOIN (
    SELECT
      COUNT(codigo_barras) AS vendas,codigo_barras
    FROM
      venda_bebida
     group by codigo_barras) venda
  ON venda.vendas = maximo.vendas) cod_max
JOIN (
  SELECT
    nome, codigo_barras
  FROM bebida
  ) bebida
ON cod_max.codigo_barras = bebida.codigo_barras

