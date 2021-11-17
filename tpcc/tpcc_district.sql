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
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `D_ID` int NOT NULL AUTO_INCREMENT,
  `D_W_ID` int NOT NULL,
  `D_NAME` varchar(16) NOT NULL,
  `D_STREET_1` varchar(20) NOT NULL,
  `D_STREET_2` varchar(20) NOT NULL,
  `D_CITY` varchar(20) NOT NULL,
  `D_STATE` varchar(20) NOT NULL,
  `D_ZIP` varchar(9) NOT NULL,
  `D_TAX` decimal(4,4) NOT NULL,
  `D_YTD` decimal(12,2) NOT NULL,
  `D_NEXT_O_ID` int NOT NULL,
  PRIMARY KEY (`D_ID`),
  KEY `district_FK` (`D_W_ID`),
  CONSTRAINT `district_FK` FOREIGN KEY (`D_W_ID`) REFERENCES `warehouse` (`W_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,1,'Gram','79','231','Austin','Texas','13319',0.6366,30000.00,36),(2,1,'Carey','262','502','Waterloo','Iowa','36811',0.4592,30000.00,37),(3,1,'Tonia','475','2','Sacramento','California','47010',0.5500,30000.00,14278),(4,1,'Zorine','788','5','New York City','New York','30189',0.5805,30000.00,14285),(5,1,'Philomena','553','44','Saint Paul','Minnesota','53486',0.5920,30000.00,19827),(6,1,'Siana','775','795','Washington','District of Columbia','93279',0.4986,30000.00,19820),(7,1,'Charlton','821','289','Vero Beach','Florida','94429',0.3334,30000.00,20000),(8,1,'Brinna','534','127','Littleton','Colorado','21500',0.6143,30000.00,20115),(9,1,'Daisi','88','654','Springfield','Illinois','74177',0.5392,30000.00,20191),(10,1,'Carmen','571','448','Austin','Texas','44255',0.5331,30000.00,20223),(11,2,'Millard','155','561','Bonita Springs','Florida','10914',0.6592,30000.00,18),(12,2,'Gibb','92','879','Amarillo','Texas','84397',0.6628,30000.00,18),(13,2,'Rodrique','262','169','Orange','California','32657',0.6553,30000.00,18),(14,2,'Amye','760','234','Washington','District of Columbia','93848',0.5861,30000.00,18),(15,2,'Clarinda','322','789','Springfield','Massachusetts','56808',0.5549,30000.00,18),(16,2,'Nikoletta','314','765','Seattle','Washington','78895',0.6008,30000.00,18),(17,2,'Ashien','939','465','Lincoln','Nebraska','18808',0.6772,30000.00,18),(18,2,'Ariadne','188','321','Oxnard','California','73259',0.6988,30000.00,18),(19,2,'Corny','728','548','Albany','New York','74526',0.5326,30000.00,18),(20,2,'Maureen','500','285','Erie','Pennsylvania','41350',0.4025,30000.00,18);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-11 15:41:13
