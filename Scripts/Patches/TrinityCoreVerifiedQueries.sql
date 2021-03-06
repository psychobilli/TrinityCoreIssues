--VERIFIED QUERIES
-- find quest items by name or container
select it.entry as itemId
	, it.name as ItemName
	, got.name as ContainerName
    , go.position_x
    , go.position_y
    , go.position_z
    , go.spawntimesecs
from world.item_template it
  join world.gameobject_loot_template glt on glt.item = it.entry
  join world.gameobject_questitem gqi on gqi.itemId = it.entry
  join world.gameobject go on go.id = gqi.gameObjectEntry
  join world.gameobject_template got on got.entry = go.id
-- where it.name like '%Captain''s Documents%';
where got.name like 'Gan''jo''s%';

-- find creature spawn location, time by name
select ct.name
	, c.zoneId
	, c.position_x
    , c.position_y
    , c.position_z
    , c.spawntimesecs
from world.creature_template ct
  join world.creature c on c.id = ct.entry
where name like 'Elder Saltwater%';

-- view creature loot table
select ct.name
	, i.name
	, clt.chance
from world.creature_template ct
  join world.creature_loot_template clt on clt.entry = ct.entry
  join world.item_template i on i.entry = clt.item
where ct.name like 'Monstrous Kaliri%';

-- Find a gameobject by zone.  Map must be found from Map.dbc.m_Id
select *
from world.gameobject go
  join world.gameobject_template got on got.entry = go.id
where go.map = 429
  and got.name like '%%';
  
-- Find approximate character item level
select sub.guid
	, c.name
	, avg(iLevel)
from (
	select ci.guid as guid
		, it.inventoryType as type
		, max(it.itemLevel) as iLevel
	from characters.character_inventory ci
	  join characters.item_instance ii on ii.guid = ci.item
	  join world.item_template it on it.entry = ii.itementry
	where ci.guid in (1,2,3,4)
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
	from characters.character_inventory ci
	  join characters.item_instance ii on ii.guid = ci.item
	  join world.item_template it on it.entry = ii.itementry
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
	from characters.character_inventory ci
	  join characters.item_instance ii on ii.guid = ci.item
	  join world.item_template it on it.entry = ii.itementry
	where it.inventoryType between 1 and 28
	  and (slot < 18 and ci.bag = 0
		or ci.bag in (18, 19, 20, 21, 22))
	  and it.inventoryType in (/*ranged*/15,25,26,28)
	group by ci.guid
		, it.inventoryType
	) sub
  join characters.characters c on c.guid = sub.guid
-- where c.guid in (1,2,3,4)
group by sub.guid
	, c.name;

-- Mob loot by Dungeon Map and Difficulty
select ct.entry
	, ct.name
	, ct.lootId
    , case when ct.family = 1 then 'Wolf'
		when ct.family = 2 then 'Cat'
		when ct.family = 3 then 'Spider'
		when ct.family = 4 then 'Bear'
		when ct.family = 5 then 'Boar'
		when ct.family = 6 then 'Crocolisk'
		when ct.family = 7 then 'Carrion Bird'
		when ct.family = 8 then 'Crab'
		when ct.family = 9 then 'Gorilla'
		when ct.family = 11 then 'Raptor'
		when ct.family = 12 then 'Tallstrider'
		when ct.family = 15 then 'Felhunter'
		when ct.family = 16 then 'Voidwalker'
		when ct.family = 17 then 'Succubus'
		when ct.family = 19 then 'Doomguard'
		when ct.family = 20 then 'Scorpid'
		when ct.family = 21 then 'Turtle'
		when ct.family = 23 then 'Imp'
		when ct.family = 24 then 'Bat'
		when ct.family = 25 then 'Hyena'
		when ct.family = 26 then 'Owl'
		when ct.family = 27 then 'Wind Serpent'
		when ct.family = 28 then 'Remote Control'
		when ct.family = 29 then 'Felguard'
		when ct.family = 30 then 'Dragonhawk'
		when ct.family = 31 then 'Ravager'
		when ct.family = 32 then 'Warp Stalker'
		when ct.family = 33 then 'Sporebat'
		when ct.family = 34 then 'Nether Ray'
		when ct.family = 35 then 'Serpent'
		when ct.family = 37 then 'Moth'
		when ct.family = 38 then 'Chimaera'
		when ct.family = 39 then 'Devilsaur'
		when ct.family = 40 then 'Ghoul'
		when ct.family = 41 then 'Silithid'
		when ct.family = 42 then 'Worm'
		when ct.family = 43 then 'Rhino'
		when ct.family = 44 then 'Wasp'
		when ct.family = 45 then 'Core Hound'
		when ct.family = 46 then 'Spirit Beast'
        else 'none'
	  end as familyName
