-- Rollin with my Homies
-- correct the Goblin Hot Rod for Rollin with my Homies (14071)
UPDATE `creature_template` SET `npcflag` = 16777216, `vehicleId` = 448, `AIName` = 'SmartAI', `flags_extra` = 8192 WHERE `entry` = 34840;
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

-- Give Sassy the News
DELETE FROM `smart_scripts` WHERE `entryorguid` = 34668 AND `source_type` = 0 AND `id` IN (17);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34668,0,17,0,20,0,100,0,24520,0,0,0,0,28,90161,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sassy Hardwrench - On Quest ''Give Sassy the News'' Rewared Remove Aura ''Generic Quest Invisibility Detection 4''');

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

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 35175;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (35175,35186);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,35175,0,0,1,1,75042,0,0,0,0,0,'','Kezan Partygoer has aura ''Bubbly'' use smart script.'),
(22,2,35175,0,0,1,1,75044,0,0,0,0,0,'','Kezan Partygoer has aura ''Bucket'' use smart script.'),
(22,3,35175,0,0,1,1,75046,0,0,0,0,0,'','Kezan Partygoer has aura ''Dance'' use smart script.'),
(22,4,35175,0,0,1,1,75048,0,0,0,0,0,'','Kezan Partygoer has aura ''Fireworks'' use smart script.'),
(22,5,35175,0,0,1,1,75050,0,0,0,0,0,'','Kezan Partygoer has aura ''Hors D''oeuvres'' use smart script.'),
(22,13,35186,0,0,1,1,75042,0,0,0,0,0,'','Kezan Partygoer has aura ''Bubbly'' use smart script.'),
(22,14,35186,0,0,1,1,75044,0,0,0,0,0,'','Kezan Partygoer has aura ''Bucket'' use smart script.'),
(22,15,35186,0,0,1,1,75046,0,0,0,0,0,'','Kezan Partygoer has aura ''Dance'' use smart script.'),
(22,16,35186,0,0,1,1,75048,0,0,0,0,0,'','Kezan Partygoer has aura ''Fireworks'' use smart script.'),
(22,17,35186,0,0,1,1,75050,0,0,0,0,0,'','Kezan Partygoer has aura ''Hors D''oeuvres'' use smart script.');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35175) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35175,0,0,5,8,0,100,512,66909,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Bubbly''  KC ''Life of the Party'''),
(35175,0,1,5,8,0,100,512,66910,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Bucket''  KC ''Life of the Party'''),
(35175,0,2,5,8,0,100,512,66911,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Dance''  KC ''Life of the Party'''),
(35175,0,3,5,8,0,100,512,66912,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Fireworks''  KC ''Life of the Party'''),
(35175,0,4,5,8,0,100,512,66913,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Hors D''oeuvres''  KC ''Life of the Party'''),
(35175,0,5,6,61,0,100,512,0,0,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Link from Spell Hit Remove All Auras'),
(35175,0,6,7,61,0,100,512,0,0,0,0,0,75,66916,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Link from Spell Hit Apply Aura ''Happy Partygoer'''),
(35175,0,7,0,61,0,100,512,0,0,0,0,0,87,3517500,3517501,3517502,3517503,3517504,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Run random script.');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35186) AND `source_type` = 0 AND `id` IN (12,13,14,15,16,17,18,19);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35186,0,12,17,8,0,100,512,66909,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Bubbly''  KC ''Life of the Party'''),
(35186,0,13,17,8,0,100,512,66910,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Bucket''  KC ''Life of the Party'''),
(35186,0,14,17,8,0,100,512,66911,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Dance''  KC ''Life of the Party'''),
(35186,0,15,17,8,0,100,512,66912,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Fireworks''  KC ''Life of the Party'''),
(35186,0,16,17,8,0,100,512,66913,0,0,0,0,33,35175,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kezan Partygoer - Spell Hit ''Hors D''oeuvres''  KC ''Life of the Party'''),
(35186,0,17,18,61,0,100,512,0,0,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Link from Spell Hit Remove All Auras'),
(35186,0,18,19,61,0,100,512,0,0,0,0,0,75,66916,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Link from Spell Hit Apply Aura ''Happy Partygoer'''),
(35186,0,19,0,61,0,100,512,0,0,0,0,0,87,3517500,3517501,3517502,3517503,3517504,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Run random script.');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3517500,3517501,3517502,3517503,3517504) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3517500,9,0,0,0,0,100,0,300000,300000,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Remove All Auras'),
(3517500,9,1,0,0,0,100,0,0,0,0,0,0,75,75042,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Apply Aura ''Bubbly'''),
(3517501,9,0,0,0,0,100,0,300000,300000,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Remove All Auras'),
(3517501,9,1,0,0,0,100,0,0,0,0,0,0,75,75044,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Apply Aura ''Bucket'''),
(3517501,9,2,0,0,0,100,0,0,0,0,0,0,75,46957,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Apply Aura ''Cosmetic - Stun (Permanent)'''),
(3517501,9,3,0,0,0,100,0,0,0,0,0,0,75,55664,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Apply Aura ''Cosmetic - DrunkenIintoxication (Visual Only)'''),
(3517502,9,0,0,0,0,100,0,300000,300000,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Remove All Auras'),
(3517502,9,1,0,0,0,100,0,0,0,0,0,0,75,75046,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Apply Aura ''Dance'''),
(3517503,9,0,0,0,0,100,0,300000,300000,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Remove All Auras'),
(3517503,9,1,0,0,0,100,0,0,0,0,0,0,75,75048,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Apply Aura ''Fireworks'''),
(3517504,9,0,0,0,0,100,0,300000,300000,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Remove All Auras'),
(3517504,9,1,0,0,0,100,0,0,0,0,0,0,75,75050,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kezan Partygoer - Action List 0 - Apply Aura ''Hors D''oeuvres''');

-- Pirate Party Crashers
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35200) AND `source_type` = 0 AND `id` IN (2);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35200,0,2,0,11,0,100,512,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pirate Party Crasher - On Respawn set ReactState Defensive');

-- The Uninvited Guest
DELETE FROM `creature` WHERE `id` = 35222 AND `areaId` = 4765 AND `PhaseId` IN (381,382);
INSERT INTO `creature` (`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseUseFlags`,`phaseMask`,`PhaseId`,`PhaseGroup`,`terrainSwapMap`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`ScriptName`,`VerifiedBuild`) VALUES 
(35222,648,4737,4765,1,0,1,381,0,-1,0,0,-8423.75,1362.25,116.86,4.67,120,0,0,0,0,0,0,0,0,'',0),
(35222,648,4737,4765,1,0,1,382,0,-1,0,0,-8423.75,1362.25,116.86,4.67,120,0,0,0,0,0,0,0,0,'',0);

-- The Great Bank Heist, Robbing Hoods and Waltz Right In
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (34840);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34840,0,0,0,75,0,100,512,0,35234,12,1,0,11,66301,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hot Rod - On Creature ''Hired Looter'' Near Cast ''Hot Rod Knockback'''),
(34840,0,1,0,75,0,100,512,0,35063,12,1,0,11,66301,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hot Rod - On Creature ''Kezan Citizen'' Near Cast ''Hot Rod Knockback'''),
(34840,0,2,0,75,0,100,512,0,35075,12,1,0,11,66301,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hot Rod - On Creature ''Kezan Citizen'' Near Cast ''Hot Rod Knockback''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` IN (1) AND `SourceEntry` = 35234;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,35234,0,0,47,0,14121,8,0,0,0,0,'','''Robbing Hoods'' quest state in progress run script.');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35234) AND `source_type` = 0 AND `id` IN (1,2);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35234,0,1,0,8,0,100,512,66301,0,1,1,0,11,67041,0,0,0,0,0,21,10,0,0,0,0,0,0,'Hired Looter - On Spell Hit ''Hot Rod Knockback'' Cast ''Robbing Hoods: Create Stolen Loot'''),
(35234,0,2,0,8,0,100,512,66301,0,1,1,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hired Looter - On Spell Hit ''Hot Rod Knockback'' Die');

UPDATE `quest_template` SET `StartItem` = 48935 WHERE `ID` = 14123;

-- Liberate the Kaja'Mite
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 195488;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-222813,-222747,-222746,-222743,-222742,-222741,-222740,-222739,-222738,-222737,-222736,-222735,-222734,-222733,-222732,-222725,-222724) AND `source_type` = 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-222813,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8432.05,1220.24,46.9506,0.820303,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222813,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8430.05,1218.24,46.9506,0.820303,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222813,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8428.05,1220.24,46.9506,0.820303,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222813,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222747,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8357.4,1134.21,34.312,0.750491,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222747,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8355.4,1132.21,34.312,0.750491,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222747,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8353.4,1134.21,34.312,0.750491,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222747,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222746,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8492.98,1103.98,42.5746,0,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222746,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8490.98,1101.98,42.5746,0,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222746,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8488.98,1103.98,42.5746,0,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222746,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222743,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8362.64,1152.36,34.8575,3.3685,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222743,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8360.64,1150.36,34.8575,3.3685,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222743,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8358.64,1152.36,34.8575,3.3685,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222743,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222742,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8518.04,1176.74,51.3897,1.18682,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222742,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8516.04,1174.74,51.3897,1.18682,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222742,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8514.04,1176.74,51.3897,1.18682,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222742,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222741,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8453.37,1145.93,39.9926,5.91667,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222741,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8451.37,1143.93,39.9926,5.91667,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222741,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8449.37,1145.93,39.9926,5.91667,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222741,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222740,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8503.17,1151.92,46.1091,0,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222740,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8501.17,1149.92,46.1091,0,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222740,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8499.17,1151.92,46.1091,0,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222740,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222739,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8388.44,1143.89,37.0173,4.4855,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222739,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8386.44,1141.89,37.0173,4.4855,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222739,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8384.44,1143.89,37.0173,4.4855,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222739,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222738,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8436.34,1146.82,43.981,2.18166,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222738,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8434.34,1144.82,43.981,2.18166,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222738,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8432.34,1146.82,43.981,2.18166,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222738,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222737,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8411.49,1153.36,38.5946,3.38594,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222737,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8409.49,1151.36,38.5946,3.38594,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222737,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8407.49,1153.36,38.5946,3.38594,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222737,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222736,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8425.32,1167.4,41.3467,0.59341,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222736,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8423.32,1165.4,41.3467,0.59341,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222736,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8421.32,1167.4,41.3467,0.59341,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222736,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222735,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8447.19,1187.54,43.6057,5.14872,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222735,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8445.19,1185.54,43.6057,5.14872,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222735,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8443.19,1187.54,43.6057,5.14872,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222735,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222734,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8481.37,1196.33,44.35,1.23918,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222734,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8479.37,1194.33,44.35,1.23918,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222734,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8477.37,1196.33,44.35,1.23918,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222734,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222733,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8489.3,1229.23,45.7357,1.11701,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222733,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8487.3,1227.23,45.7357,1.11701,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222733,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8485.3,1229.23,45.7357,1.11701,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222733,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222732,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8520.04,1236.4,54.1944,2.47837,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222732,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8518.04,1234.4,54.1944,2.47837,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222732,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8516.04,1236.4,54.1944,2.47837,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222732,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222725,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8432.05,1220.24,46.9506,0.820303,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222725,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8430.05,1218.24,46.9506,0.820303,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222725,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8428.05,1220.24,46.9506,0.820303,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222725,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn'),
(-222724,1,0,1,70,0,100,512,2,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8484.57,1257.65,58.9453,4.55531,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222724,1,1,2,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8482.57,1255.65,58.9453,4.55531,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'),
(-222724,1,2,3,61,0,100,512,0,0,0,0,0,50,195492,120,0,0,0,0,8,0,0,0,-8480.57,1257.65,58.9453,4.55531,'Kaja''mite Deposit - On State Changed ''Kablooey Bombs'' Summon GO'	),
(-222724,1,3,0,61,0,100,512,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kaja''mire Deposit - On Spell Hit ''Kablooey Bombs'' Despawn');

-- Life Savings
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35222) AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35222,0,1,0,20,0,100,512,14126,0,0,0,0,134,74100,0,0,0,0,0,7,0,0,0,0,0,0,0,'Trade Prince Gallywix - On ''Life Savings'' Rewarded Invoker Cast ''Life Savings: Teleport & Bind to the Lost Isles''');