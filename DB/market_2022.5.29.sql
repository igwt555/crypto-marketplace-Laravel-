-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (x86_64)
--
-- Host: localhost    Database: marketplace
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pubkey` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `coin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `admins_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('094dd040-ddaf-11ec-8a24-430bb7e4cbf4',NULL,NULL),('f5e6eeb0-ddb6-11ec-ab76-a32326a10453',NULL,NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bans` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `until` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bans_user_id_foreign` (`user_id`),
  CONSTRAINT `bans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bans`
--

LOCK TABLES `bans` WRITE;
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('4bc7de50-5f2e-11ec-ae55-dbd1d34f7973',NULL,'Mobile','2021-12-17 10:41:38','2021-12-17 10:41:38'),('51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','4bc7de50-5f2e-11ec-ae55-dbd1d34f7973','Android','2021-12-17 10:41:48','2021-12-17 10:41:48'),('54d3b1a0-5f2e-11ec-8944-734a1bbb1192',NULL,'Web','2021-12-17 10:41:53','2021-12-17 10:41:53'),('e4648a30-dd92-11ec-aba0-93aab3fa186a','51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','xxx','2022-05-27 03:59:10','2022-05-27 03:59:10');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversations_sender_id_foreign` (`sender_id`),
  KEY `conversations_receiver_id_foreign` (`receiver_id`),
  CONSTRAINT `conversations_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES ('82363690-df31-11ec-93ed-998ea90068a6','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','2022-05-29 05:27:07','2022-05-29 05:28:29'),('bbb35250-df31-11ec-af65-8b08585c98df','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','2022-05-29 05:28:43','2022-05-29 05:28:43');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `coin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` float DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

-- LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
-- INSERT INTO `deposits` VALUES ('fec0d410-6274-11ec-9ebd-eb9848776b5e','dGIxcXNzd3UzdDM4ZTQyOXA1c3lzdmx2d3A1Y2R3M2ZycndxOGNma3Jk','btc',0.0001,1,'2021-12-21 15:45:17','2021-12-21 14:45:53'),('c1c416e0-638c-11ec-8aed-0713b9fba130','dGIxcWQwZmg1bGNwcHRjY3M1a3IyZzN5Mmp6azR0bnY3NGt0cnowaDZw','btc',0.0002,1,'2021-12-23 01:07:53','2021-12-23 00:10:31'),('35baf850-638d-11ec-82ea-cf9716cf1871','dGIxcWxoazRocmhrZWVhNjRrODluazkzdDJxazg2Z3Y5c3J3OG1hNGcw','btc',0.0001,1,'2021-12-23 01:11:08','2021-12-23 00:11:58'),('6498b540-638d-11ec-b564-81619158f9e2','dGIxcXdtam40eDM4bGRlajdwMnkwcDJudWw2eHZqd3A3bjNydnoycGVw','Coin',0.0001,1,'2021-12-23 01:12:27','2021-12-23 00:12:55');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `digital_products`
--

DROP TABLE IF EXISTS `digital_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_products` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `autodelivery` tinyint(1) NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `digital_products_id_foreign` FOREIGN KEY (`id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_products`
--

LOCK TABLES `digital_products` WRITE;
/*!40000 ALTER TABLE `digital_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispute_messages`
--

DROP TABLE IF EXISTS `dispute_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispute_messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dispute_messages_author_id_foreign` (`author_id`),
  KEY `dispute_messages_dispute_id_foreign` (`dispute_id`),
  CONSTRAINT `dispute_messages_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dispute_messages_dispute_id_foreign` FOREIGN KEY (`dispute_id`) REFERENCES `disputes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispute_messages`
--

LOCK TABLES `dispute_messages` WRITE;
/*!40000 ALTER TABLE `dispute_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispute_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disputes`
--

DROP TABLE IF EXISTS `disputes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disputes` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `winner_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disputes_winner_id_foreign` (`winner_id`),
  CONSTRAINT `disputes_winner_id_foreign` FOREIGN KEY (`winner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disputes`
--

LOCK TABLES `disputes` WRITE;
/*!40000 ALTER TABLE `disputes` DISABLE KEYS */;
INSERT INTO `disputes` VALUES ('7ff52620-5fd5-11ec-8e18-61e1dc440cf1',NULL,'2021-12-18 06:38:32','2021-12-24 07:57:00'),('dafe7900-641b-11ec-abe9-1f422845edf8',NULL,'2021-12-23 17:12:14','2021-12-23 17:12:14'),('e250a5c0-6495-11ec-a1d2-41369857b3bf',NULL,'2021-12-24 07:45:45','2021-12-24 07:45:45');
/*!40000 ALTER TABLE `disputes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchanges`
--

DROP TABLE IF EXISTS `exchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exchanges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `from_currency` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `to_currency` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `from_amount` double NOT NULL DEFAULT '0',
  `to_amount` double NOT NULL DEFAULT '0',
  `fee` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchanges`
--

LOCK TABLES `exchanges` WRITE;
/*!40000 ALTER TABLE `exchanges` DISABLE KEYS */;
INSERT INTO `exchanges` VALUES (1,'6bd39550-5ef6-11ec-9699-bb782419c069','btc','usd',1,47225.9729,1460.5971,'2021-12-23 00:11:20','2021-12-22 23:11:20'),(2,'6bd39550-5ef6-11ec-9699-bb782419c069','btc','usd',0.00023,10.7476,0.3324,'2021-12-23 00:26:12','2021-12-22 23:26:12'),(3,'6bd39550-5ef6-11ec-9699-bb782419c069','btc','usd',0.01,467.3266,14.4534,'2021-12-23 00:30:25','2021-12-22 23:30:25'),(4,'6bd39550-5ef6-11ec-9699-bb782419c069','btc','usd',0.01,467.3266,14.4534,'2021-12-23 00:32:38','2021-12-22 23:32:38'),(5,'6bd39550-5ef6-11ec-9699-bb782419c069','btc','usd',0.01,467.3266,14.4534,'2021-12-23 00:35:31','2021-12-22 23:35:31'),(6,'6bd39550-5ef6-11ec-9699-bb782419c069','btc','usd',0.01,469.0435,14.5065,'2021-12-23 01:14:03','2021-12-23 00:14:03'),(7,'be3a1c10-5cff-11ec-8820-3349f825a589','usd','btc',1000,0.02027,0.00041,'2021-12-23 09:23:04','2021-12-23 08:23:04'),(8,'be3a1c10-5cff-11ec-8820-3349f825a589','usd','btc',1000,0.02027,0.00041,'2021-12-23 09:23:37','2021-12-23 08:23:37'),(9,'6bd39550-5ef6-11ec-9699-bb782419c069','btc','usd',1,46898.7337,1450.4763,'2021-12-23 09:25:07','2021-12-23 08:25:07');
/*!40000 ALTER TABLE `exchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_value` decimal(16,2) NOT NULL,
  `type` enum('positive','neutral','negative') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality_rate` tinyint NOT NULL,
  `communication_rate` tinyint NOT NULL,
  `shipping_rate` tinyint NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_vendor_id_foreign` (`vendor_id`),
  KEY `feedback_product_id_foreign` (`product_id`),
  KEY `feedback_buyer_id_foreign` (`buyer_id`),
  CONSTRAINT `feedback_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `feedback_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `feedback_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_product_id_foreign` (`product_id`),
  CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('02658a80-ddb8-11ec-96f9-2100346dc6b0','d7f5e070-ddb7-11ec-b243-69b11100f8ce','products/Px8GPXUHWB89JX8ND5lMYtUQspZHcE431WKGFIOh.png',1,'2022-05-27 08:24:59','2022-05-27 08:24:59'),('5aa11060-de9b-11ec-9d3e-0b72e59a7368','d7f5e070-ddb7-11ec-b243-69b11100f8ce','products/mOXx57rsknv5yaxhU7xydq94l41mIWgjhBelxDd9.png',0,'2022-05-28 11:32:16','2022-05-28 11:32:16'),('8bf3b810-ddb7-11ec-ad76-5df61e2a0573','74b2dd80-ddb7-11ec-a96a-b794858a812e','products/3Flv1NkLNFTIl1ScXGgA32sdrtryxSaevQWe1Nqx.png',1,'2022-05-27 08:22:01','2022-05-27 08:22:01');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `performed_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `performed_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_user_id_foreign` (`user_id`),
  CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_sender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce_sender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_receiver` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce_receiver` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_conversation_id_foreign` (`conversation_id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_receiver_id_foreign` (`receiver_id`),
  CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES ('823bf6d0-df31-11ec-9e06-993b5f2ba0db','eyJpdiI6IlZDOTkwYnhhaWVudFRjWXRYVlNTOFE9PSIsInZhbHVlIjoiOHBVUHB3bHFROFlLZm5xWURhT0pHaFY3eDIzWnVwclBoc1htUkhTY2YxYnZKT1Y1OXBPNjlKYStSeHdlU1J2RyIsIm1hYyI6ImI0M2QwZWE2YWNjZGQ2ZWI4Y2IxN2I5YTk5ZGQyMzE3NjEwOTYzM2UxZjJkMGM3NzYxMjhkZjAzYzg4OGNkOWYiLCJ0YWciOiIifQ==','eyJpdiI6ImIzZlRaWVlJQ1FNZlkwVkk2YTJnNHc9PSIsInZhbHVlIjoiMTVPY2N6QVY2cDNhMG1wQU5kWGhUUU1aRHlNTzVkelFLaHF5YldiRjFxbnQvSFlLSG9TRlZqQk9WU3JOVHJISSIsIm1hYyI6IjdjZTEyY2IzYTZlOGQ3MDUwNDQ3MGRkYjM3ODE0ZDA2N2U5YzQ0YmE0MzUzNjFlOGVkYTkwNDI5ZDU5ZTBhNGEiLCJ0YWciOiIifQ==','eyJpdiI6InJ0SXVtSVFpdHNGRFU4emdLK1hxZGc9PSIsInZhbHVlIjoienlnR0JoZkt4UzJIbFE4NUdKWHlGMjY0UUw5VEVUVVZjRFpFd1JFUWdNeEN4ZE1TN2tkOXdDMTVjajRGWWdmWSIsIm1hYyI6IjI0ZWE3ZWVhMDkxMTM5NTFiNWMzMjlkNTVkMzQ2Yjg5ZDk4YzZhZTRlMGJjMjdjZGFiZjQxMGNiOWE1NmI0MzkiLCJ0YWciOiIifQ==','eyJpdiI6ImtSQ2RydUZnQU1TNG52WTRKWU9sMFE9PSIsInZhbHVlIjoiVVRRZ3FrbEtrVXZNdDhGZ2Z4MzZJOUgveURhTThWcmw4d0hmeDVpMFcrZUxBTC9qYkpDeUdSS0dTNG9XOVBHWSIsIm1hYyI6IjQ3YTU3MGU3MmE1MWI2M2JkMTNlYWEwY2Q4NzFmMzZiNGIwZmUxNTc3OTJiZDNiMTE4MDU5ODFhOTE3ZGVjOWYiLCJ0YWciOiIifQ==','82363690-df31-11ec-93ed-998ea90068a6','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','f5e6eeb0-ddb6-11ec-ab76-a32326a10453',1,'2022-05-29 05:27:07','2022-05-29 05:28:24'),('b36a0600-df31-11ec-9ada-25af97998c6a','eyJpdiI6IjRycTVzVk9rbTlsYlMrbVlxanViYUE9PSIsInZhbHVlIjoiYm5hSnJOaTk3dEk2VzJVWXU5NURXQTVLYWFjcEFRcFc5MlR5dm11cmcwbz0iLCJtYWMiOiI5NWZmYjcyMzhiYjFjMzMxMDJiNWM5OTkyMGRhZmQ5NDkwZGQwOTE0M2U5ZDgxMzc1N2VjMzQzZWUwMGNiOTkyIiwidGFnIjoiIn0=','eyJpdiI6ImxWOUFIbnk3ZllJamNEMWdvOS9ldFE9PSIsInZhbHVlIjoiaXZhOHRTVngwK0U5elVSdkpWaVhXSk5OY1NlR0J0YnZldnZHekx4KzBhc2ZjbFJISzIrVWczeWp4dWR1c1JzcyIsIm1hYyI6IjQ4NDAzYzE3YjVjYmE0Zjc4ODIxZmRhMjg3M2FlMWRhOTkyYzc4Nzk1N2NhZDEyMTY5NzA1NTFlMjY0YWQwYzciLCJ0YWciOiIifQ==','eyJpdiI6Ilk5NXpSV3V0dnp0TVQ2eG1ra1lKTUE9PSIsInZhbHVlIjoiNGxxSkFwOWpNd1YwcW9VWEc1SXc4dmR6RXBQK3lrWm5EZmNFd2UxeUs5MD0iLCJtYWMiOiJjNDIwYWQ5ZTBlZjkwN2JlMDZkY2I0NDdiZjliMjU4YWFlNWZhNGY4N2FjOTE3N2JiYTZkNjQwZDIzZGY1NDMwIiwidGFnIjoiIn0=','eyJpdiI6Ii9ZQjlBUEZJNDJaMVVCbXlML0VjVGc9PSIsInZhbHVlIjoiWUg0bTRpTlA4Sk1admNoS0tPL24wemNUdDJ0SGVpcnZLRm1DWGJpU1Qzd3BnckZFcGQwc0ZCYUdLcEpWU3VSRiIsIm1hYyI6IjUyM2ZlY2M0NmViZWIwMjlkNjkxOWJkODgxZTlmMjE4ZDBmMTZhMTU2NWViYjc5MmI4NzQxZTUyN2QxYzExNzciLCJ0YWciOiIifQ==','82363690-df31-11ec-93ed-998ea90068a6','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','094dd040-ddaf-11ec-8a24-430bb7e4cbf4',0,'2022-05-29 05:28:29','2022-05-29 05:28:29'),('bbb8ad60-df31-11ec-a260-11872f5959f3','eyJpdiI6IlRES0lnbEZra1JLVG5GbXJtR2VDUkE9PSIsInZhbHVlIjoiTnlScUQ0YWNQRVZScWk0bjQ3bkxhcElIRXlVRnhCdnhEUjl1a0IrN2VVdz0iLCJtYWMiOiJhM2M2NWQxYzg0MzJiYjQyZDZhNDkxMzcyYjZmNDZhY2Q2MTEwOGQxNTE1MjU5MDZkYjc2ZTk4MWI1MTEwNDc3IiwidGFnIjoiIn0=','eyJpdiI6IkxNZU5tc3J0bjBlVnlvbEd2Wk1LYXc9PSIsInZhbHVlIjoidGZnanBFZWdLSll1eXp6Vng3U2xLVk1JdGxTaG1kVlpkUjNSdTk1bHB3Qm9sYmlHVVpBVkhiMlpQMjZ5S2JFNiIsIm1hYyI6IjkzZTE5MDhmY2JjNzZhNTVmNDdmYjc5MzdjNjBlNDZiYmEzNGJlZjBkM2IxMTQ4OGJhNWVmZGRhZjQ2ZmJhYzciLCJ0YWciOiIifQ==','eyJpdiI6IjFIbEdhbjZHdFNEUC9mbDlIUFA1YXc9PSIsInZhbHVlIjoiMXcySHlITS93WVRVUnV0Q3pUVGRHUXZTT3RSaytSRFdjUUx3S2dKWXFPMD0iLCJtYWMiOiI4MzI3MzhkYjIzMWJkNGM4MWVlM2M1MWJjNGM0NGQ2Y2FmYWIwNGZiNmUyOGM1NDViYzg5YTlmNTkzMGQ1NjBhIiwidGFnIjoiIn0=','eyJpdiI6InpzUWg1MUZseWYzMW9LWGZOUGhtZXc9PSIsInZhbHVlIjoiR21UNXBoZmE5cEEzb0tiV0lpNlZIKzdDMy9RQzFhSzZHaDZ4NGg4YTBMQ1phRy9YNTlRQld1QnVUQ1dIMmpLUiIsIm1hYyI6ImE1ZTc5MGNhZWJjZTg4ZDE0OTZhYjI5OThmYWYwNTZhMGI5ZjIwNGE3ZjlmOTQ5MTE4MTBlM2JkYmQyZmY0NTkiLCJ0YWciOiIifQ==','bbb35250-df31-11ec-af65-8b08585c98df','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','f5e6eeb0-ddb6-11ec-ab76-a32326a10453',1,'2022-05-29 05:28:43','2022-05-29 05:28:43');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_08_28_103514_create_p_g_p_keys_table',1),(4,'2018_08_30_104044_create_vendors_table',1),(5,'2018_08_30_204259_create_categories_table',1),(6,'2018_08_30_204840_create_admins_table',1),(7,'2018_08_31_121912_create_products_table',1),(8,'2018_08_31_122620_create_physical_products_table',1),(9,'2018_08_31_122628_create_digital_products_table',1),(10,'2018_08_31_182733_create_offers_table',1),(11,'2018_08_31_192727_create_shippings_table',1),(12,'2018_09_01_203115_create_images_table',1),(13,'2018_09_06_132015_create_wishlists_table',1),(14,'2018_09_07_112831_create_feedback_table',1),(15,'2018_09_24_101728_create_purchases_table',1),(16,'2018_10_01_100924_create_disputes_table',1),(17,'2018_10_01_101836_create_dispute_messages_table',1),(18,'2018_10_12_144436_create_conversations_table',1),(19,'2018_10_12_144542_create_messages_table',1),(20,'2018_10_27_205143_create_logs_table',1),(21,'2018_11_15_113419_create_addresses_table',1),(22,'2019_01_05_140832_create_notifications_table',1),(23,'2019_01_11_214222_create_vendor_purchases_table',1),(24,'2019_02_13_101528_create_permissions_table',1),(25,'2019_02_16_185709_create_tickets_table',1),(26,'2019_02_16_190336_create_ticket_replies_table',1),(27,'2019_03_25_133234_create_bans_table',1),(28,'2019_05_11_205112_create_shipping_offers_deleted',1),(29,'2019_05_12_220221_create_purchases_cancelation',1),(30,'2019_05_26_221922_create_product_purchase_types',1),(31,'2019_08_08_091529_add_featured_field_to_products_table',1),(32,'2022_05_29_100039_install_all',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `route_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `route_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('1b6b2740-ddb6-11ec-836a-19f616ededc1','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','You have received new message from [MARKET MESSAGE]',1,'profile.messages','a:1:{s:12:\"conversation\";s:36:\"fb60a190-ddb5-11ec-8f44-c1c16bfc24b1\";}','2022-05-27 08:11:15','2022-05-28 04:01:38'),('823c90b0-df31-11ec-ad21-5b9a5452ee17','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','You have received new message from [buyer]',0,'profile.messages','a:1:{s:12:\"conversation\";s:36:\"82363690-df31-11ec-93ed-998ea90068a6\";}','2022-05-29 05:27:07','2022-05-29 05:27:07'),('b36a9c20-df31-11ec-b0cd-2f737ef48952','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','You have received new message from [seller]',1,'profile.messages','a:1:{s:12:\"conversation\";s:36:\"82363690-df31-11ec-93ed-998ea90068a6\";}','2022-05-29 05:28:29','2022-05-29 05:34:10'),('bbb93410-df31-11ec-acd4-e9aaf767a6bd','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','You have received new message from [seller]',0,'profile.messages','a:1:{s:12:\"conversation\";s:36:\"bbb35250-df31-11ec-af65-8b08585c98df\";}','2022-05-29 05:28:43','2022-05-29 05:28:43'),('fb641210-ddb5-11ec-ba75-f7360cd945e2','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','You have received new message from [MARKET MESSAGE]',1,'profile.messages','a:1:{s:12:\"conversation\";s:36:\"fb60a190-ddb5-11ec-8f44-c1c16bfc24b1\";}','2022-05-27 08:10:21','2022-05-28 04:01:38');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_quantity` int NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `offers_product_id_foreign` (`product_id`),
  CONSTRAINT `offers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES ('9185fdf0-ddb7-11ec-8bbc-4131fb72b141','74b2dd80-ddb7-11ec-a96a-b794858a812e',222,22.00,'2022-05-27 08:22:01','2022-05-27 08:22:01',0),('de253080-ddb7-11ec-8039-f9a1877ecd12','d7f5e070-ddb7-11ec-b243-69b11100f8ce',3,0.02,'2022-05-27 08:24:59','2022-05-27 08:24:59',0);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_user_id_foreign` (`user_id`),
  CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgpkeys`
--

DROP TABLE IF EXISTS `pgpkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgpkeys` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pgpkeys_user_id_foreign` (`user_id`),
  CONSTRAINT `pgpkeys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgpkeys`
