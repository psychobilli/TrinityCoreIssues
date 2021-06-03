/*
MaNGOS Portal Master
By Rochet2
Downloaded from http://rochet2.github.io/
Bugs and contact with E-mail: Rochet2@post.com
*/

SET
@ENTRY          := 190000,
@NAME           := "Portal Master",
@SUBNAME        := "",
@MODEL          := 11672,

@AURA           := "30540 0", -- "35766 0" = casting

@TEXT_ID        := 300000,
@GOSSIP_MENU    := 52050,
@GOSSIP_SCRIPT  := 16000550,

@RUNE           := 176163;

SET @CONDITIONID := 2050; -- (SELECT max(condition_entry)+1 FROM conditions);

DELETE FROM creature_template WHERE entry = @ENTRY;
DELETE FROM creature_template_addon WHERE Entry = @ENTRY;
DELETE FROM gameobject_template WHERE entry = @ENTRY;
DELETE FROM gossip_menu WHERE entry BETWEEN @GOSSIP_MENU AND @GOSSIP_MENU+8;
DELETE FROM npc_text WHERE ID BETWEEN @TEXT_ID AND @TEXT_ID+4;
DELETE FROM conditions WHERE condition_entry BETWEEN @CONDITIONID AND @CONDITIONID+97;
DELETE FROM gossip_menu_option WHERE menu_id BETWEEN @GOSSIP_MENU AND @GOSSIP_MENU+8;
DELETE FROM db_scripts WHERE id BETWEEN @GOSSIP_SCRIPT AND @GOSSIP_SCRIPT+134 AND script_type = 2;
DELETE FROM creature WHERE ID = @ENTRY;
DELETE FROM gameobject WHERE ID = @RUNE and guid >= 200000;

INSERT INTO creature_template (entry, ModelId1, name, subname, GossipMenuId, minlevel, maxlevel, MinLevelHealth, MaxLevelHealth, MinLevelMana, MaxLevelMana, armor, FactionAlliance, FactionHorde, NpcFlags, SpeedWalk, SpeedRun, Scale, Rank, DamageMultiplier, UnitFlags, CreatureType, CreatureTypeFlags, InhabitType, RegenerateStats, ExtraFlags) VALUES
(@ENTRY, @MODEL, @NAME, @SUBNAME, @GOSSIP_MENU, 71, 71, 13700, 13700, 6540, 6540, 5700, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 2, 7, 138936390, 3, 1, 2);

INSERT INTO creature_template_addon (entry, mount, bytes1, emote, moveflags, auras) VALUES
(@ENTRY, 0, 0, 0, 0, @AURA);

INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES
(@GOSSIP_MENU+2, @TEXT_ID+2, 0),
(@GOSSIP_MENU+1, @TEXT_ID+2, 0),
(@GOSSIP_MENU+3, @TEXT_ID+3, 0),
(@GOSSIP_MENU+4, @TEXT_ID+4, 0),
(@GOSSIP_MENU+5, @TEXT_ID+4, 0),
(@GOSSIP_MENU+6, @TEXT_ID+4, 0),
(@GOSSIP_MENU+7, @TEXT_ID+4, 0),
(@GOSSIP_MENU, @TEXT_ID, 3),
(@GOSSIP_MENU, @TEXT_ID+1, 4);

INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
(@TEXT_ID+4, "$BWhere would you like to be ported?$B", 0),
(@TEXT_ID+3, "$BBe careful with choosing raids.$B", 0),
(@TEXT_ID+2, "$BUp for some dungeon exploring?$B", 0),
(@TEXT_ID+1, "$B For The Alliance!$B", 6),
(@TEXT_ID, "$B For the Horde!$B", 6);

INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
-- Area requirements
(@CONDITIONID, 4, 1519, 1),
(@CONDITIONID+1, 4, 1637, 1),
(@CONDITIONID+2, 4, 1657, 1),
(@CONDITIONID+3, 4, 1537, 1),
(@CONDITIONID+4, 4, 3580, 1),
(@CONDITIONID+5, 4, 1638, 1),
(@CONDITIONID+6, 4, 1497, 1),
(@CONDITIONID+7, 4, 3487, 1),

(@CONDITIONID+8, 4, 4395, 1),
(@CONDITIONID+9, 4, 3703, 1),
(@CONDITIONID+10, 4, 35, 1),
(@CONDITIONID+11, 4, 1741, 1),

