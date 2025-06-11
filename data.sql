-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64) by groovejung
--
-- Host: localhost    Database: yeoljung
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `blocked_users`
--

DROP TABLE IF EXISTS `blocked_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blocker_id` int NOT NULL,
  `blocked_id` int NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blocked_users_blocker_id_blocked_id_key` (`blocker_id`,`blocked_id`),
  KEY `blocker_id` (`blocker_id`),
  KEY `blocked_id` (`blocked_id`),
  CONSTRAINT `blocked_users_blocked_id_fkey` FOREIGN KEY (`blocked_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blocked_users_blocker_id_fkey` FOREIGN KEY (`blocker_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_users`
--

LOCK TABLES `blocked_users` WRITE;
/*!40000 ALTER TABLE `blocked_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocked_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `author_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,12,1,'댓글 테스트','2025-06-02 10:55:40'),(2,12,1,'두번째 댓글','2025-06-02 10:55:48'),(3,8,1,'부의 추월차선','2025-06-02 10:56:03'),(4,9,1,'댓글 테스트','2025-06-02 11:57:06'),(6,15,1,'ㅌㅌㅊㅊ','2025-06-03 01:21:05'),(7,13,2,'댓글 테스트','2025-06-04 06:56:55'),(8,15,2,'테스트','2025-06-07 21:08:28');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'아동용_안전인증_미키화이트.pdf','/uploads/files/1748858261286_______________.pdf',1,'2025-06-02 09:57:41'),(2,'2017+기능성+신발+브랜드네임.pdf','/uploads/files/1748858872489_2017_____________.pdf',2,'2025-06-02 10:07:52'),(3,'2017+기능성+신발+브랜드네임.pdf','/uploads/files/1748858900456_2017_____________.pdf',3,'2025-06-02 10:08:20'),(4,'그루브커머스.pdf','/uploads/files/1748861784571_______.pdf',8,'2025-06-02 10:56:24');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `messages_recipient_id_fkey` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_sender_id_fkey` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,1,'주문번호 관련','쪽지테스트',1,'2025-06-07 19:33:07'),(2,2,1,'테스트중입니다.','테스트중입니다.',1,'2025-06-07 19:42:31'),(3,2,1,'asd','asd',1,'2025-06-07 19:45:39'),(4,1,2,'답장 테스트입니다.','감사합니다.',1,'2025-06-07 20:04:09'),(5,2,1,'ㅇㄹㄴㅇㄹ','ㅌㅌㅌㅌ',1,'2025-06-07 20:10:50'),(6,1,2,'받는사람 테스트','받는사람 테스트',1,'2025-06-07 20:15:12'),(7,2,1,'zzz','zzz',1,'2025-06-07 20:15:27'),(8,1,1,'vvv','vvv',1,'2025-06-07 20:46:12'),(9,2,1,'ㅇㄴㄹㄴㅇㄹ','ㄴㅇㄹㄴㅇㄹ',1,'2025-06-08 09:29:05'),(10,1,2,'쪽지 테스트2','잘가나요?',1,'2025-06-08 15:11:23');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `related_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_read` (`is_read`),
  CONSTRAINT `notifications_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_like` (`post_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (1,9,1,'2025-06-02 11:56:45'),(3,15,1,'2025-06-03 00:47:31'),(5,14,1,'2025-06-03 01:04:21'),(7,16,1,'2025-06-03 01:04:46'),(8,12,1,'2025-06-03 01:05:01'),(13,22,1,'2025-06-03 02:48:17'),(17,13,1,'2025-06-07 22:51:33'),(19,13,2,'2025-06-07 23:28:20'),(20,15,2,'2025-06-07 23:43:51'),(22,12,2,'2025-06-08 09:26:43'),(23,14,2,'2025-06-08 09:26:56'),(25,7,1,'2025-06-08 13:01:23'),(27,11,1,'2025-06-08 13:13:31'),(29,10,1,'2025-06-10 07:02:45');
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_reports`
--

DROP TABLE IF EXISTS `post_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_reports_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_reports_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_reports`
--

LOCK TABLES `post_reports` WRITE;
/*!40000 ALTER TABLE `post_reports` DISABLE KEYS */;
INSERT INTO `post_reports` VALUES (1,9,1,'테스트중','2025-06-02 11:56:57');
/*!40000 ALTER TABLE `post_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'free',
  `view_count` int DEFAULT '0',
  `like_count` int DEFAULT '0',
  `author_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'자유게시판 글 작성 테스트','<img src=\"http://localhost:3000/uploads/1748858239211_640_640.jpg\" alt=\"업로드된 이미지\" style=\"max-width: 100%; height: auto; margin: 10px 0px; display: block;\">자유게시판 글 작성 테스트','free',3,0,1,'2025-06-02 09:57:41','2025-06-10 07:47:38'),(2,'스마트스토어 노출 잘 되는 방법','테스트중입니다.','free',4,0,1,'2025-06-02 10:07:52','2025-06-10 00:10:00'),(3,'자유게시판 게시글 작성 테스트입니다.','자유게시판 게시글 작성 테스트입니다.<br><br><br><img src=\"http://localhost:3000/uploads/1748858933867_640_640.jpg\" alt=\"업로드된 이미지\" style=\"max-width: 100%; height: auto; margin: 10px 0px; display: block;\"><br><br>','free',3,0,1,'2025-06-02 10:08:20','2025-06-10 01:17:35'),(4,'이 서버에서 글 작성 테스트','로컬에서 작업중입니다.<br><br><img src=\"http://localhost:3000/uploads/1748859357830_______.JPG\" alt=\"업로드된 이미지\" style=\"max-width: 100%; height: auto; margin: 10px 0px; display: block;\"><br><br>','free',6,0,1,'2025-06-02 10:16:02','2025-06-10 21:10:25'),(5,'마케팅 카테고리에서 글쓰기','마케팅 카테고리에서 글쓰기','free',4,0,1,'2025-06-02 10:17:17','2025-06-07 23:37:19'),(6,'돈이 되는 말의 법칙','돈 버는 채질을 만드는 강력한 시스템','free',4,0,1,'2025-06-02 10:52:35','2025-06-10 09:50:31'),(7,'나는 자는 동안에도 돈을 번다','나는 자는 동안에도 돈을 번다','free',3,1,1,'2025-06-02 10:52:49','2025-06-08 13:01:23'),(8,'마케터의 도구들','마케터의 도구들','free',9,0,1,'2025-06-02 10:53:03','2025-06-09 00:26:23'),(9,'구글 애드센스로 수익형 블로그 만들기','구글 애드센스로 수익형 블로그 만들기','free',7,0,1,'2025-06-02 10:53:20','2025-06-10 10:41:30'),(10,'함께 있으면 마음이 편안해지는 사람','함께 있으면 마음이 편안해지는 사람','free',15,1,1,'2025-06-02 10:53:33','2025-06-10 07:02:45'),(11,'고객의 80%는 비싸도 구매한다!','고객의 80%는 비싸도 구매한다!','free',32,1,1,'2025-06-02 10:54:10','2025-06-10 21:06:37'),(12,'지금 팔리는 것들의 비밀','지금 팔리는 것들의 비밀','free',31,2,1,'2025-06-02 10:55:19','2025-06-10 21:05:39'),(13,'사무실 PC에서 게시글 업로드','사무실 PC에서 게시글 업로드<br><br><img src=\"http://localhost:3000/uploads/1748903057665_KakaoTalk_20241209_170143825_05.jpg\" alt=\"업로드된 이미지\" style=\"max-width: 100%; height: auto; margin: 10px 0px; display: block;\"><br><br>','free',80,2,1,'2025-06-02 22:24:21','2025-06-10 22:01:07'),(14,'팁과 강좌 글쓰기 테스트','팁과 강좌 글쓰기 테스트<br>잘 올라가나요?','tip',33,2,1,'2025-06-02 22:56:00','2025-06-10 15:17:28'),(15,'질문과 답변 글쓰기 테스트','질문과 답변 글쓰기 테스트','qna',63,2,1,'2025-06-02 22:56:24','2025-06-10 09:50:19'),(16,'작은열정 커뮤니티 이용안내','작은열정 커뮤니티 이용안내','notice',34,1,1,'2025-06-02 22:56:54','2025-06-09 11:34:44'),(22,'판매글 작성 테스트','테스트','market',12,1,1,'2025-06-03 02:03:03','2025-06-10 04:04:17');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reports`
--

DROP TABLE IF EXISTS `user_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reporter_id` int NOT NULL,
  `reported_id` int NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reporter_id` (`reporter_id`),
  KEY `reported_id` (`reported_id`),
  KEY `status` (`status`),
  CONSTRAINT `user_reports_reported_id_fkey` FOREIGN KEY (`reported_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_reports_reporter_id_fkey` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reports`
--

LOCK TABLES `user_reports` WRITE;
/*!40000 ALTER TABLE `user_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'그루브정','groove0524@naver.com','$2b$12$akI4Llk5p4XaXP9ydxwR3ei2Cx3goPNYHq9JJs/EISS5OdkobX0uG','2025-06-02 09:56:43','/uploads/profiles/0991f9f3-ae14-4a4d-ba2f-55d8098ba4f6.jpg','/uploads/profiles/0991f9f3-ae14-4a4d-ba2f-55d8098ba4f6.jpg'),(2,'작은열정','groove0524@gmail.com','$2b$12$PAPs.OyXSH.BbfYoZPnEMesakzFzRiR5Lp.cBAZRjmK19oiyRvtEK','2025-06-04 06:56:18','/uploads/profiles/3f3328bf-c06d-4ab7-99e4-334b6720b625.jpg','/uploads/profiles/3f3328bf-c06d-4ab7-99e4-334b6720b625.jpg');
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

-- Dump completed on 2025-06-10 23:13:25
