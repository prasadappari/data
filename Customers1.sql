create database Customers1;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  region VARCHAR(50)
);

CREATE TABLE orders (

  order_id INT PRIMARY KEY,

  customer_id INT,

  order_date DATE,

  total DECIMAL(10, 2),

  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);
INSERT INTO customers (customer_id, name, region) VALUES
  (1, 'Prasad', 'North'),
  (2, 'Krishna', 'South'),
  (3, 'Shannu', 'East'),
  (4, 'Sai', 'West'),
  (5, 'Kalyan', 'North');

INSERT INTO orders (order_id, customer_id, order_date, total) VALUES
  (1, 1, '2020-01-01', 100.00),
  (2, 1, '2020-01-15', 200.00),
  (3, 2, '2020-02-01', 50.00),
  (4, 3, '2020-03-01', 300.00),
  (5, 5, '2020-04-01', 400.00);
  
  SELECT c.customer_id, c.name, c.region, o.order_id, o.order_date, o.total
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.region = 'North'
ORDER BY c.customer_id;
  
  
-- Find the average order value
SELECT AVG(total) AS avg_order_value
FROM orders;

-- Find customers who have placed orders above the average order value
SELECT c.customer_id, c.name, o.order_date, o.total
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total > (SELECT AVG(total) FROM orders);

-- Combine with a UNION query to include all customers
SELECT c.customer_id, c.name, NULL AS order_date, NULL AS total
FROM customers c
WHERE c.customer_id NOT IN (SELECT o.customer_id FROM orders o)
UNION
SELECT c.customer_id, c.name, o.order_date, o.total
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total > (SELECT AVG(total) FROM orders)
ORDER BY c.customer_id;