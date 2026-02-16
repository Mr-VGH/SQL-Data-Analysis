CREATE DATABASE Ecommerce_SQL_Database;
USE Ecommerce_SQL_Database;
USE Ecommerce_SQL_Database;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);
INSERT INTO Customers VALUES
(1,'Rahul','Bangalore'),
(2,'Sneha','Delhi'),
(3,'Arjun','Mumbai');
SELECT * FROM Customers;
INSERT INTO Products VALUES
(101,'Laptop',50000),
(102,'Phone',20000),
(103,'Headphones',2000);
SELECT * FROM Products;
INSERT INTO Orders VALUES
(1,1,101,1,'2024-01-10'),
(2,2,102,2,'2024-01-11'),
(3,1,103,3,'2024-01-12'),
(4,3,102,1,'2024-01-13');
SELECT * FROM Orders;
SELECT * FROM Products
WHERE price > 10000;
SELECT * FROM Products
ORDER BY price DESC;
SELECT customer_id,
SUM(quantity) AS Total_Products
FROM Orders
GROUP BY customer_id;
SELECT Customers.name, Products.product_name
FROM Orders
INNER JOIN Customers
ON Orders.customer_id = Customers.customer_id
INNER JOIN Products
ON Orders.product_id = Products.product_id;
SELECT Customers.name, Orders.order_id
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;
SELECT Customers.name, Orders.order_id
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;
SELECT name FROM Customers
WHERE customer_id IN
(SELECT customer_id FROM Orders);
SELECT AVG(price) AS Average_Price
FROM Products;
CREATE VIEW Customer_Orders AS
SELECT Customers.name, Products.product_name
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Products
ON Orders.product_id = Products.product_id;
SELECT * FROM Customer_Orders;
CREATE INDEX idx_customer
ON Orders(customer_id);
