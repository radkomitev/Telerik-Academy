--Write a SQL query to find the salary of all employees whose salary is in the range [20000…30000].
USE TelerikAcademy

Select FirstName + ' ' + LastName AS [FullName], Salary
From Employees
Where Salary BETWEEN 20000 AND 30000
ORDER BY Salary DESC