-- Level requirements
-- (@CONDITIONID+20, 15, 10, 1), -- 107
-- (@CONDITIONID+21, 15, 15, 1), -- 2001
(@CONDITIONID+22, 15, 17, 1),
-- (@CONDITIONID+23, 15, 18, 1), -- 2002
-- (@CONDITIONID+24, 15, 20, 1), -- 1011
(@CONDITIONID+25, 15, 21, 1),
-- (@CONDITIONID+26, 15, 22, 1), -- 2003
-- (@CONDITIONID+27, 15, 24, 1), -- 168
(@CONDITIONID+28, 15, 25, 1),
(@CONDITIONID+29, 15, 30, 1),
(@CONDITIONID+30, 15, 32, 1),
(@CONDITIONID+31, 15, 34, 1),
-- (@CONDITIONID+32, 15, 35, 1), -- 2007
(@CONDITIONID+33, 15, 37, 1),
-- (@CONDITIONID+34, 15, 40, 1), -- 179
-- (@CONDITIONID+35, 15, 43, 1), -- 2009
(@CONDITIONID+36, 15, 45, 1),
(@CONDITIONID+37, 15, 47, 1),
-- (@CONDITIONID+38, 15, 48, 1), -- 2011
(@CONDITIONID+39, 15, 50, 1),
-- (@CONDITIONID+40, 15, 51, 1), -- 1010
(@CONDITIONID+41, 15, 53, 1),
-- (@CONDITIONID+42, 15, 55, 1), -- 1125
(@CONDITIONID+43, 15, 57, 1),
(@CONDITIONID+44, 15, 58, 1),
(@CONDITIONID+45, 15, 59, 1),
(@CONDITIONID+46, 15, 60, 1),

-- 4 A, 3 H
-- Mixed requirements
(@CONDITIONID+70, -1, @CONDITIONID, 4),
(@CONDITIONID+71, -1, @CONDITIONID+1, 3),
(@CONDITIONID+72, -1, @CONDITIONID+2, 4),
(@CONDITIONID+73, -1, @CONDITIONID+3, 4),
(@CONDITIONID+74, -1, @CONDITIONID+4, 4),
(@CONDITIONID+75, -1, @CONDITIONID+5, 3),
(@CONDITIONID+76, -1, @CONDITIONID+6, 3),
(@CONDITIONID+77, -1, @CONDITIONID+7, 3),

(@CONDITIONID+79, -1, @CONDITIONID+9, @CONDITIONID+43),
(@CONDITIONID+80, -1, @CONDITIONID+10, @CONDITIONID+29),
(@CONDITIONID+81, -1, @CONDITIONID+11, @CONDITIONID+29),

(@CONDITIONID+82, -1, 3, 107),
(@CONDITIONID+83, -1, 4, 107),
-- (@CONDITIONID+84, -1, 3, 2001),
(@CONDITIONID+85, -1, 4, 2001),
-- (@CONDITIONID+86, -1, 4, @CONDITIONID+22),
-- (@CONDITIONID+87, -1, 3, @CONDITIONID+22),
-- (@CONDITIONID+88, -1, 3, 2002),
(@CONDITIONID+89, -1, 4, 2002),
(@CONDITIONID+90, -1, 4, 1011),
-- (@CONDITIONID+91, -1, 4, 2003),
-- (@CONDITIONID+92, -1, 3, 168),
-- (@CONDITIONID+93, -1, 4, @CONDITIONID+28),
(@CONDITIONID+94, -1, 3, @CONDITIONID+28)
-- (@CONDITIONID+95, -1, 3, @CONDITIONID+30),
-- (@CONDITIONID+96, -1, 3, @CONDITIONID+31)
;

INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(@GOSSIP_MENU, 0, 2, "Stormwind", 1, 1, 0, 0, @GOSSIP_SCRIPT, 0, 0, "Are you sure, that you want to go to Stormwind?", @CONDITIONID+70),
(@GOSSIP_MENU, 1, 2, "Orgrimmar", 1, 1, 0, 0, @GOSSIP_SCRIPT+1, 0, 0, "Are you sure, that you want to go to Orgrimmar?", @CONDITIONID+71),
(@GOSSIP_MENU, 2, 2, "Darnassus", 1, 1, 0, 0, @GOSSIP_SCRIPT+8, 0, 0, "Are you sure, that you want to go to Darnassus?", @CONDITIONID+72),
(@GOSSIP_MENU, 3, 2, "Ironforge", 1, 1, 0, 0, @GOSSIP_SCRIPT+9, 0, 0, "Are you sure, that you want to go to Ironforge?", @CONDITIONID+73),
(@GOSSIP_MENU, 4, 2, "Thunder bluff", 1, 1, 0, 0, @GOSSIP_SCRIPT+11, 0, 0, "Are you sure, that you want to go to Thunder bluff?", @CONDITIONID+75),
(@GOSSIP_MENU, 5, 2, "Undercity", 1, 1, 0, 0, @GOSSIP_SCRIPT+12, 0, 0, "Are you sure, that you want to go to Undercity?", @CONDITIONID+76),
(@GOSSIP_MENU, 6, 2, "Booty bay", 1, 1, 0, 0, @GOSSIP_SCRIPT+2, 0, 0, "Are you sure, that you want to go to Booty bay?", @CONDITIONID+80),
(@GOSSIP_MENU, 7, 2, "Gurubashi arena", 1, 1, 0, 0, @GOSSIP_SCRIPT+6, 0, 0, "Are you sure, that you want to go to Arena?", @CONDITIONID+81),
(@GOSSIP_MENU, 8, 3, "Eastern Kingdoms 1-35", 1, 1, @GOSSIP_MENU+4, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU, 9, 3, "Eastern Kingdoms 35-60", 1, 1, @GOSSIP_MENU+5, 0, 0, 0, 0, NULL, 2007),
(@GOSSIP_MENU, 10, 3, "Kalimdor 1-40", 1, 1, @GOSSIP_MENU+6, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU, 11, 3, "Kalimdor 40-60", 1, 1, @GOSSIP_MENU+7, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU, 12, 9, "Dungeons 1-40", 1, 1, @GOSSIP_MENU+1, 0, 0, 0, 0, NULL, 2001),
(@GOSSIP_MENU, 13, 9, "Dungeons 40-60", 1, 1, @GOSSIP_MENU+2, 0, 0, 0, 0, NULL, 179),
(@GOSSIP_MENU, 14, 9, "Raid Teleports", 1, 1, @GOSSIP_MENU+3, 0, 0, 0, 0, NULL, @CONDITIONID+43),

