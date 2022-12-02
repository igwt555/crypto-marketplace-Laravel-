-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: marketplace
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pubkey` text COLLATE utf8mb4_unicode_ci,
  `coin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `addresses` VALUES ('2388a460-5f37-11ec-9282-33a7fffead34','6bd39550-5ef6-11ec-9699-bb782419c069','tb1qufnd09ryf8f4d0ugeavrn4z08v775jkq9wq5hy',NULL,'btc','2021-12-17 11:44:56','2021-12-17 11:44:56'),('85ec5a00-6112-11ec-9cb5-552492031b1f','be3a1c10-5cff-11ec-8820-3349f825a589','42ravkwgiK2FDSd1BXuWz1FLRDAYkmRdDNiWXXAebBrkiEYhbAQaSPaVuvsFQm97vrNTfpfP2iDn2GPG4i6GZwdXE9pbJag',NULL,'xmr','2021-12-19 20:27:52','2021-12-19 20:27:52'),('d09e9710-5f2f-11ec-9997-db8f70f9f2da','be3a1c10-5cff-11ec-8820-3349f825a589','mrb1jnY7Gp7WcvdLGhywAWsvBdV21b93sb',NULL,'btc','2021-12-17 10:52:30','2021-12-17 10:52:30');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `admins` VALUES ('4b103370-5f17-11ec-ad74-7533ad11f6e7','2021-12-17 07:56:58','2021-12-17 07:56:58');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bans` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `categories` VALUES ('4bc7de50-5f2e-11ec-ae55-dbd1d34f7973',NULL,'Mobile','2021-12-17 10:41:38','2021-12-17 10:41:38'),('51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','4bc7de50-5f2e-11ec-ae55-dbd1d34f7973','Android','2021-12-17 10:41:48','2021-12-17 10:41:48'),('54d3b1a0-5f2e-11ec-8944-734a1bbb1192',NULL,'Web','2021-12-17 10:41:53','2021-12-17 10:41:53');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `conversations` VALUES ('f12668c0-5f34-11ec-b1b5-1b1372a84ed9','6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-17 11:29:13','2021-12-17 11:31:43');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` float DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES ('fec0d410-6274-11ec-9ebd-eb9848776b5e','dGIxcXNzd3UzdDM4ZTQyOXA1c3lzdmx2d3A1Y2R3M2ZycndxOGNma3Jk','btc',0.0001,1,'2021-12-21 15:45:17','2021-12-21 14:45:53'),('c1c416e0-638c-11ec-8aed-0713b9fba130','dGIxcWQwZmg1bGNwcHRjY3M1a3IyZzN5Mmp6azR0bnY3NGt0cnowaDZw','btc',0.0002,1,'2021-12-23 01:07:53','2021-12-23 00:10:31'),('35baf850-638d-11ec-82ea-cf9716cf1871','dGIxcWxoazRocmhrZWVhNjRrODluazkzdDJxazg2Z3Y5c3J3OG1hNGcw','btc',0.0001,1,'2021-12-23 01:11:08','2021-12-23 00:11:58'),('6498b540-638d-11ec-b564-81619158f9e2','dGIxcXdtam40eDM4bGRlajdwMnkwcDJudWw2eHZqd3A3bjNydnoycGVw','Coin',0.0001,1,'2021-12-23 01:12:27','2021-12-23 00:12:55'),('7b7c28c0-638d-11ec-9467-f180631e781a','dGIxcWthNnQ1ZXNxOW05cGwwazVhYTloa2xocGhwendlbnhqbXprNmxs','btc',0.0001,1,'2021-12-23 01:13:05','2021-12-23 00:13:31');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_products`
--

DROP TABLE IF EXISTS `digital_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_products` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autodelivery` tinyint(1) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `digital_products` VALUES ('7b00c340-6402-11ec-833a-a5b3893fbf87',0,'fdafdsafdsafds','2021-12-23 14:14:42','2021-12-23 14:14:42'),('7d876700-6110-11ec-b7cb-9b3c44439e2b',0,'fdsa','2021-12-19 20:13:45','2021-12-19 20:13:45'),('9c920670-649b-11ec-afe1-5b07297a2756',0,'fdsafdsa','2021-12-24 08:27:17','2021-12-24 08:27:17'),('a8eee610-5fe4-11ec-9df1-dd1b1f0b2fa3',0,'Website Template','2021-12-18 08:27:37','2021-12-18 08:27:37'),('d03026c0-5f2e-11ec-a4b3-111e006fd984',0,'Android Tutorial App','2021-12-17 10:49:03','2021-12-17 10:49:03'),('ecf3d440-5ff7-11ec-8415-833d7d6df95e',0,'Mobile Template','2021-12-18 10:45:22','2021-12-18 10:45:22'),('f73ec260-5fd2-11ec-9b3f-c17d266f9f1a',0,'fdsafdsa','2021-12-18 06:21:05','2021-12-18 06:21:05');
/*!40000 ALTER TABLE `digital_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispute_messages`
--

DROP TABLE IF EXISTS `dispute_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispute_messages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `dispute_messages` VALUES ('0eb71c00-6497-11ec-8dd6-bfaf02eda2f5','fdsa','4b103370-5f17-11ec-ad74-7533ad11f6e7','7ff52620-5fd5-11ec-8e18-61e1dc440cf1','2021-12-24 07:54:09','2021-12-24 07:54:09'),('7ff5c410-5fd5-11ec-9200-fbba5e46e6a2','fdsa','be3a1c10-5cff-11ec-8820-3349f825a589','7ff52620-5fd5-11ec-8e18-61e1dc440cf1','2021-12-18 06:38:32','2021-12-18 06:38:32'),('915f3830-5fd5-11ec-b27b-af5989131cc7','fsafds','6bd39550-5ef6-11ec-9699-bb782419c069','7ff52620-5fd5-11ec-8e18-61e1dc440cf1','2021-12-18 06:39:01','2021-12-18 06:39:01'),('daff2390-641b-11ec-b8fd-f71a4ed4e9e2','ggdfsgfs','be3a1c10-5cff-11ec-8820-3349f825a589','dafe7900-641b-11ec-abe9-1f422845edf8','2021-12-23 17:12:14','2021-12-23 17:12:14'),('e250ebd0-6495-11ec-a2b3-35b2bcf5bf8f','fdsafdsafdsa','6bd39550-5ef6-11ec-9699-bb782419c069','e250a5c0-6495-11ec-a1d2-41369857b3bf','2021-12-24 07:45:45','2021-12-24 07:45:45');
/*!40000 ALTER TABLE `dispute_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disputes`
--

DROP TABLE IF EXISTS `disputes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disputes` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winner_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `disputes` VALUES ('7ff52620-5fd5-11ec-8e18-61e1dc440cf1','6bd39550-5ef6-11ec-9699-bb782419c069','2021-12-18 06:38:32','2021-12-24 07:57:00'),('dafe7900-641b-11ec-abe9-1f422845edf8',NULL,'2021-12-23 17:12:14','2021-12-23 17:12:14'),('e250a5c0-6495-11ec-a1d2-41369857b3bf',NULL,'2021-12-24 07:45:45','2021-12-24 07:45:45');
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
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_currency` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `to_currency` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buyer_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_value` decimal(16,2) NOT NULL,
  `type` enum('positive','neutral','negative') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality_rate` tinyint NOT NULL,
  `communication_rate` tinyint NOT NULL,
  `shipping_rate` tinyint NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `feedback` VALUES ('00f0b710-5fd2-11ec-b9e0-57d56ffe18b7','be3a1c10-5cff-11ec-8820-3349f825a589','6bd39550-5ef6-11ec-9699-bb782419c069','d03026c0-5f2e-11ec-a4b3-111e006fd984','Android Tutorial App',1.00,'neutral',5,5,5,'very good','2021-12-18 06:13:30','2021-12-18 06:13:30'),('7d6e9c60-6493-11ec-8cca-c76da6cf3f00','be3a1c10-5cff-11ec-8820-3349f825a589','6bd39550-5ef6-11ec-9699-bb782419c069','7b00c340-6402-11ec-833a-a5b3893fbf87','aaaaaa',100.00,'positive',5,5,5,'Good!!!','2021-12-24 07:28:36','2021-12-24 07:28:36');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `images` VALUES ('05dd6840-5fd3-11ec-8368-85e10b41de78','f73ec260-5fd2-11ec-9b3f-c17d266f9f1a','products/Frqd90iLzCBR0OqSRpXELNXhkc7I3YSjfJq3swXG.png',1,'2021-12-18 06:21:05','2021-12-18 06:21:05'),('4d36b480-5f2f-11ec-ac78-ed859b2e6c6c','d03026c0-5f2e-11ec-a4b3-111e006fd984','products/0klPvAt3rjXuSByV1hvxk2iuu0GMHnOkTlda8w31.png',1,'2021-12-17 10:49:03','2021-12-17 10:49:03'),('8a666600-6110-11ec-a848-97e70fc24c9c','7d876700-6110-11ec-b7cb-9b3c44439e2b','products/cvWIFNfKUeO8NDW0QJ0Tme8L2mrU1d4TJd2hxrQ7.png',1,'2021-12-19 20:13:45','2021-12-19 20:13:45'),('a9150950-649b-11ec-b5c4-2b3b2a159c30','9c920670-649b-11ec-afe1-5b07297a2756','products/32QDaI8UI16DdVu399pjhXyoERrBMTs6yc7md2oh.png',1,'2021-12-24 08:27:17','2021-12-24 08:27:17'),('bb949e60-5fe4-11ec-a940-778d3d4afff0','a8eee610-5fe4-11ec-9df1-dd1b1f0b2fa3','products/qThHJVLoaiVTpif8bcFzdLdrGhtgTNk9JDesRKGD.png',1,'2021-12-18 08:27:37','2021-12-18 08:27:37'),('fa14e160-5ff7-11ec-809c-d5c30bdf852d','ecf3d440-5ff7-11ec-8415-833d7d6df95e','products/Xl6ggfNQ6uN7wYbz2X0JF28NYdwt7QatuTxuNYIm.png',1,'2021-12-18 10:45:22','2021-12-18 10:45:22'),('fbccb9a0-6402-11ec-baa4-03982105e754','7b00c340-6402-11ec-833a-a5b3893fbf87','products/Ns83qbWEc3jO7TiaNkgubqTuy7TLFTYpbQcr2pIR.png',1,'2021-12-23 14:14:42','2021-12-23 14:14:42');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `performed_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `performed_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `logs` VALUES ('392a5550-641d-11ec-a1e4-2302ecd2d352','4b103370-5f17-11ec-ad74-7533ad11f6e7','update','6cf3e5a0-5f17-11ec-82a4-5d39e1dc65be','App\\User','Permissions updated','2021-12-23 17:22:01','2021-12-23 17:22:01');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_sender` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce_sender` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_receiver` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce_receiver` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `messages` VALUES ('4a98cbc0-5f35-11ec-831b-b103a37d2ac5','eyJpdiI6IjZzR2VZN2FrMldhY000SVJWeFdaMlE9PSIsInZhbHVlIjoia1JvRUJcL3owR2xZZlpDejhFUENwQVo0RStKSUxNMkVQdDJjemw5RTNEOXQ3eGxzeDM3VGxpejVXSFRYUkFKWmdiMHM1WTdGbWpVanBWSUhXeEVkQnBzdlVXRTV2RDdCVFwvb1pSTjhsTndFN0FcL1NXQnNRKzJrUG4zU2pweXFzdE8iLCJtYWMiOiIwM2VmY2E5YzMxYzU2M2RkMWI4YzFkMjY2MzJiNTRmNWIyNmY1NWE0NGM4ZGEzNWU5MjAyN2VlZDYzMDU1NDAxIn0=','eyJpdiI6IjR1SHVUdDNUNTVJR2RzSW1XSURPSGc9PSIsInZhbHVlIjoiXC9iZFM5TWhESk9zaTNrWXhmV01EY2FPZ2lCdmNHY2pcL2hScjBraGhhVmhVaVV5d3dZZ2ZBN0RTVEphaFVnanhOIiwibWFjIjoiZjA2NTcyMTU4ZGQ0MjY4ZDMxZjY3MDE0NDg5ZGI0MDNjZWQxMzFkMWQ4NDk4MmY3ZTM1MzJjMDExN2NhMTM5YSJ9','eyJpdiI6InZmY3hoVWJSQURWTEc4blRERVhaNXc9PSIsInZhbHVlIjoiUmFRRTRkb1UxcG1Bd0N2NTJ4alBQSTBVS1ZsUjVLRVp5V1BybFhFZEZVUGRcL0lCZm1vYlhQMWxycHNnRXZhTDVjYnVsVVJ2c09lUmRXV1wvRkNUNXpYTnZ2Z2tKR2dYakk4WkJqOStIZHM0c0ZFeU9lemZcL2ZicUwwTGlvcEtYZVMiLCJtYWMiOiIzYTFmY2RmYzVmNDRmODM5ZWIwZDU5ZGRhNDAxMGY4N2U1ZDNlMTFjZjkwMmM4YmE4NDM1OWIxYjJjNDE2Mjc1In0=','eyJpdiI6Im92Y2pxMFQ5NTk0cUJTbFdRSlloWnc9PSIsInZhbHVlIjoiVlwvZXRucFB3VEdcL3hBd1Y3WkExS215MGtmT1RCdkgyZGJPcFJuSDRtWmZrdzA0XC9CTnVlbWtHSFVMeWFWb2ZHQiIsIm1hYyI6IjQ1Y2VkMzdhOTAzZGRmN2YwM2Y5ODZmZTVhNDNhNDI2NDhiODM5YjgyYzJlM2RhMDUxNGQzZjQ3MDEzMDA0MTcifQ==','f12668c0-5f34-11ec-b1b5-1b1372a84ed9','be3a1c10-5cff-11ec-8820-3349f825a589','6bd39550-5ef6-11ec-9699-bb782419c069',1,'2021-12-17 11:31:43','2021-12-17 11:44:06'),('f168d270-5f34-11ec-b961-0d5a1e450214','eyJpdiI6IlwvdHQ2WFNlVDNoTllHMkxxVWhkRzdBPT0iLCJ2YWx1ZSI6IlBpSGFDbGtSNm5BSE01Rk51aTQ2N3RreU5uaEYxZW56RkcyTVE0TUF4YmV6ZWsxVzNGYlwvd3h0TWdzNFZpRnU1QVwveGtzOHV5ekFGQnRwSHFHZklDeE5YWUtLUnQ1UXhRYWg5RE9BUnFzY1RQOE44RExDUFFzRFRjNVh1TFY0dm8iLCJtYWMiOiI1NzAwYTlhMzliYzU3ZjM2Mzc4YzliM2ZkN2EyMmY4YmYyMzA5NGFhMDY4NTc5ODIyOTIxMTY5ZTU0NjhkYWQ2In0=','eyJpdiI6Ind4V0QraEtsWnBcL0FCUXZiZFRUSVl3PT0iLCJ2YWx1ZSI6IldoSElPQXRZSnhQS01tOWZ4QlFPcDRpeENHd28rTGwzTmFOeHFLSVRYdmlcL1hrQTM1MGYrZkVsMFZmRyt4ekh4IiwibWFjIjoiOWM4ODA2NGEwNjNmNDgyMGU3MDkyNDJlMDY5NTEyZjY3OTQyMGMzZTUwNjIxZjRiMzgyOWE5YmZhMTU0Y2Y3ZCJ9','eyJpdiI6ImN6R0JUUlFwXC9nU092TjdpZkNxeDBRPT0iLCJ2YWx1ZSI6IjJmRlVxNUVFeU9mWEh6Sldvc2F1WG44MWFMRVN6TUREbVE5U2VmZ1lsWllZNnJnRitCQXNYSSt2NFc2UU9ocVhzZ3hKdkJZekVtVzJYUDhGZmxrWGZoNCtlTjQwUzUxYTM3OGRiXC9mZjRRUHhnRVYrYnVvQU4xVXFjeGlaZ3psdyIsIm1hYyI6ImI1YjQ2MDRlMTEyMmM0Y2RhNzQ5YTFiYWFjMjAwODgxMWFhMTJkOGJjMTM5MmI0YTEwNWEyZWU4Nzc4YTlkZTYifQ==','eyJpdiI6ImhiVk5rR2tCRm9jT0VpTFN0MFFSZXc9PSIsInZhbHVlIjoiekFab3BReW5sMkc5b0lVQ1V4MWhFY1lJZ1h2XC9tVmgwMlErZFlkWjFNT3lpN2xNeDYxWkpTV0l1TE5TVnpUQWkiLCJtYWMiOiI5OWQwNDhmM2E5ZjcyZWQ5NTQ3ZGIzN2YzOGFjOGJhOGViNmQ3NDlmZDU2ZmQwZjM5MjlmMGYxNDI2ZDIzYTkyIn0=','f12668c0-5f34-11ec-b1b5-1b1372a84ed9','6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',1,'2021-12-17 11:29:13','2021-12-17 11:31:12');
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_08_28_103514_create_p_g_p_keys_table',1),(4,'2018_08_30_104044_create_vendors_table',1),(5,'2018_08_30_204259_create_categories_table',1),(6,'2018_08_30_204840_create_admins_table',1),(7,'2018_08_31_121912_create_products_table',1),(8,'2018_08_31_122620_create_physical_products_table',1),(9,'2018_08_31_122628_create_digital_products_table',1),(10,'2018_08_31_182733_create_offers_table',1),(11,'2018_08_31_192727_create_shippings_table',1),(12,'2018_09_01_203115_create_images_table',1),(13,'2018_09_06_132015_create_wishlists_table',1),(14,'2018_09_07_112831_create_feedback_table',1),(15,'2018_09_24_101728_create_purchases_table',1),(16,'2018_10_01_100924_create_disputes_table',1),(17,'2018_10_01_101836_create_dispute_messages_table',1),(18,'2018_10_12_144436_create_conversations_table',1),(19,'2018_10_12_144542_create_messages_table',1),(20,'2018_10_27_205143_create_logs_table',1),(21,'2018_11_15_113419_create_addresses_table',1),(22,'2019_01_05_140832_create_notifications_table',1),(23,'2019_01_11_214222_create_vendor_purchases_table',1),(24,'2019_02_13_101528_create_permissions_table',1),(25,'2019_02_16_185709_create_tickets_table',1),(26,'2019_02_16_190336_create_ticket_replies_table',1),(27,'2019_03_25_133234_create_bans_table',1),(28,'2019_05_11_205112_create_shipping_offers_deleted',1),(29,'2019_05_12_220221_create_purchases_cancelation',1),(30,'2019_05_26_221922_create_product_purchase_types',1),(31,'2019_08_08_091529_add_featured_field_to_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `route_name` text COLLATE utf8mb4_unicode_ci,
  `route_params` mediumtext COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `notifications` VALUES ('0049b8f0-6419-11ec-8cc8-0b792e117979','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"fe924430-6418-11ec-a822-6fa63f82fa9c\";}','2021-12-23 16:51:48','2021-12-24 07:38:19'),('0540ac20-6493-11ec-8a0a-6f5d0c1bac22','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"f8c74a00-6492-11ec-9a61-1189d50be8fc\";}','2021-12-24 07:25:15','2021-12-24 07:25:15'),('08eeae40-6419-11ec-982c-e3561c6c28c0','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"fe924430-6418-11ec-a822-6fa63f82fa9c\";}','2021-12-23 16:52:02','2021-12-23 16:52:02'),('0a7eae50-6493-11ec-89ee-e5ef4eca72e8','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"f8c74a00-6492-11ec-9a61-1189d50be8fc\";}','2021-12-24 07:25:24','2021-12-24 07:38:19'),('0ad18d80-5fdc-11ec-93ab-17d77ae0af3b','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"c5f17940-5fdb-11ec-84d3-2f5f49095ffa\";}','2021-12-18 07:25:22','2021-12-18 07:28:19'),('0b7455c0-649c-11ec-a5db-353d8a5cc27a','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"08d8aaf0-649c-11ec-9727-29e7ffe637a6\";}','2021-12-24 08:29:51','2021-12-24 08:29:51'),('0ebc9500-6111-11ec-ae5a-1b95c3b61c8d','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"06dc6ce0-6111-11ec-a378-4b38309c7648\";}','2021-12-19 20:17:23','2021-12-24 07:38:20'),('0f8ed430-6419-11ec-817a-4b67fc4e715f','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"fe924430-6418-11ec-a822-6fa63f82fa9c\";}','2021-12-23 16:52:13','2021-12-24 07:38:19'),('0f91aa90-640a-11ec-b540-ef3812810442','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"42c5eb10-6403-11ec-8b44-adcd09c0c9bf\";}','2021-12-23 15:04:51','2021-12-23 15:04:51'),('139f22f0-5fd1-11ec-8bed-6b4bc8707ba0','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"0bb73500-5fd1-11ec-ae11-67ebe256bb45\";}','2021-12-18 06:06:52','2021-12-18 06:54:12'),('161ed330-5ff8-11ec-b5f7-2b449d2314a0','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"11d568b0-5ff8-11ec-9f98-39141bcd2e06\";}','2021-12-18 10:46:06','2021-12-18 10:47:31'),('178555e0-649c-11ec-8904-bb8186752f5e','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"08d8aaf0-649c-11ec-9727-29e7ffe637a6\";}','2021-12-24 08:30:11','2021-12-24 08:30:11'),('1da39c70-5fd7-11ec-9698-df9d0490c87a','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"a923dfb0-5fd5-11ec-b902-9511bbbb49ec\";}','2021-12-18 06:50:06','2021-12-18 06:54:12'),('1ec0f4b0-6417-11ec-936b-776e85b84715','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"d184f1c0-6416-11ec-9c13-45b9a45ea8a4\";}','2021-12-23 16:38:20','2021-12-23 16:38:20'),('207d09a0-649c-11ec-bf61-290126dd45d4','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',0,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"08d8aaf0-649c-11ec-9727-29e7ffe637a6\";}','2021-12-24 08:30:26','2021-12-24 08:30:26'),('24a37a10-5ff7-11ec-892b-d995c01129e9','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"b98a71b0-5ff6-11ec-9c67-db22c9717c2e\";}','2021-12-18 10:39:21','2021-12-19 00:10:09'),('261dff30-5fe5-11ec-a171-315b0e1fda36','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"cc294340-5fe4-11ec-b369-b1b490704c2b\";}','2021-12-18 08:30:33','2021-12-19 00:10:09'),('26332870-5fd3-11ec-a88f-4bee62291b1a','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"1b81c3a0-5fd3-11ec-b783-f5db9eac75a3\";}','2021-12-18 06:21:42','2021-12-18 06:54:12'),('275872e0-6069-11ec-bdcb-1b5ceaad973f','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"233ca500-6069-11ec-834f-d77390320e1a\";}','2021-12-19 00:15:28','2021-12-24 07:38:20'),('28bb1d00-640a-11ec-abb8-5f4c13f7d80c','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"42c5eb10-6403-11ec-8b44-adcd09c0c9bf\";}','2021-12-23 15:05:33','2021-12-24 07:38:20'),('297bcbf0-5ff7-11ec-8409-6b5dd0909f49','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"b98a71b0-5ff6-11ec-9c67-db22c9717c2e\";}','2021-12-18 10:39:29','2021-12-18 10:47:31'),('2e9180c0-6419-11ec-a2d7-af85677aebca','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"2a8896c0-6419-11ec-90e8-5f1a4ece8fd7\";}','2021-12-23 16:53:05','2021-12-24 07:38:19'),('370cb000-5fe6-11ec-a7ae-f9d0d7044577','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"346f9280-5fe6-11ec-9987-efe4a81c506e\";}','2021-12-18 08:38:11','2021-12-18 10:47:31'),('3a8135e0-5fd9-11ec-8407-67d1f8645e7f','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"385db620-5fd9-11ec-b706-2d98546df572\";}','2021-12-18 07:05:13','2021-12-18 07:25:16'),('3bfb26c0-5fd4-11ec-abe1-09e63e3982a5','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"39ef07d0-5fd4-11ec-9153-eb6097b9ba76\";}','2021-12-18 06:29:28','2021-12-18 06:54:12'),('42c0f740-5fde-11ec-be7d-99d9f62fd134','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"40c8dbf0-5fde-11ec-9dee-51b5f7b0f065\";}','2021-12-18 07:41:14','2021-12-18 08:26:05'),('4357b480-649c-11ec-a4a4-e185d188bc3a','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"3e8f7650-649c-11ec-b7c3-13c25766d7ba\";}','2021-12-24 08:31:24','2021-12-24 08:31:24'),('46eaa420-6416-11ec-9cdd-fbdb47e39e68','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"e4cd7740-6415-11ec-825c-dbc3c5419207\";}','2021-12-23 16:32:18','2021-12-23 16:32:18'),('47b589c0-63d4-11ec-8236-b97089803cb2','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"43084f90-63d4-11ec-9c34-11baea5a8acd\";}','2021-12-23 08:39:52','2021-12-24 07:38:20'),('4a9b02f0-5f35-11ec-89d8-e72e3caf292f','6bd39550-5ef6-11ec-9699-bb782419c069','You have received new message from [vender1]',1,'profile.messages','a:1:{s:12:\"conversation\";s:36:\"f12668c0-5f34-11ec-b1b5-1b1372a84ed9\";}','2021-12-17 11:31:43','2021-12-17 11:44:03'),('52011050-6403-11ec-bbc3-b50d34d14fe5','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"42c5eb10-6403-11ec-8b44-adcd09c0c9bf\";}','2021-12-23 14:16:36','2021-12-24 07:38:20'),('542bd080-649c-11ec-93a2-158222a03125','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"3e8f7650-649c-11ec-b7c3-13c25766d7ba\";}','2021-12-24 08:31:53','2021-12-24 08:31:53'),('5520a900-5ff8-11ec-b17d-d51b8989f010','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"11d568b0-5ff8-11ec-9f98-39141bcd2e06\";}','2021-12-18 10:47:52','2021-12-19 00:10:09'),('5922df10-5fdd-11ec-b300-8d4b09629f89','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"4104ab80-5fdd-11ec-8d4a-e7ce7c5b9e54\";}','2021-12-18 07:34:42','2021-12-18 08:26:05'),('593a6be0-5fe6-11ec-9543-f794bd5f6822','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"346f9280-5fe6-11ec-9987-efe4a81c506e\";}','2021-12-18 08:39:08','2021-12-19 00:10:09'),('5a854660-5fde-11ec-ae4b-d50fbf3bd40a','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"40c8dbf0-5fde-11ec-9dee-51b5f7b0f065\";}','2021-12-18 07:41:54','2021-12-19 00:10:09'),('5aba3790-6490-11ec-903e-b9ad6dff835d','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"1f5632c0-6490-11ec-a648-b7d8c64a24da\";}','2021-12-24 07:06:10','2021-12-24 07:38:19'),('5ccf71c0-649c-11ec-b64d-cb2a25e7613c','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',0,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"3e8f7650-649c-11ec-b7c3-13c25766d7ba\";}','2021-12-24 08:32:07','2021-12-24 08:32:07'),('5e8b4890-5fd3-11ec-adc1-75ced0277c48','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"1b81c3a0-5fd3-11ec-b783-f5db9eac75a3\";}','2021-12-18 06:23:17','2021-12-18 06:41:59'),('5f24e9f0-5fdb-11ec-9c6f-ad1b4a8dc84c','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"5cf2dfc0-5fdb-11ec-babd-d16e39a2e987\";}','2021-12-18 07:20:34','2021-12-18 07:25:16'),('5fdff460-6494-11ec-a1bb-f1586314f347','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"5a606510-6494-11ec-8e30-6776feccfdf9\";}','2021-12-24 07:34:56','2021-12-24 07:38:19'),('607afff0-5fd4-11ec-a66a-39c78b90b9b5','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"39ef07d0-5fd4-11ec-9153-eb6097b9ba76\";}','2021-12-18 06:30:29','2021-12-18 06:41:59'),('64e064b0-5fd9-11ec-9579-7795188f8e25','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"385db620-5fd9-11ec-b706-2d98546df572\";}','2021-12-18 07:06:24','2021-12-18 07:19:26'),('664d1f20-6112-11ec-bd6e-f91d6ff5cfa3','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"61353fa0-6112-11ec-a84a-8dc95cc43e39\";}','2021-12-19 20:26:59','2021-12-24 07:38:20'),('6e726d60-6419-11ec-be94-ab8755e203fd','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"2a8896c0-6419-11ec-90e8-5f1a4ece8fd7\";}','2021-12-23 16:54:53','2021-12-23 16:54:53'),('7527fd90-6497-11ec-a7f1-2b8c834b584a','6bd39550-5ef6-11ec-9699-bb782419c069','Dispute for your purchase is now resolved',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"39ef07d0-5fd4-11ec-9153-eb6097b9ba76\";}','2021-12-24 07:57:01','2021-12-24 07:57:01'),('752895e0-6497-11ec-9438-41cae2b7b671','be3a1c10-5cff-11ec-8820-3349f825a589','Dispute for your sale is now resolved',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"39ef07d0-5fd4-11ec-9153-eb6097b9ba76\";}','2021-12-24 07:57:01','2021-12-24 07:57:01'),('7951ea80-6419-11ec-a939-e7125af5a14e','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"2a8896c0-6419-11ec-90e8-5f1a4ece8fd7\";}','2021-12-23 16:55:11','2021-12-24 07:38:19'),('7aa21a60-6417-11ec-9215-eb532cee722c','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"77293f20-6417-11ec-8ed1-a17d42430998\";}','2021-12-23 16:40:54','2021-12-24 07:38:19'),('7d0f54c0-651b-11ec-b950-3ff9150174dd','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"6da209c0-651b-11ec-8889-b59bbed6bfef\";}','2021-12-24 23:42:07','2021-12-24 23:42:07'),('7fd5bc60-5fdd-11ec-aa54-015cda4f3a51','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"4104ab80-5fdd-11ec-8d4a-e7ce7c5b9e54\";}','2021-12-18 07:35:47','2021-12-19 00:10:09'),('7ff987c0-5fd5-11ec-954b-d13ec429723a','6bd39550-5ef6-11ec-9699-bb782419c069','Purchase for a product you bought is being disputed',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"39ef07d0-5fd4-11ec-9153-eb6097b9ba76\";}','2021-12-18 06:38:32','2021-12-18 06:41:59'),('800918d0-5fdb-11ec-86a7-d507f1683179','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"5cf2dfc0-5fdb-11ec-babd-d16e39a2e987\";}','2021-12-18 07:21:29','2021-12-18 07:28:19'),('82fdfb80-6417-11ec-9970-770709292602','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"77293f20-6417-11ec-8ed1-a17d42430998\";}','2021-12-23 16:41:08','2021-12-23 16:41:08'),('85332f30-5fd7-11ec-a26e-514f33381488','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"81dae300-5fd7-11ec-aca3-59eab71b61f4\";}','2021-12-18 06:52:59','2021-12-18 06:54:12'),('854d2e70-5fdb-11ec-aa50-fde2730104b7','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"5cf2dfc0-5fdb-11ec-babd-d16e39a2e987\";}','2021-12-18 07:21:38','2021-12-18 07:25:16'),('86a03dc0-6416-11ec-ac67-5719cae451d4','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"83d46690-6416-11ec-b431-a93300e2d1f8\";}','2021-12-23 16:34:05','2021-12-24 07:38:20'),('8749e390-5ff8-11ec-b8dd-414d7f15d432','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"11d568b0-5ff8-11ec-9f98-39141bcd2e06\";}','2021-12-18 10:49:16','2021-12-24 07:38:20'),('8927f140-6418-11ec-9261-b7e4064a72ed','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"85e550d0-6418-11ec-ab3d-75c4214f1d3e\";}','2021-12-23 16:48:28','2021-12-24 07:38:19'),('8c4bad30-651d-11ec-b7a8-4f1bd092a734','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"e1295030-651c-11ec-82d4-25661fbd4bba\";}','2021-12-24 23:56:52','2021-12-24 23:56:52'),('8db8be50-6495-11ec-821b-675d52a831e8','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"5a606510-6494-11ec-8e30-6776feccfdf9\";}','2021-12-24 07:43:23','2021-12-24 07:43:23'),('8f6a0fd0-5fc3-11ec-9c6f-45bd541a12cc','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"a4310f80-5fc2-11ec-8d65-f57f56fac0a2\";}','2021-12-18 04:30:07','2021-12-18 04:34:42'),('916179d0-5fd5-11ec-b314-dda7238fa4e8','be3a1c10-5cff-11ec-8820-3349f825a589','There is new message on your disputed sale',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"39ef07d0-5fd4-11ec-9153-eb6097b9ba76\";}','2021-12-18 06:39:01','2021-12-18 06:54:12'),('91a61680-6419-11ec-b73e-cda477dae7dd','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"8c61f6c0-6419-11ec-b6e2-1d02199b1e71\";}','2021-12-23 16:55:52','2021-12-24 07:38:19'),('92ea48c0-6418-11ec-bc11-3f2ed5b6f816','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"85e550d0-6418-11ec-ab3d-75c4214f1d3e\";}','2021-12-23 16:48:44','2021-12-23 16:48:44'),('93e9eb10-5fe7-11ec-bdc8-f756e5e85326','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"908239f0-5fe7-11ec-a898-9f0cad4fccdb\";}','2021-12-18 08:47:56','2021-12-18 10:47:31'),('977bb200-6416-11ec-b739-b36d45906a6e','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"83d46690-6416-11ec-b431-a93300e2d1f8\";}','2021-12-23 16:34:33','2021-12-23 16:34:33'),('9784fe90-5fe1-11ec-88ee-39e2604d7039','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"95114dc0-5fe1-11ec-9c10-e9d659f24422\";}','2021-12-18 08:05:05','2021-12-18 08:26:05'),('9a537010-641b-11ec-a990-55ccc8db2e25','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"ba7037d0-641a-11ec-8bf4-0b2e858be268\";}','2021-12-23 17:10:25','2021-12-24 07:38:19'),('a15f3000-6491-11ec-9e8f-538b5c950ed9','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"8c7cf8f0-6491-11ec-8c30-618d3722c413\";}','2021-12-24 07:15:18','2021-12-24 07:38:19'),('ab34faf0-5fc2-11ec-ba90-5f3f9564fe54','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"a4310f80-5fc2-11ec-8d65-f57f56fac0a2\";}','2021-12-18 04:23:44','2021-12-18 04:29:52'),('abc5ece0-5fd5-11ec-8141-a77701781399','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"a923dfb0-5fd5-11ec-b902-9511bbbb49ec\";}','2021-12-18 06:39:45','2021-12-18 06:54:12'),('ad4e3460-619b-11ec-be61-f795fd270af3','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"233ca500-6069-11ec-834f-d77390320e1a\";}','2021-12-20 12:49:39','2021-12-20 12:49:51'),('b4e7a9f0-641b-11ec-a9ff-2d517c1373cb','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"ba7037d0-641a-11ec-8bf4-0b2e858be268\";}','2021-12-23 17:11:10','2021-12-23 17:11:10'),('b4eb17b0-5fe7-11ec-8227-eb48ec73be4c','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"908239f0-5fe7-11ec-a898-9f0cad4fccdb\";}','2021-12-18 08:48:51','2021-12-19 00:10:09'),('b8817a00-5fe1-11ec-a239-0f30d8f6de4f','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"95114dc0-5fe1-11ec-9c10-e9d659f24422\";}','2021-12-18 08:06:00','2021-12-19 00:10:09'),('b9ec9470-6523-11ec-b13a-0d2cf2918187','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"acbaeae0-6523-11ec-8763-e3bcf29adcb9\";}','2021-12-25 00:41:05','2021-12-25 00:41:05'),('bbc1d6b0-5ff6-11ec-9ec4-95c514c04324','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"b98a71b0-5ff6-11ec-9c67-db22c9717c2e\";}','2021-12-18 10:36:25','2021-12-18 10:47:31'),('be9389c0-5fd7-11ec-8d12-99b0c21d6125','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"81dae300-5fd7-11ec-aca3-59eab71b61f4\";}','2021-12-18 06:54:36','2021-12-18 07:04:58'),('bfdc8950-63d2-11ec-bb2e-619f2ec9daaf','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"a62a33b0-63d2-11ec-b094-4333cde6d1fa\";}','2021-12-23 08:28:55','2021-12-24 07:38:20'),('c14bf370-641b-11ec-95f4-77d6484d9b5f','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"ba7037d0-641a-11ec-8bf4-0b2e858be268\";}','2021-12-23 17:11:31','2021-12-24 07:38:19'),('c59eb6b0-5fd1-11ec-811a-b166829a7c31','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"0bb73500-5fd1-11ec-ae11-67ebe256bb45\";}','2021-12-18 06:11:50','2021-12-18 06:41:59'),('c6a225f0-649b-11ec-b2c8-e70d516a92ea','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"c34a6810-649b-11ec-9e39-e949b9d3be59\";}','2021-12-24 08:27:55','2021-12-24 08:27:55'),('c9263ee0-5fdb-11ec-bae0-87669a634daf','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"c5f17940-5fdb-11ec-84d3-2f5f49095ffa\";}','2021-12-18 07:23:31','2021-12-18 07:25:16'),('ca1feb10-6417-11ec-a893-e944b30039d5','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"c7b0f540-6417-11ec-ad30-2ffae1ee1ced\";}','2021-12-23 16:43:07','2021-12-24 07:38:19'),('cbf14bb0-6491-11ec-8bfc-89e78eb4e053','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"8c7cf8f0-6491-11ec-8c30-618d3722c413\";}','2021-12-24 07:16:29','2021-12-24 07:16:29'),('cf3ae550-5fe4-11ec-ad5a-e36769256122','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"cc294340-5fe4-11ec-b369-b1b490704c2b\";}','2021-12-18 08:28:07','2021-12-18 10:47:31'),('cf3e43e0-6495-11ec-ae52-bdaab6fcea8a','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',0,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"5a606510-6494-11ec-8e30-6776feccfdf9\";}','2021-12-24 07:45:13','2021-12-24 07:45:13'),('cfb09060-5fbf-11ec-b3e5-6d1f1bfe650e','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"f5ad0a10-5fbe-11ec-b587-052b603c49f6\";}','2021-12-18 04:03:16','2021-12-18 04:04:19'),('d2387280-61f1-11ec-8794-c70cc4111e7e','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"cd93cf20-61f1-11ec-9d9d-6d58ce6e3bfe\";}','2021-12-20 23:06:18','2021-12-24 07:38:20'),('d28d3b50-6417-11ec-9d44-eb5e06aa0ef7','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"c7b0f540-6417-11ec-ad30-2ffae1ee1ced\";}','2021-12-23 16:43:22','2021-12-23 16:43:22'),('d8a8c6f0-649b-11ec-94f0-63e048b447a2','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"c34a6810-649b-11ec-9e39-e949b9d3be59\";}','2021-12-24 08:28:25','2021-12-24 08:28:25'),('db0369c0-641b-11ec-8a75-1bdabcae658f','6bd39550-5ef6-11ec-9699-bb782419c069','Purchase for a product you bought is being disputed',0,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"ba7037d0-641a-11ec-8bf4-0b2e858be268\";}','2021-12-23 17:12:14','2021-12-23 17:12:14'),('db6ebe10-6416-11ec-9661-996a1bae2d88','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"d184f1c0-6416-11ec-9c13-45b9a45ea8a4\";}','2021-12-23 16:36:27','2021-12-24 07:38:19'),('e2525790-6495-11ec-8a04-b5f451070677','be3a1c10-5cff-11ec-8820-3349f825a589','Purchase for a product you sold is being disputed',0,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"5a606510-6494-11ec-8e30-6776feccfdf9\";}','2021-12-24 07:45:45','2021-12-24 07:45:45'),('e7698af0-649b-11ec-93d7-d912b33f9e04','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',0,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"c34a6810-649b-11ec-9e39-e949b9d3be59\";}','2021-12-24 08:28:50','2021-12-24 08:28:50'),('f1746f70-5f34-11ec-abe8-a76fa1a96013','be3a1c10-5cff-11ec-8820-3349f825a589','You have received new message from [user1]',1,'profile.messages','a:1:{s:12:\"conversation\";s:36:\"f12668c0-5f34-11ec-b1b5-1b1372a84ed9\";}','2021-12-17 11:29:13','2021-12-17 11:30:54'),('f2da3ce0-5fd5-11ec-9f73-5516157c404b','6bd39550-5ef6-11ec-9699-bb782419c069','Your product has been sent by vendor [vender1]',1,'profile.purchases.single','a:1:{s:8:\"purchase\";s:36:\"a923dfb0-5fd5-11ec-b902-9511bbbb49ec\";}','2021-12-18 06:41:44','2021-12-18 06:41:59'),('f3e2afe0-5ff5-11ec-84a6-759cfd3a00f1','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"908239f0-5fe7-11ec-a898-9f0cad4fccdb\";}','2021-12-18 10:30:50','2021-12-18 10:47:31'),('f6112680-6417-11ec-b7d4-837fb84757a9','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been marked delivered by buyer [user1]',1,'profile.sales.single','a:1:{s:5:\"sales\";s:36:\"c7b0f540-6417-11ec-ad30-2ffae1ee1ced\";}','2021-12-23 16:44:21','2021-12-24 07:38:19'),('f97188c0-6415-11ec-8841-c3d28aeab0a0','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"e4cd7740-6415-11ec-825c-dbc3c5419207\";}','2021-12-23 16:30:08','2021-12-24 07:38:20'),('fad2d870-6492-11ec-b44c-c704f026bac7','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"f8c74a00-6492-11ec-9a61-1189d50be8fc\";}','2021-12-24 07:24:57','2021-12-24 07:38:19'),('fca68400-6110-11ec-a896-dfab4c603644','be3a1c10-5cff-11ec-8820-3349f825a589','Your product has been purchased by [user1]',1,'profile.sales.single','a:1:{s:4:\"sale\";s:36:\"94d7f8e0-6110-11ec-a8b7-2b4772bf163b\";}','2021-12-19 20:16:52','2021-12-24 07:38:20');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `offers` VALUES ('04e71170-6403-11ec-8041-89b36df94a46','7b00c340-6402-11ec-833a-a5b3893fbf87',1,100.00,'2021-12-23 14:14:42','2021-12-23 14:14:42',0),('830b0fe0-6110-11ec-bffd-9decc3c971c3','7d876700-6110-11ec-b7cb-9b3c44439e2b',1,10.00,'2021-12-19 20:13:45','2021-12-19 20:13:45',0),('a1096540-649b-11ec-88d6-07645dfd6c7f','9c920670-649b-11ec-afe1-5b07297a2756',1,100.00,'2021-12-24 08:27:17','2021-12-24 08:27:17',0),('b3d4cec0-5fe4-11ec-87e5-773ebd82c754','a8eee610-5fe4-11ec-9df1-dd1b1f0b2fa3',1,100.00,'2021-12-18 08:27:37','2021-12-18 08:27:37',0),('d57c7970-5f2e-11ec-baf1-65af7ff777eb','d03026c0-5f2e-11ec-a4b3-111e006fd984',1,1.00,'2021-12-17 10:49:03','2021-12-17 10:49:03',0),('f0ea2b80-5ff7-11ec-a4ed-6783c4435db8','ecf3d440-5ff7-11ec-8415-833d7d6df95e',1,10.00,'2021-12-18 10:45:22','2021-12-18 10:45:22',0),('fc5aba90-5fd2-11ec-8e60-05318c46b978','f73ec260-5fd2-11ec-9b3f-c17d266f9f1a',1,1.00,'2021-12-18 06:21:05','2021-12-18 06:21:05',0);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `permissions` VALUES ('39277940-641d-11ec-8aba-71c009eec705','6cf3e5a0-5f17-11ec-82a4-5d39e1dc65be','categories','2021-12-23 17:22:01','2021-12-23 17:22:01'),('3927dd70-641d-11ec-8d17-2b4d5cf4043a','6cf3e5a0-5f17-11ec-82a4-5d39e1dc65be','messages','2021-12-23 17:22:01','2021-12-23 17:22:01'),('39286880-641d-11ec-952b-3d9f521bd798','6cf3e5a0-5f17-11ec-82a4-5d39e1dc65be','disputes','2021-12-23 17:22:01','2021-12-23 17:22:01'),('3928af90-641d-11ec-aee2-475869b1577f','6cf3e5a0-5f17-11ec-82a4-5d39e1dc65be','tickets','2021-12-23 17:22:01','2021-12-23 17:22:01');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgpkeys`
--

DROP TABLE IF EXISTS `pgpkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgpkeys` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_option` enum('all','include','exclude') COLLATE utf8mb4_unicode_ci DEFAULT 'all',
  `countries` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40000 ALTER TABLE `physical_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `mesure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `coins` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `types` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
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
INSERT INTO `products` VALUES ('7b00c340-6402-11ec-833a-a5b3893fbf87','aaaaaa','fdsafdsafdsa','fdsafdsafdsa',8,'1',1,'btc,xmr,usd','51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-23 14:14:42','2021-12-24 07:34:56','normal',0),('7d876700-6110-11ec-b7cb-9b3c44439e2b','WEB1','fdsafdsaf','fdsa',6,'1',1,'btc,xmr','54d3b1a0-5f2e-11ec-8944-734a1bbb1192','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-19 20:13:44','2021-12-23 08:28:54','normal',1),('9c920670-649b-11ec-afe1-5b07297a2756','Test Product1','fdsafdasfdsa','fdsafdsa',94,'1',1,'btc,xmr,usd','51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-24 08:27:17','2021-12-25 00:41:05','normal',0),('a8eee610-5fe4-11ec-9df1-dd1b1f0b2fa3','Website Template','Website Template','Website Template',96,'1',1,'btc','54d3b1a0-5f2e-11ec-8944-734a1bbb1192','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-18 08:27:37','2021-12-23 16:43:07','normal',1),('d03026c0-5f2e-11ec-a4b3-111e006fd984','Android Tutorial App','Android Tutorial App','Android Tutorial App',95,'1',1,'btc','51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-17 10:48:57','2021-12-23 16:34:05','normal',1),('ecf3d440-5ff7-11ec-8415-833d7d6df95e','Mobile Template','Mobile Template','Mobile Template',97,'1',1,'btc','51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-18 10:45:22','2021-12-23 08:39:52','normal',1),('f73ec260-5fd2-11ec-9b3f-c17d266f9f1a','iOS Test App','fdsafds','fdsafdsa',88,'1',1,'btc','51a97aa0-5f2e-11ec-8062-9522d6c5ab2f','be3a1c10-5cff-11ec-8820-3349f825a589','2021-12-18 06:21:04','2021-12-23 16:36:27','normal',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_pay` decimal(24,12) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('purchased','sent','delivered','disputed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'purchased',
  `type` enum('fe','normal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `coin_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'btc',
  `marketplace_address` text COLLATE utf8mb4_unicode_ci,
  `multisig_address` text COLLATE utf8mb4_unicode_ci,
  `redeem_script` text COLLATE utf8mb4_unicode_ci,
  `private_key` text COLLATE utf8mb4_unicode_ci,
  `hex` text COLLATE utf8mb4_unicode_ci,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `delivered_product` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `purchases` VALUES ('06dc6ce0-6111-11ec-a378-4b38309c7648','830b0fe0-6110-11ec-bffd-9decc3c971c3',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q4zyym0ydkya5c6jy34qg43kfxs49q7jrxy30mz',0.000213540000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-19 20:17:23','2021-12-20 12:49:13'),('08d8aaf0-649c-11ec-9727-29e7ffe637a6','a1096540-649b-11ec-88d6-07645dfd6c7f',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'ACH5niqTC7gEttP9QaYsuqSkw8K7d8tzNPLUk2MN8Qm6RorrkUzuY19V5KUs9qLcW79Do2YvwV6urJ5E5G6k4MGzMUqdKjGkoXrALZ5XDK',0.481023618260,'','delivered','normal','xmr',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-24 08:29:51','2021-12-24 08:30:26'),('0bb73500-5fd1-11ec-ae11-67ebe256bb45','d57c7970-5f2e-11ec-baf1-65af7ff777eb',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,'00f0b710-5fd2-11ec-b9e0-57d56ffe18b7',1,'tb1qnjwm9pgrmthl9450s7fmfnpwmj79d7sa9uphzg',0.000021540000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 06:06:52','2021-12-18 06:13:30'),('11d568b0-5ff8-11ec-9f98-39141bcd2e06','f0ea2b80-5ff7-11ec-a4ed-6783c4435db8',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1quxzumt7dmhgrf3mvg8sef73tjewdsc73efvf3q',0.000211710000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 10:46:06','2021-12-19 20:12:48'),('1b81c3a0-5fd3-11ec-b783-f5db9eac75a3','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qdwda88kft8vuf2wwtrqsgf2teuwt4swhasxhhh',0.000021540000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 06:21:42','2021-12-18 06:24:36'),('1f5632c0-6490-11ec-a648-b7d8c64a24da','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'ACH5niqTC7gEttP9QaYsuqSkw8K7d8tzNPLUk2MN8Qm6RorrkUzuY19V5KUs9qLcW79Do2YvwV6urJ5E5G6k4MGzMW8Yu5PV8m9Jwfb2FG',0.482253086420,'','purchased','normal','xmr',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-24 07:06:10','2021-12-24 07:16:13'),('233ca500-6069-11ec-834f-d77390320e1a','f0ea2b80-5ff7-11ec-a4ed-6783c4435db8',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q7krf23y9l0ac3uuz9kmhpg5ppvu09pvf2v7k2g',0.000213640000,'','sent','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-19 00:15:28','2021-12-20 12:49:39'),('2a8896c0-6419-11ec-90e8-5f1a4ece8fd7','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qrp8t539nt74pgxvrys7d0d6x3evre5ewcw72lh',0.002000790000,'','delivered','normal','usd',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:53:05','2021-12-23 16:55:11'),('346f9280-5fe6-11ec-9987-efe4a81c506e','b3d4cec0-5fe4-11ec-87e5-773ebd82c754',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qlt05vuxmuyhzuh2mrf6ffha2uumdl3caas3jnk',0.002149300000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 08:38:11','2021-12-18 08:41:20'),('385db620-5fd9-11ec-b706-2d98546df572','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qdssj7u9lyv0j5alytqaht08xh588amf6cdzlrw',0.000021550000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 07:05:13','2021-12-18 07:06:36'),('39ef07d0-5fd4-11ec-9153-eb6097b9ba76','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589','7ff52620-5fd5-11ec-8e18-61e1dc440cf1',NULL,1,'tb1qrjs0xdayg5kj69du0mxtdfwjm9y7tn66uggyzv',0.000021510000,'','disputed','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 06:29:28','2021-12-18 06:38:32'),('3e8f7650-649c-11ec-b7c3-13c25766d7ba','a1096540-649b-11ec-88d6-07645dfd6c7f',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'',100.000000000000,'','delivered','normal','usd',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-24 08:31:24','2021-12-24 08:32:07'),('40c8dbf0-5fde-11ec-9dee-51b5f7b0f065','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qkd2khamclvsj62rms3pt3znd8x534d707qtlmk',0.000021530000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 07:41:14','2021-12-18 07:42:02'),('4104ab80-5fdd-11ec-8d4a-e7ce7c5b9e54','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qn234dvt99auq53jxqyn9wm38ktcdzgapkla7zx',0.000021440000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 07:34:42','2021-12-18 07:36:00'),('42c5eb10-6403-11ec-8b44-adcd09c0c9bf','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q0ygzvl0ns4suyk2x5de2trdk3xm4q024eu6hsa',0.002053770000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 14:16:36','2021-12-23 15:05:33'),('43084f90-63d4-11ec-9c34-11baea5a8acd','f0ea2b80-5ff7-11ec-a4ed-6783c4435db8',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qqw52eptgmkqfmuj6enue3spe9yrsat7dtf3fuj',0.000206830000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 08:39:52','2021-12-23 08:46:35'),('5a606510-6494-11ec-8e30-6776feccfdf9','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589','e250a5c0-6495-11ec-a1d2-41369857b3bf',NULL,1,'ACH5niqTC7gEttP9QaYsuqSkw8K7d8tzNPLUk2MN8Qm6RorrkUzuY19V5KUs9qLcW79Do2YvwV6urJ5E5G6k4MGzMSNmUPPgdkBMu4tsWt',0.480931082576,'','disputed','normal','xmr',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-24 07:34:56','2021-12-24 07:45:45'),('5cf2dfc0-5fdb-11ec-babd-d16e39a2e987','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qlaw22x7hwv2q82qtepufmf5nsrsqhx6227htvn',0.000021440000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 07:20:34','2021-12-18 07:21:38'),('61353fa0-6112-11ec-a84a-8dc95cc43e39','830b0fe0-6110-11ec-bffd-9decc3c971c3',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q9wgm3xzs6prwmx6tklt27tx9jqtf9amuyex598',0.000213540000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-19 20:26:59','2021-12-20 12:49:13'),('6da209c0-651b-11ec-8889-b59bbed6bfef','a1096540-649b-11ec-88d6-07645dfd6c7f',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'ACH5niqTC7gEttP9QaYsuqSkw8K7d8tzNPLUk2MN8Qm6RorrkUzuY19V5KUs9qLcW79Do2YvwV6urJ5E5G6k4MGzMQc8M8Ss8caFNSev51',0.485932261043,'','purchased','normal','xmr',NULL,NULL,NULL,NULL,NULL,0,NULL,'2021-12-24 23:42:07','2021-12-24 23:42:07'),('77293f20-6417-11ec-8ed1-a17d42430998','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qrx8mnauufmzw0wnm5m8pdqsuavqvunt337j7er',0.002031320000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:40:54','2021-12-23 16:41:17'),('81dae300-5fd7-11ec-aca3-59eab71b61f4','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qdftfj94fdmjund00fjxexutnh2k39e8jefyxal',0.000021550000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 06:52:59','2021-12-18 07:06:17'),('83d46690-6416-11ec-b431-a93300e2d1f8','d57c7970-5f2e-11ec-baf1-65af7ff777eb',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q7r4zs7w7rplt0epet67np6gyxe3rykvxr45776',0.000020310000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:34:05','2021-12-23 16:34:53'),('85e550d0-6418-11ec-ab3d-75c4214f1d3e','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qutwddt9nxyyepltn3ajwg4etanycwmswf6y4rf',0.002031320000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:48:28','2021-12-23 16:48:54'),('8c61f6c0-6419-11ec-b6e2-1d02199b1e71','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qsl8s9kx37ls7808d99xy6w6ezkz9449ezdj5sc',0.002000790000,'','purchased','normal','usd',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:55:52','2021-12-23 17:11:02'),('8c7cf8f0-6491-11ec-8c30-618d3722c413','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'ACH5niqTC7gEttP9QaYsuqSkw8K7d8tzNPLUk2MN8Qm6RorrkUzuY19V5KUs9qLcW79Do2YvwV6urJ5E5G6k4MGzMWYQw9HHdAHNcMSsyK',0.481440469886,'','delivered','normal','xmr',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-24 07:15:08','2021-12-24 07:24:27'),('908239f0-5fe7-11ec-a898-9f0cad4fccdb','b3d4cec0-5fe4-11ec-87e5-773ebd82c754',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qasmkme2l30lunjnv8djgye49jhu5r8j2z0r7r8',0.002149300000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 08:47:56','2021-12-18 10:30:50'),('94d7f8e0-6110-11ec-a8b7-2b4772bf163b','830b0fe0-6110-11ec-bffd-9decc3c971c3',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qfsdnkfx33wzvqpwmrdxhfv2ydjyc33x2tr8s78',0.000213540000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-19 20:16:52','2021-12-20 12:49:13'),('95114dc0-5fe1-11ec-9c10-e9d659f24422','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qpkh9ysqfhg0mxdjqrymps3vdmagkhh5asvg6xd',0.000021530000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 08:05:05','2021-12-18 08:06:23'),('a4310f80-5fc2-11ec-8d65-f57f56fac0a2','d57c7970-5f2e-11ec-baf1-65af7ff777eb',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qvp5jrdwlayzjdj6clgkenu7fqvjfdvt05m63yl',0.000021470000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 04:23:44','2021-12-18 06:03:59'),('a62a33b0-63d2-11ec-b094-4333cde6d1fa','830b0fe0-6110-11ec-bffd-9decc3c971c3',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q53k4tvl8rcx3m030ay7d0juun7lvum9u4y8jyj',0.000206830000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 08:28:55','2021-12-23 08:46:35'),('a923dfb0-5fd5-11ec-b902-9511bbbb49ec','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q6jvhay33anyrr78a4zduyfwgjfuf39gvdqs3aq',0.000021510000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 06:39:45','2021-12-18 06:50:06'),('acbaeae0-6523-11ec-8763-e3bcf29adcb9','a1096540-649b-11ec-88d6-07645dfd6c7f',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qesw0rfshxt4q9ghujat8lnkzkchtshsdprgw48',0.001964310000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,0,NULL,'2021-12-25 00:41:05','2021-12-25 00:41:05'),('b98a71b0-5ff6-11ec-9c67-db22c9717c2e','d57c7970-5f2e-11ec-baf1-65af7ff777eb',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qrax99l45j6925l7rkd5v877dptg25glrzhzwev',0.000021170000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 10:36:25','2021-12-18 10:39:29'),('ba7037d0-641a-11ec-8bf4-0b2e858be268','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589','dafe7900-641b-11ec-abe9-1f422845edf8',NULL,1,'',100.000000000000,'','disputed','normal','usd',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 17:10:25','2021-12-23 17:12:14'),('c34a6810-649b-11ec-9e39-e949b9d3be59','a1096540-649b-11ec-88d6-07645dfd6c7f',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qjttp7z0yn7qycqzfrxlf9h5k60hymc9yy9cgl3',0.001948810000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-24 08:27:55','2021-12-24 08:28:50'),('c5f17940-5fdb-11ec-84d3-2f5f49095ffa','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1ql2v3q0p7xwz2y8mkqx83msxhvme79negkv2daj',0.000021440000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 07:23:31','2021-12-18 07:30:08'),('c7b0f540-6417-11ec-ad30-2ffae1ee1ced','b3d4cec0-5fe4-11ec-87e5-773ebd82c754',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qv578vtz3jafja2rwdg73gqhx7qnyrcukzs93jy',0.002031320000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:43:07','2021-12-23 16:44:21'),('cc294340-5fe4-11ec-b369-b1b490704c2b','b3d4cec0-5fe4-11ec-87e5-773ebd82c754',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q2xl6q32t2ttv9dv654dh6053fr49gnh7t68lmd',0.002149300000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 08:28:07','2021-12-18 08:30:40'),('cd93cf20-61f1-11ec-9d9d-6d58ce6e3bfe','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qg25e9ae5tw6wjj2hczv5e4wmw3qqv02ymle280',0.000021290000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-20 23:06:18','2021-12-22 06:24:29'),('d184f1c0-6416-11ec-9c13-45b9a45ea8a4','fc5aba90-5fd2-11ec-8e60-05318c46b978',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1q0nervztul43tmtrh3wqkj7w9er8qdtgpvyzp8m',0.000020310000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:36:27','2021-12-23 16:39:32'),('e1295030-651c-11ec-82d4-25661fbd4bba','a1096540-649b-11ec-88d6-07645dfd6c7f',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'ACH5niqTC7gEttP9QaYsuqSkw8K7d8tzNPLUk2MN8Qm6RorrkUzuY19V5KUs9qLcW79Do2YvwV6urJ5E5G6k4MGzMRMtjjN4KRhJiMh3Qp',0.486192143135,'','purchased','normal','xmr',NULL,NULL,NULL,NULL,NULL,0,NULL,'2021-12-24 23:56:52','2021-12-24 23:56:52'),('e4cd7740-6415-11ec-825c-dbc3c5419207','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qmkrmkzv5ps64jh07wglrpjey45k2a2wtptc8rs',0.002031320000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:30:08','2021-12-23 16:32:43'),('f5ad0a10-5fbe-11ec-b587-052b603c49f6','d57c7970-5f2e-11ec-baf1-65af7ff777eb',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'bc1qexdutvytenv3ejkyevn6vjds72jf94gfwcsly6',0.000021600000,'','purchased','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-18 04:03:16','2021-12-18 04:04:15'),('f8c74a00-6492-11ec-9a61-1189d50be8fc','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,'7d6e9c60-6493-11ec-8cca-c76da6cf3f00',1,'ACH5niqTC7gEttP9QaYsuqSkw8K7d8tzNPLUk2MN8Qm6RorrkUzuY19V5KUs9qLcW79Do2YvwV6urJ5E5G6k4MGzMQdsMgoZQMb6WniHJB',0.481486831335,'','delivered','normal','xmr',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-24 07:24:57','2021-12-24 07:28:36'),('fe924430-6418-11ec-a822-6fa63f82fa9c','04e71170-6403-11ec-8041-89b36df94a46',NULL,'6bd39550-5ef6-11ec-9699-bb782419c069','be3a1c10-5cff-11ec-8820-3349f825a589',NULL,NULL,1,'tb1qm5a86ruj3hu0zmcdclmkzzhxgr4xxsxkddtmjq',0.002000790000,'','delivered','normal','btc',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-12-23 16:51:48','2021-12-23 16:52:13');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `duration` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mnemonic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_address` text COLLATE utf8mb4_unicode_ci,
  `last_seen` timestamp NULL DEFAULT NULL,
  `login_2fa` tinyint(1) NOT NULL DEFAULT '0',
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referred_by` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bitmessage_address` text COLLATE utf8mb4_unicode_ci,
  `pgp_key` text COLLATE utf8mb4_unicode_ci,
  `msg_public_key` longtext COLLATE utf8mb4_unicode_ci,
  `msg_private_key` longtext COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `users` VALUES ('4ad047a0-5f17-11ec-9f82-7b2293e8b7c6','buyer','$2y$10$CwUHjwHIS1q2IIO580QdqemAtxwIw667tQ5445R/CiQU6n11oRVcO',NULL,'$2y$10$MXED8tgjn0lhxALM5IjWKeFauwSf73Lh0cfCGuYFdXbzWIlnFBPb.',NULL,NULL,0,'UUF7NZ',NULL,NULL,NULL,'eyJpdiI6IlpaV3ZIdU5rR2VqeGN3QWdoTG1vVWc9PSIsInZhbHVlIjoiUTZmb1dNUXBabWthaWdIN1FxRmJaMjlSQjFxQ1RVMklOeDBybG9cLzFsa1lIbnhFTnN2WVdBSmpBeExmMTZ2cHpcL3M3cHpERU1rcTVPUFN5OEZGa2JkczNoNW1ENXVoRFwvRm8xaFRuNkxFREdGYlN2S0dFblFnem9RbkZRUml6akRUd1YrbEdjcjJheVMxbTBHTU10WlFMRzZka3U2T2RLazZNemxpdXRWUjV2K1c3c2R1MGlqblo5blwvWXpxT2lmXC92XC8wXC9cL1B4N0JGUnpYR0NVTjFtOHVESVJadDlmdk9WR2h3RWVEVlVYa1A4MldvZ1NRbytXellZVVJOZjNWNlhLUXQ0ZVpoRXpzVGlQWUUzN2RkaEtlM0tHUHp4bGFzMXhXTlQyYjd3YlphbVZVUTVWcitGeG5cL2FiM0Jzamk0aFVtTDN3U0ZzOFNJTnFjVG5ic0VrVEhFWHNKTFFHSkcxUStPVkxmbUhNN1o4PSIsIm1hYyI6ImY4MTNjMzQxYWNmZDRmZjA0M2EzNzk1YjczMWE2NzUwNzM4ZjlmMzgxMzk0M2E2ZjhkZDQ2MjQxYzllZjQzMDIifQ==','eyJpdiI6IjRGSERxamJVRDNtR3dmMVNwdFpRNEE9PSIsInZhbHVlIjoiWW0ycG00MDhPT3BmRkhUT2xcL3FsTXN3bStwVWYwZGxIbmJcL3pFNjVFV05VSnRJZDRRdnN4bWF2SExFb0hlayt0TTBhS2NqQ052RklJajRCdm11MERDZVZia2pTZTJPMkdSTUlCSCtlc3N0TmlqZHBIRlZrQWtzR3cxbW9odnZJbkZDbVBjTFBZQzRTZzR4bTEzM1BPZ3Ewcmk2aThqNnZKYUxEXC9Ub0N6TDlRV0NMWHJ1K1Y1YWU1Q2FQd2w0dW0rZzNXU0dJZkpsVTlcLzRwM3BSVlByMGRDWnFKcFZpdjViY1ZUbW5SM2tiaE0yMEQ2STNOY1Vmc2FkV3Q3RXQ3WG1GSEEwVUxESzkrYlBSK21kbG9ialJZblpHU3JXaFwvZXAxUlROc3Z1Mkh2YkJzWm1LOGZYWFFRbXRKd2lXaUZcL3N5QVh2ZzVPeG9RQmhrOExqM21Ic1RBPT0iLCJtYWMiOiJlZWJiMjkxOTZjMDkzOWRhNzYxMTg3M2M1MTcxN2Y5NTRiOGNkZDRlNzA2ZTU1ZDMyNmUwMDJmZDE1ZDY0N2JlIn0=','2021-12-17 07:56:58','2021-12-17 07:56:58',NULL,NULL,0),('4b103370-5f17-11ec-ad74-7533ad11f6e7','admin','$2y$10$.YoY3uGDiUE0SPt6LyCH7OLNJL0no5vwyH8Ab0jJ/akpK4yc8sg7K',NULL,'$2y$10$Hs0zDtinyvny5iQLocPoluZtk9jMGI16IuMSMMqUUAB/168VDRBN.',NULL,'2021-12-24 13:29:39',0,'UUF7NZ',NULL,NULL,'test','eyJpdiI6IkNnTHNxYThSK01ySGdmMk4ySHNqYkE9PSIsInZhbHVlIjoiK1Bwa3VGWkVTR09ibDRVSEtUSlwvWklUODBSUzFNOUlqYzZMSlFib2k2c1VMaFBURnB2eVoxcU9nWThvMnRcL3F1UG9VOUxMQ3Rva3QyRjlrNDJcL2FWXC9GWm5CTUNDVGdLY1pYOGE4K0daaHVlWlBweXJyd1wva25SUTdvOENUTU1cL0Y0V1gxVTZKOEtNV2VxdCt6TFg1NFFROFhDTjFKMTg0b0xRelNhSCt0ekR3M2hDSStHMFR6RWJJakl1ZTdmZ0NqZWNyXC9MTGRDZlVxUlwvQ25McFh0cW9EaUdpSHQ2dm13enZaeGZQN2JnV1pDTTdFMTJ6cjRwcVh2RUdzeTkyb3k4ME9wVXB3bGVReE1cL001QWJhMjZ4enZVb1p5emVcL00rdDdQTVFjaXFySHMwaEdxYWdDc0JIK05DUXF2bkNaWmpvQXlIVEZzMzFrZVlEUGp0d09NNXZQUT09IiwibWFjIjoiNzc0Y2Y3OWE5YTRkZmVhYjk1YjViNmRjNWMwNzllYjljMDYyNGIwMjQ1ODY1MGE0YTRjZjEyMTBiMDg3ZDIwMiJ9','eyJpdiI6IlNGS2dEYXlyYlBtenFwTlJsMFBSQWc9PSIsInZhbHVlIjoiRmd5NUs4R3NrbkZ2Q2x6RjZNc1FNSlZ6Z0tpcjc3bm5nV0lQZnZBOVwvbnM4amIxRThhZERMYlVZckY2ZFVrelwvb2crak9YSWw4dlRvWktQK3pSQ3Jmcm1GYlg2U0VHQUozRlNCSkxhd2dqdmtzdUhsSFZ6NWxDVGN2UVA4WEtiOFJndTdEaDRHUnF3YmZ5OHVPXC9iekZ6cDlJeFdlMkpvTXFpTVJ2TE9PY3NpQk1NcUE1Ykc4Z3VLckJGTTVjSjhtYlRkMkp1Y0tcLzE1aGdyQmRTUVRcL1wvTHhIVkczV0NWaWhOeVJvQzJ0RTBZa0g1NXlad1FrcFFKMWxBYk44ZStrQThOQ3A1dklMekZKM20zc1pxXC9BaWtDeXhVd1JtdGFxTGJKaTR0SDhBdzhMbGpRdE5BcjU3RXBTOStPeVJ6cDZ4VzN1SEJjKzJ4Y1lKb3FiUERBK1p3UT09IiwibWFjIjoiMTU2OTdhN2FiZDdjNDBhMTRkODlhZmExMjc0YzY3NTMxZDRhZjUyNDg5ZDZjM2M2NGNhNmM4NDk0MTI4YTI5YSJ9','2021-12-17 07:56:58','2021-12-24 13:29:39',0,NULL,0),('6bd39550-5ef6-11ec-9699-bb782419c069','user1','$2y$10$yjW0YGH.zRAWJD4DgrqwuubiTbEx3OLVa.REeAhlH6C0SFLqXpF2O',NULL,'$2y$10$EHdsJUCcgJf09jJj7XO1EeiFid3Jzyl1Y/MeZs3Q6/57E6zbqvI5u',NULL,'2021-12-26 09:27:12',0,'NJDGKP',NULL,NULL,NULL,'eyJpdiI6InJqcEZsdEJDcmpGYnBqekx4Z1ZZMGc9PSIsInZhbHVlIjoiamdCb1Y3S3lCcnVJbE80S1wvZHFGUXFQOUxVTGhcL1VTVWt5Yk94a2d2eXUzTk0yb0swaTlBWUlidnZ0T3FmTVBON2NjMEFcL0FneUxzTGZcL3FQUnVcL3A4SlNJQWZwNEF2VElKZTNCUzUwdEtJTU9YOWk0Rmh0cjIxWllONW1jT3RIVlVWVVwvdGRRWXh3bmNTcmg3cFdPa2ttN0xHbGpuTHk4ckhZUXVVdERnK2FRUUZmQ0tQaU5PeHRsbDQ0dFZKR21PVjl6djU5Z29rUkg5T1o3aGxcL0dJT3RNVXYyMmNrcnliT3ByMjI2Sk1vVlFjT0RDa3djQnpcLzBwQnFBNlQ1SWV2d2RhKzVRcHdqemNRUlp1SEVnTjJ5cFhMMHdxWEMyT2k5M0hRZ3VFendoek5HcEUrQXJjQ0NrajV0bkNmZnhLMWFaSU9ubTNqRklDbzVaRG1aMkM4aXc9PSIsIm1hYyI6IjE1YzBlNDAxYmJjNTZkY2ZmODg5MTllOGU0MzY3OGMwZDBlOWYzYjlmZGJiOTM2Y2FiYjEzM2I3NTYxNjkyZDEifQ==','eyJpdiI6IndDYmhNeTdNelM5NFdKeDlhVnpMdkE9PSIsInZhbHVlIjoiNUphcGt2N0dRVWdtN2poWDMyb3BCVGpcL3B0a0FjV09Dbzh0b081ZkJRRGg4clVxdFhRNVVDdXY2eVdIYWVkcmJ0K1h2Z3FWcmVvK1ZpdFNaUit4YXZJWU5GSmplSVYzNmhoNE5oSDMxUkJ5Z3g5SWNVZXBGUXdtRUR6elwvdDRoK3k4aFZaWStveDdtV0hrSm1BNTlEUnh6emJvWTYzWXVKOG5uSWFGYUpKZ202OFV0WVR6Rlk0cDRcL1NcL1YxdlFxM29HM255VlwvZitETVQydlBBZktvdmppWFJ2ZTRCVnBZXC9FMjFMQjRDb0VmXC9IWmZMNjNHZGM5S0JrXC8xdFRUdHVZaWJmSzVHd0gwemhjNWRkcFZcL0R5VXMzamFPMHRQYXlseGRVZzY4SnVNR2tKMVZKREMrXC9rSDducDJURWFxT1dnOVVIYlUyR3ZtWWI1ZVZVWjVFbG9nUT09IiwibWFjIjoiMGJhNTQzYjQ0MGI5ZmE0YmEwNjc1ODdiODRjMDM2OGZhMzVjYzI1N2Q1NzU1MTNjNGJlYjMzOWEzMzY0N2I2MyJ9','2021-12-17 04:01:40','2021-12-26 09:27:12',8.96222,98.5566,48102.4),('6cf3e5a0-5f17-11ec-82a4-5d39e1dc65be','ikassulke','$2y$10$.YoY3uGDiUE0SPt6LyCH7OLNJL0no5vwyH8Ab0jJ/akpK4yc8sg7K',NULL,'$2y$10$JzgyQUwFNYGCq9suLbQvXuy5LUvMxy6SclDompkPHgTVOKOub41Ei',NULL,'2021-12-24 07:47:50',0,'BZREZL',NULL,NULL,'test','eyJpdiI6IlNSSkthSU91MEc2aGFseThyZEFla2c9PSIsInZhbHVlIjoiY0NJUzJcLzRaR1wvQm1PcTRDR3B2bjdcLysxd3ZOYkNlXC8rSVwvbmxuSVwvME9EOG85d2JST0RXTG1Oc1NDTDdFb0hNMGw1OWFXYnZZXC83OEJTc05OWkxWRlZIdzBmbXdLM09pRngybHdEd3pKM2tkK2lmZTMyNG1NMzNOY1hQNGplV2RtVjlSeml4Y2ZHbGthMGNNWFV5NmZFdUh3SzNkVStZbW92OU93NytQTDhQWStUbGw1VW45OGg3NWVVZHM4M0w0VFFtTlRWNWJ2VStlU2VpXC81OGxTUEZkWVhYRTR4M3BORnJjQk40VUtqY1RPYkZ4NHA1bmFPNmtpdHVad2FqUERkdG5xV1NVK0N4ZUNsOWZKaFZuY1NuRGZQSkxZRnA2Uk5LTUxUQ09mR1dDdXAzOHZKR3JVK09WZ1djODhsaXVZZWNWZUVGT0hJdE1HcVJyRktjYUZuMkE9PSIsIm1hYyI6IjE2NTc3NzNjYjg3NWMzNGI1YTQ3MTU5MWNlMjNjOGUzZTI4M2M3M2JhOTRhNTg3MTYyYmQ3NDcyY2NjNTc1OTIifQ==','eyJpdiI6IlBsT1B6elJDTW5IMXFYYUdVdVwvc1hBPT0iLCJ2YWx1ZSI6Iktxa0hrRXh5d2ZkeEpVNDFKSElFdG1ya2ZkbFQraWFiSGNTNytJcW12ak52eVEzMUR6OGtnRzhyS3p5MzFmVndJMFF6Y3ZyWStRSFZsWWo5QmJJZUNCQkNUTzN2RzhkaDF0WE5jemtIcWJXd1Nqdk5iQVdDVVdSdzd4V2dUVHY2Z3F2YUxQZzk2XC9JbWhycFlRbHVOTVpBQ1M3dUFTajIrc3NSVGViZ1ZGbEJJTThqVlIzT1UzbVZ0UEQ2c1VNRDc4TzB4Yzh6aHY1QmZOYWhMU0h4YkdwV2NUc251SGZwMlVRMFN6Vk1MbWx2WGlnak5MbXh1OEw4MFZXcXY2ZWJVUmhJSDV0YzA2Rjl4d0FNS2t6Q1ZVb25aT2ltdVdFb3dNV1JtT3kxS2pqdzVDQzFIT3BaTDduajhaeVZaRkZja0p3djRcL1RGMm1RT1R6SUJ6ODUwckdnPT0iLCJtYWMiOiI3YmEzNjUyZWJlMDcxMzliZTA2NmYzYTg5MmQ3NmU4MzM2YTIwZTdlZjM5YWRiZTY0NzIwMzQ4M2Q1ZWFiY2I1In0=','2021-12-17 07:57:55','2021-12-24 07:47:50',NULL,NULL,0),('be3a1c10-5cff-11ec-8820-3349f825a589','vender1','$2y$10$FWWHpNHoYaHvQyVUcdX0hOSnv10R0mo7AwZ9yfTVNuuNWPDntAFDi',NULL,'$2y$10$kGsUIsMb6.klbjIGq3ChjeZ8JQTE1wKJwbigsXeBY3w4XPFR.MmZi',NULL,'2021-12-24 08:24:53',0,'DXHM6F',NULL,NULL,'-----BEGIN PGP PUBLIC KEY BLOCK-----\r\nVersion: BCPG C# v1.6.1.0\r\n\r\nmQENBGG70VQBCACS8IAm4/3Xdw4AZn5/uhT0cSgx/OUDtZASyrNcB15aDCzX5ij7\r\noQdM7N+OPT07zqIyTeAdjpSGTgajZvKiJo8ZCBXnKwrwIJuvYiYpaaLG65Kj0uRT\r\nys805TRXaE0vLxQOU0IdQz9av23owLubbKx+w4wBnRknPIQwYyMUL9N+FnL75kuI\r\nL47qRKypzxmBUEUA8alsOtUE6ddbLuWrQm5lP29CQakKxQ7kAl8/vbvxY2Qq7tGK\r\nt0rZ0ifejwI50AYp/g2gy3qoWy2nhba7TbAdEScj4rFv6T62TMeFhHVLFIxpuFeM\r\nk/gfSYtOVRKgXrQqTbKg4IctHhDh7GfDfEc3ABEBAAG0G3N1cGVyaG9uZHNvbTk2\r\nODEzQGdtYWlsLmNvbYkBHAQQAQIABgUCYbvRVAAKCRBZsgETMXdy3AdFB/kBpVfg\r\nsSYcibcA/8BRbwIObALH72sy2TAcpwBsnVzJAKnLH69NgGkpURAXXLz7m6BbdSU+\r\n+VNwGeq3IkynHqdx0OmItCFd9tIjG6/r6Evzg3f9Io0rlZdAsVV7dvZ9MPr7Vgmy\r\n1meQfQQcFhNMFW0T7yLDZnAu1BRtoJtQyOu8YeDFM4suJyxUDWPvyRKSmJagzfgI\r\ne2R/C0J84m+AeG7ILJOaJEBKOL788uWrnb1RXp60chiilItOgdHHXVXqXuDE3ILp\r\nqncLM4bBwiIeu/LEHaR8+wuS5rWYEdqjwgWS0P/B+2g77Es8TAMsHGD47XX00C91\r\n+YhCpvgxPZUZOs47\r\n=WuxP\r\n-----END PGP PUBLIC KEY BLOCK-----','eyJpdiI6IklVMTh2ODRCTTUxRGQ0QWt4eGN1NXc9PSIsInZhbHVlIjoiczJmVE1QVlh0bDVxSTVXUkxcL3A4ZzJRXC8yYm82a1JJSEhYTVRUSGRtemw1S3luTkJkeUc1VTlMY2pTbnFDQkhUVWJMUkI5TUFVSGdTOWtxZDBvVm9hUHNRakpLTlhldHU0TlZCRzV5TXpTMFZId3BaWE1hZEtqR3ZlMmRFZ0ZraG4zYXQ0blwvSVhUYVBCS0oyQUtCSnRuaFpRVFN2eHk5anJtdzB0eWZja0U2a2xQNWo3eEdVZWpmSUhXMjg0Q0dyNHk0enRqalN2SDlUWFdHdjlmeVdMS1ptUm42TnJ5bTJ3bkgxUXYwb3pYYnROeDVWdk9CTzVtSjJuM05aUTFtcnNBOFVseU43NXk1c1puUmZcL21OVllCOTVvbEJ1dStSVWFhK0ppS1NKb0crUGpcL1J2ejZWbGM5ZHB6WmduUlA4dFNIRys2Z1wvUnU2RXN2K3luZmZ3TUNnPT0iLCJtYWMiOiI1MzQwNjJkM2ZkYjFjZjA5MzM3MTc5MjA4NDdkMTBkN2FkOWM2MTI1NTA2MzMzMTg4ZWRhNzIwOGQ1YzE0MDVmIn0=','eyJpdiI6ImN6RE5xQ21Ka1BiR1VWQkNadzVvaXc9PSIsInZhbHVlIjoiTWl4dUpGSEwwaEFcL0NzUXZ0QlNtcEdpTnRJQWN1R1NjaHNZWWVLSWlsN3RIR09NellhNnFuaGpmM0R4K0JOSlhWekJuajVRUis2TE9cL3BJUWhQYjdTTFozN1NtM2JPTkV4aWl5ZDNTQkFXUW5aUzIydGR4VDlhQTc5aFdmZkxqdkR0RE9UMDlxOEVSSGdrK2pJYmNHM2YydVhjcWRXXC9kcW1NQko5SkUrUGRzNlA1dFZvN2VkVEdLVlFFOVZpSnlZVDc5cUVmRnhHT1BPVVdGZkVIbWhjS2JUbUZzVEI0eDJqQUNHK3U5dXhcL1VcL2JPQ0VPdXBQaHVIOWtSNVQ5ajdrY1NqS0YyR3dLaDJib2lcL2h6QWkybERoSTF3WE03TE1RKyt6ZjFGV2xKejFIa3NFa1hoSW5FQnFPZXBCMFJIVExoMTVidVBtMFAyWXlZK0JtR2ZLTnB3PT0iLCJtYWMiOiJiMDNjM2I0NGE1YjI0MjdjOTFjNmMwMGFmYjBlNmQ2NTFiNjNmZGJjN2U4ZGVkZjY1ZWU2OTZlZWU2Y2VjYTk0In0=','2021-12-14 16:03:21','2021-12-24 08:32:07',0.0464125,1.4242,98197);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_purchases`
--

DROP TABLE IF EXISTS `vendor_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_purchases` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `vendor_purchases` VALUES ('be3da270-5cff-11ec-8a29-7fe9b1ea89f7','be3a1c10-5cff-11ec-8820-3349f825a589','addressStub#467964','stb',101.000000000000,'2021-12-14 16:03:21','2021-12-16 22:55:15');
/*!40000 ALTER TABLE `vendor_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_level` int unsigned NOT NULL,
  `experience` int NOT NULL DEFAULT '0',
  `about` text COLLATE utf8mb4_unicode_ci,
  `profilebg` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `vendors` VALUES ('be3a1c10-5cff-11ec-8820-3349f825a589',0,11640,'Vender1','profile-bg-blueprint',0,'2021-12-16 22:55:15','2021-12-24 08:32:07');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `wishlists` VALUES ('6bd39550-5ef6-11ec-9699-bb782419c069','7d876700-6110-11ec-b7cb-9b3c44439e2b','2021-12-23 08:27:53','2021-12-23 08:27:53');
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

-- Dump completed on 2021-12-27  6:18:02
