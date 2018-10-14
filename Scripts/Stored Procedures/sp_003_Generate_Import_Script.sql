DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_import_script`(loadPath VARCHAR(10000)
	, savePath VARCHAR(1000))
BEGIN
	set @schemaN := 'auth';
    set @tableN := 'account';
	set @q1 := concat('call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'account_access';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'realmcharacters';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
	set @schemaN := 'characters';
    set @tableN := 'account_data';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'account_tutorial';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'characters';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'auctionhouse';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_account_data';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_achievement';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_achievement_progress';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_action';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_aura';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_battleground_data';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_glyphs';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_homebind';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_queststatus';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_queststatus_daily';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_queststatus_monthly';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_queststatus_rewarded';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_queststatus_seasonal';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_queststatus_weekly';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_reputation';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_skills';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_social';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_spell';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_spell_cooldown';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_talent';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'mail';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'mail_items';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_inventory';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'item_instance';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_pet';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'character_pet_declinedname';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'pet_spell';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild_member';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild_bank_eventlog';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild_bank_item';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild_bank_right';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild_bank_tab';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild_eventlog';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');
    
    set @tableN := 'guild_rank';
	set @q1 := concat(@q1,'call create_dupp_table(''',@schemaN,''',''',@tableN,''',''Temp'');');
    
    set @q1 := concat(@q1,'LOAD DATA LOCAL INFILE ''',loadPath,@tableN,'.txt'' INTO TABLE ',@schemaN,'.',@tableN,'Temp;');

	set @q1 := REPLACE(@q1,'''','''''');
	set @q1 := concat('select ''',@q1,''' into outfile ''',savePath,'importScript.sql''');
    prepare s1 from @q1;
    execute s1;
    
    select concat('File saved to: ',savePath,'importScript.sql');
END$$
DELIMITER ;
