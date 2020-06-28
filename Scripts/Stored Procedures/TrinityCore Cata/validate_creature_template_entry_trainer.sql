DROP PROCEDURE IF EXISTS validate_creature_template_entry_trainer;
DELIMITER //
CREATE PROCEDURE validate_creature_template_entry_trainer(IN entryInput int)
BEGIN

	create temporary table results
    (item decimal, keyfield int, message text, details text);
    
    insert into results
    select 1, ct.entry, 'creature_template results', concat(ct.name, ' gossip_menu_id ', ct.gossip_menu_id) from creature_template ct
    where ct.entry = entryInput;
    
    insert into results
    select 2, ct.entry, 'creature_template npcFlag and flag test', concat(ct.npcFlag, ', test: ', case when (npcFlag >> 4) % 2 = 1 then 'true' else 'false' end) from creature_template ct
    where ct.entry = entryInput;
    
    insert into results
    select 3, ct.entry, 'creature_template trainer with trainer_type value', 
    case when ct.trainer_type = 0 then 'class trainer' when ct.trainer_type = 1 then 'mount trainer' when ct.trainer_type = 2 then 'profession trainer' else 'pet trainer' end 
    from creature_template ct where ct.entry = entryInput;
    
    insert into results
    select 3.5, ct.entry, 'creature_template trainer with trainer_class value', case when ct.trainer_class > 0 then 'true' else 'false' end 
    from creature_template ct where ct.entry = entryInput;
    
	-- get gossip_menu_id for creature
    set @Menu_Id := (select gossip_menu_id from creature_template ct where ct.entry = entryInput);
    
    insert into results
    select 4, gm.MenuId, 'gossip_menu for gossip_menu_id', nt.text0_0 from gossip_menu gm left join npc_text nt on nt.Id = gm.TextId where gm.MenuID = @Menu_id;
    
    insert into results
    select 4.5, gm.MenuId, 'gossip_menu conditions', c.Comment from gossip_menu gm 
    join conditions c on c.SourceGroup = gm.MenuID and c.SourceEntry = gm.TextId
    where c.SourceTypeOrReferenceId = 14 and gm.MenuId = @Menu_Id;
    
    insert into results
    select 5, count(*), 'gossip_menu_option records with MenuId ', @Menu_Id as details from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id;
    
    insert into results
    select 5.5, gmo.MenuId, 'gossip_menu_option conditions', c.Comment from gossip_menu_option gmo
    join conditions c on c.SourceGroup = gmo.MenuId and c.SourceEntry = gmo.OptionIndex
    where c.SourceTypeOrReferenceId = 15 and gmo.MenuId = @Menu_Id;
    
    insert into results
    select 6, count(*), 'gossip_menu_option records with OptionType 5 and OptionNpcFlag 16 at OptionIndex', OptionIndex from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id and gmo.OptionType = 5 and gmo.OptionNpcflag = 16 group by OptionIndex;
    
    insert into results
    select 6, count(*), 'gossip_menu_option records with OptionIcon 3 and incorrect Tyoe or Flag', concat('OptionIndex: ', OptionIndex, ', OptionType: ', OptionType, ', OptionNpcFlag: ', OptionNpcFlag) from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id and OptionIcon = 3 and (gmo.OptionType != 5 or gmo.OptionNpcflag != 16) group by OptionIndex;
    
    insert into results
    select 7, count(*), 'gossip_menu_option_trainer records with OptionType 5 and OptionNpcFlag 16 at OptionIndex', concat('OptionIndex: ', gmo.OptionIndex, ', OptionType: ', OptionType, ', OptionNpcFlag: ', OptionNpcFlag)
    from gossip_menu_option_trainer gmot join gossip_menu_option gmo on gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex
    where gmo.OptionType = 5 and gmo.OptionNpcflag = 16 and gmo.MenuId = @Menu_Id group by gmo.OptionIndex;
    
    insert into results
    select 7, count(*), 'gossip_menu_option_trainer records with OptionIcon 3 and incorrect Tyoe or Flag', gmo.OptionIndex 
    from gossip_menu_option_trainer gmot join gossip_menu_option gmo on gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex
    where gmo.MenuId = @Menu_Id and OptionIcon = 3 and not exists (select 1 from gossip_menu_option sub 
	where sub.MenuId = gmo.MenuId and sub.OptionType = 5 and sub.OptionNpcflag = 16) group by OptionIndex;
    
    create temporary table trainers (MenuId int, trainerId int, optionIndex int, description text);
    
    insert into trainers (MenuId, trainerId, OptionIndex, description)
    select gmot.MenuId, gmot.trainerId, gmot.OptionIndex, case when gmot.trainerId in (16)
					   then '(1) warrior'
                       when trainerId in (145)
					   then '(1) warrior low level'
                       when trainerId in (164)
                       then '(2) paladin'
                       when trainerId in (168)
                       then '(2) paladin low level'
                       when trainerId in (40)
                       then '(3) hunter'
                       when trainerId in (15)
                       then '(3) hunter low level'
                       when trainerId in (33)
                       then '(4) rogue'
                       when trainerId in (17)
                       then '(4) rogue low level'
                       when trainerId in (3)
                       then '(5) priest'
                       when trainerId in (127)
                       then '(5) priest low level'
					   when trainerId in (55)
					   then '(6) death knight'
                       when trainerId in (124)
                       then '(7) shaman'
                       when trainerId in (134)
                       then '(7) shaman low level'
                       when trainerId in (135)
                       then '(8) mage'
                       when trainerId in (44)
                       then '(8) mage low level'
                       when trainerId in (154)
                       then '(9) warlock'
                       when trainerId in (32)
                       then '(9) warlock low level'
                       when trainerId in (39)
                       then '(11) druid'
                       when trainerId in (50)
                       then '(11) druid low level'
                       when TrainerId = 2
						then 'Illustrious Grand Master Jewelcrafter'
						when TrainerId = 6
						then 'Illustrious Grand Master Scribe'
						when TrainerId = 10 -- ?
						then 'Illustrious Grand Master Fishing'
						when TrainerId = 12
						then 'Horde Portal Trainer'
						when TrainerId = 27
						then 'Illustrious Grand Master Blacksmith'
						when TrainerId = 29
						then 'Illustrious Grand Master Jewelcrafter'
						when TrainerId = 31
						then 'Apprentice Fishing'
						when TrainerId = 34
						then 'Illustrious Grand Master Blacksmith'
						when TrainerId = 37
						then 'Journeyman Blacksmith'
						when TrainerId = 42
						then 'Illustrious Grand Master Tailor'
						when TrainerId = 46
						then 'Journeyman Riding'
						when TrainerId = 48
						then 'Apprentice Jewelcrafter'
						when TrainerId = 49
						then 'Illustrious Grand Master Miner'
						when TrainerId = 51
						then 'Apprentice Enchanter'
						when TrainerId = 56
						then 'Illustrious Grand Master Leatherworker'
						when TrainerId = 58
						then 'Illustrious Grand Master Blacksmith'
						when TrainerId = 59
						then 'Apprentice Alchemist'
						when TrainerId = 62
						then 'Illustrious Grand Master Enchanter'
						when TrainerId = 63
						then 'Illustrious Grand Master Scribe'
						when TrainerId = 67
						then 'Illustrious Grand Master Tailor'
						when TrainerId = 75
						then 'Illustrious Grand Master Cook'
						when TrainerId = 77
						then 'Illustrious Grand Master Tailor'
						when TrainerId = 80
						then 'Apprentice Blacksmith'
						when TrainerId = 82
						then 'Illustrious Grand Master Miner'
						when TrainerId = 83
						then 'Illustrious Grand Master Skinner'
						when TrainerId = 89
						then 'Illustrious Grand Master Herbalist'
						when TrainerId = 90
						then 'Illustrious Grand Master Skinner'
						when TrainerId = 91
						then 'Illustrious Grand Master Miner'
						when TrainerId = 101
						then 'Illustrious Grand Master Herbalist'
						when TrainerId = 102
						then 'Apprentice Engineer'
						when TrainerId = 103
						then 'Apprentice Leatherworker'
						when TrainerId = 105
						then 'Journeyman Alchemist'
						when TrainerId = 107
						then 'Illustrious Grand Master First Aid'
						when TrainerId = 114
						then 'Neutral Portal Trainer'
						when TrainerId = 117
						then 'Apprentice Tailor'
						when TrainerId = 119
						then 'Journeyman Jewelcrafter'
						when TrainerId = 122
						then 'Illustrious Grand Master Alchemist'
						when TrainerId = 123
						then 'Illustrious Grand Master Scribe'
						when TrainerId = 129
						then 'Neutral Portal Trainer'
						when TrainerId = 130
						then 'Alliance Portal Trainer'
						when TrainerId = 131
						then 'Illustrious Grand Master Enchanter'
						when TrainerId = 133
						then 'Illustrious Grand Master Herbalist'
						when TrainerId = 136
						then 'Illustrious Grand Master Cook'
						when TrainerId = 137
						then 'Flight Master'
						when TrainerId = 143
						then 'Illustrious Grand Master Leatherworker'
						when TrainerId = 144
						then 'Draenei Portal Trainer'
						when TrainerId = 148
						then 'Neutral Portal Trainer'
						when TrainerId = 149
						then 'Horde Portal Trainer'
						when TrainerId = 150
						then 'Illustrious Grand Master Jewelcrafter'
						when TrainerId = 155
						then 'Illustrious Grand Master Skinner'
						when TrainerId = 157
						then 'Journeyman Tailor'
						when TrainerId = 158
						then 'Illustrious Grand Master Fishing at the wrong level'
						when TrainerId = 159
						then 'Illustrious Grand Master First Aid'
						when TrainerId = 160
						then 'Illustrious Grand Master First Aid'
						when TrainerId = 161
						then 'Master Cook'
						when TrainerId = 163
						then 'Illustrious Grand Master Tailor'
						when TrainerId = 373
						then 'Illustrious Grand Master Archaeology'
						when TrainerId = 374
						then 'Illustrious Grand Master Herbalist'
						when TrainerId = 386
						then 'Master Riding'
						when TrainerId = 388
						then 'Apprentice Herbalist'
						when TrainerId = 389
						then 'Apprentice Miner'
						when TrainerId = 390
						then 'Apprentice Skinner'
						when TrainerId = 396
						then 'Journeyman Cook'
						when TrainerId = 405
						then 'Goblin Engineering'
						when TrainerId = 406
						then 'Gnomish Engineering'
						when TrainerId = 407
						then 'Illustrious Grand Master Engineer'
						when TrainerId = 425
						then 'Journeyman Miner'
						when TrainerId = 427
						then 'Apprentice Fishing'
			end from gossip_menu_option_trainer gmot 
			join gossip_menu_option gmo on gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex
            where gmo.OptionNpcflag = 16 and gmo.OptionType = 5 and gmo.MenuId = @Menu_Id;
			
    insert into results
    select 8, t.OptionIndex, 'OptionIndex for creature_template with trainer_class and gossip_menu_option_trainer', 
		concat('ct trainer_class: ', ct.trainer_class, ', trainer conversion:', t.description)
    from creature_template ct left join trainers t on t.MenuId = ct.gossip_menu_id where ct.entry = entryInput;
    
    insert into results
    select 9, count(*), 'creature_template records sharing same menuId', @Menu_Id from creature_template 
    where gossip_menu_id = @Menu_Id;
    
    select * from results;
    drop temporary table results;
    drop temporary table trainers;
END //
DELIMITER ;