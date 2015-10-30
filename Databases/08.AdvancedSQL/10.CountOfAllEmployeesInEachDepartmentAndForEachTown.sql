--Write a SQL query to find the count of all employees in each department and for each town.

USE TelerikAcademy

SELECT COUNT(*) as [Number of Employees],t.Name as [TOWN], d.Name as [Deparment]
FROM Employees e
	JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
	JOIN Addresses a
	ON e.AddressID = a.AddressID
	JOIN Towns t 
	ON a.TownID = t.TownID
GROUP BY d.Name, t.Name
ORDER BY d.Name