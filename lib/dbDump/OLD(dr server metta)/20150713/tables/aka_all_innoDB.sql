/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-13 13:28:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_absen
-- ----------------------------
DROP TABLE IF EXISTS `aka_absen`;
CREATE TABLE `aka_absen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_absen
-- ----------------------------

-- ----------------------------
-- Table structure for aka_absen_guru
-- ----------------------------
DROP TABLE IF EXISTS `aka_absen_guru`;
CREATE TABLE `aka_absen_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_absen_guru
-- ----------------------------

-- ----------------------------
-- Table structure for aka_alumni
-- ----------------------------
DROP TABLE IF EXISTS `aka_alumni`;
CREATE TABLE `aka_alumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunlulus` varchar(4) NOT NULL DEFAULT '0000',
  `siswa` int(10) unsigned NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_alumni
-- ----------------------------

-- ----------------------------
-- Table structure for aka_angkatan
-- ----------------------------
DROP TABLE IF EXISTS `aka_angkatan`;
CREATE TABLE `aka_angkatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `angkatan` int(4) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_angkatan
-- ----------------------------

-- ----------------------------
-- Table structure for aka_aspekpenilaian
-- ----------------------------
DROP TABLE IF EXISTS `aka_aspekpenilaian`;
CREATE TABLE `aka_aspekpenilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aspekpenilaian` varchar(50) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_dasarpenilaian_replid` (`replid`),
  KEY `IX_dasarpenilaian_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_aspekpenilaian
-- ----------------------------

-- ----------------------------
-- Table structure for aka_daftarnilai
-- ----------------------------
DROP TABLE IF EXISTS `aka_daftarnilai`;
CREATE TABLE `aka_daftarnilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `penilaian` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nilai` float NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_daftarnilai
-- ----------------------------

-- ----------------------------
-- Table structure for aka_detailkelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_detailkelas`;
CREATE TABLE `aka_detailkelas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` int(11) NOT NULL,
  `tahunajaran` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL DEFAULT '0',
  `wali` int(10) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `kelas` (`kelas`),
  CONSTRAINT `aka_detailkelas_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `aka_kelas` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_detailkelas
-- ----------------------------

-- ----------------------------
-- Table structure for aka_grading
-- ----------------------------
DROP TABLE IF EXISTS `aka_grading`;
CREATE TABLE `aka_grading` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `aspekpenilaian` int(10) unsigned NOT NULL,
  `nmin` decimal(6,1) NOT NULL,
  `nmax` decimal(6,1) NOT NULL,
  `grading` varchar(2) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_aturangrading_pegawai` (`guru`),
  KEY `FK_aturangrading_tingkat` (`tingkat`),
  KEY `FK_aturangrading_pelajaran` (`pelajaran`),
  KEY `FK_aturangrading_dasarpenilaian` (`aspekpenilaian`),
  KEY `IX_aturangrading_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_grading
-- ----------------------------

-- ----------------------------
-- Table structure for aka_guru
-- ----------------------------
DROP TABLE IF EXISTS `aka_guru`;
CREATE TABLE `aka_guru` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `karyawan` int(11) NOT NULL DEFAULT '0',
  `pelajaran` int(11) NOT NULL DEFAULT '0',
  `keterangan` text,
  PRIMARY KEY (`replid`),
  KEY `FK_guru_pegawai` (`karyawan`),
  KEY `karyawan` (`karyawan`),
  KEY `aka_guru_ibfk_2` (`pelajaran`),
  CONSTRAINT `aka_guru_ibfk_1` FOREIGN KEY (`karyawan`) REFERENCES `hrd_karyawan` (`id`),
  CONSTRAINT `aka_guru_ibfk_2` FOREIGN KEY (`pelajaran`) REFERENCES `aka_pelajaran` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_guru
-- ----------------------------

-- ----------------------------
-- Table structure for aka_jenismutasi
-- ----------------------------
DROP TABLE IF EXISTS `aka_jenismutasi`;
CREATE TABLE `aka_jenismutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_jenismutasi
-- ----------------------------

