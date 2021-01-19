-- Correct low level class trainers.

-- add `creature_trainer` records for low level warrior trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (2119,3059,16503,34697,35839,42324,43010);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(2119,145,4653,0),
(3059,145,4645,0),
(16503,145,7263,0),
(34697,145,10821,0),
(35839,145,10694,0),
(42324,145,0,0),
(43010,145,11793,0);

-- add `creature_trainer` records for low level paladin trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (925,926,15280,37737);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(925,168,4663,0),
(926,168,4678,0),
(15280,168,14137,0),
(37737,168,11767,0);

-- add `creature_trainer` records for low level hunter trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (895,3061,34673,35874,38247,39214,43278);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(895,15,4675,0),
(3061,15,4647,0),
(34673,15,10675,0),
(35874,15,10697,0),
(38247,15,10988,0),
(39214,15,11185,0),
(43278,15,14200,0);

-- add `creature_trainer` records for low level rogue trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (916,34693,35871,38244,42366);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(916,17,4676,0),
(34693,17,10686,0),
(35871,17,10699,0),
(38244,17,10985,0),
(42366,17,11621,0);

-- add `creature_trainer` records for low level priest trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (837,2123,3595,15284,35870,38245,42323);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(837,127,4679,0),
(2123,127,3645,0),
(3595,127,4692,0),
(15284,127,14139,0),
(35870,127,10700,0),
(38245,127,10986,0),
(42323,127,11617,0);

-- add `creature_trainer` records for low level shaman trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (3062,3157,17089,37115,38242);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(3062,134,4103,0),
(3157,134,4652,0),
(17089,134,7522,0),
(37115,134,10879,0),
(38242,134,0,0);

-- add `creature_trainer` records for low level mage trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (198,15279,16500,35872,37121,38246,42331,43006);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(198,44,4660,0),
(15279,44,14136,0),
(16500,44,7264,0),
(35872,44,10698,0),
(37121,44,10878,0),
(38246,44,10987,0),
(42331,44,11620,0),
(43006,44,11810,0);

-- add `creature_trainer` records for low level warlock trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (459,460,2126,3156,15283,34696,35869,42618,43455);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(459,32,1503,0),
(460,32,4681,0),
(2126,32,4655,0),
(3156,32,4643,0),
(15283,32,14138,0),
(34696,32,10681,0),
(35869,32,10702,0),
(42618,32,11645,0),
(43455,32,11831,0);

-- add `creature_trainer` records for low level druid trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (35873);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(35873,50,10696,0);

-- Correct existing creature_trainer records with correct trainers
UPDATE `creature_trainer` SET `MenuId` = 14141 WHERE `CreatureId` = 15513;
UPDATE `creature_trainer` SET `MenuId` = 14140 WHERE `CreatureId` = 15285;
UPDATE `creature_trainer` SET `MenuId` = 13921 WHERE `CreatureId` = 375;
UPDATE `creature_trainer` SET `MenuId` = 10373 WHERE `CreatureId` = 4219;
UPDATE `creature_trainer` SET `TrainerId` = 127 WHERE `CreatureId` = 375;
UPDATE `creature_trainer` SET `TrainerId` = 127 WHERE `CreatureId` = 37724;
UPDATE `creature_trainer` SET `TrainerId` = 127 WHERE `CreatureId` = 16502;

-- Correct NPC Flags
-- low level warrior
UPDATE `creature_template` SET `npcFlag` = 51 WHERE `entry` = 38037;
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 42324;
-- low level shaman
UPDATE `creature_template` SET `npcFlag` = 50, `trainer_class` = 7 WHERE `entry` = 38242;

-- Correct remaining class trainers

-- Correct flags on numerous class trainer gossip_options.
UPDATE `gossip_menu_option` SET `OptionType` = 5, `OptionNpcflag` = 16 WHERE `OptionIcon` = 3 AND `MenuId` IN (10694,11912,141,10685,11766,10684,10683,10698,10696,4105,10552,10817,11878,12052,4555,4553,10837,12606,12918,12716,10815,12576,12821,11932,12522,12746,11824,11906,12927,12755);

-- add `creature_trainer` records for warrior trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (985,3041,3042,3043,3063,3169,3353,3354,4593,4594,4595,16771,17120,17480,17504,35807,36525,36651,38518,43009,43012,44128,44129,44455,44723,45019,45709,46667,48616,49720,49736,49902,49923,49955,50006,50018,50025,50033,50155,50500);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(985,16,523,0),
(3041,16,4526,0),
(3042,16,4525,0),
(3043,16,4527,0),
(3063,16,655,0),
(3169,16,523,0),
(3353,16,4509,0),
(3354,16,4511,0),
(4593,16,0,0),
(4594,16,0,0),
(4595,16,0,0),
(16771,16,7263,0),
(17120,16,7263,0),
(17480,16,7263,0),
(17504,16,7263,0),
(35807,16,10555,0),
(36525,16,10555,0),
(36651,16,10836,0),
(38518,16,11052,0),
(43009,16,14199,0),
(43012,16,11793,0),
(44128,16,14199,0),
(44129,16,14199,0),
(44455,16,10694,0),
(44723,16,11875,0),
(45019,16,11912,0),
(45709,16,12344,0),
(46667,16,12151,0),
(48616,16,656,0),
(49720,16,656,0),
(49736,16,12513,0),
(49902,16,12532,0),
(49923,16,12533,0),
(49955,16,0,0),
(50006,16,11912,0),
(50018,16,12925,0),
(50025,16,7263,0),
(50033,16,523,0),
(50155,16,12533,0),
(50500,16,12513,0);

