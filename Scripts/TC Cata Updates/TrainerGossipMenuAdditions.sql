-- Correct low level class trainers.

-- Insert gossip menu options to trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (14137,14138,14139,14140,14141,10675,10685,10686,10694,10699,10698,10697,10879,10878,10985,11185,11617,11620,11621,11645,11810,11831);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(14137,0,3,'I require training.', 2756, 5, 16, 0),
(14137,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14137,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14138,0,3,'I require training.', 2756, 5, 16, 0),
(14138,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14138,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14139,0,3,'I require training.', 2756, 5, 16, 0),
(14139,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14139,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14140,0,3,'I require training.', 2756, 5, 16, 0),
(14140,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14140,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14141,0,3,'I require training.', 2756, 5, 16, 0),
(14141,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14141,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10675,0,3,'I require training.', 2756, 5, 16, 0),
(10675,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10675,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10685,0,3,'I require training.', 2756, 5, 16, 0),
(10685,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10685,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10686,0,3,'I require training.', 2756, 5, 16, 0),
(10686,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10686,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10694,0,3,'I require training.', 2756, 5, 16, 0),
(10694,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10694,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10699,0,3,'I require training.', 2756, 5, 16, 0),
(10699,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10699,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10698,0,3,'I require training.', 2756, 5, 16, 0),
(10698,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10698,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10697,0,3,'I require training.', 2756, 5, 16, 0),
(10697,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10697,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10879,0,3,'I require training.', 2756, 5, 16, 0),
(10879,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10879,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10878,0,3,'I require training.', 2756, 5, 16, 0),
(10878,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10878,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10985,0,3,'I require training.', 2756, 5, 16, 0),
(10985,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10985,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11185,0,3,'I require training.', 2756, 5, 16, 0),
(11185,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11185,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11617,0,3,'I require training.', 2756, 5, 16, 0),
(11617,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11617,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11620,0,3,'I require training.', 2756, 5, 16, 0),
(11620,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11620,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11621,0,3,'I require training.', 2756, 5, 16, 0),
(11621,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11621,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11645,0,3,'I require training.', 2756, 5, 16, 0),
(11645,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11645,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11810,0,3,'I require training.', 2756, 5, 16, 0),
(11810,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11810,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11831,0,3,'I require training.', 2756, 5, 16, 0),
(11831,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11831,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- insert option_actions for talent and dual spec gossips.
DELETE FROM `gossip_menu_option_action` WHERE `OptionIndex` IN (1,2) AND `MenuId` IN (14137,14138,14139,14140,14141,10675,10685,10686,10694,10699,10698,10697,10879,10878,10985,11185,11617,11620,11621,11645,11810,11831);
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES
(14137,1,4461,0),
(14137,2,10371,0),
(14138,1,4461,0),
(14138,2,10371,0),
(14139,1,4461,0),
(14139,2,10371,0),
(14140,1,4461,0),
(14140,2,10371,0),
(14141,1,4461,0),
(14141,2,10371,0),
(10675,1,4461,0),
(10675,2,10371,0),
(10685,1,4461,0),
(10685,2,10371,0),
(10686,1,4461,0),
(10686,2,10371,0),
(10694,1,4461,0),
(10694,2,10371,0),
(10699,1,4461,0),
(10699,2,10371,0),
(10698,1,4461,0),
(10698,2,10371,0),
(10697,1,4461,0),
(10697,2,10371,0),
(10879,1,4461,0),
(10879,2,10371,0),
(10878,1,4461,0),
(10878,2,10371,0),
(10985,1,4461,0),
(10985,2,10371,0),
(11185,1,4461,0),
(11185,2,10371,0),
(11617,1,4461,0),
(11617,2,10371,0),
(11620,1,4461,0),
(11620,2,10371,0),
(11621,1,4461,0),
(11621,2,10371,0),
(11645,1,4461,0),
(11645,2,10371,0),
(11810,1,4461,0),
(11810,2,10371,0),
(11831,1,4461,0),
(11831,2,10371,0);

-- add gossip_menu_option_trainer records.
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (14137,14141,10675,10697,11185,10686,10699,10985,14140,11621,14139,11617,10879,10878,11620,11810,14138,11645,11831,10702);
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES 
(14137, 0, 168),
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
(11620, 0, 44),
(11810, 0, 44),
(14138, 0, 32),
(11645, 0, 32),
(11831, 0, 32),
(10702, 0, 32);


-- Correct remaining class trainers
-- Insert gossip menu options to trainers with no options using generic text.
DELETE FROM `gossip_menu_option` WHERE `OptionIndex` IN (0,1,2) AND `MenuId` IN (14136,11824,11906,4608,14144,10555,11052,11045,10814,10549,10554,11051,10553,10819,10818,11050,11049,10551,10816,12572,10815,12576,12513,12523,12532,12533,12925,12926,12835,10835,12528,12535,12517,10843,12051,12524,12531,12536,12928,12543,12564,12924,4560,4583,12004,12841,12049,12525,10702,12053,10840,12526,12921,4602,12882,2522,12845,10373,11878,11972,11997);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) VALUES
(14136,0,3,'I require training.', 2756, 5, 16, 0),
(14136,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14136,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11824,0,3,'I require training.', 2756, 5, 16, 0),
(11824,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11824,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11906,0,3,'I require training.', 2756, 5, 16, 0),
(11906,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11906,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(4608,0,3,'I require training.', 2756, 5, 16, 0),
(4608,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(4608,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(14144,0,3,'I require training.', 2756, 5, 16, 0),
(14144,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(14144,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10555,0,3,'I require training.', 2756, 5, 16, 0),
(10555,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10555,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11052,0,3,'I require training.', 2756, 5, 16, 0),
(11052,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11052,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11045,0,3,'I require training.', 2756, 5, 16, 0),
(11045,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11045,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10814,0,3,'I require training.', 2756, 5, 16, 0),
(10814,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10814,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10549,0,3,'I require training.', 2756, 5, 16, 0),
(10549,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10549,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10554,0,3,'I require training.', 2756, 5, 16, 0),
(10554,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10554,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11051,0,3,'I require training.', 2756, 5, 16, 0),
(11051,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11051,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10553,0,3,'I require training.', 2756, 5, 16, 0),
(10553,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10553,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10819,0,3,'I require training.', 2756, 5, 16, 0),
(10819,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10819,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10818,0,3,'I require training.', 2756, 5, 16, 0),
(10818,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10818,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11050,0,3,'I require training.', 2756, 5, 16, 0),
(11050,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11050,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11049,0,3,'I require training.', 2756, 5, 16, 0),
(11049,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11049,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10551,0,3,'I require training.', 2756, 5, 16, 0),
(10551,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10551,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10816,0,3,'I require training.', 2756, 5, 16, 0),
(10816,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10816,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12572,0,3,'I require training.', 2756, 5, 16, 0),
(12572,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12572,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10815,0,3,'I require training.', 2756, 5, 16, 0),
(10815,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10815,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12576,0,3,'I require training.', 2756, 5, 16, 0),
(12576,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12576,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12513,0,3,'I require training.', 2756, 5, 16, 0),
(12513,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12513,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12523,0,3,'I require training.', 2756, 5, 16, 0),
(12523,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12523,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12532,0,3,'I require training.', 2756, 5, 16, 0),
(12532,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12532,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12533,0,3,'I require training.', 2756, 5, 16, 0),
(12533,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12533,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12925,0,3,'I require training.', 2756, 5, 16, 0),
(12925,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12925,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12926,0,3,'I require training.', 2756, 5, 16, 0),
(12926,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12926,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12835,0,3,'I require training.', 2756, 5, 16, 0),
(12835,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12835,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10835,0,3,'I require training.', 2756, 5, 16, 0),
(10835,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10835,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12528,0,3,'I require training.', 2756, 5, 16, 0),
(12528,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12528,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12535,0,3,'I require training.', 2756, 5, 16, 0),
(12535,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12535,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12517,0,3,'I require training.', 2756, 5, 16, 0),
(12517,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12517,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10843,0,3,'I require training.', 2756, 5, 16, 0),
(10843,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10843,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
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
(12564,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12924,0,3,'I require training.', 2756, 5, 16, 0),
(12924,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12924,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(4560,0,3,'I require training.', 2756, 5, 16, 0),
(4560,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(4560,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(4583,0,3,'I require training.', 2756, 5, 16, 0),
(4583,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(4583,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12004,0,3,'I require training.', 2756, 5, 16, 0),
(12004,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12004,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12841,0,3,'I require training.', 2756, 5, 16, 0),
(12841,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12841,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12049,0,3,'I require training.', 2756, 5, 16, 0),
(12049,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12049,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12525,0,3,'I require training.', 2756, 5, 16, 0),
(12525,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12525,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10702,0,3,'I require training.', 2756, 5, 16, 0),
(10702,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10702,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(12053,0,3,'I require training.', 2756, 5, 16, 0),
(12053,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(12053,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10840,0,3,'I require training.', 2756, 5, 16, 0),
(10840,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10840,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
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
(12845,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(10373,0,3,'I require training.', 2756, 5, 16, 0),
(10373,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(10373,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11878,0,3,'I require training.', 2756, 5, 16, 0),
(11878,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11878,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11972,0,3,'I require training.', 2756, 5, 16, 0),
(11972,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11972,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0),
(11997,0,3,'I require training.', 2756, 5, 16, 0),
(11997,1,0,'I wish to unlearn my talents.',62295,16,16,0),
(11997,2,0,'I wish to know about Dual Talent Specialization.',33762,20,1,0);

-- insert option_actions for talent and dual spec gossips.
DELETE FROM `gossip_menu_option_action` WHERE `OptionIndex` IN (1,2) AND `MenuId` IN (14136,11824,11906,4608,14144,10555,11052,11045,10814,10549,10554,11051,10553,10819,10818,11050,11049,10551,10816,12572,10815,12576,12513,12523,12532,12533,12925,12926,12835,10835,12528,12535,12517,10843,12051,12524,12531,12536,12928,12543,12564,12924,4560,4583,12004,12841,12049,12525,10702,12053,10840,12526,12921,4602,12882,2522,12845,10373,11878,11972,11997);
INSERT INTO `gossip_menu_option_action` (`MenuId`, `OptionIndex`, `ActionMenuId`, `ActionPoiId`) VALUES
(14136,1,4461,0),
(14136,2,10371,0),
(11824,1,4461,0),
(11824,2,10371,0),
(11906,1,4461,0),
(11906,2,10371,0),
(4608,1,4461,0),
(4608,2,10371,0),
(14144,1,4461,0),
(14144,2,10371,0),
(10555,1,4461,0),
(10555,2,10371,0),
(11052,1,4461,0),
(11052,2,10371,0),
(11045,1,4461,0),
(11045,2,10371,0),
(10814,1,4461,0),
(10814,2,10371,0),
(10549,1,4461,0),
(10549,2,10371,0),
(10554,1,4461,0),
(10554,2,10371,0),
(11051,1,4461,0),
(11051,2,10371,0),
(10553,1,4461,0),
(10553,2,10371,0),
(10819,1,4461,0),
(10819,2,10371,0),
(10818,1,4461,0),
(10818,2,10371,0),
(11050,1,4461,0),
(11050,2,10371,0),
(11049,1,4461,0),
(11049,2,10371,0),
(10551,1,4461,0),
(10551,2,10371,0),
(10816,1,4461,0),
(10816,2,10371,0),
(12572,1,4461,0),
(12572,2,10371,0),
(10815,1,4461,0),
(10815,2,10371,0),
(12576,1,4461,0),
(12576,2,10371,0),
(12513,1,4461,0),
(12513,2,10371,0),
(12523,1,4461,0),
(12523,2,10371,0),
(12532,1,4461,0),
(12532,2,10371,0),
(12533,1,4461,0),
(12533,2,10371,0),
(12925,1,4461,0),
(12925,2,10371,0),
(12926,1,4461,0),
(12926,2,10371,0),
(12835,1,4461,0),
(12835,2,10371,0),
(10835,1,4461,0),
(10835,2,10371,0),
(12528,1,4461,0),
(12528,2,10371,0),
(12535,1,4461,0),
(12535,2,10371,0),
(12517,1,4461,0),
(12517,2,10371,0),
(10843,1,4461,0),
(10843,2,10371,0),
(12051,1,4461,0),
(12051,2,10371,0),
(12524,1,4461,0),
(12524,2,10371,0),
(12531,1,4461,0),
(12531,2,10371,0),
(12536,1,4461,0),
(12536,2,10371,0),
(12928,1,4461,0),
(12928,2,10371,0),
(12543,1,4461,0),
(12543,2,10371,0),
(12564,1,4461,0),
(12564,2,10371,0),
(12924,1,4461,0),
(12924,2,10371,0),
(4560,1,4461,0),
(4560,2,10371,0),
(4583,1,4461,0),
(4583,2,10371,0),
(12004,1,4461,0),
(12004,2,10371,0),
(12841,1,4461,0),
(12841,2,10371,0),
(12049,1,4461,0),
(12049,2,10371,0),
(12525,1,4461,0),
(12525,2,10371,0),
(10702,1,4461,0),
(10702,2,10371,0),
(12053,1,4461,0),
(12053,2,10371,0),
(10840,1,4461,0),
(10840,2,10371,0),
(12526,1,4461,0),
(12526,2,10371,0),
(12921,1,4461,0),
(12921,2,10371,0),
(4602,1,4461,0),
(4602,2,10371,0),
(12882,1,4461,0),
(12882,2,10371,0),
(2522,1,4461,0),
(2522,2,10371,0),
(12845,1,4461,0),
(12845,2,10371,0),
(10373,1,4461,0),
(10373,2,10371,0),
(11878,1,4461,0),
(11878,2,10371,0),
(11972,1,4461,0),
(11972,2,10371,0),
(11997,1,4461,0),
(11997,2,10371,0);

-- add `gossip_menu_option_trainer` records.
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (11052,12513,12532,12533,12925,12926,14144,11045,10814,10549,12835,12528,12535,12924,10843,10554,11051,10819,12517,12051,12524,12531,12536,12928,12543,12564,10553,11050,10818,4560,12004,12841,11049,11878,10551,10816,12572,4583,14136,12049,12525,4608,10840,12053,12526,12921,4602,12882,2522,12845,10373,11997);
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES 
(11052, 0, 16),
(12513, 0, 16),
(12532, 0, 16),
(12533, 0, 16),
(12925, 0, 16),
(12926, 0, 164),
(14144, 0, 40),
(11045, 0, 40),
(10814, 0, 40),
(10549, 0, 40),
(12835, 0, 40),
(12528, 0, 40),
(12535, 0, 40),
(12924, 0, 40),
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
(10553, 0, 3),
(11050, 0, 3),
(10818, 0, 3),
(4560, 0, 3),
(12004, 0, 3),
(12841, 0, 3),
(11049, 0, 124),
(11878, 0, 124),
(10551, 0, 135),
(10816, 0, 135),
(12572, 0, 135),
(4583, 0, 135),
(14136, 0, 135),
(12049, 0, 135),
(12525, 0, 135),
(4608, 0, 154),
(10840, 0, 154),
(12053, 0, 154),
(12526, 0, 154),
(12921, 0, 154),
(4602, 0, 154),
(12882, 0, 154),
(2522, 0, 154),
(12845, 0, 154),
(10373, 0, 39),
(11997, 0, 39);

-- add missing gossip_menu_option_trainer for Portal Trainers
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (11972);
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(11972, 0, 149);

-- update Gilneans to standard class trainers.
UPDATE `creature_template` SET `gossip_menu_Id` = 10835 WHERE `entry` = 38467;

-- switch trainers who do nothing to either wotlk or generic gossips
-- priest wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4543 WHERE `entry` = 4608;
-- mage wotlk gossips
UPDATE `creature_template` SET `gossip_menu_id` = 4583 WHERE `entry` = 4567;
-- mage generic gossips
UPDATE `creature_template` SET `gossip_menu_id` = 14136 WHERE `entry` = 49952;
UPDATE `creature_template` SET `gossip_menu_id` = 14136 WHERE `entry` = 50714;
UPDATE `creature_template` SET `gossip_menu_id` = 14136 WHERE `entry` = 50715;
UPDATE `creature_template` SET `gossip_menu_id` = 14136 WHERE `entry` = 50717;
UPDATE `creature_template` SET `gossip_menu_id` = 14136 WHERE `entry` = 50720;

-- correct low level class trainers who share gossips with standard class trainers.
SET @Frang := 3153;
SET @MenuId := 523;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId, @newGossipMenuOptionIndex, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 145);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @Frang, 5, 0, 0, 'Show gossip when Frang is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @Frang, 5, 0, 1, 'Show gossip when Frang is not present');
	
SET @DeliosSilverBlade := 43010;
SET @MenuId := 11793;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 145);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES 
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @DeliosSilverBlade, 5, 0, 0, 'Show gossip when Delios Silver Blade is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @DeliosSilverBlade, 5, 0, 1, 'Show gossip when Delios Silver Blade is not present');

SET @Kore := 16503;
SET @MenuId := 7263;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 145);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES 
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @Kore, 5, 0, 0, 'Show gossip when Kore is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @Kore, 5, 0, 1, 'Show gossip when Kore is not present');
	
SET @SunwalkerHelaku := 37737;
SET @MenuId := 11767;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 168);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @SunwalkerHelaku, 5, 0, 0, 'Show gossip when Sunwalker Helaku is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @SunwalkerHelaku, 5, 0, 1, 'Show gossip when Sunwalker Helaku is not present');
	
SET @Aurelon := 16501;
SET @MenuId := 7260;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 168);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES 
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @Aurelon, 5, 0, 0, 'Show gossip when Aurelon is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @Aurelon, 5, 0, 1, 'Show gossip when Aurelon is not present');
	
SET @Keilnei := 16499;
SET @MenuId := 7262;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 15);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES 
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @Keilnei, 5, 0, 0, 'Show gossip when Keilnei is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @Keilnei, 5, 0, 1, 'Show gossip when Keilnei is not present');
	
SET @LankaFarshot := 3061;
SET @MenuId := 4647;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 15);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES 
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @LankaFarshot, 5, 0, 0, 'Show gossip when Lanka Farshot is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @LankaFarshot, 5, 0, 1, 'Show gossip when Lanka Farshot is not present');
	
SET @Rwag := 3155;
SET @MenuId := 141;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 10;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 17);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES 
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @Rwag, 5, 0, 0, 'Show gossip when Rwag is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @Rwag, 5, 0, 1, 'Show gossip when Rwag is not present');

SET @DavidTrias := 2122;
SET @MenuId := 85;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 5;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 17);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @DavidTrias, 5, 0, 0, 'Show gossip when David Trias is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @DavidTrias, 5, 0, 1, 'Show gossip when David Trias is not present');
	
SET @DarkClericDuesten := 2123;
SET @MenuId := 3645;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 127);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @DarkClericDuesten, 5, 0, 0, 'Show gossip when Dark Cleric Duesten is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @DarkClericDuesten, 5, 0, 1, 'Show gossip when Dark Cleric Duesten is not present');

SET @SeerRavenfeather := 37724;
SET @MenuId := 11766;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 1;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 127);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @SeerRavenfeather, 5, 0, 0, 'Show gossip when Seer Ravenfeather is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @SeerRavenfeather, 5, 0, 1, 'Show gossip when Seer Ravenfeather is not present');
	
SET @MeelaDawnstrider := 3062;
SET @MenuId := 4103;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 134);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @MeelaDawnstrider, 5, 0, 0, 'Show gossip when Meela Dawnstrider is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @MeelaDawnstrider, 5, 0, 1, 'Show gossip when Meela Dawnstrider is not present');

SET @JuliaSunstriker := 15279;
SET @MenuId := 6648;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 44);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @JuliaSunstriker, 5, 0, 0, 'Show gossip when Julia Sunstriker is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @JuliaSunstriker, 5, 0, 1, 'Show gossip when Julia Sunstriker is not present');

SET @Valaatu := 16500;
SET @MenuId := 7264;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 3;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 44);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @Valaatu, 5, 0, 0, 'Show gossip when Valaatu is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @Valaatu, 5, 0, 1, 'Show gossip when Valaatu is not present');

