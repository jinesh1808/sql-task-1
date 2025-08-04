-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: localhost    Database: libraray_db
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  UNIQUE KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (1,'The Alchemist','Paulo Coelho','Fiction','1234567890123'),(2,'Clean Code','Robert C. Martin','Programming','9876543210987');
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issue`
--

DROP TABLE IF EXISTS `Issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Issue` (
  `IssueId` int NOT NULL AUTO_INCREMENT,
  `BookID` int DEFAULT NULL,
  `Memberid` int DEFAULT NULL,
  `IssueDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`IssueId`),
  KEY `BookID` (`BookID`),
  KEY `Memberid` (`Memberid`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `Book` (`BookID`),
  CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`Memberid`) REFERENCES `Member` (`Memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issue`
--

LOCK TABLES `Issue` WRITE;
/*!40000 ALTER TABLE `Issue` DISABLE KEYS */;
INSERT INTO `Issue` VALUES (1,1,1,'2025-08-01','2025-08-10'),(2,2,2,'2025-08-03',NULL);
/*!40000 ALTER TABLE `Issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Librarian`
--

DROP TABLE IF EXISTS `Librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Librarian` (
  `librarianId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`librarianId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Librarian`
--

LOCK TABLES `Librarian` WRITE;
/*!40000 ALTER TABLE `Librarian` DISABLE KEYS */;
INSERT INTO `Librarian` VALUES (1,'Aman Kumar','aman@library.com');
/*!40000 ALTER TABLE `Librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Member` (
  `Memberid` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Joindate` date DEFAULT (curdate()),
  PRIMARY KEY (`Memberid`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'Jinesh Sharma','jinesh@example.com','2025-08-04'),(2,'Riya Verma','riya@example.com','2025-08-04');
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 17:06:03
