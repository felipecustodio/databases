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