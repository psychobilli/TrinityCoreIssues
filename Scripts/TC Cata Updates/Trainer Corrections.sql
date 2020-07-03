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
	('10553','0','3','I require training.', '2756', '5', '16', '0'),
	('10819','0','3','I require training.', '2756', '5', '16', '0'),
	('10818','0','3','I require training.', '2756', '5', '16', '0'),
	('11050','0','3','I require training.', '2756', '5', '16', '0'),
	('11049','0','3','I require training.', '2756', '5', '16', '0'),
	('10551','0','3','I require training.', '2756', '5', '16', '0'),
	('10816','0','3','I require training.', '2756', '5', '16', '0'),
	('12572','0','3','I require training.', '2756', '5', '16', '0'),
	('10815','0','3','I require training.', '2756', '5', '16', '0'),
	('12576','0','3','I require training.', '2756', '5', '16', '0'),
	('12513','0','3','I require training.', '2756', '5', '16', '0'),
	('12523','0','3','I require training.', '2756', '5', '16', '0'),
	('12532','0','3','I require training.', '2756', '5', '16', '0'),
	('12533','0','3','I require training.', '2756', '5', '16', '0'),
	('12925','0','3','I require training.', '2756', '5', '16', '0'),
	('12926','0','3','I require training.', '2756', '5', '16', '0'),
	('12835','0','3','I require training.', '2756', '5', '16', '0'),
	('10835','0','3','I require training.', '2756', '5', '16', '0'),
	('12528','0','3','I require training.', '2756', '5', '16', '0'),
	('12535','0','3','I require training.', '2756', '5', '16', '0'),
	('12517','0','3','I require training.', '2756', '5', '16', '0'),
	('10843','0','3','I require training.', '2756', '5', '16', '0'),
	('12051','0','3','I require training.', '2756', '5', '16', '0'),
	('12524','0','3','I require training.', '2756', '5', '16', '0'),
	('12531','0','3','I require training.', '2756', '5', '16', '0'),
	('12536','0','3','I require training.', '2756', '5', '16', '0'),
	('12928','0','3','I require training.', '2756', '5', '16', '0'),
	('12543','0','3','I require training.', '2756', '5', '16', '0'),
	('12564','0','3','I require training.', '2756', '5', '16', '0'),
	('4560','0','3','I require training.', '2756', '5', '16', '0'),
	('12004','0','3','I require training.', '2756', '5', '16', '0'),
	('12841','0','3','I require training.', '2756', '5', '16', '0'),
	('11879','0','3','I require training.', '2756', '5', '16', '0'),
	('12049','0','3','I require training.', '2756', '5', '16', '0'),
	('12525','0','3','I require training.', '2756', '5', '16', '0'),
	('10702','0','3','I require training.', '2756', '5', '16', '0'),
	('12053','0','3','I require training.', '2756', '5', '16', '0'),
	('12526','0','3','I require training.', '2756', '5', '16', '0'),
	('12921','0','3','I require training.', '2756', '5', '16', '0'),
	('4602','0','3','I require training.', '2756', '5', '16', '0'),
	('12882','0','3','I require training.', '2756', '5', '16', '0'),
	('2522','0','3','I require training.', '2756', '5', '16', '0'),
	('12845','0','3','I require training.', '2756', '5', '16', '0'),
	('10373','0','3','I require training.', '2756', '5', '16', '0'),
	('11997','0','3','I require training.', '2756', '5', '16', '0');
	
-- Correct flags on numerous trainers.
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where OptionIcon = 3
and MenuId in (141, 11912, 11913, 12050, 4105, 11932, 12606, 10552, 10817, 11766, 11875, 12344, 12151,
	11879, 12048, 12341, 10838, 12010, 12537, 12714, 10684, 12052, 4555, 4553, 10837, 12918, 12716, 12521,
	12821, 12522, 12746, 12927, 12755);

