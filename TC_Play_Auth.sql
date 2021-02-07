-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: auth
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `salt` binary(32) NOT NULL,
  `verifier` binary(32) NOT NULL,
  `session_key_auth` binary(40) DEFAULT NULL,
  `session_key_bnet` varbinary(64) DEFAULT NULL,
  `totp_secret` varbinary(128) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT 0,
  `locked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `mutetime` bigint(20) NOT NULL DEFAULT 0,
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'P','˘z(∏l+ÄHt--^G@Àn›ˆù»g«.$ë\rıØ','ù`ª›· ñÍ|fVL,¶£¶®“π‡§ë®ìÁGŸdºÕA','j¢\níÂ¶ˇ€BCˆ◊Â‡ıÎ±që„BDeìyôﬂF`^xç\",',NULL,NULL,'','','2017-10-23 03:38:46','10.0.0.144','10.0.0.144',0,0,'00','2021-02-07 14:55:39',0,2,0,'','',0,'Win',0),(2,'B','µΩ êA WC0\rúÜ6åûé+ˇ˜å›ûÜ`îHëÏ™','Ès?tJUpb…zÊ´&&…NLûo5rñ•\r¿÷˙Ág','ïy=#\"˛|‡f˝bs?˘m›«ÅØ[SÛ	&B?ûª4πSH©È{“µ',NULL,NULL,'','','2017-10-23 11:06:09','10.0.0.144','10.0.0.144',0,0,'00','2021-02-07 14:55:40',0,2,0,'','',0,'Win',0),(3,'S','mg]ﬁf€˙∏˜(˛ã5J‡œ,ÿ≤”T\nó‹tQúŸ','m9D8≈œJ)&≠ØÜˆ:ì$≤€Ævi\'Á∫∆ã«a','fGeäza	Å~Ì˝„†Ââ¨Õ:41˘‹à_w5ß\n™S¸ºù',NULL,NULL,'','','2017-10-23 11:06:16','10.0.0.144','10.0.0.144',0,0,'00','2021-02-07 14:57:36',0,2,0,'','',0,'Win',0),(4,'Z','—dµ±å]t9Í2”phh,séÃ@Â“ªπ◊C•','ﬂ†£´Wﬂô⁄{<(M•Û¸íß(É—µ“âG’€•‚%','/T‘˛3Îzº–‰0|¢3ÓÜ„òRÄÆ·*±›9Ÿ$ä![&µ\nù∫',NULL,NULL,'','','2017-10-23 11:06:23','10.0.0.144','10.0.0.144',0,0,'00','2021-02-07 14:57:37',0,2,0,'','',0,'Win',0),(8,'ADMIN','ÔVÄc∑‘∫RÖ˘,:Mﬂ÷2a≥p3ç0vÏ|í¸–alù‚','\"æüo}¥ÉÌa5v?%\rr)ãä◊5>†â≠|tÛY','¸$/—9¬n¨To_pÎh\r˚re±€∞_BæA Ä8	°K)—œÖÄ',NULL,NULL,'','','2018-02-10 05:06:45','127.0.0.1','127.0.0.1',0,0,'00','2021-01-10 14:59:53',0,2,0,'','',0,'Win',0),(9,'AHBOT','èX∆éZ]2´HxoªoèU¯ë4 ˜e†π*¬º∂','§√FyÄµ˜Á\r¥{ËpÂ–ÏG9MÍõvÔxBW:Lâ#',NULL,NULL,NULL,'','','2018-02-19 06:51:56','127.0.0.1','127.0.0.1',0,0,'00','2018-07-24 07:24:35',0,2,0,'','',0,'Win',0),(10,'ALT','sÍ(=4∏\\®é∞oË/ÿe]œıÙ∏üﬁG›˜','õªÎ´∂:ILÊ?Ítí¡Íp\ZÅMÄÄ(@\ZJ’Â‰üu','˜ºí∆Óï{\"ocRU<lms2ß≥÷∫ﬁ⁄2÷7Î˛ºÆX Øƒ∏…ûe«∂',NULL,NULL,'','','2018-06-17 15:35:11','10.0.0.144','10.0.0.144',0,0,'00','2021-01-04 04:51:28',0,2,0,'','',0,'Win',0),(11,'LOVE','·tmù^UPj∂N∆`Õ˝Û7*lQ∫Ÿvê/ä','∫áßDñ©p.≠.„aÄÉ°òò>_\"Ö}«ÿ¶ö±ÄÜ\ng',NULL,NULL,NULL,'','','2020-07-23 14:51:34','10.0.0.144','10.0.0.144',0,0,'00','2020-07-24 02:36:57',0,2,0,'','',0,'Win',0),(12,'WINTER','Âæ!.è‹‹¯)®Ø˛-íh(¶$ÿQõÕØXx—·xé∆','Ì·KËC”h∑ö©oœ{ö·∏˜cÚD4ãS˙∫û',NULL,NULL,NULL,'','','2020-07-23 15:02:16','127.0.0.1','127.0.0.1',0,0,'00',NULL,0,2,0,'','',0,'',0),(13,'NOBLE','e∆Kæh≠ºV£VÄ=V*‰ﬁHäRà›UÃåÚ’M»','¬—∑ˇ∑4z’®òã£‹m€.ÕJÌ∑Mía|Á˚©p',NULL,NULL,NULL,'','','2020-08-02 04:39:59','10.0.0.144','10.0.0.144',0,0,'00','2020-08-02 04:59:21',0,2,0,'','',0,'Win',0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_access`
--

