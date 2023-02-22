-- Black Rock Spire teleport assistant.
SET
@ENTRY 			:= 190001,
@NAME			:= "Axtrasz",
@SUBNAME		:= "",
@MODEL			:= 8314,

@AURA			:= "30540 0",

@TEXT_ID		:= 300005,
@GOSSIP_MENU	:= 52058,
@GOSSIP_SCRIPT	:= 16000685;

SET @CONDITIONID	:= 2152;

DELETE FROM creature_template WHERE entry = @ENTRY;
DELETE FROM creature_template_addon WHERE Entry = @ENTRY;
DELETE FROM gameobject_template WHERE entry = @ENTRY;
DELETE FROM gossip_menu WHERE entry = @GOSSIP_MENU;
DELETE FROM npc_text WHERE ID BETWEEN @TEXT_ID AND @TEXT_ID+1;
DELETE FROM conditions WHERE condition_entry BETWEEN @CONDITIONID AND @CONDITIONID+7;
DELETE FROM gossip_menu_option WHERE menu_id = @GOSSIP_MENU;
DELETE FROM db_scripts WHERE id = @GOSSIP_SCRIPT AND script_type = 2;
DELETE FROM creature WHERE ID = @ENTRY;

INSERT INTO creature_template (entry, ModelId1, name, subname, GossipMenuId, minlevel, maxlevel, MinLevelHealth, MaxLevelHealth, MinLevelMana, MaxLevelMana, armor, FactionAlliance, FactionHorde, NpcFlags, SpeedWalk, SpeedRun, Scale, Rank, DamageMultiplier, UnitFlags, CreatureType, CreatureTypeFlags, InhabitType, RegenerateStats, ExtraFlags) VALUES
(@ENTRY, @MODEL, @NAME, @SUBNAME, @GOSSIP_MENU, 61, 61, 13700, 13700, 6540, 6540, 5700, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 2, 7, 138936390, 3, 1, 2);

INSERT INTO creature_template_addon (entry, mount, bytes1, emote, moveflags, auras) VALUES
(@ENTRY, 0, 0, 0, 0, @AURA);

INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES
(@GOSSIP_MENU, @TEXT_ID, @CONDITIONID+7),
(@GOSSIP_MENU, @TEXT_ID+1, @CONDITIONID+6);

INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
(@TEXT_ID, "$B I am merely here to observe.$B", 6),
(@TEXT_ID+1, "$B Your past deeds have earned my respect.  I can send you deeper into the city, but you will be on your own from there.$B", 6);

INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
-- Quest Requirements
(@CONDITIONID, 8, 4903, 0),
(@CONDITIONID+1, 8, 5081, 0),
(@CONDITIONID+2, 8, 5089, 0),
(@CONDITIONID+3, 9, 5089, 0),
-- Set or conditions
(@CONDITIONID+4, -2, @CONDITIONID+1, @CONDITIONID+2),
(@CONDITIONID+5, -2, @CONDITIONID+3, @CONDITIONID+4),
(@CONDITIONID+6, -2, @CONDITIONID, @CONDITIONID+5),
(@CONDITIONID+7, -3, @CONDITIONID+6, 0);

INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(@GOSSIP_MENU, 0, 2, "Send me ahead", 1, 1, 0, 0, @GOSSIP_SCRIPT, 0, 0, "Are you sure? There is no way to return.", @CONDITIONID+6);

INSERT INTO db_scripts (id, script_type, delay, command, datalong, x, y, z, o, comments) VALUES
(@GOSSIP_SCRIPT, 2, 0, 6, 229, -171.834610, -368.830170, 64.400833, 6.270626, "");

ALTER TABLE creature AUTO_INCREMENT = 250000;
INSERT INTO creature (id, map, modelid, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana) VALUES
(@ENTRY, 229, 0, 69.753922, -260.154572, 60.706440, 6.014587, 25, 0, 13700, 6540);

-- Scholomance teleport assistant
SET
@ENTRY 			:= 190002,
@NAME			:= "Ralegos",
@SUBNAME		:= "",
@MODEL			:= 6761,

@TEXT_ID		:= 300008,
@GOSSIP_MENU	:= 52060,
@GOSSIP_SCRIPT	:= 16000686;

SET @CONDITIONID	:= 2160;

