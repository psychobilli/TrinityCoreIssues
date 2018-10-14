DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `export_account`(accountName VARCHAR(10000), 
 characterName VARCHAR(10000),
 savePath VARCHAR(10000))
BEGIN
	-- reformat accountName for a prepared statement.
	IF (INSTR(accountName,',') > 0)
    THEN
		set accountName := REPLACE(accountName,',',''',''');
	END IF;
    
    set @accountBit = 0;
    IF (LENGTH(accountName) < 1)
    THEN
		set @accountBit := 1;
	END IF;
    
    set accountName := concat('''',accountName,'''');
    
    drop table if exists accountExport;
    create table accountExport
    (id int);
    
    set @q1 := concat('
		insert into accountExport
        select id
        from realmd.account
        where userName in (',accountName,')
           or ',@accountbit,' = 1');
        
	prepare s1 from @q1;
    execute s1;
    
    -- reformat characterName for a prepared statement
	IF (INSTR(characterName,',') > 0)
    THEN
		set characterName := REPLACE(characterName,',',''',''');
	END IF;
    
    set @characterBit = 0;
    IF (LENGTH(characterName) < 1)
    THEN
		set @characterBit = 1;
	END IF;
    
    set characterName := concat('''',characterName,'''');
    
    drop table if exists characterExport;
    create table characterExport
    (guid int);
    
    set @q1 := concat('
		insert into characterExport
        select guid
        from characters.characters
        where name in (',characterName,')
           or ',@characterbit,' = 1
		  and (account in 
				(select id
                 from accountExport)
				or ',@accountbit,' = 1)');
        
	prepare s1 from @q1;
    execute s1;

	set @q1 := concat('
	SELECT `account`.`id`	,
		`account`.`username`	,
		`account`.`sha_pass_hash`	,
		`account`.`sessionkey`	,
		`account`.`v`	,
		`account`.`s`	,
		`account`.`token_key`	,
		`account`.`email`	,
		`account`.`reg_mail`	,
		`account`.`joindate`	,
		`account`.`last_ip`	,
		`account`.`last_attempt_ip`	,
		`account`.`failed_logins`	,
		`account`.`locked`	,
		`account`.`lock_country`	,
		`account`.`last_login`	,
		`account`.`online`	,
		`account`.`expansion`	,
		`account`.`mutetime`	,
		`account`.`mutereason`	,
		`account`.`muteby`	,
		`account`.`locale`	,
		`account`.`os`	,
		`account`.`recruiter`	
	FROM `realmd`.`account`
	where id in
		(select id
         from accountExport)
       or ',@accountBit,' = 1
	into outfile ''',savePath,'account.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    
	set @q1 := concat('
	SELECT `account_access`.`id`	,
		`account_access`.`gmlevel`	,
		`account_access`.`RealmID`	
	FROM `realmd`.`account_access`
    where id in
		(select id
         from accountExport)
	into outfile ''',savePath,'account_access.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    
	set @q1 := concat('
   	SELECT `realmcharacters`.`realmid`	,
		`realmcharacters`.`acctid`	,
		`realmcharacters`.`numchars`	
	FROM `realmd`.`realmcharacters`
    where acctid in
		(select id
         from accountExport)
	into outfile ''',savePath,'realmcharacters.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('
    	SELECT `account_data`.`accountId`	,
		`account_data`.`type`	,
		`account_data`.`time`	,
		`account_data`.`data`	
	FROM `characters`.`account_data`
    where accountId in
		(select id
         from accountExport)
	into outfile ''',savePath,'account_data.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `account_tutorial`.`accountId`	,
		`account_tutorial`.`tut0`	,
		`account_tutorial`.`tut1`	,
		`account_tutorial`.`tut2`	,
		`account_tutorial`.`tut3`	,
		`account_tutorial`.`tut4`	,
		`account_tutorial`.`tut5`	,
		`account_tutorial`.`tut6`	,
		`account_tutorial`.`tut7`	
	FROM `characters`.`account_tutorial`
    where accountId in
		(select id
         from accountExport)
	into outfile ''',savePath,'account_tutorial.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `characters`.`guid`	,
		`characters`.`account`	,
		`characters`.`name`	,
		`characters`.`race`	,
		`characters`.`class`	,
		`characters`.`gender`	,
		`characters`.`level`	,
		`characters`.`xp`	,
		`characters`.`money`	,
		`characters`.`skin`	,
		`characters`.`face`	,
		`characters`.`hairStyle`	,
		`characters`.`hairColor`	,
		`characters`.`facialStyle`	,
		`characters`.`bankSlots`	,
		`characters`.`restState`	,
		`characters`.`playerFlags`	,
		`characters`.`position_x`	,
		`characters`.`position_y`	,
		`characters`.`position_z`	,
		`characters`.`map`	,
		`characters`.`instance_id`	,
		`characters`.`instance_mode_mask`	,
		`characters`.`orientation`	,
		`characters`.`taximask`	,
		`characters`.`online`	,
		`characters`.`cinematic`	,
		`characters`.`totaltime`	,
		`characters`.`leveltime`	,
		`characters`.`logout_time`	,
		`characters`.`is_logout_resting`	,
		`characters`.`rest_bonus`	,
		`characters`.`resettalents_cost`	,
		`characters`.`resettalents_time`	,
		`characters`.`trans_x`	,
		`characters`.`trans_y`	,
		`characters`.`trans_z`	,
		`characters`.`trans_o`	,
		`characters`.`transguid`	,
		`characters`.`extra_flags`	,
		`characters`.`stable_slots`	,
		`characters`.`at_login`	,
		`characters`.`zone`	,
		`characters`.`death_expire_time`	,
		`characters`.`taxi_path`	,
		`characters`.`arenaPoints`	,
		`characters`.`totalHonorPoints`	,
		`characters`.`todayHonorPoints`	,
		`characters`.`yesterdayHonorPoints`	,
		`characters`.`totalKills`	,
		`characters`.`todayKills`	,
		`characters`.`yesterdayKills`	,
		`characters`.`chosenTitle`	,
		`characters`.`knownCurrencies`	,
		`characters`.`watchedFaction`	,
		`characters`.`drunk`	,
		`characters`.`health`	,
		`characters`.`power1`	,
		`characters`.`power2`	,
		`characters`.`power3`	,
		`characters`.`power4`	,
		`characters`.`power5`	,
		`characters`.`power6`	,
		`characters`.`power7`	,
		`characters`.`latency`	,
		`characters`.`talentGroupsCount`	,
		`characters`.`activeTalentGroup`	,
		`characters`.`exploredZones`	,
		`characters`.`equipmentCache`	,
		`characters`.`ammoId`	,
		`characters`.`knownTitles`	,
		`characters`.`actionBars`	,
		`characters`.`grantableLevels`	,
		`characters`.`deleteInfos_Account`	,
		`characters`.`deleteInfos_Name`	,
		`characters`.`deleteDate`	
	FROM `characters`.`characters`
    where guid in 
		(select guid
         from characterExport)
	into outfile ''',savePath,'characters.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `auctionhouse`.`id`	,
		`auctionhouse`.`houseid`	,
		`auctionhouse`.`itemguid`	,
		`auctionhouse`.`itemowner`	,	-- characters.guid
		`auctionhouse`.`buyoutprice`	,
		`auctionhouse`.`time`	,
		`auctionhouse`.`buyguid`	,
		`auctionhouse`.`lastbid`	,
		`auctionhouse`.`startbid`	,
		`auctionhouse`.`deposit`	
	FROM `characters`.`auctionhouse`
    where itemowner in
		(select guid
         from characterExport)
	into outfile ''',savePath,'auctionhouse.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_account_data`.`guid`	,	-- characters.guid
		`character_account_data`.`type`	,
		`character_account_data`.`time`	,
		`character_account_data`.`data`	
	FROM `characters`.`character_account_data`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_account_data.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_achievement`.`guid`	,
		`character_achievement`.`achievement`	,
		`character_achievement`.`date`	
	FROM `characters`.`character_achievement`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_achievement.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_achievement_progress`.`guid`	,
		`character_achievement_progress`.`criteria`	,
		`character_achievement_progress`.`counter`	,
		`character_achievement_progress`.`date`	
	FROM `characters`.`character_achievement_progress`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_achievement_progress.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_action`.`guid`	,
		`character_action`.`spec`	,
		`character_action`.`button`	,
		`character_action`.`action`	,
		`character_action`.`type`	
	FROM `characters`.`character_action`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_action.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_aura`.`guid`	,
		`character_aura`.`casterGuid`	,
		`character_aura`.`itemGuid`	,
		`character_aura`.`spell`	,
		`character_aura`.`effectMask`	,
		`character_aura`.`recalculateMask`	,
		`character_aura`.`stackCount`	,
		`character_aura`.`amount0`	,
		`character_aura`.`amount1`	,
		`character_aura`.`amount2`	,
		`character_aura`.`base_amount0`	,
		`character_aura`.`base_amount1`	,
		`character_aura`.`base_amount2`	,
		`character_aura`.`maxDuration`	,
		`character_aura`.`remainTime`	,
		`character_aura`.`remainCharges`	
	FROM `characters`.`character_aura`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_aura.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_battleground_data`.`guid`	,
		`character_battleground_data`.`instanceId`	,
		`character_battleground_data`.`team`	,
		`character_battleground_data`.`joinX`	,
		`character_battleground_data`.`joinY`	,
		`character_battleground_data`.`joinZ`	,
		`character_battleground_data`.`joinO`	,
		`character_battleground_data`.`joinMapId`	,
		`character_battleground_data`.`taxiStart`	,
		`character_battleground_data`.`taxiEnd`	,
		`character_battleground_data`.`mountSpell`	
	FROM `characters`.`character_battleground_data`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_battleground_data.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_glyphs`.`guid`	,
		`character_glyphs`.`talentGroup`	,
		`character_glyphs`.`glyph1`	,
		`character_glyphs`.`glyph2`	,
		`character_glyphs`.`glyph3`	,
		`character_glyphs`.`glyph4`	,
		`character_glyphs`.`glyph5`	,
		`character_glyphs`.`glyph6`	
	FROM `characters`.`character_glyphs`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_glyphs.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_homebind`.`guid`	,
		`character_homebind`.`mapId`	,
		`character_homebind`.`zoneId`	,
		`character_homebind`.`posX`	,
		`character_homebind`.`posY`	,
		`character_homebind`.`posZ`	
	FROM `characters`.`character_homebind`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_homebind.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_queststatus`.`guid`	,
		`character_queststatus`.`quest`	,
		`character_queststatus`.`status`	,
		`character_queststatus`.`explored`	,
		`character_queststatus`.`timer`	,
		`character_queststatus`.`mobcount1`	,
		`character_queststatus`.`mobcount2`	,
		`character_queststatus`.`mobcount3`	,
		`character_queststatus`.`mobcount4`	,
		`character_queststatus`.`itemcount1`	,
		`character_queststatus`.`itemcount2`	,
		`character_queststatus`.`itemcount3`	,
		`character_queststatus`.`itemcount4`	,
		`character_queststatus`.`playercount`	
	FROM `characters`.`character_queststatus`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_queststatus.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_queststatus_daily`.`guid`	,
		`character_queststatus_daily`.`quest`	,
		`character_queststatus_daily`.`time`	
	FROM `characters`.`character_queststatus_daily`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_queststatus_daily.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_queststatus_monthly`.`guid`	,
		`character_queststatus_monthly`.`quest`	
	FROM `characters`.`character_queststatus_monthly`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_queststatus_monthly.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_queststatus_rewarded`.`guid`	,
		`character_queststatus_rewarded`.`quest`	,
		`character_queststatus_rewarded`.`active`	
	FROM `characters`.`character_queststatus_rewarded`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_queststatus_rewarded.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_queststatus_seasonal`.`guid`	,
		`character_queststatus_seasonal`.`quest`	,
		`character_queststatus_seasonal`.`event`	
	FROM `characters`.`character_queststatus_seasonal`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_queststatus_seasonal.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_queststatus_weekly`.`guid`	,
		`character_queststatus_weekly`.`quest`	
	FROM `characters`.`character_queststatus_weekly`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_queststatus_weekly.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_reputation`.`guid`	,
		`character_reputation`.`faction`	,
		`character_reputation`.`standing`	,
		`character_reputation`.`flags`	
	FROM `characters`.`character_reputation`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_reputation.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_skills`.`guid`	,
		`character_skills`.`skill`	,
		`character_skills`.`value`	,
		`character_skills`.`max`	
	FROM `characters`.`character_skills`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_skills.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_social`.`guid`	,
		`character_social`.`friend`	,
		`character_social`.`flags`	,
		`character_social`.`note`	
	FROM `characters`.`character_social`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_social.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_spell`.`guid`	,
		`character_spell`.`spell`	,
		`character_spell`.`active`	,
		`character_spell`.`disabled`	
	FROM `characters`.`character_spell`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_spell.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_spell_cooldown`.`guid`	,
		`character_spell_cooldown`.`spell`	,
		`character_spell_cooldown`.`item`	,
		`character_spell_cooldown`.`time`	,
		`character_spell_cooldown`.`categoryId`	,
		`character_spell_cooldown`.`categoryEnd`	
	FROM `characters`.`character_spell_cooldown`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_spell_cooldown.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_talent`.`guid`	,
		`character_talent`.`spell`	,
		`character_talent`.`talentGroup`	
	FROM `characters`.`character_talent`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_talent.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `mail`.`id`	,
		`mail`.`messageType`	,
		`mail`.`stationery`	,
		`mail`.`mailTemplateId`	,
		`mail`.`sender`	,
		`mail`.`receiver`	,
		`mail`.`subject`	,
		`mail`.`body`	,
		`mail`.`has_items`	,
		`mail`.`expire_time`	,
		`mail`.`deliver_time`	,
		`mail`.`money`	,
		`mail`.`cod`	,
		`mail`.`checked`	
	FROM `characters`.`mail`
    where receiver in
		(select guid
         from characterExport)
	into outfile ''',savePath,'mail.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `mail_items`.`mail_id`	,
		`mail_items`.`item_guid`	,
		`mail_items`.`receiver`	
	FROM `characters`.`mail_items`
    where receiver in
		(select guid
         from characterExport)
	into outfile ''',savePath,'mail_items.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_pet`.`id`	,
		`character_pet`.`entry`	,
		`character_pet`.`owner`	,	-- characters.guid
		`character_pet`.`modelid`	,
		`character_pet`.`CreatedBySpell`	,
		`character_pet`.`PetType`	,
		`character_pet`.`level`	,
		`character_pet`.`exp`	,
		`character_pet`.`Reactstate`	,
		`character_pet`.`name`	,
		`character_pet`.`renamed`	,
		`character_pet`.`slot`	,
		`character_pet`.`curhealth`	,
		`character_pet`.`curmana`	,
		`character_pet`.`curhappiness`	,
		`character_pet`.`savetime`	,
		`character_pet`.`abdata`	
	FROM `characters`.`character_pet`
    where owner in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_pet.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `character_pet_declinedname`.`id`	,
		`character_pet_declinedname`.`owner`	,
		`character_pet_declinedname`.`genitive`	,
		`character_pet_declinedname`.`dative`	,
		`character_pet_declinedname`.`accusative`	,
		`character_pet_declinedname`.`instrumental`	,
		`character_pet_declinedname`.`prepositional`	
	FROM `characters`.`character_pet_declinedname`
    where owner in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_pet_declinedname.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('	
	SELECT `pet_spell`.`guid`	,
		`pet_spell`.`spell`	,
		`pet_spell`.`active`	
	FROM `characters`.`pet_spell`
    where guid in
		(select id
         from characters.character_pet
         where owner in 
         (select guid
          from characterExport))
	into outfile ''',savePath,'pet_spell.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('	
	SELECT `guild_member`.`guildid`	,
		`guild_member`.`guid`	,
		`guild_member`.`rank`	,
		`guild_member`.`pnote`	,
		`guild_member`.`offnote`	
	FROM `characters`.`guild_member`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'guild_member.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    drop table if exists guildIds;
    create table guildIds 
    (guildId int);
    
    insert into guildIds
    select guildId
    from characters.guild_member gm
    where gm.guid in
		(select guid
         from characterExport);
    
    set @q1 := concat('	
	SELECT `guild`.`guildid`	,
		`guild`.`name`	,
		`guild`.`leaderguid`	,
		`guild`.`EmblemStyle`	,
		`guild`.`EmblemColor`	,
		`guild`.`BorderStyle`	,
		`guild`.`BorderColor`	,
		`guild`.`BackgroundColor`	,
		`guild`.`info`	,
		`guild`.`motd`	,
		`guild`.`createdate`	,
		`guild`.`BankMoney`	
	FROM `characters`.`guild`
    where guildId in
		(select guildId
         from guildIds)
	into outfile ''',savePath,'guild.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('	
	SELECT `guild_bank_eventlog`.`guildid`	,
		`guild_bank_eventlog`.`LogGuid`	,
		`guild_bank_eventlog`.`TabId`	,
		`guild_bank_eventlog`.`EventType`	,
		`guild_bank_eventlog`.`PlayerGuid`	,
		`guild_bank_eventlog`.`ItemOrMoney`	,
		`guild_bank_eventlog`.`ItemStackCount`	,
		`guild_bank_eventlog`.`DestTabId`	,
		`guild_bank_eventlog`.`TimeStamp`	
	FROM `characters`.`guild_bank_eventlog`
    where guildId in
		(select guildId
         from guildIds)
	into outfile ''',savePath,'guild_bank_eventlog.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('	
	SELECT `guild_bank_right`.`guildid`	,
		`guild_bank_right`.`TabId`	,
		`guild_bank_right`.`rid`	,
		`guild_bank_right`.`gbright`	,
		`guild_bank_right`.`SlotPerDay`	
	FROM `characters`.`guild_bank_right`
    where guildId in
		(select guildId
         from guildIds)
	into outfile ''',savePath,'guild_bank_right.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('	
	SELECT `guild_bank_tab`.`guildid`	,
		`guild_bank_tab`.`TabId`	,
		`guild_bank_tab`.`TabName`	,
		`guild_bank_tab`.`TabIcon`	,
		`guild_bank_tab`.`TabText`	
	FROM `characters`.`guild_bank_tab`
    where guildId in
		(select guildId
         from guildIds)
	into outfile ''',savePath,'guild_bank_tab.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('	
	SELECT `guild_eventlog`.`guildid`	,
		`guild_eventlog`.`LogGuid`	,
		`guild_eventlog`.`EventType`	,
		`guild_eventlog`.`PlayerGuid1`	,
		`guild_eventlog`.`PlayerGuid2`	,
		`guild_eventlog`.`NewRank`	,
		`guild_eventlog`.`TimeStamp`	
	FROM `characters`.`guild_eventlog`
    where guildId in
		(select guildId
         from guildIds)
	into outfile ''',savePath,'guild_eventlog.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('	
	SELECT `guild_rank`.`guildid`	,
		`guild_rank`.`rid`	,
		`guild_rank`.`rname`	,
		`guild_rank`.`rights`	,
		`guild_rank`.`BankMoneyPerDay`	
	FROM `characters`.`guild_rank`
    where guildId in
		(select guildId
         from guildIds)
	into outfile ''',savePath,'guild_rank.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('	
	SELECT `guild_bank_item`.`guildid`	,
		`guild_bank_item`.`TabId`	,
		`guild_bank_item`.`SlotId`	,
		`guild_bank_item`.`item_guid`	
	FROM `characters`.`guild_bank_item`
    where guildId in
		(select guildId
         from guildIds)
	into outfile ''',savePath,'guild_bank_item.txt''');
        
	prepare s1 from @q1;
    execute s1;	
    
    set @q1 := concat('		
	SELECT `character_inventory`.`guid`	,
		`character_inventory`.`bag`	,
		`character_inventory`.`slot`	,
		`character_inventory`.`item`	
	FROM `characters`.`character_inventory`
    where guid in
		(select guid
         from characterExport)
	into outfile ''',savePath,'character_inventory.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    set @q1 := concat('		
	SELECT `item_instance`.`guid`	,
		`item_instance`.`itemEntry`	,
		`item_instance`.`owner_guid`	,
		`item_instance`.`creatorGuid`	,
		`item_instance`.`giftCreatorGuid`	,
		`item_instance`.`count`	,
		`item_instance`.`duration`	,
		`item_instance`.`charges`	,
		`item_instance`.`flags`	,
		`item_instance`.`enchantments`	,
		`item_instance`.`randomPropertyId`	,
		`item_instance`.`durability`	,
		`item_instance`.`playedTime`	,
		`item_instance`.`text`	
	FROM `characters`.`item_instance`
    where (owner_guid in
		(select guid
         from characterExport))
	   or guid in
		(select item_guid
         from characters.guild_bank_item
         where guildId in
			(select guildId
             from guildIds))
	into outfile ''',savePath,'item_instance.txt''');
        
	prepare s1 from @q1;
    execute s1;
    
    drop table if exists accountExport;
    drop table if exists characterExport;
    drop table if exists guildIds;
    
END$$
DELIMITER ;
