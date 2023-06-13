CREATE DATABASE SqlTask

USE SqlTask

	CREATE TABLE Departments(
	Id int IDENTITY PRIMARY KEY,
	[Name] nvarchar (50)
)

CREATE TABLE Positions(
	Id int IDENTITY PRIMARY KEY,
    Position_Name nvarchar(50)
)

CREATE TABLE  Employees(
	Id int IDENTITY PRIMARY KEY,  
	[Name] nvarchar(50),
	Salary int Not Null,
	Hire_date date,
	Department_Id int REFERENCES Departments(Id),
	Position_Id int REFERENCES  Positions(Id)
)

INSERT into Departments ([Name])
VALUES ('Human Resources'),
       ('Finance'),
       ('Marketing'),
       ('Sales')

INSERT into Positions (Position_Name)
VALUES ('Manager'),
       ('Assistant Manager'),
       ('Analyst'),
       ('Clerk')

INSERT into Employees ([Name], Salary, Hire_date, Department_Id, Position_Id)
VALUES ('John James', 5000, '2022-01-15', 1, 1),
       ('Jane Eyre', 4000, '2021-08-05', 2, 3),
       ('David Guetta', 3500, '2023-03-20', 3, 2),
       ('Emily David', 4500, '2022-11-10', 2, 4)

SELECT 
    Employees.Name,
    Employees.Hire_date,
    Departments.Name AS Department_Name,
    Positions.Position_Name,
    Employees.Salary
FROM 
    Employees
LEFT JOIN 
    Positions ON Employees.Position_Id = Positions.Id
LEFT JOIN 
    Departments ON Employees.Department_Id = Departments.Id;



