-- Rollin with my Homies
-- correct the Goblin Hot Rod for Rollin with my Homies (14071)
UPDATE `creature_template` SET `npcflag` = 16777216, `vehicleId` = 448, `flags_extra` = 8192 WHERE `entry` = 34840;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 34840 AND `spell_id` = 66392;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(34840, 66392, 1, 0);

-- make Keys to the Hot Rod (28607) repeatable.
UPDATE `quest_template_addon` SET `SpecialFlags` = 1 WHERE `Id` = 28607;

-- Necessary Roughness and Fourth and Goal
-- apply Generic Quest Invisibility Detection 4 (90161) on accepting Report for Tryouts (24567)
DELETE FROM `smart_scripts` WHERE `entryorguid` = 34874 AND `source_type` = 0 AND `id` IN (7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34874,0,7,0,19,0,100,0,24567,0,0,0,0,75,90161,0,0,0,0,0,7,0,0,0,0,0,0,0,'Megs Dreadshredder - On Quest ''Report for Tryouts'' Taken Apply Aura ''Generic Quest Invisibility Detection 4''');

-- make Bilgewater Bucanneer (48526) summon Bilgewater Bucanneer (37179 and 37213) as a vehicle
UPDATE `creature_template` SET `npcflag` = 16777216, `flags_extra` = 8192 WHERE `entry` = 48526;
UPDATE `creature_template` SET `vehicleId` = 582 WHERE `entry` = 37179;
UPDATE `creature_template` SET `vehicleId` = 579 WHERE `entry` = 37213;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 48526 AND `spell_id` in (70015,70065,70075);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(48526, 70015, 1, 0),
(48526, 70065, 1, 0),
(48526, 70075, 1, 0);
-- DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 37213 AND `spell_id` in (63151,94566);
-- INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
-- (37213, 63151, 1, 0),
-- (37213, 94566, 1, 0);
-- only use Bilgewater Buccaneer (37179) when Necessary Roughness: On Quest Aura (69990) is active.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 48526 AND `SourceEntry` = 70015 AND `ConditionValue1` = 69990;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,48526,70015,0,0,1,0,69990,0,0,0,0,0,'','Required aura ''Necessary Roughness: On Quest Aura'' for spellclick');
-- only use Bilgewater Buccaneer (37213) when Necessary Roughness: On Quest Aura (69990) is not active.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 48526 AND `SourceEntry` = 70075 AND `ConditionValue1` = 70086;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,48526,70075,0,0,1,0,70086,0,0,1,0,0,'','Required aura ''Fourth and Goal: Cat''s Mark Aura & Invis'' for spellclick');
-- apply Necessary Roughness: On Quest Aura (69990) on accepting Necessary Roughness  (24502), then remove it on quest reward
DELETE FROM `smart_scripts` WHERE `entryorguid` = 37106 AND `source_type` = 0 AND `id` IN (4,5);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(37106,0,4,0,19,0,100,0,24502,0,0,0,0,75,69990,0,0,0,0,0,7,0,0,0,0,0,0,0,'Coach Crosscheck - On Quest ''Necessary Roughness'' Taken Apply Aura ''Necessary Roughness: On Quest Aura'''),
(37106,0,5,0,20,0,100,0,24502,0,0,0,0,28,69990,1,0,0,0,0,7,0,0,0,0,0,0,0,'Coach Crosscheck - On Quest ''Necessary Roughness'' Rewarded Remove Aura ''Necessary Roughness: On Quest Aura''');

