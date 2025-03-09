CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);


INSERT INTO Customers (CustomerID, CustomerName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

SELECT * from Customers

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount)
VALUES
  (101, 1, '2023-01-01', 600),
  (102, 1, '2023-02-15', 400),
  (103, 2, '2023-03-01', 800),
  (104, 3, '2023-04-01', 300);

  SELECT * from Orders


CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    Address VARCHAR(100),
    Phone VARCHAR(20)
);


INSERT INTO EmployeeDetails (EmployeeID, Address, Phone)
VALUES
  (1, '123 Main St', '555-1111'),
  (2, '456 Elm St', '555-2222');

  SELECT * from EmployeeDetails

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);



INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary)
VALUES
  (1, 'John Doe', 'HR', 5000),
  (2, 'Jane Smith', 'IT', 6000),
  (3, 'Mike Brown', 'HR', 4500);

  SELECT * from employees


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
  (1, 'HR'),
  (2, 'IT'),
  (3, 'Sales');


SELECT * from Departments


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price INT,
    SupplierID INT,
    CategoryID INT
);


INSERT INTO Products (ProductID, ProductName, Price, SupplierID, CategoryID)
VALUES
  (1, 'Laptop', 800, 1, 1),
  (2, 'Phone', 500, 2, 1),
  (3, 'Tablet', 300, 1, 2);

  SELECT * from Products


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);


INSERT INTO Categories (CategoryID, CategoryName)
VALUES
  (1, 'Electronics'),
  (2, 'Accessories');


  SELECT * from Categories


CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
  (101, 1, 1),
  (101, 2, 2),
  (102, 3, 1),
  (103, 1, 1),
  (104, 2, 1);


  SELECT * from OrderDetails


CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
);


INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES
  (1, 'Supplier A'),
  (2, 'Supplier B');

  SELECT * from Suppliers


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SalesAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Sales (SaleID, ProductID, SalesAmount)
VALUES
  (1, 1, 1200),
  (2, 2, 600),
  (3, 3, 300);

  SELECT * from Sales


CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);


INSERT INTO Regions (RegionID, RegionName)
VALUES
  (1, 'North'),
  (2, 'South');

  SELECT * from Regions


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);


INSERT INTO Students (StudentID, StudentName)
VALUES
  (1, 'Alice Student'),
  (2, 'Bob Student');


SELECT * from students


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);


INSERT INTO Courses (CourseID, CourseName)
VALUES
  (1, 'Math'),
  (2, 'Science');


SELECT * from  Courses


CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO StudentCourses (StudentID, CourseID)
VALUES
  (1, 1),
  (1, 2),
  (2, 1);

SELECT * from StudentCourses



SELECT c.CustomerName, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;



SELECT e.EmployeeName, ed.Address, ed.Phone
From Employees e
INNER JOIN EmployeeDetails ed ON e.EmployeeID = ed.EmployeeID;


SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;


SELECT c.CustomerName, o.OrderDate
From Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;



SELECT od.OrderID, p.ProductName, od.Quantity
FROM OrderDetails od
INNER JOIN Products p ON od.ProductID = p.ProductID;


SELECT p.ProductName, c.CategoryName
FROM Products p
CROSS JOIN Categories c;


SELECT c.CustomerName, o.OrderDate
From Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;


SELECT p.ProductName, o.OrderID, o.OrderAmount
From Products p
CROSS JOIN Orders o
WHERE o.OrderAmount > 500;


SELECT e.EmployeeName, d.DepartmentName
From Employees e
INNER JOIN Departments d ON e.Department = d.DepartmentName;


SELECT c.CustomerName, o.OrderID
from Customers c
INNER JOIN Orders o ON c.CustomerID <> o.OrderID;




SELECT c.CustomerName, COUNT(o.OrderID) AS TotalOrders
from Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;




SELECT s.StudentName, co.CourseName
from Students s
INNER JOIN StudentCourses sc ON s.StudentID = sc.StudentID
INNER JOIN Courses co ON sc.CourseID = co.CourseID;


SELECT e.EmployeeName, d.DepartmentName, e.Salary
from Employees e
CROSS JOIN Departments d
WHERE e.Salary > 5000;


SELECT e.EmployeeName, ed.Address, ed.Phone
from Employees e
INNER JOIN EmployeeDetails ed ON e.EmployeeID = ed.EmployeeID;


SELECT p.ProductName, s.SupplierName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName = 'Supplier A';


SELECT p.ProductName, COALESCE(s.SalesAmount, 0) AS SalesAmount
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID;


SELECT e.EmployeeName, e.Salary, d.DepartmentName
FROM Employees e, Departments d
WHERE e.Department = d.DepartmentName
  AND e.Salary > 4000
  AND d.DepartmentName = 'HR';


SELECT c.CustomerName, o.OrderAmount
FROM Customers c
INNER JOIN Orders o ON o.OrderAmount >= c.CustomerID * 100;



SELECT p.ProductName, p.Price, s.SupplierName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.Price >= 50;


SELECT r.RegionName, s.SalesAmount
FROM Sales s
CROSS JOIN Regions r
WHERE s.SalesAmount > 1000;
