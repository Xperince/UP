-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: UP_11_01
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Autorization`
--

DROP TABLE IF EXISTS `Autorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Autorization` (
  `UserID` int(11) NOT NULL,
  `Login` varchar(16) NOT NULL,
  `Password` varchar(16) NOT NULL,
  UNIQUE KEY `Login_UNIQUE` (`Login`),
  KEY `fk_Autorization_1_idx` (`UserID`),
  CONSTRAINT `fk_Autorization_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autorization`
--

LOCK TABLES `Autorization` WRITE;
/*!40000 ALTER TABLE `Autorization` DISABLE KEYS */;
INSERT INTO `Autorization` VALUES (2,'123','123'),(1,'root','0000');
/*!40000 ALTER TABLE `Autorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CharValues`
--

DROP TABLE IF EXISTS `CharValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CharValues` (
  `TovarID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  `Value` varchar(128) NOT NULL,
  KEY `fk_CharValues_1_idx` (`CharID`),
  KEY `fk_CharValues_2_idx` (`TovarID`),
  CONSTRAINT `fk_CharValues_1` FOREIGN KEY (`CharID`) REFERENCES `Characters` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CharValues_2` FOREIGN KEY (`TovarID`) REFERENCES `Tovar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CharValues`
--

LOCK TABLES `CharValues` WRITE;
/*!40000 ALTER TABLE `CharValues` DISABLE KEYS */;
INSERT INTO `CharValues` VALUES (1,1,'AM4'),(1,2,'2017'),(1,8,'4'),(1,9,'8'),(1,10,'8 Мб'),(1,11,'14 нм'),(1,12,'3.2 ГГц'),(2,13,'1000 Гб'),(2,14,'3.5'),(2,15,'для настольного компьютера'),(2,16,'HDD'),(2,17,'SATA III'),(2,18,'7200 об./мин');
/*!40000 ALTER TABLE `CharValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Characters`
--

DROP TABLE IF EXISTS `Characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Characters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Characters`
--

LOCK TABLES `Characters` WRITE;
/*!40000 ALTER TABLE `Characters` DISABLE KEYS */;
INSERT INTO `Characters` VALUES (1,'Сокет'),(2,'Год выпуска'),(3,'Чипсет'),(4,'Версия PCI-E'),(5,'Поддержка SLI/CrossFire'),(6,'Кол-во SATA'),(7,'Год релиза'),(8,'Кол-во ядер'),(9,'Кол-во потоков'),(10,'L3-кэш'),(11,'Техпроцесс'),(12,'Частота'),(13,'Емкость'),(14,'Форм-фактор'),(15,'Назначение'),(16,'Тип'),(17,'Интерфейс'),(18,'Скорость вращения');
/*!40000 ALTER TABLE `Characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `UserID` int(11) NOT NULL,
  `Serial` varchar(4) NOT NULL,
  `Number` varchar(6) NOT NULL,
  `DateGivenBy` date NOT NULL,
  `GivenBy` varchar(255) NOT NULL,
  KEY `fk_Clients_1_idx` (`UserID`),
  CONSTRAINT `fk_Clients_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (3,'0424','154421','2024-11-13','ГУ МВД России по Красноярскому краю'),(4,'1820','904212','2020-05-22','МВД России по Кемеровской области');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GarantyType`
--

DROP TABLE IF EXISTS `GarantyType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GarantyType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GarantyType`
--

