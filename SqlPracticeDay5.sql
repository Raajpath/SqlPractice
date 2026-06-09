use sbms63;
show tables;

CREATE TABLE sales (
    sale_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO sales VALUES
(1, 101, '2026-06-01', 150.00),
(2, 102, '2026-06-01', 200.00),
(3, 101, '2026-06-02', 100.00),
(4, 103, '2026-06-02', 250.00),
(5, 102, '2026-06-03', 300.00);


-- Write a query to find the total sales amount for each product for the month of June 2026.
SELECT product_id, 
       SUM(amount) AS total_sales
FROM sales
WHERE sale_date BETWEEN '2026-06-01' AND '2026-06-30'
GROUP BY product_id;


CREATE TABLE ordersss (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);


INSERT INTO ordersss VALUES
(1, 201, '2026-06-01', 500.00),
(2, 202, '2026-06-02', 150.00),
(3, 201, '2026-06-03', 300.00),
(4, 203, '2026-06-01', 700.00),
(5, 202, '2026-06-04', 400.00);

-- write a query to find the total sales amount and the number of orders per customer for June 2026.

select customer_id,SUM(total_amount), COUNT(order_id)
from ordersss 
where order_date between '2026-06-01' AND '2026-06-30'
group by customer_id;


CREATE TABLE products123 (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);



INSERT INTO products123 VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Chair', 'Furniture', 150.00),
(4, 'Desk', 'Furniture', 300.00),
(5, 'Headphones', 'Electronics', 200.00);


-- Write a query to find the average price of products in each category.


select category,AVG(price) from products123
group by category;


CREATE TABLE employees123 (
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees123 VALUES
(1, 'Raj', 'IT', 70000),
(2, 'Sara', 'HR', 65000),
(3, 'Mike', 'Finance', 80000),
(4, 'Rita', 'IT', 75000),
(5, 'John', 'HR', 62000);


-- Write a query to find the average salary per department 
-- and only show departments where the average salary is greater than 65000.


select department, AVG(salary) from employees123
group by department
having AVG(salary)>65000;


CREATE TABLE customers123(
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    join_date DATE
);


INSERT INTO customers123 VALUES
(1, 'Alice', 'New York', '2026-01-15'),
(2, 'Bob', 'Los Angeles', '2026-02-10'),
(3, 'Charlie', 'Chicago', '2026-03-05'),
(4, 'Dave', 'New York', '2026-04-20'),
(5, 'Eve', 'Los Angeles', '2026-05-25');


-- Write a query to find the number of customers who joined each month in 2026.
select month(join_date), count(*) from customers123
group by MONTH(join_date);

CREATE TABLE inventory (
    item_id INT,
    item_name VARCHAR(100),
    quantity INT,
    warehouse VARCHAR(50)
);

INSERT INTO inventory VALUES
(1, 'Laptop', 50, 'Warehouse A'),
(2, 'Phone', 100, 'Warehouse B'),
(3, 'Tablet', 70, 'Warehouse A'),
(4, 'Monitor', 30, 'Warehouse C'),
(5, 'Keyboard', 150, 'Warehouse B');

-- Write a query to find the total quantity of items in each warehouse.

select warehouse, SUM(quantity) from inventory
group by warehouse;

CREATE TABLE payments (
    payment_id INT,
    customer_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO payments VALUES
(1, 1, '2026-06-01', 100.00),
(2, 2, '2026-06-02', 150.00),
(3, 1, '2026-06-03', 200.00),
(4, 3, '2026-06-04', 250.00),
(5, 2, '2026-06-05', 300.00);

-- Write a query to find the total payments made by each customer.

select customer_id, SUM(amount)
from payments
group by customer_id;

