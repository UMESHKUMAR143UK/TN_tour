-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: tn_tour
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `district_id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) NOT NULL,
  `region` varchar(50) DEFAULT NULL,
  `headquarters` varchar(100) DEFAULT NULL,
  `famous_places` text,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `district_name` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Ariyalur','Central','Ariyalur','Gangaikonda Cholapuram Temple','images/ariyalur.jpg'),(2,'Chengalpattu','North','Chengalpattu','Mahabalipuram, Kovalam Beach',NULL),(3,'Chennai','North','Chennai','Marina Beach, Fort St. George','images/chennai.jpg'),(4,'Coimbatore','West','Coimbatore','Marudamalai Temple, VOC Park','images/coimbatore.jpg'),(5,'Cuddalore','East','Cuddalore','Silver Beach, Pichavaram',NULL),(6,'Dharmapuri','North-West','Dharmapuri','Hogenakkal Falls','images/dharmapuri.jpg'),(7,'Dindigul','South','Dindigul','Kodaikanal, Dindigul Fort',NULL),(8,'Erode','West','Erode','Bhavani Sangameswarar Temple','images/erode.jpg'),(9,'Kallakurichi','North','Kallakurichi','Kalvarayan Hills',NULL),(10,'Kanchipuram','North','Kanchipuram','Ekambareswarar Temple, Kailasanathar Temple',NULL),(11,'Kanyakumari','South','Nagercoil','Vivekananda Rock Memorial, Thiruvalluvar Statue','images/kanyakumari.jpg'),(12,'Karur','Central','Karur','Pasupathieswarar Temple','images/karur.jpg'),(13,'Krishnagiri','North-West','Krishnagiri','Krishnagiri Dam','images/krishnagiri.jpg'),(14,'Madurai','South','Madurai','Meenakshi Amman Temple','images/madurai.jpg'),(15,'Mayiladuthurai','East','Mayiladuthurai','Mayuranathaswamy Temple','images/mayiladuthurai.jpg'),(16,'Nagapattinam','East','Nagapattinam','Velankanni Basilica','images/nagapattinam.jpg'),(17,'Namakkal','West','Namakkal','Namakkal Fort','images/namakkal.jpg'),(18,'Nilgiris','West','Udhagamandalam','Ooty Botanical Garden','images/nilgiris.jpg'),(19,'Perambalur','Central','Perambalur','Ranjankudi Fort','images/perambalur.jpg'),(20,'Pudukkottai','Central','Pudukkottai','Sittannavasal Cave','images/pudukkottai.jpg'),(21,'Ramanathapuram','South','Ramanathapuram','Pamban Bridge',NULL),(22,'Ranipet','North','Ranipet','Arcot',NULL),(23,'Salem','West','Salem','Yercaud',NULL),(24,'Sivaganga','South','Sivaganga','Chettinad',NULL),(25,'Tenkasi','South','Tenkasi','Courtallam Falls',NULL),(26,'Thanjavur','Central','Thanjavur','Brihadeeswarar Temple','images/thanjavur.jpg'),(27,'Theni','South','Theni','Meghamalai',NULL),(28,'Thoothukudi','South','Thoothukudi','Tuticorin Port',NULL),(29,'Tiruchirappalli','Central','Tiruchirappalli','Rockfort Temple, Srirangam','images/tiruchirappalli.jpg'),(30,'Tirunelveli','South','Tirunelveli','Nellaiappar Temple',NULL),(31,'Tirupathur','North','Tirupathur','Yelagiri Hills',NULL),(32,'Tiruppur','West','Tiruppur','Avinashi Temple','images/tiruppur.jpg'),(33,'Tiruvallur','North','Tiruvallur','Pulicat Lake',NULL),(34,'Tiruvannamalai','North','Tiruvannamalai','Arunachaleswarar Temple',NULL),(35,'Tiruvarur','Central','Tiruvarur','Thyagaraja Temple','images/tiruvarur.jpg'),(36,'Vellore','North','Vellore','Vellore Fort',NULL),(37,'Viluppuram','North','Viluppuram','Gingee Fort',NULL),(38,'Virudhunagar','South','Virudhunagar','Srivilliputhur Temple',NULL);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-08  1:13:53
