use ��������
-----------------------------------------------------------------------------------------------------------------
select * from Sales_statement where full_price <1000 ---- ������� �������� ������ ��������� ������ 1000
go
select * from Tours where type_of_move ='�������'---- ������� �� ������� ���� ��������,������� ����� ��������
go
select * from Hotels where amount_of_seats <=150 ---���������� ���� � ��������� ������ ���� ����� 150
go
------------------------------------------------------------------------------------------------------------------
select * from Hotels where name ='������' OR name= '��������' -------������� ������ , ������� �������� ������ ��� ��������
go
select * from Tourists where passport ='HI456' AND age=30 -------������� ������ , ������� �������� ����� �������� HI456 � ������� 30
go
select * from Tourists where NOT sex='�������'------ ������� ������ , � ������� �� ���������� ������� ���
go
-------------------------------------------------------------------------------------------------------
select* from Tourists where sex ='�������' AND age >=18 AND kids='���' ---������� ������ , � ������� ���������� ���-�������, �����-��� � ������� ������ ���� ����� 18
go
select * from Tours where price >4300 AND type_of_residense='�����������'  AND type_of_food='��� ��������'---- ������� ������ � ������� ���� ������ 4300, ��� ���������� - ����������� � ��� �������-��� ��������
go
 --------------------------------------------------------------------------------------------------------
 select * from Tours where price IN (65500,4300,10000)---- ������� ������, ���������� � ���� ���� ������ 65500,4300,10000
 go
 select*from Tour_group where amount_of_tourists IN (14,20,35)-------- ������� ������, ���������� � ���� ���������� �������� ������ 14,20,35
 go
 ---------------------------------------------------------------------------------------------------------
 Select * from Tours where price BETWEEN 10000 AND 84000------ ������� ������, ��� ���� � ��������� �� 10000 �� 84000
 go
 Select * from Tour_group where amount_of_tourists NOT BETWEEN 20 AND 45--- ������� ������ , � ������� ���������� �������� �� � ��������� ��  20 �� 45
 go
  ------------------------------------------------------------------------------------------------------
 SELECT * FROM Tours where type_of_food Like '%������%'---������� ������, � ������� ��� ������� �������� ����� ������ 
 go
 select* from Hotels where Upper (name) Like '�%' ------- ������� ������ , � ������� �������� ����� �������� ��������� ����� �
 go
 -------------------------------------------------------------------------------------------------------
 select * from Hotels where amount_of_seats IS NULL ------ ������� ������, � ������� ���������� ���� ����� NULL
 go
 select * from Tours where price IS NULL-------- ������� ������ , � ������� ���� ����� NULL
 go
