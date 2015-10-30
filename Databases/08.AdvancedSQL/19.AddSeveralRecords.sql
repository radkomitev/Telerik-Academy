INSERT INTO Users (Username, [Password], FullName, LastLoginTime)
VALUES
('peshoo', '111111', 'Pesho Peshev', GETDATE()),
('gosho', '222222', 'Gosho Goshev', GETDATE())

INSERT INTO Groups (Name)
VALUES 
('Football'),
('Tennis')