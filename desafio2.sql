SELECT COUNT(M.nome_musica) AS cancoes, 
COUNT(DISTINCT Art.nome_artista) AS artistas, 
COUNT(DISTINCT Al.nome_album) AS albuns
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.albuns AS Al ON Al.album_id = M.album_id
INNER JOIN SpotifyClone.artistas AS Art ON Art.artista_id = Al.artista_id; 
