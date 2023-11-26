update emucoach_char_cata.characters ecc
  join characters_cata.characters cc on cc.name = ecc.name
set ecc.playerBytes = cc.skin + (cc.face << 8) + (cc.hairStyle << 16) + (cc.hairColor << 24), ecc.playerBytes2 = cc.facialStyle
where ecc.account in (15,16,17,18);

-- original settings
-- name, playerBytes, playerBytes2
-- Facurn	459788	33554436
-- Kaben	151192322	33554442
-- Kwax	118292999	33554441
-- Yanz	17041159	1
-- Marei	33752835	33554436
-- Celis	118030592	33554435
-- Herno	100729605	33554442
-- Tirkik	33752577	33554432
-- Davon	67437572	33554433
-- Ilia	117771522	33554432
-- Lylin	16974337	33554435
-- Mioh	67699457	33554432

-- After playing a test character, I decided to resurrect my Cata test characters.
-- Now migrating stats and items from the test char to the main.
update emucoach_char_cata.characters f
  cross join emucoach_char_cata.characters p
set f.level = p.level, f.xp = p.xp, f.money = p.money, f.position_x = p.position_x, f.position_y = p.position_y, f.position_z = p.position_z, f.taximask = p.taximask, f.totaltime = p.totaltime, f.leveltime = p.leveltime, f.rest_bonus = p.rest_bonsu, f.health = p.health, f.power1 = p.power1, f.power2 = p.power2, f.speccount = p.speccount, f.activespec = p.activespec, f.exploredZones = p.exploredZones, f.equipmentCache = p.equipmentCache, f.actionBars = p.actionBars, f.talenTree = p.talentTree
where f.name = 'Facurn'
  and p.name = 'Paladinta';
  
delete from character_action where guid = (select guid from characters where name = 'Facurn');
insert into character_action (guid, spec, button, action, type)
select c.guid, spec, button, action, type from character_action ca cross join characters c
where ca.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';

delete from character_aura where guid = (select guid from characters where name = 'Facurn');
insert into character_aura (guid, caster_guid, item_guid, spell, effect_mask, recalculate_mask, stackcount, amount0, amount1, amount2, base_amount0, base_amount1, base_amount2, maxduration, remaintime, remaincharges)
select c.guid, caster_guid, item_guid, spell, effect_mask, recalculate_mask, stackcount, amount0, amount1, amount2, base_amount0, base_amount1, base_amount2, maxduration, remaintime, remaincharges from character_aura ca cross join characters c
where ca.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';

delete from item_instance where owner_guid = (select guid from characters where name = 'Facurn');
set @itemInstanceGuid := (select max(guid) from item_instance);
drop temporary table if exists item_character_map;
create temporary table item_character_map (source_item_guid int, target_item_guid int, source_character_guid int, target_character_guid int, source_bag int, target_bag int, slot int);
insert into item_character_map (source_item_guid, target_item_guid, source_character_guid, target_character_guid, source_bag, slot)
select ii.guid, @itemInstanceGuid := @itemInstanceGuid + 1, ii.owner_guid, c.guid, ci.bag, ci.slot
from item_instance ii join character_inventory ci on ci.guid = ii.owner_guid and ci.item = ii.guid cross join characters c
where ii.owner_guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';

update item_character_map icm left join item_character_map bag on bag.source_item_guid = icm.source_bag set icm.target_bag = ifnull(bag.target_item_guid,0);

insert into item_instance (guid, itemEntry, owner_guid, creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text)
select icm.target_item_guid, itemEntry, icm.target_character_guid, 0, 0, count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text
from item_instance ii join item_character_map icm on icm.source_item_guid = ii.guid;

delete from character_inventory where guid = (select guid from characters where name = 'Facurn');
insert into character_inventory (guid, bag, slot, item)
SELECT icm.target_character_guid, icm.target_bag, icm.slot, icm.target_item_guid FROM item_character_map icm;

delete from character_queststatus where guid = (select guid from characters where name = 'Facurn');
insert into character_queststatus (guid, quest, status, explored, timer, mobcount1, mobcount2, mobcount3, mobcount4, itemcount1, itemcount2, itemcount3, itemcount4, itemcount5, itemcount6, playercount)
select c.guid, quest, status, explored, timer, mobcount1, mobcount2, mobcount3, mobcount4, itemcount1, itemcount2, itemcount3, itemcount4, itemcount5, itemcount6, playercount from character_queststatus cq cross join characters c
where cq.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';

delete from character_queststatus_rewarded where guid = (select guid from characters where name = 'Facurn');
insert into character_queststatus_rewarded (guid, quest, active)
select c.guid, quest, active from character_queststatus_rewarded cqr cross join characters c
where cqr.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';

delete from character_reputation where guid = (select guid from characters where name = 'Facurn');
insert into character_reputation (guid, faction, standing, flags)
select c.guid, faction, standing, flags from character_reputation cr cross join characters c
where cr.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';

insert into character_skills (guid, skill, value, max)
select c.guid, skill, value, max from character_skills cs cross join characters c
where cs.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn'
  and not exists (select 1 from character_skills sub where sub.skill = cs.skill and sub.guid = cs.guid);
  
delete from character_spell where guid = (select guid from characters where name = 'Facurn');
insert into character_spell (guid, spell, active, disabled)
select c.guid, spell, active, disabled from character_spell cs cross join characters c
where cs.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';

delete from character_talent where guid = (select guid from characters where name = 'Facurn');
insert into character_talent (guid, spell, spec)
select c.guid, spell, spec from character_talent ct cross join characters c
where ct.guid = (select guid from characters where name = 'Paladinta') and c.name = 'Facurn';