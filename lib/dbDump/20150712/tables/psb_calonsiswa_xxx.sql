/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-12 22:17:47
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_calonsiswa
-- ----------------------------
INSERT INTO `psb_calonsiswa` VALUES ('25', '000001', null, 'kk', '', '', '0', '0', null, '1', '0', '', '4', '1', '2', '0', '4', '0', '0', 'L', 'popopo', '2015-07-15', null, '0', '0', null, '0.0', '0.0', '-', '1_2cb2255866.jpeg', '', null, '', null, null, '', '', null, null, null, null, '0', '0', '1', '38', '0', '', '', '0', '4');
INSERT INTO `psb_calonsiswa` VALUES ('28', '000004', null, 'Darren Evan Tin', '11', '11111', '0', '0', null, '1', '0', '', '1', '4', '3', '0', '0', '1', '0', 'L', '', '0000-00-00', null, '0', '0', null, '0.0', '0.0', '-', null, '', null, '', null, null, '', '', null, null, null, null, '0', '0', '0', '12', '0', '', '', '0', '1');
INSERT INTO `psb_calonsiswa` VALUES ('29', '000005', null, 'Megan Davis Zheng', '22', '22222', '0', '0', null, '1', '0', '', '1', '4', '3', '0', '2', '1', '0', 'P', '', '0000-00-00', null, '0', '0', null, '0.0', '0.0', '-', null, '', null, '081330900123', null, null, '', '', null, null, null, null, '0', '0', '0', '12', '0', '', '', '0', '1');
INSERT INTO `psb_calonsiswa` VALUES ('30', '000006', null, 'Justin Ong', '0', '0', '0', '0', null, '1', '0', '', '1', '4', '3', '0', '2', '0', '0', 'L', '', '0000-00-00', null, '0', '0', null, '0.0', '0.0', '-', null, '', null, '081 23256838', null, null, '', '', null, null, null, null, '0', '0', '0', '12', '0', '', '', '0', '1');
INSERT INTO `psb_calonsiswa` VALUES ('31', '000007', null, 'Jordyn Edward Motanto', '', '', '0', '0', null, '1', '0', '', '1', '4', '3', '0', '0', '0', '0', 'L', '', '0000-00-00', null, '0', '0', null, '0.0', '0.0', '-', null, '', null, '081 8307043', null, null, '', '', null, null, null, null, '0', '0', '0', '12', '0', '', '', '0', '1');
INSERT INTO `psb_calonsiswa` VALUES ('32', '000008', null, 'Lunabelle Veloxia Taslim', '55', '55555', '0', '0', null, '1', '0', '', '1', '4', '3', '0', '0', '1', '0', 'P', '', '0000-00-00', null, '0', '0', null, '0.0', '0.0', '-', null, '', null, '081 331685888', null, null, '', '', null, null, null, null, '0', '0', '0', '12', '0', '', '', '0', '1');
INSERT INTO `psb_calonsiswa` VALUES ('33', '000009', null, 'epi', '99', '99999', '0', '0', null, '1', '0', '', '1', '1', '3', '0', '0', '1', '0', 'L', 'sby', '2015-07-24', null, '0', '0', null, '0.0', '0.0', '-', null, '', null, '', null, null, '', '', null, null, null, null, '0', '0', '0', '15', '0', '', '', '0', '3');

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_ayah
-- ----------------------------
INSERT INTO `psb_calonsiswa_ayah` VALUES ('24', '25', '', '', '2015-07-09', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('25', '26', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('26', '27', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('27', '28', 'Huinto Tin', '', '0000-00-00', '0', '', '', '', '0', '081 75175117', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('28', '29', 'David Teguh Budainto', '', '0000-00-00', '0', '', '', '', '0', '0315340522', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('29', '30', 'Irwanto', '', '0000-00-00', '0', '', '', '', '0', '031. 7318473', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('30', '31', 'Rendy Motanto', '', '0000-00-00', '0', '', '', '', '0', '031. 77556589', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('31', '32', 'Triady Taslim', '', '0000-00-00', '0', '', '', '', '0', '031. 77120122', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('32', '33', '', '', '2015-07-16', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ayah` VALUES ('33', '34', '', '', '2015-07-09', '0', '', '', '', '0', '', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_ibu
-- ----------------------------
INSERT INTO `psb_calonsiswa_ibu` VALUES ('24', '25', '', '', '2015-07-10', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('25', '26', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('26', '27', '', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('27', '28', 'Helen Novalisa Ukorawung', '', '0000-00-00', '0', '', '', '', '0', '03170129088', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('28', '29', 'Stephanie', '', '0000-00-00', '0', '', '', '', '0', '03131250123', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('29', '30', 'Lince R Wijaya', '', '0000-00-00', '0', '', '', '', '0', '031. 7318473', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('30', '31', 'Silvia Kuncoro', '', '0000-00-00', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('31', '32', 'Mia Hapsari', '', '0000-00-00', '0', '', '', '', '0', '031. 70218682', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('32', '33', '', '', '2015-07-02', '0', '', '', '', '0', '', '', '');
INSERT INTO `psb_calonsiswa_ibu` VALUES ('33', '34', '', '', '2015-07-10', '0', '', '', '', '0', '', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_keluarga
-- ----------------------------
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('24', '25', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('25', '26', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('26', '27', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('27', '28', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('28', '29', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('29', '30', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('30', '31', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('31', '32', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('32', '33', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `psb_calonsiswa_keluarga` VALUES ('33', '34', '', '0000-00-00', '', '0000-00-00', '0000-00-00');

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_kontakdarurat
-- ----------------------------
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('24', '25', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('25', '26', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('26', '27', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('27', '28', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('28', '29', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('29', '30', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('30', '31', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('31', '32', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('32', '33', '', '', '');
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES ('33', '34', '', '', '');

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
