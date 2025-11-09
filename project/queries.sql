-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- How many participants were at the event
SELECT COUNT(id) FROM participations
WHERE event_id = (
    SELECT id FROM event
    WHERE name = 'event_name' -- Here you put event name
);

-- History of a runner
SELECT p.first_name, p.last_name, p.birthday, e.name, e.year, pa.time, pa.mark FROM participations pa
JOIN people p ON p.id = pa.people_id
JOIN event e ON e.id = pa.event_id
WHERE p.id = (
    SELECT id FROM people
    WHERE first_name = '...' AND last_name = '...' -- Here you put runners full name
);

-- Average marathon time on specific event
SELECT e.name, AVG(pa.time) FROM event e
JOIN event e ON e.id = pa.event_id
WHERE e.id = (
    SELECT id FROM event
    WHERE name = '...' -- Here you put event name
);

-- Total amount of participants in 2025
SELECT COUNT(id) FROM participations
WHERE event_id = (
    SELECT id FROM event
    WHERE year = 2025 -- Or any other year
)
GROUP BY id;

-- TOP fastest athlets
SELECT p.first_name, p.last_name, pa.time FROM people p
JOIN participations pa ON pa.people_id = p.id
WHERE gender = '...' -- TOP athletes by gender
GROUP BY pa.time
ORDER BY p.last_name -- Sort by their last name
LIMIT 10; -- TOP 10

-- Events by country
SELECT * FROM event
WHERE country = '...'
ORDER BY year DESC, name; -- Sort by year where the last event will be first and then sort alphabetically by the names

-- In case some runner what to delete informations about himself
DELETE FROM people
WHERE first_name = '...' AND -- Deleting by full name and birthday because there can be a lot of people with the same name.
last_name = '...' AND
birthday = '...'; -- PS. When you sign up fora marathon use agree with terms where usually is writen that you allow to use your personal info so you can't delete your result from results DB.

-- In case when the age group was wrong
UPDATE participations SET age_group = '...' -- Manually put the age group
WHERE people_id = '...' AND
event_id = '...'; -- Change the age group on specific event for specific athlet