-- Update a Horde Portal trainer who shares a gossip with an Alliance Portal trainer.
SET @Narinth := 16654;
SET @MenuId := 4824;
SET @trainingGossipOptionIndex := 0;
SET @newGossipMenuOptionIndex := 1;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`, `VerifiedBuild`) SELECT @MenuId AS `MenuId`, @newGossipMenuOptionIndex AS `OptionIndex`, `OptionIcon`, `OptionText`,`OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild` FROM `gossip_menu_option` WHERE `MenuId` = @MenuId AND `OptionIndex` = @trainingGossipOptionIndex;
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` = @MenuId AND `OptionIndex` = @newGossipMenuOptionIndex;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES (@MenuId, @newGossipMenuOptionIndex, 149);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @MenuId AND `SourceEntry` IN (@newGossipMenuOptionIndex,@trainingGossipOptionIndex) AND `ConditionTypeOrReference` = 29;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, @MenuId, @newGossipMenuOptionIndex, 0, 29, 0, @Narinth, 5, 0, 0, 'Show gossip when Narinth is present'),
(15, @MenuId, @trainingGossipOptionIndex, 0, 29, 0, @Narinth, 5, 0, 1, 'Show gossip when Narinth is not present');


-- Correct Profession Trainers
-- add missing gossip_menu_option for Alchemists.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (4111,4110,4117,8863) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES 
(4111, 0, 3, 'Train me in Alchemy.', 0, 5, 16),
(4110, 0, 3, 'Train me in Alchemy.', 0, 5, 16),
(4117, 0, 3, 'Train me in Alchemy.', 0, 5, 16),
(8863, 0, 3, 'Train me in Alchemy.', 0, 5, 16);