(@GOSSIP_MENU+1, 0, 2, "Ragefire Chasm", 1, 1, 0, 0, @GOSSIP_SCRIPT+17, 0, 0, "Are you sure, that you want to go to Ragefire Chasm?", 2001),
(@GOSSIP_MENU+1, 1, 2, "The Deadmines", 1, 1, 0, 0, @GOSSIP_SCRIPT+15, 0, 0, "Are you sure, that you want to go to The Deadmines?", @CONDITIONID+22),
(@GOSSIP_MENU+1, 2, 2, "Wailing Caverns", 1, 1, 0, 0, @GOSSIP_SCRIPT+22, 0, 0, "Are you sure, that you want to go to Wailing Caverns?", @CONDITIONID+22),
(@GOSSIP_MENU+1, 3, 2, "Shadowfang Keep", 1, 1, 0, 0, @GOSSIP_SCRIPT+21, 0, 0, "Are you sure, that you want to go to Shadowfang Keep?", 2002),
(@GOSSIP_MENU+1, 4, 2, "Blackfathom Deeps", 1, 1, 0, 0, @GOSSIP_SCRIPT+23, 0, 0, "Are you sure, that you want to go to Blackfathom Deeps?", @CONDITIONID+25),
(@GOSSIP_MENU+1, 5, 2, "The Stockade", 1, 1, 0, 0, @GOSSIP_SCRIPT+16, 0, 0, "Are you sure, that you want to go to The Stockade?", 2003),
(@GOSSIP_MENU+1, 6, 2, "Razorfen Kraul", 1, 1, 0, 0, @GOSSIP_SCRIPT+19, 0, 0, "Are you sure, that you want to go to Razorfen Kraul?", 168),
(@GOSSIP_MENU+1, 7, 2, "Gnomeregan", 1, 1, 0, 0, @GOSSIP_SCRIPT+14, 0, 0, "Are you sure, that you want to go to Gnomeregan?", @CONDITIONID+28),
(@GOSSIP_MENU+1, 8, 2, "Scarlet Monastery", 1, 1, 0, 0, @GOSSIP_SCRIPT+20, 0, 0, "Are you sure, that you want to go to Scarlet Monastery?", @CONDITIONID+30),
(@GOSSIP_MENU+1, 9, 7, "40-60 Dungeons", 1, 1, @GOSSIP_MENU+2, 0, 0, 0, 0, NULL, 179),
(@GOSSIP_MENU+1, 10, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),

(@GOSSIP_MENU+2, 0, 2, "Razorfen Downs", 1, 1, 0, 0, @GOSSIP_SCRIPT+18, 0, 0, "Are you sure, that you want to go to Razorfen Downs?", @CONDITIONID+31),
(@GOSSIP_MENU+2, 1, 2, "Uldaman", 1, 1, 0, 0, @GOSSIP_SCRIPT+31, 0, 0, "Are you sure, that you want to go to Uldaman?", @CONDITIONID+33),
(@GOSSIP_MENU+2, 2, 2, "Zul'Farrak", 1, 1, 0, 0, @GOSSIP_SCRIPT+32, 0, 0, "Are you sure, that you want to go to Zul'Farrak?", 2007),
(@GOSSIP_MENU+2, 3, 2, "Maraudon", 1, 1, 0, 0, @GOSSIP_SCRIPT+27, 0, 0, "Are you sure, that you want to go to Maraudon?", @CONDITIONID+36),
(@GOSSIP_MENU+2, 4, 2, "Sunken Temple", 1, 1, 0, 0, @GOSSIP_SCRIPT+30, 0, 0, "Are you sure, that you want to go to Sunken Temple?", @CONDITIONID+37),
(@GOSSIP_MENU+2, 5, 2, "Blackrock Depths", 1, 1, 0, 0, @GOSSIP_SCRIPT+24, 0, 0, "Are you sure, that you want to go to Blackrock Depths?", @CONDITIONID+41),
(@GOSSIP_MENU+2, 6, 2, "Dire Maul", 1, 1, 0, 0, @GOSSIP_SCRIPT+26, 0, 0, "Are you sure, that you want to go to Dire Maul?", 1125),
(@GOSSIP_MENU+2, 7, 2, "Blackrock Spire", 1, 1, 0, 0, @GOSSIP_SCRIPT+25, 0, 0, "Are you sure, that you want to go to Blackrock Spire?", @CONDITIONID+43),
(@GOSSIP_MENU+2, 8, 2, "Scholomance", 1, 1, 0, 0, @GOSSIP_SCRIPT+28, 0, 0, "Are you sure, that you want to go to Scholomance?", 1125),
(@GOSSIP_MENU+2, 9, 2, "Stratholme", 1, 1, 0, 0, @GOSSIP_SCRIPT+29, 0, 0, "Are you sure, that you want to go to Stratholme?", 1125),
(@GOSSIP_MENU+2, 10, 7, "1-40 Dungeons", 1, 1, @GOSSIP_MENU+1, 0, 0, 0, 0, NULL, @CONDITIONID+30),
(@GOSSIP_MENU+2, 11, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),

