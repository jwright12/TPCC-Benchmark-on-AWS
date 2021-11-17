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
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `OL_O_ID` int NOT NULL,
  `OL_D_ID` int NOT NULL,
  `OL_W_ID` int NOT NULL,
  `OL_NUMBER` tinyint NOT NULL,
  `OL_I_ID` int NOT NULL,
  `OL_SUPPLY_W_ID` int NOT NULL,
  `OL_DELIVERY_D` datetime DEFAULT NULL,
  `OL_QUANTITY` tinyint NOT NULL,
  `OL_AMOUNT` decimal(6,2) NOT NULL,
  `OL_DIST_INFO` varchar(24) NOT NULL,
  KEY `order_line_O_ID_FK` (`OL_O_ID`),
  KEY `order_line_O_D_ID_FK` (`OL_D_ID`),
  KEY `order_line_O_W_ID_FK` (`OL_W_ID`),
  KEY `order_line_S_I_ID_FK` (`OL_I_ID`),
  KEY `order_line_S_W_ID_FK` (`OL_SUPPLY_W_ID`),
  CONSTRAINT `order_line_O_D_ID_FK` FOREIGN KEY (`OL_D_ID`) REFERENCES `customer_order` (`O_D_ID`),
  CONSTRAINT `order_line_O_ID_FK` FOREIGN KEY (`OL_O_ID`) REFERENCES `customer_order` (`O_ID`),
  CONSTRAINT `order_line_O_W_ID_FK` FOREIGN KEY (`OL_W_ID`) REFERENCES `customer_order` (`O_W_ID`),
  CONSTRAINT `order_line_S_I_ID_FK` FOREIGN KEY (`OL_I_ID`) REFERENCES `stock` (`S_I_ID`),
  CONSTRAINT `order_line_S_W_ID_FK` FOREIGN KEY (`OL_SUPPLY_W_ID`) REFERENCES `stock` (`S_W_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 15:41:14
