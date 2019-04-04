use movies;

-- �������� ������, ����� �� ����� ����, ��-����� �� 120 ������, �������
-- ��������, ������, ��� � ����� �� ������
select title, year, studioname, address
from movie
join studio on movie.studioname = studio.name
where length > 120

-- �������� ������, ����� ������� ����� �� �������� � ������� �� ���������,
-- ��������� ��� �����, ����������� �� ���� ������, ��������� �� ��� �� ������.
select distinct studioname, starname
from movie
join starsin on title = movietitle and title = movietitle
order by studioname

-- �������� ������, ����� ������� ������� �� ������������ �� �������, � ����� �
-- ����� Harrison Ford.-- ???-- �������� ������, ����� ������� ������� �� ���������, ������ ��� ����� �� MGM.select starnamefrom starsinjoin movie on movietitle = title and movieyear = yearwhere studioname = 'MGM'-- �������� ������, ����� ������� ����� �� ���������� � ������� �� �������,
-- ����������� �� ���������� �� �Star Wars�.select name as producername, title as movietitlefrom moviejoin movieexec on PRODUCERC# = CERT#where PRODUCERC# = (select PRODUCERC# from movie where title = 'Star Wars')-- �������� ������, ����� ������� ������� �� ��������� �� ��������� � ���� ���� ����.select *from moviestarleft join starsin on name = starnamewhere starname is NULLuse pc;-- �������� ������, ����� ������� ������������, ����� � ��� �� ������� �� ����
-- �������������, �� ����� ���������� ������� �� �� ������� (���� �� � ���������
-- PC, ������ ��� �������).
select maker, p.model, type
from product as p
left join (select model from pc union all select model from laptop union all select model from printer) as t on p.model = t.model
where t.model is NULL

-- OR

select *
from product
where model not in(select model from laptop)
and model not in (select model from pc)
and model not in ( select model from printer)

use ships;

-- �������� ������, ����� �� ����� ����� ������� ����� ��, ���������, ����
-- ������ � �������� �� ������� (launched).
select name, country, numguns, launched
from ships
join classes on ships.class = classes.class

-- �������� ������, ����� ������� ������� �� ��������, ��������� � ����� �� 1942�. 
select ship
from outcomes 
join battles on battle = name
where year(date) = 1942

-- �� ����� ������ �������� ������� �� ��������, ����� ������ �� �� ��������� � �����.
select *
from classes
join ships on classes.class = ships.class
left join outcomes on ships.NAME = outcomes.SHIP
where outcomes.ship is null

-- �� ����� ���� ��������� ������ �� �� ������� 
-- ������� �� (�� ���������) � ������� �� ������ �����,
-- � ����� �� ��������� ������ �� ���� ����.
-- ��� ����� ���� ���� ������ ��� ���, �� �� �� �� 
-- ��������� � �����, ���� �� �� ������� (��� ��������
-- NULL �� ��� �� �������).

-- ??????????????????????????????
select *-- distinct classes.class, battle
from outcomes
join ships on ship = name
right join classes on ships.class = classes.class
where country = 'Gt.Britain';

-- �� ����� ���� �� �� ������� ����� ��, ��������� 
-- � ������� �� ������ ������ ������, ������� ���� 1916 �.
select *
from classes
join ships on classes.class = ships.class and launched = 1916
