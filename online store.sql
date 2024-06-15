CREATE DATABASE online_store;
USE online_store;

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total DECIMAL(10, 2)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  quantity INT
);

INSERT INTO orders (order_id, customer_id, order_date, total) VALUES
  (1001, 1, '2020-01-01', 100.00);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
  (1001-1, 1001, 123, 2),
  (1001-2, 1001, 456, 1);

INSERT INTO products (product_id, product_name, quantity) VALUES
  (123, 'Product A', 100),
  (456, 'Product B', 200);


START TRANSACTION;
 ROLLBACK TO SAVEPOINT savepoint_name;
COMMIT;