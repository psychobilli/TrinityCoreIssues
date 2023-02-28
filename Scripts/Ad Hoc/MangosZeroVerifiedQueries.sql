-- Total time for Vanilla teams
select title
	, seconds as totalTime
	, days
    , hours - (days * 24) as hours
    , minutes - (hours * 60) as minutes
    , minutesFrac as seconds
    , money
    , gold
    , silver - gold * 100 as silver
    , money - silver * 100 as copper -- elite force 1941.2
    , QuestCount
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
        , max(QuestCount) as QuestCount
	from zero_character.characters c
      cross join (
		select count(*) as QuestCount
		from zero_character.character_queststatus
        where guid in (1)
          and rewarded = 1
		group by guid
	  ) qu
	where c.guid in (1,2,3,4,5)
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
        , max(QuestCount) as QuestCount
	from zero_character.characters
      cross join (
		select count(*) as QuestCount
		from zero_character.character_queststatus
        where guid in (6)
          and rewarded = 1
		group by guid
	  ) qu
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

-- Check Dungeon 1 set items acquired.
select ci.guid
	, c.name
    , ci.slot
    , ci.bag
    , it.name
    , it.InventoryType
from zero_character.character_inventory ci
  join zero_character.characters c on c.guid = ci.guid
  join zero_world.item_template it on it.entry = ci.item_template
where (it.name like '%valor%'
   or it.name like '%wildheart%'
   or it.name like '%dreadmist%'
   or it.name like '%beaststalker%'
   or it.name like '%elements%'
   or it.name like '%devout%'
   or it.name like '%lightforge%'
   or it.name like '%magister%'
   or it.name like '%shadowcraft%')
  and it.name not in ('Core of Elements')
order by ci.guid
	, it.inventoryType;
  
-- find approximate character item level
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
where ct.name = '';

-- Loremaster assistant
select qt.entry
	, qt.QuestLevel
    , qt.title
    , z.AreaName
    , z.ZoneOrder
    , case when (RequiredRaces & 1 != 0
				  or RequiredRaces & 4 != 0
				  or RequiredRaces & 8 != 0
				  or RequiredRaces & 64 != 0)
			 and (RequiredRaces & 2 = 0
				  and RequiredRaces & 16 = 0
				  and RequiredRaces & 32 = 0
				  and RequiredRaces & 128 = 0)
			then 'Alliance'
			when (RequiredRaces & 2 != 0
				  or RequiredRaces & 16 != 0
				  or RequiredRaces & 32 != 0
				  or RequiredRaces & 128 != 0)
			 and (RequiredRaces & 1 = 0
				  and RequiredRaces & 4 = 0
				  and RequiredRaces & 8 = 0
				  and RequiredRaces & 64 = 0)
			then 'Horde'
            else 'Both'
	  end as Faction
    , ifnull(ds.completeCount, 0) as DeathSqaud
    , ifnull(ef.completeCount, 0) as EliteForce
