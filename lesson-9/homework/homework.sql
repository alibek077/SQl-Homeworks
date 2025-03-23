CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary INT,
    DepartmentID INT,
    ManagerID INT
);

INSERT INTO Employees (EmployeeID, EmployeeName, Salary, DepartmentID, ManagerID) VALUES
(1, 'Alice', 6000, 1, NULL),
(2, 'Bob', 4500, 2, 1),
(3, 'Charlie', 7000, 1, 1),
(4, 'David', 4000, NULL, 1),
(5, 'Eve', 5500, 2, 2);

select * from Employees


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'IT');


select * from Departments


CREATE TABLE Customers7 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

INSERT INTO Customers7 (CustomerID, CustomerName) VALUES
(1, 'Acme Corp'),
(2, 'Beta LLC'),
(3, 'Gamma Inc');

select * from Customers7


CREATE TABLE Orders7 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE
);

INSERT INTO Orders7 (OrderID, CustomerID, ProductID, OrderDate) VALUES
(1, 1, 1, '2023-01-15'),
(2, 1, 2, '2022-12-20'),
(3, 2, 1, '2023-03-10'),
(4, 3, 3, '2022-05-25'),
(5, 2, 4, '2023-06-18'),
(6, 1, 1, '2023-07-05'),
(7, 3, 2, '2023-09-12');

SELECT * from Orders7


CREATE TABLE Products7 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SupplierID INT
);

INSERT INTO Products7 (ProductID, ProductName, SupplierID) VALUES
(1, 'Widget', 1),
(2, 'Gadget', 2),
(3, 'Thingamajig', 3),
(4, 'Doodad', 2);

select * from Products7



CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
);

INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(1, 'Supplier A'),
(2, 'Supplier B'),
(3, 'Supplier C'),
(4, 'Supplier D');

select * from Suppliers


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10,2)
);

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, PaymentAmount) VALUES
(1, 1, '2023-01-20', 150.00),
(2, 3, '2023-03-15', 200.00),
(3, 5, '2023-06-20', 300.00),
(4, 7, '2023-09-15', 250.00);

select * from Payments


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleAmount INT
);

INSERT INTO Sales (SaleID, ProductID, SaleAmount) VALUES
(1, 1, 120),
(2, 2, 80),
(3, 1, 150),
(4, 3, 60);

select * from Sales


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT
);

INSERT INTO Students (StudentID, StudentName, CourseID) VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'Emily Davis', 1),
(4, 'Michael Brown', 3);

select * from Students

/* --- Courses Table --- */
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName) VALUES
(1, 'Math 101'),
(2, 'History 201'),
(3, 'Science 301');

select * from Courses


SELECT E.EmployeeID, E.EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > 5000;



SELECT C.CustomerID, C.CustomerName, O.OrderID, O.OrderDate
FROM Customers7 C
INNER JOIN Orders7 O ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) = 2023;


SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;


SELECT S.SupplierID, S.SupplierName, P.ProductID, P.ProductName
FROM Products P
RIGHT JOIN Suppliers S ON P.SupplierID = S.SupplierID;


SELECT O.OrderID, O.OrderDate, P.PaymentID, P.PaymentDate, P.PaymentAmount
FROM Orders O
FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID;


SELECT E.EmployeeName, M.EmployeeName AS ManagerName
FROM Employees E
LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;


SELECT P.ProductID, P.ProductName, S.SaleAmount
FROM Products7 P
INNER JOIN Sales S ON P.ProductID = S.ProductID
WHERE S.SaleAmount > 100;


SELECT S.StudentID, S.StudentName, C.CourseName
FROM Students S
INNER JOIN Courses C ON S.CourseID = C.CourseID
WHERE C.CourseName = 'Math 101';

SELECT C.CustomerID, C.CustomerName, COUNT(O.OrderID) AS OrderCount
FROM Customers7 C
INNER JOIN Orders7 O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CustomerName
HAVING COUNT(O.OrderID) > 3;


SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'HR';


SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.DepartmentID IN (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(EmployeeID) > 10
);


SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Sales S ON P.ProductID = S.ProductID
WHERE S.SaleID IS NULL;


SELECT C.CustomerID, C.CustomerName, O.OrderID, O.OrderDate
FROM Customers7 C
RIGHT JOIN Orders7 O ON C.CustomerID = O.CustomerID
WHERE C.CustomerID IS NOT NULL;


SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName
FROM Employees E
FULL OUTER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IS NOT NULL;



SELECT A.EmployeeName AS Employee1, B.EmployeeName AS Employee2, A.ManagerID
FROM Employees A
INNER JOIN Employees B ON A.ManagerID = B.ManagerID
WHERE A.EmployeeID <> B.EmployeeID;


SELECT O.OrderID, O.OrderDate, C.CustomerName
FROM Orders7 O
LEFT JOIN Customers7 C ON O.CustomerID = C.CustomerID
WHERE YEAR(O.OrderDate) = 2022;


SELECT E.EmployeeID, E.EmployeeName, E.Salary, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID AND D.DepartmentName = 'Sales'
WHERE E.Salary > 5000;


SELECT E.EmployeeID, E.EmployeeName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'IT';


SELECT O.OrderID, O.OrderDate, P.PaymentID, P.PaymentDate, P.PaymentAmount
FROM Orders7 O
FULL OUTER JOIN Payments P ON O.OrderID = P.OrderID
WHERE O.OrderID IS NOT NULL AND P.OrderID IS NOT NULL;



SELECT P.ProductID, P.ProductName, O.OrderID, O.OrderDate
FROM Products7 P
LEFT JOIN Orders7 O ON P.ProductID = O.ProductID
WHERE O.OrderID IS NULL;



