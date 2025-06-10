-- Step 1: Create the database
CREATE DATABASE facebook;

-- Step 2: Use the database
USE facebook;

-- Step 3: Create the 'user' table
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male', 'Female', 'Other'),
    city VARCHAR(50),
    followers INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 4: Insert random data into 'user' table
INSERT INTO user (name, age, email, gender, city, followers)
VALUES 
('Ayush Lingayat', 22, 'ayush@example.com', 'Male', 'Mumbai', 250),
('Sneha Sharma', 25, 'sneha@example.com', 'Female', 'Delhi', 400),
('Ravi Kumar', 19, 'ravi.k@example.com', 'Male', 'Bangalore', 180),
('Meera Jain', 21, 'meera@example.com', 'Female', 'Pune', 300),
('John Doe', 29, 'john@example.com', 'Male', 'New York', 1000),
('Alex Ray', 24, 'alex@example.com', 'Other', 'San Francisco', 150);

-- Step 5: Select Queries

-- a. Select all users
SELECT * FROM user;

-- b. Select users older than 21
SELECT * FROM user WHERE age > 21;

-- c. Select users with more than 200 followers
SELECT * FROM user WHERE followers > 200;

-- d. Get users from Mumbai or Delhi
SELECT * FROM user WHERE city IN ('Mumbai', 'Delhi');

-- e. Get user names and emails only
SELECT name, email FROM user;

-- f. Count total users
SELECT COUNT(*) AS total_users FROM user;

-- g. Average age of users
SELECT AVG(age) AS average_age FROM user;

-- h. Order users by followers descending
SELECT * FROM user ORDER BY followers DESC;

-- i. Group users by gender and count
SELECT gender, COUNT(*) AS count FROM user GROUP BY gender;

-- j. Show most recently created users
SELECT * FROM user ORDER BY created_at DESC LIMIT 3;

--  k. Get unique cities users are from
SELECT DISTINCT city FROM user;

-- l. Rename columns using alias
SELECT 
    name AS user_name, 
    email AS user_email, 
    followers AS total_followers 
FROM user;