-- Correct low level class trainers.
-- No record of Drill Sergeant Steamcrank's text, so use warrior text that's generic.
set @warriorMenuId = 4645;
set @DrillSergeantSteamcrank = 42324;
update creature_template set gossip_menu_id = @warriorMenuId where entry = @DrillSergeantSteamcrank;

-- No record of Nekali's text, so use the only low level shaman text that seems to exist.
set @shamanMenuId = 10684;
set @Nekali = 38242;
update creature_template set gossip_menu_id = @shamanMenuId where entry = @Nekali;

-- Use generic NPC text for "Doc" Cogspin
set @greetingsText = 384;
set @DocCogspinMenu = 11617;
insert into gossip_menu (MenuId, TextId, VerifiedBuild) values (@DocCogspinMenu, @greetingsText, 0);

-- Insert gossip menu options to trainers with no options using generic text.
insert into gossip_menu_option
(MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcflag, VerifiedBuild)
values('14136','0','3','I require training.', '2756', '5', '16', '0'),
	('14137','0','3','I require training.', '2756', '5', '16', '0'),
	('14138','0','3','I require training.', '2756', '5', '16', '0'),
	('14139','0','3','I require training.', '2756', '5', '16', '0'),
	('14140','0','3','I require training.', '2756', '5', '16', '0'),
	('14141','0','3','I require training.', '2756', '5', '16', '0'),
	('10675','0','3','I require training.', '2756', '5', '16', '0'),
	('10685','0','3','I require training.', '2756', '5', '16', '0'),
	('10686','0','3','I require training.', '2756', '5', '16', '0'),
	('10694','0','3','I require training.', '2756', '5', '16', '0'),
	('10699','0','3','I require training.', '2756', '5', '16', '0'),
	('10698','0','3','I require training.', '2756', '5', '16', '0'),
	('10697','0','3','I require training.', '2756', '5', '16', '0'),
	('10879','0','3','I require training.', '2756', '5', '16', '0'),
	('10878','0','3','I require training.', '2756', '5', '16', '0'),
	('10985','0','3','I require training.', '2756', '5', '16', '0'),
	('11185','0','3','I require training.', '2756', '5', '16', '0'),
	('11617','0','3','I require training.', '2756', '5', '16', '0'),
	('11620','0','3','I require training.', '2756', '5', '16', '0'),
	('11621','0','3','I require training.', '2756', '5', '16', '0'),
	('11645','0','3','I require training.', '2756', '5', '16', '0'),
	('11810','0','3','I require training.', '2756', '5', '16', '0'),
	('11831','0','3','I require training.', '2756', '5', '16', '0');
	
-- Correct one of the mage trainers.
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 10683;

-- add gossip_menu_option_trainer records.
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4684, 0, 145),
	(14137, 0, 168),
	(4676, 0, 17),
--	(14140, 0, 17),
	(4655, 0, 32),
	(4643, 0, 32),
	(4692, 0, 127),
	(4679, 0, 127),
	(7263, 0, 145),
	(7522, 0, 134),
	(4652, 0, 134),
	(14141, 0, 15),
	(10675, 0, 15),
	(10697, 0, 15),
	(11185, 0, 15),
	(10686, 0, 17),
	(10699, 0, 17),
	(10985, 0, 17),
	(14140, 0, 17),
	(11621, 0, 17),
	(14139, 0, 127),
	(11617, 0, 127),
	(10879, 0, 134),
	(10878, 0, 44),
	(14136, 0, 44),
	(11620, 0, 44),
	(11810, 0, 44),
	(14138, 0, 32),
	(11645, 0, 32),
	(11831, 0, 32),
	(10702, 0, 32);
	
-- change three trainers to low level trainers.
update gossip_menu_option_trainer set TrainerId = 17 where MenuId = 85;
update gossip_menu_option_trainer set TrainerId = 127 where MenuId = 7349;
update gossip_menu_option_trainer set TrainerId = 127 where MenuId = 13921;

