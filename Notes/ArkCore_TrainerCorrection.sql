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