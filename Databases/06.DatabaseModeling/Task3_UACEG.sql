USE [master]
GO
/****** Object:  Database [DatabaseModeling_Task3_University]    Script Date: 10/5/2015 2:26:41 PM ******/
CREATE DATABASE [DatabaseModeling_Task3_University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task3_University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Task3_University.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Task3_University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Task3_University_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabaseModeling_Task3_University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET RECOVERY FULL 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET  MULTI_USER 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DatabaseModeling_Task3_University', N'ON'
GO
USE [DatabaseModeling_Task3_University]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ProfessorId] [int] NOT NULL CONSTRAINT [DF_Courses_ProfessorId]  DEFAULT ((1)),
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacultyId] [int] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DepartmtentId] [int] NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorsTitles]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorsTitles](
	[ProfessorId] [int] NOT NULL,
	[TitleId] [int] NOT NULL,
 CONSTRAINT [PK_ProfessorsTitles] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC,
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProffesorsCourses]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProffesorsCourses](
	[CourseId] [int] NOT NULL,
	[ProfessorId] [int] NOT NULL,
 CONSTRAINT [PK_ProffesorsCourses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[FacultyId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentsCourses]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsCourses](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titles]    Script Date: 10/5/2015 2:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[TitleId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [Name], [DepartmentId], [ProfessorId]) VALUES (1, N'MOGI', 1, 1)
INSERT [dbo].[Courses] ([CourseId], [Name], [DepartmentId], [ProfessorId]) VALUES (2, N'VIK', 1, 2)
INSERT [dbo].[Courses] ([CourseId], [Name], [DepartmentId], [ProfessorId]) VALUES (3, N'UUT', 1, 3)
INSERT [dbo].[Courses] ([CourseId], [Name], [DepartmentId], [ProfessorId]) VALUES (4, N'Civil Engineering', 3, 2)
INSERT [dbo].[Courses] ([CourseId], [Name], [DepartmentId], [ProfessorId]) VALUES (5, N'Architecture', 2, 3)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [Name], [FacultyId]) VALUES (1, N'Geodesy', 1)
INSERT [dbo].[Departments] ([DepartmentId], [Name], [FacultyId]) VALUES (2, N'Urbanism', 1)
INSERT [dbo].[Departments] ([DepartmentId], [Name], [FacultyId]) VALUES (3, N'Architectural', 2)
INSERT [dbo].[Departments] ([DepartmentId], [Name], [FacultyId]) VALUES (4, N'Civil Engineering', 3)
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (1, N'Geodesy')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (2, N'Architectural')
INSERT [dbo].[Faculties] ([FacultyId], [Name]) VALUES (3, N'Civil Engineering')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
SET IDENTITY_INSERT [dbo].[Professors] ON 

