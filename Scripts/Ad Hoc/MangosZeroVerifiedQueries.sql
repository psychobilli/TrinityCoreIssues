-- Total time for Vanilla teams
select title
	, seconds as totalTime
	, days
    , hours - (days * 24) as hours
    , minutes - (hours * 60) as minutes
    , minutesFrac as seconds
from (
	select 'Death Squad' as title
		, ((max(totaltime) div 60) div 60) div 24 as days
		, (max(totaltime) div 60) div 60 as hours
		, max(totaltime) div 60 as minutes
        , max(totaltime) mod 60 as minutesFrac
		, max(totaltime) as seconds
        , sum(money) as money
        , sum(money) div 10000 as gold
        , sum(money) div 100 as silver
	from zero_character.characters
	where guid in (1,2,3,4,5)
	union
	select 'Elite Force'
		, ((max(totaltime) div 60) div 60) div 24
		, (max(totaltime) div 60) div 60
		, max(totaltime) div 60
        , max(totaltime) mod 60
		, max(totaltime)
        , sum(money) as money
        , sum(money) div 10000 as gold
        , sum(money) div 100 as silver
	from zero_character.characters
	where guid in (6,7,8,9,10)
) totalTime;

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

select 'Death Squad', c.name, c.level, c.xp, c.xp/vl.xp as pct
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
select 'Elite Force', c.name, c.level, c.xp, c.xp/vl.xp as pct
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
  );
  
--find approximate character item level
select sub.guid
	, c.name
	, avg(iLevel)
from (
	select ci.guid as guid
		, it.inventoryType as type
		, max(it.itemLevel) as iLevel
	from zero_character.character_inventory ci
	  join zero_character.item_instance ii on ii.guid = ci.item
	  join zero_world.item_template it on it.entry = ci.item_template
	where ci.guid in (1,2,3,4,5,6,7,8,9,10)
	  and it.inventoryType between 1 and 17
	  and it.inventoryType <> 4
	  and (slot < 18 and ci.bag = 0
		or ci.bag in (18, 19, 20, 21, 22))
	  and it.inventoryType not in (/*shirt*/4,/*one-hand*/13,14,21,22,23,/*two-hand*/17,/*ranged*/15,25,26,28)
	group by ci.guid
		, it.inventoryType
	union
	select ci.guid as guid
		, 13 as type
		, max(it.itemLevel)
	from zero_character.character_inventory ci
	  join zero_character.item_instance ii on ii.guid = ci.item
	  join zero_world.item_template it on it.entry = ci.item_template
	where it.inventoryType between 1 and 28
	  and (slot < 18 and ci.bag = 0
		or ci.bag in (18, 19, 20, 21, 22))
	  and it.inventoryType in (/*one-hand*/13,14,21,22,23,/*two-hand*/17)
	group by ci.guid
		, it.inventoryType
	union
	select ci.guid as guid
		, 15 as type
		, max(it.itemLevel)
	from zero_character.character_inventory ci
	  join zero_character.item_instance ii on ii.guid = ci.item
	  join zero_world.item_template it on it.entry = ci.item_template
	where it.inventoryType between 1 and 28
	  and (slot < 18 and ci.bag = 0
		or ci.bag in (18, 19, 20, 21, 22))
	  and it.inventoryType in (/*ranged*/15,25,26,28)
      and it.name != 'Egan''s Blaster'
	group by ci.guid
		, it.inventoryType
	) sub
  join zero_character.characters c on c.guid = sub.guid
group by sub.guid
	, c.name;
	
-- view character equipment
select c.name
	, sub.*
from (
	select ci.guid as guid
		, it.inventoryType as type
		, max(it.itemLevel) as iLevel
        , it.name
	from zero_character.character_inventory ci
	  join zero_character.item_instance ii on ii.guid = ci.item
	  join zero_world.item_template it on it.entry = ci.item_template
	where ci.guid in (1,2,3,4,5,6,7,8,9,10)
	  and it.inventoryType between 1 and 17
	  and it.inventoryType <> 4
	  and (slot < 18 and ci.bag = 0
		or ci.bag in (18, 19, 20, 21, 22))
	  and it.inventoryType not in (/*shirt*/4,/*one-hand*/13,14,21,22,23,/*two-hand*/17,/*ranged*/15,25,26,28)
	group by ci.guid
		, it.inventoryType
        , it.name
	union
	select ci.guid as guid
		, 13 as type
		, max(it.itemLevel)
        , it.name
	from zero_character.character_inventory ci
	  join zero_character.item_instance ii on ii.guid = ci.item
	  join zero_world.item_template it on it.entry = ci.item_template
	where it.inventoryType between 1 and 28
	  and (slot < 18 and ci.bag = 0
		or ci.bag in (18, 19, 20, 21, 22))
	  and it.inventoryType in (/*one-hand*/13,14,21,22,23,/*two-hand*/17)
	group by ci.guid
		, it.inventoryType
        , it.name
	union
	select ci.guid as guid
		, 15 as type
		, max(it.itemLevel)
        , it.name
	from zero_character.character_inventory ci
	  join zero_character.item_instance ii on ii.guid = ci.item
	  join zero_world.item_template it on it.entry = ci.item_template
	where it.inventoryType between 1 and 28
	  and (slot < 18 and ci.bag = 0
		or ci.bag in (18, 19, 20, 21, 22))
	  and it.inventoryType in (/*ranged*/15,25,26,28)
	group by ci.guid
		, it.inventoryType
        , it.name
	) sub
  join zero_character.characters c on c.guid = sub.guid
where c.guid in (1,2,3,4,5,6,7,8,9,10)
order by guid
	, type;
	
-- view creature loot table by name
select ct.name
	, clt.ChanceOrQuestChance
    , clt.groupid
    , it.name
    , it.itemLevel
from zero_world.creature_template ct
  join zero_world.creature_loot_template clt on clt.entry = ct.entry
  join zero_world.item_template it on it.entry = clt.item
where ct.name = ''