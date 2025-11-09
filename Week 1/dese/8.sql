--SELECT
--    name,
--    SUM(pupils)
--FROM
--    districts d
--JOIN expenditures e ON d.id = e.district_id
--ORDER BY
--    name;

SELECT d.name, SUM(e.pupils)
FROM districts d
JOIN expenditures e ON d.id = e.district_id
GROUP BY d.name;
