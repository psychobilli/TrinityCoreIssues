DELETE FROM `phase_area` WHERE `AreaId` = 4765 AND `PhaseId` IN (169,379);
INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4765, 169, 'Kezan starting phase'),
(4765, 379, 'Kezan ''Life of the Party''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (379,169) AND `SourceEntry` = 4765 AND `ConditionValue1` IN (14113,14153);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
-- (26,169,4765,0,0,47,0,14153,10,0,0,0,0,'','Kezan ''Life of the Party'' quest in progrss or completed set Phase 169'),
(26,379,4765,0,0,47,0,14153,10,0,0,0,0,'','Kezan ''Life of the Party'' quest in progrss or completed set Phase 379'),
-- (26,169,4765,0,1,47,0,14113,10,0,0,0,0,'','Kezan ''Life of the Party'' quest in progrss or completed set Phase 169'),
(26,379,4765,0,1,47,0,14113,10,0,0,0,0,'','Kezan ''Life of the Party'' quest in progrss or completed set Phase 379');

DELETE FROM `phase_area` WHERE `AreaId` = 4765 AND `PhaseId` IN (380);
INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4765, 380, 'Kezan ''Pirate Party Crashers''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (380) AND `SourceEntry` = 4765 AND `ConditionValue1` = 14115;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(26,380,4765,0,0,47,0,14115,74,0,0,0,0,'','Kezan ''Pirate Party Crashers'' quest in progrss or completed set Phase 380');

DELETE FROM `phase_area` WHERE `AreaId` = 4765 AND `PhaseId` IN (381);
INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4765, 381, 'Kezan ''The Uninvited Guest''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (380,381) AND `SourceEntry` = 4765 AND `ConditionValue1` = 14116;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(26,381,4765,0,0,47,0,14116,74,0,0,0,0,'','Kezan ''The Uninvited Guest'' quest completed or rewarded set Phase 381'),
(26,380,4765,0,0,47,0,14116,74,0,1,0,0,'','Kezan ''The Uninvited Guest'' quest completed or rewarded remove Phase 380');

DELETE FROM `phase_area` WHERE `AreaId` = 4765 AND `PhaseId` IN (382);
INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4765, 382, 'Kezan ''A Bazillion Macaroons?!''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (381,382) AND `SourceEntry` = 4765 AND `ConditionValue1` = 14120;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(26,382,4765,0,0,47,0,14120,74,0,0,0,0,'','Kezan ''A Bazillion Macaroons?!'' quest taken, completed or rewarded set Phase 382'),
(26,381,4765,0,0,47,0,14120,74,0,1,0,0,'','Kezan ''A Bazillion Macaroons?!'' quest taken, completed or rewarded remove Phase 380');

DELETE FROM `phase_area` WHERE `AreaId` = 4737 AND `PhaseId` IN (383);
INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4737, 383, 'Kezan ''The Great Bank Heist et al''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (381,383) AND `SourceEntry` IN (4765,4737) AND `ConditionValue1` = 14122;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(26,383,4737,0,0,47,0,14122,74,0,0,0,0,'','Kezan ''The Great Bank Heist'' quest taken, completed or rewarded set Phase 383'),
(26,381,4765,0,0,47,0,14122,74,0,1,0,0,'','Kezan ''The Great Bank Heist'' quest taken, completed or rewarded remove Phase 381');

DELETE FROM `phase_area` WHERE `AreaId` = 4765 AND `PhaseId` IN (384);
INSERT INTO `phase_area` (`AreaId`,`PhaseId`,`Comment`) VALUES
(4765, 384, 'Kezan ''447''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` IN (383,169,384) AND `SourceEntry` = 4765 AND `ConditionValue1` = 14125;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(26,384,4765,0,0,47,0,14125,74,0,0,0,0,'','Kezan ''447'' quest taken, completed, or rewarded set Phase 384'),
-- (26,169,4765,0,0,47,0,14125,74,0,0,0,0,'','Kezan ''447'' quest taken, completed or rewarded set Phase 169'),
(26,383,4765,0,0,47,0,14125,64,0,1,0,0,'','Kezan ''447'' quest rewarded remove Phase 383');