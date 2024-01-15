WITH charts_master AS (
  SELECT *, streams / 1000000 AS new_streams
  FROM danuproject.danudb.charts
  WHERE chart = 'top200'
    AND date BETWEEN '2020-01-01' AND '2021-12-31'
    AND region != 'Global'
 ),

 countries AS (
  SELECT *
  FROM danuproject.danudb.countries
 ),

genres AS (
  SELECT *
  FROM danuproject.danudb.genres
 ), 

 join_df as (
SELECT 
  * 
FROM charts_master
LEFT JOIN countries on charts_master.region = countries.Country
LEFT JOIN genres on charts_master.title = genres.track_name AND charts_master.artist = genres.artists)

select * from join_df
where track_genre is not null;
