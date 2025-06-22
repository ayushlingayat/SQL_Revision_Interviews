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


select location from students;

-- Now using the distinct keyword here 

-- select DISTINCT <col_name> from <table_name>;
select DISTINCT location from students;

-- toh distinct value dikayega students kii 
select DISTINCT student_company from students;

-- If we want to apply order to the data we use ORDER BY okk

-- select <col_name> from <table_name> ORDER BY <column_name> ==> kis column pee order seeh dekhna vooh name

-- this will be seen in ascending order also called as dictionary order 

select student_f_name, student_l_name, student_m_name, student_email,
  phone_number, alt_phone_number, enrollment_date, selected_course,
  years_of_experience, student_company, batch_date, source_of_joining from students ORDER BY years_of_experience;

-- the order by need not to be a part of select samje i mean column nhi bhi dala or order by mein column dalke sort kiya in ascending order still work 

select student_f_name from students ORDER BY enrollment_date;

-- If you want to order by in descending order write the same query but at the end of it right descending order thing okk 

--select <col_name> from <table_name> ORDER BY <column_name> desc

select student_f_name,student_l_name from students ORDER BY enrollment_date desc;

-- this will also work if we are giving columns no still it will work 

--select <col_name> from <table_name> ORDER BY <column_name_number_given_selectafter> desc
select student_f_name,student_l_name,years_of_experience from students ORDER BY 3 desc;

--order by using multiple values 
select student_f_name,years_of_experience from students ORDER BY years_of_experience,student_f_name;


-- ========================================================================================
-- Limit 

-- Limit has to be used with order by to get good results okk just remember that 

-- select <column_name> from <table_name> ORDER BY <column_name> limit 3 
-- limit 3 matlab 3 records dega starting kee 
-- limit 2 matlab 2 records dega starting kee aesha okk 

-- Lower experience kee sarre people search karne hoo toh yeeh

select student_f_name, student_l_name, student_m_name, student_email,
  phone_number, alt_phone_number, enrollment_date, selected_course,
  years_of_experience, student_company, batch_date, source_of_joining from students ORDER BY years_of_experience LIMIT 3;

-- Higher experience kee sarre people search karne hoo toh yeeh 

select student_f_name, student_l_name, student_m_name, student_email,
  phone_number, alt_phone_number, enrollment_date, selected_course,
  years_of_experience, student_company, batch_date, source_of_joining from students ORDER BY years_of_experience desc LIMIT 3;

-- want to know from which sources last students get to know me 
select source_of_joining from students ORDER BY enrollment_date DESC LIMIT 5;

-- yeeh query kaa matlab hee kii 0 seeh 3 record dena matlab 3 rows aayege first kee
select * from students ORDER BY enrollment_date LIMIT 0,3;

-- yeeh query kaa matlab hee kii yeeh naa 3 row seeh 2 record dega means 4 th and 5th row bss okk
select * from students ORDER BY enrollment_date LIMIT 3,2;

-- ===========================================================================================
-- LIKE - it is used to give fussy match not exact match like we used to do with where clause 

-- it is mostly use with where clause okk something like aesha okk "=" is replace with "like"
-- % is a wild card character 
-- _ underscore is a wildcard character here if we give underscore it act like fill in the blanks 

select * from students WHERE student_f_name LIKE '%ra%';

select * from students WHERE student_f_name LIKE '_____'; 
--five underscore names atte idar okk because consist of 5 words vale

-- _ Underscore means exactly one character

-- %\%at ==> whose name ends with at 
select * from students WHERE student_f_name LIKE '%\%at';


