SELECT 
Art.nome_artista AS artista,
Al.nome_album AS album,
COUNT(S.usuario_id) AS seguidores
FROM
SpotifyClone.artistas AS Art
INNER JOIN
SpotifyClone.albuns AS Al ON Art.artista_id = Al.artista_id
INNER JOIN
SpotifyClone.seguindo_artistas AS S ON Art.artista_id = S.artista_id
GROUP BY artista , album
ORDER BY seguidores DESC, artista, album;
