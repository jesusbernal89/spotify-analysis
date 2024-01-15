SELECT track_genre, SUM(streams) AS sum_streams
FROM `danuproject.danudb.master_table`
GROUP BY track_genre
ORDER BY sum_streams DESC
LIMIT 10;