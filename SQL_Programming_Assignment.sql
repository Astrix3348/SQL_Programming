
-- Q1
drop procedure num_sum;
delimiter //
create procedure num_sum(in num int, in num2 int)
begin
select (num + num2) as sum;
end //
delimiter ;
call num_sum(2,3);

-- Q2
drop procedure oddEven;
delimiter //
create procedure oddEven(in num int)
begin
if mod(num,2) = 0 then
   select concat(num, " is even") as result;
else
   select concat(num, " is odd") as result;
end if;
end //
delimiter ;
call oddEven(3);

-- Q3
drop procedure upperCase;
delimiter //
create procedure upperCase(in name varchar(20))
begin
select upper(name) as uppercase;
end //
delimiter ;
call upperCase("aakash");

-- Q4
drop procedure fac;
delimiter //
create procedure fac(in num int)
begin
declare result int default 1;
declare i int default 1;
while i <= num do
    set result = result * i;
    set i = i + 1;
end while;
select concat("Factorial is ", result) as factorial;
end //
delimiter ;
call fac(5);

-- Q5
drop procedure mul;
delimiter //
create procedure mul(in num int)
begin
declare i int default 1;
drop table multiplication;
create temporary table multiplication(multiplyRes int);
while i <= 10 do
    insert into multiplication values (
    (num * i));
	set i = i + 1;
end while;
select * from multiplication;
end //
delimiter ;
call mul(7);

-------------------------------------------------------------------------
-- QUESTION-2

use dac_dbt_2022;

-- q1
drop procedure empDet;
delimiter //
create procedure empDet(in emp_id int)
begin
select empname, basicpay from emp where 
empcode = emp_id;
end //
delimiter ;
call empDet(7888);

-- q2
drop procedure empDept;
delimiter //
create procedure empDept(in dept_code varchar(20))
begin
select deptcode, count(*) from emp
where deptcode = dept_code
group by deptcode;
end //
delimiter ;
call empDept("SALE");

-- q4
drop procedure display_product;
delimiter //
create procedure display_product(in id int)
begin
select * from products
where product_id = id;
end //
delimiter ;
call display_product(103);


