show databases;
use sbms63;

CREATE TABLE Employee_tbl (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO Employee_tbl (emp_id, emp_name, salary)
VALUES
(1, 'Raj', 50000),
(2, 'Amit', 70000),
(3, 'John', 90000),
(4, 'Sam', 70000),
(5, 'Alex', 60000);

select * from employee_tbl;
-- Get 2nd higest salary
select max(salary) from employee_tbl 
where salary<(select max(salary) from employee_tbl order by salary desc);

-- Get 2nd higest salary
select t.* from (
	select *, DENSE_RANK() over(order by salary desc) as rnk from employee_tbl 
) t where t.rnk=2;


CREATE TABLE Employee_with_managers (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    manager_id INT
);

INSERT INTO Employee_with_managers VALUES
(1,'CEO',100000,NULL),
(2,'Raj',80000,1),
(3,'Amit',120000,1),
(4,'John',70000,2),
(5,'Alex',90000,2);



-- employee who have salary higher than there manager

SELECT e1.emp_name
FROM Employee_with_managers e1
JOIN Employee_with_managers e2
    ON e1.manager_id = e2.emp_id
WHERE e1.salary > e2.salary;

CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);
INSERT INTO Orders VALUES
(1,101,'2025-01-01'),
(2,102,'2025-01-02'),
(3,101,'2025-01-03'),
(4,103,'2025-01-04'),
(5,101,'2025-01-05'),
(6,102,'2025-01-06');


select * from orders;

-- customers who have more than 2 orders
select customer_id, COUNT(*) from orders e1
group by customer_id
having count(*)>2;

-- Get the latest order from each customer
select o.* from (
	select *, ROW_NUMBER() over(partition by customer_id order by order_date desc) as rownumber from orders
) o where o.rownumber=1;






