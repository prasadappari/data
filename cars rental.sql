CREATE DATABASE cars;

CREATE TABLE Locations (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Cars (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    status ENUM('available', 'rented', 'maintenance') NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES cars.Locations(location_id)
);

CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    car_id INT NOT NULL,
    customer_id INT NOT NULL,
    rental_date DATE NOT NULL,
    return_date DATE,
    status ENUM('ongoing', 'completed', 'canceled') NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Payments (
   payment_id INT PRIMARY KEY AUTO_INCREMENT,
   rental_id INT NOT NULL,
   amount DECIMAL(10, 2) NOT NULL,
   payment_date DATE NOT NULL,
   payment_method ENUM('cash', 'credit_card', 'debit_card', 'paypal') NOT NULL,
   FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);

INSERT INTO cars.Locations (location_name, address) VALUES
('Main Office', 'nallamilli, Amalapuram'),
('Downtown Branch', 'myapur, Hyderbad'),
('Westside Branch', 'ksr junction, Bengaluru');

INSERT INTO Customers (name, address, phone, email) VALUES
('Prasad', 'nallamilli, Amalapuram', '123456789', 'prasad1@example.com'),
('Krishna', 'myapur, Hyderbad', '987654321', 'krishna8@example.com'),
('Sai', 'ksr junction, Bengaluru', '546372829', 'sai5@example.com');

INSERT INTO Cars (make, model, year, status, location_id) VALUES
('Toyota', 'Camry', 2022, 'available', 1),
('Honda', 'Civic', 2020, 'available', 2),
('Ford', 'Fusion', 2021, 'available', 3);

INSERT INTO Rentals (car_id, customer_id, rental_date, return_date, status) VALUES
(1, 1, '2024-06-13', '2024-06-20', 'completed'),
(2, 2, '2024-06-15', NULL, 'ongoing');



SELECT * FROM Customers;
SELECT * FROM Cars WHERE status = 'available';
SELECT * FROM Rentals WHERE customer_id = 1; 
SELECT * FROM Cars WHERE location_id = 1;
SELECT * FROM Rentals WHERE rental_id = 1;
SELECT * FROM Rentals WHERE status = 'ongoing';
SELECT Customers.name, Rentals.rental_id, Rentals.rental_date, Rentals.return_date, Rentals.status
FROM Customers JOIN Rentals ON Customers.customer_id = Rentals.customer_id;

SELECT Cars.make, Cars.model, Cars.year, Cars.status, Locations.city
FROM Cars JOIN Locations ON Cars.location_id = Locations.location_id;

SELECT * FROM Payments WHERE rental_id = 1;
SELECT SUM(amount) AS total_revenue FROM Payments;
