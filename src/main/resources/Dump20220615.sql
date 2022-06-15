CREATE DATABASE  IF NOT EXISTS `music` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `music`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: music
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customers_customer_id_uindex` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Sandra BB','14 Wallstreet','Cuautitlan','Edo Mexico',1234,'5514654654'),(2,'Paola Gomez','15 Wallstreet','tultitlan','Edo Mexico',1234,'55234234'),(3,'Karina Rivera','16 Wallstreet','coacalco','Edo Mexico',1234,'5546456467'),(4,'Abigail Hernandez','17 Wallstreet','ecatepec','Edo Mexico',1234,'55989987'),(5,'Bela Gutierrez','18 Wallstreet','tlalpan','CDMX',1234,'551645664'),(6,'Jazmin Reyes','19 Wallstreet','coyoacan','CDMX',1234,'551379806'),(8,'Barbara Villafaña','Jacarandas','Coacalco','Mexico',12341,'4234133'),(9,'Daly ','Sanchez','Nueva ñ','Jalisco',12341,'35434677');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `outlet_number` int NOT NULL,
  `emp_number` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`emp_number`),
  UNIQUE KEY `emp_number_UNIQUE` (`emp_number`),
  KEY `outlet_fk_idx` (`outlet_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1,'Daniel Trujillo'),(2,2,'Rodrigo Hernandez'),(3,3,'Oglando Mejia'),(4,4,'Ricardo Hernandez'),(1,5,'Oscar Olguin'),(3,6,'Victor Hernandez'),(4,8,'Cain'),(4,9,'John Doe');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `outlet_number` int NOT NULL,
  `product_code` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  KEY `inven_out_fk_idx` (`outlet_number`),
  KEY `inven_pro_idx` (`product_code`),
  CONSTRAINT `inven_out_fk` FOREIGN KEY (`outlet_number`) REFERENCES `outlets` (`outlet_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inven_pro` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,29),(1,2,20),(1,3,10),(1,4,3),(1,5,40),(2,1,29),(2,3,26),(2,5,33),(2,6,16),(3,5,1),(3,4,2),(3,6,3),(3,8,3),(4,10,10),(4,9,31),(4,7,23),(4,8,31);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `outlet_number` int NOT NULL,
  `emp_number` int NOT NULL,
  KEY `outlet_fk_idx` (`outlet_number`),
  KEY `man_emp_fk_idx` (`emp_number`),
  CONSTRAINT `man_emp_fk` FOREIGN KEY (`emp_number`) REFERENCES `employees` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `man_outlet_fk` FOREIGN KEY (`outlet_number`) REFERENCES `outlets` (`outlet_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,2),(2,5),(3,6);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outlets`
--

DROP TABLE IF EXISTS `outlets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outlets` (
  `outlet_number` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`outlet_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outlets`
--

LOCK TABLES `outlets` WRITE;
/*!40000 ALTER TABLE `outlets` DISABLE KEYS */;
INSERT INTO `outlets` VALUES (1,'wallstreet','coyoacan','CDMX','1234','551379806'),(2,'tulipanes 12','coacalco','Edo Mexico','4312','551223123'),(3,'ortencias 14','tultitlan','Edo Mexico','6904','55333333'),(4,'San Miguel 22','polanco','CDMX','7890','551111111');
/*!40000 ALTER TABLE `outlets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_code` int NOT NULL AUTO_INCREMENT,
  `artist` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `cost` decimal(6,2) NOT NULL,
  `sale_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`product_code`),
  UNIQUE KEY `products_product_code_uindex` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Eminem','encore',100.00,110.00),(2,'Eminem','marshall mathers',102.00,112.00),(3,'Eminem','eminem show',103.00,113.00),(4,'2pac','all eyez on me',200.00,220.00),(5,'Canserbero','vida',100.00,110.00),(6,'Canserbero','muerte',100.00,110.00),(7,'Proof','vedugo',90.00,100.00),(8,'The notorius B.I.G','ready to die',200.00,220.00),(9,'Cartel de santa','golpe avisa',150.00,160.00),(10,'Cartel de santa','Sin copa',150.23,160.67);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `outlet_number` int NOT NULL,
  `product_code` int NOT NULL,
  `customer_id` int NOT NULL,
  `return_date` date DEFAULT NULL,
  `return_time` time DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  KEY `ret_outlet_f_idx` (`outlet_number`),
  KEY `ret_product_idx` (`product_code`),
  KEY `ret_customer_fk_idx` (`customer_id`),
  CONSTRAINT `ret_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ret_outlet_fk` FOREIGN KEY (`outlet_number`) REFERENCES `outlets` (`outlet_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ret_product_fk` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (2,6,1,'2022-05-25','16:16:39',2,'factory error'),(2,1,5,'2022-05-24','13:02:44',3,'It doesn\'t fit'),(2,3,5,'2022-05-24','13:02:44',4,'It is not i wanted'),(2,5,5,'2022-05-24','13:02:44',7,'It is not i wanted');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `outlet_number` int NOT NULL,
  `emp_number` int NOT NULL,
  `customer_id` int NOT NULL,
  `product_code` int NOT NULL,
  `sale_date` date DEFAULT NULL,
  `sale_time` time DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `sales_outlet_fk_idx` (`outlet_number`),
  KEY `sales_customer_fr_idx` (`customer_id`),
  KEY `sales_product_idx` (`product_code`),
  KEY `sales_emp_fk_idx` (`emp_number`),
  CONSTRAINT `sales_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_emp_fk` FOREIGN KEY (`emp_number`) REFERENCES `employees` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_outlet_fk` FOREIGN KEY (`outlet_number`) REFERENCES `outlets` (`outlet_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_product` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (2,2,2,2,'2022-05-11','22:25:29',3),(2,2,5,1,'2022-05-22','18:50:12',2),(2,2,5,1,'2022-05-22','18:50:12',2),(2,2,5,1,'2022-05-22','18:50:12',2),(2,2,5,5,'2022-05-22','19:05:20',2),(2,2,5,6,'2022-05-22','19:05:20',4),(2,2,5,1,'2022-05-22','19:05:20',2),(2,5,5,1,'2022-05-23','16:16:39',2),(2,5,5,3,'2022-05-23','16:16:39',4),(2,5,5,5,'2022-05-23','16:16:39',2),(2,2,1,1,'2022-05-23','16:22:38',2),(2,2,1,3,'2022-05-23','16:22:38',4),(2,2,1,5,'2022-05-23','16:22:38',2);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 18:02:11
