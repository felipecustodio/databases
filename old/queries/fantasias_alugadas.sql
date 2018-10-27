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
    comanda.codigo = aluguel.codigo ) aluguel_comanda
ON
  fantasia.codigo_barras = aluguel_comanda.codigo_fantasia
