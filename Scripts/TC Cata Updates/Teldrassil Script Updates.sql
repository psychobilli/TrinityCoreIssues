-- fix the Teldrassil training dummies.
UPDATE `creature_template` SET `ScriptName` = 'npc_training_dummy' WHERE `entry` = 44614;
-- set correct quest giver for Arcane Missiles (Night Elf)
SET @Rhyanda := 43006;
SET @ArcaneMissilesNE := 26940;
UPDATE `creature_queststarter` SET `id` = @Rhyanda WHERE `quest` = @ArcaneMissilesNE;
-- set Seek Redemption as a prerequisite quest for Nature's Reprisal
SET @SeekRedemption := 489;
SET @NaturesReprisal := 13946;
UPDATE `quest_template_addon` SET `PrevQuestID` = @SeekRedemption WHERE `ID` = @NaturesReprisal;
-- set Teldrassil: Passing Awareness as a prerequisite for Teldrassil: The Refusal of the Aspects
SET @PassingAwareness := 28731;
SET @RefusalOfTheAspects := 929;
UPDATE `quest_template_addon` SET `PrevQuestID` = @PassingAwareness WHERE `ID` = @RefusalOfTheAspects;
-- set Teldrassil: The Refusal of the Aspects as a prerequisite for Tedrassil: The Burden of the Kaldorei
SET @BurdenOfTheKaldorei := 7383;
UPDATE `quest_template_addon` SET `PrevQuestID` = @RefusalOfTheAspects WHERE `ID` = @BurdenOfTheKaldorei;
-- update Sentinel Huntress scripts to assist in combat.

SET @SentinelHuntress := 34249;
-- DELETE FROM `smart_scripts` WHERE `entryorguid` = @SentinelHuntress AND `source_type` = 0 AND `id` IN (13,14,15);
-- INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- (@SentinelHuntress,0,13,0,4,0,100,512,1000,1000,2000,2000,0,20,1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sentinel Huntress - IC - Auto Attack'),
-- (@SentinelHuntress,0,14,0,4,0,100,512,5000,8000,10000,10000,0,11,66032,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sentinel Huntress - IC - Cast Net'),
-- (@SentinelHuntress,0,15,0,0,12,100,512,1,20,0,0,0,11,66031,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sentinel Huntress - Target Health Low - Cast Bandage');
-- correct Gnarlpine Shaman flee script - run at 15% health, not 30000%
SET @GnarlpineShaman := 2009;
UPDATE `smart_scripts` SET `event_param2` = 15, `event_param4` = 0 WHERE `source_type` = 0 AND `entryorguid` = @GnarlpineShaman;
-- remove Gnarlpine Augur flee script - they don't flee they enrage.
SET @GnarlpineAugur := 2011;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = @GnarlpineAugur AND `id` = 0;
UPDATE `smart_scripts` SET `id` = 0 WHERE `source_type` = 0 AND `entryorguid` = @GnarlpineAugur AND `id` = 1;
UPDATE `smart_scripts` SET `id` = 1 WHERE `source_type` = 0 AND `entryorguid` = @GnarlpineAugur AND `id` = 2;
-- update Mist quest to complete when NPC Mist is near Sentinel Arynia Cloudsbreak
SET @Mist := 3568;
SET @Cloudsbreak := 3519;
SET @MistAction0 := 356800;
SET @MistAction1 := 356801;
SET @CloudsbreakAction0 := 351900;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = @Mist AND `id` = 4;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `source_type` = 0 AND `entryorguid` = @Mist AND `id` = 1;
UPDATE `smart_scripts` SET `target_param1` = 1 WHERE `source_type` = 0 AND `entryorguid` = @Mist AND `id` = 2;
UPDATE `smart_scripts` SET `action_param1` = 10 WHERE `source_type` = 0 AND `entryorguid` = @Mist AND `id` = 3;
UPDATE `smart_scripts` SET `action_param1` = 1 WHERE `source_type` = 9 AND `entryorguid` = @MistAction0 AND `id` = 0;
UPDATE `smart_scripts` SET `action_type` = 45, `action_param1` = 1, `action_param2` = 1, `target_param2` = 0 WHERE `source_type` = 9 AND `entryorguid` = @MistAction1 AND `id` = 1;
UPDATE `smart_scripts` SET `event_param1` = 1000, `event_param2` = 1000, `target_param1` = 1 WHERE `source_type` = 9 AND `entryorguid` = @MistAction1 AND `id` = 2;
UPDATE `smart_scripts` SET `event_param1` = 6000, `event_param2` = 6000 WHERE `source_type` = 9 AND `entryorguid` = @MistAction1 AND `id` = 3;
UPDATE `smart_scripts` SET `event_param1` = 1000, `event_param2` = 1000 WHERE `source_type` = 9 AND `entryorguid` = @MistAction1 AND `id` = 4;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Cloudsbreak AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @CloudsbreakAction0 AND `source_type` = 9 AND `id` IN (0,1,2,3,4);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@Cloudsbreak,0,0,0,38,0,100,0,1,1,0,0,0,80,351900,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sentinel Arynia Cloudsbreak - On Data Set - Run Sript'),
(@CloudsbreakAction0,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,3568,0,0,0,0,0,0,'Sentinel Arynia Cloudsbreak - On Script - Set Orientation'),
(@CloudsbreakAction0,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sentinel Arynia Cloudsbreak - On Script - Set Flag Standstate ''Kneel'''),
(@CloudsbreakAction0,9,2,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sentinel Arynia Cloudsbreak - On Script - Say Line 0'),
(@CloudsbreakAction0,9,3,0,0,0,100,0,5000,5000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sentinel Arynia Cloudsbreak - On Script - Remove Flag Standstate ''Kneel'''),
(@CloudsbreakAction0,9,4,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sentinel Arynia Cloudsbreak - On Script - Set Orientation');

-- clear duplicate spawns in Starbreeze Village
DELETE FROM `creature` WHERE `guid` IN (312857, 312679, 312804, 312442, 312440, 312674, 312438, 312435, 312437, 312825);
-- clear duplciate spawns near Ferocitas the Dream Eater
DELETE FROM `creature` WHERE `guid` IN (312818, 312873, 312432, 312431, 312639, 312633, 312859);
-- clear duplicate spawns near Zen Foulhoof
DELETE FROM `creature` WHERE `guid` IN (312626, 312884, 312843, 312841, 312427, 312839, 312844, 312845);
-- clear duplicate spawns near Lake Al'Ameth and Dolanaar
DELETE FROM `creature` WHERE `guid` IN (311595, 312796, 311597, 312407);
-- clear duplicate spawns in and near Ban'ethil Barrow Den
DELETE FROM `creature` WHERE `guid` IN (312372, 312360, 312368, 312342, 312397, 312332);