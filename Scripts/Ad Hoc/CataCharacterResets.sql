-- WARNING: This script refers to a specific world database.
-- It must be updated before use.
-- world database: world_cata_emucoach
set @characterName := '' collate utf8mb4_unicode_ci;
select @characterGuid := guid from characters where name = @characterName;
update characters c
  join world_cata_emucoach.playercreateinfo pci on pci.race = c.race
											and pci.class = c.class
set c.position_x = pci.position_x, c.position_y = pci.position_y, c.position_z = pci.position_z, c.orientation = c.orientation, level = 1
where name = @characterName;
delete from character_spells where guid = @characterGuid;
delete from character_queststatus where guid = @characterGuid;
delete from character_queststatus_rewarded where guid = @characterGuid;


-- new character class changes
update characters set class = 3 where name = 'Davon'; -- make Davon a hunter
update characters set class = 8 where name = 'Lylin'; -- make Lylin a mage
update characters set class = 4 where name = 'Tirkik'; -- make Tirkik a rogue

delete from character_action where guid in (
	select guid from characters where name in ('Davon','Lylin','Tirkik')
);
select * from character_action;
insert into character_action (guid, spec, button, action, type)
select c.guid, 0, pcia.button, pcia.action, pcia.type
from characters c
  join emucoach_world_cata.playercreateinfo_action pcia on pcia.class = c.class and pcia.race = c.race
where c.guid in (
	select guid from characters where name in ('Davon','Lylin','Tirkik')
);
delete from character_spell where guid in (
	select guid from characters where name in ('Davon','Lylin','Tirkik')
);
insert into character_spell (guid, spell, active, disabled)
select c.guid, pcis.spell, 1, 0
from characters c
  join emucoach_world_cata.playercreateinfo_spell pcis on pcis.class = c.class and pcis.race = c.race
where c.guid in (
	select guid from characters where name in ('Davon','Lylin','Tirkik')
);
insert into character_pet (id, entry, owner, modelid, CreatedBySpell, PetType, level, exp, Reactstate, name, renamed, slot, curhealth, curmana, savetime, abdata)
select maxpet.id, cp.entry, c.guid, cp.modelid, cp.CreatedBySpell, cp.PetType, cp.level, cp.exp, cp.Reactstate, cp.name, cp.renamed, cp.slot, cp.curhealth, cp.curmana, cp.savetime, cp.abdata
from character_pet cp
  cross join characters c
  cross join (
	select max(id) + 1 as id from character_pet
  ) maxpet
where cp.owner in (
	select guid from characters where name = 'HunterWo'
)
  and c.name = 'Davon';

select c.name, CONCAT('.add ', ii.itemEntry)
from character_inventory ci
  join item_instance ii on ii.guid = ci.item
  join characters c on c.guid = ci.guid
where c.name in ('RogueGn','MageNe','HunterWo');