INSERT [dbo].[Professors] ([ProfessorId], [Name], [DepartmtentId]) VALUES (1, N'Petko Petkov', 1)
INSERT [dbo].[Professors] ([ProfessorId], [Name], [DepartmtentId]) VALUES (2, N'Georgi Lozanov', 2)
INSERT [dbo].[Professors] ([ProfessorId], [Name], [DepartmtentId]) VALUES (3, N'Milena Kozareva', 3)
SET IDENTITY_INSERT [dbo].[Professors] OFF
INSERT [dbo].[ProfessorsTitles] ([ProfessorId], [TitleId]) VALUES (1, 1)
INSERT [dbo].[ProfessorsTitles] ([ProfessorId], [TitleId]) VALUES (1, 2)
INSERT [dbo].[ProfessorsTitles] ([ProfessorId], [TitleId]) VALUES (2, 2)
INSERT [dbo].[ProfessorsTitles] ([ProfessorId], [TitleId]) VALUES (3, 3)
INSERT [dbo].[ProffesorsCourses] ([CourseId], [ProfessorId]) VALUES (1, 1)
INSERT [dbo].[ProffesorsCourses] ([CourseId], [ProfessorId]) VALUES (1, 2)
INSERT [dbo].[ProffesorsCourses] ([CourseId], [ProfessorId]) VALUES (1, 3)
INSERT [dbo].[ProffesorsCourses] ([CourseId], [ProfessorId]) VALUES (2, 2)
INSERT [dbo].[ProffesorsCourses] ([CourseId], [ProfessorId]) VALUES (2, 3)
INSERT [dbo].[ProffesorsCourses] ([CourseId], [ProfessorId]) VALUES (3, 1)
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [Name], [FacultyId]) VALUES (1, N'Pesho Peshev', 2)
INSERT [dbo].[Students] ([StudentId], [Name], [FacultyId]) VALUES (2, N'Grisho Neshev', 1)
INSERT [dbo].[Students] ([StudentId], [Name], [FacultyId]) VALUES (3, N'Plamen Grozdanov', 3)
INSERT [dbo].[Students] ([StudentId], [Name], [FacultyId]) VALUES (5, N'Katya Peneva', 3)
INSERT [dbo].[Students] ([StudentId], [Name], [FacultyId]) VALUES (6, N'Elica Mladenova', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
INSERT [dbo].[StudentsCourses] ([StudentId], [CourseId]) VALUES (2, 1)
INSERT [dbo].[StudentsCourses] ([StudentId], [CourseId]) VALUES (2, 2)
INSERT [dbo].[StudentsCourses] ([StudentId], [CourseId]) VALUES (2, 3)
INSERT [dbo].[StudentsCourses] ([StudentId], [CourseId]) VALUES (1, 1)
INSERT [dbo].[StudentsCourses] ([StudentId], [CourseId]) VALUES (2, 2)
INSERT [dbo].[StudentsCourses] ([StudentId], [CourseId]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([TitleId], [Type]) VALUES (1, N'Professor')
INSERT [dbo].[Titles] ([TitleId], [Type]) VALUES (2, N'Main Assistent')
INSERT [dbo].[Titles] ([TitleId], [Type]) VALUES (3, N'Assistent')
SET IDENTITY_INSERT [dbo].[Titles] OFF
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([FacultyId])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Departments] FOREIGN KEY([DepartmtentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Departments]
GO
ALTER TABLE [dbo].[ProfessorsTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsTitles_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([ProfessorId])
GO
ALTER TABLE [dbo].[ProfessorsTitles] CHECK CONSTRAINT [FK_ProfessorsTitles_Professors]
GO
ALTER TABLE [dbo].[ProfessorsTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsTitles_Titles] FOREIGN KEY([TitleId])
REFERENCES [dbo].[Titles] ([TitleId])
GO
ALTER TABLE [dbo].[ProfessorsTitles] CHECK CONSTRAINT [FK_ProfessorsTitles_Titles]
GO
ALTER TABLE [dbo].[ProffesorsCourses]  WITH CHECK ADD  CONSTRAINT [FK_ProffesorsCourses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[ProffesorsCourses] CHECK CONSTRAINT [FK_ProffesorsCourses_Courses]
GO
ALTER TABLE [dbo].[ProffesorsCourses]  WITH CHECK ADD  CONSTRAINT [FK_ProffesorsCourses_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([ProfessorId])
GO
ALTER TABLE [dbo].[ProffesorsCourses] CHECK CONSTRAINT [FK_ProffesorsCourses_Professors]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([FacultyId])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculties]
GO
ALTER TABLE [dbo].[StudentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentsCourses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[StudentsCourses] CHECK CONSTRAINT [FK_StudentsCourses_Courses]
GO
ALTER TABLE [dbo].[StudentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentsCourses_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentsCourses] CHECK CONSTRAINT [FK_StudentsCourses_Students]
GO
USE [master]
GO
ALTER DATABASE [DatabaseModeling_Task3_University] SET  READ_WRITE 
GO
