-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: checkmed
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `tbl_consultas`
--

DROP TABLE IF EXISTS `tbl_consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int DEFAULT NULL,
  `medico_id` int DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `tbl_consultas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `tbl_pacientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbl_consultas_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `tbl_medicos` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tbl_consultas_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `tbl_status_consultas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consultas`
--

LOCK TABLES `tbl_consultas` WRITE;
/*!40000 ALTER TABLE `tbl_consultas` DISABLE KEYS */;
INSERT INTO `tbl_consultas` VALUES (3,1,3,'2000-02-18 14:00:00',2),(4,5,4,'2025-04-04 15:00:00',2),(5,2,3,'2025-05-20 08:00:00',2);
/*!40000 ALTER TABLE `tbl_consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_medicos`
--

DROP TABLE IF EXISTS `tbl_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_medicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_medicos`
--

LOCK TABLES `tbl_medicos` WRITE;
/*!40000 ALTER TABLE `tbl_medicos` DISABLE KEYS */;
INSERT INTO `tbl_medicos` VALUES (1,'Dr. João Silva','Cardiologista','135.789.538-57'),(2,'Dra. Maria Oliveira','Dermatologista','212.526.302-59'),(3,'Dr. Carlos Santos','Ortopedista','291.351.927-21'),(4,'Dra. Ana Souza','Pediatra','095.312.898-52'),(5,'Dra Roblox','Fisioterapia','230.527.897-58'),(6,'Dr. Pedro Almeida','Neurologista','325.654.987-32');
/*!40000 ALTER TABLE `tbl_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pacientes`
--

DROP TABLE IF EXISTS `tbl_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nasc` date NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pacientes`
--

LOCK TABLES `tbl_pacientes` WRITE;
/*!40000 ALTER TABLE `tbl_pacientes` DISABLE KEYS */;
INSERT INTO `tbl_pacientes` VALUES (1,'Paulo Moraes','23051543802','2000-02-18','(11)94106-8987','paulomoraes1802@gmail.com'),(2,'Joao Vitor Pedreira Lopes','23051535892','2004-11-04','11999707070','joaovitorlopes@gmail.com'),(3,'Giovana Ferreira da Silva','23076898952','2003-06-02','(11)970906070','giovannaferreiradasilva22@gmail.com'),(4,'Luana Tainá Ribeiro Melo','32859837623','2004-12-23','(11)980808080','luanatainada@gmail.com'),(5,'Vivian Nicolle Santos Silva','23081859823','2001-10-27','(11)980709080','viviannicolle@gmail.com'),(6,'Lucas Travassos','45085275822','2001-05-11','(11)940028922','travassoslucas@gmail.com'),(7,'Mariana Costa','38765421900','1995-07-22','(11)97852-3641','marianacostasilva@gmail.com'),(8,'Igor','13521892735','2003-04-27','(11)970859831','igormagalhaes@gmail.com');
/*!40000 ALTER TABLE `tbl_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prontuarios`
--

DROP TABLE IF EXISTS `tbl_prontuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prontuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int DEFAULT NULL,
  `data_registro` datetime DEFAULT NULL,
  `medico_id` int DEFAULT NULL,
  `observacoes` text,
  `diagnostico` varchar(255) DEFAULT NULL,
  `prescricao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prontuarios`
--

LOCK TABLES `tbl_prontuarios` WRITE;
/*!40000 ALTER TABLE `tbl_prontuarios` DISABLE KEYS */;
INSERT INTO `tbl_prontuarios` VALUES (1,1,'2025-01-12 10:30:00',3,'Paciente relata dor lombar há 3 dias','Dor lombar leve','Ibuprofeno 600mg 8/8h por 5 dias'),(2,5,'2025-03-15 14:45:00',4,'Dor de garganta e febre','Amigdalite','Amoxicilina 500mg 8/8h por 7 dias'),(3,2,'2025-05-04 18:23:40',2,'Febre','Infecção urinária','Amoxicilina');
/*!40000 ALTER TABLE `tbl_prontuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_status_consultas`
--

DROP TABLE IF EXISTS `tbl_status_consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_status_consultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descricao` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status_consultas`
--

LOCK TABLES `tbl_status_consultas` WRITE;
/*!40000 ALTER TABLE `tbl_status_consultas` DISABLE KEYS */;
INSERT INTO `tbl_status_consultas` VALUES (1,'Aguardando confirmação'),(3,'Cancelada'),(2,'Confirmada'),(4,'Em atendimento');
/*!40000 ALTER TABLE `tbl_status_consultas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-04 19:24:31
