--Write a SQL query to find the average salary in the department #1.
USE TelerikAcademy

SELECT AVG(Salary) AS [AVG Salary]
FROM Employees
WHERE DepartmentID = 1