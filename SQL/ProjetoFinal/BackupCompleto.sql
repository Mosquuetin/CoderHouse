-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bancoprivado
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
-- Table structure for table `cartao_credito`
--

DROP TABLE IF EXISTS `cartao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao_credito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_conta_cliente` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `data_inclusao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_cartao_credito_conta_cliente` (`id_conta_cliente`),
  CONSTRAINT `fk_cartao_credito_conta_cliente` FOREIGN KEY (`id_conta_cliente`) REFERENCES `conta_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_credito`
--

LOCK TABLES `cartao_credito` WRITE;
/*!40000 ALTER TABLE `cartao_credito` DISABLE KEYS */;
INSERT INTO `cartao_credito` VALUES (1,1,'Ativo','2023-10-04 09:17:53'),(2,2,'Ativo','2023-10-31 10:57:50'),(3,4,'Ativo','2023-10-31 10:57:50'),(4,6,'Ativo','2023-10-31 10:57:50'),(5,8,'Ativo','2023-10-31 10:57:50'),(6,10,'Ativo','2023-10-31 10:57:50'),(7,12,'Ativo','2023-10-31 10:57:50'),(8,14,'Ativo','2023-10-31 10:57:50'),(9,16,'Ativo','2023-10-31 10:57:50'),(10,18,'Ativo','2023-10-31 10:57:50'),(11,20,'Ativo','2023-10-31 10:57:50'),(12,22,'Ativo','2023-10-31 10:57:50'),(13,24,'Ativo','2023-10-31 10:57:50'),(14,26,'Ativo','2023-10-31 10:57:50'),(15,28,'Ativo','2023-10-31 10:57:50'),(16,30,'Ativo','2023-10-31 10:57:50'),(17,32,'Ativo','2023-10-31 10:57:50'),(18,34,'Ativo','2023-10-31 10:57:50'),(19,36,'Ativo','2023-10-31 10:57:50'),(20,38,'Ativo','2023-10-31 10:57:50'),(21,40,'Ativo','2023-10-31 10:57:50'),(22,3,'Ativo','2023-10-31 11:57:04'),(23,5,'Ativo','2023-10-31 11:57:04'),(24,7,'Ativo','2023-10-31 11:57:04'),(25,9,'Ativo','2023-10-31 11:57:04'),(26,11,'Ativo','2023-10-31 11:57:04'),(27,13,'Ativo','2023-10-31 11:57:04'),(28,15,'Ativo','2023-10-31 11:57:04'),(29,17,'Ativo','2023-10-31 11:57:04'),(30,19,'Ativo','2023-10-31 11:57:04'),(31,21,'Ativo','2023-10-31 11:57:04'),(32,23,'Ativo','2023-10-31 11:57:04'),(33,25,'Ativo','2023-10-31 11:57:04'),(34,27,'Ativo','2023-10-31 11:57:04'),(35,29,'Ativo','2023-10-31 11:57:04'),(36,31,'Ativo','2023-10-31 11:57:04'),(37,33,'Ativo','2023-10-31 11:57:04'),(38,35,'Ativo','2023-10-31 11:57:04'),(39,37,'Ativo','2023-10-31 11:57:04'),(40,39,'Ativo','2023-10-31 11:57:04'),(41,41,'Ativo','2023-10-31 12:12:01'),(42,42,'Ativo','2023-10-31 12:12:01'),(43,43,'Ativo','2023-10-31 12:12:01'),(44,44,'Ativo','2023-10-31 12:12:01'),(45,45,'Ativo','2023-10-31 12:12:01'),(46,46,'Ativo','2023-10-31 12:12:01'),(47,47,'Ativo','2023-10-31 12:12:01'),(48,48,'Ativo','2023-10-31 12:12:01'),(49,49,'Ativo','2023-10-31 12:12:01'),(50,50,'Ativo','2023-10-31 12:12:01'),(51,51,'Ativo','2023-10-31 12:12:01'),(52,52,'Ativo','2023-10-31 12:12:01'),(53,53,'Ativo','2023-10-31 12:12:01'),(54,54,'Ativo','2023-10-31 12:12:01');
/*!40000 ALTER TABLE `cartao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao_debito`
--

DROP TABLE IF EXISTS `cartao_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao_debito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_conta_cliente` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `data_inclusao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_cartao_debito_conta_cliente` (`id_conta_cliente`),
  CONSTRAINT `fk_cartao_debito_conta_cliente` FOREIGN KEY (`id_conta_cliente`) REFERENCES `conta_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao_debito`
--

LOCK TABLES `cartao_debito` WRITE;
/*!40000 ALTER TABLE `cartao_debito` DISABLE KEYS */;
INSERT INTO `cartao_debito` VALUES (1,1,'Ativo','2023-10-04 09:17:53'),(2,1,'Ativo','2023-10-31 11:00:40'),(3,3,'Ativo','2023-10-31 11:01:44'),(4,5,'Ativo','2023-10-31 11:01:44'),(5,7,'Ativo','2023-10-31 11:01:44'),(6,9,'Ativo','2023-10-31 11:01:44'),(7,11,'Ativo','2023-10-31 11:01:44'),(8,13,'Ativo','2023-10-31 11:01:44'),(9,15,'Ativo','2023-10-31 11:01:44'),(10,17,'Ativo','2023-10-31 11:01:44'),(11,19,'Ativo','2023-10-31 11:01:44'),(12,21,'Ativo','2023-10-31 11:01:44'),(13,23,'Ativo','2023-10-31 11:01:44'),(14,25,'Ativo','2023-10-31 11:01:44'),(15,27,'Ativo','2023-10-31 11:01:44'),(16,29,'Ativo','2023-10-31 11:01:44'),(17,31,'Ativo','2023-10-31 11:01:44'),(18,33,'Ativo','2023-10-31 11:01:44'),(19,35,'Ativo','2023-10-31 11:01:44'),(20,37,'Ativo','2023-10-31 11:01:44'),(21,39,'Ativo','2023-10-31 11:01:44'),(22,2,'Ativo','2023-10-31 11:57:01'),(23,4,'Ativo','2023-10-31 11:57:01'),(24,6,'Ativo','2023-10-31 11:57:01'),(25,8,'Ativo','2023-10-31 11:57:01'),(26,10,'Ativo','2023-10-31 11:57:01'),(27,12,'Ativo','2023-10-31 11:57:01'),(28,14,'Ativo','2023-10-31 11:57:01'),(29,16,'Ativo','2023-10-31 11:57:01'),(30,18,'Ativo','2023-10-31 11:57:01'),(31,20,'Ativo','2023-10-31 11:57:01'),(32,22,'Ativo','2023-10-31 11:57:01'),(33,24,'Ativo','2023-10-31 11:57:01'),(34,26,'Ativo','2023-10-31 11:57:01'),(35,28,'Ativo','2023-10-31 11:57:01'),(36,30,'Ativo','2023-10-31 11:57:01'),(37,32,'Ativo','2023-10-31 11:57:01'),(38,34,'Ativo','2023-10-31 11:57:01'),(39,36,'Ativo','2023-10-31 11:57:01'),(40,38,'Ativo','2023-10-31 11:57:01'),(41,40,'Ativo','2023-10-31 11:57:01'),(42,41,'Desativo','2023-10-31 12:12:36'),(43,42,'Desativo','2023-10-31 12:12:36'),(44,43,'Desativo','2023-10-31 12:12:36'),(45,44,'Desativo','2023-10-31 12:12:36'),(46,45,'Desativo','2023-10-31 12:12:36'),(47,46,'Desativo','2023-10-31 12:12:36'),(48,47,'Desativo','2023-10-31 12:12:36'),(49,48,'Desativo','2023-10-31 12:12:36'),(50,49,'Desativo','2023-10-31 12:12:36'),(51,50,'Desativo','2023-10-31 12:12:36'),(52,51,'Desativo','2023-10-31 12:12:36'),(53,52,'Desativo','2023-10-31 12:12:36'),(54,53,'Desativo','2023-10-31 12:12:36'),(55,54,'Desativo','2023-10-31 12:12:36');
/*!40000 ALTER TABLE `cartao_debito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(255) NOT NULL,
  `ultimo_nome` varchar(255) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `data_inclusao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Christopher','Faria','37991213397','eldannyto@hotmail.com','2023-10-04 09:15:55'),(2,'João','Silva','1123456789','joao.silva@email.com','2023-10-31 10:02:02'),(3,'Maria','Pereira','2298765432','maria.pereira@email.com','2023-10-31 10:02:02'),(4,'Carlos','Santos','3355551234','carlos.santos@email.com','2023-10-31 10:02:02'),(5,'Ana','Ferreira','4477774321','ana.ferreira@email.com','2023-10-31 10:02:02'),(6,'Pedro','Oliveira','5533334444','pedro.oliveira@email.com','2023-10-31 10:02:02'),(7,'Julia','Ribeiro','6654321234','julia.ribeiro@email.com','2023-10-31 10:02:02'),(8,'Antonio','Gomes','7788887777','antonio.gomes@email.com','2023-10-31 10:02:02'),(9,'Luiza','Cruz','8833221100','luiza.cruz@email.com','2023-10-31 10:02:02'),(10,'Lucas','Machado','9932116677','lucas.machado@email.com','2023-10-31 10:02:02'),(11,'Mariana','Fonseca','2255334422','mariana.fonseca@email.com','2023-10-31 10:02:02'),(12,'Gustavo','Costa','3399885522','gustavo.costa@email.com','2023-10-31 10:02:02'),(13,'Isabella','Nunes','4488993311','isabella.nunes@email.com','2023-10-31 10:02:02'),(14,'Rafael','Pinto','5588771144','rafael.pinto@email.com','2023-10-31 10:02:02'),(15,'Eduarda','Almeida','6655442288','eduarda.almeida@email.com','2023-10-31 10:02:02'),(16,'Felipe','Vieira','7777112299','felipe.vieira@email.com','2023-10-31 10:02:02'),(17,'Larissa','Carvalho','8833226633','larissa.carvalho@email.com','2023-10-31 10:02:02'),(18,'Leonardo','Rodrigues','9999221100','leonardo.rodrigues@email.com','2023-10-31 10:02:02'),(19,'Vitor','Melo','1111553322','vitor.melo@email.com','2023-10-31 10:02:02'),(20,'Sofia','Barbosa','2222773322','sofia.barbosa@email.com','2023-10-31 10:02:02'),(21,'Enzo','Araújo','4444667733','enzo.araujo@email.com','2023-10-31 10:02:02'),(22,'Valentina','Dias','5555997733','valentina.dias@email.com','2023-10-31 10:02:02'),(23,'Davi','Rocha','8888110066','davi.rocha@email.com','2023-10-31 10:02:02'),(24,'Laura','Fernandes','9999112233','laura.fernandes@email.com','2023-10-31 10:02:02'),(25,'Matheus','Sousa','1133556677','matheus.sousa@email.com','2023-10-31 10:02:02'),(26,'Manuela','Azevedo','2244887722','manuela.azevedo@email.com','2023-10-31 10:02:02'),(27,'Pedro','Oliveira','3333221100','pedro.oliveira@email.com','2023-10-31 10:02:02'),(28,'Alice','Mendes','4444229988','alice.mendes@email.com','2023-10-31 10:02:02'),(29,'Guilherme','Alves','5555118844','guilherme.alves@email.com','2023-10-31 10:02:02'),(30,'Sophia','Couto','6655223300','sophia.couto@email.com','2023-10-31 10:02:02'),(31,'Eduardo','Vargas','7777223366','eduardo.vargas@email.com','2023-10-31 10:02:02');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_cliente`
--

DROP TABLE IF EXISTS `conta_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `agencia` varchar(255) NOT NULL,
  `saldo` float DEFAULT '0',
  `fatura_credito` float DEFAULT '0',
  `data_inclusao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_conta_cliente_cliente` (`id_cliente`),
  CONSTRAINT `fk_conta_cliente_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_cliente`
--

LOCK TABLES `conta_cliente` WRITE;
/*!40000 ALTER TABLE `conta_cliente` DISABLE KEYS */;
INSERT INTO `conta_cliente` VALUES (1,1,'4',0,500,'2023-10-04 09:17:11'),(2,10,'6',-100.84,0,'2023-10-31 10:53:30'),(3,28,'8',0,150,'2023-10-31 10:53:30'),(4,22,'4',-60.72,0,'2023-10-31 10:53:30'),(5,6,'2',0,400,'2023-10-31 10:53:30'),(6,17,'7',-30,0,'2023-10-31 10:53:30'),(7,12,'9',0,250,'2023-10-31 10:53:30'),(8,31,'6',-91.68,0,'2023-10-31 10:53:30'),(9,9,'3',0,80,'2023-10-31 10:53:30'),(10,18,'5',-161.94,0,'2023-10-31 10:53:30'),(11,3,'6',0,220,'2023-10-31 10:53:30'),(12,29,'10',-50,0,'2023-10-31 10:53:30'),(13,8,'5',0,131.26,'2023-10-31 10:53:30'),(14,21,'3',-240,0,'2023-10-31 10:53:30'),(15,13,'7',0,31.74,'2023-10-31 10:53:30'),(16,5,'4',-190,0,'2023-10-31 10:53:30'),(17,15,'7',0,300,'2023-10-31 10:53:30'),(18,20,'9',-70.7,0,'2023-10-31 10:53:30'),(19,7,'1',0,141.98,'2023-10-31 10:53:30'),(20,25,'10',-40,0,'2023-10-31 10:53:30'),(21,16,'7',0,250.84,'2023-10-31 10:53:30'),(22,30,'2',-120,0,'2023-10-31 10:53:30'),(23,2,'9',0,170,'2023-10-31 10:53:30'),(24,19,'5',-60,0,'2023-10-31 10:53:30'),(25,11,'9',0,230,'2023-10-31 10:53:30'),(26,24,'8',-90.56,0,'2023-10-31 10:53:30'),(27,4,'4',0,50,'2023-10-31 10:53:30'),(28,27,'10',-140,0,'2023-10-31 10:53:30'),(29,1,'10',0,180,'2023-10-31 10:53:30'),(30,14,'3',-220.9,0,'2023-10-31 10:53:30'),(31,23,'5',0,150,'2023-10-31 10:53:30'),(32,26,'6',-81.98,0,'2023-10-31 10:53:30'),(33,10,'8',0,231.74,'2023-10-31 10:53:30'),(34,28,'1',-121.12,0,'2023-10-31 10:53:30'),(35,22,'10',0,60.68,'2023-10-31 10:53:30'),(36,6,'5',-180,0,'2023-10-31 10:53:30'),(37,17,'2',0,220.9,'2023-10-31 10:53:30'),(38,12,'3',-150,0,'2023-10-31 10:53:30'),(39,31,'4',0,163.96,'2023-10-31 10:53:30'),(40,9,'10',-231.74,0,'2023-10-31 10:53:30'),(41,18,'2',0,0,'2023-10-31 10:53:30'),(42,3,'5',0,0,'2023-10-31 10:53:30'),(43,14,'10',0,0,'2023-10-31 12:02:39'),(44,15,'2',0,0,'2023-10-31 12:02:39'),(45,16,'4',0,0,'2023-10-31 12:02:39'),(46,19,'8',0,0,'2023-10-31 12:02:39'),(47,20,'2',0,0,'2023-10-31 12:02:39'),(48,21,'4',0,0,'2023-10-31 12:02:39'),(49,23,'5',0,0,'2023-10-31 12:02:39'),(50,24,'1',0,0,'2023-10-31 12:02:39'),(51,25,'3',0,0,'2023-10-31 12:02:39'),(52,26,'7',0,0,'2023-10-31 12:02:39'),(53,27,'9',0,0,'2023-10-31 12:02:39'),(54,30,'3',0,0,'2023-10-31 12:02:39');
/*!40000 ALTER TABLE `conta_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_conta_cliente`
--

DROP TABLE IF EXISTS `log_conta_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_conta_cliente` (
  `codigo_update` int NOT NULL AUTO_INCREMENT,
  `id_update` int NOT NULL,
  `usario_update` varchar(255) NOT NULL,
  `data_update` varchar(255) NOT NULL,
  `hora_update` varchar(255) NOT NULL,
  `saldo_update_antigo` float NOT NULL,
  `saldo_update_novo` float NOT NULL,
  `fatura_credito_antigo` float NOT NULL,
  `fatura_credito_novo` float NOT NULL,
  PRIMARY KEY (`codigo_update`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_conta_cliente`
--

LOCK TABLES `log_conta_cliente` WRITE;
/*!40000 ALTER TABLE `log_conta_cliente` DISABLE KEYS */;
INSERT INTO `log_conta_cliente` VALUES (1,1,'root@localhost','2023-10-04','09:17:11',0,0,400,500);
/*!40000 ALTER TABLE `log_conta_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_transacoes`
--

DROP TABLE IF EXISTS `log_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_transacoes` (
  `codigo_update` int NOT NULL AUTO_INCREMENT,
  `id_update` int NOT NULL,
  `usario_update` varchar(255) NOT NULL,
  `data_update` varchar(255) NOT NULL,
  `hora_update` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo_update`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_transacoes`
--

LOCK TABLES `log_transacoes` WRITE;
/*!40000 ALTER TABLE `log_transacoes` DISABLE KEYS */;
INSERT INTO `log_transacoes` VALUES (1,499,'root@localhost','2023-11-17','21:05:18'),(2,500,'root@localhost','2023-11-17','21:18:24');
/*!40000 ALTER TABLE `log_transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_conta_cliente` int NOT NULL,
  `id_cartao` int NOT NULL,
  `data_inclusao` datetime DEFAULT CURRENT_TIMESTAMP,
  `valor` float DEFAULT '0',
  `tipo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `info_pagamento` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transacoes_cliente` (`id_cliente`),
  KEY `fk_transacoes_conta_cliente` (`id_conta_cliente`),
  KEY `fk_transacoes_cartao_credito` (`id_cartao`),
  CONSTRAINT `fk_transacoes_cartao_credito` FOREIGN KEY (`id_cartao`) REFERENCES `cartao_credito` (`id`),
  CONSTRAINT `fk_transacoes_cartao_debito` FOREIGN KEY (`id_cartao`) REFERENCES `cartao_debito` (`id`),
  CONSTRAINT `fk_transacoes_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_transacoes_conta_cliente` FOREIGN KEY (`id_conta_cliente`) REFERENCES `conta_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
INSERT INTO `transacoes` VALUES (408,1,1,1,'2023-10-31 12:49:13',100,'Credito','Compra de Eletrônicos','Americanas - São Paulo - SP'),(409,10,2,3,'2023-10-31 12:49:13',50.42,'Debito','Compra de Roupas','C&A - Rio de Janeiro - RJ'),(410,28,3,3,'2023-10-31 12:49:13',75,'Credito','Compra de Livros','Leitura - Belo Horizonte - MG'),(411,22,4,5,'2023-10-31 12:49:13',30.36,'Debito','Restaurante','Outback - Brasília - DF'),(412,6,5,5,'2023-10-31 12:49:13',200,'Credito','Compra de Eletrônicos','Amazon - Porto Alegre - RS'),(413,17,6,7,'2023-10-31 12:49:13',15,'Debito','Posto de Gasolina','Posto Petrobras - Salvador - BA'),(414,12,7,7,'2023-10-31 12:49:13',125,'Credito','Compra de Móveis','MadeiraMadeira - Florianópolis - SC'),(415,31,8,9,'2023-10-31 12:49:13',45.84,'Debito','Supermercado','Extra Mercado - Recife - PE'),(416,9,9,9,'2023-10-31 12:49:13',40,'Credito','Compra de Eletrônicos','Casas Bahia - Campinas - SP'),(417,18,10,11,'2023-10-31 12:49:13',80.97,'Debito','Restaurante','Madero - Florianópolis - SC'),(418,3,11,11,'2023-10-31 12:49:13',110,'Credito','Compra de Roupas','Zattini - Belo Horizonte - MG'),(419,29,12,13,'2023-10-31 12:49:13',25,'Debito','Supermercado','Extra Mercado - Brasília - DF'),(420,8,13,13,'2023-10-31 12:49:13',65.63,'Credito','Posto de Gasolina','Posto Shell - Porto Alegre - RS'),(421,21,14,15,'2023-10-31 12:49:13',120,'Debito','Compra de Livros','Amazon - Rio de Janeiro - RJ'),(422,13,15,15,'2023-10-31 12:49:13',15.87,'Credito','Farmácia','Drogasil - Recife - PE'),(423,5,16,17,'2023-10-31 12:49:13',95,'Debito','Restaurante','Outback - Manaus - AM'),(424,15,17,17,'2023-10-31 12:49:13',150,'Credito','Loja de Eletrônicos','Casas Bahia - Salvador - BA'),(425,20,18,19,'2023-10-31 12:49:13',35.35,'Debito','Supermercado','Carrefour - Fortaleza - CE'),(426,7,19,18,'2023-10-31 12:49:13',70.99,'Credito','Posto de Gasolina','Posto Petrobras - Goiânia - GO'),(427,25,20,21,'2023-10-31 12:49:13',20,'Debito','Restaurante','Madero - Belém - PA'),(428,16,21,21,'2023-10-31 12:49:13',125.42,'Credito','Compra de Roupas','C&A - São Luís - MA'),(429,30,22,23,'2023-10-31 12:49:13',60,'Debito','Supermercado','Carrefour - Porto Velho - RO'),(430,2,23,23,'2023-10-31 12:49:13',85,'Credito','Posto de Gasolina','Posto Petrobras - Curitiba - PR'),(431,19,24,25,'2023-10-31 12:49:13',30,'Debito','Restaurante','Coco Bambu - Cuiabá - MT'),(432,11,25,25,'2023-10-31 12:49:13',115,'Credito','Compra de Eletrônicos','Mercado Livre - Teresina - PI'),(433,24,26,27,'2023-10-31 12:49:13',45.28,'Debito','Supermercado','Extra Mercado - João Pessoa - PB'),(434,4,27,27,'2023-10-31 12:49:13',25,'Credito','Farmácia','Araujo - Vitória - ES'),(435,27,28,29,'2023-10-31 12:49:13',70,'Debito','Restaurante','Coco Bambu - Aracaju - SE'),(436,1,29,29,'2023-10-31 12:49:13',90,'Credito','Compra de Roupas','Zattini - Natal - RN'),(437,14,30,31,'2023-10-31 12:49:13',110.45,'Debito','Supermercado','Carrefour - Boa Vista - RR'),(438,23,31,31,'2023-10-31 12:49:13',75,'Credito','Posto de Gasolina','Posto Shell - Palmas - TO'),(439,26,32,33,'2023-10-31 12:49:13',40.99,'Debito','Restaurante','Outback - Rio Branco - AC'),(440,10,33,33,'2023-10-31 12:49:13',115.87,'Credito','Compra de Eletrônicos','Amazon - Macapá - AP'),(441,28,34,35,'2023-10-31 12:49:13',60.56,'Debito','Supermercado','Carrefour - Acreúna - GO'),(442,22,35,35,'2023-10-31 12:49:13',30.34,'Credito','Farmácia','Drogasil - Bertioga - SP'),(443,6,36,38,'2023-10-31 12:49:13',90,'Debito','Compra de Roupas','Zattini - Natal - RN'),(444,17,37,37,'2023-10-31 12:49:13',110.45,'Credito','Supermercado','Carrefour - Boa Vista - RR'),(445,12,38,39,'2023-10-31 12:49:13',75,'Debito','Posto de Gasolina','Posto Shell - Palmas - TO'),(446,31,39,38,'2023-10-31 12:49:13',40.99,'Credito','Restaurante','Outback - Rio Branco - AC'),(447,9,40,41,'2023-10-31 12:49:13',115.87,'Debito','Compra de Eletrônicos','Amazon - Macapá - AP'),(448,5,39,39,'2023-10-31 12:49:13',40.99,'Credito','Restaurante','Outback - Rio Branco - AC'),(449,1,1,1,'2023-10-31 12:49:15',100,'Credito','Compra de Eletrônicos','Americanas - São Paulo - SP'),(450,10,2,3,'2023-10-31 12:49:15',50.42,'Debito','Compra de Roupas','C&A - Rio de Janeiro - RJ'),(451,28,3,3,'2023-10-31 12:49:15',75,'Credito','Compra de Livros','Leitura - Belo Horizonte - MG'),(452,22,4,5,'2023-10-31 12:49:15',30.36,'Debito','Restaurante','Outback - Brasília - DF'),(453,6,5,5,'2023-10-31 12:49:15',200,'Credito','Compra de Eletrônicos','Amazon - Porto Alegre - RS'),(454,17,6,7,'2023-10-31 12:49:15',15,'Debito','Posto de Gasolina','Posto Petrobras - Salvador - BA'),(455,12,7,7,'2023-10-31 12:49:15',125,'Credito','Compra de Móveis','MadeiraMadeira - Florianópolis - SC'),(456,31,8,9,'2023-10-31 12:49:15',45.84,'Debito','Supermercado','Extra Mercado - Recife - PE'),(457,9,9,9,'2023-10-31 12:49:15',40,'Credito','Compra de Eletrônicos','Casas Bahia - Campinas - SP'),(458,18,10,11,'2023-10-31 12:49:15',80.97,'Debito','Restaurante','Madero - Florianópolis - SC'),(459,3,11,11,'2023-10-31 12:49:15',110,'Credito','Compra de Roupas','Zattini - Belo Horizonte - MG'),(460,29,12,13,'2023-10-31 12:49:15',25,'Debito','Supermercado','Extra Mercado - Brasília - DF'),(461,8,13,13,'2023-10-31 12:49:15',65.63,'Credito','Posto de Gasolina','Posto Shell - Porto Alegre - RS'),(462,21,14,15,'2023-10-31 12:49:15',120,'Debito','Compra de Livros','Amazon - Rio de Janeiro - RJ'),(463,13,15,15,'2023-10-31 12:49:15',15.87,'Credito','Farmácia','Drogasil - Recife - PE'),(464,5,16,17,'2023-10-31 12:49:15',95,'Debito','Restaurante','Outback - Manaus - AM'),(465,15,17,17,'2023-10-31 12:49:15',150,'Credito','Loja de Eletrônicos','Casas Bahia - Salvador - BA'),(466,20,18,19,'2023-10-31 12:49:15',35.35,'Debito','Supermercado','Carrefour - Fortaleza - CE'),(467,7,19,18,'2023-10-31 12:49:15',70.99,'Credito','Posto de Gasolina','Posto Petrobras - Goiânia - GO'),(468,25,20,21,'2023-10-31 12:49:15',20,'Debito','Restaurante','Madero - Belém - PA'),(469,16,21,21,'2023-10-31 12:49:15',125.42,'Credito','Compra de Roupas','C&A - São Luís - MA'),(470,30,22,23,'2023-10-31 12:49:15',60,'Debito','Supermercado','Carrefour - Porto Velho - RO'),(471,2,23,23,'2023-10-31 12:49:15',85,'Credito','Posto de Gasolina','Posto Petrobras - Curitiba - PR'),(472,19,24,25,'2023-10-31 12:49:15',30,'Debito','Restaurante','Coco Bambu - Cuiabá - MT'),(473,11,25,25,'2023-10-31 12:49:15',115,'Credito','Compra de Eletrônicos','Mercado Livre - Teresina - PI'),(474,24,26,27,'2023-10-31 12:49:15',45.28,'Debito','Supermercado','Extra Mercado - João Pessoa - PB'),(475,4,27,27,'2023-10-31 12:49:15',25,'Credito','Farmácia','Araujo - Vitória - ES'),(476,27,28,29,'2023-10-31 12:49:15',70,'Debito','Restaurante','Coco Bambu - Aracaju - SE'),(477,1,29,29,'2023-10-31 12:49:15',90,'Credito','Compra de Roupas','Zattini - Natal - RN'),(478,14,30,31,'2023-10-31 12:49:15',110.45,'Debito','Supermercado','Carrefour - Boa Vista - RR'),(479,23,31,31,'2023-10-31 12:49:15',75,'Credito','Posto de Gasolina','Posto Shell - Palmas - TO'),(480,26,32,33,'2023-10-31 12:49:15',40.99,'Debito','Restaurante','Outback - Rio Branco - AC'),(481,10,33,33,'2023-10-31 12:49:15',115.87,'Credito','Compra de Eletrônicos','Amazon - Macapá - AP'),(482,28,34,35,'2023-10-31 12:49:15',60.56,'Debito','Supermercado','Carrefour - Acreúna - GO'),(483,22,35,35,'2023-10-31 12:49:15',30.34,'Credito','Farmácia','Drogasil - Bertioga - SP'),(484,6,36,38,'2023-10-31 12:49:15',90,'Debito','Compra de Roupas','Zattini - Natal - RN'),(485,17,37,37,'2023-10-31 12:49:15',110.45,'Credito','Supermercado','Carrefour - Boa Vista - RR'),(486,12,38,39,'2023-10-31 12:49:15',75,'Debito','Posto de Gasolina','Posto Shell - Palmas - TO'),(487,31,39,38,'2023-10-31 12:49:15',40.99,'Credito','Restaurante','Outback - Rio Branco - AC'),(488,9,40,41,'2023-10-31 12:49:15',115.87,'Debito','Compra de Eletrônicos','Amazon - Macapá - AP'),(489,5,39,39,'2023-10-31 12:49:15',40.99,'Credito','Restaurante','Outback - Rio Branco - AC'),(498,1,1,1,'2023-11-09 21:07:38',100,'Credito','Compra de Eletrônicos','Americanas - São Paulo - SP'),(499,1,1,1,'2023-11-17 21:05:18',100,'Credito','Compra de Eletrônicos','Americanas - São Paulo - SP'),(500,1,1,1,'2023-11-17 21:18:24',100,'Credito','Compra de Eletrônicos','Americanas - São Paulo - SP');
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_total_saldo_fatura_cidade`
--

DROP TABLE IF EXISTS `view_total_saldo_fatura_cidade`;
/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_cidade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_saldo_fatura_cidade` AS SELECT 
 1 AS `cidade`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_total_saldo_fatura_cliente`
--

DROP TABLE IF EXISTS `view_total_saldo_fatura_cliente`;
/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_saldo_fatura_cliente` AS SELECT 
 1 AS `nome_completo`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_total_saldo_fatura_descricao`
--

DROP TABLE IF EXISTS `view_total_saldo_fatura_descricao`;
/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_descricao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_saldo_fatura_descricao` AS SELECT 
 1 AS `categoria`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_total_saldo_fatura_estado`
--

DROP TABLE IF EXISTS `view_total_saldo_fatura_estado`;
/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_estado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_saldo_fatura_estado` AS SELECT 
 1 AS `estado`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_total_saldo_fatura_loja`
--

DROP TABLE IF EXISTS `view_total_saldo_fatura_loja`;
/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_loja`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_saldo_fatura_loja` AS SELECT 
 1 AS `loja`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_total_saldo_fatura_mes`
--

DROP TABLE IF EXISTS `view_total_saldo_fatura_mes`;
/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_saldo_fatura_mes` AS SELECT 
 1 AS `mes_compra`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bancoprivado'
--

--
-- Dumping routines for database 'bancoprivado'
--
/*!50003 DROP FUNCTION IF EXISTS `contagem_contas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `contagem_contas`(nome VARCHAR(255)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_contas INT;
    SELECT COUNT(conta_cliente.id) INTO total_contas
    FROM cliente
    JOIN conta_cliente ON cliente.id = conta_cliente.id_cliente
    WHERE cliente.primeiro_nome LIKE CONCAT('%', nome, '%');
    RETURN total_contas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `soma_saldo_fatura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `soma_saldo_fatura`(id_conta_cliente INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_saldo FLOAT;
    DECLARE v_fatura FLOAT;
    SET v_saldo = COALESCE((SELECT SUM(valor) FROM transacoes WHERE transacoes.id_conta_cliente = id_conta_cliente AND tipo = 'Debito'), 0);
    SET v_fatura = COALESCE((SELECT SUM(valor) FROM transacoes WHERE transacoes.id_conta_cliente = id_conta_cliente AND tipo = 'Credito'), 0);
    RETURN CONCAT('Saldo: ', v_saldo, ' - Fatura: ', v_fatura);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddDeleteLinhaTransacoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDeleteLinhaTransacoes`(IN demanda VARCHAR(20), IN id_clienteVar INT, IN id_conta_clienteVar INT, 
IN id_cartaoVar INT, IN valorVar FLOAT, IN tipoVar VARCHAR(255), IN descricaoVar VARCHAR(255), IN info_pagamentoVar VARCHAR(255), IN criterio INT)
BEGIN
    IF demanda = 'Adicionar' THEN
        SET @stringVar = CONCAT('INSERT INTO transacoes (id_cliente, id_conta_cliente, id_cartao, valor, tipo, descricao, info_pagamento) VALUES (',
            id_clienteVar,',',id_conta_clienteVar,',',id_cartaoVar,',',valorVar,",'",tipoVar,"','",descricaoVar,"','",info_pagamentoVar,"');");
    ELSEIF demanda = 'Deletar' THEN
        IF criterio <> '' THEN
            SET @stringVar = CONCAT('DELETE FROM transacoes WHERE id',' = ',criterio);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Critério é obrigatório para a ação de "Deletar".';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de demanda não permitida';
    END IF;
    PREPARE RunSQL FROM @stringVar;
    EXECUTE RunSQL;
    DEALLOCATE PREPARE RunSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdernarTableTransacoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdernarTableTransacoes`(IN coluna VARCHAR(20), IN tipo VARCHAR(20))
BEGIN
    IF coluna <> '' THEN
        IF tipo = 'Crescente' THEN
            SET @stringVar = CONCAT('ORDER BY ', coluna);
        ELSEIF tipo = 'Decrescente' THEN
            SET @stringVar = CONCAT('ORDER BY ',coluna,' DESC');
        ELSE             
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Tipo de ordenação não permitida';
        END IF;
    ELSE
        SET @stringVar = '';
    END IF;
    SET @RunSQLString = CONCAT('SELECT * FROM transacoes ', @stringVar);
    PREPARE RunSQL FROM @RunSQLString;
    EXECUTE RunSQL;
    DEALLOCATE PREPARE RunSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_total_saldo_fatura_cidade`
--

/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_cidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_saldo_fatura_cidade` AS select substring_index(substring_index(`transacoes`.`info_pagamento`,' - ',2),' - ',-(1)) AS `cidade`,round(sum(`transacoes`.`valor`),2) AS `valor_total` from `transacoes` group by substring_index(substring_index(`transacoes`.`info_pagamento`,' - ',2),' - ',-(1)) order by round(sum(`transacoes`.`valor`),2) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_total_saldo_fatura_cliente`
--

/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_saldo_fatura_cliente` AS select concat(`cliente`.`primeiro_nome`,' ',`cliente`.`ultimo_nome`) AS `nome_completo`,round(sum(`transacoes`.`valor`),2) AS `valor_total` from (`transacoes` left join `cliente` on((`cliente`.`id` = `transacoes`.`id_cliente`))) group by concat(`cliente`.`primeiro_nome`,' ',`cliente`.`ultimo_nome`) order by round(sum(`transacoes`.`valor`),2) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_total_saldo_fatura_descricao`
--

/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_descricao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_saldo_fatura_descricao` AS select `transacoes`.`descricao` AS `categoria`,round(sum(`transacoes`.`valor`),2) AS `valor_total` from `transacoes` group by `transacoes`.`descricao` order by round(sum(`transacoes`.`valor`),2) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_total_saldo_fatura_estado`
--

/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_estado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_saldo_fatura_estado` AS select substring_index(substring_index(`transacoes`.`info_pagamento`,' - ',3),' - ',-(1)) AS `estado`,round(sum(`transacoes`.`valor`),2) AS `valor_total` from `transacoes` group by substring_index(substring_index(`transacoes`.`info_pagamento`,' - ',3),' - ',-(1)) order by round(sum(`transacoes`.`valor`),2) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_total_saldo_fatura_loja`
--

/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_loja`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_saldo_fatura_loja` AS select substring_index(substring_index(`transacoes`.`info_pagamento`,' - ',1),' - ',-(1)) AS `loja`,round(sum(`transacoes`.`valor`),2) AS `valor_total` from `transacoes` group by substring_index(substring_index(`transacoes`.`info_pagamento`,' - ',1),' - ',-(1)) order by round(sum(`transacoes`.`valor`),2) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_total_saldo_fatura_mes`
--

/*!50001 DROP VIEW IF EXISTS `view_total_saldo_fatura_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_saldo_fatura_mes` AS select month(`transacoes`.`data_inclusao`) AS `mes_compra`,round(sum(`transacoes`.`valor`),2) AS `valor_total` from `transacoes` group by month(`transacoes`.`data_inclusao`) order by round(sum(`transacoes`.`valor`),2) desc */;
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

-- Dump completed on 2023-12-12 19:52:20
