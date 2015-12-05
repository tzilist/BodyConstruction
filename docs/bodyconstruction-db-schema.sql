-- MySQL dump 10.13  Distrib 5.5.45, for CYGWIN (i686)
--
-- Host: localhost    Database: bodyconstruction
-- ------------------------------------------------------
-- Server version	5.5.45

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
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `journalcol` varchar(45) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `weight_kg` float DEFAULT NULL,
  `BMI` float DEFAULT NULL,
  `body_fat_pct` float DEFAULT NULL,
  `waist_cm` float DEFAULT NULL,
  `arm_cm` float DEFAULT NULL,
  `neck_cm` float DEFAULT NULL,
  `chest_cm` float DEFAULT NULL,
  `hip_cm` float DEFAULT NULL,
  `thigh_cm` float DEFAULT NULL,
  `photo_uri` varchar(255) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`date_entered`),
  UNIQUE KEY `id_UNIQUE` (`row_id`),
  KEY `fk_journal_user_idx` (`user_id`),
  CONSTRAINT `fk_journal_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` (`row_id`, `date_entered`, `journalcol`, `user_id`, `weight_kg`, `BMI`, `body_fat_pct`, `waist_cm`, `arm_cm`, `neck_cm`, `chest_cm`, `hip_cm`, `thigh_cm`, `photo_uri`, `last_updated`, `comment`) VALUES (29,'2015-11-05 22:39:37',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pacquiao_Manny_muscles_pre_Morales_3_HoganPhotos_lx.jpg',NULL,'starting out'),(30,'2015-11-05 22:39:43',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Super_Manny_Pose_2.png',NULL,'whatever was I thinking?'),(31,'2015-11-05 22:39:44',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'YAhvSk.gif',NULL,'getting more massive?'),(32,'2015-11-05 22:39:45',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'manny-pacquiao.png',NULL,'muscle me more'),(33,'2015-11-06 03:47:26',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'maxresdefault.jpg',NULL,'kill me, it hurts!'),(34,'2015-11-06 03:47:40',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'turbulent_juice_by_gablesmcgee-d7y8u39.png',NULL,'Progress, BABY'),(35,'2015-11-06 03:48:00',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'unnamed.jpg',NULL,'Goal achieved!'),(37,'2015-11-06 19:06:42',NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'2015-11-06 19:06:43',NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'2015-11-06 19:06:44',NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'2015-11-06 19:06:45',NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `authmethod` varchar(45) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `firstname`, `lastname`, `email`, `authmethod`, `password`, `is_active`) VALUES (8,'Gortsleigh',NULL,NULL,'gregory@dynapse.com',NULL,'pbkdf2:sha1:1000$3wRUuEAb$d1829cacd515c29128692d3033461a07113132ed',0),(10,'Tedzilla',NULL,NULL,'tedzilla@hotmail.com',NULL,'',0),(12,'Gortsleigh2',NULL,NULL,'gortsleigh@yahoo.co.uk',NULL,'',0),(13,'admin',NULL,NULL,'admin',NULL,'pbkdf2:sha1:1000$pAEVeY0z$02e93bbe28805ad2b56bf7a27c763dabc1a587e5',0),(17,'Gortsleigh33',NULL,NULL,'sneeb@sneeb.com',NULL,'pbkdf2:sha1:1000$WxWAPB6V$9327319ac6068c7c0f3335a1f4718323c508c4f2',0),(18,'Gortsleigh333',NULL,NULL,'sneeb@sneeb.com2',NULL,'pbkdf2:sha1:1000$8HbcIUU6$2dcf381199e574c34906318af8ec942a2786ad07',0),(19,'rozili',NULL,NULL,'rozili@rozili.com',NULL,'pbkdf2:sha1:1000$h1TdlUWy$e1cb91132092c6b096c96200bd3b4e94c13ae7f0',0),(20,'gorty',NULL,NULL,'gorty@gort.org',NULL,'',0),(22,'gorty2',NULL,NULL,'gorty2@gort.org',NULL,'',0),(23,'gorty3',NULL,NULL,'',NULL,'',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-22 11:17:42
