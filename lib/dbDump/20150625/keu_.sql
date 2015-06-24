/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermeta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-25 01:01:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_katmodulpembayaran
-- ----------------------------
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

-- ----------------------------
-- Records of keu_katmodulpembayaran
-- ----------------------------
INSERT INTO `keu_katmodulpembayaran` VALUES ('1', 'Tuition Fee', 'aktif', 'wajib', 'uang per semester (spp)', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('2', 'Registration', 'aktif', 'wajib', 'uang pendaftaran (uang gedung)', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('3', 'Material Fee', 'aktif', 'wajib', 'material fee', '1');

-- ----------------------------
-- Table structure for keu_modulpembayaran
-- ----------------------------
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

-- ----------------------------
-- Records of keu_modulpembayaran
-- ----------------------------
INSERT INTO `keu_modulpembayaran` VALUES ('41', '2', '1', '0', '0', 'Registration Angkatan 2015', '1', '194', '22', 'keterangan ');
INSERT INTO `keu_modulpembayaran` VALUES ('42', '3', '1', '18', '0', 'Material Fee Semester 1 Th. Ajaran 2015-2016', '1', '203', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('45', '3', '1', '2', '0', 'Material Fee Semester 2 Th. Ajaran 2015-2016', '1', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('44', '1', '1', '18', '7', 'Tuition Fee Semester 1 th. Ajaran 2015-2016', '1', '0', '0', '');

-- ----------------------------
-- Table structure for keu_pembayaran
-- ----------------------------
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

-- ----------------------------
-- Records of keu_pembayaran
-- ----------------------------
