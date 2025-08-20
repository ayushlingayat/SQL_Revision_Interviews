-- Rank Dense Rank important for interviews do it well 

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

select firstname,lastname,salary, row_number() over(order by salary desc ) as rows_numbers from employee;

select firstname,lastname,salary, RANK() over(order by salary desc ) as salary_rank from employee;

select firstname,lastname,salary, DENSE_RANK() over(order by salary desc ) as salary_dense_rank from employee;

-- just like for row_number order by is mandatory compulsary vali cheez
-- vese hee for rank and dense rank order by is mandatory 
-- partion by is optional 
-- until we do ordering what is point of assigning rank,rownumber or dense rank getting thats why compulsary order by 

-- rownumber assign in a row the numbers even if duplicates are there okk 

================================ROW NUMBER==========================================
select firstname,lastname,salary, row_number() over(order by salary desc ) as rows_numbers from employee;

-- row number vala output 
| firstname | salary | row\_num |
| --------- | ------ | -------- |
| A         | 8000   | 1        |
| B         | 7000   | 2        |
| C         | 7000   | 3        |
| D         | 6000   | 4        |

=============================RANK=========================================

select firstname,lastname,salary, RANK() over(order by salary desc ) as salary_rank from employee;

| firstname | salary | salary\_rank |
| --------- | ------ | ------------ |
| A         | 8000   | 1            |
| B         | 7000   | 2            |
| C         | 7000   | 2            |
| D         | 6000   | 4            |

-- In rank 
--when there are duplicates its assign a same rank to them okk just remember that 
-- when tie comes it assign same rank and then skip numbers too see the above table you will understand 
--it will skip some of the rankings where there are duplicates okk 

========================DENSE RANK=========================================

select firstname,lastname,salary, DENSE_RANK() over(order by salary desc ) as salary_dense_rank from employee;

| firstname | salary | salary\_dense\_rank |
| --------- | ------ | ------------------- |
| A         | 8000   | 1                   |
| B         | 7000   | 2                   |
| C         | 7000   | 2                   |
| D         | 6000   | 3                   |

-- when we talk about dense rank it does not skip anything okk 
-- when we get duplicate the behaviour is same as rank but it does not skip the ordering of the numbers here okk 
-- you can see the above table if not understood but by far it is clear 
-- it does not skip any rankings 
-- the numbers are densely align 

-- if data doesnt have duplicates all will give the same output i
-- mean i am telling row number, rank and dense rank will give same output 

-- when there are duplicates we should not use the row number its not recommended 

-- rank - for duplicate same rank is assigned and for the next entry its skip the rank 
-- dense rank - it does not skip any ranks in between 

-- whenever you do not have duplicates use row number 

-- there is some competition suppose
-- I want find the top 3 positions..
-- using the dense rank this will be rank accordingly

Marks  DENSE_RANK  RANK
100 -    1          1
100 -    1          1
98  -    2          3
97  -    3          4
97  -    3          4
96  -    4          6

-- if we are using dense rank 5 people should be awarded 
-- if we are considering rank only 3 people will be awarded 100 marks , 100 marks and 98 marks okk

-- It can be asked what is difference betwenn row nubmer rank and dense rank 




