-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: kinohd
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название города',
  `country_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `cities_country_id_fk` (`country_id`),
  CONSTRAINT `cities_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Города';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Port Stacey',18,'2018-06-04 00:14:32','2020-07-02 19:57:27'),(2,'Maeveshire',20,'2020-01-22 22:30:20','2019-04-15 08:41:33'),(3,'Beattymouth',15,'2013-02-28 00:00:17','2016-07-29 00:27:39'),(4,'Kulaschester',10,'2019-06-03 14:52:25','2020-03-09 05:47:06'),(5,'Haagview',15,'2016-07-02 10:56:26','2019-06-10 09:13:37'),(6,'New Maurineborough',5,'2020-09-08 19:05:57','2015-10-17 03:15:47'),(7,'Mariefort',17,'2019-02-28 17:35:34','2015-05-25 04:30:42'),(8,'Kirkland',12,'2012-03-19 08:50:30','2013-02-20 19:30:24'),(9,'Lake Madeline',16,'2022-01-27 13:58:53','2020-07-11 15:20:47'),(10,'Port Guiseppeport',15,'2012-03-20 02:02:39','2021-06-26 22:43:54'),(11,'Leeville',7,'2015-11-25 22:09:39','2020-06-28 13:01:43'),(12,'Kristaside',14,'2018-01-02 11:48:17','2021-04-02 05:21:36'),(13,'Lake Kavontown',4,'2020-09-18 23:21:23','2013-12-09 13:52:52'),(14,'South Dominiquefort',12,'2019-07-19 16:44:36','2012-10-20 00:27:47'),(15,'Felipaland',16,'2016-12-08 07:20:05','2017-06-24 10:26:14'),(16,'Port Murphy',12,'2020-01-26 07:15:09','2014-01-10 06:03:02'),(17,'Abbottside',19,'2021-08-16 11:26:20','2015-02-16 14:04:30'),(18,'Katelynnside',14,'2015-02-18 17:54:33','2015-12-06 11:01:04'),(19,'East Ellafurt',18,'2015-02-09 05:33:53','2020-03-15 05:49:33'),(20,'Lake Eulaton',13,'2017-05-03 20:33:36','2012-03-11 05:26:54');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текст комментария',
  `target_id` int unsigned NOT NULL COMMENT 'Ссылка на комментируемый объект',
  `target_type` enum('review','content','comment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип объекта',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `comments_user_id_fk` (`user_id`),
  CONSTRAINT `comments_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Комментарии пользователей к рецензиям и контенту';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,7,'Quod consequatur amet hic est numquam quis facere. Corrupti voluptate sapiente non sed quod itaque voluptas. Placeat voluptatem voluptas et nam eveniet nemo cumque.',14,'comment','2019-12-17 15:02:00'),(2,18,'Est autem sed ea quo sequi voluptatum. Exercitationem minus eum quidem quae dolores. Ut magni quas est omnis aut quo veritatis. Consequuntur ab a dolorum culpa aperiam ipsum. Omnis natus perspiciatis nesciunt.',19,'comment','2020-07-28 19:22:10'),(3,19,'Officia corrupti et et eum quaerat error quisquam dolores. Temporibus qui accusantium alias illum. Et voluptatem hic qui minima. Consectetur aspernatur sint consequuntur hic adipisci.',16,'review','2021-11-22 06:04:16'),(4,20,'At dignissimos dolores et ex. Consequuntur dolor qui sit totam dolorem tempora. Suscipit voluptatibus voluptatibus eius non ex asperiores. Non vero qui sunt quaerat.',12,'content','2021-02-22 21:03:45'),(5,13,'Ea expedita sint qui tempora laudantium. Magni porro id dolorem repellendus dolore modi. Fugit at voluptas earum accusamus maiores soluta ea. Iure rerum sed temporibus aliquam consequatur accusantium.',10,'review','2020-05-27 23:11:22'),(6,18,'Expedita nihil nemo aut exercitationem. Officia velit est rerum praesentium fugit optio.',7,'comment','2021-01-28 19:22:10'),(7,3,'Provident tempore optio architecto tempore esse id optio. Sequi quisquam nihil consequatur debitis a. Voluptas nihil laudantium saepe in quasi. Earum consequatur voluptatem quo aut.',8,'comment','2020-09-13 09:16:33'),(8,1,'Qui quis tempora voluptates officia. Architecto et ratione ullam recusandae qui. Exercitationem blanditiis quo est unde. Exercitationem dicta ullam necessitatibus.',18,'content','2022-03-16 15:56:54'),(9,2,'Quam dolore eos ea dolor vitae. Soluta ut cupiditate iusto totam accusamus et. Vel veritatis est quia dolorem expedita eius. Quas qui impedit fuga distinctio. Excepturi odio officia debitis dolore vel autem explicabo.',4,'comment','2021-08-04 22:12:49'),(10,13,'Et facilis voluptatem rerum quia aut. Inventore sit sed nostrum hic. Iusto molestiae sunt officiis rerum quasi quia repellendus.',13,'comment','2019-12-27 23:11:22'),(11,8,'Quia eius optio minus ea minus ut tenetur. Voluptatem repellendus minus rerum et consequatur. Modi voluptatem aut quia reiciendis repellendus pariatur. Vitae asperiores id impedit eveniet asperiores nihil aliquam quia. Et quia cupiditate et voluptas sit ducimus.',16,'review','2020-11-23 12:48:29'),(12,18,'Consequatur doloribus neque est fugiat. Quis ut distinctio dolorum et cupiditate omnis sequi. Aperiam non ullam rerum.',2,'content','2021-03-28 19:22:10'),(13,19,'Iure dolores dolor porro tenetur sed. Autem aliquam expedita sunt et temporibus quia et. Ducimus aperiam occaecati atque explicabo sed.',3,'review','2021-11-22 06:04:16'),(14,15,'Id nihil reiciendis vitae perspiciatis quia non quaerat dolor. Quam facilis ut est vel id voluptatem sint. Porro eligendi occaecati est tempore harum sit.',2,'comment','2018-09-06 19:11:28'),(15,12,'Suscipit quidem sit in dolores est et ipsam. In aspernatur provident ratione magni. Aperiam quia enim adipisci ratione. Modi maxime quae porro explicabo. Sequi porro ipsa placeat eius et deserunt rem ullam.',4,'content','2021-10-13 04:49:49'),(16,12,'Harum et unde ad sed officiis ut qui vel. Ab vel atque asperiores voluptatem sit. Exercitationem laboriosam deleniti voluptas sed corrupti aut maiores.',17,'comment','2021-10-13 04:49:49'),(17,17,'Iste harum velit a alias. Aut pariatur voluptate mollitia quo quibusdam ad illum. Tenetur fuga qui et excepturi architecto cumque.',5,'comment','2021-07-12 13:04:42'),(18,3,'Facilis ducimus aut vitae ea. Ut optio quo adipisci iste eveniet blanditiis. Ut nemo pariatur fugit molestias ipsa iusto. Sit rerum voluptatem ratione necessitatibus nulla est.',10,'comment','2020-09-13 09:16:33'),(19,17,'Tenetur qui et illo similique neque unde. Ut maiores harum vel rerum. Tempora ut odit itaque saepe sunt et. Consectetur consequuntur illo consectetur est praesentium modi nam.',8,'content','2021-07-12 13:04:42'),(20,2,'Nostrum sapiente sed quia veniam et. Sit ut aliquam maiores et dolores. Aliquid quos maxime excepturi molestias nostrum nihil. Voluptatem eligendi cumque labore dignissimos ipsa nesciunt.',19,'review','2021-08-04 22:12:49');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_types`
--

DROP TABLE IF EXISTS `content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Типы медиаконтента';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_types`
--

LOCK TABLES `content_types` WRITE;
/*!40000 ALTER TABLE `content_types` DISABLE KEYS */;
INSERT INTO `content_types` VALUES (1,'News','2020-03-17 03:18:56','2018-10-31 00:30:11'),(2,' Tests','2019-07-23 02:49:00','2017-03-09 11:21:33'),(3,' Video','2021-03-07 04:00:04','2021-02-07 21:47:35'),(4,' Projects','2019-05-27 13:37:50','2019-03-20 03:56:23'),(5,' Articles','2015-12-27 10:30:47','2017-02-10 00:03:28'),(6,' Podcasts','2013-09-19 00:28:04','2015-07-15 05:36:55');
/*!40000 ALTER TABLE `content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `content_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип медиаконтента',
  `decription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание медиаконтента',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Содержание (текст) медиаконтента',
  `movie_id` int unsigned NOT NULL COMMENT 'Ссылка на видео, которому посвящен контент',
  `mediafile_id` int unsigned NOT NULL COMMENT 'Ссылка на медиафайл',
  `author` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Автор медиа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `contents_content_type_id_fk` (`content_type_id`),
  KEY `contents_movie_id_fk` (`movie_id`),
  KEY `contents_mediafile_id_fk` (`mediafile_id`),
  CONSTRAINT `contents_content_type_id_fk` FOREIGN KEY (`content_type_id`) REFERENCES `content_types` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `contents_mediafile_id_fk` FOREIGN KEY (`mediafile_id`) REFERENCES `mediafiles` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `contents_movie_id_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `contents_chk_1` CHECK (json_valid(`author`))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Медиаконтент сайта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,3,'Sunt corporis eum nulla magnam molestiae voluptatibus quia iure.','Quasi debitis accusamus quis vero nulla dicta. Quo exercitationem et labore praesentium sit quia. Commodi id quas omnis deserunt impedit. Aut doloribus est aut sed nostrum in omnis itaque.',20,1,'{\"author\":\"Lebsack Henderson\"}','2019-04-02 00:15:35','2022-02-28 15:14:33'),(2,5,'Sint qui commodi numquam eaque optio impedit qui.','Sunt libero debitis est possimus fugiat nulla hic porro. Eaque ut quia rerum cumque. Dolores doloremque illum nisi a non quasi et sint. Sint recusandae aut quisquam non.',5,8,'{\"author\":\"Mante Abigail\"}','2021-08-04 22:12:49','2022-02-28 15:00:25'),(3,4,'Minima deserunt nisi voluptatum excepturi sed dolores laboriosam iure.','Fugiat laudantium quibusdam optio eius. Et molestias magni dolorem. Voluptatibus ipsam quidem quaerat quisquam quisquam.',16,4,'{\"author\":\"Maggio Abigail\"}','2020-09-13 09:16:33','2022-02-28 15:00:25'),(4,3,'Quo in perspiciatis non adipisci.','Explicabo suscipit voluptates minus iure. Ipsum reprehenderit et a odit earum. Aut qui laudantium impedit maxime.',15,11,'{\"author\":\"Grant Zella\"}','2018-08-29 18:58:35','2022-02-28 15:00:25'),(5,4,'Hic recusandae saepe ad.','Voluptates sed possimus consequatur esse possimus et veritatis voluptate. Maxime accusantium dicta non quo. Ut cupiditate ratione hic aperiam. Deserunt expedita esse in dolorem. Laborum minima ullam molestiae ut sapiente aliquam.',19,15,'{\"author\":\"Carter Oma\"}','2021-12-11 15:44:53','2022-02-28 15:00:25'),(6,5,'Architecto est iusto repudiandae.','Tempore omnis sed aut. Quidem itaque delectus consequatur unde explicabo accusamus possimus. Soluta quisquam qui recusandae magnam.',18,12,'{\"author\":\"Carter Orlo\"}','2014-02-02 00:17:26','2022-02-28 15:00:25'),(7,1,'Cupiditate voluptatem et atque et ipsum qui.','Quisquam nihil veniam labore in. Et sint assumenda porro distinctio. Cumque qui reiciendis quidem dolores quia ratione. Nam dolorem quia quas.',16,16,'{\"author\":\"Reilly Oma\"}','2019-12-17 15:02:00','2022-02-28 15:00:25'),(8,3,'Ea vero odit necessitatibus quo.','Rerum dolorum repellat est quia rem. In alias saepe occaecati non placeat nihil qui. Quibusdam id dolores esse eaque non. Dolor fugiat dolores ratione in aut possimus.',11,20,'{\"author\":\"Mante Harley\"}','2020-11-23 12:48:29','2022-02-28 15:00:25'),(9,5,'Aspernatur aut explicabo mollitia aut.','Minus velit autem repellat sint tempore qui non. Aut quidem atque vero est modi. Ut blanditiis voluptatum dolores sed dolorum laboriosam voluptatum.',12,19,'{\"author\":\"Abshire Harley\"}','2022-01-10 01:45:39','2022-02-28 15:00:25'),(10,6,'Eius totam officia officiis est perspiciatis suscipit non.','Minima aut autem est. Quod autem commodi tenetur sint itaque error sit. Omnis inventore quo iste qui nihil illum.',17,15,'{\"author\":\"Lebsack Harley\"}','2019-11-25 07:22:05','2022-02-28 15:14:33'),(11,4,'Eum eum ut quas.','Maiores incidunt iusto minima autem quis. Temporibus aspernatur esse sequi laboriosam totam dolor. Natus ea omnis nobis dolorum fuga officia consequuntur. Odio laboriosam et alias explicabo quidem animi distinctio.',14,10,'{\"author\":\"Lebsack Leanna\"}','2021-09-27 07:44:36','2022-02-28 15:00:25'),(12,1,'Non iste eius omnis aut et possimus.','Quis corrupti molestias magni excepturi libero esse. Porro omnis incidunt facilis deleniti illo reiciendis architecto. Error exercitationem praesentium dolor quis qui. Adipisci repellendus facilis nam dolores pariatur quaerat ex dolorem.',4,8,'{\"author\":\"King Karson\"}','2021-10-13 04:49:49','2022-02-28 15:00:25'),(13,4,'Dolor et explicabo omnis impedit et eius.','Sint neque numquam illo ea est voluptas non. Porro veritatis officia eum rem. Aut vitae laudantium placeat dolor ut impedit. Repudiandae mollitia dolorem dignissimos eum eveniet.',4,14,'{\"author\":\"Paucek Dina\"}','2019-07-29 07:46:28','2022-02-28 15:00:25'),(14,4,'Dignissimos tenetur dolores quod voluptatem.','Qui velit aut et eos soluta voluptates perspiciatis. Nihil aut consectetur et sunt. Reprehenderit ad perspiciatis repudiandae consequuntur est. Cumque accusantium explicabo amet odio voluptatibus quaerat maxime unde.',10,20,'{\"author\":\"Mante Dina\"}','2021-10-15 22:35:56','2022-02-28 15:00:25'),(15,4,'Est dolorem labore quam.','Et quae quod voluptatum voluptate sed eligendi autem. Eaque ut saepe maiores doloremque vel laborum in. Eum quod et veniam laboriosam.',19,6,'{\"author\":\"Turner Dina\"}','2021-01-29 22:42:35','2022-02-28 15:14:33'),(16,3,'Qui cupiditate assumenda fugiat velit eligendi consectetur.','Ullam laborum et et perferendis. Molestiae nulla reprehenderit neque qui rerum est. Quod ratione animi et eum similique dolore occaecati. Odio minima nesciunt cum ut.',8,6,'{\"author\":\"Mante Ramona\"}','2021-08-01 16:44:45','2022-02-28 15:00:25'),(17,1,'Laborum vel quo non quibusdam ea ipsa quia.','Nesciunt voluptatum veniam explicabo et. Dolore ut velit sed quis beatae temporibus consequatur. Et voluptas nostrum ratione dignissimos. Officia deserunt necessitatibus et ullam neque dolore quis.',15,9,'{\"author\":\"Mante Leanna\"}','2021-07-12 13:04:42','2022-02-28 15:00:25'),(18,4,'Aut amet doloremque sed natus totam pariatur sunt.','Est non temporibus tempore eligendi. Aspernatur non repellendus alias et qui. Rem magnam natus qui rerum. Quae sed ipsam deserunt molestias.',1,15,'{\"author\":\"Turner Ethelyn\"}','2017-12-27 00:29:39','2022-02-28 15:14:33'),(19,2,'Ad tenetur cupiditate cupiditate consequuntur.','Nulla aliquid quia impedit quo sunt. Qui dolores optio officia qui maxime. Esse qui et quisquam natus nobis ut quia. Voluptatem saepe facere occaecati voluptatem repellat ut.',17,4,'{\"author\":\"Adams Ethelyn\"}','2021-11-22 06:04:16','2022-02-28 15:00:25'),(20,2,'Iste quis cum quia doloribus.','Magnam tempora dolorem vel nulla qui. Iure et reiciendis error amet eligendi. Consequatur voluptatem harum corporis exercitationem qui velit aut vero. Aut ad sit quasi et natus aperiam eligendi.',14,12,'{\"author\":\"Collins Harley\"}','2021-02-22 21:03:45','2022-02-28 15:00:25');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название страны',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Страны';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Lithuania','2020-10-06 02:55:26','2016-02-29 19:39:46'),(2,'Zambia','2013-11-19 04:44:35','2015-05-13 06:08:37'),(3,'Holy See (Vatican City State)','2012-04-22 21:45:59','2020-06-24 03:00:21'),(4,'Guinea','2019-06-09 14:31:53','2013-04-07 12:37:18'),(5,'Samoa','2016-09-20 06:13:46','2017-02-11 14:24:14'),(6,'Guam','2020-10-27 20:45:57','2021-08-31 18:21:10'),(7,'Argentina','2017-05-13 13:12:28','2012-12-08 21:46:55'),(8,'Mauritania','2021-04-18 04:53:48','2018-05-20 19:44:12'),(9,'Jersey','2016-12-20 17:35:40','2020-07-03 05:14:30'),(10,'Morocco','2012-03-12 13:05:32','2020-03-07 18:38:06'),(11,'Swaziland','2014-04-15 00:18:34','2015-08-20 10:21:39'),(12,'Anguilla','2016-09-28 05:44:08','2020-08-04 04:40:29'),(13,'Norfolk Island','2020-08-22 07:32:11','2018-12-17 18:40:28'),(14,'Ethiopia','2019-10-19 12:52:23','2012-11-19 19:13:03'),(15,'Mongolia','2012-06-02 15:11:21','2021-09-05 04:34:43'),(16,'Thailand','2022-01-27 23:42:13','2017-10-18 20:19:48'),(17,'American Samoa','2012-10-06 12:40:46','2017-08-22 10:50:01'),(18,'Zimbabwe','2015-01-22 14:21:44','2012-04-29 19:16:18'),(19,'Bahrain','2017-05-25 14:28:58','2018-06-15 04:13:16'),(20,'Israel','2019-10-08 23:18:06','2021-06-29 11:12:20');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `friendship_status_id` int unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `rejected_at` datetime DEFAULT NULL COMMENT 'Время удаления из друзей',
  `rejected_by_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ',
  KEY `friendship_friend_id_fk` (`friend_id`),
  KEY `friendship_friendship_status_id_fk` (`friendship_status_id`),
  CONSTRAINT `friendship_friend_id_fk` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `friendship_friendship_status_id_fk` FOREIGN KEY (`friendship_status_id`) REFERENCES `friendship_statuses` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `friendship_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (4,14,1,'2018-10-21 17:57:02',NULL,NULL,'2017-07-31 12:28:20','2022-02-28 12:54:59'),(5,12,2,'2018-09-29 07:20:45',NULL,NULL,'2015-05-02 04:22:54','2022-02-28 12:40:07'),(5,14,3,'2019-02-21 17:57:02','2022-02-28 12:25:29',5,'2022-01-31 17:20:13','2022-02-28 12:56:13'),(5,15,1,'2021-08-14 00:24:16',NULL,NULL,'2018-04-30 14:55:35','2022-02-28 12:40:07'),(6,3,3,'2016-09-27 14:16:20','2022-02-28 12:24:25',3,'2021-08-08 07:55:37','2022-02-28 12:48:13'),(6,11,2,'2021-04-19 18:42:32',NULL,NULL,'2013-06-15 18:43:32','2022-02-28 12:56:39'),(6,14,2,'2018-07-21 17:57:02',NULL,NULL,'2012-05-28 12:31:50','2022-02-28 12:57:00'),(7,13,2,'2019-11-25 23:11:22',NULL,NULL,'2020-10-19 14:43:38','2022-02-28 12:57:25'),(9,17,2,'2019-05-26 19:46:49',NULL,NULL,'2020-08-10 01:17:43','2022-02-28 12:57:45'),(10,5,2,'2021-04-08 11:55:25',NULL,NULL,'2013-06-15 12:00:37','2022-02-28 12:40:07'),(10,6,1,'2016-09-20 19:22:35',NULL,NULL,'2014-05-11 18:20:02','2022-02-28 12:40:07'),(12,11,3,'2020-12-29 14:06:55','2022-02-28 12:35:30',12,'2017-02-18 07:20:28','2022-02-28 12:35:38'),(12,20,1,'2015-07-18 22:06:43',NULL,NULL,'2020-05-06 22:53:25','2022-02-28 12:48:55'),(13,8,2,'2021-05-26 23:52:35',NULL,NULL,'2014-03-15 20:55:17','2022-02-28 12:40:07'),(14,17,3,'2021-05-07 20:20:07','2022-02-28 12:35:30',17,'2014-01-22 21:28:29','2022-02-28 12:35:40'),(15,1,1,'2022-07-14 15:56:54',NULL,NULL,'2016-10-30 01:48:53','2022-02-28 12:58:31'),(15,16,1,'2018-08-04 19:11:28',NULL,NULL,'2018-04-19 22:22:14','2022-02-28 12:52:23'),(15,20,3,'2019-01-04 19:11:28','2022-02-28 12:35:30',15,'2021-07-20 22:40:49','2022-02-28 12:52:53'),(17,1,2,'2021-12-14 15:56:54',NULL,NULL,'2018-06-08 19:46:23','2022-02-28 12:58:55'),(17,15,3,'2019-07-26 19:46:49','2022-02-28 12:35:30',15,'2020-04-21 00:00:12','2022-02-28 12:53:18');
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship_statuses`
--

DROP TABLE IF EXISTS `friendship_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статусы дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_statuses`
--

LOCK TABLES `friendship_statuses` WRITE;
/*!40000 ALTER TABLE `friendship_statuses` DISABLE KEYS */;
INSERT INTO `friendship_statuses` VALUES (1,' Confirmed','2013-05-01 01:23:43','2014-07-28 10:50:00'),(2,'Requested','2018-06-07 21:07:19','2016-06-13 10:39:03'),(3,' Rejected','2019-09-22 03:47:05','2014-09-09 05:17:36');
/*!40000 ALTER TABLE `friendship_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` enum('Comedy','Action','Melodrama','Crime','Thriller','Horror','Adventure','Drama','Fantastic') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название жанра',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Жанры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fantastic','2021-07-27 07:29:16'),(2,'Melodrama','2020-02-22 11:40:32'),(3,'Adventure','2014-01-27 08:16:13'),(4,'Action','2016-12-13 20:15:06'),(5,'Drama','2013-05-07 23:24:28'),(6,'Crime','2021-08-13 17:58:27'),(7,'Comedy','2014-03-18 21:58:06'),(8,'Thriller','2014-04-22 14:59:29'),(9,'Horror','2012-08-20 22:54:35');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_views`
--

DROP TABLE IF EXISTS `history_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_views` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `movie_id` int unsigned NOT NULL COMMENT 'Ссылка на видео',
  `movie_status` enum('VIEWED','DELAYED','NOT INTERESTED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Пометка видео пользователем',
  `movie_score` enum('NULL','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Оценка пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`movie_id`,`user_id`) COMMENT 'Составной первичный ключ',
  KEY `history_views_user_id_fk` (`user_id`),
  CONSTRAINT `history_views_movie_id_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `history_views_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='История просмотров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_views`
--

LOCK TABLES `history_views` WRITE;
/*!40000 ALTER TABLE `history_views` DISABLE KEYS */;
INSERT INTO `history_views` VALUES (2,2,'VIEWED','8','2021-08-04 22:12:49','2022-02-28 15:42:15'),(17,2,'NOT INTERESTED','1','2021-07-12 13:04:42','2022-02-28 15:42:15'),(4,3,'NOT INTERESTED','2','2019-03-18 12:18:57','2022-02-28 15:55:46'),(6,5,'DELAYED',NULL,'2020-12-30 13:33:05','2022-02-28 15:55:46'),(12,5,'VIEWED','8','2021-10-13 04:49:49','2022-02-28 15:42:15'),(3,6,'DELAYED',NULL,'2020-09-13 09:16:33','2022-02-28 15:42:15'),(6,7,'DELAYED',NULL,'2018-01-23 02:37:51','2022-02-28 15:55:46'),(7,7,'VIEWED','5','2018-04-23 02:37:51','2022-02-28 15:55:46'),(9,8,'VIEWED','5','2022-01-10 01:45:39','2022-02-28 15:42:15'),(16,8,'VIEWED','7','2021-08-01 16:44:45','2022-02-28 15:42:15'),(17,9,'NOT INTERESTED','3','2021-07-12 13:04:42','2022-02-28 15:42:15'),(7,10,'NOT INTERESTED','3','2019-12-17 15:02:00','2022-02-28 15:42:15'),(3,11,'DELAYED',NULL,'2020-09-13 09:16:33','2022-02-28 15:42:15'),(1,15,'VIEWED','7','2022-09-16 15:56:54','2022-02-28 15:52:57'),(2,18,'NOT INTERESTED','1','2021-08-04 22:12:49','2022-02-28 15:42:15'),(19,18,'VIEWED','8','2021-11-22 06:04:16','2022-02-28 15:42:15'),(4,19,'DELAYED',NULL,'2020-11-29 22:42:35','2022-02-28 15:55:46'),(7,19,'VIEWED','5','2021-02-28 22:42:35','2022-02-28 15:55:46'),(12,19,'VIEWED','5','2021-10-13 04:49:49','2022-02-28 15:42:15'),(19,20,'VIEWED','6','2021-11-22 06:04:16','2022-02-28 15:42:15');
/*!40000 ALTER TABLE `history_views` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `age_req_valid` BEFORE INSERT ON `history_views` FOR EACH ROW BEGIN
  IF (SELECT age_requirement FROM movies WHERE movies.id = NEW.movie_id) > (SELECT (TIMESTAMPDIFF(YEAR, birthday, NOW())) FROM profiles WHERE profiles.user_id = NEW.user_id)
  THEN
    SIGNAL SQLSTATE "45000"
    SET MESSAGE_TEXT = "Error! You did not rich the age requirement!";
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `like_value` tinyint NOT NULL COMMENT 'Значение лайк/дизлайк',
  `target_id` int unsigned NOT NULL COMMENT 'Ссылка на цель лайка/дизлайка',
  `target_type` enum('review','content','comment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип цели',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `likes_user_id_fk` (`user_id`),
  CONSTRAINT `likes_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Лайки/дизлайки пользователей к рецензиям, комментариям и контенту';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,17,-1,20,'comment','2021-08-09 22:12:49'),(2,9,-1,4,'content','2018-09-04 18:58:35'),(3,5,-1,17,'comment','2021-08-06 13:04:42'),(4,1,-1,1,'content','2019-04-14 00:15:35'),(5,4,1,3,'review','2019-09-13 10:58:59'),(6,19,-1,13,'content','2019-08-12 07:46:28'),(7,5,1,12,'content','2021-10-14 04:49:49'),(8,15,-1,15,'comment','2021-11-03 04:49:49'),(9,8,-1,2,'review','2017-09-12 16:33:35'),(10,6,-1,12,'review','2020-11-24 05:42:35'),(11,18,-1,20,'content','2021-03-18 21:03:45'),(12,20,1,2,'content','2021-08-28 22:12:49'),(13,4,1,13,'comment','2021-12-19 06:04:16'),(15,13,1,9,'content','2022-01-30 01:45:39'),(16,15,-1,11,'comment','2020-12-06 12:48:29'),(17,13,1,18,'content','2018-01-23 00:29:39'),(18,9,-1,16,'review','2012-05-27 06:09:45'),(19,19,-1,3,'content','2020-09-29 09:16:33'),(20,5,-1,9,'comment','2021-08-19 22:12:49');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `likes_targets`
--

DROP TABLE IF EXISTS `likes_targets`;
/*!50001 DROP VIEW IF EXISTS `likes_targets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `likes_targets` AS SELECT 
 1 AS `content_type`,
 1 AS `description`,
 1 AS `body`,
 1 AS `score`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mediafiles`
--

DROP TABLE IF EXISTS `mediafiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediafiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `mediafile_type` enum('trailer','teaser','video','photo','audio') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Тип медиафайла',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Путь к медиафайлу',
  `size` int NOT NULL COMMENT 'Размер файла',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediafiles`
--

LOCK TABLES `mediafiles` WRITE;
/*!40000 ALTER TABLE `mediafiles` DISABLE KEYS */;
INSERT INTO `mediafiles` VALUES (1,'video','http://www.kinohd.box.ru/files/quod.mp3',1465884322,'2019-09-01 12:27:57','2022-02-28 20:35:11'),(2,'photo','http://www.kinohd.box.ru/files/cupiditate.mp3',1519884478,'2016-05-15 20:42:25','2022-02-28 20:35:11'),(3,'video','http://www.kinohd.box.ru/files/cumque.mp3',2147483647,'2015-07-02 09:43:11','2022-02-28 20:35:11'),(4,'video','http://www.kinohd.box.ru/files/eos.png',1034373934,'2019-06-04 12:17:11','2022-02-28 20:35:11'),(5,'trailer','http://www.kinohd.box.ru/files/accusantium.mp3',2147483647,'2017-01-13 07:20:21','2022-02-28 20:35:11'),(6,'photo','http://www.kinohd.box.ru/files/quibusdam.jpeg',553085869,'2020-09-01 11:50:44','2022-02-28 20:35:11'),(7,'photo','http://www.kinohd.box.ru/files/corporis.mp3',1174178504,'2016-06-13 11:00:05','2022-02-28 20:35:11'),(8,'photo','http://www.kinohd.box.ru/files/quae.mp4',1572986558,'2021-11-22 08:13:27','2022-02-28 20:35:11'),(9,'photo','http://www.kinohd.box.ru/files/qui.mp3',1393012043,'2016-02-20 17:19:27','2022-02-28 20:35:11'),(10,'trailer','http://www.kinohd.box.ru/files/consequatur.jpeg',2035154633,'2015-12-14 22:11:48','2022-02-28 20:35:11'),(11,'photo','http://www.kinohd.box.ru/files/praesentium.avi',2147483647,'2021-02-01 15:29:00','2022-02-28 20:35:11'),(12,'photo','http://www.kinohd.box.ru/files/omnis.mp3',915743059,'2018-05-21 23:24:00','2022-02-28 20:35:11'),(13,'teaser','http://www.kinohd.box.ru/files/dolorem.jpeg',350223984,'2019-07-11 11:25:24','2022-02-28 20:35:11'),(14,'audio','http://www.kinohd.box.ru/files/praesentium.mp4',145393699,'2013-07-10 21:02:31','2022-02-28 20:35:11'),(15,'audio','http://www.kinohd.box.ru/files/et.avi',41729481,'2014-10-19 01:32:45','2022-02-28 20:35:11'),(16,'photo','http://www.kinohd.box.ru/files/quo.jpeg',1364528524,'2021-01-27 18:05:44','2022-02-28 20:35:11'),(17,'photo','http://www.kinohd.box.ru/files/soluta.mp3',1595808550,'2018-06-27 01:20:14','2022-02-28 20:35:11'),(18,'photo','http://www.kinohd.box.ru/files/quos.mp3',500415070,'2013-08-03 17:48:52','2022-02-28 20:35:11'),(19,'video','http://www.kinohd.box.ru/files/aut.mp3',2147483647,'2015-12-22 16:32:27','2022-02-28 20:35:11'),(20,'teaser','http://www.kinohd.box.ru/files/fugiat.mp3',283162577,'2016-09-17 00:56:33','2022-02-28 20:35:11');
/*!40000 ALTER TABLE `mediafiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediafiles_contents_movies`
--

DROP TABLE IF EXISTS `mediafiles_contents_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediafiles_contents_movies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `mediafile_id` int unsigned NOT NULL COMMENT 'Ссылка на медиафайл',
  `object_id` int unsigned NOT NULL COMMENT 'Ссылка на связанный объект',
  `object_type` enum('content','movie') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип объекта',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `mediafiles_contents_movies_mediafile_id_fk` (`mediafile_id`),
  CONSTRAINT `mediafiles_contents_movies_mediafile_id_fk` FOREIGN KEY (`mediafile_id`) REFERENCES `mediafiles` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Связь между медиафайлами с контентом и видео';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediafiles_contents_movies`
--

LOCK TABLES `mediafiles_contents_movies` WRITE;
/*!40000 ALTER TABLE `mediafiles_contents_movies` DISABLE KEYS */;
INSERT INTO `mediafiles_contents_movies` VALUES (1,7,6,'movie','2013-12-01 23:03:25','2022-02-28 20:59:43'),(2,17,4,'movie','2018-04-11 14:53:59','2022-02-28 20:59:43'),(3,13,20,'movie','2019-01-02 00:15:35','2022-02-28 20:59:43'),(4,2,3,'movie','2018-12-18 12:18:57','2022-02-28 20:59:43'),(5,16,20,'movie','2019-01-02 00:15:35','2022-02-28 20:59:43'),(6,11,10,'content','2019-11-25 07:22:05','2022-02-28 20:59:41'),(7,11,8,'content','2020-11-23 12:48:29','2022-02-28 20:59:41'),(8,19,1,'movie','2017-03-27 00:29:39','2022-02-28 20:59:43'),(9,2,4,'content','2018-08-29 18:58:35','2022-02-28 20:59:41'),(10,15,9,'movie','2016-11-25 00:01:20','2022-02-28 20:59:43'),(11,6,18,'content','2017-12-27 00:29:39','2022-02-28 20:59:41'),(12,7,18,'content','2017-12-27 00:29:39','2022-02-28 20:59:41'),(13,2,20,'movie','2019-01-02 00:15:35','2022-02-28 20:59:43'),(14,3,4,'content','2018-08-29 18:58:35','2022-02-28 20:59:41'),(15,8,17,'movie','2019-01-25 07:22:05','2022-02-28 21:00:40'),(16,18,18,'movie','2012-07-14 13:45:46','2022-02-28 20:59:43'),(17,1,6,'content','2014-02-02 00:17:26','2022-02-28 21:00:37'),(18,16,20,'content','2021-02-22 21:03:45','2022-02-28 20:59:41'),(19,20,7,'movie','2017-08-23 02:37:51','2022-02-28 20:59:43'),(20,15,8,'movie','2019-08-14 15:58:59','2022-02-28 20:59:43');
/*!40000 ALTER TABLE `mediafiles_contents_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id_fk` (`from_user_id`),
  KEY `messages_to_user_id_fk` (`to_user_id`),
  CONSTRAINT `messages_from_user_id_fk` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_to_user_id_fk` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,20,4,'Nihil ducimus officiis a ut maxime totam non. Necessitatibus quae iure odio laudantium. Laudantium non quisquam sit et laboriosam aut. Provident blanditiis et ut reprehenderit dignissimos magni ducimus.',1,'2012-10-24 23:34:58'),(2,10,18,'Id et eligendi labore amet architecto. Dolor delectus provident et ab.',0,'2020-08-26 19:22:10'),(3,1,4,'Deleniti ut est perspiciatis. Ad ut commodi facilis ipsa aut dolorum. Autem at porro et sequi culpa.',1,'2021-11-14 15:56:54'),(4,2,10,'Cum voluptatibus nesciunt cum a dolorem ut perferendis. Optio ut sint facere voluptas corporis voluptate. Quam ratione nihil non perspiciatis autem quod amet exercitationem. Aut sapiente doloribus recusandae velit est et.',0,'2021-07-11 21:06:19'),(5,19,15,'Perferendis pariatur nihil atque ut incidunt laudantium praesentium. Quibusdam ipsam animi eos. Voluptate quasi voluptatibus ratione eos voluptatem quibusdam.',0,'2019-05-04 19:11:28'),(6,19,12,'Consectetur neque a quod illum accusamus ducimus nulla. Aut sunt odit quia quas rem minus. Alias rerum corporis nihil.',0,'2016-06-08 23:12:04'),(7,10,17,'Voluptatum modi vel sed. Voluptate quam unde eligendi vitae quibusdam. Ipsa quo quia nobis est sed ipsum.',0,'2020-01-26 19:46:49'),(8,7,3,'Sint similique consequatur voluptatem ipsum molestiae. Est repellat totam inventore nam. Asperiores eius quae rem corporis. Quisquam dolores reprehenderit nihil quas occaecati iusto velit.',1,'2014-04-24 13:37:25'),(9,11,3,'Dolor qui soluta quasi ut nulla itaque et. Ut quos eveniet iste est dolorum aspernatur. Quia dolores tempora adipisci. Qui velit magni labore delectus rerum laudantium. Doloremque unde voluptas deserunt.',1,'2021-04-19 18:42:32'),(10,13,8,'Excepturi dicta ut corporis ex. Minus accusantium eaque dolorum ad. Quos aut eveniet et ut adipisci hic.',1,'2020-08-15 20:34:34'),(11,6,7,'Voluptatum nesciunt vel excepturi dolor rerum ipsum animi. Consequatur optio corrupti commodi perferendis neque voluptatem aspernatur et. Soluta fugit earum itaque itaque et. Aut deleniti perspiciatis recusandae omnis veritatis.',1,'2016-12-27 14:16:20'),(12,3,11,'Explicabo eos alias tempora aspernatur et eum fugit. Enim nulla dolor vel excepturi quas dignissimos.',1,'2021-02-19 18:42:32'),(13,17,5,'Porro ipsum voluptate ad accusantium deserunt. Molestiae impedit sed ullam beatae. Temporibus vel omnis recusandae explicabo et.',0,'2019-09-26 19:46:49'),(14,15,20,'Maiores quia ipsam qui est totam fugit sint cumque. Et inventore facere porro aut. Tenetur est aut voluptatibus. Et sint eaque quidem voluptatem error ab expedita.',1,'2019-05-04 19:11:28'),(15,10,2,'Et illum iste optio voluptatem sit et. Quos eum deserunt nobis quia numquam quo omnis eligendi. Possimus nisi quaerat aut vero molestias facilis.',1,'2022-02-11 21:06:19'),(16,12,19,'Et qui qui iste praesentium ducimus. Aspernatur quia quia ut magnam dolorem voluptatem vel aut. Est quos qui impedit reprehenderit non commodi sit.',0,'2016-10-08 23:12:04'),(17,13,16,'Maxime sit et qui eos nulla minus. Doloremque illo occaecati similique ut sit facilis iusto. Iusto et excepturi ut enim. Deleniti id dolorem ullam quos.',0,'2020-07-25 23:11:22'),(18,6,4,'Quis eligendi fuga architecto beatae modi. Cupiditate voluptatem molestiae aut aut corporis odio.',0,'2016-08-27 14:16:20'),(19,5,13,'Nam similique nam autem est unde repellat totam neque. Et harum rerum dolores consequatur inventore. Quia et nostrum libero adipisci tempore ipsum quis. Iure vel sit voluptas velit et. Vero optio labore dolor aspernatur.',0,'2015-07-30 00:21:10'),(20,18,4,'Non atque ad et voluptatibus repellendus numquam consequatur et. Est repudiandae odit ipsam nam. Aspernatur explicabo veritatis qui asperiores ex officia. Et tempore culpa quod nostrum aut ab.',1,'2021-03-26 19:22:10');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `moviename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название видео',
  `moviedesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'О чем видео',
  `plot` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Краткое описание сюжета',
  `genre_id` int unsigned NOT NULL COMMENT 'Ссылка на жанр',
  `premiere` date DEFAULT NULL COMMENT 'Дата премьеры',
  `age_requirement` enum('0+','6+','12+','16+','18+') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `movie_status` enum('PAID','FREE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Статус видео платный/бесплатный',
  `moviefile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Путь к видеофайлу',
  `moviesize` int NOT NULL COMMENT 'Размер видеофайла',
  `movie_type` enum('film','serial') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип объекта',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `movies_genre_id_fk` (`genre_id`),
  KEY `movies_country_id_fk` (`country_id`),
  CONSTRAINT `movies_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `movies_genre_id_fk` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Видео';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'voluptatum','Veniam voluptatum molestiae ea illo.','Quia sapiente omnis ut quo debitis dolores earum sapiente. Omnis sed non sint voluptatem.',6,'2017-04-12','12+',6,'FREE','http://www.kinohd.box.ru/films/voluptatum.mpeg',2147483647,'serial','2017-03-27 00:29:39','2022-02-28 14:16:18'),(2,'magnam','Repellendus nobis qui maiores repudiandae soluta sed officiis.','Numquam fuga eos cupiditate natus. Aperiam molestiae sit dolorem qui id praesentium. Reiciendis rerum consequatur non voluptatem ducimus. Dolorem in repellat tempore molestiae itaque eum dolore.',5,'2017-10-02','12+',16,'PAID','http://www.kinohd.box.ru/films/magnam.avi',2147483647,'film','2017-09-08 07:33:35','2022-02-28 14:16:18'),(3,'minima','Aut aut et perspiciatis asperiores aut et nostrum.','Deserunt dolor quia doloremque dolores sit alias. Quia minima debitis aut quaerat non qui quis. Quisquam error sed qui laudantium. Maxime asperiores optio dolor.',1,'2018-12-29','18+',3,'FREE','http://www.kinohd.box.ru/films/minima.avi',2147483647,'film','2018-12-18 12:18:57','2022-02-28 14:16:18'),(4,'sapiente','Unde itaque voluptatibus et fugit enim vitae aliquid quidem.','Nihil vel excepturi similique qui nulla aut. Provident non et sed alias.',4,'2018-04-23','6+',19,'FREE','http://www.kinohd.box.ru/films/sapiente.avi',2147483647,'serial','2018-04-11 14:53:59','2022-02-28 14:16:18'),(5,'et','Consectetur commodi architecto minus nulla.','Dolorum optio eius aut exercitationem sed culpa ea. Minima fugiat et quibusdam corrupti et. Fugit in nemo assumenda sit. Mollitia corporis iusto ratione nobis porro sed. Dolor et magnam occaecati nisi tempora.',3,'2020-08-25','18+',7,'PAID','http://www.kinohd.box.ru/films/et.hdv',2147483647,'film','2020-07-30 13:33:05','2022-02-28 14:16:18'),(6,'nemo','Voluptatem qui vero libero.','Nobis velit est sed doloremque dolore rerum. Iusto sint eum eum facere. Quibusdam at rerum ducimus. Deserunt eveniet eos consequatur aliquam ipsum.',6,'2013-12-05','16+',7,'FREE','http://www.kinohd.box.ru/films/nemo.avchd',2147483647,'film','2013-12-01 23:03:25','2022-02-28 14:16:18'),(7,'autem','Blanditiis voluptatem rerum omnis mollitia quas inventore.','Eos sed velit aliquid aut praesentium porro. Consequatur rerum et et quis autem incidunt. Eaque cupiditate cupiditate ipsam eveniet voluptate magnam iusto.',2,'2017-09-21','18+',9,'PAID','http://www.kinohd.box.ru/films/autem.avchd',2147483647,'serial','2017-08-23 02:37:51','2022-02-28 14:16:18'),(8,'sed','Temporibus ad sequi nobis.','Deserunt eos illo expedita officiis est. Rerum illum et repudiandae dolorem et deserunt. Rerum quia eos cumque ea similique deleniti id.',7,'2019-08-30','12+',15,'PAID','http://www.kinohd.box.ru/films/sed.avchd',2147483647,'serial','2019-08-14 15:58:59','2022-02-28 14:16:18'),(9,'harum','Magnam perspiciatis doloribus dolores adipisci laborum.','Id aut beatae aut dolorem iure. Accusamus voluptatem sunt quidem officia delectus culpa. Dolores sed quibusdam dolor voluptas.',8,'2016-12-15','0+',14,'PAID','http://www.kinohd.box.ru/films/harum.hdv',2147483647,'serial','2016-11-25 00:01:20','2022-02-28 14:16:18'),(10,'saepe','Numquam mollitia quam consequatur.','Neque sapiente aperiam non et. Cum ullam et doloribus impedit qui impedit asperiores. Eos ut iure qui dolor amet. Sed magni fuga qui sit maxime tempore aut.',5,'2012-05-30','12+',10,'PAID','http://www.kinohd.box.ru/films/saepe.mpeg',2147483647,'film','2012-05-06 00:09:45','2022-02-28 14:16:18'),(11,'exercitationem','Odio repudiandae at unde sed officiis modi.','Et veniam veritatis rerum molestiae est beatae. Magni est fuga quis consequatur unde dolorem. Non sit perspiciatis exercitationem sint omnis incidunt facilis. Omnis reiciendis sint possimus autem.',2,'2018-04-03','18+',6,'PAID','http://www.kinohd.box.ru/films/exercitationem.hdv',2147483647,'serial','2018-03-04 00:44:42','2022-02-28 14:16:18'),(12,'ut','Laudantium molestiae vero est quas.','Expedita labore voluptatibus ex ullam ipsum. Fugit corporis voluptatum et magni rerum quisquam iusto odio. Quod repellendus laborum soluta incidunt.',8,'2021-08-07','6+',10,'FREE','http://www.kinohd.box.ru/films/ut.avchd',2147483647,'film','2021-07-20 03:14:14','2022-02-28 14:16:18'),(13,'rem','Ab est rerum rerum explicabo facere quo.','Et nesciunt ratione libero et iste. A voluptates sit accusamus expedita id. Et molestiae provident quod reiciendis nulla.',7,'2018-12-03','6+',11,'PAID','http://www.kinohd.box.ru/films/rem.avchd',2147483647,'serial','2018-11-03 13:57:04','2022-02-28 14:16:18'),(14,'fugiat','Tempora minima ex laboriosam aut dolorem qui deleniti.','Ratione quam rerum aspernatur aut at eaque sunt. Repudiandae perspiciatis ut et atque expedita provident repudiandae veniam. Esse velit distinctio occaecati recusandae.',8,'2012-06-20','12+',16,'PAID','http://www.kinohd.box.ru/films/fugiat.hdv',2147483647,'serial','2012-06-16 12:02:37','2022-02-28 14:16:18'),(15,'fuga','Cum dolores exercitationem quis itaque.','Praesentium et neque iusto dolor. Nihil laboriosam quas quia maxime. Suscipit veritatis natus et at.',6,'2014-03-21','0+',17,'FREE','http://www.kinohd.box.ru/films/fuga.avchd',2147483647,'serial','2014-03-01 18:21:53','2022-02-28 14:16:18'),(16,'velit','Ab magni natus voluptas qui.','Quia et exercitationem hic optio aspernatur. Consequatur consequatur commodi eaque voluptas sed laboriosam repellendus. Qui est nesciunt nesciunt eum qui.',6,'2018-06-17','18+',14,'FREE','http://www.kinohd.box.ru/films/velit.avchd',2147483647,'film','2018-05-22 07:41:33','2022-02-28 14:16:18'),(17,'unde','Voluptas ipsa ducimus accusantium omnis ducimus quaerat sunt.','Ut quaerat id dolores corrupti ut odio hic. Nihil enim aperiam necessitatibus maxime fugiat perferendis voluptas. Rerum dolor ab voluptatibus et.',8,'2019-02-05','16+',18,'PAID','http://www.kinohd.box.ru/films/unde.mpeg',2147483647,'film','2019-01-25 07:22:05','2022-02-28 14:16:18'),(18,'voluptatibus','Corporis illo alias aut explicabo dolorum et laudantium.','Ratione ex quaerat eos mollitia ut. Consequuntur autem natus atque quibusdam vel necessitatibus. Dolores aut qui beatae odit. Consectetur facilis hic iure a quo qui.',5,'2012-07-21','6+',16,'FREE','http://www.kinohd.box.ru/films/voluptatibus.hdv',2147483647,'serial','2012-07-14 13:45:46','2022-02-28 14:16:18'),(19,'illum','Voluptatem occaecati possimus eveniet vel sapiente aut dolorem.','Perferendis modi magni fuga eos accusamus eos vero. Incidunt culpa explicabo est tempora id rem quasi. Reiciendis est debitis maiores quasi.',2,'2020-10-30','16+',9,'FREE','http://www.kinohd.box.ru/films/illum.hdv',2147483647,'film','2020-10-29 22:42:35','2022-02-28 14:16:18'),(20,'autem','Sint blanditiis aut veritatis expedita.','Voluptatum in et ut eum eaque. Distinctio veritatis doloribus ducimus iure. Asperiores commodi alias sequi eum saepe.',2,'2019-01-13','18+',1,'FREE','http://www.kinohd.box.ru/films/autem.hdv',2147483647,'serial','2019-01-02 00:15:35','2022-02-28 14:16:18');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_persons`
--

DROP TABLE IF EXISTS `movies_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_persons` (
  `movie_id` int unsigned NOT NULL COMMENT 'Ссылка на номер группы',
  `person_id` int unsigned NOT NULL COMMENT 'Ссылка на персону',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`movie_id`,`person_id`) COMMENT 'Составной первичный ключ',
  KEY `movies_persons_person_id_fk` (`person_id`),
  CONSTRAINT `movies_persons_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `movies_persons_user_id_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Персоны в видео';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_persons`
--

LOCK TABLES `movies_persons` WRITE;
/*!40000 ALTER TABLE `movies_persons` DISABLE KEYS */;
INSERT INTO `movies_persons` VALUES (1,19,'2012-05-02 11:04:19','2018-06-23 11:48:53'),(2,15,'2017-09-24 19:23:30','2012-05-27 21:48:46'),(3,18,'2016-02-21 13:19:22','2018-12-07 11:10:05'),(4,19,'2012-04-17 21:29:51','2016-03-01 23:54:12'),(5,12,'2016-04-28 10:33:10','2017-12-07 01:15:32'),(6,18,'2014-08-01 20:15:19','2015-06-15 15:13:58'),(7,13,'2018-03-10 19:44:08','2019-07-08 08:35:47'),(8,6,'2021-02-21 15:38:08','2015-05-06 17:42:19'),(9,16,'2021-05-12 22:39:16','2016-04-22 07:17:41'),(10,17,'2012-05-12 14:47:36','2014-09-22 21:18:08'),(11,17,'2021-12-10 16:39:14','2015-11-12 20:59:18'),(12,12,'2013-12-15 22:15:50','2017-11-10 05:32:52'),(13,11,'2020-08-13 19:21:44','2013-11-02 14:33:01'),(14,8,'2020-06-05 11:41:02','2012-10-13 03:31:29'),(15,6,'2013-04-08 21:59:43','2016-07-19 05:58:55'),(16,7,'2018-05-12 23:24:24','2014-10-29 05:15:57'),(17,6,'2016-05-24 06:29:31','2015-03-20 12:36:13'),(18,3,'2012-10-16 14:07:03','2015-07-19 00:58:08'),(19,10,'2020-02-15 20:56:10','2012-04-17 19:21:12'),(20,12,'2013-01-11 19:35:58','2013-09-26 05:02:08');
/*!40000 ALTER TABLE `movies_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `name_sub`
--

DROP TABLE IF EXISTS `name_sub`;
/*!50001 DROP VIEW IF EXISTS `name_sub`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `name_sub` AS SELECT 
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `subscription`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя персоны',
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия персоны',
  `gender` enum('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `country_id` int unsigned NOT NULL COMMENT 'Страна проживания',
  `profession` enum('actor','producer','director') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Профессия в киноиндустрии',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Персоны';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Randy','Stehr','f','2001-04-01',6,'producer','2020-06-18 21:36:49','2014-01-12 05:51:48'),(2,'Alta','Gibson','f','2000-09-27',5,'producer','2020-11-04 21:37:47','2015-10-03 20:09:57'),(3,'Giuseppe','Oberbrunner','m','1985-03-14',9,'producer','2012-11-12 20:17:13','2014-04-29 13:56:24'),(4,'Israel','Fisher','m','2020-02-29',13,'director','2021-07-06 22:11:09','2015-08-01 12:20:11'),(5,'Nova','Kassulke','m','2006-03-01',7,'actor','2020-08-26 02:19:06','2016-09-04 11:35:12'),(6,'Dedrick','Fadel','m','1999-06-15',14,'actor','2014-04-24 20:31:08','2019-02-20 09:07:22'),(7,'Ayla','Buckridge','f','1995-01-08',1,'director','2015-09-29 10:53:26','2015-03-18 18:33:01'),(8,'Wiley','McLaughlin','m','1988-03-18',18,'director','2014-02-20 11:07:37','2020-06-26 17:29:54'),(9,'Murray','Fay','m','1988-06-30',2,'director','2014-10-27 18:45:08','2017-11-28 16:45:58'),(10,'Nicholaus','Parisian','m','1981-02-09',13,'producer','2020-03-31 17:40:16','2020-12-17 11:07:58'),(11,'Vernice','Runte','m','1990-06-13',1,'director','2015-11-04 22:47:07','2016-04-02 04:34:23'),(12,'Malika','Green','m','1979-01-06',7,'actor','2021-04-24 04:43:29','2013-11-15 11:26:20'),(13,'Werner','Leffler','f','1990-12-15',13,'actor','2020-07-10 07:20:57','2012-03-23 10:50:18'),(14,'Kaela','Shanahan','m','2001-03-14',8,'producer','2015-11-06 16:23:41','2017-06-11 09:04:59'),(15,'Freddie','Johnson','m','1989-08-12',19,'actor','2013-08-09 16:58:08','2012-03-04 10:05:50'),(16,'Hayley','Becker','f','1994-06-27',2,'actor','2019-12-27 06:12:18','2018-06-30 11:57:01'),(17,'Milford','Bernier','f','1975-01-25',15,'producer','2020-04-03 13:07:11','2017-05-04 20:41:11'),(18,'Fleta','Steuber','m','1987-11-11',9,'director','2021-12-15 00:30:54','2020-04-06 11:10:22'),(19,'Tom','Rolfson','m','2016-04-10',10,'actor','2019-05-21 17:10:30','2021-10-24 16:04:43'),(20,'Godfrey','Watsica','f','1970-02-22',9,'director','2020-07-03 10:27:11','2021-08-22 10:41:18');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `gender` enum('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `city_id` int unsigned DEFAULT NULL,
  `my_devices` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Подкюченные устройства',
  `my_accounts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Привязанные аккаунты соц.сетей',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`),
  KEY `profiles_city_id_fk` (`city_id`),
  CONSTRAINT `profiles_city_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL,
  CONSTRAINT `profiles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Dina','Turner','f','1993-06-09',8,'95 nv','http://beatty.org/','2021-09-16 15:56:54','2022-02-20 21:29:12'),(2,'Aniyah','Grant','f','1981-12-26',17,'41 kn','http://www.sanfordeffertz.org/','2021-03-13 21:06:19','2022-02-20 21:29:12'),(3,'Henderson','Wunsch','m','1993-09-26',2,'49 hb','http://hauck.com/','2013-11-27 06:36:35','2022-02-20 21:29:12'),(4,'Eden','Waters','m','1974-01-17',16,'88 oz','http://hodkiewicz.com/','2013-09-30 02:38:01','2022-02-20 21:29:12'),(5,'Karson','Hand','f','1980-11-01',6,'77 tn','http://www.monahan.com/','2014-09-01 00:21:10','2022-02-20 21:29:12'),(6,'Bailee','Maggio','m','1986-10-19',9,'33 pj','http://heller.com/','2016-05-29 14:16:20','2022-02-20 21:29:12'),(7,'Harley','Abshire','m','1981-10-17',20,'78 ln','http://bailey.biz/','2013-09-26 13:37:25','2022-02-20 21:29:12'),(8,'Orlo','Collins','m','1996-01-15',14,'82 yw','http://www.volkman.com/','2020-01-17 20:34:34','2022-02-20 21:29:12'),(9,'Ethelyn','Paucek','f','2015-01-01',4,'05 xt','http://cronin.org/','2012-12-10 03:48:57','2022-02-20 21:29:12'),(10,'Leanna','Huel','f','2007-06-05',19,'77 gr','http://www.russel.com/','2012-03-28 00:51:04','2022-02-20 21:29:12'),(11,'Ramona','Lebsack','m','2006-04-04',12,'06 pj','http://kiehn.org/','2020-10-21 18:42:32','2022-02-20 21:29:12'),(12,'Lilian','Carter','m','2022-01-14',11,'40 eh','http://swaniawskimorissette.com/','2014-12-20 22:06:43','2022-02-20 21:29:12'),(13,'Melody','Beier','f','2000-04-28',19,'67 hn','http://www.walshwintheiser.info/','2019-09-27 23:11:22','2022-02-20 21:29:12'),(14,'Ludie','Reilly','m','2011-05-04',15,'86 lq','http://www.mertz.com/','2018-05-23 17:57:02','2022-02-20 21:29:12'),(15,'Hadley','Mante','m','1993-07-22',7,'19 ke','http://marvinvonrueden.org/','2018-06-06 19:11:28','2022-02-20 21:29:12'),(16,'Mylene','Krajcik','f','2009-12-29',5,'41 vy','http://schuster.com/','2014-06-20 02:39:58','2022-02-20 21:29:12'),(17,'Abigail','Carter','m','2021-09-14',9,'30 po','http://www.schamberger.com/','2019-02-28 19:46:49','2022-02-20 21:29:12'),(18,'Jayce','King','f','1989-10-11',7,'19 je','http://www.reichel.com/','2020-05-28 19:22:10','2022-02-20 21:29:12'),(19,'Oma','Adams','f','1999-12-13',17,'80 dq','http://bartoletti.net/','2016-04-10 23:12:04','2022-02-20 21:29:12'),(20,'Zella','Mayer','m','1999-05-29',13,'73 sq','http://kihnconnelly.com/','2012-04-26 23:34:58','2022-02-20 21:29:12');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `movie_id` int unsigned NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Содержание рецензии',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_fk` (`user_id`),
  KEY `reviews_movie_id_fk` (`movie_id`),
  CONSTRAINT `reviews_movie_id_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `reviews_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Рецензии на фильмы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,12,5,'Quisquam cum dolores repellat sapiente. Culpa rerum suscipit sed ad ipsa. Et modi minus eos. Quidem fugit ut aperiam distinctio nulla ducimus.','2020-07-30 14:33:05','2022-02-28 16:35:51'),(2,2,2,'Molestiae repudiandae sed pariatur quidem provident. Velit deserunt quae porro nihil. Ut delectus odio quas vel possimus. Unde non saepe adipisci qui repellendus repellendus.','2017-09-08 16:33:35','2022-02-28 16:35:51'),(3,9,8,'Dolorem cum voluptas nostrum nemo ducimus sunt. Atque fugit fugiat nihil ea amet est eaque. Eos nihil esse ea quibusdam asperiores.','2019-08-15 10:58:59','2022-02-28 16:35:51'),(4,2,2,'Rem sunt nostrum quis possimus ut. Et exercitationem consequuntur dolorum iusto. Similique dolores eum impedit et. Consequatur tempore voluptas iusto necessitatibus consequatur.','2017-09-09 02:33:35','2022-02-28 16:35:51'),(5,4,3,'Dolor non accusantium velit. Nulla praesentium et ut qui blanditiis iste quia provident. Et a itaque omnis ab quia aut ut. Ut nisi non veniam fuga.','2018-12-19 03:18:57','2022-02-28 16:35:51'),(6,16,8,'Quo minus dolorum alias voluptas ea. Aut magnam iure provident quam optio quo ut. Nam aliquid temporibus et eum ad quaerat. Rem quia ex ullam qui ea voluptates et.','2019-08-15 06:58:59','2022-02-28 16:35:51'),(7,4,3,'Ut officia quia ut suscipit architecto delectus. Vel voluptatem eum saepe nostrum id. Quam odit est laboriosam sapiente amet. Ipsum est aut fugiat explicabo.','2018-12-18 19:18:57','2022-02-28 16:35:51'),(9,19,18,'Voluptatem delectus reiciendis eligendi numquam ducimus. Est omnis maiores omnis molestiae blanditiis deserunt. Similique neque ex dolor iusto et sit.','2012-07-15 02:45:46','2022-02-28 16:35:51'),(11,2,2,'Recusandae rem voluptate cupiditate sed ut et. Nostrum libero omnis atque aut sit aut modi. Omnis corporis est numquam reprehenderit quas sit.','2017-09-09 02:33:35','2022-02-28 16:35:51'),(12,12,19,'Voluptatem eum nulla eos porro non illum. Alias qui aliquam quia officiis. Et dolore omnis odit est eveniet molestiae fuga dolor.','2020-10-30 05:42:35','2022-02-28 16:35:51'),(13,17,2,'Nihil accusantium suscipit itaque aliquid doloribus. Nisi exercitationem dignissimos et deleniti earum alias sint. Voluptate et fugiat sunt nam error.','2017-09-08 08:33:35','2022-02-28 16:35:51'),(14,12,5,'Sed dolorem nihil aut molestias. Non beatae modi magni architecto non et. Quia eum atque quis natus. Quia tempore enim qui eos laboriosam molestiae maxime.','2020-07-30 21:33:05','2022-02-28 16:35:51'),(15,2,18,'Et unde vel fuga sunt quos. Voluptatem accusantium quasi libero. Rerum distinctio nostrum vero. Magnam consequatur earum modi.','2012-07-15 00:45:46','2022-02-28 16:35:51'),(16,7,10,'Autem quis voluptas et minus voluptates est eligendi. Aut in omnis eveniet et officia laudantium officiis. Delectus voluptates aut temporibus temporibus ipsam id molestiae.','2012-05-06 06:09:45','2022-02-28 16:35:51'),(17,2,2,'Magni consequuntur est voluptatem quas a optio laudantium dolore. Consequatur laudantium omnis eligendi aut incidunt fugiat. Quis exercitationem consectetur dicta ut delectus earum.','2017-09-09 05:33:35','2022-02-28 16:35:51'),(18,16,8,'Ad minus atque repudiandae. Repellat vero sit voluptate voluptates et assumenda placeat. Voluptatibus magni vel ut eum et expedita. Fuga dolore dicta qui.','2019-08-15 11:58:59','2022-02-28 16:35:51');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название подписки',
  `conditions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Условия подписки',
  `price` smallint unsigned NOT NULL COMMENT 'Стоимость подписки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `conditions` (`conditions`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Группы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,' Plus+more.tv','Porro animi sint quae nobis non quibusdam. Voluptatem velit quae aliquid natus consequatur rerum voluptas. Nesciunt beatae quis amet qui mollitia placeat eligendi. Reiciendis provident illum et.',199,'2017-08-19 03:16:09','2012-12-14 03:32:16'),(2,' Plusmulti','Aut voluptatem velit velit itaque nulla eligendi eum. Sunt qui blanditiis a soluta. Ea exercitationem minus libero vero aut voluptatem nesciunt asperiores. Iure quasi veritatis molestias accusamus molestiae assumenda.',699,'2019-04-12 17:33:52','2020-08-07 07:24:07'),(3,'Plus','Nam nisi veniam qui id aliquam et quod. Dolores similique voluptas occaecati reprehenderit veniam. In et voluptatem consectetur labore cupiditate expedita voluptates. Culpa voluptatum quia sequi reiciendis eum earum nulla.',299,'2015-09-04 18:38:06','2020-03-12 00:56:36'),(4,' Plus+Amediateka','Error et error quia neque molestias ipsum dicta. Voluptatem itaque odio rem. Ab quia quos amet iusto incidunt et excepturi. Et labore in ut deleniti.',499,'2016-08-06 22:00:32','2016-10-29 00:39:05');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions_users`
--

DROP TABLE IF EXISTS `subscriptions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions_users` (
  `subscription_id` int unsigned NOT NULL COMMENT 'Ссылка на подписку',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `active` tinyint(1) DEFAULT NULL COMMENT 'Активность подписки',
  `validity` tinyint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`subscription_id`,`user_id`) COMMENT 'Составной первичный ключ',
  KEY `subscriptions_users_user_id_fk` (`user_id`),
  CONSTRAINT `subscriptions_users_subscription_id_fk` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions_users`
--

LOCK TABLES `subscriptions_users` WRITE;
/*!40000 ALTER TABLE `subscriptions_users` DISABLE KEYS */;
INSERT INTO `subscriptions_users` VALUES (1,7,1,1,'2021-05-28 11:39:47','2022-02-28 05:22:04'),(1,9,1,1,'2022-01-28 11:39:47','2022-02-28 05:22:04'),(1,11,1,1,'2022-01-28 11:39:47','2022-02-28 05:22:04'),(1,13,0,1,'2022-01-28 11:39:47','2022-02-28 05:22:04'),(2,1,1,1,'2021-05-14 15:24:30','2022-02-28 05:22:04'),(2,4,0,1,'2021-12-28 11:39:47','2022-02-28 05:22:04'),(2,6,1,1,'2021-06-28 11:39:47','2022-02-28 05:22:04'),(2,17,1,1,'2022-01-28 11:39:47','2022-02-28 05:22:04'),(2,20,1,1,'2021-12-28 11:39:47','2022-02-28 05:22:04'),(3,4,1,1,'2021-06-28 11:39:47','2022-02-28 05:22:04'),(3,12,0,1,'2021-07-28 11:39:47','2022-02-28 05:22:04'),(3,13,1,1,'2021-02-28 11:39:47','2022-02-28 05:22:04'),(3,14,1,1,'2021-10-28 11:39:47','2022-02-28 05:22:04'),(3,17,0,1,'2021-08-28 11:39:47','2022-02-28 05:22:04'),(4,2,1,1,'2021-07-28 11:39:47','2022-02-28 05:22:04'),(4,6,0,1,'2021-11-28 11:39:47','2022-02-28 05:22:04'),(4,10,1,1,'2021-07-28 11:39:47','2022-02-28 05:22:04'),(4,12,1,1,'2022-01-28 11:39:47','2022-02-28 05:22:04'),(4,19,0,1,'2021-06-28 11:39:47','2022-02-28 05:22:04'),(4,20,0,1,'2022-01-28 11:39:47','2022-02-28 05:22:04');
/*!40000 ALTER TABLE `subscriptions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'schuster.amber@example.com','2021-09-14 15:56:54','2022-02-18 17:46:14'),(2,'ericka35@example.org','2021-03-11 21:06:19','2022-02-18 17:46:14'),(3,'qkuhn@example.net','2013-11-25 06:36:35','2021-11-01 10:47:49'),(4,'mbogisich@example.org','2013-09-28 02:38:01','2015-10-22 18:20:03'),(5,'adonis91@example.com','2014-08-30 00:21:10','2022-02-18 17:46:14'),(6,'nolan.jose@example.net','2016-05-27 14:16:20','2021-07-26 11:50:59'),(7,'lankunding@example.org','2013-09-24 13:37:25','2017-12-08 15:53:12'),(8,'osinski.niko@example.com','2020-01-15 20:34:34','2022-02-18 17:46:14'),(9,'baby19@example.org','2012-12-08 03:48:57','2015-11-02 13:57:53'),(10,'reichel.payton@example.com','2012-03-26 00:51:04','2021-02-21 20:21:08'),(11,'theron.kilback@example.org','2020-10-19 18:42:32','2022-02-18 17:46:14'),(12,'reva.ward@example.com','2014-12-18 22:06:43','2019-11-13 18:08:28'),(13,'lbernier@example.org','2019-09-25 23:11:22','2022-02-18 17:46:14'),(14,'omorissette@example.com','2018-05-21 17:57:02','2020-06-15 05:58:59'),(15,'dianna93@example.com','2018-06-04 19:11:28','2021-12-28 23:28:12'),(16,'murphy.mclaughlin@example.com','2014-06-18 02:39:58','2015-12-26 15:42:10'),(17,'kelsie32@example.com','2019-02-26 19:46:49','2022-02-18 17:46:14'),(18,'isac59@example.net','2020-05-26 19:22:10','2022-02-18 17:46:14'),(19,'jeffrey74@example.com','2016-04-08 23:12:04','2016-08-14 17:21:39'),(20,'vince58@example.net','2012-04-24 23:34:58','2022-02-18 17:46:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `likes_targets`
--

/*!50001 DROP VIEW IF EXISTS `likes_targets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `likes_targets` AS select `ct`.`name` AS `content_type`,`c`.`decription` AS `description`,`c`.`body` AS `body`,`l`.`like_value` AS `score` from ((`content_types` `ct` join `contents` `c` on((`ct`.`id` = `c`.`content_type_id`))) join `likes` `l` on(((`l`.`target_id` = `c`.`id`) and (`l`.`target_type` = 'content')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `name_sub`
--

/*!50001 DROP VIEW IF EXISTS `name_sub`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `name_sub` AS select `p`.`last_name` AS `last_name`,`p`.`first_name` AS `first_name`,`s`.`name` AS `subscription`,`s`.`price` AS `price` from ((`profiles` `p` join `subscriptions_users` `su` on((`p`.`user_id` = `su`.`user_id`))) join `subscriptions` `s` on((`su`.`subscription_id` = `s`.`id`))) */;
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

-- Dump completed on 2022-03-18 19:05:41
