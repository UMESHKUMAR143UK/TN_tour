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
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `district_id` int NOT NULL,
  `place_id` int DEFAULT NULL,
  `restaurant_name` varchar(150) NOT NULL,
  `cuisine_type` varchar(100) DEFAULT NULL,
  `address` text,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `average_cost` decimal(10,2) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`restaurant_id`),
  KEY `fk_restaurant_district` (`district_id`),
  KEY `fk_restaurant_place` (`place_id`),
  CONSTRAINT `fk_restaurant_district` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`),
  CONSTRAINT `fk_restaurant_place` FOREIGN KEY (`place_id`) REFERENCES `tourist_places` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,1,NULL,'Marina Food Court','South Indian','Marina Beach, Chennai','9876500001','info1@marinafood.com','www.marinafood.com','07:00:00','22:00:00',350.00,4.5,'marina_food.jpg','2026-08-07 15:21:19'),(2,2,NULL,'Kongu Delight','Kongu','Gandhipuram, Coimbatore','9876500002','info2@kongudelight.com','www.kongudelight.com','08:00:00','22:00:00',400.00,4.4,'kongu.jpg','2026-08-07 15:21:19'),(3,3,NULL,'Meenakshi Mess','South Indian','Madurai','9876500003','info3@meenakshimess.com','www.meenakshimess.com','06:30:00','22:00:00',300.00,4.6,'meenakshi.jpg','2026-08-07 15:21:19'),(4,4,NULL,'Yercaud Spice','Multi Cuisine','Salem','9876500004','info4@yercaudspice.com','www.yercaudspice.com','08:00:00','22:00:00',550.00,4.3,'yercaud.jpg','2026-08-07 15:21:19'),(5,5,NULL,'Rockfort Restaurant','South Indian','Trichy','9876500005','info5@rockfort.com','www.rockfort.com','07:00:00','22:30:00',450.00,4.4,'rockfort.jpg','2026-08-07 15:21:19'),(6,6,NULL,'Nellai Cafe','Tamil Cuisine','Tirunelveli','9876500006','info6@nellai.com','www.nellaicafe.com','07:00:00','22:00:00',320.00,4.5,'nellai.jpg','2026-08-07 15:21:19'),(7,7,NULL,'Golden Temple Foods','Vegetarian','Vellore','9876500007','info7@goldenfoods.com','www.goldenfoods.com','08:00:00','21:30:00',420.00,4.2,'golden.jpg','2026-08-07 15:21:19'),(8,8,NULL,'Bhavani Hotel','South Indian','Erode','9876500008','info8@bhavani.com','www.bhavanihotel.com','07:00:00','22:00:00',330.00,4.1,'bhavani.jpg','2026-08-07 15:21:19'),(9,9,NULL,'Temple View Restaurant','Vegetarian','Kanchipuram','9876500009','info9@templeview.com','www.templeview.com','07:00:00','22:00:00',350.00,4.4,'temple.jpg','2026-08-07 15:21:19'),(10,10,NULL,'Harbour Grill','Seafood','Thoothukudi','9876500010','info10@harbour.com','www.harbourgrill.com','10:00:00','23:00:00',650.00,4.6,'harbour.jpg','2026-08-07 15:21:19'),(11,11,NULL,'Kodai Family Restaurant','Multi Cuisine','Dindigul','9876500011','info11@kodai.com','www.kodai.com','08:00:00','22:00:00',500.00,4.3,'kodai.jpg','2026-08-07 15:21:19'),(12,12,NULL,'Temple City Foods','South Indian','Thanjavur','9876500012','info12@templecity.com','www.templecity.com','07:00:00','22:00:00',350.00,4.5,'thanjavur.jpg','2026-08-07 15:21:19'),(13,13,NULL,'Villupuram Cafe','Fast Food','Villupuram','9876500013','info13@villupuram.com','www.villupuram.com','09:00:00','22:00:00',280.00,4.0,'villupuram.jpg','2026-08-07 15:21:19'),(14,14,NULL,'Silver Beach Restaurant','Seafood','Cuddalore','9876500014','info14@silverbeach.com','www.silverbeach.com','10:00:00','23:00:00',700.00,4.5,'silver.jpg','2026-08-07 15:21:19'),(15,15,NULL,'Velankanni Veg','Vegetarian','Nagapattinam','9876500015','info15@velankanni.com','www.velankanni.com','07:00:00','22:00:00',300.00,4.4,'velankanni.jpg','2026-08-07 15:21:19'),(16,16,NULL,'Sunrise Restaurant','Multi Cuisine','Kanyakumari','9876500016','info16@sunrise.com','www.sunrise.com','07:00:00','22:30:00',600.00,4.7,'sunrise.jpg','2026-08-07 15:21:19'),(17,17,NULL,'Karur Spice','South Indian','Karur','9876500017','info17@karur.com','www.karur.com','08:00:00','22:00:00',350.00,4.2,'karur.jpg','2026-08-07 15:21:19'),(18,18,NULL,'Namakkal Mess','Tamil Cuisine','Namakkal','9876500018','info18@namakkal.com','www.namakkal.com','07:00:00','22:00:00',300.00,4.3,'namakkal.jpg','2026-08-07 15:21:19'),(19,19,NULL,'Krishnagiri Foods','South Indian','Krishnagiri','9876500019','info19@krishnagiri.com','www.krishnagiri.com','07:30:00','22:00:00',340.00,4.2,'krishnagiri.jpg','2026-08-07 15:21:19'),(20,20,NULL,'Hogenakkal View','Multi Cuisine','Dharmapuri','9876500020','info20@hogenakkal.com','www.hogenakkal.com','08:00:00','22:00:00',500.00,4.5,'hogenakkal.jpg','2026-08-07 15:21:19'),(21,21,NULL,'Rameswaram Sea Foods','Seafood','Ramanathapuram','9876500021','info21@rameswaram.com','www.rameswaram.com','10:00:00','22:30:00',750.00,4.8,'rameswaram.jpg','2026-08-07 15:21:19'),(22,22,NULL,'Sivagangai Cafe','South Indian','Sivagangai','9876500022','info22@sivagangai.com','www.sivagangai.com','07:00:00','22:00:00',320.00,4.2,'sivagangai.jpg','2026-08-07 15:21:19'),(23,23,NULL,'Srivilliputhur Sweets','Snacks','Virudhunagar','9876500023','info23@sweets.com','www.sweets.com','08:00:00','21:00:00',250.00,4.6,'sweets.jpg','2026-08-07 15:21:19'),(24,24,NULL,'Chola Restaurant','South Indian','Ariyalur','9876500024','info24@chola.com','www.chola.com','07:00:00','22:00:00',330.00,4.3,'chola.jpg','2026-08-07 15:21:19'),(25,25,NULL,'Perambalur Food Point','Fast Food','Perambalur','9876500025','info25@foodpoint.com','www.foodpoint.com','09:00:00','22:00:00',280.00,4.1,'foodpoint.jpg','2026-08-07 15:21:19'),(26,26,NULL,'Sithannavasal Inn','Multi Cuisine','Pudukkottai','9876500026','info26@sithan.com','www.sithan.com','08:00:00','22:00:00',450.00,4.3,'sithan.jpg','2026-08-07 15:21:19'),(27,27,NULL,'Courtallam Restaurant','South Indian','Tenkasi','9876500027','info27@courtallam.com','www.courtallam.com','07:00:00','22:00:00',380.00,4.5,'courtallam.jpg','2026-08-07 15:21:19'),(28,28,NULL,'Ooty Hills Restaurant','Multi Cuisine','Nilgiris','9876500028','info28@ooty.com','www.ooty.com','08:00:00','22:00:00',650.00,4.7,'ooty.jpg','2026-08-07 15:21:19'),(29,29,NULL,'Mayiladuthurai Cafe','South Indian','Mayiladuthurai','9876500029','info29@mayil.com','www.mayil.com','07:00:00','22:00:00',320.00,4.2,'mayil.jpg','2026-08-07 15:21:19'),(30,30,NULL,'Thiruvarur Delight','Vegetarian','Thiruvarur','9876500030','info30@thiru.com','www.thiru.com','07:00:00','22:00:00',350.00,4.3,'thiru.jpg','2026-08-07 15:21:19'),(31,31,NULL,'Ranipet Family Restaurant','Multi Cuisine','Ranipet','9876500031','info31@ranipet.com','www.ranipet.com','08:00:00','22:00:00',450.00,4.2,'ranipet.jpg','2026-08-07 15:21:19'),(32,32,NULL,'Yelagiri View','Multi Cuisine','Tirupattur','9876500032','info32@yelagiri.com','www.yelagiri.com','08:00:00','22:00:00',550.00,4.4,'yelagiri.jpg','2026-08-07 15:21:19'),(33,33,NULL,'Annamalai Foods','Vegetarian','Tiruvannamalai','9876500033','info33@annamalai.com','www.annamalai.com','07:00:00','22:00:00',340.00,4.5,'annamalai.jpg','2026-08-07 15:21:19'),(34,34,NULL,'Kallakurichi Hotel','South Indian','Kallakurichi','9876500034','info34@kallakurichi.com','www.kallakurichi.com','07:00:00','22:00:00',330.00,4.2,'kallakurichi.jpg','2026-08-07 15:21:19'),(35,35,NULL,'Mahabalipuram Sea View','Seafood','Chengalpattu','9876500035','info35@seaview.com','www.seaview.com','10:00:00','23:00:00',800.00,4.8,'seaview.jpg','2026-08-07 15:21:19'),(36,36,NULL,'Poondi Restaurant','South Indian','Tiruvallur','9876500036','info36@poondi.com','www.poondi.com','07:00:00','22:00:00',320.00,4.1,'poondi.jpg','2026-08-07 15:21:19'),(37,37,NULL,'Tiruppur Cafe','Fast Food','Tiruppur','9876500037','info37@tiruppur.com','www.tiruppur.com','08:00:00','22:00:00',300.00,4.2,'tiruppur.jpg','2026-08-07 15:21:19'),(38,38,NULL,'Hosur Garden Restaurant','Multi Cuisine','Hosur','9876500038','info38@hosur.com','www.hosur.com','08:00:00','22:00:00',480.00,4.3,'hosur.jpg','2026-08-07 15:21:19'),(39,1,NULL,'Chennai Dosa House','South Indian','T Nagar, Chennai','9876500039','info39@dosa.com','www.dosa.com','06:30:00','22:30:00',250.00,4.6,'dosa.jpg','2026-08-07 15:21:19'),(40,2,NULL,'Coimbatore Grill','Barbecue','RS Puram','9876500040','info40@grill.com','www.grill.com','11:00:00','23:00:00',850.00,4.5,'grill.jpg','2026-08-07 15:21:19'),(41,3,NULL,'Madurai Biryani','Biryani','Madurai','9876500041','info41@biryani.com','www.biryani.com','11:00:00','23:00:00',450.00,4.8,'biryani.jpg','2026-08-07 15:21:19'),(42,4,NULL,'Salem Veg Plaza','Vegetarian','Salem','9876500042','info42@vegplaza.com','www.vegplaza.com','07:00:00','22:00:00',320.00,4.2,'vegplaza.jpg','2026-08-07 15:21:19'),(43,5,NULL,'Trichy Food Corner','Chinese','Trichy','9876500043','info43@foodcorner.com','www.foodcorner.com','10:00:00','22:30:00',500.00,4.3,'foodcorner.jpg','2026-08-07 15:21:19'),(44,6,NULL,'Nellai Restaurant','South Indian','Tirunelveli','9876500044','info44@nellairest.com','www.nellairest.com','07:00:00','22:00:00',330.00,4.4,'nellairest.jpg','2026-08-07 15:21:19'),(45,7,NULL,'Vellore Family Restaurant','North Indian','Vellore','9876500045','info45@vellore.com','www.vellore.com','08:00:00','22:00:00',600.00,4.4,'vellore.jpg','2026-08-07 15:21:19'),(46,8,NULL,'Erode Spice','Chettinad','Erode','9876500046','info46@erode.com','www.erode.com','11:00:00','23:00:00',550.00,4.5,'erode.jpg','2026-08-07 15:21:19'),(47,9,NULL,'Kanchi Veg Meals','Vegetarian','Kanchipuram','9876500047','info47@kanchi.com','www.kanchi.com','07:00:00','21:30:00',280.00,4.3,'kanchi.jpg','2026-08-07 15:21:19'),(48,10,NULL,'Thoothukudi Seafood House','Seafood','Thoothukudi','9876500048','info48@seafood.com','www.seafood.com','10:00:00','23:00:00',780.00,4.7,'seafood.jpg','2026-08-07 15:21:19'),(49,11,NULL,'Dindigul Thalappakatti','Biryani','Dindigul','9876500049','info49@thalappakatti.com','www.thalappakatti.com','11:00:00','23:00:00',600.00,4.9,'thalappakatti.jpg','2026-08-07 15:21:19'),(50,12,NULL,'Thanjavur Heritage Restaurant','Traditional Tamil','Thanjavur','9876500050','info50@heritage.com','www.heritage.com','07:00:00','22:00:00',450.00,4.6,'heritage.jpg','2026-08-07 15:21:19');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
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
