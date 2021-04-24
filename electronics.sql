-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: electronics
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

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
-- Table structure for table `article`
--

Create Database electronics

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Beschreibung` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Gassensor','MQ-135','Detektion von Co2, Benzon, Alkohol und Rauch',25,9.99),(2,'Pi Auto 4Rad','diymore4 Rad Robotor','Chassis mit 4 Rädern und Motoren',10,18.90),(3,'Pi Auto 2Rad','DIY Kit 2WD','Chassis mit 2 Rädern und Motoren',15,14.90),(4,'Ultraschall Sensor','HC-SR04','Ultraschlallsensor zur Entfernungsmessung',40,4.99),(5,'Microcontroller','ESP 8266','Microcontroller mit USB anschluß und WIFI udn Bluteooth',23,6.99);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_teacher` int(11) DEFAULT NULL,
  `id_student` int(11) DEFAULT NULL,
  `id_article` int(11) DEFAULT NULL,
  `borrowDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
INSERT INTO `borrowed` VALUES (1,NULL,1,1,'2021-02-05 23:00:00',1),(2,NULL,1,1,'2021-02-05 23:00:00',1),(3,NULL,1,2,'2011-02-01 23:00:00',2),(4,NULL,1,2,'2011-02-01 23:00:00',2),(5,NULL,1,2,'2021-02-06 12:04:56',2),(6,NULL,3,1,'2021-02-06 13:02:25',1),(7,NULL,3,3,'2021-02-06 13:03:42',2),(8,NULL,3,3,'2021-02-06 13:12:16',1),(9,NULL,3,2,'2021-02-06 13:16:23',1),(10,NULL,3,1,'2021-02-06 13:20:07',1),(11,NULL,3,3,'2021-02-06 13:25:35',1),(12,NULL,3,3,'2021-02-06 13:25:46',1),(13,NULL,3,1,'2021-02-06 13:26:06',1),(14,NULL,3,2,'2021-02-06 13:26:16',1),(15,NULL,3,2,'2021-02-06 13:27:50',1),(16,NULL,3,3,'2021-02-07 09:36:51',0),(17,NULL,3,3,'2021-02-06 18:39:17',1),(18,NULL,3,3,'2021-02-06 19:22:06',1),(19,NULL,3,3,'2021-02-06 19:22:08',1),(20,NULL,3,3,'2021-02-06 20:03:16',1),(21,NULL,3,2,'2021-02-06 20:12:58',1),(22,NULL,3,1,'2021-02-07 09:31:09',1),(23,NULL,3,4,'2021-02-07 09:53:26',1),(24,NULL,3,4,'2021-02-07 09:57:30',1),(25,NULL,3,4,'2021-02-07 09:58:16',1),(26,NULL,3,4,'2021-02-07 09:58:30',1),(27,NULL,3,4,'2021-02-07 09:58:48',1),(28,NULL,3,4,'2021-02-07 09:59:04',1),(29,NULL,3,4,'2021-02-07 09:59:07',1),(30,NULL,3,5,'2021-02-07 10:00:03',3),(31,NULL,3,4,'2021-02-07 10:00:15',3),(32,NULL,3,3,'2021-02-07 14:33:25',1),(33,NULL,3,3,'2021-02-07 14:35:50',1),(34,NULL,3,4,'2021-02-07 14:37:29',1),(35,NULL,3,4,'2021-02-07 14:38:10',1),(36,NULL,3,4,'2021-02-07 14:38:27',1),(37,NULL,3,4,'2021-02-07 14:42:42',1),(38,NULL,3,4,'2021-02-07 15:00:30',1),(39,NULL,3,3,'2021-02-07 15:02:46',1),(40,NULL,3,3,'2021-02-07 15:06:08',1),(41,NULL,3,4,'2021-02-07 15:17:56',1),(42,NULL,3,4,'2021-02-07 15:18:07',1),(43,NULL,3,3,'2021-02-07 15:19:01',1),(44,NULL,3,3,'2021-02-07 15:20:05',1),(45,NULL,3,4,'2021-02-07 15:23:14',1),(46,NULL,3,4,'2021-02-07 17:11:39',1),(47,NULL,3,1,'2021-02-07 17:13:12',1),(48,NULL,3,4,'2021-02-07 17:14:29',1),(49,NULL,3,1,'2021-02-07 18:23:57',1),(50,NULL,2,2,'2021-02-07 18:42:04',0),(51,NULL,3,1,'2021-02-07 18:57:21',1),(52,NULL,3,4,'2021-02-12 18:17:44',1),(53,NULL,2,2,'2021-02-12 19:34:50',1),(54,NULL,2,2,'2021-02-12 19:38:28',1),(55,NULL,2,1,'2021-02-12 20:47:15',2),(56,NULL,2,5,'2021-02-12 20:47:44',2),(57,NULL,1,1,'2021-02-13 08:41:23',1),(58,NULL,3,1,'2021-02-14 08:31:40',3),(59,NULL,3,3,'2021-02-14 11:06:32',2),(60,NULL,3,3,'2021-02-14 11:07:39',1),(61,NULL,2,2,'2021-02-14 18:45:05',3),(62,NULL,3,2,'2021-02-19 06:26:27',2);
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returnDetails`
--

