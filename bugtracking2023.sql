CREATE DATABASE  IF NOT EXISTS `bugtracking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bugtracking`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: bugtracking
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `moduleId` int NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(50) DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `estimatedHours` int DEFAULT NULL,
  `totalUtilizedHours` int DEFAULT NULL,
  `documentUrl` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  KEY `projectId` (`projectId`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`),
  CONSTRAINT `module_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'bug',1,3,89,90,'bug tracking',' bug tracking track the bug'),(2,'online shoping',2,2,890,456,'online shoping','online shoping');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `projectId` int NOT NULL AUTO_INCREMENT,
  `projectName` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `technologyId` int DEFAULT NULL,
  `estimatedHours` int DEFAULT NULL,
  `startDate` varchar(30) DEFAULT NULL,
  `completionDate` varchar(30) DEFAULT NULL,
  `utilizedHours` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  PRIMARY KEY (`projectId`),
  KEY `technologyId` (`technologyId`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`technologyId`) REFERENCES `technology` (`technologyId`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`),
  CONSTRAINT `project_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'bug tracking',' bug tracking track the bug',2,89,'2022-06-26','2023-05-20',24,2,0),(2,'onlne shoping','online shop',5,89,'2022-12-31','2023-03-26',22,3,0),(3,'hospital managment','manage the docter,staff ',6,89,'2023-02-06','2023-06-06',65,1,0),(4,'onlne shoping','',5,89,'','',NULL,1,1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectuser`
--

DROP TABLE IF EXISTS `projectuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectuser` (
  `projectUserId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `assignStatus` int DEFAULT NULL,
  PRIMARY KEY (`projectUserId`),
  KEY `projectId` (`projectId`),
  KEY `userId` (`userId`),
  CONSTRAINT `projectuser_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`),
  CONSTRAINT `projectuser_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectuser`
--

LOCK TABLES `projectuser` WRITE;
/*!40000 ALTER TABLE `projectuser` DISABLE KEYS */;
INSERT INTO `projectuser` VALUES (1,6,2,2),(3,4,3,2);
/*!40000 ALTER TABLE `projectuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `statusId` int NOT NULL AUTO_INCREMENT,
  `statusName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Completed'),(2,'Pending'),(3,'inProgress'),(5,'rejected');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskId` int NOT NULL AUTO_INCREMENT,
  `taskName` varchar(50) DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `estimatedHours` int DEFAULT NULL,
  `totalUtilizedHours` int DEFAULT NULL,
  `documentUrl` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `moduleId` int DEFAULT NULL,
  PRIMARY KEY (`taskId`),
  KEY `projectId` (`projectId`),
  KEY `statusId` (`statusId`),
  KEY `moduleId` (`moduleId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`moduleId`) REFERENCES `module` (`moduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'find bug',1,890,123,'bug tracking',' bug tracking track the bug',NULL,NULL),(2,'timeline maintenance',2,89,67,'onlineshoping','online shoping',NULL,NULL),(3,'find bug',1,56,56,'bug tracking',' bug tracking track the bug',3,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskuser`
--

DROP TABLE IF EXISTS `taskuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskuser` (
  `taskUserId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `taskId` int DEFAULT NULL,
  `assignStatus` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `utilizedHours` int DEFAULT NULL,
  PRIMARY KEY (`taskUserId`),
  KEY `statusId` (`statusId`),
  KEY `taskId` (`taskId`),
  KEY `userId` (`userId`),
  CONSTRAINT `taskuser_ibfk_1` FOREIGN KEY (`statusId`) REFERENCES `status` (`statusId`),
  CONSTRAINT `taskuser_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `task` (`taskId`),
  CONSTRAINT `taskuser_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskuser`
--

LOCK TABLES `taskuser` WRITE;
/*!40000 ALTER TABLE `taskuser` DISABLE KEYS */;
INSERT INTO `taskuser` VALUES (2,5,2,2,1,NULL),(3,6,1,1,2,90),(4,6,2,1,2,65);
/*!40000 ALTER TABLE `taskuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology` (
  `technologyId` int NOT NULL AUTO_INCREMENT,
  `technologyName` varchar(30) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`technologyId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,'android',0),(2,'java',0),(3,'',1),(4,'fggfhgj',1),(5,'php',0),(6,'Mean',0);
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `number` varchar(30) DEFAULT NULL,
  `imageUrl` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'seema','parmar','cmaparmar23@gmail.com','1234',2,'9VrGdh',NULL,NULL,NULL),(2,'sita','ram','sita@gmail.com','sita123',2,NULL,NULL,NULL,NULL),(3,'admin','admin','admin@gmail.com','1234',1,'1cRop8',NULL,NULL,NULL),(4,'monika','parmar','monika26062001@gmail.com','monika123',2,'',NULL,NULL,NULL),(5,'project','manager','pm@gmail.com','project12',2,'yuuJXy',NULL,NULL,NULL),(6,'john','smith','john@gmail.com','john',2,'',NULL,NULL,NULL),(16,'jay','kanzariya','jay12@gmail.com','jay123',2,'','Male','9865327412',NULL);
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

-- Dump completed on 2023-04-12 20:11:22