-- switch numerous trainers to low level gossip menus
-- warrior
update creature_template set gossip_menu_id = 7263 where entry = 43010;
-- paladin
update creature_template set gossip_menu_id = 4663 where entry = 16501;
-- hunter
update creature_template set gossip_menu_id = 4647 where entry = 16499;
-- rogue
update creature_template set gossip_menu_id = 6650 where entry = 3155;
update creature_template set gossip_menu_id = 6650 where entry = 15285;
-- priest
update creature_template set gossip_menu_id = 4679 where entry = 37724;
update creature_template set gossip_menu_id = 10685 where entry = 2123;
update creature_template set gossip_menu_id = 4679 where entry = 35870;
update creature_template set gossip_menu_id = 4679 where entry = 44468;
-- shaman
update creature_template set gossip_menu_id = 4652 where entry = 3062;
-- mage
update creature_template set gossip_menu_id = 10698 where entry = 16500;
-- warlock
update creature_template set gossip_menu_id = 10702 where entry = 36652;

-- Correct remaining class trainers
-- No record of Shernon the Footpad's or Marion Call's text, so use rogue text that's generic.
set @rogueMenuId = 436;
set @ShernonTheFootpad = 48615;
update creature_template set gossip_menu_id = @rogueMenuId where entry = @ShernonTheFootpad;
set @MarionCall = 39100;
update creature_template set gossip_menu_id = @priestMenuId where entry = @DedlowWormwood;

-- No record of Dark Cleric Claressa's text, so use priest text that's generic.
set @priestMenuId = 3645;
set @DarkClericClaressa = 48614;
update creature_template set gossip_menu_id = @priestMenuId where entry = @DarkClericClaressa;

-- No record of Dedlow Wormwood's text, so use rogue text that's generic.
set @hunterMenuId = 4101;
set @DedlowWormwood = 39100;
update creature_template set gossip_menu_id = @hunterMenuId where entry = @DedlowWormwood;

-- Update all Tauren Paladin trainers to new gossip_menu_id
set @SunwalkerGossip := 57020;
set @SunwalkerSaern := 8664;
set @SunwalkerReha := 43001;
set @SunwalkerIopi := 43013;
set @AponiBrightmane := 43795;
set @SunwalkerAtohmo := 44725;
set @SunwalkerLonaki := 50035;
update creature_template set gossip_menu_id = @SunwalkerGossip where entry in (
@SunwalkerSaern, @SunwalkerReha, @SunwalkerIopi, @AponiBrightmane, @SunwalkerAtohmo, @SunwalkerLonaki);

-- Update Rogue trainers to correct gossip_menu_id
set @Tannaria := 16279;
set @Zelanis := 16684;
set @Elara := 16685;
set @Nerisen := 16686;
set @PathstalkerRislar := 50147;
update creature_template set gossip_menu_id = 14140 where entry in (
@PathstalkerKariel, @Tannaria, @Zelanis, @Elara, @Nerisen, @PathstalkerRislar);

-- Insert gossip_menu for Tauren Paladin trainers with full spell list.
insert into gossip_menu
(MenuId, TextId, VerifiedBuild)
values (@SunwalkerGossip, 16490, 0);

