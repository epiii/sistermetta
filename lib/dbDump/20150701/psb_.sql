/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermeta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-01 05:07:54
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
-- Table structure for psb_calonsiswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa`;
CREATE TABLE `psb_calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL DEFAULT '',
  `nisn` varchar(100) NOT NULL DEFAULT '',
  `kelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsiswa` int(10) unsigned NOT NULL DEFAULT '0',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `sekolahasal` varchar(100) NOT NULL,
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `kriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `golongan` int(10) unsigned NOT NULL DEFAULT '0',
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `kondisi` int(10) unsigned NOT NULL DEFAULT '0',
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `photo` longtext,
  `alamat` varchar(255) DEFAULT NULL,
  `kodepos` varchar(8) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `pinbb` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(300) DEFAULT NULL,
  `ketkesehatan` varchar(300) NOT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `diterimadikelas` varchar(25) DEFAULT NULL,
  `ijazah` varchar(55) DEFAULT NULL,
  `keterangan` text,
  `discsubsidi` decimal(10,0) DEFAULT '0',
  `discsaudara` decimal(10,0) DEFAULT '0',
  `disctunai` decimal(10,0) DEFAULT '0',
  `setbiaya` int(10) NOT NULL DEFAULT '0',
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `namabank` varchar(50) NOT NULL DEFAULT '',
  `rekening` varchar(50) NOT NULL DEFAULT '',
  `grup` int(10) unsigned NOT NULL DEFAULT '0',
  `angsuran` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`kelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_calonsiswa
-- ----------------------------
INSERT INTO `psb_calonsiswa` VALUES ('25', '000003', null, 'valentina dijah yellow', '', '', '0', '0', null, '1', '0', '', '2', '1', '1', '0', '0', '0', '0', 'L', 'medan', '2015-07-03', null, '0', '0', null, '0.0', '0.0', '-', '1_67614e26e8.jpeg', 'jl.panjang', null, '', null, null, '', '', null, null, null, null, '200000', '0', '0', '1', '0', '', '', '0', '1');

-- ----------------------------
-- Table structure for psb_calonsiswa_ayah
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_ayah`;
CREATE TABLE `psb_calonsiswa_ayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_ayah
-- ----------------------------
INSERT INTO `psb_calonsiswa_ayah` VALUES ('24', '25', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('25', '26', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('26', '27', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');

-- ----------------------------
-- Table structure for psb_calonsiswa_ibu
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_ibu`;
CREATE TABLE `psb_calonsiswa_ibu` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_ibu
-- ----------------------------
INSERT INTO `psb_calonsiswa_ibu` VALUES ('24', '25', '', '', '2015-07-02', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('25', '26', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('26', '27', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');

-- ----------------------------
-- Table structure for psb_calonsiswa_keluarga
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_keluarga`;
CREATE TABLE `psb_calonsiswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `kakek_nama` varchar(100) NOT NULL DEFAULT '',
  `kakek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `nenek_nama` varchar(100) NOT NULL DEFAULT '',
  `nenek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_keluarga
-- ----------------------------
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('24', '25', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('25', '26', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('26', '27', '', '0000-00-00', '', '0000-00-00', '0000-00-00');

-- ----------------------------
-- Table structure for psb_calonsiswa_kontakdarurat
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_kontakdarurat`;
CREATE TABLE `psb_calonsiswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_kontakdarurat
-- ----------------------------
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('24', '25', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('25', '26', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('26', '27', '', '', '');

-- ----------------------------
-- Table structure for psb_calonsiswa_saudara
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_saudara`;
CREATE TABLE `psb_calonsiswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `idsaudara` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_saudara
-- ----------------------------

-- ----------------------------
-- Table structure for psb_calonsiswa_syarat
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_syarat`;
CREATE TABLE `psb_calonsiswa_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `syarat` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_syarat
-- ----------------------------

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
-- Table structure for psb_golongan
-- ----------------------------
DROP TABLE IF EXISTS `psb_golongan`;
CREATE TABLE `psb_golongan` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned DEFAULT '1',
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_golongan
-- ----------------------------
INSERT INTO `psb_golongan` VALUES ('1', 'Anak Guru &amp; Staf', 'Anak Guru &amp; Staf', '1');
INSERT INTO `psb_golongan` VALUES ('2', 'Jalur Prestasi', 'Akademik, sports, musik', '1');
INSERT INTO `psb_golongan` VALUES ('3', 'Umum', 'Masyarakat umum', '1');

-- ----------------------------
-- Table structure for psb_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `psb_kelompok`;
CREATE TABLE `psb_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`proses`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_kelompok
-- ----------------------------
INSERT INTO `psb_kelompok` VALUES ('1', 'Gelombang 1', '1', '2015-06-01', '2014-10-31', 'oke ', '2015-06-04 08:42:44');
INSERT INTO `psb_kelompok` VALUES ('2', 'Gelombang 2', '1', '2014-11-01', '2015-02-28', 'gel kedua', '2015-06-04 08:43:24');
INSERT INTO `psb_kelompok` VALUES ('3', 'Gelombang 3', '1', '2015-03-01', '2015-06-30', '', '2015-06-04 08:44:10');
INSERT INTO `psb_kelompok` VALUES ('4', 'Gelombang 1', '2', '2014-06-10', '2015-06-01', '', '2015-06-30 05:59:49');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_kriteria
-- ----------------------------
INSERT INTO `psb_kriteria` VALUES ('1', 'Toddler', 'Usia 1 - 3 Tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('2', 'Playgroup', 'Usia 3 Tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('3', 'Kindergarten', 'Usia 5 Tahun', '1');
INSERT INTO `psb_kriteria` VALUES ('4', 'Primary', 'Usia 6 Tahun', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_proses
-- ----------------------------
INSERT INTO `psb_proses` VALUES ('1', 'Tahun Ajaran 2015-2016', 'PMB2015', '1', '0000-00-00', '0000-00-00', '100', '1', '1', '', '2015-06-04 08:40:57', null);
INSERT INTO `psb_proses` VALUES ('2', 'Tahun Ajaran 2014-2015', 'PMB2014', '17', '0000-00-00', '0000-00-00', '9000', '1', '0', 'ok', '2015-06-30 05:54:50', null);

-- ----------------------------
-- Table structure for psb_setbiaya
-- ----------------------------
DROP TABLE IF EXISTS `psb_setbiaya`;
CREATE TABLE `psb_setbiaya` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuition` decimal(10,0) NOT NULL DEFAULT '0',
  `registration` decimal(10,0) NOT NULL DEFAULT '0',
  `material` decimal(10,0) NOT NULL,
  `krit` int(10) unsigned NOT NULL DEFAULT '0',
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
INSERT INTO `psb_setbiaya` VALUES ('10', '0', '0', '0', '4', '1', '1');
INSERT INTO `psb_setbiaya` VALUES ('11', '0', '0', '0', '4', '2', '1');
INSERT INTO `psb_setbiaya` VALUES ('12', '0', '0', '0', '4', '3', '1');
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_tmp_saudara
-- ----------------------------
