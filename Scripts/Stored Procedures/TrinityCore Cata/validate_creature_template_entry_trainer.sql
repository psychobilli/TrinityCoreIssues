DROP PROCEDURE IF EXISTS validate_creature_template_entry_trainer;
DELIMITER //
CREATE PROCEDURE validate_creature_template_entry_trainer(IN entryInput int)
BEGIN
	call scan_creature_template_entry_trainer(entryInput);
	
    select * from results;
	drop temporary table results;
END //
DELIMITER ;