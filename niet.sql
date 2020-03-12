-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: niet
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  `worktime_start` time DEFAULT NULL,
  `worktime_end` time DEFAULT NULL,
  `shop_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abouts_shop_id_index` (`shop_id`),
  CONSTRAINT `abouts_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abouts`
--

LOCK TABLES `abouts` WRITE;
/*!40000 ALTER TABLE `abouts` DISABLE KEYS */;
INSERT INTO `abouts` VALUES (1,'Cumque cumque sapiente nulla recusandae ipsum quae.','17:00:51','06:09:07',1,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(2,'Quia saepe officia molestias in.','02:03:38','01:30:44',2,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(3,'Omnis reprehenderit veniam quod nulla omnis veritatis dicta exercitationem.','04:33:00','06:38:04',3,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(4,'Maxime quaerat facilis rerum id sunt.','00:22:51','13:23:35',4,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(5,'Odit fugiat deserunt dolores assumenda ipsum.','14:43:42','13:43:16',5,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(6,'Autem unde laborum ex.','03:05:14','19:36:50',6,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(7,'Vero voluptates ut quaerat sequi ut repellendus.','13:28:37','18:05:02',7,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(8,'Corrupti id cumque non quo.','09:49:54','21:10:49',8,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(9,'Quis magni ex unde soluta voluptatum qui.','13:10:44','18:04:54',9,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(10,'Et voluptatem fuga tempora.','00:09:02','09:46:24',10,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(11,'Voluptas architecto voluptates iste placeat quae nemo.','22:23:15','12:26:07',11,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(12,'Voluptas dolores voluptatem minus ipsam.','07:24:43','03:28:07',12,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(13,'Quo aspernatur quae officia voluptatem.','12:09:59','16:10:52',13,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(14,'Aut est fugiat minima.','04:27:29','03:03:43',14,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(15,'Et nostrum a animi odit.','23:49:47','03:52:30',15,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(16,'Iusto omnis non esse et rem dolor.','20:36:12','12:50:38',16,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(17,'Est totam voluptas repellendus impedit at.','23:32:31','12:54:22',17,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(18,'Ratione pariatur quos nostrum sed voluptatem in laborum.','13:42:03','09:09:36',18,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(19,'Omnis vel a quaerat facilis praesentium dolores.','12:41:22','10:31:05',19,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(20,'Pariatur amet laudantium dolore iure quisquam dolor.','02:38:10','19:28:07',20,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL);
/*!40000 ALTER TABLE `abouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
-- Table structure for table `infos`
--

DROP TABLE IF EXISTS `infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `infos_product_id_index` (`product_id`),
  CONSTRAINT `infos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infos`
--

LOCK TABLES `infos` WRITE;
/*!40000 ALTER TABLE `infos` DISABLE KEYS */;
INSERT INTO `infos` VALUES (1,'Laborum qui autem est quibusdam.','Quo cum reiciendis non quasi molestias deserunt.',21,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(2,'Est vel omnis est labore voluptatem magni.','Vitae est quia molestiae beatae dolores.',22,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(3,'Autem porro quo ea vitae.','Veritatis quia neque ut.',23,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(4,'Similique illum quam voluptatem suscipit illo.','Architecto quae vitae praesentium nulla quaerat dignissimos dolores.',24,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(5,'Itaque quo consequatur esse nisi eaque recusandae.','Error asperiores voluptates itaque architecto.',25,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(6,'Repellat cupiditate est modi quas.','Qui neque qui ut nisi.',26,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(7,'Enim provident eum ipsum molestiae consequuntur.','Voluptatibus dolorum qui iste.',27,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(8,'Expedita similique dolor similique ea ad id et qui.','Eligendi perferendis alias natus eum.',28,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL),(9,'Animi qui fugiat deserunt voluptatem nesciunt in soluta odit.','Aut ad accusantium molestiae quibusdam.',29,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL),(10,'Molestiae vel officia quis magnam.','Mollitia aliquid saepe quos sunt commodi sit laboriosam at.',30,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL);
/*!40000 ALTER TABLE `infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `managers_email_unique` (`email`),
  KEY `managers_shop_id_index` (`shop_id`),
  CONSTRAINT `managers_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_06_082038_create_shops_table',1),(5,'2019_12_06_082054_create_products_table',1),(6,'2019_12_06_082111_create_tags_table',1),(7,'2019_12_06_082154_create_abouts_table',1),(8,'2019_12_06_082159_create_infos_table',1),(9,'2019_12_06_084056_create_tips_table',1),(10,'2019_12_14_061812_add_phone_col_users_table',1),(11,'2019_12_14_062329_set_nullable_email_column_users_table',1),(12,'2019_12_14_095330_create_managers_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `full_price` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pick_up` time DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `shop_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_shop_id_index` (`shop_id`),
  CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Vero doloremque consequatur a est quia sunt.',57,947,'https://lorempixel.com/640/480/?67610','14:50:28',8,1,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(2,'Aliquam numquam perspiciatis aut voluptas.',71,952,'https://lorempixel.com/640/480/?47639','22:48:01',3,2,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(3,'Ut quia voluptatem eaque a.',87,708,'https://lorempixel.com/640/480/?48701','17:16:15',4,3,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(4,'Delectus facilis repellendus aliquid officia minus.',63,784,'https://lorempixel.com/640/480/?90761','00:38:55',8,4,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(5,'Quidem labore sed reiciendis voluptatem voluptatem sapiente vitae.',95,321,'https://lorempixel.com/640/480/?18110','03:06:17',3,5,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(6,'Dolores similique consectetur minima quae expedita quibusdam omnis.',92,264,'https://lorempixel.com/640/480/?89491','20:55:11',4,6,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(7,'Repellendus libero commodi dolor corporis consectetur laudantium ad.',26,393,'https://lorempixel.com/640/480/?24625','12:59:51',2,7,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(8,'Voluptate voluptates quia et ipsam nostrum.',70,130,'https://lorempixel.com/640/480/?80769','12:43:07',5,8,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(9,'Earum reprehenderit tempore tempore est.',42,860,'https://lorempixel.com/640/480/?16970','04:10:44',1,9,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(10,'Et ullam omnis quia expedita incidunt commodi.',12,639,'https://lorempixel.com/640/480/?27163','10:42:46',0,10,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(11,'Voluptates repellendus omnis labore ut tempore magnam.',51,525,'https://lorempixel.com/640/480/?71733','03:48:29',5,11,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(12,'Et mollitia ipsam facilis reiciendis delectus.',33,160,'https://lorempixel.com/640/480/?53850','11:18:00',7,12,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(13,'Laudantium maxime consequatur sed corporis explicabo enim sunt.',48,300,'https://lorempixel.com/640/480/?93997','12:49:35',4,13,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(14,'Laborum dignissimos et voluptates aut debitis non.',77,194,'https://lorempixel.com/640/480/?79137','00:15:29',5,14,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(15,'Non consectetur accusamus ad odio.',72,578,'https://lorempixel.com/640/480/?49456','22:20:57',8,15,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(16,'Sunt qui quos asperiores laborum neque deserunt.',15,760,'https://lorempixel.com/640/480/?79437','02:09:15',4,16,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(17,'Officia doloribus et reprehenderit reprehenderit quia.',76,917,'https://lorempixel.com/640/480/?35418','03:36:43',1,17,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(18,'Nesciunt expedita sed ut rem beatae vitae neque.',20,336,'https://lorempixel.com/640/480/?41591','01:50:12',1,18,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(19,'Necessitatibus fugiat cum vitae libero et a dolorum.',20,772,'https://lorempixel.com/640/480/?71049','04:01:59',7,19,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(20,'Id qui provident saepe accusantium.',63,999,'https://lorempixel.com/640/480/?27548','08:00:24',0,20,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(21,'Quo nemo libero voluptates.',5,44,'https://lorempixel.com/640/480/?26341','18:09:12',5,61,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(22,'Neque quae nobis rerum id.',29,150,'https://lorempixel.com/640/480/?76085','11:32:44',7,62,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(23,'Voluptas veritatis quaerat harum consequatur.',35,720,'https://lorempixel.com/640/480/?45426','19:42:19',4,63,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(24,'Vitae quia quia natus eum eligendi in.',31,261,'https://lorempixel.com/640/480/?90495','22:21:00',1,64,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(25,'Corporis exercitationem ipsa quia ea voluptatibus.',19,239,'https://lorempixel.com/640/480/?86117','13:30:32',5,65,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(26,'Asperiores eum molestiae eligendi fugiat nesciunt ducimus excepturi.',7,919,'https://lorempixel.com/640/480/?85296','16:37:46',2,66,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(27,'Voluptatum quod et vel nam ut et voluptates odio.',30,461,'https://lorempixel.com/640/480/?52035','07:25:48',8,67,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(28,'Qui praesentium excepturi aut eos porro voluptatem.',18,908,'https://lorempixel.com/640/480/?30582','16:32:28',0,68,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(29,'Voluptatum voluptatem eos consequatur aut delectus nesciunt ex.',96,526,'https://lorempixel.com/640/480/?19325','19:38:43',7,69,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(30,'Voluptatem distinctio qui aut aspernatur et.',32,70,'https://lorempixel.com/640/480/?13434','17:02:02',3,70,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(31,'Nemo officia ut eos est.',1,249,'https://lorempixel.com/640/480/?56680','04:44:05',9,71,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(32,'Molestiae dignissimos possimus nihil illum molestias beatae.',44,994,'https://lorempixel.com/640/480/?20055','09:16:59',8,72,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(33,'Omnis et voluptatum enim ullam quis.',19,264,'https://lorempixel.com/640/480/?79490','05:23:50',4,73,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(34,'Enim ad inventore quos velit itaque facilis.',50,415,'https://lorempixel.com/640/480/?88843','17:05:36',2,74,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(35,'Dolor voluptatem beatae totam ut modi.',20,998,'https://lorempixel.com/640/480/?28058','13:54:11',8,75,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(36,'Velit consectetur qui facilis itaque qui ut tempora.',21,917,'https://lorempixel.com/640/480/?51554','16:00:37',9,76,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(37,'Nostrum est provident aut aliquam qui magni.',72,366,'https://lorempixel.com/640/480/?59055','08:46:49',5,77,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(38,'Culpa perferendis vitae ratione rerum.',7,770,'https://lorempixel.com/640/480/?57300','20:43:49',9,78,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL),(39,'Commodi aut similique nemo consequatur autem.',74,702,'https://lorempixel.com/640/480/?71277','23:30:37',7,79,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL),(40,'Temporibus officiis nobis doloremque sint.',39,106,'https://lorempixel.com/640/480/?10009','01:12:16',9,80,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` double(8,2) NOT NULL,
  `lat` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Lueilwitz, Hoppe and Rippin','https://lorempixel.com/640/480/?17445',60.43,76.81,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(2,'Brakus, Wiegand and Abbott','https://lorempixel.com/640/480/?71580',-171.39,76.68,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(3,'O\'Reilly-Marks','https://lorempixel.com/640/480/?63904',31.64,-43.89,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(4,'Schroeder Group','https://lorempixel.com/640/480/?99906',-58.00,-49.58,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(5,'Mitchell-Lindgren','https://lorempixel.com/640/480/?28724',83.35,-70.17,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(6,'Koelpin LLC','https://lorempixel.com/640/480/?14274',86.33,3.87,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(7,'Blanda, Grady and Hansen','https://lorempixel.com/640/480/?83157',35.27,-67.66,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(8,'Ernser, Schowalter and Fahey','https://lorempixel.com/640/480/?45641',-155.24,23.99,'2020-01-18 07:15:06','2020-01-18 07:15:06',NULL),(9,'Romaguera Inc','https://lorempixel.com/640/480/?12288',81.32,16.78,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(10,'Dach LLC','https://lorempixel.com/640/480/?57522',80.50,-64.73,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(11,'Bednar, Monahan and Cassin','https://lorempixel.com/640/480/?18505',102.95,67.52,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(12,'Walker-Rosenbaum','https://lorempixel.com/640/480/?89936',128.98,-20.55,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(13,'Dare, Rogahn and Aufderhar','https://lorempixel.com/640/480/?35479',-128.70,-38.35,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(14,'Glover-Auer','https://lorempixel.com/640/480/?92446',67.97,64.34,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(15,'Runolfsson Ltd','https://lorempixel.com/640/480/?64102',94.12,42.73,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(16,'O\'Keefe-Kunde','https://lorempixel.com/640/480/?50656',-0.98,-69.64,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(17,'Fritsch PLC','https://lorempixel.com/640/480/?77493',-58.90,-75.32,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(18,'Moen-Prohaska','https://lorempixel.com/640/480/?37507',-28.39,31.19,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(19,'Turner-Harris','https://lorempixel.com/640/480/?65138',-10.93,8.43,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(20,'Quigley-Walsh','https://lorempixel.com/640/480/?56681',25.89,62.75,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(21,'Hilpert-Purdy','https://lorempixel.com/640/480/?18935',-120.04,34.85,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(22,'Gerlach, Kunze and Gutmann','https://lorempixel.com/640/480/?24011',-178.22,19.08,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(23,'Thiel PLC','https://lorempixel.com/640/480/?70662',21.62,45.22,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(24,'Jenkins Inc','https://lorempixel.com/640/480/?67271',157.73,36.00,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(25,'Russel, Keebler and Greenfelder','https://lorempixel.com/640/480/?43845',96.62,52.46,'2020-01-18 07:15:07','2020-01-18 07:15:07',NULL),(26,'Graham Ltd','https://lorempixel.com/640/480/?78729',-179.56,-79.36,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(27,'Koelpin-Conn','https://lorempixel.com/640/480/?65271',75.75,35.11,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(28,'Weimann-Jones','https://lorempixel.com/640/480/?49902',68.52,-34.11,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(29,'Towne Inc','https://lorempixel.com/640/480/?79794',95.68,-71.42,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(30,'Kihn, Zieme and Hermann','https://lorempixel.com/640/480/?36626',118.15,64.36,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(31,'Lakin Inc','https://lorempixel.com/640/480/?77181',126.06,-66.01,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(32,'Rolfson, Ryan and Metz','https://lorempixel.com/640/480/?50220',25.63,59.31,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(33,'Ward, Johnson and Lind','https://lorempixel.com/640/480/?16766',175.82,11.45,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(34,'Friesen-Ryan','https://lorempixel.com/640/480/?17413',118.26,-64.91,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(35,'Kling-Kuhn','https://lorempixel.com/640/480/?57951',-61.23,13.38,'2020-01-18 07:15:08','2020-01-18 07:15:08',NULL),(36,'Little, Shanahan and Yost','https://lorempixel.com/640/480/?72367',177.77,-47.12,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(37,'Kub-Grimes','https://lorempixel.com/640/480/?59886',-149.62,-74.03,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(38,'Dooley Ltd','https://lorempixel.com/640/480/?65719',-41.92,-48.97,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(39,'Hermiston, Klocko and Johnston','https://lorempixel.com/640/480/?96755',-7.94,37.88,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(40,'Oberbrunner-Ritchie','https://lorempixel.com/640/480/?46880',50.50,-74.80,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(41,'Gusikowski LLC','https://lorempixel.com/640/480/?53079',115.27,60.92,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(42,'Heathcote Inc','https://lorempixel.com/640/480/?95766',142.69,-38.03,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(43,'Gerhold, Schumm and Ferry','https://lorempixel.com/640/480/?94235',141.69,-3.18,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(44,'Fahey Inc','https://lorempixel.com/640/480/?56294',4.61,7.08,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(45,'Rath, Marvin and Kohler','https://lorempixel.com/640/480/?28874',-147.79,-84.22,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(46,'Olson, Gutmann and Huels','https://lorempixel.com/640/480/?60340',126.19,-63.61,'2020-01-18 07:15:09','2020-01-18 07:15:09',NULL),(47,'Howell Inc','https://lorempixel.com/640/480/?43590',4.20,-79.64,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(48,'Conroy, Schaden and Jones','https://lorempixel.com/640/480/?67008',4.14,59.87,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(49,'Grant, Kuhlman and Auer','https://lorempixel.com/640/480/?97231',-161.86,58.60,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(50,'Franecki-VonRueden','https://lorempixel.com/640/480/?57346',34.88,-7.85,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(51,'Walter LLC','https://lorempixel.com/640/480/?51353',-78.72,-57.90,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(52,'Hartmann, Kuhlman and Wehner','https://lorempixel.com/640/480/?43679',0.92,16.01,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(53,'Armstrong Inc','https://lorempixel.com/640/480/?61438',-119.05,87.77,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(54,'Hodkiewicz Inc','https://lorempixel.com/640/480/?52714',-163.30,-5.74,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(55,'Turcotte-Turcotte','https://lorempixel.com/640/480/?56602',-122.56,-3.33,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(56,'Powlowski, Ferry and Quigley','https://lorempixel.com/640/480/?51106',63.46,36.08,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(57,'Schoen-Haag','https://lorempixel.com/640/480/?19194',85.49,13.24,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(58,'Pfeffer, Mills and Rogahn','https://lorempixel.com/640/480/?41969',-86.63,-25.21,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(59,'DuBuque-McKenzie','https://lorempixel.com/640/480/?55649',103.05,14.72,'2020-01-18 07:15:10','2020-01-18 07:15:10',NULL),(60,'Johns Ltd','https://lorempixel.com/640/480/?77888',97.42,-36.81,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(61,'Bogan, Runolfsson and Bartoletti','https://lorempixel.com/640/480/?55388',169.58,72.85,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(62,'DuBuque Inc','https://lorempixel.com/640/480/?24150',-96.79,-57.25,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(63,'Reilly Ltd','https://lorempixel.com/640/480/?59250',151.07,73.38,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(64,'Gaylord, Christiansen and Mohr','https://lorempixel.com/640/480/?33996',-152.81,-88.37,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(65,'Renner LLC','https://lorempixel.com/640/480/?62308',-165.88,61.34,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(66,'Terry, Zieme and Baumbach','https://lorempixel.com/640/480/?23588',-58.16,-49.16,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(67,'Feeney, Murazik and Grady','https://lorempixel.com/640/480/?37760',-135.14,85.66,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(68,'Streich Inc','https://lorempixel.com/640/480/?25224',170.38,87.14,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(69,'Morar-Hills','https://lorempixel.com/640/480/?66677',-146.58,4.51,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(70,'Schamberger, Bogisich and Miller','https://lorempixel.com/640/480/?39607',71.75,75.86,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(71,'Fahey-Hane','https://lorempixel.com/640/480/?25778',86.27,29.31,'2020-01-18 07:15:11','2020-01-18 07:15:11',NULL),(72,'Pacocha-Heaney','https://lorempixel.com/640/480/?20675',-44.01,67.67,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(73,'Powlowski-Bauch','https://lorempixel.com/640/480/?63683',66.47,14.30,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(74,'Waelchi PLC','https://lorempixel.com/640/480/?69076',24.53,-5.53,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(75,'Berge, Cremin and Krajcik','https://lorempixel.com/640/480/?18755',91.96,-79.22,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(76,'Ondricka Inc','https://lorempixel.com/640/480/?71123',-7.56,8.57,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(77,'Gleason-Zemlak','https://lorempixel.com/640/480/?36107',31.75,18.83,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(78,'Kuphal Group','https://lorempixel.com/640/480/?12928',-152.51,45.59,'2020-01-18 07:15:12','2020-01-18 07:15:12',NULL),(79,'Adams-King','https://lorempixel.com/640/480/?64175',-37.56,-59.06,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL),(80,'Terry-Beatty','https://lorempixel.com/640/480/?76721',-35.24,-30.92,'2020-01-18 07:15:13','2020-01-18 07:15:13',NULL),(81,'Heathcote, Balistreri and Schinner','https://lorempixel.com/640/480/?84280',-56.27,-68.05,'2020-01-18 07:15:14','2020-01-18 07:15:14',NULL),(82,'Boyle and Sons','https://lorempixel.com/640/480/?10711',-160.92,62.50,'2020-01-18 07:15:14','2020-01-18 07:15:14',NULL);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tips`
--

DROP TABLE IF EXISTS `tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tips` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tips`
--

LOCK TABLES `tips` WRITE;
/*!40000 ALTER TABLE `tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Arvilla Sauer','Dr. Lazaro Mante','ambrose01@example.com','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','umlSkWlb0S','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'561699311799'),(2,'Ozella Moore','Prof. Ephraim Schiller','buckridge.daryl@example.com','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XZ3IUYU3b0','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'473229139007'),(3,'Josefa Christiansen','Wilfredo Becker','maxie51@example.net','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rr9VI9pA2X','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'956722965337'),(4,'Dr. Gladyce Botsford Jr.','Annamae Crona IV','koch.blanca@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZqsxJuLhcG','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'156866939151'),(5,'Vince Reynolds','Dr. Dante Aufderhar','ruthie30@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','JRfhwZMcik','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'470207608100'),(6,'Price Jones','Remington Brekke','brock92@example.com','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','g7QQwPabWh','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'828286035010'),(7,'Madalyn Powlowski DDS','Miss Angie Dare','marilyne09@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CIAn1epTzf','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'190324023544'),(8,'Prof. Raheem Stroman Jr.','Jackeline Effertz II','cbeer@example.net','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4GZvRe6I73','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'438407699753'),(9,'Karley Baumbach','Prof. Carissa Schmidt','langosh.sofia@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fnRQZByWen','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'219535695688'),(10,'Susanna Runolfsdottir','Mrs. Anne Turner Jr.','jerrold.casper@example.net','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','h2x7E1nHuw','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'180484345270'),(11,'Agustina Kreiger','Elyssa Ziemann V','nelle12@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','goXF5g1B07','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'517265164894'),(12,'Dallin Bayer','Prof. Ramon Kuhn PhD','susanna41@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','QHyrxRrOj0','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'775096926039'),(13,'Mrs. Lila Konopelski','Ms. Danyka Schowalter','gblock@example.net','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IuTztVNhjS','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'590270950613'),(14,'Celestino Reynolds','Mr. Rey Altenwerth PhD','ed.hammes@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6q4amqJt9x','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'656656585885'),(15,'Susana Bailey','Cecil Altenwerth','nina90@example.net','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VcUQ90iZcf','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'147496738379'),(16,'Caterina VonRueden','Prof. Daisy Dickens I','volkman.niko@example.net','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Vae1H7jnd4','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'558336743820'),(17,'Emmitt Watsica','Noble Abernathy MD','howell.providenci@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','M4BMVdBfo5','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'912967886146'),(18,'Tomas Lubowitz I','Marcelle Rolfson','isai62@example.org','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','iRinBQSWyS','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'520661176225'),(19,'Wendy Lynch','Mr. Alexys Hermann III','adriana.schimmel@example.net','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Ff2iw2dfhN','2020-01-18 07:15:13','2020-01-18 07:15:13',NULL,'107086878329'),(20,'Frankie Bogan','Cordie Grant','hackett.bo@example.com','2020-01-18 07:15:13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Nn6Fbr97Jc','2020-01-18 07:15:14','2020-01-18 07:15:14',NULL,'191800361058');
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

-- Dump completed on 2020-03-12 16:08:44
