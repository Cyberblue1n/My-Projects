--DATABASE CREATION 
CREATE DATABASE retail_sales_db;

USE retail_sales_db;

------------------
-- TABLE CREATION |
------------------
CREATE TABLE sales_db(
transactions_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age INT,
category VARCHAR(10),
quantity INT, 
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
);



--------------------
-- DATA IS IMPORTED |
--------------------

ALTER TABLE Retail_Sales_dataset
ALTER COLUMN transactions_id INT NOT NULL;


--ADDING PRIMARY KEY IN COLUMN "transactions_id"
ALTER TABLE Retail_Sales_dataset
ADD CONSTRAINT PK_Retail_Sales_dataset
PRIMARY KEY (transactions_id);

-------------
SELECT * FROM Retail_Sales_dataset;

/*
DATA CLEANING AND EXPLORATION
Record Count: Determine the total number of records in the dataset.
Customer Count: Find out how many unique customers are in the dataset.
Category Count: Identify all unique product categories in the dataset.
Null Value Check: Check for any null values in the dataset and delete records with missing data.
*/

--RECORD COUNT
SELECT COUNT(*) AS total_records FROM sales_db;

--UNIQUE CUSTOMER COUNT
SELECT COUNT(DISTINCT(customer_id)) AS customer_records FROM sales_db;

--UNIQUE CATERGORY COUNT
SELECT COUNT(DISTINCT(category)) AS category_count FROM sales_db;

--UNIQUE CATEGORIES
SELECT DISTINCT(category) AS category_count FROM sales_db;

--NULL VALUE CHECK
SELECT * FROM sales_db
WHERE 
transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;


-- DATA CLEANING/ REMOVING NULL VALUES

DELETE FROM sales_db
WHERE quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

-- DATASET AFTER DELETION
SELECT COUNT(*) FROM sales_db;

SELECT * FROM sales_db;

--Number of sales
SELECT COUNT(DISTINCT(total_sale)) AS Number_of_Sale FROM sales_db;

--Write a SQL query to retrieve all columns for sales made on '2022-11-05':
SELECT * FROM sales_db
WHERE sale_date = '2022-11-05';

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT AVG(age) AS Average_Age FROM sales_db
WHERE category='Beauty';

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT transactions_id, quantiy, 
price_per_unit, cogs, total_sale FROM sales_db
WHERE total_sale>1000;

-- Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT category, SUM(total_sale) AS total_sale FROM sales_db
GROUP BY category; 

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT COUNT(transactions_id) AS transaction_count, gender, category FROM sales_db
GROUP BY category, gender;

-- Write a SQL query to find the top 5 customers based on the highest total sales **(48.54 min)
SELECT TOP 5 customer_id, SUM(total_sale) FROM sales_db
ORDER BY 2 DESC;

-- Write a SQL query to find the number of unique customers who purchased items from each category.:
SELECT category, COUNT(DISTINCT(customer_id)) AS unique_customers FROM sales_db
GROUP BY category;

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
SELECT transactions_id, category, quantiy, sale_date FROM sales_db
WHERE category='Clothing' AND
quantiy>=4 AND
sale_date >= '2022-11-01'
AND sale_date < '2022-12-01';

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year: (45 min)
SELECT * FROM 
(   SELECT YEAR(sale_date) AS year,
    MONTH(sale_date) AS month, AVG(total_sale) AS avg_sale,
    RANK() OVER(
        PARTITION BY(YEAR(sale_date)) 
        ORDER BY AVG(total_sale) DESC) AS sales_rank FROM sales_db
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE sales_rank=1;

-- Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17): **(51.40 min)
With Hourly_Sale AS(
SELECT *, 
CASE
    WHEN DATEPART(HOUR, sale_time)<12 THEN 'Morning'
    WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS shift_time
FROM sales_db
)
SELECT shift_time, COUNT(*) AS total_orders FROM hourly_sale
GROUP BY shift_time;



