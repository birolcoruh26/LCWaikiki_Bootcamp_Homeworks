USE [master]
GO
/****** Object:  Database [PatikaCommerceDb]    Script Date: 4.05.2022 21:03:45 ******/
CREATE DATABASE [PatikaCommerceDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PatikaCommerceDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.BIROL\MSSQL\DATA\PatikaCommerceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PatikaCommerceDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.BIROL\MSSQL\DATA\PatikaCommerceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PatikaCommerceDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PatikaCommerceDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PatikaCommerceDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PatikaCommerceDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PatikaCommerceDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PatikaCommerceDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PatikaCommerceDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PatikaCommerceDb] SET  MULTI_USER 
GO
ALTER DATABASE [PatikaCommerceDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PatikaCommerceDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PatikaCommerceDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PatikaCommerceDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PatikaCommerceDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PatikaCommerceDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PatikaCommerceDb] SET QUERY_STORE = OFF
GO
USE [PatikaCommerceDb]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](25) NULL,
	[ActivationCode] [smallint] NULL,
	[ForgotCode] [smallint] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UnqKey_ForgotCode] UNIQUE NONCLUSTERED 
(
	[ForgotCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UnqKey_UserPassword] UNIQUE NONCLUSTERED 
(
	[Password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserView]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserView]
WITH SCHEMABINDING AS
SELECT CONCAT(p.FirstName,' ' , p.LastName) as 'FullName',
p.Email,p.Password,
RIGHT(REPLICATE('0', 10) + CONVERT(VARCHAR(7), p.UserId), 7) as 'BarcodeNumber'
FROM [dbo].[User] p
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](25) NULL,
	[Category_Description] [ntext] NULL,
	[Category_Image] [image] NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](50) NOT NULL,
	[Product_Main_Image] [image] NULL,
	[Category_Id] [int] NULL,
	[SubCategory_Id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategory_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Id] [int] NOT NULL,
	[SubCategory_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[Product_Id] [int] NOT NULL,
	[Product_Description] [nvarchar](max) NULL,
	[Product_Image1] [image] NULL,
	[Product_Image2] [image] NULL,
	[Product_Price] [money] NULL,
	[Product_Stock] [smallint] NULL,
 CONSTRAINT [PK_Product_Detail_1] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductView]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[ProductView]
as
select p1.Product_Name,c1.Category_Name,s1.SubCategory_Name,p2.Product_Description,p2.Product_Price,p2.Product_Stock 
from Product p1
left join Product_Detail p2
on p1.Product_Id = p2.Product_Id
left join Category c1
on p1.Category_Id = c1.Category_Id
left join SubCategory s1
on p1.SubCategory_Id = s1.SubCategory_Id
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [nvarchar](50) NOT NULL,
	[Customer_Address] [nvarchar](max) NULL,
	[Customer_Country] [nvarchar](25) NULL,
	[Customer_City] [nvarchar](25) NULL,
	[Customer_Phone] [nvarchar](25) NULL,
	[Customer_PostCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UnqKey_CustomerPhone] UNIQUE NONCLUSTERED 
(
	[Customer_Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [int] NOT NULL,
	[Order_Date] [datetime] NOT NULL,
	[Shipping_Cost] [money] NULL,
	[Shipping_Date] [datetime] NULL,
	[Shipping_Address] [nvarchar](max) NULL,
	[Shipping_City] [nvarchar](25) NULL,
	[Shipping_PostCode] [nvarchar](25) NULL,
	[Is_Delivered] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Order_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Order_Quantity] [smallint] NOT NULL,
	[Order_UnitPrice] [money] NOT NULL,
	[Order_TotalPrice] [money] NULL,
 CONSTRAINT [PK_Order_Detail_1] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CategoryName]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[Category]
(
	[Category_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CustomerCountry]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [CustomerCountry] ON [dbo].[Customer]
(
	[Customer_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CustomerName]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [CustomerName] ON [dbo].[Customer]
(
	[Customer_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CustomerOrders]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [CustomerOrders] ON [dbo].[Order]
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ShippingCity]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [ShippingCity] ON [dbo].[Order]
(
	[Shipping_City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ShippingCost]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [ShippingCost] ON [dbo].[Order]
(
	[Shipping_Cost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ShippingDate]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [ShippingDate] ON [dbo].[Order]
(
	[Shipping_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Quantity]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [Quantity] ON [dbo].[Order_Detail]
(
	[Order_Quantity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UnitPrice]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [UnitPrice] ON [dbo].[Order_Detail]
(
	[Order_UnitPrice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CategoryProducts]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [CategoryProducts] ON [dbo].[Product]
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ProductName]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[Product]
(
	[Product_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [SubCategoryProducts]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [SubCategoryProducts] ON [dbo].[Product]
(
	[SubCategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ProductDetails]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [ProductDetails] ON [dbo].[Product_Detail]
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ProductPrice]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [ProductPrice] ON [dbo].[Product_Detail]
(
	[Product_Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ProductStock]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [ProductStock] ON [dbo].[Product_Detail]
(
	[Product_Stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SubCategoryName]    Script Date: 4.05.2022 21:03:46 ******/
CREATE NONCLUSTERED INDEX [SubCategoryName] ON [dbo].[SubCategory]
(
	[SubCategory_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unq_UserEmail]    Script Date: 4.05.2022 21:03:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unq_UserEmail] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Order_Id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategory_Id])
REFERENCES [dbo].[SubCategory] ([SubCategory_Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([Product_Id])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateCustomer]
(
@Customer_Id int,
@Customer_Name nvarchar(50),
@Customer_Address nvarchar(MAX),
@Customer_Country nvarchar(25),
@Customer_City nvarchar(25),
@Customer_Phone nvarchar(25),
@Customer_PostCode nvarchar(25)
)
as
begin
Update Customer
set Customer_Name = @Customer_Name, Customer_Address = @Customer_Address, 
Customer_Country = @Customer_Country, Customer_City = @Customer_City, Customer_Phone = @Customer_Phone,Customer_PostCode = @Customer_PostCode
where Customer_Id = @Customer_Id
end
GO
/****** Object:  Trigger [dbo].[changeTotalPrice]    Script Date: 4.05.2022 21:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [dbo].[changeTotalPrice]
on [dbo].[Order_Detail]
after insert 
as 
begin
update Order_Detail
set  Order_TotalPrice = Order_UnitPrice * Order_Quantity
end
GO
ALTER TABLE [dbo].[Order_Detail] ENABLE TRIGGER [changeTotalPrice]
GO
USE [master]
GO
ALTER DATABASE [PatikaCommerceDb] SET  READ_WRITE 
GO
