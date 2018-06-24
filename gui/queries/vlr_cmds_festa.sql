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