from zero_world.quest_template qt
  left join (
	select quest
		, count(rewarded) as completeCount
    from zero_character.character_queststatus
    where guid between 1 and 5
    group by quest
  ) ds on ds.quest = qt.entry
  left join (
	select quest
		, count(rewarded) as completeCount
    from zero_character.character_queststatus
    where guid between 6 and 10
    group by quest
  ) ef on ef.quest = qt.entry
  left join ( 
	select 1 as ZoneOrder, 0 as Continent,1537 as ID, 'Ironforge' as AreaName union
	select 2 as ZoneOrder, 0 as Continent,1519 as ID, 'Stormwind City' as AreaName union
	select 3 as ZoneOrder, 0 as Continent,1497 as ID, 'Undercity' as AreaName union
    select 4 as ZoneOrder, 0 as Continent,132 as ID, 'Coldridge Valley' as AreaName union
	select 5 as ZoneOrder, 0 as Continent,1 as ID, 'Dun Morogh' as AreaName union
	select 6 as ZoneOrder, 0 as Continent,269 as ID, 'Dun Algaz' as AreaName union
    select 7 as ZoneOrder, 0 as Continent,9 as ID, 'Northshire Valley' as AreaName union
	select 8 as ZoneOrder, 0 as Continent,12 as ID, 'Elwynn Forest' as AreaName union
    select 9 as ZoneOrder, 0 as Continent,154 as ID, 'Deathknell' as AreaName union
	select 10 as ZoneOrder, 0 as Continent,85 as ID, 'Tirisfal Glades' as AreaName union
	select 11 as ZoneOrder, 0 as Continent,38 as ID, 'Loch Modan' as AreaName union
	select 12 as ZoneOrder, 0 as Continent,40 as ID, 'Westfall' as AreaName union
	select 13 as ZoneOrder, 0 as Continent,44 as ID, 'Redridge Mountains' as AreaName union
	select 14 as ZoneOrder, 0 as Continent,130 as ID, 'Silverpine Forest' as AreaName union
	select 15 as ZoneOrder, 0 as Continent,170 as ID, 'Lordamere Lake' as AreaName union
	select 16 as ZoneOrder, 0 as Continent,11 as ID, 'Wetlands' as AreaName union
	select 17 as ZoneOrder, 0 as Continent,330 as ID, 'Thandol Span' as AreaName union
	select 18 as ZoneOrder, 0 as Continent,10 as ID, 'Duskwood' as AreaName union
	select 19 as ZoneOrder, 0 as Continent,267 as ID, 'Hillsbrad Foothills' as AreaName union
	select 20 as ZoneOrder, 0 as Continent,33 as ID, 'Stranglethorn Vale' as AreaName union
	select 21 as ZoneOrder, 0 as Continent,36 as ID, 'Alterac Mountains' as AreaName union
	select 22 as ZoneOrder, 0 as Continent,293 as ID, 'Thoradin’s Wall' as AreaName union
	select 23 as ZoneOrder, 0 as Continent,45 as ID, 'Arathi Highlands' as AreaName union
	select 24 as ZoneOrder, 0 as Continent,8 as ID, 'Swamp of Sorrows' as AreaName union
	select 25 as ZoneOrder, 0 as Continent,3 as ID, 'Badlands' as AreaName union
	select 26 as ZoneOrder, 0 as Continent,51 as ID, 'Searing Gorge' as AreaName union
	select 27 as ZoneOrder, 0 as Continent,47 as ID, 'The Hinterlands' as AreaName union
	select 28 as ZoneOrder, 0 as Continent,28 as ID, 'Western Plaguelands' as AreaName union
	select 29 as ZoneOrder, 0 as Continent,139 as ID, 'Eastern Plaguelands' as AreaName union
	select 30 as ZoneOrder, 0 as Continent,4 as ID, 'Blasted Lands' as AreaName union
	select 31 as ZoneOrder, 0 as Continent,46 as ID, 'Burning Steppes' as AreaName union
	select 32 as ZoneOrder, 0 as Continent,25 as ID, 'Blackrock Mountain' as AreaName union
	select 33 as ZoneOrder, 0 as Continent,41 as ID, 'Deadwind Pass' as AreaName union
	select 34 as ZoneOrder, 0 as Continent,1477 as ID, 'The Temple of Atal’Hakkar' as AreaName union
	select 35 as ZoneOrder, 0 as Continent,1583 as ID, 'Blackrock Spire' as AreaName union
	select 36 as ZoneOrder, 0 as Continent,1584 as ID, 'Blackrock Depths' as AreaName union
	select 37 as ZoneOrder, 0 as Continent,214 as ID, 'The Great Sea' as AreaName union
	select 38 as ZoneOrder, 0 as Continent,308 as ID, 'The Forbidding Sea' as AreaName union
	select 39 as ZoneOrder, 1 as Continent,1637 as ID, 'Orgrimmar' as AreaName union
	select 40 as ZoneOrder, 1 as Continent,1638 as ID, 'Thunder Bluff' as AreaName union
	select 41 as ZoneOrder, 1 as Continent,1657 as ID, 'Darnassus' as AreaName union
    select 42 as ZoneOrder, 1 as Continent,363 as ID, 'Valley of Trials' as AreaName union
	select 43 as ZoneOrder, 1 as Continent,14 as ID, 'Durotar' as AreaName union
    select 44 as ZoneOrder, 1 as Continent,220 as ID, 'Red Cloud Mesa' as AreaName union
	select 45 as ZoneOrder, 1 as Continent,215 as ID, 'Mulgore' as AreaName union
    select 46 as ZoneOrder, 1 as Continent,188 as ID, 'Shadowglen' as AreaName union
	select 47 as ZoneOrder, 1 as Continent,141 as ID, 'Teldrassil' as AreaName union
	select 48 as ZoneOrder, 1 as Continent,377 as ID, 'Southfury River' as AreaName union
	select 49 as ZoneOrder, 1 as Continent,17 as ID, 'The Barrens' as AreaName union
	select 50 as ZoneOrder, 1 as Continent,148 as ID, 'Darkshore' as AreaName union
	select 51 as ZoneOrder, 1 as Continent,406 as ID, 'Stonetalon Mountains' as AreaName union
	select 52 as ZoneOrder, 1 as Continent,331 as ID, 'Ashenvale' as AreaName union
	select 53 as ZoneOrder, 1 as Continent,400 as ID, 'Thousand Needles' as AreaName union
	select 54 as ZoneOrder, 1 as Continent,405 as ID, 'Desolace' as AreaName union
	select 55 as ZoneOrder, 1 as Continent,15 as ID, 'Dustwallow Marsh' as AreaName union
	select 56 as ZoneOrder, 1 as Continent,440 as ID, 'Tanaris' as AreaName union
	select 57 as ZoneOrder, 1 as Continent,357 as ID, 'Feralas' as AreaName union
	select 58 as ZoneOrder, 1 as Continent,16 as ID, 'Azshara' as AreaName union
	select 59 as ZoneOrder, 1 as Continent,361 as ID, 'Felwood' as AreaName union
	select 60 as ZoneOrder, 1 as Continent,490 as ID, 'Un’Goro Crater' as AreaName union
	select 61 as ZoneOrder, 1 as Continent,493 as ID, 'Moonglade' as AreaName union
	select 62 as ZoneOrder, 1 as Continent,618 as ID, 'Winterspring' as AreaName union
	select 63 as ZoneOrder, 1 as Continent,1377 as ID, 'Silithus' as AreaName union
	select 64 as ZoneOrder, 1 as Continent,3478 as ID, 'Gates of Ahn’Qiraj' as AreaName union
	select 65 as ZoneOrder, 1 as Continent,332 as ID, 'The Great Sea' as AreaName union
	select 66 as ZoneOrder, 1 as Continent,457 as ID, 'The Veiled Sea' as AreaName union
	select 67 as ZoneOrder, 36 as Continent,207 as ID, 'The Great Sea' as AreaName union
	select 68 as ZoneOrder, 0 as Continent,0 as ID, 'Undefined' as AreaName
  ) z on z.ID = qt.ZoneOrSort or z.ID = 0
