
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Category VARCHAR(50),
    Stock INT
);

INSERT INTO Products (ProductID, ProductName, Price, Category, Stock)
VALUES 
(1, 'Widget', 120.00, 'Gadgets', 150),
(2, 'Gizmo', 80.00, 'Gadgets', 90),
(3, 'Tool', 50.00, 'Hardware', 110),
(4, 'Device', 200.00, 'Electronics', 70),
(5, 'Contraption', 95.00, 'Gadgets', 50);

select * from Products


CREATE TABLE Products_Discontinued (
    ProductName VARCHAR(50)
);

INSERT INTO Products_Discontinued (ProductName)
VALUES ('Gizmo'), ('Obsolete Device');


SELECT * from Products_Discontinued



CREATE TABLE OutOfStock (
    ProductName VARCHAR(50)
);


INSERT INTO OutOfStock (ProductName)
VALUES ('Tool'), ('Broken Widget');


select * from OutOfStock



CREATE TABLE DiscontinuedProducts (
    ProductName VARCHAR(50)
);


INSERT INTO DiscontinuedProducts (ProductName)
VALUES ('Gizmo');


select * from DiscontinuedProducts




CREATE TABLE Customers4 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);



INSERT INTO Customers4 (CustomerID, CustomerName, Country)
VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'Canada'),
(3, 'Charlie', 'UK');

select * from  customers4


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);


INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
(101, 1, '2023-01-10'),
(102, 2, '2023-02-15'),
(103, 1, '2023-03-20'),
(104, 3, '2023-04-05');

SELECT * from Orders



CREATE TABLE Employees4 (
    EmployeeID INT PRIMARY KEY,
    Department VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Country VARCHAR(50)
);


INSERT INTO Employees4 (EmployeeID, Department, Age, Salary, Country)
VALUES
(1, 'HR', 30, 5500.00, 'USA'),
(2, 'Sales', 24, 4500.00, 'USA'),
(3, 'Sales', 28, 6500.00, 'Canada'),
(4, 'IT', 35, 7000.00, 'UK'),
(5, 'HR', 22, 4800.00, 'USA');


select * from Employees4



CREATE TABLE Sales (
    Region VARCHAR(50),
    SalesAmount DECIMAL(10,2)
);


INSERT INTO Sales (Region, SalesAmount)
VALUES
('North', 1500.00),
('South', 2000.00),
('North', 2500.00),
('East', 1800.00);



SELECT ProductName AS Name
FROM Products;


SELECT *
FROM Customers AS Client;


SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discontinued;


SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discontinued;


SELECT CAST(ProductID AS VARCHAR(50)) AS ID, ProductName FROM Products
UNION ALL
SELECT CAST(OrderID AS VARCHAR(50)) AS ID, 'Order: ' + CONVERT(VARCHAR(50), OrderID) FROM Orders;


SELECT DISTINCT CustomerName, Country
FROM Customers4;


SELECT 
    ProductName,
    Price,
    CASE
        WHEN Price > 100 THEN 'High'
        ELSE 'Low'
    END AS PriceCategory
FROM Products;


SELECT 
    Country,
    COUNT(*) AS EmployeeCount
FROM Employees4
WHERE Department = 'Sales'
GROUP BY Country;


SELECT 
    Category,
    COUNT(ProductID) AS ProductCount
FROM Products
GROUP BY Category;


SELECT
    ProductName,
    Stock,
    IIF(Stock > 100, 'Yes', 'No') AS StockStatus
FROM Products;




SELECT o.OrderID, c.CustomerName AS ClientName, o.OrderDate
FROM Orders o
INNER JOIN Customers4 c ON o.CustomerID = c.CustomerID;


SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;


SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM DiscontinuedProducts;


SELECT c.CustomerID, c.CustomerName,
       CASE WHEN COUNT(o.OrderID) > 1 THEN 'Eligible' ELSE 'Not Eligible' END AS Eligibility
FROM Customers4 c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;


SELECT
    ProductName,
    Price,
    IIF(Price > 100, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;


SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID;



SELECT *
FROM Employees4
WHERE Age < 25 OR Salary > 6000;


SELECT Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region;


SELECT c.CustomerName, o.OrderDate AS OrderDateAlias, o.OrderID
FROM Customers4 c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;


IF EXISTS (SELECT 1 FROM Employees WHERE Department = 'HR')
BEGIN
    UPDATE Employees
    SET Salary = Salary * 1.10
    WHERE Department = 'HR';
END;

SELECT * FROM Employees4;
