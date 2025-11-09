/*
the results look quite wonky!
The description column contains descriptions with many line breaks, each of which are printed to your terminal.

In no_descriptions.sql, write a SQL statement to create a view named no_descriptions that includes all of the columns in the
listings table except for description.
*/

CREATE VIEW no_descriptions AS
SELECT id, property_type, host_name, accommodates, bedrooms
FROM listings;
