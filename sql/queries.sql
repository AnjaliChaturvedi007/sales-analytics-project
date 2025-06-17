-- 1. Total Sales per City
SELECT 
    c.City, 
    SUM(s.Amount) AS TotalSales
FROM 
    sales s
JOIN 
    customers c ON s.CustomerID = c.CustomerID
GROUP BY 
    c.City
ORDER BY 
    TotalSales DESC;

-- 2. Top 3 Customers by Total Sales Amount
SELECT 
    s.CustomerID, 
    SUM(s.Amount) AS TotalSales
FROM 
    sales s
GROUP BY 
    s.CustomerID
ORDER BY 
    TotalSales DESC
LIMIT 3;

-- 3. Monthly Sales (Sum of Amount Grouped by Month)
SELECT 
    DATE_FORMAT(s.SaleDate, '%Y-%m') AS SaleMonth, 
    SUM(s.Amount) AS MonthlySales
FROM 
    sales s
GROUP BY 
    SaleMonth
ORDER BY 
    SaleMonth;

-- 4. Customers Who Haven’t Made Any Purchases
SELECT 
    c.CustomerID, 
    c.CustomerName
FROM 
    customers c
LEFT JOIN 
    sales s ON c.CustomerID = s.CustomerID
WHERE 
    s.CustomerID IS NULL;

-- 5. Average Age of Customers per City
SELECT 
    c.City, 
    AVG(c.Age) AS AverageAge
FROM 
    customers c
GROUP BY 
    c.City
ORDER BY 
    AverageAge;

-- Bonus: Total Revenue
SELECT 
    SUM(s.Amount) AS TotalRevenue
FROM 
    sales s;

-- Bonus: Number of Unique Customers
SELECT 
    COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM 
    sales;

-- Bonus: Average Sale per Customer
SELECT 
    AVG(TotalSales) AS AverageSalePerCustomer
FROM 
    (SELECT 
        CustomerID, 
        SUM(Amount) AS TotalSales
     FROM 
        sales
     GROUP BY 
        CustomerID) AS CustomerSales;

-- Bonus: Monthly Sales Line Chart Data
SELECT 
    DATE_FORMAT(SaleDate, '%Y-%m') AS SaleMonth, 
    SUM(Amount) AS MonthlySales
FROM 
    sales
GROUP BY 
    SaleMonth
ORDER BY 
    SaleMonth;
