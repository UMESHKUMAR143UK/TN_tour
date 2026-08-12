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
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `district_id` int NOT NULL,
  `place_id` int DEFAULT NULL,
  `image_title` varchar(150) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `description` text,
  KEY `fk_gallery_district` (`district_id`),
  KEY `fk_gallery_place` (`place_id`),
  CONSTRAINT `fk_gallery_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `fk_gallery_place` FOREIGN KEY (`place_id`) REFERENCES `tourist_places` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,NULL,'Marina Beach','images/marina_beach.jpg','Beautiful sunrise view of Marina Beach.'),(1,NULL,'Kapaleeshwarar Temple','images/kapaleeshwarar_temple.jpg','Historic temple in Chennai.'),(2,NULL,'Marudhamalai Temple','images/marudhamalai_temple.jpg','Famous hill temple in Coimbatore.'),(2,NULL,'VOC Park','images/voc_park.jpg','Popular park in Coimbatore.'),(3,NULL,'Meenakshi Amman Temple','images/meenakshi_temple.jpg','World-famous temple in Madurai.'),(3,NULL,'Thirumalai Nayakkar Palace','images/nayakkar_palace.jpg','Historic palace in Madurai.'),(4,NULL,'Yercaud Lake','images/yercaud_lake.jpg','Scenic lake in Salem district.'),(4,NULL,'Pagoda Point','images/pagoda_point.jpg','Popular viewpoint in Yercaud.'),(5,NULL,'Rock Fort Temple','images/rockfort.jpg','Historic temple in Tiruchirappalli.'),(5,NULL,'Srirangam Temple','images/srirangam.jpg','Largest functioning Hindu temple.'),(6,NULL,'Nellaiappar Temple','images/nellaiappar.jpg','Ancient temple in Tirunelveli.'),(6,NULL,'Manimuthar Falls','images/manimuthar_falls.jpg','Beautiful waterfall.'),(7,NULL,'Vellore Fort','images/vellore_fort.jpg','Historic granite fort.'),(7,NULL,'Golden Temple','images/golden_temple.jpg','Sripuram Golden Temple.'),(8,NULL,'Kodiveri Dam','images/kodiveri_dam.jpg','Popular tourist attraction.'),(8,NULL,'Bhavani Temple','images/bhavani_temple.jpg','Temple at river confluence.'),(9,NULL,'Kailasanathar Temple','images/kailasanathar.jpg','Ancient Pallava temple.'),(9,NULL,'Ekambareswarar Temple','images/ekambareswarar.jpg','Famous Shiva temple.'),(10,NULL,'Thoothukudi Harbour','images/harbour.jpg','Major seaport of Tamil Nadu.'),(10,NULL,'Our Lady of Snows Basilica','images/snows_basilica.jpg','Historic church in Thoothukudi.'),(11,NULL,'Kodaikanal Lake','images/kodaikanal_lake.jpg','Beautiful lake in Kodaikanal.'),(11,NULL,'Pillar Rocks','images/pillar_rocks.jpg','Scenic viewpoint in Kodaikanal.'),(12,NULL,'Brihadeeswarar Temple','images/brihadeeswarar.jpg','UNESCO World Heritage temple.'),(12,NULL,'Thanjavur Palace','images/thanjavur_palace.jpg','Historic palace complex.'),(13,NULL,'Gingee Fort','images/gingee_fort.jpg','Historic hill fort.'),(13,NULL,'Mailam Temple','images/mailam_temple.jpg','Popular Murugan temple.'),(14,NULL,'Silver Beach','images/silver_beach.jpg','Longest beach in Tamil Nadu.'),(14,NULL,'Fort St. David','images/fort_st_david.jpg','Historic British fort.'),(15,NULL,'Velankanni Basilica','images/velankanni.jpg','Famous Christian pilgrimage site.'),(15,NULL,'Nagore Dargah','images/nagore_dargah.jpg','Renowned Islamic shrine.'),(16,NULL,'Vivekananda Rock Memorial','images/vivekananda_rock.jpg','Iconic memorial at Kanyakumari.'),(16,NULL,'Thiruvalluvar Statue','images/thiruvalluvar.jpg','133-foot stone statue.'),(17,NULL,'Pasupatheeswarar Temple','images/pasupatheeswarar.jpg','Ancient temple in Karur.'),(17,NULL,'Amaravathi Dam','images/amaravathi_dam.jpg','Beautiful dam and reservoir.'),(18,NULL,'Namakkal Fort','images/namakkal_fort.jpg','Historic hill fort.'),(18,NULL,'Anjaneyar Temple','images/anjaneyar.jpg','Famous Hanuman temple.'),(19,NULL,'Krishnagiri Dam','images/krishnagiri_dam.jpg','Popular tourist attraction.'),(19,NULL,'Rayakottai Fort','images/rayakottai.jpg','Historic fort on a hill.'),(20,NULL,'Hogenakkal Falls','images/hogenakkal.jpg','Niagara of India.'),(20,NULL,'Theerthamalai Temple','images/theerthamalai.jpg','Ancient hill temple.'),(21,NULL,'Ramanathaswamy Temple','images/rameswaram_temple.jpg','Sacred Jyotirlinga temple.'),(21,NULL,'Pamban Bridge','images/pamban_bridge.jpg','India\'s famous sea bridge.'),(22,NULL,'Chettinad Palace','images/chettinad_palace.jpg','Traditional Chettinad mansion.'),(22,NULL,'Pillayarpatti Temple','images/pillayarpatti.jpg','Ancient cave temple.'),(23,NULL,'Srivilliputhur Temple','images/srivilliputhur.jpg','Temple featured in Tamil Nadu emblem.'),(23,NULL,'Ayyanar Falls','images/ayyanar_falls.jpg','Scenic waterfall near Rajapalayam.'),(24,NULL,'Gangaikonda Cholapuram','images/gangaikonda.jpg','UNESCO World Heritage temple.'),(24,NULL,'Karaivetti Bird Sanctuary','images/karaivetti.jpg','Bird sanctuary in Ariyalur.'),(25,NULL,'Ranjankudi Fort','images/ranjankudi.jpg','Historic fort in Perambalur.'),(25,NULL,'Sathanur Dam Park','images/sathanur_park.jpg','Popular family picnic destination.');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
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
