
create database facebook;

use facebook;

create table user(
id int,
Name varchar(255) not null,
Roll_no int not null,
Followers int not null,
Email varchar(255) not null,
primary key(id)
);

insert into user (id,Name,Roll_no,Followers,Email) values
(1, 'Ayush', 101, 500, 'ayush@example.com'),
(2, 'Piyush', 102, 1200, 'piyush@example.com'),
(3, 'Rushab', 103, 800, 'rushab@example.com'),
(4, 'Rithik', 104, 450, 'rithik@example.com');


-- to describe the table we write 
-- desc table name okk
desc user


-- Structural changes we have to do using the alter command 
-- when we say structure acutaully we are saying schema okk just remember that 
-- update deals with data manipulation 
-- and alter deals with structure manipulation 

-- altering column - altering the schema an adding a column 

-- suppose we have to add phone number column for future use case we can do that using alter 
-- structure changes alter 

---ADD COLUMN SYNTAX 

-- alter table <table name> add column <column name>;
alter table user add column phone_no varchar(255);

-- column add hua but abhi values null show karega okk yeeh kiya toh
select * from user;

-- how to drop the column we made syntax 

-- alter table <table name> drop column <column name>;
alter table user drop column phone_no


-- to modify the column means data type change karna hoo toh  we made syntax like use this

-- alter table <table_name> modify column <column_name>(modify_datatype)
alter table user modify column Email(50);

--to drop primary key use this command 
-- alter table <table_name> drop primary key;
alter table user drop primary key;


how to add primary key to any column 
-- alter table table_name add primary key(column_name)
alter table user add primary key(id);

-- DDL vs DML Command 

