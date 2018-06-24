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
