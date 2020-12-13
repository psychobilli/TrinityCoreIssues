echo "* * * scan_creature_smart_scripts.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/Stored Procedures/TrinityCore Cata/scan_creature_smart_scripts.sql'
echo "* * * scan_creature_template_entry_trainer.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/Stored Procedures/TrinityCore Cata/scan_creature_template_entry_trainer.sql'
echo "* * * test_creature_template_entry_trainer.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/Stored Procedures/TrinityCore Cata/test_creature_template_entry_trainer.sql'
echo "* * * validate_creature_template_entry_trainer.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/Stored Procedures/TrinityCore Cata/validate_creature_template_entry_trainer.sql'
echo "* * * validate_gossip_menu_option_trainer.sql"
mysql -u jenkins -p'' world_cata_test -s < './Scripts/Stored Procedures/TrinityCore Cata/validate_gossip_menu_option_trainer.sql'