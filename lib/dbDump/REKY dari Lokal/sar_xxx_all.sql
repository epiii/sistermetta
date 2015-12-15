# Host: localhost  (Version: 5.5.27)
# Date: 2015-12-15 15:54:13
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

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
INSERT INTO `sar_grup` VALUES (1,'01','Furniture',1,'','2015-06-02 14:45:27'),(2,'02','Elektronik',1,'','2015-06-02 14:45:45'),(3,'03','IT',1,'','2015-06-02 14:46:02');
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

INSERT INTO `sar_lokasi` VALUES (1,'001','Meta','Jl. Puncak Permai Utara, Surabaya 60187',NULL,'031 7342920','','2015-06-02 14:38:37');

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
