USE [master]
GO
/****** Object:  Database [DatabaseModeling_Task1_2]    Script Date: 10/5/2015 1:24:30 PM ******/
CREATE DATABASE [DatabaseModeling_Task1_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatabaseModeling_Task1_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DatabaseModeling_Task1_2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DatabaseModeling_Task1_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DatabaseModeling_Task1_2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabaseModeling_Task1_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET RECOVERY FULL 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET  MULTI_USER 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DatabaseModeling_Task1_2', N'ON'
GO
USE [DatabaseModeling_Task1_2]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 10/5/2015 1:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address_text] [nvarchar](50) NOT NULL,
	[town_id] [int] NOT NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONTINENT]    Script Date: 10/5/2015 1:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTINENT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CONTINENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 10/5/2015 1:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[continent_id] [int] NOT NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 10/5/2015 1:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOWN]    Script Date: 10/5/2015 1:24:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOWN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_TOWN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ADDRESS] ON 

INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (1, N'Bul. Bulgaria', 1)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (2, N'Bul. Plovdiv', 2)
INSERT [dbo].[ADDRESS] ([id], [address_text], [town_id]) VALUES (4, N'Bul. Haskovo', 3)
SET IDENTITY_INSERT [dbo].[ADDRESS] OFF
SET IDENTITY_INSERT [dbo].[CONTINENT] ON 

INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (1, N'Europe')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (2, N'Asia')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (3, N'Africa')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (4, N'SouthAmerica')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (5, N'NorthAmerica')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (6, N'Australia')
INSERT [dbo].[CONTINENT] ([id], [name]) VALUES (7, N'Antractida')
SET IDENTITY_INSERT [dbo].[CONTINENT] OFF
SET IDENTITY_INSERT [dbo].[COUNTRY] ON 

INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (2, N'Iraq', 2)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (3, N'Mexico', 4)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (4, N'Australia', 6)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (5, N'USA', 5)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (6, N'Gabon', 3)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (7, N'Spain', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (8, N'Italy', 1)
INSERT [dbo].[COUNTRY] ([id], [name], [continent_id]) VALUES (9, N'Germany', 1)
SET IDENTITY_INSERT [dbo].[COUNTRY] OFF
SET IDENTITY_INSERT [dbo].[PERSON] ON 

INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (1, N'Ivan', N'Cvetkov', 1)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (3, N'Georgi', N'Milanov', 2)
INSERT [dbo].[PERSON] ([id], [first_name], [last_name], [address_id]) VALUES (4, N'Ivelin', N'Popov', 4)
SET IDENTITY_INSERT [dbo].[PERSON] OFF
SET IDENTITY_INSERT [dbo].[TOWN] ON 

INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (2, N'Plovdiv', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (3, N'Haskovo', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (4, N'Varna', 1)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (6, N'Chicago', 5)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (7, N'New York', 5)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (8, N'Las Vegas', 5)
INSERT [dbo].[TOWN] ([id], [name], [country_id]) VALUES (9, N'Kerbala', 2)
SET IDENTITY_INSERT [dbo].[TOWN] OFF
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_TOWN] FOREIGN KEY([town_id])
REFERENCES [dbo].[TOWN] ([id])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_TOWN]
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CONTINENT1] FOREIGN KEY([continent_id])
REFERENCES [dbo].[CONTINENT] ([id])
GO
ALTER TABLE [dbo].[COUNTRY] CHECK CONSTRAINT [FK_COUNTRY_CONTINENT1]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_ADDRESS] FOREIGN KEY([address_id])
REFERENCES [dbo].[ADDRESS] ([id])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_ADDRESS]
GO
ALTER TABLE [dbo].[TOWN]  WITH CHECK ADD  CONSTRAINT [FK_TOWN_COUNTRY] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRY] ([id])
GO
ALTER TABLE [dbo].[TOWN] CHECK CONSTRAINT [FK_TOWN_COUNTRY]
GO
USE [master]
GO
ALTER DATABASE [DatabaseModeling_Task1_2] SET  READ_WRITE 
GO
