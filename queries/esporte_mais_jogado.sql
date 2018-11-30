
SELECT
	COUNT(T.ESPORTE) AS QUANTIDADE,
	T.ESPORTE
FROM PARTIDA P
JOIN TIME T
ON T.ID = P.TIME1
OR T,ID = P.TIME2
GROUP BY T.ESPORTE
ORDER BY QUANTIDADE DESC
LIMIT 1