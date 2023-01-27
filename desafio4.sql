SELECT 
U.nome AS usuario,
IF(MAX(YEAR(H.historico_reproducao)) >= 2021,
'Usuário ativo',
'Usuário inativo') AS status_usuario
FROM
SpotifyClone.usuarios AS U
INNER JOIN
SpotifyClone.historico_reproducoes AS H ON U.usuario_id = H.usuario_id
GROUP BY usuario
ORDER BY usuario;
