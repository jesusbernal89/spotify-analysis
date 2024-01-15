SELECT
  title,
  MIN(date) AS s_first,
  MAX(date) AS s_last,
  SUM(streams) AS streams,
  DATE_DIFF(MAX(date), MIN(date), DAY) AS Trend,
  DATE_DIFF(MAX(date), MIN(date), DAY) * SUM(streams) AS Duracion_streams
FROM
  `danuproject.danudb.master_table`
GROUP BY
  title
ORDER BY
  duracion_streams DESC;