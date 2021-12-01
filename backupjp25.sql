-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: edunovajp25
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clan` (
  `grupa` int(11) NOT NULL,
  `polaznik` int(11) NOT NULL,
  KEY `grupa` (`grupa`),
  KEY `polaznik` (`polaznik`),
  CONSTRAINT `clan_ibfk_1` FOREIGN KEY (`grupa`) REFERENCES `grupa` (`sifra`),
  CONSTRAINT `clan_ibfk_2` FOREIGN KEY (`polaznik`) REFERENCES `polaznik` (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupa`
--

DROP TABLE IF EXISTS `grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupa` (
  `sifra` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `smjer` int(11) NOT NULL,
  `predavac` int(11) DEFAULT NULL,
  `datumpocetka` datetime DEFAULT NULL,
  PRIMARY KEY (`sifra`),
  KEY `smjer` (`smjer`),
  KEY `predavac` (`predavac`),
  CONSTRAINT `grupa_ibfk_1` FOREIGN KEY (`smjer`) REFERENCES `smjer` (`sifra`),
  CONSTRAINT `grupa_ibfk_2` FOREIGN KEY (`predavac`) REFERENCES `predavac` (`sifra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa`
--

LOCK TABLES `grupa` WRITE;
/*!40000 ALTER TABLE `grupa` DISABLE KEYS */;
INSERT INTO `grupa` VALUES (1,'JP25',1,1,'2021-10-27 00:00:00'),(2,'PHP24',2,NULL,NULL);
/*!40000 ALTER TABLE `grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osoba` (
  `sifra` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `oib` char(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (1,'Tomislav','Jakopec','95800140506','tjakopec@gmail.com'),(2,'Stjepan','Groznica',NULL,'stjepan.groznica@gmail.com'),(3,'Franko','Vekić',NULL,'franko.vekic@gmail.com'),(4,'Ivana','Cerovski',NULL,'ivana.cerovski85@gmail.com'),(5,'Rudolf','Esert',NULL,'rudolf.esert@gmail.com'),(6,'Aleksandar','Jergić',NULL,'acojergic@gmail.com'),(7,'Mateo','Cvenić',NULL,'mateo.cvenic@gmail.com'),(8,'Juraj','Mak',NULL,'juraj.mak90@gmail.com'),(9,'Tea','Matasović',NULL,'teamatasovic@gmail.com'),(10,'Miroslav','Ambroš',NULL,'miroslav.ambros@gmail.com'),(11,'Matej','Lišćak',NULL,'liscakmatej1@gmail.com'),(12,'Filip','Stamenković',NULL,'stameniwow83@gmail.com'),(13,'Matej','Zovak',NULL,'matejzovak031@gmail.com'),(14,'Antonio','Cukrov',NULL,'anub031@gmail.com'),(15,'Ivan','Thür',NULL,'ivan.thuer@gmail.com'),(16,'Mario','Kordić',NULL,'mario.kordic4@gmail.com'),(17,'Igor','Davidović',NULL,'igordavidovic137@gmail.com'),(18,'Patrik','Bolf',NULL,'bolfpatrik0@gmail.com'),(19,'Neven','Gostić',NULL,'neven.gostic@gmail.com'),(20,'Frane','Dumančić',NULL,'franedumancic@icloud.com'),(21,'Filip','Janković',NULL,'filip.vno.jankovic@gmail.com'),(22,'Nikolina','Bradarić',NULL,'nina.bradaric@gmail.com'),(23,'Josip','Balog',NULL,'jbalooog@gmail.com'),(24,'Matija','Skrletović',NULL,'skrlama@gmail.com');
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polaznik`
--

DROP TABLE IF EXISTS `polaznik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polaznik` (
  `sifra` int(11) NOT NULL AUTO_INCREMENT,
  `osoba` int(11) NOT NULL,
  `brojugovora` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sifra`),
  KEY `osoba` (`osoba`),
  CONSTRAINT `polaznik_ibfk_1` FOREIGN KEY (`osoba`) REFERENCES `osoba` (`sifra`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polaznik`
--

LOCK TABLES `polaznik` WRITE;
/*!40000 ALTER TABLE `polaznik` DISABLE KEYS */;
INSERT INTO `polaznik` VALUES (1,2,NULL),(2,3,NULL),(3,4,NULL),(4,5,NULL),(5,6,NULL),(6,7,NULL),(7,8,NULL),(8,9,NULL),(9,10,NULL),(10,11,NULL),(11,12,NULL),(12,13,NULL),(13,14,NULL),(14,15,NULL),(15,16,NULL),(16,17,NULL),(17,18,NULL),(18,19,NULL),(19,20,NULL),(20,21,NULL),(21,22,NULL),(22,23,NULL),(23,24,NULL);
/*!40000 ALTER TABLE `polaznik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predavac`
--

DROP TABLE IF EXISTS `predavac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predavac` (
  `sifra` int(11) NOT NULL AUTO_INCREMENT,
  `osoba` int(11) DEFAULT NULL,
  `iban` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sifra`),
  KEY `osoba` (`osoba`),
  CONSTRAINT `predavac_ibfk_1` FOREIGN KEY (`osoba`) REFERENCES `osoba` (`sifra`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predavac`
--

LOCK TABLES `predavac` WRITE;
/*!40000 ALTER TABLE `predavac` DISABLE KEYS */;
INSERT INTO `predavac` VALUES (1,1,NULL);
/*!40000 ALTER TABLE `predavac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smjer`
--

DROP TABLE IF EXISTS `smjer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smjer` (
  `sifra` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `trajanje` int(11) NOT NULL,
  `cijena` decimal(18,2) DEFAULT NULL,
  `certificiran` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smjer`
--

LOCK TABLES `smjer` WRITE;
/*!40000 ALTER TABLE `smjer` DISABLE KEYS */;
INSERT INTO `smjer` VALUES (1,'Java programiranje',130,5999.99,1),(2,'PHP programiranje',130,NULL,NULL),(3,'Računovodstvo',240,NULL,0);
/*!40000 ALTER TABLE `smjer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-01 19:50:17
