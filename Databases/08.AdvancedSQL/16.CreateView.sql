CREATE VIEW [Users] AS
SELECT Username, LastLoginTime
FROM Users
WHERE
CONVERT(VARCHAR(20), LastLoginTime, 102) <= CONVERT(VARCHAR(20) ,GETDATE(), 102)
GO