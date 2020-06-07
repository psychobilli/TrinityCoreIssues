set @account_name := 'P';-- 'B';-- 'S';-- 'Z';-- 'P';-- 'B';-- 'S';-- 'Z';-- 'P';-- 'B';-- 'S';-- 'Z';
set @character_name := 'Facurn';-- 'Yanz';-- 'Herno';-- 'Ilia';-- 'Kaben';-- 'Marei';-- 'Tirkik';-- 'Lylin';-- 'Kwax';-- 'Celis';-- 'Davon';-- 'Mioh';

use `auth_434`;
select @source_account_id := `id` from `account` where `username` = @account_name;

use `auth_cata`;
select @target_account_id := ifnull(`id`, `id2`) from (select `id` from `account` `a1` where `a1`.`username` = @account_name) `a1` cross join (select max(`id`) + 1 as `id2` from `account` `a2`) `a2`;

use `characters_cata`;

-- delete from characters;
-- delete from account_data;
-- delete from account_instance_times;
-- delete from account_tutorial;
-- delete from arena_team_member;
-- delete from character_account_data;
-- delete from character_achievement;
-- delete from character_achievement_progress;
-- delete from character_action;
-- delete from character_archaeology_completed;
-- delete from character_archaeology_projects;
-- delete from character_arena_stats;
-- delete from character_aura;
-- delete from character_banned;
-- delete from character_battleground_data;
-- delete from character_battleground_random;
-- delete from character_cuf_profiles;
-- delete from character_currency;
-- delete from character_declinedname;
-- delete from character_equipmentsets;
-- delete from character_gifts;
-- delete from character_glyphs;
-- delete from character_homebind;
-- delete from character_instance;
-- delete from character_inventory;
-- delete from character_pet;
-- delete from character_pet_declinedname;
-- delete from character_queststatus;
-- delete from character_queststatus_daily;
-- delete from character_queststatus_monthly;
-- delete from character_queststatus_rewarded;
-- delete from character_queststatus_seasonal;
-- delete from character_queststatus_weekly;
-- delete from character_reputation;
-- delete from character_skills;
-- delete from character_social;
-- delete from character_spell;
-- delete from character_spell_cooldown;
-- delete from character_stats;
-- delete from character_talent;
-- delete from character_void_storage;
-- delete from corpse;
-- delete from guild;
-- delete from guild_bank_eventlog;
-- delete from guild_eventlog;
-- delete from guild_finder_applicant;
-- delete from guild_member;
-- delete from guild_member_withdraw;
-- delete from guild_newslog;
-- delete from item_instance;
-- delete from mail;
-- delete from pet_spell;
-- delete from pet_spell_cooldown;
-- delete from guild_achievement;
-- delete from guild_achievement_progress;
-- delete from guild_bank_item;
-- delete from guild_bank_right;
-- delete from guild_bank_tab;
-- delete from guild_finder_guild_settings;
-- delete from guild_rank;
-- delete from character_aura;
-- delete from mail_items;

-- SET Primary Tables
SELECT @character_guid := ifnull(max(guid), 0) FROM `characters`;