-- Apply Generic Quest Invisibility Detection 4 on Coach Crosscheck quests to protect against server error.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 37106 AND `source_type` = 0 AND `id` IN (6,7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(37106,0,6,0,19,0,100,0,24502,0,0,0,0,75,90161,0,0,0,0,0,7,0,0,0,0,0,0,0,'Coach Crosscheck - On Quest ''Necessary Roughness'' Taken Apply Aura ''Generic Quest Invisibility Detection 4'''),
(37106,0,7,0,19,0,100,0,28414,0,0,0,0,75,90161,0,0,0,0,0,7,0,0,0,0,0,0,0,'Coach Crosscheck - On Quest ''Fourth and Goal'' Taken Apply Aura ''Generic Quest Invisibility Detection 4''');

-- Off to the Bank and The New You
DELETE FROM `quest_template_addon` WHERE `ID` IN (26712,26711);
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`SourceSpellID`,`PrevQuestID`,`NextQuestID`,`ExclusiveGroup`,`BreadcrumbForQuestId`,`RewardMailTemplateID`,`RewardMailDelay`,`RequiredSkillID`,`RequiredSkillPoints`,`RequiredMinRepFaction`,`RequiredMaxRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepValue`,`ProvidedItemCount`,`SpecialFlags`) VALUES
(26712,0,0,0,14071,14109,26712,0,0,0,0,0,0,0,0,0,0,0),
(26711,0,0,0,14071,14110,26711,0,0,0,0,0,0,0,0,0,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (26712,26711,14109,14110);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19,0,26712,0,0,20,0,0,0,0,0,0,0,'','Show quest Off to the Bank (26712) for Males only.'),
(19,0,26711,0,0,20,1,0,0,0,0,0,0,'','Show quest Off to the Bank (26711) for Females only.'),
(19,0,14109,0,0,20,0,0,0,0,0,0,0,'','Show quest The New You (14109) for Males only.'),
(19,0,14110,0,0,20,1,0,0,0,0,0,0,'','Show quest The New You (14110) for Females only.');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` IN (10620,10622,10624) AND `SourceEntry` IN (14697,14699,14700,14701,14703,14704);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,10620,14697,0,0,1,0,90814,0,0,0,0,0,'','Gappy Silvertooth show gossip text with aura ''The New You Cat''s Mark - Gappy Silvertooth'''),
(14,10620,14699,0,0,1,0,90814,0,0,1,0,0,'','Gappy Silvertooth show gossip text with aura ''The New You Cat''s Mark - Gappy Silvertooth'''),
(14,10622,14700,0,0,1,0,90816,0,0,0,0,0,'','Szabo show gossip text with aura ''The New You Cat''s Mark - Szabo'''),
(14,10622,14701,0,0,1,0,90816,0,0,1,0,0,'','Szabo show gossip text with aura ''The New You Cat''s Mark - Szabo'''),
(14,10624,14703,0,0,1,0,90818,0,0,0,0,0,'','Missa Spekkies show gossip text with aura ''The New You Cat''s Mark - Missa Spekkies'''),
(14,10624,14704,0,0,1,0,90818,0,0,1,0,0,'','Missa Spekkies show gossip text with aura ''The New You Cat''s Mark - Missa Spekkies''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (10620,10622,10624);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,10620,0,0,0,1,0,90814,0,0,0,0,0,'','Gappy Silvertooth show gossip text with aura ''The New You Cat''s Mark - Gappy Silvertooth'''),
(15,10622,0,0,0,1,0,90816,0,0,0,0,0,'','Szabo show gossip text with aura ''The New You Cat''s Mark - Szabo'''),
(15,10624,0,0,0,1,0,90818,0,0,0,0,0,'','Missa Spekkies show gossip text with aura ''The New You Cat''s Mark - Missa Spekkies''');

UPDATE `gossip_menu_option` SET `OptionType` = 1, `OptionNpcFlag` = `OptionNpcFlag` | 0x01 WHERE `MenuId` IN (10620,10622,10624);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 35120 AND `source_type` = 0 AND `id` IN (4,5,6,7,8,9,10,11);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35120,0,4,5,19,0,100,0,14109,0,0,0,0,75,90814,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14109)'' Taken Apply Aura ''The New You Cat''s Mark - Gappy Silvertooth'''),
(35120,0,5,6,61,0,100,0,0,0,0,0,0,75,90816,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14109)'' Taken Apply Aura ''The New You Cat''s Mark - Szabo'''),
(35120,0,6,7,61,0,100,0,0,0,0,0,0,75,90818,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14109)'' Taken Apply Aura ''The New You Cat''s Mark - Missa Spekkies'''),
(35120,0,7,0,61,0,100,0,0,0,0,0,0,11,66779,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14109)'' Taken Cast Spell ''The New You: Create Macaroons'''),
(35120,0,8,9,19,0,100,0,14110,0,0,0,0,75,90814,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14110)'' Taken Apply Aura ''The New You Cat''s Mark - Gappy Silvertooth'''),
(35120,0,9,10,61,0,100,0,0,0,0,0,0,75,90816,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14110)'' Taken Apply Aura ''The New You Cat''s Mark - Szabo'''),
(35120,0,10,11,61,0,100,0,0,0,0,0,0,75,90818,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14110)'' Taken Apply Aura ''The New You Cat''s Mark - Missa Spekkies'''),
(35120,0,11,0,61,0,100,0,0,0,0,0,0,11,66779,0,0,0,0,0,7,0,0,0,0,0,0,0,'FBoK Teller - On Quest ''The New You (14110)'' Taken Cast Spell ''The New You: Create Macaroons''');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35126,35128,35130) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35126,0,0,1,62,0,100,0,10620,0,0,0,0,134,66780,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gappy Silvertooth - On Gossip Option 0 Selected - Invoker Cast Spell ''The New You: Create Shiny Bling'''),
(35126,0,1,0,61,0,100,512,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gappy Silvertooth - On Gossip Option 0 Selected - Close Gossip'),
(35126,0,2,0,64,0,100,0,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,'Gappy Silvertooth - On Gossip Hello - Play Random Emote (1, 3, 5, 6)'),

(35128,0,0,1,62,0,100,0,10622,0,0,0,0,134,66781,0,0,0,0,0,7,0,0,0,0,0,0,0,'Szabo - On Gossip Option 0 Selected - Invoker Cast Spell ''The New You: Create Hip New Outfit'''),
(35128,0,1,0,61,0,100,512,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Szabo - On Gossip Option 0 Selected - Close Gossip'),
(35128,0,2,0,64,0,100,0,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,'Szabo - On Gossip Hello - Play Random Emote (1, 3, 5, 6)'),

(35130,0,0,1,62,0,100,0,10624,0,0,0,0,134,66782,0,0,0,0,0,7,0,0,0,0,0,0,0,'Missa Spekkies - On Gossip Option 0 Selected - Invoker Cast Spell ''The New You: Create Cool Shades'''),
(35130,0,1,0,61,0,100,512,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Missa Spekkies - On Gossip Option 0 Selected - Close Gossip'),
(35130,0,2,0,64,0,100,0,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,'Missa Spekkies - On Gossip Hello - Play Random Emote (1, 3, 5, 6)');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35053) AND `source_type` = 0 AND `id` IN (5,6,7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35053,0,5,6,20,0,100,512,14109,0,0,0,0,28,90814,0,0,0,0,0,7,0,0,0,0,0,0,0,'Candy Cane - On Quest ''The New You'' Rewarded - Remove Aura ''The New You Cat''s Mark - Gappy Silvertooth'''),
(35053,0,6,7,61,0,100,512,0,0,0,0,0,28,90816,0,0,0,0,0,7,0,0,0,0,0,0,0,'Candy Cane - On Quest ''The New You'' Rewarded - Remove Aura ''The New You Cat''s Mark - Szabo'''),
(35053,0,7,0,61,0,100,512,0,0,0,0,0,28,90818,0,0,0,0,0,7,0,0,0,0,0,0,0,'Candy Cane - On Quest ''The New You'' Rewarded - Remove Aura ''The New You Cat''s Mark - Missa Spekkies''');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35054) AND `source_type` = 0 AND `id` IN (4,5,6);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35054,0,4,5,20,0,100,512,14110,0,0,0,0,28,90814,0,0,0,0,0,7,0,0,0,0,0,0,0,'Chip Endale - On Quest ''The New You'' Rewarded - Remove Aura ''The New You Cat''s Mark - Gappy Silvertooth'''),
(35054,0,5,6,61,0,100,512,0,0,0,0,0,28,90816,0,0,0,0,0,7,0,0,0,0,0,0,0,'Chip Endale - On Quest ''The New You'' Rewarded - Remove Aura ''The New You Cat''s Mark - Szabo'''),
(35054,0,6,0,61,0,100,512,0,0,0,0,0,28,90818,0,0,0,0,0,7,0,0,0,0,0,0,0,'Chip Endale - On Quest ''The New You'' Rewarded - Remove Aura ''The New You Cat''s Mark - Missa Spekkies''');

-- Life of the Party
UPDATE `quest_template_addon` SET `PrevQuestID` = 24520 WHERE `ID` IN (14113,14153);
DELETE FROM `quest_template_addon` WHERE `ID` IN (14109,14110);
INSERT INTO `quest_template_addon` (`ID`,`MaxLevel`,`AllowableClasses`,`SourceSpellID`,`PrevQuestID`,`NextQuestID`,`ExclusiveGroup`,`BreadcrumbForQuestId`,`RewardMailTemplateID`,`RewardMailDelay`,`RequiredSkillID`,`RequiredSkillPoints`,`RequiredMinRepFaction`,`RequiredMaxRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepValue`,`ProvidedItemCount`,`SpecialFlags`) VALUES
(14109,0,0,0,26712,14113,14109,0,0,0,0,0,0,0,0,0,0,0),
(14110,0,0,0,26711,14153,14109,0,0,0,0,0,0,0,0,0,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (14113,14153);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19,0,14113,0,0,20,0,0,0,0,0,0,0,'','Show quest Life of the Party (14113) for Males only.'),
(19,0,14153,0,0,20,1,0,0,0,0,0,0,'','Show quest Life of the Party (14153) for Females only.');