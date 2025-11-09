--SELECT name
--FROM schools s
--JOIN expenditures e ON s.id = e.id
--WHERE pupils ORDER BY pupils LIMIT 1;

SELECT name FROM expenditures e
JOIN districts d ON e.district_id = d.id
GROUP BY d.id, d.name
ORDER BY SUM (e.pupils) LIMIT 1;
