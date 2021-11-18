-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: aa12uvfzptyz9iz.cwjmq7pdfuon.us-east-2.rds.amazonaws.com    Database: TPCC
-- ------------------------------------------------------
-- Server version	8.0.26

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `O_ID` int NOT NULL AUTO_INCREMENT,
  `O_D_ID` int NOT NULL,
  `O_W_ID` int NOT NULL,
  `O_C_ID` int NOT NULL,
  `O_ENTRY_D` datetime NOT NULL,
  `O_CARRIER_ID` tinyint DEFAULT NULL,
  `O_OL_CNT` tinyint NOT NULL,
  `O_ALL_LOCAL` tinyint NOT NULL,
  PRIMARY KEY (`O_ID`),
  KEY `order_C_D_ID_FK` (`O_D_ID`),
  KEY `order_C_D_W_ID_FK` (`O_W_ID`),
  KEY `order_C_ID_FK` (`O_C_ID`),
  CONSTRAINT `order_C_D_ID_FK` FOREIGN KEY (`O_D_ID`) REFERENCES `customer` (`C_D_ID`),
  CONSTRAINT `order_C_D_W_ID_FK` FOREIGN KEY (`O_W_ID`) REFERENCES `customer` (`C_W_ID`),
  CONSTRAINT `order_C_ID_FK` FOREIGN KEY (`O_C_ID`) REFERENCES `customer` (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18 17:52:00
