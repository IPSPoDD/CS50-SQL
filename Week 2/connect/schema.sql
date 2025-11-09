/*
Users
The heart of LinkedIn’s platform is its people. Your database should be able to represent the following information about LinkedIn’s users:

Their first and last name
Their username
Their password
Keep in mind that, if a company is following best practices, application passwords are “hashed.” No need to worry about hashing passwords here, though.

Schools and Universities
LinkedIn also allows for official school or university accounts, such as that for Harvard, so alumni (i.e., those who’ve attended) can identify their affiliation.
Ensure that LinkedIn’s database can store the following information about each school:

The name of the school
The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)
The school’s location
The year in which the school was founded
Companies
LinkedIn allows companies to create their own pages, like the one for LinkedIn itself, so employees can identify their past or current employment with the company.
Ensure that LinkedIn’s database can store the following information for each company:

The name of the company
The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)
The company’s location
Connections
And finally, the essence of LinkedIn is its ability to facilitate connections between people. Ensure LinkedIn’s database can support each of the following connections.

Connections with People
Connections with Schools
Connections with Companies
*/
CREATE TABLE user (
    id INTEGER CHECK(id > 0),
    first_name TEXT,
    last_name TEXT,
    username UNIQUE,
    password TEXT UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE school (
    id INTEGER CHECK(id > 0),
    name TEXT,
    type TEXT,
    location TEXT,
    found_year INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE company (
    id INTEGER CHECK(id > 0),
    name TEXT,
    industry TEXT,
    location TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE connection (
    id INTEGER CHECK(id > 0),
    people_id INTEGER,
    school_id INTEGER,
    company_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES user (id),
    FOREIGN KEY (school_id) REFERENCES school (id),
    FOREIGN KEY (company_id) REFERENCES company (id)
);
