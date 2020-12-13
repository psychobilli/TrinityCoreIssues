mysql -u jenkins -p'' -s < ~/sql_integration/drop_create_wotlk_test.sql
mysqldump -u jenkins -p'' world > world_wotlk_backup.sql
sed -i 's/`trinity`@`localhost`/`jenkins`@`localhost`/g' '../workspace/Wotlk Mod SQL Integration/world_wotlk_backup.sql'
mysql -u jenkins -p'' world_test < world_wotlk_backup.sql