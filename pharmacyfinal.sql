-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmacy
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `employeeID` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'A001','Rukshani','rukshani@gmail.com','0718313836','abc123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Alice Johnson','Alice@gmail.com','0771234567','AJ02','123','123 Maple St, Springfield'),(2,'Bob Smith','Bob@gmail.com','0779876543','BS02','123','456 Oak Rd, Greenville'),(3,'Carol Lee','Carol@gmail.com','0775647382','CL02','123','789 Pine Ave, Fairview'),(4,'David Kim','David@gmail.com','0773829105','DK02','123','321 Birch Blvd, Lakeside'),(5,'Emma Davis','Emma@gmail.com','0779102837','ED02','123','654 Cedar Ln, Hilltown'),(6,'Frank Wilson','Frank@gmail.com','0779102837','FW02','123','654 Cedar Ln, Hilltown'),(7,'William kumar','William@gamil.com','0771239012','WK02','123','123 Maple St, Springfield');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryagent`
--

DROP TABLE IF EXISTS `deliveryagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryagent` (
  `agentID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`agentID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryagent`
--

LOCK TABLES `deliveryagent` WRITE;
/*!40000 ALTER TABLE `deliveryagent` DISABLE KEYS */;
INSERT INTO `deliveryagent` VALUES (1,'D001','Jane Smith','Jane@gmail.com','0772345690','123'),(2,'D002','Michael Johnson','Michael@gmail.com','0773456789','123'),(3,'D003','Anna Williams','Anna@gmail.com','0774567890','123'),(4,'D004','David Brown','David@gmail.com','0775678901','123'),(5,'D005','Lisa Miller','Lisa@gmail.com','0776789012','123'),(6,'D006','Samuel Green','Samuel@gmail.com','0777890123','123');
/*!40000 ALTER TABLE `deliveryagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medID` int NOT NULL AUTO_INCREMENT,
  `medName` varchar(45) NOT NULL,
  `medDesc` varchar(500) DEFAULT NULL,
  `medBenefits` varchar(500) DEFAULT NULL,
  `medIng` varchar(500) DEFAULT NULL,
  `medQty` int NOT NULL,
  `medPrice` double NOT NULL,
  `medimage` varchar(500) NOT NULL,
  `pharmacist_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`medID`),
  KEY `pharmacist_id_idx` (`pharmacist_id`),
  CONSTRAINT `pharmacist_id` FOREIGN KEY (`pharmacist_id`) REFERENCES `pharmacist` (`pharmacistID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol 500mg','Used to treat pain and fever','Reduces mild to moderate pain and lowers fever','Paracetamol',120,2000,'paracetamol.webp','P001'),(2,'Cetirizine','Antihistamine for allergy symptoms','Relief from sneezing, runny nose, itching','Cetirizine Hydrochloride',250,500,'Cetirizine-5-mg-tab-2-scaled.jpg','P001'),(3,'Vitamin C pack','antioxidant support','Immune support, skin health','Ascorbic Acid',120,2600,'vitamin.jpg','P001'),(4,'ORS Sachets','Treats dehydration due to diarrhea','Rehydration, restores electrolytes','Glucose, Sodium, Potassium, Citrate',68,45,'ors.webp','P001'),(5,'Antibiotic Ointment','Used to prevent infection in minor cuts','Prevents bacterial infection','Neomycin, Bacitracin, Polymyxin B',120,650,'ant.png','P001'),(6,'Hydrocortisone Cream Tube','Anti-inflammatory for skin irritations','Reduces redness, itching, swelling','Hydrocortisone acetate',60,420,'h.webp','P001'),(7,'Moisturizing Cream','Hydrates and soothes dry skin','Restores skin moisture','Glycerin, Aloe Vera, Vitamin E',30,450,'cera.webp','P001'),(8,'Antifungal Cream','Treats fungal infections like athleteÃ¢ÂÂs foot','Stops fungal growth','Clotrimazole',90,220,'l.jpg','P001');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deliverStatus` varchar(45) DEFAULT 'pending',
  `paymentmethod` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'Alice Johnson','Alice@gmail.com','123 Maple St, Springfield','0771234567',2000.00,'pending','cash'),(2,7,'William kumar','William@gamil.com','123 Maple St, Springfield','0771239000',2000.00,'pending','cash'),(3,7,'William kumar','William@gamil.com','123 Maple St, Springfield','0771239000',2500.00,'in delivery','cash');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacist` (
  `pharmacistID` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `contactnumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pharmacistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacist`
--

LOCK TABLES `pharmacist` WRITE;
/*!40000 ALTER TABLE `pharmacist` DISABLE KEYS */;
INSERT INTO `pharmacist` VALUES ('P001','123','John','Johnn@gmail.com','0771234567'),('P002','123','Cater','Cater@gmail.com','0777894561'),('P003','123','Anne','Anne@gmail.com','0774562301'),('P004','123','Eliza','Eliza@gmail.com','0115698741'),('P005','123','Alexa','Alexa@gmail.com','0115698000'),('P006','123','Zelina','Zelina@gmail.com','0778541236'),('P007','123','Alixa','Alixa@gamil.com','0778561230');
/*!40000 ALTER TABLE `pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptiondelivery`
--

DROP TABLE IF EXISTS `prescriptiondelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptiondelivery` (
  `pDeliveryID` int NOT NULL AUTO_INCREMENT,
  `cusID` int DEFAULT NULL,
  `cusname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `presID` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `paymentmethod` varchar(45) DEFAULT NULL,
  `Dstatus` varchar(45) DEFAULT 'pending',
  PRIMARY KEY (`pDeliveryID`),
  KEY `cusID_idx` (`cusID`),
  KEY `presID_idx` (`presID`),
  KEY `amount_idx` (`amount`),
  CONSTRAINT `cusID` FOREIGN KEY (`cusID`) REFERENCES `customer` (`id`),
  CONSTRAINT `presID` FOREIGN KEY (`presID`) REFERENCES `prescriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptiondelivery`
--

LOCK TABLES `prescriptiondelivery` WRITE;
/*!40000 ALTER TABLE `prescriptiondelivery` DISABLE KEYS */;
INSERT INTO `prescriptiondelivery` VALUES (1,7,'William kumar','William@gamil.com','0771239012','123 Maple St, Springfield',7,600.00,'cashOnDelivery','pending');
/*!40000 ALTER TABLE `prescriptiondelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `filename` varchar(45) DEFAULT NULL,
  `filepath` varchar(225) DEFAULT NULL,
  `paymentmethod` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'pending',
  `address` varchar(70) DEFAULT NULL,
  `deliverStatus` varchar(45) DEFAULT 'pending',
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,'1','Alice Johnson','Alice@gmail.com','0771234567','p1.jpeg','images/p1.jpeg','cashOnDelivery','pending','123 Maple St, Springfield','pending',0.00),(2,'1','Alice Johnson','Alice@gmail.com','0771234567','p2.png','images/p2.png','cashOnDelivery','pending','123 Maple St, Springfield','pending',0.00),(3,'2','Bob Smith','Bob@gmail.com','0779876543','p3.jpeg','images/p3.jpeg','cashOnDelivery','pending','456 Oak Rd, Greenville','pending',0.00),(4,'3','Carol Lee','Carol@gmail.com','0775647382','p4.jpg','images/p4.jpg','cashOnDelivery','pending','789 Pine Ave, Fairview','pending',0.00),(5,'4','David Kim','David@gmail.com','0773829105','p5.jpg','images/p5.jpg','cashOnDelivery','pending','321 Birch Blvd, Lakeside','pending',0.00),(6,'4','David Kim','David@gmail.com','0773829105','p6.png','images/p6.png','cashOnDelivery','pending','321 Birch Blvd, Lakeside','pending',0.00),(7,'7','William kumar','William@gamil.com','0771239000','p1.jpeg','images/p1.jpeg','cashOnDelivery','Accepted','123 Maple St, Springfield','Processing',600.00);
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 19:40:47
