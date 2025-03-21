USE [master]
GO

CREATE DATABASE [sirket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sirket', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\sirket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sirket_log', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\sirket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sirket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sirket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sirket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sirket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sirket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sirket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sirket] SET ARITHABORT OFF 
GO
ALTER DATABASE [sirket] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sirket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sirket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sirket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sirket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sirket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sirket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sirket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sirket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sirket] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sirket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sirket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sirket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sirket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sirket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sirket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sirket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sirket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sirket] SET  MULTI_USER 
GO
ALTER DATABASE [sirket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sirket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sirket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sirket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sirket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sirket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sirket] SET QUERY_STORE = OFF
GO
USE [sirket]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ilceadı](@ilceno int) 
returns varchar(20) 
as
begin
	declare @ilceadı varchar(20)  
	select @ilceadı=ilce_ad from ilce where ilce_no=@ilceno
	return @ilceadı
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[projeadı](@projeno int) 
returns varchar(20) 
as
begin
	declare @projeismi varchar(20)  
	select @projeismi=proje_ad from proje where proje_no=@projeno
	return @projeismi
end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[tamisim](@personelno int) 
returns varchar(100) 
as
begin
	declare @isim varchar(100)  
	select @isim=ad+' - '+soyad from personel where personel_no=@personelno 
	return @isim
