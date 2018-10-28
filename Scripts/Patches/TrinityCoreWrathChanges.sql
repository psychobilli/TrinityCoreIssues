-- reduce the respawn on Dark Iron Pillows.
update world.gameobject
set spawntimesecs = 150
where id = 
	(select got.entry
     from world.gameobject_template got
     where got.name in (
		'Dark Iron Pillow'
		)
	);

-- reduce the respawn time on game objects in use with quests.
create temporary table goSlowSpawns
select go.id
	, got.name
	, count(got.entry) as gotCount
from world.gameobject go
  join world.gameobject_template got on got.entry = go.id
  join world.gameobject_questitem gqi on gqi.GameObjectEntry = got.entry
where spawntimesecs > 25
group by got.name
having count(got.entry) = 1;

update world.gameobject
set spawntimesecs = 25
where spawntimesecs > 25
  and id in
	(select id
     from goSlowSpawns);
     
drop temporary table goSlowSpawns;
  
-- reduce dual spec to 10g from 1000.
update world.gossip_menu_option
set BoxMoney = 100000
where OptionType = 18;

-- add Monstrous Crawler Leg to Silt Crawler loot table
-- because F that quest.
insert into world.creature_loot_template
select newct.entry
	, clt.item
	, clt.reference
	, clt.chance
	, clt.QuestRequired
	, clt.LootMode
	, clt.GroupId
	, clt.MinCount
	, clt.MaxCount
	, clt.Comment
from world.creature_loot_template clt
  cross join world.creature_template newct
where newct.name in (
		'Silt Crawler'
	)
  and newct.entry not in
	(select entry
	 from world.creature_loot_template
	 where item in
		(select entry
		 from world.item_template
		 where name in (
			'Monstrous Crawler Leg'
		 )
		)
	  and entry in (
		select entry
		from world.creature_template
		where name in (
			'Silt Crawler'
		)
	  )
	)
  and clt.entry in (
	select entry
    from world.creature_template
    where name in (
		'Monstrous Crawler'
	)
)
  and clt.item in (
	select entry
    from world.item_template
    where name in (
		'Monstrous Crawler Leg'
	)
);
-- increase the drop rate on Giant Kilari Wing
update world.creature_loot_template
set chance = 100
where entry in (
	select entry
    from world.creature_template
    where name in (
		'Monstrous Kaliri'
	)
)
  and item in (
	select entry
    from world.item_template
    where name in (
		'Giant Kaliri Wing'
	)
);

-- increase the drop rate on Essence of the Monsoon and 
-- Essence of the Storm for a Frenzyheart Daily
update world.creature_loot_template
set chance = 50
where entry in (
	select entry
    from world.creature_template
    where name in (
		'Storm Revenant',
        'Aqueous Spirit'
	)
)
  and item in (
	select entry
    from world.item_template
    where name in (
		'Essence of the Storm',
		'Essence of the Monsoon'
    )
);
-- add heroic mobs to dungeon rep
insert into world.creature_onkill_reputation
select entry
	, 1037
    , 1052
    , 7
    , 0
    , 15
    , 7
    , 0
    , 15
    , 1
from world.creature_template ct
  left join world.creature_onkill_reputation cor on cor.creature_id = ct.entry
where cor.creature_id is null
  and name in (
	'Azure Binder (1)',
	'Azure Captain (1)',
	'Azure Invader (1)',
	'Azure Mage Slayer (1)',
	'Azure Raider (1)',
	'Azure Saboteur (1)',
	'Azure Sorceror (1)',
	'Azure Spellbreaker (1)',
	'Azure Stalker (1)',
	'Veteran Mage Hunter (1)',
    'Spitting Cobra (1)'
);
insert into world.creature_onkill_reputation
select entry
	, 1037
    , 1052
    , 7
    , 0
    , 30
    , 7
    , 0
    , 30
    , 1
from world.creature_template ct
  left join world.creature_onkill_reputation cor on cor.creature_id = ct.entry
where cor.creature_id is null
  and name in (
	'Portal Guardian (1)',
	'Portal Keeper (1)',
	'Erekem Guard (1)'
);
insert into world.creature_onkill_reputation
select entry
	, 1037
    , 1052
    , 7
    , 0
    , 250
    , 7
    , 0
    , 250
    , 1
from world.creature_template ct
  left join world.creature_onkill_reputation cor on cor.creature_id = ct.entry
where cor.creature_id is null
  and name in (
	'Erekem (1)',
	'Moragg (1)',
	'Ichoron (1)',
	'Xevozz (1)',
	'Lavanthor (1)',
	'Zuramat the Obliterator (1)',
	'Cyanigosa (1)'
);
-- reduce the respawn time on a daily mob.
update world.creature
set spawntimesecs = 25
where guid in
	(select entry
     from world.creature_template
     where name = 'Kul the Reckless');
-- delete a smart script on the wrong mob.
delete from world.smart_scripts
where action_type = 42
  and source_type = 0
  and entryorguid in
	(select entry
     from world.creature_template
     where name = 'Steelforged Defender');
-- delete any awarded "Realm First" achievements
-- excluding those belonging to player characters
delete from characters.character_achievement
where achievement in (457,467,466,465,464,463,
	462,461,460,459,458,1404,1405,1406,1407,1408,
	1409,1410,1411,1412,1413,1415,1414,1416,1417,
	1418,1419,1420,1421,1422,1423,1424,1425,1426,
	1427,1400,456,1402,3117,3259,4078,4576,1463)
  and guid not in
	(select guid
	 from characters.characters c
	   join auth.account a on a.id = c.account
	 where username in (
		'P',
		'B',
		'S',
		'Z'
	 )
	);