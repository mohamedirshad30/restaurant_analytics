-- ZOMATO RESTAURANT ANALYTICS

CREATE DATABASE zomato_restaurant_analytics;
USE zomato_restaurant_analytics;

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    area VARCHAR(50) NOT NULL
);
select * from restaurants;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50) NOT NULL
);
select * from customers;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
select * from products;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2) CHECK (order_amount >= 0),
    delivery_time INT NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
select * from orders;

CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL UNIQUE,
    restaurant_id INT NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 1 AND 5),
    review VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
select * from ratings;

INSERT INTO restaurants VALUES
(1,'A2B','South Indian','Chennai','Ashok Nagar'),
(2,'SS Hyderabad Biryani','Biryani','Chennai','T Nagar'),
(3,'Anjappar','South Indian','Chennai','Vadapalani'),
(4,'Arabian Hut','Arabian','Chennai','Ashok Nagar'),
(5,'Dominos','Fast Food','Chennai','T Nagar'),
(6,'The Pasta Bar','Italian','Chennai','Nungambakkam'),
(7,'Chinese Wok','Chinese','Chennai','Velachery'),
(8,'Zaitoon','Arabian','Chennai','Anna Nagar'),
(9,'Dindigul Thalappakatti','Biryani','Chennai','Porur'),
(10,'Burger King','Fast Food','Chennai','Guindy');

INSERT INTO customers VALUES
(1,'Arun','9876543211','Chennai'),(2,'Karthik','9876543212','Chennai'),(3,'Priya','9876543213','Chennai'),
(4,'Hema','9876543214','Chennai'),(5,'Rahul','9876543215','Chennai'),(6,'Ayesha','9876543216','Chennai'),
(7,'Vignesh','9876543217','Chennai'),(8,'Divya','9876543218','Chennai'),(9,'Suresh','9876543219','Chennai'),
(10,'Meena','9876543220','Chennai'),(11,'Ajay','9876543221','Chennai'),(12,'Sneha','9876543222','Chennai'),
(13,'Ravi','9876543223','Chennai'),(14,'Nisha','9876543224','Chennai'),(15,'Faisal','9876543225','Chennai'),
(16,'Swetha','9876543226','Chennai'),(17,'Manoj','9876543227','Chennai'),(18,'Keerthi','9876543228','Chennai'),
(19,'Dinesh','9876543229','Chennai'),(20,'Pooja','9876543230','Chennai'),(21,'Hari','9876543231','Chennai'),
(22,'Anitha','9876543232','Chennai'),(23,'Vijay','9876543233','Chennai'),(24,'Shalini','9876543234','Chennai'),
(25,'Mohan','9876543235','Chennai'),(26,'Farzana','9876543236','Chennai'),(27,'Surya','9876543237','Chennai'),
(28,'Deepa','9876543238','Chennai'),(29,'Naveen','9876543239','Chennai'),(30,'Reshma','9876543240','Chennai');

INSERT INTO products (restaurant_id,product_name,category,price) VALUES
(1,'Masala Dosa','South Indian',90),(1,'Chicken Biryani','Biryani',220),(1,'Paneer Dosa','South Indian',140),
(2,'Chicken Biryani','Biryani',220),(2,'Mutton Biryani','Biryani',320),(2,'Chicken 65','Starters',180),
(3,'Chicken 65','Starters',180),(3,'Chicken Fried Rice','Chinese',190),(3,'Chicken Noodles','Chinese',190),
(4,'Chicken Shawarma','Arabian',150),(4,'Chicken Grill','Arabian',340),(4,'Mutton Mandi','Arabian',380),
(5,'Chicken Pizza','Fast Food',320),(5,'Veg Pizza','Fast Food',250),(5,'Garlic Bread','Fast Food',120),
(6,'Pasta Alfredo','Italian',280),(6,'Chicken Pasta','Italian',300),(6,'Margherita Pizza','Italian',260),
(7,'Chicken Noodles','Chinese',190),(7,'Chicken Fried Rice','Chinese',200),(7,'Dragon Chicken','Chinese',280),
(8,'Chicken Shawarma','Arabian',150),(8,'Chicken Grill','Arabian',340),(8,'Chicken Mandi','Arabian',350),
(9,'Chicken Biryani','Biryani',230),(9,'Mutton Biryani','Biryani',330),(9,'Chicken 65','Starters',180),
(10,'Chicken Burger','Fast Food',199),(10,'Whopper Burger','Fast Food',299),(10,'French Fries','Fast Food',120);