-- INSERT characters
INSERT INTO `characters` (`guid`, `account`, `name`, `slot`, `race`, `class`, `gender`, `level`, `xp`, `money`, `skin`, `face`, `hairStyle`, `hairColor`, `facialStyle`, `playerFlags`, `position_x`, `position_y`, `position_z`, `map`, `instance_id`, `instance_mode_mask`, `orientation`, `taximask`, `online`, `cinematic`, `totaltime`, `leveltime`, `logout_time`, `is_logout_resting`, `rest_bonus`, `resettalents_cost`, `resettalents_time`, `talentTree`, `trans_x`, `trans_y`, `trans_z`, `trans_o`, `transguid`, `extra_flags`, `stable_slots`, `at_login`, `zone`, `death_expire_time`, `taxi_path`, `totalKills`, `todayKills`, `yesterdayKills`, `chosenTitle`, `watchedFaction`, `drunk`, `health`, `power1`, `power2`, `power3`, `power4`, `power5`, `latency`, `talentGroupsCount`, `activeTalentGroup`, `exploredZones`, `equipmentCache`, `knownTitles`, `actionBars`, `grantableLevels`, `deleteInfos_Account`, `deleteInfos_Name`, `deleteDate`)
SELECT @character_guid := @character_guid + 1, `account`, `name`, `slot`, `race`, `class`, `gender`, `level`, `xp`, `money`, `skin`, `face`, `hairStyle`, `hairColor`, `facialStyle`, `playerFlags`, `position_x`, `position_y`, `position_z`, `map`, `instance_id`, `instance_mode_mask`, `orientation`, `taximask`, `online`, `cinematic`, `totaltime`, `leveltime`, `logout_time`, `is_logout_resting`, `rest_bonus`, `resettalents_cost`, `resettalents_time`, `talentTree`, `trans_x`, `trans_y`, `trans_z`, `trans_o`, `transguid`, `extra_flags`, `stable_slots`, `at_login`, `zone`, `death_expire_time`, `taxi_path`, `totalKills`, `todayKills`, `yesterdayKills`, `chosenTitle`, `watchedFaction`, `drunk`, `health`, `power1`, `power2`, `power3`, `power4`, `power5`, `latency`, `talentGroupsCount`, `activeTalentGroup`, `exploredZones`, `equipmentCache`, `knownTitles`, `actionBars`, `grantableLevels`, `deleteInfos_Account`, `deleteInfos_Name`, `deleteDate`
FROM `characters_434`.`characters` WHERE `account` = @source_account_id AND `name` = @character_name;
UPDATE `characters` SET `account` = @target_account_id WHERE `account` = @source_account_id;

CREATE TEMPORARY TABLE `character_account_map` (`source_guid` int, `target_guid` int, `source_account_id` int, `target_account_id` int);
INSERT INTO `character_account_map` (`source_guid`, `target_guid`, `source_account_id`, `target_account_id`) 
SELECT `s`.`guid`, `t`.`guid`, @source_account_id, @target_account_id FROM `characters` `t` JOIN `characters_434`.`characters` `s` ON `s`.`name` = `t`.`name` AND `t`.`account` = @target_account_id AND `t`.`name` = @character_name;

select * from `character_account_map`;

-- INSERT guild
SELECT @guildid := ifnull(max(guildid), 0) FROM `guild`;

CREATE TEMPORARY TABLE `guild_character_map` (`source_guild_id` int, `target_guild_id` int, `source_character_guid` int, `target_character_guid` int);
INSERT INTO `guild_character_map` (`source_guild_id`, `target_guild_id`, `source_character_guid`, `target_character_guid`) 
SELECT `g`.`guildid`, @guildid := @guildid + 1, `source_guid`, `target_guid` FROM `characters_434`.`guild` `g` JOIN `characters_434`.`guild_member` `gm` ON `gm`.`guildid` = `g`.`guildid` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `gm`.`guid`;

INSERT INTO `guild` (`guildid`, `name`, `leaderguid`, `EmblemStyle`, `EmblemColor`, `BorderStyle`, `BorderColor`, `BackgroundColor`, `info`, `motd`, `createdate`, `BankMoney`, `level`, `experience`, `todayExperience`)
SELECT DISTINCT `gcm`.`target_guild_id`, `name`, `leaderguid`, `EmblemStyle`, `EmblemColor`, `BorderStyle`, `BorderColor`, `BackgroundColor`, `info`, `motd`, `createdate`, `BankMoney`, `level`, `experience`, `todayExperience`
FROM `characters_434`.`guild` `G` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `G`.`guildid` WHERE NOT EXISTS (SELECT 1 FROM `guild` WHERE `name` = `G`.`name`);

select * from `guild_character_map`;

INSERT INTO `guild_member` (`guildid`, `guid`, `rank`, `pnote`, `offnote`)
SELECT `guildid`, `gcm`.`target_character_guid`, `rank`, `pnote`, `offnote`
FROM `characters_434`.`guild_member` `gm` JOIN `guild_character_map` `gcm` ON `gm`.`guildid` = `gcm`.`source_guild_id`;

UPDATE `guild` `g` JOIN `guild_member` `gm` ON `gm`.`guildid` = `g`.`guildid` SET `g`.`leaderguid` = `gm`.`guid` WHERE `g`.`leaderguid` NOT IN (SELECT `guid` FROM `guild_member` WHERE `guildid` = `g`.`guildid`);

