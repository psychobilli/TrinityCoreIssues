-- Insert gossip menu options to low level trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (14137,14141,14140,10879,14138,11645,11831,10702,10675,11185,10686,10985,14139,11617);
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
(10879,0,3,'I require training.', 2756, 5, 16, 0),
(10879,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10879,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
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
(14139,0,3,'I require training.', 2756, 5, 16, 0),
(14139,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14139,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11617,0,3,'I require training.', 2756, 5, 16, 0),
(11617,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11617,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

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

-- Insert gossip menu options to paladin trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (12926);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(12926,0,3,'I require training.', 2756, 5, 16, 0),
(12926,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12926,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

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

-- Insert gossip menu options to rogue trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (12517,10554,10819,10843,11051,11621,10699,12051,12524,12531,12536,12928,12543,12564);
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
(11621,0,3,'I require training.', 2756, 5, 16, 0),
(11621,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11621,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
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

-- Insert gossip menu options to shaman trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (11049);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(11049,0,3,'I require training.', 2756, 5, 16, 0),
(11049,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11049,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);
 
-- Insert gossip menu options to mage trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (10551,10816,10878,11620,11810,12572,12049,12525,14136);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10551,0,3,'I require training.', 2756, 5, 16, 0),
(10551,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10551,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10878,0,3,'I require training.', 2756, 5, 16, 0),
(10878,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10878,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11620,0,3,'I require training.', 2756, 5, 16, 0),
(11620,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11620,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10816,0,3,'I require training.', 2756, 5, 16, 0),
(10816,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10816,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11810,0,3,'I require training.', 2756, 5, 16, 0),
(11810,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11810,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12572,0,3,'I require training.', 2756, 5, 16, 0),
(12572,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12572,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12049,0,3,'I require training.', 2756, 5, 16, 0),
(12049,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12049,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12525,0,3,'I require training.', 2756, 5, 16, 0),
(12525,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12525,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14136,0,3,'I require training.', 2756, 5, 16, 0),
(14136,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14136,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- Insert gossip menu options to warlock trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (10840,12053,4608,12526,12921,4602,12882,2522,12845);
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
(2522,0,3,'I require training.', 2756, 5, 16, 0),
(2522,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(2522,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12845,0,3,'I require training.', 2756, 5, 16, 0),
(12845,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12845,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- Insert gossip menu options to druid trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (10373,11997);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10373,0,3,'I require training.', 2756, 5, 16, 0),
(10373,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10373,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11997,0,3,'I require training.', 2756, 5, 16, 0),
(11997,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11997,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- Insert gossip menu options to portal trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (11972);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(11972,0,3,'I require training.', 2756, 5, 16, 0);

-- Insert gossip menu options to alchemy trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4117,8863);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4117,0,3,'Train me.', 3266, 5, 16, 0),
(8863,0,3,'Train me.', 3266, 5, 16, 0);

-- Insert gossip menu options to blacksmithing trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (2749,1041,9131,9132,8254);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(2749,0,3,'Train me.', 3266, 5, 16, 0),
(1041,0,3,'Train me.', 3266, 5, 16, 0),
(9131,0,3,'Train me.', 3266, 5, 16, 0),
(9132,0,3,'Train me.', 3266, 5, 16, 0),
(8254,0,3,'Train me.', 3266, 5, 16, 0);

-- Insert gossip menu options to enchanting trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4169,4171,4170);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4169,0,3,'Train me.', 3266, 5, 16, 0),
(4171,0,3,'Train me.', 3266, 5, 16, 0),
(4170,0,3,'Train me.', 3266, 5, 16, 0);

-- Insert gossip menu options to engineering trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4136,1467,1469,1465,7512,7513,10363);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4136,0,3,'Train me.', 3266, 5, 16, 0),
(1467,0,3,'Train me.', 3266, 5, 16, 0),
(1469,0,3,'Train me.', 3266, 5, 16, 0),
(1465,0,3,'Train me.', 3266, 5, 16, 0),
(7512,0,3,'Train me.', 3266, 5, 16, 0),
(7513,0,3,'Train me.', 3266, 5, 16, 0),
(10363,0,3,'Train me.', 3266, 5, 16, 0);

-- Insert gossip menu options to leatherworking trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (4208,4842,4244);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(4208,0,3,'Train me.', 3266, 5, 16, 0),
(4842,0,3,'Train me.', 3266, 5, 16, 0),
(4244,0,3,'Train me.', 3266, 5, 16, 0);

-- Insert gossip menu options to tailoring trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (10138);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(10138,0,3,'Train me.', 3266, 5, 16, 0);

-- Insert gossip menu options to first aid trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0) AND `MenuId` IN (8522);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(8522,0,3,'Train me.', 3266, 5, 16, 0);