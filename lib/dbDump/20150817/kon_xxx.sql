/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-17 20:14:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_aksi
-- ----------------------------
DROP TABLE IF EXISTS `kon_aksi`;
CREATE TABLE `kon_aksi` (
  `id_aksi` int(11) NOT NULL AUTO_INCREMENT,
  `aksi` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_aksi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_aksi
-- ----------------------------
INSERT INTO `kon_aksi` VALUES ('1', 'r', 'read');
INSERT INTO `kon_aksi` VALUES ('2', 'c', 'create');
INSERT INTO `kon_aksi` VALUES ('3', 'u', 'update');
INSERT INTO `kon_aksi` VALUES ('4', 'd', 'delete');
INSERT INTO `kon_aksi` VALUES ('5', 's', 'search');
INSERT INTO `kon_aksi` VALUES ('6', 'p', 'print/report');

-- ----------------------------
-- Table structure for kon_grupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_grupmenu`;
CREATE TABLE `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_katgrupmenu` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_grupmenu
-- ----------------------------
INSERT INTO `kon_grupmenu` VALUES ('1', '2', '1', 'Menu Kesiswaan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('2', '2', '1', 'Menu Belajar - Mengajar', 'four');
INSERT INTO `kon_grupmenu` VALUES ('3', '1', '1', 'Menu Master', 'four');
INSERT INTO `kon_grupmenu` VALUES ('4', '1', '2', 'Menu Transaksi', 'four');
INSERT INTO `kon_grupmenu` VALUES ('5', '2', '6', 'Menu Transaksi ', 'double');
INSERT INTO `kon_grupmenu` VALUES ('6', '1', '6', 'Menu Master', 'double');
INSERT INTO `kon_grupmenu` VALUES ('7', '1', '9', 'Menu Sistem', 'double');
INSERT INTO `kon_grupmenu` VALUES ('8', '2', '9', 'Menu User', 'double');
INSERT INTO `kon_grupmenu` VALUES ('9', '1', '2', 'Menu Master', 'four');
INSERT INTO `kon_grupmenu` VALUES ('14', '1', '3', 'Menu Master ', 'double double-vertic');
INSERT INTO `kon_grupmenu` VALUES ('15', '2', '3', 'Menu Transaksi', 'double double-vertic');

-- ----------------------------
-- Table structure for kon_grupmodul
-- ----------------------------
DROP TABLE IF EXISTS `kon_grupmodul`;
CREATE TABLE `kon_grupmodul` (
  `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmodul`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_grupmodul
-- ----------------------------
INSERT INTO `kon_grupmodul` VALUES ('1', 'satu', 'four');
INSERT INTO `kon_grupmodul` VALUES ('2', 'dua', 'four');
INSERT INTO `kon_grupmodul` VALUES ('3', 'tiga', 'four');

-- ----------------------------
-- Table structure for kon_icon
-- ----------------------------
DROP TABLE IF EXISTS `kon_icon`;
CREATE TABLE `kon_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(25) NOT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_icon
-- ----------------------------
INSERT INTO `kon_icon` VALUES ('1', 'akademik');
INSERT INTO `kon_icon` VALUES ('2', 'sarpras');
INSERT INTO `kon_icon` VALUES ('3', 'hrd');
INSERT INTO `kon_icon` VALUES ('4', 'psb');
INSERT INTO `kon_icon` VALUES ('5', 'keuangan');
INSERT INTO `kon_icon` VALUES ('6', 'student');
INSERT INTO `kon_icon` VALUES ('7', 'perpus');
INSERT INTO `kon_icon` VALUES ('8', 'manajemen');
INSERT INTO `kon_icon` VALUES ('9', 'pencil');
INSERT INTO `kon_icon` VALUES ('10', 'address-book');
INSERT INTO `kon_icon` VALUES ('11', 'book');
INSERT INTO `kon_icon` VALUES ('12', 'copy');
INSERT INTO `kon_icon` VALUES ('13', 'user-3');
INSERT INTO `kon_icon` VALUES ('14', 'user');
INSERT INTO `kon_icon` VALUES ('15', 'grid-view');
INSERT INTO `kon_icon` VALUES ('16', 'tab');
INSERT INTO `kon_icon` VALUES ('17', 'cog');
INSERT INTO `kon_icon` VALUES ('18', 'user-2');
INSERT INTO `kon_icon` VALUES ('20', 'loop');

-- ----------------------------
-- Table structure for kon_katgrupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_katgrupmenu`;
CREATE TABLE `kon_katgrupmenu` (
  `id_katgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `katgrupmenu` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_katgrupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_katgrupmenu
-- ----------------------------
INSERT INTO `kon_katgrupmenu` VALUES ('1', 'M', 'Master');
INSERT INTO `kon_katgrupmenu` VALUES ('2', 'T', 'Transaksi');

-- ----------------------------
-- Table structure for kon_level
-- ----------------------------
DROP TABLE IF EXISTS `kon_level`;
CREATE TABLE `kon_level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_level
-- ----------------------------
INSERT INTO `kon_level` VALUES ('12', 'SA', '1', 'Super Admin');
INSERT INTO `kon_level` VALUES ('13', 'A+', '2', 'Admin Plus');
INSERT INTO `kon_level` VALUES ('14', 'A', '3', 'Admin');
INSERT INTO `kon_level` VALUES ('15', 'O', '4', 'Operator');
INSERT INTO `kon_level` VALUES ('16', 'G', '5', 'Guest');

-- ----------------------------
-- Table structure for kon_levelaksi
-- ----------------------------
DROP TABLE IF EXISTS `kon_levelaksi`;
CREATE TABLE `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_levelaksi`),
  KEY `id_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  KEY `id_aksi` (`id_aksi`),
  CONSTRAINT `kon_levelaksi_ibfk_1` FOREIGN KEY (`id_levelkatgrupmenu`) REFERENCES `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kon_levelaksi_ibfk_2` FOREIGN KEY (`id_aksi`) REFERENCES `kon_aksi` (`id_aksi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1621 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelaksi
-- ----------------------------
INSERT INTO `kon_levelaksi` VALUES ('1423', '37', '1');
INSERT INTO `kon_levelaksi` VALUES ('1424', '38', '1');
INSERT INTO `kon_levelaksi` VALUES ('1425', '37', '2');
INSERT INTO `kon_levelaksi` VALUES ('1426', '37', '3');
INSERT INTO `kon_levelaksi` VALUES ('1427', '37', '4');
INSERT INTO `kon_levelaksi` VALUES ('1428', '37', '5');
INSERT INTO `kon_levelaksi` VALUES ('1429', '38', '5');
INSERT INTO `kon_levelaksi` VALUES ('1430', '37', '6');
INSERT INTO `kon_levelaksi` VALUES ('1431', '38', '6');
INSERT INTO `kon_levelaksi` VALUES ('1432', '39', '1');
INSERT INTO `kon_levelaksi` VALUES ('1433', '40', '1');
INSERT INTO `kon_levelaksi` VALUES ('1434', '39', '2');
INSERT INTO `kon_levelaksi` VALUES ('1435', '39', '3');
INSERT INTO `kon_levelaksi` VALUES ('1436', '39', '4');
INSERT INTO `kon_levelaksi` VALUES ('1437', '39', '5');
INSERT INTO `kon_levelaksi` VALUES ('1438', '40', '5');
INSERT INTO `kon_levelaksi` VALUES ('1439', '39', '6');
INSERT INTO `kon_levelaksi` VALUES ('1440', '40', '6');
INSERT INTO `kon_levelaksi` VALUES ('1507', '41', '1');
INSERT INTO `kon_levelaksi` VALUES ('1508', '41', '2');
INSERT INTO `kon_levelaksi` VALUES ('1509', '41', '3');
INSERT INTO `kon_levelaksi` VALUES ('1510', '41', '4');
INSERT INTO `kon_levelaksi` VALUES ('1511', '41', '5');
INSERT INTO `kon_levelaksi` VALUES ('1512', '41', '6');
INSERT INTO `kon_levelaksi` VALUES ('1513', '43', '1');
INSERT INTO `kon_levelaksi` VALUES ('1514', '43', '2');
INSERT INTO `kon_levelaksi` VALUES ('1515', '43', '3');
INSERT INTO `kon_levelaksi` VALUES ('1516', '43', '4');
INSERT INTO `kon_levelaksi` VALUES ('1517', '43', '5');
INSERT INTO `kon_levelaksi` VALUES ('1518', '43', '6');
INSERT INTO `kon_levelaksi` VALUES ('1535', '47', '1');
INSERT INTO `kon_levelaksi` VALUES ('1536', '47', '2');
INSERT INTO `kon_levelaksi` VALUES ('1537', '47', '3');
INSERT INTO `kon_levelaksi` VALUES ('1538', '47', '4');
INSERT INTO `kon_levelaksi` VALUES ('1539', '47', '5');
INSERT INTO `kon_levelaksi` VALUES ('1540', '47', '6');
INSERT INTO `kon_levelaksi` VALUES ('1571', '51', '1');
INSERT INTO `kon_levelaksi` VALUES ('1572', '51', '5');
INSERT INTO `kon_levelaksi` VALUES ('1573', '51', '6');
INSERT INTO `kon_levelaksi` VALUES ('1597', '33', '1');
INSERT INTO `kon_levelaksi` VALUES ('1598', '34', '1');
INSERT INTO `kon_levelaksi` VALUES ('1599', '33', '2');
INSERT INTO `kon_levelaksi` VALUES ('1600', '34', '2');
INSERT INTO `kon_levelaksi` VALUES ('1601', '33', '3');
INSERT INTO `kon_levelaksi` VALUES ('1602', '34', '3');
INSERT INTO `kon_levelaksi` VALUES ('1603', '33', '4');
INSERT INTO `kon_levelaksi` VALUES ('1604', '34', '4');
INSERT INTO `kon_levelaksi` VALUES ('1605', '33', '5');
INSERT INTO `kon_levelaksi` VALUES ('1606', '34', '5');
INSERT INTO `kon_levelaksi` VALUES ('1607', '33', '6');
INSERT INTO `kon_levelaksi` VALUES ('1608', '34', '6');
INSERT INTO `kon_levelaksi` VALUES ('1609', '35', '1');
INSERT INTO `kon_levelaksi` VALUES ('1610', '36', '1');
INSERT INTO `kon_levelaksi` VALUES ('1611', '35', '2');
INSERT INTO `kon_levelaksi` VALUES ('1612', '36', '2');
INSERT INTO `kon_levelaksi` VALUES ('1613', '35', '3');
INSERT INTO `kon_levelaksi` VALUES ('1614', '36', '3');
INSERT INTO `kon_levelaksi` VALUES ('1615', '35', '4');
INSERT INTO `kon_levelaksi` VALUES ('1616', '36', '4');
INSERT INTO `kon_levelaksi` VALUES ('1617', '35', '5');
INSERT INTO `kon_levelaksi` VALUES ('1618', '36', '5');
INSERT INTO `kon_levelaksi` VALUES ('1619', '35', '6');
INSERT INTO `kon_levelaksi` VALUES ('1620', '36', '6');

-- ----------------------------
-- Table structure for kon_levelkatgrupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_levelkatgrupmenu`;
CREATE TABLE `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_levelkatgrupmenu`),
  KEY `id_level` (`id_level`),
  KEY `id_katgrupmenu` (`id_katgrupmenu`),
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_2` FOREIGN KEY (`id_katgrupmenu`) REFERENCES `kon_katgrupmenu` (`id_katgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelkatgrupmenu
-- ----------------------------
INSERT INTO `kon_levelkatgrupmenu` VALUES ('33', '12', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('34', '12', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('35', '12', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('36', '12', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('37', '13', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('38', '13', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('39', '13', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('40', '13', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('41', '14', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('42', '14', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('43', '14', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('44', '14', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('45', '15', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('46', '15', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('47', '15', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('48', '15', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('49', '16', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('50', '16', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('51', '16', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('52', '16', '2', '0');

-- ----------------------------
-- Table structure for kon_login
-- ----------------------------
DROP TABLE IF EXISTS `kon_login`;
CREATE TABLE `kon_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `kon_login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_login
-- ----------------------------
INSERT INTO `kon_login` VALUES ('13', 'Mr. ABC', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', '12', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('16', 'epi', 'epi', 'ZDBmOTJhOTBkNTUwMGYxZDVjNDEzNjk2NmM1YzdlNjM=', '13', '0', '0', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for kon_logindepartemen
-- ----------------------------
DROP TABLE IF EXISTS `kon_logindepartemen`;
CREATE TABLE `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  PRIMARY KEY (`id_logindepartemen`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_logindepartemen
-- ----------------------------
INSERT INTO `kon_logindepartemen` VALUES ('21', '13', '1');
INSERT INTO `kon_logindepartemen` VALUES ('22', '13', '2');
INSERT INTO `kon_logindepartemen` VALUES ('25', '16', '1');

-- ----------------------------
-- Table structure for kon_loginhistory
-- ----------------------------
DROP TABLE IF EXISTS `kon_loginhistory`;
CREATE TABLE `kon_loginhistory` (
  `id_loginhistory` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_loginhistory`),
  KEY `id_login` (`id_login`) USING BTREE,
  CONSTRAINT `kon_loginhistory_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_loginhistory
-- ----------------------------
INSERT INTO `kon_loginhistory` VALUES ('67', '16', '2015-08-17 14:01:09');
INSERT INTO `kon_loginhistory` VALUES ('68', '16', '2015-08-17 14:01:09');
INSERT INTO `kon_loginhistory` VALUES ('69', '16', '2015-08-17 14:01:41');
INSERT INTO `kon_loginhistory` VALUES ('70', '16', '2015-08-17 14:01:41');
INSERT INTO `kon_loginhistory` VALUES ('71', '13', '2015-08-17 14:37:47');
INSERT INTO `kon_loginhistory` VALUES ('72', '13', '2015-08-17 14:37:47');
INSERT INTO `kon_loginhistory` VALUES ('73', '16', '2015-08-17 14:38:17');
INSERT INTO `kon_loginhistory` VALUES ('74', '16', '2015-08-17 14:38:17');
INSERT INTO `kon_loginhistory` VALUES ('75', '16', '2015-08-17 15:03:21');
INSERT INTO `kon_loginhistory` VALUES ('76', '16', '2015-08-17 15:03:21');
INSERT INTO `kon_loginhistory` VALUES ('77', '16', '2015-08-17 15:10:11');
INSERT INTO `kon_loginhistory` VALUES ('78', '16', '2015-08-17 15:10:11');
INSERT INTO `kon_loginhistory` VALUES ('79', '13', '2015-08-17 15:10:18');
INSERT INTO `kon_loginhistory` VALUES ('80', '13', '2015-08-17 15:10:18');
INSERT INTO `kon_loginhistory` VALUES ('81', '13', '2015-08-17 15:11:13');
INSERT INTO `kon_loginhistory` VALUES ('82', '13', '2015-08-17 15:11:13');
INSERT INTO `kon_loginhistory` VALUES ('83', '13', '2015-08-17 15:42:57');
INSERT INTO `kon_loginhistory` VALUES ('84', '13', '2015-08-17 15:42:57');
INSERT INTO `kon_loginhistory` VALUES ('85', '13', '2015-08-17 16:00:03');
INSERT INTO `kon_loginhistory` VALUES ('86', '13', '2015-08-17 16:00:03');
INSERT INTO `kon_loginhistory` VALUES ('87', '13', '2015-08-17 16:00:11');
INSERT INTO `kon_loginhistory` VALUES ('88', '13', '2015-08-17 16:00:11');
INSERT INTO `kon_loginhistory` VALUES ('89', '13', '2015-08-17 16:45:03');
INSERT INTO `kon_loginhistory` VALUES ('90', '13', '2015-08-17 16:45:03');
INSERT INTO `kon_loginhistory` VALUES ('91', '13', '2015-08-17 16:45:12');
INSERT INTO `kon_loginhistory` VALUES ('92', '13', '2015-08-17 16:45:12');
INSERT INTO `kon_loginhistory` VALUES ('93', '13', '2015-08-17 19:01:13');
INSERT INTO `kon_loginhistory` VALUES ('94', '13', '2015-08-17 19:01:13');
INSERT INTO `kon_loginhistory` VALUES ('95', '13', '2015-08-17 19:10:13');
INSERT INTO `kon_loginhistory` VALUES ('96', '13', '2015-08-17 19:10:13');
INSERT INTO `kon_loginhistory` VALUES ('97', '13', '2015-08-17 19:11:33');
INSERT INTO `kon_loginhistory` VALUES ('98', '13', '2015-08-17 19:11:34');
INSERT INTO `kon_loginhistory` VALUES ('99', '13', '2015-08-17 19:12:52');
INSERT INTO `kon_loginhistory` VALUES ('100', '13', '2015-08-17 19:12:52');
INSERT INTO `kon_loginhistory` VALUES ('101', '13', '2015-08-17 19:13:01');
INSERT INTO `kon_loginhistory` VALUES ('102', '13', '2015-08-17 19:13:02');
INSERT INTO `kon_loginhistory` VALUES ('103', '13', '2015-08-17 19:13:17');
INSERT INTO `kon_loginhistory` VALUES ('104', '13', '2015-08-17 19:13:17');
INSERT INTO `kon_loginhistory` VALUES ('105', '13', '2015-08-17 19:13:42');
INSERT INTO `kon_loginhistory` VALUES ('106', '13', '2015-08-17 19:13:42');
INSERT INTO `kon_loginhistory` VALUES ('107', '13', '2015-08-17 19:13:46');
INSERT INTO `kon_loginhistory` VALUES ('108', '13', '2015-08-17 19:13:46');
INSERT INTO `kon_loginhistory` VALUES ('109', '13', '2015-08-17 19:14:26');
INSERT INTO `kon_loginhistory` VALUES ('110', '13', '2015-08-17 19:14:26');
INSERT INTO `kon_loginhistory` VALUES ('111', '13', '2015-08-17 19:14:52');
INSERT INTO `kon_loginhistory` VALUES ('112', '13', '2015-08-17 19:14:52');
INSERT INTO `kon_loginhistory` VALUES ('113', '13', '2015-08-17 19:15:11');
INSERT INTO `kon_loginhistory` VALUES ('114', '13', '2015-08-17 19:15:11');
INSERT INTO `kon_loginhistory` VALUES ('115', '13', '2015-08-17 19:15:32');
INSERT INTO `kon_loginhistory` VALUES ('116', '13', '2015-08-17 19:15:32');
INSERT INTO `kon_loginhistory` VALUES ('117', '13', '2015-08-17 19:15:37');
INSERT INTO `kon_loginhistory` VALUES ('118', '13', '2015-08-17 19:15:37');
INSERT INTO `kon_loginhistory` VALUES ('119', '13', '2015-08-17 19:16:02');
INSERT INTO `kon_loginhistory` VALUES ('120', '13', '2015-08-17 19:16:02');
INSERT INTO `kon_loginhistory` VALUES ('121', '13', '2015-08-17 19:16:18');
INSERT INTO `kon_loginhistory` VALUES ('122', '13', '2015-08-17 19:16:18');
INSERT INTO `kon_loginhistory` VALUES ('123', '13', '2015-08-17 19:18:09');
INSERT INTO `kon_loginhistory` VALUES ('124', '13', '2015-08-17 19:18:09');
INSERT INTO `kon_loginhistory` VALUES ('125', '13', '2015-08-17 19:19:15');
INSERT INTO `kon_loginhistory` VALUES ('126', '13', '2015-08-17 19:19:15');
INSERT INTO `kon_loginhistory` VALUES ('127', '13', '2015-08-17 20:12:32');
INSERT INTO `kon_loginhistory` VALUES ('128', '13', '2015-08-17 20:12:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_menu
-- ----------------------------
INSERT INTO `kon_menu` VALUES ('1', '4', 'Pendataan Siswa', 'pendataan-siswa', 'double', '7', '9', '');
INSERT INTO `kon_menu` VALUES ('2', '1', 'Presensi Siswa', 'presensi-siswa', 'double', '44', '10', '');
INSERT INTO `kon_menu` VALUES ('3', '1', 'Rapor Siswa', 'rapor-siswa', 'double', '3', '11', '');
INSERT INTO `kon_menu` VALUES ('4', '1', 'Pendataan Alumni', 'pendataan-alumni', 'double', '4', '12', '');
INSERT INTO `kon_menu` VALUES ('8', '5', 'Transaksi', 'transaksi', 'double', '8', '16', '');
INSERT INTO `kon_menu` VALUES ('9', '5', 'Modul Penerimaan Siswa', 'modul-penerimaan-siswa', 'double', '9', '17', '');
INSERT INTO `kon_menu` VALUES ('10', '5', 'Penerimaan Siswa', 'penerimaan-siswa', 'double', '10', '18', '');
INSERT INTO `kon_menu` VALUES ('12', '6', 'Tahun Buku', 'tahun-buku', '', '12', '20', '');
INSERT INTO `kon_menu` VALUES ('13', '6', 'Saldo Awal', 'saldo-rekening', '', '13', '13', '');
INSERT INTO `kon_menu` VALUES ('14', '6', 'Kategori COA', 'kategori-rekening', '', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('15', '6', 'COA', 'detil-rekening', '', '15', '19', '');
INSERT INTO `kon_menu` VALUES ('16', '6', 'Anggaran', 'set-anggaran', '', '16', '16', '');
INSERT INTO `kon_menu` VALUES ('19', '7', 'Warna', 'warna', '', '4', '17', '');
INSERT INTO `kon_menu` VALUES ('20', '8', 'level', 'level', '', '5', '16', '');
INSERT INTO `kon_menu` VALUES ('21', '8', 'user', 'user', '', '7', '15', '');
INSERT INTO `kon_menu` VALUES ('22', '7', 'Icon', 'icon', '', '4', '13', '');
INSERT INTO `kon_menu` VALUES ('24', '2', 'Detail Kelas', 'detail-kelas', 'double', '11', '15', '');
INSERT INTO `kon_menu` VALUES ('25', '3', 'Departemen', 'departemen', '', '3', '11', '');
INSERT INTO `kon_menu` VALUES ('26', '3', 'Angkatan', 'angkatan', '', '11', '15', '');
INSERT INTO `kon_menu` VALUES ('27', '3', 'Tahun Ajaran', 'tahun-ajaran', '', '16', '17', '');
INSERT INTO `kon_menu` VALUES ('28', '3', 'Tingkat', 'tingkat', '', '12', '19', '');
INSERT INTO `kon_menu` VALUES ('29', '3', 'Sub Tingkat', 'subtingkat', '', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('30', '3', 'Kelas', 'kelas', '', '15', '13', '');
INSERT INTO `kon_menu` VALUES ('31', '3', 'Semester', 'semester', '', '13', '12', '');
INSERT INTO `kon_menu` VALUES ('32', '3', 'Jenis Mutasi', 'jenis-mutasi', '', '11', '10', '');
INSERT INTO `kon_menu` VALUES ('33', '3', 'Guru', 'guru', '', '11', '14', '');
INSERT INTO `kon_menu` VALUES ('34', '3', 'Pelajaran', 'pelajaran', '', '12', '14', '');
INSERT INTO `kon_menu` VALUES ('35', '2', 'Jadwal Pelajaran', 'jadwal-pelajaran', 'double', '15', '15', '');
INSERT INTO `kon_menu` VALUES ('36', '2', 'Presensi Guru', 'presensi-guru', 'double', '18', '12', '');
INSERT INTO `kon_menu` VALUES ('37', '2', 'Kegiatan Akademik', 'kegiatan-akademik', 'double', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('38', '1', 'Mutasi', 'mutasi', 'double', '6', '13', '');
INSERT INTO `kon_menu` VALUES ('39', '3', 'Detail Pelajaran', 'detail-pelajaran', '', '13', '15', '');
INSERT INTO `kon_menu` VALUES ('40', '1', 'Pendataan Siswa', 'pendataan-siswa', 'double', '13', '15', '');
INSERT INTO `kon_menu` VALUES ('41', '9', 'Set Biaya Calon Siswa', 'set-biaya-calon-siswa', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('42', '9', 'set Diskon', 'set-diskon', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('43', '9', 'set Angsuran', 'set-angsuran', '', '17', '13', '');
INSERT INTO `kon_menu` VALUES ('44', '9', 'golongan Calon Siswa', 'golongan-calon-siswa', '', '13', '16', '');
INSERT INTO `kon_menu` VALUES ('45', '7', 'menu', 'menu', '', '14', '16', '');
INSERT INTO `kon_menu` VALUES ('46', '7', 'Grup Modul', 'grup-modul', '', '13', '12', '');
INSERT INTO `kon_menu` VALUES ('47', '7', 'Modul', 'modul', '', '12', '11', '');
INSERT INTO `kon_menu` VALUES ('48', '7', 'Grup Menu', 'grup-menu', '', '16', '13', '');
INSERT INTO `kon_menu` VALUES ('52', '4', 'Kelompok Pendaftaran', 'kelompok', 'double', '16', '10', 'kelompok pendaftaran  (gelombang)');
INSERT INTO `kon_menu` VALUES ('53', '4', 'Penerimaan Siswa Baru', 'penerimaan', 'double', '4', '10', 'penerimaan siswa (pendaftaran NIS dan NISN)');
INSERT INTO `kon_menu` VALUES ('54', '14', 'Perangkat', 'perangkat', '', '16', '10', 'ok');
INSERT INTO `kon_menu` VALUES ('55', '14', 'Lokasi', 'lokasi', '', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('56', '14', 'Jenis Koleksi', 'jenis-koleksi', '', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('57', '14', 'Tingkat Koleksi', 'tingkat-koleksi', '', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('58', '14', 'Klasifikasi', 'klasifikasi', '', '41', '10', '');
INSERT INTO `kon_menu` VALUES ('59', '14', 'Daftar Pengunjung', 'daftar-pengunjung', '', '17', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('60', '14', 'Daftar Penerbit', 'daftar-penerbit', '', '10', '10', '');
INSERT INTO `kon_menu` VALUES ('61', '14', 'Daftar-Bahasa', 'daftar-bahasa', '', '24', '10', '');
INSERT INTO `kon_menu` VALUES ('62', '14', 'Satuan Mata Uang', 'stuan-mata-uang', '', '8', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('63', '15', 'Katalog', 'katalog', 'double', '7', '10', '');
INSERT INTO `kon_menu` VALUES ('64', '15', 'Daftar Koleksi', 'daftar-koleksi', 'double', '7', '20', '');
INSERT INTO `kon_menu` VALUES ('65', '15', 'Data Anggota', 'data-anggota', '', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('66', '15', 'Sirkulasi', 'sirkulasi', 'double', '18', '10', '');
INSERT INTO `kon_menu` VALUES ('67', '15', 'Stock Opname', 'stock-opname', 'double', '47', '17', '');
INSERT INTO `kon_menu` VALUES ('68', '15', 'OPAC', 'opac', 'double', '19', '12', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_modul
-- ----------------------------
INSERT INTO `kon_modul` VALUES ('1', '1', 'akademik', 'akademik', '13', '9', 'double', '');
INSERT INTO `kon_modul` VALUES ('2', '1', 'psb', 'penerimaan siswa baru', '14', '10', 'double', '');
INSERT INTO `kon_modul` VALUES ('3', '1', 'perpus', 'perpustakaan', '3', '11', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('4', '1', 'sarpras', 'sarana dan prasarana', '4', '12', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('5', '2', 'hrd', 'kepegawaian', '5', '13', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('6', '2', 'keuangan', 'keuangan', '6', '14', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('7', '2', 'student', 'student services', '7', '15', 'double', '');
INSERT INTO `kon_modul` VALUES ('9', '3', 'konfigurasi', 'konfigurasi', '13', '14', 'double', '');
INSERT INTO `kon_modul` VALUES ('13', '2', 'purchaseorder', 'purchase order', '32', '20', 'double', '');

-- ----------------------------
-- Table structure for kon_privillege
-- ----------------------------
DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_privillege
-- ----------------------------
INSERT INTO `kon_privillege` VALUES ('131', '13', '1');
INSERT INTO `kon_privillege` VALUES ('132', '13', '2');
INSERT INTO `kon_privillege` VALUES ('133', '13', '3');
INSERT INTO `kon_privillege` VALUES ('134', '13', '4');
INSERT INTO `kon_privillege` VALUES ('135', '13', '8');
INSERT INTO `kon_privillege` VALUES ('136', '13', '9');
INSERT INTO `kon_privillege` VALUES ('137', '13', '10');
INSERT INTO `kon_privillege` VALUES ('138', '13', '12');
INSERT INTO `kon_privillege` VALUES ('139', '13', '13');
INSERT INTO `kon_privillege` VALUES ('140', '13', '14');
INSERT INTO `kon_privillege` VALUES ('141', '13', '15');
INSERT INTO `kon_privillege` VALUES ('142', '13', '16');
INSERT INTO `kon_privillege` VALUES ('143', '13', '19');
INSERT INTO `kon_privillege` VALUES ('144', '13', '20');
INSERT INTO `kon_privillege` VALUES ('145', '13', '21');
INSERT INTO `kon_privillege` VALUES ('146', '13', '22');
INSERT INTO `kon_privillege` VALUES ('147', '13', '24');
INSERT INTO `kon_privillege` VALUES ('148', '13', '25');
INSERT INTO `kon_privillege` VALUES ('149', '13', '26');
INSERT INTO `kon_privillege` VALUES ('150', '13', '27');
INSERT INTO `kon_privillege` VALUES ('151', '13', '28');
INSERT INTO `kon_privillege` VALUES ('152', '13', '29');
INSERT INTO `kon_privillege` VALUES ('153', '13', '30');
INSERT INTO `kon_privillege` VALUES ('154', '13', '31');
INSERT INTO `kon_privillege` VALUES ('155', '13', '32');
INSERT INTO `kon_privillege` VALUES ('156', '13', '33');
INSERT INTO `kon_privillege` VALUES ('157', '13', '34');
INSERT INTO `kon_privillege` VALUES ('158', '13', '35');
INSERT INTO `kon_privillege` VALUES ('159', '13', '36');
INSERT INTO `kon_privillege` VALUES ('160', '13', '37');
INSERT INTO `kon_privillege` VALUES ('161', '13', '38');
INSERT INTO `kon_privillege` VALUES ('162', '13', '39');
INSERT INTO `kon_privillege` VALUES ('163', '13', '40');
INSERT INTO `kon_privillege` VALUES ('164', '13', '41');
INSERT INTO `kon_privillege` VALUES ('165', '13', '42');
INSERT INTO `kon_privillege` VALUES ('166', '13', '43');
INSERT INTO `kon_privillege` VALUES ('167', '13', '44');
INSERT INTO `kon_privillege` VALUES ('168', '13', '45');
INSERT INTO `kon_privillege` VALUES ('169', '13', '46');
INSERT INTO `kon_privillege` VALUES ('170', '13', '47');
INSERT INTO `kon_privillege` VALUES ('171', '13', '48');
INSERT INTO `kon_privillege` VALUES ('172', '13', '52');
INSERT INTO `kon_privillege` VALUES ('173', '13', '53');
INSERT INTO `kon_privillege` VALUES ('174', '13', '54');
INSERT INTO `kon_privillege` VALUES ('175', '13', '55');
INSERT INTO `kon_privillege` VALUES ('176', '13', '56');
INSERT INTO `kon_privillege` VALUES ('177', '13', '57');
INSERT INTO `kon_privillege` VALUES ('178', '13', '58');
INSERT INTO `kon_privillege` VALUES ('179', '13', '59');
INSERT INTO `kon_privillege` VALUES ('180', '13', '60');
INSERT INTO `kon_privillege` VALUES ('181', '13', '61');
INSERT INTO `kon_privillege` VALUES ('182', '13', '62');
INSERT INTO `kon_privillege` VALUES ('183', '13', '63');
INSERT INTO `kon_privillege` VALUES ('184', '13', '64');
INSERT INTO `kon_privillege` VALUES ('185', '13', '65');
INSERT INTO `kon_privillege` VALUES ('186', '13', '66');
INSERT INTO `kon_privillege` VALUES ('187', '13', '67');
INSERT INTO `kon_privillege` VALUES ('188', '13', '68');
INSERT INTO `kon_privillege` VALUES ('233', '16', '26');
INSERT INTO `kon_privillege` VALUES ('234', '16', '25');
INSERT INTO `kon_privillege` VALUES ('235', '16', '39');
INSERT INTO `kon_privillege` VALUES ('236', '16', '33');
INSERT INTO `kon_privillege` VALUES ('237', '16', '32');
INSERT INTO `kon_privillege` VALUES ('238', '16', '30');
INSERT INTO `kon_privillege` VALUES ('239', '16', '34');
INSERT INTO `kon_privillege` VALUES ('240', '16', '31');
INSERT INTO `kon_privillege` VALUES ('241', '16', '29');
INSERT INTO `kon_privillege` VALUES ('242', '16', '27');
INSERT INTO `kon_privillege` VALUES ('243', '16', '28');
INSERT INTO `kon_privillege` VALUES ('244', '16', '24');
INSERT INTO `kon_privillege` VALUES ('245', '16', '35');
INSERT INTO `kon_privillege` VALUES ('246', '16', '37');
INSERT INTO `kon_privillege` VALUES ('247', '16', '36');
INSERT INTO `kon_privillege` VALUES ('248', '16', '38');
INSERT INTO `kon_privillege` VALUES ('249', '16', '4');
INSERT INTO `kon_privillege` VALUES ('250', '16', '40');
INSERT INTO `kon_privillege` VALUES ('251', '16', '2');
INSERT INTO `kon_privillege` VALUES ('252', '16', '3');
INSERT INTO `kon_privillege` VALUES ('253', '16', '20');
INSERT INTO `kon_privillege` VALUES ('254', '16', '21');

-- ----------------------------
-- Table structure for kon_warna
-- ----------------------------
DROP TABLE IF EXISTS `kon_warna`;
CREATE TABLE `kon_warna` (
  `id_warna` int(11) NOT NULL AUTO_INCREMENT,
  `warna` varchar(25) NOT NULL,
  PRIMARY KEY (`id_warna`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_warna
-- ----------------------------
INSERT INTO `kon_warna` VALUES ('1', 'black');
INSERT INTO `kon_warna` VALUES ('2', 'white');
INSERT INTO `kon_warna` VALUES ('3', 'lime');
INSERT INTO `kon_warna` VALUES ('4', 'green');
INSERT INTO `kon_warna` VALUES ('5', 'emerald');
INSERT INTO `kon_warna` VALUES ('6', 'teal');
INSERT INTO `kon_warna` VALUES ('7', 'cyan');
INSERT INTO `kon_warna` VALUES ('8', 'cobalt');
INSERT INTO `kon_warna` VALUES ('9', 'indigo');
INSERT INTO `kon_warna` VALUES ('10', 'violet');
INSERT INTO `kon_warna` VALUES ('11', 'pink');
INSERT INTO `kon_warna` VALUES ('12', 'magenta');
INSERT INTO `kon_warna` VALUES ('13', 'crimson');
INSERT INTO `kon_warna` VALUES ('14', 'red');
INSERT INTO `kon_warna` VALUES ('15', 'orange');
INSERT INTO `kon_warna` VALUES ('16', 'amber');
INSERT INTO `kon_warna` VALUES ('17', 'yellow');
INSERT INTO `kon_warna` VALUES ('18', 'brown');
INSERT INTO `kon_warna` VALUES ('19', 'olive');
INSERT INTO `kon_warna` VALUES ('20', 'steel');
INSERT INTO `kon_warna` VALUES ('21', 'mauve');
INSERT INTO `kon_warna` VALUES ('22', 'taupe');
INSERT INTO `kon_warna` VALUES ('23', 'gray');
INSERT INTO `kon_warna` VALUES ('24', 'dark');
INSERT INTO `kon_warna` VALUES ('25', 'darker');
INSERT INTO `kon_warna` VALUES ('26', 'transparent');
INSERT INTO `kon_warna` VALUES ('27', 'darkBrown');
INSERT INTO `kon_warna` VALUES ('28', 'darkCrimson');
INSERT INTO `kon_warna` VALUES ('29', 'darkMagenta');
INSERT INTO `kon_warna` VALUES ('30', 'darkIndigo');
INSERT INTO `kon_warna` VALUES ('31', 'darkCyan');
INSERT INTO `kon_warna` VALUES ('32', 'darkCobalt');
INSERT INTO `kon_warna` VALUES ('33', 'darkTeal');
INSERT INTO `kon_warna` VALUES ('34', 'darkEmerald');
INSERT INTO `kon_warna` VALUES ('35', 'darkGreen');
INSERT INTO `kon_warna` VALUES ('36', 'darkOrange');
INSERT INTO `kon_warna` VALUES ('37', 'darkRed');
INSERT INTO `kon_warna` VALUES ('38', 'darkPink');
INSERT INTO `kon_warna` VALUES ('39', 'darkViolet');
INSERT INTO `kon_warna` VALUES ('40', 'darkBlue');
INSERT INTO `kon_warna` VALUES ('41', 'lightBlue');
INSERT INTO `kon_warna` VALUES ('42', 'lightTeal');
INSERT INTO `kon_warna` VALUES ('43', 'lightOlive');
INSERT INTO `kon_warna` VALUES ('44', 'lightOrange');
INSERT INTO `kon_warna` VALUES ('45', 'lightPink');
INSERT INTO `kon_warna` VALUES ('46', 'lightRed');
INSERT INTO `kon_warna` VALUES ('47', 'lightGreen');
