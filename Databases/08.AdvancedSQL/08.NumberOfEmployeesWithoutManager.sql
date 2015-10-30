--Write a SQL query to find the number of all employees that have no manager
USE TelerikAcademy

SELECT COUNT(*)
FROM Employees e
WHERE e.ManagerID IS NULL