-- Step 1: Create and use the database
CREATE DATABASE IF NOT EXISTS facebook;
USE facebook;

-- Step 2: Create the user table
CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male', 'Female', 'Other'),
    city VARCHAR(50),
    followers INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Insert sample data
INSERT INTO user (name, age, email, gender, city, followers) VALUES
('Ayush Lingayat', 22, 'ayush@example.com', 'Male', 'Mumbai', 250),
('Sneha Sharma', 25, 'sneha@example.com', 'Female', 'Delhi', 400),
('Ravi Kumar', 19, 'ravi.k@example.com', 'Male', 'Bangalore', 180),
('Meera Jain', 21, 'meera@example.com', 'Female', 'Pune', 300),
('John Doe', 29, 'john@example.com', 'Male', 'New York', 1000),
('Alex Ray', 24, 'alex@example.com', 'Other', 'San Francisco', 150);

-- Step 4: Logical Operators with WHERE

-- 1. AND operator
SELECT * FROM user
WHERE city = 'Delhi' AND age > 21;

-- 2. OR operator
SELECT * FROM user
WHERE city = 'Mumbai' OR city = 'Pune';

-- 3. NOT operator
SELECT * FROM user
WHERE NOT city = 'Bangalore';

-- 4. Combined AND + OR
SELECT * FROM user
WHERE (city = 'Delhi' OR city = 'Mumbai') AND age >= 22;

-- 5. IN operator
SELECT * FROM user
WHERE city IN ('Delhi', 'Mumbai', 'New York');

-- 6. NOT IN operator
SELECT * FROM user
WHERE city NOT IN ('Pune', 'Bangalore');

-- 7. BETWEEN operator
SELECT * FROM user
WHERE age BETWEEN 20 AND 25;

-- 8. LIKE - names starting with 'A'
SELECT * FROM user
WHERE name LIKE 'A%';

-- 9. LIKE - emails ending with '@example.com'
SELECT * FROM user
WHERE email LIKE '%@example.com';

-- 10. IS NULL / IS NOT NULL
-- (Only shows something if city is manually set to NULL)
SELECT * FROM user
WHERE city IS NULL;

SELECT * FROM user
WHERE city IS NOT NULL;

-- Bonus: Using alias with WHERE
SELECT name AS username, followers AS total_followers
FROM user
WHERE followers >= 200 AND city = 'Mumbai';
