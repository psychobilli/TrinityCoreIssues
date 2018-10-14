-- CharStartOutfit codes
-- InventoryTypes:
--    NonEquip = 0
--    Head = 1
--    Neck = 2
--    Shoulders = 3
--    Body = 4		(aka, Shirts)
--    Chest = 5
--    Waist = 6
--    Legs = 7
--    Feet = 8
--    Wrists = 9
--    Hands = 10
--    Finger = 11
--    Trinket = 12
--    Weapon = 13
--    Shield = 14
--    Ranged = 15
--    Cloak = 16
--    TwoHandedWeapon = 17
--    Bag = 18
--    Tabard = 19
--    Robe = 20
--    MainHandWeapon = 21
--    OffHandWeapon = 22
--    Holdable = 23
--    Ammo = 24
--    Thrown = 25
--    RangedRight = 26
--    Quiver = 27
--    Relic = 28

-- Class IDs:
--    Warrior = 1
--    Paladin = 2
--    Hunter = 3
--    Rogue = 4
--    Priest =5
--    Deathknight = 6
--    Shaman = 7
--    Mage = 8
--    Warlock = 9
--    Druid = 11

-- Race IDs:
--    Human = 1
--    Orc = 2
--    Dwarf = 3
--    Night Elf = 4
--    Undead = 5
--    Tauren = 6
--    Gnome = 7
--    Troll = 8
--    Blood Elf = 10
--    Draenei = 11

-- characters.character_inventory slot codes
-- 0		Head
-- 1		Neck
-- 2		Shoulders
-- 3		Body (aka shirt)
-- 4		Chest
-- 5		Waist
-- 6		Legs
-- 7		Feet
-- 8		Wrists
-- 9		Hands
-- 10		Finger 1
-- 11		Finger 2
-- 12		Trinket 1
-- 13		Trinket 2
-- 14		Back
-- 15		Main Hand
-- 16		Off Hand
-- 17		Ranged
-- 18		Tabard
-- 19-22	Equipped Bags
-- 23-38	Main Backpack
-- 39-66	Main Bank
-- 67-73	Bank Bags
-- 86-117	Keys in Keyring
-- 118-135	Currencies (Emblems,badges,marks etc.)


-- delete skills, will be auto-generated on log in.
delete from characters.character_skills
where guid =
	(select guid
	 from characters.characters
	 where name = 'Wen');
	 
-- view the target character's current inventory
-- necessary to determine what to update, delete and add
-- also check this after the following updates.
-- if item_instance.guid has a value of 0 it needs to be
-- changed to a value greater than 0 which is not in use,
-- and the corresponding value in character_inventory.item
-- will need to be updated to the same value.
select c.name
	, ci.*
	, ii.*
from characters.character_inventory ci
  join characters.item_instance ii on ii.guid = ci.item
  join characters.characters c on c.guid = ci.guid
where c.name = 'Wen');

-- change an item in an equipped slot
-- add a new query for each item
update characters.item_instance ii
set ii.itemEntry = 40
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Wen')
       and slot = 7);
	   
-- move an item from one slot to another slot.
-- generally paired with the update above.
update characters.character_inventory
set slot = 5
where item =
	(select guid
	 from characters.item_instance
	 where itemEntry = 40
	   and owner_guid =
		(select guid
		 from characters.characters
		 where name = 'Wen')
		);

-- delete items no longer in use
delete from characters.item_instance
where guid in
	(select item
	 from characters.character_inventory
	 where guid = 
		(select guid
		 from characters.characters
		 where name = 'Wen')
	   and slot in (47)
	);

-- delete items no longer in use
delete from characters.character_inventory
where guid = 
	(select guid
	 from characters.characters
	 where name = 'Wen')
  and slot in (47);
       
-- add a new item instance for a character
-- add a new query for each item
insert into characters.item_instance
(itemEntry, owner_guid, creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text)
select it.entry
	, c.guid
    , 0
    , 0
    , 1
    , 0
    , '0 0 0 0 0 '
    , 0
    , '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '
    , 0
    , it.maxDurability
    , 0
    , ''
from world.item_template it
cross join characters.characters c
where it.entry = 49778
  and c.name = 'Wen';

-- add new item instances to character inventory
-- be sure to update the case statement for the appropriate slots.
insert into characters.character_inventory
(guid, bag, slot, item)
select ii.owner_guid
	, 0
    , case when itemEntry = 49778
			then 15
	  end
	, ii.guid
from characters.item_instance ii
where owner_guid in
	(select guid
     from characters.characters
     where name = 'Wen')
  and guid not in
	(select item
     from characters.character_inventory);
	 

-- change the character class
update characters.characters
set class = 8
where name = 'Wen';