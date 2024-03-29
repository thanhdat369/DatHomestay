USE [master]
GO
/****** Object:  Database [Presentation]    Script Date: 24/08/2019 11:41:22 CH ******/
CREATE DATABASE [Presentation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Presentation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Presentation.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Presentation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Presentation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Presentation] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Presentation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Presentation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Presentation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Presentation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Presentation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Presentation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Presentation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Presentation] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Presentation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Presentation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Presentation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Presentation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Presentation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Presentation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Presentation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Presentation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Presentation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Presentation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Presentation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Presentation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Presentation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Presentation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Presentation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Presentation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Presentation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Presentation] SET  MULTI_USER 
GO
ALTER DATABASE [Presentation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Presentation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Presentation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Presentation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Presentation]
GO
/****** Object:  Table [dbo].[tbl_OrderProduct]    Script Date: 24/08/2019 11:41:23 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderProduct](
	[orderProductID] [nvarchar](20) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[total] [float] NOT NULL,
	[timeCreate] [datetime] NOT NULL,
	[status] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[orderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_OrderProductDetail]    Script Date: 24/08/2019 11:41:23 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderProductDetail](
	[orderProductID] [nvarchar](20) NOT NULL,
	[proID] [int] NOT NULL,
	[proPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderProductID] ASC,
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_OrderRoom]    Script Date: 24/08/2019 11:41:23 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderRoom](
	[orderRoomID] [nvarchar](20) NOT NULL,
	[roomID] [nvarchar](15) NOT NULL,
	[roomPrice] [float] NOT NULL,
	[customerUsername] [nvarchar](50) NOT NULL,
	[checkinDay] [date] NOT NULL,
	[checkoutDay] [date] NOT NULL,
	[finishedDay] [date] NULL,
	[total] [float] NOT NULL,
	[status] [nvarchar](15) NOT NULL,
	[createTime] [datetime] NULL,
	[staffUsername] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_OrderRoom] PRIMARY KEY CLUSTERED 
(
	[orderRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 24/08/2019 11:41:23 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[proID] [int] IDENTITY(1,1) NOT NULL,
	[proName] [nvarchar](100) NOT NULL,
	[proPrice] [float] NOT NULL,
	[proDes] [nvarchar](500) NULL,
	[proType] [nvarchar](15) NULL,
	[proImgLink] [nvarchar](100) NULL,
	[isDelete] [bit] NOT NULL,
	[proQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[proID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Registration]    Script Date: 24/08/2019 11:41:23 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Registration](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phoneNo] [nvarchar](15) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Room]    Script Date: 24/08/2019 11:41:23 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Room](
	[roomID] [nvarchar](15) NOT NULL,
	[roomPrice] [float] NOT NULL,
	[roomDes] [nvarchar](500) NULL,
	[roomImgLink] [nvarchar](100) NULL,
	[isDelete] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderProduct_tbl_Registration] FOREIGN KEY([username])
REFERENCES [dbo].[tbl_Registration] ([username])
GO
ALTER TABLE [dbo].[tbl_OrderProduct] CHECK CONSTRAINT [FK_tbl_OrderProduct_tbl_Registration]
GO
ALTER TABLE [dbo].[tbl_OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderProductDetail_tbl_OrderProduct] FOREIGN KEY([orderProductID])
REFERENCES [dbo].[tbl_OrderProduct] ([orderProductID])
GO
ALTER TABLE [dbo].[tbl_OrderProductDetail] CHECK CONSTRAINT [FK_tbl_OrderProductDetail_tbl_OrderProduct]
GO
ALTER TABLE [dbo].[tbl_OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderProductDetail_tbl_Product] FOREIGN KEY([proID])
REFERENCES [dbo].[tbl_Product] ([proID])
GO
ALTER TABLE [dbo].[tbl_OrderProductDetail] CHECK CONSTRAINT [FK_tbl_OrderProductDetail_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_OrderRoom]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderRoom_tbl_Registration] FOREIGN KEY([customerUsername])
REFERENCES [dbo].[tbl_Registration] ([username])
GO
ALTER TABLE [dbo].[tbl_OrderRoom] CHECK CONSTRAINT [FK_tbl_OrderRoom_tbl_Registration]
GO
ALTER TABLE [dbo].[tbl_OrderRoom]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderRoom_tbl_Registration1] FOREIGN KEY([staffUsername])
REFERENCES [dbo].[tbl_Registration] ([username])
GO
ALTER TABLE [dbo].[tbl_OrderRoom] CHECK CONSTRAINT [FK_tbl_OrderRoom_tbl_Registration1]
GO
ALTER TABLE [dbo].[tbl_OrderRoom]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderRoom_tbl_Room] FOREIGN KEY([roomID])
REFERENCES [dbo].[tbl_Room] ([roomID])
GO
ALTER TABLE [dbo].[tbl_OrderRoom] CHECK CONSTRAINT [FK_tbl_OrderRoom_tbl_Room]
GO
USE [master]
GO
ALTER DATABASE [Presentation] SET  READ_WRITE 
GO
