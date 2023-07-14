CREATE TABLE `achievement_reward_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `Locale` varchar(4) NOT NULL,
  `Subject` text DEFAULT NULL,
  `Text` text DEFAULT NULL,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `battlefield_template` (
  `TypeId` tinyint(3) unsigned NOT NULL,
  `ScriptName` varchar(64) NOT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `broadcast_text_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `Text` text DEFAULT NULL,
  `Text1` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `creature_movement_info` (
  `MovementID` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'creature_template.movementId value',
  `WalkSpeed` float DEFAULT NULL,
  `RunSpeed` float DEFAULT NULL,
  PRIMARY KEY (`MovementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `creature_movement_override` (
  `SpawnId` int(10) unsigned NOT NULL DEFAULT 0,
  `Ground` tinyint(3) unsigned DEFAULT NULL,
  `Swim` tinyint(3) unsigned DEFAULT NULL,
  `Flight` tinyint(3) unsigned DEFAULT NULL,
  `Rooted` tinyint(3) unsigned DEFAULT NULL,
  `Random` tinyint(3) unsigned DEFAULT NULL,
  `InteractionPauseTimer` int(10) unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`SpawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `creature_questender` (
  `id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Identifier',
  `quest` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

CREATE TABLE `creature_questitem` (
  `CreatureEntry` int(10) unsigned NOT NULL DEFAULT 0,
  `Idx` int(10) unsigned NOT NULL DEFAULT 0,
  `ItemId` int(10) unsigned NOT NULL DEFAULT 0,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`CreatureEntry`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `creature_queststarter` (
  `id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Identifier',
  `quest` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

CREATE TABLE `creature_sparring_template` (
  `CreatureID` int(10) unsigned NOT NULL,
  `HealthLimitPct` float DEFAULT 0,
  PRIMARY KEY (`CreatureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 

CREATE TABLE `creature_template_locale` (
  `entry` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `Name` text DEFAULT NULL,
  `FemaleName` text DEFAULT NULL,
  `Title` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `creature_template_movement` (
  `CreatureId` int(10) unsigned NOT NULL DEFAULT 0,
  `Ground` tinyint(3) unsigned DEFAULT NULL,
  `Swim` tinyint(3) unsigned DEFAULT NULL,
  `Flight` tinyint(3) unsigned DEFAULT NULL,
  `Rooted` tinyint(3) unsigned DEFAULT NULL,
  `Random` tinyint(3) unsigned DEFAULT NULL,
  `InteractionPauseTimer` int(10) unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`CreatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `creature_text_locale` (
  `CreatureID` int(10) unsigned NOT NULL DEFAULT 0,
  `GroupID` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ID` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Locale` varchar(4) NOT NULL,
  `Text` text DEFAULT NULL,
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `creature_trainer` (
  `CreatureID` int(10) unsigned NOT NULL DEFAULT 0,
  `TrainerID` int(10) unsigned NOT NULL DEFAULT 0,
  `MenuID` int(10) unsigned NOT NULL DEFAULT 0,
  `OptionID` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`CreatureID`,`MenuID`,`OptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gameobject_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT 0,
  `parent_rotation0` float NOT NULL DEFAULT 0,
  `parent_rotation1` float NOT NULL DEFAULT 0,
  `parent_rotation2` float NOT NULL DEFAULT 0,
  `parent_rotation3` float NOT NULL DEFAULT 1,
  `invisibilityType` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `invisibilityValue` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gameobject_questender` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `quest` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gameobject_questitem` (
  `GameObjectEntry` int(10) unsigned NOT NULL DEFAULT 0,
  `Idx` int(10) unsigned NOT NULL DEFAULT 0,
  `ItemId` int(10) unsigned NOT NULL DEFAULT 0,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`GameObjectEntry`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gameobject_queststarter` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `quest` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gameobject_template_addon` (
  `entry` int(10) unsigned NOT NULL DEFAULT 0,
  `faction` smallint(5) unsigned NOT NULL DEFAULT 0,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  `mingold` int(10) unsigned NOT NULL DEFAULT 0,
  `maxgold` int(10) unsigned NOT NULL DEFAULT 0,
  `artkit0` int(11) NOT NULL DEFAULT 0,
  `artkit1` int(11) NOT NULL DEFAULT 0,
  `artkit2` int(11) NOT NULL DEFAULT 0,
  `artkit3` int(11) NOT NULL DEFAULT 0,
  `artkit4` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gameobject_template_locale` (
  `entry` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `name` text DEFAULT NULL,
  `castBarCaption` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gameobject_template_locale` (
  `entry` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `name` text DEFAULT NULL,
  `castBarCaption` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gossip_menu_option_locale` (
  `MenuID` int(10) unsigned NOT NULL DEFAULT 0,
  `OptionID` int(10) unsigned NOT NULL DEFAULT 0,
  `Locale` varchar(4) NOT NULL,
  `OptionText` text DEFAULT NULL,
  `BoxText` text DEFAULT NULL,
  PRIMARY KEY (`MenuID`,`OptionID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `graveyard_zone` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `GhostZone` int(10) unsigned NOT NULL DEFAULT 0,
  `Faction` smallint(5) unsigned NOT NULL DEFAULT 0,
  `Comment` text DEFAULT NULL,
  PRIMARY KEY (`ID`,`GhostZone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

CREATE TABLE `holiday_dates` (
  `id` int(10) unsigned NOT NULL,
  `date_id` tinyint(3) unsigned NOT NULL,
  `date_value` int(10) unsigned NOT NULL,
  `holiday_duration` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `instance_spawn_groups` (
  `instanceMapId` smallint(5) unsigned NOT NULL,
  `bossStateId` tinyint(3) unsigned NOT NULL,
  `bossStates` tinyint(3) unsigned NOT NULL,
  `spawnGroupId` int(10) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`instanceMapId`,`bossStateId`,`spawnGroupId`,`bossStates`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `lfg_dungeon_template` (
  `dungeonId` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  `requiredItemLevel` smallint(6) NOT NULL DEFAULT 0,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`dungeonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `npc_text_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `Locale` varchar(4) NOT NULL,
  `Text0_0` longtext DEFAULT NULL,
  `Text0_1` longtext DEFAULT NULL,
  `Text1_0` longtext DEFAULT NULL,
  `Text1_1` longtext DEFAULT NULL,
  `Text2_0` longtext DEFAULT NULL,
  `Text2_1` longtext DEFAULT NULL,
  `Text3_0` longtext DEFAULT NULL,
  `Text3_1` longtext DEFAULT NULL,
  `Text4_0` longtext DEFAULT NULL,
  `Text4_1` longtext DEFAULT NULL,
  `Text5_0` longtext DEFAULT NULL,
  `Text5_1` longtext DEFAULT NULL,
  `Text6_0` longtext DEFAULT NULL,
  `Text6_1` longtext DEFAULT NULL,
  `Text7_0` longtext DEFAULT NULL,
  `Text7_1` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `page_text_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `Text` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `playercreateinfo_cast_spell` (
  `raceMask` int(10) unsigned NOT NULL DEFAULT 0,
  `classMask` int(10) unsigned NOT NULL DEFAULT 0,
  `spell` int(10) unsigned NOT NULL DEFAULT 0,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `playercreateinfo_skills` (
  `raceMask` int(10) unsigned NOT NULL,
  `classMask` int(10) unsigned NOT NULL,
  `skill` smallint(5) unsigned NOT NULL,
  `rank` smallint(5) unsigned NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`raceMask`,`classMask`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `points_of_interest_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `Name` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pool_members` (
  `type` smallint(5) unsigned NOT NULL,
  `spawnId` int(10) unsigned NOT NULL,
  `poolSpawnId` int(10) unsigned NOT NULL,
  `chance` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type`,`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_details` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `Emote1` smallint(5) unsigned NOT NULL DEFAULT 0,
  `Emote2` smallint(5) unsigned NOT NULL DEFAULT 0,
  `Emote3` smallint(5) unsigned NOT NULL DEFAULT 0,
  `Emote4` smallint(5) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay1` int(10) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay2` int(10) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay3` int(10) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay4` int(10) unsigned NOT NULL DEFAULT 0,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_greeting` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `Type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `GreetEmoteType` smallint(5) unsigned NOT NULL DEFAULT 0,
  `GreetEmoteDelay` int(10) unsigned NOT NULL DEFAULT 0,
  `Greeting` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_greeting_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `Type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `Greeting` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`ID`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_mail_sender` (
  `QuestId` int(10) unsigned NOT NULL DEFAULT 0,
  `RewardMailSenderEntry` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`QuestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_offer_reward` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `Emote1` smallint(5) unsigned NOT NULL DEFAULT 0,
  `Emote2` smallint(5) unsigned NOT NULL DEFAULT 0,
  `Emote3` smallint(5) unsigned NOT NULL DEFAULT 0,
  `Emote4` smallint(5) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay1` int(10) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay2` int(10) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay3` int(10) unsigned NOT NULL DEFAULT 0,
  `EmoteDelay4` int(10) unsigned NOT NULL DEFAULT 0,
  `RewardText` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_pool_members` (
  `questId` int(10) unsigned NOT NULL,
  `poolId` int(10) unsigned NOT NULL,
  `poolIndex` tinyint(3) unsigned NOT NULL COMMENT 'Multiple quests with the same index will always spawn together!',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_pool_template` (
  `poolId` int(10) unsigned NOT NULL,
  `numActive` int(10) unsigned NOT NULL COMMENT 'Number of indices to have active at any time',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`poolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_request_items` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `EmoteOnComplete` smallint(5) unsigned NOT NULL DEFAULT 0,
  `EmoteOnIncomplete` smallint(5) unsigned NOT NULL DEFAULT 0,
  `CompletionText` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_template_addon` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `AllowableClasses` int(10) unsigned NOT NULL DEFAULT 0,
  `SourceSpellID` int(10) unsigned NOT NULL DEFAULT 0,
  `PrevQuestID` int(11) NOT NULL DEFAULT 0,
  `NextQuestID` int(10) unsigned NOT NULL DEFAULT 0,
  `ExclusiveGroup` int(11) NOT NULL DEFAULT 0,
  `BreadcrumbForQuestId` int(11) NOT NULL DEFAULT 0,
  `RewardMailTemplateID` int(10) unsigned NOT NULL DEFAULT 0,
  `RewardMailDelay` int(10) unsigned NOT NULL DEFAULT 0,
  `RequiredSkillID` smallint(5) unsigned NOT NULL DEFAULT 0,
  `RequiredSkillPoints` smallint(5) unsigned NOT NULL DEFAULT 0,
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT 0,
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT 0,
  `RequiredMinRepValue` int(11) NOT NULL DEFAULT 0,
  `RequiredMaxRepValue` int(11) NOT NULL DEFAULT 0,
  `ProvidedItemCount` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `SpecialFlags` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `AllowableRaces` int(10) unsigned NOT NULL DEFAULT 0,
  `TimeAllowed` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `quest_template_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `Title` text DEFAULT NULL,
  `Details` text DEFAULT NULL,
  `Objectives` text DEFAULT NULL,
  `OfferRewardText` text DEFAULT NULL,
  `RequestItemsText` text DEFAULT NULL,
  `EndText` text DEFAULT NULL,
  `CompletedText` text DEFAULT NULL,
  `ObjectiveText1` text DEFAULT NULL,
  `ObjectiveText2` text DEFAULT NULL,
  `ObjectiveText3` text DEFAULT NULL,
  `ObjectiveText4` text DEFAULT NULL,
  `QuestGiverTextWindow` text DEFAULT NULL,
  `QuestGiverTargetName` text DEFAULT NULL,
  `QuestTurnTextWindow` text DEFAULT NULL,
  `QuestTurnTargetName` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `script_spline_chain_meta` (
  `entry` int(10) unsigned NOT NULL,
  `chainId` smallint(5) unsigned NOT NULL,
  `splineId` tinyint(3) unsigned NOT NULL,
  `expectedDuration` int(10) unsigned NOT NULL,
  `msUntilNext` int(10) unsigned NOT NULL,
  `velocity` float DEFAULT 0,
  PRIMARY KEY (`entry`,`chainId`,`splineId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `script_spline_chain_waypoints` (
  `entry` int(10) unsigned NOT NULL,
  `chainId` smallint(5) unsigned NOT NULL,
  `splineId` tinyint(3) unsigned NOT NULL,
  `wpId` tinyint(3) unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  PRIMARY KEY (`entry`,`chainId`,`splineId`,`wpId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `skill_perfect_item_template` (
  `spellId` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Specialization spell id',
  `perfectCreateChance` float NOT NULL DEFAULT 0 COMMENT 'chance to create the perfect item instead',
  `perfectItemType` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'perfect item type to create instead',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Crafting Perfection System';

CREATE TABLE `spawn_group` (
  `groupId` int(10) unsigned NOT NULL,
  `spawnType` tinyint(3) unsigned NOT NULL,
  `spawnId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`groupId`,`spawnType`,`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `spawn_group_template` (
  `groupId` int(10) unsigned NOT NULL,
  `groupName` varchar(100) NOT NULL,
  `groupFlags` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `spell_custom_attr` (
  `entry` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'spell id',
  `attributes` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'SpellCustomAttributes',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='SpellInfo custom attributes';

CREATE TABLE `summon_properties_parameters` (
  `RecID` int(10) unsigned NOT NULL COMMENT 'SummonProperties.dbc Identifier',
  `ParamType` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`RecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `taxi_level_data` (
  `TaxiNodeId` smallint(6) NOT NULL,
  `Level` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`TaxiNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `terrain_swap_defaults` (
  `MapId` int(10) unsigned NOT NULL,
  `TerrainSwapMap` int(10) unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MapId`,`TerrainSwapMap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `terrain_worldmap` (
  `TerrainSwapMap` int(10) unsigned NOT NULL,
  `WorldMapArea` int(10) unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TerrainSwapMap`,`WorldMapArea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trainer` (
  `Id` int(10) unsigned NOT NULL DEFAULT 0,
  `Type` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `Requirement` int(10) unsigned NOT NULL DEFAULT 0,
  `Greeting` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trainer_locale` (
  `Id` int(10) unsigned NOT NULL DEFAULT 0,
  `locale` varchar(4) NOT NULL,
  `Greeting_lang` text DEFAULT NULL,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`Id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `trainer_spell` (
  `TrainerId` int(10) unsigned NOT NULL DEFAULT 0,
  `SpellId` int(10) unsigned NOT NULL DEFAULT 0,
  `MoneyCost` int(10) unsigned NOT NULL DEFAULT 0,
  `ReqSkillLine` int(10) unsigned NOT NULL DEFAULT 0,
  `ReqSkillRank` int(10) unsigned NOT NULL DEFAULT 0,
  `ReqAbility1` int(10) unsigned NOT NULL DEFAULT 0,
  `ReqAbility2` int(10) unsigned NOT NULL DEFAULT 0,
  `ReqAbility3` int(10) unsigned NOT NULL DEFAULT 0,
  `ReqLevel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `VerifiedBuild` smallint(6) DEFAULT 0,
  PRIMARY KEY (`TrainerId`,`SpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL,
  `hash` varchar(40) DEFAULT NULL,
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all applied updates in this database.';

CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL,
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';

CREATE TABLE `vehicle_seat_addon` (
  `SeatEntry` int(10) unsigned NOT NULL COMMENT 'VehicleSeatEntry.dbc identifier',
  `SeatOffsetX` float DEFAULT 0,
  `SeatOffsetY` float DEFAULT 0,
  `SeatOffsetZ` float DEFAULT 0,
  `SeatOffsetO` float DEFAULT 0 COMMENT 'Seat Orientation override value',
  `ExitParamX` float DEFAULT 0,
  `ExitParamY` float DEFAULT 0,
  `ExitParamZ` float DEFAULT 0,
  `ExitParamO` float DEFAULT 0,
  `ExitParamValue` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`SeatEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vehicle_template_accessory` (
  `entry` int(10) unsigned NOT NULL DEFAULT 0,
  `accessory_entry` int(10) unsigned NOT NULL DEFAULT 0,
  `seat_id` tinyint(4) NOT NULL DEFAULT 0,
  `minion` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `summontype` tinyint(3) unsigned NOT NULL DEFAULT 6 COMMENT 'see enum TempSummonType',
  `summontimer` int(10) unsigned NOT NULL DEFAULT 30000 COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`entry`,`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `waypoint_data_addon` (
  `PathID` int(10) unsigned NOT NULL DEFAULT 0,
  `PointID` int(10) unsigned NOT NULL DEFAULT 0,
  `SplinePointIndex` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `PositionX` float NOT NULL DEFAULT 0,
  `PositionY` float NOT NULL DEFAULT 0,
  `PositionZ` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `world_map_template` (
  `mapID` int(10) unsigned NOT NULL DEFAULT 0,
  `ScriptName` text DEFAULT NULL,
  PRIMARY KEY (`mapID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `world_state` (
  `ID` int(10) unsigned NOT NULL,
  `DefaultValue` int(11) NOT NULL DEFAULT 0,
  `MapIDs` varchar(128) DEFAULT NULL,
  `AreaIDs` varchar(255) DEFAULT NULL,
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `Comment` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `creature_template` CHANGE `faction_A` `faction` smallint(5) unsigned;
ALTER TABLE `creature` CHANGE `spawndist` `wander_distance` float;
ALTER TABLE `creature` CHANGE `zone` `zoneId` smallint(5) unsigned;
ALTER TABLE `creature` ADD COLUMN `PhaseId` int(11) AFTER `phaseMask`;
ALTER TABLE `creature_formations` CHANGE `dist` `FollowDistance` float;
ALTER TABLE `creature_formations` CHANGE `angle` `FollowAngle` float;
ALTER TABLE `creature_addon` CHANGE `path_id` `waypointPathId` int(10) unsigned;
ALTER TABLE `gameobject` CHANGE `zone` `zoneId` smallint(5) unsigned;
ALTER TABLE `creature` ADD COLUMN `PhaseGroup` int(11) AFTER `PhaseId`;
ALTER TABLE `creature` CHANGE `area` `areaId` smallint(5) unsigned;
ALTER TABLE `gameobject` CHANGE `area` `areaId` smallint(5) unsigned;

ALTER TABLE `creature_text` CHANGE `entry` `CreatureId` int(10) unsigned;
ALTER TABLE `creature_text` ADD COLUMN `SoundType` int(10) AFTER `Sound`;
ALTER TABLE `creature_text` ADD COLUMN `TextRange` tinyint(3) unsigned AFTER `BroadcastTextId`;
ALTER TABLE `smart_scripts` ADD COLUMN `event_param5` int(10) unsigned AFTER `event_param4`;
ALTER TABLE `waypoints` ADD COLUMN `orientation` float AFTER `position_z`;
ALTER TABLE `waypoints` ADD COLUMN `velocity` float AFTER `orientation`;
ALTER TABLE `waypoints` ADD COLUMN `delay` float AFTER `velocity`;
ALTER TABLE `waypoints` ADD COLUMN `smoothTransition` float AFTER `delay`;
ALTER TABLE `waypoint_data` ADD COLUMN `velocity` float AFTER `orientation`;
ALTER TABLE `waypoint_data` ADD COLUMN `smoothTransition` tinyint(3) unsigned AFTER `delay`;
ALTER TABLE `waypoint_data` CHANGE `move_flag` `move_type` int(11);
ALTER TABLE `command` CHANGE `security` `permission` smallint(5) unsigned;

ALTER TABLE `creature_template` ADD COLUMN `femaleName` varchar(100) AFTER `name`;
ALTER TABLE `creature_template` ADD COLUMN `BaseVariance` float AFTER `RangeAttackTime`;
ALTER TABLE `creature_template` ADD COLUMN `RangeVariance` float AFTER `BaseVariance`;
ALTER TABLE `creature_template` CHANGE `Health_mod` `HealthModifier` float;
ALTER TABLE `creature_template` ADD COLUMN `HealthModifierExtra` float AFTER `HealthModifier`;
ALTER TABLE `creature_template` CHANGE `Mana_mod` `ManaModifier` float;
ALTER TABLE `creature_template` CHANGE `Mana_mod_extra` `ManaModifierExtra` float;
ALTER TABLE `creature_template` CHANGE `Armor_mod` `ArmorModifier` float;
ALTER TABLE `creature_template` ADD COLUMN `DamageModifier` float AFTER `ArmorModifier`;
ALTER TABLE `creature_template` ADD COLUMN `ExperienceModifier` float AFTER `DamageModifier`;
ALTER TABLE `creature_template` ADD COLUMN `spell_school_immune_mask` int(10) unsigned AFTER `mechanic_immune_mask`;
ALTER TABLE `creature_template` CHANGE `WDBVerified` `VerifiedBuild` smallint(6);

ALTER TABLE `spell_dbc` ADD COLUMN `SpellName` varchar(128) AFTER `SpellTotemsId`;
ALTER TABLE `spell_dbc` DROP `powerType`;
ALTER TABLE `spell_dbc` DROP `runeCostID`;
ALTER TABLE `spell_dbc` DROP `SpellDifficultyId`;
ALTER TABLE `spell_dbc` DROP `SpellCoef`;
ALTER TABLE `spell_dbc` DROP `SpellScalingId`;
ALTER TABLE `spell_dbc` DROP `SpellAuraRestrictionsId`;
ALTER TABLE `spell_dbc` DROP `SpellCooldownsId`;
ALTER TABLE `spell_dbc` DROP `SpellPowerId`;
ALTER TABLE `spell_dbc` DROP `SpellReagentsId`;
ALTER TABLE `spell_dbc` DROP `SpellShapeshiftId`;
ALTER TABLE `spell_dbc` DROP `SpellTotemsId`;
-- ALTER TABLE `spell_dbc` MODIFY `Id`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `Attributes`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx2`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx3`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx4`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx5`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx6`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx7`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx8`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx9`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `AttributesEx10`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `CastingTimeIndex`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `DurationIndex`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `rangeIndex`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SchoolMask`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellAuraOptionsId`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellCastingRequirementsId`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellCategoriesId`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellClassOptionsId`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellEquippedItemsId`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellInterruptsId`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellLevelsId`  int(10) unsigned;
-- ALTER TABLE `spell_dbc` MODIFY `SpellTargetRestrictionsId`  int(10) unsigned;

ALTER TABLE `spelleffect_dbc` ADD COLUMN `Comment`  varchar(128) AFTER `EffectIndex`;
ALTER TABLE `spelleffect_dbc` ADD COLUMN `EffectAura`  int(10) unsigned AFTER `EffectAmplitude`;
ALTER TABLE `spelleffect_dbc` ADD COLUMN `EffectAuraPeriod`  int(10) unsigned AFTER `EffectAura`;
ALTER TABLE `spelleffect_dbc` DROP `EffectValueMultiplier`;
ALTER TABLE `spelleffect_dbc` DROP `EffectApplyAuraName`;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectBonusMultiplier` `EffectBonusCoefficient`  float;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectDamageMultiplier` `EffectChainAmplitude`  float;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectChainTarget` `EffectChainTargets`  int(10) unsigned;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectPointsPerComboPoint` `EffectPointsPerResource`  float;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectSpellClassMask_1` `EffectSpellClassMaskA`  int(10) unsigned;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectSpellClassMask_2` `EffectSpellClassMaskB`  int(10) unsigned;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectSpellClassMask_3` `EffectSpellClassMaskC`  int(10) unsigned;
ALTER TABLE `spelleffect_dbc` CHANGE `EffectSpellId` `SpellID`  int(10) unsigned;
ALTER TABLE `spelleffect_dbc` MODIFY `EffectAmplitude`  float;
ALTER TABLE `spelleffect_dbc` MODIFY `EffectDieSides`  int(11);
ALTER TABLE `spelleffect_dbc` MODIFY `EffectTriggerSpell`  int(10) unsigned;

ALTER TABLE `creature` ADD COLUMN `phaseUseFlags`  tinyint(3) unsigned AFTER `spawnMask`;
ALTER TABLE `creature` ADD COLUMN `terrainSwapMap`  int(11) AFTER `PhaseGroup`;
ALTER TABLE `creature` ADD COLUMN `ScriptName`  varchar(64) AFTER `dynamicflags`;
ALTER TABLE `creature` ADD COLUMN `VerifiedBuild`  smallint(6) AFTER `ScriptName`;
ALTER TABLE `creature` MODIFY `id`  int(10) unsigned;
ALTER TABLE `creature` MODIFY `phaseMask`  int(10) unsigned;
ALTER TABLE `creature` MODIFY `modelid`  int(10) unsigned;
ALTER TABLE `creature` MODIFY `currentwaypoint`  int(10) unsigned;
ALTER TABLE `creature` DROP `walkmode`;
     
ALTER TABLE `gameobject` ADD COLUMN `phaseUseFlags`  tinyint(3) unsigned AFTER `spawnMask`;
ALTER TABLE `gameobject` ADD COLUMN `PhaseId`  int(11) AFTER `phaseMask`;
ALTER TABLE `gameobject` ADD COLUMN `PhaseGroup`  int(11) AFTER `PhaseId`;
ALTER TABLE `gameobject` ADD COLUMN `terrainSwapMap`  int(11) AFTER `PhaseGroup`;
ALTER TABLE `gameobject` ADD COLUMN `ScriptName`  varchar(64) AFTER `state`;
ALTER TABLE `gameobject` ADD COLUMN `VerifiedBuild`  smallint(6) AFTER `ScriptName`;
ALTER TABLE `gameobject` MODIFY `id`  int(10) unsigned;
ALTER TABLE `gameobject` MODIFY `phaseMask`  int(10) unsigned;

ALTER TABLE `broadcast_text` CHANGE `Language` `LanguageID`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `MaleText` `Text`  text;
ALTER TABLE `broadcast_text` CHANGE `FemaleText` `Text1`  text;
ALTER TABLE `broadcast_text` CHANGE `EmoteID2` `EmoteID3`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `EmoteID1` `EmoteID2`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `EmoteID0` `EmoteID1`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `EmoteDelay2` `EmoteDelay3`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `EmoteDelay1` `EmoteDelay2`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `EmoteDelay0` `EmoteDelay1`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `SoundId` `SoundEntriesID`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `Unk1` `EmotesID`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `Unk2` `Flags`  int(10) unsigned;
ALTER TABLE `broadcast_text` CHANGE `WDBVerified` `VerifiedBuild`  smallint(6);

ALTER TABLE `page_text` CHANGE `entry` `ID`  int(10) unsigned;
ALTER TABLE `page_text` CHANGE `next_page` `NextPageID`  int(10) unsigned;
ALTER TABLE `page_text` CHANGE `WDBVerified` `VerifiedBuild`  smallint(6);
ALTER TABLE `page_text` MODIFY `text`  mediumtext;

ALTER TABLE `gameobject_template` MODIFY `entry`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `displayId`  int(10) unsigned;
ALTER TABLE `gameobject_template` DROP `faction`;
ALTER TABLE `gameobject_template` DROP `flags`;
ALTER TABLE `gameobject_template` DROP `questItem1`;
ALTER TABLE `gameobject_template` DROP `questItem2`;
ALTER TABLE `gameobject_template` DROP `questItem3`;
ALTER TABLE `gameobject_template` DROP `questItem4`;
ALTER TABLE `gameobject_template` DROP `questItem5`;
ALTER TABLE `gameobject_template` DROP `questItem6`;
ALTER TABLE `gameobject_template` CHANGE `unkInt32` `RequiredLevel`  int(11);
ALTER TABLE `gameobject_template` CHANGE `WDBVerified` `VerifiedBuild`  smallint(6);
ALTER TABLE `gameobject_template` MODIFY `data24`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `data25`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `data26`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `data27`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `data28`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `data29`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `data30`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `data31`  int(10) unsigned;
ALTER TABLE `gameobject_template` MODIFY `AIName`  varchar(64);

DELETE FROM `gameobject_template` WHERE `entry` IN (199998,199999);

ALTER TABLE `transports` ADD COLUMN `phaseid`  int(11) AFTER `period`;
ALTER TABLE `transports` ADD COLUMN `phasegroup`  int(11) AFTER `phaseid`;
ALTER TABLE `transports` CHANGE `period` `phaseUseFlags`  mediumint unsigned;
ALTER TABLE `transports` MODIFY `entry`  int(10) unsigned;
ALTER TABLE `transports` MODIFY `ScriptName`  varchar(64);

ALTER TABLE `spell_proc` ADD COLUMN `DisableEffectsMask`  int(10) unsigned AFTER `attributesMask`;
ALTER TABLE `spell_proc` CHANGE `typeMask` `ProcFlags`  int(10) unsigned;
ALTER TABLE `spell_proc` CHANGE `ratePerMinute` `ProcsPerMinute`  float;
ALTER TABLE `spell_proc` MODIFY `spellId`  int(11);
ALTER TABLE `spell_proc` MODIFY `schoolMask`  tinyint(3) unsigned;
ALTER TABLE `spell_proc` MODIFY `spellPhaseMask`  int(10) unsigned;
ALTER TABLE `spell_proc` MODIFY `hitMask`  int(10) unsigned;
ALTER TABLE `spell_proc` MODIFY `cooldown`  int(10) unsigned;
ALTER TABLE `spell_proc` MODIFY `charges`  tinyint(3) unsigned;

ALTER TABLE `npc_text` DROP `BroadcastTextID8`;
ALTER TABLE `npc_text` CHANGE `prob0` `Probability0`  float;
ALTER TABLE `npc_text` CHANGE `em0_0` `EmoteDelay0_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em0_1` `Emote0_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em0_2` `EmoteDelay0_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em0_3` `Emote0_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em0_4` `EmoteDelay0_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em0_5` `Emote0_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `prob1` `Probability1`  float;
ALTER TABLE `npc_text` CHANGE `em1_0` `EmoteDelay1_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em1_1` `Emote1_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em1_2` `EmoteDelay1_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em1_3` `Emote1_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em1_4` `EmoteDelay1_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em1_5` `Emote1_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `prob2` `Probability2`  float;
ALTER TABLE `npc_text` CHANGE `em2_0` `EmoteDelay2_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em2_1` `Emote2_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em2_2` `EmoteDelay2_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em2_3` `Emote2_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em2_4` `EmoteDelay2_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em2_5` `Emote2_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `prob3` `Probability3`  float;
ALTER TABLE `npc_text` CHANGE `em3_0` `EmoteDelay3_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em3_1` `Emote3_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em3_2` `EmoteDelay3_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em3_3` `Emote3_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em3_4` `EmoteDelay3_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em3_5` `Emote3_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `prob4` `Probability4`  float;
ALTER TABLE `npc_text` CHANGE `em4_0` `EmoteDelay4_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em4_1` `Emote4_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em4_2` `EmoteDelay4_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em4_3` `Emote4_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em4_4` `EmoteDelay4_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em4_5` `Emote4_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `prob5` `Probability5`  float;
ALTER TABLE `npc_text` CHANGE `em5_0` `EmoteDelay5_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em5_1` `Emote5_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em5_2` `EmoteDelay5_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em5_3` `Emote5_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em5_4` `EmoteDelay5_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em5_5` `Emote5_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `prob6` `Probability6`  float;
ALTER TABLE `npc_text` CHANGE `em6_0` `EmoteDelay6_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em6_1` `Emote6_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em6_2` `EmoteDelay6_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em6_3` `Emote6_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em6_4` `EmoteDelay6_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em6_5` `Emote6_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `prob7` `Probability7`  float;
ALTER TABLE `npc_text` CHANGE `em7_0` `EmoteDelay7_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em7_1` `Emote7_0`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em7_2` `EmoteDelay7_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em7_3` `Emote7_1`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em7_4` `EmoteDelay7_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `em7_5` `Emote7_2`  smallint(5) unsigned;
ALTER TABLE `npc_text` CHANGE `WDBVerified` `VerifiedBuild`  smallint(6);
ALTER TABLE `npc_text` MODIFY `ID`  int(10) unsigned;
ALTER TABLE `npc_text` MODIFY `BroadcastTextID0`  int(11);
ALTER TABLE `npc_text` MODIFY `BroadcastTextID1`  int(11);
ALTER TABLE `npc_text` MODIFY `BroadcastTextID2`  int(11);
ALTER TABLE `npc_text` MODIFY `BroadcastTextID3`  int(11);
ALTER TABLE `npc_text` MODIFY `BroadcastTextID4`  int(11);
ALTER TABLE `npc_text` MODIFY `BroadcastTextID5`  int(11);
ALTER TABLE `npc_text` MODIFY `BroadcastTextID6`  int(11);
ALTER TABLE `npc_text` MODIFY `BroadcastTextID7`  int(11);

ALTER TABLE `spell_enchant_proc_data` ADD COLUMN `AttributesMask`  int(10) unsigned AFTER `procEx`;
ALTER TABLE `spell_enchant_proc_data` CHANGE `entry` `EnchantID`  int(10) unsigned;
ALTER TABLE `spell_enchant_proc_data` CHANGE `customChance` `Chance`  float;
ALTER TABLE `spell_enchant_proc_data` CHANGE `PPMChance` `ProcsPerMinute`  float;
ALTER TABLE `spell_enchant_proc_data` CHANGE `procEx` `HitMask`  int(10) unsigned;

ALTER TABLE `achievement_reward` ADD COLUMN `MailTemplateID` int(10) unsigned AFTER `text`;
ALTER TABLE `achievement_reward` CHANGE `entry` `ID` int(10) unsigned;
ALTER TABLE `achievement_reward` CHANGE `title_A` `TitleA` int(10) unsigned;
ALTER TABLE `achievement_reward` CHANGE `title_H` `TitleH` int(10) unsigned;
ALTER TABLE `achievement_reward` CHANGE `item` `ItemID` int(10) unsigned;
ALTER TABLE `achievement_reward` MODIFY `sender` int(10) unsigned;

ALTER TABLE `areatrigger_teleport` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `target_orientation`;
ALTER TABLE `areatrigger_teleport` MODIFY `id` int(10) unsigned;

ALTER TABLE `creature_addon` ADD COLUMN `cyclicSplinePathId` int(10) unsigned AFTER `waypointPathId`;
ALTER TABLE `creature_addon` ADD COLUMN `StandState` tinyint(3) unsigned AFTER `mount`;
ALTER TABLE `creature_addon` ADD COLUMN `AnimTier` tinyint(3) unsigned AFTER `StandState`;
ALTER TABLE `creature_addon` ADD COLUMN `SheathState` tinyint(3) unsigned AFTER `bytes1`;
ALTER TABLE `creature_addon` ADD COLUMN `aiAnimKit` smallint(6) AFTER `emote`;
ALTER TABLE `creature_addon` ADD COLUMN `movementAnimKit` smallint(6) AFTER `aiAnimKit`;
ALTER TABLE `creature_addon` ADD COLUMN `meleeAnimKit` smallint(6) AFTER `movementAnimKit`;
ALTER TABLE `creature_addon` ADD COLUMN `visibilityDistanceType` tinyint(3) unsigned AFTER `meleeAnimKit`;
ALTER TABLE `creature_addon` CHANGE `bytes1` `VisFlags` int(10) unsigned;
ALTER TABLE `creature_addon` CHANGE `bytes2` `PvPFlags` int(10) unsigned;

ALTER TABLE `creature_classlevelstats` ADD COLUMN `attackpower` smallint(6) AFTER `basearmor`;
ALTER TABLE `creature_classlevelstats` ADD COLUMN `rangedattackpower` smallint(6) AFTER `attackpower`;
ALTER TABLE `creature_classlevelstats` ADD COLUMN `damage_base` float AFTER `rangedattackpower`;
ALTER TABLE `creature_classlevelstats` ADD COLUMN `damage_exp1` float AFTER `damage_base`;
ALTER TABLE `creature_classlevelstats` ADD COLUMN `damage_exp2` float AFTER `damage_exp1`;
ALTER TABLE `creature_classlevelstats` ADD COLUMN `damage_exp3` float AFTER `damage_exp2`;
ALTER TABLE `creature_classlevelstats` ADD COLUMN `comment` text AFTER `damage_exp3`;
ALTER TABLE `creature_classlevelstats` MODIFY `basehp0` int(10) unsigned;
ALTER TABLE `creature_classlevelstats` MODIFY `basehp1` int(10) unsigned;
ALTER TABLE `creature_classlevelstats` MODIFY `basehp2` int(10) unsigned;
ALTER TABLE `creature_classlevelstats` MODIFY `basehp3` int(10) unsigned;
ALTER TABLE `creature_classlevelstats` MODIFY `basemana` int(10) unsigned;
ALTER TABLE `creature_classlevelstats` MODIFY `basearmor` int(10) unsigned;

ALTER TABLE `creature_equip_template` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `itemEntry3`;
ALTER TABLE `creature_equip_template` CHANGE `entry` `CreatureID` int(10) unsigned;
ALTER TABLE `creature_equip_template` CHANGE `itemEntry1` `ItemID1` int(10) unsigned;
ALTER TABLE `creature_equip_template` CHANGE `itemEntry2` `ItemID2` int(10) unsigned;
ALTER TABLE `creature_equip_template` CHANGE `itemEntry3` `ItemID3` int(10) unsigned;

ALTER TABLE `creature_formations` ADD COLUMN `InversionPoint1` int(11) AFTER `groupAI`;
ALTER TABLE `creature_formations` ADD COLUMN `InversionPoint2` int(11) AFTER `InversionPoint1`;

ALTER TABLE `creature_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `creature_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `creature_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `creature_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `creature_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `creature_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `creature_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `creature_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `creature_template_addon` ADD COLUMN `cyclicSplinePathId` int(10) unsigned AFTER `path_id`;

ALTER TABLE `creature_template_addon` ADD COLUMN `StandState` tinyint(3) unsigned AFTER `mount`;
ALTER TABLE `creature_template_addon` ADD COLUMN `AnimTier` tinyint(3) unsigned AFTER `StandState`;
ALTER TABLE `creature_template_addon` ADD COLUMN `SheathState` tinyint(3) unsigned AFTER `bytes1`;
ALTER TABLE `creature_template_addon` ADD COLUMN `aiAnimKit` smallint(6) AFTER `emote`;
ALTER TABLE `creature_template_addon` ADD COLUMN `movementAnimKit` smallint(6) AFTER `aiAnimKit`;
ALTER TABLE `creature_template_addon` ADD COLUMN `meleeAnimKit` smallint(6) AFTER `movementAnimKit`;
ALTER TABLE `creature_template_addon` ADD COLUMN `visibilityDistanceType` tinyint(3) unsigned AFTER `meleeAnimKit`;
ALTER TABLE `creature_template_addon` CHANGE `path_id` `waypointPathId` int(10) unsigned;
ALTER TABLE `creature_template_addon` CHANGE `bytes1` `VisFlags` int(10) unsigned;
ALTER TABLE `creature_template_addon` CHANGE `bytes2` `PvPFlags` int(10) unsigned;
ALTER TABLE `creature_template_addon` MODIFY `entry` int(10) unsigned;
ALTER TABLE `creature_template_addon` MODIFY `mount` int(10) unsigned;
ALTER TABLE `creature_template_addon` MODIFY `emote` int(10) unsigned;

ALTER TABLE `disenchant_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `disenchant_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `disenchant_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `disenchant_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `disenchant_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `disenchant_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(9);
ALTER TABLE `disenchant_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `disenchant_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `fishing_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `fishing_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `fishing_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `fishing_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `fishing_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `fishing_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `fishing_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `fishing_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `game_event` ADD COLUMN `holidayStage` tinyint(3) unsigned AFTER `holiday`;
ALTER TABLE `game_event` ADD COLUMN `announce` tinyint(3) unsigned AFTER `world_event`;
ALTER TABLE `game_event` MODIFY `holiday` int(10) unsigned;

ALTER TABLE `gameobject_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `gameobject_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `gameobject_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `gameobject_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `gameobject_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `gameobject_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `gameobject_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `gameobject_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `gossip_menu` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `text_id`;
ALTER TABLE `gossip_menu` CHANGE `entry` `MenuID` int(10) unsigned;
ALTER TABLE `gossip_menu` CHANGE `text_id` `TextID` int(10) unsigned;

ALTER TABLE `gossip_menu_option` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `BoxBroadcastTextId`;
ALTER TABLE `gossip_menu_option` CHANGE `menu_id` `MenuID` int(10) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `id` `OptionID` int(10) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `option_icon` `OptionIcon` tinyint(3) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `option_text` `OptionText` text;
ALTER TABLE `gossip_menu_option` CHANGE `option_id` `OptionType` int(10) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `npc_option_npcflag` `OptionNpcflag` bigint(20) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `action_menu_id` `ActionMenuID` int(10) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `action_poi_id` `ActionPoiID` int(10) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `box_coded` `BoxCoded` tinyint(3) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `box_money` `BoxMoney` int(10) unsigned;
ALTER TABLE `gossip_menu_option` CHANGE `box_text` `BoxText` mediumtext;
ALTER TABLE `gossip_menu_option` MODIFY `OptionbroadCastTextId` int(10) unsigned;
ALTER TABLE `gossip_menu_option` MODIFY `BoxBroadcastTextId` int(10) unsigned;

ALTER TABLE `guild_challenges` DROP `challengeId`;
ALTER TABLE `guild_challenges` DROP `challengeRewardId`;
ALTER TABLE `guild_challenges` DROP `challengeEntry`;
ALTER TABLE `guild_challenges` ADD COLUMN `ChallengeCount` int(10) unsigned AFTER `challengeType`;
ALTER TABLE `guild_challenges` ADD COLUMN `Experience` int(10) unsigned AFTER `ChallengeCount`;
ALTER TABLE `guild_challenges` ADD COLUMN `Gold` int(10) unsigned AFTER `Experience`;
ALTER TABLE `guild_challenges` ADD COLUMN `GoldMaxLevel` int(10) unsigned AFTER `Gold`;
ALTER TABLE `guild_challenges` MODIFY `challengeType` int(10) unsigned;

ALTER TABLE `item_enchantment_template` ADD COLUMN `type` tinyint(3) unsigned AFTER `entry`;
ALTER TABLE `item_enchantment_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `item_enchantment_template` MODIFY `ench` int(10) unsigned;
ALTER TABLE `item_enchantment_template` MODIFY `chance` float;

ALTER TABLE `item_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `item_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `item_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `item_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `item_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `item_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `item_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `item_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `item_template_addon` DROP `BuyPrice`;
ALTER TABLE `item_template_addon` MODIFY `SpellPPMChance` float;

ALTER TABLE `lfg_dungeon_rewards` DROP `firstMoneyVar`;
ALTER TABLE `lfg_dungeon_rewards` DROP `firstXPVar`;
ALTER TABLE `lfg_dungeon_rewards` DROP `otherMoneyVar`;
ALTER TABLE `lfg_dungeon_rewards` DROP `otherXPVar`;
ALTER TABLE `lfg_dungeon_rewards` ADD COLUMN `shortageQuestId` int(10) unsigned AFTER `otherQuestId`;
ALTER TABLE `lfg_dungeon_rewards` ADD COLUMN `completionsPerPeriod` tinyint(3) unsigned AFTER `shortageQuestId`;
ALTER TABLE `lfg_dungeon_rewards` ADD COLUMN `dailyReset` tinyint(3) unsigned AFTER `completionsPerPeriod`;

ALTER TABLE `mail_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `mail_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `mail_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `mail_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `mail_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `mail_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `mail_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `mail_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `milling_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `milling_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `milling_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `milling_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `milling_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `milling_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `milling_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `milling_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `npc_vendor` ADD COLUMN `PlayerConditionID` int(11) AFTER `type`;
ALTER TABLE `npc_vendor` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `PlayerConditionID`;
ALTER TABLE `npc_vendor` MODIFY `entry` int(10) unsigned;
ALTER TABLE `npc_vendor` MODIFY `item` int(11);
ALTER TABLE `npc_vendor` MODIFY `maxcount` int(10) unsigned;
ALTER TABLE `npc_vendor` MODIFY `ExtendedCost` int(10) unsigned;

ALTER TABLE `pet_levelstats` DROP `mindmg`;
ALTER TABLE `pet_levelstats` DROP `maxdmg`;
ALTER TABLE `pet_levelstats` DROP `attackpower`;
ALTER TABLE `pet_levelstats` MODIFY `creature_entry` int(10) unsigned;

DROP TABLE `phase_area`;
CREATE TABLE `phase_area` (
  `AreaId` int(10) unsigned NOT NULL,
  `PhaseId` int(10) unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AreaId`,`PhaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `pickpocketing_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `pickpocketing_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `pickpocketing_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `pickpocketing_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `pickpocketing_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `pickpocketing_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `pickpocketing_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `pickpocketing_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `player_xp_for_level` CHANGE `lvl` `Level` tinyint(3) unsigned;
ALTER TABLE `player_xp_for_level` CHANGE `xp_for_next_level` `Experience` int(10) unsigned;

ALTER TABLE `playercreateinfo_spell_custom` DROP `Active`;
ALTER TABLE `playercreateinfo_spell_custom` MODIFY `Spell` int(10) unsigned;

ALTER TABLE `points_of_interest` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `icon_name`;
ALTER TABLE `points_of_interest` CHANGE `entry` `ID` int(10) unsigned;
ALTER TABLE `points_of_interest` CHANGE `x` `PositionX` float;
ALTER TABLE `points_of_interest` CHANGE `y` `PositionY` float;
ALTER TABLE `points_of_interest` CHANGE `data` `Importance` int(10) unsigned;
ALTER TABLE `points_of_interest` CHANGE `icon_name` `Name` text;
ALTER TABLE `points_of_interest` MODIFY `icon` int(10) unsigned;
ALTER TABLE `points_of_interest` MODIFY `flags` int(10) unsigned;

ALTER TABLE `prospecting_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `prospecting_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `prospecting_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `prospecting_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `prospecting_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `prospecting_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `prospecting_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `prospecting_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `quest_poi` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `unk4`;
ALTER TABLE `quest_poi` CHANGE `objIndex` `ObjectiveIndex` int(11);
ALTER TABLE `quest_poi` CHANGE `FloorId` `Floor` int(10) unsigned;
ALTER TABLE `quest_poi` CHANGE `unk3` `Priority` int(10) unsigned;
ALTER TABLE `quest_poi` CHANGE `unk4` `Flags` int(10) unsigned;

ALTER TABLE `quest_poi_points` ADD COLUMN `BlobIndex` int(11) AFTER `questId`;
ALTER TABLE `quest_poi_points` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `y`;
ALTER TABLE `quest_poi_points` CHANGE `id` `Idx1` int(11);
ALTER TABLE `quest_poi_points` CHANGE `idx` `Idx2` int(11);
ALTER TABLE `quest_poi_points` MODIFY `questId` int(11);

ALTER TABLE `quest_template` ADD COLUMN `QuestInfoID` smallint(5) unsigned AFTER `ZoneOrSort`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDrop1` int(10) unsigned AFTER `RewardItemCount4`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDropQuantity1` smallint(5) unsigned AFTER `ItemDrop1`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDrop2` int(10) unsigned AFTER `ItemDropQuantity1`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDropQuantity2` smallint(5) unsigned AFTER `ItemDrop2`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDrop3` int(10) unsigned AFTER `ItemDropQuantity2`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDropQuantity3` smallint(5) unsigned AFTER `ItemDrop3`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDrop4` int(10) unsigned AFTER `ItemDropQuantity3`;
ALTER TABLE `quest_template` ADD COLUMN `ItemDropQuantity4` smallint(5) unsigned AFTER `ItemDrop4`;
ALTER TABLE `quest_template` ADD COLUMN `RewardTitle` tinyint(3) unsigned AFTER `PointOption`;
ALTER TABLE `quest_template` DROP `Type`;
ALTER TABLE `quest_template` DROP `Note`;
ALTER TABLE `quest_template` DROP `Status`;
ALTER TABLE `quest_template` DROP `MaxLevel`;
ALTER TABLE `quest_template` DROP `LimitTime`;
ALTER TABLE `quest_template` DROP `RequiredClasses`;
ALTER TABLE `quest_template` DROP `RequiredRaces`;
ALTER TABLE `quest_template` DROP `RequiredSkillId`;
ALTER TABLE `quest_template` DROP `RequiredSkillPoints`;
ALTER TABLE `quest_template` DROP `RequiredMinRepFaction`;
ALTER TABLE `quest_template` DROP `RequiredMaxRepFaction`;
ALTER TABLE `quest_template` DROP `RequiredMinRepValue`;
ALTER TABLE `quest_template` DROP `RequiredMaxRepValue`;
ALTER TABLE `quest_template` DROP `PrevQuestId`;
ALTER TABLE `quest_template` DROP `NextQuestId`;
ALTER TABLE `quest_template` DROP `ExclusiveGroup`;
ALTER TABLE `quest_template` DROP `RewardMailTemplateId`;
ALTER TABLE `quest_template` DROP `RewardMailDelay`;
ALTER TABLE `quest_template` DROP `SourceSpellId`;
ALTER TABLE `quest_template` DROP `Flags`;
ALTER TABLE `quest_template` DROP `SpecialFlags`;
ALTER TABLE `quest_template` DROP `RewardTitleId`;
ALTER TABLE `quest_template` DROP `OfferRewardText`;
ALTER TABLE `quest_template` DROP `RequestItemsText`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemId1`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemId2`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemId3`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemId4`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemCount1`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemCount2`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemCount3`;
ALTER TABLE `quest_template` DROP `RequiredSourceItemCount4`;
ALTER TABLE `quest_template` DROP `RequiredSpellCast1`;
ALTER TABLE `quest_template` DROP `RequiredSpellCast2`;
ALTER TABLE `quest_template` DROP `RequiredSpellCast3`;
ALTER TABLE `quest_template` DROP `RequiredSpellCast4`;
ALTER TABLE `quest_template` DROP `DetailsEmote1`;
ALTER TABLE `quest_template` DROP `DetailsEmote2`;
ALTER TABLE `quest_template` DROP `DetailsEmote3`;
ALTER TABLE `quest_template` DROP `DetailsEmote4`;
ALTER TABLE `quest_template` DROP `DetailsEmoteDelay1`;
ALTER TABLE `quest_template` DROP `DetailsEmoteDelay2`;
ALTER TABLE `quest_template` DROP `DetailsEmoteDelay3`;
ALTER TABLE `quest_template` DROP `DetailsEmoteDelay4`;
ALTER TABLE `quest_template` DROP `EmoteOnIncomplete`;
ALTER TABLE `quest_template` DROP `EmoteOnComplete`;
ALTER TABLE `quest_template` DROP `OfferRewardEmote1`;
ALTER TABLE `quest_template` DROP `OfferRewardEmote2`;
ALTER TABLE `quest_template` DROP `OfferRewardEmote3`;
ALTER TABLE `quest_template` DROP `OfferRewardEmote4`;
ALTER TABLE `quest_template` DROP `OfferRewardEmoteDelay1`;
ALTER TABLE `quest_template` DROP `OfferRewardEmoteDelay2`;
ALTER TABLE `quest_template` DROP `OfferRewardEmoteDelay3`;
ALTER TABLE `quest_template` DROP `OfferRewardEmoteDelay4`;
ALTER TABLE `quest_template` DROP `StartScript`;
ALTER TABLE `quest_template` DROP `CompleteScript`;
ALTER TABLE `quest_template` CHANGE `Method` `QuestType` tinyint(3) unsigned;
ALTER TABLE `quest_template` CHANGE `Level` `QuestLevel` smallint(6);
ALTER TABLE `quest_template` CHANGE `ZoneOrSort` `QuestSortID` smallint(6);
ALTER TABLE `quest_template` CHANGE `SuggestedPlayers` `SuggestedGroupNum` tinyint(3) unsigned;
ALTER TABLE `quest_template` CHANGE `NextQuestIdChain` `RewardNextQuest` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardXPId` `RewardXPDifficulty` tinyint(3) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardOrRequiredMoney` `RewardMoney` int(11);
ALTER TABLE `quest_template` CHANGE `RewardMoneyMaxLevel` `RewardBonusMoney` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardSpellCast` `RewardDisplaySpell` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardHonorMultiplier` `RewardKillHonor` float;
ALTER TABLE `quest_template` CHANGE `SourceItemId` `StartItem` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `SourceItemCount` `Flags` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemId1` `RewardItem1` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemCount1` `RewardAmount1` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemId2` `RewardItem2` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemCount2` `RewardAmount2` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemId3` `RewardItem3` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemCount3` `RewardAmount3` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemId4` `RewardItem4` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardItemCount4` `RewardAmount4` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardChoiceItemCount1` `RewardChoiceItemQuantity1` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardChoiceItemCount2` `RewardChoiceItemQuantity2` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardChoiceItemCount3` `RewardChoiceItemQuantity3` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardChoiceItemCount4` `RewardChoiceItemQuantity4` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardChoiceItemCount5` `RewardChoiceItemQuantity5` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardChoiceItemCount6` `RewardChoiceItemQuantity6` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `PointMapId` `POIContinent` smallint(5) unsigned;
ALTER TABLE `quest_template` CHANGE `PointX` `POIx` float;
ALTER TABLE `quest_template` CHANGE `PointY` `POIy` float;
ALTER TABLE `quest_template` CHANGE `PointOption` `POIPriority` int(10) unsigned;
ALTER TABLE `quest_template` CHANGE `RewardFactionValueId1` `RewardFactionValue1` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueIdOverride1` `RewardFactionOverride1` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueId2` `RewardFactionValue2` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueIdOverride2` `RewardFactionOverride2` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueId3` `RewardFactionValue3` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueIdOverride3` `RewardFactionOverride3` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueId4` `RewardFactionValue4` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueIdOverride4` `RewardFactionOverride4` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueId5` `RewardFactionValue5` int(11);
ALTER TABLE `quest_template` CHANGE `RewardFactionValueIdOverride5` `RewardFactionOverride5` int(11);
ALTER TABLE `quest_template` CHANGE `Title` `LogTitle` text;
ALTER TABLE `quest_template` CHANGE `Objectives` `LogDescription` text;
ALTER TABLE `quest_template` CHANGE `Details` `QuestDescription` text;
ALTER TABLE `quest_template` CHANGE `EndText` `AreaDescription` text;
ALTER TABLE `quest_template` CHANGE `CompletedText` `QuestCompletionLog` text;
ALTER TABLE `quest_template` CHANGE `WDBVerified` `VerifiedBuild` smallint(6);
ALTER TABLE `quest_template` MODIFY `Id` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredFactionValue1` int(11);
ALTER TABLE `quest_template` MODIFY `RequiredFactionValue2` int(11);
ALTER TABLE `quest_template` MODIFY `RewardSpell` int(11);
ALTER TABLE `quest_template` MODIFY `QuestGiverPortrait` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `QuestTurnInPortrait` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardChoiceItemId1` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardChoiceItemId2` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardChoiceItemId3` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardChoiceItemId4` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardChoiceItemId5` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardChoiceItemId6` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredNpcOrGo1` int(11);
ALTER TABLE `quest_template` MODIFY `RequiredNpcOrGo2` int(11);
ALTER TABLE `quest_template` MODIFY `RequiredNpcOrGo3` int(11);
ALTER TABLE `quest_template` MODIFY `RequiredNpcOrGo4` int(11);
ALTER TABLE `quest_template` MODIFY `RequiredItemId1` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredItemId2` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredItemId3` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredItemId4` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredItemId5` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredItemId6` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredSpell` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardCurrencyCount1` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardCurrencyCount2` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardCurrencyCount3` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RewardCurrencyCount4` int(10) unsigned;
ALTER TABLE `quest_template` MODIFY `RequiredCurrencyCount4` int(10) unsigned;

ALTER TABLE `reference_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `reference_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `reference_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `reference_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `reference_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `reference_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `reference_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `reference_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `skinning_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `skinning_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `skinning_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `skinning_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `skinning_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `skinning_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `skinning_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `skinning_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `smart_scripts` MODIFY `event_phase_mask` smallint(5) unsigned;
ALTER TABLE `smart_scripts` MODIFY `event_flags` smallint(5) unsigned;

-- ALTER TABLE `spell_area` DROP `quest_start_active`;
ALTER TABLE `spell_area` CHANGE `autocast` `flags` tinyint(3) unsigned;
ALTER TABLE `spell_area` MODIFY `spell` int(10) unsigned;
ALTER TABLE `spell_area` MODIFY `area` int(10) unsigned;
ALTER TABLE `spell_area` MODIFY `quest_start` int(10) unsigned;
ALTER TABLE `spell_area` MODIFY `quest_end` int(10) unsigned;
ALTER TABLE `spell_area` MODIFY `aura_spell` int(11);
ALTER TABLE `spell_area` MODIFY `racemask` int(10) unsigned;
ALTER TABLE `spell_area` MODIFY `gender` tinyint(3) unsigned;

ALTER TABLE `spell_linked_spell` DROP `req_aura`;
ALTER TABLE `spell_linked_spell` MODIFY `spell_trigger` int(11);
ALTER TABLE `spell_linked_spell` MODIFY `spell_effect` int(11);

ALTER TABLE `spell_loot_template` ADD COLUMN `Reference` int(10) unsigned AFTER `item`;
ALTER TABLE `spell_loot_template` ADD COLUMN `QuestRequired` tinyint(1) AFTER `ChanceOrQuestChance`;
ALTER TABLE `spell_loot_template` ADD COLUMN `IsCurrency` tinyint(1) AFTER `QuestRequired`;
ALTER TABLE `spell_loot_template` ADD COLUMN `Comment` varchar(255) AFTER `maxcount`;
ALTER TABLE `spell_loot_template` CHANGE `ChanceOrQuestChance` `Chance` float;
ALTER TABLE `spell_loot_template` CHANGE `mincountOrRef` `MinCount` mediumint(8);
ALTER TABLE `spell_loot_template` MODIFY `entry` int(10) unsigned;
ALTER TABLE `spell_loot_template` MODIFY `item` int(10) unsigned;

ALTER TABLE `spell_target_position` ADD COLUMN `EffectIndex` tinyint(3) unsigned AFTER `id`;
ALTER TABLE `spell_target_position` ADD COLUMN `VerifiedBuild` smallint(6) AFTER `target_orientation`;
ALTER TABLE `spell_target_position` CHANGE `target_map` `MapID` smallint(5) unsigned;
ALTER TABLE `spell_target_position` CHANGE `target_position_x` `PositionX` float;
ALTER TABLE `spell_target_position` CHANGE `target_position_y` `PositionY` float;
ALTER TABLE `spell_target_position` CHANGE `target_position_z` `PositionZ` float;
ALTER TABLE `spell_target_position` CHANGE `target_orientation` `Orientation` float;

ALTER TABLE `waypoint_data` DROP `inverse_formation_angle`;
ALTER TABLE `waypoint_data` MODIFY `point` int(10) unsigned;
ALTER TABLE `waypoint_data` MODIFY `orientation` float;
ALTER TABLE `waypoint_data` MODIFY `action_chance` smallint(6);
ALTER TABLE `waypoint_data` MODIFY `wpguid` int(10) unsigned;

ALTER TABLE `creature_model_info` CHANGE `modelid` `DisplayID` int(10) unsigned;
ALTER TABLE `creature_model_info` CHANGE `bounding_radius` `BoundingRadius` float;
ALTER TABLE `creature_model_info` CHANGE `combat_reach` `CombatReach` float;
ALTER TABLE `creature_model_info` CHANGE `modelid_other_gender` `DisplayID_Other_Gender` int(10) unsigned;

ALTER TABLE `creature_template_addon` ADD COLUMN `cyclicSplinePathId` int(10) unsigned AFTER `waypointPathId`;
ALTER TABLE `creature_template_addon` MODIFY `VisFlags` tinyint(3) unsigned;
ALTER TABLE `creature_template_addon` MODIFY `PvPFlags` tinyint(3) unsigned;

ALTER TABLE `creature_template_addon` ADD COLUMN `cyclicSplinePathId` int(10) unsigned AFTER `waypointPathId`;

ALTER TABLE `game_event_battleground_holiday` CHANGE `bgflag` `BattlegroundID` int(10) unsigned;

ALTER TABLE `access_requirement` ADD COLUMN `heroic_exclusive` tinyint(1) AFTER `quest_failed_text`;

ALTER TABLE `archaeology_sites` CHANGE `goEntry` `GameobjectEntry` int(10) unsigned;

UPDATE `creature_template` SET `faction` = `faction_H` WHERE `faction` = 0 AND `faction_H` != 0;