use movies; 

-- Напишете заявка, която извежда имената на актьорите мъже, участвали в ‘Terms of Endearment’
select starname 
from starsin 
join moviestar on starname = name 
where movietitle = 'Terms of Endearment' and gender = 'M'

-- Напишете заявка, която извежда имената на актьорите, участвали във филми,
-- продуцирани от ‘MGM’ през 1995 г
select * 
from starsin
join movie on movietitle = title 
	and movieyear = year
where studioname = 'MGM' and year = 1995

-- Напишете заявка, която извежда името на президента на ‘MGM’
-- ???

-- Напишете заявка, която извежда имената на всички филми с дължина, по-голяма
-- от дължината на филма ‘Star Wars’

select *
from movie
where length > 124
-- where length > (select length from movie where title = 'Star Wars')

use pc;

-- Напишете заявка, която извежда производителя и честотата на процесора на тези
-- лаптопи с размер на диска поне 9 GB
select maker, speed
from product
join laptop on product.model = laptop.model 
where hd > 8

--  Напишете заявка, която извежда номер на модел и цена на всички продукти,
-- произведени от производител с име ‘B’. Сортирайте резултата така, че първо да
-- се изведат най-скъпите продукти
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

-- !! Напишете заявка, която извежда размерите на тези дискове, които се предлагат в
-- поне два компютъраselect pc1.hdfrom pc pc1 join pc pc2 on pc1.hd = pc2.hd	and pc1.code <> pc2.code-- !! Напишете заявка, която извежда всички двойки модели на компютри, които имат
-- еднаква честота и памет. Двойките трябва да се показват само по веднъж,
-- например само (i, j), но не и (j, i)select distinct pc1.model as i_model, pc2.model as j_modelfrom pc pc1join pc pc2 on pc1.speed = pc2.speed and pc1.ram = pc2.ramwhere pc1.model < pc2.model	-- !! Напишете заявка, която извежда производителите на поне два различни
-- компютъра с честота на процесора поне 1000 MHz.
-- ???

use ships;

-- Напишете заявка, която извежда името на корабите, по-тежки (displacement) от 35000
select name
from ships
join classes on ships.class = classes.class
where displacement > 35000

-- Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
-- всички кораби, участвали в битката при ‘Guadalcanal’
-- ???

-- Напишете заявка, която извежда имената на тези държави, които имат класове
-- кораби от тип ‘bb’ и ‘bc’ едновременно

select country
from classes
where type = 'bb'

intersect 

select country 
from classes 
where type = 'bc'

-- !! Напишете заявка, която извежда имената на тези кораби, които са били
-- повредени в една битка, но по-късно са участвали в друга битка.
-- ???
