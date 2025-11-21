CREATE DATABASE IF NOT EXISTS SQL_INTERN_TASK_6;
USE SQL_INTERN_TASK_4;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    Age INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);


INSERT INTO Department VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Hyderabad'),
(4, 'Sales', 'Delhi');

INSERT INTO Employee VALUES
(101, 'Arun', 1, 60000, 28),
(102, 'Bala', 1, 45000, 25),
(103, 'Cathy', 2, 52000, 30),
(104, 'David', 3, 75000, 35),
(105, 'Emily', 4, 40000, 26),
(106, 'Farhan', 3, 68000, 33);


SELECT * FROM Department;

SELECT * FROM Employee;


SELECT EmpName, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);


SELECT EmpName
FROM Employee
WHERE DeptID IN (
    SELECT DeptID 
    FROM Department 
    WHERE DeptName = 'IT'
);


SELECT EmpName, Salary, DeptID
FROM Employee e1
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee e2
    WHERE e1.DeptID = e2.DeptID
);


SELECT EmpName
FROM Employee e
WHERE EXISTS (
    SELECT 1
    FROM Department d
    WHERE e.DeptID = d.DeptID
      AND d.Location = 'Bangalore'
);


SELECT EmpName, Salary
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);
