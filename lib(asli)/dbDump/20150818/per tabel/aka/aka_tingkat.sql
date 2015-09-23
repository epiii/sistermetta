/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-18 21:45:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_tingkat
-- ----------------------------
DROP TABLE IF EXISTS `aka_tingkat`;
CREATE TABLE `aka_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(10) NOT NULL DEFAULT '',
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_tingkat_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_tingkat
-- ----------------------------
INSERT INTO `aka_tingkat` VALUES ('1', 'Toddler', '1', 'Toddler', '1', '2015-06-02 20:52:51');
INSERT INTO `aka_tingkat` VALUES ('2', 'Playgroup', '1', '', '2', '2015-06-02 20:53:05');
INSERT INTO `aka_tingkat` VALUES ('3', 'Kindergard', '1', '', '3', '2015-06-02 20:53:30');
