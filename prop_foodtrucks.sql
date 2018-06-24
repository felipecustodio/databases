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
