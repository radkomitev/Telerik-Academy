--Write a SQL query to find the names of all employees whose last name contains "ei".
USE TelerikAcademy

Select FirstName + ' ' + LastName AS [FullName]
From Employees
Where LastName LIKE '%ei%'