-- Insert gossip menu options to trainers with no options using generic text.
insert into gossip_menu_option
(MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcflag, VerifiedBuild)
values ('11824','0','3','I require training.', '2756', '5', '16', '0'),
	('11906','0','3','I require training.', '2756', '5', '16', '0'),
	('4608','0','3','I require training.', '2756', '5', '16', '0'),
	(@SunwalkerGossip,'0','3','I would like to train.', '8221', '5', '16', '0'),
	(@SunwalkerGossip,'1','0','I wish to unlearn my talents.', '62295', '16', '16', '0'),
	(@SunwalkerGossip,'2','0','I wish to know about Dual Talent Specialization.', '33762', '20', '16', '0'),
	('14144','0','3','I require training.', '2756', '5', '16', '0'),
	('10555','0','3','I require training.', '2756', '5', '16', '0'),
	('11052','0','3','I require training.', '2756', '5', '16', '0'),
	('11045','0','3','I require training.', '2756', '5', '16', '0'),
	('10814','0','3','I require training.', '2756', '5', '16', '0'),
	('10549','0','3','I require training.', '2756', '5', '16', '0'),
	('10554','0','3','I require training.', '2756', '5', '16', '0'),
	('11051','0','3','I require training.', '2756', '5', '16', '0'),
	('10819','0','3','I require training.', '2756', '5', '16', '0'),
	('10553','0','3','I require training.', '2756', '5', '16', '0'),
	('11050','0','3','I require training.', '2756', '5', '16', '0'),
	('10818','0','3','I require training.', '2756', '5', '16', '0'),
	('11049','0','3','I require training.', '2756', '5', '16', '0'),
	('10551','0','3','I require training.', '2756', '5', '16', '0'),
	('10816','0','3','I require training.', '2756', '5', '16', '0'),
	('12572','0','3','I require training.', '2756', '5', '16', '0'),
	('10815','0','3','I require training.', '2756', '5', '16', '0'),
	('12576','0','3','I require training.', '2756', '5', '16', '0');
	
-- Correct one of the mage trainers.
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where OptionIcon = 3
and MenuId in (141, 11912, 11913, 12050, 4105, 11932, 12606, 10552, 10817, 11766);

-- add gossip_menu_option_trainer records.
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4683, 0, 16),
	(11052, 0, 16),
	(@SunwalkerGossip, 0, 164),
	(14144, 0, 40),
	(11045, 0, 40),
	(10814, 0, 40),
	(10549, 0, 40),
	(410, 0, 33),
	(10843, 0, 33),
	(10554, 0, 33),
	(11051, 0, 33),
	(10819, 0, 33),
	(7265, 0, 3),
	(4680, 0, 3),
	(10553, 0, 3),
	(4691, 0, 3),
	(11050, 0, 3),
	(10818, 0, 3),
	(4105, 0, 124),
	(7467, 0, 124),
-- 	(10838, 0, 124),
	(11049, 0, 124),
	(64, 0, 135),
	(6648, 0, 135),
	(10551, 0, 135),
	(10816, 0, 135),
	(12572, 0, 135),
	(4641, 0, 154),
	(11932, 0, 154),
	(4608, 0, 154),
	(4656, 0, 154),
	(10840, 0, 154);
	
-- change low level gossip_menu_option_trainer to standard class trainer.
update gossip_menu_option_trainer set TrainerId = 164 where MenuId = 6647;
update gossip_menu_option_trainer set TrainerId = 33 where MenuId = 14140;

-- change trainer type
update creature_template set trainer_class = 4 where entry = 16279;
	
-- switch numerous trainers to correct gossip menus.
-- gnome mage trainers
update creature_template set gossip_menu_id = 4554 where entry = 1228;
update creature_template set gossip_menu_id = 4554 where entry = 5144;
update creature_template set gossip_menu_id = 4554 where entry = 5145;

-- Undead rogue trainer
update creature_template set gossip_menu_id = 4540 where entry = 2130;

-- update Gilneans to standard class trainers.
update creature_template set gossip_menu_Id = 10835 where entry = 38467;
update creature_template set gossip_menu_id = 10838 where entry = 44468;
update creature_template set gossip_menu_id = 10834 where entry = 35873;

-- switch numerous trainers to standard class trainer gossip menus
-- warrior
update creature_template set gossip_menu_id = 14199 where entry = 3169;
update creature_template set gossip_menu_id = 14199 where entry = 17480;
-- paladin
-- update creature_template set gossip_menu_id =  where entry = ;