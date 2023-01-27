SELECT 
M.nome_musica AS nome, COUNT(H.usuario_id) AS reproducoes
FROM
SpotifyClone.musicas AS M
INNER JOIN
SpotifyClone.historico_reproducoes AS H ON M.musica_id = H.musica_id
INNER JOIN
SpotifyClone.usuarios AS U ON H.usuario_id = U.usuario_id
INNER JOIN
SpotifyClone.planos AS P ON P.plano_id = U.plano_id
WHERE
P.plano = 'gratuito'
OR P.plano = 'pessoal'
GROUP BY M.nome_musica
ORDER BY M.nome_musica;
 