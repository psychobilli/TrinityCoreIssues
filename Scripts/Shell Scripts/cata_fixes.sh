echo "* * * 2020_07_10_02_world.sql"
mysql -u jenkins -p'' world_cata_test -s < '../TrinityCore Cata Mod/sql/updates/world/4.3.4/2020_07_10_02_world.sql'
echo "* * * TrainerGossipMenuAdditions.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/TC Cata Updates/TrainerGossipMenuAdditions.sql'
echo "* * * Teldrassil Script Updates.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/TC Cata Updates/Teldrassil Script Updates.sql'