-- ----------------------------
-- Table structure for aka_kegiatan
-- ----------------------------
DROP TABLE IF EXISTS `aka_kegiatan`;
CREATE TABLE `aka_kegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `efektif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_kegiatan
-- ----------------------------

-- ----------------------------
-- Table structure for aka_kelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_kelas`;
CREATE TABLE `aka_kelas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` varchar(100) NOT NULL,
  `subtingkat` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `subtingkatInd` (`subtingkat`) USING BTREE,
  KEY `kelas` (`kelas`),
  CONSTRAINT `aka_kelas_ibfk_1` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_kelas
-- ----------------------------

-- ----------------------------
-- Table structure for aka_mutasi
-- ----------------------------
DROP TABLE IF EXISTS `aka_mutasi`;
CREATE TABLE `aka_mutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL DEFAULT '0',
  `jenismutasi` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(500) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_mutasi
-- ----------------------------

-- ----------------------------
-- Table structure for aka_pelajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_pelajaran`;
CREATE TABLE `aka_pelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_pelajaran
-- ----------------------------

-- ----------------------------
-- Table structure for aka_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `aka_penilaian`;
CREATE TABLE `aka_penilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `kkm` float NOT NULL DEFAULT '70',
  `bobot` float NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_penilaian
-- ----------------------------

-- ----------------------------
-- Table structure for aka_rpp
-- ----------------------------
DROP TABLE IF EXISTS `aka_rpp`;
CREATE TABLE `aka_rpp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `unit` varchar(100) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`replid`),
  KEY `FK_rpp_tingkat` (`tingkat`),
  KEY `FK_rpp_pelajaran` (`pelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_rpp
-- ----------------------------

-- ----------------------------
-- Table structure for aka_semester
-- ----------------------------
DROP TABLE IF EXISTS `aka_semester`;
CREATE TABLE `aka_semester` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(1) NOT NULL DEFAULT '1',
  `tahunajaran` int(11) NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `tglMulai` date NOT NULL,
  `tglSelesai` date NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_semester_departemen` (`tahunajaran`),
  KEY `tahunajaran` (`tahunajaran`),
  CONSTRAINT `aka_semester_ibfk_1` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_semester
-- ----------------------------

-- ----------------------------
-- Table structure for aka_statusguru
-- ----------------------------
DROP TABLE IF EXISTS `aka_statusguru`;
CREATE TABLE `aka_statusguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statusguru` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_statusguru_replid` (`replid`),
  KEY `IX_statusguru_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_statusguru
-- ----------------------------

-- ----------------------------
-- Table structure for aka_subtingkat
-- ----------------------------
DROP TABLE IF EXISTS `aka_subtingkat`;
CREATE TABLE `aka_subtingkat` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `subtingkat` varchar(100) NOT NULL,
  `tingkat` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `tingkat` (`tingkat`),
  CONSTRAINT `aka_subtingkat_ibfk_1` FOREIGN KEY (`tingkat`) REFERENCES `aka_tingkat` (`replid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_subtingkat
-- ----------------------------

-- ----------------------------
-- Table structure for aka_tahunajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_tahunajaran`;
CREATE TABLE `aka_tahunajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(9) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_tahunajaran_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_tahunajaran
-- ----------------------------

-- ----------------------------
-- Table structure for aka_tahunlulus
-- ----------------------------
DROP TABLE IF EXISTS `aka_tahunlulus`;
CREATE TABLE `aka_tahunlulus` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_tahunlulus
-- ----------------------------

-- ----------------------------
-- Table structure for aka_tingkat
-- ----------------------------
DROP TABLE IF EXISTS `aka_tingkat`;
CREATE TABLE `aka_tingkat` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `urutan` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `replid` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_tingkat
-- ----------------------------
