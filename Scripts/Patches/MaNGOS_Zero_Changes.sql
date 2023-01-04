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
  
-- remove some mob pools in BRD Golem room which caused bizarre, 
-- unexpected respawns.
delete from zero_world.creature
where guid in (
	154623,154625,154627,154628,/*154630,*/154632,
    154635,154637,/*154650,*/154653,/*154654,154657,*/
	/*154658,154661,*/154662,154664,154668,/*154670,*/
    /*154672*/154660,154673)
  and id in (8900,8906,8907,8920);

delete from zero_world.pool_creature
where pool_entry in (
	25471,25472,25473,25474,/*25475,*/25476,25477,
	25478,/*25479,*/25480,/*25481,25482,25483,*/25484,
    /*25485,*/25488,25489,/*25490,*/25491)
  and guid in (
	select guid
    from zero_world.creature
    where id in (8900,8906,8907,8920)
	);
    
-- nerf Fireguard Destroyer damage
update zero_world.creature_template
set damagemultiplier = 3 -- 3.6
where entry = '8911';

-- nerf General Angerforge damage
update zero_world.creature_template
set damagemultiplier = 6 -- 6.5
where entry = '9033';

-- nerf Golem Lord Argelmach damage
update zero_world.creature_template
set damagemultiplier = 5.25 -- 6.25
where entry = '8983';

-- nerf Emperor Dagran Thaurissan damage
update zero_world.creature_template
set damagemultiplier = 6.25 -- 7.25
where entry = '9019';

-- remove Vosh'gajin's adds.  She's hard enough.
delete from zero_world.creature
where guid in (43550,43551)
  and id = 9240;
  
-- remove pulls before Zigris as there's too many.
delete from zero_world.creature
where guid in (45743,45748)
  and id = 9717;
  
delete from zero_world.creature
where guid in (45744)
  and id = 9716;
  
delete from zero_world.creature
where guid in (45756)
  and id = 9583;

-- move Quartermaster Zigris and an add so he doesn't aggro adds.
update zero_world.creature
set position_x = -190.19
where id = '9736';

update zero_world.creature
set position_x = -204.898
where guid = 45751;
  
-- correct Overlord Wyrmthalak attack rate
update zero_world.creature_template
set meleebaseattacktime = 2000 -- 800
where entry = '9568';
  
-- add a linen exchange to the cloth quartermasters.
delete from zero_world.quest_template where entry in (10000,10001,10002,10003,10004,10005,10006,10007);
insert into zero_world.quest_template
(entry, Method, ZoneOrSort, MinLevel, QuestLevel, Type, RequiredClasses, 
RequiredRaces, RequiredSkill, RequiredSkillValue, RepObjectiveFaction, RepObjectiveValue, RequiredMinRepFaction, RequiredMinRepValue, RequiredMaxRepFaction, RequiredMaxRepValue, SuggestedPlayers, LimitTime, QuestFlags, SpecialFlags, PrevQuestId, NextQuestId, ExclusiveGroup, NextQuestInChain, SrcItemId, SrcItemCount, SrcSpell, Title, Details, Objectives, 
OfferRewardText, 
RequestItemsText, 
EndText, ObjectiveText1, ObjectiveText2, ObjectiveText3, ObjectiveText4, ReqItemId1, ReqItemId2, ReqItemId3, ReqItemId4, ReqItemCount1, ReqItemCount2, ReqItemCount3, ReqItemCount4, ReqSourceId1, ReqSourceId2, ReqSourceId3, ReqSourceId4, ReqSourceCount1, ReqSourceCount2, ReqSourceCount3, ReqSourceCount4, ReqCreatureOrGOId1, ReqCreatureOrGOId2, ReqCreatureOrGOId3, ReqCreatureOrGOId4, ReqCreatureOrGOCount1, ReqCreatureOrGOCount2, ReqCreatureOrGOCount3, ReqCreatureOrGOCount4, ReqSpellCast1, ReqSpellCast2, ReqSpellCast3, ReqSpellCast4, RewChoiceItemId1, RewChoiceItemId2, RewChoiceItemId3, RewChoiceItemId4, RewChoiceItemId5, RewChoiceItemId6, RewChoiceItemCount1, RewChoiceItemCount2, RewChoiceItemCount3, RewChoiceItemCount4, RewChoiceItemCount5, RewChoiceItemCount6, RewItemId1, RewItemId2, RewItemId3, RewItemId4, RewItemCount1, RewItemCount2, RewItemCount3, RewItemCount4, RewRepFaction1, RewRepFaction2, RewRepFaction3, RewRepFaction4, RewRepFaction5, RewRepValue1, RewRepValue2, RewRepValue3, RewRepValue4, RewRepValue5, RewOrReqMoney, RewMoneyMaxLevel, RewSpell, RewSpellCast, RewMailTemplateId, RewMailDelaySecs, PointMapId, PointX, PointY, PointOpt, DetailsEmote1, DetailsEmote2, DetailsEmote3, DetailsEmote4, DetailsEmoteDelay1, DetailsEmoteDelay2, DetailsEmoteDelay3, DetailsEmoteDelay4, IncompleteEmote, CompleteEmote, OfferRewardEmote1, OfferRewardEmote2, OfferRewardEmote3, OfferRewardEmote4, OfferRewardEmoteDelay1, OfferRewardEmoteDelay2, OfferRewardEmoteDelay3, OfferRewardEmoteDelay4, StartScript, CompleteScript)
values ('10000', '0', '1519', '20', '60', '0', '0', 
'77', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')
, ('10001', '0', '1657', '20', '60', '0', '0', 
'77', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')
, ('10002', '0', '1537', '20', '60', '0', '0', 
'77', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')
, ('10003', '0', '1537', '20', '60', '0', '0', 
'77', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')
, ('10004', '0', '1497', '20', '60', '0', '0', 
'178', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')
, ('10005', '0', '1638', '20', '60', '0', '0', 
'178', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')
, ('10006', '0', '1637', '20', '60', '0', '0', 
'178', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')
, ('10007', '0', '1637', '20', '60', '0', '0', 
'178', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Linen Exchange', '', '', 
'$N - we can exchange linen for wool. Thank you for your continued efforts!', 
'Whenever you have enough linen, I\'ll accept it.', 
'', '', '', '', '', '2589', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2592', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

delete from zero_world.quest_relations where quest in (10000,10001,10002,10003,10004,10005,10006,10007);
insert into zero_world.quest_relations
(actor, entry, quest, role)
values ('0', '14722', '10000', '0'),
	('0', '14722', '10000', '1'),
    ('0', '14723', '10001', '0'),
	('0', '14723', '10001', '1'),
    ('0', '14724', '10002', '0'),
	('0', '14724', '10002', '1'),
    ('0', '14725', '10003', '0'),
	('0', '14725', '10003', '1'),
    ('0', '14726', '10004', '0'),
	('0', '14726', '10004', '1'),
    ('0', '14727', '10005', '0'),
	('0', '14727', '10005', '1'),
    ('0', '14728', '10006', '0'),
	('0', '14728', '10006', '1'),
    ('0', '14729', '10007', '0'),
	('0', '14729', '10007', '1');