# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: test
# Generation Time: 2016-05-17 09:45:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `category` varchar(100) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `qty` tinyint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;

INSERT INTO `books` (`id`, `title`, `price`, `category`, `author`, `qty`)
VALUES
	(1,'Logo Design Now (Midi Series)',17.49,'Design','Julius Wiedemann',10),
	(2,'PHP and MySQL Web Development',17.70,'Web Programming','Luke Welling',5),
	(3,'Composition: From Snapshots to Great Shots',9.00,'Photography','Laurie Excell',11),
	(4,'From Still to Motion: A Photographer\'s Guide to Creating Video with Your DSLR',18.48,'Photography and Video','James Ball',3),
	(5,'Sams Teach Yourself HTML5 Mobile Application Development in 24 Hours',22.94,'Web Programming','Jennifer Kyrnin',8),
	(6,'Customised Mobile Application Development: Using XHTML Parser for Google Android Platform',37.40,'Web Programming','Kaustubh Duraphe',7),
	(7,'Mobile Commerce Application Development',55.05,'Web Programming','Lei-Da Chen',1);

/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
