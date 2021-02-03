-- select * from npc_spellclick_spells where npc_entry in (33842,33844,34840);
-- select * from creature_template where entry in (33842,33844,34840);
-- correct the Goblin Hot Rod for Rollin with my Homies (14071)
UPDATE `creature_template` SET `npcflag` = 16777216, `flags_extra` = 8192 WHERE `entry` = 34840;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 34840 AND `spell_id` = 66392;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(34840, 66392, 1, 0);

-- make Keys to the Hot Rod (28607) repeatable.
UPDATE `quest_template_addon` SET `SpecialFlags` = 1 WHERE `Id` = 28607;

-- apply Generic Quest Invisibility Detection 4 (90161) on accepting Report for Tryouts (24567)
DELETE FROM `smart_scripts` WHERE `entryorguid` = 34874 AND `source_type` = 0 AND `id` IN (7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34874,0,7,0,19,0,100,0,24567,0,0,0,0,75,90161,0,0,0,0,0,7,0,0,0,0,0,0,0,'Megs Dreadshredder - On Quest ''Report for Tryouts'' Taken Apply Aura ''Generic Quest Invisibility Detection 4''');

-- make Bilgewater Bucanneer (48526) summon Bilgewater Bucanneer (37213) as a vehicle
UPDATE `creature_template` SET `npcflag` = 16777216, `flags_extra` = 8192 WHERE `entry` = 48526;
UPDATE `creature_template` SET `vehicleId` = 391 WHERE `entry` = 37179;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 48526 AND `spell_id` in (70015);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(48526, 70015, 1, 0);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 37213 AND `spell_id` in (63151,94566);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(37213, 63151, 1, 0),
(37213, 94566, 1, 0);
-- only use Bilgewater Bucanneer (37213) when Necessary Roughness: On Quest Aura (69990) is active.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 48526 AND `SourceEntry` = 70015 AND `ConditionValue1` = 69990;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,48526,70015,0,0,1,0,69990,0,0,0,0,0,'','Required aura ''Necessary Roughness: On Quest Aura'' for spellclick');
-- apply Necessary Roughness: On Quest Aura (69990) on accepting Necessary Roughness  (24502), then remove it on quest reward
DELETE FROM `smart_scripts` WHERE `entryorguid` = 37106 AND `source_type` = 0 AND `id` IN (4,5);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(37106,0,4,0,19,0,100,0,24502,0,0,0,0,75,69990,0,0,0,0,0,7,0,0,0,0,0,0,0,'Coach Crosscheck - On Quest ''Necessary Roughness'' Taken Apply Aura ''Necessary Roughness: On Quest Aura'''),
(37106,0,5,0,20,0,100,0,24502,0,0,0,0,28,69990,1,0,0,0,0,7,0,0,0,0,0,0,0,'Coach Crosscheck - On Quest ''Necessary Roughness'' Rewarded Remove Aura ''Necessary Roughness: On Quest Aura''');

-- Can't get this to work with smart scripts.  Probably need to take it into the core.
-- remove Generic Quest Invisibility Detection 4 (90161) when boarding Bilgewater Bucanneer (37213), reapply on exit.
-- DELETE FROM `smart_scripts` WHERE `entryorguid` = 37213 AND `source_type` = 0 AND `id` IN (0,1);
-- INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- (37213,0,0,0,27,0,100,0,0,0,0,0,0,28,90161,1,0,0,0,0,7,0,0,0,0,0,0,0,'Bilgewater Bucanneer - On Passenger Boarded remove aura ''Generic Quest Invisibility Detection 4'''),
-- (37213,0,1,0,28,0,100,0,0,0,0,0,0,75,90161,1,0,0,0,0,7,0,0,0,0,0,0,0,'Bilgewater Bucanneer - On Passenger Boarded apply aura ''Generic Quest Invisibility Detection 4''');

-- DELETE FROM `smart_scripts` WHERE `entryorguid` in (37213) AND `source_type` = 0 AND `id` IN (0);
-- INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- (37213,0,0,0,73,0,100,0,0,0,0,0,0,11,69971,0,0,0,0,0,8,0,0,0,-8274,1483,43,.01,'Bilgewater Buccaneer - On Summon Cast Spell ''Necessary Roughness: Summon Steamwheedle Shark 000''');

-- Add kill credit from Steamwheedle Shark
-- UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 37114;
-- DELETE FROM `smart_scripts` WHERE `entryorguid` = 37114 AND `source_type` = 0 AND `id` IN (0);
-- INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- (37114,0,0,0,8,0,100,0,70051,0,0,0,0,33,37114,0,0,0,0,0,18,100,0,0,0,0,0,0,'Steamwheedle Shark - On Spell Hit - Summon Necessary Roughness Kill Credit');

-- probably not necessary to keep this.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 37106 AND `source_type` = 0 AND `id` IN (6);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(37106,0,6,0,19,0,100,0,24502,0,0,0,0,75,90161,0,0,0,0,0,7,0,0,0,0,0,0,0,'Coach Crosscheck - On Quest ''Necessary Roughness'' Taken Apply Aura ''Generic Quest Invisibility Detection 4''');
