use pc;

select avg(speed)
from pc

-- Напишете заявка, която извежда средния размер на екраните на лаптопите за
-- всеки производителselect maker, avg(screen)from product join laptop on product.model = laptop.model group by maker -- Напишете заявка, която извежда средната честота на лаптопите с цена над 1000select avg(speed)from laptopwhere price > 1000-- Напишете заявка, която извежда средната цена на компютрите произведени от
-- производител ‘A’select avg(price)from productjoin pc on product.model = pc.modelwhere maker = 'A'-- Напишете заявка, която извежда средната цена на компютрите и лаптопите за
-- производител ‘B’select avg(price)from( select price from product join pc on product.model = pc.model where maker = 'B'	union all	select price from product join laptop on product.model = laptop.model where maker = 'B')AllPrices-- Напишете заявка, която извежда средната цена на компютрите според
-- различните им честотиselect speed, avg(price) as averagepricefrom pcgroup by speed-- Напишете заявка, която извежда производителите, които са произвели поне по 3
-- различни модела компютъраselect makerfrom product where type = 'PC'group by makerhaving count(maker) >= 3-- Напишете заявка, която извежда производителите на компютрите с най-висока ценаselect makerfrom productjoin pc on product.model = pc.modelwhere price = (select max(price) from pc)-- Напишете заявка, която извежда средната цена на компютрите за всяка честота
-- по-голяма от 800select speed, avg(price)from pcgroup by speedhaving speed > 800-- Напишете заявка, която извежда средния размер на диска на тези компютри
-- произведени от производители, които произвеждат и принтери
select avg(hd)
from pc
join product on pc.model = product.model
where maker in (select maker from printer join product pr1 on printer.model = pr1.model)

-- Напишете заявка, която за всеки размер на лаптоп намира разликата в цената на
-- най-скъпия и най-евтиния лаптоп със същия размерselect screen, max(price) - min(price)from laptopgroup by screen
use ships;

-- Напишете заявка, която извежда броя на класовете кораби
select count(*)
from classes

-- Напишете заявка, която извежда средния брой на оръжия за всички кораби,
-- пуснати на вода

-- Напишете заявка, която извежда за всеки клас първата и последната година, в
-- която кораб от съответния клас е пуснат на водаselect class, min(launched) as first, max(launched) as secondfrom shipsgroup by class-- Напишете заявка, която извежда броя на корабите потънали в битка според класаselect class, count(*)from shipsjoin outcomes on name = shipwhere result = 'sunk'group by class-- Напишете заявка, която извежда броя на корабите потънали в битка според
-- класа, за тези класове с повече от 4 пуснати на вода корабаselect class, count(name)from shipsjoin outcomes on name = shipwhere result = 'sunk' and class in (select class from ships group by class having count(*) > 4)group by class-- Напишете заявка, която извежда средното тегло на корабите, за всяка страна. select 