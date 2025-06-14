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

select * from user where email not like 'piyush%';
select * from user;

select Roll_no as Numbers from user;

--# UPDATE COMMAND IN SQl 

-- update <table_name> set <setting> where <condition>
--if we do not give where condition it will update all the records okk 
update user set Name = 'Ayushi' where id = '1';

select * from user;
select * FROM user WHERE email = 'ayush@example.com';

update user set Followers = Followers+500;

select * from user;

--# DELETE COMMAND IN SQl 

--We can use the DELETE statement with a condition to delete a specific row from a table.use with where clause 

-- delete from <table_name> where <condition>
--deleting single column 
delete from user where Name ="Piyush";
-- enitire column delete hoga


update user set Followers = Followers+200 where id = '3';
-- acutaully id 3 kee 800 followers the humne usmein 200 add krr kee 100 kiye 
-- phir multiple tables koo delete kiya 


--deleting multiple columns here okk 
delete from user where Followers = '1000'
-- yeeh multiple tables delete karega

-- if we do 
-- ########                  delete from tablename                    ###########
-- entire record will be deleted 

delete from user; --> DML Command because it is dealing with the data
-- entire record will be deleted 


--DDL vs DML
--DDL => Data Defination Language -> Deals with table structure
--DML => Data Manipulation Language -> Here we deal with data directly

--some dml commands are insert update and delete
--some ddl commands are create alter drop etc are ddl commands

--truncate also also removes all the records but still it is a DDL command why the answer is below

--truncate internally drops the table and recreate it

truncate table user;



