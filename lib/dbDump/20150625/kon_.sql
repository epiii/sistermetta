/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermeta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-25 01:00:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_menu
-- ----------------------------
DROP TABLE IF EXISTS `kon_menu`;
CREATE TABLE `kon_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_menu
-- ----------------------------
INSERT INTO `kon_menu` VALUES ('1', '1', 'Pendataan Siswa', 'pendataan-siswa', 'double', '1', '9', '');
INSERT INTO `kon_menu` VALUES ('2', '1', 'Presensi Siswa', 'presensi-siswa', 'double', '2', '10', '');
INSERT INTO `kon_menu` VALUES ('3', '1', 'Rapor Siswa', 'rapor-siswa', 'double', '3', '11', '');
INSERT INTO `kon_menu` VALUES ('4', '1', 'Pendataan Alumni', 'pendataan-alumni', 'double', '4', '12', '');
INSERT INTO `kon_menu` VALUES ('5', '1', 'Pelajaran', 'pelajaran', 'double', '5', '13', '');
INSERT INTO `kon_menu` VALUES ('6', '1', 'Guru', 'guru', 'double', '6', '14', '');
INSERT INTO `kon_menu` VALUES ('7', '1', 'Jadwal Pelajaran', 'jadwal-pelajaran', 'double', '7', '15', '');
INSERT INTO `kon_menu` VALUES ('8', '5', 'Transaksi', 'transaksi', 'double', '8', '16', '');
INSERT INTO `kon_menu` VALUES ('9', '5', 'Modul Penerimaan Siswa', 'modul-penerimaan-siswa', 'double', '9', '17', '');
INSERT INTO `kon_menu` VALUES ('10', '5', 'Penerimaan Siswa', 'penerimaan-siswa', 'double', '10', '18', '');
INSERT INTO `kon_menu` VALUES ('11', '5', 'Inventory', 'inventory', 'double', '11', '19', '');
INSERT INTO `kon_menu` VALUES ('12', '6', 'Tahun Buku', 'tahun-buku', '', '12', '20', '');
INSERT INTO `kon_menu` VALUES ('13', '6', 'Saldo Awal', 'saldo-rekening', '', '13', '13', '');
INSERT INTO `kon_menu` VALUES ('14', '6', 'Kategori COA', 'kategori-rekening', '', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('15', '6', 'COA', 'detil-rekening', '', '15', '19', '');
INSERT INTO `kon_menu` VALUES ('16', '6', 'Anggaran', 'set-anggaran', '', '16', '16', '');
INSERT INTO `kon_menu` VALUES ('19', '7', 'Warna', 'warna', '', '4', '17', '');
INSERT INTO `kon_menu` VALUES ('20', '8', 'level', 'level', '', '5', '16', '');
INSERT INTO `kon_menu` VALUES ('21', '8', 'user', 'user', '', '7', '15', '');
INSERT INTO `kon_menu` VALUES ('22', '7', 'Icon', 'icon', '', '4', '13', '');
INSERT INTO `kon_menu` VALUES ('23', '5', 'Pendanaan Aktivitas', 'pendanaan-aktivitas', 'double', '7', '13', '');

-- ----------------------------
-- Table structure for kon_modul
-- ----------------------------
DROP TABLE IF EXISTS `kon_modul`;
CREATE TABLE `kon_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_modul
-- ----------------------------
INSERT INTO `kon_modul` VALUES ('1', '1', 'akademik_sister', 'akademik', '13', '9', 'double', '\n');
INSERT INTO `kon_modul` VALUES ('2', '1', 'psb', 'penerimaan siswa baru', '14', '10', 'double', '');
INSERT INTO `kon_modul` VALUES ('3', '1', 'perpustakaan', 'perpustakaan', '3', '11', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('4', '1', 'sarpras', 'sarana dan prasarana', '4', '12', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('5', '2', 'hrd', 'kepegawaian', '5', '13', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('6', '2', 'keuangan', 'keuangan', '6', '14', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('7', '2', 'student', 'student services', '7', '15', 'double', '');
INSERT INTO `kon_modul` VALUES ('8', '2', 'purchaseorder', 'purchase order', '8', '16', 'double', '');

-- ----------------------------
-- Table structure for kon_privillege
-- ----------------------------
DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_privillege
-- ----------------------------
INSERT INTO `kon_privillege` VALUES ('1', '1', '12');
INSERT INTO `kon_privillege` VALUES ('2', '1', '13');
INSERT INTO `kon_privillege` VALUES ('4', '1', '15');
INSERT INTO `kon_privillege` VALUES ('5', '1', '16');
INSERT INTO `kon_privillege` VALUES ('7', '2', '18');
INSERT INTO `kon_privillege` VALUES ('8', '1', '8');
INSERT INTO `kon_privillege` VALUES ('9', '1', '9');
INSERT INTO `kon_privillege` VALUES ('10', '1', '10');
INSERT INTO `kon_privillege` VALUES ('11', '2', '11');
INSERT INTO `kon_privillege` VALUES ('12', '1', '20');
INSERT INTO `kon_privillege` VALUES ('13', '1', '21');
INSERT INTO `kon_privillege` VALUES ('14', '1', '19');
INSERT INTO `kon_privillege` VALUES ('15', '1', '22');
INSERT INTO `kon_privillege` VALUES ('17', '1', '11');
INSERT INTO `kon_privillege` VALUES ('18', '1', '18');
INSERT INTO `kon_privillege` VALUES ('19', '1', '23');
