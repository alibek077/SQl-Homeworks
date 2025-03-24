CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'IT'),
(4, 'Marketing');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary INT,
    DepartmentID INT NULL,
    ManagerID INT NULL,
    JobTitle VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, EmployeeName, Salary, DepartmentID, ManagerID, JobTitle) VALUES
(1, 'Alice',   6000, 1, NULL,       'Sales Manager'),
(2, 'Bob',     4500, 2, 1,          'HR Specialist'),
(3, 'Charlie', 7000, 1, 1,          'Sales Executive'),
(4, 'David',   4000, 3, 2,          'IT Support'),
(5, 'Eve',     5500, 1, 1,          'Sales Associate'),
(6, 'Frank',   5000, 4, NULL,       'Marketing Manager');



CREATE TABLE Customers8 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LoyaltyStatus VARCHAR(20)
);

INSERT INTO Customers8 (CustomerID, CustomerName, LoyaltyStatus) VALUES
(1, 'Acme Corp', 'Gold'),
(2, 'Beta LLC',  'Silver'),
(3, 'Gamma Inc', 'Gold');



CREATE TABLE Products8 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SupplierID INT,
    Price DECIMAL(10,2),
    Discount INT,       -- discount percentage
    Rating INT
);

INSERT INTO Products8 (ProductID, ProductName, SupplierID, Price, Discount, Rating) VALUES
(1, 'Widget',      1, 120.00, 10, 5),
(2, 'Gadget',      2,  80.00, 25, 3),
(3, 'Thingamajig', 3, 150.00, 15, 4),
(4, 'Doodad',      2, 200.00, 30, 5);



CREate TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
);

Insert INTO Suppliers (SupplierID, SupplierName) VALUES
(1, 'Supplier A'),
(2, 'Supplier B'),
(3, 'Supplier C'),
(4, 'Supplier D');



CREATE TABLE Orders8 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    EmployeeID INT
);

INSERT INTO Orders8 (OrderID, CustomerID, ProductID, OrderDate, TotalAmount, EmployeeID) VALUES
(1, 1, 1, '2023-01-15', 150.00, 1),
(2, 1, 2, '2022-12-20', 250.00, 3),
(3, 2, 1, '2023-03-10', 300.00, 2),
(4, 3, 3, '2022-05-25', 450.00, 4),
(5, 2, 4, '2023-06-18', 500.00, 1),
(6, 1, 1, '2023-07-05', 200.00, 1),
(7, 3, 2, '2023-09-12', 350.00, 6);



CREATE Table Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10,2)
);

INSERT into Payments (PaymentID, OrderID, PaymentDate, PaymentAmount) VALUES
(1, 1, '2023-01-20', 150.00),
(2, 3, '2023-03-15', 300.00),
(3, 5, '2023-06-20', 500.00),
(4, 7, '2023-09-15', 350.00);



CREATE table Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleAmount INT,
    SaleDate DATE
);

INSERT INTO Sales (SaleID, ProductID, SaleAmount, SaleDate) VALUES
(1, 1, 120, '2023-02-10'),
(2, 2,  80, '2022-11-15'),
(3, 1, 150, '2023-04-05'),
(4, 3,  60, '2023-07-22');


CREATE TABLE Temp_Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    EmployeeID INT
);

INSERT INTO Temp_Orders (OrderID, CustomerID, ProductID, OrderDate, TotalAmount, EmployeeID) VALUES
(1, 1, 1, '2023-01-15', 150.00, 1),
(2, 2, 4, '2023-06-18', 500.00, 1);



CREATE TABLE Temp_Products (
    ProductID INT PRIMARY KEY,
    Discontinued BIT
);

INSERT INTO Temp_Products (ProductID, Discontinued) VALUES
(1, 0),
(2, 1),
(3, 0),
(4, 0);




SELECT O.OrderID, O.OrderDate, C.CustomerName
From Orders8 O
INNER JOIN Customers C 
    ON O.CustomerID = C.CustomerID 
   AND O.OrderDate > '2022-12-31';


SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D
    ON E.DepartmentID = D.DepartmentID 
    OR D.DepartmentName IN ('Sales','Marketing');


SELECT DT.ProductID, DT.ProductName, DT.Price, O.OrderID, O.OrderDate
FROM (SELECT * FROM Products WHERE Price > 100) AS DT
INNER JOIN Orders8 O 
    ON DT.ProductID = O.ProductID;


SELECT T.OrderID, T.OrderDate, O.TotalAmount
FROM Temp_Orders8 T
INNER JOIN Orders8 O 
    ON T.OrderID = O.OrderID;


