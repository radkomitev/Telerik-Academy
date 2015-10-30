--Write a SQL query to display the town where maximal number of employees work.
USE TelerikAcademy

SELECT TOP 1 t.Name
FROM Employees e
JOIN Addresses a
ON e.AddressID = a.AddressID
JOIN Towns t
ON t.TownID = a.TownID
GROUP BY t.Name
ORDER BY COUNT(*) DESC