INSERT INTO orders (order_id,customer_id,restaurant_id,order_date,order_amount,delivery_time,order_status) VALUES
(1,1,1,'2026-08-01',280,25,'Delivered'),(2,2,1,'2026-08-02',350,27,'Delivered'),(3,3,1,'2026-08-03',220,24,'Delivered'),
(4,4,1,'2026-08-04',400,30,'Delivered'),(5,5,1,'2026-08-05',250,25,'Delivered'),(6,6,1,'2026-08-06',320,28,'Delivered'),
(7,7,1,'2026-08-07',450,32,'Delivered'),(8,8,1,'2026-08-08',220,24,'Delivered'),(9,9,1,'2026-08-09',280,27,'Delivered'),
(10,10,1,'2026-08-10',350,29,'Delivered'),(11,11,1,'2026-08-11',180,22,'Delivered'),(12,12,1,'2026-08-12',400,30,'Delivered'),
(13,13,1,'2026-08-13',250,25,'Delivered'),(14,14,1,'2026-08-14',320,28,'Delivered'),(15,15,1,'2026-08-15',450,35,'Delivered'),
(16,16,1,'2026-08-16',220,24,'Delivered'),(17,17,1,'2026-08-17',280,30,'Cancelled'),(18,18,1,'2026-08-18',350,27,'Delivered'),
(19,19,2,'2026-08-19',320,28,'Delivered'),(20,20,2,'2026-08-20',450,32,'Delivered'),(21,21,2,'2026-08-21',220,25,'Delivered'),
(22,22,2,'2026-08-22',350,30,'Delivered'),(23,23,2,'2026-08-23',400,29,'Delivered'),(24,24,2,'2026-08-24',280,27,'Delivered'),
(25,25,2,'2026-08-25',320,28,'Delivered'),(26,26,2,'2026-08-26',220,24,'Delivered'),(27,27,2,'2026-08-27',450,35,'Delivered'),
(28,28,2,'2026-08-28',250,25,'Delivered'),(29,29,2,'2026-08-29',350,30,'Cancelled'),(30,30,2,'2026-08-30',280,27,'Delivered'),
(31,1,2,'2026-08-31',400,31,'Delivered'),(32,2,2,'2026-09-01',320,28,'Delivered'),(33,3,2,'2026-09-02',220,24,'Delivered'),
(34,4,3,'2026-09-03',250,25,'Delivered'),(35,5,3,'2026-09-04',320,28,'Delivered'),(36,6,3,'2026-09-05',220,24,'Delivered'),
(37,7,3,'2026-09-06',280,27,'Delivered'),(38,8,3,'2026-09-07',350,30,'Delivered'),(39,9,3,'2026-09-08',400,32,'Delivered'),
(40,10,3,'2026-09-09',220,25,'Delivered'),(41,11,3,'2026-09-10',250,29,'Cancelled'),(42,12,3,'2026-09-11',320,28,'Delivered'),
(43,13,3,'2026-09-12',280,26,'Delivered'),(44,14,3,'2026-09-13',350,30,'Delivered'),(45,15,3,'2026-09-14',220,24,'Delivered'),
(46,16,3,'2026-09-15',400,31,'Delivered'),(47,17,4,'2026-09-16',340,24,'Delivered'),(48,18,4,'2026-09-17',380,26,'Delivered'),
(49,19,4,'2026-09-18',150,22,'Delivered'),(50,20,4,'2026-09-19',350,28,'Delivered'),(51,21,4,'2026-09-20',280,25,'Delivered'),
(52,22,4,'2026-09-21',380,30,'Delivered'),(53,23,4,'2026-09-22',220,29,'Cancelled'),(54,24,4,'2026-09-23',340,27,'Delivered'),
(55,25,4,'2026-09-24',380,31,'Delivered'),(56,26,4,'2026-09-25',150,23,'Delivered'),(57,27,4,'2026-09-26',350,28,'Delivered'),
(58,28,4,'2026-09-27',280,26,'Delivered'),(59,29,5,'2026-09-28',320,25,'Delivered'),(60,30,5,'2026-09-29',250,27,'Delivered'),
(61,1,5,'2026-09-30',320,29,'Delivered'),(62,2,5,'2026-10-01',280,26,'Delivered'),(63,3,5,'2026-10-02',400,31,'Delivered'),
(64,4,5,'2026-10-03',250,24,'Delivered'),(65,5,5,'2026-10-04',320,28,'Delivered'),(66,6,5,'2026-10-05',450,35,'Delivered'),
(67,7,5,'2026-10-06',220,30,'Cancelled'),(68,8,5,'2026-10-07',280,27,'Delivered'),(69,9,5,'2026-10-08',350,29,'Delivered'),
(70,10,6,'2026-10-09',300,24,'Delivered'),(71,11,6,'2026-10-10',280,26,'Delivered'),(72,12,6,'2026-10-11',320,29,'Cancelled'),
(73,13,6,'2026-10-12',260,25,'Delivered'),(74,14,6,'2026-10-13',350,30,'Delivered'),(75,15,6,'2026-10-14',300,27,'Delivered'),
(76,16,6,'2026-10-15',280,28,'Delivered'),(77,17,6,'2026-10-16',320,31,'Delivered'),(78,18,6,'2026-10-17',260,24,'Delivered'),
(79,19,6,'2026-10-18',300,26,'Delivered'),(80,20,7,'2026-10-19',200,23,'Delivered'),(81,21,7,'2026-10-20',280,28,'Cancelled'),
(82,22,7,'2026-10-21',190,25,'Delivered'),(83,23,7,'2026-10-22',200,26,'Delivered'),(84,24,7,'2026-10-23',280,30,'Delivered'),
(85,25,7,'2026-10-24',190,24,'Delivered'),(86,26,7,'2026-10-25',200,25,'Delivered'),(87,27,7,'2026-10-26',280,29,'Delivered'),
(88,28,8,'2026-10-27',350,32,'Cancelled'),(89,29,8,'2026-10-28',150,23,'Delivered'),(90,30,8,'2026-10-29',340,28,'Delivered'),
(91,1,8,'2026-10-30',350,30,'Delivered'),(92,2,8,'2026-10-31',150,24,'Delivered'),(93,3,8,'2026-11-01',340,27,'Delivered'),
(94,4,9,'2026-11-02',330,30,'Cancelled'),(95,5,9,'2026-11-03',230,25,'Delivered'),(96,6,9,'2026-11-04',180,24,'Delivered'),
(97,7,9,'2026-11-05',330,29,'Delivered'),(98,8,10,'2026-11-06',299,27,'Delivered'),
(99,9,10,'2026-11-07',199,30,'Cancelled'),(100,10,10,'2026-11-08',299,28,'Delivered');


