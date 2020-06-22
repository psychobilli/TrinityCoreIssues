DROP PROCEDURE IF EXISTS validate_creature_template_entry_trainer;
DELIMITER //
CREATE PROCEDURE validate_creature_template_entry_trainer(IN entryInput int)
BEGIN

	create temporary table results
    (item double, keyfield int, message text, details text);
    
    insert into results
    select 1, ct.entry, 'creature_template results', concat(ct.name, ' gossip_menu_id ', ct.gossip_menu_id) from creature_template ct
    where ct.entry = entryInput;
    
    insert into results
    select 2, ct.entry, 'creature_template npcFlag and flag test', concat(ct.npcFlag, ', test: ', case when (npcFlag >> 4) % 2 = 1 then 'true' else 'false' end) from creature_template ct
    where ct.entry = entryInput;
    
    insert into results
    select 3, ct.entry, 'creature_template trainer with trainer_class value', case when ct.trainer_class > 0 then 'true' else 'false' end 
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
    select 5, count(*), 'gossip_menu_option count', @Menu_Id as details from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id;
    
    insert into results
    select 5.5, gmo.MenuId, 'gossip_menu_option conditions', c.Comment from gossip_menu_option gmo
    join conditions c on c.SourceGroup = gmo.MenuId and c.SourceEntry = gmo.OptionIndex
    where c.SourceTypeOrReferenceId = 15 and gmo.MenuId = @Menu_Id;
    
    insert into results
    select 6, count(*), 'gossip_menu_option count with OptionType 5 and OptionNpcFlag 16 at OptionIndex', OptionIndex from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id and gmo.OptionType = 5 and gmo.OptionNpcflag = 16 group by OptionIndex;
    
    insert into results
    select 6, count(*), 'gossip_menu_option count with OptionIcon 3 and incorrect Tyoe or Flag', concat('OptionIndex: ', OptionIndex, ', OptionType: ', OptionType, ', OptionNpcFlag: ', OptionNpcFlag) from gossip_menu_option gmo 
    where gmo.MenuId = @Menu_Id and OptionIcon = 3 and (gmo.OptionType != 5 or gmo.OptionNpcflag != 16) group by OptionIndex;
    
    insert into results
    select 7, count(*), 'gossip_menu_option_trainer with OptionType 5 and OptionNpcFlag 16 at OptionIndex', concat('OptionIndex: ', gmo.OptionIndex, ', OptionType: ', OptionType, ', OptionNpcFlag: ', OptionNpcFlag)
    from gossip_menu_option_trainer gmot join gossip_menu_option gmo on gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex
    where gmo.OptionType = 5 and gmo.OptionNpcflag = 16 and gmo.MenuId = @Menu_Id group by gmo.OptionIndex;
    
    insert into results
    select 7, count(*), 'gossip_menu_option_trainer with OptionIcon 3 and incorrect Tyoe or Flag', gmo.OptionIndex 
    from gossip_menu_option_trainer gmot join gossip_menu_option gmo on gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex
    where gmo.MenuId = @Menu_Id and OptionIcon = 3 and (gmo.OptionType != 5 or gmo.OptionNpcflag != 16) group by OptionIndex;
    
    set @trainer := (select trainerId from gossip_menu_option_trainer gmot 
			join gossip_menu_option gmo on gmo.MenuId = gmot.MenuId and gmo.OptionIndex = gmot.OptionIndex
            where gmo.OptionNpcflag = 16 and gmo.OptionType = 5 and gmo.MenuId = @Menu_Id);
	set @class := case when @trainer in (16, 145)
					   then 1
                       when @trainer in (164, 168)
                       then 2
                       when @trainer in (15, 40)
                       then 3
                       when @trainer in (17, 33)
                       then 4
                       when @trainer in (3, 127)
                       then 5
                       when @trainer in (124, 134)
                       then 7
                       when @trainer in (44, 135)
                       then 8
                       when @trainer in (32, 154)
                       then 9
                       when @trainer in (39, 50)
                       then 11
                       else 0
			end;
	set @lowlevel := case when @trainer in (145, 168, 15, 17, 127, 134, 44, 32, 50)
						then 'low level'
                        else ''
			end;
    insert into results
    select 8, count(*), 'creature_template with trainer_class and gossip_menu_option_trainer', 
		concat('ct trainer_class: ', ct.trainer_class, ', trainer conversion:', @class, ' ', @lowlevel)
    from creature_template ct where ct.entry = entryInput;
    
    insert into results
    select 9, count(*), 'creature_template records sharing same menuId', @Menu_Id from creature_template where gossip_menu_id = @Menu_Id;
    
    select * from results;
    drop temporary table results;
END //
DELIMITER ;