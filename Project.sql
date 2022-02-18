USE [master]
GO
/****** Object:  Database [ProjectPRJ321]    Script Date: 11/19/2020 9:30:21 AM ******/
CREATE DATABASE [ProjectPRJ321]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectPRJ321', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectPRJ321.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectPRJ321_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectPRJ321_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectPRJ321] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRJ321].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRJ321] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRJ321] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRJ321] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectPRJ321] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRJ321] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRJ321] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRJ321] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRJ321] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectPRJ321] SET QUERY_STORE = OFF
GO
USE [ProjectPRJ321]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/19/2020 9:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](20) NULL,
	[phone] [varchar](30) NULL,
	[email] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/19/2020 9:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adname] [nvarchar](30) NOT NULL,
	[adpass] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[adname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 11/19/2020 9:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[name] [varchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[card] [varchar](20) NULL,
	[shipto] [varchar](100) NULL,
	[notice] [varchar](300) NULL,
	[total] [varchar](20) NULL,
	[interest] [float] NULL,
	[date] [date] NULL,
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/19/2020 9:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/19/2020 9:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[billid] [int] NULL,
	[pname] [varchar](50) NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/19/2020 9:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[image] [varchar](200) NULL,
	[price] [float] NULL,
	[Describes] [varchar](200) NULL,
	[PriceAfter] [float] NULL,
	[rest] [int] NULL,
	[idtype] [int] NULL,
	[sold] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [pass], [phone], [email]) VALUES (N'mra', N'2172000', N'12345678', N'mra@gmail.com')
INSERT [dbo].[Account] ([username], [pass], [phone], [email]) VALUES (N'mrb', N'mrb', N'12354656', N'mrb@gmail.com')
INSERT [dbo].[Account] ([username], [pass], [phone], [email]) VALUES (N'mrc', N'mrc', N'656563456', N'mrc@gmail.com')
INSERT [dbo].[Account] ([username], [pass], [phone], [email]) VALUES (N'mrd', N'mrd', N'65365654', N'mrd@gmail.com')
INSERT [dbo].[Account] ([username], [pass], [phone], [email]) VALUES (N'mre', N'mre', N'747567465', N'mre@gmail.com')
INSERT [dbo].[Account] ([username], [pass], [phone], [email]) VALUES (N'mrf', N'mrf', N'432141324', N'mrf@gmail.com')
INSERT [dbo].[Account] ([username], [pass], [phone], [email]) VALUES (N'mrg', N'mrg', N'76476574', N'mrg@gmail.com')
GO
INSERT [dbo].[Admin] ([adname], [adpass]) VALUES (N'admin', N'111')
INSERT [dbo].[Admin] ([adname], [adpass]) VALUES (N'admin2', N'222')
GO
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'34134324312', N'1233333', N'hoa lac ha noi', N'can than', N'128.0', 41, CAST(N'2020-11-11' AS Date), 1)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'34134324312', N'474567', N'hcm', N'can than nhe shipper', N'229.0', 37, CAST(N'2020-11-11' AS Date), 2)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrb', N'34134324312', N'474567', N'thach that thach hoa', N'be carefull', N'53.0', 19, CAST(N'2020-11-12' AS Date), 3)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrb', N'0387399342', N'634545', N'chua Lang', N'giao hang luc 7pm', N'199.0', 48, CAST(N'2020-11-12' AS Date), 4)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'0387399342', N'412341324123', N'huu nghi hoa binh', N'sdafasdfasdfas', N'169.0', 37, CAST(N'2020-11-12' AS Date), 5)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrc', N'34134324312', N'634545', N'hai phong', N'giao hang trong 50 phut', N'179.0', 29, CAST(N'2020-11-12' AS Date), 6)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'66536344', N'412341324123', N'dai hoc FPT', N'can ngay trong 30 phut', N'128.0', 41, CAST(N'2020-11-12' AS Date), 7)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'0986111876', N'1233333', N'bac giang', N'can than nhe bro', N'132.0', 42, CAST(N'2020-11-17' AS Date), 8)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'34134324312', N'1233333', N'bac giang', N'can than nhe bro', N'66.0', 21, CAST(N'2020-11-17' AS Date), 9)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'66536344', N'634545', N'bac giang', N'can than nhe bro', N'66.0', 21, CAST(N'2020-11-17' AS Date), 10)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'0387399342', N'412341324123', N'hoa lac ha noi', N'lan thu 1', N'102.0', 32, CAST(N'2020-11-17' AS Date), 11)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'66536344', N'634545', N'hoa lac ha noi', N'can than lan thu n', N'82.0', 25, CAST(N'2020-11-17' AS Date), 12)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'66536344', N'634545', N'hoa lac ha noi', N'can than lan n+1', N'78.0', 26, CAST(N'2020-11-17' AS Date), 13)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrb', N'34134324312', N'412341324123', N'Thai Binh', N'can than lan n+2', N'155.0', 23, CAST(N'2020-11-17' AS Date), 14)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrb', N'0986111876', N'1233333', N'hoa lac ha noi', N'can than lan n+3', N'106.0', 24, CAST(N'2020-11-17' AS Date), 15)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrb', N'66536344', N'42352435', N'jjfghjfg', N'gsfdgsdfg', N'155.0', 23, CAST(N'2020-11-17' AS Date), 16)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrb', N'0387399342', N'42352435', N'hoa lac ha noi', N'can than', N'53.0', 19, CAST(N'2020-11-17' AS Date), 17)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mrb', N'0986111876', N'1233333', N'4dsfdsafsdfsdf', N'gsfdgsdfg', N'186.0', 26, CAST(N'2020-11-17' AS Date), 18)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'34134324312', N'1233333', N'hoa binh', N'can than', N'164.0', 50, CAST(N'2020-11-17' AS Date), 19)
INSERT [dbo].[bill] ([name], [phone], [card], [shipto], [notice], [total], [interest], [date], [id]) VALUES (N'mra', N'0986111876', N'634545', N'4dsfdsafsdfsdf', N'hgh', N'72.0', 25, CAST(N'2020-11-17' AS Date), 20)
GO
INSERT [dbo].[Categories] ([ID], [name]) VALUES (1, N'Fresh Meat')
INSERT [dbo].[Categories] ([ID], [name]) VALUES (2, N'Organic Fruit')
INSERT [dbo].[Categories] ([ID], [name]) VALUES (3, N'Vegetable')
INSERT [dbo].[Categories] ([ID], [name]) VALUES (4, N'Organic Milk')
GO
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (18, N'Apple', 1)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (18, N'Spinach', 3)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (2, N'Orange', 1)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (2, N'Spinach', 4)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (2, N'Apple', 5)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (3, N'Potato', 4)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (3, N'OrganicMilk', 1)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (4, N'Strawberries', 2)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (5, N'Pepper', 1)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (5, N'Pepper', 6)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (6, N'Durian', 2)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (7, N'GuavaFruit', 3)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (19, N'Watermelon', 2)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (19, N'Mango', 2)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (20, N'Grapes', 1)
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (20, N'Mango', 1)
<<<<<<< HEAD
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (22, N'Mango1456', 1)
=======
INSERT [dbo].[OrderDetail] ([billid], [pname], [quantity]) VALUES (22, N'Mango123', 1)
>>>>>>> 35dbca3835017f571926d9ba4c121268fd417673
GO
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (2, N'Grapes', N'../images/product-2.jpg', 46, N'Grapes from Italia, sweet, fragrant for 1 week', 30, 29, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (3, N'Mango', N'../images/product-3.jpg', 26, N'Ripe mangoes from Vietnam, used for 3 days', 17, 16, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (4, N'Watermelon', N'../images/product-4.jpg', 56, N'From Laos ,fragrant for 1 week ', 40, 38, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (5, N'Apple', N'../images/product-5.jpg', 63, N'From American,
 red when ripe, fragrant for 1 week', 50, 49, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (6, N'Raisins', N'../images/product-6.jpg', 74, N'From ThaiLand, red when ripe, fragrant for 3 days', 60, 59, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (7, N'Orange', N'../images/product-7.jpg', 32, N'From ThaiLand, red when ripe, fragrant for 3 days', 22, 21, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (8, N'Spinach', N'../images/product-8.jpg', 123, N'From ThaiLand, red when ripe, fragrant for 3 days', 110, 109, 3, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (9, N'Strawberries', N'../images/product-9.jpg', 123, N'From many countries, combo from many fruits, can give friends as a gift', 100, 99, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (10, N'Pepper', N'../images/product-10.jpg', 78, N'Not very spicy, making the dish more eye-catching', 0, 12, 3, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (11, N'OrganicMilk', N'../images/product-11.jpg', 18, N'Milk from farm in Vietnam according to organic standards', 10, 8, 4, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (12, N'Durian', N'../images/product-12.jpg', 56, N'The smell is difficult to smell depending on the taste of each person', 40, 39, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (13, N'GuavaFruit', N'../images/product-13.jpg', 34, N'Famous green grapefruit in Vietnam', 20, 19, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (14, N'Peaches', N'../images/product-14.jpg', 56, N'From Son La, VietNam, swweet, easy to eat', 40, 36, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (15, N'Banana', N'../images/product-15.jpg', 44, N'Famous banana in Vietnam', 34, 33, 2, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (16, N'Egg', N'../images/product-16.jpg', 12, N'Famous egg from VietNam', 4, 3, 1, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (17, N'Tomatoes', N'../images/product-17.jpg', 30, N'Tomatoes from indonesia', 19, 18, 3, 0)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (18, N'Potato', N'../images/product-18.jpg', 23, N'From Russia, very delicios', 15, 14, 3, NULL)
INSERT [dbo].[Product] ([id], [name], [image], [price], [Describes], [PriceAfter], [rest], [idtype], [sold]) VALUES (19, N'Potato', N'../images/product-18.jpg', 23, N'From Russia, very delicios', 15, 14, 3, NULL)
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_Account] FOREIGN KEY([name])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([idtype])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
USE [master]
GO
ALTER DATABASE [ProjectPRJ321] SET  READ_WRITE 
GO
