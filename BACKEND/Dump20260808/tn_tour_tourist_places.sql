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
-- Table structure for table `tourist_places`
--

DROP TABLE IF EXISTS `tourist_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist_places` (
  `place_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `place_name` varchar(150) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` text,
  `best_season` varchar(50) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `entry_fee` decimal(10,2) DEFAULT '0.00',
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT '0.0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`place_id`),
  KEY `fk_place_district` (`district_id`),
  CONSTRAINT `fk_place_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist_places`
--

LOCK TABLES `tourist_places` WRITE;
/*!40000 ALTER TABLE `tourist_places` DISABLE KEYS */;
INSERT INTO `tourist_places` VALUES (1,1,'Gangaikonda Cholapuram Temple','Temple','UNESCO heritage Chola temple.','Nov-Feb','06:00:00','18:00:00',50.00,11.2075000,79.4533000,'gangaikonda.jpg',4.8,'2026-08-07 09:33:28'),(2,2,'Mahabalipuram Shore Temple','Heritage','Ancient Pallava monument.','Nov-Feb','06:00:00','18:00:00',40.00,12.6208000,80.1931000,'shore_temple.jpg',4.9,'2026-08-07 09:33:28'),(3,3,'Marina Beach','Beach','Longest urban beach in India.','Nov-Feb','00:00:00','23:59:00',0.00,13.0500000,80.2824000,'marina.jpg',4.7,'2026-08-07 09:33:28'),(4,4,'Marudamalai Temple','Temple','Hill temple of Lord Murugan.','Oct-Mar','05:30:00','20:00:00',20.00,11.0456000,76.8615000,'marudamalai.jpg',4.8,'2026-08-07 09:33:28'),(5,5,'Silver Beach','Beach','Beautiful beach in Cuddalore.','Nov-Feb','06:00:00','18:30:00',0.00,11.7000000,79.7700000,'silver_beach.jpg',4.5,'2026-08-07 09:33:28'),(6,6,'Hogenakkal Falls','Waterfall','Famous waterfalls of Tamil Nadu.','Jul-Feb','08:00:00','17:00:00',30.00,12.1196000,77.7750000,'hogenakkal.jpg',4.8,'2026-08-07 09:33:28'),(7,7,'Kodaikanal Lake','Hill Station','Popular boating destination.','Sep-May','08:00:00','18:00:00',20.00,10.2381000,77.4892000,'kodaikanal_lake.jpg',4.9,'2026-08-07 09:33:28'),(8,8,'Bhavani Sangameswarar Temple','Temple','Temple at river confluence.','Oct-Mar','06:00:00','20:00:00',10.00,11.4500000,77.6833000,'bhavani.jpg',4.7,'2026-08-07 09:33:28'),(9,9,'Kalvarayan Hills','Hill Station','Scenic hill range.','Oct-Feb','06:00:00','18:00:00',0.00,11.6500000,78.9500000,'kalvarayan.jpg',4.5,'2026-08-07 09:33:28'),(10,10,'Ekambareswarar Temple','Temple','One of Pancha Bhoota temples.','Nov-Feb','05:30:00','21:00:00',20.00,12.8342000,79.7036000,'ekambareswarar.jpg',4.9,'2026-08-07 09:33:28'),(11,11,'Vivekananda Rock Memorial','Monument','Famous memorial in Kanyakumari.','Oct-Mar','07:00:00','16:00:00',50.00,8.0780000,77.5540000,'vivekananda.jpg',4.9,'2026-08-07 09:33:28'),(12,12,'Pasupathieswarar Temple','Temple','Historic Shiva temple.','Nov-Feb','06:00:00','20:00:00',10.00,10.9577000,78.0809000,'pasupathi.jpg',4.6,'2026-08-07 09:33:28'),(13,13,'Krishnagiri Dam','Dam','Popular picnic spot.','Jul-Jan','08:00:00','18:00:00',10.00,12.5300000,78.2200000,'krishnagiri_dam.jpg',4.5,'2026-08-07 09:33:28'),(14,14,'Meenakshi Amman Temple','Temple','World-famous temple in Madurai.','Oct-Mar','05:00:00','21:30:00',50.00,9.9195000,78.1193000,'meenakshi.jpg',5.0,'2026-08-07 09:33:28'),(15,15,'Mayuranathaswamy Temple','Temple','Ancient Shiva temple.','Nov-Feb','06:00:00','20:00:00',10.00,11.1000000,79.6500000,'mayuranathar.jpg',4.7,'2026-08-07 09:33:28'),(16,16,'Velankanni Basilica','Church','Popular pilgrimage centre.','Nov-Feb','05:00:00','21:00:00',0.00,10.6825000,79.8528000,'velankanni.jpg',4.9,'2026-08-07 09:33:28'),(17,17,'Namakkal Fort','Fort','Historic hill fort.','Oct-Feb','08:00:00','17:00:00',20.00,11.2200000,78.1700000,'namakkal_fort.jpg',4.5,'2026-08-07 09:33:28'),(18,18,'Government Botanical Garden','Garden','Famous botanical garden in Ooty.','Apr-Jun','08:00:00','18:30:00',50.00,11.4102000,76.6950000,'ooty_garden.jpg',4.8,'2026-08-07 09:33:28'),(19,19,'Ranjankudi Fort','Fort','Historic military fort.','Oct-Feb','09:00:00','17:00:00',20.00,11.2300000,78.8800000,'ranjankudi.jpg',4.3,'2026-08-07 09:33:28'),(20,20,'Sittannavasal Cave','Heritage','Ancient Jain cave paintings.','Nov-Feb','09:00:00','17:00:00',25.00,10.4600000,78.7300000,'sittannavasal.jpg',4.7,'2026-08-07 09:33:28'),(21,21,'Pamban Bridge','Bridge','India\'s first sea bridge connecting Rameswaram.','Oct-Mar','00:00:00','23:59:00',0.00,9.2876000,79.2066000,'pamban_bridge.jpg',4.8,'2026-08-07 09:33:28'),(22,21,'Ramanathaswamy Temple','Temple','Famous Jyotirlinga temple in Rameswaram.','Oct-Mar','05:00:00','21:00:00',50.00,9.2881000,79.3174000,'ramanathaswamy.jpg',5.0,'2026-08-07 09:33:28'),(23,22,'Arcot Fort','Fort','Historic fort built during the Carnatic period.','Nov-Feb','09:00:00','17:00:00',20.00,12.9050000,79.3200000,'arcot_fort.jpg',4.3,'2026-08-07 09:33:28'),(24,23,'Yercaud Lake','Hill Station','Beautiful lake surrounded by hills.','Oct-May','08:00:00','18:00:00',20.00,11.7753000,78.2090000,'yercaud_lake.jpg',4.7,'2026-08-07 09:33:28'),(25,23,'Pagoda Point','View Point','Scenic viewpoint overlooking Yercaud.','Oct-May','06:00:00','18:30:00',0.00,11.7890000,78.2050000,'pagoda_point.jpg',4.6,'2026-08-07 09:33:28'),(26,24,'Chettinad Palace','Heritage','Traditional Chettinad architecture.','Nov-Feb','09:00:00','17:00:00',30.00,10.1680000,78.7980000,'chettinad_palace.jpg',4.8,'2026-08-07 09:33:28'),(27,25,'Courtallam Main Falls','Waterfall','Popular medicinal waterfall.','Jun-Sep','06:00:00','18:00:00',10.00,8.9293000,77.2778000,'courtallam.jpg',4.8,'2026-08-07 09:33:28'),(28,25,'Old Courtallam Falls','Waterfall','Peaceful waterfall near Main Falls.','Jun-Sep','06:00:00','18:00:00',10.00,8.9310000,77.2790000,'old_courtallam.jpg',4.5,'2026-08-07 09:33:28'),(29,26,'Brihadeeswarar Temple','UNESCO Heritage','Great Living Chola Temple.','Oct-Mar','06:00:00','20:30:00',50.00,10.7828000,79.1318000,'big_temple.jpg',5.0,'2026-08-07 09:33:28'),(30,26,'Thanjavur Palace','Palace','Historic Maratha palace.','Oct-Mar','09:00:00','17:30:00',50.00,10.7865000,79.1388000,'thanjavur_palace.jpg',4.6,'2026-08-07 09:33:28'),(31,27,'Meghamalai','Hill Station','Beautiful mountain range and tea estates.','Sep-May','06:00:00','18:00:00',0.00,9.6820000,77.3950000,'meghamalai.jpg',4.9,'2026-08-07 09:33:28'),(32,27,'Suruli Falls','Waterfall','Famous waterfall near Cumbum.','Jul-Jan','08:00:00','17:30:00',20.00,9.6580000,77.2670000,'suruli_falls.jpg',4.6,'2026-08-07 09:33:28'),(33,28,'Tuticorin Port','Port','Major seaport of Tamil Nadu.','All Season','09:00:00','17:00:00',0.00,8.7642000,78.1348000,'tuticorin_port.jpg',4.4,'2026-08-07 09:33:28'),(34,28,'Our Lady of Snows Basilica','Church','Historic Roman Catholic church.','Nov-Feb','06:00:00','20:00:00',0.00,8.8055000,78.1475000,'snows_basilica.jpg',4.7,'2026-08-07 09:33:28'),(35,29,'Rockfort Temple','Temple','Historic hilltop temple.','Oct-Mar','06:00:00','20:00:00',30.00,10.8262000,78.6928000,'rockfort.jpg',4.8,'2026-08-07 09:33:28'),(36,29,'Srirangam Temple','Temple','Largest functioning Hindu temple.','Oct-Mar','06:00:00','21:00:00',20.00,10.8625000,78.6921000,'srirangam.jpg',5.0,'2026-08-07 09:33:28'),(37,30,'Nellaiappar Temple','Temple','Ancient temple with musical pillars.','Oct-Mar','05:30:00','20:30:00',20.00,8.7274000,77.6845000,'nellaiappar.jpg',4.9,'2026-08-07 09:33:28'),(38,31,'Yelagiri Hills','Hill Station','Popular weekend hill station.','Sep-May','06:00:00','18:00:00',0.00,12.5700000,78.6400000,'yelagiri.jpg',4.6,'2026-08-07 09:33:28'),(39,32,'Avinashi Temple','Temple','Historic Shiva temple.','Nov-Feb','06:00:00','20:00:00',10.00,11.1900000,77.2700000,'avinashi.jpg',4.5,'2026-08-07 09:33:28'),(40,33,'Pulicat Lake','Lake','Second largest brackish water lake in India.','Nov-Feb','06:00:00','18:00:00',0.00,13.4200000,80.3200000,'pulicat_lake.jpg',4.6,'2026-08-07 09:33:28'),(41,34,'Arunachaleswarar Temple','Temple','Famous Shiva temple in Tiruvannamalai.','Nov-Feb','05:00:00','21:00:00',20.00,12.2253000,79.0747000,'arunachaleswarar.jpg',5.0,'2026-08-07 09:33:28'),(42,34,'Ramana Ashram','Ashram','Spiritual centre founded by Ramana Maharshi.','All Season','08:00:00','18:00:00',0.00,12.2305000,79.0684000,'ramana_ashram.jpg',4.8,'2026-08-07 09:33:28'),(43,35,'Thyagaraja Temple','Temple','Famous temple dedicated to Lord Shiva.','Nov-Feb','06:00:00','20:00:00',10.00,10.7720000,79.6360000,'thyagaraja.jpg',4.6,'2026-08-07 09:33:28'),(44,36,'Vellore Fort','Fort','16th-century granite fort.','Oct-Mar','09:00:00','17:00:00',30.00,12.9165000,79.1325000,'vellore_fort.jpg',4.7,'2026-08-07 09:33:28'),(45,36,'Golden Temple','Temple','Sripuram Golden Temple.','All Season','08:00:00','20:00:00',0.00,12.8406000,79.1424000,'golden_temple.jpg',4.9,'2026-08-07 09:33:28'),(46,37,'Gingee Fort','Fort','Known as the Troy of the East.','Oct-Feb','09:00:00','17:00:00',30.00,12.2520000,79.4170000,'gingee_fort.jpg',4.8,'2026-08-07 09:33:28'),(47,37,'Pichavaram Mangrove Forest','Nature','Famous mangrove forest boating.','Nov-Feb','08:00:00','17:00:00',100.00,11.4300000,79.7900000,'pichavaram.jpg',4.8,'2026-08-07 09:33:28'),(48,38,'Srivilliputhur Andal Temple','Temple','Historic temple dedicated to Andal.','Nov-Feb','05:30:00','20:30:00',10.00,9.5125000,77.6340000,'andal_temple.jpg',4.9,'2026-08-07 09:33:28'),(49,38,'Ayyanar Falls','Waterfall','Scenic waterfall near Rajapalayam.','Jul-Jan','08:00:00','17:00:00',20.00,9.4560000,77.5550000,'ayyanar_falls.jpg',4.6,'2026-08-07 09:33:28'),(50,3,'Guindy National Park','Wildlife','Protected national park in Chennai.','Nov-Feb','09:00:00','17:30:00',30.00,13.0067000,80.2295000,'guindy_park.jpg',4.5,'2026-08-07 09:33:28');
/*!40000 ALTER TABLE `tourist_places` ENABLE KEYS */;
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
