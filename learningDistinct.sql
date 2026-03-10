CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT
);

INSERT INTO employees VALUES
(1,'Adam','IT','New York',78000),
(2,'Brian','HR','Boston',72000),
(3,'Clara','Finance','New York',80000),
(4,'Daniel','IT','Boston',76000),
(5,'Eva','HR','Chicago',70000),
(6,'Frank','IT','New York',69000),
(7,'Grace','HR','Boston',75000),
(8,'Hannah','IT','Chicago',82000);

select * from employees

select top 3 * from employees 
where department in ('IT', 'HR')
  and city in ('New York', 'Boston')
  and emp_name like '%a%'
order by salary desc

select distinct department from employees
where salary > 70000
  and city <> 'Chicago'
  and (emp_name like 'A%' or emp_name like 'D%')
order by department asc

select * from employees
where department = 'Finance'
  and salary between 70000 and 85000
  and emp_name like '%n'
order by salary asc

select distinct top 2 city from employees
where department = 'IT'
  and salary > 70000
order by city asc

select * from employees
where department in ('IT', 'Finance')
  and city <> 'Chicago'
  and emp_name like 'J%'
  and salary > 75000
order by salary desc