DELETE FROM creature_template WHERE entry = @ENTRY;
DELETE FROM creature_template_addon WHERE Entry = @ENTRY;
DELETE FROM gameobject_template WHERE entry = @ENTRY;
DELETE FROM gossip_menu WHERE entry = @GOSSIP_MENU;
DELETE FROM npc_text WHERE ID BETWEEN @TEXT_ID AND @TEXT_ID+1;
DELETE FROM conditions WHERE condition_entry BETWEEN @CONDITIONID AND @CONDITIONID+1;
DELETE FROM gossip_menu_option WHERE menu_id = @GOSSIP_MENU;
DELETE FROM db_scripts WHERE id = @GOSSIP_SCRIPT AND script_type = 2;
DELETE FROM creature WHERE ID = @ENTRY;

INSERT INTO creature_template (entry, ModelId1, name, subname, GossipMenuId, minlevel, maxlevel, MinLevelHealth, MaxLevelHealth, MinLevelMana, MaxLevelMana, armor, FactionAlliance, FactionHorde, NpcFlags, SpeedWalk, SpeedRun, Scale, Rank, DamageMultiplier, UnitFlags, CreatureType, CreatureTypeFlags, InhabitType, RegenerateStats, ExtraFlags) VALUES
(@ENTRY, @MODEL, @NAME, @SUBNAME, @GOSSIP_MENU, 61, 61, 13700, 13700, 6540, 6540, 5700, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 2, 7, 138936390, 3, 1, 2);

INSERT INTO creature_template_addon (entry, mount, bytes1, emote, moveflags, auras) VALUES
(@ENTRY, 0, 0, 0, 0, @AURA);

INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES
(@GOSSIP_MENU, @TEXT_ID, @CONDITIONID+1),
(@GOSSIP_MENU, @TEXT_ID+1, @CONDITIONID);

INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
(@TEXT_ID, "$B I am merely here to observe.$B", 6),
(@TEXT_ID+1, "$B Your past deeds have earned my respect.  I can send you deeper into the school, but you will be on your own from there.$B", 6);

-- Quest Requirements
INSERT INTO conditions (condition_entry, type, value1, value2) VALUES
(@CONDITIONID, 8, 5382, 0),
(@CONDITIONID+1, -3, @CONDITIONID, 0);

INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(@GOSSIP_MENU, 0, 2, "Send me ahead", 1, 1, 0, 0, @GOSSIP_SCRIPT, 0, 0, "Are you sure? There is no way to return.", @CONDITIONID);

INSERT INTO db_scripts (id, script_type, delay, command, datalong, x, y, z, o, comments) VALUES
(@GOSSIP_SCRIPT, 2, 0, 6, 289, 98.261490, 63.817894, 97.961121, 0.654999, "");

INSERT INTO creature (id, map, modelid, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana) VALUES
(@ENTRY, 289, 0, 208.833160, 105.944580, 128.414581, 3.953696, 25, 0, 13700, 6540);

-- Additional options to Black Rock Spire assistant.
SET
@ENTRY 			:= 190001,
@NAME			:= "Ralegos",	
@SUBNAME		:= "",
@MODEL			:= 8314,

@TEXT_ID		:= 300010,
@GOSSIP_MENU	:= 52058,
@GOSSIP_SCRIPT	:= 16000687;

SET @CONDITIONID	:= (SELECT condition_entry FROM conditions WHERE type = 8 AND value1 = 7761 AND value2 = 0);

DELETE FROM gossip_menu WHERE entry = @GOSSIP_MENU;
DELETE FROM npc_text WHERE ID = @TEXT_ID;
DELETE FROM db_scripts WHERE id = @GOSSIP_SCRIPT AND script_type = 2;

INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES
(@GOSSIP_MENU, @TEXT_ID, @CONDITIONID);

INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
(@TEXT_ID, "$B Your past deeds have earned my respect.  I can send you into the upper city, but you will be on your own from there.$B", 6);

-- Quest Requirements
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
(@GOSSIP_MENU, 1, 2, "Send me to the upper city", 1, 1, 0, 0, @GOSSIP_SCRIPT, 0, 0, "Are you sure? There is no way to return.", @CONDITIONID);

INSERT INTO db_scripts (id, script_type, delay, command, datalong, x, y, z, o, comments) VALUES
(@GOSSIP_SCRIPT, 2, 0, 6, 229, 12.290852, -545.077515, 110.932137, 0.051838, "");

select *
from gossip_menu gm
  join npc_text nt on nt.id = gm.text_id
where entry between 52058 and 52059;

select *
from conditions c
where condition_entry between 2152 and 2161;

select *
from creature_template ct
where entry in (190001,190002);