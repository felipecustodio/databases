SELECT 
  COUNT(*) as Quantidade,
  POSICAO
FROM PARTICIPACAO 
GROUP BY POSICAO
ORDER BY Quantidade DESC