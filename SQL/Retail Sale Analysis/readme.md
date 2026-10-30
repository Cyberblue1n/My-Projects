# Retail Sales Analysis using SQL

## Project Overview

**Project Title**: Retail Sales Analysis  
**Database**: `p1_retail_db`
**Tool**: `SQL Server Management Studio 22`

In this project, I demonstrated my SQL skills and applied techniques commonly used by data analysts to explore, clean, and analyze retail sales data. The project involved creating a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions using SQL queries.. 

## Objectives

1. **Create a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `p1_retail_db`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE retail_sales_db;

USE retail_sales_db;

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

```

### 2. Data Exploration & Cleaning

- **Record Count**: Total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
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

-- Data Cleaning
DELETE FROM sales_db
WHERE quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

-- DATASET AFTER DELETION
SELECT COUNT(*) FROM sales_db;

SELECT * FROM sales_db;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
SELECT * FROM sales_db
WHERE sale_date = '2022-11-05';
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
SELECT transactions_id, category, quantiy, sale_date FROM sales_db
WHERE category='Clothing' AND
quantiy>=4 AND
sale_date >= '2022-11-01'
AND sale_date < '2022-12-01';
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
SELECT category, SUM(total_sale) AS total_sale FROM sales_db
GROUP BY category; 
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
SELECT AVG(age) AS Average_Age FROM sales_db
WHERE category='Beauty';
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
SELECT transactions_id, quantiy, price_per_unit, cogs, total_sale FROM sales_db
WHERE total_sale>1000;
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
SELECT COUNT(transactions_id) AS transaction_count, gender, category FROM sales_db
GROUP BY category, gender;
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
SELECT * FROM 
(   SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month, AVG(total_sale) AS avg_sale,
    RANK() OVER(PARTITION BY(YEAR(sale_date)) ORDER BY AVG(total_sale) DESC) AS sales_rank 
    FROM sales_db
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE sales_rank=1;
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
SELECT TOP 5 customer_id, SUM(total_sale) FROM sales_db
ORDER BY SUM(total_sale) DESC;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
SELECT category, COUNT(DISTINCT(customer_id)) AS unique_customers FROM sales_db
GROUP BY category;
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
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
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## Author - Nilanjan Dey

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

### Contact For Data Analysis project

For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:

- **YouTube**: [My youtube channel for porfolio](www.youtube.com/@DataWithBlue)
- **Instagram**: [Follow me for daily tips and updates](https://www.instagram.com/datawithblue?cplk=bjUxZDZlNHd2Ynh6)
- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/nilanjandey7/)


Thank you. 