-- add `creature_trainer` records for paladin trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (927,1232,5147,5148,5149,8140,8664,16275,16679,16680,16681,16761,17121,17483,17509,20406,35281,43001,43013,43795,44725,49741,49793,49954,49957,50012,50023,50035,50150,50160);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(927,164,4664,0),
(1232,164,4677,0),
(5147,164,4557,0),
(5148,164,4556,0),
(5149,164,2304,0),
(8140,164,4662,0),
(8664,164,11767,0),
(16275,164,6647,0),
(16679,164,6647,0),
(16680,164,6647,0),
(16681,164,6647,0),
(16761,164,7260,0),
(17121,164,7260,0),
(17483,164,7260,0),
(17509,164,7260,0),
(20406,164,8111,0),
(35281,164,7260,0),
(43001,164,11767,0),
(43013,164,11767,0),
(43795,164,11767,0),
(44725,164,11767,0),
(49741,164,12516,0),
(49793,164,12527,0),
(49954,164,0,0),
(49957,164,7260,0),
(50012,164,12926,0),
(50023,164,7260,0),
(50035,164,11767,0),
(50150,164,6647,0),
(50160,164,12516,0);

-- add `creature_trainer` records for hunter trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1231,1404,3038,3039,3040,3171,3352,3601,3963,4138,4146,4205,5115,5116,5501,5515,5516,8308,10930,16270,16672,16673,16674,16738,17110,17122,17505,35758,36518,36629,38122,38467,38798,39116,43011,44461,44743,45023,45713,46983,47767,47788,48618,49806,49894,49927,49946,49958,49966,50004,50007,50020,50032,50144,50157,50497,50609);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(1231,40,4007,0),
(1404,40,4657,0),
(3038,40,4011,0),
(3039,40,4023,0),
(3040,40,4524,0),
(3171,40,4017,0),
(3352,40,4010,0),
(3601,40,4009,0),
(3963,40,4092,0),
(4138,40,4621,0),
(4146,40,4008,0),
(4205,40,4693,0),
(5115,40,4549,0),
(5116,40,4550,0),
(5501,40,4694,0),
(5515,40,4474,0),
(5516,40,4473,0),
(8308,40,4092,0),
(10930,40,4674,0),
(16270,40,14144,0),
(16672,40,6652,0),
(16673,40,6652,0),
(16674,40,6652,0),
(16738,40,7262,0),
(17110,40,7368,0),
(17122,40,7262,0),
(17505,40,7262,0),
(35758,40,10549,0),
(36518,40,10814,0),
(36629,40,10835,0),
(38122,40,11045,0),
(38467,40,0,0),
(38798,40,10835,0),
(39116,40,0,0),
(43011,40,11817,0),
(44461,40,10697,0),
(44743,40,11879,0),
(45023,40,11913,0),
(45713,40,12048,0),
(46983,40,11817,0),
(47767,40,12341,0),
(47788,40,12341,0),
(48618,40,11154,0),
(49806,40,12528,0),
(49894,40,12048,0),
(49927,40,12535,0),
(49946,40,0,0),
(49958,40,12540,0),
(49966,40,7262,0),
(50004,40,11913,0),
(50007,40,12924,0),
(50020,40,7262,0),
(50032,40,12341,0),
(50144,40,6652,0),
(50157,40,12535,0),
(50497,40,11817,0),
(50609,40,0,0);

-- add `creature_trainer` records for rogue trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1234,1411,2130,3170,3327,3599,3693,4163,4214,4215,4582,4583,4584,5165,5166,16279,16684,16685,16686,23566,35806,36524,36630,38517,38796,44464,45095,45717,47233,48615,49745,49782,49870,49909,49939,49949,50015,50016,50027,50127,50147,50158,50498);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES 
(1234,33,410,0),
(1411,33,4658,0),
(2130,33,0,0),
(3170,33,141,0),
(3327,33,4513,0),
(3599,33,436,0),
(4163,33,4576,0),
(4214,33,4577,0),
(4215,33,4575,0),
(4582,33,0,0),
(4583,33,0,0),
(4584,33,0,0),
(5165,33,411,0),
(5166,33,0,0),
(16279,33,6650,0),
(16684,33,6650,0),
(16685,33,6650,0),
(16686,33,6650,0),
(23566,33,12517,0),
(35806,33,10554,0),
(36524,33,10819,0),
(36630,33,10843,0),
(38517,33,11051,0),
(38796,33,10843,0),
(44464,33,10699,0),
(45095,33,12050,0),
(45717,33,12051,0),
(47233,33,141,0),
(48615,33,0,0),
(49745,33,12517,0),
(49782,33,12524,0),
(49870,33,12531,0),
(49909,33,0,0),
(49939,33,12536,0),
(49949,33,0,0),
(50015,33,12050,0),
(50016,33,12928,0),
(50027,33,12543,0),
(50127,33,12564,0),
(50147,33,6650,0),
(50158,33,12536,0),
(50498,33,12517,0);

-- add `creature_trainer` records for priest trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1226,2129,3044,3046,3600,3706,4090,4091,4092,4606,4607,4608,5141,5142,5143,11401,11406,16276,16658,16660,16756,17482,17510,17511,35805,36523,36632,38466,38516,43004,43015,43796,43870,44468,45137,45306,45339,45347,48614,49715,49749,49784,49901,49950,49962,50024,50031,50163,50501,53403);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1226,3,4680,0),
(2129,3,3645,0),
(3044,3,4533,0),
(3046,3,4532,0),
(3600,3,4691,0),
(3706,3,3644,0),
(4090,3,4574,0),
(4091,3,4573,0),
(4092,3,4572,0),
(4606,3,0,0),
(4607,3,0,0),
(4608,3,0,0),
(5141,3,4559,0),
(5142,3,4558,0),
(5143,3,4560,0),
(11401,3,4801,0),
(11406,3,3642,0),
(16276,3,7438,0),
(16658,3,6649,0),
(16660,3,6649,0),
(16756,3,7265,0),
(17482,3,7265,0),
(17510,3,7265,0),
(17511,3,7265,0),
(35805,3,10553,0),
(36523,3,10818,0),
(36632,3,10838,0),
(38466,3,0,0),
(38516,3,11050,0),
(43004,3,11766,0),
(43015,3,11766,0),
(43796,3,11766,0),
(43870,3,11766,0),
(44468,3,10700,0),
(45137,3,4521,0),
(45306,3,12004,0),
(45339,3,4544,0),
(45347,3,12010,0),
(48614,3,0,0),
(49715,3,3645,0),
(49749,3,4666,0),
(49784,3,3642,0),
(49901,3,0,0),
(49950,3,0,0),
(49962,3,7265,0),
(50024,3,7265,0),
(50031,3,3644,0),
(50163,3,12714,0),
(50501,3,12714,0),
(53403,3,12841,0);

