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



-- I want to know in which course rahul has enrolled

-- We can do this but not a right way 
select course_name from courses where course_id = (select selected_course from students where student_fname = 'rahul');

--now we are performing a join here

--#Inner Join

select students.student_f_name,students.student_l_name,courses_new.course_name from students join courses_new on students.selected_course = courses_new.course_id;

-- this is innerjoin up query
--only matching records are taken means considered 
--Non matching (other records) are eliminated (discarded) okk
--INNER JOIN Only returns rows that have matching values in both tables. 

--#Left Join 

--all the matching records from left and right are considered + all the non matching records in the left table which does not have the match in the right gives us null or can say padded with null

-- this will result in an error because its foreign key 

delete from courses_new where course_id = "2";

-- students table seeh connected hee 

--we are creating copy of students table without foreign key constraints in it 

create table student_latest as select * from students;

--we are creating copy of courses table without foreign key constraints in it 

create table courses_latest as select * from courses_new;

--now this delete will be performed here

delete from courses_latest where course_id = "2";
--this will be deleted successfully 

--now doing the join here 

select students_latest.student_f_name,students_latest.student_l_name,courses_latest.course_name from students_latest join courses_latest on students_latest.selected_course = courses_latest.course_id;

--to perform a left outer join give keyword as left okk like this 

--left join we perform here 
--if the thing is not there in right table it will show null
select students_latest.student_f_name,students_latest.student_l_name,courses_latest.course_name from students_latest left join courses_latest on students_latest.selected_course = courses_latest.course_id;

--#Right outer join 
--all the matching records from left and right are considered + all the non matching records in the right table which does not have the match in the left gives us null or can say padded with null

--to perform a right outer join give keyword as right okk like this 

select students_latest.student_f_name,students_latest.student_l_name,courses_latest.course_name from students_latest right join courses_latest on students_latest.selected_course = courses_latest.course_id;


--#Full Outer Join : Combination of left outer join + Right outer join 

-- all the matching records + non matching records from left + non matching records from right 

--for giving full outer join we use union okk 
select students_latest.student_f_name,students_latest.student_l_name,courses_latest.course_name from students_latest left join courses_latest on students_latest.selected_course = courses_latest.course_id  --left join
union  --union thing
select students_latest.student_f_name,students_latest.student_l_name,courses_latest.course_name from students_latest right join courses_latest on students_latest.selected_course = courses_latest.course_id -- right join 

--yeeh sabka combination dega full join okk 

--this is the full query for full join 

select students_latest.student_f_name,students_latest.student_l_name,courses_latest.course_name from students_latest left join courses_latest on students_latest.selected_course = courses_latest.course_id union select students_latest.student_f_name,students_latest.student_l_name,courses_latest.course_name from students_latest right join courses_latest on students_latest.selected_course = courses_latest.course_id 

-- Definition: CROSS JOIN
-- A CROSS JOIN returns the Cartesian product of two tables.
-- That means:
-- Each row from the first table is combined with every row from the second table.
-- No ON condition is used in a CROSS JOIN.
-- If Table A has 3 rows and Table B has 4 rows → Output will have 3 × 4 = 12 rows.

select count(*) from students,courses_new;

select count(*) from students;

--this is cross join okk
--this will give us cartesian product 
select * from student cross join courses;


-- =>what we have learnt here 
--Left outer join 
--Right outer join
--Inner Join
--Full Join (union)
--Cross Join
