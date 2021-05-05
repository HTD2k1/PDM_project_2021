-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: health_system
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `disease (health)`
--

DROP TABLE IF EXISTS `disease (health)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease (health)` (
  `diseaseID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`diseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease (health)`
--

LOCK TABLES `disease (health)` WRITE;
/*!40000 ALTER TABLE `disease (health)` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease (health)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_treatment (realtionship)`
--

DROP TABLE IF EXISTS `disease_treatment (realtionship)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_treatment (realtionship)` (
  `ID` int NOT NULL,
  `diseaseID` int NOT NULL,
  `treatmentID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `diseaseID_idx` (`diseaseID`),
  KEY `treatmentID_idx` (`treatmentID`),
  CONSTRAINT `diseaseID` FOREIGN KEY (`diseaseID`) REFERENCES `disease (health)` (`diseaseID`),
  CONSTRAINT `treatmentID` FOREIGN KEY (`treatmentID`) REFERENCES `treatment (health)` (`treatmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_treatment (realtionship)`
--

LOCK TABLES `disease_treatment (realtionship)` WRITE;
/*!40000 ALTER TABLE `disease_treatment (realtionship)` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease_treatment (realtionship)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom_disease (relationship)`
--

DROP TABLE IF EXISTS `symptom_disease (relationship)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptom_disease (relationship)` (
  `id` int NOT NULL,
  `symptomID` int NOT NULL,
  `diseaseID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `symptomID_idx` (`symptomID`),
  KEY `symptom_ID_idx` (`symptomID`),
  KEY `disease_ID_idx` (`diseaseID`),
  CONSTRAINT `disease_ID` FOREIGN KEY (`diseaseID`) REFERENCES `disease (health)` (`diseaseID`),
  CONSTRAINT `symptom_ID` FOREIGN KEY (`symptomID`) REFERENCES `symptoms (health)` (`symptomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom_disease (relationship)`
--

LOCK TABLES `symptom_disease (relationship)` WRITE;
/*!40000 ALTER TABLE `symptom_disease (relationship)` DISABLE KEYS */;
/*!40000 ALTER TABLE `symptom_disease (relationship)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptoms (health)`
--

DROP TABLE IF EXISTS `symptoms (health)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptoms (health)` (
  `symptomID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`symptomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms (health)`
--

LOCK TABLES `symptoms (health)` WRITE;
/*!40000 ALTER TABLE `symptoms (health)` DISABLE KEYS */;
/*!40000 ALTER TABLE `symptoms (health)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment (health)`
--

DROP TABLE IF EXISTS `treatment (health)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment (health)` (
  `treatmentID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`treatmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment (health)`
--

LOCK TABLES `treatment (health)` WRITE;
/*!40000 ALTER TABLE `treatment (health)` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment (health)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_symptom (relationship)`
--

DROP TABLE IF EXISTS `user_symptom (relationship)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_symptom (relationship)` (
  `id` int NOT NULL,
  `userID` int NOT NULL,
  `symptomID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID_idx` (`userID`),
  KEY `symptomID_idx` (`symptomID`),
  CONSTRAINT `symptomID` FOREIGN KEY (`symptomID`) REFERENCES `symptoms (health)` (`symptomID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users (system)` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_symptom (relationship)`
--

LOCK TABLES `user_symptom (relationship)` WRITE;
/*!40000 ALTER TABLE `user_symptom (relationship)` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_symptom (relationship)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users (system)`
--

DROP TABLE IF EXISTS `users (system)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users (system)` (
  `userID` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` varchar(1) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users (system)`
--

LOCK TABLES `users (system)` WRITE;
/*!40000 ALTER TABLE `users (system)` DISABLE KEYS */;
/*!40000 ALTER TABLE `users (system)` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-05  5:55:50
