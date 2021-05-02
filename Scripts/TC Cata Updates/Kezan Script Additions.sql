-- apply C++ scripts to Bilgewater Buccaneer (37179,37213) and Steamwheedle Shark (37114)
UPDATE `creature_template` SET scriptName = 'npc_bilgewater_buccaneer_necessary_roughness' WHERE `entry` = 37179;
UPDATE `creature_template` SET `scriptName` = 'npc_steamwheedle_shark_necessary_roughness' WHERE `entry` = 37114;
UPDATE `creature_template` SET `scriptName` = 'npc_bilgewater_buccaneer_fourth_and_goal' WHERE `entry` = 37213;

-- The Great Bank Heist
DELETE FROM `phase_area` WHERE `AreaId` = 4737 AND `PhaseId` IN (383);
INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4737, 383, 'Kezan ''The Great Bank Heist''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (381,383) AND `SourceEntry` IN (4765,4737) AND `ConditionValue1` = 14122;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(26,383,4737,0,0,47,0,14122,74,0,0,0,0,'','Kezan ''The Great Bank Heist'' quest taken, completed or rewarded set Phase 383'),
(26,381,4765,0,0,47,0,14122,74,0,1,0,0,'','Kezan ''The Great Bank Heist'' quest taken, completed or rewarded remove Phase 381');

UPDATE `creature_template` SET `VehicleId` = 476, `AIName` = 'SmartAI' WHERE `entry` = 35486;

