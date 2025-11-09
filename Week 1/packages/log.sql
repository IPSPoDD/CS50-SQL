-- *** The Lost Letter ***
SELECT type FROM addresses WHERE address = "900 Somerville Avenue";
-- Lost Letter type. We know where from the package is going so we can finde the type from the addresses db.

 SELECT address FROM addresses
 WHERE id = (
    SELECT to_address_id FROM packages WHERE from_address_id = (
        SELECT id FROM addresses
        WHERE address = "900 Somerville Avenue"
    )
 );
-- Find where the package was dropped. We need to find the address where the package is going to. So by from_address from packages table
-- we know to_address so we can find address of dropping. By finding to_address id from the addresses table.


-- *** The Devious Delivery ***
SELECT type FROM addresses WHERE id = (
    SELECT to_address_id FROM packages WHERE id = (
        SELECT id FROM packages WHERE from_address_id IS NULL)
        );
-- At first finding the packages with no "from" address. Then by using "to_address_id" finding the type from addresses db.SE

SELECT contents FROM packages WHERE from_address_id IS NULL;
-- Finding contents from packages.db whereis no "from" address.

-- *** The Forgotten Gift ***
SELECT contents FROM packages WHERE from_address_id = (
    SELECT id FROM addresses WHERE address LIKE '%109 Tileston Street%'
    );
-- Finding contents by "from" address.

SELECT id FROM packages WHERE from_address_id = (
    SELECT id FROM addresses WHERE address = '109 Tileston Street'
);

SELECT name FROM drivers WHERE id =(
    SELECT driver_id FROM scans WHERE package_id =(
        SELECT id FROM packages WHERE from_address_id = (
            SELECT id FROM addresses WHERE address = '109 Tileston Street'
        )
    )
);
-- In drivers we can find the mailman's name who has the gift. Driver id is found from scans via package id.
