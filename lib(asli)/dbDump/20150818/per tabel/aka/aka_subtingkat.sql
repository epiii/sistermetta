/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-18 21:45:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_subtingkat
-- ----------------------------
DROP TABLE IF EXISTS `aka_subtingkat`;
CREATE TABLE `aka_subtingkat` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `subtingkat` varchar(100) NOT NULL,
  `tingkat` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_subtingkat
-- ----------------------------
INSERT INTO `aka_subtingkat` VALUES ('1', '1', '3');
INSERT INTO `aka_subtingkat` VALUES ('2', '1', '2');
INSERT INTO `aka_subtingkat` VALUES ('3', '1', '1');
