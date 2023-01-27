SELECT 
Art.nome_artista AS artista,
Al.nome_album AS album
FROM
SpotifyClone.artistas AS Art
INNER JOIN
SpotifyClone.albuns AS Al ON Art.artista_id = Al.artista_id
WHERE Art.nome_artista = "Elis Regina"
ORDER BY album;
