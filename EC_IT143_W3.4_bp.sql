/****************************************************************************************************************
-- Script Name: EC_IT143_W3.4_bp.sql
-- Project: IT143 Unit 3.4 Adventure Works - Create Answers
-- Author: Blessing Peter Effiong
-- Date: 2026-11-11
-- Description: T-SQL script answering 8 AdventureWorks questions (2 original questions + 6 peer questions)
--              across 4 complexity levels, formatted according to SQL standard rules with proper headers 
--              and student attributions.
-- Estimated Runtime: ~00:00:05 seconds
/****************************************************************************************************************/

-- ==============================================================================================================
-- LEARNING RESOURCES USED FOR THIS ASSIGNMENT:
-- 1. Stack Overflow Help Center: How do I ask a good question? (https://stackoverflow.com/help/how-to-ask)
-- 2. Stack Overflow Help Center: How do I write a good answer? (https://stackoverflow.com/help/mcve)
-- 3. LearnSQL.com: 24 Rules to the SQL Formatting Standard (https://learnsql.com/blog/sql-formatting-standards/)
-- ==============================================================================================================

USE AdventureWorks;
GO

------------------------------------------------------------------------------------------------------------------
-- CATEGORY 1: Business User Questions — Marginal Complexity
------------------------------------------------------------------------------------------------------------------

-- Q1: Which ten products in our inventory have the highest list price?
-- Original Author: Blessing Peter Effiong
-- Answer 1:
SELECT TOP 10 
    Name, 
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO

-- Q2: Can you provide a list of all current employees who hold the job title of Research and Development Manager?
-- Original Author: Blessing Peter Effiong
-- Answer 2:
SELECT 
    p.FirstName, 
    p.LastName, 
    e.JobTitle
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p 
    ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.JobTitle = 'Research and Development Manager';
GO


------------------------------------------------------------------------------------------------------------------
-- CATEGORY 2: Business User Questions — Moderate Complexity
------------------------------------------------------------------------------------------------------------------

-- Q3: The sales manager is reviewing assigned quotas. Which 3 salespeople have the highest sales quota, and what are those amounts?
-- Original Author: Karen Janeth Caballero Valderrama
-- Answer 3:
SELECT TOP 3
    p.FirstName,
    p.LastName,
    sp.SalesQuota
FROM Sales.SalesPerson AS sp
INNER JOIN Person.Person AS p 
    ON sp.BusinessEntityID = p.BusinessEntityID
WHERE sp.SalesQuota IS NOT NULL
ORDER BY sp.SalesQuota DESC;
GO

-- Q4: We are reviewing staff departmental assignments. Can you list the full names of employees from the Person.Person table alongside the names of the departments they work in from the HumanResources.Department table?
-- Original Author: Ekene Chukwuebuka Udoka
-- Answer 4:
SELECT 
    p.FirstName, 
    p.LastName, 
    d.Name AS DepartmentName
FROM HumanResources.EmployeePayHistory AS eph
INNER JOIN Person.Person AS p 
    ON eph.BusinessEntityID = p.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory AS edh 
    ON p.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources.Department AS d 
    ON edh.DepartmentID = d.DepartmentID
WHERE edh.EndDate IS NULL;
GO


------------------------------------------------------------------------------------------------------------------
-- CATEGORY 3: Business User Questions — Increased Complexity
------------------------------------------------------------------------------------------------------------------

-- Q5: Our warehouse team is worried about slow sellers. Some products have never appeared on a sales order. Please list those unsold products with their name and list price, highest price first, so we can decide what to discontinue.
-- Original Author: Nathaniel Neyor, II
-- Answer 5:
SELECT 
    p.Name, 
    p.ListPrice
FROM Production.Product AS p
LEFT JOIN Sales.SalesOrderDetail AS sod 
    ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL
ORDER BY p.ListPrice DESC;
GO

-- Q6: While looking at our sales records from different years, I noticed that sales varied over time. Which year had the highest total sales amount, based on order line totals, recorded in the database?
-- Original Author: Ikiring Rose
-- Answer 6:
SELECT TOP 1
    YEAR(soh.OrderDate) AS SalesYear,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod 
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY YEAR(soh.OrderDate)
ORDER BY TotalSalesAmount DESC;
GO


------------------------------------------------------------------------------------------------------------------
-- CATEGORY 4: Metadata Questions that use System Information Schema Views
------------------------------------------------------------------------------------------------------------------

-- Q7: How many base tables are defined in the Sales schema of the AdventureWorks database?
-- Original Author: Karen Janeth Caballero Valderrama
-- Answer 7:
SELECT 
    COUNT(*) AS BaseTableCount
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Sales' 
  AND TABLE_TYPE = 'BASE TABLE';
GO

-- Q8: Can you write a metadata query that returns all column names, data types and nullability rules for the Sales.SalesOrderHeader table?
-- Original Author: Rhodrick Chisakasa
-- Answer 8:
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Sales' 
  AND TABLE_NAME = 'SalesOrderHeader';
GO