# Host: localhost  (Version: 5.5.36)
# Date: 2015-06-02 20:46:36
# Generator: MySQL-Front 5.3  (Build 2.16)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

#
# Source for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `passwd` varchar(128) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1:admin, 2:operator, 3:guest',
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `departemen` int(10) unsigned NOT NULL DEFAULT '0',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `username` (`uname`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

#
# Data for table "admin"
#

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'all','Admin','admin','21232f297a57a5a743894a0e4a801fc3',1,0,'1',0,'id','2015-06-02 20:44:57'),(6,'psb','','yohana','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2015-01-27 08:09:58'),(7,'psb','','amey','21232f297a57a5a743894a0e4a801fc3',2,0,'1',3,'','2014-03-13 13:33:37'),(9,'psb','','lini','21232f297a57a5a743894a0e4a801fc3',2,0,'1',2,'','0000-00-00 00:00:00'),(10,'psb','','tere','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(11,'aka','','ratna','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-09-10 08:46:22'),(12,'aka','','yani','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','0000-00-00 00:00:00'),(13,'aka','','kartika','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','0000-00-00 00:00:00'),(14,'psb','','coni chandra','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-03-13 13:32:18'),(17,'aka','','Keith','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-10-03 21:12:01'),(18,'sar','','wanda','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','2014-11-03 13:21:57'),(19,'keu','','yeta','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-10-03 21:14:12'),(20,'aka','','yossi','21232f297a57a5a743894a0e4a801fc3',2,0,'1',3,'','2014-10-09 09:24:49'),(21,'psb','','laura','21232f297a57a5a743894a0e4a801fc3',2,0,'1',3,'','2015-01-26 12:39:50'),(22,'keu','','ketut','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(24,'keu','','desi','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(25,'sar','','feri','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(26,'psb','','angel','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-10-28 11:12:05'),(31,'gur','','','21232f297a57a5a743894a0e4a801fc3',2,133,'1',0,'','0000-00-00 00:00:00'),(32,'gur','Sugeng Widiarso','201309124','21232f297a57a5a743894a0e4a801fc3',2,124,'1',0,'','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
