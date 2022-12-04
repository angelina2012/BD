use Турфирма
-----------------------------------------------------------------
select count (distinct price ) from Tours where type_of_move='авиа'-----------посчитать , сколько записей о цене содержится в таблице Туры с типом передвижения АВИА
go
select count (distinct amount_of_seats) from Hotels where type_of_hotel='пятизвездочный'--------------посчитать , сколько записей содержится в таблице Отели с типом отеля пятизвездочный
go
------------------------------------------------------------------
select sum (amount_of_seats) from Hotels where type_of_hotel='пятизвездочный'--просуммировать колличепство мест в таблице Отели с типом отеля- пятизвездочный 
go
select sum(distinct price) from Tours where type_of_move='авиа'----просуммировать цену из таблицы Туры с типом передвижения - авиа
go
------------------------------------------------------------------------
select upper (fio) from Tourists as "Все прописные" -------вывести из таблицы Туристы ФИО прописными буквами
go
select lower (fio) from Tourists as "Все строчные" -----------вывести из таблицы Туристы ФИО строчными буквами
go
-------------------------------------------------------------------
select price_of_ticket, date_sales from Group_compos where DATENAME (year,date_sales)=1894----вывести цену билета из таблицы Состав групп, где год-1894
go
select full_price ,date from Sales_statement where DATENAME (year,date)=1894----вывести общую стоимость из таблицы Ведомость продажей , где год-1894
go
-------------------------------------------------------------
select type_of_hotel as "Тип отеля", count (*) as "Количество" from Hotels group by type_of_hotel -----посчитать количество повторений типа отеля
 go
select type_of_move as "Тип передвижения" , count (*) as "Количество" from Tours group by type_of_move------посчитать количество повторений типа передвижений
go
--------------------------по нескольким столбацам группировка
select kids,sex , count (*)  as "Количество" from Tourists group by kids,sex
go
select city,type_of_hotel , count (*) as "Количество" from Hotels group by city,type_of_hotel 
go
-----------------------------
select type_of_hotel ,count (type_of_hotel) as amount , avg (amount_of_seats) as avg_amount_of_seats from Hotels group by type_of_hotel having avg(amount_of_seats) <700---вывести avg количества мест
go
select sex , kids,count (sex) as amount_s from tourists group by sex , kids having count(sex)>0---вывести количество лиц женского и мужского пола 
go
------------------
select AVG (amount_of_seats) as amount  from Hotels  having avg(amount_of_seats)>100---вывести среднее avg количества мест, если оно больше 100 
go
select AVG (age) as age  from Tourists having avg(age)>20---вывести среднее avg возраста , если оно больше 20
go
---------------------------------------------------------------
select type_of_hotel from Hotels where name='Мармарис'  OR name ='Фараон' order by type_of_hotel---сделать сортировку по столбцу Тип отеля
go
select amount_of_seats from Hotels where name='Мармарис'  OR name ='Фараон' order by amount_of_seats---сделать сортировку по столбцу Количество мест
go
------------------------------------------------------------------------------------------
insert into Hotels(amount_of_seats,name,country,city,address,type_of_hotel) Values (80,'Rixos','Египет','Хургада','вапроллл','пятизвездочный')----вставить в таблицу Отели новую строку с данными
go
insert into Tours(name,country,city,type_of_move,type_of_food,type_of_residense,price) Values ('Rixos','Египет','Хургада','авиа','все включено','двухместный',87665)--вставить в таблицу Туры новую строку с данными
go
--------------------------------------------------------------
insert into Hotels(amount_of_seats,name,country,city,address,type_of_hotel) Values (80,'Rixos','Египет','Хургада','вапроллл','пятизвездочный')----вставить в таблицу Отели новую строку с данными
go
insert into Tours(name,country,city,type_of_move,type_of_food,type_of_residense,price) Values ('Rixos','Египет','Хургада','авиа','все включено','двухместный',87665)--вставить в таблицу Туры новую строку с данными
go
-----------------------------------------------------------------
update Tours set price=1.1*price-----обновить данные в таблице Туры , изменив цену
go
update Sales_statement set full_price=1.1*full_price---обновить данные в таблице Ведомость продажей , изменив общую стоимость 
go

------------------------------------------------------------------
update Tours set price=1*price where price>10000--обновить данные в таблице Туры , изменив цену, если она больше 10000
go
update Sales_statement set full_price=1*full_price where full_price>621--------обновить данные в таблице Ведомость продажей, изменив общую стоимость , если она больше 621
go
-----------------------------------------------------------------
delete from Sales_statement where full_price=624------удалить из таблицы Ведомость продажей запись, где общая стоимость =624
go
delete from Tour_group where id_tour=7-----удалить из Туристической группы запись, где id_tour=7
go
