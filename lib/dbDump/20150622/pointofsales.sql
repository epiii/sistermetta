/*
Navicat MySQL Data Transfer

Source Server         : locale
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : pointofsales

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-06-23 06:43:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pos_customer
-- ----------------------------
DROP TABLE IF EXISTS `pos_customer`;
CREATE TABLE `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_customer
-- ----------------------------
INSERT INTO `pos_customer` VALUES ('1', '123', 'BRYANT', '1');
INSERT INTO `pos_customer` VALUES ('2', '234', 'ALEXANDER', '1');

-- ----------------------------
-- Table structure for pos_jenisproduk
-- ----------------------------
DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_jenisproduk
-- ----------------------------
INSERT INTO `pos_jenisproduk` VALUES ('1', 'SERAGAM');
INSERT INTO `pos_jenisproduk` VALUES ('3', 'BUKU');
INSERT INTO `pos_jenisproduk` VALUES ('4', 'ATK');

-- ----------------------------
-- Table structure for pos_jenjang
-- ----------------------------
DROP TABLE IF EXISTS `pos_jenjang`;
CREATE TABLE `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_jenjang
-- ----------------------------
INSERT INTO `pos_jenjang` VALUES ('1', 'Playgroup');
INSERT INTO `pos_jenjang` VALUES ('2', 'Kindegarden');
INSERT INTO `pos_jenjang` VALUES ('3', 'Elementary');
INSERT INTO `pos_jenjang` VALUES ('4', 'Primary');

-- ----------------------------
-- Table structure for pos_kelas
-- ----------------------------
DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_kelas
-- ----------------------------
INSERT INTO `pos_kelas` VALUES ('1', 'A', '3');
INSERT INTO `pos_kelas` VALUES ('2', 'B', '2');

-- ----------------------------
-- Table structure for pos_pembelian
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembelian`;
CREATE TABLE `pos_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Kredit') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembelian
-- ----------------------------
INSERT INTO `pos_pembelian` VALUES ('7', 'INV2603150001', '2015-03-26', 'SUP111', 'Tunai', '490000', '0', '490000', '500000', 'admin');
INSERT INTO `pos_pembelian` VALUES ('8', 'INV2603150002', '2015-03-26', 'SUP0019', 'Tunai', '720000', '5000', '715000', '720000', 'admin');

-- ----------------------------
-- Table structure for pos_pembeliandetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembeliandetail
-- ----------------------------
INSERT INTO `pos_pembeliandetail` VALUES ('14', 'INV2603150001', 'KEMEJA PUTRA', '2', '120000');
INSERT INTO `pos_pembeliandetail` VALUES ('15', 'INV2603150001', 'DASI', '5', '50000');
INSERT INTO `pos_pembeliandetail` VALUES ('16', 'INV2603150002', 'KEMEJA PUTRA', '6', '120000');

-- ----------------------------
-- Table structure for pos_pembelianretur
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembelianretur`;
CREATE TABLE `pos_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembelianretur
-- ----------------------------
INSERT INTO `pos_pembelianretur` VALUES ('3', 'RTB2603150002', '2015-03-26', 'SUP111', '375000', 'admin');
INSERT INTO `pos_pembelianretur` VALUES ('4', 'RTB2603150003', '2015-03-26', 'SUP111', '115000', 'admin');
INSERT INTO `pos_pembelianretur` VALUES ('5', 'RTB2603150004', '2015-03-26', 'SUP0019', '240000', 'admin');

-- ----------------------------
-- Table structure for pos_pembelianreturdetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembelianreturdetail
-- ----------------------------
INSERT INTO `pos_pembelianreturdetail` VALUES ('3', 'RTB2603150002', 'BLOUSE PUTRI', '1', '115000');
INSERT INTO `pos_pembelianreturdetail` VALUES ('4', 'RTB2603150002', 'JUMPER PUTRI', '2', '130000');
INSERT INTO `pos_pembelianreturdetail` VALUES ('5', 'RTB2603150003', 'BLOUSE PUTRI', '1', '115000');
INSERT INTO `pos_pembelianreturdetail` VALUES ('6', 'RTB2603150004', 'KEMEJA PUTRA', '2', '120000');

-- ----------------------------
-- Table structure for pos_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualan`;
CREATE TABLE `pos_penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Kredit') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualan
-- ----------------------------
INSERT INTO `pos_penjualan` VALUES ('1', 'FAK2603150001', '2015-03-26', '123', 'Tunai', '125000', '0', '125000', '125000', 'admin');

-- ----------------------------
-- Table structure for pos_penjualandetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualandetail`;
CREATE TABLE `pos_penjualandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualandetail
-- ----------------------------
INSERT INTO `pos_penjualandetail` VALUES ('1', 'FAK2603150001', 'CELANA PUTRA', '1', '125000');

-- ----------------------------
-- Table structure for pos_penjualanretur
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanretur`;
CREATE TABLE `pos_penjualanretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanretur
-- ----------------------------
INSERT INTO `pos_penjualanretur` VALUES ('2', 'RTJ2603150001', '2015-03-26', '123', '75000', 'admin');

-- ----------------------------
-- Table structure for pos_penjualanreturdetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanreturdetail`;
CREATE TABLE `pos_penjualanreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanreturdetail
-- ----------------------------
INSERT INTO `pos_penjualanreturdetail` VALUES ('2', 'RTJ2603150001', 'KAOS OR', '1', '75000');

-- ----------------------------
-- Table structure for pos_produk
-- ----------------------------
DROP TABLE IF EXISTS `pos_produk`;
CREATE TABLE `pos_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_produk
-- ----------------------------
INSERT INTO `pos_produk` VALUES ('15', '1', 'BLOUSE PUTRI', 'BLOUSE PUTRI ', '100', '115000', '115000');
INSERT INTO `pos_produk` VALUES ('16', '1', 'JUMPER PUTRI', 'JUMPER PUTRI', '126', '130000', '130000');
INSERT INTO `pos_produk` VALUES ('17', '1', 'KEMEJA PUTRA', 'KEMEJA PUTRA', '412', '120000', '120000');
INSERT INTO `pos_produk` VALUES ('18', '1', 'CELANA PUTRA', 'CELANA PUTRA', '334', '125000', '125000');
INSERT INTO `pos_produk` VALUES ('19', '1', 'DASI', 'DASI', '532', '50000', '50000');
INSERT INTO `pos_produk` VALUES ('20', '1', 'KAOS OR', 'KAOS OLAH RAGA', '786', '75000', '75000');
INSERT INTO `pos_produk` VALUES ('21', '1', 'CELANA OR', 'CELANA OLAH RAGA', '562', '75000', '75000');
INSERT INTO `pos_produk` VALUES ('22', '1', 'TOPI', 'TOPI', '402', '55000', '55000');

-- ----------------------------
-- Table structure for pos_situs
-- ----------------------------
DROP TABLE IF EXISTS `pos_situs`;
CREATE TABLE `pos_situs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email_master` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `judul_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `slogan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `keywords` text COLLATE latin1_general_ci NOT NULL,
  `maxkonten` int(2) NOT NULL DEFAULT '5',
  `maxadmindata` int(2) NOT NULL DEFAULT '5',
  `maxdata` int(2) NOT NULL DEFAULT '5',
  `maxgalleri` int(2) NOT NULL DEFAULT '4',
  `widgetshare` int(2) NOT NULL DEFAULT '0',
  `theme` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'tcms',
  `author` text COLLATE latin1_general_ci NOT NULL,
  `alamatkantor` text COLLATE latin1_general_ci NOT NULL,
  `publishwebsite` int(1) NOT NULL DEFAULT '1',
  `publishnews` int(2) NOT NULL,
  `maxgalleridata` int(11) NOT NULL,
  `widgetkomentar` int(2) NOT NULL DEFAULT '1',
  `widgetpenulis` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of pos_situs
-- ----------------------------
INSERT INTO `pos_situs` VALUES ('1', 'rekysda@gmail.com', 'Student Service', 'http://localhost/siadu/pointofsales/', 'Point Of Sales', 'WebDesign dengan sistem Responsive', 'sisfohrd,surabaya,indonesia', '5', '50', '5', '4', '3', 'pos', 'Elyon Christian School', 'Surabaya', '1', '1', '12', '1', '2');

-- ----------------------------
-- Table structure for pos_supplier
-- ----------------------------
DROP TABLE IF EXISTS `pos_supplier`;
CREATE TABLE `pos_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_supplier
-- ----------------------------
INSERT INTO `pos_supplier` VALUES ('1', 'SUP0019', 'CV. MAJU BERKAH', 'JAKARTA', '0215469856');
INSERT INTO `pos_supplier` VALUES ('2', 'SUP111', 'CV. ADIPERKASA', 'SIDOARJO', '0312568899');
INSERT INTO `pos_supplier` VALUES ('3', '111', 'PT. ADI JAYA', 'SURABAYA', '0315689523');

-- ----------------------------
-- Table structure for pos_useraura
-- ----------------------------
DROP TABLE IF EXISTS `pos_useraura`;
CREATE TABLE `pos_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Payroll','HRD') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_useraura
-- ----------------------------
INSERT INTO `pos_useraura` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', '0', '2015-06-05 15:19:14', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>');
INSERT INTO `pos_useraura` VALUES ('28', 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', '1', '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
