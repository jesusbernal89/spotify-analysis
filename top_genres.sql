-- Este código muestra los géneros musicales con más streams a través de la plataforma de Spotify

SELECT track_genre, SUM(streams) AS sum_streams -- Mostramos género musical y la suma total de los streams
FROM `danuproject.danudb.master_table`
GROUP BY track_genre -- Indicamos agrupamiento por género musical
ORDER BY sum_streams DESC
LIMIT 10;