DROP TABLE IF EXISTS `returnDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_borrowed` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `returnDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnDetails`
--

LOCK TABLES `returnDetails` WRITE;
/*!40000 ALTER TABLE `returnDetails` DISABLE KEYS */;
INSERT INTO `returnDetails` VALUES (19,30,2,'2021-02-12 20:45:31'),(20,30,1,'2021-02-12 20:45:40'),(21,54,1,'2021-02-12 20:46:04'),(22,53,1,'2021-02-12 20:46:14'),(23,52,1,'2021-02-12 20:46:34'),(24,51,1,'2021-02-12 20:46:40'),(25,50,1,'2021-02-12 20:46:44'),(26,49,1,'2021-02-12 20:46:50'),(27,5,2,'2021-02-13 08:10:48'),(28,4,1,'2021-02-13 08:11:19'),(29,6,1,'2021-02-14 08:13:02'),(30,10,1,'2021-02-14 08:13:29'),(31,13,1,'2021-02-14 08:13:55'),(32,9,1,'2021-02-14 08:14:16'),(33,44,1,'2021-02-14 08:15:02'),(34,43,1,'2021-02-14 08:15:05'),(35,40,1,'2021-02-14 08:15:07'),(36,39,1,'2021-02-14 08:15:11'),(37,33,1,'2021-02-14 08:15:13'),(38,32,1,'2021-02-14 08:15:16'),(39,20,1,'2021-02-14 08:15:19'),(40,19,1,'2021-02-14 08:15:22'),(41,7,1,'2021-02-14 08:16:05'),(42,16,0,'2021-02-14 08:16:34'),(43,7,1,'2021-02-14 08:16:53'),(44,22,1,'2021-02-14 08:24:56'),(45,47,1,'2021-02-14 08:25:31'),(46,58,1,'2021-02-14 08:32:04'),(47,58,0,'2021-02-14 08:32:34'),(48,58,1,'2021-02-14 09:48:11'),(49,8,1,'2021-02-14 09:52:59'),(50,11,1,'2021-02-14 09:53:05'),(51,12,1,'2021-02-14 09:53:08'),(52,14,1,'2021-02-14 11:19:34'),(53,15,1,'2021-02-14 11:19:35'),(54,21,1,'2021-02-14 11:19:40'),(55,4,1,'2021-02-14 11:20:03'),(56,3,1,'2021-02-14 11:20:04'),(57,3,1,'2021-02-14 11:21:35'),(58,1,1,'2021-02-14 18:37:56'),(59,2,1,'2021-02-14 18:37:57'),(60,57,1,'2021-02-14 18:37:57'),(61,55,2,'2021-02-14 18:38:13'),(62,58,1,'2021-02-14 18:38:25'),(63,17,1,'2021-02-14 18:41:04'),(64,18,1,'2021-02-14 18:41:05'),(65,59,1,'2021-02-14 18:41:06'),(66,60,1,'2021-02-14 18:41:07'),(67,59,1,'2021-02-14 18:43:08'),(68,56,2,'2021-02-14 18:44:10'),(69,61,2,'2021-02-14 18:45:20'),(70,61,1,'2021-02-14 18:45:31');
/*!40000 ALTER TABLE `returnDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nachname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Klasse` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Norbert','Hill','AIT21','h.n@sus-am-bk-tm.de'),(2,'Samira','Meyer','AIT22','m.s@sus-am-bk-tm.de'),(3,'Thomas','Müller','AIT32','m.t@sus-am-bk-tm.de');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kuerzel` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'hue','hueller'),(2,'bd','burdenski'),(3,'wae','waechter'),(4,'ha','hegermann'),(5,'op','opalla');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-19 19:36:44