-- add `creature_trainer` records for shaman trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (3173,3344,3403,13417,16661,17204,17212,17219,17519,17520,23127,35786,36521,38515,43464,44740,45029,45718,49808,49900,49964,50011,50019,50022,50130,50153,50174,51637,51638,51639,51640,52292,52317,53405);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(3173,124,4104,0),
(3344,124,4516,0),
(3403,124,4515,0),
(13417,124,5123,0),
(16661,124,4105,0),
(17204,124,7377,0),
(17212,124,7467,0),
(17219,124,7357,0),
(17519,124,7357,0),
(17520,124,7357,0),
(23127,124,7357,0),
(35786,124,10552,0),
(36521,124,10817,0),
(38515,124,11049,0),
(43464,124,12529,0),
(44740,124,11878,0),
(45029,124,4105,0),
(45718,124,12052,0),
(49808,124,12529,0),
(49900,124,12052,0),
(49964,124,7357,0),
(50011,124,4105,0),
(50019,124,7357,0),
(50022,124,4104,0),
(50130,124,7357,0),
(50153,124,4104,0),
(50174,124,7357,0),
(51637,124,4103,0),
(51638,124,4530,0),
(51639,124,4529,0),
(51640,124,4528,0),
(52292,124,7357,0),
(52317,124,4103,0),
(53405,124,12529,0);

-- add `creature_trainer` records for mage trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (328,1228,2128,3047,3048,3049,4566,4567,4568,5144,5145,5146,5880,7311,7312,16269,16651,16652,16653,16749,17481,17513,17514,23103,27704,28956,28958,35780,36520,36631,38465,38514,38794,43005,44465,45714,47246,47247,47248,48613,49716,49760,49786,49896,49952,49959,49968,50002,50010,50029,50499,50690,50714,50715,50716,50717,50720);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(328,135,4661,0),
(1228,135,4463,0),
(2128,135,63,0),
(3047,135,4534,0),
(3048,135,4536,0),
(3049,135,4535,0),
(4566,135,4539,0),
(4567,135,0,0),
(4568,135,0,0),
(5144,135,4463,0),
(5145,135,4463,0),
(5146,135,4555,0),
(5880,135,64,0),
(7311,135,11933,0),
(7312,135,4553,0),
(16269,135,6648,0),
(16651,135,6648,0),
(16652,135,6648,0),
(16653,135,6648,0),
(16749,135,7264,0),
(17481,135,7264,0),
(17513,135,7264,0),
(17514,135,7264,0),
(23103,135,0,0),
(27704,135,9580,0),
(28956,135,9990,0),
(28958,135,9990,0),
(35780,135,10551,0),
(36520,135,10816,0),
(36631,135,10837,0),
(38465,135,10837,0),
(38514,135,12572,0),
(38794,135,10837,0),
(43005,135,12606,0),
(44465,135,10698,0),
(45714,135,12049,0),
(47246,135,12233,0),
(47247,135,12233,0),
(47248,135,12233,0),
(48613,135,63,0),
(49716,135,63,0),
(49760,135,12521,0),
(49786,135,12525,0),
(49896,135,12049,0),
(49952,135,0,0),
(49959,135,7264,0),
(49968,135,4463,0),
(50002,135,11933,0),
(50010,135,12918,0),
(50029,135,12233,0),
(50499,135,12716,0),
(50690,135,12606,0),
(50714,135,0,0),
(50715,135,0,0),
(50716,135,12521,0),
(50717,135,0,0),
(50720,135,0,0);

-- add `creature_trainer` records for warlock trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (906,2127,3172,3324,3325,4563,4564,4565,5171,5172,5173,5612,16646,16648,23534,35778,36519,36652,38513,38797,43881,43883,43892,44469,45138,45720,48612,49718,49769,49791,49895,49945,49963,49998,50017,50028,50142,50156,50502,50723,50729,50732,53404);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(906,154,4667,0),
(2127,154,4656,0),
(3172,154,4641,0),
(3324,154,4603,0),
(3325,154,4604,0),
(4563,154,0,0),
(4564,154,0,0),
(4565,154,4610,0),
(5171,154,4567,0),
(5172,154,2381,0),
(5173,154,4566,0),
(5612,154,4682,0),
(16646,154,7566,0),
(16648,154,7566,0),
(23534,154,1522,0),
(35778,154,10550,0),
(36519,154,10815,0),
(36652,154,10840,0),
(38513,154,12576,0),
(38797,154,10840,0),
(43881,154,12821,0),
(43883,154,12821,0),
(43892,154,12821,0),
(44469,154,10702,0),
(45138,154,11932,0),
(45720,154,12053,0),
(48612,154,4608,0),
(49718,154,4608,0),
(49769,154,12522,0),
(49791,154,12526,0),
(49895,154,12053,0),
(49945,154,0,0),
(49963,154,12522,0),
(49998,154,11932,0),
(50017,154,12921,0),
(50028,154,4602,0),
(50142,154,7566,0),
(50156,154,12522,0),
(50502,154,12882,0),
(50723,154,0,0),
(50729,154,0,0),
(50732,154,2522,0),
(53404,154,12845,0);

