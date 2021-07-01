-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: aspire
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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Super Admin','superadmin@example.com',NULL,'$2y$10$sZAb1oow6X46BFAB8ux90upd3U3DyBWqdBv/T51gNDbQxDaxSEb0u',NULL,'2021-07-01 08:47:49','2021-07-01 10:42:05');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `amount` double(12,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `duration` int NOT NULL COMMENT 'Number of month',
  `repayment_frequency` int NOT NULL COMMENT 'Number of months to make repayment',
  `interest_rate` double(8,2) NOT NULL,
  `arrangement_fee` double(8,2) NOT NULL,
  `first_paydate` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,14004.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 10:57:49','2021-06-30 10:57:49'),(2,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 10:58:03','2021-06-30 10:58:03'),(3,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 10:58:42','2021-06-30 10:58:42'),(4,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 10:58:43','2021-06-30 10:58:43'),(5,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 10:58:45','2021-06-30 10:58:45'),(6,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 10:58:46','2021-06-30 10:58:46'),(7,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 11:00:25','2021-06-30 11:00:25'),(8,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 14:47:42','2021-06-30 14:47:42'),(9,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:47:51','2021-06-30 15:47:51'),(10,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:48:48','2021-06-30 15:48:48'),(11,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:49:14','2021-06-30 15:49:14'),(12,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:49:34','2021-06-30 15:49:34'),(13,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:49:49','2021-06-30 15:49:49'),(14,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:49:56','2021-06-30 15:49:56'),(15,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:50:03','2021-06-30 15:50:03'),(16,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:52:08','2021-06-30 15:52:08'),(17,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:53:33','2021-06-30 15:53:33'),(18,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:53:44','2021-06-30 15:53:44'),(19,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:54:05','2021-06-30 15:54:05'),(20,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:54:45','2021-06-30 15:54:45'),(21,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:54:46','2021-06-30 15:54:46'),(22,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:55:01','2021-06-30 15:55:01'),(23,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:55:16','2021-06-30 15:55:16'),(24,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:55:26','2021-06-30 15:55:26'),(25,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:55:45','2021-06-30 15:55:45'),(26,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-06-30 15:55:48','2021-06-30 15:55:48'),(27,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-07-01 06:31:54','2021-07-01 06:31:54'),(28,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-07-01 06:50:48','2021-07-01 06:50:48'),(29,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-07-01 06:51:10','2021-07-01 06:51:10'),(30,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-07-01 06:51:59','2021-07-01 06:51:59'),(31,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-07-01 06:52:39','2021-07-01 06:52:39'),(32,1,14005.00,'USD',12,3,0.23,0.10,'2020-07-05 00:00:00','2021-07-01 10:33:51','2021-07-01 10:33:51');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (9,'2014_10_12_000000_create_users_table',1),(10,'2014_10_12_100000_create_password_resets_table',1),(11,'2016_06_01_000001_create_oauth_auth_codes_table',1),(12,'2016_06_01_000002_create_oauth_access_tokens_table',1),(13,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(14,'2016_06_01_000004_create_oauth_clients_table',1),(15,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(16,'2019_08_19_000000_create_failed_jobs_table',1),(33,'2021_06_30_072829_create_loans_table',2),(34,'2021_06_30_072851_create_repayments_table',2),(35,'2021_06_30_104617_add_unique_on_repayments_table',2),(36,'2021_07_01_075920_create_permission_tables',3),(37,'2021_07_01_081521_create_admins_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0af3259cbcac775be35f7a0ef73f404e7ab1333a8df21e80d4e777e22b2dcaecd3d3de1198bd363d',2,1,'Personal Access Token','[]',0,'2021-06-29 17:26:05','2021-06-29 17:26:05','2021-09-29 17:26:05'),('1f3ca0863fd3e6aeb946fede86597b127d5db6c58090953cb6896422512c1deda7d094e40684d96a',1,1,'Personal Access Token','[]',0,'2021-06-30 06:53:40','2021-06-30 06:53:40','2021-09-30 06:53:40'),('25bb03b6ba9210ccb685ec41009e830eaa98c81ddb1348e41c1d5eefbb9592124435fcef0a422963',1,1,'Personal Access Token','[]',1,'2021-06-30 07:16:38','2021-06-30 07:16:38','2021-09-30 07:16:38'),('328423ef0ddbb756610f78a5d1bdfe89f53ee85c2e025bc3ffab7e31e5a87017c055e1d54026fab5',1,1,'Personal Access Token','[]',1,'2021-07-01 06:50:21','2021-07-01 06:50:21','2021-10-01 06:50:21'),('34cdecdcb6827c9d9c00747e52a8c30409c324c62f10a27237b0cc6c73fab90c51a5bb8b1d3d4f5a',1,1,'Personal Access Token','[]',0,'2021-07-01 10:25:34','2021-07-01 10:25:34','2021-10-01 10:25:34'),('4d711da0eac601da0c0c0f4809abfc788cc2a7196893974a0add4d6ba221b3435cae26beee2f2676',1,1,'Personal Access Token','[]',0,'2021-07-01 06:36:52','2021-07-01 06:36:52','2021-10-01 06:36:51'),('5169c1d53feddb8ae7d7d6c70e742560a99a1f974de5d93f47d35e948e8c72eef762fd0d43a44f63',3,1,'Personal Access Token','[]',0,'2021-06-30 06:40:41','2021-06-30 06:40:41','2021-09-30 06:40:40'),('57e088dfba019c51ef6abe0015550c21ea6fcd532647f3a9ab580b98eb88de1dcb627c2e1f513fdc',1,1,'Personal Access Token','[]',0,'2021-07-01 07:22:13','2021-07-01 07:22:13','2021-10-01 07:22:12'),('66c4565b4b9120e5353ceb642e6888945af874732e3907fc7a6c99d627d199f59cc94a0be53ad416',1,1,'Personal Access Token','[]',1,'2021-07-01 10:24:09','2021-07-01 10:24:09','2021-10-01 10:24:09'),('7471ca53f65aad23bfd1ad196183b1cfc56f4e47c7cbc81564d8e8a68d32f7f56be39516a5e552e0',1,1,'Personal Access Token','[]',1,'2021-07-01 04:57:55','2021-07-01 04:57:55','2021-10-01 04:57:54'),('76de28e4638e20a8b044ccc525e126b94d3f3a67edc8069568e0e7d1534bb2ffea8f2aa39d1e82de',1,1,'Personal Access Token','[]',0,'2021-07-01 07:21:00','2021-07-01 07:21:00','2021-10-01 07:21:00'),('7c8cee9333d21b6e0122416a5ed87e112c7d0b09de7d02c312c6a856a2ee7b127ab4d301ff235cc2',1,1,'Personal Access Token','[]',0,'2021-06-30 06:49:06','2021-06-30 06:49:06','2021-09-30 06:49:06'),('905c5a2b37097d48a6bacaaa72e4e0c40fc23508773d1c823fe342f01e6fd271d9a8bb26349b4cc8',1,1,'Personal Access Token','[]',0,'2021-07-01 07:22:01','2021-07-01 07:22:01','2021-10-01 07:22:01'),('9686885205cfd4d634fc86821e1cd814162c9efae09fa90aa29af0cb840fe4f61546974ef274d666',1,1,'Personal Access Token','[]',0,'2021-06-30 06:45:43','2021-06-30 06:45:43','2021-09-30 06:45:43'),('a0e00d2327c23ca92e23bf9f065c7b4dd3d0ac3974e70db83318a7f92fd8b19d0ae9d6b3d2d1cdeb',1,1,'Personal Access Token','[]',0,'2021-06-30 06:55:13','2021-06-30 06:55:13','2021-09-30 06:55:13'),('a72e07b00063e4a805920be4fcc755779a399fd7f00426f9797d4dcfed657c934f3460f9e7bc922e',1,1,'Personal Access Token','[]',0,'2021-07-01 07:22:46','2021-07-01 07:22:46','2021-10-01 07:22:46'),('acf5c4cd123f36fea59b85dcbb6c9b53bb433c187f9ee6901dda24d5889c6f1136997db4bcdb289d',1,1,'Personal Access Token','[]',0,'2021-06-30 06:54:44','2021-06-30 06:54:44','2021-09-30 06:54:44'),('ae87544d4aebae339f1e94dd4ca8d80aa110e1aed6287dca78f1697d7bbcf51c9e245389aeb7a593',1,1,'Personal Access Token','[]',0,'2021-07-01 10:33:12','2021-07-01 10:33:12','2021-10-01 10:33:12'),('b2a9a6c5376c91a3647832bbb6e4a29b656a5e6ab4c5f2fa089f3867d4724def1ff5ebc782f362c1',1,1,'Personal Access Token','[]',0,'2021-07-01 06:52:55','2021-07-01 06:52:55','2021-10-01 06:52:55'),('b543088f4a967a1d5d0665e8788163d804e65fe1c7eca6fffc1f7034e7b11d20f5731e575c68f4d0',1,1,'Personal Access Token','[]',1,'2021-06-30 06:57:22','2021-06-30 06:57:22','2021-09-30 06:57:22'),('b755891b230265291e8f2fe4feecfbd08c3b66058ffc712056f2f0bd9955d58dfe2079023648b7c4',1,1,'Personal Access Token','[]',0,'2021-06-30 06:46:16','2021-06-30 06:46:16','2021-09-30 06:46:16'),('bc70470c4e6d990aa05704c5e50cdcb9a42ab22199411b135affdf19edde6e9ade4d1e957d3e7cde',1,1,'Personal Access Token','[]',0,'2021-07-01 05:04:49','2021-07-01 05:04:49','2021-10-01 05:04:48'),('d057a6535ed638e599746d376f2ab3e3869a71fef8a73ac6c6a4e44d4aecea801946ed191b9391eb',1,1,'Personal Access Token','[]',0,'2021-07-01 10:11:14','2021-07-01 10:11:14','2021-10-01 10:11:14'),('e110481d8040a512e0585cfc62622fad7c52219549e7c7cb9c83d416045760f213ecadd7edc9983d',1,1,'Personal Access Token','[]',0,'2021-06-30 06:48:54','2021-06-30 06:48:54','2021-09-30 06:48:54'),('e16fac546446f283aba06581f60e1b77df392ee829fc1652828114e1c274d793c627c29e3572049d',1,1,'Personal Access Token','[]',0,'2021-06-29 17:23:35','2021-06-29 17:23:35','2021-09-29 17:23:35'),('e72d96e6a061515b6edfb49dbdd2a5572a2f07ea8260af0bff4a56722785cb383f1b63e363539619',1,1,'Personal Access Token','[]',0,'2021-07-01 06:48:57','2021-07-01 06:48:57','2021-10-01 06:48:57'),('e7e90c169ab375be37026bae1b9ba9ea3e587df92514148f1c3aee01cce61f3018f8bbd927dc881f',1,1,'Personal Access Token','[]',0,'2021-07-01 07:22:37','2021-07-01 07:22:37','2021-10-01 07:22:37'),('eefa148365828d788a324839a9ddb54b34b00d1a28d0a8e272cb99e28df1e54e44d7bf318d22ff41',1,1,'Personal Access Token','[]',1,'2021-06-30 07:17:32','2021-06-30 07:17:32','2021-09-30 07:17:31');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','v11vs393YdSb09ylYcCB4YkluWi0CUya1rnSzO6g',NULL,'http://localhost',1,0,0,'2021-06-29 15:53:17','2021-06-29 15:53:17'),(2,NULL,'Laravel Password Grant Client','VKSdV1nITfIPECCG9VcXo1zhmcStY8ryixC5uetO','users','http://localhost',0,1,0,'2021-06-29 15:53:17','2021-06-29 15:53:17');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-06-29 15:53:17','2021-06-29 15:53:17');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
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
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repayments`
--

DROP TABLE IF EXISTS `repayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repayments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `amount` double(12,2) NOT NULL,
  `pay_date` date NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `paid_date` datetime DEFAULT NULL,
  `paid_amount` double(12,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repayments_loan_id_pay_date_unique` (`loan_id`,`pay_date`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayments`
--

LOCK TABLES `repayments` WRITE;
/*!40000 ALTER TABLE `repayments` DISABLE KEYS */;
INSERT INTO `repayments` VALUES (1,1,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 10:57:49','2021-06-30 10:57:49'),(2,1,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 10:57:49','2021-06-30 10:57:49'),(3,1,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 10:57:49','2021-06-30 10:57:49'),(4,1,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 10:57:49','2021-06-30 10:57:49'),(5,1,3501.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 10:57:49','2021-06-30 10:57:49'),(6,2,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:03','2021-06-30 10:58:03'),(7,2,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 10:58:03','2021-06-30 10:58:03'),(8,2,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 10:58:03','2021-06-30 10:58:03'),(9,2,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 10:58:03','2021-06-30 10:58:03'),(10,2,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:03','2021-06-30 10:58:03'),(11,3,3501.00,'2020-07-05','USD',1,'2021-06-30 16:55:09',3501.00,'2021-06-30 10:58:42','2021-06-30 16:55:09'),(12,3,3501.00,'2020-10-05','USD',1,'2021-07-01 06:46:51',3501.00,'2021-06-30 10:58:42','2021-07-01 06:46:51'),(13,3,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 10:58:42','2021-06-30 10:58:42'),(14,3,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 10:58:42','2021-06-30 10:58:42'),(15,3,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:42','2021-06-30 10:58:42'),(16,4,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:43','2021-06-30 10:58:43'),(17,4,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 10:58:43','2021-06-30 10:58:43'),(18,4,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 10:58:43','2021-06-30 10:58:43'),(19,4,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 10:58:43','2021-06-30 10:58:43'),(20,4,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:43','2021-06-30 10:58:43'),(21,5,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:45','2021-06-30 10:58:45'),(22,5,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 10:58:45','2021-06-30 10:58:45'),(23,5,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 10:58:45','2021-06-30 10:58:45'),(24,5,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 10:58:45','2021-06-30 10:58:45'),(25,5,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:45','2021-06-30 10:58:45'),(26,6,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:46','2021-06-30 10:58:46'),(27,6,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 10:58:46','2021-06-30 10:58:46'),(28,6,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 10:58:46','2021-06-30 10:58:46'),(29,6,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 10:58:46','2021-06-30 10:58:46'),(30,6,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 10:58:46','2021-06-30 10:58:46'),(31,7,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 11:00:26','2021-06-30 11:00:26'),(32,7,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 11:00:26','2021-06-30 11:00:26'),(33,7,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 11:00:26','2021-06-30 11:00:26'),(34,7,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 11:00:26','2021-06-30 11:00:26'),(35,7,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 11:00:26','2021-06-30 11:00:26'),(36,8,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 14:47:42','2021-06-30 14:47:42'),(37,8,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 14:47:42','2021-06-30 14:47:42'),(38,8,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 14:47:42','2021-06-30 14:47:42'),(39,8,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 14:47:42','2021-06-30 14:47:42'),(40,8,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 14:47:42','2021-06-30 14:47:42'),(41,9,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:47:51','2021-06-30 15:47:51'),(42,9,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:47:51','2021-06-30 15:47:51'),(43,9,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:47:51','2021-06-30 15:47:51'),(44,9,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:47:51','2021-06-30 15:47:51'),(45,9,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:47:51','2021-06-30 15:47:51'),(46,10,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:48:48','2021-06-30 15:48:48'),(47,10,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:48:48','2021-06-30 15:48:48'),(48,10,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:48:48','2021-06-30 15:48:48'),(49,10,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:48:48','2021-06-30 15:48:48'),(50,10,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:48:48','2021-06-30 15:48:48'),(51,11,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:14','2021-06-30 15:49:14'),(52,11,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:49:14','2021-06-30 15:49:14'),(53,11,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:49:14','2021-06-30 15:49:14'),(54,11,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:49:14','2021-06-30 15:49:14'),(55,11,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:14','2021-06-30 15:49:14'),(56,12,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:34','2021-06-30 15:49:34'),(57,12,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:49:34','2021-06-30 15:49:34'),(58,12,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:49:34','2021-06-30 15:49:34'),(59,12,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:49:34','2021-06-30 15:49:34'),(60,12,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:34','2021-06-30 15:49:34'),(61,13,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:49','2021-06-30 15:49:49'),(62,13,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:49:49','2021-06-30 15:49:49'),(63,13,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:49:49','2021-06-30 15:49:49'),(64,13,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:49:49','2021-06-30 15:49:49'),(65,13,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:49','2021-06-30 15:49:49'),(66,14,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:56','2021-06-30 15:49:56'),(67,14,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:49:56','2021-06-30 15:49:56'),(68,14,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:49:56','2021-06-30 15:49:56'),(69,14,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:49:56','2021-06-30 15:49:56'),(70,14,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:49:56','2021-06-30 15:49:56'),(71,15,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:50:03','2021-06-30 15:50:03'),(72,15,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:50:03','2021-06-30 15:50:03'),(73,15,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:50:03','2021-06-30 15:50:03'),(74,15,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:50:03','2021-06-30 15:50:03'),(75,15,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:50:03','2021-06-30 15:50:03'),(76,16,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:52:09','2021-06-30 15:52:09'),(77,16,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:52:09','2021-06-30 15:52:09'),(78,16,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:52:09','2021-06-30 15:52:09'),(79,16,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:52:09','2021-06-30 15:52:09'),(80,16,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:52:09','2021-06-30 15:52:09'),(81,17,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:53:33','2021-06-30 15:53:33'),(82,17,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:53:33','2021-06-30 15:53:33'),(83,17,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:53:33','2021-06-30 15:53:33'),(84,17,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:53:33','2021-06-30 15:53:33'),(85,17,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:53:33','2021-06-30 15:53:33'),(86,18,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:53:44','2021-06-30 15:53:44'),(87,18,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:53:44','2021-06-30 15:53:44'),(88,18,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:53:44','2021-06-30 15:53:44'),(89,18,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:53:44','2021-06-30 15:53:44'),(90,18,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:53:44','2021-06-30 15:53:44'),(91,19,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:54:05','2021-06-30 15:54:05'),(92,19,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:54:05','2021-06-30 15:54:05'),(93,19,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:54:05','2021-06-30 15:54:05'),(94,19,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:54:05','2021-06-30 15:54:05'),(95,19,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:54:05','2021-06-30 15:54:05'),(96,20,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:54:45','2021-06-30 15:54:45'),(97,20,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:54:45','2021-06-30 15:54:45'),(98,20,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:54:45','2021-06-30 15:54:45'),(99,20,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:54:45','2021-06-30 15:54:45'),(100,20,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:54:45','2021-06-30 15:54:45'),(101,21,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:54:46','2021-06-30 15:54:46'),(102,21,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:54:46','2021-06-30 15:54:46'),(103,21,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:54:46','2021-06-30 15:54:46'),(104,21,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:54:46','2021-06-30 15:54:46'),(105,21,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:54:46','2021-06-30 15:54:46'),(106,22,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:01','2021-06-30 15:55:01'),(107,22,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:55:01','2021-06-30 15:55:01'),(108,22,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:55:01','2021-06-30 15:55:01'),(109,22,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:55:01','2021-06-30 15:55:01'),(110,22,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:01','2021-06-30 15:55:01'),(111,23,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:16','2021-06-30 15:55:16'),(112,23,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:55:16','2021-06-30 15:55:16'),(113,23,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:55:16','2021-06-30 15:55:16'),(114,23,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:55:16','2021-06-30 15:55:16'),(115,23,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:16','2021-06-30 15:55:16'),(116,24,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:26','2021-06-30 15:55:26'),(117,24,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:55:26','2021-06-30 15:55:26'),(118,24,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:55:26','2021-06-30 15:55:26'),(119,24,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:55:26','2021-06-30 15:55:26'),(120,24,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:26','2021-06-30 15:55:26'),(121,25,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:45','2021-06-30 15:55:45'),(122,25,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:55:45','2021-06-30 15:55:45'),(123,25,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:55:45','2021-06-30 15:55:45'),(124,25,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:55:45','2021-06-30 15:55:45'),(125,25,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:45','2021-06-30 15:55:45'),(126,26,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:48','2021-06-30 15:55:48'),(127,26,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-06-30 15:55:48','2021-06-30 15:55:48'),(128,26,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-06-30 15:55:48','2021-06-30 15:55:48'),(129,26,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-06-30 15:55:48','2021-06-30 15:55:48'),(130,26,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-06-30 15:55:48','2021-06-30 15:55:48'),(131,27,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-07-01 06:31:54','2021-07-01 06:31:54'),(132,27,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-07-01 06:31:54','2021-07-01 06:31:54'),(133,27,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-07-01 06:31:54','2021-07-01 06:31:54'),(134,27,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-07-01 06:31:54','2021-07-01 06:31:54'),(135,27,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-07-01 06:31:54','2021-07-01 06:31:54'),(136,28,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-07-01 06:50:49','2021-07-01 06:50:49'),(137,28,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-07-01 06:50:49','2021-07-01 06:50:49'),(138,28,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-07-01 06:50:49','2021-07-01 06:50:49'),(139,28,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-07-01 06:50:49','2021-07-01 06:50:49'),(140,28,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-07-01 06:50:49','2021-07-01 06:50:49'),(141,29,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-07-01 06:51:10','2021-07-01 06:51:10'),(142,29,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-07-01 06:51:10','2021-07-01 06:51:10'),(143,29,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-07-01 06:51:10','2021-07-01 06:51:10'),(144,29,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-07-01 06:51:10','2021-07-01 06:51:10'),(145,29,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-07-01 06:51:10','2021-07-01 06:51:10'),(146,30,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-07-01 06:51:59','2021-07-01 06:51:59'),(147,30,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-07-01 06:51:59','2021-07-01 06:51:59'),(148,30,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-07-01 06:51:59','2021-07-01 06:51:59'),(149,30,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-07-01 06:51:59','2021-07-01 06:51:59'),(150,30,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-07-01 06:51:59','2021-07-01 06:51:59'),(151,31,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-07-01 06:52:39','2021-07-01 06:52:39'),(152,31,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-07-01 06:52:39','2021-07-01 06:52:39'),(153,31,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-07-01 06:52:39','2021-07-01 06:52:39'),(154,31,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-07-01 06:52:39','2021-07-01 06:52:39'),(155,31,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-07-01 06:52:39','2021-07-01 06:52:39'),(156,32,3501.00,'2020-07-05','USD',0,NULL,NULL,'2021-07-01 10:33:51','2021-07-01 10:33:51'),(157,32,3501.00,'2020-10-05','USD',0,NULL,NULL,'2021-07-01 10:33:51','2021-07-01 10:33:51'),(158,32,3501.00,'2021-01-05','USD',0,NULL,NULL,'2021-07-01 10:33:51','2021-07-01 10:33:51'),(159,32,3501.00,'2021-04-05','USD',0,NULL,NULL,'2021-07-01 10:33:51','2021-07-01 10:33:51'),(160,32,3502.00,'2021-07-05','USD',0,NULL,NULL,'2021-07-01 10:33:51','2021-07-01 10:33:51');
/*!40000 ALTER TABLE `repayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','admin','2021-07-01 09:25:33','2021-07-01 10:42:05'),(2,'manager','admin','2021-07-01 09:25:33','2021-07-01 10:42:05'),(3,'employee','admin','2021-07-01 09:25:33','2021-07-01 10:42:05');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Quan Vu','quanvu@example.com',NULL,'$2y$10$vvcFAea0tDLPxbqByuHyFuByHExKZXzJRTtShYROGwKjqrT1oEeVC',NULL,'2021-06-29 17:23:35','2021-06-29 17:23:35'),(2,'Quan Vu 1','quanvu1@example.com',NULL,'$2y$10$5l4puxQXWLJRaJHPfX9kPO4PoAJWQDemyMveKVyhb0ay7S6ErEDDK',NULL,'2021-06-29 17:26:05','2021-06-29 17:26:05'),(3,'Quan Vu 2','quanvu2@example.com',NULL,'$2y$10$XN/5JpLHCArfJeuXURkPAOnQDDUzqEh3JqvtISU0dvNn/Kl/Yv3.G',NULL,'2021-06-30 06:40:40','2021-06-30 06:40:40'),(4,'Tester 1+','tester1@example.com',NULL,'$2y$10$B2Jo1LHOhHgXg2tUHGj0qezO18ssgkBl5wIqZxdT7c62R6tHQpL5G',NULL,'2021-07-01 07:25:57','2021-07-01 07:56:39'),(7,'Tester 5','tester5@example.com',NULL,'123456',NULL,'2021-07-01 07:51:54','2021-07-01 07:51:54'),(9,'Tester 6+','tester65@example.com',NULL,'$2y$10$ZjQ03eLR7e9SLpaGM5ZzJOaY9S.aekpsUiiPuAfboq.a6Fy2Vvcc6',NULL,'2021-07-01 10:37:43','2021-07-01 10:40:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-01 17:52:52
