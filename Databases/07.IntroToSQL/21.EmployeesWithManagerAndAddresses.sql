--Write a SQL query to find all employees, along with their manager and their address. Join the 3 tables: Employees e, Employees m and Addresses a.

USE TelerikAcademy

SELECT e.FirstName + ' ' + e.LastName AS [Employee], a.AddressText AS [EmployeeAddress],
 em.FirstName + ' ' + em.LastName AS [Manager], ma.AddressText[ManagerAddress]

FROM Employees e
INNER JOIN Employees em
ON em.EmployeeID = e.ManagerID
INNER JOIN Addresses a
ON e.AddressID = a.AddressID
INNER JOIN Addresses ma
ON em.ManagerID = ma.AddressID
ORDER BY em.FirstName