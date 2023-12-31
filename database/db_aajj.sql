USE [master]
GO
/****** Object:  Database [db_aajj]    Script Date: 6/9/2023 23:49:28 ******/
CREATE DATABASE [db_aajj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_aajj', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\db_aajj.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_aajj_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\db_aajj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [db_aajj] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_aajj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_aajj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_aajj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_aajj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_aajj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_aajj] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_aajj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_aajj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_aajj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_aajj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_aajj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_aajj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_aajj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_aajj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_aajj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_aajj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_aajj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_aajj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_aajj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_aajj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_aajj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_aajj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_aajj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_aajj] SET RECOVERY FULL 
GO
ALTER DATABASE [db_aajj] SET  MULTI_USER 
GO
ALTER DATABASE [db_aajj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_aajj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_aajj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_aajj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_aajj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_aajj] SET QUERY_STORE = OFF
GO
USE [db_aajj]
GO
/****** Object:  User [ArgentinosJuniors]    Script Date: 6/9/2023 23:49:28 ******/
CREATE USER [ArgentinosJuniors] FOR LOGIN [ArgentinosJuniors] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 6/9/2023 23:49:28 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ArgentinosJuniors]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IdCategory] [int] IDENTITY(1,1) NOT NULL,
	[Category] [text] NOT NULL,
	[Image] [text] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DCxProduct]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCxProduct](
	[IdDCxProduct] [int] IDENTITY(1,1) NOT NULL,
	[IdDiscountCode] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Percentage] [int] NOT NULL,
 CONSTRAINT [PK_DCxProduct] PRIMARY KEY CLUSTERED 
