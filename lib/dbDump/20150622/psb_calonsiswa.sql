/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermeta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-23 05:37:09
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
  `proses` int(10) unsigned NOT NULL DEFAULT '0',
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
  `photo` blob NOT NULL,
  `photo2` longtext,
  `alamat` varchar(255) DEFAULT NULL,
  `kodepos` varchar(8) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `pinbb` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(300) DEFAULT NULL,
  `ketkesehatan` varchar(300) NOT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `diterimadikelas` varchar(25) DEFAULT NULL,
  `ijazah` varchar(55) DEFAULT NULL,
  `keterangan` text,
  `sumpokok` decimal(10,0) DEFAULT '0',
  `sumnet` decimal(10,0) NOT NULL DEFAULT '0',
  `joiningf` double(10,0) DEFAULT NULL,
  `disctb` decimal(10,0) DEFAULT '0',
  `discsaudara` decimal(10,0) DEFAULT '0',
  `disctunai` decimal(10,0) DEFAULT '0',
  `disctotal` decimal(10,0) NOT NULL DEFAULT '0',
  `denda` decimal(10,0) DEFAULT '0',
  `angsuran` decimal(10,0) NOT NULL DEFAULT '0',
  `jmlangsur` int(10) unsigned NOT NULL DEFAULT '1',
  `sppbulan` decimal(10,0) NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `bayar` enum('1','0') NOT NULL DEFAULT '0',
  `setbiaya` int(10) NOT NULL DEFAULT '0',
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `namabank` varchar(50) NOT NULL DEFAULT '',
  `rekening` varchar(50) NOT NULL DEFAULT '',
  `grup` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_prosespenerimaansiswa` (`proses`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`kelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_asalsekolah` (`asalsekolah`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_calonsiswa
-- ----------------------------
INSERT INTO `psb_calonsiswa` VALUES ('1', 'PMB20150001', null, 'Aurelia Prasetyo', '123', '123', '0', '0', null, '1', '1', '', '1', '3', '3', '3', '0', '0', '1', '0', 'P', '', '2014-10-23', null, '0', '0', null, '0.0', '0.0', '-', '', null, '', null, '', null, null, '', '', null, null, null, null, null, '5000000', '5000000', null, '0', '0', '0', '0', '0', '0', '0', '200000', '0.00', '0.00', '0.00', '0', '0', '1', '', '', '0');
INSERT INTO `psb_calonsiswa` VALUES ('2', 'PMB20150002', null, 'Justine Javier Yulieanto', '124', '124', '0', '0', null, '1', '1', '', '1', '3', '3', '3', '0', '0', '1', '0', 'L', '', '2014-10-23', null, '0', '0', null, '0.0', '0.0', '-', '', null, '', null, '', null, null, '', '', null, null, null, null, null, '5000000', '5000000', null, '0', '0', '0', '0', '0', '0', '0', '200000', '0.00', '0.00', '0.00', '0', '0', '1', '', '', '0');
INSERT INTO `psb_calonsiswa` VALUES ('3', 'PMB20150003', null, 'Andhika M Wibowo', '', '', '0', '0', null, '1', '1', '', '1', '3', '3', '3', '0', '0', '0', '0', 'L', '', '2014-10-23', null, '0', '0', null, '0.0', '0.0', '-', '', null, '', null, '', null, null, '', '', null, null, null, null, null, '5000000', '5000000', null, '0', '0', '0', '0', '0', '0', '0', '200000', '0.00', '0.00', '0.00', '0', '0', '0', '', '', '0');
INSERT INTO `psb_calonsiswa` VALUES ('4', 'PMB20150004', null, 'Nicholas Jaden Husein', '', '', '0', '0', null, '1', '1', '', '1', '3', '3', '3', '0', '0', '0', '0', 'L', '', '2014-10-23', null, '0', '0', null, '0.0', '0.0', '-', '', null, '', null, '', null, null, '', '', null, null, null, null, null, '5000000', '5000000', null, '0', '0', '0', '0', '0', '0', '0', '200000', '0.00', '0.00', '0.00', '0', '0', '0', '', '', '0');
INSERT INTO `psb_calonsiswa` VALUES ('5', 'PMB20150005', null, 'Griselda Cordelia Tanesha', '', '', '0', '0', null, '1', '1', '', '1', '3', '3', '3', '0', '0', '0', '0', 'P', '', '2014-10-23', null, '0', '0', null, '0.0', '0.0', '-', '', null, '', null, '', null, null, '', '', null, null, null, null, null, '5000000', '5000000', null, '0', '0', '0', '0', '0', '0', '0', '200000', '0.00', '0.00', '0.00', '0', '0', '0', '', '', '0');
