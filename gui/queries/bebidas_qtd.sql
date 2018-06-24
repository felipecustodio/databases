--QUANTO CADA BEBIDA VENDEU E QUANTAS VEZES FOI VENDIDA
  SELECT
  bebida.nome, venda.vendas
FROM (
  SELECT
    nome, codigo_barras
  FROM
    bebida) bebida
JOIN (
    SELECT
      COUNT(codigo_barras) AS vendas,codigo_barras
    FROM
      venda_bebida
     group by codigo_barras) venda
  on venda.codigo_barras = bebida.codigo_barras
