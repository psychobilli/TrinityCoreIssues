DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_dupp_table`(schemaName VARCHAR(1000)
	, tableName VARCHAR(1000)
    , optionalSuffix VARCHAR(100))
BEGIN

	IF (optionalSuffix = '' or optionalSuffix is null)
    THEN
		set optionalSuffix = 'Temp';
	END IF;

	set @tmp := concat('DROP TABLE IF EXISTS ',schemaName,'.',tablename,optionalSuffix,';');
    prepare s1 from @tmp;
    execute s1;
    
	set @tmp  := concat('CREATE TABLE ',schemaName,'.',tableName,optionalSuffix,' (');
	set @i := 0;

	while @i < (select count(*) 
				from information_schema.columns
				where table_schema = schemaName
				  and  table_name = tableName)
		DO
		set @i := @i + 1;
		
		set @tmp := concat(@tmp,
		(select concat(case when ordinal_position = 1
					then column_name
					else concat(',',column_Name)
				end
			, concat(' ',data_type)
			, case when character_maximum_length is not null
					and data_type not like '%text%'
				then concat('(',character_maximum_length,')')
				else ''
			  end)
		from information_schema.columns
		where table_schema = schemaName
		  and table_name = tableName
		  and ordinal_position = @i));
	end while;
    
    set @tmp = concat(@tmp,')');
    
    prepare s1 from @tmp;
    execute s1;
END$$
DELIMITER ;
