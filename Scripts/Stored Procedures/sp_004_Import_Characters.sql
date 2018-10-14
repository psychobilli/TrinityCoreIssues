DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `import_characters`(realmName varchar(200))
BEGIN
	
    drop table if exists importLog;
    create table importLog
    (logNote text);
    
    insert into importLog
    values ('This table, `importLog`, is deleted at the end of each import unless errors occur.');
    
	set @realmID := (select id from auth.realmlist where name = realmName);
    drop table if exists account_id_map;
    
    drop table if exists account_id_map;
	create table account_id_map
    (oldId int, newId int, username varchar(200));
    
    insert into account_id_map
    (oldId, username)
    select id
		, username
	from auth.accountTemp;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from accountTemp.')
    from auth.accountTemp;
    
    insert into importLog
    select concat(count(*), ' records in account before insert.')
    from auth.account;
    
	insert into auth.account
    (`username`	,
		`sha_pass_hash`	,
		`sessionkey`	,
		`v`	,
		`s`	,
		`token_key`	,
		`email`	,
		`reg_mail`	,
		`joindate`	,
		`last_ip`	,
		`last_attempt_ip`	,
		`failed_logins`	,
		`locked`	,
		`lock_country`	,
		`last_login`	,
		`online`	,
		`expansion`	,
		`mutetime`	,
		`mutereason`	,
		`muteby`	,
		`locale`	,
		`os`	,
		`recruiter`)
    SELECT `username`	,
		`sha_pass_hash`	,
		`sessionkey`	,
		`v`	,
		`s`	,
		`token_key`	,
		`email`	,
		`reg_mail`	,
		`joindate`	,
		`last_ip`	,
		`last_attempt_ip`	,
		`failed_logins`	,
		`locked`	,
		`lock_country`	,
		`last_login`	,
		`online`	,
		`expansion`	,
		`mutetime`	,
		`mutereason`	,
		`muteby`	,
		`locale`	,
		`os`	,
		`recruiter`	
	FROM `auth`.`accountTemp`
    where username not in
		(select username
         from auth.account);
    
    update account_id_map aim
      join auth.account a on a.username = aim.username
    set aim.newId = a.id;
    
    insert into importLog
    select concat(count(*), ' records in account after insert.')
    from auth.account;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from account_accessTemp')
    from auth.account_accessTemp;
    
    insert into importLog
    select concat(count(*), ' records in account_access before insert.')
    from auth.account_access;
    
    insert into auth.account_access
    SELECT aim.newId	,
		`gmlevel`	,
		@realmId	
	FROM `auth`.`account_accessTemp` aaT
      join account_id_map aim on aim.oldId = aaT.id
	where not exists
		(select 1
         from auth.account_access aa
         where aa.id = aim.newId
		   and realmId = @realmId);

    insert into importLog
    select concat(count(*), ' records in account_access after insert.')
    from auth.account_access;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from realmCharactersTemp')
    from auth.realmCharactersTemp;
    
    insert into importLog
    select concat(count(*), ' records in realmCharacters before insert.')
    from auth.realmCharacters;
             
	insert into auth.realmcharacters
	SELECT @realmId	, 
		aim.newId	,
		`numchars`
	FROM `auth`.`realmcharactersTemp` rcT
      join account_id_map aim on aim.oldId = rcT.acctId
	where not exists
		(select 1
         from auth.realmcharacters rc
         where realmId = @realmId
           and rc.acctid = aim.newId);
	
    insert into importLog
    select concat(count(*), ' records in realmCharacters after insert.')
    from auth.realmCharacters;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from account_dataTemp')
    from characters.account_dataTemp;
    
    insert into importLog
    select concat(count(*), ' records in account_data before insert.')
    from characters.account_data;
    
    insert into characters.account_data
	SELECT aim.newId	,
		`type`	,
		`time`	,
		`data`	
	FROM `characters`.`account_dataTemp` adT
      join account_id_map aim on aim.oldId = adT.accountId
	where not exists
		(select 1
         from characters.account_data ad
         where ad.accountId = aim.newId
           and type = adT.type);
           
    insert into importLog
    select concat(count(*), ' records in account_data after insert.')
    from characters.account_data;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from account_tutorialTemp')
    from characters.account_tutorialTemp;
    
    insert into importLog
    select concat(count(*), ' records in account_tutorial before insert.')
    from characters.account_tutorial;
           
	insert into characters.account_tutorial
	SELECT aim.newId	,
		`tut0`	,
		`tut1`	,
		`tut2`	,
		`tut3`	,
		`tut4`	,
		`tut5`	,
		`tut6`	,
		`tut7`	
	FROM `characters`.`account_tutorialTemp` atT
      join account_id_map aim on aim.oldId = atT.accountId
	where not exists
		(select 1
         from characters.account_tutorial atu
         where atu.accountid = aim.newId);	

    insert into importLog
    select concat(count(*), ' records in account_tutorial after insert.')
    from characters.account_tutorial;
         
	drop table if exists character_id_map;
	create table character_id_map
    (oldId int, newId int, charname varchar(200));
    
    insert into character_id_map
    (oldId, charname)
    select guid
		, name
	from characters.charactersTemp;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from charactersTemp')
    from characters.charactersTemp;
    
    insert into importLog
    select concat(count(*), ' records in characters before insert.')
    from characters.characters;

	set @row_count = (select ifnull(max(guid),0) from characters.characters);
	
    insert into characters.characters
    SELECT (@row_count := @row_count + 1),
		aim.newId	,
		`name`	,
		`race`	,
		`class`	,
		`gender`	,
		`level`	,
		`xp`	,
		`money`	,
		`skin`	,
		`face`	,
		`hairStyle`	,
		`hairColor`	,
		`facialStyle`	,
		`bankSlots`	,
		`restState`	,
		`playerFlags`	,
		`position_x`	,
		`position_y`	,
		`position_z`	,
		`map`	,
		`instance_id`	,
		`instance_mode_mask`	,
		`orientation`	,
		`taximask`	,
		`online`	,
		`cinematic`	,
		`totaltime`	,
		`leveltime`	,
		`logout_time`	,
		`is_logout_resting`	,
		`rest_bonus`	,
		`resettalents_cost`	,
		`resettalents_time`	,
		`trans_x`	,
		`trans_y`	,
		`trans_z`	,
		`trans_o`	,
		`transguid`	,
		`extra_flags`	,
		`stable_slots`	,
		`at_login`	,
		`zone`	,
		`death_expire_time`	,
		`taxi_path`	,
		`arenaPoints`	,
		`totalHonorPoints`	,
		`todayHonorPoints`	,
		`yesterdayHonorPoints`	,
		`totalKills`	,
		`todayKills`	,
		`yesterdayKills`	,
		`chosenTitle`	,
		`knownCurrencies`	,
		`watchedFaction`	,
		`drunk`	,
		`health`	,
		`power1`	,
		`power2`	,
		`power3`	,
		`power4`	,
		`power5`	,
		`power6`	,
		`power7`	,
		`latency`	,
		`talentGroupsCount`	,
		`activeTalentGroup`	,
		`exploredZones`	,
		`equipmentCache`	,
		`ammoId`	,
		`knownTitles`	,
		`actionBars`	,
		`grantableLevels`	,
		`deleteInfos_Account`	,
		`deleteInfos_Name`	,
		`deleteDate`	
	FROM `characters`.`charactersTemp` cT
      join account_id_map aim on aim.oldId = cT.account
	where not exists
		(select 1
         from characters.characters
         where name = cT.name);	
    
    update character_id_map cim
      join characters.characters c on c.name = cim.charname
    set cim.newId = c.guid;

    insert into importLog
    select concat(count(*), ' records in characters after insert.')
    from characters.characters;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_account_dataTemp')
    from characters.character_account_dataTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_account_data before insert.')
    from characters.character_account_data;
           
	insert into characters.character_account_data
	SELECT cim.newId	,
		`type`	,
		`time`	,
		`data`	
	FROM `characters`.`character_account_dataTemp` cadT
      join character_id_map cim on cim.oldId = cadT.guid
	where not exists
		(select 1
         from characters.character_account_data
         where guid = cim.newId
           and type = cadT.type);	

    insert into importLog
    select concat(count(*), ' records in character_account_data after insert.')
    from characters.character_account_data;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_achievementTemp')
    from characters.character_achievementTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_achievement before insert.')
    from characters.character_achievement;
           
	insert into characters.character_achievement
	SELECT cim.newId	,
		`achievement`	,
		`date`	
	FROM `characters`.`character_achievementTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_achievement
         where guid = cim.newId
           and achievement = temp.achievement);

    insert into importLog
    select concat(count(*), ' records in character_achievement after insert.')
    from characters.character_achievement;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_achievement_progressTemp')
    from characters.character_achievement_progressTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_achievement_progress before insert.')
    from characters.character_achievement_progress;
           
	insert into characters.character_achievement_progress
	SELECT cim.newId	,
		`criteria`	,
		`counter`	,
		`date`	
	FROM `characters`.`character_achievement_progressTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_achievement_progress
         where guid = cim.newId
           and criteria = temp.criteria);

    insert into importLog
    select concat(count(*), ' records in character_achievement_progress after insert.')
    from characters.character_achievement_progress;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_actionTemp')
    from characters.character_actionTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_action before insert.')
    from characters.character_action;
           
	insert into characters.character_action
	SELECT distinct cim.newId	,
		temp.`spec`	,
		temp.`button`	,
		temp.`action`	,
		temp.`type`	
	FROM `characters`.`character_actionTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
      join
		(select guid
			, spec
            , button
            , max(action) as action
		 from characters.character_actionTemp
         group by guid
			, spec
            , button
		) sub on sub.guid = temp.guid
			and sub.spec = temp.spec
            and sub.button = temp.button
            and sub.action = temp.action
	where not exists
		(select 1
         from characters.character_action
         where guid = cim.newId
           and spec = temp.spec
           and button = temp.button);

    insert into importLog
    select concat(count(*), ' records in character_action after insert.')
    from characters.character_action;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_battleground_dataTemp')
    from characters.character_battleground_dataTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_battleground_data before insert.')
    from characters.character_battleground_data;
           
	insert into characters.character_battleground_data
	SELECT cim.newId	,
		`instanceId`	,
		`team`	,
		`joinX`	,
		`joinY`	,
		`joinZ`	,
		`joinO`	,
		`joinMapId`	,
		`taxiStart`	,
		`taxiEnd`	,
		`mountSpell`	
	FROM `characters`.`character_battleground_dataTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_battleground_data
         where guid = cim.newId
           and instanceId = temp.instanceId);

    insert into importLog
    select concat(count(*), ' records in character_battleground_data after insert.')
    from characters.character_battleground_data;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_glyphsTemp')
    from characters.character_glyphsTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_glyphs before insert.')
    from characters.character_glyphs;
           
	insert into characters.character_glyphs
	SELECT cim.newId	,
		`talentGroup`	,
		`glyph1`	,
		`glyph2`	,
		`glyph3`	,
		`glyph4`	,
		`glyph5`	,
		`glyph6`	
	FROM `characters`.`character_glyphsTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_glyphs
         where guid = cim.newId
           and talentGroup = temp.talentGroup);

    insert into importLog
    select concat(count(*), ' records in character_glyphs after insert.')
    from characters.character_glyphs;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_homebindTemp')
    from characters.character_homebindTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_homebind before insert.')
    from characters.character_homebind;
           
	insert into characters.character_homebind
	SELECT cim.newId	,
		`mapId`	,
		`zoneId`	,
		`posX`	,
		`posY`	,
		`posZ`	
	FROM `characters`.`character_homebindTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_homebind
         where guid = cim.newId);

    insert into importLog
    select concat(count(*), ' records in character_homebind after insert.')
    from characters.character_homebind;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_queststatusTemp')
    from characters.character_queststatusTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_queststatus before insert.')
    from characters.character_queststatus;

	insert into characters.character_queststatus
	SELECT cim.newId	,
		`quest`	,
		`status`	,
		`explored`	,
		`timer`	,
		`mobcount1`	,
		`mobcount2`	,
		`mobcount3`	,
		`mobcount4`	,
		`itemcount1`	,
		`itemcount2`	,
		`itemcount3`	,
		`itemcount4`	,
		`playercount`	
	FROM `characters`.`character_queststatusTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_queststatus
         where guid = cim.newId
           and quest = temp.quest);

    insert into importLog
    select concat(count(*), ' records in character_queststatus after insert.')
    from characters.character_queststatus;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_queststatus_dailyTemp')
    from characters.character_queststatus_dailyTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_queststatus_daily before insert.')
    from characters.character_queststatus_daily;
           
	insert into characters.character_queststatus_daily
	SELECT cim.newId	,
		`quest`	,
		`time`	
	FROM `characters`.`character_queststatus_dailyTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_queststatus_daily
         where guid = cim.newId
           and quest = temp.quest);

    insert into importLog
    select concat(count(*), ' records in character_queststatus_daily after insert.')
    from characters.character_queststatus_daily;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_queststatus_monthlyTemp')
    from characters.character_queststatus_monthlyTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_queststatus_monthly before insert.')
    from characters.character_queststatus_monthly;
           
	insert into characters.character_queststatus_monthly
	SELECT cim.newId	,
		`quest`	
	FROM `characters`.`character_queststatus_monthlyTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_queststatus_monthly
         where guid = cim.newId
           and quest = temp.quest);

    insert into importLog
    select concat(count(*), ' records in character_queststatus_monthly after insert.')
    from characters.character_queststatus_monthly;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_queststatus_rewardedTemp')
    from characters.character_queststatus_rewardedTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_queststatus_rewarded before insert.')
    from characters.character_queststatus_rewarded;
           
	insert into characters.character_queststatus_rewarded
	SELECT cim.newId	,
		`quest`	,
		`active`
	FROM `characters`.`character_queststatus_rewardedTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_queststatus_rewarded
         where guid = cim.newId
           and quest = temp.quest);

    insert into importLog
    select concat(count(*), ' records in character_queststatus_rewarded after insert.')
    from characters.character_queststatus_rewarded;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_queststatus_seasonalTemp')
    from characters.character_queststatus_seasonalTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_queststatus_seasonal before insert.')
    from characters.character_queststatus_seasonal;
           
	insert into characters.character_queststatus_seasonal
	SELECT cim.newId	,
		`quest`	,
		`event`	
	FROM `characters`.`character_queststatus_seasonalTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_queststatus_seasonal
         where guid = cim.newId
           and quest = temp.quest);

    insert into importLog
    select concat(count(*), ' records in character_queststatus_seasonal after insert.')
    from characters.character_queststatus_seasonal;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_queststatus_seasonalTemp')
    from characters.character_queststatus_seasonalTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_queststatus_seasonal before insert.')
    from characters.character_queststatus_seasonal;
           
	insert into characters.character_queststatus_weekly
	SELECT cim.newId	,
		`quest`	
	FROM `characters`.`character_queststatus_weeklyTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_queststatus_weekly
         where guid = cim.newId
           and quest = temp.quest);

    insert into importLog
    select concat(count(*), ' records in character_queststatus_seasonal after insert.')
    from characters.character_queststatus_seasonal;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_reputationTemp')
    from characters.character_reputationTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_reputation before insert.')
    from characters.character_reputation;
           
	insert into characters.character_reputation
	SELECT cim.newId	,
		`faction`	,
		`standing`	,
		`flags`	
	FROM `characters`.`character_reputationTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_reputation
         where guid = cim.newId
           and faction = temp.faction);

    insert into importLog
    select concat(count(*), ' records in character_reputation after insert.')
    from characters.character_reputation;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_skillsTemp')
    from characters.character_skillsTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_skills before insert.')
    from characters.character_skills;
           
	insert into characters.character_skills
	SELECT cim.newId	,
		`skill`	,
		`value`	,
		`max`	
	FROM `characters`.`character_skillsTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_skills
         where guid = cim.newId
           and skill = temp.skill);

    insert into importLog
    select concat(count(*), ' records in character_skills after insert.')
    from characters.character_skills;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_socialTemp')
    from characters.character_socialTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_social before insert.')
    from characters.character_social;
           
	insert into characters.character_social
	SELECT cim.newId	,
		frnd.newId	,
		`flags`	,
		`note`	
	FROM `characters`.`character_socialTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
      join character_id_map frnd on frnd.oldId = temp.friend
	where not exists
		(select 1
         from characters.character_social
         where guid = cim.newId
           and friend = frnd.newId);

    insert into importLog
    select concat(count(*), ' records in character_social after insert.')
    from characters.character_social;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_spellTemp')
    from characters.character_spellTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_spell before insert.')
    from characters.character_spell;
           
	insert into characters.character_spell
	SELECT cim.newId	,
		`spell`	,
		`active`	,
		`disabled`	
	FROM `characters`.`character_spellTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_spell
         where guid = cim.newId
           and spell = temp.spell);

    insert into importLog
    select concat(count(*), ' records in character_spell after insert.')
    from characters.character_spell;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_spell_cooldownTemp')
    from characters.character_spell_cooldownTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_spell_cooldown before insert.')
    from characters.character_spell_cooldown;
           
	insert into characters.character_spell_cooldown
	SELECT cim.newId	,
		`spell`	,
		`item`	,
		`time`	,
		`categoryId`	,
		`categoryEnd`	
	FROM `characters`.`character_spell_cooldownTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_spell_cooldown
         where guid = cim.newId
           and spell = temp.spell);

    insert into importLog
    select concat(count(*), ' records in character_spell_cooldown after insert.')
    from characters.character_spell_cooldown;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_talentTemp')
    from characters.character_talentTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_talent before insert.')
    from characters.character_talent;
           
	insert into characters.character_talent
	SELECT cim.newId	,
		`spell`	,
		`talentGroup`	
	FROM `characters`.`character_talentTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.character_talent
         where guid = cim.newId
           and spell = temp.spell
           and talentGroup = temp.talentGroup);

    insert into importLog
    select concat(count(*), ' records in character_talent after insert.')
    from characters.character_talent;
           
    drop table if exists mail_id_map;
	create table mail_id_map
    (newId int, oldId int, receiver int, deliver_time int);
    
    insert into mail_id_map
    (oldId, receiver, deliver_time)
    select id
		, receiver
        , deliver_time
	from characters.mailTemp;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from mailTemp')
    from characters.mailTemp;
    
    insert into importLog
    select concat(count(*), ' records in mail before insert.')
    from characters.mail;

	set @row_number = (select ifnull(max(id),0) from characters.mail);
    
	insert into characters.mail
	SELECT (@row_number := @row_number + 1)	,
		`messageType`	,
		`stationery`	,
		`mailTemplateId`	,
		`sender`	,
		cim.newId	,
		`subject`	,
		`body`	,
		`has_items`	,
		`expire_time`	,
		`deliver_time`	,
		`money`	,
		`cod`	,
		`checked`	
	FROM `characters`.`mailTemp` temp
      join character_id_map cim on cim.oldId = temp.receiver
	where not exists
		(select 1
         from characters.mail
         where receiver = cim.newId
           and subject = temp.subject
           and deliver_time = temp.deliver_time);
           
	update mail_id_map mim
      join character_id_map cim on cim.oldId = mim.receiver
      join characters.mail m on m.receiver = cim.newId
							and m.deliver_time = mim.deliver_time
	set mim.newId = m.id;

    insert into importLog
    select concat(count(*), ' records in mail after insert.')
    from characters.mail;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_petTemp')
    from characters.character_petTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_pet before insert.')
    from characters.character_pet;
	
	set @row_number = (select ifnull(max(id),0) from characters.character_pet);
    
    drop table if exists pet_id_map;
    create table pet_id_map
    (newId int, oldId int, owner int, petname text);
    
    insert into pet_id_map
    (oldId, owner, petname)
    select id
		, owner
        , name
	from characters.character_pet;
           
	insert into characters.character_pet
	SELECT (@row_number := @row_number + 1)	,
		`entry`	,
		cim.newId	,
		`modelid`	,
		`CreatedBySpell`	,
		`PetType`	,
		`level`	,
		`exp`	,
		`Reactstate`	,
		`name`	,
		`renamed`	,
		`slot`	,
		`curhealth`	,
		`curmana`	,
		`curhappiness`	,
		`savetime`	,
		`abdata`	
	FROM `characters`.`character_petTemp` temp
      join character_id_map cim on cim.oldId = temp.owner
	where not exists
		(select 1
         from characters.character_pet
         where owner = cim.newId
           and name = temp.name);

	update pet_id_map pim
      join characters.character_pet cp on cp.owner = pim.owner
									  and cp.name = pim.petname
	set pim.newId = cp.id;

    insert into importLog
    select concat(count(*), ' records in character_pet after insert.')
    from characters.character_pet;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_pet_declinednameTemp')
    from characters.character_pet_declinednameTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_pet_declinedname before insert.')
    from characters.character_pet_declinedname;
           
	insert into characters.character_pet_declinedname
	SELECT pim.newId	,
		cim.newId	,
		`genitive`	,
		`dative`	,
		`accusative`	,
		`instrumental`	,
		`prepositional`	
	FROM `characters`.`character_pet_declinednameTemp` temp
      join character_id_map cim on cim.oldId = temp.owner
      join pet_id_map pim on pim.oldId = temp.id
	where not exists
		(select 1
         from characters.character_pet_declinedname
         where owner = cim.newId
           and id = pim.newid);

    insert into importLog
    select concat(count(*), ' records in character_pet_declinedname after insert.')
    from characters.character_pet_declinedname;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from pet_spellTemp')
    from characters.pet_spellTemp;
    
    insert into importLog
    select concat(count(*), ' records in pet_spell before insert.')
    from characters.pet_spell;
           
	insert into characters.pet_spell
	SELECT pim.newId	,
		`spell`	,
		`active`	
	FROM `characters`.`pet_spellTemp` temp
      join pet_id_map pim on pim.oldId = temp.guid
	where not exists
		(select 1
         from characters.pet_spell
         where guid = pim.newId
           and spell = temp.spell);

    insert into importLog
    select concat(count(*), ' records in pet_spell after insert.')
    from characters.pet_spell;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guildTemp')
    from characters.guildTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild before insert.')
    from characters.guild;
           
	set @row_number = (select ifnull(max(guildid),0) from characters.guild);
    
    drop table if exists guild_id_map;
    create table guild_id_map
    (newId int, oldId int, guildname text);
    
    insert into guild_id_map
    (oldId, guildname)
    select guildid
		, name
	from characters.guildTemp;
           
	insert into characters.guild
	SELECT 	(@row_number := @row_number + 1),
		`name`	,
		cim.newId	,
		`EmblemStyle`	,
		`EmblemColor`	,
		`BorderStyle`	,
		`BorderColor`	,
		`BackgroundColor`	,
		`info`	,
		`motd`	,
		`createdate`	,
		`BankMoney`	
	FROM `characters`.`guildTemp` temp
      join character_id_map cim on cim.oldId = temp.leaderguid
	where not exists
		(select 1
         from characters.guild
         where name = temp.name);
         
	update guild_id_map gim
      join characters.guild g on g.name = gim.guildname
    set gim.newId = g.guildid;

    insert into importLog
    select concat(count(*), ' records in guild after insert.')
    from characters.guild;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guild_memberTemp')
    from characters.guild_memberTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild_member before insert.')
    from characters.guild_member;
           
	insert into characters.guild_member
	SELECT gim.newId	,
		cim.newId	,
		`rank`	,
		`pnote`	,
		`offnote`	
	FROM `characters`.`guild_memberTemp` temp
      join guild_id_map gim on gim.oldId = temp.guildId
      join character_id_map cim on cim.oldId = temp.guid
	where not exists
		(select 1
         from characters.guild_member
         where guid = cim.newId);

    insert into importLog
    select concat(count(*), ' records in guild_member after insert.')
    from characters.guild_member;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guild_bank_tabTemp')
    from characters.guild_bank_tabTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild_bank_tab before insert.')
    from characters.guild_bank_tab;
         
	insert into characters.guild_bank_tab
	SELECT gim.newId	,
		`TabId`	,
		`TabName`	,
		`TabIcon`	,
		`TabText`	
	FROM `characters`.`guild_bank_tabTemp` temp
      join guild_id_map gim on gim.oldId = temp.guildId
	where not exists
		(select 1
         from characters.guild_bank_tab
         where guildId = gim.newId
           and tabId = temp.tabId);

    insert into importLog
    select concat(count(*), ' records in guild_bank_tab after insert.')
    from characters.guild_bank_tab;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guild_bank_eventlogTemp')
    from characters.guild_bank_eventlogTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild_bank_eventlog before insert.')
    from characters.guild_bank_eventlog;
         
	insert into characters.guild_bank_eventlog
	SELECT gim.newId	,
		`LogGuid`	,
		`TabId`	,
		`EventType`	,
		cim.newId	,
		`ItemOrMoney`	,
		`ItemStackCount`	,
		`DestTabId`	,
		`TimeStamp`	
	FROM `characters`.`guild_bank_eventlogTemp` temp
      join guild_id_map gim on gim.oldId = temp.guildId
      join character_id_map cim on cim.oldId = temp.playerguid
	where not exists
		(select 1
         from characters.guild_bank_eventlog
         where guildId = gim.newId
           and LogGuid = temp.LogGuid
           and TabId = temp.TabId);

    insert into importLog
    select concat(count(*), ' records in guild_bank_eventlog after insert.')
    from characters.guild_bank_eventlog;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guild_bank_rightTemp')
    from characters.guild_bank_rightTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild_bank_right before insert.')
    from characters.guild_bank_right;
           
	insert into characters.guild_bank_right
	SELECT gim.newId	,
		`TabId`	,
		`rid`	,
		`gbright`	,
		`SlotPerDay`
	FROM `characters`.`guild_bank_rightTemp` temp
      join guild_id_map gim on gim.oldId = temp.guildId
	where not exists
		(select 1
         from characters.guild_bank_right
         where guildid = gim.newId
           and tabId = temp.tabId
           and rid = temp.rid);

    insert into importLog
    select concat(count(*), ' records in guild_bank_right after insert.')
    from characters.guild_bank_right;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guild_eventlogTemp')
    from characters.guild_eventlogTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild_eventlog before insert.')
    from characters.guild_eventlog;
           
	insert into characters.guild_eventlog
	SELECT gim.newId	,
		`LogGuid`	,
		`EventType`	,
		ifnull(cim1.newId,0)	,
		ifnull(cim2.newId,0)	,
		`NewRank`	,
		`TimeStamp`	
	FROM `characters`.`guild_eventlogTemp` temp
      join guild_id_map gim on gim.oldId = temp.guildId
      left join character_id_map cim1 on cim1.oldId = temp.playerGuid1
      left join character_id_map cim2 on cim2.oldId = temp.playerGuid2
	where not exists
		(select 1
         from characters.guild_eventlog
         where guildid = gim.newId
           and LogGuid = temp.LogGuid);

    insert into importLog
    select concat(count(*), ' records in guild_eventlog after insert.')
    from characters.guild_eventlog;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guild_rankTemp')
    from characters.guild_rankTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild_rank before insert.')
    from characters.guild_rank;
           
	insert into characters.guild_rank
	SELECT gim.newId	,
		`rid`	,
		`rname`	,
		`rights`	,
		`BankMoneyPerDay`	
	FROM `characters`.`guild_rankTemp` temp
      join guild_id_map gim on gim.oldId = temp.guildId
	where not exists
		(select 1
         from characters.guild_rank
         where guildid = gim.newId
           and rid = temp.rid);

    insert into importLog
    select concat(count(*), ' records in guild_rank after insert.')
    from characters.guild_rank;
    
    drop table if exists item_id_map;
    create table item_id_map
    (newId int, oldId int, oldsource int, slot int); 
           
	set @row_number = (select ifnull(max(guid),0) from characters.item_instance);
    
    insert into item_id_map
    (newId, oldId, oldsource, slot)
    select (@row_number := @row_number + 1)
		, item
		, guid
        , slot
	from characters.character_inventoryTemp
    order by guid;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from character_inventoryTemp')
    from characters.character_inventoryTemp;
    
    insert into importLog
    select concat(count(*), ' records in character_inventory before insert.')
    from characters.character_inventory;
           
	insert into characters.character_inventory
	SELECT cim.newId	,
		case when bag.newId is not null
			 then bag.newId
             else 0
		end	,
		temp.slot	,
		iim.newId	
	FROM `characters`.`character_inventoryTemp` temp
      join character_id_map cim on cim.oldId = temp.guid
      join item_id_map iim on iim.oldId = temp.item
      left join item_id_map bag on bag.oldId = temp.bag
								and temp.bag <> 0
	where not exists
		(select 1
         from characters.character_inventory
         where guid = cim.newId
           and slot = temp.slot);
		   
	update item_id_map iim
	  join character_id_map cim on cim.oldId = iim.oldsource
	  join characters.character_inventory ci on ci.slot = iim.slot
											and ci.guid = cim.newId
	set iim.newId = ci.item;

    insert into importLog
    select concat(count(*), ' records in character_inventory after insert.')
    from characters.character_inventory;
    
