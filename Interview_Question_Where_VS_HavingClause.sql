-- Where vs Having clause in SQL 

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
  FOREIGN KEY(selected_course) REFERENCES courses(course_id)
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




create table courses_new (
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

select * from courses;

-- Lets see the students table thing right 

select source_of_joining,count(*) as total from students group by source_of_joining;

--I want to know the lead sources for which more than one person has registered 

select source_of_joining,count(*) as total from students group by source_of_joining where total > 1;

--this will not work okk 

--where clause is used to filter any individual records before aggregation 
-- jab naa group kee sath where use kiya toh vooh work nhi karta hee vooh bolta hee 
-- I can only deal with individual records 

--having is used after the group by - it is mainily used after the grouping is happened 

select source_of_joining,count(*) as total from students group by source_of_joining having total > 1;

-- I want to know the count of people who registered through the linkedin 

select source_of_joining,count(*) as total from students group by source_of_joining having source_of_joining= "linkedin";

-- we can write where clause before the group by for filtering the records individually okk this works 

select source_of_joining,count(*) as total from students where source_of_joining ="linkedin" group by source_of_joining;
-- more performant than having 
-- first using where than grouping things 

-- in having we use group by first than we use having 

-- I want to get the location of people greater than one and experience should be 10 + Years

select location,count(*) as location_count from students where years_of_experience > 5 group by location having location_count >= "1";

select years_of_experience,location,count(*) as location_count from students where years_of_experience > 5 group by location,years_of_experience having location_count >= "1";

-- do filtering means where as soon as possible so we do not do heavy crunching thing then 

-- sturcturing is used like this
-- 1.where (before group by)
-- 2.group by
-- 3.having 

-- where is used before group by and do filtering on individual records
-- having is used after group by and do filtering on aggregated records.
-- we can use where and having in the same query also.
-- where is more performant than having..

