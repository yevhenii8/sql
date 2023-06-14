USE hr;
-- task1 --
SELECT
	COUNT(*) AS employeescnt,
    department_id
FROM employees
GROUP BY department_id;
-- task2 --
SELECT
	COUNT(*) AS employeescnt,
	d.department_name
FROM employees AS e
RIGHT JOIN departments AS d ON d.department_id = e.department_id
GROUP BY e.department_id, d.department_name;
-- task3 --
SELECT
	COUNT(*) AS emploeecnt,
    manager_id
FROM employees
GROUP BY manager_id;
-- task4 --
SELECT
    m.first_name,
    m.last_name,
    COUNT(e.employee_id) AS employeecnt
FROM employees m
LEFT JOIN employees e
ON e.manager_id = m.employee_id
GROUP BY m.first_name, m.last_name;
-- task5 --
SELECT
	department_id,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;
-- task6 --
SELECT
    first_name,
    last_name,
    department_id,
    MAX(salary) AS salary
FROM employees
GROUP BY department_id,
		 first_name,
         last_name;