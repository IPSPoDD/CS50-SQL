# Design Document

Project name        Marathon through the ages
By                  Aleksandra Bondaruk
GitHub username     IPSPoDD
edX username        AB_2508_LY6R
City and country    Tallinn, Estonia

Entity Relationship Diagram
![ERD](ERD.png)

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
Marathon result of all road marathons (42.2K/26.2M) in the World. This DB will help to analyse marathon runners. How many participents there are, most/least popular age groups, male/female, which country citizens participate more/less, TOP athlets, average slot cost, fast/slow marathons etc.

* Which people, places, things, etc. are you including in the scope of your database?
Participants (fullname, country, birthday, age, gender) and marathon events (name, country, price, date, number of participants, number of DNF, DNS, DQ)

* Which people, places, things, etc. are *outside* the scope of your database?

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
Analyse marathon runners world, how popular it is. This DB will help to get to know where and when in the next year can orginize marathons. Also it will help sports team to find newmembers all over the World.
And in a time it will show the progress in running (how humans push their borders). Also it is possible create "betting on running".

* What's beyond the scope of what a user should be able to do with your database?
Track their own results, if user is a runner he could plan his next running season (choose where and when to perform).

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
People - those who participate in marathons
Event - for marathons
Participations - connects people with events, shows runners marathon time

* What attributes will those entities have?
- people
    id INTEGER AUTO_INCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birthday NUMERIC NOT NULL,
    gender TEXT CHECK(gender IN ('male', 'female')) NOT NULL,
    country TEXT NOT NULL,
    PRIMARY KEY (id)

- event
    id INTEGER AUTO_INCREMENT,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    city TEXT NOT NULL,
    year INTEGER NOT NULL,
    date NUMERIC NOT NULL,
    price REAL NOT NULL,
    PRIMARY KEY (id)

- participations
    id INTEGER AUTO_INCREMENT,
    people_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    time NUMERIC NOT NULL, -- marathon time
    gender TEXT NOT NULL,
    age_group TEXT NOT NULL, -- 15-19, 20-24, 25-29 etc.
    mark TEXT CHECK (mark IN ('DNF', 'DQ', 'DNS')),
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (event_id) REFERENCES event(id)

* Why did you choose the types you did?
This information is enough to conduct an analysis.

* Why did you choose the constraints you did?
NOT NULL because if there will be empty cells the analys wouldn't be full and correct.
NUMERIC for dates and times.
INTEGER for ids, age.
TEXT for names.
REAL - for price because it can be a float number.

### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

3 tables:
- People
- Marathons
- Participations (who and where participated i.e people.id - marathon.id, their time, DNF/DNS/DQ)

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
Indexes for marathons name. It would be easier to do a conclusion on each event.
Participation by people id. Every runner can find all his running history.

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
For now the DB can't calculate the age group (probably need to add some function where ('event year' - 'birthday')).
Also there is no option to bulk import of results. One of the option is to use command (.import --csv --skip result.csv participations) but when to do this you have to convert names into ids and also calculate age group.

* What might your database not be able to represent very well?
Marathon difficulty and index of pleasure. Difficulty depends on weather (it's difficult or impossible to predict). Index of pleasure depends on people who have emotions at the finnish line and this emotions can influence the index of pleasure.
