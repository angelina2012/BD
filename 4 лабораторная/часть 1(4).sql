use ��������
go
--------�������� ��������� ������
DECLARE @Driver TABLE (id INT, name varchar(255))
insert into @Driver (id,name) values (1,'���� ������')
insert into @Driver (id,name) values (2,'���� ������')
INSERT INTO @Driver(id, name) VALUES (3,'����� �������') 
SELECT * FROM @Driver


CREATE TABLE #ProductSummary
(ProdId INT IDENTITY,
ProdName NVARCHAR(20),
Price MONEY)
 
INSERT INTO #ProductSummary
VALUES ('Nokia 8', 18000),
        ('iPhone 8', 56000)
 
SELECT * FROM #ProductSummary



DECLARE @Tourist TABLE(id INT,	fio VARCHAR (255) )
INSERT @Tourist SELECT id_tourist, fio FROM Tourists 
SELECT * FROM @Tourist

-----------------------------IF

DECLARE @volume_name INT 
DECLARE @name VARCHAR(255)
SET @volume_name = (SELECT COUNT(*) FROM Hotels) 
IF @volume_name >10
BEGIN
SET @name = '���������� ������ ������ 10'
SELECT @name
END ELSE BEGIN
SET @name = '���������� ������ = ' + str(@volume_name)
SELECT @name
END


DECLARE @count INT
DECLARE @name_tourists VARCHAR(255)
SET @count =(SELECT COUNT(*) FROM Tourists)
IF @name_tourists >5
BEGIN
SET  @name_tourists='���������� �������� ������ 5'
SELECT  @name_tourists
END ELSE BEGIN
SET  @name_tourists ='���������� �������� =' + str(@count) 
SELECT  @name_tourists
END
 ---------------------------------------------------------------WHILE
 DECLARE @a INT SET @a = 1 WHILE @a <50
BEGIN
PRINT @a 
iF (@a>30) AND (@a<40)
BREAK --����� � ���������� 1-� ������� �� ������
ELSE
SET @a = @a+rand()*10 
CONTINUE
END
 PRINT @a


 DECLARE @b INT SET @b = 1 WHILE @b <60
BEGIN
PRINT @b
iF (@b>35) AND (@b<40)
BREAK --����� � ���������� 1-� ������� �� ������
ELSE
SET @b = @b+rand()*10 
CONTINUE
END
 PRINT @b

 ---------------------��������� �������
use ��������
go
IF OBJECT_ID (N'dbo.ISOweek', N'FN') IS NOT NULL 
DROP FUNCTION dbo.ISOweek;

go
CREATE FUNCTION dbo.ISOweek (@DATE date) RETURNS CHAR(15)
WITH EXECUTE AS CALLER AS
BEGIN
DECLARE @man int; 
DECLARE @ISOweek char(15); 
SET @man= MONTH(@DATE)

IF (@man=1) SET @ISOweek='������'; 
IF (@man=2) SET @ISOweek='�������';
IF (@man=3) SET @ISOweek='����';
IF (@man=4) SET @ISOweek='������'; 
IF (@man=5) SET @ISOweek='���';
IF (@man=6) SET @ISOweek='����'; 
IF (@man=7) SET @ISOweek='����';
IF (@man=8) SET @ISOweek='������';
IF (@man=9) SET @ISOweek='��������'; 
IF (@man=10) SET @ISOweek='�������'; 
IF (@man=11) SET @ISOweek='������';
IF (@man=12) SET @ISOweek='�������';

RETURN(@ISOweek); 
END;
GO
SET DATEFIRST 1;
SELECT dbo.ISOweek('12.04.2004') AS '�����';


-------------����������� �������
CREATE FUNCTION AgeMoreThan(@age int)  
RETURNS TABLE  
AS  
RETURN  
    SELECT fio, passport  
    FROM Tourists  
    WHERE age > @age


select * from dbo.AgeMoreThan(19)
go



CREATE FUNCTION Full_price (@price int) RETURNS TABLE
AS RETURN 
SELECT Tourists.fio AS "���", Group_compos.group_t AS "������"
from Tourists,Group_compos
WHERE Tourists.id_tourist=Group_compos.id_tourist and Group_compos.price_of_ticket>@price
GROUP BY fio,group_t


select * from dbo.Full_price (6314)
go

----------------------------------------------��������� ��� ����������
CREATE PROCEDURE Count_type_of_move 
AS
Select count(type_of_move) from Tours
where type_of_move='����' 
Go
execute Count_type_of_move


create procedure Count_sex
 as 
 select count (sex) from Tourists
 where sex='�������'
 go

 execute Count_sex
----------------------------------------------��������� � �����������
CREATE PROCEDURE Count_Tourists @age as Int
AS
Select count(fio) from Tourists
WHERE sex='�������' and age>=@age
Go

exec Count_Tourists 20
go


CREATE PROCEDURE Count_Tours @price as Int
AS
Select count(type_of_residense) from Tours
WHERE type_of_move='����' and price>=@price
Go

exec Count_Tours 12100
go


-------------------------------------��������� � return
CREATE PROCEDURE check_type_of_move @param int AS
IF (SELECT type_of_move FROM Tours WHERE id_tour = @param)
= '����'
RETURN 1 ELSE RETURN 2


DECLARE @return_status int
EXECUTE @return_status = check_type_of_move 5 SELECT 'Return Status' = @return_status 


CREATE PROCEDURE check_type_of_food @param int AS
IF (SELECT type_of_food FROM Tours WHERE id_tour = @param)
= '��� ��������'
RETURN 1 ELSE RETURN 2


DECLARE @return_status int
EXECUTE @return_status = check_type_of_food 9 SELECT 'Return Status' = @return_status 

---------------------------------------------------------update ���������
CREATE PROCEDURE update_Tours AS
UPDATE Tours SET city = '����-���-����'

exec update_Tours

CREATE PROCEDURE update_Hotels AS
UPDATE Hotels SET address = '�����������'

exec update_Hotels

--------------------��������� select 
CREATE PROCEDURE select_Hotels @h VARCHAR(255) AS
SELECT * FROM Hotels WHERE type_of_hotel=@h
EXEC select_Hotels @h='��������������'

CREATE PROCEDURE select_name_hotels @n VARCHAR(255) AS
SELECT * FROM Hotels WHERE name=@n
EXEC select_name_hotels @n='Rixos'