DROP TABLE IF EXISTS `account_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_access` (
  `AccountID` int(10) unsigned NOT NULL,
  `SecurityLevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT -1,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_access`
--

LOCK TABLES `account_access` WRITE;
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
INSERT INTO `account_access` VALUES (1,3,1,NULL),(1,3,2,NULL),(2,3,1,NULL),(2,3,2,NULL),(3,3,1,NULL),(3,3,2,NULL),(4,3,1,NULL),(4,3,2,NULL),(8,3,1,NULL),(8,3,2,NULL),(11,3,-1,NULL),(13,3,-1,NULL);
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_accesstemp`
--

DROP TABLE IF EXISTS `account_accesstemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_accesstemp` (
  `id` int(11) DEFAULT NULL,
  `gmlevel` tinyint(4) DEFAULT NULL,
  `RealmID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_accesstemp`
--

LOCK TABLES `account_accesstemp` WRITE;
/*!40000 ALTER TABLE `account_accesstemp` DISABLE KEYS */;
INSERT INTO `account_accesstemp` VALUES (607,3,-1),(608,3,-1),(609,3,-1),(610,3,-1);
/*!40000 ALTER TABLE `account_accesstemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT 0,
  `unbandate` int(10) unsigned NOT NULL DEFAULT 0,
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_banned`
--

LOCK TABLES `account_banned` WRITE;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_muted`
--

DROP TABLE IF EXISTS `account_muted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_muted` (
  `guid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `mutedate` int(10) unsigned NOT NULL DEFAULT 0,
  `mutetime` int(10) unsigned NOT NULL DEFAULT 0,
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mute List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_muted`
--

LOCK TABLES `account_muted` WRITE;
/*!40000 ALTER TABLE `account_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_muted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttemp`
--

DROP TABLE IF EXISTS `accounttemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounttemp` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `sha_pass_hash` varchar(40) DEFAULT NULL,
  `sessionkey` varchar(80) DEFAULT NULL,
  `v` varchar(64) DEFAULT NULL,
  `s` varchar(64) DEFAULT NULL,
  `token_key` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `reg_mail` varchar(255) DEFAULT NULL,
  `joindate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_ip` varchar(15) DEFAULT NULL,
  `last_attempt_ip` varchar(15) DEFAULT NULL,
  `failed_logins` int(11) DEFAULT NULL,
  `locked` tinyint(4) DEFAULT NULL,
  `lock_country` varchar(2) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(4) DEFAULT NULL,
  `expansion` tinyint(4) DEFAULT NULL,
  `mutetime` bigint(20) DEFAULT NULL,
  `mutereason` varchar(255) DEFAULT NULL,
  `muteby` varchar(50) DEFAULT NULL,
  `locale` tinyint(4) DEFAULT NULL,
  `os` varchar(3) DEFAULT NULL,
  `recruiter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttemp`
--

LOCK TABLES `accounttemp` WRITE;
/*!40000 ALTER TABLE `accounttemp` DISABLE KEYS */;
INSERT INTO `accounttemp` VALUES (607,'P','78BFA7AB1CCC12C88FCD1D5A8E878C5DC26F5674','5F022CAB157C9C608D74AD1625EF105421320B644BE6165C6AF36D5235F0F7E04CBD203A80244766','41CDBC64D947E793A891A4E0B9D2A8A6A3A62C4C56667CEA96CAE1DDBB01609D','AFF50D911C242EC767C89DF614DD6ECB40475E2D2D1C7448802B6C18B8287AF9','','','','2017-10-23 03:38:46','127.0.0.1','127.0.0.1',0,0,'00','2018-02-10 00:42:50',0,2,0,'','',0,'Win',0),(608,'B','90A0191734E1C6D03ACA27DDC494AA1402B23599','01F30F24598D775F5DA08A128C8FDA3BB050BB68D0753BBCC3F2121A87E25E4CF1679A4C829FD93C','67E7FAD6C00C0DA59672356F049E4C4EC92626AB14E67AC96270554A743F73E9','AAEC9148941960869EDD8CF7FF2B8E9E8C1D36869C0D30435720114190CABDB5','','','','2017-10-23 11:06:09','127.0.0.1','127.0.0.1',0,0,'00','2018-02-10 00:42:48',0,2,0,'','',0,'Win',0),(609,'S','6D796BCCDC734099FBF64166481D3CE515BD1104','CE3A2F2FC8C53F21D02429DBA727A48A6F2AE3C078D50E3277F69F1ECED0C7C60E341B06D71FEBAB','0E61C78BC618BAE727697F76AEDBB224933AF61786AFAD26294ACFC53844396D','D99C51740FDC970A54D31414B2D8072CCFE04A358BFE28F7B8FADB66DE5D676D','','','','2017-10-23 11:06:16','127.0.0.1','127.0.0.1',0,0,'00','2018-02-10 00:43:56',0,2,0,'','',0,'Win',0),(610,'Z','C22244198DC883BF35C0FA296106688883FC9B11','4B2A2F3C912D4BC63406E5C09951CDAF6847B94BD314796001E8A2D89D69FC4C81D9168B1893F88F','25E2A5DBD54789D2B5D18328A70192FCF3A54D04283C7BDA99DF1B57ABA3A0DF','A54318D7B91EBBD2E5401707CC8E732C686870D332EA39745D088CB1F0B564D1','','','','2017-10-23 11:06:23','127.0.0.1','127.0.0.1',0,0,'00','2018-02-10 00:43:57',0,2,0,'','',0,'Win',0);
/*!40000 ALTER TABLE `accounttemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobroadcast`
--

DROP TABLE IF EXISTS `autobroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT -1,
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT 1,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobroadcast`
--

LOCK TABLES `autobroadcast` WRITE;
/*!40000 ALTER TABLE `autobroadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_info`
--

DROP TABLE IF EXISTS `build_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_info` (
  `build` int(11) NOT NULL,
  `majorVersion` int(11) DEFAULT NULL,
  `minorVersion` int(11) DEFAULT NULL,
  `bugfixVersion` int(11) DEFAULT NULL,
  `hotfixVersion` char(3) DEFAULT NULL,
  `winAuthSeed` varchar(32) DEFAULT NULL,
  `win64AuthSeed` varchar(32) DEFAULT NULL,
  `mac64AuthSeed` varchar(32) DEFAULT NULL,
  `winChecksumSeed` varchar(40) DEFAULT NULL,
  `macChecksumSeed` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_info`
--

LOCK TABLES `build_info` WRITE;
/*!40000 ALTER TABLE `build_info` DISABLE KEYS */;
INSERT INTO `build_info` VALUES (5875,1,12,1,NULL,NULL,NULL,NULL,'95EDB27C7823B363CBDDAB56A392E7CB73FCCA20','8D173CC381961EEBABF336F5E6675B101BB513E5'),(6005,1,12,2,NULL,NULL,NULL,NULL,NULL,NULL),(6141,1,12,3,NULL,NULL,NULL,NULL,NULL,NULL),(8606,2,4,3,NULL,NULL,NULL,NULL,'319AFAA3F2559682F9FF658BE01456255F456FB1','D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),(9947,3,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(10505,3,2,2,'a',NULL,NULL,NULL,NULL,NULL),(11159,3,3,0,'a',NULL,NULL,NULL,NULL,NULL),(11403,3,3,2,NULL,NULL,NULL,NULL,NULL,NULL),(11723,3,3,3,'a',NULL,NULL,NULL,NULL,NULL),(12340,3,3,5,'a',NULL,NULL,NULL,'CDCBBD5188315E6B4D19449D492DBCFAF156A347','B706D13FF2F4018839729461E3F8A0E2B5FDC034'),(13623,4,0,6,'a',NULL,NULL,NULL,NULL,NULL),(13930,3,3,5,'a',NULL,NULL,NULL,NULL,NULL),(14545,4,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(15595,4,3,4,NULL,NULL,NULL,NULL,NULL,NULL),(19116,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(19243,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(19342,6,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(19702,6,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(19802,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(19831,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(19865,6,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(20182,6,2,0,'a',NULL,NULL,NULL,NULL,NULL),(20201,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),(20216,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),(20253,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),(20338,6,2,0,NULL,NULL,NULL,NULL,NULL,NULL),(20444,6,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(20490,6,2,2,'a',NULL,NULL,NULL,NULL,NULL),(20574,6,2,2,'a',NULL,NULL,NULL,NULL,NULL),(20726,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),(20779,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),(20886,6,2,3,NULL,NULL,NULL,NULL,NULL,NULL),(21355,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),(21463,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),(21742,6,2,4,NULL,NULL,NULL,NULL,NULL,NULL),(22248,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22293,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22345,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22410,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22423,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22498,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22522,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22566,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22594,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22624,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22747,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22810,7,0,3,NULL,NULL,NULL,NULL,NULL,NULL),(22900,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(22908,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(22950,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(22995,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(22996,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(23171,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(23222,7,1,0,NULL,NULL,NULL,NULL,NULL,NULL),(23360,7,1,5,NULL,NULL,NULL,NULL,NULL,NULL),(23420,7,1,5,NULL,NULL,NULL,NULL,NULL,NULL),(23911,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),(23937,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),(24015,7,2,0,NULL,NULL,NULL,NULL,NULL,NULL),(24330,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),(24367,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),(24415,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),(24430,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),(24461,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),(24742,7,2,5,NULL,NULL,NULL,NULL,NULL,NULL),(25549,7,3,2,NULL,'FE594FC35E7F9AFF86D99D8A364AB297','1252624ED8CBD6FAC7D33F5D67A535F3','66FC5E09B8706126795F140308C8C1D8',NULL,NULL),(25996,7,3,5,NULL,'23C59C5963CBEF5B728D13A50878DFCB','C7FF932D6A2174A3D538CA7212136D2B','210B970149D6F56CAC9BADF2AAC91E8E',NULL,NULL),(26124,7,3,5,NULL,'F8C05AE372DECA1D6C81DA7A8D1C5C39','46DF06D0147BA67BA49AF553435E093F','C9CA997AB8EDE1C65465CB2920869C4E',NULL,NULL),(26365,7,3,5,NULL,'2AAC82C80E829E2CA902D70CFA1A833A','59A53F307288454B419B13E694DF503C','DBE7F860276D6B400AAA86B35D51A417',NULL,NULL),(26654,7,3,5,NULL,'FAC2D693E702B9EC9F750F17245696D8','A752640E8B99FE5B57C1320BC492895A','9234C1BD5E9687ADBD19F764F2E0E811',NULL,NULL),(26822,7,3,5,NULL,'283E8D77ECF7060BE6347BE4EB99C7C7','2B05F6D746C0C6CC7EF79450B309E595','91003668C245D14ECD8DF094E065E06B',NULL,NULL),(26899,7,3,5,NULL,'F462CD2FE4EA3EADF875308FDBB18C99','3551EF0028B51E92170559BD25644B03','8368EFC2021329110A16339D298200D4',NULL,NULL),(26972,7,3,5,NULL,'797ECC19662DCBD5090A4481173F1D26','6E212DEF6A0124A3D9AD07F5E322F7AE','341CFEFE3D72ACA9A4407DC535DED66A',NULL,NULL),(28153,8,0,1,NULL,NULL,'DD626517CC6D31932B479934CCDC0ABF',NULL,NULL,NULL),(30706,8,1,5,NULL,NULL,'BB6D9866FE4A19A568015198783003FC',NULL,NULL,NULL),(30993,8,2,0,NULL,NULL,'2BAD61655ABC2FC3D04893B536403A91',NULL,NULL,NULL),(31229,8,2,0,NULL,NULL,'8A46F23670309F2AAE85C9A47276382B',NULL,NULL,NULL),(31429,8,2,0,NULL,NULL,'7795A507AF9DC3525EFF724FEE17E70C',NULL,NULL,NULL),(31478,8,2,0,NULL,NULL,'7973A8D54BDB8B798D9297B096E771EF',NULL,NULL,NULL),(32305,8,2,5,NULL,NULL,'21F5A6FC7AD89FBF411FDA8B8738186A',NULL,NULL,NULL),(32494,8,2,5,NULL,NULL,'58984ACE04919401835C61309A848F8A',NULL,NULL,NULL),(32580,8,2,5,NULL,NULL,'87C2FAA0D7931BF016299025C0DDCA14',NULL,NULL,NULL),(32638,8,2,5,NULL,NULL,'5D07ECE7D4A867DDDE615DAD22B76D4E',NULL,NULL,NULL),(32722,8,2,5,NULL,NULL,'1A09BE1D38A122586B4931BECCEAD4AA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `build_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `string` text CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_ip_actions`
--

DROP TABLE IF EXISTS `logs_ip_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_ip_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int(10) unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` int(10) unsigned NOT NULL COMMENT 'Character Guid',
  `realm_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Realm ID',
  `type` tinyint(3) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text DEFAULT NULL COMMENT 'Notes inserted by system',
  `unixtime` int(10) unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp',
  `comment` text DEFAULT NULL COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used to log ips of individual actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_ip_actions`
--

LOCK TABLES `logs_ip_actions` WRITE;
/*!40000 ALTER TABLE `logs_ip_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_ip_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_account_permissions`
--

DROP TABLE IF EXISTS `rbac_account_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT -1 COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_account_permissions`
--

LOCK TABLES `rbac_account_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_account_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbac_account_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_default_permissions`
--

DROP TABLE IF EXISTS `rbac_default_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_default_permissions` (
  `secId` int(10) unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'permission id',
  `realmId` int(11) NOT NULL DEFAULT -1 COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default permission to assign to different account security levels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_default_permissions`
--

LOCK TABLES `rbac_default_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_default_permissions` DISABLE KEYS */;
INSERT INTO `rbac_default_permissions` VALUES (0,195,-1),(1,194,-1),(2,193,-1),(3,192,-1);
/*!40000 ALTER TABLE `rbac_default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_linked_permissions`
--

DROP TABLE IF EXISTS `rbac_linked_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_linked_permissions` (
  `id` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int(10) unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission - Linked Permission relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_linked_permissions`
--

LOCK TABLES `rbac_linked_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_linked_permissions` DISABLE KEYS */;
INSERT INTO `rbac_linked_permissions` VALUES (192,21),(192,42),(192,43),(192,193),(192,196),(192,778),(192,779),(192,780),(192,781),(192,782),(192,783),(192,784),(192,785),(192,786),(192,787),(192,788),(192,789),(192,790),(192,791),(192,792),(192,793),(192,794),(192,795),(192,796),(192,835),(193,48),(193,194),(193,197),(194,1),(194,2),(194,11),(194,13),(194,14),(194,15),(194,16),(194,17),(194,18),(194,19),(194,20),(194,22),(194,23),(194,25),(194,26),(194,27),(194,28),(194,29),(194,30),(194,31),(194,32),(194,33),(194,34),(194,35),(194,36),(194,37),(194,38),(194,39),(194,40),(194,41),(194,44),(194,46),(194,47),(194,51),(194,195),(194,198),(194,632),(194,798),(195,3),(195,4),(195,5),(195,6),(195,24),(195,49),(195,199),(196,7),(196,200),(196,201),(196,226),(196,227),(196,230),(196,231),(196,233),(196,234),(196,235),(196,238),(196,239),(196,240),(196,241),(196,242),(196,243),(196,244),(196,245),(196,246),(196,247),(196,248),(196,249),(196,250),(196,251),(196,252),(196,253),(196,254),(196,255),(196,256),(196,257),(196,258),(196,259),(196,260),(196,261),(196,262),(196,264),(196,265),(196,266),(196,267),(196,268),(196,269),(196,270),(196,271),(196,272),(196,279),(196,280),(196,283),(196,287),(196,288),(196,289),(196,290),(196,291),(196,292),(196,293),(196,294),(196,295),(196,296),(196,297),(196,298),(196,299),(196,302),(196,303),(196,304),(196,305),(196,306),(196,307),(196,308),(196,309),(196,310),(196,313),(196,314),(196,319),(196,320),(196,321),(196,322),(196,323),(196,324),(196,325),(196,326),(196,327),(196,328),(196,329),(196,330),(196,331),(196,332),(196,333),(196,334),(196,335),(196,336),(196,337),(196,338),(196,339),(196,340),(196,341),(196,342),(196,343),(196,344),(196,345),(196,346),(196,347),(196,348),(196,349),(196,350),(196,351),(196,352),(196,353),(196,354),(196,355),(196,356),(196,357),(196,358),(196,359),(196,360),(196,361),(196,362),(196,363),(196,364),(196,365),(196,366),(196,373),(196,375),(196,400),(196,401),(196,402),(196,403),(196,404),(196,405),(196,406),(196,407),(196,417),(196,418),(196,419),(196,420),(196,421),(196,422),(196,423),(196,424),(196,425),(196,426),(196,427),(196,428),(196,429),(196,434),(196,435),(196,436),(196,437),(196,438),(196,439),(196,440),(196,441),(196,442),(196,443),(196,444),(196,445),(196,446),(196,447),(196,448),(196,449),(196,450),(196,451),(196,452),(196,453),(196,454),(196,455),(196,456),(196,457),(196,458),(196,459),(196,461),(196,463),(196,464),(196,465),(196,472),(196,474),(196,475),(196,476),(196,477),(196,478),(196,488),(196,489),(196,491),(196,492),(196,493),(196,495),(196,497),(196,498),(196,499),(196,500),(196,502),(196,503),(196,505),(196,508),(196,511),(196,513),(196,514),(196,516),(196,519),(196,522),(196,523),(196,526),(196,527),(196,529),(196,530),(196,533),(196,535),(196,536),(196,537),(196,538),(196,539),(196,540),(196,541),(196,556),(196,581),(196,582),(196,592),(196,593),(196,596),(196,602),(196,603),(196,604),(196,605),(196,606),(196,607),(196,608),(196,609),(196,610),(196,611),(196,612),(196,613),(196,614),(196,615),(196,616),(196,617),(196,618),(196,619),(196,620),(196,621),(196,622),(196,623),(196,624),(196,625),(196,626),(196,627),(196,628),(196,629),(196,630),(196,631),(196,633),(196,634),(196,635),(196,636),(196,637),(196,638),(196,639),(196,640),(196,641),(196,642),(196,643),(196,644),(196,645),(196,646),(196,647),(196,648),(196,649),(196,650),(196,651),(196,652),(196,653),(196,654),(196,655),(196,656),(196,657),(196,658),(196,659),(196,660),(196,661),(196,662),(196,663),(196,664),(196,665),(196,666),(196,667),(196,668),(196,669),(196,670),(196,671),(196,673),(196,674),(196,675),(196,676),(196,677),(196,678),(196,679),(196,680),(196,681),(196,682),(196,683),(196,684),(196,685),(196,686),(196,687),(196,688),(196,689),(196,690),(196,691),(196,692),(196,693),(196,694),(196,695),(196,696),(196,697),(196,698),(196,699),(196,700),(196,701),(196,702),(196,703),(196,704),(196,706),(196,707),(196,708),(196,709),(196,710),(196,711),(196,712),(196,713),(196,714),(196,715),(196,716),(196,717),(196,718),(196,719),(196,721),(196,722),(196,723),(196,724),(196,725),(196,726),(196,727),(196,728),(196,729),(196,730),(196,733),(196,734),(196,735),(196,736),(196,738),(196,739),(196,748),(196,753),(196,757),(196,773),(196,777),(196,836),(196,837),(196,838),(196,839),(196,840),(196,841),(196,843),(196,852),(196,866),(196,867),(196,870),(196,871),(196,872),(196,873),(196,875),(196,876),(196,877),(196,878),(196,879),(196,881),(197,232),(197,236),(197,237),(197,273),(197,274),(197,275),(197,276),(197,277),(197,284),(197,285),(197,286),(197,301),(197,311),(197,387),(197,388),(197,389),(197,390),(197,391),(197,392),(197,393),(197,394),(197,395),(197,396),(197,397),(197,398),(197,399),(197,473),(197,479),(197,480),(197,481),(197,482),(197,485),(197,486),(197,487),(197,494),(197,501),(197,506),(197,509),(197,510),(197,517),(197,518),(197,521),(197,542),(197,543),(197,550),(197,558),(197,568),(197,571),(197,572),(197,573),(197,574),(197,575),(197,576),(197,577),(197,578),(197,579),(197,580),(197,583),(197,584),(197,585),(197,586),(197,587),(197,588),(197,589),(197,590),(197,591),(197,594),(197,595),(197,601),(197,743),(197,750),(197,758),(197,761),(197,762),(197,763),(197,764),(197,765),(197,766),(197,767),(197,768),(197,769),(197,770),(197,771),(197,772),(197,774),(197,856),(197,857),(197,858),(197,859),(197,860),(197,861),(197,862),(197,863),(197,864),(197,865),(198,218),(198,300),(198,312),(198,315),(198,316),(198,317),(198,318),(198,367),(198,368),(198,369),(198,370),(198,371),(198,372),(198,374),(198,376),(198,377),(198,408),(198,409),(198,410),(198,411),(198,412),(198,413),(198,414),(198,415),(198,416),(198,430),(198,431),(198,432),(198,433),(198,462),(198,466),(198,467),(198,468),(198,469),(198,470),(198,471),(198,483),(198,484),(198,490),(198,504),(198,512),(198,515),(198,520),(198,524),(198,528),(198,531),(198,532),(198,544),(198,545),(198,546),(198,547),(198,548),(198,549),(198,551),(198,552),(198,553),(198,554),(198,555),(198,557),(198,559),(198,560),(198,561),(198,562),(198,563),(198,564),(198,565),(198,566),(198,567),(198,569),(198,570),(198,597),(198,598),(198,599),(198,600),(198,737),(198,740),(198,741),(198,742),(198,744),(198,745),(198,746),(198,747),(198,749),(198,751),(198,752),(198,754),(198,755),(198,756),(198,759),(198,760),(198,855),(199,217),(199,221),(199,222),(199,223),(199,225),(199,263),(199,378),(199,379),(199,380),(199,496),(199,507),(199,525),(199,534),(199,797);
/*!40000 ALTER TABLE `rbac_linked_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permissions`
--

DROP TABLE IF EXISTS `rbac_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permissions`
--

LOCK TABLES `rbac_permissions` WRITE;
/*!40000 ALTER TABLE `rbac_permissions` DISABLE KEYS */;
INSERT INTO `rbac_permissions` VALUES (1,'Instant logout'),(2,'Skip Queue'),(3,'Join Normal Battleground'),(4,'Join Random Battleground'),(5,'Join Arenas'),(6,'Join Dungeon Finder'),(7,'Skip idle connection check'),(8,'Cannot earn achievements'),(9,'Cannot earn realm first achievements'),(11,'Log GM trades'),(13,'Skip Instance required bosses check'),(14,'Skip character creation team mask check'),(15,'Skip character creation class mask check'),(16,'Skip character creation race mask check'),(17,'Skip character creation reserved name check'),(18,'Skip character creation death knight min level check'),(19,'Skip needed requirements to use channel check'),(20,'Skip disable map check'),(21,'Skip reset talents when used more than allowed check'),(22,'Skip spam chat check'),(23,'Skip over-speed ping check'),(24,'Two side faction characters on the same account'),(25,'Allow say chat between factions'),(26,'Allow channel chat between factions'),(27,'Two side mail interaction'),(28,'See two side who list'),(29,'Add friends of other faction'),(30,'Save character without delay with .save command'),(31,'Use params with .unstuck command'),(32,'Can be assigned tickets with .assign ticket command'),(33,'Notify if a command was not found'),(34,'Check if should appear in list using .gm ingame command'),(35,'See all security levels with who command'),(36,'Filter whispers'),(37,'Use staff badge in chat'),(38,'Resurrect with full Health Points'),(39,'Restore saved gm setting states'),(40,'Allows to add a gm to friend list'),(41,'Use Config option START_GM_LEVEL to assign new character level'),(42,'Allows to use CMSG_WORLD_TELEPORT opcode'),(43,'Allows to use CMSG_WHOIS opcode'),(44,'Receive global GM messages/texts'),(45,'Join channels without announce'),(46,'Change channel settings without being channel moderator'),(47,'Enables lower security than target check'),(48,'Enable IP, Last Login and EMail output in pinfo'),(49,'Forces to enter the email for confirmation on password change'),(50,'Allow user to check his own email with .account'),(51,'Allow trading between factions'),(192,'Role: Sec Level Administrator'),(193,'Role: Sec Level Gamemaster'),(194,'Role: Sec Level Moderator'),(195,'Role: Sec Level Player'),(196,'Role: Administrator Commands'),(197,'Role: Gamemaster Commands'),(198,'Role: Moderator Commands'),(199,'Role: Player Commands'),(200,'Command: rbac'),(201,'Command: rbac account'),(202,'Command: rbac account list'),(203,'Command: rbac account grant'),(204,'Command: rbac account deny'),(205,'Command: rbac account revoke'),(206,'Command: rbac list'),(217,'Command: account'),(218,'Command: account addon'),(219,'Command: account create'),(220,'Command: account delete'),(221,'Command: account lock'),(222,'Command: account lock country'),(223,'Command: account lock ip'),(224,'Command: account onlinelist'),(225,'Command: account password'),(226,'Command: account set'),(227,'Command: account set addon'),(228,'Command: account set seclevel'),(229,'Command: account set password'),(230,'Command: achievement'),(231,'Command: achievement add'),(232,'Command: arena'),(233,'Command: arena captain'),(234,'Command: arena create'),(235,'Command: arena disband'),(236,'Command: arena info'),(237,'Command: arena lookup'),(238,'Command: arena rename'),(239,'Command: ban'),(240,'Command: ban account'),(241,'Command: ban character'),(242,'Command: ban ip'),(243,'Command: ban playeraccount'),(244,'Command: baninfo'),(245,'Command: baninfo account'),(246,'Command: baninfo character'),(247,'Command: baninfo ip'),(248,'Command: banlist'),(249,'Command: banlist account'),(250,'Command: banlist character'),(251,'Command: banlist ip'),(252,'Command: unban'),(253,'Command: unban account'),(254,'Command: unban character'),(255,'Command: unban ip'),(256,'Command: unban playeraccount'),(257,'Command: bf'),(258,'Command: bf start'),(259,'Command: bf stop'),(260,'Command: bf switch'),(261,'Command: bf timer'),(262,'Command: bf enable'),(263,'Command: account email'),(264,'Command: account set sec'),(265,'Command: account set sec email'),(266,'Command: account set sec regmail'),(267,'Command: cast'),(268,'Command: cast back'),(269,'Command: cast dist'),(270,'Command: cast self'),(271,'Command: cast target'),(272,'Command: cast dest'),(273,'Command: character'),(274,'Command: character customize'),(275,'Command: character changefaction'),(276,'Command: character changerace'),(277,'Command: character deleted'),(278,'Command: character deleted delete'),(279,'Command: character deleted list'),(280,'Command: character deleted restore'),(281,'Command: character deleted old'),(283,'Command: character level'),(284,'Command: character rename'),(285,'Command: character reputation'),(286,'Command: character titles'),(287,'Command: levelup'),(288,'Command: pdump'),(289,'Command: pdump load'),(290,'Command: pdump write'),(291,'Command: cheat'),(292,'Command: cheat casttime'),(293,'Command: cheat cooldown'),(294,'Command: cheat explore'),(295,'Command: cheat god'),(296,'Command: cheat power'),(297,'Command: cheat status'),(298,'Command: cheat taxi'),(299,'Command: cheat waterwalk'),(300,'Command: debug'),(301,'Command: debug anim'),(302,'Command: debug areatriggers'),(303,'Command: debug arena'),(304,'Command: debug bg'),(305,'Command: debug entervehicle'),(306,'Command: debug getitemstate'),(307,'Command: debug getitemvalue'),(308,'Command: debug getvalue'),(309,'Command: debug combat'),(310,'Command: debug itemexpire'),(311,'Command: debug lootrecipient'),(312,'Command: debug los'),(313,'Command: debug mod32value'),(314,'Command: debug moveflags'),(315,'Command: debug play'),(316,'Command: debug play cinematics'),(317,'Command: debug play movie'),(318,'Command: debug play sound'),(319,'Command: debug send'),(320,'Command: debug send buyerror'),(321,'Command: debug send channelnotify'),(322,'Command: debug send chatmessage'),(323,'Command: debug send equiperror'),(324,'Command: debug send largepacket'),(325,'Command: debug send opcode'),(326,'Command: debug send qinvalidmsg'),(327,'Command: debug send qpartymsg'),(328,'Command: debug send sellerror'),(329,'Command: debug send setphaseshift'),(330,'Command: debug send spellfail'),(331,'Command: debug setaurastate'),(332,'Command: debug setbit'),(333,'Command: debug setitemvalue'),(334,'Command: debug setvalue'),(335,'Command: debug setvid'),(336,'Command: debug spawnvehicle'),(337,'Command: debug threat'),(338,'Command: debug update'),(339,'Command: debug worldstate'),(340,'Command: wpgps'),(341,'Command: deserter'),(342,'Command: deserter bg'),(343,'Command: deserter bg add'),(344,'Command: deserter bg remove'),(345,'Command: deserter instance'),(346,'Command: deserter instance add'),(347,'Command: deserter instance remove'),(348,'Command: disable'),(349,'Command: disable add'),(350,'Command: disable add achievement_criteria'),(351,'Command: disable add battleground'),(352,'Command: disable add map'),(353,'Command: disable add mmap'),(354,'Command: disable add outdoorpvp'),(355,'Command: disable add quest'),(356,'Command: disable add spell'),(357,'Command: disable add vmap'),(358,'Command: disable remove'),(359,'Command: disable remove achievement_criteria'),(360,'Command: disable remove battleground'),(361,'Command: disable remove map'),(362,'Command: disable remove mmap'),(363,'Command: disable remove outdoorpvp'),(364,'Command: disable remove quest'),(365,'Command: disable remove spell'),(366,'Command: disable remove vmap'),(367,'Command: event'),(368,'Command: event activelist'),(369,'Command: event start'),(370,'Command: event stop'),(371,'Command: gm'),(372,'Command: gm chat'),(373,'Command: gm fly'),(374,'Command: gm ingame'),(375,'Command: gm list'),(376,'Command: gm visible'),(377,'Command: go'),(378,'Command: account 2fa'),(379,'Command: account 2fa setup'),(380,'Command: account 2fa remove'),(381,'Command: account set 2fa'),(387,'Command: gobject'),(388,'Command: gobject activate'),(389,'Command: gobject add'),(390,'Command: gobject add temp'),(391,'Command: gobject delete'),(392,'Command: gobject info'),(393,'Command: gobject move'),(394,'Command: gobject near'),(395,'Command: gobject set'),(396,'Command: gobject set phase'),(397,'Command: gobject set state'),(398,'Command: gobject target'),(399,'Command: gobject turn'),(400,'Command: debug transport'),(401,'Command: guild'),(402,'Command: guild create'),(403,'Command: guild delete'),(404,'Command: guild invite'),(405,'Command: guild uninvite'),(406,'Command: guild rank'),(407,'Command: guild rename'),(408,'Command: honor'),(409,'Command: honor add'),(410,'Command: honor add kill'),(411,'Command: honor update'),(412,'Command: instance'),(413,'Command: instance listbinds'),(414,'Command: instance unbind'),(415,'Command: instance stats'),(416,'Command: instance savedata'),(417,'Command: learn'),(418,'Command: learn all'),(419,'Command: learn all my'),(420,'Command: learn all my class'),(421,'Command: learn all my pettalents'),(422,'Command: learn all my spells'),(423,'Command: learn all my talents'),(424,'Command: learn all gm'),(425,'Command: learn all crafts'),(426,'Command: learn all default'),(427,'Command: learn all lang'),(428,'Command: learn all recipes'),(429,'Command: unlearn'),(430,'Command: lfg'),(431,'Command: lfg player'),(432,'Command: lfg group'),(433,'Command: lfg queue'),(434,'Command: lfg clean'),(435,'Command: lfg options'),(436,'Command: list'),(437,'Command: list creature'),(438,'Command: list item'),(439,'Command: list object'),(440,'Command: list auras'),(441,'Command: list mail'),(442,'Command: lookup'),(443,'Command: lookup area'),(444,'Command: lookup creature'),(445,'Command: lookup event'),(446,'Command: lookup faction'),(447,'Command: lookup item'),(448,'Command: lookup itemset'),(449,'Command: lookup object'),(450,'Command: lookup quest'),(451,'Command: lookup player'),(452,'Command: lookup player ip'),(453,'Command: lookup player account'),(454,'Command: lookup player email'),(455,'Command: lookup skill'),(456,'Command: lookup spell'),(457,'Command: lookup spell id'),(458,'Command: lookup taxinode'),(459,'Command: lookup tele'),(460,'Command: lookup title'),(461,'Command: lookup map'),(462,'Command: announce'),(463,'Command: channel'),(464,'Command: channel set'),(465,'Command: channel set ownership'),(466,'Command: gmannounce'),(467,'Command: gmnameannounce'),(468,'Command: gmnotify'),(469,'Command: nameannounce'),(470,'Command: notify'),(471,'Command: whispers'),(472,'Command: group'),(473,'Command: group leader'),(474,'Command: group disband'),(475,'Command: group remove'),(476,'Command: group join'),(477,'Command: group list'),(478,'Command: group summon'),(479,'Command: pet'),(480,'Command: pet create'),(481,'Command: pet learn'),(482,'Command: pet unlearn'),(483,'Command: send'),(484,'Command: send items'),(485,'Command: send mail'),(486,'Command: send message'),(487,'Command: send money'),(488,'Command: additem'),(489,'Command: additemset'),(490,'Command: appear'),(491,'Command: aura'),(492,'Command: bank'),(493,'Command: bindsight'),(494,'Command: combatstop'),(495,'Command: cometome'),(496,'Command: commands'),(497,'Command: cooldown'),(498,'Command: damage'),(499,'Command: dev'),(500,'Command: die'),(501,'Command: dismount'),(502,'Command: distance'),(503,'Command: flusharenapoints'),(504,'Command: freeze'),(505,'Command: gps'),(506,'Command: guid'),(507,'Command: help'),(508,'Command: hidearea'),(509,'Command: itemmove'),(510,'Command: kick'),(511,'Command: linkgrave'),(512,'Command: listfreeze'),(513,'Command: maxskill'),(514,'Command: movegens'),(515,'Command: mute'),(516,'Command: neargrave'),(517,'Command: pinfo'),(518,'Command: playall'),(519,'Command: possess'),(520,'Command: recall'),(521,'Command: repairitems'),(522,'Command: respawn'),(523,'Command: revive'),(524,'Command: saveall'),(525,'Command: save'),(526,'Command: setskill'),(527,'Command: showarea'),(528,'Command: summon'),(529,'Command: unaura'),(530,'Command: unbindsight'),(531,'Command: unfreeze'),(532,'Command: unmute'),(533,'Command: unpossess'),(534,'Command: unstuck'),(535,'Command: wchange'),(536,'Command: mmap'),(537,'Command: mmap loadedtiles'),(538,'Command: mmap loc'),(539,'Command: mmap path'),(540,'Command: mmap stats'),(541,'Command: mmap testarea'),(542,'Command: morph'),(543,'Command: demorph'),(544,'Command: modify'),(545,'Command: modify arenapoints'),(546,'Command: modify bit'),(547,'Command: modify drunk'),(548,'Command: modify energy'),(549,'Command: modify faction'),(550,'Command: modify gender'),(551,'Command: modify honor'),(552,'Command: modify hp'),(553,'Command: modify mana'),(554,'Command: modify money'),(555,'Command: modify mount'),(556,'Command: modify phase'),(557,'Command: modify rage'),(558,'Command: modify reputation'),(559,'Command: modify runicpower'),(560,'Command: modify scale'),(561,'Command: modify speed'),(562,'Command: modify speed all'),(563,'Command: modify speed backwalk'),(564,'Command: modify speed fly'),(565,'Command: modify speed walk'),(566,'Command: modify speed swim'),(567,'Command: modify spell'),(568,'Command: modify standstate'),(569,'Command: modify talentpoints'),(570,'Command: npc'),(571,'Command: npc add'),(572,'Command: npc add formation'),(573,'Command: npc add item'),(574,'Command: npc add move'),(575,'Command: npc add temp'),(576,'Command: npc add delete'),(577,'Command: npc add delete item'),(578,'Command: npc add follow'),(579,'Command: npc add follow stop'),(580,'Command: npc set'),(581,'Command: npc set allowmove'),(582,'Command: npc set entry'),(583,'Command: npc set factionid'),(584,'Command: npc set flag'),(585,'Command: npc set level'),(586,'Command: npc set link'),(587,'Command: npc set model'),(588,'Command: npc set movetype'),(589,'Command: npc set phase'),(590,'Command: npc set spawndist'),(591,'Command: npc set spawntime'),(592,'Command: npc set data'),(593,'Command: npc info'),(594,'Command: npc near'),(595,'Command: npc move'),(596,'Command: npc playemote'),(597,'Command: npc say'),(598,'Command: npc textemote'),(599,'Command: npc whisper'),(600,'Command: npc yell'),(601,'Command: npc tame'),(602,'Command: quest'),(603,'Command: quest add'),(604,'Command: quest complete'),(605,'Command: quest remove'),(606,'Command: quest reward'),(607,'Command: reload'),(608,'Command: reload access_requirement'),(609,'Command: reload achievement_criteria_data'),(610,'Command: reload achievement_reward'),(611,'Command: reload all'),(612,'Command: reload all achievement'),(613,'Command: reload all area'),(614,'Command: broadcast_text'),(615,'Command: reload all gossips'),(616,'Command: reload all item'),(617,'Command: reload all locales'),(618,'Command: reload all loot'),(619,'Command: reload all npc'),(620,'Command: reload all quest'),(621,'Command: reload all scripts'),(622,'Command: reload all spell'),(623,'Command: reload areatrigger_involvedrelation'),(624,'Command: reload areatrigger_tavern'),(625,'Command: reload areatrigger_teleport'),(626,'Command: reload auctions'),(627,'Command: reload autobroadcast'),(628,'Command: reload command'),(629,'Command: reload conditions'),(630,'Command: reload config'),(631,'Command: reload battleground_template'),(632,'Command: .mutehistory'),(633,'Command: reload creature_linked_respawn'),(634,'Command: reload creature_loot_template'),(635,'Command: reload creature_onkill_reputation'),(636,'Command: reload creature_questender'),(637,'Command: reload creature_queststarter'),(638,'Command: reload creature_summon_groups'),(639,'Command: reload creature_template'),(640,'Command: reload creature_text'),(641,'Command: reload disables'),(642,'Command: reload disenchant_loot_template'),(643,'Command: reload event_scripts'),(644,'Command: reload fishing_loot_template'),(645,'Command: reload game_graveyard_zone'),(646,'Command: reload game_tele'),(647,'Command: reload gameobject_questender'),(648,'Command: reload gameobject_loot_template'),(649,'Command: reload gameobject_queststarter'),(650,'Command: reload gm_tickets'),(651,'Command: reload gossip_menu'),(652,'Command: reload gossip_menu_option'),(653,'Command: reload item_enchantment_template'),(654,'Command: reload item_loot_template'),(655,'Command: reload item_set_names'),(656,'Command: reload lfg_dungeon_rewards'),(657,'Command: reload locales_achievement_reward'),(658,'Command: reload locales_creature'),(659,'Command: reload locales_creature_text'),(660,'Command: reload locales_gameobject'),(661,'Command: reload locales_gossip_menu_option'),(662,'Command: reload locales_item'),(663,'Command: reload locales_item_set_name'),(664,'Command: reload locales_npc_text'),(665,'Command: reload locales_page_text'),(666,'Command: reload locales_points_of_interest'),(667,'Command: reload locales_quest'),(668,'Command: reload mail_level_reward'),(669,'Command: reload mail_loot_template'),(670,'Command: reload milling_loot_template'),(671,'Command: reload npc_spellclick_spells'),(672,'Command: reload trainer'),(673,'Command: reload npc_vendor'),(674,'Command: reload page_text'),(675,'Command: reload pickpocketing_loot_template'),(676,'Command: reload points_of_interest'),(677,'Command: reload prospecting_loot_template'),(678,'Command: reload quest_poi'),(679,'Command: reload quest_template'),(680,'Command: reload rbac'),(681,'Command: reload reference_loot_template'),(682,'Command: reload reserved_name'),(683,'Command: reload reputation_reward_rate'),(684,'Command: reload reputation_spillover_template'),(685,'Command: reload skill_discovery_template'),(686,'Command: reload skill_extra_item_template'),(687,'Command: reload skill_fishing_base_level'),(688,'Command: reload skinning_loot_template'),(689,'Command: reload smart_scripts'),(690,'Command: reload spell_required'),(691,'Command: reload spell_area'),(692,'Command: reload spell_bonus_data'),(693,'Command: reload spell_group'),(694,'Command: reload spell_learn_spell'),(695,'Command: reload spell_loot_template'),(696,'Command: reload spell_linked_spell'),(697,'Command: reload spell_pet_auras'),(698,'Command: character changeaccount'),(699,'Command: reload spell_proc'),(700,'Command: reload spell_scripts'),(701,'Command: reload spell_target_position'),(702,'Command: reload spell_threats'),(703,'Command: reload spell_group_stack_rules'),(704,'Command: reload trinity_string'),(706,'Command: reload waypoint_scripts'),(707,'Command: reload waypoint_data'),(708,'Command: reload vehicle_accessory'),(709,'Command: reload vehicle_template_accessory'),(710,'Command: reset'),(711,'Command: reset achievements'),(712,'Command: reset honor'),(713,'Command: reset level'),(714,'Command: reset spells'),(715,'Command: reset stats'),(716,'Command: reset talents'),(717,'Command: reset all'),(718,'Command: server'),(719,'Command: server corpses'),(720,'Command: server exit'),(721,'Command: server idlerestart'),(722,'Command: server idlerestart cancel'),(723,'Command: server idleshutdown'),(724,'Command: server idleshutdown cancel'),(725,'Command: server info'),(726,'Command: server plimit'),(727,'Command: server restart'),(728,'Command: server restart cancel'),(729,'Command: server set'),(730,'Command: server set closed'),(731,'Command: server set difftime'),(732,'Command: server set loglevel'),(733,'Command: server set motd'),(734,'Command: server shutdown'),(735,'Command: server shutdown cancel'),(736,'Command: server motd'),(737,'Command: tele'),(738,'Command: tele add'),(739,'Command: tele del'),(740,'Command: tele name'),(741,'Command: tele group'),(742,'Command: ticket'),(743,'Command: ticket assign'),(744,'Command: ticket close'),(745,'Command: ticket closedlist'),(746,'Command: ticket comment'),(747,'Command: ticket complete'),(748,'Command: ticket delete'),(749,'Command: ticket escalate'),(750,'Command: ticket escalatedlist'),(751,'Command: ticket list'),(752,'Command: ticket onlinelist'),(753,'Command: ticket reset'),(754,'Command: ticket response'),(755,'Command: ticket response append'),(756,'Command: ticket response appendln'),(757,'Command: ticket togglesystem'),(758,'Command: ticket unassign'),(759,'Command: ticket viewid'),(760,'Command: ticket viewname'),(761,'Command: titles'),(762,'Command: titles add'),(763,'Command: titles current'),(764,'Command: titles remove'),(765,'Command: titles set'),(766,'Command: titles set mask'),(767,'Command: wp'),(768,'Command: wp add'),(769,'Command: wp event'),(770,'Command: wp load'),(771,'Command: wp modify'),(772,'Command: wp unload'),(773,'Command: wp reload'),(774,'Command: wp show'),(777,'Command: mailbox'),(778,'Command: ahbot'),(779,'Command: ahbot items'),(780,'Command: ahbot items gray'),(781,'Command: ahbot items white'),(782,'Command: ahbot items green'),(783,'Command: ahbot items blue'),(784,'Command: ahbot items purple'),(785,'Command: ahbot items orange'),(786,'Command: ahbot items yellow'),(787,'Command: ahbot ratio'),(788,'Command: ahbot ratio alliance'),(789,'Command: ahbot ratio horde'),(790,'Command: ahbot ratio neutral'),(791,'Command: ahbot rebuild'),(792,'Command: ahbot reload'),(793,'Command: ahbot status'),(794,'Command: guild info'),(795,'Command: instance setbossstate'),(796,'Command: instance getbossstate'),(797,'Command: pvpstats'),(798,'Command: mod xp'),(835,'Command: debug loadcells'),(836,'Command: debug boundary'),(837,'Command: npc evade'),(838,'Command: pet level'),(839,'Command: server shutdown force'),(840,'Command: server restart force'),(841,'Command: debug neargraveyard'),(843,'Command: reload quest_greeting'),(852,'Command: debug dummy'),(855,'Command: debug play music'),(856,'Command: npc spawngroup'),(857,'Command: npc despawngroup'),(858,'Command: gobject spawngroup'),(859,'Command: gobject despawngroup'),(860,'Command: list respawns'),(861,'Command: group set'),(862,'Command: group set assistant'),(863,'Command: group set maintank'),(864,'Command: group set mainassist'),(865,'Command: npc showloot'),(866,'Command: list spawnpoints'),(867,'Command: reload quest_greeting_locale'),(870,'Command: debug threatinfo'),(871,'Command: debug instancespawn'),(872,'Command: server debug'),(873,'Command: reload creature_movement_override'),(874,'Command: debug asan'),(875,'Command: lookup map id'),(876,'Command: lookup item id'),(877,'Command: lookup quest id'),(878,'Command: debug questreset'),(879,'Command: debug poolstatus'),(880,'Command: pdump copy'),(881,'Command: reload vehicle_template');
/*!40000 ALTER TABLE `rbac_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT 0,
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters`
--

LOCK TABLES `realmcharacters` WRITE;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` VALUES (1,1,5),(1,2,5),(1,3,5),(1,4,5),(1,8,5),(1,9,0),(1,10,4),(1,11,10),(1,12,0),(1,13,10),(2,2,1),(2,3,1),(2,4,1),(2,8,2),(2,10,1),(2,11,0),(2,12,0),(2,13,0);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacterstemp`
--

DROP TABLE IF EXISTS `realmcharacterstemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacterstemp` (
  `realmid` int(11) DEFAULT NULL,
  `acctid` int(11) DEFAULT NULL,
  `numchars` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacterstemp`
--

LOCK TABLES `realmcharacterstemp` WRITE;
/*!40000 ALTER TABLE `realmcharacterstemp` DISABLE KEYS */;
INSERT INTO `realmcharacterstemp` VALUES (1,608,5),(1,607,5),(1,609,5),(1,610,5);
/*!40000 ALTER TABLE `realmcharacterstemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT 8085,
  `icon` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `flag` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `population` float unsigned NOT NULL DEFAULT 0,
  `gamebuild` int(10) unsigned NOT NULL DEFAULT 12340,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmlist`
--

LOCK TABLES `realmlist` WRITE;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` VALUES (1,'Trinity','10.0.0.4','127.0.0.1','255.255.255.0',8084,0,0,1,0,0,12340),(2,'Trinity_335','10.0.0.4','127.0.0.1','255.255.255.0',8085,0,0,1,0,0,12340);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_digest`
--

DROP TABLE IF EXISTS `secret_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secret_digest` (
  `id` int(10) unsigned NOT NULL,
  `digest` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_digest`
--

LOCK TABLES `secret_digest` WRITE;
/*!40000 ALTER TABLE `secret_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `secret_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES ('2014_11_10_00_auth.sql','0E3CB119442D09DD88E967015319BBC8DAFBBFE0','ARCHIVED','2015-03-21 21:44:12',0),('2014_11_10_01_auth.sql','327E77A1DA3546D5275AB249915DD57EDD6FDD3D','ARCHIVED','2015-03-21 21:44:12',0),('2014_12_10_00_auth.sql','821703A96D80F9080074852B5A46E2909C9562EA','ARCHIVED','2015-03-21 21:44:12',0),('2014_12_21_00_auth.sql','CE2E5D2CD82E79C25294539ADED27A1429105B43','ARCHIVED','2015-03-21 21:44:12',0),('2015_03_20_00_auth.sql','E8C5B74BB45F0F35DEC182C72BACF435C7066FB0','ARCHIVED','2015-03-21 21:44:12',0),('2015_03_20_01_auth.sql','862961815354DA2746F5F71FBC8155F57CBE75AB','ARCHIVED','2015-03-21 21:44:12',0),('2015_03_20_02_auth.sql','33E4F94086590768EF5D4855DD43D7DE7C06ADA4','ARCHIVED','2015-03-21 21:44:51',0),('2015_08_21_00_auth.sql','C31A9E1D28E11B60BE8F8198637DD51F6D75123F','ARCHIVED','2015-10-05 23:16:19',0),('2015_11_07_00_auth.sql','0ACDD35EC9745231BCFA701B78056DEF94D0CC53','ARCHIVED','2016-04-11 00:42:36',0),('2016_01_13_00_auth.sql','24615CC69B3CD7BB4699874647C35BA86E8A93FD','ARCHIVED','2016-01-13 00:00:00',0),('2016_04_11_00_auth.sql','0ACDD35EC9745231BCFA701B78056DEF94D0CC53','ARCHIVED','2016-04-11 03:18:17',0),('2016_05_11_00_auth.sql','95B66235B8D67BF1CA216EB09F313C1F8F393B47','ARCHIVED','2016-04-16 13:17:11',0),('2016_06_06_00_auth.sql','A0A8D73A952D0618833416513D53F73A70E7EA25','ARCHIVED','2016-10-16 13:42:31',0),('2016_09_22_00_auth.sql','70047954E3556BFA430ADD5680EF8797F74A4B9E','ARCHIVED','2016-09-22 00:00:00',0),('2016_10_16_00_auth.sql','0ACDD35EC9745231BCFA701B78056DEF94D0CC53','ARCHIVED','2016-10-16 14:02:49',0),('2017_01_06_00_auth.sql','6CCFE6A9774EC733C9863D36A0F15F3534189BBD','ARCHIVED','2017-01-06 05:34:00',0),('2017_01_08_00_auth.sql','A68511D0BF94C41F720A11B630CCB36BBEA6B17D','ARCHIVED','2017-01-08 03:21:00',0),('2017_02_06_00_auth_335.sql','612068198F744892ECC0ACFE3BDCB6D72995916E','ARCHIVED','2017-02-06 00:00:00',0),('2017_03_17_00_auth.sql','4902E9B1B063F399F928C2DD7AFD60427738E227','ARCHIVED','2017-03-17 18:58:01',0),('2017_04_19_00_auth.sql','EAE1C1D3AA752259785C056A8F18515E1EF32BC9','ARCHIVED','2017-04-19 00:07:40',0),('2017_05_29_00_auth.sql','74BBB703AABD8A6BCB905EA2F5C14A5E26124CDD','ARCHIVED','2017-05-29 23:16:20',0),('2017_06_12_00_auth.sql','176532AED785F1F759382C79A28E0FED92E99779','ARCHIVED','2017-06-12 14:46:29',0),('2017_06_12_01_auth.sql','661B4935E101AF188BEBF43203144104E89F8C54','ARCHIVED','2018-02-10 00:52:59',47),('2017_06_12_02_auth.sql','166F059E411FAA4901BBBA09A41EF07B1CADC4B6','ARCHIVED','2017-06-12 16:39:17',0),('2017_06_17_00_auth.sql','4A172895CB9DA8EFE1270434D6ECB22D4F4DCB17','ARCHIVED','2017-06-17 01:40:04',0),('2017_06_28_00_auth_rbac.sql','D32EF80F57F629C23395D80F06E91D7E40719F83','ARCHIVED','2017-06-28 15:23:34',0),('2017_08_01_00_auth.sql','6ECE808AF52345177189E962C0606B769B6806A6','ARCHIVED','2017-08-01 01:11:28',0),('2017_10_13_00_auth.sql','87674E0D166AC60E3725B445714427892E42C6FE','ARCHIVED','2017-10-13 22:00:22',0),('2017_10_29_00_auth.sql','F742569F56BB29CE9C8DBBD40A6AB474F846485C','ARCHIVED','2018-02-10 00:52:59',49),('2017_12_17_00_auth.sql','2CD99730D4D32DBF0584CD5B1AA6F8F4AE3DA975','ARCHIVED','2017-12-17 03:17:39',0),('2018_01_03_00_auth_2018_01_02_00_auth.sql','08AF5DAB45515B681B738DA17FA414C7C7CCA44E','ARCHIVED','2018-01-02 20:40:37',0),('2018_01_09_00_auth.sql','A5D4EC8FCFAB4F2DCE70EDCAD1ACBFB484FD68D5','ARCHIVED','2018-01-09 00:00:00',0),('2018_01_24_00_auth.sql','167B17D8A253D62A8112F8A7EB21C6E99CAEF1E4','ARCHIVED','2018-01-24 00:00:00',0),('2018_02_19_00_auth.sql','80E50F9C7F1EE7BA62789EA4C4F009170B79E6C9','ARCHIVED','2018-06-12 00:21:09',79),('2018_03_06_00_auth.sql','2D71E93DF7419A30D0D21D8A80CF05698302575A','ARCHIVED','2018-06-12 00:21:09',34),('2018_03_08_00_auth.sql','624C58A07E0B4DDC4C1347E8BA8EFEEFD5B43DA7','ARCHIVED','2018-06-12 00:21:09',32),('2018_06_23_00_auth.sql','BE35312C386A127D047E5A7CE0D14DB41D905F8E','ARCHIVED','2018-07-30 10:26:53',61),('2018_09_17_00_auth.sql','4DB671F0A4FA1A93AF28FB6426AF13DE72C7DA3D','ARCHIVED','2018-10-21 14:34:25',33),('2018_09_06_00_auth.sql','309D21E0DF82ED8921F77EAFDE741F38AC32BB13','ARCHIVED','2018-10-21 14:34:25',38),('2018_08_30_00_auth.sql','22F69864361D3E72F800379338310172C0576D1C','ARCHIVED','2018-10-21 14:34:25',77),('2018_12_30_00_auth.sql','680F4F9194FC37592041C2DB5B2B7006B14E836D','ARCHIVED','2019-05-10 02:08:32',79),('2019_03_19_00_auth.sql','03BA8CFC60ACD5B874840A3E50F11CD2643730A0','ARCHIVED','2019-05-10 02:08:32',44),('2019_04_15_00_auth.sql','EC67389946A24BFAA226B9DFCFEDB3BA095B4C42','ARCHIVED','2019-05-10 02:08:32',45),('2019_04_27_00_auth.sql','84B1EB9CC9B09BAF55E6295D202EC57D99B1B60E','ARCHIVED','2019-05-10 02:08:32',45),('2019_05_15_00_auth.sql','8A7B96E66D689DA63380654142FF60A1EE938697','ARCHIVED','2020-03-01 03:38:57',147),('2019_06_06_00_auth.sql','6DE8159E04BEE7BA0A4A81D72D160EB74934B6A5','ARCHIVED','2020-03-01 03:38:57',68),('2019_06_15_00_auth.sql','456B92D99FFD2E7B6CBF64F4C68555A42B24B298','ARCHIVED','2020-03-01 03:38:58',57),('2019_06_16_00_auth.sql','B14AED4D3387B56FF8C8161D3671750AEEAE0F2E','ARCHIVED','2020-03-01 03:38:58',69),('2019_06_21_00_auth.sql','C519239830204B68E710F698BC0C9E89B6D5FD24','ARCHIVED','2020-03-01 03:38:58',57),('2019_07_15_00_auth.sql','64B491CD197A4466D7F739D67DD30C9502FF393A','ARCHIVED','2020-03-01 03:38:58',60),('2019_07_16_00_auth.sql','36CB53A9EBD64BFDCF7030083E36E534F1753773','ARCHIVED','2020-03-01 03:38:58',57),('2019_07_17_00_auth.sql','4F983F039904894ACC483BE885676C5F0A18F06B','ARCHIVED','2020-03-01 03:38:58',50),('2019_08_10_00_auth.sql','3568A1C9C6D62BBCD470C0623C1580E332D545D2','ARCHIVED','2020-03-01 03:38:58',53),('2019_08_10_01_auth.sql','C58357260F0C70DA226A71F7E05DE2C49AAEFD74','ARCHIVED','2020-03-01 03:38:58',410),('2019_08_16_00_auth.sql','99CF9C250EFBBD703DF0A2D1BDEB1E46D1063EE9','ARCHIVED','2020-03-01 03:38:58',46),('2019_09_15_00_auth.sql','2EEE632B5A365D45747B7BB25DE5239FB5B1A1BD','ARCHIVED','2020-03-01 03:38:58',57),('2019_10_18_00_auth.sql','DFEDA33D7B9A108773B6AD8DE3016C6B12BD3832','ARCHIVED','2020-03-01 03:38:59',59),('2019_11_16_00_auth.sql','A7CC55B9329F0DDFE91ADC31BFABD0D934ED0A5E','ARCHIVED','2020-03-01 03:38:59',53),('2019_12_07_00_auth.sql','F354DA31D5B300609C6AE8A25667CA4DE0A7349F','ARCHIVED','2020-03-01 03:38:59',87),('2019_12_15_00_auth.sql','62CFB68A53F73E875B1104F0D0BAC81145090524','ARCHIVED','2020-03-01 03:38:59',60),('2020_01_15_00_auth.sql','D486C0CEF68FDE5122E835128A1F663E0E72A21E','ARCHIVED','2020-03-01 03:38:59',49),('2020_02_15_00_auth.sql','9CDBEBC722BEBB7C93091CF16EEB9C922C4116BD','ARCHIVED','2020-03-01 03:38:59',57),('2020_03_16_00_auth.sql','B27E4CE14C713C73216930A7F3F770786D902A3F','ARCHIVED','2020-05-20 11:30:01',13),('2020_04_07_00_auth.sql','6D73A4E1EC5382F10C39F20E2E6E764510A8A5E6','ARCHIVED','2020-05-20 11:30:01',60),('2020_04_15_00_auth.sql','031E61B50B03E40406F07C196826DB9016A7203F','ARCHIVED','2020-05-20 11:30:01',11),('2020_04_18_00_auth.sql','BD962B50760771B60F2785027D6957EEF2009240','ARCHIVED','2020-05-20 11:30:02',555),('2020_05_15_00_auth.sql','765389B45F97A02160A58B373D63166F7F7D4427','ARCHIVED','2020-05-20 11:30:02',10),('2020_06_15_00_auth.sql','3158036285CC9A4AB7D39063F9687649A21D0A94','ARCHIVED','2020-06-16 12:43:00',484),('2020_06_20_00_auth.sql','85345FAF20B91DA7B157AE1E17DF5B6446C2E109','ARCHIVED','2020-07-15 01:53:15',4691),('2020_07_15_00_auth.sql','56748440894EA78C3BE72C4A3F2E97E256E6EE40','ARCHIVED','2020-07-15 12:37:43',417),('2020_08_02_00_auth.sql','B0290F6558C59262D9DDD8071060A8803DD56930','ARCHIVED','2020-11-18 00:14:36',2252),('2020_08_03_00_auth.sql','492CA77C0FAEEEF3E0492121B3A92689373ECFA3','ARCHIVED','2020-11-18 00:14:37',1119),('2020_08_03_01_auth.sql','EC1063396CA20A2303D83238470D41EF4439EC72','ARCHIVED','2020-11-18 00:14:38',851),('2020_08_11_00_auth.sql','14C99177E43003D83A4D6F2227722F15FC15A1D0','ARCHIVED','2020-11-18 00:14:38',166),('2020_08_15_00_auth.sql','A49F4A776E1583B1FF63DFE99BC0E0DD97A74674','ARCHIVED','2020-11-18 00:14:38',11),('2020_08_22_00_auth.sql','060A87FCC8F836A96D9D55BEDC32CBAD05008B4C','ARCHIVED','2020-11-18 00:14:38',7),('2020_09_06_00_auth.sql','DC4B5D4C65EB138D5609F137799C3289B9CC2493','ARCHIVED','2020-11-18 00:14:39',847),('2020_09_15_00_auth.sql','0AA5BCA384A372DC789647F838657766D51D8CC7','ARCHIVED','2020-11-18 00:14:39',11),('2020_09_17_00_auth.sql','BBC0A8B2BBED38A57A83999909EB066753A893C5','ARCHIVED','2020-11-18 00:14:39',38),('2020_10_15_00_auth.sql','8A79DE7DBDF35EBDA5C261BEBF9BC8E5CFF816CE','ARCHIVED','2020-11-18 00:14:39',10),('2020_11_16_00_auth.sql','C0E1AAA8876DB65B2B2FA0AFD5D6CDF233020D37','RELEASED','2020-11-18 00:14:39',12);
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates_include`
--

DROP TABLE IF EXISTS `updates_include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates_include`
--

LOCK TABLES `updates_include` WRITE;
/*!40000 ALTER TABLE `updates_include` DISABLE KEYS */;
INSERT INTO `updates_include` VALUES ('$/sql/updates/auth','RELEASED'),('$/sql/custom/auth','RELEASED'),('$/sql/old/3.3.5a/auth','ARCHIVED');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `uptime` int(10) unsigned NOT NULL DEFAULT 0,
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT 0,
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uptime`
--

LOCK TABLES `uptime` WRITE;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` VALUES (1,1518223945,0,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518225403,0,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518226328,12614,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518239379,31214,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518271111,14415,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518286205,0,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518286408,68417,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518355421,226222,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518582363,2495,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518611442,42678,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518655737,676,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518656771,97215,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518754635,0,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1518754992,268276,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1519023282,0,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1519023778,1998029,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1521022240,136334,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1521159059,2242337,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1523401710,103935,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1523505995,420123,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1523926654,0,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1524321529,1127570,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1525465295,364323,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1525839060,75136,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1525914721,9704,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1525924941,25317,0,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1526075600,485516,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1526591066,396737,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1526990979,513755,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1527505389,1089768,2,'TrinityCore rev. 4ade7a3b8013 2018-02-01 22:52:09 -0500 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1528762869,4919,2,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1528926082,8585,0,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1528935234,75682,1,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1529011475,151358,2,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1529163275,85312,2,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1529249124,508909,2,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1529758626,105151,2,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1529864220,860572,0,'TrinityCore rev. 844e6d125192+ 2018-06-09 22:32:45 -0400 (LocalEluna branch) (Win64, RelWithDebInfo, Static)'),(1,1531099319,1309,0,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531102578,0,0,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531264240,80530,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531345305,85984,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531431666,108174,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531541184,42686,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531668657,27100,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531707202,1931,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1531709718,518426,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532228392,4320,1,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532232779,78621,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532311752,160309,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532472797,9764,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532484986,66036,0,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532551632,136861,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532689162,211951,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1532946412,139937,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533158215,13972,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533176194,1376,0,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533204831,126665,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533332633,97328,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533474228,37960,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533522717,76333,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533684148,9768,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533697050,32512,0,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1533729718,309771,2,'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, RelWithDebInfo, Static)'),(1,1534042780,325911,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1534369234,86020,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1534455913,225818,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1534682184,219134,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1534902400,175972,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1535078965,136426,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1535215567,32619,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1535248374,206003,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1535454716,35009,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1535490022,359472,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1535850041,43379,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536417969,0,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536496622,7387,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536504545,126057,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536631085,76937,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536708466,79264,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536788232,17002,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536810029,64942,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536875177,86002,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1536962191,95559,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537058235,53531,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537112369,30749,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537148000,96740,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537245952,22972,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537269315,46823,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537317493,2553,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537320504,77425,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537406623,2556,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537409469,86548,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537496519,155562,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537652269,9158,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537661932,45746,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537709381,1349,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537711194,39667,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537751268,3746,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537756063,0,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537757421,79353,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537837022,6132,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537843941,30753,0,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537875397,45774,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1537929245,86589,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1538018386,78787,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1538097254,79344,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1538177082,8538,2,'TrinityCore rev. 193ca36ccc00 2018-08-11 21:39:43 -0400 (external/mod_3.3.5_external branch) (Win64, RelWithDebInfo, Static)'),(1,1538188827,700,0,'TrinityCore rev. 4916571df5de 2018-08-11 21:38:16 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1538189708,948149,2,'TrinityCore rev. 4916571df5de 2018-08-11 21:38:16 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539139587,67908,0,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539207859,95595,2,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539303985,12098,1,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539316621,63626,2,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539380766,189727,2,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539574526,78114,2,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539754707,0,0,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539755370,65429,1,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1539821279,765,1,'TrinityCore rev. 4577819c8a3b 2018-10-09 21:32:40 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540132465,3750,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540136726,3625,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540140517,30631,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540171540,3687,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540175802,82223,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540258490,0,0,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540258798,2427,1,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540261236,741,1,'TrinityCore rev. da24eb749290 2018-10-15 00:23:17 +0200 (3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540262122,85383,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540347852,87750,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540435750,78138,1,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540514222,730,1,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540515194,2422,1,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540517926,1225,1,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540521227,87622,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540609242,40930,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540650244,41435,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540692264,43312,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540735994,0,0,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540736578,18173,2,'TrinityCore rev. da24eb749290 2018-10-15 00:23:17 +0200 (3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540755181,0,0,'TrinityCore rev. da24eb749290+ 2018-10-15 00:23:17 +0200 (3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540755401,0,0,'TrinityCore rev. da24eb749290+ 2018-10-15 00:23:17 +0200 (3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540756042,5527,2,'TrinityCore rev. e73012fa13ab 2018-10-21 10:09:20 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540761984,16923,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1540779272,473528,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1541253047,1433625,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1542687120,69830,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1542757792,918830,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1543676965,200620,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1543878319,446610,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1544325430,49425,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1544376238,277329,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1544654087,642234,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1545296596,196417,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1545590335,1506154,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1547096811,1877645,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1548974673,1122813,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1550097772,86031,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1550183953,1254212,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1551438522,114855,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1551558512,2561,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553119817,0,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553215908,234814,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553450817,33151,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553511579,88332,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553648426,37387,2,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553686397,37937,0,'TrinityCore rev. 9034e6d37b88 2018-10-25 22:25:54 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553736571,75771,2,'TrinityCore rev. 20f2c59e210d+ 2019-03-26 17:10:17 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1553813677,1118530,2,'TrinityCore rev. 20f2c59e210d+ 2019-03-26 17:10:17 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1554936666,81783,2,'TrinityCore rev. 20f2c59e210d+ 2019-03-26 17:10:17 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1555019057,1354975,2,'TrinityCore rev. 20f2c59e210d+ 2019-03-26 17:10:17 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1556374612,1337,2,'TrinityCore rev. 20f2c59e210d+ 2019-03-26 17:10:17 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1556375957,805231,4,'TrinityCore rev. 20f2c59e210d+ 2019-03-26 17:10:17 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1557454111,340459,2,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1558179864,206024,2,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1558820783,270816,2,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1559091964,0,0,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1559092439,632,1,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1559093743,0,0,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1559094315,85230,1,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1559432540,265441,2,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1559781217,84238,2,'TrinityCore rev. 7e2754c71e1c+ 2019-05-08 19:58:04 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1560027040,149622,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1560200788,66879,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1560728085,180190,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1560908481,1564518,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1562473881,839087,0,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1566045478,2299419,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1568507252,860053,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1569374074,852225,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1570236225,399887,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1570667389,1086837,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1574492165,1734238,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1576279061,874425,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1577154224,7383,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1577161731,122558,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1577284681,176557,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1577461432,605552,2,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1578067537,0,0,'TrinityCore rev. d6f3ac350461 2019-06-08 16:05:03 -0400 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1578098302,1056156,2,'TrinityCore rev. 6cdad0638f9f+ 2019-12-25 09:38:36 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1579220392,2163239,2,'TrinityCore rev. 6cdad0638f9f+ 2019-12-25 09:38:36 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1581383741,422041,2,'TrinityCore rev. 6cdad0638f9f+ 2019-12-25 09:38:36 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1581815557,266638,2,'TrinityCore rev. 6cdad0638f9f+ 2019-12-25 09:38:36 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1582082389,597223,2,'TrinityCore rev. 6cdad0638f9f+ 2019-12-25 09:38:36 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583033937,48137,2,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583082089,1825,0,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583084137,0,0,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583084517,0,0,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583084683,0,0,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583084825,6017,1,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583091226,614,1,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583092568,108615,2,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583201553,82830,2,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583286838,83437,2,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1583371629,597637,2,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1584195712,976408,2,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1585221979,477043,2,'TrinityCore rev. 3b9223416dc5 2020-02-29 17:21:49 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1585761973,21290049,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1589853934,0,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1589854197,0,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1589854294,2408,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1589857239,0,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1589857478,0,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1589857532,0,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1589857784,50410,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1589988523,31230,0,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590019766,0,0,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590020466,0,0,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590020862,1219,0,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590027101,0,0,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590110345,5421,1,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590115826,0,0,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590116115,76825,2,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590192955,0,0,'TrinityCore rev. cc5bea023a0c 2020-05-19 23:06:05 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590193317,1210,2,'TrinityCore rev. 7e0b379f08eb 2020-05-21 21:17:55 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590194680,3065,0,'TrinityCore rev. 7e0b379f08eb 2020-05-21 21:17:55 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590198055,0,0,'TrinityCore rev. 7e0b379f08eb 2020-05-21 21:17:55 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590198355,96019,2,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1590294605,728461,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1591023742,7339,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1591031195,510733,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1591542001,600029,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1592142268,16376,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1592159933,8633,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1592170748,190993,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1592361864,495045,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1592857392,1184560,1,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1594042411,690232,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1594733257,217412,0,'TrinityCore rev. 356c31516548 2020-05-22 21:06:36 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1595201066,3064,1,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1595204345,6035,1,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1595211783,253997,2,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1595466068,349248,3,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1595815635,418351,1,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1596234753,5866642,4,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1602111841,3474161,0,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1605586425,72182,0,'TrinityCore rev. 6aa3551b652e 2020-07-19 16:45:05 -0400 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1605710298,47038,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1605757617,117140,0,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1605876105,99033,0,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (mod_3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(1,1606023648,42641,1,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1606066931,0,0,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1606067847,0,0,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1606184246,383456,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1607052693,69947,0,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1607125366,491551,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1607643789,45771,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1607736863,103961,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1607841124,574222,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1608415534,139816,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1608555608,2557,0,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1608558650,384608,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1608943277,655,1,'TrinityCore rev. f687162640eb 2020-12-25 13:54:24 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1608954440,0,0,'TrinityCore rev. eca9986e696a 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1608955592,11418,1,'TrinityCore rev. eca9986e696a 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1608967130,28214,1,'TrinityCore rev. eca9986e696a+ 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1608995869,384614,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1609009896,0,0,'TrinityCore rev. eca9986e696a 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609010253,0,0,'TrinityCore rev. eca9986e696a+ 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609010865,0,0,'TrinityCore rev. eca9986e696a+ 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609026660,0,0,'TrinityCore rev. eca9986e696a+ 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609026942,0,0,'TrinityCore rev. eca9986e696a+ 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609163294,0,0,'TrinityCore rev. eca9986e696a+ 2020-12-25 21:00:07 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609165184,7826,1,'TrinityCore rev. 02e65f4adc11+ 2020-12-27 09:03:16 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609173611,1234,2,'TrinityCore rev. dd5a436b2091+ 2020-12-28 09:39:27 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609198375,0,0,'TrinityCore rev. 4f3ee8ea096b+ 2020-12-28 14:02:58 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609208081,628,1,'TrinityCore rev. 5545fce196ef 2020-12-28 20:40:41 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609270301,0,0,'TrinityCore rev. f392fdf5d64f 2020-12-29 14:06:49 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609270693,0,0,'TrinityCore rev. f392fdf5d64f+ 2020-12-29 14:06:49 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609286215,2431,2,'TrinityCore rev. f392fdf5d64f+ 2020-12-29 14:06:49 -0500 (feature/SolocraftPetVASMaxDamage branch) (Win64, RelWithDebInfo, Static)'),(1,1609380528,103213,2,'TrinityCore rev. bf649c3c0f2f 2020-11-17 23:28:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1609483758,73821,2,'TrinityCore rev. b44fb479719d 2020-12-30 21:32:55 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1609557702,2412,1,'TrinityCore rev. b44fb479719d 2020-12-30 21:32:55 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1609560510,1208,1,'TrinityCore rev. b44fb479719d 2020-12-30 21:32:55 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1609561988,90008,2,'TrinityCore rev. b44fb479719d 2020-12-30 21:32:55 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1609644136,665,1,'TrinityCore rev. b44fb479719d+ 2020-12-30 21:32:55 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1609652335,291623,2,'TrinityCore rev. 28cae59be371 2021-01-02 23:03:52 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1609944706,463822,2,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1610290656,747,2,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (mod_3.3.5 branch) (Win64, RelWithDebInfo, Static)'),(1,1610413312,0,0,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1610413513,82810,2,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1610496720,699010,2,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1611196079,162747,2,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1611358997,622350,2,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1611981993,131546,4,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1612113702,10305,0,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(1,1612136075,574253,2,'TrinityCore rev. 92b63eca773e 2021-01-06 09:47:34 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1585761973,21144850,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1589908485,28210,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1589936861,7252,1,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1589944653,75018,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1590019767,635,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1590020862,173428,1,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1590194681,99664,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1590294605,728461,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1591023743,7338,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1591031195,1110727,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1592142270,16373,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1592159936,8676,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1592170751,140606,0,'TrinityCore rev. ee55b16abc60 2020-02-25 12:26:31 +0100 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1592311378,545476,1,'TrinityCore rev. 3e7b0d6c05b2 2020-06-15 07:50:01 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1592857392,1184662,0,'TrinityCore rev. 3e7b0d6c05b2 2020-06-15 07:50:01 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1594042410,485621,0,'TrinityCore rev. 3e7b0d6c05b2 2020-06-15 07:50:01 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1594529435,39647,0,'TrinityCore rev. 3e7b0d6c05b2 2020-06-15 07:50:01 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1594574049,158455,0,'TrinityCore rev. 3e7b0d6c05b2 2020-06-15 07:50:01 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1594733257,44570,0,'TrinityCore rev. 3e7b0d6c05b2 2020-06-15 07:50:01 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1594777989,38474,0,'TrinityCore rev. 9fe6756cf26e 2020-07-14 23:15:33 +0200 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1594816661,223833,1,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595041414,169482,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595211783,300799,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595512549,0,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595515758,623,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595516558,31221,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595547804,0,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595547880,267623,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1595815635,418346,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1596234753,107743,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1596343040,0,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1596343249,5758232,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1602111848,3467528,0,'TrinityCore rev. d974800e9d1e 2020-07-15 10:37:16 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605658474,49984,1,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605709067,48305,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605757622,84933,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605853513,31876,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605885974,0,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605890179,2375,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605893296,38687,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605935478,0,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605944698,976,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605946543,1600,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1605950057,24954,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (3.3.5 branch) (Unix, RelWithDebInfo, Static)'),(2,1606016925,0,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1606017170,610,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1606017794,48615,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1606066911,0,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1606184243,383459,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1606907493,144809,1,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1607052694,69945,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1607125366,491551,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1607643789,45771,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1607736864,677560,1,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1608414939,140431,1,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1608555603,125562,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1608681357,1837,1,'TrinityCore rev. ba4b640ffa3a 2020-12-22 07:28:08 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1608683653,42616,1,'TrinityCore rev. ba4b640ffa3a 2020-12-22 07:28:08 -0500 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1608726414,1686063,1,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1610412607,783019,0,'TrinityCore rev. e6b945eabcde 2020-11-16 13:39:40 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1611196079,162331,0,'TrinityCore rev. 0b7b7f10f90e 2021-01-15 08:31:35 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1611358998,622356,0,'TrinityCore rev. 0b7b7f10f90e 2021-01-15 08:31:35 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1611981993,131546,0,'TrinityCore rev. 0b7b7f10f90e 2021-01-15 08:31:35 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1612113703,10334,0,'TrinityCore rev. 0b7b7f10f90e 2021-01-15 08:31:35 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)'),(2,1612124704,585138,0,'TrinityCore rev. 0b7b7f10f90e 2021-01-15 08:31:35 +0000 (HEAD branch) (Unix, RelWithDebInfo, Static)');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_log_history`
--

DROP TABLE IF EXISTS `vw_log_history`;
/*!50001 DROP VIEW IF EXISTS `vw_log_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_log_history` (
  `First Logged` tinyint NOT NULL,
  `Last Logged` tinyint NOT NULL,
  `Occurrences` tinyint NOT NULL,
  `Realm` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `string` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_log_history`
--

/*!50001 DROP TABLE IF EXISTS `vw_log_history`*/;
/*!50001 DROP VIEW IF EXISTS `vw_log_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`trinity`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_log_history` AS (select from_unixtime(min(`logs`.`time`)) AS `First Logged`,from_unixtime(max(`logs`.`time`)) AS `Last Logged`,count(0) AS `Occurrences`,`realmlist`.`name` AS `Realm`,`logs`.`type` AS `type`,`logs`.`level` AS `level`,`logs`.`string` AS `string` from (`logs` left join `realmlist` on(`logs`.`realm` = `realmlist`.`id`)) group by `logs`.`string`,`logs`.`type`,`logs`.`realm`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-07 10:06:22
