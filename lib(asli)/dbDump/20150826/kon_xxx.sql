/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-26 16:38:03
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_aksi
-- ----------------------------
INSERT INTO `kon_aksi` VALUES ('1', 'r', 'read');
INSERT INTO `kon_aksi` VALUES ('2', 'c', 'create');
INSERT INTO `kon_aksi` VALUES ('3', 'u', 'update');
INSERT INTO `kon_aksi` VALUES ('4', 'd', 'delete');
INSERT INTO `kon_aksi` VALUES ('5', 'p', 'print/report');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

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
INSERT INTO `kon_grupmenu` VALUES ('16', '1', '5', 'Master HRD', 'four');
INSERT INTO `kon_grupmenu` VALUES ('17', '2', '5', 'Transaksi HRD', 'four');
INSERT INTO `kon_grupmenu` VALUES ('18', '2', '5', 'Penggajian', 'four');
INSERT INTO `kon_grupmenu` VALUES ('19', '1', '7', 'Master Student Service', 'four');
INSERT INTO `kon_grupmenu` VALUES ('20', '2', '7', 'Pembelian', 'four');
INSERT INTO `kon_grupmenu` VALUES ('21', '2', '7', 'Penjualan', '');
INSERT INTO `kon_grupmenu` VALUES ('24', '2', '7', 'Jasa', 'four');
INSERT INTO `kon_grupmenu` VALUES ('25', '2', '7', 'Hutang / Piutang', 'four');
INSERT INTO `kon_grupmenu` VALUES ('26', '2', '7', 'biaya', 'four');
INSERT INTO `kon_grupmenu` VALUES ('27', '2', '7', 'Laporan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('28', '2', '7', 'Setting', '');
INSERT INTO `kon_grupmenu` VALUES ('29', '1', '13', 'Master PO', 'four');
INSERT INTO `kon_grupmenu` VALUES ('30', '2', '13', 'Permintaan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('31', '1', '13', 'Penawaran', 'four');
INSERT INTO `kon_grupmenu` VALUES ('32', '2', '13', 'Pemesanan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('33', '2', '13', 'Pembelian', 'four');
INSERT INTO `kon_grupmenu` VALUES ('34', '2', '13', 'setting', '');
INSERT INTO `kon_grupmenu` VALUES ('35', '1', '4', 'Transaksi Sarpras', 'four');
INSERT INTO `kon_grupmenu` VALUES ('37', '1', '4', 'Master Sarpras', 'four');
INSERT INTO `kon_grupmenu` VALUES ('38', '1', '14', 'setting', 'four');
INSERT INTO `kon_grupmenu` VALUES ('39', '2', '14', 'transaksi', 'four');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_level
-- ----------------------------
INSERT INTO `kon_level` VALUES ('17', 'SA', '1', 'Super Admin');
INSERT INTO `kon_level` VALUES ('18', 'A+', '2', 'Admin Plus');
INSERT INTO `kon_level` VALUES ('19', 'A', '3', 'Admin');
INSERT INTO `kon_level` VALUES ('20', 'O', '4', 'Operator');
INSERT INTO `kon_level` VALUES ('21', 'G', '5', 'Guest');

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
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelaksi
-- ----------------------------
INSERT INTO `kon_levelaksi` VALUES ('221', '53', '1');
INSERT INTO `kon_levelaksi` VALUES ('222', '54', '1');
INSERT INTO `kon_levelaksi` VALUES ('223', '53', '2');
INSERT INTO `kon_levelaksi` VALUES ('224', '54', '2');
INSERT INTO `kon_levelaksi` VALUES ('225', '53', '3');
INSERT INTO `kon_levelaksi` VALUES ('226', '54', '3');
INSERT INTO `kon_levelaksi` VALUES ('227', '53', '4');
INSERT INTO `kon_levelaksi` VALUES ('228', '54', '4');
INSERT INTO `kon_levelaksi` VALUES ('229', '53', '5');
INSERT INTO `kon_levelaksi` VALUES ('230', '54', '5');
INSERT INTO `kon_levelaksi` VALUES ('231', '55', '1');
INSERT INTO `kon_levelaksi` VALUES ('232', '56', '1');
INSERT INTO `kon_levelaksi` VALUES ('233', '55', '2');
INSERT INTO `kon_levelaksi` VALUES ('234', '56', '2');
INSERT INTO `kon_levelaksi` VALUES ('235', '55', '3');
INSERT INTO `kon_levelaksi` VALUES ('236', '56', '3');
INSERT INTO `kon_levelaksi` VALUES ('237', '55', '4');
INSERT INTO `kon_levelaksi` VALUES ('238', '56', '4');
INSERT INTO `kon_levelaksi` VALUES ('239', '55', '5');
INSERT INTO `kon_levelaksi` VALUES ('240', '56', '5');
INSERT INTO `kon_levelaksi` VALUES ('355', '57', '1');
INSERT INTO `kon_levelaksi` VALUES ('356', '58', '1');
INSERT INTO `kon_levelaksi` VALUES ('357', '57', '2');
INSERT INTO `kon_levelaksi` VALUES ('358', '57', '3');
INSERT INTO `kon_levelaksi` VALUES ('359', '57', '4');
INSERT INTO `kon_levelaksi` VALUES ('360', '57', '5');
INSERT INTO `kon_levelaksi` VALUES ('361', '58', '5');
INSERT INTO `kon_levelaksi` VALUES ('362', '59', '1');
INSERT INTO `kon_levelaksi` VALUES ('363', '60', '1');
INSERT INTO `kon_levelaksi` VALUES ('364', '59', '2');
INSERT INTO `kon_levelaksi` VALUES ('365', '59', '3');
INSERT INTO `kon_levelaksi` VALUES ('366', '59', '4');
INSERT INTO `kon_levelaksi` VALUES ('367', '59', '5');
INSERT INTO `kon_levelaksi` VALUES ('368', '60', '5');
INSERT INTO `kon_levelaksi` VALUES ('419', '61', '1');
INSERT INTO `kon_levelaksi` VALUES ('420', '61', '2');
INSERT INTO `kon_levelaksi` VALUES ('421', '61', '3');
INSERT INTO `kon_levelaksi` VALUES ('422', '61', '4');
INSERT INTO `kon_levelaksi` VALUES ('423', '61', '5');
INSERT INTO `kon_levelaksi` VALUES ('424', '63', '1');
INSERT INTO `kon_levelaksi` VALUES ('425', '63', '2');
INSERT INTO `kon_levelaksi` VALUES ('426', '63', '3');
INSERT INTO `kon_levelaksi` VALUES ('427', '63', '4');
INSERT INTO `kon_levelaksi` VALUES ('428', '63', '5');
INSERT INTO `kon_levelaksi` VALUES ('442', '67', '1');
INSERT INTO `kon_levelaksi` VALUES ('443', '67', '2');
INSERT INTO `kon_levelaksi` VALUES ('444', '67', '3');
INSERT INTO `kon_levelaksi` VALUES ('445', '67', '4');
INSERT INTO `kon_levelaksi` VALUES ('446', '67', '5');
INSERT INTO `kon_levelaksi` VALUES ('448', '71', '1');
INSERT INTO `kon_levelaksi` VALUES ('449', '71', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelkatgrupmenu
-- ----------------------------
INSERT INTO `kon_levelkatgrupmenu` VALUES ('53', '17', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('54', '17', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('55', '17', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('56', '17', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('57', '18', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('58', '18', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('59', '18', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('60', '18', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('61', '19', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('62', '19', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('63', '19', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('64', '19', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('65', '20', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('66', '20', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('67', '20', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('68', '20', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('69', '21', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('70', '21', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('71', '21', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('72', '21', '2', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_login
-- ----------------------------
INSERT INTO `kon_login` VALUES ('42', 'a', 'a', 'MGNjMTc1YjljMGYxYjZhODMxYzM5OWUyNjk3NzI2NjE=', '19', '0', '', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('44', 'g', 'g', 'YjJmNWZmNDc0MzY2NzFiNmU1MzNkOGRjMzYxNDg0NWQ=', '21', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('45', 'adm+ akademik', 'aaka', 'Yzg5MWY0ZTgxYjdhZmM4NzQ1ZDEwODAwNmQ1NWY5ODU=', '18', '0', '', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('46', 'new', 'new', 'MjJhZjY0NWQxODU5Y2I1Y2E2ZGEwYzQ4NGYxZjM3ZWE=', '18', '0', '', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('52', 'a+', 'a+', 'Yzg5NDhjMjAwOTRmNjQyMDBjMmI4ZmJhMDQ3YmRiODM=', '18', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('58', 'Mr. Boss', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', '17', '0', '1', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for kon_logindepartemen
-- ----------------------------
DROP TABLE IF EXISTS `kon_logindepartemen`;
CREATE TABLE `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  PRIMARY KEY (`id_logindepartemen`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_departemen` (`id_departemen`) USING BTREE,
  CONSTRAINT `id_login_FK2` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_logindepartemen
-- ----------------------------
INSERT INTO `kon_logindepartemen` VALUES ('9', '42', '1');
INSERT INTO `kon_logindepartemen` VALUES ('11', '44', '1');
INSERT INTO `kon_logindepartemen` VALUES ('12', '45', '1');
INSERT INTO `kon_logindepartemen` VALUES ('13', '46', '1');
INSERT INTO `kon_logindepartemen` VALUES ('27', '52', '1');
INSERT INTO `kon_logindepartemen` VALUES ('43', '58', '1');
INSERT INTO `kon_logindepartemen` VALUES ('44', '58', '2');
INSERT INTO `kon_logindepartemen` VALUES ('45', '58', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_loginhistory
-- ----------------------------
INSERT INTO `kon_loginhistory` VALUES ('11', '42', '2015-08-18 03:41:27');
INSERT INTO `kon_loginhistory` VALUES ('12', '42', '2015-08-18 03:41:27');
INSERT INTO `kon_loginhistory` VALUES ('15', '45', '2015-08-18 03:46:13');
INSERT INTO `kon_loginhistory` VALUES ('16', '45', '2015-08-18 03:46:13');
INSERT INTO `kon_loginhistory` VALUES ('57', '52', '2015-08-19 19:46:41');
INSERT INTO `kon_loginhistory` VALUES ('58', '52', '2015-08-19 19:46:41');
INSERT INTO `kon_loginhistory` VALUES ('65', '52', '2015-08-20 00:27:59');
INSERT INTO `kon_loginhistory` VALUES ('66', '52', '2015-08-20 00:27:59');
INSERT INTO `kon_loginhistory` VALUES ('131', '58', '2015-08-24 04:53:56');
INSERT INTO `kon_loginhistory` VALUES ('132', '58', '2015-08-24 04:53:56');
INSERT INTO `kon_loginhistory` VALUES ('133', '58', '2015-08-24 11:44:30');
INSERT INTO `kon_loginhistory` VALUES ('134', '58', '2015-08-24 11:44:30');
INSERT INTO `kon_loginhistory` VALUES ('135', '58', '2015-08-24 19:28:23');
INSERT INTO `kon_loginhistory` VALUES ('136', '58', '2015-08-24 19:28:23');
INSERT INTO `kon_loginhistory` VALUES ('137', '58', '2015-08-25 08:40:48');
INSERT INTO `kon_loginhistory` VALUES ('138', '58', '2015-08-25 08:40:48');
INSERT INTO `kon_loginhistory` VALUES ('139', '58', '2015-08-25 10:05:02');
INSERT INTO `kon_loginhistory` VALUES ('140', '58', '2015-08-25 10:05:02');
INSERT INTO `kon_loginhistory` VALUES ('141', '58', '2015-08-25 14:56:20');
INSERT INTO `kon_loginhistory` VALUES ('142', '58', '2015-08-25 14:56:20');
INSERT INTO `kon_loginhistory` VALUES ('143', '58', '2015-08-25 17:34:28');
INSERT INTO `kon_loginhistory` VALUES ('144', '58', '2015-08-25 17:34:28');
INSERT INTO `kon_loginhistory` VALUES ('145', '58', '2015-08-25 19:00:34');
INSERT INTO `kon_loginhistory` VALUES ('146', '58', '2015-08-25 19:00:34');
INSERT INTO `kon_loginhistory` VALUES ('147', '58', '2015-08-25 23:32:58');
INSERT INTO `kon_loginhistory` VALUES ('148', '58', '2015-08-25 23:32:58');
INSERT INTO `kon_loginhistory` VALUES ('149', '58', '2015-08-26 14:04:02');
INSERT INTO `kon_loginhistory` VALUES ('150', '58', '2015-08-26 14:04:02');
INSERT INTO `kon_loginhistory` VALUES ('151', '58', '2015-08-26 14:04:57');
INSERT INTO `kon_loginhistory` VALUES ('152', '58', '2015-08-26 14:04:57');
INSERT INTO `kon_loginhistory` VALUES ('153', '58', '2015-08-26 16:31:22');
INSERT INTO `kon_loginhistory` VALUES ('154', '58', '2015-08-26 16:31:22');
INSERT INTO `kon_loginhistory` VALUES ('155', '58', '2015-08-26 16:31:50');
INSERT INTO `kon_loginhistory` VALUES ('156', '58', '2015-08-26 16:31:50');
INSERT INTO `kon_loginhistory` VALUES ('157', '58', '2015-08-26 16:36:54');
INSERT INTO `kon_loginhistory` VALUES ('158', '58', '2015-08-26 16:36:54');
INSERT INTO `kon_loginhistory` VALUES ('159', '58', '2015-08-26 16:37:25');
INSERT INTO `kon_loginhistory` VALUES ('160', '58', '2015-08-26 16:37:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;

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
INSERT INTO `kon_menu` VALUES ('28', '3', 'Tingkat', 'tingkat', '', '12', '18', '');
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
INSERT INTO `kon_menu` VALUES ('41', '4', 'Biaya', 'biaya', 'double', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('42', '9', 'Diskon Tunai', 'diskon-tunai', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('43', '9', 'Angsuran', 'angsuran', '', '17', '13', '');
INSERT INTO `kon_menu` VALUES ('44', '9', 'golongan', 'golongan', '', '13', '16', '');
INSERT INTO `kon_menu` VALUES ('45', '7', 'menu', 'menu', '', '14', '16', '');
INSERT INTO `kon_menu` VALUES ('46', '7', 'Grup Modul', 'grup-modul', '', '13', '12', '');
INSERT INTO `kon_menu` VALUES ('47', '7', 'Modul', 'modul', '', '12', '11', '');
INSERT INTO `kon_menu` VALUES ('48', '7', 'Grup Menu', 'grup-menu', '', '16', '13', '');
INSERT INTO `kon_menu` VALUES ('52', '9', 'Gelombang', 'gelombang', '', '16', '10', 'kelompok pendaftaran  (gelombang)');
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
INSERT INTO `kon_menu` VALUES ('69', '16', 'Agama', 'agama', '', '16', '10', 'setting data master agama');
INSERT INTO `kon_menu` VALUES ('70', '16', 'Pendidikan', 'pendidikan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('71', '16', 'Departemen', 'departemen', '', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('72', '16', 'Jabatan', 'jabatan', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('73', '16', 'Status Karyawan', 'status-karyawan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('74', '16', 'Golongan', 'golongan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('75', '17', 'Berkas', 'berkas', 'double', '34', '10', '');
INSERT INTO `kon_menu` VALUES ('76', '17', 'Absensi', 'absensi', 'double', '16', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('77', '17', 'Cuti', 'cuti', 'double', '7', '10', '');
INSERT INTO `kon_menu` VALUES ('78', '17', 'Pinjaman', 'pinjaman', 'double', '17', '10', '');
INSERT INTO `kon_menu` VALUES ('79', '17', 'Karyawan', 'karyawan', 'double', '27', '12', '');
INSERT INTO `kon_menu` VALUES ('80', '18', 'Penggajian', 'penggajian', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('81', '18', 'Laporan', 'laporan', '', '10', '12', '');
INSERT INTO `kon_menu` VALUES ('82', '18', 'Setting BPJS', 'setting-bpjs', 'double', '5', '17', '');
INSERT INTO `kon_menu` VALUES ('83', '18', 'Golongan', 'golongan ', 'double', '22', '11', '');
INSERT INTO `kon_menu` VALUES ('84', '18', 'struktural', 'struktural', '', '41', '17', '');
INSERT INTO `kon_menu` VALUES ('85', '18', 'Fungsional', 'Fungsional', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('86', '18', 'Pengabdian', 'Pengabdian', '', '24', '17', '');
INSERT INTO `kon_menu` VALUES ('87', '18', 'istri anak', 'istri-anak', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('88', '18', 'uang transport', 'uang-transport', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('89', '18', 'beban tugas', 'beban-tugas', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('90', '18', 'wali kelas', 'wali-kelas', 'double', '13', '11', '');
INSERT INTO `kon_menu` VALUES ('91', '19', 'Jenjang', 'jenjang', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('92', '19', 'Kategori', 'kategori', 'double', '8', '1', '');
INSERT INTO `kon_menu` VALUES ('93', '19', 'produk', 'produk', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('94', '19', 'produk jasa', 'produk-jasa', 'double', '1', '11', '');
INSERT INTO `kon_menu` VALUES ('95', '19', 'beban biaya', 'beban-biaya', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('96', '19', 'supplier', 'supplier', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('97', '19', 'customer', 'customer', 'double', '8', '11', '');
INSERT INTO `kon_menu` VALUES ('98', '20', 'PO Pembelian', 'PO-Pembelian', 'double', '16', '14', '');
INSERT INTO `kon_menu` VALUES ('99', '20', 'Pembelian', 'Pembelian', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('100', '20', 'laporan pembelian', 'laporan-pembelian', 'double', '1', '12', '');
INSERT INTO `kon_menu` VALUES ('101', '20', 'retur pembelian', 'retur-pembelian', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('102', '20', 'laporan retur pembelian', 'laporan-retur-pembelian', 'double', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('103', '21', 'PO Penjualan', 'PO-Penjualan', 'double', '27', '17', '');
INSERT INTO `kon_menu` VALUES ('104', '21', 'Penjualan', 'Penjualan', 'double', '20', '1', '');
INSERT INTO `kon_menu` VALUES ('105', '21', 'Retur Penjualaan', 'Retur-Penjualaan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('106', '21', 'Laporan Penjualan', 'Laporan-Penjualan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('107', '21', 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', '18', '1', '');
INSERT INTO `kon_menu` VALUES ('108', '24', 'Penjualaan Jasa', 'Penjualaan-Jasa', 'double', '16', '1', '\r\n');
INSERT INTO `kon_menu` VALUES ('109', '24', 'Laporan Penjualaan Jasa', 'Laporan-Penjualaan-Jasa', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('110', '25', 'Hutang', 'hutang', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('111', '25', 'pembayaran', 'pembayaran', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('112', '25', 'laporan hutang', 'laporan-hutang', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('113', '25', 'laporan pembayaran', 'laporan-pembayaran', 'double', '16', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('114', '26', 'Transaksi Biaya', 'Transaksi-Biaya', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('115', '26', 'Laporan Biaya', 'Laporan-Biaya', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('116', '27', 'Laporan Stok', 'Laporan-Stok', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('117', '27', 'Laporan Laba/Rugi', 'Laporan-Laba/Rugi', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('119', '27', 'Laporan Pembelian', 'Laporan-Pembelian', 'double', '7', '10', '');
INSERT INTO `kon_menu` VALUES ('120', '27', 'Laporan Retur Pembelian', 'Laporan-Retur-Pembelian', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('121', '27', 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('122', '27', 'Laporan Penjualan', 'Laporan-Penjualan', 'double', '16', '17', '');
INSERT INTO `kon_menu` VALUES ('123', '28', 'User', 'user', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('124', '28', 'password', 'password', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('125', '29', 'supplier', 'supplier', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('126', '30', 'Purchase Requisition', 'Purchase-Requisition', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('127', '30', 'Laporan Permintaan', 'Laporan-Perrmintaan', 'double', '18', '10', '');
INSERT INTO `kon_menu` VALUES ('128', '30', 'Batal Purchase Requisition', 'Batal-Purchase-Requisition', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('129', '31', 'Penawaran', 'Penawaran', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('130', '31', 'Laporan Penawaran', 'Laporan-Penawaran', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('131', '31', 'Formulir Fisik Penawaran ', 'Formulir-Fisik-Penawaran ', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('132', '32', 'Purchase Order', 'Purchase-Order', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('133', '32', 'Laporan Pemesanan', 'Laporan-Pemesanan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('134', '32', 'Batal Purchase Order', 'Batal \\-Purchase-Order', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('135', '33', 'Pembelian', 'Pembelian', 'double', '1', '10', '');
INSERT INTO `kon_menu` VALUES ('136', '33', 'Laporan Pembelian', 'Laporan-Pembelian', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('137', '33', 'Retur Pembelian', 'Retur-Pembelian', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('138', '33', 'Laporan Retur PEmbelian', 'Laporan-Retur-PEmbelian', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('139', '34', 'User', 'User', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('140', '34', 'password', 'password', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('141', '37', 'Lokasi', 'lokasi', 'double', '1', '10', '');
INSERT INTO `kon_menu` VALUES ('142', '37', 'Tempat', 'tempat', 'double', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('143', '37', 'Tempat', 'tempat', 'double', '20', '12', '');
INSERT INTO `kon_menu` VALUES ('144', '35', 'Inventaris', 'inventaris', 'double', '8', '15', '');
INSERT INTO `kon_menu` VALUES ('145', '35', 'Peminjaman', 'peminjaman', 'double', '18', '17', '');
INSERT INTO `kon_menu` VALUES ('146', '35', 'aktivitas', 'aktivitas', 'double', '7', '12', '');
INSERT INTO `kon_menu` VALUES ('147', '38', 'user', 'user', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('148', '39', 'tahap2', 'tahap2', 'double', '16', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('149', '38', 'password', 'password', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('150', '39', 'tahap1', 'tahap1', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('151', '39', 'tahap3', 'tahap3', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('152', '4', 'Detail Diskon Tunai', 'detail-diskon-tunai', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('153', '4', 'Detail Gelombang', 'detail-gelombang', 'double', '8', '11', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

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

-- ----------------------------
-- Table structure for kon_privillege
-- ----------------------------
DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_privillege`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_menu` (`id_menu`) USING BTREE,
  CONSTRAINT `id_login_FK` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_menu_FK` FOREIGN KEY (`id_menu`) REFERENCES `kon_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_privillege
-- ----------------------------
INSERT INTO `kon_privillege` VALUES ('142', '42', '48', '1');
INSERT INTO `kon_privillege` VALUES ('143', '42', '46', '1');
INSERT INTO `kon_privillege` VALUES ('144', '42', '22', '1');
INSERT INTO `kon_privillege` VALUES ('145', '42', '45', '1');
INSERT INTO `kon_privillege` VALUES ('146', '42', '47', '1');
INSERT INTO `kon_privillege` VALUES ('147', '42', '19', '1');
INSERT INTO `kon_privillege` VALUES ('148', '42', '20', '1');
INSERT INTO `kon_privillege` VALUES ('149', '42', '21', '1');
INSERT INTO `kon_privillege` VALUES ('152', '44', '20', '1');
INSERT INTO `kon_privillege` VALUES ('153', '44', '21', '1');
INSERT INTO `kon_privillege` VALUES ('154', '45', '26', '0');
INSERT INTO `kon_privillege` VALUES ('155', '45', '25', '0');
INSERT INTO `kon_privillege` VALUES ('156', '45', '39', '0');
INSERT INTO `kon_privillege` VALUES ('157', '45', '33', '0');
INSERT INTO `kon_privillege` VALUES ('158', '45', '32', '0');
INSERT INTO `kon_privillege` VALUES ('159', '45', '30', '0');
INSERT INTO `kon_privillege` VALUES ('160', '45', '34', '0');
INSERT INTO `kon_privillege` VALUES ('161', '45', '31', '0');
INSERT INTO `kon_privillege` VALUES ('162', '45', '29', '0');
INSERT INTO `kon_privillege` VALUES ('163', '45', '28', '0');
INSERT INTO `kon_privillege` VALUES ('164', '45', '24', '0');
INSERT INTO `kon_privillege` VALUES ('165', '45', '35', '0');
INSERT INTO `kon_privillege` VALUES ('166', '45', '37', '0');
INSERT INTO `kon_privillege` VALUES ('167', '45', '38', '0');
INSERT INTO `kon_privillege` VALUES ('168', '45', '4', '0');
INSERT INTO `kon_privillege` VALUES ('169', '45', '40', '0');
INSERT INTO `kon_privillege` VALUES ('170', '45', '48', '0');
INSERT INTO `kon_privillege` VALUES ('171', '45', '46', '0');
INSERT INTO `kon_privillege` VALUES ('172', '45', '45', '0');
INSERT INTO `kon_privillege` VALUES ('173', '45', '47', '0');
INSERT INTO `kon_privillege` VALUES ('174', '45', '21', '0');
INSERT INTO `kon_privillege` VALUES ('175', '46', '26', '0');
INSERT INTO `kon_privillege` VALUES ('176', '46', '25', '0');
INSERT INTO `kon_privillege` VALUES ('177', '46', '39', '0');
INSERT INTO `kon_privillege` VALUES ('178', '46', '33', '0');
INSERT INTO `kon_privillege` VALUES ('179', '46', '32', '0');
INSERT INTO `kon_privillege` VALUES ('180', '46', '30', '0');
INSERT INTO `kon_privillege` VALUES ('181', '46', '34', '0');
INSERT INTO `kon_privillege` VALUES ('182', '46', '31', '0');
INSERT INTO `kon_privillege` VALUES ('183', '46', '29', '0');
INSERT INTO `kon_privillege` VALUES ('184', '46', '27', '0');
INSERT INTO `kon_privillege` VALUES ('185', '46', '28', '0');
INSERT INTO `kon_privillege` VALUES ('186', '46', '16', '0');
INSERT INTO `kon_privillege` VALUES ('187', '46', '15', '0');
INSERT INTO `kon_privillege` VALUES ('188', '46', '14', '0');
INSERT INTO `kon_privillege` VALUES ('189', '46', '13', '0');
INSERT INTO `kon_privillege` VALUES ('190', '46', '12', '0');
INSERT INTO `kon_privillege` VALUES ('691', '52', '24', '0');
INSERT INTO `kon_privillege` VALUES ('692', '52', '35', '0');
INSERT INTO `kon_privillege` VALUES ('693', '52', '37', '0');
INSERT INTO `kon_privillege` VALUES ('694', '52', '36', '0');
INSERT INTO `kon_privillege` VALUES ('695', '52', '38', '0');
INSERT INTO `kon_privillege` VALUES ('696', '52', '4', '0');
INSERT INTO `kon_privillege` VALUES ('697', '52', '40', '0');
INSERT INTO `kon_privillege` VALUES ('698', '52', '2', '0');
INSERT INTO `kon_privillege` VALUES ('699', '52', '3', '0');
INSERT INTO `kon_privillege` VALUES ('700', '52', '22', '0');
INSERT INTO `kon_privillege` VALUES ('701', '52', '45', '0');
INSERT INTO `kon_privillege` VALUES ('702', '52', '47', '0');
INSERT INTO `kon_privillege` VALUES ('703', '52', '19', '0');
INSERT INTO `kon_privillege` VALUES ('704', '52', '21', '0');
INSERT INTO `kon_privillege` VALUES ('1409', '58', '1', '1');
INSERT INTO `kon_privillege` VALUES ('1410', '58', '2', '1');
INSERT INTO `kon_privillege` VALUES ('1411', '58', '3', '1');
INSERT INTO `kon_privillege` VALUES ('1412', '58', '4', '1');
INSERT INTO `kon_privillege` VALUES ('1413', '58', '8', '1');
INSERT INTO `kon_privillege` VALUES ('1414', '58', '9', '1');
INSERT INTO `kon_privillege` VALUES ('1415', '58', '10', '1');
INSERT INTO `kon_privillege` VALUES ('1416', '58', '12', '1');
INSERT INTO `kon_privillege` VALUES ('1417', '58', '13', '1');
INSERT INTO `kon_privillege` VALUES ('1418', '58', '14', '1');
INSERT INTO `kon_privillege` VALUES ('1419', '58', '15', '1');
INSERT INTO `kon_privillege` VALUES ('1420', '58', '16', '1');
INSERT INTO `kon_privillege` VALUES ('1421', '58', '19', '1');
INSERT INTO `kon_privillege` VALUES ('1422', '58', '20', '1');
INSERT INTO `kon_privillege` VALUES ('1423', '58', '21', '1');
INSERT INTO `kon_privillege` VALUES ('1424', '58', '22', '1');
INSERT INTO `kon_privillege` VALUES ('1425', '58', '24', '1');
INSERT INTO `kon_privillege` VALUES ('1426', '58', '25', '1');
INSERT INTO `kon_privillege` VALUES ('1427', '58', '26', '1');
INSERT INTO `kon_privillege` VALUES ('1428', '58', '27', '1');
INSERT INTO `kon_privillege` VALUES ('1429', '58', '28', '1');
INSERT INTO `kon_privillege` VALUES ('1430', '58', '29', '1');
INSERT INTO `kon_privillege` VALUES ('1431', '58', '30', '1');
INSERT INTO `kon_privillege` VALUES ('1432', '58', '31', '1');
INSERT INTO `kon_privillege` VALUES ('1433', '58', '32', '1');
INSERT INTO `kon_privillege` VALUES ('1434', '58', '33', '1');
INSERT INTO `kon_privillege` VALUES ('1435', '58', '34', '1');
INSERT INTO `kon_privillege` VALUES ('1436', '58', '35', '1');
INSERT INTO `kon_privillege` VALUES ('1437', '58', '36', '1');
INSERT INTO `kon_privillege` VALUES ('1438', '58', '37', '1');
INSERT INTO `kon_privillege` VALUES ('1439', '58', '38', '1');
INSERT INTO `kon_privillege` VALUES ('1440', '58', '39', '1');
INSERT INTO `kon_privillege` VALUES ('1441', '58', '40', '1');
INSERT INTO `kon_privillege` VALUES ('1442', '58', '41', '1');
INSERT INTO `kon_privillege` VALUES ('1443', '58', '42', '1');
INSERT INTO `kon_privillege` VALUES ('1444', '58', '43', '1');
INSERT INTO `kon_privillege` VALUES ('1445', '58', '44', '1');
INSERT INTO `kon_privillege` VALUES ('1446', '58', '45', '1');
INSERT INTO `kon_privillege` VALUES ('1447', '58', '46', '1');
INSERT INTO `kon_privillege` VALUES ('1448', '58', '47', '1');
INSERT INTO `kon_privillege` VALUES ('1449', '58', '48', '1');
INSERT INTO `kon_privillege` VALUES ('1450', '58', '52', '1');
INSERT INTO `kon_privillege` VALUES ('1451', '58', '53', '1');
INSERT INTO `kon_privillege` VALUES ('1452', '58', '54', '1');
INSERT INTO `kon_privillege` VALUES ('1453', '58', '55', '1');
INSERT INTO `kon_privillege` VALUES ('1454', '58', '56', '1');
INSERT INTO `kon_privillege` VALUES ('1455', '58', '57', '1');
INSERT INTO `kon_privillege` VALUES ('1456', '58', '58', '1');
INSERT INTO `kon_privillege` VALUES ('1457', '58', '59', '1');
INSERT INTO `kon_privillege` VALUES ('1458', '58', '60', '1');
INSERT INTO `kon_privillege` VALUES ('1459', '58', '61', '1');
INSERT INTO `kon_privillege` VALUES ('1460', '58', '62', '1');
INSERT INTO `kon_privillege` VALUES ('1461', '58', '63', '1');
INSERT INTO `kon_privillege` VALUES ('1462', '58', '64', '1');
INSERT INTO `kon_privillege` VALUES ('1463', '58', '65', '1');
INSERT INTO `kon_privillege` VALUES ('1464', '58', '66', '1');
INSERT INTO `kon_privillege` VALUES ('1465', '58', '67', '1');
INSERT INTO `kon_privillege` VALUES ('1466', '58', '68', '1');
INSERT INTO `kon_privillege` VALUES ('1467', '58', '69', '1');
INSERT INTO `kon_privillege` VALUES ('1468', '58', '70', '1');
INSERT INTO `kon_privillege` VALUES ('1469', '58', '71', '1');
INSERT INTO `kon_privillege` VALUES ('1470', '58', '72', '1');
INSERT INTO `kon_privillege` VALUES ('1471', '58', '73', '1');
INSERT INTO `kon_privillege` VALUES ('1472', '58', '74', '1');
INSERT INTO `kon_privillege` VALUES ('1473', '58', '75', '1');
INSERT INTO `kon_privillege` VALUES ('1474', '58', '76', '1');
INSERT INTO `kon_privillege` VALUES ('1475', '58', '77', '1');
INSERT INTO `kon_privillege` VALUES ('1476', '58', '78', '1');
INSERT INTO `kon_privillege` VALUES ('1477', '58', '79', '1');
INSERT INTO `kon_privillege` VALUES ('1478', '58', '80', '1');
INSERT INTO `kon_privillege` VALUES ('1479', '58', '81', '1');
INSERT INTO `kon_privillege` VALUES ('1480', '58', '82', '1');
INSERT INTO `kon_privillege` VALUES ('1481', '58', '83', '1');
INSERT INTO `kon_privillege` VALUES ('1482', '58', '84', '1');
INSERT INTO `kon_privillege` VALUES ('1483', '58', '85', '1');
INSERT INTO `kon_privillege` VALUES ('1484', '58', '86', '1');
INSERT INTO `kon_privillege` VALUES ('1485', '58', '87', '1');
INSERT INTO `kon_privillege` VALUES ('1486', '58', '88', '1');
INSERT INTO `kon_privillege` VALUES ('1487', '58', '89', '1');
INSERT INTO `kon_privillege` VALUES ('1488', '58', '90', '1');
INSERT INTO `kon_privillege` VALUES ('1489', '58', '91', '1');
INSERT INTO `kon_privillege` VALUES ('1490', '58', '92', '1');
INSERT INTO `kon_privillege` VALUES ('1491', '58', '93', '1');
INSERT INTO `kon_privillege` VALUES ('1492', '58', '94', '1');
INSERT INTO `kon_privillege` VALUES ('1493', '58', '95', '1');
INSERT INTO `kon_privillege` VALUES ('1494', '58', '96', '1');
INSERT INTO `kon_privillege` VALUES ('1495', '58', '97', '1');
INSERT INTO `kon_privillege` VALUES ('1496', '58', '98', '1');
INSERT INTO `kon_privillege` VALUES ('1497', '58', '99', '1');
INSERT INTO `kon_privillege` VALUES ('1498', '58', '100', '1');
INSERT INTO `kon_privillege` VALUES ('1499', '58', '101', '1');
INSERT INTO `kon_privillege` VALUES ('1500', '58', '102', '1');
INSERT INTO `kon_privillege` VALUES ('1501', '58', '103', '1');
INSERT INTO `kon_privillege` VALUES ('1502', '58', '104', '1');
INSERT INTO `kon_privillege` VALUES ('1503', '58', '105', '1');
INSERT INTO `kon_privillege` VALUES ('1504', '58', '106', '1');
INSERT INTO `kon_privillege` VALUES ('1505', '58', '107', '1');
INSERT INTO `kon_privillege` VALUES ('1506', '58', '108', '1');
INSERT INTO `kon_privillege` VALUES ('1507', '58', '109', '1');
INSERT INTO `kon_privillege` VALUES ('1508', '58', '110', '1');
INSERT INTO `kon_privillege` VALUES ('1509', '58', '111', '1');
INSERT INTO `kon_privillege` VALUES ('1510', '58', '112', '1');
INSERT INTO `kon_privillege` VALUES ('1511', '58', '113', '1');
INSERT INTO `kon_privillege` VALUES ('1512', '58', '114', '1');
INSERT INTO `kon_privillege` VALUES ('1513', '58', '115', '1');
INSERT INTO `kon_privillege` VALUES ('1514', '58', '116', '1');
INSERT INTO `kon_privillege` VALUES ('1515', '58', '117', '1');
INSERT INTO `kon_privillege` VALUES ('1516', '58', '119', '1');
INSERT INTO `kon_privillege` VALUES ('1517', '58', '120', '1');
INSERT INTO `kon_privillege` VALUES ('1518', '58', '121', '1');
INSERT INTO `kon_privillege` VALUES ('1519', '58', '122', '1');
INSERT INTO `kon_privillege` VALUES ('1520', '58', '123', '1');
INSERT INTO `kon_privillege` VALUES ('1521', '58', '124', '1');
INSERT INTO `kon_privillege` VALUES ('1522', '58', '125', '1');
INSERT INTO `kon_privillege` VALUES ('1523', '58', '126', '1');
INSERT INTO `kon_privillege` VALUES ('1524', '58', '127', '1');
INSERT INTO `kon_privillege` VALUES ('1525', '58', '128', '1');
INSERT INTO `kon_privillege` VALUES ('1526', '58', '129', '1');
INSERT INTO `kon_privillege` VALUES ('1527', '58', '130', '1');
INSERT INTO `kon_privillege` VALUES ('1528', '58', '131', '1');
INSERT INTO `kon_privillege` VALUES ('1529', '58', '132', '1');
INSERT INTO `kon_privillege` VALUES ('1530', '58', '133', '1');
INSERT INTO `kon_privillege` VALUES ('1531', '58', '134', '1');
INSERT INTO `kon_privillege` VALUES ('1532', '58', '135', '1');
INSERT INTO `kon_privillege` VALUES ('1533', '58', '136', '1');
INSERT INTO `kon_privillege` VALUES ('1534', '58', '137', '1');
INSERT INTO `kon_privillege` VALUES ('1535', '58', '138', '1');
INSERT INTO `kon_privillege` VALUES ('1536', '58', '139', '1');
INSERT INTO `kon_privillege` VALUES ('1537', '58', '140', '1');
INSERT INTO `kon_privillege` VALUES ('1538', '58', '141', '1');
INSERT INTO `kon_privillege` VALUES ('1539', '58', '142', '1');
INSERT INTO `kon_privillege` VALUES ('1540', '58', '143', '1');
INSERT INTO `kon_privillege` VALUES ('1541', '58', '144', '1');
INSERT INTO `kon_privillege` VALUES ('1542', '58', '145', '1');
INSERT INTO `kon_privillege` VALUES ('1543', '58', '146', '1');
INSERT INTO `kon_privillege` VALUES ('1544', '58', '147', '1');
INSERT INTO `kon_privillege` VALUES ('1545', '58', '148', '1');
INSERT INTO `kon_privillege` VALUES ('1546', '58', '149', '1');
INSERT INTO `kon_privillege` VALUES ('1547', '58', '150', '1');
INSERT INTO `kon_privillege` VALUES ('1548', '58', '151', '1');
INSERT INTO `kon_privillege` VALUES ('1549', '58', '152', '1');
INSERT INTO `kon_privillege` VALUES ('1550', '58', '153', '1');

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
