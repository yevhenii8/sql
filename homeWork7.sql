USE tmp_1;

-- task1 --
SELECT
	t1.title
FROM products t1
JOIN (
	SELECT
		product_id,
		COUNT(*) AS total
	FROM orders
	GROUP BY product_id
) t2
ON t1.id = t2.product_id
WHERE t2.total = (
	SELECT
		MAX(total1)
	FROM (
		SELECT
			COUNT(*) AS total1
		FROM orders
		GROUP BY product_id
    ) t3
);
-- task2 --
SELECT
	t1.title
FROM products t1
JOIN (
	SELECT
		product_id,
		COUNT(*) AS at1,
		SUM(product_count) AS at2
	FROM orders
    GROUP BY product_id
) t2
ON t1.id = t2.product_id
WHERE t2.at1 * t2.at2 = (
	SELECT
		MAX(total1)
	FROM (
		SELECT
			t3.at11 * t3.at22 AS total1
		FROM (
			SELECT
				COUNT(*) AS at11,
                SUM(product_count) AS at22
			FROM orders
            GROUP BY product_id
		) t3
    ) t4
);
-- task3 --
SELECT
	SUM(product_count * price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.id;
-- task4 --
SELECT
	order_type,
	SUM(product_count * price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY order_type