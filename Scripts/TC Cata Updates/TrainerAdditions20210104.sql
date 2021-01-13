-- Insert gossip menu options to low level trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (14137,14141,14140,13921,10879,14136,10878,11620,11810,14138,11645,11831,10702,10675,11185,10686,10985,11621,14139,11617);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(14137,0,3,'I require training.', 2756, 5, 16, 0),
(14137,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14137,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14141,0,3,'I require training.', 2756, 5, 16, 0),
(14141,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14141,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14140,0,3,'I require training.', 2756, 5, 16, 0),
(14140,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14140,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(13921,0,3,'I require training.', 2756, 5, 16, 0),
(13921,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(13921,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10879,0,3,'I require training.', 2756, 5, 16, 0),
(10879,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10879,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14136,0,3,'I require training.', 2756, 5, 16, 0),
(14136,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14136,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10878,0,3,'I require training.', 2756, 5, 16, 0),
(10878,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10878,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11620,0,3,'I require training.', 2756, 5, 16, 0),
(11620,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11620,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11810,0,3,'I require training.', 2756, 5, 16, 0),
(11810,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11810,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14138,0,3,'I require training.', 2756, 5, 16, 0),
(14138,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14138,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11645,0,3,'I require training.', 2756, 5, 16, 0),
(11645,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11645,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11831,0,3,'I require training.', 2756, 5, 16, 0),
(11831,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11831,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10702,0,3,'I require training.', 2756, 5, 16, 0),
(10702,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10702,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10675,0,3,'I require training.', 2756, 5, 16, 0),
(10675,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10675,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11185,0,3,'I require training.', 2756, 5, 16, 0),
(11185,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11185,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10686,0,3,'I require training.', 2756, 5, 16, 0),
(10686,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10686,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10985,0,3,'I require training.', 2756, 5, 16, 0),
(10985,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10985,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11621,0,3,'I require training.', 2756, 5, 16, 0),
(11621,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11621,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14139,0,3,'I require training.', 2756, 5, 16, 0),
(14139,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14139,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11617,0,3,'I require training.', 2756, 5, 16, 0),
(11617,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11617,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- update creature_template.gossip_menu_id when value is 0

-- gnome warrior
UPDATE `creature_template` SET `gossip_menu_id` = 4645 WHERE `entry` = 42324;
-- troll shaman
UPDATE `creature_template` SET `gossip_menu_id` = 10684 WHERE `entry` = 38242;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4645 WHERE `CreatureId` = 42324;
UPDATE `creature_trainer` SET `MenuId` = 10684 WHERE `CreatureId` = 38242;

-- Insert gossip menu options to warrior trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (11052,12513,12532,12533,12925);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(11052,0,3,'I require training.', 2756, 5, 16, 0),
(11052,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11052,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12513,0,3,'I require training.', 2756, 5, 16, 0),
(12513,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12513,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12532,0,3,'I require training.', 2756, 5, 16, 0),
(12532,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12532,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12533,0,3,'I require training.', 2756, 5, 16, 0),
(12533,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12533,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12925,0,3,'I require training.', 2756, 5, 16, 0),
(12925,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12925,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- warrior wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4548 WHERE `entry` = 4593;
UPDATE `creature_template` SET `gossip_menu_id` = 4546 WHERE `entry` = 4594;
UPDATE `creature_template` SET `gossip_menu_id` = 4547 WHERE `entry` = 4595;
-- warrior generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4548 WHERE `entry` = 49955;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4548 WHERE `CreatureId` = 4593;
UPDATE `creature_trainer` SET `MenuId` = 4546 WHERE `CreatureId` = 4594;
UPDATE `creature_trainer` SET `MenuId` = 4547 WHERE `CreatureId` = 4595;
UPDATE `creature_trainer` SET `MenuId` = 4548 WHERE `CreatureId` = 49955;

-- Insert gossip menu options to paladin trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (12926);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(12926,0,3,'I require training.', 2756, 5, 16, 0),
(12926,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12926,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- paladin generic gossip
UPDATE `creature_template` SET `gossip_menu_id` = 6647 WHERE `entry` = 49954;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 6647 WHERE `CreatureId` = 49954;

-- Insert gossip menu options to hunter trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (14144,10549,10814,11045,10697,12528,12535,12924);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(14144,0,3,'I require training.', 2756, 5, 16, 0),
(14144,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14144,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10549,0,3,'I require training.', 2756, 5, 16, 0),
(10549,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10549,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10814,0,3,'I require training.', 2756, 5, 16, 0),
(10814,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10814,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11045,0,3,'I require training.', 2756, 5, 16, 0),
(11045,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11045,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10697,0,3,'I require training.', 2756, 5, 16, 0),
(10697,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10697,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12528,0,3,'I require training.', 2756, 5, 16, 0),
(12528,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12528,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12535,0,3,'I require training.', 2756, 5, 16, 0),
(12535,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12535,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12924,0,3,'I require training.', 2756, 5, 16, 0),
(12924,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12924,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- hunter generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4647 WHERE `entry` = 38467;
UPDATE `creature_template` SET `gossip_menu_id` = 4647 WHERE `entry` = 39100;
UPDATE `creature_template` SET `gossip_menu_id` = 4647 WHERE `entry` = 39116;
UPDATE `creature_template` SET `gossip_menu_id` = 4647 WHERE `entry` = 49946;
UPDATE `creature_template` SET `gossip_menu_id` = 4647 WHERE `entry` = 50609;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4647 WHERE `CreatureId` = 38467;
UPDATE `creature_trainer` SET `MenuId` = 4647 WHERE `CreatureId` = 39100;
UPDATE `creature_trainer` SET `MenuId` = 4647 WHERE `CreatureId` = 39116;
UPDATE `creature_trainer` SET `MenuId` = 4647 WHERE `CreatureId` = 49946;
UPDATE `creature_trainer` SET `MenuId` = 4647 WHERE `CreatureId` = 50609;

-- Insert gossip menu options to rogue trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (12517,10554,10819,10843,11051,10699,12051,12524,12531,12536,12928,12543,12564);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(12517,0,3,'I require training.', 2756, 5, 16, 0),
(12517,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12517,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10554,0,3,'I require training.', 2756, 5, 16, 0),
(10554,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10554,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10819,0,3,'I require training.', 2756, 5, 16, 0),
(10819,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10819,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10843,0,3,'I require training.', 2756, 5, 16, 0),
(10843,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10843,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11051,0,3,'I require training.', 2756, 5, 16, 0),
(11051,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11051,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10699,0,3,'I require training.', 2756, 5, 16, 0),
(10699,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10699,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12051,0,3,'I require training.', 2756, 5, 16, 0),
(12051,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12051,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12524,0,3,'I require training.', 2756, 5, 16, 0),
(12524,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12524,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12531,0,3,'I require training.', 2756, 5, 16, 0),
(12531,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12531,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12536,0,3,'I require training.', 2756, 5, 16, 0),
(12536,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12536,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12928,0,3,'I require training.', 2756, 5, 16, 0),
(12928,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12928,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12543,0,3,'I require training.', 2756, 5, 16, 0),
(12543,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12543,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12564,0,3,'I require training.', 2756, 5, 16, 0),
(12564,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12564,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);
 
-- rogue wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 85 WHERE `entry` = 2130;
UPDATE `creature_template` SET `gossip_menu_id` = 4542 WHERE `entry` = 4582;
UPDATE `creature_template` SET `gossip_menu_id` = 4540 WHERE `entry` = 4583;
UPDATE `creature_template` SET `gossip_menu_id` = 4541 WHERE `entry` = 4584;
UPDATE `creature_template` SET `gossip_menu_id` = 4562 WHERE `entry` = 5166;
-- rogue generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 436 WHERE `entry` = 48615;
UPDATE `creature_template` SET `gossip_menu_id` = 436 WHERE `entry` = 49909;
UPDATE `creature_template` SET `gossip_menu_id` = 436 WHERE `entry` = 49949;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 85 WHERE `CreatureId` = 2130;
UPDATE `creature_trainer` SET `MenuId` = 4542 WHERE `CreatureId` = 4582;
UPDATE `creature_trainer` SET `MenuId` = 4540 WHERE `CreatureId` = 4583;
UPDATE `creature_trainer` SET `MenuId` = 4541 WHERE `CreatureId` = 4584;
UPDATE `creature_trainer` SET `MenuId` = 4562 WHERE `CreatureId` = 5166;
UPDATE `creature_trainer` SET `MenuId` = 436 WHERE `CreatureId` = 48615;
UPDATE `creature_trainer` SET `MenuId` = 436 WHERE `CreatureId` = 49909;
UPDATE `creature_trainer` SET `MenuId` = 436 WHERE `CreatureId` = 49949;

-- Insert gossip menu options to priest trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (4560,10553,10818,11050,12004,12841);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4560,0,3,'I require training.', 2756, 5, 16, 0),
(4560,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(4560,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10553,0,3,'I require training.', 2756, 5, 16, 0),
(10553,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10553,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10818,0,3,'I require training.', 2756, 5, 16, 0),
(10818,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10818,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11050,0,3,'I require training.', 2756, 5, 16, 0),
(11050,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11050,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12004,0,3,'I require training.', 2756, 5, 16, 0),
(12004,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12004,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12841,0,3,'I require training.', 2756, 5, 16, 0),
(12841,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12841,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- priest wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4544 WHERE `entry` = 4606;
UPDATE `creature_template` SET `gossip_menu_id` = 4545 WHERE `entry` = 4607;
-- Sister Almyra gossips
UPDATE `creature_template` SET `gossip_menu_id` = 10838 WHERE `entry` = 38466;
-- priest generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4680 WHERE `entry` = 4608;
UPDATE `creature_template` SET `gossip_menu_id` = 4680 WHERE `entry` = 48614;
UPDATE `creature_template` SET `gossip_menu_id` = 4680 WHERE `entry` = 49901;
UPDATE `creature_template` SET `gossip_menu_id` = 4680 WHERE `entry` = 49950;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4544 WHERE `CreatureId` = 4606;
UPDATE `creature_trainer` SET `MenuId` = 4545 WHERE `CreatureId` = 4607;
UPDATE `creature_trainer` SET `MenuId` = 10838 WHERE `CreatureId` = 38466;
UPDATE `creature_trainer` SET `MenuId` = 4680 WHERE `CreatureId` = 4608;
UPDATE `creature_trainer` SET `MenuId` = 4680 WHERE `CreatureId` = 48614;
UPDATE `creature_trainer` SET `MenuId` = 4680 WHERE `CreatureId` = 49901;
UPDATE `creature_trainer` SET `MenuId` = 4680 WHERE `CreatureId` = 49950;

-- Insert gossip menu options to shaman trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (11049);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(11049,0,3,'I require training.', 2756, 5, 16, 0),
(11049,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11049,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);
 
-- Insert gossip menu options to mage trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (10551,10816,12572,12049,12525);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10551,0,3,'I require training.', 2756, 5, 16, 0),
(10551,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10551,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10816,0,3,'I require training.', 2756, 5, 16, 0),
(10816,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10816,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12572,0,3,'I require training.', 2756, 5, 16, 0),
(12572,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12572,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12049,0,3,'I require training.', 2756, 5, 16, 0),
(12049,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12049,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12525,0,3,'I require training.', 2756, 5, 16, 0),
(12525,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12525,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- mage wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4537 WHERE `entry` = 4568;
UPDATE `creature_template` SET `gossip_menu_id` = 63 WHERE `entry` = 23103;
-- mage generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4485 WHERE `entry` = 4567;
UPDATE `creature_template` SET `gossip_menu_id` = 4485 WHERE `entry` = 49952;
UPDATE `creature_template` SET `gossip_menu_id` = 4485 WHERE `entry` = 50714;
UPDATE `creature_template` SET `gossip_menu_id` = 4485 WHERE `entry` = 50715;
UPDATE `creature_template` SET `gossip_menu_id` = 4485 WHERE `entry` = 50717;
UPDATE `creature_template` SET `gossip_menu_id` = 4485 WHERE `entry` = 50720;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4537 WHERE `CreatureId` = 4568;
UPDATE `creature_trainer` SET `MenuId` = 63 WHERE `CreatureId` = 23103;
UPDATE `creature_trainer` SET `MenuId` = 4485 WHERE `CreatureId` = 4567;
UPDATE `creature_trainer` SET `MenuId` = 4485 WHERE `CreatureId` = 49952;
UPDATE `creature_trainer` SET `MenuId` = 4485 WHERE `CreatureId` = 50714;
UPDATE `creature_trainer` SET `MenuId` = 4485 WHERE `CreatureId` = 50715;
UPDATE `creature_trainer` SET `MenuId` = 4485 WHERE `CreatureId` = 50717;
UPDATE `creature_trainer` SET `MenuId` = 4485 WHERE `CreatureId` = 50720;

-- Insert gossip menu options to warlock trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (10840,12053,4608,12526,12921,4602,12882,12845);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10840,0,3,'I require training.', 2756, 5, 16, 0),
(10840,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10840,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12053,0,3,'I require training.', 2756, 5, 16, 0),
(12053,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12053,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(4608,0,3,'I require training.', 2756, 5, 16, 0),
(4608,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(4608,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12526,0,3,'I require training.', 2756, 5, 16, 0),
(12526,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12526,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12921,0,3,'I require training.', 2756, 5, 16, 0),
(12921,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12921,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(4602,0,3,'I require training.', 2756, 5, 16, 0),
(4602,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(4602,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12882,0,3,'I require training.', 2756, 5, 16, 0),
(12882,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12882,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12845,0,3,'I require training.', 2756, 5, 16, 0),
(12845,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12845,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- warlock wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 2383 WHERE `entry` = 4563;
UPDATE `creature_template` SET `gossip_menu_id` = 4609 WHERE `entry` = 4564;
-- warlock generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4610 WHERE `entry` = 49945;
UPDATE `creature_template` SET `gossip_menu_id` = 4610 WHERE `entry` = 50723;
UPDATE `creature_template` SET `gossip_menu_id` = 4610 WHERE `entry` = 50729;
UPDATE `creature_template` SET `gossip_menu_id` = 2384 WHERE `entry` = 50732;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 2383 WHERE `CreatureId` = 4563;
UPDATE `creature_trainer` SET `MenuId` = 4609 WHERE `CreatureId` = 4564;
UPDATE `creature_trainer` SET `MenuId` = 4610 WHERE `CreatureId` = 49945;
UPDATE `creature_trainer` SET `MenuId` = 4610 WHERE `CreatureId` = 50723;
UPDATE `creature_trainer` SET `MenuId` = 4610 WHERE `CreatureId` = 50729;
UPDATE `creature_trainer` SET `MenuId` = 2384 WHERE `CreatureId` = 50732;

-- Insert gossip menu options to druid trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (10373,11997);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10373,0,3,'I require training.', 2756, 5, 16, 0),
(10373,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10373,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11997,0,3,'I require training.', 2756, 5, 16, 0),
(11997,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11997,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- druid generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4605 WHERE `entry` = 44726;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4605 WHERE `CreatureId` = 44726;

-- Insert gossip menu options to horde portal trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (11972);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(11972,0,3,'I require training.', 2756, 5, 16, 0);
 
-- herbalism generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 908;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 1473;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 2114;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 2390;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 2856;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 3185;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 3604;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 3965;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 4898;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 12025;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 17983;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 26910;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 26958;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 26974;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 26994;
UPDATE `creature_template` SET `gossip_menu_id` = 7691 WHERE `entry` = 28704;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 908;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 1473;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 2114;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 2390;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 2856;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 3185;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 3604;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 3965;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 4898;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 12025;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 17983;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 26910;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 26958;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 26974;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 26994;
UPDATE `creature_trainer` SET `MenuId` = 7691 WHERE `CreatureId` = 28704;

-- mining wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 4598;
-- mining generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 3175;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 3555;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 8128;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 26912;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 26962;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 26976;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 26999;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 28698;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 52170;
UPDATE `creature_template` SET `gossip_menu_id` = 7690 WHERE `entry` = 53409;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 4598;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 3175;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 3555;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 8128;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 26912;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 26962;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 26976;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 26999;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 28698;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 52170;
UPDATE `creature_trainer` SET `MenuId` = 7690 WHERE `CreatureId` = 53409;

-- skinning generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6287;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6288;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6289;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6290;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6291;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6292;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6295;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6306;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 6387;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 7087;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 7088;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 7089;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 8144;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 12030;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 16273;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 26913;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 26963;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 26986;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 27000;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 28696;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 44782;
UPDATE `creature_template` SET `gossip_menu_id` = 7842 WHERE `entry` = 53437;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6287;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6288;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6289;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6290;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6291;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6292;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6295;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6306;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 6387;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 7087;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 7088;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 7089;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 8144;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 12030;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 16273;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 26913;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 26963;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 26986;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 27000;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 28696;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 44782;
UPDATE `creature_trainer` SET `MenuId` = 7842 WHERE `CreatureId` = 53437;

-- Insert gossip menu options to alchemy trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4110,4117,8863);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4110,0,3,'Train me.', 3266, 5, 16, 0),
(4117,0,3,'Train me.', 3266, 5, 16, 0),
(8863,0,3,'Train me.', 3266, 5, 16, 0);

-- alchemy generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 2132;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 3184;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 3603;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 26903;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 26951;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 26975;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 26987;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 27023;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 27029;
UPDATE `creature_template` SET `gossip_menu_id` = 10359 WHERE `entry` = 33588;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 2132;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 3184;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 3603;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 26903;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 26951;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 26975;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 26987;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 27023;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 27029;
UPDATE `creature_trainer` SET `MenuId` = 10359 WHERE `CreatureId` = 33588;

-- Insert gossip menu options to blacksmithing trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (2749,2743,1041,9131,9132,8254,8760,7809);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(2749,0,3,'Train me.', 3266, 5, 16, 0),
(2743,0,3,'Train me.', 3266, 5, 16, 0),
(1041,0,3,'Train me.', 3266, 5, 16, 0),
(9131,0,3,'Train me.', 3266, 5, 16, 0),
(9132,0,3,'Train me.', 3266, 5, 16, 0),
(8254,0,3,'Train me.', 3266, 5, 16, 0),
(8760,0,3,'Train me.', 3266, 5, 16, 0),
(7809,0,3,'Train me.', 3266, 5, 16, 0);

-- blacksmithing wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 1022 WHERE `entry` = 4596;
UPDATE `creature_template` SET `gossip_menu_id` = 1022 WHERE `entry` = 26952;
-- blacksmithing generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 4258;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 4888;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 5164;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 7230;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 7231;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 11146;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 11177;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 11178;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 16724;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 26904;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 26981;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 26988;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 27034;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 28694;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 29505;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 29506;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 29924;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 33591;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 37072;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 45548;
UPDATE `creature_template` SET `gossip_menu_id` = 8521 WHERE `entry` = 55684;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 1022 WHERE `CreatureId` = 4596;
UPDATE `creature_trainer` SET `MenuId` = 1022 WHERE `CreatureId` = 26952;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 4258;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 4888;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 5164;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 7230;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 7231;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 11146;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 11177;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 11178;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 16724;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 26904;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 26981;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 26988;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 27034;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 28694;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 29505;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 29506;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 29924;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 33591;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 37072;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 45548;
UPDATE `creature_trainer` SET `MenuId` = 8521 WHERE `CreatureId` = 55684;

-- Insert gossip menu options to enchanting trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4169,4171,4170);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4169,0,3,'Train me.', 3266, 5, 16, 0),
(4171,0,3,'Train me.', 3266, 5, 16, 0),
(4170,0,3,'Train me.', 3266, 5, 16, 0);

-- enchanting generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 8866 WHERE `entry` = 19251;
UPDATE `creature_template` SET `gossip_menu_id` = 8866 WHERE `entry` = 26906;
UPDATE `creature_template` SET `gossip_menu_id` = 8866 WHERE `entry` = 26954;
UPDATE `creature_template` SET `gossip_menu_id` = 8866 WHERE `entry` = 26980;
UPDATE `creature_template` SET `gossip_menu_id` = 8866 WHERE `entry` = 26990;
UPDATE `creature_template` SET `gossip_menu_id` = 8866 WHERE `entry` = 28693;
UPDATE `creature_template` SET `gossip_menu_id` = 8866 WHERE `entry` = 33583;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 8866 WHERE `CreatureId` = 19251;
UPDATE `creature_trainer` SET `MenuId` = 8866 WHERE `CreatureId` = 26906;
UPDATE `creature_trainer` SET `MenuId` = 8866 WHERE `CreatureId` = 26954;
UPDATE `creature_trainer` SET `MenuId` = 8866 WHERE `CreatureId` = 26980;
UPDATE `creature_trainer` SET `MenuId` = 8866 WHERE `CreatureId` = 26990;
UPDATE `creature_trainer` SET `MenuId` = 8866 WHERE `CreatureId` = 28693;
UPDATE `creature_trainer` SET `MenuId` = 8866 WHERE `CreatureId` = 33583;

-- Insert gossip menu options to engineering trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4136,1467,1469,1465,7512,7513,10363,7820);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4136,0,3,'Train me.', 3266, 5, 16, 0),
(1467,0,3,'Train me.', 3266, 5, 16, 0),
(1469,0,3,'Train me.', 3266, 5, 16, 0),
(1465,0,3,'Train me.', 3266, 5, 16, 0),
(7512,0,3,'Train me.', 3266, 5, 16, 0),
(7513,0,3,'Train me.', 3266, 5, 16, 0),
(10363,0,3,'Train me.', 3266, 5, 16, 0),
(7820,0,3,'Train me.', 3266, 5, 16, 0);

-- engineering wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4149 WHERE `entry` = 11031;
-- engineering generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 18752;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 24868;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 25277;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 26907;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 26955;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 26991;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 28697;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 29513;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 29514;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 33586;
UPDATE `creature_template` SET `gossip_menu_id` = 8867 WHERE `entry` = 45545;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4149 WHERE `CreatureId` = 11031;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 18752;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 24868;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 25277;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 26907;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 26955;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 26991;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 28697;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 29513;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 29514;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 33586;
UPDATE `creature_trainer` SET `MenuId` = 8867 WHERE `CreatureId` = 45545;

-- inscription generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 28702;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30706;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30709;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30710;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30711;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30713;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30715;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30716;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30717;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30721;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 30722;
UPDATE `creature_template` SET `gossip_menu_id` = 9879 WHERE `entry` = 46716;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 28702;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30706;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30709;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30710;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30711;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30713;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30715;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30716;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30717;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30721;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 30722;
UPDATE `creature_trainer` SET `MenuId` = 9879 WHERE `CreatureId` = 46716;

-- jewelcrafting
UPDATE `creature_template` SET `gossip_menu_id` = 11861 WHERE `entry` = 33590;
UPDATE `creature_template` SET `gossip_menu_id` = 11861 WHERE `entry` = 52586;
UPDATE `creature_template` SET `gossip_menu_id` = 11861 WHERE `entry` = 52587;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 11861 WHERE `CreatureId` = 33590;
UPDATE `creature_trainer` SET `MenuId` = 11861 WHERE `CreatureId` = 52586;
UPDATE `creature_trainer` SET `MenuId` = 11861 WHERE `CreatureId` = 52587;

-- Insert gossip menu options to leatherworking trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4208,4186,3067,3070,3072,4842,4244);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4208,0,3,'Train me.', 3266, 5, 16, 0),
(4186,0,3,'Train me.', 3266, 5, 16, 0),
(3067,0,3,'Train me.', 3266, 5, 16, 0),
(3070,0,3,'Train me.', 3266, 5, 16, 0),
(3072,0,3,'Train me.', 3266, 5, 16, 0),
(4842,0,3,'Train me.', 3266, 5, 16, 0),
(4244,0,3,'Train me.', 3266, 5, 16, 0);

-- leatherworking wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4210 WHERE `entry` = 4588;
UPDATE `creature_template` SET `gossip_menu_id` = 4242 WHERE `entry` = 16278;
-- leatherworking generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 7869;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 7871;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 16728;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 21087;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 26911;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 26961;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 26996;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 26998;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 28700;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 29507;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 29508;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 29509;
UPDATE `creature_template` SET `gossip_menu_id` = 10361 WHERE `entry` = 33581;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4210 WHERE `CreatureId` = 4588;
UPDATE `creature_trainer` SET `MenuId` = 4242 WHERE `CreatureId` = 16278;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 7869;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 7871;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 16728;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 21087;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 26911;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 26961;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 26996;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 26998;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 28700;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 29507;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 29508;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 29509;
UPDATE `creature_trainer` SET `MenuId` = 10361 WHERE `CreatureId` = 33581;

-- Insert gossip menu options to tailoring trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4263,10138);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4263,0,3,'Train me.', 3266, 5, 16, 0),
(10138,0,3,'Train me.', 3266, 5, 16, 0);

-- tailoring wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4267 WHERE `entry` = 3523;
UPDATE `creature_template` SET `gossip_menu_id` = 4354 WHERE `entry` = 4576;
-- tailoring generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 8519 WHERE `entry` = 4578;
UPDATE `creature_template` SET `gossip_menu_id` = 8519 WHERE `entry` = 9584;
UPDATE `creature_template` SET `gossip_menu_id` = 8519 WHERE `entry` = 33580;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 4267 WHERE `CreatureId` = 3523;
UPDATE `creature_trainer` SET `MenuId` = 4354 WHERE `CreatureId` = 4576;
UPDATE `creature_trainer` SET `MenuId` = 8519 WHERE `CreatureId` = 4578;
UPDATE `creature_trainer` SET `MenuId` = 8519 WHERE `CreatureId` = 9584;
UPDATE `creature_trainer` SET `MenuId` = 8519 WHERE `CreatureId` = 33580;

-- Insert gossip menu options to first aid trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (8522);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(8522,0,3,'Train me.', 3266, 5, 16, 0);

-- first aid wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 4591;
-- first aid generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 18990;
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 18991;
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 26956;
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 26992;
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 28706;
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 29233;
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 33589;
UPDATE `creature_template` SET `gossip_menu_id` = 5856 WHERE `entry` = 45540;
 
-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 4591;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 18990;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 18991;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 26956;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 26992;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 28706;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 29233;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 33589;
UPDATE `creature_trainer` SET `MenuId` = 5856 WHERE `CreatureId` = 45540;

-- cooking generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 5853 WHERE `entry` = 19369;
UPDATE `creature_template` SET `gossip_menu_id` = 5853 WHERE `entry` = 33587;
UPDATE `creature_template` SET `gossip_menu_id` = 5853 WHERE `entry` = 34785;
UPDATE `creature_template` SET `gossip_menu_id` = 5853 WHERE `entry` = 34786;
UPDATE `creature_template` SET `gossip_menu_id` = 5853 WHERE `entry` = 45550;
UPDATE `creature_template` SET `gossip_menu_id` = 5853 WHERE `entry` = 46709;
UPDATE `creature_template` SET `gossip_menu_id` = 5853 WHERE `entry` = 47405;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 5853 WHERE `CreatureId` = 19369;
UPDATE `creature_trainer` SET `MenuId` = 5853 WHERE `CreatureId` = 33587;
UPDATE `creature_trainer` SET `MenuId` = 5853 WHERE `CreatureId` = 34785;
UPDATE `creature_trainer` SET `MenuId` = 5853 WHERE `CreatureId` = 34786;
UPDATE `creature_trainer` SET `MenuId` = 5853 WHERE `CreatureId` = 45550;
UPDATE `creature_trainer` SET `MenuId` = 5853 WHERE `CreatureId` = 46709;
UPDATE `creature_trainer` SET `MenuId` = 5853 WHERE `CreatureId` = 47405;

-- fishing generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 5665 WHERE `entry` = 7946;
UPDATE `creature_template` SET `gossip_menu_id` = 5665 WHERE `entry` = 26909;
UPDATE `creature_template` SET `gossip_menu_id` = 5665 WHERE `entry` = 26957;
UPDATE `creature_template` SET `gossip_menu_id` = 5665 WHERE `entry` = 26993;
UPDATE `creature_template` SET `gossip_menu_id` = 5665 WHERE `entry` = 32474;

-- correct creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 5665 WHERE `CreatureId` = 7946;
UPDATE `creature_trainer` SET `MenuId` = 5665 WHERE `CreatureId` = 26909;
UPDATE `creature_trainer` SET `MenuId` = 5665 WHERE `CreatureId` = 26957;
UPDATE `creature_trainer` SET `MenuId` = 5665 WHERE `CreatureId` = 26993;
UPDATE `creature_trainer` SET `MenuId` = 5665 WHERE `CreatureId` = 32474;

-- riding
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 3690;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 4732;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 4752;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 4753;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 4772;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 4773;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 7953;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 7954;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 20914;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 43693;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 48513;
-- UPDATE `creature_template` SET `gossip_menu_id` = ? WHERE `entry` = 53407;

-- correct creature_trainer
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 3690;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 4732;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 4752;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 4753;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 4772;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 4773;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 7953;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 7954;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 20914;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 43693;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 48513;
-- UPDATE `creature_trainer` SET `MenuId` = ? WHERE `CreatureId` = 53407;