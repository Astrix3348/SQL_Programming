
use exam;
 
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);

INSERT INTO Students VALUES
(101, 'Ravi', 85),
(102, 'Priya', 72),
(103, 'Karan', 55),
(104, 'Meera', 40),
(105, 'Anita', 30);


-- Cursor Logic:

-- Use a cursor to loop through each student’s marks.

-- Assign grade as per logic:

-- Marks ≥ 80 → Grade 'A'

-- Marks between 60–79 → Grade 'B'

-- Marks between 40–59 → Grade 'C'

-- Marks < 40 → Grade 'Fail'

-- Print student name with assigned grade.


drop procedure if exists get_grade;
delimiter //
create procedure get_grade()
begin
declare grade varchar(20);
declare done int default 0;
declare sname varchar(20);
declare s_marks int;

declare c1 cursor for select Name, Marks from students;
declare continue handler for not found set done = 1;

drop temporary table if exists dets;
create temporary table dets(t_name varchar(20), t_grade varchar(20));

open c1;

read_grade : loop

   fetch c1 into sname, s_marks;
   if done = 1 then 
   leave read_grade;
   end if;
   
   if(s_marks >= 80) then
      set grade = "A";
   elseif(s_marks > 60 and s_marks <=79) then
      set grade = "B";
   elseif(s_marks > 40 and s_marks <=59) then
      set grade = "C";
   else 
     set grade = "Fail";
   end if;

insert into dets values (sname, grade);

end loop;
close c1;

select * from dets;
end // 

call get_grade();


CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    basic_pay DECIMAL(10,2)
);

INSERT INTO Employee VALUES
(101, 'Alice', 1200),
(102, 'Bob', 1500),
(103, 'Charlie', 900),
(104, 'David', 2000),
(105, 'Eve', 1800);

-- Q2
drop procedure if exists get_details;
delimiter //
create procedure get_details()
begin
declare done int default 0;
declare e_name varchar(20);
declare bonus int default 0;

declare c1 cursor for select emp_name, basic_pay from Employee;
declare continue handler for not found set done = 1;

drop temporary table if exists display;
create temporary table display(t_name varchar(20), t_bonus int);

open c1;

read_details : loop
   fetch c1 into e_name, bonus;
   if done = 1 then 
   leave read_details;
   end if;
   
   if(bonus > 1500) then
   set bonus = bonus + (bonus*0.1);
   else
   set bonus = bonus + (bonus*0.05);
   end if;

insert into display values (e_name, bonus);

end loop;
close c1;
select * from display;
end //

call get_details();


-- Q3
CREATE TABLE EmployeeExperience (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    experience_years INT
);

INSERT INTO EmployeeExperience VALUES
(101, 'Alice', 2),
(102, 'Bob', 5),
(103, 'Charlie', 7),
(104, 'David', 1),
(105, 'Eve', 10);



drop procedure if exists get_pos;
delimiter //
create procedure get_pos()
begin
declare domain varchar(20);
declare new_name varchar(20);
declare years int;
declare done int default 0;

declare c1 cursor for select emp_name, experience_years from EmployeeExperience;
declare continue handler for not found set done = 1;

drop temporary table if exists t_det;
create temporary table t_det(name varchar(20), desig varchar(20));

open c1;

read_dets : loop

fetch c1 into new_name, years;
if done = 1 then 
leave read_dets;
end if;

  if(years>=8) then
     set domain = "Expert";
  elseif(years >= 5 and years <= 7) then
     set domain = "Intermediate";
  else
     set domain = "Beginner";
  end if;

insert into t_det values (new_name, domain);

end loop;
close c1;
select * from t_det;
end //

call get_pos();