(@GOSSIP_MENU+3, 0, 2, "Blackwing Lair", 1, 1, 0, 0, @GOSSIP_SCRIPT+52, 0, 0, "Are you sure, that you want to go to Blackwing Lair?", @CONDITIONID+46),
(@GOSSIP_MENU+3, 1, 2, "Molten Core", 1, 1, 0, 0, @GOSSIP_SCRIPT+60, 0, 0, "Are you sure, that you want to go to Molten Core?", @CONDITIONID+46),
(@GOSSIP_MENU+3, 2, 2, "Onyxia's Lair", 1, 1, 0, 0, @GOSSIP_SCRIPT+62, 0, 0, "Are you sure, that you want to go to Onyxia's Lair?", 2015),
(@GOSSIP_MENU+3, 3, 2, "Ruins of Ahn'Qiraj", 1, 1, 0, 0, @GOSSIP_SCRIPT+63, 0, 0, "Are you sure, that you want to go to Ruins of Ahn'Qiraj?", @CONDITIONID+46),
(@GOSSIP_MENU+3, 4, 2, "Temple of Ahn'Qiraj", 1, 1, 0, 0, @GOSSIP_SCRIPT+66, 0, 0, "Are you sure, that you want to go to Temple of Ahn'Qiraj?", @CONDITIONID+46),
(@GOSSIP_MENU+3, 5, 2, "Zul'Gurub", 1, 1, 0, 0, @GOSSIP_SCRIPT+72, 0, 0, "Are you sure, that you want to go to Zul'Gurub?", @CONDITIONID+43),
(@GOSSIP_MENU+3, 6, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),
-- (@GOSSIP_MENU+3, 7, 2, "Naxxramas", 1, 1, 0, 0, @GOSSIP_SCRIPT+61, 0, 0, "Are you sure, that you want to go to Naxxramas?", 185),