INSERT INTO ratings (order_id,restaurant_id,rating,review) VALUES
(1,1,3.5,'Okay experience'),(2,1,4.0,'Good food'),(3,1,4.0,'Good food'),
(4,1,4.5,'Very good experience'),(5,1,3.5,'Okay experience'),(6,1,4.0,'Good food'),
(7,1,4.5,'Very good experience'),(8,1,4.0,'Good food'),(9,1,3.5,'Okay experience'),
(10,1,4.5,'Very good experience'),(11,1,4.0,'Good food'),(12,1,3.5,'Okay experience'),
(13,1,4.0,'Good food'),(14,1,4.5,'Very good experience'),(15,1,4.0,'Good food'),
(16,1,3.5,'Okay experience'),(17,1,4.0,'Good food'),(18,1,4.5,'Very good experience'),
(19,2,4.5,'Very good experience'),(20,2,5.0,'Excellent food and service'),(21,2,4.0,'Good food'),
(22,2,4.5,'Very good experience'),(23,2,5.0,'Excellent food and service'),(24,2,4.0,'Good food'),
(25,2,4.5,'Very good experience'),(26,2,5.0,'Excellent food and service'),(27,2,4.5,'Very good experience'),
(28,2,4.0,'Good food'),(29,2,4.5,'Very good experience'),(30,2,5.0,'Excellent food and service'),
(31,2,4.0,'Good food'),(32,2,4.5,'Very good experience'),(33,2,5.0,'Excellent food and service'),
(34,3,4.0,'Good food'),(35,3,4.5,'Very good experience'),(36,3,4.0,'Good food'),
(37,3,5.0,'Excellent food and service'),(38,3,4.5,'Very good experience'),(39,3,4.0,'Good food'),
(40,3,4.5,'Very good experience'),(41,3,4.0,'Good food'),(42,3,5.0,'Excellent food and service'),
(43,3,4.5,'Very good experience'),(44,3,4.0,'Good food'),(45,3,4.5,'Very good experience'),
(46,3,5.0,'Excellent food and service'),(47,4,4.5,'Very good experience'),(48,4,5.0,'Excellent food and service'),
(49,4,4.0,'Good food'),(50,4,4.5,'Very good experience'),(51,4,5.0,'Excellent food and service'),
(52,4,4.0,'Good food'),(53,4,4.5,'Very good experience'),(54,4,5.0,'Excellent food and service'),
(55,4,4.0,'Good food'),(56,4,4.5,'Very good experience'),(57,4,5.0,'Excellent food and service'),
(58,4,4.0,'Good food'),(59,5,4.0,'Good food'),(60,5,4.5,'Very good experience'),
(61,5,4.0,'Good food'),(62,5,4.5,'Very good experience'),(63,5,5.0,'Excellent food and service'),
(64,5,4.0,'Good food'),(65,5,4.5,'Very good experience'),(66,5,4.0,'Good food'),
(67,5,4.5,'Very good experience'),(68,5,5.0,'Excellent food and service'),(69,5,4.0,'Good food'),
(70,6,4.5,'Very good experience'),(71,6,4.0,'Good food'),(72,6,4.5,'Very good experience'),
(73,6,5.0,'Excellent food and service'),(74,6,4.0,'Good food'),(75,6,4.5,'Very good experience'),
(76,6,5.0,'Excellent food and service'),(77,6,4.0,'Good food'),(78,6,4.5,'Very good experience'),
(79,6,5.0,'Excellent food and service'),(80,7,4.0,'Good food'),(81,7,4.5,'Very good experience'),
(82,7,4.0,'Good food'),(83,7,4.5,'Very good experience'),(84,7,5.0,'Excellent food and service'),
(85,7,4.0,'Good food'),(86,7,4.5,'Very good experience'),(87,7,5.0,'Excellent food and service'),
(88,8,4.0,'Good food'),(89,8,4.5,'Very good experience'),(90,8,5.0,'Excellent food and service'),
(91,8,4.0,'Good food'),(92,8,4.5,'Very good experience'),(93,8,5.0,'Excellent food and service'),
(94,9,4.0,'Good food'),(95,9,4.5,'Very good experience'),(96,9,4.0,'Good food'),
(97,9,4.5,'Very good experience'),(98,10,2.5,'Needs improvement'),
(99,10,3.0,'Average experience'),(100,10,3.0,'Average experience');

