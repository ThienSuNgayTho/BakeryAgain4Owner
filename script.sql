USE [master]
GO
/****** Object:  Database [ShoppingProject]    Script Date: 7/17/2021 10:56:44 AM ******/
CREATE DATABASE [SWP301-Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_ShoppingProject_SE1501', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SWP391_ShoppingProject_SE1501.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_ShoppingProject_SE1501_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SWP391_ShoppingProject_SE1501_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SWP301-Assignment] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP301-Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP301-Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP301-Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP301-Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP301-Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP301-Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP301-Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [SWP301-Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP301-Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP301-Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP301-Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP301-Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP301-Assignment] SET QUERY_STORE = OFF
GO
USE [SWP301-Assignment]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](128) NULL,
	[Type] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[Detail] [text] NULL,
	[Rating] [int] NULL,
	[FeedbackStatus] [bit] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerEmail] [nvarchar](128) NULL,
	[OrderStatus] [nvarchar](128) NULL,
	[SaleEmail] [nvarchar](128) NULL,
	[CompleteDate] [date] NULL,
	[TotalOrderPrice] [float] NULL,
	[Address] [nvarchar](128) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[TotalItemPrice] [float] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](128) NULL,
	[Title] [nvarchar](256) NULL,
	[ThumbnailLink] [nvarchar](512) NULL,
	[UploadDate] [date] NULL,
	[Status] [bit] NULL,
	[Details] [text] NULL,
	[CategoryId] [nvarchar](50) NULL,
	[OnSlider] [bit] NULL,
	[UpdateDate] [date] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](128) NULL,
	[CategoryId] [nvarchar](50) NULL,
	[ThumbnailLink] [nvarchar](512) NULL,
	[OringinalSalePrice] [float] NULL,
	[Details] [text] NULL,
	[SalePrice] [float] NULL,
	[Status] [bit] NULL,
	[Stock] [int] NULL,
	[SaleStatus] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](128) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/17/2021 10:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](128) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[AvatarLink] [nvarchar](512) NULL,
	[Address] [nvarchar](100) NULL,
	[FullName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[CreationDate] [date] NULL,
	[Status] [bit] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C1              ', N'Sweet Cake                                                                                                                      ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C2              ', N'Savory Cake                                                                                                                     ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C3              ', N'Bread', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C4              ', N'Cream Cake                                                                                                                      ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'P1              ', N'Promoting Post                                                                                                                  ', N'post                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'P2              ', N'System Post                                                                                                                     ', N'post                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'P3', N'Sale Post', N'post')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (1, N'user@fpt.edu.vn ', N'completed', N'sale@fpt.edu.vn', CAST(N'2021-07-09' AS Date), 300000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (2, N'user@fpt.edu.vn', N'completed', N'sale@fpt.edu.vn', CAST(N'2021-07-08' AS Date), 100000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (3, N'user@fpt.edu.vn', N'deliver', N'sale@fpt.edu.vn', CAST(N'2021-07-09' AS Date), 200000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (4, N'user@fpt.edu.vn', N'cancel', N'sale@fpt.edu.vn', CAST(N'2021-05-30' AS Date), 10000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (5, N'user@fpt.edu.vn', N'approved', N'sale@fpt.edu.vn', CAST(N'2021-07-10' AS Date), 15000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (6, N'user@fpt.edu.vn', N'submitted', N'sale@fpt.edu.vn', CAST(N'2021-07-07' AS Date), 500000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (7, N'user@fpt.edu.vn', N'submitted', N'sale@fpt.edu.vn', CAST(N'2021-07-06' AS Date), 30000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (8, N'user@fpt.edu.vn', N'completed', N'sale@fpt.edu.vn', CAST(N'2021-07-10' AS Date), 20000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (9, N'user@fpt.edu.vn', N'approved', N'sale@fpt.edu.vn', CAST(N'2021-07-04' AS Date), 200000, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (11, N'abc123@fpt.edu.vn', N'submitted', NULL, CAST(N'2021-07-10' AS Date), 169400, NULL)
INSERT [dbo].[Order] ([OrderId], [CustomerEmail], [OrderStatus], [SaleEmail], [CompleteDate], [TotalOrderPrice], [Address]) VALUES (1002, N'user@fpt.edu.vn', N'submitted', NULL, CAST(N'2021-07-12' AS Date), 189200, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (1, 1, 3, 180000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (1, 2, 2, 120000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (2, 3, 3, 650000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (3, 5, 1, 25000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (5, 1, 1, 15000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (11, 1, 1, 18000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (11, 2, 1, 136000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (1002, 1, 2, 36000)
INSERT [dbo].[OrderItem] ([OrderId], [ProductId], [Quantity], [TotalItemPrice]) VALUES (1002, 2, 1, 136000)
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostId], [Email], [Title], [ThumbnailLink], [UploadDate], [Status], [Details], [CategoryId], [OnSlider], [UpdateDate]) VALUES (1, N'market@fpt.edu.vn                                                                                                               ', N'Testing                                                                                                                                                                                                                                                         ', N'post_1', CAST(N'2021-05-30' AS Date), 0, N'This is a testing post used for testing purposes. Thank you for testing this test', N'P1              ', 1, CAST(N'2021-05-30' AS Date))
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (1, N'Egg Bread', N'C1              ', N'product_1.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (2, N'Melon Cake ', N'C1              ', N'product_2.jpg                                                                                                                                                                                                                                       ', 136000, N'Cake filled with melon flavor', 96000, 1, 4, 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (3, N'Spam Cake                                                                                                                       ', N'C2              ', N'product_3.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 150000, N'Covered in spam', 120000, 1, 5, 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (4, N'Strawberry Birthday Cake                                                                                                        ', N'C4              ', N'product_4.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 280000, N'Basic strawberry flavored birthday cake', 240000, 1, 2, 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (5, N'Europian-styled Wedding Cake                                                                                                    ', N'C4              ', N'product_5.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 670000, N'A 3-floor wedding cake for a fancy couple ', 560000, 1, 1, 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (6, N'Chocolate Cake                                                                                                                  ', N'C1              ', N'product_6.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 50000, N'Cake with chocolate flavour', 40000, 1, 10, 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (7, N'Cream Cake', N'C4', N'product_7.jpg', 80000, N'Cream Cake with Vanilla Flavour!', 60000, 1, 10, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (8, N'Pork Steam Bun', N'C2', N'product_8.jpg', 17000, N'Pork Steam Bun!!!', 15000, 0, 50, 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [ThumbnailLink], [OringinalSalePrice], [Details], [SalePrice], [Status], [Stock], [SaleStatus]) VALUES (9, N'Egg Bread', N'C1              ', N'product_9', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (0, N'Admin                                                                                                                           ')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Marketing                                                                                                                       ')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Sale                                                                                                                            ')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'User                                                                                                                            ')
GO
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'abc@fpt.edu.vn', N'abc123456', NULL, N'fpt University', N'Nguyen Van Abc', N'0123456789', N'Male', CAST(N'2021-06-28' AS Date), 0, 2)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'abc123@fpt.edu.vn', N'abc123456', NULL, N'Fpt University', N'A Bo Co', N'0123456789', N'Male', CAST(N'2021-07-10' AS Date), 1, 3)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'abcdef@fpt.edu.vn', N'abc123456', NULL, N'FPT University', N'a b c d e f ', N'9876543210', N'Female', CAST(N'2021-07-10' AS Date), 1, 3)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'admin@fpt.edu.vn', N'admin               ', NULL, N'fpt university', N'A Van Minh', N'0963484125', N'Male', CAST(N'2021-05-30' AS Date), 1, 0)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'market@fpt.edu.vn', N'market              ', NULL, N'fpt university                                                                                      ', N'Ma Thi Ket Tinh                                   ', N'0874125678  ', N'Female          ', CAST(N'2021-05-30' AS Date), 1, 1)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'sale@fpt.edu.vn', N'sale                ', NULL, N'fpt university                                                                                      ', N'Sa Van Le                                         ', N'0987412361  ', N'Male            ', CAST(N'2021-05-30' AS Date), 1, 2)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'user@fpt.edu.vn', N'user                ', NULL, N'fpt university', N'U Van So', N'0877741125', N'Male', CAST(N'2021-05-30' AS Date), 1, 3)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'user123@fpt.edu.vn', N'abc123456', NULL, N'FPT University', N'userrrrrrrrr', N'7894561230', N'Male', CAST(N'2021-07-10' AS Date), 1, 3)
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerEmail])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Sale] FOREIGN KEY([SaleEmail])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Sale]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [ShoppingProject] SET  READ_WRITE 
GO
