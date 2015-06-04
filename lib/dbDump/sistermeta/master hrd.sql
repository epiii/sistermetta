# Host: localhost  (Version: 5.5.36)
# Date: 2015-06-04 07:34:05
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
# Source for table "hrd_agama"
#

DROP TABLE IF EXISTS `hrd_agama`;
CREATE TABLE `hrd_agama` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_agama"
#

/*!40000 ALTER TABLE `hrd_agama` DISABLE KEYS */;
INSERT INTO `hrd_agama` VALUES (1,'Islam','0'),(2,'Kristen','0'),(3,'Katolik','0');
/*!40000 ALTER TABLE `hrd_agama` ENABLE KEYS */;

#
# Source for table "hrd_jabatan"
#

DROP TABLE IF EXISTS `hrd_jabatan`;
CREATE TABLE `hrd_jabatan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_jabatan"
#

INSERT INTO `hrd_jabatan` VALUES (11,'Guru','0'),(13,'Kepala Sekolah','0'),(14,'Wakil Kepala Sekolah','0'),(15,'Koordinator HOD','0'),(16,'Kepala Litbang','0'),(17,'Manajer Operasional','0'),(18,'Humas','0'),(19,'Tata Usaha','0'),(20,'Chaplain','0'),(21,'Sekretaris Perhimpunan','0'),(23,'Supir','0'),(24,'Pustakawan','0'),(25,'Staf Keuangan','0'),(26,'Staf HRD','0'),(27,'Nanny','0'),(28,'Suster','0'),(29,'Staf GA','0'),(30,'Staf Gudang','0'),(31,'Staf Purchasing & Student Service','0'),(32,'Staf Marketing','0'),(33,'Resepsionis','0'),(34,'Staf','0'),(35,'Staf Foto Copy','0'),(36,'Koordinator GAC (DOS)','0'),(37,'Koordinator GA','0'),(38,'Koordinator Sarpras','0'),(39,'Spv. Accounting ','0'),(40,'Koordinator Training','0'),(41,'Staf Maintenance','0'),(42,'Spv. Marketing','0');

#
# Source for table "hrd_kelamin"
#

DROP TABLE IF EXISTS `hrd_kelamin`;
CREATE TABLE `hrd_kelamin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelamin` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_kelamin"
#

/*!40000 ALTER TABLE `hrd_kelamin` DISABLE KEYS */;
INSERT INTO `hrd_kelamin` VALUES (1,'Laki-laki'),(2,'Perempuan');
/*!40000 ALTER TABLE `hrd_kelamin` ENABLE KEYS */;

#
# Source for table "hrd_m_agama"
#

DROP TABLE IF EXISTS `hrd_m_agama`;
CREATE TABLE `hrd_m_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_agama"
#

/*!40000 ALTER TABLE `hrd_m_agama` DISABLE KEYS */;
INSERT INTO `hrd_m_agama` VALUES (1,'Islam',0,''),(2,'Kristen',0,''),(3,'Nasrani',0,''),(4,'Hindu',0,''),(5,'Budha',0,'');
/*!40000 ALTER TABLE `hrd_m_agama` ENABLE KEYS */;

#
# Source for table "hrd_m_status"
#

DROP TABLE IF EXISTS `hrd_m_status`;
CREATE TABLE `hrd_m_status` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_status"
#

/*!40000 ALTER TABLE `hrd_m_status` DISABLE KEYS */;
INSERT INTO `hrd_m_status` VALUES (1,'Tetap',0,30,''),(2,'Kontrak',0,30,'');
/*!40000 ALTER TABLE `hrd_m_status` ENABLE KEYS */;

#
# Source for table "hrd_m_tingkat"
#

DROP TABLE IF EXISTS `hrd_m_tingkat`;
CREATE TABLE `hrd_m_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_tingkat"
#

/*!40000 ALTER TABLE `hrd_m_tingkat` DISABLE KEYS */;
INSERT INTO `hrd_m_tingkat` VALUES (1,'General staff',0,''),(2,'Manager',0,''),(3,'Staff',0,'');
/*!40000 ALTER TABLE `hrd_m_tingkat` ENABLE KEYS */;

#
# Source for table "hrd_menikah"
#

DROP TABLE IF EXISTS `hrd_menikah`;
CREATE TABLE `hrd_menikah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_menikah"
#

INSERT INTO `hrd_menikah` VALUES (1,'Menikah','0'),(2,'Belum Menikah','0');

#
# Source for table "hrd_pendidikan"
#

DROP TABLE IF EXISTS `hrd_pendidikan`;
CREATE TABLE `hrd_pendidikan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_pendidikan"
#

INSERT INTO `hrd_pendidikan` VALUES (3,'SMA','0'),(4,'S1','0'),(5,'S2','0'),(6,'S3','0'),(7,'D1','0'),(8,'D2','0'),(9,'D3','0'),(10,'D4','0');

#
# Source for table "hrd_statuskaryawan"
#

DROP TABLE IF EXISTS `hrd_statuskaryawan`;
CREATE TABLE `hrd_statuskaryawan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_statuskaryawan"
#

INSERT INTO `hrd_statuskaryawan` VALUES (3,'Tetap','0'),(8,'Part Time','0'),(9,'Kontrak','0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
