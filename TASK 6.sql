-- Drop previous tables if exist
create database ajay ;
use ajay;


-- Create Customers table
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  city VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  amount DECIMAL(10, 2),
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into Customers
INSERT INTO Customers VALUES
(1, 'Amit', 'Pune'),
(2, 'Sneha', 'Mumbai'),
(3, 'Raj', 'Delhi'),
(4, 'Priya', 'Pune');

-- Insert data into Orders
INSERT INTO Orders VALUES
(101, 1, 500.00, '2024-06-01'),
(102, 2, 150.00, '2024-06-02'),
(103, 1, 300.00, '2024-06-05'),
(104, 3, 800.00, '2024-06-08');

-- 1. Subquery in SELECT (scalar subquery)
SELECT 
  name,
  (SELECT SUM(amount) FROM Orders WHERE Orders.customer_id = Customers.customer_id) AS total_spent
FROM Customers;

-- 2. Subquery in WHERE using IN
SELECT name
FROM Customers
WHERE customer_id IN (
  SELECT DISTINCT customer_id FROM Orders
);

-- 3. Subquery in WHERE using NOT IN
SELECT name
FROM Customers
WHERE customer_id NOT IN (
  SELECT customer_id FROM Orders
);

-- 4. Subquery using EXISTS (correlated)
SELECT name
FROM Customers c
WHERE EXISTS (
  SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id AND o.amount > 400
);

-- 5. Subquery in FROM (inline view)
SELECT customer_id, AVG(amount) AS avg_amount
FROM (
  SELECT customer_id, amount FROM Orders
) AS temp
GROUP BY customer_id;

-- 6. Correlated subquery in WHERE
SELECT *
FROM Orders o1
WHERE amount > (
  SELECT AVG(amount)
  FROM Orders o2
  WHERE o2.customer_id = o1.customer_id
);
