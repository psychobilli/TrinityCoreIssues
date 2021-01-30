echo "* * * TrainerGossipMenuAdditions.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/TC Cata Updates/TrainerGossipMenuAdditions.sql'
echo "* * * Teldrassil Script Updates.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/TC Cata Updates/Teldrassil Script Updates.sql'
echo "* * * 2021_01_21_01_world.sql"
mysql -u jenkins -p'' world_cata_test -s < '../TrinityCore Cata Mod/sql/updates/world/4.3.4/2021_01_21_01_world.sql'
echo "* * * 2021_01_21_02_trainer_additions_world.sql"
mysql -u jenkins -p'' world_cata_test -s < '../TrinityCore Cata Mod/sql/updates/world/4.3.4/2021_01_21_02_trainer_additions_world.sql'