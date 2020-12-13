-- delete any awarded "Realm First" achievements
-- excluding those belonging to player characters
delete from character_achievement
where achievement in (457,467,466,465,464,463,
	462,461,460,459,458,1404,1405,1406,1407,1408,
	1409,1410,1411,1412,1413,1415,1414,1416,1417,
	1418,1419,1420,1421,1422,1423,1424,1425,1426,
	1427,1400,456,1402,3117,3259,4078,4576,1463)
  and guid not in
	(select guid
	 from characters.characters c
	   join auth.account a on a.id = c.account
	 where username in (
		'P',
		'B',
		'S',
		'Z'
	 )
	);