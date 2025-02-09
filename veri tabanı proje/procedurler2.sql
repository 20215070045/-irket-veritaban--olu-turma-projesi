
CREATE PROCEDURE birim_kayýt_sil
(
     @birimno int
)
AS DELETE FROM birim WHERE birim_no=@birimno


CREATE PROCEDURE gorevlendirme_kayýt_sil
(  @gorevlendirmeno int  )
AS DELETE FROM gorevlendirme WHERE gorevlendirme_no=@gorevlendirmeno



CREATE PROCEDURE il_kayýt_sil
(   @ilno char(2) 	)
AS DELETE FROM il WHERE il_no=@ilno


CREATE PROCEDURE ilce_kayýt_sil
(   @ilceno int	)
AS DELETE FROM ilce WHERE ilce_no=@ilceno


CREATE PROCEDURE personel_kayýt_sil
(  @personelno int  )
AS DELETE FROM personel WHERE personel_no=@personelno



CREATE PROCEDURE proje_kayýt_sil
(  @projeno int  )
AS DELETE FROM proje WHERE proje_no=@projeno


CREATE PROCEDURE unvan_kayýt_sil
(    @unvanno int )
AS DELETE FROM unvan WHERE unvan_no=@unvanno

