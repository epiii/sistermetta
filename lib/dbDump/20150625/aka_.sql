/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermeta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-25 01:00:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_angkatan
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_angkatan
-- ----------------------------
INSERT INTO `aka_angkatan` VALUES ('1', '2015', '1', '1', 'angkatan tahun 2015', '2015-06-02 20:48:12');
INSERT INTO `aka_angkatan` VALUES ('17', '2014', '1', '1', '', '2015-06-23 23:01:44');
INSERT INTO `aka_angkatan` VALUES ('20', '2016', '1', '1', '', '2015-06-23 23:32:21');

-- ----------------------------
-- Table structure for aka_semester
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_semester
-- ----------------------------
INSERT INTO `aka_semester` VALUES ('2', '2', '1', '1', '2016-01-01', '2016-06-30');
INSERT INTO `aka_semester` VALUES ('18', '1', '1', '1', '2015-07-01', '2015-12-31');
INSERT INTO `aka_semester` VALUES ('19', '1', '2', '1', '2015-06-01', '2022-07-14');

-- ----------------------------
-- Table structure for aka_tahunajaran
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_tahunajaran
-- ----------------------------
INSERT INTO `aka_tahunajaran` VALUES ('1', '2015-2016', '1', '2015-07-01', '2016-06-30', '1', '', '2015-06-02 20:49:20');
