create database customers;

CREATE TABLE customer (
  customer_id INT,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade VARCHAR(255),
  salesman_id INT
);

CREATE TABLE orders (
  ord_no INT,
  purch_amt DECIMAL(10, 2),
  ord_date DATE,
  customer_id INT,
  salesman_id INT
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
  (1, 'Prasad Appari', 'Mumbai', 'A', 101),
  (2, 'Sai Srinivas', 'Bangalore', 'A', 102),
  (3, 'Krishna Sai', 'Kolkata', 'B', 103),
  (4, 'Rohit sharma', 'Delhi', 'A', 104),
  (5, 'Sai Kalyan', 'Mumbai', 'A', 105),
  (6, 'Shanmuk Siva', 'Bangalore', 'B', 106);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
  (70001, 150.5, '2012-10-05', 1, 101),
  (70009, 270.65, '2012-09-10', 1, 101),
  (70002, 65.26, '2012-10-05', 2, 102),
  (70004, 110.5, '2012-08-17', 3, 103),
  (70007, 948.5, '2012-09-10', 3, 103),
  (70005, 2400.6, '2012-07-27', 4, 104),
  (70003, 5760, '2012-09-10', 5, 105),
  (70010, 1983.43, '2012-10-10', 6, 106);
  
  SELECT c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
FROM customer c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING AVG(o.purch_amt) > (
    SELECT AVG(purch_amt)
    FROM orders
  )
);

SELECT c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
FROM customer c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  GROUP BY o.customer_id
  HAVING AVG(o.purch_amt) > (
    SELECT AVG(purch_amt)
    FROM orders
  )
)
UNION
SELECT c.customer_id, c.cust_name, c.city, c.grade, c.salesman_id
FROM customer c
WHERE c.customer_id IN (
  SELECT o.customer_id
  FROM orders o
  WHERE o.purch_amt > 1000
);

select * from Customers;