-- add gossip_menu_option_trainer records.
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4683, 0, 16),
	(11052, 0, 16),
	(4526, 0, 16),
	(4525, 0, 16),
	(4527, 0, 16),
	(12513, 0, 16),
	(12523, 0, 16),
	(12532, 0, 16),
	(12533, 0, 16),
	(12925, 0, 16),
	(12533, 0, 16),
	(12513, 0, 16),
	(@SunwalkerGossip, 0, 164),
	(4662, 0, 164),
	(12516, 0, 164),
	(12527, 0, 164),
	(12926, 0, 164),
	(12516, 0, 164),
	(14144, 0, 40),
	(11045, 0, 40),
	(10814, 0, 40),
	(10549, 0, 40),
	(4092, 0, 40),
	(4138, 0, 40),
	(12835, 0, 40),
	(4694, 0, 40),
	(4674, 0, 40),
	(10835, 0, 40),
	(12528, 0, 40),
	(12535, 0, 40),
	(12924, 0, 40),
	(410, 0, 33),
	(10843, 0, 33),
	(10554, 0, 33),
	(11051, 0, 33),
	(10819, 0, 33),
	(12517, 0, 33),
	(12051, 0, 33),
	(12524, 0, 33),
	(12531, 0, 33),
	(12536, 0, 33),
	(12928, 0, 33),
	(12543, 0, 33),
	(12564, 0, 33),
	(7265, 0, 3),
	(4680, 0, 3),
	(10553, 0, 3),
	(4691, 0, 3),
	(11050, 0, 3),
	(10818, 0, 3),
	(4574, 0, 3),
	(4573, 0, 3),
	(4572, 0, 3),
	(4559, 0, 3),
	(4558, 0, 3),
	(4560, 0, 3),
	(4523, 0, 3),
	(3643, 0, 3),
	(4801, 0, 3),
	(3642, 0, 3),
	(12004, 0, 3),
	(12920, 0, 3),
	(12841, 0, 3),
	(4105, 0, 124),
	(7467, 0, 124),
	(11049, 0, 124),
	(4516, 0, 124),
	(4515, 0, 124),
	(5123, 0, 124),
	(11878, 0, 124),
	(12052, 0, 124),
	(64, 0, 135),
	(6648, 0, 135),
	(10551, 0, 135),
	(10816, 0, 135),
	(12572, 0, 135),
	(4534, 0, 135),
	(4536, 0, 135),
	(4535, 0, 135),
	(4539, 0, 135),
	(4538, 0, 135),
	(4537, 0, 135),
	(4553, 0, 135),
	(12049, 0, 135),
	(12233, 0, 135),
	(12525, 0, 135),
	(4641, 0, 154),
	(11932, 0, 154),
	(4608, 0, 154),
	(4656, 0, 154),
	(10840, 0, 154),
	(4603, 0, 154),
	(4604, 0, 154),
	(4609, 0, 154),
	(4610, 0, 154),
	(4504, 0, 154),
	(1522, 0, 154),
	(10702, 0, 154),
	(12053, 0, 154),
	(12821, 0, 154),
	(12526, 0, 154),
	(12921, 0, 154),
	(4602, 0, 154),
	(12882, 0, 154),
	(50723, 3, 154),
	(50729, 3, 154),
	(2522, 0, 154),
	(12845, 0, 154),
	(10373, 0, 39),
	(21228, 0, 39),
	(4646, 0, 39),
	(4687, 0, 39),
	(11997, 0, 39),
	(4607, 0, 39),
	(12755, 0, 39);
	
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
-- warrior generic gossips
update creature_template set gossip_menu_id = 14199 where entry = 3169;
update creature_template set gossip_menu_id = 14199 where entry = 17480;
update creature_template set gossip_menu_id = 4548 where entry = 4593;
update creature_template set gossip_menu_id = 4548 where entry = 4594;
update creature_template set gossip_menu_id = 4548 where entry = 4595;
update creature_template set gossip_menu_id = 4548 where entry = 49955;
-- paladin generic gossips
update creature_template set gossip_menu_id = 6647 where entry = 49954;
-- hunter generic gossips
update creature_template set gossip_menu_id = 4647 where entry = 39116;
update creature_template set gossip_menu_id = 4647 where entry = 49946;
-- rogue wotlk gossips
update creature_template set gossip_menu_id = 4542 where entry = 4582;
update creature_template set gossip_menu_id = 4540 where entry = 4583;
update creature_template set gossip_menu_id = 4541 where entry = 4584;
update creature_template set gossip_menu_id = 4562 where entry = 5166;
-- rogue generic gossips
update creature_template set gossip_menu_id = 436 where entry = 16759;
update creature_template set gossip_menu_id = 436 where entry = 49730;
update creature_template set gossip_menu_id = 436 where entry = 49909;
update creature_template set gossip_menu_id = 436 where entry = 49949;
update creature_template set gossip_menu_id = 436 where entry = 51998;
-- priest wotlk gossips
update creature_template set gossip_menu_id = 4544 where entry = 4606;
update creature_template set gossip_menu_id = 4543 where entry = 4607;
update creature_template set gossip_menu_id = 4543 where entry = 4608;
-- Sister Almyra gossips
update creature_template set gossip_menu_id = 10838 where entry = 38466;
-- priest generic gossips
update creature_template set gossip_menu_id = 4680 where entry = 49901;
update creature_template set gossip_menu_id = 4680 where entry = 49950;
-- mage wotlk gossips
update creature_template set gossip_menu_id = 4583 where entry = 4567;
update creature_template set gossip_menu_id = 4537 where entry = 4568;
update creature_template set gossip_menu_id = 63 where entry = 	23103;
-- mage generic gossips
update creature_template set gossip_menu_id = 14136 where entry = 49952;
update creature_template set gossip_menu_id = 14136 where entry = 50714;
update creature_template set gossip_menu_id = 14136 where entry = 50715;
update creature_template set gossip_menu_id = 14136 where entry = 50717;
update creature_template set gossip_menu_id = 14136 where entry = 50720;
-- warlock wotlk gossips
update creature_template set gossip_menu_id = 2383 where entry = 4563;
update creature_template set gossip_menu_id = 4609 where entry = 4564;
-- warlock generic gossips
update creature_template set gossip_menu_id = 4610 where entry = 49945;


