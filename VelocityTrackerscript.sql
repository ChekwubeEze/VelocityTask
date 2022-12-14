USE [master]
GO
/****** Object:  Database [VelocityTracker]    Script Date: 05/11/2022 04:51:35 ******/
CREATE DATABASE [VelocityTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VelocityTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VelocityTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VelocityTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VelocityTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VelocityTracker] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VelocityTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VelocityTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VelocityTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VelocityTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VelocityTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VelocityTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [VelocityTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VelocityTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VelocityTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VelocityTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VelocityTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VelocityTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VelocityTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VelocityTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VelocityTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VelocityTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VelocityTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VelocityTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VelocityTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VelocityTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VelocityTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VelocityTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VelocityTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VelocityTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [VelocityTracker] SET  MULTI_USER 
GO
ALTER DATABASE [VelocityTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VelocityTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VelocityTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VelocityTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VelocityTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VelocityTracker] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VelocityTracker', N'ON'
GO
ALTER DATABASE [VelocityTracker] SET QUERY_STORE = OFF
GO
USE [VelocityTracker]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[EmployeeName] [varchar](125) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[Id] [int] NOT NULL,
	[EmployeeId] [int] NULL,
	[Employee] [varchar](125) NULL,
	[EstimatedHours] [int] NULL,
	[ActualHours] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] NOT NULL,
	[ProjectName] [varchar](125) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectDetails]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectDetails](
	[Id] [int] NOT NULL,
	[ProjectId] [int] NULL,
	[Projects] [varchar](125) NULL,
	[TaskTitle] [varchar](250) NULL,
	[TaskDescription] [varchar](500) NULL,
	[TotalEstimate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddEmployee]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddEmployee]
	-- Add the parameters for the stored procedure here
	@Id int,
	@EmployeeName varchar
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Into dbo.Employee
	Values(
	@Id,
	@EmployeeName)
END
GO
/****** Object:  StoredProcedure [dbo].[spAddEmployeeDetails]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddEmployeeDetails]
	-- Add the parameters for the stored procedure here
	@Id int,
	@EmployeeId int,
    @Employee varchar,
    @EstimatedHours int,
	@ActualHours int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into dbo.EmployeeDetails
	Values(
	@Id,
	@EmployeeId,
    @Employee,
    @EstimatedHours,
	@ActualHours)

END
GO
/****** Object:  StoredProcedure [dbo].[spAddProjectDetails]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddProjectDetails] 
	-- Add the parameters for the stored procedure here
	@Id int,
	@projectId int,
	@Projects varchar,
	@TaskTitle varchar,
	@TaskDescription varchar,
	@TotalEstimate int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into dbo.ProjectDetails
	Values(
		@Id,
		@projectId,
		@Projects,
		@TaskTitle,
		@TaskDescription,
		@TotalEstimate)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployee]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllEmployee] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From dbo.Employee
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProject]    Script Date: 05/11/2022 04:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProject]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From dbo.Project
END
GO
USE [master]
GO
ALTER DATABASE [VelocityTracker] SET  READ_WRITE 
GO
