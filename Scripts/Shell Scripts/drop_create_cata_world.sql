DROP DATABASE IF EXISTS `world_cata`;

CREATE DATABASE `world_cata` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL PRIVILEGES ON `world_cata`.* TO `trinity`@`localhost` WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `world_cata`.* TO `jenkins`@`localhost` WITH GRANT OPTION;