-- add `creature_trainer` records for druid trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (3033,3034,3036,3064,4217,4218,8142,12042,13476,16655,16721,36628,44459,44726,44978,49942,49997,50034,50136,50152,50505,50506,50507,52319,52335);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(3033,39,3921,0),
(3034,39,4606,0),
(3036,39,4607,0),
(3064,39,3926,0),
(4217,39,1403,0),
(4218,39,3924,0),
(8142,39,4646,0),
(12042,39,4687,0),
(13476,39,11997,0),
(16655,39,4605,0),
(16721,39,7567,0),
(36628,39,10834,0),
(44459,39,10696,0),
(44726,39,0,0),
(44978,39,11906,0),
(49942,39,12539,0),
(49997,39,11906,0),
(50034,39,11877,0),
(50136,39,12539,0),
(50152,39,11877,0),
(50505,39,12539,0),
(50506,39,12539,0),
(50507,39,12539,0),
(52319,39,11877,0),
(52335,39,12755,0);

-- add missing creature_trainer records for Alliance Portal Trainers
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (2485,16755);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(2485,130,4822,0),
(16755,130,4824,0);

-- add missing creature_trainer records for Horde Portal Trainers
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (2492,5957,16654,27705,45139,47253);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(2492,149,4827,0),
(5957,149,4825,0),
(16654,149,4824,0),
(27705,149,9578,0),
(45139,149,11972,0),
(47253,149,12235,0);

-- add missing creature_trainer records for Neutral Portal Trainers
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (19340,20791,29156);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(19340,148,8433,0),
(20791,148,8268,0),
(29156,148,9777,0);

-- change trainer type
UPDATE `creature_template` SET `trainer_class` = 4 WHERE `entry` = 16279;
UPDATE `creature_template` SET `trainer_class` = 8 WHERE `entry` = 45139;
UPDATE `creature_template` SET `trainer_class` = 8 WHERE `entry` = 47253;

-- change a hunter trainer's gossip menu to match the creature_trainer record.
UPDATE `creature_template` SET `gossip_menu_id` = 11154 WHERE `entry` = 39100;

-- change remove mage trainer gossips from a druid trainer.
UPDATE `creature_template` SET `gossip_menu_id` = 0 WHERE `entry` = 44726;

-- correct creature_template npcflag for class trainer

-- warrior with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4593;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 4594;
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4595;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49955;
-- paladin with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49954;
-- hunter with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 38467;
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 39116;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49946;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 50609;
-- hunter with complete gossip menu
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 3963;
UPDATE `creature_template` SET `npcFlag` = 4273 WHERE `entry` = 4892;
-- rogue with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 2130;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 4582;
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4583;
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4584;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 5166;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 48615;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49909;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49949;
-- priest with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4606;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 4607;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 4608;
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 38466;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 48614;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49901;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49950;
-- mage with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4567;
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4568;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 23103;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49952;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 50714;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 50715;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 50717;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 50720;
-- mage with complete gossip menu
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 36631;
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 38465;
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 38794;
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 50716;
-- warlock with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 4563;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 4564;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 49945;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 50723;
UPDATE `creature_template` SET `npcFlag` = 48 WHERE `entry` = 50729;
-- druid with gossip_menu_id 0
UPDATE `creature_template` SET `npcFlag` = 50 WHERE `entry` = 44726;
-- alliance portal trainer with complete gossip menu
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 2485;
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 4165;
-- horde portal trainer with complete gossip menu
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 5957;
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 27705;
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 45139;
UPDATE `creature_template` SET `npcFlag` = 49 WHERE `entry` = 47253;

-- remove duplicate gossip_menu indexes
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 10694 AND `OptionIndex` = 1;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 10698 AND `OptionIndex` = 1;
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 10696 AND `OptionIndex` = 1;

-- Correct Profession Trainers

-- Correct flags on numerous profession trainer gossip_options.
UPDATE `gossip_menu_option` SET `OptionType` = 5, `OptionNpcflag` = 16 WHERE `OptionIcon` = 3 AND `MenuId` IN (4361,4134,4129,8540,2741,4164,4156,1468,12846,9084,7817,4356,7455,2021,8460,6087,10437,12725,9581,12235,10555,11875,12344,12151,10835,10838,11879,11913,12048,12341,12050,12010,12537,12920,12714,10684);

-- add missing creature_trainer for Herbalists.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (812,908,1218,1458,1473,2390,2856,3013,3404,3965,4204,4614,5137,8146,12025,16367,16644,16736,17434,18748,18776,26910,26958,26974,26994,33639,33678,33996,46741);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(812,101,7691,0),
(908,101,0,0),
(1218,101,7691,0),
(1458,101,7691,0),
(1473,101,0,0),
(2390,101,0,0),
(2856,101,0,0),
(3013,101,7691,0),
(3404,101,7691,0),
(3965,101,0,0),
(4204,101,7691,0),
(4614,101,7691,0),
(5137,101,7691,0),
(8146,101,7691,0),
(12025,101,0,0),
(16367,101,7524,1),
(16644,101,7691,0),
(16736,101,7691,0),
(17434,101,7459,0),
(18748,101,7691,0),
(18776,101,7691,0),
(26910,101,0,0),
(26958,101,0,0),
(26974,101,0,0),
(26994,101,0,0),
(33639,101,10350,0),
(33996,101,10408,1),
(33678,101,10350,0),
(46741,101,7691,0);

