-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

/*
At first we need to collect main information about people.
When you participate in marathons you obliged to provide this information.
*/
CREATE TABLE people (
    id INTEGER AUTO_INCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birthday NUMERIC NOT NULL,
    gender TEXT CHECK(gender IN ('male', 'female')) NOT NULL,
    country TEXT NOT NULL, -- Citizen of what country athlet is
    PRIMARY KEY (id)
);

/*
Now we need to create DB of events.
*/

CREATE TABLE event (
    id INTEGER AUTO_INCREMENT,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    city TEXT NOT NULL,
    year INTEGER NOT NULL,
    date NUMERIC NOT NULL,
    price REAL NOT NULL, -- Here is important to decide in what currency it will be or add some converter
    PRIMARY KEY (id)
);

/*
Now we need table where we can find all the information about number of particinats their results. Just connect runners and events.
*/

CREATE TABLE participations (
    id INTEGER AUTO_INCREMENT,
    people_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    time NUMERIC NOT NULL, -- marathon time
    gender TEXT NOT NULL,
    age_group TEXT NOT NULL, -- 15-19, 20-24, 25-29 etc.
    mark TEXT CHECK (mark IN ('DNF', 'DQ', 'DNS')), -- Check if runner didn't started/finnished or was disqualified
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (gender) REFERENCES people(gender),
    FOREIGN KEY (event_id) REFERENCES event(id),
);


/*
Indexes for faster queries. Info about specific marathon.
*/

CREATE INDEX marathon ON event (name);

/*
Indexes for faster queries. Info about specific participation.
*/

CREATE INDEX participant ON participation (people_id);
