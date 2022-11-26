-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library_management
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `tbl_book`
--

DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book` (
  `book_BookID` int NOT NULL AUTO_INCREMENT,
  `book_Title` varchar(100) NOT NULL,
  `book_PublisherName` varchar(100) NOT NULL,
  PRIMARY KEY (`book_BookID`),
  KEY `fk_publisher_name1` (`book_PublisherName`),
  CONSTRAINT `fk_publisher_name1` FOREIGN KEY (`book_PublisherName`) REFERENCES `tbl_publisher` (`publisher_PublisherName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES (1,'The Name of the Wind','DAW Books'),(2,'It','Viking'),(3,'The Green Mile','Signet Books'),(4,'Dune','Chilton Books'),(5,'The Hobbit','George Allen & Unwin'),(6,'Eragon','Alfred A. Knopf'),(7,'A Wise Mans Fear','DAW Books'),(8,'Harry Potter and the Philosophers Stone','Bloomsbury'),(9,'Hard Boiled Wonderland and The End of the World','Shinchosa'),(10,'The Giving Tree','Harper and Row'),(11,'The Hitchhikers Guide to the Galaxy','Pan Books'),(12,'Brave New World','Chalto & Windus'),(13,'The Princess Bride','Harcourt Brace Jovanovich'),(14,'Fight Club','W.W. Norton'),(15,'Holes','Scholastic'),(16,'Harry Potter and the Chamber of Secrets','Bloomsbury'),(17,'Harry Potter and the Prisoner of Azkaban','Bloomsbury'),(18,'The Fellowship of the Ring','George Allen & Unwin'),(19,'A Game of Thrones','Bantam'),(20,'The Lost Tribe','Picador USA');
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_authors`
--

DROP TABLE IF EXISTS `tbl_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_authors` (
  `book_authors_AuthorID` int NOT NULL AUTO_INCREMENT,
  `book_authors_BookID` int NOT NULL,
  `book_authors_AuthorName` varchar(50) NOT NULL,
  PRIMARY KEY (`book_authors_AuthorID`),
  KEY `fk_book_id3` (`book_authors_BookID`),
  CONSTRAINT `fk_book_id3` FOREIGN KEY (`book_authors_BookID`) REFERENCES `tbl_book` (`book_BookID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_authors`
--

LOCK TABLES `tbl_book_authors` WRITE;
/*!40000 ALTER TABLE `tbl_book_authors` DISABLE KEYS */;
INSERT INTO `tbl_book_authors` VALUES (1,1,'Patrick Rothfuss'),(2,2,'Stephen King'),(3,3,'Stephen King'),(4,4,'Frank Herbert'),(5,5,'J.R.R. Tolkien'),(6,6,'Christopher Paolini'),(7,6,'Patrick Rothfuss'),(8,8,'J.K. Rowling'),(9,9,'Haruki Murakami'),(10,10,'Shel Silverstein'),(11,11,'Douglas Adams'),(12,12,'Aldous Huxley'),(13,13,'William Goldman'),(14,14,'Chuck Palahniuk'),(15,15,'Louis Sachar'),(16,16,'J.K. Rowling'),(17,17,'J.K. Rowling'),(18,18,'J.R.R. Tolkien'),(19,19,'George R.R. Martin'),(20,20,'Mark Lee'),(21,1,'Patrick Rothfuss'),(22,2,'Stephen King'),(23,3,'Stephen King'),(24,4,'Frank Herbert'),(25,5,'J.R.R. Tolkien'),(26,6,'Christopher Paolini'),(27,6,'Patrick Rothfuss'),(28,8,'J.K. Rowling'),(29,9,'Haruki Murakami'),(30,10,'Shel Silverstein'),(31,11,'Douglas Adams'),(32,12,'Aldous Huxley'),(33,13,'William Goldman'),(34,14,'Chuck Palahniuk'),(35,15,'Louis Sachar'),(36,16,'J.K. Rowling'),(37,17,'J.K. Rowling'),(38,18,'J.R.R. Tolkien'),(39,19,'George R.R. Martin'),(40,20,'Mark Lee');
/*!40000 ALTER TABLE `tbl_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_copies`
--

DROP TABLE IF EXISTS `tbl_book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_copies` (
  `book_copies_CopiesID` int NOT NULL AUTO_INCREMENT,
  `book_copies_BookID` int NOT NULL,
  `book_copies_BranchID` int NOT NULL,
  `book_copies_No_Of_Copies` int NOT NULL,
  PRIMARY KEY (`book_copies_CopiesID`),
  KEY `fk_book_id2` (`book_copies_BookID`),
  KEY `fk_branch_id2` (`book_copies_BranchID`),
  CONSTRAINT `fk_book_id2` FOREIGN KEY (`book_copies_BookID`) REFERENCES `tbl_book` (`book_BookID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_branch_id2` FOREIGN KEY (`book_copies_BranchID`) REFERENCES `tbl_library_branch` (`library_branch_BranchID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_copies`
--

LOCK TABLES `tbl_book_copies` WRITE;
/*!40000 ALTER TABLE `tbl_book_copies` DISABLE KEYS */;
INSERT INTO `tbl_book_copies` VALUES (1,1,1,5),(2,2,1,5),(3,3,1,5),(4,4,1,5),(5,5,1,5),(6,6,1,5),(7,7,1,5),(8,8,1,5),(9,9,1,5),(10,10,1,5),(11,11,1,5),(12,12,1,5),(13,13,1,5),(14,14,1,5),(15,15,1,5),(16,16,1,5),(17,17,1,5),(18,18,1,5),(19,19,1,5),(20,20,1,5),(21,1,2,5),(22,2,2,5),(23,3,2,5),(24,4,2,5),(25,5,2,5),(26,6,2,5),(27,7,2,5),(28,8,2,5),(29,9,2,5),(30,10,2,5),(31,11,2,5),(32,12,2,5),(33,13,2,5),(34,14,2,5),(35,15,2,5),(36,16,2,5),(37,17,2,5),(38,18,2,5),(39,19,2,5),(40,20,2,5),(41,1,3,5),(42,2,3,5),(43,3,3,5),(44,4,3,5),(45,5,3,5),(46,6,3,5),(47,7,3,5),(48,8,3,5),(49,9,3,5),(50,10,3,5),(51,11,3,5),(52,12,3,5),(53,13,3,5),(54,14,3,5),(55,15,3,5),(56,16,3,5),(57,17,3,5),(58,18,3,5),(59,19,3,5),(60,20,3,5),(61,1,4,5),(62,2,4,5),(63,3,4,5),(64,4,4,5),(65,5,4,5),(66,6,4,5),(67,7,4,5),(68,8,4,5),(69,9,4,5),(70,10,4,5),(71,11,4,5),(72,12,4,5),(73,13,4,5),(74,14,4,5),(75,15,4,5),(76,16,4,5),(77,17,4,5),(78,18,4,5),(79,19,4,5),(80,20,4,5);
/*!40000 ALTER TABLE `tbl_book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_loans`
--

DROP TABLE IF EXISTS `tbl_book_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book_loans` (
  `book_loans_LoansID` int NOT NULL AUTO_INCREMENT,
  `book_loans_BookID` int NOT NULL,
  `book_loans_BranchID` int NOT NULL,
  `book_loans_CardNo` int NOT NULL,
  `book_loans_DateOut` varchar(50) NOT NULL,
  `book_loans_DueDate` varchar(50) NOT NULL,
  PRIMARY KEY (`book_loans_LoansID`),
  KEY `fk_book_id1` (`book_loans_BookID`),
  KEY `fk_branch_id1` (`book_loans_BranchID`),
  KEY `fk_cardno` (`book_loans_CardNo`),
  CONSTRAINT `fk_book_id1` FOREIGN KEY (`book_loans_BookID`) REFERENCES `tbl_book` (`book_BookID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_branch_id1` FOREIGN KEY (`book_loans_BranchID`) REFERENCES `tbl_library_branch` (`library_branch_BranchID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cardno` FOREIGN KEY (`book_loans_CardNo`) REFERENCES `tbl_borrower` (`borrower_CardNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_loans`
--

LOCK TABLES `tbl_book_loans` WRITE;
/*!40000 ALTER TABLE `tbl_book_loans` DISABLE KEYS */;
INSERT INTO `tbl_book_loans` VALUES (105,1,1,100,'1/1/18','2/2/18'),(106,2,1,100,'1/1/18','2/2/18'),(107,3,1,100,'1/1/18','2/2/18'),(108,4,1,100,'1/1/18','2/2/18'),(109,5,1,102,'1/3/18','2/3/18'),(110,6,1,102,'1/3/18','2/3/18'),(111,7,1,102,'1/3/18','2/3/18'),(112,8,1,102,'1/3/18','2/3/18'),(113,9,1,102,'1/3/18','2/3/18'),(114,11,1,102,'1/3/18','2/3/18'),(115,12,2,105,'12/12/17','1/12/18'),(116,10,2,105,'12/12/17','1/12/17'),(117,20,2,105,'2/3/18','3/3/18'),(118,18,2,105,'1/5/18','2/5/18'),(119,19,2,105,'1/5/18','2/5/18'),(120,19,2,100,'1/3/18','2/3/18'),(121,11,2,106,'1/7/18','2/7/18'),(122,1,2,106,'1/7/18','2/7/18'),(123,2,2,100,'1/7/18','2/7/18'),(124,3,2,100,'1/7/18','2/7/18'),(125,5,2,105,'12/12/17','1/12/18'),(126,4,3,103,'1/9/18','2/9/18'),(127,7,3,102,'1/3/18','2/3/18'),(128,17,3,102,'1/3/18','2/3/18'),(129,16,3,104,'1/3/18','2/3/18'),(130,15,3,104,'1/3/18','2/3/18'),(131,15,3,107,'1/3/18','2/3/18'),(132,14,3,104,'1/3/18','2/3/18'),(133,13,3,107,'1/3/18','2/3/18'),(134,13,3,102,'1/3/18','2/3/18'),(135,19,3,102,'12/12/17','1/12/18'),(136,20,4,103,'1/3/18','2/3/18'),(137,1,4,102,'1/12/18','2/12/18'),(138,3,4,107,'1/3/18','2/3/18'),(139,18,4,107,'1/3/18','2/3/18'),(140,12,4,102,'1/4/18','2/4/18'),(141,11,4,103,'1/15/18','2/15/18'),(142,9,4,103,'1/15/18','2/15/18'),(143,7,4,107,'1/1/18','2/2/18'),(144,4,4,103,'1/1/18','2/2/18'),(145,1,4,103,'2/2/17','3/2/18'),(146,20,4,103,'1/3/18','2/3/18'),(147,1,4,102,'1/12/18','2/12/18'),(148,3,4,107,'1/13/18','2/13/18'),(149,18,4,107,'1/13/18','2/13/18'),(150,12,4,102,'1/14/18','2/14/18'),(151,11,4,103,'1/15/18','2/15/18'),(152,9,4,103,'1/15/18','2/15/18'),(153,7,4,107,'1/19/18','2/19/18'),(154,4,4,103,'1/19/18','2/19/18'),(155,1,4,103,'1/22/18','2/22/18');
/*!40000 ALTER TABLE `tbl_book_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_borrower`
--

DROP TABLE IF EXISTS `tbl_borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_borrower` (
  `borrower_CardNo` int NOT NULL AUTO_INCREMENT,
  `borrower_BorrowerName` varchar(100) NOT NULL,
  `borrower_BorrowerAddress` varchar(200) NOT NULL,
  `borrower_BorrowerPhone` varchar(50) NOT NULL,
  PRIMARY KEY (`borrower_CardNo`),
  CONSTRAINT `fk_borrower_cardno` FOREIGN KEY (`borrower_CardNo`) REFERENCES `tbl_book_loans` (`book_loans_CardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_borrower`
--

LOCK TABLES `tbl_borrower` WRITE;
/*!40000 ALTER TABLE `tbl_borrower` DISABLE KEYS */;
INSERT INTO `tbl_borrower` VALUES (1,'Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),(2,'Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),(3,'Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),(4,'Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),(5,'Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),(6,'Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),(7,'Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),(8,'Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
/*!40000 ALTER TABLE `tbl_borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_library_branch`
--

DROP TABLE IF EXISTS `tbl_library_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_library_branch` (
  `library_branch_BranchID` int NOT NULL AUTO_INCREMENT,
  `library_branch_BranchName` varchar(100) NOT NULL,
  `library_branch_BranchAddress` varchar(200) NOT NULL,
  PRIMARY KEY (`library_branch_BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_library_branch`
--

LOCK TABLES `tbl_library_branch` WRITE;
/*!40000 ALTER TABLE `tbl_library_branch` DISABLE KEYS */;
INSERT INTO `tbl_library_branch` VALUES (1,'Sharpstown','32 Corner Road, New York, NY 10012'),(2,'Central','491 3rd Street, New York, NY 10014'),(3,'Saline','40 State Street, Saline, MI 48176'),(4,'Ann Arbor','101 South University, Ann Arbor, MI 48104');
/*!40000 ALTER TABLE `tbl_library_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_publisher`
--

DROP TABLE IF EXISTS `tbl_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_publisher` (
  `publisher_PublisherName` varchar(100) NOT NULL,
  `publisher_PublisherAddress` varchar(200) NOT NULL,
  `publisher_PublisherPhone` varchar(500) NOT NULL,
  PRIMARY KEY (`publisher_PublisherName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_publisher`
--

LOCK TABLES `tbl_publisher` WRITE;
/*!40000 ALTER TABLE `tbl_publisher` DISABLE KEYS */;
INSERT INTO `tbl_publisher` VALUES ('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),('Chilton Books','Not Available','Not Available'),('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745'),('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500');
/*!40000 ALTER TABLE `tbl_publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26 20:35:48

