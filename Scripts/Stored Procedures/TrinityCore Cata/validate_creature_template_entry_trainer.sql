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
    
    set @trainer := (select trainerId from gossip_menu_option_trainer gmot 
			join gossip_menu_option gmo on gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex
            where gmo.OptionNpcflag = 16 and gmo.OptionType = 5 and gmo.MenuId = @Menu_Id);
	set @class := case when @trainer in (16, 145)
					   then '(1) warrior'
                       when @trainer in (164, 168)
                       then '(2) paladin'
                       when @trainer in (15, 40)
                       then '(3) hunter'
                       when @trainer in (17, 33)
                       then '(4) rogue'
                       when @trainer in (3, 127)
                       then '(5) priest'
					   when @trainer in (55)
					   then '(6) death knight'
                       when @trainer in (124, 134)
                       then '(7) shaman'
                       when @trainer in (44, 135)
                       then '(8) mage'
                       when @trainer in (32, 154)
                       then '(9) warlock'
                       when @trainer in (39, 50)
                       then '(11) druid'
                       else 0
			end;
	set @lowlevel := case when @trainer in (145, 168, 15, 17, 127, 134, 44, 32, 50)
						then 'low level'
                        else ''
			end;
	set @profession := case when @trainer = 2
                            then 'Illustrious Grand Master Jewelcrafter'
							when @trainer = 6
                            then 'Illustrious Grand Master Scribe'
							when @trainer = 10 -- ?
                            then 'Illustrious Grand Master Fishing'
							when @trainer = 12
                            then 'Horde Portal Trainer'
							when @trainer = 27
                            then 'Illustrious Grand Master Blacksmith'
							when @trainer = 29
                            then 'Illustrious Grand Master Jewelcrafter'
							when @trainer = 31
                            then 'Apprentice Fishing'
							when @trainer = 34
                            then 'Illustrious Grand Master Blacksmith'
							when @trainer = 37
                            then 'Journeyman Blacksmith'
							when @trainer = 42
                            then 'Illustrious Grand Master Tailor'
                            when @trainer = 46
                            then 'Journeyman Riding'
							when @trainer = 48
                            then 'Apprentice Jewelcrafter'
							when @trainer = 49
                            then 'Illustrious Grand Master Miner'
							when @trainer = 51
                            then 'Apprentice Enchanter'
							when @trainer = 56
                            then 'Illustrious Grand Master Leatherworker'
							when @trainer = 58
                            then 'Illustrious Grand Master Blacksmith'
							when @trainer = 59
                            then 'Apprentice Alchemist'
							when @trainer = 62
                            then 'Illustrious Grand Master Enchanter'
							when @trainer = 63
                            then 'Illustrious Grand Master Scribe'
							when @trainer = 67
                            then 'Illustrious Grand Master Tailor'
							when @trainer = 75
                            then 'Illustrious Grand Master Cook'
							when @trainer = 77
                            then 'Illustrious Grand Master Tailor'
							when @trainer = 80
                            then 'Apprentice Blacksmith'
							when @trainer = 82
                            then 'Illustrious Grand Master Miner'
							when @trainer = 83
                            then 'Illustrious Grand Master Skinner'
							when @trainer = 89
                            then 'Illustrious Grand Master Herbalist'
							when @trainer = 90
                            then 'Illustrious Grand Master Skinner'
							when @trainer = 91
                            then 'Illustrious Grand Master Miner'
							when @trainer = 101
                            then 'Illustrious Grand Master Herbalist'
							when @trainer = 102
                            then 'Apprentice Engineer'
							when @trainer = 103
                            then 'Apprentice Leatherworker'
							when @trainer = 105
                            then 'Journeyman Alchemist'
							when @trainer = 107
                            then 'Illustrious Grand Master First Aid'
							when @trainer = 114
                            then 'Neutral Portal Trainer'
							when @trainer = 117
                            then 'Apprentice Tailor'
							when @trainer = 119
                            then 'Journeyman Jewelcrafter'
							when @trainer = 122
                            then 'Illustrious Grand Master Alchemist'
							when @trainer = 123
                            then 'Illustrious Grand Master Scribe'
							when @trainer = 129
                            then 'Neutral Portal Trainer'
							when @trainer = 130
                            then 'Alliance Portal Trainer'
							when @trainer = 131
                            then 'Illustrious Grand Master Enchanter'
							when @trainer = 133
                            then 'Illustrious Grand Master Herbalist'
							when @trainer = 136
                            then 'Illustrious Grand Master Cook'
							when @trainer = 137
                            then 'Flight Master'
							when @trainer = 143
                            then 'Illustrious Grand Master Leatherworker'
							when @trainer = 144
                            then 'Draenei Portal Trainer'
							when @trainer = 148
                            then 'Neutral Portal Trainer'
							when @trainer = 149
                            then 'Horde Portal Trainer'
							when @trainer = 150
                            then 'Illustrious Grand Master Jewelcrafter'
							when @trainer = 155
                            then 'Illustrious Grand Master Skinner'
							when @trainer = 157
                            then 'Journeyman Tailor'
							when @trainer = 158
                            then 'Illustrious Grand Master Fishing at the wrong level'
							when @trainer = 159
                            then 'Illustrious Grand Master First Aid'
							when @trainer = 160
                            then 'Illustrious Grand Master First Aid'
							when @trainer = 161
                            then 'Master Cook'
							when @trainer = 163
                            then 'Illustrious Grand Master Tailor'
							when @trainer = 373
                            then 'Illustrious Grand Master Archaeology'
							when @trainer = 374
                            then 'Illustrious Grand Master Herbalist'
							when @trainer = 386
                            then 'Master Riding'
                            when @trainer = 388
                            then 'Apprentice Herbalist'
							when @trainer = 389
                            then 'Apprentice Miner'
							when @trainer = 390
							then 'Apprentice Skinner'
							when @trainer = 396
                            then 'Journeyman Cook'
							when @trainer = 405
                            then 'Goblin Engineering'
							when @trainer = 406
                            then 'Gnomish Engineering'
							when @trainer = 407
                            then 'Illustrious Grand Master Engineer'
							when @trainer = 425
                            then 'Journeyman Miner'
                            when @trainer = 427
                            then 'Apprentice Fishing'
                            else 0
			end;
			
    insert into results
    select 8, count(*), 'creature_template with trainer_class and gossip_menu_option_trainer', 
		concat('ct trainer_class: ', ct.trainer_class, ', trainer conversion:', @class, ' ', @lowlevel)
    from creature_template ct where ct.entry = entryInput;
	
    insert into results
    select 8, count(*), 'creature_template with profession type on gossip_menu_option_trainer', 
 		concat('ct trainer_class: ', ct.trainer_class, ', profession:', @profession)
    from creature_template ct where ct.entry = entryInput;
    
    insert into results
    select 9, count(*), 'creature_template records sharing same menuId', @Menu_Id from creature_template where gossip_menu_id = @Menu_Id;
    
    select * from results;
    drop temporary table results;
END //
DELIMITER ;