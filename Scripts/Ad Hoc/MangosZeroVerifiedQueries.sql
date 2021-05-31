-- Total time for Vanilla teams
select 'Death Squad', max(totaltime) as totalTime
from zero_character.characters
where guid in (1,2,3,4,5)
union
select 'Strike Team', max(totaltime)
from zero_character.characters
where guid in (6,7,8,9,10);

-- Lowest level for Vanilla teams
drop temporary table if exists vanilla_levels;
create temporary table vanilla_levels
(lvl int, xp int);

insert into vanilla_levels
values (1,400),(11,8800),(21,25200),(31,50800),(41,95800),(51,153900),
(2,900),(12,10100),(22,27300),(32,54500),(42,101000),(52,160400),
(3,1400),(13,11400),(23,29400),(33,58600),(43,106300),(53,167100),
(4,2100),(14,12900),(24,31700),(34,62800),(44,111800),(54,173900),
(5,2800),(15,14400),(25,34000),(35,67100),(45,117500),(55,180800),
(6,3600),(16,16000),(26,36400),(36,71600),(46,123200),(56,187900),
(7,4500),(17,17700),(27,38900),(37,76100),(47,129100),(57,195000),
(8,5400),(18,19400),(28,41400),(38,80800),(48,135100),(58,202300),
(9,6500),(19,21300),(29,44300),(39,85700),(49,141200),(59,209800),
(10,7600),(20,23200),(30,47400),(40,90700),(50,147500),(60,217400);

select c.name, c.level, c.xp, c.xp/vl.xp as pct
from zero_character.characters c
  join vanilla_levels vl on vl.lvl = level
where guid between 1 and 5
  and level = (
	select min(level)
    from zero_character.characters
    where guid between 1 and 5
  )
  and c.xp = (
	select min(xp)
    from zero_character.characters
    where guid between 1 and 5
      and level = c.level
  )
union
select c.name, c.level, c.xp, c.xp/vl.xp as pct
from zero_character.characters c
  join vanilla_levels vl on vl.lvl = level
where guid between 6 and 10
  and level = (
	select min(level)
    from zero_character.characters
    where guid between 6 and 10
  )
  and c.xp = (
	select min(xp)
    from zero_character.characters
    where guid between 6 and 10
      and level = c.level
  )