-- INSERT character_pet
CREATE TEMPORARY TABLE `pet_character_map` (`source_pet_id` int, `target_pet_id` int, `source_character_guid` int, `target_character_guid` int);
INSERT INTO `pet_character_map` (`source_pet_id`, `source_character_guid`, `target_character_guid`) SELECT `p`.`id`, `source_guid`, `target_guid` FROM `characters_434`.`character_pet` `p` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `p`.`owner`;

SELECT @pet_id := ifnull(max(`id`), 0) FROM `character_pet`;

INSERT INTO `character_pet` (`id`, `entry`, `owner`, `modelid`, `CreatedBySpell`, `PetType`, `level`, `exp`, `Reactstate`, `name`, `renamed`, `slot`, `curhealth`, `curmana`, `savetime`, `abdata`)
SELECT @pet_id := @pet_id + 1, `entry`, `pcm`.`target_character_guid`, `modelid`, `CreatedBySpell`, `PetType`, `level`, `exp`, `Reactstate`, `name`, `renamed`, `slot`, `curhealth`, `curmana`, `savetime`, `abdata`
FROM `characters_434`.`character_pet` `p` JOIN `pet_character_map` `pcm` ON `pcm`.`source_pet_id` = `p`.`id`;

UPDATE `pet_character_map` `pcm` JOIN `characters_434`.`character_pet` `p` ON `p`.`id` = `pcm`.`source_pet_id` JOIN `character_pet` `t` ON `t`.`owner` = `pcm`.`target_character_guid` AND `t`.`name` = `p`.`name` SET `pcm`.`target_pet_id` = `t`.`id`;

select * from `pet_character_map`;

-- INSERT item_instance
SELECT @item_id := ifnull(max(`guid`),0) FROM `item_instance`;

CREATE TEMPORARY TABLE `item_character_map` (source_item_guid int, target_item_guid int, source_character_guid int, target_character_guid int, source_bag int, target_bag int, slot int);
INSERT INTO `item_character_map` (source_item_guid, target_item_guid, source_character_guid, target_character_guid, source_bag, slot) 
SELECT `i`.`guid`, @item_id := @item_id + 1, `source_guid`, `target_guid`, `bag`, `slot`
FROM `characters_434`.`item_instance` `i` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `i`.`owner_guid` 
JOIN `characters_434`.`character_inventory` `ci` on `ci`.`guid` = `cam`.`source_guid` AND `ci`.`item` = `i`.`guid`;

UPDATE `item_character_map` `icm` LEFT JOIN `item_character_map` `bag` ON `bag`.`source_item_guid` = `icm`.`source_bag` SET `icm`.`target_bag` = ifnull(`bag`.`target_item_guid`,0);

INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `creatorGuid`, `giftCreatorGuid`, `count`, `duration`, `charges`, `flags`, `enchantments`, `randomPropertyId`, `durability`, `creationTime`, `text`)
SELECT `icm`.`target_item_guid`, `itemEntry`, `icm`.`target_character_guid`, 0, 0, `count`, `duration`, `charges`, `flags`, `enchantments`, `randomPropertyId`, `durability`, `playedTime`, `text`
FROM `characters_434`.`item_instance` `ii` JOIN `item_character_map` `icm` on `icm`.`source_item_guid` = `ii`.`guid`;

INSERT INTO `character_inventory` (`guid`, `bag`, `slot`, `item`) 
SELECT `icm`.`target_character_guid`, `icm`.`target_bag`, `icm`.`slot`, `icm`.`target_item_guid` FROM `item_character_map` `icm`;

CREATE TEMPORARY TABLE `item_guild_map` (`source_item_guid` int, `target_item_guid` int, `source_guild_id` int, `target_guild_id` int);
INSERT INTO `item_guild_map` (`source_item_guid`, `target_item_guid`, `source_guild_id`, `target_guild_id`) SELECT `ii`.`guid`, @item_id := @item_id + 1, `source_guild_id`, `target_guild_id` FROM `characters_434`.`item_instance` `ii` 
JOIN `characters_434`.`guild_bank_item` `gbi` ON `gbi`.`item_guid` = `ii`.`guid` JOIN (SELECT DISTINCT `source_guild_id`, `target_guild_id` FROM `guild_character_map`) `gcm` ON `gcm`.`source_guild_id` = `gbi`.`guildid`;

