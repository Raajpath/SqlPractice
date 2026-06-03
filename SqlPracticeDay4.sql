show databases;
use sbms63;

select * from Employee_withdeptid;
select * from Dept;

-- Find the highest-paid employee in each department.

select e.emp_id, e.emp_name, e.salary, d.dept_name
from (select *, dense_rank() over(partition by dept_id order by salary desc) as rnk from employee_withdeptid) e
join dept d
on e.dept_id = d.dept_id
where rnk=1;


CREATE TABLE Users (
    user_id INT,
    email VARCHAR(100)
);

INSERT INTO Users VALUES
(1,'raj@gmail.com'),
(2,'amit@gmail.com'),
(3,'raj@gmail.com'),
(4,'john@gmail.com'),
(5,'amit@gmail.com');

select u.* from 
(select *, row_number() over(partition by email) as rnk from users) u
where u.rnk>1;

CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(50)
);

INSERT INTO Customers VALUES
(101,'Raj'),
(102,'Amit'),
(103,'John'),
(104,'Alex');

CREATE TABLE Orderss (
    order_id INT,
    customer_id INT
);

INSERT INTO Orderss VALUES
(1,101),
(2,102),
(3,101);

-- Find Customers Who Never Placed an Order

select c.customer_id, c.customer_name from Customers c
left join orderss o 
on c.customer_id= o.customer_id
where o.order_id is null;

-- 1. ROW_NUMBER() "I don't care if scores are tied. Everyone gets a unique number."
-- 2. RANK() "If two students tie for 1st place, both get rank 1." Next rank is skipped.
-- 3. DENSE_RANK() "If two students tie for 1st place, both get rank 1, but don't skip numbers."