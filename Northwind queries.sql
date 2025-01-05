SELECT * FROM customers

---Create a report that shows contact_name,title, company_name and country, sort by country.
SELECT contact_name AS name,contact_title AS title,company_name,country
FROM customers
ORDER BY country;
------------------------------------------------------------------------------------------------------------------
---Create a list of employees showing their birth_date in descending order
SELECT first_name,last_name, birth_date 
FROM employees
ORDER BY birth_date DESC;
------------------------------------------------------------------------------------------------------------------
---Removing duplicates from the customer table
WITH duplicated AS (
	 SELECT DISTINCT ON (customer_id) *
	 FROM customers
	 ORDER BY customer_id)
DELETE FROM customers
WHERE customers.customer_id NOT IN (SELECT customer_id FROM duplicated)
--------------------------------------------------------------------------------------------------------------------
--Show Employees  purchases with their name, ID and the shipped date
SELECT first_name,last_name,order_id,shipped_date
FROM employees
JOIN orders ON employees.employee_id = orders.employee_id;
--------------------------------------------------------------------------------------------------------------------
---Checking for Null rows
SELECT * FROM customers
WHERE region IS NULL

--Setting Null Values to be unknown
UPDATE customers
SET region = 'Unknown'
WHERE region is NULL

--Deleting Null region
DELETE FROM customers
WHERE region is NULL
--------------------------------------------------------------------------------------------------------------------
----Using COALESCE operator to manipulate but not tamper with the data
SELECT customer_id, contact_name, COALESCE(Region, 'Unknown') AS Region 
FROM customers;
--------------------------------------------------------------------------------------------------------------------
--Analyse the impact of NULLS
SELECT country, COUNT(*) AS TotalCustomers, COUNT (region) AS CustomersWithRegion, COUNT(*)-COUNT(region) AS CustomersWithoutRegion
FROM customers
GROUP BY country
-------------------------------------------------------------------------------------------------------------------
--Exploratory data analysis

--Get products by category
SELECT c.category_name,p.product_name
FROM products p
JOIN categories c
ON p.category_id = c.category_id
ORDER BY c.category_name
------------------------------------------------------------------------------------------------------------------
--Find the most expensive and least expensive product 
--UNION ALL operator is used to combine the results of two or more SELECT queries into a single result
(SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 1)
UNION ALL
(SELECT product_name, unit_price
FROM products
ORDER BY unit_price ASC
LIMIT 1);
---------------------------------------------------------------------------------------------------------------
--- CASE operator used to perform conditional logic within a query. 
----It allows you to evaluate conditions and return a specific result based on those conditions.
-----Count the current and discontinued products

SELECT
	SUM(CASE WHEN discontinued = 0 THEN 1 ELSE 0 END) AS current_products,
	SUM(CASE WHEN discontinued = 1 THEN 1 ELSE 0 END) AS discontinued_products
FROM products;
-----------------------------------------------------------------------------------------------------------------
---Show sales data by categories for the year 1997 only 
SELECT c.category_name,
    SUM(od.Quantity * od.Unit_Price * (1 - od.Discount)) AS Total_Sales
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
WHERE EXTRACT(YEAR FROM o.order_date) = 1997
GROUP BY c.category_name
ORDER BY Total_Sales DESC;
---------------------------------------------------------------------------------------------------------------
--For each category, get the list of products sold and total amount per product 
SELECT c.category_name,
	   p.product_name,
    SUM(od.Quantity * od.Unit_Price * (1 - od.Discount)) AS Total_Sales
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name, p.product_name;
-------------------------------------------------------------------------------------------------------------