INSERT INTO `guild_bank_item` (`guildid`, `TabId`, `SlotId`, `item_guid`)
SELECT `guildid`, `TabId`, `SlotId`, `igm`.`target_item_guid`
FROM `characters_434`.`guild_bank_item` `gbi` JOIN `item_guild_map` `igm` ON `igm`.`source_guild_id` = `gbi`.`guildid`;

INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `creatorGuid`, `giftCreatorGuid`, `count`, `duration`, `charges`, `flags`, `enchantments`, `randomPropertyId`, `durability`, `creationTime`, `text`)
SELECT `igm`.`target_item_guid`, `itemEntry`, `igm`.`target_guild_id`, 0, 0, `count`, `duration`, `charges`, `flags`, `enchantments`, `randomPropertyId`, `durability`, `playedTime`, `text`
FROM `characters_434`.`item_instance` `ii` JOIN `item_guild_map` `igm` on `igm`.`source_item_guid` = `ii`.`guid`;

select * from `item_character_map`;
select * from `item_guild_map`;

-- INSERT mail
SELECT @mail_id := ifnull(max(`id`),0) FROM `mail`;

CREATE TEMPORARY TABLE `mail_character_map` (`source_mail_id` int, `target_mail_id` int, `source_character_guid` int, `target_character_guid` int);
INSERT INTO `mail_character_map` (source_mail_id, target_mail_id, source_character_guid, target_character_guid) SELECT `m`.`id`, @mail_id := @mail_id + 1, `cam`.`source_guid`, `cam`.`target_guid` FROM `characters_434`.`mail` `m` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `m`.`sender`;
INSERT INTO `mail` (`id`, `messageType`, `stationery`, `mailTemplateId`, `sender`, `receiver`, `subject`, `body`, `has_items`, `expire_time`, `deliver_time`, `money`, `cod`, `checked`)
SELECT `mcm`.`target_mail_id`, `messageType`, `stationery`, `mailTemplateId`, `mcm`.`target_character_guid`, 0, `subject`, `body`, `has_items`, `expire_time`, `deliver_time`, `money`, `cod`, `checked` FROM `characters_434`.`mail` `m` JOIN `mail_character_map` `mcm` ON `mcm`.`source_character_guid` = `m`.`sender`;

-- INSERT account tables
INSERT INTO `account_data` (`accountId`, `type`, `time`, `data`)
SELECT @target_account_id, `type`, `time`, `data` FROM `characters_434`.`account_data` WHERE `accountId` = @source_account_id
  AND NOT EXISTS (SELECT 1 FROM `account_data` WHERE `accountId` = @target_account_id);

INSERT INTO `account_instance_times` (`accountId`, `instanceId`, `releaseTime`) 
SELECT @target_account_id, `instanceId`, `releaseTime` FROM `characters_434`.`account_instance_times` WHERE `accountId` = @source_account_id
  AND NOT EXISTS (SELECT 1 FROM `account_data` WHERE `accountId` = @target_account_id);

INSERT INTO `account_tutorial` (`accountId`, `tut0`, `tut1`, `tut2`, `tut3`, `tut4`, `tut5`, `tut6`, `tut7`)
SELECT @target_account_id, `tut0`, `tut1`, `tut2`, `tut3`, `tut4`, `tut5`, `tut6`, `tut7` FROM `characters_434`.`account_tutorial` WHERE `accountId` = @source_account_id
  AND NOT EXISTS (SELECT 1 FROM `account_data` WHERE `accountId` = @target_account_id);
  
-- INSERT character tables
INSERT INTO `character_account_data` (`guid`, `type`, `time`, `data`) 
SELECT `cam`.`target_guid`, `type`, `time`, `data`
FROM `characters_434`.`character_account_data` `cad` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cad`.`guid`;

INSERT INTO `character_achievement` (`guid`, `achievement`, `date`)
SELECT `cam`.`target_guid`, `achievement`, `date`
FROM `characters_434`.`character_achievement` `ca` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `ca`.`guid`;

INSERT INTO `character_achievement_progress` (`guid`, `criteria`, `counter`, `date`)
SELECT `cam`.`target_guid`, `criteria`, `counter`, `date`
FROM `characters_434`.`character_achievement_progress` `cap` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cap`.`guid`;

