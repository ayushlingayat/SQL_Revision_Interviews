-- Row number mostly asked in interviews prepare well

-- Create the database
CREATE DATABASE office;
USE office;

-- Create the employee table (fixed 'location' column definition)
CREATE TABLE employee (
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    age INT,
    salary FLOAT,
    location VARCHAR(50)
);

-- Inserting 10 employee records
INSERT INTO employee (firstname, lastname, age, salary, location) VALUES 
('Ayush', 'Lingayat', 24, 45000.50, 'Mumbai'),
('Priya', 'Sharma', 28, 52000.00, 'Bangalore'),
('Ravi', 'Kumar', 32, 61000.75, 'Bangalore'),
('Sneha', 'Mehta', 26, 48000.00, 'Pune'),
('Amit', 'Verma', 35, 70000.20, 'Pune'),
('Kiran', 'Patil', 29, 55000.00, 'Chennai'),
('Neha', 'Joshi', 27, 51000.10, 'Kolkata'),
('Rahul', 'Yadav', 31, 62000.60, 'Ahmedabad'),
('Tina', 'Kapoor', 25, 47000.30, 'Ahmedabad'),
('Vikas', 'Singh', 30, 58000.90, 'Jaipur');


-- now we will use the row number just see it carefully 

select firstname,lastname,salary, row_number() over(order by salary desc ) as rows_numbers from employee;

-- what i am telling is sort the salary in desecending order
-- then give the row number from 1 okk aesha mein bol raha 

--=================== IMPORTANT ==============================
--remember row_number() dont work when we are not giving the order by okk 
-- order by is mandatory when we are talking about the row_number()


-- lets say i want to find the 5th Highest salary who can i do that then one trick 
-- is to use the row_number() thing okk 

-- so we can write like this like 

select * from (select firstname,lastname,salary, row_number() over(order by salary desc ) as rows_numbers from employee) temptable where row_numbers = 5;

-- it should be first ordered and then we use row_number order by is mandatory 

-- the problem statement is i want to assign the row numbers for partions based on each location

select firstname,lastname,location,salary, row_number() over(partition by location order by salary desc ) as rows_numbers from employee;

-- Remember group by merges rows 
-- and partion by divide the rows

-- this will be output of above query 
-- | firstname | lastname | salary | row\_numbers |
-- | --------- | -------- | ------ | ------------ |
-- | B         | Kumar    | 8000   | 1            |
-- | A         | Singh    | 6000   | 2            |
-- | C         | Rao      | 4000   | 3            |
-- | F         | Khan     | 9000   | 1            |
-- | D         | Patel    | 7000   | 2            |
-- | E         | Shah     | 5000   | 3            |

-- now problem statement is I want to find out highest salary getters from each location 

(select firstname,lastname,location,salary, row_number() over(partition by location order by salary desc ) as rownums from employee) temptable where rownums = 1;

| firstname | lastname | location | salary |
| --------- | -------- | -------- | ------ |
| B         | Kumar    | Delhi    | 8000   |
| F         | Khan     | Mumbai   | 9000   |


-- whenever we give partion by its start from one we have seen this carefully now 

--what have i understood from here 
-- when we use row_number we should be using the order by clause 
-- we can also use the partion by but you know that it is optional 
-- whenever we use partion by the number again start from 1 for the next partition 
