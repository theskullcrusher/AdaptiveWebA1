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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$8D3eGHrWqx3A$5rGZ0RA1yZkT6HeuhY3iasiaYV8Pissc/cWaudRF0CM=','2017-09-07 20:08:05.334589',0,'aaa','','','aaa@xyz.com',0,1,'2017-09-04 02:54:13.779439'),(2,'pbkdf2_sha256$20000$0ut8pVqTH6pH$TIufDYVHblzTXYOfqyn/2cfA5U0WlK/8liYbyvpCDE0=','2017-09-07 20:09:23.715467',0,'bbb','','','bbb@xyz.com',0,1,'2017-09-04 02:54:30.366874'),(3,'pbkdf2_sha256$20000$GriSXG9OfvlJ$k8CE5SpovQn7lOTFObkagJrm5l9KdU+qrT5jl0gnOXg=','2017-09-07 20:20:27.434556',0,'ccc','','','ccc@xyz.com',0,1,'2017-09-04 02:54:39.935710'),(4,'pbkdf2_sha256$20000$6mWAkNGoudtY$++7hmT+ft3gTgH1GGH3d/4XTXIaiJqsJVq0XAz+kfTA=','2017-09-07 19:54:04.829359',0,'ddd','','','ddd@xyz.com',0,1,'2017-09-04 02:54:49.933826'),(5,'pbkdf2_sha256$20000$eirR2oTG3Wkv$XCl3tM4mNmKfxtzB7mafpCfte/ApnEDf89/jzJOJgFs=',NULL,0,'eee','','','eee@xyz.com',0,1,'2017-09-04 02:55:00.866174'),(7,'pbkdf2_sha256$20000$a3BiJAgYuH9h$FiVUZ6/sSBvBjY3Y1/iasE/7Bqrss2HgDn14hCazw6M=','2017-09-07 19:27:36.112498',1,'suraj','','','surajshah525@gmail.com',1,1,'2017-09-04 04:33:47.817717');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-04 02:38:57.273200'),(2,'auth','0001_initial','2017-09-04 02:38:57.676841'),(3,'admin','0001_initial','2017-09-04 02:38:57.783363'),(4,'contenttypes','0002_remove_content_type_name','2017-09-04 02:38:57.868509'),(5,'auth','0002_alter_permission_name_max_length','2017-09-04 02:38:57.886503'),(6,'auth','0003_alter_user_email_max_length','2017-09-04 02:38:57.904284'),(7,'auth','0004_alter_user_username_opts','2017-09-04 02:38:57.917164'),(8,'auth','0005_alter_user_last_login_null','2017-09-04 02:38:57.960738'),(9,'auth','0006_require_contenttypes_0002','2017-09-04 02:38:57.964210'),(10,'sessions','0001_initial','2017-09-04 02:38:57.997202'),(11,'surajsite','0001_initial','2017-09-04 02:38:58.129302'),(12,'surajsite','0002_userlogs_timestamp','2017-09-05 01:01:02.143956'),(13,'surajsite','0003_auto_20170905_0828','2017-09-05 08:28:44.483792'),(14,'surajsite','0004_auto_20170907_0746','2017-09-07 07:46:55.305470');
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
INSERT INTO `django_session` VALUES ('j3mkllifjckwjmlswwtilms0xl4vpomy','MGIyOTI4NDM2ZTBlZTI0YjVlM2VlZDNmOTUzYWZjYWQ1OWM1OGUwODp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNjM5ODM5OWE2NTJjMDg1MWY2NDEwMDZlM2UzN2Y2NzM2MTkyNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-09-20 10:57:40.946737');
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
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surajsite_loginlogs`
--

LOCK TABLES `surajsite_loginlogs` WRITE;
/*!40000 ALTER TABLE `surajsite_loginlogs` DISABLE KEYS */;
INSERT INTO `surajsite_loginlogs` VALUES (157,'user_logged_out','127.0.0.1','aaa','2017-09-07 09:47:56.149030'),(158,'user_logged_in','127.0.0.1','ddd','2017-09-07 09:48:16.407218'),(159,'user_logged_out','127.0.0.1','ddd','2017-09-07 09:48:19.128468'),(160,'user_logged_in','127.0.0.1','ddd','2017-09-07 18:05:28.095099'),(161,'user_logged_out','127.0.0.1','ddd','2017-09-07 18:08:44.588781'),(162,'user_logged_in','127.0.0.1','ddd','2017-09-07 18:10:33.974878'),(163,'user_logged_out','127.0.0.1','ddd','2017-09-07 18:11:27.023345'),(164,'user_logged_in','127.0.0.1','ddd','2017-09-07 18:13:45.092044'),(165,'user_logged_out','127.0.0.1','ddd','2017-09-07 19:21:54.431585'),(166,'user_logged_in','127.0.0.1','ddd','2017-09-07 19:21:57.807616'),(167,'user_logged_out','127.0.0.1','ddd','2017-09-07 19:22:05.419719'),(168,'user_logged_in','127.0.0.1','suraj','2017-09-07 19:22:23.102389'),(169,'user_logged_out','127.0.0.1','suraj','2017-09-07 19:22:36.427197'),(170,'user_logged_in','127.0.0.1','ddd','2017-09-07 19:23:02.339920'),(171,'user_logged_out','127.0.0.1','ddd','2017-09-07 19:26:40.160833'),(172,'user_logged_in','127.0.0.1','suraj','2017-09-07 19:27:36.115356'),(173,'user_logged_out','127.0.0.1','suraj','2017-09-07 19:27:51.086278'),(174,'user_logged_in','127.0.0.1','aaa','2017-09-07 19:30:37.231548'),(175,'user_logged_out','127.0.0.1','aaa','2017-09-07 19:30:42.664988'),(176,'user_logged_in','127.0.0.1','ddd','2017-09-07 19:30:48.127706'),(177,'user_logged_in','127.0.0.1','ddd','2017-09-07 19:53:32.947315'),(178,'user_logged_out','127.0.0.1','ddd','2017-09-07 19:53:40.981669'),(179,'user_logged_in','127.0.0.1','ddd','2017-09-07 19:54:04.831069'),(180,'user_logged_out','127.0.0.1','ddd','2017-09-07 20:07:57.846476'),(181,'user_logged_in','127.0.0.1','aaa','2017-09-07 20:08:05.336339'),(182,'user_logged_out','127.0.0.1','aaa','2017-09-07 20:09:14.545003'),(183,'user_logged_in','127.0.0.1','bbb','2017-09-07 20:09:23.718478'),(184,'user_logged_out','127.0.0.1','bbb','2017-09-07 20:10:38.855614'),(185,'user_logged_in','127.0.0.1','ccc','2017-09-07 20:10:44.839759'),(186,'user_logged_out','127.0.0.1','ccc','2017-09-07 20:12:25.962154'),(187,'user_logged_in','127.0.0.1','ccc','2017-09-07 20:14:03.235047'),(188,'user_logged_out','127.0.0.1','ccc','2017-09-07 20:14:10.256440'),(189,'user_logged_in','127.0.0.1','ccc','2017-09-07 20:20:27.436269'),(190,'user_logged_out','127.0.0.1','ccc','2017-09-07 20:20:29.828991');
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
  `main_link` longtext,
  PRIMARY KEY (`id`),
  KEY `suraj_user_id_3cefafcd2d1a5bd0_fk_surajsite_siteuser_user_ptr_id` (`user_id`),
  CONSTRAINT `suraj_user_id_3cefafcd2d1a5bd0_fk_surajsite_siteuser_user_ptr_id` FOREIGN KEY (`user_id`) REFERENCES `surajsite_siteuser` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=652 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surajsite_userlogs`
