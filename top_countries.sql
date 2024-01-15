SELECT region, SUM(streams) AS sum_streams
FROM `danuproject.danudb.master_table`
GROUP BY region
ORDER BY sum_streams DESC
LIMIT 10;