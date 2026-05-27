CREATE DATABASE  IF NOT EXISTS `videogame_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `videogame_db`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: videogame_db
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- GTID state at the beginning of the backup 
--



--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'alice@example.com','alice','female',28,'1997-04-12','USA','2025-11-20 19:05:23'),(2,'bob@example.com','bob_the_builder','male',34,'1991-07-02','UK','2025-11-20 19:05:23'),(3,'carla@example.com','carla87','female',37,'1988-11-23','Canada','2025-11-20 19:05:23'),(4,'dan@example.com','dan42','male',22,'2003-01-15','Australia','2025-11-20 19:05:23'),(5,'eva@example.com','eva_gamer','female',19,'2006-06-30','Germany','2025-11-20 19:05:23');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_model`
--

DROP TABLE IF EXISTS `business_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_model` (
  `business_model_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`business_model_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_model`
--

LOCK TABLES `business_model` WRITE;
/*!40000 ALTER TABLE `business_model` DISABLE KEYS */;
INSERT INTO `business_model` VALUES (1,'Buy-to-play'),(2,'Free-to-play'),(4,'One-time purchase'),(3,'Subscription');
/*!40000 ALTER TABLE `business_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `critic_rating`
--

DROP TABLE IF EXISTS `critic_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `critic_rating` (
  `critic_rating_id` int NOT NULL AUTO_INCREMENT,
  `game_id` int DEFAULT NULL,
  `score` decimal(5,2) NOT NULL,
  `reviewer_name` varchar(255) DEFAULT NULL,
  `review_source` varchar(255) DEFAULT NULL,
  `review_url` varchar(255) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`critic_rating_id`),
  KEY `idx_critic_rating_game` (`game_id`),
  CONSTRAINT `critic_rating_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critic_rating`
--

LOCK TABLES `critic_rating` WRITE;
/*!40000 ALTER TABLE `critic_rating` DISABLE KEYS */;
INSERT INTO `critic_rating` VALUES (1,1,9.50,'A. Critic','GameReview Daily','https://example.com/reviews/echoes','2016-09-16','2025-11-20 19:05:23'),(2,2,9.20,'SciFiGamer','Galaxy Reviews','https://example.com/voidwalker','2020-03-22','2025-11-20 19:05:23'),(3,4,8.80,'ShooterMag','ShooterMag Online','https://example.com/crimson','2019-10-13','2025-11-20 19:05:23'),(4,10,9.60,'RPGCentral','RPGCentral','https://example.com/legends','2022-11-12','2025-11-20 19:05:23'),(5,16,9.00,'ActionNow','ActionNow','https://example.com/shadow','2024-01-20','2025-11-20 19:05:23'),(6,19,8.40,'Coop Weekly','Coop Weekly','https://example.com/alien','2020-09-05','2025-11-20 19:05:23'),(7,3,8.00,'IndieWatch','Indie Watch','https://example.com/greenhollow','2013-11-10','2025-11-20 19:05:23');
/*!40000 ALTER TABLE `critic_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `developer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `overview` text,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`developer_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES (1,'Naughty Dog','Studio known for cinematic single-player narratives','https://www.naughtydog.com'),(2,'FromSoftware','Developer of challenging action RPGs','https://www.fromsoftware.jp'),(3,'CD Projekt Red','Polish studio focusing on narrative RPGs','https://en.cdprojektred.com'),(4,'Valve','PC games and digital distribution pioneer','https://www.valvesoftware.com'),(5,'Nintendo EPD','Nintendo internal development division','https://www.nintendo.co.jp'),(6,'Ubisoft Montreal','Large multi-genre studio','https://www.ubisoft.com'),(7,'Rockstar North','Open-world action games studio','https://www.rockstargames.com'),(8,'Bethesda Game Studios','Open-world RPG developers','https://www.bethesda.net'),(9,'Bungie','Multiplayer shooter and live-service studio','https://www.bungie.net'),(10,'Insomniac Games','Action-adventure studio','https://www.insomniacgames.com');
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `overview` text,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Neil Druckmann','Creative director known for narrative-driven games'),(2,'Hidetaka Miyazaki','Director of difficult action-RPGs'),(3,'Marcin Iwinski','Creative lead and studio founder'),(4,'Gabe Newell','Valve co-founder and executive influence'),(5,'Shigeru Miyamoto','Legendary game director and designer'),(6,'Jane Doe','Fictional director for variety'),(7,'Beth Smith','Fictional director'),(8,'S. Johnson','Fictional director'),(9,'Marcus Lee','Fictional director'),(10,'Ana Ruiz','Fictional director');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `release_date` date DEFAULT NULL,
  `pacing_id` int DEFAULT NULL,
  `business_model_id` int DEFAULT NULL,
  `media_type_id` int DEFAULT NULL,
  `maturity_rating_id` int DEFAULT NULL,
  `perspective_id` int DEFAULT NULL,
  `interface_type_id` int DEFAULT NULL,
  `moby_score` decimal(5,2) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`game_id`),
  KEY `pacing_id` (`pacing_id`),
  KEY `business_model_id` (`business_model_id`),
  KEY `media_type_id` (`media_type_id`),
  KEY `maturity_rating_id` (`maturity_rating_id`),
  KEY `perspective_id` (`perspective_id`),
  KEY `interface_type_id` (`interface_type_id`),
  KEY `idx_game_release_date` (`release_date`),
  KEY `idx_game_moby_score` (`moby_score`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`pacing_id`) REFERENCES `pacing` (`pacing_id`),
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`business_model_id`) REFERENCES `business_model` (`business_model_id`),
  CONSTRAINT `game_ibfk_3` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`media_type_id`),
  CONSTRAINT `game_ibfk_4` FOREIGN KEY (`maturity_rating_id`) REFERENCES `maturity_rating` (`maturity_rating_id`),
  CONSTRAINT `game_ibfk_5` FOREIGN KEY (`perspective_id`) REFERENCES `perspective` (`perspective_id`),
  CONSTRAINT `game_ibfk_6` FOREIGN KEY (`interface_type_id`) REFERENCES `interface_type` (`interface_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'Echoes of Valen','2016-09-14',2,1,1,4,2,1,9.20,'A cinematic action-adventure set in a ruined kingdom.','2016-09-14 10:00:00'),(2,'Voidwalker','2020-03-20',3,1,1,4,1,1,9.00,'A first-person atmospheric sci-fi exploration and combat game.','2020-03-20 09:00:00'),(3,'Green Hollow','2013-11-08',1,1,2,1,2,1,8.10,'Cozy farming life-sim with deep crafting mechanics.','2013-11-08 12:00:00'),(4,'Crimson Siege','2019-10-11',3,2,1,4,2,1,8.75,'Multiplayer tactical shooter with ranked seasons.','2019-10-11 08:00:00'),(5,'Skybound Legends','2018-02-02',2,1,3,3,2,1,8.45,'High-fantasy RPG with aerial exploration.','2018-02-02 14:00:00'),(6,'Neon Circuit','2021-06-17',3,2,1,3,3,1,7.90,'Fast-paced top-down racer/shooter hybrid in a cyber city.','2021-06-17 11:00:00'),(7,'Mystery Manor','2010-10-25',1,1,2,2,5,2,7.30,'A puzzle adventure through a haunted estate.','2010-10-25 16:00:00'),(8,'Warfront Tactics','2015-04-01',2,1,1,3,4,1,8.00,'Turn-based strategy war game with army customization.','2015-04-01 09:00:00'),(9,'Rooftop Runner','2012-09-04',3,1,2,1,5,1,7.10,'Side-scroller parkour platformer with time trials.','2012-09-04 07:00:00'),(10,'Legends of Ember','2022-11-10',2,1,1,4,2,1,9.30,'Epic RPG with branching narrative and co-op.','2022-11-10 10:00:00'),(11,'Farmstead VR','2023-03-21',1,4,4,1,1,3,7.50,'Relaxing farming simulator made for VR.','2023-03-21 10:00:00'),(12,'Space Salvager','2014-08-19',3,2,1,3,1,1,7.85,'Online space looter with ship progression and PvP.','2014-08-19 12:00:00'),(13,'Historic Siege','2009-05-14',2,1,2,3,2,1,6.90,'A historical strategy game set in medieval Europe.','2009-05-14 09:00:00'),(14,'Turbo Drift','2017-07-07',3,1,1,1,2,1,7.70,'Arcade-style racing game with local multiplayer.','2017-07-07 15:00:00'),(15,'Puzzle Bloom','2011-02-01',1,4,4,1,5,2,6.80,'Casual mobile puzzle with colorful mechanics.','2011-02-01 11:00:00'),(16,'Shadow Protocol','2024-01-18',3,1,1,4,1,1,9.10,'Stealth-action thriller led by a cinematic campaign.','2024-01-18 09:00:00'),(17,'Oceanic Tycoon','2016-05-05',2,1,1,1,2,1,7.40,'Simulation tycoon about building a coastal resort.','2016-05-05 10:30:00'),(18,'Arcane Odyssey','2008-11-12',2,1,2,3,2,1,8.00,'Classic third-person fantasy RPG with deep lore.','2008-11-12 13:00:00'),(19,'Alien Onslaught','2020-09-01',3,2,1,4,1,1,8.60,'Live-service cooperative shooter with seasonal events.','2020-09-01 14:00:00'),(20,'City Architect','2014-12-09',1,1,1,1,4,1,7.95,'Urban planning simulation with transport networks.','2014-12-09 13:00:00');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_developer`
--

DROP TABLE IF EXISTS `game_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_developer` (
  `game_id` int NOT NULL,
  `developer_id` int NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_id`,`developer_id`),
  KEY `developer_id` (`developer_id`),
  CONSTRAINT `game_developer_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_developer_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_developer`
--

LOCK TABLES `game_developer` WRITE;
/*!40000 ALTER TABLE `game_developer` DISABLE KEYS */;
INSERT INTO `game_developer` VALUES (1,1,'Lead Developer'),(2,4,'Lead Developer'),(3,5,'Lead Developer'),(4,9,'Lead Developer'),(5,3,'Lead Developer'),(6,4,'Lead Developer'),(7,6,'Lead Developer'),(8,6,'Lead Developer'),(9,10,'Lead Developer'),(10,3,'Lead Developer'),(11,4,'Lead Developer'),(12,4,'Lead Developer'),(13,6,'Lead Developer'),(14,5,'Lead Developer'),(15,5,'Lead Developer'),(16,2,'Lead Developer'),(17,8,'Lead Developer'),(18,5,'Lead Developer'),(19,9,'Lead Developer'),(20,8,'Lead Developer');
/*!40000 ALTER TABLE `game_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_director`
--

DROP TABLE IF EXISTS `game_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_director` (
  `game_id` int NOT NULL,
  `director_id` int NOT NULL,
  PRIMARY KEY (`game_id`,`director_id`),
  KEY `director_id` (`director_id`),
  CONSTRAINT `game_director_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_director_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_director`
--

LOCK TABLES `game_director` WRITE;
/*!40000 ALTER TABLE `game_director` DISABLE KEYS */;
INSERT INTO `game_director` VALUES (1,1),(10,1),(16,2),(5,3),(2,4),(12,4),(7,5),(14,5),(18,5),(3,6),(11,6),(15,6),(8,7),(13,7),(20,7),(6,8),(17,8),(4,9),(19,9),(9,10);
/*!40000 ALTER TABLE `game_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_genre`
--

DROP TABLE IF EXISTS `game_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_genre` (
  `game_genre_id` int NOT NULL AUTO_INCREMENT,
  `game_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`game_genre_id`),
  UNIQUE KEY `game_id` (`game_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `game_genre_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_genre`
--

LOCK TABLES `game_genre` WRITE;
/*!40000 ALTER TABLE `game_genre` DISABLE KEYS */;
INSERT INTO `game_genre` VALUES (2,1,1),(1,1,2),(4,2,2),(3,2,9),(6,3,2),(5,3,5),(8,4,1),(7,4,9),(10,5,2),(9,5,3),(11,6,7),(12,6,9),(14,7,2),(13,7,8),(15,8,4),(16,9,10),(18,10,2),(17,10,3),(19,11,5),(21,12,4),(20,12,9),(22,13,4),(23,14,7),(24,15,8),(25,16,1),(26,16,2),(27,17,5),(28,18,3),(30,19,2),(29,19,9),(32,20,4),(31,20,5);
/*!40000 ALTER TABLE `game_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_input_device`
--

DROP TABLE IF EXISTS `game_input_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_input_device` (
  `game_input_device_id` int NOT NULL AUTO_INCREMENT,
  `game_id` int DEFAULT NULL,
  `input_device_id` int DEFAULT NULL,
  PRIMARY KEY (`game_input_device_id`),
  UNIQUE KEY `game_id` (`game_id`,`input_device_id`),
  KEY `input_device_id` (`input_device_id`),
  CONSTRAINT `game_input_device_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_input_device_ibfk_2` FOREIGN KEY (`input_device_id`) REFERENCES `input_device` (`input_device_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_input_device`
--

LOCK TABLES `game_input_device` WRITE;
/*!40000 ALTER TABLE `game_input_device` DISABLE KEYS */;
INSERT INTO `game_input_device` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,4,1),(6,5,1),(7,6,2),(8,7,2),(9,8,2),(10,9,1),(11,10,1),(12,10,2),(13,11,5),(14,12,2),(15,13,2),(16,14,1),(17,15,3),(18,16,1),(19,17,2),(20,18,2),(21,19,1),(22,20,2);
/*!40000 ALTER TABLE `game_input_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_perspective`
--

DROP TABLE IF EXISTS `game_perspective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_perspective` (
  `game_perspective_id` int NOT NULL AUTO_INCREMENT,
  `game_id` int DEFAULT NULL,
  `perspective_id` int DEFAULT NULL,
  PRIMARY KEY (`game_perspective_id`),
  UNIQUE KEY `game_id` (`game_id`,`perspective_id`),
  KEY `perspective_id` (`perspective_id`),
  CONSTRAINT `game_perspective_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_perspective_ibfk_2` FOREIGN KEY (`perspective_id`) REFERENCES `perspective` (`perspective_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_perspective`
--

LOCK TABLES `game_perspective` WRITE;
/*!40000 ALTER TABLE `game_perspective` DISABLE KEYS */;
INSERT INTO `game_perspective` VALUES (1,1,2),(2,2,1),(3,3,2),(4,4,1),(5,5,2),(6,6,3),(7,7,5),(8,8,4),(9,9,5),(10,10,2),(11,11,1),(12,12,1),(13,13,4),(14,14,5),(15,15,5),(16,16,2),(17,17,2),(18,18,2),(19,19,1),(20,20,3);
/*!40000 ALTER TABLE `game_perspective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_platform`
--

DROP TABLE IF EXISTS `game_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_platform` (
  `game_id` int NOT NULL,
  `platform_id` int NOT NULL,
  `platform_release_date` date DEFAULT NULL,
  PRIMARY KEY (`game_id`,`platform_id`),
  KEY `idx_gp_platform` (`platform_id`),
  CONSTRAINT `game_platform_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_platform_ibfk_2` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`platform_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_platform`
--

LOCK TABLES `game_platform` WRITE;
/*!40000 ALTER TABLE `game_platform` DISABLE KEYS */;
INSERT INTO `game_platform` VALUES (1,1,'2016-09-21'),(1,2,'2016-09-14'),(2,1,'2020-03-20'),(2,3,'2020-03-27'),(3,1,'2013-11-08'),(3,5,'2014-02-10'),(4,1,'2019-10-11'),(4,2,'2019-10-11'),(4,3,'2019-10-11'),(5,1,'2018-02-02'),(5,4,'2018-02-16'),(6,1,'2021-06-17'),(6,5,'2021-09-01'),(7,1,'2010-10-25'),(7,4,'2011-03-10'),(8,1,'2015-04-01'),(9,1,'2013-01-20'),(9,4,'2012-09-04'),(10,1,'2022-11-10'),(10,2,'2022-11-10'),(10,3,'2022-11-15'),(11,1,'2023-03-21'),(11,5,'2023-05-02'),(12,1,'2014-08-19'),(13,1,'2009-05-14'),(14,2,'2017-07-07'),(14,3,'2017-07-14'),(14,4,'2018-01-20'),(15,5,'2011-02-01'),(16,1,'2024-01-18'),(16,2,'2024-01-18'),(17,1,'2016-05-05'),(18,1,'2009-02-10'),(18,2,'2008-11-12'),(19,1,'2020-09-01'),(19,2,'2020-11-01'),(19,3,'2020-09-08'),(20,1,'2014-12-09');
/*!40000 ALTER TABLE `game_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_publisher`
--

DROP TABLE IF EXISTS `game_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_publisher` (
  `game_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_id`,`publisher_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `game_publisher_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_publisher_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_publisher`
--

LOCK TABLES `game_publisher` WRITE;
/*!40000 ALTER TABLE `game_publisher` DISABLE KEYS */;
INSERT INTO `game_publisher` VALUES (1,1,'Publisher'),(2,4,'Publisher'),(3,5,'Publisher'),(4,9,'Publisher'),(5,3,'Publisher'),(6,2,'Publisher'),(7,6,'Publisher'),(8,6,'Publisher'),(9,5,'Publisher'),(10,1,'Publisher'),(11,4,'Publisher'),(12,2,'Publisher'),(13,6,'Publisher'),(14,5,'Publisher'),(15,2,'Publisher'),(16,1,'Publisher'),(17,8,'Publisher'),(18,5,'Publisher'),(19,9,'Publisher'),(20,10,'Publisher');
/*!40000 ALTER TABLE `game_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_setting`
--

DROP TABLE IF EXISTS `game_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_setting` (
  `game_setting_id` int NOT NULL AUTO_INCREMENT,
  `game_id` int DEFAULT NULL,
  `setting_id` int DEFAULT NULL,
  PRIMARY KEY (`game_setting_id`),
  UNIQUE KEY `game_id` (`game_id`,`setting_id`),
  KEY `setting_id` (`setting_id`),
  CONSTRAINT `game_setting_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE,
  CONSTRAINT `game_setting_ibfk_2` FOREIGN KEY (`setting_id`) REFERENCES `setting` (`setting_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_setting`
--

LOCK TABLES `game_setting` WRITE;
/*!40000 ALTER TABLE `game_setting` DISABLE KEYS */;
INSERT INTO `game_setting` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,3),(5,5,1),(6,6,2),(7,7,5),(8,8,4),(9,9,3),(10,10,1),(11,11,3),(12,12,2),(13,13,4),(14,14,3),(15,15,3),(16,16,3),(17,17,3),(18,18,1),(19,19,2),(20,20,3);
/*!40000 ALTER TABLE `game_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Adventure'),(10,'Platformer'),(8,'Puzzle'),(7,'Racing'),(3,'RPG'),(9,'Shooter'),(5,'Simulation'),(6,'Sports'),(4,'Strategy');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_device`
--

DROP TABLE IF EXISTS `input_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `input_device` (
  `input_device_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`input_device_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_device`
--

LOCK TABLES `input_device` WRITE;
/*!40000 ALTER TABLE `input_device` DISABLE KEYS */;
INSERT INTO `input_device` VALUES (1,'Gamepad'),(2,'Keyboard & Mouse'),(4,'Motion Controller'),(3,'Touchscreen'),(5,'VR Controllers');
/*!40000 ALTER TABLE `input_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interface_type`
--

DROP TABLE IF EXISTS `interface_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interface_type` (
  `interface_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`interface_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interface_type`
--

LOCK TABLES `interface_type` WRITE;
/*!40000 ALTER TABLE `interface_type` DISABLE KEYS */;
INSERT INTO `interface_type` VALUES (1,'HUD'),(2,'Minimalist HUD'),(4,'Split-screen'),(3,'VR Interface');
/*!40000 ALTER TABLE `interface_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maturity_rating`
--

DROP TABLE IF EXISTS `maturity_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maturity_rating` (
  `maturity_rating_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`maturity_rating_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maturity_rating`
--

LOCK TABLES `maturity_rating` WRITE;
/*!40000 ALTER TABLE `maturity_rating` DISABLE KEYS */;
INSERT INTO `maturity_rating` VALUES (1,'E','Everyone - content suitable for all ages'),(2,'E10+','Everyone 10+ - may contain mild violence or themes'),(3,'T','Teen - content suitable for ages 13+'),(4,'M','Mature - suitable for ages 17+'),(5,'AO','Adults Only - restricted to 18+');
/*!40000 ALTER TABLE `maturity_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `media_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`media_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (3,'Cartridge'),(1,'Digital'),(2,'Disc'),(4,'Downloadable');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacing`
--

DROP TABLE IF EXISTS `pacing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacing` (
  `pacing_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`pacing_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacing`
--

LOCK TABLES `pacing` WRITE;
/*!40000 ALTER TABLE `pacing` DISABLE KEYS */;
INSERT INTO `pacing` VALUES (3,'Fast'),(2,'Medium'),(1,'Slow'),(4,'Variable');
/*!40000 ALTER TABLE `pacing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perspective`
--

DROP TABLE IF EXISTS `perspective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perspective` (
  `perspective_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`perspective_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perspective`
--

LOCK TABLES `perspective` WRITE;
/*!40000 ALTER TABLE `perspective` DISABLE KEYS */;
INSERT INTO `perspective` VALUES (1,'First-person'),(4,'Isometric'),(5,'Side-scroller'),(2,'Third-person'),(3,'Top-down');
/*!40000 ALTER TABLE `perspective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform` (
  `platform_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`platform_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (5,'Mobile'),(4,'Nintendo Switch'),(1,'PC'),(2,'PlayStation 5'),(3,'Xbox Series X');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_rating`
--

DROP TABLE IF EXISTS `player_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_rating` (
  `player_rating_id` int NOT NULL AUTO_INCREMENT,
  `game_id` int DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `score` decimal(5,2) NOT NULL,
  `number_of_ratings` int NOT NULL DEFAULT '0',
  `collected_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_rating_id`),
  KEY `idx_player_rating_game` (`game_id`),
  CONSTRAINT `player_rating_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_rating`
--

LOCK TABLES `player_rating` WRITE;
/*!40000 ALTER TABLE `player_rating` DISABLE KEYS */;
INSERT INTO `player_rating` VALUES (1,1,'Metacritic',9.10,1245,'2016-10-01 12:00:00'),(2,2,'Steam',9.00,4200,'2020-04-01 09:30:00'),(3,3,'App Store',8.40,980,'2014-03-01 11:00:00'),(4,4,'Xbox Store',8.50,5400,'2019-12-01 08:00:00'),(5,10,'Metacritic',9.40,2200,'2022-12-01 10:00:00'),(6,16,'PlayStation Store',9.20,1500,'2024-02-05 09:00:00'),(7,19,'Steam',8.50,8900,'2021-01-10 12:00:00');
/*!40000 ALTER TABLE `player_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `overview` text,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Sony Interactive Entertainment','Platform holder & publisher','https://www.sie.com'),(2,'Bandai Namco','Publisher and developer across genres','https://www.bandainamcoent.com'),(3,'CD Projekt','Publisher arm for CDPR titles','https://en.cdprojektred.com'),(4,'Valve Corporation','Publisher and platform operator','https://www.valvesoftware.com'),(5,'Nintendo','Publisher and hardware maker','https://www.nintendo.com'),(6,'Ubisoft','Global publisher','https://www.ubisoft.com'),(7,'Rockstar Games','Publisher of open-world titles','https://www.rockstargames.com'),(8,'Bethesda Softworks','Publisher for Bethesda titles','https://bethesda.net'),(9,'Activision','Major publisher','https://www.activision.com'),(10,'Electronic Arts','Major publisher','https://www.ea.com');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'Fantasy'),(4,'Historical'),(3,'Modern'),(5,'Post-Apocalyptic'),(2,'Science Fiction');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating` (
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `rating` decimal(5,2) NOT NULL,
  `review_text` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`game_id`),
  KEY `idx_user_rating_game` (`game_id`),
  CONSTRAINT `user_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_rating_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
INSERT INTO `user_rating` VALUES (1,1,9.50,'Loved the narrative and characters.','2016-10-02 08:00:00',NULL),(1,16,9.20,'Impeccable pacing and stealth design.','2024-02-01 10:15:00',NULL),(2,2,9.00,'Stunning world design and controls.','2020-04-03 19:20:00',NULL),(3,3,8.00,'Relaxing and addictive.','2014-03-10 14:10:00',NULL),(4,4,7.80,'Good multiplayer, some balance issues.','2019-11-01 10:05:00',NULL),(5,10,9.50,'One of the best RPGs in years.','2022-12-05 21:00:00',NULL);
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'videogame_db'
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;


-- Dump completed on 2025-11-20 19:12:11