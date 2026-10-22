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
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Transactiontype` varchar(100) NOT NULL,
  `Amount` decimal(12,2) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT (now()),
  PRIMARY KEY (`TransactionID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`),
  CONSTRAINT `transactions_chk_1` CHECK ((`Amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'deposit',50000.00,'2026-07-21 15:06:25'),(2,3,'withdrawal',20000.00,'2026-07-21 15:06:25'),(3,2,'transfer',50000.00,'2026-07-21 15:06:25'),(4,5,'transfer',20000.00,'2026-07-21 15:06:25'),(5,4,'deposit',100000.00,'2026-07-21 15:06:25'),(6,6,'deposit',23900.00,'2026-07-21 15:06:25'),(7,8,'withdrawal',80000.00,'2026-07-21 15:06:25'),(8,10,'deposit',50000.00,'2026-07-21 15:06:25'),(9,7,'transfer',100000.00,'2026-07-21 15:06:25'),(10,9,'withdrawal',30000.00,'2026-07-21 15:06:25');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
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
