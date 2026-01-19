DROP DATABASE IF EXISTS SourceDB;
DROP DATABASE IF EXISTS TargetDB;

CREATE DATABASE SourceDB;
CREATE DATABASE TargetDB;

USE SourceDB;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT
);

INSERT INTO Employees VALUES
(1, 'Rahul', 50000),
(2, 'Anita', 60000),
(3, 'Amit', 55000),
(4, 'Neha', 52000),
(5, 'Karan', 58000);

USE TargetDB;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT
);

INSERT INTO Employees VALUES
(1, 'Rahul', 50000),
(2, 'Anita', 60000),
(3, 'Amit', 55000),
(4, 'Neha', 50000);

SELECT COUNT(*) AS Source_Record_Count FROM SourceDB.Employees;
SELECT COUNT(*) AS Target_Record_Count FROM TargetDB.Employees;

SELECT s.*
FROM SourceDB.Employees s
LEFT JOIN TargetDB.Employees t
ON s.EmpID = t.EmpID
WHERE t.EmpID IS NULL;

SELECT
    s.EmpID,
    s.Name AS Source_Name,
    t.Name AS Target_Name,
    s.Salary AS Source_Salary,
    t.Salary AS Target_Salary
FROM SourceDB.Employees s
JOIN TargetDB.Employees t
ON s.EmpID = t.EmpID
WHERE s.Salary <> t.Salary;

SELECT 'Data Migration Validation Completed' AS Status;