/*     insert into item_id_map
    (newId, oldId, oldsource, slot)
    select (@row_number := @row_number + 1)
		, itemguid
        , itemowner
        , time
	from characters.auctionhousetemp;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from auctionhouseTemp')
    from characters.auctionhouseTemp;
    
    insert into importLog
    select concat(count(*), ' records in auctionhouse before insert.')
    from characters.auctionhouse;
    
    set @ahNum = (select ifnull(max(id),0) from characters.auctionhouse);
    
    insert into characters.auctionhouse
    SELECT  (@ahNum := @ahNum + 1),
		`houseid`	,
		iim.newId	,
		cim.newId	,
		`buyoutprice`	,
		`time`	,
		ifnull(buyer.newid,0)	,
		`lastbid`	,
		`startbid`	,
		`deposit`		
	FROM `characters`.`auctionhouseTemp` temp
      join character_id_map cim on cim.oldId = temp.itemOwner
      join item_id_map iim on iim.oldId = temp.itemguid
      left join character_id_map buyer on buyer.oldId = temp.buyguid
	where not exists
		(select 1
         from characters.auctionhouse
        where itemOwner = cim.newId
           and itemguid = iim.newId
           and time = temp.time);	
		   
	update item_id_map iim
	  join character_id_map cim on cim.oldId = iim.oldsource
	  join characters.auctionhouse a on a.itemOwner = cim.newId
									and a.time = iim.slot
	set iim.newId = a.itemguid;

    insert into importLog
    select concat(count(*), ' records in auctionhouse after insert.')
    from characters.auctionhouse; */
    
