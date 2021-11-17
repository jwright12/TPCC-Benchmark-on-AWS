-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tpcc
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `S_I_ID` int NOT NULL,
  `S_W_ID` int NOT NULL,
  `S_QUANTITY` int NOT NULL,
  `S_DIST_01` varchar(24) NOT NULL,
  `S_DIST_02` varchar(24) NOT NULL,
  `S_DIST_03` varchar(24) NOT NULL,
  `S_DIST_04` varchar(24) NOT NULL,
  `S_DIST_05` varchar(24) NOT NULL,
  `S_DIST_06` varchar(24) NOT NULL,
  `S_DIST_07` varchar(24) NOT NULL,
  `S_DIST_08` varchar(24) NOT NULL,
  `S_DIST_09` varchar(24) NOT NULL,
  `S_DIST_10` varchar(24) NOT NULL,
  `S_YTD` decimal(8,0) NOT NULL,
  `S_ORDER_CNT` decimal(4,0) NOT NULL,
  `S_REMOTE_CNT` decimal(4,0) NOT NULL,
  `S_DATA` varchar(50) NOT NULL,
  KEY `stock_I_ID_FK` (`S_I_ID`),
  KEY `stock_W_ID_FK` (`S_W_ID`),
  CONSTRAINT `stock_I_ID_FK` FOREIGN KEY (`S_I_ID`) REFERENCES `item` (`I_ID`),
  CONSTRAINT `stock_W_ID_FK` FOREIGN KEY (`S_W_ID`) REFERENCES `warehouse` (`W_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 15:41:18
