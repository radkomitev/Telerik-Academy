--Write a SQL query to display the current date and time in the following format
-- "day.month.year hour:minutes:seconds:milliseconds".
 
USE TelerikAcademy

SELECT CONVERT(VARCHAR, GETDATE(), 13) AS [Current Time]