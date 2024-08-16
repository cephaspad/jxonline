-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: server1
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `OfflineMsg`
--

DROP TABLE IF EXISTS `OfflineMsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OfflineMsg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Receiver` tinyblob,
  `Sender` tinyblob,
  `Msg` longblob,
  `LastModify` datetime DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`),
  KEY `Receiver` (`Receiver`(32)),
  KEY `LastModify` (`LastModify`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OfflineMsg`
--

LOCK TABLES `OfflineMsg` WRITE;
/*!40000 ALTER TABLE `OfflineMsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `OfflineMsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerTag`
--

DROP TABLE IF EXISTS `PlayerTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PlayerTag` (
  `rolename` varchar(32) NOT NULL,
  `data` blob,
  PRIMARY KEY (`rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerTag`
--

LOCK TABLES `PlayerTag` WRITE;
/*!40000 ALTER TABLE `PlayerTag` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlayerTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relation`
--

DROP TABLE IF EXISTS `Relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` tinyblob NOT NULL,
  `Data` longblob,
  PRIMARY KEY (`RoleName`(32)),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relation`
--

LOCK TABLES `Relation` WRITE;
/*!40000 ALTER TABLE `Relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` tinyblob NOT NULL,
  `Account` varchar(32) DEFAULT NULL,
  `RoleData` longblob,
  `LastModify` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleName`(32)),
  UNIQUE KEY `ID` (`ID`),
  KEY `Account` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleBack`
--

DROP TABLE IF EXISTS `RoleBack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoleBack` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Account` varchar(32) DEFAULT NULL,
  `RoleName` tinyblob,
  `RoleData` longblob,
  `LastModify` datetime DEFAULT NULL,
  `Reason` tinyint(4) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`),
  KEY `Account` (`Account`),
  KEY `RoleName` (`RoleName`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleBack`
--

LOCK TABLES `RoleBack` WRITE;
/*!40000 ALTER TABLE `RoleBack` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoleBack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShareData`
--

DROP TABLE IF EXISTS `ShareData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ShareData` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShareKey` tinyblob NOT NULL,
  `Param1` int(10) unsigned NOT NULL,
  `Param2` int(10) unsigned NOT NULL,
  `Data` longblob,
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `ShareKey` (`ShareKey`(32),`Param1`,`Param2`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShareData`
--

LOCK TABLES `ShareData` WRITE;
/*!40000 ALTER TABLE `ShareData` DISABLE KEYS */;
INSERT INTO `ShareData` VALUES (2,_binary 'FUNC_SERVER_OPEN_TIME\0',0,0,_binary '\0\0\0\0\âš\ÙA'),(8,_binary 'GAME_DUNGEON\0',0,0,NULL),(10,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',0,0,_binary '\0\0\0'),(11,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,0,_binary '\0\0\0\0'),(12,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,1,_binary '\0'),(13,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,2,_binary '\0'),(14,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(15,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(16,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(17,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,6,_binary 'ÿÿÿÿ'),(18,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,7,_binary 'ÿÿÿÿ'),(19,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',1,8,_binary '\0\0\0\0'),(20,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,0,_binary '\0\0\0'),(21,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,1,_binary '\0'),(22,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,2,_binary '\0'),(23,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(24,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(25,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(26,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,6,_binary 'ÿÿÿÿ'),(27,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,7,_binary 'ÿÿÿÿ'),(28,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',2,8,_binary '\0\0\0\0'),(29,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,0,_binary '\0\0\0'),(30,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,1,_binary '\0'),(31,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,2,_binary '\0'),(32,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(33,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(34,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(35,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,6,_binary 'ÿÿÿÿ'),(36,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,7,_binary 'ÿÿÿÿ'),(37,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',3,8,_binary '\0\0\0\0'),(38,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,0,_binary '\0\0\0'),(39,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,1,_binary '\0'),(40,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,2,_binary '\0'),(41,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(42,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(43,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(44,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,6,_binary 'ÿÿÿÿ'),(45,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,7,_binary 'ÿÿÿÿ'),(46,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',4,8,_binary '\0\0\0\0'),(47,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,0,_binary '\0\0\0'),(48,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,1,_binary '\0'),(49,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,2,_binary '\0'),(50,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(51,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(52,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(53,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,6,_binary 'ÿÿÿÿ'),(54,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,7,_binary 'ÿÿÿÿ'),(55,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',5,8,_binary '\0\0\0\0'),(56,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,0,_binary '\0\0\0'),(57,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,1,_binary '\0'),(58,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,2,_binary '\0'),(59,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(60,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(61,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(62,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,6,_binary 'ÿÿÿÿ'),(63,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,7,_binary 'ÿÿÿÿ'),(64,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',6,8,_binary '\0\0\0\0'),(65,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,0,_binary '\0\0\0'),(66,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,1,_binary '\0'),(67,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,2,_binary '\0'),(68,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(69,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(70,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(71,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,6,_binary 'ÿÿÿÿ'),(72,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,7,_binary 'ÿÿÿÿ'),(73,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',7,8,_binary '\0\0\0\0'),(74,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,0,_binary '\0\0\0'),(75,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,1,_binary '\0'),(76,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,2,_binary '\0'),(77,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,3,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(78,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,4,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(79,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,5,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(80,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,6,_binary 'ÿÿÿÿ'),(81,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,7,_binary 'ÿÿÿÿ'),(82,_binary '³\ÇÕ½-³\Ç\Çø\Êý¾\Ý\0',8,8,_binary '\0\0\0\0'),(83,_binary 'GAME_LADDER\0',10270,1,_binary '\0\0\0TLDaoVN\0<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(84,_binary 'GAME_LEAGUE\0',4,3989547523,_binary 'ˆ\0\0\0\0\0\05\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@kf\06\0\0\0\0\0\0\0\0\0\0\0\0\0\05\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\'@kf\0\0\0\0\0\0\0'),(85,_binary 'GAME_LEAGUE\0',4,3989547538,_binary 'ˆ\0\0\0\0\0\06\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@kf\06\0\0\0\0\0\0\0\0\0\0\0\0\0\06\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\'@kf\0\0\0\0\0\0\0'),(86,_binary 'GAME_LEAGUE\0',4,3989547553,_binary 'ˆ\0\0\0\0\0\07\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@kf\06\0\0\0\0\0\0\0\0\0\0\0\0\0\07\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\'@kf\0\0\0\0\0\0\0'),(87,_binary 'GAME_LEAGUE\0',4,3989547719,_binary 'ˆ\0\0\0\0\0\01\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@kf\06\0\0\0\0\0\0\0\0\0\0\0\0\0\01\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\'@kf\0\0\0\0\0\0\0'),(88,_binary 'GAME_LEAGUE\0',4,3989547734,_binary 'ˆ\0\0\0\0\0\02\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@kf\06\0\0\0\0\0\0\0\0\0\0\0\0\0\02\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\'@kf\0\0\0\0\0\0\0'),(89,_binary 'GAME_LEAGUE\0',4,3989547749,_binary 'ˆ\0\0\0\0\0\03\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@kf\06\0\0\0\0\0\0\0\0\0\0\0\0\0\03\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\'@kf\0\0\0\0\0\0\0'),(90,_binary 'GAME_LEAGUE\0',4,3989547764,_binary 'ˆ\0\0\0\0\0\04\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@kf\06\0\0\0\0\0\0\0\0\0\0\0\0\0\04\0unjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\'@kf\0\0\0\0\0\0\0'),(91,_binary 'GAME_LEAGUE\0',502,663605385,_binary 'ˆ\0\0\0\ö\0\0Ho¹t ®\éng xu©n 2006\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ho¹t ®\éng xu©n 2006\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(92,_binary 'GAME_LEAGUE\0',502,1081242479,_binary 'ˆ\0\0\0\ö\0\0chunjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0chunjie2009_dangboss\0m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(93,_binary 'GAME_LEAGUE\0',502,1754936316,_binary 'ˆ\0\0\0\ö\0\0YANDIBAOZANG_TALK\0\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0YANDIBAOZANG_TALK\0\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(94,_binary 'GAME_LEAGUE\0',502,1808099482,_binary 'ˆ\0\0\0\ö\0\0Thi\Öp th«ng b¸o ch\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Thi\Öp th«ng b¸o ch\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(95,_binary 'GAME_LEAGUE\0',502,2533843065,_binary 'ˆ\0\0\0\ö\0\0SWITH_DAIYITOUSHI\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0SWITH_DAIYITOUSHI\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(96,_binary 'GAME_LEAGUE\0',502,2596003818,_binary 'ˆ\0\0\0\ö\0\0Ph\óc duyªn ph¸o hoa\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ph\óc duyªn ph¸o hoa\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(97,_binary 'GAME_LEAGUE\0',502,2655654379,_binary 'ˆ\0\0\0\ö\0\0L\Ô v\Ët t\×nh nh©n\006\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0L\Ô v\Ët t\×nh nh©n\006\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(98,_binary 'GAME_LEAGUE\0',502,2867085147,_binary 'ˆ\0\0\0\ö\0\0Truy\Òn c«ng\0b¸o ch\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Truy\Òn c«ng\0b¸o ch\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(99,_binary 'GAME_LEAGUE\0',502,3850167185,_binary 'ˆ\0\0\0\ö\0\0OpenShop\0nh nh©n\006\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0OpenShop\0nh nh©n\006\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(100,_binary 'GAME_LEAGUE\0',502,4028493098,_binary 'ˆ\0\0\0\ö\0\0YANDIBAOZANG\0¸o ch\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0YANDIBAOZANG\0¸o ch\óc m\õng mµu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(101,_binary 'GAME_LEAGUE\0',502,4147447889,_binary 'ˆ\0\0\0\ö\0\0Thi\Öp cu\én\0TOUSHI\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Thi\Öp cu\én\0TOUSHI\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(102,_binary 'DynMapInfo\0',1,0,_binary '\Ê\0'),(104,_binary 'GAME_LADDER\0',10270,2,_binary '\0\0\0ThichTreoGame\0<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[\0\0\0'),(105,_binary 'GAME_LADDER\0',10270,3,_binary '\r\0\0\0Truong3Phong\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0'),(106,_binary 'GAME_LADDER\0',10272,1,_binary '\0\0\0TLDaoVN\0<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(107,_binary 'BATTLE_1_1\0',1,1,_binary '\0\0\0	\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(108,_binary 'BATTLE_1_2\0',1,1,_binary '\0\0\0	\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(109,_binary 'BATTLE_1_3\0',1,1,_binary '\0\0\0	\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(110,_binary 'BATTLE_LATEST_INFO\0',1,1,_binary '\0\0\0\n\0\0\0'),(111,_binary 'BATTLE_LATEST_INFO\0',1,2,_binary '\0\0\0\n\0\0\0'),(112,_binary 'BATTLE_LATEST_INFO\0',1,3,_binary '\0\0\0\n\0\0\0'),(113,_binary 'GAME_LEAGUE\0',10000,170495098,_binary 'R\0\0\0\'\0\0stat_goodssale\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\âˆnf\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(114,_binary 'BATTLE_1_1\0',1,2,_binary '\0\0\0	\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(115,_binary 'BATTLE_1_2\0',1,2,_binary '\0\0\0\n\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(116,_binary 'BATTLE_1_3\0',1,2,_binary '\0\0\0	\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(117,_binary 'GAME_LADDER\0',10272,2,_binary '\0\0\0ThichTreoGame\0<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(118,_binary 'GAME_LADDER\0',10283,1,_binary '\0\0\0ThichTreoGame\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(119,_binary 'GAME_LADDER\0',10285,1,_binary '\0\0\0ThichTreoGame\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(120,_binary 'BATTLE_1_1\0',1,3,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(121,_binary 'BATTLE_1_2\0',1,3,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(122,_binary 'BATTLE_1_3\0',1,3,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(123,_binary 'BATTLE_1_1\0',1,4,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(124,_binary 'BATTLE_1_2\0',1,4,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(125,_binary 'BATTLE_1_3\0',1,4,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(126,_binary 'GAME_LEAGUE\0',500,4044829216,_binary 'ˆ\0\0\0\ô\0\0h¹t Huy Hoµng\0 §¨ng\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0h¹t Huy Hoµng\0 §¨ng\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(127,_binary 'GAME_LEAGUE\0',500,3243674009,_binary 'ˆ\0\0\0\ô\0\0Ho¹t ®\éng \'Hoa §¨ng\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ho¹t ®\éng \'Hoa §¨ng\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(128,_binary 'BATTLE_1_1\0',1,5,_binary '\0\0\0	\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(129,_binary 'BATTLE_1_2\0',1,5,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(130,_binary 'BATTLE_1_3\0',1,5,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(131,_binary 'BATTLE_1_1\0',1,6,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(132,_binary 'BATTLE_1_2\0',1,6,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(133,_binary 'BATTLE_1_3\0',1,6,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(134,_binary 'BATTLE_1_1\0',2,1,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0\0'),(135,_binary 'BATTLE_1_2\0',2,1,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0\0'),(136,_binary 'BATTLE_1_3\0',2,1,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0\0'),(137,_binary 'BATTLE_1_1\0',2,2,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(138,_binary 'BATTLE_1_2\0',2,2,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(139,_binary 'BATTLE_1_3\0',2,2,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(140,_binary 'BATTLE_1_1\0',2,3,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(141,_binary 'BATTLE_1_2\0',2,3,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(142,_binary 'BATTLE_1_3\0',2,3,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(143,_binary 'BATTLE_1_1\0',2,4,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(144,_binary 'BATTLE_1_2\0',2,4,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(145,_binary 'BATTLE_1_3\0',2,4,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(146,_binary 'BATTLE_1_1\0',2,5,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0\0'),(147,_binary 'BATTLE_1_2\0',2,5,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0\0'),(148,_binary 'BATTLE_1_3\0',2,5,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0\0'),(150,_binary 'BATTLE_1_1\0',2,6,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(151,_binary 'BATTLE_1_2\0',2,6,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(152,_binary 'BATTLE_1_3\0',2,6,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(153,_binary 'BATTLE_2_3\0',1,1,_binary '\0\0\0\0\0\0\0\0\0Qu\èc chi\Õn Hoµng Sa L©m\0\n\0\0\0\0\0\0\0'),(154,_binary 'BATTLE_LATEST_INFO\0',2,3,_binary '\0\0\0\0\0\0'),(155,_binary 'BATTLE_1_1\0',2,7,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(156,_binary 'BATTLE_1_2\0',2,7,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(157,_binary 'BATTLE_1_3\0',2,7,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(158,_binary 'BATTLE_1_1\0',2,8,_binary '\0\0\0\0\0\0\0\0\0B¹ch M«n Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(159,_binary 'BATTLE_1_2\0',2,8,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0'),(160,_binary 'BATTLE_1_3\0',2,8,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0'),(166,_binary 'GAME_LADDER\0',10270,4,_binary '\0\0\0TLTLTLT\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0'),(167,_binary 'GAME_LADDER\0',10270,5,_binary '\0\0\0TLLaHanTran\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0'),(168,_binary 'GAME_LADDER\0',10270,6,_binary '\r\0\0\0TLLaHanTran2\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0'),(169,_binary 'GAME_LADDER\0',10270,7,_binary '\n\0\0\0TLLHT0123\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0'),(170,_binary 'GAME_LADDER\0',10270,8,_binary '	\0\0\0TLLHTABC\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0'),(171,_binary 'BATTLE_1_1\0',2,9,_binary '\0\0\0	\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0\0'),(172,_binary 'BATTLE_1_2\0',2,9,_binary '\0\0\0	\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0\0'),(173,_binary 'BATTLE_1_3\0',2,9,_binary '\0\0\0	\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0\0'),(174,_binary 'GAME_LEAGUE\0',500,117889592,_binary 'ˆ\0\0\0\ô\0\0TONG_SPFESTIVAL\0P VAT PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0TONG_SPFESTIVAL\0P VAT PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(175,_binary 'GAME_LEAGUE\0',500,706678739,_binary 'ˆ\0\0\0\ô\0\0BANG HOI THU THAP VAT PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0BANG HOI THU THAP VAT PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(176,_binary 'GAME_LEAGUE\0',500,1691131935,_binary 'ˆ\0\0\0\ô\0\0TONG_SHREWMOUSE\0P VAT PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0TONG_SHREWMOUSE\0P VAT PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(177,_binary 'GAME_LEAGUE\0',500,2454813626,_binary '”\0\0\0\ô\0\0WLLS\0Ai\0\0h Dai Chien\0 PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0WLLS\0Ai\0\0h Dai Chien\0 PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0W\0\0\0\0\0\0\0\0\0\0\0\0'),(178,_binary 'GAME_LEAGUE\0',502,754283504,_binary 'ˆ\0\0\0\ö\0\0Doan Hoa Dang\0g Kim\0T PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Doan Hoa Dang\0g Kim\0T PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(179,_binary 'GAME_LEAGUE\0',502,1815061774,_binary 'ˆ\0\0\0\ö\0\0Boss Hoang Kim\0\0P VAT PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Boss Hoang Kim\0\0P VAT PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(180,_binary 'GAME_LEAGUE\0',502,2132027291,_binary 'ˆ\0\0\0\ö\0\0Lien Dau\0Dang\0g Kim\0T PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Lien Dau\0Dang\0g Kim\0T PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(181,_binary 'GAME_LEAGUE\0',502,2959735012,_binary 'ˆ\0\0\0\ö\0\0Phong Lang Do\0g Kim\0T PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Phong Lang Do\0g Kim\0T PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(182,_binary 'GAME_LEAGUE\0',502,3709327004,_binary 'ˆ\0\0\0\ö\0\0That Thanh Dai Chien\0 PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0That Thanh Dai Chien\0 PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(183,_binary 'GAME_LEAGUE\0',502,3797118614,_binary 'ˆ\0\0\0\ö\0\0Vuot Ai\0\0h Dai Chien\0 PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Vuot Ai\0\0h Dai Chien\0 PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(184,_binary 'GAME_LEAGUE\0',502,4246103825,_binary 'ˆ\0\0\0\ö\0\0Tong Kim\0h Dai Chien\0 PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Tong Kim\0h Dai Chien\0 PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(185,_binary 'GAME_LEAGUE\0',502,4278743333,_binary 'ˆ\0\0\0\ö\0\0Boss Tieu Hoang Kim\0T PHAM\0\0\0backupinterval\04800\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0Boss Tieu Hoang Kim\0T PHAM\0\ípl\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(189,_binary 'EVENT_April_zhushuai\0',1,0,_binary '\0\0\0\0\0\0\0\0\0\ð?\0\0\0lª±\ÙA'),(190,_binary 'BATTLE_1_1\0',2,10,_binary '\0\0\0\0\0\0\0\0\0Ng\ò Ph­¬ng Nguyªn Chi\Õn\0\0\0\0\0\0\0\0'),(191,_binary 'BATTLE_1_2\0',2,10,_binary '\0\0\0\0\0\0\0\0\0Li\Ôu Nguyªn Chi\Õn\0\0\0\0\0\0\0\0'),(192,_binary 'BATTLE_1_3\0',2,10,_binary '\0\0\0\0\0\0\0\0\0Hoµng Sa L©m Ngao Chi\Õn\0\0\0\0\0\0\0\0');
/*!40000 ALTER TABLE `ShareData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tong`
--

DROP TABLE IF EXISTS `Tong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tong` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TongID` int(10) unsigned NOT NULL,
  `Data` longblob,
  PRIMARY KEY (`TongID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tong`
--

LOCK TABLES `Tong` WRITE;
/*!40000 ALTER TABLE `Tong` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TongMember`
--

DROP TABLE IF EXISTS `TongMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TongMember` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TongID` int(10) unsigned NOT NULL,
  `MemberID` int(10) unsigned NOT NULL,
  `InRecycle` tinyint(3) unsigned NOT NULL,
  `Data` longblob,
  UNIQUE KEY `ID` (`ID`),
  KEY `TongID` (`TongID`,`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TongMember`
--

LOCK TABLES `TongMember` WRITE;
/*!40000 ALTER TABLE `TongMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `TongMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TongUnion`
--

DROP TABLE IF EXISTS `TongUnion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TongUnion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UnionID` int(10) unsigned NOT NULL,
  `Data` longblob,
  PRIMARY KEY (`UnionID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TongUnion`
--

LOCK TABLES `TongUnion` WRITE;
/*!40000 ALTER TABLE `TongUnion` DISABLE KEYS */;
/*!40000 ALTER TABLE `TongUnion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TongZhaoMu`
--

DROP TABLE IF EXISTS `TongZhaoMu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TongZhaoMu` (
  `TongID` int(10) unsigned NOT NULL,
  `Data` blob,
  PRIMARY KEY (`TongID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TongZhaoMu`
--

LOCK TABLES `TongZhaoMu` WRITE;
/*!40000 ALTER TABLE `TongZhaoMu` DISABLE KEYS */;
/*!40000 ALTER TABLE `TongZhaoMu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16 23:42:18
