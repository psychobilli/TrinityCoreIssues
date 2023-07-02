DROP PROCEDURE IF EXISTS vanilla_loremaster_assistant;
DELIMITER //
CREATE PROCEDURE vanilla_loremaster_assistant()
BEGIN
	create temporary table if not exists questFactionResults (Faction varchar(250), FactionId int, questId int);
	insert into questFactionResults
	select case when (RequiredRaces & 1 != 0
			  or RequiredRaces & 4 != 0
			  or RequiredRaces & 8 != 0
			  or RequiredRaces & 64 != 0)
		 and (RequiredRaces & 2 = 0
			  and RequiredRaces & 16 = 0
			  and RequiredRaces & 32 = 0
			  and RequiredRaces & 128 = 0)
		then 'Alliance'
		when (RequiredRaces & 2 != 0
			  or RequiredRaces & 16 != 0
			  or RequiredRaces & 32 != 0
			  or RequiredRaces & 128 != 0)
		 and (RequiredRaces & 1 = 0
			  and RequiredRaces & 4 = 0
			  and RequiredRaces & 8 = 0
			  and RequiredRaces & 64 = 0)
		then 'Horde'
		else 'Both'
	end as Faction
		, case when (RequiredRaces & 1 != 0
			  or RequiredRaces & 4 != 0
			  or RequiredRaces & 8 != 0
			  or RequiredRaces & 64 != 0)
		 and (RequiredRaces & 2 = 0
			  and RequiredRaces & 16 = 0
			  and RequiredRaces & 32 = 0
			  and RequiredRaces & 128 = 0)
		then 1
		when (RequiredRaces & 2 != 0
			  or RequiredRaces & 16 != 0
			  or RequiredRaces & 32 != 0
			  or RequiredRaces & 128 != 0)
		 and (RequiredRaces & 1 = 0
			  and RequiredRaces & 4 = 0
			  and RequiredRaces & 8 = 0
			  and RequiredRaces & 64 = 0)
		then 0
		else 2
	end as FactionId
		, entry
    from zero_world.quest_template qt
    where not exists (
		select 1
        from questFactionResults
        where questId = qt.entry
    );
    
    update questFactionResults qfr
      join zero_world.quest_template qt on qt.entry = qfr.questId
      join zero_world.quest_relations qrStart on qrStart.quest = qt.entry
	  left join zero_world.creature_template ctStart on ctStart.entry = qrStart.entry
    set qfr.Faction = case when ctStart.FactionAlliance in 
		(11,12,53,55,56,57,64,79,80,84,88,96,122,123,124,150,210,371,534,694,874,894,1075,1076,1077,1078,1096,1216,1217,1334,1514,1575,1577,1599,1600,1618)
			then 'Alliance'
			when ctStart.FactionHorde in 
            (5,21,28,29,68,71,83,85,98,104,105,106,118,125,126,412,714,995,1074,1154,1174,1214,1215,1335,1494,1515,1598,1612,1619)
			then 'Horde'
			else 'Both'
		end
		, qfr.FactionId = case when ctStart.FactionAlliance in 
		(11,12,53,55,56,57,64,79,80,84,88,96,122,123,124,150,210,371,534,694,874,894,1075,1076,1077,1078,1096,1216,1217,1334,1514,1575,1577,1599,1600,1618)
			then 1
			when ctStart.FactionHorde in 
            (5,21,28,29,68,71,83,85,98,104,105,106,118,125,126,412,714,995,1074,1154,1174,1214,1215,1335,1494,1515,1598,1612,1619)
			then 0
			else 2
		end
	where qfr.FactionId = 2
      and qrStart.actor = 0;
      
    update questFactionResults qfr
      join zero_world.quest_template qt on qt.entry = qfr.questId
	  join zero_world.quest_relations qrEnd on qrEnd.quest = qt.entry
	  left join zero_world.creature_template ctEnd on ctEnd.entry = qrEnd.entry
    set qfr.Faction = case when ctEnd.FactionAlliance in 
		(11,12,53,55,56,57,64,79,80,84,88,96,122,123,124,150,210,371,534,694,874,894,1075,1076,1077,1078,1096,1216,1217,1334,1514,1575,1577,1599,1600,1618)
			then 'Alliance'
			when ctEnd.FactionHorde in 
            (5,21,28,29,68,71,83,85,98,104,105,106,118,125,126,412,714,995,1074,1154,1174,1214,1215,1335,1494,1515,1598,1612,1619)
			then 'Horde'
			else 'Both'
		end
		, qfr.FactionId = case when ctEnd.FactionAlliance in 
		(11,12,53,55,56,57,64,79,80,84,88,96,122,123,124,150,210,371,534,694,874,894,1075,1076,1077,1078,1096,1216,1217,1334,1514,1575,1577,1599,1600,1618)
			then 1
			when ctEnd.FactionHorde in 
            (5,21,28,29,68,71,83,85,98,104,105,106,118,125,126,412,714,995,1074,1154,1174,1214,1215,1335,1494,1515,1598,1612,1619)
			then 0
			else 2
		end
	where qfr.FactionId = 2
      and qrEnd.actor = 0;
        
    select qt.entry
		, qt.QuestLevel
		, qt.title
		, z.AreaName
		, z.ZoneOrder
		, qfr.Faction
		, ifnull(ds.completeCount, 0) as DeathSqaud
		, ifnull(ef.completeCount, 0) as EliteForce
	from zero_world.quest_template qt
	  join questFactionResults qfr on qfr.questId = qt.entry
	  left join (
		select quest
			, count(rewarded) as completeCount
		from zero_character.character_queststatus
		where guid between 1 and 5
		group by quest
	  ) ds on ds.quest = qt.entry
	  left join (
		select quest
			, count(rewarded) as completeCount
		from zero_character.character_queststatus
		where guid between 6 and 10
		group by quest
	  ) ef on ef.quest = qt.entry
	  left join ( 
		select 1 as ZoneOrder, 0 as Continent,1537 as ID, 'Ironforge' as AreaName union
		select 2 as ZoneOrder, 0 as Continent,1519 as ID, 'Stormwind City' as AreaName union
		select 3 as ZoneOrder, 0 as Continent,1497 as ID, 'Undercity' as AreaName union
		select 4 as ZoneOrder, 0 as Continent,132 as ID, 'Coldridge Valley' as AreaName union
		select 5 as ZoneOrder, 0 as Continent,1 as ID, 'Dun Morogh' as AreaName union
		select 6 as ZoneOrder, 0 as Continent,269 as ID, 'Dun Algaz' as AreaName union
		select 7 as ZoneOrder, 0 as Continent,9 as ID, 'Northshire Valley' as AreaName union
		select 8 as ZoneOrder, 0 as Continent,12 as ID, 'Elwynn Forest' as AreaName union
		select 9 as ZoneOrder, 0 as Continent,154 as ID, 'Deathknell' as AreaName union
		select 10 as ZoneOrder, 0 as Continent,85 as ID, 'Tirisfal Glades' as AreaName union
		select 11 as ZoneOrder, 0 as Continent,38 as ID, 'Loch Modan' as AreaName union
		select 12 as ZoneOrder, 0 as Continent,40 as ID, 'Westfall' as AreaName union
		select 13 as ZoneOrder, 0 as Continent,44 as ID, 'Redridge Mountains' as AreaName union
		select 14 as ZoneOrder, 0 as Continent,130 as ID, 'Silverpine Forest' as AreaName union
		select 15 as ZoneOrder, 0 as Continent,170 as ID, 'Lordamere Lake' as AreaName union
		select 16 as ZoneOrder, 0 as Continent,11 as ID, 'Wetlands' as AreaName union
		select 17 as ZoneOrder, 0 as Continent,330 as ID, 'Thandol Span' as AreaName union
		select 18 as ZoneOrder, 0 as Continent,10 as ID, 'Duskwood' as AreaName union
		select 19 as ZoneOrder, 0 as Continent,267 as ID, 'Hillsbrad Foothills' as AreaName union
		select 20 as ZoneOrder, 0 as Continent,33 as ID, 'Stranglethorn Vale' as AreaName union
		select 21 as ZoneOrder, 0 as Continent,36 as ID, 'Alterac Mountains' as AreaName union
		select 22 as ZoneOrder, 0 as Continent,293 as ID, 'Thoradin’s Wall' as AreaName union
		select 23 as ZoneOrder, 0 as Continent,45 as ID, 'Arathi Highlands' as AreaName union
		select 24 as ZoneOrder, 0 as Continent,8 as ID, 'Swamp of Sorrows' as AreaName union
		select 25 as ZoneOrder, 0 as Continent,3 as ID, 'Badlands' as AreaName union
		select 26 as ZoneOrder, 0 as Continent,51 as ID, 'Searing Gorge' as AreaName union
		select 27 as ZoneOrder, 0 as Continent,47 as ID, 'The Hinterlands' as AreaName union
		select 28 as ZoneOrder, 0 as Continent,28 as ID, 'Western Plaguelands' as AreaName union
		select 29 as ZoneOrder, 0 as Continent,139 as ID, 'Eastern Plaguelands' as AreaName union
		select 30 as ZoneOrder, 0 as Continent,4 as ID, 'Blasted Lands' as AreaName union
		select 31 as ZoneOrder, 0 as Continent,46 as ID, 'Burning Steppes' as AreaName union
		select 32 as ZoneOrder, 0 as Continent,25 as ID, 'Blackrock Mountain' as AreaName union
		select 33 as ZoneOrder, 0 as Continent,41 as ID, 'Deadwind Pass' as AreaName union
		select 34 as ZoneOrder, 0 as Continent,1477 as ID, 'The Temple of Atal’Hakkar' as AreaName union
		select 35 as ZoneOrder, 0 as Continent,1583 as ID, 'Blackrock Spire' as AreaName union
		select 36 as ZoneOrder, 0 as Continent,1584 as ID, 'Blackrock Depths' as AreaName union
		select 37 as ZoneOrder, 0 as Continent,214 as ID, 'The Great Sea' as AreaName union
		select 38 as ZoneOrder, 0 as Continent,308 as ID, 'The Forbidding Sea' as AreaName union
		select 39 as ZoneOrder, 1 as Continent,1637 as ID, 'Orgrimmar' as AreaName union
		select 40 as ZoneOrder, 1 as Continent,1638 as ID, 'Thunder Bluff' as AreaName union
		select 41 as ZoneOrder, 1 as Continent,1657 as ID, 'Darnassus' as AreaName union
		select 42 as ZoneOrder, 1 as Continent,363 as ID, 'Valley of Trials' as AreaName union
		select 43 as ZoneOrder, 1 as Continent,14 as ID, 'Durotar' as AreaName union
		select 44 as ZoneOrder, 1 as Continent,220 as ID, 'Red Cloud Mesa' as AreaName union
		select 45 as ZoneOrder, 1 as Continent,215 as ID, 'Mulgore' as AreaName union
		select 46 as ZoneOrder, 1 as Continent,188 as ID, 'Shadowglen' as AreaName union
		select 47 as ZoneOrder, 1 as Continent,141 as ID, 'Teldrassil' as AreaName union
		select 48 as ZoneOrder, 1 as Continent,377 as ID, 'Southfury River' as AreaName union
		select 49 as ZoneOrder, 1 as Continent,17 as ID, 'The Barrens' as AreaName union
		select 50 as ZoneOrder, 1 as Continent,148 as ID, 'Darkshore' as AreaName union
		select 51 as ZoneOrder, 1 as Continent,406 as ID, 'Stonetalon Mountains' as AreaName union
		select 52 as ZoneOrder, 1 as Continent,331 as ID, 'Ashenvale' as AreaName union
		select 53 as ZoneOrder, 1 as Continent,400 as ID, 'Thousand Needles' as AreaName union
		select 54 as ZoneOrder, 1 as Continent,405 as ID, 'Desolace' as AreaName union
		select 55 as ZoneOrder, 1 as Continent,15 as ID, 'Dustwallow Marsh' as AreaName union
		select 56 as ZoneOrder, 1 as Continent,440 as ID, 'Tanaris' as AreaName union
		select 57 as ZoneOrder, 1 as Continent,357 as ID, 'Feralas' as AreaName union
		select 58 as ZoneOrder, 1 as Continent,16 as ID, 'Azshara' as AreaName union
		select 59 as ZoneOrder, 1 as Continent,361 as ID, 'Felwood' as AreaName union
		select 60 as ZoneOrder, 1 as Continent,490 as ID, 'Un’Goro Crater' as AreaName union
		select 61 as ZoneOrder, 1 as Continent,493 as ID, 'Moonglade' as AreaName union
		select 62 as ZoneOrder, 1 as Continent,618 as ID, 'Winterspring' as AreaName union
		select 63 as ZoneOrder, 1 as Continent,1377 as ID, 'Silithus' as AreaName union
		select 64 as ZoneOrder, 1 as Continent,3478 as ID, 'Gates of Ahn’Qiraj' as AreaName union
		select 65 as ZoneOrder, 1 as Continent,332 as ID, 'The Great Sea' as AreaName union
		select 66 as ZoneOrder, 1 as Continent,457 as ID, 'The Veiled Sea' as AreaName union
		select 67 as ZoneOrder, 36 as Continent,207 as ID, 'The Great Sea' as AreaName union
		select 68 as ZoneOrder, 0 as Continent,0 as ID, 'Undefined' as AreaName
	  ) z on z.ID = qt.ZoneOrSort or z.ID = 0
	where (qfr.FactionId = 1 and ifnull(ef.completecount, 0) < 5)
		 or (qfr.FactionId = 0 and ifnull(ds.completecount, 0) < 5)
		 or (qfr.FactionId = 2 and (ifnull(ds.completecount, 0) < 5
				or ifnull(ef.completecount, 0) < 5))
	-- and ZoneOrder > 38
	order by z.ZoneOrder
		, qt.QuestLevel;
END;
