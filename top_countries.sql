-- Este código muestra los países con más streams a través de la plataforma de Spotify

SELECT region, SUM(streams) AS sum_streams -- Mostramos país y la suma total de los streams
FROM `danuproject.danudb.master_table`
GROUP BY region -- Indicamos agrupamiento por país
ORDER BY sum_streams DESC
LIMIT 10;