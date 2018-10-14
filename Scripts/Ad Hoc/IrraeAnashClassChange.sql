-- delete skills, will be auto-generated on log in.
delete from characters.character_skills
where guid in
	(select guid
	 from characters.characters
	 where name in ('Irrae','Anash'));
	 
update characters.item_instance ii
set ii.itemEntry = 6096
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Irrae')
       and slot = 3);
	 
update characters.item_instance ii
set ii.itemEntry = 20894
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Irrae')
       and slot = 6);
	 
update characters.item_instance ii
set ii.itemEntry = 20978
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Irrae')
       and slot = 15);
	 
update characters.item_instance ii
set ii.itemEntry = 20895
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Irrae')
       and slot = 7);
	 
update characters.item_instance ii
set ii.itemEntry = 20893
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Irrae')
       and slot = 17);
	   
update characters.character_inventory
set slot = 4
where item =
	(select guid
	 from characters.item_instance
	 where itemEntry = 20893
	   and owner_guid =
		(select guid
		 from characters.characters
		 where name = 'Irrae')
		);

-- delete items no longer in use
delete from characters.item_instance
where guid in
	(select item
	 from characters.character_inventory
	 where guid = 
		(select guid
		 from characters.characters
		 where name = 'Irrae')
	   and slot in (19, 0)
	);

-- delete items no longer in use
delete from characters.character_inventory
where guid = 
	(select guid
	 from characters.characters
	 where name = 'Irrae')
  and slot in (19, 0);
	 
update characters.item_instance ii
set ii.itemEntry = 127
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Anash')
       and slot = 3);
	 
update characters.item_instance ii
set ii.itemEntry = 6126
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Anash')
       and slot = 6);
	 
update characters.item_instance ii
set ii.itemEntry = 12282
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Anash')
       and slot = 15);
	 
update characters.item_instance ii
set ii.itemEntry = 2504
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Anash')
       and slot = 4);
	   
update characters.character_inventory
set slot = 17
where item =
	(select guid
	 from characters.item_instance
	 where itemEntry = 2504
	   and owner_guid =
		(select guid
		 from characters.characters
		 where name = 'Anash')
		);
	 
update characters.item_instance ii
set ii.itemEntry = 2101
where ii.guid in
	(select item
     from characters.character_inventory
     where guid = 
		(select guid
		 from characters.characters
		 where name = 'Anash')
       and slot = 7);
	   
update characters.character_inventory
set slot = 19
where item =
	(select guid
	 from characters.item_instance
	 where itemEntry = 2101
	   and owner_guid =
		(select guid
		 from characters.characters
		 where name = 'Anash')
		);

-- add a new item instance for a character
-- add a new query for each item
insert into characters.item_instance
(itemEntry, owner_guid, creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text)
select it.entry
	, c.guid
    , 0
    , 0
    , 200 -- count
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
where it.entry = 2512
  and c.name = 'Anash';

-- add new item instances to character inventory
-- be sure to update the case statement for the appropriate slots.
insert into characters.character_inventory
(guid, bag, slot, item)
select ii.owner_guid
	, 0
    , case when itemEntry = 2512
			then 0
	  end
	, ii.guid
from characters.item_instance ii
where owner_guid in
	(select guid
     from characters.characters
     where name = 'Anash')
  and guid not in
	(select item
     from characters.character_inventory);
	 
update characters.characters
set class = 3
where name = 'Anash';

update characters.characters
set class = 8
where name = 'Irrae';
	  
select c.name
	, ci.*
	, ii.*
from characters.character_inventory ci
  join characters.item_instance ii on ii.guid = ci.item
  join characters.characters c on c.guid = ci.guid
where c.name in ('Irrae','Anash');