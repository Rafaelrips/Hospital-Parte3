CREATE DATABASE  IF NOT EXISTS `hospital`;
USE `hospital`;

DROP TABLE IF EXISTS `consulta`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;;


LOCK TABLES `consulta` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `convenio`;

CREATE TABLE `convenio` (
  `id_convenio` int NOT NULL AUTO_INCREMENT,
  `nome_convenio` varchar(100) DEFAULT NULL,
  `cnpj_convenio` varchar(14) DEFAULT NULL,
  `tempo_carencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_convenio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `convenio` WRITE;

INSERT INTO `convenio` VALUES (1,'Intermedica','9852143614751','30 dias');
UNLOCK TABLES;



DROP TABLE IF EXISTS `endereco`;
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


LOCK TABLES `endereco` WRITE;
INSERT INTO `endereco` VALUES (1,'Rua Cardeal Arcoverde',5404,'Pinheiros','São Paulo','São Paulo',NULL,1);
UNLOCK TABLES;



DROP TABLE IF EXISTS `enfermeiro`;
CREATE TABLE `enfermeiro` (
  `id_enfermeiro` int NOT NULL AUTO_INCREMENT,
  `nome_enfermeiro` varchar(125) NOT NULL,
  `cpf_enfermeiro` int NOT NULL,
  `cre` varchar(13) NOT NULL,
  PRIMARY KEY (`id_enfermeiro`),
  UNIQUE KEY `cpf_enfermeiro` (`cpf_enfermeiro`),
  UNIQUE KEY `cre` (`cre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `enfermeiro` WRITE;
INSERT INTO `enfermeiro` VALUES (1,'Daniel Sousa',74851574,'415879');
UNLOCK TABLES;



DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE `especialidade` (
  `id_especialidade` int NOT NULL AUTO_INCREMENT,
  `nome_especialidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `especialidade` WRITE;
INSERT INTO `especialidade` VALUES (1,'Pediatria');
UNLOCK TABLES;



DROP TABLE IF EXISTS `internacao`;

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
/

LOCK TABLES `internacao` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `medico`;

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

LOCK TABLES `medico` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `paciente`;

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


LOCK TABLES `paciente` WRITE;
INSERT INTO `paciente` VALUES (1,'Aline Dias de Sousa','1994-08-21',74951847,'1462085-x','aline.dias02@gmail.com',NULL);
UNLOCK TABLES;


DROP TABLE IF EXISTS `plantao`;
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


LOCK TABLES `plantao` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `quarto`;

CREATE TABLE `quarto` (
  `id_quarto` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `tipo_id` int NOT NULL,
  PRIMARY KEY (`id_quarto`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `quarto_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_quarto` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `quarto` WRITE;

INSERT INTO `quarto` VALUES (1,2,1);
UNLOCK TABLES;



DROP TABLE IF EXISTS `receita`;
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



LOCK TABLES `receita` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `telefone`;

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


LOCK TABLES `telefone` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `tipo_quarto`;

CREATE TABLE `tipo_quarto` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `valor_diario` decimal(8,2) NOT NULL,
  `desc_quarto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
40101 SET character_set_client = @saved_cs_client */;

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
