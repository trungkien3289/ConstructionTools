USE [master]
GO
/****** Object:  Database [ConstructionToolsStore]    Script Date: 6/12/2017 10:45:52 PM ******/
CREATE DATABASE [ConstructionToolsStore]
GO
USE [ConstructionToolsStore]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_Categories]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_Categories](
	[Id] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_News]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CoverImageId] [int] NULL,
	[Title] [nvarchar](200) NOT NULL,
	[SubTitle] [nvarchar](200) NOT NULL,
	[ContentNews] [nvarchar](max) NOT NULL,
	[Authors] [nvarchar](200) NULL,
	[Tags] [nvarchar](200) NULL,
	[TotalView] [int] NULL,
	[DisplayHomePage] [bit] NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Brands]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ImageId] [int] NULL,
 CONSTRAINT [PK_ecom_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Categories]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](250) NOT NULL,
	[ParentId] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_OrderDetails]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceOfUnit] [money] NOT NULL,
	[TotalDiscount] [money] NULL,
	[TotalOrder] [money] NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_product_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Orders]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nchar](100) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[TotalPrice] [decimal](19, 4) NOT NULL,
	[FeeShip] [decimal](19, 4) NOT NULL,
	[TotalOrder] [decimal](19, 4) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderNote] [nvarchar](500) NULL,
	[NameOfRecipient] [nchar](200) NULL,
	[PhoneOfRecipient] [nvarchar](100) NOT NULL,
	[AddressOfRecipient] [nvarchar](500) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_product_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_ProductGroups]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_ProductGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](200) NOT NULL,
	[Description] [nchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ecom_ProductGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Products]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Price] [money] NOT NULL,
	[OldPrice] [money] NULL,
	[Quantity] [int] NULL,
	[Unit] [int] NULL,
	[BrandId] [int] NULL,
	[CoverImageId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Description2] [nvarchar](max) NULL,
	[TotalView] [int] NULL,
	[TotalBuy] [int] NULL,
	[Tags] [nvarchar](200) NULL,
	[IsNewProduct] [bit] NOT NULL,
	[IsBestSellProduct] [bit] NOT NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Specification] [nvarchar](max) NULL,
 CONSTRAINT [PK_ecom_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Products_Categories]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Products_Categories](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ecom_Products_Categories] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Products_Images]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Products_Images](
	[ProductId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_ecom_Products_Images] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Products_ProductGroups]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Products_ProductGroups](
	[ProductId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_ecom_Products_ProductGroups] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[share_Categories]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_share_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[share_Images]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](300) NOT NULL,
	[ImagePath] [nvarchar](700) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_share_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Banners]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Banners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Type] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_system_Banners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Config]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Value] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_system_tracking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Menu]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Url] [nvarchar](500) NULL,
	[SortOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Icon] [nvarchar](250) NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_system_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Profiles]    Script Date: 6/12/2017 10:45:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Emaill] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_system_profiles_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'admin', N'Administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'user', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin@xaviadecor.com', 0, N'ALTLD2XQj20rF1Dv707/hCYZsfjBC3sJeg9b44xGovSfBU7nTcjh/G4ZiYApydqCzQ==', N'26696055-fdf6-4204-a4a5-12ac33f5c991', NULL, 0, 0, NULL, 1, 0, N'admin@xaviadecor.com')
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, NULL, N'Tư vấn kết nối', NULL, NULL, 1, 1, NULL, CAST(0x0000A79000B96B8D AS DateTime), NULL, CAST(0x0000A79000B96B8D AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 1, N'Thiết bị nâng đỡ', NULL, NULL, 1, 1, NULL, CAST(0x0000A79000BA590C AS DateTime), NULL, CAST(0x0000A79000BA590C AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 1, N'Thang nhôm', NULL, NULL, 2, 1, NULL, CAST(0x0000A79000C043D1 AS DateTime), NULL, CAST(0x0000A79000C043D1 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 1, N'Máy hàn và Phụ kiện', NULL, NULL, 3, 1, NULL, CAST(0x0000A79000BA758B AS DateTime), NULL, CAST(0x0000A79000BA758B AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 1, N'Thiết bị, dụng cụ đo', NULL, NULL, 4, 1, NULL, CAST(0x0000A79000BAEC09 AS DateTime), NULL, CAST(0x0000A79000BAEC09 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, 1, N'Dụng cụ điện', NULL, NULL, 5, 1, NULL, CAST(0x0000A79000BAF9F3 AS DateTime), NULL, CAST(0x0000A79000BAF9F3 AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_News] ON 

INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, 2, 3235, N'Top 5 thang nhôm chữ a rút gọn bán chạy tháng 4/2017', N'Bạn đang muốn mua một chiếc thang nhôm? Dưới đây Ketnoitieudung.vn xin giới thiệu đến bạn top 5 thang nhôm rút chữ a để bạn tham khảo.', N'Bạn đang muốn mua một chiếc&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>? Dưới đ&acirc;y Ketnoitieudung.vn xin giới thiệu đến bạn top 5&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">thang nh&ocirc;m r&uacute;t</a>&nbsp;chữ a để bạn tham khảo:<br />
<br />
<br />
<strong>1.&nbsp;Thang nh&ocirc;m r&uacute;t đ&ocirc;i Nikawa NK-56AI</strong><br />
<br />
<a href="http://ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t</a>&nbsp;đ&ocirc;i Nikawa NK-56AI l&agrave; d&ograve;ng thang mới đ&aacute;p ứng chiều cao tối đa cao hơn những d&ograve;ng thang trước đ&acirc;y, sản phẩm được chế tạo tr&ecirc;n d&acirc;y chuyền hiện đại Nhật Bản.&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom/c31/nikawa.html?brand=nikawa">Thang nh&ocirc;m Nikawa</a>&nbsp;NK-56AI đ&aacute;p ứng được nhu cầu của bạn cả về mẫu m&atilde;, chức năng, chất lượng sản phẩm m&agrave; gi&aacute; cả lại tốt hơn với gi&aacute; thị trường.<br />
<img alt="" src="/Content/Uploads/images/thang-nhom-rut-doi-nikawa-nk-56ai.jpg" style="height:400px; width:400px" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-doi-nikawa-nk-56ai_25339.html">Thang nh&ocirc;m r&uacute;t&nbsp;Nikawa NK-56AI&nbsp;</a><br />
<br />
&nbsp;<br />
<strong>Đặc trưng:</strong><br />
&nbsp;<br />
Chắc chắn. an toàn:<br />
-&nbsp;<a href="http://ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t</a>&nbsp;Nikawa NK-56AI&nbsp;được l&agrave;m từ hợp kim nh&ocirc;m được mạ lớp chống gỉ s&aacute;ng b&oacute;ng, kh&ocirc;ng chỉ mang lại độ chắc chắn v&agrave; độ bền cao m&agrave; c&ograve;n đảm t&iacute;nh thẩm mỹ. Với diện mạo mới chốt v&agrave; đai thang c&oacute; m&agrave;u xanh dương rất đẹp v&agrave; bắt mắt.&nbsp;<br />
- Tải trọng 150 kg ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;U EN131.<br />
- Đặc biệt, ch&acirc;n&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut/c174/nikawa.html">Thang nh&ocirc;m r&uacute;t Nikawa&nbsp;</a>được trang bị đế cao su chống trượt mang đến sự an to&agrave;n tuyệt đối khi sử dụng. Bề mặt&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>&nbsp;được bảo vệ bởi lớp chống gỉ lu&ocirc;n s&aacute;ng trắng b&oacute;ng.&nbsp;<br />
&nbsp;<br />
Thiết kế th&ocirc;ng minh<br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t gọn</a>&nbsp;Nikawa NK-56AI&nbsp;c&oacute; thể sử dụng chữ A v&agrave; I gi&uacute;p bạn linh hoạt l&agrave;m việc ở nhiều chiều cao v&agrave; địa h&igrave;nh kh&aacute;c nhau.<br />
- Sản phẩm c&oacute; thể r&uacute;t gọn lại sản phẩm sau khi sử dụng, gi&uacute;p tiết kiệm tối đa diện t&iacute;ch cất giữ.<br />
- Sản phẩm kh&ocirc;ng tốn diện t&iacute;ch nh&agrave;, dễ d&agrave;ng đặt trong xe &ocirc; t&ocirc; hoặc vận chuyển bằng xe m&aacute;y.<br />
&nbsp;<br />
&nbsp;<br />
<strong>2.&nbsp;Thang nh&ocirc;m r&uacute;t chữ A Nikita AI56 (5.6m)</strong><br />
<br />
&nbsp;Được sản xu&acirc;́t theo c&ocirc;ng ngh&ecirc;̣ ti&ecirc;n ti&ecirc;́n của Nhật Bản.&nbsp;<a href="http://ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-chu-a_175.html">Thang nh&ocirc;m chữ A</a>&nbsp;Nikita AI56 được đảm bảo ch&acirc;́t lượng với đ&ocirc;̣ b&ecirc;̀n cao, chắc chắn, an toàn cho người sử dụng. Mà giá cả lại phù hợp với túi ti&ecirc;̀n người sử dụng.<br />
&nbsp;<br />
<img src="http://www.thegioithangnhom.com/data/bt2/thang-nhom-rut-chu-a-ai56-56m.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikita-ai56-56m_9404.html">Thang nh&ocirc;m r&uacute;t chữ A Nikita AI56 (5.6m)</a>
<p><strong>Đặc trưng:</strong></p>

<p>-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;AI56&nbsp;thi&ecirc;́t k&ecirc;́ từ nh&ocirc;m chắc chắn, kh&ocirc;ng gỉ sét, b&ecirc;̀ ngoài sáng bóng.<br />
- Thang nhỏ nhẹ, gọn. Có th&ecirc;̉ sử dụng ở ngoài trời, và có th&ecirc;̉ được g&acirc;́p lại đặt b&acirc;́t cứ nơi nào trong phòng hoặc xe chở.<br />
- Thang có kích thước nhỏ, ti&ecirc;́t ki&ecirc;̣m di&ecirc;̣n tích và thời gian làm vi&ecirc;̣c.<br />
- V&acirc;̣n hành đơn giản, linh hoạt.<br />
-&nbsp;Thang nh&ocirc;m rút Nikita AI56&nbsp;có th&ecirc;m khóa tự đ&ocirc;̣ng làm cho thang có th&ecirc;m chức năng rút, du&ocirc;̃i thẳng chữ I, hoặc x&ecirc;́p thành chữ A.</p>
<br />
<br />
<strong>3.&nbsp;Thang nh&ocirc;m r&uacute;t chữ A NIKAWA NK-50AI</strong><br />
&nbsp;
<p><a href="http://ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-chu-a_175.html">Thang nh&ocirc;m chữ A</a>&nbsp;Nikawa NK-50AI&nbsp;l&agrave; sản phẩm&nbsp;thang nh&ocirc;m&nbsp;được sản xuất tr&ecirc;n d&acirc;y chuyền hiện đại đạt ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u.&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-50ai_4521.html">T</a><a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-50ai_4521.html">hang nh&ocirc;m r&uacute;t Nikawa NK-50AI</a>&nbsp;gi&uacute;p ch&uacute;ng ta thực hiện c&aacute;c c&ocirc;ng việc một c&aacute;ch nhanh nhất v&agrave; hiệu quả cho c&ocirc;ng việc.&nbsp;Thang nh&ocirc;m r&uacute;t&nbsp;Nikawa l&agrave; sự lựa chọn ho&agrave;n hảo cho bạn!</p>
<img src="http://www.ketnoitieudung.vn/data/ck/images/thang-nhom-rut-doi-nikawa-nk-50ai.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-50ai_4521.html">Thang nh&ocirc;m r&uacute;t gọn&nbsp;chữ A Nikawa NK-50AI&nbsp;</a><br />
Đặc trưng:<br />
<br />
Thang thiết kế th&ocirc;ng minh:<br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-50ai_4521.html">Thang Nikawa NK-50AI&nbsp;</a>c&oacute; thể chuyển đổi dễ d&agrave;ng th&agrave;nh thang chữ A, thang chữ I hoặc r&uacute;t gọn lại khi kh&ocirc;ng sử dụng.&nbsp;<br />
- Thang nhẹ, gọn g&agrave;ng gi&uacute;p tiết kiệm được kh&ocirc;ng gian cất giữ.<br />
- Dễ d&agrave;ng di chuyển, c&oacute; thể vận chuyển bằng xe m&aacute;y hoặc để trong &ocirc; t&ocirc;.<br />
<br />
Thang chắc chắn v&agrave; an to&agrave;n:<br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-50ai_4521.html">Nikawa NK-50AI&nbsp;</a>sản xuất theo c&ocirc;ng nghệ hiện đại của Nhật Bản n&ecirc;n chất liệu nh&ocirc;m hợp kim c&oacute; độ bền cao v&agrave; chắc chắn.<br />
- Ch&acirc;n đế gắn đế cao su gi&uacute;p chống trơn trượt v&agrave; mang lại độ an to&agrave;n tuyệt đối cho người sử dụng.<br />
- Với tải trọng cao 150kg theo ti&ecirc;u chuẩn an to&agrave;n của Ch&acirc;u &Acirc;u gi&uacute;p người leo thoải m&aacute;i hơn<br />
<br />
<strong>4.&nbsp;Thang nh&ocirc;m đ&ocirc;i Advindeq ADT709B (5.6m)</strong><br />
<br />
<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;đ&ocirc;i Advindeq ADT709B (5.6m) l&agrave; d&ograve;ng thang nh&ocirc;m với thiết kế c&ocirc;ng nghệ mới từ Advindeq chất lượng cao, thang nh&ocirc;m với chiều cao nhất từ&nbsp;thang nh&ocirc;m r&uacute;t&nbsp;đ&ocirc;i 5.6m đảm bảo thi c&ocirc;ng ở những điểm c&oacute; chiều cao đặc th&ugrave;,&nbsp;đảm bảo ti&ecirc;u chuẩn về độ an to&agrave;n lẫn hiệu quả sử dụng. Kh&aacute;c với những chiếc thang theo kiểu truyền thống hiện c&oacute; tr&ecirc;n thị trường. Advindeq ADT709B đ&aacute;p ứng được nhu cầu của bạn cả về mẫu m&atilde;, chức năng, chất lượng sản phẩm m&agrave; gi&aacute; cả lại tốt hơn với gi&aacute; thị trường.<br />
&nbsp;<br />
<em><img src="http://www.ketnoitieudung.vn/data/ck/images/Advindeq-ADT709B.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-doi-advindeq-adt709b-56m_27504.html">Thang nh&ocirc;m r&uacute;t Advindeq ADT709B (5.6m)&nbsp;</a></em><br />
Đặc trưng:<br />
&nbsp;<br />
Chắc chắn. an toàn:<br />
- Thang nh&ocirc;m r&uacute;t Advindeq ADT709B (5.6m) được l&agrave;m từ hợp kim nh&ocirc;m được mạ lớp chống gỉ s&aacute;ng b&oacute;ng, kh&ocirc;ng chỉ mang lại độ chắc chắn v&agrave; độ bền cao m&agrave; c&ograve;n đảm t&iacute;nh thẩm mỹ. Với diện mạo mới chốt v&agrave; đai thang c&oacute; m&agrave;u xanh dương rất đẹp v&agrave; bắt mắt.&nbsp;<br />
- Tải trọng 150 kg ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;U EN131.<br />
- Đặc biệt, ch&acirc;n Thang nh&ocirc;m r&uacute;t Nikawa được trang bị đế cao su chống trượt mang đến sự an to&agrave;n tuyệt đối khi sử dụng. Bề mặt thang nh&ocirc;m được bảo vệ bởi lớp chống gỉ lu&ocirc;n s&aacute;ng trắng b&oacute;ng.&nbsp;<br />
&nbsp;<br />
Thiết kế th&ocirc;ng minh<br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t gọn</a>&nbsp;Advindeq ADT709B (5.6m) c&oacute; thể sử dụng chữ A v&agrave; I gi&uacute;p bạn linh hoạt l&agrave;m việc ở nhiều chiều cao v&agrave; địa h&igrave;nh kh&aacute;c nhau.<br />
- Sản phẩm c&oacute; thể r&uacute;t gọn lại sản phẩm sau khi sử dụng, gi&uacute;p tiết kiệm tối đa diện t&iacute;ch cất giữ.<br />
- Sản phẩm kh&ocirc;ng tốn diện t&iacute;ch nh&agrave;, dễ d&agrave;ng đặt trong xe &ocirc; t&ocirc; hoặc vận chuyển bằng xe m&aacute;y.<br />
<br />
<strong>5.&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t gọn</a>&nbsp;chữ A Advindeq ADT706B</strong><br />
<br />
<br />
<a href="http://ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-chu-a_175.html">Thang nh&ocirc;m chữ A</a>&nbsp;Advindeq ADT706B&nbsp;l&agrave; sản phẩm cao cấp của thương hiệu Advindeq Đ&agrave;i Loan,&nbsp;được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại.&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;Advindeq&nbsp;được nhiều người tin d&ugrave;ng với chất lượng đảm bảo, t&iacute;nh tiện lợi, linh hoạt v&agrave; gi&aacute; cả hợp l&yacute;.&nbsp;Thang Advindeq ADT706B&nbsp;sản xuất theo ti&ecirc;u chuẩn của Ch&acirc;u &Acirc;u EN131, EN14183, CE.<br />
<img src="http://www.thegioithangnhom.com/data/bt6/thang-nhom-rut-gon-chu-a-advindeq-adt707b.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-gon-chu-a-advindeq-adt706b_7705.html">&nbsp;Thang nh&ocirc;m r&uacute;t chữ A Advindeq ADT706B</a><br />
<br />
&nbsp;<br />
&nbsp;<br />
<strong>ĐẶC ĐIỂM NỔI BẬT</strong><br />
&nbsp;<br />
<strong>Thiết kế linh hoạt, tiện lợi:</strong><br />
-&nbsp;Thang nh&ocirc;m r&uacute;t chữ A Advindeq ADT706B&nbsp;l&agrave; d&ograve;ng thang linh hoạt dễ d&agrave;ng sử dụng. Thang r&uacute;t c&oacute; th&ecirc;m kho&aacute; gấp tự động l&agrave;m cho thang c&oacute; th&ecirc;m chức năng r&uacute;t, duỗi thẳng hoặc thang xếp th&agrave;nh chữ A.<br />
- Thang l&agrave;m bằng nh&ocirc;m, gọn nhẹ, dễ di chuyển v&agrave; cất giữ, kh&ocirc;ng mất nhiều diện t&iacute;ch. C&oacute; thể để trong &ocirc; t&ocirc; hoặc chở bằng xe m&aacute;y.<br />
&nbsp;<br />
An to&agrave;n, chắc chắn:<br />
- Chất liệu nh&ocirc;m bền đẹp, kh&ocirc;ng gỉ s&eacute;t, lu&ocirc;n s&aacute;ng b&oacute;ng. Ch&acirc;n thang vững chắc, chịu lực tốt, đứng được tr&ecirc;n nhiều địa h&igrave;nh.<br />
- Ch&acirc;n thang được bao bởi miếng cao su chống trơn trượt, bảo vệ s&agrave;n nh&agrave; chống trầy xước.<br />
- Thang được v&iacute;t chắc chắn, chịu được trọng lượng lớn với 150kg.<br />
- Thiết kế theo ti&ecirc;u chuẩn an to&agrave;n của Ch&acirc;u &Acirc;u.<br />
&nbsp;<br />
Kết nối ti&ecirc;u d&ugrave;ng l&agrave; nh&agrave; ph&acirc;n phối c&aacute;c loại&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>, thiết bị, m&aacute;y m&oacute;c c&ocirc;ng nghiệp, dụng cụ điện, dụng cụ cầm tay ch&iacute;nh h&atilde;ng chất lượng tốt nhất với gi&aacute; rẻ c&ugrave;ng c&aacute;c ch&iacute;nh s&aacute;ch ưu đ&atilde;i &ndash; giao h&agrave;ng nhanh 1-2h l&agrave;m việc &ndash; bảo h&agrave;nh đảm bảo, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ c&ugrave;ng ch&uacute;ng t&ocirc;i để được tư vấn chuy&ecirc;n s&acirc;u về c&aacute;c sản&nbsp;M&aacute;y phun hơi n&oacute;ng&nbsp;<a href="http://www.ketnoitieudung.vn/may-phun-hoi-nong-bosch-ghg-600-3-1800w_105.html">1800W Bosch GHG 600-3</a>&nbsp;cũng như chọn cho m&igrave;nh 1 sản phẩm ph&ugrave; hợp nhất với c&ocirc;ng việc.', NULL, NULL, NULL, 0, NULL, 1, NULL, CAST(0x0000A790011540BB AS DateTime), NULL, CAST(0x0000A790016F6845 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, 2, 3236, N'3 Mẹo mua thang nhôm chất lượng giá rẻ', N'Tâm lý chung của người tiêu dùng Việt Nam là những sản phảm giá rẻ sẽ không chất lượng hoặc chất lượng kém.', N'T&acirc;m l&yacute; chung của người ti&ecirc;u d&ugrave;ng Việt Nam l&agrave; những sản phảm gi&aacute; rẻ sẽ kh&ocirc;ng chất lượng hoặc chất lượng k&eacute;m. Tuy nhi&ecirc;n họ lại ngại mua những sản phẩm gi&aacute; cao v&igrave; cho rằng n&oacute; qu&aacute; mắc v&agrave; đ&ocirc;i khi chất lượng cũng kh&ocirc;ng được như mong đợi. Đối với những sản phẩm&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>&nbsp;cũng vậy. &nbsp;Tuy nhi&ecirc;n bạn vẫn c&oacute; thể mua được những chiếc thang nh&ocirc;m như:&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">thang nh&ocirc;m r&uacute;t</a>,&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-chu-a_175.html">thang nh&ocirc;m chữ a</a>, thang ghế,... với mức gi&aacute; cực rẻ m&agrave; chất lượng kh&ocirc;ng cần b&agrave;n c&atilde;i với 3 mẹo dưới đ&acirc;y:<br />
<br />
<strong>&nbsp;<br />
1. Chọn thang nh&ocirc;m theo thương hiệu</strong><br />
<br />
C&oacute; những thương hiệu thang nh&ocirc;m nổi tiếng như Nikawa, Poongsan,&nbsp;Advindeq,... l&agrave; những thương hiệu thang nh&ocirc;m cao cấp với những d&ograve;ng thang nh&ocirc;m:&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">thang nh&ocirc;m r&uacute;t</a>, thang chữ A, thang ghế, thang trượt,...lu&ocirc;n được người ti&ecirc;u d&ugrave;ng săn đ&oacute;n v&igrave; những sản phẩm thang nh&ocirc;m kh&ocirc;ng chỉ đ&aacute;p ứng được nhu cầu về chất lượng m&agrave; c&ograve;n về mẫu m&atilde;. Mặc d&ugrave; l&agrave; thương hiệu thang nh&ocirc;m cao cấp thật nhưng c&oacute; những thương hiệu như Nikawa, Poongsan,... vẫn c&oacute; những sản phẩm thang nh&ocirc;m với những mức gi&aacute; kh&aacute;c nhau từ thấp đến cao để bạn lựa chọn.&nbsp;<br />
<br />
<em>Sản phẩm tham khảo:&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-44ai_4522.html">Thang nh&ocirc;m r&uacute;t chữ A NIKAWA NK-44AI</a></em><br />
&nbsp;<br />
<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t&nbsp;</a>chữ A Nikawa NK-44AI&nbsp;l&agrave; sản phẩm được chế tạo tr&ecirc;n d&acirc;y chuyền hiện đại Nhật Bản. Với chất liệu cao cấp, đảm bảo ti&ecirc;u chuẩn về độ an to&agrave;n lẫn hiệu quả sử dụng.<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-44ai_4522.html">&nbsp;Thang Nikawa&nbsp;NK-44AI</a>&nbsp;đ&aacute;p ứng được nhu cầu của bạn cả về mẫu m&atilde;, chức năng, chất lượng sản phẩm m&agrave; gi&aacute; cả lại tốt hơn với gi&aacute; thị trường.&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom/c31/nikawa.html">Thang nh&ocirc;m Nikiwa</a>&nbsp;sẽ l&agrave; lựa chọn tốt nhất cho bạn<br />
&nbsp;<br />
&nbsp;<br />
<img alt="thang nikawa nk-44ai" src="http://www.ketnoitieudung.vn/data/bt10/thang-nhom-rut-chu-a-nikawa-nk-44ai.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-44ai_4522.html">Thang nh&ocirc;m r&uacute;t chữ A NIKAWA NK-44AI</a><br />
<br />
&nbsp;<br />
<strong>Đặc trưng:</strong><br />
&nbsp;<br />
<strong>Cao cấp, chắc chắn. an toàn:</strong><br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;r&uacute;t chữ A Nikawa NK-44AI&nbsp;được l&agrave;m từ hợp kim nh&ocirc;m được mạ lớp chống gỉ s&aacute;ng b&oacute;ng, kh&ocirc;ng chỉ mang lại độ chắc chắn v&agrave; độ bền cao m&agrave; c&ograve;n đảm t&iacute;nh thẩm mỹ.&nbsp;<br />
- Tải trọng 150 kg ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;U EN131.<br />
- Đặc biệt, ch&acirc;n&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-44ai_4522.html">Thang Nikawa&nbsp;NK-44AI&nbsp;</a>được trang bị đế cao su chống trượt mang đến sự an to&agrave;n tuyệt đối khi sử dụng, hạn chế trầy xước bề mặt s&agrave;n nh&agrave;.&nbsp;<br />
- Ngo&agrave;i ra, Sản phẩm c&ograve;n hạn chế c&aacute;c chất độc hại c&oacute; thể g&acirc;y hại cho sức khoẻ, g&oacute;p phần bảo vệ người ti&ecirc;u d&ugrave;ng cũng như cho m&ocirc;i trường.<br />
&nbsp;<br />
<strong>Thiết kế th&ocirc;ng minh</strong><br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t</a>&nbsp;chữ A Nikawa NK-44AI&nbsp;dễ d&agrave;ng chuyển đổi cấu h&igrave;nh thang chữ A, thang chữ I cũng như thu gọn hoặc k&eacute;o d&agrave;i ph&ugrave; hợp với nhiều c&ocirc;ng tr&igrave;nh v&agrave; mục đ&iacute;ch sử dụng kh&aacute;c nhau.<br />
- Thiết kế th&ocirc;ng minh v&agrave; t&iacute;nh chất linh hoạt gi&uacute;p ch&uacute;ng ta cắt giữ thuận tiện, &iacute;t tốn diện t&iacute;ch.<br />
<br />
Ngo&agrave;i ra c&ograve;n c&oacute; nhiều thương hiệu thang nh&ocirc;m gi&aacute; rẻ kh&aacute;c như PAL,&nbsp;HASEGAWA,... c&oacute;&nbsp;sản phẩm chất lượng tốt m&agrave;&nbsp;mức gi&aacute; tương đối rẻ.<br />
<br />
<br />
<strong>2. Chọn thời điểm mua thang nh&ocirc;m&nbsp;</strong><br />
<br />
Với những sản phẩm khuyến m&atilde;i theo m&ugrave;a như tủ lạnh hay c&aacute;c sản phẩm tương tự th&igrave; thường v&agrave;o c&aacute;c m&ugrave;a lạnh như m&agrave;u thu, m&agrave;u đ&ocirc;ng thường sẽ ế ẩm hơn n&ecirc;n bạn mua tủ lạnh v&agrave;o thời gian n&agrave;y l&agrave; gi&aacute; rẻ nhất.<br />
<br />
Đối với thang nh&ocirc;m th&igrave; đ&acirc;y l&agrave; sản phẩm nằm ngo&agrave;i sự ảnh hưởng của m&ugrave;a v&igrave; thang nh&ocirc;m được sử dụng rất thường xuy&ecirc;n v&agrave; hầu như m&agrave;u n&agrave;o cũng sử dụng. Ch&iacute;nh v&igrave; vậy bạn kh&ocirc;ng thể chạy theo những khuyến m&atilde;i lớn theo m&ugrave;a như những sản phẩm kh&aacute;c.<br />
<br />
<br />
Tuy nhi&ecirc;n cũng kh&ocirc;ng phải l&agrave; kh&ocirc;ng c&oacute; c&aacute;ch. Bạn vẫn sẽ c&oacute; cơ hội mua được những chiếc thang nh&ocirc;m chất lượng gi&aacute; rẻ v&agrave;o những đợt khuyến m&atilde;i lớn v&agrave;o cuối năm, gi&aacute;p Tết, đầu năm hay c&aacute;c dịp đặc biệt kh&aacute;c.&nbsp;<br />
&nbsp;<br />
<img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/%5ED921F3BEF6C90C3CAD277FD0D65D90FDCBB32D607861244E37%5Epimgpsh_fullsize_distr.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/nam-moi-loc-toi_1965.html">Khuyến m&atilde;i khủng đầu năm tại Kết Nối Ti&ecirc;u D&ugrave;ng</a><br />
<br />
<br />
<strong>3. Lựa chọn những cửa h&agrave;ng, đại l&yacute; b&aacute;n thang nh&ocirc;m rẻ hơn</strong><br />
&nbsp;<br />
Điều n&agrave;y rất quan trọng, việc xem x&eacute;t mức gi&aacute; ở những cửa h&agrave;ng kh&aacute;c nhau, bạn sẽ t&igrave;m được nơi b&aacute;n thang nh&ocirc;m rẻ nhất, để chọn mua, vừa mua được h&agrave;ng như &yacute;, vừa tiết kiệm tiền cho m&igrave;nh.<br />
&nbsp;<br />
Tuy nhi&ecirc;n bạn phải chắc rằng nơi m&igrave;nh mua l&agrave; uy t&iacute;n để kh&ocirc;ng bị lừa khi mua thang nh&ocirc;m gi&aacute; rẻ. C&ocirc;ng việc t&igrave;m kiếm những th&ocirc;ng tin về c&aacute;c cửa h&agrave;ng b&aacute;n thang nh&ocirc;m gi&aacute; rẻ c&oacute; rất nhiều tren Internet. V&igrave; vậy bạn chỉ cần ngồi v&agrave; nghi&ecirc;n cứu về c&aacute;c cửa h&agrave;ng đ&oacute; để lựa chọn ra cửa h&agrave;ng được cho l&agrave; th&iacute;ch hợp nhất.<br />
<br />
<br />
<br />
<a href="http://www.ketnoitieudung.vn/">Kết nối ti&ecirc;u d&ugrave;ng</a>&nbsp;l&agrave;&nbsp;nh&agrave; ph&acirc;n phối&nbsp;c&aacute;c loại&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html" target="_blank">thang nh&ocirc;m</a>,&nbsp;thiết bị,&nbsp;<a href="http://www.ketnoitieudung.vn/" target="_blank">m&aacute;y m&oacute;c c&ocirc;ng nghiệp</a>,&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/dung-cu-dien_1597.html" target="_blank">dụng cụ điện</a>,&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/dung-cu-cam-tay_1598.html" target="_blank">dụng cụ cầm tay</a>&nbsp;ch&iacute;nh h&atilde;ng chất lượng tốt nhất với gi&aacute; rẻ c&ugrave;ng c&aacute;c ch&iacute;nh s&aacute;ch ưu đ&atilde;i &ndash; giao h&agrave;ng nhanh 1-2h l&agrave;m việc &ndash; bảo h&agrave;nh đảm bảo, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ c&ugrave;ng ch&uacute;ng t&ocirc;i để được&nbsp;tư vấn chuy&ecirc;n s&acirc;u&nbsp;về c&aacute;c sản phẩm&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>&nbsp;cũng như chọn cho m&igrave;nh 1 sản phẩm ph&ugrave; hợp nhất với c&ocirc;ng việc.', NULL, NULL, NULL, 0, NULL, 1, NULL, CAST(0x0000A790017371BB AS DateTime), NULL, CAST(0x0000A790017371BB AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, 2, 3237, N'Lựa chọn thang nhôm rút cho công việc sửa mái nhà', N'Với những công việc trên cao như sửa mái nhà thì 1 chiếc thang nhôm là vật dụng cần thiết cho bạn đấy.', N'Với những c&ocirc;ng việc tr&ecirc;n cao như sửa m&aacute;i nh&agrave; th&igrave; 1 chiếc&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>&nbsp;l&agrave; vật dụng cần thiết cho bạn đấy. Tuy nhi&ecirc;n, kh&ocirc;ng phải loại thang nh&ocirc;m n&agrave;o cũng đưa v&agrave;o sử dụng được. Loại thang nh&ocirc;m được d&ugrave;ng phổ biến cho c&ocirc;ng việc tu sửa m&aacute;i nh&agrave; thường l&agrave;&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">thang nh&ocirc;m r&uacute;t gọn</a>, thang chữ A, thang chữ I, thang trượt. Hiện nay đ&atilde; c&oacute; những loại thang nh&ocirc;m đa năng, vừa biến đổi th&agrave;nh thang chữ cũng c&oacute; thể biến đổi th&agrave;nh thang chữ I hay chữ L dễ d&agrave;ng. V&igrave; vậy bạn sẽ kh&ocirc;ng c&ograve;n bất tiện trong việc lựa chọn loại thang nh&ocirc;m nữa nh&eacute;! Dưới đ&acirc;y l&agrave; một số mẫu thang nh&ocirc;m để bạn tham khảo:<br />
<br />
<strong>1.&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t</a>&nbsp;chữ A NIKAWA NK-44AI</strong><br />
<br />
&nbsp;<br />
Thang nh&ocirc;m r&uacute;t chữ A Nikawa NK-44AI&nbsp;dễ d&agrave;ng chuyển đổi cấu h&igrave;nh thang chữ A, thang chữ I cũng như thu gọn hoặc k&eacute;o d&agrave;i ph&ugrave; hợp với nhiều c&ocirc;ng tr&igrave;nh v&agrave; mục đ&iacute;ch sử dụng kh&aacute;c nhau.&nbsp;Thiết kế th&ocirc;ng minh v&agrave; t&iacute;nh chất linh hoạt gi&uacute;p ch&uacute;ng ta cắt giữ thuận tiện, &iacute;t tốn diện t&iacute;ch.<br />
<a href="http://www.thegioithangnhom.com/data/bt4/thang-nhom-rut-gon-kn-r32-1.jpg"><img alt="" src="http://www.thegioithangnhom.com/data/bt10/thang-nhom-rut-chu-a-nikawa-nk-44ai.jpg" /></a><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-44ai_4522.html">Thang nh&ocirc;m r&uacute;t chữ A Nikawa NK-44AI</a><br />
&nbsp;<br />
<strong>Đặc trưng:</strong><br />
&nbsp;<br />
<strong>Cao cấp, chắc chắn. an toàn:</strong><br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;r&uacute;t chữ A Nikawa NK-44AI&nbsp;được l&agrave;m từ hợp kim nh&ocirc;m được mạ lớp chống gỉ s&aacute;ng b&oacute;ng, kh&ocirc;ng chỉ mang lại độ chắc chắn v&agrave; độ bền cao m&agrave; c&ograve;n đảm t&iacute;nh thẩm mỹ.&nbsp;<br />
- Tải trọng 150 kg ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;U EN131.<br />
- Đặc biệt, ch&acirc;n&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikawa-nk-44ai_4522.html">Thang Nikawa&nbsp;NK-44AI&nbsp;</a>được trang bị đế cao su chống trượt mang đến sự an to&agrave;n tuyệt đối khi sử dụng, hạn chế trầy xước bề mặt s&agrave;n nh&agrave;.&nbsp;<br />
- Ngo&agrave;i ra, Sản phẩm c&ograve;n hạn chế c&aacute;c chất độc hại c&oacute; thể g&acirc;y hại cho sức khoẻ, g&oacute;p phần bảo vệ người ti&ecirc;u d&ugrave;ng cũng như cho m&ocirc;i trường.<br />
&nbsp;<br />
<strong>Thiết kế th&ocirc;ng minh</strong><br />
-&nbsp;Thang nh&ocirc;m r&uacute;t chữ A Nikawa NK-44AI&nbsp;dễ d&agrave;ng chuyển đổi cấu h&igrave;nh thang chữ A, thang chữ I cũng như thu gọn hoặc k&eacute;o d&agrave;i ph&ugrave; hợp với nhiều c&ocirc;ng tr&igrave;nh v&agrave; mục đ&iacute;ch sử dụng kh&aacute;c nhau.<br />
- Thiết kế th&ocirc;ng minh v&agrave; t&iacute;nh chất linh hoạt gi&uacute;p ch&uacute;ng ta cắt giữ thuận tiện, &iacute;t tốn diện t&iacute;ch.<br />
<img alt="thang nhôm rút" src="http://www.ketnoitieudung.vn/data/ck/images/NK-56AI(1).jpg" /><img alt="thang nhôm rút" src="http://www.ketnoitieudung.vn/data/ck/images/NK-56AI(2).jpg" /><br />
&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom/c31/nikawa.html">Thang Nikawa</a>&nbsp;dễ d&agrave;ng chuyển đổi cấu h&igrave;nh&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-chu-a_175.html">thang chữ A</a>, thang chữ I<br />
<br />
<br />
<strong>2.&nbsp;Thang nh&ocirc;m r&uacute;t NIKAWA NK-38</strong><br />
&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t&nbsp;</a>NIKAWA NK-38 c&oacute;&nbsp;chất liệu cao cấp, đảm bảo ti&ecirc;u chuẩn về độ an to&agrave;n lẫn hiệu quả sử dụng gi&uacute;p bạn an t&acirc;m khi sử dụng.<br />
&nbsp;<br />
<img alt="thang nhôm rút" src="http://www.ketnoitieudung.vn/data/ck/images/thang-nhom-rut-gon-nikawa-nk48.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-nikawa-nk-38_4532.html">Thang nh&ocirc;m r&uacute;t NIKAWA NK-38</a><br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
&nbsp;<br />
<strong>Đặc trưng:</strong><br />
&nbsp;<br />
<strong>Chắc chắn. an toàn:</strong><br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t</a>&nbsp;Nikawa NK-38&nbsp;được l&agrave;m từ hợp kim nh&ocirc;m được mạ lớp chống gỉ s&aacute;ng b&oacute;ng, kh&ocirc;ng chỉ mang lại độ chắc chắn v&agrave; độ bền cao m&agrave; c&ograve;n đảm t&iacute;nh thẩm mỹ.<br />
- Tải trọng 150 kg ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;U EN131.<br />
- Đặc biệt, ch&acirc;n&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-nikawa-nk-38_4532.html">Thang nh&ocirc;m Nikawa</a>&nbsp;được trang bị đế cao su chống trượt mang đến sự an to&agrave;n tuyệt đối khi sử dụng. Bề mặt&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>&nbsp;được bảo vệ bởi lớp chống gỉ lu&ocirc;n s&aacute;ng trắng b&oacute;ng.&nbsp;<br />
&nbsp;<br />
<strong>Thiết kế th&ocirc;ng minh</strong><br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t gọn</a>&nbsp;Nikawa NK-38&nbsp;c&oacute; thiết kế 13 bậc thang, đồng thời bạn cũng c&oacute; thể r&uacute;t gọn lại sản phẩm sau khi sử dụng, gi&uacute;p tiết kiệm tối đa diện t&iacute;ch cất giữ.<br />
- Sản phẩm kh&ocirc;ng tốn diện t&iacute;ch nh&agrave;, dễ d&agrave;ng đặt trong xe &ocirc; t&ocirc; hoặc vận chuyển bằng xe m&aacute;y.<br />
<br />
<strong>3.&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-gap_177.html">Thang nh&ocirc;m gấp</a>&nbsp;Nikawa NKY-5C</strong><br />
<br />
Thang nh&ocirc;m gấp Nikawa NKY-5C được thiết kế gi&uacute;p bạn vận h&agrave;nh đơn giản v&agrave; dễ d&agrave;ng di chuyển hay cất giữ.<br />
<br />
&nbsp;<br />
<img alt="thang nikawa" src="http://www.ketnoitieudung.vn/data/bt6/thang-nhom-gap-nikawa-nky-5c.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-nhom-gap-nikawa-nky-5c_22957.html">Thang nh&ocirc;m gấp Nikawa NKY-5C&nbsp;</a><br />
<strong>Đặc trưng</strong>:<br />
&nbsp;<br />
-&nbsp;Thang nh&ocirc;m gấp Nikawa NKY-5C&nbsp;được làm bằng chất liệu nh&ocirc;m bền nhẹ, chắc chắn, kh&ocirc;ng gỉ s&eacute;t.&nbsp;<br />
-&nbsp;Ch&acirc;n thang nh&ocirc;m gấp Nikawa&nbsp;cũng được bọc một lớp nhựa chống trơn trượt v&agrave; c&aacute;ch điện. Rất an to&agrave;n v&agrave; chắc chắn khi sử&nbsp;dụng.<br />
-&nbsp;Với&nbsp;chốt kh&oacute;a an to&agrave;n chắc chắn tạo cho người sử dụng sự an t&acirc;m tuyệt đối.&nbsp;<br />
- Tải trọng 110 kg ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;U EN131.&nbsp;<br />
- Ngo&agrave;i ra, Sản phẩm c&ograve;n hạn chế c&aacute;c chất độc hại c&oacute; thể g&acirc;y hại cho sức khoẻ, g&oacute;p phần bảo vệ người ti&ecirc;u d&ugrave;ng cũng như cho m&ocirc;i trường.<br />
-&nbsp;Thang c&oacute; thể xếp gọn, tiết kiệm diện t&iacute;ch v&agrave; thời gian l&agrave;m việc, vận h&agrave;nh đơn giản,&nbsp;linh hoạt.<br />
<br />
&nbsp;<br />
<strong>4.&nbsp;Thang c&aacute;ch điện hai đoạn Nikawa NKL-60</strong><br />
<br />
Thang c&aacute;ch điện hai đoạn Nikawa NKL-60&nbsp;là dòng sản ph&acirc;̉m cao c&acirc;́p của hãng Nikawa được sản xuất theo c&ocirc;ng nghệ Nhật&nbsp;Bản, c&aacute;ch điện, đạt ti&ecirc;u chuẩn an to&agrave;n ch&acirc;u &acirc;u EN131.<br />
&nbsp;<br />
<img alt="thang nikawa" src="http://www.ketnoitieudung.vn/data/ck/images/nkl-90-2.jpg" /><br />
<a href="http://www.ketnoitieudung.vn/thang-cach-dien-hai-doan-nikawa-nkl-60_22947.html">Thang c&aacute;ch điện hai đoạn Nikawa NKL-60</a>
<p><strong>Đặc trưng:</strong></p>

<p>&ndash;&nbsp;Thang NKL-60&nbsp;được làm bằng chất liệu nh&ocirc;m bền nhẹ, sợi thủy tinh c&aacute;ch điện an to&agrave;n tuyệt đối&nbsp;khi sử dụng để sửa chữa điện, b&ecirc;n ngo&agrave;i phủ lớp sơn chống gỉ s&eacute;t, bền đẹp với thời gian.</p>

<p>&nbsp;</p>

<p>&ndash;&nbsp;Thang c&aacute;ch điện Nikawa NKL-60&nbsp;gồm 2 đoạn, xếp lồng v&agrave;o nhau, c&aacute;ch điện. Chiều cao tối đa l&agrave; 6m, chiều cao xếp gọn 3.6m, tiết kiệm diện t&iacute;ch v&agrave; thời gian l&agrave;m&nbsp;việc, vận h&agrave;nh đơn giản, linh hoạt.</p>

<p>&nbsp; &nbsp;</p>
T&ugrave;y thuộc v&agrave;o độ cao v&agrave; thiết của từng ng&ocirc;i nh&agrave; m&agrave; lựa chọn loại thang ph&ugrave; hợp bạn nh&eacute;!<br />
<br />
&nbsp;<br />
Ketnoitieudung&nbsp;l&agrave; nh&agrave; ph&acirc;n phối&nbsp;c&aacute;c loại&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html" target="_blank">thang nh&ocirc;m</a>,&nbsp;thiết bị,&nbsp;<a href="http://www.ketnoitieudung.vn/" target="_blank">m&aacute;y m&oacute;c c&ocirc;ng nghiệp</a>,&nbsp;dụng cụ điện&nbsp;,&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/dung-cu-cam-tay_1598.html" target="_blank">dụng cụ cầm tay</a>&nbsp;ch&iacute;nh h&atilde;ng chất lượng tốt nhất với gi&aacute; rẻ c&ugrave;ng c&aacute;c ch&iacute;nh s&aacute;ch ưu đ&atilde;i &ndash; giao h&agrave;ng nhanh 1-2h l&agrave;m việc &ndash; bảo h&agrave;nh đảm bảo, kh&aacute;ch h&agrave;ng c&oacute; thể li&ecirc;n hệ c&ugrave;ng ch&uacute;ng t&ocirc;i để được&nbsp;tư vấn chuy&ecirc;n s&acirc;u&nbsp;về c&aacute;c sản phẩm cũng như chọn cho m&igrave;nh 1 sản phẩm ph&ugrave; hợp nhất với c&ocirc;ng việc.', NULL, NULL, NULL, 0, NULL, 1, NULL, CAST(0x0000A7900173CE8B AS DateTime), NULL, CAST(0x0000A7900173CE8B AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_News] OFF
SET IDENTITY_INSERT [dbo].[ecom_Brands] ON 

INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (3, N'Ashley 2', N' thương hiệu nội thất hàng đầu nước Mỹ đến VN', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (6, N'czxczx', N'zxczxczxc', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (7, N'zxczxc', N'zxczxc', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (8, N'zxczxc', N'zxczxc', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (9, N'zxczxc', N'xczxczxc', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (10, N'ádasd', N'dsasd', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (11, N'ádasd', N'ádasd', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (12, N'ádasd', N'ádasd', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (13, N'ádasd', N'ádasd', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (14, N'xcvxcv', N'xcvxcv', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (15, N'xcvxcv', N'xcvxcv', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (16, N'kaka', N'áddsas', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (17, N'Samsung', N'Samsung', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (18, N'Nike', N'Nike', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (19, N'Adidas', N'Adidas', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (20, N'BQ', N'BQ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (21, N'jjj', N'kkk', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (22, N'hhhh', N'hhhh', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (23, N'gggg', N'ggg', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (24, N'Ashley', N'Thương hiệu nội thất từ mỹ', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (25, N'Nella Vetrina', N'Thương hiệu nội thất ý', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (26, N'Kawasaki', N'Kawasaki', 1, NULL, NULL, NULL, NULL, 2238)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (27, N'Nikko wire rope ', N'Nikko wire rope ', 1, NULL, NULL, NULL, NULL, 2242)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (28, N'Asaki', N'Asaki', 1, NULL, NULL, NULL, NULL, 2234)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (29, N'Ep', N'Ep', 1, NULL, NULL, NULL, NULL, 2236)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (30, N'SATA', N'SATA', 1, NULL, NULL, NULL, NULL, 2240)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (31, N'Bishamon', N'Bishamon', 1, NULL, NULL, NULL, NULL, 2235)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (32, N'PAL', N'PAL', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (33, N'Advindeq', N'Advindeq', 1, NULL, NULL, NULL, NULL, 2233)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (34, N'Nitto', N'Nitto', 1, NULL, NULL, NULL, NULL, 2241)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (35, N'Jumbo', N'Jumbo', 1, NULL, NULL, NULL, NULL, 2237)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (36, N'Sumo', N'Sumo', 1, NULL, NULL, NULL, NULL, 2243)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (37, N'Masada', N'Masada', 1, NULL, NULL, NULL, NULL, 2239)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (1034, N'Tohnichi', N'Tohnichi', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (1035, N'Tonichi', N'Tonichi', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [ImageId]) VALUES (1036, N'Tonichi', N'Tonichi', 1, NULL, NULL, NULL, NULL, 1235)
SET IDENTITY_INSERT [dbo].[ecom_Brands] OFF
SET IDENTITY_INSERT [dbo].[ecom_Categories] ON 

INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Phong cách cổ điển                                                                                                                                                                                                                                        ', NULL, N'Các sản phẩm thiết kế theo phong cách cổ điển', N'product/phong-cach-co-dien', 2, 2, NULL, CAST(0x0000A63500757E7B AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Phong cách hiện đại                                                                                                                                                                                                                                       ', NULL, N'Các sản phẩm thiết kế theo phong cách hiện đại', N'Product/phong-cach-hien-dai', 1, 2, NULL, CAST(0x0000A635007611F4 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Đèn trang trí                                                                                                                                                                                                                                           ', 3, N'Đèn trang trí phòng khách, phòng ngủ, sân vường theo phong cách châu âu', N'DenTrangTri', 4, 2, NULL, CAST(0x0000A63500766D13 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Noi that nha bep                                                                                                                                                                                                                                          ', NULL, N'aaa', N'NoiThatNhaBep', 1, 2, NULL, CAST(0x0000A635017000EB AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Nội thất nhà tắm                                                                                                                                                                                                                                          ', NULL, N'Cung cấp các loại vòi hoa sen, vòi chia nóng lạnh, bồn tắm thông minh', N'category/voi-thong-minh', 1, 2, NULL, CAST(0x0000A63E01014892 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Bakery                                                                                                                                                                                                                                                    ', NULL, N'Các loại bánh', N'Product/bakery', 1, 2, NULL, CAST(0x0000A64801611C1F AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Vật dụng nhà bếp                                                                                                                                                                                                                                          ', NULL, N'Vật dụng nhà bếp', N'Product/vat-dung-nha-bep', 2, 2, NULL, CAST(0x0000A64801619C21 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Tủ Lạnh                                                                                                                                                                                                                                                   ', NULL, N'Tủ Lạnh', N'Product/tu-lanh', 3, 2, NULL, CAST(0x0000A6480161F89E AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Khuôn Làm Bánh                                                                                                                                                                                                                                            ', 9, N'Khuôn Làm Bánh', N'Product/khuon-lam-banh', 4, 2, NULL, CAST(0x0000A6480162333B AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Khung ảnh                                                                                                                                                                                                                                                 ', NULL, N'Khung ảnh', N'Product/khung-anh', 5, 2, NULL, CAST(0x0000A64801625D6C AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Chất Tạo Màu                                                                                                                                                                                                                                              ', 9, N'Chất Tạo Màu', N'Product/chat-tao-mau', 6, 2, NULL, CAST(0x0000A6480162CA7F AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Tinh dầu                                                                                                                                                                                                                                                  ', NULL, N'Tinh dầu', N'Product/tinh-dau', 7, 2, NULL, CAST(0x0000A6480162E516 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Tranh treo tường                                                                                                                                                                                                                                          ', NULL, N'Tranh treo tường', N'Product/tranh-treo-tuong', 8, 2, NULL, CAST(0x0000A64801631260 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Tượng composite                                                                                                                                                                                                                                           ', NULL, N'Tượng composite', N'Product/tuong-composite', 9, 2, NULL, CAST(0x0000A648016344DF AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Noi that cao cap KaKa                                                                                                                                                                                                                                     ', NULL, N'Noi that cao cap KaKa', N'Product/noi-that-cao-cap-kaka', 1, 2, NULL, CAST(0x0000A66100E9ADF5 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Bánh Mỳ Thổ Nhỉ Kỳ                                                                                                                                                                                                                                        ', 8, N'Bánh Mỳ Thổ Nhỉ Kỳ', NULL, NULL, 2, NULL, CAST(0x0000A72F0180F0CB AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Bánh Kem                                                                                                                                                                                                                                                  ', 8, N'Bánh Kem', NULL, NULL, 2, NULL, CAST(0x0000A72F0181061B AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Bột Làm Bánh                                                                                                                                                                                                                                              ', 9, N'Bột Làm Bánh', NULL, NULL, 2, NULL, CAST(0x0000A72F01811C37 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Thiết Bị Nâng Đỡ                                                                                                                                                                                                                                          ', NULL, N'Thiết Bị Nâng Đỡ', N'thiet-bi-nang-do', 1, 1, NULL, CAST(0x0000A767008D595F AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Thang Nhôm                                                                                                                                                                                                                                                ', NULL, N'Thang Nhôm', N'thang-nhom', 1, 1, NULL, CAST(0x0000A767008D925F AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Máy hàn và phụ kiện                                                                                                                                                                                                                                       ', NULL, N'Máy hàn và phụ kiện', N'may-han-va-phu-kien', 1, 1, NULL, CAST(0x0000A767008DB973 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Thiết bị, dụng cụ đo                                                                                                                                                                                                                                      ', NULL, N'Thiết bị, dụng cụ đo', N'thiet-bi-dung-cu-do', 1, 1, NULL, CAST(0x0000A767008DE50D AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Dụng cụ điện                                                                                                                                                                                                                                              ', NULL, N'Dụng cụ điện', N'dung-cu-dien', 1, 1, NULL, CAST(0x0000A767008DF874 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Thang cách điện                                                                                                                                                                                                                                           ', 22, N'Thang cách điện', N'thang-nhom/thang-cach-dien', 1, 1, NULL, CAST(0x0000A76B00C8DAD6 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Thang nhôm ghế                                                                                                                                                                                                                                            ', 22, N'Thang nhôm ghế', N'thang-nhom/thang-nhom-ghe', 1, 1, NULL, CAST(0x0000A76B00C9013B AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Thang nhôm gấp                                                                                                                                                                                                                                            ', 22, N'Thang nhôm gấp', N'thang-nhom/thang-nhom-gap', 1, 1, NULL, CAST(0x0000A76B00C929D0 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Thang nhôm trượt                                                                                                                                                                                                                                          ', 22, N'Thang nhôm trượt', N'thang-nhom/thang-nhom-truot', 1, 1, NULL, CAST(0x0000A76B00C9534F AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Thang nhôm chữ A                                                                                                                                                                                                                                          ', 22, N'Thang nhôm chữ A', N'thang-nhom/thang-nhom-chu-a', 1, 1, NULL, CAST(0x0000A76B00C97C19 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Thang nhôm rút                                                                                                                                                                                                                                            ', 22, N'Thang nhôm rút', N'thang-nhom/thang-nhom-rut', 1, 1, NULL, CAST(0x0000A76B00C99A3F AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Xe đẩy vệ sinh                                                                                                                                                                                                                                            ', 21, N'Xe đẩy vệ sinh', N'xe-day-ve-sinh', 2, 1, NULL, CAST(0x0000A76B00D8C65C AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Xe đẩy hàng                                                                                                                                                                                                                                               ', 21, N'Xe đẩy hàng', N'xe-day-hang', 2, 1, NULL, CAST(0x0000A76B00D98A52 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'Con đội - kích thủy lực                                                                                                                                                                                                                                   ', 21, N'Con đội - kích thủy lực', N'con-doi-kich-thuy-luc', 2, 1, NULL, CAST(0x0000A76B00D9B996 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'Pa Lăng Xích                                                                                                                                                                                                                                              ', 21, N'Pa Lăng Xích', N'pa-lang-xich', 2, 1, NULL, CAST(0x0000A76B00D9D9EE AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ecom_Categories] OFF
SET IDENTITY_INSERT [dbo].[ecom_OrderDetails] ON 

INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 1, 7, 3, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A752017AF8CC AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 1, 6, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A752017AF8D4 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 2, 37, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A752017FFDC8 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 2, 38, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A752017FFDCA AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 3, 6, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7550151BA0C AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, 3, 7, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7550151BA0C AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, 4, 6, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A755015538A6 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, 4, 7, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A755015538AA AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, 5, 7, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75600787275 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, 5, 9, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75600787279 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, 6, 43, 3, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75600B2577E AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 6, 45, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75600B25780 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, 7, 5, 3, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75600EFAA24 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, 7, 6, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75600EFAA25 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, 8, 5, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7570095AD51 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, 8, 6, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7570095AD52 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, 9, 37, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75700971AA3 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, 9, 38, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75700971AA5 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, 10, 5, 6, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A75E00D1012F AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, 11, 3, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B518 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, 11, 37, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B518 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, 11, 19, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B519 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, 11, 27, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B519 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, 11, 28, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B51A AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, 11, 26, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B51A AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, 11, 30, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B51A AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, 11, 29, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B51B AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, 11, 25, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B51B AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [PriceOfUnit], [TotalDiscount], [TotalOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, 11, 23, 1, 1000000.0000, NULL, 0.0000, 1, NULL, CAST(0x0000A7620182B51B AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ecom_OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[ecom_Orders] ON 

INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 0, NULL, N'trungkienkaka                                                                                                                                                                                           ', N'0123887889', N'Tieu La, Da Nang', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 0, NULL, N'admin                                                                                                                                                                                                   ', N'0214123123123', N'Hoang Dieu, Da Nang', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 0, NULL, N'trungkien                                                                                                                                                                                               ', N'0123423423', N'123 Hoang Dieu', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 0, N'', N'trungkienkaka                                                                                                                                                                                           ', N'12312312', N'abc', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 2, N'abc', N'kaka                                                                                                                                                                                                    ', N'34534534', N'Hoang Dieu', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 2, N'Let go', N'lalala                                                                                                                                                                                                  ', N'0999999999', N'kaka', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 2, NULL, N'asdas                                                                                                                                                                                                   ', N'23423423', N'dasdas', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 1, N'', N'lalala                                                                                                                                                                                                  ', N'23423423', N'kaka', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 1, N'', N'kakalilo                                                                                                                                                                                                ', N'012312234234', N'Tieu La', 1, NULL, CAST(0x0000A75700971AA1 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 1, N'', N'asdasd                                                                                                                                                                                                  ', N'asdasd', N'asdasd', 1, NULL, CAST(0x0000A75E00D10124 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Orders] ([Id], [OrderCode], [UserId], [TotalPrice], [FeeShip], [TotalOrder], [OrderStatus], [OrderNote], [NameOfRecipient], [PhoneOfRecipient], [AddressOfRecipient], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'00000000-0000-0000-0000-000000000000                                                                ', NULL, CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), CAST(0.0000 AS Decimal(19, 4)), 1, N'', N'kakaka                                                                                                                                                                                                  ', N'0999999999999', N'123 Han thuyen', 1, NULL, CAST(0x0000A7620182B517 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ecom_Orders] OFF
SET IDENTITY_INSERT [dbo].[ecom_ProductGroups] ON 

INSERT [dbo].[ecom_ProductGroups] ([Id], [Name], [Description], [Status]) VALUES (3, N'Phong cách hiện đại                                                                                                                                                                                     ', N'Phong cách hiện đại                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', 2)
INSERT [dbo].[ecom_ProductGroups] ([Id], [Name], [Description], [Status]) VALUES (4, N'Phong cách cổ điển                                                                                                                                                                                      ', N'Phong cách cổ điển                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 2)
INSERT [dbo].[ecom_ProductGroups] ([Id], [Name], [Description], [Status]) VALUES (5, N'Sản phẩm đang bán chạy                                                                                                                                                                                  ', N'Sản phẩm đang bán chạy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 1)
SET IDENTITY_INSERT [dbo].[ecom_ProductGroups] OFF
SET IDENTITY_INSERT [dbo].[ecom_Products] ON 

INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (1, N' 005T', N'Kệ Tivi Giá Rẻ 005T', 8199000.0000, NULL, 12, 1, 24, 53, N'KT: Kệ dưới 2.4*0.35*0.4m, kệ treo 1.0*0.03*0.2m, Tủ đứng 1.0*0.3*0.25m, và các đợt ngang, Gỗ MDF Malaysia.', N'<p>KT: Kệ dưới 2.4*0.35*0.4m, kệ treo 1.0*0.03*0.2m, Tủ đứng 1.0*0.3*0.25m, v&agrave; c&aacute;c đợt ngang, Gỗ MDF Malaysia.</p>
', NULL, NULL, NULL, 1, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (2, N'007T', N'Kệ Tivi Giá Rẻ 007T', 11500000.0000, NULL, 3, 1, 25, 54, N'KT: 2.8*2.7*0.4m, Gỗ MDF Malaysia.', N'<p>KT: 2.8*2.7*0.4m, Gỗ MDF Malaysia.</p>
', NULL, NULL, NULL, 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (3, N'72', N'723', 1000000.0000, NULL, 2, 1, NULL, 204, N'72', N'<p>72</p>
', NULL, NULL, NULL, 1, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (4, N'DSC_9393', N'DSC_9393', 1000000.0000, NULL, 2, 1, NULL, 58, N'DSC_9393', NULL, NULL, NULL, N'DSC_9393', 1, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (5, N'DSC_9393', N'DSC_9393', 1000000.0000, NULL, 3, 1, NULL, 157, N'DSC_9393', N'<p>DSC_9393</p>
', NULL, NULL, NULL, 1, 0, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (6, N'DSC_9504', N'DSC_9504', 1000000.0000, NULL, 5, 1, NULL, 158, N'DSC_9504', N'<p>DSC_9504</p>
', NULL, NULL, NULL, 1, 0, 3, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (7, N'DSC_9755', N'DSC_9755', 1000000.0000, NULL, 3, 1, NULL, 159, N'DSC_9755', N'<p>DSC_9755</p>
', NULL, NULL, NULL, 1, 1, 4, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (8, N'DSC_9894', N'DSC_9894ki', 1000000.0000, NULL, 4, 1, NULL, 160, N'DSC_9894', N'<p>DSC_9894</p>
', NULL, NULL, NULL, 1, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (9, N'DSC_9896', N'DSC_9896', 1000000.0000, NULL, 3, 1, NULL, 161, N'DSC_9896', N'<p>DSC_9896</p>
', NULL, NULL, NULL, 1, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (10, N'DSC_9897', N'DSC_9897', 1000000.0000, NULL, 3, 1, NULL, 162, N'DSC_9897', N'<p>DSC_9897</p>
', NULL, NULL, NULL, 1, 1, 5, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (11, N'DSC_9900', N'DSC_9900', 1000000.0000, NULL, 3, 1, NULL, 163, N'DSC_9900', N'<p>DSC_9900</p>
', NULL, NULL, NULL, 1, 0, 6, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (12, N'DSC_9901', N'DSC_9901', 1000000.0000, NULL, 5, 1, NULL, 164, N'DSC_9901', N'<p>DSC_9901</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (13, N'DSC_9902', N'DSC_9902', 1000000.0000, NULL, 4, 1, NULL, 165, N'DSC_9902', N'<p>DSC_9902</p>
', NULL, NULL, NULL, 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (14, N'DSC_9904', N'DSC_9904', 1000000.0000, NULL, 4, 1, NULL, 166, N'DSC_9904', N'<p>DSC_9904</p>
', NULL, NULL, NULL, 1, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (15, N'DSC_9906', N'DSC_9906', 1000000.0000, NULL, 3, 1, NULL, 167, N'DSC_9906', N'<p>DSC_9906</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (16, N'DSC_9908', N'DSC_9908', 1000000.0000, NULL, 2, 1, NULL, 168, N'DSC_9908', N'<p>DSC_9908</p>
', NULL, NULL, NULL, 1, 0, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (17, N'DSC_9911', N'DSC_9911', 1000000.0000, NULL, 3, 1, NULL, 169, N'DSC_9911', N'<p>DSC_9911</p>
', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (18, N'DH0011', N'xaviadecordanang0011', 1000000.0000, NULL, 2, 1, NULL, 192, N'xaviadecordanang0011', N'<p>xaviadecordanang0011</p>
', NULL, NULL, NULL, 0, 0, 3, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (19, N'DH0012', N'xaviadecordanang0012', 1000000.0000, NULL, 3, 1, NULL, 193, N'xaviadecordanang0012', N'<p>xaviadecordanang0012</p>
', NULL, NULL, NULL, 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (20, N'DH0013', N'xaviadecordanang0013', 1000000.0000, NULL, 2, 1, NULL, 194, N'xaviadecordanang0013', N'<p>xaviadecordanang0013</p>
', NULL, NULL, NULL, 1, 0, 4, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (21, N'DH0014', N'xaviadecordanangDH0014', 1000000.0000, NULL, 2, 1, NULL, 195, N'DH0014', N'<p>DH0014</p>
', NULL, NULL, NULL, 0, 0, 6, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (22, N'DH0015', N'DH0015', 1000000.0000, NULL, 2, 1, NULL, 140, N'DH0015', N'<p>DH0015</p>
', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (23, N'Dh0016', N'Dh0016', 1000000.0000, NULL, 2, 1, NULL, 147, N'Dh0016', N'<p>Dh0016</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (24, N'DH0017', N'DH0017', 1000000.0000, NULL, 2, 1, NULL, 145, N'DH0017', N'<p>DH0017</p>
', NULL, NULL, NULL, 0, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (25, N'DH0018', N'DH0018', 1000000.0000, NULL, 2, 1, NULL, 146, N'DH0018', N'<p>DH0018</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (26, N'DH0019', N'DH0019', 1000000.0000, NULL, 2, 1, NULL, 148, N'DH0019', N'<p>DH0019</p>
', NULL, NULL, NULL, 1, 1, 3, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (27, N'DH0101', N'DH0101', 1000000.0000, NULL, 2, 1, NULL, 151, N'DH0101', N'<p>DH0101</p>
', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (28, N'Dh0101', N'Dh0101', 1000000.0000, NULL, 2, 1, NULL, 149, N'Dh0101', N'<p>Dh0101</p>
', NULL, NULL, NULL, 0, 0, 3, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (29, N'DH0102', N'DH0102', 1000000.0000, NULL, 2, 1, NULL, 153, N'DH0102', N'<p>DH0102</p>
', NULL, NULL, NULL, 0, 0, 3, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (30, N'DH0103', N'DH0103', 1000000.0000, NULL, 2, 1, NULL, 154, N'DH0103', N'<p>DH0103</p>
', NULL, NULL, NULL, 0, 0, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (31, N'DH0104', N'DH0104', 1000000.0000, NULL, 2, 1, NULL, 155, N'DH0104', N'<p>DH0104</p>
', NULL, NULL, NULL, 0, 0, 3, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (32, N'DH0015', N'DH0015', 1000000.0000, NULL, 3, 1, NULL, 142, N'DH0015', N'<p>DH0015</p>
', NULL, NULL, NULL, 0, 0, 4, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (33, N'DH0106', N'DH0106', 1000000.0000, NULL, 2, 1, NULL, 156, N'DH0106', N'<p>DH0106</p>
', NULL, NULL, NULL, 0, 0, 7, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (34, N'HG0001', N'HG0001', 1000000.0000, NULL, 2, 1, NULL, 170, N'HG0001', N'<p>HG0001</p>
', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (35, N'HG0002', N'HG0002', 1000000.0000, NULL, 2, 1, NULL, 171, N'HG0002', N'<p>HG0002</p>
', NULL, NULL, NULL, 1, 0, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (36, N'HG0003', N'HG0003', 1000000.0000, NULL, 2, 1, NULL, 172, N'HG0003', N'<p>HG0003</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (37, N'HNXavia0001', N'HNXavia0001', 1000000.0000, NULL, 2, 1, NULL, 173, N'HNXavia0001', N'<p>HNXavia0001</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (38, N'HNXavia0002', N'HNXavia0002', 1000000.0000, NULL, 2, 1, NULL, 174, N'HNXavia0002', N'<p>HNXavia0002</p>
', NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (39, N'HNXavia0003', N'HNXavia0003', 1000000.0000, NULL, 2, 1, NULL, 175, N'HNXavia0003', N'<p>HNXavia0003</p>
', NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (40, N'KA0001', N'KA0001', 1000000.0000, NULL, 2, 1, NULL, 176, N'KA0001', N'<p>KA0001</p>
', NULL, NULL, NULL, 0, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (41, N'KA0002', N'KA0002', 1000000.0000, NULL, 2, 1, NULL, 177, N'KA0002', N'<p>KA0002</p>
', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (42, N'KA0003', N'KA0003', 1000000.0000, NULL, 2, 1, NULL, 178, N'KA0003', N'<p>KA0003</p>
', NULL, NULL, NULL, 1, 1, 5, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (43, N'SHC0001', N'SHC0001', 1000000.0000, NULL, 2, 1, NULL, 179, N'SHC0001', N'<p>SHC0001</p>
', NULL, NULL, NULL, 1, 0, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (44, N'SHC0002', N'SHC0002', 1000000.0000, NULL, 2, 1, NULL, 180, N'SHC0002', N'<p>SHC0002</p>
', NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (45, N'SHC0003', N'SHC0003', 1000000.0000, NULL, 2, 1, NULL, 181, N'SHC0003', N'<p>SHC0003</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (46, N'TD0001', N'TD0001', 1000000.0000, NULL, 2, 1, NULL, 185, N'TD0001', N'<p>TD0001</p>
', NULL, NULL, NULL, 1, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (47, N'TD0002', N'TD0002', 1000000.0000, NULL, 2, 1, NULL, 186, N'TD0002', N'<p>TD0002</p>
', NULL, NULL, NULL, 0, 0, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (48, N'TD0003', N'TD0003', 1000000.0000, NULL, 2, 1, NULL, 187, N'TD0003', N'<p>TD0003</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (49, N'TTT0001', N'TTT0001', 1000000.0000, NULL, 2, 1, NULL, 188, N'TTT0001', N'<p>TTT0001</p>
', NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (50, N'TTT0002', N'TTT0002', 1000000.0000, NULL, 2, 1, NULL, 190, N'TTT0002', N'<p>TTT0002</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (51, N'TTT0003', N'TTT0003', 1000000.0000, NULL, 2, 1, NULL, 191, N'TTT0003', N'<p>TTT0003</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (52, N'TCPS0001', N'TCPS0001', 1000000.0000, NULL, 2, 1, NULL, 182, N'TCPS0001', N'<p>TCPS0001</p>
', NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (53, N'TCPS0002', N'TCPS0002', 1000000.0000, NULL, 2, 1, NULL, 183, N'TCPS0002', N'<p>TCPS0002</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (54, N'TCPS0003', N'TCPS0003', 1000000.0000, NULL, 2, 1, NULL, 184, N'TCPS0003', N'<p>TCPS0003</p>
', NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (55, N'BK-001', N'Doner bread', 20000.0000, NULL, 2, 1, 17, 205, N'Nutrient content : Calories	1,000', N'<table>
	<tbody>
		<tr>
			<td>Calories</td>
			<td>1,000</td>
			<td>Sodium</td>
			<td>0 mg</td>
		</tr>
		<tr>
			<td>Total Fat</td>
			<td>26 g</td>
			<td>Potassium</td>
			<td>0 mg</td>
		</tr>
		<tr>
			<td>Saturated</td>
			<td>0 g</td>
			<td>Total Carbs</td>
			<td>54 g</td>
		</tr>
		<tr>
			<td>Polyunsaturated</td>
			<td>0 g</td>
			<td>Dietary Fiber</td>
			<td>0 g</td>
		</tr>
		<tr>
			<td>Monounsaturated</td>
			<td>0 g</td>
			<td>Sugars</td>
			<td>0 g</td>
		</tr>
		<tr>
			<td>Trans</td>
			<td>0 g</td>
			<td>Protein</td>
			<td>25 g</td>
		</tr>
		<tr>
			<td>Cholesterol</td>
			<td>0 mg</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Vitamin A</td>
			<td>0%</td>
			<td>Calcium</td>
			<td>0%</td>
		</tr>
		<tr>
			<td>Vitamin C</td>
			<td>0%</td>
			<td>Iron</td>
			<td>0%</td>
		</tr>
	</tbody>
</table>
', NULL, NULL, NULL, 1, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (56, N'toktok123', N'toktok', 30000.0000, NULL, 1, 1, 17, 208, N'kaka', N'<p>kaka</p>
', NULL, NULL, NULL, 1, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (57, N'kakakka', N'kakaka', 12000.0000, NULL, 1, 1, 17, 209, N'nha dep', N'<p>nha dep</p>
', NULL, NULL, NULL, 1, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (58, N'', N'Banh que2', 12000.0000, NULL, 12, 1, NULL, 219, N'Banh que thom ngon', N'<p>Banh que thom ngon</p>
', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (59, N'', N'aaaa Banh2', 220000.0000, NULL, 2, 1, NULL, 220, N'lalalala', N'<p>lalalala</p>
', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (60, N'', N'banh kutkit2', 120000.0000, NULL, NULL, 1, NULL, 221, N'banh kutkit', N'<p>banh kutkit</p>
', NULL, NULL, N'', 0, 0, 3, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (61, N'', N'kakaka', 120000.0000, NULL, NULL, NULL, NULL, 222, N'asdas', N'<p>asdasd2</p>
', NULL, NULL, N'', 0, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (62, N'', N'aaaa123', 12222.0000, NULL, NULL, NULL, NULL, 223, N'kakakak123', N'<p>kakakak123kakakak123</p>
', NULL, NULL, N'', 0, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (63, N'NH-AI56', N'Thang nhôm rút chữ A Nikita AI56 (5.6m)', 3320000.0000, NULL, NULL, NULL, 32, 224, N'Thang nhôm rút chữ A Nikita AI56 chất lượng, giá tốt. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikita-ai56-56m_9404.html">Thang nh&ocirc;m r&uacute;t chữ A AI56 5.6m&nbsp;</a>có nhiều t&ecirc;n gọi: thang r&uacute;t đa năng,&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">thang nh&ocirc;m r&uacute;t</a>&nbsp;th&ocirc;ng minh.. Được sản xu&acirc;́t theo c&ocirc;ng ngh&ecirc;̣ ti&ecirc;n ti&ecirc;́n của Nhật Bản.&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikita-ai56-56m_9404.html">Thang nh&ocirc;m Nikita AI56&nbsp;</a>được đảm bảo ch&acirc;́t lượng với đ&ocirc;̣ b&ecirc;̀n cao, chắc chắn, an toàn cho người sử dụng. Mà giá cả lại phù hợp với túi ti&ecirc;̀n người sử dụng.<br />
&nbsp;</p>

<p><a href="http://www.thegioithangnhom.com/data/bt4/thang-nhom-rut-gon-kn-r32-1.jpg"><img alt="" src="http://www.thegioithangnhom.com/data/bt2/thang-nhom-rut-chu-a-ai56-56m.jpg" /></a></p>

<p><strong>C&ocirc;ng dụng:</strong><br />
<br />
-&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom-rut-chu-a-nikita-ai56-56m_9404.html">Nikita AI56&nbsp;</a>được sử dụng rộng r&atilde;i tr&ecirc;n thị trường trong c&aacute;c ng&agrave;nh sản xuất sữa chữa, trong ng&agrave;nh điện lực, truyền h&igrave;nh c&aacute;p SCTV... v&agrave; trong gia đ&igrave;nh cũng như văn ph&ograve;ng v&agrave;o những c&ocirc;ng việc như thay b&oacute;ng đ&egrave;n, vệ&nbsp;sinh nh&agrave; cửa, lau ch&ugrave;i cửa kiếng...<br />
- Thang c&oacute; thể sử dụng ở vị tr&iacute; cầu thang hay địa h&igrave;nh phức tạp do c&oacute; chức năng r&uacute;t đa năng.<br />
<br />
<strong>Đặc trưng:</strong></p>

<p><strong>-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;AI56</strong>&nbsp;thi&ecirc;́t k&ecirc;́ từ nh&ocirc;m chắc chắn, kh&ocirc;ng gỉ sét, b&ecirc;̀ ngoài sáng bóng.<br />
- Thang nhỏ nhẹ, gọn. Có th&ecirc;̉ sử dụng ở ngoài trời, và có th&ecirc;̉ được g&acirc;́p lại đặt b&acirc;́t cứ nơi nào trong phòng hoặc xe chở.<br />
- Thang có kích thước nhỏ, ti&ecirc;́t ki&ecirc;̣m di&ecirc;̣n tích và thời gian làm vi&ecirc;̣c.<br />
- V&acirc;̣n hành đơn giản, linh hoạt.<br />
-&nbsp;<strong>Thang nh&ocirc;m rút Nikita AI56</strong>&nbsp;có th&ecirc;m khóa tự đ&ocirc;̣ng làm cho thang có th&ecirc;m chức năng rút, du&ocirc;̃i thẳng chữ I, hoặc x&ecirc;́p thành chữ A.<br />
&nbsp;</p>

<p><strong>C&aacute;c bước sử dụng thang an to&agrave;n:</strong></p>

<p>&nbsp;</p>

<p>Bước 1: Đặt thang nằm ngang tr&ecirc;n s&agrave;n nh&agrave;. Phần cuối thang c&oacute; đế chống s&aacute;t v&agrave;o cạnh tường.</p>

<p>Bước 2: Nhấc đầu ph&iacute;a ngo&agrave;i của thang nh&ocirc;m r&uacute;t v&agrave; dựng thang l&ecirc;n, di chuyển xuống dưới cho đến khi c&aacute;c bậc thang thẳng đứng.</p>

<p>Bước 3: Đặt thang dựa v&agrave;o tường theo thiết kế g&oacute;c an to&agrave;n của từng loại thang. Lu&ocirc;n đảm bảo khoảng c&aacute;ch t&iacute;nh từ ch&acirc;n thang v&agrave;o trong tường kh&ocirc;ng qu&aacute; rộng.<br />
&nbsp;</p>

<p>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như l&agrave; Nh&agrave; ph&acirc;n phối&nbsp;<a href="http://www.ketnoitieudung.vn/thang-nhom/c31/nikita.html">Thang nh&ocirc;m Nikita</a>&nbsp;ch&iacute;nh thức tại TP. Hồ Ch&iacute; Minh.&nbsp;<strong><em>Ketnoitieudung.vn</em></strong>&nbsp;lu&ocirc;n cung cấp cho bạn những chiếc&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t</a>&nbsp;chất lượng, ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt.</p>

<p>Nếu c&oacute; nhu cầu sử dụng&nbsp;<strong>Thang Nh&ocirc;m</strong>, xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline&nbsp;</strong>&nbsp;(08) 3971 8011 - (08) 3975 6686&nbsp;hoặc trực tiếp đến văn ph&ograve;ng giao dịch:&nbsp;<em>106 T&aacute;i Thiết, Phường 11, Quận T&acirc;n B&igrave;nh, Th&agrave;nh Phố Hồ Ch&iacute; Minh, VN</em>&nbsp;&nbsp;để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.</p>

<p>&nbsp;</p>

<p>Hoặc truy cập v&agrave;o trang Web www.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.<br />
Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi sau khi sử dụng Thang Nh&ocirc;m của bạn.&nbsp;</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, N'<table>
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Thang nh&ocirc;m r&uacute;t</td>
		</tr>
		<tr>
			<td><strong>Hãng sản xuất</strong></td>
			<td>Nikita</td>
		</tr>
		<tr>
			<td><strong>C&ocirc;ng ngh&ecirc;̣</strong></td>
			<td>Nh&acirc;̣t Bản</td>
		</tr>
		<tr>
			<td><strong>Xu&acirc;́t xứ</strong></td>
			<td>Trung Qu&ocirc;́c</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước thang nh&ocirc;m:</strong></td>
			<td>100 &times; 50 &times; 10 cm (D&agrave;i &times; rộng &times; d&agrave;y)</td>
		</tr>
		<tr>
			<td><strong>Chiều cao chữ I tối đa:</strong></td>
			<td>5.6 m</td>
		</tr>
		<tr>
			<td><strong>Chiều cao chữ A tối đa:</strong></td>
			<td>2.8m</td>
		</tr>
		<tr>
			<td><strong>Chiều d&agrave;i r&uacute;t gọn:</strong></td>
			<td>1.1m</td>
		</tr>
		<tr>
			<td><strong>Số bậc thang nh&ocirc;m mỗi b&ecirc;n:</strong></td>
			<td>9 bậc</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng thang nh&ocirc;m:</strong></td>
			<td>21.5 kg</td>
		</tr>
		<tr>
			<td><strong>Tải trọng tối đa:</strong></td>
			<td>150 kg</td>
		</tr>
		<tr>
			<td><strong>Chất liệu:</strong></td>
			<td>Hợp kim nh&ocirc;m</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (64, N'Nikita-nhom', N'Thang nhôm rút 3.8M đai nhôm Nikita', 2749000.0000, NULL, NULL, NULL, 26, 225, N'Thang nhôm rút 3.8M đai nhôm Nikita, thang đai nhôm nikita giá rẻ, chất lượng giao hàng nhanh trong ngày', N'<p>Được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ ti&ecirc;n tiến đạt ti&ecirc;u chuẩn quốc tế,&nbsp;<strong>Nikita Đai Nh&ocirc;m</strong>&nbsp;l&agrave; một trong những loại&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>&nbsp;b&aacute;n chạy nhất nhờ chất lượng bảo đảm, t&iacute;nh tiện lợi, linh hoạt c&ugrave;ng gi&aacute; th&agrave;nh hợp l&yacute;.&nbsp;</p>

<p><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/thang-nhom-dai-nhom-nikita(1).jpg" /><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/thang-nhom-dai-nhom-nikita(2).jpg" /></p>

<p><strong>Thang đai nh&ocirc;m Nikita&nbsp;</strong>l&agrave; sản phẩm được sản xuất từ chất liệu cao cấp hợp kim nh&ocirc;m, phủ lớp sơn chống gỉ, ch&acirc;n bọc đế cao su chống trượt, mang lại an to&agrave;n cho người sử dụng.&nbsp;</p>

<p>Với chiều cao tối đa l&ecirc;n đến 3,8 m, thang nh&ocirc;m Nikita được sử dụng rộng r&atilde;i trong gia đ&igrave;nh cũng như ở c&aacute;c si&ecirc;u thị điện m&aacute;y v&agrave; ng&agrave;nh điện lực. Hiện đ&acirc;y l&agrave; d&ograve;ng thang nh&ocirc;m b&aacute;n chạy trong c&aacute;c sản phẩm thang nh&ocirc;m&nbsp;<strong>Nikita</strong>.</p>

<p><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/thang-nhom-dai-nhom-nikita.jpg" /></p>

<p><strong>Thang đai nh&ocirc;m Nikita</strong>&nbsp;sản phẩm được sử dụng rộng r&atilde;i trong c&aacute;c ng&agrave;nh Kỹ thuật, Si&ecirc;u thị, quảng c&aacute;o, vệ sinh k&iacute;nh, Sửa chữa b&oacute;ng đ&egrave;n, cắt tỉa c&acirc;y, Sử dụng trong kh&aacute;ch sạn, Sử dụng trong ng&agrave;nh điện lực, ng&agrave;nh c&ocirc;ng nghiệp khai th&aacute;c mỏ....</p>
', NULL, NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>Nikita</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td><strong>Bảo h&agrave;nh</strong></td>
			<td>12 Th&aacute;ng ch&iacute;nh h&atilde;ng</td>
		</tr>
		<tr>
			<td><strong>Chiều d&agrave;i r&uacute;t gọn</strong></td>
			<td>89cm</td>
		</tr>
		<tr>
			<td><strong>Đường k&iacute;nh ống nhỏ nhất</strong></td>
			<td>28 cm</td>
		</tr>
		<tr>
			<td><strong>Chiều d&agrave;i ống</strong></td>
			<td>48 cm</td>
		</tr>
		<tr>
			<td><strong>Khoảng c&aacute;ch ống</strong></td>
			<td>30 cm</td>
		</tr>
		<tr>
			<td><strong>Độ d&agrave;y ống</strong></td>
			<td>1,3mm - 1,5 mm</td>
		</tr>
		<tr>
			<td><strong>Số bậc thang</strong></td>
			<td>13 bậc</td>
		</tr>
		<tr>
			<td><strong>Chất liệu</strong></td>
			<td>Nh&ocirc;m hợp kim</td>
		</tr>
		<tr>
			<td><strong>Ch&acirc;n đế</strong></td>
			<td>Cao su chống trượt</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (65, N'B6-165', N'Thang nhôm chữ M TW Đài Loan PAL B6-165', 2809000.0000, NULL, NULL, NULL, 32, 228, N'Thang nhôm chữ M PAL B6-165 chất lượng, giá tốt. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hành nhanh 1-2h. Xem ngay!', N'<p><strong><a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;PAL gấp chữ M B6-165</strong>&nbsp;l&agrave; sản phẩm cao cấp của Đ&agrave;i Loan. Chiếc thang gấp n&agrave;y c&oacute; thể gi&uacute;p bạn những c&ocirc;ng việc trong gia đ&igrave;nh như lấy những đồ vật tr&ecirc;n cao, sơn sửa nh&agrave; cửa,... Được nhiều người tin sử dụng bởi t&iacute;nh tiện dụng v&agrave; chất lượng của sản phẩm.<br />
&nbsp;</p>

<p><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/B6-165(2).JPG" /><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/B6-165(1).JPG" /></p>

<p>&nbsp;</p>

<p><strong>Đặc điểm đặc trưng:</strong><br />
<br />
<strong><em>Thiết kế linh hoạt, tiện lợi:</em></strong><br />
-&nbsp;<strong>Thang nh&ocirc;m M gấp 4 kh&uacute;c Pal B6-165</strong>&nbsp;c&oacute; thể điều chỉnh nhiều độ cao kh&aacute;c nhau để ph&ugrave; hợp với nhu cầu c&ocirc;ng việc của bạn.&nbsp;<br />
-&nbsp;Với 03 vị tr&iacute; khớp nối bản lề cho ph&eacute;p sử dụng 16 t&iacute;nh năng kh&aacute;c nhau như l&agrave; thang chữ I, thang chữ A, bệ đỡ gi&agrave;n gi&aacute;o hoặc thậm ch&iacute; sử dụng như một gi&agrave;n gi&aacute;o...</p>

<p>-&nbsp;Hệ thống kh&oacute;a bản lề tự động cho ph&eacute;p điều chỉnh thang dễ d&agrave;ng cũng như gấp lại để cất giữ, dễ d&agrave;ng vận chuyển.</p>

<p><br />
<strong><em>An to&agrave;n, chắc chắn:</em></strong><br />
-&nbsp;Khung nh&ocirc;m nhẹ nhưng bền chắc, tải trọng 150 kg, đạt ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;u EN131-1.<br />
-&nbsp;<strong>Thang nh&ocirc;m PAL gấp 4 đoạn B6-165</strong>&nbsp;c&oacute; hệ thống kh&oacute;a bản lề tự động đảm bảo sự ổn định v&agrave; an to&agrave;n khi sử dụng, nhờ c&aacute;c khớp nối thang c&oacute; thể gấp lại dễ d&agrave;ng để cất giữ.<br />
-&nbsp;Độ d&agrave;y của thang nh&ocirc;m đạt ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u.<br />
&nbsp;</p>

<p><strong>Ứng dụng:&nbsp;</strong><br />
-&nbsp;Được ứng dụng nhiều trong c&aacute;c ng&agrave;nh như viễn th&ocirc;ng, điện lực, c&oacute; thể sử dụng tại c&aacute;c c&ocirc;ng ty.</p>

<p>&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như</strong>&nbsp;l&agrave; đại l&yacute; uy t&iacute;n Chuy&ecirc;n ph&acirc;n phối c&aacute;c sản phẩm Thang nh&ocirc;m cao cấp ch&iacute;nh h&atilde;ng. Đặc biệt,&nbsp;<strong>Thang nh&ocirc;m M gấp 4 kh&uacute;c Pal B6-165</strong>&nbsp;chất lượng, gi&aacute; tốt.&nbsp;</p>

<p>&nbsp;</p>

<p>Nếu c&oacute; nhu cầu sử dụng&nbsp;<strong>Thang Nh&ocirc;m</strong>, xin vui l&ograve;ng li&ecirc;n hệ qua số hotline&nbsp;<strong>(08) 3971 8011 - (08) 3975 66</strong>86 hoặc trực tiếp đến văn ph&ograve;ng giao dịch:&nbsp;<em><strong>106 T&aacute;i Thiết, Phường 11, Quận T&acirc;n B&igrave;nh, Th&agrave;nh Phố Hồ Ch&iacute; Minh, VN</strong></em>&nbsp;để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.</p>

<p>Hoặc truy cập v&agrave;o trang Web w.w.w.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.</p>

<p>Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi của bạn sau khi sử dụng&nbsp;<strong>Thang Nh&ocirc;m</strong>&nbsp;của ch&uacute;ng t&ocirc;i.</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Thang nh&ocirc;m gấp</td>
		</tr>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>PAL</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Đ&agrave;i Loan</td>
		</tr>
		<tr>
			<td><strong>Chiều cao chữ I duỗi thẳng</strong></td>
			<td>4,920 m</td>
		</tr>
		<tr>
			<td><strong>Chiều cao chữ A</strong></td>
			<td>2,510 m</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>15,04 kg</td>
		</tr>
		<tr>
			<td><strong>Tải trọng</strong></td>
			<td>150 kg</td>
		</tr>
		<tr>
			<td><strong>Chất liệu</strong></td>
			<td>Hợp kim nh&ocirc;m</td>
		</tr>
		<tr>
			<td><strong>Bảo h&agrave;nh</strong></td>
			<td>24 Th&aacute;ng ch&iacute;nh h&atilde;ng</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (66, N'ADT709B', N'Thang nhôm đôi Advindeq ADT709B (5.6m)', 3309000.0000, NULL, NULL, NULL, 33, 231, N'Thang nhôm đôi Advindeq ADT709B (5.6m) Chính hãng, giao hàng hỏa tốc 1-2h! Gọi để có giá tốt hơn.', N'<p><a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;đ&ocirc;i Advindeq ADT709B (5.6m) l&agrave; d&ograve;ng thang nh&ocirc;m với thiết kế c&ocirc;ng nghệ mới từ Advindeq chất lượng cao, thang nh&ocirc;m với chiều cao nhất từ&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">thang nh&ocirc;m r&uacute;t</a>&nbsp;đ&ocirc;i 5.6m đảm bảo thi c&ocirc;ng ở những điểm c&oacute; chiều cao đặc th&ugrave;,&nbsp;đảm bảo ti&ecirc;u chuẩn về độ an to&agrave;n lẫn hiệu quả sử dụng. Kh&aacute;c với những chiếc thang theo kiểu truyền thống hiện c&oacute; tr&ecirc;n thị trường. Advindeq ADT709B đ&aacute;p ứng được nhu cầu của bạn cả về mẫu m&atilde;, chức năng, chất lượng sản phẩm m&agrave; gi&aacute; cả lại tốt hơn với gi&aacute; thị trường.</p>

<p><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/Advindeq-ADT709B.jpg" /></p>

<p><strong>C&ocirc;ng dụng:</strong></p>

<p>&nbsp;</p>

<p>- Advindeq ADT709B (5.6m) l&agrave; sản phẩm hữu dụng cho việc thao t&aacute;c trong nh&agrave; v&agrave; cả ngo&agrave;i trời như lấy c&aacute;c vật dụng tr&ecirc;n cao, sơn tường, vệ sinh k&iacute;nh, sửa chữa b&oacute;ng đ&egrave;n...&nbsp;</p>

<p>- Thang c&oacute; khả năng r&uacute;t gọn, tiện cho việc di chuyển hay cất giữ, sản phẩm th&iacute;ch hợp d&ugrave;ng trong gia đ&igrave;nh, văn ph&ograve;ng, c&ocirc;ng trường hay những kh&ocirc;ng gian nhỏ.</p>

<p><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/Advindeq.png" /></p>

<p>&nbsp;</p>

<p><strong>Đặc trưng:</strong></p>

<p>&nbsp;</p>

<p>Chắc chắn. an toàn:</p>

<p>- Thang nh&ocirc;m r&uacute;t Advindeq ADT709B (5.6m) được l&agrave;m từ hợp kim nh&ocirc;m được mạ lớp chống gỉ s&aacute;ng b&oacute;ng, kh&ocirc;ng chỉ mang lại độ chắc chắn v&agrave; độ bền cao m&agrave; c&ograve;n đảm t&iacute;nh thẩm mỹ. Với diện mạo mới chốt v&agrave; đai thang c&oacute; m&agrave;u xanh dương rất đẹp v&agrave; bắt mắt.&nbsp;</p>

<p>- Tải trọng 150 kg ti&ecirc;u chuẩn an to&agrave;n Ch&acirc;u &Acirc;U EN131.</p>

<p>- Đặc biệt, ch&acirc;n Thang nh&ocirc;m r&uacute;t Nikawa được trang bị đế cao su chống trượt mang đến sự an to&agrave;n tuyệt đối khi sử dụng. Bề mặt thang nh&ocirc;m được bảo vệ bởi lớp chống gỉ lu&ocirc;n s&aacute;ng trắng b&oacute;ng.&nbsp;</p>

<p>&nbsp;</p>

<p><strong>Thiết kế th&ocirc;ng minh</strong></p>

<p>-&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-rut_174.html">Thang nh&ocirc;m r&uacute;t gọn</a>&nbsp;Advindeq ADT709B (5.6m) c&oacute; thể sử dụng chữ A v&agrave; I gi&uacute;p bạn linh hoạt l&agrave;m việc ở nhiều chiều cao v&agrave; địa h&igrave;nh kh&aacute;c nhau.</p>

<p>- Sản phẩm c&oacute; thể r&uacute;t gọn lại sản phẩm sau khi sử dụng, gi&uacute;p tiết kiệm tối đa diện t&iacute;ch cất giữ.</p>

<p>- Sản phẩm kh&ocirc;ng tốn diện t&iacute;ch nh&agrave;, dễ d&agrave;ng đặt trong xe &ocirc; t&ocirc; hoặc vận chuyển bằng xe m&aacute;y.</p>
', NULL, NULL, NULL, 1, 1, 1, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>Advindeq</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td><strong>Bảo h&agrave;nh</strong></td>
			<td>24 Th&aacute;ng</td>
		</tr>
		<tr>
			<td><strong>Chiều cao tối đa chữ A</strong></td>
			<td>2.80m</td>
		</tr>
		<tr>
			<td><strong>Chiều cao tối đa duỗi thẳng chữ I</strong></td>
			<td>5.6m</td>
		</tr>
		<tr>
			<td><strong>Chiều d&agrave;i r&uacute;t gọn</strong></td>
			<td>0.98m</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng sản phẩm</strong></td>
			<td>20.4 kg</td>
		</tr>
		<tr>
			<td><strong>Số bậc</strong></td>
			<td>2x9 bậc</td>
		</tr>
		<tr>
			<td><strong>Khoảng c&aacute;ch giữa c&aacute;c bậc</strong></td>
			<td>300mm</td>
		</tr>
		<tr>
			<td><strong>Tải trọng</strong></td>
			<td>150kg</td>
		</tr>
		<tr>
			<td><strong>Ti&ecirc;u chuẩn ch&acirc;u &acirc;u</strong></td>
			<td>EN131, EN14183, CE.</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (67, N'006-710', N'Thang nhôm chữ A 6 bậc Advindeq APS-06', 2400000.0000, NULL, NULL, NULL, 33, 232, N'Thang nhôm chữ A 6 bậc Advindeq APS-06 chất lượng, giá tốt. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><strong><a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-chu-a_175.html">Thang nh&ocirc;m chữ A</a>&nbsp;6 bậc Advindeq APS-06&nbsp;</strong>l&agrave; sản phẩm cao cấp của thương hiệu Advindeq Đ&agrave;i Loan,<strong>&nbsp;</strong>được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại.&nbsp;<strong><a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;Advindeq&nbsp;</strong>được nhiều người tin d&ugrave;ng với chất lượng đảm bảo, t&iacute;nh tiện lợi, linh hoạt v&agrave; gi&aacute; cả hợp l&yacute;.&nbsp;<strong>Thang Advindeq APS-06</strong>&nbsp;sản xuất theo ti&ecirc;u chuẩn của Ch&acirc;u &Acirc;u EN131, EN14183, CE.<br />
<br />
&nbsp;</p>

<p><a href="http://www.thegioithangnhom.com/data/bt4/thang-nhom-rut-gon-kn-r32-1.jpg"><img alt="" src="http://www.thegioithangnhom.com/data/bt6/thang-nhom-chu-a-dai-loan-6-bac-advindeq-aps-06.jpg" /></a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>C&Ocirc;NG DỤNG</strong></p>

<p>&nbsp;</p>

<p>-&nbsp;<strong>Thang nh&ocirc;m chữ A tay vịn Advindeq APS-06&nbsp;</strong>l&agrave; một trong những vật dụng quan trọng gia đ&igrave;nh mỗi khi cần sửa chữa những đồ điện tử ở tr&ecirc;n cao như đ&egrave;n&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/tuyp_1731.html">tu&yacute;p</a>, trần nh&agrave;, quạt trần, trang tr&iacute;,.... hay l&agrave; để qu&eacute;t trần hay sơn sửa.&nbsp;<br />
- Sản phẩm th&iacute;ch hợp d&ugrave;ng cho nh&agrave; kho, trong gia đ&igrave;nh, văn ph&ograve;ng.</p>

<p>&nbsp;</p>

<p><strong>ĐẶC ĐIỂM NỔI BẬT</strong></p>

<p>&nbsp;</p>

<p><em><strong>Thiết kế linh hoạt, tiện lợi:</strong></em></p>

<p>-&nbsp;<strong>Thang nh&ocirc;m chữ A Advindeq APS-06&nbsp;</strong><br />
- Bậc thang được thiết kế với k&iacute;ch thước ph&ugrave; hợp cho người sử dụng dễ d&agrave;ng thao t&aacute;c khi ở tr&ecirc;n cao. Với trọng lượng chỉ 9,74 kg, c&oacute; thể dễ d&agrave;ng di chuyển.<br />
- Thang l&agrave;m bằng nh&ocirc;m, gọn nhẹ dễ cất giữ v&agrave; sử dụng.<br />
&nbsp;</p>

<p><em><strong>An to&agrave;n, chắc chắn:</strong></em></p>

<p>- C&aacute;c thanh ray v&agrave; khung được chế tạo từ hợp kim nh&ocirc;m cao cấp v&agrave; c&oacute; độ an to&agrave;n cao đảm bảo tầm nh&igrave;n khi sử dụng.<br />
- Bề mặt bậc thang được thiết kế chống trượt, đảm bảo an to&agrave;n khi leo v&agrave; chắc chắn cho người sử dụng<br />
- C&aacute;c khung b&ecirc;n trong được bao bọc để tăng cường bảo vệ kết cấu sản phẩm trong qu&aacute; tr&igrave;nh sử dụng, bảo quản, tải trọng v&agrave; vận chuyển.<br />
- Thang được gia cố bằng c&aacute;c niềng bằng th&eacute;p mạ kẽm ph&iacute;a trước để tăng cường độ bền cứng cho thang.<br />
- Thang chắc chắn, chịu được trọng lượng lớn với 150kg.<br />
- Thiết kế theo ti&ecirc;u chuẩn an to&agrave;n của Ch&acirc;u &Acirc;u.</p>

<p>&nbsp;</p>

<p><strong>Quy tắc sử dụng thang an to&agrave;n:</strong><br />
&nbsp;</p>

<p>-&nbsp;Thang phải được sử dụng ở tr&ecirc;n mặt phẳng v&agrave; chắc chắn.</p>

<p>- Kh&ocirc;ng n&ecirc;n sử dụng thang khi bạn đang đeo găng tay c&oacute; dầu mỡ, trơn trượt / hoặc gi&agrave;y d&eacute;p kh&ocirc;ng đủ an to&agrave;n</p>

<p>- Bậc thang, bề mặt s&agrave;n, điểm tựa thang...kh&ocirc;ng n&ecirc;n để d&iacute;nh dầu mỡ v&agrave;o.</p>

<p>- Tuyệt đối kh&ocirc;ng để nhiều người l&agrave;m việc tr&ecirc;n một chiếc thang nếu thang chỉ thiết kế d&agrave;nh cho một người.&nbsp;</p>

<p>- Kh&ocirc;ng bao giờ được nhảy hoặc trượt xuống từ một c&aacute;i thang.</p>

<p>- C&aacute;c ống thang phải được giữ sạch. C&aacute;c vết bẩn, keo tr&eacute;t, vệt sơn&hellip; cần phải được ch&ugrave;i sạch sau khi sử dụng. C&aacute;c bậc thang cũng phải được ch&ugrave;i sạch.&nbsp;</p>

<p>- Kh&ocirc;ng sử dụng thang qu&aacute; tải trọng cho ph&eacute;p.</p>

<p>&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như</strong>&nbsp;l&agrave; đại l&yacute; uy t&iacute;n Chuy&ecirc;n ph&acirc;n phối c&aacute;c sản phẩm Thang nh&ocirc;m cao cấp ch&iacute;nh h&atilde;ng. Đặc biệt,&nbsp;<strong>Thang nh&ocirc;m chữ A tay vịn Advindeq APS-06&nbsp;</strong>chất lượng, gi&aacute; tốt.&nbsp;</p>

<p>&nbsp;</p>

<p>Nếu c&oacute; nhu cầu sử dụng&nbsp;<strong>Thang nh&ocirc;m</strong>, xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;hoặc trực tiếp đến văn ph&ograve;ng giao dịch để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.<br />
Hoặc truy cập v&agrave;o trang Web w.w.w.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.<br />
Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi của bạn sau khi sử dụng Sản phẩm của C&ocirc;ng ty ch&uacute;ng t&ocirc;i.</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 1, 1, 2, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Thang nh&ocirc;m chữ A</td>
		</tr>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>Advindeq</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Đ&agrave;i Loan</td>
		</tr>
		<tr>
			<td><strong>Số bậc :</strong></td>
			<td>6 bậc</td>
		</tr>
		<tr>
			<td><strong>Chiều cao thang khi mở chữ A :</strong></td>
			<td>2025mm</td>
		</tr>
		<tr>
			<td><strong>Chiều cao thang khi dựng đứng ( gấp gọn ) :</strong></td>
			<td>2150mm</td>
		</tr>
		<tr>
			<td><strong>Chiều rộng :</strong></td>
			<td>585mm</td>
		</tr>
		<tr>
			<td><strong>Chiều s&acirc;u :</strong></td>
			<td>1340mm</td>
		</tr>
		<tr>
			<td><strong>Khoảng c&aacute;ch giữa c&aacute;c bậc :</strong></td>
			<td>250mm</td>
		</tr>
		<tr>
			<td><strong>Tải trọng cho ph&eacute;p :</strong></td>
			<td>150kg</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng :</strong></td>
			<td>9,74 kg</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước cả bao b&igrave; :</strong></td>
			<td>2185 x 585 x 130mm</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (68, N'028-718', N'Thang trượt cách điện sợi thủy tinh Advindeq FX-28', 11950000.0000, NULL, NULL, NULL, 33, 233, N'Thang trượt cách điện Advindeq FX-28 chất lượng, giá tốt. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><strong>Thang trượt c&aacute;ch điện sợi thuỷ tinh Advindeq FX-28&nbsp;</strong>l&agrave; sản phẩm cao cấp của thương hiệu Advindeq Đ&agrave;i Loan,<strong>&nbsp;</strong>được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại.&nbsp;<strong><a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;Advindeq&nbsp;</strong>được nhiều người tin d&ugrave;ng với chất lượng đảm bảo, t&iacute;nh tiện lợi, linh hoạt v&agrave; gi&aacute; cả hợp l&yacute;.&nbsp;<strong>Thang trượt Advindeq FX-28</strong>&nbsp;sản xuất theo ti&ecirc;u chuẩn an to&agrave;n của Ch&acirc;u &Acirc;u EN131, EN14183, CE.<br />
<br />
&nbsp;</p>

<p><img alt="" src="http://www.thegioithangnhom.com/data/bt2/thang-rut-cach-dien-soi-thuy-tinh-advindeq-fx-28.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>C&Ocirc;NG DỤNG</strong></p>

<p>&nbsp;</p>

<p>-&nbsp;<strong>Thang trượt c&aacute;ch điện sợi thuỷ tinh Advindeq FX-28&nbsp;</strong>được sử dụng linh hoạt trong những c&ocirc;ng việc sữa chữa hay lắp đặt c&aacute;c đồ d&ugrave;ng ở vị tr&iacute; cao. C&oacute; thể sử dụng tại gia đ&igrave;nh, căn hộ, văn ph&ograve;ng c&ocirc;ng ty.</p>

<p>- Được thiết kế ph&ugrave; hợp với c&ocirc;ng việc của c&aacute;c kỹ sư điện sữa chữa c&aacute;c đường d&acirc;y.<br />
<br />
&nbsp;</p>

<p><strong>ĐẶC ĐIỂM NỔI BẬT</strong></p>

<p>&nbsp;</p>

<p><em><strong>Thiết kế linh hoạt, tiện lợi:</strong></em><br />
- Thang c&oacute; thể k&eacute;o d&agrave;i đến độ cao mong muốn, c&aacute;c&nbsp;khoảng c&aacute;ch&nbsp;bậc thang được t&iacute;nh to&aacute;n kĩ lưỡng ph&ugrave; hợp với nhiều người.&nbsp;</p>

<p>-&nbsp;<strong>Thang trượt Advindeq FX-28</strong>&nbsp;c&oacute; thể trượt gọn v&agrave; dễ d&agrave;ng cất giữ chiếc thang n&agrave;y ở bất cứ đ&acirc;u trong ng&ocirc;i nh&agrave; của m&igrave;nh.</p>

<p>&nbsp;</p>

<p><em><strong>An to&agrave;n, chắc chắn:</strong></em></p>

<p>-&nbsp;<strong>Thang trượt Advindeq FX-28</strong>&nbsp;l&agrave;m từ vật liệu kh&ocirc;ng dẫn điện v&agrave; tay vịn l&agrave;m bằng c&aacute;c sợi thủy tinh c&oacute; khả năng hiển thị quan s&aacute;t tốt nhất trong ngưỡng an to&agrave;n.</p>

<p>- C&aacute;c nấc thang c&oacute; thiết kế r&aacute;p, &nbsp;răng cưa ngăn chặn v&agrave; chống trượt, an to&agrave;n v&agrave; chắc chắn khi leo thang.</p>

<p>- C&aacute;c m&oacute;c nh&ocirc;m đ&ocirc;i d&ugrave;ng để chặn m&oacute;c c&aacute;c khung thang th&ecirc;m an to&agrave;n</p>

<p>- Đổi mức, n&acirc;ng cao thang với r&ograve;ng rọc tr&ecirc;n đầu thang</p>

<p>- C&aacute;c đế ch&acirc;n được thiết kế nặng, xoay v&agrave; c&oacute; cao su chống trượt.</p>

<p>- Phần chia r&ograve;ng rọc v&agrave; hệ thống khung với thiết bị kh&oacute;a ở độ cao cần thiết</p>

<p>- Được thiết kế ph&ugrave; hợp với c&ocirc;ng việc của c&aacute;c kỹ sư điện sửa chữa c&aacute;c đường d&acirc;y hoặc tương tự&nbsp;</p>

<p>- Tất cả đi k&egrave;m với d&acirc;y đeo bổ sung, tay nắm.&nbsp;</p>

<p><strong>- C&aacute;c t&iacute;nh năng an to&agrave;n:</strong></p>

<p>+ Cực d&acirc;y đeo: Cung cấp để gia tăng sự ổn định</p>

<p>+ Tay nắm: đặc biệt dễ d&agrave;ng với c&aacute;c thiết kế tay nắm&nbsp;</p>

<p>+ M&oacute;c c&aacute;p: ( c&oacute; thể mua th&ecirc;m)</p>

<p>+ Độ nặng ch&acirc;n trục đứng: trục lớn chịu tải trọng nặng với c&aacute;c miếng đệm cao su chống trượt v&agrave; băng lựa chọn.</p>

<p>+ Top cap: nắp tr&ecirc;n l&agrave;m bằng cao su v&agrave; đảm bảo, bảo vệ tốt nhất</p>

<p>&nbsp;</p>

<p><strong>Quy tắc sử dụng an to&agrave;n đối với&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom-truot_176.html">thang nh&ocirc;m trượt</a>:</strong><br />
&nbsp;</p>

<p>-&nbsp;Thang phải được sử dụng ở tr&ecirc;n mặt phẳng v&agrave; chắc chắn.</p>

<p>- Kh&ocirc;ng n&ecirc;n sử dụng thang khi bạn đang đeo găng tay c&oacute; dầu mỡ, trơn trượt / hoặc gi&agrave;y d&eacute;p kh&ocirc;ng đủ an to&agrave;n</p>

<p>- Bậc thang, bề mặt s&agrave;n, điểm tựa thang...kh&ocirc;ng n&ecirc;n để d&iacute;nh dầu mỡ v&agrave;o.</p>

<p>- Tuyệt đối kh&ocirc;ng để nhiều người l&agrave;m việc tr&ecirc;n một chiếc thang nếu thang chỉ thiết kế d&agrave;nh cho một người.&nbsp;</p>

<p>- Kh&ocirc;ng bao giờ được nhảy hoặc trượt xuống từ một c&aacute;i thang.</p>

<p>- C&aacute;c ống thang phải được giữ sạch. C&aacute;c vết bẩn, keo tr&eacute;t, vệt sơn&hellip; cần phải được ch&ugrave;i sạch sau khi sử dụng. C&aacute;c bậc thang cũng phải được ch&ugrave;i sạch.&nbsp;</p>

<p>- Kh&ocirc;ng sử dụng thang qu&aacute; tải trọng cho ph&eacute;p.</p>

<p>&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như</strong>&nbsp;l&agrave; đại l&yacute; uy t&iacute;n Chuy&ecirc;n ph&acirc;n phối c&aacute;c sản phẩm Thang nh&ocirc;m cao cấp ch&iacute;nh h&atilde;ng. Đặc biệt,&nbsp;<strong>Thang nh&ocirc;m trượt c&aacute;ch điện Advindeq FX-28&nbsp;</strong>chất lượng, gi&aacute; tốt.&nbsp;</p>

<p>&nbsp;</p>

<p>Nếu c&oacute; nhu cầu sử dụng&nbsp;<strong>Thang Nh&ocirc;m</strong>, xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;hoặc trực tiếp đến văn ph&ograve;ng giao dịch để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.<br />
Hoặc truy cập v&agrave;o trang Web w.w.w.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.<br />
Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi sau khi sử dụng Thang Nh&ocirc;m của bạn.&nbsp;</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Thang nh&ocirc;m trượt</td>
		</tr>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>Advindeq</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Đ&agrave;i Loan</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước :</strong></td>
			<td>28&quot;</td>
		</tr>
		<tr>
			<td><strong>Chiều cao r&uacute;t gọn :</strong></td>
			<td>4410m</td>
		</tr>
		<tr>
			<td><strong>Chiều cao tối đa :</strong></td>
			<td>7400m</td>
		</tr>
		<tr>
			<td><strong>Chiều rộng cơ sở :</strong></td>
			<td>415mm.</td>
		</tr>
		<tr>
			<td><strong>Chiều rộng ch&oacute;p thang :</strong></td>
			<td>395mm.</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng :</strong></td>
			<td>26.96kg</td>
		</tr>
		<tr>
			<td><strong>Tải trọng :</strong></td>
			<td>150kg</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước cả bao b&igrave; :</strong></td>
			<td>4410 x 460 x 140mm</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (69, N'AV302', N'Thang nhôm tay vịn Advindeq AV302', 1170000.0000, NULL, NULL, NULL, 33, 234, N'Thang nhôm tay vịn Advindeq AV302 chất lượng, giá tốt. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><strong><a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">Thang nh&ocirc;m</a>&nbsp;tay vịn Advindeq AV302&nbsp;</strong>l&agrave; sản phẩm cao cấp của thương hiệu Advindeq Đ&agrave;i Loan,<strong>&nbsp;</strong>được sản xuất tr&ecirc;n d&acirc;y chuyền c&ocirc;ng nghệ hiện đại.&nbsp;<strong>Thang nh&ocirc;m Advindeq&nbsp;</strong>được nhiều người tin d&ugrave;ng với chất lượng đảm bảo, t&iacute;nh tiện lợi, linh hoạt v&agrave; gi&aacute; cả hợp l&yacute;.<br />
<br />
&nbsp;</p>

<p><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/AV302.JPG" /></p>

<p>&nbsp;</p>

<p><strong>C&Ocirc;NG DỤNG</strong></p>

<p>&nbsp;</p>

<p>- Được sử dụng trong nh&agrave; hoặc ở ngo&agrave;i trời ph&ugrave; hợp với nhiều mục đ&iacute;ch c&ocirc;ng việc kh&aacute;c nhau</p>

<p>- T&iacute;nh tiện lợi của&nbsp;<strong>Thang nh&ocirc;m Advindeq AV302</strong>&nbsp;gi&uacute;p bạn dọn dẹp, lau ch&ugrave;i, vệ sinh c&aacute;c thiết bị tr&ecirc;n cao 1 c&aacute;ch linh hoạt v&agrave; nhanh ch&oacute;ng.&nbsp;<br />
&nbsp;</p>

<p><strong>ĐẶC ĐIỂM NỔI BẬT</strong></p>

<p>&nbsp;</p>

<p><em><strong>Thiết kế linh hoạt, tiện lợi, thẩm mỹ:</strong></em><br />
- Thang được l&agrave;m từ hợp kim nh&ocirc;m cao cấp, phủ lớp sơn tĩnh điện m&agrave;u cam. Gi&uacute;p chiếc thang nh&igrave;n đẹp mắt v&agrave; hiện đại hơn.</p>

<p>- K&iacute;ch thước nhỏ gọn, trọng lượng nhẹ n&ecirc;n tiết kiệm kh&ocirc;ng gian lưu trữ v&agrave; dễ d&agrave;ng mang theo khi di chuyển địa điểm c&ocirc;ng việc.</p>

<p>- Khả năng xếp gọn c&oacute; thể dễ d&agrave;ng cất giữ chiếc th&agrave;ng n&agrave;y ở bất cứ đ&acirc;u trong ng&ocirc;i nh&agrave; của m&igrave;nh.</p>

<p>&nbsp;</p>

<p><em><strong>An to&agrave;n, chắc chắn:</strong></em></p>

<p>- Thang hợp kim nh&ocirc;m chắc, cứng. Được phủ lớp sơn tĩnh điện si&ecirc;u bền, chống gỉ s&eacute;t v&agrave; c&aacute;ch điện. Gi&uacute;p người d&ugrave;ng y&ecirc;n t&acirc;m khi sử dụng.<br />
- Thang c&oacute; tay vịn tạo cảm gi&aacute;c an to&agrave;n cho người sử dụng.&nbsp;<br />
- Thang c&oacute; nền tảng chắc chắn với 4 điểm tiếp x&uacute;c với mặt đất.<br />
<br />
<strong>Quy tắc sử dụng an to&agrave;n đối với thang nh&ocirc;m ghế tay vịn:</strong><br />
&nbsp;</p>

<p>- Nếu bạn cảm thấy mệt mỏi, ch&oacute;ng mặt, hoặc dễ bị mất thăng bằng th&igrave; h&atilde;y tr&aacute;nh xa c&aacute;c bậc thang.</p>

<p>- Những người dễ d&agrave;ng mệt mỏi hoặc c&oacute; những hạn chế về thể chất, như dễ ngất xỉu, sợ độ cao hoặc đang sử dụng c&aacute;c lọi thuốc theo toa c&oacute; thể g&acirc;y suy giảm thể chất kh&ocirc;ng được ph&eacute;p sử dụng thang thang nh&ocirc;m ghế.</p>

<p>- Thang nh&ocirc;m ghế tay vịn chủ yếu được sử dụng trong nh&agrave;, kh&ocirc;ng sử dụng thang trong gi&oacute; hoặc b&atilde;o.</p>

<p>- Mang gi&agrave;y chống trượt, sạch khi leo l&ecirc;n thang. Gi&agrave;y c&oacute; đế da, đế phẳng hoặc cao g&oacute;t... kh&ocirc;ng th&iacute;ch hợp để sử dụng với c&aacute;c loại thang.</p>

<p>- Kh&ocirc;ng n&ecirc;n sử dụng thang nh&ocirc;m ghế khi bạn đang đeo găng tay c&oacute; dầu mỡ, trơn trượt / hoặc gi&agrave;y d&eacute;p kh&ocirc;ng đủ an to&agrave;n.</p>

<p>- Bậc thang, bề mặt s&agrave;n, điểm tựa thang...kh&ocirc;ng n&ecirc;n để d&iacute;nh dầu mỡ v&agrave;o.</p>

<p>- Tuyệt đối kh&ocirc;ng để nhiều người l&agrave;m việc tr&ecirc;n một chiếc thang nếu thang chỉ thiết kế d&agrave;nh cho một người.&nbsp;</p>

<p>- Kh&ocirc;ng bao giờ được nhảy hoặc trượt xuống từ một c&aacute;i thang.<br />
&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như</strong>&nbsp;l&agrave; đại l&yacute; uy t&iacute;n Chuy&ecirc;n ph&acirc;n phối c&aacute;c sản phẩm Thang nh&ocirc;m cao cấp ch&iacute;nh h&atilde;ng. Đặc biệt,&nbsp;<strong>Thang nh&ocirc;m tay vịn Advindeq AV302&nbsp;</strong>chất lượng, gi&aacute; tốt.&nbsp;</p>

<p>&nbsp;</p>

<p>Nếu c&oacute; nhu cầu sử dụng&nbsp;<strong>Thang Nh&ocirc;m</strong>, xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;hoặc trực tiếp đến văn ph&ograve;ng giao dịch để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn. Hoặc truy cập v&agrave;o trang Web w.w.w.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp. Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi sau khi sử dụng Thang Nh&ocirc;m của bạn.&nbsp;</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 0, 1, 2, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Thang nh&ocirc;m ghế</td>
		</tr>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>Advindeq</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Đ&agrave;i Loan</td>
		</tr>
		<tr>
			<td><strong>C&ocirc;ng nghệ</strong></td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td><strong>Ti&ecirc;u chuẩn</strong></td>
			<td>EN131, EN14183 CE</td>
		</tr>
		<tr>
			<td><strong>Chất liệu</strong></td>
			<td>Nh&ocirc;m</td>
		</tr>
		<tr>
			<td><strong>Số bậc</strong></td>
			<td>02 bậc</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u sắc</strong></td>
			<td>Cam, trắng</td>
		</tr>
		<tr>
			<td><strong>Tải trọng</strong></td>
			<td>150Kg</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước khi mở</strong></td>
			<td>93x46x52cm</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước gấp gọn</strong></td>
			<td>103x45x15cm</td>
		</tr>
		<tr>
			<td><strong>Khoảng c&aacute;ch c&aacute;c bậc thang</strong></td>
			<td>30cm</td>
		</tr>
		<tr>
			<td><strong>Khoảng c&aacute;ch thang dưới c&ugrave;ng</strong></td>
			<td>52cm</td>
		</tr>
		<tr>
			<td><strong>Bảo h&agrave;nh</strong></td>
			<td>12 Th&aacute;ng ch&iacute;nh h&atilde;ng</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (70, N'ADS402', N'Thang ghế 2 bậc Advindeq ADS402', 550000.0000, NULL, NULL, NULL, 33, 236, N'Thang ghế 2 bậc Advindeq ADS402 chất lượng giá tốt. Tư vấn sản phẩm phù hợp. Bảo hành chính hãng. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><strong>Thang ghế 2 bậc Advindeq ADS402</strong>&nbsp;l&agrave; thiết bị cao cấp đến từ nh&agrave; sản xuất thang v&agrave;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/xe-day_1774.html">&nbsp;xe đẩy</a>&nbsp;h&agrave;ng nổi tiếng&nbsp;<strong>Advindeq</strong>. Được sản xuất theo quy tr&igrave;nh c&ocirc;ng nghệ ti&ecirc;n tiến ,&nbsp;<strong>Advindeq&nbsp;</strong>sẽ đem đến cho bạn một sản phẩm c&oacute; chất lượng tuyệt vời, với sự bền vững theo thời gian, an toàn tuy&ecirc;̣t đ&ocirc;́i. Đ&acirc;y chắc chắn sẽ l&agrave; người bạn đồng h&agrave;nh tuyệt vời d&agrave;nh cho bạn.<br />
&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/Thang%20gh%E1%BA%BF%202%20b%E1%BA%ADc%20Advindeq%20ADS402.jpg" /></p>

<p><strong>C&ocirc;ng dụng:</strong></p>

<p>&ndash;&nbsp;<strong>Thang ghế 2 bậc Advindeq ADS402</strong>&nbsp;được sử dụng trong nhiều hoạt động như: gắn biển quảng c&aacute;o, vệ sinh k&iacute;nh, sửa chữa c&aacute;c vật dụng điện tr&ecirc;n cao, sơn cửa&hellip; rất tiện lợi.<br />
<br />
<strong>Đặc trưng nổi bật:</strong><br />
-&nbsp;<strong>Thang ghế 2 bậc Advindeq ADS402</strong>&nbsp;l&agrave; sản phẩm được sản xuất từ chất liệu hợp kim nh&ocirc;m cao cấp, được phủ lớp sơn b&oacute;ng, c&oacute; khả năng chống gỉ, đem lại độ bền tuyệt đối, vững chắc theo thời gian.<br />
- Ch&acirc;n thang&nbsp;<strong>Advindeq&nbsp;</strong>v&ocirc; c&ugrave;ng vững chắc, chịu lực cực tốt, tải trọng l&ecirc;n đến 150kg v&agrave; c&oacute; thể đứng vững tr&ecirc;n nhiều địa h&igrave;nh kh&aacute;c nhau.<br />
- Bậc thang được thiết kế bản to gi&uacute;p người sử dụng kh&ocirc;ng cảm gi&aacute;c mỏi ch&acirc;n khi ở tr&ecirc;n thang l&acirc;u.<br />
- B&ecirc;n cạnh đ&oacute;, ch&acirc;n thang sử dụng&nbsp;n&uacute;t bịt bằng nhựa ABS bền chắc&nbsp;với diện t&iacute;ch tiếp x&uacute;c lớn, sinh ra lực ma s&aacute;t cao, khả năng chống trượt rất tuyệt vời, mang lại sự an to&agrave;n tuyệt đối cho người sử dụng.<br />
- Tay vịn giúp đứng vững ở đ&ocirc;̣ cao an toàn và có tác dụng d&ecirc;̃ mang vác d&ecirc;̃ dàng hơn với hình vòng cung tạo cho thang có đ&ocirc;̣ th&acirc;̉m mỹ cao.<br />
- Thang th&iacute;ch hợp sử dụng cho cả phụ nữ v&agrave; người lớn tuổi do thang c&oacute; bản to dễ leo, đứng an to&agrave;n,...</p>

<p>- Với chiều cao tối đa đạt 80cm,&nbsp;<strong>thang&nbsp;</strong><strong>ghế 2 bậc</strong><strong>&nbsp;Advindeq</strong>&nbsp;được sử dụng rộng r&atilde;i ở khắp nơi m&agrave; vẫn đ&aacute;p ứng được nhu cầu của mọi người.</p>

<p>&nbsp;</p>

<p><strong>C&aacute;c quy tắc sử dụng thang an to&agrave;n:</strong></p>

<p>- Nếu bạn cảm thấy mệt mỏi, ch&oacute;ng mặt, hoặc dễ bị mất thăng bằng th&igrave; h&atilde;y tr&aacute;nh xa c&aacute;c bậc thang.</p>

<p>- Những người dễ d&agrave;ng mệt mỏi hoặc c&oacute; những hạn chế về thể chất, như dễ ngất xỉu, sợ độ cao hoặc đang sử dụng c&aacute;c lọi thuốc theo toa c&oacute; thể g&acirc;y suy giảm thể chất kh&ocirc;ng được ph&eacute;p sử dụng thang&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/thang-nhom_31.html">thang nh&ocirc;m</a>&nbsp;ghế.</p>

<p>- Thang nh&ocirc;m ghế tay vịn chủ yếu được sử dụng trong nh&agrave;, kh&ocirc;ng sử dụng thang trong gi&oacute; hoặc b&atilde;o.</p>

<p>- Mang gi&agrave;y chống trượt, sạch khi leo l&ecirc;n thang. Gi&agrave;y c&oacute; đế da, đế phẳng hoặc cao g&oacute;t... kh&ocirc;ng th&iacute;ch hợp để sử dụng với c&aacute;c loại thang.</p>

<p>- Kh&ocirc;ng n&ecirc;n sử dụng thang nh&ocirc;m ghế khi bạn đang đeo găng tay c&oacute; dầu mỡ, trơn trượt / hoặc gi&agrave;y d&eacute;p kh&ocirc;ng đủ an to&agrave;n.</p>

<p>- Bậc thang, bề mặt s&agrave;n, điểm tựa thang...kh&ocirc;ng n&ecirc;n để d&iacute;nh dầu mỡ v&agrave;o.</p>

<p>- Tuyệt đối kh&ocirc;ng để nhiều người l&agrave;m việc tr&ecirc;n một chiếc thang nếu thang chỉ thiết kế d&agrave;nh cho một người.&nbsp;</p>

<p>- Kh&ocirc;ng bao giờ được nhảy hoặc trượt xuống từ một c&aacute;i thang.</p>

<p>&nbsp;</p>

<p>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như&nbsp;l&agrave; Nh&agrave; ph&acirc;n phối c&aacute;c Sản phẩm&nbsp;<strong>Advindeq</strong>&nbsp;ch&iacute;nh thức tại TP. Hồ Ch&iacute; Minh.<br />
Ketnoitieudung.vn cung cấp c&aacute;c loại&nbsp;<strong>Thang ghế</strong><strong>&nbsp;</strong>phục vụ cho mọi nhu cầu c&ocirc;ng việc của bạn. Sản phẩm đảm bảo chất lượng, ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt hơn so với gi&aacute; thị trường.</p>

<p><br />
Q&uacute;y kh&aacute;ch h&agrave;ng c&oacute; nhu cầu sử dụng sản phẩm của c&ocirc;ng ty ch&uacute;ng t&ocirc;i, xin vui l&ograve;ng li&ecirc;n hệ&nbsp;hotline&nbsp;(08) 3971 8011- (08) 3975 6686&nbsp;hoặc đến trực tiếp&nbsp;địa chỉ văn ph&ograve;ng giao dịch&nbsp;(b&ecirc;n dưới)&nbsp;để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc.&nbsp;<br />
<br />
Hoặc truy cập website&nbsp;www.ketnoitieudung.vn&nbsp;để lựa chọn v&agrave; đặt h&agrave;ng online c&aacute;c sản phẩm ph&ugrave; hợp với nhu cầu.<br />
<br />
Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc v&agrave; phản hồi của bạn sau khi sử dụng sản phẩm.<br />
<br />
Nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Nh&agrave; sản xuất</strong></td>
			<td>Advindeq</td>
		</tr>
		<tr>
			<td><strong>Ti&ecirc;u chuẩn</strong></td>
			<td>Ch&acirc;u &Acirc;u EN131, EN14183, CE</td>
		</tr>
		<tr>
			<td><strong>Số bậc</strong></td>
			<td>2 bậc</td>
		</tr>
		<tr>
			<td><strong>Chất liệu</strong></td>
			<td>th&eacute;p sơn tĩnh điện m&agrave;u trắng, mặt s&agrave;n xanh n&otilde;n chuối</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước khi mở thang</strong></td>
			<td>46 x 56 x 80.8cm</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước khi gấp gọn</strong></td>
			<td>91 (L) x 5 (W) x 46.5 (H) cm</td>
		</tr>
		<tr>
			<td><strong>Khoảng c&aacute;ch giữa c&aacute;c bậc</strong></td>
			<td>23.5 cm</td>
		</tr>
		<tr>
			<td><strong>Tải trọng</strong></td>
			<td>150 kg</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng sản phẩm</strong></td>
			<td>3,5 kg</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng bao b&igrave;</strong></td>
			<td>4 kg</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (71, N'90VP5', N'Pa lăng xích kéo tay 10 tấn 5m Nitto 90VP5', 9189000.0000, NULL, NULL, NULL, 34, 237, N'Pa lăng xích kéo tay 5 mét 10 tấn Nitto 90VP5 chất lượng, giá rẻ. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><strong>Pa lăng x&iacute;ch k&eacute;o tay 5m 10 tấn Nitto 90VP5&nbsp;</strong>được sản xuất tại Nhật Bản với những t&iacute;nh năng ưu việt, đảm bảo an to&agrave;n khi sử dụng. L&agrave; thiết bị n&acirc;ng đỡ hữu &iacute;ch cho những ai c&oacute; nhu cầu.&nbsp;<strong>Pa lăng x&iacute;ch Nitto</strong>&nbsp;sản xuất ho&agrave;n to&agrave;n theo bộ ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u quy định.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong><img alt="" src="http://thoigia.com.vn/data/ck/images/20vp5.jpg" /></strong></p>

<p><br />
<strong>Ứng dụng:</strong><br />
<br />
-&nbsp;<strong>Pa lăng x&iacute;ch k&eacute;o tay Nitto 90VP5</strong>&nbsp;được sử dụng trong c&aacute;c lĩnh vực sản xuất thi c&ocirc;ng trong xưởng, khai th&aacute;c mỏ, n&ocirc;ng nghiệp, điện lực, x&acirc;y dựng cũng như lắp đặt m&aacute;y m&oacute;c, bốc dỡ h&agrave;ng, n&acirc;ng hạ h&agrave;ng trong nh&agrave; ga, bến t&agrave;u, khoa b&atilde;i.<br />
- Ngo&agrave;i ra c&ograve;n d&ugrave;ng để hỗ trợ sữa chữa m&aacute;y m&oacute;c thiết bị.<br />
<br />
<strong>Đặc trưng:</strong><br />
<br />
-&nbsp;<strong>Pa lăng x&iacute;ch 90VP5</strong>&nbsp;c&oacute; thể xoay 360 độ quanh m&oacute;c treo nhằm dễ d&agrave;ng xử l&yacute; t&igrave;nh huống k&eacute;o vật nặng.<br />
- K&iacute;ch thước nhỏ gọn, đơn giản về mặt kết cấu, trọng lượng nhẹ.<br />
- Hiệu suất k&eacute;o phụ thuộc v&agrave;o sức của từng người.<br />
- Kh&ocirc;ng g&acirc;y &ocirc; nhiễm m&ocirc;i trường, vận h&agrave;nh, sử dụng dễ d&agrave;ng.<br />
-<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/pa-lang_1772.html">&nbsp;Pa lăng</a>&nbsp;x&iacute;ch được trang bị hệ thống chốt k&eacute;p nhằm tăng cường an to&agrave;n cho người sử dụng.<br />
&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như&nbsp;</strong>l&agrave; Nh&agrave; ph&acirc;n phối&nbsp;<strong>Sản phẩm Pa lăng x&iacute;ch Nitto</strong>&nbsp;ch&iacute;nh thức tại TP. Hồ Ch&iacute; Minh. Ketnoitieudung.vn lu&ocirc;n cung cấp cho bạn c&aacute;c loại&nbsp;<strong>Pa lăng x&iacute;ch</strong>&nbsp;phục vụ cho mọi lĩnh vực chất lượng, ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt.</p>

<p>&nbsp;</p>

<p>Nếu bạn c&oacute; nhu cầu sử dụng Sản phẩm của c&ocirc;ng ty ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;&nbsp;<strong>(08) 3971 8011 - (08) 3975 6686</strong>&nbsp;hoặc trực tiếp đến&nbsp;<strong>địa chỉ văn ph&ograve;ng giao dịch</strong>:&nbsp;<strong>106 T&aacute;i thiết, Phường 11, Quận T&acirc;n B&igrave;nh, TP. Hồ Ch&iacute; Minh. VN</strong>&nbsp;để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.</p>

<p>Hoặc truy cập v&agrave;o trang Web www.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.</p>

<p>&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi của bạn sau khi sử dụng Sản phẩm của ch&uacute;ng t&ocirc;i.</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!&nbsp;</p>
', NULL, NULL, NULL, 0, 1, 1, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Pa lăng x&iacute;ch k&eacute;o tay</td>
		</tr>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>Nitto</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td><strong>C&ocirc;ng nghệ</strong></td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td><strong>Tải n&acirc;ng</strong></td>
			<td>10 tấn</td>
		</tr>
		<tr>
			<td><strong>Chiều cao n&acirc;ng</strong></td>
			<td>5m</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>60kg</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (72, N'HL-110-LSMI', N'Xe đẩy hàng Jumbo HL-110', 1489000.0000, NULL, NULL, NULL, 35, 238, N'Xe đẩy hàng,xa đẩy tiền,xe day Jumbo,xe day,xe đẩy hàng chính hãng giá tốt', N'<p><strong>Xe đẩy h&agrave;ng Jumbo</strong>&nbsp;<strong>Th&aacute;i Lan</strong>&nbsp;được người d&ugrave;ng ưa chuộng bởi thiết kế th&acirc;n thiện v&agrave; dễ di chuyển. C&oacute; kiểu d&aacute;ng xe gọn nhưng tải trọng h&agrave;ng ho&aacute; lớn. Tay cầm chắc chắn, c&oacute; chốt gấp tay khi lưu trữ. Xe d&ugrave;ng l&acirc;u &iacute;t bị trầy xước do c&oacute; lớp ngo&agrave;i bảo vệ, đặc biệt mặt s&agrave;n s&aacute;ng b&oacute;ng gi&uacute;p cho việc vệ sinh dễ d&agrave;ng.<br />
<strong>Xe đẩy h&agrave;ng 4 b&aacute;nh Jumbo HL-110&nbsp;</strong>c&oacute; d&aacute;ng chắc chắn v&agrave; nhỏ gọn. K&iacute;ch thước được thết kế theo ti&ecirc;u chuẩn thế giới, ph&ugrave; hợp với mọi v&oacute;c d&aacute;ng người sử dụng. Được sản xuất tại Th&aacute;i Lan cho sản phẩm lu&ocirc;n chất lượng m&agrave; gi&aacute; cả lại vừa phải. C&ugrave;ng với những t&iacute;nh năng ưu Việt n&ecirc;n&nbsp;<strong>Xe đẩy Jumbo HL-110</strong>&nbsp;sẽ l&agrave;m bạn h&agrave;i l&ograve;ng v&agrave; l&agrave; sự lựa chọn tốt nhất cho bạn!<br />
&nbsp;</p>

<p><strong><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/HL-110C(1)(1).jpg" /><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/HL-110C(3)(2).jpg" /></strong></p>

<p><strong>C&ocirc;ng dụng:</strong><br />
<br />
-&nbsp;<strong>Xe đẩy h&agrave;ng 4 b&aacute;nh</strong>&nbsp;sử dụng chuy&ecirc;n d&ugrave;ng để vận chuyển h&agrave;ng ho&aacute; cho c&aacute;ch nh&agrave; h&agrave;ng, kh&aacute;ch sạn, ng&acirc;n h&agrave;ng, văn ph&ograve;ng nh&agrave; kho, si&ecirc;u thị,.....<br />
&nbsp;</p>

<p><strong>Ưu điểm của<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/xe-day_1774.html">&nbsp;Xe đẩy</a>&nbsp;Jumbo HL-110:</strong><br />
<br />
- Kiểu d&aacute;ng&nbsp;chắc chắn, nhỏ gọn dễ d&agrave;ng di chuyển.<br />
-&nbsp;Thiết kế th&ocirc;ng minh c&oacute; thể gấp gọn lại được, di chuyển nhẹ nh&agrave;ng.<br />
-&nbsp;Trang bị miếng nhựa bảo vệ cho tay đẩy &ecirc;m &aacute;i v&agrave; chắc chắn hơn<br />
-&nbsp;Tải trọng c&oacute; thể đẩy tối đa l&agrave; 170kg gi&uacute;p linh hoạt trong việc sử dụng<br />
-&nbsp;Thiết kế b&aacute;nh xe bằng cao su v&agrave; c&oacute; k&iacute;ch thước lớn 100mm di chuyển thuận lợi tr&ecirc;n mọi địa h&igrave;nh<br />
-&nbsp;Phần s&agrave;n l&agrave;m bằng th&eacute;p cứng s&aacute;ng b&oacute;ng.<br />
- Xe d&ugrave;ng l&acirc;u chống xầy do c&oacute; lớp ngo&agrave;i bảo vệ.<br />
&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như&nbsp;</strong>l&agrave; Nh&agrave; ph&acirc;n phối Sản phẩm&nbsp;<strong>Xe đẩy Jumbo</strong>&nbsp;ch&iacute;nh thức tại TP. Hồ Ch&iacute; Minh. Ketnoitieudung.vn lu&ocirc;n cung cấp cho bạn c&aacute;c loại&nbsp;<strong>Xe đẩy</strong>&nbsp;phục vụ cho mọi nhu cầu c&ocirc;ng việc, Sản phẩm chất lượng, ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt.</p>

<p>&nbsp;</p>

<p>Nếu bạn c&oacute; nhu cầu sử dụng Sản phẩm của c&ocirc;ng ty ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;<strong>(08) 3971 8011 - (08) 3975 6686&nbsp;</strong>hoặc trực tiếp đến&nbsp;<strong>địa chỉ văn ph&ograve;ng giao dịch</strong>:&nbsp;<strong>106 T&aacute;i thiết, Phường 11, Quận T&acirc;n B&igrave;nh, TP. Hồ Ch&iacute; Minh. VN&nbsp;</strong>để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.</p>

<p>Hoặc truy cập v&agrave;o trang Web www.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.</p>

<p>&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi của bạn sau khi sử dụng Sản phẩm của ch&uacute;ng t&ocirc;i.</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 1, 0, 2, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Hãng sản xu&acirc;́t</strong></td>
			<td>Jumbo</td>
		</tr>
		<tr>
			<td><strong>Xu&acirc;́t xứ</strong></td>
			<td>Thái Lan</td>
		</tr>
		<tr>
			<td><strong>Kiểu xe :</strong></td>
			<td>xe đẩy tay (Gấp được).</td>
		</tr>
		<tr>
			<td><strong>Đường k&iacute;nh b&aacute;nh xe</strong></td>
			<td>100mm</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước :</strong></td>
			<td>D&agrave;i 740 x Rộng 485</td>
		</tr>
		<tr>
			<td><strong>Cao (Tay đẩy)</strong></td>
			<td>860mm</td>
		</tr>
		<tr>
			<td><strong>M&agrave;u:</strong></td>
			<td>Xanh</td>
		</tr>
		<tr>
			<td><strong>Tải trọng :</strong></td>
			<td>170kg</td>
		</tr>
		<tr>
			<td><strong>Đường k&iacute;nh b&aacute;nh xe</strong></td>
			<td>100mm</td>
		</tr>
		<tr>
			<td><strong>S&agrave;n bằng</strong></td>
			<td>th&eacute;p</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (73, N'Sumo HB-210C', N'Xe đẩy hàng SUMO HB-210C', 2319000.0000, NULL, NULL, NULL, 36, 241, N'Xe đẩy hàng SUMO HB-210C chất lượng, giá rẻ. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><a href="http://www.ketnoitieudung.vn/xe-day/c1774/sumo.html">Xe đẩy SUMO</a>&nbsp;l&agrave; d&ograve;ng sản phẩm mới ra mắt tr&ecirc;n thị trường, được sản xuất tại Th&aacute;i Lan c&oacute; nhiều cải tiến kỹ thuật mới đ&aacute;p ứng nhu cầu của người ti&ecirc;u d&ugrave;ng. Xe được thiết kế cực kỳ chắc chắn, an to&agrave;n cho người sử dụng. Kiểu d&aacute;ng, mẫu m&atilde; sang trọng ph&ugrave; hợp với mọi y&ecirc;u cầu của c&ocirc;ng việc. D&ograve;ng<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/xe-day_1774.html">&nbsp;xe đẩy</a>&nbsp;h&agrave;ng 2 tầng, 3 tầng, lưới,...<br />
<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/xe-day_1774.html">Xe đẩy&nbsp;</a>hiện nay đang được sử dụng rất nhiều trong c&ocirc;ng việc vận chuyển, sản xuất h&agrave;ng ho&aacute;. N&oacute; g&oacute;p phần quan trọng trong việc giải ph&oacute;ng sức lao động của con người, giảm thiểu thời gian vận chuyển, tăng hiệu quả c&ocirc;ng việc.&nbsp;</p>

<p><a href="http://www.ketnoitieudung.vn/xe-day-hang-sumo-hb-210c_23044.html">Xe đẩy h&agrave;ng SUMO HB-210C</a>&nbsp;với những t&iacute;nh năng ưu Việt như độ bền cao, tải trọng lớn. Đặc biệt, xe đẩy c&ograve;n c&oacute; gi&aacute; th&agrave;nh đa dạng để người mua lựa chọn. Loại xe rẻ, tầm trung hay cao cấp đều c&oacute;.&nbsp;<strong>Xe đẩy SUMO</strong>&nbsp;đảm bảo sẽ l&agrave;m bạn h&agrave;i l&ograve;ng với những t&iacute;nh năng nổi bật n&agrave;y!<br />
&nbsp;</p>

<p><br />
<img alt="" src="http://thoigia.com.vn/data/ck/images/hl-110c.jpg" /></p>

<p>&nbsp;</p>

<p><strong>C&Ocirc;NG DỤNG:</strong></p>

<p>-&nbsp;<a href="http://www.ketnoitieudung.vn/xe-day-4-banh/c1782/sumo.html">Xe đẩy h&agrave;ng 4 b&aacute;nh SUMO</a>&nbsp;được d&ugrave;ng để vận chuyển c&aacute;c sản phẩm c&oacute; khối lượng lớn trong nh&agrave; m&aacute;y, kho, xưởng, văn ph&ograve;ng, si&ecirc;u thị, bến cảng... dễ d&agrave;ng v&agrave; nhanh gọn.&nbsp;</p>

<p>-&nbsp;Đối với Xưởng sản xuất bạn n&ecirc;n sử dụng&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/xe-day-4-banh_1782.html">Xe đẩy 4 b&aacute;nh</a>&nbsp;để vận chuyển ph&ugrave; hợp với mặt bằng của xưởng sản xuất. Ngo&agrave;i ra, xe đẩy 4 b&aacute;nh c&ograve;n th&iacute;ch hợp cho c&aacute;c quầy h&agrave;ng, kho si&ecirc;u thị, bệnh viện,...... Xe c&oacute; thể di chuyển tr&ecirc;n mọi địa h&igrave;nh 1 c&aacute;ch dễ d&agrave;ng.&nbsp;<br />
-&nbsp;Xe đẩy gi&uacute;p giảm sử dụng sức người trong c&ocirc;ng việc đ&ograve;i hỏi sức lực v&agrave; tiết kiệm thời gian vận chuyển n&acirc;ng cao hiệu quả c&ocirc;ng việc.<br />
&nbsp;</p>

<p><strong>ƯU ĐIỂM NỔI BẬT :</strong><br />
<em><strong>Kết cấu chắc chắn:</strong></em></p>

<p>-<strong>&nbsp;Xe đẩy SUMO HB-210C</strong>&nbsp;được l&agrave;m từ th&eacute;p cao cấp n&ecirc;n cho độ chắc chắn v&agrave; độ bền cao.<br />
-&nbsp;S&agrave;n xe được l&agrave;m bằng chất liệu th&eacute;p si&ecirc;u bền đ&aacute;p ứng được những tải trọng lớn tối đa&nbsp;<strong>300kg</strong>&nbsp;gi&uacute;p bạn di chuyển được một lượng h&agrave;ng h&oacute;a lớn trong mỗi lần vận chuyển.</p>

<p>- Khung xe chắc chắn l&agrave;m chất liệu cao cấp, kh&ocirc;ng gỉ, bền cao, kh&ocirc;ng bị biến dạng khi va đập mạnh.<br />
- B&aacute;nh xe đẩy chắc chắn c&oacute; thể di chuyển linh hoạt theo &yacute; muốn v&agrave; kh&ocirc;ng để lại vết trầy tr&ecirc;n mặt s&agrave;n khi di chuyển.<br />
<br />
<strong><em>Thiết kế tiện dụng, an to&agrave;n:</em></strong></p>

<p>-&nbsp;Sản phẩm c&oacute; c&aacute;c b&aacute;nh xe xoay 360 độ&nbsp;gi&uacute;p việc di chuyển nhẹ nh&agrave;ng v&agrave; nhanh ch&oacute;ng hơn.<br />
- B&ecirc;n cạnh đ&oacute;, tay cầm chắc chắn v&agrave; thiết kế uốn cong ở c&aacute;c bề mặt g&oacute;c gi&uacute;p sản phẩm trở n&ecirc;n th&acirc;n thiện hơn, kh&ocirc;ng g&acirc;y trầy xước khi va quẹt với người d&ugrave;ng.<br />
- Tay cầm được trang bị miếng nhựa bảo vệ cho tay cầm th&ecirc;m chắc chắn.</p>

<p>-&nbsp;Xe đẩy vận chuyển với tốc độ vừa phải, nằm trong phạm vi cho ph&eacute;p n&ecirc;n rất an to&agrave;n, hạn chế đ&acirc;m v&agrave;o kệ h&agrave;ng.<br />
-&nbsp;Tay đẩy c&oacute; thể gấp gọn gi&uacute;p tiện cho việc mang đi v&agrave; cất giữ.<br />
&nbsp;</p>

<p><strong><em>C&ocirc;ng nghệ hiện đại:</em></strong></p>

<p>- Sản phẩm được sản xuất theo ti&ecirc;u chuẩn thế giới đảm bảo về thiết kế, độ an to&agrave;n lẫn hiệu quả l&agrave;m việc.<br />
&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như</strong>&nbsp;l&agrave; Nh&agrave; ph&acirc;n phối Sản phẩm&nbsp;<a href="http://www.ketnoitieudung.vn/xe-day/c1774/sumo.html">Xe đẩy SUMO</a>&nbsp;ch&iacute;nh thức tại TP. Hồ Ch&iacute; Minh.&nbsp;<strong>Ketnoitieudung.vn</strong>&nbsp;lu&ocirc;n cung cấp cho bạn c&aacute;c loại&nbsp;<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/xe-day_1774.html">Xe đẩy</a>&nbsp;phục vụ cho mọi nhu cầu c&ocirc;ng việc, Sản phẩm chất lượng, ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt.</p>

<p>&nbsp;</p>

<p>Nếu bạn c&oacute; nhu cầu sử dụng Sản phẩm của c&ocirc;ng ty ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;<strong>(08) 3971 8011 - 0903 39.72.73</strong>&nbsp;hoặc trực tiếp đến&nbsp;<strong>địa chỉ văn ph&ograve;ng giao dịch</strong>:&nbsp;<em><strong>106 T&aacute;i Thiết, Phường 11, Quận T&acirc;n B&igrave;nh, TP Hồ Ch&iacute; Minh, VN&nbsp;</strong></em>để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.</p>

<p>Hoặc truy cập v&agrave;o trang Web www.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.<br />
&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi của bạn sau khi sử dụng Sản phẩm của ch&uacute;ng t&ocirc;i.<br />
<br />
H&atilde;y nhanh tay đặt h&agrave;ng để được hưởng những ưu đ&atilde;i hấp dẫn!</p>
', NULL, NULL, NULL, 1, 0, 2, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Xe đẩy 4 b&aacute;nh</td>
		</tr>
		<tr>
			<td><strong>H&atilde;ng sản xuất</strong></td>
			<td>SUMO</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Th&aacute;i Lan</td>
		</tr>
		<tr>
			<td><strong>Kiểu xe :</strong></td>
			<td>xe đẩy tay (c&oacute; thể gấp được)</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước :</strong></td>
			<td>D&agrave;i 915 x Rộng 615 x Cao (Tay đẩy) x 860mm</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước cả th&ugrave;ng:</strong></td>
			<td>D&agrave;i 920 x Rộng 630 x Cao 140(mm)</td>
		</tr>
		<tr>
			<td><strong>Tải trọng :</strong></td>
			<td>300kg</td>
		</tr>
		<tr>
			<td><strong>Đường k&iacute;nh b&aacute;nh xe :</strong></td>
			<td>&Oslash; 125 mm (5&rdquo;)</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng:</strong></td>
			<td>18.6kg</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (74, N'050-616', N'50 tấn Con đội Masada MH-50Y', 8539000.0000, NULL, NULL, NULL, 37, 242, N'50 tấn Con đội Masada MH-50Y chất lượng, giá rẻ. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><strong>Con đội 50 tấn&nbsp;<a href="http://www.ketnoitieudung.vn/con-doi/c1773/masada.html">Masada</a>&nbsp;MH-50Y&nbsp;</strong>được sản xu&acirc;́t theo c&ocirc;ng ngh&ecirc;̣ hi&ecirc;̣n đại của Nh&acirc;̣t Bản n&ecirc;n lu&ocirc;n đảm bảo v&ecirc;̀ m&acirc;̃u mã đẹp và ch&acirc;́t lượng t&ocirc;́t m&agrave; gi&aacute; cả lại hợp l&yacute;.&nbsp;<strong>Con đội Masada</strong>&nbsp;l&agrave; sự lựa chọn tốt nhất cho bạn!</p>

<p>&nbsp;</p>

<p><strong><img alt="" src="http://thoigia.com.vn/data/ck/images/mh-50y.jpg" /></strong></p>

<p><br />
<strong>Đặc trưng:</strong><br />
<br />
- &nbsp;<strong>Con đội 50 tấn MH-50Y</strong>&nbsp;của h&atilde;ng Masada&nbsp;được thiết kế để di chuyển tất cả c&aacute;c loại m&aacute;y m&oacute;c v&agrave; nguy&ecirc;n vật liệu tr&ecirc;n bề mặt nhẵn.<br />
- &nbsp;Cấu tr&uacute;c kết cấu của n&oacute; rất mạnh mẽ v&agrave; ổn định l&agrave; một sự lựa chọn tuyệt vời cho việc vận chuyển m&aacute;y m&oacute;c thiết bị nặng.<br />
&nbsp;</p>

<p><strong>Ứng dụng:</strong></p>

<p>- Được sử dụng rộng r&atilde;i trong lắp đặt m&aacute;y m&oacute;c, tại c&ocirc;ng trường hoặc trong garage xe.<br />
- L&agrave; thiết bị n&acirc;ng ti&ecirc;u chuẩn v&agrave; phổ rộng cho phương tiện giao th&ocirc;ng, m&aacute;y x&acirc;y dựng v&agrave; m&aacute;y c&ocirc;ng nghiệp<br />
- C&ograve;n được sử dụng tại những nơi d&agrave;nh cho thu&ecirc; m&aacute;y m&oacute;c, m&aacute;y chống thảm hoạ thi&ecirc;n nhi&ecirc;n, chống động đất.<br />
- Được coi l&agrave; thiết bị tối ưu cho năng vật nặng với chỉ cần lực n&acirc;ng nhỏ nhất.<br />
&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như&nbsp;</strong>l&agrave; Nh&agrave; ph&acirc;n phối&nbsp;<strong>Sản phẩm K&iacute;ch n&acirc;ng hay<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/con-doi_1773.html">&nbsp;Con đội</a>&nbsp;Masada</strong>&nbsp;ch&iacute;nh thức tại TP. Hồ Ch&iacute; Minh. Ketnoitieudung.vn lu&ocirc;n cung cấp cho bạn c&aacute;c loại&nbsp;<strong>K&iacute;ch n&acirc;ng</strong>&nbsp;phục vụ cho mọi lĩnh vực chất lượng, ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt.</p>

<p>&nbsp;</p>

<p>Nếu bạn c&oacute; nhu cầu sử dụng&nbsp;<strong>K&iacute;ch n&acirc;ng</strong>&nbsp;của c&ocirc;ng ty ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;&nbsp;<strong>(08) 3971 8011 - (08) 3975 6686</strong>&nbsp;hoặc trực tiếp đến&nbsp;<strong>địa chỉ văn ph&ograve;ng giao dịch</strong>:&nbsp;<strong>106 T&aacute;i thiết, Phường 11, Quận T&acirc;n B&igrave;nh, TP. Hồ Ch&iacute; Minh. VN</strong>&nbsp;để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.</p>

<p>Hoặc truy cập v&agrave;o trang Web www.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.</p>

<p>&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi của bạn sau khi sử dụng Sản phẩm của ch&uacute;ng t&ocirc;i.</p>

<p>&nbsp;</p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!&nbsp;</p>
', NULL, NULL, NULL, 1, 0, 2, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Con đội</td>
		</tr>
		<tr>
			<td><strong>Hãng sản xuất</strong></td>
			<td>Masada</td>
		</tr>
		<tr>
			<td><strong>Xu&acirc;́t xứ</strong></td>
			<td>Nh&acirc;̣t Bản</td>
		</tr>
		<tr>
			<td><strong>C&ocirc;ng ngh&ecirc;̣</strong></td>
			<td>Nh&acirc;̣t Bản</td>
		</tr>
		<tr>
			<td><strong>Tải trọng n&acirc;ng:</strong></td>
			<td>50 tấn</td>
		</tr>
		<tr>
			<td><strong>N&acirc;ng thấp nhất:</strong></td>
			<td>305mm</td>
		</tr>
		<tr>
			<td><strong>H&agrave;nh tr&igrave;nh:</strong></td>
			<td>170mm</td>
		</tr>
		<tr>
			<td><strong>N&acirc;ng cao nhất:</strong></td>
			<td>475mm</td>
		</tr>
		<tr>
			<td><strong>Đế:</strong></td>
			<td>188*237mm</td>
		</tr>
		<tr>
			<td><strong>Tay cầm:</strong></td>
			<td>&Phi;27.2*1000mm</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng:</strong></td>
			<td>37 kgs</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (75, N'MHC-2RS-2', N'2 tấn Con đội móc Masada MHC-2RS-2', 5429000.0000, 6000000.0000, NULL, NULL, 37, 243, N'2 tấn Con đội móc Masada MHC-2RS-2 chất lượng, giá rẻ. Bảo hành chính hãng. Tư vấn sản phẩm phù hợp. Giao hàng nhanh 1-2h. Xem ngay!', N'<p><strong><a href="http://www.ketnoitieudung.vn/con-doi/c1773/masada.html">Masada</a></strong>&nbsp;là nhà sản xu&acirc;́t n&ocirc;̉i ti&ecirc;́ng toàn c&acirc;̀u cho lĩnh vực kích n&acirc;ng của ngành &ocirc; t&ocirc;, với nhi&ecirc;̀u sản ph&acirc;̉m của nhi&ecirc;̀u lĩnh vực khác nhau. Được sử dụng r&ocirc;̣ng rãi trong thị trường Nh&acirc;̣t Bản và tr&ecirc;n toàn th&ecirc;́ giới. Masada được khách hàng đánh giá cao và tin dùng.</p>

<p>&nbsp;</p>

<p><strong>Con đội m&oacute;c Masada 2 tấn MHC-2RS-2&nbsp;</strong>được sản xu&acirc;́t theo c&ocirc;ng ngh&ecirc;̣ hi&ecirc;̣n đại của Nh&acirc;̣t Bản n&ecirc;n lu&ocirc;n đảm bảo v&ecirc;̀ m&acirc;̃u mã đẹp và ch&acirc;́t lượng t&ocirc;́t m&agrave; gi&aacute; cả lại hợp l&yacute;.&nbsp;</p>

<p>&nbsp;</p>

<p><strong><img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/mhc-10t.jpg" /></strong></p>

<p><br />
<strong>Đặc trưng:</strong><br />
- &nbsp;<strong>Con đội m&oacute;c 2 tấn</strong>&nbsp;của h&atilde;ng Masada được thiết kế để n&acirc;ng c&aacute;c chi tiết được đặt ở vị tr&iacute; thấp trước đ&oacute; như m&aacute;y m&oacute;c, cầu cống, đ&oacute;ng t&agrave;u, ứng cứu thi&ecirc;n tai.&nbsp;<br />
- &nbsp;Cấu tr&uacute;c kết cấu của n&oacute; rất mạnh mẽ v&agrave; ổn định l&agrave; một sự lựa chọn tuyệt vời cho việc vận chuyển m&aacute;y m&oacute;c thiết bị nặng.<br />
- &nbsp;<strong>Đội m&oacute;c MHC-2RS-2</strong>&nbsp;c&oacute; th&ecirc;m 2 l&ograve; xo gi&uacute;p định vị v&agrave; k&eacute;o đầu đội v&agrave; m&oacute;c về vị tr&iacute; nhanh hơn chỉ qua thao t&aacute;c xả van đ&oacute;ng mở dầu.<br />
- &nbsp;Ngo&agrave;i ra c&ograve;n được thiết kế cụm lắc tay c&oacute; thể xoay 180 độ gi&uacute;p đội m&oacute;c c&oacute; thể sử dụng được những vị tr&iacute; hẹp.&nbsp;<br />
&nbsp;</p>

<p><strong>Ứng dụng:</strong></p>

<p>- Được sử dụng rộng r&atilde;i trong lắp đặt m&aacute;y m&oacute;c, tại c&ocirc;ng trường hoặc trong garage xe.<br />
- L&agrave; thiết bị n&acirc;ng ti&ecirc;u chuẩn v&agrave; phổ rộng cho phương tiện giao th&ocirc;ng, m&aacute;y x&acirc;y dựng v&agrave; m&aacute;y c&ocirc;ng nghiệp<br />
- C&ograve;n được sử dụng tại những nơi d&agrave;nh cho thu&ecirc; m&aacute;y m&oacute;c, m&aacute;y chống thảm hoạ thi&ecirc;n nhi&ecirc;n, chống động đất.<br />
- Được coi l&agrave; thiết bị tối ưu cho năng vật nặng với chỉ cần lực n&acirc;ng nhỏ nhất.<br />
&nbsp;</p>

<p><strong>C&ocirc;ng ty TNHH MTV Thương Mại H&agrave; Như&nbsp;</strong>l&agrave; Nh&agrave; ph&acirc;n phối&nbsp;<strong>Sản phẩm K&iacute;ch n&acirc;ng hay<a href="http://www.ketnoitieudung.vn/danh-muc-san-pham/con-doi_1773.html">&nbsp;Con đội</a>&nbsp;Masada</strong>&nbsp;ch&iacute;nh thức tại TP. Hồ Ch&iacute; Minh. Ketnoitieudung.vn lu&ocirc;n cung cấp cho bạn c&aacute;c loại&nbsp;<strong>K&iacute;ch n&acirc;ng</strong>&nbsp;phục vụ cho mọi lĩnh vực chất lượng, ch&iacute;nh h&atilde;ng v&agrave; gi&aacute; tốt.</p>

<p>&nbsp;</p>

<p>Nếu bạn c&oacute; nhu cầu sử dụng&nbsp;<strong>K&iacute;ch n&acirc;ng</strong>&nbsp;của c&ocirc;ng ty ch&uacute;ng t&ocirc;i. Xin vui l&ograve;ng li&ecirc;n hệ qua số&nbsp;<strong>hotline</strong>&nbsp;&nbsp;<strong>(08) 3971 8011 - (08) 3975 6686</strong>&nbsp;hoặc trực tiếp đến&nbsp;<strong>địa chỉ văn ph&ograve;ng giao dịch</strong>:&nbsp;<strong>106 T&aacute;i thiết, Phường 11, Quận T&acirc;n B&igrave;nh, TP. Hồ Ch&iacute; Minh. VN</strong>&nbsp;để được tư vấn sản phẩm th&iacute;ch hợp với nhu cầu c&ocirc;ng việc của bạn.</p>

<p>Hoặc truy cập v&agrave;o trang Web www.ketnoitieudung.vn v&agrave; đặt h&agrave;ng online sau khi đ&atilde; chọn được sản phẩm ph&ugrave; hợp.</p>

<p>&nbsp;</p>

<p>Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc hoặc phản hồi của bạn sau khi sử dụng Sản phẩm của ch&uacute;ng t&ocirc;i.</p>

<p><a href="/Content/Uploads/images/huong-dan-lam-banh-mi-uop-thit-tho-nhi-ky-ngon-nhat-2.jpg"><img alt="" src="/Content/Uploads/images/huong-dan-lam-banh-mi-uop-thit-tho-nhi-ky-ngon-nhat-2.jpg" style="height:100%; width:100%" /></a></p>

<p>H&atilde;y nhanh tay đặt h&agrave;ng để nhận được nhiều ưu đ&atilde;i hấp dẫn!&nbsp;</p>

<p>&nbsp;</p>
', NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Danh mục</strong></td>
			<td>Con đội</td>
		</tr>
		<tr>
			<td><strong>Hãng sản xuất</strong></td>
			<td>Masada</td>
		</tr>
		<tr>
			<td><strong>Xuất xứ</strong></td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td><strong>Tải trọng n&acirc;ng của đầu :</strong></td>
			<td>5 tấn</td>
		</tr>
		<tr>
			<td><strong>Tải trọng n&acirc;ng của ch&acirc;n :</strong></td>
			<td>2 tấn</td>
		</tr>
		<tr>
			<td><strong>N&acirc;ng thấp nhất ( ch&acirc;n ) : N&acirc;ng thấp nhất ( ch&acirc;n ) :</strong></td>
			<td>19mm</td>
		</tr>
		<tr>
			<td><strong>N&acirc;ng thấp nhất ( Đầu) :</strong></td>
			<td>243mm</td>
		</tr>
		<tr>
			<td><strong>H&agrave;nh tr&igrave;nh :</strong></td>
			<td>113mm</td>
		</tr>
		<tr>
			<td><strong>N&acirc;ng cao nhất (ch&acirc;n) :</strong></td>
			<td>132mm</td>
		</tr>
		<tr>
			<td><strong>N&acirc;ng cao nhất ( đầu) :</strong></td>
			<td>358mm</td>
		</tr>
		<tr>
			<td><strong>Đế :</strong></td>
			<td>160*227mm</td>
		</tr>
		<tr>
			<td><strong>Trọng lượng</strong></td>
			<td>13.2 kgs</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (76, N'PM3', N'Đồng hồ đo điện vạn năng Sanwa PM3', 599000.0000, 629000.0000, NULL, 1, NULL, 3233, N'Đồng hồ đo điện vạn năng Sanwa PM3 Chất lượng, giá tốt. Tư vấn sản phẩm phù hợp. Bảo hành chính hãng. Giao hàng nhanh 1-2h. Mua ngay!', N'<strong>Đồng hồ đo điện vạn năng Sanwa&nbsp;</strong>l&agrave; một dụng cụ đo lường điện c&oacute; nhiều chức năng. C&aacute;c chức năng cơ bản l&agrave; ampe kế, v&ocirc;n kế, v&agrave; &ocirc;m kế, ngo&agrave;i ra c&oacute; một số đồng hồ c&ograve;n c&oacute; thể đo tần số d&ograve;ng điện, điện dung tụ điện, kiểm tra b&oacute;ng b&aacute;n dẫn (transitor)...<br />
&nbsp;<br />
<strong>Đồng hồ đo điện vạn năng Sanwa&nbsp;</strong><strong>PM3&nbsp;</strong>sử dụng c&aacute;c linh kiện điện tử chủ động do đ&oacute; cần c&oacute; nguồn điện như pin. Đ&acirc;y l&agrave; loại th&ocirc;ng dụng nhất hiện nay, c&oacute; thể hiển thị nhiều kết quả đo đồng thời qua mặt đồng hồ điện tử. Sản phẩm ch&iacute;nh h&atilde;ng của Sanwa được sản xuất dựa tr&ecirc;n c&ocirc;ng nghệ hiện đại của Nhật, đảm bảo chất lượng với một mức gi&aacute; ph&ugrave; hợp.&nbsp;<br />
&nbsp;<br />
<img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/PM3.jpg" style="height:450px; width:450px" /><br />
<strong>T&iacute;nh năng:</strong><br />
<br />
-&nbsp;Thiết bị được l&agrave;m từ chất liệu đ&agrave;n hồi, chống sốc khi rơi. Vật liệu cao cấp, độ bền cao<br />
- K&iacute;ch thước nhỏ gọn, kiểu d&aacute;ng mạnh mẽ dễ d&agrave;ng mang theo khi sử dụng hay bảo quản khi kh&ocirc;ng sử dụng.&nbsp;<br />
- Kết cấu chắc chắn, độ bền cao.&nbsp;<br />
- Sản phẩm cho độ ch&iacute;nh x&aacute;c cao gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m v&agrave; c&oacute; được hiệu quả cao trong c&ocirc;ng việc.<br />
-&nbsp;Vỏ nhựa mềm chịu nhiệt, trở kh&aacute;ng cao, chống va đập.', NULL, NULL, NULL, 0, 0, 1, 2, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Model</strong></td>
			<td>PM3</td>
		</tr>
		<tr>
			<td><strong>DCV:</strong></td>
			<td>400m/4/40/400/500V</td>
		</tr>
		<tr>
			<td><strong>ACV:</strong></td>
			<td>4/40/400/500V</td>
		</tr>
		<tr>
			<td><strong>Điện trở:</strong></td>
			<td>400/4k/40k/400k/4M/40M&Omega;</td>
		</tr>
		<tr>
			<td><strong>Điện dung:</strong></td>
			<td>5n/50n/500n/5&micro;/50&micro;/200&micro;F</td>
		</tr>
		<tr>
			<td><strong>Tần số:</strong></td>
			<td>9.999/99.99/999.9/9.99k/60kHz</td>
		</tr>
		<tr>
			<td><strong>Băng th&ocirc;ng:</strong></td>
			<td>40~400Hz</td>
		</tr>
		<tr>
			<td><strong>Pin:</strong></td>
			<td>CR2032x1</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước:</strong></td>
			<td>108x56x11.5mm</td>
		</tr>
	</tbody>
</table>
')
INSERT [dbo].[ecom_Products] ([Id], [ProductCode], [Name], [Price], [OldPrice], [Quantity], [Unit], [BrandId], [CoverImageId], [Description], [Description2], [TotalView], [TotalBuy], [Tags], [IsNewProduct], [IsBestSellProduct], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Specification]) VALUES (77, N'PM3', N'Đồng hồ đo điện vạn năng Sanwa PM3', 599000.0000, 629000.0000, NULL, 1, NULL, 3234, N'Đồng hồ đo điện vạn năng Sanwa PM3 Chất lượng, giá tốt. Tư vấn sản phẩm phù hợp. Bảo hành chính hãng. Giao hàng nhanh 1-2h. Mua ngay!', N'<strong>Đồng hồ đo điện vạn năng Sanwa&nbsp;</strong>l&agrave; một dụng cụ đo lường điện c&oacute; nhiều chức năng. C&aacute;c chức năng cơ bản l&agrave; ampe kế, v&ocirc;n kế, v&agrave; &ocirc;m kế, ngo&agrave;i ra c&oacute; một số đồng hồ c&ograve;n c&oacute; thể đo tần số d&ograve;ng điện, điện dung tụ điện, kiểm tra b&oacute;ng b&aacute;n dẫn (transitor)...<br />
&nbsp;<br />
<strong>Đồng hồ đo điện vạn năng Sanwa&nbsp;</strong><strong>PM3&nbsp;</strong>sử dụng c&aacute;c linh kiện điện tử chủ động do đ&oacute; cần c&oacute; nguồn điện như pin. Đ&acirc;y l&agrave; loại th&ocirc;ng dụng nhất hiện nay, c&oacute; thể hiển thị nhiều kết quả đo đồng thời qua mặt đồng hồ điện tử. Sản phẩm ch&iacute;nh h&atilde;ng của Sanwa được sản xuất dựa tr&ecirc;n c&ocirc;ng nghệ hiện đại của Nhật, đảm bảo chất lượng với một mức gi&aacute; ph&ugrave; hợp.&nbsp;<br />
&nbsp;<br />
<img alt="" src="http://www.ketnoitieudung.vn/data/ck/images/PM3.jpg" style="height:450px; width:450px" /><br />
<strong>T&iacute;nh năng:</strong><br />
<br />
-&nbsp;Thiết bị được l&agrave;m từ chất liệu đ&agrave;n hồi, chống sốc khi rơi. Vật liệu cao cấp, độ bền cao<br />
- K&iacute;ch thước nhỏ gọn, kiểu d&aacute;ng mạnh mẽ dễ d&agrave;ng mang theo khi sử dụng hay bảo quản khi kh&ocirc;ng sử dụng.&nbsp;<br />
- Kết cấu chắc chắn, độ bền cao.&nbsp;<br />
- Sản phẩm cho độ ch&iacute;nh x&aacute;c cao gi&uacute;p bạn lu&ocirc;n y&ecirc;n t&acirc;m v&agrave; c&oacute; được hiệu quả cao trong c&ocirc;ng việc.<br />
-&nbsp;Vỏ nhựa mềm chịu nhiệt, trở kh&aacute;ng cao, chống va đập.', NULL, NULL, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, N'<table style="width:100%">
	<tbody>
		<tr>
			<td><strong>Model</strong></td>
			<td>PM3</td>
		</tr>
		<tr>
			<td><strong>DCV:</strong></td>
			<td>400m/4/40/400/500V</td>
		</tr>
		<tr>
			<td><strong>ACV:</strong></td>
			<td>4/40/400/500V</td>
		</tr>
		<tr>
			<td><strong>Điện trở:</strong></td>
			<td>400/4k/40k/400k/4M/40M&Omega;</td>
		</tr>
		<tr>
			<td><strong>Điện dung:</strong></td>
			<td>5n/50n/500n/5&micro;/50&micro;/200&micro;F</td>
		</tr>
		<tr>
			<td><strong>Tần số:</strong></td>
			<td>9.999/99.99/999.9/9.99k/60kHz</td>
		</tr>
		<tr>
			<td><strong>Băng th&ocirc;ng:</strong></td>
			<td>40~400Hz</td>
		</tr>
		<tr>
			<td><strong>Pin:</strong></td>
			<td>CR2032x1</td>
		</tr>
		<tr>
			<td><strong>K&iacute;ch thước:</strong></td>
			<td>108x56x11.5mm</td>
		</tr>
	</tbody>
</table>
')
SET IDENTITY_INSERT [dbo].[ecom_Products] OFF
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (1, 4)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (1, 5)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (3, 8)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (6, 8)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (7, 8)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (8, 8)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (9, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (10, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (11, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (12, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (13, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (14, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (15, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (16, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (17, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (18, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (19, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (20, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (21, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (22, 3)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (22, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (23, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (24, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (25, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (26, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (27, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (28, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (29, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (30, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (31, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (32, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (33, 9)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (34, 10)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (35, 10)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (36, 10)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (37, 11)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (38, 11)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (39, 11)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (40, 12)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (41, 12)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (42, 12)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (43, 13)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (44, 13)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (45, 13)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (46, 14)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (47, 14)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (48, 14)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (49, 15)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (50, 15)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (51, 15)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (52, 16)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (53, 16)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (54, 16)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (57, 8)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (63, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (63, 30)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (64, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (64, 31)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (65, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (65, 28)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (66, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (66, 30)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (67, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (67, 30)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (68, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (68, 26)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (68, 29)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (69, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (69, 27)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (70, 22)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (70, 27)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (71, 21)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (71, 35)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (72, 21)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (72, 33)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (73, 21)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (73, 33)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (74, 21)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (74, 34)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (75, 21)
INSERT [dbo].[ecom_Products_Categories] ([ProductId], [CategoryId]) VALUES (75, 34)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (2, 54)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (1, 55)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (1, 56)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (4, 58)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (4, 60)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (22, 140)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (32, 142)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (24, 145)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (25, 146)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (23, 147)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (26, 148)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (28, 149)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (27, 151)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (29, 153)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (30, 154)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (31, 155)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (33, 156)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (5, 157)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (6, 158)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (7, 159)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (8, 160)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (9, 161)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (10, 162)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (11, 163)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (12, 164)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (13, 165)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (14, 166)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (15, 167)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (16, 168)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (17, 169)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (34, 170)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (35, 171)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (36, 172)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (37, 173)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (38, 174)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (39, 175)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (40, 176)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (41, 177)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (42, 178)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (43, 179)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (44, 180)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (45, 181)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (52, 182)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (53, 183)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (54, 184)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (46, 185)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (47, 186)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (48, 187)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (49, 188)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (50, 190)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (51, 191)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (18, 192)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (19, 193)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (20, 194)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (21, 195)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (3, 204)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (55, 205)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (55, 206)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (55, 207)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (56, 208)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (57, 209)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (57, 210)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (58, 219)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (59, 220)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (60, 221)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (61, 222)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (62, 223)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (63, 224)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (64, 225)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (64, 226)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (64, 227)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (65, 228)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (65, 229)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (65, 230)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (66, 231)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (67, 232)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (68, 233)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (69, 234)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (69, 235)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (70, 236)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (71, 237)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (72, 238)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (72, 239)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (72, 240)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (73, 241)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (74, 242)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (75, 243)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (75, 244)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (76, 3233)
INSERT [dbo].[ecom_Products_Images] ([ProductId], [ImageId]) VALUES (77, 3234)
INSERT [dbo].[ecom_Products_ProductGroups] ([ProductId], [GroupId]) VALUES (3, 3)
INSERT [dbo].[ecom_Products_ProductGroups] ([ProductId], [GroupId]) VALUES (22, 3)
INSERT [dbo].[ecom_Products_ProductGroups] ([ProductId], [GroupId]) VALUES (32, 4)
INSERT [dbo].[ecom_Products_ProductGroups] ([ProductId], [GroupId]) VALUES (74, 5)
INSERT [dbo].[ecom_Products_ProductGroups] ([ProductId], [GroupId]) VALUES (75, 5)
SET IDENTITY_INSERT [dbo].[share_Categories] ON 

INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'An Giang', NULL, 6, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Bà Rịa - Vũng Tàu', NULL, 7, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Bắc Giang', NULL, 8, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Bắc Cạn', NULL, 9, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Bạc Liêu', NULL, 10, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Bắc Ninh', NULL, 11, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Bến Tre', NULL, 12, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Bình Định', NULL, 13, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Bình Dương', NULL, 14, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Bình Phước', NULL, 15, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Bình Thuận', NULL, 16, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Cà Mau', NULL, 17, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Cao Bằng', NULL, 18, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Đắc Lắc', NULL, 19, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Đắk Nông', NULL, 20, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Điện Biên', NULL, 21, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Đồng Nai', NULL, 22, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Đồng Tháp', NULL, 23, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Gia Lai', NULL, 24, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Hà Giang', NULL, 25, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Hà Nam', NULL, 26, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Hà Tĩnh', NULL, 27, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Hải Dương', NULL, 28, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Hậu Giang', NULL, 29, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Hòa Bình', NULL, 30, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Hưng Yên', NULL, 31, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Khánh Hòa', NULL, 32, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Kiên Giang', NULL, 33, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Kon Tum', NULL, 34, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Lai Châu', NULL, 35, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Lâm Đồng', NULL, 36, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Lạng Sơn', NULL, 37, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Lào Cai', NULL, 38, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'Long An', NULL, 39, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'Nam Định', NULL, 40, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'Nghệ An', NULL, 41, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, N'Ninh Bình', NULL, 42, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (38, N'Ninh Thuận', NULL, 43, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (39, N'Phú Thọ', NULL, 44, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, N'Quảng Bình', NULL, 45, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, N'Quảng Nam', NULL, 46, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, N'Quảng Ngãi', NULL, 47, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, N'Quảng Ninh', NULL, 48, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (44, N'Quảng Trị', NULL, 49, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (45, N'Sóc Trăng', NULL, 50, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (46, N'Sơn La', NULL, 51, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (47, N'Tây Ninh', NULL, 52, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (48, N'Thái Bình', NULL, 53, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (49, N'Thái Nguyên', NULL, 54, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (50, N'Thanh Hóa', NULL, 55, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (51, N'Thừa Thiên Huế', NULL, 56, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (52, N'Tiền Giang', NULL, 57, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (53, N'Trà Vinh', NULL, 58, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (54, N'Tuyên Quang', NULL, 59, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (55, N'Vĩnh Long', NULL, 60, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (56, N'Vĩnh Phúc', NULL, 61, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (57, N'Yên Bái', NULL, 62, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (58, N'Phú Yên', NULL, 63, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (59, N'Cần Thơ', NULL, 3, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (60, N'Đà Nẵng', NULL, 4, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (61, N'Hải Phòng', NULL, 5, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (62, N'Hà Nội', NULL, 2, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (63, N'Hồ Chí Minh', NULL, 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (64, N'Quận Ba Đình', 62, 1, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (65, N'Quận Hoàn Kiếm', 62, 2, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (66, N'Quận Hai Bà Trưng', 62, 3, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (67, N'Quận Đống Đa', 62, 4, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (68, N'Quận Tây Hồ', 62, 5, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (69, N'Quận Cầu Giấy', 62, 6, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (70, N'Quận Thanh Xuân', 62, 7, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (71, N'Quận Hoàng Mai', 62, 8, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (72, N'Quận Long Biên', 62, 9, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (73, N'Huyện Từ Liêm', 62, 10, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (74, N'Huyện Thanh Trì', 62, 11, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (75, N'Huyện Gia Lâm', 62, 12, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (76, N'Huyện Đông Anh', 62, 13, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (77, N'Huyện Sóc Sơn', 62, 14, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (78, N'TP Hà Đông', 62, 15, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (79, N'TP Sơn Tây', 62, 16, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (80, N'Huyện Ba Vì', 62, 17, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (81, N'Huyện Phúc Thọ', 62, 18, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (82, N'Huyện Thạch Thất', 62, 19, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (83, N'Huyện Quốc Oai', 62, 20, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (84, N'Huyện Chương Mỹ', 62, 21, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (85, N'Huyện Đan Phượng', 62, 22, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (86, N'Huyện Hoài Đức', 62, 23, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (87, N'Huyện Thanh Oai', 62, 24, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (88, N'Huyện Mỹ Đức', 62, 25, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (89, N'Huyện Ứng Hoà', 62, 26, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (90, N'Huyện Thường Tín', 62, 27, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (91, N'Huyện Phú Xuyên', 62, 28, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (92, N'Huyện Mê Linh', 62, 29, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (93, N'Quận Một', 63, 30, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (94, N'Quận Hai', 63, 31, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (95, N'Quận Ba  ', 63, 32, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (96, N'Quận Bốn', 63, 33, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (97, N'Quận Năm', 63, 34, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (98, N'Quận Sáu', 63, 35, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (99, N'Quận Bảy', 63, 36, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (100, N'Quận Tám', 63, 37, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (101, N'Quận Chín', 63, 38, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (102, N'Quận Mười', 63, 39, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (103, N'Quận Mười một', 63, 40, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (104, N'Quận Mười hai', 63, 41, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (105, N'Quận Gò Vấp', 63, 42, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (106, N'Quận Tân Bình', 63, 43, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (107, N'Quận Tân Phú', 63, 44, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (108, N'Quận Bình Thạnh', 63, 45, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (109, N'Quận Phú Nhuận', 63, 46, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (110, N'Quận Thủ Đức', 63, 47, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (111, N'Quận Bình Tân', 63, 48, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (112, N'Huyện Bình Chánh', 63, 49, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (113, N'Huyện Củ Chi', 63, 50, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (114, N'Huyện Hóc Môn', 63, 51, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (115, N'Huyện Nhà Bè', 63, 52, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (116, N'Huyện Cần Giờ', 63, 53, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (117, N'Quận Hồng Bàng', 61, 54, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (118, N'Quận Lê Chân', 61, 55, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (119, N'Quận Ngô Quyền', 61, 56, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (120, N'Quận Kiến An', 61, 57, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (121, N'Quận Hải An  ', 61, 58, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (122, N'Quận Đồ Sơn', 61, 59, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (123, N'Huyện An Lão', 61, 60, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (124, N'Huyện Kiến Thụy', 61, 61, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (125, N'Huyện Thủy Nguyên', 61, 62, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (126, N'Huyện An Dương', 61, 63, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (127, N'Huyện Tiên Lãng', 61, 64, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (128, N'Huyện Vĩnh Bảo', 61, 65, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (129, N'Huyện Cát Hải', 61, 66, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (130, N'Huyện Bạch Long Vĩ', 61, 67, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (131, N'Quận Dương Kinh', 61, 68, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (132, N'Quận Hải Châu', 60, 69, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (133, N'Quận Thanh Khê', 60, 70, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (134, N'Quận Sơn Trà', 60, 71, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (135, N'Quận Ngũ Hành Sơn', 60, 72, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (136, N'Quận Liên Chiểu', 60, 73, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (137, N'Huyện Hoà Vang', 60, 74, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (138, N'Quận Cẩm Lệ', 60, 75, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (139, N'Thị xã Hà Giang', 20, 76, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (140, N'Huyện Đồng Văn', 20, 77, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (141, N'Huyện Mèo Vạc', 20, 78, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (142, N'Huyện Yên Minh', 20, 79, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (143, N'Huyện Quản Bạ', 20, 80, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (144, N'Huyện Vị Xuyên', 20, 81, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (145, N'Huyện Bắc Mê', 20, 82, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (146, N'Huyện Hoàng Su Phì', 20, 83, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (147, N'Huyện Xín Mần', 20, 84, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (148, N'Huyện Bắc Quang', 20, 85, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (149, N'Huyện Quang Bình', 20, 86, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (150, N'Thị xã Cao Bằng', 13, 87, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (151, N'Huyện Bảo Lạc', 13, 88, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (152, N'Huyện Thông Nông', 13, 89, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (153, N'Huyện Hà Quảng', 13, 90, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (154, N'Huyện Trà Lĩnh', 13, 91, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (155, N'Huyện Trùng Khánh', 13, 92, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (156, N'Huyện Nguyên Bình', 13, 93, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (157, N'Huyện Hòa An', 13, 94, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (158, N'Huyện Quảng Uyên', 13, 95, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (159, N'Huyện Thạch An', 13, 96, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (160, N'Huyện Hạ Lang', 13, 97, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (161, N'Huyện Bảo Lâm', 13, 98, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (162, N'Huyện Phục Hòa', 13, 99, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (163, N'Thị xã Lai Châu', 30, 100, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (164, N'Huyện Tam Đường', 30, 101, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (165, N'Huyện Phong Thổ', 30, 102, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (166, N'Huyện Sìn Hồ', 30, 103, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (167, N'Huyện Mường Tè', 30, 104, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (168, N'Huyện Than Uyên', 30, 105, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (169, N'Huyện Tân Uyên', 30, 106, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (170, N'TP Lào Cai', 33, 107, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (171, N' Huyện Xi Ma Cai', 33, 108, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (172, N'Huyện Bát Xát', 33, 109, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (173, N'Huyện Bảo Thắng', 33, 110, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (174, N'Huyện Sa Pa', 33, 111, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (175, N'Huyện Văn Bàn', 33, 112, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (176, N'Huyện Bảo Yên', 33, 113, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (177, N'Huyện Bắc Hà', 33, 114, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (178, N'Huyện Mường Khương', 33, 115, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (179, N'Thị xã Tuyên Quang', 54, 116, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (180, N'Huyện Na Hang', 54, 117, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (181, N'Huyện Chiêm Hóa', 54, 118, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (182, N'Huyện  Hàm Yên', 54, 119, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (183, N'Huyện Yên Sơn  ', 54, 120, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (184, N'Huyện Sơn Dương', 54, 121, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (185, N'TP Lạng Sơn', 32, 122, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (186, N'Huyện  Tràng Định', 32, 123, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (187, N'Huyện Bình Gia', 32, 124, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (188, N'Huyện  Văn Lãng', 32, 125, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (189, N'Huyện Bắc Sơn', 32, 126, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (190, N'Huyện Văn Quan', 32, 127, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (191, N'Huyện Cao Lộc', 32, 128, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (192, N'Huyện Lộc Bình', 32, 129, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (193, N'Huyện Chi Lăng', 32, 130, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (194, N'Huyện  Đình Lập', 32, 131, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (195, N'Huyện Hữu Lũng', 32, 132, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (196, N'Thị xã Bắc Kạn', 4, 133, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (197, N'Huyện Chợ Đồn', 4, 134, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (198, N'Huyện Bạch Thông', 4, 135, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (199, N'Huyện Na Rì', 4, 136, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (200, N'Huyện Ngân Sơn', 4, 137, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (201, N'Huyện Ba Bể', 4, 138, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (202, N'Huyện Chợ Mới', 4, 139, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (203, N'Huyện Pác Nặm', 4, 140, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (204, N'TP Thái Nguyên', 49, 141, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (205, N'Thị xã Sông Công', 49, 142, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (206, N'Huyện Định Hóa', 49, 143, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (207, N'Huyện Phú Lương', 49, 144, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (208, N'Huyện Võ Nhai', 49, 145, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (209, N'Huyện Đại Từ', 49, 146, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (210, N'Huyện Đồng Hỷ', 49, 147, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (211, N'Huyện Phú Bình', 49, 148, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (212, N'Huyện Phổ Yên', 49, 149, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (213, N'TP Yên Bái', 57, 150, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (214, N'Thị xã Nghĩa Lộ', 57, 151, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (215, N'Huyện Văn Yên', 57, 152, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (216, N'Huyện Yên Bình', 57, 153, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (217, N'Huyện Mù Cang Chải', 57, 154, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (218, N'Huyện Văn Chấn', 57, 155, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (219, N'Huyện Trấn Yên', 57, 156, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (220, N'Huyện Trạm Tấu', 57, 157, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (221, N'Huyện Lục Yên', 57, 158, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (222, N'Thị xã Sơn La', 46, 159, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (223, N'Huyện Quỳnh Nhai', 46, 160, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (224, N'Huyện Mường La', 46, 161, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (225, N'Huyện Thuận Châu', 46, 162, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (226, N'Huyện Bắc Yên', 46, 163, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (227, N'Huyện Phù Yên', 46, 164, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (228, N'Huyện Mai Sơn', 46, 165, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (229, N'Huyện Yên Châu', 46, 166, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (230, N'Huyện Sông Mã', 46, 167, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (231, N'Huyện Mộc Châu', 46, 168, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (232, N'Huyện Sốp Cộp', 46, 169, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (233, N'TP Việt Trì', 39, 170, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (234, N'Thị xã Phú Thọ', 39, 171, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (235, N'Huyện Đoan Hùng', 39, 172, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (236, N'Huyện Thanh Ba', 39, 173, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (237, N'Huyện Hạ Hòa', 39, 174, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (238, N'Huyện Cẩm Khê', 39, 175, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (239, N'Huyện Yên Lập', 39, 176, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (240, N'Huyện Thanh Sơn', 39, 177, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (241, N'Huyện Phù Ninh', 39, 178, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (242, N'Huyện Lâm Thao', 39, 179, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (243, N'Huyện Tam Nông', 39, 180, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (244, N'Huyện Thanh Thủy', 39, 181, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (245, N'Huyện Tân Sơn', 39, 182, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (246, N'TP Vĩnh Yên', 56, 183, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (247, N'Huyện Tam Dương', 56, 184, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (248, N'Huyện Lập Thạch', 56, 185, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (249, N'Huyện Vĩnh Tường', 56, 186, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (250, N'Huyện Yên Lạc', 56, 187, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (251, N'Huyện Bình Xuyên', 56, 188, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (252, N'Thị xã Phúc Yên', 56, 189, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (253, N'Huyện Tam Đảo', 56, 190, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (254, N'TP Hạ Long', 43, 191, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (255, N'Thị xã Cẩm Phả', 43, 192, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (256, N'Thị xã Uông Bí', 43, 193, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (257, N'TP Móng Cái', 43, 194, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (258, N'Huyện Bình Liêu', 43, 195, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (259, N'Huyện Đầm Hà', 43, 196, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (260, N'Huyện Hải Hà', 43, 197, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (261, N'Huyện Tiên Yên', 43, 198, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (262, N'Huyện Ba Chẽ', 43, 199, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (263, N'Huyện Đông Triều', 43, 200, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (264, N'Huyện Yên Hưng', 43, 201, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (265, N'Huyện Hoành Bồ', 43, 202, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (266, N'Huyện Vân Đồn', 43, 203, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (267, N'Huyện Cô Tô', 43, 204, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (268, N'TP Bắc Giang  ', 3, 205, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (269, N'Huyện Yên Thế', 3, 206, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (270, N'Huyện Lục Ngạn', 3, 207, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (271, N'Huyện Sơn Động  ', 3, 208, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (272, N'Huyện Lục Nam', 3, 209, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (273, N'Huyện Tân Yên', 3, 210, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (274, N'Huyện Hiệp Hoà', 3, 211, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (275, N'Huyện Lạng Giang', 3, 212, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (276, N'Huyện Việt Yên', 3, 213, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (277, N'Huyện Yên Dũng', 3, 214, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (278, N'TP Bắc Ninh                               ', 3, 215, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (279, N'Huyện Yên Phong', 3, 216, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (280, N'Huyện Quế Võ.', 3, 217, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (281, N'Huyện Tiên Du', 3, 218, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (282, N'Huyện Từ  Sơn', 3, 219, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (283, N'Huyện Thuận Thành', 3, 220, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (284, N'Huyện Gia Bình        ', 3, 221, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (285, N'Huyện Lương Tài', 3, 222, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (286, N'TP Hải Dương', 23, 223, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (287, N'Huyện Chí Linh', 23, 224, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (288, N'Huyện Nam Sách', 23, 225, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (289, N'Huyện Kinh Môn', 23, 226, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (290, N'Huyện Gia Lộc', 23, 227, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (291, N'Huyện Tứ Kỳ', 23, 228, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (292, N'Huyện Thanh Miện', 23, 229, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (293, N'Huyện Ninh Giang', 23, 230, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (294, N'Huyện Cẩm Giàng', 23, 231, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (295, N'Huyện Thanh Hà', 23, 232, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (296, N'Huyện Kim Thành', 23, 233, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (297, N'Huyện Bình Giang', 23, 234, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (298, N'Thị xã Hưng Yên', 26, 235, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (299, N'Huyện Kim Động', 26, 236, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (300, N'Huyện Ân Thi', 26, 237, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (301, N'Huyện Khoái Châu', 26, 238, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (302, N'Huyện Yên Mỹ', 26, 239, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (303, N'Huyện Tiên Lữ', 26, 240, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (304, N'Huyện Phù Cừ', 26, 241, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (305, N'Huyện Mỹ Hào', 26, 242, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (306, N'Huyện Văn Lâm', 26, 243, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (307, N'Huyện Văn Giang', 26, 244, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (308, N'TP Hòa Bình', 25, 245, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (309, N'Huyện Đà Bắc', 25, 246, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (310, N'Huyện Mai Châu', 25, 247, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (311, N'Huyện Tân Lạc', 25, 248, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (312, N'Huyện Lạc Sơn', 25, 249, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (313, N'Huyện Kỳ Sơn', 25, 250, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (314, N'Huyện Lư¬ơng Sơn', 25, 251, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (315, N'Huyện Kim Bôi', 25, 252, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (316, N'Huyện Lạc Thủy', 25, 253, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (317, N'Huyện Yên Thủy', 25, 254, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (318, N'Huyện Cao Phong', 25, 255, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (319, N'TP Phủ Lý', 21, 256, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (320, N'Huyện Duy Tiên', 21, 257, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (321, N'Huyện Kim Bảng', 21, 258, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (322, N'Huyện Lý Nhân', 21, 259, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (323, N'Huỵện Thanh Liêm', 21, 260, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (324, N'Huyện Bình Lục', 21, 261, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (325, N'TP Nam Định', 35, 262, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (326, N'Huyện Mỹ Lộc', 35, 263, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (327, N'Huyện Xuân Trường', 35, 264, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (328, N'Huyện Giao Thủy', 35, 265, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (329, N'Huyện Ý Yên', 35, 266, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (330, N'Huyện Vụ Bản', 35, 267, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (331, N'Huyện Nam Trực', 35, 268, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (332, N'Huyện Trực Ninh', 35, 269, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (333, N'Huyện Nghĩa Hưng', 35, 270, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (334, N'Huyện Hải Hậu', 35, 271, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (335, N'TP Thái Bình', 48, 272, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (336, N'Huyện Quỳnh Phụ', 48, 273, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (337, N'Huyện Hưng Hà', 48, 274, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (338, N'Huyện Đông Hưng', 48, 275, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (339, N'Huyện Vũ Thư', 48, 276, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (340, N'Huyện Kiến Xương', 48, 277, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (341, N'Huyện Tiền Hải', 48, 278, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (342, N'Huyện Thái Thuỵ', 48, 279, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (343, N'TP Ninh Bình', 37, 280, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (344, N'Thị xã Tam Điệp', 37, 281, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (345, N'Huyện Nho Quan', 37, 282, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (346, N'Huyện Gia Viễn', 37, 283, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (347, N'Huyện Hoa Lư', 37, 284, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (348, N'Huyện Yên Mô', 37, 285, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (349, N'Huyện Kim Sơn', 37, 286, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (350, N'Huyện Yên Khánh', 37, 287, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (351, N'TP Thanh Hóa', 50, 288, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (352, N'Thị xã Bỉm Sơn', 50, 289, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (353, N'Thị xã Sầm Sơn', 50, 290, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (354, N'Huyện Quan Hóa', 50, 291, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (355, N'Huyện Quan Sơn', 50, 292, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (356, N'Huyện Mường Lát', 50, 293, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (357, N'Huyện Bá Thước', 50, 294, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (358, N'Huyện Thường Xuân', 50, 295, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (359, N'Huyện Như Xuân', 50, 296, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (360, N'Huyện Như Thanh', 50, 297, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (361, N'Huyện Lang Chánh', 50, 298, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (362, N'Huyện Ngọc Lặc', 50, 299, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (363, N'Huyện Thạch Thành', 50, 300, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (364, N'Huyện Cẩm Thủy', 50, 301, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (365, N'Huyện Thọ Xuân', 50, 302, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (366, N'Huyện Vĩnh Lộc', 50, 303, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (367, N'Huyện Thiệu Hóa', 50, 304, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (368, N'Huyện Triệu Sơn', 50, 305, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (369, N'Huyện Nông Cống', 50, 306, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (370, N'Huyện Đông Sơn  ', 50, 307, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (371, N'Huyện Hà Trung', 50, 308, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (372, N'Huyện Hoằng Hóa', 50, 309, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (373, N'Huyện Nga Sơn', 50, 310, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (374, N'Huyện Hậu Lộc', 50, 311, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (375, N'Huyện Quảng Xương', 50, 312, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (376, N'Huyện Tĩnh Gia', 50, 313, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (377, N'Huyện Yên Định', 50, 314, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (378, N'TP Vinh', 36, 315, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (379, N'Thị xã Cửa Lò', 36, 316, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (380, N'Huyện Quỳ Châu', 36, 317, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (381, N'Huyện Quỳ Hợp', 36, 318, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (382, N'Huyện Nghĩa Đàn  ', 36, 319, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (383, N'Huyện Quỳnh Lưu', 36, 320, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (384, N'Huyện Kỳ Sơn', 36, 321, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (385, N'Huyện Tương Dương', 36, 322, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (386, N'Huyện Con Cuông', 36, 323, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (387, N'Huyện Tân Kỳ', 36, 324, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (388, N'Huyện Yên Thành  ', 36, 325, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (389, N'Huyện Diễn Châu', 36, 326, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (390, N'Huyện Anh Sơn', 36, 327, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (391, N'Huyện Đô Lương  ', 36, 328, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (392, N'Huyện Thanh Chương', 36, 329, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (393, N'Huyện Nghi Lộc', 36, 330, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (394, N'Huyện Nam Đàn', 36, 331, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (395, N'Huyện Hưng Nguyên', 36, 332, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (396, N'Huyện Quế Phong', 36, 333, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (397, N'TP Hà Tĩnh', 22, 334, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (398, N'Thị xã Hồng Lĩnh', 22, 335, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (399, N'Huyện Hương Sơn', 22, 336, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (400, N'Huyện Đức Thọ', 22, 337, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (401, N'Huyện Nghi Xuân', 22, 338, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (402, N'Huyện Can Lộc', 22, 339, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (403, N'Huyện Hương Khê', 22, 340, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (404, N'Huyện Thạch Hà', 22, 341, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (405, N'Huyện Cẩm Xuyên', 22, 342, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (406, N'Huyện Kỳ Anh', 22, 343, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (407, N'Huyện Vũ Quang', 22, 344, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (408, N'Huyện Lộc Hà', 22, 345, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (409, N'TP Đồng Hới', 40, 346, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (410, N'Huyện Tuyên Hóa', 40, 347, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (411, N'Huyện Minh Hóa', 40, 348, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (412, N'Huyện Quảng Trạch  ', 40, 349, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (413, N'Huyện Bố Trạch', 40, 350, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (414, N'Huyện Quảng Ninh', 40, 351, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (415, N'Huyện Lệ Thủy', 40, 352, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (416, N'Thị xã Đông Hà', 44, 353, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (417, N'Thị xã Quảng Trị', 44, 354, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (418, N'Huyện Vĩnh Linh', 44, 355, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (419, N'Huyện Gio Linh', 44, 356, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (420, N'Huyện Cam Lộ', 44, 357, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (421, N'Huyện Triệu Phong', 44, 358, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (422, N'Huyện Hải Lăng', 44, 359, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (423, N'Huyện Hướng Hóa', 44, 360, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (424, N'Huyện Đăk Rông', 44, 361, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (425, N'Huyện đảo Cồn Cỏ', 44, 362, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (426, N'TP Huế', 51, 363, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (427, N'Huyện Phong Điền', 51, 364, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (428, N'Huyện Quảng Điền', 51, 365, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (429, N'Huyện Hương Trà', 51, 366, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (430, N'Huyện Phú Vang  ', 51, 367, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (431, N'Huyện Hương Thuỷ', 51, 368, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (432, N'Huyện Phú Lộc', 51, 369, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (433, N'Huyện Nam Đông', 51, 370, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (434, N'Huyện A Lưới', 51, 371, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (435, N'TP Tam Kỳ', 41, 372, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (436, N'TP Hội An', 41, 373, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (437, N'Huyện Duy Xuyên', 41, 374, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (438, N'Huyện Điện Bàn', 41, 375, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (439, N'Huyện Đại Lộc', 41, 376, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (440, N'Huyện Quế Sơn', 41, 377, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (441, N'Huyện Hiệp Đức', 41, 378, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (442, N'Huyện Thăng Bình', 41, 379, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (443, N'Huyện Núi Thành', 41, 380, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (444, N'Huyện Tiên Phước', 41, 381, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (445, N'Huyện Bắc Trà My', 41, 382, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (446, N'Huyện Đông Giang', 41, 383, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (447, N'Huyện Nam Giang', 41, 384, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (448, N'Huyện Phước Sơn', 41, 385, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (449, N'Huyện Nam Trà My', 41, 386, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (450, N'Huyện Tây Giang', 41, 387, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (451, N'Huyện Phú Ninh', 41, 388, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (452, N'Huyện Nông Sơn', 41, 389, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (453, N'TP Quảng Ngãi', 42, 390, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (454, N'Huyện Lý Sơn  ', 42, 391, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (455, N'Huyện Bình Sơn', 42, 392, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (456, N'Huyện Trà Bồng', 42, 393, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (457, N'Huyện Sơn Tịnh  ', 42, 394, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (458, N'Huyện Sơn Hà', 42, 395, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (459, N'Huyện Tư Nghĩa', 42, 396, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (460, N'Huyện Nghĩa Hành', 42, 397, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (461, N'Huyện Minh Long', 42, 398, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (462, N'Huyện Mộ Đức', 42, 399, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (463, N'Huyện Đức Phổ', 42, 400, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (464, N'Huyện Ba Tơ', 42, 401, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (465, N'Huyện Sơn Tây', 42, 402, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (466, N'Huyện Tây Trà', 42, 403, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (467, N'Thị xã KonTum', 29, 404, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (468, N'Huyện Đắk Glei', 29, 405, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (469, N'Huyện Ngọc Hồi', 29, 406, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (470, N'Huyện Đắk Tô', 29, 407, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (471, N'Huyện Sa Thầy', 29, 408, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (472, N'Huyện Kon Plong', 29, 409, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (473, N'Huyện Đắk Hà', 29, 410, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (474, N'Huyện Kon Rẫy', 29, 411, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (475, N'Huyện Tu Mơ Rông', 29, 412, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (476, N'TP Quy Nhơn', 8, 413, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (477, N'Huyện An Lão  ', 8, 414, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (478, N'Huyện Hoài Ân', 8, 415, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (479, N'Huyện Hoài Nhơn', 8, 416, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (480, N'Huyện Phù Mỹ', 8, 417, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (481, N'Huyện Phù Cát', 8, 418, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (482, N'Huyện Vĩnh Thạnh', 8, 419, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (483, N'Huyện Tây Sơn', 8, 420, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (484, N'Huyện Vân Canh', 8, 421, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (485, N'Huyện An Nhơn', 8, 422, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (486, N'Huyện Tuy Phước', 8, 423, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (487, N'TP Pleiku', 19, 424, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (488, N'Huyện Chư Păh', 19, 425, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (489, N'Huyện Mang Yang', 19, 426, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (490, N'Huyện Kbang', 19, 427, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (491, N'Thị xã An Khê  ', 19, 428, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (492, N'Huyện Kông Chro', 19, 429, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (493, N'Huyện Đức Cơ', 19, 430, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (494, N'Huyện Chưprông', 19, 431, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (495, N'Huyện Chư Sê', 19, 432, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (496, N'Huyện Ayunpa', 19, 433, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (497, N'Huyện Krông Pa', 19, 434, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (498, N'Huyện Ia Grai', 19, 435, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (499, N'Huyện Đăk Đoa', 19, 436, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (500, N'Huyện Ia Pa', 19, 437, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (501, N'Huyện Đăk Pơ', 19, 438, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (502, N'Huyện Phú Thiện', 19, 439, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (503, N'TP Tuy Hòa', 58, 440, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (504, N'Huyện Đồng Xuân', 58, 441, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (505, N'Huyện Sông Cầu', 58, 442, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (506, N'Huyện Tuy An', 58, 443, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (507, N'Huyện Sơn Hòa', 58, 444, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (508, N'Huyện Sông Hinh', 58, 445, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (509, N'Huyện Đông Hòa', 58, 446, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (510, N'Huyện Phú Hoà', 58, 447, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (511, N'Huyện Tây Hòa', 58, 448, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (512, N'TP Buôn Ma Thuột', 14, 449, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (513, N'Huyện Ea H Leo', 14, 450, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (514, N'Huyện Krông Buk', 14, 451, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (515, N'Huyện Krông Năng', 14, 452, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (516, N'Huyện Ea Súp', 14, 453, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (517, N'Huyện Cư M gar', 14, 454, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (518, N'Huyện Krông Pắc', 14, 455, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (519, N'Huyện Ea Kar', 14, 456, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (520, N'Huyện M''Đrăk', 14, 457, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (521, N'Huyện Krông Ana', 14, 458, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (522, N'Huyện Krông Bông', 14, 459, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (523, N'Huyện Lăk', 14, 460, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (524, N'Huyện Buôn Đôn', 14, 461, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (525, N'Huyện Cư Kuin', 14, 462, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (526, N'TP Nha Trang', 27, 463, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (527, N'Huyện Vạn Ninh', 27, 464, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (528, N'Huyện Ninh Hòa', 27, 465, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (529, N'Huyện Diên Khánh', 27, 466, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (530, N'Huyện Khánh Vĩnh', 27, 467, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (531, N'Thị xã Cam Ranh', 27, 468, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (532, N'Huyện Khánh Sơn', 27, 469, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (533, N'Huyện Trường Sa', 27, 470, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (534, N'Huyện Cam Lâm', 27, 471, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (535, N'TP Đà Lạt', 31, 472, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (536, N'Thị xã Bảo Lộc', 31, 473, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (537, N'Huyện Đức Trọng', 31, 474, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (538, N'Huyện Di Linh', 31, 475, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (539, N'Huyện Đơn Dương', 31, 476, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (540, N'Huyện Lạc Dương', 31, 477, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (541, N'Huyện Đạ Huoai', 31, 478, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (542, N'Huyện Đạ Tẻh', 31, 479, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (543, N'Huyện Cát Tiên', 31, 480, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (544, N'Huyện Lâm Hà', 31, 481, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (545, N'Huyện Bảo Lâm', 31, 482, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (546, N'Huyện Đam Rông', 31, 483, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (547, N'Thị xã Đồng Xoài', 10, 484, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (548, N'Huyện Đồng Phú', 10, 485, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (549, N'Huyện Chơn Thành', 10, 486, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (550, N'Huyện Bình Long', 10, 487, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (551, N'Huyện Lộc Ninh', 10, 488, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (552, N'Huyện Bù Đốp', 10, 489, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (553, N'Huyện Phước Long', 10, 490, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (554, N'Huyện Bù Đăng', 10, 491, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (555, N'Thị xã Thủ Dầu Một', 9, 492, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (556, N'Huyện Bến Cát', 9, 493, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (557, N'Huyện Tân Uyên', 9, 494, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (558, N'Huyện Thuận An', 9, 495, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (559, N'Huyện Dĩ An', 9, 496, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (560, N'Huyện Phú Giáo', 9, 497, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (561, N'Huyện Dầu Tiếng', 9, 498, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (562, N'TP Phan Rang - Tháp Chàm', 38, 499, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (563, N'Huyện Ninh Sơn', 38, 500, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (564, N'Huyện Ninh Hải', 38, 501, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (565, N'Huyện Ninh Phước', 38, 502, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (566, N'Huyện Bác Ái', 38, 503, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (567, N'Huyện Thuận Bắc', 38, 504, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (568, N'Thị xã Tây Ninh', 47, 505, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (569, N'Huyện Tân Biên', 47, 506, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (570, N'Huyện Tân Châu', 47, 507, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (571, N'Huyện Dương Minh Châu', 47, 508, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (572, N'Huyện Châu Thành', 47, 509, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (573, N'Huyện Hoà Thành', 47, 510, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (574, N'Huyện Bến Cầu', 47, 511, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (575, N'Huyện Gò Dầu', 47, 512, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (576, N'Huyện Trảng Bàng', 47, 513, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (577, N'TP Phan Thiết', 11, 514, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (578, N'Huyện Tuy Phong', 11, 515, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (579, N'Huyện Bắc Bình', 11, 516, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (580, N'Huyện Hàm Thuận Bắc', 11, 517, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (581, N'Huyện Hàm Thuận Nam', 11, 518, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (582, N'Huyện Hàm Tân', 11, 519, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (583, N'Huyện Đức Linh', 11, 520, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (584, N'Huyện Tánh Linh', 11, 521, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (585, N'Huyện đảo Phú Quý', 11, 522, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (586, N'Thị xã LaGi', 11, 523, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (587, N'TP Biên Hòa', 17, 524, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (588, N'Huyện Vĩnh Cửu  ', 17, 525, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (589, N'Huyện Tân Phú', 17, 526, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (590, N'Huyện Định Quán', 17, 527, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (591, N'Huyện Thống Nhất', 17, 528, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (592, N'Thị xã Long Khánh', 17, 529, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (593, N'Huyện Xuân Lộc', 17, 530, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (594, N'Huyện Long Thành', 17, 531, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (595, N'Huyện Nhơn Trạch', 17, 532, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (596, N'Huyện Trảng Bom', 17, 533, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (597, N'Huyện Cẩm Mỹ', 17, 534, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (598, N'Thị xã Tân An', 34, 535, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (599, N'Huyện Vĩnh Hưng', 34, 536, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (600, N'Huyện Mộc Hoá', 34, 537, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (601, N'Huyện Tân Thạnh', 34, 538, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (602, N'Huyện Thạnh Hoá', 34, 539, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (603, N'Huyện Đức Huệ', 34, 540, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (604, N'Huyện Đức Hoà', 34, 541, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (605, N'Huyện Bến Lức', 34, 542, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (606, N'Huyện Thủ Thừa', 34, 543, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (607, N'Huyện Châu Thành', 34, 544, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (608, N'Huyện Tân Trụ', 34, 545, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (609, N'Huyện Cần Đước', 34, 546, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (610, N'Huyện Cần Giuộc', 34, 547, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (611, N'Huyện Tân Hưng', 34, 548, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (612, N'TP Cao Lãnh', 18, 549, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (613, N'Thị xã Sa Đéc', 18, 550, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (614, N'Huyện Tân Hồng', 18, 551, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (615, N'Huyện Hồng Ngự', 18, 552, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (616, N'Huyện Tam Nông', 18, 553, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (617, N'Huyện Thanh Bình', 18, 554, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (618, N'Huyện Cao Lãnh', 18, 555, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (619, N'Huyện Lấp Vò', 18, 556, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (620, N'Huyện Tháp Mười', 18, 557, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (621, N'Huyện Lai Vung', 18, 558, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (622, N'Huyện Châu Thành', 18, 559, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (623, N'TP Long Xuyên', 1, 560, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (624, N'Thị xã Châu Đốc', 1, 561, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (625, N'Huyện An Phú', 1, 562, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (626, N'Huyện Tân Châu', 1, 563, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (627, N'Huyện Phú Tân', 1, 564, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (628, N'Huyện Tịnh Biên', 1, 565, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (629, N'Huyện Tri Tôn', 1, 566, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (630, N'Huyện Châu Phú', 1, 567, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (631, N'Huyện Chợ Mới', 1, 568, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (632, N'Huyện Châu Thành', 1, 569, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (633, N'Huyện Thoại Sơn', 1, 570, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (634, N'TP Vũng Tàu', 2, 571, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (635, N'Thị xã Bà Rịa', 2, 572, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (636, N'Huyện Xuyên Mộc', 2, 573, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (637, N'Huyện Long Điền', 2, 574, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (638, N'Huyện Côn Đảo', 2, 575, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (639, N'Huyện Tân Thành', 2, 576, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (640, N'Huyện Châu Đức', 2, 577, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (641, N'Huyện Đất Đỏ', 2, 578, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (642, N'TP Mỹ Tho', 52, 579, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (643, N'Thị xã Gò Công', 52, 580, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (644, N'Huyện Cái Bè', 52, 581, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (645, N'Huyện Cai Lậy', 52, 582, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (646, N'Huyện Châu Thành', 52, 583, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (647, N'Huyện Chợ Gạo', 52, 584, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (648, N'Huyện Gò Công Tây', 52, 585, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (649, N'Huyện Gò Công Đông', 52, 586, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (650, N'Huyện Tân Phước', 52, 587, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (651, N'Huyện Tân Phú Đông', 52, 588, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (652, N'TP Rạch Giá', 28, 589, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (653, N'Thị xã Hà Tiên', 28, 590, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (654, N'Huyện Kiên Lương', 28, 591, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (655, N'Huyện Hòn Đất', 28, 592, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (656, N'Huyện Tân Hiệp', 28, 593, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (657, N'Huyện Châu Thành', 28, 594, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (658, N'Huyện Giồng Riềng', 28, 595, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (659, N'Huyện Gò Quao', 28, 596, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (660, N'Huyện An Biên', 28, 597, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (661, N'Huyện An Minh', 28, 598, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (662, N'Huyện Vĩnh Thuận', 28, 599, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (663, N'Huyện Phú Quốc', 28, 600, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (664, N'Huyện Kiên Hải', 28, 601, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (665, N'Huyện U Minh Thượng', 28, 602, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (666, N'Quận Ninh Kiều', 59, 603, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (667, N'Quận Bình Thủy', 59, 604, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (668, N'Quận Cái Răng', 59, 605, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (669, N'Quận Ô Môn', 59, 606, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (670, N'Huyện Phong Điền', 59, 607, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (671, N'Huyện Cờ Đỏ', 59, 608, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (672, N'Huyện Vĩnh Thạnh', 59, 609, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (673, N'Huỵện Thốt Nốt', 59, 610, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (674, N'Thị xã Bến Tre', 7, 611, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (675, N'Huyện Châu Thành', 7, 612, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (676, N'Huyện Chợ Lách', 7, 613, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (677, N'Huyện Mỏ Cày', 7, 614, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (678, N'Huyện Giồng Trôm', 7, 615, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (679, N'Huyện Bình Đại', 7, 616, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (680, N'Huyện Ba Tri', 7, 617, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (681, N'Huyện Thạnh Phú', 7, 618, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (682, N'Thị xã Vĩnh Long', 55, 619, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (683, N'Huyện Long Hồ', 55, 620, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (684, N'Huyện Mang Thít', 55, 621, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (685, N'Huyện Bình Minh', 55, 622, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (686, N'Huyện Tam Bình', 55, 623, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (687, N'Huyện Trà Ôn', 55, 624, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (688, N'Huyện Vũng Liêm', 55, 625, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (689, N' huyện Bình Tân', 55, 626, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (690, N'Thị xã Trà Vinh', 53, 627, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (691, N'Huyện Càng Long', 53, 628, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (692, N'Huyện Cầu Kè', 53, 629, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (693, N'Huyện Tiểu Cần', 53, 630, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (694, N'Huyện Châu Thành', 53, 631, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (695, N'Huyện Trà Cú', 53, 632, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (696, N'Huyện Cầu Ngang', 53, 633, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (697, N'Huyện Duyên Hải', 53, 634, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (698, N'TP Sóc Trăng', 45, 635, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (699, N'Huyện Kế Sách', 45, 636, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (700, N'Huyện Mỹ Tú', 45, 637, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (701, N'Huyện Mỹ Xuyên', 45, 638, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (702, N'Huyện Thạnh Trị', 45, 639, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (703, N'Huyện Long Phú', 45, 640, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (704, N'Huyện Vĩnh Châu', 45, 641, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (705, N'Huyện Cù Lao Dung', 45, 642, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (706, N'Huyện Ngã Năm', 45, 643, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (707, N'Huyện Châu Thành', 45, 644, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (708, N'Thị xã Bạc Liêu', 5, 645, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (709, N'Huyện Vĩnh Lợi', 5, 646, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (710, N'Huyện Hồng Dân', 5, 647, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (711, N'Huyện Giá Rai', 5, 648, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (712, N'Huyện Phước Long', 5, 649, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (713, N'Huyện Đông Hải', 5, 650, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (714, N'Huyện Hoà Bình', 5, 651, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (715, N'TP Cà Mau', 12, 652, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (716, N'Huyện Thới Bình', 12, 653, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (717, N'Huyện U Minh', 12, 654, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (718, N'Huyện Trần Văn Thời', 12, 655, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (719, N'Huyện Cái Nước', 12, 656, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (720, N'Huyện Đầm Dơi', 12, 657, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (721, N'Huyện Ngọc Hiển', 12, 658, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (722, N'Huyện Năm Căn', 12, 659, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (723, N'Huyện Phú Tân', 12, 660, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (724, N'TP Điện Biên Phủ', 16, 661, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (725, N'Thị xã Mường Lay', 16, 662, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (726, N'Huyện Điện Biên', 16, 663, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (727, N'Huyện Tuần Giáo', 16, 664, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (728, N'Huyện Mường Chà', 16, 665, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (729, N'Huyện Tủa Chùa', 16, 666, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (730, N'Huyện Điện Biên Đông', 16, 667, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (731, N'Huyện Mường Nhé', 16, 668, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (732, N'Huyện Mường Ảng', 16, 669, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (733, N'Thị xã Gia Nghĩa', 15, 670, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (734, N'Huyện Đắk RLấp', 15, 671, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (735, N'Huyện Đắk Mil', 15, 672, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (736, N'Huyện Cư Jút', 15, 673, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (737, N'Huyện Đắk Song', 15, 674, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (738, N'Huyện Krông Nô', 15, 675, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (739, N'Huyện Đắk GLong', 15, 676, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (740, N'Huyện Tuy Đức', 15, 677, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (741, N'Thị xã Vị Thanh', 24, 678, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (742, N'Huyện Vị Thủy', 24, 679, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (743, N'Huyện Long Mỹ', 24, 680, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (744, N'Huyện Phụng Hiệp', 24, 681, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (745, N'Huyện Châu Thành', 24, 682, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (746, N'Huyện Châu Thành A', 24, 683, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (747, N'Thị xã Ngã Bảy', 24, 684, 2, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[share_Categories] OFF
SET IDENTITY_INSERT [dbo].[share_Images] ON 

INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, N'item_1_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', N'/Content/Images/ProductImages/item_1_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, N'item_0_bea785a5af97581f4004230d1c05cb97f8c7b61b_slide2.jpg', N'/Content/Images/ProductImages/item_0_bea785a5af97581f4004230d1c05cb97f8c7b61b_slide2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, N'item_0_20310f766be96a80b0b5cbe6c22e0b99881d361d_slide3.jpg', N'/Content/Images/ProductImages/item_0_20310f766be96a80b0b5cbe6c22e0b99881d361d_slide3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, N'item_1_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', N'/Content/Images/ProductImages/item_1_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (54, N'item_0_KE-TIVI-GIA-RE-09.jpg', N'/Content/Images/ProductImages/item_0_KE-TIVI-GIA-RE-09.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (55, N'item_0_NTO1_192.jpg', N'/Content/Images/ProductImages/item_0_NTO1_192.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (56, N'item_1_2a-1415000287_660x0.jpg', N'/Content/Images/ProductImages/item_1_2a-1415000287_660x0.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (58, N'item_1_72.jpg', N'/Content/Images/ProductImages/item_1_72.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (60, N'item_0_DSC_9504.jpg', N'/Content/Images/ProductImages/item_0_DSC_9504.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (108, N'item_0_noi-that-nha-rong-6-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_noi-that-nha-rong-6-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (109, N'item_0_can-ho-38m2-11-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_can-ho-38m2-11-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (110, N'item_0_3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-1.jpg', N'/Content/Images/CMSNewsImages/item_0_3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (111, N'item_0_thiet-ke-nha-o-theo-phong-cach-thon-da-3-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_thiet-ke-nha-o-theo-phong-cach-thon-da-3-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (112, N'item_0_hanh-lang-5-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_hanh-lang-5-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (113, N'item_0_ban-gap-12-1-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_ban-gap-12-1-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (114, N'item_0_nha20m2-2-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_nha20m2-2-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (115, N'item_0_giuong-ngu-gan-cua-ra-vao-1.jpg', N'/Content/Images/CMSNewsImages/item_0_giuong-ngu-gan-cua-ra-vao-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (116, N'item_0_21-3.jpg', N'/Content/Images/CMSNewsImages/item_0_21-3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (138, N'item_0_XaviaLogo.png', N'/Content/Images/CMSNewsImages/item_0_XaviaLogo.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (139, N'item_0_de8f87bc1e4da3ee068cc6c6c076b2b7c8184e0a_banner4.jpg', N'/Content/Images/Banners/item_0_de8f87bc1e4da3ee068cc6c6c076b2b7c8184e0a_banner4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (140, N'ProductImage_0_xaviadecordanang4.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (142, N'ProductImage_0_xaviadecordanang14.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang14.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (145, N'ProductImage_1_xaviadecordanang6.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang6.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (146, N'ProductImage_1_xaviadecordanang7.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang7.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (147, N'ProductImage_0_xaviadecordanang5.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang5.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (148, N'ProductImage_0_xaviadecordanang8.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang8.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (149, N'ProductImage_0_xaviadecordanang10.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang10.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (151, N'ProductImage_0_xaviadecordanang9.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang9.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (153, N'ProductImage_0_xaviadecordanang11.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang11.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (154, N'ProductImage_0_xaviadecordanang12.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang12.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (155, N'ProductImage_0_xaviadecordanang13.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang13.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (156, N'ProductImage_0_xaviadecordanang15.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang15.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (157, N'ProductImage_0_DSC_9393.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9393.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (158, N'ProductImage_0_DSC_9504.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9504.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (159, N'ProductImage_0_DSC_9755.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9755.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (160, N'ProductImage_0_DSC_9894.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9894.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (161, N'ProductImage_0_DSC_9896.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9896.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (162, N'ProductImage_0_DSC_9897.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9897.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (163, N'ProductImage_0_DSC_9900.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9900.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (164, N'ProductImage_0_DSC_9901.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9901.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (165, N'ProductImage_0_DSC_9902.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9902.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (166, N'ProductImage_0_DSC_9904.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9904.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (167, N'ProductImage_0_DSC_9906.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9906.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (168, N'ProductImage_0_DSC_9908.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9908.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (169, N'ProductImage_0_DSC_9911.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9911.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (170, N'ProductImage_0_13435681_1759371291000117_441719261_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13435681_1759371291000117_441719261_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (171, N'ProductImage_0_13435994_1759371354333444_1263461117_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13435994_1759371354333444_1263461117_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (172, N'ProductImage_0_13444386_1759371357666777_1224751771_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13444386_1759371357666777_1224751771_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (173, N'ProductImage_0_13318493_1755331161404130_1419943251_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13318493_1755331161404130_1419943251_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (174, N'ProductImage_0_13334459_566987986795881_1324135279_o (2).jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13334459_566987986795881_1324135279_o (2).jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (175, N'ProductImage_0_13334849_566987930129220_861185595_o.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13334849_566987930129220_861185595_o.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (176, N'ProductImage_0_xaviadecornoithatdanang.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (177, N'ProductImage_0_xaviadecornoithatdanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (178, N'ProductImage_0_xaviadecornoithatdanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (179, N'ProductImage_0_DSC_9741.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9741.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (180, N'ProductImage_0_DSC_9770.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9770.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (181, N'ProductImage_0_DSC_9771.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9771.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (182, N'ProductImage_0_47.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_47.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (183, N'ProductImage_0_50.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_50.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (184, N'ProductImage_0_52 - Copy.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_52 - Copy.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (185, N'ProductImage_1_xaviadecornoithatdanang.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (186, N'ProductImage_1_xaviadecornoithatdanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (187, N'ProductImage_1_xaviadecornoithatdanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (188, N'ProductImage_0_DSC_9776.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9776.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (190, N'ProductImage_2_xaviadecornoithatdanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecornoithatdanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (191, N'ProductImage_2_xaviadecornoithatdanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecornoithatdanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (192, N'ProductImage_0_xaviadecordanang.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (193, N'ProductImage_1_xaviadecordanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (194, N'ProductImage_1_DSC_9904.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_DSC_9904.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (195, N'ProductImage_0_xaviadecordanang3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (204, N'ProductImage_0_72.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_72.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (205, N'item_0_huong-dan-lam-banh-mi-uop-thit-tho-nhi-ky-ngon-nhat-2.jpg', N'/Content/Images/ProductImages/SmallImages/item_0_huong-dan-lam-banh-mi-uop-thit-tho-nhi-ky-ngon-nhat-2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (206, N'ProductImage_0_england__copy.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_england__copy.jpg', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (207, N'ProductImage_0_PitaKebab.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_PitaKebab.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (208, N'item_0_PitaKebab.jpg', N'/Content/Images/ProductImages/SmallImages/item_0_PitaKebab.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (209, N'ProductImage_0_13876137_1573167182985432_7850766803538674729_n.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_13876137_1573167182985432_7850766803538674729_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (210, N'ProductImage_0_2a-1415000287_660x0.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_2a-1415000287_660x0.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (211, N'item_0_banner3.jpg', N'/Content/Images/Banners/item_0_banner3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (212, N'item_0_banner3.png', N'/Content/Images/Banners/item_0_banner3.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (213, N'item_0_banner1.png', N'/Content/Images/Banners/item_0_banner1.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (214, N'item_0_banner2.png', N'/Content/Images/Banners/item_0_banner2.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (215, N'ProductImage_0_gift.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_gift.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (216, N'ProductImage_0_kitchen-tools.png', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_kitchen-tools.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (217, N'ProductImage_1_gift.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_1_gift.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (218, N'ProductImage_2_gift.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_2_gift.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (219, N'ProductImage_3_gift.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_3_gift.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (220, N'ProductImage_1_kitchen-tools.png', N'/Content/Images/ProductImages/LargeImages/ProductImage_1_kitchen-tools.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (221, N'ProductImage_0_ConstructionToolsStore.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_ConstructionToolsStore.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (222, N'ProductImage_0_depositphotos_73324965-stock-photo-delicious-desserts-collage.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_depositphotos_73324965-stock-photo-delicious-desserts-collage.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (223, N'ProductImage_1_depositphotos_73324965-stock-photo-delicious-desserts-collage.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_1_depositphotos_73324965-stock-photo-delicious-desserts-collage.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (224, N'ProductImage_0_thang-nhom-rut-chu-a-nikita-ai56-56m.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-nhom-rut-chu-a-nikita-ai56-56m.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (225, N'ProductImage_0_thang-nhom-rut-38m-dai-nhom-nikita.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-nhom-rut-38m-dai-nhom-nikita.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (226, N'ProductImage_0_thang-nhom-rut-38m-dai-nhom-nikita-2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_thang-nhom-rut-38m-dai-nhom-nikita-2.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (227, N'ProductImage_0_thang-nhom-rut-38m-dai-nhom-nikita-3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_thang-nhom-rut-38m-dai-nhom-nikita-3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (228, N'ProductImage_0_thang-nhom-chu-m-tw-dai-loan-pal-b6-165.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-nhom-chu-m-tw-dai-loan-pal-b6-165.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (229, N'ProductImage_0_thang-nhom-chu-m-tw-dai-loan-pal-b6-165-2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_thang-nhom-chu-m-tw-dai-loan-pal-b6-165-2.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (230, N'ProductImage_0_thang-nhom-chu-m-tw-dai-loan-pal-b6-165-3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_thang-nhom-chu-m-tw-dai-loan-pal-b6-165-3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (231, N'ProductImage_0_thang-nhom-doi-advindeq-adt709b-56m-1.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-nhom-doi-advindeq-adt709b-56m-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (232, N'ProductImage_0_thang-nhom-chu-a-6-bac-advindeq-aps-06.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-nhom-chu-a-6-bac-advindeq-aps-06.jpg', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (233, N'ProductImage_0_thang-truot-cach-dien-soi-thuy-tinh-advindeq-fx-28.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-truot-cach-dien-soi-thuy-tinh-advindeq-fx-28.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (234, N'ProductImage_0_thang-nhom-tay-vin-advindeq-av302-1.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-nhom-tay-vin-advindeq-av302-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (235, N'ProductImage_0_thang-nhom-tay-vin-advindeq-av302-2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_thang-nhom-tay-vin-advindeq-av302-2.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (236, N'ProductImage_0_thang-ghe-2-bac-advindeq-ads402.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_thang-ghe-2-bac-advindeq-ads402.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (237, N'ProductImage_0_pa-lang-xich-keo-tay-10-tan-5m-nitto-90vp5.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_pa-lang-xich-keo-tay-10-tan-5m-nitto-90vp5.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (238, N'ProductImage_0_xe-day-hang-jumbo-hl-110.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_xe-day-hang-jumbo-hl-110.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (239, N'ProductImage_0_xe-day-hang-jumbo-hl-110-2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xe-day-hang-jumbo-hl-110-2.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (240, N'ProductImage_0_xe-day-hang-jumbo-hl-110-3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xe-day-hang-jumbo-hl-110-3.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (241, N'ProductImage_0_xe-day-hang-sumo-hb-210c-1.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_xe-day-hang-sumo-hb-210c-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (242, N'ProductImage_0_50-tan-con-doi-masada-mh-50y.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_50-tan-con-doi-masada-mh-50y.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (243, N'ProductImage_0_2-tan-con-doi-moc-masada-mhc-2rs-2.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_2-tan-con-doi-moc-masada-mhc-2rs-2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (244, N'ProductImage_1_50-tan-con-doi-masada-mh-50y.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_50-tan-con-doi-masada-mh-50y.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1233, N'ProductImage_0_Tohnichi_400.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_Tohnichi_400.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1234, N'ProductImage_1_Tohnichi_400.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_1_Tohnichi_400.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1235, N'ProductImage_2_Tohnichi_400.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_2_Tohnichi_400.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2233, N'ProductImage_6_Advindeq.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_6_Advindeq.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2234, N'ProductImage_0_ASAKI_pdf.png', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_ASAKI_pdf.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2235, N'ProductImage_0_Bishamon.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_Bishamon.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2236, N'ProductImage_0_EPbrand.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_EPbrand.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2237, N'ProductImage_0_jumbo.JPG', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_jumbo.JPG', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2238, N'ProductImage_0_kawasaki.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_kawasaki.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2239, N'ProductImage_0_Masada_logo.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_Masada_logo.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2240, N'ProductImage_0_Sata.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_Sata.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2241, N'ProductImage_0_nitto1.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_nitto1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2242, N'ProductImage_0_Nikko60.png', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_Nikko60.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2243, N'ProductImage_0_sumo.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_sumo.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3233, N'ProductImage_0_dong-ho-do-dien-van-nang-sanwa-pm3-1.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_0_dong-ho-do-dien-van-nang-sanwa-pm3-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3234, N'ProductImage_1_dong-ho-do-dien-van-nang-sanwa-pm3-1.jpg', N'/Content/Images/ProductImages/LargeImages/ProductImage_1_dong-ho-do-dien-van-nang-sanwa-pm3-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3235, N'item_0_thang-nhom-rut-doi-nikawa-nk-56ai.jpg', N'/Content/Images/CMSNewsImages/item_0_thang-nhom-rut-doi-nikawa-nk-56ai.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3236, N'item_1_thang-nhom-rut-doi-nikawa-nk-56ai.jpg', N'/Content/Images/CMSNewsImages/item_1_thang-nhom-rut-doi-nikawa-nk-56ai.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3237, N'item_2_thang-nhom-rut-doi-nikawa-nk-56ai.jpg', N'/Content/Images/CMSNewsImages/item_2_thang-nhom-rut-doi-nikawa-nk-56ai.jpg', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[share_Images] OFF
SET IDENTITY_INSERT [dbo].[system_Banners] ON 

INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 212, N'Banner 1', 1, NULL, NULL, 1, 1, NULL, CAST(0x0000A645011DA9AE AS DateTime), NULL, CAST(0x0000A75E010D7496 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 213, N'Banner 2 ', 1, NULL, NULL, 2, 1, NULL, CAST(0x0000A645011F1BBE AS DateTime), NULL, CAST(0x0000A75E010D8756 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 214, N'Banner 3', 1, NULL, NULL, 3, 1, NULL, CAST(0x0000A6450125B094 AS DateTime), NULL, CAST(0x0000A75E010D9966 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 43, N'Banner  4', 1, NULL, NULL, 4, 2, NULL, CAST(0x0000A6450125CBFA AS DateTime), NULL, CAST(0x0000A64F01432C0A AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 139, N'Autumn 1', 4, NULL, NULL, 1, 2, NULL, CAST(0x0000A64E016BDF0B AS DateTime), NULL, CAST(0x0000A64F01434B9E AS DateTime))
SET IDENTITY_INSERT [dbo].[system_Banners] OFF
SET IDENTITY_INSERT [dbo].[system_Config] ON 

INSERT [dbo].[system_Config] ([Id], [Name], [Value], [Status]) VALUES (1, N'TotalVisitors', N'1151', 1)
SET IDENTITY_INSERT [dbo].[system_Config] OFF
SET IDENTITY_INSERT [dbo].[system_Menu] ON 

INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'QUẢN TRỊ', N'/admin', 1, NULL, 1, N'fa-dashboard', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'THÀNH VIÊN', N'/admin/nguoi-dung', 2, NULL, 1, N'fa-user', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'SẢN PHẨM', N'/admin/san-pham', 3, NULL, 1, N'fa-barcode', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'NHÀ CUNG CẤP', N'/admin/thuong-hieu', 4, NULL, 1, N'fa-certificate', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'DANH MỤC TƯ VẤN KẾT NỐI', N'/admin/danh-muc-tin-tuc', 7, NULL, 1, N'fa-server', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'DANH MỤC SẢN PHẨM', N'/admin/danh-muc-san-pham', 6, NULL, 1, N'fa-list', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'TƯ VẤN KẾT NỐI', N'/admin/tin-tuc', 8, NULL, 1, N'fa-file', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'BANNER', N'/admin/banner', 9, NULL, 1, N'fa-camera', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Đồ kim loại', N'/Product/GetProductByCategory/8', 1, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Đồng hồ', N'/Product/GetProductByCategory/9', 2, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Hoa giả, hoa khô,cỏ khô', N'/Product/GetProductByCategory/10', 3, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Hoa nhỏ Xavia', N'/Product/GetProductByCategory/11', 4, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Khung ảnh', N'/Product/GetProductByCategory/12', 5, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Set cắm hoa mẫu', N'/Product/GetProductByCategory/13', 6, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Tinh dầu', N'/Product/GetProductByCategory/14', 7, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'NHÓM SẢN PHẨM', N'/admin/nhom-san-pham', 7, NULL, 1, N'fa-certificate', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'ORDER', N'/admin/order', 10, NULL, 2, N'fa-shopping-cart', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'STATISTIC', N'/admin/statistic', 11, NULL, 2, N'fa-bar-chart', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[system_Menu] OFF
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Emaill], [Password], [Phone], [Address], [Status]) VALUES (N'ea02af52-ed8a-47cb-9b70-1efeac5e2f48', N'admin@admin.com', N'admin@admin.com', N'123456', N'01238742226', N'kaka', NULL)
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Emaill], [Password], [Phone], [Address], [Status]) VALUES (N'dfd56be8-e046-47bc-89c1-35a1827eba3b', N'barkery@admin.com', N'barkery@admin.com', N'123456', N'12234234234', N'Da Nang', NULL)
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Emaill], [Password], [Phone], [Address], [Status]) VALUES (N'96e43f62-aebb-474c-afec-665a92daa412', N'trungkien3289@gmail.com', N'trungkien3289@gmail.com', N'123456', N'123123123123', N'sadasd@asdasd.com', NULL)
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Emaill], [Password], [Phone], [Address], [Status]) VALUES (N'78b8ffde-aaef-49ee-9a77-830fa9c3a880', N'trungkienkaka123@gmail.com', N'trungkienkaka123@gmail.com', N'1373289k', N'01238742000', N'Tieu La', NULL)
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Emaill], [Password], [Phone], [Address], [Status]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin@xaviadecor.com', N'admin@xaviadecor.com', N'123123', N'0909000', N'DN', NULL)
/****** Object:  Index [IX_FK_cms_News_cms_Categories]    Script Date: 6/12/2017 10:45:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_cms_News_cms_Categories] ON [dbo].[cms_News]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_product_OrderDetails_product_Orders]    Script Date: 6/12/2017 10:45:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_product_OrderDetails_product_Orders] ON [dbo].[ecom_OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_product_OrderDetails_Products]    Script Date: 6/12/2017 10:45:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_product_OrderDetails_Products] ON [dbo].[ecom_OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_Images_share_Images]    Script Date: 6/12/2017 10:45:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_Images_share_Images] ON [dbo].[ecom_Products_Images]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_cms_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[cms_Categories] ([Id])
GO
ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_cms_Categories]
GO
ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_share_Images] FOREIGN KEY([CoverImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_share_Images]
GO
ALTER TABLE [dbo].[ecom_Brands]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Brands_share_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[ecom_Brands] CHECK CONSTRAINT [FK_ecom_Brands_share_Images]
GO
ALTER TABLE [dbo].[ecom_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ecom_OrderDetails_ecom_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ecom_Products] ([Id])
GO
ALTER TABLE [dbo].[ecom_OrderDetails] CHECK CONSTRAINT [FK_ecom_OrderDetails_ecom_Products]
GO
ALTER TABLE [dbo].[ecom_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_product_OrderDetails_product_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ecom_Orders] ([Id])
GO
ALTER TABLE [dbo].[ecom_OrderDetails] CHECK CONSTRAINT [FK_product_OrderDetails_product_Orders]
GO
ALTER TABLE [dbo].[ecom_Products]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_ecom_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[ecom_Brands] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products] CHECK CONSTRAINT [FK_ecom_Products_ecom_Brands]
GO
ALTER TABLE [dbo].[ecom_Products_Categories]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Categories_ecom_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ecom_Categories] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Categories] CHECK CONSTRAINT [FK_ecom_Products_Categories_ecom_Categories]
GO
ALTER TABLE [dbo].[ecom_Products_Categories]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Categories_ecom_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ecom_Products] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Categories] CHECK CONSTRAINT [FK_ecom_Products_Categories_ecom_Products]
GO
ALTER TABLE [dbo].[ecom_Products_Images]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Images_ecom_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ecom_Products] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Images] CHECK CONSTRAINT [FK_ecom_Products_Images_ecom_Products]
GO
ALTER TABLE [dbo].[ecom_Products_Images]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Images_share_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Images] CHECK CONSTRAINT [FK_ecom_Products_Images_share_Images]
GO
ALTER TABLE [dbo].[ecom_Products_ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_ProductGroups_ecom_ProductGroups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ecom_ProductGroups] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_ProductGroups] CHECK CONSTRAINT [FK_ecom_Products_ProductGroups_ecom_ProductGroups]
GO
ALTER TABLE [dbo].[ecom_Products_ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_ProductGroups_ecom_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ecom_Products] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_ProductGroups] CHECK CONSTRAINT [FK_ecom_Products_ProductGroups_ecom_Products]
GO
ALTER TABLE [dbo].[system_Banners]  WITH CHECK ADD  CONSTRAINT [FK_system_Banners_share_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[system_Banners] CHECK CONSTRAINT [FK_system_Banners_share_Images]
GO
USE [master]
GO
ALTER DATABASE [ConstructionToolsStore] SET  READ_WRITE 
GO
