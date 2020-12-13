DROP DATABASE IF EXISTS `world_test`;

CREATE DATABASE `world_test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON `world_test`.* TO `trinity`@`localhost` WITH GRANT OPTION;