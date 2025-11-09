/*
It’s a bit of a slow day in the office. Though Satchel no longer plays, in 5.sql, write a SQL query to find
all teams that Satchel Paige played for.

Your query should return a table with a single column, one for the name of the teams.
*/

SELECT name FROM teams t
JOIN performances p ON p.team_id = t.id
JOIN players pl ON pl.id = p.player_id
WHERE pl.first_name = 'Satchel'
GROUP BY name;
