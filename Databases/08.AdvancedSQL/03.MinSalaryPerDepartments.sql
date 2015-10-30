--Write a SQL query to find the full name, salary and department of the employees that take the minimal salary in their department.
--Use a nested SELECT statement.
USE TelerikAcademy

SELECT e.FirstName + ' ' + e.LastName AS [FullName], e.Salary, d.Name
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE Salary =
	(SELECT MIN(Salary) FROM Employees em 
	 WHERE e.DepartmentID = em.DepartmentID)
ORDER BY e.Salary DESC