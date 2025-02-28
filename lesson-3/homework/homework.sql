
CREATE TABLE TestIdentity (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Data VARCHAR(50)
);

INSERT INTO TestIdentity (Data) VALUES ('Row 1'), ('Row 2'), ('Row 3');

SELECT * FROM TestIdentity;


CREATE TABLE TestNoIdentity (
    ID INT PRIMARY KEY,
    Data VARCHAR(50)
);

INSERT INTO TestNoIdentity (ID, Data)
SELECT ID, Data FROM TestIdentity;

select * from TestNoIdentity



DELETE FROM TestIdentity;


INSERT INTO TestIdentity (Data) VALUES ('After DELETE');


SELECT * FROM TestIdentity;



TRUNCATE TABLE TestIdentity;


INSERT INTO TestIdentity (Data) VALUES ('After TRUNCATE');


SELECT * FROM TestIdentity;



CREATE TABLE TestNoIdentity (
    ID INT PRIMARY KEY,  -- No IDENTITY here
    Data NVARCHAR(50)
);
