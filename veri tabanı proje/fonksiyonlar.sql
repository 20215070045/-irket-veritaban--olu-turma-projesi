

create function tamisim(@personelno int) 
returns varchar(100) 
as
begin
	declare @isim varchar(100)  
	select @isim=ad+' - '+soyad from personel where personel_no=@personelno 
	return @isim
end

create function ilceadý(@ilceno int) 
returns varchar(20) 
as
begin
	declare @ilceadý varchar(20)  
	select @ilceadý=ilce_ad from ilce where ilce_no=@ilceno
	return @ilceadý
end

create function projeadý(@projeno int) 
returns varchar(20) 
as
begin
	declare @projeismi varchar(20)  
	select @projeismi=proje_ad from proje where proje_no=@projeno
	return @projeismi
end