INSERT INTO `character_action` (`guid`, `spec`, `button`, `action`, `type`)
SELECT `cam`.`target_guid`, `spec`, `button`, `action`, `type` 
FROM `characters_434`.`character_action` `ca` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `ca`.`guid`;

INSERT INTO `character_archaeology_completed` (`guid`, `project`, `time`, `count`)
SELECT `cam`.`target_guid`, `project`, `time`, `count`
FROM `characters_434`.`character_archaeology_completed` `cac` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cac`.`guid`;

INSERT INTO `character_archaeology_projects` (`guid`, `branch`, `project`) 
SELECT `cam`.`target_guid`, `branch`, `project`
FROM `characters_434`.`character_archaeology_projects` `cac` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cac`.`guid`;
	-- unknown mapping character_archaeology_digsite.guid
-- INSERT INTO `character_archaeology_sites` (`guid`, `site`, `type`, `fin-- ds`)
-- SELECT `cam`.`target_guid`, `entry`, `counter_digsite`, `time_digged`, `point1`, `count1`, `point2`, `count2`, `point3`, `count3`
-- FROM `characters_434`.`character_archaeology_digsite` `cad` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cad`.`guid`;

INSERT INTO `character_arena_stats` (`guid`, `slot`, `matchMakerRating`)
SELECT `cam`.`target_guid`, `slot`, `matchMakerRating`
FROM `characters_434`.`character_arena_stats` `cas` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cas`.`guid`;

INSERT INTO `character_banned` (`guid`, `bandate`, `unbandate`, `bannedby`, `banreason`, `active`)
SELECT `cam`.`target_guid`, `bandate`, `unbandate`, `bannedby`, `banreason`, `active`
FROM `characters_434`.`character_banned` `cb` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cb`.`guid`;
	-- skip character_battleground_data.guid
	-- skip character_battleground_random.guid

INSERT INTO `character_cuf_profiles` (`guid`, `id`, `name`, `frameHeight`, `frameWidth`, `sortBy`, `healthText`, `boolOptions`, `unk146`, `unk147`, `unk148`, `unk150`, `unk152`, `unk154`) 
SELECT `cam`.`target_guid`, `id`, `name`, `frameHeight`, `frameWidth`, `sortBy`, `healthText`, `boolOptions`, `unk146`, `unk147`, `unk148`, `unk150`, `unk152`, `unk154`
FROM `characters_434`.`character_cuf_profiles` `ccp` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `ccp`.`guid`;

INSERT INTO `character_currency` (`CharacterGuid`, `Currency`, `Quantity`, `WeeklyQuantity`, `TrackedQuantity`, `Flags`)
SELECT `cam`.`target_guid`, `currency`, `total_count`, `week_count`, 0, 0
FROM `characters_434`.`character_currency` `cc` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cc`.`guid`;
	-- skip character_declinedname.guid

INSERT INTO `character_equipmentsets` (`guid`, `setguid`, `setindex`, `name`, `iconname`, `ignore_mask`, `item0`, `item1`, `item2`, `item3`, `item4`, `item5`, `item6`, `item7`, `item8`, `item9`, `item10`, `item11`, `item12`, `item13`, `item14`, `item15`, `item16`, `item17`, `item18`)
SELECT `cam`.`target_guid`, `setguid`, `setindex`, `name`, `iconname`, `ignore_mask`, `item0`, `item1`, `item2`, `item3`, `item4`, `item5`, `item6`, `item7`, `item8`, `item9`, `item10`, `item11`, `item12`, `item13`, `item14`, `item15`, `item16`, `item17`, `item18`
FROM `characters_434`.`character_equipmentsets` `ce`  JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `ce`.`guid`;

