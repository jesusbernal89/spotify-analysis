-- Carga del dataset histórico con todos los registros a granularidad diaria de las reproducciones 
-- en Spotify de las canciones entre 2020-2021
WITH charts_master AS (
  SELECT *, streams / 1000000 AS new_streams -- Creación de la variable new_streams que normaliza los valores a millones
  FROM danuproject.danudb.charts
  WHERE chart = 'top200' -- Filtro para elegir sólo canciones que estuvieron en el top200
    AND date BETWEEN '2020-01-01' AND '2021-12-31' -- Filtro para limitar datos solo entre 2020 y 2021
    AND region != 'Global' -- Filtro para eliminar la region Global y hacer análisis basado sólo en países
 ),

-- Carga del dataset con los códigos y coordenadas de los países del mundo
 countries AS (
  SELECT *
  FROM danuproject.danudb.countries
 ),

-- Carga del dataset con los géneros músicales de cada canción de Spotify de entre 2020-2021
genres AS (
  SELECT *
  FROM danuproject.danudb.genres
 ), 

-- Unión de las 3 tablas para crear un dataset maestro
 join_df as (
SELECT 
  * 
FROM charts_master
-- Unión por las columnas de País del dataset histórico y el de los códigos de los países
LEFT JOIN countries on charts_master.region = countries.Country 
-- Unión por las columnas de Nombre de canción del dataset histórico y el de los géneros músicales
-- así como la unión de las columnas del Nombre del artista de los ya mencionados datasets
LEFT JOIN genres on charts_master.title = genres.track_name AND charts_master.artist = genres.artists)

-- Seleccionamos los datos donde no existan nulos en la columna track_genre
select * from join_df
where track_genre is not null;

