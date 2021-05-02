DROP PROCEDURE IF EXISTS apply_smart_script_tests;
DELIMITER //
CREATE PROCEDURE apply_smart_script_tests(IN entryorguid int, sourcetype int, name text)
BEGIN
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(entryorguid,sourcetype,0,0,0,0,100,512,0,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_UPDATE_IC Check Logs')),
	(entryorguid,sourcetype,1,0,1,0,100,512,0,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_UPDATE_OOC Check Logs')),
	(entryorguid,sourcetype,2,0,2,0,100,512,0,100,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_HEALTH_PCT Check Logs')),
	(entryorguid,sourcetype,3,0,3,0,100,512,0,100,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_MANA_PCT Check Logs')),
	(entryorguid,sourcetype,4,0,4,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_AGGRO Check Logs')),
	(entryorguid,sourcetype,5,0,5,0,100,512,0,5,1,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_KILL Check Logs')),
	(entryorguid,sourcetype,6,0,6,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_DEATH Check Logs')),
	(entryorguid,sourcetype,7,0,7,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_EVADE Check Logs')),
	(entryorguid,sourcetype,8,0,8,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SPELLHIT Check Logs')),
	(entryorguid,sourcetype,9,0,9,0,100,512,0,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_RANGE Check Logs')),
	(entryorguid,sourcetype,10,0,10,0,100,512,0,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_OOC_LOS Check Logs')),
	(entryorguid,sourcetype,11,0,11,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_RESPAWN Check Logs')),
	(entryorguid,sourcetype,12,0,12,0,100,512,0,100,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_TARGET_HEALTH_PCT Check Logs')),
	(entryorguid,sourcetype,13,0,13,0,100,512,0,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_VICTIM_CASTING Check Logs')),
	(entryorguid,sourcetype,14,0,14,0,100,512,0,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_FRIENDLY_HEALTH Check Logs')),
	(entryorguid,sourcetype,15,0,15,0,100,512,0,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_FRIENDLY_IS_CC Check Logs')),
	(entryorguid,sourcetype,16,0,16,0,100,512,79060,5,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_FRIENDLY_MISSING_BUFF Check Logs')),
	(entryorguid,sourcetype,17,0,17,0,100,512,0,0,5,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SUMMONED_UNIT Check Logs')),
	(entryorguid,sourcetype,18,0,18,0,100,512,0,100,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_TARGET_MANA_PCT Check Logs')),
	(entryorguid,sourcetype,19,0,19,0,100,512,0,0,5,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_ACCEPTED_QUEST Check Logs')),
	(entryorguid,sourcetype,20,0,20,0,100,512,0,0,5,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_REWARD_QUEST Check Logs')),
	(entryorguid,sourcetype,21,0,21,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_REACHED_HOME Check Logs')),
	(entryorguid,sourcetype,22,0,22,0,100,512,0,0,5,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_RECEIVE_EMOTE Check Logs')),
	(entryorguid,sourcetype,23,0,23,0,100,512,0,0,0,5,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_HAS_AURA Check Logs')),
	(entryorguid,sourcetype,24,0,24,0,100,512,0,0,0,5,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_TARGET_BUFFED Check Logs')),
	(entryorguid,sourcetype,25,0,25,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_RESET Check Logs')),
	(entryorguid,sourcetype,26,0,26,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_IC_LOS Check Logs')),
	(entryorguid,sourcetype,27,0,27,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_PASSENGER_BOARDED Check Logs')),
	(entryorguid,sourcetype,28,0,28,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_PASSENGER_REMOVED Check Logs')),
	(entryorguid,sourcetype,29,0,29,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_CHARMED Check Logs')),
	(entryorguid,sourcetype,30,0,30,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_CHARMED_TARGET Check Logs')),
	(entryorguid,sourcetype,31,0,31,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SPELLHIT_TARGET Check Logs')),
	(entryorguid,sourcetype,32,0,32,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_DAMAGED Check Logs')),
	(entryorguid,sourcetype,33,0,33,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_DAMAGED_TARGET Check Logs')),
	(entryorguid,sourcetype,34,0,34,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_MOVEMENTINFORM Check Logs')),
	(entryorguid,sourcetype,35,0,35,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SUMMON_DESPAWNED Check Logs')),
	(entryorguid,sourcetype,36,0,36,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_CORPSE_REMOVED Check Logs')),
	(entryorguid,sourcetype,37,0,37,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_AI_INIT Check Logs')),
	(entryorguid,sourcetype,38,0,38,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_DATA_SET Check Logs')),
	(entryorguid,sourcetype,39,0,39,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_WAYPOINT_START Check Logs')),
	(entryorguid,sourcetype,40,0,40,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_WAYPOINT_REACHED Check Logs')),
	(entryorguid,sourcetype,41,0,41,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_TRANSPORT_ADDPLAYER Check Logs')),
	(entryorguid,sourcetype,42,0,42,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_TRANSPORT_ADDCREATURE Check Logs')),
	(entryorguid,sourcetype,43,0,43,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_TRANSPORT_REMOVE_PLAYER Check Logs')),
	(entryorguid,sourcetype,44,0,44,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_TRANSPORT_RELOCATE Check Logs')),
	(entryorguid,sourcetype,45,0,45,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_INSTANCE_PLAYER_ENTER Check Logs')),
	(entryorguid,sourcetype,46,0,46,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_AREATRIGGER_ONTRIGGER Check Logs')),
	(entryorguid,sourcetype,47,0,47,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_QUEST_ACCEPTED Check Logs')),
	(entryorguid,sourcetype,48,0,48,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_QUEST_OBJ_COMPLETION Check Logs')),
	(entryorguid,sourcetype,49,0,49,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_QUEST_COMPLETION Check Logs')),
	(entryorguid,sourcetype,50,0,50,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_QUEST_REWARDED Check Logs')),
	(entryorguid,sourcetype,51,0,51,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - X_SMART_EVENT_QUEST_FAIL Check Logs')),
	(entryorguid,sourcetype,52,0,52,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_TEXT_OVER Check Logs')),
	(entryorguid,sourcetype,53,0,53,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_RECEIVE_HEAL Check Logs')),
	(entryorguid,sourcetype,54,0,54,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_JUST_SUMMONED Check Logs')),
	(entryorguid,sourcetype,55,0,55,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_WAYPOINT_PAUSED Check Logs')),
	(entryorguid,sourcetype,56,0,56,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_WAYPOINT_RESUMED Check Logs')),
	(entryorguid,sourcetype,57,0,57,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_WAYPOINT_STOPPED Check Logs')),
	(entryorguid,sourcetype,58,0,58,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_WAYPOINT_ENDED Check Logs')),
	(entryorguid,sourcetype,59,0,59,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_TIMED_EVENT_TRIGGERED Check Logs')),
	(entryorguid,sourcetype,60,0,60,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_UPDATE Check Logs')),
	(entryorguid,sourcetype,61,0,61,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_LINK Check Logs')),
	(entryorguid,sourcetype,62,0,62,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_GOSSIP_SELECT Check Logs')),
	(entryorguid,sourcetype,63,0,63,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_JUST_CREATED Check Logs')),
	(entryorguid,sourcetype,64,0,64,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_GOSSIP_HELLO Check Logs')),
	(entryorguid,sourcetype,65,0,65,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_FOLLOW_COMPLETED Check Logs')),
	(entryorguid,sourcetype,66,0,66,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_EVENT_PHASE_CHANGE Check Logs')),
	(entryorguid,sourcetype,67,0,67,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_IS_BEHIND_TARGET Check Logs')),
	(entryorguid,sourcetype,68,0,68,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_GAME_EVENT_START Check Logs')),
	(entryorguid,sourcetype,69,0,69,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_GAME_EVENT_END Check Logs')),
	(entryorguid,sourcetype,70,0,70,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_GO_LOOT_STATE_CHANGED Check Logs')),
	(entryorguid,sourcetype,71,0,71,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_GO_EVENT_INFORM Check Logs')),
	(entryorguid,sourcetype,72,0,72,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_ACTION_DONE Check Logs')),
	(entryorguid,sourcetype,73,0,73,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_ON_SPELLCLICK Check Logs')),
	(entryorguid,sourcetype,74,0,74,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_FRIENDLY_HEALTH_PCT Check Logs')),
	(entryorguid,sourcetype,75,0,75,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_DISTANCE_CREATURE Check Logs')),
	(entryorguid,sourcetype,76,0,76,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_DISTANCE_GAMEOBJECT Check Logs')),
	(entryorguid,sourcetype,77,0,77,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_COUNTER_SET Check Logs')),
	(entryorguid,sourcetype,78,0,78,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SCENE_START Check Logs')),
	(entryorguid,sourcetype,79,0,79,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SCENE_TRIGGER Check Logs')),
	(entryorguid,sourcetype,80,0,80,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SCENE_CANCEL Check Logs')),
	(entryorguid,sourcetype,81,0,81,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SCENE_COMPLETE Check Logs')),
	(entryorguid,sourcetype,82,0,82,0,100,512,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,CONCAT(name, ' - SMART_EVENT_SUMMONED_UNIT_DIES Check Logs'));

END;