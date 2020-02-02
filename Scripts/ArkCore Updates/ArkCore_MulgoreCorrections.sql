-- Sunwalker Helaku
set @gossipMenu := 14;
set @conditionClass := 15;
set @classId := 2;
set @failState := 1533;
set @passState := 2;
insert into `conditions`
(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`)
values (@gossipMenu,11767,16490,0,0,@conditionClass,0,@passState,0,0,0,0,0,'','Show gossip text if player is a Paladin'),
 (@gossipMenu,11767,16491,0,0,@conditionClass,0,@failState,0,0,0,0,0,'','Show gossip text if player is not a Paladin');

set @skillsIcon := 3;
set @talentsIcon := 0;
INSERT INTO `gossip_menu_option`
(`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`BoxBroadcastTextID`)
VALUES (11767,0,@skillsIcon,'I would like to train.',0,5,16,0,0,0,0,0,0),
	(11767,1,@talentsIcon,'I wish to unlearn my talents.',0,16,16,4461,0,0,0,0,0);

set @gossipMenu := 15;
insert into `conditions`
(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`)
values (@gossipMenu,11767,0,0,0,@conditionClass,0,@passState,0,0,0,0,0,'','Show gossip text if player is a Paladin'),
 (@gossipMenu,11767,1,0,0,@conditionClass,0,@passState,0,0,0,0,0,'','Show gossip text if player is a Paladin')
 (@gossipMenu,11767,2,0,0,@conditionClass,0,@passState,0,0.0,0,0,'','Show gossip text if player is a Paladin');
 
 
 --Gart Mistrunner 
update conditions
set ConditionValue1 = 1024
where SourceGroup = 4644
  and (SourceEntry = 5716 and SourceTypeOrReferenceId = 14
	or SourceEntry = 0 and SourceTypeOrReferenceId = 15);
 