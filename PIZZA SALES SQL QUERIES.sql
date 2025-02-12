SELECT SUM(total_price) AS TOTAL_REVENUE FROM pizza_sales;

SELECT * FROM pizza_sales;

SELECT CAST(SUM(total_price) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS AVG_ORDER_VALUE
FROM pizza_sales;


SELECT SUM(quantity) AS Total_Quantity FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;


SELECT CAST (CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))
AS DECIMAL(10,2))AS Avg_Pizza_Per_Order 
FROM pizza_sales; 

--Daily Trend
SELECT DATENAME(DW,order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date);

--Hourly Trend
SELECT DATEPART(HOUR, order_time) AS Order_Hours,
COUNT ( DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time);

--Percentage Of Sales By Pizza Category 
SELECT pizza_category,CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,CAST(SUM(total_price)*100/
(SELECT SUM(total_price)FROM pizza_sales ) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

--Percentage Of Sales By Pizza Size
SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,CAST(SUM(total_price)*100/
(SELECT SUM(total_price)FROM pizza_sales ) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

--Total Pizza Sold By Pizza Category
SELECT pizza_category, SUM(quantity) AS Pizza_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Pizza_Sold DESC;

--Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold;