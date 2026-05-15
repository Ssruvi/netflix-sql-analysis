CREATE DATABASE IF NOT EXISTS netflix_analysis;
USE netflix_analysis;
USE netflix_analysis;
SELECT COUNT(*) FROM netflix_titles;

USE netflix_analysis;
TRUNCATE TABLE netflix_titles;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/netflix_titles.csv'
INTO TABLE netflix_titles
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM netflix_titles;
SELECT type, COUNT(*) as total
FROM netflix_titles
GROUP BY type;

SELECT country, COUNT(*) as total 
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 10;

select release_year, count(*) as titles_released
from netflix_titles
group by release_year
order by release_year desc;

select rating, count(*) as count
from netflix_titles
group by rating
order by count desc;

SELECT director, COUNT(*) as total
FROM netflix_titles
WHERE director != ''
GROUP BY director
ORDER BY total DESC
LIMIT 10;

SELECT AVG(CAST(REPLACE(duration, ' min', '') AS UNSIGNED)) as avg_duration_mins
FROM netflix_titles
WHERE type = 'Movie' AND duration LIKE '%min%';

SELECT listed_in, COUNT(*) as total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

SELECT type, COUNT(*) as total
FROM netflix_titles
WHERE release_year > 2019
GROUP BY type;


SELECT country, COUNT(*) as tv_shows
FROM netflix_titles
WHERE type = 'TV Show' AND country != ''
GROUP BY country
ORDER BY tv_shows DESC
LIMIT 10;

SELECT type, COUNT(*) as missing_director
FROM netflix_titles
WHERE director = '' OR director IS NULL
GROUP BY type;