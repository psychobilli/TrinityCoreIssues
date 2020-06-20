DROP PROCEDURE IF EXISTS validate_gossip_menu_option_trainer;
DELIMITER //
CREATE PROCEDURE validate_gossip_menu_option_trainer(IN trainer int)
BEGIN

	set @class := case when trainer in (16, 145)
					   then 1
                       when trainer in (164, 168)
                       then 2
                       when trainer in (15, 40)
                       then 3
                       when trainer in (17, 33)
                       then 4
                       when trainer in (3, 127)
                       then 5
                       when trainer in (124, 134)
                       then 7
                       when trainer in (44, 135)
                       then 8
                       when trainer in (32, 154)
                       then 9
                       when trainer in (39, 50)
                       then 11
			end;
	set @lowlevel := case when trainer in (145, 168, 15, 17, 127, 134, 44, 32, 50)
						then 'low level'
                        else ''
			end;
	-- check gossip_menu_option_trainer for missing gossip_menu_option
	select count(*) as 'gossip_menu_option_trainer missing gossip_menu_option', trainer, @lowlevel from gossip_menu_option_trainer gmot 
	where not exists 
		(select 1 from gossip_menu_option gmo where gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex) 
	  and gmot.trainerId = trainer;

	-- check gossip_menu_option for incorrect OptionType flags on trainers.
	select count(*) as 'gossip_menu_option incorrect OptionType flags on trainer', trainer, @lowlevel from gossip_menu_option gmo 
	where exists 
		(select 1 from gossip_menu_option_trainer gmot 
			where gmot.MenuId = gmo.MenuId and gmot.OptionIndex = gmo.OptionIndex and gmot.trainerId = trainer) 
	and OptionType != 5; 

	-- check gossip_menu_option for incorrect OptionNpcFlag flags on trainers.
	select count(*) as 'gossip_menu_option incorrect OptionNpcFlag flags on trainer', trainer, @lowlevel from gossip_menu_option gmo 
	where exists 
		(select 1 from gossip_menu_option_trainer gmot 
			where gmot.MenuId = gmo.MenuId and gmot.OptionIndex = gmo.OptionIndex and gmot.trainerId = trainer) 
	and OptionNpcFlag != 16;

	-- check gossip_menu_option for missing gossip_menus
	select count(*) as 'gossip_menu_option missing gossip_menus' from gossip_menu_option gmo 
	where not exists 
		(select 1 from gossip_menu gm where gm.MenuId = gmo.MenuId) 
	and (OptionType = 5 or OptionNpcFlag = 16);

	-- check creature_template for trainers with incorrect npcFlag.
	select count(*) as 'creature_template trainers with incorrect npcFlag', trainer, @lowlevel from creature_template ct 
	where exists 
		(select 1 from gossip_menu_option_trainer gmot 
			where gmot.MenuId = ct.gossip_menu_id and gmot.trainerId = trainer) 
	and (ct.npcFlag >> 4) % 2 != 1;

	-- check creature_template for trainers with incorrect class type.
	select count(*) as 'creature_template trainers with incorrect class type', trainer, @lowlevel from creature_template ct 
	where exists 
		(select 1 from gossip_menu_option_trainer gmot 
			where gmot.MenuId = ct.gossip_menu_id and gmot.trainerId = trainer) 
	and ct.trainer_type != @class;
END //
DELIMITER ;