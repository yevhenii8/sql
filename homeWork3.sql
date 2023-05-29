USE hr;

-- task1 --
SELECT department_id,
	CASE
		WHEN MAX(salary) > 10000 THEN 1
        ELSE 0
	END AS isYes
FROM employees
GROUP BY department_id;
-- task2 --
SELECT department_id,
	CASE
		WHEN MIN(salary) > 10000 THEN 1
        ELSE 0
        END AS isYes
FROM employees
GROUP BY department_id;
-- task3 --
SELECT * 
FROM employees
ORDER BY last_name ASC;
-- task4 --
SELECT *
FROM employees
ORDER BY salary DESC;

-- task5 --
SELECT *
FROM employees
WHERE department_id IN (60, 90, 110)
ORDER BY last_name ASC;
-- task6 --
SELECT *
FROM employees
WHERE job_id LIKE 'STCLERK'
ORDER BY salary DESC;
-- task7 --
SELECT *
FROM employees
WHERE first_name LIKE 'D%'
ORDER BY last_name ASC;


USE airports;
-- task1 --
SELECT id, price, service_class
FROM tickets
WHERE 
	CASE
		WHEN service_class LIKE 'Economy' THEN price BETWEEN 10000 AND 11000
        WHEN service_class LIKE 'PremiumEconomy' THEN price BETWEEN 20000 AND 30000
        WHEN service_class LIKE 'Business' THEN price > 100000
        ELSE 0
	END;
-- task2 --
SELECT 2023 - production_year AS age, 
	CASE
		WHEN production_year < 2000 THEN 'Old'
        WHEN production_year BETWEEN 2000 AND 2010 THEN 'Mid'
        ELSE 'New'
	END AS service_class
FROM airliners;
-- task3 --
SELECT id, trip_id,
CASE
		WHEN service_class LIKE 'Economy' THEN price * 0.85
        WHEN service_class LIKE 'PremiumEconomy' THEN price * 0.80
        WHEN service_class LIKE 'Business' THEN price * 0.90
	END AS newPrice
FROM tickets 
WHERE trip_id IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');
-- task4 --
DROP TABLE IF EXISTS goods;
CREATE TABLE goods (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(128),
quantity INTEGER,
-- task5 --
price INTEGER DEFAULT 0
);

INSERT INTO goods (title, quantity, price) VALUE ('bmw', 5, 0),
												 ('mercedes', 100, 5000),
												 ('porshe', 1, 20000),
                                                 ('audi', 32, 2500);
-- task6 --
SELECT *
FROM goods;                 
-- task7 --
ALTER TABLE goods
DROP COLUMN price;

ALTER TABLE goods
MODIFY COLUMN quantity INTEGER NOT NULL;

ALTER TABLE goods
ADD COLUMN weight DECIMAL(10, 2) DEFAULT 0.0;
-- task8 --
DROP TABLE IF EXISTS goods;