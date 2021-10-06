-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: sprint_final_individual
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `encuesta`
--



DROP DATABASE IF EXISTS sprint_final_individual_pbaez;

CREATE DATABASE sprint_final_individual_pbaez;

USE sprint_final_individual_pbaez;

DROP USER if exists 'pbaez'@'localhost';

CREATE USER 'pbaez'@'localhost' IDENTIFIED BY 'pass12345';

GRANT ALL PRIVILEGES ON sprint_final_individual_pbaez.* TO 'pbaez'@'localhost';

use sprint_final_individual_pbaez;


DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta` (
  `idencuesta` int NOT NULL AUTO_INCREMENT,
  `calificacion` int unsigned DEFAULT NULL,
  `comentario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idencuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,1,'malo'),(2,2,'malo'),(3,3,'malo'),(4,4,'normal'),(5,5,'regular'),(6,6,'bueno'),(7,7,'excelente'),(8,7,'excelente'),(9,5,'regular'),(10,5,'regular');
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operario`
--

DROP TABLE IF EXISTS `operario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operario` (
  `idoperario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `edad` varchar(45) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `n_realizado_soporte` int unsigned DEFAULT '1',
  PRIMARY KEY (`idoperario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operario`
--

LOCK TABLES `operario` WRITE;
/*!40000 ALTER TABLE `operario` DISABLE KEYS */;
INSERT INTO `operario` VALUES (1,'operario','1','22','adadaa',5),(2,'operario','2','44','dadsdsa',15),(3,'operario','3','23','adasda',6),(4,'operario','4','32','adasd',30),(5,'operario','5','43','adasda',12),(6,'operario','6','44','adadas',4);
/*!40000 ALTER TABLE `operario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soporte`
--

DROP TABLE IF EXISTS `soporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soporte` (
  `idsoporte` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario_idusuario` int NOT NULL,
  `operario_idoperario` int NOT NULL,
  `encuesta_idencuesta` int NOT NULL,
  `problematica` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsoporte`),
  KEY `fk_soporte_usuario_idx` (`usuario_idusuario`),
  KEY `fk_soporte_operario1_idx` (`operario_idoperario`),
  KEY `fk_soporte_encuesta1_idx` (`encuesta_idencuesta`),
  CONSTRAINT `fk_soporte_encuesta1` FOREIGN KEY (`encuesta_idencuesta`) REFERENCES `encuesta` (`idencuesta`),
  CONSTRAINT `fk_soporte_operario1` FOREIGN KEY (`operario_idoperario`) REFERENCES `operario` (`idoperario`),
  CONSTRAINT `fk_soporte_usuario` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soporte`
--

LOCK TABLES `soporte` WRITE;
/*!40000 ALTER TABLE `soporte` DISABLE KEYS */;
INSERT INTO `soporte` VALUES (12,'2021-02-10 00:00:00',2,4,1,'falla office'),(13,'2021-02-10 00:00:00',3,4,2,'falla windows'),(14,'2021-02-10 00:00:00',5,5,3,'falla mouse'),(15,'2021-02-10 00:00:00',5,5,4,'teclado murio'),(16,'2021-02-10 00:00:00',1,5,5,'ema no tiene ram'),(18,'2021-02-10 00:00:00',2,4,1,'falla office'),(19,'2021-02-10 00:00:00',3,4,2,'falla windows'),(20,'2021-02-10 00:00:00',5,5,3,'falla mouse'),(21,'2021-02-10 00:00:00',5,5,4,'teclado murio'),(22,'2021-02-10 00:00:00',1,5,5,'ema no tiene ram'),(24,'2021-02-10 00:00:00',2,4,1,'falla office'),(25,'2021-02-10 00:00:00',3,4,2,'falla windows'),(26,'2021-02-10 00:00:00',5,5,3,'falla mouse'),(27,'2021-02-10 00:00:00',5,5,4,'teclado murio'),(28,'2021-02-10 00:00:00',1,5,5,'ema no tiene ram'),(29,'2021-02-10 00:00:00',1,3,6,'disco duro'),(30,'2021-02-10 00:00:00',1,4,7,'windowa pirata'),(31,'2021-02-10 00:00:00',1,3,8,'cambio de dns'),(32,'2021-02-10 00:00:00',1,1,9,'cambio ip'),(33,'2021-02-10 00:00:00',1,1,10,'reset router');
/*!40000 ALTER TABLE `soporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `edad` varchar(45) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `n_utilizado_soporte` int unsigned DEFAULT '1',
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'usuario','1','22','addsdasdsadsa',5),(2,'usuario','2','33','adsadassad',1),(3,'usuario','3','15','frfrfrfrrfrf',3),(4,'usuario','4','55','asasddaddas',33),(5,'usuario','5','32','dasdsadsdsa',3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-06  0:30:32
