CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `valor_consulta` decimal(10,0) DEFAULT NULL,
  `convenio_id` int DEFAULT NULL,
  `medico_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  `especialidade_id` int NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `convenio_id` (`convenio_id`),
  KEY `medico_id` (`medico_id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `especialidade_id` (`especialidade_id`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id_convenio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consulta_ibfk_4` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenio`
--

DROP TABLE IF EXISTS `convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenio` (
  `id_convenio` int NOT NULL AUTO_INCREMENT,
  `nome_convenio` varchar(100) DEFAULT NULL,
  `cnpj_convenio` varchar(14) DEFAULT NULL,
  `tempo_carencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
INSERT INTO `convenio` VALUES (1,'Intermedica','9852143614751','30 dias');
/*!40000 ALTER TABLE `convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) NOT NULL,
  `cep` int NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `medico_id` int DEFAULT NULL,
  `paciente_id` int DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `endereco_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua Cardeal Arcoverde',5404,'Pinheiros','São Paulo','São Paulo',NULL,1);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro` (
  `id_enfermeiro` int NOT NULL AUTO_INCREMENT,
  `nome_enfermeiro` varchar(125) NOT NULL,
  `cpf_enfermeiro` int NOT NULL,
  `cre` varchar(13) NOT NULL,
  PRIMARY KEY (`id_enfermeiro`),
  UNIQUE KEY `cpf_enfermeiro` (`cpf_enfermeiro`),
  UNIQUE KEY `cre` (`cre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
INSERT INTO `enfermeiro` VALUES (1,'Daniel Sousa',74851574,'415879');
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `id_especialidade` int NOT NULL AUTO_INCREMENT,
  `nome_especialidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'Pediatria');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internacao` (
  `id_internacao` int NOT NULL AUTO_INCREMENT,
  `data_entrada` date NOT NULL,
  `data_prev_alta` date NOT NULL,
  `data_efet_alta` date NOT NULL,
  `desc_procedimentos` text,
  `paciente_id` int NOT NULL,
  `medico_id` int NOT NULL,
  `quarto_id` int NOT NULL,
  PRIMARY KEY (`id_internacao`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  KEY `quarto_id` (`quarto_id`),
  CONSTRAINT `internacao_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `internacao_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `internacao_ibfk_3` FOREIGN KEY (`quarto_id`) REFERENCES `quarto` (`id_quarto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nome_medico` varchar(125) NOT NULL,
  `cpf_medico` int NOT NULL,
  `crm` varchar(13) NOT NULL,
  `email_medico` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) NOT NULL,
  `especialidade_id` int NOT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `cpf_medico` (`cpf_medico`),
  UNIQUE KEY `crm` (`crm`),
  KEY `especialidade_id` (`especialidade_id`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nome_paciente` varchar(125) NOT NULL,
  `dt_nasc_paciente` date DEFAULT NULL,
  `cpf_paciente` int NOT NULL,
  `rg_paciente` varchar(11) NOT NULL,
  `email_paciente` varchar(100) DEFAULT NULL,
  `convenio_id` int DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `cpf_paciente` (`cpf_paciente`),
  KEY `convenio_id` (`convenio_id`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id_convenio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Aline Dias de Sousa','1994-08-21',74951847,'1462085-x','aline.dias02@gmail.com',NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantao`
--

DROP TABLE IF EXISTS `plantao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantao` (
  `id_plantao` int NOT NULL AUTO_INCREMENT,
  `data_plantao` date DEFAULT NULL,
  `hora_plantao` time DEFAULT NULL,
  `internacao_id` int NOT NULL,
  `enfermeiro_id` int NOT NULL,
  PRIMARY KEY (`id_plantao`),
  KEY `internacao_id` (`internacao_id`),
  KEY `enfermeiro_id` (`enfermeiro_id`),
  CONSTRAINT `plantao_ibfk_1` FOREIGN KEY (`internacao_id`) REFERENCES `internacao` (`id_internacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plantao_ibfk_2` FOREIGN KEY (`enfermeiro_id`) REFERENCES `enfermeiro` (`id_enfermeiro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantao`
--

LOCK TABLES `plantao` WRITE;
/*!40000 ALTER TABLE `plantao` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id_quarto` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `tipo_id` int NOT NULL,
  PRIMARY KEY (`id_quarto`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `quarto_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_quarto` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (1,2,1);
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita`
--

DROP TABLE IF EXISTS `receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita` (
  `id_receita` int NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(200) DEFAULT NULL,
  `qtd_medicamento` int DEFAULT NULL,
  `instrucao_uso` text,
  `consulta_id` int NOT NULL,
  PRIMARY KEY (`id_receita`),
  KEY `consulta_id` (`consulta_id`),
  CONSTRAINT `receita_ibfk_1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id_consulta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita`
--

LOCK TABLES `receita` WRITE;
/*!40000 ALTER TABLE `receita` DISABLE KEYS */;
/*!40000 ALTER TABLE `receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `id_telefone` int NOT NULL AUTO_INCREMENT,
  `ddd` int NOT NULL,
  `numero` int NOT NULL,
  `medico_id` int DEFAULT NULL,
  `paciente_id` int DEFAULT NULL,
  PRIMARY KEY (`id_telefone`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `telefone_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_quarto`
--

DROP TABLE IF EXISTS `tipo_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_quarto` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `valor_diario` decimal(8,2) NOT NULL,
  `desc_quarto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_quarto`
--

LOCK TABLES `tipo_quarto` WRITE;
/*!40000 ALTER TABLE `tipo_quarto` DISABLE KEYS */;
INSERT INTO `tipo_quarto` VALUES (1,1000.00,'Apartamento');
/*!40000 ALTER TABLE `tipo_quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hospital'
--

--
-- Dumping routines for database 'hospital'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15 10:12:17
