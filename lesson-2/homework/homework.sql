create DATABASE HomeWork2DB;

use HomeWork2DB; 



--DDL (Data Definition Language):
--DDL commands are used to define, modify, or remove database objects such as tables.
--Examples:

-- Create: Used to create a new table or database object.
-- Alter: Used to modify an existing object (e.g., add a column to a table).
-- Truncate: Used to delete the entire table
-- Drop: Used to quickly delete all data from a table

--DML (Data Manipulation Language):
--DML commands are used to retrieve, insert, update, or delete data within those objects.
--Examples:

-- Insert: Used to add new records to a table.
-- Update: Used to modify existing records in a table.
-- Delete: Used to delete data from a table,


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


-- Delete: used to delete data from a table,
-- Drop: used to delete the entire table
-- Truncate: used to quickly delete all data from a table

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);


SELECT * from Employees 

ALTER TABLE Employees
ADD Department VARCHAR(50);



--The TRUNCATE TABLE command is used to quickly remove all rows from a table while preserving the table structure for future use.

-- It resets identity columns (if applicable),
-- It is faster than DELETE because it does not log individual row deletions,
-- It cannot be used with a WHERE clause, so it removes every record in the table.




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
