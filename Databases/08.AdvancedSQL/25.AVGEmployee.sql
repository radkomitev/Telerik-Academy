--Write a SQL query to display the average employee salary by department and job title.
USE TelerikAcademy

Select AVG(Salary) AS [AverageSalary],e.JobTitle, d.Name
FROM Employees e
JOIN Departments d
ON d.DepartmentID = e.DepartmentID
GROUP BY d.Name, e.JobTitle