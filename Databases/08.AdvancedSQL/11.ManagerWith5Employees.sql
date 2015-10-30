--Write a SQL query to find all managers that have exactly 5 employees.
--Display their first name and last name.

USE TelerikAcademy

SELECT m.FirstName, m.LastName
FROM Employees e
	JOIN Employees m
	on e.ManagerID = m.EmployeeID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) = 5