-- add missing creature_trainer for Miners
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1681,1701,3001,3137,3175,3357,3555,4254,4598,5392,16663,16752,17488,18747,18779,26912,26962,26976,33640,33682,43431,46357,53409);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1681,49,4361,0),
(1701,49,7690,0),
(3001,49,7690,0),
(3137,49,7690,0),
(3175,49,0,0),
(3357,49,7690,0),
(3555,49,0,0),
(4254,49,7690,0),
(4598,49,0,0),
(5392,49,7690,0),
(16663,49,7690,0),
(16752,49,7690,0),
(17488,49,7690,0),
(18747,49,7690,0),
(18779,49,7690,0),
(26912,49,0,0),
(26962,49,0,0),
(26976,49,0,0),
(33640,49,10351,0),
(33682,49,10351,0),
(43431,49,7690,0),
(46357,49,7690,0),
(53409,49,0,0);

-- add missing creature_trainer for Skinners.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (6288,6295,6306,6387,7087,8144,12030,16692,16763,17441,18755,18777,19180,26913,26986,27000,33641,33683,53437);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(6288,83,0,0),
(6295,83,0,0),
(6306,83,0,0),
(6387,83,0,0),
(7087,83,0,0),
(8144,83,0,0),
(12030,83,0,0),
(16692,83,7842,0),
(16763,83,7842,0),
(17441,83,7429,0),
(18755,83,7842,0),
(18777,83,7842,0),
(19180,83,7818,0),
(26913,83,0,0),
(26986,83,0,0),
(27000,83,0,0),
(33641,83,10360,0),
(33683,83,10360,0),
(53437,83,0,0);

-- add missing creature_trainer for Alchemists.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1386,1470,2391,2837,3009,3964,4160,4611,4900,5177,5499,7948,16161,16588,16642,16723,17215,18802,19052,26903,26951,26975,26987,27023,27029,28703,33588,33674);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1386,122,4134,0),
(1470,122,4115,0),
(2391,122,4129,0),
(2837,122,4127,0),
(3009,122,4128,0),
(3964,122,4117,0),
(4160,122,4131,0),
(4611,122,4132,0),
(4900,122,4122,0),
(5177,122,4123,0),
(5499,122,4201,0),
(7948,122,4133,0),
(16161,122,7524,1),
(16588,122,7810,0),
(16642,122,8733,0),
(16723,122,8863,0),
(17215,122,7384,0),
(18802,122,7818,0),
(19052,122,8540,0),
(26903,122,0,0),
(26951,122,0,0),
(26975,122,0,0),
(26987,122,0,0),
(27023,122,0,0),
(27029,122,0,0),
(28703,122,10627,0),
(33588,122,0,0),
(33674,122,10359,0);

-- add missing creature_trainer for Blacksmiths.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1241,2836,2998,3136,3174,3355,3478,3557,4596,4888,7232,15400,16583,16669,16823,19341,20124,20125,21209,26564,26904,26952,26988,27034,33591,33631,33675,43429,55684);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1241,58,2741,0),
(2836,58,2784,0),
(2998,58,1017,0),
(3136,58,2781,0),
(3174,58,2746,0),
(3355,58,1012,0),
(3478,58,2783,0),
(3557,58,2749,0),
(4596,58,0,0),
(4888,58,0,0),
(7232,58,1041,0),
(15400,58,7256,0),
(16583,58,8760,0),
(16669,58,7494,0),
(16823,58,7826,0),
(19341,58,7809,0),
(20124,58,9131,0),
(20125,58,9132,0),
(21209,58,8254,0),
(26564,58,9459,0),
(26904,58,0,0),
(26952,58,0,0),
(26988,58,0,0),
(27034,58,0,0),
(33591,58,0,0),
(33631,58,10362,0),
(33675,58,10362,0),
(43429,58,8521,0),
(55684,58,0,0);

-- add missing creature_trainer for Enchanters.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (3011,3606,4213,4616,5157,5695,7949,11072,11073,11074,16160,16633,16725,18753,18773,19251,19252,19540,26906,26954,26980,26990,33583,33633,33676,53410);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(3011,62,4165,0),
(3606,62,4156,0),
(4213,62,4163,0),
(4616,62,4166,0),
(5157,62,4160,0),
(5695,62,4202,0),
(7949,62,4164,0),
(11072,62,4169,0),
(11073,62,4171,0),
(11074,62,4170,0),
(16160,62,7524,1),
(16633,62,8731,0),
(16725,62,8866,0),
(18753,62,7818,0),
(18773,62,7818,0),
(19251,62,0,0),
(19252,62,7818,0),
(19540,62,7818,0),
(26906,62,0,0),
(26954,62,0,0),
(26980,62,0,0),
(26990,62,0,0),
(33583,62,0,0),
(33633,62,10365,0),
(33676,62,10365,0),
(53410,62,12843,0);

-- add missing creature_trainer for Engineers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1676,1702,3290,3494,4941,5174,7406,7944,8126,8736,8738,11017,11025,11031,11037,16667,16726,17222,17634,17637,18752,18775,19576,24868,25099,25277,26907,26991,33586,33634,33677,52636,52651);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1676,407,4145,0),
(1702,407,4135,0),
(3290,407,4136,0),
(3494,407,4140,0),
(4941,407,12846,0),
(5174,407,4150,0),
(7406,407,1467,0),
(7944,407,1468,0),
(8126,407,1469,0),
(8736,407,4152,0),
(8738,407,1465,0),
(11017,407,4151,0),
(11025,407,4142,0),
(11031,407,0,0),
(11037,407,4138,0),
(16667,407,8656,0),
(16726,407,8867,0),
(17222,407,7383,0),
(17634,407,7512,0),
(17637,407,7513,0),
(18752,407,0,0),
(18775,407,7820,0),
(19576,407,7818,0),
(24868,407,0,0),
(25099,407,9084,0),
(25277,407,0,0),
(26907,407,0,0),
(26991,407,0,0),
(33586,407,0,0),
(33634,407,10363,0),
(33677,407,10363,0),
(52636,407,8517,0),
(52651,407,13014,0);

