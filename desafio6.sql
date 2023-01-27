SELECT 
MIN(V.valor_plano) AS faturamento_minimo,
MAX(V.valor_plano) AS faturamento_maximo,
ROUND(AVG(V.valor_plano), 2) AS faturamento_medio,
SUM(V.valor_plano) AS faturamento_total
FROM
SpotifyClone.planos AS V
INNER JOIN
SpotifyClone.usuarios AS U ON V.plano_id = U.plano_id;