-- 	, ct.family
    , case when ct.type = 0 then 'None'
		when ct.type = 1 then 'Beast'
		when ct.type = 2 then 'Dragonkin'
		when ct.type = 3 then 'Demon'
		when ct.type = 4 then 'Elemental'
		when ct.type = 5 then 'Giant'
		when ct.type = 6 then 'Undead'
		when ct.type = 7 then 'Humanoid'
		when ct.type = 8 then 'Critter'
		when ct.type = 9 then 'Mechanical'
		when ct.type = 10 then 'Not specified'
		when ct.type = 11 then 'Totem'
		when ct.type = 12 then 'Non-Combat Pet'
		when ct.type = 13 then 'Gas Cloud'
		when ct.type = 14 then 'Wild Pet'
		when ct.type = 15 then 'Aberration'
	  end as typeName
-- 	, ct.type 
    -- , count(clt.entry) as lootCount
    , hct.entry
    , hct.name
    , hct.lootid
--     , count(hclt.entry) as heroicLootCount
from world.creature_template ct
  -- left join world.creature_loot_template clt on clt.Entry = ct.lootId
  join world.creature_template hct on hct.entry = ct.difficulty_entry_1
  -- left join world.creature_loot_template hclt on clt.Entry = hct.lootId
where ct.entry in
	(select id
     from world.creature c
      where c.map in (
        574 -- Utgarde Keep
--        ,575 -- Utgarde Pinnacle
--        ,576 -- The Nexus
--        ,578 -- The Occulus
--        ,595 -- The Culling of Stratholme
--        ,599 -- Halls of Stone
--        ,600 -- Drak'Tharon Keep
--        ,601 -- Azjol-Nerub
--        ,602 -- Halls of Lightning
--        ,604 -- Gundrak
--        ,608 -- Violet Hold
--        ,619 -- Ahn'kahet: The Old Kingdom
--        ,632 -- The Forge of Souls
--        ,650 -- Trial of the Champion
--        ,658 -- Pit of Saron
--        ,668 -- Halls of Reflection
		) 
	)
-- group by ct.name
-- 	, ct.lootId
--     , hct.name
--     , hct.lootid
-- order by heroiclootCount desc
;

-- items by loot table
select clt.*
	, case when clt.reference = 0
           then it.name
           else ''
	  end as itemName
	, case when clt.reference = 0
           then it.RequiredLevel
           else ''
	  end as itemReqLevel
	, case when clt.reference = 0
           then it.Quality
           else ''
	  end as itemQuality
    , rlt.*
    , case when rlt.reference = 0
		   then rit.name
           else ''
	  end as refItemName
	, case when rlt.reference = 0
           then rit.RequiredLevel
           else ''
	  end as refItemReqLevel
	, case when rlt.reference = 0
           then rit.Quality
           else ''
	  end as itemQuality
    , rlt2.*
    , case when rlt2.reference = 0
		   then rit2.name
           else ''
	  end as subRefItemName
	, case when rlt2.reference = 0
           then rit2.RequiredLevel
           else ''
	  end as subRefItemReqLevel
	, case when rlt2.reference = 0
           then rit2.Quality
           else ''
	  end as itemQuality
    , rit2.RequiredLevel
from world.creature_loot_template clt
  left join world.item_template it on it.entry = clt.item
  left join world.reference_loot_template rlt on rlt.Entry = clt.Reference
  left join world.item_template rit on rit.entry = rlt.item
  left join world.reference_loot_template rlt2 on rlt2.Entry = rlt.Reference
  left join world.item_template rit2 on rit2.entry = rlt2.item
-- where clt.entry in (30660,31501);
where clt.entry in (28410);