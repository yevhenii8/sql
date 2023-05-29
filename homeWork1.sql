USE hr;

-- task4 --
SELECT *
FROM employees
WHERE department_id > 90;
-- task5 --
SELECT *
FROM employees
WHERE salary > 5000;
-- task6 --
SELECT *
FROM employees
WHERE last_name LIKE 'L%';
-- task7 --
SELECT *
FROM departments
WHERE location_id IN (1700);
-- task8 --
SELECT city
FROM locations
WHERE country_id LIKE 'US';