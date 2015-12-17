/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-12-17 08:49:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_anggarantahunan
-- ----------------------------
DROP TABLE IF EXISTS `keu_anggarantahunan`;
CREATE TABLE `keu_anggarantahunan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(11) NOT NULL,
  `hargasatuan` decimal(14,0) NOT NULL DEFAULT '0',
  `tahunajaran` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilanggaran` (`detilanggaran`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  CONSTRAINT `keu_anggarantahunan_ibfk_1` FOREIGN KEY (`detilanggaran`) REFERENCES `keu_detilanggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK4` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_anggarantahunan
-- ----------------------------
INSERT INTO `keu_anggarantahunan` VALUES ('9', '6', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('10', '6', '3000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('11', '6', '22000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('18', '9', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('19', '9', '18000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('20', '9', '20000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('21', '10', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('22', '10', '1000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('23', '10', '2000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('24', '11', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('25', '11', '6000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('26', '11', '4500', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('27', '12', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('28', '12', '2500', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('29', '12', '2000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('30', '13', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('31', '13', '120000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('32', '13', '110000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('33', '14', '4000000', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('34', '14', '400000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('35', '14', '500000', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('36', '15', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('37', '15', '4500000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('38', '15', '0', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('39', '16', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('40', '16', '200000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('41', '16', '0', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('42', '17', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('43', '17', '300000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('44', '17', '0', '12');
INSERT INTO `keu_anggarantahunan` VALUES ('45', '18', '0', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('46', '18', '15000000', '5');
INSERT INTO `keu_anggarantahunan` VALUES ('47', '18', '0', '12');
DROP TRIGGER IF EXISTS `ins_keu_anggarantahunan`;
DELIMITER ;;
CREATE TRIGGER `ins_keu_anggarantahunan` AFTER INSERT ON `keu_anggarantahunan` FOR EACH ROW BEGIN

declare i int DEFAULT 1;
	WHILE i <=12 DO
		INSERT INTO keu_nominalanggaran SET 
			anggarantahunan = NEW.replid, 
			bulan = i;
		SET i:=i+1;
    END WHILE;
END
;;
DELIMITER ;