/*     insert into item_id_map
    (newId, oldId, oldsource, slot)
    select (@row_number := @row_number + 1)
		, item_guid
        , receiver
		, mail_id
    from characters.mail_itemstemp;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from mail_itemsTemp')
    from characters.mail_itemsTemp;
    
    insert into importLog
    select concat(count(*), ' records in mail_items before insert.')
    from characters.mail_items;
           
 	insert into characters.mail_items
	SELECT mim.newId	,
		iim.newId	,
		cim.newId	
	FROM `characters`.`mail_itemsTemp` temp
      join character_id_map cim on cim.oldId = temp.receiver
      join mail_id_map mim on mim.oldId = temp.mail_id
      join item_id_map iim on iim.oldId = temp.item_guid
	where not exists
		(select 1
         from characters.mail_items
         where mail_id = mim.newId
           and receiver = cim.newId
           and item_guid = iim.newId);
		   
	update item_id_map iim
	  join character_id_map cim on cim.oldId = iim.oldsource
	  join mail_id_map mim on mim.oldId = iim.slot
	  join characters.mail_items mi on mi.mail_id = mim.newId
								   and mi.receiver = cim.newId
	set iim.newId = mi.item_guid;

    insert into importLog
    select concat(count(*), ' records in mail_items after insert.')
    from characters.mail_items; */
    
    insert into item_id_map
    (newId, oldId, oldsource, slot)
    select (@row_number := @row_number + 1)
		, item_guid
		, tabId
        , slotId
	from characters.guild_bank_itemtemp;
	
	insert into importLog
    select concat('***inserting ', count(*), ' records from guild_bank_itemTemp')
    from characters.guild_bank_itemTemp;
    
    insert into importLog
    select concat(count(*), ' records in guild_bank_item before insert.')
    from characters.guild_bank_item;
           
	insert into characters.guild_bank_item
	SELECT gim.newId	,
		`TabId`	,
		`SlotId`	,
		iim.newId
	FROM `characters`.`guild_bank_itemTemp` temp
      join guild_id_map gim on gim.oldId = temp.guildId
      join item_id_map iim on iim.oldId = temp.item_guid
	where not exists
		(select 1
         from characters.guild_bank_item
         where guildid = gim.newId
           and tabId = temp.tabId
           and slotId = temp.slotId);
		   
	update item_id_map iim
	  join characters.guild_bank_itemTemp gbit on gbit.item_guid = iim.oldId
	  join guild_id_map gim on gim.oldId = gbit.guildId
	  join characters.guild_bank_item gbi on gbi.slotId = iim.slot
										 and gbi.tabId = iim.oldsource
										 and gbi.guildId = gim.newId
	set iim.newId = gbi.item_guid;

    insert into importLog
    select concat(count(*), ' records in guild_bank_item after insert.')
    from characters.guild_bank_item;

	
	insert into importLog
    select concat('***inserting ', count(*), ' records from item_instanceTemp')
    from characters.item_instanceTemp;
    
    insert into importLog
    select concat(count(*), ' records in item_instance before insert.')
    from characters.item_instance;

	insert into characters.item_instance
	SELECT iim.newId	,
		`itemEntry`	,
		ifnull(cim.newId,0)	,
		ifnull(crtr.newId,0)	,
		ifnull(gft.newId,0)	,
		`count`	,
		`duration`	,
		`charges`	,
		`flags`	,
		`enchantments`	,
		`randomPropertyId`	,
		`durability`	,
		`playedTime`	,
		`text`	
	FROM `characters`.`item_instanceTemp` temp
      join characters.character_inventorytemp cit on cit.item = temp.guid
      left join character_id_map cim on cim.oldId = temp.owner_guid
      join item_id_map iim on iim.oldId = temp.guid
      left join character_id_map crtr on crtr.oldId = temp.creatorGuid
      left join character_id_map gft on gft.oldId = temp.giftCreatorGuid
	where not exists
		(select 1
         from characters.item_instance ii
           join characters.character_inventory ci on ci.item = ii.guid
         where ci.guid = cim.newId
           and ci.slot = iim.slot);