SELECT E.EmployeeID, E.EmployeeName, CA.TopSalesOrderID, CA.TopSalesAmount
FROM Employees E
CROSS APPLY
(
    SELECT TOP 5 O.OrderID AS TopSalesOrderID, O.TotalAmount AS TopSalesAmount
    FROM Orders8 O
    WHERE O.EmployeeID = E.EmployeeID
    ORDER BY O.TotalAmount DESC
) CA;


SELECT C.CustomerID, C.CustomerName, O.OrderID, O.OrderDate
FROM Customers8 C
INNER JOIN Orders8 O 
    ON C.CustomerID = O.CustomerID 
   AND O.OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
WHERE C.LoyaltyStatus = 'Gold';


SELECT C.CustomerID, C.CustomerName, DT.OrderCount
FROM Customers8 C
INNER JOIN 
(
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM Orders8
    GROUP BY CustomerID
) DT ON C.CustomerID = DT.CustomerID;


SELECT P.ProductID, P.ProductName, S.SupplierName
FROM Products8 P
INNER JOIN Suppliers S
    ON P.SupplierID = S.SupplierID 
    OR S.SupplierName IN ('Supplier A','Supplier B');


SELECT E.EmployeeID, E.EmployeeName, RecentOrder.OrderID, RecentOrder.OrderDate, RecentOrder.TotalAmount
FROM Employees E
OUTER APPLY
(
    SELECT TOP 1 O.OrderID, O.OrderDate, O.TotalAmount
    FROM Orders8 O
    WHERE O.EmployeeID = E.EmployeeID
    ORDER BY O.OrderDate DESC
) RecentOrder;


SELECT D.DepartmentID, D.DepartmentName, Emp.EmployeeID, Emp.EmployeeName
FROM Departments D
CROSS APPLY dbo.fn_GetEmployeesByDepartment(D.DepartmentID) Emp;


SELECT O.OrderID, O.TotalAmount, C.CustomerID, C.CustomerName
FROM Orders8 O
INNER JOIN Customers8 C
    ON O.CustomerID = C.CustomerID 
   AND O.TotalAmount > 5000;


SELECT P.ProductID, P.ProductName, S.SaleDate, P.Discount
FROM Products8 P
INNER JOIN Sales S
    ON P.ProductID = S.ProductID 
    OR P.Discount > 20
WHERE (YEAR(S.SaleDate) = 2022) OR (P.Discount > 20);


SELECT P.ProductID, P.ProductName, DT.TotalSales
FROM Products8 P
INNER JOIN
(
    SELECT ProductID, SUM(SaleAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
) DT ON P.ProductID = DT.ProductID;


SELECT P.ProductID, P.ProductName, T.Discontinued
FROM Products8 P
INNER JOIN Temp_Products T
    ON P.ProductID = T.ProductID
WHERE T.Discontinued = 1;


SELECT E.EmployeeID, E.EmployeeName, SP.OrderCount, SP.TotalSales
FROM Employees E
CROSS APPLY dbo.fn_GetEmployeeSalesPerformance(E.EmployeeID) SP;


SELECT E.EmployeeID, E.EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
INNER JOIN Departments D
    ON E.DepartmentID = D.DepartmentID 
   AND D.DepartmentName = 'HR'
WHERE E.Salary > 5000;
 

SELECT O.OrderID, O.TotalAmount, P.PaymentID, P.PaymentAmount
FROM Orders8 O
LEFT JOIN Payments P
    ON (O.OrderID = P.OrderID)
    OR (P.PaymentAmount < O.TotalAmount AND P.PaymentAmount > 0);


SELECT C.CustomerID, C.CustomerName, RecentOrder.OrderID, RecentOrder.OrderDate, RecentOrder.TotalAmount
FROM Customers8 C
OUTER APPLY
(
    SELECT TOP 1 O.OrderID, O.OrderDate, O.TotalAmount
    FROM Orders8 O
    WHERE O.CustomerID = C.CustomerID
    ORDER BY O.OrderDate DESC
) RecentOrder;


SELECT P.ProductID, P.ProductName, P.Rating, S.SaleDate, S.SaleAmount
FROM Products8 P
INNER JOIN Sales S
    ON P.ProductID = S.ProductID 
   AND YEAR(S.SaleDate) = 2023 
   AND P.Rating > 4;

SELECT E.EmployeeID, E.EmployeeName, E.JobTitle, D.DepartmentName
FROM Employees E
INNER JOIN Departments D
    ON (E.DepartmentID = D.DepartmentID)
    OR (E.JobTitle LIKE '%Manager%')
WHERE D.DepartmentName = 'Sales' OR E.JobTitle LIKE '%Manager%';