where (case when (RequiredRaces & 1 != 0
				  or RequiredRaces & 4 != 0
				  or RequiredRaces & 8 != 0
				  or RequiredRaces & 64 != 0)
			 and (RequiredRaces & 2 = 0
				  and RequiredRaces & 16 = 0
				  and RequiredRaces & 32 = 0
				  and RequiredRaces & 128 = 0)
			then 0
			when (RequiredRaces & 2 != 0
				  or RequiredRaces & 16 != 0
				  or RequiredRaces & 32 != 0
				  or RequiredRaces & 128 != 0)
			 and (RequiredRaces & 1 = 0
				  and RequiredRaces & 4 = 0
				  and RequiredRaces & 8 = 0
				  and RequiredRaces & 64 = 0)
			then 1
            else 2
	 end = 0 and ifnull(ef.completecount, 0) < 5)
     or (case when (RequiredRaces & 1 != 0
				  or RequiredRaces & 4 != 0
				  or RequiredRaces & 8 != 0
				  or RequiredRaces & 64 != 0)
			 and (RequiredRaces & 2 = 0
				  and RequiredRaces & 16 = 0
				  and RequiredRaces & 32 = 0
				  and RequiredRaces & 128 = 0)
			then 0
			when (RequiredRaces & 2 != 0
				  or RequiredRaces & 16 != 0
				  or RequiredRaces & 32 != 0
				  or RequiredRaces & 128 != 0)
			 and (RequiredRaces & 1 = 0
				  and RequiredRaces & 4 = 0
				  and RequiredRaces & 8 = 0
				  and RequiredRaces & 64 = 0)
			then 1
            else 2
	 end = 1 and ifnull(ds.completecount, 0) < 5)
     or (case when (RequiredRaces & 1 != 0
				  or RequiredRaces & 4 != 0
				  or RequiredRaces & 8 != 0
				  or RequiredRaces & 64 != 0)
			 and (RequiredRaces & 2 = 0
				  and RequiredRaces & 16 = 0
				  and RequiredRaces & 32 = 0
				  and RequiredRaces & 128 = 0)
			then 0
			when (RequiredRaces & 2 != 0
				  or RequiredRaces & 16 != 0
				  or RequiredRaces & 32 != 0
				  or RequiredRaces & 128 != 0)
			 and (RequiredRaces & 1 = 0
				  and RequiredRaces & 4 = 0
				  and RequiredRaces & 8 = 0
				  and RequiredRaces & 64 = 0)
			then 1
            else 2
	 end = 2 and ifnull(ds.completecount, 0) < 5
			and ifnull(ef.completecount, 0) < 5)
-- and ZoneOrder > 38
order by z.ZoneOrder
	, qt.QuestLevel;