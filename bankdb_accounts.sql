-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: bankdb
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `customerid` int DEFAULT NULL,
  `Accountnumber` varchar(20) DEFAULT NULL,
  `Accounttype` varchar(20) DEFAULT NULL,
  `Balance` decimal(12,2) DEFAULT NULL,
  `BranchID` int NOT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `Accountnumber` (`Accountnumber`),
  KEY `customerid` (`customerid`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customers` (`customerid`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`),
  CONSTRAINT `accounts_chk_1` CHECK ((`Accounttype` in (_utf8mb4'current',_utf8mb4'savings'))),
  CONSTRAINT `accounts_chk_2` CHECK ((`Balance` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'0011223344','savings',100000.00,1),(2,2,'1122334455','current',3000000.00,2),(3,3,'1100223344','current',300000.00,3),(4,4,'7755662222','savings',50000.00,4),(5,5,'6611222265','savings',30000.00,5),(6,6,'1123423423','current',500000.00,6),(7,7,'5521437895','current',435450.00,7),(8,8,'2266448395','savings',803765.00,8),(9,9,'2635486543','current',130000.00,9),(10,10,'8855332241','savings',536909.00,10);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-22 15:50:14
