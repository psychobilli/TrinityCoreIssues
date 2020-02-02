-- Druid
set @classId := 11;
set @failState := 511;
set @passState := 1024;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Warrior
set @classId := 1;
set @failState := 1534;
set @passState := 1;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Paladin
set @classId := 2;
set @failState := 1533;
set @passState := 2;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
from creature_template ct
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
where trainer_class = @classId
  and c.SourceGroup is null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Hunter
set @classId := 3;
set @failState := 1531;
set @passState := 4;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Rogue
set @classId := 4;
set @failState := 1527;
set @passState := 8;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Priest
set @classId := 5;
set @failState := 1519;
set @passState := 16;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Death Knight
set @classId := 6;
set @failState := 1503;
set @passState := 32;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Shaman
set @classId := 7;
set @failState := 1471;
set @passState := 64;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Mage
set @classId := 8;
set @failState := 1407;
set @passState := 128;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;
-- Warlock
set @classId := 9;
set @failState := 1407;
set @passState := 1279;
select *
from conditions
where SourceTypeOrReferenceId in (14,15)
  and ConditionTypeOrReference = 15
  and ConditionValue1 not in (@failState, @passState)
  and SourceGroup in (
	select gossip_menu_id
	from creature_template ct
	where trainer_class = @classid
	  and exists (
		select 1
		from gossip_menu_option
		where menu_id = ct.gossip_menu_id
		)
);
select ct.name
	, 'No conditions for options'
    , gmo.option_text
from creature_template ct
	left join gossip_menu_option gmo on gmo.menu_id = ct.gossip_menu_id
	left join conditions c on c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 15
                        and c.SourceEntry = gmo.id
where trainer_class = @classId
  and c.SourceGroup is null
  and gmo.menu_id is not null;
select ct.name
	, 'No conditions for text'
    , nt.text0_0
    , nt.text0_1
from creature_template ct
	left join gossip_menu gm on gm.entry = ct.gossip_menu_id
    left join npc_text nt on nt.id = gm.text_id
	left join conditions c on c.SourceEntry = gm.text_id
						and c.SourceGroup = ct.gossip_menu_id
						and c.SourceTypeOrReferenceId = 14
where trainer_class = @classId
  and c.SourceGroup is null
  and gm.text_id is not null;