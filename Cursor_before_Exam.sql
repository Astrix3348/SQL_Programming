
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













