create database courses;

use courses;

create table courses_new(
    course_id int NOT NULL,
    course_name varchar(30) NOT NULL,
    -- decimal(3,1) kaa matlab aesha hota hee 3 digits will be there but point kee baad litreally 1 digit hoga getting the point
    course_duration_months decimal(3,1) NOT NULL,
    course_fee int NOT NULL,
    --NOW() can be replaced with CURRENT_TIMESTAMP()
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY(course_id)
);

insert into courses_new(course_id,course_name,course_duration_months,course_fee) values(1, 'big data', 6.5, 50000);
insert into courses_new(course_id,course_name,course_duration_months,course_fee) values(2, 'web development', 3.5, 20000);
insert into courses_new(course_id,course_name,course_duration_months,course_fee) values(3, 'data science', 6, 40000);
insert into courses_new(course_id,course_name,course_duration_months,course_fee) values(4, 'devops', 10.5, 10000);

select * from courses_new;

update courses_new set course_fee = 40000 where course_id = "2";

-- The TimeStamp will consider the UTC time just remember that 

select * from courses_new;

update courses_new set course_fee = 30000 where course_id = "2";

-- when I update timestamp doesnt change okk 






