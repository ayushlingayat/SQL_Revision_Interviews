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


