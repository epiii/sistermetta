# Host: localhost  (Version: 5.5.27)
# Date: 2015-12-15 15:47:44
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

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

INSERT INTO `departemen` VALUES (1,'Meta',0,1,'','','',X'','2015-06-02 13:47:54');
