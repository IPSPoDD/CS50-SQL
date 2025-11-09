SELECT title FROM episodes WHERE air_date LIKE'%26-12'
OR air_date LIKE'%01-01'
OR air_date LIKE'%12-31'
OR air_date LIKE'%12-30'
OR air_date LIKE'%12-29'
OR air_date LIKE'%12-28'
OR air_date LIKE'%12-27'
OR air_date LIKE'%12-25';

SELECT title FROM episodes WHERE EXTRACT(MONTH FROM air_date) = 12 AND EXTRACT(DAY FROM air_date) BETWEEN 25 AND 31;
