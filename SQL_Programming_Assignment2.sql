create database school;

create table students(
id int auto_increment primary key,
name varchar(20),
age int,
course varchar(20),
marks int);

INSERT INTO students (name, age, course, marks) VALUES
('Alice', 20, 'Computer Science', 92),
('Bob', 21, 'Electronics', 78),
('Charlie', 22, 'Mechanical', 65),
('David', 20, 'Electrical', 50),
('Eva', 23, 'Civil', 88),
('Frank', 21, 'Computer Science', 73),
('Grace', 22, 'Electronics', 81),
('Helen', 20, 'Mechanical', 55),
('Ian', 21, 'Civil', 60),
('Jane', 22, 'Computer Science', 95);

INSERT INTO students (name, age, course, marks) VALUES
('Alice', 20, 'Computer Science', 93),
('Bob', 21, 'Electronics', 75),
('Charlie', 22, 'Mechanical', 66),
('David', 20, 'Electrical', 59),
('Eva', 23, 'Civil', 87),
('Frank', 21, 'Computer Science', 63),
('Grace', 22, 'Electronics', 89),
('Helen', 20, 'Mechanical', 54),
('Ian', 21, 'Civil', 40),
('Jane', 22, 'Computer Science', 45);


-- Q1
drop procedure get_marks;
delimiter // 
create procedure get_marks(in c_name varchar(20))
begin
declare new_marks int default 0;
select marks into new_marks from students where 
c_name = name;
select name, new_marks from students where c_name = name;
end //
delimiter ;
call get_marks("Bob");

-- Q2
drop procedure get_marks;
delimiter // 
create procedure get_marks(in c_id int)
begin
declare new_course varchar(20) default null;
select course into new_course from students where 
c_id = id;
select new_course, name from students where c_id = id;
end //
delimiter ;
call get_marks(2);

-- Q3
drop procedure get_marks;
delimiter // 
create procedure get_marks(in new_name varchar(20))
begin
declare new_course varchar(20) default null;
select course into new_course from students where 
new_name = name;
select new_course, name from students where new_name = name;
end //
delimiter ;
call get_marks("Alice");

-- Q4
drop procedure get_avg;
delimiter // 
create procedure get_avg(in c_name varchar(20))
begin
declare average float default 0;
select avg(marks) into average from students where 
c_name = name;
select name, average from students where c_name = name limit 1;
end //
delimiter ;
call get_avg("Alice");

-- Q5
drop procedure getCourse;
delimiter //
create procedure getCourse(in s_name varchar(20))
begin

declare c_name varchar(20) default null;


select course into c_name from students
where s_name = name;
select c_name, name, id from students where
s_name = name;

end // 
delimiter ;
call getCourse("Alice");

---------------------------------------------
-- Q1
drop procedure topper;
delimiter $$
create procedure topper(out tname varchar(20))
begin
select name into tname from students where
marks = (select max(marks) from students);
end $$
delimiter ;

call topper(@tname);
select @tname;

-- Q2
drop procedure topper;
delimiter $$
create procedure topper(out tname varchar(20))
begin
select name into tname from students where
marks = (select min(marks) from students);
end $$
delimiter ;

call topper(@tname);
select @tname;

-- Q3
drop procedure to_count;
delimiter $$
create procedure to_count(out tcount int)
begin
select count(*) into tcount from students;
end $$
delimiter ;

call to_count(@tcount);
select @tcount;

-- Q4
drop procedure to_count;
delimiter $$
create procedure to_count(out tcount double)
begin
select avg(marks) into tcount from students;
end $$
delimiter ;

call to_count(@tcount);
select @tcount;

-- Q5
drop procedure c_name;
delimiter $$
create procedure c_name(in s_id int, out courseName varchar(20))
begin
select course into courseName from students where 
id = s_id;
end $$
delimiter ;

call c_name( 2, @courseName);
select @courseName;








