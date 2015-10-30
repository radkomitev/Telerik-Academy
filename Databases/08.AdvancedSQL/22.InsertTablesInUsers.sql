--Write SQL statements to insert in the Users table the names of all employees from the Employees table.
--Combine the first and last names as a full name.
--For username use the first letter of the first name + the last name (in lowercase).
--Use the same for the password, and NULL for last login time.

INSERT INTO Users (Username, [Password], FullName)
SELECT LOWER(LEFT(FirstName, 5) + LastName),
		LOWER(LEFT(FirstName, 1) + LastName),
		FirstName + ' ' + LastName
FROM Employees
