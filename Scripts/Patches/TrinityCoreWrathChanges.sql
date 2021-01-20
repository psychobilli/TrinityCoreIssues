-- reduce the respawn on Dark Iron Pillows.
update gameobject
set spawntimesecs = 90
where id = 
	(select got.entry
     from gameobject_template got
     where got.name in (
		'Dark Iron Pillow'
		)
	);

-- reduce the respawn time on Incendosaurs
update creature
set spawntimesecs = 240
where id in (
	select entry
    from creature_template
    where name = 'Incendosaur'
);

-- reduce the respawn time on game objects in use with quests.
create temporary table goSlowSpawns
select go.id
	, got.name
	, count(got.entry) as gotCount
from gameobject go
  join gameobject_template got on got.entry = go.id
  join gameobject_questitem gqi on gqi.GameObjectEntry = got.entry
where spawntimesecs > 25
group by got.name
having count(got.entry) = 1;

update gameobject
set spawntimesecs = 25
where spawntimesecs > 25
  and id in
	(select id
     from goSlowSpawns);
     
drop temporary table goSlowSpawns;
  
-- reduce dual spec to 10g from 1000.
update gossip_menu_option
set BoxMoney = 100000
where OptionType = 18;

-- add Monstrous Crawler Leg to Silt Crawler loot table
-- because F that quest.
insert into creature_loot_template
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
from creature_loot_template clt
  cross join creature_template newct
where newct.name in (
		'Silt Crawler'
	)
  and newct.entry not in
	(select entry
	 from creature_loot_template
	 where item in
		(select entry
		 from item_template
		 where name in (
			'Monstrous Crawler Leg'
		 )
		)
	  and entry in (
		select entry
		from creature_template
		where name in (
			'Silt Crawler'
		)
	  )
	)
  and clt.entry in (
	select entry
    from creature_template
    where name in (
		'Monstrous Crawler'
	)
)
  and clt.item in (
	select entry
    from item_template
    where name in (
		'Monstrous Crawler Leg'
	)
);
-- increase the drop rate on Giant Kilari Wing
update creature_loot_template
set chance = 100
where entry in (
	select entry
    from creature_template
    where name in (
		'Monstrous Kaliri'
	)
)
  and item in (
	select entry
    from item_template
    where name in (
		'Giant Kaliri Wing'
	)
);

-- increase the drop rate on Essence of the Monsoon and 
-- Essence of the Storm for a Frenzyheart Daily
update creature_loot_template
set chance = 50
where entry in (
	select entry
    from creature_template
    where name in (
		'Storm Revenant',
        'Aqueous Spirit'
	)
)
  and item in (
	select entry
    from item_template
    where name in (
		'Essence of the Storm',
		'Essence of the Monsoon'
    )
);
-- add heroic mobs to dungeon rep
insert into creature_onkill_reputation
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
from creature_template ct
  left join creature_onkill_reputation cor on cor.creature_id = ct.entry
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
insert into creature_onkill_reputation
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
from creature_template ct
  left join creature_onkill_reputation cor on cor.creature_id = ct.entry
where cor.creature_id is null
  and name in (
	'Portal Guardian (1)',
	'Portal Keeper (1)',
	'Erekem Guard (1)'
);
insert into creature_onkill_reputation
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
from creature_template ct
  left join creature_onkill_reputation cor on cor.creature_id = ct.entry
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
update creature
set spawntimesecs = 25
where guid in
	(select entry
     from creature_template
     where name = 'Kul the Reckless');
-- delete a smart script on the wrong mob.
delete from smart_scripts
where action_type = 42
  and source_type = 0
  and entryorguid in
	(select entry
     from creature_template
     where name = 'Steelforged Defender');
-- Molten Core trash mobs yield rep through exalted (7) instead of honored (5)
update creature_onkill_reputation
set MaxStanding1 = 7
where creature_id in (
	12076, 11673, 11671, 11668, 11667, 11666,
	11665, 11664, 11663, 11662, 11661, 11659,
	11658, 12100, 12101, 12119
);
-- Molten Core bosses yield rep through exalted (7) instead of revered (6)
update creature_onkill_reputation
set MaxStanding1 = 7
where creature_id in (
	12057, 12056, 11982, 11672, 
    12098, 12118, 12259, 12264
);
-- Correct Hyjal run speeds for mobs
update creature_template
set speed_walk = 4.5 -- walk previously 1.2
where entry in
	(select creature_id
     from creature_onkill_reputation
     where RewOnKillRepFaction1 = 990)
  and name not in ('Gargoyle','Giant Infernal');

update creature_template
set speed_walk = 2.4 -- walk previously 1.2
where entry in
	(select creature_id
     from creature_onkill_reputation
     where RewOnKillRepFaction1 = 990)
  and name in ('Gargoyle');

update creature_template
set speed_walk = 2 -- walk previously 1.2
where entry in
	(select creature_id
     from creature_onkill_reputation
     where RewOnKillRepFaction1 = 990)
  and name = 'Giant Infernal';
  
