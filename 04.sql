use movies;

-- Напишете заявка, която за всеки филм, по-дълъг от 120 минути, извежда
-- заглавие, година, име и адрес на студио
select title, year, studioname, address
from movie
join studio on movie.studioname = studio.name
where length > 120

-- Напишете заявка, която извежда името на студиото и имената на актьорите,
-- участвали във филми, произведени от това студио, подредени по име на студио.
select distinct studioname, starname
from movie
join starsin on title = movietitle and title = movietitle
order by studioname

-- Напишете заявка, която извежда имената на продуцентите на филмите, в които е
-- играл Harrison Ford.-- ???-- Напишете заявка, която извежда имената на актрисите, играли във филми на MGM.select starnamefrom starsinjoin movie on movietitle = title and movieyear = yearwhere studioname = 'MGM'-- Напишете заявка, която извежда името на продуцента и имената на филмите,
-- продуцирани от продуцента на ‘Star Wars’.select name as producername, title as movietitlefrom moviejoin movieexec on PRODUCERC# = CERT#where PRODUCERC# = (select PRODUCERC# from movie where title = 'Star Wars')-- Напишете заявка, която извежда имената на актьорите не участвали в нито един филм.select *from moviestarleft join starsin on name = starnamewhere starname is NULLuse pc;-- Напишете заявка, която извежда производител, модел и тип на продукт за тези
-- производители, за които съответния продукт не се продава (няма го в таблиците
-- PC, лаптоп или принтер).
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

-- Напишете заявка, която за всеки кораб извежда името му, държавата, броя
-- оръдия и годината на пускане (launched).
select name, country, numguns, launched
from ships
join classes on ships.class = classes.class

-- Напишете заявка, която извежда имената на корабите, участвали в битка от 1942г. 
select ship
from outcomes 
join battles on battle = name
where year(date) = 1942

-- За всяка страна изведете имената на корабите, които никога не са участвали в битка.
select *
from classes
join ships on classes.class = ships.class
left join outcomes on ships.NAME = outcomes.SHIP
where outcomes.ship is null

-- За всеки клас британски кораби да се изведат 
-- имената им (на класовете) и имената на всички битки,
-- в които са участвали кораби от този клас.
-- Ако даден клас няма кораби или има, но те не са 
-- участвали в битка, също да се изведат (със стойност
-- NULL за име на битката).

-- ??????????????????????????????
select *-- distinct classes.class, battle
from outcomes
join ships on ship = name
right join classes on ships.class = classes.class
where country = 'Gt.Britain';

-- За всеки клас да се изведат името му, държавата 
-- и имената на всички негови кораби, пуснати през 1916 г.
select *
from classes
join ships on classes.class = ships.class and launched = 1916
