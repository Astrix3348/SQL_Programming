-- Write a stored function to return the annual salary of an employee when the employee ID is given.

-- Write a stored function to find the experience of an employee (in years) from the hire date, when the employee ID is given.

-- Write a stored function to return the department name when the employee ID is given.

-- Write a stored function to return the number of employees in a particular department, when the department ID is given.

-- Write a stored function to return the bonus amount for an employee based on their salary (e.g., 10% of salary if salary < 50,000, otherwise 5%).


use dac_dbt_2022;

-- Q1
delimiter //
create function get_salary(e_id int)
returns float
deterministic

begin
declare total float;
select sum(basicpay) into total from emp
where empcode = e_id;

return total;
end //

select get_salary(7888);


-- Q2
drop function get_exp;
delimiter //
create function get_exp(e_id int)
returns int
deterministic
begin
declare experience int;
select timestampdiff(year, joindate, curdate()) into experience from
emp where e_id = empcode;


return experience;

end //
select get_exp(7888) as exp;

-- Q3
delimiter //
create function get_dept(e_id int)
returns varchar(20)
deterministic
begin
declare dept_name varchar(20);

select deptcode into dept_name from emp 
where e_id = empcode;

return dept_name;

end//
select get_dept(7888);

-- Q4
delimiter //
create function get_count(dept_id varchar(20))
returns int
deterministic
begin
declare each_count int;

select count(empcode) into each_count from emp
group by deptcode
having deptcode = dept_id;

return each_count;

end // 
select get_count("PRCH");


-- Q5
drop function get_bonus;
delimiter //
create function get_bonus(e_id int)
returns float
deterministic

begin
declare bonus float;
select basicpay into bonus from emp
where empcode = e_id;
if(bonus > 1300) then
set bonus = (bonus + bonus * 0.1);
else
set bonus = (bonus + bonus * 0.05);
end if;

return bonus;

end //

select empname,
empcode,get_bonus(empcode)
from emp;






select * from emp;