-- Correct Profession Trainers

-- add missing gossip_menu_option for Alchemists.
insert into gossip_menu_option
(MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcflag)
values (4111, 0, 3, 'Train me in Alchemy.', 0, 5, 16),
	(4110, 0, 3, 'Train me in Alchemy.', 0, 5, 16),
	(4117, 0, 3, 'Train me in Alchemy.', 0, 5, 16),
	(8863, 0, 3, 'Train me in Alchemy.', 0, 5, 16);

-- add missing gossip_menu_option for Blacksmiths.
insert into gossip_menu_option
(MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcflag)
values (2741, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(2749, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(1043, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(1042, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(1041, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(3203, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(3202, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(8760, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(7809, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(9131, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(9132, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
	(8254, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16);

-- add missing gossip_menu_option for Enchanters.
insert into gossip_menu_option
(MenuId, OptionIndex, OptionIcon, OptionText, OptionBroadcastTextId, OptionType, OptionNpcflag)
values (4169, 0, 3, 'Train me in Enchanting.', 0, 5, 16),
	(4156, 0, 3, 'Train me in Enchanting.', 0, 5, 16),
	(4171, 0, 3, 'Train me in Enchanting.', 0, 5, 16),
	(4170, 0, 3, 'Train me in Enchanting.', 0, 5, 16);

-- correct trainer flags in gossip menu options
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where OptionIcon = 3
and MenuId in (4361, 4134, 4129, 4164)

-- add missing gossip_menu_option_trainer for Apprentice Blacksmiths
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (2746, 0, 80),
	(2741, 0, 80);

-- add missing gossip_menu_option_trainer for Apprentice Engineers
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4142, 0, 102),
	(7383, 0, 102);

-- add missing gossip_menu_option_trainer for Apprentice Leatherworkers
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (7430, 0, 103);

-- add missing gossip_menu_option_trainer for Herbalists.
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (7524, 1, 101),
	(7459, 0, 101),
	(10350, 0, 101);

-- add missing gossip_menu_option_trainer for Miners
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4361, 0, 49),
	(10351, 0, 49);

-- add missing gossip_menu_option_trainer for Skinners
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (7429, 0, 83)
	,(10360, 0, 83);
	
-- add missing gossip_menu_option_trainer for Illustrious Grand Master Alchemists
-- because the other alchemy spell lists are incomplete.
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4111, 0, 122),
	(7384, 0, 122),
	(4110, 0, 122),
	(4115, 0, 122),
	(2391, 0, 122),
	(2837, 0, 122),
	(4117, 0, 122),
	(16161, 0, 122),
	(8733, 0, 122),
	(8863, 0, 122),
	(10627, 0, 122);

-- add missing gossip_menu_option_trainer for High Level Blacksmithing
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (2781, 0, 58),
	(2783, 0, 58),
	(2749, 0, 58),
	(593, 0, 58),
	(597, 0, 58),
	(1043, 0, 58),
	(1042, 0, 58),
	(1041, 0, 58),
	(3203, 0, 58),
	(3202, 0, 58),
	(7256, 0, 58),
	(8760, 0, 58),
	(7809, 0, 58),
	(9131, 0, 58),
	(9132, 0, 58),
	(8254, 0, 58),
	(9459, 0, 58);

-- add missing gossip_menu_option_trainer for High Level Enchanters
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4169, 0, 63),
	(4156, 0, 63),
	(4166, 0, 63),
	(4171, 0, 63),
	(4170, 0, 63),
	(7524, 0, 63),
	(8731, 0, 63),
	(8866, 0, 63),
	(10365, 0, 63),
	(33676, 0, 63);

-- add missing gossip_menu_option_trainer for High Level Tailors
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (4261, 0, 163);

-- add missing gossip_menu_option_trainer for Riding Trainers
insert into gossip_menu_option_trainer
(MenuId, OptionIndex, TrainerId)
values (8553, 0, 386),
	(8275, 0, 386);

-- herbalism generic gossips
update creature_template set gossip_menu_Id = 7691 where entry = 908;
update creature_template set gossip_menu_Id = 7691 where entry = 1473;
update creature_template set gossip_menu_Id = 7691 where entry = 2114;
update creature_template set gossip_menu_Id = 7691 where entry = 2390;
update creature_template set gossip_menu_Id = 7691 where entry = 2856;
update creature_template set gossip_menu_Id = 7691 where entry = 3185;
update creature_template set gossip_menu_Id = 7691 where entry = 3604;
update creature_template set gossip_menu_Id = 7691 where entry = 3965;
update creature_template set gossip_menu_Id = 7691 where entry = 4898;
update creature_template set gossip_menu_Id = 7691 where entry = 5502;
update creature_template set gossip_menu_Id = 7691 where entry = 12025;
update creature_template set gossip_menu_Id = 7691 where entry = 17983;
update creature_template set gossip_menu_Id = 7691 where entry = 26994;
update creature_template set gossip_menu_Id = 7691 where entry = 26958;
update creature_template set gossip_menu_Id = 7691 where entry = 26974;
update creature_template set gossip_menu_Id = 7691 where entry = 28704;
-- mining wotlk gossips
update creature_template set gossip_menu_Id = 7690 where entry = 4598;
-- mining generic gossips
update creature_template set gossip_menu_Id = 7690 where entry = 3175;
update creature_template set gossip_menu_Id = 7690 where entry = 3555;
update creature_template set gossip_menu_Id = 7690 where entry = 6297;
update creature_template set gossip_menu_Id = 7690 where entry = 8128;
update creature_template set gossip_menu_Id = 7690 where entry = 1384;
update creature_template set gossip_menu_Id = 7690 where entry = 26999;
update creature_template set gossip_menu_Id = 7690 where entry = 26912;
update creature_template set gossip_menu_Id = 7690 where entry = 26962;
update creature_template set gossip_menu_Id = 7690 where entry = 26976;
update creature_template set gossip_menu_Id = 7690 where entry = 28698;
update creature_template set gossip_menu_Id = 7690 where entry = 52170;
update creature_template set gossip_menu_Id = 7690 where entry = 53409;
-- skinning generic gossips
update creature_template set gossip_menu_Id = 7842 where entry = 6287;
update creature_template set gossip_menu_Id = 7842 where entry = 6288;
update creature_template set gossip_menu_Id = 7842 where entry = 6289;
update creature_template set gossip_menu_Id = 7842 where entry = 6290;
update creature_template set gossip_menu_Id = 7842 where entry = 6291;
update creature_template set gossip_menu_Id = 7842 where entry = 6292;
update creature_template set gossip_menu_Id = 7842 where entry = 6295;
update creature_template set gossip_menu_Id = 7842 where entry = 6306;
update creature_template set gossip_menu_Id = 7842 where entry = 6387;
update creature_template set gossip_menu_Id = 7842 where entry = 7087;
update creature_template set gossip_menu_Id = 7842 where entry = 7088;
update creature_template set gossip_menu_Id = 7842 where entry = 7089;
update creature_template set gossip_menu_Id = 7842 where entry = 8144;
update creature_template set gossip_menu_Id = 7842 where entry = 12030;
update creature_template set gossip_menu_Id = 7842 where entry = 16273;
update creature_template set gossip_menu_Id = 7842 where entry = 27000;
update creature_template set gossip_menu_Id = 7842 where entry = 26913;
update creature_template set gossip_menu_Id = 7842 where entry = 26963;
update creature_template set gossip_menu_Id = 7842 where entry = 26986;
update creature_template set gossip_menu_Id = 7842 where entry = 28696;
update creature_template set gossip_menu_Id = 7842 where entry = 44782;
update creature_template set gossip_menu_Id = 7842 where entry = 53437;
-- alchemy generic gossips
update creature_template set gossip_menu_Id = 10359 where entry = 7690;
update creature_template set gossip_menu_Id = 10359 where entry = 3184;
update creature_template set gossip_menu_Id = 10359 where entry = 26987;
update creature_template set gossip_menu_Id = 10359 where entry = 26903;
update creature_template set gossip_menu_Id = 10359 where entry = 26951;
update creature_template set gossip_menu_Id = 10359 where entry = 26975;
update creature_template set gossip_menu_Id = 10359 where entry = 27023;
update creature_template set gossip_menu_Id = 10359 where entry = 27029;
update creature_template set gossip_menu_Id = 10359 where entry = 33588;
-- blacksmithing wotlk gossips
update creature_template set gossip_menu_Id = 1022 where entry = 4596;
-- blacksmithing generic gossips
update creature_template set gossip_menu_Id = 8521 where entry = 4888;
update creature_template set gossip_menu_Id = 8521 where entry = 16724;
update creature_template set gossip_menu_Id = 8521 where entry = 26988;
update creature_template set gossip_menu_Id = 8521 where entry = 26904;
update creature_template set gossip_menu_Id = 8521 where entry = 26924;
update creature_template set gossip_menu_Id = 8521 where entry = 26981;
update creature_template set gossip_menu_Id = 8521 where entry = 27034;
update creature_template set gossip_menu_Id = 8521 where entry = 28694;
update creature_template set gossip_menu_Id = 8521 where entry = 29505;
update creature_template set gossip_menu_Id = 8521 where entry = 29506;
update creature_template set gossip_menu_Id = 8521 where entry = 29924;
update creature_template set gossip_menu_Id = 8521 where entry = 33591;
update creature_template set gossip_menu_Id = 8521 where entry = 37072;
update creature_template set gossip_menu_Id = 8521 where entry = 45548;
update creature_template set gossip_menu_Id = 8521 where entry = 55684;
-- enchanting generic gossips
update creature_template set gossip_menu_Id = 8866 where entry = 19251;
update creature_template set gossip_menu_Id = 8866 where entry = 26990;
update creature_template set gossip_menu_Id = 8866 where entry = 26906;
update creature_template set gossip_menu_Id = 8866 where entry = 26954;
update creature_template set gossip_menu_Id = 8866 where entry = 26980;
update creature_template set gossip_menu_Id = 8866 where entry = 28693;
update creature_template set gossip_menu_Id = 8866 where entry = 33583;
-- correct cooking trainer entry
update creature_template set gossip_menu_Id = 5853 where entry = 6286;
-- correct leatherworking trainer entry
update creature_template set gossip_menu_Id = 4242 where entry = 16278;
-- remove the repairer mouseover
update creature_template set npcflag = 80 where entry = 16278;
-- correct a mount trainer npcflag
update creature_template set npcflag = 81 where entry = 3175;
-- correct a mount trainer npcflag
update creature_template set npcflag = 83 where entry = 16280;

-- correct the profession trainers
-- correct types and flags on training gossips for initial menu.
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12180 and OptionIndex between 0 and 10;
-- add trainers to gossips for initial menu
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12180, 2, 51),
(12180, 3, 102),
(12180, 5, 63),
(12180, 6, 48),
(12180, 10, 117);
-- change the initial alchmey trainer to one with the full spell list.
update gossip_menu_option_trainer set TrainerId = 122 where MenuId = 12180 and OptionIndex = 0;

-- correct types and flags on training gossips under "Tell me about gathering professions"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12185 and OptionIndex between 0 and 10;
-- add trainer options for the conditional training options under "Tell me about gathering professions"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12185, 0, 122), -- alchemy
	(12185, 1, 80), -- blacksmithing
	(12185, 2, 51), -- enchanting
	(12185, 3, 102), -- engineering
	(12185, 4, 388), -- herbalism
	(12185, 5, 63), -- inscription
	(12185, 6, 48), -- jewelcrafting
	(12185, 7, 103), -- leatherworking
	(12185, 8, 389), -- mining
	(12185, 9, 390), -- skinning
	(12185, 10, 117); -- tailoring
	
-- correct types and flags on training gossips under "Tell me about Herbalism"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12188 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Herbalism"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12188, 0, 122), -- alchemy
	(12188, 1, 80), -- blacksmithing
	(12188, 2, 51), -- enchanting
	(12188, 3, 102), -- engineering
	(12188, 4, 388), -- herbalism
	(12188, 5, 63), -- inscription
	(12188, 6, 48), -- jewelcrafting
	(12188, 7, 103), -- leatherworking
	(12188, 8, 389), -- mining
	(12188, 9, 390), -- skinning
	(12188, 10, 117); -- tailoring
	
-- correct types and flags on training gossips under "Tell me about Mining"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12189 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Mining"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12189, 0, 122), -- alchemy
	(12189, 1, 80), -- blacksmithing
	(12189, 2, 51), -- enchanting
	(12189, 3, 102), -- engineering
	(12189, 4, 388), -- herbalism
	(12189, 5, 63), -- inscription
	(12189, 6, 48), -- jewelcrafting
	(12189, 7, 103), -- leatherworking
	(12189, 8, 389), -- mining
	(12189, 9, 390), -- skinning
	(12189, 10, 117); -- tailoring
	
-- correct types and flags on training gossips under "Tell me about Skinning"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12190 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Skinning"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12190, 0, 122), -- alchemy
	(12190, 1, 80), -- blacksmithing
	(12190, 2, 51), -- enchanting
	(12190, 3, 102), -- engineering
	(12190, 4, 388), -- herbalism
	(12190, 5, 63), -- inscription
	(12190, 6, 48), -- jewelcrafting
	(12190, 7, 103), -- leatherworking
	(12190, 8, 389), -- mining
	(12190, 9, 390), -- skinning
	(12190, 10, 117); -- tailoring
	
-- correct types and flags on training gossips under "Tell me about production professions"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12186 and OptionIndex between 0 and 10;
-- add trainer options for the conditional training options under "Tell me about production professions"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12186, 0, 122), -- alchemy
	(12186, 1, 80), -- blacksmithing
	(12186, 2, 51), -- enchanting
	(12186, 3, 102), -- engineering
	(12186, 4, 388), -- herbalism
	(12186, 5, 63), -- inscription
	(12186, 6, 48), -- jewelcrafting
	(12186, 7, 103), -- leatherworking
	(12186, 8, 389), -- mining
	(12186, 9, 390), -- skinning
	(12186, 10, 117); -- tailoring

-- correct types and flags on training gossips under "Tell me about Alchemy"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12191 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Alchemy"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12191, 0, 122), -- alchemy
	(12191, 1, 80), -- blacksmithing
	(12191, 2, 51), -- enchanting
	(12191, 3, 102), -- engineering
	(12191, 4, 388), -- herbalism
	(12191, 5, 63), -- inscription
	(12191, 6, 48), -- jewelcrafting
	(12191, 7, 103), -- leatherworking
	(12191, 8, 389), -- mining
	(12191, 9, 390), -- skinning
	(12191, 10, 117); -- tailoring
-- change the alchmey trainer to one with the full spell list.
update gossip_menu_option_trainer set TrainerId = 122 where MenuId = 12191 and OptionIndex = 11;

-- correct types and flags on training gossips under "Tell me about Blacksmithing"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12192 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Blacksmithing"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12192, 1, 80), -- blacksmithing
	(12192, 2, 51), -- enchanting
	(12192, 3, 102), -- engineering
	(12192, 4, 388), -- herbalism
	(12192, 5, 63), -- inscription
	(12192, 6, 48), -- jewelcrafting
	(12192, 7, 103), -- leatherworking
	(12192, 8, 389), -- mining
	(12192, 9, 390), -- skinning
	(12192, 10, 117); -- tailoring
-- change the alchmey trainer to one with the full spell list.
update gossip_menu_option_trainer set TrainerId = 122 where MenuId = 12192 and OptionIndex = 0;

-- correct types and flags on training gossips under "Tell me about Enchanting"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12193 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Enchanting"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12193, 1, 80), -- blacksmithing
	(12193, 2, 51), -- enchanting
	(12193, 3, 102), -- engineering
	(12193, 4, 388), -- herbalism
	(12193, 5, 63), -- inscription
	(12193, 6, 48), -- jewelcrafting
	(12193, 7, 103), -- leatherworking
	(12193, 8, 389), -- mining
	(12193, 9, 390), -- skinning
	(12193, 10, 117); -- tailoring

-- correct types and flags on training gossips under "Tell me about Engineering"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12195 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Engineering"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12195, 1, 80), -- blacksmithing
	(12195, 2, 51), -- enchanting
	(12195, 3, 102), -- engineering
	(12195, 4, 388), -- herbalism
	(12195, 5, 63), -- inscription
	(12195, 6, 48), -- jewelcrafting
	(12195, 7, 103), -- leatherworking
	(12195, 8, 389), -- mining
	(12195, 9, 390), -- skinning
	(12195, 10, 117); -- tailoring

-- correct types and flags on training gossips under "Tell me about Inscription"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12196 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Inscription"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12196, 1, 80), -- blacksmithing
	(12196, 2, 51), -- enchanting
	(12196, 3, 102), -- engineering
	(12196, 4, 388), -- herbalism
	(12196, 5, 63), -- inscription
	(12196, 6, 48), -- jewelcrafting
	(12196, 7, 103), -- leatherworking
	(12196, 8, 389), -- mining
	(12196, 9, 390), -- skinning
	(12196, 10, 117), -- tailoring
	(12196, 11, 63); -- inscription 

-- correct types and flags on training gossips under "Tell me about Jewelcrafting"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12197 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Jewelcrafting"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12197, 1, 80), -- blacksmithing
	(12197, 2, 51), -- enchanting
	(12197, 3, 102), -- engineering
	(12197, 4, 388), -- herbalism
	(12197, 5, 63), -- inscription
	(12197, 6, 48), -- jewelcrafting
	(12197, 7, 103), -- leatherworking
	(12197, 8, 389), -- mining
	(12197, 9, 390), -- skinning
	(12197, 10, 117); -- tailoring

-- correct types and flags on training gossips under "Tell me about Leatherworking"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12198 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Leatherworking"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12198, 1, 80), -- blacksmithing
	(12198, 2, 51), -- enchanting
	(12198, 3, 102), -- engineering
	(12198, 4, 388), -- herbalism
	(12198, 5, 63), -- inscription
	(12198, 6, 48), -- jewelcrafting
	(12198, 7, 103), -- leatherworking
	(12198, 8, 389), -- mining
	(12198, 9, 390), -- skinning
	(12198, 10, 117); -- tailoring

-- correct types and flags on training gossips under "Tell me about Tailoring"
update gossip_menu_option set OptionType = 5, OptionNpcflag = 16 where MenuId = 12199 and OptionIndex between 0 and 11;
-- add trainer options for the conditional training options under "Tell me about Tailoring"
insert into gossip_menu_option_trainer (MenuId, OptionIndex, TrainerId)
values (12199, 1, 80), -- blacksmithing
	(12199, 2, 51), -- enchanting
	(12199, 3, 102), -- engineering
	(12199, 4, 388), -- herbalism
	(12199, 5, 63), -- inscription
	(12199, 6, 48), -- jewelcrafting
	(12199, 7, 103), -- leatherworking
	(12199, 8, 389), -- mining
	(12199, 9, 390), -- skinning
	(12199, 10, 117); -- tailoring
	
-- correct a few innkeepers
update gossip_menu_option set OptionType = 8, OptionNpcflag = 65536 where MenuId = 1297 and OptionIndex = 1;
update gossip_menu_option set OptionType = 3, OptionNpcflag = 128 where MenuId = 1297 and OptionIndex = 2;
insert into gossip_menu_option_action (MenuId, OptionIndex, ActionMenuId, ActionPoiId) values (1297, 0, 1221, 0);
update gossip_menu_option set OptionType = 1, OptionNpcflag = 1 where MenuId = 1293 and OptionIndex = 0;
update gossip_menu_option set OptionType = 8, OptionNpcflag = 65536 where MenuId = 1293 and OptionIndex = 1;
update gossip_menu_option set OptionType = 3, OptionNpcflag = 128 where MenuId = 1293 and OptionIndex = 2;
insert into gossip_menu_option_action (MenuId, OptionIndex, ActionMenuId, ActionPoiId) values (1293, 0, 1221, 0);
update gossip_menu_option set OptionIcon = 0, OptionText = 'What can I do at an inn?', OptionBroadcastTextId = 4308
where MenuId = 1294 and OptionIndex = 2;
update gossip_menu_option set OptionIcon = 0, OptionText = 'What can I do at an inn?', OptionBroadcastTextId = 4308
where MenuId = 7468 and OptionIndex = 2;