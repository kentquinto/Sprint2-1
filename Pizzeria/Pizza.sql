CREATE DATABASE  IF NOT EXISTS `pizza` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizza`;
-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: pizza
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a4e5d57a-1e0f-11f1-8650-339a683aebed:1-347';

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `Category_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Category_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
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
  `Surname` varchar(25) NOT NULL,
  `Street` varchar(25) NOT NULL,
  `Postal_Code` varchar(25) NOT NULL,
  `Town` varchar(25) NOT NULL,
  `Province` varchar(25) NOT NULL,
  `Phone` varchar(25) NOT NULL,
  PRIMARY KEY (`Customer_Id`)
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
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `Delivery_Time` datetime NOT NULL,
  `Employee_Id` int NOT NULL,
  `Order_Id` int NOT NULL,
  PRIMARY KEY (`Order_Id`),
  KEY `fk_Delivery_Employee1_idx` (`Employee_Id`),
  KEY `fk_Delivery_Order1_idx` (`Order_Id`),
  CONSTRAINT `fk_Delivery_Employee1` FOREIGN KEY (`Employee_Id`) REFERENCES `Employee` (`Employee_Id`),
  CONSTRAINT `fk_Delivery_Order1` FOREIGN KEY (`Order_Id`) REFERENCES `Orders` (`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
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
  `Surname` varchar(25) NOT NULL,
  `Nif` varchar(10) NOT NULL,
  `Phone` varchar(25) NOT NULL,
  `Role` varchar(15) NOT NULL COMMENT 'Cook/Delivery',
  `Store_Id` int NOT NULL,
  PRIMARY KEY (`Employee_Id`),
  KEY `fk_Employee_Store1_idx` (`Store_Id`),
  CONSTRAINT `fk_Employee_Store1` FOREIGN KEY (`Store_Id`) REFERENCES `Store` (`Store_Id`)
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
-- Table structure for table `Order Items`
--

DROP TABLE IF EXISTS `Order Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order Items` (
  `Quantity` int NOT NULL,
  `Unit_Price` decimal(10,2) NOT NULL,
  `Order_Id` int NOT NULL,
  `Product_Id` int NOT NULL,
  PRIMARY KEY (`Order_Id`,`Product_Id`),
  KEY `fk_Order Items_Order1_idx` (`Order_Id`),
  KEY `fk_Order Items_Product1_idx` (`Product_Id`),
  CONSTRAINT `fk_Order Items_Order1` FOREIGN KEY (`Order_Id`) REFERENCES `Orders` (`Order_Id`),
  CONSTRAINT `fk_Order Items_Product1` FOREIGN KEY (`Product_Id`) REFERENCES `Product` (`Product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order Items`
--

LOCK TABLES `Order Items` WRITE;
/*!40000 ALTER TABLE `Order Items` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `Order_Id` int NOT NULL AUTO_INCREMENT,
  `Time` datetime NOT NULL COMMENT 'Order Time',
  `Total` decimal(10,2) NOT NULL,
  `Is_Delivery` tinyint NOT NULL COMMENT '0 = false\n1 = true\n',
  `Customer_Id` int NOT NULL,
  `Store_Id` int NOT NULL,
  PRIMARY KEY (`Order_Id`),
  KEY `fk_Order_Customer1_idx` (`Customer_Id`),
  KEY `fk_Order_Store1_idx` (`Store_Id`),
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`),
  CONSTRAINT `fk_Order_Store1` FOREIGN KEY (`Store_Id`) REFERENCES `Store` (`Store_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Product_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Image` varchar(200) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Product_Type` varchar(10) NOT NULL COMMENT 'Pizza/Burger/Drink',
  `Category_Id` int DEFAULT NULL COMMENT 'For pizzas only!!',
  PRIMARY KEY (`Product_Id`),
  KEY `fk_Product_Category1_idx` (`Category_Id`),
  CONSTRAINT `fk_Product_Category1` FOREIGN KEY (`Category_Id`) REFERENCES `Category` (`Category_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Store`
--

DROP TABLE IF EXISTS `Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Store` (
  `Store_Id` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(25) NOT NULL,
  `Postal_Code` varchar(25) NOT NULL,
  `City` varchar(25) NOT NULL,
  `Province` varchar(25) NOT NULL,
  PRIMARY KEY (`Store_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Store`
--

LOCK TABLES `Store` WRITE;
/*!40000 ALTER TABLE `Store` DISABLE KEYS */;
/*!40000 ALTER TABLE `Store` ENABLE KEYS */;
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

-- Dump completed on 2026-03-24 22:34:39
