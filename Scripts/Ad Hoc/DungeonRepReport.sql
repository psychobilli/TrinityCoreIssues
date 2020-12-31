select ct.entry
	, ct.name
    , c.map
    , null as RewOnKillRepValue1
    , null as RewOnKillRepValue2
    , ctd.name
--    , cord.RewOnKillRepFaction1
    , cord.RewOnKillRepValue1
--    , cord.RewOnKillRepFaction2
    , cord.RewOnKillRepValue1
from world.creature_template ct
  join world.creature_template ctd on ctd.entry = ct.difficulty_entry_1
  join world.creature_onkill_reputation cord on cord.creature_id = ctd.entry
  left join (
	select distinct id
		, map
	from world.creature
  ) c on c.id = ct.entry
where (exists (
	select 1
    from world.creature
    where map in (575,578,595,602)
      and id = ct.entry
  ) or ct.name like '%Svala%Sorrow%'
    or ct.name like '%Phantasmal%'
    or ct.name like '%Ritual%Channel%'
    or ct.name like '%Ferocious%Rhino%'
    or ct.name like '%Frenzied%Worgen%'
    or ct.name like '%Jormungar%Worm%'
    or ct.name like '%Massive%Jormungar%'
    or ct.name like '%Ravenous%Furbolg%'
    or ct.name like '%Ymirjar%Harpooner%'
    or ct.name like '%Ymirjar%Warrior%'
    or ct.name like '%Ymirjar%Witch%Doctor%'
    or ct.name like '%Avenging%Spirit%')
  and not exists (
	select 1
    from world.creature_onkill_reputation
    where creature_id = ct.entry
  )
union
select ct.entry
	, ct.name
    , c.map
    , cor.RewOnKillRepValue1
    , cor.RewOnKillRepValue2
    , ctd.name
--    , cord.RewOnKillRepFaction1
    , cord.RewOnKillRepValue1
--    , cord.RewOnKillRepFaction2
    , cord.RewOnKillRepValue1
from world.creature_template ct
  join world.creature_onkill_reputation cor on cor.creature_id = ct.entry
  join world.creature_template ctd on ctd.entry = ct.difficulty_entry_1
  join world.creature_onkill_reputation cord on cord.creature_id = ctd.entry
  left join (
	select distinct id
		, map
	from world.creature
  ) c on c.id = ct.entry
where (exists (
	select 1
    from world.creature
    where map in (575,578,595,602)
      and id = ct.entry
  ) or ct.name like '%Svala%Sorrow%'
    or ct.name like '%Phantasmal%'
    or ct.name like '%Ritual%Channel%'
    or ct.name like '%Ferocious%Rhino%'
    or ct.name like '%Frenzied%Worgen%'
    or ct.name like '%Jormungar%Worm%'
    or ct.name like '%Massive%Jormungar%'
    or ct.name like '%Ravenous%Furbolg%'
    or ct.name like '%Ymirjar%Harpooner%'
    or ct.name like '%Ymirjar%Warrior%'
    or ct.name like '%Ymirjar%Witch%Doctor%'
    or ct.name like '%Avenging%Spirit%');