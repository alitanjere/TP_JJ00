USE [jjoo]
GO
/****** Object:  Database [jjoo]    Script Date: 5/8/2024 10:10:16 ******/
CREATE DATABASE [jjoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jjoo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\jjoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jjoo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\jjoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'jjoo', N'ON'
GO
ALTER DATABASE [jjoo] SET QUERY_STORE = OFF
GO
USE [jjoo]
GO
/****** Object:  User [alumno]    Script Date: 5/8/2024 10:10:16 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Deportes]    Script Date: 5/8/2024 10:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportes](
	[IdDeporte] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Foto] [text] NOT NULL,
 CONSTRAINT [PK_Deportes] PRIMARY KEY CLUSTERED 
(
	[IdDeporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 5/8/2024 10:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[IdDeportista] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Paises]    Script Date: 5/8/2024 10:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Bandera] [text] NOT NULL,
	[FechaFundacion] [date] NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [jjoo]
GO
ALTER DATABASE [jjoo] SET  READ_WRITE 
GO
