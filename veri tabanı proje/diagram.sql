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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[birim_ad] ASC
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [projePersonelTekil] UNIQUE NONCLUSTERED 
(
	[proje_no] ASC,
	[personel_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[il]    Script Date: 9.05.2023 12:10:12 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[il_ad] ASC
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ilceTekil] UNIQUE NONCLUSTERED 
(
	[ilce_ad] ASC,
	[il_no] ASC
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[proje_ad] ASC
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[unvan_ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