(
	[IdDCxProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCode](
	[IdDiscountCode] [int] IDENTITY(1,1) NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[DateCreation] [int] NOT NULL,
	[DateExpiration] [int] NOT NULL,
 CONSTRAINT [PK_DiscountCode] PRIMARY KEY CLUSTERED 
(
	[IdDiscountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountProduct]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountProduct](
	[IdDiscountProduct] [int] IDENTITY(1,1) NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[DateExpiration] [date] NOT NULL,
	[Percentage] [int] NOT NULL,
 CONSTRAINT [PK_DiscountProduct] PRIMARY KEY CLUSTERED 
(
	[IdDiscountProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IdEmployee] [int] IDENTITY(1,1) NOT NULL,
	[IdPermissions] [int] NOT NULL,
	[User] [text] NOT NULL,
	[Password] [text] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IdEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[IdFooter] [int] IDENTITY(1,1) NOT NULL,
	[RouteLogo] [text] NULL,
	[Twitter] [text] NOT NULL,
	[Instagram] [text] NOT NULL,
	[Facebook] [text] NOT NULL,
	[Youtube] [text] NOT NULL,
	[InstagramBS] [text] NOT NULL,
	[FacebookBS] [text] NOT NULL,
	[PhoneNumber] [text] NOT NULL,
	[Emal] [text] NOT NULL,
	[AllRightsReserved] [text] NOT NULL,
	[Adress] [text] NOT NULL,
	[OficcialPage] [text] NOT NULL,
	[QR] [text] NOT NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[IdFooter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageCarrousel]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageCarrousel](
	[IdImageCarrousel] [int] IDENTITY(1,1) NOT NULL,
	[Route] [text] NOT NULL,
	[Index] [int] NOT NULL,
 CONSTRAINT [PK_ImageCarrousel] PRIMARY KEY CLUSTERED 
(
	[IdImageCarrousel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageProduct]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProduct](
	[IdImageProduct] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Image] [text] NOT NULL,
 CONSTRAINT [PK_ImageProduct] PRIMARY KEY CLUSTERED 
(
	[IdImageProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManageStock]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManageStock](
	[IdManageStock] [int] IDENTITY(1,1) NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdStock] [int] NOT NULL,
	[IdReason] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [int] NULL,
 CONSTRAINT [PK_ManageStock] PRIMARY KEY CLUSTERED 
(
	[IdManageStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdShipping] [int] NOT NULL,
	[IdDiscountCode] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[Status] [text] NOT NULL,
	[DateDelivered] [date] NULL,
	[Comments] [text] NULL,
	[PaymentMethod] [text] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[IdPermissions] [int] IDENTITY(1,1) NOT NULL,
	[Permissions] [text] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[IdPermissions] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[IdCategory] [int] NOT NULL,
	[IdSubCategory] [int] NOT NULL,
	[Title] [text] NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [text] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Material] [text] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductxOrder]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductxOrder](
	[IdProductxOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdOrder] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductxOrder] PRIMARY KEY CLUSTERED 
(
	[IdProductxOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reason]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reason](
	[IdReason] [int] IDENTITY(1,1) NOT NULL,
	[Reason] [text] NOT NULL,
 CONSTRAINT [PK_Reason] PRIMARY KEY CLUSTERED 
(
	[IdReason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[IdShipping] [int] IDENTITY(1,1) NOT NULL,
	[Adress] [text] NOT NULL,
	[PostalCode] [text] NOT NULL,
	[Location] [text] NOT NULL,
	[PriceShipping] [int] NOT NULL,
	[CompanyShiping] [text] NOT NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[IdShipping] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[IdSize] [int] IDENTITY(1,1) NOT NULL,
	[size] [text] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[IdSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[IdStock] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdSize] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[IdStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[IdSubCategory] [int] IDENTITY(1,1) NOT NULL,
	[SubCategory] [text] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[IdSubCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[User] [text] NOT NULL,
	[Password] [text] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[Email] [text] NOT NULL,
	[MembershipNumber] [int] NULL,
	[Dni] [int] NULL,
	[DateOfBirth] [date] NULL,
	[PhoneNumber] [text] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAdress]    Script Date: 6/9/2023 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdress](
	[IdUserAdress] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[Adress] [text] NOT NULL,
	[PostalCode] [text] NOT NULL,
	[Location] [text] NOT NULL,
 CONSTRAINT [PK_UserAdress] PRIMARY KEY CLUSTERED 
(
	[IdUserAdress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([IdCategory], [Category], [Image]) VALUES (1, N'Futbol', N'futbol.png')
INSERT [dbo].[Category] ([IdCategory], [Category], [Image]) VALUES (2, N'Basquet', N'basquet.png')
INSERT [dbo].[Category] ([IdCategory], [Category], [Image]) VALUES (3, N'Indumentaria', N'indumentaria.png')
INSERT [dbo].[Category] ([IdCategory], [Category], [Image]) VALUES (4, N'Merchandising', N'merchandising')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([IdFooter], [RouteLogo], [Twitter], [Instagram], [Facebook], [Youtube], [InstagramBS], [FacebookBS], [PhoneNumber], [Emal], [AllRightsReserved], [Adress], [OficcialPage], [QR]) VALUES (3, N'1', N'https://twitter.com/AAAJoficial', N'https://www.instagram.com/aaajoficial/', N'https://www.facebook.com/AAAJOficial', N'https://www.youtube.com/channel/UCVSJZeWIeKrgEe-nTRHQ8uA', N'https://www.instagram.com/bichostoreaaaj/', N'facebook.com/BichoStoreAAAJ/ostoreaaaj/', N'11-3763-0888', N'socios@argentinosjuniors.com.ar', N'© 2023 Asociación Atlética Argentinos Juniors', N'Gavilán 2151', N'https://argentinosjuniors.com.ar/', N'qr.png')
SET IDENTITY_INSERT [dbo].[Footer] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageCarrousel] ON 

INSERT [dbo].[ImageCarrousel] ([IdImageCarrousel], [Route], [Index]) VALUES (1, N'carrousel1.png', 1)
INSERT [dbo].[ImageCarrousel] ([IdImageCarrousel], [Route], [Index]) VALUES (2, N'carrousel2.png', 2)
INSERT [dbo].[ImageCarrousel] ([IdImageCarrousel], [Route], [Index]) VALUES (3, N'carrousel3.png', 3)
INSERT [dbo].[ImageCarrousel] ([IdImageCarrousel], [Route], [Index]) VALUES (4, N'carrousel4.png', 4)
INSERT [dbo].[ImageCarrousel] ([IdImageCarrousel], [Route], [Index]) VALUES (5, N'carrousel3.png', 5)
SET IDENTITY_INSERT [dbo].[ImageCarrousel] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageProduct] ON 

INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (1, 1, N'Product1.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (2, 2, N'Product2.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (3, 3, N'Product3.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (4, 7, N'Product4.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (5, 8, N'Product5.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (6, 9, N'Product6.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (7, 10, N'Product7.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (8, 11, N'Product8.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (9, 12, N'Product9.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (10, 13, N'Product10.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (11, 14, N'Product11.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (12, 15, N'Product12.png')
INSERT [dbo].[ImageProduct] ([IdImageProduct], [IdProduct], [Image]) VALUES (13, 16, N'Product13.png')
SET IDENTITY_INSERT [dbo].[ImageProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (1, 1, 1, N'Camiseta OF. 1 22/23 Umbro', 17500, N'Logo UMBRO bordado.
Escudo ARGENTINOS JUNIORS aplicado.', 1, N'91% Poliéster, 9% Elastano.')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (2, 1, 1, N'Camiseta Arquero verde 2022 Umbro', 17500, N'Camiseta de arquero 2022 verde Umbro', 1, N'91% Poliéster - 9% elastano')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (3, 1, 2, N'Camiseta Dama OF.1 22/23 Umbro', 16500, N'Logo UMBRO bordado.
Escudo ARGENTINOS JUNIORS aplicado.
Diseño entallado.', 1, N'91% Poliéster, 9% Elastano')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (7, 1, 3, N'Camiseta Titular Umbro Niños 22/23 Umbro', 14500, N'Logo UMBRO bordado.
Escudo ARGENTINOS JUNIORS aplicado.
', 1, N'91% Poliéster, 9% Elastano')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (8, 1, 3, N'Camiseta OF.2 22/23 niños/as Umbro', 14000, N'Logo UMBRO bordado.
Escudo ARGENTINOS JUNIORS aplicado', 1, N'91% Poliéster, 9% Elastano')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (9, 1, 3, N'Short OF.1 22/23 niños/as Umbro', 9200, N'Cintura elastizada con cordón de ajuste interno.', 1, N'91% Poliéster, 9% Elastano')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (10, 3, 3, N'Body bordado manga larga', 3800, N'Body bordado manga larga', 1, N'100% Algodón ')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (11, 3, 3, N'Body bordado manga corta', 3600, N'Body bordado manga corta', 1, N'100% Algodón ')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (12, 3, 3, N'Pantalón bebe', 2800, N'Pantalón bebe', 1, N'100% Algodón ')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (13, 3, 1, N'Campera de Salida gris 2022 Umbro', 17600, N'*Campera de Salida gris 2022 Umbro*
', 1, N'86,5% poliester 13,5% Lycra')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (14, 1, 3, N'Conjunto Rojo 22/23 rojo niños/as', 9000, N'Conjunto camiseta y short rojo AJ 
', 1, N'91% Poliéster, 9% Elastano')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (15, 1, 3, N'Short OF.1 22/23 niños/as Umbro', 9200, N'Cintura elastizada con cordón de ajuste interno.
Logo UMBRO bordado.
Escudo ARGENTINOS JUNIORS aplicado.', 1, N'91% Poliéster, 9% Elastano')
INSERT [dbo].[Product] ([IdProduct], [IdCategory], [IdSubCategory], [Title], [Price], [Description], [Enabled], [Material]) VALUES (16, 1, 1, N'Medias Umbro 20/21', 1800, N'Medias Umbro 20/21', 1, N'100% Algodón ')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([IdSize], [size]) VALUES (1, N'S')
INSERT [dbo].[Size] ([IdSize], [size]) VALUES (2, N'M')
INSERT [dbo].[Size] ([IdSize], [size]) VALUES (3, N'L')
INSERT [dbo].[Size] ([IdSize], [size]) VALUES (4, N'XL')
INSERT [dbo].[Size] ([IdSize], [size]) VALUES (5, N'XXL')
INSERT [dbo].[Size] ([IdSize], [size]) VALUES (6, N'unico')
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (1, 1, 1, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (2, 1, 2, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (4, 1, 3, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (5, 1, 4, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (6, 1, 5, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (7, 2, 1, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (8, 2, 2, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (9, 2, 3, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (10, 2, 4, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (11, 2, 5, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (12, 3, 1, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (13, 3, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (14, 3, 3, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (15, 3, 4, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (16, 3, 5, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (17, 7, 1, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (18, 7, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (19, 7, 3, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (20, 7, 4, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (21, 8, 1, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (22, 8, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (23, 8, 3, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (24, 8, 4, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (25, 8, 5, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (26, 9, 1, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (27, 9, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (28, 9, 3, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (29, 9, 4, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (30, 10, 1, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (31, 10, 2, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (32, 10, 3, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (33, 10, 4, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (34, 10, 5, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (35, 11, 1, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (36, 11, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (37, 11, 3, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (38, 11, 4, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (39, 11, 5, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (40, 12, 1, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (41, 12, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (42, 13, 1, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (43, 13, 2, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (44, 13, 3, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (45, 13, 4, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (46, 13, 5, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (47, 14, 1, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (48, 14, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (49, 14, 3, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (50, 14, 4, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (51, 14, 5, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (52, 15, 1, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (53, 15, 2, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (54, 15, 3, 5)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (55, 15, 4, 0)
INSERT [dbo].[Stock] ([IdStock], [IdProduct], [IdSize], [Quantity]) VALUES (56, 16, 6, 10)
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([IdSubCategory], [SubCategory]) VALUES (1, N'Hombre')
INSERT [dbo].[SubCategory] ([IdSubCategory], [SubCategory]) VALUES (2, N'Mujer')
INSERT [dbo].[SubCategory] ([IdSubCategory], [SubCategory]) VALUES (3, N'Niño')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
ALTER TABLE [dbo].[ImageProduct]  WITH CHECK ADD  CONSTRAINT [FK_ImageProduct_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[ImageProduct] CHECK CONSTRAINT [FK_ImageProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([IdCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([IdSubCategory])
REFERENCES [dbo].[SubCategory] ([IdSubCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Product]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Size] FOREIGN KEY([IdSize])
REFERENCES [dbo].[Size] ([IdSize])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Size]
GO
USE [master]
GO
ALTER DATABASE [db_aajj] SET  READ_WRITE 
GO
