use movies;
-- �������� ������, ����� ������� ������� �� ���������, ����� �� ���� �
-- ���������� � ����� �������� ��-������ �� 10 �������. 
select name
from moviestar
where gender = 'F' and name in (select name from movieexec where networth > 100000)

-- �������� ������, ����� ������� ������� �� ���� ������� (���� � ����), ����� �� �� ����������
select name
from moviestar
where name not in (select name from movieexec)

-- �������� ������, ����� ������� ������� �� ������ ����� � ������� ��-������
-- �� ��������� �� ����� �Star Wars� 
select *
from movie
where length > (select length from movie where title = 'Star Wars')

-- �������� ������, ����� ������� ������� �� ������������ � ������� ��
-- ����������� �� ����� ���������� �� � ��-������ �� ����������� �� ���������� �Mery Griffin� 
-- ???

use pc;
-- �������� ������, ����� ������� ��������������� �� ���������� �������� � ������� ���� 500. 
select *
from product 
join pc on product.model = pc.model
where speed >= 500

-- �������� ������, ����� ������� ���������� � ���-������ ����. 
select * 
from printer
where price >= all (select price from printer)

-- �������� ������, ����� ������� ���������, ����� ������� � ��-����� ��
-- ��������� �� ����� � �� � ���������� ��������. 
select *
from laptop 
where speed < all (select speed from pc)

-- �������� ������, ����� ������� ������ �� �������� (PC, ��� ��� ��� �������) �
-- ���-������ ����. 
select model
from (select model, price 
		from laptop
		union all
		select model, price from pc
		union all 
		select model, price from printer) AllProducts
where price >= all (select price from laptop
					union all
					select price from pc
					union all 
					select price from printer) 

-- �������� ������, ����� ������� ������������� �� ������� ������� � ���-����� ����. 
select *
from product
join printer on product.model = printer.model
where color = 'y' and price <= all (select price from printer where color = 'y')

-- �������� ������, ����� ������� ��������������� �� ���� ���������� ��������
-- � ���-����� RAM �����, ����� ���� ���-����� ���������. 
select maker
from product
join pc on product.model = pc.model
where ram <= all(select ram from pc) and speed >= all(select speed from pc where ram <= all (select ram from pc))

use ships;

-- �������� ������, ����� ������� ��������, ����� ������ �� � ���-����� ���� ������. 
select distinct country
from classes
where numguns >= all(select numguns from classes)

-- �������� ������, ����� ������� ���������, �� ����� ���� ���� �� �������� �� � ������� � �����. 
select *
from ships
where name in (select ship from outcomes where result = 'sunk')

-- �������� ������, ����� ������� ������� �� �������� � 16 ������ ������ (bore). 
select *
from ships
where class in (select class from classes where bore = 16)

-- �������� ������, ����� ������� ������� �� �������, � ����� �� ���������
-- ������ �� ���� �Kongo�. 
select battle
from outcomes
where ship in (select name from ships where class = 'Kongo')

-- �������� ������, ����� ������� ������� �� ��������, ����� ���� ������ � ���-����� 
-- � ��������� � �������� ��� ����� ������� ������ (bore). 
select name
from ships 
join classes c1 on ships.class = c1.class
where numguns >= all (select numguns from classes c2 where c2.BORE = c1.BORE)

