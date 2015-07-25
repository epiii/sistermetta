/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-25 16:36:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_detailpelajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_detailpelajaran`;
CREATE TABLE `aka_detailpelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `pelajaran` int(11) NOT NULL,
  `subtingkat` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `subtingkat` (`subtingkat`),
  KEY `pelajaran` (`pelajaran`),
  CONSTRAINT `aka_detailpelajaran_ibfk_1` FOREIGN KEY (`pelajaran`) REFERENCES `aka_pelajaran` (`replid`),
  CONSTRAINT `aka_detailpelajaran_ibfk_2` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_detailpelajaran
-- ----------------------------
INSERT INTO `aka_detailpelajaran` VALUES ('16', '38', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('18', '37', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('19', '39', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('20', '40', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('26', '36', '2', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('27', '41', '1', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('28', '42', '1', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('29', '43', '1', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('30', '35', '2', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('31', '39', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('32', '37', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('33', '40', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('34', '38', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('35', '35', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('36', '36', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('37', '18', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('38', '24', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('39', '23', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('40', '28', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('41', '25', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('42', '27', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('43', '26', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('44', '44', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('45', '27', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('46', '23', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('47', '18', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('48', '24', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('49', '28', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('50', '29', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('51', '25', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('52', '26', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('53', '44', '6', '1');
