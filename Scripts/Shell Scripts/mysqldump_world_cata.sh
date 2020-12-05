mysql -u jenkins -p'' -s < ~/sql_integration/drop_create_cata_test.sql
mysqldump -u jenkins -p'' world_cata > world_cata_backup.sql
mysql -ujenkins -p'' world_cata_test < world_cata_backup.sql