SELECT p.time1, p.time2, p.placar
FROM partida AS p, regexp_split_to_array(p.placar, 'X') AS placar_arr
WHERE (p.time1 = 'CA100' AND placar_arr[1] > placar_arr[2])
	OR (p.time2 = 'CA100' AND placar_arr[2] > placar_arr[1]);
