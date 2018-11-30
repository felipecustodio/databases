SELECT *
FROM
  (SELECT *, t1.sigla AS t1_sigla, t2.sigla AS t2_sigla, regexp_split_to_array(p.placar, 'X') AS placar_arr
  FROM partida AS p
  INNER JOIN time AS t1 ON t1.id = p.time1
  INNER JOIN time AS t2 ON t2.id = p.time2) AS q
WHERE (t1_sigla = 'CAASO' AND q.placar_arr[1] > q.placar_arr[2])
  OR (t2_sigla = 'CAASO' AND q.placar_arr[2] > q.placar_arr[1]);
