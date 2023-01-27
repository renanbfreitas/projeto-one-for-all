SELECT 
U.nome AS usuario,
COUNT(H.musica_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(M.duracao_segundos / 60), 2) AS total_minutos
FROM
SpotifyClone.historico_reproducoes AS H 
INNER JOIN SpotifyClone.usuarios AS U ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.musicas AS M ON H.musica_id = M.musica_id
GROUP BY U.nome
ORDER BY U.nome ASC;
