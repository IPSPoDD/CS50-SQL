CREATE DATABASE linkedin;

USE linkedin;

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    username VARCHAR(128) UNIQUE NOT NULL,
    password VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE schools (
    id INT AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    type ENUM ('Primary', 'Secondary', 'Higher Education') NOT NULL,
    location VARCHAR(128) NOT NULL,
    year_of_founded INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE company (
    id INT AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    industry ENUM ('Technology', 'Education', 'Business') NOT NULL,
    location VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE connections (
    id BIGINT AUTO_INCREMENT,
    user_id INT NOT NULL,
    user_connect_id INT NOT NULL,
    school_id INT,
    start_school DATE,
    end_school DATE,
    degree_school ENUM('BA', 'MA', 'PhD'),
    company_id INT,
    start_company DATE,
    end_company DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (user_connect_id) REFERENCES users (id),
    FOREIGN KEY (school_id) REFERENCES schools (id),
    FOREIGN KEY (company_id) REFERENCES companies (id)
);