--

LOCK TABLES `surajsite_userlogs` WRITE;
/*!40000 ALTER TABLE `surajsite_userlogs` DISABLE KEYS */;
INSERT INTO `surajsite_userlogs` VALUES (562,'click','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java','How do I compare strings in Java?','2017-09-07 18:05:46.632941','2017-09-07 18:05:46.635610',4,'2017-09-07 18:05:46.718000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(563,'click','https://stackoverflow.com#','favorite','2017-09-07 18:05:51.086721','2017-09-07 18:05:51.091313',4,'2017-09-07 18:05:51.274000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(564,'scroll down','','','2017-09-07 18:05:59.231965','2017-09-07 18:05:59.234597',4,'2017-09-07 18:05:59.448000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(565,'scroll down','','','2017-09-07 18:06:52.209062','2017-09-07 18:06:52.212848',4,'2017-09-07 18:06:52.397000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(566,'scroll down','','','2017-09-07 18:10:39.649888','2017-09-07 18:10:39.659083',4,'2017-09-07 18:10:39.822000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(567,'scroll down','','','2017-09-07 18:10:50.115649','2017-09-07 18:10:50.121035',4,'2017-09-07 18:10:50.309000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(568,'click','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it','What is a NullPointerException, and how do I fix it?','2017-09-07 18:13:58.801869','2017-09-07 18:13:58.805055',4,'2017-09-07 18:13:58.959000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(569,'hover','','up vote','2017-09-07 18:16:25.952110','2017-09-07 18:16:25.955953',4,'2017-09-07 18:16:26.107000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(570,'hover','','up vote','2017-09-07 18:16:49.150513','2017-09-07 18:16:49.154217',4,'2017-09-07 18:16:49.347000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(571,'scroll down','','','2017-09-07 18:17:30.969163','2017-09-07 18:17:30.972149',4,'2017-09-07 18:17:31.138000','https://stackoverflow.com/questions/10511897/assigning-more-than-one-class-for-one-event'),(572,'scroll down','','','2017-09-07 18:17:34.781315','2017-09-07 18:17:34.786886',4,'2017-09-07 18:17:34.984000','https://stackoverflow.com/questions/10511897/assigning-more-than-one-class-for-one-event'),(573,'scroll down','','','2017-09-07 18:17:38.127373','2017-09-07 18:17:38.131846',4,'2017-09-07 18:17:38.329000','https://stackoverflow.com/questions/10511897/assigning-more-than-one-class-for-one-event'),(574,'scroll down','','','2017-09-07 18:17:42.473940','2017-09-07 18:17:42.477247',4,'2017-09-07 18:17:42.677000','https://stackoverflow.com/questions/10511897/assigning-more-than-one-class-for-one-event'),(575,'scroll down','','','2017-09-07 18:17:45.938165','2017-09-07 18:17:45.943052',4,'2017-09-07 18:17:46.141000','https://stackoverflow.com/questions/10511897/assigning-more-than-one-class-for-one-event'),(576,'hover','https://stackoverflow.com/questions/tagged/nullpointerexception','nullpointerexception','2017-09-07 18:18:26.304957','2017-09-07 18:18:26.307753',4,'2017-09-07 18:18:26.501000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(577,'hover','https://stackoverflow.com/questions/tagged/nullpointerexception','nullpointerexception','2017-09-07 18:18:39.251663','2017-09-07 18:18:39.254380',4,'2017-09-07 18:18:39.457000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(578,'hover','https://stackoverflow.com/questions/tagged/java','java','2017-09-07 18:18:39.326344','2017-09-07 18:18:39.331383',4,'2017-09-07 18:18:39.530000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(579,'scroll down','','','2017-09-07 18:22:17.502799','2017-09-07 18:22:17.505576',4,'2017-09-07 18:22:17.669000','https://stackoverflow.com/questions/11080631/track-bookmarking-event'),(580,'scroll down','','','2017-09-07 18:22:21.063838','2017-09-07 18:22:21.067014',4,'2017-09-07 18:22:21.268000','https://stackoverflow.com/questions/11080631/track-bookmarking-event'),(581,'hover','https://stackoverflow.com#','favorite','2017-09-07 18:23:19.793871','2017-09-07 18:23:19.796754',4,'2017-09-07 18:23:19.952000','https://stackoverflow.com/questions/6902695/can-i-detect-whether-a-browsers-bookmarks-toolbar-is-enabled-with-javascript'),(582,'scroll down','','','2017-09-07 18:23:23.221628','2017-09-07 18:23:23.226913',4,'2017-09-07 18:23:23.425000','https://stackoverflow.com/questions/6902695/can-i-detect-whether-a-browsers-bookmarks-toolbar-is-enabled-with-javascript'),(583,'scroll down','','','2017-09-07 18:23:31.493033','2017-09-07 18:23:31.495870',4,'2017-09-07 18:23:31.702000','https://stackoverflow.com/questions/6902695/can-i-detect-whether-a-browsers-bookmarks-toolbar-is-enabled-with-javascript'),(584,'scroll down','','','2017-09-07 18:23:36.658043','2017-09-07 18:23:36.660718',4,'2017-09-07 18:23:36.861000','https://stackoverflow.com/questions/6902695/can-i-detect-whether-a-browsers-bookmarks-toolbar-is-enabled-with-javascript'),(585,'scroll down','','','2017-09-07 18:23:44.435086','2017-09-07 18:23:44.437734',4,'2017-09-07 18:23:44.608000','https://stackoverflow.com/questions/5828965/bookmark-on-click-using-jquery'),(586,'scroll down','','','2017-09-07 18:24:04.750980','2017-09-07 18:24:04.755781',4,'2017-09-07 18:24:04.954000','https://stackoverflow.com/questions/5828965/bookmark-on-click-using-jquery'),(587,'scroll down','','','2017-09-07 18:24:07.475842','2017-09-07 18:24:07.478622',4,'2017-09-07 18:24:07.682000','https://stackoverflow.com/questions/5828965/bookmark-on-click-using-jquery'),(588,'scroll up','','','2017-09-07 18:24:19.684753','2017-09-07 18:24:19.688858',4,'2017-09-07 18:24:19.887000','https://stackoverflow.com/questions/5828965/bookmark-on-click-using-jquery'),(589,'hover','https://stackoverflow.com/questions/tagged/google-chrome','<img src=\"//i.stack.imgur.com/EdUwb.png\" height=\"16\" width=\"18\" alt=\"\" class=\"sponsor-tag-img\">google-chrome','2017-09-07 18:25:30.201439','2017-09-07 18:25:30.204435',4,'2017-09-07 18:25:30.314000','https://stackoverflow.com/questions/18872679/function-as-google-chrome-bookmark'),(590,'scroll down','','','2017-09-07 18:25:32.452354','2017-09-07 18:25:32.456126',4,'2017-09-07 18:25:32.655000','https://stackoverflow.com/questions/18872679/function-as-google-chrome-bookmark'),(591,'scroll down','','','2017-09-07 18:25:42.410486','2017-09-07 18:25:42.413511',4,'2017-09-07 18:25:42.611000','https://stackoverflow.com/questions/18872679/function-as-google-chrome-bookmark'),(592,'scroll down','','','2017-09-07 18:25:44.654124','2017-09-07 18:25:44.659021',4,'2017-09-07 18:25:44.857000','https://stackoverflow.com/questions/18872679/function-as-google-chrome-bookmark'),(593,'hover','','up vote','2017-09-07 18:25:46.815093','2017-09-07 18:25:46.817905',4,'2017-09-07 18:25:47.012000','https://stackoverflow.com/questions/18872679/function-as-google-chrome-bookmark'),(594,'scroll down','','','2017-09-07 18:25:47.299465','2017-09-07 18:25:47.302239',4,'2017-09-07 18:25:47.506000','https://stackoverflow.com/questions/18872679/function-as-google-chrome-bookmark'),(595,'scroll up','','','2017-09-07 18:25:50.604775','2017-09-07 18:25:50.608483',4,'2017-09-07 18:25:50.820000','https://stackoverflow.com/questions/18872679/function-as-google-chrome-bookmark'),(596,'scroll down','','','2017-09-07 18:27:24.219612','2017-09-07 18:27:24.223333',4,'2017-09-07 18:27:24.290000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(597,'scroll down','','','2017-09-07 18:27:30.238090','2017-09-07 18:27:30.240949',4,'2017-09-07 18:27:30.445000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(598,'scroll down','','','2017-09-07 18:27:36.149705','2017-09-07 18:27:36.154463',4,'2017-09-07 18:27:36.355000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(599,'scroll down','','','2017-09-07 18:27:41.779543','2017-09-07 18:27:41.782426',4,'2017-09-07 18:27:42.000000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(600,'scroll down','','','2017-09-07 18:27:45.472761','2017-09-07 18:27:45.476517',4,'2017-09-07 18:27:45.678000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(601,'scroll down','','','2017-09-07 18:27:50.090038','2017-09-07 18:27:50.092960',4,'2017-09-07 18:27:50.294000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(602,'scroll up','','','2017-09-07 18:27:51.477215','2017-09-07 18:27:51.480004',4,'2017-09-07 18:27:51.686000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(603,'scroll up','','','2017-09-07 18:30:04.965303','2017-09-07 18:30:04.968297',4,'2017-09-07 18:30:05.133000','https://stackoverflow.com/questions/14969467/how-to-check-with-jquery-if-any-form-is-submitted'),(604,'Search','https://stackoverflow.com/search','/search','2017-09-07 19:04:00.393998','2017-09-07 19:04:00.398336',4,'2017-09-07 19:04:00.756000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(605,'Search','https://stackoverflow.com/search','/search','2017-09-07 19:04:18.314838','2017-09-07 19:04:18.317874',4,'2017-09-07 19:04:18.683000','https://stackoverflow.com/search?q=%5Bjava%5D+random'),(606,'hover','https://stackoverflow.com/questions/tagged/c%2b%2b','c++','2017-09-07 19:04:46.058248','2017-09-07 19:04:46.065265',4,'2017-09-07 19:04:46.457000','https://stackoverflow.com/search?q=%5Bjava%5D+random'),(607,'Search','https://stackoverflow.com/search','/search','2017-09-07 19:05:33.530004','2017-09-07 19:05:33.539245',4,'2017-09-07 19:05:33.945000','https://stackoverflow.com/search?q=%5Bjava%5D+random'),(608,'Search','https://stackoverflow.com/search','/search','2017-09-07 19:05:37.704262','2017-09-07 19:05:37.707136',4,'2017-09-07 19:05:38.132000','https://stackoverflow.com/search?q=%5Bjava%5D+random'),(609,'Search','https://stackoverflow.com/search','/search','2017-09-07 19:06:20.655824','2017-09-07 19:06:20.658733',4,'2017-09-07 19:06:21.082000','https://stackoverflow.com/search?q=%5Bjava%5D+random'),(610,'Search','https://stackoverflow.com/search','/search','2017-09-07 19:06:22.034227','2017-09-07 19:06:22.037453',4,'2017-09-07 19:06:22.466000','https://stackoverflow.com/search?q=%5Bjava%5D+random'),(611,'click','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java','How do I compare strings in Java?','2017-09-07 19:23:25.726770','2017-09-07 19:23:25.730230',4,'2017-09-07 19:23:26.150000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(612,'hover','https://stackoverflow.com/questions/tagged/java','java','2017-09-07 19:23:52.328846','2017-09-07 19:23:52.332329',4,'2017-09-07 19:23:52.765000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(613,'hover','https://stackoverflow.com/questions/tagged/string','string','2017-09-07 19:24:59.009053','2017-09-07 19:24:59.014500',4,'2017-09-07 19:24:59.384000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(614,'scroll down','','','2017-09-07 19:25:21.391873','2017-09-07 19:25:21.394818',4,'2017-09-07 19:25:21.816000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(615,'scroll up','','','2017-09-07 19:25:24.719305','2017-09-07 19:25:24.722205',4,'2017-09-07 19:25:25.143000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(616,'scroll down','','','2017-09-07 19:25:37.631440','2017-09-07 19:25:37.634413',4,'2017-09-07 19:25:38.064000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(617,'scroll up','','','2017-09-07 19:25:44.088690','2017-09-07 19:25:44.091778',4,'2017-09-07 19:25:44.525000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(618,'scroll down','','','2017-09-07 20:08:22.129790','2017-09-07 20:08:22.132978',1,'2017-09-07 20:08:23.304000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(619,'click','https://stackoverflow.com/questions/504103/how-do-i-write-a-correct-micro-benchmark-in-java','How do I write a correct micro-benchmark in Java?','2017-09-07 20:08:25.852756','2017-09-07 20:08:25.855482',1,'2017-09-07 20:08:27.175000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(620,'hover','','up vote','2017-09-07 20:08:33.852522','2017-09-07 20:08:33.856100',1,'2017-09-07 20:08:35.176000','https://stackoverflow.com/questions/504103/how-do-i-write-a-correct-micro-benchmark-in-java'),(621,'click','','up vote','2017-09-07 20:08:36.131385','2017-09-07 20:08:36.134129',1,'2017-09-07 20:08:37.458000','https://stackoverflow.com/questions/504103/how-do-i-write-a-correct-micro-benchmark-in-java'),(622,'hover','https://stackoverflow.com/questions/tagged/java','java','2017-09-07 20:08:39.927212','2017-09-07 20:08:39.929818',1,'2017-09-07 20:08:41.254000','https://stackoverflow.com/questions/504103/how-do-i-write-a-correct-micro-benchmark-in-java'),(623,'scroll up','','','2017-09-07 20:08:42.075935','2017-09-07 20:08:42.078558',1,'2017-09-07 20:08:43.403000','https://stackoverflow.com/questions/504103/how-do-i-write-a-correct-micro-benchmark-in-java'),(624,'scroll up','','','2017-09-07 20:08:45.123655','2017-09-07 20:08:45.126651',1,'2017-09-07 20:08:46.450000','https://stackoverflow.com/questions/504103/how-do-i-write-a-correct-micro-benchmark-in-java'),(625,'click','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java','How do I compare strings in Java?','2017-09-07 20:09:38.068032','2017-09-07 20:09:38.072029',2,'2017-09-07 20:09:39.376000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(626,'hover','https://stackoverflow.com/questions/tagged/java','java','2017-09-07 20:09:40.308886','2017-09-07 20:09:40.311652',2,'2017-09-07 20:09:41.630000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(627,'Search','https://stackoverflow.com/search','/search','2017-09-07 20:09:44.609549','2017-09-07 20:09:44.612369',2,'2017-09-07 20:09:45.933000','https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java'),(628,'hover','https://stackoverflow.com/questions/tagged/validation','validation','2017-09-07 20:09:46.766941','2017-09-07 20:09:46.771916',2,'2017-09-07 20:09:48.092000','https://stackoverflow.com/search?q=random+stuff'),(629,'click','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff?s=3|2.6427','\n        Q: why isn\'t this returning random stuff? \n    ','2017-09-07 20:09:47.403955','2017-09-07 20:09:47.406851',2,'2017-09-07 20:09:48.728000','https://stackoverflow.com/search?q=random+stuff'),(630,'scroll down','','','2017-09-07 20:09:50.035704','2017-09-07 20:09:50.038608',2,'2017-09-07 20:09:51.359000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(631,'scroll up','','','2017-09-07 20:09:51.498496','2017-09-07 20:09:51.501138',2,'2017-09-07 20:09:52.825000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(632,'Search','https://stackoverflow.com/questions/9063329/answer/submit','/questions/9063329/answer/submit','2017-09-07 20:09:53.329250','2017-09-07 20:09:53.331984',2,'2017-09-07 20:09:54.655000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(633,'scroll down','','','2017-09-07 20:09:54.592245','2017-09-07 20:09:54.595536',2,'2017-09-07 20:09:55.919000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(634,'scroll up','','','2017-09-07 20:09:56.888489','2017-09-07 20:09:56.891474',2,'2017-09-07 20:09:58.216000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(635,'scroll down','','','2017-09-07 20:10:15.121135','2017-09-07 20:10:15.123823',2,'2017-09-07 20:10:16.448000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(636,'Search','https://stackoverflow.com/questions/9063329/answer/submit','/questions/9063329/answer/submit','2017-09-07 20:10:19.147215','2017-09-07 20:10:19.149818',2,'2017-09-07 20:10:20.472000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(637,'scroll down','','','2017-09-07 20:10:20.566590','2017-09-07 20:10:20.571350',2,'2017-09-07 20:10:21.893000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(638,'scroll up','','','2017-09-07 20:10:24.280556','2017-09-07 20:10:24.283329',2,'2017-09-07 20:10:25.607000','https://stackoverflow.com/questions/9063329/why-isnt-this-returning-random-stuff'),(639,'hover','https://stackoverflow.com/questions/tagged/nullpointerexception','nullpointerexception','2017-09-07 20:11:06.216730','2017-09-07 20:11:06.219507',3,'2017-09-07 20:11:07.384000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(640,'click','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it','What is a NullPointerException, and how do I fix it?','2017-09-07 20:11:07.708868','2017-09-07 20:11:07.711846',3,'2017-09-07 20:11:09.029000','https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15'),(641,'hover','https://stackoverflow.com#','favorite','2017-09-07 20:11:09.551813','2017-09-07 20:11:09.554616',3,'2017-09-07 20:11:10.874000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(642,'click','https://stackoverflow.com#','favorite','2017-09-07 20:11:10.367976','2017-09-07 20:11:10.370853',3,'2017-09-07 20:11:11.693000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(643,'hover','','up vote','2017-09-07 20:11:12.634763','2017-09-07 20:11:12.637434',3,'2017-09-07 20:11:13.961000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(644,'click','','up vote','2017-09-07 20:11:13.435492','2017-09-07 20:11:13.438191',3,'2017-09-07 20:11:14.762000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(645,'scroll down','','','2017-09-07 20:11:16.008293','2017-09-07 20:11:16.010896',3,'2017-09-07 20:11:17.327000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(646,'scroll down','','','2017-09-07 20:11:18.613166','2017-09-07 20:11:18.616062',3,'2017-09-07 20:11:19.940000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(647,'scroll down','','','2017-09-07 20:11:21.276462','2017-09-07 20:11:21.280967',3,'2017-09-07 20:11:22.604000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(648,'Search','https://stackoverflow.com/search','/search','2017-09-07 20:11:26.845798','2017-09-07 20:11:26.848411',3,'2017-09-07 20:11:28.172000','https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it'),(649,'click','https://stackoverflow.com/questions','Questions','2017-09-07 20:11:30.876891','2017-09-07 20:11:30.882104',3,'2017-09-07 20:11:32.188000','https://stackoverflow.com/search?q=use'),(650,'click','https://stackoverflow.com/documentation','Documentation <small class=\"beta-badge\">beta</small>','2017-09-07 20:11:33.587562','2017-09-07 20:11:33.590649',3,'2017-09-07 20:11:34.907000','https://stackoverflow.com/questions'),(651,'Search','https://stackoverflow.com/search','/search','2017-09-07 20:11:44.801467','2017-09-07 20:11:44.804268',3,'2017-09-07 20:11:46.113000','https://stackoverflow.com/documentation');
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

-- Dump completed on 2017-09-07 20:22:42
