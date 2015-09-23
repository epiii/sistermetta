/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sistermetta_backup

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-07-24 14:16:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_hrd
-- ----------------------------
DROP TABLE IF EXISTS `admin_hrd`;
CREATE TABLE `admin_hrd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `mod` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL,
  `parent` int(2) NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin_hrd
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_absensi
-- ----------------------------
DROP TABLE IF EXISTS `hrd_absensi`;
CREATE TABLE `hrd_absensi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `masuk` int(3) NOT NULL DEFAULT '0',
  `lembur` int(3) NOT NULL DEFAULT '0',
  `sakit` int(3) NOT NULL DEFAULT '0',
  `alpha` int(3) NOT NULL DEFAULT '0',
  `telat` int(3) NOT NULL DEFAULT '0',
  `bulan` int(2) NOT NULL,
  `tahun` varchar(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_absensi
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_agama
-- ----------------------------
DROP TABLE IF EXISTS `hrd_agama`;
CREATE TABLE `hrd_agama` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_agama
-- ----------------------------
INSERT INTO `hrd_agama` VALUES ('1', 'Islam', '0');
INSERT INTO `hrd_agama` VALUES ('2', 'Kristen', '0');
INSERT INTO `hrd_agama` VALUES ('3', 'Katolik', '0');
INSERT INTO `hrd_agama` VALUES ('6', 'Hindu', '0');
INSERT INTO `hrd_agama` VALUES ('7', 'Budha', '0');

-- ----------------------------
-- Table structure for hrd_bayar
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bayar`;
CREATE TABLE `hrd_bayar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `bayar` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  `pid` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_bayar
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_bebantugas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bebantugas`;
CREATE TABLE `hrd_bebantugas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_bebantugas
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_berkas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_berkas`;
CREATE TABLE `hrd_berkas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_berkas
-- ----------------------------
INSERT INTO `hrd_berkas` VALUES ('3', 'c4aca4147a61be59157a6f0612997435.jpg', '1');

-- ----------------------------
-- Table structure for hrd_bulan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bulan`;
CREATE TABLE `hrd_bulan` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `bulan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hrd_bulan
-- ----------------------------
INSERT INTO `hrd_bulan` VALUES ('1', 'Januari');
INSERT INTO `hrd_bulan` VALUES ('2', 'Februari');
INSERT INTO `hrd_bulan` VALUES ('3', 'Maret');
INSERT INTO `hrd_bulan` VALUES ('4', 'April');
INSERT INTO `hrd_bulan` VALUES ('5', 'Mei');
INSERT INTO `hrd_bulan` VALUES ('6', 'Juni');
INSERT INTO `hrd_bulan` VALUES ('7', 'Juli');
INSERT INTO `hrd_bulan` VALUES ('8', 'Agustus');
INSERT INTO `hrd_bulan` VALUES ('9', 'September');
INSERT INTO `hrd_bulan` VALUES ('10', 'Oktober');
INSERT INTO `hrd_bulan` VALUES ('11', 'Nopember');
INSERT INTO `hrd_bulan` VALUES ('12', 'Desember');

-- ----------------------------
-- Table structure for hrd_cuti
-- ----------------------------
DROP TABLE IF EXISTS `hrd_cuti`;
CREATE TABLE `hrd_cuti` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl` date NOT NULL,
  `cuti` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_cuti
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_departemen
-- ----------------------------
DROP TABLE IF EXISTS `hrd_departemen`;
CREATE TABLE `hrd_departemen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  `masterdepartemen` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_departemen
-- ----------------------------
INSERT INTO `hrd_departemen` VALUES ('1', 'Meta', '0', '0');

-- ----------------------------
-- Table structure for hrd_fungsional
-- ----------------------------
DROP TABLE IF EXISTS `hrd_fungsional`;
CREATE TABLE `hrd_fungsional` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_fungsional
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_golongan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_golongan`;
CREATE TABLE `hrd_golongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `gajipokok` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_golongan
-- ----------------------------
INSERT INTO `hrd_golongan` VALUES ('1', 'SATU2', '3000000');

-- ----------------------------
-- Table structure for hrd_history
-- ----------------------------
DROP TABLE IF EXISTS `hrd_history`;
CREATE TABLE `hrd_history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `history` varchar(255) NOT NULL,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_history
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_istrianak
-- ----------------------------
DROP TABLE IF EXISTS `hrd_istrianak`;
CREATE TABLE `hrd_istrianak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_istrianak
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_jabatan`;
CREATE TABLE `hrd_jabatan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_jabatan
-- ----------------------------
INSERT INTO `hrd_jabatan` VALUES ('11', 'Guru', '0');
INSERT INTO `hrd_jabatan` VALUES ('13', 'Kepala Sekolah', '0');
INSERT INTO `hrd_jabatan` VALUES ('14', 'Wakil Kepala Sekolah', '0');
INSERT INTO `hrd_jabatan` VALUES ('15', 'Koordinator HOD', '0');
INSERT INTO `hrd_jabatan` VALUES ('16', 'Kepala Litbang', '0');
INSERT INTO `hrd_jabatan` VALUES ('17', 'Manajer Operasional', '0');
INSERT INTO `hrd_jabatan` VALUES ('18', 'Humas', '0');
INSERT INTO `hrd_jabatan` VALUES ('19', 'Tata Usaha', '0');
INSERT INTO `hrd_jabatan` VALUES ('20', 'Chaplain', '0');
INSERT INTO `hrd_jabatan` VALUES ('21', 'Sekretaris Perhimpunan', '0');
INSERT INTO `hrd_jabatan` VALUES ('23', 'Supir', '0');
INSERT INTO `hrd_jabatan` VALUES ('24', 'Pustakawan', '0');
INSERT INTO `hrd_jabatan` VALUES ('25', 'Staf Keuangan', '0');
INSERT INTO `hrd_jabatan` VALUES ('26', 'Staf HRD', '0');
INSERT INTO `hrd_jabatan` VALUES ('27', 'Nanny', '0');
INSERT INTO `hrd_jabatan` VALUES ('28', 'Suster', '0');
INSERT INTO `hrd_jabatan` VALUES ('29', 'Staf GA', '0');
INSERT INTO `hrd_jabatan` VALUES ('30', 'Staf Gudang', '0');
INSERT INTO `hrd_jabatan` VALUES ('31', 'Staf Purchasing & Student Service', '0');
INSERT INTO `hrd_jabatan` VALUES ('32', 'Staf Marketing', '0');
INSERT INTO `hrd_jabatan` VALUES ('33', 'Resepsionis', '0');
INSERT INTO `hrd_jabatan` VALUES ('34', 'Staf', '0');
INSERT INTO `hrd_jabatan` VALUES ('35', 'Staf Foto Copy', '0');
INSERT INTO `hrd_jabatan` VALUES ('36', 'Koordinator GAC (DOS)', '0');
INSERT INTO `hrd_jabatan` VALUES ('37', 'Koordinator GA', '0');
INSERT INTO `hrd_jabatan` VALUES ('38', 'Koordinator Sarpras', '0');
INSERT INTO `hrd_jabatan` VALUES ('39', 'Spv. Accounting ', '0');
INSERT INTO `hrd_jabatan` VALUES ('40', 'Koordinator Training', '0');
INSERT INTO `hrd_jabatan` VALUES ('41', 'Staf Maintenance', '0');
INSERT INTO `hrd_jabatan` VALUES ('42', 'Spv. Marketing', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_karyawan
-- ----------------------------
INSERT INTO `hrd_karyawan` VALUES ('1', '85042201001', '', 'Silvia Irene', 'Surabaya', '1985-04-22', '2', '7', '1', 'South Emerald Mansion TK 8/8E', 'Surabaya', '', '', '', '', '083854806060', '', '1', '13', '', '-', '4', '2007-06-04', '0000-00-00', '0000-00-00', '0', '2912686909', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('2', '88061701002', '', 'Christine Lovely Halim', 'Jakarta', '1988-06-17', '2', '2', '2', 'Darmo Baru Timur 4/25', 'Surabaya', '', '', '', '', '082140988853', '', '1', '11', '', '-', '-', '2015-06-04', '0000-00-00', '0000-00-00', '0', '4104602490', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('3', '82090801003', '', 'Romana Thensy Sheilla Dewi', 'surabaya', '1982-09-08', '2', '2', '1', 'Ikan Mungsing 8/9', 'Surabaya', '', '', '', '', '081515419001', '', '1', '11', '', '-', '9', '2015-06-04', '0000-00-00', '0000-00-00', '0', '4103534491', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('4', '83070201004', '', 'Aulia Rachma', 'surabaya', '1983-07-24', '2', '2', '-', 'Jelidro Indah Blok 3/4', 'Surabaya', '', '', '', '', '08165450503', '', '1', '11', '', '-', '4', '2015-06-04', '0000-00-00', '0000-00-00', '0', '4107011345', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('5', '88021801005', '', 'Desy Febriyanti', 'surabaya', '1988-02-18', '2', '1', '2', 'Pondok Benowo Indah Blok EN-14', 'Surabaya', '', '', '', '', '085730726173', '', '1', '11', '', '-', '4', '2015-06-04', '0000-00-00', '0000-00-00', '0', '4108577865', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('10', '78021601007', '', 'Virginia Mustamu', 'Makasar', '1978-02-16', '2', '3', '1', 'Permata Safira A4/8, Lidah Kulon-Lakarsantri', 'surabaya', '60213', 'Jawa Timur', 'Indonesia', '', '087852492300', '', '1', '11', '', '-', '9', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4100246746', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('7', '', '', 'asd', 'ads', '2015-07-22', '1', '6', '2', '', '', '', '', '', '', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', '0000-00-00', '0', '', '', '', '0', '0000-00-00', '', '', '2015-07-12', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('9', '87052601006', '', 'Rycha Rany Susanto', 'surabaya', '1987-05-26', '2', '1', '1', 'Lidah Harapan Blok X No.27', 'surabaya', '', '', '', '', '', '', '1', '13', '', '-', '5', '2015-07-24', '0000-00-00', '0000-00-00', '0', '2912687271', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('11', '87012601008', '', 'Agnes Dian Christy', 'Sidoarjo', '1987-01-26', '2', '2', '2', 'Babatan Indah B1-24', '', '', '', '', '', '', '', '1', '11', '', '-', '4', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4108355358', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('12', '86122801009', '', 'Rima Yosita Prayitno', 'Palembang', '1986-12-28', '2', '1', '2', 'Pondok Mutiara D/1,Sidoarjo', '', '', '', '', '', '', '', '1', '11', '', '-', '4', '2015-07-24', '0000-00-00', '0000-00-00', '0', '9807290786', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('13', '65012401010', '', 'Maria Theresia Sri Murni', 'surabaya', '1965-01-24', '2', '3', '1', 'Pondok Benowo Indah AZ/28', '', '', '', '', '', '', '', '1', '11', '', '-', '5', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4105667251', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('14', '91010401011', '', 'Yesicca Irene', 'Malang', '1991-01-04', '2', '7', '2', 'Ratah Tiga No.39, Malang', '', '', '', '', '', '', '', '1', '11', '', '-', '4', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4105667278', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('15', '88042101012', '', 'Gondo Subekti', 'Jayapura', '1988-04-21', '1', '1', '2', 'Dusun Kenanten RT01/RW02,Mojokerto', '', '', '', '', '', '', '', '1', '11', '', '-', '4', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4107011086', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('16', '92061601013', '', 'Yuni Herawati', 'Cirebon', '1992-06-16', '2', '2', '2', 'Jl. KH Ali 2A RT04 RW02 Sekarputih,Bondowoso', '', '', '', '', '', '', '', '1', '11', '', '-', '4', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4110328864', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('17', '86050401014', '', 'Roesanty Eka Taruna', 'surabaya', '1986-05-04', '2', '1', '2', 'Balongsari Madya 7A/29,Surabaya', '', '', '', '', '', '', '', '1', '11', '', '-', '4', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4102500879', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('18', '88070802001', '', 'Shelvi Dyah Pratiwi', 'surabaya', '1988-07-08', '2', '1', '1', 'Putat Gede Timur 4/46', 'surabaya', '60189', 'Jawa Timur', 'Indonesia', '', '081330994950', '', '1', '19', '', '-', '3', '2015-07-24', '0000-00-00', '0000-00-00', '0', '2912685589', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('19', '83070202002', '', 'Laily Fitriyah', 'surabaya', '1983-07-02', '2', '1', '1', 'Sumberan Jl.HKSN 1 No.25,Balasklumprik-wiyung Surabaya', 'surabaya', '60222', 'Jawa Timur', 'Indonesia', '', '081515190488', '', '1', '19', '', '-', '3', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4100246142', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('20', '67062102003', '', 'Boniyem', 'Ponorogo', '1967-06-21', '2', '1', '1', 'Dukuh Doyong RT 01 RW 01,Ponorogo', '', '', '', '', '', '', '', '1', '-', '', '-', '3', '2015-07-24', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `hrd_karyawan` VALUES ('21', '72051002004', '', 'Krisnawati', 'Blitar', '1972-05-10', '2', '1', '1', 'Jl.Kapuas FL7 Wisma Tropodo RT056 RW 006', '', '', '', '', '', '', '', '1', '-', '', '-', '3', '2015-07-24', '0000-00-00', '0000-00-00', '0', '4105667537', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for hrd_kelamin
-- ----------------------------
DROP TABLE IF EXISTS `hrd_kelamin`;
CREATE TABLE `hrd_kelamin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelamin` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_kelamin
-- ----------------------------
INSERT INTO `hrd_kelamin` VALUES ('1', 'Laki-laki');
INSERT INTO `hrd_kelamin` VALUES ('2', 'Perempuan');

-- ----------------------------
-- Table structure for hrd_m_agama
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_agama`;
CREATE TABLE `hrd_m_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_agama
-- ----------------------------
INSERT INTO `hrd_m_agama` VALUES ('1', 'Islam', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('2', 'Kristen', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('3', 'Nasrani', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('4', 'Hindu', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('5', 'Budha', '0', '');

-- ----------------------------
-- Table structure for hrd_m_bagian
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_bagian`;
CREATE TABLE `hrd_m_bagian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bagian` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_bagian
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_m_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_dokumen`;
CREATE TABLE `hrd_m_dokumen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dokumen` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_dokumen
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_m_jenistraining
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_jenistraining`;
CREATE TABLE `hrd_m_jenistraining` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_jenistraining
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_m_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_kelompok`;
CREATE TABLE `hrd_m_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_kelompok
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_m_keluarga
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_keluarga`;
CREATE TABLE `hrd_m_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keluarga` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_keluarga
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_m_marital
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_marital`;
CREATE TABLE `hrd_m_marital` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marital` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_marital
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_m_posisi
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_posisi`;
CREATE TABLE `hrd_m_posisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posisi` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_posisi
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_m_status
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_status`;
CREATE TABLE `hrd_m_status` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_status
-- ----------------------------
INSERT INTO `hrd_m_status` VALUES ('1', 'Tetap', '0', '30', '');
INSERT INTO `hrd_m_status` VALUES ('2', 'Kontrak', '0', '30', '');

-- ----------------------------
-- Table structure for hrd_m_tingkat
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_tingkat`;
CREATE TABLE `hrd_m_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_tingkat
-- ----------------------------
INSERT INTO `hrd_m_tingkat` VALUES ('1', 'General staff', '0', '');
INSERT INTO `hrd_m_tingkat` VALUES ('2', 'Manager', '0', '');
INSERT INTO `hrd_m_tingkat` VALUES ('3', 'Staff', '0', '');

-- ----------------------------
-- Table structure for hrd_menikah
-- ----------------------------
DROP TABLE IF EXISTS `hrd_menikah`;
CREATE TABLE `hrd_menikah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_menikah
-- ----------------------------
INSERT INTO `hrd_menikah` VALUES ('1', 'Menikah', '0');
INSERT INTO `hrd_menikah` VALUES ('2', 'Belum Menikah', '0');

-- ----------------------------
-- Table structure for hrd_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pegawai`;
CREATE TABLE `hrd_pegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `noidentitas` varchar(30) NOT NULL,
  `kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `tmplahir` varchar(20) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `marital` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `bagian` int(10) unsigned NOT NULL DEFAULT '0',
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `posisi` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `tingkat` int(10) unsigned NOT NULL DEFAULT '0',
  `kesehatan` varchar(500) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `darah` varchar(2) NOT NULL DEFAULT '-',
  `berat` decimal(4,1) NOT NULL DEFAULT '0.0',
  `tinggi` decimal(4,1) NOT NULL DEFAULT '0.0',
  `photo` blob NOT NULL,
  `tglkerja` date NOT NULL DEFAULT '0000-00-00',
  `golakhir` varchar(100) NOT NULL,
  `akhirkontrak` date NOT NULL DEFAULT '0000-00-00',
  `akhirgol` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pegawai
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_pendidikan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pendidikan`;
CREATE TABLE `hrd_pendidikan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pendidikan
-- ----------------------------
INSERT INTO `hrd_pendidikan` VALUES ('3', 'SMA', '0');
INSERT INTO `hrd_pendidikan` VALUES ('4', 'S1', '0');
INSERT INTO `hrd_pendidikan` VALUES ('5', 'S2', '0');
INSERT INTO `hrd_pendidikan` VALUES ('6', 'S3', '0');
INSERT INTO `hrd_pendidikan` VALUES ('7', 'D1', '0');
INSERT INTO `hrd_pendidikan` VALUES ('8', 'D2', '0');
INSERT INTO `hrd_pendidikan` VALUES ('9', 'D3', '0');
INSERT INTO `hrd_pendidikan` VALUES ('10', 'D4', '0');

-- ----------------------------
-- Table structure for hrd_pengabdian
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pengabdian`;
CREATE TABLE `hrd_pengabdian` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pengabdian
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_penggajian
-- ----------------------------
DROP TABLE IF EXISTS `hrd_penggajian`;
CREATE TABLE `hrd_penggajian` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tkt` varchar(50) NOT NULL,
  `gajipokok` varchar(50) NOT NULL DEFAULT '0',
  `tstruktural` varchar(50) NOT NULL DEFAULT '0',
  `tfungsional` varchar(50) NOT NULL DEFAULT '0',
  `tpengabdian` varchar(50) NOT NULL DEFAULT '0',
  `tistrianak` varchar(50) NOT NULL DEFAULT '0',
  `tuangtransport` varchar(50) NOT NULL DEFAULT '0',
  `tbebantugas` varchar(50) NOT NULL DEFAULT '0',
  `twalikelas` varchar(50) NOT NULL DEFAULT '0',
  `tkhusus` varchar(50) NOT NULL DEFAULT '0',
  `gajibruto` varchar(50) NOT NULL DEFAULT '0',
  `tlain` varchar(50) NOT NULL DEFAULT '0',
  `totalgaji` varchar(50) NOT NULL DEFAULT '0',
  `ppinjaman` varchar(50) NOT NULL DEFAULT '0',
  `jamsostek` varchar(50) NOT NULL DEFAULT '0',
  `pph21` varchar(50) NOT NULL DEFAULT '0',
  `gajibersih` varchar(50) NOT NULL DEFAULT '0',
  `idbayar` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_penggajian
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_pinjaman
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pinjaman`;
CREATE TABLE `hrd_pinjaman` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `pinjaman` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pinjaman
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_setting
-- ----------------------------
DROP TABLE IF EXISTS `hrd_setting`;
CREATE TABLE `hrd_setting` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `thr` varchar(5) NOT NULL,
  `reward` varchar(50) NOT NULL DEFAULT '0',
  `terlambat` varchar(50) NOT NULL DEFAULT '0',
  `pph21` varchar(50) NOT NULL DEFAULT '0',
  `jamsostek` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_setting
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_statuskaryawan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_statuskaryawan`;
CREATE TABLE `hrd_statuskaryawan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_statuskaryawan
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_struktural
-- ----------------------------
DROP TABLE IF EXISTS `hrd_struktural`;
CREATE TABLE `hrd_struktural` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_struktural
-- ----------------------------
INSERT INTO `hrd_struktural` VALUES ('1', 'STRUKTURAL 1', '10', '0');

-- ----------------------------
-- Table structure for hrd_tipe
-- ----------------------------
DROP TABLE IF EXISTS `hrd_tipe`;
CREATE TABLE `hrd_tipe` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_tipe
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_training
-- ----------------------------
DROP TABLE IF EXISTS `hrd_training`;
CREATE TABLE `hrd_training` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` tinyint(4) NOT NULL DEFAULT '0',
  `penyelenggara` varchar(100) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pembicara` varchar(100) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `tgl1` date NOT NULL DEFAULT '0000-00-00',
  `tgl2` date NOT NULL DEFAULT '0000-00-00',
  `peserta` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_training
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_uangmakan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_uangmakan`;
CREATE TABLE `hrd_uangmakan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_uangmakan
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_uangtransport
-- ----------------------------
DROP TABLE IF EXISTS `hrd_uangtransport`;
CREATE TABLE `hrd_uangtransport` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_uangtransport
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_walikelas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_walikelas`;
CREATE TABLE `hrd_walikelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_walikelas
-- ----------------------------

-- ----------------------------
-- Table structure for modul_hrd
-- ----------------------------
DROP TABLE IF EXISTS `modul_hrd`;
CREATE TABLE `modul_hrd` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `modul` varchar(30) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `setup` varchar(50) NOT NULL DEFAULT '',
  `posisi` tinyint(2) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(5) NOT NULL DEFAULT '0',
  `type` enum('block','module') NOT NULL DEFAULT 'module',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modul_hrd
-- ----------------------------
