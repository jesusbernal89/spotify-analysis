-- Este código genera una métrica llamada duracion_streams la cual tiene como valor
-- la multiplicación de la cantidad de streams por canción y la cantidad de días entre 
-- la fecha de inicio de la canción en el top200 y la fecha de salida.
-- De esta manera se gener

SELECT
  title,
  MIN(date) AS s_first,-- Para visualización, mostramos la fecha de entrada al top 200 
  MAX(date) AS s_last,-- Para visualización, mostramos la fecha de salida al top 200 
  SUM(streams) AS streams, -- Para visualización, mostramos los streams totales por canción
  DATE_DIFF(MAX(date), MIN(date), DAY) AS Trend,-- Calculamos la diferencia entre la fecha inicial y de salida en días
  -- Finalmente hacemos la multiplicación entre la diferencia de días y la cantidad de streams 
  DATE_DIFF(MAX(date), MIN(date), DAY) * SUM(streams) AS Duracion_streams  
FROM
  `danuproject.danudb.master_table`
GROUP BY -- Agrupamiento por titulo de canción
  title
ORDER BY
  duracion_streams DESC; -- Los mostramos en orden descendentes