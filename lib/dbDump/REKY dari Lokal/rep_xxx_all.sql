# Host: localhost  (Version: 5.5.27)
# Date: 2015-12-15 15:53:44
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

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
