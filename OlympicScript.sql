USE [master]
GO
/****** Object:  Database [Olympics]    Script Date: 4/12/2020 3:06:32 PM ******/
CREATE DATABASE [Olympics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Olympics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Olympics.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Olympics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Olympics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Olympics] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Olympics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Olympics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Olympics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Olympics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Olympics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Olympics] SET ARITHABORT OFF 
GO
ALTER DATABASE [Olympics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Olympics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Olympics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Olympics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Olympics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Olympics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Olympics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Olympics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Olympics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Olympics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Olympics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Olympics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Olympics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Olympics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Olympics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Olympics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Olympics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Olympics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Olympics] SET  MULTI_USER 
GO
ALTER DATABASE [Olympics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Olympics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Olympics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Olympics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Olympics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Olympics] SET QUERY_STORE = OFF
GO
USE [Olympics]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/12/2020 3:06:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Emailid] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booked tickets]    Script Date: 4/12/2020 3:06:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booked tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User id] [int] NULL,
	[User name] [nvarchar](50) NULL,
	[Sports id] [int] NULL,
	[Sports name] [nvarchar](50) NULL,
	[Seat number] [int] NOT NULL,
	[Amount] [numeric](18, 2) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Booked tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medals]    Script Date: 4/12/2020 3:06:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country name] [nvarchar](50) NULL,
	[Gold] [int] NULL,
	[Silver] [int] NULL,
	[Bronze] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_Medals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sports]    Script Date: 4/12/2020 3:06:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Game name] [nvarchar](250) NULL,
	[Game description] [nvarchar](max) NULL,
	[Start time] [nvarchar](10) NULL,
	[End time] [nvarchar](10) NULL,
	[Participating countries] [nvarchar](max) NULL,
	[Venue name] [nvarchar](50) NULL,
	[Venue details] [nvarchar](max) NULL,
	[Total seats] [int] NULL,
	[First winning country] [nvarchar](50) NULL,
	[second winning country] [nvarchar](50) NULL,
	[Third winning country] [nvarchar](50) NULL,
	[Ticket price] [numeric](18, 2) NULL,
	[Tournament date] [date] NULL,
 CONSTRAINT [PK_Sports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/12/2020 3:06:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Emailid] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Phone number] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Name], [Emailid], [Password]) VALUES (1, N'Ankit', N'ankitraj251111@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Medals] ON 

INSERT [dbo].[Medals] ([Id], [Country name], [Gold], [Silver], [Bronze], [Total]) VALUES (1, N'India', 1, 2, 4, 7)
SET IDENTITY_INSERT [dbo].[Medals] OFF
SET IDENTITY_INSERT [dbo].[Sports] ON 

INSERT [dbo].[Sports] ([Id], [Game name], [Game description], [Start time], [End time], [Participating countries], [Venue name], [Venue details], [Total seats], [First winning country], [second winning country], [Third winning country], [Ticket price], [Tournament date]) VALUES (1, N'cricket', N'No desc', N'10 am', N'11am', N'India, Pakistan', N'bangalore', N'bangalore', 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sports] ([Id], [Game name], [Game description], [Start time], [End time], [Participating countries], [Venue name], [Venue details], [Total seats], [First winning country], [second winning country], [Third winning country], [Ticket price], [Tournament date]) VALUES (2, N'Football', N'no desc', N'07:00', N'20:00', N'India, England', N'bangalore', N'bangalore', 3, NULL, NULL, NULL, CAST(2000.00 AS Numeric(18, 2)), CAST(N'2020-04-12' AS Date))
INSERT [dbo].[Sports] ([Id], [Game name], [Game description], [Start time], [End time], [Participating countries], [Venue name], [Venue details], [Total seats], [First winning country], [second winning country], [Third winning country], [Ticket price], [Tournament date]) VALUES (3, N'Hockey', NULL, N'08:00', N'09:00', N'India', N'Banglore', N'bangalore', 10, NULL, NULL, NULL, CAST(2000.00 AS Numeric(18, 2)), CAST(N'2020-04-13' AS Date))
SET IDENTITY_INSERT [dbo].[Sports] OFF
USE [master]
GO
ALTER DATABASE [Olympics] SET  READ_WRITE 
GO
