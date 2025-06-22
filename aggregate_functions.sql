create database studentdb;

use studentdb;

CREATE TABLE students (
  student_id INT AUTO_INCREMENT,
  student_f_name VARCHAR(30) NOT NULL,
  student_l_name VARCHAR(30) NOT NULL,
  student_m_name VARCHAR(30),
  student_email VARCHAR(30) NOT NULL,
  phone_number VARCHAR(30) NOT NULL,
  alt_phone_number VARCHAR(30),
  enrollment_date TIMESTAMP NOT NULL,
  selected_course INT NOT NULL DEFAULT 1,
  years_of_experience INT NOT NULL,
  student_company VARCHAR(30),
  batch_date VARCHAR(30) NOT NULL,
  source_of_joining VARCHAR(30) NOT NULL,
  location VARCHAR(30) NOT NULL,
  PRIMARY KEY (student_id),
  UNIQUE KEY (student_email)
);

desc students;

-- For 'rohit sharma'
INSERT INTO students (
  student_f_name, student_l_name, student_m_name, student_email,
  phone_number, alt_phone_number, enrollment_date, selected_course,
  years_of_experience, student_company, batch_date, source_of_joining, location
) VALUES (
  'rohit', 'sharma', NULL, 'rohit@gmail.com',
  '9191919191', NULL, CURRENT_TIMESTAMP, 1,
  6, 'walmart', '5-02-2021', 'linkedin', 'bangalore'
);

-- For 'virat kohli'
INSERT INTO students (
  student_f_name, student_l_name, student_m_name, student_email,
  phone_number, alt_phone_number, enrollment_date, selected_course,
  years_of_experience, student_company, batch_date, source_of_joining, location
) VALUES (
  'virat', 'kohli', NULL, 'virat@gmail.com',
  '9292929292', NULL, CURRENT_TIMESTAMP, 2,
  3, 'flipkart', '5-02-2021', 'linkedin', 'hyderabad'
);

-- For 'shikhar dhawan'
INSERT INTO students (
  student_f_name, student_l_name, student_m_name, student_email,
  phone_number, alt_phone_number, enrollment_date, selected_course,
  years_of_experience, student_company, batch_date, source_of_joining, location
) VALUES (
  'shikhar', 'dhawan', NULL, 'shikhar@gmail.com',
  '9393939393', NULL, CURRENT_TIMESTAMP, 3,
  12, 'google', '19-02-2021', 'google', 'bangalore'
);

-- For 'rahul dravid'
INSERT INTO students (
  student_f_name, student_l_name, student_m_name, student_email,
  phone_number, alt_phone_number, enrollment_date, selected_course,
  years_of_experience, student_company, batch_date, source_of_joining, location
) VALUES (
  'rahul', 'dravid', NULL, 'rahul@gmail.com',
  '9494949494', NULL, CURRENT_TIMESTAMP, 2,
  8, 'walmart', '19-02-2021', 'linkedin', 'chennai'
);


-- Now using the aggregate function here

-- ==================================Count================================

select count(*) from students;

select student_company from students;

select count(student_company) from students;
select count(DISTINCT student_company) from students;

select count(DISTINCT student_company) AS number_companies from students;

select count(DISTINCT location) as Location_count from students;

-- I want only feb batch student so this way we can do it 

select count(*) as Feb_batch from students where batch_date like '%-02-%';

-- ===================================Count END==============================================

-- ===================================GROUP BY============================================

-- group by is used to create group and perform some aggregation function like MAX MIN COUNT okk 
-- just remember that we have to give aggregate function then only it works

-- The GROUP BY clause in SQL is used to arrange identical data into groups. It is often used with aggregate functions like COUNT(), SUM(), AVG(), MAX(), or MIN() to perform operations on each group of data.

-- Think of GROUP BY as “club together rows with the same value in a column.”
-- Then you can use functions like COUNT() or SUM() on each club/group.

--this will make a group of source_of_joining and count only for specific group count(*) okk
-- GROUP BY kee sath count use kiya toh group karta vooh columns koo aur uska count deta okk 

-- 🔹 Example to make it crystal clear:
-- 🧾 Table: students
-- id	name	source_of_joining
-- 1	Aayush	Instagram
-- 2	Rahul	Google
-- 3	Meena	Instagram
-- 4	Tina	Referral
-- 5	John	Instagram

-- QUERY
-- SELECT source_of_joining, COUNT(*) 
-- FROM students
-- GROUP BY source_of_joining;

-- ✅ Output:
-- source_of_joining	count
-- Instagram	          3
-- Google	              1
-- Referral               1

select source_of_joining,count(*) from students GROUP BY source_of_joining;

-- whatever you are grouping should always be there in select 

--If i want to know how many people have join from how many locations 

select location,count(*) from students group by location;

select location,count(*) from students group by source_of_joining;
--this will give you an error as expected okk just remember that 

-- suppose I have to do the group by on two columns we will see that too okay 

select location,source_of_joining from students;
--just we will see what is there in this things first 

--grouping two colums see here 
select location,source_of_joining,count(*) from students group by location,source_of_joining;

select selected_course,count(*) from students group by selected_course;

-- =================================MIN AND MAX=================================================

--find someone with minimum experience 
--  here we are using MIN Function
select MIN(years_of_experience) from students;
--here we are not using group by so all the student table act as a huge group and from that it 
--will give us min years of experience of a candidate

--here we are using MAX Function 

select MAX(years_of_experience) from students;

--this will never work 
select MAX(years_of_experience),student_f_name from students;
--it will never work because system does not know max year student name 

--To make this work we can use this will give you result your looking earlier 
select student_f_name from students order by years_of_experience limit 1;

select source_of_joining,MAX(years_of_experience) from students group by source_of_joining;


-- ================================= SUM =================================================

select source_of_joining,sum(years_of_experience) from students group by source_of_joining;

-- ================================= AVERAGE =================================================

select source_of_joining,AVG(years_of_experience) from students group by source_of_joining;

select location,AVG(years_of_experience) from students group by location;

select student_company,AVG(years_of_experience) from students group by student_company;


