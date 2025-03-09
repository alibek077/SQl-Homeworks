
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




CREATE TABLE Customers6 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50)
);


INSERT INTO Customers6 (CustomerID, CustomerName, Region, Country)
VALUES
(1, 'Alice', 'North', 'USA'),
(2, 'Bob', 'South', 'USA'),
(3, 'Charlie', 'East', 'Canada'),
(4, 'Diana', 'West', 'USA'),
(5, 'Ethan', 'North', 'Canada'),
(6, 'Fiona', 'East', 'USA');

select * from  customers6


CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);


INSERT INTO Orders2 (OrderID, CustomerID, OrderDate)
VALUES
(101, 1, '2023-01-10'),
(102, 2, '2023-02-15'),
(103, 1, '2023-03-20'),
(104, 3, '2023-04-05');

SELECT * from Orders2



CREATE TABLE Employees5 (
    EmployeeID INT PRIMARY KEY,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT,
    JobTitle VARCHAR(50)
);


INSERT INTO Employees5 (EmployeeID, Department, Salary, Age, JobTitle)
VALUES
(1, 'HR', 5500.00, 30, 'Manager'),
(2, 'Sales', 4500.00, 24, 'Associate'),
(3, 'Sales', 6500.00, 28, 'Manager'),
(4, 'IT', 7000.00, 35, 'Developer'),
(5, 'HR', 4800.00, 22, 'Coordinator'),
(6, 'Sales', 4000.00, 26, 'Associate'),
(7, 'IT', 7200.00, 40, 'Developer'),
(8, 'Finance', 8000.00, 32, 'Manager'),
(9, 'Sales', 5000.00, 29, 'Associate'),
(10, 'IT', 6800.00, 31, 'Developer');

select * from Employees5



DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SalesAmount DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50),
    UnitsSold INT
);

INSERT INTO Sales (SaleID, ProductID, SalesAmount, SaleDate, Region, UnitsSold)
VALUES
(101, 1, 500.00, '2022-01-15', 'North', 50),
(102, 2, 300.00, '2022-02-20', 'South', 30),
(103, 1, 700.00, '2022-03-10', 'North', 70),
(104, 3, 250.00, '2022-03-15', 'East', 20),
(105, 4, 1200.00, '2023-01-05', 'West', 10),
(106, 5, 400.00, '2023-02-12', 'North', 110),
(107, 6, 150.00, '2023-03-25', 'East', 5),
(108, 1, 600.00, '2023-04-08', 'South', 80);

SELECT * from Sales



SELECT MIN(Price) AS MinPrice
FROM Products;


SELECT MAX(Salary) AS MaxSalary
FROM Employees;


SELECT COUNT(*) AS CustomerCount
from Customers;


SELECT COUNT(DISTINCT Category) AS UniqueCategoryCount
FROM Products;


SELECT SUM(SalesAmount) AS TotalSales
from Sales
WHERE ProductID = 1;


SELECT AVG(Age) AS AverageAge
FROM Employees;


SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees5
GROUP BY Department;


SELECT Category,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice
from Products
GROUP BY Category;


SELECT Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region;


SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees5
GROUP BY Department
HAVING COUNT(*) > 5;



SELECT p.Category,
       SUM(s.SalesAmount) AS TotalSales,
       AVG(s.SalesAmount) AS AverageSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;


SELECT COUNT(*) AS ManagerCount
FROM Employees5
WHERE JobTitle = 'Manager';


SELECT Department,
       MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary
FROM Employees5
GROUP BY Department;


SELECT Department,
       AVG(Salary) AS AverageSalary
from Employees5
GROUP BY Department;


SELECT Department,
       AVG(Salary) AS AverageSalary,
       COUNT(*) AS EmployeeCount
from Employees5
GROUP BY Department;



SELECT Category,
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 100;


SELECT COUNT(DISTINCT ProductID) AS ProductsAbove100Units
FROM Sales
WHERE UnitsSold > 100;



SELECT YEAR(SaleDate) AS SaleYear,
       SUM(SalesAmount) AS TotalSales
from Sales
GROUP BY YEAR(SaleDate);



SELECT c.Region, COUNT(*) AS CustomerCount
from Customers6 c
WHERE c.CustomerID IN (SELECT DISTINCT CustomerID FROM Orders2)
GROUP BY c.Region;



SELECT Department,
       SUM(Salary) AS TotalSalaryExpense
FROM Employees5
GROUP BY Department
HAVING SUM(Salary) > 100000;
