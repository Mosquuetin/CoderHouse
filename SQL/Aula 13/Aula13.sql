-- Quantos artistas, músicas e playlists existem?;
select count(distinct track_artist)as 'total artistas', 
count(distinct track_name) as 'total musicas',
count(distinct playlist_id) as 'total playlists'
from spotify_songs;

-- Quais os 5 artistas com a maior média de popularidade?
SELECT track_artist, AVG(track_popularity) as avg_popularity
FROM spotify_songs
group by 1
order by 2 desc
limit 5; 

-- Qual a popularidade das músicas do artista onde a média de duração de suas músicas é superior a 3 min?
-- 1. Pegar artista que tem a média superior a 3 min
-- 2. Trazer os artistas para a cláusula where e uscar o artista, as musicas e a popularidade dessa musica
SELECT track_artist, -- 2.
track_name, 
track_popularity
FROM spotify_songs
WHERE track_artist IN ( -- 1. 
					  SELECT track_artist
					  FROM spotify_songs
					  GROUP BY 1
					  HAVING AVG(duration_ms) > 180000 -- 3 min 
					  ) 
order by 3 desc;

-- Quais as músicas com popularidade acima da média?
SELECT track_name, track_popularity
FROM spotify_songs
WHERE track_popularity > (SELECT AVG(track_popularity) FROM spotify_songs)
order by 2 desc;

-- Contar quantas músicas estão em cada playlis
SELECT playlist_name, COUNT(*) as num_songs
FROM spotify_songs
GROUP BY playlist_name
ORDER BY 2 desc;

--  Encontrar a playlist com a maior quantidade de músicas
SELECT playlist_name, COUNT(distinct track_name) as num_songs
FROM spotify_songs
GROUP BY playlist_name
ORDER BY num_songs DESC
LIMIT 2;

--  Calcular a média de energia em músicas com popularidade superior a 80
SELECT AVG(energy) as avg_energy
FROM spotify_songs
WHERE track_popularity > 80;