INSERT INTO `character_glyphs` (`guid`, `talentGroup`, `glyph1`, `glyph2`, `glyph3`, `glyph4`, `glyph5`, `glyph6`, `glyph7`, `glyph8`, `glyph9`)
SELECT `cam`.`target_guid`, `talentGroup`, `glyph1`, `glyph2`, `glyph3`, `glyph4`, `glyph5`, `glyph6`, `glyph7`, `glyph8`, `glyph9`
FROM `characters_434`.`character_glyphs` `cg` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cg`.`guid`;
	-- unknown target character_guild_reputation.guid

INSERT INTO `character_homebind` (`guid`, `mapId`, `zoneId`, `posX`, `posY`, `posZ`)
SELECT `cam`.`target_guid`, `mapId`, `zoneId`, `posX`, `posY`, `posZ`
FROM `characters_434`.`character_homebind` `ch` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `ch`.`guid`;

INSERT INTO `character_instance` (`guid`, `instance`, `permanent`)
SELECT `cam`.`target_guid`, `instance`, `permanent` 
FROM `characters_434`.`character_instance` `ci` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `ci`.`guid`;
	-- skip character_npcbot.owner

INSERT INTO `character_queststatus` (`guid`, `quest`, `status`, `explored`, `timer`, `mobcount1`, `mobcount2`, `mobcount3`, `mobcount4`, `itemcount1`, `itemcount2`, `itemcount3`, `itemcount4`, `playercount`)
SELECT `cam`.`target_guid`, `quest`, `status`, `explored`, `timer`, `mobcount1`, `mobcount2`, `mobcount3`, `mobcount4`, `itemcount1`, `itemcount2`, `itemcount3`, `itemcount4`, `playercount`
FROM `characters_434`.`character_queststatus` `cq` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cq`.`guid`;

INSERT INTO `character_queststatus_daily` (`guid`, `quest`, `time`)
SELECT `cam`.`target_guid`, `quest`, `time`
FROM `characters_434`.`character_queststatus_daily` `cqd` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cqd`.`guid`;

INSERT INTO `character_queststatus_monthly` (`guid`, `quest`)
SELECT `cam`.`target_guid`, `quest`
FROM `characters_434`.`character_queststatus_monthly` `cqm` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cqm`.`guid`;

INSERT INTO `character_queststatus_rewarded` (`guid`, `quest`, `active`)
SELECT `cam`.`target_guid`, `quest`, `active`
FROM `characters_434`.`character_queststatus_rewarded` `cqr` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cqr`.`guid`;

INSERT INTO `character_queststatus_seasonal` (`guid`, `quest`, `event`)
SELECT `cam`.`target_guid`, `quest`, `event`
FROM `characters_434`.`character_queststatus_seasonal` `cqs` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cqs`.`guid`;

INSERT INTO `character_queststatus_weekly` (`guid`, `quest`)
SELECT `cam`.`target_guid`, `quest`
FROM `characters_434`.`character_queststatus_weekly` `cqw` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cqw`.`guid`;

INSERT INTO `character_reputation` (`guid`, `faction`, `standing`, `flags`)
SELECT `cam`.`target_guid`, `faction`, `standing`, `flags`
FROM `characters_434`.`character_reputation` `cr` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cr`.`guid`;

INSERT INTO `character_skills` (`guid`, `skill`, `value`, `max`)
SELECT `cam`.`target_guid`, `skill`, `value`, `max`
FROM `characters_434`.`character_skills` `cs` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cs`.`guid`;
	-- skip character_social.guid

INSERT INTO `character_spell` (`guid`, `spell`, `active`, `disabled`)
SELECT `cam`.`target_guid`, `spell`, `active`, `disabled`
FROM `characters_434`.`character_spell` `cs` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cs`.`guid`;

INSERT INTO `character_spell_cooldown` (`guid`, `spell`, `item`, `time`)
SELECT `cam`.`target_guid`, `spell`, `item`, `time`
FROM `characters_434`.`character_spell_cooldown` `csc` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `csc`.`guid`;

