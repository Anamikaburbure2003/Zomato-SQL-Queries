CREATE DATABASE Zomato


-- 2️⃣ Create Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255),
    city VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(255)
);

select * from customers

-- 3️⃣ Create Restaurants Table
CREATE TABLE restaurants (
    restaurant_id SERIAL PRIMARY KEY,
    restaurant_name VARCHAR(255),
    cuisine_type VARCHAR(100),
    location VARCHAR(255),
    avg_rating DECIMAL(2,1)
);

select * from restaurants


-- 4️⃣ Create Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    restaurant_id INT REFERENCES restaurants(restaurant_id),
    order_date TIMESTAMP,
    total_amount DECIMAL(10,2),
    delivery_time INT, -- in minutes
    rating DECIMAL(2,1) -- Customer rating out of 5
);

select * from orders


-- 5️⃣ Insert Data into Customers Table
INSERT INTO customers (customer_name, city, phone, email) VALUES
('Ankit Sharma', 'Mumbai', '9876543210', 'ankit@gmail.com'),
('Riya Mehta', 'Delhi', '8765432109', 'riya@gmail.com'),
('Saurabh Singh', 'Bangalore', '7654321098', 'saurabh@gmail.com'),
('Neha Kapoor', 'Pune', '6543210987', 'neha@gmail.com'),
('Amit Verma', 'Kolkata', '5432109876', 'amit@gmail.com');

select * from customers

-- 6️⃣ Insert Data into Restaurants Table
INSERT INTO restaurants (restaurant_name, cuisine_type, location, avg_rating) VALUES
('The Food Lounge', 'Indian', 'Mumbai', 4.2),
('Spicy Bites', 'Chinese', 'Delhi', 3.8),
('Pizza Palace', 'Italian', 'Bangalore', 4.7),
('Sushi World', 'Japanese', 'Pune', 4.9),
('Burger Hub', 'American', 'Kolkata', 4.0);

select * from restaurants


-- 7️⃣ Insert Data into Orders Table
INSERT INTO orders (customer_id, restaurant_id, order_date, total_amount, delivery_time, rating) VALUES
(1, 1, '2024-02-15 12:30:00', 350.50, 35, 4.2),
(2, 2, '2024-02-15 13:15:00', 250.00, 40, 3.8),
(3, 1, '2024-02-15 14:10:00', 500.00, 25, 4.5),
(4, 3, '2024-02-15 15:00:00', 600.00, 30, 4.7),
(5, 4, '2024-02-15 16:45:00', 750.00, 50, 4.9),
(1, 2, '2024-02-16 12:00:00', 320.00, 42, 3.6),
(2, 1, '2024-02-16 13:20:00', 400.00, 38, 4.1),
(3, 3, '2024-02-16 14:00:00', 550.00, 29, 4.8),
(4, 5, '2024-02-16 15:15:00', 200.00, 20, 4.0),
(5, 4, '2024-02-16 16:50:00', 700.00, 45, 4.6);


select * from orders

--Retrieve all orders placed in the last 30 days--

SELECT * 
FROM orders 
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';


--Get the total number of orders for each restaurant--

SELECT restaurant_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY restaurant_id
ORDER BY total_orders DESC;

--Find the top 5 customers who spent the most--

SELECT customer_id, SUM(total_amount) 
FROM orders
GROUP BY customer_id;

--Get the average order amount per restaurant--

select restaurant_id, avg(total_amount)as avg_order_amount
from orders
group by restaurant_id;


--Find the total number of orders per restaurant--

SELECT restaurant_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY restaurant_id
ORDER BY total_orders DESC;

--Find the highest and lowest order amounts--

SELECT MAX(total_amount) AS highest_order, MIN(total_amount) AS lowest_order FROM orders;