end
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[birim](
	[birim_no] [int] IDENTITY(1,1) NOT NULL,
	[birim_ad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[birim_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gorevlendirme](
	[gorevlendirme_no] [int] IDENTITY(1,1) NOT NULL,
	[proje_no] [int] NOT NULL,
	[personel_no] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gorevlendirme_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[il](
	[il_no] [char](2) NOT NULL,
	[il_ad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[il_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ilce](
	[ilce_no] [int] IDENTITY(1,1) NOT NULL,
	[ilce_ad] [varchar](20) NOT NULL,
	[il_no] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ilce_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personel](
	[personel_no] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](25) NOT NULL,
	[soyad] [varchar](25) NOT NULL,
	[cinsiyet] [char](1) NOT NULL,
	[dogum_tarihi] [date] NOT NULL,
	[dogum_yeri] [int] NOT NULL,
	[baslama_tarihi] [date] NOT NULL,
	[birim_no] [int] NOT NULL,
	[unvan_no] [int] NOT NULL,
	[calisma_saati] [tinyint] NOT NULL,
	[maas] [money] NOT NULL,
	[prim] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[personel_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proje](
	[proje_no] [int] IDENTITY(1,1) NOT NULL,
	[proje_ad] [varchar](20) NOT NULL,
	[baslama_tarihi] [date] NOT NULL,
	[planlanan_bitis_tarihi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[proje_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unvan](
	[unvan_no] [int] IDENTITY(1,1) NOT NULL,
	[unvan_ad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[unvan_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[birim] ON 

INSERT [dbo].[birim] ([birim_no], [birim_ad]) VALUES (3, N'ARGE')
INSERT [dbo].[birim] ([birim_no], [birim_ad]) VALUES (2, N'İDARİ')
INSERT [dbo].[birim] ([birim_no], [birim_ad]) VALUES (1, N'KALİTE')
INSERT [dbo].[birim] ([birim_no], [birim_ad]) VALUES (4, N'TEKNİK')
SET IDENTITY_INSERT [dbo].[birim] OFF
GO
SET IDENTITY_INSERT [dbo].[gorevlendirme] ON 

INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (1, 1, 3)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (2, 1, 5)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (3, 1, 7)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (4, 1, 8)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (5, 1, 11)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (6, 2, 1)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (7, 2, 3)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (8, 2, 5)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (9, 2, 10)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (10, 2, 12)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (11, 2, 13)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (12, 3, 3)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (13, 3, 4)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (14, 3, 9)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (15, 3, 15)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (16, 3, 19)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (17, 3, 21)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (18, 3, 25)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (19, 3, 27)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (20, 4, 2)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (21, 4, 3)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (22, 4, 8)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (23, 4, 10)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (24, 4, 20)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (25, 4, 27)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (26, 5, 3)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (27, 5, 5)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (28, 5, 11)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (29, 5, 21)
INSERT [dbo].[gorevlendirme] ([gorevlendirme_no], [proje_no], [personel_no]) VALUES (30, 5, 26)
SET IDENTITY_INSERT [dbo].[gorevlendirme] OFF
GO
INSERT [dbo].[il] ([il_no], [il_ad]) VALUES (N'06', N'ANKARA')
INSERT [dbo].[il] ([il_no], [il_ad]) VALUES (N'34', N'İSTANBUL')
INSERT [dbo].[il] ([il_no], [il_ad]) VALUES (N'35', N'İZMİR')
GO
SET IDENTITY_INSERT [dbo].[ilce] ON 

INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (4, N'AVCILAR', N'34')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (5, N'BEYLİKDÜZÜ', N'34')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (7, N'BUCA', N'35')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (1, N'ÇANKAYA', N'06')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (6, N'ESENYURT', N'34')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (8, N'KARŞIYAKA', N'35')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (9, N'KONAK', N'35')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (2, N'POLATLI', N'06')
INSERT [dbo].[ilce] ([ilce_no], [ilce_ad], [il_no]) VALUES (3, N'YENİMAHALLE', N'06')
SET IDENTITY_INSERT [dbo].[ilce] OFF
GO
SET IDENTITY_INSERT [dbo].[personel] ON 

INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (1, N'Ahmet', N'EKİNCİ', N'E', CAST(N'1985-03-25' AS Date), 2, CAST(N'2002-03-01' AS Date), 1, 1, 35, 2500.0000, 350.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (2, N'Burak', N'TURHAN', N'E', CAST(N'1980-04-15' AS Date), 3, CAST(N'2002-05-03' AS Date), 2, 2, 30, 2800.0000, 250.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (3, N'Ceyda', N'SAKARYA', N'K', CAST(N'1983-03-23' AS Date), 7, CAST(N'2005-05-12' AS Date), 2, 3, 30, 3000.0000, 250.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (4, N'Demet', N'ÇOLAK', N'K', CAST(N'1982-05-05' AS Date), 5, CAST(N'2005-06-17' AS Date), 3, 3, 40, 2800.0000, 350.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (5, N'Evrim', N'ÇITAK', N'K', CAST(N'1987-12-05' AS Date), 1, CAST(N'2000-01-12' AS Date), 2, 1, 30, 4500.0000, 500.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (6, N'Figen', N'ESMER', N'K', CAST(N'1982-10-22' AS Date), 4, CAST(N'1998-05-07' AS Date), 1, 2, 35, 4000.0000, 250.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (7, N'Galip', N'TANAR', N'E', CAST(N'1983-02-28' AS Date), 9, CAST(N'1997-05-07' AS Date), 1, 2, 35, 5200.0000, 450.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (8, N'Emir', N'YANIK', N'E', CAST(N'1975-05-07' AS Date), 2, CAST(N'2010-07-17' AS Date), 2, 2, 45, 4500.0000, 450.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (9, N'Ilgın', N'ACI', N'E', CAST(N'1974-05-01' AS Date), 2, CAST(N'2000-08-18' AS Date), 3, 2, 40, 4200.0000, 400.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (10, N'İskender', N'TAŞ', N'E', CAST(N'1974-07-02' AS Date), 7, CAST(N'1995-09-05' AS Date), 4, 1, 40, 4400.0000, 400.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (11, N'Jale', N'CAN', N'K', CAST(N'1976-09-18' AS Date), 5, CAST(N'1998-10-12' AS Date), 2, 2, 45, 3250.0000, 450.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (12, N'Kamil', N'ALBAYRAK', N'E', CAST(N'1976-08-19' AS Date), 9, CAST(N'2000-11-25' AS Date), 1, 2, 30, 5200.0000, 250.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (13, N'Leman', N'HASKIRIŞ', N'K', CAST(N'1978-09-20' AS Date), 6, CAST(N'1999-10-27' AS Date), 1, 2, 35, 4200.0000, 350.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (14, N'Meltem', N'UYSAL', N'K', CAST(N'1985-08-04' AS Date), 6, CAST(N'2000-05-27' AS Date), 1, 2, 30, 2500.0000, 100.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (15, N'Necati', N'UYSAL', N'E', CAST(N'1990-12-01' AS Date), 4, CAST(N'2000-03-06' AS Date), 2, 1, 30, 2000.0000, 150.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (16, N'Osman', N'UYSAL', N'E', CAST(N'1982-02-15' AS Date), 6, CAST(N'1995-05-12' AS Date), 4, 3, 30, 4800.0000, 150.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (17, N'Ömer', N'BUZDAĞ', N'E', CAST(N'1980-10-30' AS Date), 5, CAST(N'2001-08-10' AS Date), 1, 2, 40, 4800.0000, 400.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (18, N'Perihan', N'KANAT', N'K', CAST(N'1980-10-28' AS Date), 4, CAST(N'2001-07-11' AS Date), 4, 1, 30, 2200.0000, 300.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (19, N'Ramiz', N'ÇAKIR', N'E', CAST(N'1981-11-19' AS Date), 7, CAST(N'2001-07-30' AS Date), 4, 3, 30, 2700.0000, 300.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (20, N'Sertaç', N'KÖSEDAĞ', N'E', CAST(N'1981-12-20' AS Date), 9, CAST(N'2002-12-20' AS Date), 3, 2, 30, 2900.0000, 350.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (21, N'Şefik', N'ÇAPANOĞLU', N'E', CAST(N'1982-02-20' AS Date), 6, CAST(N'1998-05-25' AS Date), 3, 3, 30, 4800.0000, 200.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (22, N'Taner', N'BOZOKLU', N'E', CAST(N'1983-07-21' AS Date), 5, CAST(N'2005-09-05' AS Date), 1, 2, 30, 3000.0000, 200.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (23, N'Utku', N'DUMAN', N'E', CAST(N'1975-06-13' AS Date), 6, CAST(N'2005-03-05' AS Date), 1, 3, 30, 2800.0000, 200.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (24, N'Ümit', N'ŞİRİN', N'E', CAST(N'1978-04-02' AS Date), 7, CAST(N'1998-04-04' AS Date), 2, 2, 35, 3300.0000, 250.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (25, N'Veysel', N'ERTÜZÜN', N'E', CAST(N'1980-07-03' AS Date), 3, CAST(N'2002-07-18' AS Date), 4, 3, 35, 3100.0000, 300.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (26, N'Yakup', N'GÖKÇE', N'E', CAST(N'1975-06-18' AS Date), 2, CAST(N'2002-03-25' AS Date), 4, 3, 35, 3100.0000, 450.0000)
INSERT [dbo].[personel] ([personel_no], [ad], [soyad], [cinsiyet], [dogum_tarihi], [dogum_yeri], [baslama_tarihi], [birim_no], [unvan_no], [calisma_saati], [maas], [prim]) VALUES (27, N'Zeliha', N'CANİŞ', N'K', CAST(N'1978-03-03' AS Date), 5, CAST(N'2005-08-13' AS Date), 1, 3, 40, 2500.0000, 500.0000)
SET IDENTITY_INSERT [dbo].[personel] OFF
GO
SET IDENTITY_INSERT [dbo].[proje] ON 

INSERT [dbo].[proje] ([proje_no], [proje_ad], [baslama_tarihi], [planlanan_bitis_tarihi]) VALUES (1, N'TEMİZ DÜNYA', CAST(N'2015-01-20' AS Date), CAST(N'2017-01-11' AS Date))
INSERT [dbo].[proje] ([proje_no], [proje_ad], [baslama_tarihi], [planlanan_bitis_tarihi]) VALUES (2, N'GÜVENLİ INTERNET', CAST(N'2017-05-15' AS Date), CAST(N'2020-06-09' AS Date))
INSERT [dbo].[proje] ([proje_no], [proje_ad], [baslama_tarihi], [planlanan_bitis_tarihi]) VALUES (3, N'MUTLU ŞEHİR', CAST(N'2017-07-11' AS Date), CAST(N'2019-11-29' AS Date))
INSERT [dbo].[proje] ([proje_no], [proje_ad], [baslama_tarihi], [planlanan_bitis_tarihi]) VALUES (4, N'AKILLI EVLER', CAST(N'2018-02-10' AS Date), CAST(N'2021-11-29' AS Date))
INSERT [dbo].[proje] ([proje_no], [proje_ad], [baslama_tarihi], [planlanan_bitis_tarihi]) VALUES (5, N'SESSİZ ORTAM', CAST(N'2018-03-01' AS Date), CAST(N'2019-11-29' AS Date))
SET IDENTITY_INSERT [dbo].[proje] OFF
GO
SET IDENTITY_INSERT [dbo].[unvan] ON 

INSERT [dbo].[unvan] ([unvan_no], [unvan_ad]) VALUES (2, N'İK UZMANI')
INSERT [dbo].[unvan] ([unvan_no], [unvan_ad]) VALUES (1, N'MÜHENDİS')
INSERT [dbo].[unvan] ([unvan_no], [unvan_ad]) VALUES (3, N'TEKNİSYEN')
SET IDENTITY_INSERT [dbo].[unvan] OFF
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[birim] ADD UNIQUE NONCLUSTERE
(
	[birim_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[gorevlendirme] ADD  CONSTRAINT [projePersonelTekil] UNIQUE NONCLUSTERED 
(
	[proje_no] ASC,
	[personel_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[il] ADD UNIQUE NONCLUSTERED 
(
	[il_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[ilce] ADD  CONSTRAINT [ilceTekil] UNIQUE NONCLUSTERED 
(
	[ilce_ad] ASC,
	[il_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[proje] ADD UNIQUE NONCLUSTERED 
(
	[proje_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[unvan] ADD UNIQUE NONCLUSTERED 
(
	[unvan_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[personel] ADD  DEFAULT ((0)) FOR [prim]
GO
ALTER TABLE [dbo].[gorevlendirme]  WITH CHECK ADD FOREIGN KEY([personel_no])
REFERENCES [dbo].[personel] ([personel_no])
GO
ALTER TABLE [dbo].[gorevlendirme]  WITH CHECK ADD FOREIGN KEY([proje_no])
REFERENCES [dbo].[proje] ([proje_no])
GO
ALTER TABLE [dbo].[ilce]  WITH CHECK ADD FOREIGN KEY([il_no])
REFERENCES [dbo].[il] ([il_no])
GO
ALTER TABLE [dbo].[personel]  WITH CHECK ADD FOREIGN KEY([birim_no])
REFERENCES [dbo].[birim] ([birim_no])
GO
ALTER TABLE [dbo].[personel]  WITH CHECK ADD FOREIGN KEY([dogum_yeri])
REFERENCES [dbo].[ilce] ([ilce_no])
GO
ALTER TABLE [dbo].[personel]  WITH CHECK ADD FOREIGN KEY([unvan_no])
REFERENCES [dbo].[unvan] ([unvan_no])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[birim_kayıt_sil]
(
     @birimno int
)
AS DELETE FROM birim WHERE birim_no=@birimno
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[birim_tablosuna_kayıtekle]
(    @birimad varchar(20)	)
AS
BEGIN
     insert into birim (birim_ad)
	 values (@birimad)
	 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gorevlendirme_kayıt_sil]
(  @gorevlendirmeno int  )
AS DELETE FROM gorevlendirme WHERE gorevlendirme_no=@gorevlendirmeno
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[gorevlendirme_tablosuna_kayıtekle]
(    @gorevlendirmeno int,
     @projeno int ,
	 @presonelno int 
)
AS
BEGIN
     insert into gorevlendirme (gorevlendirme_no,proje_no,personel_no)
	 values (@gorevlendirmeno,@projeno,@presonelno)
	 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[il_kayıt_sil]
(   @ilno char(2) 	)
AS DELETE FROM il WHERE il_no=@ilno
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[il_tablosuna_kayıtekle]
(    @ilno char(2),
     @ilad varchar(20)
 )
AS
BEGIN
     insert into il (il_no,il_ad) values (@ilno,@ilad)

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ilce_kayıt_sil]
(   @ilceno int	)
AS DELETE FROM ilce WHERE ilce_no=@ilceno
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[ilce_tablosuna_kayıtekle]
(    @ilceno int,
     @ilcead varchar(20),
	 @ilno char(2)
)
AS
BEGIN
     insert into ilce(ilce_no,ilce_ad,il_no) values (@ilceno,@ilcead,@ilceno)
	
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personel_kayıt_sil]
(  @personelno int  )
AS DELETE FROM personel WHERE personel_no=@personelno
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[personel_tablosuna_kayıtekle]
(  
     @personelno int,
	 @adı varchar(25),
	 @soyadı varchar(25),
	 @cinsiyeti char(1),
	 @dogumtarihi date,
	 @dogumyeri int,
	 @baslamatarihi date,
	 @birimno int,
	 @unvanno int ,
	 @calismasaati tinyint ,
	 @maası money,
	 @pirimi money


)
AS
BEGIN
     insert into personel (personel_no,ad,soyad,cinsiyet,dogum_tarihi,dogum_yeri,baslama_tarihi,birim_no,unvan_no,calisma_saati,maas,prim)
	 values            (@personelno,@adı,@soyadı,@cinsiyeti,@dogumtarihi,@dogumyeri,@baslamatarihi,@birimno,@unvanno,@calismasaati,@maası,@pirimi)
	
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proje_kayıt_sil]
(
     @projeno int
	
)
AS DELETE FROM proje WHERE proje_no=@projeno
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[proje_tablosuna_kayıtekle]
(    @projeno int,
     @projead varchar(20),
	 @baslamatarihi date,
	 @planan_bitistarihi date
)
AS
BEGIN
     insert into proje(proje_no,proje_ad,baslama_tarihi,planlanan_bitis_tarihi)
	 values (@projeno,@projead,@baslamatarihi,@planan_bitistarihi)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[unvan_kayıt_sil]
(    @unvanno int )
AS DELETE FROM unvan WHERE unvan_no=@unvanno
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[unvan_tablosuna_kayıtekle]
(    @unvanno int,
     @unvanad varchar(20)
)
AS
BEGIN
     insert into unvan(unvan_no,unvan_ad) values (@unvanno,@unvanad)
END
GO
USE [master]
GO
ALTER DATABASE [sirket] SET  READ_WRITE 
GO