-- add missing creature_trainer for Scribes
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (26916,26959,26977,26995,30710,30711,30716,30721,33638,33679,53415);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(26916,63,9879,0),
(26959,63,9879,0),
(26977,63,9879,0),
(26995,63,9879,0),
(30710,63,0,0),
(30711,63,0,0),
(30716,63,0,0),
(30721,63,0,0),
(33638,63,9879,0),
(33679,63,9879,0),
(53415,63,12844,0);

-- add missing creature_trainer for Jewelcrafters.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (5388,15501,18751,18774,19063,19539,19775,19778,26915,26960,26982,26997,28701,33590,33637,33680,46675,52586,52587,52657);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(5388,29,12848,0),
(15501,29,8376,0),
(18751,29,8646,0),
(18774,29,7818,0),
(19063,29,7815,0),
(19539,29,8646,0),
(19775,29,8380,0),
(19778,29,8382,0),
(26915,29,9894,0),
(26960,29,9895,0),
(26982,29,9893,0),
(26997,29,9892,0),
(28701,29,9873,0),
(33590,29,0,0),
(33637,29,8646,0),
(33680,29,8646,0),
(46675,29,7815,0),
(52586,29,0,0),
(52587,29,0,0),
(52657,29,7815,0);

-- add missing creature_trainer for Leatherworkers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1385,1632,3007,3069,3365,3549,3605,3703,3967,4212,4588,5127,7869,8153,11097,11098,16688,16728,17442,18754,18771,19187,26911,26996,26998,28400,29508,29509,33581,33635,33681,53436);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1385,56,4208,0),
(1632,56,4172,0),
(3007,56,4242,0),
(3069,56,4185,0),
(3365,56,4209,0),
(3549,56,4184,0),
(3605,56,4174,0),
(3703,56,4206,0),
(3967,56,4211,0),
(4212,56,4241,0),
(4588,56,0,0),
(5127,56,4205,0),
(7869,56,0,0),
(8153,56,4842,0),
(11097,56,4243,0),
(11098,56,4244,0),
(16688,56,8732,0),
(16728,56,0,0),
(17442,56,7430,0),
(18754,56,7816,0),
(18771,56,7816,0),
(19187,56,7816,0),
(26911,56,0,0),
(26996,56,0,0),
(26998,56,0,0),
(28400,56,0,0),
(29508,56,0,0),
(29509,56,0,0),
(33581,56,0,0),
(33635,56,10361,0),
(33681,56,10361,0),
(53436,56,12852,0);

-- add missing creature_trainer for Tailors.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1103,2399,2627,3004,3484,3523,3704,4159,4576,4578,5153,11052,16366,16640,16729,17487,18749,18772,26914,26964,26969,27001,33580,33636,33684,44783,45559);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1103,163,4261,0),
(2399,163,4356,0),
(2627,163,4348,0),
(3004,163,4351,0),
(3484,163,4270,0),
(3523,163,0,0),
(3704,163,4350,0),
(4159,163,4349,0),
(4576,163,0,0),
(4578,163,0,0),
(5153,163,4345,0),
(11052,163,4355,0),
(16366,163,7524,1),
(16640,163,8658,0),
(16729,163,8868,0),
(17487,163,8519,0),
(18749,163,7817,0),
(18772,163,7818,0),
(26914,163,10116,0),
(26964,163,10117,0),
(26969,163,10115,0),
(27001,163,10114,0),
(33580,163,0,0),
(33636,163,10364,0),
(33684,163,10364,0),
(44783,163,4351,0),
(45559,163,4351,0);

-- add missing creature_trainer for First Aid Trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (2326,2329,3181,4211,4591,5150,5939,5943,6094,12939,16272,16662,16731,17214,17424,19184,19478,22477,23734,26956,29233,36615,49879,50574,56796);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(2326,107,5855,0),
(2329,107,5855,0),
(3181,107,5855,0),
(4211,107,5855,0),
(4591,107,0,0),
(5150,107,4762,0),
(5939,107,5856,0),
(5943,107,5856,0),
(6094,107,5855,0),
(12939,107,5382,0),
(16272,107,5856,0),
(16662,107,5855,0),
(16731,107,5855,0),
(17214,107,7380,0),
(17424,107,7455,0),
(19184,107,8522,0),
(19478,107,5856,0),
(22477,107,8522,0),
(23734,107,8802,0),
(26956,107,0,0),
(29233,107,0,0),
(36615,107,10826,0),
(49879,107,10826,0),
(50574,107,5855,0),
(56796,107,657,0);

-- add missing creature_trainer for Cooking Trainers
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1355,1699,3067,3087,3399,4210,4552,4894,5159,6286,8306,16253,16277,16676,16719,17246,18987,18988,18993,19185,19369,26905,26953,26972,26989,28705,33587,34785,54232);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1355,136,5853,0),
(1699,136,5853,0),
(3067,136,5854,0),
(3087,136,5853,0),
(3399,136,4747,0),
(4210,136,5853,0),
(4552,136,5854,0),
(4894,136,12847,0),
(5159,136,4748,0),
(6286,136,2021,0),
(8306,136,5854,0),
(16253,136,7171,0),
(16277,136,5854,0),
(16676,136,5854,0),
(16719,136,5853,0),
(17246,136,7388,0),
(18987,136,7818,0),
(18988,136,7818,0),
(18993,136,7879,0),
(19185,136,8460,0),
(19369,136,0,0),
(26905,136,9985,0),
(26953,136,9987,0),
(26972,136,9988,0),
(26989,136,9986,0),
(28705,136,9772,0),
(33587,136,0,0),
(34785,136,0,0),
(54232,136,12838,0);

