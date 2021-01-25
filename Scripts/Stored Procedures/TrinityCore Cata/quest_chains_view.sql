DROP PROCEDURE IF EXISTS quest_chains_view;
DELIMITER //
CREATE PROCEDURE quest_chains_view(IN questIdInput int)
BEGIN
	declare questChain int default 0;
    declare sortId int default 0;
    SET @@SESSION.max_sp_recursion_depth = 10;
    
	set @currentTestId := 0;
    create temporary table if not exists quests (id int);
    create temporary table if not exists testResults (testId int auto_increment, questChain int, sortOrder int, questId int, primary key (testId));

    insert into quests select questIdInput;
	begin
        while (select count(*) from quests) > 0
        do
			set questIdInput := (select id from quests limit 1);
			call quest_chains_recursive(questIdInput, questChain, sortId);
			begin
				while (@currentTestId < (select max(testId) from testResults))
				do
					set sortId := sortId + 1;
					set questIdInput := (select questId from testResults where testId = @currentTestId);
					
					call quest_chains_recursive(questIdInput, questChain, sortId);
				end while;
			end;
            set questChain := questChain + 1;
            delete from quests where id = (select id from quests limit 1);
		end while;
	end;
	
	select qt.Id, QuestLevel, LogTitle, QuestSortId, PrevQuestID, NextQuestID, tr.questChain, tr.sortOrder
	from testResults tr
      join quest_template qt on qt.Id = tr.questId
	  join quest_template_addon qta on qta.ID = qt.ID
	order by tr.questChain, tr.sortOrder;
      
    drop temporary table testResults;
    drop temporary table quests;

END;