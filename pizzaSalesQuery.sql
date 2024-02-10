SELECT SUM(total_price) AS TotalRevenue
FROM pizza_sales

SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS AvgOrderValue
FROM pizza_sales

SELECT SUM(quantity) as TotalPizzasSold
FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS TotalOrders
FROM pizza_sales 

SELECT CAST(SUM(quantity) AS decimal(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS AvgPizzasPerOrder
FROM pizza_sales

--DAILY TREND OF ORDERS
SELECT DATENAME(DW,order_date) AS OrderDay, COUNT(DISTINCT order_id) AS TotalOrders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

--HOURLY TREND OF ORDERS
SELECT DATEPART(HOUR,order_time) AS OrderTime, COUNT(DISTINCT order_id) AS TotalOrders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)

--PERCENTAGE OF TOTAL SALES
SELECT pizza_category,SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales) AS PercentageSales
FROM pizza_sales
GROUP BY pizza_category

--PERCT OF SALES BY SIZE
SELECT pizza_size,CAST(SUM(total_price)*100 /(SELECT SUM(total_price) FROM pizza_sales) AS decimal(10,2)) AS PercentageSales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PercentageSales DESC

--TOTAL PIZZAS SOLD BY PIZZA CATEGORY
SELECT pizza_category,SUM(quantity) AS TotalPizzasSold
FROM pizza_sales
GROUP BY pizza_category

--TOP 5 PIZZAS SOLD
SELECT TOP 5 pizza_name,SUM(quantity) AS TotalSales
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

--BOTTOM 5 PIZZAS SOLD
SELECT TOP 5 pizza_name,SUM(quantity) AS TotalSales
FROM pizza_sales
--WHERE MONTH(order_date) = 2 (to filter by month)
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC

SELECT *
FROM pizza_sales