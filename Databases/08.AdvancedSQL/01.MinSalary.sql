--Write a SQL query to find the names and salaries of the employees that take the minimal salary in the company.
--Use a nested SELECT statement.
USE TelerikAcademy

SELECT FirstName + ' ' + LastName AS [FullName], Salary
FROM Employees
Where Salary =
	 (SELECT MIN(SALARY) FROM Employees)