use ��������
-----------------------------------------------------------------
select count (distinct price ) from Tours where type_of_move='����'-----------��������� , ������� ������� � ���� ���������� � ������� ���� � ����� ������������ ����
go
select count (distinct amount_of_seats) from Hotels where type_of_hotel='��������������'--------------��������� , ������� ������� ���������� � ������� ����� � ����� ����� ��������������
go
------------------------------------------------------------------
select sum (amount_of_seats) from Hotels where type_of_hotel='��������������'--�������������� ������������ ���� � ������� ����� � ����� �����- �������������� 
go
select sum(distinct price) from Tours where type_of_move='����'----�������������� ���� �� ������� ���� � ����� ������������ - ����
go
------------------------------------------------------------------------
select upper (fio) from Tourists as "��� ���������" -------������� �� ������� ������� ��� ���������� �������
go
select lower (fio) from Tourists as "��� ��������" -----------������� �� ������� ������� ��� ��������� �������
go
-------------------------------------------------------------------
select price_of_ticket, date_sales from Group_compos where DATENAME (year,date_sales)=1894----������� ���� ������ �� ������� ������ �����, ��� ���-1894
go
select full_price ,date from Sales_statement where DATENAME (year,date)=1894----������� ����� ��������� �� ������� ��������� �������� , ��� ���-1894
go
-------------------------------------------------------------
select type_of_hotel as "��� �����", count (*) as "����������" from Hotels group by type_of_hotel -----��������� ���������� ���������� ���� �����
 go
select type_of_move as "��� ������������" , count (*) as "����������" from Tours group by type_of_move------��������� ���������� ���������� ���� ������������
go
--------------------------�� ���������� ��������� �����������
select kids,sex , count (*)  as "����������" from Tourists group by kids,sex
go
select city,type_of_hotel , count (*) as "����������" from Hotels group by city,type_of_hotel 
go
-----------------------------
select type_of_hotel ,count (type_of_hotel) as amount , avg (amount_of_seats) as avg_amount_of_seats from Hotels group by type_of_hotel having avg(amount_of_seats) <700---������� avg ���������� ����
go
select sex , kids,count (sex) as amount_s from tourists group by sex , kids having count(sex)>0---������� ���������� ��� �������� � �������� ���� 
go
------------------
select AVG (amount_of_seats) as amount  from Hotels  having avg(amount_of_seats)>100---������� ������� avg ���������� ����, ���� ��� ������ 100 
go
select AVG (age) as age  from Tourists having avg(age)>20---������� ������� avg �������� , ���� ��� ������ 20
go
---------------------------------------------------------------
select type_of_hotel from Hotels where name='��������'  OR name ='������' order by type_of_hotel---������� ���������� �� ������� ��� �����
go
select amount_of_seats from Hotels where name='��������'  OR name ='������' order by amount_of_seats---������� ���������� �� ������� ���������� ����
go
------------------------------------------------------------------------------------------
insert into Hotels(amount_of_seats,name,country,city,address,type_of_hotel) Values (80,'Rixos','������','�������','��������','��������������')----�������� � ������� ����� ����� ������ � �������
go
insert into Tours(name,country,city,type_of_move,type_of_food,type_of_residense,price) Values ('Rixos','������','�������','����','��� ��������','�����������',87665)--�������� � ������� ���� ����� ������ � �������
go
--------------------------------------------------------------
insert into Hotels(amount_of_seats,name,country,city,address,type_of_hotel) Values (80,'Rixos','������','�������','��������','��������������')----�������� � ������� ����� ����� ������ � �������
go
insert into Tours(name,country,city,type_of_move,type_of_food,type_of_residense,price) Values ('Rixos','������','�������','����','��� ��������','�����������',87665)--�������� � ������� ���� ����� ������ � �������
go
-----------------------------------------------------------------
update Tours set price=1.1*price-----�������� ������ � ������� ���� , ������� ����
go
update Sales_statement set full_price=1.1*full_price---�������� ������ � ������� ��������� �������� , ������� ����� ��������� 
go

------------------------------------------------------------------
update Tours set price=1*price where price>10000--�������� ������ � ������� ���� , ������� ����, ���� ��� ������ 10000
go
update Sales_statement set full_price=1*full_price where full_price>621--------�������� ������ � ������� ��������� ��������, ������� ����� ��������� , ���� ��� ������ 621
go
-----------------------------------------------------------------
delete from Sales_statement where full_price=624------������� �� ������� ��������� �������� ������, ��� ����� ��������� =624
go
delete from Tour_group where id_tour=7-----������� �� ������������� ������ ������, ��� id_tour=7
go
