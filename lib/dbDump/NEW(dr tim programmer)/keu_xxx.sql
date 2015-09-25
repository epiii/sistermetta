/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-09-25 07:01:31
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_anggarantahunan
-- ----------------------------
INSERT INTO `keu_anggarantahunan` VALUES ('4', '3', '3300000', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('5', '3', '6500000', '5');

-- ----------------------------
-- Table structure for keu_brg
-- ----------------------------
DROP TABLE IF EXISTS `keu_brg`;
CREATE TABLE `keu_brg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompokbrg` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `satuan` varchar(10) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_brg
-- ----------------------------
INSERT INTO `keu_brg` VALUES ('1', '1', 'ELKO001', 'Macbook pro 15 inch', '14', 'unit', '2014-01-11', '');
INSERT INTO `keu_brg` VALUES ('2', '4', 'KEMTR0001', 'Supra X 125', '3', '', '2014-01-11', '');

-- ----------------------------
-- Table structure for keu_budget
-- ----------------------------
DROP TABLE IF EXISTS `keu_budget`;
CREATE TABLE `keu_budget` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  `departemen` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_budget
-- ----------------------------
INSERT INTO `keu_budget` VALUES ('1', '1', 'Alat Penganggaran', '10000000', '', '1');
INSERT INTO `keu_budget` VALUES ('2', '1', 'anggaran', '2000000', '', '1');
INSERT INTO `keu_budget` VALUES ('3', '1', 'Angaran Lagi', '100000', '', '1');

-- ----------------------------
-- Table structure for keu_detilanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(11) NOT NULL,
  `detilanggaran` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`),
  KEY `detilanggaran` (`detilanggaran`),
  CONSTRAINT `kategorianggaranFK` FOREIGN KEY (`kategorianggaran`) REFERENCES `keu_kategorianggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('3', '13', 'yes', 'asip');

-- ----------------------------
-- Table structure for keu_detilrekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilrekening`;
CREATE TABLE `keu_detilrekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(11) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorirekening` (`kategorirekening`) USING BTREE,
  CONSTRAINT `kategorirekeningFK` FOREIGN KEY (`kategorirekening`) REFERENCES `keu_kategorirekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilrekening
-- ----------------------------
INSERT INTO `keu_detilrekening` VALUES ('1', '1', '111101', 'KAS KECIL ', '');
INSERT INTO `keu_detilrekening` VALUES ('2', '1', '111102', 'KAS SATELIT', '');
INSERT INTO `keu_detilrekening` VALUES ('3', '1', '111103', 'KAS KERTAJAYA', 'ok');
INSERT INTO `keu_detilrekening` VALUES ('4', '1', '111104', 'KAS RUNGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('5', '1', '111199', 'KAS DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('6', '2', '111201', 'BCA AC NO. 5560060001', '');
INSERT INTO `keu_detilrekening` VALUES ('7', '2', '111202', 'BANK EKONOMI AC NO. 3031861275', '');
INSERT INTO `keu_detilrekening` VALUES ('8', '2', '111203', 'BCA AC NO. 4683800000', '');
INSERT INTO `keu_detilrekening` VALUES ('9', '2', '111204', 'DEPOSITO EKONOMI', '');
INSERT INTO `keu_detilrekening` VALUES ('10', '2', '111205', 'BANK MAYAPADA AC NO.201.300.17.000', '');
INSERT INTO `keu_detilrekening` VALUES ('11', '2', '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', '');
INSERT INTO `keu_detilrekening` VALUES ('12', '2', '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', '');
INSERT INTO `keu_detilrekening` VALUES ('13', '2', '111208', 'DEPOSITO PANINBANK', '');
INSERT INTO `keu_detilrekening` VALUES ('14', '2', '111209', 'PANINBANK AC NO.448.50.8888.7', '');
INSERT INTO `keu_detilrekening` VALUES ('15', '2', '111210', 'MANDARI AC NO. 1420088800098', '');
INSERT INTO `keu_detilrekening` VALUES ('16', '2', '111211', 'BANK BCA 8290960101', '');
INSERT INTO `keu_detilrekening` VALUES ('17', '2', '111299', 'BANK DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('18', '3', '111900', 'AYAT SILANG KAS DAN BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('19', '3', '112100', 'TABUNGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', '');
INSERT INTO `keu_detilrekening` VALUES ('21', '3', '112300', 'SURAT-SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening` VALUES ('22', '3', '113100', 'PIUTANG USAHA', '');
INSERT INTO `keu_detilrekening` VALUES ('23', '3', '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('24', '3', '113300', 'PIUTANG CEK/GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening` VALUES ('25', '3', '113400', 'CADANGAN PIUTANG RAGU-RAGU', '');
INSERT INTO `keu_detilrekening` VALUES ('26', '3', '113500', 'PIUTANG DIREKSI', '');
INSERT INTO `keu_detilrekening` VALUES ('27', '3', '113600', 'PIUTANG KARYAWAN', '');
INSERT INTO `keu_detilrekening` VALUES ('28', '3', '113700', 'PIUTANG PIHAK III', '');
INSERT INTO `keu_detilrekening` VALUES ('29', '3', '113999', 'PIUTANG LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('30', '3', '114100', 'UANG MUKA PEMBELIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('31', '3', '114901', 'TANAH', '');
INSERT INTO `keu_detilrekening` VALUES ('32', '3', '114902', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('33', '3', '114903', 'MESIN DAN PERALATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('34', '3', '114904', 'BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('35', '3', '114905', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('36', '3', '114906', 'UANG MUKA PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('37', '3', '114999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('38', '3', '116121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('39', '3', '116122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('40', '3', '116123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('41', '3', '116125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('42', '3', '116126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening` VALUES ('43', '3', '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('44', '3', '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('45', '3', '116201', 'ASURANSI', '');
INSERT INTO `keu_detilrekening` VALUES ('46', '3', '116202', 'SEWA', '');
INSERT INTO `keu_detilrekening` VALUES ('47', '3', '116203', 'BUNGA LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('48', '3', '116204', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('49', '3', '116299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('50', '3', '121000', 'PENYERTAAN DALAM SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening` VALUES ('51', '3', '122000', 'PENYERTAAN DALAM AKTIVA TETAP', '');
INSERT INTO `keu_detilrekening` VALUES ('52', '3', '123000', 'PENYERTAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('53', '3', '141100', 'TANAH KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('54', '3', '141251', 'PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('55', '3', '141252', 'PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('56', '3', '141253', 'PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('57', '3', '141301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('58', '3', '141302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('59', '3', '141303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('60', '3', '141401', 'MESIN-MESIN', '');
INSERT INTO `keu_detilrekening` VALUES ('61', '3', '141451', 'MESIN-MESIN LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('62', '3', '141501', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('63', '3', '141551', 'KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('64', '3', '141601', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('65', '3', '145201', 'AKUM. PENY. BANGUNAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('66', '3', '145202', 'AKUM. PENY. BANGUNAN KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('67', '3', '145203', 'AKUM. PENY. BANGUNAN MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('68', '3', '145251', 'AKUM. PENY. PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('69', '3', '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('70', '3', '145253', 'AKUM. PENY. PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('71', '3', '145301', 'AKUM. PENY. INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('72', '3', '145302', 'AKUM. PENY. INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('73', '3', '145303', 'AKUM. PENY. INSTALASI TELPON', '');
INSERT INTO `keu_detilrekening` VALUES ('74', '3', '145401', 'AKUM. PENY. KENDARAAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('75', '3', '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('76', '3', '145501', 'AKUM. PENY. INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('77', '3', '145502', 'AKUM. PENY. INVENTARIS KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('78', '3', '151000', 'GOODWILL', '');
INSERT INTO `keu_detilrekening` VALUES ('79', '3', '152000', 'HAK PATEN', '');
INSERT INTO `keu_detilrekening` VALUES ('80', '3', '153000', 'LISENSI', '');
INSERT INTO `keu_detilrekening` VALUES ('81', '3', '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('82', '3', '161101', 'BIAYA PENDIRIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('83', '3', '161102', 'GAJI, TUNJANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('84', '3', '161103', 'BIAYA PERJALANAN DINAS', '');
INSERT INTO `keu_detilrekening` VALUES ('85', '3', '161104', 'ALAT TULIS & KEPERLUAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('86', '3', '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('87', '3', '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('88', '3', '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening` VALUES ('89', '3', '161108', 'BENSIN, PARKIR, TOL', '');
INSERT INTO `keu_detilrekening` VALUES ('90', '3', '161109', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('91', '3', '161110', 'BAHAN PENOLONG', '');
INSERT INTO `keu_detilrekening` VALUES ('92', '3', '161111', 'BIAYA IKLAN', '');
INSERT INTO `keu_detilrekening` VALUES ('93', '3', '161112', 'PAJAK-PAJAK', '');
INSERT INTO `keu_detilrekening` VALUES ('94', '3', '161113', 'REKENING LISTRIK, AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('95', '3', '161114', 'BIAYA STNK, BBN, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('96', '3', '161115', 'BUNGA, FEE, PROVISI BANK, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('97', '3', '161116', 'BIAYA PERESMIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('98', '3', '161117', 'BIAYA BAHAN BAKAR', '');
INSERT INTO `keu_detilrekening` VALUES ('99', '3', '161118', 'REPARASI & PEMELIHARAAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('100', '3', '161119', 'TRAINING, SEMINAR, TEST, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('101', '3', '161120', 'BIAYA MAKAN DAN MINUM', '');
INSERT INTO `keu_detilrekening` VALUES ('102', '3', '161121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('103', '3', '161122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('104', '3', '161123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('105', '3', '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('106', '3', '161125', 'REPARASI & PEMELIHARAAN MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('107', '3', '161126', 'REPARASI & PEMELIHARAAN TANKI', '');
INSERT INTO `keu_detilrekening` VALUES ('108', '3', '161127', 'BIAYA PENGURUSAN LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('109', '3', '161128', 'REPARASI & PEMELIHARAAN BOTOL', '');
INSERT INTO `keu_detilrekening` VALUES ('110', '3', '161129', 'BIAYA SEWA GEDUNG', '');
INSERT INTO `keu_detilrekening` VALUES ('111', '3', '161130', 'BIAYA BUNGA LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('112', '3', '161143', 'SELISIH KURS', '');
INSERT INTO `keu_detilrekening` VALUES ('113', '3', '161144', 'BIAYA BUNGA PINJAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('114', '3', '161145', 'IURAN DAN ASURANSI', '');
INSERT INTO `keu_detilrekening` VALUES ('115', '3', '161146', 'BIAYA KEAMANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('116', '3', '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('117', '3', '161151', 'PENDAPATAN JASA GIRO', '');
INSERT INTO `keu_detilrekening` VALUES ('118', '3', '161152', 'PENDAPATAN BUNGA DEPOSITO', '');
INSERT INTO `keu_detilrekening` VALUES ('119', '3', '161153', 'PENDAPATAN BUNGA BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('120', '3', '161154', 'PENDAPATAN BUNGA PIHAK III', '');
INSERT INTO `keu_detilrekening` VALUES ('121', '3', '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('122', '3', '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', '');
INSERT INTO `keu_detilrekening` VALUES ('123', '3', '162100', 'UANG JAMINAN LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('124', '3', '162200', 'UANG JAMINAN TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('125', '3', '163000', 'BIAYA YANG DITANGGUHKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('126', '3', '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', '');
INSERT INTO `keu_detilrekening` VALUES ('127', '3', '165201', 'BANGUNAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('128', '3', '165301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('129', '3', '165302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('130', '3', '165303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('131', '3', '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('132', '3', '169000', 'AKTIVA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('133', '4', '211101', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('134', '4', '211201', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('135', '4', '211501', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('136', '4', '211601', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('137', '4', '212100', 'HUTANG USAHA', '');
INSERT INTO `keu_detilrekening` VALUES ('138', '4', '212200', 'HUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('139', '4', '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening` VALUES ('140', '4', '212901', 'HUTANG PIHAK KETIGA', '');
INSERT INTO `keu_detilrekening` VALUES ('141', '4', '212902', 'HUTANG PERSEDIAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('142', '4', '212903', 'HUTANG KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('143', '4', '212904', 'HUTANG BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('144', '4', '212905', 'HUTANG INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('145', '4', '212906', 'HUTANG VOUCHER', '');
INSERT INTO `keu_detilrekening` VALUES ('146', '4', '212907', 'HUTANG KPD GKA ELYON', '');
INSERT INTO `keu_detilrekening` VALUES ('147', '4', '212999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('148', '4', '213100', 'UANG MUKA PENJUALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('149', '4', '213900', 'UANG MUKA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('150', '4', '214104', 'PPH PASAL 4 AYAT 2', '');
INSERT INTO `keu_detilrekening` VALUES ('151', '4', '214121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('152', '4', '214122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('153', '4', '214123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('154', '4', '214125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('155', '4', '214126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening` VALUES ('156', '4', '214129', 'PPH PASAL 29', '');
INSERT INTO `keu_detilrekening` VALUES ('157', '4', '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('158', '4', '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('159', '4', '214201', 'BUNGA', '');
INSERT INTO `keu_detilrekening` VALUES ('160', '4', '214202', 'SEWA', '');
INSERT INTO `keu_detilrekening` VALUES ('161', '4', '214203', 'GAJI DAN HONOR', '');
INSERT INTO `keu_detilrekening` VALUES ('162', '4', '214204', 'MAKAN DAN LEMBUR', '');
INSERT INTO `keu_detilrekening` VALUES ('163', '4', '214205', 'LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('164', '4', '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', '');
INSERT INTO `keu_detilrekening` VALUES ('165', '4', '214207', 'TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('166', '4', '214208', 'SURAT KABAR/MAJALAH', '');
INSERT INTO `keu_detilrekening` VALUES ('167', '4', '214209', 'KOMISI', '');
INSERT INTO `keu_detilrekening` VALUES ('168', '4', '214210', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('169', '4', '214211', 'PAJAK WAPU/WAJIB PUNGUT', '');
INSERT INTO `keu_detilrekening` VALUES ('170', '4', '214212', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening` VALUES ('171', '4', '214213', 'PREMI DISTRIBUSI', '');
INSERT INTO `keu_detilrekening` VALUES ('172', '4', '214214', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('173', '4', '214299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('174', '4', '215121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('175', '4', '215122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('176', '4', '215123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('177', '4', '215125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('178', '4', '215201', 'PPN KELUARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('179', '4', '215202', 'PPN EKS KEPPRES', '');
INSERT INTO `keu_detilrekening` VALUES ('180', '4', '216101', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('181', '4', '219101', 'HUTANG DEVIDEN', '');
INSERT INTO `keu_detilrekening` VALUES ('182', '4', '219199', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('183', '4', '221101', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('184', '4', '221201', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('185', '4', '22210', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('186', '4', '223000', 'HUTANG PADA PEMEGANG SAHAM', '');
INSERT INTO `keu_detilrekening` VALUES ('187', '4', '230000', 'HUTANG LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('188', '4', '240000', 'HUTANG YG. DISUBORDINASI', '');
INSERT INTO `keu_detilrekening` VALUES ('189', '4', '250000', 'KEWAJIBAN BERSYARAT', '');
INSERT INTO `keu_detilrekening` VALUES ('190', '5', '311101', 'TIDAK TERIKAT', '');
INSERT INTO `keu_detilrekening` VALUES ('191', '5', '312101', 'TEMPORER...........', '');
INSERT INTO `keu_detilrekening` VALUES ('192', '5', '312201', 'PERMANEN......', '');
INSERT INTO `keu_detilrekening` VALUES ('193', '6', '411101', 'DANA DARI DONATUR', '');
INSERT INTO `keu_detilrekening` VALUES ('194', '6', '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening` VALUES ('195', '6', '411103', 'DANA JOINING', '');
INSERT INTO `keu_detilrekening` VALUES ('196', '6', '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening` VALUES ('197', '6', '411105', 'DANA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening` VALUES ('198', '6', '411201', 'SUMBANGAN TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening` VALUES ('199', '6', '411202', 'SUMBANGAN TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening` VALUES ('200', '6', '412101', 'PENJUALAN FORMULIR + PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('201', '6', '412102', 'UANG KEG. EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening` VALUES ('202', '6', '412103', 'UANG PENDAFTARAN ULANG', '');
INSERT INTO `keu_detilrekening` VALUES ('203', '6', '412104', 'UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('204', '6', '412105', 'PENDAPATAN PENJUALAN SERAGAM', '');
INSERT INTO `keu_detilrekening` VALUES ('205', '6', '412106', 'PENDAPATAN PENJUALAN BUKU', '');
INSERT INTO `keu_detilrekening` VALUES ('206', '6', '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', '');
INSERT INTO `keu_detilrekening` VALUES ('207', '6', '412108', 'PENDAPATAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('208', '6', '412109', 'PENDAPATAN LUNCH', '');
INSERT INTO `keu_detilrekening` VALUES ('209', '6', '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('210', '6', '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('211', '6', '412112', 'PENDAPATAN CHECK POINT', '');
INSERT INTO `keu_detilrekening` VALUES ('212', '6', '412113', 'PENDAPATAN UJIAN HSK', '');
INSERT INTO `keu_detilrekening` VALUES ('213', '6', '412114', 'PENDAPATAN DAY CARE', '');
INSERT INTO `keu_detilrekening` VALUES ('214', '6', '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', '');
INSERT INTO `keu_detilrekening` VALUES ('215', '6', '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('216', '6', '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', '');
INSERT INTO `keu_detilrekening` VALUES ('217', '6', '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening` VALUES ('218', '6', '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening` VALUES ('219', '7', '511101', 'GAJI', '');
INSERT INTO `keu_detilrekening` VALUES ('220', '7', '511102', 'HONOR', '');
INSERT INTO `keu_detilrekening` VALUES ('221', '7', '511103', 'LEMBUR', '');
INSERT INTO `keu_detilrekening` VALUES ('222', '7', '511104', 'PESANGON', '');
INSERT INTO `keu_detilrekening` VALUES ('223', '7', '511105', 'UANG MAKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('224', '7', '511106', 'BONUS', '');
INSERT INTO `keu_detilrekening` VALUES ('225', '7', '511107', 'TUNJANGAN HARI RAYA', '');
INSERT INTO `keu_detilrekening` VALUES ('226', '7', '511108', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('227', '7', '511109', 'KESEJAHTERAAN KARYAWAN', '');
INSERT INTO `keu_detilrekening` VALUES ('228', '7', '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', '');
INSERT INTO `keu_detilrekening` VALUES ('229', '7', '511111', 'JAMINAN KEMATIAN ( JKM )', '');
INSERT INTO `keu_detilrekening` VALUES ('230', '7', '511112', 'JAMINAN HARI TUA ( JHT )', '');
INSERT INTO `keu_detilrekening` VALUES ('231', '7', '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', '');
INSERT INTO `keu_detilrekening` VALUES ('232', '7', '511114', 'TUNJANGAN DANA PENSIUN', '');
INSERT INTO `keu_detilrekening` VALUES ('233', '7', '511115', 'TUNJANGAN KESEHATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('234', '7', '511116', 'TUNJANGAN TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('235', '7', '511117', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening` VALUES ('236', '7', '511119', 'PREMI ', '');
INSERT INTO `keu_detilrekening` VALUES ('237', '7', '511199', 'TUNJANGAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('238', '7', '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening` VALUES ('239', '7', '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', '');
INSERT INTO `keu_detilrekening` VALUES ('240', '7', '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('241', '7', '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('242', '7', '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening` VALUES ('243', '7', '512202', 'PENYUSUTAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('244', '7', '512203', 'PENYUSUTAN INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('245', '7', '512204', 'PENYUSUTAN INSTALASI', '');
INSERT INTO `keu_detilrekening` VALUES ('246', '7', '512301', 'TRANSPORTASI ( BENSIN, TIKET )', '');
INSERT INTO `keu_detilrekening` VALUES ('247', '7', '512302', 'MAKANAN & MINUMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('248', '7', '512303', 'PENGINAPAN', '');
INSERT INTO `keu_detilrekening` VALUES ('249', '7', '512304', 'UANG SAKU', '');
INSERT INTO `keu_detilrekening` VALUES ('250', '7', '512399', 'LAIN-LAIN ( PARKIR, TOL )', '');
INSERT INTO `keu_detilrekening` VALUES ('251', '7', '512401', 'SEWA BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('252', '7', '512402', 'SEWA KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('253', '7', '512403', 'SEWA INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('254', '7', '512451', 'ASURANSI BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('255', '7', '512452', 'ASURANSI KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('256', '7', '512453', 'ASURANSI INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('257', '7', '512501', 'TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('258', '7', '512502', 'TELEX', '');
INSERT INTO `keu_detilrekening` VALUES ('259', '7', '512503', 'TELEGRAM', '');
INSERT INTO `keu_detilrekening` VALUES ('260', '7', '512504', 'INTERLOKAL NON TELEPON INTERN', '');
INSERT INTO `keu_detilrekening` VALUES ('261', '7', '512505', 'FACSIMILE', '');
INSERT INTO `keu_detilrekening` VALUES ('262', '7', '512599', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('263', '7', '512601', 'AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('264', '7', '512602', 'LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('265', '7', '512603', 'ALAT-ALAT LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('266', '7', '512701', 'AKUNTAN', '');
INSERT INTO `keu_detilrekening` VALUES ('267', '7', '512702', 'NOTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('268', '7', '512703', 'KONSULTAN', '');
INSERT INTO `keu_detilrekening` VALUES ('269', '7', '512704', 'MANAGEMENT FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('270', '7', '512801', 'ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('271', '7', '512802', 'BUKU CEK / BG', '');
INSERT INTO `keu_detilrekening` VALUES ('272', '7', '512803', 'TRANSFER, KIRIM UANG , INKASO', '');
INSERT INTO `keu_detilrekening` VALUES ('273', '7', '512804', 'PAJAK BUNGA BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('274', '7', '512901', 'BIAYA ADMINISTRASI KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('275', '7', '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('276', '7', '512903', 'BIAYA BUNGA KREDIT BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('277', '7', '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('278', '7', '513102', 'PERANGKO, MATERAI, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening` VALUES ('279', '7', '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', '');
INSERT INTO `keu_detilrekening` VALUES ('280', '7', '513104', 'ALAT - ALAT PENGAJARAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('281', '7', '513105', 'PERLENGKAPAN KELAS', '');
INSERT INTO `keu_detilrekening` VALUES ('282', '7', '513106', 'JASA PEMBELAJARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('283', '7', '513201', 'PERIJINAN', '');
INSERT INTO `keu_detilrekening` VALUES ('284', '7', '513202', 'PAJAK - PAJAK DAERAH,PBB', '');
INSERT INTO `keu_detilrekening` VALUES ('285', '7', '513203', 'STNK', '');
INSERT INTO `keu_detilrekening` VALUES ('286', '7', '513211', 'RETRIBUSI SAMPAH', '');
INSERT INTO `keu_detilrekening` VALUES ('287', '7', '513301', 'SUMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('288', '7', '513302', 'ENTERTAINMENT', '');
INSERT INTO `keu_detilrekening` VALUES ('289', '7', '513303', 'JAMUAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('290', '7', '513401', 'KEAMANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('291', '7', '513501', 'PENDAFTARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('292', '7', '513502', 'IURAN', '');
INSERT INTO `keu_detilrekening` VALUES ('293', '7', '513601', 'BIAYA PENGOBATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('294', '7', '513701', 'MAKANAN DAN MINUMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('295', '7', '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('296', '7', '513703', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening` VALUES ('297', '7', '513704', 'SEWA DISPENSER', '');
INSERT INTO `keu_detilrekening` VALUES ('298', '7', '513705', 'OLAH RAGA DAN KESENIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('299', '7', '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', '');
INSERT INTO `keu_detilrekening` VALUES ('300', '7', '513707', 'BUKU, VCD', '');
INSERT INTO `keu_detilrekening` VALUES ('301', '7', '513708', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('302', '7', '513709', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('303', '7', '513710', 'BIAYA ADVERTENSI ( IKLAN )', '');
INSERT INTO `keu_detilrekening` VALUES ('304', '7', '513711', 'BIAYA STUDY TOUR', '');
INSERT INTO `keu_detilrekening` VALUES ('305', '7', '513712', 'BIAYA PERLOMBAAN & PERAYAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('306', '7', '513713', 'STIKER U/ MURID', '');
INSERT INTO `keu_detilrekening` VALUES ('307', '7', '513714', 'BIAYA TES KESEHATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('308', '7', '513715', 'BIAYA KOMISI PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('309', '7', '513716', 'BIAYA PAMERAN', '');
INSERT INTO `keu_detilrekening` VALUES ('310', '7', '513799', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('311', '7', '513801', 'KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('312', '7', '513802', 'DAPUR', '');
INSERT INTO `keu_detilrekening` VALUES ('313', '7', '513803', 'BIAYA KEBERSIHAN', '');
INSERT INTO `keu_detilrekening` VALUES ('314', '7', '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('315', '7', '513805', 'JASA CLEANING SERVICE', '');
INSERT INTO `keu_detilrekening` VALUES ('316', '7', '513806', '', '');
INSERT INTO `keu_detilrekening` VALUES ('317', '7', '513807', 'BIAYA MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('318', '7', '513901', 'SELAMATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('319', '7', '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('320', '7', '513903', 'DENDA PAJAK', '');
INSERT INTO `keu_detilrekening` VALUES ('321', '7', '513904', 'KOREKSI TAHUN LALU', '');
INSERT INTO `keu_detilrekening` VALUES ('322', '7', '513998', 'LAIN - LAIN (SELISIH KURS)', '');
INSERT INTO `keu_detilrekening` VALUES ('323', '7', '513999', 'LAIN - LAIN (SELISIH KAS)', '');
INSERT INTO `keu_detilrekening` VALUES ('324', '7', '514001', 'TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('325', '7', '514002', 'MAKAN & MINUM (RAPAT)', '');
INSERT INTO `keu_detilrekening` VALUES ('326', '7', '514099', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('327', '7', '514101', 'BUKU', '');
INSERT INTO `keu_detilrekening` VALUES ('328', '7', '514102', 'VCD', '');
INSERT INTO `keu_detilrekening` VALUES ('329', '7', '514103', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening` VALUES ('330', '7', '514104', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('331', '7', '514105', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('332', '7', '514106', 'BIAYA STUDY TOUR/FIELD TRIP', '');
INSERT INTO `keu_detilrekening` VALUES ('333', '7', '514107', 'BIAYA PERLOMBAAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('334', '7', '514108', 'EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening` VALUES ('335', '7', '514109', 'BIAYA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening` VALUES ('336', '7', '514110', 'BIAYA CHECK POINT', '');
INSERT INTO `keu_detilrekening` VALUES ('337', '7', '514199', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('344', '3', '212121', '22222', '242424');
INSERT INTO `keu_detilrekening` VALUES ('351', '3', '212', '', '');

-- ----------------------------
-- Table structure for keu_detjenistrans
-- ----------------------------
DROP TABLE IF EXISTS `keu_detjenistrans`;
CREATE TABLE `keu_detjenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistrans` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `bukti` char(3) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detjenistrans
-- ----------------------------
INSERT INTO `keu_detjenistrans` VALUES ('1', '2', 'SPP', 'in_siswa', 'BKM');
INSERT INTO `keu_detjenistrans` VALUES ('2', '2', 'DPP', 'in_calonsiswa', 'BBM');
INSERT INTO `keu_detjenistrans` VALUES ('3', '2', 'pemasukan bank', 'in_bank', 'BBM');
INSERT INTO `keu_detjenistrans` VALUES ('4', '2', 'pemasukan kas', 'in_come', 'BKM');
INSERT INTO `keu_detjenistrans` VALUES ('5', '3', 'pengeluaran barang', 'out_barang', 'BKK');
INSERT INTO `keu_detjenistrans` VALUES ('6', '3', 'pengeluaran bank', 'out_bank', 'BBK');
INSERT INTO `keu_detjenistrans` VALUES ('7', '3', 'pengeluaran kas', 'out_come', 'BKK');
INSERT INTO `keu_detjenistrans` VALUES ('8', '1', 'junal umum', 'ju', 'MMJ');

-- ----------------------------
-- Table structure for keu_detjenistransnew
-- ----------------------------
DROP TABLE IF EXISTS `keu_detjenistransnew`;
CREATE TABLE `keu_detjenistransnew` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistrans` int(11) NOT NULL,
  `kategori` enum('o','n','') DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `bukti` char(3) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detjenistransnew
-- ----------------------------
INSERT INTO `keu_detjenistransnew` VALUES ('1', '1', '', 'SPP', 'in_siswa', 'BKM');
INSERT INTO `keu_detjenistransnew` VALUES ('2', '2', 'o', 'DPP', 'in_calonsiswa', 'BBM');
INSERT INTO `keu_detjenistransnew` VALUES ('3', '2', 'n', 'pemasukan bank', 'in_bank', 'BBM');
INSERT INTO `keu_detjenistransnew` VALUES ('4', '3', 'o', 'pemasukan kas', 'in_come', 'BKM');
INSERT INTO `keu_detjenistransnew` VALUES ('5', '3', 'n', 'pengeluaran barang', 'out_barang', 'BKK');

-- ----------------------------
-- Table structure for keu_grupbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_grupbrg`;
CREATE TABLE `keu_grupbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_grupbrg
-- ----------------------------
INSERT INTO `keu_grupbrg` VALUES ('1', 'Elektronika', '');
INSERT INTO `keu_grupbrg` VALUES ('2', 'Kendaraan', '');
INSERT INTO `keu_grupbrg` VALUES ('3', 'Alat Tulis', '');

-- ----------------------------
-- Table structure for keu_jenislaporan
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenislaporan`;
CREATE TABLE `keu_jenislaporan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('in','out') NOT NULL DEFAULT 'in',
  `kategori` enum('o','n') NOT NULL DEFAULT 'o',
  `rekening` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenislaporan
-- ----------------------------
INSERT INTO `keu_jenislaporan` VALUES ('7', 'in', 'o', '203');
INSERT INTO `keu_jenislaporan` VALUES ('8', 'in', 'o', '195');
INSERT INTO `keu_jenislaporan` VALUES ('9', 'in', 'o', '210');
INSERT INTO `keu_jenislaporan` VALUES ('10', 'in', 'o', '119');
INSERT INTO `keu_jenislaporan` VALUES ('11', 'in', 'n', '194');
INSERT INTO `keu_jenislaporan` VALUES ('12', 'out', 'o', '219');
INSERT INTO `keu_jenislaporan` VALUES ('13', 'out', 'o', '30');
INSERT INTO `keu_jenislaporan` VALUES ('14', 'out', 'o', '54');

-- ----------------------------
-- Table structure for keu_jenistrans
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenistrans`;
CREATE TABLE `keu_jenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenistrans
-- ----------------------------
INSERT INTO `keu_jenistrans` VALUES ('1', 'jurnal umum', 'ju');
INSERT INTO `keu_jenistrans` VALUES ('2', 'pemasukan', 'in');
INSERT INTO `keu_jenistrans` VALUES ('3', 'pengeluaran', 'out');

-- ----------------------------
-- Table structure for keu_jurnal
-- ----------------------------
DROP TABLE IF EXISTS `keu_jurnal`;
CREATE TABLE `keu_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi` int(10) unsigned NOT NULL,
  `rek` int(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `jenis` char(1) NOT NULL,
  `debet` double(14,0) NOT NULL DEFAULT '0',
  `kredit` double(14,0) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=1235 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jurnal
-- ----------------------------
INSERT INTO `keu_jurnal` VALUES ('1176', '3', '6', '35000', 'k', '0', '0', '2015-05-25 15:56:14');
INSERT INTO `keu_jurnal` VALUES ('1175', '3', '222', '35000', 'd', '0', '0', '2015-05-25 15:56:14');
INSERT INTO `keu_jurnal` VALUES ('1172', '1', '1', '80000', 'd', '0', '0', '2015-05-25 15:47:11');
INSERT INTO `keu_jurnal` VALUES ('1171', '1', '83', '80000', 'k', '0', '0', '2015-05-25 15:47:11');
INSERT INTO `keu_jurnal` VALUES ('1174', '2', '1', '15000', 'k', '0', '0', '2015-05-25 15:47:58');
INSERT INTO `keu_jurnal` VALUES ('1173', '2', '83', '15000', 'd', '0', '0', '2015-05-25 15:47:58');
INSERT INTO `keu_jurnal` VALUES ('1178', '4', '1', '120000', 'd', '0', '0', '2015-05-25 16:00:10');
INSERT INTO `keu_jurnal` VALUES ('1177', '4', '203', '120000', 'k', '0', '0', '2015-05-25 16:00:10');
INSERT INTO `keu_jurnal` VALUES ('1180', '5', '22', '50000', 'k', '0', '0', '2015-05-26 06:08:09');
INSERT INTO `keu_jurnal` VALUES ('1179', '5', '1', '50000', 'd', '0', '0', '2015-05-26 06:08:09');
INSERT INTO `keu_jurnal` VALUES ('1181', '5', '25', '5000', 'k', '0', '0', '2015-05-26 06:08:59');
INSERT INTO `keu_jurnal` VALUES ('1182', '5', '3', '5000', 'd', '0', '0', '2015-05-26 06:09:00');
INSERT INTO `keu_jurnal` VALUES ('1183', '6', '1', '300000', 'd', '0', '0', '2015-05-27 06:22:17');
INSERT INTO `keu_jurnal` VALUES ('1184', '6', '200', '300000', 'k', '0', '0', '2015-05-27 06:22:17');
INSERT INTO `keu_jurnal` VALUES ('1185', '7', '1', '500000', 'd', '0', '0', '2015-05-27 06:30:51');
INSERT INTO `keu_jurnal` VALUES ('1186', '7', '195', '500000', 'k', '0', '0', '2015-05-27 06:30:51');
INSERT INTO `keu_jurnal` VALUES ('1187', '8', '1', '14000000', 'd', '0', '0', '2015-05-30 14:21:25');
INSERT INTO `keu_jurnal` VALUES ('1188', '8', '194', '14000000', 'k', '0', '0', '2015-05-30 14:21:25');
INSERT INTO `keu_jurnal` VALUES ('1189', '9', '1', '4545000', 'd', '0', '0', '2015-06-05 06:47:06');
INSERT INTO `keu_jurnal` VALUES ('1190', '9', '194', '4545000', 'k', '0', '0', '2015-06-05 06:47:06');
INSERT INTO `keu_jurnal` VALUES ('1191', '10', '1', '300000', 'd', '0', '0', '2015-06-05 06:48:44');
INSERT INTO `keu_jurnal` VALUES ('1192', '10', '200', '300000', 'k', '0', '0', '2015-06-05 06:48:44');
INSERT INTO `keu_jurnal` VALUES ('1193', '11', '1', '4522000', 'd', '0', '0', '2015-06-08 19:52:16');
INSERT INTO `keu_jurnal` VALUES ('1194', '11', '194', '4522000', 'k', '0', '0', '2015-06-08 19:52:16');
INSERT INTO `keu_jurnal` VALUES ('1195', '12', '1', '2261000', 'd', '0', '0', '2015-06-08 19:52:24');
INSERT INTO `keu_jurnal` VALUES ('1196', '12', '194', '2261000', 'k', '0', '0', '2015-06-08 19:52:24');
INSERT INTO `keu_jurnal` VALUES ('1197', '13', '1', '4522000', 'd', '0', '0', '2015-06-08 19:52:35');
INSERT INTO `keu_jurnal` VALUES ('1198', '13', '194', '4522000', 'k', '0', '0', '2015-06-08 19:52:35');
INSERT INTO `keu_jurnal` VALUES ('1199', '14', '1', '100000', 'd', '0', '0', '2015-06-08 21:16:48');
INSERT INTO `keu_jurnal` VALUES ('1200', '14', '195', '100000', 'k', '0', '0', '2015-06-08 21:16:48');
INSERT INTO `keu_jurnal` VALUES ('1201', '15', '1', '50000', 'd', '0', '0', '2015-06-08 21:16:56');
INSERT INTO `keu_jurnal` VALUES ('1202', '15', '195', '50000', 'k', '0', '0', '2015-06-08 21:16:56');
INSERT INTO `keu_jurnal` VALUES ('1203', '16', '1', '150000', 'd', '0', '0', '2015-06-08 21:17:27');
INSERT INTO `keu_jurnal` VALUES ('1204', '16', '195', '150000', 'k', '0', '0', '2015-06-08 21:17:27');
INSERT INTO `keu_jurnal` VALUES ('1205', '17', '1', '1515000', 'd', '0', '0', '2015-06-08 22:29:44');
INSERT INTO `keu_jurnal` VALUES ('1206', '17', '194', '1515000', 'k', '0', '0', '2015-06-08 22:29:44');
INSERT INTO `keu_jurnal` VALUES ('1207', '18', '1', '3030000', 'd', '0', '0', '2015-06-08 22:29:57');
INSERT INTO `keu_jurnal` VALUES ('1208', '18', '194', '3030000', 'k', '0', '0', '2015-06-08 22:29:57');
INSERT INTO `keu_jurnal` VALUES ('1216', '22', '3', '5000', 'k', '0', '0', '2015-06-12 14:09:54');
INSERT INTO `keu_jurnal` VALUES ('1215', '22', '277', '5000', 'd', '0', '0', '2015-06-12 14:09:54');
INSERT INTO `keu_jurnal` VALUES ('1214', '21', '3', '50000', 'k', '0', '0', '2015-06-12 14:01:25');
INSERT INTO `keu_jurnal` VALUES ('1213', '21', '277', '50000', 'd', '0', '0', '2015-06-12 14:01:25');
INSERT INTO `keu_jurnal` VALUES ('1217', '23', '277', '20000', 'd', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1218', '23', '1', '20000', 'k', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1219', '24', '277', '90000', 'd', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1220', '24', '1', '90000', 'k', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1221', '25', '277', '80000', 'd', '0', '0', '2015-06-13 08:11:17');
INSERT INTO `keu_jurnal` VALUES ('1222', '25', '2', '80000', 'k', '0', '0', '2015-06-13 08:11:17');
INSERT INTO `keu_jurnal` VALUES ('1223', '26', '277', '80000', 'd', '0', '0', '2015-06-13 11:16:44');
INSERT INTO `keu_jurnal` VALUES ('1224', '26', '16', '80000', 'k', '0', '0', '2015-06-13 11:16:44');
INSERT INTO `keu_jurnal` VALUES ('1225', '27', '1', '75', 'd', '0', '0', '2015-06-14 03:36:03');
INSERT INTO `keu_jurnal` VALUES ('1226', '27', '195', '75', 'k', '0', '0', '2015-06-14 03:36:03');
INSERT INTO `keu_jurnal` VALUES ('1227', '28', '1', '65000', 'd', '0', '0', '2015-06-14 03:37:12');
INSERT INTO `keu_jurnal` VALUES ('1228', '28', '195', '65000', 'k', '0', '0', '2015-06-14 03:37:12');
INSERT INTO `keu_jurnal` VALUES ('1229', '29', '4', '900', 'd', '0', '0', '2015-06-18 13:39:26');
INSERT INTO `keu_jurnal` VALUES ('1230', '29', '5', '900', 'k', '0', '0', '2015-06-18 13:39:26');
INSERT INTO `keu_jurnal` VALUES ('1231', '30', '1', '-2695000', 'd', '0', '0', '2015-07-14 11:30:11');
INSERT INTO `keu_jurnal` VALUES ('1232', '30', '194', '-2695000', 'k', '0', '0', '2015-07-14 11:30:11');
INSERT INTO `keu_jurnal` VALUES ('1233', '31', '1', '-1142857', 'd', '0', '0', '2015-07-14 12:44:44');
INSERT INTO `keu_jurnal` VALUES ('1234', '31', '194', '-1142857', 'k', '0', '0', '2015-07-14 12:44:44');

-- ----------------------------
-- Table structure for keu_kategorianggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE `keu_kategorianggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `departemen` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `detilrekening` int(11) NOT NULL,
  `kategorianggaran` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `tingkat` (`tingkat`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  KEY `departemen` (`departemen`) USING BTREE,
  CONSTRAINT `departemenFK4` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detilrekeningFK` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tingkatFK` FOREIGN KEY (`tingkat`) REFERENCES `aka_tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorianggaran
-- ----------------------------
INSERT INTO `keu_kategorianggaran` VALUES ('13', '1', '1', '2', 'ATK ', 'untuk keperluan alat tulis kantor ');
INSERT INTO `keu_kategorianggaran` VALUES ('14', '1', '1', '4', 'buku ', 'biaya buku pendamping siswa');

-- ----------------------------
-- Table structure for keu_kategorirek
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorirek`;
CREATE TABLE `keu_kategorirek` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirek
-- ----------------------------
INSERT INTO `keu_kategorirek` VALUES ('1', '1', 'KAS');
INSERT INTO `keu_kategorirek` VALUES ('2', '1', 'BANK');
INSERT INTO `keu_kategorirek` VALUES ('3', '1', 'AKTIVA');
INSERT INTO `keu_kategorirek` VALUES ('4', '2', 'KEWAJIBAN');
INSERT INTO `keu_kategorirek` VALUES ('5', '3', 'MODAL');
INSERT INTO `keu_kategorirek` VALUES ('6', '4', 'PENDAPATAN');
INSERT INTO `keu_kategorirek` VALUES ('7', '5', 'BIAYA');

-- ----------------------------
-- Table structure for keu_kategorirekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorirekening`;
CREATE TABLE `keu_kategorirekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  `jenis` enum('d','k') NOT NULL,
  `jenistambah` enum('d','k') NOT NULL,
  `jeniskurang` enum('d','k') NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirekening
-- ----------------------------
INSERT INTO `keu_kategorirekening` VALUES ('1', '1', 'KAS', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('2', '1', 'BANK', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('3', '1', 'AKTIVA', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('4', '2', 'KEWAJIBAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('5', '3', 'MODAL', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('6', '4', 'PENDAPATAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('7', '5', 'BIAYA', 'd', 'd', 'k');

-- ----------------------------
-- Table structure for keu_katmodulpembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_katmodulpembayaran`;
CREATE TABLE `keu_katmodulpembayaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `siswa` enum('aktif','calon') DEFAULT NULL,
  `sifat` enum('wajib','sukarela') DEFAULT NULL,
  `keterangan` text NOT NULL,
  `detjenistrans` int(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_katmodulpembayaran
-- ----------------------------
INSERT INTO `keu_katmodulpembayaran` VALUES ('1', 'SPP', 'aktif', 'wajib', 'sumbangan wajib tiap semester', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('2', 'DPP', 'aktif', 'wajib', 'uang gedung ', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('3', 'Formulir ', 'calon', 'wajib', 'biaya formulir untuk pendaftaran siswa baru ', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('4', 'Joining Fee', 'aktif', 'wajib', 'biaya Joining Fee untuk Pendaftaran Siswa Baru , dibayar di awal masuk\r\n', '1');

-- ----------------------------
-- Table structure for keu_kelompokbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_kelompokbrg`;
CREATE TABLE `keu_kelompokbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grupbrg` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kelompokbrg
-- ----------------------------
INSERT INTO `keu_kelompokbrg` VALUES ('1', '1', 'Komputer');
INSERT INTO `keu_kelompokbrg` VALUES ('2', '1', 'Proyektor');
INSERT INTO `keu_kelompokbrg` VALUES ('3', '2', 'Mobil');
INSERT INTO `keu_kelompokbrg` VALUES ('4', '2', 'Motor');
INSERT INTO `keu_kelompokbrg` VALUES ('5', '2', 'Sepeda');
INSERT INTO `keu_kelompokbrg` VALUES ('6', '3', 'bulpoin');

-- ----------------------------
-- Table structure for keu_modul
-- ----------------------------
DROP TABLE IF EXISTS `keu_modul`;
CREATE TABLE `keu_modul` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_modul
-- ----------------------------
INSERT INTO `keu_modul` VALUES ('2', '3', '2', '2', 'Pendaftaran Tahun Ajaran 2014-2015', '14', '0', '0', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('3', '3', '2', '2', 'Pendaftaran Tahun Ajaran 2014-2015', '6', '194', '0', '0', '0', 'Kaitlynn Tiffany');
INSERT INTO `keu_modul` VALUES ('4', '1', '3', '3', 'Uang pangkal angkatan 2013', '6', '194', '29', '0', '0', 'DPP');
INSERT INTO `keu_modul` VALUES ('5', '1', '1', '1', 'Uang sekolah tahun ajaran 2014-2015 (Aktif)', '1', '203', '29', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('6', '1', '3', '8', 'Uang pangkal angkatan 2016', '3', '4', '3', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('7', '1', '3', '2', 'Uang pangkal angkatan 2014', '1', '1', '1', '0', '0', 'ok');

-- ----------------------------
-- Table structure for keu_modulpembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_modulpembayaran`;
CREATE TABLE `keu_modulpembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katmodulpembayaran` int(11) NOT NULL DEFAULT '0',
  `angkatan` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `diskon` decimal(10,0) NOT NULL DEFAULT '0',
  `biayaadmin` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_modulpembayaran
-- ----------------------------
INSERT INTO `keu_modulpembayaran` VALUES ('31', '2', '4', 'DPP Angkatan 2014', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('27', '2', '1', 'DPP Angkatan 2013', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('39', '4', '2', 'Joining Fee Tahun  Angkatan 2014', '1', '195', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('4', '2', '3', 'DPP angkatan 2013', '6', '194', '29', '0', '0', '0', '0', 'DPP');
INSERT INTO `keu_modulpembayaran` VALUES ('7', '1', '4', 'Uang sekolah tahun ajaran 2013-2014', '4', '8', '8', '0', '0', '0', '0', 'ok');
INSERT INTO `keu_modulpembayaran` VALUES ('32', '3', '4', 'Pendaftaran Tahun Ajaran 2014 - 2015', '4', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('21', '3', '1', 'Pendaftaran Tahun Ajaran 2013 - 2014', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('30', '1', '2', 'SPP Tahun ajaran 2014 - 2015', '1', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('24', '2', '7', 'DPP Angkatan 2015', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('29', '3', '2', 'Pendaftaran Tahun Ajaran 2014 - 2015', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('16', '3', '3', 'Pendaftaran Tahun Ajaran 2014 - 2015 ', '2', '200', '0', '800000', '0', '0', '0', 'uang formulir = 300000\r\nuang joining fee = 500000');
INSERT INTO `keu_modulpembayaran` VALUES ('17', '1', '3', 'SPP Tahun Ajaran 2014 - 2015', '2', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('19', '1', '1', 'SPP Tahun Ajaran 2013 - 2014 ', '2', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('25', '3', '7', 'Pendaftaran Tahun Ajaran 2015 - 2016', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('26', '1', '7', 'SPP Tahun Ajaran 2015 - 2016', '1', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('28', '2', '2', 'DPP Angkatan 2014', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('33', '2', '12', 'DPP Angkatan 2015', '4', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('34', '3', '12', 'Pendaftaran Tahun Ajaran 2015 -2016', '4', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('35', '1', '12', 'SPP Tahun Ajaran 2015 - 2016', '4', '203', '23', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('36', '2', '11', 'DPP Angkatan 2015', '2', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('37', '3', '11', 'Pendaftaran  Tahun Ajaran 2015 - 2016', '3', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('38', '1', '11', 'SPP Tahun Ajaran 2015 -2016', '4', '203', '0', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for keu_nominalanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_nominalanggaran`;
CREATE TABLE `keu_nominalanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `anggarantahunan` int(11) NOT NULL,
  `bulan` int(2) NOT NULL,
  `jml` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `anggarantahunan` (`anggarantahunan`) USING BTREE,
  CONSTRAINT `anggarantahunanFK` FOREIGN KEY (`anggarantahunan`) REFERENCES `keu_anggarantahunan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_nominalanggaran
-- ----------------------------
INSERT INTO `keu_nominalanggaran` VALUES ('1', '4', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('2', '4', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('3', '4', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('4', '4', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('5', '4', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('6', '4', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('7', '4', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('8', '4', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('9', '4', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('10', '4', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('11', '4', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('12', '4', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('13', '5', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('14', '5', '2', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('15', '5', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('16', '5', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('17', '5', '5', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('18', '5', '6', '11');
INSERT INTO `keu_nominalanggaran` VALUES ('19', '5', '7', '15');
INSERT INTO `keu_nominalanggaran` VALUES ('20', '5', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('21', '5', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('22', '5', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('23', '5', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('24', '5', '12', '0');

-- ----------------------------
-- Table structure for keu_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_pembayaran`;
CREATE TABLE `keu_pembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modul` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `lunas` enum('0','1') NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3670 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_pembayaran
-- ----------------------------
INSERT INTO `keu_pembayaran` VALUES ('3653', '29', '7', '0', '300000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3654', '39', '7', '0', '500000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3655', '28', '6', '0', '14000000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3656', '28', '7', '0', '4545000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3657', '29', '6', '0', '300000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3658', '28', '8', '0', '4522000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3659', '28', '8', '0', '2261000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3660', '28', '8', '0', '4522000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3661', '39', '8', '0', '100000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3662', '39', '8', '0', '50000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3663', '39', '8', '0', '150000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3664', '28', '7', '0', '1515000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3665', '28', '7', '0', '3030000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3666', '39', '8', '0', '75', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3667', '39', '8', '0', '65000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3668', '28', '8', '0', '-2695000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3669', '28', '1016', '0', '-1142857', '0', '0000-00-00', '');

-- ----------------------------
-- Table structure for keu_penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `keu_penerimaan`;
CREATE TABLE `keu_penerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_penerimaan
-- ----------------------------

-- ----------------------------
-- Table structure for keu_penerimaanbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_penerimaanbrg`;
CREATE TABLE `keu_penerimaanbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomerbukti` varchar(100) NOT NULL,
  `kodebrg` varchar(50) NOT NULL,
  `namabrg` varchar(100) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `satuan` varchar(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_penerimaanbrg
-- ----------------------------
INSERT INTO `keu_penerimaanbrg` VALUES ('1', 'AAA', 'ELKO001', '', '2', 'unit', '0');
INSERT INTO `keu_penerimaanbrg` VALUES ('2', 'BBB', '101', '', '1', 'unit', '20000');
INSERT INTO `keu_penerimaanbrg` VALUES ('3', 'AA001', 'ELKO001', 'Macbook pro 15 inch', '2', 'unit', '12000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('4', 'BB101', 'KEMTR0001', 'Supra X 125', '1', 'unit', '15000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('5', 'AS989', 'ELKO001', 'Macbook pro 15 inch', '1', 'unit', '12000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('6', 'ASD123', 'KEMTR0001', 'Supra X 125', '1', 'unit', '18000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('7', 'ASDW123', 'ELKO001', 'Macbook pro 15 inch', '1', 'unit', '12000000');

-- ----------------------------
-- Table structure for keu_rekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_rekening`;
CREATE TABLE `keu_rekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirek` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_rekening
-- ----------------------------
INSERT INTO `keu_rekening` VALUES ('1', '1', '111101', 'KAS KECIL ', null, '');
INSERT INTO `keu_rekening` VALUES ('2', '1', '111102', 'KAS SATELIT', null, '');
INSERT INTO `keu_rekening` VALUES ('3', '1', '111103', 'KAS KERTAJAYA', null, '');
INSERT INTO `keu_rekening` VALUES ('4', '1', '111104', 'KAS RUNGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('5', '1', '111199', 'KAS DALAM PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('6', '2', '111201', 'BCA AC NO. 5560060001', null, '');
INSERT INTO `keu_rekening` VALUES ('7', '2', '111202', 'BANK EKONOMI AC NO. 3031861275', null, '');
INSERT INTO `keu_rekening` VALUES ('8', '2', '111203', 'BCA AC NO. 4683800000', null, '');
INSERT INTO `keu_rekening` VALUES ('9', '2', '111204', 'DEPOSITO EKONOMI', null, '');
INSERT INTO `keu_rekening` VALUES ('10', '2', '111205', 'BANK MAYAPADA AC NO.201.300.17.000', null, '');
INSERT INTO `keu_rekening` VALUES ('11', '2', '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', null, '');
INSERT INTO `keu_rekening` VALUES ('12', '2', '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', null, '');
INSERT INTO `keu_rekening` VALUES ('13', '2', '111208', 'DEPOSITO PANINBANK', null, '');
INSERT INTO `keu_rekening` VALUES ('14', '2', '111209', 'PANINBANK AC NO.448.50.8888.7', null, '');
INSERT INTO `keu_rekening` VALUES ('15', '2', '111210', 'MANDARI AC NO. 1420088800098', null, '');
INSERT INTO `keu_rekening` VALUES ('16', '2', '111211', 'BANK BCA 8290960101', null, '');
INSERT INTO `keu_rekening` VALUES ('17', '2', '111299', 'BANK DALAM PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('18', '3', '111900', 'AYAT SILANG KAS DAN BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('19', '3', '112100', 'TABUNGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', null, '');
INSERT INTO `keu_rekening` VALUES ('21', '3', '112300', 'SURAT-SURAT BERHARGA', null, '');
INSERT INTO `keu_rekening` VALUES ('22', '3', '113100', 'PIUTANG USAHA', null, '');
INSERT INTO `keu_rekening` VALUES ('23', '3', '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('24', '3', '113300', 'PIUTANG CEK/GIRO MUNDUR', null, '');
INSERT INTO `keu_rekening` VALUES ('25', '3', '113400', 'CADANGAN PIUTANG RAGU-RAGU', null, '');
INSERT INTO `keu_rekening` VALUES ('26', '3', '113500', 'PIUTANG DIREKSI', null, '');
INSERT INTO `keu_rekening` VALUES ('27', '3', '113600', 'PIUTANG KARYAWAN', null, '');
INSERT INTO `keu_rekening` VALUES ('28', '3', '113700', 'PIUTANG PIHAK III', null, '');
INSERT INTO `keu_rekening` VALUES ('29', '3', '113999', 'PIUTANG LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('30', '3', '114100', 'UANG MUKA PEMBELIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('31', '3', '114901', 'TANAH', null, '');
INSERT INTO `keu_rekening` VALUES ('32', '3', '114902', 'KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('33', '3', '114903', 'MESIN DAN PERALATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('34', '3', '114904', 'BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('35', '3', '114905', 'INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('36', '3', '114906', 'UANG MUKA PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('37', '3', '114999', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('38', '3', '116121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('39', '3', '116122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('40', '3', '116123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('41', '3', '116125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('42', '3', '116126', 'PPH PASAL 26', null, '');
INSERT INTO `keu_rekening` VALUES ('43', '3', '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('44', '3', '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('45', '3', '116201', 'ASURANSI', null, '');
INSERT INTO `keu_rekening` VALUES ('46', '3', '116202', 'SEWA', null, '');
INSERT INTO `keu_rekening` VALUES ('47', '3', '116203', 'BUNGA LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('48', '3', '116204', 'ONGKOS ANGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('49', '3', '116299', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('50', '3', '121000', 'PENYERTAAN DALAM SURAT BERHARGA', null, '');
INSERT INTO `keu_rekening` VALUES ('51', '3', '122000', 'PENYERTAAN DALAM AKTIVA TETAP', null, '');
INSERT INTO `keu_rekening` VALUES ('52', '3', '123000', 'PENYERTAAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('53', '3', '141100', 'TANAH KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('54', '3', '141251', 'PRASARANA JALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('55', '3', '141252', 'PRASARANA SALURAN AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('56', '3', '141253', 'PRASARANA TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('57', '3', '141301', 'INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('58', '3', '141302', 'INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('59', '3', '141303', 'INSTALASI TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('60', '3', '141401', 'MESIN-MESIN', null, '');
INSERT INTO `keu_rekening` VALUES ('61', '3', '141451', 'MESIN-MESIN LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('62', '3', '141501', 'KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('63', '3', '141551', 'KENDARAAN LEASING KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('64', '3', '141601', 'INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('65', '3', '145201', 'AKUM. PENY. BANGUNAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('66', '3', '145202', 'AKUM. PENY. BANGUNAN KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('67', '3', '145203', 'AKUM. PENY. BANGUNAN MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('68', '3', '145251', 'AKUM. PENY. PRASARANA JALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('69', '3', '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('70', '3', '145253', 'AKUM. PENY. PRASARANA TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('71', '3', '145301', 'AKUM. PENY. INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('72', '3', '145302', 'AKUM. PENY. INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('73', '3', '145303', 'AKUM. PENY. INSTALASI TELPON', null, '');
INSERT INTO `keu_rekening` VALUES ('74', '3', '145401', 'AKUM. PENY. KENDARAAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('75', '3', '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('76', '3', '145501', 'AKUM. PENY. INVENTARIS KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('77', '3', '145502', 'AKUM. PENY. INVENTARIS KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('78', '3', '151000', 'GOODWILL', null, '');
INSERT INTO `keu_rekening` VALUES ('79', '3', '152000', 'HAK PATEN', null, '');
INSERT INTO `keu_rekening` VALUES ('80', '3', '153000', 'LISENSI', null, '');
INSERT INTO `keu_rekening` VALUES ('81', '3', '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('82', '3', '161101', 'BIAYA PENDIRIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('83', '3', '161102', 'GAJI, TUNJANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('84', '3', '161103', 'BIAYA PERJALANAN DINAS', null, '');
INSERT INTO `keu_rekening` VALUES ('85', '3', '161104', 'ALAT TULIS & KEPERLUAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('86', '3', '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('87', '3', '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('88', '3', '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', null, '');
INSERT INTO `keu_rekening` VALUES ('89', '3', '161108', 'BENSIN, PARKIR, TOL', null, '');
INSERT INTO `keu_rekening` VALUES ('90', '3', '161109', 'BIAYA ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('91', '3', '161110', 'BAHAN PENOLONG', null, '');
INSERT INTO `keu_rekening` VALUES ('92', '3', '161111', 'BIAYA IKLAN', null, '');
INSERT INTO `keu_rekening` VALUES ('93', '3', '161112', 'PAJAK-PAJAK', null, '');
INSERT INTO `keu_rekening` VALUES ('94', '3', '161113', 'REKENING LISTRIK, AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('95', '3', '161114', 'BIAYA STNK, BBN, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('96', '3', '161115', 'BUNGA, FEE, PROVISI BANK, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('97', '3', '161116', 'BIAYA PERESMIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('98', '3', '161117', 'BIAYA BAHAN BAKAR', null, '');
INSERT INTO `keu_rekening` VALUES ('99', '3', '161118', 'REPARASI & PEMELIHARAAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('100', '3', '161119', 'TRAINING, SEMINAR, TEST, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('101', '3', '161120', 'BIAYA MAKAN DAN MINUM', null, '');
INSERT INTO `keu_rekening` VALUES ('102', '3', '161121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('103', '3', '161122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('104', '3', '161123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('105', '3', '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('106', '3', '161125', 'REPARASI & PEMELIHARAAN MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('107', '3', '161126', 'REPARASI & PEMELIHARAAN TANKI', null, '');
INSERT INTO `keu_rekening` VALUES ('108', '3', '161127', 'BIAYA PENGURUSAN LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('109', '3', '161128', 'REPARASI & PEMELIHARAAN BOTOL', null, '');
INSERT INTO `keu_rekening` VALUES ('110', '3', '161129', 'BIAYA SEWA GEDUNG', null, '');
INSERT INTO `keu_rekening` VALUES ('111', '3', '161130', 'BIAYA BUNGA LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('112', '3', '161143', 'SELISIH KURS', null, '');
INSERT INTO `keu_rekening` VALUES ('113', '3', '161144', 'BIAYA BUNGA PINJAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('114', '3', '161145', 'IURAN DAN ASURANSI', null, '');
INSERT INTO `keu_rekening` VALUES ('115', '3', '161146', 'BIAYA KEAMANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('116', '3', '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('117', '3', '161151', 'PENDAPATAN JASA GIRO', null, '');
INSERT INTO `keu_rekening` VALUES ('118', '3', '161152', 'PENDAPATAN BUNGA DEPOSITO', null, '');
INSERT INTO `keu_rekening` VALUES ('119', '3', '161153', 'PENDAPATAN BUNGA BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('120', '3', '161154', 'PENDAPATAN BUNGA PIHAK III', null, '');
INSERT INTO `keu_rekening` VALUES ('121', '3', '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('122', '3', '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', null, '');
INSERT INTO `keu_rekening` VALUES ('123', '3', '162100', 'UANG JAMINAN LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('124', '3', '162200', 'UANG JAMINAN TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('125', '3', '163000', 'BIAYA YANG DITANGGUHKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('126', '3', '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', null, '');
INSERT INTO `keu_rekening` VALUES ('127', '3', '165201', 'BANGUNAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('128', '3', '165301', 'INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('129', '3', '165302', 'INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('130', '3', '165303', 'INSTALASI TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('131', '3', '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('132', '3', '169000', 'AKTIVA LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('133', '4', '211101', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('134', '4', '211201', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('135', '4', '211501', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('136', '4', '211601', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('137', '4', '212100', 'HUTANG USAHA', null, '');
INSERT INTO `keu_rekening` VALUES ('138', '4', '212200', 'HUTANG YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('139', '4', '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', null, '');
INSERT INTO `keu_rekening` VALUES ('140', '4', '212901', 'HUTANG PIHAK KETIGA', null, '');
INSERT INTO `keu_rekening` VALUES ('141', '4', '212902', 'HUTANG PERSEDIAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('142', '4', '212903', 'HUTANG KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('143', '4', '212904', 'HUTANG BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('144', '4', '212905', 'HUTANG INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('145', '4', '212906', 'HUTANG VOUCHER', null, '');
INSERT INTO `keu_rekening` VALUES ('146', '4', '212907', 'HUTANG KPD GKA ELYON', null, '');
INSERT INTO `keu_rekening` VALUES ('147', '4', '212999', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('148', '4', '213100', 'UANG MUKA PENJUALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('149', '4', '213900', 'UANG MUKA LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('150', '4', '214104', 'PPH PASAL 4 AYAT 2', null, '');
INSERT INTO `keu_rekening` VALUES ('151', '4', '214121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('152', '4', '214122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('153', '4', '214123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('154', '4', '214125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('155', '4', '214126', 'PPH PASAL 26', null, '');
INSERT INTO `keu_rekening` VALUES ('156', '4', '214129', 'PPH PASAL 29', null, '');
INSERT INTO `keu_rekening` VALUES ('157', '4', '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('158', '4', '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('159', '4', '214201', 'BUNGA', null, '');
INSERT INTO `keu_rekening` VALUES ('160', '4', '214202', 'SEWA', null, '');
INSERT INTO `keu_rekening` VALUES ('161', '4', '214203', 'GAJI DAN HONOR', null, '');
INSERT INTO `keu_rekening` VALUES ('162', '4', '214204', 'MAKAN DAN LEMBUR', null, '');
INSERT INTO `keu_rekening` VALUES ('163', '4', '214205', 'LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('164', '4', '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', null, '');
INSERT INTO `keu_rekening` VALUES ('165', '4', '214207', 'TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('166', '4', '214208', 'SURAT KABAR/MAJALAH', null, '');
INSERT INTO `keu_rekening` VALUES ('167', '4', '214209', 'KOMISI', null, '');
INSERT INTO `keu_rekening` VALUES ('168', '4', '214210', 'BIAYA ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('169', '4', '214211', 'PAJAK WAPU/WAJIB PUNGUT', null, '');
INSERT INTO `keu_rekening` VALUES ('170', '4', '214212', 'JAMSOSTEK', null, '');
INSERT INTO `keu_rekening` VALUES ('171', '4', '214213', 'PREMI DISTRIBUSI', null, '');
INSERT INTO `keu_rekening` VALUES ('172', '4', '214214', 'ONGKOS ANGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('173', '4', '214299', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('174', '4', '215121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('175', '4', '215122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('176', '4', '215123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('177', '4', '215125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('178', '4', '215201', 'PPN KELUARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('179', '4', '215202', 'PPN EKS KEPPRES', null, '');
INSERT INTO `keu_rekening` VALUES ('180', '4', '216101', 'HUTANG LEASING KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('181', '4', '219101', 'HUTANG DEVIDEN', null, '');
INSERT INTO `keu_rekening` VALUES ('182', '4', '219199', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('183', '4', '221101', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('184', '4', '221201', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('185', '4', '22210', 'HUTANG LEASING KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('186', '4', '223000', 'HUTANG PADA PEMEGANG SAHAM', null, '');
INSERT INTO `keu_rekening` VALUES ('187', '4', '230000', 'HUTANG LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('188', '4', '240000', 'HUTANG YG. DISUBORDINASI', null, '');
INSERT INTO `keu_rekening` VALUES ('189', '4', '250000', 'KEWAJIBAN BERSYARAT', null, '');
INSERT INTO `keu_rekening` VALUES ('190', '5', '311101', 'TIDAK TERIKAT', null, '');
INSERT INTO `keu_rekening` VALUES ('191', '5', '312101', 'TEMPORER...........', null, '');
INSERT INTO `keu_rekening` VALUES ('192', '5', '312201', 'PERMANEN......', null, '');
INSERT INTO `keu_rekening` VALUES ('193', '6', '411101', 'DANA DARI DONATUR', null, '');
INSERT INTO `keu_rekening` VALUES ('194', '6', '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', null, '');
INSERT INTO `keu_rekening` VALUES ('195', '6', '411103', 'DANA JOINING', null, '');
INSERT INTO `keu_rekening` VALUES ('196', '6', '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', null, '');
INSERT INTO `keu_rekening` VALUES ('197', '6', '411105', 'DANA STUDENT EXCHANGE', null, '');
INSERT INTO `keu_rekening` VALUES ('198', '6', '411201', 'SUMBANGAN TERIKAT TEMPORER', null, '');
INSERT INTO `keu_rekening` VALUES ('199', '6', '411202', 'SUMBANGAN TERIKAT PERMANEN', null, '');
INSERT INTO `keu_rekening` VALUES ('200', '6', '412101', 'PENJUALAN FORMULIR + PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('201', '6', '412102', 'UANG KEG. EKSTRAKURIKULER', null, '');
INSERT INTO `keu_rekening` VALUES ('202', '6', '412103', 'UANG PENDAFTARAN ULANG', null, '');
INSERT INTO `keu_rekening` VALUES ('203', '6', '412104', 'UANG SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('204', '6', '412105', 'PENDAPATAN PENJUALAN SERAGAM', null, '');
INSERT INTO `keu_rekening` VALUES ('205', '6', '412106', 'PENDAPATAN PENJUALAN BUKU', null, '');
INSERT INTO `keu_rekening` VALUES ('206', '6', '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', null, '');
INSERT INTO `keu_rekening` VALUES ('207', '6', '412108', 'PENDAPATAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('208', '6', '412109', 'PENDAPATAN LUNCH', null, '');
INSERT INTO `keu_rekening` VALUES ('209', '6', '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('210', '6', '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('211', '6', '412112', 'PENDAPATAN CHECK POINT', null, '');
INSERT INTO `keu_rekening` VALUES ('212', '6', '412113', 'PENDAPATAN UJIAN HSK', null, '');
INSERT INTO `keu_rekening` VALUES ('213', '6', '412114', 'PENDAPATAN DAY CARE', null, '');
INSERT INTO `keu_rekening` VALUES ('214', '6', '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', null, '');
INSERT INTO `keu_rekening` VALUES ('215', '6', '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('216', '6', '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', null, '');
INSERT INTO `keu_rekening` VALUES ('217', '6', '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', null, '');
INSERT INTO `keu_rekening` VALUES ('218', '6', '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', null, '');
INSERT INTO `keu_rekening` VALUES ('219', '7', '511101', 'GAJI', null, '');
INSERT INTO `keu_rekening` VALUES ('220', '7', '511102', 'HONOR', null, '');
INSERT INTO `keu_rekening` VALUES ('221', '7', '511103', 'LEMBUR', null, '');
INSERT INTO `keu_rekening` VALUES ('222', '7', '511104', 'PESANGON', null, '');
INSERT INTO `keu_rekening` VALUES ('223', '7', '511105', 'UANG MAKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('224', '7', '511106', 'BONUS', null, '');
INSERT INTO `keu_rekening` VALUES ('225', '7', '511107', 'TUNJANGAN HARI RAYA', null, '');
INSERT INTO `keu_rekening` VALUES ('226', '7', '511108', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('227', '7', '511109', 'KESEJAHTERAAN KARYAWAN', null, '');
INSERT INTO `keu_rekening` VALUES ('228', '7', '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', null, '');
INSERT INTO `keu_rekening` VALUES ('229', '7', '511111', 'JAMINAN KEMATIAN ( JKM )', null, '');
INSERT INTO `keu_rekening` VALUES ('230', '7', '511112', 'JAMINAN HARI TUA ( JHT )', null, '');
INSERT INTO `keu_rekening` VALUES ('231', '7', '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', null, '');
INSERT INTO `keu_rekening` VALUES ('232', '7', '511114', 'TUNJANGAN DANA PENSIUN', null, '');
INSERT INTO `keu_rekening` VALUES ('233', '7', '511115', 'TUNJANGAN KESEHATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('234', '7', '511116', 'TUNJANGAN TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('235', '7', '511117', 'JAMSOSTEK', null, '');
INSERT INTO `keu_rekening` VALUES ('236', '7', '511119', 'PREMI ', null, '');
INSERT INTO `keu_rekening` VALUES ('237', '7', '511199', 'TUNJANGAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('238', '7', '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', null, '');
INSERT INTO `keu_rekening` VALUES ('239', '7', '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', null, '');
INSERT INTO `keu_rekening` VALUES ('240', '7', '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('241', '7', '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('242', '7', '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', null, '');
INSERT INTO `keu_rekening` VALUES ('243', '7', '512202', 'PENYUSUTAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('244', '7', '512203', 'PENYUSUTAN INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('245', '7', '512204', 'PENYUSUTAN INSTALASI', null, '');
INSERT INTO `keu_rekening` VALUES ('246', '7', '512301', 'TRANSPORTASI ( BENSIN, TIKET )', null, '');
INSERT INTO `keu_rekening` VALUES ('247', '7', '512302', 'MAKANAN & MINUMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('248', '7', '512303', 'PENGINAPAN', null, '');
INSERT INTO `keu_rekening` VALUES ('249', '7', '512304', 'UANG SAKU', null, '');
INSERT INTO `keu_rekening` VALUES ('250', '7', '512399', 'LAIN-LAIN ( PARKIR, TOL )', null, '');
INSERT INTO `keu_rekening` VALUES ('251', '7', '512401', 'SEWA BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('252', '7', '512402', 'SEWA KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('253', '7', '512403', 'SEWA INVENTARIS KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('254', '7', '512451', 'ASURANSI BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('255', '7', '512452', 'ASURANSI KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('256', '7', '512453', 'ASURANSI INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('257', '7', '512501', 'TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('258', '7', '512502', 'TELEX', null, '');
INSERT INTO `keu_rekening` VALUES ('259', '7', '512503', 'TELEGRAM', null, '');
INSERT INTO `keu_rekening` VALUES ('260', '7', '512504', 'INTERLOKAL NON TELEPON INTERN', null, '');
INSERT INTO `keu_rekening` VALUES ('261', '7', '512505', 'FACSIMILE', null, '');
INSERT INTO `keu_rekening` VALUES ('262', '7', '512599', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('263', '7', '512601', 'AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('264', '7', '512602', 'LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('265', '7', '512603', 'ALAT-ALAT LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('266', '7', '512701', 'AKUNTAN', null, '');
INSERT INTO `keu_rekening` VALUES ('267', '7', '512702', 'NOTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('268', '7', '512703', 'KONSULTAN', null, '');
INSERT INTO `keu_rekening` VALUES ('269', '7', '512704', 'MANAGEMENT FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('270', '7', '512801', 'ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('271', '7', '512802', 'BUKU CEK / BG', null, '');
INSERT INTO `keu_rekening` VALUES ('272', '7', '512803', 'TRANSFER, KIRIM UANG , INKASO', null, '');
INSERT INTO `keu_rekening` VALUES ('273', '7', '512804', 'PAJAK BUNGA BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('274', '7', '512901', 'BIAYA ADMINISTRASI KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('275', '7', '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('276', '7', '512903', 'BIAYA BUNGA KREDIT BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('277', '7', '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('278', '7', '513102', 'PERANGKO, MATERAI, KIRIM SURAT', null, '');
INSERT INTO `keu_rekening` VALUES ('279', '7', '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', null, '');
INSERT INTO `keu_rekening` VALUES ('280', '7', '513104', 'ALAT - ALAT PENGAJARAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('281', '7', '513105', 'PERLENGKAPAN KELAS', null, '');
INSERT INTO `keu_rekening` VALUES ('282', '7', '513106', 'JASA PEMBELAJARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('283', '7', '513201', 'PERIJINAN', null, '');
INSERT INTO `keu_rekening` VALUES ('284', '7', '513202', 'PAJAK - PAJAK DAERAH,PBB', null, '');
INSERT INTO `keu_rekening` VALUES ('285', '7', '513203', 'STNK', null, '');
INSERT INTO `keu_rekening` VALUES ('286', '7', '513211', 'RETRIBUSI SAMPAH', null, '');
INSERT INTO `keu_rekening` VALUES ('287', '7', '513301', 'SUMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('288', '7', '513302', 'ENTERTAINMENT', null, '');
INSERT INTO `keu_rekening` VALUES ('289', '7', '513303', 'JAMUAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('290', '7', '513401', 'KEAMANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('291', '7', '513501', 'PENDAFTARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('292', '7', '513502', 'IURAN', null, '');
INSERT INTO `keu_rekening` VALUES ('293', '7', '513601', 'BIAYA PENGOBATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('294', '7', '513701', 'MAKANAN DAN MINUMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('295', '7', '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('296', '7', '513703', 'SERAGAM ', null, '');
INSERT INTO `keu_rekening` VALUES ('297', '7', '513704', 'SEWA DISPENSER', null, '');
INSERT INTO `keu_rekening` VALUES ('298', '7', '513705', 'OLAH RAGA DAN KESENIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('299', '7', '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', null, '');
INSERT INTO `keu_rekening` VALUES ('300', '7', '513707', 'BUKU, VCD', null, '');
INSERT INTO `keu_rekening` VALUES ('301', '7', '513708', 'ATRIBUT SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('302', '7', '513709', 'BIAYA PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('303', '7', '513710', 'BIAYA ADVERTENSI ( IKLAN )', null, '');
INSERT INTO `keu_rekening` VALUES ('304', '7', '513711', 'BIAYA STUDY TOUR', null, '');
INSERT INTO `keu_rekening` VALUES ('305', '7', '513712', 'BIAYA PERLOMBAAN & PERAYAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('306', '7', '513713', 'STIKER U/ MURID', null, '');
INSERT INTO `keu_rekening` VALUES ('307', '7', '513714', 'BIAYA TES KESEHATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('308', '7', '513715', 'BIAYA KOMISI PENGEMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('309', '7', '513716', 'BIAYA PAMERAN', null, '');
INSERT INTO `keu_rekening` VALUES ('310', '7', '513799', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('311', '7', '513801', 'KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('312', '7', '513802', 'DAPUR', null, '');
INSERT INTO `keu_rekening` VALUES ('313', '7', '513803', 'BIAYA KEBERSIHAN', null, '');
INSERT INTO `keu_rekening` VALUES ('314', '7', '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('315', '7', '513805', 'JASA CLEANING SERVICE', null, '');
INSERT INTO `keu_rekening` VALUES ('316', '7', '513806', '', null, '');
INSERT INTO `keu_rekening` VALUES ('317', '7', '513807', 'BIAYA MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('318', '7', '513901', 'SELAMATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('319', '7', '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('320', '7', '513903', 'DENDA PAJAK', null, '');
INSERT INTO `keu_rekening` VALUES ('321', '7', '513904', 'KOREKSI TAHUN LALU', null, '');
INSERT INTO `keu_rekening` VALUES ('322', '7', '513998', 'LAIN - LAIN (SELISIH KURS)', null, '');
INSERT INTO `keu_rekening` VALUES ('323', '7', '513999', 'LAIN - LAIN (SELISIH KAS)', null, '');
INSERT INTO `keu_rekening` VALUES ('324', '7', '514001', 'TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('325', '7', '514002', 'MAKAN & MINUM (RAPAT)', null, '');
INSERT INTO `keu_rekening` VALUES ('326', '7', '514099', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('327', '7', '514101', 'BUKU', null, '');
INSERT INTO `keu_rekening` VALUES ('328', '7', '514102', 'VCD', null, '');
INSERT INTO `keu_rekening` VALUES ('329', '7', '514103', 'SERAGAM ', null, '');
INSERT INTO `keu_rekening` VALUES ('330', '7', '514104', 'ATRIBUT SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('331', '7', '514105', 'BIAYA PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('332', '7', '514106', 'BIAYA STUDY TOUR/FIELD TRIP', null, '');
INSERT INTO `keu_rekening` VALUES ('333', '7', '514107', 'BIAYA PERLOMBAAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('334', '7', '514108', 'EKSTRAKURIKULER', null, '');
INSERT INTO `keu_rekening` VALUES ('335', '7', '514109', 'BIAYA STUDENT EXCHANGE', null, '');
INSERT INTO `keu_rekening` VALUES ('336', '7', '514110', 'BIAYA CHECK POINT', null, '');
INSERT INTO `keu_rekening` VALUES ('337', '7', '514199', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('340', '1', '111109', 'test rekening dua x', '5500000', 'keterangan tes dua');

-- ----------------------------
-- Table structure for keu_saldorekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_saldorekening`;
CREATE TABLE `keu_saldorekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilrekening` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `nominal2` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE,
  CONSTRAINT `detilrekeningFK1` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK6` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1175 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_saldorekening
-- ----------------------------
INSERT INTO `keu_saldorekening` VALUES ('497', '1', '3', '35000', '35000');
INSERT INTO `keu_saldorekening` VALUES ('498', '1', '5', '89000', '89000');
INSERT INTO `keu_saldorekening` VALUES ('499', '2', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('500', '2', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('501', '3', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('502', '3', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('503', '4', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('504', '4', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('505', '5', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('506', '5', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('507', '6', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('508', '6', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('509', '7', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('510', '7', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('511', '8', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('512', '8', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('513', '9', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('514', '9', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('515', '10', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('516', '10', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('517', '11', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('518', '11', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('519', '12', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('520', '12', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('521', '13', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('522', '13', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('523', '14', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('524', '14', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('525', '15', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('526', '15', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('527', '16', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('528', '16', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('529', '17', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('530', '17', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('531', '18', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('532', '18', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('533', '19', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('534', '19', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('535', '20', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('536', '20', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('537', '21', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('538', '21', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('539', '22', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('540', '22', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('541', '23', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('542', '23', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('543', '24', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('544', '24', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('545', '25', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('546', '25', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('547', '26', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('548', '26', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('549', '27', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('550', '27', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('551', '28', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('552', '28', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('553', '29', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('554', '29', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('555', '30', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('556', '30', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('557', '31', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('558', '31', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('559', '32', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('560', '32', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('561', '33', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('562', '33', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('563', '34', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('564', '34', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('565', '35', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('566', '35', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('567', '36', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('568', '36', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('569', '37', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('570', '37', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('571', '38', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('572', '38', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('573', '39', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('574', '39', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('575', '40', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('576', '40', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('577', '41', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('578', '41', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('579', '42', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('580', '42', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('581', '43', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('582', '43', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('583', '44', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('584', '44', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('585', '45', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('586', '45', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('587', '46', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('588', '46', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('589', '47', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('590', '47', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('591', '48', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('592', '48', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('593', '49', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('594', '49', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('595', '50', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('596', '50', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('597', '51', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('598', '51', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('599', '52', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('600', '52', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('601', '53', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('602', '53', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('603', '54', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('604', '54', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('605', '55', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('606', '55', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('607', '56', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('608', '56', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('609', '57', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('610', '57', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('611', '58', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('612', '58', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('613', '59', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('614', '59', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('615', '60', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('616', '60', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('617', '61', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('618', '61', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('619', '62', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('620', '62', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('621', '63', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('622', '63', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('623', '64', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('624', '64', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('625', '65', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('626', '65', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('627', '66', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('628', '66', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('629', '67', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('630', '67', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('631', '68', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('632', '68', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('633', '69', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('634', '69', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('635', '70', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('636', '70', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('637', '71', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('638', '71', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('639', '72', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('640', '72', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('641', '73', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('642', '73', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('643', '74', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('644', '74', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('645', '75', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('646', '75', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('647', '76', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('648', '76', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('649', '77', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('650', '77', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('651', '78', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('652', '78', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('653', '79', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('654', '79', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('655', '80', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('656', '80', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('657', '81', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('658', '81', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('659', '82', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('660', '82', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('661', '83', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('662', '83', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('663', '84', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('664', '84', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('665', '85', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('666', '85', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('667', '86', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('668', '86', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('669', '87', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('670', '87', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('671', '88', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('672', '88', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('673', '89', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('674', '89', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('675', '90', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('676', '90', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('677', '91', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('678', '91', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('679', '92', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('680', '92', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('681', '93', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('682', '93', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('683', '94', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('684', '94', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('685', '95', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('686', '95', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('687', '96', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('688', '96', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('689', '97', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('690', '97', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('691', '98', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('692', '98', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('693', '99', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('694', '99', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('695', '100', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('696', '100', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('697', '101', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('698', '101', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('699', '102', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('700', '102', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('701', '103', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('702', '103', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('703', '104', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('704', '104', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('705', '105', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('706', '105', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('707', '106', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('708', '106', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('709', '107', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('710', '107', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('711', '108', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('712', '108', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('713', '109', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('714', '109', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('715', '110', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('716', '110', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('717', '111', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('718', '111', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('719', '112', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('720', '112', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('721', '113', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('722', '113', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('723', '114', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('724', '114', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('725', '115', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('726', '115', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('727', '116', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('728', '116', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('729', '117', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('730', '117', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('731', '118', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('732', '118', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('733', '119', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('734', '119', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('735', '120', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('736', '120', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('737', '121', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('738', '121', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('739', '122', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('740', '122', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('741', '123', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('742', '123', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('743', '124', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('744', '124', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('745', '125', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('746', '125', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('747', '126', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('748', '126', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('749', '127', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('750', '127', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('751', '128', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('752', '128', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('753', '129', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('754', '129', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('755', '130', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('756', '130', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('757', '131', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('758', '131', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('759', '132', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('760', '132', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('761', '133', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('762', '133', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('763', '134', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('764', '134', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('765', '135', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('766', '135', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('767', '136', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('768', '136', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('769', '137', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('770', '137', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('771', '138', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('772', '138', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('773', '139', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('774', '139', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('775', '140', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('776', '140', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('777', '141', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('778', '141', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('779', '142', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('780', '142', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('781', '143', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('782', '143', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('783', '144', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('784', '144', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('785', '145', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('786', '145', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('787', '146', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('788', '146', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('789', '147', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('790', '147', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('791', '148', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('792', '148', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('793', '149', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('794', '149', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('795', '150', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('796', '150', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('797', '151', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('798', '151', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('799', '152', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('800', '152', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('801', '153', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('802', '153', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('803', '154', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('804', '154', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('805', '155', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('806', '155', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('807', '156', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('808', '156', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('809', '157', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('810', '157', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('811', '158', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('812', '158', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('813', '159', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('814', '159', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('815', '160', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('816', '160', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('817', '161', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('818', '161', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('819', '162', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('820', '162', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('821', '163', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('822', '163', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('823', '164', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('824', '164', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('825', '165', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('826', '165', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('827', '166', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('828', '166', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('829', '167', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('830', '167', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('831', '168', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('832', '168', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('833', '169', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('834', '169', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('835', '170', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('836', '170', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('837', '171', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('838', '171', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('839', '172', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('840', '172', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('841', '173', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('842', '173', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('843', '174', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('844', '174', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('845', '175', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('846', '175', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('847', '176', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('848', '176', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('849', '177', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('850', '177', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('851', '178', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('852', '178', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('853', '179', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('854', '179', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('855', '180', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('856', '180', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('857', '181', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('858', '181', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('859', '182', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('860', '182', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('861', '183', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('862', '183', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('863', '184', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('864', '184', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('865', '185', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('866', '185', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('867', '186', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('868', '186', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('869', '187', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('870', '187', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('871', '188', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('872', '188', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('873', '189', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('874', '189', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('875', '190', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('876', '190', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('877', '191', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('878', '191', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('879', '192', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('880', '192', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('881', '193', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('882', '193', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('883', '194', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('884', '194', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('885', '195', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('886', '195', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('887', '196', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('888', '196', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('889', '197', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('890', '197', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('891', '198', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('892', '198', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('893', '199', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('894', '199', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('895', '200', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('896', '200', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('897', '201', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('898', '201', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('899', '202', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('900', '202', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('901', '203', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('902', '203', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('903', '204', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('904', '204', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('905', '205', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('906', '205', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('907', '206', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('908', '206', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('909', '207', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('910', '207', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('911', '208', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('912', '208', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('913', '209', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('914', '209', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('915', '210', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('916', '210', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('917', '211', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('918', '211', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('919', '212', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('920', '212', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('921', '213', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('922', '213', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('923', '214', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('924', '214', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('925', '215', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('926', '215', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('927', '216', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('928', '216', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('929', '217', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('930', '217', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('931', '218', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('932', '218', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('933', '219', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('934', '219', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('935', '220', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('936', '220', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('937', '221', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('938', '221', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('939', '222', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('940', '222', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('941', '223', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('942', '223', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('943', '224', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('944', '224', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('945', '225', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('946', '225', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('947', '226', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('948', '226', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('949', '227', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('950', '227', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('951', '228', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('952', '228', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('953', '229', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('954', '229', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('955', '230', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('956', '230', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('957', '231', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('958', '231', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('959', '232', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('960', '232', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('961', '233', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('962', '233', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('963', '234', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('964', '234', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('965', '235', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('966', '235', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('967', '236', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('968', '236', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('969', '237', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('970', '237', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('971', '238', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('972', '238', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('973', '239', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('974', '239', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('975', '240', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('976', '240', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('977', '241', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('978', '241', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('979', '242', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('980', '242', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('981', '243', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('982', '243', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('983', '244', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('984', '244', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('985', '245', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('986', '245', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('987', '246', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('988', '246', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('989', '247', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('990', '247', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('991', '248', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('992', '248', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('993', '249', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('994', '249', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('995', '250', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('996', '250', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('997', '251', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('998', '251', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('999', '252', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1000', '252', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1001', '253', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1002', '253', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1003', '254', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1004', '254', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1005', '255', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1006', '255', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1007', '256', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1008', '256', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1009', '257', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1010', '257', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1011', '258', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1012', '258', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1013', '259', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1014', '259', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1015', '260', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1016', '260', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1017', '261', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1018', '261', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1019', '262', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1020', '262', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1021', '263', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1022', '263', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1023', '264', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1024', '264', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1025', '265', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1026', '265', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1027', '266', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1028', '266', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1029', '267', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1030', '267', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1031', '268', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1032', '268', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1033', '269', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1034', '269', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1035', '270', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1036', '270', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1037', '271', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1038', '271', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1039', '272', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1040', '272', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1041', '273', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1042', '273', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1043', '274', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1044', '274', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1045', '275', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1046', '275', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1047', '276', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1048', '276', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1049', '277', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1050', '277', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1051', '278', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1052', '278', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1053', '279', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1054', '279', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1055', '280', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1056', '280', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1057', '281', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1058', '281', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1059', '282', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1060', '282', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1061', '283', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1062', '283', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1063', '284', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1064', '284', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1065', '285', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1066', '285', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1067', '286', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1068', '286', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1069', '287', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1070', '287', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1071', '288', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1072', '288', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1073', '289', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1074', '289', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1075', '290', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1076', '290', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1077', '291', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1078', '291', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1079', '292', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1080', '292', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1081', '293', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1082', '293', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1083', '294', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1084', '294', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1085', '295', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1086', '295', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1087', '296', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1088', '296', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1089', '297', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1090', '297', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1091', '298', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1092', '298', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1093', '299', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1094', '299', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1095', '300', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1096', '300', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1097', '301', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1098', '301', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1099', '302', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1100', '302', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1101', '303', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1102', '303', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1103', '304', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1104', '304', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1105', '305', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1106', '305', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1107', '306', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1108', '306', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1109', '307', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1110', '307', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1111', '308', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1112', '308', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1113', '309', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1114', '309', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1115', '310', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1116', '310', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1117', '311', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1118', '311', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1119', '312', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1120', '312', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1121', '313', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1122', '313', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1123', '314', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1124', '314', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1125', '315', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1126', '315', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1127', '316', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1128', '316', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1129', '317', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1130', '317', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1131', '318', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1132', '318', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1133', '319', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1134', '319', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1135', '320', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1136', '320', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1137', '321', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1138', '321', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1139', '322', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1140', '322', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1141', '323', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1142', '323', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1143', '324', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1144', '324', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1145', '325', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1146', '325', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1147', '326', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1148', '326', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1149', '327', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1150', '327', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1151', '328', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1152', '328', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1153', '329', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1154', '329', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1155', '330', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1156', '330', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1157', '331', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1158', '331', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1159', '332', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1160', '332', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1161', '333', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1162', '333', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1163', '334', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1164', '334', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1165', '335', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1166', '335', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1167', '336', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1168', '336', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1169', '337', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1170', '337', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1171', '344', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1172', '344', '5', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1173', '351', '3', '0', '0');
INSERT INTO `keu_saldorekening` VALUES ('1174', '351', '5', '0', '0');

-- ----------------------------
-- Table structure for keu_tahunbuku
-- ----------------------------
DROP TABLE IF EXISTS `keu_tahunbuku`;
CREATE TABLE `keu_tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `kode` varchar(20) NOT NULL,
  `saldoawal` decimal(10,0) NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_tahunbuku
-- ----------------------------
INSERT INTO `keu_tahunbuku` VALUES ('1', '2014', '2015-01-01', '0000-00-00', '', '649100', '1', 'Kas Satelit');
INSERT INTO `keu_tahunbuku` VALUES ('5', '2015', '2014-10-23', '0000-00-00', '', '0', '0', 'tes');

-- ----------------------------
-- Table structure for keu_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_transaksi`;
CREATE TABLE `keu_transaksi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL DEFAULT '0',
  `nomer` varchar(50) NOT NULL,
  `nobukti` varchar(50) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `rekkas` int(10) unsigned NOT NULL DEFAULT '0',
  `rekitem` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `uraian` varchar(250) NOT NULL,
  `modul` int(10) unsigned NOT NULL DEFAULT '0',
  `kategori` int(10) unsigned NOT NULL DEFAULT '0',
  `pembayaran` int(10) unsigned NOT NULL DEFAULT '0',
  `penerimaanbrg` int(10) unsigned NOT NULL DEFAULT '0',
  `jenis` tinyint(4) NOT NULL DEFAULT '0',
  `budget` int(10) unsigned NOT NULL DEFAULT '0',
  `ct` int(10) unsigned NOT NULL DEFAULT '0',
  `detjenistrans` int(10) NOT NULL,
  `anggarantahunan` int(10) NOT NULL,
  `isPO` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_transaksi
-- ----------------------------
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
DROP TRIGGER IF EXISTS `ins_keu_detilanggaran`;
DELIMITER ;;
CREATE TRIGGER `ins_keu_detilanggaran` AFTER INSERT ON `keu_detilanggaran` FOR EACH ROW BEGIN

/* tahun ajaran ---------------------------------------------------------------*/
BLOCK1: begin
		declare vTahunajaran int;
		declare rowsHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for  
				SELECT replid FROM aka_tahunajaran ;
		declare continue handler for not found set rowsHabis1 =1;
		open cursor1;
		LOOP1: loop
						fetch cursor1
						into  vTahunajaran;
						if rowsHabis1 then  close cursor1; leave LOOP1;
						end if;
						/*insert saldo rekening ---------------------------------------------------------------*/
						INSERT INTO keu_anggarantahunan SET 
								detilanggaran = NEW.replid, 
								tahunajaran = vTahunajaran;
				end loop LOOP1;
		end BLOCK1;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_keu_detilrekening`;
DELIMITER ;;
CREATE TRIGGER `ins_keu_detilrekening` AFTER INSERT ON `keu_detilrekening` FOR EACH ROW BEGIN

/* tahun ajaran ---------------------------------------------------------------*/
BLOCK1: begin
		declare vTahunajaran int;
		declare rowsHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for  
				SELECT replid FROM aka_tahunajaran ;
		declare continue handler for not found set rowsHabis1 =1;
		open cursor1;
		LOOP1: loop
						fetch cursor1
						into  vTahunajaran;
						if rowsHabis1 then  close cursor1; leave LOOP1;
						end if;
						/*insert saldo rekening ---------------------------------------------------------------*/
						INSERT INTO keu_saldorekening SET 
								detilrekening  = NEW.replid, 
								tahunajaran = vTahunajaran;
				end loop LOOP1;
		end BLOCK1;
END
;;
DELIMITER ;
