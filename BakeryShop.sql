
CREATE TABLE [dbo].[Category](
	[CategoryId] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](128) NULL,
	[Type] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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

CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerEmail] [nvarchar](128) NULL,
	[OrderStatus] [nvarchar](128) NULL,
	[SaleEmail] [nvarchar](128) NULL,
	[CompleteDate] [date] NULL,
	[TotalOrderPrice] [float] NULL,
	[Address] [nvarchar](128) NULL,
	[ShippingPrice] [float] NULL,
	[Paid] [bit] NULL
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](128) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C1              ', N'Sweet Cake                                                                                                                      ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C2              ', N'Savory Cake                                                                                                                     ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C3              ', N'Bread', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'C4              ', N'Cream Cake                                                                                                                      ', N'cake                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'P1              ', N'Promoting Post                                                                                                                  ', N'post                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'P2              ', N'System Post                                                                                                                     ', N'post                                                                                                                            ')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Type]) VALUES (N'P3', N'Sale Post', N'post')

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (0, N'Admin                                                                                                                           ')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Marketing                                                                                                                       ')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Sale                                                                                                                            ')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'User                                                                                                                            ')

INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'abc@fpt.edu.vn', N'abc123456', NULL, N'fpt University', N'Nguyen Van Abc', N'0123456789', N'Male', CAST(N'2021-06-28' AS Date), 0, 2)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'abc123@fpt.edu.vn', N'abc123456', NULL, N'Fpt University', N'A Bo Co', N'0123456789', N'Male', CAST(N'2021-07-10' AS Date), 1, 3)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'abcdef@fpt.edu.vn', N'abc123456', NULL, N'FPT University', N'a b c d e f ', N'9876543210', N'Female', CAST(N'2021-07-10' AS Date), 1, 3)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'admin@fpt.edu.vn', N'admin               ', NULL, N'fpt university', N'A Van Minh', N'0963484125', N'Male', CAST(N'2021-05-30' AS Date), 1, 0)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'market@fpt.edu.vn', N'market              ', NULL, N'fpt university                                                                                      ', N'Ma Thi Ket Tinh                                   ', N'0874125678  ', N'Female          ', CAST(N'2021-05-30' AS Date), 1, 1)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'sale@fpt.edu.vn', N'sale                ', NULL, N'fpt university                                                                                      ', N'Sa Van Le                                         ', N'0987412361  ', N'Male            ', CAST(N'2021-05-30' AS Date), 1, 2)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'user@fpt.edu.vn', N'user                ', NULL, N'fpt university', N'U Van So', N'0877741125', N'Male', CAST(N'2021-05-30' AS Date), 1, 3)
INSERT [dbo].[User] ([Email], [Password], [AvatarLink], [Address], [FullName], [PhoneNumber], [Gender], [CreationDate], [Status], [RoleId]) VALUES (N'user123@fpt.edu.vn', N'abc123456', NULL, N'FPT University', N'userrrrrrrrr', N'7894561230', N'Male', CAST(N'2021-07-10' AS Date), 1, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF 
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Egg Bread', N'C1              ', N'product_1.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Melon Cake', N'C1              ', N'product_2.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Spam Cake', N'C1              ', N'product_3.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Strawberry Birthday Cake', N'C1              ', N'product_4.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Europian-styled Wedding Cake', N'C1              ', N'product_5.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Chocolate Cake', N'C1              ', N'product_6.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Cream Cake', N'C1              ', N'product_7.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)
insert into Product (ProductName,CategoryId,ThumbnailLink,OringinalSalePrice,Details,SalePrice,Status,Stock,SaleStatus) VALUES ( N'Pork Steam Bun', N'C1              ', N'product_8.jpg', 18000, N'Vietnamese bread with Egg', 16000, 1, 17, 0)

GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
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
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
SELECT COUNT(*) FROM [Product] WHERE [Product].Status = 1 
Select p.ProductId, p.ProductName, p.CategoryId, c.CategoryName, p.OringinalSalePrice, p.SalePrice, p.Details, p.Status, p.Stock, p.SaleStatus, p.ThumbnailLink From 
Product p LEFT JOIN Category c ON p.CategoryId = c.CategoryId 
Where p.Status = 1
order by p.ProductId
offset 1 rows
fetch first 8 rows only
select count(*) from Product Where Status = 1
Select p.ProductId, p.ProductName, p.CategoryId, c.CategoryName, p.OringinalSalePrice, p.SalePrice, p.Details, p.Status, p.Stock, p.SaleStatus, p.ThumbnailLink 
From Product p LEFT JOIN Category c ON p.CategoryId = c.CategoryId 
order by p.ProductId 
offset 1 rows
fetch first 8 rows only
