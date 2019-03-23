use movies

-- Напишете заявка, която извежда адресът на студио ‘MGM’
select * 
from studio
where name = 'MGM'

-- Напишете заявка, която извежда рождената дата на актрисата Sandra Bullock
select birthdate
from moviestar
where name = 'Sandra Bullock'

--  Напишете заявка, която извежда имената на всички актьори, които са участвали
-- във филм през 1980, в заглавието на които има думата ‘Empire’
select starname as name
from starsin
where movieyear = 1980 and movietitle like '%Empire%'

--  Напишете заявка, която извежда имената всички изпълнители на филми с нетна
-- стойност над 10 000 000 долара
select name
from movieexec
where networth > 10000000

-- Напишете заявка, която извежда имената на всички актьори, които са мъже или
-- живеят в Malibu
select *
from moviestar
where gender = 'M' or address like '%Malibu%'