--

LOCK TABLES `pgpkeys` WRITE;
/*!40000 ALTER TABLE `pgpkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `pgpkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_products`
--

DROP TABLE IF EXISTS `physical_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physical_products` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_option` enum('all','include','exclude') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'all',
  `countries` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `physical_products_id_foreign` FOREIGN KEY (`id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_products`
--

LOCK TABLES `physical_products` WRITE;
/*!40000 ALTER TABLE `physical_products` DISABLE KEYS */;
INSERT INTO `physical_products` VALUES ('74b2dd80-ddb7-11ec-a96a-b794858a812e','all','','AFG','2022-05-27 08:22:01','2022-05-27 08:22:01'),('d7f5e070-ddb7-11ec-b243-69b11100f8ce','all','USA','USA','2022-05-27 08:24:59','2022-05-27 08:24:59');
/*!40000 ALTER TABLE `physical_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `mesure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `coins` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_user_id_foreign` (`user_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('74b2dd80-ddb7-11ec-a96a-b794858a812e','asdasd','asd','asdasd',1,'11',1,'btc,xmr','51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','2022-05-27 08:22:00','2022-05-27 08:22:00','normal',0),('d7f5e070-ddb7-11ec-b243-69b11100f8ce','xc vxcvv','xvxc','xcvxcv',500,'555',1,'btc,xmr,usd,stb','54d3b1a0-5f2e-11ec-8944-734a1bbb1192','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','2022-05-27 08:24:58','2022-05-28 11:01:15','normal',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_pay` decimal(24,12) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('purchased','sent','delivered','disputed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'purchased',
  `type` enum('fe','normal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `coin_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'btc',
  `marketplace_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `multisig_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `redeem_script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hex` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `delivered_product` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_offer_id_foreign` (`offer_id`),
  KEY `purchases_shipping_id_foreign` (`shipping_id`),
  KEY `purchases_buyer_id_foreign` (`buyer_id`),
  KEY `purchases_vendor_id_foreign` (`vendor_id`),
  KEY `purchases_feedback_id_foreign` (`feedback_id`),
  CONSTRAINT `purchases_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchases_feedback_id_foreign` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchases_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchases_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `duration` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_quantity` int NOT NULL,
  `to_quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `shippings_product_id_foreign` (`product_id`),
  CONSTRAINT `shippings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippings`
--

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;
INSERT INTO `shippings` VALUES ('068594c0-ddb8-11ec-9d09-b34a790a3132','d7f5e070-ddb7-11ec-b243-69b11100f8ce','r',4.01,'4',44,4,'2022-05-27 08:24:59','2022-05-27 08:24:59',0),('06860390-ddb8-11ec-b32e-790f56496604','d7f5e070-ddb7-11ec-b243-69b11100f8ce','dfg',44.00,'44',44,4,'2022-05-27 08:24:59','2022-05-27 08:24:59',0),('9c4cf2e0-ddb7-11ec-bb79-ffef047e0f30','74b2dd80-ddb7-11ec-a96a-b794858a812e','11',22.00,'asdasd',22,222,'2022-05-27 08:22:01','2022-05-27 08:22:01',0),('9c4db1c0-ddb7-11ec-92f6-75c64576c3c6','74b2dd80-ddb7-11ec-a96a-b794858a812e','22',222.00,'222',222,222,'2022-05-27 08:22:01','2022-05-27 08:22:01',0),('f7fd3f50-de62-11ec-b710-1b5480f22b67','d7f5e070-ddb7-11ec-b243-69b11100f8ce','test',44.00,'4',1,10,'2022-05-28 04:48:39','2022-05-28 04:48:39',0);
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`),
  KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
INSERT INTO `ticket_replies` VALUES ('cca083a0-de95-11ec-8e10-09b1fcc91995','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','cca016a0-de95-11ec-9d59-5bb24b6c3a2d','test123213123','2022-05-28 10:52:30','2022-05-28 10:52:30'),('dc0cf800-de96-11ec-8b78-ebe1e74bde11','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','cca016a0-de95-11ec-9d59-5bb24b6c3a2d','test','2022-05-28 11:00:05','2022-05-28 11:00:05');
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answered` tinyint(1) NOT NULL DEFAULT '0',
  `solved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('cca016a0-de95-11ec-9d59-5bb24b6c3a2d','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','test',1,0,'2022-05-28 10:52:30','2022-05-28 11:00:05');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mnemonic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_seen` timestamp NULL DEFAULT NULL,
  `login_2fa` tinyint(1) NOT NULL DEFAULT '0',
  `referral_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `referred_by` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pgp_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `msg_public_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `msg_private_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `btc_balance` float DEFAULT '0',
  `xmr_balance` float DEFAULT '0',
  `usd_balance` float DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_referred_by_foreign` (`referred_by`),
  CONSTRAINT `users_referred_by_foreign` FOREIGN KEY (`referred_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('094dd040-ddaf-11ec-8a24-430bb7e4cbf4','buyer','$2y$10$tlF2pZR3hxNOVSBw0GyMkelT3WeHYvspnYIPtbKHSQVbulICS8L36',NULL,'$2y$10$I0SEQTNAGKCUYPo77C/NGunh5TOlMNi5.kQnGtmyZ5QMFfTkXFGva',NULL,'2022-05-29 05:24:55',0,'F8VDTP',NULL,'-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: BCPG v1.58\r\n\r\nmI0EYpBT6QEEALlphtBxN4cl+/vG/O/HlFV45YKdkmdf3kYVU02zDVKirwyZy6iu\r\nnXr3cIKeIf49oJ5PaZbtGiCkECNkMc0IPQzUD8RyypDNDBbuoAmfzBUSp8bBsx4u\r\nj0BA6p0GV01MoCC1ihkBokLBUcyfHzZzHoD5z4ftpR3JIi3J5phDNkPLABEBAAG0\r\nC21hcmtldHBsYWNliJwEEAECAAYFAmKQU+kACgkQBOlpcoj0VzAlbQP/YHloodX2\r\nYzFnTk22BktWL56FNQ03FWhQMKnSF32JwFKxjK1k35/2WrQwz1+Sr47PjfumEHAT\r\npwCntc1rEpc4UKtaP3jlvmEe1Gpw+Aq5UnZ62Wb6Pq+9+i/SHr8UaYjcZSRo3rkG\r\n32OebQqsx+GS5z9APyuLMLsP2NdXPa0vct0=\r\n=mrNo\r\n-----END PGP PUBLIC KEY BLOCK-----','eyJpdiI6Ijk2Y1U2a090Ykk1bm14bUdOamdnanc9PSIsInZhbHVlIjoibU1CaExVNTVRMXNLZDhaVVJBcjRYMXp5K25FYmVCaEtoMFNoMFlIdzNSWGNtYk90Zm1yVEs1dEFzVXpTb2ExSldxNU5uaEJ4UEtSVCtOMnRxYVdhc2lWWkNFaXRtQWQ1cDNQUHJaVUJYTUdobThpVW45Zm9tL2h1L0hsSHpCR3E5R0MyaStwUDFqQU5LUWVqV0lNUEdrYktwdW40VTdZLzcrMXNuNjRsVXB2MWF0VzdHeU1ybk9ubFZ4SzZVTHdDQ0QyQWN4U2RBdGtzSUZOR3AzWCtBaG4rQng1R2pTMkxMTWlwSmF4RkU4YXZlOFBpWjVnZktMUjJvVUpGQUU4NEI0WXdmM09paWIrWldvclYyK0F0QU90NFR6QlJLUFdhM1ZqMGY3SlBVUDNNeDFYU2JmWU41anQ3Q3hNQUg4SGVWdGR6bWhpSXdKK21SRHdoV3V3S0ZyeDgra3dXSkFDemR4R1Zzb0tWMk1rPSIsIm1hYyI6ImEyNjY0Zjc1ZDgzMjhjMjRjMjAzNDZmNzE2NzVlZWQ1Nzk1ZjFhMzNkNzY1NDE0ZjI5YmExYjk5Y2ZmMGNmMmEiLCJ0YWciOiIifQ==','eyJpdiI6IkRKQzMrZFRiOUFSYU9QSDc4ZjN1SEE9PSIsInZhbHVlIjoiZ3dzdWlkb3VoaHptWjZrMldOQUZmVkNjMEI3U3FzNGJwSUIrVzIyOTRCbTRPR2JpSnI2TkNEU25jeTBkVFdXK05meGZQVDRvcnhBQkhVY2l6L3FleWVqT2dIUGNQWmpLYi9ISGZmVjBPdzRXZlFlK1p6SllzNjFMOSttaDZYTWhlMk9MQ2l4TXJZZGxmR3hSaW9OUUxNZ3RFOTFPZUI0YlFVSE5tUXBudG94YUJ4bGlVSWxrQk42ZFJqUzRoS0IraW1HZWNBMHdBMGJBblk2ZUMrclR2M2s2K0MxZWRpL29LREdnUjVPR1dVcjhjSWR1YjVmQzNBNmMyTXNiT1B5NENWZWwzT0FLWHdHSHVLanpoUEhjWVZFUm5ZaWlXeUpQbmtmOWJwNkRiVFNqVHM5TEtLRGVUb2xyQXVXcDNycERkK29YK1lQM1ZsMTE3U2xaQzAwb3lBPT0iLCJtYWMiOiIzYjA4OTcxMzMyY2FlYjFiMmU1ZmI5MjdkZDY5ZGNhM2ZmMWVlMmQ0ZGFmY2Y4MTk0YWEzZjQ2YzlmYThmZjdmIiwidGFnIjoiIn0=','2022-05-27 07:20:38','2022-05-29 05:24:55',0,0,0),('f5e6eeb0-ddb6-11ec-ab76-a32326a10453','seller','$2y$10$e1qZqR8vB9wd/XRsksOEFequu7uJ9uPiCUvU.XJ46XK7RnPd9fs1m',NULL,'$2y$10$iwY5y57rFxcvqa/GItfYp.JdYNYkmYPeIGfo.qEhi2Qj6VYckEA8.',NULL,'2022-05-29 05:26:29',0,'0I7THN',NULL,'-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: BCPG v1.58\r\n\r\nmI0EYpBT6QEEALlphtBxN4cl+/vG/O/HlFV45YKdkmdf3kYVU02zDVKirwyZy6iu\r\nnXr3cIKeIf49oJ5PaZbtGiCkECNkMc0IPQzUD8RyypDNDBbuoAmfzBUSp8bBsx4u\r\nj0BA6p0GV01MoCC1ihkBokLBUcyfHzZzHoD5z4ftpR3JIi3J5phDNkPLABEBAAG0\r\nC21hcmtldHBsYWNliJwEEAECAAYFAmKQU+kACgkQBOlpcoj0VzAlbQP/YHloodX2\r\nYzFnTk22BktWL56FNQ03FWhQMKnSF32JwFKxjK1k35/2WrQwz1+Sr47PjfumEHAT\r\npwCntc1rEpc4UKtaP3jlvmEe1Gpw+Aq5UnZ62Wb6Pq+9+i/SHr8UaYjcZSRo3rkG\r\n32OebQqsx+GS5z9APyuLMLsP2NdXPa0vct0=\r\n=mrNo\r\n-----END PGP PUBLIC KEY BLOCK-----','eyJpdiI6IjhIWmRQak9pOUxpQWZWZE9vYU9KTGc9PSIsInZhbHVlIjoiVVY5TlJrcG1JWnRxVThLbHROUUlTZzFkV3NrMkE1MjZxWVRET3NENDMraHN4Z2dhSVcvc3o3VU4ySjBXOFdReUprMFVhZW12cGZya0dyKzg1ak1UeW9Pazlva2tPSGQ2SGJZUS91QlpEV25UODdGY0t4c1hwTEl6NUpaZ09wYS9pbFJIL0NmQWV4c2dZVjJXTWNUWXNkL3dTbkxaNWhIajE0eDZEUGF1UUliWWlLYkF1clNUWmk1U3VYK3VFZkNHd1BJOGRuKzlIQ3dhR1FNWnNEaTFQMlZldm1uSE9SRnpjbTJFSCtXWEhjVFFtUmluNDZhR3Izc05GcEM0YUZOQ2hQZHo4TFZhZm1FU0ozZkQ1TDIySmxkcUhIamJrUGpVYUFTeFZSRVo3RFVEZldFRmpVMGhhRm1PSzFsSFE1SEc4Rk93elVkZFgzeGZBZE5ZY0E0UkxKUTJZcUMzNHZoczNpV2ZHK0hMeVRnPSIsIm1hYyI6ImM2MDMxNmNmNzdiMTkwZTJiZTg5MzI1ZjMzZjBjYmZiNmVhMDcxYjYwODhlNDc3OGE1ZjM2MDFmOTQxY2RhZDkiLCJ0YWciOiIifQ==','eyJpdiI6IkZtNmk4K0lXTjVibWUvTS9lTjRieHc9PSIsInZhbHVlIjoiRFF4VU1tWUt1eGZJU0drYy80MkFoTytJNTQ0NmZwdEw2UXNnQnBRVE95Snl5cFVJbVBWdFlSVEEzQzFRWEFYVXVWNFZCREFTWGdFb3JpdTZhYTVRS1FFVkVCOXZkTzJETEUwaWErRHJhZkQxYVduWlkxYnhNUzNPY3phbVYzZXhWK29xQkFlOEtkRXJBYjQ1Q01ORkRGUnFaNWpZZGdqQmVwZEtHY0p4Nit4WmdXd3h1L0F5clNqMTJFM3RzYnRQaFp2dDdIUkFackRDRitWMkFZa1FWZDBwV2V4SUZ6czNKOFowcE9SWVFTNEpxK0VTVGxmY3FxWnJlaEhGeUgvcUF0eER1b1R6QWVMc21PRWlzN2JadXd4WWxuaGRrMTdOblRkUGhaaWVuN29wNzEwTFJrNlJmS1BmQ0lXZFAwMFgxOWQzRCsyaU8xYUlPRmNvTFJFZ0lnPT0iLCJtYWMiOiJmODA4NDFjMWIxNjA3NjgwNWQ0MjAzMzA0NGFjNzZiMmExYmFkMWQ5NWUyMjQwZGMzODI3ZTliYjU1MzM5NDU4IiwidGFnIjoiIn0=','2022-05-27 08:17:22','2022-05-29 05:26:29',0,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_purchases`
--

DROP TABLE IF EXISTS `vendor_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_purchases` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(24,12) NOT NULL DEFAULT '0.000000000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_purchases_user_id_foreign` (`user_id`),
  CONSTRAINT `vendor_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_purchases`
--

LOCK TABLES `vendor_purchases` WRITE;
/*!40000 ALTER TABLE `vendor_purchases` DISABLE KEYS */;
INSERT INTO `vendor_purchases` VALUES ('1d6be220-ddaf-11ec-bdbb-675e965d5ec5','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','','usd',0.000000000000,'2022-05-27 07:21:12','2022-05-27 07:21:12'),('1d6c6bd0-ddaf-11ec-9fd0-698bf57d277d','094dd040-ddaf-11ec-8a24-430bb7e4cbf4','addressStub#737778','stb',0.000000000000,'2022-05-27 07:21:12','2022-05-27 07:21:12'),('f8aebbc0-ddb6-11ec-9c44-47534cc8dbfe','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','','usd',0.000000000000,'2022-05-27 08:17:26','2022-05-27 08:17:26'),('f8af4750-ddb6-11ec-954d-436c44c0e61c','f5e6eeb0-ddb6-11ec-ab76-a32326a10453','addressStub#564576','stb',0.000000000000,'2022-05-27 08:17:26','2022-05-27 08:17:26');
/*!40000 ALTER TABLE `vendor_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_level` int unsigned NOT NULL,
  `experience` int NOT NULL DEFAULT '0',
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `profilebg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `trusted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `vendors_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES ('094dd040-ddaf-11ec-8a24-430bb7e4cbf4',0,0,'asd','profile-bg-blueprint',0,'2022-05-27 07:30:02','2022-05-27 07:30:07'),('f5e6eeb0-ddb6-11ec-ab76-a32326a10453',0,0,'asdasd','profile-bg-carbon',0,'2022-05-27 08:20:05','2022-05-28 10:53:04');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES ('094dd040-ddaf-11ec-8a24-430bb7e4cbf4','74b2dd80-ddb7-11ec-a96a-b794858a812e','2022-05-27 08:28:10','2022-05-27 08:28:10'),('6bd39550-5ef6-11ec-9699-bb782419c069','7d876700-6110-11ec-b7cb-9b3c44439e2b','2021-12-23 08:27:53','2021-12-23 08:27:53'),('83e50b10-dbb4-11ec-aaf6-07ab208eb37a','9c920670-649b-11ec-afe1-5b07297a2756','2022-05-27 01:32:28','2022-05-27 01:32:28');
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29 14:51:32
