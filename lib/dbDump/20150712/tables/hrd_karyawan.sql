/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-12 00:35:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hrd_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_karyawan`;
CREATE TABLE `hrd_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(15) NOT NULL DEFAULT '',
  `nuptk` varchar(512) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `kotalahir` varchar(255) NOT NULL,
  `tgllahir` date NOT NULL,
  `kelamin` varchar(15) NOT NULL DEFAULT '',
  `agama` varchar(20) NOT NULL DEFAULT '',
  `menikah` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL DEFAULT '',
  `kota` varchar(100) NOT NULL DEFAULT '',
  `kodepos` varchar(255) NOT NULL,
  `propinsi` varchar(100) NOT NULL DEFAULT '',
  `negara` varchar(100) NOT NULL DEFAULT '',
  `telepon` varchar(15) NOT NULL DEFAULT '-',
  `handphone` varchar(15) NOT NULL DEFAULT '-',
  `foto` text NOT NULL,
  `departemen` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `jabatanlain` varchar(512) NOT NULL,
  `status` varchar(255) NOT NULL,
  `pendidikan_terakhir` varchar(255) NOT NULL,
  `tglditerima` date NOT NULL,
  `tglpercobaan` date NOT NULL,
  `tglkontrak` date NOT NULL,
  `jatahcuti` int(2) NOT NULL DEFAULT '0',
  `norek` varchar(50) NOT NULL,
  `namarek` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `tipe` enum('0','1','2') NOT NULL DEFAULT '1',
  `tglresign` date NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `tglmelamar` date NOT NULL,
  `golongan` varchar(5) NOT NULL DEFAULT '1',
  `struktural` varchar(5) NOT NULL DEFAULT '1',
  `fungsional` varchar(5) NOT NULL DEFAULT '1',
  `pengabdian` varchar(5) NOT NULL DEFAULT '1',
  `istrianak` varchar(5) NOT NULL DEFAULT '1',
  `uangmakan` varchar(5) NOT NULL DEFAULT '1',
  `uangtransport` varchar(5) NOT NULL DEFAULT '1',
  `bebantugas` varchar(5) NOT NULL DEFAULT '1',
  `walikelas` varchar(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_karyawan
-- ----------------------------
INSERT INTO `hrd_karyawan` VALUES ('1', '1', '', 'Silvia Irene', 'Surabaya', '2015-04-22', '-', '-', '-', 'South Emerald Mansion TK 8/8E', 'Surabaya', '', '', '', '', '083854806060', '', '-', '-', '', '-', '-', '2015-06-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('2', '2', '', 'Christine Lovely Halim', '', '1985-06-17', '2', '2', '2', 'Darmo Baru Timur 4/25', 'Surabaya', '', '', '', '', '082140988853', '', '1', '-', '', '-', '-', '2015-06-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('3', '3', '', 'Romana Thensy Sheilla', '', '2015-09-08', '2', '2', '1', 'Ikan Mungsing 8/9', 'Surabaya', '', '', '', '', '081515419001', '', '1', '-', '', '-', '-', '2015-06-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('4', '4', '', 'Aulia Rachma', '', '1983-07-24', '2', '2', '-', 'Jelidro Indah Blok 3/4', 'Surabaya', '', '', '', '', '08165450503', '', '1', '-', '', '-', '-', '2015-06-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('5', '5', '', 'Desy Febriyanti', '', '1988-02-18', '2', '-', '-', 'Pondok Benowo Indah Blok EN-14', 'Surabaya', '', '', '', '', '085730726173', '', '1', '-', '', '-', '-', '2015-06-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('6', '133.01.13', '', 'Supriyadi', 'trenggalek', '1975-06-15', '1', '3', '1', 'Jl. Panjang 100', 'Surabaya', '', '', '', '', '', '5198d90d03412a139c07db673d3315bc.jpg', '1', '11', '', '3', '4', '2011-07-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
