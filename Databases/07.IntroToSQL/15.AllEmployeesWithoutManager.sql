--Write a SQL query to find all employees that do not have manager.

USE TelerikAcademy

Select FirstName + ' ' + LastName AS [FullName], ManagerID
From Employees
Where ManagerID is NULL