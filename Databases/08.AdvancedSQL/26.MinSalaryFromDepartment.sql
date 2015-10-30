--Write a SQL query to display the minimal employee salary by department
 --and job title along with the name of some of the employees that take it.
USE TelerikAcademy

SELECT e.FirstName + ' ' + e.LastName AS [FullName], MIN(e.Salary) AS [MinSalary], d.Name AS [Department], e.JobTitle
FROM Employees e
	JOIN Departments d
		ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle, e.FirstName + ' ' + e.LastName