INSERT INTO `character_stats` (`guid`, `maxhealth`, `maxpower1`, `maxpower2`, `maxpower3`, `maxpower4`, `maxpower5`, `strength`, `agility`, `stamina`, `intellect`, `spirit`, `armor`, `resHoly`, `resFire`, `resNature`, `resFrost`, `resShadow`, `resArcane`, `blockPct`, `dodgePct`, `parryPct`, `critPct`, `rangedCritPct`, `spellCritPct`, `attackPower`, `rangedAttackPower`, `spellPower`, `resilience`)
SELECT `cam`.`target_guid`, `maxhealth`, `maxpower1`, `maxpower2`, `maxpower3`, `maxpower4`, `maxpower5`, `strength`, `agility`, `stamina`, `intellect`, `spirit`, `armor`, `resHoly`, `resFire`, `resNature`, `resFrost`, `resShadow`, `resArcane`, `blockPct`, `dodgePct`, `parryPct`, `critPct`, `rangedCritPct`, `spellCritPct`, `attackPower`, `rangedAttackPower`, `spellPower`, `resilience`
FROM `characters_434`.`character_stats` `cs` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `cs`.`guid`;

INSERT INTO `character_talent` (`guid`, `spell`, `talentGroup`)
SELECT `cam`.`target_guid`, `spell`, `talentGroup`
FROM `characters_434`.`character_talent` `ct` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `ct`.`guid`;

INSERT INTO `corpse` (`guid`, `posX`, `posY`, `posZ`, `orientation`, `mapId`, `displayId`, `itemCache`, `bytes1`, `bytes2`, `flags`, `dynFlags`, `time`, `corpseType`, `instanceId`)
SELECT `cam`.`target_guid`, `posX`, `posY`, `posZ`, `orientation`, `mapId`, `displayId`, `itemCache`, `bytes1`, `bytes2`, `flags`, `dynFlags`, `time`, `corpseType`, `instanceId`
FROM `characters_434`.`corpse` `c` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `c`.`guid`;

INSERT INTO `guild_member_withdraw` (`guid`, `tab0`, `tab1`, `tab2`, `tab3`, `tab4`, `tab5`, `tab6`, `tab7`, `money`)
SELECT `cam`.`target_guid`, `tab0`, `tab1`, `tab2`, `tab3`, `tab4`, `tab5`, `tab6`, `tab7`, `money`
FROM `characters_434`.`guild_member_withdraw` `gmw` JOIN `character_account_map` `cam` ON `cam`.`source_guid` = `gmw`.`guid`;
	-- unknown target questgiver_quest.playerGuid

-- INSERT pet tables
INSERT INTO `character_pet_declinedname` (`id`, `owner`, `genitive`, `dative`, `accusative`, `instrumental`, `prepositional`)
SELECT `pcm`.`target_pet_id`, `pcm`.`target_character_guid`, `genitive`, `dative`, `accusative`, `instrumental`, `prepositional` FROM `characters_434`.`character_pet_declinedname` `cpd` JOIN `pet_character_map` `pcm` ON `pcm`.`source_pet_id` = `cpd`.`id`;

INSERT INTO `pet_spell` (`guid`, `spell`, `active`)
SELECT `pcm`.`target_pet_id`, `spell`, `active` FROM `characters_434`.`pet_spell` `ps` JOIN `pet_character_map` `pcm` ON `pcm`.`source_pet_id` = `ps`.`guid`;

INSERT INTO `pet_spell_cooldown` (`guid`, `spell`, `time`)
SELECT `pcm`.`target_pet_id`, `spell`, `time` FROM `characters_434`.`pet_spell_cooldown` `psc` JOIN `pet_character_map` `pcm` ON `pcm`.`source_pet_id` = `psc`.`guid`;

-- INSERT guild tables
	-- unknown target character_guild_reputation.guildid
 -- SELECT `gcm`.`target_charcter.guid`, `cgr`.`target_guild_id`, `disband_time`, `weekly_rep`, `total_rep`
 -- FROM `characters_434`.`character_guild_reputation` `cgr` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `cgr`.`guildid` AND `gcm`.`source_character_id` = `cgr`.`guid`;

INSERT INTO `guild_achievement` (`guildId`, `achievement`, `date`, `guids`)
SELECT `gcm`.`target_guild_id`, `achievement`, `date`, `guids` FROM `characters_434`.`guild_achievement` `ga` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `ga`.`guildid`;

