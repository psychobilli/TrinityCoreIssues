DROP PROCEDURE IF EXISTS test_creature_template_entry_trainer;
DELIMITER //
CREATE PROCEDURE test_creature_template_entry_trainer(IN entryInput int)
BEGIN
    create temporary table if not exists entries (entry int);
    create temporary table if not exists testResults (entry int, result text);

    insert into entries select entryInput;

    begin
        while (select count(*) from entries) > 0 do
            set entryInput := (select entry from entries limit 1);

            call scan_creature_template_entry_trainer(entryInput);

            set @fail := (select case when count(*) > 0 then 0 else -1 end from results where item = 1 and keyfield = entryInput);
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else -1 end from results
                            where item = 1 and keyfield > 0 and message like '%creature world%');
			set @fail := (select case when @fail != 0 then @fail when keyfield > 0 then 0 else -2 end from results
							where item = 1 and message like '%creature_trainer records%');
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 2 and details like '%true%');
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 3 and details is not null);
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 4 and keyfield > 0);
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 5 and keyfield > 0);
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 6 and keyfield > 0);
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 6 and keyfield > 0 and length(details) < 20);
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 7 and keyfield > 0 and length(details) > 19);
            set @fail := (select case when @fail != 0 then @fail when count(*) > 0 then 0 else 1 end from results
                            where item = 8);

            insert into testResults select entryInput,
            case when @fail = 0 then 'All tests pass'
            when @fail = -1 then concat('Creature not in world ', entryInput)
			when @fail = -2 then 'Creature missing creature_trainer record'
            else concat('Test failure for ',entryInput) end as result;
            delete from entries where entry = entryInput;
            drop temporary table results;
        end while;
    end;

    select tr.*, concat(ct.name,' (', ct.entry, ')') as Creature
    from testResults tr join creature_template ct on ct.entry = tr.entry;
    drop temporary table testResults;
    drop temporary table entries;

END
