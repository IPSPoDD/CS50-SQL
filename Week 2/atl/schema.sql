/*
A passenger, Amelia Earhart, who is 39 years old
An airline, Delta, which operates out of concourses A, B, C, D, and T
A flight, Delta Flight 300, which is expected to depart from ATL on August 3rd, 2023 at 6:46 PM and arrive at BOS on August 3rd, 2023 at 9:09 PM
A check-in for Amelia Earhart, for Delta Flight 300, on August 3rd, 2023 at 3:03 PM
*/

CREATE TABLE passenger (
    id INTEGER CHECK (id > 0),
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE airline (
    id INTEGER CHECK (id > 0),
    name TEXT NOT NULL,
    concourse INTEGER NOT NULL CHECK (concourse IN ('A', 'B', 'C', 'D', 'T')),
    PRIMARY KEY (id)
);

CREATE TABLE flight (
    id INTEGER CHECK (id > 0),
    airline_name TEXT NOT NULL,
    flight_name TEXT NOT NULL,
    depart DEFAULT CURRENT_TIMESTAMP,
    arrive DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY(airline_name) REFERENCES airline(name)
);

CREATE TABLE 'check-in'(
    id INTEGER CHECK (id > 0),
    passenger_id INTEGER,
    flight_id INTEGER,
    depart NUMERIC,
    PRIMARY KEY (id),
    FOREIGN KEY(passenger_id) REFERENCES passenger(id),
    FOREIGN KEY(flight_id) REFERENCES flight(id),
    FOREIGN KEY(depart) REFERENCES flight(depart)
);