INSERT INTO `guild_achievement_progress` (`guildId`, `criteria`, `counter`, `date`, `completedGuid`)
SELECT `gcm`.`target_guild_id`, `criteria`, `counter`, `date`, 0
FROM `characters_434`.`guild_achievement_progress` `gap` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `gap`.`guildid`;

INSERT INTO `guild_bank_eventlog` (`guildid`, `LogGuid`, `TabId`, `EventType`, `PlayerGuid`, `ItemOrMoney`, `ItemStackCount`, `DestTabId`, `TimeStamp`)
SELECT `gcm`.`target_guild_id`, `LogGuid`, `TabId`, `EventType`, 0, `ItemOrMoney`, `ItemStackCount`, `DestTabId`, `TimeStamp`
FROM `characters_434`.`guild_bank_eventlog` `gbe` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `gbe`.`guildid`;

INSERT INTO `guild_bank_right` (`guildid`, `TabId`, `rid`, `gbright`, `SlotPerDay`)
SELECT `gcm`.`target_guild_id`, `TabId`, `rid`, `gbright`, `SlotPerDay`
FROM `characters_434`.`guild_bank_right` `gbr` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `gbr`.`guildid`;

INSERT INTO `guild_bank_tab` (`guildid`, `TabId`, `TabName`, `TabIcon`, `TabText`)
SELECT `gcm`.`target_guild_id`, `TabId`, `TabName`, `TabIcon`, `TabText`
FROM `characters_434`.`guild_bank_tab` `gbt` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `gbt`.`guildid`;
	-- unknown target guild_challenges_completed.guildId
 -- SELECT `gcm`.`target_guild_id`, `challengeId`, `dateCompleted`
 -- FROM `characters_434`.`guild_challenges_completed` `gcc` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `gcc`.`guildid`;

INSERT INTO `guild_eventlog` (`guildid`, `LogGuid`, `EventType`, `PlayerGuid1`, `PlayerGuid2`, `NewRank`, `TimeStamp`)
SELECT `gcm`.`target_guild_id`, `LogGuid`, `EventType`, 0, 0, `NewRank`, `TimeStamp`
FROM `characters_434`.`guild_eventlog` `ge` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `ge`.`guildid`;
	-- skip guild_finder_applicant.guildId
	-- skip guild_finder_guild_settings.guildId

INSERT INTO `guild_newslog` (`guildid`, `LogGuid`,`EventType`, `PlayerGuid`, `Flags`, `Value`, `TimeStamp`)
SELECT `gcm`.`target_guild_id`, `LogGuid`, `EventType`, 0, `Flags`, `Value`, `TimeStamp`
FROM `characters_434`.`guild_newslog` `gn` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `gn`.`guildid`;
	-- skip guild_old_member.guildId

INSERT INTO `guild_rank` (`guildid`, `rid`, `rname`, `rights`, `BankMoneyPerDay`)
SELECT `gcm`.`target_guild_id`, `rid`, `rname`, `rights`, `BankMoneyPerDay`
FROM `characters_434`.`guild_rank` `gr` JOIN `guild_character_map` `gcm` ON `gcm`.`source_guild_id` = `gr`.`guildid`;
    
-- INSERT item tables
	-- skip character_aura
	-- skip character_gifts

-- void storage may require a mapping table.
INSERT INTO `character_void_storage` (`itemId`, `playerGuid`, `itemEntry`, `slot`, `creatorGuid`, `randomProperty`, `suffixFactor`)
SELECT `icm`.`target_item_guid`, `icm`.`target_character_guid`, `itemEntry`, `cvs`.`slot`, 0, `randomProperty`, `suffixFactor` FROM `characters_434`.`character_void_storage` `cvs` JOIN `item_character_map` `icm` ON `icm`.`source_item_guid` = `cvs`.`itemId` AND `icm`.`source_character_guid` = `cvs`.`playerGuid`;
	-- skip mail_items

DROP TEMPORARY TABLE `character_account_map`;
DROP TEMPORARY TABLE `guild_character_map`;
DROP TEMPORARY TABLE `pet_character_map`;
DROP TEMPORARY TABLE `item_character_map`;
DROP TEMPORARY TABLE `item_guild_map`;
DROP TEMPORARY TABLE `mail_character_map`;