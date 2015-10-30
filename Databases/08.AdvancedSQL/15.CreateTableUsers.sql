--Write a SQL statement to create a table Users.
--Users should have username, password, full name and last login time.
 
USE TelerikAcademy

CREATE TABLE Users (
  UserId int IDENTITY,
  Username nvarchar(100) UNIQUE NOT NULL,
  [Password] NVARCHAR(40) CHECK (LEN([Password]) >= 5) NOT NULL,
  FullName nvarchar(100) NOT NULL,
  LastLoginTime datetime
  CONSTRAINT PK_Users PRIMARY KEY(UserId)
)
GO