-- ASSIGNMENT QUESTIONS 
-- Q1. Which restaurants receive the most orders?
SELECT 
    r.restaurant_id,r.restaurant_name,r.city,
    COUNT(o.order_id) AS total_orders
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name, r.city
ORDER BY total_orders DESC LIMIT 1;

-- Q2. Which cuisine has the highest average rating?
SELECT 
    r.cuisine,ROUND(AVG(rt.rating), 2) AS avg_rating
FROM restaurants r
JOIN ratings rt ON r.restaurant_id = rt.restaurant_id
GROUP BY r.cuisine ORDER BY avg_rating DESC
LIMIT 1;


-- Q3. Which city or area has the highest demand?
SELECT 
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_orders DESC
LIMIT 1;

-- Q4. What is the average delivery time?
SELECT ROUND(AVG(delivery_time),2) AS average_delivery_time_minutes
FROM orders;

-- Q5. Which restaurants have high orders but low ratings?
SELECT 
    r.restaurant_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(AVG(rt.rating), 2) AS avg_rating
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
JOIN ratings rt ON o.order_id = rt.order_id
GROUP BY r.restaurant_id, r.restaurant_name
HAVING COUNT(o.order_id) >= 10 AND AVG(rt.rating) < 4.5
ORDER BY total_orders DESC;




