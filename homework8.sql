CREATE DATABASE gt;
USE gt;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(20),
    lastname VARCHAR(20),
    gender char(1) check(gender in ('f', 'm')),
    age integer
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    customerid integer,
    productid integer,
    ordertype varchar(128),
    product_count integer
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    title varchar(128),
    price numeric(8, 2)
);

INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 2, 'online', 5);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 1, 'direct', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 4, 'direct', 6);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 3, 'direct', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 4);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 7, 'online', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 9, 'online', 7);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (6, 5, 'direct', 4);

INSERT INTO customers (name, lastname, age, gender) VALUES ('Гайк', 'Инанц', 29, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Максим', 'Грибов', 32, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Антон', 'Куликов', 27, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Юрий', 'Митрофанов', 30, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Нелли', 'Ефремян', 25, 'f');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Ольга', 'Степанова', 35, 'f');

INSERT INTO products (title, price) VALUES ('молоко', 70);
INSERT INTO products (title, price) VALUES ('колбаса', 230);
INSERT INTO products (title, price) VALUES ('хлопья', 150);
INSERT INTO products (title, price) VALUES ('хлеб', 30);
INSERT INTO products (title, price) VALUES ('масло', 120);
INSERT INTO products (title, price) VALUES ('чипсики', 60);
INSERT INTO products (title, price) VALUES ('шоколад', 70);
INSERT INTO products (title, price) VALUES ('кетчуп', 150);
INSERT INTO products (title, price) VALUES ('яблоко', 70);

-- task1 --
SELECT
	name,
    lastname
FROM customers
WHERE id NOT IN (
	SELECT
		customerid
	FROM orders
);
-- task2 --
SELECT
	title
FROM products
WHERE id NOT IN (
	SELECT
		productid
	FROM orders
);
-- task3 --
SELECT
	*
FROM products p
LEFT JOIN orders o 
ON p.id = o.productid
AND o.ordertype = 'online'
WHERE o.id IS NULL;
-- task4 --
SELECT
	name,
    lastname
FROM customers
WHERE id IN (
	SELECT
		o.customerid
	FROM orders o
	JOIN products p
	ON p.id = o.productid
	WHERE p.price * o.product_count = (
		SELECT
			MAX(p.price * o.product_count) AS max_tp
		FROM orders o
		JOIN products p
		ON p.id = o.productid
	)
);
