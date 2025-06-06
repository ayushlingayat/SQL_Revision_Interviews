
create database students;
show databases;

-- if we want to go to certain database we use this
-- USE <database_name>;
USE students;

-- How do i know in which database I am use this 
SECECT database();


-- used to drop the database
-- drop database <database_name>

-- create table database.<table_name> bhi use krr sakhte hum okk 
create table employee(
    Name varchar(255),
    age int,
    salary float,
    Domain varchar(255)
);

show tables;
--this will show the table in student database that we created okk 

--to see structure of table write like this 
-- describe <table_name>
describe employee;

--desc employee also works the same way okk just remember that 

-- to drop the table we can use this 
-- drop table <table_name>
drop table employee;


--Inserting into the database 

-- insert into <table_name> values("Ayush", 24, 10000, "Data Engineering");
insert into Students values("Ayush", 24, 10000, "Data Engineering");
insert into Students values("Ayushi", 27, 13000, "Devops Engineer");
insert into Students values("Rohan", 29, 16000, "Python Developer");
insert into Students values("Harry", 45, 20000, "Java Developer");

-- using default constraint primary key and check thing here 
create table students(
    Roll_no int not null,
    Name varchar(255) not null,
    marks float default 0.0,
    age int default 18,
    primary key(Roll_number),
    check(Age > = 18)
)