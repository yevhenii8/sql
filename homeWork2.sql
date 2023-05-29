USE hr;

-- task1 --
SELECT salary
FROM employees
WHERE first_name LIKE 'Lex' AND last_name LIKE 'De Haan';
-- task2 --
SELECT *
FROM employees
WHERE job_id LIKE 'FIACCOUNT' AND salary < 8000;
-- task3 --
SELECT *
FROM employees
WHERE last_name LIKE '%kk%' OR last_name LIKE '%ll%';
-- task4 --
SELECT *
FROM employees
WHERE commission_pct IS NULL;
-- task5 --
SELECT *
FROM employees
WHERE department_id NOT IN (80, 110);
-- task6 --
SELECT *
FROM employees
WHERE salary BETWEEN 5000 AND 7000;

USE airports;

-- task1 --
SELECT model_name,
	CASE
		WHEN rangee > 1000 AND rangee <= 2500 THEN 'short-haul'
		WHEN rangee > 2500 AND rangee <= 6000 THEN 'medium-haul'
		WHEN rangee > 6000 THEN 'long-haul'
		ELSE 'UNDEFINED'
	END AS category
FROM airliners;