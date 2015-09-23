# Host: localhost  (Version: 5.5.27)
# Date: 2015-07-12 23:04:01
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Data for table "psb_calonsiswa"
#

/*!40000 ALTER TABLE `psb_calonsiswa` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa` VALUES (25,'000001',NULL,'kk','','',0,0,NULL,1,0,'',4,1,2,0,4,0,0,'L','popopo','2015-07-15',NULL,0,0,NULL,0.0,0.0,'-','1_2cb2255866.jpeg','',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,1,38,0,'','',0,4),(28,'000004',NULL,'Darren Evan Tin','11','11111',0,0,NULL,1,0,'',1,4,3,0,0,1,0,'L','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(29,'000005',NULL,'Megan Davis Zheng','22','22222',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'P','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081330900123',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(30,'000006',NULL,'Justin Ong','0','0',0,0,NULL,1,0,'',1,4,3,0,2,0,0,'L','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081 23256838',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(31,'000007',NULL,'Jordyn Edward Motanto','','',0,0,NULL,1,0,'',1,4,3,0,0,0,0,'L','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081 8307043',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(32,'000008',NULL,'Lunabelle Veloxia Taslim','55','55555',0,0,NULL,1,0,'',1,4,3,0,0,1,0,'P','','0000-00-00',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'081 331685888',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(33,'000009',NULL,'epi','99','99999',0,0,NULL,1,0,'',1,1,3,0,0,1,0,'L','sby','2015-07-24',NULL,0,0,NULL,0.0,0.0,'-',NULL,'',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,15,0,'','',0,3);
/*!40000 ALTER TABLE `psb_calonsiswa` ENABLE KEYS */;
