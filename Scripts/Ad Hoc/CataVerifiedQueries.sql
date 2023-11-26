-- Total time for Emucoach.
select name
	, totalTime
	, days
    , hours - (days * 24) as hours
    , minutes - (hours * 60) as minutes
    , minutesFrac as seconds
    , level + (xp / xp_for_next_level) as level
    , money
    , gold
    , silver - gold * 100 as silver
    , money - silver * 100 as copper
    , qu.QuestCount
from (
	select guid
		, name
        , account
		, totaltime
		, ((totaltime div 60) div 60) div 24 as days
		, (totaltime div 60) div 60 as hours
		, totaltime div 60 as minutes
		, totaltime mod 60 as minutesFrac
        , c.level
        , c.xp
        , xp.xp_for_next_level
		, money as money
		, money div 10000 as gold
		, money div 100 as silver
	from emucoach_char_cata.characters c
      join emucoach_world_cata.player_xp_for_level xp on xp.lvl = c.level
) c
  join (
	select count(*) as QuestCount
		, guid
	from emucoach_char_cata.character_queststatus_rewarded
	group by guid
  ) qu on qu.guid = c.guid
where c.account in (15,16,17,18);