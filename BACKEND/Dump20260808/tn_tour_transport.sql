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
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport` (
  `transport_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `transport_type` varchar(50) DEFAULT NULL,
  `service_name` varchar(150) DEFAULT NULL,
  `source` varchar(150) DEFAULT NULL,
  `destination` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `description` text,
  `verified` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transport_id`),
  KEY `fk_transport_district` (`district_id`),
  CONSTRAINT `fk_transport_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,1,'Bus','Chennai MTC','Chennai Central','Marina Beach','04423456701','City bus service connecting Central to Marina Beach.',1,'2026-08-07 15:26:31'),(2,2,'Bus','Coimbatore City Bus','Gandhipuram','Ukkadam','042223456702','Frequent city bus service.',1,'2026-08-07 15:26:31'),(3,3,'Train','Southern Railway','Madurai Junction','Chennai Egmore','045223456703','Daily express train service.',1,'2026-08-07 15:26:31'),(4,4,'Taxi','Salem Taxi Service','Salem Bus Stand','Yercaud','042723456704','Taxi service for hill station tourists.',1,'2026-08-07 15:26:31'),(5,5,'Bus','Tiruchirappalli Bus','Central Bus Stand','Srirangam','043123456705','Local bus service.',1,'2026-08-07 15:26:31'),(6,6,'Train','Southern Railway','Tirunelveli Junction','Nagercoil','046223456706','Passenger train service.',1,'2026-08-07 15:26:31'),(7,7,'Taxi','Vellore Cabs','Vellore City','Golden Temple','041623456707','Tourist taxi service.',1,'2026-08-07 15:26:31'),(8,8,'Bus','Erode Town Bus','Erode Bus Stand','Bhavani','042423456708','Town bus service.',1,'2026-08-07 15:26:31'),(9,9,'Auto','Kanchipuram Auto','Bus Stand','Kailasanathar Temple','044223456709','Auto service.',1,'2026-08-07 15:26:31'),(10,10,'Bus','Thoothukudi Express','Bus Stand','Harbour','046123456710','Harbour transport.',1,'2026-08-07 15:26:31'),(11,11,'Taxi','Dindigul Travels','Railway Station','Kodaikanal','045123456711','Hill station taxi.',1,'2026-08-07 15:26:31'),(12,12,'Bus','Thanjavur Transport','Old Bus Stand','Big Temple','043623456712','Tourist shuttle.',1,'2026-08-07 15:26:31'),(13,13,'Train','Southern Railway','Villupuram','Chennai','0414623456713','Express train.',1,'2026-08-07 15:26:31'),(14,14,'Bus','Cuddalore City Bus','Bus Stand','Silver Beach','0414223456714','Beach route.',1,'2026-08-07 15:26:31'),(15,15,'Taxi','Nagapattinam Cabs','Railway Station','Velankanni','0436523456715','Pilgrim taxi.',1,'2026-08-07 15:26:31'),(16,16,'Bus','Kanyakumari Express','Bus Stand','Vivekananda Rock','0465223456716','Tourist bus.',1,'2026-08-07 15:26:31'),(17,17,'Train','Southern Railway','Karur','Erode','0432423456717','Passenger train.',1,'2026-08-07 15:26:31'),(18,18,'Bus','Namakkal Bus','Bus Stand','Anjaneyar Temple','0428623456718','Temple bus.',1,'2026-08-07 15:26:31'),(19,19,'Taxi','Krishnagiri Cabs','Town','Hosur','0434323456719','Intercity taxi.',1,'2026-08-07 15:26:31'),(20,20,'Bus','Dharmapuri Transport','Bus Stand','Hogenakkal','0434223456720','Tourist bus.',1,'2026-08-07 15:26:31'),(21,21,'Bus','Ramanathapuram Bus','Town','Rameswaram','0456723456721','Pilgrim bus.',1,'2026-08-07 15:26:31'),(22,22,'Train','Southern Railway','Sivagangai','Madurai','0457523456722','Passenger train.',1,'2026-08-07 15:26:31'),(23,23,'Taxi','Virudhunagar Taxi','Town','Srivilliputhur','0456223456723','Taxi service.',1,'2026-08-07 15:26:31'),(24,24,'Bus','Ariyalur Bus','Bus Stand','Gangaikonda Cholapuram','0432923456724','Tourist route.',1,'2026-08-07 15:26:31'),(25,25,'Auto','Perambalur Auto','Bus Stand','City Center','0432823456725','Auto service.',0,'2026-08-07 15:26:31'),(26,26,'Bus','Pudukkottai Bus','Bus Stand','Sithannavasal','0432223456726','Tourist shuttle.',1,'2026-08-07 15:26:31'),(27,27,'Taxi','Tenkasi Taxi','Railway Station','Courtallam','0463323456727','Waterfalls taxi.',1,'2026-08-07 15:26:31'),(28,28,'Bus','Nilgiris Transport','Ooty','Botanical Garden','042323456728','Tourist bus.',1,'2026-08-07 15:26:31'),(29,29,'Train','Southern Railway','Mayiladuthurai','Chennai','0436423456729','Express train.',1,'2026-08-07 15:26:31'),(30,30,'Bus','Tiruvarur Bus','Bus Stand','Thyagaraja Temple','0436623456730','Temple service.',1,'2026-08-07 15:26:31'),(31,31,'Taxi','Ranipet Cabs','Town','Arcot','0417223456731','Local taxi.',0,'2026-08-07 15:26:31'),(32,32,'Bus','Tirupattur Bus','Bus Stand','Yelagiri','0417923456732','Hill route.',1,'2026-08-07 15:26:31'),(33,33,'Taxi','Tiruvannamalai Taxi','Bus Stand','Arunachaleswarar Temple','0417523456733','Temple taxi.',1,'2026-08-07 15:26:31'),(34,34,'Bus','Kallakurichi Bus','Town','Bus Stand','0415123456734','Town service.',0,'2026-08-07 15:26:31'),(35,35,'Bus','Chengalpattu Bus','Railway Station','Mahabalipuram','04427456735','Tourist bus.',1,'2026-08-07 15:26:31'),(36,36,'Taxi','Tiruvallur Cabs','Town','Poondi Reservoir','04427656736','Tourist taxi.',1,'2026-08-07 15:26:31'),(37,37,'Bus','Tiruppur City Bus','Bus Stand','Railway Station','042123456737','City route.',1,'2026-08-07 15:26:31'),(38,38,'Taxi','Hosur Taxi','Bus Stand','Bengaluru Border','0434423456738','Interstate taxi.',1,'2026-08-07 15:26:31'),(39,1,'Metro','Chennai Metro','Airport','Central','04440000001','Metro rail service.',1,'2026-08-07 15:26:31'),(40,2,'Taxi','Coimbatore Airport Taxi','Airport','City Center','042240000002','Airport taxi.',1,'2026-08-07 15:26:31'),(41,3,'Bus','Madurai City Bus','Periyar Bus Stand','Meenakshi Temple','045240000003','Temple route.',1,'2026-08-07 15:26:31'),(42,4,'Train','Salem Passenger','Salem','Erode','042740000004','Passenger train.',1,'2026-08-07 15:26:31'),(43,5,'Taxi','Trichy Airport Taxi','Airport','Rockfort Temple','043140000005','Airport transfer.',1,'2026-08-07 15:26:31'),(44,6,'Bus','Tirunelveli Town Bus','Junction','Nellaiappar Temple','046240000006','Temple bus.',1,'2026-08-07 15:26:31'),(45,7,'Bus','Vellore Local Bus','Bus Stand','CMC Hospital','041640000007','Hospital route.',1,'2026-08-07 15:26:31'),(46,8,'Taxi','Erode Taxi Service','Railway Station','Bus Stand','042440000008','City taxi.',0,'2026-08-07 15:26:31'),(47,9,'Bus','Kanchipuram Tourist Bus','Bus Stand','Ekambareswarar Temple','044240000009','Tourist service.',1,'2026-08-07 15:26:31'),(48,10,'Taxi','Thoothukudi Harbour Taxi','Railway Station','Harbour','046140000010','Harbour transfer.',1,'2026-08-07 15:26:31');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-08  1:13:54
