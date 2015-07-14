/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-13 16:43:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_kelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_kelas`;
CREATE TABLE `aka_kelas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` varchar(100) NOT NULL,
  `departemen` int(11) NOT NULL,
  `subtingkat` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `subtingkat` (`subtingkat`),
  KEY `departemen` (`departemen`) USING BTREE,
  KEY `departemen_2` (`departemen`),
  CONSTRAINT `aka_kelas_ibfk_1` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_kelas
-- ----------------------------
INSERT INTO `aka_kelas` VALUES ('1', 'A', '1', '1', '-', '2015-07-13 14:23:06');
INSERT INTO `aka_kelas` VALUES ('2', 'B', '1', '1', '', '2015-07-13 14:23:20');
INSERT INTO `aka_kelas` VALUES ('3', 'A', '1', '2', '', '2015-07-13 14:23:51');
INSERT INTO `aka_kelas` VALUES ('4', 'B', '1', '2', '', '2015-07-13 14:23:58');
INSERT INTO `aka_kelas` VALUES ('5', 'A', '1', '3', '', '2015-07-13 14:24:20');
INSERT INTO `aka_kelas` VALUES ('6', 'B', '1', '3', '', '2015-07-13 14:24:28');
INSERT INTO `aka_kelas` VALUES ('7', 'A', '1', '4', '', '2015-07-13 14:24:46');
INSERT INTO `aka_kelas` VALUES ('8', 'B', '1', '4', '', '2015-07-13 14:25:11');
INSERT INTO `aka_kelas` VALUES ('9', 'A', '1', '5', '', '2015-07-13 14:25:30');
INSERT INTO `aka_kelas` VALUES ('10', 'B', '1', '5', '', '2015-07-13 14:25:37');
INSERT INTO `aka_kelas` VALUES ('11', 'A', '1', '6', '', '2015-07-13 14:25:47');
INSERT INTO `aka_kelas` VALUES ('12', 'B', '1', '6', '', '2015-07-13 14:25:58');
INSERT INTO `aka_kelas` VALUES ('13', 'A', '1', '7', '', '2015-07-13 14:26:05');
INSERT INTO `aka_kelas` VALUES ('14', 'B', '1', '7', '', '2015-07-13 14:26:19');
INSERT INTO `aka_kelas` VALUES ('15', 'A', '1', '8', '', '2015-07-13 14:26:27');
INSERT INTO `aka_kelas` VALUES ('16', 'B', '1', '8', '', '2015-07-13 14:26:35');
INSERT INTO `aka_kelas` VALUES ('17', 'A', '1', '9', '', '2015-07-13 14:26:46');
INSERT INTO `aka_kelas` VALUES ('18', 'B', '1', '9', '', '2015-07-13 14:26:54');
INSERT INTO `aka_kelas` VALUES ('19', 'A', '1', '10', '', '2015-07-13 14:27:02');
INSERT INTO `aka_kelas` VALUES ('20', 'B', '1', '10', '', '2015-07-13 14:27:10');
