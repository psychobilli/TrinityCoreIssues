 -- activate custom scripts
 insert into zero_world.script_binding
 (type, ScriptName, bind, data)
 values (13, 'VAS_AutoBalance_WorldScript', 500000, 0),
 	(14, 'VAS_AutoBalance_PlayerScript', 500001, 0),
     (0, 'VAS_AutoBalance_UnitScript', 500002, 0),
     (16, 'VAS_AutoBalance_AllCreatureScript', 500003, 0),
     (15, 'VAS_AutoBalance_AllMapScript', 500004, 0),
     (17, 'MultiBoxerQuestHelper_LootScript', 500005, 0);
	 
-- adjust spawntimes int he BRD Lyceum
update zero_world.creature
set spawntimesecs = 40
where id = 8901
  and spawntimesecs = 20;

update zero_world.creature
set spawntimesecs = 300
where id = 9956
  and spawntimesecs = 600;