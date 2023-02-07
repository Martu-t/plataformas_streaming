-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: peliculas
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_actor`),
  KEY `ix_actor_full_name` (`full_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id_country` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `id_director` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform` (
  `id_platform` int NOT NULL AUTO_INCREMENT,
  `platform` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id_rating` int NOT NULL AUTO_INCREMENT,
  `rating` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_for_actor`
--

DROP TABLE IF EXISTS `show_for_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_for_actor` (
  `id_show` varchar(40) NOT NULL,
  `id_actor` int NOT NULL,
  PRIMARY KEY (`id_show`,`id_actor`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `show_for_actor_ibfk_1` FOREIGN KEY (`id_show`) REFERENCES `shows` (`id_show`),
  CONSTRAINT `show_for_actor_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_for_actor`
--

LOCK TABLES `show_for_actor` WRITE;
/*!40000 ALTER TABLE `show_for_actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_for_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_for_country`
--

DROP TABLE IF EXISTS `show_for_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_for_country` (
  `id_show` varchar(40) NOT NULL,
  `id_country` int NOT NULL,
  PRIMARY KEY (`id_show`,`id_country`),
  KEY `id_country` (`id_country`),
  CONSTRAINT `show_for_country_ibfk_1` FOREIGN KEY (`id_show`) REFERENCES `shows` (`id_show`),
  CONSTRAINT `show_for_country_ibfk_2` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_for_country`
--

LOCK TABLES `show_for_country` WRITE;
/*!40000 ALTER TABLE `show_for_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_for_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_for_director`
--

DROP TABLE IF EXISTS `show_for_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_for_director` (
  `id_show` varchar(40) NOT NULL,
  `id_director` int NOT NULL,
  PRIMARY KEY (`id_show`,`id_director`),
  KEY `id_director` (`id_director`),
  CONSTRAINT `show_for_director_ibfk_1` FOREIGN KEY (`id_show`) REFERENCES `shows` (`id_show`),
  CONSTRAINT `show_for_director_ibfk_2` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_for_director`
--

LOCK TABLES `show_for_director` WRITE;
/*!40000 ALTER TABLE `show_for_director` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_for_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_for_genre`
--

DROP TABLE IF EXISTS `show_for_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_for_genre` (
  `id_show` varchar(40) NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_show`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `show_for_genre_ibfk_1` FOREIGN KEY (`id_show`) REFERENCES `shows` (`id_show`),
  CONSTRAINT `show_for_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_for_genre`
--

LOCK TABLES `show_for_genre` WRITE;
/*!40000 ALTER TABLE `show_for_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_for_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_type`
--

DROP TABLE IF EXISTS `show_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_type` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_type`
--

LOCK TABLES `show_type` WRITE;
/*!40000 ALTER TABLE `show_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `id_show` varchar(40) NOT NULL,
  `id_type` int DEFAULT NULL,
  `id_platform` int DEFAULT NULL,
  `id_rating` int DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `duration_num` int DEFAULT NULL,
  `duration_unit` varchar(100) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `release_year` int DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_show`),
  KEY `id_type` (`id_type`),
  KEY `id_platform` (`id_platform`),
  KEY `id_rating` (`id_rating`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `show_type` (`id_type`),
  CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`id_platform`) REFERENCES `platform` (`id_platform`),
  CONSTRAINT `shows_ibfk_3` FOREIGN KEY (`id_rating`) REFERENCES `rating` (`id_rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-07 13:07:13
