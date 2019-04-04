use movies;
-- Напишете заявка, която извежда имената на актрисите, които са също и
-- продуценти с нетна стойност по-голяма от 10 милиона. 
select name
from moviestar
where gender = 'F' and name in (select name from movieexec where networth > 100000)

-- Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти
select name
from moviestar
where name not in (select name from movieexec)

-- Напишете заявка, която извежда имената на всички филми с дължина по-голяма
-- от дължината на филма ‘Star Wars’ 
select *
from movie
where length > (select length from movie where title = 'Star Wars')

-- Напишете заявка, която извежда имената на продуцентите и имената на
-- продукциите за които стойността им е по-голяма от продукциите на продуценти ‘Mery Griffin’ 
-- ???

use pc;
-- Напишете заявка, която извежда производителите на персонални компютри с честота поне 500. 
select *
from product 
join pc on product.model = pc.model
where speed >= 500

-- Напишете заявка, която извежда принтерите с най-висока цена. 
select * 
from printer
where price >= all (select price from printer)

-- Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
-- честотата на който и да е персонален компютър. 
select *
from laptop 
where speed < all (select speed from pc)

-- Напишете заявка, която извежда модела на продукта (PC, лап топ или принтер) с
-- най-висока цена. 
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

-- Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена. 
select *
from product
join printer on product.model = printer.model
where color = 'y' and price <= all (select price from printer where color = 'y')

-- Напишете заявка, която извежда производителите на тези персонални компютри
-- с най-малко RAM памет, които имат най-бързи процесори. 
select maker
from product
join pc on product.model = pc.model
where ram <= all(select ram from pc) and speed >= all(select speed from pc where ram <= all (select ram from pc))

use ships;

-- Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия. 
select distinct country
from classes
where numguns >= all(select numguns from classes)

-- Напишете заявка, която извежда класовете, за които поне един от корабите им е потънал в битка. 
select *
from ships
where name in (select ship from outcomes where result = 'sunk')

-- Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore). 
select *
from ships
where class in (select class from classes where bore = 16)

-- Напишете заявка, която извежда имената на битките, в които са участвали
-- кораби от клас ‘Kongo’. 
select battle
from outcomes
where ship in (select name from ships where class = 'Kongo')

-- Напишете заявка, която извежда иманата на корабите, чиито брой оръдия е най-голям 
-- в сравнение с корабите със същия калибър оръдия (bore). 
select name
from ships 
join classes c1 on ships.class = c1.class
where numguns >= all (select numguns from classes c2 where c2.BORE = c1.BORE)

