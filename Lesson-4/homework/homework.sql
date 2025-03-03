create DATABASE HomeWork2DB;

use HomeWork2DB; 


CREATE TABLE Employees ( EmpID INT PRIMARY KEY, Name VARCHAR(50), Salary DECIMAL(10,2));

insert into Employees VALUEs (1, 'Ali', 20000 )
insert into Employees VALUEs (2, 'Shohn', 5000 )
insert into Employees VALUEs (3, 'Sam', 11500 )

SELECT * from Employees 

UPDATE Employees
SET Salary = 30000
WHERE EmpID = 1;


DELETE FROM Employees
WHERE EmpID = 2;

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);


SELECT * from Employees 

ALTER TABLE Employees
ADD Department VARCHAR(50);


CREATE TABLE Departments (
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50),
  ManagerID INT,
  CONSTRAINT FK_Department_Manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmpID)
);


SELECT * from Departments


CREATE TABLE SourceDepartments (
  DeptID INT,
  DeptName VARCHAR(50),
  ManagerID INT
);



INSERT INTO SourceDepartments (DeptID, DeptName, ManagerID)
VALUES 
  (101, 'Human Resources', 1),
  (102, 'Finance', 3),
  (103, 'IT', 1),
  (104, 'Marketing', 2),
  (105, 'Sales', 3);

  SELECT * from SourceDepartments

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

SELECT * from Employees


DELETE FROM Employees;

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

ALTER TABLE Employees
DROP COLUMN Department;



CREATE TABLE #TempTable (
  TempID INT,
  TempName VARCHAR(50)
);



INSERT INTO #TempTable (TempID, TempName)
VALUES
  (1, 'Record One'),
  (2, 'Record Two');


select * from #TempTable

DROP TABLE Departments;

SELECT * from Departments 


CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    PostalCode VARCHAR(10)
);


INSERT INTO Customers (CustomerName, City, PostalCode)
VALUES 
('Alice', 'New York', '10001'),
('Bob', 'Los Angeles', '90001'),
('Charlie', 'Chicago', '60601'),
('Anna', 'Boston', '02101'),
('Andrew', 'Seattle', '98101');


CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Category VARCHAR(50),
    Stock INT
);


INSERT INTO Products (ProductName, Price, Category, Stock)
VALUES 
('Widget', 120.00, 'Gadgets', 100),
('Gizmo', 80.00, 'Gadgets', 50),
('Thingamabob', 75.00, 'Tools', 30),
('Doohickey', 150.00, 'Gadgets', 20),
('Contraption', 200.00, 'Tools', 5),
('Device', 90.00, 'Electronics', 200),
('Apparatus', 55.00, 'Tools', 40),
('Instrument', 110.00, 'Electronics', 25),
('Machine', 300.00, 'Industrial', 10),
('Tool', 45.00, 'Tools', 70);


    SELECT * from Products


SELECT DISTINCT ProductName
FROM Products;


SELECT *
FROM Products
WHERE Price > 100;


SELECT CustomerName
FROM Customers
WHERE CustomerName LIKE 'A%';


SELECT *
FROM Products
ORDER BY Price ASC;


SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 100;

SELECT DISTINCT Category, ProductName
FROM Products;


SELECT *
FROM Products
ORDER BY ProductName DESC;


SELECT * from Employees
WHERE Salary >= 5000

ALTER TABLE Employees
ADD Email VARCHAR(50);

SELECT ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;

SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 100;


SELECT DISTINCT Category, ProductName
FROM Products;

SELECT *
FROM Products
ORDER BY ProductName DESC;




SELECT TOP 10 *
FROM Products
ORDER BY Price DESC;


SELECT COALESCE(Name, 'No Name Provided') AS EmployeeName
FROM Employees;

SELECT COALESCE(NULL, NULL, 'Default Value') AS Result;

SELECT DISTINCT Category, Price
FROM Products;

alter table Employees
add Age int

UPDATE Employees
SET Age = 20
WHERE EmpID = 1;


UPDATE Employees
SET Age = 31
WHERE EmpID = 2;


UPDATE Employees
SET Age = 42
WHERE EmpID = 3;



SELECT *
FROM Employees
WHERE (Age BETWEEN 30 AND 40)

SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


SELECT *
FROM Products
WHERE Price <= 1000
  AND Stock > 50
ORDER BY Stock ASC;


SELECT *
FROM Products
WHERE ProductName LIKE '%e%';


SELECT *
FROM Employees
WHERE Departments IN ('HR', 'IT', 'Finance');


SELECT *
FROM Employees
WHERE Salary > ANY (SELECT AVG(Salary) FROM Employees);


SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;




SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;

