use ��������
-------------------------------------------------------------------------------------------
select Tourists.fio,Tourists.passport, Tours.type_of_residense,Tours.city from Tourists,Tours------ ������� ���������� ������������ ������ ������� � ���� 
go
select Tourists.fio,Tourists.sex, Tours.type_of_residense,Tours.type_of_food from Tourists,Tours------ ������� ���������� ������������ ������ ������� � ���� 
go
------------------------------------------------------------------------------------------------------------------------------------
select price,amount_of_tourists from Tours,Tour_group where Tours.id_tour=Tour_group.id_tour-------��������� ������� ������� � ������������� ������ �� id_tour
go
select type_of_hotel,full_price from Hotels,Sales_statement where Hotels.id_hotel=Sales_statement.id_hotel-------��������� ������� ����� � ��������� �������� �� id_hotel
go
select price_of_ticket , fio from Group_compos,Tourists where Group_compos.id_tourist=Tourists.id_tourist-------��������� ������� ������� � ������ ����� �� id_tourist
go
----------------------------------------------------------------------------------------------------------------------------
 select Distinct Tour_group.name from Tour_group,Tours where Tour_group.id_tour=Tours.id_tour AND Tours.city='�������'----��������� ������� ������������� ������ � ���� �� id_tour � �������� ������
 go
select Distinct Tour_group.amount_of_tourists from Tour_group,Tours where Tour_group.id_tour=Tours.id_tour AND Tours.type_of_residense='�����������'----��������� ������� ������������� ������ � ���� �� id_tour � �������� ������
 go
-----------------------------------------------------------------------------------------------------------------------------
select  Sales_statement.full_price from Sales_statement,Hotels,Tour_group where Hotels.id_hotel=Sales_statement.id_hotel and Sales_statement.id_tour_group=Tour_group.id_tour_group and Hotels.city='�������' and Tour_group.amount_of_tourists =60 ----c�������� �� ���� �������� : ��������� ��������, ����� , ������������� ������ � ������� ������
go
select Tours.type_of_move from Tours,Tour_group,Sales_statement where Tours.id_tour=Tour_group.id_tour and Tour_group.id_tour_group=Sales_statement.id_tour_group and Tour_group.amount_of_tourists=14 and Sales_statement.full_price=4522 ----c�������� �� ���� �������� : ��������� ��������, ���� , ������������� ������ � �������� ������
go
------------------------------------------------------------------------------------------------------------------------------
select Tour_group.name as '���-325', Tours.type_of_residense as '�����������' from Tour_group left outer join Tours on Tour_group.id_tour=Tours.id_tour---��������� ������� ������������� ������ � ���� �� ������ �������� ����������
go
select Tour_group.name as '���-123', Tours.type_of_move as '����' from Tour_group left outer join Tours on Tour_group.id_tour=Tours.id_tour---��������� ������� ������������� ������ � ���� �� ������ �������� ����������
go
------------------------------------------------------------------------------------------------------------------------------
select Tour_group.name as '���-123', Tours.type_of_move as '����' from Tour_group right outer join Tours on Tour_group.id_tour=Tours.id_tour---��������� ������� ������������� ������ � ���� �� ������� �������� ����������
go
select Tour_group.name as '���-325', Tours.type_of_residense as '�����������' from Tour_group right outer join Tours on Tour_group.id_tour=Tours.id_tour---��������� ������� ������������� ������ � ���� �� ������� �������� ����������
go
-------------------------------------------------------------------------------------------------------------------------?
select Tour_group.amount_of_tourists ,Sales_statement.full_price from Tour_group,Sales_statement---������������ ������������ ���������� � �������� ������ �� id_tour_group
where Tour_group.id_tour_group=Sales_statement.id_tour_group
go
select Tourists.age ,Group_compos.price_of_ticket from Tourists,Group_compos----������������ ������������ ���������� � �������� ������ �� id_tourist
where Tourists.id_tourist=Group_compos.id_tourist
go

