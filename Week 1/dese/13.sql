SELECT name, graduated FROM schools
JOIN graduation_rates ON graduation_rates.school_id = schools.id
GROUP BY graduated ORDER BY graduated LIMIT 25;
