/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-12-18 08:11:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_siswa
-- ----------------------------
DROP TABLE IF EXISTS `psb_siswa`;
CREATE TABLE `psb_siswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nopendaftaran` int(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `namasiswa` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL DEFAULT '',
  `nisn` varchar(100) NOT NULL DEFAULT '',
  `panggilansiswa` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sekolahasalsiswa` varchar(100) NOT NULL,
  `sukusiswa` int(10) DEFAULT NULL,
  `agamasiswa` int(11) DEFAULT NULL,
  `status` enum('0','1','2') NOT NULL DEFAULT '0',
  `jkelaminsiswa` enum('L','P') NOT NULL,
  `tempatlahirsiswa` varchar(50) NOT NULL,
  `tanggallahirsiswa` date NOT NULL,
  `warganegarasiswa` varchar(20) NOT NULL,
  `anakke` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `beratsiswa` decimal(4,1) unsigned NOT NULL DEFAULT '0.0',
  `tinggisiswa` decimal(4,1) unsigned NOT NULL DEFAULT '0.0',
  `darahsiswa` enum('A','B','AB','O') NOT NULL,
  `photosiswa` longtext NOT NULL,
  `alamatsiswa` varchar(255) NOT NULL,
  `kodepossiswa` varchar(8) NOT NULL,
  `telponsiswa` varchar(20) NOT NULL,
  `pinbbsiswa` varchar(20) NOT NULL,
  `emailsiswa` varchar(100) NOT NULL,
  `penyakitsiswa` varchar(300) NOT NULL,
  `hpsiswa` varchar(15) NOT NULL,
  `catatankesehatansiswa` text NOT NULL,
  `kotasiswa` varchar(25) NOT NULL,
  `kotasekolahasalsiswa` varchar(25) NOT NULL,
  `negarasekolahasalsiswa` varchar(25) NOT NULL,
  `ijazahsiswa` varchar(55) NOT NULL,
  `keterangansiswa` text,
  `bahasasiswa1` varchar(20) NOT NULL,
  `bahasasiswa2` varchar(20) NOT NULL,
  `diasuh` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1=ayah+ibu, 2=ayah, 3=ibu, 4=wali',
  PRIMARY KEY (`replid`),
  KEY `FK_calonsiswa_agama` (`agamasiswa`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_siswa
-- ----------------------------
INSERT INTO `psb_siswa` VALUES ('193', '14', null, 'Lunabelle Veloxia Taslim', '7', '', '', '1', '', '0', '0', '1', 'P', '', '2007-07-18', '', '0', '0.0', '0.0', '', '13_fc0095bb80.jpeg', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('202', '23', null, 'Quinncy Angeline Gunawan', '', '', 'Quinn', '1', 'Baby Smile School', '0', '0', '0', 'P', 'surabaya', '2012-03-09', 'indonesia', '0', '0.0', '0.0', '', '', 'Woodland WL 2/88 Citraland', '', '0317450572', '', '', '', '08155128883', '', 'surabaya', '', '', '', null, 'indonesia', 'english', '1');
INSERT INTO `psb_siswa` VALUES ('203', '24', null, 'Rayna Felixia Tanujaya', '', '', 'rayna', '1', '', '0', '5', '0', 'P', 'surabaya', '2013-01-01', 'indonesia', '0', '0.0', '0.0', '', '', 'satelit indah 9 / GN - 18', '', '', '', 'dto31@yahoo.com', '', '085100109151', '', 'surabaya', '', '', '', null, 'indonesia', 'english', '1');
INSERT INTO `psb_siswa` VALUES ('204', '25', null, 'naysa ronauly emmelee sidabutar 	', '', '', 'naysa', '1', '', '0', '5', '0', 'P', 'surabaya', '2013-01-28', 'indonesia', '0', '0.0', '0.0', '', '', 'Manukan Peni A-4 / 12 ', '', '', '', '', '', '0811344037', '', 'surabaya', '', '', '', null, 'indonesia', '', '1');
INSERT INTO `psb_siswa` VALUES ('205', '26', null, 'vincenzo christopher wen', '93', '', '', '1', '', '0', '0', '1', 'L', '', '2015-12-17', '', '0', '0.0', '0.0', '', '17_d006da213a.jpeg', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('206', '27', null, 'Jocelyn Jayadi', '', '', 'Jocelyn', '1', 'fei siang preschool', '0', '4', '0', 'P', 'surabaya', '2012-06-11', 'indonesia', '0', '0.0', '0.0', '', '', 'sukomanunggal jaya elok E/22 RT/RW 005/003', '', '0317320208', '', '', '', '', '', 'sukomanunggal jaya elok E', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('207', '28', null, 'Sharon Layarta', '', '', 'Sharon', '1', 'Great Crystal', '0', '5', '0', 'P', 'Surabaya', '2010-05-21', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'Indonesia', 'Inggris', '1');
INSERT INTO `psb_siswa` VALUES ('208', '29', null, 'Gabriela Patricia Lusida', '', '', 'Patricia', '1', 'Margie', '0', '4', '0', 'P', 'Surabaya', '2001-03-17', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('209', '30', null, 'Sharon Serafine', '', '', 'Sharon', '1', 'Great Crystal', '0', '5', '0', 'P', 'Surabaya', '2004-09-18', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('210', '31', null, 'Bryan Patrick Purnomo', '', '', 'Bryan', '1', 'IPH', '0', '4', '0', 'L', 'Surabaya', '2004-10-16', 'Idonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('211', '32', null, 'Jocelyn Jennifer Wen', '', '', 'Jocy', '1', 'Spins', '0', '5', '0', 'P', 'Surabaya', '2015-12-01', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '0811 341 3153', '', '', '', '0858 5339 4639', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('212', '33', null, 'Marilynn Eng Jia Yi', '', '', 'Marilynn', '1', 'Surabaya Cambridge School', '0', '0', '0', 'P', 'Singapore', '2004-02-02', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('213', '34', null, 'Osten Cristo Harianto', '', '', 'Osten', '1', 'Merlion', '0', '0', '0', 'L', 'Surabaya', '2010-01-26', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('214', '35', null, 'Averyne Stacya Denyanto', '', '', 'Averyne', '1', 'IVY School', '0', '0', '0', 'P', 'Surabaya', '2010-08-10', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('215', '36', null, 'Terrence Kiswanto', '', '', 'Terrence', '1', 'Great Crystal School', '0', '5', '0', 'L', 'Surabaya', '2011-01-04', '', '0', '0.0', '0.0', '', '', 'Jl. Jenggolo no 35-37', '', '031 896 1107', '', 'heni_olii@yahoo.com', '', '0815 1563 1615', '', 'Surabaya', 'Surabaya', 'Indonesia', '', null, 'Indonesa', '', '1');
INSERT INTO `psb_siswa` VALUES ('216', '37', null, 'Henry Chandra', '', '', 'Henry', '1', 'Lollypop', '0', '1', '0', 'L', 'Surabaya', '2010-09-17', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'Mandarin', 'English', '1');
INSERT INTO `psb_siswa` VALUES ('217', '38', null, 'Regina Mikaela Hidayat', '', '', 'Regina', '1', 'Merlion', '0', '0', '0', 'P', 'Singapore', '2009-12-12', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('218', '39', null, 'Irene Valensia', '', '', 'Valen', '1', 'Great Crystal', '0', '5', '0', 'P', 'Surabaya', '2011-02-03', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', 'Surabaya', 'Indonesia', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('219', '40', null, 'Joe Lukas Wili', '', '', 'Joe', '1', 'Lollypop', '0', '5', '0', 'L', 'Surabaya', '2010-02-05', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('220', '41', null, 'Natan Gunawan', '', '', 'Natan', '1', '', '0', '5', '0', 'L', 'Surabaya', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'English', '', '1');
INSERT INTO `psb_siswa` VALUES ('221', '42', null, 'Hiro Hideaki Prasetya', '', '', 'Hiro', '1', 'Lollypop', '0', '4', '0', 'L', 'Surabaya', '2010-05-12', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('222', '43', null, 'Kenzie Edbert Widodo', '', '', 'Kenzie', '1', 'lollypop', '0', '0', '0', 'L', 'Surabaya', '2010-06-12', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('223', '44', null, 'Azelia Javelyn Kho', '', '', 'Javelyn', '1', 'Little Sun School', '0', '0', '0', 'P', 'Surabaya', '2010-07-03', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'Indonesia', 'English', '1');
INSERT INTO `psb_siswa` VALUES ('224', '45', null, 'James Franklin Linarto', '', '', 'James', '1', 'Lollypop', '0', '0', '0', 'L', 'Surabaya', '0000-00-00', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('225', '46', null, 'Shannon vivan Liem', '', '', 'Vivan', '1', 'Merlion', '0', '0', '0', 'P', 'Surabaya', '2010-10-21', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('226', '47', null, 'Nicholas Andrison', '', '', 'Nick', '1', 'Ivy School', '0', '5', '0', 'L', 'Surabaya', '2010-09-28', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, 'English', 'indonesia', '1');
INSERT INTO `psb_siswa` VALUES ('227', '48', null, 'Revin Liem', '', '', 'Revin', '1', 'Lollypop', '0', '5', '0', 'L', 'Surabaya', '2009-12-15', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('229', '49', null, 'Gisele Lovely Njoto', '', '', 'Pao Pao', '1', 'JAC School', '0', '0', '0', 'P', 'Surabaya', '2010-05-10', 'Indonesia', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('230', '50', null, 'Archie Oesjady', '10', '', '', '1', '', '0', '0', '1', 'L', '', '2010-07-14', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('231', '51', null, 'George Maverick candra', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('233', '53', null, 'Justin Ong', '99', '', '', '1', '', '0', '0', '1', 'P', '', '2015-12-25', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('234', '54', null, 'Cordelia Sucarita Wang', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('235', '55', null, 'Adjie Reksa Nugroho', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('236', '56', null, 'Carly Rei Chen', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('237', '57', null, 'Kaylee Weng Okawida', '', '', '', '1', '', '0', '0', '0', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('238', '58', null, 'Aldrin Reynard Herdianto', '9', '', '', '1', '', '0', '0', '1', 'L', '', '0000-00-00', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('239', '59', null, 'Eugene Sinclair Sutanto', '', '', '', '1', '', '0', '0', '0', 'L', '', '2015-12-16', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('240', '60', null, 'Aaron William Soemarno', '8', '', '', '1', '', '0', '0', '1', 'L', '', '2015-12-18', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('241', '61', null, 'Axel Oesjady', '', '', '', '1', '', '0', '0', '0', 'L', '', '2015-12-02', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
INSERT INTO `psb_siswa` VALUES ('242', '62', null, 'Jordyn Edward Motanto', '6', '', '', '1', '', '0', '0', '1', 'L', '', '2015-12-09', '', '0', '0.0', '0.0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '', '', '1');
