-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: surajsite
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_siteuser'),(20,'Can change user',7,'change_siteuser'),(21,'Can delete user',7,'delete_siteuser'),(22,'Can add user logs',8,'add_userlogs'),(23,'Can change user logs',8,'change_userlogs'),(24,'Can delete user logs',8,'delete_userlogs'),(25,'Can add login logs',9,'add_loginlogs'),(26,'Can change login logs',9,'change_loginlogs'),(27,'Can delete login logs',9,'delete_loginlogs');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$8D3eGHrWqx3A$5rGZ0RA1yZkT6HeuhY3iasiaYV8Pissc/cWaudRF0CM=','2017-09-06 12:17:22.180416',0,'aaa','','','aaa@xyz.com',0,1,'2017-09-04 02:54:13.779439'),(2,'pbkdf2_sha256$20000$0ut8pVqTH6pH$TIufDYVHblzTXYOfqyn/2cfA5U0WlK/8liYbyvpCDE0=','2017-09-05 08:37:45.914851',0,'bbb','','','bbb@xyz.com',0,1,'2017-09-04 02:54:30.366874'),(3,'pbkdf2_sha256$20000$GriSXG9OfvlJ$k8CE5SpovQn7lOTFObkagJrm5l9KdU+qrT5jl0gnOXg=',NULL,0,'ccc','','','ccc@xyz.com',0,1,'2017-09-04 02:54:39.935710'),(4,'pbkdf2_sha256$20000$6mWAkNGoudtY$++7hmT+ft3gTgH1GGH3d/4XTXIaiJqsJVq0XAz+kfTA=',NULL,0,'ddd','','','ddd@xyz.com',0,1,'2017-09-04 02:54:49.933826'),(5,'pbkdf2_sha256$20000$eirR2oTG3Wkv$XCl3tM4mNmKfxtzB7mafpCfte/ApnEDf89/jzJOJgFs=',NULL,0,'eee','','','eee@xyz.com',0,1,'2017-09-04 02:55:00.866174'),(7,'pbkdf2_sha256$20000$idY8ICE9jqvb$TcJAPHhsNQM/uYmSxzysdZQxJWNf+itO5djFovEegG4=','2017-09-05 22:04:49.586634',1,'suraj','','','surajshah525@gmail.com',1,1,'2017-09-04 04:33:47.817717');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'surajsite','loginlogs'),(7,'surajsite','siteuser'),(8,'surajsite','userlogs');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-04 02:38:57.273200'),(2,'auth','0001_initial','2017-09-04 02:38:57.676841'),(3,'admin','0001_initial','2017-09-04 02:38:57.783363'),(4,'contenttypes','0002_remove_content_type_name','2017-09-04 02:38:57.868509'),(5,'auth','0002_alter_permission_name_max_length','2017-09-04 02:38:57.886503'),(6,'auth','0003_alter_user_email_max_length','2017-09-04 02:38:57.904284'),(7,'auth','0004_alter_user_username_opts','2017-09-04 02:38:57.917164'),(8,'auth','0005_alter_user_last_login_null','2017-09-04 02:38:57.960738'),(9,'auth','0006_require_contenttypes_0002','2017-09-04 02:38:57.964210'),(10,'sessions','0001_initial','2017-09-04 02:38:57.997202'),(11,'surajsite','0001_initial','2017-09-04 02:38:58.129302'),(12,'surajsite','0002_userlogs_timestamp','2017-09-05 01:01:02.143956'),(13,'surajsite','0003_auto_20170905_0828','2017-09-05 08:28:44.483792');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('azqwwq9uorwn0ok0259pe4jp5abp6i4i','MGIyOTI4NDM2ZTBlZTI0YjVlM2VlZDNmOTUzYWZjYWQ1OWM1OGUwODp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNjM5ODM5OWE2NTJjMDg1MWY2NDEwMDZlM2UzN2Y2NzM2MTkyNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-20 12:17:06.219991'),('j3mkllifjckwjmlswwtilms0xl4vpomy','MGIyOTI4NDM2ZTBlZTI0YjVlM2VlZDNmOTUzYWZjYWQ1OWM1OGUwODp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNjM5ODM5OWE2NTJjMDg1MWY2NDEwMDZlM2UzN2Y2NzM2MTkyNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-20 10:57:40.946737'),('jpjtd7o6hsdpe4p0ckj5ypvorq3rydjk','MGIyOTI4NDM2ZTBlZTI0YjVlM2VlZDNmOTUzYWZjYWQ1OWM1OGUwODp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNjM5ODM5OWE2NTJjMDg1MWY2NDEwMDZlM2UzN2Y2NzM2MTkyNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-20 12:17:22.184730');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surajsite_loginlogs`
--

