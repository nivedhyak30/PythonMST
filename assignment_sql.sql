CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(200),
    country VARCHAR(100)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    price DECIMAL(10, 2),
    publication_year INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_name VARCHAR(200),
    order_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


INSERT INTO authors (author_id, author_name, country)
VALUES
    (1, 'F. Scott Fitzgerald', 'United States'),
    (2, 'Harper Lee', 'United States'),
    (3, 'George Orwell', 'United Kingdom');


INSERT INTO books (book_id, title, author_id, price, publication_year)
VALUES
    (1, 'The Great Gatsby', 1, 12.99, 1925),
    (2, 'To Kill a Mockingbird', 2, 14.95, 1960),
    (3, '1984', 3, 10.99, 1949);


INSERT INTO orders (order_id, book_id, customer_name, order_date)
VALUES
    (1, 1, 'John Doe', '2023-01-15'),
    (2, 2, 'Jane Smith', '2023-02-02'),
    (3, 3, 'Alice Johnson', '2023-03-10');
SELECT * FROM books;
SELECT * FROM authors;
SELECT * FROM orders;
ALTER TABLE books ADD COLUMN genre VARCHAR(100);
SELECT * FROM books;
ALTER TABLE orders ADD COLUMN quantity INT;
SELECT * FROM orders;
SELECT books.*, authors.author_name, authors.country
FROM books
JOIN authors ON books.author_id = authors.author_id;
SELECT orders.*, books.title, books.price, books.publication_year, books.genre, authors.author_name, authors.country
FROM orders
JOIN books ON orders.book_id = books.book_id
LEFT JOIN authors ON books.author_id = authors.author_id;


