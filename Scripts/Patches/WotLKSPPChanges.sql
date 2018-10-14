-- dbc changes
-- Glacial Bag, spell 56005, cooldown reduced to 0 from 590400000

-- reduce the respawn on Dark Iron Pillows.
update world.gameobject
set spawntimesecs = 150
where id = 179828;

-- reduce the respawn time on multiple world objects.
update world.gameobject go
set spawntimesecs = 25
where go.id in
	(select got.entry
     from world.gameobject_template got
     where got.name in (
		'Metal Coffer',
		'Torn Pilgrim''s Pack',
		'Ango''rosh Attack Plans',
		'Eye of Veil Shienor',
		'Eye of Veil Reskk',
		'Sealed Box',
		'Mound of Debris',
		'Unlocked Chest',
		'Long Tail Feather',
		'Cannonball',
		'The Frozen Heart of Isuldof',
		'The Ancient Armor of the Kvaldir',
		'Gurgleboggle''s Bauble',
		'Burblegobble''s Bauble',
		'Scarlet Onslaught Daily Orders: Abbey',
		'Scarlet Onslaught Daily Orders: Barracks',
		'Scarlet Onslaught Daily Orders: Beach',
		'The Diary of High General Abbendis',
		'Ruby Lilac',
		'Crashed Plague Sprayer',
		'Sparksocket''s Tools',
		'Transporter Power Cell'
     )
	  and got.entry not in (
		176211
	 )
	)
  and go.spawntimesecs > 25;
  
-- increase the drop rate on Essence of the Monsoon and 
-- Essence of the Storm for a Frenzyheart Daily
update creature_loot_template clt
set chance = 50
where entry in (28858, 28862)
  and item in (39643, 39616);
  
-- increase the drop rate on Giant Kilari Wing
update creature_loot_template clt
set chance = 100
where entry in (23051)
  and item in (33838);
  
-- attempt to make dropped objects Group Friendly.
-- FAILED
-- update world.gameobject_loot_template
-- set maxCount = 5
-- where item in
-- 	(select it.entry
--      from world.item_template it
--      where it.name in (
-- 		'Sorlof''s Booty',
--         'Salrand''s Broken Key',
--         'Kaw''s War Halberd'
--      )
-- 	);
  
-- add more Vengeful Draenei spawns
drop table if exists world.newMobCoords;
create table if not exists world.newMobCoords (x float, y float, z float, o float);
insert into world.newMobCoords values(-2943.04980,4511.346191,-42.947929,6.124172);
insert into world.newMobCoords values(-2966.880615,4402.530273,-49.227837,2.165507);

insert into world.creature
(id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id
    , position_x, position_y, position_z, orientation, spawntimesecs
    , spawndist, currentwaypoint, curhealth, curmana, movementtype
    , npcflag, unit_flags, dynamicflags, VerifiedBuild)
select id
	, map
    , zoneId
    , areaId
    , spawnMask
    , phaseMask
    , modelid
    , equipment_id
    , x
    , y
    , z
    , o
    , spawntimesecs
    , spawndist
    , currentwaypoint
    , curhealth
    , curmana
    , movementtype
    , npcflag
    , unit_flags
    , dynamicflags
    , VerifiedBuild
from (select distinct id
		, map
		, zoneId
		, areaId
		, spawnMask
		, phaseMask
		, modelid
		, equipment_id
		, spawntimesecs
		, spawndist
		, currentwaypoint
		, curhealth
		, curmana
		, movementtype
		, npcflag
		, unit_flags
		, dynamicflags
		, VerifiedBuild
	from world.creature
	where id in
		(select ct.entry
		 from world.creature_template ct
		 where name = 'Vengeful Draenei')
) as base
 cross join world.newMobCoords;

