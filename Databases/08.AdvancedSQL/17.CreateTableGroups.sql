--Write a SQL statement to create a table Groups. Groups should have unique name (use unique constraint).
--Define primary key and identity column.

USE TelerikAcademy

CREATE TABLE Groups (
  Groups int IDENTITY,
  Name nvarchar(100) UNIQUE NOT NULL,
)