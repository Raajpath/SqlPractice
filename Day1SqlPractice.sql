show databases;
use sbms63;

CREATE TABLE EMPLOYEESS (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(10,2),
    MANAGER_ID INT,
    JOIN_DATE DATE
);

INSERT INTO EMPLOYEESS 
(EMP_ID, EMP_NAME, DEPARTMENT, SALARY, MANAGER_ID, JOIN_DATE)
VALUES
(101, 'Raj', 'IT', 80000, 201, '2022-01-10'),
(102, 'Amit', 'IT', 95000, 201, '2021-03-15'),
(103, 'Neha', 'HR', 70000, 202, '2020-07-11'),
(104, 'Priya', 'HR', 70000, 202, '2023-05-01'),
(105, 'Sumit', 'FINANCE', 120000, 203, '2019-09-20'),
(106, 'Karan', 'FINANCE', 115000, 203, '2021-11-18'),
(107, 'Ravi', 'IT', 95000, 201, '2020-02-22');


SELECT * from EMPLOYEESS;


-- highest salary employee from each department
-- if multiple employees have same highest salary, return all of them.

select * from (select *, rank() over (partition by department order by salary desc) as rnk from employeess ) t
where rnk=1;

-- Employees whose salary is greater than the average salary of their department
select e.* from employeess e where  e.salary >(
select avg(salary) from employeess 
where department = e.department);

select t.* from
(select *, avg(salary) over(partition by department ) as avg_salary from employeess ) t
where t.salary>avg_salary;


-- Second highest salary from each department
select t.* from 
(select *, dense_rank() over(partition by department order by salary desc) as rnk from employeess)  t
where t.rnk=2;


CREATE TABLE MANAGER (
    MANAGER_ID INT PRIMARY KEY,
    MANAGER_NAME VARCHAR(100)
);

INSERT INTO MANAGER (MANAGER_ID, MANAGER_NAME)
VALUES
(201, 'Suresh'),
(202, 'Meena'),
(203, 'Vikram');

select * from manager;

-- Write SQL query to fetch: employee name department salary manager name using proper JOIN.

select e.emp_name, e.department, e.salary, m.manager_name
from employeess e
inner join manager m on e.manager_id = m.manager_id;

CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(100)
);

CREATE TABLE TRANSACTIONS (
    TXN_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    AMOUNT DECIMAL(10,2),
    TXN_DATE DATE,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME)
VALUES
(1, 'Raj'),
(2, 'Amit'),
(3, 'Neha');

INSERT INTO TRANSACTIONS (TXN_ID, CUSTOMER_ID, AMOUNT, TXN_DATE)
VALUES
(101, 1, 5000, '2026-01-10'),
(102, 1, 7000, '2026-01-11'),
(103, 2, 3000, '2026-01-12'),
(104, 2, 4000, '2026-01-13'),
(105, 2, 2000, '2026-01-14'),
(106, 3, 1000, '2026-01-15');

-- customers whose total transaction amount is greater than 10000.

select c.customer_name , SUM( t.amount)
from customer c inner join transactions t
on t.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(t.amount) > 10000;