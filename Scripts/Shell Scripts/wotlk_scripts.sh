echo "* * * Trinity_Portal_Master.sql"
mysql -u jenkins -p'' world_test -s < './Scripts/Patches/Trinity_Portal_Master.sql'
echo "* * * TrinityCoreWrathChanges.sql"
mysql -u jenkins -p'' world_test -s < './Scripts/Patches/TrinityCoreWrathChanges.sql'