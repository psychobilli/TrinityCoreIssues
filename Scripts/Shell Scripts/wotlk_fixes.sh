echo "* * * 2020_02_15_04_world_COT_STRATHOLME.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2020_02_15_04_world_COT_STRATHOLME.sql'
echo "* * * 2020_02_15_05_world_COT_STRATHOLME_SPLINECHAINS.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2020_02_15_05_world_COT_STRATHOLME_SPLINECHAINS.sql'
echo "* * * 2020_07_15_01_world_335.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2020_07_15_01_world_335.sql'
echo "* * * 2020_12_13_00_GH_Vordrassil_Chain.sql"
mysql -u jenkins -p'' world_test -s < '../TrinityCore 335 Mod/sql/updates/world/3.3.5/2020_12_13_00_GH_Vordrassil_Chain.sql'