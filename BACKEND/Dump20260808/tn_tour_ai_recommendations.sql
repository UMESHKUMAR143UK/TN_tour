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
-- Table structure for table `ai_recommendations`
--

DROP TABLE IF EXISTS `ai_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_recommendations` (
  `recommendation_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `recommendation_title` varchar(150) NOT NULL,
  `recommendation` text NOT NULL,
  `travel_type` varchar(100) DEFAULT NULL,
  `best_time_to_visit` varchar(100) DEFAULT NULL,
  `estimated_budget` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`recommendation_id`),
  KEY `fk_ai_district` (`district_id`),
  CONSTRAINT `fk_ai_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_recommendations`
--

LOCK TABLES `ai_recommendations` WRITE;
/*!40000 ALTER TABLE `ai_recommendations` DISABLE KEYS */;
INSERT INTO `ai_recommendations` VALUES (1,1,'Chennai Heritage Tour','Visit Marina Beach, Kapaleeshwarar Temple and Fort St. George.','Family','November-February','₹5,000','2026-08-07 16:35:45'),(2,2,'Coimbatore Nature Tour','Explore Marudhamalai Temple, Siruvani Dam and VOC Park.','Friends','October-February','₹4,500','2026-08-07 16:35:45'),(3,3,'Madurai Temple Tour','Visit Meenakshi Temple and Thirumalai Nayakkar Palace.','Couple','November-February','₹6,000','2026-08-07 16:35:45'),(4,4,'Yercaud Hill Trip','Enjoy Yercaud Lake and Pagoda Point.','Family','October-January','₹5,500','2026-08-07 16:35:45'),(5,5,'Trichy Heritage Tour','Visit Rock Fort and Srirangam Temple.','Family','November-February','₹4,000','2026-08-07 16:35:45'),(6,6,'Tirunelveli Temple Tour','Visit Nellaiappar Temple and Manimuthar Falls.','Family','October-February','₹4,500','2026-08-07 16:35:45'),(7,7,'Vellore Spiritual Tour','Visit Golden Temple and Vellore Fort.','Couple','November-February','₹5,000','2026-08-07 16:35:45'),(8,8,'Erode Weekend Tour','Explore Bhavani Temple and Kodiveri Dam.','Friends','September-February','₹3,500','2026-08-07 16:35:45'),(9,9,'Kanchipuram Temple Tour','Visit Ekambareswarar and Kailasanathar Temples.','Family','October-February','₹4,000','2026-08-07 16:35:45'),(10,10,'Thoothukudi Coastal Tour','Visit Harbour and Snows Basilica.','Family','November-February','₹4,500','2026-08-07 16:35:45'),(11,11,'Kodaikanal Hill Tour','Visit Kodaikanal Lake and Pillar Rocks.','Couple','April-June','₹8,000','2026-08-07 16:35:45'),(12,12,'Thanjavur Heritage Tour','Visit Brihadeeswarar Temple and Palace.','Family','November-February','₹4,500','2026-08-07 16:35:45'),(13,13,'Villupuram Fort Tour','Visit Gingee Fort and Mailam Temple.','Friends','October-February','₹4,000','2026-08-07 16:35:45'),(14,14,'Cuddalore Beach Tour','Visit Silver Beach and Fort St. David.','Family','November-February','₹4,500','2026-08-07 16:35:45'),(15,15,'Nagapattinam Pilgrimage','Visit Velankanni Basilica and Nagore Dargah.','Family','October-February','₹5,000','2026-08-07 16:35:45'),(16,16,'Kanyakumari Sunrise Tour','Visit Vivekananda Rock and Thiruvalluvar Statue.','Couple','October-March','₹6,000','2026-08-07 16:35:45'),(17,17,'Karur Temple Tour','Visit Pasupatheeswarar Temple and Amaravathi Dam.','Family','November-February','₹3,500','2026-08-07 16:35:45'),(18,18,'Namakkal Spiritual Tour','Visit Namakkal Fort and Anjaneyar Temple.','Family','October-February','₹3,000','2026-08-07 16:35:45'),(19,19,'Krishnagiri Adventure Tour','Visit Krishnagiri Dam and Rayakottai Fort.','Friends','September-February','₹4,500','2026-08-07 16:35:45'),(20,20,'Hogenakkal Falls Tour','Enjoy Hogenakkal Falls and Theerthamalai Temple.','Friends','October-February','₹5,000','2026-08-07 16:35:45'),(21,21,'Rameswaram Pilgrimage','Visit Ramanathaswamy Temple and Pamban Bridge.','Family','November-February','₹6,500','2026-08-07 16:35:45'),(22,22,'Chettinad Heritage Tour','Visit Chettinad Mansions and Pillayarpatti Temple.','Family','October-February','₹5,000','2026-08-07 16:35:45'),(23,23,'Srivilliputhur Tour','Visit Andal Temple and Ayyanar Falls.','Family','October-February','₹4,500','2026-08-07 16:35:45'),(24,24,'Ariyalur Heritage Tour','Visit Gangaikonda Cholapuram Temple.','Family','November-February','₹4,000','2026-08-07 16:35:45'),(25,25,'Perambalur Tour','Visit Ranjankudi Fort and nearby parks.','Friends','October-February','₹3,500','2026-08-07 16:35:45'),(26,26,'Pudukkottai Heritage Tour','Visit Sithannavasal and Thirumayam Fort.','Family','November-February','₹4,500','2026-08-07 16:35:45'),(27,27,'Tenkasi Waterfalls Tour','Visit Courtallam Falls and Kasi Viswanathar Temple.','Friends','June-September','₹5,000','2026-08-07 16:35:45'),(28,28,'Ooty Hill Station Tour','Visit Botanical Garden and Ooty Lake.','Couple','April-June','₹8,500','2026-08-07 16:35:45'),(29,29,'Mayiladuthurai Temple Tour','Visit Mayuranathar Temple.','Family','October-February','₹3,500','2026-08-07 16:35:45'),(30,30,'Thiruvarur Temple Tour','Visit Thyagaraja Temple.','Family','October-February','₹3,500','2026-08-07 16:35:45'),(31,31,'Ranipet Local Tour','Explore nearby historical attractions.','Friends','November-February','₹3,000','2026-08-07 16:35:45'),(32,32,'Yelagiri Hill Tour','Enjoy boating and trekking.','Couple','September-February','₹5,500','2026-08-07 16:35:45'),(33,33,'Tiruvannamalai Spiritual Tour','Visit Arunachaleswarar Temple.','Family','November-February','₹4,500','2026-08-07 16:35:45'),(34,34,'Kallakurichi Nature Tour','Visit Gomukhi Dam.','Friends','October-February','₹3,500','2026-08-07 16:35:45'),(35,35,'Mahabalipuram Tour','Visit Shore Temple and Five Rathas.','Family','November-February','₹6,000','2026-08-07 16:35:45'),(36,36,'Tiruvallur Temple Tour','Visit Veeraraghava Temple.','Family','October-February','₹3,500','2026-08-07 16:35:45'),(37,37,'Tiruppur Shopping Tour','Explore textile markets and local temples.','Friends','October-February','₹4,000','2026-08-07 16:35:45'),(38,38,'Hosur Weekend Tour','Visit Chandira Choodeswarar Temple.','Family','October-February','₹4,500','2026-08-07 16:35:45'),(39,1,'Chennai Food Tour','Enjoy beaches and famous restaurants.','Friends','November-February','₹5,500','2026-08-07 16:35:45'),(40,2,'Coimbatore Adventure','Nature trails and waterfalls.','Friends','September-January','₹5,000','2026-08-07 16:35:45'),(41,3,'Madurai Night Tour','Experience temple lights and local food.','Couple','November-February','₹5,500','2026-08-07 16:35:45'),(42,4,'Salem Hills Tour','Visit Yercaud and coffee plantations.','Family','October-January','₹6,000','2026-08-07 16:35:45'),(43,5,'Trichy Pilgrimage','Temple visits with river sightseeing.','Family','November-February','₹4,500','2026-08-07 16:35:45'),(44,6,'Tirunelveli Heritage','Temple and waterfall exploration.','Family','October-February','₹5,000','2026-08-07 16:35:45'),(45,7,'Vellore Weekend','Fort, museum and Golden Temple.','Couple','November-February','₹5,500','2026-08-07 16:35:45'),(46,8,'Erode Nature Escape','Dam, temples and river view.','Friends','October-February','₹4,000','2026-08-07 16:35:45'),(47,9,'Kanchipuram Silk Tour','Temple visit and silk shopping.','Family','October-February','₹5,000','2026-08-07 16:35:45'),(48,10,'Thoothukudi Beach Tour','Harbour, beach and seafood experience.','Friends','November-February','₹5,500','2026-08-07 16:35:45');
/*!40000 ALTER TABLE `ai_recommendations` ENABLE KEYS */;
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
