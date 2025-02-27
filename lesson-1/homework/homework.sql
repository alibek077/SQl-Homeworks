CREATE DATABASE HometaskDB;

use HometaskDB;

CREATE TABLE Students ( StudentID INT, FullName VARCHAR(50), Age INT, GPA DECIMAL(3,2));


SELECT * from Students

ALTER table Students
ADD Email VARCHAR(50);

sp_rename 'Students.FullName', 'Name', 'COLUMN';

ALTER TABLE Students
DROP COLUMN Age;

insert into Students VALUEs (1, 'Ali', 4.00, 'alibekodamboyev@gmail.com')

TRUNCATE table Students


SELECT @@SERVERNAME;

SELECT GETDATE()

SELECT * From Students;
