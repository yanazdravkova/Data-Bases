use pc;

select avg(speed)
from pc

-- �������� ������, ����� ������� ������� ������ �� �������� �� ��������� ��
-- ����� ������������select maker, avg(screen)from product join laptop on product.model = laptop.model group by maker -- �������� ������, ����� ������� �������� ������� �� ��������� � ���� ��� 1000select avg(speed)from laptopwhere price > 1000-- �������� ������, ����� ������� �������� ���� �� ���������� ����������� ��
-- ������������ �A�select avg(price)from productjoin pc on product.model = pc.modelwhere maker = 'A'-- �������� ������, ����� ������� �������� ���� �� ���������� � ��������� ��
-- ������������ �B�select avg(price)from( select price from product join pc on product.model = pc.model where maker = 'B'	union all	select price from product join laptop on product.model = laptop.model where maker = 'B')AllPrices-- �������� ������, ����� ������� �������� ���� �� ���������� ������
-- ���������� �� �������select speed, avg(price) as averagepricefrom pcgroup by speed-- �������� ������, ����� ������� ���������������, ����� �� ��������� ���� �� 3
-- �������� ������ ���������select makerfrom product where type = 'PC'group by makerhaving count(maker) >= 3-- �������� ������, ����� ������� ��������������� �� ���������� � ���-������ ����select makerfrom productjoin pc on product.model = pc.modelwhere price = (select max(price) from pc)-- �������� ������, ����� ������� �������� ���� �� ���������� �� ����� �������
-- ��-������ �� 800select speed, avg(price)from pcgroup by speedhaving speed > 800-- �������� ������, ����� ������� ������� ������ �� ����� �� ���� ��������
-- ����������� �� �������������, ����� ����������� � ��������
select avg(hd)
from pc
join product on pc.model = product.model
where maker in (select maker from printer join product pr1 on printer.model = pr1.model)

-- �������� ������, ����� �� ����� ������ �� ������ ������ ��������� � ������ ��
-- ���-������ � ���-������� ������ ��� ����� ������select screen, max(price) - min(price)from laptopgroup by screen
use ships;

-- �������� ������, ����� ������� ���� �� ��������� ������
select count(*)
from classes

-- �������� ������, ����� ������� ������� ���� �� ������ �� ������ ������,
-- ������� �� ����

-- �������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, �
-- ����� ����� �� ���������� ���� � ������ �� ����select class, min(launched) as first, max(launched) as secondfrom shipsgroup by class-- �������� ������, ����� ������� ���� �� �������� �������� � ����� ������ �����select class, count(*)from shipsjoin outcomes on name = shipwhere result = 'sunk'group by class-- �������� ������, ����� ������� ���� �� �������� �������� � ����� ������
-- �����, �� ���� ������� � ������ �� 4 ������� �� ���� ������select class, count(name)from shipsjoin outcomes on name = shipwhere result = 'sunk' and class in (select class from ships group by class having count(*) > 4)group by class-- �������� ������, ����� ������� �������� ����� �� ��������, �� ����� ������. select 