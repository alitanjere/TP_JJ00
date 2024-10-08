USE [master]
GO
/****** Object:  Database [jjoo]    Script Date: 19/8/2024 16:49:59 ******/
CREATE DATABASE [jjoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jjoo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\jjoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jjoo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\jjoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [jjoo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jjoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jjoo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jjoo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jjoo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jjoo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jjoo] SET ARITHABORT OFF 
GO
ALTER DATABASE [jjoo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jjoo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jjoo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jjoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jjoo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jjoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jjoo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jjoo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jjoo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jjoo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jjoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jjoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jjoo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jjoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jjoo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jjoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jjoo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jjoo] SET RECOVERY FULL 
GO
ALTER DATABASE [jjoo] SET  MULTI_USER 
GO
ALTER DATABASE [jjoo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jjoo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jjoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jjoo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jjoo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [jjoo] SET QUERY_STORE = OFF
GO
USE [jjoo]
GO
/****** Object:  Table [dbo].[Deportes]    Script Date: 19/8/2024 16:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportes](
	[IdDeporte] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Foto] [text] NOT NULL,
 CONSTRAINT [PK_Deportes] PRIMARY KEY CLUSTERED 
(
	[IdDeporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 19/8/2024 16:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[IdDeportista] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](200) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [text] NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdDeporte] [int] NOT NULL,
 CONSTRAINT [PK_Deportistas] PRIMARY KEY CLUSTERED 
(
	[IdDeportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 19/8/2024 16:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Bandera] [text] NOT NULL,
	[FechaFundacion] [date] NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Deportes] ON 

INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (1, N'Futbol', N'futbol.png')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (2, N'Hockey', N'hockey.png')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (3, N'Gimnasia', N'gimnasia.png')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (4, N'Basketball', N'basket.png')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (5, N'Natacion', N'nata.png')
SET IDENTITY_INSERT [dbo].[Deportes] OFF
GO
SET IDENTITY_INSERT [dbo].[Deportistas] ON 

INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (1, N'Biles', N'Simon', CAST(N'1997-03-14' AS Date), N'/Images/biles.png', 2, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (2, N'Alvarez', N'Julian', CAST(N'2000-01-31' AS Date), N'/Images/julian.png', 1, 1)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (3, N'James', N'Lebron', CAST(N'1984-12-30' AS Date), N'/Images/lebron.png', 2, 4)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (4, N'Fratus', N'Bruno', CAST(N'1989-06-30' AS Date), N'/Images/bruno.png', 3, 5)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (5, N'Huse', N'Viktoria', CAST(N'1995-10-24' AS Date), N'/Images/viktoria.png', 5, 2)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (17, N'Andrade', N'Rebeca', CAST(N'1999-05-08' AS Date), N'https://th.bing.com/th/id/OIP.VJiUq3zOhFkb8QRwcc87SwAAAA?https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSpQDQOIVXpauBz9IC_HG4TXSKCZsXufH6n3ZhPsj6vOGNiYWftyi50IiMeEHijc5z4_4-tzanO7D2QcRc', 3, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (18, N'Succi', N'Belen', CAST(N'1995-03-12' AS Date), N'https://crar.com.ar/download/multimedia.normal.a547dcf2f4c93312.QmVsw6luIFN1Y2NpX25vcm1hbC53ZWJw.webp', 1, 2)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (19, N'Martinez', N'Enzo', CAST(N'2001-11-18' AS Date), N'https://imagenes.montevideo.com.uy/imgnoticias/202107/_W933_80/769714.jpg', 4, 5)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (20, N'Vescovi', N'Santiago', CAST(N'2001-09-14' AS Date), N'https://www.rockytopinsider.com/wp-content/uploads/2021/01/IMG_8019.jpg', 5, 4)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (21, N'Núñez  ', N'Darwin', CAST(N'1999-06-24' AS Date), N'https://www.thisisanfield.com/wp-content/uploads/2XDNMR7-1-600x400.jpg', 4, 1)
SET IDENTITY_INSERT [dbo].[Deportistas] OFF
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (1, N'Argentina', N'arg.png', CAST(N'1878-08-09' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (2, N'Estados Unidos', N'usa.png', CAST(N'1967-10-12' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (3, N'Brasil', N'bra.png', CAST(N'1890-06-23' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (4, N'Uruguay', N'uru.png', CAST(N'1856-07-30' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (5, N'Alemania', N'ale.png', CAST(N'1870-06-04' AS Date))
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Deportes] FOREIGN KEY([IdDeporte])
REFERENCES [dbo].[Deportes] ([IdDeporte])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Deportes]
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([IdPais])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Paises]
GO
USE [master]
GO
ALTER DATABASE [jjoo] SET  READ_WRITE 
GO
