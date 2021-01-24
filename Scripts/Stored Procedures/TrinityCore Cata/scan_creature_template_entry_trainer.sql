DROP PROCEDURE IF EXISTS scan_creature_template_entry_trainer;
DELIMITER //
CREATE PROCEDURE scan_creature_template_entry_trainer(IN entryInput int)
BEGIN

	create temporary table if not exists results
    (test char(10), item int, keyfield int, message text, details text);
    
    insert into results
    select 'passed', 1, ct.entry, 'creature_template results', concat(ct.name, ' gossip_menu_id ', ct.gossip_menu_id) from creature_template ct
    where ct.entry = entryInput;
	
	insert into results
	select 'passed', 1, entryInput, 'creature world location results', concat('rowCount: ',count(c.guid)) from creature c where c.id = entryInput;
	
	insert into results
	select 'failed', 1, entryInput, 'creature not in world.', entryInput from creature_template ct 
	where ct.entry = entryInput and not exists (select 1 from creature where id = ct.entry);
	
	insert into results
	select 'passed', 2, entryInput, 'creature_trainer records for creature with trainer', concat('rowCount: ', count(*))
	from creature_template ct join creature_trainer ctr on ctr.CreatureId = ct.entry where ct.entry = entryInput;
    
	insert into results
	select 'failed', 2, 0, 'missing creature_trainer record', concat('entry: ', entryInput) from creature_template ct
	where not exists (select 1 from creature_trainer where CreatureId = ct.entry) and ct.entry = entryInput;
	
    insert into results
    select 'passed', 3, ct.entry, 'creature_template npcFlag and flag test', concat(ct.npcFlag, ', test: passed') from creature_template ct join creature_trainer ctr on ctr.CreatureId = ct.entry
    where ct.entry = entryInput and gossip_menu_id > 0 and (npcFlag & 1) > case when trainer_type = 1 then -1 else 0 end
	  and (npcFlag & 16) > 0 and case when trainer_type in (0,3) then (npcFlag & 32) when trainer_type = 2 then (npcFlag & 64) else 1 end > 0;
    
    insert into results
    select 'passed', 3, ct.entry, 'creature_template npcFlag and flag test', concat(ct.npcFlag, ', test: passed') from creature_template ct join creature_trainer ctr on ctr.CreatureId = ct.entry
    where ct.entry = entryInput and gossip_menu_id = 0 and (ctr.OptionIndex = 0 and (npcFlag & 1) = 0 or ctr.OptionIndex > 0 and (npcFlag & 1) = 1) and (npcFlag & 16) > 0 
	  and case when trainer_type in (0,3) then (npcFlag & 32) when trainer_type = 2 then (npcFlag & 64) else 1 end > 0;
    
    insert into results
    select 'failed', 3, ct.entry, 'missing gossip flag (1) from creature_template npcFlag', concat(ct.npcFlag, ', test: failed') from creature_template ct
    where ct.entry = entryInput and (npcFlag & 1) = 0 and trainer_type != 1 and gossip_menu_id > 0;
	
    insert into results
    select 'failed', 3, ct.entry, 'npcFlag 1 is present, default gossip menu (0) requires OptionIndex 3 in creature_trainer', concat('npcFlag: ', ct.npcFlag, ', OptionIndex: ',ctr.OptionIndex) from creature_template ct join creature_trainer ctr on ctr.CreatureId = ct.entry
    where ct.entry = entryInput and ctr.OptionIndex = 0 and (npcFlag & 1) = 1 and gossip_menu_id = 0;
	
    insert into results
    select 'failed', 3, ct.entry, 'npcFlag 1 is missing, default gossip menu (0) requires OptionIndex 0 in creature_trainer', concat('npcFlag: ', ct.npcFlag, ', OptionIndex: ',ctr.OptionIndex) from creature_template ct join creature_trainer ctr on ctr.CreatureId = ct.entry
    where ct.entry = entryInput and ctr.OptionIndex > 0 and (npcFlag & 1) = 0 and gossip_menu_id = 0;
    
    insert into results
    select 'failed', 3, ct.entry, 'missing trainer flag (16) from creature_template npcFlag', concat(ct.npcFlag, ', test: failed') from creature_template ct
    where ct.entry = entryInput and (npcFlag & 16) = 0;
    
    insert into results
    select 'failed', 3, ct.entry, 'missing class or profession trainer flag (32,64) from creature_template npcFlag', concat(ct.npcFlag, ', test: failed') from creature_template ct
    where ct.entry = entryInput and case when trainer_type in (0,3) then (npcFlag & 32) when trainer_type = 2 then (npcFlag & 64) else 1 end = 0;
    
    insert into results
    select 'passed', 4, ct.entry, 'creature_template trainer with trainer_type value', 
    case when ct.trainer_type = 0 then 'class trainer' when ct.trainer_type = 1 then 'mount trainer' when ct.trainer_type = 2 then 'profession trainer' else 'pet trainer' end 
    from creature_template ct where ct.entry = entryInput and (trainer_type in (0,3) and (npcFlag & 32) > 0 or trainer_type = 2 and (npcFlag & 64) > 0);
    
    insert into results
    select 'failed', 4, ct.entry, 'class and pet trainers require flags 16 and 32', concat('trainer_type: ',trainer_type,', npcFlag: ',npcFlag)
    from creature_template ct where ct.entry = entryInput and trainer_type in (0,3) and ((npcFlag & 16) = 0 or (npcFlag & 32) = 0);
	
    insert into results
    select 'failed', 4, ct.entry, 'profession trainers require flags 16 and 64', concat('trainer_type: ',trainer_type,', npcFlag: ',npcFlag)
    from creature_template ct where ct.entry = entryInput and trainer_type = 2 and ((npcFlag & 16) = 0 or (npcFlag & 64) = 0);
	
    insert into results
    select 'failed', 4, ct.entry, 'trainers with gossip_menu_id 0 require flag 16', concat('trainer_type: ',trainer_type,', npcFlag: ',npcFlag)
    from creature_template ct where ct.entry = entryInput and gossip_menu_id = 0 and trainer_class = 1 and (npcFlag & 16) = 0;
	
	insert into results
	select 'failed', 4, ct.entry, 'class trainers must have a valid trainer_class set', concat('trainer_type: ',trainer_type,', trainer_class: ',trainer_class)
	from creature_template ct where ct.entry = entryInput and trainer_type in (0,3) and trainer_class not in (1,2,3,4,5,6,7,8,9,10,11);
	
	insert into results
	select 'passed', 5, ct.entry, 'creature_template.gossip_menu_id and creature_trainer.MenuId match', concat(ct.gossip_menu_id,' - ',ctr.MenuId)
	from creature_template ct join creature_trainer ctr on ctr.CreatureId = ct.entry where ct.entry = entryInput and ctr.MenuId = ct.gossip_menu_id;
	
	insert into results
	select 'failed', 5, ct.entry, 'creature_template.gossip_menu_id and creature_trainer.MenuId do not match', concat(ct.gossip_menu_id,' - ',ctr.MenuId)
	from creature_template ct join creature_trainer ctr on ctr.CreatureId = ct.entry where ct.entry = entryInput and ctr.MenuId != ct.gossip_menu_id;
    
	-- get gossip_menu_id for creature
    set @Menu_Id := (select gossip_menu_id from creature_template ct where ct.entry = entryInput);
    
    insert into results
    select 'passed', 6, gm.MenuId, 'gossip_menu for gossip_menu_id', nt.text0_0 
	from gossip_menu gm join npc_text nt on nt.Id = gm.TextId where gm.MenuID = @Menu_id;
	
	insert into results
	select 'failed', 6, gm.MenuId, 'gossip_menu missing npc_text', 'no data'
	from gossip_menu gm where gm.MenuId = @Menu_id and not exists (select 1 from npc_text where Id = gm.TextId);
    
    insert into results
    select 'passed', 6, gm.MenuId, 'gossip_menu conditions', c.Comment from gossip_menu gm 
    join conditions c on c.SourceGroup = gm.MenuID and c.SourceEntry = gm.TextId
    where c.SourceTypeOrReferenceId = 14 and gm.MenuId = @Menu_Id;
    
    insert into results
    select 'passed', 7, @Menu_Id, 'gossip_menu_option records with MenuId ', concat('record count ', count(*)) as details from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id;
    
    insert into results
    select 'passed', 7, gmo.MenuId, 'gossip_menu_option conditions', c.Comment from gossip_menu_option gmo
    join conditions c on c.SourceGroup = gmo.MenuId and c.SourceEntry = gmo.OptionIndex
    where c.SourceTypeOrReferenceId = 15 and gmo.MenuId = @Menu_Id;
    
	insert into results
	select 'failed', 7, @Menu_Id, 'missing gossip_menu_options',concat('CreatureId: ',ct.entry) from creature_template ct left join gossip_menu_option gmo on gmo.MenuId = ct.gossip_menu_id
	where ct.entry = entryInput and gmo.MenuId is null;
    
    insert into results
    select 'passed', 8, @Menu_Id, 'gossip_menu_option records with OptionType 5 and OptionNpcFlag 16 at OptionIndex', concat('OptionIndex: ',OptionIndex,', record count: ',count(*))
	from gossip_menu_option gmo where gmo.MenuId = @Menu_Id and gmo.OptionType = 5 and gmo.OptionNpcflag = 16 group by OptionIndex;
    
    insert into results
    select 'failed', 8, count(*), 'incorrect Tyoe or Flag on gossip_menu_option records with OptionIcon 3', concat('OptionIndex: ', OptionIndex, ', OptionType: ', OptionType, ', OptionNpcFlag: ', OptionNpcFlag) from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id and OptionIcon = 3 and (gmo.OptionType != 5 or gmo.OptionNpcflag != 16) group by OptionIndex;
	
    insert into results
    select 'passed', 9, count(*), 'creature_trainer records with OptionType 5 and OptionNpcFlag 16 at OptionIndex', concat('OptionIndex: ', gmo.OptionIndex, ', OptionType: ', OptionType, ', OptionNpcFlag: ', OptionNpcFlag)
    from creature_trainer ctr join gossip_menu_option gmo on gmo.MenuId = ctr.MenuId and gmo.OptionIndex = ctr.OptionIndex
    where gmo.OptionType = 5 and gmo.OptionNpcflag = 16 and gmo.MenuId = @Menu_Id and @Menu_Id != 0 group by gmo.OptionIndex;
    
	insert into results
	select 'passed', 9, count(*), 'creature_trainer records with OptionType 5 and OptionNpcFlag 16 at OptionIndex', concat('OptionIndex: ', gmo.OptionIndex, ', OptionType: ', OptionType, ', OptionNpcFlag: ', OptionNpcFlag)
    from creature_trainer ctr join gossip_menu_option gmo on gmo.MenuId = ctr.MenuId and gmo.OptionIndex = ctr.OptionIndex
    where gmo.OptionType = 5 and gmo.OptionNpcflag = 16 and gmo.MenuId = @Menu_Id and @Menu_Id = 0 and ctr.OptionIndex in (0,3) group by gmo.OptionIndex;
	
    insert into results
    select 'failed', 9, count(*), 'incorrect Type or Flag on creature_trainer records with OptionIcon 3', gmo.OptionIndex 
    from creature_trainer ctr join gossip_menu_option gmo on gmo.MenuId = ctr.MenuId and gmo.OptionIndex = ctr.OptionIndex
    where ctr.MenuId = @Menu_Id and OptionIcon = 3 and not exists (select 1 from gossip_menu_option sub 
	where sub.MenuId = gmo.MenuId and sub.OptionType = 5 and sub.OptionNpcflag = 16) group by OptionIndex;
    
    insert into results
    select 'failed', 9, count(*), 'incorrect OptionIndex between creature_trainer and gossip_menu_option records with OptionIcon 3', 
	concat('creature_trainer - gossip_menu_option: ',ctr.OptionIndex,' - ',gmo.OptionIndex)
    from creature_trainer ctr join gossip_menu_option gmo on gmo.MenuId = ctr.MenuId
    where ctr.CreatureId = entryInput and gmo.MenuId = @Menu_Id and OptionIcon = 3 and gmo.OptionIndex != ctr.OptionIndex
	  and not exists (select 1 from gossip_menu_option where MenuId = ctr.MenuId and OptionIndex = ctr.OptionIndex)
	group by gmo.OptionIndex;
	
    insert into results
	select 'failed', 9, count(*), 'default gossip_menu_id (0) must use OptionIndex 3 or 0', 
	concat('creature_trainer - gossip_menu_option: ',ctr.OptionIndex,' - ',gmo.OptionIndex)
    from creature_trainer ctr join gossip_menu_option gmo on gmo.MenuId = ctr.MenuId and gmo.OptionIndex = ctr.OptionIndex
    where ctr.CreatureId = entryInput and gmo.MenuId = @Menu_Id and @Menu_Id = 0 and ctr.OptionIndex not in (0,3)
	group by gmo.OptionIndex;
	
    create temporary table trainers (MenuId int, trainerId int, optionIndex int, description text);
    
    insert into trainers (MenuId, trainerId, OptionIndex, description)
    select ctr.MenuId, ctr.trainerId, ctr.OptionIndex, case when ctr.trainerId in (16)
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
			end from creature_trainer ctr
			where ctr.CreatureID = entryInput;
			
    insert into results
    select 'passed', 10, t.OptionIndex, 'OptionIndex for creature_template with trainer_class and creature_trainer', 
		concat('ct trainer_class: ', ct.trainer_class, ', trainer conversion:', t.description)
    from creature_template ct left join trainers t on t.MenuId = ct.gossip_menu_id where ct.entry = entryInput;
    
    insert into results
    select 'passed', 11, count(*), 'creature_template records sharing same menuId', @Menu_Id from creature_template 
    where gossip_menu_id = @Menu_Id;
    
    drop temporary table trainers;
END //
DELIMITER ;