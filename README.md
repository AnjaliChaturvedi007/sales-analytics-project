# Sales Analytics Project

## Overview
This project demonstrates data analysis and visualization techniques applied to sales data using SQL and Excel. The dataset includes sales transactions and customer information, enabling various analyses to derive insights into sales performance.

## Objectives
- Analyze total sales per city.
- Identify the top 3 customers by total sales amount.
- Display monthly sales trends.
- Find customers who haven’t made any purchases.
- Calculate the average age of customers per city.

## Data
The project uses two datasets:
1. **Sales Data**: Contains information about sales transactions.
   - Columns: SaleID, CustomerID, Product, Amount, SaleDate
2. **Customer Data**: Contains customer demographic details.
   - Columns: CustomerID, CustomerName, City, Age

### Sample Data

https://github.com/AnjaliChaturvedi007/sales-analytics-project/blob/main/HackStudio.xlsx

## SQL Queries
The SQL queries used for analysis can be found in the `sql/queries.sql` file. Key queries include:
1. **Total Sales per City**:
   SELECT c.City, SUM(s.Amount) AS TotalSales
   FROM Sales s
   JOIN Customers c ON s.CustomerID = c.CustomerID
   GROUP BY c.City;
2. **Find the Top 3 Customers by Total Sales Amount**:
   SELECT c.CustomerID, c.CustomerName, SUM(s.Amount) AS TotalSales
   FROM Sales s
   JOIN Customers c ON s.CustomerID = c.CustomerID
   GROUP BY c.CustomerID, c.CustomerName
   ORDER BY TotalSales DESC
   LIMIT 3;
3. **Display Monthly Sales (Sum of Amount Grouped by Month)**
   SELECT DATE_FORMAT(s.SaleDate, '%Y-%m') AS SaleMonth, SUM(s.Amount) AS MonthlySales
   FROM Sales s
   GROUP BY SaleMonth
   ORDER BY SaleMonth;
4. **Find Customers Who Haven’t Made Any Purchases**
   SELECT c.CustomerID, c.CustomerName
   FROM Customers c
   LEFT JOIN Sales s ON c.CustomerID = s.CustomerID
   WHERE s.CustomerID IS NULL;
5. **Find the Average Age of Customers per City**
   SELECT c.City, AVG(c.Age) AS AverageAge
   FROM Customers c
   GROUP BY c.City;

## Key Excel Tasks and Solutions:

Import SQL Query Results into Excel:

The results from the SQL query for total sales per city were imported into Excel for further analysis.
Pivot Table for Total Sales per Product:

A pivot table was created to summarize total sales for each product, allowing for quick insights into product performance.
Conditional Formatting:

Conditional formatting was applied to highlight the top 3 performing cities based on total sales.
Dashboard Visualization:

## A dashboard was built showing:

Total Revenue: Displayed the overall revenue from sales.
Number of Unique Customers: Counted distinct customers.
Average Sale per Customer: Calculated the average sale amount per customer.
Monthly Sales: Visualized as a line chart to show sales trends over time.
Bonus Challenges:

Added a slicer in Excel to filter the dashboard by City or Product.
Visualized the top 5 products in a bar chart.



   
