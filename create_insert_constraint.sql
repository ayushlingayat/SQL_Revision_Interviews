CREATE DATABASE college;

USE college;

CREATE TABLE students(
Name varchar(255),
Roll_no int,
Age int,
Marks float,
Gender varchar(255)
);

INSERT INTO students VALUES("Ayush",37,24,80.45,"Male");
INSERT INTO students VALUES("Piyush",38,28,94.03,"Male");
INSERT INTO students VALUES("Ayushi",24,24,99.33,"Female");

SELECT * from students;

SHOW TABLES;

DROP TABLE students; 

CREATE DATABASE IF NOT EXISTS instagram;

DROP DATABASE IF EXISTS instagram;

SHOW DATABASES;

DROP DATABASE college;

USE college;

CREATE TABLE students(
Name VARCHAR(255) NOT NULL,
Email VARCHAR(255) UNIQUE,
Roll_no int NOT NULL,
Marks float DEFAULT 0.0,
Age int,
PRIMARY KEY(Roll_no),
CONSTRAINT CHECK(Age>=18)
);

SHOW DATABASES;

CREATE DATABASE Instagram;

use Instagram;

CREATE TABLE user(
id INT,
age INT,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
followers INT DEFAULT 0,
following INT,
CONSTRAINT CHECK(age >= 13),
PRIMARY KEY(id)
);

CREATE TABLE post(
id INT,
content VARCHAR(100),
user_id INT,
PRIMARY KEY(id),
FOREIGN KEY (user_id) REFERENCES user(id)
);