-- add missing creature_trainer for Fishing Trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (1651,1680,1683,1700,2834,3028,3179,3607,4156,4573,5161,5690,5938,5941,12032,12961,14740,16774,16780,17101,18018,18911,23896,26909,26957,26993,28742,44975,50570,56068);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(1651,10,5665,0),
(1680,10,5665,0),
(1683,10,5665,0),
(1700,10,5665,0),
(2834,10,5665,0),
(3028,10,5665,0),
(3179,10,5665,0),
(3607,10,5665,0),
(4156,10,5665,0),
(4573,10,12887,0),
(5161,10,4742,0),
(5690,10,5665,0),
(5938,10,5665,0),
(5941,10,5665,0),
(12032,10,5665,0),
(12961,10,5665,0),
(14740,10,6087,1),
(16774,10,5665,0),
(16780,10,5665,0),
(17101,10,7361,0),
(18018,10,7609,1),
(18911,10,10437,0),
(23896,10,8826,0),
(26909,10,0,0),
(26957,10,0,0),
(26993,10,0,0),
(28742,10,9833,0),
(44975,10,12443,0),
(50570,10,5665,0),
(56068,10,5665,0);

-- add missing creature_trainer for Archaeology Trainers.
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (39718,47346,47382,47569,47571,47572,47575,47579,51997,53421);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(39718,373,11821,0),
(47346,373,11821,0),
(47382,373,11821,0),
(47569,373,11821,0),
(47571,373,12410,0),
(47572,373,11821,0),
(47575,373,11821,0),
(47579,373,11821,0),
(51997,373,12725,0),
(53421,373,12850,0);

-- add missing creature_trainer for Riding Trainers
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (16280);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(16280,46,8275,0);

-- correct existing creature_trainer
UPDATE `creature_trainer` SET `MenuId` = 10138 WHERE `CreatureId` = 28699;

-- change a cooking trainer's gossip menu to match the creature_trainer record.
UPDATE `creature_template` SET `gossip_menu_id` = 10569 WHERE `entry` = 34786;

-- correct trainer npcFlags
-- herbalism
UPDATE `creature_template` SET `npcFlag` = 81 WHERE `entry` = 812;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 908;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 1473;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 2114;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 2390;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 2856;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3185;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3604;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3965;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 4898;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 12025;
UPDATE `creature_template` SET `npcFlag` = 83 WHERE `entry` = 17434;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 17983;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26910;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26958;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26974;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26994;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28704;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 33639;
-- mining
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3175;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3555;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 4598;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 8128;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26912;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26962;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26976;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26999;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28698;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 52170;
UPDATE `creature_template` SET `npcFlag` = 208 WHERE `entry` = 53409;
-- skinning
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6287;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6288;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6289;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6290;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6291;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6292;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6295;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 6306;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 6387;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 7087;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 7088;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 7089;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 8144;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 12030;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 16273;
UPDATE `creature_template` SET `npcFlag` = 81 WHERE `entry` = 16692;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26913;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26963;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26986;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 27000;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28696;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 44782;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 53437;
-- alchemy
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 2132;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3184;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3603;
UPDATE `creature_template` SET `npcFlag` = 83 WHERE `entry` = 5177;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26903;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26951;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26975;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26987;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 27023;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 27029;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33588;
UPDATE `creature_template` SET `npcFlag` = 3281 WHERE `entry` = 33630;
-- blacksmithing
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 4258;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 4596;
UPDATE `creature_template` SET `npcFlag` = 4304 WHERE `entry` = 4888;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 5164;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 7230;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 7231;
UPDATE `creature_template` SET `npcFlag` = 81 WHERE `entry` = 7232;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 11146;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 11177;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 11178;
UPDATE `creature_template` SET `npcFlag` = 4307 WHERE `entry` = 15400;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 16724;
UPDATE `creature_template` SET `npcFlag` = 4305 WHERE `entry` = 17245;
UPDATE `creature_template` SET `npcFlag` = 83 WHERE `entry` = 26564;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26904;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26952;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26981;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26988;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 27034;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28694;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29505;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29506;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29924;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33591;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 33631;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 37072;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 45548;
UPDATE `creature_template` SET `npcFlag` = 4304 WHERE `entry` = 55684;
-- enchanting
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 19251;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26906;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26954;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26980;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26990;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28693;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33583;
UPDATE `creature_template` SET `npcFlag` = 2257 WHERE `entry` = 33676;
-- engineering
UPDATE `creature_template` SET `npcFlag` = 83 WHERE `entry` = 5174;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 11031;
UPDATE `creature_template` SET `npcFlag` = 208 WHERE `entry` = 18752;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 24868;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 25277;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26907;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26955;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26991;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28697;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29513;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29514;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33586;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 45545;
-- inscription
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28702;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30706;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 30709;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30710;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30711;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30713;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30715;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30716;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30717;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30721;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 30722;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 33679;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 46716;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 53415;
-- jewelcrafting
UPDATE `creature_template` SET `npcFlag` = 211 WHERE `entry` = 5388;
UPDATE `creature_template` SET `npcFlag` = 81 WHERE `entry` = 15501;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 18751;
UPDATE `creature_template` SET `npcFlag` = 81 WHERE `entry` = 19063;
UPDATE `creature_template` SET `npcFlag` = 81 WHERE `entry` = 19775;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33590;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 33680;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 52586;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 52587;
-- leatherworking
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 4588;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 7869;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 7871;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 16278;
UPDATE `creature_template` SET `npcFlag` = 81 WHERE `entry` = 16688;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 16728;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 21087;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26911;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26961;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26996;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26998;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 28700;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29507;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29508;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 29509;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33581;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 53436;
-- tailoring
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 3523;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 4576;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 4578;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 9584;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33580;
-- first aid
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 4591;
UPDATE `creature_template` SET `npcFlag` = 208 WHERE `entry` = 18990;
UPDATE `creature_template` SET `npcFlag` = 208 WHERE `entry` = 18991;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 28706;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 45540;
-- cooking
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 19369;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 33587;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 34785;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 45550;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 46709;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 47405;
-- fishing
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 7946;
UPDATE `creature_template` SET `npcFlag` = 209 WHERE `entry` = 18911;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26909;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26957;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 26993;
UPDATE `creature_template` SET `npcFlag` = 80 WHERE `entry` = 32474;
-- riding
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 4753;
UPDATE `creature_template` SET `npcFlag` = 83 WHERE `entry` = 16280;
UPDATE `creature_template` SET `npcFlag` = 82 WHERE `entry` = 20914;

