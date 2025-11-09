CREATE TABLE meteorites_temp (
    name TEXT,
    id INTEGER,
    nametype TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INTEGER,
    lat REAL,
    long REAL,
    PRIMARY KEY (id)
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE meteorites_temp SET name = NULL WHERE name = '';
UPDATE meteorites_temp SET nametype = NULL WHERE nametype = '';
UPDATE meteorites_temp SET class = NULL WHERE class = '';
UPDATE meteorites_temp SET discovery = NULL WHERE discovery = '';

UPDATE meteorites_temp SET mass = NULL WHERE mass = '0' OR mass = '';
UPDATE meteorites_temp SET year = NULL WHERE year = '0' OR year = '';
UPDATE meteorites_temp SET lat = NULL WHERE lat = '0' OR lat = '';
UPDATE meteorites_temp SET long = NULL WHERE long = '0' OR long = '';

UPDATE meteorites_temp SET mass = ROUND(mass, 2) WHERE mass IS NOT NULL;
UPDATE meteorites_temp SET lat = ROUND(lat, 2) WHERE lat IS NOT NULL;
UPDATE meteorites_temp SET long = ROUND(long, 2) WHERE long IS NOT NULL;

DELETE FROM meteorites_temp WHERE nametype = 'Relict';

CREATE TABLE meteorites (
    id INTEGER,
    name TEXT NOT NULL,
    class TEXT NOT NULL,
    mass REAL,
    discovery TEXT NOT NULL CHECK(discovery IN ('Fell', 'Found')),
    year INTEGER,
    lat REAL,
    long REAL,
    PRIMARY KEY(id)
);

INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
SELECT name, class, mass, discovery, year, lat, long
FROM meteorites_temp
WHERE name IS NOT NULL
  AND class IS NOT NULL
  AND discovery IS NOT NULL
  AND discovery IN ('Fell', 'Found')
ORDER BY year, name;

DROP TABLE meteorites_temp;
