/*
Navicat MySQL Data Transfer

Source Server         : locale
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : pemesanan

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-06-23 06:43:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for po_alur_stok
-- ----------------------------
DROP TABLE IF EXISTS `po_alur_stok`;
CREATE TABLE `po_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_alur_stok
-- ----------------------------
INSERT INTO `po_alur_stok` VALUES ('1', '2015-05-18', 'Saldo Awal', '-', 'KD001', '50');
INSERT INTO `po_alur_stok` VALUES ('2', '2015-05-18', 'Pembelian', 'INV1805150001', 'KD001', '5');
INSERT INTO `po_alur_stok` VALUES ('3', '2015-05-18', 'Pembelian', 'INV1805150001', 'KD001', '5');
INSERT INTO `po_alur_stok` VALUES ('4', '2015-05-18', 'Pembelian', 'INV1805150002', 'KD001', '1');
INSERT INTO `po_alur_stok` VALUES ('5', '2015-05-19', 'Retur Pembelian', 'RTB1905150001', 'KD001', '5');
INSERT INTO `po_alur_stok` VALUES ('9', '2015-05-01', 'Saldo Awal', '-', 'B01', '50');
INSERT INTO `po_alur_stok` VALUES ('10', '2015-05-07', 'Mutasi Masuk', '-', 'B01', '2');
INSERT INTO `po_alur_stok` VALUES ('11', '2015-05-25', 'Pembelian', 'INV2505150003', 'B01', '5');
INSERT INTO `po_alur_stok` VALUES ('12', '2015-06-01', 'Pembelian', 'INV0106150004', 'KD001', '5');
INSERT INTO `po_alur_stok` VALUES ('13', '2015-06-01', 'Pembelian', 'INV0106150004', 'B01', '4');
INSERT INTO `po_alur_stok` VALUES ('14', '2015-06-01', 'Retur Pembelian', 'RTB0106150002', 'KD001', '2');
INSERT INTO `po_alur_stok` VALUES ('15', '2015-06-05', 'Pembelian', 'INV0506150005', 'KD001', '3');
INSERT INTO `po_alur_stok` VALUES ('16', '2015-06-05', 'Pembelian', 'INV0506150005', 'B01', '1');
INSERT INTO `po_alur_stok` VALUES ('17', '2015-06-12', 'Pembelian', 'INV1206150006', '123', '1');
INSERT INTO `po_alur_stok` VALUES ('18', '2015-06-12', 'Pembelian', 'INV1206150001', '3', '1');
INSERT INTO `po_alur_stok` VALUES ('19', '2015-06-12', 'Pembelian', 'INV1206150001', '10', '1');

-- ----------------------------
-- Table structure for po_bulan
-- ----------------------------
DROP TABLE IF EXISTS `po_bulan`;
CREATE TABLE `po_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_bulan
-- ----------------------------
INSERT INTO `po_bulan` VALUES ('1', 'Januari', '01');
INSERT INTO `po_bulan` VALUES ('2', 'Februari', '02');
INSERT INTO `po_bulan` VALUES ('3', 'Maret', '03');
INSERT INTO `po_bulan` VALUES ('4', 'April', '04');
INSERT INTO `po_bulan` VALUES ('5', 'Mei', '05');
INSERT INTO `po_bulan` VALUES ('6', 'Juni', '06');
INSERT INTO `po_bulan` VALUES ('7', 'Juli', '07');
INSERT INTO `po_bulan` VALUES ('8', 'Agustus', '08');
INSERT INTO `po_bulan` VALUES ('9', 'September', '09');
INSERT INTO `po_bulan` VALUES ('10', 'Oktober', '10');
INSERT INTO `po_bulan` VALUES ('11', 'Nopember', '11');
INSERT INTO `po_bulan` VALUES ('12', 'Desember', '12');

-- ----------------------------
-- Table structure for po_jenisproduk
-- ----------------------------
DROP TABLE IF EXISTS `po_jenisproduk`;
CREATE TABLE `po_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_jenisproduk
-- ----------------------------
INSERT INTO `po_jenisproduk` VALUES ('4', 'ALAT SEKOLAH');

-- ----------------------------
-- Table structure for po_pembelian
-- ----------------------------
DROP TABLE IF EXISTS `po_pembelian`;
CREATE TABLE `po_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Hutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `hutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_pembelian
-- ----------------------------
INSERT INTO `po_pembelian` VALUES ('7', 'INV1206150001', 'PO1206150001', '2015-06-12', 'SUP01', 'Tunai', '200000', '0', '200000', '200000', '0', '0', '', 'admin');

-- ----------------------------
-- Table structure for po_pembeliandetail
-- ----------------------------
DROP TABLE IF EXISTS `po_pembeliandetail`;
CREATE TABLE `po_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_pembeliandetail
-- ----------------------------
INSERT INTO `po_pembeliandetail` VALUES ('9', 'INV1206150001', '3', '0', '1', '0', '0', '0');
INSERT INTO `po_pembeliandetail` VALUES ('10', 'INV1206150001', '10', '0', '1', '200000', '0', '200000');

-- ----------------------------
-- Table structure for po_pembelianretur
-- ----------------------------
DROP TABLE IF EXISTS `po_pembelianretur`;
CREATE TABLE `po_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_pembelianretur
-- ----------------------------

-- ----------------------------
-- Table structure for po_pembelianreturdetail
-- ----------------------------
DROP TABLE IF EXISTS `po_pembelianreturdetail`;
CREATE TABLE `po_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_pembelianreturdetail
-- ----------------------------

-- ----------------------------
-- Table structure for po_po
-- ----------------------------
DROP TABLE IF EXISTS `po_po`;
CREATE TABLE `po_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_po
-- ----------------------------
INSERT INTO `po_po` VALUES ('13', 'PO1206150001', 'PR1206150001', '2015-06-12', 'SUP01', 'Tunai', '0', '200000', '0', '200000', 'admin');
INSERT INTO `po_po` VALUES ('14', 'PO1206150002', 'PR1206150002', '2015-06-12', 'SUP01', 'Tunai', '0', '0', '0', '0', 'admin');

-- ----------------------------
-- Table structure for po_podetail
-- ----------------------------
DROP TABLE IF EXISTS `po_podetail`;
CREATE TABLE `po_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_podetail
-- ----------------------------
INSERT INTO `po_podetail` VALUES ('15', 'PO1206150001', '10', '1', '200000', '0', '200000');
INSERT INTO `po_podetail` VALUES ('16', 'PO1206150002', '3', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for po_pr
-- ----------------------------
DROP TABLE IF EXISTS `po_pr`;
CREATE TABLE `po_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `namapr` varchar(512) NOT NULL,
  `departemenpr` varchar(512) NOT NULL,
  `tujuanpr` varchar(512) NOT NULL,
  `kategorianggaran` varchar(5) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_pr
-- ----------------------------
INSERT INTO `po_pr` VALUES ('9', 'PR1206150001', '2015-06-12', 'asd', '5', 'asdasd', '16', 'admin');
INSERT INTO `po_pr` VALUES ('10', 'PR1206150002', '2015-06-12', 'ijkljkl', '10', 'jkljkl', '20', 'admin');

-- ----------------------------
-- Table structure for po_prdetail
-- ----------------------------
DROP TABLE IF EXISTS `po_prdetail`;
CREATE TABLE `po_prdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `spesifikasi` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_prdetail
-- ----------------------------
INSERT INTO `po_prdetail` VALUES ('10', 'PR1206150001', '10', '1', 'yuiyiyi');
INSERT INTO `po_prdetail` VALUES ('11', 'PR1206150002', '3', '1', '');

-- ----------------------------
-- Table structure for po_produk
-- ----------------------------
DROP TABLE IF EXISTS `po_produk`;
CREATE TABLE `po_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_produk
-- ----------------------------
INSERT INTO `po_produk` VALUES ('1', '4', 'KD001', 'KURSI 2', '62', '50000', '0');
INSERT INTO `po_produk` VALUES ('2', '4', 'B01', 'BANGKU', '62', '60000', '0');

-- ----------------------------
-- Table structure for po_situs
-- ----------------------------
DROP TABLE IF EXISTS `po_situs`;
CREATE TABLE `po_situs` (
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
-- Records of po_situs
-- ----------------------------
INSERT INTO `po_situs` VALUES ('1', 'rekysda@gmail.com', 'PO & Pembelian', 'http://localhost/sister/purchaseorder/', 'Purchase Order', 'WebDesign dengan sistem Responsive', 'po,surabaya,indonesia', '5', '50', '5', '4', '3', 'pos', 'Elyon Christian School', 'Surabaya', '1', '1', '12', '1', '2');

-- ----------------------------
-- Table structure for po_supplier
-- ----------------------------
DROP TABLE IF EXISTS `po_supplier`;
CREATE TABLE `po_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of po_supplier
-- ----------------------------
INSERT INTO `po_supplier` VALUES ('1', 'SUP01', 'CV. MEDIA MANDIRI2', 'SURABAYA', 'SURABAYA');

-- ----------------------------
-- Table structure for po_useraura
-- ----------------------------
DROP TABLE IF EXISTS `po_useraura`;
CREATE TABLE `po_useraura` (
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
-- Records of po_useraura
-- ----------------------------
INSERT INTO `po_useraura` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', '1', '2015-05-12 09:15:46', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>');
INSERT INTO `po_useraura` VALUES ('28', 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', '1', '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
