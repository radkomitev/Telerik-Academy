--Write a SQL query to display the town where maximal number of employees work.
USE TelerikAcademy
SELECT t.Name, COUNT(*) AS [Count]
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID
JOIN Addresses a
ON m.AddressID = a.AddressID
JOIN Towns t
ON t.TownID = a.TownID
WHERE e.EmployeeId 
IN (SELECT DISTINCT m.EmployeeID
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID)
GROUP BY t.Name
ORDER BY COUNT DESC


--SELECT t.Name, COUNT(*) AS [Count]
--FROM Employees e
--JOIN Employees m
--ON e.ManagerID = m.EmployeeID
--JOIN Addresses a
--ON m.AddressID = a.AddressID
--JOIN Towns t
--ON t.TownID = a.TownID
--GROUP BY t.Name
--ORDER BY COUNT DESC
