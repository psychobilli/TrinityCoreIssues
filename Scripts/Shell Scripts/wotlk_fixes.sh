echo "* * * 2020_07_15_01_world_335.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2020_07_15_01_world_335.sql'
echo "* * * 2020_12_13_00_GH_Vordrassil_Chain.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2020_12_13_00_GH_Vordrassil_Chain.sql'
echo "* * * 2020_12_30_dungeon_rep.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2020_12_30_dungeon_rep.sql'
echo "* * * 2021_01_01_00_hodir_quests.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2021_01_01_00_hodir_quests.sql'