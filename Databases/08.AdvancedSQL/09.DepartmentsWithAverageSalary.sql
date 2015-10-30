--Write a SQL query to find all departments and the average salary for each of them.
USE TelerikAcademy

SELECT AVG(e.Salary) AS [Average Salary], d.Name as [Deparment]
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name