DROP TABLE IF EXISTS `surajsite_loginlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surajsite_loginlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL,
  `ip` char(39) DEFAULT NULL,
  `username` varchar(256) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surajsite_loginlogs`
--

LOCK TABLES `surajsite_loginlogs` WRITE;
/*!40000 ALTER TABLE `surajsite_loginlogs` DISABLE KEYS */;
INSERT INTO `surajsite_loginlogs` VALUES (1,'user_logged_in','127.0.0.1','aaa','2017-09-05 08:30:14.392845'),(2,'user_logged_out','127.0.0.1','aaa','2017-09-05 08:30:36.979135'),(3,'user_logged_in','127.0.0.1','suraj','2017-09-05 08:30:44.123055'),(4,'user_logged_out','127.0.0.1','suraj','2017-09-05 08:31:01.410246'),(5,'user_logged_in','127.0.0.1','bbb','2017-09-05 08:31:06.797058'),(6,'user_logged_out','127.0.0.1','bbb','2017-09-05 08:33:56.939434'),(7,'user_logged_in','127.0.0.1','aaa','2017-09-05 08:34:01.252957'),(8,'user_logged_out','127.0.0.1','aaa','2017-09-05 08:35:56.408249'),(9,'user_logged_in','127.0.0.1','aaa','2017-09-05 08:36:00.734678'),(10,'user_logged_out','127.0.0.1','aaa','2017-09-05 08:37:40.027439'),(11,'user_logged_in','127.0.0.1','bbb','2017-09-05 08:37:45.916856'),(12,'user_logged_out','127.0.0.1','bbb','2017-09-05 09:18:10.857227'),(13,'user_logged_in','127.0.0.1','aaa','2017-09-05 09:18:15.826716'),(14,'user_logged_out','127.0.0.1','aaa','2017-09-05 09:20:01.690086'),(15,'user_logged_in','127.0.0.1','aaa','2017-09-05 09:20:05.699052'),(16,'user_logged_out','127.0.0.1','aaa','2017-09-05 22:03:56.128869'),(17,'user_logged_in','127.0.0.1','aaa','2017-09-05 22:04:00.941406'),(18,'user_logged_out','127.0.0.1','aaa','2017-09-05 22:04:38.993315'),(19,'user_logged_in','127.0.0.1','suraj','2017-09-05 22:04:49.588280'),(20,'user_logged_out','127.0.0.1','suraj','2017-09-05 22:05:00.810894'),(21,'user_logged_in','127.0.0.1','aaa','2017-09-05 23:12:52.151387'),(22,'user_logged_out','127.0.0.1','aaa','2017-09-05 23:13:24.331648'),(23,'user_logged_in','127.0.0.1','aaa','2017-09-05 23:13:32.839234'),(24,'user_logged_out','127.0.0.1','aaa','2017-09-05 23:13:36.698367'),(25,'user_logged_in','127.0.0.1','aaa','2017-09-06 06:28:45.861420'),(26,'user_logged_out','127.0.0.1','aaa','2017-09-06 06:29:02.525972'),(27,'user_logged_in','127.0.0.1','aaa','2017-09-06 08:00:46.278855'),(28,'user_logged_out','127.0.0.1','aaa','2017-09-06 08:01:10.128775'),(29,'user_logged_in','127.0.0.1','aaa','2017-09-06 08:04:05.076799'),(30,'user_logged_out','127.0.0.1','aaa','2017-09-06 08:33:52.487533'),(31,'user_logged_in','127.0.0.1','aaa','2017-09-06 08:33:55.164271'),(32,'user_logged_out','127.0.0.1','aaa','2017-09-06 08:34:46.202861'),(33,'user_logged_in','127.0.0.1','aaa','2017-09-06 08:34:50.812091'),(34,'user_logged_out','127.0.0.1','aaa','2017-09-06 08:35:34.307614'),(35,'user_logged_in','127.0.0.1','aaa','2017-09-06 09:11:34.043212'),(36,'user_logged_out','127.0.0.1','aaa','2017-09-06 09:11:38.359930'),(37,'user_logged_in','127.0.0.1','aaa','2017-09-06 10:53:39.259077'),(38,'user_logged_out','127.0.0.1','aaa','2017-09-06 10:56:18.320135'),(39,'user_logged_in','127.0.0.1','aaa','2017-09-06 10:56:26.154811'),(40,'user_logged_out','127.0.0.1','aaa','2017-09-06 10:56:29.899894'),(41,'user_logged_in','127.0.0.1','aaa','2017-09-06 10:57:40.944077'),(42,'user_logged_in','127.0.0.1','aaa','2017-09-06 10:59:27.942403'),(43,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:04:27.288129'),(44,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:04:29.495954'),(45,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:06:48.520836'),(46,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:06:50.677040'),(47,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:06:57.560334'),(48,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:07:00.406736'),(49,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:15:03.727998'),(50,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:15:08.142852'),(51,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:17:35.993636'),(52,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:17:38.385003'),(53,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:22:20.844546'),(54,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:22:23.376155'),(55,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:23:59.610588'),(56,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:24:01.784075'),(57,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:26:49.671721'),(58,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:26:57.431323'),(59,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:30:24.792624'),(60,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:30:28.552509'),(61,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:34:20.064446'),(62,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:34:23.079609'),(63,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:40:06.626080'),(64,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:40:08.602762'),(65,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:42:38.338019'),(66,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:42:40.548903'),(67,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:45:09.929249'),(68,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:45:13.032830'),(69,'user_logged_out','127.0.0.1','aaa','2017-09-06 11:58:48.870853'),(70,'user_logged_in','127.0.0.1','aaa','2017-09-06 11:58:51.752728'),(71,'user_logged_in','127.0.0.1','aaa','2017-09-06 12:07:49.230603'),(72,'user_logged_out','127.0.0.1','aaa','2017-09-06 12:08:05.660939'),(73,'user_logged_in','127.0.0.1','aaa','2017-09-06 12:08:07.611842'),(74,'user_logged_out','127.0.0.1','aaa','2017-09-06 12:12:20.923335'),(75,'user_logged_in','127.0.0.1','aaa','2017-09-06 12:12:24.238655'),(76,'user_logged_out','127.0.0.1','aaa','2017-09-06 12:17:02.270749'),(77,'user_logged_in','127.0.0.1','aaa','2017-09-06 12:17:06.218667'),(78,'user_logged_out','127.0.0.1','aaa','2017-09-06 12:17:18.544314'),(79,'user_logged_in','127.0.0.1','aaa','2017-09-06 12:17:22.183367');
/*!40000 ALTER TABLE `surajsite_loginlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surajsite_siteuser`
--

DROP TABLE IF EXISTS `surajsite_siteuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surajsite_siteuser` (
  `user_ptr_id` int(11) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `surajsite_siteuser_user_ptr_id_7775596263567289_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surajsite_siteuser`
--

LOCK TABLES `surajsite_siteuser` WRITE;
/*!40000 ALTER TABLE `surajsite_siteuser` DISABLE KEYS */;
INSERT INTO `surajsite_siteuser` VALUES (1,'2017-09-04 02:54:13.805256','2017-09-04 02:54:13.805278'),(2,'2017-09-04 02:54:30.390302','2017-09-04 02:54:30.390324'),(3,'2017-09-04 02:54:39.956443','2017-09-04 02:54:39.956465'),(4,'2017-09-04 02:54:49.956591','2017-09-04 02:54:49.956614'),(5,'2017-09-04 02:55:00.886716','2017-09-04 02:55:00.886738'),(7,'2017-09-04 04:33:47.838025','2017-09-04 04:33:47.838049');
/*!40000 ALTER TABLE `surajsite_siteuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surajsite_userlogs`
--

DROP TABLE IF EXISTS `surajsite_userlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surajsite_userlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(256) NOT NULL,
  `link` longtext NOT NULL,
  `obj` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `last_modified` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suraj_user_id_3cefafcd2d1a5bd0_fk_surajsite_siteuser_user_ptr_id` (`user_id`),
  CONSTRAINT `suraj_user_id_3cefafcd2d1a5bd0_fk_surajsite_siteuser_user_ptr_id` FOREIGN KEY (`user_id`) REFERENCES `surajsite_siteuser` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surajsite_userlogs`
--

LOCK TABLES `surajsite_userlogs` WRITE;
/*!40000 ALTER TABLE `surajsite_userlogs` DISABLE KEYS */;
INSERT INTO `surajsite_userlogs` VALUES (1,'click','/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it','What is a NullPointerException, and how do I fix it?','2017-09-06 12:39:17.782320','2017-09-06 12:39:17.786656',1,'2017-09-06 12:39:17.309000');
/*!40000 ALTER TABLE `surajsite_userlogs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-07  4:29:08
