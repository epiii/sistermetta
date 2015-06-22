/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermeta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-23 05:37:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_siswa_kelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswa_kelas`;
CREATE TABLE `aka_siswa_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswa_kelas
-- ----------------------------
INSERT INTO `aka_siswa_kelas` VALUES ('1', '1', '1');
INSERT INTO `aka_siswa_kelas` VALUES ('2', '2', '1');
INSERT INTO `aka_siswa_kelas` VALUES ('3', '3', '2');
