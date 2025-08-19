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


-- Now i want how many people are from each location and average salary at each location 

select location,count(location)as total_location ,avg(salary) as average_all from employee group by location;

select firstname,lastname, location,count(location)as total_location ,avg(salary) as average_all from employee group by location;
-- this will not work here okk remember that 

-- we can try achieving it using a join 
-- what i want actually i am writing here 


-- firstname ,lastname ,location ,total_count ,average salary
select firstname ,lastname ,location ,total_count ,average salary from employee join(select firstname,lastname, location,count(location) as total_count ,avg(salary) as average_salary from employee group by location) temptable on employee.location = temptable.location;

SELECT employee.firstname,
       employee.lastname,
       employee.location,
       temp_table.total_count,
       temp_table.average_salary
FROM employee employee
JOIN (
    SELECT location,
           COUNT(location) AS total_count,
           AVG(salary) AS average_salary
    FROM employee
    GROUP BY location
) temp_table
ON employee.location = temp_table.location;

-- we achieved it using join but any other easy way to do that 

-- we can use over and partion by to achieve it easily 

-- phele sade column liya 
-- phir aggregated column liya 
-- phir over liya uske bracket kee andar naa
-- likh sakhte hum kya group karna hee in our case location tha


select firstname,lastname,location ,count(location) over(partion by location) from employee;

-- hum naa partion by kee sath no aggregated column bhi use kar pare like firstname and lastname but jab hum group by kee sath nhi use kar paa rahe the yeeh advantage hota hee partion by kaa okk humesha yaad rakhna 


-- How the above query internally works is 
-- it partion firstly partion the data using location 
-- after that it will count okk 
-- after that select

-- always remember first we have to do the aggregate function then partion by okk 


select firstname,lastname,location ,count(location) over(partion by location),avg(salary) over(partion by location) from employee;


SELECT
    firstname,
    lastname,
    location,
    COUNT(location) OVER (PARTITION BY location) AS location_count,
    AVG(salary) OVER (PARTITION BY location) AS average_salary
FROM
    employee;

-- use partion by to club non aggregated columns with aggreated columns super useful and handy okk 

