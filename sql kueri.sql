--Berapa rata-rata umur customer jika dilihat dari marital statusnya ?
SELECT marital_status, ROUND(AVG(age)) AS average_age
FROM customer
WHERE marital_status IS NOT null
GROUP BY marital_status;

--Berapa rata-rata umur customer jika dilihat dari gender nya ?
SELECT 
	CASE 
		WHEN gender = 0 THEN 'Female'
		WHEN gender = 1 THEN 'Male'
	END AS gender,
	ROUND(AVG(age)) AS average_age
FROM customer
WHERE gender IS NOT null 
GROUP BY gender; 


--Tentukan nama store dengan total quantity terbanyak!

SELECT str.store_name, str.store_id, SUM(trx.qty) AS total_quantity
FROM store str
JOIN transaction trx ON str.store_id = trx.store_id
GROUP BY str.store_name, str.store_id
ORDER BY total_quantity DESC;

--Tentukan nama produk terlaris dengan total amount terbanyak!
SELECT prd.product_name, prd.product_id, SUM(trx.total_amount) AS highest_total_amount
FROM product prd
JOIN transaction trx ON prd.product_id = trx.product_id
GROUP BY prd.product_name, prd.product_id
ORDER BY highest_total_amount DESC;