-- add gossip data from wotlk for Blacksmiths.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (1043) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
(1043, 0, 3, 'Train me.', 3266, 5, 16);

-- add missing gossip_menu_option for Blacksmiths.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (2741,2749,1042,1041,3203,3202,8760,7809,9131,9132,8254) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
(2741, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
(2749, 0, 3, 'Train me in Blacksmithing.', 0, 5, 16),
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
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (4169,4156,4171,4170) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
(4169, 0, 3, 'Train me in Enchanting.', 0, 5, 16),
(4156, 0, 3, 'Train me in Enchanting.', 0, 5, 16),
(4171, 0, 3, 'Train me in Enchanting.', 0, 5, 16),
(4170, 0, 3, 'Train me in Enchanting.', 0, 5, 16);

-- add missing gossip_menu_option for Engineers.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (4136,1469,1465,7512,7513,7820,10363) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
(4136, 0, 3, 'Train me in Engineering.', 0, 5, 16),
(1469, 0, 3, 'Train me in Engineering.', 0, 5, 16),
(1465, 0, 3, 'Train me in Engineering.', 0, 5, 16),
(7512, 0, 3, 'Train me in Engineering.', 0, 5, 16),
(7513, 0, 3, 'Train me in Engineering.', 0, 5, 16),
(7820, 0, 3, 'Train me in Engineering.', 0, 5, 16),
(10363, 0, 3, 'Train me in Engineering.', 0, 5, 16);

-- add missing gossip_menu_option for Leatherworkers.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (4208,4842,4244) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
(4208, 0, 3, 'Train me in Leatherworking.', 0, 5, 16),
(4842, 0, 3, 'Train me in Leatherworking.', 0, 5, 16),
(4244, 0, 3, 'Train me in Leatherworking.', 0, 5, 16);

-- add missing gossip_menu_option for Tailors.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (4356,10138) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
(4356, 0, 3, 'Train me in Tailoring.', 0, 5, 16),
(10138, 0, 3, 'Train me in Tailoring.', 0, 5, 16);

-- add missing gossip_menu_option for First Aid Trainers.
DELETE FROM `gossip_menu_option` WHERE `MenuId` IN (8522) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcflag`) VALUES
(8522, 0, 3, 'Train me in First Aide.', 0, 5, 16);

-- add missing gossip_menu_option_trainer for Apprentice Blacksmiths
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (2741) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(2741, 0, 80);
	
-- add missing gossip_menu_option_trainer for Alchemists
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (4111,4110,4117,8863) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(4111, 0, 122),
(4110, 0, 122),
(4117, 0, 122),
(8863, 0, 122);

-- add missing gossip_menu_option_trainer for Blacksmiths
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (2749,1043,1042,1041,3203,3202,8760,7809,9131,9132,8254) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(2749, 0, 58),
(1043, 0, 58),
(1042, 0, 58),
(1041, 0, 58),
(3203, 0, 58),
(3202, 0, 58),
(8760, 0, 58),
(7809, 0, 58),
(9131, 0, 58),
(9132, 0, 58),
(8254, 0, 58);

-- add missing gossip_menu_option_trainer for Enchanters
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (4169,4171,4170) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES 
(4169, 0, 62),
(4171, 0, 62),
(4170, 0, 62);

-- add missing gossip_menu_option_trainer for Engineers
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (4136,1469,1465,7512,7513,7820,10363) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(4136, 0, 407),
(1469, 0, 407),
(1465, 0, 407),
(7512, 0, 407),
(7513, 0, 407),
(7820, 0, 407),
(10363, 0, 407);

-- add missing gossip_menu_option_trainer for Leatherworkers
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (4208,4842,4244) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(4208, 0, 56),
(4842, 0, 56),
(4244, 0, 56);

-- add missing gossip_menu_option_trainer for Tailors
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (4356,10138) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES 
(4356, 0, 163),
(10138, 0, 163);

-- add missing gossip_menu_option_trainer for First Aid Trainers
DELETE FROM `gossip_menu_option_trainer` WHERE `MenuId` IN (8522) AND `OptionIndex` = 0;
INSERT INTO `gossip_menu_option_trainer` (`MenuId`, `OptionIndex`, `TrainerId`) VALUES
(8522, 0, 107);