-- change trainer type
UPDATE `creature_template` SET `trainer_type` = 2 WHERE `entry` = 54232;
UPDATE `creature_template` SET `trainer_type` = 2 WHERE `entry` = 23896;
UPDATE `creature_template` SET `trainer_type` = 2 WHERE `entry` = 44975;

-- update gossip_menu_option flags
UPDATE `gossip_menu_option` SET `OptionType` = 5, `OptionNpcflag` = 16 WHERE `MenuId` = 10569 AND `OptionIndex` = 0;


-- correct the profession trainers
DELETE FROM `creature_trainer` WHERE `CreatureId` IN (45286,47384,47396,47400,47418,47419,47420,47421,47431,48619,50247) AND `OptionIndex` IN (0,1,3,4,6,7,8,9,10);
INSERT INTO `creature_trainer` (`CreatureId`, `TrainerId`, `MenuId`, `OptionIndex`) VALUES
(45286,122,12180,0), -- alchemy
(45286,80,12180,1), -- blacksmithing
(45286,102,12180,3), -- engineering
(45286,388,12180,4), -- herbalism
(45286,48,12180,6), -- jewelcrafting
(45286,103,12180,7), -- leatherworking
(45286,389,12180,8), -- mining
(45286,390,12180,9), -- skinning
(45286,117,12180,10), -- tailoring
(47384,122,12180,0),
(47384,80,12180,1),
(47384,102,12180,3),
(47384,388,12180,4),
(47384,48,12180,6),
(47384,103,12180,7),
(47384,389,12180,8),
(47384,390,12180,9),
(47384,117,12180,10),
(47396,122,12180,0),
(47396,80,12180,1),
(47396,102,12180,3),
(47396,388,12180,4),
(47396,48,12180,6),
(47396,103,12180,7),
(47396,389,12180,8),
(47396,390,12180,9),
(47396,117,12180,10),
(47400,122,12180,0),
(47400,80,12180,1),
(47400,102,12180,3),
(47400,388,12180,4),
(47400,48,12180,6),
(47400,103,12180,7),
(47400,389,12180,8),
(47400,390,12180,9),
(47400,117,12180,10),
(47418,122,12180,0),
(47418,80,12180,1),
(47418,102,12180,3),
(47418,388,12180,4),
(47418,48,12180,6),
(47418,103,12180,7),
(47418,389,12180,8),
(47418,390,12180,9),
(47418,117,12180,10),
(47419,122,12180,0),
(47419,80,12180,1),
(47419,102,12180,3),
(47419,388,12180,4),
(47419,48,12180,6),
(47419,103,12180,7),
(47419,389,12180,8),
(47419,390,12180,9),
(47419,117,12180,10),
(47420,122,12180,0),
(47420,80,12180,1),
(47420,102,12180,3),
(47420,388,12180,4),
(47420,48,12180,6),
(47420,103,12180,7),
(47420,389,12180,8),
(47420,390,12180,9),
(47420,117,12180,10),
(47421,122,12180,0),
(47421,80,12180,1),
(47421,102,12180,3),
(47421,388,12180,4),
(47421,48,12180,6),
(47421,103,12180,7),
(47421,389,12180,8),
(47421,390,12180,9),
(47421,117,12180,10),
(47431,122,12180,0),
(47431,80,12180,1),
(47431,102,12180,3),
(47431,388,12180,4),
(47431,48,12180,6),
(47431,103,12180,7),
(47431,389,12180,8),
(47431,390,12180,9),
(47431,117,12180,10),
(48619,122,12180,0),
(48619,80,12180,1),
(48619,102,12180,3),
(48619,388,12180,4),
(48619,48,12180,6),
(48619,103,12180,7),
(48619,389,12180,8),
(48619,390,12180,9),
(48619,117,12180,10),
(50247,122,12180,0),
(50247,80,12180,1),
(50247,102,12180,3),
(50247,388,12180,4),
(50247,48,12180,6),
(50247,103,12180,7),
(50247,389,12180,8),
(50247,390,12180,9),
(50247,117,12180,10);

-- correct types and flags on training gossips for initial menu.
UPDATE `gossip_menu_option` SET `OptionType` = 5, `OptionNpcflag` = 16 WHERE `MenuId` = 12180 AND `OptionIndex` BETWEEN 0 AND 10;

-- correct a few innkeepers
UPDATE `gossip_menu_option` SET `OptionType` = 8, `OptionNpcflag` = 65536 WHERE `MenuId` = 1297 AND `OptionIndex` = 1;
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcflag` = 128 WHERE `MenuId` = 1297 AND `OptionIndex` = 2;
UPDATE `gossip_menu_option` SET `OptionType` = 1, `OptionNpcflag` = 1 WHERE `MenuId` = 1293 AND `OptionIndex` = 0;
UPDATE `gossip_menu_option` SET `OptionType` = 8, `OptionNpcflag` = 65536 WHERE `MenuId` = 1293 AND `OptionIndex` = 1;
UPDATE `gossip_menu_option` SET `OptionType` = 3, `OptionNpcflag` = 128 WHERE `MenuId` = 1293 AND `OptionIndex` = 2;
UPDATE `gossip_menu_option` SET `OptionIcon` = 0, `OptionText` = 'What can I do at an inn?', `OptionBroadcastTextId` = 4308 WHERE `MenuId` = 1294 AND `OptionIndex` = 2;
UPDATE `gossip_menu_option` SET `OptionIcon` = 0, `OptionText` = 'What can I do at an inn?', `OptionBroadcastTextId` = 4308 WHERE `MenuId` = 7468 AND `OptionIndex` = 2;