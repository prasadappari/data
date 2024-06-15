CREATE DATABASE library;

USE library;

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(50),
    publication_year INT,
    ISBN VARCHAR(13) UNIQUE
);

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(255),
    phone_number VARCHAR(15)
);

CREATE TABLE Borrowing (
    borrowing_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    date_borrowed DATE NOT NULL,
    date_due DATE NOT NULL,
    date_returned DATE,
    CONSTRAINT fk_book_borrowing FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT fk_member_borrowing FOREIGN KEY (member_id) REFERENCES Member(member_id),
    CONSTRAINT chk_returned_date CHECK (date_returned >= date_borrowed)
);

CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    date_reserved DATE NOT NULL,
    CONSTRAINT fk_book_reservation FOREIGN KEY (book_id) REFERENCES Book(book_id),
    CONSTRAINT fk_member_reservation FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

INSERT INTO Book (book_id, title, author, genre, publication_year, ISBN) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, '9780061120084'),
(2, '1984', 'George Orwell', 'Dystopian', 1949, '9780451524935'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, '9780743273565');

INSERT INTO Member (member_id, first_name, last_name, address, phone_number) VALUES
(1, 'Prasad', 'Purna', '789 amlapuram', '123456789'),
(2, 'Krishna', 'Mounika', '345 hyderbad', '889977665'),
(3, 'Shannu', 'sai', '978 vizag', '88997766');

INSERT INTO Borrowing (borrowing_id, book_id, member_id, date_borrowed, date_due, date_returned) VALUES
(1, 1, 1, '2024-06-01', '2024-06-15', NULL),
(2, 2, 2, '2024-05-15', '2024-06-05', '2024-06-04');

INSERT INTO Reservation (reservation_id, book_id, member_id, date_reserved) VALUES
(1, 3, 3, '2024-06-10');


select * from Customers;

show tables;




