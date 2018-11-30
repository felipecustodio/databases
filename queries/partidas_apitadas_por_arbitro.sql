SELECT p.*
FROM partida AS p
INNER JOIN arbitro AS a ON p.arbitro = a.cpf
WHERE a.nome = 'Arbitro A';
