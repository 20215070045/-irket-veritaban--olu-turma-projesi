


Create PROCEDURE birim_tablosuna_kayýtekle
(    @birimad varchar(20)	)
AS
BEGIN
     insert into birim (birim_ad)
	 values (@birimad)
	 
END
------------

Create PROCEDURE gorevlendirme_tablosuna_kayýtekle
(    @gorevlendirmeno int,
     @projeno int ,
	 @presonelno int 
)
AS
BEGIN
     insert into gorevlendirme (gorevlendirme_no,proje_no,personel_no)
	 values (@gorevlendirmeno,@projeno,@presonelno)
	 
END

------------------

Create PROCEDURE il_tablosuna_kayýtekle
(    @ilno char(2),
     @ilad varchar(20)
 )
AS
BEGIN
     insert into il (il_no,il_ad) values (@ilno,@ilad)

END

-----------------

Create PROCEDURE ilce_tablosuna_kayýtekle
(    @ilceno int,
     @ilcead varchar(20),
	 @ilno char(2)
)
AS
BEGIN
     insert into ilce(ilce_no,ilce_ad,il_no) values (@ilceno,@ilcead,@ilceno)
	
END

--------------

Create PROCEDURE personel_tablosuna_kayýtekle
(  
     @personelno int,
	 @adý varchar(25),
	 @soyadý varchar(25),
	 @cinsiyeti char(1),
	 @dogumtarihi date,
	 @dogumyeri int,
	 @baslamatarihi date,
	 @birimno int,
	 @unvanno int ,
	 @calismasaati tinyint ,
	 @maasý money,
	 @pirimi money


)
AS
BEGIN
     insert into personel (personel_no,ad,soyad,cinsiyet,dogum_tarihi,dogum_yeri,baslama_tarihi,birim_no,unvan_no,calisma_saati,maas,prim)
	 values            (@personelno,@adý,@soyadý,@cinsiyeti,@dogumtarihi,@dogumyeri,@baslamatarihi,@birimno,@unvanno,@calismasaati,@maasý,@pirimi)
	
END

-----------------

Create PROCEDURE proje_tablosuna_kayýtekle
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

------------------

Create PROCEDURE unvan_tablosuna_kayýtekle
(    @unvanno int,
     @unvanad varchar(20)
)
AS
BEGIN
     insert into unvan(unvan_no,unvan_ad) values (@unvanno,@unvanad)
END

-----------------
