/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-12-18 07:54:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_agama
-- ----------------------------
DROP TABLE IF EXISTS `psb_agama`;
CREATE TABLE `psb_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_agama
-- ----------------------------
INSERT INTO `psb_agama` VALUES ('5', 'Budha', '5');
INSERT INTO `psb_agama` VALUES ('4', 'Hindu', '4');
INSERT INTO `psb_agama` VALUES ('1', 'Islam', '1');
INSERT INTO `psb_agama` VALUES ('3', 'Katholik', '3');
INSERT INTO `psb_agama` VALUES ('2', 'Protestan', '2');

-- ----------------------------
-- Table structure for psb_angsuran
-- ----------------------------
DROP TABLE IF EXISTS `psb_angsuran`;
CREATE TABLE `psb_angsuran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cicilan` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `diskon` float(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`replid`,`cicilan`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_angsuran
-- ----------------------------
INSERT INTO `psb_angsuran` VALUES ('1', '1', 'in house pertama', '15.00');
INSERT INTO `psb_angsuran` VALUES ('2', '2', 'in house kedua', '12.00');
INSERT INTO `psb_angsuran` VALUES ('3', '3', 'in house ketiga', '10.00');
INSERT INTO `psb_angsuran` VALUES ('4', '4', 'in house keempat', '8.00');
INSERT INTO `psb_angsuran` VALUES ('5', '5', 'in house kelima', '6.00');
INSERT INTO `psb_angsuran` VALUES ('6', '6', 'in house keenam', '4.00');
INSERT INTO `psb_angsuran` VALUES ('7', '7', 'in house ketujuh', '2.00');
INSERT INTO `psb_angsuran` VALUES ('8', '8', 'in house kedelapan', '1.00');
INSERT INTO `psb_angsuran` VALUES ('9', '9', 'in house kesembilan', '0.00');
INSERT INTO `psb_angsuran` VALUES ('10', '10', 'in house kesepuluh', '0.00');
INSERT INTO `psb_angsuran` VALUES ('11', '11', 'in house kesebelas', '0.00');
INSERT INTO `psb_angsuran` VALUES ('12', '12', 'in house keduabelas', '0.00');

-- ----------------------------
-- Table structure for psb_biaya
-- ----------------------------
DROP TABLE IF EXISTS `psb_biaya`;
CREATE TABLE `psb_biaya` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `biaya` varchar(100) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `isAngsur` int(1) NOT NULL DEFAULT '1',
  `isDiskon` int(1) NOT NULL DEFAULT '0',
  `ditagih` enum('0','1','2','12') DEFAULT '0' COMMENT '0=sekali, 1=tiap_tahun, 2=tiap_semester, 12=tiap_bulan',
  `keterangan` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_biaya
-- ----------------------------
INSERT INTO `psb_biaya` VALUES ('4', 'Enrollment Fee', 'dpp', '1', '3', '0', 'Uang Gedung');
INSERT INTO `psb_biaya` VALUES ('7', 'Tuition Fee', 'spp', '0', '3', '12', 'sumbangan per bulan ');
INSERT INTO `psb_biaya` VALUES ('8', 'Material Fee', 'joining_fee', '1', '3', '2', 'biaya yg dibayar sekali saat masuk');

-- ----------------------------
-- Table structure for psb_biaya_copy
-- ----------------------------
DROP TABLE IF EXISTS `psb_biaya_copy`;
CREATE TABLE `psb_biaya_copy` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `biaya` varchar(100) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `isAngsur` int(1) NOT NULL DEFAULT '1',
  `isDiskon` int(1) NOT NULL DEFAULT '0',
  `jenistagihan` int(11) NOT NULL,
  `keterangan` text,
  PRIMARY KEY (`replid`),
  KEY `jenistagihan` (`jenistagihan`) USING BTREE,
  CONSTRAINT `psb_biaya_copy_ibfk_1` FOREIGN KEY (`jenistagihan`) REFERENCES `psb_jenistagihan` (`replid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_biaya_copy
-- ----------------------------
INSERT INTO `psb_biaya_copy` VALUES ('3', 'Formulir', 'formulir', '0', '0', '1', 'Formulr Pendafataran');
INSERT INTO `psb_biaya_copy` VALUES ('4', 'DPP', 'dpp', '1', '3', '4', 'Uang Gedung');
INSERT INTO `psb_biaya_copy` VALUES ('7', 'SPP', 'spp', '0', '3', '4', 'sumbangan per bulan ');
INSERT INTO `psb_biaya_copy` VALUES ('8', 'Joining Fee', 'joining_fee', '2', '3', '1', 'biaya yg dibayar sekali saat masuk');

-- ----------------------------
-- Table structure for psb_detailbiaya
-- ----------------------------
DROP TABLE IF EXISTS `psb_detailbiaya`;
CREATE TABLE `psb_detailbiaya` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `biaya` int(11) NOT NULL,
  `nominal` decimal(14,0) NOT NULL,
  `subtingkat` int(11) NOT NULL DEFAULT '0',
  `golongan` int(11) NOT NULL DEFAULT '0',
  `detailgelombang` int(11) NOT NULL DEFAULT '0',
  `detilrekening` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detailgelombang` (`detailgelombang`) USING BTREE,
  KEY `golongan` (`golongan`) USING BTREE,
  KEY `subtingkat` (`subtingkat`) USING BTREE,
  KEY `biaya` (`biaya`) USING BTREE,
  CONSTRAINT `biayaFK` FOREIGN KEY (`biaya`) REFERENCES `psb_biaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailgelombangFK4` FOREIGN KEY (`detailgelombang`) REFERENCES `psb_detailgelombang` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `golonganFK2` FOREIGN KEY (`golongan`) REFERENCES `psb_golongan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subtingkatFK2` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6594 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_detailbiaya
-- ----------------------------
INSERT INTO `psb_detailbiaya` VALUES ('11', '7', '0', '4', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('20', '8', '0', '4', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('29', '4', '0', '4', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('47', '7', '0', '5', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('56', '8', '0', '5', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('65', '4', '0', '5', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('83', '7', '0', '6', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('92', '8', '0', '6', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('101', '4', '0', '6', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('119', '7', '0', '7', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('128', '8', '0', '7', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('137', '4', '0', '7', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('155', '7', '0', '8', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('164', '8', '0', '8', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('173', '4', '0', '8', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('191', '7', '0', '9', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('200', '8', '0', '9', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('209', '4', '0', '9', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('227', '7', '0', '10', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('236', '8', '0', '10', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('245', '4', '0', '10', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('263', '7', '0', '11', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('272', '8', '0', '11', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('281', '4', '0', '11', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('299', '7', '0', '12', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('308', '8', '0', '12', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('317', '4', '0', '12', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('335', '7', '0', '13', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('344', '8', '0', '13', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('353', '4', '0', '13', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('371', '7', '0', '14', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('380', '8', '0', '14', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('389', '4', '0', '14', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('407', '7', '0', '15', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('416', '8', '0', '15', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('425', '4', '0', '15', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('443', '7', '0', '16', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('452', '8', '0', '16', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('461', '4', '0', '16', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('479', '7', '0', '17', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('488', '8', '0', '17', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('497', '4', '0', '17', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('515', '7', '0', '18', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('524', '8', '0', '18', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('533', '4', '0', '18', '2', '97', '0');
INSERT INTO `psb_detailbiaya` VALUES ('659', '7', '500000', '4', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('668', '8', '1750000', '4', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('677', '4', '14000000', '4', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('695', '7', '1100000', '5', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('704', '8', '1750000', '5', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('713', '4', '16000000', '5', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('731', '7', '1200000', '6', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('740', '8', '1750000', '6', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('749', '4', '8000000', '6', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('767', '7', '1500000', '7', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('776', '8', '1750000', '7', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('785', '4', '17000000', '7', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('803', '7', '1500000', '8', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('812', '8', '1750000', '8', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('821', '4', '9000000', '8', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('839', '7', '1925000', '9', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('848', '8', '1750000', '9', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('857', '4', '41500000', '9', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('875', '7', '1925000', '10', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('884', '8', '1750000', '10', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('893', '4', '0', '10', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('911', '7', '1925000', '11', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('920', '8', '1750000', '11', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('929', '4', '0', '11', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('947', '7', '2075000', '12', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('956', '8', '1750000', '12', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('965', '4', '0', '12', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('983', '7', '2075000', '13', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('992', '8', '1750000', '13', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1001', '4', '0', '13', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1019', '7', '2200000', '14', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1028', '8', '1750000', '14', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1037', '4', '0', '14', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1055', '7', '2750000', '15', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1064', '8', '1750000', '15', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1073', '4', '36000000', '15', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1091', '7', '2850000', '16', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1100', '8', '1750000', '16', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1109', '4', '0', '16', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1127', '7', '2950000', '17', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1136', '8', '1750000', '17', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1145', '4', '0', '17', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1163', '7', '2950000', '18', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1172', '8', '1750000', '18', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('1181', '4', '33000000', '18', '2', '98', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2387', '7', '0', '4', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2396', '8', '0', '4', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2405', '4', '0', '4', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2423', '7', '0', '5', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2432', '8', '0', '5', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2441', '4', '0', '5', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2459', '7', '0', '6', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2468', '8', '0', '6', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2477', '4', '0', '6', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2495', '7', '0', '7', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2504', '8', '0', '7', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2513', '4', '0', '7', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2531', '7', '0', '8', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2540', '8', '0', '8', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2549', '4', '0', '8', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2567', '7', '0', '9', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2576', '8', '0', '9', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2585', '4', '0', '9', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2603', '7', '0', '10', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2612', '8', '0', '10', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2621', '4', '0', '10', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2639', '7', '0', '11', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2648', '8', '0', '11', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2657', '4', '0', '11', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2675', '7', '0', '12', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2684', '8', '0', '12', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2693', '4', '0', '12', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2711', '7', '0', '13', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2720', '8', '0', '13', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2729', '4', '0', '13', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2747', '7', '0', '14', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2756', '8', '0', '14', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2765', '4', '0', '14', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2783', '7', '0', '15', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2792', '8', '0', '15', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2801', '4', '0', '15', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2819', '7', '0', '16', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2828', '8', '0', '16', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2837', '4', '0', '16', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2855', '7', '0', '17', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2864', '8', '0', '17', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2873', '4', '0', '17', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2891', '7', '0', '18', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2900', '8', '0', '18', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('2909', '4', '0', '18', '2', '103', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3035', '7', '0', '4', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3044', '8', '0', '4', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3053', '4', '0', '4', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3071', '7', '0', '5', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3080', '8', '0', '5', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3089', '4', '0', '5', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3107', '7', '0', '6', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3116', '8', '0', '6', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3125', '4', '0', '6', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3143', '7', '0', '7', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3152', '8', '0', '7', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3161', '4', '0', '7', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3179', '7', '0', '8', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3188', '8', '0', '8', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3197', '4', '0', '8', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3215', '7', '0', '9', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3224', '8', '0', '9', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3233', '4', '0', '9', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3251', '7', '0', '10', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3260', '8', '0', '10', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3269', '4', '0', '10', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3287', '7', '0', '11', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3296', '8', '0', '11', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3305', '4', '0', '11', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3323', '7', '0', '12', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3332', '8', '0', '12', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3341', '4', '0', '12', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3359', '7', '0', '13', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3368', '8', '0', '13', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3377', '4', '0', '13', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3395', '7', '0', '14', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3404', '8', '0', '14', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3413', '4', '0', '14', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3431', '7', '0', '15', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3440', '8', '0', '15', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3449', '4', '0', '15', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3467', '7', '0', '16', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3476', '8', '0', '16', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3485', '4', '0', '16', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3503', '7', '0', '17', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3512', '8', '0', '17', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3521', '4', '0', '17', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3539', '7', '0', '18', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3548', '8', '0', '18', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('3557', '4', '0', '18', '2', '104', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6331', '8', '2000000', '4', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6332', '4', '16500000', '4', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6333', '7', '600000', '4', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6335', '8', '2000000', '5', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6336', '4', '16500000', '5', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6337', '7', '1200000', '5', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6339', '8', '2000000', '6', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6340', '4', '9000000', '6', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6341', '7', '1350000', '6', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6343', '8', '2000000', '7', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6344', '4', '18500000', '7', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6345', '7', '1700000', '7', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6347', '8', '2000000', '8', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6348', '4', '9500000', '8', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6349', '7', '1700000', '8', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6351', '8', '2000000', '9', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6352', '4', '45000000', '9', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6353', '7', '2150000', '9', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6355', '8', '2000000', '10', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6356', '4', '37500000', '10', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6357', '7', '2150000', '10', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6359', '8', '2000000', '11', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6360', '4', '30000000', '11', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6361', '7', '2150000', '11', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6363', '8', '2000000', '12', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6364', '4', '22500000', '12', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6365', '7', '2250000', '12', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6367', '8', '2000000', '13', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6368', '4', '15000000', '13', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6369', '7', '2300000', '13', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6371', '8', '2000000', '14', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6372', '4', '7500000', '14', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6373', '7', '2450000', '14', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6375', '8', '2000000', '15', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6376', '4', '40000000', '15', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6377', '7', '2950000', '15', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6379', '8', '2000000', '16', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6380', '4', '30000000', '16', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6381', '7', '3200000', '16', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6383', '8', '2000000', '17', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6384', '4', '20000000', '17', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6385', '7', '3450000', '17', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6387', '8', '2000000', '18', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6388', '4', '36000000', '18', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6389', '7', '3450000', '18', '2', '145', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6463', '8', '0', '4', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6464', '4', '0', '4', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6465', '7', '0', '4', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6467', '8', '2000000', '5', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6468', '4', '16500000', '5', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6469', '7', '1200000', '5', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6471', '8', '2000000', '6', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6472', '4', '9000000', '6', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6473', '7', '1350000', '6', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6475', '8', '0', '7', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6476', '4', '0', '7', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6477', '7', '0', '7', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6479', '8', '0', '8', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6480', '4', '0', '8', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6481', '7', '0', '8', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6483', '8', '0', '9', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6484', '4', '0', '9', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6485', '7', '0', '9', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6487', '8', '0', '10', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6488', '4', '0', '10', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6489', '7', '0', '10', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6491', '8', '0', '11', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6492', '4', '0', '11', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6493', '7', '0', '11', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6495', '8', '0', '12', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6496', '4', '0', '12', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6497', '7', '0', '12', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6499', '8', '0', '13', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6500', '4', '0', '13', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6501', '7', '0', '13', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6503', '8', '0', '14', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6504', '4', '0', '14', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6505', '7', '0', '14', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6507', '8', '0', '15', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6508', '4', '0', '15', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6509', '7', '0', '15', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6511', '8', '0', '16', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6512', '4', '0', '16', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6513', '7', '0', '16', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6515', '8', '0', '17', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6516', '4', '0', '17', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6517', '7', '0', '17', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6519', '8', '0', '18', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6520', '4', '0', '18', '2', '148', '0');
INSERT INTO `psb_detailbiaya` VALUES ('6521', '7', '0', '18', '2', '148', '0');

-- ----------------------------
-- Table structure for psb_detaildiskon
-- ----------------------------
DROP TABLE IF EXISTS `psb_detaildiskon`;
CREATE TABLE `psb_detaildiskon` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `diskon` int(11) NOT NULL DEFAULT '0',
  `nilai` float(5,0) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `isAktif` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `diskon` (`diskon`) USING BTREE,
  CONSTRAINT `diskonFK` FOREIGN KEY (`diskon`) REFERENCES `psb_diskon` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_detaildiskon
-- ----------------------------
INSERT INTO `psb_detaildiskon` VALUES ('433', '177', '5', '3', '1');
INSERT INTO `psb_detaildiskon` VALUES ('434', '177', '5', '5', '1');
INSERT INTO `psb_detaildiskon` VALUES ('435', '177', '5', '12', '1');

-- ----------------------------
-- Table structure for psb_detailgelombang
-- ----------------------------
DROP TABLE IF EXISTS `psb_detailgelombang`;
CREATE TABLE `psb_detailgelombang` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `gelombang` int(11) NOT NULL,
  `departemen` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `gelombang` (`gelombang`) USING BTREE,
  KEY `departemen` (`departemen`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `tahunajaran_2` (`tahunajaran`),
  KEY `departemen_2` (`departemen`),
  CONSTRAINT `departemenFK` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gelombangFK` FOREIGN KEY (`gelombang`) REFERENCES `psb_gelombang` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK3` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_detailgelombang
-- ----------------------------
INSERT INTO `psb_detailgelombang` VALUES ('97', '1', '1', '3', '0000-00-00', '0000-00-00', '2015-09-02 06:00:59');
INSERT INTO `psb_detailgelombang` VALUES ('98', '1', '1', '5', '0000-00-00', '0000-00-00', '2015-09-02 06:00:59');
INSERT INTO `psb_detailgelombang` VALUES ('103', '2', '1', '3', '0000-00-00', '0000-00-00', '2015-09-02 06:14:20');
INSERT INTO `psb_detailgelombang` VALUES ('104', '2', '1', '5', '0000-00-00', '0000-00-00', '2015-09-02 06:14:20');
INSERT INTO `psb_detailgelombang` VALUES ('145', '1', '1', '12', '0000-00-00', '0000-00-00', '2015-09-17 05:03:41');
INSERT INTO `psb_detailgelombang` VALUES ('148', '2', '1', '12', '0000-00-00', '0000-00-00', '2015-09-17 05:03:41');

-- ----------------------------
-- Table structure for psb_disctunai
-- ----------------------------
DROP TABLE IF EXISTS `psb_disctunai`;
CREATE TABLE `psb_disctunai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT '',
  `nilai` decimal(10,0) unsigned NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`,`nilai`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_disctunai
-- ----------------------------
INSERT INTO `psb_disctunai` VALUES ('1', 'diskon xxx', '10', 'diskon untuk xx');

-- ----------------------------
-- Table structure for psb_diskon
-- ----------------------------
DROP TABLE IF EXISTS `psb_diskon`;
CREATE TABLE `psb_diskon` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `departemen` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `diskon` varchar(50) NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `departemen` (`departemen`) USING BTREE,
  KEY `biaya` (`biaya`) USING BTREE,
  CONSTRAINT `biayaFK4` FOREIGN KEY (`biaya`) REFERENCES `psb_biaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `departemenFK3` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_diskon
-- ----------------------------
INSERT INTO `psb_diskon` VALUES ('177', '1', '4', 'Paket Tod - KG ', 'diskon untuk paket toddler s/d kindergarten');

-- ----------------------------
-- Table structure for psb_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `psb_dokumen`;
CREATE TABLE `psb_dokumen` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `dokumen` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_dokumen
-- ----------------------------
INSERT INTO `psb_dokumen` VALUES ('11', 'Fotokopi Kartu Keluarga (KK) ortu');
INSERT INTO `psb_dokumen` VALUES ('12', 'Fotokopi KTP (ayah/ibu)');
INSERT INTO `psb_dokumen` VALUES ('13', 'Copy Rapor :\r\n- Calon KG-A -&gt; PG (jika ada)\r\n- Calon KG-B -&gt; KG-A\r\n- Calon Primary 1 -&gt; KG ');
INSERT INTO `psb_dokumen` VALUES ('14', 'Rapor asli bagi siswa mutasi ');

-- ----------------------------
-- Table structure for psb_gelombang
-- ----------------------------
DROP TABLE IF EXISTS `psb_gelombang`;
CREATE TABLE `psb_gelombang` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `gelombang` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `urutan` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_gelombang
-- ----------------------------
INSERT INTO `psb_gelombang` VALUES ('1', 'First Intake', 'gelombang pendaftaran pertama ', '1', '2015-09-02 06:00:59');
INSERT INTO `psb_gelombang` VALUES ('2', 'Second Intake', 'gelombang pendaftaran kedua', '2', '2015-09-02 06:14:20');

-- ----------------------------
-- Table structure for psb_golongan
-- ----------------------------
DROP TABLE IF EXISTS `psb_golongan`;
CREATE TABLE `psb_golongan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `golongan` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urutan` int(10) unsigned DEFAULT '1',
  UNIQUE KEY `replid` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_golongan
-- ----------------------------
INSERT INTO `psb_golongan` VALUES ('2', 'Umum', 'Masyarakat umum', '2');

-- ----------------------------
-- Table structure for psb_jenistagihan
-- ----------------------------
DROP TABLE IF EXISTS `psb_jenistagihan`;
CREATE TABLE `psb_jenistagihan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistagihan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `urutan` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_jenistagihan
-- ----------------------------
INSERT INTO `psb_jenistagihan` VALUES ('1', 'sekali', 'sekali', '1');
INSERT INTO `psb_jenistagihan` VALUES ('2', 'hari', 'per hari', '2');
INSERT INTO `psb_jenistagihan` VALUES ('3', 'minggu', 'per minggu', '3');
INSERT INTO `psb_jenistagihan` VALUES ('4', 'bulan', 'per bulan', '4');
INSERT INTO `psb_jenistagihan` VALUES ('5', 'semester', 'per semester', '5');
INSERT INTO `psb_jenistagihan` VALUES ('6', 'tahun', 'per tahun', '6');

-- ----------------------------
-- Table structure for psb_kondisisiswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_kondisisiswa`;
CREATE TABLE `psb_kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_kondisisiswa
-- ----------------------------

-- ----------------------------
-- Table structure for psb_kriteria
-- ----------------------------
DROP TABLE IF EXISTS `psb_kriteria`;
CREATE TABLE `psb_kriteria` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_kriteria
-- ----------------------------
INSERT INTO `psb_kriteria` VALUES ('1', 'Toddler', 'Usia diatas 1 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('5', 'Secondary 3', 'Usia 14 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('6', 'Secondary 2', 'Usia 13 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('7', 'Secondary 1', 'Usia 12', '1');
INSERT INTO `psb_kriteria` VALUES ('8', 'Primary 6', 'Usia 11 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('9', 'Primary 5', 'Usia 10 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('10', 'Primary 4', 'Usia 9 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('12', 'Primary 3', 'Usia 8 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('13', 'Primary 2', 'Usia 7 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('14', 'Primary 1', 'Usia 6 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('15', 'Kindergarten B', 'Usia 5 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('16', 'Kindergarten A', 'Usia 4 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('17', 'Playgroup B', 'Usia 3 tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('22', 'High School 1', 'Usia 15 Tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('23', 'High School 2', 'Usia 16 Tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('25', 'Playgroup A', 'Usia 2 tahun', '1');

-- ----------------------------
-- Table structure for psb_photo
-- ----------------------------
DROP TABLE IF EXISTS `psb_photo`;
CREATE TABLE `psb_photo` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_photo
-- ----------------------------

-- ----------------------------
-- Table structure for psb_proses
-- ----------------------------
DROP TABLE IF EXISTS `psb_proses`;
CREATE TABLE `psb_proses` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proses` varchar(100) NOT NULL,
  `kodeawalan` varchar(10) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `kapasitas` int(11) NOT NULL DEFAULT '0',
  `departemen` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tahunajaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_proses
-- ----------------------------
INSERT INTO `psb_proses` VALUES ('2', 'Tahun Ajaran 2014-2015 (asli)', 'PMB2014', '2', '0000-00-00', '0000-00-00', '1000', '1', '1', '', '2014-03-19 03:56:34', '1');
INSERT INTO `psb_proses` VALUES ('3', 'Tahun Ajaran 2014-2015', 'PMB2014', '3', '0000-00-00', '0000-00-00', '200', '2', '1', '', '2014-03-19 05:47:48', '1');
INSERT INTO `psb_proses` VALUES ('6', 'Tahun Ajaran 2015-2016', 'PMB2015', '7', '0000-00-00', '0000-00-00', '100', '1', '0', '', '2014-12-09 03:09:22', null);
INSERT INTO `psb_proses` VALUES ('7', '2015-2016', 'PMB2016', '4', '0000-00-00', '0000-00-00', '500', '2', '1', '', '2015-01-26 02:35:28', null);
INSERT INTO `psb_proses` VALUES ('8', 'Tahun Ajaran 2015-2016', 'PMB2015', '11', '0000-00-00', '0000-00-00', '20', '3', '0', '', '2015-01-26 02:43:28', null);
INSERT INTO `psb_proses` VALUES ('9', '2016 - 2017', 'PMB2016', '4', '0000-00-00', '0000-00-00', '60', '2', '1', '', '2015-01-30 01:38:12', null);
INSERT INTO `psb_proses` VALUES ('10', 'Tahun Ajaran 2014-2015', 'PMB2014', '6', '0000-00-00', '0000-00-00', '100', '3', '1', 'ok (epii)', '2015-02-03 09:53:49', null);

-- ----------------------------
-- Table structure for psb_satuanjumlah
-- ----------------------------
DROP TABLE IF EXISTS `psb_satuanjumlah`;
CREATE TABLE `psb_satuanjumlah` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `satuanjumlah` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_satuanjumlah
-- ----------------------------
INSERT INTO `psb_satuanjumlah` VALUES ('1', 'lbr', 'lembar');
INSERT INTO `psb_satuanjumlah` VALUES ('2', 'set', 'set');

