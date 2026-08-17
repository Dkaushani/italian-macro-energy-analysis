CREATE DATABASE  IF NOT EXISTS `macro_analysis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `macro_analysis`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: macro_analysis
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
-- Table structure for table `energy_prices`
--

DROP TABLE IF EXISTS `energy_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `energy_prices` (
  `year` int NOT NULL,
  `crude_oil_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `energy_prices`
--

LOCK TABLES `energy_prices` WRITE;
/*!40000 ALTER TABLE `energy_prices` DISABLE KEYS */;
INSERT INTO `energy_prices` VALUES (2014,98.97),(2015,52.32),(2016,43.64),(2017,54.12),(2018,71.34),(2019,64.30),(2020,41.96),(2021,70.86),(2022,100.93),(2023,82.49),(2024,80.52);
/*!40000 ALTER TABLE `energy_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macro_data`
--

DROP TABLE IF EXISTS `macro_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macro_data` (
  `data_id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL,
  `year` int NOT NULL,
  `gdp_value` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macro_data`
--

LOCK TABLES `macro_data` WRITE;
/*!40000 ALTER TABLE `macro_data` DISABLE KEYS */;
INSERT INTO `macro_data` VALUES (1,'Piemonte',2014,122618.21),(2,'Piemonte',2015,124935.26),(3,'Piemonte',2016,128307.78),(4,'Piemonte',2017,132629.01),(5,'Piemonte',2018,135217.37),(6,'Piemonte',2019,135773.00),(7,'Piemonte',2020,124690.35),(8,'Piemonte',2021,137549.76),(9,'Piemonte',2022,146739.71),(10,'Piemonte',2023,159055.31),(11,'Piemonte',2024,164165.06),(12,'Valle d Aosta',2014,4635.41),(13,'Valle d Aosta',2015,4650.80),(14,'Valle d Aosta',2016,4597.42),(15,'Valle d Aosta',2017,4770.59),(16,'Valle d Aosta',2018,4809.66),(17,'Valle d Aosta',2019,4850.71),(18,'Valle d Aosta',2020,4443.55),(19,'Valle d Aosta',2021,4788.34),(20,'Valle d Aosta',2022,5403.11),(21,'Valle d Aosta',2023,5802.11),(22,'Valle d Aosta',2024,5852.16),(23,'Liguria',2014,46247.29),(24,'Liguria',2015,46816.48),(25,'Liguria',2016,47698.86),(26,'Liguria',2017,48730.58),(27,'Liguria',2018,48880.14),(28,'Liguria',2019,49636.89),(29,'Liguria',2020,45030.96),(30,'Liguria',2021,49520.59),(31,'Liguria',2022,53352.22),(32,'Liguria',2023,58464.44),(33,'Liguria',2024,58958.93),(34,'Lombardia',2014,361868.90),(35,'Lombardia',2015,369561.13),(36,'Lombardia',2016,380020.82),(37,'Lombardia',2017,389888.35),(38,'Lombardia',2018,400386.45),(39,'Lombardia',2019,404739.20),(40,'Lombardia',2020,379669.75),(41,'Lombardia',2021,423769.34),(42,'Lombardia',2022,457351.85),(43,'Lombardia',2023,490692.89),(44,'Lombardia',2024,504729.96),(45,'Abruzzo',2014,31574.65),(46,'Abruzzo',2015,31804.98),(47,'Abruzzo',2016,31953.48),(48,'Abruzzo',2017,32743.78),(49,'Abruzzo',2018,32806.28),(50,'Abruzzo',2019,33040.92),(51,'Abruzzo',2020,30574.73),(52,'Abruzzo',2021,33616.68),(53,'Abruzzo',2022,36420.35),(54,'Abruzzo',2023,39536.10),(55,'Abruzzo',2024,40760.57),(56,'Molise',2014,6141.23),(57,'Molise',2015,6253.04),(58,'Molise',2016,6350.85),(59,'Molise',2017,6502.72),(60,'Molise',2018,6620.26),(61,'Molise',2019,6755.00),(62,'Molise',2020,6245.35),(63,'Molise',2021,6848.03),(64,'Molise',2022,7291.00),(65,'Molise',2023,7874.47),(66,'Molise',2024,7986.70),(67,'Campania',2014,101114.43),(68,'Campania',2015,103549.99),(69,'Campania',2016,105337.88),(70,'Campania',2017,107537.38),(71,'Campania',2018,108682.75),(72,'Campania',2019,110938.87),(73,'Campania',2020,102588.10),(74,'Campania',2021,112145.16),(75,'Campania',2022,122639.05),(76,'Campania',2023,133040.27),(77,'Campania',2024,137510.98),(78,'Puglia',2014,70644.57),(79,'Puglia',2015,72096.39),(80,'Puglia',2016,73394.97),(81,'Puglia',2017,74392.32),(82,'Puglia',2018,75556.19),(83,'Puglia',2019,76516.12),(84,'Puglia',2020,71959.80),(85,'Puglia',2021,79660.86),(86,'Puglia',2022,86403.29),(87,'Puglia',2023,92160.48),(88,'Puglia',2024,94507.89),(89,'Basilicata',2014,11144.60),(90,'Basilicata',2015,12010.71),(91,'Basilicata',2016,12001.16),(92,'Basilicata',2017,12101.60),(93,'Basilicata',2018,12668.36),(94,'Basilicata',2019,12504.33),(95,'Basilicata',2020,11330.65),(96,'Basilicata',2021,12967.58),(97,'Basilicata',2022,13966.85),(98,'Basilicata',2023,14836.27),(99,'Basilicata',2024,15083.47),(100,'Calabria',2014,32131.21),(101,'Calabria',2015,32431.98),(102,'Calabria',2016,32949.10),(103,'Calabria',2017,33604.78),(104,'Calabria',2018,33359.67),(105,'Calabria',2019,33630.74),(106,'Calabria',2020,31264.47),(107,'Calabria',2021,34204.51),(108,'Calabria',2022,36561.72),(109,'Calabria',2023,39064.46),(110,'Calabria',2024,40003.45),(111,'Sicilia',2014,84090.89),(112,'Sicilia',2015,85527.92),(113,'Sicilia',2016,86176.88),(114,'Sicilia',2017,87900.53),(115,'Sicilia',2018,87938.98),(116,'Sicilia',2019,89049.57),(117,'Sicilia',2020,83725.38),(118,'Sicilia',2021,92299.85),(119,'Sicilia',2022,102503.44),(120,'Sicilia',2023,107067.10),(121,'Sicilia',2024,112029.68),(122,'Sardegna',2014,32413.98),(123,'Sardegna',2015,33496.92),(124,'Sardegna',2016,33124.60),(125,'Sardegna',2017,33750.12),(126,'Sardegna',2018,34244.13),(127,'Sardegna',2019,34959.95),(128,'Sardegna',2020,32333.23),(129,'Sardegna',2021,35700.02),(130,'Sardegna',2022,38868.25),(131,'Sardegna',2023,41800.26),(132,'Sardegna',2024,43467.53),(133,'Provincia Autonoma di Bolzano/Bozen',2014,22437.52),(134,'Provincia Autonoma di Bolzano/Bozen',2015,22934.56),(135,'Provincia Autonoma di Bolzano/Bozen',2016,23474.13),(136,'Provincia Autonoma di Bolzano/Bozen',2017,24331.23),(137,'Provincia Autonoma di Bolzano/Bozen',2018,25347.73),(138,'Provincia Autonoma di Bolzano/Bozen',2019,26112.74),(139,'Provincia Autonoma di Bolzano/Bozen',2020,24348.13),(140,'Provincia Autonoma di Bolzano/Bozen',2021,26606.37),(141,'Provincia Autonoma di Bolzano/Bozen',2022,29801.65),(142,'Provincia Autonoma di Bolzano/Bozen',2023,32935.64),(143,'Provincia Autonoma di Bolzano/Bozen',2024,33079.54),(144,'Provincia Autonoma di Trento',2014,18954.38),(145,'Provincia Autonoma di Trento',2015,18934.48),(146,'Provincia Autonoma di Trento',2016,19239.18),(147,'Provincia Autonoma di Trento',2017,19635.27),(148,'Provincia Autonoma di Trento',2018,20417.53),(149,'Provincia Autonoma di Trento',2019,20990.57),(150,'Provincia Autonoma di Trento',2020,19727.91),(151,'Provincia Autonoma di Trento',2021,21353.04),(152,'Provincia Autonoma di Trento',2022,23730.26),(153,'Provincia Autonoma di Trento',2023,25456.34),(154,'Provincia Autonoma di Trento',2024,26055.72),(155,'Veneto',2014,148957.46),(156,'Veneto',2015,151974.78),(157,'Veneto',2016,157045.00),(158,'Veneto',2017,161147.13),(159,'Veneto',2018,164480.29),(160,'Veneto',2019,167403.97),(161,'Veneto',2020,153458.49),(162,'Veneto',2021,169965.80),(163,'Veneto',2022,183956.46),(164,'Veneto',2023,197226.12),(165,'Veneto',2024,201245.73),(166,'Friuli-Venezia Giulia',2014,34919.38),(167,'Friuli-Venezia Giulia',2015,35867.79),(168,'Friuli-Venezia Giulia',2016,36316.00),(169,'Friuli-Venezia Giulia',2017,37064.09),(170,'Friuli-Venezia Giulia',2018,38082.04),(171,'Friuli-Venezia Giulia',2019,39007.17),(172,'Friuli-Venezia Giulia',2020,36431.46),(173,'Friuli-Venezia Giulia',2021,40494.97),(174,'Friuli-Venezia Giulia',2022,42712.77),(175,'Friuli-Venezia Giulia',2023,45063.15),(176,'Friuli-Venezia Giulia',2024,46601.88),(177,'Emilia-Romagna',2014,146323.67),(178,'Emilia-Romagna',2015,148966.68),(179,'Emilia-Romagna',2016,153805.67),(180,'Emilia-Romagna',2017,158027.17),(181,'Emilia-Romagna',2018,161556.51),(182,'Emilia-Romagna',2019,162928.75),(183,'Emilia-Romagna',2020,152125.33),(184,'Emilia-Romagna',2021,168983.59),(185,'Emilia-Romagna',2022,180468.76),(186,'Emilia-Romagna',2023,194365.53),(187,'Emilia-Romagna',2024,198395.23),(188,'Toscana',2014,108877.96),(189,'Toscana',2015,109949.16),(190,'Toscana',2016,112443.94),(191,'Toscana',2017,114868.50),(192,'Toscana',2018,117534.22),(193,'Toscana',2019,122134.12),(194,'Toscana',2020,108018.04),(195,'Toscana',2021,119472.41),(196,'Toscana',2022,130459.87),(197,'Toscana',2023,139527.64),(198,'Toscana',2024,143563.30),(199,'Umbria',2014,20845.27),(200,'Umbria',2015,21439.67),(201,'Umbria',2016,21545.43),(202,'Umbria',2017,22055.64),(203,'Umbria',2018,22680.08),(204,'Umbria',2019,22832.79),(205,'Umbria',2020,20985.61),(206,'Umbria',2021,23023.83),(207,'Umbria',2022,24727.95),(208,'Umbria',2023,26868.16),(209,'Umbria',2024,27673.58),(210,'Marche',2014,39426.29),(211,'Marche',2015,39568.53),(212,'Marche',2016,40358.12),(213,'Marche',2017,41229.28),(214,'Marche',2018,41854.33),(215,'Marche',2019,42596.26),(216,'Marche',2020,39262.95),(217,'Marche',2021,43161.87),(218,'Marche',2022,46329.80),(219,'Marche',2023,49374.18),(220,'Marche',2024,50509.69),(221,'Lazio',2014,189082.76),(222,'Lazio',2015,189295.41),(223,'Lazio',2016,197523.61),(224,'Lazio',2017,200195.57),(225,'Lazio',2018,203151.22),(226,'Lazio',2019,206485.70),(227,'Lazio',2020,190846.32),(228,'Lazio',2021,204585.32),(229,'Lazio',2022,227511.30),(230,'Lazio',2023,241432.47),(231,'Lazio',2024,246486.53);
/*!40000 ALTER TABLE `macro_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `region_id` int NOT NULL,
  `region_name` varchar(100) NOT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (5,'Abruzzo'),(9,'Basilicata'),(10,'Calabria'),(7,'Campania'),(17,'Emilia-Romagna'),(16,'Friuli-Venezia Giulia'),(21,'Lazio'),(3,'Liguria'),(4,'Lombardia'),(20,'Marche'),(6,'Molise'),(1,'Piemonte'),(13,'Provincia Autonoma di Bolzano/Bozen'),(14,'Provincia Autonoma di Trento'),(8,'Puglia'),(12,'Sardegna'),(11,'Sicilia'),(18,'Toscana'),(19,'Umbria'),(2,'Valle d Aosta'),(15,'Veneto');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_regional_oil_growth`
--

DROP TABLE IF EXISTS `vw_regional_oil_growth`;
/*!50001 DROP VIEW IF EXISTS `vw_regional_oil_growth`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_regional_oil_growth` AS SELECT 
 1 AS `region_name`,
 1 AS `year`,
 1 AS `gdp_value`,
 1 AS `crude_oil_price`,
 1 AS `gdp_growth_pct`,
 1 AS `oil_price_change_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_regional_oil_growth`
--

/*!50001 DROP VIEW IF EXISTS `vw_regional_oil_growth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_regional_oil_growth` AS with `lagged_data` as (select `m`.`region_name` AS `region_name`,`m`.`year` AS `year`,`m`.`gdp_value` AS `gdp_value`,`e`.`crude_oil_price` AS `crude_oil_price`,lag(`m`.`gdp_value`,1) OVER (PARTITION BY `m`.`region_name` ORDER BY `m`.`year` )  AS `prev_gdp`,lag(`e`.`crude_oil_price`,1) OVER (PARTITION BY `m`.`region_name` ORDER BY `m`.`year` )  AS `prev_oil_price` from (`macro_data` `m` join `energy_prices` `e` on((`m`.`year` = `e`.`year`)))) select `lagged_data`.`region_name` AS `region_name`,`lagged_data`.`year` AS `year`,`lagged_data`.`gdp_value` AS `gdp_value`,`lagged_data`.`crude_oil_price` AS `crude_oil_price`,round((((`lagged_data`.`gdp_value` - `lagged_data`.`prev_gdp`) / `lagged_data`.`prev_gdp`) * 100),2) AS `gdp_growth_pct`,round((((`lagged_data`.`crude_oil_price` - `lagged_data`.`prev_oil_price`) / `lagged_data`.`prev_oil_price`) * 100),2) AS `oil_price_change_pct` from `lagged_data` order by `lagged_data`.`region_name`,`lagged_data`.`year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-17 19:33:52
