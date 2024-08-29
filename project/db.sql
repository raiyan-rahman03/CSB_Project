-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: hackathon
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_email_03be32b2` (`email`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'rakeyasultana0172@gmail.com',0,0,2),(2,'mdraiyanrahman03@gmail.com',1,1,2),(3,'oncologist001@example.com',0,1,4),(4,'cardiologist002@example.com',0,1,5),(5,'neurologist003@example.com',0,1,6),(6,'nephrologist004@example.com',0,1,7),(7,'ophthalmologist005@example.com',0,1,8),(8,'dermatologist007@example.com',0,1,9),(9,'orthopedic_surgeon008@example.com',0,1,10),(10,'pediatrician009@example.com',0,1,11),(11,'psychiatrist010@example.com',0,1,12),(12,'endocrinologist011@example.com',0,1,13),(13,'pulmonologist012@example.com',0,1,14),(14,'ent013@example.com',0,1,15),(15,'vascular_surgeon014@example.com',0,1,16),(16,'rheumatologist015@example.com',0,1,17),(17,'gastroenterologist016@example.com',0,1,18),(18,'hematologist017@example.com',0,1,19),(19,'urologist018@example.com',0,1,20);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_appointment`
--

DROP TABLE IF EXISTS `api_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_appointment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appointment_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `doctor_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `apointment_time` time(6) DEFAULT NULL,
  `join_link` varchar(200) DEFAULT NULL,
  `meeting_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_appointment_doctor_id_aed3bb72_fk_auth_user_id` (`doctor_id`),
  KEY `Api_appoint_patient_6a0eb8_idx` (`patient_id`,`doctor_id`,`appointment_date`),
  CONSTRAINT `Api_appointment_doctor_id_aed3bb72_fk_auth_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `Api_appointment_patient_id_eaa478c2_fk_auth_user_id` FOREIGN KEY (`patient_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_appointment`
--

LOCK TABLES `api_appointment` WRITE;
/*!40000 ALTER TABLE `api_appointment` DISABLE KEYS */;
INSERT INTO `api_appointment` VALUES (1,'2024-07-19','completed',2,1,'12:00:00.000000',NULL,NULL),(2,'2024-08-22','confirmed',3,1,'12:00:00.000000','https://zoom.us/j/zoom_meeting_id_example','zoom_meeting_id_example'),(3,'2024-08-23','accepted',3,1,'18:00:00.000000',NULL,NULL),(4,'2024-08-26','accepted',3,1,'23:00:00.000000',NULL,NULL),(5,'2024-08-27','accepted',3,1,'23:00:00.000000',NULL,NULL);
/*!40000 ALTER TABLE `api_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_labreport`
--

DROP TABLE IF EXISTS `api_labreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_labreport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report_data` json NOT NULL,
  `report_date` date NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `hospital_address` longtext,
  `ocr_conf` longtext,
  `sample` varchar(200) DEFAULT NULL,
  `test_name_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_labreport_user_id_5f5e31bf_fk_auth_user_id` (`user_id`),
  KEY `Api_labreport_test_name_id_0cd91312_fk_Api_test_id` (`test_name_id`),
  CONSTRAINT `Api_labreport_test_name_id_0cd91312_fk_Api_test_id` FOREIGN KEY (`test_name_id`) REFERENCES `api_test` (`id`),
  CONSTRAINT `Api_labreport_user_id_5f5e31bf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_labreport`
--

LOCK TABLES `api_labreport` WRITE;
/*!40000 ALTER TABLE `api_labreport` DISABLE KEYS */;
INSERT INTO `api_labreport` VALUES (1,'\"```json\\n[\\n  {\\n    \\\"description\\\": \\\"Haemoglobin\\\",\\n    \\\"result\\\": \\\"15\\\",\\n    \\\"ref_range\\\": \\\"13-17\\\",\\n    \\\"unit\\\": \\\"g/dL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Total Leucocyte Count\\\",\\n    \\\"result\\\": \\\"5000\\\",\\n    \\\"ref_range\\\": \\\"4000-10000\\\",\\n    \\\"unit\\\": \\\"/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Neutrophils\\\",\\n    \\\"result\\\": \\\"50\\\",\\n    \\\"ref_range\\\": \\\"40-80\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Lymphocytes\\\",\\n    \\\"result\\\": \\\"40\\\",\\n    \\\"ref_range\\\": \\\"20-40\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Eosinophils\\\",\\n    \\\"result\\\": \\\"\\\",\\n    \\\"ref_range\\\": \\\"1-6\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Monocytes\\\",\\n    \\\"result\\\": \\\"\\\",\\n    \\\"ref_range\\\": \\\"2-10\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Basophils\\\",\\n    \\\"result\\\": \\\"0.00\\\",\\n    \\\"ref_range\\\": \\\"0-1\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Absolute Neutrophils\\\",\\n    \\\"result\\\": \\\"2500.00\\\",\\n    \\\"ref_range\\\": \\\"2000-7000\\\",\\n    \\\"unit\\\": \\\"/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Absolute Lymphocytes\\\",\\n    \\\"result\\\": \\\"2000.00\\\",\\n    \\\"ref_range\\\": \\\"1000-3000\\\",\\n    \\\"unit\\\": \\\"/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Absolute Eosinophils\\\",\\n    \\\"result\\\": \\\"50.00\\\",\\n    \\\"ref_range\\\": \\\"20-500\\\",\\n    \\\"unit\\\": \\\"/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Absolute Monocytes\\\",\\n    \\\"result\\\": \\\"450.00\\\",\\n    \\\"ref_range\\\": \\\"200-1000\\\",\\n    \\\"unit\\\": \\\"/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"RBC Count\\\",\\n    \\\"result\\\": \\\"5\\\",\\n    \\\"ref_range\\\": \\\"4.5-5.5\\\",\\n    \\\"unit\\\": \\\"million/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"MCV\\\",\\n    \\\"result\\\": \\\"80.00\\\",\\n    \\\"ref_range\\\": \\\"81-101\\\",\\n    \\\"unit\\\": \\\"fL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"MCH\\\",\\n    \\\"result\\\": \\\"30.00\\\",\\n    \\\"ref_range\\\": \\\"27-32\\\",\\n    \\\"unit\\\": \\\"pg\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"MCHC\\\",\\n    \\\"result\\\": \\\"37.50\\\",\\n    \\\"ref_range\\\": \\\"31.5-34.5\\\",\\n    \\\"unit\\\": \\\"g/dL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Hct\\\",\\n    \\\"result\\\": \\\"40\\\",\\n    \\\"ref_range\\\": \\\"40-50\\\",\\n    \\\"unit\\\": \\\"\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"RDW-CV\\\",\\n    \\\"result\\\": \\\"12\\\",\\n    \\\"ref_range\\\": \\\"11.6-14.0\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"RDW-SD\\\",\\n    \\\"result\\\": \\\"40\\\",\\n    \\\"ref_range\\\": \\\"39-46\\\",\\n    \\\"unit\\\": \\\"fL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Platelet Count\\\",\\n    \\\"result\\\": \\\"300000\\\",\\n    \\\"ref_range\\\": \\\"150000-410000\\\",\\n    \\\"unit\\\": \\\"/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"PCT\\\",\\n    \\\"result\\\": \\\"35\\\",\\n    \\\"ref_range\\\": \\\"\\\",\\n    \\\"unit\\\": \\\"\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"MPV\\\",\\n    \\\"result\\\": \\\"8\\\",\\n    \\\"ref_range\\\": \\\"7.5-11.5\\\",\\n    \\\"unit\\\": \\\"fL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"PDW\\\",\\n    \\\"result\\\": \\\"9\\\",\\n    \\\"ref_range\\\": \\\"\\\",\\n    \\\"unit\\\": \\\"\\\"\\n  }\\n]\\n```\"','2024-07-18','2024-07-17 20:05:52.852647',1,NULL,NULL,NULL,NULL),(2,'\"```json\\n[\\n    {\\\"description\\\": \\\"Haemoglobin\\\", \\\"result\\\": \\\"10\\\", \\\"ref_range\\\": \\\"13-17\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Total Leucocyte Count\\\", \\\"result\\\": \\\"5000\\\", \\\"ref_range\\\": \\\"4000-10000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Neutrophils\\\", \\\"result\\\": \\\"50\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"20-40\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Eosinophils\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"1-6\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Monocytes\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"2-10\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Basophils\\\", \\\"result\\\": \\\"0.00\\\", \\\"ref_range\\\": \\\"0-1\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Absolute Neutrophils\\\", \\\"result\\\": \\\"2500.00\\\", \\\"ref_range\\\": \\\"2000-7000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Lymphocytes\\\", \\\"result\\\": \\\"2000.00\\\", \\\"ref_range\\\": \\\"1000-3000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Eosinophils\\\", \\\"result\\\": \\\"50.00\\\", \\\"ref_range\\\": \\\"20-500\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Monocytes\\\", \\\"result\\\": \\\"450.00\\\", \\\"ref_range\\\": \\\"200-1000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"RBC Count\\\", \\\"result\\\": \\\"5\\\", \\\"ref_range\\\": \\\"4.5-5.5\\\", \\\"unit\\\": \\\"Million/cumm\\\"},\\n    {\\\"description\\\": \\\"MCV\\\", \\\"result\\\": \\\"80.00\\\", \\\"ref_range\\\": \\\"81-101\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"MCH\\\", \\\"result\\\": \\\"30.00\\\", \\\"ref_range\\\": \\\"27-32\\\", \\\"unit\\\": \\\"pg\\\"},\\n    {\\\"description\\\": \\\"MCHC\\\", \\\"result\\\": \\\"37.50\\\", \\\"ref_range\\\": \\\"31.5-34.5\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Hct\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"40-50\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"RDW-CV\\\", \\\"result\\\": \\\"12\\\", \\\"ref_range\\\": \\\"11.6-14.0\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"RDW-SD\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"39-46\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"Platelet Count\\\", \\\"result\\\": \\\"300000\\\", \\\"ref_range\\\": \\\"150000-410000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"PCT\\\", \\\"result\\\": \\\"35\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"MPV\\\", \\\"result\\\": \\\"8\\\", \\\"ref_range\\\": \\\"7.5-11.5\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"PDW\\\", \\\"result\\\": \\\"9\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"}\\n]\\n```\"','2024-05-27','2024-07-27 15:20:42.824915',1,'','',NULL,1),(3,'\"```json\\n[\\n    {\\\"description\\\": \\\"Haemoglobin\\\", \\\"result\\\": \\\"20\\\", \\\"ref_range\\\": \\\"13-17\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Total Leucocyte Count\\\", \\\"result\\\": \\\"5000\\\", \\\"ref_range\\\": \\\"4000-10000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Neutrophils\\\", \\\"result\\\": \\\"50\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"20-40\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Eosinophils\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"1-6\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Monocytes\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"2-10\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Basophils\\\", \\\"result\\\": \\\"0.00\\\", \\\"ref_range\\\": \\\"0-1\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Absolute Neutrophils\\\", \\\"result\\\": \\\"2500.00\\\", \\\"ref_range\\\": \\\"2000-7000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Lymphocytes\\\", \\\"result\\\": \\\"2000.00\\\", \\\"ref_range\\\": \\\"1000-3000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Eosinophils\\\", \\\"result\\\": \\\"50.00\\\", \\\"ref_range\\\": \\\"20-500\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Monocytes\\\", \\\"result\\\": \\\"450.00\\\", \\\"ref_range\\\": \\\"200-1000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"RBC Count\\\", \\\"result\\\": \\\"5\\\", \\\"ref_range\\\": \\\"4.5-5.5\\\", \\\"unit\\\": \\\"million/cumm\\\"},\\n    {\\\"description\\\": \\\"MCV\\\", \\\"result\\\": \\\"80.00\\\", \\\"ref_range\\\": \\\"81-101\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"MCH\\\", \\\"result\\\": \\\"30.00\\\", \\\"ref_range\\\": \\\"27-32\\\", \\\"unit\\\": \\\"pg\\\"},\\n    {\\\"description\\\": \\\"MCHC\\\", \\\"result\\\": \\\"37.50\\\", \\\"ref_range\\\": \\\"31.5-34.5\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Hct\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"40-50\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"RDW-CV\\\", \\\"result\\\": \\\"12\\\", \\\"ref_range\\\": \\\"11.6-14.0\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"RDW-SD\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"39-46\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"Platelet Count\\\", \\\"result\\\": \\\"300000\\\", \\\"ref_range\\\": \\\"150000-410000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"PCT\\\", \\\"result\\\": \\\"35\\\", \\\"ref_range\\\": null, \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"MPV\\\", \\\"result\\\": \\\"8\\\", \\\"ref_range\\\": \\\"7.5-11.5\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"PDW\\\", \\\"result\\\": \\\"9\\\", \\\"ref_range\\\": null, \\\"unit\\\": \\\"\\\"}\\n]\\n```\"','2024-08-27','2024-07-27 15:21:07.483350',1,'','',NULL,1),(4,'\"[\\n    {\\\"description\\\": \\\"Haemoglobin\\\", \\\"result\\\": \\\"18.5\\\", \\\"ref_range\\\": \\\"13-17\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Total Leucocyte Count\\\", \\\"result\\\": \\\"5000\\\", \\\"ref_range\\\": \\\"4000-10000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Neutrophils\\\", \\\"result\\\": \\\"50\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"20-40\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Eosinophils\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"1-6\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Monocytes\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"2-10\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Basophils\\\", \\\"result\\\": \\\"0.00\\\", \\\"ref_range\\\": \\\"0-1\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Absolute Neutrophils\\\", \\\"result\\\": \\\"2500.00\\\", \\\"ref_range\\\": \\\"2000-7000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Lymphocytes\\\", \\\"result\\\": \\\"2000.00\\\", \\\"ref_range\\\": \\\"1000-3000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Eosinophils\\\", \\\"result\\\": \\\"50.00\\\", \\\"ref_range\\\": \\\"20-500\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Monocytes\\\", \\\"result\\\": \\\"450.00\\\", \\\"ref_range\\\": \\\"200-1000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"RBC Count\\\", \\\"result\\\": \\\"5\\\", \\\"ref_range\\\": \\\"4.5-5.5\\\", \\\"unit\\\": \\\"million/cumm\\\"},\\n    {\\\"description\\\": \\\"MCV\\\", \\\"result\\\": \\\"80.00\\\", \\\"ref_range\\\": \\\"81-101\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"MCH\\\", \\\"result\\\": \\\"30.00\\\", \\\"ref_range\\\": \\\"27-32\\\", \\\"unit\\\": \\\"pg\\\"},\\n    {\\\"description\\\": \\\"MCHC\\\", \\\"result\\\": \\\"37.50\\\", \\\"ref_range\\\": \\\"31.5-34.5\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Hct\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"40-50\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"RDW-CV\\\", \\\"result\\\": \\\"12\\\", \\\"ref_range\\\": \\\"11.6-14.0\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"RDW-SD\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"39-46\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"Platelet Count\\\", \\\"result\\\": \\\"300000\\\", \\\"ref_range\\\": \\\"150000-410000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"PCT\\\", \\\"result\\\": \\\"35\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"MPV\\\", \\\"result\\\": \\\"8\\\", \\\"ref_range\\\": \\\"7.5-11.5\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"PDW\\\", \\\"result\\\": \\\"9\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"}\\n]\"','2024-07-27','2024-07-27 16:09:29.082122',1,'','',NULL,1),(5,'\"```json\\n[\\n  {\\n    \\\"description\\\": \\\"Haemoglobin\\\",\\n    \\\"result\\\": \\\"19\\\",\\n    \\\"ref_range\\\": \\\"13.0 - 17.0\\\",\\n    \\\"unit\\\": \\\"g/dL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Total RBC count\\\",\\n    \\\"result\\\": \\\"5.2\\\",\\n    \\\"ref_range\\\": \\\"4.5 - 5.5\\\",\\n    \\\"unit\\\": \\\"mill/cumm\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Packed Cell Volume (PCV)\\\",\\n    \\\"result\\\": \\\"57.5\\\",\\n    \\\"ref_range\\\": \\\"40 - 50\\\",\\n    \\\"unit\\\": \\\"\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Mean Corpuscular Volume (MCV)\\\",\\n    \\\"result\\\": \\\"87.75\\\",\\n    \\\"ref_range\\\": \\\"83 - 101\\\",\\n    \\\"unit\\\": \\\"fL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"MCH\\\",\\n    \\\"result\\\": \\\"27.2\\\",\\n    \\\"ref_range\\\": \\\"27 - 32\\\",\\n    \\\"unit\\\": \\\"pg\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"MCHC\\\",\\n    \\\"result\\\": \\\"32.8\\\",\\n    \\\"ref_range\\\": \\\"32.5 - 34.5\\\",\\n    \\\"unit\\\": \\\"g/dL\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"RDW\\\",\\n    \\\"result\\\": \\\"13.6\\\",\\n    \\\"ref_range\\\": \\\"11.6 - 14.0\\\",\\n    \\\"unit\\\": \\\"\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Neutrophils\\\",\\n    \\\"result\\\": \\\"60\\\",\\n    \\\"ref_range\\\": \\\"50 - 62\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Lymphocytes\\\",\\n    \\\"result\\\": \\\"31\\\",\\n    \\\"ref_range\\\": \\\"20 - 40\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Eosinophils\\\",\\n    \\\"result\\\": \\\"1\\\",\\n    \\\"ref_range\\\": \\\"00 - 06\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Monocytes\\\",\\n    \\\"result\\\": \\\"7\\\",\\n    \\\"ref_range\\\": \\\"00 - 10\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Basophils\\\",\\n    \\\"result\\\": \\\"1\\\",\\n    \\\"ref_range\\\": \\\"00 - 02\\\",\\n    \\\"unit\\\": \\\"%\\\"\\n  },\\n  {\\n    \\\"description\\\": \\\"Platelet Count\\\",\\n    \\\"result\\\": \\\"150000\\\",\\n    \\\"ref_range\\\": \\\"150000 - 410000\\\",\\n    \\\"unit\\\": \\\"cumm\\\"\\n  }\\n]\\n```\"','2024-04-20','2024-07-30 14:53:09.289737',1,'105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578','97.12','Blood',1),(7,'\"```json\\n[\\n    {\\n        \\\"test_name\\\": \\\"Complete Blood Count (CBC)\\\",\\n        \\\"sample\\\": \\\"Blood\\\",\\n        \\\"results\\\": [\\n            {\\\"description\\\": \\\"Haemoglobin\\\", \\\"result\\\": \\\"15\\\", \\\"ref_range\\\": \\\"13-17\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n            {\\\"description\\\": \\\"Total Leucocyte Count\\\", \\\"result\\\": \\\"5000\\\", \\\"ref_range\\\": \\\"4000-10000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n            {\\\"description\\\": \\\"Neutrophils\\\", \\\"result\\\": \\\"50\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"%\\\"},\\n            {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"20-40\\\", \\\"unit\\\": \\\"%\\\"},\\n            {\\\"description\\\": \\\"Eosinophils\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"1-6\\\", \\\"unit\\\": \\\"%\\\"},\\n            {\\\"description\\\": \\\"Monocytes\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"2-10\\\", \\\"unit\\\": \\\"%\\\"},\\n            {\\\"description\\\": \\\"Basophils\\\", \\\"result\\\": \\\"0.00\\\", \\\"ref_range\\\": \\\"0-1\\\", \\\"unit\\\": \\\"%\\\"},\\n            {\\\"description\\\": \\\"Absolute Neutrophils\\\", \\\"result\\\": \\\"2500.00\\\", \\\"ref_range\\\": \\\"2000-7000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n            {\\\"description\\\": \\\"Absolute Lymphocytes\\\", \\\"result\\\": \\\"2000.00\\\", \\\"ref_range\\\": \\\"1000-3000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n            {\\\"description\\\": \\\"Absolute Eosinophils\\\", \\\"result\\\": \\\"50.00\\\", \\\"ref_range\\\": \\\"20-500\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n            {\\\"description\\\": \\\"Absolute Monocytes\\\", \\\"result\\\": \\\"450.00\\\", \\\"ref_range\\\": \\\"200-1000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n            {\\\"description\\\": \\\"RBC Count\\\", \\\"result\\\": \\\"5\\\", \\\"ref_range\\\": \\\"4.5-5.5\\\", \\\"unit\\\": \\\"million/cumm\\\"},\\n            {\\\"description\\\": \\\"MCV\\\", \\\"result\\\": \\\"80.00\\\", \\\"ref_range\\\": \\\"81-101\\\", \\\"unit\\\": \\\"fL\\\"},\\n            {\\\"description\\\": \\\"MCH\\\", \\\"result\\\": \\\"30.00\\\", \\\"ref_range\\\": \\\"27-32\\\", \\\"unit\\\": \\\"pg\\\"},\\n            {\\\"description\\\": \\\"MCHC\\\", \\\"result\\\": \\\"37.50\\\", \\\"ref_range\\\": \\\"31.5-34.5\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n            {\\\"description\\\": \\\"Hct\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"40-50\\\", \\\"unit\\\": \\\"\\\"},\\n            {\\\"description\\\": \\\"RDW-CV\\\", \\\"result\\\": \\\"12\\\", \\\"ref_range\\\": \\\"11.6-14.0\\\", \\\"unit\\\": \\\"%\\\"},\\n            {\\\"description\\\": \\\"RDW-SD\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"39-46\\\", \\\"unit\\\": \\\"fL\\\"},\\n            {\\\"description\\\": \\\"Platelet Count\\\", \\\"result\\\": \\\"300000\\\", \\\"ref_range\\\": \\\"150000-410000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n            {\\\"description\\\": \\\"PCT\\\", \\\"result\\\": \\\"35\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"},\\n            {\\\"description\\\": \\\"MPV\\\", \\\"result\\\": \\\"8\\\", \\\"ref_range\\\": \\\"7.5-11.5\\\", \\\"unit\\\": \\\"fL\\\"},\\n            {\\\"description\\\": \\\"PDW\\\", \\\"result\\\": \\\"9\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"}\\n        ]\\n    }\\n]\\n```\"','2023-06-24','2024-08-18 07:59:53.542628',1,'','96.97','Blood',1),(8,'\"```json\\n[\\n    {\\\"test_name\\\": \\\"Complete Blood Count (CBC)\\\"},\\n    {\\\"sample\\\": \\\"Blood\\\"},\\n    {\\\"description\\\": \\\"Haemoglobin\\\", \\\"result\\\": \\\"15\\\", \\\"ref_range\\\": \\\"13-17\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Total Leucocyte Count\\\", \\\"result\\\": \\\"5000\\\", \\\"ref_range\\\": \\\"4000-10000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Neutrophils\\\", \\\"result\\\": \\\"50\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"20-40\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Eosinophils\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"1-6\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Monocytes\\\", \\\"result\\\": \\\"\\\", \\\"ref_range\\\": \\\"2-10\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Basophils\\\", \\\"result\\\": \\\"0.00\\\", \\\"ref_range\\\": \\\"0-1\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Absolute Neutrophils\\\", \\\"result\\\": \\\"2500.00\\\", \\\"ref_range\\\": \\\"2000-7000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Lymphocytes\\\", \\\"result\\\": \\\"2000.00\\\", \\\"ref_range\\\": \\\"1000-3000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Eosinophils\\\", \\\"result\\\": \\\"50.00\\\", \\\"ref_range\\\": \\\"20-500\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Monocytes\\\", \\\"result\\\": \\\"450.00\\\", \\\"ref_range\\\": \\\"200-1000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"RBC Count\\\", \\\"result\\\": \\\"5\\\", \\\"ref_range\\\": \\\"4.5-5.5\\\", \\\"unit\\\": \\\"Million/cumm\\\"},\\n    {\\\"description\\\": \\\"MCV\\\", \\\"result\\\": \\\"80.00\\\", \\\"ref_range\\\": \\\"81-101\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"MCH\\\", \\\"result\\\": \\\"30.00\\\", \\\"ref_range\\\": \\\"27-32\\\", \\\"unit\\\": \\\"pg\\\"},\\n    {\\\"description\\\": \\\"MCHC\\\", \\\"result\\\": \\\"37.50\\\", \\\"ref_range\\\": \\\"31.5-34.5\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Hct\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"40-50\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"RDW-CV\\\", \\\"result\\\": \\\"12\\\", \\\"ref_range\\\": \\\"11.6-14.0\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"RDW-SD\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"39-46\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"Platelet Count\\\", \\\"result\\\": \\\"300000\\\", \\\"ref_range\\\": \\\"150000-410000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"PCT\\\", \\\"result\\\": \\\"35\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"MPV\\\", \\\"result\\\": \\\"8\\\", \\\"ref_range\\\": \\\"7.5-11.5\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"PDW\\\", \\\"result\\\": \\\"9\\\", \\\"ref_range\\\": \\\"\\\", \\\"unit\\\": \\\"\\\"}\\n]\\n```\"','2023-06-24','2024-08-18 09:03:12.045845',1,'','96.97','Blood',1),(9,'\"[\\n    {\\\"test_name\\\": \\\"Complete Blood Count (CBC)\\\"},\\n    {\\\"sample\\\": \\\"Blood\\\"},\\n    {\\\"description\\\": \\\"Haemoglobin\\\", \\\"result\\\": \\\"15\\\", \\\"ref_range\\\": \\\"13-17\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Total Leucocyte Count\\\", \\\"result\\\": \\\"5000\\\", \\\"ref_range\\\": \\\"4000-10000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Neutrophils\\\", \\\"result\\\": \\\"50\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"20-40\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Eosinophils\\\", \\\"result\\\": null, \\\"ref_range\\\": \\\"1-6\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Monocytes\\\", \\\"result\\\": null, \\\"ref_range\\\": \\\"2-10\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Basophils\\\", \\\"result\\\": \\\"0.00\\\", \\\"ref_range\\\": \\\"0-1\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"Absolute Neutrophils\\\", \\\"result\\\": \\\"2500.00\\\", \\\"ref_range\\\": \\\"2000-7000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Lymphocytes\\\", \\\"result\\\": \\\"2000.00\\\", \\\"ref_range\\\": \\\"1000-3000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Eosinophils\\\", \\\"result\\\": \\\"50.00\\\", \\\"ref_range\\\": \\\"20-500\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"Absolute Monocytes\\\", \\\"result\\\": \\\"450.00\\\", \\\"ref_range\\\": \\\"200-1000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"RBC Count\\\", \\\"result\\\": \\\"5\\\", \\\"ref_range\\\": \\\"4.5-5.5\\\", \\\"unit\\\": \\\"million/cumm\\\"},\\n    {\\\"description\\\": \\\"MCV\\\", \\\"result\\\": \\\"80.00\\\", \\\"ref_range\\\": \\\"81-101\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"MCH\\\", \\\"result\\\": \\\"30.00\\\", \\\"ref_range\\\": \\\"27-32\\\", \\\"unit\\\": \\\"pg\\\"},\\n    {\\\"description\\\": \\\"MCHC\\\", \\\"result\\\": \\\"37.50\\\", \\\"ref_range\\\": \\\"31.5-34.5\\\", \\\"unit\\\": \\\"g/dL\\\"},\\n    {\\\"description\\\": \\\"Hct\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"40-50\\\", \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"RDW-CV\\\", \\\"result\\\": \\\"12\\\", \\\"ref_range\\\": \\\"11.6-14.0\\\", \\\"unit\\\": \\\"%\\\"},\\n    {\\\"description\\\": \\\"RDW-SD\\\", \\\"result\\\": \\\"40\\\", \\\"ref_range\\\": \\\"39-46\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"Platelet Count\\\", \\\"result\\\": \\\"300000\\\", \\\"ref_range\\\": \\\"150000-410000\\\", \\\"unit\\\": \\\"/cumm\\\"},\\n    {\\\"description\\\": \\\"PCT\\\", \\\"result\\\": \\\"35\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"MPV\\\", \\\"result\\\": \\\"8\\\", \\\"ref_range\\\": \\\"7.5-11.5\\\", \\\"unit\\\": \\\"fL\\\"},\\n    {\\\"description\\\": \\\"PDW\\\", \\\"result\\\": \\\"9\\\", \\\"ref_range\\\": null, \\\"unit\\\": null}\\n]\"','2023-06-24','2024-08-18 09:19:23.912236',1,NULL,'96.97','Blood',NULL),(10,'\"```json\\n[\\n    {\\\"test_name\\\": \\\"C.S.F. EXAMINATION ROUTINE\\\"},\\n    {\\\"test_name\\\": \\\"CHEMICAL EXAMINATION\\\"},\\n    {\\\"description\\\": \\\"Chloride\\\", \\\"result\\\": \\\"101.40\\\", \\\"ref_range\\\": \\\"98-107\\\", \\\"unit\\\": \\\"mg/dL\\\"},\\n    {\\\"description\\\": \\\"Proteins\\\", \\\"result\\\": \\\"36.80\\\", \\\"ref_range\\\": \\\"20-45\\\", \\\"unit\\\": \\\"mg/dL\\\"},\\n    {\\\"description\\\": \\\"Sugar\\\", \\\"result\\\": \\\"54.10\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"mg/dL\\\"},\\n    {\\\"test_name\\\": \\\"PHYSICAL EXAMINATION\\\"},\\n    {\\\"description\\\": \\\"Colour\\\", \\\"result\\\": \\\"Colourless\\\"},\\n    {\\\"description\\\": \\\"Quantity\\\", \\\"result\\\": \\\"3 ml\\\"},\\n    {\\\"description\\\": \\\"Appearance\\\", \\\"result\\\": \\\"Clear\\\"},\\n    {\\\"description\\\": \\\"Coagulum\\\", \\\"result\\\": \\\"Present\\\"},\\n    {\\\"description\\\": \\\"Blood\\\", \\\"result\\\": \\\"Absent\\\"},\\n    {\\\"test_name\\\": \\\"MICROSCOPIC EXAMINATION\\\"},\\n    {\\\"description\\\": \\\"Total W.B.C. Count\\\", \\\"result\\\": \\\"5500\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"Polymorphs\\\", \\\"result\\\": \\\"Absent\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"Absent\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"Any Others\\\", \\\"result\\\": \\\"Absent\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"RBC\'S\\\", \\\"result\\\": \\\"Absent\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"Z.N. Stain\\\", \\\"result\\\": \\\"AFB not detected.\\\", \\\"unit\\\": \\\"\\\"},\\n    {\\\"description\\\": \\\"Cram\'s Smear\\\", \\\"result\\\": \\\"Organism not detected.\\\", \\\"unit\\\": \\\"\\\"}\\n]\\n```\"','2022-12-02','2024-08-18 11:32:45.793938',1,', HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578','96.39',NULL,NULL),(11,'\"```json\\n[\\n    {\\n        \\\"test_name\\\": \\\"KIDNEY FUNCTION TEST (KFT)\\\"\\n    },\\n    {\\n        \\\"sample\\\": \\\"Serum\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Urea\\\",\\n        \\\"result\\\": \\\"15\\\",\\n        \\\"ref_range\\\": \\\"13-43\\\",\\n        \\\"unit\\\": \\\"mg/dL\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Creatinine\\\",\\n        \\\"result\\\": \\\"1.5\\\",\\n        \\\"ref_range\\\": \\\"0.7-1.3\\\",\\n        \\\"unit\\\": \\\"mg/dL\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Uric Acid\\\",\\n        \\\"result\\\": \\\"5.5\\\",\\n        \\\"ref_range\\\": \\\"3.5-7.2\\\",\\n        \\\"unit\\\": \\\"mg/dL\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Calcium, Total\\\",\\n        \\\"result\\\": \\\"10.2\\\",\\n        \\\"ref_range\\\": \\\"8.7-10.4\\\",\\n        \\\"unit\\\": \\\"mg/dL\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Phosphorus\\\",\\n        \\\"result\\\": \\\"1.4\\\",\\n        \\\"ref_range\\\": \\\"2.4-5.1\\\",\\n        \\\"unit\\\": \\\"mg/dL\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Alkaline Phosphatase (ALP)\\\",\\n        \\\"result\\\": \\\"80\\\",\\n        \\\"ref_range\\\": \\\"30-120\\\",\\n        \\\"unit\\\": \\\"U/L\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Total Protein\\\",\\n        \\\"result\\\": \\\"5.9\\\",\\n        \\\"ref_range\\\": \\\"5.7-8.2\\\",\\n        \\\"unit\\\": \\\"g/dL\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Sodium\\\",\\n        \\\"result\\\": \\\"139\\\",\\n        \\\"ref_range\\\": \\\"136-145\\\",\\n        \\\"unit\\\": \\\"mEq/L\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Potassium\\\",\\n        \\\"result\\\": \\\"3.9\\\",\\n        \\\"ref_range\\\": \\\"3.5-5.1\\\",\\n        \\\"unit\\\": \\\"mEq/L\\\"\\n    },\\n    {\\n        \\\"description\\\": \\\"Chloride\\\",\\n        \\\"result\\\": \\\"100\\\",\\n        \\\"ref_range\\\": \\\"98-107\\\",\\n        \\\"unit\\\": \\\"mEq/L\\\"\\n    }\\n]\\n```\"','2005-12-20','2024-08-18 13:36:15.342475',1,'105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578','94.05','Serum',NULL),(12,'\"[\\n    {\\\"test_name\\\": \\\"C.S.F. EXAMINATION ROUTINE\\\"},\\n    {\\\"sample\\\": \\\"Cerebrospinal Fluid (CSF)\\\"},\\n    {\\\"description\\\": \\\"Chloride\\\", \\\"result\\\": \\\"101.40\\\", \\\"ref_range\\\": \\\"98-107\\\", \\\"unit\\\": \\\"mg/dL\\\"},\\n    {\\\"description\\\": \\\"Proteins\\\", \\\"result\\\": \\\"36.80\\\", \\\"ref_range\\\": \\\"20-45\\\", \\\"unit\\\": \\\"mg/dL\\\"},\\n    {\\\"description\\\": \\\"Sugar\\\", \\\"result\\\": \\\"54.10\\\", \\\"ref_range\\\": \\\"40-80\\\", \\\"unit\\\": \\\"mg/dL\\\"},\\n    {\\\"description\\\": \\\"Colour\\\", \\\"result\\\": \\\"Colourless\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Quantity\\\", \\\"result\\\": \\\"3\\\", \\\"ref_range\\\": null, \\\"unit\\\": \\\"ml\\\"},\\n    {\\\"description\\\": \\\"Appearance\\\", \\\"result\\\": \\\"Clear\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Coagulum\\\", \\\"result\\\": \\\"Present\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Blood\\\", \\\"result\\\": \\\"Absent\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Total W.B.C. Count\\\", \\\"result\\\": \\\"5500\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Polymorphs\\\", \\\"result\\\": \\\"sentrlogy.com\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Lymphocytes\\\", \\\"result\\\": \\\"Absent\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"RBC\'S\\\", \\\"result\\\": \\\"Absent\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Z.N. Stain\\\", \\\"result\\\": \\\"AFB not detected.\\\", \\\"ref_range\\\": null, \\\"unit\\\": null},\\n    {\\\"description\\\": \\\"Cram\'s Smear\\\", \\\"result\\\": \\\"Organism not detected.\\\", \\\"ref_range\\\": null, \\\"unit\\\": null}\\n]\\n\"','2022-12-02','2024-08-26 18:27:41.493876',1,', HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578','96.39','Cerebrospinal Fluid',2);
/*!40000 ALTER TABLE `api_labreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_labreportimage`
--

DROP TABLE IF EXISTS `api_labreportimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_labreportimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `size` int unsigned NOT NULL,
  `lab_report_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_labreportimage_lab_report_id_e94c23c4_fk_Api_labreport_id` (`lab_report_id`),
  CONSTRAINT `Api_labreportimage_lab_report_id_e94c23c4_fk_Api_labreport_id` FOREIGN KEY (`lab_report_id`) REFERENCES `api_labreport` (`id`),
  CONSTRAINT `api_labreportimage_chk_1` CHECK ((`size` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_labreportimage`
--

LOCK TABLES `api_labreportimage` WRITE;
/*!40000 ALTER TABLE `api_labreportimage` DISABLE KEYS */;
INSERT INTO `api_labreportimage` VALUES (1,'lab_reports/ocr_djEWsf3.png','2024-07-17 20:05:52.863720',183021,1),(2,'lab_reports/ocr_yPxMVJJ.png','2024-07-27 15:20:42.833892',183021,2),(3,'lab_reports/ocr_NGtz1lz_zs2S3g7.png','2024-07-27 15:21:07.489333',183021,3),(4,'lab_reports/ocr.png','2024-07-27 16:09:29.095079',183021,4),(6,'lab_reports/ocr_ahOggDr.png','2024-08-18 07:59:53.548034',183021,7),(7,'lab_reports/ocr_szZSAYR_9eVZ0b8.png','2024-08-18 09:03:12.050214',183021,8),(8,'lab_reports/ocr_qeFWQFG_NGyYCrH.png','2024-08-18 09:19:23.919157',183021,9),(9,'lab_reports/ocr_ex1_E2LFzV2.jpg','2024-08-18 11:32:45.798107',91961,10),(10,'lab_reports/ocr_ex2_i2UaWtp.jpg','2024-08-18 13:36:15.347621',101087,11),(11,'temp_lab_img/ocr_ex1.jpg','2024-08-26 18:27:41.501860',91961,12);
/*!40000 ALTER TABLE `api_labreportimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_profile`
--

DROP TABLE IF EXISTS `api_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(10) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  `birth` date DEFAULT NULL,
  `education` longtext,
  `specialization` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Api_profile_user_id_b18bd9b5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_profile`
--

LOCK TABLES `api_profile` WRITE;
/*!40000 ALTER TABLE `api_profile` DISABLE KEYS */;
INSERT INTO `api_profile` VALUES (1,'patient','admin.jpg',1,'2000-01-01','.','.'),(2,'patient','cheerful_male_doctor_with_medical_icons_healthy_food_promoting_balanced_28UGPKi.jpg',2,'2024-08-29','Hello','MBBS'),(3,'patient','cheerful_male_doctor_with_medical_icons_healthy_food_promoting_balanced.jpg',3,'2024-08-29','Hello','MBBS'),(4,'doctor','2.jpg',5,'2024-08-29','.','Cardiologist'),(5,'doctor','3.jpg',9,'2024-08-29','.','Dermatologist'),(6,'doctor','4.webp',13,'2024-08-29','.','Endocrinologist'),(7,'doctor','6.jpg',15,'2024-08-29','.','Otolaryngologist (ENT)'),(8,'doctor','7.jpg',18,'2024-08-29','.','Gastroenterologist'),(9,'doctor','9.webp',19,'2024-08-29','.','Hematologist'),(10,'doctor','10.jpg',7,'2024-08-29','.','Neurologist');
/*!40000 ALTER TABLE `api_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_temporarylabreport`
--

DROP TABLE IF EXISTS `api_temporarylabreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_temporarylabreport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ocr_text` longtext,
  `gemini_prompt1_response` longtext,
  `original_report_date` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `ocr_confidence` longtext,
  `address_of_hospital` longtext,
  `user_id` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_temporarylabreport_user_id_132eb04f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Api_temporarylabreport_user_id_132eb04f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_temporarylabreport`
--

LOCK TABLES `api_temporarylabreport` WRITE;
/*!40000 ALTER TABLE `api_temporarylabreport` DISABLE KEYS */;
INSERT INTO `api_temporarylabreport` VALUES (1,'          DRLOGY PATHOLOGY LAB                                               0123456789 0912345678\n              Accurate Caring Instant                                        drlogypathlab@drlogy.com\n          105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\n                                                                                       www.drlogy.com\n Yash M. Patel                         Sample Collected At:\n Age: 21 Years                         125, Shivam Bungalow, SG Road,\n                                                                            Registered on: 02:31 PM 02 Dec, 2X\n                                       Mumbai\n Sex: Male\n                                                                             Collected on: 03:11 PM 02 Dec, 2X\n PID: 555                              Ref. By: Dr. Hiren Shah               Reported on: 04:35 PM 02 Dec, 2X\n                                 Complete Blood Count (CBC)\n Investigation                Result                    Reference Value         Unit\n Primary Sample Type:         Blood\n HEMOGLOBIN\n Hemoglobin (Hb)              12.5                 Low 13.0 17.0                g/dL\n RBC COUNT\n Total RBC count               5.2                      4.5-5.5                  mill/cumm\n BLOOD INDICES\n Packed Cell Volume (PCV)     57.5                 High 40-50\n Mean Corpuscular Volume (MCV) 87.75                    83-101                  fL\n Calculated\n MCH                          27.2                      27-32                   pg\n Calculated\n MCHC                          32.8                     32.5-34.5               g/dL\n Calculated\n RDW                          13.6                      11.6-14.0\n WBC COUNT\n Total WBC count\n DIFFERENTIAL WBC COUNT\n                                  Drlogy.c\n Neutrophils                   60                       50-62\n Lymphocytes                   31                       20-40\n Eosinophils                   1                        00-06\n Monocytes                     7                        00-10\n Basophils                     1                        00-02                   %\n PLATELET COUNT\n Platelet Count                150000         Borderline 150000-410000          cumm\n Instruments: Fully automated cell counter-Mindray 300\n Interpretation: Further confirm for Anemia\n Thanks for Reference                         End of Report ****\n Medical Lab Technician                  Dr. Payal Shah                   Dr. Vimal Shah\n (DMLT, BMLT)                            (MD, Pathologist)               (MD, Pathologist)\n                                                           Generated on: 02 Dec, 202X 05:00 PM Page 1 of 1\n                                               Sample Collection                0123456789','DRLOGY PATHOLOGY LAB 0123456789 0912345678\nAccurate Caring Instant drlogypathlab@drlogy.com\n105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\nwww.drlogy.com\n\nYash M. Patel\nAge: 21 Years\nSex: Male\nPID: 555\n\nSample Collected At:\n125, Shivam Bungalow, SG Road,\nMumbai\nRegistered on: 02:31 PM 02 Dec, 202X\nCollected on: 03:11 PM 02 Dec, 202X\nRef. By: Dr. Hiren Shah\nReported on: 04:35 PM 02 Dec, 202X\n\nComplete Blood Count (CBC)\nPrimary Sample Type: Blood\n\nInvestigation | Result | Reference Value | Unit\n------- | -------- | -------- | --------\nHemoglobin (Hb) | 12.5 | Low 13.0 - 17.0 | g/dL\nTotal RBC count | 5.2 | 4.5 - 5.5 | mill/cumm\nPacked Cell Volume (PCV) | 57.5 | High 40 - 50 |\nMean Corpuscular Volume (MCV) | 87.75 | 83 - 101 | fL\nMCH | 27.2 | 27 - 32 | pg\nMCHC | 32.8 | 32.5 - 34.5 | g/dL\nRDW | 13.6 | 11.6 - 14.0 |\nTotal WBC count |  |  |  \nNeutrophils | 60 | 50 - 62 | %\nLymphocytes | 31 | 20 - 40 | %\nEosinophils | 1 | 00 - 06 | %\nMonocytes | 7 | 00 - 10 | %\nBasophils | 1 | 00 - 02 | %\nPlatelet Count | 150000 | Borderline 150000 - 410000 | cumm\n\nInstruments: Fully automated cell counter-Mindray 300\nInterpretation: Further confirm for Anemia\n\nThanks for Reference\nEnd of Report ****\nMedical Lab Technician\n(DMLT, BMLT)\nDr. Payal Shah\n(MD, Pathologist)\nDr. Vimal Shah\n(MD, Pathologist)\n\nGenerated on: 02 Dec, 202X 05:00 PM Page 1 of 1\nSample Collection\n0123456789\n','2005-12-20','2024-07-30 14:52:51.539187','97.12','105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578',1,NULL),(2,'          DRLOGY PATHOLOGY LAB                                               0123456789 0912345678\n              Accurate Caring Instant                                        drlogypathlab@drlogy.com\n          105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\n                                                                                       www.drlogy.com\n Yash M. Patel                         Sample Collected At:\n Age: 21 Years                         125, Shivam Bungalow, SG Road,\n                                                                            Registered on: 02:31 PM 02 Dec, 2X\n                                       Mumbai\n Sex: Male\n                                                                             Collected on: 03:11 PM 02 Dec, 2X\n PID: 555                              Ref. By: Dr. Hiren Shah               Reported on: 04:35 PM 02 Dec, 2X\n                                 Complete Blood Count (CBC)\n Investigation                Result                    Reference Value         Unit\n Primary Sample Type:         Blood\n HEMOGLOBIN\n Hemoglobin (Hb)              12.5                 Low 13.0 17.0                g/dL\n RBC COUNT\n Total RBC count               5.2                      4.5-5.5                  mill/cumm\n BLOOD INDICES\n Packed Cell Volume (PCV)     57.5                 High 40-50\n Mean Corpuscular Volume (MCV) 87.75                    83-101                  fL\n Calculated\n MCH                          27.2                      27-32                   pg\n Calculated\n MCHC                          32.8                     32.5-34.5               g/dL\n Calculated\n RDW                          13.6                      11.6-14.0\n WBC COUNT\n Total WBC count\n DIFFERENTIAL WBC COUNT\n                                  Drlogy.c\n Neutrophils                   60                       50-62\n Lymphocytes                   31                       20-40\n Eosinophils                   1                        00-06\n Monocytes                     7                        00-10\n Basophils                     1                        00-02                   %\n PLATELET COUNT\n Platelet Count                150000         Borderline 150000-410000          cumm\n Instruments: Fully automated cell counter-Mindray 300\n Interpretation: Further confirm for Anemia\n Thanks for Reference                         End of Report ****\n Medical Lab Technician                  Dr. Payal Shah                   Dr. Vimal Shah\n (DMLT, BMLT)                            (MD, Pathologist)               (MD, Pathologist)\n                                                           Generated on: 02 Dec, 202X 05:00 PM Page 1 of 1\n                                               Sample Collection                0123456789','**DRLOGY PATHOLOGY LAB**\n0123456789 0912345678\nAccurate Caring Instant\ndrlogypathlab@drlogy.com\n105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\nwww.drlogy.com\n\n**Patient Information:**\nYash M. Patel\nAge: 21 Years\nSex: Male\nPID: 555\n\n**Sample Collection:**\nSample Collected At: 125, Shivam Bungalow, SG Road, Mumbai\nRegistered on: 02:31 PM 02 Dec, 2X\nCollected on: 03:11 PM 02 Dec, 2X\nRef. By: Dr. Hiren Shah\nReported on: 04:35 PM 02 Dec, 2X\n\n**Complete Blood Count (CBC)**\nPrimary Sample Type: Blood\n\n**Hemoglobin:**\nHemoglobin (Hb): 12.5 g/dL (Low 13.0 - 17.0 g/dL)\n\n**RBC Count:**\nTotal RBC count: 5.2 mill/cumm (4.5-5.5 mill/cumm)\n\n**Blood Indices:**\nPacked Cell Volume (PCV): 57.5 (High 40-50)\nMean Corpuscular Volume (MCV): 87.75 fL (83-101 fL)\nMCH: 27.2 pg (27-32 pg)\nMCHC: 32.8 g/dL (32.5-34.5 g/dL)\nRDW: 13.6 (11.6-14.0)\n\n**WBC Count:**\nTotal WBC count: \nDifferential WBC Count:\nNeutrophils: 60% (50-62%)\nLymphocytes: 31% (20-40%)\nEosinophils: 1% (00-06%)\nMonocytes: 7% (00-10%)\nBasophils: 1% (00-02%)\n\n**Platelet Count:**\nPlatelet Count: 150000 cumm (Borderline 150000-410000 cumm)\n\n**Instruments:**\nFully automated cell counter-Mindray 300\n\n**Interpretation:**\nFurther confirm for Anemia\n\n**Personnel:**\nMedical Lab Technician (DMLT, BMLT)\nDr. Payal Shah (MD, Pathologist)\nDr. Vimal Shah (MD, Pathologist)\n\n**Report Information:**\nGenerated on: 02 Dec, 202X 05:00 PM\nPage 1 of 1\n\n**Sample Collection:**\n0123456789 \n','2005-12-20','2024-07-30 15:08:31.657999','97.12','105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578',1,'temp_lab_img/cbc_testing.jpeg'),(3,'                                                                              Hello@flabs.in\n Flabs                                                                        +91 7253928905\n                                                                             https://www.flabs.in/\n  Name               Mr Dummy                            Patient ID   : PN2\n  Age/Gender      : 20/Male                              Report ID    : RE1\n  Referred By     : Self                                 Collection Date: 24/06/2023 08:49 PM\n  Phone No.        :                                     Report Date: 24/06/2023 09:02 PM\n                                           HAEMATOLOGY\n                                   COMPLETE BLOOD COUNT (CBC)\n TEST DESCRIPTION                       RESULT                    REF. RANGE               UNIT\n Haemoglobin                            15                        13-17                    g/dL\n Total Leucocyte Count                  5000                      4000-10000               /cumm\n Differential Leucocyte Count\n    Neutrophils                         50                       40-80\n    Lymphocytes                         40                       20-40\n    Eosinophils                                                   1-6\n    Monocytes                                                    2-10                      %\n    Basophils                           0.00                      0-1                      %\n Absolute Leucocyte Count\n    Absolute Neutrophils                2500.00                   2000-7000                /cumm\n    Absolute Lymphocytes                2000.00                   1000-3000                /cumm\n    Absolute Eosinophils                50.00                     20-500                   /cumm\n    Absolute Monocytes                  450.00                    200-1000                 /cumm\n RBC Indices\n                                                                                           Mil-\n    RBC Count                           5                        4.5-5.5\n                                                                                           lion/cumm\n    MCV                                 80.00                     81-101                   fL\n    MCH                                 30.00                    27-32                     pg\n    MCHC                                37.50                     31.5-34.5                g/dL\n    Hct                                 40                        40-50\n    RDW-CV                              12                        11.6-14.0                %\n    RDW-SD                              40                        39-46                    fL\n Platelets Indices\n    Platelet Count                      300000                    150000-410000            /cumm\n    PCT                                 35\n    MPV                                 8                        7.5-11.5                  fL\n    PDW                                 9\n Interpretation:','**Patient Information:**\n\nName: Mr Dummy\nPatient ID: PN2\nAge/Gender: 20/Male\nReferred By: Self\nPhone No.: \nReport ID: RE1\nCollection Date: 24/06/2023 08:49 PM\nReport Date: 24/06/2023 09:02 PM\n\n**Haematology**\n\n**Complete Blood Count (CBC)**\n\nTest Description | Result | Ref. Range | Unit\n---|---|---|---|\nHaemoglobin | 15 | 13-17 | g/dL\nTotal Leucocyte Count | 5000 | 4000-10000 | /cumm\nDifferential Leucocyte Count\n    Neutrophils | 50 | 40-80 | %\n    Lymphocytes | 40 | 20-40 | %\n    Eosinophils |  | 1-6 | %\n    Monocytes |  | 2-10 | %\n    Basophils | 0.00 | 0-1 | %\nAbsolute Leucocyte Count\n    Absolute Neutrophils | 2500.00 | 2000-7000 | /cumm\n    Absolute Lymphocytes | 2000.00 | 1000-3000 | /cumm\n    Absolute Eosinophils | 50.00 | 20-500 | /cumm\n    Absolute Monocytes | 450.00 | 200-1000 | /cumm\nRBC Indices\n    RBC Count | 5 | 4.5-5.5 | million/cumm\n    MCV | 80.00 | 81-101 | fL\n    MCH | 30.00 | 27-32 | pg\n    MCHC | 37.50 | 31.5-34.5 | g/dL\n    Hct | 40 | 40-50 | \n    RDW-CV | 12 | 11.6-14.0 | %\n    RDW-SD | 40 | 39-46 | fL\nPlatelets Indices\n    Platelet Count | 300000 | 150000-410000 | /cumm\n    PCT | 35 |  | \n    MPV | 8 | 7.5-11.5 | fL\n    PDW | 9 |  | \n\nInterpretation: \n','2023-06-24','2024-08-18 07:59:28.770507','96.97',NULL,1,'temp_lab_img/ocr.png'),(4,'                                                                              Hello@flabs.in\n Flabs                                                                        +91 7253928905\n                                                                             https://www.flabs.in/\n  Name               Mr Dummy                            Patient ID   : PN2\n  Age/Gender      : 20/Male                              Report ID    : RE1\n  Referred By     : Self                                 Collection Date: 24/06/2023 08:49 PM\n  Phone No.        :                                     Report Date: 24/06/2023 09:02 PM\n                                           HAEMATOLOGY\n                                   COMPLETE BLOOD COUNT (CBC)\n TEST DESCRIPTION                       RESULT                    REF. RANGE               UNIT\n Haemoglobin                            15                        13-17                    g/dL\n Total Leucocyte Count                  5000                      4000-10000               /cumm\n Differential Leucocyte Count\n    Neutrophils                         50                       40-80\n    Lymphocytes                         40                       20-40\n    Eosinophils                                                   1-6\n    Monocytes                                                    2-10                      %\n    Basophils                           0.00                      0-1                      %\n Absolute Leucocyte Count\n    Absolute Neutrophils                2500.00                   2000-7000                /cumm\n    Absolute Lymphocytes                2000.00                   1000-3000                /cumm\n    Absolute Eosinophils                50.00                     20-500                   /cumm\n    Absolute Monocytes                  450.00                    200-1000                 /cumm\n RBC Indices\n                                                                                           Mil-\n    RBC Count                           5                        4.5-5.5\n                                                                                           lion/cumm\n    MCV                                 80.00                     81-101                   fL\n    MCH                                 30.00                    27-32                     pg\n    MCHC                                37.50                     31.5-34.5                g/dL\n    Hct                                 40                        40-50\n    RDW-CV                              12                        11.6-14.0                %\n    RDW-SD                              40                        39-46                    fL\n Platelets Indices\n    Platelet Count                      300000                    150000-410000            /cumm\n    PCT                                 35\n    MPV                                 8                        7.5-11.5                  fL\n    PDW                                 9\n Interpretation:','Hello@flabs.in\n+91 7253928905\nhttps://www.flabs.in/\n\nName: Mr Dummy\nPatient ID: PN2\nAge/Gender: 20/Male\nReport ID: RE1\nReferred By: Self\nPhone No.: \nCollection Date: 24/06/2023 08:49 PM\nReport Date: 24/06/2023 09:02 PM\n\nHAEMATOLOGY\nCOMPLETE BLOOD COUNT (CBC)\n\nTEST DESCRIPTION | RESULT | REF. RANGE | UNIT\n---|:---:|:---:|:---:|\nHaemoglobin | 15 | 13-17 | g/dL\nTotal Leucocyte Count | 5000 | 4000-10000 | /cumm\nDifferential Leucocyte Count \nNeutrophils | 50 | 40-80 | %\nLymphocytes | 40 | 20-40 | %\nEosinophils | | 1-6 | %\nMonocytes | | 2-10 | %\nBasophils | 0.00 | 0-1 | %\nAbsolute Leucocyte Count\nAbsolute Neutrophils | 2500.00 | 2000-7000 | /cumm\nAbsolute Lymphocytes | 2000.00 | 1000-3000 | /cumm\nAbsolute Eosinophils | 50.00 | 20-500 | /cumm\nAbsolute Monocytes | 450.00 | 200-1000 | /cumm\nRBC Indices\nRBC Count | 5 | 4.5-5.5 | Million/cumm\nMCV | 80.00 | 81-101 | fL\nMCH | 30.00 | 27-32 | pg\nMCHC | 37.50 | 31.5-34.5 | g/dL\nHct | 40 | 40-50 | \nRDW-CV | 12 | 11.6-14.0 | %\nRDW-SD | 40 | 39-46 | fL\nPlatelets Indices\nPlatelet Count | 300000 | 150000-410000 | /cumm\nPCT | 35 | | \nMPV | 8 | 7.5-11.5 | fL\nPDW | 9 | | \n\nInterpretation: \n','2023-06-24','2024-08-18 09:02:46.275408','96.97',NULL,1,'temp_lab_img/ocr_szZSAYR.png'),(5,'                                                                              Hello@flabs.in\n Flabs                                                                        +91 7253928905\n                                                                             https://www.flabs.in/\n  Name               Mr Dummy                            Patient ID   : PN2\n  Age/Gender      : 20/Male                              Report ID    : RE1\n  Referred By     : Self                                 Collection Date: 24/06/2023 08:49 PM\n  Phone No.        :                                     Report Date: 24/06/2023 09:02 PM\n                                           HAEMATOLOGY\n                                   COMPLETE BLOOD COUNT (CBC)\n TEST DESCRIPTION                       RESULT                    REF. RANGE               UNIT\n Haemoglobin                            15                        13-17                    g/dL\n Total Leucocyte Count                  5000                      4000-10000               /cumm\n Differential Leucocyte Count\n    Neutrophils                         50                       40-80\n    Lymphocytes                         40                       20-40\n    Eosinophils                                                   1-6\n    Monocytes                                                    2-10                      %\n    Basophils                           0.00                      0-1                      %\n Absolute Leucocyte Count\n    Absolute Neutrophils                2500.00                   2000-7000                /cumm\n    Absolute Lymphocytes                2000.00                   1000-3000                /cumm\n    Absolute Eosinophils                50.00                     20-500                   /cumm\n    Absolute Monocytes                  450.00                    200-1000                 /cumm\n RBC Indices\n                                                                                           Mil-\n    RBC Count                           5                        4.5-5.5\n                                                                                           lion/cumm\n    MCV                                 80.00                     81-101                   fL\n    MCH                                 30.00                    27-32                     pg\n    MCHC                                37.50                     31.5-34.5                g/dL\n    Hct                                 40                        40-50\n    RDW-CV                              12                        11.6-14.0                %\n    RDW-SD                              40                        39-46                    fL\n Platelets Indices\n    Platelet Count                      300000                    150000-410000            /cumm\n    PCT                                 35\n    MPV                                 8                        7.5-11.5                  fL\n    PDW                                 9\n Interpretation:','## Lab Report Summary:\n\n**Patient Information:**\n\n* Name: Mr Dummy\n* Patient ID: PN2\n* Age/Gender: 20/Male\n* Referred By: Self\n* Phone No.: \n* Collection Date: 24/06/2023 08:49 PM\n* Report Date: 24/06/2023 09:02 PM\n\n**Haematology:**\n\n**Complete Blood Count (CBC):**\n\n* Haemoglobin: 15 g/dL (Reference Range: 13-17 g/dL)\n* Total Leucocyte Count: 5000 /cumm (Reference Range: 4000-10000 /cumm)\n\n**Differential Leucocyte Count:**\n\n* Neutrophils: 50% (Reference Range: 40-80%)\n* Lymphocytes: 40% (Reference Range: 20-40%)\n* Eosinophils:  (Reference Range: 1-6%)\n* Monocytes:  (Reference Range: 2-10%)\n* Basophils: 0.00% (Reference Range: 0-1%)\n\n**Absolute Leucocyte Count:**\n\n* Absolute Neutrophils: 2500.00 /cumm (Reference Range: 2000-7000 /cumm)\n* Absolute Lymphocytes: 2000.00 /cumm (Reference Range: 1000-3000 /cumm)\n* Absolute Eosinophils: 50.00 /cumm (Reference Range: 20-500 /cumm)\n* Absolute Monocytes: 450.00 /cumm (Reference Range: 200-1000 /cumm)\n\n**RBC Indices:**\n\n* RBC Count: 5 million/cumm (Reference Range: 4.5-5.5 million/cumm)\n* MCV: 80.00 fL (Reference Range: 81-101 fL)\n* MCH: 30.00 pg (Reference Range: 27-32 pg)\n* MCHC: 37.50 g/dL (Reference Range: 31.5-34.5 g/dL)\n* Hct: 40 (Reference Range: 40-50)\n* RDW-CV: 12% (Reference Range: 11.6-14.0%)\n* RDW-SD: 40 fL (Reference Range: 39-46 fL)\n\n**Platelets Indices:**\n\n* Platelet Count: 300000 /cumm (Reference Range: 150000-410000 /cumm)\n* PCT: 35\n* MPV: 8 fL (Reference Range: 7.5-11.5 fL)\n* PDW: 9\n\n**Interpretation:**\n\n* The report does not include any interpretation. \n','2023-06-24','2024-08-18 09:19:00.448311','96.97',NULL,1,'temp_lab_img/ocr_qeFWQFG.png'),(6,'            SMART PATHOLOGY LAB                                          9123456789/8912345678\n                                                                         smartpatholab@gmail.com\n            Accurate Caring Instant\n            105-108, SMART VISION COMPLEX , HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\n Yash M. Patel                         Sample Collected At:\n Age: 21 Years                         125, Shivam Bungalow, SG Road,\n                                                                           Registered on: 02:31 PM 02 Dec 22\n                                       Mumbai\n Sex: Male\n                                                                            Collected on: 03:11 PM 02 Dec, 22\n PID: 555                              Ref. By: Dr. Hiren Shah              Reported on: 04:35 PM 02 Dec, 22\n                               C.S.F. EXAMINATION ROUTINE\n Investigation                Result                    Reference Value         Unit\n CHEMICAL EXAMINATION\n Chloride                     101.40                    98-107                  mg/dL\n Proteins                     36.80                     20-45                   mg/dL\n Sugar                       54.10                      40-80                   mg/dL\n PHYSICAL EXAMINATION\n Colour                      Colourless\n Quantity                    3 ml\n Appearance                  Clear\n Coagulum                    Present\n Blood                       Absent\n MICROSCOPIC EXAMINATION    Pathology Laboratory\n Total W.B.C. Count          5500\n Polymorphs                     sentrlogy.com\n Lymphocytes                 Absent\n Any Others\n RBC\'S                       Absent\n Z.N. Stain                  AFB not detected.\n Cram\'s Smear                Organism not detected.\n Thanks for Reference                        End of Report ****\n Medical Lab Technician                  Dr. Payal Shah                  Dr. Vimal Shah\n (DMLT, BMLT)                            (MD, Pathologist)               (MD, Pathologist)\n                                                           Generated on: 02 Dec 2022 05:00 PM Page 1 of 1\n                                              Sample Collection 9123456789','SMART PATHOLOGY LAB\n9123456789/8912345678\nsmartpatholab@gmail.com\n\nAccurate Caring Instant\n105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\n\nPatient: Yash M. Patel\nAge: 21 Years\nSex: Male\nPID: 555\n\nSample Collected At: 125, Shivam Bungalow, SG Road, Mumbai\nRegistered on: 02:31 PM 02 Dec 22\nCollected on: 03:11 PM 02 Dec, 22\nRef. By: Dr. Hiren Shah\nReported on: 04:35 PM 02 Dec, 22\n\nC.S.F. EXAMINATION ROUTINE\n\n**CHEMICAL EXAMINATION**\nChloride: 101.40 mg/dL (Reference Value: 98-107 mg/dL)\nProteins: 36.80 mg/dL (Reference Value: 20-45 mg/dL)\nSugar: 54.10 mg/dL (Reference Value: 40-80 mg/dL)\n\n**PHYSICAL EXAMINATION**\nColour: Colourless\nQuantity: 3 ml\nAppearance: Clear\nCoagulum: Present\nBlood: Absent\n\n**MICROSCOPIC EXAMINATION**\nTotal W.B.C. Count: 5500\nPolymorphs: Absent\nLymphocytes: Absent\nAny Others: Absent\nRBC\'S: Absent\nZ.N. Stain: AFB not detected.\nCram\'s Smear: Organism not detected.\n\nThanks for Reference\n\nEnd of Report ****\n\nMedical Lab Technician: (DMLT, BMLT)\nPathologist: Dr. Payal Shah (MD, Pathologist)\nPathologist: Dr. Vimal Shah (MD, Pathologist)\n\nGenerated on: 02 Dec 2022 05:00 PM\nPage 1 of 1\nSample Collection 9123456789 \n','2022-12-02','2024-08-18 11:32:27.271695','96.39',', HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578',1,'temp_lab_img/ocr_ex1.jpg'),(7,'            DRLOGY PATHOLOGY LAB                                                 0123456789 0912345678\n               Accurate Caring Instant                                           drlogypathlab@drlogy.com\n           105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\n                                                                                            www.drlogy.com\n Yash M. Patel                            Sample Collected At:\n Age: 21 Years                            125, Shivam Bungalow, SG Road,\n                                                                                Registered on: 02:31 PM 02 Dec, 2X\n Sex: Male                                Mumbai\n                                                                                 Collected on: 03:11 PM 02 Dec, 2X\n PID: 555                                 Ref. By: Dr. Hiren Shah                Reported on: 04:35 PM 02 Dec, 2X\n                                  KIDNEY FUNCTION TEST (KFT)\n Investigation                   Result                   Reference Value           Unit\n Primary Sample Type:           Serum\n Urea                           15                        13-43                      mg/dL\n Creatinine                     1.5         High          0.7-1.3                    mg/dL\n Modified Jaffe, Kinetic\n Uric Acid                      5.5                       3.5-7.2                    mg/dL\n Unicase\n Calcium, Total                 10.2                      8.7-10.4                   mg/dL\n Phosphorus                     1.4          Low          2.4-5.1                    mg/dL\n Molybdate UV\n Alkaline Phosphatase (ALP)     80                        30-120                     U/L\n IFCC\n Total Protein                  5.9                       5.7-8.2                   g/dL\n          Smart Mathologs abordory\n всо\n Sodium                         139                       136-145                    mEq/L\n Potassium                      3.9                       3.5-5.1                    mEq/L\n Indirect ISE\n Chloride                       100                       98 107                     mEq/L\n Indirect ISE\n  ADVICE: CKD RISK MAP\n  KDIGO guideline, 2012 recommends Chronic Kidney disease (CKD) should be classified based on cause, GFR\n  category and albuminuria (ACR) category. GFR & ACR category combined together reflect risk of progression and\n  helps clinician to identify individuals who are progressing at more rapid rate than anticipated.\n Thanks for Reference                        **** End of Report ****\n  Medical Lab Technician                    Dr. Payal Shah                    Dr. Vimal Shah\n  (DMLT, BMLT)                              (MD, Pathologist)                 (MD, Pathologist)\n                                                              Generated on: 02 Dec, 202X 05:00 PM Page 1 of 1\n                                                 Sample Collection                   0123456789','**DRLOGY PATHOLOGY LAB**\n\nAccurate Caring Instant\n105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX, MUMBAI-689578\ndrlogypathlab@drlogy.com\nwww.drlogy.com\n\n**Patient Information:**\n\nYash M. Patel\nAge: 21 Years\nSex: Male\nPID: 555\nSample Collected At: 125, Shivam Bungalow, SG Road, Mumbai\nRegistered on: 02:31 PM 02 Dec, 202X\nCollected on: 03:11 PM 02 Dec, 202X\nRef. By: Dr. Hiren Shah\nReported on: 04:35 PM 02 Dec, 202X\n\n**KIDNEY FUNCTION TEST (KFT)**\nPrimary Sample Type: Serum\n\n**Investigation** | **Result** | **Reference Value** | **Unit**\n------- | -------- | -------- | --------\nUrea | 15 | 13-43 | mg/dL\nCreatinine | 1.5 (High) | 0.7-1.3 | mg/dL\nUric Acid | 5.5 | 3.5-7.2 | mg/dL\nCalcium, Total | 10.2 | 8.7-10.4 | mg/dL\nPhosphorus | 1.4 (Low) | 2.4-5.1 | mg/dL\nAlkaline Phosphatase (ALP) | 80 | 30-120 | U/L\nTotal Protein | 5.9 | 5.7-8.2 | g/dL\nSodium | 139 | 136-145 | mEq/L\nPotassium | 3.9 | 3.5-5.1 | mEq/L\nChloride | 100 | 98-107 | mEq/L\n\n**ADVICE:** CKD RISK MAP\n\nKDIGO guideline, 2012 recommends Chronic Kidney disease (CKD) should be classified based on cause, GFR category and albuminuria (ACR) category. GFR & ACR category combined together reflect risk of progression and helps clinician to identify individuals who are progressing at more rapid rate than anticipated.\n\n**Thanks for Reference**\n\n**** End of Report ****\n\n**Medical Lab Technician:** (DMLT, BMLT)\n**Dr. Payal Shah:** (MD, Pathologist)\n**Dr. Vimal Shah:** (MD, Pathologist)\n\nGenerated on: 02 Dec, 202X 05:00 PM\nPage 1 of 1\nSample Collection: 0123456789 \n','2005-12-20','2024-08-18 13:35:56.441242','94.05','105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578',1,'temp_lab_img/ocr_ex2.jpg'),(8,'            SMART PATHOLOGY LAB                                          9123456789/8912345678\n                                                                         smartpatholab@gmail.com\n            Accurate Caring Instant\n            105-108, SMART VISION COMPLEX , HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\n Yash M. Patel                         Sample Collected At:\n Age: 21 Years                         125, Shivam Bungalow, SG Road,\n                                                                           Registered on: 02:31 PM 02 Dec 22\n                                       Mumbai\n Sex: Male\n                                                                            Collected on: 03:11 PM 02 Dec, 22\n PID: 555                              Ref. By: Dr. Hiren Shah              Reported on: 04:35 PM 02 Dec, 22\n                               C.S.F. EXAMINATION ROUTINE\n Investigation                Result                    Reference Value         Unit\n CHEMICAL EXAMINATION\n Chloride                     101.40                    98-107                  mg/dL\n Proteins                     36.80                     20-45                   mg/dL\n Sugar                       54.10                      40-80                   mg/dL\n PHYSICAL EXAMINATION\n Colour                      Colourless\n Quantity                    3 ml\n Appearance                  Clear\n Coagulum                    Present\n Blood                       Absent\n MICROSCOPIC EXAMINATION    Pathology Laboratory\n Total W.B.C. Count          5500\n Polymorphs                     sentrlogy.com\n Lymphocytes                 Absent\n Any Others\n RBC\'S                       Absent\n Z.N. Stain                  AFB not detected.\n Cram\'s Smear                Organism not detected.\n Thanks for Reference                        End of Report ****\n Medical Lab Technician                  Dr. Payal Shah                  Dr. Vimal Shah\n (DMLT, BMLT)                            (MD, Pathologist)               (MD, Pathologist)\n                                                           Generated on: 02 Dec 2022 05:00 PM Page 1 of 1\n                                              Sample Collection 9123456789','SMART PATHOLOGY LAB, 9123456789/8912345678, smartpatholab@gmail.com\nAccurate Caring Instant\n105-108, SMART VISION COMPLEX, HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578\n\nPatient Name: Yash M. Patel\nAge: 21 Years\nSex: Male\nPID: 555\n\nSample Collected At: 125, Shivam Bungalow, SG Road, Mumbai\nRegistered on: 02:31 PM 02 Dec 22\nCollected on: 03:11 PM 02 Dec, 22\nRef. By: Dr. Hiren Shah\nReported on: 04:35 PM 02 Dec, 22\n\n**C.S.F. EXAMINATION ROUTINE**\n\n**CHEMICAL EXAMINATION**\nChloride: 101.40 mg/dL (Reference Value: 98-107 mg/dL)\nProteins: 36.80 mg/dL (Reference Value: 20-45 mg/dL)\nSugar: 54.10 mg/dL (Reference Value: 40-80 mg/dL)\n\n**PHYSICAL EXAMINATION**\nColour: Colourless\nQuantity: 3 ml\nAppearance: Clear\nCoagulum: Present\nBlood: Absent\n\n**MICROSCOPIC EXAMINATION**\nTotal W.B.C. Count: 5500\nPolymorphs: sentrlogy.com\nLymphocytes: Absent\nAny Others: \nRBC\'S: Absent\nZ.N. Stain: AFB not detected.\nCram\'s Smear: Organism not detected.\n\nThanks for Reference\n\nMedical Lab Technician: (DMLT, BMLT)\nDr. Payal Shah: (MD, Pathologist)\nDr. Vimal Shah: (MD, Pathologist)\n\nGenerated on: 02 Dec 2022 05:00 PM\nPage 1 of 1\nSample Collection: 9123456789 \n','2022-12-02','2024-08-26 18:27:23.545762','96.39',', HEALTHCARE ROAD, OPPOSITE HEALTHCARE COMPLEX. MUMBAI-689578',1,'temp_lab_img/ocr_ex1.jpg');
/*!40000 ALTER TABLE `api_temporarylabreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_test`
--

DROP TABLE IF EXISTS `api_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Api_test_user_id_f577ca84_fk_auth_user_id` (`user_id`),
  CONSTRAINT `Api_test_user_id_f577ca84_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_test`
--

LOCK TABLES `api_test` WRITE;
/*!40000 ALTER TABLE `api_test` DISABLE KEYS */;
INSERT INTO `api_test` VALUES (1,'CBC',1),(2,'C.S.F. EXAMINATION ROUTINE',1);
/*!40000 ALTER TABLE `api_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_zoomtoken`
--

DROP TABLE IF EXISTS `api_zoomtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_zoomtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Api_zoomtoken_user_id_a450eb30_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_zoomtoken`
--

LOCK TABLES `api_zoomtoken` WRITE;
/*!40000 ALTER TABLE `api_zoomtoken` DISABLE KEYS */;
INSERT INTO `api_zoomtoken` VALUES (1,NULL,NULL,'2024-08-27 21:16:14.515100',1);
/*!40000 ALTER TABLE `api_zoomtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add Token',8,'add_tokenproxy'),(30,'Can change Token',8,'change_tokenproxy'),(31,'Can delete Token',8,'delete_tokenproxy'),(32,'Can view Token',8,'view_tokenproxy'),(33,'Can add email address',9,'add_emailaddress'),(34,'Can change email address',9,'change_emailaddress'),(35,'Can delete email address',9,'delete_emailaddress'),(36,'Can view email address',9,'view_emailaddress'),(37,'Can add email confirmation',10,'add_emailconfirmation'),(38,'Can change email confirmation',10,'change_emailconfirmation'),(39,'Can delete email confirmation',10,'delete_emailconfirmation'),(40,'Can view email confirmation',10,'view_emailconfirmation'),(41,'Can add social account',11,'add_socialaccount'),(42,'Can change social account',11,'change_socialaccount'),(43,'Can delete social account',11,'delete_socialaccount'),(44,'Can view social account',11,'view_socialaccount'),(45,'Can add social application',12,'add_socialapp'),(46,'Can change social application',12,'change_socialapp'),(47,'Can delete social application',12,'delete_socialapp'),(48,'Can view social application',12,'view_socialapp'),(49,'Can add social application token',13,'add_socialtoken'),(50,'Can change social application token',13,'change_socialtoken'),(51,'Can delete social application token',13,'delete_socialtoken'),(52,'Can view social application token',13,'view_socialtoken'),(53,'Can add lab report',14,'add_labreport'),(54,'Can change lab report',14,'change_labreport'),(55,'Can delete lab report',14,'delete_labreport'),(56,'Can view lab report',14,'view_labreport'),(57,'Can add appointment',15,'add_appointment'),(58,'Can change appointment',15,'change_appointment'),(59,'Can delete appointment',15,'delete_appointment'),(60,'Can view appointment',15,'view_appointment'),(61,'Can add profile',16,'add_profile'),(62,'Can change profile',16,'change_profile'),(63,'Can delete profile',16,'delete_profile'),(64,'Can view profile',16,'view_profile'),(65,'Can add lab report image',17,'add_labreportimage'),(66,'Can change lab report image',17,'change_labreportimage'),(67,'Can delete lab report image',17,'delete_labreportimage'),(68,'Can view lab report image',17,'view_labreportimage'),(69,'Can add temporary lab report',18,'add_temporarylabreport'),(70,'Can change temporary lab report',18,'change_temporarylabreport'),(71,'Can delete temporary lab report',18,'delete_temporarylabreport'),(72,'Can view temporary lab report',18,'view_temporarylabreport'),(73,'Can add test',19,'add_test'),(74,'Can change test',19,'change_test'),(75,'Can delete test',19,'delete_test'),(76,'Can view test',19,'view_test'),(77,'Can add zoom token',20,'add_zoomtoken'),(78,'Can change zoom token',20,'change_zoomtoken'),(79,'Can delete zoom token',20,'delete_zoomtoken'),(80,'Can view zoom token',20,'view_zoomtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$atnDeakHEFIkFgNchiSIX7$o9Fm/fWjje1oDVkhJzsgzGC7NSUC9vaSgVeCWzqcTtk=','2024-08-29 19:02:35.225380',1,'admin','','','mdraiyanrahman03@gmail.com',1,1,'2024-07-13 14:58:52.000000'),(2,'!GUtpiDlhc02N28va81MqxbA7lW2daDu7EAoY2IHt','2024-07-13 19:06:46.000000',0,'test1','Md Raiyan','Rahman','rakeyasultana0172@gmail.com',0,1,'2024-07-13 19:06:23.000000'),(3,'pbkdf2_sha256$720000$iGVdIKyD2M7zUh30qoAmf2$zxdMg8n9c4ua0Hb539foGlfWGsKb9s4ZBc5IEKBfSwM=','2024-08-21 16:27:47.328113',0,'doctor1','','','',0,1,'2024-08-21 16:19:37.801385'),(4,'pbkdf2_sha256$870000$coFn0jroNAe84XS8y2XDwc$XPzVymxfGSJ38Dd17hP+aUaiD8qdpHybYgG09NEyBKw=','2024-08-29 17:50:14.894167',0,'oncologist001','','','oncologist001@example.com',0,1,'2024-08-29 17:50:09.673912'),(5,'pbkdf2_sha256$870000$loUKhwTuJdyMyl58EZ0ImH$jrVmJUyCIwXLDBAryZh0ad6JGWnenvM6UXm3mGs9lNw=','2024-08-29 17:50:52.866955',0,'cardiologist002','','','cardiologist002@example.com',0,1,'2024-08-29 17:50:48.530557'),(6,'pbkdf2_sha256$870000$5HXECskqFcQU2BBTuRAiLT$op9hUW00YBcg7zw34G+c3atb2+9c6/F6rH2KM6AfDfQ=','2024-08-29 17:52:05.953597',0,'neurologist003','','','neurologist003@example.com',0,1,'2024-08-29 17:52:00.941639'),(7,'pbkdf2_sha256$870000$yGgIFvqAeicdFE011qDHzz$iyN+0DZm1nMFI7TgsbHdjXm8F7jwoR2I59NkTfh2gJQ=','2024-08-29 17:52:40.319355',0,'nephrologist004','','','nephrologist004@example.com',0,1,'2024-08-29 17:52:36.086642'),(8,'pbkdf2_sha256$870000$1wjBtNIwRGu2SOdxsV9D2R$ICn4pzcVl8FNGAvOhugP/4o6zlq6renl2+oInBNHNnQ=','2024-08-29 18:58:06.098308',0,'ophthalmologist005','','','ophthalmologist005@example.com',0,1,'2024-08-29 17:53:08.138979'),(9,'pbkdf2_sha256$870000$enFYdK1mBHPRwZeP09F9cB$12lmtVkTp5U1jPs6nLt8LgFBZJNiWg9XlFAgDO0DuOw=','2024-08-29 17:54:25.292556',0,'dermatologist007','','','dermatologist007@example.com',0,1,'2024-08-29 17:54:20.422676'),(10,'pbkdf2_sha256$870000$c46yR0KXuqLiQ2a6adKdQz$oIiVKRge0vVS2N0GvnPWf6VJyaawmiMaQSsHMHJ3v7M=','2024-08-29 17:55:15.890613',0,'orthopedic_surgeon008','','','orthopedic_surgeon008@example.com',0,1,'2024-08-29 17:55:10.250262'),(11,'pbkdf2_sha256$870000$gV6H5Qp8YYNAUs5rUFimyd$JgGm5gF03HinTJcH4kRoFR0gPCkJsMpPSBNGVz5xus4=','2024-08-29 17:56:05.825887',0,'pediatrician009','','','pediatrician009@example.com',0,1,'2024-08-29 17:56:00.631009'),(12,'pbkdf2_sha256$870000$mr4F0SPQ85ysbKIy7bycAb$7jv3TlamVi+KBd5uLGF1AMG//6s65mFa/eaoC52D8yI=','2024-08-29 17:57:31.246834',0,'psychiatrist010','','','psychiatrist010@example.com',0,1,'2024-08-29 17:57:26.707523'),(13,'pbkdf2_sha256$870000$pyyHaWCctDyh3KG1Zs0kN2$elVCtNwdQnSlshvRsm8Q99OPAhXWp3lVutdP+2htOf4=','2024-08-29 17:58:02.798801',0,'endocrinologist011','','','endocrinologist011@example.com',0,1,'2024-08-29 17:57:58.182410'),(14,'pbkdf2_sha256$870000$9Qeh53bkBHVB0Fvkn043Vz$S6Gk04UhdiMV7/Neif9Sz8N5xqYk4DprQ6q7EVosYgo=','2024-08-29 17:58:31.937180',0,'pulmonologist012','','','pulmonologist012@example.com',0,1,'2024-08-29 17:58:27.350954'),(15,'pbkdf2_sha256$870000$zZETIaS1Rqyr953DjgykDf$d1Gxlp4oiuNtA7VhW9VffmH2VLIkNd2YBUOA++3EJP4=','2024-08-29 18:00:38.049755',0,'ent013','','','ent013@example.com',0,1,'2024-08-29 18:00:31.813475'),(16,'pbkdf2_sha256$870000$fXIzxVinWr7PM60t2gihRb$rp2Pezd69+hR/UJ8hDdUUTfavNWT3drZKoiXnUX6jxE=','2024-08-29 18:01:05.014884',0,'vascular_surgeon014','','','vascular_surgeon014@example.com',0,1,'2024-08-29 18:00:59.685790'),(17,'pbkdf2_sha256$870000$JNefWTlxMkiqJkn6YHZkzd$vQKgsAlwq9xw4fMIEoxrdiMQhaG7qHFLP2uaNt7zfEQ=','2024-08-29 18:01:32.490681',0,'rheumatologist015','','','rheumatologist015@example.com',0,1,'2024-08-29 18:01:26.907089'),(18,'pbkdf2_sha256$870000$KdgA7amt5NgyC4WeXQK71d$TGi6xFh7K0AeoHbuEOodRvYxJoHkRUYCVL9blkeEBH8=','2024-08-29 18:03:06.102258',0,'gastroenterologist016','','','gastroenterologist016@example.com',0,1,'2024-08-29 18:03:00.633061'),(19,'pbkdf2_sha256$870000$b9f6qdjudlikjwYFYUh7o1$coQrbiSHU1wAHUN9Navy2SaK1Wz4cmgg/2/QNnn9VjE=','2024-08-29 18:03:34.590872',0,'hematologist017','','','hematologist017@example.com',0,1,'2024-08-29 18:03:29.038953'),(20,'pbkdf2_sha256$870000$9O3qWtE6g9eK2EK2O6Am7V$zx0bjnokm5zgyHzbs86EKAHJG5Tw3qaw2uJISmwMjO4=','2024-08-29 18:04:04.133816',0,'urologist018','','','urologist018@example.com',0,1,'2024-08-29 18:03:58.328951');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-07-13 16:10:48.867994','1','admin',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(2,'2024-07-13 16:23:31.717629','1','Google',1,'[{\"added\": {}}]',12,1),(3,'2024-07-13 16:27:06.928524','1','Google',2,'[]',12,1),(4,'2024-07-13 16:28:32.783687','1','admin',2,'[]',4,1),(5,'2024-07-13 19:01:52.735313','1','Google',2,'[{\"changed\": {\"fields\": [\"Client id\", \"Secret key\"]}}]',12,1),(6,'2024-07-13 19:07:09.975195','2','test1',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(7,'2024-07-16 07:53:31.746283','1','admin - patient',1,'[{\"added\": {}}]',16,1),(8,'2024-07-16 07:53:51.899202','2','test1 - doctor',1,'[{\"added\": {}}]',16,1),(9,'2024-07-29 16:46:52.291086','4','Lab Report 4 by admin on 2024-07-27',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(10,'2024-08-16 15:53:37.762604','6','Lab Report 6 by admin on 2024-01-20',2,'[{\"changed\": {\"fields\": [\"Report date\"]}}]',14,1),(11,'2024-08-16 15:54:06.511120','5','Lab Report 5 by admin on 2024-04-20',2,'[{\"changed\": {\"fields\": [\"Report data\", \"Report date\"]}}]',14,1),(12,'2024-08-16 15:54:48.018226','4','Lab Report 4 by admin on 2024-07-27',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(13,'2024-08-16 15:55:10.836713','3','Lab Report 3 by admin on 2024-07-27',2,'[]',14,1),(14,'2024-08-16 15:57:13.401421','3','Lab Report 3 by admin on 2024-08-27',2,'[{\"changed\": {\"fields\": [\"Report data\", \"Report date\"]}}]',14,1),(15,'2024-08-16 15:58:24.570113','2','Lab Report 2 by admin on 2024-05-27',2,'[{\"changed\": {\"fields\": [\"Report data\", \"Report date\"]}}]',14,1),(16,'2024-08-17 15:16:47.296828','4','Lab Report 4 by admin on 2024-07-27',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(17,'2024-08-17 15:18:50.240076','5','Lab Report 5 by admin on 2024-04-20',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(18,'2024-08-17 15:20:35.647952','5','Lab Report 5 by admin on 2024-04-20',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(19,'2024-08-17 15:22:54.184131','6','Lab Report 6 by admin on 2024-01-20',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(20,'2024-08-17 15:23:12.298874','6','Lab Report 6 by admin on 2024-01-20',2,'[]',14,1),(21,'2024-08-17 15:25:26.314769','6','Lab Report 6 by admin on 2024-01-20',3,'',14,1),(22,'2024-08-17 15:36:22.666081','2','Lab Report 2 by admin on 2024-05-27',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(23,'2024-08-17 16:54:31.083346','2','Lab Report 2 by admin on 2024-05-27',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(24,'2024-08-17 16:54:58.660336','2','Lab Report 2 by admin on 2024-05-27',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(25,'2024-08-18 13:39:24.587186','11','Lab Report 11 by admin on 2005-12-20',2,'[{\"changed\": {\"fields\": [\"Sample\"]}}]',14,1),(26,'2024-08-18 14:43:13.992872','5','Lab Report 5 by admin on 2024-04-20',2,'[{\"changed\": {\"fields\": [\"Test name\"]}}]',14,1),(27,'2024-08-19 07:42:29.884172','5','Lab Report 5 by admin on 2024-04-20',2,'[{\"changed\": {\"fields\": [\"Report data\"]}}]',14,1),(28,'2024-08-19 08:01:53.378238','1','CBC',1,'[{\"added\": {}}]',19,1),(29,'2024-08-19 08:02:17.809024','8','Lab Report 8 for CBC by admin on 2023-06-24',2,'[{\"changed\": {\"fields\": [\"Test\", \"Sample\"]}}]',14,1),(30,'2024-08-19 08:02:24.220198','7','Lab Report 7 for CBC by admin on 2023-06-24',2,'[{\"changed\": {\"fields\": [\"Test\"]}}]',14,1),(31,'2024-08-19 08:02:33.365000','5','Lab Report 5 for CBC by admin on 2024-04-20',2,'[{\"changed\": {\"fields\": [\"Test\", \"Sample\"]}}]',14,1),(32,'2024-08-19 08:10:43.574789','4','Lab Report  for CBC by admin on 2024-07-27',2,'[{\"changed\": {\"fields\": [\"Test name\"]}}]',14,1),(33,'2024-08-19 08:11:50.484887','3','Lab Report  for CBC by admin on 2024-08-27',2,'[{\"changed\": {\"fields\": [\"Test name\"]}}]',14,1),(34,'2024-08-19 08:14:27.110559','2','Lab Report  for CBC by admin on 2024-05-27',2,'[{\"changed\": {\"fields\": [\"Test name\"]}}]',14,1),(35,'2024-08-19 16:17:28.076362','10','Image 10 for Lab Report 11',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(36,'2024-08-19 16:17:55.917794','9','Image 9 for Lab Report 10',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(37,'2024-08-19 16:18:13.037297','7','Image 7 for Lab Report 8',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(38,'2024-08-19 16:18:56.113000','8','Image 8 for Lab Report 9',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(39,'2024-08-19 16:19:07.683692','6','Image 6 for Lab Report 7',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(40,'2024-08-19 16:19:50.958881','3','Image 3 for Lab Report 3',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(41,'2024-08-19 16:20:03.415405','2','Image 2 for Lab Report 2',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(42,'2024-08-19 16:20:14.836784','1','Image 1 for Lab Report 1',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',17,1),(43,'2024-08-21 15:12:36.946088','1','Appointment on 2024-07-19 with Dr. test1',2,'[{\"changed\": {\"fields\": [\"Apointment time\"]}}]',15,1),(44,'2024-08-21 16:19:38.352571','3','doctor1',1,'[{\"added\": {}}]',4,1),(45,'2024-08-21 16:19:51.755781','3','doctor1 - doctor',1,'[{\"added\": {}}]',16,1),(46,'2024-08-21 16:20:16.109416','2','Appointment on 2024-08-22 with Dr. doctor1',1,'[{\"added\": {}}]',15,1),(47,'2024-08-21 16:27:19.918202','3','Appointment on 2024-08-23 with Dr. doctor1',1,'[{\"added\": {}}]',15,1),(48,'2024-08-26 16:52:40.785210','4','Appointment on 2024-08-26 with Dr. doctor1',1,'[{\"added\": {}}]',15,1),(49,'2024-08-27 12:27:04.196837','5','Appointment on 2024-08-27 with Dr. doctor1',1,'[{\"added\": {}}]',15,1),(50,'2024-08-27 14:07:09.205562','5','Appointment on 2024-08-27 with Dr. doctor1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',15,1),(51,'2024-08-29 17:17:24.765678','3','doctor1 - doctor',2,'[{\"changed\": {\"fields\": [\"Profile picture\", \"Birth\", \"Specialization\", \"Education\"]}}]',16,1),(52,'2024-08-29 17:17:37.803013','2','test1 - doctor',2,'[{\"changed\": {\"fields\": [\"Profile picture\", \"Birth\", \"Specialization\", \"Education\"]}}]',16,1),(53,'2024-08-29 18:11:59.338072','4','cardiologist002 - doctor',1,'[{\"added\": {}}]',16,1),(54,'2024-08-29 18:12:36.253567','5','dermatologist007 - doctor',1,'[{\"added\": {}}]',16,1),(55,'2024-08-29 18:13:19.589933','6','endocrinologist011 - doctor',1,'[{\"added\": {}}]',16,1),(56,'2024-08-29 18:16:37.893534','7','ent013 - doctor',1,'[{\"added\": {}}]',16,1),(57,'2024-08-29 18:17:56.185629','8','gastroenterologist016 - doctor',1,'[{\"added\": {}}]',16,1),(58,'2024-08-29 18:18:28.982063','9','hematologist017 - doctor',1,'[{\"added\": {}}]',16,1),(59,'2024-08-29 18:18:55.835355','10','nephrologist004 - doctor',1,'[{\"added\": {}}]',16,1),(60,'2024-08-29 18:19:07.319262','2','test1 - patient',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',16,1),(61,'2024-08-29 18:19:13.972033','3','doctor1 - patient',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',16,1),(62,'2024-08-29 18:38:34.837779','1','admin - patient',2,'[{\"changed\": {\"fields\": [\"Birth\", \"Specialization\", \"Education\"]}}]',16,1),(63,'2024-08-29 18:53:13.146245','1','admin - patient',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'account','emailaddress'),(10,'account','emailconfirmation'),(1,'admin','logentry'),(15,'Api','appointment'),(14,'Api','labreport'),(17,'Api','labreportimage'),(16,'Api','profile'),(18,'Api','temporarylabreport'),(19,'Api','test'),(20,'Api','zoomtoken'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(11,'socialaccount','socialaccount'),(12,'socialaccount','socialapp'),(13,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-07-13 14:58:24.287771'),(2,'auth','0001_initial','2024-07-13 14:58:25.278413'),(3,'admin','0001_initial','2024-07-13 14:58:25.457117'),(4,'admin','0002_logentry_remove_auto_add','2024-07-13 14:58:25.466570'),(5,'admin','0003_logentry_add_action_flag_choices','2024-07-13 14:58:25.480930'),(6,'contenttypes','0002_remove_content_type_name','2024-07-13 14:58:25.589007'),(7,'auth','0002_alter_permission_name_max_length','2024-07-13 14:58:25.683843'),(8,'auth','0003_alter_user_email_max_length','2024-07-13 14:58:25.716365'),(9,'auth','0004_alter_user_username_opts','2024-07-13 14:58:25.725539'),(10,'auth','0005_alter_user_last_login_null','2024-07-13 14:58:25.820399'),(11,'auth','0006_require_contenttypes_0002','2024-07-13 14:58:25.824711'),(12,'auth','0007_alter_validators_add_error_messages','2024-07-13 14:58:25.834010'),(13,'auth','0008_alter_user_username_max_length','2024-07-13 14:58:25.928467'),(14,'auth','0009_alter_user_last_name_max_length','2024-07-13 14:58:26.012215'),(15,'auth','0010_alter_group_name_max_length','2024-07-13 14:58:26.037458'),(16,'auth','0011_update_proxy_permissions','2024-07-13 14:58:26.048430'),(17,'auth','0012_alter_user_first_name_max_length','2024-07-13 14:58:26.136897'),(18,'authtoken','0001_initial','2024-07-13 14:58:26.244560'),(19,'authtoken','0002_auto_20160226_1747','2024-07-13 14:58:26.279392'),(20,'authtoken','0003_tokenproxy','2024-07-13 14:58:26.285424'),(21,'authtoken','0004_alter_tokenproxy_options','2024-07-13 14:58:26.293562'),(22,'sessions','0001_initial','2024-07-13 14:58:26.350492'),(23,'account','0001_initial','2024-07-13 16:12:08.272550'),(24,'account','0002_email_max_length','2024-07-13 16:12:08.301889'),(25,'account','0003_alter_emailaddress_create_unique_verified_email','2024-07-13 16:12:08.352558'),(26,'account','0004_alter_emailaddress_drop_unique_email','2024-07-13 16:12:08.422272'),(27,'account','0005_emailaddress_idx_upper_email','2024-07-13 16:12:08.456898'),(28,'socialaccount','0001_initial','2024-07-13 16:12:09.017904'),(29,'socialaccount','0002_token_max_lengths','2024-07-13 16:12:09.087691'),(30,'socialaccount','0003_extra_data_default_dict','2024-07-13 16:12:09.101196'),(31,'socialaccount','0004_app_provider_id_settings','2024-07-13 16:12:09.272239'),(32,'socialaccount','0005_socialtoken_nullable_app','2024-07-13 16:12:09.465490'),(33,'socialaccount','0006_alter_socialaccount_extra_data','2024-07-13 16:12:09.661605'),(34,'Api','0001_initial','2024-07-16 07:46:35.585777'),(35,'Api','0002_labreport_hospital_address_labreport_ocr_conf_and_more','2024-07-30 13:05:50.495895'),(36,'Api','0003_temporarylabreport_image','2024-07-30 15:06:56.876240'),(37,'Api','0004_labreport_sample_labreport_test_name','2024-08-18 07:58:28.160868'),(38,'Api','0005_remove_labreport_test_name_test_labreport_test','2024-08-19 07:56:32.296611'),(39,'Api','0006_rename_test_labreport_test_name','2024-08-19 08:07:24.145098'),(40,'Api','0007_alter_labreport_user_alter_temporarylabreport_user','2024-08-21 15:11:44.076612'),(41,'Api','0008_appointment_apointment_time_and_more','2024-08-21 15:11:44.377912'),(42,'Api','0009_zoomtoken','2024-08-26 15:27:50.526821'),(43,'Api','0010_alter_zoomtoken_access_token_and_more','2024-08-27 14:15:55.624963'),(44,'Api','0011_alter_zoomtoken_access_token_and_more','2024-08-28 17:44:27.856054'),(45,'Api','0012_rename_zoom_join_link_appointment_join_link_and_more','2024-08-28 17:44:28.150337'),(46,'Api','0013_profile_birth_profile_education_and_more','2024-08-28 17:44:28.285934'),(47,'account','0006_emailaddress_lower','2024-08-28 17:44:28.344901'),(48,'account','0007_emailaddress_idx_email','2024-08-28 17:44:28.545087'),(49,'account','0008_emailaddress_unique_primary_email_fixup','2024-08-28 17:44:28.575070'),(50,'account','0009_emailaddress_unique_primary_email','2024-08-28 17:44:28.599056');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('10gbkq8b6ofwvvy11d5zpgo9vcga0uue','.eJxVjM0OwiAQhN-FsyFdKD_r0bvPQFhYpWogKe3J-O62SQ96m8z3zbxFiOtSwtp5DlMWZwHi9NtRTE-uO8iPWO9NplaXeSK5K_KgXV5b5tflcP8OSuxlW7PxXinQmLxxCRyAszenGOxASGhZo99CTAxjRp8NoRo0aQujjwqU-HwBuFM2wA:1sSelN:8EGQ21PZv4ddlLjMUyZWp_SCk3ugL-5C-aNClnyBSU8','2024-07-27 15:34:17.522730'),('2rvan8n7xrkwgd0cdno8v32x22v7pz1s','.eJxVkM1ugzAQhN9lzwixNviHW_MaVYXW9lagBhNho6SK8u7FKRduo5nZT6N9Anm_bDEPtOWRY5485WmJw8x5XEKC_vMJ_xp6uFFK92UNUAFl6FGLVrYGtapFJ22jKtgSr5Fm3ssU5inC66uCN3so0TAVDMLJc-R_OJaArtdi18em-t054lR_nBZejqsTaqQ07hzujBECpfWm0x417hO_tWBUjbPOKpbW7II8YxusCZ2zopFOKmwNCRQFmjil8gh-3Kb1F_rm9QcyUmNI:1shBjM:_EF5HSNFTrFoU2mbUt5rvMr34BmFJNevjso7CkIzGbo','2024-09-05 17:36:16.276527'),('8q8wuwrhiyeln9kuwfseuwgzfcae0zy1','.eJxVjMEOgyAQRP-Fc2NcUGB7qz9ilmUbTA0mFU5N_73YeGhvM_Nm5qVmqiXNdZfnvER1VaAuv1kgfkg-AK3rEXfEvNVcum_nxHt3a05yWZjKsuXpXP1dJdpT-5HRe63BIPvRMTgAZ-9OC9g-YEArBn0TxAJDRB_HgLo3wVgYPGnQ6v0BkE87NA:1sZ9pZ:rmyGz1MTGmMjFUzax305NzPnq7sNtLuDpaV9sfc7rFc','2024-08-14 13:57:29.268237'),('bjcdnh001mm7h61fjd9kspfjexcdcnvc','.eJxVjM0OwiAQhN-FsyFdKD_r0bvPQFhYpWogKe3J-O62SQ96m8z3zbxFiOtSwtp5DlMWZwHi9NtRTE-uO8iPWO9NplaXeSK5K_KgXV5b5tflcP8OSuxlW7PxXinQmLxxCRyAszenGOxASGhZo99CTAxjRp8NoRo0aQujjwqU-HwBuFM2wA:1sSehE:rKjSL0DujiQqGLQCA1EbZWRDEhU0YaBh7lnC_9SxMkg','2024-07-27 15:30:00.082163'),('cb1fsxq5j3c7p2sc2c22kpmicarxxufe','.eJxVkM1uhDAMhN_FZ4RwgPxw675GVSEncUXUJaxI0G612ncv2XLhZs2MP439BHJu2WIeacsTxxwc5bDEceY8LT7B8PmE_xkGuFFK92X1UAFlGFAJFJ2UQtayE30vKtgSr5Fm3sPk5xDh9VXBmz0WawwFg3DSLLkfjsWg67XI9dGpfmcOO9Ufp4aXY-uEmihNO4d7rYXA1jjdK4cKUclvJRhlY401kluj94EcY-eN9r01omltK7HTtN9UoIlTKo_gxy2svzA0rz8sAWNB:1sUAsM:U8mJYyef456325OjPaEase28jzum9IAngDsItjwaBws','2024-07-31 20:03:46.676630'),('crqq6i0pgz32sbvq1cdgtkoucb6660ds','.eJxVjM0OwiAQhN-FsyFdKD_r0bvPQFhYpWogKe3J-O62SQ96m8z3zbxFiOtSwtp5DlMWZwHi9NtRTE-uO8iPWO9NplaXeSK5K_KgXV5b5tflcP8OSuxlW7PxXinQmLxxCRyAszenGOxASGhZo99CTAxjRp8NoRo0aQujjwqU-HwBuFM2wA:1sSeoe:yEJlPFsxv8ZUJ1GT8dPM6uX-LaC341XgrjLBruGF4GM','2024-07-27 15:37:40.121801'),('cvg09wkocfzddd2z9dvuwzcjcyoab93b','.eJxVkM1ugzAQhN9lzwixNviHW_MaVYUWeyusBhNho6SK8u7FKRduo5nZT6N9Ajm3bDEPtOWJYw6OcljiMHOeFp-g_3zCv4YebpTSfVk9VEAZetRCyNaYtqtbqwWqCrbEa6SZ9zL5OUR4fVXwZg8lGkLBIJy8kdwPxxLQ9Vrs-thUvztHnOqP08LLcXVCTZSmncOdMUKgtM502qFG1OpbC0bVjHa0iqU1uyDH2HprfDda0chRKmwNCRQFmjil8gh-3ML6C33z-gM2zGNN:1sYnc5:lwglNdyzKld-sXZWM0W9pmidjOB4EeEYlvL8oeHzyOQ','2024-08-13 14:14:05.511374'),('favmfcam17r6t8zujsikfnnkvrcuxol8','.eJxVjMEOgjAQRP-lZ0MoS1nWm_4I2d2WtJGURNqT8d8Fw0GP82bmvczEtcSpbuE5JW-uxprLLxPWR8hHwcty4IZV15pL892c9dbc9hRyScolrfl-vv5Ukbe4e8Rixzo7hBYIMIxI4LnDlsSSQ5xBwPU6MNDYBosDeE89oTCKeD-a9weZeTvQ:1sjjdc:6EoZl5bPBTAjrkb6mwec-ar2JV8A_FI4n_pXluzX1v4','2024-09-12 18:12:52.414812'),('heljbu05ckfw7wo2tt4izfa5eduzeu8d','.eJxVkM1qwzAQhN9lz8ZYP9aPb81rlGJW0haLxnKwZJIS8u61Ul98G2ZmP4Z9Anq_bKmMuJWJUokeS1zSOFOZlpBh-HzCv4YBbpjzfVkDNIAFBqa55MIqw1uhTCeNbGDLtCacaW9jmGOC11cDb_hYozFWDoOT59D_UKoBXq_Vbo9R7btzxLn9OE28HFcn1IR52jnUG8M5E9abXnumGdPqW3NiqnPWWUXCml2gJyaDNaF3lnfCCcWkQc54hWbKuX6CHre4_sLQvf4AfgpjgQ:1sgjVS:iZnsRBfpYwuRDF7j6h2v-MGedK4sXj6odrGKmba3g9k','2024-09-04 11:28:02.399145'),('k149qwh6teh72foawlukebagowbhga5n','.eJxVkMFugzAQRP9lzwixNmCbW_MbVYXW9lZYDSbCRkkV5d-LUy7cRjOzT6N9Ajm3bDGPtOWJYw6OcljiOHOeFp9g-HzCv4YBbpTSfVk9VEAZBlRCGtQosdZNh11bwZZ4jTTzXiY_hwivrwre7LFEYygYhJNnyf1wLAFdr8Wuj031u3PEqf44LbwcVyfURGnaOdxpLQRK43SnHCpE1X8rwdg31ljTszR6F-QYW2-076wRjbSyx1aTQFGgiVMqj-DHLay_MDSvPypXYz8:1sfNr9:kU5rZ8YUrpOiTIYecd_PvH8Lozz8N4WLDsaNK-K4_E8','2024-08-31 18:08:51.819814'),('l1l15emgrd214vnaf0qeew1otudcvbz2','.eJxVjM0OwiAQhN-FsyFdKD_r0bvPQFhYpWogKe3J-O62SQ96m8z3zbxFiOtSwtp5DlMWZwHi9NtRTE-uO8iPWO9NplaXeSK5K_KgXV5b5tflcP8OSuxlW7PxXinQmLxxCRyAszenGOxASGhZo99CTAxjRp8NoRo0aQujjwqU-HwBuFM2wA:1sSecb:qGN8t7cMmduLR5GSrKx33vN9UMUPwuzTqzLxUImQaGg','2024-07-27 15:25:13.839826'),('nl5pr6w3hawhswsfj6s1cbcxsmmhvwlu','.eJxVkM1ugzAQhN9lzwixNviHW_MaVYXW9lagBhNho6SK8u7FKRduo5nZT6N9Anm_bDEPtOWRY5485WmJw8x5XEKC_vMJ_xp6uFFK92UNUAFl6FELgVoq29aNsVKiqmBLvEaaeW9TmKcIr68K3vChRMNUOAgnz5H_4VgCul6LXR-j6nfniFP9cZp4Oa5OqJHSuHO4M2bfJq03nfaoEbX61oJRNc46q1haswvyjG2wJnTOikY6qbA1JFAUaOKUyif4cZvWX-ib1x95iWN8:1sY434:rExt1ZtiM_SQ6yiauZELT870_xE461O3GPQ68_E1j8w','2024-08-11 13:34:54.102296'),('qe9zdbvsqaxrga675pctd07zlwaa1brk','.eJxVkM1uhDAMhN_FZ4Rwsvnj1n2NqkJO4grUJaxIUFut9t1Ltly4WTPjT2M_gEJYtlQG2srIqUyByrSkYeYyLjFD__6A_xl6uFPO38saoQEq0KMR0qJxomuVMEpJ3cCWeU00856mOE8Jnh8NvOBDtYapchBOmqfwxakadLtVuT1Kta_MYef27VTxemydUCPlceewslYIlC5YZQIaRKM_jWDUnXfeaZbO7gMFxkt0Niq_HyG91HixJFBUaOac6yf45z6tv9B3zz96eGN9:1sexmq:UXdrmZMJTGDP-kAtvvR2nf5IW7nJ-3dqABu9LWEt0dc','2024-08-30 14:18:40.544982'),('srfkuhipbg2t0d0p12lng3q24dcq63lp','.eJxVkM1ugzAQhN9lzwjh2Hgxt-Y1ogqtfyKsBoNYo7aK8u7FKRduq5nZT6N5Ajk3bykPtOUxpBwd5TinYQp5nD1Df3vC_w09LMT8Pa8eKqAMvcCLMgqFFrVutTKigo3DmmgKe5j8FBO8Pit4s4diDbFgBJw0S-4rpGLQ41Hk-uhUvzOHzfXHqeH1-DqhRuJx59i9Gbl7i7KRRmLo0EhPF2yMFaZFvEsrW-U0SdM1QaCW3htl0BJa631XoByYyxDhZ4nrL_TN6w9MNmPp:1sjhYP:qDq8z7B6MNzIOwzw0VcM5lruCQcQQhy_KO96yaB__dg','2024-09-12 15:59:21.746556'),('sypss2i5v796ose3knuglay8vkgkm4ys','.eJxVjMEOgjAQRP-lZ0MoS1nWm_4I2d2WtJGURNqT8d8Fw0GP82bmvczEtcSpbuE5JW-uxprLLxPWR8hHwcty4IZV15pL892c9dbc9hRyScolrfl-vv5Ukbe4e8Rixzo7hBYIMIxI4LnDlsSSQ5xBwPU6MNDYBosDeE89oTCKeD-a9weZeTvQ:1sjK3R:Auzjg_5dp7MW7c-DD_OHLsMRpQCp_SmwH3JEHR-07-g','2024-09-11 14:53:49.412286'),('vvsvq1ec2i5sqp0gdfmtehnagetr910k','.eJxVkM1ugzAQhN9lzwhhFmdtbs1rRBVa_0RYDQZho7aK8u7FKRduq5nZT6N5Als7bzEPvOXRxxws5zDHYfJ5nF2C_vaE_xt6WDil73l1UAFn6AW1nZZKSFm3ApGEqmBLfo08-T3NbgoRXp8VvOFDsYZQOAJOmmH75WMx-PEocn2Uqt-Zw071x6ni9fg6oUZO484xezW2d0nYoEbyijQ6bqnRRmhJdEeDsrMXRq0aL-iCzulOk2EyxjlVoMmnVJbwP0tYf6FvXn-PEWQY:1sjkPj:2pGafQwRZJyHEdGfNXwLA6zzLVSn7WepmFmjoZ3Sg-8','2024-09-12 19:02:35.230759'),('z9n38ayutop3ddllv9m4nw3ygdh829c6','.eJxVkM1ugzAQhN9lzwixNviHW_MaVYXW9lagBhNho6SK8u7FKRduo5nZT6N9Anm_bDEPtOWRY5485WmJw8x5XEKC_vMJ_xp6uFFK92UNUAFl6FELgVoqK-sOm9ZoWcGWeI00896mME8RXl8VvOFDiYapcBBOniP_w7EEdL0Wuz5G1e_OEaf64zTxclydUCOlcedwZ8y-TVpvOu1RI2r1rQWjapx1VrG0ZhfkGdtgTeicFY10UmFrSKAo0MQplU_w4zatv9A3rz92zmN5:1sY433:Cfjd8kR0Iq273JgG9nhV0vbcUJyL9fV5-ObT7879OE0','2024-08-11 13:34:53.562810');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` json NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'google','116374831145712298754','2024-07-13 19:06:46.220664','2024-07-13 19:06:46.220664','{\"aud\": \"856061925266-704qtagfr6cudb85gnsbf41nm6c0e3bg.apps.googleusercontent.com\", \"azp\": \"856061925266-704qtagfr6cudb85gnsbf41nm6c0e3bg.apps.googleusercontent.com\", \"exp\": 1720901183, \"iat\": 1720897583, \"iss\": \"https://accounts.google.com\", \"sub\": \"116374831145712298754\", \"name\": \"Md Raiyan Rahman\", \"email\": \"mdraiyanrahman03@gmail.com\", \"at_hash\": \"BzsbIBkgiyRZTCL_Aye40Q\", \"picture\": \"https://lh3.googleusercontent.com/a/ACg8ocIm1fQdlQ6JxplGPu3Jopzz0ngkUSx80W5Resp3lxT18dEhXA=s96-c\", \"given_name\": \"Md Raiyan\", \"family_name\": \"Rahman\", \"email_verified\": true}',2);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'google','Google','856061925266-704qtagfr6cudb85gnsbf41nm6c0e3bg.apps.googleusercontent.com','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','','','{}');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30  2:16:01
