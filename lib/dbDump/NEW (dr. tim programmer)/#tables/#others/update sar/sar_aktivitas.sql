/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-12-17 08:48:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sar_aktivitas
-- ----------------------------
DROP TABLE IF EXISTS `sar_aktivitas`;
CREATE TABLE `sar_aktivitas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `aktivitas` text,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgltagihan` date NOT NULL,
  `tglpelunasan` date NOT NULL,
  `anggarantahunan` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `anggarantahunan` (`anggarantahunan`) USING BTREE,
  CONSTRAINT `anggarantahunanFK2` FOREIGN KEY (`anggarantahunan`) REFERENCES `keu_anggarantahunan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_aktivitas
-- ----------------------------
INSERT INTO `sar_aktivitas` VALUES ('34', '2015-12-29', '2015-12-30', 'renovasi dapur 99', '1', 'renov dapur umum 9', '2015-12-17 05:45:55', '2015-12-17', '0000-00-00', '46');
