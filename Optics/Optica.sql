CREATE DATABASE  IF NOT EXISTS `optica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optica`;
-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: optica
-- ------------------------------------------------------
-- Server version	9.6.0

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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a4e5d57a-1e0f-11f1-8650-339a683aebed:1-346';

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand` (
  `Brand_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Supplier_Id` int NOT NULL,
  PRIMARY KEY (`Brand_Id`),
  KEY `fk_Brand_Supplier_idx` (`Supplier_Id`),
  CONSTRAINT `fk_Brand_Supplier` FOREIGN KEY (`Supplier_Id`) REFERENCES `Supplier` (`Supplier_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Customer_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Postal_Address` varchar(25) NOT NULL,
  `Phone` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Registration_Date` datetime NOT NULL,
  `Recommended_By` int NOT NULL,
  PRIMARY KEY (`Customer_Id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `fk_Customer_Customer1_idx` (`Recommended_By`),
  CONSTRAINT `fk_Customer_Customer1` FOREIGN KEY (`Recommended_By`) REFERENCES `Customer` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Employee_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Glasses`
--

DROP TABLE IF EXISTS `Glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Glasses` (
  `Glasses_Id` int NOT NULL AUTO_INCREMENT,
  `Frame_Type` varchar(15) NOT NULL COMMENT 'Rimless, Plastic, Metal',
  `Frame_Color` varchar(25) NOT NULL,
  `Left_Lens_Color` varchar(25) NOT NULL,
  `Right_Lens_Color` varchar(25) NOT NULL,
  `Left_Lens_Power` decimal(10,2) NOT NULL,
  `Right_Lens_Power` decimal(10,2) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Brand_Id` int NOT NULL,
  PRIMARY KEY (`Glasses_Id`),
  KEY `fk_Glasses_Brand1_idx` (`Brand_Id`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_Id`) REFERENCES `Brand` (`Brand_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Glasses`
--

LOCK TABLES `Glasses` WRITE;
/*!40000 ALTER TABLE `Glasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sale_Item`
--

DROP TABLE IF EXISTS `Sale_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sale_Item` (
  `Quantity` int NOT NULL,
  `Sales_Id` int NOT NULL,
  `Glasses_Id` int NOT NULL,
  PRIMARY KEY (`Sales_Id`,`Glasses_Id`),
  KEY `fk_Sale_Item_Sales1_idx` (`Sales_Id`),
  KEY `fk_Sale_Item_Glasses1_idx` (`Glasses_Id`),
  CONSTRAINT `fk_Sale_Item_Glasses1` FOREIGN KEY (`Glasses_Id`) REFERENCES `Glasses` (`Glasses_Id`),
  CONSTRAINT `fk_Sale_Item_Sales1` FOREIGN KEY (`Sales_Id`) REFERENCES `Sales` (`Sales_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sale_Item`
--

LOCK TABLES `Sale_Item` WRITE;
/*!40000 ALTER TABLE `Sale_Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sale_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `Sales_Id` int NOT NULL AUTO_INCREMENT,
  `Sale_Datetime` datetime NOT NULL,
  `Total` decimal(10,2) NOT NULL COMMENT 'Total Price\n',
  `Customer_Id` int NOT NULL,
  `Employee_Id` int NOT NULL,
  PRIMARY KEY (`Sales_Id`),
  KEY `fk_Sales_Customer1_idx` (`Customer_Id`),
  KEY `fk_Sales_Employee1_idx` (`Employee_Id`),
  CONSTRAINT `fk_Sales_Customer1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`),
  CONSTRAINT `fk_Sales_Employee1` FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `Supplier_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Street` varchar(25) NOT NULL,
  `Number` varchar(25) NOT NULL,
  `Floor` varchar(10) NOT NULL,
  `Door` varchar(10) NOT NULL,
  `City` varchar(25) NOT NULL,
  `Postal_Code` varchar(25) NOT NULL,
  `Country` varchar(25) NOT NULL,
  `Phone` varchar(25) NOT NULL,
  `Fax` varchar(25) NOT NULL,
  `Nif` varchar(10) NOT NULL,
  PRIMARY KEY (`Supplier_Id`),
  UNIQUE KEY `Nif_UNIQUE` (`Nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
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

-- Dump completed on 2026-03-24 22:34:11
