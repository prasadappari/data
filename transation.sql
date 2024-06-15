CREATE DATABASE transaction_example;
USE transaction_example;

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total DECIMAL(10, 2)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  quantity INT
);

INSERT INTO orders (order_id, customer_id, order_date, total) VALUES
  (1, 1, '2020-01-01', 100.00),
  (2, 1, '2020-01-15', 200.00),
  (3, 2, '2020-02-01', 50.00);

INSERT INTO products (product_id, product_name, quantity) VALUES
  (1, 'Product A', 100),
  (2, 'Product B', 200),
  (3, 'Product C', 300);
  

INSERT INTO orders (order_id, customer_id, order_date, total) VALUES
  (6, 3, '2020-03-01', 300.00);
  
COMMIT;
UPDATE products SET quantity = quantity - 10 WHERE product_id = 1;

ROLLBACK;


INSERT INTO orders (order_id, customer_id, order_date, total) VALUES
  (7, 1, '2020-01-01', 100.00);

SAVEPOINT sp1;

INSERT INTO orders (order_id, customer_id, order_date, total) VALUES
  (8, 1, '2020-01-15', 200.00);

SAVEPOINT sp2;

INSERT INTO orders (order_id, customer_id, order_date, total) VALUES
  (9, 2, '2020-02-01', 50.00);

ROLLBACK TO SAVEPOINT sp2;


COMMIT;

