show databases;
use sbms63;

CREATE TABLE EMPLOYE (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    DEPARTMENT VARCHAR(50),
    SALARY DECIMAL(10,2)
);

INSERT INTO EMPLOYE (EMP_ID, EMP_NAME, DEPARTMENT, SALARY)
VALUES
(101, 'Raj', 'IT', 80000),
(102, 'Raj', 'IT', 80000),
(103, 'Amit', 'HR', 70000),
(104, 'Neha', 'FINANCE', 90000),
(105, 'Neha', 'FINANCE', 90000);

-- get duplicate employee records keep only one record duplicates are based on:
-- EMP_NAME,DEPARTMENT,SALARY
-- EMP_ID is unique

Select * from employe;

select t.* from (
select *, row_number() over (partition by emp_name, department, salary ) as rnk from employe) t
where t.rnk>1;


CREATE TABLE EMPLOYEEWITHMANGER (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    MANAGER_ID INT,
    SALARY DECIMAL(10,2)
);

INSERT INTO EMPLOYEEWITHMANGER (EMP_ID, EMP_NAME, MANAGER_ID, SALARY)
VALUES
(101, 'Raj', 201, 80000),
(102, 'Amit', 201, 95000),
(103, 'Neha', 202, 70000),
(104, 'Priya', 202, 75000),
(201, 'Suresh', NULL, 150000),
(202, 'Meena', NULL, 140000);

select * from EMPLOYEEWITHMANGER;

-- Write SQL query to fetch:
-- Employee name and their manager name

SELECT 
    emp.emp_name AS employee_name,
    mgr.emp_name AS manager_name
FROM employeewithmanger emp
JOIN employeewithmanger mgr
ON emp.manager_id = mgr.emp_id;
