DROP PROCEDURE IF EXISTS quest_chains_recursive;
DELIMITER //
CREATE PROCEDURE quest_chains_recursive(IN questIdInput int, questChain int, branchSortId int)
BEGIN
	set @currentTestId := @currentTestId + 1;
	
	insert into testResults
    (questChain, sortOrder, questId)
	select questChain
		, branchSortId
		, ID
	from quest_template_addon qta
	where ID = questIdInput
	  and not exists (
		select 1
		from testResults
		where questId = qta.ID
	  );
	
	insert into testResults
    (questChain, sortOrder, questId)
	select questChain
		, branchSortId + 1
		, NextQuestId
	from quest_template_addon qta
	where ID = questIdInput
	  and not exists (
		select 1
		from testResults
		where questId = qta.NextQuestId
	  );
	insert into testResults
    (questChain, sortOrder, questId)
	select questChain
		, branchSortId + 1
		, ID
	from quest_template_addon qta
	where PrevQuestId = questIdInput
	  and not exists (
		select 1
		from testResults
		where questId = qta.ID
	  );
END;