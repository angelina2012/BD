use Турфирма
go
--------создание временных таблиц
DECLARE @Driver TABLE (id INT, name varchar(255))
insert into @Driver (id,name) values (1,'Петр Иванов')
insert into @Driver (id,name) values (2,'Иван Иванов')
INSERT INTO @Driver(id, name) VALUES (3,'Игорь Троцкий') 
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
SET @name = 'Количество отелей больше 10'
SELECT @name
END ELSE BEGIN
SET @name = 'Количество отелей = ' + str(@volume_name)
SELECT @name
END


DECLARE @count INT
DECLARE @name_tourists VARCHAR(255)
SET @count =(SELECT COUNT(*) FROM Tourists)
IF @name_tourists >5
BEGIN
SET  @name_tourists='Количество туристов больше 5'
SELECT  @name_tourists
END ELSE BEGIN
SET  @name_tourists ='Количество туристов =' + str(@count) 
SELECT  @name_tourists
END
 ---------------------------------------------------------------WHILE
 DECLARE @a INT SET @a = 1 WHILE @a <50
BEGIN
PRINT @a 
iF (@a>30) AND (@a<40)
BREAK --выход и выполнение 1-й команды за циклом
ELSE
SET @a = @a+rand()*10 
CONTINUE
END
 PRINT @a


 DECLARE @b INT SET @b = 1 WHILE @b <60
BEGIN
PRINT @b
iF (@b>35) AND (@b<40)
BREAK --выход и выполнение 1-й команды за циклом
ELSE
SET @b = @b+rand()*10 
CONTINUE
END
 PRINT @b

 ---------------------скалярная функция
use Турфирма
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

IF (@man=1) SET @ISOweek='Январь'; 
IF (@man=2) SET @ISOweek='Февраль';
IF (@man=3) SET @ISOweek='Март';
IF (@man=4) SET @ISOweek='Апрель'; 
IF (@man=5) SET @ISOweek='Май';
IF (@man=6) SET @ISOweek='Июнь'; 
IF (@man=7) SET @ISOweek='Июль';
IF (@man=8) SET @ISOweek='Август';
IF (@man=9) SET @ISOweek='Сентябрь'; 
IF (@man=10) SET @ISOweek='Октябрь'; 
IF (@man=11) SET @ISOweek='Ноябрь';
IF (@man=12) SET @ISOweek='Декабрь';

RETURN(@ISOweek); 
END;
GO
SET DATEFIRST 1;
SELECT dbo.ISOweek('12.04.2004') AS 'Месяц';


-------------возвращение таблицы
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
SELECT Tourists.fio AS "ФИО", Group_compos.group_t AS "Группа"
from Tourists,Group_compos
WHERE Tourists.id_tourist=Group_compos.id_tourist and Group_compos.price_of_ticket>@price
GROUP BY fio,group_t


select * from dbo.Full_price (6314)
go

----------------------------------------------процедура без параметров
CREATE PROCEDURE Count_type_of_move 
AS
Select count(type_of_move) from Tours
where type_of_move='авиа' 
Go
execute Count_type_of_move


create procedure Count_sex
 as 
 select count (sex) from Tourists
 where sex='мужской'
 go

 execute Count_sex
----------------------------------------------процедура с параметрами
CREATE PROCEDURE Count_Tourists @age as Int
AS
Select count(fio) from Tourists
WHERE sex='мужской' and age>=@age
Go

exec Count_Tourists 20
go


CREATE PROCEDURE Count_Tours @price as Int
AS
Select count(type_of_residense) from Tours
WHERE type_of_move='авиа' and price>=@price
Go

exec Count_Tours 12100
go


-------------------------------------процедура с return
CREATE PROCEDURE check_type_of_move @param int AS
IF (SELECT type_of_move FROM Tours WHERE id_tour = @param)
= 'авиа'
RETURN 1 ELSE RETURN 2


DECLARE @return_status int
EXECUTE @return_status = check_type_of_move 5 SELECT 'Return Status' = @return_status 


CREATE PROCEDURE check_type_of_food @param int AS
IF (SELECT type_of_food FROM Tours WHERE id_tour = @param)
= 'все включено'
RETURN 1 ELSE RETURN 2


DECLARE @return_status int
EXECUTE @return_status = check_type_of_food 9 SELECT 'Return Status' = @return_status 

---------------------------------------------------------update процедура
CREATE PROCEDURE update_Tours AS
UPDATE Tours SET city = 'Шарм-эль-шейх'

exec update_Tours

CREATE PROCEDURE update_Hotels AS
UPDATE Hotels SET address = 'Колесникова'

exec update_Hotels

--------------------процедура select 
CREATE PROCEDURE select_Hotels @h VARCHAR(255) AS
SELECT * FROM Hotels WHERE type_of_hotel=@h
EXEC select_Hotels @h='пятизвездочный'

CREATE PROCEDURE select_name_hotels @n VARCHAR(255) AS
SELECT * FROM Hotels WHERE name=@n
EXEC select_name_hotels @n='Rixos'

