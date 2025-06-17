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


-- insert into students (student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location)
-- values ('rohit', 'sharma', 'rohit@gmail.com', '9191919191', 6, 'walmart', '5-02-2021', 'linkedin', 'bangalore');

-- insert into students (student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location)
-- values ('virat', 'kohli', 'virat@gmail.com', '9292929292', 3, 'flipkart', '5-02-2021', 'linkedin', 'hyderabad');

-- insert into students (student_fname, student_lname, student_email, student_phone, years_of_exp, batch_date, source_of_joining, location)
-- values ('shikhar', 'dhawan', 'shikhar@gmail.com', '9393939393', 12, '19-02-2021', 'google', 'bangalore');

-- insert into students (student_fname, student_lname, student_email, student_phone, years_of_exp, student_company, batch_date, source_of_joining, location)
-- values ('rahul', 'dravid', 'rahul@gmail.com', '9494949494', 8, 'walmart', '19-02-2021', 'linkedin', 'chennai');


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

select * from courses;