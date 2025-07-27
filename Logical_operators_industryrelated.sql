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

create table courses (
    course_id int NOT NULL,
    course_name varchar(30) NOT NULL,
    course_duration_months int NOT NULL,
    course_fee int NOT NULL,
    PRIMARY KEY(course_id)
);

insert into courses values (1, 'big data', 6, 50000);
insert into courses values (2, 'web development', 3, 20000);
insert into courses values (3, 'data science', 6, 40000);
insert into courses values (4, 'devops', 1, 10000);

--  ################# Logical Operator Starts  ########################

-- like 
-- not 
-- and 
-- or
-- between
-- in
--case 
--   when then
--else
end example 


desc students;
select * from students where location = 'bangalore';
select * from students where location != 'bangalore';


--get all courses which have the word data in them 
select * from courses where course_name like "%data%";

--get all courses don not have keyword data in them
select * from courses_new where course_name not like "%data%";

--all students from banglore how joined through linkedin and has less than 8 years of experience 
select * from students where years_of_experience < 8 and location = 'chennai' and source_of_joining = 'linkedin';

-- I want all the people who fall between 8 to 12 years of experience 
-- Normal way
select * from students where years_of_experience < 8 or years_of_experience > 12;


--Professional Way
select * from students where years_of_experience between 8 and 12;

select * from students where years_of_experience not between 8 and 12;

select * from students where student_company = 'flipkart' or student_company = 'walmart' or student_company = 'google';

--Cleaner way of achieving this thing okk is using in 

select * from students where student_company in ('google','filpkart','walmart');

--I want people who are not working on this company 

select * from students where student_company not in ('filpkart','walmart','google');

--if course is less than 4 months we categorise this has masters program and if the course duration is less than 4 months we can categorise this as diploma 


-- Yaha hum select form courses kee sath naa case when then else and end vale cheeze use kare okk 

SELECT course_id, course_name, course_fee,
       CASE 
           WHEN course_duration_months > 4 THEN 'masters'
           ELSE 'diploma'
       END AS course_type
FROM courses_new;


-- now we are categorising it in company type 

select student_id,student_f_name,student_m_name,student_l_name,
  CASE
    when student_company in ('flipkart','google') then 'product-based'
    else 'service-based' 
  END as company_type from students;


SELECT 
  student_id,
  student_f_name,
  student_m_name,
  student_l_name,
  
  -- Categorize company type
  CASE
    WHEN student_company IN ('flipkart', 'google', 'amazon') THEN 'product-based'
    WHEN student_company IN ('tcs', 'infosys', 'accenture') THEN 'service-based'
    ELSE 'other-company'
  END AS company_type,
  
  -- Categorize GPA
  CASE 
    WHEN student_gpa >= 9 THEN 'Excellent'
    WHEN student_gpa BETWEEN 7 AND 8.99 THEN 'Good'
    WHEN student_gpa BETWEEN 5 AND 6.99 THEN 'Average'
    ELSE 'Below Average'
  END AS gpa_category,
  
  -- Scholarship eligibility based on GPA and extracurricular score
  CASE
    WHEN student_gpa >= 8 AND extracurricular_score >
7 THEN 'Eligible'
    ELSE 'Not Eligible'
  END AS scholarship_eligibility,

  -- Batch year categorization
  CASE
    WHEN batch_year BETWEEN 2015 AND 2018 THEN 'Alumni'
    WHEN batch_year BETWEEN 2019 AND 2023 THEN 'Current Student'
    ELSE 'Future Batch'
  END AS batch_status
  
FROM students;



