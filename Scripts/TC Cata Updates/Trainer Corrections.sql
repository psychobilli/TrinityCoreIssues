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
values('14136','0','3','I require training.', '2522', '5', '16', '0'),
	('14137','0','3','I require training.', '2522', '5', '16', '0'),
	('14138','0','3','I require training.', '2522', '5', '16', '0'),
	('14139','0','3','I require training.', '2522', '5', '16', '0'),
	('14140','0','3','I require training.', '2522', '5', '16', '0'),
	('14141','0','3','I require training.', '2522', '5', '16', '0'),
	('10675','0','3','I require training.', '2522', '5', '16', '0'),
	('10685','0','3','I require training.', '2522', '5', '16', '0'),
	('10686','0','3','I require training.', '2522', '5', '16', '0'),
	('10694','0','3','I require training.', '2522', '5', '16', '0'),
	('10699','0','3','I require training.', '2522', '5', '16', '0'),
	('10698','0','3','I require training.', '2522', '5', '16', '0'),
	('10697','0','3','I require training.', '2522', '5', '16', '0'),
	('10879','0','3','I require training.', '2522', '5', '16', '0'),
	('10878','0','3','I require training.', '2522', '5', '16', '0'),
	('10985','0','3','I require training.', '2522', '5', '16', '0'),
	('11185','0','3','I require training.', '2522', '5', '16', '0'),
	('11617','0','3','I require training.', '2522', '5', '16', '0'),
	('11620','0','3','I require training.', '2522', '5', '16', '0'),
	('11621','0','3','I require training.', '2522', '5', '16', '0'),
	('11645','0','3','I require training.', '2522', '5', '16', '0'),
	('11810','0','3','I require training.', '2522', '5', '16', '0'),
	('11831','0','3','I require training.', '2522', '5', '16', '0');
	
-- Correct one of the mage trainers.
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 10683;
	
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4684, 0, 145),
	(14137, 0, 168),
	(4676, 0, 17),
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
	(11831, 0, 32);
	
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
-- priest
update creature_template set gossip_menu_id = 4679 where entry = 37724;
update creature_template set gossip_menu_id = 10685 where entry = 2123;
update creature_template set gossip_menu_id = 4679 where entry = 35870;
-- shaman
update creature_template set gossip_menu_id = 4652 where entry = 3062;
-- mage
update creature_template set gossip_menu_id = 10698 where entry = 16500;