-- add numerous Brittle Revenents for Hodir dailies
drop table if exists world.newMobCoords;
create table if not exists world.newMobCoords (x float, y float, z float, o float);
insert into world.newMobCoords values(7215.603516, -3280.024170, 837.494385, .915149);
 insert into world.newMobCoords values(7251.009277, -3193.735107, 837.552368, 6.212472);
 insert into world.newMobCoords values(7248.154785, -3238.613281, 837.452698, 1.023489);
 insert into world.newMobCoords values(7287.616699, -3212.400635, 837.452698, 2.238500);
 insert into world.newMobCoords values(7276.032227, -3164.779785, 837.452698, .666918);
 insert into world.newMobCoords values(7246.714844, -3143.776367, 837.458252, 3.106328);
 insert into world.newMobCoords values(7270.025391, -3118.842041, 837.451050, 6.200833);
 insert into world.newMobCoords values(7298.593262, -3132.878174, 837.452454, 2.972024);
 insert into world.newMobCoords values(7328.740234, -3131.610840, 837.451050, 3.072593);
 insert into world.newMobCoords values(7350.346680, -3182.516846, 837.452454, 2.212546);
 insert into world.newMobCoords values(7411.153809, -3195.160645, 837.451782, 2.138752);
 insert into world.newMobCoords values(7459.839355, -3156.057129, 837.452087, 2.279305);
 insert into world.newMobCoords values(7464.915527, -3093.022949, 837.453918, 4.047777);
 insert into world.newMobCoords values(7510.645996, -3125.753418, 837.459839, 3.468938);
 insert into world.newMobCoords values(7511.033203, -3165.329834, 837.462524, 2.995343);
 insert into world.newMobCoords values(7495.278809, -3220.107422, 837.460999, 1.815675);

insert into world.creature
(id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id
    , position_x, position_y, position_z, orientation, spawntimesecs
    , spawndist, currentwaypoint, curhealth, curmana, movementtype
    , npcflag, unit_flags, dynamicflags, VerifiedBuild)
select id
	, map
    , zoneId
    , areaId
    , spawnMask
    , phaseMask
    , modelid
    , equipment_id
    , x
    , y
    , z
    , o
    , spawntimesecs
    , spawndist
    , currentwaypoint
    , curhealth
    , curmana
    , movementtype
    , npcflag
    , unit_flags
    , dynamicflags
    , VerifiedBuild
from (select distinct id
		, map
		, zoneId
		, areaId
		, spawnMask
		, phaseMask
		, modelid
		, equipment_id
		, spawntimesecs
		, spawndist
		, currentwaypoint
		, curhealth
		, curmana
		, movementtype
		, npcflag
		, unit_flags
		, dynamicflags
		, VerifiedBuild
	from world.creature
	where id in
		(select ct.entry
		 from world.creature_template ct
		 where name = 'Brittle Revenant')
) as base
 cross join world.newMobCoords;

drop table if exists world.newMobCoords;

-- reduce dual spec to 10g from 1000.
update world.gossip_menu_option
set box_money = 100000
where option_id = 18;

-- add Monstrous Crawler Leg to Silt Crawler loot table
-- because F that quest.
insert into world.creature_loot_template
select 922
	, item
	, reference
	, chance
	, QuestRequired
	, LootMode
	, GroupId
	, MinCount
	, MaxCount
	, Comment
from world.creature_loot_template
where Item = 6184
  and Entry = 1088;
  
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
	   join realmd.account a on a.id = c.account
	 where username in (
		'P',
		'B',
		'S',
		'Z'
	 )
	);

-- adjust the time of the Kalu'ak Fishing Derby
update world.game_event
set start_time = '2012-01-07 14:00:00'
where eventEntry = 63;

update world.game_event
set start_time = '2012-01-07 15:00:00'
where eventEntry = 64;
	
-- verified query
-- find quest items by name or container
select it.name as ItemName
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
-- where it.name like '%Scarlet Onslaught%';
where got.name like 'Gan''jo''s%';

-- Attempt to add quest option for Sarasthra, Scourge of the North
-- INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextID`,`comment`) VALUES
-- (26859, 0, 0, 'Don''t ya worry, mon. Just leave it to Rokhan. She be comin''.', 12, 1, 100, 1, 0, 7274, 0, 'Rokhan to Player');

-- INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`box_coded`,`box_money`,`box_text`) VALUES
-- (9434, 0, 0, 'Get that frostwyrm on the ground and I''ll finish her.', 0, 0, ''); -- 26859

-- INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
-- (9434, 12701); -- 26859

-- verified query
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