LOCK TABLES `GarantyType` WRITE;
/*!40000 ALTER TABLE `GarantyType` DISABLE KEYS */;
INSERT INTO `GarantyType` VALUES (1,'отсутствует'),(2,'день'),(3,'месяц'),(4,'год');
/*!40000 ALTER TABLE `GarantyType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manufacturer`
--

DROP TABLE IF EXISTS `Manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manufacturer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manufacturer`
--

LOCK TABLES `Manufacturer` WRITE;
/*!40000 ALTER TABLE `Manufacturer` DISABLE KEYS */;
INSERT INTO `Manufacturer` VALUES (1,'AMD'),(2,'Intel'),(3,'NVidia'),(4,'Gigabyte'),(5,'MSI'),(6,'ASRock'),(7,'Asus'),(8,'Seagate');
/*!40000 ALTER TABLE `Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderShopcase`
--

DROP TABLE IF EXISTS `OrderShopcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderShopcase` (
  `OrderID` int(11) NOT NULL,
  `TovarID` int(11) NOT NULL,
  `Count` int(11) NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  KEY `fk_OrderShopcase_1_idx` (`OrderID`),
  KEY `fk_OrderShopcase_2_idx` (`TovarID`),
  CONSTRAINT `fk_OrderShopcase_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderShopcase_2` FOREIGN KEY (`TovarID`) REFERENCES `Tovar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderShopcase`
--

LOCK TABLES `OrderShopcase` WRITE;
/*!40000 ALTER TABLE `OrderShopcase` DISABLE KEYS */;
INSERT INTO `OrderShopcase` VALUES (3,1,3,16200.00),(3,2,2,16000.00);
/*!40000 ALTER TABLE `OrderShopcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
INSERT INTO `OrderStatus` VALUES (1,'Создан'),(2,'На выполнении'),(3,'Приостановлен'),(4,'Отменен'),(5,'Выполнен');
/*!40000 ALTER TABLE `OrderStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreate` datetime NOT NULL,
  `EmployerID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `StatusID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Orders_1_idx` (`EmployerID`),
  KEY `fk_Orders_2_idx` (`ClientID`),
  KEY `fk_Orders_3_idx` (`StatusID`),
  CONSTRAINT `fk_Orders_1` FOREIGN KEY (`EmployerID`) REFERENCES `Users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_2` FOREIGN KEY (`ClientID`) REFERENCES `Users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_3` FOREIGN KEY (`StatusID`) REFERENCES `OrderStatus` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (3,'2025-11-13 11:44:24',2,4,32200.00,1);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Оператор'),(2,'Кладовщик'),(3,'Клиент');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tovar`
--

DROP TABLE IF EXISTS `Tovar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tovar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `CostValue` decimal(10,2) NOT NULL,
  `GarantyValue` smallint(3) NOT NULL,
  `GarantyTypeID` int(11) NOT NULL,
  `Count` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Tovar_2_idx` (`TypeID`),
  KEY `fk_Tovar_3_idx` (`GarantyTypeID`),
  KEY `fk_Tovar_1_idx` (`ManufacturerID`),
  CONSTRAINT `fk_Tovar_1` FOREIGN KEY (`ManufacturerID`) REFERENCES `Manufacturer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tovar_2` FOREIGN KEY (`TypeID`) REFERENCES `TypeTovar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tovar_3` FOREIGN KEY (`GarantyTypeID`) REFERENCES `GarantyType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tovar`
--

LOCK TABLES `Tovar` WRITE;
/*!40000 ALTER TABLE `Tovar` DISABLE KEYS */;
INSERT INTO `Tovar` VALUES (1,'Ryzen 3 1400',1,2,5400.00,12,3,6),(2,'Barracuda ST1000DM014.7200',8,3,8000.00,12,3,1);
/*!40000 ALTER TABLE `Tovar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TypeCharList`
--

DROP TABLE IF EXISTS `TypeCharList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TypeCharList` (
  `TypeID` int(11) NOT NULL,
  `CharID` int(11) NOT NULL,
  KEY `fk_TypeCharList_1_idx` (`TypeID`),
  KEY `fk_TypeCharList_2_idx` (`CharID`),
  CONSTRAINT `fk_TypeCharList_1` FOREIGN KEY (`TypeID`) REFERENCES `TypeTovar` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TypeCharList_2` FOREIGN KEY (`CharID`) REFERENCES `Characters` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TypeCharList`
--

LOCK TABLES `TypeCharList` WRITE;
/*!40000 ALTER TABLE `TypeCharList` DISABLE KEYS */;
INSERT INTO `TypeCharList` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,2),(2,8),(2,9),(2,10),(2,11),(2,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18);
/*!40000 ALTER TABLE `TypeCharList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TypeTovar`
--

DROP TABLE IF EXISTS `TypeTovar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TypeTovar` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TypeTovar`
--

LOCK TABLES `TypeTovar` WRITE;
/*!40000 ALTER TABLE `TypeTovar` DISABLE KEYS */;
INSERT INTO `TypeTovar` VALUES (1,'Материнская плата'),(2,'Процессор'),(3,'Жесткий диск');
/*!40000 ALTER TABLE `TypeTovar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Surname` varchar(64) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Patronymic` varchar(64) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Users_1_idx` (`RoleID`),
  CONSTRAINT `fk_Users_1` FOREIGN KEY (`RoleID`) REFERENCES `Roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Калинова','Анна','Павловна','1995-10-21','(800) 555-35-35',2),(2,'Иванов','Иван','Иванович','2001-05-16','(999) 832-09-15',1),(3,'Павлов','Егор','Анатольевич','1998-05-06','(996) 785-11-42',3),(4,'Бучкова','Елена','Павловна','1992-02-26','(957) 220-15-98',3);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-13 12:09:56
