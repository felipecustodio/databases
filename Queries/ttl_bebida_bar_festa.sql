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