-- ----------------------------
-- Table structure for psb_siswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswa`;
CREATE TABLE `psb_siswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nopendaftaran` int(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `namasiswa` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL DEFAULT '',
  `nisn` varchar(100) NOT NULL DEFAULT '',
  `panggilansiswa` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sekolahasalsiswa` varchar(100) NOT NULL,
  `sukusiswa` int(10) DEFAULT NULL,
  `agamasiswa` int(11) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `jkelaminsiswa` enum('L','P') NOT NULL,
  `tempatlahirsiswa` varchar(50) NOT NULL,
  `tanggallahirsiswa` date NOT NULL,
  `warganegarasiswa` varchar(20) NOT NULL,
  `anakke` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `beratsiswa` decimal(4,1) unsigned NOT NULL DEFAULT '0.0',
  `tinggisiswa` decimal(4,1) unsigned NOT NULL DEFAULT '0.0',
  `darahsiswa` enum('A','B','AB','O') NOT NULL,
  `photosiswa` longtext NOT NULL,
  `alamatsiswa` varchar(255) NOT NULL,
  `kodepossiswa` varchar(8) NOT NULL,
  `telponsiswa` varchar(20) NOT NULL,
  `pinbbsiswa` varchar(20) NOT NULL,
  `emailsiswa` varchar(100) NOT NULL,
  `penyakitsiswa` varchar(300) NOT NULL,
  `hpsiswa` varchar(15) NOT NULL,
  `catatankesehatansiswa` text NOT NULL,
  `kotasiswa` varchar(25) NOT NULL,
  `kotasekolahasalsiswa` varchar(25) NOT NULL,
  `negarasekolahasalsiswa` varchar(25) NOT NULL,
  `ijazahsiswa` varchar(55) NOT NULL,
  `keterangansiswa` text,
  `bahasasiswa1` varchar(20) NOT NULL,
  `bahasasiswa2` varchar(20) NOT NULL,
  `diasuh` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1=ayah+ibu, 2=ayah, 3=ibu, 4=wali',
  PRIMARY KEY (`replid`),
  KEY `FK_calonsiswa_agama` (`agamasiswa`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_siswa
-- ----------------------------
INSERT INTO `psb_siswa` VALUES ('193', '14', null, 'Lunabelle Veloxia Taslim', '7', '', '', '1', '', '0', '0', '1', 'P', '', '2007-07-18', '', '0', '0.0', '0.0', '', '13_fc0095bb80.jpeg', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('202', '23', null, 'Quinncy Angeline Gunawan', '', '', 'Quinn', '1', 'Baby Smile School', '0', '0', '0', 'P', 'surabaya', '2012-03-09', 'indonesia', '0', '0.0', '0.0', '', '', 'Woodland WL 2/88 Citraland', '', '0317450572', '', '', '', '08155128883', '', 'surabaya', '', '', '', null, 'indonesia', 'english', '1');
INSERT INTO `psb_siswa` VALUES ('203', '24', null, 'Rayna Felixia Tanujaya', '', '', 'rayna', '1', '', '0', '5', '0', 'P', 'surabaya', '2013-01-01', 'indonesia', '0', '0.0', '0.0', '', '', 'satelit indah 9 / GN - 18', '', '', '', 'dto31@yahoo.com', '', '085100109151', '', 'surabaya', '', '', '', null, 'indonesia', 'english', '1');
INSERT INTO `psb_siswa` VALUES ('204', '25', null, 'naysa ronauly emmelee sidabutar 	', '', '', 'naysa', '1', '', '0', '5', '0', 'P', 'surabaya', '2013-01-28', 'indonesia', '0', '0.0', '0.0', '', '', 'Manukan Peni A-4 / 12 ', '', '', '', '', '', '0811344037', '', 'surabaya', '', '', '', null, 'indonesia', '', '1');
INSERT INTO `psb_siswa` VALUES ('205', '26', null, 'vincenzo christopher wen', '93', '', '', '1', '', '0', '0', '1', 'L', '', '2015-12-17', '', '0', '0.0', '0.0', '', '17_d006da213a.jpeg', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('206', '27', null, 'Jocelyn Jayadi', '', '', 'Jocelyn', '1', 'fei siang preschool', '0', '4', '0', 'P', 'surabaya', '2012-06-11', 'indonesia', '0', '0.0', '0.0', '', '', 'sukomanunggal jaya elok E/22 RT/RW 005/003', '', '0317320208', '', '', '', '', '', 'sukomanunggal jaya elok E', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('207', '28', null, 'Sharon Layarta', '', '', 'Sharon', '1', 'Great Crystal', '0', '5', '0', 'P', 'Surabaya', '2010-05-21', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'Indonesia', 'Inggris', '1');
INSERT INTO `psb_siswa` VALUES ('208', '29', null, 'Gabriela Patricia Lusida', '', '', 'Patricia', '1', 'Margie', '0', '4', '0', 'P', 'Surabaya', '2001-03-17', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('209', '30', null, 'Sharon Serafine', '', '', 'Sharon', '1', 'Great Crystal', '0', '5', '0', 'P', 'Surabaya', '2004-09-18', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('210', '31', null, 'Bryan Patrick Purnomo', '', '', 'Bryan', '1', 'IPH', '0', '4', '0', 'L', 'Surabaya', '2004-10-16', 'Idonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('211', '32', null, 'Jocelyn Jennifer Wen', '', '', 'Jocy', '1', 'Spins', '0', '5', '0', 'P', 'Surabaya', '2015-12-01', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '0811 341 3153', '', '', '', '0858 5339 4639', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('212', '33', null, 'Marilynn Eng Jia Yi', '', '', 'Marilynn', '1', 'Surabaya Cambridge School', '0', '0', '0', 'P', 'Singapore', '2004-02-02', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('213', '34', null, 'Osten Cristo Harianto', '', '', 'Osten', '1', 'Merlion', '0', '0', '0', 'L', 'Surabaya', '2010-01-26', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('214', '35', null, 'Averyne Stacya Denyanto', '', '', 'Averyne', '1', 'IVY School', '0', '0', '0', 'P', 'Surabaya', '2010-08-10', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('215', '36', null, 'Terrence Kiswanto', '', '', 'Terrence', '1', 'Great Crystal School', '0', '5', '0', 'L', 'Surabaya', '2011-01-04', '', '0', '0.0', '0.0', '', '', 'Jl. Jenggolo no 35-37', '', '031 896 1107', '', 'heni_olii@yahoo.com', '', '0815 1563 1615', '', 'Surabaya', 'Surabaya', 'Indonesia', '', null, 'Indonesa', '', '1');
INSERT INTO `psb_siswa` VALUES ('216', '37', null, 'Henry Chandra', '', '', 'Henry', '1', 'Lollypop', '0', '1', '0', 'L', 'Surabaya', '2010-09-17', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'Mandarin', 'English', '1');
INSERT INTO `psb_siswa` VALUES ('217', '38', null, 'Regina Mikaela Hidayat', '', '', 'Regina', '1', 'Merlion', '0', '0', '0', 'P', 'Singapore', '2009-12-12', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('218', '39', null, 'Irene Valensia', '', '', 'Valen', '1', 'Great Crystal', '0', '5', '0', 'P', 'Surabaya', '2011-02-03', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', 'Surabaya', 'Indonesia', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('219', '40', null, 'Joe Lukas Wili', '', '', 'Joe', '1', 'Lollypop', '0', '5', '0', 'L', 'Surabaya', '2010-02-05', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('220', '41', null, 'Natan Gunawan', '', '', 'Natan', '1', '', '0', '5', '0', 'L', 'Surabaya', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'English', '', '1');
INSERT INTO `psb_siswa` VALUES ('221', '42', null, 'Hiro Hideaki Prasetya', '', '', 'Hiro', '1', 'Lollypop', '0', '4', '0', 'L', 'Surabaya', '2010-05-12', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('222', '43', null, 'Kenzie Edbert Widodo', '', '', 'Kenzie', '1', 'lollypop', '0', '0', '0', 'L', 'Surabaya', '2010-06-12', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('223', '44', null, 'Azelia Javelyn Kho', '', '', 'Javelyn', '1', 'Little Sun School', '0', '0', '0', 'P', 'Surabaya', '2010-07-03', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'Indonesia', 'English', '1');
INSERT INTO `psb_siswa` VALUES ('224', '45', null, 'James Franklin Linarto', '', '', 'James', '1', 'Lollypop', '0', '0', '0', 'L', 'Surabaya', '0000-00-00', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('225', '46', null, 'Shannon vivan Liem', '', '', 'Vivan', '1', 'Merlion', '0', '0', '0', 'P', 'Surabaya', '2010-10-21', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('226', '47', null, 'Nicholas Andrison', '', '', 'Nick', '1', 'Ivy School', '0', '5', '0', 'L', 'Surabaya', '2010-09-28', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'English', 'indonesia', '1');
INSERT INTO `psb_siswa` VALUES ('227', '48', null, 'Revin Liem', '', '', 'Revin', '1', 'Lollypop', '0', '5', '0', 'L', 'Surabaya', '2009-12-15', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('229', '49', null, 'Gisele Lovely Njoto', '', '', 'Pao Pao', '1', 'JAC School', '0', '0', '0', 'P', 'Surabaya', '2010-05-10', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('230', '50', null, 'Archie Oesjady', '10', '', '', '1', '', '0', '0', '1', 'L', '', '2010-07-14', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('231', '51', null, 'George Maverick candra', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('233', '53', null, 'Justin Ong', '99', '', '', '1', '', '0', '0', '1', 'P', '', '2015-12-25', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('234', '54', null, 'Cordelia Sucarita Wang', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('235', '55', null, 'Adjie Reksa Nugroho', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('236', '56', null, 'Carly Rei Chen', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('237', '57', null, 'Kaylee Weng Okawida', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('238', '58', null, 'Aldrin Reynard Herdianto', '9', '', '', '1', '', '0', '0', '1', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('239', '59', null, 'Eugene Sinclair Sutanto', '', '', '', '1', '', '0', '0', '0', 'L', '', '2015-12-16', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('240', '60', null, 'Aaron William Soemarno', '8', '', '', '1', '', '0', '0', '1', 'L', '', '2015-12-18', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('241', '61', null, 'Axel Oesjady', '', '', '', '1', '', '0', '0', '0', 'L', '', '2015-12-02', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('242', '62', null, 'Jordyn Edward Motanto', '6', '', '', '1', '', '0', '0', '1', 'L', '', '2015-12-09', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');

-- ----------------------------
-- Table structure for psb_siswa_copy
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswa_copy`;
CREATE TABLE `psb_siswa_copy` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL DEFAULT '',
  `nisn` varchar(100) NOT NULL DEFAULT '',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sekolahasal` varchar(100) NOT NULL,
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `kelamin` enum('L','P') NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warganegara` varchar(20) NOT NULL,
  `anakke` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `berat` decimal(4,1) unsigned NOT NULL DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned NOT NULL DEFAULT '0.0',
  `darah` enum('A','B','AB','O') DEFAULT NULL,
  `photo` longtext NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kodepos` varchar(8) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `penyakit` varchar(300) DEFAULT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `catatankesehatan` text NOT NULL,
  `kotasekolahasal` varchar(25) DEFAULT NULL,
  `negarasekolahasal` varchar(25) DEFAULT NULL,
  `ijazah` varchar(55) DEFAULT NULL,
  `keterangan` text,
  `setbiaya` int(10) NOT NULL DEFAULT '0',
  `bahasa2` varchar(20) NOT NULL,
  `bahasa1` varchar(20) NOT NULL,
  `namabank` varchar(100) NOT NULL,
  `rekening` varchar(50) NOT NULL,
  `diasuh` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1=ayah+ibu, 2=ayah, 3=ibu, 4=wali',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_siswa_copy
-- ----------------------------
INSERT INTO `psb_siswa_copy` VALUES ('7', 'PMB2014140007', null, 'Trevor Yongnardi', '222', '', null, '1', 'Bumble Bee', '0', '5', '0', 'L', '', '2011-10-10', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Timur G59', '', '085731316399', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('8', 'PMB2014140008', null, 'Sean Kennard Sebastian Ho', '333', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2012-05-07', '', '0', '0.0', '0.0', '', '', 'Ngagel Jaya Selatan E28 Surabaya', '', '085706331688', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('9', 'PMB2014140009', null, 'Chelsey Felicia Sugianto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-02-18', '', '0', '0.0', '0.0', '', '', 'Satelit Timur II Blok JJ-12', '', '5320745', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('11', 'PMB2014140010', null, 'Kayla Aprillia Tanujaya', '444', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2012-04-22', '', '0', '0.0', '0.0', '', '', 'Satelit Indah IX/GN-18', '', '70109151', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('14', 'PMB2014140014', null, 'Luke Caesar Njoto Imanuel', '555', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2012-05-14', '', '0', '0.0', '0.0', '', '', 'Petemon I/97 Surabaya', '', '70704437', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('15', 'PMB2014140015', null, 'Ezell Dean Nugroho', '666', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-09-28', '', '0', '0.0', '0.0', '', '', 'Woodland WL II no.70 Citraland', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('16', 'PMB2014140016', null, 'Kate Massey Tunggala', '777', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-08-29', '', '0', '0.0', '0.0', '', '', 'Donowati V/43', '', '081333666000', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('17', 'PMB2014140017', null, 'Florence Christalyn Tansah', '888', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-08-03', '', '0', '0.0', '0.0', '', '', 'Puri Sentra Raya PS1 / 53E Citraland', '', '082333378888', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('18', 'PMB2014140018', null, 'Helena Serafi Xue', '999', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-09-24', '', '0', '0.0', '0.0', '', '', 'Darmo Green Garden B9', '', '7324908', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('19', 'PMB2014140019', null, 'Joel Fabrizio Hanjaya', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-02-18', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Utara XI / 18', '', '7317577', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('20', 'PMB2014140020', null, 'Jayden Anthony Theios', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-10-24', '', '0', '0.0', '0.0', '', '', 'Banyu Urip Wetan 5/95', '', '5676091', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('21', 'PMB2014140021', null, 'Haven Mae Sutiono', '', '', null, '1', 'Gracia Preschool Citraraya', '0', '5', '0', 'L', 'Surabaya', '2011-10-26', '', '0', '0.0', '0.0', '', '', 'Pakis Argosari VII/51', '', '5685314', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('22', 'PMB2014140022', null, 'Genevieve Ganda', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-06-01', '', '0', '0.0', '0.0', '', '', 'Graha Family N47', '', '0818320768', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('23', 'PMB2014140023', null, 'Megan Wu', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-10-01', '', '0', '0.0', '0.0', '', '', 'Tanjungsari Baru I/12', '', '081934626676', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('24', 'PMB2014140024', null, 'Aishlyn Arianna Tejakusuma', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-07-21', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 3 LN 5', '', '081703434393', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('25', 'PMB2014140025', null, 'Raelene Michelina Budiman', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2011-06-21', '', '0', '0.0', '0.0', '', '', 'Taman Puspa Raya B6/19 Citraland Surabaya', '', '70581663', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('27', 'PMB2014140027', null, 'Frederick Sutendy', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-05-03', '', '0', '0.0', '0.0', '', '', 'Dupak 17 Blok B14 Komplek Ruko Pasifik Megah, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('28', 'PMB2014140028', null, 'Victor Fu', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-08-24', '', '0', '0.0', '0.0', '', '', 'Royal Residence B9-187', '', '08121631513', null, null, '', null, '', null, null, null, null, '266', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('29', 'PMB2014140029', null, 'Hizkia Debharim Xue', '', '', null, '1', 'Great Crystal International School', '0', '5', '0', 'L', 'Surabaya', '2009-05-22', '', '0', '0.0', '0.0', '', '', 'Darmo Green Garden B9', '', '087822212573', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('30', 'PMB2014140030', null, 'Kiersten Jane Priatman', '', '', null, '1', 'Sun Surabaya Montessori School', '0', '5', '0', 'P', 'Arcadia, A.S.', '2009-02-09', '', '0', '0.0', '0.0', '', '', 'Graha Family T70', '', '0817584826', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('32', 'PMB2014140031', null, 'wang yu xin', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('36', 'PMB2014140033', null, 'Kiyora Asami Prasetyo', '', '', null, '1', 'Lollypop Preschool', '0', '5', '1', 'P', '', '2008-08-08', '', '0', '0.0', '0.0', '', '', 'Jl. Tulung Agung 3/39', '', '0817335288', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('37', 'PMB2014140037', null, 'Ferlyne Gabrielly Thie', '', '', null, '1', 'Lollypop Preschool', '0', '0', '1', 'P', '', '2008-04-24', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah the Mansion PF 4 No 8', '', '081357226181', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('38', 'PMB2014140038', null, 'Colin Cristo Harianto', '', '', null, '1', 'Merlion', '0', '0', '1', 'L', '', '2008-01-19', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas E3/10', '', '0818372591', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('39', 'PMB2014140039', null, 'Hacken Wunadi', '', '', null, '1', 'Happy Family School', '0', '0', '1', 'L', '', '2008-09-07', '', '0', '0.0', '0.0', '', '', 'Graha Family R179A', '', '081233775900', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('40', 'PMB2014140040', null, 'Josevine Angeline Musa', '', '', null, '1', 'Stepping stones', '0', '0', '1', 'P', '', '2008-04-02', '', '0', '0.0', '0.0', '', '', 'Darmo permai Selatan XI/18', '', '70178869', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('41', 'PMB2014140041', null, 'Sharon A. Soempiet', '', '', null, '1', 'Cambridge School', '0', '5', '1', 'P', '', '2008-01-09', '', '0', '0.0', '0.0', '', '', 'Royal Residence B3-52A', '', '71227601', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('42', 'PMB2014140042', null, 'Michelle Tanaya', '', '', null, '1', '', '0', '0', '1', 'P', '', '2008-07-28', '', '0', '0.0', '0.0', '', '', 'Jl. Tulung Agung 3/6', '', '59319420', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('43', 'PMB2014140043', null, 'Jenevieve Clairine', '', '', null, '1', 'JAC', '0', '0', '1', 'P', '', '2008-07-14', '', '0', '0.0', '0.0', '', '', 'Taman Darmo Harapan II/GG II-C', '', '7317042', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('44', 'PMB2014140044', null, 'Calista Gracious Susanto', '', '', null, '1', 'Ivy School', '0', '0', '1', 'P', '', '2008-07-13', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Indah C1-8', '', '70603754', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('45', 'PMB2014140045', null, 'Grace Caroline Cahyono', '', '', null, '1', 'Vita School', '0', '0', '1', 'P', '', '2008-07-12', '', '0', '0.0', '0.0', '', '', 'San Diego M6-28 Pakuwon City', '', '08575506888', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('46', 'PMB2014140046', null, 'Noel Nelson Felix', '', '', null, '1', 'Town for kids', '0', '0', '1', 'L', '', '2008-01-02', '', '0', '0.0', '0.0', '', '', 'Perum Darmo sentosa Raya Blok i-38', '', '71616111', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('47', 'PMB2014140047', null, 'Filbert Wellington', '', '', null, '1', 'Xin Zhong', '0', '0', '1', 'L', '', '2008-05-14', '', '0', '0.0', '0.0', '', '', 'The Mansion PF-5/22', '', '71047493', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('48', 'PMB2014140048', null, 'Ezekiel Shawn Wondo', '', '', null, '1', 'Surabaya Grammar School', '0', '0', '1', 'L', '', '2008-05-04', '', '0', '0.0', '0.0', '', '', 'Centra Park E-19', '', '70597500', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('49', 'PMB2014140049', null, 'Gabriel Grace Ong', '', '', null, '1', 'Merlion', '0', '5', '0', 'P', '', '2008-07-09', '', '0', '0.0', '0.0', '', '', '', '', '70789099', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('50', 'PMB2014140050', null, 'Fidelia Theodore Chang', '', '', null, '1', 'Happy Family School', '0', '0', '1', 'P', '', '2008-03-12', '', '0', '0.0', '0.0', '', '', 'Darmo Hill P-12', '', '081330716553', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('51', 'PMB2014140051', null, 'Emili Trecia Faustina', '', '', null, '1', 'Little Sun', '0', '0', '1', 'P', '', '2008-05-15', '', '0', '0.0', '0.0', '', '', 'Kranggan 102 kav 8', '', '5340131', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('52', 'PMB2014140052', null, 'Janice Valerie Judianto', '', '', null, '1', '', '0', '0', '0', 'P', '', '2008-01-28', '', '0', '0.0', '0.0', '', '', 'OGT AB 11/58', '', '0811596881', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('53', 'PMB2014140053', null, 'Christie Feodora Suanthie', '', '', null, '1', 'Merlion', '0', '0', '0', 'P', '', '2008-02-18', '', '0', '0.0', '0.0', '', '', 'Graha Family K-63', '', '082330036967', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('54', 'PMB2014140054', null, 'Gycella Ciatawi', '', '', null, '1', '', '0', '0', '0', 'P', '', '2008-12-01', '', '0', '0.0', '0.0', '', '', 'Wiyung Indah 19 NN-1', '', '7674450', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('55', 'PMB2014140055', null, 'Nicholas Michael', '', '', null, '1', 'IPH', '0', '0', '0', 'L', '', '2008-05-16', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2 PD 3 no 5 Pakuwon', '', '7391868', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('56', 'PMB2014140056', null, 'Andrew Prasetyo', '', '', null, '1', 'Merlion', '0', '0', '0', 'L', '', '2008-04-16', '', '0', '0.0', '0.0', '', '', 'Margorejo Indah C-401A', '', '81965989', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('57', 'PMB2014140057', null, 'Ferdinand Christanto Thomas', '', '', null, '1', 'Merlion', '0', '0', '0', 'L', '', '2008-02-10', '', '0', '0.0', '0.0', '', '', 'Raya Mastrip Kemlaten 26A', '', '70627543', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('58', 'PMB2014140058', null, 'Patricia Michelle Rumoei', '', '', null, '1', 'Tutor Time', '0', '0', '0', 'P', '', '2008-04-01', '', '0', '0.0', '0.0', '', '', 'SDPT 2/2', '', '78207041', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('59', 'PMB2014140059', null, 'Griffith Clairenova Wijaya', '', '', null, '1', '', '0', '0', '0', 'L', '', '2008-09-22', '', '0', '0.0', '0.0', '', '', '', '', '081316041316', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('61', 'PMB2015140001', null, 'Charleen Audrey Tjandra', '', '', null, '1', '', '0', '0', '0', 'L', '', '2013-10-29', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('62', 'PMB2015140062', null, 'Naomi Cherish', '', '', null, '1', '', '0', '0', '0', 'P', '', '2012-12-13', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('63', 'PMB2015140063', null, 'Kenneth Jones', '', '', null, '1', '', '0', '0', '0', 'L', '', '2013-08-02', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('64', 'PMB2015140064', null, 'Fonzio Cayden Suganda', '', '', null, '1', '', '0', '0', '0', 'L', '', '2013-01-03', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('65', 'PMB2015140065', null, 'Shanon Ignacia', '', '', null, '1', '', '0', '0', '0', 'L', '', '2011-12-27', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('66', 'PMB2015140066', null, 'Kiele Huang', '', '', null, '1', '', '0', '0', '0', 'L', '', '2012-04-07', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('67', 'PMB2015140067', null, 'Lincoln Harsono', '', '', null, '1', '', '0', '0', '0', 'L', '', '2011-05-07', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('68', 'PMB2015140068', null, 'Clarissa Elizabeth Tjandra', '', '', null, '1', '', '0', '0', '0', 'P', '', '2011-05-24', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('69', 'PMB2015140069', null, 'Manuel Allessandro', '', '', null, '1', '', '0', '0', '0', 'L', '', '2011-04-09', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('70', 'PMB2015140070', null, 'Samatha Elizabeth Hidajat', '', '', null, '1', '', '0', '0', '0', 'P', '', '2011-05-05', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('71', 'PMB2015140071', null, 'Julie T. E', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-08-01', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('72', 'PMB2015140072', null, 'Isabel Laetizia Soewandi', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-09-08', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('73', 'PMB2015140073', null, 'Colin Jefferson Harsono', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-12-03', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('74', 'PMB2015140074', null, 'Nathan Manuel F. Soehartono', '', '', null, '1', '', '0', '0', '0', 'L', '', '2008-12-31', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('75', 'PMB2015140075', null, 'Winfred Rainer', '', '', null, '1', '', '0', '3', '0', 'L', '', '2009-03-09', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('76', 'PMB2015140076', null, 'Mirelle Gracia Edith', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-09-02', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('77', 'PMB2015140077', null, 'Keiko Clarissa Sugianto', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-10-28', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('78', 'PMB2015140078', null, 'Kylie Yvaine Halim', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-04-20', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('79', 'PMB2015140079', null, 'Eileen Thejawijaya', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-11-08', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('80', 'PMB2015140080', null, 'Jessica Hilary Amsal', '', '', null, '1', '', '0', '0', '0', 'L', '', '2011-08-15', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('81', 'PMB2015140081', null, 'Keyko Liem', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-05-11', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('82', 'PMB2015140082', null, 'Kenzo Liem', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-05-11', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('83', 'PMB2015140083', null, 'Jayden O. H', '', '', null, '1', '', '0', '0', '0', 'L', '', '2008-11-11', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('84', 'PMB2015140084', null, 'Jayden Chistopher Kwan', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-07-23', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('85', 'PMB2015140085', null, 'Davin Susilo', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-06-19', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('86', 'PMB2015140086', null, 'Leanna Gaby Ligito', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-08-10', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('87', 'PMB2015140087', null, 'Timothy Ethan', '', '', null, '1', '', '0', '0', '0', 'L', '', '2008-09-07', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('88', 'PMB2015140088', null, 'Ashley Clarissa Wenas', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-03-21', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('89', 'PMB2015140089', null, 'James Christian Tjoe', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-06-22', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('90', 'PMB2015140090', null, 'Megan Elizabeth Lin', '', '', null, '1', '', '0', '0', '0', 'P', '', '2009-02-13', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('91', 'PMB2015140091', null, 'Kayleen Miciko Owen', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-09-17', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('92', 'PMB2015140092', null, 'Jordan Maxwell Lin', '', '', null, '1', '', '0', '0', '0', 'L', '', '2006-12-17', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('93', 'PMB2015140093', null, 'Richard Hoshi', '', '', null, '1', '', '0', '0', '0', 'L', '', '2004-02-25', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('94', 'PMB2015140094', null, 'Jonathan sebastian', '', '', null, '1', '', '0', '0', '0', 'L', '', '2003-05-03', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('95', 'PMB2015140095', null, 'Janet Gloria', '', '', null, '1', '', '0', '0', '0', 'P', '', '2003-04-14', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('96', 'PMB2015140096', null, 'Angeline Hoshi', '', '', null, '1', '', '0', '0', '0', 'P', '', '2002-12-31', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('97', 'PMB2015140097', null, 'William, Jia Wei', '', '', null, '1', '', '0', '0', '0', 'L', '', '2002-12-31', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('98', 'PMB2015140098', null, 'Michael Noah Yolimbera', '', '', null, '1', '', '0', '0', '0', 'L', '', '2002-12-31', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('100', 'PMB2015150099', null, 'Samantha Ongso', '', '', null, '1', '', '0', '0', '0', 'P', '', '2013-01-17', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('101', 'PMB2015150101', null, 'Jeanice M. Christianto', '', '', null, '1', '', '0', '0', '0', 'L', '', '2012-12-15', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('102', 'PMB2015150102', null, 'Megan Tanaya', '', '', null, '1', '', '0', '0', '0', 'L', '', '2012-09-30', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('103', 'PMB2015150103', null, 'William Nicholas Teng', '', '', null, '1', '', '0', '5', '0', 'L', '', '2012-12-23', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('104', 'PMB2015150104', null, 'Maylynn Zeta Sasongko', '', '', null, '1', '', '0', '5', '0', 'P', '', '2013-05-10', '', '0', '0.0', '0.0', '', '', '', '', '08123524102', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('105', 'PMB2015150105', null, 'Michelle Wijaya', '', '', null, '1', '', '0', '0', '0', 'L', '', '2013-09-03', '', '0', '0.0', '0.0', '', '', '', '', '08385581985', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('106', 'PMB2015150106', null, 'Clarin Valerie Tejokusumo', '', '', null, '1', '', '0', '0', '0', 'P', '', '2012-05-29', '', '0', '0.0', '0.0', '', '', '', '', '8962977', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('107', 'PMB2015150107', null, 'Jason Arsenio T', '', '', null, '1', '', '0', '5', '0', 'L', '', '2011-11-10', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('108', 'PMB2015150108', null, 'Crescencia Maeghan Hiandinata', '', '', null, '1', '', '0', '5', '0', 'P', '', '2011-04-07', '', '0', '0.0', '0.0', '', '', '', '', '57431103', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('109', 'PMB2015150109', null, 'Felicia Dominique Lin', '', '', null, '1', '', '0', '0', '0', 'L', '', '2012-06-20', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('110', 'PMB2015150110', null, 'Kenward Evander Tan', '', '', null, '1', '', '0', '5', '0', 'L', '', '2011-01-27', '', '0', '0.0', '0.0', '', '', '', '', '08123148682', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('111', 'PMB2015150111', null, 'Kenny Tanzil', '', '', null, '1', '', '0', '5', '0', 'P', '', '2011-08-20', '', '0', '0.0', '0.0', '', '', '', '', '081803126988', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('112', 'PMB2015150112', null, 'Catherine Annabella Tjoe', '', '', null, '1', '', '0', '5', '0', 'P', '', '2011-10-20', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('113', 'PMB2015150113', null, 'Nicholas Immanuel Santoso', '', '', null, '1', '', '0', '5', '0', 'L', '', '2010-03-01', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('114', 'PMB2015150114', null, 'Vincent Colin Utama', '', '', null, '1', '', '0', '5', '0', 'L', '', '2009-11-19', '', '0', '0.0', '0.0', '', '', '', '', '78317170', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('115', 'PMB2015150115', null, 'Keiko Geraldine Alfonsa', '', '', null, '1', '', '0', '5', '0', 'L', '', '2009-08-03', '', '0', '0.0', '0.0', '', '', '', '', '081905027888', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('116', 'PMB2015150116', null, 'Immanuel Kay Lukito', '', '', null, '1', '', '0', '5', '0', 'L', '', '2009-07-07', '', '0', '0.0', '0.0', '', '', '', '', '8961750', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('117', 'PMB2015150117', null, 'Misha Setiabudi', '', '', null, '1', '', '0', '5', '0', 'L', '', '2009-11-02', '', '0', '0.0', '0.0', '', '', '', '', '7318838', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('118', 'PMB2015150118', null, 'Gabriella Megumi Tjandra', '', '', null, '1', '', '0', '5', '0', 'P', '', '2009-04-14', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('119', 'PMB2015150119', null, 'Clarissa Kurniawan', '', '', null, '1', '', '0', '5', '0', 'P', '', '2007-10-02', '', '0', '0.0', '0.0', '', '', '', '', '0816506471', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('120', 'PMB2015150120', null, 'Eric Jonathan Tannasa', '', '', null, '1', '', '0', '5', '0', 'L', '', '2007-10-20', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('121', 'PMB2015150121', null, 'Edward Jonathan Tannasa', '', '', null, '1', '', '0', '5', '0', 'L', '', '2006-04-08', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('122', 'PMB2015150122', null, 'Edwin Jonathan Tannasa', '', '', null, '1', '', '0', '0', '0', 'L', '', '2006-04-08', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('123', 'PMB2015150123', null, 'Valennia Thio', '', '', null, '1', '', '0', '0', '0', 'L', '', '2003-03-25', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('124', 'PMB2015150124', null, 'Zhung Rong Xin', '', '', null, '1', '', '0', '0', '0', 'L', '', '2001-05-28', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('125', 'PMB2015150125', null, 'soleh', '', '', null, '1', '9', '0', '3', '0', 'L', 'ok', '2020-01-01', '', '0', '0.0', '0.0', 'A', '', '9', '', '9', null, null, 'tidka sakit', null, 'bagus', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('134', 'PMB2014150001', null, 'Angeline Jessie Kurnia Patricia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-01-02', '', '0', '0.0', '0.0', '', '', 'Tambak Adi 66, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('135', 'PMB2014150135', null, 'Arthur Kristanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-08-30', '', '0', '0.0', '0.0', '', '', 'Nirwana Executive CC-411 A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('136', 'PMB2014150136', null, 'Cahyadi Sudrajat Lauwandy', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2008-03-28', '', '0', '0.0', '0.0', '', '', 'Mojoklanggru Kidul H/12', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('137', 'PMB2014150137', null, 'Christopher Rich Gondo', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2008-09-08', '', '0', '0.0', '0.0', '', '', 'Rungkut Mapan Barat IX / AH-33', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('140', 'PMB2014150060', null, 'Astrid Regina Pangkey', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2003-02-16', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah  LY - 2', '', '0811327851', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('144', 'PMB2014150141', null, 'Ezell Dean Nugroho', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2011-11-28', '', '0', '0.0', '0.0', '', '', 'Woodland WL 11 / 70 Citraland', '', '03160760758', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('145', 'PMB2014150145', null, 'Jane Evangeline Lee', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2012-09-10', '', '0', '0.0', '0.0', '', '', 'Graha Family o-111', '', '0317324653', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('146', 'PMB2014150146', null, 'Kayla Aprillia Tanujaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2012-03-22', '', '0', '0.0', '0.0', '', '', 'Satelit Indah IX / GN-18', '', '0317312413', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('147', 'PMB2014150147', null, 'Luke Caesar Njoto Imanuel', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2012-05-14', '', '0', '0.0', '0.0', '', '', 'Petemon I / 97', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('148', 'PMB2014150148', null, 'Sean Kennard Sebastian Ho', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2012-05-07', '', '0', '0.0', '0.0', '', '', 'Ngagel Jaya Selatan E-28', '', '0317322771', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('149', 'PMB2014150149', null, 'Trevor Yongnardi', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2011-10-10', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Timur G-59', '', '0317311149', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('150', 'PMB2014150150', null, 'Victoria Jolyn Wu', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2012-07-07', '', '0', '0.0', '0.0', '', '', 'Griya Babatan Mukti C-11', '', '0317530363', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('151', 'PMB2014150151', null, 'Kenneth Bryant Sutanto', '', '', null, '1', '', '0', '1', '0', 'L', 'Surabaya', '2011-10-15', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Indah III / xx-18', '', '0317326668', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('156', 'PMB2014150154', null, 'Michael Dave Wijaya', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2012-04-16', '', '0', '0.0', '0.0', '', '', 'International Village B7 / 25A Citraland', '', '0318549876', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('158', 'PMB2014150157', null, 'Wang Yu Xin', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2012-08-09', '', '0', '0.0', '0.0', '', '', 'Rayen Regency F-5', '', '0317510224', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('161', 'PMB2014150159', null, 'Melly Santoso', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2012-07-06', '', '0', '0.0', '0.0', '', '', 'Raya Satelit Barat IN-31', '', '0317318991', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('162', 'PMB2014150162', null, 'Ellyana Gunawijoyo Liong', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-11-30', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Indah 5 / vv-12', '', '0317316787', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('163', 'PMB2014150163', null, 'Madeline Emily Gan', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2012-01-26', '', '0', '0.0', '0.0', '', '', 'Yosodipuro No.21', '', '0315676533', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('164', 'PMB2014150164', null, 'Christofer Romoei', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2014-04-01', '', '0', '0.0', '0.0', '', '', 'Simpang Darmo Permai Timur 2/2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('166', 'PMB2015150001', null, 'Geraldine Cyrilla Anthony Liem', '', '', null, '1', '', '0', '5', '1', 'P', 'Jakarta', '2011-01-27', '', '0', '0.0', '0.0', '', '', 'J. A Suprapto 124 Bojonegoro', '', '0811331409', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('170', 'PMB2014150165', null, 'Aaron Manuel Darmawan', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-11-01', '', '0', '0.0', '0.0', '', '', 'Dukuh Kupang 22 / 16', '', '0315667777', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('171', 'PMB2014150171', null, 'Bradley Matthew Lauw', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-09-08', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas E5 / 6', '', '0317535851', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('172', 'PMB2014150172', null, 'Caroline Leilany Ong', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2011-01-01', '', '0', '0.0', '0.0', '', '', 'Raya Tandes No.68', '', '0317490653', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('173', 'PMB2014150173', null, 'Claire Nicole Lin', '', '', null, '1', '', '0', '4', '0', 'P', 'Situbondo', '2011-04-28', '', '0', '0.0', '0.0', '', '', 'Kupang Indah V / 16', '', '0317315031', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('174', 'PMB2014150174', null, 'Daven Neilson Wu', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-05-27', '', '0', '0.0', '0.0', '', '', 'Woodland WL 2 / 89 Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('175', 'PMB2014150175', null, 'Ethan Timothy Halim', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-11-19', '', '0', '0.0', '0.0', '', '', 'Tanjungsari Baru V / 22', '', '0317348236', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('176', 'PMB2014150176', null, 'Hadley Nathan Suju B', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2011-05-06', '', '0', '0.0', '0.0', '', '', 'Simpang Darmo Permai Selatan V / 27', '', '0317315727', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('177', 'PMB2014150177', null, 'Haven Mae Sutiono', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-10-26', '', '0', '0.0', '0.0', '', '', 'Pakis Argosari VII / 51', '', '0315685314', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('178', 'PMB2014150178', null, 'Julius Avalokiti Hoo', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-07-18', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Indah IV / UU-1', '', '0317322034', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('179', 'PMB2014150179', null, 'Manfred Deryl Young', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-06-07', '', '0', '0.0', '0.0', '', '', 'Jaksa Agung Suprapto No.58 (Grandma)', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('180', 'PMB2014150180', null, 'Mia Kelly Haryono', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-10-27', '', '0', '0.0', '0.0', '', '', 'Graha Family O-177A', '', '03151200516', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('181', 'PMB2014150181', null, 'Micayla Rhea Aliptha', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2011-07-03', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan 7 / 46', '', '03170368979', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('182', 'PMB2014150182', null, 'Nazarette Kaylee Kristanto', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-01-06', '', '0', '0.0', '0.0', '', '', 'Graha Family N-33', '', '0317340928', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('183', 'PMB2014150183', null, 'Raelene Michelina Budiman', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2011-06-21', '', '0', '0.0', '0.0', '', '', 'Taman Puspa Raya B6-19', '', '03170581663', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('184', 'PMB2014150184', null, 'Richelle Valerie Kho', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-09-13', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 8 / FN-5', '', '0317343111', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('185', 'PMB2014150185', null, 'Sydney Loucia Wijaya', '', '', null, '1', '', '0', '5', '0', 'P', 'Selangor, Malaysia', '2010-10-10', '', '0', '0.0', '0.0', '', '', 'Raya Gayung Kebonsari 33-35', '', '3762765', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('186', 'PMB2014150186', null, 'Valerie Michaela Koeswanto', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-10-17', '', '0', '0.0', '0.0', '', '', 'Darmo Hill R-22', '', '0315681005', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('190', 'PMB2015150167', null, 'Wilson Gunawan', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2012-06-06', '', '0', '0.0', '0.0', '', '', 'Dharmahusada Indah Selatan D229', '', '083831724433', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('192', 'PMB2014150166', null, 'Grace Victoria Santoso', '', '', null, '1', '', '0', '0', '1', 'P', 'Surabaya', '2008-03-19', '', '0', '0.0', '0.0', '', '', 'Raya Wiguna Utara 36', '', '8703821', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('193', 'PMB2014150193', null, 'Jessica Joyce Natania', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-09-01', '', '0', '0.0', '0.0', '', '', 'Grha Tirta Akasia 95, Waru', '', '8557843', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('194', 'PMB2014150194', null, 'Giselle Cathryne Victoria Estelle', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-09-27', '', '0', '0.0', '0.0', '', '', 'Rungkut Lor RL 2B/22', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('195', 'PMB2014150195', null, 'Johannes Kennard Sujanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-10-07', '', '0', '0.0', '0.0', '', '', 'Nirwana Executive EE-57', '', '8705919', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('196', 'PMB2014150196', null, 'Joshua Ivanson Lie', '', '', null, '1', '', '0', '5', '1', 'L', 'Atlanta', '2008-05-21', '', '0', '0.0', '0.0', '', '', 'Lebak Jaya III A Utara / 5', '', '3894131', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('197', 'PMB2014150197', null, 'Louisel Yang', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-10-22', '', '0', '0.0', '0.0', '', '', 'Wiguna Tengah XII / 11', '', '71571076', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('198', 'PMB2014150198', null, 'Marcel Johannes Kraus', '', '', null, '1', '', '0', '5', '1', 'L', 'Frankenthal', '2008-04-29', '', '0', '0.0', '0.0', '', '', 'Ngagel Jaya Selatan II/ 7', '', '0315025206', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('199', 'PMB2014150199', null, 'Michael Yang Rahardjo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-07-11', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Timur E2 // 22', '', '5944108', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('200', 'PMB2014150200', null, 'Reyhan Adi Jayawasita', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-07-17', '', '0', '0.0', '0.0', '', '', 'Gry Permata Gedangan BII/3, Sdj', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('201', 'PMB2014150201', null, 'Shayfer Ann Yapari', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabya', '2008-03-20', '', '0', '0.0', '0.0', '', '', 'Tenggilis Mejoyo AI / 9', '', '8497451', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('202', 'PMB2014150202', null, 'Steven Grant Santoso', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-01-07', '', '0', '0.0', '0.0', '', '', 'Delta Raya Utara 76, Sda', '', '8555428', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('203', 'PMB2014150203', null, 'Alveria Evangeline Suthandaru', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-07-14', '', '0', '0.0', '0.0', '', '', 'Rungkut Asri Barat III/8', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('204', 'PMB2014150204', null, 'Chad Sia', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-03-30', '', '0', '0.0', '0.0', '', '', 'Galaxi Bumi Permai I-3/ 12', '', '0315996061', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('205', 'PMB2014150205', null, 'Chrisfusion Verden Adiwinata', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-03-14', '', '0', '0.0', '0.0', '', '', 'Taman Wiguna Timur Regency 37', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('206', 'PMB2014150206', null, 'Dylan Archer Alexander', '', '', null, '1', '', '0', '4', '1', 'L', 'Sydney', '2008-01-23', '', '0', '0.0', '0.0', '', '', 'Virginia Regency E8-2, Pakuwon City', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('207', 'PMB2014150207', null, 'John Winston Wilhelmus', '', '', null, '1', '', '0', '0', '1', 'L', 'Surabaya', '2008-12-16', '', '0', '0.0', '0.0', '', '', 'Nanas Utara I / 30 PCI', '', '70157779', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('209', 'PMB2014150208', null, 'Jonathan Christian Thomasoey', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2008-07-10', '', '0', '0.0', '0.0', '', '', 'Pakuwon City, Villa Riviera B1-12', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('211', 'PMB2014150210', null, 'Joyleen Huang', '', '', null, '1', '', '0', '1', '1', 'L', '', '2008-01-08', '', '0', '0.0', '0.0', '', '', 'Juanda Regency A-11', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('212', 'PMB2014150212', null, 'Kevin Ade Pratama', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-09-26', '', '0', '0.0', '0.0', '', '', 'Tropodo Indah K-12', '', '70579680', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('213', 'PMB2014150213', null, 'Matthew Ivanson Lie', '', '', null, '1', '', '0', '5', '1', 'L', 'Atlanta', '2008-05-21', '', '0', '0.0', '0.0', '', '', 'Lebak Jaya III A Utara / 5', '', '3894131', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('214', 'PMB2014150214', null, 'Oeitian James Ignatius', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2008-02-12', '', '0', '0.0', '0.0', '', '', 'Apt. Marina Lt.11-2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('215', 'PMB2014150215', null, 'Rebecca Chen', '', '', null, '1', '', '0', '5', '1', 'P', 'New York', '2008-04-01', '', '0', '0.0', '0.0', '', '', 'Wonorejo Permai Utara BB-515 / VII -28', '', '8781745', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('216', 'PMB2014150216', null, 'Shannon Susanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-08-26', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Barat C1-28', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('217', 'PMB2014150217', null, 'Sheby Netisha Tanjung', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-02-11', '', '0', '0.0', '0.0', '', '', 'Pondok Citra Eksekutif E-1', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('218', 'PMB2014150218', null, 'Abigail Evangelista Hertanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-05-11', '', '0', '0.0', '0.0', '', '', 'Manyar Adi 2/3 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('219', 'PMB2014150219', null, 'Axel Maynard Abdi', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-06-16', '', '0', '0.0', '0.0', '', '', 'Penjaringan Sari II/40', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('220', 'PMB2014150220', null, 'Catherine Sharon Ohana Kohartono', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-08-13', '', '0', '0.0', '0.0', '', '', 'Dinoyo Tangsi I/20', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('221', 'PMB2014150221', null, 'Cruz Sia', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-11-05', '', '0', '0.0', '0.0', '', '', 'Galaxy Bumi Permai I-3/12', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('222', 'PMB2014150222', null, 'Hieronimus Gilbert', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-11-11', '', '0', '0.0', '0.0', '', '', 'Bendul Merisi IX/67', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('223', 'PMB2014150223', null, 'Ivania Nathalia Louis Sumolang', '', '', null, '1', '', '0', '5', '1', 'P', 'Manado', '2007-01-07', '', '0', '0.0', '0.0', '', '', 'Semanggi Green Lake B2/42', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('224', 'PMB2014150224', null, 'Jackie Muniaga', '', '', null, '1', '', '0', '1', '1', 'L', 'Jakarta', '2007-07-31', '', '0', '0.0', '0.0', '', '', 'Parang Barong 19A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('225', 'PMB2014150225', null, 'Jessica', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-12-14', '', '0', '0.0', '0.0', '', '', 'Prapen Indah Timur IV/AA-49', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('226', 'PMB2014150226', null, 'Jesslyn Chrysler Hung', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-11-28', '', '0', '0.0', '0.0', '', '', 'Sinar Gedangan A-3a, Sda', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('227', 'PMB2014150187', null, 'Jonathan Jordan Dave', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2006-05-03', '', '0', '0.0', '0.0', '', '', 'Baruk Tengah XII/CC-107', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('228', 'PMB2014150228', null, 'Jophelia Christabel Thomas', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2007-09-18', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Timur VI / 67', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('232', 'PMB2014150227', null, 'Jonathan Jordan Dave', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-05-03', '', '0', '0.0', '0.0', '', '', 'Baruk Tengah XII/CC-107', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('233', 'PMB2014150233', null, 'Jophelia Christabel Thomas', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-09-18', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Timur VI / 67', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('234', 'PMB2014150234', null, 'Joycelyn Kezia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-05-06', '', '0', '0.0', '0.0', '', '', 'Kalikepiting III/17', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('235', 'PMB2014150235', null, 'Kevin Keane', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-01-30', '', '0', '0.0', '0.0', '', '', 'Kutisari Indah Utara VI/10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('236', 'PMB2014150236', null, 'Michelle Dominique', '', '', null, '1', '', '0', '5', '1', 'P', 'Balikpapan', '2007-07-05', '', '0', '0.0', '0.0', '', '', 'Panjang Jiwo Permai I - 17', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('237', 'PMB2014150237', null, 'Ray Thadeus Lee', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-08-09', '', '0', '0.0', '0.0', '', '', 'Doho No. 4', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('238', 'PMB2014150238', null, 'Shannon Audrey', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-03-13', '', '0', '0.0', '0.0', '', '', 'Baruk Utara 15/12 ND-117', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('239', 'PMB2014150239', null, 'Aileen Christy Elysia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-10-20', '', '0', '0.0', '0.0', '', '', 'Wedoro Regency 19 Waru, Sda', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('240', 'PMB2014150240', null, 'Beatrice Wiryawan', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-04-14', '', '0', '0.0', '0.0', '', '', 'Manyar Tirtoasri 4 /16', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('241', 'PMB2014150241', null, 'Caitlyn Gunawan', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2007-05-08', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu II/O-18', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('242', 'PMB2014150242', null, 'Christiansen Cruz Adiwinata', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-01-29', '', '0', '0.0', '0.0', '', '', 'Taman Wiguna Timur Regency 37', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('243', 'PMB2014150243', null, 'Gabriel Wilson Tejokusumo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-10-27', '', '0', '0.0', '0.0', '', '', 'Kertajaya Indah VII/II (G 120)', '', '70612238', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('244', 'PMB2014150244', null, 'Gavriella Angeline', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-07-09', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('246', 'PMB2014150245', null, 'Gemma Ebelina Alexaviere', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-01-02', '', '0', '0.0', '0.0', '', '', 'Galaxi Bumi Permai TG 2/ 17', '', '5964466', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('247', 'PMB2014150247', null, 'Gwyneth Feodora', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-09-01', '', '0', '0.0', '0.0', '', '', 'Florence J-5/9, Pakuwon', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('248', 'PMB2014150248', null, 'Jason Tungary', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-02-22', '', '0', '0.0', '0.0', '', '', 'Wonorejo Permai Selatan CC-598', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('249', 'PMB2014150249', null, 'Jessica Lynn Hartanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-09-02', '', '0', '0.0', '0.0', '', '', 'Kutisari Utara VII/38', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('250', 'PMB2014150250', null, 'Joel Lois Tanujaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-10-05', '', '0', '0.0', '0.0', '', '', 'Anjasmoro Kav. 41 Wistrop, Sda', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('251', 'PMB2014150251', null, 'Jonathan Ariel', '', '', null, '1', '', '0', '5', '1', 'L', 'Sidoarjo', '2007-02-23', '', '0', '0.0', '0.0', '', '', 'Jemursari XVIII/A-26 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('252', 'PMB2014150252', null, 'Joycelyn Angelica Jap', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-01-28', '', '0', '0.0', '0.0', '', '', 'Lebak Arum IV / 23', '', '3890105', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('253', 'PMB2014150253', null, 'Kenneth William', '', '', null, '1', '', '0', '5', '1', 'L', 'LA', '2007-04-20', '', '0', '0.0', '0.0', '', '', 'Dharmahusada Utara VII/25', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('254', 'PMB2014150254', null, 'Kenny Ezekiel Hartanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-05-15', '', '0', '0.0', '0.0', '', '', 'Wiguna Tengah 9/24', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('255', 'PMB2014150255', null, 'Stephan Wibisono', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2007-09-22', '', '0', '0.0', '0.0', '', '', 'Manyar Kertoarjo VIII/75', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('256', 'PMB2014150256', null, 'Brian Scott Alexander', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-08-01', '', '0', '0.0', '0.0', '', '', 'Virginia Regency E8-2, Pakuwon City', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('257', 'PMB2014150257', null, 'Charlene Young Cynipta', '', '', null, '1', '', '0', '0', '1', 'P', 'Surabaya', '2006-05-06', '', '0', '0.0', '0.0', '', '', 'Manyar Praja III/D-84', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('258', 'PMB2014150258', null, 'Cheryl Wang', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2006-09-22', '', '0', '0.0', '0.0', '', '', 'Nanas Utara I/18 PCI', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('259', 'PMB2014150259', null, 'Edbert Waskita', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2006-06-10', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu MA I blok O / 39', '', '8720029', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('260', 'PMB2014150260', null, 'Gracia Florentina Witdodo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-02-16', '', '0', '0.0', '0.0', '', '', 'Wiguna Timur XVIII/30', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('261', 'PMB2014150261', null, 'Grant Amadeus Lee', '', '', null, '1', '', '0', '5', '1', 'L', 'Mojokerto', '2006-01-02', '', '0', '0.0', '0.0', '', '', 'Doho No. 4', '', '5678948', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('262', 'PMB2014150262', null, 'Gregorius Reynard Sujanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-03-06', '', '0', '0.0', '0.0', '', '', 'Nirwana Executive EE-57', '', '8705919', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('263', 'PMB2014150263', null, 'Jason Timothy Dewanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-11-05', '', '0', '0.0', '0.0', '', '', 'Galaxy Bumi Permai K3-2', '', '5921301', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('264', 'PMB2014150264', null, 'Jeremy Noel', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-01-20', '', '0', '0.0', '0.0', '', '', 'Klampis Harapan III/14', '', '5948369', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('265', 'PMB2014150265', null, 'Jessie Huang', '', '', null, '1', '', '0', '1', '1', 'P', '', '2006-08-31', '', '0', '0.0', '0.0', '', '', 'Juanda Regency A-11', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('266', 'PMB2014150266', null, 'Marvellius Susanto', '', '', null, '1', '', '0', '0', '1', 'L', 'Surabaya', '2006-05-08', '', '0', '0.0', '0.0', '', '', 'Prapen Mas AD 25', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('267', 'PMB2014150267', null, 'Richard Kristanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-04-08', '', '0', '0.0', '0.0', '', '', 'Nirwana Executive CC-411 A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('268', 'PMB2014150268', null, 'Staceyca Abiel Wibisono', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-05-04', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu Blok MA III -O No. 5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('269', 'PMB2014150269', null, 'Vanny Valencia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-02-14', '', '0', '0.0', '0.0', '', '', 'Wiguna Selatan VI/21', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('270', 'PMB2014150270', null, 'Xavio Emanuel Retanubun', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-01-29', '', '0', '0.0', '0.0', '', '', 'Barata Jaya XXI/29', '', '5041211', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('271', 'PMB2014150271', null, 'Cheryl Glinka', '', '', null, '1', '', '0', '0', '1', 'P', 'Surabaya', '2006-11-15', '', '0', '0.0', '0.0', '', '', 'Pantai Mentari R 9A', '', '70479642', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('272', 'PMB2014150272', null, 'Dylan Victorio Faith', '', '', null, '1', '', '0', '0', '1', 'L', '', '2006-11-05', '', '0', '0.0', '0.0', '', '', 'Rungkut Lor RL 5L/15', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('273', 'PMB2014150273', null, 'Eileen Cynthia Mark', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-10-24', '', '0', '0.0', '0.0', '', '', 'Kendangsari III / 4A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('274', 'PMB2014150274', null, 'Francise Rochelle Widodo', '', '', null, '1', '', '0', '0', '1', 'P', 'Surabaya', '2006-06-13', '', '0', '0.0', '0.0', '', '', 'Wonorejo Permai Selatan I/64', '', '8722412', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('275', 'PMB2014150275', null, 'Hafizd Dharma Saputra Hardiono', '', '', null, '1', '', '0', '5', '1', 'L', '', '2006-10-12', '', '0', '0.0', '0.0', '', '', 'Margono Wongso P // Indahwati', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('276', 'PMB2014150276', null, 'Hellen Septiani Jap', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-09-08', '', '0', '0.0', '0.0', '', '', 'Lebak Arum IV / 23', '', '3890105', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('277', 'PMB2014150277', null, 'Jennifer Quinn Santoso', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-04-22', '', '0', '0.0', '0.0', '', '', 'Delta Raya Utara 76, Sda', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('278', 'PMB2014150278', null, 'Jonathan Efant Soeharto', '', '', null, '1', '', '0', '0', '1', 'L', 'Surabaya', '2006-02-22', '', '0', '0.0', '0.0', '', '', 'Kutisari Indah Utara III/20', '', '8433325', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('279', 'PMB2014150279', null, 'Nicholas Zhu', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-06-10', '', '0', '0.0', '0.0', '', '', 'Pantai Mentari WW-19', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('280', 'PMB2014150280', null, 'Oeitian Verrel Ignatius', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-04-12', '', '0', '0.0', '0.0', '', '', 'Apt. Marina Lt.11-2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('281', 'PMB2014150281', null, 'Richelle Stephanie Notohadipuro', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-06-08', '', '0', '0.0', '0.0', '', '', 'Siw Notohadipuro // Lim Agnes', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('282', 'PMB2014150282', null, 'Thea Guntur Kusumanagara', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-08-18', '', '0', '0.0', '0.0', '', '', 'Putra Bangsa II/63 Medokan Ayu', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('283', 'PMB2015150191', null, 'Abigail Shelina Lesmana', '', '', null, '1', '', '0', '5', '0', 'P', 'surabaya', '2011-04-12', '', '0', '0.0', '0.0', '', '', 'Jl. Pucang Sawit 58', '', '08155058228', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('284', 'PMB2014150283', null, 'Yenlung Calvin Tanusa', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2006-10-16', '', '0', '0.0', '0.0', '', '', 'Raya Panjang Jiwo Permai 42', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('285', 'PMB2014150285', null, 'Yoel Camilo Febriyanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-02-22', '', '0', '0.0', '0.0', '', '', 'Bumi Marina Emas Barat V/34', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('286', 'PMB2014150286', null, 'Adeline Theodora', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-11-10', '', '0', '0.0', '0.0', '', '', 'Baruk Barat 3/ B 123', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('287', 'PMB2014150287', null, 'Bianca Rosarie Ong', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-12-14', '', '0', '0.0', '0.0', '', '', 'Laguna Regency D7/10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('288', 'PMB2014150288', null, 'Cynthia Tjahyadi', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-11-25', '', '0', '0.0', '0.0', '', '', 'Jimbaran G1/ 24', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('289', 'PMB2014150289', null, 'Daniel Gunawan', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2005-01-01', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu II/O-18', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('290', 'PMB2014150290', null, 'Elvina Waskita Siemjaya', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-12-04', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu MA I Blok O-39', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('291', 'PMB2014150291', null, 'Gwynne Purnama', '', '', null, '1', '', '0', '5', '1', 'P', '', '2005-09-02', '', '0', '0.0', '0.0', '', '', 'Rk Panji Makmur D-10, Jl. Panj. Jiwo 46', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('292', 'PMB2014150292', null, 'Jason Johanes Siwabessi', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-11-01', '', '0', '0.0', '0.0', '', '', 'Rajawali 53, Rewin', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('294', 'PMB2014150293', null, 'Jeremy Philip Dewanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-11-12', '', '0', '0.0', '0.0', '', '', 'Galaxi Bumi Permai K3/ 2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('295', 'PMB2014150295', null, 'Jesselyn Christabel Thomas', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-06-29', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Timur VI / 67', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('296', 'PMB2014150296', null, 'Joel Wilson', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2009-05-08', '', '0', '0.0', '0.0', '', '', 'Ambengan 58', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('297', 'PMB2014150297', null, 'Kenneth Sujayaputera', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-04-07', '', '0', '0.0', '0.0', '', '', 'Dharmahusada Mas BB-17', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('298', 'PMB2014150298', null, 'Maedeline Jane Gotama', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-07-04', '', '0', '0.0', '0.0', '', '', 'Purimas Regency B5/6, Rungk. Madya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('299', 'PMB2014150299', null, 'Melvern Yeremiah Hartono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-07-03', '', '0', '0.0', '0.0', '', '', 'Rungkut Asri Barat V/7', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('300', 'PMB2014150300', null, 'Mikhael Christalio', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-11-26', '', '0', '0.0', '0.0', '', '', 'Kutisari Indah Sel. IV/28', '', '8434929', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('301', 'PMB2014150301', null, 'Samuel Abie Maximus', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2005-01-03', '', '0', '0.0', '0.0', '', '', 'Galaxi Bumi Permai TG 2/ 17', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('302', 'PMB2014150302', null, 'Tiffany Gracita', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-12-06', '', '0', '0.0', '0.0', '', '', 'Graha Tirta Akasia 95 Waru', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('303', 'PMB2014150303', null, 'Andi Cahya Santosa', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-07-19', '', '0', '0.0', '0.0', '', '', 'Rungkut Mapan Tim. IX/ EI - 18', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('304', 'PMB2014150304', null, 'Ayaka Angela', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-09-12', '', '0', '0.0', '0.0', '', '', 'Klampis harapan 3/ 14', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('305', 'PMB2014150305', null, 'Christabelle Serafina', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-12-05', '', '0', '0.0', '0.0', '', '', 'Jemursari XVIII/A-26 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('306', 'PMB2014150306', null, 'Clement Clint Santoso', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-11-02', '', '0', '0.0', '0.0', '', '', 'Delta Raya Ut. 76, Sda', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('307', 'PMB2014150307', null, 'Clifford Hans Gotama', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-08-20', '', '0', '0.0', '0.0', '', '', 'Purimas Regency B5/6, Rungk. Madya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('308', 'PMB2014150308', null, 'Cliffton Faith', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-10-17', '', '0', '0.0', '0.0', '', '', 'Galaxi Bumi Permai N4/25', '', '5927200', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('309', 'PMB2014150309', null, 'Debrina Tanesya Jovanka', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2003-12-02', '', '0', '0.0', '0.0', '', '', 'Taman Wisata Tropodo F-10', '', '8672169', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('310', 'PMB2014150310', null, 'Faustine Janice Kohar', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-06-18', '', '0', '0.0', '0.0', '', '', 'Kedung Tarukan 118', '', '5936127', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('311', 'PMB2014150311', null, 'Ferdinand Nathan Soetedjo', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2004-09-04', '', '0', '0.0', '0.0', '', '', 'Puri Mas Jl. Pecatu E II / 12', '', '8781437', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('312', 'PMB2014150312', null, 'Gracelyne Christabel Halim', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-05-25', '', '0', '0.0', '0.0', '', '', 'Mulyosari I/161', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('313', 'PMB2014150313', null, 'Joel Bezaliel Santoso', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-10-21', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('314', 'PMB2014150314', null, 'John Felix Wihelmus', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-08-28', '', '0', '0.0', '0.0', '', '', 'Nanas Utara I / 30 PCI', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('315', 'PMB2014150315', null, 'Kenneshia Aeriel Haryanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-05-26', '', '0', '0.0', '0.0', '', '', 'Kutisari Indah Ut. 4/ 63', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('316', 'PMB2014150316', null, 'Kenny Robin Limanjaya', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2004-10-19', '', '0', '0.0', '0.0', '', '', 'Barata Jaya XV/ 10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('317', 'PMB2015150284', null, 'Richie Calvin Zhuang', '', '', null, '1', '', '0', '0', '0', 'L', '', '2011-03-24', '', '0', '0.0', '0.0', '', '', 'Jl. Mangga 2/E-253 Pondok Tjandra', '', '085731392841', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('318', 'PMB2015150318', null, 'Jacob Heavenson', '', '', null, '1', '', '0', '0', '0', 'L', '', '2009-12-31', '', '0', '0.0', '0.0', '', '', '', '', '085755208888', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('319', 'PMB2014150317', null, 'Sean Francis Xavier Kho', '', '', null, '1', '', '0', '4', '1', 'L', 'Australia', '2003-12-03', '', '0', '0.0', '0.0', '', '', 'Jemur Sari 181', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('320', 'PMB2014150320', null, 'Stephanie Abiel Wibisono', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-10-20', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu,Blok MA 3/O5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('321', 'PMB2014150321', null, 'Yuhwa Evelyn Tanusa', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2004-09-22', '', '0', '0.0', '0.0', '', '', 'Raya Panjang Jiwo Permai 42', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('322', 'PMB2014150322', null, 'Brian Errando Limanjaya', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2003-03-10', '', '0', '0.0', '0.0', '', '', 'Barata Jaya XV/ 10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('323', 'PMB2014150323', null, 'Esther Ann Tanudiredja', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-05-04', '', '0', '0.0', '0.0', '', '', 'Ambengan 58', '', '5343088', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('324', 'PMB2014150324', null, 'Evan Waskita Siemjaya', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2002-11-26', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu I/ O-39', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('325', 'PMB2014150325', null, 'Feliciana Wihelmus', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-02-12', '', '0', '0.0', '0.0', '', '', 'Nanas Utara I / 30 PCI', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('326', 'PMB2014150326', null, 'Henry Ryan Hartono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-06-18', '', '0', '0.0', '0.0', '', '', 'Rungkut Asri Barat V/7', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('327', 'PMB2014150327', null, 'Kristoforus Stanley Tjahya Kusuma', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-11-01', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Barat C4/ 22', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('328', 'PMB2014150328', null, 'Luisa Angela Hadi', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2003-07-10', '', '0', '0.0', '0.0', '', '', 'Wonorejo Permai Sel. V-2 / CC-387', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('329', 'PMB2014150329', null, 'Nichole Yang', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-06-06', '', '0', '0.0', '0.0', '', '', 'Pondok Mutiara J-4 Sda.', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('330', 'PMB2014150330', null, 'Odilia Irene', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-02-26', '', '0', '0.0', '0.0', '', '', 'Kutisari XII A / 4', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('331', 'PMB2014150331', null, 'Winston Sujayaputera', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-07-29', '', '0', '0.0', '0.0', '', '', 'Dharmahusada Mas BB-17', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('332', 'PMB2015150319', null, 'Ethan Nathanael Indrawan', '', '', null, '1', '', '0', '0', '0', 'L', '', '2010-12-30', '', '0', '0.0', '0.0', '', '', '', '', '08165432980', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('337', 'PMB2014150294', null, 'Aaron Elliot Tandra (Aaron)', '', '', null, '1', '', '0', '4', '0', 'L', 'Jakarta', '2008-10-13', '', '0', '0.0', '0.0', '', '', 'Graha Family C-60', '', '03134022088', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('338', 'PMB2014150338', null, 'Allen Wijaya Alie (Allen)', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-10-19', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 6 JN No. 5', '', '0317318668', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('339', 'PMB2014150339', null, 'Calista Gracious Susanto (Calista)', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-07-13', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas C1 / 8', '', '0317527285', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('340', 'PMB2014150340', null, 'Chelsey Felicia Sugianto (Chelsey)', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-02-18', '', '0', '0.0', '0.0', '', '', 'Satelit Timur II Blok JJ 11-12', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('341', 'PMB2014150341', null, 'Christopher Njoto Imanuel (Christopher)', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-12-25', '', '0', '0.0', '0.0', '', '', 'Petemon I/97', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('342', 'PMB2014150342', null, 'David Anderson Wistorohardjo (David)', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2007-12-28', '', '0', '0.0', '0.0', '', '', 'Kupang Baru I/99', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('343', 'PMB2014150343', null, 'Emily Yongnardi (Emmy)', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2008-02-12', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Timur G-59', '', '0317311149', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('344', 'PMB2014150344', null, 'Fidelia Theodore Chang (Fidelia)', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2008-03-12', '', '0', '0.0', '0.0', '', '', 'Darmo Hill Blok P-12', '', '0315636338', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('345', 'PMB2014150345', null, 'Filbert Wellington (Filbert)', '', '', null, '1', '', '0', '1', '0', 'L', 'Surabaya', '2008-05-14', '', '0', '0.0', '0.0', '', '', 'The Mansion PF-5/22', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('346', 'PMB2014150332', null, 'Richard Kurniawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-06-26', '', '0', '0.0', '0.0', '', '', 'Kutisari XII A / 4', '', '8482969', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('351', 'PMB2014150346', null, 'Aida Estella Budiyono', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2002-03-12', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas B7/2', '', '7534507', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('352', 'PMB2014150352', null, 'Angela Joan Parmenas', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-09-24', '', '0', '0.0', '0.0', '', '', 'Sukomanunggal Jaya XI/XL 25, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('353', 'PMB2014150353', null, 'Bryan Nathaniel Santoso', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-02-03', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat IX/23 Surabaya', '', '7315904', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('354', 'PMB2014150354', null, 'Cathlin Valerie', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-08-27', '', '0', '0.0', '0.0', '', '', 'Taman Gapura E1/39 Surabaya', '', '7457111', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('355', 'PMB2014150355', null, 'Christopher Gunarto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-01-09', '', '0', '0.0', '0.0', '', '', 'Taman Darmo Harapan EG-2, Surabaya', '', '7324861', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('356', 'PMB2014150356', null, 'Darren Boesono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-07-28', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah VBR 1, PC3-12 Sby', '', '7391975', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('357', 'PMB2014150357', null, 'David Deandre', '', '', null, '1', '', '0', '5', '1', 'L', 'Palembang', '2002-12-20', '', '0', '0.0', '0.0', '', '', 'Jl. Darmo Baru Barat XI/16 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('358', 'PMB2014150358', null, 'Eric Tedja', '', '', null, '1', '', '0', '4', '1', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', 'Raya Bima Sakti GS-37B THS, Surabaya', '', '7345510', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('359', 'PMB2014150359', null, 'Felix Ricardo Thuatja', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2002-06-07', '', '0', '0.0', '0.0', '', '', 'Ngagel 17 RK 12A, Surabaya', '', '5014438', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('361', 'PMB2014150360', null, 'Hongjoe Hartono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-08-25', '', '0', '0.0', '0.0', '', '', 'Permata Safira B1/3 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('362', 'PMB2014150362', null, 'Ivana Tejokusumo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-11-12', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat I / 34 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('363', 'PMB2014150363', null, 'Jonathan Tejakusuma', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-01-07', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah AT 4/16 Surabaya', '', '7523311', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('364', 'PMB2014150364', null, 'Julianne Annabelle', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-06-24', '', '0', '0.0', '0.0', '', '', 'Graha Famili O-101-A Surabaya', '', '5620263', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('365', 'PMB2014150365', null, 'Katarina Kartika', '', '', null, '1', '', '0', '0', '1', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('366', 'PMB2014150366', null, 'Kent Keitaro Chandra', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-04-30', '', '0', '0.0', '0.0', '', '', 'Puri Sentra Raya PS 1/37, Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('367', 'PMB2014150367', null, 'Martinus Yudha', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2001-11-07', '', '0', '0.0', '0.0', '', '', 'Puri Sentra Raya EXT PS 1-50 Q ,Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('368', 'PMB2014150368', null, 'Maximillian Donovan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-01-26', '', '0', '0.0', '0.0', '', '', 'Vila Taman Telaga TJ 2/52, Surabaya', '', '7443444', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('369', 'PMB2014150369', null, 'Michael Christopher Jerrel', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-02-25', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat XI/II Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('370', 'PMB2014150370', null, 'Stanley Sigit', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-06-16', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah ATL-23 Surabaya', '', '7535518', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('371', 'PMB2014150371', null, 'Wilson Tjowanta', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-02-17', '', '0', '0.0', '0.0', '', '', 'Pakis Bukit Asoka R-18, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('372', 'PMB2014150372', null, 'Audrey Thoenie Pangestu', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-04-13', '', '0', '0.0', '0.0', '', '', 'Simp. Darmo Permai Sel XIX/23 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('373', 'PMB2014150373', null, 'Eldon Wijaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabya', '2002-12-27', '', '0', '0.0', '0.0', '', '', 'Gemblongan 4/8 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('374', 'PMB2014150374', null, 'Christian Tjandra', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-07-10', '', '0', '0.0', '0.0', '', '', 'Dukuh Kupang XXX/14,Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('375', 'PMB2014150375', null, 'Gavin Owen Susanto', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-01-09', '', '0', '0.0', '0.0', '', '', 'Petemon 3/139 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('376', 'PMB2014150376', null, 'Gerry William Sunaryo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-02-06', '', '0', '0.0', '0.0', '', '', 'Delta Raya Selatan No.15, Sidoarjo', '', '8552106', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('377', 'PMB2014150377', null, 'Hansen Lienardi', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-12-20', '', '0', '0.0', '0.0', '', '', 'Kupang Indah XI / 11B Surabaya', '', '0317326978', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('378', 'PMB2014150378', null, 'Henson Edward Hidayat', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-08-20', '', '0', '0.0', '0.0', '', '', 'Graha Family A-8', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('379', 'PMB2014150379', null, 'Herman Albert Dimaclid Sionosa', '', '', null, '1', '', '0', '5', '1', 'L', 'Filipina', '2002-01-23', '', '0', '0.0', '0.0', '', '', 'Apartemen Puncak Permai Tower B, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('380', 'PMB2014150380', null, 'Isabel Felicia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-02-02', '', '0', '0.0', '0.0', '', '', 'Rafles Garden TB XII/35, Surabaya', '', '7400643', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('381', 'PMB2014150381', null, 'Jason Claudio Salim', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-06-26', '', '0', '0.0', '0.0', '', '', 'Anjasmoro 34 Surabaya', '', '8416130', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('382', 'PMB2014150382', null, 'Jefferson Soewargo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-04-06', '', '0', '0.0', '0.0', '', '', 'Royal Park TL IV/23 Citraland, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('383', 'PMB2014150383', null, 'Jennifer', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-07-27', '', '0', '0.0', '0.0', '', '', 'Graha Famili FF-29, Surabaya', '', '7535449', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('384', 'PMB2014150384', null, 'Justin Andrew Wijaya', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-06-26', '', '0', '0.0', '0.0', '', '', 'Kupang Indah XII/7 Surabaya', '', '0317326867', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('385', 'PMB2014150385', null, 'Marissa Gabrielle', '', '', null, '1', '', '0', '0', '1', 'P', 'Surabaya', '2001-12-19', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Regensi 2 Blok PD 2 No.30 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('386', 'PMB2014150386', null, 'Matthew Julian Santoso', '', '', null, '1', '', '0', '5', '1', 'L', 'Malang', '2002-07-17', '', '0', '0.0', '0.0', '', '', 'Panglima Sudirman 67 Gresik', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('387', 'PMB2014150387', null, 'Michael Abdi Wangi', '', '', null, '1', '', '0', '5', '1', 'L', 'Denpasar', '2002-05-31', '', '0', '0.0', '0.0', '', '', 'Bukit Palma K4/23, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('388', 'PMB2014150388', null, 'Michael Brandon', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-01-30', '', '0', '0.0', '0.0', '', '', 'Raya Simogunung 6A, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('389', 'PMB2014150389', null, 'Patricia Aiko', '', '', null, '1', '', '0', '5', '1', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', 'Dukuh Kupang Barat TA/6 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('390', 'PMB2014150390', null, 'Samuel Susanto', '', '', null, '1', '', '0', '0', '1', 'L', '', '2002-12-19', '', '0', '0.0', '0.0', '', '', 'Yupiter B5/15', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('391', 'PMB2014150391', null, 'Vincent Ariel Tju', '', '', null, '1', '', '0', '5', '1', 'L', 'Kediri', '2002-08-29', '', '0', '0.0', '0.0', '', '', 'Taman Gapura F1/11 Surabaya', '', '7451096', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('392', 'PMB2014150347', null, 'Angeline Vincentia Danyo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-04-15', '', '0', '0.0', '0.0', '', '', 'Manyar Jaya XI/ 17', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('393', 'PMB2014150393', null, 'Celine Gunawan', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2002-03-17', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu II/O-18', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('394', 'PMB2014150394', null, 'Christopher Faith', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-03-27', '', '0', '0.0', '0.0', '', '', 'Galaxi Bumi Permai N4/25', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('395', 'PMB2014150395', null, 'Christovan Chi', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-02-20', '', '0', '0.0', '0.0', '', '', 'Wonorejo Permai Timur I/67 (EE-229)', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('396', 'PMB2014150396', null, 'Daniel Matthew', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-08-05', '', '0', '0.0', '0.0', '', '', 'Klampis Indah III/ 30 C-14', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('397', 'PMB2014150397', null, 'Filbert Karsten Thomas', '', '', null, '1', '', '0', '5', '1', 'L', 'Jakarta', '2002-02-28', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Timur VI / 67', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('398', 'PMB2014150398', null, 'Gabriella Theodora', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-09-12', '', '0', '0.0', '0.0', '', '', 'Gading Pantai 29', '', '3898932', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('399', 'PMB2014150399', null, 'Gerald Chandra Tedjakusuma', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-03-07', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu III E - 10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('400', 'PMB2014150400', null, 'Jonathan James Dewanto', '', '', null, '1', '', '0', '5', '1', 'L', 'New York', '2002-07-08', '', '0', '0.0', '0.0', '', '', 'Galaxi Bumi Permai K3/ 2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('401', 'PMB2014150401', null, 'Michelin Andre', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-05-16', '', '0', '0.0', '0.0', '', '', 'Raya Sedati Gede 81', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('402', 'PMB2014150402', null, 'Phoebe Purnama', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-11-03', '', '0', '0.0', '0.0', '', '', 'Rk Panji Makmur D-10, Jl. Panj. Jiwo 46', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('403', 'PMB2014150392', null, 'Adrian Rizaldy Hoemisch', '', '', null, '1', '', '0', '3', '1', 'L', 'Surabaya', '2001-12-19', '', '0', '0.0', '0.0', '', '', 'Perum Delta Sari Baru Jl. Delta Raya Utara No.88 SDA', '', '70329324', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('404', 'PMB2014150404', null, 'Agnes Daniella', '', '', null, '1', '', '0', '0', '1', 'L', 'Surabaya', '2001-03-02', '', '0', '0.0', '0.0', '', '', 'Jajar Tunggal Selatan V/O-9 Surabaya', '', '7313489', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('405', 'PMB2014150405', null, 'Angeline Sugiarto', '', '', null, '1', '', '0', '0', '1', 'P', 'USA', '2001-10-13', '', '0', '0.0', '0.0', '', '', 'Villa Valencia PA 7/47 Surabaya', '', '7329580', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('406', 'PMB2014150406', null, 'Christopher Rayner Halim', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-10-04', '', '0', '0.0', '0.0', '', '', 'Gedung Nasional No.11 Surabaya', '', '5310687', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('407', 'PMB2014150407', null, 'Christy', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2001-01-25', '', '0', '0.0', '0.0', '', '', 'Dupak 17 Ruko Pasifik Megak Blok D-5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('408', 'PMB2014150408', null, 'Dylan Gregory', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2001-08-18', '', '0', '0.0', '0.0', '', '', 'Taman Puspa Raya B 8/9 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('409', 'PMB2014150409', null, 'Gebryella Natasya Prayogo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-11-14', '', '0', '0.0', '0.0', '', '', 'Kapasari V/16, Surabaya', '', '7520099', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('410', 'PMB2014150410', null, 'Irene Belinda', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-01-31', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Regency 3 PE 13 No.9 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('411', 'PMB2014150411', null, 'Jason Yaputra', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-07-18', '', '0', '0.0', '0.0', '', '', 'Pakis Tirtosari 15/5 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('412', 'PMB2014150412', null, 'Josephine Michelle Chang', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-10-30', '', '0', '0.0', '0.0', '', '', 'Darmo Hills Blok P-12 Surabaya', '', '636338', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('413', 'PMB2014150413', null, 'Kenneth Nathanael Thenios', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-10-13', '', '0', '0.0', '0.0', '', '', 'Wonokitri Indah A-15, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('414', 'PMB2014150414', null, 'Michelle Hernandez', '', '', null, '1', '', '0', '5', '1', 'P', 'Malang', '2001-07-30', '', '0', '0.0', '0.0', '', '', 'Petemon Timur 120 Surabaya', '', '5351805', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('415', 'PMB2014150415', null, 'Vanessa Liem', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-11-13', '', '0', '0.0', '0.0', '', '', 'Sepanjang Town Haouse C 15-16 SDA', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('416', 'PMB2014150416', null, 'Vondrea Cassey Andoko', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2001-09-12', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah TX-15 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('417', 'PMB2014150417', null, 'Christopher Louis', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-12-03', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah AA-2 Surabaya', '', '70310768', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('418', 'PMB2014150418', null, 'Giselle Angelique', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2000-03-28', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Mas Mediterian K-8 SBY', '', '70310768', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('419', 'PMB2014150419', null, 'Hilary', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2001-09-21', '', '0', '0.0', '0.0', '', '', 'Dupak 17 Blok B9 Surabaya', '', '7091183', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('420', 'PMB2014150420', null, 'Jade Vanessa Pangkey', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-03-02', '', '0', '0.0', '0.0', '', '', 'Griya Babatan Mukti M-76 Surabaya', '', '7530210', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('421', 'PMB2014150421', null, 'Jason Tanujaya', '', '', null, '1', '', '0', '0', '1', 'L', 'Jakarta', '2001-11-20', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Regensi 3 PE 8/26 SBY', '', '7391671', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('422', 'PMB2014150422', null, 'Kelvin Williams', '', '', null, '1', '', '0', '1', '1', 'L', 'Denpasar', '2001-07-09', '', '0', '0.0', '0.0', '', '', 'The Mansion PF-5/22 Pakuwon Indah', '', '7391671', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('423', 'PMB2014150423', null, 'Kezia Ratih Puspaningrum K.F', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-02-23', '', '0', '0.0', '0.0', '', '', 'Tengger Kendangan 19/3 Sby', '', '70867222', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('424', 'PMB2014150424', null, 'Michelle Yang', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2001-04-07', '', '0', '0.0', '0.0', '', '', 'Jl. Semarang 106 B Blok A-18 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('425', 'PMB2014150425', null, 'Monica Gabriela', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2001-08-13', '', '0', '0.0', '0.0', '', '', 'Taman International I Blok C-1/21 SBY', '', '71205898', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('426', 'PMB2014150426', null, 'Natalie Julianto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-12-10', '', '0', '0.0', '0.0', '', '', 'Darmo Hill Blok L-21A Surabaya', '', '70912379', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('427', 'PMB2014150427', null, 'Nathanael Ray Samuel', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-03-19', '', '0', '0.0', '0.0', '', '', 'Dukuh Kupang Barat TA/6 Surabaya', '', '70976447', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('428', 'PMB2014150428', null, 'Nicholas Matthew', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-12-10', '', '0', '0.0', '0.0', '', '', 'Bukit Darmo Golf Regency D-10 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('429', 'PMB2014150429', null, 'Verren Violeta', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-04-25', '', '0', '0.0', '0.0', '', '', 'Petemon Barat 96 Surabaya', '', '5320496', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('430', 'PMB2014150430', null, 'Vienna Augusta', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-08-08', '', '0', '0.0', '0.0', '', '', 'Dharmahusada Indah Utara U-12 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('431', 'PMB2014150403', null, 'Anderson Siswanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-06-23', '', '0', '0.0', '0.0', '', '', 'Baruk Barat IX / A-92, Surabaya', '', '71128007', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('432', 'PMB2014150432', null, 'Aveles', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-11-11', '', '0', '0.0', '0.0', '', '', 'Kalirungkut 27 / C-55, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('433', 'PMB2014150433', null, 'Clive Marvelous', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-09-28', '', '0', '0.0', '0.0', '', '', 'Nelayan 32, Surabaya', '', '3539609', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('434', 'PMB2014150434', null, 'Graciella Theoderus', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-03-07', '', '0', '0.0', '0.0', '', '', 'Baruk Barat 3 / B-123, Surabaya', '', '8709153', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('435', 'PMB2014150435', null, 'Indradi Lukman', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-04-30', '', '0', '0.0', '0.0', '', '', 'Rungkut Mapan Timur IXEl-12, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('436', 'PMB2014150436', null, 'Irvin Kalevi Limanjaya', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2001-09-01', '', '0', '0.0', '0.0', '', '', 'Barata Jaya XV / 10, Surabaya', '', '5045203', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('437', 'PMB2014150437', null, 'Natasya Anindita', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-05-05', '', '0', '0.0', '0.0', '', '', 'Manyar Tirtomoyo 3/14, Surabaya', '', '5940713', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('438', 'PMB2014150431', null, 'Jesslyn Antoinette Sutandyo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-11-25', '', '0', '0.0', '0.0', '', '', 'Dukuh Kupang Barat VII/28 Surabaya', '', '5621891', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('439', 'PMB2014150439', null, 'Shiela Sutanto', '', '', null, '1', '', '0', '0', '0', 'P', 'Surabaya', '0000-09-20', '', '0', '0.0', '0.0', '', '', 'Taman Hunian Satelit Yupiter BS 15, SBY', '', '7328360', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('441', 'PMB2014150438', null, 'Philia Disca', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-09-10', '', '0', '0.0', '0.0', '', '', 'Bendul Merisi Sel VI/7, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('442', 'PMB2014150442', null, 'Ricky Kurniawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-12-29', '', '0', '0.0', '0.0', '', '', 'Kutisari XII A/6, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('443', 'PMB2014150443', null, 'Steven Andre Saputra', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-03-20', '', '0', '0.0', '0.0', '', '', 'Raya Sedati Gede, Waru-Sidoarjo', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('444', 'PMB2014150440', null, 'Shiela Sutanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2001-09-20', '', '0', '0.0', '0.0', '', '', 'Taman Hunian Satelit Yupiter BS 15, SBY', '', '7328360', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('449', 'PMB2014150445', null, 'Bryan Andrew Wijaya', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2000-08-31', '', '0', '0.0', '0.0', '', '', 'Kupang Indah XII/7 Surabaya', '', '7326867', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('450', 'PMB2014150450', null, 'Bryan Nicklaus Soesanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-12-09', '', '0', '0.0', '0.0', '', '', 'Graha Family N-155 Surabaya', '', '7325666', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('451', 'PMB2014150451', null, 'Dean Gracious', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2000-03-10', '', '0', '0.0', '0.0', '', '', 'Citra Harmony G4/18 Sidoarjo', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('452', 'PMB2014150452', null, 'Emeris', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2000-10-02', '', '0', '0.0', '0.0', '', '', 'Pondok Wiyung Indah Timur III-35 Blok NX-13', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('453', 'PMB2014150453', null, 'Felecia Gunawan', '', '', null, '1', '', '0', '4', '1', 'P', 'Sidoarjo', '2000-09-20', '', '0', '0.0', '0.0', '', '', 'Jenggolo II No.2 Sidoarjo', '', '8921408', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('454', 'PMB2014150454', null, 'Fontana Hadisurya Suhandinata', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2000-09-08', '', '0', '0.0', '0.0', '', '', 'Wonokitri Indah A 12 Surabaya', '', '5673105', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('455', 'PMB2014150455', null, 'Hanssen Budisantoso Wijaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-09-10', '', '0', '0.0', '0.0', '', '', 'Satelit Utara 6/IT 17 Surabaya', '', '7317395', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('456', 'PMB2014150456', null, 'Jessica Levina', '', '', null, '1', '', '0', '0', '1', 'P', 'Surabaya', '2000-11-18', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Mas Monaco TB 14 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('458', 'PMB2014150457', null, 'Joshua Chang', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-07-21', '', '0', '0.0', '0.0', '', '', 'Jl.Kendangsari Blok M-10 Sby', '', '72576248', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('460', 'PMB2014150459', null, 'Julio Erson Chuanardi', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2000-07-14', '', '0', '0.0', '0.0', '', '', 'Puri Widya Kencana J3-10 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('462', 'PMB2014150461', null, 'Kevin Ferdinand', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2000-08-18', '', '0', '0.0', '0.0', '', '', 'Jl. Dupak 72 Surabaya', '', '70616958', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('463', 'PMB2014150463', null, 'Neysa Winaldo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-04-09', '', '0', '0.0', '0.0', '', '', 'Jl. Tanjung Sari Baru 4/21 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('465', 'PMB2014150464', null, 'Allen Wijaya Alie', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-10-19', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 6 JN No. 5', '', '0317318668', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('467', 'PMB2014150466', null, 'Richard Theofilus Pangestu', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-12-13', '', '0', '0.0', '0.0', '', '', 'Simpang Darmo Permai Selatan 19/23', '', '7344810', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('469', 'PMB2014150468', null, 'Shienny Hartanto', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2000-11-01', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Timur IV/32, Surabaya', '', '7318787', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('471', 'PMB2014150470', null, 'Brandon Jordania Putra Liyanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Manado', '1999-12-27', '', '0', '0.0', '0.0', '', '', 'Raya Satelit Utara BT-23 SBY', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('472', 'PMB2014150472', null, 'Edwina Aurelia Saksana', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-03-24', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Timur M-24 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('473', 'PMB2014150473', null, 'Elita Stacia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-09-18', '', '0', '0.0', '0.0', '', '', 'Raya Gilang 70 Sda / Wiyung Indah I/B', '', '7882908', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('474', 'PMB2014150474', null, 'Fia Sabrina Boedijono', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-09-01', '', '0', '0.0', '0.0', '', '', 'Taman Satelit Timur QQ-28, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('475', 'PMB2014150475', null, 'Gabrielle Angelica', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-08-10', '', '0', '0.0', '0.0', '', '', 'Kondominium Graha Famili PB 704 Sby', '', '77770577', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('476', 'PMB2014150476', null, 'Hans Sebastian Mulyawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-05-20', '', '0', '0.0', '0.0', '', '', '', '', '13950', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('477', 'PMB2014150477', null, 'Joseph Ervan Nathanael', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-09-06', '', '0', '0.0', '0.0', '', '', 'Puri Lidah Kulon Indah B no.27 Surabaya', '', '7526457', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('478', 'PMB2014150478', null, 'Nicholas Valentino Gumulia', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2000-07-10', '', '0', '0.0', '0.0', '', '', 'Royal Residence C 02/15 Surabaya', '', '83981428', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('479', 'PMB2014150479', null, 'Ray Chandrakesuma', '', '', null, '1', '', '0', '4', '1', 'L', 'Jakarta', '2000-10-10', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan I/32', '', '71118008', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('480', 'PMB2014150480', null, 'Tania Alverina Djayanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-08-20', '', '0', '0.0', '0.0', '', '', 'Jl. Lidah Bukit Mas Brat XII C6-02 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('481', 'PMB2014150481', null, 'Vania Aurellia Wijaya', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2000-09-15', '', '0', '0.0', '0.0', '', '', 'Jl.Pradah Permai III-16 Surabaya', '', '7341458', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('482', 'PMB2014150482', null, 'Wesley Evan Soegiarto', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2000-12-02', '', '0', '0.0', '0.0', '', '', 'Darmo Park I Blok 2B no 8-9 Sby', '', '7328965', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('483', 'PMB2014150483', null, 'Wincent Tanjaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-07-27', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan X/126, Surabaya', '', '7318765', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('484', 'PMB2014150484', null, 'Yoel Kristian Simanjaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-03-04', '', '0', '0.0', '0.0', '', '', 'Wisma Lidah Kulon A-43 Surabaya', '', '7532470', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('485', 'PMB2014150444', null, 'Angelina Siswanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '1999-12-31', '', '0', '0.0', '0.0', '', '', 'Baruk Barat IX/A-92 Surabaya', '', '8712368', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('486', 'PMB2014150486', null, 'Anthony Vincentius Danyo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-05-29', '', '0', '0.0', '0.0', '', '', 'Manyar Jaya Praja XI/ 17', '', '5948146', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('487', 'PMB2014150487', null, 'Argya Putra Ganiartha', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-04-18', '', '0', '0.0', '0.0', '', '', 'Jl. Nginden Intan Tim. 17/ 44', '', '70123442', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('488', 'PMB2014150488', null, 'Ethan Gunadi Angstrong', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2001-09-17', '', '0', '0.0', '0.0', '', '', 'Laguna Indah A2/7', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('489', 'PMB2014150489', null, 'Evelyn Gunawan', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2000-03-30', '', '0', '0.0', '0.0', '', '', 'Medokan Ayu II/O-18', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('490', 'PMB2014150490', null, 'Felicia Christy', '', '', null, '1', '', '0', '5', '1', 'P', 'Jakarta', '2000-10-20', '', '0', '0.0', '0.0', '', '', 'Nginden Intan Timur VI/67', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('491', 'PMB2014150491', null, 'Frederick William Sanjoto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2001-01-22', '', '0', '0.0', '0.0', '', '', 'Jl. Duku 6 CA 357', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('492', 'PMB2014150492', null, 'Hansel', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-11-04', '', '0', '0.0', '0.0', '', '', 'Kalirungkut 27/ C-55', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('493', 'PMB2014150493', null, 'Richard Andrew Santoso', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2000-08-09', '', '0', '0.0', '0.0', '', '', 'Raya Kali Rungkut 5/ J-16', '', '70818799', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('494', 'PMB2014150485', null, 'Alice Pricillya', '', '', null, '1', '', '0', '5', '1', 'L', 'Medan', '1999-10-20', '', '0', '0.0', '0.0', '', '', 'Sukomanunggal Jaya F/12, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('495', 'PMB2014150495', null, 'Amelia Fandrayani Lim', '', '', null, '1', '', '0', '0', '1', 'P', '', '1999-04-19', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('496', 'PMB2014150496', null, 'Christie Megawati Budiono', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '1999-09-23', '', '0', '0.0', '0.0', '', '', 'South Emerald Mansion TM2/10', '', '70903375', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('497', 'PMB2014150497', null, 'Inez Beatrice Wanamarta', '', '', null, '1', '', '0', '5', '1', 'P', 'Maastricht Belanda', '1999-07-09', '', '0', '0.0', '0.0', '', '', 'Bogowonto 3, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('498', 'PMB2014150498', null, 'Ivan Nathan Parmenas', '', '', null, '1', '', '0', '5', '1', 'L', 'Malang', '1999-02-23', '', '0', '0.0', '0.0', '', '', 'Sukomanunggal Jaya XI / XL 25, Sby', '', '7316202', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('499', 'PMB2014150499', null, 'Jason Immanuel Gabriel', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '1999-01-01', '', '0', '0.0', '0.0', '', '', 'Boulevard BDG-OP-B2/23 Sby', '', '7310013', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('500', 'PMB2014150500', null, 'Jason Pangkey', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '1999-07-30', '', '0', '0.0', '0.0', '', '', 'Griya Babatan Mukti M-76 Sby', '', '7530210', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('501', 'PMB2014150501', null, 'Jessica Setyono', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '1999-12-09', '', '0', '0.0', '0.0', '', '', 'Jl.Petemon Barat 204A, Sby', '', '5350851', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('502', 'PMB2014150502', null, 'Ken Chandrakesuma', '', '', null, '1', '', '0', '4', '1', 'L', 'Jakarta', '1999-02-07', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan I / 32, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('503', 'PMB2014150503', null, 'Laura Brigita Pangkey', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '1999-11-19', '', '0', '0.0', '0.0', '', '', 'Taman pondok Indah LY-2 Sby', '', '60050203', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('504', 'PMB2014150504', null, 'Natalya Lim', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2000-01-12', '', '0', '0.0', '0.0', '', '', 'Graha Famili Blok N-46, Sby', '', '7346683', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('505', 'PMB2014150505', null, 'Safira Antonia Goenawan', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '1999-08-19', '', '0', '0.0', '0.0', '', '', 'Darmo Park I 2C/9, Sby', '', '5667886', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('506', 'PMB2014150506', null, 'Thesalonica Shinta P.N.K.F', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '1999-12-21', '', '0', '0.0', '0.0', '', '', 'Tengger Kendangan 19/3 Sby', '', '70867222', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('507', 'PMB2014150507', null, 'Vincent Nicholas Katuari', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '1999-11-02', '', '0', '0.0', '0.0', '', '', 'Dharmahusada Indah Utara U-12, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('508', 'PMB2014150508', null, 'Wilson Philipe', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '1999-03-02', '', '0', '0.0', '0.0', '', '', 'Graha Famili PP-31, Sby', '', '7533366', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('509', 'PMB2014150509', null, 'Christina', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '1998-03-26', '', '0', '0.0', '0.0', '', '', 'Raya Gilang 70 Sda / Wiyung Indah I/B', '', '7882908', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('510', 'PMB2014150510', null, 'Darren Gracious', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '1997-11-08', '', '0', '0.0', '0.0', '', '', 'Citra Harmony G4/18 Sidoarjo', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('511', 'PMB2014150511', null, 'Edward Jehan Soetopo', '', '', null, '1', '', '0', '5', '1', 'L', 'Jakarta', '1998-11-15', '', '0', '0.0', '0.0', '', '', 'Komp. Bintang Diponggo Kav.754 SBY', '', '5663292', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('512', 'PMB2014150512', null, 'Enrico Soewandi', '', '', null, '1', '', '0', '0', '1', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('513', 'PMB2014150513', null, 'Ezra Joy Gunawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '1998-12-09', '', '0', '0.0', '0.0', '', '', 'Dupak 3-9 Blok A 12 SBY', '', '7314888', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('514', 'PMB2014150514', null, 'Gracielle Ganda', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '1998-02-06', '', '0', '0.0', '0.0', '', '', 'Graha Family N-47 SBY', '', '7385689', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('515', 'PMB2014150515', null, 'Hartanto Tanjung', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '1997-10-10', '', '0', '0.0', '0.0', '', '', 'Raya Darmo Permai II Darmo Green Garden C-6 Surabaya', '', '7317600', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('516', 'PMB2014150516', null, 'Jason Aditya Tjandra', '', '', null, '1', '', '0', '0', '1', 'L', '', '1998-01-21', '', '0', '0.0', '0.0', '', '', 'Kertajaya Indah VI/F-324', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('517', 'PMB2014150517', null, 'Matthew Christian', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '1997-10-16', '', '0', '0.0', '0.0', '', '', 'Raya Darmo Permai II/C-19 SBY', '', '5681896', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('518', 'PMB2014150518', null, 'Naveno Cendikiawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '1999-02-20', '', '0', '0.0', '0.0', '', '', 'Bratang Gede 101 SBY', '', '50466451', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('519', 'PMB2014150519', null, 'Vincenzio Evan Siemon', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '1999-10-13', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2 PD3/11 Pakuwon Indah SBY', '', '7391112', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('520', 'PMB2014150520', null, 'Williams Louis Aditya', '', '', null, '1', '', '0', '5', '1', 'L', 'Probolinggo', '1998-05-17', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Timur 4/27 Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('529', 'PMB2014150521', null, 'Aaron Elliot Tandra', '', '', null, '1', '', '0', '4', '1', 'L', 'Jakarta', '2008-10-18', '', '0', '0.0', '0.0', '', '', 'Graha Family C-60', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('530', 'PMB2014150530', null, 'Calista Gracious Susanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-07-13', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas C1 / 8', '', '0317527285', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('531', 'PMB2014150531', null, 'Christopher Njoto Imanuel', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-12-25', '', '0', '0.0', '0.0', '', '', 'Petemon I/97', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('532', 'PMB2014150532', null, 'David Anderson Wistorohardjo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-12-28', '', '0', '0.0', '0.0', '', '', 'Kupang Baru I/99', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('533', 'PMB2014150533', null, 'Emily Yongnardi', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-02-12', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Timur G-59', '', '0317311149', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('534', 'PMB2014150534', null, 'Fidelia Theodore Chang', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-03-12', '', '0', '0.0', '0.0', '', '', 'Darmo Hill Blok P-12', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('535', 'PMB2014150535', null, 'Filbert Wellington', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2008-05-14', '', '0', '0.0', '0.0', '', '', 'The Mansion PF-5/22', '', '0313577472', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('536', 'PMB2014150536', null, 'Gabrielle Grace', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-07-09', '', '0', '0.0', '0.0', '', '', 'Diamond Hill DR 5-6 Citraland', '', '0317458368', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('537', 'PMB2014150537', null, 'George Kennedy Kristanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-08-28', '', '0', '0.0', '0.0', '', '', 'Graha Family N-33', '', '0317340928', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('538', 'PMB2014150538', null, 'Gerald Deven Tejokusumo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-12-11', '', '0', '0.0', '0.0', '', '', 'Gajah Mada 203 Sda', '', '0318962977', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('539', 'PMB2014150539', null, 'Hansel Jornelle', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-10-28', '', '0', '0.0', '0.0', '', '', 'Kupang Baru 2 No. 25', '', '0317348815', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('540', 'PMB2014150540', null, 'Jeanette Soewargo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-02-08', '', '0', '0.0', '0.0', '', '', 'Royal Park TL IV/23 Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('541', 'PMB2014150541', null, 'Jenevieve Clairine Setiawan', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-02-14', '', '0', '0.0', '0.0', '', '', 'Taman Darmo Harapan II / EG - 11C', '', '0317317042', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('542', 'PMB2014150542', null, 'Jessica Johana Ponga', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-04-30', '', '0', '0.0', '0.0', '', '', 'Simo Mulyo Baru Blok 7i / 13', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('543', 'PMB2014150543', null, 'Joshua Alexander Kurt Kyriss', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-06-15', '', '0', '0.0', '0.0', '', '', 'Darmo Satelit Utara 3 Blok PT No.6', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('544', 'PMB2014150544', null, 'Kenneth Boesono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-03-18', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency PC 3 / 12 Pakuwon Indah', '', '0315031985', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('545', 'PMB2014150545', null, 'Kezia Rexana Lie', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-07-11', '', '0', '0.0', '0.0', '', '', 'Kupang Indah I / 36', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('546', 'PMB2014150546', null, 'Maggie Tse', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2008-12-24', '', '0', '0.0', '0.0', '', '', 'Manukan Tama 19-O/47', '', '03171983098', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('547', 'PMB2014150547', null, 'Sharon Alexandra Soempiet', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2009-01-09', '', '0', '0.0', '0.0', '', '', 'Royal Residence Balmoral B3-52A', '', '8687854', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('548', 'PMB2014150548', null, 'Yehezkiel Messi Jeremi Sianipar', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-04-26', '', '0', '0.0', '0.0', '', '', 'Silindri 12 HN 2 Kotabatu Driyorejo Gresik', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('549', 'PMB2014150549', null, 'Colin Cristo Harianto (Colin)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-01-19', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas II / Blok E3 No. 10', '', '0317530738', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('550', 'PMB2014150550', null, 'Emili Tricia Faustine (Mili)', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2008-05-15', '', '0', '0.0', '0.0', '', '', 'Kranggan No. 102 Kav.8', '', '0315340131', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('551', 'PMB2014150551', null, 'Engelbert Theophile Ho (Elbert)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-07-20', '', '0', '0.0', '0.0', '', '', 'Kencanasari Barat 7 / G.38', '', '03171019099', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('552', 'PMB2014150552', null, 'Evaldo Sukoco (Aldo)', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2007-11-10', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 3/KN 12 D', '', '0317318508', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('553', 'PMB2014150553', null, 'Ferlyne Gabrielly Thie (Ferlyne)', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2008-04-24', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah The Mansion PF 4 No. 8', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('554', 'PMB2014150554', null, 'Gabrielle Abigail Limpo (Bie Bie)', '', '', null, '1', '', '0', '5', '1', 'P', 'Melbourne Victoria', '2008-12-08', '', '0', '0.0', '0.0', '', '', 'Graha Family FF 32', '', '0317534174', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('555', 'PMB2014150555', null, 'Griffith Clairenova Wijaya (Griffith)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-09-22', '', '0', '0.0', '0.0', '', '', 'Graha Family Blok YY / No. 26', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('556', 'PMB2014150556', null, 'Hacken Wunadi (Hacken)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-09-07', '', '0', '0.0', '0.0', '', '', 'Graha Family R 179 A', '', '03131202033', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('557', 'PMB2014150557', null, 'Janice Valerie Judianto (Janice)', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2008-01-28', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah, One Golf Terrace AB 11/58', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('559', 'PMB2014150558', null, 'Jesslyn Olivia', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2008-10-05', '', '0', '0.0', '0.0', '', '', 'Royal Residence B 1/21A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('560', 'PMB2014150560', null, 'Kenzo Edward Setiawan (Kenzo)', '', '', null, '1', '', '0', '5', '0', 'L', 'Balikpapan', '2008-10-29', '', '0', '0.0', '0.0', '', '', 'Raffles Garden TB 10/24 Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('561', 'PMB2014150561', null, 'Lionel Edric Zhu (Lin-lin / Lio)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-07-28', '', '0', '0.0', '0.0', '', '', 'North Emerald Mansion TN 4/3', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('562', 'PMB2014150562', null, 'Louisa Angela Sutiono (Angela)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-12-10', '', '0', '0.0', '0.0', '', '', 'Graha Family H-38', '', '03170586993', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('563', 'PMB2014150563', null, 'Rafe Titan Hartono (Rafe)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-05-21', '', '0', '0.0', '0.0', '', '', 'Bintang Diponggo 757', '', '0315670925', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('564', 'PMB2014150564', null, 'Raziela Kelly Ali Harsanto (Kelly)', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2008-05-09', '', '0', '0.0', '0.0', '', '', 'Royal Residence B.10/93', '', '0315670925', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('565', 'PMB2014150565', null, 'Richelle Princess Liangkey (Richelle)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-03-29', '', '0', '0.0', '0.0', '', '', 'Darmo Hill M-22', '', '0315636157', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('566', 'PMB2014150566', null, 'Shane Andersen Tandiono (Shane)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-04-07', '', '0', '0.0', '0.0', '', '', 'Sukomanunggal Jaya 2/35', '', '0317341123', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('567', 'PMB2014150567', null, 'Tifannie Gabrielle Hadiwidjojo (Tifannie)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-05-08', '', '0', '0.0', '0.0', '', '', 'Kupang Indah 2 / 52', '', '0317315224', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('568', 'PMB2014150568', null, 'Wilbert Suryajaya Lim (Wilbert)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-11-16', '', '0', '0.0', '0.0', '', '', 'Satelit Utara VII/CT 14', '', '0317316226', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('569', 'PMB2014150569', null, 'Asthon Preston Young Sumarno (Asthon)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-02-28', '', '0', '0.0', '0.0', '', '', 'Petemon Timur No. 114', '', '0315313343', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('570', 'PMB2014150570', null, 'Beatrice Christilove Santoso (Beatrice)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-12-20', '', '0', '0.0', '0.0', '', '', 'Raya Manukan Wetan 32', '', '03170397737', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('571', 'PMB2014150571', null, 'Brandon Archer (Brandon)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-07-15', '', '0', '0.0', '0.0', '', '', 'Tanjungsari Baru 5 Blok GG 36', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('572', 'PMB2014150572', null, 'Claris Lievia (Claris)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-07-29', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas B2/5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('573', 'PMB2014150573', null, 'Ezekiel Shawn Wondo (Shawn)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-05-04', '', '0', '0.0', '0.0', '', '', 'Central Park A. Yani E/19', '', '0318272828', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('574', 'PMB2014150574', null, 'Felicia Clarissa Tanurijanto (Felice)', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2008-10-09', '', '0', '0.0', '0.0', '', '', 'Puri Sentra Raya PS 2/43 B Citraland', '', '0317440099', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('575', 'PMB2014150575', null, 'Ferdinand Christianto Thomas (Ferdinand)', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2008-02-10', '', '0', '0.0', '0.0', '', '', 'Raya Mastrip Kemlaten 26 B', '', '0317674122', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('576', 'PMB2014150576', null, 'Grace Caroline Cahyono (Grace)', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2008-07-12', '', '0', '0.0', '0.0', '', '', 'Mulyorejo Mega Asri 129', '', '0315964953', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('577', 'PMB2014150577', null, 'Jade Agung Handojo (Jade)', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2008-03-21', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan VI / EC-19', '', '0317346930', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('578', 'PMB2014150578', null, 'Jedidiah Budiman (Jedidiah)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-09-15', '', '0', '0.0', '0.0', '', '', 'Progo 8 Surabaya', '', '0315676572', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('579', 'PMB2014150579', null, 'Jerome Keane Lim (Jerome / Keane)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-07-05', '', '0', '0.0', '0.0', '', '', 'Chofa RE - 11', '', '0317325068', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('580', 'PMB2014150580', null, 'Jessica Beatricia (Jessica)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-02-02', '', '0', '0.0', '0.0', '', '', 'Rafles Garden TB XII/35', '', '0317400643', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('581', 'PMB2014150581', null, 'Josevine Angeline Musa (Josevine)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-04-02', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan 11 / 18', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('582', 'PMB2014150582', null, 'Keziah Lim (Kei)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-05-23', '', '0', '0.0', '0.0', '', '', 'Perum Graha Famili Blok N-46', '', '0317346683', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('583', 'PMB2014150583', null, 'Kiyora Asami Prasetya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-08-08', '', '0', '0.0', '0.0', '', '', 'Kertajaya Indah Regency A 25', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('584', 'PMB2014150584', null, 'Louis Chandoko (Louis)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-12-19', '', '0', '0.0', '0.0', '', '', 'Forest Mansion B-23', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('585', 'PMB2014150585', null, 'Michelle Tanaya (Michelle)', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2008-07-27', '', '0', '0.0', '0.0', '', '', 'Tulung Agung 3/6 Surabaya', '', '0315319420', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('586', 'PMB2014150586', null, 'Noel Nelsen Felix', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-01-02', '', '0', '0.0', '0.0', '', '', 'Perum Darmo Sentosa Raya Blok H-21', '', '0315684639', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('587', 'PMB2014150587', null, 'Patricia Michelle Rumoei (Patricia)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-04-01', '', '0', '0.0', '0.0', '', '', 'Simpang Darmo Permai Timur 2 / 2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('588', 'PMB2014150588', null, 'Scott Caleb Johar Gunawan (Scott)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2008-10-10', '', '0', '0.0', '0.0', '', '', 'Eastwood EW-9/17 Citraland', '', '03181831191', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('589', 'PMB2014150589', null, 'Verlyn Pangestoe (Verlyn)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-05-03', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 3 PE 10/30', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('590', 'PMB2014150590', null, 'Aldrich Kennan Sumargo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-06-25', '', '0', '0.0', '0.0', '', '', 'Sambongan III/10', '', '0313536106', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('591', 'PMB2014150591', null, 'Aurelia Mareta Koesno', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-03-20', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat 8/21', '', '0313573364', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('592', 'PMB2014150592', null, 'Bryan Aurelius Kho', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2007-04-24', '', '0', '0.0', '0.0', '', '', 'Kencana Sari Barat Blok G No. 6', '', '0315688355', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('593', 'PMB2014150593', null, 'Chen Xin E', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2007-03-24', '', '0', '0.0', '0.0', '', '', 'Royal Resindence C 1 No. 21', '', '0317913480', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('594', 'PMB2014150594', null, 'Christalin Maeko Sumarno', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-12-07', '', '0', '0.0', '0.0', '', '', 'Petemon Timur 112', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('595', 'PMB2014150595', null, 'Clarence Moeljadi Salim', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-11-02', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas Monaco TA-15', '', '0315615057', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('596', 'PMB2014150596', null, 'Dylan Matthew Tedjokoesoemo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-07-05', '', '0', '0.0', '0.0', '', '', 'Taman International I / FK-20', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('597', 'PMB2014150597', null, 'Eunike Audrey Mantalik', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-08-31', '', '0', '0.0', '0.0', '', '', 'Royal Residence B 10-97', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('598', 'PMB2014150598', null, 'Jonathan Gerald Linardi', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2007-03-23', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah Blok RX - 29', '', '7526671', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('599', 'PMB2014150599', null, 'Jonathan Limantara', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-05-03', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Barat II / F-9', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('600', 'PMB2014150600', null, 'Jonathan Louis Hartono Ong', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2007-05-24', '', '0', '0.0', '0.0', '', '', 'Dukuh Kupang Barat XXII / 26', '', '5676441', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('601', 'PMB2014150601', null, 'Jason Antolin Theios', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-01-10', '', '0', '0.0', '0.0', '', '', 'Banyu Urip Wetan  5/95-97 / Vila Bukit Mas Paris SA-30', '', '0315684506', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('602', 'PMB2014150602', null, 'Josh Franklin Linarto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-05-27', '', '0', '0.0', '0.0', '', '', 'Vila Valensia CA 5/50', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('603', 'PMB2014150603', null, 'Justin Tyrone Pangkey', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-07-04', '', '0', '0.0', '0.0', '', '', 'Griya Babatan Mukti Blok M-76', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('604', 'PMB2014150604', null, 'Kaitlyn Lievia', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-04-17', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas (Venesia) B2 / 5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('605', 'PMB2014150605', null, 'Marvel Nathanael Tedjakusuma', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-01-26', '', '0', '0.0', '0.0', '', '', 'Raya Darmo 47', '', '5622790', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('606', 'PMB2014150606', null, 'Nicole Audrey William', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-10-20', '', '0', '0.0', '0.0', '', '', 'Graha Family U-107', '', '03173226056', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('607', 'PMB2014150607', null, 'Olivia Harsono', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-05-08', '', '0', '0.0', '0.0', '', '', 'Isen No. 9', '', '0317315576', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('608', 'PMB2014150608', null, 'Richie Lawrance Chan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-10-20', '', '0', '0.0', '0.0', '', '', 'Raya Wonocolo 102 Taman Sepanjang, Sidoarjo', '', '7886555', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('609', 'PMB2014150609', null, 'Rico Ganendra Lie', '', '', null, '1', '', '0', '3', '1', 'L', 'Jakarta', '2007-04-29', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 7 No. 1', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('610', 'PMB2014150610', null, 'Seraphine Saputera', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-08-24', '', '0', '0.0', '0.0', '', '', 'South Emerald Mansion TK-7/12C', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('611', 'PMB2014150611', null, 'Atherton Irawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-08-10', '', '0', '0.0', '0.0', '', '', 'Nyi Cempo Barat No. 50 Taman Sepanjang', '', '7871545', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('612', 'PMB2014150612', null, 'Celine Aurellya', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2007-03-18', '', '0', '0.0', '0.0', '', '', 'Royal Residen B2 / 90 Wiyung, Sby', '', '7510090', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('613', 'PMB2014150613', null, 'Denisa Patricia Gunarto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-12-29', '', '0', '0.0', '0.0', '', '', 'Taman Darmo Harapan II/EG-2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('614', 'PMB2014150614', null, 'Eugenia Caitlin', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-12-24', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Utara VIII / Blok EU-32', '', '0317385848', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('615', 'PMB2014150615', null, 'Gloria Valerie Lim', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2008-02-02', '', '0', '0.0', '0.0', '', '', 'Puri Sentra Raya PS 2 No. 41 Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('616', 'PMB2014150616', null, 'Gracia Queenie Wijaya', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2006-11-29', '', '0', '0.0', '0.0', '', '', 'Kupang Indah 12 No. 7', '', '7326867', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('617', 'PMB2014150617', null, 'Gweneth E. Wijaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Perth Australia', '2007-07-05', '', '0', '0.0', '0.0', '', '', 'raya Darmo Permai II / 36', '', '0317319362', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('618', 'PMB2014150618', null, 'Jevaughn Aviel Kurniawan', '', '', null, '1', '', '0', '0', '1', 'L', 'Surabaya', '2007-02-18', '', '0', '0.0', '0.0', '', '', 'Puri Lidah Kulon Indah B-27', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('619', 'PMB2014150619', null, 'Justin Hartanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-12-02', '', '0', '0.0', '0.0', '', '', 'Tulungagung III/8, Sby', '', '0315321447', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('620', 'PMB2014150620', null, 'Justin Lee Sanyoto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-01-18', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2/PD 3-12 Pakuwon Indah', '', '7391118', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('621', 'PMB2014150621', null, 'Kaitlyn Halim', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2007-07-10', '', '0', '0.0', '0.0', '', '', 'Graha Famili Blok N-170, Sby', '', '0317320228', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('622', 'PMB2014150622', null, 'Kathleen Wijaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-03-01', '', '0', '0.0', '0.0', '', '', 'Graha Family L-117', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('623', 'PMB2014150623', null, 'Kevin Timothy Tanjung', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-07-10', '', '0', '0.0', '0.0', '', '', 'Lebak Permai I No. 5, Sby', '', '3813088', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('624', 'PMB2014150624', null, 'Andreano Sebastian Dengi', '', '', null, '1', '', '0', '5', '1', 'L', 'Padang', '2007-06-25', '', '0', '0.0', '0.0', '', '', 'Sambongan III/10', '', '0313536106', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('625', 'PMB2014150625', null, 'Kimiko Yauri', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-07-31', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 3 PE 8 No. 18 Pakuwon Indah', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('626', 'PMB2014150626', null, 'Lyonel Elzabad Anantara', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-07-18', '', '0', '0.0', '0.0', '', '', 'Taman International 1 B7 / 39 Citraland', '', '7414406', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('627', 'PMB2014150627', null, 'Matthew William Suwarno', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-01-24', '', '0', '0.0', '0.0', '', '', 'Gayung Kebonsari Besar 20, Sby', '', '0318290789', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('628', 'PMB2014150628', null, 'Natania Juan Hendrajaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-09-29', '', '0', '0.0', '0.0', '', '', 'Royal Resindence B2-103', '', '7510325', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('629', 'PMB2014150629', null, 'Phrisca', '', '', null, '1', '', '0', '1', '1', 'P', 'Jakarta', '2007-07-01', '', '0', '0.0', '0.0', '', '', 'Raya Dupak 17 Ruko Pasifik Megah Blok D-5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('630', 'PMB2014150630', null, 'Ryan Joseph', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-11-25', '', '0', '0.0', '0.0', '', '', 'Villa Sentra Raya D5 / 11 Citraraya, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('631', 'PMB2014150631', null, 'Shawn William Handoko', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2007-10-25', '', '0', '0.0', '0.0', '', '', 'Puri Widya Utama i-I / 5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('632', 'PMB2014150632', null, 'Verrell Tristan Sulistiano', '', '', null, '1', '', '0', '5', '1', 'L', 'Jakarta', '2007-07-07', '', '0', '0.0', '0.0', '', '', 'Bukit Telaga Golf TH 2 No. 2 Citraland', '', '0317400577', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('633', 'PMB2014150633', null, 'William Chandra', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2007-03-10', '', '0', '0.0', '0.0', '', '', 'Perum Graha Family P-18', '', '0317524704', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('634', 'PMB2014150634', null, 'Aislyn Samantha Ang', '', '', null, '1', '', '0', '5', '1', 'P', 'Singapore', '2007-11-21', '', '0', '0.0', '0.0', '', '', 'Puncak Permai II / 2A', '', '7315266', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('635', 'PMB2014150635', null, 'Alexander Budihartono', '', '', null, '1', '', '0', '4', '1', 'L', 'Brisbane', '2007-01-07', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah LX-7', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('636', 'PMB2014150636', null, 'Angela Monique Tejakusuma', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-08-20', '', '0', '0.0', '0.0', '', '', 'Satelit Indah III / LN No. 5', '', '0317346469', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('637', 'PMB2014150637', null, 'Arnold Jansen Kho', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2007-04-18', '', '0', '0.0', '0.0', '', '', 'Lebak Indah Jaya I kav 9', '', '0313821484', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('638', 'PMB2014150638', null, 'Christabel', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-06-02', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Jati AP - 9 Geluran Sepanjang', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('639', 'PMB2014150639', null, 'Ethan Isaac Silfanus', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-09-26', '', '0', '0.0', '0.0', '', '', 'Gubeng Kertajaya 7-Y/9', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('640', 'PMB2014150640', null, 'Fairy Fu', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-02-12', '', '0', '0.0', '0.0', '', '', 'Manukan Lor 1 F / 4, Sby', '', '031-7405002', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('641', 'PMB2014150641', null, 'Faylinn Avarielle Suganda', '', '', null, '1', '', '0', '4', '1', 'P', 'Malang', '2007-07-11', '', '0', '0.0', '0.0', '', '', 'Graha Family D-109', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('642', 'PMB2014150642', null, 'Fico Cesar Boedijono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-02-06', '', '0', '0.0', '0.0', '', '', 'Taman Satelite Timur QQ-28', '', '7313138', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('643', 'PMB2014150643', null, 'Frederich Marciano', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-09-07', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2 PD 7-2 Pakuwon', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('644', 'PMB2014150644', null, 'Gwen Angellica Ali Harsanto', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2006-10-25', '', '0', '0.0', '0.0', '', '', 'Royal Residence B 10 / 93', '', '8713405', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('645', 'PMB2014150645', null, 'Jillian Athalia Nigel', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-05-06', '', '0', '0.0', '0.0', '', '', 'Woodland WL 12 / 12', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('647', 'PMB2014150646', null, 'Joshua Daniel Wijaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-12-28', '', '0', '0.0', '0.0', '', '', 'Bukit Darmo Golf G-51', '', '0317345000', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('648', 'PMB2014150648', null, 'Kalleo Abram Joneus (Kalleo)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-08-06', '', '0', '0.0', '0.0', '', '', 'Tanjung Pura 24 Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('650', 'PMB2014150649', null, 'Kevin Adinugroho', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2007-12-03', '', '0', '0.0', '0.0', '', '', 'Kupang Indah XXI / 11, Sby', '', '0317311574', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('651', 'PMB2014150651', null, 'Matthew Alvaro Tanair', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-03-07', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas II / 15-22', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('652', 'PMB2014150652', null, 'Natascha Yap', '', '', null, '1', '', '0', '5', '1', 'P', 'USA', '2006-12-24', '', '0', '0.0', '0.0', '', '', 'Kencana Sari Timur D / 24', '', '0315610973', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('653', 'PMB2014150653', null, 'Disney Hananta Wijaya', '', '', null, '1', '', '0', '5', '0', 'L', 'Selangor, Malaysia', '2010-10-10', '', '0', '0.0', '0.0', '', '', 'Raya Gayung Kebonsari 33-35', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('655', 'PMB2014150654', null, 'Quinn Annabelle', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2007-10-03', '', '0', '0.0', '0.0', '', '', 'Pakis Tirtosari 2 / 8', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('656', 'PMB2014150656', null, 'Reinaldo Darence Halim', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabya', '2006-12-09', '', '0', '0.0', '0.0', '', '', 'Gedung Nasional No. 11', '', '5322700', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('658', 'PMB2014150657', null, 'Dominique Agatha Suryo', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2011-03-21', '', '0', '0.0', '0.0', '', '', 'Pakis Bukit Asoka J-12', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('660', 'PMB2014150659', null, 'Edelyn Florence Estelle', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('662', 'PMB2014150661', null, 'Winleon Tanjaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-05-01', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan X / 126', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('664', 'PMB2014150663', null, 'Evangelina Isabel Silfanus', '', '', null, '1', '', '0', '0', '0', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('666', 'PMB2014150665', null, 'Helena Serafi Xue', '', '', null, '1', '', '0', '0', '0', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('667', 'PMB2014150667', null, 'Hugo Harrison Suwignyo', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('668', 'PMB2014150668', null, 'Jeremy Oliver Hadiyanto', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('669', 'PMB2014150669', null, 'Joel Fabrizio Hanjaya', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('671', 'PMB2014150670', null, 'Justin Jusver', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('672', 'PMB2014150672', null, 'Kate Massey Tunggala', '', '', null, '1', '', '0', '0', '0', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('673', 'PMB2014150673', null, 'Li Ze En - Marty', '', '', null, '1', '', '0', '0', '0', 'L', 'Jilin, China', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('675', 'PMB2014150674', null, 'Megan Wu', '', '', null, '1', '', '0', '0', '0', 'P', 'Surabaya', '2011-10-01', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('676', 'PMB2014150676', null, 'Michael Amos Jonathan', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-03-22', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah DX-5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('678', 'PMB2014150677', null, 'Noel Efraim Limpo', '', '', null, '1', '', '0', '5', '0', 'L', 'Melbourne', '2010-11-11', '', '0', '0.0', '0.0', '', '', 'Graha Family FF-32', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('680', 'PMB2014150679', null, 'Early Angel Thie', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2007-03-07', '', '0', '0.0', '0.0', '', '', 'Pakuwon The Mansion PF4 No. 8', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('681', 'PMB2014150681', null, 'Erleen Chandra Tang', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2006-10-01', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Utara VII / EY-11', '', '83934138', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('682', 'PMB2014150682', null, 'Ernest Kenneth Young Sumarno', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-12-24', '', '0', '0.0', '0.0', '', '', 'Petemon Timur No 112', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('683', 'PMB2014150683', null, 'James Dendy', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2006-12-03', '', '0', '0.0', '0.0', '', '', 'Royal Residence BI / 21A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('684', 'PMB2014150684', null, 'Jamie Axi Lee', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-06-10', '', '0', '0.0', '0.0', '', '', 'Selat Golf J2 / 21 Citraland', '', '0317400010', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('685', 'PMB2014150685', null, 'Jayden Gil Gunawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-05-25', '', '0', '0.0', '0.0', '', '', 'Pakis Tirtosari VII / 81', '', '5674211', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('686', 'PMB2014150686', null, 'Nicholas Yuwono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-02-05', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 9 / GN-12', '', '7318494', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('687', 'PMB2014150687', null, 'Nixie Van Chen', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-09-05', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas RC-21', '', '5680118', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('688', 'PMB2014150688', null, 'Regina Soempiet', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-06-12', '', '0', '0.0', '0.0', '', '', 'Royal Residence Baimoral B3-52A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('689', 'PMB2014150689', null, 'Reinna Wijaya Alie', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-03-14', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 6 JN No. 5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('690', 'PMB2014150690', null, 'Shelby Wijaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-02-10', '', '0', '0.0', '0.0', '', '', 'Kupang Indah VII / 22', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('691', 'PMB2014150691', null, 'Steven Henry Christanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-10-31', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Timur II/27', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('692', 'PMB2014150692', null, 'Benedict Ongko Wibowo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2007-01-27', '', '0', '0.0', '0.0', '', '', 'Kupang Indah 7 / 6', '', '7311731', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('693', 'PMB2014150693', null, 'Celine Tannia Prajogo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-09-21', '', '0', '0.0', '0.0', '', '', 'Satelit Indah GN-4', '', '7314462', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('694', 'PMB2014150694', null, 'Chelsea Clarissa', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-03-19', '', '0', '0.0', '0.0', '', '', 'Pregolan Bunder 46 - 48', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('695', 'PMB2014150695', null, 'Davide William Susanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-12-01', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas I / C1-8', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('696', 'PMB2014150696', null, 'Gwenyth Jazlyn Korompis', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-09-29', '', '0', '0.0', '0.0', '', '', 'Bintang Diponggo Kav 825', '', '5687611', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('697', 'PMB2014150697', null, 'Jennifer Wongsowinoto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-06-01', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas C4-5', '', '7522784', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('698', 'PMB2014150698', null, 'Jonathan Febreson Kanesa', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-02-13', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Timur IV Blok O No. 2', '', '7311001', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('699', 'PMB2014150699', null, 'Kaitlyn Angeline Santoso', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-08-11', '', '0', '0.0', '0.0', '', '', 'Dian Istana AI - 20', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('700', 'PMB2014150700', null, 'Kathleen Cristaline Abigail', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-04-18', '', '0', '0.0', '0.0', '', '', 'Prambanan Residence CF/07', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('701', 'PMB2014150701', null, 'Lavinia Geovanni Tanujaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-10-16', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas Blok H No. 1', '', '5663797', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('702', 'PMB2014150702', null, 'Maxwell Gautama', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-03-07', '', '0', '0.0', '0.0', '', '', 'Graha Family U.142', '', '0317386500', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('703', 'PMB2014150703', null, 'Olethea Kylie Theharin', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-11-07', '', '0', '0.0', '0.0', '', '', 'Palma Grandia K-4/7, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('704', 'PMB2014150704', null, 'Regina Amadea', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-10-16', '', '0', '0.0', '0.0', '', '', 'Raya Satelit Indah AT-1', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('705', 'PMB2014150705', null, 'Ricky Sugiarto Tjandra', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2006-06-29', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Indah XX - 8', '', '7317255', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('706', 'PMB2014150706', null, 'Terrance Edmund L', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-06-09', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan I / 32', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('707', 'PMB2014150707', null, 'Thierry Hegan Ho', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-09-25', '', '0', '0.0', '0.0', '', '', 'Raya Darmo Permai  I/28', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('708', 'PMB2014150708', null, 'William Widjaja', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-04-08', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Mas K-12A', '', '08123112356', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('709', 'PMB2014150709', null, 'Zeng Xian Lun', '', '', null, '1', '', '0', '5', '1', 'L', 'Mojokerto', '2005-09-23', '', '0', '0.0', '0.0', '', '', 'Alam Galaxy A 10/06, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('710', 'PMB2014150710', null, 'Anneliese Josephine Irawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-10-28', '', '0', '0.0', '0.0', '', '', 'Graha Family R-7', '', '0317533777', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('711', 'PMB2014150711', null, 'Angelene Veronica Tjandra', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-10-28', '', '0', '0.0', '0.0', '', '', 'Taman Internasional I / BI-30', '', '7441126', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('712', 'PMB2014150712', null, 'Celine Princess Liangkey', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-09-27', '', '0', '0.0', '0.0', '', '', 'Darmo Hill M-22', '', '5636157', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('713', 'PMB2014150713', null, 'Christopher Seputro', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-10-18', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas Meditarnian N-26', '', '5618999', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('714', 'PMB2014150714', null, 'Cliff Nelson Tumbelaka', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-04-08', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 3 PE 10-40, Pakuwon Indah', '', '7391455', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('715', 'PMB2014150715', null, 'Daniel Henry Suwignjo', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2007-12-17', '', '0', '0.0', '0.0', '', '', 'Bukit Darmo Golf Regency B2', '', '0317328119', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('716', 'PMB2014150716', null, 'Devyn Christopher', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-04-27', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan V / EL-9', '', '7349450', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('718', 'PMB2014150717', null, 'Eiffelinne Rudijanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-08-25', '', '0', '0.0', '0.0', '', '', 'International Village 2, H6-6', '', '7451087', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('719', 'PMB2014150719', null, 'Felicia Frederica', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-11-16', '', '0', '0.0', '0.0', '', '', 'Graha Family Blok L-55', '', '71111555', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('720', 'PMB2014150720', null, 'Fennie Natalie Solaiman', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-06-29', '', '0', '0.0', '0.0', '', '', 'Galeria Golf No. 25', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('721', 'PMB2014150494', null, 'Cheryll Evangeline Arifin', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2008-09-13', '', '0', '0.0', '0.0', '', '', 'Rungkut Mapan Tengah II / CA-6', '', '0811375657', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('722', 'PMB2014150721', null, 'Geoffrey Daniel (Geo)', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-05-13', '', '0', '0.0', '0.0', '', '', 'Diamond Hill DR 5-6 Citraland', '', '0317458368', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('723', 'PMB2014150723', null, 'Harrel Ethan Macksoegie', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-08-09', '', '0', '0.0', '0.0', '', '', 'Simo Kwagean 98', '', '7492164', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('724', 'PMB2014150724', null, 'Jean-Vif Chandra', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-12-22', '', '0', '0.0', '0.0', '', '', 'Villa Sentra Raya D2 / 3', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('725', 'PMB2014150725', null, 'Jeslyn Victoria Lim', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-10-21', '', '0', '0.0', '0.0', '', '', 'Graha Family FF 10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('726', 'PMB2014150726', null, 'Maximillian Wilbert', '', '', null, '1', '', '0', '5', '1', 'L', 'Maximillian Wilbert', '2006-05-20', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat XI / 11', '', '7321670', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('727', 'PMB2014150727', null, 'Phillip Albert Samaoen', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-07-17', '', '0', '0.0', '0.0', '', '', 'Graha Family FF-29', '', '7535449', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('728', 'PMB2014150728', null, 'Samuel Widarto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-02-17', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Timur I / 29', '', '7314382', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('729', 'PMB2014150729', null, 'Stephanie Meygan Handoko', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2006-05-15', '', '0', '0.0', '0.0', '', '', 'Puri Widya Utama i-I/5', '', '0317348923', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('730', 'PMB2014150730', null, 'Walt Christian Halimsaputera', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2006-04-26', '', '0', '0.0', '0.0', '', '', 'Satelit Utara 6-IT/10', '', '7325600', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('731', 'PMB2014150731', null, 'Andrew Koespianto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-06-18', '', '0', '0.0', '0.0', '', '', 'Graha Family C-38', '', '7346253', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('732', 'PMB2014150732', null, 'Edbert Louise Suryasatria', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2004-12-04', '', '0', '0.0', '0.0', '', '', 'R. Sukomanunggal Jaya 60, Sby', '', '7311560', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('733', 'PMB2014150733', null, 'Edgar Rilley Setyadarma', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-05-24', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Mas L 21', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('734', 'PMB2014150734', null, 'Elaine Christian Budijanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-11-10', '', '0', '0.0', '0.0', '', '', 'Woodland 2/122 Citraland', '', '72362838', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('735', 'PMB2014150735', null, 'Farryl Gracious Sie', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-05-20', '', '0', '0.0', '0.0', '', '', 'Dharmahusada Indah M-17', '', '596427071', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('736', 'PMB2014150736', null, 'Felicia Gabrielle Rumoei', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-06-18', '', '0', '0.0', '0.0', '', '', 'Simpang Darmo Permai Timur II No. 2', '', '7342738', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('737', 'PMB2014150737', null, 'Fujiana Tanoto (Niu Niu)', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2006-01-24', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas Monaco II TC 6', '', '035614566', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('738', 'PMB2014150738', null, 'Frederick Rico Go', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2006-11-09', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Indah AAL 36', '', '7524253', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('739', 'PMB2014150739', null, 'Gabriela Keyrin Tjoei', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-08-18', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat X/53', '', '7344193', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('740', 'PMB2014150740', null, 'Gerich Greven', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-05-02', '', '0', '0.0', '0.0', '', '', 'Petemon Barat 96', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('741', 'PMB2014150741', null, 'Hillary Yauwhanes (Hilly)', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-01-10', '', '0', '0.0', '0.0', '', '', 'Graha Famili A-51', '', '0315992938', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('742', 'PMB2014150742', null, 'James Marcel Chandra', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-06-17', '', '0', '0.0', '0.0', '', '', 'Babatan Pratama NN 47', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('743', 'PMB2014150743', null, 'Joel Ravael Kurniawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-10-03', '', '0', '0.0', '0.0', '', '', 'Kutisari Indah Utara III / 30', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('744', 'PMB2014150744', null, 'Jonathan Budianto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-09-10', '', '0', '0.0', '0.0', '', '', 'Royal Residence B3-47', '', '7510137', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('745', 'PMB2014150745', null, 'Kimberly Zhang', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-04-27', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat I / 57', '', '7315902', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('746', 'PMB2014150746', null, 'Marcia Jeselyn', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-06-03', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas D-28', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('747', 'PMB2014150747', null, 'Victoria Ashley Pramoko', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-06-02', '', '0', '0.0', '0.0', '', '', 'Pakis Bukit Anggrek L-12 Darmo Hill', '', '5636119', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('748', 'PMB2014150748', null, 'Yohan Immanuel Hendrajaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-07-08', '', '0', '0.0', '0.0', '', '', 'Royal Residence B 2-103', '', '7510325', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('749', 'PMB2014150749', null, 'Ashley Cecilia Nugroho', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-06-01', '', '0', '0.0', '0.0', '', '', 'Graha Family Utara VII Blok D-187', '', '7343419', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('750', 'PMB2014150750', null, 'Athalia Nichole Nathanusa', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-05-24', '', '0', '0.0', '0.0', '', '', 'Citraland Pakuwon KS-5', '', '0317480082', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('751', 'PMB2014150751', null, 'Benedict Theodore Hogiharto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-07-14', '', '0', '0.0', '0.0', '', '', 'Kencanasari Barat 7/G-38', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('752', 'PMB2014150752', null, 'Calistha Kurniawan', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2005-08-09', '', '0', '0.0', '0.0', '', '', 'Darmo Hill S-10', '', '5636300', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('753', 'PMB2014150753', null, 'Dave Tristan Hartono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-10-28', '', '0', '0.0', '0.0', '', '', 'Bintang Diponggo 757', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('754', 'PMB2014150754', null, 'Elaine Catalina Lesmana', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-12-15', '', '0', '0.0', '0.0', '', '', 'Raya Bumi Indah No. 18', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('755', 'PMB2014150755', null, 'Ferdinand Jianming Karlim', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2005-05-17', '', '0', '0.0', '0.0', '', '', 'Achmad Jais 34 Blok B/9, Grand Achmad Jais', '', '0315357791', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('756', 'PMB2014150756', null, 'Gabriel Galuh Susanto Putra', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-07-24', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan III EA 9', '', '7316959', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('757', 'PMB2014150757', null, 'Gloria Rexana Lie', '', '', null, '1', '', '0', '5', '1', 'P', 'surabaya', '2006-07-09', '', '0', '0.0', '0.0', '', '', 'Simpang Darmo Permai Utara 5 / 35', '', '7342859', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('758', 'PMB2014150758', null, 'Goodwill Bryan Lion', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2005-07-28', '', '0', '0.0', '0.0', '', '', 'Graha Family B-63', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('759', 'PMB2014150759', null, 'Jeanette Magdalene', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-06-23', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Utara I EM-7', '', '0317317700', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('760', 'PMB2014150760', null, 'Jonathan Harleyson Sutanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-05-09', '', '0', '0.0', '0.0', '', '', 'Jupiter BS-15 Taman Hunian Satelit', '', '7328360', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('761', 'PMB2014150761', null, 'Kellin Anne Hidayat (Kellin)', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-08-09', '', '0', '0.0', '0.0', '', '', 'Graha Famili Selatan III / A8', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('762', 'PMB2014150762', null, 'Kimberly Yauwhanes (Kimy)', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-01-10', '', '0', '0.0', '0.0', '', '', 'Graha Famili A-51', '', '0315992938', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('763', 'PMB2014150763', null, 'Marco Alexander Tejo', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2005-11-16', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan EC-20', '', '7318486', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('764', 'PMB2014150764', null, 'Nathanael Rodrick Ho', '', '', null, '1', '', '0', '4', '1', 'L', 'Suraba', '2005-06-16', '', '0', '0.0', '0.0', '', '', 'Raya Darmo Permai I / 28', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('765', 'PMB2014150765', null, 'Patrick Riche Go', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2005-11-09', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Indah AAL 36', '', '7524253', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('766', 'PMB2014150766', null, 'Rebecca Ferren', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2004-12-25', '', '0', '0.0', '0.0', '', '', 'Perum. Graha Family Jl. Pulau Golf Family I (G-32)', '', '7384666', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('767', 'PMB2014150767', null, 'Vedericco Chandra', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2005-07-05', '', '0', '0.0', '0.0', '', '', 'Jajar Tunggal Utara V Blok S No. 5', '', '081331608585', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('768', 'PMB2014150768', null, 'Arnold Nathanael Benjamin', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-09-05', '', '0', '0.0', '0.0', '', '', 'Satelit Utara III / ET 36', '', '7325077', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('769', 'PMB2014150769', null, 'Anneliese', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-06-01', '', '0', '0.0', '0.0', '', '', 'Raya Kalijaten, Ruko Sepanjang Town House C 15-16', '', '7871720', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('770', 'PMB2014150770', null, 'Brandon Lee Sanyoto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-10-05', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2 / PD 3-12 Pakuwon Indah', '', '7391118', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('771', 'PMB2014150771', null, 'Callie Elspeth Kurniadi', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-07-23', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas C-5 / 12', '', '7535682', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('772', 'PMB2014150772', null, 'Celine Lopez Gonzales Tan', '', '', null, '1', '', '0', '5', '1', 'P', 'Suraaya', '2005-05-14', '', '0', '0.0', '0.0', '', '', 'Apartemen Waterplace Tower A  08-10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('773', 'PMB2014150773', null, 'Daniel Redondo Pantas Sianipar', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-01-20', '', '0', '0.0', '0.0', '', '', 'selindri 9/3 kota baru driyorejo Gresik', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('774', 'PMB2014150774', null, 'Eugenia Cheryl Sutedjo', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-07-30', '', '0', '0.0', '0.0', '', '', 'Graha Family F 58', '', '7385658', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('775', 'PMB2014150775', null, 'Feliza Theodora Putri Tjokro', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2005-05-27', '', '0', '0.0', '0.0', '', '', 'Puri Sentra Raya PS 1-50 Q Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('776', 'PMB2014150776', null, 'Hovan Mac Chen', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-08-30', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas RC-21', '', '5680118', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('777', 'PMB2014150777', null, 'Jonathan Wongso', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2005-09-08', '', '0', '0.0', '0.0', '', '', 'Villa Valensia PA 4/3 Pakuwon Indah', '', '7523055', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('778', 'PMB2014150778', null, 'Josephine Christabelle', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-10-28', '', '0', '0.0', '0.0', '', '', 'Kupang Baru 2 No. 25', '', '7346835', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('779', 'PMB2014150779', null, 'Karen Leticia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-09-04', '', '0', '0.0', '0.0', '', '', 'Taman Gapura E6 / 19', '', '7412288', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('780', 'PMB2014150780', null, 'Kenneth Ongko Wibowo', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-11-07', '', '0', '0.0', '0.0', '', '', 'Kupang Indah 7 / 6', '', '7311731', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('781', 'PMB2014150781', null, 'Lianny Patricia Hartono', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2005-03-13', '', '0', '0.0', '0.0', '', '', 'Permata Safira Regency Blok BI / 3', '', '7534207', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('782', 'PMB2014150782', null, 'Michelle Ping Ping Lie', '', '', null, '1', '', '0', '3', '1', 'P', 'Surabaya', '2005-09-11', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 7 / EN 1', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('783', 'PMB2014150783', null, 'Peter Julianto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-03-23', '', '0', '0.0', '0.0', '', '', 'Darmo Hill L-21 A', '', '5636120', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('784', 'PMB2014150784', null, 'Timothy Johannes Wijaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-10-16', '', '0', '0.0', '0.0', '', '', 'Bukit Darmo Golf G-51', '', '7383999', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('785', 'PMB2014150785', null, 'William Patrick', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2005-01-28', '', '0', '0.0', '0.0', '', '', 'Villa Taman Telaga II TJ-6 No. 9 Citraland', '', '7450853', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('786', 'PMB2014150786', null, 'Audrey Netanya Benyamin', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-04-01', '', '0', '0.0', '0.0', '', '', 'Satelit Utara III/ET - 36, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('787', 'PMB2014150787', null, 'Beatricia Audrey Siemon', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-11-27', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2, PD3/11, Pakuwon Indah, Sby', '', '7391112', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('788', 'PMB2014150788', null, 'Cathrioca Keisha', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-09-18', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah AA - 2 Wiyung, Sby', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('789', 'PMB2014150789', null, 'Charlene Athena Tjahjadi', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-01-28', '', '0', '0.0', '0.0', '', '', 'Raya Kupang Jaya B 10', '', '81984321', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('790', 'PMB2014150790', null, 'Cindy Carina Thomas (Cindy)', '', '', null, '1', '', '0', '5', '1', 'P', 'Probolinggo', '2004-08-17', '', '0', '0.0', '0.0', '', '', 'Sidodadi No. 40 Surabaya', '', '0313719890', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('791', 'PMB2014150791', null, 'Derric Ang Suhartono', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2004-05-26', '', '0', '0.0', '0.0', '', '', 'Citraland Bukit Golf Utama Blok FI / 3A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('792', 'PMB2014150792', null, 'Devina Claresta', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-01-05', '', '0', '0.0', '0.0', '', '', 'Margorejo Indah 3/B-710', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('793', 'PMB2014150793', null, 'Edward Christian Budijanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-10-25', '', '0', '0.0', '0.0', '', '', 'SidosermoAirdas V/F-116', '', '8432601', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('794', 'PMB2014150794', null, 'Feliana Veronica', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-08-10', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Timur SS - 26', '', '7342890', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('795', 'PMB2014150795', null, 'Francis Limanseto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-01-01', '', '0', '0.0', '0.0', '', '', 'Babatan Mukti O - 19, Wiyung', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('796', 'PMB2014150796', null, 'Giselle Laetitia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-08-26', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Indah AA 10-12, Pakuwon', '', '7526847', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('797', 'PMB2014150797', null, 'Graciella Geraldine Supramono', '', '', null, '1', '', '0', '5', '1', 'P', 'Banyuwangi', '2004-01-07', '', '0', '0.0', '0.0', '', '', 'Sutorejo Utara F 1/2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('798', 'PMB2014150798', null, 'Jason Lienardi', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-04-12', '', '0', '0.0', '0.0', '', '', 'Kupang Iandah XI / 116', '', '7326978', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('799', 'PMB2014150799', null, 'Jeremy Gautama', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-07-13', '', '0', '0.0', '0.0', '', '', 'Satelit Indah 7/DN-21, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('800', 'PMB2014150800', null, 'Joycelyn Eugenia Kurniadi', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-02-14', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas C-5 / 12', '', '7535682', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('801', 'PMB2014150801', null, 'Kayne Juro Chandra (Kayne)', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2020-11-04', '', '0', '0.0', '0.0', '', '', 'Puri Sentra Raya PS 1/37 Citraland', '', '7416677', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('802', 'PMB2014150802', null, 'Kenny Wibowo', '', '', null, '1', '', '0', '3', '1', 'L', 'Surabaya', '2004-02-08', '', '0', '0.0', '0.0', '', '', 'Taman Hunian Satelit II Blok B/2, Sukomanunggal Indah III', '', '7310536', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('803', 'PMB2014150803', null, 'Michelle Katrina Suwanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-09-17', '', '0', '0.0', '0.0', '', '', 'Simo Rukun VII / 7, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('804', 'PMB2014150804', null, 'Naomi Boesono', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-12-05', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah Villa Bukit Regency I PC3 - 12', '', '7391974', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('805', 'PMB2014150805', null, 'Prisca Lovely Gunawan', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-04-29', '', '0', '0.0', '0.0', '', '', 'Sukomanunggal Jaya XI / XL-26', '', '7314888', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('806', 'PMB2014150806', null, 'Rachel Mantalik', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-11-17', '', '0', '0.0', '0.0', '', '', 'Royal Residence B 10/97', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('807', 'PMB2014150807', null, 'Shelfina', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-05-21', '', '0', '0.0', '0.0', '', '', 'Perum Alam Galaxy, Water Terrace A8 - 3', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('808', 'PMB2014150808', null, 'Vanessa Shareen', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-06-19', '', '0', '0.0', '0.0', '', '', 'Babatan Pantai Barat I/66                       Villa Bukit Regency 2PD3-11', '', '7482033', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('809', 'PMB2014150809', null, 'Wang Xiao Han', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-08-13', '', '0', '0.0', '0.0', '', '', 'Rayan Regency F-5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('810', 'PMB2014150810', null, 'Brivio Darren Wigitono', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-08-10', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Selatan LL - 39', '', '71027122', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('811', 'PMB2014150811', null, 'Clarice Angeline', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-06-28', '', '0', '0.0', '0.0', '', '', 'Tanjungsari Baru V / Blok GG-36', '', '7313096', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('812', 'PMB2014150812', null, 'Devny Fu', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-11-02', '', '0', '0.0', '0.0', '', '', 'Manukan Lor IF No. 4', '', '03171012546', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('813', 'PMB2014150813', null, 'Emily Francesca Soegijanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2020-04-08', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat I / 39', '', '7329845', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('814', 'PMB2014150814', null, 'Eunike Jacquelyn Widarto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-10-13', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Timur VIII/16, Sby', '', '7328528', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('815', 'PMB2014150815', null, 'Fiona Chandra', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-02-17', '', '0', '0.0', '0.0', '', '', 'Puri Widya Kencana J3 No 2 Citra Raya', '', '7482759', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('816', 'PMB2014150816', null, 'He Xing Hua', '', '', null, '1', '', '0', '5', '1', 'P', 'Shang Hai', '2004-07-30', '', '0', '0.0', '0.0', '', '', 'Dupak No. 65 Blok B-3 Ruko Mutiara Dupak', '', '71844438', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('817', 'PMB2014150817', null, 'Jocelyn', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-06-14', '', '0', '0.0', '0.0', '', '', 'Tulung Agung 3 / 8, Surabaya', '', '7056995', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('818', 'PMB2014150818', null, 'Kayla Calista Anabelle', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-07-18', '', '0', '0.0', '0.0', '', '', 'Puri Surya Jaya D5/32, Gedangan', '', '8917657', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('819', 'PMB2014150819', null, 'Lamtiar Nauli Sabrina Margareth Nababan', '', '', null, '1', '', '0', '5', '1', 'P', 'Tangerang', '2004-09-03', '', '0', '0.0', '0.0', '', '', 'Wisma Tengger XVII / 2', '', '7405884', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('820', 'PMB2014150820', null, 'Louis Darren Irwan', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-12-09', '', '0', '0.0', '0.0', '', '', 'Imperial Golf Regensi AB 2 No. 6', '', '7391882', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('821', 'PMB2014150821', null, 'Melinda Fandrayani', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-12-09', '', '0', '0.0', '0.0', '', '', 'Satelit Utara VII / CT - 14, Sby', '', '7316226', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('822', 'PMB2014150822', null, 'Nathan Amadeus', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-05-14', '', '0', '0.0', '0.0', '', '', 'Alam Hijau F1 / 20, Sby', '', '7466301', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('823', 'PMB2014150823', null, 'Netanya Marvela Irawan', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-02-06', '', '0', '0.0', '0.0', '', '', 'Graha Famili R - 7, Sby', '', '7533777', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('824', 'PMB2014150824', null, 'Nicholas Kevin Tjoei', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2004-01-09', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat X / 53, Sby', '', '7344193', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('825', 'PMB2014150825', null, 'Quenny Michaela Anggraini', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-09-14', '', '0', '0.0', '0.0', '', '', 'Kupang Indah 2/22', '', '7316188', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('826', 'PMB2014150826', null, 'Sonya Nahama Wijoyo', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2004-04-12', '', '0', '0.0', '0.0', '', '', 'Kupang Indah 7 /12, Sby', '', '7311730', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('827', 'PMB2014150827', null, 'Stanley Alexander Sugianto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-09-06', '', '0', '0.0', '0.0', '', '', 'Simo Tambaan Sekolahan No. 2', '', '7328829', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('828', 'PMB2014150828', null, 'Stevan Alexander Surya', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2004-09-10', '', '0', '0.0', '0.0', '', '', 'Pakis Bukit Asoka R-23', '', '03133119990', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('829', 'PMB2014150829', null, 'Stevie Gunawan Jie', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2004-12-14', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Regency I PC 5/7', '', '7391380', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('830', 'PMB2014150830', null, 'Tamara Jessica Chandra', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2004-06-07', '', '0', '0.0', '0.0', '', '', 'Babatan Pratama 26 / 47', '', '7523740', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('831', 'PMB2014150831', null, 'Yohanes Tjahyadi', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2004-05-28', '', '0', '0.0', '0.0', '', '', 'Vila Sentra Raya AG / 23, Sby', '', '70271689', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('833', 'PMB2014150832', null, 'Astrid Regina Pangkey', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2003-02-16', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah  LY - 2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('834', 'PMB2014150834', null, 'Audric Owen', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-07-19', '', '0', '0.0', '0.0', '', '', 'Undaan Wetan 46 E Sby', '', '5326126', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('835', 'PMB2014150835', null, 'Bryong Ang Suhartono', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-12-21', '', '0', '0.0', '0.0', '', '', 'Citraland Bukit Golf Utama Blok FI / 3A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('836', 'PMB2014150836', null, 'Celine Angelina Prayogo', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-12-28', '', '0', '0.0', '0.0', '', '', 'Kapasari V/16', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('837', 'PMB2014150837', null, 'Cheryl Lim', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-10-31', '', '0', '0.0', '0.0', '', '', 'Graha Famili N - 46', '', '7346683', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('838', 'PMB2014150838', null, 'Edbert Mulyawan', '', '', null, '1', '', '0', '1', '1', 'L', 'Surabaya', '2003-01-24', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Utara  VIII / EU 20', '', '7318896', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('839', 'PMB2014150839', null, 'Felicia Princess Liangkey', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-12-04', '', '0', '0.0', '0.0', '', '', 'Darmo Hill Blok  M - 22', '', '5636157', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('840', 'PMB2014150840', null, 'Grace Calvinia', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-11-23', '', '0', '0.0', '0.0', '', '', 'Raya Semambung 345, Driyorejo-Gresik', '', '7509702', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('841', 'PMB2014150841', null, 'Jazz Bradlee', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-03-24', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Mas - Mediteran L-16', '', '70929467', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('842', 'PMB2014150842', null, 'Jennifer Alicia Lee', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2003-08-15', '', '0', '0.0', '0.0', '', '', 'Petemon Sidomulyo  IIIA / 31', '', '5350872', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('843', 'PMB2014150843', null, 'Jessica Levina Amelinda', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-03-18', '', '0', '0.0', '0.0', '', '', 'Kupang Indah  19 / 32', '', '7311505', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('844', 'PMB2014150844', null, 'Jonathan Alexander Liyanto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-07-01', '', '0', '0.0', '0.0', '', '', 'Kedurus IV / 66-B, Sby', '', '0317661792', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('845', 'PMB2014150845', null, 'Justin Tanujaya', '', '', null, '1', '', '0', '5', '1', 'L', 'Jakarta', '2003-04-03', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Regensi 3 PE 8 / 26', '', '7391671', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('846', 'PMB2014150846', null, 'Klara Immanuela', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2003-10-23', '', '0', '0.0', '0.0', '', '', 'Taman Internasional I / C-1 / 21', '', '7442186', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('847', 'PMB2014150847', null, 'Lincoln Abraham', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2002-10-17', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Timur XIV / 52, Surabaya', '', '0317310692', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('848', 'PMB2014150848', null, 'Louis Samuel Muktiali', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2002-09-21', '', '0', '0.0', '0.0', '', '', 'Babadan Mukti C 16', '', '7530678', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('849', 'PMB2014150849', null, 'Malika Mada Susanto Putri', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-04-08', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan III EA 9', '', '7316959', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('850', 'PMB2014150850', null, 'Matthew Zhang', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-08-03', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat  I / no. 57', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('851', 'PMB2014150851', null, 'Meylisha Kurniawan', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2003-05-15', '', '0', '0.0', '0.0', '', '', 'Bukit Pakis Teratai S - 10', '', '5636333', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('852', 'PMB2014150852', null, 'Michelle Devina', '', '', null, '1', '', '0', '5', '1', 'P', 'Malang', '2003-08-18', '', '0', '0.0', '0.0', '', '', 'Panglima Sudirman 67, Gresik', '', '3983096', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('853', 'PMB2014150853', null, 'Nelson Claudio Salim', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-10-24', '', '0', '0.0', '0.0', '', '', 'Anjasmoro 34', '', '5321034', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('854', 'PMB2014150854', null, 'Sheren Pricillia', '', '', null, '1', '', '0', '5', '1', 'P', 'Palembang', '2003-03-12', '', '0', '0.0', '0.0', '', '', 'Pregolan Bunder 46 - 48', '', '5341682', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('855', 'PMB2014150855', null, 'Tiffany Grace Santoso', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-01-29', '', '0', '0.0', '0.0', '', '', 'Dian Istana  A1 - 20', '', '7533858', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('856', 'PMB2014150856', null, 'Vania Sulistiano', '', '', null, '1', '', '0', '5', '1', 'P', 'Jakarta', '2003-12-20', '', '0', '0.0', '0.0', '', '', 'Bukit Telaga Golf TH 2/12 Citraland', '', '0317400577', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('857', 'PMB2014150857', null, 'Vincent Alexander', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-05-24', '', '0', '0.0', '0.0', '', '', 'Tunjungan 53 F', '', '7440099', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('858', 'PMB2014150858', null, 'Ashley Kaitlyn Yeoh', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2002-12-01', '', '0', '0.0', '0.0', '', '', 'Royal Park TL - 3 / 46, Citra Raya', '', '7409556', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('859', 'PMB2014150859', null, 'Brenda Nicole Soesanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-08-12', '', '0', '0.0', '0.0', '', '', 'Graha Family  N - 155', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('860', 'PMB2014150860', null, 'Bryan Nathanael', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-02-25', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 3 PE 2 No. 18, Surabaya', '', '7523074', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('861', 'PMB2014150861', null, 'Davin Septian Koestiono Kho', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-09-03', '', '0', '0.0', '0.0', '', '', 'Water ront WP 7 / 5, CitraLand', '', '740873637', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('862', 'PMB2014150862', null, 'Edward Thejawijaya', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-09-06', '', '0', '0.0', '0.0', '', '', 'Delta Sari Indah AM-5 Waru Sidoarjo', '', '8535229', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('863', 'PMB2014150863', null, 'Eugenia Christabel', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-01-24', '', '0', '0.0', '0.0', '', '', 'Raya Darmo Permai II, Perum Darmo Green Garden C 19', '', '7325562', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('864', 'PMB2014150864', null, 'Howard Yang', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2019-01-15', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah AB 2-23 Sby', '', '7391770', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('865', 'PMB2014150865', null, 'Ilona Marsha Go', '', '', null, '1', '', '0', '5', '1', 'P', 'mojokerto', '2003-03-02', '', '0', '0.0', '0.0', '', '', 'North Emerald Mansion TN 3/43, Surabaya', '', '7524253', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('866', 'PMB2014150866', null, 'Jasmine Angela Pangkey', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-05-08', '', '0', '0.0', '0.0', '', '', 'Griya Babatan Mukti J-33A, Surabaya', '', '7530210', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('867', 'PMB2014150867', null, 'Jasmine Angela Pangkey', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-05-08', '', '0', '0.0', '0.0', '', '', 'Griya Babatan Mukti J-33A, Surabaya', '', '7530210', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('868', 'PMB2014150868', null, 'Jason William', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-08-18', '', '0', '0.0', '0.0', '', '', 'Dupak 72', '', '35424846', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('869', 'PMB2014150869', null, 'Jeanne Angeline Siemon', '', '', null, '1', '', '0', '4', '1', 'P', 'Surabaya', '2003-08-10', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency III, PE7-20 Pakuwon Indah , Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('870', 'PMB2014150870', null, 'Jessica', '', '', null, '1', '', '0', '1', '1', 'P', 'Surabaya', '2003-12-31', '', '0', '0.0', '0.0', '', '', 'Dupak 17 Blok 9 B', '', '5476264', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('871', 'PMB2014150871', null, 'Jesslyn Gabrielle Hermanto', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-11-04', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Sel. 9 / 14', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('872', 'PMB2014150872', null, 'Joseph Chang', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-03-05', '', '0', '0.0', '0.0', '', '', 'Kendangsari Blok M-10', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('873', 'PMB2014150873', null, 'Kelly Wijaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-10-25', '', '0', '0.0', '0.0', '', '', 'Garaha Family L-117', '', '3570313', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('874', 'PMB2014150874', null, 'Marcellius Brian', '', '', null, '1', '', '0', '4', '1', 'L', 'Surabaya', '2003-12-05', '', '0', '0.0', '0.0', '', '', 'Darmo Baru Barat  XI / no. 11', '', '7321670', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('875', 'PMB2014150875', null, 'Michelle Andrea Sutandar', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-01-06', '', '0', '0.0', '0.0', '', '', 'Villa Sentra Raya A5 No. 7 Sby', '', '7410588', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('876', 'PMB2014150876', null, 'Nicholas Chang', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-05-28', '', '0', '0.0', '0.0', '', '', 'Darmo Hill Blok  P - 12', '', '5636338', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('877', 'PMB2014150877', null, 'Petra Julianto', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-06-10', '', '0', '0.0', '0.0', '', '', 'Darmo Hill Blok L 21 A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('878', 'PMB2014150878', null, 'Rafael Alessandro Sahulata', '', '', null, '1', '', '0', '5', '1', 'L', 'Jayapura', '2003-12-18', '', '0', '0.0', '0.0', '', '', 'Darmo Sentosa Raya  C - 19', '', '5684773', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('879', 'PMB2014150879', null, 'Ruth Felicia Lukman', '', '', null, '1', '', '0', '5', '1', 'P', 'Jakarta', '2003-06-10', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 3 Blok PE 4 No. 25', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('880', 'PMB2014150880', null, 'Samuel King Kurniawan', '', '', null, '1', '', '0', '5', '1', 'L', 'Sidoarjo', '2003-06-19', '', '0', '0.0', '0.0', '', '', 'Pondok Mutiara I No. 10 Sdj', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('881', 'PMB2014150881', null, 'Sharon Caitlyn Wijaya', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-02-05', '', '0', '0.0', '0.0', '', '', 'Bukit Darmo Golf Regency Blok D-10, Surabaya', '', '7533806', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('882', 'PMB2014150882', null, 'Tabita Aurellia Anam', '', '', null, '1', '', '0', '5', '1', 'P', 'Surabaya', '2003-08-09', '', '0', '0.0', '0.0', '', '', 'Putat Gede Indah 58', '', '5685226', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('883', 'PMB2014150883', null, 'Tristan Robin Aarnoudse', '', '', null, '1', '', '0', '5', '1', 'L', 'Surabaya', '2003-10-18', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan I/6, Surabaya', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('884', 'PMB2014150884', null, 'Shannon Millicent Yao', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2011-05-27', '', '0', '0.0', '0.0', '', '', 'Palm Hill F1 / 16, Citraland', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('885', 'PMB2014150885', null, 'Sophia', '', '', null, '1', '', '0', '0', '0', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('886', 'PMB2014150886', null, 'Verline Goenawan', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2012-03-16', '', '0', '0.0', '0.0', '', '', 'Villa Taman Telaga II TJ-6 / 9', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('887', 'PMB2014150887', null, 'Wang Xin Yan', '', '', null, '1', '', '0', '5', '0', 'P', 'Fujian, China', '2012-06-30', '', '0', '0.0', '0.0', '', '', 'Apt. Water Place Tower B /2101', '', '08155235055', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('888', 'PMB2014150888', null, 'Aishlyn Arianna Tejakusuma', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2011-07-21', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('889', 'PMB2014150889', null, 'Alvin Arsenio Oktavian', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2011-08-06', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('890', 'PMB2014150890', null, 'Brandon Matthew', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-07-25', '', '0', '0.0', '0.0', '', '', 'Silindri 3 / 4 - Kota Baru Driyorejo, Gresik', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('891', 'PMB2014150891', null, 'Florence Christalyn Tansah', '', '', null, '1', '', '0', '0', '0', 'P', 'Surabaya', '2011-08-03', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('892', 'PMB2014150892', null, 'Gillian Belicia', '', '', null, '1', '', '0', '0', '0', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('893', 'PMB2014150893', null, 'Given Graciano Pranata', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-09-27', '', '0', '0.0', '0.0', '', '', 'Permata Safira Regency F4 / 27', '', '0317533134', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('894', 'PMB2014150894', null, 'Jayden Anthony Theios', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2011-10-24', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('895', 'PMB2014150895', null, 'Matthew Terence Tanata', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-02-14', '', '0', '0.0', '0.0', '', '', 'Vila Kalijudan Indah X-3', '', '0313822017', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('896', 'PMB2014150896', null, 'Rayner Alenson Sudiyanto', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2011-07-10', '', '0', '0.0', '0.0', '', '', 'Pakuwon Indah The Mansion PF 4-38', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('897', 'PMB2014150897', null, 'Aaron James Boesono', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2009-11-23', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('898', 'PMB2014150898', null, 'Alviando Brain Lie', '', '', null, '1', '', '0', '3', '0', 'L', 'Surabaya', '2010-06-21', '', '0', '0.0', '0.0', '', '', 'Satelit Indah VII / EN-1', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('899', 'PMB2014150899', null, 'Billy Nemonda Pandu W.', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-06-30', '', '0', '0.0', '0.0', '', '', 'Donowati II / 6', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('900', 'PMB2014150900', null, 'Christiano Erenesto', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-06-10', '', '0', '0.0', '0.0', '', '', 'Petemon III / 139', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('901', 'PMB2014150901', null, 'Dave Preston Wangsa', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-11-23', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Mas Q-20', '', '0315686773', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('902', 'PMB2014150902', null, 'Edbert Joshua', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-02-06', '', '0', '0.0', '0.0', '', '', 'Taman Pinang Indah B5 / 8, Sidoarjo', '', '0318925915', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('903', 'PMB2014150903', null, 'Eunike Libby Budiman', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2009-12-21', '', '0', '0.0', '0.0', '', '', 'Taman Puspa Raya B6-19', '', '03170581663', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('904', 'PMB2014150904', null, 'Genevieve Ganda ( Ivy )', '', '', null, '1', '', '0', '0', '0', 'P', 'Surabaya', '2010-06-01', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('905', 'PMB2014150905', null, 'Jehovani Alexis Nigel', '', '', null, '1', '', '0', '0', '0', 'P', 'Surabaya', '2010-11-16', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('906', 'PMB2014150906', null, 'Jessica Gabrielle Sebastian Ho', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-10-09', '', '0', '0.0', '0.0', '', '', 'Ngagel Jaya Selatan E-28', '', '0317322771', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('907', 'PMB2014150907', null, 'Kevin Ivander Hoo', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-09-30', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Selatan X / 128', '', '0317324898', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('908', 'PMB2014150908', null, 'Mayve Pricilia Tanujaya', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-10-12', '', '0', '0.0', '0.0', '', '', 'Satelit Indah IX / GN-18', '', '0317312413', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('909', 'PMB2014150909', null, 'Megan Nicolette Kho', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-03-17', '', '0', '0.0', '0.0', '', '', 'Satelit Indah VIII / FN-5', '', '0317343111', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('910', 'PMB2014150910', null, 'Stewart Samuel Surya', '', '', null, '1', '', '0', '4', '0', 'L', 'Surabaya', '2010-11-12', '', '0', '0.0', '0.0', '', '', 'Darmo Hill R-23', '', '5683008', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('911', 'PMB2014150911', null, 'Vallerie Gabrielle Hadiwidjojo', '', '', null, '1', '', '0', '4', '0', 'P', 'Surbaya', '2010-06-21', '', '0', '0.0', '0.0', '', '', 'Kupang Indah II / 52', '', '0317315224', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('912', 'PMB2014150912', null, 'Alfred Reynard Jayadi', '', '', null, '1', '', '0', '4', '0', 'L', 'Surabaya', '2010-08-20', '', '0', '0.0', '0.0', '', '', 'Raya Sukomanunggal Jaya V / E-22', '', '0317320208', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('913', 'PMB2014150913', null, 'Angelina Jocelyn Livianto', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-01-24', '', '0', '0.0', '0.0', '', '', 'Darmo Permai Utara X / 36', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('914', 'PMB2014150914', null, 'Frederick Sutendy', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('915', 'PMB2014150915', null, 'Giorgia Cruz Suryaputra', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2013-10-26', '', '0', '0.0', '0.0', '', '', 'Graha Family H-21', '', '0317385558', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('916', 'PMB2014150916', null, 'Gwen Laeticia Kho', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-02-24', '', '0', '0.0', '0.0', '', '', 'Satelit Indah VIII / FN-5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('917', 'PMB2014150917', null, 'James Leonard Nathaniel', '', '', null, '1', '', '0', '1', '0', 'L', 'Surabaya', '2010-09-06', '', '0', '0.0', '0.0', '', '', 'Graha Family L-55', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('918', 'PMB2014150918', null, 'Jason Christopher Cahyadi', '', '', null, '1', '', '0', '4', '0', 'L', 'Surabaya', '2009-11-19', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah PX-9', '', '0317526731', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('919', 'PMB2014150919', null, 'Jesslyn Blessing Ruho', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-06-10', '', '0', '0.0', '0.0', '', '', 'Pakis Tirtosari VII / 69', '', '0315674479', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('920', 'PMB2014150920', null, 'Jiro Josediputra', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-08-13', '', '0', '0.0', '0.0', '', '', 'Bukit Telaga Golf TA 6 / 19', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('921', 'PMB2014150921', null, 'Juan Sebastian Pangkey', '', '', null, '1', '', '0', '4', '0', 'L', 'Surabaya', '2010-03-02', '', '0', '0.0', '0.0', '', '', 'Taman Pondok Indah LY-2', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('922', 'PMB2014150922', null, 'Kelvin Santoso', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-11-23', '', '0', '0.0', '0.0', '', '', 'Raya Satelit Barat JN-31', '', '03133566789', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('923', 'PMB2014150923', null, 'Kimberly Huang', '', '', null, '1', '', '0', '1', '0', 'P', 'Surabaya', '2009-12-17', '', '0', '0.0', '0.0', '', '', 'Kupang Indah XII / 22', '', '0317311428', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('924', 'PMB2014150924', null, 'Rafael Cristiano Margono', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2010-08-27', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('925', 'PMB2014150925', null, 'Sherwin Winata', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-05-27', '', '0', '0.0', '0.0', '', '', 'Dupak 63 Blok F-15 Ruko Mutiara Dupak (Kalianyar 21C)', '', '0315329899', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('926', 'PMB2014150926', null, 'Timothy Dylan Gunawan', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-11-14', '', '0', '0.0', '0.0', '', '', 'Babatan Pilang K-1 Wiyung', '', '0317535213', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('927', 'PMB2014150927', null, 'Vanessa Ivania Sidharta', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-05-17', '', '0', '0.0', '0.0', '', '', 'Graha Family Y No.73', '', '0317322710', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('928', 'PMB2014150928', null, 'Aubrey Christabel Halimsaputera', '', '', null, '1', '', '0', '0', '0', 'P', 'Surabaya', '2010-07-07', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('929', 'PMB2014150929', null, 'Belycia Christirich Santoso', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-11-22', '', '0', '0.0', '0.0', '', '', 'Manukan Wetan No.32', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('930', 'PMB2014150930', null, 'Clavarine Nevada Sumarno', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-12-01', '', '0', '0.0', '0.0', '', '', 'Petemon Timur 112', '', '0315310617', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('931', 'PMB2014150931', null, 'Derrick Nicholas Teng', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-09-13', '', '0', '0.0', '0.0', '', '', 'Bukit Darmo Golf G-53', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('932', 'PMB2014150932', null, 'Gianni Malva Sasongko', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-06-09', '', '0', '0.0', '0.0', '', '', 'Darmo Hill J-5', '', '0317391003', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('933', 'PMB2014150933', null, 'Giorgio Farrell Eugene H', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2010-07-29', '', '0', '0.0', '0.0', '', '', '', '', '0317412627', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('934', 'PMB2014150934', null, 'Jefferson Patricio Oenata', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-04-16', '', '0', '0.0', '0.0', '', '', 'Villa Taman Telaga TJ 6 / 21', '', '0317450891', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('935', 'PMB2014150935', null, 'Jordan Gil Gunawan', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-02-08', '', '0', '0.0', '0.0', '', '', 'Pakis Tirtosari VII / 81', '', '0315674211', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('936', 'PMB2014150936', null, 'Joyvina Chrysantha Immanuela Setiawan', '', '', null, '1', '', '0', '5', '0', 'P', 'Mojokerto', '2009-12-12', '', '0', '0.0', '0.0', '', '', 'Manukan Tirto IV Blok 22 J / 1 3', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('937', 'PMB2014150937', null, 'Kevin Harel Ongkowijaya', '', '', null, '1', '', '0', '4', '0', 'L', 'Surabaya', '2010-04-17', '', '0', '0.0', '0.0', '', '', 'Simpang Darmo Permai Selatan V/53', '', '0317343462', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('938', 'PMB2014150938', null, 'Kimberly Widjaja', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2010-08-20', '', '0', '0.0', '0.0', '', '', 'Vila Bukit Mas K-12A', '', '0315664408', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('939', 'PMB2014150939', null, 'Michelle Evelyn Wu', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2010-01-23', '', '0', '0.0', '0.0', '', '', 'Griya Babatan Mukti C-11', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('940', 'PMB2014150940', null, 'Victor Fu', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2010-08-24', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('941', 'PMB2014150941', null, 'Warren Joseph Haryono', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-02-15', '', '0', '0.0', '0.0', '', '', 'Raya Arjuno No.51-53', '', '03151200516', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('942', 'PMB2014150942', null, 'Wendy Emily Soegiarto', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2010-10-10', '', '0', '0.0', '0.0', '', '', 'Raya Satelit Utara KN-4', '', '0317313905', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('943', 'PMB2014150943', null, 'William Jacobson Manurung', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2010-10-10', '', '0', '0.0', '0.0', '', '', 'William Jacobson Manurung', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('944', 'PMB2014150944', null, 'Abbeygail Maryoel Widjaja', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-02-28', '', '0', '0.0', '0.0', '', '', 'Darmo Green Garden E-5', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('945', 'PMB2014150945', null, 'Aislynn Calista Sutanto', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-03-09', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Indah III / XX-18', '', '0317326668', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('946', 'PMB2014150946', null, 'Caithlyn Mikayla Hiandinata', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2009-08-19', '', '0', '0.0', '0.0', '', '', 'East Emerald Mansion TP 1 / 42A Citraland', '', '03157431103', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('947', 'PMB2014150947', null, 'Cally Nicole Tanoko', '', '', null, '1', '', '0', '5', '0', 'P', 'Murdoch, Australia', '2009-07-04', '', '0', '0.0', '0.0', '', '', 'Graha Family O - 11', '', '0317326155', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('948', 'PMB2014150948', null, 'Danica Claire Suryo', '', '', null, '1', '', '0', '0', '0', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('949', 'PMB2014150949', null, 'Darrell Matthew Tedjokoesoemo', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-08-07', '', '0', '0.0', '0.0', '', '', 'Taman International I / FI - 20', '', '7442167', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('950', 'PMB2014150950', null, 'Finzell Brayden Suganda', '', '', null, '1', '', '0', '4', '0', 'L', 'Malang', '2009-01-12', '', '0', '0.0', '0.0', '', '', 'Graha Famili D - 109', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('951', 'PMB2014150951', null, 'Giselle Maureen Sugianto', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-07-22', '', '0', '0.0', '0.0', '', '', 'Villa Taman Telaga TJ 6 / 2 Citraland', '', '0317450768', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('952', 'PMB2014150952', null, 'Jacqueline Jovanka Lin', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-11-18', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2  PD7 15', '', '0317391527', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('953', 'PMB2014150953', null, 'Joaquin Melvin Christianto', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-08-01', '', '0', '0.0', '0.0', '', '', 'Petemon 4 / 70', '', '0315314869', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('954', 'PMB2014150954', null, 'Joshua Wangsaputra', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-12-18', '', '0', '0.0', '0.0', '', '', 'Darmo Indah Barat II / F-9', '', '0317349321', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('955', 'PMB2014150955', null, 'Raphael Gerrard Sukendy', '', '', null, '1', '', '0', '4', '0', 'L', 'Surabaya', '2009-10-31', '', '0', '0.0', '0.0', '', '', 'Magnolia CM-18, Chofa Raya Sukomanunggal Asri', '', '0317321784', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('956', 'PMB2014150956', null, 'Rhenata Zefanya Handojo', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2009-09-09', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan VI / EC-19', '', '0317346930', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('957', 'PMB2014150957', null, 'Sharleen Abigail Winston', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-09-02', '', '0', '0.0', '0.0', '', '', 'Graha Family W-6', '', '0317322124', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('958', 'PMB2014150958', null, 'Stanley Ferdinand Surya', '', '', null, '1', '', '0', '4', '0', 'L', 'Surabaya', '2009-10-28', '', '0', '0.0', '0.0', '', '', 'Darmo Hill R-23', '', '5683008', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('959', 'PMB2014150959', null, 'Wang Ruo Chen', '', '', null, '1', '', '0', '1', '0', 'P', 'Surabaya', '2009-09-27', '', '0', '0.0', '0.0', '', '', 'Rayen Regency F-5', '', '0317510224', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('960', 'PMB2014150960', null, 'Anya Quinn Sutiono', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-09-08', '', '0', '0.0', '0.0', '', '', 'Pakis Argosari VII / 51', '', '0315685314', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('961', 'PMB2014150961', null, 'Austin Nolan Herlambang', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2007-07-07', '', '0', '0.0', '0.0', '', '', 'Palm Hills II / K8-20 Citraland', '', '0317441208', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('962', 'PMB2014150962', null, 'Candice Carissa Sutedjo', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2009-09-12', '', '0', '0.0', '0.0', '', '', 'Graha Family F-58', '', '0317385658', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('963', 'PMB2014150963', null, 'Hizkia Debharim Xue', '', '', null, '1', '', '0', '0', '0', 'L', 'Surabaya', '2009-05-20', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('964', 'PMB2014150964', null, 'Jordan James Suryaputra', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-08-25', '', '0', '0.0', '0.0', '', '', 'Graha Family H-21', '', '0317385558', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('965', 'PMB2014150965', null, 'Joselyn Clarence Kurniawan', '', '', null, '1', '', '0', '4', '0', 'P', 'Surabaya', '2009-02-06', '', '0', '0.0', '0.0', '', '', 'Puncak Permai Utara II / 6', '', '7321661', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('966', 'PMB2014150966', null, 'Josh Owen Hadiyanto', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-10-07', '', '0', '0.0', '0.0', '', '', 'Puri Widya Kencana K3 / 22', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('967', 'PMB2014150967', null, 'Kelleen Wijaya', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-03-14', '', '0', '0.0', '0.0', '', '', 'Graha Family L-117', '', '0317320604', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('968', 'PMB2014150968', null, 'Li Zi Yi', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2008-10-26', '', '0', '0.0', '0.0', '', '', 'Raya Sukomanunggal Jaya No.33A', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('969', 'PMB2014150969', null, 'Matthew Sutiono', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-12-01', '', '0', '0.0', '0.0', '', '', 'Pakuwon Villa Bukit Indah AA - 9 / 26', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('970', 'PMB2014150970', null, 'Naomi Valerie Herlambang', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-11-30', '', '0', '0.0', '0.0', '', '', 'Pakuwon One Golf Terrace AB 10/32', '', '0317391995', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('971', 'PMB2014150971', null, 'Nicholas Emmanuel Widjaja', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-07-22', '', '0', '0.0', '0.0', '', '', 'Alamanda RE-6 Chofa Sukomanunggal', '', '0317320982', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('972', 'PMB2014150972', null, 'Nicole Wu', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-05-16', '', '0', '0.0', '0.0', '', '', 'Tanjungsari Baru I / 12', '', '0317313589', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('973', 'PMB2014150973', null, 'Rico Halim', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-07-25', '', '0', '0.0', '0.0', '', '', 'Tanjungsari Baru II / 10', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('974', 'PMB2014150974', null, 'Vivianne Kaila Josephine Lim', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-08-12', '', '0', '0.0', '0.0', '', '', 'Villa Sentra Raya D5 / 11 Citraraya', '', '0317401714', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('975', 'PMB2014150975', null, 'Wilson Seputro', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-07-10', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas Mediteranian M-26', '', '0315611919', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('976', 'PMB2014150976', null, 'Astrella Richelle Sumargo', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-05-15', '', '0', '0.0', '0.0', '', '', 'Tanjung Sari Baru 3 / 22', '', '7346175', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('977', 'PMB2014150977', null, 'Aurelia Geraldine Logioto', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-11-18', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas B9 / 2', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('978', 'PMB2014150978', null, 'Christopher Elias Lim', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-09-06', '', '0', '0.0', '0.0', '', '', 'Graha Family FF-10', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('979', 'PMB2014150979', null, 'Darell Nathaniel Wu', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-10-30', '', '0', '0.0', '0.0', '', '', 'Woodland WL 2 / 89 Citraland', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('980', 'PMB2014150980', null, 'Davin Aviel Tanujaya', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-04-06', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Mas H  1', '', '0315663797', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('981', 'PMB2014150981', null, 'Giovanni Edgina Setiawan', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-01-30', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Indah I / XX-21', '', '0317317341', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('982', 'PMB2014150982', null, 'Kelsey Christabelle Sugiantoro', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-01-24', '', '0', '0.0', '0.0', '', '', 'Stamford Place ST 6/28 Citraland', '', '03151997246', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('983', 'PMB2014150983', null, 'Kenneth Huang', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-08-13', '', '0', '0.0', '0.0', '', '', 'Royal Residence B II / 96', '', '03171162333', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('984', 'PMB2014150984', null, 'Kevin Gregory Wijaya', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-09-20', '', '0', '0.0', '0.0', '', '', 'Bukit Darmo Golf Regency D-10', '', '0317384142', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('985', 'PMB2014150985', null, 'Kiersten Jane Priatman', '', '', null, '1', '', '0', '0', '0', 'P', 'Arcadia, Los Angeles', '2009-02-09', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('986', 'PMB2014150986', null, 'Kimmi Madelaine Kusumo', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-03-15', '', '0', '0.0', '0.0', '', '', 'Kupang Indah XV / 27', '', '0317318600', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('987', 'PMB2014150987', null, 'Meyer Ho', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2008-12-27', '', '0', '0.0', '0.0', '', '', 'Darmo Hill N-25', '', '0315636197', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('988', 'PMB2014150988', null, 'Michella Audrey Wijaya', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-07-02', '', '0', '0.0', '0.0', '', '', 'Rafles Garden TB 8 / 16 Citraland', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('989', 'PMB2014150989', null, 'Michelle Pearl Dermawan', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '2009-01-20', '', '0', '0.0', '0.0', '', '', 'Darmo Harapan Utara VI / EY-4', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('990', 'PMB2014150990', null, 'Neisken Matthew Nugroho', '', '', null, '1', '', '0', '5', '0', 'L', 'Surabaya', '2009-03-20', '', '0', '0.0', '0.0', '', '', 'Wisata Bukit Mas GG-5', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('991', 'PMB2014150991', null, 'Valescha Trixie Wijaya', '', '', null, '1', '', '0', '5', '0', 'P', 'Surabaya', '1999-04-24', '', '0', '0.0', '0.0', '', '', 'Villa Bukit Regency 2 / PD7 - 2 Pakuwon Indah', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('992', 'PMB2014150992', null, 'paijo tes', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', 'A', '', '', '', '', null, null, '', null, '', null, null, null, null, '1', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('1009', '212', null, 'wiro sableng', '', '', null, '1', '', '0', '2', '0', '', '', '2014-10-23', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('1012', '212', null, 'wiro sableng', '', '', null, '1', '', '0', '2', '0', '', '', '2014-10-23', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('1013', '212', null, 'wiro sableng', '', '', null, '1', '', '0', '2', '0', '', '', '2014-10-23', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('1014', 'PMB2014150993', null, 'the hulk', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '0', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('1015', 'PMB2014140001', null, 'Kaitlynn Tiffany L.', '111', '', null, '1', '', '0', '0', '1', 'P', 'Surabaya', '2012-11-10', '', '0', '0.0', '0.0', '', '', 'Delta Raya IV/12 Sidoarjo', '', '0811909765', null, null, '', null, '', null, null, null, null, '254', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('1016', '000001', null, 'Dani', '', '', null, '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '114', '', '', '', '', '');
INSERT INTO `psb_siswa_copy` VALUES ('1017', '000001', null, 'RAni', '', '', null, '1', '', '0', '2', '0', 'P', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', null, null, '', null, '', null, null, null, null, '114', '', '', '', '', '');

-- ----------------------------
-- Table structure for psb_siswaayah
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswaayah`;
CREATE TABLE `psb_siswaayah` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `namaayah` varchar(100) NOT NULL,
  `tempatlahirayah` varchar(50) NOT NULL,
  `tanggallahirayah` date NOT NULL,
  `agamaayah` int(10) unsigned NOT NULL DEFAULT '0',
  `warganegaraayah` varchar(50) NOT NULL,
  `kodeposayah` int(5) NOT NULL,
  `kotaayah` varchar(20) NOT NULL,
  `pendidikanayah` varchar(50) NOT NULL,
  `bidangpekerjaanayah` varchar(50) NOT NULL,
  `pekerjaanayah` varchar(50) NOT NULL,
  `posisiayah` varchar(50) NOT NULL,
  `penghasilanayah` decimal(10,0) NOT NULL DEFAULT '0',
  `telponayah` varchar(20) NOT NULL,
  `pinbbayah` varchar(20) NOT NULL,
  `emailayah` varchar(100) NOT NULL,
  `alamatayah` text NOT NULL,
  `hpayah` varchar(15) NOT NULL,
  `faxrumahayah` varchar(15) NOT NULL,
  `alamatkantorayah` text NOT NULL,
  `telponkantorayah` varchar(15) NOT NULL,
  `faxkantorayah` varchar(15) NOT NULL,
  `gerejaayah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `calonsiswa` (`siswa`) USING BTREE,
  CONSTRAINT `calonsiswaFk` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswaayah
-- ----------------------------
INSERT INTO `psb_siswaayah` VALUES ('46', '193', 'Triady Taslim', '', '2015-12-02', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('55', '202', 'Hendrik Gunawan', 'surabaya', '1978-05-28', '4', 'indonesia', '0', '', 's2', 'Creamer', 'swasta', '', '0', '', '', 'HENDRIKGUNAWAN@gmail.com', 'Woodland WL 2/88 Citraland', '081331076999', '', 'mojosari', '', '', 'St. Yakobus');
INSERT INTO `psb_siswaayah` VALUES ('56', '203', 'denny tanujaya', 'surabaya', '1981-01-01', '5', 'indonesia', '0', 'surabaya', 'high school', 'material building', '', '', '0', '', '', 'dto31@yahoo.com', 'satelit indah 9 / GN - 18', '085100109151', '7312413', '', '', '', 'GKI Dasa');
INSERT INTO `psb_siswaayah` VALUES ('57', '204', 'hamonangan sidabutar', 'siantar', '1973-04-28', '5', 'indonesia', '0', 'surabaya', 's1 ekonomi', 'property', 'karyawan swasta', 'director', '0', '', '', 'hamasiah2004@yahoo.com', 'Manukan Peni A-4 / 12 ', '0811378803', '', '', '0317512333', '', 'masehi advent hari ketujuh');
INSERT INTO `psb_siswaayah` VALUES ('58', '205', 'herman saputra', '', '2015-12-10', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('59', '206', 'Adi Cipta Jayadi', 'surabaya', '1980-10-29', '4', 'indonesia', '0', '', 's2', '', 'businessman', '', '0', '', '', '', 'sukomanunggal jaya elok E/22 RT/RW 005/003', '081331933818', '', '', '', '', 'Algonz');
INSERT INTO `psb_siswaayah` VALUES ('60', '207', 'George Layarta', 'Surabaya', '1979-06-16', '1', 'Indonesia', '0', 'Surabaya', 'S1', 'F \'n B', 'Enterpreneur', 'Owner', '0', '031 5743 11 11', '', 'georgelayarta@yahoo.co.id', 'North emerald Mansion TN 7/6', '0812 292 33 333', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('61', '208', 'Henricus Lusida', 'Surabaya', '1967-10-18', '4', 'Indonesia', '0', '', 'Bachelor Degree', 'Shrimp Farm', '', 'owner', '0', '', '', 'henri.lusida@gmail.com', '', '081 850 9589', '', 'Mutiara margomulyo permai C3/5', '0822 3133 7788', '', 'Redeemptor Mundi');
INSERT INTO `psb_siswaayah` VALUES ('62', '209', 'Ferry Siswanto', 'Surabaya', '1974-07-01', '5', 'Indonesia', '0', '', 'Bachelor of echonomics', 'Trading', 'Owner', '', '0', '031 732 4606', '', '', 'Jl Darmo Indah Asri Blok AD / 25', '081 3406 40188', '', '', '', '', 'GPDI Sion Permai');
INSERT INTO `psb_siswaayah` VALUES ('63', '210', 'Adi Purnomo', 'Surabaya', '1973-08-15', '0', 'Indonesia', '0', 'Surabaya', 'Master degree', 'food suplement', '', 'distributor', '0', '031 732 7067', '', 'adi_purnomo@yahoo.com', 'Graha Family CC 35 ', '082 245 306 399', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('64', '211', 'Herman Saputra', 'Surabaya', '0000-00-00', '5', 'Indonesia', '0', '', 'S1', 'food', '', 'Supervisor staff', '0', '', '', 'herman170707@lycos.com', '', '081 654 076 28', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('65', '212', 'Anthony eng', 'Singapore', '0000-00-00', '0', 'Singapore', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('66', '213', 'Johanes Reza Harianto', 'Surabaya', '1979-04-13', '5', '', '0', 'Surabaya', 'S1', 'Technical Tools Trading', '', 'General Manager', '0', '031 99 00 1174', '', 'jrharianto@hotmail.com', 'Ritzwood AE 2 no.31, Pakuwon Indah', '081 23 000 288', '', '', '031 848 4200', '', 'GPT Kristus Gembala');
INSERT INTO `psb_siswaayah` VALUES ('67', '214', 'Samuel Denyanto', 'Surabaya', '1981-12-20', '5', 'Indonesia', '0', '', 'S1', '', 'Marketing', '', '0', '031 741 3085', '', 'sdenyanto@gmail.com', 'Jl. Kedungtarukan 148', '081 332 757 697', '', '', '', '', 'GKKA Arjuno');
INSERT INTO `psb_siswaayah` VALUES ('68', '215', 'Tribudiono Kiswanto', 'Surabaya', '1968-06-06', '5', 'Indonesia', '0', '', 'S1', '', 'swasta', '', '0', '', '', 'anroodadunia@gmail.com', '', '0812 354 1700', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('69', '216', 'Rudy Wianto Chandra', 'Sidoarjo', '1974-10-24', '1', 'Indonesia', '0', 'Surabaya', '', 'Chemical', '', 'Marketing Director', '0', '0811 3520 712', '', 'rudy.wchandra@gmail.com', 'Graha Family P-18 ', '0811 3520 712', '', 'Jl. Ambengan no 1-X Surabaya', '031 531 1596', '', '');
INSERT INTO `psb_siswaayah` VALUES ('70', '217', 'Rheno Adrian', 'Surabaya', '1979-12-26', '4', 'Indonesia', '0', 'Surabaya', '', '', '', '', '0', '', '', 'rhenoadrian@yahoo.com', 'Pakis Argosari V Blok B-10', '081 131 0079', '', '', '', '', 'Redemptor Mundi');
INSERT INTO `psb_siswaayah` VALUES ('71', '218', 'Didik Priantono', 'Surabaya', '1977-12-26', '5', 'Indonesia', '0', 'Surabaya', '', 'enterpreneur', '', 'owner', '0', '', '', 'di2kpriantono@gmail.com', 'Dukuh Kupang Utara I no 15', '081 2345 444 66', '', '', '', '', 'Mawar Sharon');
INSERT INTO `psb_siswaayah` VALUES ('72', '219', 'Wiradinata', 'Surabaya', '1980-12-11', '5', 'Indonesia', '0', 'Surabaya', 'S1', 'Plastik', '', 'Owner', '0', '', '', 'wiradinata99@yahoo.com', ' Kencana Sari Barat K/1-B', '081 133 4874', '', '', '', '', 'Bethany');
INSERT INTO `psb_siswaayah` VALUES ('73', '220', 'Nico Gunawan', 'Surabaya', '0000-00-00', '5', 'Indonesia', '0', 'Sidoarjo', 'Master Degree', 'Manufactur', '', 'Manager', '0', '', '', 'nicogunawanbest@yahoo.com', 'Pondok candra Indah Jl. Melon selatan II/21', '081 230 848 24', '', '', '031 843 9503', '', 'Mawar Sharon');
INSERT INTO `psb_siswaayah` VALUES ('74', '221', 'Eka Budi Prasetya', 'Surabaya', '1977-05-01', '4', 'Indonesia', '0', '', 'S2', 'Steel', '', '', '0', '031 534 5134', '', 'prasek00@yahoo.com', 'Jl. Tulungagung 3 /39', '0878 5166 1260', '', 'Margomulyo no 6', '031 749 1719', '', '');
INSERT INTO `psb_siswaayah` VALUES ('75', '222', 'Aswin Pribadi Widodo', 'Makasar', '1970-12-24', '0', '', '0', '', '', '', '', '', '0', '031 7310 950', '', 'aswin_widodo@yahoo.com', '', '081 138 2882', '', 'Jl. Margomulyo permai AC 31', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('76', '223', 'Widjanarkoo Kho', 'Surabaya', '1980-04-20', '4', 'Indonesia', '0', 'Surabaya', '', 'Telecommunication', 'enterpreneur', 'Owner', '0', '031 382 00 36', '', 'kevin_widjanarko@yahoo.com', 'Lebak Indah Jaya I Kav 9', '081 62 99 999', '', '', '', '', 'St. Simon Chapel');
INSERT INTO `psb_siswaayah` VALUES ('77', '224', 'Suwandojo Hartono', 'Madiun', '1969-01-10', '5', 'Indonesia', '0', 'Surabaya', 'S1', '', '', 'Branch Manager', '0', '031 752 2426', '', '', 'Vila Valensia CA 5/50', '081 832 6779', '', '', '031 828 0612', '', 'Sidang Jemaat Kristus');
INSERT INTO `psb_siswaayah` VALUES ('78', '225', 'Harry Halim', 'Banjarmasin', '0000-00-00', '5', 'Indonesia', '0', 'Surabaya', 's1', 'Kimia', '', 'Direktur', '0', '', '', 'harrylin52hotmail.com', 'Puri Sentra Raya PS2 no 41', '081 137 2556', '', '', '', '', 'Mawar Sharon');
INSERT INTO `psb_siswaayah` VALUES ('79', '226', 'Andri Prasetya', 'Banyuwangi', '1981-06-01', '5', 'Indonesia', '0', '', 'S1', 'Bicycle Store', 'Businessman', 'Owner', '0', '031 99000375', '', 't3k_wen@yhoo.com', '', '081 330 2800 86', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('80', '227', 'Liem, Ronny Limanto', 'Surabaya', '0000-00-00', '5', 'Indonesia', '0', '', 'S1', 'Distributor', '', 'Manager', '0', '', '', 'ronnylimanto@gmail.com', '', '0857 731 238 88', '', '', '081 331 009 651', '', 'GKI Darmo Satelit');
INSERT INTO `psb_siswaayah` VALUES ('82', '229', 'Handoyo Njoto Hartanto', 'Surabaya', '1978-08-13', '1', 'Indonesia', '0', 'Surabaya', '', 'Retails', '', 'owner', '0', '', '', 'jinghay@yahoo.com', 'Satelit Indah III/CN 18', '081 737 8008', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('83', '230', 'Echy Oesjady', '', '2015-12-10', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('84', '231', 'Hengky candra', '', '2015-12-03', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('86', '233', 'Irwanto', '', '0000-00-00', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('87', '234', 'Chitrahadi Sudirman', '', '0000-00-00', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('88', '235', 'Prapto Nugroho', '', '2015-12-02', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('89', '236', 'Andy Prayitno', '', '2015-12-11', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('90', '237', 'Ifan Okawida', '', '0000-00-00', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('91', '238', 'Adi Surya Herdianto', '', '2015-12-10', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('92', '239', 'David Sugianto Sutanto', '', '2015-12-12', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('93', '240', 'Romy Janto Soemarno', '', '2015-12-04', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('94', '241', 'Echy Oesjady', '', '2015-12-01', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaayah` VALUES ('95', '242', 'Rendy Motanto', '', '2015-12-03', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for psb_siswabiaya
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswabiaya`;
CREATE TABLE `psb_siswabiaya` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `detailbiaya` int(11) NOT NULL,
  `viabayar` int(11) NOT NULL,
  `isAngsur2` int(1) NOT NULL,
  `angsuran` int(11) NOT NULL,
  `ketdiskonkhusus` text NOT NULL,
  `diskonkhusus` decimal(14,0) NOT NULL,
  `nodiskonkhusus` varchar(25) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  KEY `biaya` (`detailbiaya`) USING BTREE,
  KEY `viabayar` (`viabayar`) USING BTREE,
  CONSTRAINT `siswaFK2` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswabiaya
-- ----------------------------
INSERT INTO `psb_siswabiaya` VALUES ('654', '193', '677', '3', '1', '4', 'disk khus', '100000', '');
INSERT INTO `psb_siswabiaya` VALUES ('655', '193', '6330', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('656', '193', '668', '3', '1', '5', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('657', '193', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('690', '202', '6336', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('691', '202', '6334', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('692', '202', '6335', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('693', '202', '6337', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('694', '203', '6336', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('695', '203', '6334', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('696', '203', '6335', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('697', '203', '6337', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('698', '204', '6336', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('699', '204', '6334', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('700', '204', '6335', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('701', '204', '6337', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('702', '205', '6336', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('703', '205', '6334', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('704', '205', '6335', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('705', '205', '6337', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('706', '206', '6336', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('707', '206', '6334', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('708', '206', '6335', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('709', '206', '6337', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('710', '207', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('711', '207', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('712', '207', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('713', '207', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('714', '208', '6388', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('715', '208', '6386', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('716', '208', '6387', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('717', '208', '6389', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('718', '209', '6376', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('719', '209', '6374', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('720', '209', '6375', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('721', '209', '6377', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('722', '210', '6376', '2', '0', '0', ' ', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('723', '210', '6374', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('724', '210', '6375', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('725', '210', '6377', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('726', '211', '6376', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('727', '211', '6374', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('728', '211', '6375', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('729', '211', '6377', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('730', '212', '6376', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('731', '212', '6374', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('732', '212', '6375', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('733', '212', '6377', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('734', '213', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('735', '213', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('736', '213', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('737', '213', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('738', '214', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('739', '214', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('740', '214', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('741', '214', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('742', '215', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('743', '215', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('744', '215', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('745', '215', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('746', '216', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('747', '216', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('748', '216', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('749', '216', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('750', '217', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('751', '217', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('752', '217', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('753', '217', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('754', '218', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('755', '218', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('756', '218', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('757', '218', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('758', '219', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('759', '219', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('760', '219', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('761', '219', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('762', '220', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('763', '220', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('764', '220', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('765', '220', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('766', '221', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('767', '221', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('768', '221', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('769', '221', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('770', '222', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('771', '222', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('772', '222', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('773', '222', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('774', '223', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('775', '223', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('776', '223', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('777', '223', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('778', '224', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('779', '224', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('780', '224', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('781', '224', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('782', '225', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('783', '225', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('784', '225', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('785', '225', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('786', '226', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('787', '226', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('788', '226', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('789', '226', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('790', '227', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('791', '227', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('792', '227', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('793', '227', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('798', '229', '6352', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('799', '229', '6350', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('800', '229', '6351', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('801', '229', '6353', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('802', '230', '677', '2', '0', '0', '  ', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('803', '230', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('804', '230', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('805', '231', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('806', '231', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('807', '231', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('811', '233', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('812', '233', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('813', '233', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('814', '234', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('815', '234', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('816', '234', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('817', '235', '677', '2', '0', '0', ' ', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('818', '235', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('819', '235', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('820', '236', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('821', '236', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('822', '236', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('823', '237', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('824', '237', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('825', '237', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('826', '238', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('827', '238', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('828', '238', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('829', '239', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('830', '239', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('831', '239', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('832', '240', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('833', '240', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('834', '240', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('835', '241', '677', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('836', '241', '668', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('837', '241', '659', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('838', '242', '713', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('839', '242', '704', '2', '0', '0', '', '0', '');
INSERT INTO `psb_siswabiaya` VALUES ('840', '242', '695', '2', '0', '0', '', '0', '');

-- ----------------------------
-- Table structure for psb_siswadiskon
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswadiskon`;
CREATE TABLE `psb_siswadiskon` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswabiaya` int(11) NOT NULL,
  `detaildiskon` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswabiaya` (`siswabiaya`) USING BTREE,
  KEY `detaildiskon` (`detaildiskon`) USING BTREE,
  CONSTRAINT `detaildiskonFK2` FOREIGN KEY (`detaildiskon`) REFERENCES `psb_detaildiskon` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siswabiayaFK` FOREIGN KEY (`siswabiaya`) REFERENCES `psb_siswabiaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswadiskon
-- ----------------------------

-- ----------------------------
-- Table structure for psb_siswadokumen
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswadokumen`;
CREATE TABLE `psb_siswadokumen` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `subdokumen` int(11) NOT NULL,
  `file` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  KEY `subdokumen` (`subdokumen`) USING BTREE,
  CONSTRAINT `siswaFK` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subdokumenFK` FOREIGN KEY (`subdokumen`) REFERENCES `psb_subdokumen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswadokumen
-- ----------------------------

-- ----------------------------
-- Table structure for psb_siswaibu
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswaibu`;
CREATE TABLE `psb_siswaibu` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `namaibu` varchar(100) NOT NULL,
  `tempatlahiribu` varchar(50) NOT NULL,
  `tanggallahiribu` date NOT NULL,
  `agamaibu` int(10) unsigned NOT NULL DEFAULT '0',
  `warganegaraibu` varchar(50) NOT NULL,
  `kodeposibu` int(5) NOT NULL,
  `kotaibu` varchar(20) NOT NULL,
  `pendidikanibu` varchar(50) NOT NULL,
  `bidangpekerjaanibu` varchar(50) NOT NULL,
  `pekerjaanibu` varchar(50) NOT NULL,
  `posisiibu` varchar(50) NOT NULL,
  `penghasilanibu` decimal(10,0) NOT NULL DEFAULT '0',
  `telponibu` varchar(20) NOT NULL,
  `pinbbibu` varchar(20) NOT NULL,
  `emailibu` varchar(100) NOT NULL,
  `alamatibu` text NOT NULL,
  `hpibu` varchar(15) NOT NULL,
  `faxrumahibu` varchar(15) NOT NULL,
  `alamatkantoribu` text NOT NULL,
  `telponkantoribu` varchar(15) NOT NULL,
  `faxkantoribu` varchar(15) NOT NULL,
  `gerejaibu` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `calonsiswa` (`siswa`) USING BTREE,
  CONSTRAINT `psb_siswaibu_ibfk_1` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswaibu
-- ----------------------------
INSERT INTO `psb_siswaibu` VALUES ('46', '193', 'Mia Hapsari', '', '2015-12-01', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('55', '202', 'Florencia Agnes Setiono', 'surabaya', '1980-12-11', '4', 'indonesia', '0', 'surabaya', 's1', 'furniture', 'swasta', '', '0', '', '', 'myfurnishop.floren@gmail.com', 'Woodland WL 2/88 Citraland', '08155128883', '', '', '', '', 'St. Yakobus');
INSERT INTO `psb_siswaibu` VALUES ('56', '203', 'moona wintoro', 'surabaya', '1982-02-02', '5', 'indonesia', '0', 'surabaya', 'high school', 'konveksi', '', '', '0', '', '', 'mwo31@yahoo.com', 'satelit indah 9 / GN - 18', '085100109151', '7312413', '', '', '', 'GKI Dasa');
INSERT INTO `psb_siswaibu` VALUES ('57', '204', 'selvy tobing', 'madiun', '1977-02-01', '5', 'indonesia', '0', 'surabaya', 's1 Ekonomi', '', 'ibu rt', '', '0', '', '', 'selvy.sid@gmail.com', 'Manukan Peni A-4 / 12 ', '0811344037', '', '', '', '', 'masehi advent hari ketujuh');
INSERT INTO `psb_siswaibu` VALUES ('58', '205', 'grace lindra', '', '2015-12-03', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('59', '206', 'yuliana', 'palembang', '1980-07-27', '4', 'indonesia', '0', 'surabaya', 's1', '', 'housewife', '', '0', '7320208', '', '', 'sukomanunggal jaya elok E/22 RT/RW 005/003', '082132347893', '', '', '', '', 'Algonz');
INSERT INTO `psb_siswaibu` VALUES ('60', '207', 'Ventalia', 'Banyuwangi', '1980-03-27', '1', 'Indonesia', '0', '', 'S1', '', '', '', '0', '', '', '', '', '0821 153 66 666', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('61', '208', 'Megawati Hong', 'Sidoarjo', '1967-10-04', '4', 'Indonesia', '0', '', 'Bachelor degree', 'Cigarette Company', '', 'Manager', '0', '', '', 'megawatihonglusida@gmail.com', '', '081 2351 7527', '', '', '0343 631 203', '', 'Redemptor Mundi');
INSERT INTO `psb_siswaibu` VALUES ('62', '209', 'Virna Lucilla', 'Malang', '1975-01-17', '5', 'Indonesia', '0', '', '', '', '', '', '0', '', '', '', '', '081 6152 88 999', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('63', '210', 'Lim Karyana', 'Sampit', '1976-10-05', '4', 'Indonesia', '0', '', '', '', '', '', '0', '', '', '', '', '081 832 8526', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('64', '211', 'Grace Lindra', 'Surabaya', '0000-00-00', '5', 'Indonesia', '0', 'Surabaya', 'S1', '', '', '', '0', '', '', '', 'Prambanan Residence CB 8', '085 853 394 639', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('65', '212', 'Irene Tan Mui Hong Martowijoyo', 'Makasar', '1980-12-12', '5', 'Indonesia', '0', '', '', '', '', '', '0', '', '', 'dec_3180@yahoo.com', '', '081 143 2688', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('66', '213', 'Lesly Tanizar', 'Surabaya', '1979-01-06', '0', 'Indonesia', '0', '', 'S1', '', '', '', '0', '0851 005 09949', '', 'ltanizar@yahoo.com', '', '081 837 2591', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('67', '214', 'Evelin Laura Ansela Jayawiyanto', 'Semarang', '1983-06-07', '5', 'Indonesia', '0', '', '', '', '', '', '0', '', '', 'laura_jayawiyanto@yahoo.com', '', '0815 771 9725', '', '', '', '', 'GKKA Arjuno');
INSERT INTO `psb_siswaibu` VALUES ('68', '215', 'Henisiniwati Olii', 'Surabaya', '1977-12-13', '5', 'Indonesia', '0', '', 's1', 'Ibu rumah Tangga', '', '', '0', '', '', 'heni_olii@yahoo. com', '', '0815 1563 1615', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('69', '216', 'Yang Ya Hui', 'China', '1973-05-19', '1', 'Indonesia', '0', '', 'Diploma', 'Education', '', 'Teacher', '0', '031 752 4704', '', 'yang.yahui79@gmail.com', '', '', '', 'Jl Raya Darmo Permai III, Bavarian Village Surabaya', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('70', '217', 'Erni', 'Surabaya', '1980-05-03', '4', 'Indonesia', '0', '', '', '', '', '', '0', '', '', 'emie_i@hotmail.com', '', '081 739 3704', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('71', '218', 'Catur Sari Handayani', 'Surabaya', '1979-05-25', '5', 'Indonesia', '0', '', '', '', '', '', '0', '', '', 'jhovallencia@gmail.com', '', '0821 424 90 779', '', '', '', '', 'Mawar Sharon');
INSERT INTO `psb_siswaibu` VALUES ('72', '219', 'Lina Irawati', 'Kediri', '1980-11-23', '5', 'Indonesia', '0', '', 'S1', '', '', '', '0', '', '', 'lina99irawati@yahoo.com', '', '081 55 33 413 1', '', '', '', '', 'Bethany');
INSERT INTO `psb_siswaibu` VALUES ('73', '220', 'Martina Pisca Tansel', 'Ambon', '0000-00-00', '5', 'Indonesia', '0', '', 'Master Degree', 'Cigarette Manufacturer', '', 'Engineer', '0', '', '', 'tansel_martina@yahoo.com', '', '081 330 337 284', '', 'Rungkut Industri Raya 18', '031 843 1699', '', 'Mawar Sharon');
INSERT INTO `psb_siswaibu` VALUES ('74', '221', 'Laniana', 'Surabaya', '1979-08-07', '4', 'Indonesia', '0', '', '', '', '', '', '0', '031 534 5134', '', '', '', '081 733 5288', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('75', '222', 'Feby Angker', 'Dobo', '0000-00-00', '5', 'Indonesia', '0', '', '', '', '', '', '0', '081 33 33 378 00', '', 'feby_angker@yahoo.co.id', '', '031 7310 950', '', '', '', '', 'Mawar Sharon');
INSERT INTO `psb_siswaibu` VALUES ('76', '223', 'Yuliana Salim', 'Surabaya', '0000-00-00', '4', 'Indonesia', '0', '', 'S1', 'Ibu Rumah Tangga', '', '', '0', '', '', 'meyling_salim@ymail.com', '', '0855 373 99 99', '', '', '', '', 'St. Simon Chapel');
INSERT INTO `psb_siswaibu` VALUES ('77', '224', 'Vilan Oktafia', 'Dompu', '1978-01-28', '5', '', '0', '', 'S1', '', '', '', '0', '', '', 'vilanme@i@yahoo.com', '', '081 216 41818', '', '', '', '', 'Sidang Jemaat Allah');
INSERT INTO `psb_siswaibu` VALUES ('78', '225', 'Sienny Ko', 'Surabaya', '1978-12-09', '5', '', '0', '', '', '', '', '', '0', '', '', 'siennyko@gmail.com', '', '0812 302 8171', '', '', '', '', 'Mawar Sharon');
INSERT INTO `psb_siswaibu` VALUES ('79', '226', 'Djui Siang', 'Gresik', '1984-12-31', '5', 'Indonesia', '0', 'Surabaya', 'S1', 'House Wife', '', '', '0', '', '', 'djui_siang@yahoo.com', 'Royal residence B10/70', '081 230 890 19', '', '', '', '', 'GBT Kristus Hayat');
INSERT INTO `psb_siswaibu` VALUES ('80', '227', 'San San', 'Blitar', '0000-00-00', '4', 'Indonesia', '0', 'Surabaya', '', '', '', '', '0', '', '', 'tiga_tiga82@hotmail.comS1', 'Sukomanunggal Jaya IX/9', '0856 338 1833', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('82', '229', 'Veronica Kusuma', 'Situbondo', '1981-02-28', '4', 'Indonesia', '0', '', '', '', '', '', '0', '', '', 'veronicakusuma81@yahoo.com', '', '081 330 311 321', '', '', '', '', 'Aloysius Gonzaga');
INSERT INTO `psb_siswaibu` VALUES ('83', '230', 'Winda Anggraini Lukito', '', '2015-12-10', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('84', '231', 'Emilia Amsal', '', '2015-12-04', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('86', '233', 'Lince R Wijaya', '', '2015-12-02', '0', 'Hongkong', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('87', '234', 'Meliana Kusuma', '', '2015-12-10', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('88', '235', 'Romana Thensy Sheilla Dewi', '', '2015-12-03', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('89', '236', 'Yoren Viryamarchyo', '', '2015-12-02', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('90', '237', 'Selvi Januarini Wibhawa', '', '0000-00-00', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('91', '238', 'Silvia Irene', '', '2015-12-04', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('92', '239', 'Veronica Basuki', '', '2015-12-17', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('93', '240', 'Vivi Pratiwi', '', '2015-12-03', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('94', '241', 'Winda Anggraini Lukito', '', '2015-12-03', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `psb_siswaibu` VALUES ('95', '242', 'Silvia Kuncoro', '', '2015-12-03', '0', '', '0', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for psb_siswakontakdarurat
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswakontakdarurat`;
CREATE TABLE `psb_siswakontakdarurat` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `namakontakdarurat` varchar(100) NOT NULL,
  `hubkontakdarurat` varchar(30) NOT NULL,
  `telponkontakdarurat1` varchar(50) NOT NULL,
  `telponkontakdarurat2` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  CONSTRAINT `siswaFK10` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswakontakdarurat
-- ----------------------------
INSERT INTO `psb_siswakontakdarurat` VALUES ('1', '207', 'Irene L', 'Aunty', '081 225 234 567', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('2', '207', 'Vandalia', 'Grand Ma', '081 2300 6398', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('3', '209', 'Yudi', 'Uncle', '081 231 553b75', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('4', '212', 'Bimo', 'Uncle', '081 143 0989', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('5', '213', 'Yolinda Hariato', 'Auntie', '081 333 888 653', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('6', '213', 'Jessie Tanizar', 'Auntie', '081 357 793 388', '031 753 2140');
INSERT INTO `psb_siswakontakdarurat` VALUES ('7', '213', 'Wensia Simardjo', 'Grand Ma', '081 858 1801', '031 99001174');
INSERT INTO `psb_siswakontakdarurat` VALUES ('8', '216', 'Tutik Winarni', 'Grand Ma', '081 134 2328', '031 752 4704');
INSERT INTO `psb_siswakontakdarurat` VALUES ('9', '216', 'Selvia Chadra', 'Aunty', '081 1377 398', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('10', '217', 'Christina Lanny', 'Gran Ma', '031 566 3340', '081 132 0805');
INSERT INTO `psb_siswakontakdarurat` VALUES ('11', '218', 'Elsye', 'Auntie', '031 7327454', '081 7036 71400');
INSERT INTO `psb_siswakontakdarurat` VALUES ('12', '220', 'Luki Indawati', 'Grand Ma', '031 734 9308', '081 751 86959');
INSERT INTO `psb_siswakontakdarurat` VALUES ('13', '220', 'Teddy Sutanto', 'Grand Pa', 'Grand Pa', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('14', '220', 'Ricky Sutanto', 'Uncle', '081 803 203 202', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('15', '221', 'Sienny', 'Auntie', '081 858 0870', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('16', '221', 'VITO', 'Uncle', '081 230 33258', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('17', '223', 'Sundoronarko', 'Uncle', '081 134 7976', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('18', '223', 'Vonita Asaleo', 'Grand Ma', '081 235 099 64', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('19', '226', 'Siau Fen', 'Aunty', '0821 153 66 666', '');
INSERT INTO `psb_siswakontakdarurat` VALUES ('20', '227', 'Liem Hong San', 'Grand Pa', '0851 038 900 36', '081 934 663 698');
INSERT INTO `psb_siswakontakdarurat` VALUES ('21', '227', 'Ngo Kwie Khioen', 'Grand Ma', '031 731 1843', '081 332 387 332');

-- ----------------------------
-- Table structure for psb_siswasaudara
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswasaudara`;
CREATE TABLE `psb_siswasaudara` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `jkelaminsaudara` enum('L','P') NOT NULL DEFAULT 'L',
  `namasaudara` varchar(100) NOT NULL,
  `tempatlahirsaudara` varchar(100) NOT NULL,
  `tanggallahirsaudara` date NOT NULL,
  `sekolahsaudara` varchar(50) NOT NULL,
  `gradesaudara` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  CONSTRAINT `siswaFK9` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswasaudara
-- ----------------------------
INSERT INTO `psb_siswasaudara` VALUES ('5', '207', 'P', 'Jennifer Layarta', 'Surabaya', '2013-12-17', '', '');
INSERT INTO `psb_siswasaudara` VALUES ('6', '208', 'L', 'Stefanus Hugo Lusida', 'Surabaya', '1997-06-09', 'UPH Jakarta', 'smt I');
INSERT INTO `psb_siswasaudara` VALUES ('7', '208', 'P', 'Elizabeth Angeline Lusida', 'Surabaya', '1994-11-15', 'UPH Jakarta', 'smt V');
INSERT INTO `psb_siswasaudara` VALUES ('8', '210', 'P', 'Jennifer Laurencia Purnomo', 'Surabaya', '2003-08-23', 'IPH', '7');
INSERT INTO `psb_siswasaudara` VALUES ('9', '211', 'P', 'Valerie Ivanna Wen', 'Surabaya', '2007-04-18', 'Spin', 'P3');
INSERT INTO `psb_siswasaudara` VALUES ('10', '211', 'L', 'Vincenzo Christoper Wen', 'Surabaya', '2013-06-18', 'Spin', '');
INSERT INTO `psb_siswasaudara` VALUES ('11', '213', 'L', 'Colin Cristo Harianto', 'Surabaya', '2008-01-19', 'Elyon', 'P2');
INSERT INTO `psb_siswasaudara` VALUES ('12', '214', 'L', 'Axton Marc D', 'Surabaya', '2015-05-21', '', '');
INSERT INTO `psb_siswasaudara` VALUES ('13', '214', 'P', 'Ashlyne Francia D', 'Surabaya', '2012-09-11', 'Ivy', 'KGB');
INSERT INTO `psb_siswasaudara` VALUES ('14', '216', 'L', 'William Chandra', 'Surabaya', '2007-03-11', 'Elyon', 'P3');
INSERT INTO `psb_siswasaudara` VALUES ('15', '217', 'L', 'Reiner Marcel Hidayat', 'Singapore', '2013-04-25', '', '');
INSERT INTO `psb_siswasaudara` VALUES ('16', '217', 'L', 'Rayden Marcel Hidayat', 'Singapore', '2015-06-06', '', '');
INSERT INTO `psb_siswasaudara` VALUES ('17', '219', 'P', 'Nia Gabriela Wili', 'Surabaya', '2011-10-09', 'lollypop', 'KG A');
INSERT INTO `psb_siswasaudara` VALUES ('18', '222', 'L', 'Kinsey Filbert Widodo', 'Surabaya', '2012-07-11', 'Lollypop', 'nurse');
INSERT INTO `psb_siswasaudara` VALUES ('19', '223', 'L', 'Arnold Jansen Kho', 'Surabaya', '2007-04-18', 'Elyon Christian School', 'P3');
INSERT INTO `psb_siswasaudara` VALUES ('20', '223', 'L', 'Abner Jeston Kho', 'Surabaya', '2012-11-02', 'Lollipop', 'PG A');
INSERT INTO `psb_siswasaudara` VALUES ('21', '224', 'L', 'Josh Franklin', 'Surabaya', '2007-05-27', 'Elyon', 'P3');
INSERT INTO `psb_siswasaudara` VALUES ('22', '225', 'P', 'Gloria Valerie Lim', 'Surabaya', '2008-02-02', 'Elyon', 'P3');
INSERT INTO `psb_siswasaudara` VALUES ('23', '226', 'L', 'Neilvin Andrison', 'Surabaya', '2013-04-10', 'Ivy', 'PG A');
INSERT INTO `psb_siswasaudara` VALUES ('24', '227', 'L', 'Skyler Liem', 'Surabaya', '2015-01-29', '', '');

-- ----------------------------
-- Table structure for psb_siswawali
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswawali`;
CREATE TABLE `psb_siswawali` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `namawali` varchar(20) NOT NULL,
  `jkelaminwali` enum('L','P') NOT NULL,
  `alamatwali` text NOT NULL,
  `kotawali` varchar(20) NOT NULL,
  `telponwali` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  CONSTRAINT `siswaFK8` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_siswawali
-- ----------------------------

-- ----------------------------
-- Table structure for psb_statussiswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_statussiswa`;
CREATE TABLE `psb_statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_statussiswa
-- ----------------------------

-- ----------------------------
-- Table structure for psb_subdokumen
-- ----------------------------
DROP TABLE IF EXISTS `psb_subdokumen`;
CREATE TABLE `psb_subdokumen` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `dokumen` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuanjumlah` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `dokumen` (`dokumen`) USING BTREE,
  KEY `tingkat` (`tingkat`) USING BTREE,
  CONSTRAINT `dokumenFK` FOREIGN KEY (`dokumen`) REFERENCES `psb_dokumen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tingkatFK6` FOREIGN KEY (`tingkat`) REFERENCES `aka_tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_subdokumen
-- ----------------------------
INSERT INTO `psb_subdokumen` VALUES ('26', '11', '1', '1', '1');
INSERT INTO `psb_subdokumen` VALUES ('36', '12', '7', '1', '1');
INSERT INTO `psb_subdokumen` VALUES ('42', '13', '6', '1', '2');
INSERT INTO `psb_subdokumen` VALUES ('43', '13', '7', '1', '2');
INSERT INTO `psb_subdokumen` VALUES ('45', '14', '7', '1', '1');
INSERT INTO `psb_subdokumen` VALUES ('49', '12', '6', '4', '1');
INSERT INTO `psb_subdokumen` VALUES ('50', '11', '2', '3', '1');
INSERT INTO `psb_subdokumen` VALUES ('51', '11', '3', '5', '1');
INSERT INTO `psb_subdokumen` VALUES ('52', '12', '1', '2', '1');
INSERT INTO `psb_subdokumen` VALUES ('53', '13', '1', '1', '1');
INSERT INTO `psb_subdokumen` VALUES ('54', '11', '6', '1', '1');

-- ----------------------------
-- Table structure for psb_suku
-- ----------------------------
DROP TABLE IF EXISTS `psb_suku`;
CREATE TABLE `psb_suku` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `suku` varchar(20) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`suku`),
  UNIQUE KEY `UX_suku` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_suku
-- ----------------------------
INSERT INTO `psb_suku` VALUES ('1', 'Jawa', '0');
INSERT INTO `psb_suku` VALUES ('2', 'Padang', '0');
INSERT INTO `psb_suku` VALUES ('3', 'Sunda', '0');

-- ----------------------------
-- Table structure for psb_syarat
-- ----------------------------
DROP TABLE IF EXISTS `psb_syarat`;
CREATE TABLE `psb_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `syarat` varchar(100) NOT NULL,
  `wajib` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_syarat
-- ----------------------------

-- ----------------------------
-- Table structure for psb_tmp
-- ----------------------------
DROP TABLE IF EXISTS `psb_tmp`;
CREATE TABLE `psb_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_tmp
-- ----------------------------

-- ----------------------------
-- Table structure for psb_tmp_saudara
-- ----------------------------
DROP TABLE IF EXISTS `psb_tmp_saudara`;
CREATE TABLE `psb_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_tmp_saudara
-- ----------------------------
INSERT INTO `psb_tmp_saudara` VALUES ('7', '8stsvc8fgc2d77gch0jgm8ona2', 'Raden Aditya Putra', '0000-00-00', 'Elyon Sukomanunggal');
INSERT INTO `psb_tmp_saudara` VALUES ('8', '8stsvc8fgc2d77gch0jgm8ona2', 'Firman Agung Satria', '0000-00-00', 'Elyon Sukomanunggal');
DROP TRIGGER IF EXISTS `ins_psb_biaya`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_biaya` AFTER INSERT ON `psb_biaya` FOR EACH ROW BEGIN

/*INSERT psb_detailbiaya */
/*detail detail gelombang -----------------------------------------------------------------------*/
	BLOCK1: begin
		declare vDetGelombang, vDept int;
		declare rowHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for
								select replid,departemen
								from  psb_detailgelombang;
		declare continue handler for not found set rowHabis1 = 1;
		open cursor1;
		LOOP1: loop
			fetch cursor1
			into  vDetGelombang,vDept;
			if rowHabis1 then
							close cursor1;
							leave LOOP1;
			end if;
			/*subtingkat  ---------------------------------------------------------------*/
			BLOCK2: begin
					declare vSubtingkat int;
					declare rowsHabis2 INT DEFAULT 0;  
					declare cursor3 cursor for  
							SELECT s.replid
							FROM aka_kelas k
									JOIN aka_subtingkat s on s.replid = k.subtingkat
							WHERE k.departemen = vDept
							GROUP BY s.replid;
					declare continue handler for not found set rowsHabis2 =1;
					open cursor3;
					LOOP2: loop
									fetch cursor3
									into  vSubtingkat;
									if rowsHabis2 then   
													close cursor3;
													leave LOOP2;
									end if;
									/*golongan ---------------------------------------------------------------*/
									BLOCK3: begin
											declare vGolongan int;
											declare rowsHabis3 INT DEFAULT 0;  
											declare cursor4 cursor for
															select replid
															from  psb_golongan;
											declare continue handler for not found set rowsHabis3 =1;
											open cursor4;
											LOOP3: loop
												fetch cursor4
												into  vGolongan;
												if rowsHabis3 then
																close cursor4;
																leave LOOP3;
												end if;
		
												INSERT INTO psb_detailbiaya SET 
														biaya = NEW.replid, 
														subtingkat = vSubtingkat, 
														detailgelombang = vDetGelombang, 
														golongan = vGolongan;
											end loop LOOP3;
									end BLOCK3;
							end loop LOOP2;
					end BLOCK2;
		end loop LOOP1;
	end BLOCK1;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_detailgelombang`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_detailgelombang` AFTER INSERT ON `psb_detailgelombang` FOR EACH ROW BEGIN

/*INSERT psb_detailbiaya FIX*/
/*subtingkat-----------------------------------------------------------------------*/
BLOCK2: begin
		declare v_col2 int;
		declare no_more_rows2 INT DEFAULT 0;  
		declare cursor2 cursor for
				SELECT s.replid
				FROM aka_kelas k
					JOIN aka_subtingkat s on s.replid = k.subtingkat
				WHERE k.departemen = NEW.departemen
				GROUP BY s.replid;
	 declare continue handler for not found
			 set no_more_rows2 =1;
		open cursor2;
		LOOP2: loop
				fetch cursor2
				into  v_col2;
				if no_more_rows2 then
						close cursor2;
						leave LOOP2;
				end if;
				/*biaya---------------------------------------------------------------*/
				BLOCK3: begin
							declare v_col3 int;
							declare no_more_rows3 INT DEFAULT 0;  
							declare cursor3 cursor for
									select replid
									from  psb_biaya;
						 declare continue handler for not found
								 set no_more_rows3 =1;
							open cursor3;
							LOOP3: loop
									fetch cursor3
									into  v_col3;
									if no_more_rows3 then
											close cursor3;
											leave LOOP3;
									end if;
									/*golongan ---------------------------------------------------------------*/
									BLOCK4: begin
												declare v_col4 int;
												declare no_more_rows4 INT DEFAULT 0;  
												declare cursor4 cursor for
														select replid
														from  psb_golongan;
											 declare continue handler for not found
													 set no_more_rows4 =1;
												open cursor4;
												LOOP4: loop
														fetch cursor4
														into  v_col4;
														if no_more_rows4 then
																close cursor4;
																leave LOOP4;
														end if;
									
														INSERT INTO psb_detailbiaya SET 
															biaya = v_col3, 
															subtingkat = v_col2, 
															detailgelombang = NEW.replid, 
															golongan = v_col4;
												end loop LOOP4;
									end BLOCK4;
						end loop LOOP3;
					end BLOCK3;
		end loop LOOP2;
end BLOCK2;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_diskon`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_diskon` AFTER INSERT ON `psb_diskon` FOR EACH ROW BEGIN

/*untuk psb_detaildiskon*/
/*tahun ajaran*/
	BLOCK1: begin
		declare v_col1 int;
		declare no_more_rows1 INT DEFAULT 0;  
		declare cursor1 cursor for
				select replid
				from  aka_tahunajaran;
		declare continue handler for not found set no_more_rows1 =1;
		open cursor1;
		LOOP1: loop
				fetch cursor1
				into  v_col1;
				if no_more_rows1 then
						close cursor1;
						leave LOOP1;
				end if;

				INSERT INTO psb_detaildiskon SET 
					diskon = NEW.replid, 
					tahunajaran = v_col1;

		end loop LOOP1;
end BLOCK1;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_gelombang`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_gelombang` AFTER INSERT ON `psb_gelombang` FOR EACH ROW BEGIN

/*untuk detail gelombang*/
/*departemen*/
BLOCK1: begin
    declare v_col1 int;                     
    declare no_more_rows1 INT DEFAULT 0;  
    declare cursor1 cursor for              
        select replid
        from departemen;
    declare continue handler for not found  
    		set no_more_rows1 =1;           
    open cursor1;
    LOOP1: loop
        fetch cursor1
        into  v_col1;
        if no_more_rows1 then
            close cursor1;
            leave LOOP1;
        end if;
				/*tahun ajaran*/
        BLOCK2: begin
            declare v_col2 int;
            declare no_more_rows2 INT DEFAULT 0;  
						declare cursor2 cursor for
                select replid
                from  aka_tahunajaran;
						declare continue handler for not found
               set no_more_rows2 =1;
            open cursor2;
            LOOP2: loop
                fetch cursor2
                into  v_col2;
                if no_more_rows2 then
                    close cursor2;
                    leave LOOP2;
                end if;
								INSERT INTO psb_detailgelombang SET 
									gelombang = NEW.replid, 
            			departemen = v_col1, 
            			tahunajaran = v_col2;
            end loop LOOP2;
        end BLOCK2;
    end loop LOOP1;
end BLOCK1;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_golongan`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_golongan` AFTER INSERT ON `psb_golongan` FOR EACH ROW BEGIN

/*INSERT psb_detailbiaya*/
/*subtingkat-----------------------------------------------------------------------*/
BLOCK2: begin
		declare v_col2 int;
		declare no_more_rows2 INT DEFAULT 0;  
		declare cursor2 cursor for
				SELECT s.replid
				FROM aka_kelas k
					JOIN aka_subtingkat s on s.replid = k.subtingkat
				GROUP BY s.replid;
	 declare continue handler for not found
			 set no_more_rows2 =1;
		open cursor2;
		LOOP2: loop
				fetch cursor2
				into  v_col2;
				if no_more_rows2 then
						close cursor2;
						leave LOOP2;
				end if;
				/*biaya---------------------------------------------------------------*/
				BLOCK3: begin
							declare v_col3 int;
							declare no_more_rows3 INT DEFAULT 0;  
							declare cursor3 cursor for
									select replid
									from  psb_biaya;
						 declare continue handler for not found
								 set no_more_rows3 =1;
							open cursor3;
							LOOP3: loop
									fetch cursor3
									into  v_col3;
									if no_more_rows3 then
											close cursor3;
											leave LOOP3;
									end if;
									/*detail gelombang---------------------------------------------------------------*/
									BLOCK4: begin
												declare v_col4 int;
												declare no_more_rows4 INT DEFAULT 0;  
												declare cursor4 cursor for
														select replid
														from  psb_detailgelombang;
											 declare continue handler for not found
													 set no_more_rows3 =1;
												open cursor4;
												LOOP4: loop
														fetch cursor4
														into  v_col4;
														if no_more_rows4 then
																close cursor4;
																leave LOOP4;
														end if;
									
														INSERT INTO psb_detailbiaya SET 
															biaya = v_col3, 
															subtingkat = v_col2, 
															detailgelombang = v_col4, 
															golongan = NEW.replid;
												end loop LOOP4;
									end BLOCK4;
						end loop LOOP3;
					end BLOCK3;
		end loop LOOP2;
end BLOCK2;
END
;;
DELIMITER ;