(@GOSSIP_MENU+4, 0, 2, "Elwynn Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+74, 0, 0, "Are you sure, that you want to go to Elwynn Forest?", 4),
(@GOSSIP_MENU+4, 1, 2, "Dun Morogh", 1, 1, 0, 0, @GOSSIP_SCRIPT+76, 0, 0, "Are you sure, that you want to go to Dun Morogh?", 4),
(@GOSSIP_MENU+4, 2, 2, "Tirisfal Glades", 1, 1, 0, 0, @GOSSIP_SCRIPT+77, 0, 0, "Are you sure, that you want to go to Tirisfal Glades?", 3),
(@GOSSIP_MENU+4, 3, 2, "Loch modan", 1, 1, 0, 0, @GOSSIP_SCRIPT+79, 0, 0, "Are you sure, that you want to go to Loch modan?", @CONDITIONID+83),
(@GOSSIP_MENU+4, 4, 2, "Silverpine Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+80, 0, 0, "Are you sure, that you want to go to Silverpine Forest?", @CONDITIONID+82),
(@GOSSIP_MENU+4, 5, 2, "Westfall", 1, 1, 0, 0, @GOSSIP_SCRIPT+81, 0, 0, "Are you sure, that you want to go to Westfall?", @CONDITIONID+83),
(@GOSSIP_MENU+4, 6, 2, "Redridge mountains", 1, 1, 0, 0, @GOSSIP_SCRIPT+82, 0, 0, "Are you sure, that you want to go to Redridge mountains?", @CONDITIONID+85),
(@GOSSIP_MENU+4, 7, 2, "Duskwood", 1, 1, 0, 0, @GOSSIP_SCRIPT+83, 0, 0, "Are you sure, that you want to go to Duskwood?", @CONDITIONID+89),
(@GOSSIP_MENU+4, 8, 2, "Hillsbrad Foothills", 1, 1, 0, 0, @GOSSIP_SCRIPT+84, 0, 0, "Are you sure, that you want to go to Hillsbrad Foothills?", 1011),
(@GOSSIP_MENU+4, 9, 2, "Wetlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+85, 0, 0, "Are you sure, that you want to go to Wetlands?", @CONDITIONID+90),
(@GOSSIP_MENU+4, 10, 2, "Alterac Mountains", 1, 1, 0, 0, @GOSSIP_SCRIPT+86, 0, 0, "Are you sure, that you want to go to Alterac Mountains?", @CONDITIONID+29),
(@GOSSIP_MENU+4, 11, 2, "Arathi Highlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+87, 0, 0, "Are you sure, that you want to go to Arathi Highlands?", @CONDITIONID+29),
(@GOSSIP_MENU+4, 12, 7, "Eastern Kingdoms 35-60", 1, 1, @GOSSIP_MENU+5, 0, 0, 0, 0, NULL, 2007),
(@GOSSIP_MENU+4, 13, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),

(@GOSSIP_MENU+5, 1, 2, "Stranglethorn Vale", 1, 1, 0, 0, @GOSSIP_SCRIPT+88, 0, 0, "Are you sure, that you want to go to Stranglethorn Vale?", @CONDITIONID+29),
(@GOSSIP_MENU+5, 2, 2, "Badlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+89, 0, 0, "Are you sure, that you want to go to Badlands?", 2007),
(@GOSSIP_MENU+5, 3, 2, "Swamp of Sorrows", 1, 1, 0, 0, @GOSSIP_SCRIPT+90, 0, 0, "Are you sure, that you want to go to Swamp of Sorrows?", 2007),
(@GOSSIP_MENU+5, 4, 2, "The Hinterlands", 1, 1, 0, 0, @GOSSIP_SCRIPT+91, 0, 0, "Are you sure, that you want to go to The Hinterlands?", 179),
(@GOSSIP_MENU+5, 5, 2, "Searing Gorge", 1, 1, 0, 0, @GOSSIP_SCRIPT+92, 0, 0, "Are you sure, that you want to go to Searing Gorge?", 2009),
(@GOSSIP_MENU+5, 6, 2, "The Blasted Lands", 1, 1, 0, 0, @GOSSIP_SCRIPT+93, 0, 0, "Are you sure, that you want to go to The Blasted Lands?", @CONDITIONID+36),
(@GOSSIP_MENU+5, 7, 2, "Burning Steppes", 1, 1, 0, 0, @GOSSIP_SCRIPT+94, 0, 0, "Are you sure, that you want to go to Burning Steppes?", @CONDITIONID+39),
(@GOSSIP_MENU+5, 8, 2, "Western Plaguelands", 1, 1, 0, 0, @GOSSIP_SCRIPT+95, 0, 0, "Are you sure, that you want to go to Western Plaguelands?", 1010),
(@GOSSIP_MENU+5, 9, 2, "Eastern Plaguelands", 1, 1, 0, 0, @GOSSIP_SCRIPT+96, 0, 0, "Are you sure, that you want to go to Eastern Plaguelands?", @CONDITIONID+41),
(@GOSSIP_MENU+5, 10, 7, "Eastern Kingdoms 1-35", 1, 1, @GOSSIP_MENU+4, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+5, 11, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),

(@GOSSIP_MENU+6, 0, 2, "Teldrassil", 1, 1, 0, 0, @GOSSIP_SCRIPT+99, 0, 0, "Are you sure, that you want to go to Teldrassil?", 4),
(@GOSSIP_MENU+6, 1, 2, "Durotar", 1, 1, 0, 0, @GOSSIP_SCRIPT+100, 0, 0, "Are you sure, that you want to go to Durotar?", 3),
(@GOSSIP_MENU+6, 2, 2, "Mulgore", 1, 1, 0, 0, @GOSSIP_SCRIPT+101, 0, 0, "Are you sure, that you want to go to Mulgore?", 3),
(@GOSSIP_MENU+6, 3, 2, "Darkshore", 1, 1, 0, 0, @GOSSIP_SCRIPT+103, 0, 0, "Are you sure, that you want to go to Darkshore?", @CONDITIONID+83),
(@GOSSIP_MENU+6, 4, 2, "The Barrens", 1, 1, 0, 0, @GOSSIP_SCRIPT+104, 0, 0, "Are you sure, that you want to go to The Barrens?", @CONDITIONID+82),
(@GOSSIP_MENU+6, 5, 2, "Stonetalon Mountains", 1, 1, 0, 0, @GOSSIP_SCRIPT+105, 0, 0, "Are you sure, that you want to go to Stonetalon Mountains?", 2001),
(@GOSSIP_MENU+6, 6, 2, "Ashenvale Forest", 1, 1, 0, 0, @GOSSIP_SCRIPT+106, 0, 0, "Are you sure, that you want to go to Ashenvale Forest?", 2002),
(@GOSSIP_MENU+6, 7, 2, "Thousand Needles", 1, 1, 0, 0, @GOSSIP_SCRIPT+107, 0, 0, "Are you sure, that you want to go to Thousand Needles?", @CONDITIONID+94),
(@GOSSIP_MENU+6, 8, 2, "Desolace", 1, 1, 0, 0, @GOSSIP_SCRIPT+108, 0, 0, "Are you sure, that you want to go to Desolace?", @CONDITIONID+29),
(@GOSSIP_MENU+6, 9, 2, "Dustwallow Marsh", 1, 1, 0, 0, @GOSSIP_SCRIPT+109, 0, 0, "Are you sure, that you want to go to Dustwallow Marsh?", 2007),
(@GOSSIP_MENU+6, 10, 7, "Kalimdor 40-60", 1, 1, @GOSSIP_MENU+7, 0, 0, 0, 0, NULL, 179),
(@GOSSIP_MENU+6, 11, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0),

(@GOSSIP_MENU+7, 0, 2, "Feralas", 1, 1, 0, 0, @GOSSIP_SCRIPT+110, 0, 0, "Are you sure, that you want to go to Feralas?", 179),
(@GOSSIP_MENU+7, 1, 2, "Tanaris Desert", 1, 1, 0, 0, @GOSSIP_SCRIPT+111, 0, 0, "Are you sure, that you want to go to Tanaris Desert?", 179),
(@GOSSIP_MENU+7, 2, 2, "Azshara", 1, 1, 0, 0, @GOSSIP_SCRIPT+112, 0, 0, "Are you sure, that you want to go to Azshara?", @CONDITIONID+36),
(@GOSSIP_MENU+7, 3, 2, "Felwood", 1, 1, 0, 0, @GOSSIP_SCRIPT+113, 0, 0, "Are you sure, that you want to go to Felwood?", 2011),
(@GOSSIP_MENU+7, 4, 2, "Un'Goro Crater", 1, 1, 0, 0, @GOSSIP_SCRIPT+114, 0, 0, "Are you sure, that you want to go to Un'Goro Crater?", 2011),
(@GOSSIP_MENU+7, 5, 2, "Silithus", 1, 1, 0, 0, @GOSSIP_SCRIPT+115, 0, 0, "Are you sure, that you want to go to Silithus?", 1125),
(@GOSSIP_MENU+7, 6, 2, "Winterspring", 1, 1, 0, 0, @GOSSIP_SCRIPT+116, 0, 0, "Are you sure, that you want to go to Winterspring?", 1125),
(@GOSSIP_MENU+7, 7, 7, "Kalimdor 1-40", 1, 1, @GOSSIP_MENU+6, 0, 0, 0, 0, NULL, 0),
(@GOSSIP_MENU+7, 8, 7, "Back..", 1, 1, @GOSSIP_MENU, 0, 0, 0, 0, NULL, 0);

INSERT INTO db_scripts (id, script_type, delay, command, datalong, x, y, z, o, comments) VALUES
(@GOSSIP_SCRIPT, 2, 0, 6, 0, -8842.09, 626.358, 94.0867, 3.61363, ""),
(@GOSSIP_SCRIPT+1, 2, 0, 6, 1, 1601.08, -4378.69, 9.9846, 2.14362, ""),
(@GOSSIP_SCRIPT+2, 2, 0, 6, 0, -14281.9, 552.564, 8.90422, 0.860144, ""),

(@GOSSIP_SCRIPT+6, 2, 0, 6, 0, -13181.8, 339.356, 42.9805, 1.18013, ""),
(@GOSSIP_SCRIPT+8, 2, 0, 6, 1, 9869.91, 2493.58, 1315.88, 2.78897, ""),
(@GOSSIP_SCRIPT+9, 2, 0, 6, 0, -4900.47, -962.585, 501.455, 5.40538, ""),
(@GOSSIP_SCRIPT+11, 2, 0, 6, 1, -1274.45, 71.8601, 128.159, 2.80623, ""),
(@GOSSIP_SCRIPT+12, 2, 0, 6, 0, 1633.75, 240.167, -43.1034, 6.26128, ""),
(@GOSSIP_SCRIPT+14, 2, 0, 6, 0, -5163.54, 925.423, 257.181, 1.57423, ""),
(@GOSSIP_SCRIPT+15, 2, 0, 6, 0, -11209.6, 1666.54, 24.6974, 1.42053, ""),
(@GOSSIP_SCRIPT+16, 2, 0, 6, 0, -8799.15, 832.718, 97.6348, 6.04085, ""),
(@GOSSIP_SCRIPT+17, 2, 0, 6, 1, 1811.78, -4410.5, -18.4704, 5.20165, ""),
(@GOSSIP_SCRIPT+18, 2, 0, 6, 1, -4657.3, -2519.35, 81.0529, 4.54808, ""),
(@GOSSIP_SCRIPT+19, 2, 0, 6, 1, -4470.28, -1677.77, 81.3925, 1.16302, ""),
(@GOSSIP_SCRIPT+20, 2, 0, 6, 0, 2873.15, -764.523, 160.332, 5.10447, ""),
(@GOSSIP_SCRIPT+21, 2, 0, 6, 0, -234.675, 1561.63, 76.8921, 1.24031, ""),
(@GOSSIP_SCRIPT+22, 2, 0, 6, 1, -731.607, -2218.39, 17.0281, 2.78486, ""),
(@GOSSIP_SCRIPT+23, 2, 0, 6, 1, 4249.99, 740.102, -25.671, 1.34062, ""),
(@GOSSIP_SCRIPT+24, 2, 0, 6, 0, -7179.34, -921.212, 165.821, 5.09599, ""),
(@GOSSIP_SCRIPT+25, 2, 0, 6, 0, -7527.05, -1226.77, 285.732, 5.29626, ""),
(@GOSSIP_SCRIPT+26, 2, 0, 6, 1, -3520.14, 1119.38, 161.025, 4.70454, ""),
(@GOSSIP_SCRIPT+27, 2, 0, 6, 1, -1421.42, 2907.83, 137.415, 1.70718, ""),
(@GOSSIP_SCRIPT+28, 2, 0, 6, 0, 1269.64, -2556.21, 93.6088, 0.620623, ""),
(@GOSSIP_SCRIPT+29, 2, 0, 6, 0, 3352.92, -3379.03, 144.782, 6.25978, ""),
(@GOSSIP_SCRIPT+30, 2, 0, 6, 0, -10177.9, -3994.9, -111.239, 6.01885, ""),
(@GOSSIP_SCRIPT+31, 2, 0, 6, 0, -6071.37, -2955.16, 209.782, 0.015708, ""),
(@GOSSIP_SCRIPT+32, 2, 0, 6, 1, -6801.19, -2893.02, 9.00388, 0.158639, ""),
(@GOSSIP_SCRIPT+34, 2, 0, 6, 1, -8369.65, -4253.11, -204.272, -2.70526, ""),
(@GOSSIP_SCRIPT+40, 2, 0, 6, 1, -8756.39, -4440.68, -199.489, 4.66289, ""),
(@GOSSIP_SCRIPT+52, 2, 0, 6, 229, 152.451, -474.881, 116.84, 0.001073, ""),
(@GOSSIP_SCRIPT+53, 2, 0, 6, 1, -8177.89, -4181.23, -167.552, 0.913338, ""),
(@GOSSIP_SCRIPT+59, 2, 0, 6, 0, -11118.9, -2010.33, 47.0819, 0.649895, ""),
(@GOSSIP_SCRIPT+60, 2, 0, 6, 230, 1126.64, -459.94, -102.535, 3.46095, ""),
-- (@GOSSIP_SCRIPT+61, 2, 0, 6, 571, 3668.72, -1262.46, 243.622, 4.785, ""),
(@GOSSIP_SCRIPT+62, 2, 0, 6, 1, -4708.27, -3727.64, 54.5589, 3.72786, ""),
(@GOSSIP_SCRIPT+63, 2, 0, 6, 1, -8409.82, 1499.06, 27.7179, 2.51868, ""),
(@GOSSIP_SCRIPT+66, 2, 0, 6, 1, -8240.09, 1991.32, 129.072, 0.941603, ""),
(@GOSSIP_SCRIPT+72, 2, 0, 6, 0, -11916.7, -1215.72, 92.289, 4.72454, ""),
(@GOSSIP_SCRIPT+74, 2, 0, 6, 0, -9449.06, 64.8392, 56.3581, 3.07047, ""),
(@GOSSIP_SCRIPT+76, 2, 0, 6, 0, -5603.76, -482.704, 396.98, 5.23499, ""),
(@GOSSIP_SCRIPT+77, 2, 0, 6, 0, 2274.95, 323.918, 34.1137, 4.24367, ""),
(@GOSSIP_SCRIPT+79, 2, 0, 6, 0, -5405.85, -2894.15, 341.972, 5.48238, ""),
(@GOSSIP_SCRIPT+80, 2, 0, 6, 0, 505.126, 1504.63, 124.808, 1.77987, ""),
(@GOSSIP_SCRIPT+81, 2, 0, 6, 0, -10684.9, 1033.63, 32.5389, 6.07384, ""),
(@GOSSIP_SCRIPT+82, 2, 0, 6, 0, -9447.8, -2270.85, 71.8224, 0.283853, ""),
(@GOSSIP_SCRIPT+83, 2, 0, 6, 0, -10531.7, -1281.91, 38.8647, 1.56959, ""),
(@GOSSIP_SCRIPT+84, 2, 0, 6, 0, -385.805, -787.954, 54.6655, 1.03926, ""),
(@GOSSIP_SCRIPT+85, 2, 0, 6, 0, -3517.75, -913.401, 8.86625, 2.60705, ""),
(@GOSSIP_SCRIPT+86, 2, 0, 6, 0, 275.049, -652.044, 130.296, 0.502032, ""),
(@GOSSIP_SCRIPT+87, 2, 0, 6, 0, -1581.45, -2704.06, 35.4168, 0.490373, ""),
(@GOSSIP_SCRIPT+88, 2, 0, 6, 0, -11921.7, -59.544, 39.7262, 3.73574, ""),
(@GOSSIP_SCRIPT+89, 2, 0, 6, 0, -6782.56, -3128.14, 240.48, 5.65912, ""),
(@GOSSIP_SCRIPT+90, 2, 0, 6, 0, -10368.6, -2731.3, 21.6537, 5.29238, ""),
(@GOSSIP_SCRIPT+91, 2, 0, 6, 0, 112.406, -3929.74, 136.358, 0.981903, ""),
(@GOSSIP_SCRIPT+92, 2, 0, 6, 0, -6686.33, -1198.55, 240.027, 0.916887, ""),
(@GOSSIP_SCRIPT+93, 2, 0, 6, 0, -11184.7, -3019.31, 7.29238, 3.20542, ""),
(@GOSSIP_SCRIPT+94, 2, 0, 6, 0, -7979.78, -2105.72, 127.919, 5.10148, ""),
(@GOSSIP_SCRIPT+95, 2, 0, 6, 0, 1743.69, -1723.86, 59.6648, 5.23722, ""),
(@GOSSIP_SCRIPT+96, 2, 0, 6, 0, 2280.64, -5275.05, 82.0166, 4.7479, ""),
(@GOSSIP_SCRIPT+99, 2, 0, 6, 1, 9889.03, 915.869, 1307.43, 1.9336, ""),
(@GOSSIP_SCRIPT+100, 2, 0, 6, 1, 228.978, -4741.87, 10.1027, 0.416883, ""),
(@GOSSIP_SCRIPT+101, 2, 0, 6, 1, -2473.87, -501.225, -9.42465, 0.6525, ""),
(@GOSSIP_SCRIPT+103, 2, 0, 6, 1, 6463.25, 683.986, 8.92792, 4.33534, ""),
(@GOSSIP_SCRIPT+104, 2, 0, 6, 1, -575.772, -2652.45, 95.6384, 0.006469, ""),
(@GOSSIP_SCRIPT+105, 2, 0, 6, 1, 1574.89, 1031.57, 137.442, 3.8013, ""),
(@GOSSIP_SCRIPT+106, 2, 0, 6, 1, 1919.77, -2169.68, 94.6729, 6.14177, ""),
(@GOSSIP_SCRIPT+107, 2, 0, 6, 1, -5375.53, -2509.2, -40.432, 2.41885, ""),
(@GOSSIP_SCRIPT+108, 2, 0, 6, 1, -656.056, 1510.12, 88.3746, 3.29553, ""),
(@GOSSIP_SCRIPT+109, 2, 0, 6, 1, -3350.12, -3064.85, 33.0364, 5.12666, ""),
(@GOSSIP_SCRIPT+110, 2, 0, 6, 1, -4808.31, 1040.51, 103.769, 2.90655, ""),
(@GOSSIP_SCRIPT+111, 2, 0, 6, 1, -6940.91, -3725.7, 48.9381, 3.11174, ""),
(@GOSSIP_SCRIPT+112, 2, 0, 6, 1, 3117.12, -4387.97, 91.9059, 5.49897, ""),
(@GOSSIP_SCRIPT+113, 2, 0, 6, 1, 3898.8, -1283.33, 220.519, 6.24307, ""),
(@GOSSIP_SCRIPT+114, 2, 0, 6, 1, -6291.55, -1158.62, -258.138, 0.457099, ""),
(@GOSSIP_SCRIPT+115, 2, 0, 6, 1, -6815.25, 730.015, 40.9483, 2.39066, ""),
(@GOSSIP_SCRIPT+116, 2, 0, 6, 1, 6658.57, -4553.48, 718.019, 5.18088, "");

ALTER TABLE creature AUTO_INCREMENT = 200000;
INSERT INTO creature (id, map, modelid, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana) VALUES
(@ENTRY, 0, 0, -13180.5, 342.503, 43.1936, 4.32977, 25, 0, 13700, 6540), 
(@ENTRY, 0, 0, -4898.37, -965.118, 501.447, 2.25986, 25, 0, 13700, 6540), 
(@ENTRY, 0, 0, -8845.09, 624.828, 94.2999, 0.44062, 25, 0, 13700, 6540), 
(@ENTRY, 1, 0, 1599.25, -4375.85, 10.0872, 5.23641, 25, 0, 13700, 6540), 
(@ENTRY, 1, 0, -1277.65, 72.9751, 128.742, 5.95567, 25, 0, 13700, 6540), 
(@ENTRY, 0, 0, 1637.21, 240.132, -43.1034, 3.13147, 25, 0, 13700, 6540), 
(@ENTRY, 1, 0, 9866.83, 2494.66, 1315.88, 5.9462, 25, 0, 13700, 6540), 
(@ENTRY, 0, 0, -14279.8, 555.014, 8.90011, 3.97606, 25, 0, 13700, 6540);

ALTER TABLE gameobject AUTO_INCREMENT = 200000;
INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, rotation2, rotation3, spawntimesecs, state) VALUES
(@RUNE, 1, 1601.08, -4378.69, 9.9846, 2.14362, 0.878068, 0.478536, 25, 1), 
(@RUNE, 0, -14281.9, 552.564, 8.90382, 0.860144, 0.416936, 0.908936, 25, 1), 
(@RUNE, 0, -8842.09, 626.358, 94.0868, 3.61363, 0.972276, -0.233836, 25, 1), 
(@RUNE, 0, -4900.47, -962.585, 501.455, 5.40538, 0.424947, -0.905218, 25, 1), 
(@RUNE, 1, 9869.91, 2493.58, 1315.88, 5.9462, 0.167696, -0.985839, 25, 1), 
(@RUNE, 0, 1633.75, 240.167, -43.1034, 3.13147, 0.999987, 0.00506132, 25, 1), 
(@RUNE, 0, -13181.8, 339.356, 42.9805, 1.18013, 0.556415, 0.830904, 25, 1), 
(@RUNE, 1, -1274.45, 71.8601, 128.159, 2.80623, 0.985974, 0.166898, 25, 1);

/*
MaNGOS Portal Master
By Rochet2
Downloaded from http://rochet2.github.io/
Bugs and contact with E-mail: Rochet2@post.com
*/
