SELECT EXTRACT(YEAR FROM air_date) AS year, MIN(air_date) AS first_release_date FROM episodes GROUP BY EXTRACT(YEAR FROM air_date) ORDER BY year;
