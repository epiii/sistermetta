/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermeta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-23 05:37:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_kelas
-- ----------------------------
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

-- ----------------------------
-- Records of aka_kelas
-- ----------------------------
INSERT INTO `aka_kelas` VALUES ('1', 'K2', '1', '1', '3', '30', '2', '', '2015-06-05 15:41:20');
INSERT INTO `aka_kelas` VALUES ('2', 'K1', '1', '1', '3', '30', '1', null, '2015-06-23 05:35:29');
