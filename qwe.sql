USE [master]
GO
/****** Object:  Database [supermarket]    Script Date: 2021-06-22 21:51:32 ******/
CREATE DATABASE [supermarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'supermarket', FILENAME = N'' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'supermarket_log', FILENAME = N'' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [supermarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [supermarket] SET RECOVERY FULL 
GO
ALTER DATABASE [supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [supermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [supermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [supermarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'supermarket', N'ON'
GO
USE [supermarket]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[AdminPwd] [nvarchar](50) NOT NULL,
	[position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commodity]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commodity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [nvarchar](50) NOT NULL,
	[GoodsMoney] [nvarchar](50) NOT NULL,
	[GoodsNum] [int] NOT NULL,
	[GoodsL] [nvarchar](50) NULL,
	[PMuch] [money] NOT NULL,
	[Goodsbh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Commodity_1] PRIMARY KEY CLUSTERED 
(
	[GoodsName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserSex] [nvarchar](50) NOT NULL,
	[UserTelephone] [int] NOT NULL,
	[UserCard] [int] NOT NULL,
	[CardDate] [datetime] NOT NULL,
 CONSTRAINT [PK_user_1] PRIMARY KEY CLUSTERED 
(
	[UserCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order O]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order O](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Money] [money] NOT NULL,
	[date] [datetime] NOT NULL,
	[UserCard] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order T]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order T](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[GoodsName] [nvarchar](50) NOT NULL,
	[Num] [int] NOT NULL,
 CONSTRAINT [PK_Order T] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 2021-06-22 21:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BianHao] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[Purchase] [nvarchar](50) NOT NULL,
	[Num] [nvarchar](50) NOT NULL,
	[PMuch] [money] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 


SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[Commodity] ON 


SET IDENTITY_INSERT [dbo].[Commodity] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 


SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Order O] ON 

SET IDENTITY_INSERT [dbo].[Order O] OFF
GO
SET IDENTITY_INSERT [dbo].[Order T] ON 


SET IDENTITY_INSERT [dbo].[Order T] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 

SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
/****** Object:  Index [IX_Commodity]    Script Date: 2021-06-22 21:51:32 ******/
ALTER TABLE [dbo].[Commodity] ADD  CONSTRAINT [IX_Commodity] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User]    Script Date: 2021-06-22 21:51:32 ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order O]  WITH NOCHECK ADD  CONSTRAINT [FK_Order O_Member] FOREIGN KEY([UserCard])
REFERENCES [dbo].[Member] ([UserCard])
GO
ALTER TABLE [dbo].[Order O] NOCHECK CONSTRAINT [FK_Order O_Member]
GO
ALTER TABLE [dbo].[Order T]  WITH NOCHECK ADD  CONSTRAINT [FK_Order T_Order O] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order O] ([id])
GO
ALTER TABLE [dbo].[Order T] NOCHECK CONSTRAINT [FK_Order T_Order O]
GO
ALTER TABLE [dbo].[Order T]  WITH NOCHECK ADD  CONSTRAINT [FK_Order T_Order T] FOREIGN KEY([GoodsName])
REFERENCES [dbo].[Commodity] ([GoodsName])
GO
ALTER TABLE [dbo].[Order T] NOCHECK CONSTRAINT [FK_Order T_Order T]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [CK_Administrator] CHECK  (([position]='管理员' OR [position]='服务员'))
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [CK_Administrator]
GO
ALTER TABLE [dbo].[Commodity]  WITH CHECK ADD  CONSTRAINT [CK_Commodity] CHECK  (([GoodsNum]>=(0)))
GO
ALTER TABLE [dbo].[Commodity] CHECK CONSTRAINT [CK_Commodity]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [CK_user] CHECK  (([UserSex]='男' OR [UserSex]='女'))
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [CK_user]
GO
USE [master]
GO
ALTER DATABASE [supermarket] SET  READ_WRITE 
GO
