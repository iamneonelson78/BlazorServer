USE [master]
GO
/****** Object:  Database [BlazorDemo]    Script Date: 3/28/2022 2:33:17 PM ******/
CREATE DATABASE [BlazorDemo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlazorDemo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlazorDemo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlazorDemo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BlazorDemo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlazorDemo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlazorDemo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlazorDemo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlazorDemo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlazorDemo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlazorDemo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlazorDemo] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlazorDemo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlazorDemo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlazorDemo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlazorDemo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlazorDemo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlazorDemo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlazorDemo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlazorDemo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlazorDemo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlazorDemo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlazorDemo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlazorDemo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlazorDemo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlazorDemo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlazorDemo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlazorDemo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlazorDemo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlazorDemo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlazorDemo] SET  MULTI_USER 
GO
ALTER DATABASE [BlazorDemo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlazorDemo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlazorDemo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlazorDemo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlazorDemo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlazorDemo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BlazorDemo] SET QUERY_STORE = OFF
GO
USE [BlazorDemo]
GO
/****** Object:  User [sqluser]    Script Date: 3/28/2022 2:33:17 PM ******/
CREATE USER [sqluser] FOR LOGIN [sqluser] WITH DEFAULT_SCHEMA=[[dbo]]]
GO
ALTER ROLE [db_owner] ADD MEMBER [sqluser]
GO
/****** Object:  Schema [[dbo]]]    Script Date: 3/28/2022 2:33:17 PM ******/
CREATE SCHEMA [[dbo]]]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/28/2022 2:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[DateHired] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeKeepingTransactions]    Script Date: 3/28/2022 2:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeKeepingTransactions](
	[TimeKeepingTransactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[TransactionTypeId] [int] NULL,
	[TransactionDateTime] [datetime] NULL,
 CONSTRAINT [PK_TimeKeepingTransactions] PRIMARY KEY CLUSTERED 
(
	[TimeKeepingTransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 3/28/2022 2:33:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TimeKeepingTransactions]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeepingTransactions_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[TimeKeepingTransactions] CHECK CONSTRAINT [FK_TimeKeepingTransactions_Employee]
GO
ALTER TABLE [dbo].[TimeKeepingTransactions]  WITH CHECK ADD  CONSTRAINT [FK_TimeKeepingTransactions_TransactionType] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[TransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[TimeKeepingTransactions] CHECK CONSTRAINT [FK_TimeKeepingTransactions_TransactionType]
GO
USE [master]
GO
ALTER DATABASE [BlazorDemo] SET  READ_WRITE 
GO