DELETE FROM `spell_scripts` WHERE `id` = 67555;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(67555,0,0,15,67488,0,0,0,0,0,0),
(67555,1,0,15,67476,0,0,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureID` = 35486;
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`SoundType`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(35486,0,0,'You are about to break into the First Bank of Kezan''s vault to retrieve your Personal Riches!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,1,0,'Use what is called for in your Goblin All-In-1-Der Belt below to crack open the vault!$B|TInterface\Icons\inv_misc_enggizmos_20.blp:20 TInterface\Icons\inv_misc_bomb_07.blp:20 TInterface\Icons\inv_misc_ear_nightelf_02.blp:20 TInterface\Icons\INV_Misc_EngGizmos_swissArmy.blp:20 TInterface\Icons\INV_Misc_EngGizmos_swissArmy.blp:20 TInterface\Icons\inv_weapon_shortblade_21.blp:20|t',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,2,0,'The vault will be cracked once the Vault Breaking progress bar reaches 100 percent!$B|t$B|tDoing the wrong thing at the wrong time will reduce the progress of the bar.',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,3,0,'Good luck!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,4,0,'Use your Amazing G-Ray!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,5,0,'Use your Blastcrackers!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,6,0,'Use your Ear-O-Scope!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,7,0,'Use your Infinifold Lockpick!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,8,0,'Use your Kaja''mite Drill.',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,9,0,'Correct!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,10,0,'Incorrect!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,11,0,'Timed Out!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan'),
(35486,12,0,'Success! You have your Personal Riches!',41,0,100,0,0,0,0,0,0,'First Bank of Kezan');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35486) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35486,0,0,1,27,0,100,512,0,0,0,0,0,33,35486,0,0,0,0,0,7,0,0,0,0,0,0,0,'First Bank of Kezan - On Passenger Boarded KC First Bank of Kezan'),
(35486,0,1,2,61,0,100,512,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'First Bank of Kezan - On Passenger Boarded Set Stored Targetlist 1'),
(35486,0,2,0,61,0,100,512,0,0,0,0,0,80,3548600,2,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Passenger Boarded Run Script'),
(35486,0,3,0,1,1,100,512,7500,7500,7500,7500,0,88,3548601,3548605,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - OOC Run random script.'),
(35486,0,4,0,77,1,100,512,1,3,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Counter Set 1 3 Set Event Phase 2.'),
(35486,0,5,0,1,2,100,512,1000,1000,0,0,0,45,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - OOC Set Data 1 1.'),
(35486,0,6,7,38,2,100,512,1,1,0,100,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Data 1 1 Set Say Line 12.'),
(35486,0,7,8,61,2,100,512,0,0,0,0,0,56,46858,1,0,0,0,0,12,1,0,0,0,0,0,0,'First Bank of Kezan - On Data 1 1 Set add item Personal Riches.'),
(35486,0,8,9,61,2,100,512,0,0,0,0,0,28,67476,0,0,0,0,0,12,1,0,0,0,0,0,0,'First Bank of Kezan - On Data 1 1 Set Remove Aura ''Vault Cracking Toolset'''),
(35486,0,9,10,61,2,100,512,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Data 1 1 Set Destroy Vehicle'),
(35486,0,10,0,61,2,100,512,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Data 1 1 Set Reset All Scripts.');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3548600,3548601,3548602,3548603,3548604,3548605,3548606) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3548600,9,0,0,0,0,100,512,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 0 (Event Intro)'),
(3548600,9,1,0,0,0,100,512,9000,9000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 1 (Event Intro)'),
(3548600,9,2,0,0,0,100,512,9000,9000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 2 (Event Intro)'),
(3548600,9,3,0,0,0,100,512,9000,9000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 3 (Event Intro)'),
(3548600,9,4,0,0,0,100,512,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Set Event Phase 1.'),
(3548601,9,0,0,0,0,100,512,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 4'),
(3548601,9,1,0,0,0,100,512,2000,2000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 9'),
(3548601,9,2,0,0,0,100,512,0,0,0,0,0,63,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Increment Counter'),
(3548602,9,0,0,0,0,100,512,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 5'),
(3548602,9,1,0,0,0,100,512,2000,2000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 9'),
(3548602,9,2,0,0,0,100,512,0,0,0,0,0,63,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Increment Counter'),
(3548603,9,0,0,0,0,100,512,5000,5000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 6'),
(3548603,9,1,0,0,0,100,512,2000,2000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 9'),
(3548603,9,2,0,0,0,100,512,0,0,0,0,0,63,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Increment Counter'),
(3548604,9,0,0,0,0,100,512,5000,5000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 7'),
(3548604,9,1,0,0,0,100,512,2000,2000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 9'),
(3548604,9,2,0,0,0,100,512,0,0,0,0,0,63,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Increment Counter'),
(3548605,9,0,0,0,0,100,512,5000,5000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 8'),
(3548605,9,1,0,0,0,100,512,2000,2000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Say Line 9'),
(3548605,9,2,0,0,0,100,512,0,0,0,0,0,63,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'First Bank of Kezan - On Script - Increment Counter');

-- 447
UPDATE `creature_template` SET `VehicleId` = 590 WHERE `entry` = 37598;

DELETE FROM `spell_scripts` WHERE `id` = 70253;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(70253,0,0,15,70252,0,0,0,0,0,0);

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 201736;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (201736) AND `source_type` = 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(201736,1,0,1,64,0,100,512,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gasbot Control Panel - On Gossip Hello Store Target List'),
(201736,1,1,0,61,0,100,512,0,0,0,0,0,67,1,5000,5000,0,0,100,7,0,0,0,0,0,0,0,'Gasbot Control Panel - Gossip Hello Create Timed Event'),
(201736,1,2,3,59,0,100,512,1,0,0,0,0,33,37598,0,0,0,0,0,12,1,0,0,0,0,0,0,'Gasbot Control Panel - Timed Event Triggered KC 447'),
(201736,1,3,0,61,0,100,512,0,0,0,0,0,75,49416,0,0,0,0,0,12,1,0,0,0,0,0,0,'Gasbot Control Panel - Timed Event Triggered Add Aura ''Generic Quest Invisibility Detection 1''');
	
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 37598;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(37598,0,0,1,54,0,100,512,0,0,0,0,0,53,1,37598,0,0,0,0,1,0,0,0,0,0,0,0,'Gasbot- On Summoned Start WP'),
(37598,0,1,0,61,0,100,512,0,0,0,0,0,75,70256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gasbot- On Summoned Start WP');

DELETE FROM `waypoints` WHERE `entry` = 37598;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(37598,1,-8424.21, 1342.95, 102.41,''),
(37598,2,-8424.27, 1346.94, 104.66,''),
(37598,3,-8423.88, 1365.72, 104.68,''),
(37598,4,-8412.07, 1364.56, 104.71,'');

-- Life Savings
DELETE FROM `spell_scripts` WHERE `id` = 92629;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(92629,0,0,6,648,0,0,-7849.25,1838.15,7.72742,1.56003);