/* 	insert into characters.item_instance
	SELECT iim.newId	,
		`itemEntry`	,
		ifnull(cim.newId,0)	,
		ifnull(crtr.newId,0)	,
		ifnull(gft.newId,0)	,
		`count`	,
		`duration`	,
		`charges`	,
		`flags`	,
		`enchantments`	,
		`randomPropertyId`	,
		`durability`	,
		`playedTime`	,
		`text`	
	FROM `characters`.`item_instanceTemp` temp
      join characters.auctionhousetemp aht on aht.itemguid = temp.guid
      left join character_id_map cim on cim.oldId = temp.owner_guid
      join item_id_map iim on iim.oldId = temp.guid
      left join character_id_map crtr on crtr.oldId = temp.creatorGuid
      left join character_id_map gft on gft.oldId = temp.giftCreatorGuid
	where not exists
		(select 1
         from characters.item_instance ii
           join characters.auctionhouse a on a.itemguid = ii.guid
		 where a.itemowner = cim.newId
           and a.time = iim.slot);

	insert into characters.item_instance
	SELECT iim.newId	,
		`itemEntry`	,
		ifnull(cim.newId,0)	,
		ifnull(crtr.newId,0)	,
		ifnull(gft.newId,0)	,
		`count`	,
		`duration`	,
		`charges`	,
		`flags`	,
		`enchantments`	,
		`randomPropertyId`	,
		`durability`	,
		`playedTime`	,
		`text`	
	FROM `characters`.`item_instanceTemp` temp
      join characters.mail_itemstemp mit on mit.item_guid = temp.guid
      left join character_id_map cim on cim.oldId = temp.owner_guid
      join item_id_map iim on iim.oldId = temp.guid
      left join character_id_map crtr on crtr.oldId = temp.creatorGuid
      left join character_id_map gft on gft.oldId = temp.giftCreatorGuid
	where not exists
		(select 1
         from characters.item_instance ii
           join characters.mail_items mi on mi.item_guid = ii.guid
           join mail_id_map mim on mim.newid = mi.mail_id
		 where mim.oldId = mit.mail_id); */

	insert into characters.item_instance
	SELECT iim.newId	,
		`itemEntry`	,
		ifnull(cim.newId,0)	,
		ifnull(crtr.newId,0)	,
		ifnull(gft.newId,0)	,
		`count`	,
		`duration`	,
		`charges`	,
		`flags`	,
		`enchantments`	,
		`randomPropertyId`	,
		`durability`	,
		`playedTime`	,
		`text`	
	FROM `characters`.`item_instanceTemp` temp
      join characters.guild_bank_itemtemp gbit on gbit.item_guid = temp.guid
      left join character_id_map cim on cim.oldId = temp.owner_guid
      join item_id_map iim on iim.oldId = temp.guid
      left join character_id_map crtr on crtr.oldId = temp.creatorGuid
      left join character_id_map gft on gft.oldId = temp.giftCreatorGuid
	where not exists
		(select 1
         from characters.item_instance ii
           join characters.guild_bank_item gbi on gbi.item_guid = ii.guid
           join guild_id_map gim on gim.newId = gbi.guildId
		 where gbi.TabId = iim.oldsource
           and gbi.SlotId = iim.slot)
	order by temp.guid;

    insert into importLog
    select concat(count(*), ' records in item_instance after insert.')
    from characters.item_instance;
           
	select *
    from importLog;

    drop table if exists importLog;
    drop table if exists account_id_map;
    drop table if exists character_id_map;
    drop table if exists mail_id_map;
    drop table if exists item_id_map;
    drop table if exists pet_id_map;
    drop table if exists guild_id_map;
END$$
DELIMITER ;
