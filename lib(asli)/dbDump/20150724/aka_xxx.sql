/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-24 07:12:39
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
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `tahunajaran` int(10) NOT NULL,
  `kapasitas` int(10) NOT NULL DEFAULT '0',
  `wali` int(10) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_detailkelas
-- ----------------------------
INSERT INTO `aka_detailkelas` VALUES ('30', '22', '4', '25', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('31', '23', '4', '20', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('32', '24', '4', '20', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('33', '25', '4', '20', '4', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('34', '26', '4', '20', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('35', '27', '4', '20', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('36', '28', '4', '20', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('37', '29', '4', '20', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('38', '30', '4', '20', '0', '2015-07-13 20:16:22');
INSERT INTO `aka_detailkelas` VALUES ('39', '31', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('40', '32', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('41', '33', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('42', '34', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('43', '35', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('44', '36', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('45', '37', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('46', '38', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('47', '39', '4', '20', '0', '2015-07-13 20:16:23');
INSERT INTO `aka_detailkelas` VALUES ('48', '40', '4', '20', '0', '2015-07-13 20:16:23');

-- ----------------------------
-- Table structure for aka_detailpelajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_detailpelajaran`;
CREATE TABLE `aka_detailpelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `pelajaran` int(11) NOT NULL,
  `subtingkat` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `subtingkat` (`subtingkat`),
  KEY `pelajaran` (`pelajaran`),
  CONSTRAINT `aka_detailpelajaran_ibfk_1` FOREIGN KEY (`pelajaran`) REFERENCES `aka_pelajaran` (`replid`),
  CONSTRAINT `aka_detailpelajaran_ibfk_2` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_detailpelajaran
-- ----------------------------
INSERT INTO `aka_detailpelajaran` VALUES ('16', '38', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('18', '37', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('19', '39', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('20', '40', '3', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('26', '36', '2', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('27', '41', '1', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('28', '42', '1', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('29', '43', '1', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('30', '35', '2', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('31', '39', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('32', '37', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('33', '40', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('34', '38', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('35', '35', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('36', '36', '4', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('37', '18', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('38', '24', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('39', '23', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('40', '28', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('41', '25', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('42', '27', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('43', '26', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('44', '44', '5', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('45', '27', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('46', '23', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('47', '18', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('48', '24', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('49', '28', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('50', '29', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('51', '25', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('52', '26', '6', '1');
INSERT INTO `aka_detailpelajaran` VALUES ('53', '44', '6', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_guru
-- ----------------------------
INSERT INTO `aka_guru` VALUES ('4', '6', '31', 'ok');

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
  `departemen` int(11) NOT NULL,
  `subtingkat` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `subtingkat` (`subtingkat`),
  KEY `departemen` (`departemen`) USING BTREE,
  KEY `departemen_2` (`departemen`),
  CONSTRAINT `aka_kelas_ibfk_1` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_kelas
-- ----------------------------
INSERT INTO `aka_kelas` VALUES ('22', 'A', '1', '1', 'o', '2015-07-13 19:59:20');
INSERT INTO `aka_kelas` VALUES ('23', 'B', '1', '1', '', '2015-07-13 20:02:01');
INSERT INTO `aka_kelas` VALUES ('24', 'A', '1', '2', '', '2015-07-13 20:04:11');
INSERT INTO `aka_kelas` VALUES ('25', 'B', '1', '2', '', '2015-07-13 20:04:18');
INSERT INTO `aka_kelas` VALUES ('26', 'A', '1', '3', '', '2015-07-13 20:04:41');
INSERT INTO `aka_kelas` VALUES ('27', 'B', '1', '3', '', '2015-07-13 20:04:42');
INSERT INTO `aka_kelas` VALUES ('28', 'A', '1', '4', '', '2015-07-13 20:05:02');
INSERT INTO `aka_kelas` VALUES ('29', 'B', '1', '4', '', '2015-07-13 20:05:09');
INSERT INTO `aka_kelas` VALUES ('30', 'A', '1', '5', '', '2015-07-13 20:05:17');
INSERT INTO `aka_kelas` VALUES ('31', 'B', '1', '5', '', '2015-07-13 20:05:26');
INSERT INTO `aka_kelas` VALUES ('32', 'A', '1', '6', '', '2015-07-13 20:13:53');
INSERT INTO `aka_kelas` VALUES ('33', 'B', '1', '6', '', '2015-07-13 20:14:37');
INSERT INTO `aka_kelas` VALUES ('34', 'A', '1', '7', '', '2015-07-13 20:14:45');
INSERT INTO `aka_kelas` VALUES ('35', 'B', '1', '7', '', '2015-07-13 20:14:53');
INSERT INTO `aka_kelas` VALUES ('36', 'A', '1', '8', '', '2015-07-13 20:14:59');
INSERT INTO `aka_kelas` VALUES ('37', 'B', '1', '8', '', '2015-07-13 20:15:07');
INSERT INTO `aka_kelas` VALUES ('38', 'A', '1', '9', '', '2015-07-13 20:15:18');
INSERT INTO `aka_kelas` VALUES ('39', 'A', '1', '10', '', '2015-07-13 20:15:30');
INSERT INTO `aka_kelas` VALUES ('40', 'B', '1', '10', '', '2015-07-13 20:15:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_pelajaran
-- ----------------------------
INSERT INTO `aka_pelajaran` VALUES ('18', 'mtk', 'Matematika', '');
INSERT INTO `aka_pelajaran` VALUES ('19', 'bio', 'Biologi', '');
INSERT INTO `aka_pelajaran` VALUES ('20', 'fis', 'Fisika', '');
INSERT INTO `aka_pelajaran` VALUES ('21', 'kim', 'Kimia', '');
INSERT INTO `aka_pelajaran` VALUES ('22', 'eko', 'Ekonomi', '');
INSERT INTO `aka_pelajaran` VALUES ('23', 'ppkn', 'PPKn', '');
INSERT INTO `aka_pelajaran` VALUES ('24', 'BI', 'Bahasa Indonesia', '');
INSERT INTO `aka_pelajaran` VALUES ('25', 'Bing', 'Bahasa Inggris', '');
INSERT INTO `aka_pelajaran` VALUES ('26', 'TIK', 'Teknologi Informasi dan Komputer', '');
INSERT INTO `aka_pelajaran` VALUES ('27', 'ag', 'Agama', '');
INSERT INTO `aka_pelajaran` VALUES ('28', 'Kertakes', 'Kerajinan Tangan dan Kesenian', '');
INSERT INTO `aka_pelajaran` VALUES ('29', 'penjaskes', 'Pendidikan Jasmani dan Kesehatan ', '');
INSERT INTO `aka_pelajaran` VALUES ('30', 'sej', 'Sejarah', '');
INSERT INTO `aka_pelajaran` VALUES ('31', 'geo', 'Geografi', '');
INSERT INTO `aka_pelajaran` VALUES ('32', 'sos', 'Sosiologi', '');
INSERT INTO `aka_pelajaran` VALUES ('33', 'BK', 'Bimbingan Konseling', '');
INSERT INTO `aka_pelajaran` VALUES ('34', 'elk', 'Elektro', '');
INSERT INTO `aka_pelajaran` VALUES ('35', 'htg', 'Berhitung', '');
INSERT INTO `aka_pelajaran` VALUES ('36', 'nyanyi', 'Bernyanyi', '');
INSERT INTO `aka_pelajaran` VALUES ('37', 'gbr', 'Menggambar', '');
INSERT INTO `aka_pelajaran` VALUES ('38', 'tls', 'Menulis', '');
INSERT INTO `aka_pelajaran` VALUES ('39', 'baca', 'Membaca', '');
INSERT INTO `aka_pelajaran` VALUES ('40', 'wrna', 'Mewarnai', '');
INSERT INTO `aka_pelajaran` VALUES ('41', 'bcr', 'Berbicara', '');
INSERT INTO `aka_pelajaran` VALUES ('42', 'bdri', 'berdiri', '');
INSERT INTO `aka_pelajaran` VALUES ('43', 'jln', 'Berjalan', '');
INSERT INTO `aka_pelajaran` VALUES ('44', 'bader', 'Bahasa Daerah', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_semester
-- ----------------------------
INSERT INTO `aka_semester` VALUES ('21', '1', '4', '1', '2015-07-01', '2015-12-31');
INSERT INTO `aka_semester` VALUES ('22', '2', '4', '1', '2016-01-01', '2016-06-30');

-- ----------------------------
-- Table structure for aka_siswakelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswakelas`;
CREATE TABLE `aka_siswakelas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `detailkelas` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`),
  KEY `detailkelas` (`detailkelas`),
  CONSTRAINT `aka_siswakelas_ibfk_1` FOREIGN KEY (`detailkelas`) REFERENCES `aka_detailkelas` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswakelas
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
  CONSTRAINT `aka_subtingkat_ibfk_1` FOREIGN KEY (`tingkat`) REFERENCES `aka_tingkat` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_subtingkat
-- ----------------------------
INSERT INTO `aka_subtingkat` VALUES ('1', '1', '1');
INSERT INTO `aka_subtingkat` VALUES ('2', '1', '2');
INSERT INTO `aka_subtingkat` VALUES ('3', '1', '3');
INSERT INTO `aka_subtingkat` VALUES ('4', '2', '3');
INSERT INTO `aka_subtingkat` VALUES ('5', '1', '4');
INSERT INTO `aka_subtingkat` VALUES ('6', '2', '4');
INSERT INTO `aka_subtingkat` VALUES ('7', '3', '4');
INSERT INTO `aka_subtingkat` VALUES ('8', '4', '4');
INSERT INTO `aka_subtingkat` VALUES ('9', '5', '4');
INSERT INTO `aka_subtingkat` VALUES ('10', '6', '4');

-- ----------------------------
-- Table structure for aka_tahunajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_tahunajaran`;
CREATE TABLE `aka_tahunajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(4) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_tahunajaran_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_tahunajaran
-- ----------------------------
INSERT INTO `aka_tahunajaran` VALUES ('4', '2015', 'ok', '2015-07-13 13:41:35');

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
INSERT INTO `aka_tingkat` VALUES ('1', 'Toddler', 'usia 1-2 tahun', '1');
INSERT INTO `aka_tingkat` VALUES ('2', 'Playgroup', 'usia 2-3 tahun', '2');
INSERT INTO `aka_tingkat` VALUES ('3', 'Kindergarten', 'usia 4-6 tahun', '3');
INSERT INTO `aka_tingkat` VALUES ('4', 'Primary', 'usia 7-12 tahun', '4');
