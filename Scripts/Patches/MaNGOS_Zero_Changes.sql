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

-- remove Spectral Tutor script, creature_ai_scripts work fine.
delete from zero_world.script_binding where bind = 10498;
-- Lengthen time between Cast Spectral Projection
update zero_world.creature_ai_scripts
set event_param1 = 19500, event_param2 = 24500, event_param3 = 34500, event_param4 = 45000
where id = 1049803 and event_type = 0 and action1_type = 11 and action1_param1 = 17651;
-- Update Spectral Projection and Illusion of Jandice Barov
update zero_world.creature_template
set AIName = 'EventAI'
where entry in (11263,11439);
-- Despawn Spectral Projections on Timer
delete from zero_world.creature_ai_scripts where id = 1126301;
insert into zero_world.creature_ai_scripts
(id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment)
values ('1126301', '11263', '11', '0', '100', '0', '0', '0', '0', '0', '41', '6000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Spectral Projection - Forced Despawn on timer');
-- Depsawn Illusion of Jandice Barov on timer.
delete from zero_world.creature_ai_scripts where id = 1143902;
insert into zero_world.creature_ai_scripts
(id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment)
values ('1143902', '11439', '11', '0', '100', '0', '0', '0', '0', '0', '41', '30000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Illusion of Jandice Barov - Forced Despawn on timer');
-- bind rattlegore boss script
delete from zero_world.script_binding where Scriptname = 'boss_rattlegore';
insert into zero_world.script_binding
(type, ScriptName, bind, data)
values (0, 'boss_rattlegore', 11622, 0);
-- Nerf Alexi Barov Curse Timer
delete from zero_world.creature_ai_scripts where id = 1050402;
insert into zero_world.creature_ai_scripts
(id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment)
values ('1050402', '10504', '0', '0', '100', '3', '15000', '30000', '35000', '50000', '11', '17820', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Alexei Barov - Cast Veil of Shadow');
-- delete creature pools and extra creatures outside the Viewing Room
-- otherwise it'll conflict with an SD3 script.
delete from zero_world.pool_creature
where pool_entry in (25494,25495,25496,25496,25497,25497,25498,25498,25499,25500,25500,25501);
delete from zero_world.creature
where guid in (154678, 154684, 154688, 154694, 154699, 154703, 154709, 154713);

-- nerf Spectral Researcher
update zero_world.creature_template
set damageMultiplier = 2.4 -- 3.9
where entry = 10499;
-- nerf Scholomance Acolyte
update zero_world.creature_template
set damageMultiplier = 2.3 -- 3.8
where entry = 10471;
-- nerf Scholomance Neophyte
update zero_world.creature_template
set damageMultiplier = 2.3 -- 3.8
where entry = 10470;
-- nerf Kirtonos the Herald
update zero_world.creature_template
set damageMultiplier = 6 -- 12
where entry = 10506;
-- nerf Illusion of Jandice Barov attack speed *
update zero_world.creature_template
set DamageMultiplier = .125 -- 1
  , MeleeBaseAttackTime = 2000 -- 1166
  , HealthMultiplier = .00508906 -- 0.508906
where entry = 11439;
-- move a Construct so Ratt can be solo pulled.
update zero_world.creature
set position_x = 156.487, position_y = 175.949, position_z = 93.086
where guid = 48801;
-- nerf Rattlegore
update zero_world.creature_template
set damageMultiplier = 5 -- 7
where entry = 11622;
-- nerf Lady Illucia Barov
update zero_world.creature_template
set damageMultiplier = 5 -- 6.5
where entry = 10502;
-- nerf Doctor Theolen Krastinov
update zero_world.creature_template
set damageMultiplier = 3 -- 11
where entry = 11261;
-- nerf The Ravenian
update zero_world.creature_template
set damageMultiplier = 3.5 -- 7
where entry = 10507;
-- nerf Risen Guard because Barov
update zero_world.creature_template
set HealthMultiplier = 2.60826 -- 3.00826
where entry = 10504;
-- nerf Lord Alexi Barov *
update zero_world.creature_template
set damageMultiplier = 1 -- 6
where entry = 10504;
-- nerf Ras Frostwhisper *
update zero_world.creature_template
set damageMultiplier = 3 -- 4
where entry = 10508;
-- nerf Bone Minion because Gandling *
update zero_world.creature_template
set HealthMultiplier = .25 -- .5,
	, DamageMultiplier = .5 -- 1.5
where entry = 16119;
-- nerf Death Knight Darkweaver
update zero_world.creature_template
set MeleeBaseAttackTime = 2000, -- 1150
	RangedBaseAttackTime = 2000, -- 1265
	MinMeleeDmg = 773, -- 873
	MaxMeleeDmg = 939 -- 1039
where entry = 14516;

-- add movement to mobs in live Stratholme.
update zero_world.creature set movementType = 2
where guid in ('54071','54085','52141','54169','54170','52144','54205','54206');
delete from zero_world.creature_movement where id in ('54071','54085','52141','54169','54170','52144','54205','54206');
insert into zero_world.creature_movement
(id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, orientation, model1, model2)
values ('54071','1','3641.86','-3079.73','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54071','2','3647.76','-3088.65','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54071','3','3641.86','-3079.73','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54071','4','3605.77','-3104.84','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54071','5','3572.27','-3057.82','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('54071','6','3605.77','-3104.84','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54071','7','3641.86','-3079.73','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54085','1','3641.86','-3079.73','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54085','2','3647.76','-3088.65','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54085','3','3641.86','-3079.73','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54085','4','3605.77','-3104.84','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54085','5','3572.27','-3057.82','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('54085','6','3605.77','-3104.84','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('54085','7','3641.86','-3079.73','134.12','0','0','0','0','0','0','0','0','0','0','0','0'),
('52141','1','3527.1','-3056.44','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('52141','2','3525.54','-3054.8','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('52141','3','3527.1','-3056.44','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('52141','4','3492.93','-3079.9','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('54169','1','3527.1','-3056.44','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('54169','2','3525.54','-3054.8','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('54169','3','3527.1','-3056.44','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('54169','4','3492.93','-3079.9','135','0','0','0','0','0','0','0','0','0','0','0','0'),
('54170','1','3444.89','-3086.52','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('54170','2','3436.49','-3074.12','136.54','0','0','0','0','0','0','0','0','0','0','0','0'),
('54170','3','3444.89','-3086.52','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('54170','4','3480.57','-3061.04','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('54170','5','3487.22','-3069.66','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('54170','6','3480.57','-3061.04','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('52144','1','3444.89','-3086.52','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('52144','2','3436.49','-3074.12','136.54','0','0','0','0','0','0','0','0','0','0','0','0'),
('52144','3','3444.89','-3086.52','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('52144','4','3480.57','-3061.04','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('52144','5','3487.22','-3069.66','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('52144','6','3480.57','-3061.04','135.0','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','1','3548.35','-2986.84','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','2','3567.92','-2973.21','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','3','3582.73','-2994.48','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','4','3545.91','-3020.68','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','5','3563.13','-3044.79','133.75','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','6','3545.91','-3020.68','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','7','3582.73','-2994.48','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','8','3567.92','-2973.21','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','9','3548.35','-2986.84','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54205','10','3537.53','-2970.63','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','1','3548.35','-2986.84','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','2','3567.92','-2973.21','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','3','3582.73','-2994.48','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','4','3545.91','-3020.68','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','5','3563.13','-3044.79','133.75','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','6','3545.91','-3020.68','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','7','3582.73','-2994.48','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','8','3567.92','-2973.21','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','9','3548.35','-2986.84','125','0','0','0','0','0','0','0','0','0','0','0','0'),
('54206','10','3537.53','-2970.63','125','0','0','0','0','0','0','0','0','0','0','0','0');
-- Ravaged Cadavers should summon 1 Broken Cadaver, not 2
delete from zero_world.creature_ai_scripts
where id = 1038103 and action1_param1 = 16324;
-- nerf Timmy the Cruel
update zero_world.creature_template
set damageMultiplier = 3 -- 13
where entry = 10808;
-- nerf Cannon Master Willey
update zero_world.creature_template
set damageMultiplier = 2 -- 7
where entry = 10997;
-- nerf Magistrate Barthilas
update zero_world.creature_template
set damageMultiplier = 3 -- 7.5
where entry = 10435;
-- nerf Bile Spewers
update zero_world.creature_template
set damageMultiplier = 3 -- 6
where entry = 10416;
-- nerf Venom Belchers
update zero_world.creature_template
set damageMultiplier = 3.1 -- 6.1
where entry = 10417;
-- nerf Ramstein the Gorger
update zero_world.creature_template
set damageMultiplier = 3 -- 9
where entry = 10439;
-- nerf Black Guard Sentry
update zero_world.creature_template
set damageMultiplier = .5 -- 1
where entry = 10394;
-- nerf Baron Rivendare
update zero_world.creature_template
set PowerMultiplier = 3 -- 5
	, damageMultiplier = .75 -- 1
    , MeleeBaseAttackTime = 2000 -- 1150
    , RangedBaseAttackTime = 2000 -- 1265
where entry = 10440;

-- nerf Alzzin the Wildshaper
update zero_world.creature_template
set damageMultiplier = 4.5 -- 5.5
where entry = 11492;
-- nerf Ironbark Protector
update zero_world.creature_template
set damageMultiplier = 4 -- 6
where entry = 11459;
-- nerf Illyanna Ravenoak
update zero_world.creature_template
set damageMultiplier = 4 -- 6
where entry = 11488;
-- nerf Tendris Warpwood
update zero_world.creature_template
set damageMultiplier = 5 -- 8
where entry = 11489;
-- nerf Immol'thar
update zero_world.creature_template
set damageMultiplier = 6 -- 8
where entry = 11496;
-- nerf Prince Tortheldrin
update zero_world.creature_template
set MinMeleeDmg = 604, -- 854
	MaxMeleeDmg = 765 -- 1015
where entry = 11486;
-- nerf Xorothian Dreadsteed
update zero_world.creature_template
set MeleeBaseAttackTime = 2000 -- 1166
where entry = 14502;
-- nerf Lord Hel'nurath
update zero_world.creature_template
set MeleeBaseAttackTime = 2000, -- 1133
	RangedBaseAttackTime = 2000, -- 1246
	MinMeleeDmg = 764, -- 914
	MaxMeleeDmg = 938 -- 1088
where entry = 14506;
-- nerf Guard Fengus, Guard Moldar and Guard Slip'kik
update zero_world.creature_template
set damageMultiplier = 6 -- 7
where entry in (14321,14326,14323);
-- nerf King Gordok
update zero_world.creature_template
set MinMeleeDmg = 723, -- 873
	MaxMeleeDmg = 889 -- 1039
where entry = 11501;

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

-- Add additional set drops to Drakkisath, Gandling and Rivendare.
insert into zero_world.reference_loot_template
(entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id)
select 40000
	, clt.item
    , clt.ChanceOrQuestChance
    , maxG.maxGroup + 1
    , clt.minCountOrRef
    , clt.maxcount
    , clt.condition_id
from zero_world.creature_loot_template clt
  join (
	select entry
		, max(groupId) as maxGroup
    from zero_world.creature_loot_template
    group by entry
  ) maxG on maxG.entry = clt.entry
where clt.entry = 10363
  and clt.groupid = 1
  and mincountOrRef > 0;
  
insert into zero_world.creature_loot_template
(entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id)
select 10363
	, 40000
    , 100
    , maxG.maxGroup + 1
    , -40000
    , 1
    , 0
from (
	select entry
		, max(groupId) as maxGroup
    from zero_world.creature_loot_template
    where entry = 10363
    group by entry
  ) maxG;

insert into zero_world.reference_loot_template
(entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id)
select 40001
	, clt.item
    , clt.ChanceOrQuestChance
    , maxG.maxGroup + 1
    , clt.minCountOrRef
    , clt.maxcount
    , clt.condition_id
from zero_world.creature_loot_template clt
  join (
	select entry
		, max(groupId) as maxGroup
    from zero_world.creature_loot_template
    group by entry
  ) maxG on maxG.entry = clt.entry
where clt.entry = 1853
  and clt.groupid = 1
  and mincountOrRef > 0;
  
insert into zero_world.creature_loot_template
(entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id)
select 1853
	, 40001
    , 100
    , maxG.maxGroup + 1
    , -40001
    , 1
    , 0
from (
	select entry
		, max(groupId) as maxGroup
    from zero_world.creature_loot_template
    where entry = 1853
    group by entry
  ) maxG;

insert into zero_world.reference_loot_template
(entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id)
select 40002
	, clt.item
    , clt.ChanceOrQuestChance
    , maxG.maxGroup + 1
    , clt.minCountOrRef
    , clt.maxcount
    , clt.condition_id
from zero_world.creature_loot_template clt
  join (
	select entry
		, max(groupId) as maxGroup
    from zero_world.creature_loot_template
    group by entry
  ) maxG on maxG.entry = clt.entry
where clt.entry = 10440
  and clt.groupid = 1
  and mincountOrRef > 0;
  
insert into zero_world.creature_loot_template
(entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id)
select 10440
	, 40002
    , 100
    , maxG.maxGroup + 1
    , -40002
    , 1
    , 0
from (
	select entry
		, max(groupId) as maxGroup
    from zero_world.creature_loot_template
    where entry = 10440
    group by entry
  ) maxG;