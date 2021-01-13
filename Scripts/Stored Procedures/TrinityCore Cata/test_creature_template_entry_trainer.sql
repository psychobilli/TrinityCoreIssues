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

            insert into testResults 
			select entryInput, message from results where test = 'failed' limit 1;
			insert into testResults
			select entryInput, 'All tests pass' from results 
			where not exists (select 1 from results where test = 'failed') limit 1;
            delete from entries where entry = entryInput;
            drop temporary table results;
        end while;
    end;

    select tr.*, concat(ct.name,' (', ct.entry, ')') as Creature
    from testResults tr join creature_template ct on ct.entry = tr.entry;
    drop temporary table testResults;
    drop temporary table entries;

END
