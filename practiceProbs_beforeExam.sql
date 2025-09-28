create database exam;

use exam;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job_title VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    experience INT,         -- years of experience
    join_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'IT', 'Bangalore'),
(2, 'Finance', 'Mumbai'),
(3, 'HR', 'Delhi'),
(4, 'Sales', 'Chennai'),
(5, 'Operations', 'Bangalore');

INSERT INTO Employee (emp_id, emp_name, job_title, dept_id, salary, experience, join_date) VALUES
(101, 'Alice', 'Software Engineer', 1, 75000, 6, '2017-05-20'),
(102, 'Bob', 'Accountant', 2, 55000, 4, '2019-07-15'),
(103, 'Charlie', 'HR Manager', 3, 62000, 8, '2015-03-10'),
(104, 'David', 'Sales Executive', 4, 48000, 3, '2020-01-12'),
(105, 'Eve', 'System Analyst', 1, 82000, 7, '2016-11-05'),
(106, 'Frank', 'Financial Analyst', 2, 67000, 5, '2018-06-25'),
(107, 'Grace', 'Recruiter', 3, 45000, 2, '2021-02-18'),
(108, 'Hank', 'Sales Manager', 4, 90000, 10, '2014-09-22'),
(109, 'Ivy', 'Operations Specialist', 5, 58000, 4, '2019-04-30'),
(110, 'Jack', 'DevOps Engineer', 1, 95000, 9, '2013-12-01'),
(111, 'Kathy', 'Accountant', 2, 72000, 6, '2017-08-14'),
(112, 'Leo', 'Operations Manager', 5, 105000, 12, '2012-10-05');



-- Q1
select * from Employee where salary > 60000;

-- Q2
select e.emp_id, e.emp_name, d.dept_name from Employee e join Department d
on e.dept_id = d.dept_id 
where e.dept_id = (select dept_id from Department where dept_name = "IT");

-- Q3
select * from Employee order by salary desc;

-- Q4
select dept_id, count(*) from Employee 
group by dept_id;

-- Q5
select dept_id, sum(salary) from Employee 
group by dept_id;

-- Q6
select dept_id, count(*) from Employee
group by dept_id
having count(*) > 1;

-- Q7
select dept_id, sum(salary) as total from Employee 
group by dept_id 
having total >150000;

-- Q8
select dept_id, avg(salary) from Employee 
where experience > 5
group by dept_id;

-- Q9
select dept_id, max(salary) from Employee 
group by dept_id ;

-- Q10
select e.emp_name, d.dept_name from Employee e join Department d
on e.dept_id = d.dept_id;

-- Q11
select e.emp_name, e.job_title, d.location from Employee e
join Department d on e.dept_id = d.dept_id;

-- Q12
select e.emp_name, d.dept_name from Employee e join Department d
on e.dept_id = d.dept_id where d.dept_name = "Finance";

-- Q13
select e.emp_name, e.salary, d.dept_name from Employee e 
join Department d on e.dept_id = d.dept_id
where e.salary > 60000;

-- Q14
select d.dept_name, e.salary, e.emp_name from Employee e 
join Department d on e.dept_id = d.dept_id
where e.salary = (select max(e2.salary)
from Employee e2 where e2.dept_id = e.dept_id);


-- Q15
select e.emp_name, d.dept_name, e.join_date from Employee e join 
Department d on e.dept_id = d.dept_id where
year(e.join_date) > "2018";

-- Q16
select emp_name, salary from Employee
where salary > (select avg(salary) from Employee);

-- Q17
select emp_name, dept_id from Employee
where dept_id = (select dept_id from Employee
where emp_name = "Alice");

-- Q18
select emp_name, salary from Employee where
salary = (select max(salary) from Employee);

-- Q19
select emp_name, salary from Employee e
where salary > (select avg(e2.salary) from Employee e2
where e.dept_id = e2.dept_id);


-- Q20
select e.emp_name, d.location, d.dept_name
from Employee e join Department d on 
e.dept_id = d.dept_id where 
d.location = "Bangalore";

-- Q21
select emp_name, salary from Employee where
salary > (select salary from Employee where emp_name = 
"Bob");

-- Q22
select dept_id, sum(salary) as highest 
from Employee
group by dept_id
having highest = 
       (select max(final) from
       (select sum(salary) as final 
       from Employee
       group by dept_id) 
as t
);



