-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: thaueastlhs01-dev.hosting.xuridisa.com    Database: leopardcoachlines_db
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,5),(2,31);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_posted` datetime DEFAULT NULL,
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,'2018-03-01 00:00:00',4),(2,'2018-03-01 00:00:00',32),(3,'2018-04-02 00:00:00',35),(4,'2018-04-03 00:00:00',36),(5,'2018-04-04 00:00:00',37),(6,'2018-04-05 00:00:00',38),(7,'0000-00-00 00:00:00',44);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_has_category`
--

DROP TABLE IF EXISTS `blog_post_has_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_has_category` (
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_has_category`
--

LOCK TABLES `blog_post_has_category` WRITE;
/*!40000 ALTER TABLE `blog_post_has_category` DISABLE KEYS */;
INSERT INTO `blog_post_has_category` VALUES (1,1),(1,2),(2,2),(1,3),(2,3),(1,4),(2,4),(1,5),(2,5),(1,6),(2,6);
/*!40000 ALTER TABLE `blog_post_has_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_accessgroups`
--

DROP TABLE IF EXISTS `cms_accessgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_accessgroups` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_name` varchar(100) NOT NULL,
  `access_users` char(1) NOT NULL DEFAULT 'N',
  `access_userpasswords` char(1) NOT NULL DEFAULT 'N',
  `access_useraccesslevel` char(1) NOT NULL DEFAULT 'N',
  `access_accessgroups` char(1) NOT NULL DEFAULT 'N',
  `access_cmssettings` char(1) NOT NULL DEFAULT 'N',
  `access_settings` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`access_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_accessgroups`
--

LOCK TABLES `cms_accessgroups` WRITE;
/*!40000 ALTER TABLE `cms_accessgroups` DISABLE KEYS */;
INSERT INTO `cms_accessgroups` VALUES (1,'Super Administrator','Y','Y','Y','Y','Y','Y'),(2,'General Editor','Y','Y','N','N','N','Y');
/*!40000 ALTER TABLE `cms_accessgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blacklist_user`
--

DROP TABLE IF EXISTS `cms_blacklist_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blacklist_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_failed_attempt_on` datetime DEFAULT NULL,
  `failed_login_attempt_count` int(11) NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `disabled_on` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `recent_login_attempt_on` datetime DEFAULT NULL,
  `failed_hour_count` int(11) NOT NULL,
  `total_failed_attempt` int(11) NOT NULL,
  `is_notified` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blacklist_user`
--

LOCK TABLES `cms_blacklist_user` WRITE;
/*!40000 ALTER TABLE `cms_blacklist_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blacklist_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_login_attempt`
--

DROP TABLE IF EXISTS `cms_login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_login_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` tinyblob NOT NULL,
  `access_key` tinyblob,
  `is_successful` enum('N','Y') NOT NULL DEFAULT 'N',
  `ip_address` varchar(255) NOT NULL,
  `record_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_login_attempt`
--

LOCK TABLES `cms_login_attempt` WRITE;
/*!40000 ALTER TABLE `cms_login_attempt` DISABLE KEYS */;
INSERT INTO `cms_login_attempt` VALUES (1,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2016-07-21 16:32:05'),(2,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2016-07-22 08:45:25'),(3,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2016-11-14 12:02:00'),(4,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2016-12-05 13:12:05'),(5,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2016-12-06 09:38:02'),(6,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2016-12-07 08:49:19'),(7,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2016-12-08 09:43:35'),(8,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','Y7£∆å\‚\Àv˘$üZÚ¨\‹\0','N','127.0.0.1','2018-02-28 02:27:31'),(9,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-02-28 02:27:56'),(10,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','127.0.0.1','2018-03-07 10:31:31'),(11,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 00:56:55'),(12,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 01:03:31'),(13,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 01:59:05'),(14,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 02:32:55'),(15,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 04:04:58'),(16,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','222.153.120.115','2018-03-08 18:26:35'),(17,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 19:43:41'),(18,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 19:55:57'),(19,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 19:59:08'),(20,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-08 23:11:25'),(21,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-09 01:45:43'),(22,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-09 03:43:27'),(23,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','122.57.183.138','2018-03-10 01:59:45'),(24,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-11 21:14:15'),(25,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-12 01:32:24'),(26,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-13 02:05:57'),(27,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-14 02:42:49'),(28,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-14 03:11:53'),(29,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','122.57.20.160','2018-03-14 19:32:56'),(30,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-14 21:24:33'),(31,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-14 21:24:49'),(32,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-15 00:51:42'),(33,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-03-27 02:06:35'),(34,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-23 02:19:38'),(35,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','103.43.207.11','2018-04-23 02:44:04'),(36,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-24 01:40:41'),(37,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-24 01:44:11'),(38,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-24 01:44:51'),(39,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-04-24 04:44:58'),(40,']\ŸF\÷@)\÷.\’	?ì\Ô\Õ¯∏\Ã~Ω®Dûnûì˘M≤5k','´)˚\Ó\ \Ì~\\ºÖu:ù\ ','Y','114.23.241.67','2018-05-24 02:11:31');
/*!40000 ALTER TABLE `cms_login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_settings`
--

DROP TABLE IF EXISTS `cms_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_settings` (
  `cmsset_id` int(11) NOT NULL AUTO_INCREMENT,
  `cmsset_name` varchar(100) NOT NULL,
  `cmsset_label` varchar(50) NOT NULL,
  `cmsset_explanation` varchar(255) NOT NULL,
  `cmsset_status` char(1) NOT NULL DEFAULT 'I',
  `cmsset_value` varchar(255) NOT NULL,
  PRIMARY KEY (`cmsset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_settings`
--

LOCK TABLES `cms_settings` WRITE;
/*!40000 ALTER TABLE `cms_settings` DISABLE KEYS */;
INSERT INTO `cms_settings` VALUES (10,'pages_maximum','Page Limit','','I','12'),(2,'pages_generations','Page Generation Limit','The number of levels of children pages that are allowed to be made.','A','5');
/*!40000 ALTER TABLE `cms_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_users`
--

DROP TABLE IF EXISTS `cms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for user',
  `user_fname` varchar(45) DEFAULT NULL COMMENT 'User''s firstname',
  `user_lname` varchar(45) DEFAULT NULL COMMENT 'User''s lastname',
  `user_pass` varchar(255) DEFAULT NULL COMMENT 'User''s password (recommended as being sha256)',
  `user_email` varchar(100) DEFAULT NULL COMMENT 'User''s email address',
  `user_photo_path` varchar(255) DEFAULT NULL,
  `user_thumb_path` varchar(255) DEFAULT NULL,
  `user_introduction` text,
  `social_links` text,
  `last_login_date` datetime DEFAULT NULL,
  `access_id` int(11) DEFAULT '1' COMMENT 'User''s rights - whether they are admin, banned, general user etc. This is totally customisable and is up to the programmer.',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_users`
--

LOCK TABLES `cms_users` WRITE;
/*!40000 ALTER TABLE `cms_users` DISABLE KEYS */;
INSERT INTO `cms_users` VALUES (1,'Website','Admin','9bc129f7a46381be15f1329c4479e02c70d10d19','support@tomahawk.co.nz','/library/authors/dexter.jpg','/uploads/2015/11/img-563c1e061f186.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident nobis distinctio optio quam modi ipsa. Officia itaque tempore dignissimos, mollitia deserunt adipisci aspernatur voluptatem, assumenda a, alias voluptates ea reiciendis.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident nobis distinctio optio quam modi ipsa. Officia itaque tempore dignissimos, mollitia deserunt adipisci aspernatur voluptatem, assumenda a, alias voluptates ea reiciendis.</p>','a:3:{s:11:\"google_plus\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Google+\";}s:8:\"facebook\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:8:\"Facebook\";}s:7:\"twitter\";a:2:{s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Twitter\";}}','2018-05-24 02:11:31',1);
/*!40000 ALTER TABLE `cms_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_column`
--

DROP TABLE IF EXISTS `content_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_column` (
  `content` text NOT NULL,
  `css_class` varchar(255) NOT NULL,
  `span` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `content_row_id` int(11) NOT NULL,
  KEY `content_row_id` (`content_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_column`
--

LOCK TABLES `content_column` WRITE;
/*!40000 ALTER TABLE `content_column` DISABLE KEYS */;
INSERT INTO `content_column` VALUES ('<p>school groups</p>','col-xs-12',0,1,53),('<p>Column 1</p>','col-xs-12',0,1,95),('<p>Column 1</p>','col-xs-12',0,1,114),('<p><img alt=\"\" src=\"/library/about.jpg\" /></p>','col-xs-12 col-sm-6 col-md-6',0,1,115),('<p>Column 2</p>','col-xs-12 col-sm-6 col-md-6',0,2,115),('<p>Column 1</p>','col-xs-12',0,1,126),('<p>Column 1</p>','col-xs-12 col-sm-6 col-md-6',0,1,127),('<p>Column 2</p>','col-xs-12 col-sm-6 col-md-6',0,2,127),('<p>Column 1</p>','col-xs-12 col-sm-6 col-md-4',0,1,128),('<p>Column 2</p>','col-xs-12 col-sm-6 col-md-4',0,2,128),('<p>Column 3</p>','col-xs-12 col-sm-6 col-md-4',0,3,128),('<p><img alt=\"\" src=\"/library/about.jpg\" /></p>','col-xs-12 col-sm-6 col-md-3',0,1,129),('<p>Column 2</p>','col-xs-12 col-sm-6 col-md-3',0,2,129),('<p>Column 3</p>','col-xs-12 col-sm-6 col-md-3',0,3,129),('<p>Column 4</p>','col-xs-12 col-sm-6 col-md-3',0,4,129),('<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.</p>','col-xs-12',0,1,131),('<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.</p>','col-xs-12',0,1,132),('<p>Lorem&nbsp;Ipsum&nbsp;has been the industry&#39;s standard dummy text ever since the&nbsp;1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>','col-xs-12',0,1,179),('<p>We offer a wide range of options for group travelers wanting to get around New Zealand. Five Star luxury coaches and Four Star deluxe coaches are ideal for transporting tour groups in comfort on their New Zealand bus tours, plus we have a range of buses ideal for school charters, or getting your sports group or travel club across the city or around New Zealand.</p>','col-xs-12',0,1,182),('','col-xs-12 col-sm-6 col-md-6',0,1,187),('','col-xs-12 col-sm-6 col-md-6',0,2,187),('','col-xs-12 col-sm-6 col-md-6',0,1,188),('','col-xs-12 col-sm-6 col-md-6',0,2,188);
/*!40000 ALTER TABLE `content_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_row`
--

DROP TABLE IF EXISTS `content_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_meta_data_id` (`page_meta_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_row`
--

LOCK TABLES `content_row` WRITE;
/*!40000 ALTER TABLE `content_row` DISABLE KEYS */;
INSERT INTO `content_row` VALUES (53,1,13),(95,1,40),(114,1,27),(115,2,27),(126,1,39),(127,2,39),(128,3,39),(129,4,39),(131,1,45),(132,1,46),(179,1,41),(182,1,2),(187,1,14),(188,2,14);
/*!40000 ALTER TABLE `content_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `contact_info` varchar(255) NOT NULL,
  `message` text,
  `status` enum('A','H','D') NOT NULL DEFAULT 'H',
  `date_of_enquiry` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry`
--

LOCK TABLES `enquiry` WRITE;
/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `enquiry` VALUES (34,'Test','1234','Test Subject','alan@tomahawk.co.nz','Testing Chrome','D','2017-12-12 20:45:38','114.23.241.67'),(35,'Test','1234','Test Subject','alan@tomahawk.co.nz','Testing iPad','D','2017-12-13 00:03:57','114.23.241.67'),(53,'wqdwqd qdwqdasd','1231231','qdqwdqdqd','asdad@asdad.com','wefwfwefwf','A','2018-03-08 20:43:40','127.0.0.1'),(52,'wqdwqd qdwqdasd','1231231','qdqwdqdqd','asdad@asdad.com','wefwfwefwf','A','2018-03-08 20:43:16','127.0.0.1'),(51,'jed diaz','1231','qwdqdwqd','test123@test.com','fwefwfwef','A','2018-03-08 20:43:01','127.0.0.1'),(50,'jed diaz','1231','qwdqdwqd','test123@test.com','fwefwfwef','A','2018-03-08 20:42:32','127.0.0.1'),(49,'jed diaz','1231','qwdqdwqd','test123@test.com','fwefwfwef','A','2018-03-08 20:42:22','127.0.0.1'),(48,'jed diaz','1231','qwdqdwqd','test123@test.com','fwefwfwef','A','2018-03-08 20:41:47','127.0.0.1'),(47,'Emma test','','Australia','emma@tomahawk.co.nz','test','A','2018-01-12 10:50:33','114.23.241.67'),(54,'Sean Li','123213123','test subject','test@email.com','test description','A','2018-03-09 09:51:29','114.23.241.67'),(55,'Michelle Assunta','12313','test subject','test@email.com','test description','A','2018-03-09 09:54:59','114.23.241.67'),(56,'Chrome Test','1234','Test','alan@tomahawk.co.nz','Tomahawk testing. please ignore.','D','2018-03-09 10:50:18','114.23.241.67'),(57,'Android test','1234','test','alan@tomahawk.co.nz','tomahawk testing. please ignore','D','2018-03-09 15:15:16','194.165.161.251'),(58,'Ipad Test','1234','Test test. Please ignore','alan@tomahawk.co.nz','Test please ignore','D','2018-03-09 15:23:19','114.23.241.67'),(59,'Firefox Test','124','test','alan@tomahawk.co.nz','testing. please ignore','D','2018-03-09 15:29:47','114.23.241.67'),(60,'Edge Test','1234','Edge Test','alan@tomahawk.co.nz','testing please ignore','D','2018-03-09 15:32:18','114.23.241.67'),(61,'IE test','1234','test','alan@tomahawk.co.nz','tomahawk testing. please ignore.','D','2018-03-09 15:35:12','114.23.241.67'),(62,'Safari Test','1234','test','alan@tomahawk.co.nz','testing. please ignore,','D','2018-03-09 15:39:56','114.23.241.67'),(63,'Chrome Test','1234','bmw limousines','alan@tomahawk.co.nz','Tomahawk testing. Please ignore.','D','2018-03-14 15:44:57','114.23.241.67'),(64,'asd s','1','bmw limousines','123@qq.com','1','A','2018-03-14 16:21:42','114.23.241.67'),(65,'Chrome Test','1234','bmw limousines','alan@tomahawk.co.nz','Tomahawk testing. Please ignore.','D','2018-03-14 16:26:03','114.23.241.67'),(66,'s asd','123','sa','21123@QQ.COM','asd','A','2018-03-14 16:35:03','114.23.241.67'),(67,'Chrome Test','1234','bmw limousines','alan@tomahawk.co.nz','Tomahawk testing. Please ignore.','D','2018-03-15 10:35:11','114.23.241.67');
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet`
--

DROP TABLE IF EXISTS `fleet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fleet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `features` mediumtext,
  `page_meta_data_id` int(11) DEFAULT NULL COMMENT 'Foreign Key to page meta data for the id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet`
--

LOCK TABLES `fleet` WRITE;
/*!40000 ALTER TABLE `fleet` DISABLE KEYS */;
INSERT INTO `fleet` VALUES (1,'<ul>\r\n	<li>Full luxury spetcification including:\r\n	<ul>\r\n		<li>Leather trim</li>\r\n		<li>&nbsp;Rear seat phone and audio controls</li>\r\n		<li>Rear seat foot rests</li>\r\n		<li>Tinted rear glass for privacy</li>\r\n		<li>Full climate control from both front &amp; rear seats</li>\r\n		<li>Driver control suspension with comfort, normal and sport settings</li>\r\n	</ul>\r\n	</li>\r\n	<li>Ex-Crown VIP cars</li>\r\n	<li>Silver with cream interiors</li>\r\n	<li>BMW 730 long wheelbase</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>',15),(2,'<ul>\r\n	<li>13 seats plus driver</li>\r\n	<li>V6 diesel 7 speed auto</li>\r\n	<li>Latest European low emission engine</li>\r\n	<li>Full safety system, lane assist, anti-skid traction control,&nbsp;<br />\r\n	&nbsp; &nbsp;ABS, brake force assist</li>\r\n	<li>&nbsp;FClimate air-conditioning front and rear with individual&nbsp;<br />\r\n	&nbsp; &nbsp;vents and controls for each passenger</li>\r\n	<li>Radio/CD and PA system</li>\r\n</ul>',18),(3,'<ul>\r\n	<li>Full luxury spetcification including:\r\n	<ul>\r\n		<li>Leather trim</li>\r\n		<li>&nbsp;Rear seat phone and audio controls</li>\r\n		<li>Rear seat foot rests</li>\r\n		<li>Tinted rear glass for privacy</li>\r\n		<li>Full climate control from both front &amp; rear seats</li>\r\n		<li>Driver control suspension with comfort, normal and sport settings</li>\r\n	</ul>\r\n	</li>\r\n	<li>Ex-Crown VIP cars</li>\r\n	<li>Silver with cream interiors</li>\r\n	<li>BMW 730 long wheelbase</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>',29),(4,'<ul>\r\n	<li>13 seats plus driver</li>\r\n	<li>V6 diesel 7 speed auto</li>\r\n	<li>Latest European low emission engine</li>\r\n	<li>Full safety system, lane assist, anti-skid traction control, ABS, brake force assist</li>\r\n	<li>&nbsp;Climate air-conditioning front and rear with individual vents and controls for each passenger</li>\r\n	<li>Radio/CD and PA system</li>\r\n	<li>Overhead luggage/coat racks</li>\r\n	<li>Individual lighting at each passenger seat and LED lighting inside at night</li>\r\n	<li>Full reclining leather setting with tray tables, full seat belted</li>\r\n	<li>Individual USB charging plugs at each seat and 4 x240 Volt plugs for laptop charging</li>\r\n	<li>Auto passenger door and step controlled from driver&#39;s seat, and side at the rear and outside by use of the handle.</li>\r\n	<li>Coach can move away while door is still closing (useful in motorcades)</li>\r\n	<li>Fully trimmed and lined rear luggage compartment (no trailer) with dedicated suit hanger and additional shelf for light items</li>\r\n	<li>Umbrella stand also in rear luggage compartment</li>\r\n	<li>Dark tinted privacy glass</li>\r\n</ul>',30),(5,'<ul>\r\n	<li>test</li>\r\n	<li>test</li>\r\n	<li>test</li>\r\n	<li>test</li>\r\n	<li>test</li>\r\n	<li>test</li>\r\n	<li>test</li>\r\n</ul>',34),(6,'<ul>\r\n	<li>Large tinted windows for panoramic views</li>\r\n	<li>&lsquo;Kneeling&rsquo; suspension, which lowers the front of the coach to kerbside for easy access</li>\r\n	<li>Gently sloping floor for improved accessibility and theatre-style viewing</li>\r\n	<li>On-board video monitors</li>\r\n	<li>Entertainment systems</li>\r\n	<li>Full-fabric designer interior to create a relaxing ambiance</li>\r\n	<li>Reclining seats and safety belts</li>\r\n	<li>Fully air-conditioned with personal vent controls</li>\r\n	<li>Huge storage space with central air-locking for security</li>\r\n	<li>Air-bag suspension for a comfortable ride</li>\r\n	<li>Two entry/exit doors and toilet facilities are available on some Four Star coaches</li>\r\n</ul>',52),(7,'<ul>\r\n	<li>Large tinted windows for panoramic views</li>\r\n	<li>Kneeling suspension, which lowers the front of the coach to the kerbside for easy access</li>\r\n	<li>Gently sloping floor for improved accessibility and theatre-style viewing</li>\r\n	<li>On-board video monitors</li>\r\n	<li>Entertainment systems</li>\r\n	<li>Full-fabric designer interior to create a relaxing ambiance</li>\r\n	<li>Reclining seats and safety belts</li>\r\n	<li>Fully air-conditioned with personal vent controls</li>\r\n	<li>Toilet and washroom</li>\r\n	<li>Water drinking fountain and/or fridge</li>\r\n	<li>Huge storage space with central air-locking for security</li>\r\n	<li>Air-bag suspension for a comfortable ride</li>\r\n	<li>2 doors for improved access</li>\r\n	<li>All our Five Star coaches are newer than five years old.</li>\r\n</ul>',53);
/*!40000 ALTER TABLE `fleet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_importantpages`
--

DROP TABLE IF EXISTS `general_importantpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_importantpages` (
  `imppage_id` int(11) NOT NULL AUTO_INCREMENT,
  `imppage_name` varchar(150) NOT NULL,
  `page_id` int(11) NOT NULL,
  `imppage_showincms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `is_mobile` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`imppage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_importantpages`
--

LOCK TABLES `general_importantpages` WRITE;
/*!40000 ALTER TABLE `general_importantpages` DISABLE KEYS */;
INSERT INTO `general_importantpages` VALUES (1,'Home',1,'N',0),(2,'404',13,'Y',0),(3,'Reviews',0,'Y',0),(4,'Contact',14,'Y',0),(5,'Blog',0,'Y',0),(6,'Services',2,'Y',0),(7,'Fleet',6,'Y',0),(8,'Gallery',0,'Y',0);
/*!40000 ALTER TABLE `general_importantpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_pages`
--

DROP TABLE IF EXISTS `general_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for pages',
  `access_level` enum('P','L') NOT NULL DEFAULT 'P' COMMENT 'P = Public, L = Private',
  `meta_cache` tinyint(1) NOT NULL DEFAULT '1',
  `slideshow_type` enum('C','D') NOT NULL DEFAULT 'D',
  `parent_id` int(11) DEFAULT '0',
  `template_id` int(11) DEFAULT NULL,
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_parent` (`parent_id`),
  KEY `page_meta_data_id` (`page_meta_data_id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_pages`
--

LOCK TABLES `general_pages` WRITE;
/*!40000 ALTER TABLE `general_pages` DISABLE KEYS */;
INSERT INTO `general_pages` VALUES (1,'P',1,'D',0,1,1),(2,'P',1,'D',0,1,2),(3,'P',1,'D',2,1,3),(4,'P',1,'D',2,1,15),(5,'P',1,'D',2,1,16),(6,'P',1,'D',0,1,17),(7,'P',1,'D',0,1,18),(8,'P',1,'D',7,1,19),(9,'P',1,'D',7,1,20),(10,'P',1,'D',7,1,21),(11,'P',1,'D',0,1,25),(12,'P',1,'D',11,1,27),(13,'P',1,'D',0,1,28),(14,'P',1,'D',0,1,33),(15,'P',1,'D',7,1,41),(16,'P',1,'D',11,1,42),(17,'P',1,'D',11,1,43),(18,'P',1,'D',0,1,47),(19,'P',1,'D',7,1,48),(20,'P',1,'D',18,1,49),(21,'P',1,'D',18,1,51),(22,'P',1,'D',18,1,54),(23,'P',1,'D',0,NULL,55);
/*!40000 ALTER TABLE `general_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL COMMENT 'Company/Business/Website name	',
  `start_year` int(4) DEFAULT NULL,
  `email_address` text COMMENT 'Email Address',
  `phone_number` varchar(100) DEFAULT NULL,
  `address` text,
  `booking_url` varchar(255) DEFAULT NULL,
  `js_code_head_close` text,
  `js_code_body_open` text,
  `js_code_body_close` text,
  `adwords_code` text,
  `mailchimp_api_key` varchar(100) DEFAULT NULL,
  `mailchimp_list_id` varchar(50) DEFAULT NULL,
  `map_latitude` float(10,6) DEFAULT NULL,
  `map_longitude` float(10,6) DEFAULT NULL,
  `map_address` text,
  `map_styles` longtext,
  `map_heading` varchar(255) DEFAULT NULL,
  `map_description` text,
  `map_zoom_level` smallint(6) NOT NULL,
  `map_marker_latitude` float(10,6) NOT NULL,
  `map_marker_longitude` float(10,6) NOT NULL,
  `slideshow_speed` int(11) DEFAULT '3000',
  `set_sitemapupdated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `set_sitemapstatus` char(1) DEFAULT NULL,
  `homepage_slideshow_caption` varchar(255) DEFAULT NULL,
  `youtube_id` varchar(255) NOT NULL,
  `tripadvisor_widget_code` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` VALUES (1,'Leopard Coachlines',2016,'courtney@tomahawk.co.nz','+64 9 378 7680','The Yard \r\nUnit 3, 182 Jervois Rd\r\nHerne Bay 1011\r\nAuckland','','','','','','6577a17dd0a66458981c0b4126a86b45-us15','3919cd1845',0.000000,0.000000,'','[{\"featureType\":\"administrative\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#a7a7a7\"}]},{\"featureType\":\"administrative\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#737373\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#efefef\"}]},{\"featureType\":\"poi\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#dadada\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#696969\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#b3b3b3\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#d6d6d6\"}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#ffffff\"},{\"weight\":1.8}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#d7d7d7\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#808080\"},{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#d3d3d3\"}]}]','','',0,0.000000,0.000000,5,'2018-04-24 01:45:53','I','','nYCHlOpuO6k','');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_pages`
--

DROP TABLE IF EXISTS `module_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_pages` (
  `modpages_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `modpages_rank` int(4) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`modpages_id`)
) ENGINE=MyISAM AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_pages`
--

LOCK TABLES `module_pages` WRITE;
/*!40000 ALTER TABLE `module_pages` DISABLE KEYS */;
INSERT INTO `module_pages` VALUES (266,9,1,4),(103,2,1,6),(338,2,1,8),(337,2,2,3),(319,1,1,9),(318,1,1,8),(317,1,2,4),(329,10,1,5),(316,1,1,3),(315,1,1,12),(325,6,10,3),(326,14,1,2),(275,11,1,11),(332,8,1,2),(307,22,1,4),(324,6,1,10),(327,15,1,13);
/*!40000 ALTER TABLE `module_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_templates`
--

DROP TABLE IF EXISTS `module_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_templates` (
  `tmplmod_id` int(11) NOT NULL AUTO_INCREMENT,
  `tmpl_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `tmplmod_rank` int(11) NOT NULL,
  PRIMARY KEY (`tmplmod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_templates`
--

LOCK TABLES `module_templates` WRITE;
/*!40000 ALTER TABLE `module_templates` DISABLE KEYS */;
INSERT INTO `module_templates` VALUES (1,1,1,15);
/*!40000 ALTER TABLE `module_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for include',
  `mod_name` varchar(255) DEFAULT NULL COMMENT 'Include name',
  `mod_path` varchar(255) DEFAULT NULL COMMENT 'Include URL/file path (exclude the extension)',
  `mod_showincms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `mod_mobile` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Slideshow','slideshow','N',NULL),(2,'Contact','contact','Y',NULL),(3,'Quicklinks','quicklinks','Y',NULL),(4,'Reviews','reviews','Y',NULL),(5,'Blog','blog','Y',NULL),(8,'Services','services','Y',NULL),(9,'Why Choose Us','why-choose-us','Y',NULL),(10,'Fleet','fleet','Y',NULL),(11,'Map','map','Y',NULL),(12,'Map Pins','map-pins','Y',NULL),(13,'Gallery','gallery','Y',NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_has_quicklink`
--

DROP TABLE IF EXISTS `page_has_quicklink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_has_quicklink` (
  `page_id` int(11) NOT NULL,
  `quicklink_page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_has_quicklink`
--

LOCK TABLES `page_has_quicklink` WRITE;
/*!40000 ALTER TABLE `page_has_quicklink` DISABLE KEYS */;
INSERT INTO `page_has_quicklink` VALUES (40,8),(40,2),(40,6),(40,10),(40,12),(39,8),(39,2),(39,6),(45,8),(45,2),(45,10),(46,8),(46,2),(46,6),(1,2),(1,6),(1,14),(6,2),(2,6),(2,7),(2,14);
/*!40000 ALTER TABLE `page_has_quicklink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_meta_data`
--

DROP TABLE IF EXISTS `page_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_meta_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `menu_label` varchar(255) DEFAULT NULL,
  `footer_menu` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `quicklink_heading` varchar(255) DEFAULT NULL,
  `quicklink_menu_label` varchar(255) DEFAULT NULL,
  `quicklink_photo` varchar(255) DEFAULT NULL,
  `quicklink_thumb` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL,
  `introduction` text,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text,
  `photo` varchar(255) DEFAULT NULL,
  `thumb_photo` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `og_title` varchar(255) DEFAULT NULL,
  `og_meta_description` text,
  `og_image` varchar(255) DEFAULT NULL,
  `time_based_publishing` enum('N','Y') NOT NULL DEFAULT 'N',
  `publish_on` datetime DEFAULT NULL,
  `hide_on` datetime DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('A','H','D') DEFAULT 'H',
  `rank` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `slideshow_id` int(11) DEFAULT NULL,
  `page_meta_index_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `bsh_query_1` (`status`,`menu_label`,`heading`,`title`,`sub_heading`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_meta_data`
--

LOCK TABLES `page_meta_data` WRITE;
/*!40000 ALTER TABLE `page_meta_data` DISABLE KEYS */;
INSERT INTO `page_meta_data` VALUES (1,'Home','Home','Home','Leopard Coachlines - Offering premier luxury coaches for your tours, groups and schools New Zealand wide','','','','',NULL,'home','/','Leopard Coachlines offers a wide range of options for group travellers wanting to get around New Zealand. Five Star luxury coaches and Four Star deluxe coaches are ideal for transporting tour groups in comfort around New Zealand, plus we have a range of buses ideal for long distance school charters, or getting your sports group around New Zealand.','',NULL,'','','Home | Leopard Coachlines','','','','','N',NULL,NULL,1,'A',1,'2016-03-17 11:10:30','2018-03-15 00:52:32',NULL,1,1,0,1,1),(2,'Services','Our Services','Our Services','Leopard Coachlines - New Zealand wide premier luxury coaches for your tours, groups and schools.','','Our Services','','/library/volvo-49-resized/lc-interior-2.jpg','/uploads/2018/03/img-5aa9a9a07b213.jpg','services','/services','','',NULL,'','','Our Services | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',2,'2018-02-28 03:49:24','2018-03-15 00:58:42',NULL,1,1,0,0,1),(3,'tour buses','Tour Buses','','tour buses','','','','','/uploads/2018/02/img-5a96222b40a6a.jpg','tour-buses','/services/tour-buses','','',NULL,'','','','','','','','N',NULL,NULL,0,'D',1,'2018-02-28 04:14:22','2018-03-06 11:04:11','2018-03-08 00:57:29',1,1,0,0,1),(4,'blog post test',NULL,NULL,'blog post test',NULL,NULL,NULL,NULL,NULL,'blog-post-test','/post/blog-post-test',NULL,NULL,'<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','/library/market.jpg','/uploads/2018/03/img-5a98b14a80336.jpg','blog post test','blog post test','blog post test','blog post test','/library/market.jpg','N',NULL,NULL,0,'A',NULL,'2018-02-28 20:58:16','2018-03-02 03:04:58',NULL,1,1,NULL,NULL,1),(5,'blog category test','blog category test',NULL,'blog category test',NULL,NULL,NULL,NULL,NULL,'blog-category-test','/category/blog-category-test',NULL,NULL,NULL,'',NULL,'blog category test','blog category test','blog category test','blog category test','/library/market.jpg','N',NULL,NULL,0,'A',0,'2018-02-28 21:01:18','2018-02-28 21:01:46',NULL,1,1,NULL,NULL,1),(12,'Luxury Tour Coaches','Luxury Tour Coaches',NULL,'Luxury Tour Coaches available for charter throughout New Zealand',NULL,NULL,NULL,NULL,NULL,'luxury-tour-coaches','/services/luxury-tour-coaches','Leopard Coachlines offer a wide range of luxury coach options for group travellers wanting to get around New Zealand.','If you enjoy travelling in comfort you won‚Äôt find a better option for your tour group when travelling New Zealand, than Leopard Coachlines.',NULL,'/library/volvo-49-resized/lc-one-tree-hill-.jpg','/uploads/2018/03/img-5aa99845a5d97.jpg','Luxury Tour Coaches for Charter | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',1,'2018-03-01 21:46:52','2018-03-15 01:01:55',NULL,1,1,NULL,8,1),(13,'School Groups','School Groups',NULL,'School Groups',NULL,NULL,NULL,NULL,NULL,'school-groups','/services/school-groups','school groups','Five Star luxury coaches and Four Star deluxe couches are ideal for transporting tour groups in comfort on their New Zealand bus tours,..',NULL,'/library/about.jpg','/uploads/2018/03/img-5aa1b5797e0d9.jpg','school groups','school groups','school groups','school groups','/library/market.jpg','N',NULL,NULL,0,'D',2,'2018-03-02 02:15:19','2018-03-08 22:13:13','2018-03-14 22:24:26',1,1,NULL,1,1),(14,'Corporate & Social Group Charters','Corporate & Social Group Charters',NULL,'Corporate & Social Group Charters',NULL,NULL,NULL,NULL,NULL,'corporate-social-groups','/services/corporate-social-groups','We have a bus to suit the size of your group. We can offer you a choice of buses, from small 15-seaters to large 50-seat coaches, and other sizes in between. You can be confident you will find a Leopard bus to match your group numbers.','We have a bus to suit the size of your group. We can offer you a choice of buses, from small 15-seaters to large 50-seat coaches, and other sizes in between.',NULL,'/library/raw-queenstown-images/lcq_59.jpg','/uploads/2018/03/img-5aa9a1f5109e5.jpg','Corporate & Social Groups | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',3,'2018-03-02 03:06:06','2018-03-15 01:07:40',NULL,1,1,NULL,10,1),(15,'School Groups','School Groups','','School groups','','','','',NULL,'school-groups','/services/school-groups','','',NULL,'','','','','','','','N',NULL,NULL,0,'D',2,'2018-03-06 10:14:03','2018-03-06 10:14:41','2018-03-08 00:57:29',1,1,0,0,1),(16,'Corporate & Social','Corporate & Social','','corporate & social','','','','',NULL,'corporate-and-social','/services/corporate-and-social','','',NULL,'','','','','','','','N',NULL,NULL,0,'D',3,'2018-03-06 10:14:54','2018-03-06 10:15:24','2018-03-08 00:57:29',1,1,0,0,1),(17,'Fleet','Fleet','Fleet','Our Fleet','','Our Fleet','','/library/volvo-49-resized/lc-one-tree-hill-cropped.jpg','/uploads/2018/03/img-5aa9a55ba8cde.jpg','fleet','/fleet','Explore our range of fleet options to find the perfect coach for you.','',NULL,'','','Our Fleet | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',4,'2018-03-06 10:15:32','2018-03-15 00:53:59',NULL,1,1,0,0,1),(18,'test','test','','test','','About us','','/library/raw-queenstown-images/lcq_38.jpg','/uploads/2018/03/img-5aa9c5af619d0.jpg','test','/fleet/test','','',NULL,'','','','','','','','N',NULL,NULL,0,'D',6,'2018-03-06 10:16:57','2018-03-15 01:31:02','2018-03-15 02:06:17',1,1,0,0,1),(19,'Contact Us','Contact Us','','Contact Us','','','','','/uploads/2018/03/img-5a9dc9266820b.jpg','contact-us','/about-us/contact-us','','',NULL,'','','','','','','','N',NULL,NULL,0,'A',1,'2018-03-06 11:01:48','2018-03-15 00:56:38',NULL,1,1,0,0,1),(20,'Testimonials','','','Testimonials','','','','',NULL,'testimonials','/about-us/testimonials','','',NULL,'','','','','','','','N',NULL,NULL,0,'A',5,'2018-03-08 01:01:20','2018-03-14 19:37:33',NULL,1,1,0,0,1),(21,'News','News','','News','','Blog','Discover','/library/about.jpg','/uploads/2018/03/img-5aa1da76b5eef.jpg','news','/about-us/news','','Test',NULL,'','','News | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',6,'2018-03-08 01:01:57','2018-03-15 00:54:46',NULL,1,1,0,0,1),(22,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-08 01:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'H',NULL,'2018-03-08 01:35:19','2018-03-08 01:35:19',NULL,1,NULL,NULL,NULL,1),(23,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-08 01:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'H',NULL,'2018-03-08 01:35:27','2018-03-08 01:35:27',NULL,1,NULL,NULL,NULL,1),(24,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-08 01:35:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'H',NULL,'2018-03-08 01:35:38','2018-03-08 01:35:38',NULL,1,NULL,NULL,NULL,1),(25,'Locations','Locations','','Our Locations','','','','',NULL,'locations','/locations','','',NULL,'','','Our Locations | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',5,'2018-03-08 01:51:21','2018-03-14 19:49:20',NULL,1,1,0,0,1),(26,'Fleet test','Fleet test',NULL,'Fleet test',NULL,NULL,NULL,NULL,NULL,'2018-03-08-022335','/2018-03-08-022335','lorem ipsum',NULL,NULL,'/library/about.jpg','/uploads/2018/03/img-5aa0a0f02abd2.jpg','',NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',NULL,'2018-03-08 02:23:35','2018-03-08 02:33:20',NULL,1,1,2,0,1),(27,'Testing General Page 01','Testing General Page 01','Testing General Page 01','Testing General Page 01','','Testing General Page 01','Discover','/library/about.jpg','/uploads/2018/03/img-5aa09f59d234d.jpg','testing-general-page-01','/locations/testing-general-page-01','Testing General Page 01','Testing General Page 01',NULL,'','','Testing General Page 01','Testing General Page 01','Testing General Page 01','','','N',NULL,NULL,0,'D',20,'2018-03-08 02:25:24','2018-03-11 22:07:41','2018-03-14 19:49:58',1,1,0,0,1),(28,'404','','','404 Error Page','','','','',NULL,'404','/404','','',NULL,'','','','','','','','N',NULL,NULL,0,'A',10,'2018-03-08 02:32:33','2018-03-08 02:32:51',NULL,1,1,0,0,1),(29,'BMW Limousines','BMW Limousines',NULL,'BMW Limousines',NULL,NULL,NULL,NULL,NULL,'bmw-limousines','/fleet/bmw-limousines','These quiet, powerful luxury salons are perfect for any VIP or Luxury occasion',NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',3,'2018-03-08 02:49:46','2018-03-15 02:00:47',NULL,1,1,0,0,1),(30,'Mercedes Benz Sprinter','Mercedes Benz Sprinter',NULL,'Mercedes Benz Sprinter',NULL,NULL,NULL,NULL,NULL,'mercedes-benz-sprinter','/fleet/mercedes-benz-sprinter','A very smooth, powerful coach which is extremely comfortable and quiet',NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',4,'2018-03-08 02:51:28','2018-03-15 02:05:09',NULL,1,1,0,0,1),(31,'Testing Category 01','Testing Category 01',NULL,'Testing Category 01',NULL,NULL,NULL,NULL,NULL,'testing-category-01','/category/testing-category-01',NULL,NULL,NULL,'',NULL,'Testing Category 01','Testing Category 01','Testing Category 01','Testing Category 01','/library/about.jpg','N',NULL,NULL,0,'A',1,'2018-03-08 03:32:29','2018-03-08 03:32:58',NULL,1,1,NULL,NULL,1),(32,'Testing Blog Post 01',NULL,NULL,'Testing Blog Post 01',NULL,NULL,NULL,NULL,NULL,'testing-blog-post-01','/post/testing-blog-post-01',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>\r\n\r\n<p>Proin sed orci ultrices, congue augue sed, accumsan neque. Mauris non orci faucibus, sodales metus nec, accumsan est. Vivamus eros felis, euismod ac vulputate quis, posuere sed ex. Nunc cursus pharetra dolor, id accumsan lectus gravida ut. Mauris nec sapien id diam laoreet tempor ac vestibulum turpis. Vivamus vitae odio quis nibh vestibulum porttitor. Duis mauris nisl, feugiat a lacinia sit amet, fermentum sed lacus. Nam cursus efficitur erat auctor sagittis. Cras non diam interdum, rutrum nisl vel, consectetur metus. Nullam nibh purus, commodo et vehicula sed, vehicula quis neque.</p>','/library/about.jpg','/uploads/2018/03/img-5aa0b08d70a79.jpg','Testing Blog Post 01','Testing Blog Post 01','Testing Blog Post 01','Testing Blog Post 01','/library/about.jpg','N',NULL,NULL,0,'A',NULL,'2018-03-08 03:39:15','2018-03-08 03:39:57',NULL,1,1,NULL,NULL,1),(33,'Enquire','','Enquire','Enquire','','Send an Enquiry','','/library/raw-queenstown-images/lcq_11.jpg','/uploads/2018/03/img-5aa9c3f66fd45.jpg','enquire','/enquire','','',NULL,'','','Enquiries | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',11,'2018-03-08 19:43:45','2018-03-15 00:54:07',NULL,1,1,0,0,1),(34,'Testing Fleet 01','Testing Fleet 01',NULL,'Testing Fleet 01',NULL,NULL,NULL,NULL,NULL,'testing-fleet-01','/fleet/testing-fleet-01','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.\r\n\r\nProin sed orci ultrices, congue augue sed, accumsan neque. Mauris non orci faucibus, sodales metus nec, accumsan est. Vivamus eros felis, euismod ac vulputate quis, posuere sed ex. Nunc cursus pharetra dolor, id accumsan lectus gravida ut. Mauris nec sapien id diam laoreet tempor ac vestibulum turpis. Vivamus vitae odio quis nibh vestibulum porttitor. Duis mauris nisl, feugiat a lacinia sit amet, fermentum sed lacus. Nam cursus efficitur erat auctor sagittis. Cras non diam interdum, rutrum nisl vel, consectetur metus. Nullam nibh purus, commodo et vehicula sed, vehicula quis neque.',NULL,NULL,'/library/about.jpg','/uploads/2018/03/img-5aa1a8cd70b4b.jpg','',NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'D',10,'2018-03-08 21:17:31','2018-03-09 01:56:22','2018-03-14 02:43:19',1,1,4,0,1),(35,'Testing Blog Post 02',NULL,NULL,'Testing Blog Post 02',NULL,NULL,NULL,NULL,NULL,'testing-blog-post-02','/post/testing-blog-post-02',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>\r\n\r\n<p>Proin sed orci ultrices, congue augue sed, accumsan neque. Mauris non orci faucibus, sodales metus nec, accumsan est. Vivamus eros felis, euismod ac vulputate quis, posuere sed ex. Nunc cursus pharetra dolor, id accumsan lectus gravida ut. Mauris nec sapien id diam laoreet tempor ac vestibulum turpis. Vivamus vitae odio quis nibh vestibulum porttitor. Duis mauris nisl, feugiat a lacinia sit amet, fermentum sed lacus. Nam cursus efficitur erat auctor sagittis. Cras non diam interdum, rutrum nisl vel, consectetur metus. Nullam nibh purus, commodo et vehicula sed, vehicula quis neque.</p>\r\n\r\n<p>Nunc dui nisl, ornare eget libero a, rutrum rhoncus velit. Integer lorem velit, volutpat fermentum neque accumsan, tincidunt imperdiet turpis. Donec sed tempor enim. Sed quis consequat turpis. Aenean quis ante orci. Morbi laoreet eros nec imperdiet imperdiet. Suspendisse at nibh lobortis augue mollis tincidunt non et urna. Nulla quis nibh dapibus, imperdiet felis sed, ullamcorper est. Nunc fringilla lobortis pharetra</p>','/library/about.jpg','/uploads/2018/03/img-5aa1b8aa65ede.jpg','','','','','','N',NULL,NULL,0,'A',NULL,'2018-03-08 22:26:16','2018-03-08 22:26:50',NULL,1,1,NULL,NULL,1),(36,'Testing Blog Post 03',NULL,NULL,'Testing Blog Post 03',NULL,NULL,NULL,NULL,NULL,'testing-blog-post-03','/post/testing-blog-post-03',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>\r\n\r\n<p>Proin sed orci ultrices, congue augue sed, accumsan neque. Mauris non orci faucibus, sodales metus nec, accumsan est. Vivamus eros felis, euismod ac vulputate quis, posuere sed ex. Nunc cursus pharetra dolor, id accumsan lectus gravida ut. Mauris nec sapien id diam laoreet tempor ac vestibulum turpis. Vivamus vitae odio quis nibh vestibulum porttitor. Duis mauris nisl, feugiat a lacinia sit amet, fermentum sed lacus. Nam cursus efficitur erat auctor sagittis. Cras non diam interdum, rutrum nisl vel, consectetur metus. Nullam nibh purus, commodo et vehicula sed, vehicula quis neque.</p>\r\n\r\n<p>Nunc dui nisl, ornare eget libero a, rutrum rhoncus velit. Integer lorem velit, volutpat fermentum neque accumsan, tincidunt imperdiet turpis. Donec sed tempor enim. Sed quis consequat turpis. Aenean quis ante orci. Morbi laoreet eros nec imperdiet imperdiet. Suspendisse at nibh lobortis augue mollis tincidunt non et urna. Nulla quis nibh dapibus, imperdiet felis sed, ullamcorper est. Nunc fringilla lobortis pharetra.</p>','','','','','','','','N',NULL,NULL,0,'A',NULL,'2018-03-08 22:26:55','2018-03-08 22:27:21',NULL,1,1,NULL,NULL,1),(37,'Testing Blog Post 04',NULL,NULL,'Testing Blog Post 04',NULL,NULL,NULL,NULL,NULL,'testing-blog-post-04','/post/testing-blog-post-04',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>\r\n\r\n<p>Proin sed orci ultrices, congue augue sed, accumsan neque. Mauris non orci faucibus, sodales metus nec, accumsan est. Vivamus eros felis, euismod ac vulputate quis, posuere sed ex. Nunc cursus pharetra dolor, id accumsan lectus gravida ut. Mauris nec sapien id diam laoreet tempor ac vestibulum turpis. Vivamus vitae odio quis nibh vestibulum porttitor. Duis mauris nisl, feugiat a lacinia sit amet, fermentum sed lacus. Nam cursus efficitur erat auctor sagittis. Cras non diam interdum, rutrum nisl vel, consectetur metus. Nullam nibh purus, commodo et vehicula sed, vehicula quis neque.</p>\r\n\r\n<p>Nunc dui nisl, ornare eget libero a, rutrum rhoncus velit. Integer lorem velit, volutpat fermentum neque accumsan, tincidunt imperdiet turpis. Donec sed tempor enim. Sed quis consequat turpis. Aenean quis ante orci. Morbi laoreet eros nec imperdiet imperdiet. Suspendisse at nibh lobortis augue mollis tincidunt non et urna. Nulla quis nibh dapibus, imperdiet felis sed, ullamcorper est. Nunc fringilla lobortis pharetra.</p>','','','','','','','','N',NULL,NULL,0,'A',NULL,'2018-03-08 22:27:38','2018-03-08 22:28:06',NULL,1,1,NULL,NULL,1),(38,'Testing Blog Post 05',NULL,NULL,'Testing Blog Post 05',NULL,NULL,NULL,NULL,NULL,'testing-blog-post-05','/post/testing-blog-post-05',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>\r\n\r\n<p>Proin sed orci ultrices, congue augue sed, accumsan neque. Mauris non orci faucibus, sodales metus nec, accumsan est. Vivamus eros felis, euismod ac vulputate quis, posuere sed ex. Nunc cursus pharetra dolor, id accumsan lectus gravida ut. Mauris nec sapien id diam laoreet tempor ac vestibulum turpis. Vivamus vitae odio quis nibh vestibulum porttitor. Duis mauris nisl, feugiat a lacinia sit amet, fermentum sed lacus. Nam cursus efficitur erat auctor sagittis. Cras non diam interdum, rutrum nisl vel, consectetur metus. Nullam nibh purus, commodo et vehicula sed, vehicula quis neque.</p>\r\n\r\n<p>Nunc dui nisl, ornare eget libero a, rutrum rhoncus velit. Integer lorem velit, volutpat fermentum neque accumsan, tincidunt imperdiet turpis. Donec sed tempor enim. Sed quis consequat turpis. Aenean quis ante orci. Morbi laoreet eros nec imperdiet imperdiet. Suspendisse at nibh lobortis augue mollis tincidunt non et urna. Nulla quis nibh dapibus, imperdiet felis sed, ullamcorper est. Nunc fringilla lobortis pharetra.</p>','/library/about.jpg','/uploads/2018/03/img-5aa1f91140e68.jpg','','','','','','N',NULL,NULL,0,'A',NULL,'2018-03-08 22:28:13','2018-03-09 03:01:37',NULL,1,1,NULL,NULL,1),(39,'Testing Service 01','Testing Service 01',NULL,'Testing Service 01',NULL,NULL,NULL,NULL,NULL,'testing-service-01','/services/testing-service-01','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis m',NULL,'/library/about.jpg','/uploads/2018/03/img-5aa1d8710fc2d.jpg','Testing Service 01','Testing Service 01','Testing Service 01','Testing Service 01','/library/about.jpg','N',NULL,NULL,0,'D',10,'2018-03-09 00:41:10','2018-03-13 02:32:54','2018-03-14 02:51:21',1,1,NULL,3,1),(40,'Testing Service 02','Testing Service 02',NULL,'Testing Service 02',NULL,NULL,NULL,NULL,NULL,'testing-service-02','/services/testing-service-02','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis m',NULL,'/library/about.jpg','/uploads/2018/03/img-5aa1dc9294ea2.jpg','','','','','','N',NULL,NULL,0,'D',0,'2018-03-09 00:58:37','2018-03-09 01:00:02','2018-03-14 02:44:02',1,1,NULL,3,1),(41,'Gallery','Gallery','','Gallery','','','','',NULL,'gallery','/about-us/gallery','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','',NULL,'','','','','','','','N',NULL,NULL,0,'A',12,'2018-03-09 01:45:49','2018-03-15 00:54:13',NULL,1,1,0,0,1),(42,'Auckland','Auckland','','Auckland Headquarters','','','','',NULL,'auckland','/locations/auckland','','',NULL,'','','Auckland Location | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',1,'2018-03-11 22:13:47','2018-03-15 02:09:24',NULL,1,1,0,0,1),(43,'Christchurch','Christchurch','','Christchurch','','','','',NULL,'christchurch','/locations/christchurch','','',NULL,'','','Christchurch Location | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',2,'2018-03-11 22:14:18','2018-03-15 02:09:32',NULL,1,1,0,0,1),(44,'Untitled post',NULL,NULL,'Untitled post',NULL,NULL,NULL,NULL,NULL,'2018-03-13-022731','/post/2018-03-13-022731',NULL,NULL,'','','','','','','','','N',NULL,NULL,0,'D',NULL,'2018-03-13 02:27:31','2018-03-13 02:27:33','2018-03-13 02:27:43',1,1,NULL,NULL,1),(45,'Testing Service 03','Testing Service 03',NULL,'Testing Service 03',NULL,NULL,NULL,NULL,NULL,'testing-service-03','/services/testing-service-03','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisqu',NULL,'/library/testing-image.jpg','/uploads/2018/03/img-5aa73d67364a8.jpg','Testing Service 03','Testing Service 03','Testing Service 03','Testing Service 03','/library/testing-image.jpg','N',NULL,NULL,0,'D',30,'2018-03-13 02:53:09','2018-03-13 02:54:31','2018-03-14 02:44:02',1,1,NULL,3,1),(46,'Testing Service 04','Testing Service 04',NULL,'Testing Service 04',NULL,NULL,NULL,NULL,NULL,'testing-service-04','/services/testing-service-04','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisqu',NULL,'/library/testing-image.jpg','/uploads/2018/03/img-5aa88dcd60852.jpg','','','','','','N',NULL,NULL,0,'D',20,'2018-03-14 02:49:00','2018-03-14 02:49:49','2018-03-14 02:51:21',1,1,NULL,1,1),(47,'About Us','About Us','','About Us','','About Us','','/library/raw-queenstown-images/lcq_11.jpg','/uploads/2018/03/img-5aa9a92f486f0.jpg','about-us','/about-us','','',NULL,'','','About Us | Leopard Coachlines','','','','','N',NULL,NULL,0,'D',6,'2018-03-14 19:34:44','2018-03-14 22:58:55','2018-03-14 23:03:15',1,1,0,0,1),(48,'sean test','sean test','','sean test','','','','',NULL,'sean-test','/about-us/sean-test','','',NULL,'','','','','','','','N',NULL,NULL,0,'D',0,'2018-03-14 19:59:42','2018-03-14 20:09:42','2018-03-14 23:03:31',1,1,0,0,1),(49,'Sean test page','Sean test page','','Sean test page','','','','',NULL,'sean-test-page','/about-us/sean-test-page','','',NULL,'','','','','','','','N',NULL,NULL,0,'D',1,'2018-03-14 20:14:05','2018-03-14 20:18:30','2018-03-14 23:01:12',1,1,0,0,1),(50,'Testing Service 05','Testing Service 05',NULL,'Testing Service 05',NULL,NULL,NULL,NULL,NULL,'testing-service-05','/services/testing-service-05','','',NULL,'',NULL,'','','','','','N',NULL,NULL,0,'D',NULL,'2018-03-14 21:33:38','2018-03-14 21:34:20','2018-03-14 21:34:28',1,1,NULL,0,1),(51,'Testing General Page 02','Testing General Page 02','','Testing General Page 02','','','','',NULL,'testing-general-page-02','/about-us/testing-general-page-02','','',NULL,'','','','','','','','N',NULL,NULL,0,'D',2,'2018-03-14 21:38:04','2018-03-14 21:38:41','2018-03-14 21:39:00',1,1,0,0,1),(52,'Four Star Coaches','Four Star Coaches',NULL,'Four Star Coaches',NULL,NULL,NULL,NULL,NULL,'four-star-coaches','/fleet/four-star-coaches','33 to 49-seat Coaches Graded 4 Star Premium. There are three brand new Four Star coaches in the Leopard fleet with the remainder less than 10 years new.',NULL,NULL,'/library/photos-resized/auckland-pictures-009.jpg','/uploads/2018/03/img-5aa99b625dc31.jpg','',NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',2,'2018-03-14 21:49:39','2018-03-15 01:10:07',NULL,1,1,2,0,1),(53,'Five Star Coaches','Five Star Coaches',NULL,'Five Star Coaches',NULL,NULL,NULL,NULL,NULL,'five-star-coaches','/fleet/five-star-coaches','49-seat mainly Volvo B12B coaches Graded 5 star deluxe. With on-board video monitors, entertainment systems and full-fabric designer interior to create a relaxing ambiance.',NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'A',1,'2018-03-14 22:14:37','2018-03-15 01:09:20',NULL,1,1,9,0,1),(54,'Testimonials','Testimonials','','Testimonials','','','','',NULL,'reviews','/about-us/reviews','','',NULL,'','','Testimonials | Leopard Coachlines','','','','','N',NULL,NULL,0,'A',NULL,'2018-03-14 23:01:15','2018-03-14 23:02:27',NULL,1,1,0,0,1),(55,'Untitled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-03-14 23:02:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,0,'H',0,'2018-03-14 23:02:39','2018-03-14 23:02:39',NULL,1,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `page_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_meta_index`
--

DROP TABLE IF EXISTS `page_meta_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_meta_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_meta_index`
--

LOCK TABLES `page_meta_index` WRITE;
/*!40000 ALTER TABLE `page_meta_index` DISABLE KEYS */;
INSERT INTO `page_meta_index` VALUES (1,'Index and Follow (Default)','all','Use this if you want to let search engines do their normal job.'),(2,'Do not Index or Follow','none','This is for sections of a site that shouldn\'t be indexed and shouldn\'t have links followed.'),(3,'Follow, but do not Index','noindex, follow','Search engine robots can follow any links on this page but will not include this page.'),(4,'Index but do not Follow','index, nofollow','Search engine robots should include this page but not follow any links on this page.'),(5,'Do not archive','noarchive','Useful if the content changes frequently: headlines, auctions, etc. The search engine still archives the information, but won\'t show it in the results.');
/*!40000 ALTER TABLE `page_meta_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_transaction`
--

DROP TABLE IF EXISTS `paypal_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(15) DEFAULT NULL,
  `payer_id` varchar(50) NOT NULL,
  `processing_fee` decimal(10,2) NOT NULL COMMENT 'Credit card transaction fee',
  `total_amount` decimal(10,2) NOT NULL COMMENT 'Sum of amount_excl_gst, gst_amount and processing_fee.',
  `mc_gross` decimal(10,2) NOT NULL COMMENT 'Final Total Amount transferred to receiver''s account',
  `mc_fee` decimal(10,2) NOT NULL,
  `mc_currency` varchar(5) NOT NULL,
  `description` text,
  `request_url` text NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `payment_type` varchar(50) NOT NULL,
  `payer_status` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL,
  `payment_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `txt_id` (`txn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_transaction`
--

LOCK TABLES `paypal_transaction` WRITE;
/*!40000 ALTER TABLE `paypal_transaction` DISABLE KEYS */;
INSERT INTO `paypal_transaction` VALUES (1,'66515057HS85018','HCQPEEETYX8TG',3.21,131.21,131.21,4.91,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3D3750c66424&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3D3750c66424&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-05-24 14:06:44','2016-05-24 14:10:27'),(2,'1P3383572038757','HCQPEEETYX8TG',8.63,353.63,353.63,12.47,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26px-response%3Db373eabb80&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26ce-token%3Db373eabb80&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-05-26 18:25:13','2016-05-26 18:25:49'),(3,'5XX60241F038733','HCQPEEETYX8TG',18.69,766.19,766.19,26.50,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3Da4f7f8ea12%26px-response%3D8b3b1f544f&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3Da4f7f8ea12%26ce-token%3D8b3b1f544f&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Chris&last_name=Elliot&address1=&address2=&city=&state=&zip=&email=chris%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-05-27 09:43:43','2016-05-27 09:45:35'),(4,'48V461893A01661','HCQPEEETYX8TG',68.11,2792.11,2792.11,95.38,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3Df8981d67da&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3Df8981d67da&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Bob&last_name=Smith&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-05-27 10:00:55','2016-05-27 10:01:47'),(5,'60E89017R284009','HCQPEEETYX8TG',8.63,353.63,353.63,12.47,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26px-response%3Df7f8b3fb72&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D4a7f702d01%26ce-token%3Df7f8b3fb72&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Thomas&last_name=Gates&address1=&address2=&city=&state=&zip=&email=tombhs7%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-05-27 14:04:26','2016-05-27 14:15:03'),(6,'8AC38424HH93710','HCQPEEETYX8TG',4.11,168.56,168.56,6.18,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D057707bfee%26px-response%3Dc23d399781&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3D057707bfee%26ce-token%3Dc23d399781&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-05-27 14:45:25','2016-05-27 14:46:18'),(7,'0F323311F267343','HCQPEEETYX8TG',2.96,120.96,120.96,4.56,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3Dee9c78abb6&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3Dee9c78abb6&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Jack&last_name=Sparrow&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-05-28 15:23:17','2016-05-28 15:24:06'),(8,NULL,'',1.23,50.23,0.00,0.00,'',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Fpx-response%3Da9d1fb94ca&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fcart%3Ftoken%3Da9d1fb94ca&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Courtney&last_name=Tomahawk&address1=&address2=&city=&state=&zip=&email=courtney%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-06-02 11:59:31',NULL),(9,NULL,'',5.61,229.86,0.00,0.00,'',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fftrain.netzone.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3De8fb555287%26px-response%3D86ceb25a98&cancel_return=http%3A%2F%2Fftrain.netzone.co.nz%2Fregister%3Ftoken%3De8fb555287%26ce-token%3D86ceb25a98&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-06-08 11:48:07',NULL),(10,'8RN18388DB12893','HCQPEEETYX8TG',5.00,205.00,205.00,7.42,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fstage.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fstage.first-training.co.nz%2Fregister%3Ftoken%3D2254c52cec%26px-response%3D24e8a8726b&cancel_return=http%3A%2F%2Fstage.first-training.co.nz%2Fregister%3Ftoken%3D2254c52cec%26ce-token%3D24e8a8726b&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-08-01 13:53:25','2016-08-01 13:54:48'),(11,NULL,'',4.11,168.56,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26px-response%3D0f00669bce&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26ce-token%3D0f00669bce&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Tomahawk&last_name=Test&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-09-19 09:32:43',NULL),(12,NULL,'',8.37,343.02,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26px-response%3D85c298369d&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26ce-token%3D85c298369d&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Toby&last_name=Casey&address1=&address2=&city=&state=&zip=&email=tobycasey%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-09-20 11:06:04',NULL),(13,NULL,'',4.11,168.56,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26px-response%3D2ef3f38ad1&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De72171b05f%26ce-token%3D2ef3f38ad1&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Ariana&last_name=Andrews&address1=&address2=&city=&state=&zip=&email=Ariana.kathy.Andrews%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-09-21 08:28:03',NULL),(14,NULL,'',1.23,50.23,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fcart%3Fpx-response%3Dbdfc8b5347&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fcart%3Ftoken%3Dbdfc8b5347&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Russel&last_name=Garlick&address1=&address2=&city=&state=&zip=&email=russel.garlick%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-09-21 20:36:24',NULL),(15,NULL,'',3.97,162.67,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26px-response%3D395b7bbb24&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26ce-token%3D395b7bbb24&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Kiarn&last_name=Couling&address1=&address2=&city=&state=&zip=&email=kiarndcouling%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-09-26 20:39:59',NULL),(16,NULL,'',7.13,292.33,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26px-response%3D54123a4b37&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf864bae4e%26ce-token%3D54123a4b37&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Grant&last_name=Lawrence&address1=&address2=&city=&state=&zip=&email=grant.lawrence%40aucklandcouncil.govt.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-09-28 14:51:06',NULL),(17,NULL,'',7.13,292.33,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26px-response%3D9678f3cca9&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26ce-token%3D9678f3cca9&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=ANNETTE&last_name=BURGESS&address1=&address2=&city=&state=&zip=&email=annette%40leech.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-09-29 13:53:44',NULL),(18,NULL,'',5.61,229.86,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd451b8949b%26px-response%3D416fe30626&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd451b8949b%26ce-token%3D416fe30626&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Martin&last_name=Burke&address1=&address2=&city=&state=&zip=&email=martin%407group.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-06 10:56:09',NULL),(19,NULL,'',7.13,292.33,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=experts-facilitator-1%40resuscitationskills.com&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26px-response%3D63984da4b7&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D4bf6bf4b5b%26ce-token%3D63984da4b7&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Brian&last_name=Walker&address1=&address2=&city=&state=&zip=&email=brian%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-07 11:51:44',NULL),(20,NULL,'',4.46,182.71,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26px-response%3D90a458faaf&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26ce-token%3D90a458faaf&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Mufti+Mahmud&last_name=Mollah&address1=&address2=&city=&state=&zip=&email=mufti26%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-10 11:51:15',NULL),(21,NULL,'',3.97,162.67,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26px-response%3De271898d83&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Db3e699ffa9%26ce-token%3De271898d83&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Purna+Bahadur&last_name=Gurung&address1=&address2=&city=&state=&zip=&email=staywithpurna%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-11 15:55:47',NULL),(22,NULL,'',7.13,292.33,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26px-response%3D3e4a524fe1&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26ce-token%3D3e4a524fe1&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Liza&last_name=Inglis&address1=&address2=&city=&state=&zip=&email=Linglis%40tonkintaylor.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-20 14:23:59',NULL),(23,NULL,'',4.11,168.56,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De0136ad10f%26px-response%3D6a803de185&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De0136ad10f%26ce-token%3D6a803de185&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Diana&last_name=Austin&address1=&address2=&city=&state=&zip=&email=lp.dm.austin%40clear.net.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-24 15:50:56',NULL),(24,NULL,'',7.13,292.33,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26px-response%3D981a3ebb7e&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26ce-token%3D981a3ebb7e&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Andrew&last_name=Blackler&address1=&address2=&city=&state=&zip=&email=sitespecific%40xtra.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-25 14:29:13',NULL),(25,NULL,'',7.10,291.15,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D604f64944c&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D604f64944c&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-25 14:32:36',NULL),(26,NULL,'',7.13,292.33,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26px-response%3D22dfc0360f&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3De37e8291cb%26ce-token%3D22dfc0360f&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-25 14:36:54',NULL),(27,'','',7.10,291.15,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D164269feb3&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D164269feb3&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Courtney&last_name=Wymer&address1=&address2=&city=&state=&zip=&email=courtney%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','','','','2016-10-25 15:08:20','2016-10-26 14:53:04'),(28,NULL,'',5.61,229.86,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team_api1.first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf7eb7031d%26px-response%3Db748c17138&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dcf7eb7031d%26ce-token%3Db748c17138&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=courtney&last_name=tomahawk&address1=&address2=&city=&state=&zip=&email=courtney%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-10-25 15:35:58',NULL),(29,'8GE02889F846742','TZEX8DMHDLN2U',7.10,291.15,291.15,10.35,'NZD',NULL,'https://www.sandbox.paypal.com/cgi-bin/webscr/?business=team-facilitator%40first-training.co.nz&cmd=_cart&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D80db4f918e&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D80db4f918e&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Tomahawk&last_name=Test&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-10-25 16:02:11','2016-10-26 15:18:30'),(30,'9E619973P524130','URUA6KWSLCW78',4.11,168.56,168.56,6.18,'NZD',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26px-response%3D8078547d7a&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26ce-token%3D8078547d7a&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Sue&last_name=Claridge&address1=&address2=&city=&state=&zip=&email=sueandbryan%40clear.net.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','unverified','2016-10-27 12:00:41','2016-10-27 12:03:16'),(31,'3PX062336J36937','58U7BV7DRGNRL',4.11,168.56,168.56,6.18,'NZD',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26px-response%3Db97cb2dbe1&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D2c0191b6a9%26ce-token%3Db97cb2dbe1&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Johanna+&last_name=Verheijen&address1=&address2=&city=&state=&zip=&email=jo%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','unverified','2016-10-27 12:17:29','2016-10-27 12:19:52'),(32,'3LN554577T91700','YP2Y392PTR6UQ',3.97,162.67,162.67,5.98,'NZD',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26px-response%3D268e4ef5aa&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26ce-token%3D268e4ef5aa&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Gerald+&last_name=Moodley&address1=&address2=&city=&state=&zip=&email=delleservices%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','verified','2016-10-27 16:58:32','2016-10-27 16:59:02'),(33,NULL,'',3.97,162.67,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26px-response%3D2885076b86&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3Dd2362e05c9%26ce-token%3D2885076b86&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Kathleen&last_name=Mulligan&address1=&address2=&city=&state=&zip=&email=mark%40first-training.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-11-08 12:04:52',NULL),(34,'8LK29439AF47669','GSWBWGVX9W7XS',8.19,335.94,335.94,11.87,'NZD',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26px-response%3D0a6774a189&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D9558bd9bce%26ce-token%3D0a6774a189&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Laura+&last_name=Iglesias&address1=&address2=&city=&state=&zip=&email=laura.iglesias.atilano%40gmail.com&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Completed','instant','unverified','2016-11-09 10:31:54','2016-11-08 16:08:10'),(35,NULL,'',4.72,193.32,0.00,0.00,'',NULL,'https://www.paypal.com/cgi-bin/webscr/?business=team%40first-training.co.nz&cmd=_cart&production=1&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Fwww.first-training.co.nz%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D7d4cfbd36b%26px-response%3D697b368811&cancel_return=http%3A%2F%2Fwww.first-training.co.nz%2Fregister%3Ftoken%3D7d4cfbd36b%26ce-token%3D697b368811&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Brian&last_name=Walker&address1=&address2=&city=&state=&zip=&email=brian%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-11-09 11:57:36',NULL),(36,NULL,'',21.39,876.99,0.00,0.00,'','Course: Outdoor First Aid - 2 Day\nParticipant: Talwinder Singh\n Participant Email: talwinder@tomahawk.co.nz','https://www.sandbox.paypal.com/cgi-bin/webscr/?business=team-facilitator%40first-training.co.nz&cmd=_cart&production=0&custom=&invoice=&upload=1&currency_code=NZD&disp_tot=Y&cpp_header_image=http%3A%2F%2Ffirsttraining.loc%2Fgraphics%2Flogo.png&cpp_cart_border_color=FFFFFF&no_note=1&return=http%3A%2F%2Ffirsttraining.loc%2Fregister%3Ftoken%3De23139e2ea%26px-response%3D09c06ad624&cancel_return=http%3A%2F%2Ffirsttraining.loc%2Fregister%3Ftoken%3De23139e2ea%26ce-token%3D09c06ad624&notify_url=&rm=12&lc=EN&shipping=&shipping2=&handling=&tax=&discount_amount_cart=&discount_rate_cart=&first_name=Talwinder&last_name=Singh&address1=&address2=&city=&state=&zip=&email=talwinder%40tomahawk.co.nz&night_phone_a=&night_phone_b=&night_phone_c=&result=12','Pending','','','2016-11-18 14:32:51',NULL);
/*!40000 ALTER TABLE `paypal_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_path` varchar(255) DEFAULT NULL COMMENT 'URL to the slide-image relative to the public_html folder (recommended). ',
  `thumb_path` varchar(255) DEFAULT NULL,
  `caption_heading` varchar(255) DEFAULT NULL,
  `caption` mediumtext,
  `alt_text` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `button_label` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `type` enum('N','P') NOT NULL DEFAULT 'N',
  `rank` int(11) DEFAULT NULL COMMENT 'Heirarchy/Order for the slides (lower is greater)',
  `photo_group_id` int(11) DEFAULT NULL COMMENT 'Foreign Key to the slideshow group for this slide',
  PRIMARY KEY (`id`),
  KEY `is_group` (`photo_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (156,'/library/photos-resized/christchurch-33seater-015.jpg','/uploads/2018/04/img-5adeb6e96d4ce.jpg',NULL,'','','',NULL,NULL,1626,1080,'N',7,2),(155,'/library/raw-queenstown-images/lcq_59.jpg','/uploads/2018/04/img-5adeb6e944e3d.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',6,2),(150,'/library/photos-resized/christchurch-33seater-042.jpg','/uploads/2018/04/img-5adeb6e890ec1.jpg',NULL,'','','',NULL,NULL,600,398,'N',1,2),(154,'/library/raw-queenstown-images/lcq_43.jpg','/uploads/2018/04/img-5adeb6e91e4b3.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',5,2),(153,'/library/raw-queenstown-images/lcq_46.jpg','/uploads/2018/04/img-5adeb6e8ebd33.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',4,2),(130,'/library/volvo-49-resized/lc-airport-1.jpg',NULL,'','','',NULL,NULL,NULL,1620,1080,'N',1,10),(151,'/library/volvo-49-resized/lc-interior-1.jpg','/uploads/2018/04/img-5adeb6e89f4c9.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',2,2),(108,'/library/volvo-49-resized/lc-museum-2.jpg',NULL,'','Experience New Zealand\'s premium luxury coachline','',NULL,NULL,NULL,1620,1080,'N',3,1),(107,'/library/volvo-49-resized/lc-westhaven-3.jpg',NULL,'','Experience New Zealand\'s premium luxury coachline','',NULL,NULL,NULL,1920,1014,'N',1,1),(121,'/library/volvo-49-resized/lc-interior-1.jpg',NULL,'','','',NULL,NULL,NULL,1620,1080,'N',0,8),(119,'/library/volvo-49-resized/lc-museum-2.jpg',NULL,'','','',NULL,NULL,NULL,1620,1080,'N',0,8),(120,'/library/raw-queenstown-images/lcq_45.jpg',NULL,'','','',NULL,NULL,NULL,1620,1080,'N',0,8),(152,'/library/raw-queenstown-images/lcq_45.jpg','/uploads/2018/04/img-5adeb6e8c4c21.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',3,2),(106,'/library/volvo-49-resized/lc-lifestyle-1.jpg',NULL,'','Experience New Zealand\'s premium luxury coachline','',NULL,NULL,NULL,1620,1080,'N',2,1),(144,'/library/volvo-49-resized/lc-interior-1.jpg','/uploads/2018/04/img-5adeb6d6ac5c2.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',0,9),(145,'/library/raw-queenstown-images/lcq_59.jpg','/uploads/2018/04/img-5adeb6d6d4f39.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',0,9),(146,'/library/volvo-49-resized/lc-one-tree-hill-.jpg','/uploads/2018/04/img-5adeb6d70840c.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',0,9),(128,'/library/volvo-49-resized/lc-lifestyle-1.jpg',NULL,'','','',NULL,NULL,NULL,1620,1080,'N',2,10),(129,'/library/volvo-49-resized/lc-interior-3.jpg',NULL,'','','',NULL,NULL,NULL,1620,1080,'N',3,10),(147,'/library/raw-queenstown-images/lcq_46.jpg','/uploads/2018/04/img-5adeb6d732ba1.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',0,9),(143,'/library/raw-queenstown-images/lcq_80.jpg','/uploads/2018/04/img-5adeb6d685a90.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',0,9),(148,'/library/volvo-49-resized/lc-lifestyle-1.jpg','/uploads/2018/04/img-5adeb6d759e90.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',0,9),(149,'/library/volvo-49-resized/lc-interior-1.jpg','/uploads/2018/04/img-5adeb6d77fd32.jpg',NULL,'','','',NULL,NULL,1620,1080,'N',0,9);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_group`
--

DROP TABLE IF EXISTS `photo_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the slideshow/gallery group',
  `name` varchar(255) NOT NULL,
  `menu_label` varchar(255) DEFAULT NULL,
  `type` enum('C','G','S') NOT NULL DEFAULT 'S' COMMENT 'C - Carousel, G - Gallery, S - Slideshow(Default)',
  `show_in_cms` enum('N','Y') NOT NULL DEFAULT 'Y',
  `show_on_gallery_page` enum('N','Y') NOT NULL DEFAULT 'N',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_group`
--

LOCK TABLES `photo_group` WRITE;
/*!40000 ALTER TABLE `photo_group` DISABLE KEYS */;
INSERT INTO `photo_group` VALUES (1,'Homepage',NULL,'S','Y','N',0),(2,'Four Star Coaches','Four Star Coaches','G','Y','Y',2),(9,'Five Star Coaches','Five Star Coaches','G','Y','Y',0),(8,'Luxury Tour Coaches',NULL,'S','Y','N',0),(10,'Corporate & School Groups',NULL,'S','Y','N',0);
/*!40000 ALTER TABLE `photo_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_url` mediumtext NOT NULL,
  `new_url` mediumtext NOT NULL,
  `status_code` int(11) NOT NULL,
  `status` enum('A','H','D') NOT NULL DEFAULT 'H',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(150) DEFAULT NULL,
  `person_location` varchar(150) DEFAULT NULL,
  `description` text,
  `date_posted` date DEFAULT NULL,
  `type` enum('P','A') DEFAULT 'P',
  `status` enum('A','D','H') NOT NULL DEFAULT 'H',
  `rank` int(11) DEFAULT NULL,
  `cruise_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_cruise1_idx` (`cruise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Sean','Auckland CBD','We had a great day yesterday and wanted to pass on our comments on Allan our driver. We found him to be most courteos and very helpful in assisting us, without him the trip would be uneventful.','2018-02-28','P','A',0,0),(2,'Test Review','Auckland','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.\r\n\r\nProin sed orci ultrices, congue augue sed, accumsan neque. Mauris non orci faucibus, sodales metus nec, accumsan est. Vivamus eros felis, euismod ac vulputate quis, posuere sed ex. Nunc cursus pharetra dolor, id accumsan lectus gravida ut. Mauris nec sapien id diam laoreet tempor ac vestibulum turpis. Vivamus vitae odio quis nibh vestibulum porttitor. Duis mauris nisl, feugiat a lacinia sit amet, fermentum sed lacus. Nam cursus efficitur erat auctor sagittis. Cras non diam interdum, rutrum nisl vel, consectetur metus. Nullam nibh purus, commodo et vehicula sed, vehicula quis neque.','2018-04-01','P','A',10,0);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_on_home_page` enum('N','Y') NOT NULL DEFAULT 'N',
  `page_meta_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Y',12),(2,'Y',13),(3,'Y',14),(4,'N',39),(5,'N',40),(6,'Y',45),(7,'N',46),(8,'N',50);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_has_quicklink`
--

DROP TABLE IF EXISTS `service_has_quicklink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_has_quicklink` (
  `service_id` int(11) NOT NULL COMMENT 'id for service',
  `quicklink_page_id` int(11) NOT NULL COMMENT 'id for quicklinks page id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_has_quicklink`
--

LOCK TABLES `service_has_quicklink` WRITE;
/*!40000 ALTER TABLE `service_has_quicklink` DISABLE KEYS */;
INSERT INTO `service_has_quicklink` VALUES (1,8),(1,2);
/*!40000 ALTER TABLE `service_has_quicklink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_options`
--

DROP TABLE IF EXISTS `service_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_path` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `caption_heading` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL COMMENT 'Heirarchy/Order for the slides (lower is greater)',
  `service_id` int(11) DEFAULT NULL COMMENT 'Foreign Key to the service group for this service option',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_options`
--

LOCK TABLES `service_options` WRITE;
/*!40000 ALTER TABLE `service_options` DISABLE KEYS */;
INSERT INTO `service_options` VALUES (90,'/library/market.jpg','<p>test school groups</p>','test school groups',1,2),(112,'/library/about.jpg','','Test 1',1,5),(113,'/library/about.jpg','','Test 2',2,5),(114,'/library/about.jpg','','Test 3',3,5),(142,'/library/about.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>','Test 01',1,4),(143,'/library/about.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>','Test 02',2,4),(144,'/library/about.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer iaculis sem tristique odio suscipit, id blandit sapien auctor. Vestibulum in fringilla arcu. Maecenas eget turpis magna. Aliquam justo libero, commodo ut feugiat id, aliquam quis elit. Sed egestas congue metus, vitae placerat felis vehicula a. Donec turpis mauris, sollicitudin at ex in, faucibus facilisis orci. Mauris molestie tincidunt tempus. Aenean eget rutrum lacus. Vestibulum placerat risus in blandit convallis. Morbi in posuere mi. Duis vel justo vel nisl luctus ullamcorper eu sit amet justo.</p>','Test 03',3,4),(145,'/library/testing-image.jpg','','Test 01',1,6),(146,'/library/testing-image.jpg','','Test 02',2,6),(147,'/library/testing-image.jpg','','Test 03',3,6),(148,'/library/testing-image.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.</p>','Test 1',1,7),(149,'/library/testing-image.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.</p>','Test 2',2,7),(150,'/library/raw-queenstown-images/lcq_1.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.</p>','Test 01',1,8),(151,'/library/raw-queenstown-images/lcq_2.jpg','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce congue, felis nec feugiat sollicitudin, tortor elit feugiat ante, ut semper neque velit in eros. Nullam in scelerisque metus. Suspendisse non vestibulum mi, ut molestie sem. Morbi sapien nulla, accumsan at urna ut, dignissim egestas augue. In consequat ante orci, ut viverra ante rhoncus a. Suspendisse imperdiet placerat massa, id blandit sem sagittis eu. Nullam eu erat tellus. Pellentesque at nunc massa. Nulla non ante fermentum, posuere diam ut, commodo justo. Donec vel tincidunt ligula, mattis faucibus urna.</p>','Test 02',1,8),(193,'/library/volvo-49-resized/lc-one-tree-hill-cropped.jpg','<p>If you enjoy travelling in comfort you won&rsquo;t find a better option for your tour group, when travelling New Zealand, than Leopard Coachlines. You&rsquo;ll travel on modern luxury touring coaches, with experienced driver/guides to ensure your New Zealand coach trip is enjoyable, informative, comfortable and safe. Internationally-recognised coach touring brands, such as C&amp;E Tours and Value Tours, are among the many that consistently choose Leopard Coachlines for their New Zealand bus tours.</p>','Travel in comfort in our modern coaches with experienced drivers',1,1),(194,'/library/volvo-49-resized/lc-rolling-shot-2.jpg','<p>Unlike our competitors, who include three-star buses in their touring fleets, Leopard will use only the best four star and five star touring coaches for your New Zealand bus tour. The Star Grading System, which rates larger vehicles from 0 &ndash; 5 star deluxe, has been developed by the Bus and Coach Association of New Zealand to establish standards that passengers can rely on. Vehicles are inspected by Vehicle Testing New Zealand, an independent Government agency of New Zealand.</p>','You‚Äôll travel in four and five-star coaches on your New Zealand bus tour',2,1),(195,'/library/volvo-49-resized/lc-westhaven-2.jpg','<p>Leopard&rsquo;s modern fleet of New Zealand tour buses includes several seating configurations to suit groups of all sizes.&nbsp; Request a quote or make a booking enquiry for groups in 16, 28, 45 and 49-seat configurations. All our coaches have air-conditioning, and are fitted with comfortable, reclining seats. They also have air suspension and rear-mounted motors, which make them superbly comfortable when you are travelling long distances.You&rsquo;ll enjoy magnificent panoramic views from large tinted windows when touring New Zealand in our 45 and 49-seat vehicles. Many of these coaches are of a 5-star standard, with additional comforts including restrooms and video facilities. This means you can rest assured you will experience luxury, comfort and safety whenever you travel New Zealand on a Leopard coach.</p>','We have the right coach to suit your group',3,1),(200,'/library/volvo-49-resized/lc-interior-3.jpg','<p>Our office is almost always able to quickly assemble a firm, reasonable quote and a contract agreement tailored to your group within just a few hours of your call. We believe it&rsquo;s important to match special tours with specialised buses. We do this all the time. So, for example, school trips to the Canterbury ski fields use our safe, comfortable, mountain-and-snow buses. Also, we can frequently match drivers with your group. For example, a golf club tour could be driven by a Leopard driver who is also a golfer.</p>','And you won‚Äôt be kept waiting for a quote',3,3),(201,'/library/volvo-49-resized/lc-one-tree-hill-cropped.jpg','<p>At Leopard Coachlines, we have been carrying groups on tours all over New Zealand since the early 1970s. Literally millions of passengers have travelled on our coaches, including school children, and members of virtually every type of club and organisation. During that time, we have achieved an impeccable track record of comfort and safety. You can rely on us to carry your group safely, on time and in comfort.</p>','Clubs, School Trips and Organisations',1,3),(202,'/library/volvo-49-resized/lc-museum-2.jpg','<p>We can offer you a choice of buses, from small 15-seaters to large 50-seat coaches, and other sizes in between. You can be confident you will find a Leopard bus to match your group numbers.</p>','We have a bus to suit the size of your group',2,3),(203,'/library/raw-queenstown-images/lcq_59.jpg','<p>When you arrange for our bus to pick up your group, the driver will arrive on time &hellip; without fail. It&rsquo;s something we pride ourselves on at Leopard Coachlines. Leopard drivers know Christchurch city and the Canterbury region inside out. They have seen the whole range of South Island roads and weather over their many South Island tours. Their formal qualifications are above the transport industry&rsquo;s required standards. This means you can be absolutely confident you are in the safest possible hands while experiencing your tour.</p>','You‚Äôll find us punctual and reliable',4,3);
/*!40000 ALTER TABLE `service_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon_path` varchar(255) DEFAULT NULL,
  `second_icon_path` varchar(255) DEFAULT NULL,
  `icon_alt` varchar(255) DEFAULT NULL,
  `widget_blob` text,
  `placement` enum('L','R') DEFAULT 'L',
  `use_icon` enum('0','1') DEFAULT '0',
  `icon_cls` varchar(255) DEFAULT NULL,
  `element_class` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `has_widget` enum('0','1') DEFAULT '0',
  `is_external` enum('0','1') DEFAULT '0',
  `is_active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
INSERT INTO `social_links` VALUES (1,'Facebook URL','https://www.facebook.com/pages/Leopard-Coachlines/168783866470026','Join us on Facebook',NULL,NULL,'Join us on Facebook',NULL,'L','1','fa fa-facebook',NULL,1,'0','1','1'),(2,'Twitter URL','','Follow us on Twitter',NULL,NULL,'Follow us on Twitter',NULL,'L','1','fa fa-twitter',NULL,4,'0','1','1'),(3,'Instagram URL','','Follow us on Instagram',NULL,NULL,'Follow us on Instagram',NULL,'L','1','fa fa-instagram',NULL,2,'0','1','1'),(4,'Pinterest URL','','Follow us on social Pinterest',NULL,NULL,'Follow us on social Pinterest',NULL,'L','1','fa fa-pinterest-p',NULL,3,'0','1','1'),(5,'YouTube URL','','Follow us on YouTube',NULL,NULL,'Follow us on YouTube',NULL,'L','1','fa fa-youtube',NULL,5,'0','1','1'),(6,'Tripadvisor URL','','View Tripadvisor',NULL,NULL,'View Tripadvisor',NULL,'L','1','fa fa-tripadvisor',NULL,6,'0','1','1'),(7,'LinkedIn URL','','Find us on LinkedIn',NULL,NULL,'Find us on LinkedIn',NULL,'L','1','fa fa-linkedin-in',NULL,7,'0','1','1');
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates_normal`
--

DROP TABLE IF EXISTS `templates_normal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates_normal` (
  `tmpl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for template',
  `tmpl_name` varchar(100) DEFAULT NULL COMMENT 'Template name',
  `tmpl_path` varchar(100) DEFAULT NULL COMMENT 'Template URL (i.e. ''default'', ''shop'', ''googlemap'' etc). It is recommended that you leave the extension up to the application/code.',
  `tmpl_previewimg` varchar(100) DEFAULT NULL,
  `tmpl_nummoduletags` int(11) NOT NULL DEFAULT '0',
  `tmpl_showincms` varchar(1) NOT NULL DEFAULT 'Y',
  `tmpl_mobile` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`tmpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates_normal`
--

LOCK TABLES `templates_normal` WRITE;
/*!40000 ALTER TABLE `templates_normal` DISABLE KEYS */;
INSERT INTO `templates_normal` VALUES (1,'Default','index.html',NULL,0,'Y',NULL);
/*!40000 ALTER TABLE `templates_normal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-30 15:44:29
