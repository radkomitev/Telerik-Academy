--Write a SQL query to find the names of all employees whose first name starts with "SA"
USE TelerikAcademy

Select FirstName + ' ' + LastName AS [FullName]
From Employees
Where FirstName LIKE 'SA%'
