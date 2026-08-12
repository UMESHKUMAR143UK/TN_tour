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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin User','admin@tntours.com','9876543210','admin123','admin.jpg','Active','2026-08-01 03:30:00'),(2,2,'Arun Kumar','arun1@gmail.com','9876543211','user123','user1.jpg','Active','2026-08-01 03:40:00'),(3,2,'Priya Devi','priya2@gmail.com','9876543212','user123','user2.jpg','Active','2026-08-01 03:50:00'),(4,2,'Karthik Raj','karthik3@gmail.com','9876543213','user123','user3.jpg','Active','2026-08-01 04:00:00'),(5,2,'Divya Sri','divya4@gmail.com','9876543214','user123','user4.jpg','Active','2026-08-01 04:10:00'),(6,2,'Vignesh Kumar','vignesh5@gmail.com','9876543215','user123','user5.jpg','Active','2026-08-01 04:20:00'),(7,2,'Nandhini','nandhini6@gmail.com','9876543216','user123','user6.jpg','Active','2026-08-01 04:30:00'),(8,2,'Surya Prakash','surya7@gmail.com','9876543217','user123','user7.jpg','Active','2026-08-01 04:40:00'),(9,2,'Harini','harini8@gmail.com','9876543218','user123','user8.jpg','Active','2026-08-01 04:50:00'),(10,2,'Ramesh','ramesh9@gmail.com','9876543219','user123','user9.jpg','Active','2026-08-01 05:00:00'),(11,2,'Sathish','sathish10@gmail.com','9876543220','user123','user10.jpg','Active','2026-08-01 05:10:00'),(12,2,'Keerthana','keerthana11@gmail.com','9876543221','user123','user11.jpg','Active','2026-08-01 05:20:00'),(13,2,'Manoj','manoj12@gmail.com','9876543222','user123','user12.jpg','Active','2026-08-01 05:30:00'),(14,2,'Anitha','anitha13@gmail.com','9876543223','user123','user13.jpg','Active','2026-08-01 05:40:00'),(15,2,'Rahul','rahul14@gmail.com','9876543224','user123','user14.jpg','Active','2026-08-01 05:50:00'),(16,2,'Lakshmi','lakshmi15@gmail.com','9876543225','user123','user15.jpg','Active','2026-08-01 06:00:00'),(17,2,'Gokul','gokul16@gmail.com','9876543226','user123','user16.jpg','Active','2026-08-01 06:10:00'),(18,2,'Meena','meena17@gmail.com','9876543227','user123','user17.jpg','Active','2026-08-01 06:20:00'),(19,2,'Ajith','ajith18@gmail.com','9876543228','user123','user18.jpg','Active','2026-08-01 06:30:00'),(20,2,'Shalini','shalini19@gmail.com','9876543229','user123','user19.jpg','Active','2026-08-01 06:40:00'),(21,2,'Praveen','praveen20@gmail.com','9876543230','user123','user20.jpg','Active','2026-08-01 06:50:00'),(22,2,'Deepa','deepa21@gmail.com','9876543231','user123','user21.jpg','Active','2026-08-01 07:00:00'),(23,2,'Suresh','suresh22@gmail.com','9876543232','user123','user22.jpg','Active','2026-08-01 07:10:00'),(24,2,'Kavitha','kavitha23@gmail.com','9876543233','user123','user23.jpg','Active','2026-08-01 07:20:00'),(25,2,'Aravind','aravind24@gmail.com','9876543234','user123','user24.jpg','Active','2026-08-01 07:30:00'),(26,2,'Bhavani','bhavani25@gmail.com','9876543235','user123','user25.jpg','Active','2026-08-01 07:40:00'),(27,2,'Santhosh','santhosh26@gmail.com','9876543236','user123','user26.jpg','Active','2026-08-01 07:50:00'),(28,2,'Revathi','revathi27@gmail.com','9876543237','user123','user27.jpg','Active','2026-08-01 08:00:00'),(29,2,'Naveen','naveen28@gmail.com','9876543238','user123','user28.jpg','Active','2026-08-01 08:10:00'),(30,2,'Janani','janani29@gmail.com','9876543239','user123','user29.jpg','Active','2026-08-01 08:20:00'),(31,2,'Dinesh','dinesh30@gmail.com','9876543240','user123','user30.jpg','Active','2026-08-01 08:30:00'),(32,2,'Monisha','monisha31@gmail.com','9876543241','user123','user31.jpg','Active','2026-08-01 08:40:00'),(33,2,'Hari','hari32@gmail.com','9876543242','user123','user32.jpg','Active','2026-08-01 08:50:00'),(34,2,'Swathi','swathi33@gmail.com','9876543243','user123','user33.jpg','Active','2026-08-01 09:00:00'),(35,2,'Mohan','mohan34@gmail.com','9876543244','user123','user34.jpg','Active','2026-08-01 09:10:00'),(36,2,'Pavithra','pavithra35@gmail.com','9876543245','user123','user35.jpg','Active','2026-08-01 09:20:00'),(37,2,'Kishore','kishore36@gmail.com','9876543246','user123','user36.jpg','Active','2026-08-01 09:30:00'),(38,2,'Aishwarya','aish37@gmail.com','9876543247','user123','user37.jpg','Active','2026-08-01 09:40:00'),(39,2,'Vasanth','vasanth38@gmail.com','9876543248','user123','user38.jpg','Active','2026-08-01 09:50:00'),(40,2,'Sneha','sneha39@gmail.com','9876543249','user123','user39.jpg','Active','2026-08-01 10:00:00'),(41,2,'Yuvaraj','yuvaraj40@gmail.com','9876543250','user123','user40.jpg','Active','2026-08-01 10:10:00'),(42,2,'Hemalatha','hema41@gmail.com','9876543251','user123','user41.jpg','Active','2026-08-01 10:20:00'),(43,2,'Rohit','rohit42@gmail.com','9876543252','user123','user42.jpg','Active','2026-08-01 10:30:00'),(44,2,'Nisha','nisha43@gmail.com','9876543253','user123','user43.jpg','Active','2026-08-01 10:40:00'),(45,2,'Balaji','balaji44@gmail.com','9876543254','user123','user44.jpg','Active','2026-08-01 10:50:00'),(46,2,'Gayathri','gayathri45@gmail.com','9876543255','user123','user45.jpg','Active','2026-08-01 11:00:00'),(47,2,'Prakash','prakash46@gmail.com','9876543256','user123','user46.jpg','Active','2026-08-01 11:10:00'),(48,2,'Sindhu','sindhu47@gmail.com','9876543257','user123','user47.jpg','Active','2026-08-01 11:20:00'),(49,2,'Vinoth','vinoth48@gmail.com','9876543258','user123','user48.jpg','Active','2026-08-01 11:30:00'),(50,2,'Abinaya','abinaya49@gmail.com','9876543259','user123','user49.jpg','Active','2026-08-01 11:40:00'),(51,2,'Kavin','kavin50@gmail.com','9876543260','user123','user50.jpg','Active','2026-08-01 11:50:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-08  1:13:51
