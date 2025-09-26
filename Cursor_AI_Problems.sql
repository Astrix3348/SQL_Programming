create database practice;
use practice;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE
);

-- Q1

drop procedure displayName;
delimiter //
create procedure displayName()
begin
declare ename varchar(50);
declare esal int;
declare done int default 0;

declare c1 cursor for select emp_name, salary from employees;
declare continue handler for not found set done = 1;

open c1;
read_details : loop
    fetch c1 into ename, esal;
    if done = 1 then 
    leave read_details;
    end if;
    select ename, esal;
end loop;
close c1;
end //

call displayName();





-- Q2

drop procedure bonus;
delimiter //
create procedure bonus()
begin
declare e_sal int;
declare done int default 0;
declare new_bonus int;

declare c2 cursor for select salary from employees;
declare continue handler for not found set done = 1;
open c2;
read_sal : loop
fetch c2 into e_sal;

if done = 1 then
leave read_sal;
end if;

if(e_sal < 30000) then
   set new_bonus = e_sal + (e_sal*0.1);
else
   set new_bonus = e_sal + (e_sal*0.5);
end if;

select new_bonus;
end loop;
end //
call bonus();

-- Q3

drop procedure num;
delimiter //
create procedure num()
begin
declare dept_num int;
declare department_id int;
declare done int default 0;

declare c3 cursor for select dept_id, count(*) from employees
group by dept_id;
declare continue handler for not found set done = 1;

create temporary table checkNum(dept_code int, dept_num int);

open c3;
find_count : loop
fetch c3 into department_id, dept_num;

if done = 1 then 
leave find_count;
end if;

insert into checkNum values (department_id, dept_num);
end loop;
close c3;

select * from checkNum;
end //
call num();














