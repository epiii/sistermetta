# Host: 127.0.0.1  (Version: 5.6.25)
# Date: 2015-09-17 01:39:24
# Generator: MySQL-Front 5.3  (Build 4.205)

/*!40101 SET NAMES latin1 */;

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
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "aka_angkatan"
#

INSERT INTO `aka_angkatan` VALUES (1,2015,1,1,'angkatan tahun 2015','2015-06-02 20:48:12'),(17,2014,1,1,'angkatan tahun 2014','2015-06-23 23:01:44');

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

INSERT INTO `aka_kelas` VALUES (1,'K2',1,1,3,30,2,'','2015-06-05 15:41:20'),(2,'K1',1,1,3,30,1,NULL,'2015-06-23 05:35:29');

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
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `skm` float NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "aka_pelajaran"
#

INSERT INTO `aka_pelajaran` VALUES (1,1,'BI','Bahasa Indonesia',0,''),(2,1,'BING','Bahasa Inggris',0,''),(3,1,'MAT','Matematika',0,'');

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

INSERT INTO `aka_tahunajaran` VALUES (1,'2015-2016',1,'2015-07-01','2016-06-30','1','','2015-06-02 20:49:20'),(2,'2014-2015',1,'0000-00-00','0000-00-00','0','ok','2015-06-30 05:54:03');

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
  `tingkat` varchar(10) NOT NULL DEFAULT '',
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_tingkat_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "aka_tingkat"
#

INSERT INTO `aka_tingkat` VALUES (1,'Toddler',1,'Toddler',1,'2015-06-02 20:52:51'),(2,'Playgroup',1,'',2,'2015-06-02 20:53:05'),(3,'Kindergard',1,'',3,'2015-06-02 20:53:30');

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

#
# Structure for table "app_registry"
#

DROP TABLE IF EXISTS `app_registry`;
CREATE TABLE `app_registry` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "app_registry"
#

/*!40000 ALTER TABLE `app_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_registry` ENABLE KEYS */;

#
# Structure for table "appactivate"
#

DROP TABLE IF EXISTS `appactivate`;
CREATE TABLE `appactivate` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `kunci` varchar(20) NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "appactivate"
#

/*!40000 ALTER TABLE `appactivate` DISABLE KEYS */;
/*!40000 ALTER TABLE `appactivate` ENABLE KEYS */;

#
# Structure for table "departemen"
#

DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kepsek` int(10) unsigned NOT NULL DEFAULT '0',
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `telepon` varchar(30) NOT NULL,
  `photo` blob NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_departemen_replid` (`replid`),
  UNIQUE KEY `departemen` (`nama`),
  KEY `FK_departemen_pegawai` (`kepsek`),
  KEY `IX_departemen_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "departemen"
#

INSERT INTO `departemen` VALUES (1,'Meta',0,1,'','','',X'','2015-06-02 20:47:54');

#
# Structure for table "hrd_absensi"
#

DROP TABLE IF EXISTS `hrd_absensi`;
CREATE TABLE `hrd_absensi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `masuk` int(3) NOT NULL DEFAULT '0',
  `lembur` int(3) NOT NULL DEFAULT '0',
  `sakit` int(3) NOT NULL DEFAULT '0',
  `alpha` int(3) NOT NULL DEFAULT '0',
  `telat` int(3) NOT NULL DEFAULT '0',
  `bulan` int(2) NOT NULL,
  `tahun` varchar(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_absensi"
#

/*!40000 ALTER TABLE `hrd_absensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_absensi` ENABLE KEYS */;

#
# Structure for table "hrd_agama"
#

DROP TABLE IF EXISTS `hrd_agama`;
CREATE TABLE `hrd_agama` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_agama"
#

/*!40000 ALTER TABLE `hrd_agama` DISABLE KEYS */;
INSERT INTO `hrd_agama` VALUES (1,'Islam','0'),(2,'Kristen','0'),(3,'Katolik','0'),(6,'Hindu','0'),(7,'Budha','0');
/*!40000 ALTER TABLE `hrd_agama` ENABLE KEYS */;

#
# Structure for table "hrd_bayar"
#

DROP TABLE IF EXISTS `hrd_bayar`;
CREATE TABLE `hrd_bayar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `bayar` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  `pid` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_bayar"
#

/*!40000 ALTER TABLE `hrd_bayar` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_bayar` ENABLE KEYS */;

#
# Structure for table "hrd_bebantugas"
#

DROP TABLE IF EXISTS `hrd_bebantugas`;
CREATE TABLE `hrd_bebantugas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_bebantugas"
#

/*!40000 ALTER TABLE `hrd_bebantugas` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_bebantugas` ENABLE KEYS */;

#
# Structure for table "hrd_berkas"
#

DROP TABLE IF EXISTS `hrd_berkas`;
CREATE TABLE `hrd_berkas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_berkas"
#

/*!40000 ALTER TABLE `hrd_berkas` DISABLE KEYS */;
INSERT INTO `hrd_berkas` VALUES (3,'c4aca4147a61be59157a6f0612997435.jpg',1);
/*!40000 ALTER TABLE `hrd_berkas` ENABLE KEYS */;

#
# Structure for table "hrd_bulan"
#

DROP TABLE IF EXISTS `hrd_bulan`;
CREATE TABLE `hrd_bulan` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `bulan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "hrd_bulan"
#

/*!40000 ALTER TABLE `hrd_bulan` DISABLE KEYS */;
INSERT INTO `hrd_bulan` VALUES (1,'Januari'),(2,'Februari'),(3,'Maret'),(4,'April'),(5,'Mei'),(6,'Juni'),(7,'Juli'),(8,'Agustus'),(9,'September'),(10,'Oktober'),(11,'Nopember'),(12,'Desember');
/*!40000 ALTER TABLE `hrd_bulan` ENABLE KEYS */;

#
# Structure for table "hrd_cuti"
#

DROP TABLE IF EXISTS `hrd_cuti`;
CREATE TABLE `hrd_cuti` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl` date NOT NULL,
  `cuti` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_cuti"
#

/*!40000 ALTER TABLE `hrd_cuti` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_cuti` ENABLE KEYS */;

#
# Structure for table "hrd_departemen"
#

DROP TABLE IF EXISTS `hrd_departemen`;
CREATE TABLE `hrd_departemen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  `masterdepartemen` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_departemen"
#

/*!40000 ALTER TABLE `hrd_departemen` DISABLE KEYS */;
INSERT INTO `hrd_departemen` VALUES (1,'Meta','0',0);
/*!40000 ALTER TABLE `hrd_departemen` ENABLE KEYS */;

#
# Structure for table "hrd_fungsional"
#

DROP TABLE IF EXISTS `hrd_fungsional`;
CREATE TABLE `hrd_fungsional` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_fungsional"
#

/*!40000 ALTER TABLE `hrd_fungsional` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_fungsional` ENABLE KEYS */;

#
# Structure for table "hrd_golongan"
#

DROP TABLE IF EXISTS `hrd_golongan`;
CREATE TABLE `hrd_golongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `gajipokok` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_golongan"
#

/*!40000 ALTER TABLE `hrd_golongan` DISABLE KEYS */;
INSERT INTO `hrd_golongan` VALUES (1,'SATU2','3000000');
/*!40000 ALTER TABLE `hrd_golongan` ENABLE KEYS */;

#
# Structure for table "hrd_history"
#

DROP TABLE IF EXISTS `hrd_history`;
CREATE TABLE `hrd_history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `history` varchar(255) NOT NULL,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_history"
#

/*!40000 ALTER TABLE `hrd_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_history` ENABLE KEYS */;

#
# Structure for table "hrd_istrianak"
#

DROP TABLE IF EXISTS `hrd_istrianak`;
CREATE TABLE `hrd_istrianak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_istrianak"
#

/*!40000 ALTER TABLE `hrd_istrianak` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_istrianak` ENABLE KEYS */;

#
# Structure for table "hrd_jabatan"
#

DROP TABLE IF EXISTS `hrd_jabatan`;
CREATE TABLE `hrd_jabatan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_jabatan"
#

/*!40000 ALTER TABLE `hrd_jabatan` DISABLE KEYS */;
INSERT INTO `hrd_jabatan` VALUES (11,'Guru','0'),(13,'Kepala Sekolah','0'),(14,'Wakil Kepala Sekolah','0'),(15,'Koordinator HOD','0'),(16,'Kepala Litbang','0'),(17,'Manajer Operasional','0'),(18,'Humas','0'),(19,'Tata Usaha','0'),(20,'Chaplain','0'),(21,'Sekretaris Perhimpunan','0'),(23,'Supir','0'),(24,'Pustakawan','0'),(25,'Staf Keuangan','0'),(26,'Staf HRD','0'),(27,'Nanny','0'),(28,'Suster','0'),(29,'Staf GA','0'),(30,'Staf Gudang','0'),(31,'Staf Purchasing & Student Service','0'),(32,'Staf Marketing','0'),(33,'Resepsionis','0'),(34,'Staf','0'),(35,'Staf Foto Copy','0'),(36,'Koordinator GAC (DOS)','0'),(37,'Koordinator GA','0'),(38,'Koordinator Sarpras','0'),(39,'Spv. Accounting ','0'),(40,'Koordinator Training','0'),(41,'Staf Maintenance','0'),(42,'Spv. Marketing','0');
/*!40000 ALTER TABLE `hrd_jabatan` ENABLE KEYS */;

#
# Structure for table "hrd_karyawan"
#

DROP TABLE IF EXISTS `hrd_karyawan`;
CREATE TABLE `hrd_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(15) NOT NULL DEFAULT '',
  `nuptk` varchar(512) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `kotalahir` varchar(255) NOT NULL,
  `tgllahir` date NOT NULL,
  `kelamin` varchar(15) NOT NULL DEFAULT '',
  `agama` varchar(20) NOT NULL DEFAULT '',
  `menikah` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL DEFAULT '',
  `kota` varchar(100) NOT NULL DEFAULT '',
  `kodepos` varchar(255) NOT NULL,
  `propinsi` varchar(100) NOT NULL DEFAULT '',
  `negara` varchar(100) NOT NULL DEFAULT '',
  `telepon` varchar(15) NOT NULL DEFAULT '-',
  `handphone` varchar(15) NOT NULL DEFAULT '-',
  `foto` text NOT NULL,
  `departemen` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `jabatanlain` varchar(512) NOT NULL,
  `status` varchar(255) NOT NULL,
  `pendidikan_terakhir` varchar(255) NOT NULL,
  `tglditerima` date NOT NULL,
  `tglpercobaan` date NOT NULL,
  `tglkontrak` date NOT NULL,
  `jatahcuti` int(2) NOT NULL DEFAULT '0',
  `norek` varchar(50) NOT NULL,
  `namarek` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `tipe` enum('0','1','2') NOT NULL DEFAULT '1',
  `tglresign` date NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `tglmelamar` date NOT NULL,
  `golongan` varchar(5) NOT NULL DEFAULT '1',
  `struktural` varchar(5) NOT NULL DEFAULT '1',
  `fungsional` varchar(5) NOT NULL DEFAULT '1',
  `pengabdian` varchar(5) NOT NULL DEFAULT '1',
  `istrianak` varchar(5) NOT NULL DEFAULT '1',
  `uangmakan` varchar(5) NOT NULL DEFAULT '1',
  `uangtransport` varchar(5) NOT NULL DEFAULT '1',
  `bebantugas` varchar(5) NOT NULL DEFAULT '1',
  `walikelas` varchar(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_karyawan"
#

/*!40000 ALTER TABLE `hrd_karyawan` DISABLE KEYS */;
INSERT INTO `hrd_karyawan` VALUES (1,'85042201001','','Silvia Irene','Surabaya','1985-04-22','2','7','1','South Emerald Mansion TK 8/8E','Surabaya','','','','','083854806060','','1','13','','-','4','2007-06-04','0000-00-00','0000-00-00',0,'2912686909','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(2,'88061701002','','Christine Lovely Halim','Jakarta','1988-06-17','2','2','2','Darmo Baru Timur 4/25','Surabaya','','','','','082140988853','','1','11','','-','-','2015-06-04','0000-00-00','0000-00-00',0,'4104602490','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(3,'82090801003','','Romana Thensy Sheilla Dewi','surabaya','1982-09-08','2','2','1','Ikan Mungsing 8/9','Surabaya','','','','','081515419001','','1','11','','-','9','2015-06-04','0000-00-00','0000-00-00',0,'4103534491','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(4,'83070201004','','Aulia Rachma','surabaya','1983-07-24','2','2','-','Jelidro Indah Blok 3/4','Surabaya','','','','','08165450503','','1','11','','-','4','2015-06-04','0000-00-00','0000-00-00',0,'4107011345','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(5,'88021801005','','Desy Febriyanti','surabaya','1988-02-18','2','1','2','Pondok Benowo Indah Blok EN-14','Surabaya','','','','','085730726173','','1','11','','-','4','2015-06-04','0000-00-00','0000-00-00',0,'4108577865','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(7,'','','asd','ads','2015-07-22','1','6','2','','','','','','','','','','','','','3','0000-00-00','0000-00-00','0000-00-00',0,'','','','0','0000-00-00','','','2015-07-12','1','1','1','1','1','1','1','1','1'),(9,'87052601006','','Rycha Rany Susanto','surabaya','1987-05-26','2','1','1','Lidah Harapan Blok X No.27','surabaya','','','','','','','1','13','','-','5','2015-07-24','0000-00-00','0000-00-00',0,'2912687271','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(10,'78021601007','','Virginia Mustamu','Makasar','1978-02-16','2','3','1','Permata Safira A4/8, Lidah Kulon-Lakarsantri','surabaya','60213','Jawa Timur','Indonesia','','087852492300','','1','11','','-','9','2015-07-24','0000-00-00','0000-00-00',0,'4100246746','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(11,'87012601008','','Agnes Dian Christy','Sidoarjo','1987-01-26','2','2','2','Babatan Indah B1-24','','','','','','','','1','11','','-','4','2015-07-24','0000-00-00','0000-00-00',0,'4108355358','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(12,'86122801009','','Rima Yosita Prayitno','Palembang','1986-12-28','2','1','2','Pondok Mutiara D/1,Sidoarjo','','','','','','','','1','11','','-','4','2015-07-24','0000-00-00','0000-00-00',0,'9807290786','','','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(13,'65012401010','','Maria Theresia Sri Murni','surabaya','1965-01-24','2','3','1','Pondok Benowo Indah AZ/28','','','','','','','','1','11','','-','5','2015-07-24','0000-00-00','0000-00-00',0,'4105667251','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(14,'91010401011','','Yesicca Irene','Malang','1991-01-04','2','7','2','Ratah Tiga No.39, Malang','','','','','','','','1','11','','-','4','2015-07-24','0000-00-00','0000-00-00',0,'4105667278','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(15,'88042101012','','Gondo Subekti','Jayapura','1988-04-21','1','1','2','Dusun Kenanten RT01/RW02,Mojokerto','','','','','','','','1','11','','-','4','2015-07-24','0000-00-00','0000-00-00',0,'4107011086','','','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(16,'92061601013','','Yuni Herawati','Cirebon','1992-06-16','2','2','2','Jl. KH Ali 2A RT04 RW02 Sekarputih,Bondowoso','','','','','','','','1','11','','-','4','2015-07-24','0000-00-00','0000-00-00',0,'4110328864','','','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(17,'86050401014','','Roesanty Eka Taruna','surabaya','1986-05-04','2','1','2','Balongsari Madya 7A/29,Surabaya','','','','','','','','1','11','','-','4','2015-07-24','0000-00-00','0000-00-00',0,'4102500879','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(18,'88070802001','','Shelvi Dyah Pratiwi','surabaya','1988-07-08','2','1','1','Putat Gede Timur 4/46','surabaya','60189','Jawa Timur','Indonesia','','081330994950','','1','19','','-','3','2015-07-24','0000-00-00','0000-00-00',0,'2912685589','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(19,'83070202002','','Laily Fitriyah','surabaya','1983-07-02','2','1','1','Sumberan Jl.HKSN 1 No.25,Balasklumprik-wiyung Surabaya','surabaya','60222','Jawa Timur','Indonesia','','081515190488','','1','19','','-','3','2015-07-24','0000-00-00','0000-00-00',0,'4100246142','0','0','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(20,'67062102003','','Boniyem','Ponorogo','1967-06-21','2','1','1','Dukuh Doyong RT 01 RW 01,Ponorogo','','','','','','','','1','-','','-','3','2015-07-24','0000-00-00','0000-00-00',0,'','','','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1'),(21,'72051002004','','Krisnawati','Blitar','1972-05-10','2','1','1','Jl.Kapuas FL7 Wisma Tropodo RT056 RW 006','','','','','','','','1','-','','-','3','2015-07-24','0000-00-00','0000-00-00',0,'4105667537','','','1','0000-00-00','','','0000-00-00','1','1','1','1','1','1','1','1','1');
/*!40000 ALTER TABLE `hrd_karyawan` ENABLE KEYS */;

#
# Structure for table "hrd_kelamin"
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
# Structure for table "hrd_m_agama"
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
# Structure for table "hrd_m_bagian"
#

DROP TABLE IF EXISTS `hrd_m_bagian`;
CREATE TABLE `hrd_m_bagian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bagian` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_bagian"
#

/*!40000 ALTER TABLE `hrd_m_bagian` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_m_bagian` ENABLE KEYS */;

#
# Structure for table "hrd_m_dokumen"
#

DROP TABLE IF EXISTS `hrd_m_dokumen`;
CREATE TABLE `hrd_m_dokumen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dokumen` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_dokumen"
#

/*!40000 ALTER TABLE `hrd_m_dokumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_m_dokumen` ENABLE KEYS */;

#
# Structure for table "hrd_m_jenistraining"
#

DROP TABLE IF EXISTS `hrd_m_jenistraining`;
CREATE TABLE `hrd_m_jenistraining` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_jenistraining"
#

/*!40000 ALTER TABLE `hrd_m_jenistraining` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_m_jenistraining` ENABLE KEYS */;

#
# Structure for table "hrd_m_kelompok"
#

DROP TABLE IF EXISTS `hrd_m_kelompok`;
CREATE TABLE `hrd_m_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_kelompok"
#

/*!40000 ALTER TABLE `hrd_m_kelompok` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_m_kelompok` ENABLE KEYS */;

#
# Structure for table "hrd_m_keluarga"
#

DROP TABLE IF EXISTS `hrd_m_keluarga`;
CREATE TABLE `hrd_m_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keluarga` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_keluarga"
#

/*!40000 ALTER TABLE `hrd_m_keluarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_m_keluarga` ENABLE KEYS */;

#
# Structure for table "hrd_m_marital"
#

DROP TABLE IF EXISTS `hrd_m_marital`;
CREATE TABLE `hrd_m_marital` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marital` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_marital"
#

/*!40000 ALTER TABLE `hrd_m_marital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_m_marital` ENABLE KEYS */;

#
# Structure for table "hrd_m_posisi"
#

DROP TABLE IF EXISTS `hrd_m_posisi`;
CREATE TABLE `hrd_m_posisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posisi` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_m_posisi"
#

/*!40000 ALTER TABLE `hrd_m_posisi` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_m_posisi` ENABLE KEYS */;

#
# Structure for table "hrd_m_status"
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
# Structure for table "hrd_m_tingkat"
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
# Structure for table "hrd_menikah"
#

DROP TABLE IF EXISTS `hrd_menikah`;
CREATE TABLE `hrd_menikah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_menikah"
#

/*!40000 ALTER TABLE `hrd_menikah` DISABLE KEYS */;
INSERT INTO `hrd_menikah` VALUES (1,'Menikah','0'),(2,'Belum Menikah','0');
/*!40000 ALTER TABLE `hrd_menikah` ENABLE KEYS */;

#
# Structure for table "hrd_pegawai"
#

DROP TABLE IF EXISTS `hrd_pegawai`;
CREATE TABLE `hrd_pegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `noidentitas` varchar(30) NOT NULL,
  `kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `tmplahir` varchar(20) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `marital` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `bagian` int(10) unsigned NOT NULL DEFAULT '0',
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `posisi` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `tingkat` int(10) unsigned NOT NULL DEFAULT '0',
  `kesehatan` varchar(500) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `darah` varchar(2) NOT NULL DEFAULT '-',
  `berat` decimal(4,1) NOT NULL DEFAULT '0.0',
  `tinggi` decimal(4,1) NOT NULL DEFAULT '0.0',
  `photo` blob NOT NULL,
  `tglkerja` date NOT NULL DEFAULT '0000-00-00',
  `golakhir` varchar(100) NOT NULL,
  `akhirkontrak` date NOT NULL DEFAULT '0000-00-00',
  `akhirgol` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_pegawai"
#

/*!40000 ALTER TABLE `hrd_pegawai` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_pegawai` ENABLE KEYS */;

#
# Structure for table "hrd_pendidikan"
#

DROP TABLE IF EXISTS `hrd_pendidikan`;
CREATE TABLE `hrd_pendidikan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_pendidikan"
#

/*!40000 ALTER TABLE `hrd_pendidikan` DISABLE KEYS */;
INSERT INTO `hrd_pendidikan` VALUES (3,'SMA','0'),(4,'S1','0'),(5,'S2','0'),(6,'S3','0'),(7,'D1','0'),(8,'D2','0'),(9,'D3','0'),(10,'D4','0');
/*!40000 ALTER TABLE `hrd_pendidikan` ENABLE KEYS */;

#
# Structure for table "hrd_pengabdian"
#

DROP TABLE IF EXISTS `hrd_pengabdian`;
CREATE TABLE `hrd_pengabdian` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_pengabdian"
#

/*!40000 ALTER TABLE `hrd_pengabdian` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_pengabdian` ENABLE KEYS */;

#
# Structure for table "hrd_penggajian"
#

DROP TABLE IF EXISTS `hrd_penggajian`;
CREATE TABLE `hrd_penggajian` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tkt` varchar(50) NOT NULL,
  `gajipokok` varchar(50) NOT NULL DEFAULT '0',
  `tstruktural` varchar(50) NOT NULL DEFAULT '0',
  `tfungsional` varchar(50) NOT NULL DEFAULT '0',
  `tpengabdian` varchar(50) NOT NULL DEFAULT '0',
  `tistrianak` varchar(50) NOT NULL DEFAULT '0',
  `tuangtransport` varchar(50) NOT NULL DEFAULT '0',
  `tbebantugas` varchar(50) NOT NULL DEFAULT '0',
  `twalikelas` varchar(50) NOT NULL DEFAULT '0',
  `tkhusus` varchar(50) NOT NULL DEFAULT '0',
  `gajibruto` varchar(50) NOT NULL DEFAULT '0',
  `tlain` varchar(50) NOT NULL DEFAULT '0',
  `totalgaji` varchar(50) NOT NULL DEFAULT '0',
  `ppinjaman` varchar(50) NOT NULL DEFAULT '0',
  `jamsostek` varchar(50) NOT NULL DEFAULT '0',
  `pph21` varchar(50) NOT NULL DEFAULT '0',
  `gajibersih` varchar(50) NOT NULL DEFAULT '0',
  `idbayar` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_penggajian"
#

/*!40000 ALTER TABLE `hrd_penggajian` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_penggajian` ENABLE KEYS */;

#
# Structure for table "hrd_pinjaman"
#

DROP TABLE IF EXISTS `hrd_pinjaman`;
CREATE TABLE `hrd_pinjaman` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `pinjaman` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_pinjaman"
#

/*!40000 ALTER TABLE `hrd_pinjaman` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_pinjaman` ENABLE KEYS */;

#
# Structure for table "hrd_setting"
#

DROP TABLE IF EXISTS `hrd_setting`;
CREATE TABLE `hrd_setting` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `thr` varchar(5) NOT NULL,
  `reward` varchar(50) NOT NULL DEFAULT '0',
  `terlambat` varchar(50) NOT NULL DEFAULT '0',
  `pph21` varchar(50) NOT NULL DEFAULT '0',
  `jamsostek` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_setting"
#

/*!40000 ALTER TABLE `hrd_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_setting` ENABLE KEYS */;

#
# Structure for table "hrd_statuskaryawan"
#

DROP TABLE IF EXISTS `hrd_statuskaryawan`;
CREATE TABLE `hrd_statuskaryawan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_statuskaryawan"
#

/*!40000 ALTER TABLE `hrd_statuskaryawan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_statuskaryawan` ENABLE KEYS */;

#
# Structure for table "hrd_struktural"
#

DROP TABLE IF EXISTS `hrd_struktural`;
CREATE TABLE `hrd_struktural` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "hrd_struktural"
#

/*!40000 ALTER TABLE `hrd_struktural` DISABLE KEYS */;
INSERT INTO `hrd_struktural` VALUES (1,'STRUKTURAL 1','10','0');
/*!40000 ALTER TABLE `hrd_struktural` ENABLE KEYS */;

#
# Structure for table "hrd_tipe"
#

DROP TABLE IF EXISTS `hrd_tipe`;
CREATE TABLE `hrd_tipe` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_tipe"
#

/*!40000 ALTER TABLE `hrd_tipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_tipe` ENABLE KEYS */;

#
# Structure for table "hrd_training"
#

DROP TABLE IF EXISTS `hrd_training`;
CREATE TABLE `hrd_training` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` tinyint(4) NOT NULL DEFAULT '0',
  `penyelenggara` varchar(100) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pembicara` varchar(100) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `tgl1` date NOT NULL DEFAULT '0000-00-00',
  `tgl2` date NOT NULL DEFAULT '0000-00-00',
  `peserta` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_training"
#

/*!40000 ALTER TABLE `hrd_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_training` ENABLE KEYS */;

#
# Structure for table "hrd_uangmakan"
#

DROP TABLE IF EXISTS `hrd_uangmakan`;
CREATE TABLE `hrd_uangmakan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_uangmakan"
#

/*!40000 ALTER TABLE `hrd_uangmakan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_uangmakan` ENABLE KEYS */;

#
# Structure for table "hrd_uangtransport"
#

DROP TABLE IF EXISTS `hrd_uangtransport`;
CREATE TABLE `hrd_uangtransport` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_uangtransport"
#

/*!40000 ALTER TABLE `hrd_uangtransport` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_uangtransport` ENABLE KEYS */;

#
# Structure for table "hrd_walikelas"
#

DROP TABLE IF EXISTS `hrd_walikelas`;
CREATE TABLE `hrd_walikelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "hrd_walikelas"
#

/*!40000 ALTER TABLE `hrd_walikelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrd_walikelas` ENABLE KEYS */;

#
# Structure for table "intrusions"
#

DROP TABLE IF EXISTS `intrusions`;
CREATE TABLE `intrusions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `page` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `impact` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "intrusions"
#

/*!40000 ALTER TABLE `intrusions` DISABLE KEYS */;
/*!40000 ALTER TABLE `intrusions` ENABLE KEYS */;

#
# Structure for table "keu_brg"
#

DROP TABLE IF EXISTS `keu_brg`;
CREATE TABLE `keu_brg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompokbrg` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `satuan` varchar(10) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "keu_brg"
#

/*!40000 ALTER TABLE `keu_brg` DISABLE KEYS */;
INSERT INTO `keu_brg` VALUES (1,1,'ELKO001','Macbook pro 15 inch',14,'unit','2014-01-11',''),(2,4,'KEMTR0001','Supra X 125',3,'','2014-01-11','');
/*!40000 ALTER TABLE `keu_brg` ENABLE KEYS */;

#
# Structure for table "keu_budget"
#

DROP TABLE IF EXISTS `keu_budget`;
CREATE TABLE `keu_budget` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  `departemen` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "keu_budget"
#

/*!40000 ALTER TABLE `keu_budget` DISABLE KEYS */;
INSERT INTO `keu_budget` VALUES (1,1,'Alat Penganggaran',10000000,'',1),(2,1,'anggaran',2000000,'',1),(3,1,'Angaran Lagi',100000,'',1);
/*!40000 ALTER TABLE `keu_budget` ENABLE KEYS */;

#
# Structure for table "keu_detilanggaran"
#

DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `tahunbuku` int(11) NOT NULL,
  `nominal` decimal(10,0) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Data for table "keu_detilanggaran"
#

INSERT INTO `keu_detilanggaran` VALUES (1,1,8,'white board new ','barang baru',1,500000),(3,1,2,'kertas HVS','ok bos',1,3500),(4,1,8,'penghapus','barang baru ',5,35500000),(5,1,8,'spidol papan','spidol papan hitam',5,10000),(6,1,2,'jk','ok',1,50000),(10,1,8,'kertas HVS','',5,180000),(11,4,8,'Psikotes','',1,0);

#
# Structure for table "keu_anggarantahunan"
#

DROP TABLE IF EXISTS `keu_anggarantahunan`;
CREATE TABLE `keu_anggarantahunan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(11) NOT NULL,
  `nominal` decimal(11,0) NOT NULL DEFAULT '0',
  `tahunbuku` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilanggaran` (`detilanggaran`) USING BTREE,
  CONSTRAINT `keu_anggarantahunan_ibfk_1` FOREIGN KEY (`detilanggaran`) REFERENCES `keu_detilanggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "keu_anggarantahunan"
#

INSERT INTO `keu_anggarantahunan` VALUES (1,1,500000,1),(3,3,230000,1),(4,4,250000,1);

#
# Structure for table "keu_detilrekening"
#

DROP TABLE IF EXISTS `keu_detilrekening`;
CREATE TABLE `keu_detilrekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=340 DEFAULT CHARSET=latin1;

#
# Data for table "keu_detilrekening"
#

/*!40000 ALTER TABLE `keu_detilrekening` DISABLE KEYS */;
INSERT INTO `keu_detilrekening` VALUES (1,1,'111101','KAS KECIL ',''),(6,2,'111201','BCA ',''),(17,2,'111299','BANK DALAM PERJALANAN',''),(18,3,'111900','AYAT SILANG KAS DAN BANK',''),(19,3,'112100','TABUNGAN',''),(20,3,'112200','DEPOSITO BERJANGKA',''),(21,3,'112300','SURAT-SURAT BERHARGA',''),(22,3,'113100','PIUTANG USAHA',''),(23,3,'113200','PIUTANG YANG BELUM DIFAKTURKAN',''),(24,3,'113300','PIUTANG CEK/GIRO MUNDUR',''),(25,3,'113400','CADANGAN PIUTANG RAGU-RAGU',''),(26,3,'113500','PIUTANG DIREKSI',''),(27,3,'113600','PIUTANG KARYAWAN',''),(28,3,'113700','PIUTANG PIHAK III',''),(29,3,'113999','PIUTANG LAIN-LAIN',''),(30,3,'114100','UANG MUKA PEMBELIAN',''),(31,3,'114901','TANAH',''),(32,3,'114902','KENDARAAN',''),(33,3,'114903','MESIN DAN PERALATAN',''),(34,3,'114904','BANGUNAN',''),(35,3,'114905','INVENTARIS',''),(36,3,'114906','UANG MUKA PERJALANAN',''),(37,3,'114999','LAIN-LAIN',''),(38,3,'116121','PPH PASAL 21',''),(39,3,'116122','PPH PASAL 22',''),(40,3,'116123','PPH PASAL 23',''),(41,3,'116125','PPH PASAL 25',''),(42,3,'116126','PPH PASAL 26',''),(43,3,'116151','PPN MASUKAN YANG SUDAH DIKREDITKAN',''),(44,3,'116152','PPN MASUKAN YANG BELUM DIKREDITKAN',''),(45,3,'116201','ASURANSI',''),(46,3,'116202','SEWA',''),(47,3,'116203','BUNGA LEASING',''),(48,3,'116204','ONGKOS ANGKUT',''),(49,3,'116299','LAIN-LAIN',''),(50,3,'121000','PENYERTAAN DALAM SURAT BERHARGA',''),(51,3,'122000','PENYERTAAN DALAM AKTIVA TETAP',''),(52,3,'123000','PENYERTAAN LAIN-LAIN',''),(53,3,'141100','TANAH KANTOR',''),(54,3,'141251','PRASARANA JALAN',''),(55,3,'141252','PRASARANA SALURAN AIR',''),(56,3,'141253','PRASARANA TAMAN',''),(57,3,'141301','INSTALASI LISTRIK',''),(58,3,'141302','INSTALASI AIR',''),(59,3,'141303','INSTALASI TELEPON',''),(60,3,'141401','MESIN-MESIN',''),(61,3,'141451','MESIN-MESIN LEASING',''),(62,3,'141501','KENDARAAN',''),(63,3,'141551','KENDARAAN LEASING KANTOR',''),(64,3,'141601','INVENTARIS',''),(65,3,'145201','AKUM. PENY. BANGUNAN KANTOR',''),(66,3,'145202','AKUM. PENY. BANGUNAN KANTIN',''),(67,3,'145203','AKUM. PENY. BANGUNAN MESS',''),(68,3,'145251','AKUM. PENY. PRASARANA JALAN',''),(69,3,'145252','AKUM. PENY. PRASARANA SALURAN AIR',''),(70,3,'145253','AKUM. PENY. PRASARANA TAMAN',''),(71,3,'145301','AKUM. PENY. INSTALASI LISTRIK',''),(72,3,'145302','AKUM. PENY. INSTALASI AIR',''),(73,3,'145303','AKUM. PENY. INSTALASI TELPON',''),(74,3,'145401','AKUM. PENY. KENDARAAN KANTOR',''),(75,3,'145451','AKUM. PENY. KENDARAAN LEASING KANTOR',''),(76,3,'145501','AKUM. PENY. INVENTARIS KANTOR',''),(77,3,'145502','AKUM. PENY. INVENTARIS KANTIN',''),(78,3,'151000','GOODWILL',''),(79,3,'152000','HAK PATEN',''),(80,3,'153000','LISENSI',''),(81,3,'154000','AKTIVA TIDAK BERWUJUD LAIN-LAIN',''),(82,3,'161101','BIAYA PENDIRIAN',''),(83,3,'161102','GAJI, TUNJANGAN',''),(84,3,'161103','BIAYA PERJALANAN DINAS',''),(85,3,'161104','ALAT TULIS & KEPERLUAN KANTOR',''),(86,3,'161105','IJIN, LEGAL DAN PROFESIONAL FEE',''),(87,3,'161106','ENTERTAINMENT,REPRESEN,SUMBANGAN',''),(88,3,'161107','TELEPON, FAX, TELEGRAM, KIRIM SURAT',''),(89,3,'161108','BENSIN, PARKIR, TOL',''),(90,3,'161109','BIAYA ADMINISTRASI BANK',''),(91,3,'161110','BAHAN PENOLONG',''),(92,3,'161111','BIAYA IKLAN',''),(93,3,'161112','PAJAK-PAJAK',''),(94,3,'161113','REKENING LISTRIK, AIR',''),(95,3,'161114','BIAYA STNK, BBN, DLL',''),(96,3,'161115','BUNGA, FEE, PROVISI BANK, DLL',''),(97,3,'161116','BIAYA PERESMIAN',''),(98,3,'161117','BIAYA BAHAN BAKAR',''),(99,3,'161118','REPARASI & PEMELIHARAAN KANTOR',''),(100,3,'161119','TRAINING, SEMINAR, TEST, DLL',''),(101,3,'161120','BIAYA MAKAN DAN MINUM',''),(102,3,'161121','PPH PASAL 21',''),(103,3,'161122','PPH PASAL 22',''),(104,3,'161123','PPH PASAL 23',''),(105,3,'161124','REPARASI & PEMELIHARAAN KENDARAAN',''),(106,3,'161125','REPARASI & PEMELIHARAAN MESS',''),(107,3,'161126','REPARASI & PEMELIHARAAN TANKI',''),(108,3,'161127','BIAYA PENGURUSAN LISTRIK',''),(109,3,'161128','REPARASI & PEMELIHARAAN BOTOL',''),(110,3,'161129','BIAYA SEWA GEDUNG',''),(111,3,'161130','BIAYA BUNGA LEASING',''),(112,3,'161143','SELISIH KURS',''),(113,3,'161144','BIAYA BUNGA PINJAMAN',''),(114,3,'161145','IURAN DAN ASURANSI',''),(115,3,'161146','BIAYA KEAMANAN',''),(116,3,'161148','BIAYA PRA-OPERASI LAIN-LAIN',''),(117,3,'161151','PENDAPATAN JASA GIRO',''),(118,3,'161152','PENDAPATAN BUNGA DEPOSITO',''),(119,3,'161153','PENDAPATAN BUNGA BANK',''),(120,3,'161154','PENDAPATAN BUNGA PIHAK III',''),(121,3,'161199','PENDAPATAN PRA-OPERASI LAIN-LAIN',''),(122,3,'161500','AKUM.AMORTISASI BIAYA PRA-OPERASI',''),(123,3,'162100','UANG JAMINAN LISTRIK',''),(124,3,'162200','UANG JAMINAN TELEPON',''),(125,3,'163000','BIAYA YANG DITANGGUHKAN',''),(126,3,'164000','BUNGA DALAM MASA KONSTRUKSI (IDC)',''),(127,3,'165201','BANGUNAN ',''),(128,3,'165301','INSTALASI LISTRIK',''),(129,3,'165302','INSTALASI AIR',''),(130,3,'165303','INSTALASI TELEPON',''),(131,3,'166000','BIAYA PENELITIAN DAN PENGEMBANGAN',''),(132,3,'169000','AKTIVA LAIN-LAIN',''),(133,4,'211101','BANK',''),(134,4,'211201','BANK',''),(135,4,'211501','BANK',''),(136,4,'211601','BANK',''),(137,4,'212100','HUTANG USAHA',''),(138,4,'212200','HUTANG YANG BELUM DIFAKTURKAN',''),(139,4,'212300','HUTANG CEK/BILYET GIRO MUNDUR',''),(140,4,'212901','HUTANG PIHAK KETIGA',''),(141,4,'212902','HUTANG PERSEDIAAN',''),(142,4,'212903','HUTANG KENDARAAN',''),(143,4,'212904','HUTANG BANGUNAN',''),(144,4,'212905','HUTANG INVENTARIS',''),(145,4,'212906','HUTANG VOUCHER',''),(146,4,'212907','HUTANG KPD GKA ELYON',''),(147,4,'212999','LAIN-LAIN',''),(148,4,'213100','UANG MUKA PENJUALAN',''),(149,4,'213900','UANG MUKA LAIN-LAIN',''),(150,4,'214104','PPH PASAL 4 AYAT 2',''),(151,4,'214121','PPH PASAL 21',''),(152,4,'214122','PPH PASAL 22',''),(153,4,'214123','PPH PASAL 23',''),(154,4,'214125','PPH PASAL 25',''),(155,4,'214126','PPH PASAL 26',''),(156,4,'214129','PPH PASAL 29',''),(157,4,'214151','PPN KELUARAN YANG SUDAH DIFAKTURKAN',''),(158,4,'214152','PPN KELUARAN YANG BELUM DIFAKTURKAN',''),(159,4,'214201','BUNGA',''),(160,4,'214202','SEWA',''),(161,4,'214203','GAJI DAN HONOR',''),(162,4,'214204','MAKAN DAN LEMBUR',''),(163,4,'214205','LISTRIK',''),(164,4,'214206','TUNJANGAN TRANSPORT-MAINTENANCE',''),(165,4,'214207','TELEPON',''),(166,4,'214208','SURAT KABAR/MAJALAH',''),(167,4,'214209','KOMISI',''),(168,4,'214210','BIAYA ADMINISTRASI BANK',''),(169,4,'214211','PAJAK WAPU/WAJIB PUNGUT',''),(170,4,'214212','JAMSOSTEK',''),(171,4,'214213','PREMI DISTRIBUSI',''),(172,4,'214214','ONGKOS ANGKUT',''),(173,4,'214299','LAIN-LAIN',''),(174,4,'215121','PPH PASAL 21',''),(175,4,'215122','PPH PASAL 22',''),(176,4,'215123','PPH PASAL 23',''),(177,4,'215125','PPH PASAL 25',''),(178,4,'215201','PPN KELUARAN',''),(179,4,'215202','PPN EKS KEPPRES',''),(180,4,'216101','HUTANG LEASING KENDARAAN',''),(181,4,'219101','HUTANG DEVIDEN',''),(182,4,'219199','LAIN-LAIN',''),(183,4,'221101','BANK',''),(184,4,'221201','BANK',''),(185,4,'22210','HUTANG LEASING KENDARAAN',''),(186,4,'223000','HUTANG PADA PEMEGANG SAHAM',''),(187,4,'230000','HUTANG LAIN - LAIN',''),(188,4,'240000','HUTANG YG. DISUBORDINASI',''),(189,4,'250000','KEWAJIBAN BERSYARAT',''),(190,5,'311101','TIDAK TERIKAT',''),(191,5,'312101','TEMPORER...........',''),(192,5,'312201','PERMANEN......',''),(193,6,'411101','DANA DARI DONATUR',''),(194,6,'411102','DPP (DANA PEMBANGUNAN & PENGEMBANGAN)',''),(195,6,'411103','DANA JOINING',''),(196,6,'411104','DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)',''),(197,6,'411105','DANA STUDENT EXCHANGE',''),(198,6,'411201','SUMBANGAN TERIKAT TEMPORER',''),(199,6,'411202','SUMBANGAN TERIKAT PERMANEN',''),(200,6,'412101','PENJUALAN FORMULIR + PSIKOTES',''),(201,6,'412102','UANG KEG. EKSTRAKURIKULER',''),(202,6,'412103','UANG PENDAFTARAN ULANG',''),(203,6,'412104','UANG SEKOLAH',''),(204,6,'412105','PENDAPATAN PENJUALAN SERAGAM',''),(205,6,'412106','PENDAPATAN PENJUALAN BUKU',''),(206,6,'412107','PENDAPATAN PENJUALAN CD/VCD/DVD',''),(207,6,'412108','PENDAPATAN LAIN-LAIN',''),(208,6,'412109','PENDAPATAN LUNCH',''),(209,6,'412110','PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE',''),(210,6,'412111','DENDA KETERLAMBATAN BAYAR UANG SEKOLAH',''),(211,6,'412112','PENDAPATAN CHECK POINT',''),(212,6,'412113','PENDAPATAN UJIAN HSK',''),(213,6,'412114','PENDAPATAN DAY CARE',''),(214,6,'421101','PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG',''),(215,6,'421102','PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN',''),(216,6,'421103','PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ',''),(217,6,'421201','PENGHASILAN INVESTASI TERIKAT TEMPORER',''),(218,6,'421202','PENGHASILAN INVESTASI TERIKAT PERMANEN',''),(219,7,'511101','GAJI',''),(220,7,'511102','HONOR',''),(221,7,'511103','LEMBUR',''),(222,7,'511104','PESANGON',''),(223,7,'511105','UANG MAKAN',''),(224,7,'511106','BONUS',''),(225,7,'511107','TUNJANGAN HARI RAYA',''),(226,7,'511108','PPH PASAL 21',''),(227,7,'511109','KESEJAHTERAAN KARYAWAN',''),(228,7,'511110','JAMINAN KECELAKAAN KERJA ( JKK )',''),(229,7,'511111','JAMINAN KEMATIAN ( JKM )',''),(230,7,'511112','JAMINAN HARI TUA ( JHT )',''),(231,7,'511113','JAMINAN PEMELIHARAAN KESEHATAN (JPK)',''),(232,7,'511114','TUNJANGAN DANA PENSIUN',''),(233,7,'511115','TUNJANGAN KESEHATAN',''),(234,7,'511116','TUNJANGAN TRANSPORT',''),(235,7,'511117','JAMSOSTEK',''),(236,7,'511119','PREMI ',''),(237,7,'511199','TUNJANGAN LAIN-LAIN',''),(238,7,'512101','BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA',''),(239,7,'512102','BI.BAHAN PERB. & PEMELIHARAAN KEND.',''),(240,7,'512103','BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS',''),(241,7,'512199','BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN',''),(242,7,'512201','PENYUSUTAN BANGUNAN & PRASARANA',''),(243,7,'512202','PENYUSUTAN KENDARAAN',''),(244,7,'512203','PENYUSUTAN INVENTARIS',''),(245,7,'512204','PENYUSUTAN INSTALASI',''),(246,7,'512301','TRANSPORTASI ( BENSIN, TIKET )',''),(247,7,'512302','MAKANAN & MINUMAN',''),(248,7,'512303','PENGINAPAN',''),(249,7,'512304','UANG SAKU',''),(250,7,'512399','LAIN-LAIN ( PARKIR, TOL )',''),(251,7,'512401','SEWA BANGUNAN',''),(252,7,'512402','SEWA KENDARAAN',''),(253,7,'512403','SEWA INVENTARIS KANTOR',''),(254,7,'512451','ASURANSI BANGUNAN',''),(255,7,'512452','ASURANSI KENDARAAN',''),(256,7,'512453','ASURANSI INVENTARIS',''),(257,7,'512501','TELEPON',''),(258,7,'512502','TELEX',''),(259,7,'512503','TELEGRAM',''),(260,7,'512504','INTERLOKAL NON TELEPON INTERN',''),(261,7,'512505','FACSIMILE',''),(262,7,'512599','LAIN - LAIN',''),(263,7,'512601','AIR',''),(264,7,'512602','LISTRIK',''),(265,7,'512603','ALAT-ALAT LISTRIK',''),(266,7,'512701','AKUNTAN',''),(267,7,'512702','NOTARIS',''),(268,7,'512703','KONSULTAN',''),(269,7,'512704','MANAGEMENT FEE',''),(270,7,'512801','ADMINISTRASI BANK',''),(271,7,'512802','BUKU CEK / BG',''),(272,7,'512803','TRANSFER, KIRIM UANG , INKASO',''),(273,7,'512804','PAJAK BUNGA BANK',''),(274,7,'512901','BIAYA ADMINISTRASI KENDARAAN',''),(275,7,'512902','BIAYA BUNGA ANGSURAN KENDARAAN',''),(276,7,'512903','BIAYA BUNGA KREDIT BANK',''),(277,7,'513101','ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR',''),(278,7,'513102','PERANGKO, MATERAI, KIRIM SURAT',''),(279,7,'513103','FOTOCOPY/LAMINATING/CETAK FOTO',''),(280,7,'513104','ALAT - ALAT PENGAJARAN ',''),(281,7,'513105','PERLENGKAPAN KELAS',''),(282,7,'513106','JASA PEMBELAJARAN',''),(283,7,'513201','PERIJINAN',''),(284,7,'513202','PAJAK - PAJAK DAERAH,PBB',''),(285,7,'513203','STNK',''),(286,7,'513211','RETRIBUSI SAMPAH',''),(287,7,'513301','SUMBANGAN',''),(288,7,'513302','ENTERTAINMENT',''),(289,7,'513303','JAMUAN ',''),(290,7,'513401','KEAMANAN',''),(291,7,'513501','PENDAFTARAN',''),(292,7,'513502','IURAN',''),(293,7,'513601','BIAYA PENGOBATAN',''),(294,7,'513701','MAKANAN DAN MINUMAN',''),(295,7,'513702','BAHAN BAKAR DAN PARKIR/TRANSPORT',''),(296,7,'513703','SERAGAM ',''),(297,7,'513704','SEWA DISPENSER',''),(298,7,'513705','OLAH RAGA DAN KESENIAN',''),(299,7,'513706','BIAYA TRAINING, SEMINAR DAN STUDI BANDING',''),(300,7,'513707','BUKU, VCD',''),(301,7,'513708','ATRIBUT SEKOLAH',''),(302,7,'513709','BIAYA PSIKOTES',''),(303,7,'513710','BIAYA ADVERTENSI ( IKLAN )',''),(304,7,'513711','BIAYA STUDY TOUR',''),(305,7,'513712','BIAYA PERLOMBAAN & PERAYAAN',''),(306,7,'513713','STIKER U/ MURID',''),(307,7,'513714','BIAYA TES KESEHATAN',''),(308,7,'513715','BIAYA KOMISI PENGEMBANGAN',''),(309,7,'513716','BIAYA PAMERAN',''),(310,7,'513799','LAIN - LAIN',''),(311,7,'513801','KANTIN',''),(312,7,'513802','DAPUR',''),(313,7,'513803','BIAYA KEBERSIHAN',''),(314,7,'513804','BIAYA KEPERLUAN KEBUN/TAMAN',''),(315,7,'513805','JASA CLEANING SERVICE',''),(317,7,'513807','BIAYA MESS',''),(318,7,'513901','SELAMATAN',''),(319,7,'513902','BIAYA PENGURUSAN SURAT LAIN - LAIN',''),(320,7,'513903','DENDA PAJAK',''),(321,7,'513904','KOREKSI TAHUN LALU',''),(322,7,'513998','LAIN - LAIN (SELISIH KURS)',''),(323,7,'513999','LAIN - LAIN (SELISIH KAS)',''),(324,7,'514001','TRANSPORT',''),(325,7,'514002','MAKAN & MINUM (RAPAT)',''),(326,7,'514099','LAIN-LAIN',''),(327,7,'514101','BUKU',''),(328,7,'514102','VCD',''),(329,7,'514103','SERAGAM ',''),(330,7,'514104','ATRIBUT SEKOLAH',''),(331,7,'514105','BIAYA PSIKOTES',''),(332,7,'514106','BIAYA STUDY TOUR/FIELD TRIP',''),(333,7,'514107','BIAYA PERLOMBAAN ',''),(334,7,'514108','EKSTRAKURIKULER',''),(335,7,'514109','BIAYA STUDENT EXCHANGE',''),(336,7,'514110','BIAYA CHECK POINT',''),(337,7,'514199','LAIN - LAIN','');
/*!40000 ALTER TABLE `keu_detilrekening` ENABLE KEYS */;

#
# Structure for table "keu_detjenistrans"
#

DROP TABLE IF EXISTS `keu_detjenistrans`;
CREATE TABLE `keu_detjenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistrans` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `bukti` char(3) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "keu_detjenistrans"
#

INSERT INTO `keu_detjenistrans` VALUES (1,2,'pembayaran siswa aktif','in_siswa','BKM'),(2,2,'pembayaran calon siswa','in_calonsiswa','BBM'),(3,2,'pemasukan bank','in_bank','BBM'),(4,2,'pemasukkan kas','in_come','BKM'),(5,3,'pengeluaran barang','out_barang','BKK'),(6,3,'pengeluaran bank','out_bank','BBK'),(7,3,'pengeluaran kas','out_come','BKK'),(8,1,'junal umum','ju','MMJ');

#
# Structure for table "keu_grupbrg"
#

DROP TABLE IF EXISTS `keu_grupbrg`;
CREATE TABLE `keu_grupbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "keu_grupbrg"
#

/*!40000 ALTER TABLE `keu_grupbrg` DISABLE KEYS */;
INSERT INTO `keu_grupbrg` VALUES (1,'Elektronika',''),(2,'Kendaraan',''),(3,'Alat Tulis','');
/*!40000 ALTER TABLE `keu_grupbrg` ENABLE KEYS */;

#
# Structure for table "keu_jenistrans"
#

DROP TABLE IF EXISTS `keu_jenistrans`;
CREATE TABLE `keu_jenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "keu_jenistrans"
#

INSERT INTO `keu_jenistrans` VALUES (1,'jurnal umum','ju'),(2,'pemasukkan','in'),(3,'pengeluaran','out');

#
# Structure for table "keu_jurnal"
#

DROP TABLE IF EXISTS `keu_jurnal`;
CREATE TABLE `keu_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi` int(10) unsigned NOT NULL,
  `rek` int(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `jenis` char(1) NOT NULL,
  `debet` double(14,0) NOT NULL DEFAULT '0',
  `kredit` double(14,0) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=1185 DEFAULT CHARSET=latin1;

#
# Data for table "keu_jurnal"
#

/*!40000 ALTER TABLE `keu_jurnal` DISABLE KEYS */;
INSERT INTO `keu_jurnal` VALUES (1171,1,83,80000,'k',0,0,'2015-05-25 15:47:11'),(1172,1,1,80000,'d',0,0,'2015-05-25 15:47:11'),(1173,2,83,15000,'d',0,0,'2015-05-25 15:47:58'),(1174,2,1,15000,'k',0,0,'2015-05-25 15:47:58'),(1175,3,222,35000,'d',0,0,'2015-05-25 15:56:14'),(1176,3,6,35000,'k',0,0,'2015-05-25 15:56:14'),(1177,4,203,70000,'k',0,0,'2015-05-25 16:00:10'),(1178,4,1,70000,'d',0,0,'2015-05-25 16:00:10'),(1179,5,1,50000,'d',0,0,'2015-05-26 06:08:09'),(1180,5,22,50000,'k',0,0,'2015-05-26 06:08:09'),(1181,5,25,5000,'k',0,0,'2015-05-26 06:08:59'),(1182,5,3,5000,'d',0,0,'2015-05-26 06:09:00'),(1183,6,193,500000,'k',0,0,'2015-06-05 06:29:17'),(1184,6,1,500000,'d',0,0,'2015-06-05 06:29:17');
/*!40000 ALTER TABLE `keu_jurnal` ENABLE KEYS */;

#
# Structure for table "keu_kategorianggaran"
#

DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE `keu_kategorianggaran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) NOT NULL,
  `rekening` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "keu_kategorianggaran"
#

INSERT INTO `keu_kategorianggaran` VALUES (1,1,5,'ATK','alat tulis kantor'),(2,1,1,'lingkungan','dana perwatan lingkungan sekolah'),(3,1,2,'kesiswaan','dana kegiatan ekstrakurikuler siswa'),(4,1,331,'Psikotes','');

#
# Structure for table "keu_kategorirek"
#

DROP TABLE IF EXISTS `keu_kategorirek`;
CREATE TABLE `keu_kategorirek` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "keu_kategorirek"
#

/*!40000 ALTER TABLE `keu_kategorirek` DISABLE KEYS */;
INSERT INTO `keu_kategorirek` VALUES (1,1,'KAS'),(2,1,'BANK'),(3,1,'AKTIVA'),(4,2,'KEWAJIBAN'),(5,3,'MODAL'),(6,4,'PENDAPATAN'),(7,5,'BIAYA');
/*!40000 ALTER TABLE `keu_kategorirek` ENABLE KEYS */;

#
# Structure for table "keu_kategorirekening"
#

DROP TABLE IF EXISTS `keu_kategorirekening`;
CREATE TABLE `keu_kategorirekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  `jenis` enum('d','k') NOT NULL,
  `jenistambah` enum('d','k') NOT NULL,
  `jeniskurang` enum('d','k') NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

#
# Data for table "keu_kategorirekening"
#

/*!40000 ALTER TABLE `keu_kategorirekening` DISABLE KEYS */;
INSERT INTO `keu_kategorirekening` VALUES (1,1,'KAS','d','d','k'),(2,1,'BANK','d','d','k'),(3,1,'AKTIVA','d','d','k'),(4,2,'KEWAJIBAN','k','k','d'),(5,3,'MODAL','k','k','d'),(6,4,'PENDAPATAN','k','k','d'),(7,5,'BIAYA','d','d','k');
/*!40000 ALTER TABLE `keu_kategorirekening` ENABLE KEYS */;

#
# Structure for table "keu_katmodulpembayaran"
#

DROP TABLE IF EXISTS `keu_katmodulpembayaran`;
CREATE TABLE `keu_katmodulpembayaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `siswa` enum('aktif','calon') DEFAULT NULL,
  `sifat` enum('wajib','sukarela') DEFAULT NULL,
  `keterangan` text NOT NULL,
  `detjenistrans` int(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "keu_katmodulpembayaran"
#

INSERT INTO `keu_katmodulpembayaran` VALUES (1,'Tuition Fee','aktif','wajib','uang per semester (spp)',1),(2,'Registration','aktif','wajib','uang pendaftaran (uang gedung)',1),(3,'Material Fee','aktif','wajib','material fee',1);

#
# Structure for table "keu_kelompokbrg"
#

DROP TABLE IF EXISTS `keu_kelompokbrg`;
CREATE TABLE `keu_kelompokbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grupbrg` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "keu_kelompokbrg"
#

/*!40000 ALTER TABLE `keu_kelompokbrg` DISABLE KEYS */;
INSERT INTO `keu_kelompokbrg` VALUES (1,1,'Komputer'),(2,1,'Proyektor'),(3,2,'Mobil'),(4,2,'Motor'),(5,2,'Sepeda'),(6,3,'bulpoin');
/*!40000 ALTER TABLE `keu_kelompokbrg` ENABLE KEYS */;

#
# Structure for table "keu_modul"
#

DROP TABLE IF EXISTS `keu_modul`;
CREATE TABLE `keu_modul` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "keu_modul"
#

/*!40000 ALTER TABLE `keu_modul` DISABLE KEYS */;
INSERT INTO `keu_modul` VALUES (2,3,2,2,'Pendaftaran Tahun Ajaran 2014-2015',14,0,0,0,0,''),(3,3,2,2,'Pendaftaran Tahun Ajaran 2014-2015',6,194,0,0,0,'Kaitlynn Tiffany'),(4,1,3,3,'Uang pangkal angkatan 2013',6,194,29,0,0,'DPP'),(5,1,1,1,'Uang sekolah tahun ajaran 2014-2015 (Aktif)',1,203,29,0,0,''),(6,1,3,8,'Uang pangkal angkatan 2016',3,4,3,0,0,''),(7,1,3,2,'Uang pangkal angkatan 2014',1,1,1,0,0,'ok');
/*!40000 ALTER TABLE `keu_modul` ENABLE KEYS */;

#
# Structure for table "keu_modulpembayaran"
#

DROP TABLE IF EXISTS `keu_modulpembayaran`;
CREATE TABLE `keu_modulpembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katmodulpembayaran` int(11) NOT NULL DEFAULT '0',
  `angkatan` int(10) NOT NULL DEFAULT '0',
  `semester` int(11) NOT NULL,
  `bulan` int(2) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

#
# Data for table "keu_modulpembayaran"
#

/*!40000 ALTER TABLE `keu_modulpembayaran` DISABLE KEYS */;
INSERT INTO `keu_modulpembayaran` VALUES (41,2,1,0,0,'Registration Angkatan 2015',1,194,22,'keterangan '),(42,3,1,18,0,'Material Fee Semester 1 Th. Ajaran 2015-2016',1,203,0,''),(44,1,1,18,7,'Tuition Fee Semester 1 th. Ajaran 2015-2016',1,0,0,''),(45,3,1,2,0,'Material Fee Semester 2 Th. Ajaran 2015-2016',1,0,0,'');
/*!40000 ALTER TABLE `keu_modulpembayaran` ENABLE KEYS */;

#
# Structure for table "keu_nominalanggaran"
#

DROP TABLE IF EXISTS `keu_nominalanggaran`;
CREATE TABLE `keu_nominalanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(10) NOT NULL,
  `bulan` int(2) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=latin1;

#
# Data for table "keu_nominalanggaran"
#

INSERT INTO `keu_nominalanggaran` VALUES (203,37,1,10000000000),(204,37,2,10000000000),(205,37,3,10000000000),(206,37,4,10000000000),(207,37,5,10000000000),(208,37,6,10000000000),(209,37,7,10000000000),(210,37,8,10000000000),(211,37,9,10000000000),(212,37,10,10000000000),(213,37,11,10000000000),(214,37,12,10000000000),(231,39,1,46250),(232,39,2,46250),(233,39,3,46250),(234,39,4,46250),(235,39,5,46250),(236,39,6,46250),(237,39,7,46250),(238,39,8,46250),(239,39,9,46250),(240,39,10,46250),(241,39,11,46250),(242,39,12,46250),(243,40,1,10000),(244,40,2,10000),(245,40,3,10000),(246,40,4,10000),(247,40,5,10000),(248,40,6,10000),(249,40,7,10000),(250,40,8,10000),(251,40,9,10000),(252,40,10,10000),(253,40,11,10000),(254,40,12,10000),(255,41,1,30000),(256,41,2,30000),(257,41,3,30000),(258,41,4,30000),(259,41,5,30000),(260,41,6,30000),(261,41,7,30000),(262,41,8,30000),(263,41,9,30000),(264,41,10,30000),(265,41,11,30000),(266,41,12,30000),(267,42,1,1000000),(268,42,2,1000000),(269,42,3,1000000),(270,42,4,1000000),(271,42,5,1000000),(272,42,6,1000000),(273,42,7,1000000),(274,42,8,1000000),(275,42,9,1000000),(276,42,10,1000000),(277,42,11,1000000),(278,42,12,1000000),(279,43,1,20833333),(280,43,2,20833333),(281,43,3,20833333),(282,43,4,20833333),(283,43,5,20833333),(284,43,6,20833333),(285,43,7,20833333),(286,43,8,20833333),(287,43,9,20833333),(288,43,10,20833333),(289,43,11,20833333),(290,43,12,20833333),(291,44,1,416667),(292,44,2,416667),(293,44,3,416667),(294,44,4,416667),(295,44,5,416667),(296,44,6,416667),(297,44,7,416667),(298,44,8,416667),(299,44,9,416667),(300,44,10,416667),(301,44,11,416667),(302,44,12,416667),(303,45,1,10000),(304,45,2,10000),(305,45,3,10000),(306,45,4,10000),(307,45,5,10000),(308,45,6,10000),(309,45,7,10000),(310,45,8,10000),(311,45,9,10000),(312,45,10,10000),(313,45,11,10000),(314,45,12,10000),(315,0,1,0),(316,0,2,0),(317,0,3,0),(318,0,4,0),(319,0,5,0),(320,0,6,0),(321,0,7,0),(322,0,8,0),(323,0,9,0),(324,0,10,0),(325,0,11,54433360),(326,0,12,7675540);

#
# Structure for table "keu_pembayaran"
#

DROP TABLE IF EXISTS `keu_pembayaran`;
CREATE TABLE `keu_pembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modul` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `lunas` enum('0','1') NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3653 DEFAULT CHARSET=latin1;

#
# Data for table "keu_pembayaran"
#

/*!40000 ALTER TABLE `keu_pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `keu_pembayaran` ENABLE KEYS */;

#
# Structure for table "keu_penerimaan"
#

DROP TABLE IF EXISTS `keu_penerimaan`;
CREATE TABLE `keu_penerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "keu_penerimaan"
#

/*!40000 ALTER TABLE `keu_penerimaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `keu_penerimaan` ENABLE KEYS */;

#
# Structure for table "keu_penerimaanbrg"
#

DROP TABLE IF EXISTS `keu_penerimaanbrg`;
CREATE TABLE `keu_penerimaanbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomerbukti` varchar(100) NOT NULL,
  `kodebrg` varchar(50) NOT NULL,
  `namabrg` varchar(100) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `satuan` varchar(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "keu_penerimaanbrg"
#

/*!40000 ALTER TABLE `keu_penerimaanbrg` DISABLE KEYS */;
INSERT INTO `keu_penerimaanbrg` VALUES (1,'AAA','ELKO001','',2,'unit',0),(2,'BBB','101','',1,'unit',20000),(3,'AA001','ELKO001','Macbook pro 15 inch',2,'unit',12000000),(4,'BB101','KEMTR0001','Supra X 125',1,'unit',15000000),(5,'AS989','ELKO001','Macbook pro 15 inch',1,'unit',12000000),(6,'ASD123','KEMTR0001','Supra X 125',1,'unit',18000000),(7,'ASDW123','ELKO001','Macbook pro 15 inch',1,'unit',12000000);
/*!40000 ALTER TABLE `keu_penerimaanbrg` ENABLE KEYS */;

#
# Structure for table "keu_rekening"
#

DROP TABLE IF EXISTS `keu_rekening`;
CREATE TABLE `keu_rekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirek` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;

#
# Data for table "keu_rekening"
#

/*!40000 ALTER TABLE `keu_rekening` DISABLE KEYS */;
INSERT INTO `keu_rekening` VALUES (1,1,'111101','KAS KECIL ',NULL,''),(2,1,'111102','KAS SATELIT',NULL,''),(3,1,'111103','KAS KERTAJAYA',NULL,''),(4,1,'111104','KAS RUNGKUT',NULL,''),(5,1,'111199','KAS DALAM PERJALANAN',NULL,''),(6,2,'111201','BCA AC NO. 5560060001',NULL,''),(7,2,'111202','BANK EKONOMI AC NO. 3031861275',NULL,''),(8,2,'111203','BCA AC NO. 4683800000',NULL,''),(9,2,'111204','DEPOSITO EKONOMI',NULL,''),(10,2,'111205','BANK MAYAPADA AC NO.201.300.17.000',NULL,''),(11,2,'111206','CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)',NULL,''),(12,2,'111207','DEPOSITO MAYAPADA/PANIN/CIMB',NULL,''),(13,2,'111208','DEPOSITO PANINBANK',NULL,''),(14,2,'111209','PANINBANK AC NO.448.50.8888.7',NULL,''),(15,2,'111210','MANDARI AC NO. 1420088800098',NULL,''),(16,2,'111211','BANK BCA 8290960101',NULL,''),(17,2,'111299','BANK DALAM PERJALANAN',NULL,''),(18,3,'111900','AYAT SILANG KAS DAN BANK',NULL,''),(19,3,'112100','TABUNGAN',NULL,''),(20,3,'112200','DEPOSITO BERJANGKA',NULL,''),(21,3,'112300','SURAT-SURAT BERHARGA',NULL,''),(22,3,'113100','PIUTANG USAHA',NULL,''),(23,3,'113200','PIUTANG YANG BELUM DIFAKTURKAN',NULL,''),(24,3,'113300','PIUTANG CEK/GIRO MUNDUR',NULL,''),(25,3,'113400','CADANGAN PIUTANG RAGU-RAGU',NULL,''),(26,3,'113500','PIUTANG DIREKSI',NULL,''),(27,3,'113600','PIUTANG KARYAWAN',NULL,''),(28,3,'113700','PIUTANG PIHAK III',NULL,''),(29,3,'113999','PIUTANG LAIN-LAIN',NULL,''),(30,3,'114100','UANG MUKA PEMBELIAN',NULL,''),(31,3,'114901','TANAH',NULL,''),(32,3,'114902','KENDARAAN',NULL,''),(33,3,'114903','MESIN DAN PERALATAN',NULL,''),(34,3,'114904','BANGUNAN',NULL,''),(35,3,'114905','INVENTARIS',NULL,''),(36,3,'114906','UANG MUKA PERJALANAN',NULL,''),(37,3,'114999','LAIN-LAIN',NULL,''),(38,3,'116121','PPH PASAL 21',NULL,''),(39,3,'116122','PPH PASAL 22',NULL,''),(40,3,'116123','PPH PASAL 23',NULL,''),(41,3,'116125','PPH PASAL 25',NULL,''),(42,3,'116126','PPH PASAL 26',NULL,''),(43,3,'116151','PPN MASUKAN YANG SUDAH DIKREDITKAN',NULL,''),(44,3,'116152','PPN MASUKAN YANG BELUM DIKREDITKAN',NULL,''),(45,3,'116201','ASURANSI',NULL,''),(46,3,'116202','SEWA',NULL,''),(47,3,'116203','BUNGA LEASING',NULL,''),(48,3,'116204','ONGKOS ANGKUT',NULL,''),(49,3,'116299','LAIN-LAIN',NULL,''),(50,3,'121000','PENYERTAAN DALAM SURAT BERHARGA',NULL,''),(51,3,'122000','PENYERTAAN DALAM AKTIVA TETAP',NULL,''),(52,3,'123000','PENYERTAAN LAIN-LAIN',NULL,''),(53,3,'141100','TANAH KANTOR',NULL,''),(54,3,'141251','PRASARANA JALAN',NULL,''),(55,3,'141252','PRASARANA SALURAN AIR',NULL,''),(56,3,'141253','PRASARANA TAMAN',NULL,''),(57,3,'141301','INSTALASI LISTRIK',NULL,''),(58,3,'141302','INSTALASI AIR',NULL,''),(59,3,'141303','INSTALASI TELEPON',NULL,''),(60,3,'141401','MESIN-MESIN',NULL,''),(61,3,'141451','MESIN-MESIN LEASING',NULL,''),(62,3,'141501','KENDARAAN',NULL,''),(63,3,'141551','KENDARAAN LEASING KANTOR',NULL,''),(64,3,'141601','INVENTARIS',NULL,''),(65,3,'145201','AKUM. PENY. BANGUNAN KANTOR',NULL,''),(66,3,'145202','AKUM. PENY. BANGUNAN KANTIN',NULL,''),(67,3,'145203','AKUM. PENY. BANGUNAN MESS',NULL,''),(68,3,'145251','AKUM. PENY. PRASARANA JALAN',NULL,''),(69,3,'145252','AKUM. PENY. PRASARANA SALURAN AIR',NULL,''),(70,3,'145253','AKUM. PENY. PRASARANA TAMAN',NULL,''),(71,3,'145301','AKUM. PENY. INSTALASI LISTRIK',NULL,''),(72,3,'145302','AKUM. PENY. INSTALASI AIR',NULL,''),(73,3,'145303','AKUM. PENY. INSTALASI TELPON',NULL,''),(74,3,'145401','AKUM. PENY. KENDARAAN KANTOR',NULL,''),(75,3,'145451','AKUM. PENY. KENDARAAN LEASING KANTOR',NULL,''),(76,3,'145501','AKUM. PENY. INVENTARIS KANTOR',NULL,''),(77,3,'145502','AKUM. PENY. INVENTARIS KANTIN',NULL,''),(78,3,'151000','GOODWILL',NULL,''),(79,3,'152000','HAK PATEN',NULL,''),(80,3,'153000','LISENSI',NULL,''),(81,3,'154000','AKTIVA TIDAK BERWUJUD LAIN-LAIN',NULL,''),(82,3,'161101','BIAYA PENDIRIAN',NULL,''),(83,3,'161102','GAJI, TUNJANGAN',NULL,''),(84,3,'161103','BIAYA PERJALANAN DINAS',NULL,''),(85,3,'161104','ALAT TULIS & KEPERLUAN KANTOR',NULL,''),(86,3,'161105','IJIN, LEGAL DAN PROFESIONAL FEE',NULL,''),(87,3,'161106','ENTERTAINMENT,REPRESEN,SUMBANGAN',NULL,''),(88,3,'161107','TELEPON, FAX, TELEGRAM, KIRIM SURAT',NULL,''),(89,3,'161108','BENSIN, PARKIR, TOL',NULL,''),(90,3,'161109','BIAYA ADMINISTRASI BANK',NULL,''),(91,3,'161110','BAHAN PENOLONG',NULL,''),(92,3,'161111','BIAYA IKLAN',NULL,''),(93,3,'161112','PAJAK-PAJAK',NULL,''),(94,3,'161113','REKENING LISTRIK, AIR',NULL,''),(95,3,'161114','BIAYA STNK, BBN, DLL',NULL,''),(96,3,'161115','BUNGA, FEE, PROVISI BANK, DLL',NULL,''),(97,3,'161116','BIAYA PERESMIAN',NULL,''),(98,3,'161117','BIAYA BAHAN BAKAR',NULL,''),(99,3,'161118','REPARASI & PEMELIHARAAN KANTOR',NULL,''),(100,3,'161119','TRAINING, SEMINAR, TEST, DLL',NULL,''),(101,3,'161120','BIAYA MAKAN DAN MINUM',NULL,''),(102,3,'161121','PPH PASAL 21',NULL,''),(103,3,'161122','PPH PASAL 22',NULL,''),(104,3,'161123','PPH PASAL 23',NULL,''),(105,3,'161124','REPARASI & PEMELIHARAAN KENDARAAN',NULL,''),(106,3,'161125','REPARASI & PEMELIHARAAN MESS',NULL,''),(107,3,'161126','REPARASI & PEMELIHARAAN TANKI',NULL,''),(108,3,'161127','BIAYA PENGURUSAN LISTRIK',NULL,''),(109,3,'161128','REPARASI & PEMELIHARAAN BOTOL',NULL,''),(110,3,'161129','BIAYA SEWA GEDUNG',NULL,''),(111,3,'161130','BIAYA BUNGA LEASING',NULL,''),(112,3,'161143','SELISIH KURS',NULL,''),(113,3,'161144','BIAYA BUNGA PINJAMAN',NULL,''),(114,3,'161145','IURAN DAN ASURANSI',NULL,''),(115,3,'161146','BIAYA KEAMANAN',NULL,''),(116,3,'161148','BIAYA PRA-OPERASI LAIN-LAIN',NULL,''),(117,3,'161151','PENDAPATAN JASA GIRO',NULL,''),(118,3,'161152','PENDAPATAN BUNGA DEPOSITO',NULL,''),(119,3,'161153','PENDAPATAN BUNGA BANK',NULL,''),(120,3,'161154','PENDAPATAN BUNGA PIHAK III',NULL,''),(121,3,'161199','PENDAPATAN PRA-OPERASI LAIN-LAIN',NULL,''),(122,3,'161500','AKUM.AMORTISASI BIAYA PRA-OPERASI',NULL,''),(123,3,'162100','UANG JAMINAN LISTRIK',NULL,''),(124,3,'162200','UANG JAMINAN TELEPON',NULL,''),(125,3,'163000','BIAYA YANG DITANGGUHKAN',NULL,''),(126,3,'164000','BUNGA DALAM MASA KONSTRUKSI (IDC)',NULL,''),(127,3,'165201','BANGUNAN ',NULL,''),(128,3,'165301','INSTALASI LISTRIK',NULL,''),(129,3,'165302','INSTALASI AIR',NULL,''),(130,3,'165303','INSTALASI TELEPON',NULL,''),(131,3,'166000','BIAYA PENELITIAN DAN PENGEMBANGAN',NULL,''),(132,3,'169000','AKTIVA LAIN-LAIN',NULL,''),(133,4,'211101','BANK',NULL,''),(134,4,'211201','BANK',NULL,''),(135,4,'211501','BANK',NULL,''),(136,4,'211601','BANK',NULL,''),(137,4,'212100','HUTANG USAHA',NULL,''),(138,4,'212200','HUTANG YANG BELUM DIFAKTURKAN',NULL,''),(139,4,'212300','HUTANG CEK/BILYET GIRO MUNDUR',NULL,''),(140,4,'212901','HUTANG PIHAK KETIGA',NULL,''),(141,4,'212902','HUTANG PERSEDIAAN',NULL,''),(142,4,'212903','HUTANG KENDARAAN',NULL,''),(143,4,'212904','HUTANG BANGUNAN',NULL,''),(144,4,'212905','HUTANG INVENTARIS',NULL,''),(145,4,'212906','HUTANG VOUCHER',NULL,''),(146,4,'212907','HUTANG KPD GKA ELYON',NULL,''),(147,4,'212999','LAIN-LAIN',NULL,''),(148,4,'213100','UANG MUKA PENJUALAN',NULL,''),(149,4,'213900','UANG MUKA LAIN-LAIN',NULL,''),(150,4,'214104','PPH PASAL 4 AYAT 2',NULL,''),(151,4,'214121','PPH PASAL 21',NULL,''),(152,4,'214122','PPH PASAL 22',NULL,''),(153,4,'214123','PPH PASAL 23',NULL,''),(154,4,'214125','PPH PASAL 25',NULL,''),(155,4,'214126','PPH PASAL 26',NULL,''),(156,4,'214129','PPH PASAL 29',NULL,''),(157,4,'214151','PPN KELUARAN YANG SUDAH DIFAKTURKAN',NULL,''),(158,4,'214152','PPN KELUARAN YANG BELUM DIFAKTURKAN',NULL,''),(159,4,'214201','BUNGA',NULL,''),(160,4,'214202','SEWA',NULL,''),(161,4,'214203','GAJI DAN HONOR',NULL,''),(162,4,'214204','MAKAN DAN LEMBUR',NULL,''),(163,4,'214205','LISTRIK',NULL,''),(164,4,'214206','TUNJANGAN TRANSPORT-MAINTENANCE',NULL,''),(165,4,'214207','TELEPON',NULL,''),(166,4,'214208','SURAT KABAR/MAJALAH',NULL,''),(167,4,'214209','KOMISI',NULL,''),(168,4,'214210','BIAYA ADMINISTRASI BANK',NULL,''),(169,4,'214211','PAJAK WAPU/WAJIB PUNGUT',NULL,''),(170,4,'214212','JAMSOSTEK',NULL,''),(171,4,'214213','PREMI DISTRIBUSI',NULL,''),(172,4,'214214','ONGKOS ANGKUT',NULL,''),(173,4,'214299','LAIN-LAIN',NULL,''),(174,4,'215121','PPH PASAL 21',NULL,''),(175,4,'215122','PPH PASAL 22',NULL,''),(176,4,'215123','PPH PASAL 23',NULL,''),(177,4,'215125','PPH PASAL 25',NULL,''),(178,4,'215201','PPN KELUARAN',NULL,''),(179,4,'215202','PPN EKS KEPPRES',NULL,''),(180,4,'216101','HUTANG LEASING KENDARAAN',NULL,''),(181,4,'219101','HUTANG DEVIDEN',NULL,''),(182,4,'219199','LAIN-LAIN',NULL,''),(183,4,'221101','BANK',NULL,''),(184,4,'221201','BANK',NULL,''),(185,4,'22210','HUTANG LEASING KENDARAAN',NULL,''),(186,4,'223000','HUTANG PADA PEMEGANG SAHAM',NULL,''),(187,4,'230000','HUTANG LAIN - LAIN',NULL,''),(188,4,'240000','HUTANG YG. DISUBORDINASI',NULL,''),(189,4,'250000','KEWAJIBAN BERSYARAT',NULL,''),(190,5,'311101','TIDAK TERIKAT',NULL,''),(191,5,'312101','TEMPORER...........',NULL,''),(192,5,'312201','PERMANEN......',NULL,''),(193,6,'411101','DANA DARI DONATUR',NULL,''),(194,6,'411102','DPP (DANA PEMBANGUNAN & PENGEMBANGAN)',NULL,''),(195,6,'411103','DANA JOINING',NULL,''),(196,6,'411104','DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)',NULL,''),(197,6,'411105','DANA STUDENT EXCHANGE',NULL,''),(198,6,'411201','SUMBANGAN TERIKAT TEMPORER',NULL,''),(199,6,'411202','SUMBANGAN TERIKAT PERMANEN',NULL,''),(200,6,'412101','PENJUALAN FORMULIR + PSIKOTES',NULL,''),(201,6,'412102','UANG KEG. EKSTRAKURIKULER',NULL,''),(202,6,'412103','UANG PENDAFTARAN ULANG',NULL,''),(203,6,'412104','UANG SEKOLAH',NULL,''),(204,6,'412105','PENDAPATAN PENJUALAN SERAGAM',NULL,''),(205,6,'412106','PENDAPATAN PENJUALAN BUKU',NULL,''),(206,6,'412107','PENDAPATAN PENJUALAN CD/VCD/DVD',NULL,''),(207,6,'412108','PENDAPATAN LAIN-LAIN',NULL,''),(208,6,'412109','PENDAPATAN LUNCH',NULL,''),(209,6,'412110','PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE',NULL,''),(210,6,'412111','DENDA KETERLAMBATAN BAYAR UANG SEKOLAH',NULL,''),(211,6,'412112','PENDAPATAN CHECK POINT',NULL,''),(212,6,'412113','PENDAPATAN UJIAN HSK',NULL,''),(213,6,'412114','PENDAPATAN DAY CARE',NULL,''),(214,6,'421101','PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG',NULL,''),(215,6,'421102','PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN',NULL,''),(216,6,'421103','PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ',NULL,''),(217,6,'421201','PENGHASILAN INVESTASI TERIKAT TEMPORER',NULL,''),(218,6,'421202','PENGHASILAN INVESTASI TERIKAT PERMANEN',NULL,''),(219,7,'511101','GAJI',NULL,''),(220,7,'511102','HONOR',NULL,''),(221,7,'511103','LEMBUR',NULL,''),(222,7,'511104','PESANGON',NULL,''),(223,7,'511105','UANG MAKAN',NULL,''),(224,7,'511106','BONUS',NULL,''),(225,7,'511107','TUNJANGAN HARI RAYA',NULL,''),(226,7,'511108','PPH PASAL 21',NULL,''),(227,7,'511109','KESEJAHTERAAN KARYAWAN',NULL,''),(228,7,'511110','JAMINAN KECELAKAAN KERJA ( JKK )',NULL,''),(229,7,'511111','JAMINAN KEMATIAN ( JKM )',NULL,''),(230,7,'511112','JAMINAN HARI TUA ( JHT )',NULL,''),(231,7,'511113','JAMINAN PEMELIHARAAN KESEHATAN (JPK)',NULL,''),(232,7,'511114','TUNJANGAN DANA PENSIUN',NULL,''),(233,7,'511115','TUNJANGAN KESEHATAN',NULL,''),(234,7,'511116','TUNJANGAN TRANSPORT',NULL,''),(235,7,'511117','JAMSOSTEK',NULL,''),(236,7,'511119','PREMI ',NULL,''),(237,7,'511199','TUNJANGAN LAIN-LAIN',NULL,''),(238,7,'512101','BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA',NULL,''),(239,7,'512102','BI.BAHAN PERB. & PEMELIHARAAN KEND.',NULL,''),(240,7,'512103','BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS',NULL,''),(241,7,'512199','BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN',NULL,''),(242,7,'512201','PENYUSUTAN BANGUNAN & PRASARANA',NULL,''),(243,7,'512202','PENYUSUTAN KENDARAAN',NULL,''),(244,7,'512203','PENYUSUTAN INVENTARIS',NULL,''),(245,7,'512204','PENYUSUTAN INSTALASI',NULL,''),(246,7,'512301','TRANSPORTASI ( BENSIN, TIKET )',NULL,''),(247,7,'512302','MAKANAN & MINUMAN',NULL,''),(248,7,'512303','PENGINAPAN',NULL,''),(249,7,'512304','UANG SAKU',NULL,''),(250,7,'512399','LAIN-LAIN ( PARKIR, TOL )',NULL,''),(251,7,'512401','SEWA BANGUNAN',NULL,''),(252,7,'512402','SEWA KENDARAAN',NULL,''),(253,7,'512403','SEWA INVENTARIS KANTOR',NULL,''),(254,7,'512451','ASURANSI BANGUNAN',NULL,''),(255,7,'512452','ASURANSI KENDARAAN',NULL,''),(256,7,'512453','ASURANSI INVENTARIS',NULL,''),(257,7,'512501','TELEPON',NULL,''),(258,7,'512502','TELEX',NULL,''),(259,7,'512503','TELEGRAM',NULL,''),(260,7,'512504','INTERLOKAL NON TELEPON INTERN',NULL,''),(261,7,'512505','FACSIMILE',NULL,''),(262,7,'512599','LAIN - LAIN',NULL,''),(263,7,'512601','AIR',NULL,''),(264,7,'512602','LISTRIK',NULL,''),(265,7,'512603','ALAT-ALAT LISTRIK',NULL,''),(266,7,'512701','AKUNTAN',NULL,''),(267,7,'512702','NOTARIS',NULL,''),(268,7,'512703','KONSULTAN',NULL,''),(269,7,'512704','MANAGEMENT FEE',NULL,''),(270,7,'512801','ADMINISTRASI BANK',NULL,''),(271,7,'512802','BUKU CEK / BG',NULL,''),(272,7,'512803','TRANSFER, KIRIM UANG , INKASO',NULL,''),(273,7,'512804','PAJAK BUNGA BANK',NULL,''),(274,7,'512901','BIAYA ADMINISTRASI KENDARAAN',NULL,''),(275,7,'512902','BIAYA BUNGA ANGSURAN KENDARAAN',NULL,''),(276,7,'512903','BIAYA BUNGA KREDIT BANK',NULL,''),(277,7,'513101','ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR',NULL,''),(278,7,'513102','PERANGKO, MATERAI, KIRIM SURAT',NULL,''),(279,7,'513103','FOTOCOPY/LAMINATING/CETAK FOTO',NULL,''),(280,7,'513104','ALAT - ALAT PENGAJARAN ',NULL,''),(281,7,'513105','PERLENGKAPAN KELAS',NULL,''),(282,7,'513106','JASA PEMBELAJARAN',NULL,''),(283,7,'513201','PERIJINAN',NULL,''),(284,7,'513202','PAJAK - PAJAK DAERAH,PBB',NULL,''),(285,7,'513203','STNK',NULL,''),(286,7,'513211','RETRIBUSI SAMPAH',NULL,''),(287,7,'513301','SUMBANGAN',NULL,''),(288,7,'513302','ENTERTAINMENT',NULL,''),(289,7,'513303','JAMUAN ',NULL,''),(290,7,'513401','KEAMANAN',NULL,''),(291,7,'513501','PENDAFTARAN',NULL,''),(292,7,'513502','IURAN',NULL,''),(293,7,'513601','BIAYA PENGOBATAN',NULL,''),(294,7,'513701','MAKANAN DAN MINUMAN',NULL,''),(295,7,'513702','BAHAN BAKAR DAN PARKIR/TRANSPORT',NULL,''),(296,7,'513703','SERAGAM ',NULL,''),(297,7,'513704','SEWA DISPENSER',NULL,''),(298,7,'513705','OLAH RAGA DAN KESENIAN',NULL,''),(299,7,'513706','BIAYA TRAINING, SEMINAR DAN STUDI BANDING',NULL,''),(300,7,'513707','BUKU, VCD',NULL,''),(301,7,'513708','ATRIBUT SEKOLAH',NULL,''),(302,7,'513709','BIAYA PSIKOTES',NULL,''),(303,7,'513710','BIAYA ADVERTENSI ( IKLAN )',NULL,''),(304,7,'513711','BIAYA STUDY TOUR',NULL,''),(305,7,'513712','BIAYA PERLOMBAAN & PERAYAAN',NULL,''),(306,7,'513713','STIKER U/ MURID',NULL,''),(307,7,'513714','BIAYA TES KESEHATAN',NULL,''),(308,7,'513715','BIAYA KOMISI PENGEMBANGAN',NULL,''),(309,7,'513716','BIAYA PAMERAN',NULL,''),(310,7,'513799','LAIN - LAIN',NULL,''),(311,7,'513801','KANTIN',NULL,''),(312,7,'513802','DAPUR',NULL,''),(313,7,'513803','BIAYA KEBERSIHAN',NULL,''),(314,7,'513804','BIAYA KEPERLUAN KEBUN/TAMAN',NULL,''),(315,7,'513805','JASA CLEANING SERVICE',NULL,''),(316,7,'513806','',NULL,''),(317,7,'513807','BIAYA MESS',NULL,''),(318,7,'513901','SELAMATAN',NULL,''),(319,7,'513902','BIAYA PENGURUSAN SURAT LAIN - LAIN',NULL,''),(320,7,'513903','DENDA PAJAK',NULL,''),(321,7,'513904','KOREKSI TAHUN LALU',NULL,''),(322,7,'513998','LAIN - LAIN (SELISIH KURS)',NULL,''),(323,7,'513999','LAIN - LAIN (SELISIH KAS)',NULL,''),(324,7,'514001','TRANSPORT',NULL,''),(325,7,'514002','MAKAN & MINUM (RAPAT)',NULL,''),(326,7,'514099','LAIN-LAIN',NULL,''),(327,7,'514101','BUKU',NULL,''),(328,7,'514102','VCD',NULL,''),(329,7,'514103','SERAGAM ',NULL,''),(330,7,'514104','ATRIBUT SEKOLAH',NULL,''),(331,7,'514105','BIAYA PSIKOTES',NULL,''),(332,7,'514106','BIAYA STUDY TOUR/FIELD TRIP',NULL,''),(333,7,'514107','BIAYA PERLOMBAAN ',NULL,''),(334,7,'514108','EKSTRAKURIKULER',NULL,''),(335,7,'514109','BIAYA STUDENT EXCHANGE',NULL,''),(336,7,'514110','BIAYA CHECK POINT',NULL,''),(337,7,'514199','LAIN - LAIN',NULL,''),(340,1,'111109','test rekening dua x',5500000,'keterangan tes dua');
/*!40000 ALTER TABLE `keu_rekening` ENABLE KEYS */;

#
# Structure for table "keu_saldorekening"
#

DROP TABLE IF EXISTS `keu_saldorekening`;
CREATE TABLE `keu_saldorekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `rekening` int(10) NOT NULL,
  `tahunbuku` int(10) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `nominal2` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=latin1;

#
# Data for table "keu_saldorekening"
#

INSERT INTO `keu_saldorekening` VALUES (155,1,1,100000,785000),(160,6,1,100000,65000),(161,7,1,100000,100000),(162,8,1,100000,100000),(163,9,1,100000,100000),(164,10,1,100000,100000),(165,11,1,100000,100000),(166,12,1,100000,100000),(167,13,1,100000,100000),(168,14,1,100000,100000),(169,15,1,100000,100000),(170,16,1,100000,100000),(171,17,1,100000,100000),(172,18,1,100000,100000),(173,19,1,100000,100000),(174,20,1,100000,100000),(175,21,1,100000,100000),(176,22,1,100000,50000),(177,23,1,100000,100000),(178,24,1,100000,100000),(179,25,1,100000,95000),(180,26,1,100000,100000),(181,27,1,100000,100000),(182,28,1,100000,100000),(183,29,1,100000,100000),(184,30,1,100000,100000),(185,31,1,100000,100000),(186,32,1,100000,100000),(187,33,1,100000,100000),(188,34,1,100000,100000),(189,35,1,100000,100000),(190,36,1,100000,100000),(191,37,1,100000,100000),(192,38,1,100000,100000),(193,39,1,100000,100000),(194,40,1,100000,100000),(195,41,1,100000,100000),(196,42,1,100000,100000),(197,43,1,100000,100000),(198,44,1,100000,100000),(199,45,1,100000,100000),(200,46,1,100000,100000),(201,47,1,100000,100000),(202,48,1,100000,100000),(203,49,1,100000,100000),(204,50,1,100000,100000),(205,61,1,100000,100000),(206,62,1,100000,100000),(207,63,1,100000,100000),(208,64,1,100000,100000),(209,65,1,100000,100000),(210,66,1,100000,100000),(211,67,1,100000,100000),(212,68,1,100000,100000),(213,69,1,100000,100000),(214,70,1,100000,100000),(215,71,1,100000,100000),(216,72,1,100000,100000),(217,73,1,100000,100000),(218,74,1,100000,100000),(219,75,1,100000,100000),(220,76,1,100000,100000),(221,77,1,100000,100000),(222,78,1,100000,100000),(223,79,1,100000,100000),(224,80,1,100000,100000),(225,331,1,100000,100000),(226,332,1,100000,100000),(227,333,1,100000,100000),(228,334,1,100000,100000),(229,335,1,100000,100000),(230,336,1,100000,100000),(231,337,1,100000,100000),(232,340,1,100000,100000),(233,53,1,100000,100000),(234,54,1,100000,100000),(235,55,1,100000,100000),(236,56,1,100000,100000),(237,57,1,100000,100000),(238,58,1,100000,100000),(239,59,1,100000,100000),(240,60,1,100000,100000),(241,81,1,100000,100000),(242,82,1,100000,100000),(243,323,1,100000,100000),(244,324,1,100000,100000),(245,325,1,100000,100000),(246,326,1,100000,100000),(247,327,1,100000,100000),(248,328,1,100000,100000),(249,329,1,100000,100000),(250,330,1,100000,100000),(251,315,1,100000,100000),(252,316,1,100000,100000),(253,317,1,100000,100000),(254,318,1,100000,100000),(255,319,1,100000,100000),(256,320,1,100000,100000),(257,321,1,100000,100000),(258,322,1,100000,100000),(259,307,1,100000,100000),(260,308,1,100000,100000),(261,309,1,100000,100000),(262,310,1,100000,100000),(263,311,1,100000,100000),(264,312,1,100000,100000),(265,313,1,100000,100000),(266,314,1,100000,100000),(267,299,1,100000,100000),(268,300,1,100000,100000),(269,301,1,100000,100000),(270,302,1,100000,100000),(271,303,1,100000,100000),(272,304,1,100000,100000),(273,305,1,100000,100000),(274,306,1,100000,100000),(275,291,1,100000,100000),(276,292,1,100000,100000),(277,293,1,100000,100000),(278,294,1,100000,100000),(279,295,1,100000,100000),(280,296,1,100000,100000),(281,297,1,100000,100000),(282,298,1,100000,100000),(283,283,1,100000,100000),(284,284,1,100000,100000),(285,285,1,100000,100000),(286,286,1,100000,100000),(287,287,1,100000,100000),(288,288,1,100000,100000),(289,289,1,100000,100000),(290,290,1,100000,100000),(291,275,1,100000,100000),(292,276,1,100000,100000),(293,277,1,100000,100000),(294,278,1,100000,100000),(295,279,1,100000,100000),(296,280,1,100000,100000),(297,281,1,100000,100000),(298,282,1,100000,100000),(299,267,1,100000,100000),(300,268,1,100000,100000),(301,269,1,100000,100000),(302,270,1,100000,100000),(303,271,1,100000,100000),(304,272,1,100000,100000),(305,273,1,100000,100000),(306,274,1,100000,100000),(307,259,1,100000,100000),(308,260,1,100000,100000),(309,261,1,100000,100000),(310,262,1,100000,100000),(311,263,1,100000,100000),(312,264,1,100000,100000),(313,265,1,100000,100000),(314,266,1,100000,100000),(315,251,1,100000,100000),(316,252,1,100000,100000),(317,253,1,100000,100000),(318,254,1,100000,100000),(319,255,1,100000,100000),(320,256,1,100000,100000),(321,257,1,100000,100000),(322,258,1,100000,100000),(323,243,1,100000,100000),(324,244,1,100000,100000),(325,245,1,100000,100000),(326,246,1,100000,100000),(327,247,1,100000,100000),(328,248,1,100000,100000),(329,249,1,100000,100000),(330,250,1,100000,100000),(331,235,1,100000,100000),(332,236,1,100000,100000),(333,237,1,100000,100000),(334,238,1,100000,100000),(335,239,1,100000,100000),(336,240,1,100000,100000),(337,241,1,100000,100000),(338,242,1,100000,100000),(339,227,1,100000,100000),(340,228,1,100000,100000),(341,229,1,100000,100000),(342,230,1,100000,100000),(343,231,1,100000,100000),(344,232,1,100000,100000),(345,233,1,100000,100000),(346,234,1,100000,100000),(347,219,1,100000,100000),(348,220,1,100000,100000),(349,221,1,100000,100000),(350,222,1,100000,135000),(351,223,1,100000,100000),(352,224,1,100000,100000),(353,225,1,100000,100000),(354,226,1,100000,100000),(355,211,1,100000,100000),(356,212,1,100000,100000),(357,213,1,100000,100000),(358,214,1,100000,100000),(359,215,1,100000,100000),(360,216,1,100000,100000),(361,217,1,100000,100000),(362,218,1,100000,100000),(363,203,1,100000,30000),(364,204,1,100000,100000),(365,205,1,100000,100000),(366,206,1,100000,100000),(367,207,1,100000,100000),(368,208,1,100000,100000),(369,209,1,100000,100000),(370,210,1,100000,100000),(371,195,1,100000,100000),(372,196,1,100000,100000),(373,197,1,100000,100000),(374,198,1,100000,100000),(375,199,1,100000,100000),(376,200,1,100000,100000),(377,201,1,100000,100000),(378,202,1,100000,100000),(379,187,1,100000,100000),(380,188,1,100000,100000),(381,189,1,100000,100000),(382,190,1,100000,100000),(383,191,1,100000,100000),(384,192,1,100000,100000),(385,193,1,100000,-400000),(386,194,1,100000,100000),(387,179,1,100000,100000),(388,180,1,100000,100000),(389,181,1,100000,100000),(390,182,1,100000,100000),(391,183,1,100000,100000),(392,184,1,100000,100000),(393,185,1,100000,100000),(394,186,1,100000,100000),(395,171,1,100000,100000),(396,172,1,100000,100000),(397,173,1,100000,100000),(398,174,1,100000,100000),(399,175,1,100000,100000),(400,176,1,100000,100000),(401,177,1,100000,100000),(402,178,1,100000,100000),(403,163,1,100000,100000),(404,164,1,100000,100000),(405,165,1,100000,100000),(406,166,1,100000,100000),(407,167,1,100000,100000),(408,168,1,100000,100000),(409,169,1,100000,100000),(410,170,1,100000,100000),(411,155,1,100000,100000),(412,156,1,100000,100000),(413,157,1,100000,100000),(414,158,1,100000,100000),(415,159,1,100000,100000),(416,160,1,100000,100000),(417,161,1,100000,100000),(418,162,1,100000,100000),(419,147,1,100000,100000),(420,148,1,100000,100000),(421,149,1,100000,100000),(422,150,1,100000,100000),(423,151,1,100000,100000),(424,152,1,100000,100000),(425,153,1,100000,100000),(426,154,1,100000,100000),(427,139,1,100000,100000),(428,140,1,100000,100000),(429,141,1,100000,100000),(430,142,1,100000,100000),(431,143,1,100000,100000),(432,144,1,100000,100000),(433,145,1,100000,100000),(434,146,1,100000,100000),(435,131,1,100000,100000),(436,132,1,100000,100000),(437,133,1,100000,100000),(438,134,1,100000,100000),(439,135,1,100000,100000),(440,136,1,100000,100000),(441,137,1,100000,100000),(442,138,1,100000,100000),(443,123,1,100000,100000),(444,124,1,100000,100000),(445,125,1,100000,100000),(446,126,1,100000,100000),(447,127,1,100000,100000),(448,128,1,100000,100000),(449,129,1,100000,100000),(450,130,1,100000,100000),(451,115,1,100000,100000),(452,116,1,100000,100000),(453,117,1,100000,100000),(454,118,1,100000,100000),(455,119,1,100000,100000),(456,120,1,100000,100000),(457,121,1,100000,100000),(458,122,1,100000,100000),(459,107,1,100000,100000),(460,108,1,100000,100000),(461,109,1,100000,100000),(462,110,1,100000,100000),(463,111,1,100000,100000),(464,112,1,100000,100000),(465,113,1,100000,100000),(466,114,1,100000,100000),(467,99,1,100000,100000),(468,100,1,100000,100000),(469,101,1,100000,100000),(470,102,1,100000,100000),(471,103,1,100000,100000),(472,104,1,100000,100000),(473,105,1,100000,100000),(474,106,1,100000,100000),(475,91,1,100000,100000),(476,92,1,100000,100000),(477,93,1,100000,100000),(478,94,1,100000,100000),(479,95,1,100000,100000),(480,96,1,100000,100000),(481,97,1,100000,100000),(482,98,1,100000,100000),(483,83,1,100000,35000),(484,84,1,100000,100000),(485,85,1,100000,100000),(486,86,1,100000,100000),(487,87,1,100000,100000),(488,88,1,100000,100000),(489,89,1,100000,100000),(490,90,1,100000,100000),(491,51,1,100000,100000),(492,52,1,100000,100000);

#
# Structure for table "keu_tahunbuku"
#

DROP TABLE IF EXISTS `keu_tahunbuku`;
CREATE TABLE `keu_tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `kode` varchar(20) NOT NULL,
  `saldoawal` decimal(10,0) NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#
# Data for table "keu_tahunbuku"
#

/*!40000 ALTER TABLE `keu_tahunbuku` DISABLE KEYS */;
INSERT INTO `keu_tahunbuku` VALUES (1,'2014','2015-01-01','0000-00-00','',649100,'1',''),(5,'2015','2015-05-21','0000-00-00','',5000000,'0','tes');
/*!40000 ALTER TABLE `keu_tahunbuku` ENABLE KEYS */;

#
# Structure for table "keu_transaksi"
#

DROP TABLE IF EXISTS `keu_transaksi`;
CREATE TABLE `keu_transaksi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL DEFAULT '0',
  `nomer` varchar(50) NOT NULL,
  `nobukti` varchar(50) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `rekkas` int(10) unsigned NOT NULL DEFAULT '0',
  `rekitem` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `uraian` varchar(250) NOT NULL,
  `modul` int(10) unsigned NOT NULL DEFAULT '0',
  `kategori` int(10) unsigned NOT NULL DEFAULT '0',
  `pembayaran` int(10) unsigned NOT NULL DEFAULT '0',
  `penerimaanbrg` int(10) unsigned NOT NULL DEFAULT '0',
  `jenis` tinyint(4) NOT NULL DEFAULT '0',
  `budget` int(10) unsigned NOT NULL DEFAULT '0',
  `ct` int(10) unsigned NOT NULL DEFAULT '0',
  `detjenistrans` int(10) NOT NULL,
  `detilanggaran` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "keu_transaksi"
#

/*!40000 ALTER TABLE `keu_transaksi` DISABLE KEYS */;
INSERT INTO `keu_transaksi` VALUES (6,5,'BKM-0006/06/2015','BKM01','2015-06-05',1,193,500000,'Dari Donatur',0,0,0,0,0,0,0,4,0);
/*!40000 ALTER TABLE `keu_transaksi` ENABLE KEYS */;

#
# Structure for table "kon_aksi"
#

DROP TABLE IF EXISTS `kon_aksi`;
CREATE TABLE `kon_aksi` (
  `id_aksi` int(11) NOT NULL AUTO_INCREMENT,
  `aksi` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_aksi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "kon_aksi"
#

INSERT INTO `kon_aksi` VALUES (1,'r','read'),(2,'c','create'),(3,'u','update'),(4,'d','delete'),(5,'p','print/report');

#
# Structure for table "kon_grupmenu"
#

DROP TABLE IF EXISTS `kon_grupmenu`;
CREATE TABLE `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_katgrupmenu` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

#
# Data for table "kon_grupmenu"
#

INSERT INTO `kon_grupmenu` VALUES (1,2,1,'Menu Kesiswaan','four'),(2,2,1,'Menu Belajar - Mengajar','four'),(3,1,1,'Menu Master','four'),(4,1,2,'Menu Transaksi','four'),(5,2,6,'Menu Transaksi ','double'),(6,1,6,'Menu Master','double'),(7,1,9,'Menu Sistem','double'),(8,2,9,'Menu User','double'),(9,1,2,'Menu Master','four'),(14,1,3,'Menu Master ','double double-vertic'),(15,2,3,'Menu Transaksi','double double-vertic'),(16,1,5,'Master HRD','four'),(17,2,5,'Transaksi HRD','four'),(18,2,5,'Penggajian','four'),(19,1,7,'Master Student Service','four'),(20,2,7,'Pembelian','four'),(21,2,7,'Penjualan',''),(24,2,7,'Jasa','four'),(25,2,7,'Hutang / Piutang','four'),(26,2,7,'biaya','four'),(27,2,7,'Laporan','four'),(28,2,7,'Setting',''),(29,1,13,'Master PO','four'),(30,2,13,'Permintaan','four'),(31,1,13,'Penawaran','four'),(32,2,13,'Pemesanan','four'),(33,2,13,'Pembelian','four'),(34,2,13,'setting',''),(35,1,4,'Transaksi Sarpras','four'),(37,1,4,'Master Sarpras','four'),(38,1,14,'setting','four'),(39,2,14,'transaksi','four');

#
# Structure for table "kon_grupmodul"
#

DROP TABLE IF EXISTS `kon_grupmodul`;
CREATE TABLE `kon_grupmodul` (
  `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmodul`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "kon_grupmodul"
#

INSERT INTO `kon_grupmodul` VALUES (1,'satu','four'),(2,'dua','four'),(3,'tiga','four');

#
# Structure for table "kon_icon"
#

DROP TABLE IF EXISTS `kon_icon`;
CREATE TABLE `kon_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(25) NOT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Data for table "kon_icon"
#

INSERT INTO `kon_icon` VALUES (1,'akademik'),(2,'sarpras'),(3,'hrd'),(4,'psb'),(5,'keuangan'),(6,'student'),(7,'perpus'),(8,'manajemen'),(9,'pencil'),(10,'address-book'),(11,'book'),(12,'copy'),(13,'user-3'),(14,'user'),(15,'grid-view'),(16,'tab'),(17,'cog'),(18,'user-2'),(20,'loop');

#
# Structure for table "kon_katgrupmenu"
#

DROP TABLE IF EXISTS `kon_katgrupmenu`;
CREATE TABLE `kon_katgrupmenu` (
  `id_katgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `katgrupmenu` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_katgrupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "kon_katgrupmenu"
#

INSERT INTO `kon_katgrupmenu` VALUES (1,'M','Master'),(2,'T','Transaksi');

#
# Structure for table "kon_level"
#

DROP TABLE IF EXISTS `kon_level`;
CREATE TABLE `kon_level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

#
# Data for table "kon_level"
#

INSERT INTO `kon_level` VALUES (17,'SA',1,'Super Admin'),(18,'A+',2,'Admin Plus'),(19,'A',3,'Admin'),(20,'O',4,'Operator'),(21,'G',5,'Guest');

#
# Structure for table "kon_levelkatgrupmenu"
#

DROP TABLE IF EXISTS `kon_levelkatgrupmenu`;
CREATE TABLE `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_levelkatgrupmenu`),
  KEY `id_level` (`id_level`),
  KEY `id_katgrupmenu` (`id_katgrupmenu`),
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_2` FOREIGN KEY (`id_katgrupmenu`) REFERENCES `kon_katgrupmenu` (`id_katgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

#
# Data for table "kon_levelkatgrupmenu"
#

INSERT INTO `kon_levelkatgrupmenu` VALUES (53,17,1,1),(54,17,1,0),(55,17,2,1),(56,17,2,0),(57,18,1,1),(58,18,1,0),(59,18,2,1),(60,18,2,0),(61,19,1,1),(62,19,1,0),(63,19,2,1),(64,19,2,0),(65,20,1,1),(66,20,1,0),(67,20,2,1),(68,20,2,0),(69,21,1,1),(70,21,1,0),(71,21,2,1),(72,21,2,0);

#
# Structure for table "kon_levelaksi"
#

DROP TABLE IF EXISTS `kon_levelaksi`;
CREATE TABLE `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_levelaksi`),
  KEY `id_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  KEY `id_aksi` (`id_aksi`),
  CONSTRAINT `kon_levelaksi_ibfk_1` FOREIGN KEY (`id_levelkatgrupmenu`) REFERENCES `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kon_levelaksi_ibfk_2` FOREIGN KEY (`id_aksi`) REFERENCES `kon_aksi` (`id_aksi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=latin1;

#
# Data for table "kon_levelaksi"
#

INSERT INTO `kon_levelaksi` VALUES (221,53,1),(222,54,1),(223,53,2),(224,54,2),(225,53,3),(226,54,3),(227,53,4),(228,54,4),(229,53,5),(230,54,5),(231,55,1),(232,56,1),(233,55,2),(234,56,2),(235,55,3),(236,56,3),(237,55,4),(238,56,4),(239,55,5),(240,56,5),(355,57,1),(356,58,1),(357,57,2),(358,57,3),(359,57,4),(360,57,5),(361,58,5),(362,59,1),(363,60,1),(364,59,2),(365,59,3),(366,59,4),(367,59,5),(368,60,5),(419,61,1),(420,61,2),(421,61,3),(422,61,4),(423,61,5),(424,63,1),(425,63,2),(426,63,3),(427,63,4),(428,63,5),(442,67,1),(443,67,2),(444,67,3),(445,67,4),(446,67,5),(448,71,1),(449,71,5);

#
# Structure for table "kon_login"
#

DROP TABLE IF EXISTS `kon_login`;
CREATE TABLE `kon_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `kon_login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

#
# Data for table "kon_login"
#

INSERT INTO `kon_login` VALUES (42,'a','a','MGNjMTc1YjljMGYxYjZhODMxYzM5OWUyNjk3NzI2NjE=',19,0,'','','0000-00-00 00:00:00'),(44,'g','g','YjJmNWZmNDc0MzY2NzFiNmU1MzNkOGRjMzYxNDg0NWQ=',21,0,'1','','0000-00-00 00:00:00'),(45,'adm+ akademik','aaka','Yzg5MWY0ZTgxYjdhZmM4NzQ1ZDEwODAwNmQ1NWY5ODU=',18,0,'','','0000-00-00 00:00:00'),(46,'new','new','MjJhZjY0NWQxODU5Y2I1Y2E2ZGEwYzQ4NGYxZjM3ZWE=',18,0,'','','0000-00-00 00:00:00'),(52,'a+','a+','Yzg5NDhjMjAwOTRmNjQyMDBjMmI4ZmJhMDQ3YmRiODM=',18,0,'1','','0000-00-00 00:00:00'),(58,'Mr. Boss','admin','MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=',17,0,'1','','0000-00-00 00:00:00');

#
# Structure for table "kon_logindepartemen"
#

DROP TABLE IF EXISTS `kon_logindepartemen`;
CREATE TABLE `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  PRIMARY KEY (`id_logindepartemen`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_departemen` (`id_departemen`) USING BTREE,
  CONSTRAINT `id_login_FK2` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

#
# Data for table "kon_logindepartemen"
#

INSERT INTO `kon_logindepartemen` VALUES (9,42,1),(11,44,1),(12,45,1),(13,46,1),(27,52,1),(43,58,1),(44,58,2),(45,58,3);

#
# Structure for table "kon_loginhistory"
#

DROP TABLE IF EXISTS `kon_loginhistory`;
CREATE TABLE `kon_loginhistory` (
  `id_loginhistory` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_loginhistory`),
  KEY `id_login` (`id_login`) USING BTREE,
  CONSTRAINT `kon_loginhistory_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;

#
# Data for table "kon_loginhistory"
#

INSERT INTO `kon_loginhistory` VALUES (11,42,'2015-08-18 03:41:27'),(12,42,'2015-08-18 03:41:27'),(15,45,'2015-08-18 03:46:13'),(16,45,'2015-08-18 03:46:13'),(57,52,'2015-08-19 19:46:41'),(58,52,'2015-08-19 19:46:41'),(65,52,'2015-08-20 00:27:59'),(66,52,'2015-08-20 00:27:59'),(131,58,'2015-08-24 04:53:56'),(132,58,'2015-08-24 04:53:56'),(133,58,'2015-08-24 11:44:30'),(134,58,'2015-08-24 11:44:30'),(135,58,'2015-08-24 19:28:23'),(136,58,'2015-08-24 19:28:23'),(137,58,'2015-08-25 08:40:48'),(138,58,'2015-08-25 08:40:48'),(139,58,'2015-08-25 10:05:02'),(140,58,'2015-08-25 10:05:02'),(141,58,'2015-08-25 14:56:20'),(142,58,'2015-08-25 14:56:20'),(143,58,'2015-08-25 17:34:28'),(144,58,'2015-08-25 17:34:28'),(145,58,'2015-08-25 19:00:34'),(146,58,'2015-08-25 19:00:34'),(147,58,'2015-08-25 23:32:58'),(148,58,'2015-08-25 23:32:58'),(149,58,'2015-08-26 14:04:02'),(150,58,'2015-08-26 14:04:02'),(151,58,'2015-08-26 14:04:57'),(152,58,'2015-08-26 14:04:57'),(153,58,'2015-08-26 16:31:22'),(154,58,'2015-08-26 16:31:22'),(155,58,'2015-08-26 16:31:50'),(156,58,'2015-08-26 16:31:50'),(157,58,'2015-08-26 16:36:54'),(158,58,'2015-08-26 16:36:54'),(159,58,'2015-08-26 16:37:25'),(160,58,'2015-08-26 16:37:25'),(161,58,'2015-08-27 06:22:04'),(162,58,'2015-08-27 06:22:04'),(163,58,'2015-08-27 21:59:05'),(164,58,'2015-08-27 21:59:05'),(165,58,'2015-08-31 23:13:43'),(166,58,'2015-08-31 23:13:43'),(167,58,'2015-09-17 00:41:53'),(168,58,'2015-09-17 00:41:53');

#
# Structure for table "kon_menu"
#

DROP TABLE IF EXISTS `kon_menu`;
CREATE TABLE `kon_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

#
# Data for table "kon_menu"
#

INSERT INTO `kon_menu` VALUES (1,4,'Pendataan Siswa','pendataan-siswa','double',7,9,''),(2,1,'Presensi Siswa','presensi-siswa','double',44,10,''),(3,1,'Rapor Siswa','rapor-siswa','double',3,11,''),(4,1,'Pendataan Alumni','pendataan-alumni','double',4,12,''),(8,5,'Transaksi','transaksi','double',8,16,''),(9,5,'Modul Penerimaan Siswa','modul-penerimaan-siswa','double',9,17,''),(10,5,'Penerimaan Siswa','penerimaan-siswa','double',10,18,''),(12,6,'Tahun Buku','tahun-buku','',12,20,''),(13,6,'Saldo Awal','saldo-rekening','',13,13,''),(14,6,'Kategori COA','kategori-rekening','',14,14,''),(15,6,'COA','detil-rekening','',15,19,''),(16,6,'Anggaran','set-anggaran','',16,16,''),(19,7,'Warna','warna','',4,17,''),(20,8,'level','level','',5,16,''),(21,8,'user','user','',7,15,''),(22,7,'Icon','icon','',4,13,''),(24,2,'Detail Kelas','detail-kelas','double',11,15,''),(25,3,'Departemen','departemen','',3,11,''),(26,3,'Angkatan','angkatan','',11,15,''),(27,3,'Tahun Ajaran','tahun-ajaran','',16,17,''),(28,3,'Tingkat','tingkat','',12,18,''),(29,3,'Sub Tingkat','subtingkat','',14,14,''),(30,3,'Kelas','kelas','',15,13,''),(31,3,'Semester','semester','',13,12,''),(32,3,'Jenis Mutasi','jenis-mutasi','',11,10,''),(33,3,'Guru','guru','',11,14,''),(34,3,'Pelajaran','pelajaran','',12,14,''),(35,2,'Jadwal Pelajaran','jadwal-pelajaran','double',15,15,''),(36,2,'Presensi Guru','presensi-guru','double',18,12,''),(37,2,'Kegiatan Akademik','kegiatan-akademik','double',14,14,''),(38,1,'Mutasi','mutasi','double',6,13,''),(39,3,'Detail Pelajaran','detail-pelajaran','',13,15,''),(40,1,'Pendataan Siswa','pendataan-siswa','double',13,15,''),(41,4,'Biaya','biaya','double',14,15,''),(42,9,'Diskon Tunai','diskon-tunai','',14,15,''),(43,9,'Angsuran','angsuran','',17,13,''),(44,9,'golongan','golongan','',13,16,''),(45,7,'menu','menu','',14,16,''),(46,7,'Grup Modul','grup-modul','',13,12,''),(47,7,'Modul','modul','',12,11,''),(48,7,'Grup Menu','grup-menu','',16,13,''),(52,9,'Gelombang','gelombang','',16,10,'kelompok pendaftaran  (gelombang)'),(53,4,'Penerimaan Siswa Baru','penerimaan','double',4,10,'penerimaan siswa (pendaftaran NIS dan NISN)'),(54,14,'Perangkat','perangkat','',16,10,'ok'),(55,14,'Lokasi','lokasi','',16,10,''),(56,14,'Jenis Koleksi','jenis-koleksi','',16,10,''),(57,14,'Tingkat Koleksi','tingkat-koleksi','',13,10,''),(58,14,'Klasifikasi','klasifikasi','',41,10,''),(59,14,'Daftar Pengunjung','daftar-pengunjung','',17,10,'\r\n'),(60,14,'Daftar Penerbit','daftar-penerbit','',10,10,''),(61,14,'Daftar-Bahasa','daftar-bahasa','',24,10,''),(62,14,'Satuan Mata Uang','stuan-mata-uang','',8,10,'\r\n'),(63,15,'Katalog','katalog','double',7,10,''),(64,15,'Daftar Koleksi','daftar-koleksi','double',7,20,''),(65,15,'Data Anggota','data-anggota','',13,10,''),(66,15,'Sirkulasi','sirkulasi','double',18,10,''),(67,15,'Stock Opname','stock-opname','double',47,17,''),(68,15,'OPAC','opac','double',19,12,''),(69,16,'Agama','agama','',16,10,'setting data master agama'),(70,16,'Pendidikan','pendidikan','double',16,10,''),(71,16,'Departemen','departemen','',13,10,''),(72,16,'Jabatan','jabatan','double',16,1,''),(73,16,'Status Karyawan','status-karyawan','double',16,10,''),(74,16,'Golongan','golongan','double',16,10,''),(75,17,'Berkas','berkas','double',34,10,''),(76,17,'Absensi','absensi','double',16,10,'\r\n'),(77,17,'Cuti','cuti','double',7,10,''),(78,17,'Pinjaman','pinjaman','double',17,10,''),(79,17,'Karyawan','karyawan','double',27,12,''),(80,18,'Penggajian','penggajian','double',8,10,''),(81,18,'Laporan','laporan','',10,12,''),(82,18,'Setting BPJS','setting-bpjs','double',5,17,''),(83,18,'Golongan','golongan ','double',22,11,''),(84,18,'struktural','struktural','',41,17,''),(85,18,'Fungsional','Fungsional','double',16,1,''),(86,18,'Pengabdian','Pengabdian','',24,17,''),(87,18,'istri anak','istri-anak','double',16,10,''),(88,18,'uang transport','uang-transport','double',16,10,''),(89,18,'beban tugas','beban-tugas','double',16,10,''),(90,18,'wali kelas','wali-kelas','double',13,11,''),(91,19,'Jenjang','jenjang','double',8,10,''),(92,19,'Kategori','kategori','double',8,1,''),(93,19,'produk','produk','double',8,10,''),(94,19,'produk jasa','produk-jasa','double',1,11,''),(95,19,'beban biaya','beban-biaya','double',8,10,''),(96,19,'supplier','supplier','double',16,10,''),(97,19,'customer','customer','double',8,11,''),(98,20,'PO Pembelian','PO-Pembelian','double',16,14,''),(99,20,'Pembelian','Pembelian','double',16,1,''),(100,20,'laporan pembelian','laporan-pembelian','double',1,12,''),(101,20,'retur pembelian','retur-pembelian','double',16,1,''),(102,20,'laporan retur pembelian','laporan-retur-pembelian','double',13,10,''),(103,21,'PO Penjualan','PO-Penjualan','double',27,17,''),(104,21,'Penjualan','Penjualan','double',20,1,''),(105,21,'Retur Penjualaan','Retur-Penjualaan','double',16,10,''),(106,21,'Laporan Penjualan','Laporan-Penjualan','double',16,10,''),(107,21,'Laporan Retur Penjualan','Laporan-Retur-Penjualan','double',18,1,''),(108,24,'Penjualaan Jasa','Penjualaan-Jasa','double',16,1,'\r\n'),(109,24,'Laporan Penjualaan Jasa','Laporan-Penjualaan-Jasa','double',16,10,''),(110,25,'Hutang','hutang','double',16,10,''),(111,25,'pembayaran','pembayaran','double',16,10,''),(112,25,'laporan hutang','laporan-hutang','double',16,10,''),(113,25,'laporan pembayaran','laporan-pembayaran','double',16,10,'\r\n'),(114,26,'Transaksi Biaya','Transaksi-Biaya','double',16,10,''),(115,26,'Laporan Biaya','Laporan-Biaya','double',16,10,''),(116,27,'Laporan Stok','Laporan-Stok','double',16,10,''),(117,27,'Laporan Laba/Rugi','Laporan-Laba/Rugi','double',16,1,''),(119,27,'Laporan Pembelian','Laporan-Pembelian','double',7,10,''),(120,27,'Laporan Retur Pembelian','Laporan-Retur-Pembelian','double',16,10,''),(121,27,'Laporan Retur Penjualan','Laporan-Retur-Penjualan','double',16,1,''),(122,27,'Laporan Penjualan','Laporan-Penjualan','double',16,17,''),(123,28,'User','user','double',16,10,''),(124,28,'password','password','double',16,10,''),(125,29,'supplier','supplier','double',16,10,''),(126,30,'Purchase Requisition','Purchase-Requisition','double',16,1,''),(127,30,'Laporan Permintaan','Laporan-Perrmintaan','double',18,10,''),(128,30,'Batal Purchase Requisition','Batal-Purchase-Requisition','double',16,10,''),(129,31,'Penawaran','Penawaran','double',16,10,''),(130,31,'Laporan Penawaran','Laporan-Penawaran','double',16,10,''),(131,31,'Formulir Fisik Penawaran ','Formulir-Fisik-Penawaran ','double',16,10,''),(132,32,'Purchase Order','Purchase-Order','double',16,10,''),(133,32,'Laporan Pemesanan','Laporan-Pemesanan','double',16,10,''),(134,32,'Batal Purchase Order','Batal \\-Purchase-Order','double',16,10,''),(135,33,'Pembelian','Pembelian','double',1,10,''),(136,33,'Laporan Pembelian','Laporan-Pembelian','double',16,10,''),(137,33,'Retur Pembelian','Retur-Pembelian','double',16,10,''),(138,33,'Laporan Retur PEmbelian','Laporan-Retur-PEmbelian','double',16,1,''),(139,34,'User','User','double',16,1,''),(140,34,'password','password','double',16,1,''),(141,37,'Lokasi','lokasi','double',1,10,''),(142,37,'Tempat','tempat','double',13,10,''),(143,37,'Tempat','tempat','double',20,12,''),(144,35,'Inventaris','inventaris','double',8,15,''),(145,35,'Peminjaman','peminjaman','double',18,17,''),(146,35,'aktivitas','aktivitas','double',7,12,''),(147,38,'user','user','double',16,10,''),(148,39,'tahap2','tahap2','double',16,10,'\r\n'),(149,38,'password','password','double',16,10,''),(150,39,'tahap1','tahap1','double',16,10,''),(151,39,'tahap3','tahap3','double',16,10,''),(152,4,'Detail Diskon Tunai','detail-diskon-tunai','double',16,10,''),(153,4,'Detail Gelombang','detail-gelombang','double',8,11,'');

#
# Structure for table "kon_modul"
#

DROP TABLE IF EXISTS `kon_modul`;
CREATE TABLE `kon_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "kon_modul"
#

INSERT INTO `kon_modul` VALUES (1,1,'akademik','akademik',13,9,'double',''),(2,1,'psb','penerimaan siswa baru',14,10,'double',''),(3,1,'perpus','perpustakaan',3,11,'double double-vertical',''),(4,1,'sarpras','sarana dan prasarana',4,12,'double double-vertical',''),(5,2,'hrd','kepegawaian',5,13,'double double-vertical',''),(6,2,'keuangan','keuangan',6,14,'double double-vertical',''),(7,2,'student','student services',7,15,'double',''),(9,3,'konfigurasi','konfigurasi',13,14,'double','');

#
# Structure for table "kon_privillege"
#

DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_privillege`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_menu` (`id_menu`) USING BTREE,
  CONSTRAINT `id_login_FK` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_menu_FK` FOREIGN KEY (`id_menu`) REFERENCES `kon_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1551 DEFAULT CHARSET=latin1;

#
# Data for table "kon_privillege"
#

INSERT INTO `kon_privillege` VALUES (142,42,48,1),(143,42,46,1),(144,42,22,1),(145,42,45,1),(146,42,47,1),(147,42,19,1),(148,42,20,1),(149,42,21,1),(152,44,20,1),(153,44,21,1),(154,45,26,0),(155,45,25,0),(156,45,39,0),(157,45,33,0),(158,45,32,0),(159,45,30,0),(160,45,34,0),(161,45,31,0),(162,45,29,0),(163,45,28,0),(164,45,24,0),(165,45,35,0),(166,45,37,0),(167,45,38,0),(168,45,4,0),(169,45,40,0),(170,45,48,0),(171,45,46,0),(172,45,45,0),(173,45,47,0),(174,45,21,0),(175,46,26,0),(176,46,25,0),(177,46,39,0),(178,46,33,0),(179,46,32,0),(180,46,30,0),(181,46,34,0),(182,46,31,0),(183,46,29,0),(184,46,27,0),(185,46,28,0),(186,46,16,0),(187,46,15,0),(188,46,14,0),(189,46,13,0),(190,46,12,0),(691,52,24,0),(692,52,35,0),(693,52,37,0),(694,52,36,0),(695,52,38,0),(696,52,4,0),(697,52,40,0),(698,52,2,0),(699,52,3,0),(700,52,22,0),(701,52,45,0),(702,52,47,0),(703,52,19,0),(704,52,21,0),(1409,58,1,1),(1410,58,2,1),(1411,58,3,1),(1412,58,4,1),(1413,58,8,1),(1414,58,9,1),(1415,58,10,1),(1416,58,12,1),(1417,58,13,1),(1418,58,14,1),(1419,58,15,1),(1420,58,16,1),(1421,58,19,1),(1422,58,20,1),(1423,58,21,1),(1424,58,22,1),(1425,58,24,1),(1426,58,25,1),(1427,58,26,1),(1428,58,27,1),(1429,58,28,1),(1430,58,29,1),(1431,58,30,1),(1432,58,31,1),(1433,58,32,1),(1434,58,33,1),(1435,58,34,1),(1436,58,35,1),(1437,58,36,1),(1438,58,37,1),(1439,58,38,1),(1440,58,39,1),(1441,58,40,1),(1442,58,41,1),(1443,58,42,1),(1444,58,43,1),(1445,58,44,1),(1446,58,45,1),(1447,58,46,1),(1448,58,47,1),(1449,58,48,1),(1450,58,52,1),(1451,58,53,1),(1452,58,54,1),(1453,58,55,1),(1454,58,56,1),(1455,58,57,1),(1456,58,58,1),(1457,58,59,1),(1458,58,60,1),(1459,58,61,1),(1460,58,62,1),(1461,58,63,1),(1462,58,64,1),(1463,58,65,1),(1464,58,66,1),(1465,58,67,1),(1466,58,68,1),(1467,58,69,1),(1468,58,70,1),(1469,58,71,1),(1470,58,72,1),(1471,58,73,1),(1472,58,74,1),(1473,58,75,1),(1474,58,76,1),(1475,58,77,1),(1476,58,78,1),(1477,58,79,1),(1478,58,80,1),(1479,58,81,1),(1480,58,82,1),(1481,58,83,1),(1482,58,84,1),(1483,58,85,1),(1484,58,86,1),(1485,58,87,1),(1486,58,88,1),(1487,58,89,1),(1488,58,90,1),(1489,58,91,1),(1490,58,92,1),(1491,58,93,1),(1492,58,94,1),(1493,58,95,1),(1494,58,96,1),(1495,58,97,1),(1496,58,98,1),(1497,58,99,1),(1498,58,100,1),(1499,58,101,1),(1500,58,102,1),(1501,58,103,1),(1502,58,104,1),(1503,58,105,1),(1504,58,106,1),(1505,58,107,1),(1506,58,108,1),(1507,58,109,1),(1508,58,110,1),(1509,58,111,1),(1510,58,112,1),(1511,58,113,1),(1512,58,114,1),(1513,58,115,1),(1514,58,116,1),(1515,58,117,1),(1516,58,119,1),(1517,58,120,1),(1518,58,121,1),(1519,58,122,1),(1520,58,123,1),(1521,58,124,1),(1522,58,125,1),(1523,58,126,1),(1524,58,127,1),(1525,58,128,1),(1526,58,129,1),(1527,58,130,1),(1528,58,131,1),(1529,58,132,1),(1530,58,133,1),(1531,58,134,1),(1532,58,135,1),(1533,58,136,1),(1534,58,137,1),(1535,58,138,1),(1536,58,139,1),(1537,58,140,1),(1538,58,141,1),(1539,58,142,1),(1540,58,143,1),(1541,58,144,1),(1542,58,145,1),(1543,58,146,1),(1544,58,147,1),(1545,58,148,1),(1546,58,149,1),(1547,58,150,1),(1548,58,151,1),(1549,58,152,1),(1550,58,153,1);

#
# Structure for table "kon_warna"
#

DROP TABLE IF EXISTS `kon_warna`;
CREATE TABLE `kon_warna` (
  `id_warna` int(11) NOT NULL AUTO_INCREMENT,
  `warna` varchar(25) NOT NULL,
  PRIMARY KEY (`id_warna`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

#
# Data for table "kon_warna"
#

INSERT INTO `kon_warna` VALUES (1,'black'),(2,'white'),(3,'lime'),(4,'green'),(5,'emerald'),(6,'teal'),(7,'cyan'),(8,'cobalt'),(9,'indigo'),(10,'violet'),(11,'pink'),(12,'magenta'),(13,'crimson'),(14,'red'),(15,'orange'),(16,'amber'),(17,'yellow'),(18,'brown'),(19,'olive'),(20,'steel'),(21,'mauve'),(22,'taupe'),(23,'gray'),(24,'dark'),(25,'darker'),(26,'transparent'),(27,'darkBrown'),(28,'darkCrimson'),(29,'darkMagenta'),(30,'darkIndigo'),(31,'darkCyan'),(32,'darkCobalt'),(33,'darkTeal'),(34,'darkEmerald'),(35,'darkGreen'),(36,'darkOrange'),(37,'darkRed'),(38,'darkPink'),(39,'darkViolet'),(40,'darkBlue'),(41,'lightBlue'),(42,'lightTeal'),(43,'lightOlive'),(44,'lightOrange'),(45,'lightPink'),(46,'lightRed'),(47,'lightGreen');

#
# Structure for table "level"
#

DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `action` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "level"
#

INSERT INTO `level` VALUES (1,'SA','MTR','superadmin'),(2,'A','MTR','admin'),(3,'O','TR','operator'),(4,'G','R','guest');

#
# Structure for table "login"
#

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  UNIQUE KEY `username` (`username`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "login"
#


#
# Structure for table "menu_editor"
#

DROP TABLE IF EXISTS `menu_editor`;
CREATE TABLE `menu_editor` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "menu_editor"
#

/*!40000 ALTER TABLE `menu_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_editor` ENABLE KEYS */;

#
# Structure for table "menu_users"
#

DROP TABLE IF EXISTS `menu_users`;
CREATE TABLE `menu_users` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "menu_users"
#

/*!40000 ALTER TABLE `menu_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_users` ENABLE KEYS */;

#
# Structure for table "modul"
#

DROP TABLE IF EXISTS `modul`;
CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `modul` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "modul"
#


#
# Structure for table "modul_hrd"
#

DROP TABLE IF EXISTS `modul_hrd`;
CREATE TABLE `modul_hrd` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `modul` varchar(30) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `setup` varchar(50) NOT NULL DEFAULT '',
  `posisi` tinyint(2) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(5) NOT NULL DEFAULT '0',
  `type` enum('block','module') NOT NULL DEFAULT 'module',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "modul_hrd"
#

/*!40000 ALTER TABLE `modul_hrd` DISABLE KEYS */;
/*!40000 ALTER TABLE `modul_hrd` ENABLE KEYS */;

#
# Structure for table "mst_agama"
#

DROP TABLE IF EXISTS `mst_agama`;
CREATE TABLE `mst_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "mst_agama"
#


#
# Structure for table "mst_suku"
#

DROP TABLE IF EXISTS `mst_suku`;
CREATE TABLE `mst_suku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suku` varchar(20) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`suku`),
  UNIQUE KEY `UX_suku` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "mst_suku"
#


#
# Structure for table "po_alur_stok"
#

DROP TABLE IF EXISTS `po_alur_stok`;
CREATE TABLE `po_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

#
# Data for table "po_alur_stok"
#

INSERT INTO `po_alur_stok` VALUES (1,'2015-05-18','Saldo Awal','-','KD001','50'),(2,'2015-05-18','Pembelian','INV1805150001','KD001','5'),(3,'2015-05-18','Pembelian','INV1805150001','KD001','5'),(4,'2015-05-18','Pembelian','INV1805150002','KD001','1'),(5,'2015-05-19','Retur Pembelian','RTB1905150001','KD001','5'),(9,'2015-05-01','Saldo Awal','-','B01','50'),(10,'2015-05-07','Mutasi Masuk','-','B01','2'),(11,'2015-05-25','Pembelian','INV2505150003','B01','5'),(12,'2015-06-01','Pembelian','INV0106150004','KD001','5'),(13,'2015-06-01','Pembelian','INV0106150004','B01','4'),(14,'2015-06-01','Retur Pembelian','RTB0106150002','KD001','2'),(15,'2015-06-05','Pembelian','INV0506150005','KD001','3'),(16,'2015-06-05','Pembelian','INV0506150005','B01','1'),(17,'2015-06-12','Pembelian','INV1206150006','123','1'),(18,'2015-06-12','Pembelian','INV1206150001','3','1'),(19,'2015-06-12','Pembelian','INV1206150001','10','1');

#
# Structure for table "po_bulan"
#

DROP TABLE IF EXISTS `po_bulan`;
CREATE TABLE `po_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Data for table "po_bulan"
#

INSERT INTO `po_bulan` VALUES (1,'Januari','01'),(2,'Februari','02'),(3,'Maret','03'),(4,'April','04'),(5,'Mei','05'),(6,'Juni','06'),(7,'Juli','07'),(8,'Agustus','08'),(9,'September','09'),(10,'Oktober','10'),(11,'Nopember','11'),(12,'Desember','12');

#
# Structure for table "po_jenisproduk"
#

DROP TABLE IF EXISTS `po_jenisproduk`;
CREATE TABLE `po_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "po_jenisproduk"
#

INSERT INTO `po_jenisproduk` VALUES (4,'ALAT SEKOLAH');

#
# Structure for table "po_pembelian"
#

DROP TABLE IF EXISTS `po_pembelian`;
CREATE TABLE `po_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Hutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `hutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelian"
#

INSERT INTO `po_pembelian` VALUES (7,'INV1206150001','PO1206150001','2015-06-12','SUP01','Tunai','200000','0','200000','200000','0','0','','admin');

#
# Structure for table "po_pembeliandetail"
#

DROP TABLE IF EXISTS `po_pembeliandetail`;
CREATE TABLE `po_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembeliandetail"
#

INSERT INTO `po_pembeliandetail` VALUES (9,'INV1206150001','3',0,'1','0','0','0'),(10,'INV1206150001','10',0,'1','200000','0','200000');

#
# Structure for table "po_pembelianretur"
#

DROP TABLE IF EXISTS `po_pembelianretur`;
CREATE TABLE `po_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelianretur"
#


#
# Structure for table "po_pembelianreturdetail"
#

DROP TABLE IF EXISTS `po_pembelianreturdetail`;
CREATE TABLE `po_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelianreturdetail"
#


#
# Structure for table "po_po"
#

DROP TABLE IF EXISTS `po_po`;
CREATE TABLE `po_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

#
# Data for table "po_po"
#

INSERT INTO `po_po` VALUES (13,'PO1206150001','PR1206150001','2015-06-12','SUP01','Tunai','0','200000','0','200000','admin'),(14,'PO1206150002','PR1206150002','2015-06-12','SUP01','Tunai','0','0','0','0','admin');

#
# Structure for table "po_podetail"
#

DROP TABLE IF EXISTS `po_podetail`;
CREATE TABLE `po_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

#
# Data for table "po_podetail"
#

INSERT INTO `po_podetail` VALUES (15,'PO1206150001','10','1','200000','0','200000'),(16,'PO1206150002','3','1','0','0','0');

#
# Structure for table "po_pr"
#

DROP TABLE IF EXISTS `po_pr`;
CREATE TABLE `po_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `namapr` varchar(512) NOT NULL,
  `departemenpr` varchar(512) NOT NULL,
  `tujuanpr` varchar(512) NOT NULL,
  `kategorianggaran` varchar(5) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "po_pr"
#

INSERT INTO `po_pr` VALUES (9,'PR1206150001','2015-06-12','asd','5','asdasd','16','admin'),(10,'PR1206150002','2015-06-12','ijkljkl','10','jkljkl','20','admin');

#
# Structure for table "po_prdetail"
#

DROP TABLE IF EXISTS `po_prdetail`;
CREATE TABLE `po_prdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `spesifikasi` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Data for table "po_prdetail"
#

INSERT INTO `po_prdetail` VALUES (10,'PR1206150001','10','1','yuiyiyi'),(11,'PR1206150002','3','1','');

#
# Structure for table "po_produk"
#

DROP TABLE IF EXISTS `po_produk`;
CREATE TABLE `po_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "po_produk"
#

INSERT INTO `po_produk` VALUES (1,4,'KD001','KURSI 2','62','50000','0'),(2,4,'B01','BANGKU','62','60000','0');

#
# Structure for table "po_situs"
#

DROP TABLE IF EXISTS `po_situs`;
CREATE TABLE `po_situs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email_master` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `judul_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `slogan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `keywords` text COLLATE latin1_general_ci NOT NULL,
  `maxkonten` int(2) NOT NULL DEFAULT '5',
  `maxadmindata` int(2) NOT NULL DEFAULT '5',
  `maxdata` int(2) NOT NULL DEFAULT '5',
  `maxgalleri` int(2) NOT NULL DEFAULT '4',
  `widgetshare` int(2) NOT NULL DEFAULT '0',
  `theme` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'tcms',
  `author` text COLLATE latin1_general_ci NOT NULL,
  `alamatkantor` text COLLATE latin1_general_ci NOT NULL,
  `publishwebsite` int(1) NOT NULL DEFAULT '1',
  `publishnews` int(2) NOT NULL,
  `maxgalleridata` int(11) NOT NULL,
  `widgetkomentar` int(2) NOT NULL DEFAULT '1',
  `widgetpenulis` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# Data for table "po_situs"
#

/*!40000 ALTER TABLE `po_situs` DISABLE KEYS */;
INSERT INTO `po_situs` VALUES (1,'rekysda@gmail.com','PO & Pembelian','http://localhost/sistermeta/purchaseorder/','Purchase Order','WebDesign dengan sistem Responsive','po,surabaya,indonesia',5,50,5,4,3,'pos','Elyon Christian School','Surabaya',1,1,12,1,2);
/*!40000 ALTER TABLE `po_situs` ENABLE KEYS */;

#
# Structure for table "po_supplier"
#

DROP TABLE IF EXISTS `po_supplier`;
CREATE TABLE `po_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "po_supplier"
#

INSERT INTO `po_supplier` VALUES (1,'SUP01','CV. MEDIA MANDIRI2','SURABAYA','SURABAYA');

#
# Structure for table "po_useraura"
#

DROP TABLE IF EXISTS `po_useraura`;
CREATE TABLE `po_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Payroll','HRD') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Data for table "po_useraura"
#

/*!40000 ALTER TABLE `po_useraura` DISABLE KEYS */;
INSERT INTO `po_useraura` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','admin@elyon.sch.id','af0675a9e843c6c8f78163a9118efc78.jpg','Administrator','aktif',0,'2015-07-10 12:32:30','2010-08-27 00:00:00','2034-08-27 00:00:00','<p><b>none</b></p>'),(28,'superadmin','b11d5ece6353d17f85c5ad30e0a02360','rekysda@gmail.com','','Administrator','aktif',1,'2015-03-21 23:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `po_useraura` ENABLE KEYS */;

#
# Structure for table "pos_alur_stok"
#

DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Data for table "pos_alur_stok"
#

/*!40000 ALTER TABLE `pos_alur_stok` DISABLE KEYS */;
INSERT INTO `pos_alur_stok` VALUES (1,'2015-07-11','Pembelian','INV1107150001','CELANA OR','10'),(2,'2015-07-11','Penjualan','FAK1107150001','DASI','5'),(3,'2015-07-11','Penjualan','FAK1107150001','KEMEJA PUTRA','1'),(4,'2015-07-11','Penjualan','FAK1107150001','DASI','5'),(5,'2015-07-11','Penjualan','FAK1107150001','KEMEJA PUTRA','1'),(6,'2015-07-11','Penjualan','FAK1107150001','DASI','5'),(7,'2015-07-11','Penjualan','FAK1107150001','KEMEJA PUTRA','1'),(8,'2015-07-11','Penjualan','FAK1107150002','BLOUSE PUTRI','1'),(9,'2015-07-11','Penjualan','FAK1107150002','KAOS OR','2'),(10,'2015-07-11','Penjualan','FAK1107150003','KAOS OR','1'),(11,'2015-07-11','Penjualan','FAK1107150004','BLOUSE PUTRI','1'),(12,'2015-07-12','Retur Pembelian','RTB1207150001','CELANA OR','5'),(13,'2015-07-12','Retur Pembelian','RTB1207150002','CELANA OR','5'),(14,'2015-07-12','Retur Pembelian','RTB1207150003','BLOUSE PUTRI','1'),(15,'2015-07-12','Retur Penjualan','RTJ1207150001','BLOUSE PUTRI','1'),(16,'2015-07-12','Retur Penjualan','RTJ1207150002','DASI','5'),(17,'2015-07-12','Retur Penjualan','RTJ1207150002','BLOUSE PUTRI','5'),(18,'2015-07-01','stok awal','-','TOPI','402'),(19,'2015-07-01','stok awal','-','CELANA OR','562'),(20,'2015-07-12','Saldo Awal','-','KPR1207150026','25'),(21,'2015-07-12','Penjualan','FAK1207150005','BLOUSE PUTRI','5'),(22,'2015-07-13','Saldo Awal','-','KPR1307150027','17'),(23,'2015-07-13','Pembelian','INV1307150002','KPR1307150027','17'),(24,'2015-07-13','Pembelian','INV1307150002','BLOUSE PUTRI','1'),(25,'2015-07-13','Saldo Awal','-','KPR1307150028','17'),(26,'2015-07-13','Pembelian','INV1307150003','KPR1307150028','1'),(27,'2015-07-13','Penjualan','FAK1307150006','KPR1307150028','1'),(28,'2015-07-13','Penjualan','FAK1307150006','KPR1307150027','1'),(29,'2015-07-13','Penjualan','FAK1307150007','KPR1307150027','1'),(30,'2015-07-13','Retur Penjualan','RTJ1307150003','KPR1307150028','1'),(31,'2015-07-13','Retur Penjualan','RTJ1307150003','KPR1307150027','1'),(32,'2015-07-13','Saldo Awal','-','KPR1307150029','0'),(33,'2015-07-13','Saldo Awal','-','KPR1307150030','0');
/*!40000 ALTER TABLE `pos_alur_stok` ENABLE KEYS */;

#
# Structure for table "pos_biayabulanan"
#

DROP TABLE IF EXISTS `pos_biayabulanan`;
CREATE TABLE `pos_biayabulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pos_biayabulanan"
#

/*!40000 ALTER TABLE `pos_biayabulanan` DISABLE KEYS */;
INSERT INTO `pos_biayabulanan` VALUES (1,'2015-07-01','LISTRIK','500000');
/*!40000 ALTER TABLE `pos_biayabulanan` ENABLE KEYS */;

#
# Structure for table "pos_customer"
#

DROP TABLE IF EXISTS `pos_customer`;
CREATE TABLE `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_customer"
#

/*!40000 ALTER TABLE `pos_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_customer` ENABLE KEYS */;

#
# Structure for table "pos_jenisproduk"
#

DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis` enum('BARANG','JASA') NOT NULL DEFAULT 'BARANG',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "pos_jenisproduk"
#

/*!40000 ALTER TABLE `pos_jenisproduk` DISABLE KEYS */;
INSERT INTO `pos_jenisproduk` VALUES (1,'SERAGAM','BARANG'),(3,'BUKU','BARANG'),(6,'FORM','JASA');
/*!40000 ALTER TABLE `pos_jenisproduk` ENABLE KEYS */;

#
# Structure for table "pos_jenjang"
#

DROP TABLE IF EXISTS `pos_jenjang`;
CREATE TABLE `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pos_jenjang"
#

/*!40000 ALTER TABLE `pos_jenjang` DISABLE KEYS */;
INSERT INTO `pos_jenjang` VALUES (1,'Playgroup'),(2,'Kindegarden'),(3,'Elementary'),(4,'Primary');
/*!40000 ALTER TABLE `pos_jenjang` ENABLE KEYS */;

#
# Structure for table "pos_kelas"
#

DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_kelas"
#

/*!40000 ALTER TABLE `pos_kelas` DISABLE KEYS */;
INSERT INTO `pos_kelas` VALUES (1,'A','3'),(2,'B','2');
/*!40000 ALTER TABLE `pos_kelas` ENABLE KEYS */;

#
# Structure for table "pos_pembelian"
#

DROP TABLE IF EXISTS `pos_pembelian`;
CREATE TABLE `pos_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `hutang` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembelian"
#

/*!40000 ALTER TABLE `pos_pembelian` DISABLE KEYS */;
INSERT INTO `pos_pembelian` VALUES (1,'INV1107150001','','2015-07-11','SUP1107150001','Tunai','750000','0','750000','750000','0','0','','admin'),(2,'INV1307150002','','2015-07-13','SUP1107150001','Tunai','1254000','0','1254000','1254000','0','0','','admin'),(3,'INV1307150003','','2015-07-13','SUP1307150004','Tunai','75600','0','75600','75600','0','0','','admin');
/*!40000 ALTER TABLE `pos_pembelian` ENABLE KEYS */;

#
# Structure for table "pos_pembeliandetail"
#

DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembeliandetail"
#

/*!40000 ALTER TABLE `pos_pembeliandetail` DISABLE KEYS */;
INSERT INTO `pos_pembeliandetail` VALUES (1,'INV1107150001','','CELANA OR','10','75000','0','750000'),(2,'INV1307150002','','KPR1307150027','17','67000','0','1139000'),(3,'INV1307150002','','BLOUSE PUTRI','1','115000','0','115000'),(4,'INV1307150003','','KPR1307150028','1','84000','10','75600');
/*!40000 ALTER TABLE `pos_pembeliandetail` ENABLE KEYS */;

#
# Structure for table "pos_pembelianretur"
#

DROP TABLE IF EXISTS `pos_pembelianretur`;
CREATE TABLE `pos_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembelianretur"
#

/*!40000 ALTER TABLE `pos_pembelianretur` DISABLE KEYS */;
INSERT INTO `pos_pembelianretur` VALUES (1,'RTB1207150001','INV1107150001','2015-07-12','SUP1107150001','Tunai','375000','admin'),(2,'RTB1207150002','INV1107150001','2015-07-12','SUP1107150001','Tunai','375000','admin'),(3,'RTB1207150003','','2015-07-12','SUP1107150002','Tunai','115000','admin');
/*!40000 ALTER TABLE `pos_pembelianretur` ENABLE KEYS */;

#
# Structure for table "pos_pembelianreturdetail"
#

DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pos_pembelianreturdetail"
#

/*!40000 ALTER TABLE `pos_pembelianreturdetail` DISABLE KEYS */;
INSERT INTO `pos_pembelianreturdetail` VALUES (1,'RTB1207150001','INV1107150001','CELANA OR','5','75000','0','375000'),(2,'RTB1207150002','INV1107150001','CELANA OR','5','75000','0','375000'),(3,'RTB1207150003','','BLOUSE PUTRI','1','115000','0','115000');
/*!40000 ALTER TABLE `pos_pembelianreturdetail` ENABLE KEYS */;

#
# Structure for table "pos_penjualan"
#

DROP TABLE IF EXISTS `pos_penjualan`;
CREATE TABLE `pos_penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang','Pemesanan') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `piutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualan"
#

/*!40000 ALTER TABLE `pos_penjualan` DISABLE KEYS */;
INSERT INTO `pos_penjualan` VALUES (4,'FAK1107150001','','2015-07-11','30','Tunai','340000','0','340000','340000','0','0','','admin'),(5,'FAK1107150002','','2015-07-11','32','Tunai','265000','0','265000','265000','0','0','','admin'),(6,'FAK1107150003','','2015-07-11','29','Tunai','75000','0','75000','75000','0','0','','admin'),(7,'FAK1107150004','','2015-07-11','31','Tunai','10000','0','10000','10000','0','0','','admin'),(8,'FAK1207150005','','2015-07-12','33','Tunai','50000','0','50000','50000','0','0','','admin'),(9,'FAK1307150006','','2015-07-13','28','Tunai','143100','0','143100','143100','0','0','','admin'),(10,'FAK1307150007','','2015-07-13','31','Tunai','67500','0','67500','67500','0','0','','admin');
/*!40000 ALTER TABLE `pos_penjualan` ENABLE KEYS */;

#
# Structure for table "pos_penjualanbiaya"
#

DROP TABLE IF EXISTS `pos_penjualanbiaya`;
CREATE TABLE `pos_penjualanbiaya` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanbiaya"
#

/*!40000 ALTER TABLE `pos_penjualanbiaya` DISABLE KEYS */;
INSERT INTO `pos_penjualanbiaya` VALUES (1,'FKB1107150001','2015-07-11','Tunai','45000','0','45000','45000','admin');
/*!40000 ALTER TABLE `pos_penjualanbiaya` ENABLE KEYS */;

#
# Structure for table "pos_penjualanbiayadetail"
#

DROP TABLE IF EXISTS `pos_penjualanbiayadetail`;
CREATE TABLE `pos_penjualanbiayadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodebiaya` varchar(50) NOT NULL,
  `jenis` int(2) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanbiayadetail"
#

/*!40000 ALTER TABLE `pos_penjualanbiayadetail` DISABLE KEYS */;
INSERT INTO `pos_penjualanbiayadetail` VALUES (1,'FKB1107150001','KBB1107150001',3,'1','50000','0','5000','45000');
/*!40000 ALTER TABLE `pos_penjualanbiayadetail` ENABLE KEYS */;

#
# Structure for table "pos_penjualandetail"
#

DROP TABLE IF EXISTS `pos_penjualandetail`;
CREATE TABLE `pos_penjualandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `jenis` varchar(5) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualandetail"
#

/*!40000 ALTER TABLE `pos_penjualandetail` DISABLE KEYS */;
INSERT INTO `pos_penjualandetail` VALUES (1,'FAK1107150001','','1','DASI','5','10000','50000','0','50000'),(2,'FAK1107150001','','1','KEMEJA PUTRA','1','120000','120000','0','120000'),(3,'FAK1107150002','','1','BLOUSE PUTRI','1','115000','115000','0','115000'),(4,'FAK1107150002','','1','KAOS OR','2','75000','75000','0','150000'),(5,'FAK1107150003','','1','KAOS OR','1','75000','75000','0','75000'),(6,'FAK1107150004','','1','BLOUSE PUTRI','1','10000','115000','0','10000'),(7,'FAK1207150005','','1','BLOUSE PUTRI','5','10000','115000','0','50000'),(8,'FAK1307150006','','3','KPR1307150028','1','84000','84000','10','75600'),(9,'FAK1307150006','','3','KPR1307150027','1','75000','67000','10','67500'),(10,'FAK1307150007','','3','KPR1307150027','1','75000','67000','10','67500');
/*!40000 ALTER TABLE `pos_penjualandetail` ENABLE KEYS */;

#
# Structure for table "pos_penjualanjasa"
#

DROP TABLE IF EXISTS `pos_penjualanjasa`;
CREATE TABLE `pos_penjualanjasa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `piutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanjasa"
#

/*!40000 ALTER TABLE `pos_penjualanjasa` DISABLE KEYS */;
INSERT INTO `pos_penjualanjasa` VALUES (1,'FKJ1107150001','2015-07-11','30','Tunai','70000','0','70000','70000','0','0','','admin'),(2,'FKJ1107150002','2015-07-11','31','Tunai','220000','0','220000','220000','0','0','','admin');
/*!40000 ALTER TABLE `pos_penjualanjasa` ENABLE KEYS */;

#
# Structure for table "pos_penjualanjasadetail"
#

DROP TABLE IF EXISTS `pos_penjualanjasadetail`;
CREATE TABLE `pos_penjualanjasadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodejasa` varchar(50) NOT NULL,
  `jenis` int(4) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanjasadetail"
#

/*!40000 ALTER TABLE `pos_penjualanjasadetail` DISABLE KEYS */;
INSERT INTO `pos_penjualanjasadetail` VALUES (1,'FKJ1107150001','KPR1107150025',6,'1','70000','0','0','70000'),(2,'FKJ1107150002','KPR1107150025',6,'1','70000','0','0','70000'),(3,'FKJ1107150002','KPR1107150026',6,'1','150000','0','0','150000');
/*!40000 ALTER TABLE `pos_penjualanjasadetail` ENABLE KEYS */;

#
# Structure for table "pos_penjualanretur"
#

DROP TABLE IF EXISTS `pos_penjualanretur`;
CREATE TABLE `pos_penjualanretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanretur"
#

/*!40000 ALTER TABLE `pos_penjualanretur` DISABLE KEYS */;
INSERT INTO `pos_penjualanretur` VALUES (1,'RTJ1207150001','FAK1107150004','2015-07-12','31','Tunai','10000','admin'),(2,'RTJ1207150002','','2015-07-12','33','Tunai','100000','admin'),(3,'RTJ1307150003','FAK1307150006','2015-07-13','28','Tunai','159000','admin');
/*!40000 ALTER TABLE `pos_penjualanretur` ENABLE KEYS */;

#
# Structure for table "pos_penjualanreturdetail"
#

DROP TABLE IF EXISTS `pos_penjualanreturdetail`;
CREATE TABLE `pos_penjualanreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "pos_penjualanreturdetail"
#

/*!40000 ALTER TABLE `pos_penjualanreturdetail` DISABLE KEYS */;
INSERT INTO `pos_penjualanreturdetail` VALUES (1,'RTJ1207150001','FAK1107150004','BLOUSE PUTRI','1','10000','0','10000'),(2,'RTJ1207150002','','DASI','5','10000','0','50000'),(3,'RTJ1207150002','','BLOUSE PUTRI','5','10000','0','50000'),(4,'RTJ1307150003','FAK1307150006','KPR1307150028','1','84000','10','84000'),(5,'RTJ1307150003','FAK1307150006','KPR1307150027','1','75000','10','75000');
/*!40000 ALTER TABLE `pos_penjualanreturdetail` ENABLE KEYS */;

#
# Structure for table "pos_produk"
#

DROP TABLE IF EXISTS `pos_produk`;
CREATE TABLE `pos_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` int(10) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;

#
# Data for table "pos_produk"
#

/*!40000 ALTER TABLE `pos_produk` DISABLE KEYS */;
INSERT INTO `pos_produk` VALUES (28,3,4,'KPR1307150028','MPH ENG-TB 1A','18','84000','84000'),(29,3,4,'KPR1307150029','MPH ENG-TB 1B','0','84000','84000'),(30,3,4,'KPR1307150030','MPH ENG-TB 2A','1','84000','84000'),(31,3,4,'KPR2508150031','MPH Eng  TB 2B','','84000','84000'),(32,3,4,'KPR2508150032','MPH ENG TB 3A','19','84000','84000'),(33,3,4,'KPR2508150033','MPH Eng TB 3B','19','84000','84000'),(34,3,4,'KPR2508150034','MPH ENG TB 4A','8','87000','87000'),(35,3,4,'KPR2508150035','MPH ENG TB 4B','8','87000','87000'),(36,3,4,'KPR2808150036','MPH  ENG TB 5A','','87000','87000'),(37,3,4,'KPR2808150037','MPH ENG TB 5B','','87000','87000'),(38,3,4,'KPR2808150038','MPH ENG TB 6A','','87000','87000'),(39,3,4,'KPR2808150039','MPH ENG TB 6B','','87000','87000'),(40,3,4,'KPR2808150040','MPH ENG WB 1A','','84000','84000'),(41,3,4,'KPR2808150041','MPH ENG WB 1B','','87000','87000'),(42,3,4,'KPR2808150042','MPH ENG WB 2A','','87000','87000'),(43,3,4,'KPR2808150043','MPH ENG WB 2B','','87000','87000'),(44,3,4,'KPR2808150044','MPH ENG WB 3A','','87000','87000'),(45,3,4,'KPR2808150045','MPH ENG WB 3B','','87000','87000'),(46,3,4,'KPR2808150046','MPH ENG WB 4A','','87000','87000'),(47,3,4,'KPR2808150047','MPH ENG WB 4B','','87000','87000'),(48,3,4,'KPR2808150048','MPH ENG WB 5A','','87000','87000'),(49,3,4,'KPR2808150049','MPH ENG WB 5B','','87000','87000'),(50,3,4,'KPR2808150050','MPH ENG WB 6A','','87000','87000'),(51,3,4,'KPR2808150051','MPH ENG WB 6B','','87000','87000'),(52,3,4,'KPR2808150052','MPH ENG HW 1A','','87000','87000'),(53,3,4,'KPR2808150053','MPH ENG HW 1B','','87000','87000'),(54,3,4,'KPR2808150054','MPH ENG HW 2A','','87000','87000'),(55,3,4,'KPR2808150055','MPH ENG HW 2B','','87000','87000'),(56,3,4,'KPR2808150056','MPH ENG hW 3A','','87000','87000'),(57,3,4,'KPR2808150057','MPH ENG HW 3B','','84000','84000'),(58,3,4,'KPR2808150058','MPH ENG HW 4A','','84000','84000'),(59,3,4,'KPR2808150059','MPH ENG HW 4B','','84000','84000'),(60,3,4,'KPR2808150060','MPH  ENG HW 5A','','84000','84000'),(61,3,4,'KPR2808150061','MPH ENG HW 5B','','84000','84000'),(62,3,4,'KPR2808150062','SHAPING MATHS TB 1A','16','90000','90000'),(63,3,4,'KPR2808150063','SHAPING MATHS TB 1B','17','90000','90000'),(64,3,4,'KPR2808150064','SHAPING MATHS TB 2A','18','100000','100000'),(65,3,4,'KPR2808150065','SHAPING MATHS TB 2B','18','105000','105000'),(66,3,4,'KPR2808150066','SHAPING MATHS TB 3A','19','105000','105000'),(67,3,4,'KPR2808150067','SHAPING MATHS TB 3B','19','105000','105000'),(68,3,4,'KPR2808150068','SHAPING MATHS TB 4A (2ND EDT)','8','106000','106000'),(69,3,4,'KPR2808150069','SHAPING MATHS TB 4B (2ND EDT)','8','106000','106000'),(70,3,4,'KPR2808150070','SHAPING MATHS TB 5A (2ND EDT)','9','106000','106000'),(71,3,4,'KPR2808150071','SHAPING MATHS TB 5B (2ND EDT)','9','106000','106000'),(72,3,4,'KPR2808150072','SHAPING MATHS TB 6A (2ND EDT)','2','106000','106000'),(73,3,4,'KPR2808150073','SHAPING MATHS ACT BOOK 1A (3RD EDT)','17','78000','78000'),(74,3,4,'KPR2808150074','SHAPING MATHS ACT BOOK 1B (3RD EDT)','17','78000','78000'),(75,3,4,'KPR2808150075','SHAPING MATHS ACT BOOK 2A (3RD EDT)','18','83000',''),(76,3,4,'KPR2808150076','SHAPING MATHS ACT BOOK 2B (3RD EDT)','18','86000','86000'),(77,3,4,'KPR2808150077','SHAPING MATHS ACT BOOK 3A (3RD EDT)','19','86000','86000'),(78,3,4,'KPR2808150078','SHAPING MATHS ACT BOOK 3B (3RD EDT)','19','86000','86000'),(79,3,4,'KPR2808150079','SHAPING MATHS ACT BOOK 4A PART 1 (2ND Edt)','8','56000','56000'),(80,3,4,'KPR2808150080','SHAPING MATHS ACT BOOK 4A PART 2 (2ND Edt)','8','56000','56000'),(81,3,4,'KPR2808150081','SHAPING MATHS ACT BOOK 4B PART 1 (2ND Edt)','8','56000','56000'),(82,3,4,'KPR2808150082','SHAPING MATHS ACT BOOK 4B PART 2 (2ND Edt)','8','56000','56000'),(83,3,4,'KPR2808150083','SHAPING MATHS ACT BOOK 5A PART 1 (2ND Edt)','9','56000','56000'),(84,3,4,'KPR2808150084','SHAPING MATHS ACT BOOK 5A PART 2 (2ND Edt)','9','56000','56000'),(85,3,4,'KPR2808150085','SHAPING MATHS ACT BOOK 5B PART 1 (2ND Edt)','9','56000','56000'),(86,3,4,'KPR2808150086','SHAPING MATHS ACT BOOK 5B PART 2 (2ND Edt)','9','56000','56000'),(87,3,4,'KPR2808150087','SHAPING MATHS ACT BOOK 6A PART 1 (2ND Edt)','2','56000','56000'),(88,3,4,'KPR2808150088','SHAPING MATHS ACT BOOK 6A PART 2 (2ND Edt)','2','56000','56000'),(89,3,4,'KPR2808150089','SHAPING MATHS ACT BOOK 6B PART 1 (2ND Edt)','2','56000','56000'),(90,3,4,'KPR2808150090','SHAPING MATHS ACT BOOK 6B PART 2 (2ND Edt)','3','56000','56000'),(91,3,4,'KPR2808150091','I-SCIENCE TB 1 (REVISI COVER)','17','137000','137000'),(92,3,4,'KPR2808150092','I-SCIENCE TB 2 (REVISI COVER)','16','137000','137000'),(93,3,4,'KPR2808150093','I-SCIENCE TB 3 (REVISI COVER)','19','145000','145000'),(94,3,4,'KPR2808150094','I-SCIENCE TB 4 (REVISI COVER)','8','137000','137000'),(95,3,4,'KPR2808150095','I-SCIENCE TB 5 (REVISI COVER)','9','137000','137000'),(96,3,4,'KPR2808150096','I-SCIENCE TB 6 (REVISI COVER)','2','116000','116000'),(97,3,4,'KPR2808150097','I-SCIENCE ACT BOOK 1 (REVISI COVER)','17','95000','95000'),(98,3,4,'KPR2808150098','I-SCIENCE ACT BOOK 2 (REVISI COVER)','18','95000','95000'),(99,3,4,'KPR2808150099','I-SCIENCE ACT BOOK 3A (REVISI COVER)','19','64500','64500'),(100,3,4,'KPR2808150100','I-SCIENCE ACT BOOK 3B (REVISI COVER)','19','64500','64500'),(101,3,4,'KPR2808150101','I-SCIENCE ACT BOOK 4A (REVISI COVER)','8','64500','64500'),(102,3,4,'KPR2808150102','I-SCIENCE ACT BOOK 4B (REVISI COVER)','8','64500','64500'),(103,3,4,'KPR2808150103','I-SCIENCE ACT BOOK 5A ','9','64500','64500'),(104,3,4,'KPR2808150104','I-SCIENCE ACT BOOK 5B','9','64500','64500'),(105,3,4,'KPR2808150105','I-SCIENCE ACT BOOK 6A (REVISI COVER)','2','64500','64500'),(106,3,4,'KPR2808150106','I-SCIENCE ACT BOOK 6B (REVISI COVER)','2','64500','694500'),(107,3,4,'KPR2808150107','HANYU 1 (TB+WB)','17','40500','40500'),(108,3,4,'KPR2808150108','HANYU 2 (TB+WB)','18','40500','40500'),(109,3,4,'KPR2808150109','HANYU 3 (TB+WB)','19','40500','40500'),(110,3,4,'KPR2808150110','HANYU 4 (TB+WB)','8','40500','40500'),(111,3,4,'KPR2808150111','HANYU 5 (TB+WB)','10','40500','40500'),(112,3,4,'KPR2808150112','HANYU 6 (TB+WB)','2','40500','40500'),(113,3,4,'KPR2808150113','NEW CIVIC MORAL EDUCATION CHINESE P1','17','99000','99000'),(114,3,4,'KPR2808150114','NEW CIVIC MORAL EDUCATION CHINESE P2','18','99000','99000'),(115,3,4,'KPR2808150115','NEW CIVIC MORAL EDUCATION CHINESE P3','19','99000','99000'),(116,3,4,'KPR2808150116','NEW CIVIC MORAL EDUCATION CHINESE P4','3','99000','99000'),(117,3,4,'KPR2808150117','NEW CIVIC MORAL EDUCATION CHINESE P5','10','99000','99000'),(118,3,4,'KPR2808150118','NEW CIVIC MORAL EDUCATION CHINESE P6','2','99000','99000'),(119,3,4,'KPR2808150119','DI ZI QUI','15','94000','94000'),(120,3,4,'KPR2808150120','MPH HE TB 1','16','70000','70000'),(121,3,4,'KPR2808150121','MPH HE TB 2','18','70000','70000'),(122,3,4,'KPR2808150122','MPH HE TB 3','19','70000','70000'),(123,3,4,'KPR2808150123','MPH HE TB 4','8','66000','66000'),(124,3,4,'KPR2808150124','MPH HE TB 5','10','66000','66000'),(125,3,4,'KPR2808150125','MPH HE TB 6','4','66000','66000'),(126,3,4,'KPR2808150126','MPH HE ACT BOOK 1','16','60000','60000'),(127,3,4,'KPR2808150127','MPH HE ACT BOOK 2','18','60000','60000'),(128,3,4,'KPR2808150128','MPH HE ACT BOOK 3','19','60000','60000'),(129,3,4,'KPR2808150129','MPH HE ACT BOOK 4','8','53000','53000'),(130,3,4,'KPR2808150130','MPH HE ACT BOOK 5','10','53000','53000'),(131,3,4,'KPR2808150131','MPH HE ACT BOOK 6','4','53000','53000'),(132,3,4,'KPR2808150132','PKN 1','','',''),(133,3,4,'KPR2808150133','PKN 2','','',''),(134,3,4,'KPR2808150134','PKN 3','','',''),(135,3,4,'KPR2808150135','PKN 4','','',''),(136,3,4,'KPR2808150136','PKN 5','','',''),(137,3,4,'KPR2808150137','PKN 6','','',''),(138,3,4,'KPR2808150138','IPS 1','','',''),(139,3,4,'KPR2808150139','IPS 2','','',''),(140,3,4,'KPR2808150140','IPS 3','','',''),(141,3,4,'KPR2808150141','IPS 4','','',''),(142,3,4,'KPR2808150142','IPS 5','','',''),(143,3,4,'KPR2808150143','IPS 6','','',''),(144,3,4,'KPR3108150144','BHS INDONESIA 1A','','',''),(145,3,4,'KPR3108150145','BHS INDONESIA 1B','','',''),(146,3,4,'KPR3108150146','BHS INDONESIA 2A','','',''),(147,3,4,'KPR3108150147','BHS INDONESIA 2B','','',''),(148,3,4,'KPR3108150148','BHS INDONESIA 3A','','',''),(149,3,4,'KPR3108150149','BHS INDONESIA 3B','','',''),(150,3,4,'KPR3108150150','BHS INDONESIA 4A','','',''),(151,3,4,'KPR3108150151','BHS INDONESIA 4B','','',''),(152,3,4,'KPR3108150152','BHS INDONESIA 5A','','',''),(153,3,4,'KPR3108150153','BHS INDONESIA 5B','','',''),(154,3,4,'KPR3108150154','BHS INDONESIA 6A','','',''),(155,3,4,'KPR3108150155','BHS INDONESIA 6B','','',''),(156,3,4,'KPR3108150156','WASIS BASA JAWA 4','','',''),(157,3,4,'KPR3108150157','WASIS BASA JAWA 5','','',''),(158,3,4,'KPR3108150158','WASIS BASA JAWA 6','','',''),(159,3,5,'KPR3108150159','CAMBRIDGE  CHECKPOINT ENG TB 7','4','288000','288000'),(160,3,5,'KPR3108150160','CAMBRIDGE  CHECKPOINT ENG TB 8','','288000','288000'),(161,3,5,'KPR3108150161','CAMBRIDGE  CHECKPOINT ENG WB 7','','',''),(162,3,5,'KPR3108150162','CAMBRIDGE  CHECKPOINT ENG WB 8','','',''),(163,3,5,'KPR3108150163','CAMBRIDGE  CHECKPOINT SCIENCE TB 7','','',''),(164,3,5,'KPR3108150164','CAMBRIDGE  CHECKPOINT SCIENCE TB 8','','',''),(165,3,5,'KPR3108150165','CAMBRIDGE  CHECKPOINT SCIENCE WB 7','','',''),(166,3,5,'KPR3108150166','CAMBRIDGE  CHECKPOINT SCIENCE WB 8','','',''),(167,3,5,'KPR3108150167','NEW SYLLABUS  MATHS TB 1','4','315000','315000'),(168,3,5,'KPR3108150168','NEW SYLLABUS  MATHS TB 2','2','315000','315000'),(169,3,5,'KPR3108150169','NEW SYLLABUS  MATHS WB 1 (7 EDT)','4','147000','147000'),(170,3,5,'KPR3108150170','NEW SYLLABUS  MATHS WB 2  (7 EDT)','2','147000','147000'),(171,3,5,'KPR3108150171','EARTH OUR HOME TB 1 (2ND edt)','4','178000','178000'),(172,3,5,'KPR3108150172','EARTH OUR HOME TB 2 (2ND edt)','2','178000','178000'),(173,3,5,'KPR3108150173','EARTH OUR HOME WB 1 NA (2ND edt)','4','112000','112000'),(174,3,5,'KPR3108150174','EARTH OUR HOME WB 2 NA (2ND edt)','2','107000','107000'),(175,3,5,'KPR3108150175','HANYU 7 (TB+WB)','4','47000','47000'),(176,3,5,'KPR3108150176','HANYU 8 (TB+WB)','2','47000','47000');
/*!40000 ALTER TABLE `pos_produk` ENABLE KEYS */;

#
# Structure for table "pos_produkbiaya"
#

DROP TABLE IF EXISTS `pos_produkbiaya`;
CREATE TABLE `pos_produkbiaya` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_produkbiaya"
#

/*!40000 ALTER TABLE `pos_produkbiaya` DISABLE KEYS */;
INSERT INTO `pos_produkbiaya` VALUES (1,3,'2','KBB1107150001','RENOVASI','50000'),(2,6,'3','KBB1107150002','GAJI PEGAWAI','50000');
/*!40000 ALTER TABLE `pos_produkbiaya` ENABLE KEYS */;

#
# Structure for table "pos_produkjasa"
#

DROP TABLE IF EXISTS `pos_produkjasa`;
CREATE TABLE `pos_produkjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pos_produkjasa"
#

/*!40000 ALTER TABLE `pos_produkjasa` DISABLE KEYS */;
INSERT INTO `pos_produkjasa` VALUES (1,6,'1','KPR1107150025','KURSUS MANDARIN','70000'),(2,6,'3','KPR1107150026','KURSUS BALET','150000');
/*!40000 ALTER TABLE `pos_produkjasa` ENABLE KEYS */;

#
# Structure for table "pos_situs"
#

DROP TABLE IF EXISTS `pos_situs`;
CREATE TABLE `pos_situs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email_master` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `judul_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `slogan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `keywords` text COLLATE latin1_general_ci NOT NULL,
  `maxkonten` int(2) NOT NULL DEFAULT '5',
  `maxadmindata` int(2) NOT NULL DEFAULT '5',
  `maxdata` int(2) NOT NULL DEFAULT '5',
  `maxgalleri` int(2) NOT NULL DEFAULT '4',
  `widgetshare` int(2) NOT NULL DEFAULT '0',
  `theme` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'tcms',
  `author` text COLLATE latin1_general_ci NOT NULL,
  `alamatkantor` text COLLATE latin1_general_ci NOT NULL,
  `publishwebsite` int(1) NOT NULL DEFAULT '1',
  `publishnews` int(2) NOT NULL,
  `maxgalleridata` int(11) NOT NULL,
  `widgetkomentar` int(2) NOT NULL DEFAULT '1',
  `widgetpenulis` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# Data for table "pos_situs"
#

/*!40000 ALTER TABLE `pos_situs` DISABLE KEYS */;
INSERT INTO `pos_situs` VALUES (1,'rekysda@gmail.com','Student Service','http://localhost/sistermeta/student/','Point Of Sales','WebDesign dengan sistem Responsive','sisfohrd,surabaya,indonesia',5,50,5,4,3,'pos','Elyon Christian School','Surabaya',1,1,12,1,2);
/*!40000 ALTER TABLE `pos_situs` ENABLE KEYS */;

#
# Structure for table "pos_supplier"
#

DROP TABLE IF EXISTS `pos_supplier`;
CREATE TABLE `pos_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "pos_supplier"
#

/*!40000 ALTER TABLE `pos_supplier` DISABLE KEYS */;
INSERT INTO `pos_supplier` VALUES (5,'SUP1307150004','PD PURNAMA RAYA','PLAZA GRAHA FAMILY BLOK B-28 MIDDLE RING','031.7344875','Tunai','0'),(6,'SUP1307150006','ERLANGGA','SBY','0','Tunai','0'),(7,'SUP1307150007','NATHA JAYA','SBY','0','Tunai','0');
/*!40000 ALTER TABLE `pos_supplier` ENABLE KEYS */;

#
# Structure for table "pos_useraura"
#

DROP TABLE IF EXISTS `pos_useraura`;
CREATE TABLE `pos_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

#
# Data for table "pos_useraura"
#

/*!40000 ALTER TABLE `pos_useraura` DISABLE KEYS */;
INSERT INTO `pos_useraura` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','reky@teamworks.co.id','af0675a9e843c6c8f78163a9118efc78.jpg','Administrator','aktif',1,'2015-09-01 08:27:56','2010-08-27 00:00:00','2034-08-27 00:00:00','<p><b>none</b></p>'),(28,'superadmin','b11d5ece6353d17f85c5ad30e0a02360','reky@teamworks.co.id','','Administrator','aktif',1,'2015-03-21 23:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `pos_useraura` ENABLE KEYS */;

#
# Structure for table "privillege"
#

DROP TABLE IF EXISTS `privillege`;
CREATE TABLE `privillege` (
  `id_privillege` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "privillege"
#


#
# Structure for table "psb_agama"
#

DROP TABLE IF EXISTS `psb_agama`;
CREATE TABLE `psb_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "psb_agama"
#

INSERT INTO `psb_agama` VALUES (5,'Budha',5),(4,'Hindu',4),(1,'Islam',1),(3,'Katholik',3),(2,'Protestan',2);

#
# Structure for table "psb_angsuran"
#

DROP TABLE IF EXISTS `psb_angsuran`;
CREATE TABLE `psb_angsuran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cicilan` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `diskon` float(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`replid`,`cicilan`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#
# Data for table "psb_angsuran"
#

/*!40000 ALTER TABLE `psb_angsuran` DISABLE KEYS */;
INSERT INTO `psb_angsuran` VALUES (1,1,'in house pertama',15.00),(2,2,'in house kedua',12.00),(3,3,'in house ketiga',10.00),(4,4,'in house keempat',8.00),(5,5,'in house kelima',6.00),(6,6,'in house keenam',4.00),(7,7,'in house ketujuh',2.00),(8,8,'in house kedelapan',1.00),(9,9,'in house kesembilan',0.00),(10,10,'in house kesepuluh',0.00),(11,11,'in house kesebelas',0.00),(12,12,'in house keduabelas',0.00);
/*!40000 ALTER TABLE `psb_angsuran` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa"
#

DROP TABLE IF EXISTS `psb_calonsiswa`;
CREATE TABLE `psb_calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL DEFAULT '',
  `nisn` varchar(100) NOT NULL DEFAULT '',
  `kelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsiswa` int(10) unsigned NOT NULL DEFAULT '0',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `sekolahasal` varchar(100) NOT NULL,
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `kriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `golongan` int(10) unsigned NOT NULL DEFAULT '0',
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
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
  `photo` longtext,
  `alamat` varchar(255) DEFAULT NULL,
  `kodepos` varchar(8) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `pinbb` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(300) DEFAULT NULL,
  `ketkesehatan` varchar(300) NOT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `diterimadikelas` varchar(25) DEFAULT NULL,
  `ijazah` varchar(55) DEFAULT NULL,
  `keterangan` text,
  `discsubsidi` decimal(10,0) DEFAULT '0',
  `discsaudara` decimal(10,0) DEFAULT '0',
  `disctunai` decimal(10,0) DEFAULT '0',
  `setbiaya` int(10) NOT NULL DEFAULT '0',
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `namabank` varchar(50) NOT NULL DEFAULT '',
  `rekening` varchar(50) NOT NULL DEFAULT '',
  `grup` int(10) unsigned NOT NULL DEFAULT '0',
  `angsuran` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`kelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

#
# Data for table "psb_calonsiswa"
#

INSERT INTO `psb_calonsiswa` VALUES (25,'000003',NULL,'valentina dijah yellow','','',0,0,NULL,1,0,'',2,1,1,0,0,0,0,'L','medan','2015-07-03',NULL,0,0,NULL,0.0,0.0,'-','1_67614e26e8.jpeg','jl.panjang',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,200000,0,0,1,0,'','',0,1),(28,'000004',NULL,'Darren Evan Tin','','',0,0,NULL,1,0,'',1,4,3,0,0,0,0,'L','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(29,'000005',NULL,'Megan Davis Zheng','','',0,0,NULL,1,0,'',1,4,3,0,2,0,0,'P','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081330900123',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(30,'000006',NULL,'Justin Ong','','',0,0,NULL,1,0,'',1,4,3,0,2,0,0,'L','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081 23256838',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(31,'000007',NULL,'Jordyn Edward Motanto','','',0,0,NULL,1,0,'',1,4,3,0,0,0,0,'L','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081 8307043',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(32,'000008',NULL,'Lunabelle Veloxia Taslim','','',0,0,NULL,1,0,'',1,4,3,0,0,0,0,'P','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081 331685888',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(33,'000009',NULL,'Aaron William Soemarno','','',0,0,NULL,1,0,'',1,1,3,0,3,0,0,'L','Surabaya','2014-02-17',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Asri AF-2,surabaya',NULL,'0317480970,085100711',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,2),(34,'000010',NULL,'Kaylee Weng Okawida','','',0,0,NULL,1,0,'',1,1,3,0,5,0,0,'L','Surabaya','2013-11-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Kutisari Indah Barat III/74 Surabaya',NULL,'08175089468,08383032',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(35,'000011',NULL,'William Juvandy Yulieanto','','',0,0,NULL,1,0,'',1,1,3,0,5,0,0,'L','Surabaya','2014-03-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Raya Menganti Wiyung No.10',NULL,'081944214785',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(36,'000012',NULL,'Carly Rei Chen','','',0,0,NULL,1,0,'',1,1,3,0,3,0,0,'P','Surabaya','2013-12-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Dukuh Kupang XI/9-11',NULL,'08156029002',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(37,'000013',NULL,'Adjie Reksa Nugroho','','',0,0,NULL,1,0,'',1,2,3,0,1,0,0,'L','Surabaya','2013-02-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Ikan Mungsing 8 No 9',NULL,'0313535285,081654343',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(38,'000014',NULL,'Aldrin Reynard Herdianto','','',0,0,NULL,1,0,'',1,2,3,0,5,0,0,'L','Surabaya','2013-07-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'South Emerald Mansion ',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(39,'000015',NULL,'William Halim ','','',0,0,NULL,1,0,'',1,2,3,0,3,0,0,'L','Surabaya','2013-06-13',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat XII/XI',NULL,'0317329775,081654059',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(40,'000016',NULL,'Janice Zhuang','','',0,0,NULL,1,0,'',1,2,3,0,0,0,0,'P','Surabaya','2013-01-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Perum Graha Family A/35',NULL,'082139226000',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(41,'000017',NULL,'Axel Oesjady','','',0,0,NULL,1,0,'',1,2,3,0,5,0,0,'L','Surabaya','2013-09-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Palma H11/28 Surabaya',NULL,'08113360539,08123019',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(42,'000018',NULL,'Archie Oesjady','','',0,0,NULL,1,0,'',1,2,3,0,5,0,0,'L','Surabaya','2013-09-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Palma H11/28 Surabaya',NULL,'08113360539,08123019',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(43,'000019',NULL,'Eugene Sinclair Sutanto','','',0,0,NULL,1,0,'',1,2,3,0,3,0,0,'L','Surabaya','2013-09-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan 8 No 39',NULL,'0317348171,081333511',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(44,'000020',NULL,'George Maverick candra','','',0,0,NULL,1,0,'',1,2,3,0,5,0,0,'L','surabaya','2013-05-31',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Chofa,Alamanda RF 2',NULL,'0317326026,085730908',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(45,'000021',NULL,'Lindsay Auryn Gunawan ','','',0,0,NULL,1,0,'',1,2,3,0,3,0,0,'P','surabaya','2013-02-27',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Royal Residence B2-125',NULL,'0818528696',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(46,'000022',NULL,'Jessica Aurellia Wibowo','','',0,0,NULL,1,0,'',1,2,3,0,5,0,0,'P','surabaya','2012-12-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Sulung 4/2,surabaya',NULL,'087853818718',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(47,'000023',NULL,'Maxon Dhammika Cahyadi','','',0,0,NULL,1,0,'',1,2,3,0,5,0,0,'L','surabaya','2012-12-28',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Manyar Jaya Praja IV D96',NULL,'0811547033',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(48,'000024',NULL,'Cordelia Sucarita Wang','','',0,0,NULL,1,0,'',1,5,3,0,5,0,0,'P','surabaya','2012-04-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Darmo Baru Barat 10/17 Surabaya',NULL,'0317314875,083849694',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(49,'000025',NULL,'Vanisha Aiko Delphine Lesmana','','',0,0,NULL,1,0,'',1,5,3,0,2,0,0,'P','surabaya','2012-05-04',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Blauran 5/42',NULL,'08123233019',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(50,'000026',NULL,'Matthew Hasan Soetomo','','',0,0,NULL,1,0,'',1,5,3,0,5,0,0,'L','surabaya','2012-08-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan V/57',NULL,'0317346247,081230453',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1);

#
# Structure for table "psb_calonsiswa_ayah"
#

DROP TABLE IF EXISTS `psb_calonsiswa_ayah`;
CREATE TABLE `psb_calonsiswa_ayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_ayah"
#

/*!40000 ALTER TABLE `psb_calonsiswa_ayah` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_ayah` VALUES (24,25,'','','0000-00-00',0,'','','',0,'','',''),(25,26,'','','0000-00-00',0,'','','',0,'','',''),(26,27,'','','0000-00-00',0,'','','',0,'','',''),(27,28,'Huinto Tin','','0000-00-00',0,'','','',0,'081 75175117','',''),(28,29,'David Teguh Budainto','','0000-00-00',0,'','','',0,'0315340522','',''),(29,30,'Irwanto','','0000-00-00',0,'','','',0,'031. 7318473','',''),(30,31,'Rendy Motanto','','0000-00-00',0,'','','',0,'031. 77556589','',''),(31,32,'Triady Taslim','','0000-00-00',0,'','','',0,'031. 77120122','',''),(32,33,'Romy Janto Soemarno','','0000-00-00',0,'Indonesia','','swasta',0,'','73ec9792',''),(33,34,'Ifan Okawida','','0000-00-00',0,'','','',0,'','',''),(34,35,'Zendy Yulieanto','','0000-00-00',0,'','','',0,'','',''),(35,36,'Andy Prayitno','','0000-00-00',0,'','','',0,'','',''),(36,37,'Prapto Nugroho','','0000-00-00',0,'','','',0,'','',''),(37,38,'Adi Surya Herdianto','','0000-00-00',0,'','','',0,'','',''),(38,39,'Richy Setyabudi','','0000-00-00',0,'','','',0,'','',''),(39,40,'Yohan Tjendra','','0000-00-00',0,'','','',0,'','',''),(40,41,'Echy Oesjady','','0000-00-00',0,'','','',0,'','',''),(41,42,'Echy Oesjady','','0000-00-00',0,'','','',0,'','',''),(42,43,'David Sugianto Sutanto','','0000-00-00',0,'','','',0,'','',''),(43,44,'Hengky candra','','0000-00-00',0,'','','',0,'','',''),(44,45,'Yohan Gunawan','','0000-00-00',0,'','','',0,'','',''),(45,46,'Wibowo Sundoro','','0000-00-00',0,'','','',0,'','',''),(46,47,'Jefri Gunawan','','0000-00-00',0,'','','',0,'','',''),(47,48,'Chitrahadi Sudirman','','0000-00-00',0,'','','',0,'','',''),(48,49,'Lucky Lesmana','','0000-00-00',0,'','','',0,'','',''),(49,50,'Marcus','','0000-00-00',0,'','','',0,'','','');
/*!40000 ALTER TABLE `psb_calonsiswa_ayah` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_ibu"
#

DROP TABLE IF EXISTS `psb_calonsiswa_ibu`;
CREATE TABLE `psb_calonsiswa_ibu` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_ibu"
#

/*!40000 ALTER TABLE `psb_calonsiswa_ibu` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_ibu` VALUES (24,25,'','','2015-07-02',0,'','','',0,'','',''),(25,26,'','','0000-00-00',0,'','','',0,'','',''),(26,27,'','','0000-00-00',0,'','','',0,'','',''),(27,28,'Helen Novalisa Ukorawung','','0000-00-00',0,'','','',0,'03170129088','',''),(28,29,'Stephanie','','0000-00-00',0,'','','',0,'03131250123','',''),(29,30,'Lince R Wijaya','','0000-00-00',0,'','','',0,'031. 7318473','',''),(30,31,'Silvia Kuncoro','','0000-00-00',0,'','','',0,'','',''),(31,32,'Mia Hapsari','','0000-00-00',0,'','','',0,'031. 70218682','',''),(32,33,'Vivi Pratiwi','','0000-00-00',0,'Indonesia','','',0,'','','renatavivipratiwi@gmail.com'),(33,34,'Selvi Januarini Wibhawa','','0000-00-00',0,'','','',0,'','','okawida_14@yahoo.com'),(34,35,'Vince Pongawa','','0000-00-00',0,'','','',0,'','',''),(35,36,'Yoren Viryamarchyo','','0000-00-00',0,'','','',0,'','',''),(36,37,'Romana Thensy Sheilla Dewi','','0000-00-00',0,'','','',0,'','',''),(37,38,'Silvia Irene','','0000-00-00',0,'','','',0,'','',''),(38,39,'Silvia','','0000-00-00',0,'','','',0,'','',''),(39,40,'Ayu Trisnawaty','','0000-00-00',0,'','','',0,'','',''),(40,41,'Winda Anggraini Lukito','','0000-00-00',0,'','','',0,'','',''),(41,42,'Winda Anggraini Lukito','','0000-00-00',0,'','','',0,'','',''),(42,43,'Veronica Basuki','','0000-00-00',0,'','','',0,'','',''),(43,44,'Emilia Amsal','','0000-00-00',0,'','','',0,'','',''),(44,45,'Olivia Sulistio','','0000-00-00',0,'','','',0,'','',''),(45,46,'Linda Setiawati','','0000-00-00',0,'','','',0,'','',''),(46,47,'Linda','','0000-00-00',0,'','','',0,'','',''),(47,48,'Meliana Kusuma','','0000-00-00',0,'','','',0,'','',''),(48,49,'Lily Indahyani Santoso','','0000-00-00',0,'','','',0,'','',''),(49,50,'Imelda','','0000-00-00',0,'','','',0,'','','chau_su@yahoo.com');
/*!40000 ALTER TABLE `psb_calonsiswa_ibu` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_keluarga"
#

DROP TABLE IF EXISTS `psb_calonsiswa_keluarga`;
CREATE TABLE `psb_calonsiswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `kakek_nama` varchar(100) NOT NULL DEFAULT '',
  `kakek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `nenek_nama` varchar(100) NOT NULL DEFAULT '',
  `nenek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_keluarga"
#

/*!40000 ALTER TABLE `psb_calonsiswa_keluarga` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_keluarga` VALUES (24,25,'','0000-00-00','','0000-00-00','0000-00-00'),(25,26,'','0000-00-00','','0000-00-00','0000-00-00'),(26,27,'','0000-00-00','','0000-00-00','0000-00-00'),(27,28,'','0000-00-00','','0000-00-00','0000-00-00'),(28,29,'','0000-00-00','','0000-00-00','0000-00-00'),(29,30,'','0000-00-00','','0000-00-00','0000-00-00'),(30,31,'','0000-00-00','','0000-00-00','0000-00-00'),(31,32,'','0000-00-00','','0000-00-00','0000-00-00'),(32,33,'','0000-00-00','','0000-00-00','0000-00-00'),(33,34,'','0000-00-00','','0000-00-00','0000-00-00'),(34,35,'','0000-00-00','','0000-00-00','0000-00-00'),(35,36,'','0000-00-00','','0000-00-00','0000-00-00'),(36,37,'','0000-00-00','','0000-00-00','0000-00-00'),(37,38,'','0000-00-00','','0000-00-00','0000-00-00'),(38,39,'','0000-00-00','','0000-00-00','0000-00-00'),(39,40,'','0000-00-00','','0000-00-00','0000-00-00'),(40,41,'','0000-00-00','','0000-00-00','0000-00-00'),(41,42,'','0000-00-00','','0000-00-00','0000-00-00'),(42,43,'','0000-00-00','','0000-00-00','0000-00-00'),(43,44,'','0000-00-00','','0000-00-00','0000-00-00'),(44,45,'','0000-00-00','','0000-00-00','0000-00-00'),(45,46,'','0000-00-00','','0000-00-00','0000-00-00'),(46,47,'','0000-00-00','','0000-00-00','0000-00-00'),(47,48,'','0000-00-00','','0000-00-00','0000-00-00'),(48,49,'','0000-00-00','','0000-00-00','0000-00-00'),(49,50,'','0000-00-00','','0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `psb_calonsiswa_keluarga` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_kontakdarurat"
#

DROP TABLE IF EXISTS `psb_calonsiswa_kontakdarurat`;
CREATE TABLE `psb_calonsiswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_kontakdarurat"
#

/*!40000 ALTER TABLE `psb_calonsiswa_kontakdarurat` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES (24,25,'','',''),(25,26,'','',''),(26,27,'','',''),(27,28,'','',''),(28,29,'','',''),(29,30,'','',''),(30,31,'','',''),(31,32,'','',''),(32,33,'','',''),(33,34,'','',''),(34,35,'','',''),(35,36,'','',''),(36,37,'','',''),(37,38,'','',''),(38,39,'','',''),(39,40,'','',''),(40,41,'','',''),(41,42,'','',''),(42,43,'','',''),(43,44,'','',''),(44,45,'','',''),(45,46,'','',''),(46,47,'','',''),(47,48,'','',''),(48,49,'','',''),(49,50,'','','');
/*!40000 ALTER TABLE `psb_calonsiswa_kontakdarurat` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_saudara"
#

DROP TABLE IF EXISTS `psb_calonsiswa_saudara`;
CREATE TABLE `psb_calonsiswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `idsaudara` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_saudara"
#

/*!40000 ALTER TABLE `psb_calonsiswa_saudara` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_calonsiswa_saudara` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_syarat"
#

DROP TABLE IF EXISTS `psb_calonsiswa_syarat`;
CREATE TABLE `psb_calonsiswa_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `syarat` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_syarat"
#

/*!40000 ALTER TABLE `psb_calonsiswa_syarat` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_calonsiswa_syarat` ENABLE KEYS */;

#
# Structure for table "psb_disctunai"
#

DROP TABLE IF EXISTS `psb_disctunai`;
CREATE TABLE `psb_disctunai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT '',
  `nilai` decimal(10,0) unsigned NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`,`nilai`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "psb_disctunai"
#

/*!40000 ALTER TABLE `psb_disctunai` DISABLE KEYS */;
INSERT INTO `psb_disctunai` VALUES (1,'diskon xxx',10,'diskon untuk xx');
/*!40000 ALTER TABLE `psb_disctunai` ENABLE KEYS */;

#
# Structure for table "psb_golongan"
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
# Structure for table "psb_kelompok"
#

DROP TABLE IF EXISTS `psb_kelompok`;
CREATE TABLE `psb_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`proses`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "psb_kelompok"
#

INSERT INTO `psb_kelompok` VALUES (1,'Gelombang 1',1,'2015-06-01','2014-10-31','oke ','2015-06-04 08:42:44'),(2,'Gelombang 2',1,'2014-11-01','2015-02-28','gel kedua','2015-06-04 08:43:24'),(3,'Gelombang 3',1,'2015-03-01','2015-06-30','','2015-06-04 08:44:10'),(4,'Gelombang 1',2,'2014-06-10','2015-06-01','','2015-06-30 05:59:49');

#
# Structure for table "psb_kondisisiswa"
#

DROP TABLE IF EXISTS `psb_kondisisiswa`;
CREATE TABLE `psb_kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "psb_kondisisiswa"
#


#
# Structure for table "psb_kriteria"
#

DROP TABLE IF EXISTS `psb_kriteria`;
CREATE TABLE `psb_kriteria` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "psb_kriteria"
#

/*!40000 ALTER TABLE `psb_kriteria` DISABLE KEYS */;
INSERT INTO `psb_kriteria` VALUES (1,'Toddler','Usia 1 - 2 Tahun',1),(2,'Playgroup 1','Usia 2-3 Tahun',1),(3,'Kindergarten 1','Usia 4-5 Tahun',1),(4,'Primary','Usia 6 Tahun',1),(5,'Playgroup 2','Usia 3-4 tahun',1),(6,'Kindergarten 2','Usia 5-6 tahun',1);
/*!40000 ALTER TABLE `psb_kriteria` ENABLE KEYS */;

#
# Structure for table "psb_photo"
#

DROP TABLE IF EXISTS `psb_photo`;
CREATE TABLE `psb_photo` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_photo"
#

/*!40000 ALTER TABLE `psb_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_photo` ENABLE KEYS */;

#
# Structure for table "psb_proses"
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "psb_proses"
#

INSERT INTO `psb_proses` VALUES (1,'Tahun Ajaran 2015-2016','PMB2015',1,'0000-00-00','0000-00-00',100,1,'1','','2015-06-04 08:40:57',NULL),(2,'Tahun Ajaran 2014-2015','PMB2014',17,'0000-00-00','0000-00-00',9000,1,'0','ok','2015-06-30 05:54:50',NULL);

#
# Structure for table "psb_setbiaya"
#

DROP TABLE IF EXISTS `psb_setbiaya`;
CREATE TABLE `psb_setbiaya` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuition` decimal(10,0) NOT NULL DEFAULT '0',
  `registration` decimal(10,0) NOT NULL DEFAULT '0',
  `material` decimal(10,0) NOT NULL,
  `krit` int(10) unsigned NOT NULL DEFAULT '0',
  `gol` int(10) unsigned NOT NULL DEFAULT '0',
  `kel` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

#
# Data for table "psb_setbiaya"
#

INSERT INTO `psb_setbiaya` VALUES (1,1000000,15000000,500000,1,1,1),(2,1000000,10000000,500000,1,2,1),(3,1000000,20000000,500000,1,3,1),(4,0,0,8000000,2,1,1),(5,0,0,0,2,2,1),(6,0,0,0,2,3,1),(7,0,0,0,3,1,1),(8,0,0,0,3,2,1),(9,0,0,0,3,3,1),(10,800000,10000000,500000,4,1,1),(11,800000,10000000,500000,4,2,1),(12,800000,10000000,500000,4,3,1),(13,4500000,15000000,2500000,1,1,2),(14,800000,35000000,7000000,1,2,2),(15,7000000,6000000,8000000,1,3,2),(16,2500000,5500000,1500000,2,1,2),(17,15000000,25000000,3500000,2,2,2),(18,15000000,25000000,5500000,2,3,2),(19,1500000,3500000,1700000,3,1,2),(20,0,0,0,3,2,2),(21,0,0,0,3,3,2),(22,0,0,0,4,1,2),(23,0,0,0,4,2,2),(24,0,0,0,4,3,2),(25,1000000,15000000,500000,1,1,3),(26,1000000,10000000,500000,1,2,3),(27,1000000,20000000,500000,1,3,3),(28,8000000,85000000,90000,2,1,3),(29,7000000,0,0,2,2,3),(30,0,0,0,2,3,3),(31,0,0,0,3,1,3),(32,0,0,0,3,2,3),(33,0,0,0,3,3,3),(34,0,0,0,4,1,3),(35,0,0,0,4,2,3),(36,0,0,0,4,3,3),(37,0,0,0,1,1,4),(38,2000000,45000000,5500000,1,2,4),(39,0,0,0,1,3,4),(40,0,0,0,2,1,4),(41,0,0,0,2,2,4),(42,0,0,0,2,3,4),(43,0,0,0,3,1,4),(44,0,0,0,3,2,4),(45,0,0,0,3,3,4),(46,0,0,0,4,1,4),(47,0,0,0,4,2,4),(48,0,0,0,4,3,4);

#
# Structure for table "psb_statussiswa"
#

DROP TABLE IF EXISTS `psb_statussiswa`;
CREATE TABLE `psb_statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "psb_statussiswa"
#


#
# Structure for table "psb_syarat"
#

DROP TABLE IF EXISTS `psb_syarat`;
CREATE TABLE `psb_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `syarat` varchar(100) NOT NULL,
  `wajib` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_syarat"
#

/*!40000 ALTER TABLE `psb_syarat` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_syarat` ENABLE KEYS */;

#
# Structure for table "psb_tmp"
#

DROP TABLE IF EXISTS `psb_tmp`;
CREATE TABLE `psb_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_tmp"
#

/*!40000 ALTER TABLE `psb_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_tmp` ENABLE KEYS */;

#
# Structure for table "psb_tmp_saudara"
#

DROP TABLE IF EXISTS `psb_tmp_saudara`;
CREATE TABLE `psb_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_tmp_saudara"
#

/*!40000 ALTER TABLE `psb_tmp_saudara` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_tmp_saudara` ENABLE KEYS */;

#
# Structure for table "pus_bahasa"
#

DROP TABLE IF EXISTS `pus_bahasa`;
CREATE TABLE `pus_bahasa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pus_bahasa"
#

/*!40000 ALTER TABLE `pus_bahasa` DISABLE KEYS */;
INSERT INTO `pus_bahasa` VALUES (1,'INA','Indonesia',''),(2,'EN','English','');
/*!40000 ALTER TABLE `pus_bahasa` ENABLE KEYS */;

#
# Structure for table "pus_buku"
#

DROP TABLE IF EXISTS `pus_buku`;
CREATE TABLE `pus_buku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katalog` int(10) unsigned NOT NULL,
  `idbuku` varchar(50) NOT NULL,
  `barkode` varchar(50) NOT NULL,
  `urut` int(11) NOT NULL DEFAULT '0',
  `callnumber` varchar(50) NOT NULL,
  `tingkatbuku` int(10) unsigned NOT NULL,
  `lokasi` int(10) unsigned NOT NULL DEFAULT '0',
  `sumber` tinyint(4) NOT NULL DEFAULT '0',
  `harga` decimal(10,2) NOT NULL DEFAULT '0.00',
  `satuan` varchar(4) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `tahun` year(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "pus_buku"
#

/*!40000 ALTER TABLE `pus_buku` DISABLE KEYS */;
INSERT INTO `pus_buku` VALUES (3,2,'0002/B/SIADU/2015','0101201500002',2,'001 Lew t',1,1,0,0.00,'IDR','2015-06-03',1,2015),(4,3,'0003/B/SIADU/2015','0101201500003',3,'001 Bla r',1,1,0,0.00,'IDR','2015-06-03',1,2015),(7,6,'0004/B/SIADU/2015','0101201500004',4,'001 Rio t',1,1,0,0.00,'IDR','2015-07-10',1,2015),(8,6,'0005/B/SIADU/2015','0101201500005',5,'001 Rio t',1,1,0,0.00,'IDR','2015-07-10',1,2015);
/*!40000 ALTER TABLE `pus_buku` ENABLE KEYS */;

#
# Structure for table "pus_detail_setting"
#

DROP TABLE IF EXISTS `pus_detail_setting`;
CREATE TABLE `pus_detail_setting` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` int(11) NOT NULL DEFAULT '0',
  `nilai` varchar(200) NOT NULL,
  `nilai2` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  `isEdit` int(1) NOT NULL DEFAULT '0',
  `isActive` int(1) NOT NULL DEFAULT '1',
  `urut` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "pus_detail_setting"
#

/*!40000 ALTER TABLE `pus_detail_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pus_detail_setting` ENABLE KEYS */;

#
# Structure for table "pus_extra"
#

DROP TABLE IF EXISTS `pus_extra`;
CREATE TABLE `pus_extra` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "pus_extra"
#

/*!40000 ALTER TABLE `pus_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pus_extra` ENABLE KEYS */;

#
# Structure for table "pus_jenisbuku"
#

DROP TABLE IF EXISTS `pus_jenisbuku`;
CREATE TABLE `pus_jenisbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pus_jenisbuku"
#

/*!40000 ALTER TABLE `pus_jenisbuku` DISABLE KEYS */;
INSERT INTO `pus_jenisbuku` VALUES (1,'HC','Hard cover',''),(2,'CD R','CD R',''),(3,'PB','Paperback',''),(4,'DVD','DVD','');
/*!40000 ALTER TABLE `pus_jenisbuku` ENABLE KEYS */;

#
# Structure for table "pus_katalog"
#

DROP TABLE IF EXISTS `pus_katalog`;
CREATE TABLE `pus_katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) NOT NULL,
  `klasifikasi-kode` varchar(10) NOT NULL DEFAULT '',
  `klasifikasi` int(10) unsigned NOT NULL DEFAULT '0',
  `callnumber` varchar(100) NOT NULL,
  `pengarang` int(10) unsigned NOT NULL DEFAULT '0',
  `penerbit` int(10) unsigned NOT NULL DEFAULT '0',
  `isbn` varchar(50) NOT NULL,
  `issn` varchar(50) NOT NULL,
  `penerjemah` varchar(200) NOT NULL,
  `tahunterbit` varchar(4) NOT NULL,
  `editor` varchar(200) NOT NULL,
  `photo` mediumblob NOT NULL,
  `photo2` longtext,
  `kota` varchar(20) NOT NULL,
  `volume` varchar(50) NOT NULL,
  `seri` varchar(100) NOT NULL,
  `edisi` varchar(50) NOT NULL,
  `halaman` int(11) NOT NULL DEFAULT '0',
  `dimensi` varchar(20) NOT NULL,
  `bahasa` int(10) unsigned NOT NULL DEFAULT '0',
  `jenisbuku` int(10) unsigned NOT NULL DEFAULT '0',
  `deskripsi` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "pus_katalog"
#

/*!40000 ALTER TABLE `pus_katalog` DISABLE KEYS */;
INSERT INTO `pus_katalog` VALUES (2,'The Cronicle of Narnia The Lion, The Witch`And The Wardrobe','001',1,'',3,2,'','','','2013','',X'2F396A2F34414151536B5A4A5267414241514141415141424141442F2F67413851314A4651565250556A6F675A325174616E426C5A7942324D5334774943683163326C755A79424A536B63670D0A536C4246527942324F4441704C4342786457467361585235494430674D54417743762F6241454D414151454241514542415145424151454241514542415145424151454241514542415145420D0A41514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662F6241454D4241514542415145424151454241514542415145420D0A4151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662F4141424549414D67410D0A69774D4249674143455145444551482F7841416641414142425145424151454241514141414141414141414141514944424155474277674A4367762F784143314541414341514D44416751440D0A42515545424141414158304241674D4142424546456945785151595455574548496E45554D6F47526F51676A5172484246564C523843517A596E4B4343516F574678675A4769556D4A7967700D0A4B6A51314E6A63344F547044524556475230684A536C4E5556565A5857466C615932526C5A6D646F6157707A6448563264336835656F4F456859614869496D4B6B704F556C5A61586D4A6D610D0A6F714F6B7061616E714B6D7173724F3074626133754C6D367773504578636248794D6E4B3074505531646258324E6E6134654C6A354F586D352B6A7036764879382F5431397666342B66722F0D0A7841416641514144415145424151454241514542414141414141414141514944424155474277674A4367762F78414331455141434151494542414D454277554542414142416E6341415149440D0A4551514649544547456B4652423246784579497967516755517047687363454A497A4E53384256696374454B46695130345358784678675A4769596E4B436B714E5459334F446B36513052460D0A526B644953557054564656575631685A576D4E6B5A575A6E61476C7163335231646E64346558714367345346686F6549695971536B3553566C7065596D5A71696F36536C7071656F716171790D0A733753317472653475627243773854467873664979637253303954563174665932647269342B546C3575666F36657279382F5431397666342B66722F3267414D41774541416845444551412F0D0A4150767378737137736F526B6A50544A474D6E6164703577635A7A6B5A4F4D357234322F612B2F61413857664244547642735868434C5452715069652B31474F65363143312B322F5A4C62540D0A6F3752743174414A59346D6C6D6B757346705249416F3442626C66744F4D3754745A666B55344C746C6A31774D4C6B394D5A787878304F44583552663846486278626A7866384A39474F34720D0A44706574583742634535754C3230695277475079735461344C5937595539362F6F54364F58434F573859654C764457545A7A684959334B3534664F38646A4D4E5553634B6C5041354E6A61390D0A4E543931364C45546F746466645732352B5038416A4678466A654875414D327A4C4C63544C4459376E792F44596176475670553559764D4B464B636C5A702F775655576A753033305450432F0D0A4550375A763751626C57732F4769574D5446637062614A6F616746675343686B302B5A6C774D6362324949666B38672B59337637566637516C374A4B6B3378513851716B696C674C646247310D0A5849344A2F774245736F6968366447507A5A484F4D6E7962576E565A504C436B675342695231415548436B3873334F304546526B6E646A4946637537356D6451526B636B735275795766706A0D0A4177636A4B344F434D343477503951636F384950446A4459716E4348436555756E48326C347A77385A573978795637727137394F6A335034517A72784A347A654671785766343958355643550D0A4B386C797079584D6E5A7658527539746D7A3165342B5058786D765864702F695234756650336C54574C3246546E757068654D5A414A36355051634441507A31385A506A4438634E542F73540D0A7772345338632B4950455069587852726D6D364C702F68315069623470384A3635633346394B6F67753766556448316D43384668626F4A4A4C794F534E59456752356D6D3352694E2B7A696A0D0A33375977444A4B386971714B64306B68636C4643647A764A4730454850384F426A487333784D38482F4154396C72344D6144385976326A2F414170714D336A76346A366C4E705867377866380D0A504A6F332B4C48773746746179367834586B30625474597456384C6174704D4E3559576375757A3668647952523332766A5332744E5774376352772F432F5343796E6772677677367A525A520D0A772F772F6738347A536C5677754171797774434477314F6E546336754C756B326F3070716A424B53536C4F744B4E3034325073504154483851385765492B54787A764E3839786553594C45340D0A65706D4E436E5771564869565778464B4377795533464B64536C3961724A78764F446F516B6F745361507A5038496648543971713738532B4F50683770756D6549377A786634416B743762550D0A394A75664731337266684F637378334A2F624776367446724676656168417075724753313133556F3735576D6D4F6C6F73636B744F314C3458667446667445654A49645338642B50394D2B460D0A486857797358686D384F77664567367872646C507055456B3137653276687A544E5367314B53397635676F74357236335733574B534570634E45556B6D39706A6D2B432F7761304C786A38560D0A4E542B49586A337842716E784F316550785665585138465161547138463571317435396A6F7343616A346774496F33736D6C6D695A684155574435496264596F3168506D4869543474364A6F0D0A576A614C7250786E384C614F76694C7842484A503459754C4853627950586233536F72693075394E6975703130386148713555765A79616C62706551324D6A355749695749412F35483537340D0A7A63515A7A677346772F683848517135545171304B475A31634E6861464F726A6378776D4B72566173734A4F464E542B7255614456436235317A74526B336F6D2F774461664266526F38502B0D0A456156585073387A5A3564786A6D644C4535686B5754356C576D7147437954475965717342444E6E4B616A44453475634B474A6975564E533970434D55706370393766424C344D654C7272340D0A652B4339513858654C37652F7458734934626E57745831784C58577454743431614748555246646C354C69346D6B4D635447344D6233633845377449306A4B7A2B302B4B50684E384F7644570D0A6D2F3239725878432F774345653069614D7A70656167397330556472464845743965764C4C6357712B5661796B3779666D4A6B74306A4C7A54787133382F5878462B4E2F6A5434672B4C76420D0A4F706A34735833682F51376E785732703664474C3636305777384936723465617874626657625077377031376632317242626F6B45656E2B56356356355046634971787046634776556632790D0A503275395A2B4A7669623453575769654A343957307A346233656C3669327453575548396D4C7273467A5A6638544F2F74724330737A4D3030756E4C6458466C4F59325249684639676A634A0D0A63584871356E3437654E754E7A58682B6E6C4750796A4A637270344F745157457775563457663154435A645177314C444C4531335458747356576C686163616B354F546335314A58664D322F0D0A35386A34482B456D58596669423576684D797A664E4A31715664596C5A6C57564C45597A4D61746245346834656E476F2F5A3458443038524C3255567970526A42637355724C394178712F680D0A3639686A7664493851616671656E33454B3374766372637832344E684D584D453178464D3653326A7951474F557733516A5A4563622B4D466C3071373076574C52622F53727930314B786D4D0D0A736356355958555631616C726433676D456478424C4A444930637950452B7832434F6A706B63342B567668372B30526F58683734682B45726E34482F4141723054582F6970633652726433720D0A506A57373072563744344E36726458624A4266616C48704776366B7574367244424C6478327478724D6D735736515879326C6C70326D616F4A626153767150777A5A61745936564A4A34676C0D0A303266584E62316E58664647744451394D747446304F4857504647733668723270576D6836565A6757746870567465616A4C42703972486B4C6178784269584C477638415450364C586939780D0A5434767771554D2B344979374C7374795849614E50463851777732456A4C4D4D2F6F31614F486E474E4C324C6349567163616C647077587965692F7A652B6B5A3456354634573469453872340D0A73786D4F782B6235724B7467386C6549727957437969765371346A6D6333563165486D7156434C3572537662336B744E4532343344505656794350765A366C7363456438415A487A64654F640D0A7130316561474D77794D4847394D4D77472F3841646767446365516F79774849794D726B594172506B4148384A444D32474737423456696335475277427A6A414842365A714A6C41414942350D0A775277523934594F636E506F4267345941386367562F5A537732486F4A7547486F725A78554B4E4A4E76546D76616B6D34765274612B522F4C453674537447315372566C665A757055756E710D0A32372B3065376666572B7831526C2B307868694679446E595268636E42593841466765546B446B746A4A5541564461525232743959337978352B7A33734679706A473177385678484B4756690D0A44494438716B357776492B553168704F38525A6432374A424258766C426B6B676B386B6B347A7763353756743273334335507968386873394649544B6A71423930456E627743656736386D4F0D0A775747787544787447705370526461685867326F722F6C376836314F537662574D6E5553747472314D384A69635467735452725172547573525171516C7A5362546A576F793075392F6430620D0A563162727262392B7244566265377462615554676562444733494B7347614E547547526E365A507A422B4F754B757541584A4758427764774F51636745344942347A7742323664713874384B0D0A58497666443268586E412B3061507063374538742B2B73345A574F646F7A6B4D4353446745456E64676D7575337478387A3941506C5A517641413442476366586D7638416E467A4F565442350D0A6E6D57456E4658773250787548613156705966473433447958793968354E587366376859462F5763466771384A7874577765457258582F542F433461745A6431616F762B4166525562664B640D0A754D5A42775655457363344A7A6865446B7351414342676A41417238632F322F4C78727634366544625667416D6E6543594A4E754D727575645531522B777743664B5568324F44386F50796A0D0A46667239754B7351704743427965643247475343443875426B6E6A41342F48386276323262393733343753786D514E46702F68585372654A5859676F5A4675627477764373474C5335497A670D0A6A61446745312F646E304B6376574F385A4A314A576A48416347385459726E6258757572547937424A3675793078456C75724A79617471667A42394A6A4D50715068736B30366A7865665A4A0D0A6834714E377A6E7A347A45526A625737587359374C62587166454F726B4757544368777A455A7753634F4E7973755647656742494F4D63414847526E5277365061325032782F507664586C750D0A5A43316E496867302B307459746D78353551346E755A6271557942595948694555455A5A70784A4B46546B506954385676422F772B654B485774516B756461753541756D65477448674F712B0D0A4939566C6B584351574F6A327A66615752747041755A784261672F4C4A4D484742593048345766485878706F463938525069526466384D7A6643653175725332676E7576436C3734392B4B750D0A74432F614F4B316144773761773356686F7363386B3859563562432B6E675A5A476638416378733766326A34712F53423849764231632F4533464643726D696C376D565A645770596A4756700D0A56464B6E5470536A43704A553235757A35727538625776742F4D2F683134492B4B506978472F442F41413955772B57566F526E4C4D38786856772B466854684B4D6E4B484E425471653747540D0A76464B504B326C4F795A39552F732F6547452B4F2B75613734574465443950313777356F6C35346D7362443465327A65465046386C68593363576A79574F6C2B494C37552F454C61646678610D0A72645733326A58645274645475375259376C394A302B32753068654838752F2B43722F6958346F2B4876464877483044786A34752B4D32766152346567385761746F666854343065434C44520D0A42704A302F774153517070303168346B734E493052666946464E6F386C6A704E357156376252333863576C323933653239704C72666B4A2B78667768314C344B2F7375366234426E317A77720D0A7275676645426644666958546B2F61482B4C58684B38305853467550452F696655622B79307535753948307931302F55727536652F7744375553445672375150733974494E4F74395365326A0D0A6873374C357A2F614B2B4657702F74666545664766677A347436345069333856506762712B75364E34513862654337535451547153664658346632586A5434642B49662B45595855376A54550D0A73726E564E4958772F714F6C36504C635731792B68584678597350745A74442F414A6F2B4C6E30686547754E36654C6F59544E63586A335577324A782B4777314B724F7453792F4B466961470D0A4B78456130373264616A52724F654C6A7970302F5A53336A44582F5162776B384563373455717872314B4F42793135624767716D4C7846476C516E6D576334654657685357466930725272560D0A6F4B4F4573354B64306D3035745038416E722B496637522F6966346F5161545A65493754546B302F53376D43352B7A3654424A59796E7970497053556470726C456E59526C456D614B526F2F0D0A4D6B4F47556C54303276384177352B50507839387A346E65442F677838534E61384B3264705961586F6B756C2B4864613854576161566F3974396A486D366C623666476457757931735A62360D0A2B69677850647463475241654239302F44482F676B4C3436766648767759305478333434305A4C50346E2B4A7454536677396F746C72656D654B4C4C775A345A304F2F3133784672743746340D0A71306E53546F6A774E61324769374C71787552426636335973785A475153667448384A4E5A306E396C6539384966414734734939452B48362B46664676695877713039784E714F703267306E0D0A566243363153777548496B6C754A4A724C554C72784C63694E5846726E554949424A424862562F492F456E475757384E35546C7559634D344B6C6D733639664D7671734530716458443453790D0A7A61705371526A656371556C53684B53556C65556C7A585450366F564469666A334E73797848477566566672744B6C6C5743784478465253784D4B55714E6557564A7839324D4B4C354B69680D0A424B4F38585A585466386C756F65493942314F79307A5250474F6E2B4A74423851364266584E6E4E65616259326966594C4637644C5735304D614666584E68396E5779753764703459566D740D0A3767543375702F6151356B6857446A4E4F38526E5435396662554C4D2B4A55316A54626E54597A7139786577496A6D4977576D715352326C31484A4A65366568576178387961574B4F654E420D0A4B7478435A497050367A5032376632455068562B316638414453372B4B4867474C534E432B4B756961506536316F76696E773942617A61663436733472615337476936384C43525939512B310D0A756F476D6132686D764C47346C4F577562615637592F795957476B58467A72454F68587766543576746A575632397A424A767332686B4D637174454538337A6F3255356A56475A6970514B370D0A4D4662366677393472796E6A6E41316175476A5043597A44316F554D64676137554B6D44713135653054556E5A2B78714F504D7070664374647A34726A5049737934587856436E586C4845590D0A6170546E5577324C704A796A587030345370754D3478625471516870613762756E354C36762F5A49746648336A2B38316E776750467575326D6A6142346476344E424C617463485439416C310D0A6D37744675786236653170664C4E44634A484A4B326E527A61544463756B6A6D3942526C6239693462566261337437554F3067746F496F524B79685866796B574C637758436F65724E7355410D0A4D784334794150472F77426D58396C667850344F3034334877372B476678413851616C72396E597A6170726D7236664234583039594244444E48416B2F6936363850573079655A4F5A4933730D0A5962783967326856496B3833374438566642727874385074426738532F45573938442B4339456D79697A366C34736D7664516D75596F5A727558543748546449304F2B665564544E76424F300D0A4F6E574531784C634E433651757843736639546641627853384576426E68536C6B2B6663655A53754C7336725471356C6C2B447853786361556672465772674B4E4F454B6B4B63612F4A566B0D0A71376A724B584A423335456A2F4E58787838507646377858346F7135726B66427561564F46636E77394B6E6C2B4E7857462B7131616A57486852786C656453644F565357486A5570576F526C0D0A4C6C6A486D6D6C65625A354136664D41414267446A62786E356C7A6E7232354765343659785655425A4F7749444D6F323541342B3767446B676E4A3548555A78774D626575574D46676B39310D0A70563148716B566E66614A627A78704C6243346C737645516D6578314F78695365614B2B74345959576657496F5A6674656C452B546557795368566650634B4747457965546E4F4F5274322B0D0A33555978327A7A3179663753344D343179486A334C4A353577375872346E4255635456776271563645384F3556594A5476434D302B654C6A4B4E7052646E617A64392F3545346F34557A72670D0A7A4D6165565A375270554D5A5577386354474648455571366A54637051744E77643454356C5A786B6B2B71636C666C714C477633736C5341756367345A666C484763636A6366626A506334740D0A774D446C51446A676A4864636B68516552774D67626363396364417874306E7A62634B4779464B735363454435676675344F306A4F51635A35775251704B7353514647534F337A636B3478320D0A4730486B6B45664C774D35483039526373485A4C6D6C467472583358464E3874756D6B585A2B646A35747474612F456D6D746232616B6E303162302B533265682B31587772756A66654150410D0A3977764B763456304A683934444930363256686B6B4E38754F687751527A6E42723076455338454D53414F567867676A494936647364767850552B4F66414F35467A384A50416B724D53446F0D0A6474443875546A374C4A4C6242547A6A4B2B58745076314249475061647050494C41486E676E485050487A44723136443643762B64446A2F41412F314C6A7A6A544279536839563475346F6F0D0A625753564C69444E31474E72394953692F4A4E482B3158422B4971597A6854686245786B30735277316B4E65584B6C4A7556544B4D726266587A763533364876434D7A4C676E4151456A63640D0A784F56586F4F41654D6E4A7A313659504838346E2F425354585069727033787A2B49756F2B47626255592F43576A6545744C754C72556258572F422B697A527A577568693675664A754E53300D0A335664564D592B55736978576431493445566C6449356A6B483948424F454A5972302B376735493478675A35365A3954675937312F4D5A2F77566A38624A6F2B722F457A54347032573538530D0A613534633046444547556D32744E4A737453767554795932466C396D7541675A574D3454473073462F716E36502B5770306646546953706E4F595A4A4468547737786D5978784757316659310D0A385458725A6A51777547774D366E4E48397A6973545577304A4B4C636D34704A6148354A346D593953782F41475277796A425A745069586A664C38756A517A436B7174484455614F4671596E0D0A4659364E4A776C2B39772B47703469635A57736F7433646A7A332F676C4E3843323859664672552F6A5238547446317939316566777A7165742F442F414676553769652B73726B51617550440D0A5775586B306C354863537A5869744F494C4F6157346A7845317930434F71466F2F77426F766A443470384766732F654366483378493853367271476F57756F2B58396A38503678717958466A0D0A6461765062665962445164436776514C65777439536E4B7464622F394574554E3166584D6B4E6E424B30574C2B7864636546376A396D3334525866682B4B43327337623465654862647042450D0A49664A5A6450746D3143496B35436E37616B736C7956646C6B6E6A615269347731666E702B305A344A3854667436654F64586D31665757384266736A66422F564E613077654C6243545069540D0A347436396F716C6645366546684D35734976446C7063577261536D724E484A62537932737430303133436A51325038416C6678546D75622B4A6669586D754B7A6A483432686C6D58593159660D0A48564B7461765771536A684D64566854705965504E556C55786D4F727768795170726D764F704B795558662F414556792F433562774A7756684B5758304D4C7A31384A7A34656C54685370510D0A58316E42305A314A7A355646516F3457457078546C5A4B4B56756C766E4857762B43756E6866777061324877353144776E6F76784B30545474443076772F726C74625730632F6775575731740D0A664A3143474B377631756A724670425046464442396D304F36302B534B4E5A4C62554C6C6474772B6E6F482F414155462B48576D33452F78413848654434374C5439513169333066545044760D0A68723746756A302F516445384B36376F384F71615930746D756C36667076696E777263615A6133457244374234663841454F7669796950326D4B335035332F4348396B763466654E664432720D0A2B4A76457433724670622B496645476F447758702B6D366E413931706E687550556C7374506E76704A4C4B3446316358556C786272484F30666B5357636C6E644D497A63794C4436585A66730D0A482F4333554C58574E52307A786234326D73744A6E7337533967686E30754A76746D71495A4C47304538326B52417953323750644632695A4674344C6C6758645568662B372B46766F6A35310D0A4C4135526E325559584478715A746C316563737678475055635256776D613036754372304D56684B7470553534716E6D464F484A614E6F314B4E3035525676354934692B6B526B554D586D570D0A535A6E6A4D52465A626A7163667264484156353457474B793656504830716C4447553553684F4F486C684A766E30584E5472527661392F3062304839752F7752346D314C78372B30743439300D0A6536384936423458384F614638475044396A59367A48722F41496C66512F4748695456745638592B496247445455695454644F7539533845615034553144566B64594A5037536874493779610D0A6462614E2F7741652F6A2F2B3356385466482F78733076346F2F442F414D582B4B6449736642657379366A34494F72506153334E704E4A434C61346165786A5753776C744C79317A615477760D0A616F6C7A5A6C5972324F513844367038502F73536644617830366376652F45505739507334644D30362B73377A5762537A73316D3169373153344E736A57476E577958566F473061327570480D0A4E784370754C363069654662714A397674612F7368664233773770397A595366447253704946312F56764368754A3131472B754C2F564E4D31794C51486774645575706E6C4E7A657958456D0D0A6F5257367A5730713662426454795277746251777639396B333051385453715A54686378784F555A4D736F7937463546684D426A3636712B7878474D78745846592B55716362714E624756630D0A58536A55715354627078676E6F75552B4F7A4C3653654255637A7832436F5A746E5573317847457A6A4559374C734C374A564D4867384E444434534371565A726D7059574748713159516A460D0A5871546E7272636B2F5A432F344B61664237776E34632B4936664572524E56384658336A573830756150776C385049623639304B33312B3573425A2B4A66454868725262352F374E384E52610D0A3965797272563361515476623231347479717879376F456C356131385266736A2B4C66482B6F654A5950324F506A62346B467A71747A4C48722B733374335A32637A77335A4D6B37437A635A0D0A6C59596369655736756D6B426865534E567A46332F77415076675A384A6643453832703646345338502B4857754E5574724F5455396338755837484774746453324E334864586B6D6F5357460D0A6B317A594C466379675153323839316158643254474A4A5950634C4C54727837692F30353750374A653662396A45304575544A76764C793874776B615249795465585A3238563743305479780D0A33666E2B5662376B437A796655384E6651673447792F475A746D4F66386556736E782B5A797730612B4379666E63595533515477396163314C6C616E52554B6B5A4A755356534F3762532B560D0A346B2B6C39786E69714F42776E446E41367A6642345A59696450485A7536616C556E43724B4F4A68476D2B5A71564F767A55584632693555354A50537837526F5878372B4366686A773350660D0A616638414158784D307A526F747234637455763769374D3773456A68754A4E5A6B30717A744C62474A4C69534B5335696A554D4E724241446979667444654676452B6E2B49724478722B7A370D0A3465384A32647670695847673674593658612F454C55726D38655672653630653373624748543737523777327371533257757250505A7876484A3971745656593162794B3361613874622B520D0A374E6F5673744B74395544764E4556646272784A346430434B444D525A747970726A33636D5638754D3261524B306E327062694D3143322B7A61706F656B4E64364E614857394D625545764E0D0A5131487959494A6D74726C6C67756B697462696131686C6E68533268764C6E793450336A54334B3238416A6C62366866515638414D6F654B7A4846385538535663332B75557350683861366A0D0A6E5777754C6868714F5A7570474471314A536A4C44314B636B3757546C79364F3650694B6E30787648624F4A5962433454686A682B6E6C6E315357497259586C554B646641314D5655792F6B0D0A6E4E553661682F74464F716D74374B36736C72354C34593150783572657253584F746548644B38476545624F7769747445304753356B3172786865334A68736D6C3162784C724D56354A70550D0A636E6D5233535157476E577347785A79626E35346F6966525855376746487A59626154675979647779526E41474F435431423535465947726549426F74386C6E714173726646374E6254534C0D0A71566C4E436A707145646D45676E742F4F6876666B6B457979327269326B436B787A4D683878622B6A616A4C712B6B32577053576A5752753061595730726C7042437A4879474C655847534A0D0A6F776B7744527153484842504E6636462B467544345834527948416344635059764734324F5859465A6A55784F4D6F714E577444477A6F7A565370556853703032334B72546A4743357052680D0A46326374542B4966456248635238533578692B4D4D39774F4377483137475379324748776452657970564D4643764832636163717453724C6C564F6271315A63716E4F313478546969366F620D0A637779537531733973484979443355594F5550484F4F76576F74704B714D727444625438324D35366E6E676745644D676E4A35354F627978756A4D575063484A4A7951547541494F303862630D0A59357A7763647167326A6C5474346B4A77526E4942366E414A34494F376A766A6738562B6B31366A6C46387572536162737271393476766F6D302B75793648353347617533644F334C7473390D0A477676312B58552F576E396D53346166344F6545523937374D4E5667335A4A2F31657233726F6F485546565A65354F4D34414666517043743877575835756546794F6553527A304A354874580D0A79392B795A4D626E3453326145383265756131434143534D47534F3435553534323341495837754D416A4C48503151417741416B4F414D44424F414230413537644B2F35372F4843697344340D0A78654A65467334716E787278484F4B756C70587A46346C4F7A377245786B764A37626E2B787668586A4A5972777A3443784D5A2B395068504A497531332F4477616F39482F774251367632610D0A745A624C334A79436A456C686746634842556465526A474363413842547867486B412F78352F384142512F3467325078482B5033692B4B2B3054576B3847654866462F6953793055624869310D0A4C783771316D2B6E614C664E6F73516A6C6B6830757A754C4B533168767475626769366451736F6A6A582B774335756F6F62536561346352517777537A7A754F504C6A5253306A64434474580D0A4A795152783667672F77417476784D764E4A316E34772F4666346A65476243322B4B487846307A346B654A74492B46476B58566C70756E2F4141762B446569515855396E706D72654C7452620D0A554C342B4B3962302B4E706458587768704E6A41386D76586C35714F767833416D7455742F757547637A347757556352634B634B5A646A4D777163593038426C6D595573445171566174656A0D0A674B2F39715958434F70434C56476E587830714E61724A744A30734C716D74753674672B47566D475538533853347643594C2F56535749786D4172597574436C436A56782B476C674B324C550D0A5A7A69366B36654564576C545355725378476C6D542B472F475837526D6D664454776434433166557250345865444C6A77625A365670337755384650425936316265453959744774375478420D0A38582F6942714F6E3639724868613376625365572B6B3054777270372B4D74513070626935697339507570594A5A75372B4C5077662B4E33777A31474834572F47335656302F7737703968430D0A6E6776774638506D7574462B4432712B43346F5573394F6D306D35747673326F654E39506A745A426261744872557345615831334D4E58384F32383130737433786E682F54353946307555360D0A6C717439346938515872334772654B504532717969545566456575336B537466367671443442557975676A7472564E734E68597832326D32695132747262784A393036373866744A3851654D0D0A2F694A384550326A6A6638416962345057766A57393050776E34737334495A504733774B316A773562572F686D4478443456756F72563539533044645A797234693043654855586B696B765A0D0A496254553761652F304B2F2F414B64344A2B6933773534545A72775878446E33446545347A7A334735526D6E456E46755665786A55772B417259544635664B6466445531422F57712B412F740D0A574D473563796E4F6E5761556B66683346583067633238553872347A79544B732B72634B3554674D33797249654638316452303534333631686366474E4B76506D69735054787A7935754C540D0A556F527155724F4D745434512F7354516A714E69645567314B3330694E375A627074436D4C336D6E57396E4C615043326D614E4A714F6B36626476622F5A316C69744831485455337878465A0D0A30336C6833766A587766702F776D2B495878492B48486776556A722B67365A4C6F756C6174727572574531733369485766374F3050784846714674706831625562697969306D4F35737247790D0A3149617646657A794A716C70633268306D2B754C612B366A34772F4354784E3847745A68306E585A4C445850442B7636644C7250674434686141365866684C34672B485A4959726933316A510D0A4C794F61356757355731754C5A3955305237716135303253574F5347612F306D36303356622B4C78746144552F6A503854724A727931302B4666694472396E66616C7164776957476C5747670D0A775257656F367271463077486B3664704F6E61586358392F4F7750326579744A6E3237593974663139374C672F4D2B4C636A7A6E4C4D54516A6B4F4D3457346B7A6E4830714368532B71346E0D0A4A616D534C443031434D6B38505570564B334E4F6B6F516674714E474D453034332F6C2B6458692F4B2B464D3979504D634C586E6E6D46346A34667962415636765057654C705A33444E35560D0A70777153556F346946576C525549566E4F5671566173366E764A746368652B4666467165484E443853366C5A366A592B4550464F747A614870327032746C5978614A714869667768707339370D0A4A615A76557637786452476D2B4A4C32345178795257742F4659585349486652376D4B4C6F2F446E6854785638522F46756E2B43394E315455745338522B4D3733574C6177686B6C305853620D0A4F3631485774526938515861506678324E685A32647850714E696C317070755A345568764959594E4B614B663750435059666831595166454C5350696E38493450694E3459316B2B4C724B500D0A7846384576446C765034725A644F38662F444F535734384561626F4C617434623037534C47382B494868615478506F506A4F352B30576B32723672346A653474626472675157395A66374C560D0A3344662F4142342B444E3467637833586A58514A31444B7979702B3953646F35596A686F3369473479524F415179736A444F34563432417A584B4D2B794878417A44455A56516F5A376B47480D0A786E4575577646786B366D49796E455946597642564B716E464F6461453844504359707066757131576E4674534F7A4E736F7A6E49633838503844684D35784E6649632F725950686A4D34340D0A5370434E4C445A7451786977754D70556E4279554B4D36654E574C7730584A653270555A75316E6465614C34447676464670347431725339596A3855516546624C553963385370706D7257680D0A76744E3065304D396E726E696544534C714779757462306A5468637979616A346930577A31693330754734572F756279326863585461766854776834703862617975682B475A4E63316658720D0A5051313144526447733955756A666174592B464A726A57313076777A4358623754714F6B32343144574C4C527261573275727532677559744A69764A346F374D3942344E7449492F687238510D0A2F4666776A316A564E523852614A6F586948513961303778446F746E7057723654384A6647576C366E345938552F464451744F306E582F4556767236615059366F624739735A4C71306277710D0A327157666972574C53393032775730752B65384961357150686137764E61384E366C65364E716569654276695A66614C712B6E586B747271576E58746A384C2F4142684A5961685A586B62430D0A5733756261514A6357397972457876454A4649794B3563767839504D75472B4E637857467936726A6548386834667A6A43564B31443265497131336C46484D6356674B744B63597A6E6849780D0A71307350517270546734754D553034575535726C39624B2B4A65423873574E7A476867732F77434A4F494D6D784E476869506130615744686E64544C634E6A366461446349347572555666450D0A316144635A71555A5361664E63354F6179574B4757377432315753526F58744A49594E5275347048747674396A6654325A7435626D474A42486636625A7A50424949796B396A41482F6551720D0A697872756A3265686172704F6B6D2B756458744738503841687A585A6451744E5531786F4E4A74504646704E644C5A474C55445A332F384161476D6164657A4855344C5741787847376B744C0D0A6165346D4E78476E767364786166744152524F306C686F6E78386B6854637A2F4147545350447678356449694435374B747070666876347653416649342B79364C34396457566C734E586B330D0A782B49654B374C55644C313638734E543036393072555966432F68364F38303756624F66547454744A55677637566F4C7579764669754C6156526245464A6F305A51526C56555A723134592F0D0A415A316E57525A585877454D6F7A6A324F66777A7A4C4B314B64535372344C6835347241356A68716B2F64713465704B4E4F6E476F6E64553452707432332B656545782B53354C6E2B6130730D0A64557A6E4A6F346A49336B6D5A3071796776712B50346A574578755859716E4263314C45557163716C565533486C6457704B707970366C2F34682B41312B4848784738572F4452353750565A0D0A66424D6D6C57643572576E43574B78754E55316E524E4F385279322B6E4A64527265545232316872576E69367672685947754E526B76596B6A6B6A67453832706F5877383148784E345238630D0A654A4E4D3154536F64523848614C632B4A6250776E6379467645486A485164416E3079587835662B484C654F56586D486758516458302F577458486B54764A4664576C7462787338727951390D0A6E2B304E615874332B306E385762657A676B753733574E582B48456C6A5A78454757357574562B456677314E766252626945616165615A5934674758655A5647636A4E5933675034672B43660D0A43667847384866455877356F2F6A6A784176673633307A523753376A317277747066682F784C706C6A50714938557A3658624E702B71336A654750486C78712F6943564A4E534A314F38384E0D0A616E706C6C6469305731744C537A3533786A6E636644336847746B4E47474C34737A764B343578695A3457685435364F58356269613835304B697078636F3063565877324779716A7A7457560D0A53724E36786258577544386B6E3469635930732B72537758435752356E2F5A4F4768694D545669712B5A5A6E68634B6F5671637173755756576853784F4B7A6576374F4C54396E53676B6B370D0A5079517435696C34384E47366F79754343434F636E413344424849494F5054414E516950494446736C53435344673873654D3541394E33494142366D76562F696E3441303777483432754C480D0A7732576C2B482F696E5362443467664379376C444D5A66416669677958566C7063374575427150684F2F6A3144776C71554C797663704C6F385631632B573137477038316B745337466A49710D0A7031565659715175357575416344504935366B6A423446667458442F414242672B4A6367774F643447584C537875486A566E53356B366D4778436A4B474A7774614E334B465444346D6E586F0D0A7A556B705870786C5A7153507866694C4A4D58777A6E6D5935466A5534314D42695A306F567556386D4B7737616C68635453646C7A5538546836754872526357342F764774343250306C2F590D0A306E45337732316D41456636503470753277434F664E73624674704C45675949626E4241446463626858324A354D7041494F515143447548635A374874302F446E6D766954396970322F34520D0A76786A625978356574324E795166573473664C33486A417A396E553848473044355431483345694D36717769414248546E6A484863453976556A303478582B4633306D634C4C4365504869580D0A5474464B726E306359727037597A4C63717239453957334A767A767166367365424F4B6A57384965424B737456484A5668393233664459334D635061366A4A32537032317462546535364C720D0A4678474E4D3142517777396E636F5662474372784D75316953514F47415A686E4135554841422F6E543858547753367872553171734D635635725771584F79435062476F7564517572686E5A0D0A6B43376D63746D5669433868473569584F612F667A7856715832447733713138386979665A374B35757634565255675573792F4D78445941596B6B674847334730562F50447139344738764C0D0A444D684572376D47386269546B6A35572B5973573448335377795477503942506F575A5A684B6643504847645638505371567063523552684B47497155616371744746444A713153764368550D0A6C435571616E37654850794F4E306B704838312F536B7874654F64634C355A54784E654E4235526D4E6245304B6453636156575563665268526C556A4753552B574E4F584C7A7039576958520D0A624B77314C56394F306E564E66384F2B4737585537714B336D3166785072656E6146704E6E4137517263584631663670506257365277524F387278724C4E6353425757434353566B52726E780D0A56315452626E34726646475453504550687678505A617A385266486E696A544E56384B363370666948544C72516465385836767175693348327A536271376974705A644F7662565A624B37610D0A4339696C6A6C563446455A592B6461787238476B32384D303856376366615A6D686967734C4B57376C5972424E634F3231442B356957474274377534556B426553655050376E346C615848630D0A4B45307278425046504C4A444464445442485A5454726570703757304E314E634A464A4E4A644D593431566957387553516E5975542F52476435316C5755386134584F4D797A7A43344F6A680D0A4D697847587A7746616C556B3367637A78655779725969552B567755586A4B65416F38306E79786A566A43667870532F494F48386A7A6A4F7543635A6C75565A4269386250473539517863630D0A665378464F4638666C5742783871464B4E4E79553234344B4F593131474E7053644B565350753035535832333848766A646F33683351626E345066476E52702F486E3750757661676C37506F0D0A384A755234692B476D74764E4B353862664436397457476F57556B636C785050726D686165366E55466E764C7A53304E35633676706E6962775834712F456A527276582F41493861687074680D0A59587568655038413471654A702F4350693639316A56644C6A742F44672B4973327457545336515044317931395965493758536247336D6C6D763841546A506F31314E5A6772427145367A2B0D0A5661723851494E4C7539517347306A565A5459327258747A637844546D743074413049567730756F78544E754D6A4B4173586D376F70474B6856526E762B48664569654A49395156744831440D0A5378706873675266697A4A6B4E316243354352765A586C374675534B534979787534614D537148554531387250687667584F654A73326A77356E36776561592F4B3833776A796D6A7A66556F0D0A59326A6D5647654C7863594A4F6E476850465A47364F4B70776879546E526B6D6E72452B736F353978336B7644655456654A75487034724A63426D755634332B3173537161787454413138740D0A6C444359626E6C4F4E52312F716D6430363245717A6271553664614D726539476F646A483852726A3464366834573858525738317266365434683048572F442F414E707339566A463771476B0D0A61685A3672627061437A6861396E496B746F3552396A6A6C62614E7A4C734C4776542F446E786438562B472F6A572F786A30507776344C73486B385361703477673849475058702F44396E720D0A2B737958567A647A57654E537339516A735676723636314348544263684C61366C56497055736F49375376434C6C6C627842384F494755464C5434636170504845546C56463171506874564B0D0A455941486C786C4E796A4F306C6541787A32736378444B5779564C4841334537646F795279657A414139796345676E723833344B5976452B4E5042654B342B34736A68384869736669754C4F0D0A436F59504A6C484330616D54354478466D6555566C69505A7770787253783958424F7647385A4F454A637161546354362F77436B7277396C6E674E34683050446667657469386267637279720D0A676A6A6D726A6337663175764850754A2B454D6D346867734E477056714F682F5A74504D6F596453556C37535557334736356E762B437646486972774672396E346D384D366C61364271756A0D0A58386C333466545437576157333032316D6A6C74726E53727550564C692B4772365864576C314E707433596167737356397030736C72646D5A6E4D67304C667848724D666944576461734E450D0A384157646872476B612F6F3765466F39423854763463303248784A6F2B6F364A72456D6B775034352F744B7845326E36746552324E694E546B3037536A356632433268534333534C7A2B34740D0A724750566B315237614F6535476E6174457775524A505A795132326B616866772B5A6153753174356B567844484A484D734B5341426B6151784D56504F654837714C777A34427437323069610D0A5735476772723930776C64703732386C6874756B73706D565A39513147367472595A5437506269344D71512B56417352797A58697268624A754A2F4544682F504D6F7134504B7541754175470D0A38626A637A7034742B327A724B2B49385858797249737271556B375673525046594E594B6E7A52356F717051702B3875574C38764A504437692F694C67767775347134647A796A6A383838540D0A50456A6A444A38757957726759657979504D2B454D44684D3534697A6A327A643850687165417839544D4B6B6F53744C32474A714E51626E4A656B3238375739684862366C65777A544938670D0A467A7357796A4779566D683874476E6B324E6249466A6A6C2B30504B476A53587A504D49596450727576654A50487572586E6962784E34733144784C7274337075683655645A763173376D370D0A476E654737435054744F69764A6F3441645375446278734C7139767674462F65354C335538302B5A583867736642466A4C46446565494A626E584E556C56477537756138766F34456E5A55610D0A534F30746C6E32573174437A624C635A6B754E6F5133453038784D6A64445A61486232467A436D6E3355397048647A7857746E656D616165373071396E63513263336E544D302B6F616131300D0A59347451307A554A4A3450496B3836304E73386246766F2B4A4F49633634657746486A624E7543714F4A792F497372722F58616D4672382B655A646B746241716A6D4E615670796E586E68730D0A41353161304A516E62325657796A797533782F42764366446E462B633176447A4A4F507132457A6669584F6350527970597643716C772F6D6645464447796E6C6548536C46553850547875590D0A65796F3465616E465364656C647935766539633154346B654E74652B494B2B5074563865577838627061324F6D6D3774504450772B6733663266704B3650707A5461524A34596D3032572B730D0A744A6967733743376E735A4C3232743761313875554E61576A52594F6A36565A36527038646D73397A4E6277422F3331304C614A30684C623068524C4F4331746F4C65326A4F79474F4F33690D0A534F474F4E5647426763434E59306D4452376A784A713268573138386B47725748694854724E30746E754E5330744C364F514A65466779334F6E366C706B6A6166664E74754C56554C704B700D0A636975333072552F736E6B4A63535458576C544F4C5731314B355659376D7A75475658585266456363653562625557336B57643471697831654D787957374C4C4B73636E67384A2B4A76422B0D0A51386631654663526C38636D776D4E794468374538493853527175575459334A2B4A384A587A724C637478466166377242346D724A547255347A6C546A556E4B61316C79732B7034313846650D0A4E3839384C36484732583570557A7A4D7373346934727758486E423770553435396C326463455A6A5479444E383177314343566648594F6A7A55714E61564F4E53644B45594E2B366E46614E0D0A2F77434D5272756A2B454E493172346736787266682F7737654E706E6732306E315658302B796E76726F5855756C36644A6177516C6C76626846613873784F79336D776662456D2B624F77620D0A474E34325246415A692B53547554626C4F7055347947424158494F632F4C6C795278576F327346763474384C52514A4642484C66584E307343786F496A663347683633473879716F775A58680D0A73663841576851775166656263796E7454493459786E614D687A38325750336A674B526B68677A634673484F41534D6976302F777A7832497134586A624C38526773466C37794C6A664E4D6B0D0A7077774D6E4B6A696157477757555A68484776567869385773385656714355587979646E7A58663476347735626738506975414D66674D646D57502F414E5A664433492B4A73524C4D6F70560D0A734E69635A6D47665A5A58774555317A796A6735384F2B7A626D32317A786A37764B306662663746364F683863326847464930613444636B6C67622B496E48384A63424D735267384B4363440D0A4833767449344155674163696261442B4149412F43767A362F5935766776696278586175345979364A6153414D65633239367147516359592F7673456E44715778673767542B686D453579790D0A5A7966764263347A77546E6E6B59502F414E6176386C2F7064594A3066487269376C6C7950465958682F4774704F3739726B754767372B36372B3952657657335A4839382F52757858742F420D0A2F686D39373465766E4F4563573165446F3570576D342B582B384E70646D756D2F6E58786C766A5966432F7872635245724A48346531695259786A414B5755386A6B454141676E4C484338630D0A396346712F4158553577786951676A354E753973664B634C3872664D4468574A4F65413245424F63312B3348375232724C612F434478704B307A516D343048556F55614E797247536254376C0D0A593477647049456A6E612B474749793444444F612F4448555A43375278757733624E325658495572757A6B67716F4A5265426772672F4B4D6A4E6633393945366C3954384A4D776E743965340D0A307A4762733957734C6C755659565866586B64576133306654552F4150704672363578376C394E765443384F59654C696C644A3138646A4B7265373651752B6A6256756C6F723433556D6E580D0A535151696134613363514A4C4D4931647A48746A535359704D497953323765456371574A5643413250494E593850362F646547644D304132656D475A4E5561353142483169376868653358560D0A587642477338476D4E4D4775726157534F6279316A613364676953536B377836386B79424341796267546B416345675A4A4F306A4A584F4141536337732B2B624F3857306B2F4C6A35786B450D0A5A5A4468686C6742794D6A6B6B5A343738667433456E426D556353317174584D66614A346A4B4A354C4A553143504E685A35786B2B654F626B317A4B70395A795843555530303152645343660D0A764E50386F345734377A76684B6E44445A5A43436A527A315A35536C5539704A5178634D697A6A6839523549795558542B715A356A5A754C5454717545354B38564A65523358672F57344A760D0A4546766F31706F3974702B706166465932686D3166564775594E6B30737233546C394C75537253504F7A65556269514B55513778776F366A77466F563734616A31534B61445362474B39614B0D0A5A62485358314761424C794B3253336C75337574516B3337356F594C646673736363554559675A777A79544F316463585639714668386F77655170497A6B5A4249423447665559415548417A0D0A6E6178717A365861656442703933714C537A4A627246596F73306B59634F66505A43385A61464D59625A387861565632684D73766A3462676E686E672F47597A697A437A7869725958435A740D0A586C434D6E556A375047596E4E4D79713061644F50765476697332784C7078626B3779677270526150647866486E4666473244792F673747797764576A6A4D626C46474657644E556D7034500D0A445A526C574772566130727870386D44796E4465306D6C48536E5564727A6264715238654B2F423866614834585768504277486D3143304A4A4A4A3559516B59344F564F46427942316D57330D0A4542696547504F5175477743636B385A565341414F53635A353538753154575A703957306E56394B384E65496C5378384F573368756147396830714864486258537A775855544C726D3765570D0A6B6B696C6A61506C5168473361326271654974586D56386144725A75443869512B56704E72466771567A4A66586D73584169565356334E4870393032506D534B52754B2F6E76364F334771340D0A413848636A79444F73673468686E74504F4F4C73645879326C6C3870566E4C4F4F4B38367A54437976655458744D4E6A6145334B564E38726E313250365A2B6C68774F2F452F782B3469346B0D0A345A346D345871384E31386734437937443574577A474D4D50474F513844634F5A4C6974306C4C324F4B793346552B5656566430315A36744C76626D56326B5749623558617831346F7361740D0A6C69664475724946486467784941786A6E4947634850503655735631344930717A75626B577472716E673644526E765A46334A706C394A44703137706C39635A7955746F6236796A6A754A420D0A67526834356342565A687A2F414964384A366A6158563772476F363371317672657154535863304F6B367063773664615174464862523264734A4D797359374F4F4B4F34766949587635326E0D0A6E6147434B5157304F44706573367A34656C4F6B32506853655366566A64336472593674346D61347862326B62726B4B62563757795756677169306947306D5A476B6550444552786C77336D0D0A6E4547643864356C78586773526B4F562B4B50422F4166446D567A77386E694D666C5765384B5A706D4F655A525045553479546371754E7847422F64636B627A773961484C37746A7A75412B0D0A4E736D34543463384D4D6D344E783248346B7A337758342F38542B4C382B574969734C6C5765384D63635A4C6C58446D6330734C556B6E79776F5A54683830765735327558453465664E486D0D0A546674756D617762714151584157793147425658554C47516C354C65645274646F332B355061534D476133753439304E784330556B54346662533670722B6E61524372586B753872645763790D0A57554365626533556B4D365843573172627179744C64334A694D4E74454D467070413746596F3364506E7138316654627179314D3331745A615472576B53445A6F6C76346A76595250482F5A0D0A4D576F3344577476476F5742466D6D6146545A5779784E46424A4E6A65536A64426F65714A3464317654374A4E4B384E66326E635361624131786661707246377154727156394A61534C706B0D0A6C35444E49695151787138374B3976444937434D7277752F364445654A4F623852634E51344D7A4F74674B574A346979364F53593350634F76614B70683833772B615A6458713038507A4E770D0A7865497732583575315435457164546D623565567550794F47384B75482B442B4D4A6366354E686379713454684C4F6176456D58384F34755873335378325134724A3833776C4370697557440D0A71344C4359764D386B54714B6F2F61556C464C6D7661587156377056387667432B6A756F704876727144784E72742F4245714F734639716C6C726D73586475685153626B744C6D386B6757560D0A4356645644426375724831775731766651706457333257345337302B4B32756F4A774A744D315779635269545439526A413254775038336B334565626979664531732B504F696E35353948300D0A54557046754C2B7A6B6E7549345A4C5435627937675177732F7741386270627A777179732B47506D687433436E35514B3666524E4E30765237434F78306A54346450744935486B6A677479530D0A6D2B6151764C495137733564324F584949475377786A6D763066432B46474678574F346979664E3876775749344E783343484248445754783572356A684A38475A64693875776D4D705659740D0A31614749634D6447564B7442776C435747577255326A387478766A686A73446C664375665A446D575959506A374C4F4E2F4566697A503579692F374C7A4B6E34675A78674D33782B417259640D0A70556354686E5577456F314B4E534E53456C693574576C486D584C336C6E5A61627166686D2F6C31592F32625A6549467449374855334461786F696A777634756E6B747232366263645430360D0A494654707572726D5334745179336250635179534E364E426557657078764A5967373761346D7337704A4970594A344C69334B2B666233454D3652794B355171796B71466B743549706F79300D0A556B5474586253375055486A756E746257532F74456E5854372B65326A754A374B5334686C675A342F4D56694E79537949793558656B6A49325664677965466644532B47744D2B79666137720D0A5562753775704C3355623636415353377532574F454F49496C4545455564744861775739764375794F33676955735A504D6B666F384D4F42654C76447A475A6C6B574E7A622F5748682F4E4D0D0A6678446E6B3831786A627A4F6C4C367277766C6E442B4372532F3565315934504C73625478465279664D734E526D3232376E6D2B4E506958774E34715A5A6B2F454F42794E384C6356354C6C0D0A484448446C484A63436B736F725549347A6A4C4F4F4A386651696C46556F564D646D2B427159616E7978354858723030374B78396766736A685950483271516B4147343850585232376C4A2B0D0A533873334A44453559467475654467636B386B562B6B486B72324C6764687649786E746A42412B674A413763562B6166374C7247503471366341436933576D3674423836594C415772584B370D0A573344686A417049326B35335A322F4B522B6E666B4D65666E2F45427631333867647661763836507071344F474538615A31556D7672764366447465367572756C484D734B3033706470556F0D0A337439782F552F30563852477634565561663841304338515A3152656C3233556C6773527A646574527237726E77622B324872556D6D2F435353316A6644616871746E5A766952555A6F70460D0A6C65546267344F57564268694267344F52302F49485553566B526D55454D752F726869713541557479774B5941556E48707542444376306D2F6269316778654450436C6D4747323738527A4F0D0A774F5156573374446A67414534615656596C6765526A476431666D44663349655643704265504A4731696F7875775479534353574F33507A62635A5055312F646630636161777667316B73620D0A4B4D38566E66454F4B356E707A755759596567704A372F3875464636617550795834313431303369764566477A76614E484B737477386C306A4A554B315672723971736E30617337706145420D0A754C684E53746A4E634A62364C4F3174627A7A77356B75374F346D4F30584D734D6F3871573045705258614A3435596B4A6B654F5245636A43316C664542314C784E70747066326B4A3075370D0A734C577A46375A377062694E37644C79347558614D4B6B4D4E306C796B4671504A756D5237575A3333504A3563562B34455530447853444B534B305567624B4D38626F5132426B4D534D34330D0A413776756E474D3153767274326C304C58705759533345636E672F5833413461397369382B6A586B6D41436F75513977695935662B30344F57565651664D2B4957593537777234772B482B4B0D0A7832665A6E44674C6A36576338493437447172374F686B2F452B4C776E4E6B654A552B666C703038537156536854552B524B753436335A2B7365476D55384F63612B4250696467634277376C0D0A552F456E77322F73506A664C73584B69716D4B7A7268444234716450694C4253676F4F645370684A31635069716A687A5036737036575435635856704E526A3033773164324F707957382B700D0A6130326B6130626932744C694854703753307570354C654C5A4462764B623972574F437A6E6B6C685552585555676938316F6F6D7A596237584C7139307A51376657486D76594566574E66760D0A2F736C714C534454463146375454374F32746A48356B56357271326C374B474E7A4E4861577472396F416B4E7A426E6F58744C58564A6452305338575837467255454E39464A6253434F657A0D0A3166525A5970594C6D4632424353545172434132306A665A786F636877447A50676C38615A643674637571616E72642F6458576F6F6D434C4353316C62543762536868643744534C4B3067300D0A35695143386C724A634664307A452F6E58412B4B3476783369376E6E6854784278486D64576C774A78506D58476D4C7A47726934703531775A6D6D58594F5043325579673553584C537874570D0A725578632F6563616544626B6F4B7047522B6A654A324334487937774E3459385A2B474F466370773158784D34547966772B776D56557343355179446A3349387978302B4D383656525534740D0A54784F57304D4E54792B447370566364506B7536636B64547174392F59307570367871757054706F64686F6B3979624332454555333278487437617A7434726772495A4A64567572684C57470D0A4A6F6A4930376B787532307257646F48696B615A5A364C4872743365336D7161346B756F32364E59544E44464649714E4C42424945567673466F37726178586B2B7870354A514356615151700D0A6754584A3854654A72537844463949304D7072757059436B54366B776D68384D57556832342F30533265353851545250383063326F6150495347694367537968317658727A54627A7A54627A0D0A6542394B696C574764726556494A2F456E6957545A444A437765426E534264785135345844414135395841385263587678527038545A426A6F7A794C7845346C3473345A3459774F4F355A590D0A616E67654375474B3250725A31686F2B7A535650506339776C6244307071584C48423046566A4B536B6D2F6D6330345734476A344E596A68506950415370635365465043584266462F462B5A0D0A3564656E6A4B2B5A654958476D48793268773969702B30636E50687A686E4734657456707463307366695A30704B4C70744C307930385A3658663330646A5A75313571456A737364746179570D0A636B737249727379527869344A6261696C33787967424463456D7557757463734838513265756632784145306D47376A61776967744A70485479706C754E7336616975574D6756306A69676C0D0A597441452B59746C656A30394C54543539476A7334494C644C6539686968534F4A59316A6A6A745A30565235614441434C6748473473426E50567366776448625858676A5137573667696E740D0A37725272574B654E30585A4C484C434E34634B666D4A352B38574947444763735748313259592F78467A336A7A4D65434D566D2B542B313464346534583439772B496868724B706D4E584E380D0A3477474877372F3266536E5172594F645276615372505854543837776D562B46504476686E6C58694867636A7A722F6A4B2B4C2B4D664450475953654B626C53796A4463505A486D574978530D0A6278466E56723063776A53567668644862557233656C3246766F577158462F723041693855506233735538576A4931786934744972555157304A754A4A5A4875556A6A4D65356C63534B364C0D0A45796E79366830315A4A626F54337431346C74347076736B5574314A3462737450456A326B736B6C744C4464336146374F663841667571535150484F4E784B71574141364B7774494A66456C0D0A724B384D535261623455306139303233456549345A64626B762F74456B614350594A49376178744E4F675959386D32676D5350615A4A43336F514D636E376B685A555A646B696851306249780D0A436C57552F4B796247436B6253574A3239474663484376436B4F50736F772F466D54314D4E6B2B4570343748346249634F3465316C5657525A726E2B587878654E61707935616C66483138350D0A6D6F79392B6E68385454584C485130343634756E345A38525972676E506F5976504D6650415A586A65493856375432634B637549386C34627A577267384448326B6561474879355A42546E4A0D0A506C71596A427A66505055316250784C464F3855476E324E33714A2F74442B793771545974734E4F7666384152784662333633573264486E4D366258574E6B4F39575A3157514E58552B474E0D0A646D31372B30324F6C7A3245646A714E7A706B633073304D6B64334A5A536D3375357255785374495949377143347439307355496D6447654550475178355877746F4F6E364B6230777958440D0A485539643033555A2F746B78644C646B2F733679574B466C695230696A677449564335655447344E4978326C656E30426F4E485456644F303354377657345950457669595358554A534F4C7A0D0A5A3965314365574B4933447854534C617A5353327275694F69504132306C52744833574538514F4A736E38544D6B34663473786B49595047654764625038566773426833576775494D4A784C0D0A48497130595367312F733777377059324E6D6D716C586B615350673877384C2B456549764344694C69626733427A715A6A675047436877746763787A4C454C447A6C777A6A2B454A635459640D0A31595457754B6869565777633946656E5363377333323853617A5A326F49384D5333636A3637613646613267314730687572713575593537714363507361336A733374595A376B764A506C560D0A676B686B6A4533377365745232594D5735687363424231335A436771546B5A436C63344C4C7A6C51447942586E4D69334574686258733054366339763478384A534A5A733845306A6F3661350D0A5A65617A706B65584F626E616F5168674974784A44416E30364D69496D523232676A6545354C4E47704459324F526E4149665051486A7143612B7438494F4D63313471786E696A484D7362550D0A786D483465385173566B475378715558517155736F6A6B4F535A74682F61786B35533535314D3378464E7537397A4430326D2B5A6E774830676541736B344C7748673356796E4130634269750D0A4B6643764238545A2B36565A56715662504A635263515A466A56526D7252564E5179624456456B6B34314D525569307248736637505347302B4C48685A6C566C575335767259727A744B334E0D0A6A6452674B725A322F65566D4F376C686759424A7239565168497941366A6E6A4A3435354851642F2F725A484E666B72384864534D4878513843624832412B497243467947776358457767430D0A6C51774A4A45774C4B4D46697049586F442B76346733664D55556B6B386E413479634442556B594848552F55312F426E303763424B50695477766A7266373577664344615674634A6E4F4F700D0A32756E47375561797676706275663050394558457438435A2F684F5A503670784E4B55566433554D566C65456D6E7673355558303354335077352F626F31526D50772F73466B77686C3171370D0A596C514343677349304A554444594F3747656747376A42492F504B346C6B3837594A51784A47535276326F344A775841323752685142777530354F65612B786632324E54387A7870344C74550D0A495977365464796B4F57497A5066624277434649433237664E6C686762634C38326669615734784B535543347A386D3445757747427A6E61656747414D6A314F4E31663256344D72366C34540D0A3843554E705671474F786257717573546D2B595646644A3965534E2B6C6F3376756645654A36654A3439346D63594C3933566F55593956656A6738504379657A7335792B6230544C725844420D0A546A6A4F30484258473835414932344158444138676E503365446735356A2B334C71656865614955385132766D576335484E74722B6C4C3971736269504A344D69787249436E4466594556680D0A387842696D755130617341436F784B797332306C6C323775414D6251546A6B383954386F357A70355A6E51746265584864576B6B56336153466A74382B41724A47724D6F4A564A56557754590D0A444E354D6B674B75535571664733686158483368396E3253344E657A7A7643526F35357735694B646C55777566354A5570356C6C6C536C5556705171564B32486C68704F4D6C654E647074700D0A6E75654166476C4C773438532B48632B783846553466786373546B484665456B6C4B6C692B476339705479724E7164576D37786E476E6838577354474D6F79697059644E4A4E4A6E4C332B700D0A362F636170707476612B646F2B71576C764871327277376B56346F59586B6A73394B636C6D4B77613771554E785049774A6154546448695A396F765933454F72366E2F597A367871747662580D0A446548746473494E66676549484E74716B717061366A6F363478355633716C31396B6973564743327058647952676F7A4E4E47317A456451314C5535595A745A316D2F6E31432F614A354A490D0A6F325A5937657A73376435565751572B6E32454D466F6D55555350484A64655647383743736437653976622B7A746269366850682F547453665734724E424A3538327073692B514A695761460D0A724B306D6D6E314B4646557564514E764B64763259422F35327858686C3468314B7642504865447830384E782F774156504D736B385271376B3148433542785067634A5369716154736E77330D0A51774D59595661636D49784D3551355732332F522B4738592F444B4F45385250446A4D38736A69764454684B65576352654532466C53546C58346F3450782B4D714F6456744E7150466C584D0D0A5A53782B2F5068384A43452B6452567579384E784C346230536166574C71466232376C6E316E5862336673684639647435747A746B6B776673646D766C32566D726636757A746261454445590D0A7246307A78446F38486961306B5856624F524E57384E364C70646F4962684A324E3961366E726C7A4C6250396E4C434B5634395368324B2B304D64344C4B51564746343038595070503248540D0A725079704C375558636C4A444749786151354C43565A794179585567533254594449566156674D6F5374372F4149534B3174745430715733574736302F55394F69314E6261477A6856374B300D0A555278537A6D645276336D576145664D75435A5A564C4C745450366478425879504C4F4A4F414D506C65506F344C4265456C66443461766850594F71716B654B38706E772F7741376C474D760D0A614C44304B4E53574C71516B3530385A6A4F656F2B5A766D2F452B47596351356E776A346C314D34792B726D4F4F38624D4E55785563653638615470562B444D38703855716E79796C616E4C0D0A463173545468684B6453504A504359534D4B63556F7078394D66584C43313162544C6136767265326B615A726C504D6241386C495A31615463564B7351585246484A4A4F423643313442574F0D0A54773170646D4A556C62534C654C547279534E447457387459454C52724A49754A565A576A6C4D697136374F4D38734B3872734E54316D2F6C31467254586F7A42467274706F4E6C4D4C47790D0A346A764773324679344B3538364D584169455A4B786B6F766D706C766D3955696E3165426E305344554C653476726D7A6C6E744C3653306A6A4D62516F58655757336878464971424A517A6E0D0A6143586856426E4972544B4D2B6F567645764F2B4E347A717A77325A354A6B48427363505470786C65634D5278426D3254796A556A423830735A69364F5067357038764A4B6A6579646A697A0D0A76494D5254384A6548764475644B6A52786555635338533865564D624F664A376C6243634E5A4C6E436E43556B6F72425953746C38314379664E477461396A54757035645075374F35574B510D0A2F59556D732F4F435350486461584A4962684C4336574A476B743539506D6B6C61777574723237785347475A6F79355A74545450462B6E586369704244667A54484837694F786D6B497754780D0A494C6458565238682B5A6A7944676B3442724C45562F504C71317246726B735130372B7A4448494C4B795765524C79572F6B7570704338586B7874354671495955516E4473307A71363457760D0A5576435068476278612B68576C6C666A5158316E55622B786A314F2F6D69746F5A45754775346253613357574F4D33456467735346704930416B753437754A335A314B4C3432575A7856344F0D0A6F3574682B483858697372794846596A69664F73506C2B4A704F7373466A4D446E644C445A376838444A5535636C4E356E6A367461455064555A4F627472633976504D6D772F4855386C78760D0A464758344C4E2B4938426865454F4873586D754871716C4C4D634C692B48355976682F4559364C6D6E55714C4B63736F5961705566504B58737161636E734F306561573375376936314637700D0A72545562335459645073496257613775724E4959556C6C754C694F306A7544624C4A4A35796F736A534D71323647625A4A4D4931394C304338303254574E63736F744F7637573147736172710D0A567465334D4579577338476F583575516F6E6C68674B7A7250644F4462694D4841597035694B5747616233532F4375723339685075314A39483167614A4B59544331713055477458466A4E710D0A45307252695232755930566252562B514A45584B6E3569337563486A33775A66584674396C2B484F6B324676613273694F68753951765271647738727943396E5761565262736B4D6B5561770D0A32306157354D617538624757537676654173722F414C64347877764664484D61396570777A6B6D5A384859756C6A6F52717A786B4D5678446A637878324A6C4F704766762F77427034486C6F0D0A744F314F676F513572615038773853632F7163503841356A7752504B614F477063573853355278376738526C38355561655856634C77726C2B553566686F4B6E4B6D6E4635526D69397446330D0A35712F744A745831584F7A6172706136587264746257576F33657032313334587562534F4853727961326E585364546C7537784C6537534D514235374F376B6A676665496D6D415669795A490D0A37574765433874596273785856714A59684C396B756F46697559505056543564776764796B6B4A5A6B594937414E6B427943706270644F38572B48476434313849575167646755534F53574A0D0A67533059584C357A386934525153344C4D353267594464644264365A666E455068324F434D41414B69744B2B426B35643358637A626B583553696B59774F4154583744775477612B474F494F0D0A4E73356A6D4831696E78706E56485073526733434D49595446307372774F5578564C534B355A594C4259614D724C5761636E7237782F503369523469663635385065486E4439664C46684B760D0A682F773758346477324E3971366C544834504535786D476554566138704E536A6A3879785468713755354B4F6C724C442B47747373586A6E7772644C7659776549744A6E62354F4167766F700D0A476B4467414841594537694D714333494A412F5A6A79436348636567394F6D4F5034546A6A486638756C666C5670787339436D6A385248547269473030746265376B4B774E4972794B3458790D0A6C4756486D4D78534F4E79516F4A4474677258367767384956554F724A4777624A4F64364B33557154786E4858484848474B2F687636646B4B4E5869506743716C427A2F414C477A796C4A4F0D0A7A6B6F517A544356494E3261306370315648706F3748394A2F52427231716552635A552F656A5265625A584B6E4F6475567A5741784371785639484A4A306D37644C614838787637586D70690D0A342B4C476B32702B376165484C547A45412B365A4C7A554742786B344A43722F414241344C456B59352B556E6B426B795842414C4D47554B704449464150727A6A6132517A4548626E3777720D0A326A39706E55354C6A3479336D48526C7464473032467472626C424D636A676F6F776D2F644C68697934776F414A7A38767A2F4C645A562B5642366767416873417355494F475545416B42390D0A6F494A4F5351746630747744556A684F4175413850666C645068724156326E5A576466367A586C3166577370644737366F6E69366C4C4663553854563346747A7A58454A50666D644F564F6A0D0A5A62374B6D33703337574D6538312B2F6A74623256394E6A57653276624F3153336E76506D6C74395176545A5739387371524F766B426E506D376C5A3432526B4B7630724E756645657277320D0A706D585372524C6F616C42707073354E5132707375306B6547356B756A4355387151524E456F434B78754D524D70596C715A715472634169566969586154616263794667717046666256676C0D0A556664335731326C744D6A6A6850336A5A58766869397462794F32697635626462713868754E4D75345A334B786A5537575A445A6E496463794A71734D4D63494B417442504B564A566E7A2B0D0A44636363633859384D34766A656B38386D336B4662682F696E4B4B504B6F797A506858473475475835316C394A3879633856677357326F75446B34776C42744A616E394638422B48334266460D0A75423444725279656E476C7848684F4A75443838724A707879726A44425961726D4F53356A577447315042342F425268666E3555357161546230456B3853366864783330304668624D74705A0D0A78684A587533695639514D4D567A5061523568592B56615253684A726A4A5437534A4942686F5A5374665376466E6D616C6457392F4842625755553174706B56346B6B7A4E4E71386B554D6C0D0A33597047455A566A736E7559724F5735636858766439734E7A4B613476554E62585366446D6D5731686954557276626170444D415A5A39576C6E5A627A7A686B372F4E314A355A62343432700D0A6266625A694E69414C77736436383130624732766231394E73375536656C3748424E4E6279616F38386C7A6661786658416A4D58326D5055466A75784B6A6E393638717A62544574546D50690D0A5478446B54794445787A4B706E6E396D38505954473535526F523970547A484D4D3465467A53644B44707553554D6E794A31366B6E5A72323154435535506D6C5938374C2F44546872506E780D0A466771325755736A2F7454695847344C4A4B31642B79725A586C755477786D55303673314E5276557A6A69434748696F32532B723073585553616A7A4873313546704F6E367A726D706176720D0A43745071476B78694E4C69796A4D656C574D636C7A476B30456F526A754573775673736765514A76556E626D373458302F5434376D4C56592F457375705257746A667747316143305242706C0D0A38776E6C694B4349542B51626D4E5752592B72522B54797173726564367A7272616C6F576E58796F37334A466E767452744C50714672722B68787A574C73516F5654655269334F39536F44460D0A6D42413436587778664E4E72327058643546445A663643594C53776A7972624C75577A6C31436551343273397463325564737353444353537A7A62696C796C6474485063737833482B4879360D0A6C67734669634A587A4C43546F5970744F574A772B643542563475566645316667784571474A64436C546F564A53626856634B66774E486B3472686E4E6374384E71755A314D646A4D4C6A710D0A57585939346A425269375958465A4A7848682B4448517731464A536F52784F4368694B74577654696B70306F7A6D337A4B543765307666443652795157757333646A486533734F74784B6C720D0A6C6B32783239765A79493074713568574A72417952504C6D5353595035686B56634430375274517364505357396139754E53754E52564C4366555A576165344673386B4D793279525738614A0D0A61573074784446504A74696A4D6853507A4A48434A6A7937777A5043313334684A555949304B5042507A674E63654B6E4C41597749794364774741474947435772704E5076724F4C5570644C0D0A5355457A5757717974456755374C5A59724A304A4742744B58636F38674D724B6F6E7545423267714E386E7A65766C6D565A52784454774758386D615A6C6D575655735053626277654D79570D0A747864686372786A704E506D70306C6C466555704E5356474F4D557278646D384D37794F686D326435377735567A444D56504A4D70796E4E716C657575565A68677339706344596A4F4D44370D0A523255616C66384174716A4B45497465316C6758465261356B76584E50314C53316B314750375735754C6850736B73736A46457435567574734C4C766953467072517A7A5763556B766D78520D0A4E4E4A4849576C54634F367637327A31433267307566584A4E496B736A4C506254573872695732686E696D5634496F3761336C4E76417A7A7A334D6368574D4E64544F36796A2B447962796C0D0A3169783150545949354574494E663161332B334F49354A6F64466B316D384F6F756F55594573453879527143435569646276353267495033722B792F384A744C3864654F5A76446B643361720D0A6633306476716474444E3562586B6C744470554371436C77593435455634355A7043575A4441444D43337A59303459346B7063517770344C47594442556F347A4C38546934347972542F64300D0A2F7743337374774F663570684842306D3273566A71735A55717969347A5748714C6E54696358472F444658684F474A7A5041342F48316F35646D4F487738384852716330716A79444E6377340D0A62796E46786D707233384C6C644F6361314679765464656D2B56526C637A76674E2B7A6E34692B4A2F696254744867385461726F4E7071326A7A5873766966566A652F594A64485353356B6E0D0A756E6B747242377536434347376E7861785458586C67756A716E7A4C2B6C576766734E6A777A6F7478346C6A314C5176695234633058454F6F7965475A645A6D754E4E525262323972714F6F0D0A36664E59573931465A6D65566F56574B535737655343563549526252764B6632662F59472F595430356266776463367644637932756B52654C72752F3142344962375448767274722B7A73760D0A44746C6643433353534F31307637477434746A4F3056704A353043796B2B586E396B2F4450774E2B462B6B65464E52384F7A6545504348673238314B32736451316132304855684E667A576D0D0A6B724D6B63656F506651475132647644645377334B704A6457572B2B75537237354263792F4D347A787766425763564D4C6C3245704E596970686E6D644842387372537159724D34342B724E0D0A4B436D3673367359346D6B6B37786C6955716E4B704B4C38544D66444C44385A5A5242346A463161396242554D782B703138544A51626E6873506B6C584C734E724F317165427156384A56350D0A553432776B5A577647372F6D7A7476324176444867337768345A385A7A66454C3456616766456D6D7758756D365A61364E712B7258496D59517663575633635867736243475454732B5762740D0A476C65353253786D474E31557532782B47766876544A4E55697666427435347276566A3039374F447742384D64543153346B302B565555616A49386344573168616563317248484B464D39390D0A5063787447306975536636586C6A2B46756866444C77566558656B2B41745A304F43776B69304B556E544A64466B696A68754E516148544C6D34744C7470326B65304143785153504C6552710D0A303278316152654831445850436E7731385678654E497244777A6F467234724D61576B577133734868364339735049742F4F764C457878794A62706270396B6B75495A3745504D78563938470D0A394165584A50704463595659356E54784F45786559346D2B5A724B366B71304D4643705877655A546E4444526A5277337465536A6C39475561386C4764525370755570553474796A2B65635A0D0A654366433244725A4B734E58574570346E485A52484D4A786A4B7455776D427A4C4C384E556461746554546C3966784D59306C7064535556737A2B5A4B2F38416776713378537648384F36480D0A3458385665484E7362366E6578326668362B4F7251614A70582B6E58634F70364F747045454E7949676C7755454C66596674456755694568506664507458625437466769454E5A32707A7A7A0D0A6D434D352F484F6563747A38784C5A4E6631426170715867505337572F4F713674346130694F2F67614B386C753956302F54504F6A75554B2F76626C353764384F4A573274764441506C43430D0A51612F6D39763841546B74722B2B747261657A764C6532766275326775374942374B356974376953474F3473334F5331704D69435332624A7A437945456A6D76774C786738536362347059330D0A4C4D7A783256764C66374E6F2F55735053397256724A30366C474E57712F61314B644F2F5069495371704A58744A4E3333503643384D76444C412B486554346A4B366561553877574D7864580D0A473161314F4D5637376C7955303144583361436A433736702B682F482F7744484C346461376638417844316E57704E51384F77795838656E6930302B587844597071636B457472456C71736C0D0A6C4A4973367A5854354D4D4F337A4A424F6B716F497978586A64532B41766958524C694F78317A784A34473061394D5573715756377236523354525268325A78476C7649785462464B4666430D0A71367164686432436E442B4B2F77415374547666484F7652705A36456B326D617261697931426445303658556F6E306D52445A53793330747539784C4D6E6C494D73374D73544742663351550D0A487A6E58666962347738536174646135724F724334316536676A745776785932456478396E696A614F4E49354674304B62466D6D6A5230326E456A726B6833336632786C6454504D506B57530D0A59576C374E4C4335446B6D4877366263573653793744756F327561796135344B4B74316B756952386C6A384A77355678324E72564A564A7A6E6A4D624C4550765757496E7938746F375855320D0A337070465831625063582F5A473866366A706A5877316A776B62473773704A6F7030763732564A625A34524B6B71474F77494A4D6243534E31624147474241436D76694B2F7348754E5975350D0A4A344A595A7242452B3150494A46573431393468424A65577179424345744C584C525349697138326F7A746779572B5237644E38642F697661366644706B666A545672617774594574594C650D0A46376133696773345950496974314B573673493168534E56424C75434175343546654E6170727431716C316658393279795856396454335679385546746178505063534E4A4F795731716C760D0A61573049643852775739764642444874696869574E41672B597A7268504238525A356B2B625A713531486C6C4C4D4B4662447554644C4755385A47436A517845622B2F68364E6454784D49530D0A76465659776C6136505879376A5445384C38505A746B75515870553834786D41785561396C37584231637671546C395A7737566E54725969672F713153634847546F633057374D38377662570D0A6256745676622B4E70644C653233424A4C694E5A556B316537477A56623231695A304B7747335A6F62615162474C616C714C59566947463753394F6C303351354E482B334361526C764653380D0A38694F4E4646374A4B366E79777A4B327835484A5A324C794D32346B6C7561383932647A357948444267355A75527542626A427757366748626A47427A6972746A4E424D383045736951504E0D0A706576705A4D7A4B694C716A614A7143364968615146555A7458466949325937566B614D73345573566E4B6545736A345479615571644F654F7159544C386668716B36375657646568694A380D0A30344F4D31503334555668634A43537534596643776A464A58547A7A7A6972502B4D7335684F705770344436396D4F58346D4D4D4F6C526868385268615559716F70553342754D3852395A780D0A64534E37547847496E4B53356E637866374276354A4C6C46385171717A334354684937474569433753613076476B684A6B49446D3473344A33424C417962793671586B4A367937303665346C0D0A74487464576D733952696A6A6A6D753434596D45386B6B506B7A544E4577386D4E726744446766753378474E72744770484A2F624C4B476130574576427576556B573374302B5765345733750D0A42454C694A69585952493038696E373675527549444850536E5776446C3770566E642B52653658724D556D69375A5970383248695333382F547257316165335A764E677668617878333872510D0A7A7A326B3074704B38734D4573706466456A6C2B515A4E547739436C67716271314D77793154715573544F63735053792B6868714F437230716954644F5648443170345379646E52703872750D0A6B6B64324B7A5069544F4A31363158485665576E676330697146544477554D52567A48453163546A614E576D33793149316352683459742B362B577455553957323562396E6F6570596A6C540D0A784E64577A5841657A6557433274464E343967576551454D436A54572F774274626474474976507751675A4B3951384865484C56416265337537706236386D6A656255376751586C334B424B0D0A4E717943614E305750475645456361497065516841376C6A794832324766772F34616B695A4349745338654F574242327539723446676B48796E35424A4A59334179785037794751715745620D0A62665766416D6E66326A34736A384A32643344486333567071747A6F57727A33467242703134317270647666614E4D306A4D597842714E39763038744A4C4848484C714E6F4A514A495757760D0A6F4D7672634B35586870556132447131564C475A31517739436C4F70576A52705471566F346A45516A79754D4A346C59334579565252557231716A6A5A79625042783950696A4E63517354390D0A6570556172777555567354694B73595570564B6C476A516C68385055616B75656E686E67634C48326262692F5A556F3239324B587376676E34557753336C3142652B4A4E586E683153366A760D0A31654E594957745A62693856373235524C614E54436A66614A5A35424A35734A4554417074636F66322F3841324566325466446D712B4F2F4175747034332B494C364C6F48695778384E2B4A0D0A6451535077314E7264707157724A4C4E704D326C77332B6D79574E333459744A4A394C74395A532B5335665437643732346E4C516B514A2B596E77723076514E5A38532B4A594E50385353610D0A56704F6E66447278663433304C5739536B733858656E58586865796A306E777A71646977556E555939635339734A6F384C50494C32796B53495952782F544A2F775454304C5276486E6A6D770D0A384C6147336C65447443682B4C576A57476F6849726557376B385358506A4762534E5231654E70704A626E574674495073384A592B524C5A36545A5874724369766B5935686D58447543796E0D0A47564D75793670686E674D6872346568585548375347436F344C46576154676C3758444F314C447A3063597835476E47796A38376D6C486969753038666E4378564C455A7373566A734F70780D0A3558696354694B55616B6C6154626A573072316F4B3858552F65615376492F6172344B2F7370617A344F3050772F346D385666477A343777612F5961486657306E6862537645316A4E6F576A0D0A516169576D6D746262514E4C384E53576B75706933614D6D573274476D53386C6D61305A7949356D396750374C48776731616278446358396E3473756457386261424E59612F72632B71367A0D0A704F7436686F75704F5A4C6A54377256394D69307953316E6B6C5A6E754C534B613376455A326B654E534352394D574D44773273486D2B574C6777514737644D375A62684C654B46337977330D0A4D4435614B43337A464655486741565331477975626F51532B5A6552533246334864774A703270535761336E6C7177613276554D53775432387175516265595352733652754A49585658542B0D0A46386278426D57507A4C47593664645571324B72564A7A6C526A476E464E3170314B6349526A42577077714E754B3162545570536B32322F365A7933494D446C3256344C42657A6C576A526A0D0A666D636D33553972526A5472546D33724B64536E4B4E33647579746F6B7265512B476632632F686C3450384143336844775A346473622B79384E6542566848687253354E51652B53776546700D0A484E794C6A55597271376B764C69576161613575354C687269616161575635544935617567312F34492F432F785872326B654A7646506861793853367A6F55537861586336394E65617444610D0A6F73697A6245302B39754A7450436D5A456C59477A495A306A5A75593078367770636745674B534D37572B38505934794F4F2B43656E553961506D395637663536642F2F414E56635039745A0D0A716E467248596D4D6F4C454B4D6F315A776C4836337A665772536734795831687A6E375A6331716E4E4C6D5475372B705779444A385332362B417739626D6548637565455A633331523035590D0A5A53756E6455585370756D746F386B626249385A385A66414C3455664543336E7466466E686C6456686E786C42714F715743783758446F3058396D58646C3562526C526A414B6C41493244520D0A67495077793148774A4E345931585776445832653668486837587464304A497278764F756B6A306A563733543468504B41424C4A3564757061514143516E654F434B2F6F7A2B6231582F48500D0A2B50537678312B502B676D7A2B4D666A364E456B416D316F582F45544D433270324E70715473436F49495A37746D7A6E4A7A7A6735465A5378646246306E5178465A7A6A47564F70543532320D0A6F75454A3037525854334A706157576771755534616C5469734C53564E71566E6155724F4C752B2F3832702F6D722B4C4C7A3756346E385833786C52496C31712B456B684F3156496E6150490D0A2B584F43716A4242344242476341487A6D35385336666271544C64516B42526C664F4250424F3471694463514F4F75416553534D5A724C2B4957734E426F666957626579795876694B3542590D0A48444F476D63717050796C7639572B4F683543395142587A552B6F752B33644E7A754A7747497837634842414C644D4447656E47542F6F72694D366C683367364E4E726D70594442306B6D390D0A6C52772B4770744E5873722B7A74657A3374325A2F504E484A495969574A714F376A55784E655639627555717335796274663754656D6C7237505539393144786261734356792B343767344F0D0A305A49554652393434444145466956355959363435796678536A674B71685175345979774A474143753445466A6A646E3235474469764E78644D7949437A4D6D7854674D4F526B38484C59770D0A654D34374441507241317A6C534D6762546A50596B38414D63676E424F3439534F4F535749466632687A525652717A6D2B6E4C75303557657173743131386A534753306E704A53646E7061360D0A5374654B3031643761506264393748615071344C686D48796E637A45396D7933484136657554786748714B51617047386543704C416A47534E754D425347354150444D43417537497A7858440D0A79585759796D376E4C48504C4563344A6250555A5A686E41415042795354556158727153706363746C636B344F514F63485030372F644F427A78777A7A486E6334535363484B334C4A4A70780D0A664D704E2F5A744C717250547A32366F3554424A53676E47634A4A7861636B3778626161747337763846366E6170506252353251525963414F324E35775468754842584751434D4141484F520D0A6B31615338746B6B4D7A5252414A48676C6B556C564243384E6762567A6B48474F35506F65495336666B6C7971345973574F654151635A427A6A4A4A354851343646716B53375A31327351360D0A746E3553654748796E4A77636B5A59446B6E706A4863386A713453367468614B61576A35597961646D3471572F75715672335453586F72564C42566458376172326B31556D6E5A37323173350D0A4A4A70505A58577154642F53744E385361556B746F6853475262365352626349735A456336427477644279766D53516C446B594C3757424935723076537648783065547A4C61434D735956680D0A6B49594B64695478584362666C47333534554F4E674149423669766E426E583979385447475347346A75496E695A593252347A772F7741716B4546575A58566C4B7370495A574247453166570D0A39653868707261613075396A79733175747648627954526D475263656447506D6C566D42526971717847306C51514B782F74434F4256577457774E4B72465155315044556B355258736256760D0A646C72666E392B306233543054736A6D725A524C48547030345979745363373035527846567867327169644739534B5546614E6F2B3834704E4A3373336237563033343454576978686247420D0A6C665970447A4750664A4F34334443536F7053526976422B586843434E6F4E6673742F7754322F6238385A2F4444784E445965454C37777A6F7933736B57747A72722B72617066615A6636680D0A7074726632326D69332B7A4179324E335A6E574E53733768475A724B39736269564A74336C49352F6D4462577072314E443065326C57356B6150544C2F554449534462576C764A48496265350D0A345169356153495146454277464A6467434D2F512F6737783366364250597961664B4C4E37534F534D7A5738736B63306F6B6D65534E6E416378376B52764A42514C6D494B705675545862670D0A387A7765657A6C6835303648396E756A5270346D314B463630366B484F746839556B3152396F6C555838303348653976487A624971755759642B3955715975705571314B4B6E556C4A5534510D0A6D71644C45536A655876566553547033752B526379736D6D2F774455412F5A782F7743436B2F6A54346E654D66682F34593854615A38474730487874346676517576366234313137533954300D0A4458394C746D6C686A385161647175697A57706831574B326E6E54374A655268593769316E696D654E70497A394E2B4F2F7742753377313443384E2B4F6233562F446B4772616E34556831710D0A4F336A384F2B4A4C653730765737717867754873526161674C525A596258554853424576456A6E6145793538734F68537638327234482F7454654C4E46312F536452683858367259512B48740D0A757336665A586A7A36787075756178706C756E6C6548645869463562665A394B31473456345A4C69504C573841574231324F585839482F41583765766A4834777936746336395932316E70740D0A39635850687A544E43746275365730304B4731306C4A4C6565336B4D306E6D336C7464584D4B7979794F3064304C4E4A4768696B61516E38727A44775379504D4F4E386C772B56744C4A63630D0A34566356683664586C6C4F4746715372592F324D7565556F38754771306F366138305A4E4A576158324F57386635726C2F426D633173783570356A674B64534F477254684B38616D4B6270340D0A474E54537A7655705659713758754B476D746E2F41476F2F415439747A786A38597645476C364E632F445854644D6831656542625761323175356E6C74725734672B31573031775A624D77540D0A656441564759335178544F717972744C4F6E3651344848796B3844706E47652F2B652F6576356E762B43576A654B50462F7741553946766F6E75376E772F62784E724531334C4F3045544E610D0A326B6C703563414A2F66665A3736575066396D6A595A646650386F426858394D4F663841623942302F4C723965663172386F38632B466367344F34727775545A425270554B4563746A694D540D0A43465772566D71395845565970565A565A79744A553661616A42526A797537764A7533752B4465665A3978466B2B6159335061395374557034326851777A6C427768374C36764F724E7731740D0A4A4F636F336B7569537547462F754E2B762B4E66446E7868384474712F7741527645576F4C436A43342F736E356936444A69304C54494477777A7759694F65754D3139782F7744412F54742F0D0A39663841505034394B2B5A7669426261744A3475316437615333454C665943676B6B6956782F784C4C49506B4D6A45664F47786B394D644F672F4749786C4E326846796156374B3937664C350D0A483750526C434D6D366B597A6A7974576C717233566E7131716C66377A2F484C2B4A45307A36456B6E6D4462636139655362464367672F764370343459465163427563344A774356486836340D0A776E4754687368747647473267416B394D41354A366E6A6B484A3936385A5764326D6C5779586D693668636D4335755A2F496874356B517A506C4D797978526C5341684C4B7649417A7442420D0A334478363473372B365A426261446357667A626478696C354A50335330787742387742796F786B5A77534B2F757A47356867486A5A7A654C7737356252584C566933376B75565753615674450D0A6E727065316A385277654278564B6A7976443157334B565363755271334D306B33706433377061333668447A4743535370554B53414163706B3477636E414A417741422F337A69717A536C7A0D0A674139477963412F3749366E714E32303541794E6F366972456C7065326F614335676C6A6D69646C5942546A64686874794D686970496267675A4863686330704C61386A646D4D457135584B0D0A6B7267454F4E3237714F6F436E474F35794B3676375377764972597568464E51762B2B7033556B6E37713937545356747657784D634C5635366E4E536E645053384A395737665A56377033300D0A37626145456B7A4B754333437142364835694778317A3644707A7A67476F7A4F4474774F673559455979635950314162386363656759367A6B7366496B4A776F4143666577564367454139420D0A6B2B2F6241786D445A4A765565544C3832434D78746E6A377747426734555A4A323965427A6A4844504834586E556F3475685A61667871646D75546F2B64395A4E74394E4C746E58484453740D0A72546B6E5A2F5A61573276325666662B6E6446345844344B6B345253437A5A35494941584858675A786A723348514775547474663146355A456B514C48352B314A52477745615975514D71500D0A76412B564751484A32357954387934364D6C786C4245354A584466757A6B5A4F4759384145413763444F4E336F4D4178527853466A7474354176384141336C45444C44494F37414262412F2B0D0A4B5059655A6A7355716C576D714F5930714C70715471786855684B4E52564F53796B2B5A327330396462637A6656472B486854705172653077617138366A7975616365546C637279587536750D0A5461766652704A617251783439653153524168693875525A494155327564795352534E4A4C6E4932694E6776792F654247786953526953303851333761644A4C4D664C75476C74342F4C65420D0A67465277755858484C42674766635075444B6E6B6336725173474F49484955674D4247784959483551656E515A2B6E5848706E53323932397A444D716C4934585A6B486B45717A62634F72370D0A314B4D6F424446534F6F484F65613471754B71554938367A614E573848536350615531655533434B713335313730464676525762335770307868686174347641307161356F3165626C6B33370D0A6C33374C34473756485A4F396E4664576C5936433531466261305A30745942664A4B3073476F444B7A757277724574684F4379704A617A537041363443795254426D52694A475669792B49560D0A76444E6132757057397A70387A497A5353544B4445484459556F366B4578347A69516A6147484F4363316E545773326F534837624778445272476B55634351777155424963786F465670454A0D0A487A4D57494F4734417A544C76544E4C5749586D7257312F6549596D74326E534B53366D6832493751434E4549324C4A4D56516C5758615A4D6E6748486D314D3078574171564D566C754E770D0A6D4677366D7139656A57713035555A76575665584C47584E423156794A4F4F69316257694D3434484259745538506A734A694D52566B765A5561744745347A687A526170786A4F566F546A440D0A33744A7131306C4852732B6A76416C3170797374786173464530736C77303779764C4747754D79475A77726E6A676E6A48794D636346712B2F7744344B334F6E44346A2B4F76374258554E470D0A30533431375372363138485873736C316465486E6E67557A5332317A4D736330746A64695177576372715A4A6265326A4D2F6D764645772F4C2F344D65474E63746F354C6B576C36526533430D0A5457397538636B7A51575948376D4E7874776B6A686D52776F2B55456767414E742F646A344C2B4459506A6C385262447868345730732B44376651666870384C6F50475547747872707431710D0A666948346465454E50384E2B4D4C7254487545582B3158316D2B74573162534C4E4D7A53526D56516B3875354A503050686650387571356C775A6D74624559584253682F6174577451654A680D0A376B5A594772626D626E4C2B4B6E476F6F744A7632744E57625455666A65494D6D784E4C4B4F4D6375684772693431466C5831656F36545570314959326E654D556C7136664D34536B6D37520D0A684F577A7366317766384559726876375873394D74394F31625572733256787156397174783533396B654874477339456C7462654B786B6A5272627A64586E3165796A6C74703253346C6C520D0A62684156745A435036522B6637693976542F5050622B74667A392F3845767669375A65547050773767766450384457476C3263756F767165716659394D54564C4343395977615A644E654C610D0A726436736B64396432535453536B506272444D456437574A542B3659386638416751503551385A65475864417535553137544A48417751724D467547366C547953446B45312F4E506A706A590D0A357078376A4D6451644F644B76516F2B796A516E4B7531427A71796A4B724A4C6B6A4B706479564F44356163456C4A633870582B2B384D4D45387234596F344F6F72537031587A564A5235460D0A556B71644B4F69615466492B614C6254626233364C73656637672F543866384150623372793778463458302F55745A764C326178754A5A5A76732B36534D79624738753167695847326446340D0A574D4B634B4F5163354F5365697650482F6757776A655337385A65473456544F344E726D6E46386A6B675270634D374D4D48355655747830727A445576326E506778706C375059792B4B70350D0A354C636F7253324768363765326A6C34306B4268757258545A594A674134566D6A6B5A51345A5364796B4438696F717243546170546C644E57733131546662792B382F5275654838306676580D0A2B5A2F6B7A61326B4630725233554D57334C4C764955726C67477A6C67576A7A6B64634D4163354A4A4A386A316277566258424D746F3551484A4144503562597A6B34474E323446536F4F530D0A4354674B51566F6F723676363969366B317A596D763771715358373670767A53333937585A4D374B6C476C436F31476E424B31434E6C474B75765054736B762B44716346715068433674747A0D0A53524E4E6B6874336C38416B67416C686C6742386F4142494943723072466C3062475935495353547777514571472F68334548484A7A3872444B3862653146466350313747796B72347A46610D0A383766372B7033542F6D387675303052304C44554A4B3770553774743335492F596F755353303276393353786B5457554562785274436D356953366F6E544C416C69697268674D685332346A0D0A4F3349566763536E51342F6C486B636268383277636267646F7A6A4977415363453541624233446252525744782B4E6A4A4A597645325472787437617074474E302F6933314B6545772F4D340D0A2B79703254693075534E6C666B30322F767631496A6F364B537074314C4549477847674A2B624459365A79446E50424248336A6970426F716277504B4141634C79435664666D33734D42734E0D0A73774648476335774D3846465A787A484853356D3858694C754B622F414831582B346B766A325639504D786E686350795666334E5033557258684854574C2F6C2F764E44546F6946674768440D0A46564A42325947546B6B7341547444593563676A4F414152676945364E47475652434D644178514B517A42733542414C41344F51666D774749326E6B464654547A44477A684B2B4B784675560D0A75337471756A6A4A78763841483153752F4D547775486261396C42576847656B592F456C46667939622B7654597452364D684A4A6A334D47596443416F2B365267344933664E3870424F646F0D0A4A4F30437437536443527975363344637347486C38446267394D484F517779464F666D4A344A4F43696B38586970586A4C455670526168654D717333467033566D6E4B7A567265747462366A0D0A64436A46586A54676D6D6B6E79713638315A4C58533539632F43665359306B73647345514D633646637175475653474F512B2F494234326E4C4C6E717858422F617A396E697A6A6766545A420D0A436B5474456D346A62387973556B3550415938416A424751532B35677879555670484734745753784E64636D736256716935627052664C61617375564A6157566B6C61794F5046304B456C4B0D0A4C6F30374F634F613849766D35354F2F4E644F397431665A36376E376C664137544C613274724736694B2B65384145724E6854687957625A6852674D2B63754151754D446E4F503045384D610D0A7173617779473275676B695278534D4664315248597134436B676B684679724B647049487A414C6969697658717A6C4F73716C5275704E2B7A546C55626E4B3047374C6D6B354F33765072300D0A566A7A4B6C476C443933434559525535576A424B4B3164396F704C64477871363272574D3073647748587A635075507A427053787942674562515170335A794375534D626A355650637869610D0A514355714E7877446A4948356A4939443347446B39614B4B77785575576A5363556F766D6162696C472B6A75335A4C666C5466532F6F63394E6330705862646E4A4A58305369326B6C386A2F0D0A32513D3D0D0A27',NULL,'','','','',1,'',2,3,'');
INSERT INTO `pus_katalog` VALUES (3,'Roald Dahl The Wonderful Story of`Henry Sugar and Six More','001',1,'',1,2,'','','','2013','',X'2F396A2F34414151536B5A4A5267414241514141415141424141442F2F67413851314A4651565250556A6F675A325174616E426C5A7942324D5334774943683163326C755A79424A536B63670D0A536C4246527942324F4441704C4342786457467361585235494430674D54417743762F6241454D414151454241514542415145424151454241514542415145424151454241514542415145420D0A41514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662F6241454D4241514542415145424151454241514542415145420D0A4151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662F4141424549414D67410D0A69774D4249674143455145444551482F7841416641414142425145424151454241514141414141414141414141514944424155474277674A4367762F784143314541414341514D44416751440D0A42515545424141414158304241674D4142424546456945785151595455574548496E45554D6F47526F51676A5172484246564C523843517A596E4B4343516F574678675A4769556D4A7967700D0A4B6A51314E6A63344F547044524556475230684A536C4E5556565A5857466C615932526C5A6D646F6157707A6448563264336835656F4F456859614869496D4B6B704F556C5A61586D4A6D610D0A6F714F6B7061616E714B6D7173724F3074626133754C6D367773504578636248794D6E4B3074505531646258324E6E6134654C6A354F586D352B6A7036764879382F5431397666342B66722F0D0A7841416641514144415145424151454241514542414141414141414141514944424155474277674A4367762F78414331455141434151494542414D454277554542414142416E6341415149440D0A4551514649544547456B4652423246784579497967516755517047687363454A497A4E53384256696374454B46695130345358784678675A4769596E4B436B714E5459334F446B36513052460D0A526B644953557054564656575631685A576D4E6B5A575A6E61476C7163335231646E64346558714367345346686F6549695971536B3553566C7065596D5A71696F36536C7071656F716171790D0A733753317472653475627243773854467873664979637253303954563174665932647269342B546C3575666F36657279382F5431397666342B66722F3267414D41774541416845444551412F0D0A4150325A7572684C53797537773450326543346E4A4948796947497556354A34774D396A6874787A7A583839486A4C2F41494B742F74454C71313170576C6152344B30524379505A7A522B480D0A722B57614B47534D53497369366C717478486350355A44656573554D4D72414D6C7569794144393466696E72482F434F66432F346A65494E70387652504176697A56574F436F4B365A6F642F0D0A644D47326E2F6C6F496C4734636C526A424F4B2F6A5074745175645231317863474754615135524D756F69574F4F4A515A4A4764694E696F4979546A42496A4142342F612F444C4A4D747A480D0A435A78557A484351784C6858774E4367366B55315355364F4A71315574476B705235562F32377235663170394744772B7944693650463250346779716A6D56484B336C5644445272653871560D0A58453063585871744A713273595534507238507A2F516E55502B436D503759567867615A34783056586B78736150776A6F6A434C47344D5664374351416C514E725A49444F75426C635667540D0A2F7744425158397579386B517238536F4C574E324A59512B47504338524D59437171674852474978393979337970796934556A487A426248422B574552684151464A4B73716C694778694D350D0A4F4E7138413447636E6B592F526E396B71366B3853614638554C2F784E6161547134384F364E7048396B4738305853476179497339666B64347042614C49485A6253324C753235795934327A0D0A7647612F593872344734667A44474C42777747476F75634A79684A556F7953564B44717A357278364A4F363638327A503233785077584158685477646A2B4D6E77446C655A34544C63526C390D0A4C4559645155616B7175615A766C6D545956556E6F6E4A563879684A782F6C684F78383161763841747366746658486B72716E78753858774E4A475765505454702B6B3232537A634B756E570D0A4E75412F474F6342657934774B3453392F61722F41476A39514C6D352B4E2F78507A3878667976474F7457796A42484F7943386A555A423477702B36654D63474B382B4D2F7741534E4B31530D0A7A6E683852535863494B744A7032733666706D73615263716B6E7A32393770642F617A327478627A527330626F455351787355696C695949792B372F414C5A58777338432B4764492B476E780D0A46384B61545A6545745138643661386D7665464E4E4377616439715853394E314E622F5472445945736A6250655357476F4C417356744D35734A52625258417535626A3071664265527A792F0D0A465972443448445779395533566A4F6A424F554B6C61564F4D6C37757372717A53317448757466736165593849384C38582B4848424F6638413552687356346C2F77427559626837485950430D0A30735454705937683741527A66465966485161714F6C537159467964504553554B667459657A63756153692F6D47352B506E78747632497566693738544C6F4548654A5048506963716364630D0A4C2F61674249353237686A507A34494F4B3532342B4A767843765866376634353858335448446C376A784A72467A75794370475A623654444E7577636B674567396356786B635A78496D31700D0A434154745442493235424F52313245634567456C546763564531753251656E5567454A304A47654F426B59624F4D48674467486E6A2F73664C4647384D74773849705763705965467058584D0D0A6D6E794E62707666564A62575033326E777477647A2B786F354E6B507436644E314A30593458415371714C3931337070536E5A637A5439793057306E7975794C3939347438545472497A61310D0A7138375362575154366A64746C3262424D724E4F79376532536335595A355775573148586454746B534B53396C763736376B3252785354534E676778755A52755937496F77794947357977440D0A6E35754B303770473870796F4C42465971354B6B445970326E63656D356D7965773478314E653966736A364A34613854664772776C34503854654839423852365434686678464A66773674700D0A3172655849625466437574616C62724266537039706767533773595A576768634A49794D57444145566C68637077574D78744443557348684B5573545768526735557158757971546A434C660D0A7562395872315A347647316268766766677A6958692F45384F3444453450686A4A637A7A2F475962443448437872564D426C654571347A457870336F50333455614575534C5475336270592B0D0A57727936314133734D447A79764E656C747742636F6B52424572715363694E417A4B6D34426D49647A6C6A474B644E7146304C5055357A492B5957476E576B536C67696D4667675948712B5A0D0A5378415A6942355955385978716168614330385461744B57387533734875745074305842326933756D55414E364D4274794365535430417272506839724E376F6E69727737446154474731750D0A2F4665675071554A6A686E687672582B307265656532754935555A486A6C4D6B697576792B59727568474D4135306374776A72796F4C44306F526461564A7A703465446A47395432584D37510D0A66567475372B464F793274362B4F70355267386B6C6D754879764C50615179745A6E683850504434476A4B756C67586D61705263715547357A6F303451307661704F4B3670503054396D48340D0A4C796674442F462B332B485633346C69384C36664A3451317278507156386C7648714775547761466168763750384B364235397263654A76454E2F657A324B523650597974656E546871576F0D0A51785369776547544B2F614F2F5A7A2B4B50374E6E6974764448784430786F344C324E3776777A346B73493533304C7848706245504864324E784E4845385633476A6F742F704E37444471650D0A6C7974354E33626A3932386E7066375A6B456E673739706E567455384E462F446C335932336772574E497664455A644C754E4E76375051394E2B7A58756E53324377765A33567464326F75490D0A5A346D53564A304571534B565848365765452F32772F32647632707632575048336850396F772B46664433784238486548764558697A78315954365659324F7166465856374477392F5A76680D0A337876384D74554E78617836563852626A5672665172572B30794E4C694B386E6534676B734C6A526233645A2B586E65437135546E474B6F7770304B2B4577315757456E46556161616C47700D0A474D7171744453366D705730747976587166676D4438514D377865522B486669356C33446C4C4863446364384D5A426963646B644442304B754F794F746D71715659596C53685262715364530D0A536F546B7450614B6E435631654A2F4F667146354D58654E694D424274595A4468777534386B636E447468536543636C69634566542F374450694754515032746667507172534658507842300D0A50544E2B534E6B6573796E513556424941784A447155734A474143736D546764666C532F4F2B376E4B59432B594346556C2F6D43344938773434624C664E3034794D4E587076774C315674410D0A2B4D76776E3177466F2F374C2B49336771393337676A66364E34693032646D4A4A4F416F526D594D514E75534D5A473663786F5563526C2B5070546F302F337542784E4F2F733462797774610D0A3653356439626233566D76492F654F4B7370776D59384D3852344E59584474347A683350634E464B6852356E557847545A70546737716A7A4B536C4B6D6C5A38796154577154503771336C4C0D0A484159484444444C304B6B592F416A5047436534476356455A6743527342397943663177632F6E5869397072463150416B6B4E334D72414865444B57772F414B6B35796551447A6E706B59410D0A347348576452427762687952314A494F54334F63487239667936562F4738616B4C624E367672627131667032746279522F68314C447A7537704E7032562B79623839473948626F63742B31310D0A717638415A58374D58783631426E387059666858343167586A494433756833646B684B3979306C777167416373516F484F522F48703465757251617250647A5354626A48746A4563495643520D0A74326C6A753341416B6768464F42314B35785839592F3841775549314536582B787838634C674E734E783465303354633547357637533853364C594F6F4279435448633754786E6E6B4867480D0A2B535852474A7535634B514273556B345963456B6E634141535733664E754A504277506D782F5648684A68342F7742685A765861316E6D6B494A364B7A6F344B445354386E55752B723133500D0A3948666F575A4C5271384138615A6A5635323852785668384B6B6D307558435A486870754E2F35656646743739486F6577786135626F796B7050674C746668506D7770362F506C7741716B6E0D0A6E64676A41372F70482B786A64573033777638416A747155706E74374B4454596A6658434A484C4A4842622B482F454E784E4A42435A6B382B53474A3359524E4C4348636F6E6D4C755A682B0D0A56535079526B68687436625151666D334D4D67674C387034376B35796367562B6F66374A422B782F73782F7448616874434F326D654A6F67375962656254774C63794134376858764D676A610D0A643068474F4D562B35384C3046444E593147302B54425A684E6538724E66564B6B3172317370617476727464486F66544979796A6850416E4D6156475531587A586A33776E79656E643373730D0A7838537547714D33756D354A586D757434707436487A31344B75663262342F45656D58666A585550694871747261537130615365466449743941456F664B5072647259654B6233577237536F0D0A7A6837757A307A797275346A4C526F7A4957696670503275504276785368385A6144347038632B4A644C385965467646566948384336376F55443664346474644B56495A3130323030746E6D0D0A476B794333757253374D687572303668625378584B366C64795739784461664A4F3943464C6B426D62355176473335515277674879384B4343647A6263394F7636542F744133397634672F590D0A2B2F5A746830744271643363332F684C546259323445386A58756C2B446464304F3973592F764D5A6B314257736D74674E377A776D4D706D4A6B472B45396A6A4D707A58444A52702F5636630D0A4D5854644E38733673767245494F6E555373357835717430745647546273317174504566413437773738592F4144694B6C6938526E6D453475346B7A377733783873346971314468696A6A750D0A4538327A7A4435316C74563839504134697269386F2B72596D704A306E58773858515533666C666876783930725850674C3436307277463448767233773770476C2B452F44657157392F704F0D0A4C4B383853336C3544634C71657436766652714A64516162566F4E51746F3757346D6C73625732746F72614331514A4A75763841785A384B654776694A3844504258782F306254744B304C780D0A616D742F38494C3854624C5372574B773072553959676A6D4E76346B5854624B4B4B30737451753434624F2B7659374F434E5A3474646A335237374143584B38622F4644516669643454384E0D0A2B4676697662613534622B4A7677795736384C77654C6250544C66563474623071306B57326C306E7856704D3135706C2F59367670397A616E5A65577A3371766444554A5A375346745163570D0A2F4E6154347A384C582B6A2B432F67717570367070767732752F69545A654B5048586972556F49624B2F7572693857773047573667736265347634744C306A5264476861574E5A6269396D750D0A4C737958397973533238466F75474971594E317377684755486738585156504451646C4B6869623049306B724C3356536B7169714F375467354D3179624B654F59634D6547474F78734D7A770D0A76486641484675497163645A6A536C5771344C696A67756A68754D367565593644753459756E6E6556564F47387779756C47436E547A46516F7776617861306E344465425047486A585576680D0A5634563861584776654955384C33577236523430303253797566426D70367A5A614842724D326B4E594E6252616C6232675A726A54704E556A314F366B687549737459484D6B4B634C2B787A0D0A6850326C50686835624F6A504E34706A624B4D58595365422F4570436E6151415666626E6E4F4F4D6B6B41665A6667335666432F77752F6147686A6B317A34566544766855713639704868570D0A34734E59384D367064367A59584F6B58454F6A332B7065494C6562553965686E765A476875623637312F55644F30396268354C4B33414C78515038414976374C39704E6F76375476773373350D0A5A7253356B743957314F4F65585372713231617952727A775872723754714E6A4C4C61534E4435793230356A6D6B56626C4A59446B78734B353368734A51782B53346967716172777A7964470D0A7171636C70526F31734A4B6A4C6C6231696C4B737661624E4B37504D7A5869666948694C773638664D737A57575A346E4B4B2F30623842784A6B466648345774537847497A6E4F2B472F454B0D0A6C6E654735584454466637506B4B72594B4D56556F34695849716263316433374F2F775A3054347466744461703459385152334D33687A515A66456E696658724E5250412B7132576A3631620D0A36646261557336684A593472765574547368666556356372574333734E764E424F3063366366612F463755662B453874703966306652377A77513369614C3756344D6A3048534C50544E4E300D0A4E74524146726F49747261476653622F4145717A5654702B6F326B304E2F384161625743572B6E76466B755935397A774C385864512B412F37526D75654C5A4E4C7537765478346C385761500D0A723969794731754C2F774150366872456F6C46673077524775626135746250556256354E6B5539785A433265574F4B655353506B3952742F684470586A4F37385744787842722F672B3331710D0A62584E4E38493257692B494C62786E714E6D4C74722B30384F616B312F704E7434643075526B32616471757152363366787777696139302B307670664A7332387879705571464F47476C546F0D0A346E4435786A4A3474314C4C6D6F2B32684C4453315476536A47465A4E4C64744F396D7266633454445A316A4F4C38387850456548782B593847357834456341595867716E6C38716B3664480D0A694C2B7A737A664675486D715653314C4E635457786D5253773836736639336F75484931546B65712F77444251694E6F506A36306852697437344E384F7A386A494A527452745163646C41740D0A7767423366647A30786A7266324D6632516667313857745574504658375150787138452B436642556B637A365A344E3037783534623037786E3467756B5174472B717664334577384D6153720D0A6273527A78507246374942424262324D624337727948397233347266447A3431654D744F38646544745831497957666862534E436B30652B384F3374745064333970712B71336C784E46646D0D0A58796F5955744E56557173696957513230674B624869632F436C2F664F306A6A6546387552696F5861632F4E6B45794873774A473063384145444A49385869364D735A6D325956734A576A480D0A44347645564B306179546C4372462B79557552745762556C4A7532326E53312B627756345934697A48364E506831774C504D617643664532523849594849732B6F5661644B706D65563171460D0A584F5654684B684C6E6C536C4B4377745368556E4343617536626268702F514C71482F425048396C72784838547834573057505474472B4846344775724C346E36482B305434663132392B790D0A5232374F706C304F2F7742436C6946374E4E354675756E53454C3563706D68314F5A596D7A2B577637557677342B415877462B4C316A34502B426E7850316234714E346176376536385461390D0A6352615A4C6F476E616842657854516154706D72365A7369316D2F7459304A316437573266546247597732734E2F633366323632303734726137756F6D597064544B585141736A4D6F4942330D0A684F446A47345A36597A6738455A714A4A575A3133466D596E4C4D78484F3761446B6C674D38444A49795153447A79666B38446C2B4C6F7971724534795749685539724C6B6C5A744B7042770D0A564E6176334952626A336679302F512B486542654A4D6E7A6642346A4E654C63546D5756594C49336C64624C7554544D4D636C56673879785533475037796447707979696C4A4F63553775390D0A312F61707057712B564842637835386D35686866617033497979496A6F633542497734623342396561374A627546314437674E77795163446B39654F4D63313456384D39554F7366446E77420D0A72426665645638462B46645245685A663368766442734C6E4A7A674574356D57494A37593961394245374141484A78786E42376450345432722B4D4B6C615644485936685A7956484659756B0D0A6F33736F2B7A78574968703253736F32747574442F49664E4D49384E6D4F50776372526544782B4F776A766465396863626A4D4D31706256665632326E31504A502B437032722F32582B78740D0A3439685568527132746543644F5541386B6E785470742B3639654349744F63676E5051416A6F612F6C693041376C6D4373446D5145747462494255374157494A4949566B62482B7A67636B560D0A2F53392F775743314D3258374B5668703564552F7466346E65474C5171796B457242706E6948554375546B46316B74424A747A67424D344A41412F6E702B467677642B4B586A3753353953380D0A4865416646586950543469356655394A30472F7564506A32736F5A47314A5946736A49674B356A4E774877636745562F586E687A6A4D4A6C764356537069385668384843766D324D6E5471590D0A6972436B702B797059616B3146546D6E4B7A356B374A394E542F5272364A756335447776344B596E4835376D32585A54537A546A6650716C4F726A735852777A63634C53796A42586A4770550D0A6A4B6F6F4B4C6975574D6C377A3154526C57466D3137653231716B317443397A637757596B764C7943797459586D6B387350635874334A426157317568624D3178635478775170756B6B64550D0A51735030772B436E6944776834482F5A772B4C3377383133782F3443302F786A34752F3453684E4730364C785870476F517A4C7158685054744B74444C66365863336C704548756F706F32440D0A79674973516158455247666D48776E2B7A4E34757535344C6A78366C393441304F622B31597866334F69586575366D4C3352626137754A745066524C43534F39744A37754F7A6B4F6E6D384E0D0A757438737471316D62684C6D45766B2B502F6839384976446D752B48376651506958725774365864527954334F7361526F756B367062775874696E6C58326E7A326A366E5A58616272746F480D0A745A5867614F347470677077734D6B722F6F5742347777655755616D4C777359356A5671596576536F526F56497A64536C69614D36636E43306E64636B4A754C57713264724338592B4B66440D0A7A786B772B4538504D70346A784F6159764C4D2B346634782B715A42686C696E6A4D78344A7A6568784E6763464C45726D696F56366D584F4E5343737077707A5354504D64523039744E76370D0A6D786136744C317253566F3275644F756F3732786D77464A6B74626D45694B6546773345693835335A775151763642667371364C702F6A58345A66455A726E572F486D6C576E7731744C62780D0A464870656B2B4C624D3652714F7353616434677647314454724337385033453368712F52644A6A68533830793561345A7269536153597343472F5069477A5A705A593763334E3545737372520D0A5379776F732F32587A484D526D697477596C59522F4D7751424649594C6B636A394850324C596B742F68422B30764D754642384D524449354443487731347866484445746B5348636F4142470D0A4F434D352B6A345678744C475A6C54684E4B50744D4869617462444F5363716366713873545370314970364F46534D45334B4B546C432F5378336653787A6A32483066366D6334584530734C0D0A78526C584548686657676C4B6A4C4D4D6E786645584766432B5159795571635A2B32777465706C75633570684F644B6B3759697244336B33462F49542B4C506870504C4C4B2F7775764C677A0D0A5353537A334E3738514E596E764A5A5A585A3570577549644C6868615A324C457A7932736D39675449765556324668384939432B4A666854784E346F2B45452B7366323934517442714869660D0A3462362F5061366E71353061525A43327565464E5A30367873453851576B44493658576D58476C5757715772346A6A6C75356275776976666E7679397370446E35646F427A6B6279633447300D0A634B517171447435353547633139592F7354617063574837514868367A686C4D6161376F33696653727743517276745974496E317452355979474276644673354153785654466B4463426E6B0D0A77654A686A63776F5950465170716C6A6176315A7A6772564B6457747A4B46574C31643155355731315872592F522F463343356E34632B466E46764866434F4F7858397038426350312B4A6C0D0A674D62573974676333797A682B6A68735A6D4F5559696E4A326A44475A56683862516F7A555A657971786F757955577A3554384665457266346A654F76445067362B3854364E3450744E5A750D0A356B75664547737A7870596166464261584E39494765536133686D75626B577074624733653568533576726D32747A4E4835686365342B4166687A6F506A545566696A344C2B4658697A78700D0A3466384146766772524E5A38525765702F7744435132397A34573863512B474E526A30795246476777615A63325032343668444A6F3134732B72774343386435573259457665366C2B7A646F0D0A2F6A5839715834732B423176354E43384965456D31547878714D656A3230553272507064386D6C6176486F50682B7A6B7A46484F4A50454D566C625376464C42613238473379704A6A44432B0D0A742B7866726568613538556648456668543465327668725134666831346974463171652B313357745A547A74573044374C5A617671563365706F61334F6F4C4663584D6C7459364E594F386C0D0A67577468354D456750586C3258657878644C4434716E7A4B706D6550775378484E4A7A714B685472555A5268712F5A7545343070716231637057576D3334783475654C32447A44772B3471340D0A74344B78556F31387038457644376A2B6E773073425170345042552B4C3831796A50634C50484A5559537A436C6D5753596A4E4D7472594B6E4770536F306350567156494C6E61666A7677610D0A74374434692F44333437763432744E4E31375766412F7770314C57764375737970657A363759587358396F33543348323537755635424849734B7771366C594E76414C467933787A4E4579720D0A4A6C30694B79594F3567444753685970492B426C325842624A7951324D59474B2B3176324C4E47314C58374C396F6E545949486135317A34452B4A39503069316B644C5637713475424861570D0A7A47575578775269573575315437544A4A48456D396D4C2B57726D764D76687A384776412F774156745631627744346238573676642B4E344C44574E57306E5744704E6B766776584E5130610D0A334E316361546169533858572F77437A37754C7A49374858376D4747536459786454614C41685742664F786544725976423550476C474C7846582B306144637252715636734D582B36684C560D0A63315251664B7270757A5365702B6B384E2B4947536346654966306859357A6A4B3065474F484834543851595655553852677548386C7A5877356E4C4D635A5454356F596241504D342B336E0D0A476D3471384B6B6C614E4E32335032494E577635666A546265463539546B6E3050552F442F697748534A5A3570744F4E36644B456E327A37492B62567276794C52523534693830526A6143460D0A477976674B395A6B754A55492B5A586B5667774F56614E696D3067644F325142776367484666626E3746303864742B307A344C67445241334558692B304D614B504C554C34523136545A33790D0A2B496A356E4247345942414B313865654A375A62547846727474747A396B31725662556759482B707670347363414435647042794239336E7269765078326E445758533056576E6D6561556D0D0A306C644C3676674B716937576255573557586476736537772F5671552F70482B4B574268566E48435933776C38494D396F306C556E4B67716A346938534D7178474B6F3032334346544552570D0A4639744F6E434C6E476E52353233474675595A797756534278774D67644F75443951666630363867516773427442773364734159783150586A474D38636744327271764333676A78683437750D0A74513037775A34613176785271476B614E7158695455375051744E753955754E503044523434333154574C754B7A676D65445472425A59526358636972464738304B467738694275594554780D0A4F797952454F6A44634742474D4C6B67386B5A41494248384F53446E4A7235796E55626B6D70336C4B45567936585875757A73377656744A666632503132654E7763385A5777437857486E6A0D0A4D50476A5578474756576B38525370563033526C556F715471776A4F4D4A7969355155576C3039322F774457662B7A42716136722B7A723845727663484A2B47506775426D4A77664D744E420D0A73724B55486B38724A6275707A7A6C63456B3137304363636B642B7534642B4F687830366533586D766B623968335644716E374B3377666D59686A613644714F6D456E4249476B2B49395A300D0A31554F4365556A7430553479526A4C6338313961373137524B77374537736E386942783034394B2F69446964547733456D663059516C2B377A6A4D49704A72345869616B37706161586E76720D0A64732F785238514D4F734478337870684A33697350785A784A535353322F3457387A714C30584A576A5A57547459317632763841345665422F69723451384B57336A2B565A4E43384A2B4B340D0A764669365A4E617666577572616C5A36646636645A32747A59495139394367314F5762374D7637755352454D797641727133685635347030447772346469304C773370456D586A6A577851570D0A6957576C3644596F51597A50616D574E6F6F7A73613152764B49646C5A6941463231732F74386674562B485032624E4B3841522B49764231313477735047567872384C57316E505A52584E6B0D0A4E4A683031764F6A4E337445686B4F6F4B6D315A496475334C4F656A666D46662F7744425144774E716A57747A34642B486D764642453863566865584E6E5979737370444346395667764E580D0A75576A42564657434F7A43737A506A475258334E666862694C4F705957764B474F6C6B73453559563038524B6A684974314A66575A31506668424E315953546265716A31745A2F4A317644620D0A7867346D776D5435686C325535746A65424979784E624B716A786A777554717171383435684B716E4F6C535570356A5235616B7075546B36555978765A7066665633385030386132567871580D0A6954787949336C534B326C384E614846627062334832653574376D796B764C53564C3243533630753967697674506D766B453055676D4B71595A6D6A4835312F48663441614C70756A336E690D0A47567244346158756A6174714D434E726B7473756B2B4F6F5A49495A4C6A78463464302B307672375572474668426279616C61794A4B302B7133547936665951543356313970552F744A2F740D0A46336C376178654750687059654872652F5637697A6831697876356D61326B47364B53653731473830654F4A414741575237614954534839337541436A775434304C346D3854367063654F500D0A4833696253376278566532756E686642455633663349734C64536C7330476B4A4E63586B6470616F57612F6D6A4D676761356E767A444E4B2F4C2F62384D35506D4F437875426F787A796E530D0A764E55734C526F5648697659303275626C6D6F4F555952643570536C614B6B326B396A395638457644376A44687A784B34557738754D4D7679624535706965616855796971733378464847550D0A597A704C4359326C5156534E476C693850587874475665724F4D497146323558562B50304834675265434C68592F4264764A645478683533385236674A344463334573467A436F6830584B730D0A4C61474E314E75627934575463726957445938697966636637496B386B3377582F61593143516F5A727A536453755A5446456B434E63532B47664538386A525177716B45455A6156676B554D0D0A5352524C74534E516971712F6D724571695646647052474756576449316C64454751664C526E6A523254444D716D56456473686E554D5748326E384B766A70384C76685034473866654249640D0A4F3865654A4950483172505933756F7957576861484C59323931704E39704C5357384B6178726950496958727A71306A6C4E306171555A527A2F52334232457765535A6C694D7771346962710D0A5971686A4934724556716A6C4B705671596171715368467478684832736C79786A617931315373663250384153463849635A5077707A724A754573466E50465847584650476E68726E4761340D0A757457715670346E423850654976445845475A79634A537155735053772B42776D4A71304B63497136704B46374B783865534F513244746A56647A7551474B6856557143666E2B3654304F650D0A65782B596766566637452B6E4B2F7865765047326F54785748683334642B452F45477436787131302F6C32576E4C655754364E456C784D51456A4D6C7464366A644B57622F553664644D6D640D0A6D42347064366E384549566E4D746C38554C326149445A61445650436C676B724141415065663252666D434E786B35577A6C3242667537774258502B4B506A4666586E684F342B482F6737530D0A4C66774A344375626C627A563947303237754C2F41466A785266516C544264654B74667555697539564542416133734C6533303752376667783663727047363734504534624C385A517831610D0A72547150445646694B464744636E56724B4D35556B3364387366614F4D70646B72646466323778517757662B4B666839784C346135426C574F796958472B57316547637A7A374D716270554D0D0A7079544E4A304D506E654C6F5533464F766A50374C654E772B4570702F774161764354693148536234672F4848784E63664766786A385776424F74616A346476395731335570744E76724F520D0A34627761475A42596164615863442B64466368394B7372424C71306E53533361654E574D4F5956326563366C3865666A4450724F6E2B494C66787472467472316D3838747463325538656E770D0A32706E743268764A44702B6E78576D6D673355547648636C374D2F61674D7A69594251766E6D70797841596C644165576A51626C42797A626979686A6B62515734497777494258414A3557380D0A2F77424A5A67747769493352476152426C767535776A62526737674D6B6E6142797772784B326234366453725557496E47553631584665374B796A694B3870314A79693934336B306E5A36320D0A5365316A3952797A776D344379374A6374797148442B585972443566776E6B6E4255336961455A7978325135426C324779334159504752646F596D4E476C68366E732F61786D3655713152550D0A32726F2F5148396B72552F472F696A57506A6871757433312F6379616E2B7A2F414F4D394C733952645A6D696534733230614454395073486A6946736B7343624937577774424773537842590D0A59414632317A483745747071656D2F4837524A72757776744F306E533762784459616E506432633972485A585631345A314F53336A314B573552425A79544E4569774C4D596D6D6B654A45560D0A773669766975332F414C56534837504434694D567244357377747A7145384673506B64354752664D5746705A4175455664306B306D794E4E7A75694E582B52316E4C3669626C706475344E4C0D0A4971504B507553794E492B5A436E7A664D32514333476338656A68754949306E6B7A644F724F706C574978474D6E377953717A7234696E5861386E7A303143396C37726256747A386E346C380D0A43712F454566483744304D78776D4177666A56775A77317766536A436E7A56636B77334476445762634F5536334D3779717972554D312B754B446B314845554537585A376834453857572F370D0A5076786E742F477669767735346C6B31507778716572334F6B364A456B466A42716D6E36705A61356F68755A622B3844537247347558654353327372694F62796E5579716374586C736D68330D0A76786C2B4A39746F667774384E6549745638532F4548785263786156346263327435647A3674726D703364306C6E6150625132304B575672464D445064335A6A6974726547653875355962610D0A4B53524F4A765946574D4554527973464738525A4A7A6A4F3579783667384571434E6F344F4D592B6C50324D7632672F4433374E587876303334682B4B2F446C2F77434974416E38506549760D0A4365704E6F647A46592B4A3943745046466D7468632B4976436C3763474B4B31317A5434444C44484B5A375352374B367662654737745A4A6C6E5479635A6D31617068366D455549665656570D0A7259326C426647716C524B453779563172546A474C58614B33756653357877632B4635353534685A5A687132623864302F442F42634D55385043707934624D36504471784F4F7976425270330D0A536A624D7352697356657A6B35567173477253752F77436862396A62396A3777312B795634653076346261683435577A2F61632B4B734E6E343338613672345830646458613138412B4364550D0A302F554C3734663652712B7061646361526F75673373397A46704F726135714B3264317264357156314E70714672445232736677392F344B4466455034542B4F6669354444385076416667540D0A777A34763052746274666972346A2B473137633348676E7850346D6D31696437474C52737732316A66546146706151516135346A74624B306931335870395246754A724778733779382B6B2F0D0A3273502B436F4576692F77547150776A2F5A39753965303751746574527065766645585764507464473859663849536C756C76706677313061356975372F574730367874684B4E64385536780D0A72467A726D7333643771635674396D745A33757272386346696556746F6B675975446B4F337A38594B6B4465705A69767A413549474D48674156382F67365661645A5979764F644E7471554B0D0A63576C486C6975564B5375766735704F396E6463756D682F5058675634642B49474B346F7A62785A385238777832477A624E3559694745794C3230345533435874364D4B754B773350374F460D0A44443464786F34476971635842776339584A746630682F384534395646372B7931345674566B7A2F41474E34683859366179746B375662584C6A566B43384447453152646F32384C794F65520D0A39322B59336F4431374A33507577503569767A502F77434358326F65643841746630386D4E687033784B317443715949524C7A5166444E3042674534426470694375647553426E4F422B6C410D0A64434153426B6A6E494A4F65342F4138666830466679463468526C523431346A68647858396F546E464F2B7172553646573661364E797630315034703862384C48422B4C66694668724A522F0D0A316E78324A6A6131725979474378693657752F724D6E33652F632F50582F67736A344C38642B4F4E592B423968344E384A612F346C6A3037542F47467A65746F2B6E335639466250714E7A6F0D0A6B4D4B334C7752794A437A69775A6C38787748413364454F507A392B446E77372F61462B4856764A4A706677676A76356231556C65665839437357767252346C2F647461586B39316133646F0D0A554D6A4D384C46347934336C524C38316676762B3035656D62582F446B55674B6F6C684941514F72656547626A3155624E774F56777749354C4B50454C574B6557323377775479524144664B0D0A736253497059674C766441417565636444324751526A79654A50704635787733696366774C517944433476415A596F554A596970556C4370586A587072474F6255576D6C47654A6B7236586A0D0A46575069592F54427A6E683367616E345072684C4C737A79544A71324A77395845564D52566F346A4654715936706D63716A6C526B7077554B2B4C6E475354584D715354507A41752F4448370D0A57657353586270345675394D6E756D42653674623353494C71474D35796B5574377263367849774156354959684B41506B6457474B354358396D6A396F4857623658554E56384C58563166540D0A6B5063333270654A7444754C6D517169375665656656707043462B35687368526C5146526C46667271736243375731643169627A466A5A32624B524D57436C6E4B686D436F546C79464A35590D0A4B724D414B33626A534C375437752B737034476C4F6E546931757072635050627137536C594A444D6F624D64304148743266615A4664514D76587A47422B6B6C78466C555A504B2B46386F770D0A2F4A4C6B6E555548557138334C4B566E4B616E4B3059776E4A576174797433504A34532B6C336D2F426371754B3454384F4F46737678642F66786B714D735669314F55587A52703171304B6C0D0A536D755345327552786C644E383132322F7741684C58396B6E34315342532F682F5434526A6776346830556B59424A7A3556334A6B416B6B6735334545415A776175502B783938596D32794E0D0A616548376338353837585954673763422F774231464A6B426A786748674F51546B412F7370652B4846696852724755334D3045636B576F787A506251623951673379584E7670614E634766550D0A49375341782F614A456A444C4C76554B774B317A5775614872576C706153332B6D3356714C395448592B62453232596849705757494B446E39336351756E546372426C42475373356A394B720D0A784868436F6F59444C6F386C704F554B4C63494B536A79786B3148663330764E70323056333972582F6144654E664E4A306371794F6D6B3475553434647A6A474D6C424B4C3978326B6D326D0D0A2F4C73666A383337463378656C346C7650434D524F31704E3272336A624E7563674750534A446B372B514D6B6767376A39366C4837446E784D62506D6139344D69326734582B304E576B37440D0A6E41305A51783579783762546A63514D6672394E344F31704A5A426232747A6547337362473731426C67324A70386C37624C6469336E61516747574F43534F61514444786A4C4D67534E6D460D0A725366444E2F5A367757316D3174374744536B75372B36693153347472565A52596958795638716156486D744C725559344C42706F6C654C644B647A37534D2F4D596E3655506972557177700D0A6375416F4F5456506D2B72766C696E7133655556736C4A336536672F4E6E485036663841342F564B6B4952575459654C714B4D5A72434A52696E475433634665316E642F335875666A524E2B0D0A776A34356C596661504666684246436C537747727A4D414E7967465037505162675170474D6371535164334E53663841594438574632576278313464675569504158544E546E645632426B590D0A4D2F6B4668795855676A615076626867312B74743162366A716E694F792B327742593956763950696165325646734A3175376A37494A6F3534737748375162573459796877724D6C772B33350D0A534B776645657174714F7158456B3177743335516A742F7461444D63697770743252626C567A4243786143334C442F6A336A6A55414B4646664F597236556E6971716370527A4443553756490D0A30347236736B7078664D2B5A4A705839336C6C706F377658513862452F54382B6B47347A6C2F612B58554B634A4B4D4644424A4F616C4755755A506C317647484D767536732F4B2B502F676E0D0A39724167325366456253305968515444346575704430584935314F50674D4F4D6B4535783875414B7532502F414154334A6B417550695767414F63772B4743514F43537169545779416341480D0A4A4746436B624D456D76312B74373233306E3465364A716D6E364A6F4F70744A723273366634686D314C543472363445725157556D6A78504B355337736F70625672747263327373556276620D0A7953466A4D72686E324F6C2B4766464D5635714F6A5763656853616634647572692F734A7461746673386D735738316E47723263643749313542707371584A596D646D587A6B4543544B77790D0A32557670472B4C645A4A55382F6F52725663505272714D61435634566156576F347864306D36617053553161366B724F7A4F50452F54652B6B4E694977396A78586859316139476C694955340D0A594F4D584746614D3553744A4E58634643536B756A74644C702B537A6638452B39416A4C47342B493271734346442F5A394173346C59486A475831435167416335413359354F536343482F680D0A6754774647435A2F48486971584743646C6E706351433534487A52536A6E4F574F65514D34484F6631486D384A696147786A75723857477136736B732B6C36624A61794D6B3976424E4C43730D0A743164466C466F62716543654B31566F354664596A4A4B3055556B556A4C652F444B2B733276664D31437A75336930744E5174494C46784C657A4C635773642F594761316261384D56315A6D0D0A643432547A33566F676B797869524B3875586A313478346A6E6C2F7248565335593651696F70526E467A6972632B386F786E5A66345631302B55786E307638413653474D556E4C6A4B756B370D0A61516F71484B3571707970726E58764E4A537331716D666D46442B7762384C397845336966786E49447934536653493242427A38796A536D794D6E6E35514132304849797833626239684C340D0A525262642B72654D35746F78744F7061637041786B4D4D61506E4A47635A4A484A7775427A3936654976446A6144725230565A7864334555476E47556F712B574C7535733765346C67696B440D0A73736B634D303751724B43504E4342674D4535705361654C5777463363534E3530737A52524A484A45792B5845694F386A42574A594D4A5556482B346F427943474148464C787738574F61700D0A437078526A6B36546C47705A4B4B673470536C4834743270704E61367057523835582B6C54342F5478466546666A764D59796F4F4B715269306F783559303778563532766570306537656C7A0D0A552F5A512B4650685834522B472F4648682F777132714E616168724E7271747A2F61643346647966614A4C4557525A476874625655426A745558376A46696F7978434376724D6841546B71440D0A364E31353535342F4C3272776E34517A3566584973735359724752577953515661346A4A35787951774249395238703572334D534541417143653533456B2F552B7672333965612F5765484D0D0A377A4C69484963757A6E4E4D545578755A597147496A6938525057705671554D56586F4B63395872374F46474B665A4A48314F5263553574786C6C39506944694448564D797A6E48314D52500D0A4D4D62583171313631437173504755326D30354B6A436A424F2F7777527A483752386D37784E6F516457594777754D45746853504E69425A65666D596B594A364441417751515049374457540D0A61577277627047457478617945704D38514D4E755A6A4A4157586E39365A4659466C4B2F49666C5049723048396F7138332B4E5044747474775A5044776C514167412B6271327077444763440D0A356A6246636A5033447A6A497268626A52624731314334733435725335754C4C543449587330755A586C625672794B4330437450476774304D477058575441732B4653456F2F5678587948480D0A32437156654E2B4A6E54693034596E4130584A72577A796242536B7464354F4D322B725474716B7A2B6238624364664F633272556D6E4B575A597053652F7831616C46525731332B3462646D0D0A7447746831397231706552784A4670384674496B3873733038597A4A63752B33627664737546546F714B3230746C776F596B563763336A76773170646938516B462F633678346330712B75760D0A7336724C482F776B576E786162445932643776634B557458735A3771355A527931325541596B6D7649374477494C696538746A346D307753324C5764704C3545636C78476453765A4C7547500D0A546F704552524C4F6B6C71533869664973524D6A62536851316E384A542B65747661367062584E323976704D35744172527A5737366F4E504D66326E4A38754B4F4D587A4F307173344168490D0A4B6F7A63664B4F4750776A71546852684F56574D4B546235576C4F6E3959707953685A2B394E564A786233764854593177384D64687661564930597431465A50537963584B6D31792F7741300D0A6F314C5830656A317463315A50474551302B30747A5A62745273317549496452467A4B4E734E39635454537539715977736C3244504E46484D5A43716F557A47576952717536683855376E550D0A5974516976644F686B754C692B533473355463546F644D7434374B3173686157794647784549624B455345744730716D5253344C737A63426F6C37626158346D734C36364C33476A324773700D0A46506669316161334C7137694755787949774A51494C7449435332314364704F516453386E317A56627A5576432B717732463171647377764531695745535836517778764A484648657746500D0A4F7464525765446D39576352695247426A77793138395571597232556B71736F715570345A776C4653553578777A564F393171326C556A4357796E54636E377931796F7978733656566532390D0A6E4B626E526A54354C777153703032346538316F3558664B37327642743747377148784D6E76724F57306543614E54716B65706F59627834496E6C5730302B316D7437324B4F494C65516B610D0A657232796C6F7A42356A72756B42474F4D316A787871476F7A36394C63534C4C4A72636B766D6559383867744935395268314B614B317932314665654748654E764B494E6F42724F742F43320D0A7258756F582B6C78545764764A706A36676A334678493864744D326C704C4E644C424959324C6862654753547A5447735371492F4D614E70457A637350426346356257306D6F366E4C61537A0D0A367670756E54527043694A4262616A59366865766545794D5A6E53312B794A477A694259334A75466965526F736A777356537A5045536357704A7431467A536C7977584A47644B70726F2F640D0A39765553733957394F61786855575A563477546D34726D6C433931474C6E546A4B4532337064726E6C7274727532534A38524C68645073644E545472455236632B6C5845547530374E4C66360D0A5439725343346C4B4F675A5A597232517462734447737A476463504934504D54616A706A366D6C326D6B70487036545179533663627164786352704B7279774E65664A4D697935644E364B480D0A68556A62754944486E2F73326D76713332573331654D61627574576255706F5246356363776857566D67615145766253504A6C46593778457A526B67714B324E5130765162534558455869430D0A485551644D65526F42746A6C6A315552524D31717165644A756968615A537375316650654F614E564255452B485044597176486D6E4F456F304A5153356D6C5A517643466F3239364B53642B0D0A7253562B6A586C315858723037546E47634B44676F74325675524F436365366A47445430664E7A4864326E696A776C6F3047756E524C58573556317A544C75776B304C56545A543652614E4F0D0A43735537334B4F5A74516C3031695A394F6D4E74617A787A4B6A504B50336E6D6335346531364451333146726D794F7057756F324A302B65334D375772594E336258534D6B306153664B73310D0A70454A554334614E334376457852784459503466747643326C61706461532B6F4E663672715668714E33623668635133466939744861506151516F41397245303045737330663269435558440D0A427772447970564573656A366671747A703976706D73584D6D68332B73336472626D65304A75724C796F625A2F744E3362724D6B41566F586A61366B696D3278773237537551414572304A340D0A53744B4F476E476346566853356F516772576A695979616931316A37386B3174486D61386A746C44454E59537043564E546A546971634961572B7352557236765744626E7A4C614E3374617A0D0A30395638663668716C7556756250544876596F726D30683159517A4C66576C6A65334D39784C5A516E7A3274316A6A653675596F4A6D684D304D4570695356564337593941315057396538530D0A2F627265366464516730714B325262587A4645747462574E746F7476627559636C6266794368766E4977317648634D4D45386337346B30464E4E317550514E4F7533316153654330654336680D0A6A55576C2F4A654445626166496B30706D74692B496F70535659796952576A6A4D5A41365437507039686F31354643686B755042577275504547705754795266626C7674506D686E303172710D0A4A684939716236774F6D49697567645A5A4A787A4D78463462443470314A4B744A38744A70314646704F6371634F614D553138546A546C4B5366534E4F396D4643474D71597172444556576F0D0A554F5364546C61536E4B6C475531474E72586359586C652B30477575764E654A4E65754E523853332B705261684276533832326B6B61465934344C497062577977524C7552496F34595979690D0A354B62546A47446B59736C7A647A4B676B763458554E49524745434B717351575655776971473237634159554B4171674147757366513946576138766F4E486C754C4738665272694F314E2B0D0A3859306A54745830324C555A72356E336C6E6A6775504D74626153597952714948535954534652576E592B4776413133724E68703758326F74356D694C71306C6C4730447A33724C703873340D0A737247544B2F365738304F664A5A53574D6F695444526B7631764131717457707A754B6C577165306D6C4B334D363032723632567664684C79696B30545041596976694B7A6C566A7A56616E0D0A4E4B386B7561565370506C6E3062692B564F576C6C464A64626C3334547A686458314750636A6D62545151564879356A7549543877556441486242424949596A726B7239414C7449426152560D0A4A366A423435397550797235752B48303970443433314332736F376D33744869314333746F726C6B6135534B426C654B4F34434B7143554970336C45565379746B48725830487650596A48620D0A41552F7269763643384E6F796E777A53676D7633474F7A4B6C6F744C504530717135566234625454576D7A3748376C34634F482B72634B536C64304D646A715575577A313536556D39656B6D0D0A334B393365392B6A504D2F326B37743750346C65483438536F38486737524A6B57594B6347347574553142576A55676C6F472B30626757444235476335783933786966784664504C657A2B610D0A766D366A6372637A796F6978794E4F4C687268586A5A527569627A4842477A61633952387072785439742F39716E526641333753477265445A4E42316A564A394138456644425A626D4F2B740D0A4959532B7466446A77783468614E465A4A5852597A712B44473054374D4D4D6A41422B54626A397447786468356667712F774163674639626942494F5467676165777975772B6F41786B6E4A0D0A4B2F6338576546664847593855352F6D47467965764C4334764E4A56735056765A564B4D4D44674B464F7072485A78705369744C36743964466C336742347335757637547748444F4B6C67730D0A7871547A4443566E4A526A576F3471706963525171713864464B6C5669345832356C7475666F382F697655786347374F7033516E573467757A4B72694E6D753464346A754E7351434E4F67640D0A694A57587A435A48354C4D7A4855307A78524A6152366A7262367146314B4E4937654A4A5A773131644F365048437949574A6D57326C6A676B4C4F4D51704743754845525838734A2F7742740D0A5A6C5668443448636B535A41665856424247643744627059344A43706E6853546E4A59416A6D376A39747A565A482B54774C6152465357784A7230727367596A44414A70534B7841774D41630D0A4B70594251515438765638472F454F5463345A524F366E4B554F61713765306D70526850345837305A536E55306133747066543666422F526B385A71736E7935412F614A7153705478634F620D0A6D6C6555473472564B3762765A58746F3266715461654B745430397268724C554C6D334E3056655A566C4C4A4D325151386B6268314C6F775A315967536F785A67796C6D44514C346B76444E0D0A4E63432F756F376D3853534B37756A634D4A4A556E42457954795A444E484D47777A506B48674E797648355379667476654A7849797765446449554B32465758553735686E6E623932336A330D0A594A4259594F3553724B526E4659476F66747A2B4F5541387677763461415241337A7A616A4A6B6A4F33422B30786B6B4141672F4D6F42414148337138642B416E69545563464C41556F586E0D0A7A4B4C7232744A707076534B7530707974665A79646D6A306148305166477A45614C4B4B4E4A4F546C46564D556B6C4F4B3162656B72726D6E726671336F6D667362632B4D7237772F5A616C0D0A613347757833393171466E64616261773231794C76597438493472792B754C304C67782F5A5932743449424C6C354A466C5A4545487A656276346A76357053373374773255524756707045440D0A5278445A48486B734152476937496C4A4156573532686D33666B44642F74722F4142536D6E5978614C345551685165626655705375454C645731456267754F5141666C5573436F507935712F0D0A746A66474A334352572F68644D6B6C516D6C33556A6E4B73784369532F644D414B6348595371416B6B594E58552B6A78346B3468714C70596145456E7970346D316C4B584E4E506138704F320D0A2B74724B3239765266304C6647334578687A554D746F5534787461574D62635A4E38303232704B37764A5166666C50324757396C5A73467741783337742B51526B6E4F64754D446C57436E630D0A4F5351654D756B76376547574D732B384A746B436E3577785168734D50756C636C5156594E7548796E4B37675079426A2F61332B4D6431477369366E34626A4A583531476A706863374859490D0A4A4C6D5253634467394F437650436A576C2F61632B4C63746F736B6E69485468634B69757151364A703861504343753549693863685A31514D5170323979344A7A56302F6F786365564936760D0A417764302F77434D374B2B6969317A4C52757A31394772476B666F4C654C7163506156386D7070796B6D6E696D374F366175766157736D6C66585A746454396E4C6A787A424A70756F57466A0D0A70646E7062617974732B70665A6D7548686437656462694D3231724E4C4A623665444C744A4547476A526D696A4555556B6B645A746A7264354862473367314F61325366656A77786E43736C0D0A306B61585374754F63544C48456B714B773370475559344A782B4E326C2F745966454330316178764E527535395530654B626671476D784E704F6B584637444668336854555530585576734F0D0A2F7743556D564C4B365A4F51716B6B4F59726639707A346F3345727A53654A72737867626C6A6754544931794D4664372F77426D626C4F52743271446B6348414B6C76526F2F5269343571310D0A45366D4B7936456C474D5661706131503332314675586461397271316A314639426E7861714E7A715A6C6B744C6C696F526361726168427562635637335236333256347265352B794E2F72380D0A6F74374F49366850494C435551324A4D71774A484E6433495A494C646E4B65574A6279644448766B52566C646E4A554E75504E7833336A7533315458644C31524E4468384F7954474F79476A0D0A2B4A5974543154567279334D544C706C786F6C736B6B6961316133447A373743366B67754A66334D74674C324F55765835372F412F7744614838653635385A666876704E322B70582B6D582B0D0A6F79324F70577470716C756275356E6B7364527545756F76744F6D4E62514E484749597A434C615A67676D654A7650654E552F584C776E70396A643347723674716C703452384E584F6D6D300D0A6E58786234774D567072316E5A777A6D5748523963384E37724C57746475376535553333672F78506179324E3947397A4A43742F484462523239332B6C634766527277574677755A773474710D0A4C453479633656444450435648476C52703161456B7171626C3731586D5571627664386E4C7237316E2B6338572B41755965476D612F32427854694669387A7A444C364F4E777338484B55710D0A63634E5772566350467761556E4F747A59657047535637516D6F366133386A5878414E627364506C2B32334E39427039732B6D77787A52795774785A7262584E784A4C5A334674634C4464770D0A76627A79534B397665527138524F464561414161636B4D3176487039396332656F573172664356744E6E6B523462613653315A557544615845696C4A56685A3057513235506C6C7359484A720D0A3541312F39705834553350784A3852616665542B4F375434563637504672454F7653334F6E616C34753144784C34576B6A744C505868664C444A3467307178386357396E71656B613359336B0D0A307A7961644E6F5638326E36653679334B2B622B427632314C33584E61385265482F6A62632B4D4E572B46666930323064727033677A5562537931543459335668716364377075722B4237530D0A36672B7978665A4C495865693672614A4A6253366E70462F646D65356E755934316C38542F69575846346E4535777147627146476A546A4C4C5A564B622F65314A566E474C717579765470300D0A36636F7556302B5A526C66585830386D2B69747872784467387A7A5843564D5252776D45797A42356A68616549705470346A46304D58586E546A546F516D6B35317350536F346D7456685A740D0A526F77576E744E66314C2B4730724878546150627853344B585A6B4B4C49354343334D6279794D4D68593161534A576469717137416B37696C66556174386F787649786E4956756338352B550D0A676339656739786D767A49384A2F744B617038512F6933384E2F68782B7A666F666A32332B4476684F6534766647327033336E7A336E694377755A4674727656504530737233456B4F6C57720D0A4E4159686433496D754C6D5A70504A6A435178522F704F71544656496151416748414A78794D6E4743426A50516468787A3172716E3463312F447242344C4B612B5977786C66475378574F710D0A314B4D6255345462773946306F57657153707079643365647A74775868336D5868356C7542774F5934716C5046357373566D6B734B3552654A77564C36315042304B654C684676324E6245550D0A71456357715572536A5471787648712F77482F344B4D7A46663231666A4168582F6B47327677313033626C634B326C66434C7742706A717A4135445274615349366C6746787343376F794B380D0A6F38482F41415976395873374457504747733258677A523957384E61703467304F2F31534B646F745557776B57324562584D617061774B6A79773339354239722F74524E4559366A425979520D0A7A51732F6F332F42525055744D7638413976483971654F4C3978706D6C66484C7831345566374F79677062654339657550434535684A44726E47694E747970472F77433868436B4E356634700D0A2F77434655367A38514E492B4833674C787A3437682B436D6F4A34637539653150586E43545161326C6B6D693357734A70736C72623278454E35645178524E4C434678504C4643734E7646620D0A6F763841634D4D54484659656E5835644B304D504B45473146786A56706330564B2B6955494B4B62364E664D2F774246387178754A792F685068444C4B465356437248686E4154723134552B0D0A66326444415A4E6C7453716F4B392F61315062336F713376326E48617859384C2F74432B4376686638564E5A3854654676425A31487768716E682B4851352F43747A635157634B334175644F0D0A76576E3036394D577053756B4678594E486233643147317A6357317A4D626C5138736A48527474512B447678763044556F34624F5877743856496F624B4C77396165666136667074343574640D0A41733954753959316D357A486436647062574F742B494A336E6B5855685933397A5957466F6F30375434377635632B4948777938542B43622F566F62375464526E73644131473730625574570D0A4D506C3241314778756B7364526A676B44754A4C617A3143574C547A64674C43623874613545362B575070663433617A6F58674C34512F7372574F6C2B43504258687234673668345A6E2B4A0D0A2F6958556447304F337439533144536272557A59654176376275726C377139314A395330757876645431574F366C61336E754C6E657345635152453456576D6C56565745464346357A6934360D0A336D3354664C4C6F37336C472B6C3476657836754A78474470347249336C6C6646564D666D316147427059696E586C4B4E4F47553566693830645845303775507335306E5370566E5A4E2F570D0A615365746A354A31354470643365326B643074316277547A6D32767842506177333971736A72625874744664513239796B567A47676D6945304D5575786C453277686858425865714F5A41430D0A5143324363354F534E77594254754141347751534231787A6D7666506A6C3476306A786E592B462F46632B72364C64654A3952302B326A314852394847704D64493068496931724666584E390D0A6558674E394671413145506168346B74724B34302B31734C6132303633743757332B5670377447596C534467746B74786C517A59776651446E50484741536347764E72754E4F704B546C666D0D0A393558747331477957756A5331743033376E36526C6564314D54677156657175537376615571793572785665684B6447733432636B2B626C6276666539306E477875433763754D4D546C6A300D0A495042414944662B50636568794D644B7678616B5943575270433444713247325A6A4B3754486B594F48556C4741474344673542353569336B3878315647514D374461446769526A794678780D0A79324D4C6B344249354857743639306655744C6D573331437A7562473645554D72573937444C6158434A6432384E3361764C444F6B63714A6357317862334D54464E72777978794B53724B540D0A454B6A626175725362747272377174666432546262394E765076656230484F4F466549705045315979725170653067366A685473357955464E7A35597555564B54696B6E4B796B62316E4F410D0A474C4F4932786C577972464D466979347778636B41714477426E6A5055395A44652F384145726B325362456943755A7056797877753143697166764D344345413458647963414138425A32720D0A5463744E474D45664D703348424C5A4A594B774856766D554B4D71526B6E355433467659704261736B6C376D4E7A476B676852694645696955414D77565143796B4F4D344C344B35497856770D0A6C4C32636B303432577236747053355874335365694D38566D634F614B315376446553566E4758764E36374F4B76757459713774737472597450414861353373775A6B6843744758334153460D0A6E6B594E487434556255637578786E61426777323055304A64687661574E33424D52586169483553534647346F474B7143546746696835504F2F70476D5461744A62574F6D7733732B3144490D0A6A74494567573355626E75586679315347326A32675353797971754D664E6B684439712F733665462F77426E507737652F774443626647365650454F6857552B6F51615A3462537A315755580D0A2B73577136612B794C544C43514855644A6A68314553764A7143785773397A43696254464449477A574A6F786E436C4238315678764B7A7571616B704E79714E61704B7A56373365317454350D0A486966784477584465585638584F6A694D307138314346444235656E577131616C6556534E4B6E65446C47504D344F626B354A4B4B636E6F6B7A3547384370343568385236667266676D48570D0A4A4E6330653574622B3276744945346C7370524F7476484C4A4B6755516934655A62664D736B5964726A796C59732B472B6A6648552F37516D72364E5A5733694B587850714F6E334E7250710D0A4774586C767079793232694E4137323332585574634D56784E624A447035686E76306B76493470507445545469584172394876674C385235506A543852664539703444384A2B4176685838460D0A66436D6A76714E353457762F4141525A5336743430306933654F4A64526E6B67746B7472615051356C746451614B487A4462537978524E4C4C49373364747933376265735233507759384C320D0A66686A54726E5164473162346979525838316B69366446722B6E36666F742B39736B326D574B323172444174772F326B325A52316C61474761514B323161776A5478646245777277725531670D0A4B63717A6B6F4A7431366E4A476E4263332F50756E4B6F7063313934575465725838775A37346A344C6937784D345379334D65474D745762777847446F55703479554D544C42554D545378750D0A4A2B723478336E467A772F4A5045657A62616A56644E4E61612F6B47746F69744757733771575243496E5A35555A58436C6C4C42797577726E356B645931344949414F612F536A396D6239690D0A434C786A345466347A2F4833565A766870384962614E5A374A705A4E6D752B4A6B6C63525176617865544B316E5958457531494A54424C64337A45437A6738746C6D723469302F54344932570D0A4B2B6655626552504C4B517A574D6169565A56575349712B2F47783159746C3841686C4B735572393976687838512F676A385376324F7641737678797564556C305034666556346431714E390D0A5475394D764A2F4550685548544E48744A6C30692B7462362B6E314C524C7577314733566849736954504E4E4B4C6D336E49395846304A56634C4B6E68354B4C71553342386A55624E3075570D0A6D6B315A78546B3233745A72717A3772786A34367A2F682F68724B3463472B7A63387778394C4C4D52694D44476E577234616C58773957644A34576C52765A3171304B6C46533559786A4A750D0A337848316C2B7A377050774474766876346B305834496142486F336872526C75374D613148625846722F776C4C72706F6C625656316936555436316143396565787554635373497275796B6A0D0A38744978417A6334497951436F794F674A326738636431504848427A794D48765834742F46663841624838532B4A4E55305034652F434F47352B466677583048566C6A30587735704E3031740D0A716574576E6E777A334678346976493535726D6472713546786353514E65536F544D7A33447A7A6C33503753574C65645A327377634553775279416C55596B4F6F595A4C6253547A7A6B44420D0A34364376784C7856777270777947705553553144473070796A663370503676557431646F70365072712F542B544F4C4F434F4B65474D4C6C57666354346D70567833464D38586949304D54550D0A6E56784F486868593464705969556D2B5770566A69497A396D6C465531377169757638414D582B306E343169316239712F7743506E6A5656743770645A2F61452B4B33697A66654C356C74630D0A6A56666954346A31705450477049614F543757374F71686A73623551514258436674466172646168632B477645576E33734C36526536485961636F737263615042625132727A706F3173756D0D0A53616A66616E6261624E7074686233476B5361306C706561684662507177736F6F3771463565452B4A576F6D3838632B4F4C325849613838576549626C786A6171744E7246334979383941430D0A2B417879634C387859676B782B472F6A5470476D36412F673378726F612B49394862577243344D31307A334C327569325A576138307A5359476C696873727A554A624F7A74447145653663320D0A7A786D667A6B3037546F6F2F3365713430366277696D71564F464F4E4F4D3362535642716E464F323350546A736E5A58665A48396C5372314D4C68736B7234654C726632666C3243774D384E0D0A4633565369737677644771314834584B483165456F717A54696D7462363946384B627A34712F474858644F2B46656A7A5848694C54746376594939595338574F63574F6E61687264316358570D0A725839374A4C44636D303072577465756645716F393031764A71346876627131756E745955547276326D5A64542B4A6E3755766966776A6F6C7448704E6C6F4E3970507730384B32327346740D0A4D734E4C384F6543394F74394173376D575734424E76706C30317063617244496B546565743850733855736B7361796543576B5867453242316931312F554E423132447767646553317374560D0A696869693135764563756D322B675774784E474C733343614D7161314D797A7330596C4675417A5176753050456E785A30447735636178487073762F41416E6572366C6136333464753965310D0A36346B314F505750444537577376686D36315737756E2F74434878486F77674D4C70706B6C765A5041747641374552794B33473669564A787131464A546E43546D355876424B566F6158616C0D0A7A53692B76764E2F4C4B4F4C6C484F36654F7755497059584C3866684D50686B6C474E4C483479706846587874376644395677736143736E2B37536A6F70613972385446385966457A562F680D0A3538436642667762304F447876384E39476C304C564A2F41616E5539523858587A2B535A7462312B2B6A644C594B4C4B3230393769347631696B73726B3353335539744555733766335077680D0A2B7833384E66686A4461617A2B307434743158572F454A68756278766844384C2F4A764C75776873376565376C54785834725A78593665556874324531766153516650766A74372B345A52560D0A662F676E44342F6B7639642B4E2F77386D76354C547844385150412F39726146715676494C62564A4E523043572F69756261432F446964576C6931784C6B5278757259744A4A41774B3768390D0A4836643841764545642F4C7248784B385861503448384757476E366C4663336E697934307566587236435762616B73646A4466693358653068754264617263586B72744D5976736243526C480D0A7A5761347A456532634D4E68336948567077564F4E2B56516171657A536C2F655549516E657A556C4A7439543878347734377A764C38526D6E4332427874544C486C394C445974564B464F640D0A58465A6F383255386269617442786A65464F4F4A71346968474B30692B52665A505076687634352F5A37385061763457316E77522B7935704F6951335776364C6257766950783772563934340D0A6178302B397672614F38314E7250557274645074627933674B53573979566E6A67627A456A5A706D324477542F676F50484A5A6674632F452B515738634D4E34504346375A2B57796D4B57320D0A627756346569696B414446565657696B685645514B69784B6F58614D6E3262784A2B314E2B7978384B3951754C62776C70336933347836376F38736A326C316658466E70586732625672654E0D0A59726534645574316B6C6A7335342F7445486B575032614F52562B796F69674D506E33772F77434A39582F62592F61543076582F414231426F3368625155302B7A5878526557426B74644B300D0A507764345969755A59327672322B6D6B655336766430576C43376E6B79386B397647697146564265416E69344A777864536C5572547278644F4E4F79354B6673704B53623058385355656D690D0A56324842754A7A6A4A38366C78746D737379686B754634667A743432726D6465616E536C695867712B466F3465684A704F664E684A303037536D35596C52585A65752F737A6673626A34732B0D0A4239623859654F76476C2F384E744C62544A7465384E616A2F59503233533733772F595872575771616A7156334C4A417363647865534330305330676C573676477374527556694E7549486E0D0A6F66484C34462B4776674C38524C6A777059654B34666954463462384F575776367574785A7670672F7469376B6E6E7376446B384556314D786D6B73786133747738567848496C74634648380D0A755562522B7A326C3357702F4350346561663841327271336857362B4850676E514E59315458326A73496F497244776A6F756B524C344E3050524C534C39334D7A766265644E6433516553650D0A6155513235646D42662B656678563434316A7878722F69627862713073386D712B4C746531445737786D4C4A4548764A5A5A784769426D625969334432397358796B56756B61685341716A330D0A705268536A54556E4A565770536D33725A636D6B576E3035366B576D31727961396A5067486A6E69376A7A69626954473138645044634D34616E694B4F4877735531374F706A34536F594F450D0A616A6638536868366454477A3564707A693732615A395761783852666733646156345731507868592B4B7669683851745131355069643858726C2F45376544664457742B45626D62777A62650D0A4876677870746C346630477A31725450456570526164727A2B492F4772363238656E576D7277746F4F6B764C703864306E6C4E7463364A70326F6172726830585334745275726936315051660D0A4270753956315877353465303665356E7549724E4C6E554E517672765649644C5353333079776B315455627161555278795839784E63537950586C39346A61745A4C61517757396D393371460D0A6F6C396157397A4B7A5046702B6A364A6278584E325A517A6C7269587A37754F4559696A4D3070686A4B45562B6C32686673502B46745A2B4832686645537A3866586F742F464769364671460D0A775A644753534853446432634D2B6F77587853366959323170644C4C61537A736974626B435334525653526B38444335504E7A566244564B6A7031613870347161664E4B74547053566F61720D0A33564B657253736B70795356306D474B7A5842634B5A546735356A7844565746787562596E442F57617A6C694B6D4A686C3161437077546C7A4F6A7A7771316F4B635A4A78697556576C63350D0A4C396C54786472392F7744474379745A704C6B614871756736774C76544C57497757454E31592B485962432B7670346F6452512B5471556C6E47306968335353394E6935736F6D6B4B522F710D0A4A34692B485067763470326E6766776E726C6A4E632B462F41336A7944576452734C434E46696E6B54534E564B2B464A5955627A5A35745355774735496C53346E764C7133695351746471700D0A2B632F67722B796A7076773531573138516148724639347238523575744A7337466B6C744C5854375455544848507143573973393148644C4C466C6C754463694E3175492F6B5631646C2B770D0A4E543072346461485A7A3654346E31612F774244767044484C6465497248564A4E5031665462367A756C754C65374E7A624C444B74785958554D43327059544B495167416C544456397468730D0A4E474F43723046474E4E4C6B35597956725155456C474C65764E4B70466333583175667A64783778566C6D4D3851715764634A4F72536F6577773657496F6379717978735959696A587278540D0A626C6455713373315052387A63744C486F646C38492F685A3432314B2F77444675763656702B6F6548494C52644C6B384B2B4F50416D6851513650466257342B7A6E54377A55644C6A3150540D0A374B434B534D517262335832634B736C764B47386C5667385338572F735666427A7839666178652F596244777238505774723355447266674478566478715A4C47467353335068322F7439540D0A304F475333566271326E66547269334373676D45663732534750356F503759767861384C2B4B2F4576686E5264597476486E6843783150554C62545976472B6C7758742F65614C444D7A494A0D0A74577357734A4C306D314F59355A784A6D50793264572B37586B76786A2F625731625776416E694C34616546506837702F674758784F595A4E62314C534E57764A494A375A6B44586346705A0D0A50416951432F566C5361574B564743524A45794D49675235745442346D6C516856673234564A526B3470326370747153685A4E4A513939796130736F36655836466C484476694A6A612B46710D0A344C45315A2F57345A4E5479795653763959772B585A66556C5362786C614E52316C44473456565A31597A636F5362353475536C6F6642656F2B486644646E385262725250444F71617271650D0A6B782B4B4C6A54644B6E7537654E72363773307633744C4A74734441506354524350616B63616235484A564D5058394D4868644A5434613041336B4E7862335A30625466744D4532364B61470D0A342B78772B64464C45794B30636953626C654E6747526756623567612F6D563848613571666854786C3457385761556257485576442F694C52645773704A34496271434B36744E52677559700D0A4C693075556D697572637978487A5957696B45694D777743426E2B6D7A7731346A75664665673656346B766F4C4E4C3357374F505562314C4A5A6A5A7264334F587556746373782B7A6963790D0A43454D7A4D49396F596C67545835763470595355737479643871716577784D71547253316C4F56544358664D72627632504D374F313237712B702B6F66534C703568444C4F427164526657610D0A47477035685271597964534D6174584852772B585571696E467652564B4E4832392B737079533250357939462F596438532B4B39556E532B2B4A2F67473761534337315055596644757154610D0A7071456179726C4A5073356841696861366D74316555732F795359526E5A6C592B48654C76324F6F7643476B365A346938572F4561327362625772712B74624731307A515A64526E4C3253330D0A54466379616A5A4149384670497979676555684938386F72627A6C36502B3148385576435770576D7132477032646C5A7754327A616E5A6162704F6C61657570324E765035302B6E33456C720D0A5A527A4E444F71744867794B595766636D30726D767437346A51772F4554344D3247732F446A78443474522F454E707258697677767236586C75326E2B45704C445348314C555042327179780D0A2F4E7039693474623645547A6B744264726961636F464C6673754F715A44576A566C51776D4B725671635A5363485053376E54644F62576C37786E4E543061546357306C7438426D2B5A2B4A0D0A57543472425538626D6D4770346247314B464746576E54626853644E5666617862646C47616F79685573376330616267727930506A4877392B7950344C38534457557450694234686C6B30720D0A7737716E69484D76683630736F51644D76726E5476733178492B70334A74703562713361595153375A4774556558617056315438323535704970705970563250464B305478673774726F78560D0A6C794D2F4D4375446B397570727638415776697238526452467844632B4F66465573647972523355663975583678584B536277367A424A3138324E3063355667512B34466A786765557A6C770D0A476B5A67526E4C664E7A7548566D504A4A4A35796563357A7A6B31385A6D746243536A526543777457673654717972796E4A7456452F5A79704F7A756C374F4B6C66757058746F66704844560D0A4869544C355936746E75615278367230385038415659303463696F636A717972796C377A62352B61455537743267744F70364C344A2B4958697634632B4A744A385A654374566B3058784C6F0D0A736B736D6E58386152536D497A32306C744B736B55365377537879517A797179537850486B71323365716B486937346A2B4F76487571334F73654E66464F742B496452764A476C6E6E31432F0D0A6E6C6A6469564A43516878436966753043704769716F55414B414D56356F4C7441764C484F632B68786A6A384F446E382F7239432F424434486E34755766694C58646131392F4358686E53440D0A62615270476F744643386E6948786C66465A7250773770346D5A55646C744665572B6B51534E624735735155496D626238763841574B6B35796A536C377A657572326976646B3557646B6C660D0A573676644A363250627A504D4D6A77636E6E575955734B3852476C68384D735455703035314842564F576C53392B4C2B4764527958574B356D74457A78754F3856633477442F454165707A360D0A396A3136382F686D76742F396A2F3841616238422F4171353856366634352B4869654C744D38617836625A3668714D4D317539396157466A636934466E396876462B7A58566D303232376C690D0A456B447A537852683263527868652B306A396A723454615643756D2B4B7233783763654D4773594A594C65347559744D3849333272587373554F6E36526236355A61526454545379764B504F0D0A4D454C7445466C4738694D75656A38512F73766673362F442F77414B2B4D66694434716D31632B467643756E3239746244532F464E7A4C6636703472696A4D4770365446486557647448684E0D0A555A4C61315742706E664C79507457496F336667343468564B64565370715547716A356D31474C53715835322B564B4D59786C7A36327331646454356E4F2B4F65477334793745354C6A70560D0A3854684D5736564A55384B327056704B76546A516C536349326B6E576E467869306B2B57584D6C4661653366745366746166444C7839384E2F77446848666739716C3950666646472B3069660D0A783146636D34736D3058527643467248446F2F6834574D782B7A577364357142686C4B32662B6A75734E795A586B57345572386A512B4774576930533276572B7A5453335676464D593437590D0A7A65544338386154794F596C3249715150735A454C74456C764B4D5268636E3456302F7854614C713754327475644F736D6E6B75497261616553345778744933655A59354A6D49613438744D0D0A426D645330306741326C6E56612B68744E2B50656D77572B6E365A5A57554569616642657A3346337159755A7A4E4B46653838315545367246457577724843416563626A49535165743579710D0A376C5754684B6673347153552F6469344A72524E4A387A764B545674565A4C5A5831793341523452796C5A667737374F72437256786550785653744A4B7135756C44367453715753633351700D0A786A52537473705773323066623367333459654B64597562565A59544659797A78574E7471385676434962712B67745935376932303132614E566D73596A3547325578434B47414F514957690D0A4A2F5A76344D2F422F77446147313358504358687677564234523171483470492F6754532F434E3054466F756E335770584A6775645131795333382B48545830794F78762F46457767652B740D0A6F64497362793857324D4452536A38456668352B304E63322B6F36566661734C5933567174302B6E3231784E63374C62543756784E714573566E35365233454D6B6331796B6F54664F304D410D0A654C7A6F344462312B782F374E2F37514F7258396D4E56305348543549377656744831474337306E5637714334305455396530356F5A5A644F754C66587264394E617930693661326E566F6F0D0A317437623756466367785834537652774F4F6F7A77306F55713871574B70346D46476E4632555975733578396F3438793534786D2F614E62535546716A3855346A772B59356A68714F417A700D0A383162433570692F71394343617731543635694B734A4B6B72614F47496163586137564F554532343250335738482F735966466450677A70506969363137775666367A352B743656502F77690D0A4839725136665A57756B366A4C70566C64616C72467A70756B5738463935634D556B566A7059764C795747534F57465753567049766B6278482F77546A2F614B31487842346831627854632B0D0A456646503974777A79364A706C7A347857336E5347784A7572574B35302B4B36463361794331692B314C4E71566A6279584E713976396B4E374A496B636E364B654166474768654D76462F770D0A2F7744432F6944782F632B4574572B77797A61645A57766A652F65396C33364259364E4A71397270476F2B4D6F744E7639583158786A657836704738516B764C692F315039784A44706D6E780D0A696239696668723844724C77354A50726C7634793144585A3953545472714C57722F524E4A665670516C6B7349766262577273366A654D6D6F57726A7A6F70474D5562466B69686851526F6E0D0A6C5933695776677350516C69366B3630716E7433546361664971734A54634B53715356306E54537332396252535375376E344F73426D564C4D7672474635456F4B6A567055366B5A527370560D0A4A7871786C6550616E4A37646E61352F45483853763258664633682F585932313777373459526A4F316A6148773763336C3649486A7554424A49587447676876706265526D4A6E6B5A5473570D0A4A7045574E335266676D5077393445384A6646665339442B4A6C685071766843367633307A7845736B7478706C317055656F4E396C6B75375365325A376D337574446D623763716F484530640D0A715970466B686E654966364A2F774164666754345076504432752B4E6252644B30612F30727739655336784976687252706A727132317A4272426E76445A326C6F5676357275326C457477490D0A5A6F5A46314339575332416B44702F6E346674792B47644D306234762B4A357261347662665478346776625879316A4A2B79584E752B507335685255327046453176645275543571787976430D0A32664C446E33636B7A724435706C6371384931497A6C696C687071556D31547276447A7151677050527570536735786136776B7448592F714877677A664534374D38773464786D4B784D466D0D0A47585044304D565471792F6454354A77704F696D2F7742334F6E4E4F7044613871566B724D3350326B2F3244664576776F744C6E7874384F4C71547833384F594E49746645453931485062530D0A2B496644656E58425A6F626A56624B32574D616A7066794634646130794C5930615353584E70614C46353876365A664157394E35384950413039307053344F6C7A52544C496E6C75487439520D0A7662636B6F30524944655675586E42556772387046664776374E6E78336C38532B452F436B4E37714E7A3468757667356F2B6F654366486E682B364A6B66786A384650476C3770746E496C350D0A62544A4A39726A38463338503253532F52784A70647265614E6658524E694E556C6A2B2B624C34663366773874783451384D5154616A3462307557356D3850336368655233305456376D58570D0A744B6A5A35356D6D4A74374855594C592B595377386E42365972356E6A4B66312F4276427A704E3163466D4E4356724E75644B74673633733679736E654D6D7077625339325555744C3250540D0A38514D5A6E713461795468336937453038586938767A4C467644356C5A5171314A595259764459696869453348337175447235506D4F476E6471746838524F7A626F79356634784E66756C570D0A77644D42354A49314155453433484F543377564A59424E7A41344F666251384A2F476A346F2B4866416E6A6234552B45376A554C7A512F484E6D4C6538737257327562323873346D6B582B300D0A70644D4551643755616E5A68724C5548564756344A4777524B776B726D504571534A6277704D4A496F4A7030576158622B386967624F3931556C555A386650674F75374F475A534458327A2B0D0A7A7038665032592F67787064355970612B494272756F3230493144784C71656977334F703356774449306C764177756E6773394A6959525351576B45534E4C4C75653561637047342B336F300D0A6F65306C55645A555A546A4E6339374A786B6E4678555838546C7339374E4A7071795A396C787A6D454D50673477686C557335723036394B76546F5167704B46536857685032726D745679630D0A7930556C7A704F4C75726F2F4D2F5564483176546E4A31485274587368397774643662655736686A676B4579784B41647047426E6857513947424F48644B466A4B3477534D6E5042786B34330D0A416A75446B666A6D763131384D664537344F5848784E7650456E6962343454654A2F424D2F77426F75763841684776456D6E7A5449303177725278326C2F617932386C6A4A6132355A5A59350D0A7264566D42524555694D4E752B47663270506966384D6669423430654C34532B45644E30447772707A4F50375869302B477A76396576475A2F4E6E6A6868534E4C50535967414C4F323873540D0A534D386C78634F664D6867742F4F78634955384A6961733343456E4B705468546B303556467938716E464A2F424B3937766262794F5442635231735A6A71575879774E5731544C36574E71590D0A745163614F486E55696D384A4E755458746F744E4E616561506B2B64696D384164656E3078313434355062484F63646858306E34642F61372B4B66673377546F50674C775A7033684877316F0D0A33682B4543336D6730524C37554C6D2F655670377256727166554A4C6C583143386D627A7035316A55376A745462454934302B624A69426A4A334138642B2B54315066365A716978493442500D0A4A4242494F506465507078317A6E6B64362F4F4B39657468716C6232552B565650636E654D573272387A55627254577A30364A4A366148546D4744772B4F644B4F4A6771734B552F617770750D0A7A55616C6D6C4C564E4E70546B6C7070652B6A737A36686C2F62502F41476B705343504830634A42556A793944305542574334796D367763717A5A4C466B5A58335A494979632B582B50666A0D0A4E38562F69686232397034383862617272756E576B2F3275445448614332303562734B564679624B7A6868676B754147664573694D344D6A6B4546696138767964793550504A2B36446C73410D0A413950787A79523170797478314142425050767763652F6250512F6A585050483471635A7864656F3431497935347070637974313555743074624E64627437484C5179664B364D34536868610D0A4D5A55584832543559705135487A776153696B7557627572577331667951305437494756354131796A7A4F75344244436B78686858706E4A6C686E6B6345382F7532326A414A7253335538630D0A3855534C497A5346535552537A4D562B5659786A2B2B58323478383341357A7876616841496D30795750427437725362435243534D2B616B586C586934425057365359672F7743336A6738430D0A6F30534844455962352B51655146586A42366A4A787943446E387135384A7A7A702B3068556358556B35505853796E4F4E6B72396B6C7662643276763151707A7847486371565230366A71580D0A636E6472334A763362637A7465316E723164306448483472314B572F307255524956585349394D7437474E6736434F4853306A524A57565755373770316D754A6A38323970354666494A7A330D0A396A38567647576861763479384B61664A6478364864363966704871467463584E736C72714E6C663339785A79794657574553334671736B4D7359426B4D6355616F41734B6266502F444F6D0D0A77367634683050534A57456476714F70324E74637A644667744A626949586C7737414E73697472627A5A3547494F784932596767565A6D3147316A764E58754A4A49545A58336965505655670D0A6237537338615433467974786543574A67504B68735A354958686B4D6A534362355276554D4F3272395A547031616453643661752B56766D636C5554684A326574727A6574326F743939506E0D0A654A386F71564B4747784744702B327865575268694539486553786361366D343671556F79685771367436546E6F307A39752F3250666972385450453369333459487858633631346E2F73560D0A66433269746570665063795774677575334F6E57647662534E634A642B586350425A525433414469335779685A4E736B5559662F41456F50324F50446E6950773738467644493171434333300D0A33563946384F3635345A6753386E7637324453645A30437831613467765A376C35475642713937714D396A612B5A49624B7875594C4553794A625275332B58502B785A346E69316A346765470D0A7266526F5037456B306E574C545649686233624648306253343061652F42754A556B33535878756452654A647262356749493156575566367058374C2F6A6E5266694A38417668583469304F0D0A5179576838462B48744D6B56696A7642633658704E705A5378794651715A59524A634C73415879356B41414F514F6E4E343131777A6836334C375346584D616C437056616235497143784E430D0A55584C574874616B7130585A744E523562492F434D3777764A6A5072737162707A786E7447344B6D3455716475576F6F78546A47312F61536C464C5A4B53376B663754666A6E5366415877630D0A3859616872566E6558397071656B61706F6F743749512B655A6233534C396F6D416B473078744C416B4D685569574E5A764E69445045416638386E39746E5857316E7868663666637641796E0D0A786C71313639346B6F6D2B315433384D4E774A477547534E686D33653246776A7170696D456B4C4A35735575332B76622F67724838657074412F733334573257715157397661364D4E64314B0D0A4F314965396A314C556F74527459526652677138647648703732387470735946354C7559754274674E6678562F7451654A724858504567533331697A316947323066532F746435444635437A0D0A6174505A572B6F616D596F70566A6D515775705458656B6D5542306D467035384C6D43574D48362F68664C46672B486375357272465A706D437A5763573231444334536E586868323161304A0D0A566F56456B74473037363354583674344E5A64566645474478584C704F724375716954664A5177306131334A3752645774586A546974326C4A327365512F4450346A367A384E5047773861650D0A467072643737537269345734302B346A52394C317652372B336C746461304456725A4D7050706572616338316E646F4549574F59795174484C46464A482F514434552F62632B4332722B462F0D0A446C3864503852366675304C536259574E35614A66334E71746859573967734D7439484D467647526259415852416B7546784C4B71797534483832326C524F3576416A68684D384D5A6843730D0A7937704149537A425679646F6B647A744A7A786E356753667450774672625758672F514C4E374F306B6530735262504936544F7A50424C4C45354C4B6D302F4D703448516364712B6D786D520D0A777A4B554A4B717146565534786339457077707962555A5830636F75616358765A7931733266305A346865486D546357596642597246517850743850586A435377386C46314C5956306661560D0A453361556F5268476B7072567763597474516A6238642F6978345138557262574366325264427A35724D434977567746554D523575435175646F4A59397A6756383458486862784B6A4D6A610D0A58645A3667356A6235574734452F4E78317965674235485776306E2B4D4E3842635763594B3756516B6B414B58615461335462686C593751646F44413859357235346B676B75306E6D7434320D0A644C64664D6E6D495668456F56354E70624F474F49704A4E6F487A694E6D777172686677696E346B356C5767347643306C4A387A6A625A4C6D6A645837614E76737454774A5A5A546E4E53710D0A315A7767323474763476336961546C712B717466766673664B7A2B462F4567484F6A586E47774144626B74775641416235736A35766C4445444236436C486844785346542F69535865414D450D0A4B714436413559594942427831775054466654694E67435178426F6C43347A472F77433849794779796873594A4F515133484C353546644A706D6B336D6F784C396C74705A4A42755A3151630D0A375353374835686748596A4E754243454450596B65586D5869466D6361635A5042715570793549517330394975556E7242717974653336485A677368774D337A7A78456F78634975584A4B6D0D0A6D6F786B6E4B3773396F744A583054666D6647747A344F3854374E7A614E644C6B74674D4548626748352B43667A50706D71532B44764578777136526373564A4C594B4541673441423341450D0A3864426B6A6E6A5046665964397074344A46742F7330386B676B6149784C457A73587A35616851697353323472474E6F4A4C6B414173526E4D537875356D564674376E66747874454D6A74490D0A4153515141704A58437948504B35566953647078386C696645444D4A7A55705A644A7A5464315A702B37613931374F326A6131327531366E632B4763706D366B33693679536A486C667471530D0A54546C644E2B34374F79583348796766426E696E7A4357306D65505041444E454F53526A6B73427A3248586B45634D4356506772785249416F30746753534D6D5350307963632F51646565330D0A617671615454373473592F7374774A443931466A646E594C457375306B42694E73624B327A2B454D47594B774E4C486F39374E446454517758442F59626462755A5447417774355A4C65425A0D0A3976384146455A5A346C4444494A59594F3031795334357A5238716A6C39704E744A506E3135584B396C374B3172526B3362346B6E627A4B6E44475651552B6245316D6D756137727754664D0D0A34787537515453764B4B5731723632646A35676B38493631447030556C31626D336D73336B533152325178584E744D375842547A6337595A345A6E6C64466B4B71364D526B455A716D2F682F0D0A56555756696C7675534A41552B30784572353230715468396F33626C4A473749424848703966615834554F70576C7A4C71624E5A57304E3770576C4D4A4942493476645646346252586A646C0D0A4969574B7975336B6C635A49534E5679584443712F77414E6453696E6A682F73534F563231464E4F6861495253435739613676724A455442634658754E4A765642775147686B7979353344700D0A7776476D615573506435664F536E566E4A636E4E6F6D357863576E4736587449747032756E6457563166784B6D525953686971314443346D45614B744E4B7455616B70536263326D6C3779550D0A61696B6E5A58585336757642664366686658494C4F2F766257315358566275786B303354356D75424462324564374539767156774E344453334432556B747444685248474A33664C4D4678420D0A2F77414B313853536834356F374E5659454E7575416367395164716B35494F646F39526B697670654C77687274766133743262494C5A36664F317664734A6F52396D5A4674475A776974755A0D0A4669767261566E436C664B6C334544424233706641327451586B326D6F7345393342716D7261564973637165515A6447733176376B72634D366E354C6664495274556C4549566964796A47480D0A472F45716C4F56504152554B6B7278556C4C5A70786A4257535474797A752B7276756C70363248796A4B4D50536172346831716B3031556271576A793036554C78616132536E643833387A300D0A746F637038437643486A585166462B677932476F57316C637065573678547766615A3555676C62793577596F676B747A474970585A3445594E4B6A4E476F4959592F30332F7744676D562B300D0A42384D74502F5931385036496E6A377735726D7465444C54557A657A365261367659724E62692B577A744C79534C5659576D695A41396F7337764E4C4461744C465A504D58676B632F7743630D0A72384A39416E755045462F6F2B6F334D756A366A6F51545549372B43574A54484A61366A59576369724F5A46694D4C77586A3353795A79786768556C493543796671502B7A7238652F6A46380D0A4C426165482F422F6954567062472F307278482F41476A70467863765A51377258784650702B733663366F7756344E55476E327279573979787A4B7A4835536D5439666C58484761356A6C380D0A4D466E4F466938756C6A595455634F725656696348586854644E704A587570316F53757265394758512B453434345079664F36454D4C684B315042347644526F34754C35597145714E616A4F0D0A6F7075615564485267335A36366E36632F774442536E34752B4B76693738553376724C5739496A2B784750536452316133732F733133716D32465073697A47334B69533369746C6132526E560D0A6E4F774E7541534848346C613538427463314F39533547713255695854376A4D59356D4977363759697063444733766A637733467344433139702B4C376A78523430385461667163743142350D0A6E69725372587855444A4D736346766279365A5A546167345941524E613239314C4C61784F6A623977554D49734671386D316656372F53724C567055754E732B6D32463974554647506E32550D0A4D2F4D5A774933626567415653435849494F77376134754A2F465469624C385255686761644842594F6C4B4E484378396B6E46306F776F754D4957753146554B31475353356275642F54376A0D0A77333464796A4B63746F3063484B4573525377727159687633716A6C536E69597A546B374E4A3138506949704A3276466158536238673050396C33583472474F3662566F59497269535266740D0A503247344E73424736717265612B7856667A433061466E566478437157334B702B70664450374F647A466F576E4B66453877597850493468675A49684A4C4E4C4C4946555338664F375A7A670D0A6C736B6853534236316F476B66455034692F47587758384E4E4330613750776B752F41646C642B4A5048626163593950306E78524666523230576A576D764C73676B756452307255476655740D0A4C784C494448617A73496C6B64322F6F522B43762F425050775644384B2F424D66695078586158757566324F72366C645357316F7A7A334D747A635374495765554D515664647049414B34780D0A7869744D723435385563797035666A4D4669734D364F50796E362B31576F7867714638645877634B54556B6E7A792B7265305461584E4353615453752B544B764766493866504E63466D57470D0A6E517135666A6F7777796F50326A723465634A336E5064526E526C4651714B37664E5057782F42423853644D5A37315675644E314B5178527235594B69474D675955496F6659546A614267440D0A35546B6344466555523363476B4938636E68385377764E44654B7436575A556E68696D6A6A6B5749626C66616C314B4E73684D62456831553741535556793163485377636D714C6B6C3866760D0A576C724F466E75747571586474732F50493857356A69495256576C68704B584C4F5875545635633058306B746E4A74646D376F67314C783147304E78436B476E323565475745724D7361694B0D0A4F667958624252427969327877587A4950506E33456D566958365A3854626254426553584E33704A7562363661366B44766C49524C444E4635635A53554D73537833446A79313558455944660D0A4A754252586A3478566131536B35563578644A38306553464F4F7334386B72364E2F433362315057776E45574A7055352F77437A5961664F765A74533971317971704853796E3135566439620D0A49664A3859476D45527432305A48745447776D525638786A446432313745345A35464A506D5763534D5655767344626D4C4E6C736150346F7644473643665351582F732B507A4E3464346F740D0A505353336969527A4D376F73697A53764B643236526D50497969715556355370564A74743469716E4762696D6F3037745762642F643162627533354C73656C533467727868474B77754761710D0A4E4F5633572B784A4A4C34746E6433586E3642622F4668374A34336A754E4844516C4370614F416C647351684149334535325A4C427374497A2F4E6B4C48747A562B4A6B6B56784C6366624E0D0A4F527272526262772F4973666C416E546265534C79676D63786934587959794A6D566957524163394155566E4B684E537066375256646E64653754547637467865716A73314F6431317672730D0A69337846694A4F56384C68587A4B6E5462627276335A536F79647666306439622B534A6258346857546133714F6F3374786258467471556F6D6C745A4A6F73706357304E7848706C394848680D0A592F74476D79796D5A584B474E775A6F3341575279477866456937745959726144574C54796F4E526931474761526F5775786451584E3764776C70794E7A424C6A5539514A562B4239706D430D0A6A446A42525755595659745534346D74464E56616A61354C3371314655612B47316F796A65466B7557386C7332636C5469437535516E4C435953556E436E4233565672393075574D76692B4A0D0A786B3479623353585A46534C3468547832743561445539502B7A583758506D7842597A752B32773274724B6F504A5654485A327934344D625249513235546D3250695A636D647057316D32610D0A616536753736562F4C684261357564506B3079396B3362666D6134745A47535871727353636B346169696D385055546D7672654A39794B6C44336F2B363774365753745A796B3132753942660D0A367A596D584F70595042506E616C4C334B6D72356F51663274453478696E33736A742F426E6932533831365338585837473075645967476E333131636556464339767467543936504B5941450D0A51514D7A6C4343794B7878795239362B41726E53394B4E673876785A744C76563771336C655038417378764F67684770587A5864374265586A577559354A4C69424C736F4E7750794D4379790D0A4E744B4B39504C734A374F6E64596A454E2B313971727A576C537055684F633170626D6B354F377435327565666A654C4D5A656848366E6750337442516D33536D32366447484C54703335370D0A387349314A5253767174476651756D7961395063365070326C654A337637577974456A744A53516261306975624E4C5672614E6C746C7A42396E327758455A42585A45415663716862336A340D0A632F4337772F63586C7865654E6D4F743238736243537874566E473935585954455362594E786C6956526C416E37715A69437043344B4B654A796644597172435749715636797075556F776E0D0A557643384977684853335345595176767977682F4B6A7A31346935316C385852776D48792B6A7A78634A5649305A71636C4F724F724B3735757336745639462B386D39323266735434532B4F0D0A586833396F6634772F4462773938526A616673332F73792F4365793133584C5434642F446A53725332307A58727930304A644F3069797647302F5333753776584C6D5343325837624E6179780D0A434A5A6F596C676B6E5735484B654E76326E6669664A34723176384134516A5464663033776846654732384E324C5332786B74394874496F37577853556955677A744243727A6C53792B63300D0A6D316D47474A5257644F6C694B4E42554B4F5959326A47704C326A6C54714B4D6F776F7A6E476C683457584C4368546465724E516A46586C4B37765A487775513570444C7377782B496F355A0D0A6C383355705571667336314F645345506131617465724F504E4A7A6453704F4D464B55704E3873556C62572F2F396B3D0D0A27',NULL,'','','','',1,'',2,3,''),(6,'The Lost Hero`','001',1,'001 Ric t',4,4,'9781423142652','','','2010','',X'',NULL,'New York','','','',1,'',2,3,'');
/*!40000 ALTER TABLE `pus_katalog` ENABLE KEYS */;

#
# Structure for table "pus_klasifikasi"
#

DROP TABLE IF EXISTS `pus_klasifikasi`;
CREATE TABLE `pus_klasifikasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pus_klasifikasi"
#

/*!40000 ALTER TABLE `pus_klasifikasi` DISABLE KEYS */;
INSERT INTO `pus_klasifikasi` VALUES (1,'001','Cerita','');
/*!40000 ALTER TABLE `pus_klasifikasi` ENABLE KEYS */;

#
# Structure for table "pus_lokasi"
#

DROP TABLE IF EXISTS `pus_lokasi`;
CREATE TABLE `pus_lokasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `utama` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pus_lokasi"
#

/*!40000 ALTER TABLE `pus_lokasi` DISABLE KEYS */;
INSERT INTO `pus_lokasi` VALUES (1,'01','Meta','','','0');
/*!40000 ALTER TABLE `pus_lokasi` ENABLE KEYS */;

#
# Structure for table "pus_member"
#

DROP TABLE IF EXISTS `pus_member`;
CREATE TABLE `pus_member` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kontak` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "pus_member"
#

/*!40000 ALTER TABLE `pus_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `pus_member` ENABLE KEYS */;

#
# Structure for table "pus_peminjaman"
#

DROP TABLE IF EXISTS `pus_peminjaman`;
CREATE TABLE `pus_peminjaman` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member` int(10) unsigned NOT NULL,
  `buku` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `tanggal3` date NOT NULL DEFAULT '0000-00-00',
  `mtipe` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `telat` int(11) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pus_peminjaman"
#

/*!40000 ALTER TABLE `pus_peminjaman` DISABLE KEYS */;
INSERT INTO `pus_peminjaman` VALUES (1,0,7,'2015-07-10','2015-07-15','2015-07-10',0,0,0,'');
/*!40000 ALTER TABLE `pus_peminjaman` ENABLE KEYS */;

#
# Structure for table "pus_penerbit"
#

DROP TABLE IF EXISTS `pus_penerbit`;
CREATE TABLE `pus_penerbit` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pus_penerbit"
#

/*!40000 ALTER TABLE `pus_penerbit` DISABLE KEYS */;
INSERT INTO `pus_penerbit` VALUES (2,'PUFFIN',''),(3,'Annual Books',''),(4,'Hyperion Books','');
/*!40000 ALTER TABLE `pus_penerbit` ENABLE KEYS */;

#
# Structure for table "pus_pengarang"
#

DROP TABLE IF EXISTS `pus_pengarang`;
CREATE TABLE `pus_pengarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nama2` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pus_pengarang"
#

/*!40000 ALTER TABLE `pus_pengarang` DISABLE KEYS */;
INSERT INTO `pus_pengarang` VALUES (1,'Quantin Blake','Blake, Quantin',''),(2,'Jeff Kinny','Kinny, Jeff',''),(3,'CS Lewis','Lewis, CS',''),(4,'Rick Riordan','Riordan, Rick','');
/*!40000 ALTER TABLE `pus_pengarang` ENABLE KEYS */;

#
# Structure for table "pus_satuan"
#

DROP TABLE IF EXISTS `pus_satuan`;
CREATE TABLE `pus_satuan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pus_satuan"
#

/*!40000 ALTER TABLE `pus_satuan` DISABLE KEYS */;
INSERT INTO `pus_satuan` VALUES (1,'IDR','Rupiah','');
/*!40000 ALTER TABLE `pus_satuan` ENABLE KEYS */;

#
# Structure for table "pus_setting"
#

DROP TABLE IF EXISTS `pus_setting`;
CREATE TABLE `pus_setting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pus_setting"
#

/*!40000 ALTER TABLE `pus_setting` DISABLE KEYS */;
INSERT INTO `pus_setting` VALUES (1,'idfmt','[nomorauto.4]/[sumber]/SIADU/[tahun]'),(2,'labelt','METTA SCHOOL LIBRARY'),(3,'labeld','Jl. Puncak Permai Utara, Surabaya 60187'),(4,'bkfmt','[kodelokasi][kodetingkat][tahun][nomorauto.5]');
/*!40000 ALTER TABLE `pus_setting` ENABLE KEYS */;

#
# Structure for table "pus_setting2"
#

DROP TABLE IF EXISTS `pus_setting2`;
CREATE TABLE `pus_setting2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "pus_setting2"
#

/*!40000 ALTER TABLE `pus_setting2` DISABLE KEYS */;
/*!40000 ALTER TABLE `pus_setting2` ENABLE KEYS */;

#
# Structure for table "pus_stockhist"
#

DROP TABLE IF EXISTS `pus_stockhist`;
CREATE TABLE `pus_stockhist` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(200) NOT NULL,
  `tabel` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `nitem` int(10) unsigned NOT NULL DEFAULT '0',
  `nceky` int(10) unsigned NOT NULL DEFAULT '0',
  `nnote` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "pus_stockhist"
#

/*!40000 ALTER TABLE `pus_stockhist` DISABLE KEYS */;
INSERT INTO `pus_stockhist` VALUES (1,'stok','2015-07-10','0000-00-00','','so_1',1,0,0,0);
/*!40000 ALTER TABLE `pus_stockhist` ENABLE KEYS */;

#
# Structure for table "pus_tingkatbuku"
#

DROP TABLE IF EXISTS `pus_tingkatbuku`;
CREATE TABLE `pus_tingkatbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "pus_tingkatbuku"
#

/*!40000 ALTER TABLE `pus_tingkatbuku` DISABLE KEYS */;
INSERT INTO `pus_tingkatbuku` VALUES (1,'01','Toddler',''),(2,'02','Playgroup',''),(3,'03','Kindergarden',''),(4,'04','Primary','');
/*!40000 ALTER TABLE `pus_tingkatbuku` ENABLE KEYS */;

#
# Structure for table "pus_tpjm"
#

DROP TABLE IF EXISTS `pus_tpjm`;
CREATE TABLE `pus_tpjm` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ssid` varchar(100) NOT NULL,
  `buku` int(10) unsigned NOT NULL DEFAULT '0',
  `peminjaman` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "pus_tpjm"
#

/*!40000 ALTER TABLE `pus_tpjm` DISABLE KEYS */;
/*!40000 ALTER TABLE `pus_tpjm` ENABLE KEYS */;

#
# Structure for table "rep_file"
#

DROP TABLE IF EXISTS `rep_file`;
CREATE TABLE `rep_file` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(128) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `ufile` varchar(20) NOT NULL,
  `fname` varchar(128) NOT NULL,
  `tipe` varchar(5) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "rep_file"
#

/*!40000 ALTER TABLE `rep_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `rep_file` ENABLE KEYS */;

#
# Structure for table "rep_grup"
#

DROP TABLE IF EXISTS `rep_grup`;
CREATE TABLE `rep_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `passwd` varchar(30) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "rep_grup"
#

/*!40000 ALTER TABLE `rep_grup` DISABLE KEYS */;
/*!40000 ALTER TABLE `rep_grup` ENABLE KEYS */;

#
# Structure for table "sar_aktivitas"
#

DROP TABLE IF EXISTS `sar_aktivitas`;
CREATE TABLE `sar_aktivitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `aktivitas` text,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_aktivitas_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "sar_aktivitas"
#


#
# Structure for table "sar_barang"
#

DROP TABLE IF EXISTS `sar_barang`;
CREATE TABLE `sar_barang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi` int(10) unsigned NOT NULL,
  `grup` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  `tempat` int(255) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `barkode` varchar(50) NOT NULL,
  `urut` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:ada 0:dipinjam',
  `sumber` tinyint(4) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kondisi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `isImport` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

#
# Data for table "sar_barang"
#

/*!40000 ALTER TABLE `sar_barang` DISABLE KEYS */;
INSERT INTO `sar_barang` VALUES (1,0,0,1,1,'','',0,1,0,0,1,'',0),(2,0,0,1,1,'','',1,1,0,0,1,'',0),(3,0,0,2,1,'','',2,1,0,0,1,'',0),(4,0,0,2,1,'','',3,1,0,0,1,'',0),(5,0,0,3,1,'','',4,1,0,0,1,'',0),(6,0,0,3,1,'','',5,1,0,0,1,'',0),(7,0,0,4,1,'','',6,1,0,0,1,'',0),(8,0,0,4,1,'','',7,1,0,0,1,'',0),(9,0,0,5,1,'','',8,1,0,0,1,'',0),(10,0,0,5,1,'','',9,1,0,0,1,'',0),(11,0,0,4,2,'','',10,1,0,0,1,'',0),(12,0,0,4,2,'','',11,1,0,0,1,'',0),(13,0,0,4,3,'','',12,1,0,0,1,'',0),(14,0,0,4,3,'','',13,1,0,0,1,'',0),(15,0,0,5,2,'','',14,1,1,0,2,'',0),(16,0,0,5,3,'','',15,1,1,0,2,'',0),(17,0,0,1,2,'','',16,1,0,0,2,'',0),(18,0,0,1,2,'','',17,1,0,0,2,'',0),(19,0,0,1,3,'','',18,1,0,0,2,'',0),(20,0,0,1,3,'','',19,1,0,0,2,'',0),(21,0,0,3,2,'','',20,1,0,0,2,'',0),(22,0,0,3,2,'','',21,1,0,0,2,'',0),(23,0,0,3,3,'','',22,1,0,0,2,'',0),(24,0,0,3,3,'','',23,1,0,0,2,'',0),(25,0,0,2,2,'','',24,1,0,0,2,'',0),(26,0,0,2,2,'','',25,1,0,0,2,'',0),(27,0,0,2,3,'','',26,1,0,0,2,'',0),(28,0,0,2,3,'','',27,1,0,0,2,'',0),(29,0,0,6,2,'','',28,1,0,0,1,'',0);
/*!40000 ALTER TABLE `sar_barang` ENABLE KEYS */;

#
# Structure for table "sar_detailaktivitas"
#

DROP TABLE IF EXISTS `sar_detailaktivitas`;
CREATE TABLE `sar_detailaktivitas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `aktivitas` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL DEFAULT '1',
  `biaya` double(14,0) NOT NULL DEFAULT '0',
  `biaya2` double(14,0) NOT NULL DEFAULT '0',
  `tglbayar` date NOT NULL,
  `tgllunas` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "sar_detailaktivitas"
#


#
# Structure for table "sar_dftp"
#

DROP TABLE IF EXISTS `sar_dftp`;
CREATE TABLE `sar_dftp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "sar_dftp"
#

/*!40000 ALTER TABLE `sar_dftp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sar_dftp` ENABLE KEYS */;

#
# Structure for table "sar_distributor"
#

DROP TABLE IF EXISTS `sar_distributor`;
CREATE TABLE `sar_distributor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(250) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

#
# Data for table "sar_distributor"
#


#
# Structure for table "sar_dpeminjaman"
#

DROP TABLE IF EXISTS `sar_dpeminjaman`;
CREATE TABLE `sar_dpeminjaman` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `peminjaman` int(11) NOT NULL,
  `barang` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "sar_dpeminjaman"
#


#
# Structure for table "sar_grup"
#

DROP TABLE IF EXISTS `sar_grup`;
CREATE TABLE `sar_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "sar_grup"
#

/*!40000 ALTER TABLE `sar_grup` DISABLE KEYS */;
INSERT INTO `sar_grup` VALUES (1,'01','Furniture',1,'','2015-06-02 21:45:27'),(2,'02','Elektronik',1,'','2015-06-02 21:45:45'),(3,'03','IT',1,'','2015-06-02 21:46:02');
/*!40000 ALTER TABLE `sar_grup` ENABLE KEYS */;

#
# Structure for table "sar_jenis"
#

DROP TABLE IF EXISTS `sar_jenis`;
CREATE TABLE `sar_jenis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "sar_jenis"
#

/*!40000 ALTER TABLE `sar_jenis` DISABLE KEYS */;
INSERT INTO `sar_jenis` VALUES (1,'030','Habis pakai',''),(2,'020','Tidak habis pakai','');
/*!40000 ALTER TABLE `sar_jenis` ENABLE KEYS */;

#
# Structure for table "sar_katalog"
#

DROP TABLE IF EXISTS `sar_katalog`;
CREATE TABLE `sar_katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grup` int(10) unsigned NOT NULL,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT '0',
  `harga` decimal(10,0) NOT NULL DEFAULT '0',
  `susut` decimal(3,0) NOT NULL DEFAULT '0',
  `photo2` longtext,
  `photo` mediumblob NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "sar_katalog"
#

/*!40000 ALTER TABLE `sar_katalog` DISABLE KEYS */;
INSERT INTO `sar_katalog` VALUES (1,3,'IT','Monitor',2,0,0,NULL,X'',''),(2,3,'IT','CPU',2,0,0,NULL,X'',''),(3,3,'IT','KEYBOARD DAN MOUSE',2,0,0,NULL,X'',''),(4,2,'ELT','AC',2,0,0,NULL,X'',''),(5,2,'ELT','Speaker',2,0,0,NULL,X'',''),(6,1,'MJ','Meja',2,0,0,NULL,X'',''),(7,1,'KR','Kursi',2,0,0,NULL,X'',''),(8,1,'LM','Lemari',2,0,0,NULL,X'','');
/*!40000 ALTER TABLE `sar_katalog` ENABLE KEYS */;

#
# Structure for table "sar_kondisi"
#

DROP TABLE IF EXISTS `sar_kondisi`;
CREATE TABLE `sar_kondisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "sar_kondisi"
#

/*!40000 ALTER TABLE `sar_kondisi` DISABLE KEYS */;
INSERT INTO `sar_kondisi` VALUES (1,'Sangat baik','Baru'),(2,'Baik','Layak'),(3,'Buruk','Perlu perbaikan'),(4,'Sangat buruk','Tidak dapat digunakan');
/*!40000 ALTER TABLE `sar_kondisi` ENABLE KEYS */;

#
# Structure for table "sar_lokasi"
#

DROP TABLE IF EXISTS `sar_lokasi`;
CREATE TABLE `sar_lokasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penerbit_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

#
# Data for table "sar_lokasi"
#

INSERT INTO `sar_lokasi` VALUES (1,'001','Meta','Jl. Puncak Permai Utara, Surabaya 60187',NULL,'031 7342920','','2015-06-02 21:38:37');

#
# Structure for table "sar_peminjaman"
#

DROP TABLE IF EXISTS `sar_peminjaman`;
CREATE TABLE `sar_peminjaman` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi` int(10) unsigned NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `barang` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `lokasi_pinjam` int(10) unsigned NOT NULL,
  `lokasi_lain` varchar(250) NOT NULL,
  `tempat` varchar(200) NOT NULL,
  `kondisi` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "sar_peminjaman"
#

/*!40000 ALTER TABLE `sar_peminjaman` DISABLE KEYS */;
/*!40000 ALTER TABLE `sar_peminjaman` ENABLE KEYS */;

#
# Structure for table "sar_peminjaman2"
#

DROP TABLE IF EXISTS `sar_peminjaman2`;
CREATE TABLE `sar_peminjaman2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` int(11) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "sar_peminjaman2"
#


#
# Structure for table "sar_pengembalian"
#

DROP TABLE IF EXISTS `sar_pengembalian`;
CREATE TABLE `sar_pengembalian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peminjaman` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "sar_pengembalian"
#

/*!40000 ALTER TABLE `sar_pengembalian` DISABLE KEYS */;
/*!40000 ALTER TABLE `sar_pengembalian` ENABLE KEYS */;

#
# Structure for table "sar_produsen"
#

DROP TABLE IF EXISTS `sar_produsen`;
CREATE TABLE `sar_produsen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(250) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

#
# Data for table "sar_produsen"
#


#
# Structure for table "sar_tempat"
#

DROP TABLE IF EXISTS `sar_tempat`;
CREATE TABLE `sar_tempat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL DEFAULT '',
  `lokasi` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "sar_tempat"
#

/*!40000 ALTER TABLE `sar_tempat` DISABLE KEYS */;
INSERT INTO `sar_tempat` VALUES (2,'Lt.1 R.Guru',1,'R.Guru lt.1',''),(3,'Lt.2 R.Guru',1,'R.Guru lt.2','');
/*!40000 ALTER TABLE `sar_tempat` ENABLE KEYS */;

#
# Structure for table "sar_tmp"
#

DROP TABLE IF EXISTS `sar_tmp`;
CREATE TABLE `sar_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "sar_tmp"
#

/*!40000 ALTER TABLE `sar_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sar_tmp` ENABLE KEYS */;

#
# Structure for table "sensor"
#

DROP TABLE IF EXISTS `sensor`;
CREATE TABLE `sensor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "sensor"
#

/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;

#
# Structure for table "situs"
#

DROP TABLE IF EXISTS `situs`;
CREATE TABLE `situs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email_master` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `judul_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `slogan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `keywords` text COLLATE latin1_general_ci NOT NULL,
  `maxkonten` int(2) NOT NULL DEFAULT '5',
  `maxadmindata` int(2) NOT NULL DEFAULT '5',
  `maxdata` int(2) NOT NULL DEFAULT '5',
  `maxgalleri` int(2) NOT NULL DEFAULT '4',
  `widgetshare` int(2) NOT NULL DEFAULT '0',
  `theme` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'tcms',
  `author` text COLLATE latin1_general_ci NOT NULL,
  `alamatkantor` text COLLATE latin1_general_ci NOT NULL,
  `publishwebsite` int(1) NOT NULL DEFAULT '1',
  `publishnews` int(2) NOT NULL,
  `maxgalleridata` int(11) NOT NULL,
  `widgetkomentar` int(2) NOT NULL DEFAULT '1',
  `widgetpenulis` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

#
# Data for table "situs"
#

/*!40000 ALTER TABLE `situs` DISABLE KEYS */;
INSERT INTO `situs` VALUES (1,'rekysda@gmail.com','Sisfo HRD dan Penggajian','http://localhost/sistermeta/hrd','Sisfo HRD dan Penggajian','WebDesign dengan sistem Responsive','sisfohrd,surabaya,indonesia',5,50,5,4,3,'sisfohrd','SMK BHAKTI SAMUDERA','Surabaya',1,1,12,1,2);
/*!40000 ALTER TABLE `situs` ENABLE KEYS */;

#
# Structure for table "tbl_kalender"
#

DROP TABLE IF EXISTS `tbl_kalender`;
CREATE TABLE `tbl_kalender` (
  `judul` varchar(255) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `waktu_mulai` date NOT NULL DEFAULT '0000-00-00',
  `waktu_akhir` date NOT NULL DEFAULT '0000-00-00',
  `background` varchar(10) NOT NULL DEFAULT '#d1d1d1',
  `color` varchar(10) NOT NULL DEFAULT '',
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "tbl_kalender"
#

/*!40000 ALTER TABLE `tbl_kalender` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_kalender` ENABLE KEYS */;

#
# Structure for table "tmp_photo"
#

DROP TABLE IF EXISTS `tmp_photo`;
CREATE TABLE `tmp_photo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "tmp_photo"
#

/*!40000 ALTER TABLE `tmp_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_photo` ENABLE KEYS */;

#
# Structure for table "useraura"
#

DROP TABLE IF EXISTS `useraura`;
CREATE TABLE `useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Payroll','HRD') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Data for table "useraura"
#

/*!40000 ALTER TABLE `useraura` DISABLE KEYS */;
INSERT INTO `useraura` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','reky@teamworks.co.id','af0675a9e843c6c8f78163a9118efc78.jpg','Administrator','aktif',1,'2015-07-24 09:24:17','2010-08-27 00:00:00','2034-08-27 00:00:00','<p><b>none</b></p>'),(28,'superadmin','21232f297a57a5a743894a0e4a801fc3','reky@teamworks.co.id','','Administrator','aktif',1,'2015-03-21 23:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `useraura` ENABLE KEYS */;

#
# Structure for table "usercounter"
#

DROP TABLE IF EXISTS `usercounter`;
CREATE TABLE `usercounter` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "usercounter"
#

/*!40000 ALTER TABLE `usercounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercounter` ENABLE KEYS */;

#
# Structure for table "useronline"
#

DROP TABLE IF EXISTS `useronline`;
CREATE TABLE `useronline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "useronline"
#

/*!40000 ALTER TABLE `useronline` DISABLE KEYS */;
/*!40000 ALTER TABLE `useronline` ENABLE KEYS */;

#
# Structure for table "useronlineday"
#

DROP TABLE IF EXISTS `useronlineday`;
CREATE TABLE `useronlineday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "useronlineday"
#

/*!40000 ALTER TABLE `useronlineday` DISABLE KEYS */;
/*!40000 ALTER TABLE `useronlineday` ENABLE KEYS */;

#
# Structure for table "useronlinemonth"
#

DROP TABLE IF EXISTS `useronlinemonth`;
CREATE TABLE `useronlinemonth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "useronlinemonth"
#

/*!40000 ALTER TABLE `useronlinemonth` DISABLE KEYS */;
/*!40000 ALTER TABLE `useronlinemonth` ENABLE KEYS */;
