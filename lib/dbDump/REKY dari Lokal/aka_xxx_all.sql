# Host: localhost  (Version: 5.5.27)
# Date: 2015-12-15 15:47:13
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "actions"
#

DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modul` varchar(20) NOT NULL DEFAULT '',
  `posisi` int(1) NOT NULL DEFAULT '0',
  `order` int(3) NOT NULL DEFAULT '0',
  `modul_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `modul_id` (`modul_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "actions"
#

/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;

#
# Structure for table "admin"
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
INSERT INTO `admin` VALUES (1,'all','Admin','admin','21232f297a57a5a743894a0e4a801fc3',1,0,'1',0,'id','2015-07-23 11:30:38'),(6,'psb','','yohana','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2015-01-27 08:09:58'),(7,'psb','','amey','21232f297a57a5a743894a0e4a801fc3',2,0,'1',3,'','2014-03-13 13:33:37'),(9,'psb','','lini','21232f297a57a5a743894a0e4a801fc3',2,0,'1',2,'','0000-00-00 00:00:00'),(10,'psb','','tere','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(11,'aka','','ratna','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-09-10 08:46:22'),(12,'aka','','yani','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','0000-00-00 00:00:00'),(13,'aka','','kartika','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','0000-00-00 00:00:00'),(14,'psb','','coni chandra','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-03-13 13:32:18'),(17,'aka','','Keith','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-10-03 21:12:01'),(18,'sar','','wanda','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','2014-11-03 13:21:57'),(19,'keu','','yeta','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-10-03 21:14:12'),(20,'aka','','yossi','21232f297a57a5a743894a0e4a801fc3',2,0,'1',3,'','2014-10-09 09:24:49'),(21,'psb','','laura','21232f297a57a5a743894a0e4a801fc3',2,0,'1',3,'','2015-01-26 12:39:50'),(22,'keu','','ketut','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(24,'keu','','desi','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(25,'sar','','feri','21232f297a57a5a743894a0e4a801fc3',2,0,'1',1,'','0000-00-00 00:00:00'),(26,'psb','','angel','21232f297a57a5a743894a0e4a801fc3',2,0,'1',0,'','2014-10-28 11:12:05'),(31,'gur','','','21232f297a57a5a743894a0e4a801fc3',2,133,'1',0,'','0000-00-00 00:00:00'),(32,'gur','Sugeng Widiarso','201309124','21232f297a57a5a743894a0e4a801fc3',2,124,'1',0,'','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

#
# Structure for table "admin_hrd"
#

DROP TABLE IF EXISTS `admin_hrd`;
CREATE TABLE `admin_hrd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `mod` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL,
  `parent` int(2) NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "admin_hrd"
#

/*!40000 ALTER TABLE `admin_hrd` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_hrd` ENABLE KEYS */;

#
# Structure for table "aka_absen"
#

DROP TABLE IF EXISTS `aka_absen`;
CREATE TABLE `aka_absen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_absen"
#

/*!40000 ALTER TABLE `aka_absen` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_absen` ENABLE KEYS */;

#
# Structure for table "aka_absen_guru"
#

DROP TABLE IF EXISTS `aka_absen_guru`;
CREATE TABLE `aka_absen_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_absen_guru"
#

/*!40000 ALTER TABLE `aka_absen_guru` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_absen_guru` ENABLE KEYS */;

#
# Structure for table "aka_alumni"
#

DROP TABLE IF EXISTS `aka_alumni`;
CREATE TABLE `aka_alumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunlulus` varchar(4) NOT NULL DEFAULT '0000',
  `siswa` int(10) unsigned NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_alumni"
#

/*!40000 ALTER TABLE `aka_alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_alumni` ENABLE KEYS */;

#
# Structure for table "aka_angkatan"
#

DROP TABLE IF EXISTS `aka_angkatan`;
CREATE TABLE `aka_angkatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `angkatan` int(4) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "aka_angkatan"
#

INSERT INTO `aka_angkatan` VALUES (1,2015,1,'angkatan tahun 2015','2015-06-02 13:48:12'),(17,2014,1,'angkatan tahun 2014','2015-06-23 16:01:44');

#
# Structure for table "aka_aspekpenilaian"
#

DROP TABLE IF EXISTS `aka_aspekpenilaian`;
CREATE TABLE `aka_aspekpenilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aspekpenilaian` varchar(50) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_dasarpenilaian_replid` (`replid`),
  KEY `IX_dasarpenilaian_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "aka_aspekpenilaian"
#


#
# Structure for table "aka_daftarnilai"
#

DROP TABLE IF EXISTS `aka_daftarnilai`;
CREATE TABLE `aka_daftarnilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `penilaian` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nilai` float NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_daftarnilai"
#

/*!40000 ALTER TABLE `aka_daftarnilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_daftarnilai` ENABLE KEYS */;

#
# Structure for table "aka_detailkelas"
#

DROP TABLE IF EXISTS `aka_detailkelas`;
CREATE TABLE `aka_detailkelas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` int(11) NOT NULL,
  `tahunajaran` int(10) NOT NULL,
  `kapasitas` int(10) NOT NULL DEFAULT '0',
  `wali` int(10) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

#
# Data for table "aka_detailkelas"
#

INSERT INTO `aka_detailkelas` VALUES (30,22,4,25,0,'2015-07-13 13:16:22'),(31,23,4,20,0,'2015-07-13 13:16:22'),(32,24,4,20,0,'2015-07-13 13:16:22'),(33,25,4,20,4,'2015-07-13 13:16:22'),(34,26,4,20,0,'2015-07-13 13:16:22'),(35,27,4,20,0,'2015-07-13 13:16:22'),(36,28,4,20,0,'2015-07-13 13:16:22'),(37,29,4,20,0,'2015-07-13 13:16:22'),(38,30,4,20,0,'2015-07-13 13:16:22'),(39,31,4,20,0,'2015-07-13 13:16:23'),(40,32,4,20,0,'2015-07-13 13:16:23'),(41,33,4,20,0,'2015-07-13 13:16:23'),(42,34,4,20,0,'2015-07-13 13:16:23'),(43,35,4,20,0,'2015-07-13 13:16:23'),(44,36,4,20,0,'2015-07-13 13:16:23'),(45,37,4,20,0,'2015-07-13 13:16:23'),(46,38,4,20,0,'2015-07-13 13:16:23'),(47,39,4,20,0,'2015-07-13 13:16:23'),(48,40,4,20,0,'2015-07-13 13:16:23'),(49,1,1,0,0,'2015-07-26 04:25:41'),(50,2,1,0,0,'2015-07-26 04:25:41');

#
# Structure for table "aka_grading"
#

DROP TABLE IF EXISTS `aka_grading`;
CREATE TABLE `aka_grading` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `aspekpenilaian` int(10) unsigned NOT NULL,
  `nmin` decimal(6,1) NOT NULL,
  `nmax` decimal(6,1) NOT NULL,
  `grading` varchar(2) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_aturangrading_pegawai` (`guru`),
  KEY `FK_aturangrading_tingkat` (`tingkat`),
  KEY `FK_aturangrading_pelajaran` (`pelajaran`),
  KEY `FK_aturangrading_dasarpenilaian` (`aspekpenilaian`),
  KEY `IX_aturangrading_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "aka_grading"
#


#
# Structure for table "aka_grup"
#

DROP TABLE IF EXISTS `aka_grup`;
CREATE TABLE `aka_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_grup"
#

/*!40000 ALTER TABLE `aka_grup` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_grup` ENABLE KEYS */;

#
# Structure for table "aka_guru"
#

DROP TABLE IF EXISTS `aka_guru`;
CREATE TABLE `aka_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `kode` varchar(3) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `pelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_guru_pegawai` (`pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "aka_guru"
#


#
# Structure for table "aka_jadwal"
#

DROP TABLE IF EXISTS `aka_jadwal`;
CREATE TABLE `aka_jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `semester` int(10) unsigned NOT NULL DEFAULT '0',
  `kelas` int(10) unsigned NOT NULL,
  `hari` smallint(5) unsigned NOT NULL,
  `jam` mediumint(8) unsigned NOT NULL,
  `sks` int(10) unsigned NOT NULL,
  `ruang` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_jadwal"
#

/*!40000 ALTER TABLE `aka_jadwal` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_jadwal` ENABLE KEYS */;

#
# Structure for table "aka_jadwal_set"
#

DROP TABLE IF EXISTS `aka_jadwal_set`;
CREATE TABLE `aka_jadwal_set` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `hari` int(10) unsigned NOT NULL,
  `jam` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

#
# Data for table "aka_jadwal_set"
#

/*!40000 ALTER TABLE `aka_jadwal_set` DISABLE KEYS */;
INSERT INTO `aka_jadwal_set` VALUES (1,1,1,1,1),(2,1,1,2,1),(3,1,1,3,1),(4,1,1,4,1),(5,1,1,5,1),(6,1,1,6,1),(7,1,1,7,1),(8,1,2,1,1),(9,1,2,2,1),(10,1,2,3,1),(11,1,2,4,1),(12,1,2,5,1),(13,1,2,6,1),(14,1,2,7,1),(15,1,3,1,1),(16,1,3,2,1),(17,1,3,3,1),(18,1,3,4,1),(19,1,3,5,1),(20,1,3,6,1),(21,1,3,7,1),(22,1,4,1,1),(23,1,4,2,1),(24,1,4,3,1),(25,1,4,4,1),(26,1,4,5,1),(27,1,4,6,1),(28,1,4,7,1),(29,1,5,1,1),(30,1,5,2,1),(31,1,5,3,1),(32,1,5,4,1),(33,1,5,5,1),(34,1,5,6,1),(35,1,5,7,1);
/*!40000 ALTER TABLE `aka_jadwal_set` ENABLE KEYS */;

#
# Structure for table "aka_jenismutasi"
#

DROP TABLE IF EXISTS `aka_jenismutasi`;
CREATE TABLE `aka_jenismutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_jenismutasi"
#

/*!40000 ALTER TABLE `aka_jenismutasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_jenismutasi` ENABLE KEYS */;

#
# Structure for table "aka_jurnal"
#

DROP TABLE IF EXISTS `aka_jurnal`;
CREATE TABLE `aka_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_jurnal"
#

/*!40000 ALTER TABLE `aka_jurnal` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_jurnal` ENABLE KEYS */;

#
# Structure for table "aka_kegiatan"
#

DROP TABLE IF EXISTS `aka_kegiatan`;
CREATE TABLE `aka_kegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `efektif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_kegiatan"
#

/*!40000 ALTER TABLE `aka_kegiatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_kegiatan` ENABLE KEYS */;

#
# Structure for table "aka_kelas"
#

DROP TABLE IF EXISTS `aka_kelas`;
CREATE TABLE `aka_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(100) NOT NULL,
  `tahunajaran` int(10) unsigned NOT NULL,
  `subtingkat` int(10) NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL DEFAULT '0',
  `wali` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_kelas_pegawai` (`wali`),
  KEY `IX_kelas_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "aka_kelas"
#

INSERT INTO `aka_kelas` VALUES (1,'K2',1,1,3,30,2,'','2015-06-05 08:41:20'),(2,'K1',1,1,3,30,1,NULL,'2015-06-22 22:35:29');

#
# Structure for table "aka_komennilai"
#

DROP TABLE IF EXISTS `aka_komennilai`;
CREATE TABLE `aka_komennilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `komen` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_komennilai"
#

/*!40000 ALTER TABLE `aka_komennilai` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_komennilai` ENABLE KEYS */;

#
# Structure for table "aka_komenrapor"
#

DROP TABLE IF EXISTS `aka_komenrapor`;
CREATE TABLE `aka_komenrapor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `komen` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_komenrapor"
#

/*!40000 ALTER TABLE `aka_komenrapor` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_komenrapor` ENABLE KEYS */;

#
# Structure for table "aka_mutasi"
#

DROP TABLE IF EXISTS `aka_mutasi`;
CREATE TABLE `aka_mutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL DEFAULT '0',
  `jenismutasi` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(500) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_mutasi"
#

/*!40000 ALTER TABLE `aka_mutasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_mutasi` ENABLE KEYS */;

#
# Structure for table "aka_pelajaran"
#

DROP TABLE IF EXISTS `aka_pelajaran`;
CREATE TABLE `aka_pelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

#
# Data for table "aka_pelajaran"
#

INSERT INTO `aka_pelajaran` VALUES (2,'BING','Bahasa Inggris',''),(3,'MAT','Matematika',''),(18,'mtk','Matematika',''),(19,'bio','Biologi',''),(20,'fis','Fisika',''),(21,'kim','Kimia',''),(22,'eko','Ekonomi',''),(23,'ppkn','PPKn',''),(24,'BI','Bahasa Indonesia',''),(25,'Bing','Bahasa Inggris',''),(26,'TIK','Teknologi Informasi dan Komputer',''),(27,'ag','Agama',''),(28,'Kertakes','Kerajinan Tangan dan Kesenian',''),(29,'penjaskes','Pendidikan Jasmani dan Kesehatan ',''),(30,'sej','Sejarah',''),(31,'geo','Geografi',''),(32,'sos','Sosiologi',''),(33,'BK','Bimbingan Konseling',''),(34,'elk','Elektro',''),(35,'htg','Berhitung',''),(36,'nyanyi','Bernyanyi',''),(37,'gbr','Menggambar',''),(38,'tls','Menulis',''),(39,'baca','Membaca',''),(40,'wrna','Mewarnai',''),(41,'bcr','Berbicara',''),(42,'bdri','berdiri',''),(43,'jln','Berjalan',''),(44,'bader','Bahasa Daerah','');

#
# Structure for table "aka_penilaian"
#

DROP TABLE IF EXISTS `aka_penilaian`;
CREATE TABLE `aka_penilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `kkm` float NOT NULL DEFAULT '70',
  `bobot` float NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "aka_penilaian"
#


#
# Structure for table "aka_rpp"
#

DROP TABLE IF EXISTS `aka_rpp`;
CREATE TABLE `aka_rpp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `unit` varchar(100) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`replid`),
  KEY `FK_rpp_tingkat` (`tingkat`),
  KEY `FK_rpp_pelajaran` (`pelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "aka_rpp"
#


#
# Structure for table "aka_ruang"
#

DROP TABLE IF EXISTS `aka_ruang`;
CREATE TABLE `aka_ruang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_ruang"
#

/*!40000 ALTER TABLE `aka_ruang` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_ruang` ENABLE KEYS */;

#
# Structure for table "aka_semester"
#

DROP TABLE IF EXISTS `aka_semester`;
CREATE TABLE `aka_semester` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semester` int(1) NOT NULL DEFAULT '1',
  `tahunajaran` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `tglMulai` date NOT NULL,
  `tglSelesai` date NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_semester_departemen` (`tahunajaran`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "aka_semester"
#

INSERT INTO `aka_semester` VALUES (2,2,1,'1','2016-01-01','2016-06-30'),(18,1,1,'1','2015-07-01','2015-12-31'),(19,1,2,'1','2015-06-01','2022-07-14');

#
# Structure for table "aka_setting"
#

DROP TABLE IF EXISTS `aka_setting`;
CREATE TABLE `aka_setting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_setting"
#

/*!40000 ALTER TABLE `aka_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_setting` ENABLE KEYS */;

#
# Structure for table "aka_siswa"
#

DROP TABLE IF EXISTS `aka_siswa`;
CREATE TABLE `aka_siswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL,
  `nisn` varchar(100) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `sekolahasal` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL DEFAULT '0',
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `kriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `golongan` int(10) unsigned NOT NULL DEFAULT '0',
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `kondisi` int(10) unsigned NOT NULL DEFAULT '0',
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `photo` blob NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kodepos` varchar(8) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `pinbb` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(300) DEFAULT NULL,
  `ketkesehatan` varchar(300) NOT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `diterimadikelas` varchar(25) DEFAULT NULL,
  `ijazah` varchar(55) DEFAULT NULL,
  `keterangan` text,
  `sumpokok` decimal(10,0) DEFAULT '0',
  `sumnet` decimal(10,0) NOT NULL DEFAULT '0',
  `disctb` decimal(10,0) DEFAULT '0',
  `discsaudara` decimal(10,0) DEFAULT '0',
  `disctunai` decimal(10,0) DEFAULT '0',
  `disctotal` decimal(10,0) NOT NULL DEFAULT '0',
  `denda` decimal(10,0) DEFAULT '0',
  `angsuran` decimal(10,0) NOT NULL DEFAULT '0',
  `jmlangsur` int(10) unsigned NOT NULL DEFAULT '1',
  `sppbulan` decimal(10,0) NOT NULL DEFAULT '0',
  `grup` int(10) unsigned NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rekening` varchar(50) NOT NULL,
  `namabank` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "aka_siswa"
#


#
# Structure for table "aka_siswa_ayah"
#

DROP TABLE IF EXISTS `aka_siswa_ayah`;
CREATE TABLE `aka_siswa_ayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_ayah"
#

/*!40000 ALTER TABLE `aka_siswa_ayah` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_ayah` ENABLE KEYS */;

#
# Structure for table "aka_siswa_grup"
#

DROP TABLE IF EXISTS `aka_siswa_grup`;
CREATE TABLE `aka_siswa_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `grup` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_grup"
#

/*!40000 ALTER TABLE `aka_siswa_grup` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_grup` ENABLE KEYS */;

#
# Structure for table "aka_siswa_guru"
#

DROP TABLE IF EXISTS `aka_siswa_guru`;
CREATE TABLE `aka_siswa_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `guru` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_guru"
#

/*!40000 ALTER TABLE `aka_siswa_guru` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_guru` ENABLE KEYS */;

#
# Structure for table "aka_siswa_ibu"
#

DROP TABLE IF EXISTS `aka_siswa_ibu`;
CREATE TABLE `aka_siswa_ibu` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_ibu"
#

/*!40000 ALTER TABLE `aka_siswa_ibu` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_ibu` ENABLE KEYS */;

#
# Structure for table "aka_siswa_kelas"
#

DROP TABLE IF EXISTS `aka_siswa_kelas`;
CREATE TABLE `aka_siswa_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_kelas"
#

/*!40000 ALTER TABLE `aka_siswa_kelas` DISABLE KEYS */;
INSERT INTO `aka_siswa_kelas` VALUES (1,1,1),(2,2,1),(3,3,2);
/*!40000 ALTER TABLE `aka_siswa_kelas` ENABLE KEYS */;

#
# Structure for table "aka_siswa_keluarga"
#

DROP TABLE IF EXISTS `aka_siswa_keluarga`;
CREATE TABLE `aka_siswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `kakek-nama` varchar(100) NOT NULL,
  `kakek-tgllahir` date NOT NULL,
  `nenek-nama` varchar(100) NOT NULL,
  `nenek-tgllahir` date NOT NULL,
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_keluarga"
#

/*!40000 ALTER TABLE `aka_siswa_keluarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_keluarga` ENABLE KEYS */;

#
# Structure for table "aka_siswa_kontakdarurat"
#

DROP TABLE IF EXISTS `aka_siswa_kontakdarurat`;
CREATE TABLE `aka_siswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_kontakdarurat"
#

/*!40000 ALTER TABLE `aka_siswa_kontakdarurat` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_kontakdarurat` ENABLE KEYS */;

#
# Structure for table "aka_siswa_saudara"
#

DROP TABLE IF EXISTS `aka_siswa_saudara`;
CREATE TABLE `aka_siswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_saudara"
#

/*!40000 ALTER TABLE `aka_siswa_saudara` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_saudara` ENABLE KEYS */;

#
# Structure for table "aka_siswa_tes"
#

DROP TABLE IF EXISTS `aka_siswa_tes`;
CREATE TABLE `aka_siswa_tes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `tes` int(10) unsigned NOT NULL,
  `nilai` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_siswa_tes"
#

/*!40000 ALTER TABLE `aka_siswa_tes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_siswa_tes` ENABLE KEYS */;

#
# Structure for table "aka_sks"
#

DROP TABLE IF EXISTS `aka_sks`;
CREATE TABLE `aka_sks` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `guru` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_sks"
#

/*!40000 ALTER TABLE `aka_sks` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_sks` ENABLE KEYS */;

#
# Structure for table "aka_statusguru"
#

DROP TABLE IF EXISTS `aka_statusguru`;
CREATE TABLE `aka_statusguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statusguru` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_statusguru_replid` (`replid`),
  KEY `IX_statusguru_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "aka_statusguru"
#


#
# Structure for table "aka_subtingkat"
#

DROP TABLE IF EXISTS `aka_subtingkat`;
CREATE TABLE `aka_subtingkat` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `subtingkat` varchar(100) NOT NULL,
  `tingkat` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "aka_subtingkat"
#

INSERT INTO `aka_subtingkat` VALUES (1,'1',3),(2,'1',2),(3,'1',1);

#
# Structure for table "aka_detailpelajaran"
#

DROP TABLE IF EXISTS `aka_detailpelajaran`;
CREATE TABLE `aka_detailpelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `pelajaran` int(11) NOT NULL,
  `subtingkat` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `subtingkat` (`subtingkat`),
  KEY `pelajaran` (`pelajaran`),
  CONSTRAINT `aka_detailpelajaran_ibfk_1` FOREIGN KEY (`pelajaran`) REFERENCES `aka_pelajaran` (`replid`),
  CONSTRAINT `aka_detailpelajaran_ibfk_2` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

#
# Data for table "aka_detailpelajaran"
#

INSERT INTO `aka_detailpelajaran` VALUES (16,38,3,1),(18,37,3,1),(19,39,3,1),(20,40,3,1),(26,36,2,1),(27,41,1,1),(28,42,1,1),(29,43,1,1),(30,35,2,1),(31,39,4,1),(32,37,4,1),(33,40,4,1),(34,38,4,1),(35,35,4,1),(36,36,4,1),(37,18,5,1),(38,24,5,1),(39,23,5,1),(40,28,5,1),(41,25,5,1),(42,27,5,1),(43,26,5,1),(44,44,5,1),(45,27,6,1),(46,23,6,1),(47,18,6,1),(48,24,6,1),(49,28,6,1),(50,29,6,1),(51,25,6,1),(52,26,6,1),(53,44,6,1);

#
# Structure for table "aka_tahunajaran"
#

DROP TABLE IF EXISTS `aka_tahunajaran`;
CREATE TABLE `aka_tahunajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_tahunajaran_departemen` (`departemen`),
  KEY `IX_tahunajaran_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "aka_tahunajaran"
#

INSERT INTO `aka_tahunajaran` VALUES (1,'2015-2016',1,'2015-07-01','2016-06-30','1','','2015-06-02 13:49:20'),(2,'2014-2015',1,'0000-00-00','0000-00-00','0','ok','2015-06-29 22:54:03');

#
# Structure for table "aka_tahunlulus"
#

DROP TABLE IF EXISTS `aka_tahunlulus`;
CREATE TABLE `aka_tahunlulus` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_tahunlulus"
#

/*!40000 ALTER TABLE `aka_tahunlulus` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_tahunlulus` ENABLE KEYS */;

#
# Structure for table "aka_tes"
#

DROP TABLE IF EXISTS `aka_tes`;
CREATE TABLE `aka_tes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `urut` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_tes"
#

/*!40000 ALTER TABLE `aka_tes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_tes` ENABLE KEYS */;

#
# Structure for table "aka_tesakademis"
#

DROP TABLE IF EXISTS `aka_tesakademis`;
CREATE TABLE `aka_tesakademis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_tesakademis"
#

/*!40000 ALTER TABLE `aka_tesakademis` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_tesakademis` ENABLE KEYS */;

#
# Structure for table "aka_tingkat"
#

DROP TABLE IF EXISTS `aka_tingkat`;
CREATE TABLE `aka_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL DEFAULT '',
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_tingkat_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "aka_tingkat"
#

INSERT INTO `aka_tingkat` VALUES (1,'Toddler',1,'Toddler',1,'2015-06-02 13:52:51'),(2,'Playgroup 1',1,'',2,'2015-06-02 13:53:05'),(3,'Kindergarten 1',1,'',3,'2015-06-02 13:53:30'),(4,'Primary',1,'',4,'2015-07-25 01:37:58'),(5,'Playgroup 2',1,'',5,'2015-07-25 01:38:19'),(6,'Kindergarten 2',1,'',6,'2015-07-25 01:38:47');

#
# Structure for table "aka_tmp_saudara"
#

DROP TABLE IF EXISTS `aka_tmp_saudara`;
CREATE TABLE `aka_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "aka_tmp_saudara"
#

/*!40000 ALTER TABLE `aka_tmp_saudara` DISABLE KEYS */;
/*!40000 ALTER TABLE `aka_tmp_saudara` ENABLE KEYS */;
