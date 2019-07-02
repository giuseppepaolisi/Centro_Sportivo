-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: centro sportivo
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abbonamenti`
--

DROP TABLE IF EXISTS `abbonamenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abbonamenti` (
  `codice abbonamento` varchar(5) NOT NULL,
  `prezzo` double NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `tipo` varchar(10) NOT NULL,
  `numero clienti` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`codice abbonamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abbonamenti`
--

LOCK TABLES `abbonamenti` WRITE;
/*!40000 ALTER TABLE `abbonamenti` DISABLE KEYS */;
INSERT INTO `abbonamenti` VALUES ('A01',50,'Piscina','Mese',3),('A02',25,'Palestra','Mese',2),('A03',30,'Palestra','Mese',2),('A04',35,'Palestra','Mese',3),('A05',60,'Piscina','Mese',1),('A06',40,'Piscina','Mese',NULL),('A07',45,'Piscina','Anno',NULL),('A08',30,'Palestra','Anno',NULL),('A09',50,'Palestra','Anno',NULL),('A10',25,'Palestra','Anno',NULL);
/*!40000 ALTER TABLE `abbonamenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attività`
--

DROP TABLE IF EXISTS `attività`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attività` (
  `codice attività` varchar(5) NOT NULL,
  `lunghezza` float unsigned DEFAULT NULL,
  `periodicità` int(11) unsigned DEFAULT NULL,
  `numero campo` int(11) unsigned DEFAULT NULL,
  `superficie` float unsigned DEFAULT NULL,
  `copertura` varchar(4) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `profondità` float DEFAULT NULL,
  `numero corsie` int(10) unsigned DEFAULT NULL,
  `illuminazione` varchar(4) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codice attività`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attività`
--

LOCK TABLES `attività` WRITE;
/*!40000 ALTER TABLE `attività` DISABLE KEYS */;
INSERT INTO `attività` VALUES ('1',50,NULL,1,50,'Sì','Campo da C',NULL,NULL,'Sì',NULL),('10',NULL,15,NULL,25,'Sì','Piscina',25,10,'No',NULL),('2',100,NULL,2,100,'No','Campo da C',NULL,NULL,'Sì',NULL),('3',25,NULL,3,75,'No','Campo da C',NULL,NULL,'Sì',NULL),('4',NULL,30,NULL,50,'No','Piscina',50,6,'Sì',NULL),('5',NULL,NULL,NULL,100,'Sì','Palestra',NULL,NULL,'No',NULL),('6',NULL,NULL,NULL,75,'Sì','Palestra',NULL,NULL,'No',NULL),('7',NULL,20,NULL,45,'Sì','Piscina',15,8,'Sì',NULL),('8',15,NULL,4,60,'No','Campo da C',NULL,NULL,'Sì',NULL),('9',NULL,NULL,NULL,70,'Sì','Palestra',5,NULL,'No',NULL);
/*!40000 ALTER TABLE `attività` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clienti` (
  `codice fiscale` varchar(16) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `citta` varchar(20) NOT NULL,
  `via` varchar(20) NOT NULL,
  `numero civico` int(11) unsigned NOT NULL,
  `data nascita` date NOT NULL,
  `luogo nascita` varchar(20) NOT NULL,
  `certificato medico` varchar(5) NOT NULL,
  `codice scheda` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codice fiscale`),
  KEY `codice scheda_idx` (`codice scheda`),
  CONSTRAINT `codice scheda` FOREIGN KEY (`codice scheda`) REFERENCES `schede` (`codice scheda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES ('AAA','Mario','Rossi','Avellino','Enrico Capozzi',83100,'1990-02-12','Avellino','S','S01'),('BBB','Rocco','Verdi','Avellino','Umberto',84100,'1995-10-09','Avellino','S',NULL),('CCC','Giuseppe','Porcelli','Avellino','Vittorio Emanuele',85100,'1997-05-21','Avellino','S',NULL),('DDD','Giovanni','Conte','Avellino','P.E Imbriani',86100,'1993-07-17','Avellino','S','S04'),('EEE','Dario','Paolisi','Avellino','Cappuccini',87100,'1995-10-09','Avellino','S',NULL),('FFF','Jacop','Rossi','Avellino','Piazza Kennedy',88100,'1993-07-17','Avellino','No\r','S06'),('GGG','Raimondo','De Cicco','Avellino','Carducci',89100,'1997-05-21','Avellino','S','S02'),('HHH','Gerardo','Lo Conte','Avellino','Morelli',90100,'1998-12-07','Avellino','S','S07'),('III','Giuseppe','Rainaldo','Avellino','Silvati',91100,'1990-02-12','Avellino','S',NULL),('LLL','Roberta','Rossi','Avellino','Vittorio Emanuele',92100,'0000-00-00','Avellino','S','S03'),('MMM','Felice','Castronuovo','Avellino','De Concilis',93100,'1993-07-17','Avellino','S',NULL),('NNN','Roberto','Passaro','Avellino','Cappuccini',94100,'1998-12-07','Avellino','No\r','S08'),('OOO','Maria','Verdi','Avellino','Piazza Kennedy',95100,'1990-02-12','Avellino','S','S05'),('PPP','Mario','Rosa','Avellino','De Concilis',96100,'1990-02-12','Avellino','S',NULL),('QQQ','Daria','Grella','Avellino','Silvati',97100,'1997-05-21','Avellino','S','S09');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contiene`
--

DROP TABLE IF EXISTS `contiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contiene` (
  `nome esercizio` varchar(20) NOT NULL,
  `cod scheda` varchar(5) NOT NULL,
  PRIMARY KEY (`nome esercizio`,`cod scheda`),
  KEY `codice scheda_idx` (`cod scheda`),
  CONSTRAINT `cod scheda` FOREIGN KEY (`cod scheda`) REFERENCES `schede` (`codice scheda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nome esercizio` FOREIGN KEY (`nome esercizio`) REFERENCES `esercizi` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contiene`
--

LOCK TABLES `contiene` WRITE;
/*!40000 ALTER TABLE `contiene` DISABLE KEYS */;
INSERT INTO `contiene` VALUES ('Cavi','S01'),('Leg Press','S01'),('Rowing','S01'),('Half Squat','S02'),('Sbarra','S02'),('Affondi','S03'),('Leg Extension','S03'),('Parallele','S04'),('Pullover','S04'),('Squat','S05');
/*!40000 ALTER TABLE `contiene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esercizi`
--

DROP TABLE IF EXISTS `esercizi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esercizi` (
  `nome` varchar(20) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `parte del corpo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esercizi`
--

LOCK TABLES `esercizi` WRITE;
/*!40000 ALTER TABLE `esercizi` DISABLE KEYS */;
INSERT INTO `esercizi` VALUES ('Affondi','','Gambe\r'),('Cavi','','Pettorali\r'),('Half Squat','','Gambe\r'),('Leg Extension','','Gambe\r'),('Leg Press','','Gambe\r'),('Parallele','','Pettorali\r'),('Pullover','','Pettorali\r'),('Rowing','','Dorsali\r'),('Sbarra','','Dorsali\r'),('Squat','','Gambe\r');
/*!40000 ALTER TABLE `esercizi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventi`
--

DROP TABLE IF EXISTS `eventi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventi` (
  `codice evento` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `numero massimo iscritti` int(11) unsigned DEFAULT NULL,
  `numero iscritti` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`codice evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventi`
--

LOCK TABLES `eventi` WRITE;
/*!40000 ALTER TABLE `eventi` DISABLE KEYS */;
INSERT INTO `eventi` VALUES ('E01','2013-12-12',NULL,100,5),('E02','2014-05-17',NULL,200,2),('E03','2014-08-05',NULL,150,1),('E04','2015-06-02',NULL,300,3),('E05','2015-07-04',NULL,150,1);
/*!40000 ALTER TABLE `eventi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `include`
--

DROP TABLE IF EXISTS `include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `include` (
  `cod abbonamento` varchar(5) NOT NULL,
  `cod attivita` varchar(5) NOT NULL,
  PRIMARY KEY (`cod abbonamento`,`cod attivita`),
  KEY `codice attivita_idx` (`cod attivita`),
  CONSTRAINT `cod abbonamento` FOREIGN KEY (`cod abbonamento`) REFERENCES `abbonamenti` (`codice abbonamento`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `cod attivita` FOREIGN KEY (`cod attivita`) REFERENCES `attività` (`codice attività`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `include`
--

LOCK TABLES `include` WRITE;
/*!40000 ALTER TABLE `include` DISABLE KEYS */;
INSERT INTO `include` VALUES ('A01','1'),('A10','10'),('A02','2'),('A03','3'),('A04','4'),('A05','5'),('A06','6'),('A07','7'),('A08','8'),('A09','9');
/*!40000 ALTER TABLE `include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partecipa`
--

DROP TABLE IF EXISTS `partecipa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partecipa` (
  `codice fiscale` varchar(16) NOT NULL,
  `codice evento` varchar(20) NOT NULL,
  PRIMARY KEY (`codice fiscale`,`codice evento`),
  KEY `nome_idx` (`codice evento`),
  CONSTRAINT `cidice fiscale` FOREIGN KEY (`codice fiscale`) REFERENCES `clienti` (`codice fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `codice evento` FOREIGN KEY (`codice evento`) REFERENCES `eventi` (`codice evento`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partecipa`
--

LOCK TABLES `partecipa` WRITE;
/*!40000 ALTER TABLE `partecipa` DISABLE KEYS */;
INSERT INTO `partecipa` VALUES ('AAA','E01'),('BBB','E01'),('CCC','E01'),('DDD','E01'),('EEE','E01'),('AAA','E02'),('CCC','E02'),('BBB','E03'),('CCC','E04'),('EEE','E04'),('FFF','E04'),('AAA','E05');
/*!40000 ALTER TABLE `partecipa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personale`
--

DROP TABLE IF EXISTS `personale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personale` (
  `codice fiscale` varchar(16) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `data nascita` date DEFAULT NULL,
  `luogo nascita` varchar(20) DEFAULT NULL,
  `città` varchar(20) DEFAULT NULL,
  `via` varchar(20) DEFAULT NULL,
  `numero civico` int(11) DEFAULT NULL,
  `stipendio` decimal(10,0) DEFAULT NULL,
  `anno iseef` date DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `attivita` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codice fiscale`),
  KEY `attivita_idx` (`attivita`),
  CONSTRAINT `attivita` FOREIGN KEY (`attivita`) REFERENCES `attività` (`codice attività`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personale`
--

LOCK TABLES `personale` WRITE;
/*!40000 ALTER TABLE `personale` DISABLE KEYS */;
INSERT INTO `personale` VALUES ('JJJ','Silvio','Testa','1991-05-12','Avellno','Avellino','Morelli',86100,950,NULL,'Segretario',NULL),('KKK','Federico','Guerriero','1990-12-18','Avellino','Avellino','Silvati',87100,27,NULL,'Segretario',NULL),('RRR','Paolo','Verdi','1980-08-19','Avellino','Avellino','Piazza Libertà',80100,1000,'2005-05-14','Istruttore','10'),('SSS','Daniele','Rossi','1975-04-25','Avellino','Avellino','Vittorio Emanuele',81100,1100,'2014-02-17','Istruttore','4'),('TTT','Antonio','Rosa','1978-02-14','Avellino','Avellino','Piazza Kennedy',82100,900,NULL,'Segretario',NULL),('UUU','Antonia','Sparano','1993-06-13','Avellino','Avellino','Carducci',83100,1600,NULL,'Dirigente',NULL),('VVV','Viola','Miele','1990-12-12','Avellino','Avellino','Enrico Capozzi',84100,1300,'2013-08-21','Istruttore','5'),('WWW','Daniela','Famoso','1988-07-21','Avellino','Avellino','Carducci',89100,1100,'2011-11-30','Istruttore','9'),('YYY','Carlo','Santaniello','1976-03-18','Avellino','Avellino','Silvati',88100,1050,'2012-10-25','Istruttore','6'),('ZZZ','Silvia','Guerriero','1991-12-01','Avellino','Avellino','Vittorio Emanuele',85100,1150,'2016-12-06','Istruttore','7');
/*!40000 ALTER TABLE `personale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schede`
--

DROP TABLE IF EXISTS `schede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schede` (
  `codice scheda` varchar(5) NOT NULL,
  `durata (settimane)` int(10) unsigned DEFAULT NULL,
  `numero ripetizioni` int(10) unsigned DEFAULT NULL,
  `cod istruttore` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`codice scheda`),
  KEY `cod istruttore_idx` (`cod istruttore`),
  CONSTRAINT `cod istruttore` FOREIGN KEY (`cod istruttore`) REFERENCES `personale` (`codice fiscale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schede`
--

LOCK TABLES `schede` WRITE;
/*!40000 ALTER TABLE `schede` DISABLE KEYS */;
INSERT INTO `schede` VALUES ('S01',4,2,'RRR'),('S02',6,3,'SSS'),('S03',3,3,'WWW'),('S04',2,3,'YYY'),('S05',4,2,'ZZZ'),('S06',3,3,NULL),('S07',3,3,'WWW'),('S08',6,2,'ZZZ'),('S09',4,3,'ZZZ');
/*!40000 ALTER TABLE `schede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stipula`
--

DROP TABLE IF EXISTS `stipula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stipula` (
  `codice fiscale` varchar(16) NOT NULL,
  `codice abbonamento` varchar(5) NOT NULL,
  `data inizio` date NOT NULL,
  `data fine` date DEFAULT NULL,
  PRIMARY KEY (`codice fiscale`,`codice abbonamento`,`data inizio`),
  KEY `codice abbonamento_idx` (`codice abbonamento`),
  CONSTRAINT `codice abbonamento` FOREIGN KEY (`codice abbonamento`) REFERENCES `abbonamenti` (`codice abbonamento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `codice fiscale` FOREIGN KEY (`codice fiscale`) REFERENCES `clienti` (`codice fiscale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipula`
--

LOCK TABLES `stipula` WRITE;
/*!40000 ALTER TABLE `stipula` DISABLE KEYS */;
INSERT INTO `stipula` VALUES ('AAA','A01','2018-01-07','2018-02-07'),('AAA','A01','2018-02-07','2018-03-07'),('BBB','A02','2018-01-07','2018-02-07'),('BBB','A03','2018-01-07','2018-02-07'),('CCC','A01','2018-01-07','2018-02-07'),('CCC','A02','2018-01-07','2018-02-07'),('CCC','A03','2018-01-07','2018-02-07'),('CCC','A04','2018-01-07','2018-02-07'),('DDD','A04','2018-01-07','2018-02-07'),('EEE','A04','2018-01-07','2018-02-07'),('EEE','A05','2018-01-07','2018-02-07');
/*!40000 ALTER TABLE `stipula` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-24 19:36:10
