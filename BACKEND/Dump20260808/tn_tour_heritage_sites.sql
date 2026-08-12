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
-- Table structure for table `heritage_sites`
--

DROP TABLE IF EXISTS `heritage_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heritage_sites` (
  `heritage_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `place_id` int NOT NULL,
  `heritage_name` varchar(150) NOT NULL,
  `heritage_type` varchar(100) DEFAULT NULL,
  `unesco_status` varchar(50) DEFAULT NULL,
  `built_year` varchar(50) DEFAULT NULL,
  `dynasty` varchar(100) DEFAULT NULL,
  `history` text,
  `image` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`heritage_id`),
  KEY `fk_heritage_district` (`district_id`),
  KEY `fk_heritage_place` (`place_id`),
  CONSTRAINT `fk_heritage_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `fk_heritage_place` FOREIGN KEY (`place_id`) REFERENCES `tourist_places` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heritage_sites`
--

LOCK TABLES `heritage_sites` WRITE;
/*!40000 ALTER TABLE `heritage_sites` DISABLE KEYS */;
INSERT INTO `heritage_sites` VALUES (51,1,1,'Gangaikonda Cholapuram Temple','Temple','UNESCO','1035 AD','Chola','Built by Rajendra Chola I.','gangaikonda.jpg',11.2075000,79.4533000,'2026-08-07 09:46:08'),(52,2,2,'Shore Temple','Temple','UNESCO','700 AD','Pallava','Ancient Shore Temple at Mahabalipuram.','shore_temple.jpg',12.6208000,80.1931000,'2026-08-07 09:46:08'),(53,3,3,'Fort St. George','Fort','No','1644','British','First English fortress in India.','fort_st_george.jpg',13.0827000,80.2870000,'2026-08-07 09:46:08'),(54,4,4,'Marudamalai Temple','Temple','No','1200 AD','Pandya','Ancient Murugan temple.','marudamalai.jpg',11.0456000,76.8615000,'2026-08-07 09:46:08'),(55,5,5,'Fort St. David','Fort','No','1690','British','Historic colonial fort.','fort_st_david.jpg',11.7430000,79.7680000,'2026-08-07 09:46:08'),(56,6,6,'Adhiyamankottai Fort','Fort','No','1300 AD','Adhiyaman','Historic hill fort.','adhiyaman.jpg',12.1277000,78.1570000,'2026-08-07 09:46:08'),(57,7,7,'Dindigul Fort','Fort','No','1605','Nayak','Historic granite hill fort.','dindigul_fort.jpg',10.3673000,77.9803000,'2026-08-07 09:46:08'),(58,8,8,'Bhavani Temple','Temple','No','900 AD','Chola','Temple at river confluence.','bhavani.jpg',11.4450000,77.6820000,'2026-08-07 09:46:08'),(59,9,9,'Kalvarayan Hills Heritage','Hill','No','Ancient','Tribal','Traditional tribal heritage.','kalvarayan.jpg',11.6500000,78.9500000,'2026-08-07 09:46:08'),(60,10,10,'Ekambareswarar Temple','Temple','No','600 AD','Pallava','One of Pancha Bhoota temples.','ekambareswarar.jpg',12.8342000,79.7036000,'2026-08-07 09:46:08'),(61,11,11,'Vivekananda Rock Memorial','Monument','No','1970','Modern','Built in memory of Swami Vivekananda.','vivekananda.jpg',8.0780000,77.5540000,'2026-08-07 09:46:08'),(62,12,12,'Pasupathieswarar Temple','Temple','No','800 AD','Chola','Historic Shiva temple.','pasupathi.jpg',10.9577000,78.0809000,'2026-08-07 09:46:08'),(63,13,13,'Krishnagiri Fort','Fort','No','1600 AD','Vijayanagara','Historic military fort.','krishnagiri.jpg',12.5300000,78.2200000,'2026-08-07 09:46:08'),(64,14,14,'Meenakshi Amman Temple','Temple','No','1600 AD','Nayak','Iconic temple of Madurai.','meenakshi.jpg',9.9195000,78.1193000,'2026-08-07 09:46:08'),(65,15,15,'Mayuranathaswamy Temple','Temple','No','900 AD','Chola','Ancient Shiva temple.','mayuranathar.jpg',11.1000000,79.6500000,'2026-08-07 09:46:08'),(66,16,16,'Velankanni Basilica','Church','No','1771','Portuguese','World-famous pilgrimage church.','velankanni.jpg',10.6825000,79.8528000,'2026-08-07 09:46:08'),(67,17,17,'Namakkal Fort','Fort','No','1500 AD','Nayak','Historic hill fort.','namakkal_fort.jpg',11.2200000,78.1700000,'2026-08-07 09:46:08'),(68,18,18,'Stone House Ooty','Colonial Building','No','1822','British','First bungalow in Ooty.','stone_house.jpg',11.4120000,76.7030000,'2026-08-07 09:46:08'),(69,19,19,'Ranjankudi Fort','Fort','No','1600 AD','Nawab','Military fort.','ranjankudi.jpg',11.2300000,78.8800000,'2026-08-07 09:46:08'),(70,20,20,'Sittannavasal Cave','Jain Cave','No','700 AD','Pandya','Ancient Jain cave paintings.','sittannavasal.jpg',10.4600000,78.7300000,'2026-08-07 09:46:08'),(71,21,21,'Pamban Bridge','Bridge','No','1914','British','Historic railway bridge.','pamban.jpg',9.2876000,79.2066000,'2026-08-07 09:46:08'),(72,21,22,'Ramanathaswamy Temple','Temple','No','1200 AD','Pandya','Sacred temple of Rameswaram.','rameswaram.jpg',9.2881000,79.3174000,'2026-08-07 09:46:08'),(73,22,23,'Arcot Fort','Fort','No','1700 AD','Nawab','Historic Arcot fort.','arcot.jpg',12.9050000,79.3200000,'2026-08-07 09:46:08'),(74,23,24,'Yercaud Heritage','Hill Station','No','1800 AD','British','Historic hill station.','yercaud.jpg',11.7753000,78.2090000,'2026-08-07 09:46:08'),(75,24,26,'Chettinad Palace','Palace','No','1902','Chettiar','Traditional Chettinad mansion.','chettinad.jpg',10.1680000,78.7980000,'2026-08-07 09:46:08'),(76,25,27,'Courtallam Heritage','Waterfall','No','Ancient','Pandya','Historic tourist waterfall.','courtallam.jpg',8.9293000,77.2778000,'2026-08-07 09:46:08'),(77,26,29,'Brihadeeswarar Temple','Temple','UNESCO','1010 AD','Chola','Great Living Chola Temple.','big_temple.jpg',10.7828000,79.1318000,'2026-08-07 09:46:08'),(78,26,30,'Thanjavur Palace','Palace','No','1550 AD','Nayak','Royal palace complex.','palace.jpg',10.7865000,79.1388000,'2026-08-07 09:46:08'),(79,27,31,'Meghamalai Heritage','Hill Station','No','Ancient','Local','Tea estate region.','meghamalai.jpg',9.6820000,77.3950000,'2026-08-07 09:46:08'),(80,28,33,'Tuticorin Port Heritage','Port','No','1866','British','Historic seaport.','port.jpg',8.7642000,78.1348000,'2026-08-07 09:46:08'),(81,29,35,'Rockfort Temple','Temple','No','580 AD','Pallava','Rock-cut temple.','rockfort.jpg',10.8262000,78.6928000,'2026-08-07 09:46:08'),(82,29,36,'Srirangam Temple','Temple','No','1000 AD','Chola','Largest functioning Hindu temple.','srirangam.jpg',10.8625000,78.6921000,'2026-08-07 09:46:08'),(83,30,37,'Nellaiappar Temple','Temple','No','700 AD','Pandya','Ancient twin temple.','nellaiappar.jpg',8.7274000,77.6845000,'2026-08-07 09:46:08'),(84,31,38,'Yelagiri Heritage','Hill Station','No','Ancient','Local','Historic hill region.','yelagiri.jpg',12.5700000,78.6400000,'2026-08-07 09:46:08'),(85,32,39,'Avinashi Temple','Temple','No','900 AD','Chola','Ancient Shiva temple.','avinashi.jpg',11.1900000,77.2700000,'2026-08-07 09:46:08'),(86,33,40,'Pulicat Heritage','Lake','No','Ancient','Dutch','Historic trading port.','pulicat.jpg',13.4200000,80.3200000,'2026-08-07 09:46:08'),(87,34,41,'Arunachaleswarar Temple','Temple','No','900 AD','Chola','Sacred temple of Arunachala.','arunachala.jpg',12.2253000,79.0747000,'2026-08-07 09:46:08'),(88,34,42,'Ramana Ashram','Ashram','No','1922','Modern','Spiritual center.','ramana.jpg',12.2305000,79.0684000,'2026-08-07 09:46:08'),(89,35,43,'Thyagaraja Temple','Temple','No','800 AD','Chola','Historic Shiva temple.','thyagaraja.jpg',10.7720000,79.6360000,'2026-08-07 09:46:08'),(90,36,44,'Vellore Fort','Fort','No','1566','Vijayanagara','Massive granite fort.','vellore.jpg',12.9165000,79.1325000,'2026-08-07 09:46:08'),(91,36,45,'Golden Temple','Temple','No','2007','Modern','Golden temple at Sripuram.','golden.jpg',12.8406000,79.1424000,'2026-08-07 09:46:08'),(92,37,46,'Gingee Fort','Fort','No','1200 AD','Chola','Known as the Troy of the East.','gingee.jpg',12.2520000,79.4170000,'2026-08-07 09:46:08'),(93,37,47,'Pichavaram Mangroves','Nature','No','Ancient','Natural','Famous mangrove ecosystem.','pichavaram.jpg',11.4300000,79.7900000,'2026-08-07 09:46:08'),(94,38,48,'Srivilliputhur Temple','Temple','No','800 AD','Pandya','Temple dedicated to Andal.','andal.jpg',9.5125000,77.6340000,'2026-08-07 09:46:08'),(95,38,49,'Ayyanar Falls','Waterfall','No','Ancient','Natural','Scenic waterfall.','ayyanar.jpg',9.4560000,77.5550000,'2026-08-07 09:46:08'),(96,3,50,'Guindy National Park','National Park','No','1976','Government','Protected urban national park.','guindy.jpg',13.0067000,80.2295000,'2026-08-07 09:46:08'),(97,14,14,'Thirumalai Nayakkar Palace','Palace','No','1636','Nayak','Historic royal palace.','nayakkar.jpg',9.9170000,78.1230000,'2026-08-07 09:46:08'),(98,3,28,'Government Museum Chennai','Museum','No','1851','British','One of Indias oldest museums.','museum.jpg',13.0715000,80.2560000,'2026-08-07 09:46:08'),(99,10,32,'Kailasanathar Temple','Temple','No','685 AD','Pallava','Ancient sandstone temple.','kailasanathar.jpg',12.8390000,79.6990000,'2026-08-07 09:46:08'),(100,26,34,'Saraswathi Mahal Library','Library','No','1700 AD','Maratha','Historic royal library.','library.jpg',10.7860000,79.1370000,'2026-08-07 09:46:08');
/*!40000 ALTER TABLE `heritage_sites` ENABLE KEYS */;
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
