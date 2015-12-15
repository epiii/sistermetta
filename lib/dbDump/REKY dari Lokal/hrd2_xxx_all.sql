# Host: localhost  (Version: 5.5.27)
# Date: 2015-12-15 15:54:40
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

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
INSERT INTO `useraura` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','reky@teamworks.co.id','af0675a9e843c6c8f78163a9118efc78.jpg','Administrator','aktif',0,'2015-09-10 08:55:57','2010-08-27 00:00:00','2034-08-27 00:00:00','<p><b>none</b></p>'),(28,'superadmin','21232f297a57a5a743894a0e4a801fc3','reky@teamworks.co.id','','Administrator','aktif',1,'2015-03-21 23:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00','');
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
