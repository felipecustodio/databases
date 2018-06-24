SELECT cliente.nome,
  bebida.valor_total as valor_bebidas,
  comida.valor_total as valor_comidas
FROM
  (SELECT 
     codigo, 
     cpf_cliente 
   FROM comanda) comanda
JOIN 
  (SELECT 
     codigo,
     SUM(valor_total) as valor_total 
   FROM venda_bebida 
   group by codigo) bebida
ON bebida.codigo = comanda.codigo
JOIN 
    (SELECT 
       codigo, 
       SUM(valor_total) as valor_total 
     FROM venda_de_comida 
     group by codigo) comida
    ON comanda.codigo = comida.codigo
JOIN 
    (SELECT 
       nome, 
       cpf 
     FROM cliente) cliente
    ON comanda.cpf_cliente = cliente.cpf