-- correct an Ogri'la quest availability
update quest_template_addon
set RequiredMinRepValue = 9000
where id = 11026;

-- double rep gains for keepers of time
create temporary table repUpdate
select creature_id , RewOnKillRepValue1 * 2 as RewOnKillRepValue1
from creature_template ct
  join creature_onkill_reputation cor on cor.creature_id = ct.entry
where 120 = (
	select RewOnKillRepValue1
	from creature_onkill_reputation cor
	  join creature_template ct on cor.creature_id = ct.entry
	where ct.name = 'Aeonus'
)
  and cor.rewonkillrepfaction1 = 989;
    
update creature_onkill_reputation cor
  join repUpdate ru on ru.creature_id = cor.creature_id
set cor.RewOnKillRepValue1 = ru.RewOnKillRepValue1;
  
drop temporary table repUpdate;

-- allow horde to do quest Maintaing the Portal
update quest_template
set allowableraces = 0
where id = 11880;

-- correct Isle of Qual'Danas drop rates.
update creature_loot_template
set chance = 42
where entry in (
	select entry
    from creature_template
    where name in (
        'Darkspine Myrmidon'
	)
)
  and item in (
	select entry
    from item_template
    where name in (
		'Darkspine Chest Key'
	)
);

update creature_loot_template
set chance = 48
where entry in (
	select entry
    from creature_template
    where name in (
        'Wretched Devourer'
	)
)
  and item in (
	select entry
    from item_template
    where name in (
		'Mana Remnants'
	)
);

insert into creature_loot_template
(Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment)
select ct.entry, clt.Item, clt.Reference, 
	case when ct.name = 'Wretched Hungerer'
		then 53
		when ct.name = 'Wretched Fiend'
        then 50
	end,  
	clt.QuestRequired, clt.LootMode, clt.GroupId, clt.MinCount, clt.MaxCount, clt.Comment
from creature_template ct
  cross join creature_loot_template clt
where name in (
	'Wretched Hungerer',
	'Wretched Fiend'
)
  and item in (
	select entry
	from item_template
	where name in (
		'Mana Remnants'
	)
)
  and not exists
  (select 1
   from creature_loot_template
   where entry in (
	select entry
    from creature_template
	where name in (
		'Wretched Hungerer',
		'Wretched Fiend'
	)
  )
    and item in (
		select entry
        from item_template
        where name in (
			'Mana Remnants'
        )
    )
);

update gameobject go
  join gameobject_template got on got.entry = go.id
set spawntimesecs = 120
where spawntimesecs > 120
  and got.name = 'Smuggled Mana Cell';
  
-- Make Netherwing Dailies easier.
select @felGland := entry
from item_template
where name = 'Fel Gland';

update creature_loot_template
set chance = 100
where item = @felGland;

select @crystals := entry
from item_template
where name = 'Netherwing Crystal';

update creature_loot_template
set MaxCount = 5, MinCount = 3
where item = @crystals;

select @ore := entry
from item_template
where name = 'Nethercite Ore';

update gameobject_loot_template
set minCount = 4, maxCount = 10
where item = @ore;

update gameobject go
  join gameobject_template got on go.id = got.entry
  join gameobject_loot_template glt on got.data1 = glt.entry
set go.spawntimesecs = 300
where glt.item = @ore;

select @pollen := entry
from item_template
where name = 'Netherdust Pollen';

update gameobject_loot_template
set minCount = 4, maxCount = 10
where item = @pollen;

-- delete from pool_gameobject
-- where guid in (
-- 	select guid 
--    from gameobject go
--	  join gameobject_template got on go.id = got.entry
--	  join gameobject_loot_template glt on got.data1 = glt.entry
--	where glt.item = @pollen
-- );

update gameobject go
  join gameobject_template got on go.id = got.entry
  join gameobject_loot_template glt on got.data1 = glt.entry
set go.spawntimesecs = 300
where glt.item = @pollen;

select @dragonmaw_peon := entry
from creature_template
where name = 'Disobedient Dragonmaw Peon';

update smart_scripts
set target_type = 16
where entryorguid = @dragonmaw_peon
  and source_type = 0
  and id = 0;
  
-- correct Atal'ai Deathwalker's Spirit move speed.
update creature_template
set speed_walk = .25, speed_run = .33
where name = 'Atal''ai Deathwalker''s Spirit';

-- change required quest for A Tast of Flame (BRD Quest)
update quest_template_addon
set PrevQuestId = 0 -- was 4023
where Id = 4024;

-- add all eternal discoveries to other eternal transmutes
insert into skill_discovery_template
select sdt.spellId
	, sdt2.spellId
    , sdt.reqSkillValue
    , sdt.chance
from skill_discovery_template sdt
  join skill_discovery_template sdt2 on sdt2.reqSpell = sdt.reqSpell
					and sdt2.spellId != sdt.spellId
where sdt.reqSpell = 60350
  and sdt.reqSkillValue = 400;