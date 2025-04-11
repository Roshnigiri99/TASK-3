CREATE DATABASE superstore_db;
USE superstore_db;
-- Total sales by category in the 'South' region
SELECT Category, SUM(Sales) AS TotalSales
FROM Superstore
WHERE Region = 'South'
GROUP BY Category
ORDER BY TotalSales DESC;

--  Retrieves Order ID, Customer Name, and Sales from the Superstore table
SELECT `Order ID`, `Customer Name`, Sales
FROM Superstore
LIMIT 1000;

-- Products with sales above average
SELECT `Product Name`, `Sales`
FROM Superstore
WHERE `Sales` > (
    SELECT AVG(`Sales`) FROM Superstore
);

-- Average profit and total sales by segment
SELECT `Segment`, AVG(`Profit`) AS AvgProfit, SUM(`Sales`) AS TotalSales
FROM Superstore
GROUP BY `Segment`;

-- Create a view for top-selling products
CREATE VIEW TopSellingProducts AS
SELECT `Product Name`, SUM(`Sales`) AS TotalSales
FROM Superstore
GROUP BY `Product Name`
ORDER BY TotalSales DESC;
DROP VIEW IF EXISTS TopSellingProducts;

-- Create index on Customer ID and Product ID
CREATE INDEX idx_customer_id ON Superstore (`Customer ID`(20));
CREATE INDEX idx_product_id ON Superstore (`Product ID`(20));

-- Shows the 5 products that made the most total profit
SELECT `Product Name`, SUM(`Profit`) AS TotalProfit
FROM Superstore
GROUP BY `Product Name`
ORDER BY TotalProfit DESC
LIMIT 5;

-- Lists all different types of shipping modes used
SELECT DISTINCT `Ship Mode`
FROM Superstore;

-- Displays total sales per month
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS OrderMonth, SUM(`Sales`) AS MonthlySales
FROM Superstore
GROUP BY OrderMonth
ORDER BY OrderMonth;













