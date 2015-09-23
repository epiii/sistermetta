/*
Navicat MySQL Data Transfer

Source Server         : locale
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-07-25 10:04:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_setbiaya
-- ----------------------------
DROP TABLE IF EXISTS `psb_setbiaya`;
CREATE TABLE `psb_setbiaya` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuition` decimal(10,0) NOT NULL DEFAULT '0',
  `registration` decimal(10,0) NOT NULL DEFAULT '0',
  `material` decimal(10,0) NOT NULL,
  `ting` int(10) unsigned NOT NULL DEFAULT '0',
  `gol` int(10) unsigned NOT NULL DEFAULT '0',
  `kel` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_setbiaya
-- ----------------------------
INSERT INTO `psb_setbiaya` VALUES ('1', '1000000', '15000000', '500000', '1', '1', '1');
INSERT INTO `psb_setbiaya` VALUES ('2', '1000000', '10000000', '500000', '1', '2', '1');
INSERT INTO `psb_setbiaya` VALUES ('3', '1000000', '20000000', '500000', '1', '3', '1');
INSERT INTO `psb_setbiaya` VALUES ('4', '0', '0', '8000000', '2', '1', '1');
INSERT INTO `psb_setbiaya` VALUES ('5', '0', '0', '0', '2', '2', '1');
INSERT INTO `psb_setbiaya` VALUES ('6', '0', '0', '0', '2', '3', '1');
INSERT INTO `psb_setbiaya` VALUES ('7', '0', '0', '0', '3', '1', '1');
INSERT INTO `psb_setbiaya` VALUES ('8', '0', '0', '0', '3', '2', '1');
INSERT INTO `psb_setbiaya` VALUES ('9', '0', '0', '0', '3', '3', '1');
INSERT INTO `psb_setbiaya` VALUES ('10', '800000', '10000000', '500000', '4', '1', '1');
INSERT INTO `psb_setbiaya` VALUES ('11', '800000', '10000000', '500000', '4', '2', '1');
INSERT INTO `psb_setbiaya` VALUES ('12', '800000', '10000000', '500000', '4', '3', '1');
INSERT INTO `psb_setbiaya` VALUES ('13', '4500000', '15000000', '2500000', '1', '1', '2');
INSERT INTO `psb_setbiaya` VALUES ('14', '800000', '35000000', '7000000', '1', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('15', '7000000', '6000000', '8000000', '1', '3', '2');
INSERT INTO `psb_setbiaya` VALUES ('16', '2500000', '5500000', '1500000', '2', '1', '2');
INSERT INTO `psb_setbiaya` VALUES ('17', '15000000', '25000000', '3500000', '2', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('18', '15000000', '25000000', '5500000', '2', '3', '2');
INSERT INTO `psb_setbiaya` VALUES ('19', '1500000', '3500000', '1700000', '3', '1', '2');
INSERT INTO `psb_setbiaya` VALUES ('20', '0', '0', '0', '3', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('21', '0', '0', '0', '3', '3', '2');
INSERT INTO `psb_setbiaya` VALUES ('22', '0', '0', '0', '4', '1', '2');
INSERT INTO `psb_setbiaya` VALUES ('23', '0', '0', '0', '4', '2', '2');
INSERT INTO `psb_setbiaya` VALUES ('24', '0', '0', '0', '4', '3', '2');
INSERT INTO `psb_setbiaya` VALUES ('25', '1000000', '15000000', '500000', '1', '1', '3');
INSERT INTO `psb_setbiaya` VALUES ('26', '1000000', '10000000', '500000', '1', '2', '3');
INSERT INTO `psb_setbiaya` VALUES ('27', '1000000', '20000000', '500000', '1', '3', '3');
INSERT INTO `psb_setbiaya` VALUES ('28', '8000000', '85000000', '90000', '2', '1', '3');
INSERT INTO `psb_setbiaya` VALUES ('29', '7000000', '0', '0', '2', '2', '3');
INSERT INTO `psb_setbiaya` VALUES ('30', '0', '0', '0', '2', '3', '3');
INSERT INTO `psb_setbiaya` VALUES ('31', '0', '0', '0', '3', '1', '3');
INSERT INTO `psb_setbiaya` VALUES ('32', '0', '0', '0', '3', '2', '3');
INSERT INTO `psb_setbiaya` VALUES ('33', '0', '0', '0', '3', '3', '3');
INSERT INTO `psb_setbiaya` VALUES ('34', '0', '0', '0', '4', '1', '3');
INSERT INTO `psb_setbiaya` VALUES ('35', '0', '0', '0', '4', '2', '3');
INSERT INTO `psb_setbiaya` VALUES ('36', '0', '0', '0', '4', '3', '3');
INSERT INTO `psb_setbiaya` VALUES ('37', '0', '0', '0', '1', '1', '4');
INSERT INTO `psb_setbiaya` VALUES ('38', '2000000', '45000000', '5500000', '1', '2', '4');
INSERT INTO `psb_setbiaya` VALUES ('39', '0', '0', '0', '1', '3', '4');
INSERT INTO `psb_setbiaya` VALUES ('40', '0', '0', '0', '2', '1', '4');
INSERT INTO `psb_setbiaya` VALUES ('41', '0', '0', '0', '2', '2', '4');
INSERT INTO `psb_setbiaya` VALUES ('42', '0', '0', '0', '2', '3', '4');
INSERT INTO `psb_setbiaya` VALUES ('43', '0', '0', '0', '3', '1', '4');
INSERT INTO `psb_setbiaya` VALUES ('44', '0', '0', '0', '3', '2', '4');
INSERT INTO `psb_setbiaya` VALUES ('45', '0', '0', '0', '3', '3', '4');
INSERT INTO `psb_setbiaya` VALUES ('46', '0', '0', '0', '4', '1', '4');
INSERT INTO `psb_setbiaya` VALUES ('47', '0', '0', '0', '4', '2', '4');
INSERT INTO `psb_setbiaya` VALUES ('48', '0', '0', '0', '4', '3', '4');
