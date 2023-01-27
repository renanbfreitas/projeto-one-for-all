SELECT 
COUNT(H.musica_id) AS quantidade_musicas_no_historico
FROM
SpotifyClone.historico_reproducoes AS H
INNER JOIN
SpotifyClone.usuarios AS U ON U.usuario_id = H.usuario_id
WHERE U.nome = "Barbara Liskov";
