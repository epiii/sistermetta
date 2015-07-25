/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-25 16:36:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_pelajaran`;
CREATE TABLE `aka_pelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_pelajaran
-- ----------------------------
INSERT INTO `aka_pelajaran` VALUES ('2', 'BING', 'Bahasa Inggris', '');
INSERT INTO `aka_pelajaran` VALUES ('3', 'MAT', 'Matematika', '');
INSERT INTO `aka_pelajaran` VALUES ('18', 'mtk', 'Matematika', '');
INSERT INTO `aka_pelajaran` VALUES ('19', 'bio', 'Biologi', '');
INSERT INTO `aka_pelajaran` VALUES ('20', 'fis', 'Fisika', '');
INSERT INTO `aka_pelajaran` VALUES ('21', 'kim', 'Kimia', '');
INSERT INTO `aka_pelajaran` VALUES ('22', 'eko', 'Ekonomi', '');
INSERT INTO `aka_pelajaran` VALUES ('23', 'ppkn', 'PPKn', '');
INSERT INTO `aka_pelajaran` VALUES ('24', 'BI', 'Bahasa Indonesia', '');
INSERT INTO `aka_pelajaran` VALUES ('25', 'Bing', 'Bahasa Inggris', '');
INSERT INTO `aka_pelajaran` VALUES ('26', 'TIK', 'Teknologi Informasi dan Komputer', '');
INSERT INTO `aka_pelajaran` VALUES ('27', 'ag', 'Agama', '');
INSERT INTO `aka_pelajaran` VALUES ('28', 'Kertakes', 'Kerajinan Tangan dan Kesenian', '');
INSERT INTO `aka_pelajaran` VALUES ('29', 'penjaskes', 'Pendidikan Jasmani dan Kesehatan ', '');
INSERT INTO `aka_pelajaran` VALUES ('30', 'sej', 'Sejarah', '');
INSERT INTO `aka_pelajaran` VALUES ('31', 'geo', 'Geografi', '');
INSERT INTO `aka_pelajaran` VALUES ('32', 'sos', 'Sosiologi', '');
INSERT INTO `aka_pelajaran` VALUES ('33', 'BK', 'Bimbingan Konseling', '');
INSERT INTO `aka_pelajaran` VALUES ('34', 'elk', 'Elektro', '');
INSERT INTO `aka_pelajaran` VALUES ('35', 'htg', 'Berhitung', '');
INSERT INTO `aka_pelajaran` VALUES ('36', 'nyanyi', 'Bernyanyi', '');
INSERT INTO `aka_pelajaran` VALUES ('37', 'gbr', 'Menggambar', '');
INSERT INTO `aka_pelajaran` VALUES ('38', 'tls', 'Menulis', '');
INSERT INTO `aka_pelajaran` VALUES ('39', 'baca', 'Membaca', '');
INSERT INTO `aka_pelajaran` VALUES ('40', 'wrna', 'Mewarnai', '');
INSERT INTO `aka_pelajaran` VALUES ('41', 'bcr', 'Berbicara', '');
INSERT INTO `aka_pelajaran` VALUES ('42', 'bdri', 'berdiri', '');
INSERT INTO `aka_pelajaran` VALUES ('43', 'jln', 'Berjalan', '');
INSERT INTO `aka_pelajaran` VALUES ('44', 'bader', 'Bahasa Daerah', '');
