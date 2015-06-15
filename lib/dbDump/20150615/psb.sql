# Host: localhost  (Version: 5.5.36)
# Date: 2015-06-15 14:43:56
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
# Source for table "psb_golongan"
#

DROP TABLE IF EXISTS `psb_golongan`;
CREATE TABLE `psb_golongan` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned DEFAULT '1',
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "psb_golongan"
#

/*!40000 ALTER TABLE `psb_golongan` DISABLE KEYS */;
INSERT INTO `psb_golongan` VALUES (1,'Anak Guru &amp; Staf','Anak Guru &amp; Staf',1),(2,'Jalur Prestasi','Akademik, sports, musik',1),(3,'Umum','Masyarakat umum',1);
/*!40000 ALTER TABLE `psb_golongan` ENABLE KEYS */;

#
# Source for table "psb_kelompok"
#

DROP TABLE IF EXISTS `psb_kelompok`;
CREATE TABLE `psb_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `biaya` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`proses`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "psb_kelompok"
#

INSERT INTO `psb_kelompok` VALUES (1,'Toddler',1,'2015-01-01','2015-06-30',300000,'\r\n','2015-06-04 08:42:44'),(2,'Playgroup',1,'2015-01-01','2015-06-30',300000,'','2015-06-04 08:43:24'),(3,'Kindergarden',1,'2015-01-01','2015-06-30',300000,'','2015-06-04 08:44:10'),(4,'Primary',1,'2015-01-01','2015-06-30',300000,NULL,'2015-06-04 09:36:12');

#
# Source for table "psb_kriteria"
#

DROP TABLE IF EXISTS `psb_kriteria`;
CREATE TABLE `psb_kriteria` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "psb_kriteria"
#

/*!40000 ALTER TABLE `psb_kriteria` DISABLE KEYS */;
INSERT INTO `psb_kriteria` VALUES (1,'Toddler','Usia 1 - 3 Tahun',1),(2,'Playgroup','Usia 3 Tahun',1),(3,'Kindergarden','Usia 5 Tahun',1),(4,'Primary','Usia 6 Tahun',1);
/*!40000 ALTER TABLE `psb_kriteria` ENABLE KEYS */;

#
# Source for table "psb_proses"
#

DROP TABLE IF EXISTS `psb_proses`;
CREATE TABLE `psb_proses` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proses` varchar(100) NOT NULL,
  `kodeawalan` varchar(10) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `kapasitas` int(11) NOT NULL DEFAULT '0',
  `departemen` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tahunajaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "psb_proses"
#

INSERT INTO `psb_proses` VALUES (1,'Tahun Ajaran 2015-2016','PMB2015',1,'0000-00-00','0000-00-00',100,1,'1','','2015-06-04 08:40:57',NULL);

#
# Source for table "psb_setbiaya"
#

DROP TABLE IF EXISTS `psb_setbiaya`;
CREATE TABLE `psb_setbiaya` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `daftar` decimal(10,0) NOT NULL DEFAULT '0',
  `spp` decimal(10,0) NOT NULL DEFAULT '0',
  `nilai` decimal(10,0) NOT NULL DEFAULT '0',
  `joiningf` decimal(10,0) NOT NULL,
  `krit` int(10) unsigned NOT NULL DEFAULT '0',
  `gol` int(10) unsigned NOT NULL DEFAULT '0',
  `kel` int(10) unsigned NOT NULL DEFAULT '0',
  `pros` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

#
# Data for table "psb_setbiaya"
#

INSERT INTO `psb_setbiaya` VALUES (1,1,200000,500000,5000000,0,1,1,1,1),(2,1,200000,500000,5000000,0,1,2,1,1),(3,1,200000,500000,5000000,0,1,3,1,1),(4,1,200000,500000,5000000,0,2,1,2,1),(5,1,200000,500000,5000000,0,2,2,2,1),(6,1,200000,500000,5000000,0,2,3,2,1),(7,1,200000,500000,5000000,0,3,1,3,1),(8,1,200000,500000,5000000,0,3,2,3,1),(9,1,200000,500000,5000000,0,3,3,3,1),(10,1,200000,500000,5000000,0,4,1,4,1),(11,1,200000,500000,5000000,0,4,2,4,1),(12,1,200000,500000,5000000,0,4,3,4,1),(13,1,200000,500000,5000000,0,1,1,1,1),(14,1,200000,500000,5000000,0,1,2,1,1),(15,1,200000,500000,5000000,0,1,3,1,1),(16,1,200000,500000,5000000,0,2,1,2,1),(17,1,200000,500000,5000000,0,2,2,2,1),(18,1,200000,500000,5000000,0,2,3,2,1),(19,1,200000,500000,5000000,0,3,1,3,1),(20,1,200000,500000,5000000,0,3,2,3,1),(21,1,200000,500000,5000000,0,3,3,3,1),(22,1,200000,500000,5000000,0,4,1,4,1),(23,1,200000,500000,5000000,0,4,2,4,1),(24,1,200000,500000,5000000,0,4,3,4,1),(25,1,200000,500000,5000000,0,1,1,1,1),(26,1,200000,500000,5000000,0,1,2,1,1),(27,1,200000,500000,5000000,0,1,3,1,1),(28,1,200000,500000,5000000,0,2,1,2,1),(29,1,200000,500000,5000000,0,2,2,2,1),(30,1,200000,500000,5000000,0,2,3,2,1),(31,1,200000,500000,5000000,0,3,1,3,1),(32,1,200000,500000,5000000,0,3,2,3,1),(33,1,200000,500000,5000000,0,3,3,3,1),(34,1,200000,500000,5000000,0,4,1,4,1),(35,1,200000,500000,5000000,0,4,2,4,1),(36,1,200000,500000,5000000,0,4,3,4,1),(37,1,200000,500000,5000000,0,1,1,1,1),(38,1,200000,500000,5000000,0,1,2,1,1),(39,1,200000,500000,5000000,0,1,3,1,1),(40,1,200000,500000,5000000,0,2,1,2,1),(41,1,200000,500000,5000000,0,2,2,2,1),(42,1,200000,500000,5000000,0,2,3,2,1),(43,1,200000,500000,5000000,0,3,1,3,1),(44,1,200000,500000,5000000,0,3,2,3,1),(45,1,200000,500000,5000000,0,3,3,3,1),(46,1,200000,500000,5000000,0,4,1,4,1),(47,1,200000,500000,5000000,0,4,2,4,1),(48,1,200000,500000,5000000,0,4,3,4,1),(49,0,0,0,0,0,2,1,0,1),(50,0,0,0,0,0,2,2,0,1),(51,0,0,0,0,0,2,3,0,1),(52,0,0,0,0,0,3,1,0,1),(53,0,0,0,0,0,3,2,0,1),(54,0,0,0,0,0,3,3,0,1),(55,0,0,0,0,0,4,1,0,1),(56,0,0,0,0,0,4,2,0,1),(57,0,0,0,0,0,4,3,0,1),(58,0,0,0,0,0,1,1,0,1),(59,0,0,0,0,0,1,2,0,1),(60,0,0,0,0,0,1,3,0,1),(61,0,0,0,0,0,2,1,0,1),(62,0,0,0,0,0,2,2,0,1),(63,0,0,0,0,0,2,3,0,1),(64,0,0,0,0,0,4,1,0,1),(65,0,0,0,0,0,4,2,0,1),(66,0,0,0,0,0,4,3,0,1);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
