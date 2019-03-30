use movies; 

-- �������� ������, ����� ������� ������� �� ��������� ����, ��������� � �Terms of Endearment�
select starname 
from starsin 
join moviestar on starname = name 
where movietitle = 'Terms of Endearment' and gender = 'M'

-- �������� ������, ����� ������� ������� �� ���������, ��������� ��� �����,
-- ����������� �� �MGM� ���� 1995 �
select * 
from starsin
join movie on movietitle = title 
	and movieyear = year
where studioname = 'MGM' and year = 1995

-- �������� ������, ����� ������� ����� �� ���������� �� �MGM�
-- ???

-- �������� ������, ����� ������� ������� �� ������ ����� � �������, ��-������
-- �� ��������� �� ����� �Star Wars�

select *
from movie
where length > 124
-- where length > (select length from movie where title = 'Star Wars')

use pc;

-- �������� ������, ����� ������� ������������� � ��������� �� ��������� �� ����
-- ������� � ������ �� ����� ���� 9 GB
select maker, speed
from product
join laptop on product.model = laptop.model 
where hd > 8

--  �������� ������, ����� ������� ����� �� ����� � ���� �� ������ ��������,
-- ����������� �� ������������ � ��� �B�. ���������� ��������� ����, �� ����� ��
-- �� ������� ���-������� ��������
select product.model as model, price 
from product 
join laptop on product.model = laptop.model 
where maker = 'B'

union 

select product.model as model, price 
from product 
join pc on product.model = pc.model 
where maker = 'B'

union 

select product.model as model, price  
from product 
join printer on product.model = printer.model 
where maker = 'B'

order by price desc

-- !! �������� ������, ����� ������� ��������� �� ���� �������, ����� �� ��������� �
-- ���� ��� ���������select pc1.hdfrom pc pc1 join pc pc2 on pc1.hd = pc2.hd	and pc1.code <> pc2.code-- !! �������� ������, ����� ������� ������ ������ ������ �� ��������, ����� ����
-- ������� ������� � �����. �������� ������ �� �� �������� ���� �� ������,
-- �������� ���� (i, j), �� �� � (j, i)select distinct pc1.model as i_model, pc2.model as j_modelfrom pc pc1join pc pc2 on pc1.speed = pc2.speed and pc1.ram = pc2.ramwhere pc1.model < pc2.model	-- !! �������� ������, ����� ������� ��������������� �� ���� ��� ��������
-- ��������� � ������� �� ��������� ���� 1000 MHz.
-- ???

use ships;

-- �������� ������, ����� ������� ����� �� ��������, ��-����� (displacement) �� 35000
select name
from ships
join classes on ships.class = classes.class
where displacement > 35000

-- �������� ������, ����� ������� �������, ����������������� � ���� ������ ��
-- ������ ������, ��������� � ������� ��� �Guadalcanal�
-- ???

-- �������� ������, ����� ������� ������� �� ���� �������, ����� ���� �������
-- ������ �� ��� �bb� � �bc� ������������

select country
from classes
where type = 'bb'

intersect 

select country 
from classes 
where type = 'bc'

-- !! �������� ������, ����� ������� ������� �� ���� ������, ����� �� ����
-- ��������� � ���� �����, �� ��-����� �� ��������� � ����� �����.
-- ???
