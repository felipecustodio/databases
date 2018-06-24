  -- LISTAR TODAS AS FANTASIAS ALUGADAS E O RESPECTIVO CLIENTE
SELECT
  fantasia.nome,
  aluguel_comanda_cliente.nome
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
    comanda_cliente.codigo = aluguel.codigo) aluguel_comanda_cliente
ON
  fantasia.codigo_barras = aluguel_comanda_cliente.codigo_fantasia

