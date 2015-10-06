--Write a SQL query to find all employees along with their manager.

USE TelerikAcademy

SELECT e.FirstName + ' ' + e.LastName AS [Employee], em.FirstName + ' ' + em.LastName AS [Manager]
	FROM Employees e
	INNER JOIN Employees em 
	ON e.ManagerID = em.EmployeeID 