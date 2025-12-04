use practice;

-- display salary in descending order
select salary from employee order by salary desc;

-- display employees having salary between 50000 and 80k
select emp_name, salary from employee having salary between 50000 and 80000;

-- display distint dept_id from the employee table
select distinct dept_id from employee;

-- show all employees whose name starts with P
select * from employee where emp_name like 'p%';

-- total number of employees in each department
select dept_id, count(*) from employee group by dept_id;

-- find the department with the highest average salary
select dept_id, avg(salary) as avg_salary from employee group by dept_id 
having avg(salary) = (
       select max(avg_salary) from (select avg(salary) as avg_salary
       from employee
       group by dept_id
       ) as temp
);

-- get the minimum, maximum and average salary of employees
select min(salary) as minimum, max(salary) as maximum,
avg(salary) as avg_salary from employee; 

-- show the departments having more than 2 employees
select dept_id, count(*) as num from employee group by dept_id having
num > 2;

-- show emp_name and dept_name for all employees
select e.emp_name, d.dept_name from employee e join department d
on e.dept_id = d.dept_id;

-- list employees with their managers names using self join
select e.emp_name, e2.emp_name as manager from employee e join
employee e2 where e.manager_id = e2.emp_id;

-- find employee name, salary, dept name and manager name
select e.emp_name as employee, e.salary, e.dept_id, d.dept_name, m.emp_name as manager
from employee e
join employee m on e.manager_id = m.emp_id 
join department d on e.dept_id = d.dept_id;









