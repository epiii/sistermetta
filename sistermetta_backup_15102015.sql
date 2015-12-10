-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2015 at 04:21 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sistermetta`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modul` varchar(20) NOT NULL DEFAULT '',
  `posisi` int(1) NOT NULL DEFAULT '0',
  `order` int(3) NOT NULL DEFAULT '0',
  `modul_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `modul_id` (`modul_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `passwd` varchar(128) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1:admin, 2:operator, 3:guest',
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `departemen` int(10) unsigned NOT NULL DEFAULT '0',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `username` (`uname`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`replid`, `app`, `nama`, `uname`, `passwd`, `level`, `pegawai`, `aktif`, `departemen`, `bahasa`, `tlogin`) VALUES
(1, 'all', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 0, '1', 0, 'id', '2015-07-23 11:30:38'),
(6, 'psb', '', 'yohana', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '2015-01-27 08:09:58'),
(7, 'psb', '', 'amey', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 3, '', '2014-03-13 13:33:37'),
(9, 'psb', '', 'lini', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 2, '', '0000-00-00 00:00:00'),
(10, 'psb', '', 'tere', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 1, '', '0000-00-00 00:00:00'),
(11, 'aka', '', 'ratna', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '2014-09-10 08:46:22'),
(12, 'aka', '', 'yani', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '0000-00-00 00:00:00'),
(13, 'aka', '', 'kartika', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '0000-00-00 00:00:00'),
(14, 'psb', '', 'coni chandra', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '2014-03-13 13:32:18'),
(17, 'aka', '', 'Keith', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '2014-10-03 21:12:01'),
(18, 'sar', '', 'wanda', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 1, '', '2014-11-03 13:21:57'),
(19, 'keu', '', 'yeta', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '2014-10-03 21:14:12'),
(20, 'aka', '', 'yossi', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 3, '', '2014-10-09 09:24:49'),
(21, 'psb', '', 'laura', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 3, '', '2015-01-26 12:39:50'),
(22, 'keu', '', 'ketut', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 1, '', '0000-00-00 00:00:00'),
(24, 'keu', '', 'desi', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 1, '', '0000-00-00 00:00:00'),
(25, 'sar', '', 'feri', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 1, '', '0000-00-00 00:00:00'),
(26, 'psb', '', 'angel', '21232f297a57a5a743894a0e4a801fc3', 2, 0, '1', 0, '', '2014-10-28 11:12:05'),
(31, 'gur', '', '', '21232f297a57a5a743894a0e4a801fc3', 2, 133, '1', 0, '', '0000-00-00 00:00:00'),
(32, 'gur', 'Sugeng Widiarso', '201309124', '21232f297a57a5a743894a0e4a801fc3', 2, 124, '1', 0, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_hrd`
--

CREATE TABLE IF NOT EXISTS `admin_hrd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `mod` int(1) NOT NULL DEFAULT '0',
  `ordering` int(2) NOT NULL,
  `parent` int(2) NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_absen`
--

CREATE TABLE IF NOT EXISTS `aka_absen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_absen_guru`
--

CREATE TABLE IF NOT EXISTS `aka_absen_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `absen` varchar(3) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_alumni`
--

CREATE TABLE IF NOT EXISTS `aka_alumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunlulus` varchar(4) NOT NULL DEFAULT '0000',
  `siswa` int(10) unsigned NOT NULL,
  `keterangan` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_angkatan`
--

CREATE TABLE IF NOT EXISTS `aka_angkatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `angkatan` int(4) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `aka_angkatan`
--

INSERT INTO `aka_angkatan` (`replid`, `angkatan`, `departemen`, `keterangan`, `ts`) VALUES
(1, 2015, 1, 'angkatan tahun 2015', '2015-06-02 13:48:12'),
(17, 2014, 1, 'angkatan tahun 2014', '2015-06-23 16:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `aka_aspekpenilaian`
--

CREATE TABLE IF NOT EXISTS `aka_aspekpenilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aspekpenilaian` varchar(50) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_dasarpenilaian_replid` (`replid`),
  KEY `IX_dasarpenilaian_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_daftarnilai`
--

CREATE TABLE IF NOT EXISTS `aka_daftarnilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `penilaian` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nilai` float NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_detailkelas`
--

CREATE TABLE IF NOT EXISTS `aka_detailkelas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kelas` int(11) NOT NULL,
  `tahunajaran` int(10) NOT NULL,
  `kapasitas` int(10) NOT NULL DEFAULT '0',
  `wali` int(10) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `aka_detailkelas`
--

INSERT INTO `aka_detailkelas` (`replid`, `kelas`, `tahunajaran`, `kapasitas`, `wali`, `ts`) VALUES
(30, 22, 4, 25, 0, '2015-07-13 13:16:22'),
(31, 23, 4, 20, 0, '2015-07-13 13:16:22'),
(32, 24, 4, 20, 0, '2015-07-13 13:16:22'),
(33, 25, 4, 20, 4, '2015-07-13 13:16:22'),
(34, 26, 4, 20, 0, '2015-07-13 13:16:22'),
(35, 27, 4, 20, 0, '2015-07-13 13:16:22'),
(36, 28, 4, 20, 0, '2015-07-13 13:16:22'),
(37, 29, 4, 20, 0, '2015-07-13 13:16:22'),
(38, 30, 4, 20, 0, '2015-07-13 13:16:22'),
(39, 31, 4, 20, 0, '2015-07-13 13:16:23'),
(40, 32, 4, 20, 0, '2015-07-13 13:16:23'),
(41, 33, 4, 20, 0, '2015-07-13 13:16:23'),
(42, 34, 4, 20, 0, '2015-07-13 13:16:23'),
(43, 35, 4, 20, 0, '2015-07-13 13:16:23'),
(44, 36, 4, 20, 0, '2015-07-13 13:16:23'),
(45, 37, 4, 20, 0, '2015-07-13 13:16:23'),
(46, 38, 4, 20, 0, '2015-07-13 13:16:23'),
(47, 39, 4, 20, 0, '2015-07-13 13:16:23'),
(48, 40, 4, 20, 0, '2015-07-13 13:16:23'),
(49, 1, 1, 0, 0, '2015-07-26 04:25:41'),
(50, 2, 1, 0, 0, '2015-07-26 04:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `aka_detailpelajaran`
--

CREATE TABLE IF NOT EXISTS `aka_detailpelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `pelajaran` int(11) NOT NULL,
  `subtingkat` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  KEY `subtingkat` (`subtingkat`),
  KEY `pelajaran` (`pelajaran`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `aka_detailpelajaran`
--

INSERT INTO `aka_detailpelajaran` (`replid`, `pelajaran`, `subtingkat`, `status`) VALUES
(16, 38, 3, 1),
(18, 37, 3, 1),
(19, 39, 3, 1),
(20, 40, 3, 1),
(26, 36, 2, 1),
(27, 41, 1, 1),
(28, 42, 1, 1),
(29, 43, 1, 1),
(30, 35, 2, 1),
(31, 39, 4, 1),
(32, 37, 4, 1),
(33, 40, 4, 1),
(34, 38, 4, 1),
(35, 35, 4, 1),
(36, 36, 4, 1),
(37, 18, 5, 1),
(38, 24, 5, 1),
(39, 23, 5, 1),
(40, 28, 5, 1),
(41, 25, 5, 1),
(42, 27, 5, 1),
(43, 26, 5, 1),
(44, 44, 5, 1),
(45, 27, 6, 1),
(46, 23, 6, 1),
(47, 18, 6, 1),
(48, 24, 6, 1),
(49, 28, 6, 1),
(50, 29, 6, 1),
(51, 25, 6, 1),
(52, 26, 6, 1),
(53, 44, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aka_grading`
--

CREATE TABLE IF NOT EXISTS `aka_grading` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_grup`
--

CREATE TABLE IF NOT EXISTS `aka_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_guru`
--

CREATE TABLE IF NOT EXISTS `aka_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `kode` varchar(3) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `pelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_guru_pegawai` (`pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_jadwal`
--

CREATE TABLE IF NOT EXISTS `aka_jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `semester` int(10) unsigned NOT NULL DEFAULT '0',
  `kelas` int(10) unsigned NOT NULL,
  `hari` smallint(5) unsigned NOT NULL,
  `jam` mediumint(8) unsigned NOT NULL,
  `sks` int(10) unsigned NOT NULL,
  `ruang` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_jadwal_set`
--

CREATE TABLE IF NOT EXISTS `aka_jadwal_set` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `hari` int(10) unsigned NOT NULL,
  `jam` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `aka_jadwal_set`
--

INSERT INTO `aka_jadwal_set` (`replid`, `tahunajaran`, `hari`, `jam`, `aktif`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 1),
(3, 1, 1, 3, 1),
(4, 1, 1, 4, 1),
(5, 1, 1, 5, 1),
(6, 1, 1, 6, 1),
(7, 1, 1, 7, 1),
(8, 1, 2, 1, 1),
(9, 1, 2, 2, 1),
(10, 1, 2, 3, 1),
(11, 1, 2, 4, 1),
(12, 1, 2, 5, 1),
(13, 1, 2, 6, 1),
(14, 1, 2, 7, 1),
(15, 1, 3, 1, 1),
(16, 1, 3, 2, 1),
(17, 1, 3, 3, 1),
(18, 1, 3, 4, 1),
(19, 1, 3, 5, 1),
(20, 1, 3, 6, 1),
(21, 1, 3, 7, 1),
(22, 1, 4, 1, 1),
(23, 1, 4, 2, 1),
(24, 1, 4, 3, 1),
(25, 1, 4, 4, 1),
(26, 1, 4, 5, 1),
(27, 1, 4, 6, 1),
(28, 1, 4, 7, 1),
(29, 1, 5, 1, 1),
(30, 1, 5, 2, 1),
(31, 1, 5, 3, 1),
(32, 1, 5, 4, 1),
(33, 1, 5, 5, 1),
(34, 1, 5, 6, 1),
(35, 1, 5, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aka_jenismutasi`
--

CREATE TABLE IF NOT EXISTS `aka_jenismutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_jurnal`
--

CREATE TABLE IF NOT EXISTS `aka_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_kegiatan`
--

CREATE TABLE IF NOT EXISTS `aka_kegiatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `efektif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_kelas`
--

CREATE TABLE IF NOT EXISTS `aka_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(100) NOT NULL,
  `tahunajaran` int(10) unsigned NOT NULL,
  `subtingkat` int(10) NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL DEFAULT '0',
  `wali` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_kelas_pegawai` (`wali`),
  KEY `IX_kelas_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `aka_kelas`
--

INSERT INTO `aka_kelas` (`replid`, `kelas`, `tahunajaran`, `subtingkat`, `tingkat`, `kapasitas`, `wali`, `keterangan`, `ts`) VALUES
(1, 'K2', 1, 1, 3, 30, 2, '', '2015-06-05 08:41:20'),
(2, 'K1', 1, 1, 3, 30, 1, NULL, '2015-06-22 22:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `aka_komennilai`
--

CREATE TABLE IF NOT EXISTS `aka_komennilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `komen` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_komenrapor`
--

CREATE TABLE IF NOT EXISTS `aka_komenrapor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `komen` varchar(300) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_mutasi`
--

CREATE TABLE IF NOT EXISTS `aka_mutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL DEFAULT '0',
  `jenismutasi` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(500) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_pelajaran`
--

CREATE TABLE IF NOT EXISTS `aka_pelajaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `aka_pelajaran`
--

INSERT INTO `aka_pelajaran` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(2, 'BING', 'Bahasa Inggris', ''),
(3, 'MAT', 'Matematika', ''),
(18, 'mtk', 'Matematika', ''),
(19, 'bio', 'Biologi', ''),
(20, 'fis', 'Fisika', ''),
(21, 'kim', 'Kimia', ''),
(22, 'eko', 'Ekonomi', ''),
(23, 'ppkn', 'PPKn', ''),
(24, 'BI', 'Bahasa Indonesia', ''),
(25, 'Bing', 'Bahasa Inggris', ''),
(26, 'TIK', 'Teknologi Informasi dan Komputer', ''),
(27, 'ag', 'Agama', ''),
(28, 'Kertakes', 'Kerajinan Tangan dan Kesenian', ''),
(29, 'penjaskes', 'Pendidikan Jasmani dan Kesehatan ', ''),
(30, 'sej', 'Sejarah', ''),
(31, 'geo', 'Geografi', ''),
(32, 'sos', 'Sosiologi', ''),
(33, 'BK', 'Bimbingan Konseling', ''),
(34, 'elk', 'Elektro', ''),
(35, 'htg', 'Berhitung', ''),
(36, 'nyanyi', 'Bernyanyi', ''),
(37, 'gbr', 'Menggambar', ''),
(38, 'tls', 'Menulis', ''),
(39, 'baca', 'Membaca', ''),
(40, 'wrna', 'Mewarnai', ''),
(41, 'bcr', 'Berbicara', ''),
(42, 'bdri', 'berdiri', ''),
(43, 'jln', 'Berjalan', ''),
(44, 'bader', 'Bahasa Daerah', '');

-- --------------------------------------------------------

--
-- Table structure for table `aka_penilaian`
--

CREATE TABLE IF NOT EXISTS `aka_penilaian` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_rpp`
--

CREATE TABLE IF NOT EXISTS `aka_rpp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guru` int(10) unsigned NOT NULL,
  `tingkat` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `unit` varchar(100) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`replid`),
  KEY `FK_rpp_tingkat` (`tingkat`),
  KEY `FK_rpp_pelajaran` (`pelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_ruang`
--

CREATE TABLE IF NOT EXISTS `aka_ruang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_semester`
--

CREATE TABLE IF NOT EXISTS `aka_semester` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semester` int(1) NOT NULL DEFAULT '1',
  `tahunajaran` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `tglMulai` date NOT NULL,
  `tglSelesai` date NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_semester_departemen` (`tahunajaran`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `aka_semester`
--

INSERT INTO `aka_semester` (`replid`, `semester`, `tahunajaran`, `aktif`, `tglMulai`, `tglSelesai`) VALUES
(2, 2, 1, '1', '2016-01-01', '2016-06-30'),
(18, 1, 1, '1', '2015-07-01', '2015-12-31'),
(19, 1, 2, '1', '2015-06-01', '2022-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `aka_setting`
--

CREATE TABLE IF NOT EXISTS `aka_setting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa`
--

CREATE TABLE IF NOT EXISTS `aka_siswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL,
  `nisn` varchar(100) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `sekolahasal` varchar(100) NOT NULL,
  `proses` int(10) unsigned NOT NULL DEFAULT '0',
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `kriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `golongan` int(10) unsigned NOT NULL DEFAULT '0',
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
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
  `disctb` decimal(10,0) DEFAULT '0',
  `discsaudara` decimal(10,0) DEFAULT '0',
  `disctunai` decimal(10,0) DEFAULT '0',
  `disctotal` decimal(10,0) NOT NULL DEFAULT '0',
  `denda` decimal(10,0) DEFAULT '0',
  `angsuran` decimal(10,0) NOT NULL DEFAULT '0',
  `jmlangsur` int(10) unsigned NOT NULL DEFAULT '1',
  `sppbulan` decimal(10,0) NOT NULL DEFAULT '0',
  `grup` int(10) unsigned NOT NULL DEFAULT '0',
  `ujian1` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian2` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ujian3` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rekening` varchar(50) NOT NULL,
  `namabank` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_ayah`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_ayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_grup`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `grup` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_guru`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `guru` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_ibu`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_ibu` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_kelas`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `aka_siswa_kelas`
--

INSERT INTO `aka_siswa_kelas` (`replid`, `siswa`, `kelas`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_keluarga`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `kakek-nama` varchar(100) NOT NULL,
  `kakek-tgllahir` date NOT NULL,
  `nenek-nama` varchar(100) NOT NULL,
  `nenek-tgllahir` date NOT NULL,
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_kontakdarurat`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_saudara`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_siswa_tes`
--

CREATE TABLE IF NOT EXISTS `aka_siswa_tes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned NOT NULL,
  `tes` int(10) unsigned NOT NULL,
  `nilai` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_sks`
--

CREATE TABLE IF NOT EXISTS `aka_sks` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `kelas` int(10) unsigned NOT NULL,
  `pelajaran` int(10) unsigned NOT NULL,
  `guru` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_statusguru`
--

CREATE TABLE IF NOT EXISTS `aka_statusguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statusguru` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_statusguru_replid` (`replid`),
  KEY `IX_statusguru_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_subtingkat`
--

CREATE TABLE IF NOT EXISTS `aka_subtingkat` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `subtingkat` varchar(100) NOT NULL,
  `tingkat` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `aka_subtingkat`
--

INSERT INTO `aka_subtingkat` (`replid`, `subtingkat`, `tingkat`) VALUES
(1, '1', 3),
(2, '1', 2),
(3, '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aka_tahunajaran`
--

CREATE TABLE IF NOT EXISTS `aka_tahunajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_tahunajaran_departemen` (`departemen`),
  KEY `IX_tahunajaran_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `aka_tahunajaran`
--

INSERT INTO `aka_tahunajaran` (`replid`, `tahunajaran`, `departemen`, `tglmulai`, `tglakhir`, `aktif`, `keterangan`, `ts`) VALUES
(1, '2015-2016', 1, '2015-07-01', '2016-06-30', '1', '', '2015-06-02 13:49:20'),
(2, '2014-2015', 1, '0000-00-00', '0000-00-00', '0', 'ok', '2015-06-29 22:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `aka_tahunlulus`
--

CREATE TABLE IF NOT EXISTS `aka_tahunlulus` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) unsigned NOT NULL,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_tes`
--

CREATE TABLE IF NOT EXISTS `aka_tes` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `urut` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_tesakademis`
--

CREATE TABLE IF NOT EXISTS `aka_tesakademis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aka_tingkat`
--

CREATE TABLE IF NOT EXISTS `aka_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL DEFAULT '',
  `tahunajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_tingkat_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `aka_tingkat`
--

INSERT INTO `aka_tingkat` (`replid`, `tingkat`, `tahunajaran`, `keterangan`, `urutan`, `ts`) VALUES
(1, 'Toddler', 1, 'Toddler', 1, '2015-06-02 13:52:51'),
(2, 'Playgroup 1', 1, '', 2, '2015-06-02 13:53:05'),
(3, 'Kindergarten 1', 1, '', 3, '2015-06-02 13:53:30'),
(4, 'Primary', 1, '', 4, '2015-07-25 01:37:58'),
(5, 'Playgroup 2', 1, '', 5, '2015-07-25 01:38:19'),
(6, 'Kindergarten 2', 1, '', 6, '2015-07-25 01:38:47');

-- --------------------------------------------------------

--
-- Table structure for table `aka_tmp_saudara`
--

CREATE TABLE IF NOT EXISTS `aka_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `appactivate`
--

CREATE TABLE IF NOT EXISTS `appactivate` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(10) NOT NULL,
  `user` varchar(20) NOT NULL,
  `kunci` varchar(20) NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_registry`
--

CREATE TABLE IF NOT EXISTS `app_registry` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE IF NOT EXISTS `departemen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kepsek` int(10) unsigned NOT NULL DEFAULT '0',
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `telepon` varchar(30) NOT NULL,
  `photo` blob NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_departemen_replid` (`replid`),
  UNIQUE KEY `departemen` (`nama`),
  KEY `FK_departemen_pegawai` (`kepsek`),
  KEY `IX_departemen_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`replid`, `nama`, `kepsek`, `urut`, `keterangan`, `alamat`, `telepon`, `photo`, `ts`) VALUES
(1, 'Meta', 0, 1, '', '', '', '', '2015-06-02 13:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_absensi`
--

CREATE TABLE IF NOT EXISTS `hrd_absensi` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_agama`
--

CREATE TABLE IF NOT EXISTS `hrd_agama` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `hrd_agama`
--

INSERT INTO `hrd_agama` (`id`, `nama`, `tunjangan`) VALUES
(1, 'Islam', '0'),
(2, 'Kristen', '0'),
(3, 'Katolik', '0'),
(6, 'Hindu', '0'),
(7, 'Budha', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_bayar`
--

CREATE TABLE IF NOT EXISTS `hrd_bayar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `bayar` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  `pid` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_bebantugas`
--

CREATE TABLE IF NOT EXISTS `hrd_bebantugas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_berkas`
--

CREATE TABLE IF NOT EXISTS `hrd_berkas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hrd_berkas`
--

INSERT INTO `hrd_berkas` (`id`, `gambar`, `karyawan`) VALUES
(3, 'c4aca4147a61be59157a6f0612997435.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hrd_bulan`
--

CREATE TABLE IF NOT EXISTS `hrd_bulan` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `bulan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hrd_bulan`
--

INSERT INTO `hrd_bulan` (`id`, `bulan`) VALUES
(1, 'Januari'),
(2, 'Februari'),
(3, 'Maret'),
(4, 'April'),
(5, 'Mei'),
(6, 'Juni'),
(7, 'Juli'),
(8, 'Agustus'),
(9, 'September'),
(10, 'Oktober'),
(11, 'Nopember'),
(12, 'Desember');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_cuti`
--

CREATE TABLE IF NOT EXISTS `hrd_cuti` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl` date NOT NULL,
  `cuti` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_departemen`
--

CREATE TABLE IF NOT EXISTS `hrd_departemen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  `masterdepartemen` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hrd_departemen`
--

INSERT INTO `hrd_departemen` (`id`, `nama`, `tunjangan`, `masterdepartemen`) VALUES
(1, 'Metta', '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hrd_fungsional`
--

CREATE TABLE IF NOT EXISTS `hrd_fungsional` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_golongan`
--

CREATE TABLE IF NOT EXISTS `hrd_golongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `gajipokok` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hrd_golongan`
--

INSERT INTO `hrd_golongan` (`id`, `nama`, `gajipokok`) VALUES
(1, 'SATU2', '3000000');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_history`
--

CREATE TABLE IF NOT EXISTS `hrd_history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `history` varchar(255) NOT NULL,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_istrianak`
--

CREATE TABLE IF NOT EXISTS `hrd_istrianak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_jabatan`
--

CREATE TABLE IF NOT EXISTS `hrd_jabatan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `hrd_jabatan`
--

INSERT INTO `hrd_jabatan` (`id`, `nama`, `tunjangan`) VALUES
(11, 'Guru', '0'),
(13, 'Kepala Sekolah', '0'),
(14, 'Wakil Kepala Sekolah', '0'),
(15, 'Koordinator HOD', '0'),
(16, 'Kepala Litbang', '0'),
(17, 'Manajer Operasional', '0'),
(18, 'Humas', '0'),
(19, 'Tata Usaha', '0'),
(20, 'Chaplain', '0'),
(21, 'Sekretaris Perhimpunan', '0'),
(23, 'Supir', '0'),
(24, 'Pustakawan', '0'),
(25, 'Staf Keuangan', '0'),
(26, 'Staf HRD', '0'),
(27, 'Nanny', '0'),
(28, 'Suster', '0'),
(29, 'Staf GA', '0'),
(30, 'Staf Gudang', '0'),
(31, 'Staf Purchasing & Student Service', '0'),
(32, 'Staf Marketing', '0'),
(33, 'Resepsionis', '0'),
(34, 'Staf', '0'),
(35, 'Staf Foto Copy', '0'),
(36, 'Koordinator GAC (DOS)', '0'),
(37, 'Koordinator GA', '0'),
(38, 'Koordinator Sarpras', '0'),
(39, 'Spv. Accounting ', '0'),
(40, 'Koordinator Training', '0'),
(41, 'Staf Maintenance', '0'),
(42, 'Spv. Marketing', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_karyawan`
--

CREATE TABLE IF NOT EXISTS `hrd_karyawan` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `hrd_karyawan`
--

INSERT INTO `hrd_karyawan` (`id`, `nip`, `nuptk`, `nama`, `kotalahir`, `tgllahir`, `kelamin`, `agama`, `menikah`, `alamat`, `kota`, `kodepos`, `propinsi`, `negara`, `telepon`, `handphone`, `foto`, `departemen`, `jabatan`, `jabatanlain`, `status`, `pendidikan_terakhir`, `tglditerima`, `tglpercobaan`, `tglkontrak`, `jatahcuti`, `norek`, `namarek`, `npwp`, `tipe`, `tglresign`, `alasan`, `lampiran`, `tglmelamar`, `golongan`, `struktural`, `fungsional`, `pengabdian`, `istrianak`, `uangmakan`, `uangtransport`, `bebantugas`, `walikelas`) VALUES
(1, '85042201001', '', 'Silvia Irene', 'Surabaya', '1985-04-22', '2', '7', '1', 'South Emerald Mansion TK 8/8E', 'Surabaya', '', '', '', '', '083854806060', '', '1', '13', '', '1', '4', '2007-06-04', '0000-00-00', '0000-00-00', 0, '2912686909', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(2, '88061701002', '', 'Christine Lovely Halim', 'Jakarta', '1988-06-17', '2', '2', '2', 'Darmo Baru Timur 4/25', 'Surabaya', '', '', '', '', '082140988853', '', '1', '11', '', '2', '9', '2011-10-03', '0000-00-00', '0000-00-00', 0, '4104602490', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(3, '82090801003', '', 'Romana Thensy Sheilla Dewi', 'surabaya', '1982-09-08', '2', '2', '1', 'Ikan Mungsing 8/9', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '', '081515419001', '', '1', '11', '', '1', '9', '2012-07-09', '0000-00-00', '0000-00-00', 0, '4103534491', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(4, '83070201004', '', 'Aulia Rachma', 'surabaya', '1983-07-24', '2', '2', '-', 'Jelidro Indah Blok 3/4', 'Surabaya', '', '', '', '', '08165450503', '9ce1a3962b557e95e3ab023f74ac8ffe.jpg', '1', '11', '', '1', '4', '2013-03-18', '0000-00-00', '0000-00-00', 0, '4107011345', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(5, '88021801005', '', 'Desy Febriyanti', 'surabaya', '1988-02-18', '2', '1', '2', 'Pondok Benowo Indah Blok EN-14', 'Surabaya', '', '', '', '', '085730726173', 'e221dc3d2cd1632230f49a5538de0073.jpg', '1', '11', '', '1', '4', '2013-08-14', '0000-00-00', '0000-00-00', 0, '4108577865', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(10, '78021601007', '', 'Virginia Mustamu', 'Makasar', '1978-02-16', '2', '3', '1', 'Permata Safira A4/8, Lidah Kulon-Lakarsantri', 'surabaya', '60213', 'Jawa Timur', 'Indonesia', '', '087852492300', '96f1a36af6c485fa8515ed8112c0a9b7.jpg', '1', '11', '', '1', '9', '2010-07-26', '0000-00-00', '0000-00-00', 0, '4100246746', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(7, '', '', 'asd', 'ads', '2015-07-22', '1', '6', '2', '', '', '', '', '', '', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', '0000-00-00', 0, '', '', '', '0', '0000-00-00', '', '', '2015-07-12', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(9, '87052601006', '', 'Rycha Rany Susanto', 'surabaya', '1987-05-26', '2', '1', '1', 'Lidah Harapan Blok X No.27', 'surabaya', '', '', '', '', '', '896d5f0fef3a1b4e03a18b166eb289e0.jpg', '1', '13', '', '1', '5', '2008-07-01', '0000-00-00', '0000-00-00', 0, '2912687271', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(11, '87012601008', '', 'Agnes Dian Christy', 'Sidoarjo', '1987-01-26', '2', '2', '2', 'Babatan Indah B1-24', '', '', '', '', '', '', '7c927cb609fbf536fcfe1045b34bf350.jpg', '1', '11', '', '1', '4', '2014-07-07', '0000-00-00', '0000-00-00', 0, '4108355358', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(12, '86122801009', '', 'Rima Yosita Prayitno', 'Palembang', '1986-12-28', '2', '1', '2', 'Pondok Mutiara D/1,Sidoarjo', '', '', '', '', '', '', '6e9b38073b06b1b1452be681605b3716.jpg', '1', '11', '', '2', '4', '2014-07-21', '0000-00-00', '0000-00-00', 0, '9807290786', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(13, '65012401010', '', 'Maria Theresia Sri Murni', 'surabaya', '1965-01-24', '2', '3', '1', 'Pondok Benowo Indah AZ/28', '', '', '', '', '', '', '53ae7b78981f2936814f76f43d1918e9.jpg', '1', '11', '', '1', '5', '2012-07-09', '0000-00-00', '0000-00-00', 0, '4105667251', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(14, '91010401011', '', 'Yesicca Irene', 'Malang', '1991-01-04', '2', '7', '2', 'Ratah Tiga No.39, Malang', '', '', '', '', '', '', '', '1', '11', '', '2', '4', '2012-07-09', '0000-00-00', '0000-00-00', 0, '4105667278', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(15, '88042101012', '', 'Gondo Subekti', 'Jayapura', '1988-04-21', '1', '1', '2', 'Dusun Kenanten RT01/RW02,Mojokerto', '', '', '', '', '', '', 'fa68f10e98decc62302da344459fc5b7.jpg', '1', '11', '', '1', '4', '2013-01-09', '0000-00-00', '0000-00-00', 0, '4107011086', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(16, '92061601013', '', 'Yuni Herawati', 'Cirebon', '1992-06-16', '2', '2', '2', 'Jl. KH Ali 2A RT04 RW02 Sekarputih,Bondowoso', '', '', '', '', '', '088210406279', '557bef4264b8e27ba1ce43b2980e86cb.jpg', '1', '11', '', '1', '4', '2014-07-07', '0000-00-00', '0000-00-00', 0, '4110328864', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(17, '86050401014', '', 'Roesanty Eka Taruna', 'surabaya', '1986-05-04', '2', '1', '2', 'Balongsari Madya 7A/29,Surabaya', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '087854510447', '6f117826a056d6eed98ed39ad0aac82f.jpg', '1', '11', '', '1', '4', '2011-03-01', '0000-00-00', '0000-00-00', 0, '4102500879', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(18, '88070802001', '', 'Shelvi Dyah Pratiwi', 'surabaya', '1988-07-08', '2', '1', '1', 'Putat Gede Timur 4/46', 'surabaya', '60189', 'Jawa Timur', 'Indonesia', '', '081330994950', '', '1', '19', '', '1', '3', '2006-07-10', '2006-10-10', '0000-00-00', 0, '2912685589', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(19, '83070202002', '', 'Laily Fitriyah', 'surabaya', '1983-07-02', '2', '1', '1', 'Sumberan Jl.HKSN 1 No.25,Balasklumprik-wiyung Surabaya', 'surabaya', '60222', 'Jawa Timur', 'Indonesia', '', '081515190488', 'c348a668f2eb1af7ea7d561e9f5b32dc.jpg', '1', '19', '', '1', '3', '2010-04-01', '0000-00-00', '0000-00-00', 0, '4100246142', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(20, '67062102003', '', 'Boniyem', 'Ponorogo', '1967-06-21', '2', '1', '1', 'Dukuh Doyong RT 01 RW 01,Ponorogo', 'Ponorogo', '', 'Jawa Timur', '', '', '', '49a742001ad07e5e37458c7a3918725f.jpg', '1', '-', '', '1', '3', '2010-05-01', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(21, '72051002004', '', 'Krisnawati', 'Blitar', '1972-05-10', '2', '1', '1', 'Jl.Kapuas FL7 Wisma Tropodo RT056 RW 006', '', '', '', '', '', '', '461e83d954a663f18fdc88ba13a2d692.jpg', '1', '-', '', '1', '3', '2012-07-09', '0000-00-00', '0000-00-00', 0, '4105667537', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(22, '82021801015', '', 'Julia Agahari', 'surabaya', '1982-02-18', '2', '7', '1', 'Darmo Permai Utara IV No.12', 'surabaya', '60187', 'Jawa Timur', 'Indonesia', '0317314775', '08165409830', 'e20c808827bb2526dc14c44c95bdc594.jpg', '1', '11', '', '1', '4', '2013-01-14', '0000-00-00', '0000-00-00', 0, '4107011094', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(23, '66032001016', '', 'Brett Riley Noel', 'Ohio', '1966-03-20', '1', '3', '1', 'Puncak Permai Utara 45-47', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '', '777501c2aaec351cfd2596baa446683c.jpg', '1', '11', '', '1', '5', '2013-05-01', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(24, '82052401016', '', 'Lusiani', 'surabaya', '2015-07-28', '2', '7', '1', '', '', '', '', '', '', '', '5771246b9b3c6d1e7bb57c7a99ed5059.jpg', '1', '11', '', '2', '4', '2009-07-01', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(25, '81090101017', '', 'Sukma Yenti', 'Pekanbaru', '1981-09-01', '2', '7', '1', 'Bukit Telaga Golf TE 4/16,Citraland', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '085265222649', '8728bc84a19d0f79c17a93bd6624c46c.jpg', '1', '11', '', '2', '4', '2005-07-01', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(26, '78082701018', '', 'Dyah Jarmawati', 'surabaya', '1978-08-27', '2', '1', '1', 'Jl.Praja Mukti No.30 Tanggulangin', 'sidoarjo', '', 'Jawa Timur', 'Indonesia', '', '089679684262', '', '1', '11', '', '1', '4', '2013-07-23', '0000-00-00', '0000-00-00', 0, '4108355730', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(27, '89090401019', '', 'Yuva Sephany', 'Tarakan', '1989-09-04', '2', '2', '2', 'Simorejo 17/5', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '085731664855', '', '1', '11', '', '1', '4', '2015-07-23', '0000-00-00', '0000-00-00', 0, '4121435557', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(28, '92053101020', '', 'Menik Ida Suryani', 'surabaya', '1992-05-31', '2', '1', '2', 'Griya Surabaya Asri A9/17', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '085733215610', 'c7ca75ebca7a28c95f524f8aff4e8fbd.jpg', '1', '11', '', '1', '4', '2015-07-23', '0000-00-00', '0000-00-00', 0, '9810427199', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(29, '93080801021', '', 'Ericko Arifin Bong', 'Kalimantan', '1993-08-08', '1', '7', '2', 'Perumahan Taman Puspa Raya , Citraland', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '081282621543', 'c73d93e58ca4e7b37872e9e7f4019b4d.jpg', '1', '11', '', '1', '4', '2015-07-27', '0000-00-00', '0000-00-00', 0, '4113531008', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(30, '15151501022', '', 'Michel Habersaat', '', '2015-08-25', '-', '-', '-', '', '', '', '', '', '', '', '087cd17ac957ec3aecaa153c5c367e9a.jpg', '-', '11', '', '2', '-', '2015-07-27', '0000-00-00', '0000-00-00', 0, '9810440004', 'Michel Habersaat', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(31, '15151501023', '', 'Ida Bagus Kartika Dewi', 'surabaya', '2015-08-25', '2', '7', '1', '', '', '', '', '', '', '', 'fe06ac0999d0b2e15581796ce731bdec.jpg', '1', '11', '', '2', '4', '2008-07-01', '0000-00-00', '0000-00-00', 0, '2912686860', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_kelamin`
--

CREATE TABLE IF NOT EXISTS `hrd_kelamin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelamin` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hrd_kelamin`
--

INSERT INTO `hrd_kelamin` (`id`, `kelamin`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_menikah`
--

CREATE TABLE IF NOT EXISTS `hrd_menikah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hrd_menikah`
--

INSERT INTO `hrd_menikah` (`id`, `nama`, `tunjangan`) VALUES
(1, 'Menikah', '0'),
(2, 'Belum Menikah', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_agama`
--

CREATE TABLE IF NOT EXISTS `hrd_m_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hrd_m_agama`
--

INSERT INTO `hrd_m_agama` (`replid`, `agama`, `urut`, `keterangan`) VALUES
(1, 'Islam', 0, ''),
(2, 'Kristen', 0, ''),
(3, 'Nasrani', 0, ''),
(4, 'Hindu', 0, ''),
(5, 'Budha', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_bagian`
--

CREATE TABLE IF NOT EXISTS `hrd_m_bagian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bagian` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_dokumen`
--

CREATE TABLE IF NOT EXISTS `hrd_m_dokumen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dokumen` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_jenistraining`
--

CREATE TABLE IF NOT EXISTS `hrd_m_jenistraining` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_kelompok`
--

CREATE TABLE IF NOT EXISTS `hrd_m_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_keluarga`
--

CREATE TABLE IF NOT EXISTS `hrd_m_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keluarga` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_marital`
--

CREATE TABLE IF NOT EXISTS `hrd_m_marital` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marital` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_posisi`
--

CREATE TABLE IF NOT EXISTS `hrd_m_posisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posisi` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_status`
--

CREATE TABLE IF NOT EXISTS `hrd_m_status` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hrd_m_status`
--

INSERT INTO `hrd_m_status` (`replid`, `status`, `urut`, `reminder`, `keterangan`) VALUES
(1, 'Tetap', 0, 30, ''),
(2, 'Kontrak', 0, 30, '');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_m_tingkat`
--

CREATE TABLE IF NOT EXISTS `hrd_m_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hrd_m_tingkat`
--

INSERT INTO `hrd_m_tingkat` (`replid`, `tingkat`, `urut`, `keterangan`) VALUES
(1, 'General staff', 0, ''),
(2, 'Manager', 0, ''),
(3, 'Staff', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_pegawai`
--

CREATE TABLE IF NOT EXISTS `hrd_pegawai` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_pendidikan`
--

CREATE TABLE IF NOT EXISTS `hrd_pendidikan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `hrd_pendidikan`
--

INSERT INTO `hrd_pendidikan` (`id`, `nama`, `tunjangan`) VALUES
(3, 'SMA', '0'),
(4, 'S1', '0'),
(5, 'S2', '0'),
(6, 'S3', '0'),
(7, 'D1', '0'),
(8, 'D2', '0'),
(9, 'D3', '0'),
(10, 'D4', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_pengabdian`
--

CREATE TABLE IF NOT EXISTS `hrd_pengabdian` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_penggajian`
--

CREATE TABLE IF NOT EXISTS `hrd_penggajian` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_pinjaman`
--

CREATE TABLE IF NOT EXISTS `hrd_pinjaman` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `pinjaman` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_setting`
--

CREATE TABLE IF NOT EXISTS `hrd_setting` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `thr` varchar(5) NOT NULL,
  `reward` varchar(50) NOT NULL DEFAULT '0',
  `terlambat` varchar(50) NOT NULL DEFAULT '0',
  `pph21` varchar(50) NOT NULL DEFAULT '0',
  `jamsostek` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_statuskaryawan`
--

CREATE TABLE IF NOT EXISTS `hrd_statuskaryawan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hrd_statuskaryawan`
--

INSERT INTO `hrd_statuskaryawan` (`id`, `nama`, `tunjangan`) VALUES
(1, 'Full Time', '0'),
(2, 'Part Time', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_struktural`
--

CREATE TABLE IF NOT EXISTS `hrd_struktural` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hrd_struktural`
--

INSERT INTO `hrd_struktural` (`id`, `nama`, `persen`, `nominal`) VALUES
(1, 'STRUKTURAL 1', '10', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_tipe`
--

CREATE TABLE IF NOT EXISTS `hrd_tipe` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_training`
--

CREATE TABLE IF NOT EXISTS `hrd_training` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_uangmakan`
--

CREATE TABLE IF NOT EXISTS `hrd_uangmakan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_uangtransport`
--

CREATE TABLE IF NOT EXISTS `hrd_uangtransport` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_walikelas`
--

CREATE TABLE IF NOT EXISTS `hrd_walikelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `intrusions`
--

CREATE TABLE IF NOT EXISTS `intrusions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `page` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `impact` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keu_anggarantahunan`
--

CREATE TABLE IF NOT EXISTS `keu_anggarantahunan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(11) NOT NULL,
  `nominal` decimal(11,0) NOT NULL DEFAULT '0',
  `tahunbuku` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilanggaran` (`detilanggaran`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `keu_anggarantahunan`
--

INSERT INTO `keu_anggarantahunan` (`replid`, `detilanggaran`, `nominal`, `tahunbuku`) VALUES
(1, 1, '500000', 1),
(3, 3, '230000', 1),
(4, 4, '250000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `keu_brg`
--

CREATE TABLE IF NOT EXISTS `keu_brg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompokbrg` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `satuan` varchar(10) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_brg`
--

INSERT INTO `keu_brg` (`replid`, `kelompokbrg`, `kode`, `nama`, `unit`, `satuan`, `tanggal`, `keterangan`) VALUES
(1, 1, 'ELKO001', 'Macbook pro 15 inch', 14, 'unit', '2014-01-11', ''),
(2, 4, 'KEMTR0001', 'Supra X 125', 3, '', '2014-01-11', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_budget`
--

CREATE TABLE IF NOT EXISTS `keu_budget` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  `departemen` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_budget`
--

INSERT INTO `keu_budget` (`replid`, `tahunbuku`, `nama`, `nominal`, `keterangan`, `departemen`) VALUES
(1, 1, 'Alat Penganggaran', '10000000', '', 1),
(2, 1, 'anggaran', '2000000', '', 1),
(3, 1, 'Angaran Lagi', '100000', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `keu_detilanggaran`
--

CREATE TABLE IF NOT EXISTS `keu_detilanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(11) NOT NULL,
  `tingkat` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `tahunbuku` int(11) NOT NULL,
  `nominal` decimal(10,0) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `keu_detilanggaran`
--

INSERT INTO `keu_detilanggaran` (`replid`, `kategorianggaran`, `tingkat`, `nama`, `keterangan`, `tahunbuku`, `nominal`) VALUES
(1, 1, 8, 'white board new ', 'barang baru', 1, '500000'),
(3, 1, 2, 'kertas HVS', 'ok bos', 1, '3500'),
(4, 1, 8, 'penghapus', 'barang baru ', 5, '35500000'),
(5, 1, 8, 'spidol papan', 'spidol papan hitam', 5, '10000'),
(6, 1, 2, 'jk', 'ok', 1, '50000'),
(10, 1, 8, 'kertas HVS', '', 5, '180000'),
(11, 4, 8, 'Psikotes', '', 1, '0'),
(12, 4, 2, 'Beli Printer, Servis CPU, Servis UPS', 'Untuk Administrasi sekolah', 15, '0'),
(13, 6, 1, 'Program School Development', '', 15, '0');

-- --------------------------------------------------------

--
-- Table structure for table `keu_detilrekening`
--

CREATE TABLE IF NOT EXISTS `keu_detilrekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=351 ;

--
-- Dumping data for table `keu_detilrekening`
--

INSERT INTO `keu_detilrekening` (`replid`, `kategorirekening`, `kode`, `nama`, `keterangan`) VALUES
(342, 1, '100001', 'Kas Kecil', ''),
(6, 2, '111201', 'BCA ', ''),
(343, 1, '100002', 'Kas Masak', ''),
(18, 3, '111900', 'AYAT SILANG KAS DAN BANK', ''),
(19, 3, '112100', 'TABUNGAN', ''),
(20, 3, '112200', 'DEPOSITO BERJANGKA', ''),
(21, 3, '112300', 'SURAT-SURAT BERHARGA', ''),
(22, 3, '113100', 'PIUTANG USAHA', ''),
(23, 3, '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', ''),
(24, 3, '113300', 'PIUTANG CEK/GIRO MUNDUR', ''),
(25, 3, '113400', 'CADANGAN PIUTANG RAGU-RAGU', ''),
(26, 3, '113500', 'PIUTANG DIREKSI', ''),
(27, 3, '113600', 'PIUTANG KARYAWAN', ''),
(28, 3, '113700', 'PIUTANG PIHAK III', ''),
(29, 3, '113999', 'PIUTANG LAIN-LAIN', ''),
(30, 3, '114100', 'UANG MUKA PEMBELIAN', ''),
(31, 3, '114901', 'TANAH', ''),
(32, 3, '114902', 'KENDARAAN', ''),
(33, 3, '114903', 'MESIN DAN PERALATAN', ''),
(34, 3, '114904', 'BANGUNAN', ''),
(35, 3, '114905', 'INVENTARIS', ''),
(36, 3, '114906', 'UANG MUKA PERJALANAN', ''),
(37, 3, '114999', 'LAIN-LAIN', ''),
(38, 3, '116121', 'PPH PASAL 21', ''),
(39, 3, '116122', 'PPH PASAL 22', ''),
(40, 3, '116123', 'PPH PASAL 23', ''),
(41, 3, '116125', 'PPH PASAL 25', ''),
(42, 3, '116126', 'PPH PASAL 26', ''),
(43, 3, '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', ''),
(44, 3, '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', ''),
(45, 3, '116201', 'ASURANSI', ''),
(46, 3, '116202', 'SEWA', ''),
(47, 3, '116203', 'BUNGA LEASING', ''),
(48, 3, '116204', 'ONGKOS ANGKUT', ''),
(49, 3, '116299', 'LAIN-LAIN', ''),
(50, 3, '121000', 'PENYERTAAN DALAM SURAT BERHARGA', ''),
(51, 3, '122000', 'PENYERTAAN DALAM AKTIVA TETAP', ''),
(52, 3, '123000', 'PENYERTAAN LAIN-LAIN', ''),
(53, 3, '141100', 'TANAH KANTOR', ''),
(54, 3, '141251', 'PRASARANA JALAN', ''),
(55, 3, '141252', 'PRASARANA SALURAN AIR', ''),
(56, 3, '141253', 'PRASARANA TAMAN', ''),
(57, 3, '141301', 'INSTALASI LISTRIK', ''),
(58, 3, '141302', 'INSTALASI AIR', ''),
(59, 3, '141303', 'INSTALASI TELEPON', ''),
(60, 3, '141401', 'MESIN-MESIN', ''),
(61, 3, '141451', 'MESIN-MESIN LEASING', ''),
(62, 3, '141501', 'KENDARAAN', ''),
(63, 3, '141551', 'KENDARAAN LEASING KANTOR', ''),
(64, 3, '141601', 'INVENTARIS', ''),
(65, 3, '145201', 'AKUM. PENY. BANGUNAN KANTOR', ''),
(66, 3, '145202', 'AKUM. PENY. BANGUNAN KANTIN', ''),
(67, 3, '145203', 'AKUM. PENY. BANGUNAN MESS', ''),
(68, 3, '145251', 'AKUM. PENY. PRASARANA JALAN', ''),
(69, 3, '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', ''),
(70, 3, '145253', 'AKUM. PENY. PRASARANA TAMAN', ''),
(71, 3, '145301', 'AKUM. PENY. INSTALASI LISTRIK', ''),
(72, 3, '145302', 'AKUM. PENY. INSTALASI AIR', ''),
(73, 3, '145303', 'AKUM. PENY. INSTALASI TELPON', ''),
(74, 3, '145401', 'AKUM. PENY. KENDARAAN KANTOR', ''),
(75, 3, '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', ''),
(76, 3, '145501', 'AKUM. PENY. INVENTARIS KANTOR', ''),
(77, 3, '145502', 'AKUM. PENY. INVENTARIS KANTIN', ''),
(78, 3, '151000', 'GOODWILL', ''),
(79, 3, '152000', 'HAK PATEN', ''),
(80, 3, '153000', 'LISENSI', ''),
(81, 3, '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', ''),
(82, 3, '161101', 'BIAYA PENDIRIAN', ''),
(83, 3, '161102', 'GAJI, TUNJANGAN', ''),
(84, 3, '161103', 'BIAYA PERJALANAN DINAS', ''),
(85, 3, '161104', 'ALAT TULIS & KEPERLUAN KANTOR', ''),
(86, 3, '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', ''),
(87, 3, '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', ''),
(88, 3, '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', ''),
(89, 3, '161108', 'BENSIN, PARKIR, TOL', ''),
(90, 3, '161109', 'BIAYA ADMINISTRASI BANK', ''),
(91, 3, '161110', 'BAHAN PENOLONG', ''),
(92, 3, '161111', 'BIAYA IKLAN', ''),
(93, 3, '161112', 'PAJAK-PAJAK', ''),
(94, 3, '161113', 'REKENING LISTRIK, AIR', ''),
(95, 3, '161114', 'BIAYA STNK, BBN, DLL', ''),
(96, 3, '161115', 'BUNGA, FEE, PROVISI BANK, DLL', ''),
(97, 3, '161116', 'BIAYA PERESMIAN', ''),
(98, 3, '161117', 'BIAYA BAHAN BAKAR', ''),
(99, 3, '161118', 'REPARASI & PEMELIHARAAN KANTOR', ''),
(100, 3, '161119', 'TRAINING, SEMINAR, TEST, DLL', ''),
(101, 3, '161120', 'BIAYA MAKAN DAN MINUM', ''),
(102, 3, '161121', 'PPH PASAL 21', ''),
(103, 3, '161122', 'PPH PASAL 22', ''),
(104, 3, '161123', 'PPH PASAL 23', ''),
(105, 3, '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', ''),
(106, 3, '161125', 'REPARASI & PEMELIHARAAN MESS', ''),
(107, 3, '161126', 'REPARASI & PEMELIHARAAN TANKI', ''),
(108, 3, '161127', 'BIAYA PENGURUSAN LISTRIK', ''),
(109, 3, '161128', 'REPARASI & PEMELIHARAAN BOTOL', ''),
(110, 3, '161129', 'BIAYA SEWA GEDUNG', ''),
(111, 3, '161130', 'BIAYA BUNGA LEASING', ''),
(112, 3, '161143', 'SELISIH KURS', ''),
(113, 3, '161144', 'BIAYA BUNGA PINJAMAN', ''),
(114, 3, '161145', 'IURAN DAN ASURANSI', ''),
(115, 3, '161146', 'BIAYA KEAMANAN', ''),
(116, 3, '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', ''),
(117, 3, '161151', 'PENDAPATAN JASA GIRO', ''),
(118, 3, '161152', 'PENDAPATAN BUNGA DEPOSITO', ''),
(119, 3, '161153', 'PENDAPATAN BUNGA BANK', ''),
(120, 3, '161154', 'PENDAPATAN BUNGA PIHAK III', ''),
(121, 3, '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', ''),
(122, 3, '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', ''),
(123, 3, '162100', 'UANG JAMINAN LISTRIK', ''),
(124, 3, '162200', 'UANG JAMINAN TELEPON', ''),
(125, 3, '163000', 'BIAYA YANG DITANGGUHKAN', ''),
(126, 3, '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', ''),
(127, 3, '165201', 'BANGUNAN ', ''),
(128, 3, '165301', 'INSTALASI LISTRIK', ''),
(129, 3, '165302', 'INSTALASI AIR', ''),
(130, 3, '165303', 'INSTALASI TELEPON', ''),
(131, 3, '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', ''),
(132, 3, '169000', 'AKTIVA LAIN-LAIN', ''),
(133, 4, '211101', 'BANK', ''),
(134, 4, '211201', 'BANK', ''),
(135, 4, '211501', 'BANK', ''),
(136, 4, '211601', 'BANK', ''),
(137, 4, '212100', 'HUTANG USAHA', ''),
(138, 4, '212200', 'HUTANG YANG BELUM DIFAKTURKAN', ''),
(139, 4, '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', ''),
(140, 4, '212901', 'HUTANG PIHAK KETIGA', ''),
(141, 4, '212902', 'HUTANG PERSEDIAAN', ''),
(142, 4, '212903', 'HUTANG KENDARAAN', ''),
(143, 4, '212904', 'HUTANG BANGUNAN', ''),
(144, 4, '212905', 'HUTANG INVENTARIS', ''),
(145, 4, '212906', 'HUTANG VOUCHER', ''),
(146, 4, '212907', 'HUTANG KPD GKA ELYON', ''),
(147, 4, '212999', 'LAIN-LAIN', ''),
(148, 4, '213100', 'UANG MUKA PENJUALAN', ''),
(149, 4, '213900', 'UANG MUKA LAIN-LAIN', ''),
(150, 4, '214104', 'PPH PASAL 4 AYAT 2', ''),
(151, 4, '214121', 'PPH PASAL 21', ''),
(152, 4, '214122', 'PPH PASAL 22', ''),
(153, 4, '214123', 'PPH PASAL 23', ''),
(154, 4, '214125', 'PPH PASAL 25', ''),
(155, 4, '214126', 'PPH PASAL 26', ''),
(156, 4, '214129', 'PPH PASAL 29', ''),
(157, 4, '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', ''),
(158, 4, '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', ''),
(159, 4, '214201', 'BUNGA', ''),
(160, 4, '214202', 'SEWA', ''),
(161, 4, '214203', 'GAJI DAN HONOR', ''),
(162, 4, '214204', 'MAKAN DAN LEMBUR', ''),
(163, 4, '214205', 'LISTRIK', ''),
(164, 4, '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', ''),
(165, 4, '214207', 'TELEPON', ''),
(166, 4, '214208', 'SURAT KABAR/MAJALAH', ''),
(167, 4, '214209', 'KOMISI', ''),
(168, 4, '214210', 'BIAYA ADMINISTRASI BANK', ''),
(169, 4, '214211', 'PAJAK WAPU/WAJIB PUNGUT', ''),
(170, 4, '214212', 'JAMSOSTEK', ''),
(171, 4, '214213', 'PREMI DISTRIBUSI', ''),
(172, 4, '214214', 'ONGKOS ANGKUT', ''),
(173, 4, '214299', 'LAIN-LAIN', ''),
(174, 4, '215121', 'PPH PASAL 21', ''),
(175, 4, '215122', 'PPH PASAL 22', ''),
(176, 4, '215123', 'PPH PASAL 23', ''),
(177, 4, '215125', 'PPH PASAL 25', ''),
(178, 4, '215201', 'PPN KELUARAN', ''),
(179, 4, '215202', 'PPN EKS KEPPRES', ''),
(180, 4, '216101', 'HUTANG LEASING KENDARAAN', ''),
(181, 4, '219101', 'HUTANG DEVIDEN', ''),
(182, 4, '219199', 'LAIN-LAIN', ''),
(183, 4, '221101', 'BANK', ''),
(184, 4, '221201', 'BANK', ''),
(185, 4, '22210', 'HUTANG LEASING KENDARAAN', ''),
(186, 4, '223000', 'HUTANG PADA PEMEGANG SAHAM', ''),
(187, 4, '230000', 'HUTANG LAIN - LAIN', ''),
(188, 4, '240000', 'HUTANG YG. DISUBORDINASI', ''),
(189, 4, '250000', 'KEWAJIBAN BERSYARAT', ''),
(190, 5, '311101', 'TIDAK TERIKAT', ''),
(191, 5, '312101', 'TEMPORER...........', ''),
(192, 5, '312201', 'PERMANEN......', ''),
(194, 6, '400002', 'Tuition  fee', ''),
(195, 6, '400003', 'Material Fee', ''),
(196, 6, '400004', 'Ekskul Fee', ''),
(350, 6, '400005', 'Pendapatan denda', ''),
(204, 6, '400006', 'Penjualan Seragam', ''),
(205, 6, '400007', 'Pendapatan Penjualan Buku', ''),
(207, 6, '412108', 'PENDAPATAN LAIN-LAIN', ''),
(212, 6, '412113', 'PENDAPATAN UJIAN HSK', ''),
(219, 7, '511101', 'GAJI', ''),
(220, 7, '511102', 'HONOR', ''),
(221, 7, '511103', 'LEMBUR', ''),
(222, 7, '511104', 'PESANGON', ''),
(223, 7, '511105', 'UANG MAKAN', ''),
(224, 7, '511106', 'BONUS', ''),
(225, 7, '511107', 'TUNJANGAN HARI RAYA', ''),
(226, 7, '511108', 'PPH PASAL 21', ''),
(227, 7, '511109', 'KESEJAHTERAAN KARYAWAN', ''),
(228, 7, '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', ''),
(229, 7, '511111', 'JAMINAN KEMATIAN ( JKM )', ''),
(230, 7, '511112', 'JAMINAN HARI TUA ( JHT )', ''),
(231, 7, '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', ''),
(232, 7, '511114', 'TUNJANGAN DANA PENSIUN', ''),
(233, 7, '511115', 'TUNJANGAN KESEHATAN', ''),
(234, 7, '511116', 'TUNJANGAN TRANSPORT', ''),
(235, 7, '511117', 'Program sekolah', ''),
(236, 7, '511119', 'PREMI ', ''),
(237, 7, '511199', 'TUNJANGAN LAIN-LAIN', ''),
(238, 7, '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', ''),
(239, 7, '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', ''),
(240, 7, '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', ''),
(241, 7, '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', ''),
(242, 7, '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', ''),
(243, 7, '512202', 'PENYUSUTAN KENDARAAN', ''),
(244, 7, '512203', 'PENYUSUTAN INVENTARIS', ''),
(245, 7, '512204', 'PENYUSUTAN INSTALASI', ''),
(246, 7, '512301', 'TRANSPORTASI ( BENSIN, TIKET )', ''),
(247, 7, '512302', 'MAKANAN & MINUMAN', ''),
(248, 7, '512303', 'PENGINAPAN', ''),
(249, 7, '512304', 'UANG SAKU', ''),
(250, 7, '512399', 'LAIN-LAIN ( PARKIR, TOL )', ''),
(251, 7, '512401', 'SEWA BANGUNAN', ''),
(252, 7, '512402', 'SEWA KENDARAAN', ''),
(253, 7, '512403', 'SEWA INVENTARIS KANTOR', ''),
(254, 7, '512451', 'ASURANSI BANGUNAN', ''),
(255, 7, '512452', 'ASURANSI KENDARAAN', ''),
(256, 7, '512453', 'ASURANSI INVENTARIS', ''),
(257, 7, '512501', 'TELEPON', ''),
(258, 7, '512502', 'TELEX', ''),
(259, 7, '512503', 'TELEGRAM', ''),
(260, 7, '512504', 'INTERLOKAL NON TELEPON INTERN', ''),
(261, 7, '512505', 'FACSIMILE', ''),
(262, 7, '512599', 'LAIN - LAIN', ''),
(263, 7, '512601', 'AIR', ''),
(264, 7, '512602', 'LISTRIK', ''),
(265, 7, '512603', 'ALAT-ALAT LISTRIK', ''),
(266, 7, '512701', 'AKUNTAN', ''),
(267, 7, '512702', 'NOTARIS', ''),
(268, 7, '512703', 'KONSULTAN', ''),
(269, 7, '512704', 'MANAGEMENT FEE', ''),
(270, 7, '512801', 'ADMINISTRASI BANK', ''),
(271, 7, '512802', 'BUKU CEK / BG', ''),
(272, 7, '512803', 'TRANSFER, KIRIM UANG , INKASO', ''),
(273, 7, '512804', 'PAJAK BUNGA BANK', ''),
(274, 7, '512901', 'BIAYA ADMINISTRASI KENDARAAN', ''),
(275, 7, '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', ''),
(276, 7, '512903', 'BIAYA BUNGA KREDIT BANK', ''),
(277, 7, '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', ''),
(278, 7, '513102', 'PERANGKO, MATERAI, KIRIM SURAT', ''),
(279, 7, '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', ''),
(280, 7, '513104', 'ALAT - ALAT PENGAJARAN ', ''),
(281, 7, '513105', 'PERLENGKAPAN KELAS', ''),
(282, 7, '513106', 'JASA PEMBELAJARAN', ''),
(283, 7, '513201', 'PERIJINAN', ''),
(284, 7, '513202', 'PAJAK - PAJAK DAERAH,PBB', ''),
(285, 7, '513203', 'STNK', ''),
(286, 7, '513211', 'RETRIBUSI SAMPAH', ''),
(287, 7, '513301', 'SUMBANGAN', ''),
(288, 7, '513302', 'ENTERTAINMENT', ''),
(289, 7, '513303', 'JAMUAN ', ''),
(290, 7, '513401', 'KEAMANAN', ''),
(291, 7, '513501', 'PENDAFTARAN', ''),
(292, 7, '513502', 'IURAN', ''),
(293, 7, '513601', 'BIAYA PENGOBATAN', ''),
(294, 7, '513701', 'MAKANAN DAN MINUMAN', ''),
(295, 7, '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', ''),
(296, 7, '513703', 'SERAGAM ', ''),
(297, 7, '513704', 'SEWA DISPENSER', ''),
(298, 7, '513705', 'OLAH RAGA DAN KESENIAN', ''),
(299, 7, '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', ''),
(300, 7, '513707', 'BUKU, VCD', ''),
(301, 7, '513708', 'ATRIBUT SEKOLAH', ''),
(302, 7, '513709', 'BIAYA PSIKOTES', ''),
(303, 7, '513710', 'BIAYA ADVERTENSI ( IKLAN )', ''),
(304, 7, '513711', 'BIAYA STUDY TOUR', ''),
(305, 7, '513712', 'BIAYA PERLOMBAAN & PERAYAAN', ''),
(306, 7, '513713', 'STIKER U/ MURID', ''),
(307, 7, '513714', 'BIAYA TES KESEHATAN', ''),
(309, 7, '513716', 'BIAYA PAMERAN', ''),
(310, 7, '513799', 'LAIN - LAIN', ''),
(311, 7, '513801', 'KANTIN', ''),
(312, 7, '513802', 'DAPUR', ''),
(313, 7, '513803', 'BIAYA KEBERSIHAN', ''),
(314, 7, '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', ''),
(315, 7, '513805', 'JASA CLEANING SERVICE', ''),
(317, 7, '513807', 'BIAYA MESS', ''),
(318, 7, '513901', 'SELAMATAN', ''),
(319, 7, '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', ''),
(320, 7, '513903', 'DENDA PAJAK', ''),
(321, 7, '513904', 'KOREKSI TAHUN LALU', ''),
(323, 7, '513999', 'LAIN - LAIN (SELISIH KAS)', ''),
(324, 7, '514001', 'TRANSPORT', ''),
(325, 7, '514002', 'MAKAN & MINUM (RAPAT)', ''),
(326, 7, '514099', 'LAIN-LAIN', ''),
(327, 7, '514101', 'BUKU', ''),
(328, 7, '514102', 'VCD', ''),
(329, 7, '514103', 'SERAGAM ', ''),
(330, 7, '514104', 'ATRIBUT SEKOLAH', ''),
(331, 7, '514105', 'BIAYA PSIKOTES', ''),
(332, 7, '514106', 'BIAYA STUDY TOUR/FIELD TRIP', ''),
(333, 7, '514107', 'BIAYA PERLOMBAAN ', ''),
(334, 7, '514108', 'EKSTRAKURIKULER', ''),
(336, 7, '514110', 'BIAYA CHECK POINT', ''),
(337, 7, '514199', 'LAIN - LAIN', ''),
(341, 2, '111202', 'Bank Permata Sekolah', ''),
(344, 1, '100003', 'Kas Diknas', ''),
(345, 7, '514111', 'Biaya Peralatan Sekolah', ''),
(348, 2, '111203', 'Bank Permata Yayasan', ''),
(349, 6, '400001', 'Registration fee', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_detjenistrans`
--

CREATE TABLE IF NOT EXISTS `keu_detjenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistrans` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `bukti` char(3) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `keu_detjenistrans`
--

INSERT INTO `keu_detjenistrans` (`replid`, `jenistrans`, `nama`, `kode`, `bukti`) VALUES
(1, 2, 'pembayaran siswa aktif', 'in_siswa', 'BKM'),
(2, 2, 'pembayaran calon siswa', 'in_calonsiswa', 'BBM'),
(3, 2, 'pemasukan bank', 'in_bank', 'BBM'),
(4, 2, 'pemasukkan kas', 'in_come', 'BKM'),
(5, 3, 'pengeluaran barang', 'out_barang', 'BKK'),
(6, 3, 'pengeluaran bank', 'out_bank', 'BBK'),
(7, 3, 'pengeluaran kas', 'out_come', 'BKK'),
(8, 1, 'junal umum', 'ju', 'MMJ');

-- --------------------------------------------------------

--
-- Table structure for table `keu_grupbrg`
--

CREATE TABLE IF NOT EXISTS `keu_grupbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_grupbrg`
--

INSERT INTO `keu_grupbrg` (`replid`, `nama`, `keterangan`) VALUES
(1, 'Elektronika', ''),
(2, 'Kendaraan', ''),
(3, 'Alat Tulis', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_jenistrans`
--

CREATE TABLE IF NOT EXISTS `keu_jenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_jenistrans`
--

INSERT INTO `keu_jenistrans` (`replid`, `nama`, `kode`) VALUES
(1, 'jurnal umum', 'ju'),
(2, 'pemasukkan', 'in'),
(3, 'pengeluaran', 'out');

-- --------------------------------------------------------

--
-- Table structure for table `keu_jurnal`
--

CREATE TABLE IF NOT EXISTS `keu_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi` int(10) unsigned NOT NULL,
  `rek` int(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `jenis` char(1) NOT NULL,
  `debet` double(14,0) NOT NULL DEFAULT '0',
  `kredit` double(14,0) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1195 ;

--
-- Dumping data for table `keu_jurnal`
--

INSERT INTO `keu_jurnal` (`replid`, `transaksi`, `rek`, `nominal`, `jenis`, `debet`, `kredit`, `ts`) VALUES
(1171, 1, 83, '80000', 'k', 0, 0, '2015-05-25 08:47:11'),
(1172, 1, 1, '80000', 'd', 0, 0, '2015-05-25 08:47:11'),
(1173, 2, 83, '15000', 'd', 0, 0, '2015-05-25 08:47:58'),
(1174, 2, 1, '15000', 'k', 0, 0, '2015-05-25 08:47:58'),
(1175, 3, 222, '35000', 'd', 0, 0, '2015-05-25 08:56:14'),
(1176, 3, 6, '35000', 'k', 0, 0, '2015-05-25 08:56:14'),
(1177, 4, 203, '70000', 'k', 0, 0, '2015-05-25 09:00:10'),
(1178, 4, 1, '70000', 'd', 0, 0, '2015-05-25 09:00:10'),
(1179, 5, 1, '50000', 'd', 0, 0, '2015-05-25 23:08:09'),
(1180, 5, 22, '50000', 'k', 0, 0, '2015-05-25 23:08:09'),
(1181, 5, 25, '5000', 'k', 0, 0, '2015-05-25 23:08:59'),
(1182, 5, 3, '5000', 'd', 0, 0, '2015-05-25 23:09:00'),
(1183, 6, 193, '500000', 'k', 0, 0, '2015-06-04 23:29:17'),
(1184, 6, 1, '500000', 'd', 0, 0, '2015-06-04 23:29:17'),
(1194, 11, 341, '3720000', 'k', 0, 0, '2015-08-24 06:18:37'),
(1193, 11, 345, '3720000', 'd', 0, 0, '2015-08-24 06:18:37'),
(1189, 9, 235, '5500000', 'd', 0, 0, '2015-08-24 05:48:45'),
(1190, 9, 341, '5500000', 'k', 0, 0, '2015-08-24 05:48:45');

-- --------------------------------------------------------

--
-- Table structure for table `keu_kategorianggaran`
--

CREATE TABLE IF NOT EXISTS `keu_kategorianggaran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) NOT NULL,
  `rekening` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `keu_kategorianggaran`
--

INSERT INTO `keu_kategorianggaran` (`replid`, `departemen`, `rekening`, `nama`, `keterangan`) VALUES
(1, 1, 5, 'ATK', 'alat tulis kantor'),
(2, 1, 1, 'lingkungan', 'dana perwatan lingkungan sekolah'),
(3, 1, 2, 'kesiswaan', 'dana kegiatan ekstrakurikuler siswa'),
(4, 1, 345, 'Peralatan Sekolah', ''),
(5, 1, 219, 'Gaji', ''),
(6, 1, 235, 'Program school development', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_kategorirek`
--

CREATE TABLE IF NOT EXISTS `keu_kategorirek` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `keu_kategorirek`
--

INSERT INTO `keu_kategorirek` (`replid`, `kode`, `nama`) VALUES
(1, 1, 'KAS'),
(2, 1, 'BANK'),
(3, 1, 'AKTIVA'),
(4, 2, 'KEWAJIBAN'),
(5, 3, 'MODAL'),
(6, 4, 'PENDAPATAN'),
(7, 5, 'BIAYA');

-- --------------------------------------------------------

--
-- Table structure for table `keu_kategorirekening`
--

CREATE TABLE IF NOT EXISTS `keu_kategorirekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  `jenis` enum('d','k') NOT NULL,
  `jenistambah` enum('d','k') NOT NULL,
  `jeniskurang` enum('d','k') NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `keu_kategorirekening`
--

INSERT INTO `keu_kategorirekening` (`replid`, `kode`, `nama`, `jenis`, `jenistambah`, `jeniskurang`) VALUES
(1, 1, 'KAS', 'd', 'd', 'k'),
(2, 1, 'BANK', 'd', 'd', 'k'),
(3, 1, 'AKTIVA', 'd', 'd', 'k'),
(4, 2, 'KEWAJIBAN', 'k', 'k', 'd'),
(5, 3, 'MODAL', 'k', 'k', 'd'),
(6, 4, 'PENDAPATAN', 'k', 'k', 'd'),
(7, 5, 'BIAYA', 'd', 'd', 'k');

-- --------------------------------------------------------

--
-- Table structure for table `keu_katmodulpembayaran`
--

CREATE TABLE IF NOT EXISTS `keu_katmodulpembayaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `siswa` enum('aktif','calon') DEFAULT NULL,
  `sifat` enum('wajib','sukarela') DEFAULT NULL,
  `keterangan` text NOT NULL,
  `detjenistrans` int(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_katmodulpembayaran`
--

INSERT INTO `keu_katmodulpembayaran` (`replid`, `nama`, `siswa`, `sifat`, `keterangan`, `detjenistrans`) VALUES
(1, 'Tuition Fee', 'aktif', 'wajib', 'uang per semester (spp)', 1),
(2, 'Registration', 'aktif', 'wajib', 'uang pendaftaran (uang gedung)', 1),
(3, 'Material Fee', 'aktif', 'wajib', 'material fee', 1);

-- --------------------------------------------------------

--
-- Table structure for table `keu_kelompokbrg`
--

CREATE TABLE IF NOT EXISTS `keu_kelompokbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grupbrg` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `keu_kelompokbrg`
--

INSERT INTO `keu_kelompokbrg` (`replid`, `grupbrg`, `nama`) VALUES
(1, 1, 'Komputer'),
(2, 1, 'Proyektor'),
(3, 2, 'Mobil'),
(4, 2, 'Motor'),
(5, 2, 'Sepeda'),
(6, 3, 'bulpoin');

-- --------------------------------------------------------

--
-- Table structure for table `keu_modul`
--

CREATE TABLE IF NOT EXISTS `keu_modul` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `keu_modul`
--

INSERT INTO `keu_modul` (`replid`, `kategori`, `reftipe`, `refid`, `nama`, `rek1`, `rek2`, `rek3`, `nominal`, `cicilan`, `keterangan`) VALUES
(2, 3, 2, 2, 'Pendaftaran Tahun Ajaran 2014-2015', 14, 0, 0, '0', '0', ''),
(3, 3, 2, 2, 'Pendaftaran Tahun Ajaran 2014-2015', 6, 194, 0, '0', '0', 'Kaitlynn Tiffany'),
(4, 1, 3, 3, 'Uang pangkal angkatan 2013', 6, 194, 29, '0', '0', 'DPP'),
(5, 1, 1, 1, 'Uang sekolah tahun ajaran 2014-2015 (Aktif)', 1, 203, 29, '0', '0', ''),
(6, 1, 3, 8, 'Uang pangkal angkatan 2016', 3, 4, 3, '0', '0', ''),
(7, 1, 3, 2, 'Uang pangkal angkatan 2014', 1, 1, 1, '0', '0', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `keu_modulpembayaran`
--

CREATE TABLE IF NOT EXISTS `keu_modulpembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katmodulpembayaran` int(11) NOT NULL DEFAULT '0',
  `angkatan` int(10) NOT NULL DEFAULT '0',
  `semester` int(11) NOT NULL,
  `bulan` int(2) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `keu_modulpembayaran`
--

INSERT INTO `keu_modulpembayaran` (`replid`, `katmodulpembayaran`, `angkatan`, `semester`, `bulan`, `nama`, `rek1`, `rek2`, `rek3`, `keterangan`) VALUES
(41, 2, 1, 0, 0, 'Registration Angkatan 2015', 1, 194, 22, 'keterangan '),
(42, 3, 1, 18, 0, 'Material Fee Semester 1 Th. Ajaran 2015-2016', 1, 203, 0, ''),
(45, 3, 1, 2, 0, 'Material Fee Semester 2 Th. Ajaran 2015-2016', 1, 0, 0, ''),
(44, 1, 1, 18, 7, 'Tuition Fee Semester 1 th. Ajaran 2015-2016', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_nominalanggaran`
--

CREATE TABLE IF NOT EXISTS `keu_nominalanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(10) NOT NULL,
  `bulan` int(2) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=351 ;

--
-- Dumping data for table `keu_nominalanggaran`
--

INSERT INTO `keu_nominalanggaran` (`replid`, `detilanggaran`, `bulan`, `nominal`) VALUES
(203, 37, 1, 10000000000),
(204, 37, 2, 10000000000),
(205, 37, 3, 10000000000),
(206, 37, 4, 10000000000),
(207, 37, 5, 10000000000),
(208, 37, 6, 10000000000),
(209, 37, 7, 10000000000),
(210, 37, 8, 10000000000),
(211, 37, 9, 10000000000),
(212, 37, 10, 10000000000),
(213, 37, 11, 10000000000),
(214, 37, 12, 10000000000),
(231, 39, 1, 46250),
(232, 39, 2, 46250),
(233, 39, 3, 46250),
(234, 39, 4, 46250),
(235, 39, 5, 46250),
(236, 39, 6, 46250),
(237, 39, 7, 46250),
(238, 39, 8, 46250),
(239, 39, 9, 46250),
(240, 39, 10, 46250),
(241, 39, 11, 46250),
(242, 39, 12, 46250),
(243, 40, 1, 10000),
(244, 40, 2, 10000),
(245, 40, 3, 10000),
(246, 40, 4, 10000),
(247, 40, 5, 10000),
(248, 40, 6, 10000),
(249, 40, 7, 10000),
(250, 40, 8, 10000),
(251, 40, 9, 10000),
(252, 40, 10, 10000),
(253, 40, 11, 10000),
(254, 40, 12, 10000),
(255, 41, 1, 30000),
(256, 41, 2, 30000),
(257, 41, 3, 30000),
(258, 41, 4, 30000),
(259, 41, 5, 30000),
(260, 41, 6, 30000),
(261, 41, 7, 30000),
(262, 41, 8, 30000),
(263, 41, 9, 30000),
(264, 41, 10, 30000),
(265, 41, 11, 30000),
(266, 41, 12, 30000),
(267, 42, 1, 1000000),
(268, 42, 2, 1000000),
(269, 42, 3, 1000000),
(270, 42, 4, 1000000),
(271, 42, 5, 1000000),
(272, 42, 6, 1000000),
(273, 42, 7, 1000000),
(274, 42, 8, 1000000),
(275, 42, 9, 1000000),
(276, 42, 10, 1000000),
(277, 42, 11, 1000000),
(278, 42, 12, 1000000),
(279, 43, 1, 20833333),
(280, 43, 2, 20833333),
(281, 43, 3, 20833333),
(282, 43, 4, 20833333),
(283, 43, 5, 20833333),
(284, 43, 6, 20833333),
(285, 43, 7, 20833333),
(286, 43, 8, 20833333),
(287, 43, 9, 20833333),
(288, 43, 10, 20833333),
(289, 43, 11, 20833333),
(290, 43, 12, 20833333),
(291, 44, 1, 416667),
(292, 44, 2, 416667),
(293, 44, 3, 416667),
(294, 44, 4, 416667),
(295, 44, 5, 416667),
(296, 44, 6, 416667),
(297, 44, 7, 416667),
(298, 44, 8, 416667),
(299, 44, 9, 416667),
(300, 44, 10, 416667),
(301, 44, 11, 416667),
(302, 44, 12, 416667),
(303, 45, 1, 10000),
(304, 45, 2, 10000),
(305, 45, 3, 10000),
(306, 45, 4, 10000),
(307, 45, 5, 10000),
(308, 45, 6, 10000),
(309, 45, 7, 10000),
(310, 45, 8, 10000),
(311, 45, 9, 10000),
(312, 45, 10, 10000),
(313, 45, 11, 10000),
(314, 45, 12, 10000),
(315, 0, 1, 0),
(316, 0, 2, 0),
(317, 0, 3, 0),
(318, 0, 4, 0),
(319, 0, 5, 0),
(320, 0, 6, 0),
(321, 0, 7, 0),
(322, 0, 8, 0),
(323, 0, 9, 0),
(324, 0, 10, 0),
(325, 0, 11, 54433360),
(326, 0, 12, 7675540),
(327, 12, 1, 310000),
(328, 12, 2, 310000),
(329, 12, 3, 310000),
(330, 12, 4, 310000),
(331, 12, 5, 310000),
(332, 12, 6, 310000),
(333, 12, 7, 310000),
(334, 12, 8, 310000),
(335, 12, 9, 310000),
(336, 12, 10, 310000),
(337, 12, 11, 310000),
(338, 12, 12, 310000),
(339, 13, 1, 0),
(340, 13, 2, 0),
(341, 13, 3, 0),
(342, 13, 4, 0),
(343, 13, 5, 0),
(344, 13, 6, 0),
(345, 13, 7, 0),
(346, 13, 8, 5500000),
(347, 13, 9, 0),
(348, 13, 10, 0),
(349, 13, 11, 0),
(350, 13, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keu_pembayaran`
--

CREATE TABLE IF NOT EXISTS `keu_pembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modul` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `lunas` enum('0','1') NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3653 ;

-- --------------------------------------------------------

--
-- Table structure for table `keu_penerimaan`
--

CREATE TABLE IF NOT EXISTS `keu_penerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keu_penerimaanbrg`
--

CREATE TABLE IF NOT EXISTS `keu_penerimaanbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomerbukti` varchar(100) NOT NULL,
  `kodebrg` varchar(50) NOT NULL,
  `namabrg` varchar(100) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `satuan` varchar(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `keu_penerimaanbrg`
--

INSERT INTO `keu_penerimaanbrg` (`replid`, `nomerbukti`, `kodebrg`, `namabrg`, `unit`, `satuan`, `nominal`) VALUES
(1, 'AAA', 'ELKO001', '', 2, 'unit', '0'),
(2, 'BBB', '101', '', 1, 'unit', '20000'),
(3, 'AA001', 'ELKO001', 'Macbook pro 15 inch', 2, 'unit', '12000000'),
(4, 'BB101', 'KEMTR0001', 'Supra X 125', 1, 'unit', '15000000'),
(5, 'AS989', 'ELKO001', 'Macbook pro 15 inch', 1, 'unit', '12000000'),
(6, 'ASD123', 'KEMTR0001', 'Supra X 125', 1, 'unit', '18000000'),
(7, 'ASDW123', 'ELKO001', 'Macbook pro 15 inch', 1, 'unit', '12000000');

-- --------------------------------------------------------

--
-- Table structure for table `keu_rekening`
--

CREATE TABLE IF NOT EXISTS `keu_rekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirek` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=342 ;

--
-- Dumping data for table `keu_rekening`
--

INSERT INTO `keu_rekening` (`replid`, `kategorirek`, `kode`, `nama`, `nominal`, `keterangan`) VALUES
(1, 1, '111101', 'KAS KECIL ', NULL, ''),
(2, 1, '111102', 'KAS SATELIT', NULL, ''),
(3, 1, '111103', 'KAS KERTAJAYA', NULL, ''),
(4, 1, '111104', 'KAS RUNGKUT', NULL, ''),
(5, 1, '111199', 'KAS DALAM PERJALANAN', NULL, ''),
(6, 2, '111201', 'BCA AC NO. 5560060001', NULL, ''),
(7, 2, '111202', 'BANK EKONOMI AC NO. 3031861275', NULL, ''),
(8, 2, '111203', 'BCA AC NO. 4683800000', NULL, ''),
(9, 2, '111204', 'DEPOSITO EKONOMI', NULL, ''),
(10, 2, '111205', 'BANK MAYAPADA AC NO.201.300.17.000', NULL, ''),
(11, 2, '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', NULL, ''),
(12, 2, '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', NULL, ''),
(13, 2, '111208', 'DEPOSITO PANINBANK', NULL, ''),
(14, 2, '111209', 'PANINBANK AC NO.448.50.8888.7', NULL, ''),
(15, 2, '111210', 'MANDARI AC NO. 1420088800098', NULL, ''),
(16, 2, '111211', 'BANK BCA 8290960101', NULL, ''),
(17, 2, '111299', 'BANK DALAM PERJALANAN', NULL, ''),
(18, 3, '111900', 'AYAT SILANG KAS DAN BANK', NULL, ''),
(19, 3, '112100', 'TABUNGAN', NULL, ''),
(20, 3, '112200', 'DEPOSITO BERJANGKA', NULL, ''),
(21, 3, '112300', 'SURAT-SURAT BERHARGA', NULL, ''),
(22, 3, '113100', 'PIUTANG USAHA', NULL, ''),
(23, 3, '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', NULL, ''),
(24, 3, '113300', 'PIUTANG CEK/GIRO MUNDUR', NULL, ''),
(25, 3, '113400', 'CADANGAN PIUTANG RAGU-RAGU', NULL, ''),
(26, 3, '113500', 'PIUTANG DIREKSI', NULL, ''),
(27, 3, '113600', 'PIUTANG KARYAWAN', NULL, ''),
(28, 3, '113700', 'PIUTANG PIHAK III', NULL, ''),
(29, 3, '113999', 'PIUTANG LAIN-LAIN', NULL, ''),
(30, 3, '114100', 'UANG MUKA PEMBELIAN', NULL, ''),
(31, 3, '114901', 'TANAH', NULL, ''),
(32, 3, '114902', 'KENDARAAN', NULL, ''),
(33, 3, '114903', 'MESIN DAN PERALATAN', NULL, ''),
(34, 3, '114904', 'BANGUNAN', NULL, ''),
(35, 3, '114905', 'INVENTARIS', NULL, ''),
(36, 3, '114906', 'UANG MUKA PERJALANAN', NULL, ''),
(37, 3, '114999', 'LAIN-LAIN', NULL, ''),
(38, 3, '116121', 'PPH PASAL 21', NULL, ''),
(39, 3, '116122', 'PPH PASAL 22', NULL, ''),
(40, 3, '116123', 'PPH PASAL 23', NULL, ''),
(41, 3, '116125', 'PPH PASAL 25', NULL, ''),
(42, 3, '116126', 'PPH PASAL 26', NULL, ''),
(43, 3, '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', NULL, ''),
(44, 3, '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', NULL, ''),
(45, 3, '116201', 'ASURANSI', NULL, ''),
(46, 3, '116202', 'SEWA', NULL, ''),
(47, 3, '116203', 'BUNGA LEASING', NULL, ''),
(48, 3, '116204', 'ONGKOS ANGKUT', NULL, ''),
(49, 3, '116299', 'LAIN-LAIN', NULL, ''),
(50, 3, '121000', 'PENYERTAAN DALAM SURAT BERHARGA', NULL, ''),
(51, 3, '122000', 'PENYERTAAN DALAM AKTIVA TETAP', NULL, ''),
(52, 3, '123000', 'PENYERTAAN LAIN-LAIN', NULL, ''),
(53, 3, '141100', 'TANAH KANTOR', NULL, ''),
(54, 3, '141251', 'PRASARANA JALAN', NULL, ''),
(55, 3, '141252', 'PRASARANA SALURAN AIR', NULL, ''),
(56, 3, '141253', 'PRASARANA TAMAN', NULL, ''),
(57, 3, '141301', 'INSTALASI LISTRIK', NULL, ''),
(58, 3, '141302', 'INSTALASI AIR', NULL, ''),
(59, 3, '141303', 'INSTALASI TELEPON', NULL, ''),
(60, 3, '141401', 'MESIN-MESIN', NULL, ''),
(61, 3, '141451', 'MESIN-MESIN LEASING', NULL, ''),
(62, 3, '141501', 'KENDARAAN', NULL, ''),
(63, 3, '141551', 'KENDARAAN LEASING KANTOR', NULL, ''),
(64, 3, '141601', 'INVENTARIS', NULL, ''),
(65, 3, '145201', 'AKUM. PENY. BANGUNAN KANTOR', NULL, ''),
(66, 3, '145202', 'AKUM. PENY. BANGUNAN KANTIN', NULL, ''),
(67, 3, '145203', 'AKUM. PENY. BANGUNAN MESS', NULL, ''),
(68, 3, '145251', 'AKUM. PENY. PRASARANA JALAN', NULL, ''),
(69, 3, '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', NULL, ''),
(70, 3, '145253', 'AKUM. PENY. PRASARANA TAMAN', NULL, ''),
(71, 3, '145301', 'AKUM. PENY. INSTALASI LISTRIK', NULL, ''),
(72, 3, '145302', 'AKUM. PENY. INSTALASI AIR', NULL, ''),
(73, 3, '145303', 'AKUM. PENY. INSTALASI TELPON', NULL, ''),
(74, 3, '145401', 'AKUM. PENY. KENDARAAN KANTOR', NULL, ''),
(75, 3, '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', NULL, ''),
(76, 3, '145501', 'AKUM. PENY. INVENTARIS KANTOR', NULL, ''),
(77, 3, '145502', 'AKUM. PENY. INVENTARIS KANTIN', NULL, ''),
(78, 3, '151000', 'GOODWILL', NULL, ''),
(79, 3, '152000', 'HAK PATEN', NULL, ''),
(80, 3, '153000', 'LISENSI', NULL, ''),
(81, 3, '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', NULL, ''),
(82, 3, '161101', 'BIAYA PENDIRIAN', NULL, ''),
(83, 3, '161102', 'GAJI, TUNJANGAN', NULL, ''),
(84, 3, '161103', 'BIAYA PERJALANAN DINAS', NULL, ''),
(85, 3, '161104', 'ALAT TULIS & KEPERLUAN KANTOR', NULL, ''),
(86, 3, '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', NULL, ''),
(87, 3, '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', NULL, ''),
(88, 3, '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', NULL, ''),
(89, 3, '161108', 'BENSIN, PARKIR, TOL', NULL, ''),
(90, 3, '161109', 'BIAYA ADMINISTRASI BANK', NULL, ''),
(91, 3, '161110', 'BAHAN PENOLONG', NULL, ''),
(92, 3, '161111', 'BIAYA IKLAN', NULL, ''),
(93, 3, '161112', 'PAJAK-PAJAK', NULL, ''),
(94, 3, '161113', 'REKENING LISTRIK, AIR', NULL, ''),
(95, 3, '161114', 'BIAYA STNK, BBN, DLL', NULL, ''),
(96, 3, '161115', 'BUNGA, FEE, PROVISI BANK, DLL', NULL, ''),
(97, 3, '161116', 'BIAYA PERESMIAN', NULL, ''),
(98, 3, '161117', 'BIAYA BAHAN BAKAR', NULL, ''),
(99, 3, '161118', 'REPARASI & PEMELIHARAAN KANTOR', NULL, ''),
(100, 3, '161119', 'TRAINING, SEMINAR, TEST, DLL', NULL, ''),
(101, 3, '161120', 'BIAYA MAKAN DAN MINUM', NULL, ''),
(102, 3, '161121', 'PPH PASAL 21', NULL, ''),
(103, 3, '161122', 'PPH PASAL 22', NULL, ''),
(104, 3, '161123', 'PPH PASAL 23', NULL, ''),
(105, 3, '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', NULL, ''),
(106, 3, '161125', 'REPARASI & PEMELIHARAAN MESS', NULL, ''),
(107, 3, '161126', 'REPARASI & PEMELIHARAAN TANKI', NULL, ''),
(108, 3, '161127', 'BIAYA PENGURUSAN LISTRIK', NULL, ''),
(109, 3, '161128', 'REPARASI & PEMELIHARAAN BOTOL', NULL, ''),
(110, 3, '161129', 'BIAYA SEWA GEDUNG', NULL, ''),
(111, 3, '161130', 'BIAYA BUNGA LEASING', NULL, ''),
(112, 3, '161143', 'SELISIH KURS', NULL, ''),
(113, 3, '161144', 'BIAYA BUNGA PINJAMAN', NULL, ''),
(114, 3, '161145', 'IURAN DAN ASURANSI', NULL, ''),
(115, 3, '161146', 'BIAYA KEAMANAN', NULL, ''),
(116, 3, '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', NULL, ''),
(117, 3, '161151', 'PENDAPATAN JASA GIRO', NULL, ''),
(118, 3, '161152', 'PENDAPATAN BUNGA DEPOSITO', NULL, ''),
(119, 3, '161153', 'PENDAPATAN BUNGA BANK', NULL, ''),
(120, 3, '161154', 'PENDAPATAN BUNGA PIHAK III', NULL, ''),
(121, 3, '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', NULL, ''),
(122, 3, '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', NULL, ''),
(123, 3, '162100', 'UANG JAMINAN LISTRIK', NULL, ''),
(124, 3, '162200', 'UANG JAMINAN TELEPON', NULL, ''),
(125, 3, '163000', 'BIAYA YANG DITANGGUHKAN', NULL, ''),
(126, 3, '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', NULL, ''),
(127, 3, '165201', 'BANGUNAN ', NULL, ''),
(128, 3, '165301', 'INSTALASI LISTRIK', NULL, ''),
(129, 3, '165302', 'INSTALASI AIR', NULL, ''),
(130, 3, '165303', 'INSTALASI TELEPON', NULL, ''),
(131, 3, '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', NULL, ''),
(132, 3, '169000', 'AKTIVA LAIN-LAIN', NULL, ''),
(133, 4, '211101', 'BANK', NULL, ''),
(134, 4, '211201', 'BANK', NULL, ''),
(135, 4, '211501', 'BANK', NULL, ''),
(136, 4, '211601', 'BANK', NULL, ''),
(137, 4, '212100', 'HUTANG USAHA', NULL, ''),
(138, 4, '212200', 'HUTANG YANG BELUM DIFAKTURKAN', NULL, ''),
(139, 4, '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', NULL, ''),
(140, 4, '212901', 'HUTANG PIHAK KETIGA', NULL, ''),
(141, 4, '212902', 'HUTANG PERSEDIAAN', NULL, ''),
(142, 4, '212903', 'HUTANG KENDARAAN', NULL, ''),
(143, 4, '212904', 'HUTANG BANGUNAN', NULL, ''),
(144, 4, '212905', 'HUTANG INVENTARIS', NULL, ''),
(145, 4, '212906', 'HUTANG VOUCHER', NULL, ''),
(146, 4, '212907', 'HUTANG KPD GKA ELYON', NULL, ''),
(147, 4, '212999', 'LAIN-LAIN', NULL, ''),
(148, 4, '213100', 'UANG MUKA PENJUALAN', NULL, ''),
(149, 4, '213900', 'UANG MUKA LAIN-LAIN', NULL, ''),
(150, 4, '214104', 'PPH PASAL 4 AYAT 2', NULL, ''),
(151, 4, '214121', 'PPH PASAL 21', NULL, ''),
(152, 4, '214122', 'PPH PASAL 22', NULL, ''),
(153, 4, '214123', 'PPH PASAL 23', NULL, ''),
(154, 4, '214125', 'PPH PASAL 25', NULL, ''),
(155, 4, '214126', 'PPH PASAL 26', NULL, ''),
(156, 4, '214129', 'PPH PASAL 29', NULL, ''),
(157, 4, '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', NULL, ''),
(158, 4, '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', NULL, ''),
(159, 4, '214201', 'BUNGA', NULL, ''),
(160, 4, '214202', 'SEWA', NULL, ''),
(161, 4, '214203', 'GAJI DAN HONOR', NULL, ''),
(162, 4, '214204', 'MAKAN DAN LEMBUR', NULL, ''),
(163, 4, '214205', 'LISTRIK', NULL, ''),
(164, 4, '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', NULL, ''),
(165, 4, '214207', 'TELEPON', NULL, ''),
(166, 4, '214208', 'SURAT KABAR/MAJALAH', NULL, ''),
(167, 4, '214209', 'KOMISI', NULL, ''),
(168, 4, '214210', 'BIAYA ADMINISTRASI BANK', NULL, ''),
(169, 4, '214211', 'PAJAK WAPU/WAJIB PUNGUT', NULL, ''),
(170, 4, '214212', 'JAMSOSTEK', NULL, ''),
(171, 4, '214213', 'PREMI DISTRIBUSI', NULL, ''),
(172, 4, '214214', 'ONGKOS ANGKUT', NULL, ''),
(173, 4, '214299', 'LAIN-LAIN', NULL, ''),
(174, 4, '215121', 'PPH PASAL 21', NULL, ''),
(175, 4, '215122', 'PPH PASAL 22', NULL, ''),
(176, 4, '215123', 'PPH PASAL 23', NULL, ''),
(177, 4, '215125', 'PPH PASAL 25', NULL, ''),
(178, 4, '215201', 'PPN KELUARAN', NULL, ''),
(179, 4, '215202', 'PPN EKS KEPPRES', NULL, ''),
(180, 4, '216101', 'HUTANG LEASING KENDARAAN', NULL, ''),
(181, 4, '219101', 'HUTANG DEVIDEN', NULL, ''),
(182, 4, '219199', 'LAIN-LAIN', NULL, ''),
(183, 4, '221101', 'BANK', NULL, ''),
(184, 4, '221201', 'BANK', NULL, ''),
(185, 4, '22210', 'HUTANG LEASING KENDARAAN', NULL, ''),
(186, 4, '223000', 'HUTANG PADA PEMEGANG SAHAM', NULL, ''),
(187, 4, '230000', 'HUTANG LAIN - LAIN', NULL, ''),
(188, 4, '240000', 'HUTANG YG. DISUBORDINASI', NULL, ''),
(189, 4, '250000', 'KEWAJIBAN BERSYARAT', NULL, ''),
(190, 5, '311101', 'TIDAK TERIKAT', NULL, ''),
(191, 5, '312101', 'TEMPORER...........', NULL, ''),
(192, 5, '312201', 'PERMANEN......', NULL, ''),
(193, 6, '411101', 'DANA DARI DONATUR', NULL, ''),
(194, 6, '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', NULL, ''),
(195, 6, '411103', 'DANA JOINING', NULL, ''),
(196, 6, '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', NULL, ''),
(197, 6, '411105', 'DANA STUDENT EXCHANGE', NULL, ''),
(198, 6, '411201', 'SUMBANGAN TERIKAT TEMPORER', NULL, ''),
(199, 6, '411202', 'SUMBANGAN TERIKAT PERMANEN', NULL, ''),
(200, 6, '412101', 'PENJUALAN FORMULIR + PSIKOTES', NULL, ''),
(201, 6, '412102', 'UANG KEG. EKSTRAKURIKULER', NULL, ''),
(202, 6, '412103', 'UANG PENDAFTARAN ULANG', NULL, ''),
(203, 6, '412104', 'UANG SEKOLAH', NULL, ''),
(204, 6, '412105', 'PENDAPATAN PENJUALAN SERAGAM', NULL, ''),
(205, 6, '412106', 'PENDAPATAN PENJUALAN BUKU', NULL, ''),
(206, 6, '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', NULL, ''),
(207, 6, '412108', 'PENDAPATAN LAIN-LAIN', NULL, ''),
(208, 6, '412109', 'PENDAPATAN LUNCH', NULL, ''),
(209, 6, '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', NULL, ''),
(210, 6, '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', NULL, ''),
(211, 6, '412112', 'PENDAPATAN CHECK POINT', NULL, ''),
(212, 6, '412113', 'PENDAPATAN UJIAN HSK', NULL, ''),
(213, 6, '412114', 'PENDAPATAN DAY CARE', NULL, ''),
(214, 6, '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', NULL, ''),
(215, 6, '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', NULL, ''),
(216, 6, '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', NULL, ''),
(217, 6, '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', NULL, ''),
(218, 6, '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', NULL, ''),
(219, 7, '511101', 'GAJI', NULL, ''),
(220, 7, '511102', 'HONOR', NULL, ''),
(221, 7, '511103', 'LEMBUR', NULL, ''),
(222, 7, '511104', 'PESANGON', NULL, ''),
(223, 7, '511105', 'UANG MAKAN', NULL, ''),
(224, 7, '511106', 'BONUS', NULL, ''),
(225, 7, '511107', 'TUNJANGAN HARI RAYA', NULL, ''),
(226, 7, '511108', 'PPH PASAL 21', NULL, ''),
(227, 7, '511109', 'KESEJAHTERAAN KARYAWAN', NULL, ''),
(228, 7, '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', NULL, ''),
(229, 7, '511111', 'JAMINAN KEMATIAN ( JKM )', NULL, ''),
(230, 7, '511112', 'JAMINAN HARI TUA ( JHT )', NULL, ''),
(231, 7, '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', NULL, ''),
(232, 7, '511114', 'TUNJANGAN DANA PENSIUN', NULL, ''),
(233, 7, '511115', 'TUNJANGAN KESEHATAN', NULL, ''),
(234, 7, '511116', 'TUNJANGAN TRANSPORT', NULL, ''),
(235, 7, '511117', 'JAMSOSTEK', NULL, ''),
(236, 7, '511119', 'PREMI ', NULL, ''),
(237, 7, '511199', 'TUNJANGAN LAIN-LAIN', NULL, ''),
(238, 7, '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', NULL, ''),
(239, 7, '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', NULL, ''),
(240, 7, '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', NULL, ''),
(241, 7, '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', NULL, ''),
(242, 7, '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', NULL, ''),
(243, 7, '512202', 'PENYUSUTAN KENDARAAN', NULL, ''),
(244, 7, '512203', 'PENYUSUTAN INVENTARIS', NULL, ''),
(245, 7, '512204', 'PENYUSUTAN INSTALASI', NULL, ''),
(246, 7, '512301', 'TRANSPORTASI ( BENSIN, TIKET )', NULL, ''),
(247, 7, '512302', 'MAKANAN & MINUMAN', NULL, ''),
(248, 7, '512303', 'PENGINAPAN', NULL, ''),
(249, 7, '512304', 'UANG SAKU', NULL, ''),
(250, 7, '512399', 'LAIN-LAIN ( PARKIR, TOL )', NULL, ''),
(251, 7, '512401', 'SEWA BANGUNAN', NULL, ''),
(252, 7, '512402', 'SEWA KENDARAAN', NULL, ''),
(253, 7, '512403', 'SEWA INVENTARIS KANTOR', NULL, ''),
(254, 7, '512451', 'ASURANSI BANGUNAN', NULL, ''),
(255, 7, '512452', 'ASURANSI KENDARAAN', NULL, ''),
(256, 7, '512453', 'ASURANSI INVENTARIS', NULL, ''),
(257, 7, '512501', 'TELEPON', NULL, ''),
(258, 7, '512502', 'TELEX', NULL, ''),
(259, 7, '512503', 'TELEGRAM', NULL, ''),
(260, 7, '512504', 'INTERLOKAL NON TELEPON INTERN', NULL, ''),
(261, 7, '512505', 'FACSIMILE', NULL, ''),
(262, 7, '512599', 'LAIN - LAIN', NULL, ''),
(263, 7, '512601', 'AIR', NULL, ''),
(264, 7, '512602', 'LISTRIK', NULL, ''),
(265, 7, '512603', 'ALAT-ALAT LISTRIK', NULL, ''),
(266, 7, '512701', 'AKUNTAN', NULL, ''),
(267, 7, '512702', 'NOTARIS', NULL, ''),
(268, 7, '512703', 'KONSULTAN', NULL, ''),
(269, 7, '512704', 'MANAGEMENT FEE', NULL, ''),
(270, 7, '512801', 'ADMINISTRASI BANK', NULL, ''),
(271, 7, '512802', 'BUKU CEK / BG', NULL, ''),
(272, 7, '512803', 'TRANSFER, KIRIM UANG , INKASO', NULL, ''),
(273, 7, '512804', 'PAJAK BUNGA BANK', NULL, ''),
(274, 7, '512901', 'BIAYA ADMINISTRASI KENDARAAN', NULL, ''),
(275, 7, '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', NULL, ''),
(276, 7, '512903', 'BIAYA BUNGA KREDIT BANK', NULL, ''),
(277, 7, '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', NULL, ''),
(278, 7, '513102', 'PERANGKO, MATERAI, KIRIM SURAT', NULL, ''),
(279, 7, '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', NULL, ''),
(280, 7, '513104', 'ALAT - ALAT PENGAJARAN ', NULL, ''),
(281, 7, '513105', 'PERLENGKAPAN KELAS', NULL, ''),
(282, 7, '513106', 'JASA PEMBELAJARAN', NULL, ''),
(283, 7, '513201', 'PERIJINAN', NULL, ''),
(284, 7, '513202', 'PAJAK - PAJAK DAERAH,PBB', NULL, ''),
(285, 7, '513203', 'STNK', NULL, ''),
(286, 7, '513211', 'RETRIBUSI SAMPAH', NULL, ''),
(287, 7, '513301', 'SUMBANGAN', NULL, ''),
(288, 7, '513302', 'ENTERTAINMENT', NULL, ''),
(289, 7, '513303', 'JAMUAN ', NULL, ''),
(290, 7, '513401', 'KEAMANAN', NULL, ''),
(291, 7, '513501', 'PENDAFTARAN', NULL, ''),
(292, 7, '513502', 'IURAN', NULL, ''),
(293, 7, '513601', 'BIAYA PENGOBATAN', NULL, ''),
(294, 7, '513701', 'MAKANAN DAN MINUMAN', NULL, ''),
(295, 7, '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', NULL, ''),
(296, 7, '513703', 'SERAGAM ', NULL, ''),
(297, 7, '513704', 'SEWA DISPENSER', NULL, ''),
(298, 7, '513705', 'OLAH RAGA DAN KESENIAN', NULL, ''),
(299, 7, '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', NULL, ''),
(300, 7, '513707', 'BUKU, VCD', NULL, ''),
(301, 7, '513708', 'ATRIBUT SEKOLAH', NULL, ''),
(302, 7, '513709', 'BIAYA PSIKOTES', NULL, ''),
(303, 7, '513710', 'BIAYA ADVERTENSI ( IKLAN )', NULL, ''),
(304, 7, '513711', 'BIAYA STUDY TOUR', NULL, ''),
(305, 7, '513712', 'BIAYA PERLOMBAAN & PERAYAAN', NULL, ''),
(306, 7, '513713', 'STIKER U/ MURID', NULL, ''),
(307, 7, '513714', 'BIAYA TES KESEHATAN', NULL, ''),
(308, 7, '513715', 'BIAYA KOMISI PENGEMBANGAN', NULL, ''),
(309, 7, '513716', 'BIAYA PAMERAN', NULL, ''),
(310, 7, '513799', 'LAIN - LAIN', NULL, ''),
(311, 7, '513801', 'KANTIN', NULL, ''),
(312, 7, '513802', 'DAPUR', NULL, ''),
(313, 7, '513803', 'BIAYA KEBERSIHAN', NULL, ''),
(314, 7, '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', NULL, ''),
(315, 7, '513805', 'JASA CLEANING SERVICE', NULL, ''),
(316, 7, '513806', '', NULL, ''),
(317, 7, '513807', 'BIAYA MESS', NULL, ''),
(318, 7, '513901', 'SELAMATAN', NULL, ''),
(319, 7, '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', NULL, ''),
(320, 7, '513903', 'DENDA PAJAK', NULL, ''),
(321, 7, '513904', 'KOREKSI TAHUN LALU', NULL, ''),
(322, 7, '513998', 'LAIN - LAIN (SELISIH KURS)', NULL, ''),
(323, 7, '513999', 'LAIN - LAIN (SELISIH KAS)', NULL, ''),
(324, 7, '514001', 'TRANSPORT', NULL, ''),
(325, 7, '514002', 'MAKAN & MINUM (RAPAT)', NULL, ''),
(326, 7, '514099', 'LAIN-LAIN', NULL, ''),
(327, 7, '514101', 'BUKU', NULL, ''),
(328, 7, '514102', 'VCD', NULL, ''),
(329, 7, '514103', 'SERAGAM ', NULL, ''),
(330, 7, '514104', 'ATRIBUT SEKOLAH', NULL, ''),
(331, 7, '514105', 'BIAYA PSIKOTES', NULL, ''),
(332, 7, '514106', 'BIAYA STUDY TOUR/FIELD TRIP', NULL, ''),
(333, 7, '514107', 'BIAYA PERLOMBAAN ', NULL, ''),
(334, 7, '514108', 'EKSTRAKURIKULER', NULL, ''),
(335, 7, '514109', 'BIAYA STUDENT EXCHANGE', NULL, ''),
(336, 7, '514110', 'BIAYA CHECK POINT', NULL, ''),
(337, 7, '514199', 'LAIN - LAIN', NULL, ''),
(340, 1, '111109', 'test rekening dua x', '5500000', 'keterangan tes dua');

-- --------------------------------------------------------

--
-- Table structure for table `keu_saldorekening`
--

CREATE TABLE IF NOT EXISTS `keu_saldorekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `rekening` int(10) NOT NULL,
  `tahunbuku` int(10) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `nominal2` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=504 ;

--
-- Dumping data for table `keu_saldorekening`
--

INSERT INTO `keu_saldorekening` (`replid`, `rekening`, `tahunbuku`, `nominal`, `nominal2`) VALUES
(160, 6, 1, 100000, 65000),
(161, 7, 1, 100000, 100000),
(162, 8, 1, 100000, 100000),
(163, 9, 1, 100000, 100000),
(164, 10, 1, 100000, 100000),
(165, 11, 1, 100000, 100000),
(166, 12, 1, 100000, 100000),
(167, 13, 1, 100000, 100000),
(168, 14, 1, 100000, 100000),
(169, 15, 1, 100000, 100000),
(170, 16, 1, 100000, 100000),
(172, 18, 1, 100000, 100000),
(173, 19, 1, 100000, 100000),
(174, 20, 1, 100000, 100000),
(175, 21, 1, 100000, 100000),
(176, 22, 1, 100000, 50000),
(177, 23, 1, 100000, 100000),
(178, 24, 1, 100000, 100000),
(179, 25, 1, 100000, 95000),
(180, 26, 1, 100000, 100000),
(181, 27, 1, 100000, 100000),
(182, 28, 1, 100000, 100000),
(183, 29, 1, 100000, 100000),
(184, 30, 1, 100000, 100000),
(185, 31, 1, 100000, 100000),
(186, 32, 1, 100000, 100000),
(187, 33, 1, 100000, 100000),
(188, 34, 1, 100000, 100000),
(189, 35, 1, 100000, 100000),
(190, 36, 1, 100000, 100000),
(191, 37, 1, 100000, 100000),
(192, 38, 1, 100000, 100000),
(193, 39, 1, 100000, 100000),
(194, 40, 1, 100000, 100000),
(195, 41, 1, 100000, 100000),
(196, 42, 1, 100000, 100000),
(197, 43, 1, 100000, 100000),
(198, 44, 1, 100000, 100000),
(199, 45, 1, 100000, 100000),
(200, 46, 1, 100000, 100000),
(201, 47, 1, 100000, 100000),
(202, 48, 1, 100000, 100000),
(203, 49, 1, 100000, 100000),
(204, 50, 1, 100000, 100000),
(205, 61, 1, 100000, 100000),
(206, 62, 1, 100000, 100000),
(207, 63, 1, 100000, 100000),
(208, 64, 1, 100000, 100000),
(209, 65, 1, 100000, 100000),
(210, 66, 1, 100000, 100000),
(211, 67, 1, 100000, 100000),
(212, 68, 1, 100000, 100000),
(213, 69, 1, 100000, 100000),
(214, 70, 1, 100000, 100000),
(215, 71, 1, 100000, 100000),
(216, 72, 1, 100000, 100000),
(217, 73, 1, 100000, 100000),
(218, 74, 1, 100000, 100000),
(219, 75, 1, 100000, 100000),
(220, 76, 1, 100000, 100000),
(221, 77, 1, 100000, 100000),
(222, 78, 1, 100000, 100000),
(223, 79, 1, 100000, 100000),
(224, 80, 1, 100000, 100000),
(225, 331, 1, 100000, 100000),
(226, 332, 1, 100000, 100000),
(227, 333, 1, 100000, 100000),
(228, 334, 1, 100000, 100000),
(230, 336, 1, 100000, 100000),
(231, 337, 1, 100000, 100000),
(233, 53, 1, 100000, 100000),
(234, 54, 1, 100000, 100000),
(235, 55, 1, 100000, 100000),
(236, 56, 1, 100000, 100000),
(237, 57, 1, 100000, 100000),
(238, 58, 1, 100000, 100000),
(239, 59, 1, 100000, 100000),
(240, 60, 1, 100000, 100000),
(241, 81, 1, 100000, 100000),
(242, 82, 1, 100000, 100000),
(243, 323, 1, 100000, 100000),
(244, 324, 1, 100000, 100000),
(245, 325, 1, 100000, 100000),
(246, 326, 1, 100000, 100000),
(247, 327, 1, 100000, 100000),
(248, 328, 1, 100000, 100000),
(249, 329, 1, 100000, 100000),
(250, 330, 1, 100000, 100000),
(251, 315, 1, 100000, 100000),
(252, 316, 1, 100000, 100000),
(253, 317, 1, 100000, 100000),
(254, 318, 1, 100000, 100000),
(255, 319, 1, 100000, 100000),
(256, 320, 1, 100000, 100000),
(257, 321, 1, 100000, 100000),
(259, 307, 1, 100000, 100000),
(261, 309, 1, 100000, 100000),
(262, 310, 1, 100000, 100000),
(263, 311, 1, 100000, 100000),
(264, 312, 1, 100000, 100000),
(265, 313, 1, 100000, 100000),
(266, 314, 1, 100000, 100000),
(267, 299, 1, 100000, 100000),
(268, 300, 1, 100000, 100000),
(269, 301, 1, 100000, 100000),
(270, 302, 1, 100000, 100000),
(271, 303, 1, 100000, 100000),
(272, 304, 1, 100000, 100000),
(273, 305, 1, 100000, 100000),
(274, 306, 1, 100000, 100000),
(275, 291, 1, 100000, 100000),
(276, 292, 1, 100000, 100000),
(277, 293, 1, 100000, 100000),
(278, 294, 1, 100000, 100000),
(279, 295, 1, 100000, 100000),
(280, 296, 1, 100000, 100000),
(281, 297, 1, 100000, 100000),
(282, 298, 1, 100000, 100000),
(283, 283, 1, 100000, 100000),
(284, 284, 1, 100000, 100000),
(285, 285, 1, 100000, 100000),
(286, 286, 1, 100000, 100000),
(287, 287, 1, 100000, 100000),
(288, 288, 1, 100000, 100000),
(289, 289, 1, 100000, 100000),
(290, 290, 1, 100000, 100000),
(291, 275, 1, 100000, 100000),
(292, 276, 1, 100000, 100000),
(293, 277, 1, 100000, 100000),
(294, 278, 1, 100000, 100000),
(295, 279, 1, 100000, 100000),
(296, 280, 1, 100000, 100000),
(297, 281, 1, 100000, 100000),
(298, 282, 1, 100000, 100000),
(299, 267, 1, 100000, 100000),
(300, 268, 1, 100000, 100000),
(301, 269, 1, 100000, 100000),
(302, 270, 1, 100000, 100000),
(303, 271, 1, 100000, 100000),
(304, 272, 1, 100000, 100000),
(305, 273, 1, 100000, 100000),
(306, 274, 1, 100000, 100000),
(307, 259, 1, 100000, 100000),
(308, 260, 1, 100000, 100000),
(309, 261, 1, 100000, 100000),
(310, 262, 1, 100000, 100000),
(311, 263, 1, 100000, 100000),
(312, 264, 1, 100000, 100000),
(313, 265, 1, 100000, 100000),
(314, 266, 1, 100000, 100000),
(315, 251, 1, 100000, 100000),
(316, 252, 1, 100000, 100000),
(317, 253, 1, 100000, 100000),
(318, 254, 1, 100000, 100000),
(319, 255, 1, 100000, 100000),
(320, 256, 1, 100000, 100000),
(321, 257, 1, 100000, 100000),
(322, 258, 1, 100000, 100000),
(323, 243, 1, 100000, 100000),
(324, 244, 1, 100000, 100000),
(325, 245, 1, 100000, 100000),
(326, 246, 1, 100000, 100000),
(327, 247, 1, 100000, 100000),
(328, 248, 1, 100000, 100000),
(329, 249, 1, 100000, 100000),
(330, 250, 1, 100000, 100000),
(331, 235, 1, 100000, 5600000),
(332, 236, 1, 100000, 100000),
(333, 237, 1, 100000, 100000),
(334, 238, 1, 100000, 100000),
(335, 239, 1, 100000, 100000),
(336, 240, 1, 100000, 100000),
(337, 241, 1, 100000, 100000),
(338, 242, 1, 100000, 100000),
(339, 227, 1, 100000, 100000),
(340, 228, 1, 100000, 100000),
(341, 229, 1, 100000, 100000),
(342, 230, 1, 100000, 100000),
(343, 231, 1, 100000, 100000),
(344, 232, 1, 100000, 100000),
(345, 233, 1, 100000, 100000),
(346, 234, 1, 100000, 100000),
(347, 219, 1, 100000, 100000),
(348, 220, 1, 100000, 100000),
(349, 221, 1, 100000, 100000),
(350, 222, 1, 100000, 135000),
(351, 223, 1, 100000, 100000),
(352, 224, 1, 100000, 100000),
(353, 225, 1, 100000, 100000),
(354, 226, 1, 100000, 100000),
(356, 212, 1, 100000, 100000),
(364, 204, 1, 100000, 100000),
(365, 205, 1, 100000, 100000),
(367, 207, 1, 100000, 100000),
(371, 195, 1, 100000, 100000),
(372, 196, 1, 100000, 100000),
(379, 187, 1, 100000, 100000),
(380, 188, 1, 100000, 100000),
(381, 189, 1, 100000, 100000),
(382, 190, 1, 100000, 100000),
(383, 191, 1, 100000, 100000),
(384, 192, 1, 100000, 100000),
(386, 194, 1, 100000, 100000),
(387, 179, 1, 100000, 100000),
(388, 180, 1, 100000, 100000),
(389, 181, 1, 100000, 100000),
(390, 182, 1, 100000, 100000),
(391, 183, 1, 100000, 100000),
(392, 184, 1, 100000, 100000),
(393, 185, 1, 100000, 100000),
(394, 186, 1, 100000, 100000),
(395, 171, 1, 100000, 100000),
(396, 172, 1, 100000, 100000),
(397, 173, 1, 100000, 100000),
(398, 174, 1, 100000, 100000),
(399, 175, 1, 100000, 100000),
(400, 176, 1, 100000, 100000),
(401, 177, 1, 100000, 100000),
(402, 178, 1, 100000, 100000),
(403, 163, 1, 100000, 100000),
(404, 164, 1, 100000, 100000),
(405, 165, 1, 100000, 100000),
(406, 166, 1, 100000, 100000),
(407, 167, 1, 100000, 100000),
(408, 168, 1, 100000, 100000),
(409, 169, 1, 100000, 100000),
(410, 170, 1, 100000, 100000),
(411, 155, 1, 100000, 100000),
(412, 156, 1, 100000, 100000),
(413, 157, 1, 100000, 100000),
(414, 158, 1, 100000, 100000),
(415, 159, 1, 100000, 100000),
(416, 160, 1, 100000, 100000),
(417, 161, 1, 100000, 100000),
(418, 162, 1, 100000, 100000),
(419, 147, 1, 100000, 100000),
(420, 148, 1, 100000, 100000),
(421, 149, 1, 100000, 100000),
(422, 150, 1, 100000, 100000),
(423, 151, 1, 100000, 100000),
(424, 152, 1, 100000, 100000),
(425, 153, 1, 100000, 100000),
(426, 154, 1, 100000, 100000),
(427, 139, 1, 100000, 100000),
(428, 140, 1, 100000, 100000),
(429, 141, 1, 100000, 100000),
(430, 142, 1, 100000, 100000),
(431, 143, 1, 100000, 100000),
(432, 144, 1, 100000, 100000),
(433, 145, 1, 100000, 100000),
(434, 146, 1, 100000, 100000),
(435, 131, 1, 100000, 100000),
(436, 132, 1, 100000, 100000),
(437, 133, 1, 100000, 100000),
(438, 134, 1, 100000, 100000),
(439, 135, 1, 100000, 100000),
(440, 136, 1, 100000, 100000),
(441, 137, 1, 100000, 100000),
(442, 138, 1, 100000, 100000),
(443, 123, 1, 100000, 100000),
(444, 124, 1, 100000, 100000),
(445, 125, 1, 100000, 100000),
(446, 126, 1, 100000, 100000),
(447, 127, 1, 100000, 100000),
(448, 128, 1, 100000, 100000),
(449, 129, 1, 100000, 100000),
(450, 130, 1, 100000, 100000),
(451, 115, 1, 100000, 100000),
(452, 116, 1, 100000, 100000),
(453, 117, 1, 100000, 100000),
(454, 118, 1, 100000, 100000),
(455, 119, 1, 100000, 100000),
(456, 120, 1, 100000, 100000),
(457, 121, 1, 100000, 100000),
(458, 122, 1, 100000, 100000),
(459, 107, 1, 100000, 100000),
(460, 108, 1, 100000, 100000),
(461, 109, 1, 100000, 100000),
(462, 110, 1, 100000, 100000),
(463, 111, 1, 100000, 100000),
(464, 112, 1, 100000, 100000),
(465, 113, 1, 100000, 100000),
(466, 114, 1, 100000, 100000),
(467, 99, 1, 100000, 100000),
(468, 100, 1, 100000, 100000),
(469, 101, 1, 100000, 100000),
(470, 102, 1, 100000, 100000),
(471, 103, 1, 100000, 100000),
(472, 104, 1, 100000, 100000),
(473, 105, 1, 100000, 100000),
(474, 106, 1, 100000, 100000),
(475, 91, 1, 100000, 100000),
(476, 92, 1, 100000, 100000),
(477, 93, 1, 100000, 100000),
(478, 94, 1, 100000, 100000),
(479, 95, 1, 100000, 100000),
(480, 96, 1, 100000, 100000),
(481, 97, 1, 100000, 100000),
(482, 98, 1, 100000, 100000),
(483, 83, 1, 100000, 35000),
(484, 84, 1, 100000, 100000),
(485, 85, 1, 100000, 100000),
(486, 86, 1, 100000, 100000),
(487, 87, 1, 100000, 100000),
(488, 88, 1, 100000, 100000),
(489, 89, 1, 100000, 100000),
(490, 90, 1, 100000, 100000),
(491, 51, 1, 100000, 100000),
(492, 52, 1, 100000, 100000),
(494, 341, 15, 100000000, 100000000),
(495, 342, 15, 0, 0),
(496, 343, 15, 0, 0),
(497, 344, 15, 0, 0),
(498, 345, 15, 0, 3720000),
(501, 348, 15, 0, 0),
(502, 349, 15, 0, 0),
(503, 350, 15, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keu_tahunbuku`
--

CREATE TABLE IF NOT EXISTS `keu_tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `kode` varchar(20) NOT NULL,
  `saldoawal` decimal(10,0) NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `keu_tahunbuku`
--

INSERT INTO `keu_tahunbuku` (`replid`, `nama`, `tanggal1`, `tanggal2`, `kode`, `saldoawal`, `aktif`, `keterangan`) VALUES
(15, '2015', '2015-07-27', '0000-00-00', '', '0', '1', 'kas');

-- --------------------------------------------------------

--
-- Table structure for table `keu_transaksi`
--

CREATE TABLE IF NOT EXISTS `keu_transaksi` (
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
  `detilanggaran` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `keu_transaksi`
--

INSERT INTO `keu_transaksi` (`replid`, `tahunbuku`, `nomer`, `nobukti`, `tanggal`, `rekkas`, `rekitem`, `nominal`, `uraian`, `modul`, `kategori`, `pembayaran`, `penerimaanbrg`, `jenis`, `budget`, `ct`, `detjenistrans`, `detilanggaran`) VALUES
(6, 5, 'BKM-0006/06/2015', 'BKM01', '2015-06-05', 1, 193, 500000, 'Dari Donatur', 0, 0, 0, 0, 0, 0, 0, 4, 0),
(11, 15, 'BKK-0010/08/2015', '', '2015-08-24', 341, 345, 3720000, 'kaledia', 0, 0, 0, 0, 0, 0, 0, 7, 12),
(9, 15, 'BKK-0009/08/2015', '', '2015-08-24', 341, 235, 5500000, 'Summa Edu Visitama', 0, 0, 0, 0, 0, 0, 0, 7, 13);

-- --------------------------------------------------------

--
-- Table structure for table `kon_aksi`
--

CREATE TABLE IF NOT EXISTS `kon_aksi` (
  `id_aksi` int(11) NOT NULL AUTO_INCREMENT,
  `aksi` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_aksi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `kon_aksi`
--

INSERT INTO `kon_aksi` (`id_aksi`, `aksi`, `keterangan`) VALUES
(1, 'r', 'read'),
(2, 'c', 'create'),
(3, 'u', 'update'),
(4, 'd', 'delete'),
(5, 'p', 'print/report');

-- --------------------------------------------------------

--
-- Table structure for table `kon_grupmenu`
--

CREATE TABLE IF NOT EXISTS `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_katgrupmenu` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `kon_grupmenu`
--

INSERT INTO `kon_grupmenu` (`id_grupmenu`, `id_katgrupmenu`, `id_modul`, `grupmenu`, `size`) VALUES
(1, 2, 1, 'Menu Kesiswaan', 'four'),
(2, 2, 1, 'Menu Belajar - Mengajar', 'four'),
(3, 1, 1, 'Menu Master', 'four'),
(4, 1, 2, 'Menu Transaksi', 'four'),
(5, 2, 6, 'Menu Transaksi ', 'double'),
(6, 1, 6, 'Menu Master', 'double'),
(7, 1, 9, 'Menu Sistem', 'double'),
(8, 2, 9, 'Menu User', 'double'),
(9, 1, 2, 'Menu Master', 'four'),
(14, 1, 3, 'Menu Master ', 'double double-vertic'),
(15, 2, 3, 'Menu Transaksi', 'double double-vertic'),
(16, 1, 5, 'Master HRD', 'four'),
(17, 2, 5, 'Transaksi HRD', 'four'),
(18, 2, 5, 'Penggajian', 'four'),
(19, 1, 7, 'Master Student Service', 'four'),
(20, 2, 7, 'Pembelian', 'four'),
(21, 2, 7, 'Penjualan', ''),
(24, 2, 7, 'Jasa', 'four'),
(25, 2, 7, 'Hutang / Piutang', 'four'),
(26, 2, 7, 'biaya', 'four'),
(27, 2, 7, 'Laporan', 'four'),
(28, 2, 7, 'Setting', ''),
(29, 1, 13, 'Master PO', 'four'),
(30, 2, 13, 'Permintaan', 'four'),
(31, 1, 13, 'Penawaran', 'four'),
(32, 2, 13, 'Pemesanan', 'four'),
(33, 2, 13, 'Pembelian', 'four'),
(34, 2, 13, 'setting', ''),
(35, 1, 4, 'Transaksi Sarpras', 'four'),
(37, 1, 4, 'Master Sarpras', 'four'),
(38, 1, 14, 'setting', 'four'),
(39, 2, 14, 'transaksi', 'four');

-- --------------------------------------------------------

--
-- Table structure for table `kon_grupmodul`
--

CREATE TABLE IF NOT EXISTS `kon_grupmodul` (
  `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmodul`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `kon_grupmodul`
--

INSERT INTO `kon_grupmodul` (`id_grupmodul`, `grupmodul`, `size`) VALUES
(1, 'satu', 'four'),
(2, 'dua', 'four'),
(3, 'tiga', 'four');

-- --------------------------------------------------------

--
-- Table structure for table `kon_icon`
--

CREATE TABLE IF NOT EXISTS `kon_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(25) NOT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `kon_icon`
--

INSERT INTO `kon_icon` (`id_icon`, `icon`) VALUES
(1, 'akademik'),
(2, 'sarpras'),
(3, 'hrd'),
(4, 'psb'),
(5, 'keuangan'),
(6, 'student'),
(7, 'perpus'),
(8, 'manajemen'),
(9, 'pencil'),
(10, 'address-book'),
(11, 'book'),
(12, 'copy'),
(13, 'user-3'),
(14, 'user'),
(15, 'grid-view'),
(16, 'tab'),
(17, 'cog'),
(18, 'user-2'),
(20, 'loop');

-- --------------------------------------------------------

--
-- Table structure for table `kon_katgrupmenu`
--

CREATE TABLE IF NOT EXISTS `kon_katgrupmenu` (
  `id_katgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `katgrupmenu` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_katgrupmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `kon_katgrupmenu`
--

INSERT INTO `kon_katgrupmenu` (`id_katgrupmenu`, `katgrupmenu`, `keterangan`) VALUES
(1, 'M', 'Master'),
(2, 'T', 'Transaksi');

-- --------------------------------------------------------

--
-- Table structure for table `kon_level`
--

CREATE TABLE IF NOT EXISTS `kon_level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `kon_level`
--

INSERT INTO `kon_level` (`id_level`, `level`, `urutan`, `keterangan`) VALUES
(17, 'SA', 1, 'Super Admin'),
(18, 'A+', 2, 'Admin Plus'),
(19, 'A', 3, 'Admin'),
(20, 'O', 4, 'Operator'),
(21, 'G', 5, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `kon_levelaksi`
--

CREATE TABLE IF NOT EXISTS `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_levelaksi`),
  KEY `id_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  KEY `id_aksi` (`id_aksi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=450 ;

--
-- Dumping data for table `kon_levelaksi`
--

INSERT INTO `kon_levelaksi` (`id_levelaksi`, `id_levelkatgrupmenu`, `id_aksi`) VALUES
(221, 53, 1),
(222, 54, 1),
(223, 53, 2),
(224, 54, 2),
(225, 53, 3),
(226, 54, 3),
(227, 53, 4),
(228, 54, 4),
(229, 53, 5),
(230, 54, 5),
(231, 55, 1),
(232, 56, 1),
(233, 55, 2),
(234, 56, 2),
(235, 55, 3),
(236, 56, 3),
(237, 55, 4),
(238, 56, 4),
(239, 55, 5),
(240, 56, 5),
(355, 57, 1),
(356, 58, 1),
(357, 57, 2),
(358, 57, 3),
(359, 57, 4),
(360, 57, 5),
(361, 58, 5),
(362, 59, 1),
(363, 60, 1),
(364, 59, 2),
(365, 59, 3),
(366, 59, 4),
(367, 59, 5),
(368, 60, 5),
(419, 61, 1),
(420, 61, 2),
(421, 61, 3),
(422, 61, 4),
(423, 61, 5),
(424, 63, 1),
(425, 63, 2),
(426, 63, 3),
(427, 63, 4),
(428, 63, 5),
(442, 67, 1),
(443, 67, 2),
(444, 67, 3),
(445, 67, 4),
(446, 67, 5),
(448, 71, 1),
(449, 71, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kon_levelkatgrupmenu`
--

CREATE TABLE IF NOT EXISTS `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_levelkatgrupmenu`),
  KEY `id_level` (`id_level`),
  KEY `id_katgrupmenu` (`id_katgrupmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `kon_levelkatgrupmenu`
--

INSERT INTO `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`, `id_level`, `id_katgrupmenu`, `isDefault`) VALUES
(53, 17, 1, 1),
(54, 17, 1, 0),
(55, 17, 2, 1),
(56, 17, 2, 0),
(57, 18, 1, 1),
(58, 18, 1, 0),
(59, 18, 2, 1),
(60, 18, 2, 0),
(61, 19, 1, 1),
(62, 19, 1, 0),
(63, 19, 2, 1),
(64, 19, 2, 0),
(65, 20, 1, 1),
(66, 20, 1, 0),
(67, 20, 2, 1),
(68, 20, 2, 0),
(69, 21, 1, 1),
(70, 21, 1, 0),
(71, 21, 2, 1),
(72, 21, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kon_login`
--

CREATE TABLE IF NOT EXISTS `kon_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  KEY `id_level` (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `kon_login`
--

INSERT INTO `kon_login` (`id_login`, `nama`, `username`, `password`, `id_level`, `pegawai`, `aktif`, `bahasa`, `tlogin`) VALUES
(42, 'a', 'a', 'MGNjMTc1YjljMGYxYjZhODMxYzM5OWUyNjk3NzI2NjE=', 19, 0, '', '', '0000-00-00 00:00:00'),
(44, 'g', 'g', 'YjJmNWZmNDc0MzY2NzFiNmU1MzNkOGRjMzYxNDg0NWQ=', 21, 0, '1', '', '0000-00-00 00:00:00'),
(45, 'adm+ akademik', 'aaka', 'Yzg5MWY0ZTgxYjdhZmM4NzQ1ZDEwODAwNmQ1NWY5ODU=', 18, 0, '', '', '0000-00-00 00:00:00'),
(46, 'new', 'new', 'MjJhZjY0NWQxODU5Y2I1Y2E2ZGEwYzQ4NGYxZjM3ZWE=', 18, 0, '', '', '0000-00-00 00:00:00'),
(52, 'a+', 'a+', 'Yzg5NDhjMjAwOTRmNjQyMDBjMmI4ZmJhMDQ3YmRiODM=', 18, 0, '1', '', '0000-00-00 00:00:00'),
(58, 'Mr. Boss', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', 17, 0, '1', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kon_logindepartemen`
--

CREATE TABLE IF NOT EXISTS `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  PRIMARY KEY (`id_logindepartemen`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_departemen` (`id_departemen`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `kon_logindepartemen`
--

INSERT INTO `kon_logindepartemen` (`id_logindepartemen`, `id_login`, `id_departemen`) VALUES
(9, 42, 1),
(11, 44, 1),
(12, 45, 1),
(13, 46, 1),
(27, 52, 1),
(43, 58, 1),
(44, 58, 2),
(45, 58, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kon_loginhistory`
--

CREATE TABLE IF NOT EXISTS `kon_loginhistory` (
  `id_loginhistory` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_loginhistory`),
  KEY `id_login` (`id_login`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `kon_loginhistory`
--

INSERT INTO `kon_loginhistory` (`id_loginhistory`, `id_login`, `date`) VALUES
(11, 42, '2015-08-18 03:41:27'),
(12, 42, '2015-08-18 03:41:27'),
(15, 45, '2015-08-18 03:46:13'),
(16, 45, '2015-08-18 03:46:13'),
(57, 52, '2015-08-19 19:46:41'),
(58, 52, '2015-08-19 19:46:41'),
(65, 52, '2015-08-20 00:27:59'),
(66, 52, '2015-08-20 00:27:59'),
(131, 58, '2015-08-24 04:53:56'),
(132, 58, '2015-08-24 04:53:56'),
(133, 58, '2015-08-24 11:44:30'),
(134, 58, '2015-08-24 11:44:30'),
(135, 58, '2015-08-24 19:28:23'),
(136, 58, '2015-08-24 19:28:23'),
(137, 58, '2015-08-25 08:40:48'),
(138, 58, '2015-08-25 08:40:48'),
(139, 58, '2015-08-25 10:05:02'),
(140, 58, '2015-08-25 10:05:02'),
(141, 58, '2015-08-25 14:56:20'),
(142, 58, '2015-08-25 14:56:20'),
(143, 58, '2015-08-25 17:34:28'),
(144, 58, '2015-08-25 17:34:28'),
(145, 58, '2015-08-25 19:00:34'),
(146, 58, '2015-08-25 19:00:34'),
(147, 58, '2015-08-25 23:32:58'),
(148, 58, '2015-08-25 23:32:58'),
(149, 58, '2015-08-26 14:04:02'),
(150, 58, '2015-08-26 14:04:02'),
(151, 58, '2015-08-26 14:04:57'),
(152, 58, '2015-08-26 14:04:57'),
(153, 58, '2015-08-26 16:31:22'),
(154, 58, '2015-08-26 16:31:22'),
(155, 58, '2015-08-26 16:31:50'),
(156, 58, '2015-08-26 16:31:50'),
(157, 58, '2015-08-26 16:36:54'),
(158, 58, '2015-08-26 16:36:54'),
(159, 58, '2015-08-26 16:37:25'),
(160, 58, '2015-08-26 16:37:25'),
(161, 58, '2015-08-28 07:05:09'),
(162, 58, '2015-08-28 07:05:09'),
(163, 58, '2015-08-28 07:30:31'),
(164, 58, '2015-08-28 07:30:31'),
(165, 58, '2015-08-28 07:39:09'),
(166, 58, '2015-08-28 07:39:09'),
(167, 58, '2015-08-28 12:33:23'),
(168, 58, '2015-08-28 12:33:23'),
(169, 58, '2015-08-28 12:34:21'),
(170, 58, '2015-08-28 12:34:21'),
(171, 58, '2015-08-31 12:29:21'),
(172, 58, '2015-08-31 12:29:21'),
(173, 58, '2015-09-01 13:40:20'),
(174, 58, '2015-09-01 13:40:20'),
(175, 58, '2015-09-02 09:21:37'),
(176, 58, '2015-09-02 09:21:37'),
(177, 58, '2015-09-03 09:44:08'),
(178, 58, '2015-09-03 09:44:08'),
(179, 58, '2015-09-08 09:29:29'),
(180, 58, '2015-09-08 09:29:29'),
(181, 58, '2015-09-09 08:05:18'),
(182, 58, '2015-09-09 08:05:18'),
(183, 58, '2015-09-09 08:05:27'),
(184, 58, '2015-09-09 08:05:27'),
(185, 58, '2015-09-09 10:03:16'),
(186, 58, '2015-09-09 10:03:16'),
(187, 58, '2015-09-10 08:45:45'),
(188, 58, '2015-09-10 08:45:45'),
(189, 58, '2015-09-11 08:16:49'),
(190, 58, '2015-09-11 08:16:49'),
(191, 58, '2015-09-11 10:22:10'),
(192, 58, '2015-09-11 10:22:10'),
(193, 58, '2015-09-16 08:06:18'),
(194, 58, '2015-09-16 08:06:18'),
(195, 58, '2015-09-17 10:04:09'),
(196, 58, '2015-09-17 10:04:09'),
(197, 58, '2015-09-17 10:43:02'),
(198, 58, '2015-09-17 10:43:02'),
(199, 58, '2015-09-18 08:21:40'),
(200, 58, '2015-09-18 08:21:40'),
(201, 58, '2015-09-25 13:51:32'),
(202, 58, '2015-09-25 13:51:32'),
(203, 58, '2015-09-26 10:13:36'),
(204, 58, '2015-09-26 10:13:37'),
(205, 58, '2015-10-07 06:53:51'),
(206, 58, '2015-10-07 06:53:51'),
(207, 58, '2015-10-08 13:22:01'),
(208, 58, '2015-10-08 13:22:01'),
(209, 58, '2015-10-09 10:30:26'),
(210, 58, '2015-10-09 10:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `kon_menu`
--

CREATE TABLE IF NOT EXISTS `kon_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154 ;

--
-- Dumping data for table `kon_menu`
--

INSERT INTO `kon_menu` (`id_menu`, `id_grupmenu`, `menu`, `link`, `size`, `id_warna`, `id_icon`, `keterangan`) VALUES
(1, 4, 'Pendataan Siswa', 'pendataan-siswa', 'double', 7, 9, ''),
(2, 1, 'Presensi Siswa', 'presensi-siswa', 'double', 44, 10, ''),
(3, 1, 'Rapor Siswa', 'rapor-siswa', 'double', 3, 11, ''),
(4, 1, 'Pendataan Alumni', 'pendataan-alumni', 'double', 4, 12, ''),
(8, 5, 'Transaksi', 'transaksi', 'double', 8, 16, ''),
(9, 5, 'Modul Penerimaan Siswa', 'modul-penerimaan-siswa', 'double', 9, 17, ''),
(10, 5, 'Penerimaan Siswa', 'penerimaan-siswa', 'double', 10, 18, ''),
(12, 6, 'Tahun Buku', 'tahun-buku', '', 12, 20, ''),
(13, 6, 'Saldo Awal', 'saldo-rekening', '', 13, 13, ''),
(14, 6, 'Kategori COA', 'kategori-rekening', '', 14, 14, ''),
(15, 6, 'COA', 'detil-rekening', '', 15, 19, ''),
(16, 6, 'Anggaran', 'set-anggaran', '', 16, 16, ''),
(19, 7, 'Warna', 'warna', '', 4, 17, ''),
(20, 8, 'level', 'level', '', 5, 16, ''),
(21, 8, 'user', 'user', '', 7, 15, ''),
(22, 7, 'Icon', 'icon', '', 4, 13, ''),
(24, 2, 'Detail Kelas', 'detail-kelas', 'double', 11, 15, ''),
(25, 3, 'Departemen', 'departemen', '', 3, 11, ''),
(26, 3, 'Angkatan', 'angkatan', '', 11, 15, ''),
(27, 3, 'Tahun Ajaran', 'tahun-ajaran', '', 16, 17, ''),
(28, 3, 'Tingkat', 'tingkat', '', 12, 18, ''),
(29, 3, 'Sub Tingkat', 'subtingkat', '', 14, 14, ''),
(30, 3, 'Kelas', 'kelas', '', 15, 13, ''),
(31, 3, 'Semester', 'semester', '', 13, 12, ''),
(32, 3, 'Jenis Mutasi', 'jenis-mutasi', '', 11, 10, ''),
(33, 3, 'Guru', 'guru', '', 11, 14, ''),
(34, 3, 'Pelajaran', 'pelajaran', '', 12, 14, ''),
(35, 2, 'Jadwal Pelajaran', 'jadwal-pelajaran', 'double', 15, 15, ''),
(36, 2, 'Presensi Guru', 'presensi-guru', 'double', 18, 12, ''),
(37, 2, 'Kegiatan Akademik', 'kegiatan-akademik', 'double', 14, 14, ''),
(38, 1, 'Mutasi', 'mutasi', 'double', 6, 13, ''),
(39, 3, 'Detail Pelajaran', 'detail-pelajaran', '', 13, 15, ''),
(40, 1, 'Pendataan Siswa', 'pendataan-siswa', 'double', 13, 15, ''),
(41, 4, 'Biaya', 'biaya', 'double', 14, 15, ''),
(42, 9, 'Diskon Tunai', 'diskon-tunai', '', 14, 15, ''),
(43, 9, 'Angsuran', 'angsuran', '', 17, 13, ''),
(44, 9, 'golongan', 'golongan', '', 13, 16, ''),
(45, 7, 'menu', 'menu', '', 14, 16, ''),
(46, 7, 'Grup Modul', 'grup-modul', '', 13, 12, ''),
(47, 7, 'Modul', 'modul', '', 12, 11, ''),
(48, 7, 'Grup Menu', 'grup-menu', '', 16, 13, ''),
(52, 9, 'Gelombang', 'gelombang', '', 16, 10, 'kelompok pendaftaran  (gelombang)'),
(53, 4, 'Penerimaan Siswa Baru', 'penerimaan', 'double', 4, 10, 'penerimaan siswa (pendaftaran NIS dan NISN)'),
(54, 14, 'Perangkat', 'perangkat', '', 16, 10, 'ok'),
(55, 14, 'Lokasi', 'lokasi', '', 16, 10, ''),
(56, 14, 'Jenis Koleksi', 'jenis-koleksi', '', 16, 10, ''),
(57, 14, 'Tingkat Koleksi', 'tingkat-koleksi', '', 13, 10, ''),
(58, 14, 'Klasifikasi', 'klasifikasi', '', 41, 10, ''),
(59, 14, 'Daftar Pengunjung', 'daftar-pengunjung', '', 17, 10, '\r\n'),
(60, 14, 'Daftar Penerbit', 'daftar-penerbit', '', 10, 10, ''),
(61, 14, 'Daftar-Bahasa', 'daftar-bahasa', '', 24, 10, ''),
(62, 14, 'Satuan Mata Uang', 'stuan-mata-uang', '', 8, 10, '\r\n'),
(63, 15, 'Katalog', 'katalog', 'double', 7, 10, ''),
(64, 15, 'Daftar Koleksi', 'daftar-koleksi', 'double', 7, 20, ''),
(65, 15, 'Data Anggota', 'data-anggota', '', 13, 10, ''),
(66, 15, 'Sirkulasi', 'sirkulasi', 'double', 18, 10, ''),
(67, 15, 'Stock Opname', 'stock-opname', 'double', 47, 17, ''),
(68, 15, 'OPAC', 'opac', 'double', 19, 12, ''),
(69, 16, 'Agama', 'agama', '', 16, 10, 'setting data master agama'),
(70, 16, 'Pendidikan', 'pendidikan', 'double', 16, 10, ''),
(71, 16, 'Departemen', 'departemen', '', 13, 10, ''),
(72, 16, 'Jabatan', 'jabatan', 'double', 16, 1, ''),
(73, 16, 'Status Karyawan', 'status-karyawan', 'double', 16, 10, ''),
(74, 16, 'Golongan', 'golongan', 'double', 16, 10, ''),
(75, 17, 'Berkas', 'berkas', 'double', 34, 10, ''),
(76, 17, 'Absensi', 'absensi', 'double', 16, 10, '\r\n'),
(77, 17, 'Cuti', 'cuti', 'double', 7, 10, ''),
(78, 17, 'Pinjaman', 'pinjaman', 'double', 17, 10, ''),
(79, 17, 'Karyawan', 'karyawan', 'double', 27, 12, ''),
(80, 18, 'Penggajian', 'penggajian', 'double', 8, 10, ''),
(81, 18, 'Laporan', 'laporan', '', 10, 12, ''),
(82, 18, 'Setting BPJS', 'setting-bpjs', 'double', 5, 17, ''),
(83, 18, 'Golongan', 'golongan ', 'double', 22, 11, ''),
(84, 18, 'struktural', 'struktural', '', 41, 17, ''),
(85, 18, 'Fungsional', 'Fungsional', 'double', 16, 1, ''),
(86, 18, 'Pengabdian', 'Pengabdian', '', 24, 17, ''),
(87, 18, 'istri anak', 'istri-anak', 'double', 16, 10, ''),
(88, 18, 'uang transport', 'uang-transport', 'double', 16, 10, ''),
(89, 18, 'beban tugas', 'beban-tugas', 'double', 16, 10, ''),
(90, 18, 'wali kelas', 'wali-kelas', 'double', 13, 11, ''),
(91, 19, 'Jenjang', 'jenjang', 'double', 8, 10, ''),
(92, 19, 'Kategori', 'kategori', 'double', 8, 1, ''),
(93, 19, 'produk', 'produk', 'double', 8, 10, ''),
(94, 19, 'produk jasa', 'produk-jasa', 'double', 1, 11, ''),
(95, 19, 'beban biaya', 'beban-biaya', 'double', 8, 10, ''),
(96, 19, 'supplier', 'supplier', 'double', 16, 10, ''),
(97, 19, 'customer', 'customer', 'double', 8, 11, ''),
(98, 20, 'PO Pembelian', 'PO-Pembelian', 'double', 16, 14, ''),
(99, 20, 'Pembelian', 'Pembelian', 'double', 16, 1, ''),
(100, 20, 'laporan pembelian', 'laporan-pembelian', 'double', 1, 12, ''),
(101, 20, 'retur pembelian', 'retur-pembelian', 'double', 16, 1, ''),
(102, 20, 'laporan retur pembelian', 'laporan-retur-pembelian', 'double', 13, 10, ''),
(103, 21, 'PO Penjualan', 'PO-Penjualan', 'double', 27, 17, ''),
(104, 21, 'Penjualan', 'Penjualan', 'double', 20, 1, ''),
(105, 21, 'Retur Penjualaan', 'Retur-Penjualaan', 'double', 16, 10, ''),
(106, 21, 'Laporan Penjualan', 'Laporan-Penjualan', 'double', 16, 10, ''),
(107, 21, 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', 18, 1, ''),
(108, 24, 'Penjualaan Jasa', 'Penjualaan-Jasa', 'double', 16, 1, '\r\n'),
(109, 24, 'Laporan Penjualaan Jasa', 'Laporan-Penjualaan-Jasa', 'double', 16, 10, ''),
(110, 25, 'Hutang', 'hutang', 'double', 16, 10, ''),
(111, 25, 'pembayaran', 'pembayaran', 'double', 16, 10, ''),
(112, 25, 'laporan hutang', 'laporan-hutang', 'double', 16, 10, ''),
(113, 25, 'laporan pembayaran', 'laporan-pembayaran', 'double', 16, 10, '\r\n'),
(114, 26, 'Transaksi Biaya', 'Transaksi-Biaya', 'double', 16, 10, ''),
(115, 26, 'Laporan Biaya', 'Laporan-Biaya', 'double', 16, 10, ''),
(116, 27, 'Laporan Stok', 'Laporan-Stok', 'double', 16, 10, ''),
(117, 27, 'Laporan Laba/Rugi', 'Laporan-Laba/Rugi', 'double', 16, 1, ''),
(119, 27, 'Laporan Pembelian', 'Laporan-Pembelian', 'double', 7, 10, ''),
(120, 27, 'Laporan Retur Pembelian', 'Laporan-Retur-Pembelian', 'double', 16, 10, ''),
(121, 27, 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', 16, 1, ''),
(122, 27, 'Laporan Penjualan', 'Laporan-Penjualan', 'double', 16, 17, ''),
(123, 28, 'User', 'user', 'double', 16, 10, ''),
(124, 28, 'password', 'password', 'double', 16, 10, ''),
(125, 29, 'supplier', 'supplier', 'double', 16, 10, ''),
(126, 30, 'Purchase Requisition', 'Purchase-Requisition', 'double', 16, 1, ''),
(127, 30, 'Laporan Permintaan', 'Laporan-Perrmintaan', 'double', 18, 10, ''),
(128, 30, 'Batal Purchase Requisition', 'Batal-Purchase-Requisition', 'double', 16, 10, ''),
(129, 31, 'Penawaran', 'Penawaran', 'double', 16, 10, ''),
(130, 31, 'Laporan Penawaran', 'Laporan-Penawaran', 'double', 16, 10, ''),
(131, 31, 'Formulir Fisik Penawaran ', 'Formulir-Fisik-Penawaran ', 'double', 16, 10, ''),
(132, 32, 'Purchase Order', 'Purchase-Order', 'double', 16, 10, ''),
(133, 32, 'Laporan Pemesanan', 'Laporan-Pemesanan', 'double', 16, 10, ''),
(134, 32, 'Batal Purchase Order', 'Batal \\-Purchase-Order', 'double', 16, 10, ''),
(135, 33, 'Pembelian', 'Pembelian', 'double', 1, 10, ''),
(136, 33, 'Laporan Pembelian', 'Laporan-Pembelian', 'double', 16, 10, ''),
(137, 33, 'Retur Pembelian', 'Retur-Pembelian', 'double', 16, 10, ''),
(138, 33, 'Laporan Retur PEmbelian', 'Laporan-Retur-PEmbelian', 'double', 16, 1, ''),
(139, 34, 'User', 'User', 'double', 16, 1, ''),
(140, 34, 'password', 'password', 'double', 16, 1, ''),
(141, 37, 'Lokasi', 'lokasi', 'double', 1, 10, ''),
(142, 37, 'Tempat', 'tempat', 'double', 13, 10, ''),
(143, 37, 'Tempat', 'tempat', 'double', 20, 12, ''),
(144, 35, 'Inventaris', 'inventaris', 'double', 8, 15, ''),
(145, 35, 'Peminjaman', 'peminjaman', 'double', 18, 17, ''),
(146, 35, 'aktivitas', 'aktivitas', 'double', 7, 12, ''),
(147, 38, 'user', 'user', 'double', 16, 10, ''),
(148, 39, 'tahap2', 'tahap2', 'double', 16, 10, '\r\n'),
(149, 38, 'password', 'password', 'double', 16, 10, ''),
(150, 39, 'tahap1', 'tahap1', 'double', 16, 10, ''),
(151, 39, 'tahap3', 'tahap3', 'double', 16, 10, ''),
(152, 4, 'Detail Diskon Tunai', 'detail-diskon-tunai', 'double', 16, 10, ''),
(153, 4, 'Detail Gelombang', 'detail-gelombang', 'double', 8, 11, '');

-- --------------------------------------------------------

--
-- Table structure for table `kon_modul`
--

CREATE TABLE IF NOT EXISTS `kon_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `kon_modul`
--

INSERT INTO `kon_modul` (`id_modul`, `id_grupmodul`, `link`, `modul`, `id_warna`, `id_icon`, `size`, `keterangan`) VALUES
(1, 1, 'akademik', 'akademik', 13, 9, 'double', ''),
(2, 1, 'psb', 'penerimaan siswa baru', 14, 10, 'double', ''),
(3, 1, 'perpus', 'perpustakaan', 3, 11, 'double double-vertical', ''),
(4, 1, 'sarpras', 'sarana dan prasarana', 4, 12, 'double double-vertical', ''),
(5, 2, 'hrd', 'kepegawaian', 5, 13, 'double double-vertical', ''),
(6, 2, 'keuangan', 'keuangan', 6, 14, 'double double-vertical', ''),
(7, 2, 'student', 'student services', 7, 15, 'double', ''),
(9, 3, 'konfigurasi', 'konfigurasi', 13, 14, 'double', '');

-- --------------------------------------------------------

--
-- Table structure for table `kon_privillege`
--

CREATE TABLE IF NOT EXISTS `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_privillege`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_menu` (`id_menu`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1551 ;

--
-- Dumping data for table `kon_privillege`
--

INSERT INTO `kon_privillege` (`id_privillege`, `id_login`, `id_menu`, `isDefault`) VALUES
(142, 42, 48, 1),
(143, 42, 46, 1),
(144, 42, 22, 1),
(145, 42, 45, 1),
(146, 42, 47, 1),
(147, 42, 19, 1),
(148, 42, 20, 1),
(149, 42, 21, 1),
(152, 44, 20, 1),
(153, 44, 21, 1),
(154, 45, 26, 0),
(155, 45, 25, 0),
(156, 45, 39, 0),
(157, 45, 33, 0),
(158, 45, 32, 0),
(159, 45, 30, 0),
(160, 45, 34, 0),
(161, 45, 31, 0),
(162, 45, 29, 0),
(163, 45, 28, 0),
(164, 45, 24, 0),
(165, 45, 35, 0),
(166, 45, 37, 0),
(167, 45, 38, 0),
(168, 45, 4, 0),
(169, 45, 40, 0),
(170, 45, 48, 0),
(171, 45, 46, 0),
(172, 45, 45, 0),
(173, 45, 47, 0),
(174, 45, 21, 0),
(175, 46, 26, 0),
(176, 46, 25, 0),
(177, 46, 39, 0),
(178, 46, 33, 0),
(179, 46, 32, 0),
(180, 46, 30, 0),
(181, 46, 34, 0),
(182, 46, 31, 0),
(183, 46, 29, 0),
(184, 46, 27, 0),
(185, 46, 28, 0),
(186, 46, 16, 0),
(187, 46, 15, 0),
(188, 46, 14, 0),
(189, 46, 13, 0),
(190, 46, 12, 0),
(691, 52, 24, 0),
(692, 52, 35, 0),
(693, 52, 37, 0),
(694, 52, 36, 0),
(695, 52, 38, 0),
(696, 52, 4, 0),
(697, 52, 40, 0),
(698, 52, 2, 0),
(699, 52, 3, 0),
(700, 52, 22, 0),
(701, 52, 45, 0),
(702, 52, 47, 0),
(703, 52, 19, 0),
(704, 52, 21, 0),
(1409, 58, 1, 1),
(1410, 58, 2, 1),
(1411, 58, 3, 1),
(1412, 58, 4, 1),
(1413, 58, 8, 1),
(1414, 58, 9, 1),
(1415, 58, 10, 1),
(1416, 58, 12, 1),
(1417, 58, 13, 1),
(1418, 58, 14, 1),
(1419, 58, 15, 1),
(1420, 58, 16, 1),
(1421, 58, 19, 1),
(1422, 58, 20, 1),
(1423, 58, 21, 1),
(1424, 58, 22, 1),
(1425, 58, 24, 1),
(1426, 58, 25, 1),
(1427, 58, 26, 1),
(1428, 58, 27, 1),
(1429, 58, 28, 1),
(1430, 58, 29, 1),
(1431, 58, 30, 1),
(1432, 58, 31, 1),
(1433, 58, 32, 1),
(1434, 58, 33, 1),
(1435, 58, 34, 1),
(1436, 58, 35, 1),
(1437, 58, 36, 1),
(1438, 58, 37, 1),
(1439, 58, 38, 1),
(1440, 58, 39, 1),
(1441, 58, 40, 1),
(1442, 58, 41, 1),
(1443, 58, 42, 1),
(1444, 58, 43, 1),
(1445, 58, 44, 1),
(1446, 58, 45, 1),
(1447, 58, 46, 1),
(1448, 58, 47, 1),
(1449, 58, 48, 1),
(1450, 58, 52, 1),
(1451, 58, 53, 1),
(1452, 58, 54, 1),
(1453, 58, 55, 1),
(1454, 58, 56, 1),
(1455, 58, 57, 1),
(1456, 58, 58, 1),
(1457, 58, 59, 1),
(1458, 58, 60, 1),
(1459, 58, 61, 1),
(1460, 58, 62, 1),
(1461, 58, 63, 1),
(1462, 58, 64, 1),
(1463, 58, 65, 1),
(1464, 58, 66, 1),
(1465, 58, 67, 1),
(1466, 58, 68, 1),
(1467, 58, 69, 1),
(1468, 58, 70, 1),
(1469, 58, 71, 1),
(1470, 58, 72, 1),
(1471, 58, 73, 1),
(1472, 58, 74, 1),
(1473, 58, 75, 1),
(1474, 58, 76, 1),
(1475, 58, 77, 1),
(1476, 58, 78, 1),
(1477, 58, 79, 1),
(1478, 58, 80, 1),
(1479, 58, 81, 1),
(1480, 58, 82, 1),
(1481, 58, 83, 1),
(1482, 58, 84, 1),
(1483, 58, 85, 1),
(1484, 58, 86, 1),
(1485, 58, 87, 1),
(1486, 58, 88, 1),
(1487, 58, 89, 1),
(1488, 58, 90, 1),
(1489, 58, 91, 1),
(1490, 58, 92, 1),
(1491, 58, 93, 1),
(1492, 58, 94, 1),
(1493, 58, 95, 1),
(1494, 58, 96, 1),
(1495, 58, 97, 1),
(1496, 58, 98, 1),
(1497, 58, 99, 1),
(1498, 58, 100, 1),
(1499, 58, 101, 1),
(1500, 58, 102, 1),
(1501, 58, 103, 1),
(1502, 58, 104, 1),
(1503, 58, 105, 1),
(1504, 58, 106, 1),
(1505, 58, 107, 1),
(1506, 58, 108, 1),
(1507, 58, 109, 1),
(1508, 58, 110, 1),
(1509, 58, 111, 1),
(1510, 58, 112, 1),
(1511, 58, 113, 1),
(1512, 58, 114, 1),
(1513, 58, 115, 1),
(1514, 58, 116, 1),
(1515, 58, 117, 1),
(1516, 58, 119, 1),
(1517, 58, 120, 1),
(1518, 58, 121, 1),
(1519, 58, 122, 1),
(1520, 58, 123, 1),
(1521, 58, 124, 1),
(1522, 58, 125, 1),
(1523, 58, 126, 1),
(1524, 58, 127, 1),
(1525, 58, 128, 1),
(1526, 58, 129, 1),
(1527, 58, 130, 1),
(1528, 58, 131, 1),
(1529, 58, 132, 1),
(1530, 58, 133, 1),
(1531, 58, 134, 1),
(1532, 58, 135, 1),
(1533, 58, 136, 1),
(1534, 58, 137, 1),
(1535, 58, 138, 1),
(1536, 58, 139, 1),
(1537, 58, 140, 1),
(1538, 58, 141, 1),
(1539, 58, 142, 1),
(1540, 58, 143, 1),
(1541, 58, 144, 1),
(1542, 58, 145, 1),
(1543, 58, 146, 1),
(1544, 58, 147, 1),
(1545, 58, 148, 1),
(1546, 58, 149, 1),
(1547, 58, 150, 1),
(1548, 58, 151, 1),
(1549, 58, 152, 1),
(1550, 58, 153, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kon_warna`
--

CREATE TABLE IF NOT EXISTS `kon_warna` (
  `id_warna` int(11) NOT NULL AUTO_INCREMENT,
  `warna` varchar(25) NOT NULL,
  PRIMARY KEY (`id_warna`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `kon_warna`
--

INSERT INTO `kon_warna` (`id_warna`, `warna`) VALUES
(1, 'black'),
(2, 'white'),
(3, 'lime'),
(4, 'green'),
(5, 'emerald'),
(6, 'teal'),
(7, 'cyan'),
(8, 'cobalt'),
(9, 'indigo'),
(10, 'violet'),
(11, 'pink'),
(12, 'magenta'),
(13, 'crimson'),
(14, 'red'),
(15, 'orange'),
(16, 'amber'),
(17, 'yellow'),
(18, 'brown'),
(19, 'olive'),
(20, 'steel'),
(21, 'mauve'),
(22, 'taupe'),
(23, 'gray'),
(24, 'dark'),
(25, 'darker'),
(26, 'transparent'),
(27, 'darkBrown'),
(28, 'darkCrimson'),
(29, 'darkMagenta'),
(30, 'darkIndigo'),
(31, 'darkCyan'),
(32, 'darkCobalt'),
(33, 'darkTeal'),
(34, 'darkEmerald'),
(35, 'darkGreen'),
(36, 'darkOrange'),
(37, 'darkRed'),
(38, 'darkPink'),
(39, 'darkViolet'),
(40, 'darkBlue'),
(41, 'lightBlue'),
(42, 'lightTeal'),
(43, 'lightOlive'),
(44, 'lightOrange'),
(45, 'lightPink'),
(46, 'lightRed'),
(47, 'lightGreen');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `action` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `level`, `action`, `keterangan`) VALUES
(1, 'SA', 'MTR', 'superadmin'),
(2, 'A', 'MTR', 'admin'),
(3, 'O', 'TR', 'operator'),
(4, 'G', 'R', 'guest');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  UNIQUE KEY `username` (`username`),
  KEY `id_level` (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_editor`
--

CREATE TABLE IF NOT EXISTS `menu_editor` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_users`
--

CREATE TABLE IF NOT EXISTS `menu_users` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `modul` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modul_hrd`
--

CREATE TABLE IF NOT EXISTS `modul_hrd` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `modul` varchar(30) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `setup` varchar(50) NOT NULL DEFAULT '',
  `posisi` tinyint(2) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(5) NOT NULL DEFAULT '0',
  `type` enum('block','module') NOT NULL DEFAULT 'module',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mst_agama`
--

CREATE TABLE IF NOT EXISTS `mst_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mst_suku`
--

CREATE TABLE IF NOT EXISTS `mst_suku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suku` varchar(20) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`suku`),
  UNIQUE KEY `UX_suku` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_alur_stok`
--

CREATE TABLE IF NOT EXISTS `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=748 ;

--
-- Dumping data for table `pos_alur_stok`
--

INSERT INTO `pos_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(1, '2015-09-03', 'Pembelian', 'INV0309150001', 'KPR1307150028', '13'),
(2, '2015-09-04', 'Pembelian', 'INV0409150002', 'KPR1307150028', '13'),
(3, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR1307150028', '13'),
(4, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR1307150029', '17'),
(5, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR1307150030', '17'),
(6, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150031', '18'),
(7, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150032', '19'),
(8, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150033', '19'),
(9, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150034', '8'),
(10, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150035', '8'),
(11, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150036', '9'),
(12, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150037', '9'),
(13, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150038', '2'),
(14, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150039', '2'),
(15, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150040', '17'),
(16, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150041', '17'),
(17, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150042', '18'),
(18, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150043', '18'),
(19, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150044', '19'),
(20, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150045', '19'),
(21, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150046', '8'),
(22, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150047', '8'),
(23, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150048', '9'),
(24, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150049', '9'),
(25, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150050', '2'),
(26, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150051', '2'),
(27, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150052', '17'),
(28, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150053', '17'),
(29, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150054', '18'),
(30, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150055', '18'),
(31, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150056', '19'),
(32, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150057', '19'),
(33, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150058', '8'),
(34, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150059', '8'),
(35, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150060', '9'),
(36, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150061', '9'),
(37, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR0409150177', '2'),
(38, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR0409150178', '2'),
(39, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150073', '17'),
(40, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150074', '17'),
(41, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150075', '18'),
(42, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150076', '18'),
(43, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150077', '19'),
(44, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150078', '19'),
(45, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150079', '8'),
(46, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150080', '8'),
(47, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150081', '8'),
(48, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150082', '8'),
(49, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150083', '9'),
(50, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150084', '9'),
(51, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150085', '9'),
(52, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150086', '9'),
(53, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150087', '2'),
(54, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150088', '2'),
(55, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150089', '2'),
(56, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150090', '3'),
(57, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150062', '16'),
(58, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150063', '17'),
(59, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150064', '18'),
(60, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150065', '18'),
(61, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150066', '19'),
(62, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150067', '19'),
(63, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150068', '8'),
(64, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150069', '8'),
(65, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150070', '9'),
(66, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150071', '9'),
(67, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150072', '2'),
(68, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR0409150179', '2'),
(69, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150091', '17'),
(70, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150092', '16'),
(71, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150093', '19'),
(72, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150094', '8'),
(73, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150095', '9'),
(74, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150096', '2'),
(75, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150097', '17'),
(76, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150098', '18'),
(77, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150099', '19'),
(78, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150100', '19'),
(79, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150101', '8'),
(80, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150102', '8'),
(81, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150103', '9'),
(82, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150104', '9'),
(83, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150105', '2'),
(84, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150106', '2'),
(85, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150107', '17'),
(86, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150108', '18'),
(87, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150109', '19'),
(88, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150110', '8'),
(89, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150111', '10'),
(90, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150112', '2'),
(91, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150113', '17'),
(92, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150114', '18'),
(93, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150115', '19'),
(94, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150116', '3'),
(95, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150117', '10'),
(96, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150118', '2'),
(97, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150120', '16'),
(98, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150121', '18'),
(99, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150122', '19'),
(100, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150123', '8'),
(101, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150124', '10'),
(102, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150125', '4'),
(103, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150126', '16'),
(104, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150127', '18'),
(105, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150128', '19'),
(106, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150129', '8'),
(107, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150130', '10'),
(108, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150131', '4'),
(109, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150119', '15'),
(110, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150182', '18'),
(111, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150180', '16'),
(112, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150184', '19'),
(113, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150186', '8'),
(114, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150188', '10'),
(115, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150190', '5'),
(116, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150181', '16'),
(117, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150183', '18'),
(118, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150185', '19'),
(119, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150187', '8'),
(120, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150189', '10'),
(121, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150191', '5'),
(122, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150198', '16'),
(123, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150199', '18'),
(124, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150200', '19'),
(125, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150201', '8'),
(126, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150202', '10'),
(127, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150203', '5'),
(128, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150192', '16'),
(129, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150193', '18'),
(130, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150194', '19'),
(131, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150195', '8'),
(132, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150196', '10'),
(133, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150197', '5'),
(134, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150066', '1'),
(135, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150077', '1'),
(136, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150093', '1'),
(137, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150099', '1'),
(138, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150115', '1'),
(139, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150109', '1'),
(140, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2508150032', '1'),
(141, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150044', '1'),
(142, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150056', '1'),
(143, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150194', '1'),
(144, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150200', '1'),
(145, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150184', '1'),
(146, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150185', '1'),
(147, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150134', '1'),
(148, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150140', '1'),
(149, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150122', '1'),
(150, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150128', '1'),
(151, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR3108150148', '1'),
(152, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150204', '1'),
(153, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150144', '17'),
(154, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150145', '17'),
(155, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150146', '18'),
(156, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150147', '18'),
(157, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150148', '19'),
(158, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150149', '19'),
(159, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150150', '8'),
(160, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150151', '8'),
(161, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150152', '9'),
(162, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150153', '9'),
(163, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150154', '3'),
(164, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150155', '3'),
(165, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150138', '17'),
(166, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150139', '18'),
(167, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150140', '20'),
(168, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150141', '8'),
(169, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150143', '4'),
(170, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150132', '17'),
(171, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150133', '18'),
(172, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150134', '19'),
(173, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150135', '8'),
(174, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150136', '9'),
(175, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150137', '3'),
(176, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150156', '8'),
(177, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150157', '10'),
(178, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150158', '5'),
(179, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150142', '8'),
(180, '2015-09-11', 'Pembelian', 'INV1109150007', 'KPR1109150204', '81'),
(181, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150062', '1'),
(182, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150073', '1'),
(183, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150091', '1'),
(184, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150097', '1'),
(185, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150113', '1'),
(186, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150107', '1'),
(187, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1307150028', '1'),
(188, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150040', '1'),
(189, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150052', '1'),
(190, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150180', '1'),
(191, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150181', '1'),
(192, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150198', '1'),
(193, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150192', '1'),
(194, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150138', '1'),
(195, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150132', '1'),
(196, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR3108150144', '1'),
(197, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150120', '1'),
(198, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150126', '1'),
(199, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150204', '1'),
(200, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150119', '1'),
(201, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150064', '1'),
(202, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150075', '1'),
(203, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150092', '1'),
(204, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150098', '1'),
(205, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150114', '1'),
(206, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150108', '1'),
(207, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1307150030', '1'),
(208, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150054', '1'),
(209, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150199', '1'),
(210, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150193', '1'),
(211, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150182', '1'),
(212, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150183', '1'),
(213, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR3108150146', '1'),
(214, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150139', '1'),
(215, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150133', '1'),
(216, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150121', '1'),
(217, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150127', '1'),
(218, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150204', '1'),
(219, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150042', '1'),
(220, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150066', '1'),
(221, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150077', '1'),
(222, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150093', '1'),
(223, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150099', '1'),
(224, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150115', '1'),
(225, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150109', '1'),
(226, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2508150032', '1'),
(227, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150056', '1'),
(228, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150044', '1'),
(229, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150194', '1'),
(230, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150200', '1'),
(231, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150184', '1'),
(232, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150185', '1'),
(233, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150140', '1'),
(234, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150134', '1'),
(235, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR3108150148', '1'),
(236, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150122', '1'),
(237, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150128', '1'),
(238, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150204', '1'),
(239, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150068', '1'),
(240, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150079', '1'),
(241, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150080', '1'),
(242, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150094', '1'),
(243, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150101', '1'),
(244, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150116', '1'),
(245, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150110', '1'),
(246, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2508150034', '1'),
(247, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150046', '1'),
(248, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150058', '1'),
(249, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150186', '1'),
(250, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150187', '1'),
(251, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150201', '1'),
(252, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150195', '1'),
(253, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR3108150150', '1'),
(254, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150135', '1'),
(255, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150141', '1'),
(256, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150123', '1'),
(257, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150129', '1'),
(258, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR3108150156', '1'),
(259, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150204', '1'),
(260, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150073', '1'),
(261, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150062', '1'),
(262, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150091', '1'),
(263, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150097', '1'),
(264, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150113', '1'),
(265, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150107', '1'),
(266, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1307150028', '1'),
(267, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150040', '1'),
(268, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150052', '1'),
(269, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150192', '1'),
(270, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150198', '1'),
(271, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150180', '1'),
(272, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150181', '1'),
(273, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150138', '1'),
(274, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150132', '1'),
(275, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR3108150144', '1'),
(276, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150119', '1'),
(277, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150204', '1'),
(278, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150120', '1'),
(279, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150126', '1'),
(280, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150062', '1'),
(281, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150073', '1'),
(282, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150091', '1'),
(283, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150097', '1'),
(284, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150113', '1'),
(285, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150107', '1'),
(286, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1307150028', '1'),
(287, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150040', '1'),
(288, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150052', '1'),
(289, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150192', '1'),
(290, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150198', '1'),
(291, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150180', '1'),
(292, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150181', '1'),
(293, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR3108150144', '1'),
(294, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150138', '1'),
(295, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150132', '1'),
(296, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150120', '1'),
(297, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150126', '1'),
(298, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150119', '1'),
(299, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150204', '1'),
(300, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150062', '1'),
(301, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150073', '1'),
(302, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150091', '1'),
(303, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150097', '1'),
(304, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150113', '1'),
(305, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150107', '1'),
(306, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1307150028', '1'),
(307, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150040', '1'),
(308, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150052', '1'),
(309, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150192', '1'),
(310, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150198', '1'),
(311, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150180', '1'),
(312, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150181', '1'),
(313, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR3108150144', '1'),
(314, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150138', '1'),
(315, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150120', '1'),
(316, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150126', '1'),
(317, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150204', '1'),
(318, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150119', '1'),
(319, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150062', '1'),
(320, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150073', '1'),
(321, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150091', '1'),
(322, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150097', '1'),
(323, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150113', '1'),
(324, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150107', '1'),
(325, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1307150028', '1'),
(326, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150040', '1'),
(327, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150052', '1'),
(328, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150192', '1'),
(329, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150198', '1'),
(330, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150180', '1'),
(331, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150181', '1'),
(332, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150132', '1'),
(333, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR3108150144', '1'),
(334, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150138', '1'),
(335, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150120', '1'),
(336, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150126', '1'),
(337, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150119', '1'),
(338, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150204', '1'),
(339, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150062', '1'),
(340, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150073', '1'),
(341, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150091', '1'),
(342, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150097', '1'),
(343, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150113', '1'),
(344, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150107', '1'),
(345, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1307150028', '1'),
(346, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150040', '1'),
(347, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150052', '1'),
(348, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150192', '1'),
(349, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150198', '1'),
(350, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150180', '1'),
(351, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150181', '1'),
(352, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150132', '1'),
(353, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR3108150144', '1'),
(354, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150138', '1'),
(355, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150120', '1'),
(356, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150126', '1'),
(357, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150119', '1'),
(358, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150204', '1'),
(359, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150062', '1'),
(360, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150073', '1'),
(361, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150091', '1'),
(362, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150097', '1'),
(363, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150113', '1'),
(364, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150107', '1'),
(365, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1307150028', '1'),
(366, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150040', '1'),
(367, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150052', '1'),
(368, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150192', '1'),
(369, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150198', '1'),
(370, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150180', '1'),
(371, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150181', '1'),
(372, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150132', '1'),
(373, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR3108150144', '1'),
(374, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150138', '1'),
(375, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150120', '1'),
(376, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150126', '1'),
(377, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150119', '1'),
(378, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150204', '1'),
(379, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150062', '1'),
(380, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150073', '1'),
(381, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150091', '1'),
(382, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150097', '1'),
(383, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150113', '1'),
(384, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150107', '1'),
(385, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150192', '1'),
(386, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150198', '1'),
(387, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150180', '1'),
(388, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150181', '1'),
(389, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150132', '1'),
(390, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR3108150144', '1'),
(391, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150138', '1'),
(392, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150120', '1'),
(393, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150126', '1'),
(394, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150119', '1'),
(395, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1307150028', '1'),
(396, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150040', '1'),
(397, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150052', '1'),
(398, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150204', '1'),
(399, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150062', '1'),
(400, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150073', '1'),
(401, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150091', '1'),
(402, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150097', '1'),
(403, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150113', '1'),
(404, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150107', '1'),
(405, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1307150028', '1'),
(406, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150040', '1'),
(407, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150052', '1'),
(408, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150192', '1'),
(409, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150198', '1'),
(410, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150180', '1'),
(411, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150181', '1'),
(412, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150132', '1'),
(413, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR3108150144', '1'),
(414, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150138', '1'),
(415, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150120', '1'),
(416, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150126', '1'),
(417, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150119', '1'),
(418, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150204', '1'),
(419, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150062', '1'),
(420, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150073', '1'),
(421, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150091', '1'),
(422, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150097', '1'),
(423, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150113', '1'),
(424, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150107', '1'),
(425, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1307150028', '1'),
(426, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150040', '1'),
(427, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150052', '1'),
(428, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150192', '1'),
(429, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150198', '1'),
(430, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150180', '1'),
(431, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150181', '1'),
(432, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR3108150144', '1'),
(433, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150138', '1'),
(434, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150120', '1'),
(435, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150126', '1'),
(436, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150204', '1'),
(437, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150119', '1'),
(438, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150062', '1'),
(439, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150073', '1'),
(440, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150091', '1'),
(441, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150097', '1'),
(442, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150113', '1'),
(443, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150107', '1'),
(444, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1307150028', '1'),
(445, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150040', '1'),
(446, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150052', '1'),
(447, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150192', '1'),
(448, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150198', '1'),
(449, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150180', '1'),
(450, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150181', '1'),
(451, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150132', '1'),
(452, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR3108150144', '1'),
(453, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150138', '1'),
(454, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150120', '1'),
(455, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150126', '1'),
(456, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150119', '1'),
(457, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150204', '1'),
(458, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150062', '1'),
(459, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150073', '1'),
(460, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150097', '1'),
(461, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150113', '1'),
(462, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150107', '1'),
(463, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1307150028', '1'),
(464, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150040', '1'),
(465, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150052', '1'),
(466, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150192', '1'),
(467, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150198', '1'),
(468, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150180', '1'),
(469, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150181', '1'),
(470, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150132', '1'),
(471, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR3108150144', '1'),
(472, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150138', '1'),
(473, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150120', '1'),
(474, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150126', '1'),
(475, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150119', '1'),
(476, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150204', '1'),
(477, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150062', '1'),
(478, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150073', '1'),
(479, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150091', '1'),
(480, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150097', '1'),
(481, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150113', '1'),
(482, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150107', '1'),
(483, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1307150028', '1'),
(484, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150040', '1'),
(485, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150052', '1'),
(486, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150192', '1'),
(487, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150198', '1'),
(488, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150180', '1'),
(489, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150181', '1'),
(490, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150132', '1'),
(491, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR3108150144', '1'),
(492, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150138', '1'),
(493, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150120', '1'),
(494, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150126', '1'),
(495, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150119', '1'),
(496, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150204', '1'),
(497, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150062', '1'),
(498, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150073', '1'),
(499, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150091', '1'),
(500, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150097', '1'),
(501, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150113', '1'),
(502, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150107', '1'),
(503, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1307150028', '1'),
(504, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150040', '1'),
(505, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150052', '1'),
(506, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150192', '1'),
(507, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150198', '1'),
(508, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150132', '1'),
(509, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR3108150144', '1'),
(510, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150138', '1'),
(511, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150120', '1'),
(512, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150126', '1'),
(513, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150119', '1'),
(514, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150180', '1'),
(515, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150181', '1'),
(516, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150204', '1'),
(517, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150062', '1'),
(518, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150073', '1'),
(519, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150091', '1'),
(520, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150097', '1'),
(521, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150113', '1'),
(522, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150107', '1'),
(523, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1307150028', '1'),
(524, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150040', '1'),
(525, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150052', '1'),
(526, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150192', '1'),
(527, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150198', '1'),
(528, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150180', '1'),
(529, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150181', '1'),
(530, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150132', '1'),
(531, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR3108150144', '1'),
(532, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150138', '1'),
(533, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150120', '1'),
(534, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150126', '1'),
(535, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150119', '1'),
(536, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150204', '1'),
(537, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150062', '1'),
(538, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150073', '1'),
(539, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150091', '1'),
(540, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150097', '1'),
(541, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150113', '1'),
(542, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150107', '1'),
(543, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1307150028', '1'),
(544, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150040', '1'),
(545, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150052', '1'),
(546, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150192', '1'),
(547, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150198', '1'),
(548, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150180', '1'),
(549, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150181', '1'),
(550, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150132', '1'),
(551, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR3108150144', '1'),
(552, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150138', '1'),
(553, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150120', '1'),
(554, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150126', '1'),
(555, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150119', '1'),
(556, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150204', '1'),
(557, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150062', '1'),
(558, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150073', '1'),
(559, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150091', '1'),
(560, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150097', '1'),
(561, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150113', '1'),
(562, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150107', '1'),
(563, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1307150028', '1'),
(564, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150040', '1'),
(565, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150052', '1'),
(566, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150192', '1'),
(567, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150198', '1'),
(568, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150180', '1'),
(569, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150181', '1'),
(570, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150132', '1'),
(571, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR3108150144', '1'),
(572, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150138', '1'),
(573, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150120', '1'),
(574, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150126', '1'),
(575, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150119', '1'),
(576, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150204', '1'),
(577, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150062', '1'),
(578, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150073', '1'),
(579, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150091', '1'),
(580, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150097', '1'),
(581, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150113', '1'),
(582, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150107', '1'),
(583, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1307150028', '1'),
(584, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150040', '1'),
(585, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150052', '1'),
(586, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150192', '1'),
(587, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150198', '1'),
(588, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150180', '1'),
(589, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150181', '1'),
(590, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150132', '1'),
(591, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR3108150144', '1'),
(592, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150138', '1'),
(593, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150120', '1'),
(594, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150126', '1'),
(595, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150119', '1'),
(596, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150204', '1'),
(597, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150062', '1'),
(598, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150073', '1'),
(599, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150091', '1'),
(600, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150097', '1'),
(601, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150113', '1'),
(602, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150107', '1'),
(603, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1307150028', '1'),
(604, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150040', '1'),
(605, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150052', '1'),
(606, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150192', '1'),
(607, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150198', '1'),
(608, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150180', '1'),
(609, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150181', '1'),
(610, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150132', '1'),
(611, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR3108150144', '1'),
(612, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150138', '1'),
(613, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150120', '1'),
(614, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150126', '1'),
(615, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150119', '1'),
(616, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150204', '1'),
(617, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150064', '1'),
(618, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150075', '1'),
(619, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150092', '1'),
(620, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150098', '1'),
(621, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150114', '1'),
(622, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150108', '1'),
(623, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1307150030', '1'),
(624, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150042', '1'),
(625, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150054', '1'),
(626, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150193', '1'),
(627, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150199', '1'),
(628, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150182', '1'),
(629, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150183', '1'),
(630, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150133', '1'),
(631, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR3108150146', '1'),
(632, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150139', '1'),
(633, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150121', '1'),
(634, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150127', '1'),
(635, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150204', '1'),
(636, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150064', '1'),
(637, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150075', '1'),
(638, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150092', '1'),
(639, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150098', '1'),
(640, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150114', '1'),
(641, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150108', '1'),
(642, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1307150030', '1'),
(643, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150042', '1'),
(644, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150054', '1'),
(645, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150193', '1'),
(646, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150199', '1'),
(647, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150182', '1'),
(648, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150183', '1'),
(649, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150133', '1'),
(650, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR3108150146', '1'),
(651, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150139', '1'),
(652, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150121', '1'),
(653, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150127', '1'),
(654, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150204', '1'),
(655, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150064', '1'),
(656, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150075', '1'),
(657, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150092', '1'),
(658, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150098', '1'),
(659, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150114', '1'),
(660, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150108', '1'),
(661, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1307150030', '1'),
(662, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150042', '1'),
(663, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150054', '1'),
(664, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150193', '1'),
(665, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150199', '1'),
(666, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150182', '1'),
(667, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150183', '1'),
(668, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150133', '1'),
(669, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR3108150146', '1'),
(670, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150139', '1'),
(671, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150121', '1'),
(672, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150127', '1'),
(673, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150204', '1'),
(674, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150064', '1'),
(675, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150075', '1'),
(676, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150092', '1'),
(677, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150098', '1'),
(678, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150114', '1'),
(679, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150108', '1'),
(680, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1307150030', '1'),
(681, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150042', '1'),
(682, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150054', '1'),
(683, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150193', '1'),
(684, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150199', '1'),
(685, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150182', '1'),
(686, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150183', '1'),
(687, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150133', '1'),
(688, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR3108150146', '1'),
(689, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150139', '1'),
(690, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150121', '1'),
(691, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150127', '1'),
(692, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150204', '1'),
(693, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150064', '1'),
(694, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150075', '1'),
(695, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150092', '1'),
(696, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150098', '1'),
(697, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150114', '1'),
(698, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150108', '1'),
(699, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1307150030', '1');
INSERT INTO `pos_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(700, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150042', '1'),
(701, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150054', '1'),
(702, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150193', '1'),
(703, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150199', '1'),
(704, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150182', '1'),
(705, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150183', '1'),
(706, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150133', '1'),
(707, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR3108150146', '1'),
(708, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150139', '1'),
(709, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150121', '1'),
(710, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150127', '1'),
(711, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150204', '1'),
(712, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150064', '1'),
(713, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150075', '1'),
(714, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150092', '1'),
(715, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150098', '1'),
(716, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150114', '1'),
(717, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150108', '1'),
(718, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1307150030', '1'),
(719, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150042', '1'),
(720, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150054', '1'),
(721, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150193', '1'),
(722, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150199', '1'),
(723, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150182', '1'),
(724, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150183', '1'),
(725, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150133', '1'),
(726, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR3108150146', '1'),
(727, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150139', '1'),
(728, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150121', '1'),
(729, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150127', '1'),
(730, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150204', '1'),
(731, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150064', '1'),
(732, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150075', '1'),
(733, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150098', '1'),
(734, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150108', '1'),
(735, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1307150030', '1'),
(736, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150042', '1'),
(737, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150054', '1'),
(738, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150193', '1'),
(739, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150199', '1'),
(740, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150182', '1'),
(741, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150183', '1'),
(742, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150133', '1'),
(743, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR3108150146', '1'),
(744, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150139', '1'),
(745, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150121', '1'),
(746, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150127', '1'),
(747, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150204', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pos_biayabulanan`
--

CREATE TABLE IF NOT EXISTS `pos_biayabulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_customer`
--

CREATE TABLE IF NOT EXISTS `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_jenisproduk`
--

CREATE TABLE IF NOT EXISTS `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis` enum('BARANG','JASA') NOT NULL DEFAULT 'BARANG',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `pos_jenisproduk`
--

INSERT INTO `pos_jenisproduk` (`id`, `nama`, `jenis`) VALUES
(1, 'SERAGAM', 'BARANG'),
(3, 'BUKU', 'BARANG'),
(6, 'FORM', 'JASA');

-- --------------------------------------------------------

--
-- Table structure for table `pos_jenjang`
--

CREATE TABLE IF NOT EXISTS `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pos_jenjang`
--

INSERT INTO `pos_jenjang` (`id`, `nama`) VALUES
(1, 'Playgroup'),
(2, 'Kindegarden'),
(3, 'Elementary'),
(4, 'Primary'),
(5, 'Secondary');

-- --------------------------------------------------------

--
-- Table structure for table `pos_kelas`
--

CREATE TABLE IF NOT EXISTS `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_kelas`
--

INSERT INTO `pos_kelas` (`id`, `nama`, `jenjang`) VALUES
(1, 'A', '3'),
(2, 'B', '2');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelian`
--

CREATE TABLE IF NOT EXISTS `pos_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `hutang` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pos_pembelian`
--

INSERT INTO `pos_pembelian` (`id`, `noinvoice`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `hutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'INV0309150001', '', '2015-09-03', 'SUP1307150004', 'Tunai', '873600', '0', '873600', '873600', '0', '0', '', 'admin'),
(2, 'INV0409150002', '', '2015-09-04', 'SUP1307150004', 'Tunai', '873600', '0', '873600', '873600', '0', '0', '', 'admin'),
(3, 'INV0409150003', '', '2015-09-04', 'SUP1307150004', 'Tunai', '79926125', '0', '79926125', '79926125', '0', '0', '', 'admin'),
(4, 'INV1109150004', '', '2015-09-11', 'SUP1307150004', 'Tunai', '12028500', '0', '12028500', '12028500', '0', '0', '', 'admin'),
(5, 'INV1109150005', '', '2015-09-11', 'SUP1307150004', 'Tunai', '1083500', '0', '1083500', '1083500', '0', '0', '', 'admin'),
(6, 'INV1109150006', '', '2015-09-11', 'SUP1307150006', 'Tunai', '11963000', '0', '11963000', '11963000', '0', '0', '', 'admin'),
(7, 'INV1109150007', '', '2015-09-11', 'SUP1109150009', 'Tunai', '4455000', '0', '4455000', '4455000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembeliandetail`
--

CREATE TABLE IF NOT EXISTS `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=181 ;

--
-- Dumping data for table `pos_pembeliandetail`
--

INSERT INTO `pos_pembeliandetail` (`id`, `noinvoice`, `nopo`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'INV0309150001', '', 'KPR1307150028', '13', '84000', '20', '873600'),
(2, 'INV0409150002', '', 'KPR1307150028', '13', '84000', '20', '873600'),
(3, 'INV0409150003', '', 'KPR1307150028', '13', '84000', '20', '873600'),
(4, 'INV0409150003', '', 'KPR1307150029', '17', '84000', '20', '1142400'),
(5, 'INV0409150003', '', 'KPR1307150030', '17', '84000', '20', '1142400'),
(6, 'INV0409150003', '', 'KPR2508150031', '18', '84000', '20', '1209600'),
(7, 'INV0409150003', '', 'KPR2508150032', '19', '84000', '20', '1276800'),
(8, 'INV0409150003', '', 'KPR2508150033', '19', '84000', '20', '1276800'),
(9, 'INV0409150003', '', 'KPR2508150034', '8', '87000', '20', '556800'),
(10, 'INV0409150003', '', 'KPR2508150035', '8', '87000', '20', '556800'),
(11, 'INV0409150003', '', 'KPR2808150036', '9', '87000', '20', '626400'),
(12, 'INV0409150003', '', 'KPR2808150037', '9', '87000', '20', '626400'),
(13, 'INV0409150003', '', 'KPR2808150038', '2', '87000', '20', '139200'),
(14, 'INV0409150003', '', 'KPR2808150039', '2', '87000', '20', '139200'),
(15, 'INV0409150003', '', 'KPR2808150040', '17', '72000', '20', '979200'),
(16, 'INV0409150003', '', 'KPR2808150041', '17', '72000', '20', '979200'),
(17, 'INV0409150003', '', 'KPR2808150042', '18', '72000', '20', '1036800'),
(18, 'INV0409150003', '', 'KPR2808150043', '18', '72000', '20', '1036800'),
(19, 'INV0409150003', '', 'KPR2808150044', '19', '72000', '20', '1094400'),
(20, 'INV0409150003', '', 'KPR2808150045', '19', '72000', '20', '1094400'),
(21, 'INV0409150003', '', 'KPR2808150046', '8', '72000', '20', '460800'),
(22, 'INV0409150003', '', 'KPR2808150047', '8', '72000', '20', '460800'),
(23, 'INV0409150003', '', 'KPR2808150048', '9', '72000', '20', '518400'),
(24, 'INV0409150003', '', 'KPR2808150049', '9', '72000', '20', '518400'),
(25, 'INV0409150003', '', 'KPR2808150050', '2', '72000', '20', '115200'),
(26, 'INV0409150003', '', 'KPR2808150051', '2', '72000', '20', '115200'),
(27, 'INV0409150003', '', 'KPR2808150052', '17', '85000', '20', '1156000'),
(28, 'INV0409150003', '', 'KPR2808150053', '17', '85000', '20', '1156000'),
(29, 'INV0409150003', '', 'KPR2808150054', '18', '85000', '20', '1224000'),
(30, 'INV0409150003', '', 'KPR2808150055', '18', '85000', '20', '1224000'),
(31, 'INV0409150003', '', 'KPR2808150056', '19', '85000', '20', '1292000'),
(32, 'INV0409150003', '', 'KPR2808150057', '19', '85000', '20', '1292000'),
(33, 'INV0409150003', '', 'KPR2808150058', '8', '85000', '20', '544000'),
(34, 'INV0409150003', '', 'KPR2808150059', '8', '85000', '20', '544000'),
(35, 'INV0409150003', '', 'KPR2808150060', '9', '85000', '20', '612000'),
(36, 'INV0409150003', '', 'KPR2808150061', '9', '85000', '20', '612000'),
(37, 'INV0409150003', '', 'KPR0409150177', '2', '85000', '20', '136000'),
(38, 'INV0409150003', '', 'KPR0409150178', '2', '85000', '20', '136000'),
(39, 'INV0409150003', '', 'KPR2808150073', '17', '78000', '20', '1060800'),
(40, 'INV0409150003', '', 'KPR2808150074', '17', '78000', '20', '1060800'),
(41, 'INV0409150003', '', 'KPR2808150075', '18', '83000', '20', '1195200'),
(42, 'INV0409150003', '', 'KPR2808150076', '18', '86000', '20', '1238400'),
(43, 'INV0409150003', '', 'KPR2808150077', '19', '86000', '20', '1307200'),
(44, 'INV0409150003', '', 'KPR2808150078', '19', '86000', '20', '1307200'),
(45, 'INV0409150003', '', 'KPR2808150079', '8', '56000', '20', '358400'),
(46, 'INV0409150003', '', 'KPR2808150080', '8', '56000', '20', '358400'),
(47, 'INV0409150003', '', 'KPR2808150081', '8', '56000', '20', '358400'),
(48, 'INV0409150003', '', 'KPR2808150082', '8', '56000', '20', '358400'),
(49, 'INV0409150003', '', 'KPR2808150083', '9', '56000', '20', '403200'),
(50, 'INV0409150003', '', 'KPR2808150084', '9', '56000', '20', '403200'),
(51, 'INV0409150003', '', 'KPR2808150085', '9', '56000', '20', '403200'),
(52, 'INV0409150003', '', 'KPR2808150086', '9', '56000', '20', '403200'),
(53, 'INV0409150003', '', 'KPR2808150087', '2', '56000', '20', '89600'),
(54, 'INV0409150003', '', 'KPR2808150088', '2', '56000', '20', '89600'),
(55, 'INV0409150003', '', 'KPR2808150089', '2', '56000', '20', '89600'),
(56, 'INV0409150003', '', 'KPR2808150090', '3', '56000', '20', '134400'),
(57, 'INV0409150003', '', 'KPR2808150062', '16', '90000', '20', '1152000'),
(58, 'INV0409150003', '', 'KPR2808150063', '17', '90000', '20', '1224000'),
(59, 'INV0409150003', '', 'KPR2808150064', '18', '100000', '20', '1440000'),
(60, 'INV0409150003', '', 'KPR2808150065', '18', '105000', '20', '1512000'),
(61, 'INV0409150003', '', 'KPR2808150066', '19', '105000', '20', '1596000'),
(62, 'INV0409150003', '', 'KPR2808150067', '19', '105000', '20', '1596000'),
(63, 'INV0409150003', '', 'KPR2808150068', '8', '106000', '20', '678400'),
(64, 'INV0409150003', '', 'KPR2808150069', '8', '106000', '20', '678400'),
(65, 'INV0409150003', '', 'KPR2808150070', '9', '106000', '20', '763200'),
(66, 'INV0409150003', '', 'KPR2808150071', '9', '106000', '20', '763200'),
(67, 'INV0409150003', '', 'KPR2808150072', '2', '106000', '20', '169600'),
(68, 'INV0409150003', '', 'KPR0409150179', '2', '106000', '20', '169600'),
(69, 'INV0409150003', '', 'KPR2808150091', '17', '137000', '25', '1746750'),
(70, 'INV0409150003', '', 'KPR2808150092', '16', '137000', '25', '1644000'),
(71, 'INV0409150003', '', 'KPR2808150093', '19', '145500', '25', '2073375'),
(72, 'INV0409150003', '', 'KPR2808150094', '8', '137000', '25', '822000'),
(73, 'INV0409150003', '', 'KPR2808150095', '9', '137000', '25', '924750'),
(74, 'INV0409150003', '', 'KPR2808150096', '2', '116000', '25', '174000'),
(75, 'INV0409150003', '', 'KPR2808150097', '17', '95000', '25', '1211250'),
(76, 'INV0409150003', '', 'KPR2808150098', '18', '95000', '25', '1282500'),
(77, 'INV0409150003', '', 'KPR2808150099', '19', '64500', '25', '919125'),
(78, 'INV0409150003', '', 'KPR2808150100', '19', '64500', '25', '919125'),
(79, 'INV0409150003', '', 'KPR2808150101', '8', '64500', '25', '387000'),
(80, 'INV0409150003', '', 'KPR2808150102', '8', '64500', '25', '387000'),
(81, 'INV0409150003', '', 'KPR2808150103', '9', '64500', '25', '435375'),
(82, 'INV0409150003', '', 'KPR2808150104', '9', '64500', '25', '435375'),
(83, 'INV0409150003', '', 'KPR2808150105', '2', '64500', '25', '96750'),
(84, 'INV0409150003', '', 'KPR2808150106', '2', '64500', '25', '96750'),
(85, 'INV0409150003', '', 'KPR2808150107', '17', '40500', '25', '516375'),
(86, 'INV0409150003', '', 'KPR2808150108', '18', '40500', '25', '546750'),
(87, 'INV0409150003', '', 'KPR2808150109', '19', '40500', '25', '577125'),
(88, 'INV0409150003', '', 'KPR2808150110', '8', '40500', '25', '243000'),
(89, 'INV0409150003', '', 'KPR2808150111', '10', '40500', '25', '303750'),
(90, 'INV0409150003', '', 'KPR2808150112', '2', '40500', '25', '60750'),
(91, 'INV0409150003', '', 'KPR2808150113', '17', '99000', '25', '1262250'),
(92, 'INV0409150003', '', 'KPR2808150114', '18', '99000', '25', '1336500'),
(93, 'INV0409150003', '', 'KPR2808150115', '19', '99000', '25', '1410750'),
(94, 'INV0409150003', '', 'KPR2808150116', '3', '99000', '25', '222750'),
(95, 'INV0409150003', '', 'KPR2808150117', '10', '99000', '25', '742500'),
(96, 'INV0409150003', '', 'KPR2808150118', '2', '99000', '25', '148500'),
(97, 'INV0409150003', '', 'KPR2808150120', '16', '70000', '20', '896000'),
(98, 'INV0409150003', '', 'KPR2808150121', '18', '70000', '20', '1008000'),
(99, 'INV0409150003', '', 'KPR2808150122', '19', '70000', '20', '1064000'),
(100, 'INV0409150003', '', 'KPR2808150123', '8', '66000', '20', '422400'),
(101, 'INV0409150003', '', 'KPR2808150124', '10', '66000', '20', '528000'),
(102, 'INV0409150003', '', 'KPR2808150125', '4', '66000', '20', '211200'),
(103, 'INV0409150003', '', 'KPR2808150126', '16', '60000', '20', '768000'),
(104, 'INV0409150003', '', 'KPR2808150127', '18', '60000', '20', '864000'),
(105, 'INV0409150003', '', 'KPR2808150128', '19', '60000', '20', '912000'),
(106, 'INV0409150003', '', 'KPR2808150129', '8', '53000', '20', '339200'),
(107, 'INV0409150003', '', 'KPR2808150130', '10', '53000', '20', '424000'),
(108, 'INV0409150003', '', 'KPR2808150131', '4', '53000', '20', '169600'),
(109, 'INV0409150003', '', 'KPR2808150119', '15', '94000', '20', '1128000'),
(110, 'INV1109150004', '', 'KPR1109150182', '18', '32500', '0', '585000'),
(111, 'INV1109150004', '', 'KPR1109150180', '16', '34500', '0', '552000'),
(112, 'INV1109150004', '', 'KPR1109150184', '19', '33000', '0', '627000'),
(113, 'INV1109150004', '', 'KPR1109150186', '8', '33000', '0', '264000'),
(114, 'INV1109150004', '', 'KPR1109150188', '10', '33000', '0', '330000'),
(115, 'INV1109150004', '', 'KPR1109150190', '5', '33000', '0', '165000'),
(116, 'INV1109150004', '', 'KPR1109150181', '16', '25500', '0', '408000'),
(117, 'INV1109150004', '', 'KPR1109150183', '18', '31000', '0', '558000'),
(118, 'INV1109150004', '', 'KPR1109150185', '19', '31000', '0', '589000'),
(119, 'INV1109150004', '', 'KPR1109150187', '8', '31000', '0', '248000'),
(120, 'INV1109150004', '', 'KPR1109150189', '10', '31000', '0', '310000'),
(121, 'INV1109150004', '', 'KPR1109150191', '5', '31000', '0', '155000'),
(122, 'INV1109150004', '', 'KPR1109150198', '16', '46500', '0', '744000'),
(123, 'INV1109150004', '', 'KPR1109150199', '18', '55000', '0', '990000'),
(124, 'INV1109150004', '', 'KPR1109150200', '19', '48000', '0', '912000'),
(125, 'INV1109150004', '', 'KPR1109150201', '8', '58500', '0', '468000'),
(126, 'INV1109150004', '', 'KPR1109150202', '10', '59500', '0', '595000'),
(127, 'INV1109150004', '', 'KPR1109150203', '5', '59000', '0', '295000'),
(128, 'INV1109150004', '', 'KPR1109150192', '16', '39000', '0', '624000'),
(129, 'INV1109150004', '', 'KPR1109150193', '18', '45000', '0', '810000'),
(130, 'INV1109150004', '', 'KPR1109150194', '19', '43500', '0', '826500'),
(131, 'INV1109150004', '', 'KPR1109150195', '8', '43500', '0', '348000'),
(132, 'INV1109150004', '', 'KPR1109150196', '10', '37500', '0', '375000'),
(133, 'INV1109150004', '', 'KPR1109150197', '5', '50000', '0', '250000'),
(134, 'INV1109150005', '', 'KPR2808150066', '1', '105000', '0', '105000'),
(135, 'INV1109150005', '', 'KPR2808150077', '1', '86000', '0', '86000'),
(136, 'INV1109150005', '', 'KPR2808150093', '1', '145000', '0', '145000'),
(137, 'INV1109150005', '', 'KPR2808150099', '1', '64500', '0', '64500'),
(138, 'INV1109150005', '', 'KPR2808150115', '1', '99000', '0', '99000'),
(139, 'INV1109150005', '', 'KPR2808150109', '1', '40500', '0', '40500'),
(140, 'INV1109150005', '', 'KPR2508150032', '1', '84000', '0', '84000'),
(141, 'INV1109150005', '', 'KPR2808150044', '1', '87000', '0', '87000'),
(142, 'INV1109150005', '', 'KPR2808150056', '1', '87000', '0', '87000'),
(143, 'INV1109150005', '', 'KPR1109150194', '1', '43500', '0', '43500'),
(144, 'INV1109150005', '', 'KPR1109150200', '1', '48000', '0', '48000'),
(145, 'INV1109150005', '', 'KPR1109150184', '1', '33000', '0', '33000'),
(146, 'INV1109150005', '', 'KPR1109150185', '1', '31000', '0', '31000'),
(147, 'INV1109150005', '', 'KPR2808150134', '1', '', '0', ''),
(148, 'INV1109150005', '', 'KPR2808150140', '1', '', '0', ''),
(149, 'INV1109150005', '', 'KPR2808150122', '1', '70000', '0', '70000'),
(150, 'INV1109150005', '', 'KPR2808150128', '1', '60000', '0', '60000'),
(151, 'INV1109150005', '', 'KPR3108150148', '1', '', '0', ''),
(152, 'INV1109150005', '', 'KPR1109150204', '1', '0', '0', '0'),
(153, 'INV1109150006', '', 'KPR3108150144', '17', '63000', '30', '749700'),
(154, 'INV1109150006', '', 'KPR3108150145', '17', '58000', '30', '690200'),
(155, 'INV1109150006', '', 'KPR3108150146', '18', '63000', '30', '793800'),
(156, 'INV1109150006', '', 'KPR3108150147', '18', '58000', '30', '730800'),
(157, 'INV1109150006', '', 'KPR3108150148', '19', '58000', '30', '771400'),
(158, 'INV1109150006', '', 'KPR3108150149', '19', '51000', '30', '678300'),
(159, 'INV1109150006', '', 'KPR3108150150', '8', '57000', '30', '319200'),
(160, 'INV1109150006', '', 'KPR3108150151', '8', '51000', '30', '285600'),
(161, 'INV1109150006', '', 'KPR3108150152', '9', '58000', '30', '365400'),
(162, 'INV1109150006', '', 'KPR3108150153', '9', '51000', '30', '321300'),
(163, 'INV1109150006', '', 'KPR3108150154', '3', '58000', '30', '121800'),
(164, 'INV1109150006', '', 'KPR3108150155', '3', '51000', '30', '107100'),
(165, 'INV1109150006', '', 'KPR2808150138', '17', '55000', '30', '654500'),
(166, 'INV1109150006', '', 'KPR2808150139', '18', '61000', '30', '768600'),
(167, 'INV1109150006', '', 'KPR2808150140', '20', '53000', '30', '742000'),
(168, 'INV1109150006', '', 'KPR2808150141', '8', '63000', '30', '352800'),
(169, 'INV1109150006', '', 'KPR2808150143', '4', '57000', '30', '159600'),
(170, 'INV1109150006', '', 'KPR2808150132', '17', '42000', '30', '499800'),
(171, 'INV1109150006', '', 'KPR2808150133', '18', '42000', '30', '529200'),
(172, 'INV1109150006', '', 'KPR2808150134', '19', '41000', '30', '545300'),
(173, 'INV1109150006', '', 'KPR2808150135', '8', '41000', '30', '229600'),
(174, 'INV1109150006', '', 'KPR2808150136', '9', '41000', '30', '258300'),
(175, 'INV1109150006', '', 'KPR2808150137', '3', '47000', '30', '98700'),
(176, 'INV1109150006', '', 'KPR3108150156', '8', '49000', '30', '274400'),
(177, 'INV1109150006', '', 'KPR3108150157', '10', '53000', '30', '371000'),
(178, 'INV1109150006', '', 'KPR3108150158', '5', '58000', '30', '203000'),
(179, 'INV1109150006', '', 'KPR2808150142', '8', '61000', '30', '341600'),
(180, 'INV1109150007', '', 'KPR1109150204', '81', '55000', '0', '4455000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelianretur`
--

CREATE TABLE IF NOT EXISTS `pos_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelianreturdetail`
--

CREATE TABLE IF NOT EXISTS `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualan`
--

CREATE TABLE IF NOT EXISTS `pos_penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang','Pemesanan') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `piutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `nofaktur`, `nopo`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'FAK1109150001', '', '2015-09-11', '114', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(2, 'FAK1109150002', '', '2015-09-11', '145', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(3, 'FAK1109150003', '', '2015-09-11', '146', 'Tunai', '1174900', '0', '1174900', '1174900', '0', '0', '', 'admin'),
(4, 'FAK1109150004', '', '2015-09-11', '169', 'Tunai', '1241900', '0', '1241900', '1241900', '0', '0', '', 'admin'),
(5, 'FAK2109150005', '', '2015-09-21', '124', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(6, 'FAK2109150006', '', '2015-09-21', '125', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(7, 'FAK2109150007', '', '2015-09-21', '115', 'Tunai', '1217450', '0', '1217450', '1217450', '0', '0', '', 'admin'),
(8, 'FAK2109150008', '', '2015-09-21', '115', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(9, 'FAK2109150009', '', '2015-09-21', '121', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(10, 'FAK2109150010', '', '2015-09-21', '120', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(11, 'FAK2109150011', '', '2015-09-21', '117', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(12, 'FAK2109150012', '', '2015-09-21', '123', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(13, 'FAK2809150001', '', '2015-09-28', '118', 'Tunai', '1129850', '0', '1129850', '1129850', '0', '0', '', 'admin'),
(14, 'FAK2809150002', '', '2015-09-28', '119', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(15, 'FAK2809150003', '', '2015-09-28', '127', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(16, 'FAK0810150001', '', '2015-10-08', '122', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(17, 'FAK0810150002', '', '2015-10-08', '126', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(18, 'FAK0810150003', '', '2015-10-08', '112', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(19, 'FAK0810150004', '', '2015-10-08', '113', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(20, 'FAK0810150005', '', '2015-10-08', '116', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(21, 'FAK0810150006', '', '2015-10-08', '144', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(22, 'FAK0810150007', '', '2015-10-08', '141', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(23, 'FAK0810150008', '', '2015-10-08', '135', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(24, 'FAK0810150009', '', '2015-10-08', '142', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(25, 'FAK0810150010', '', '2015-10-08', '134', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(26, 'FAK0910150001', '', '2015-10-09', '133', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(27, 'FAK0910150002', '', '2015-10-09', '138', 'Tunai', '995450', '0', '995450', '995450', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanbiaya`
--

CREATE TABLE IF NOT EXISTS `pos_penjualanbiaya` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanbiayadetail`
--

CREATE TABLE IF NOT EXISTS `pos_penjualanbiayadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodebiaya` varchar(50) NOT NULL,
  `jenis` int(2) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualandetail`
--

CREATE TABLE IF NOT EXISTS `pos_penjualandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `jenis` varchar(5) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=529 ;

--
-- Dumping data for table `pos_penjualandetail`
--

INSERT INTO `pos_penjualandetail` (`id`, `nofaktur`, `nopo`, `jenis`, `kodebarang`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FAK1109150001', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(2, 'FAK1109150001', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(3, 'FAK1109150001', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(4, 'FAK1109150001', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(5, 'FAK1109150001', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(6, 'FAK1109150001', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(7, 'FAK1109150001', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(8, 'FAK1109150001', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(9, 'FAK1109150001', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(10, 'FAK1109150001', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(11, 'FAK1109150001', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(12, 'FAK1109150001', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(13, 'FAK1109150001', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(14, 'FAK1109150001', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(15, 'FAK1109150001', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(16, 'FAK1109150001', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(17, 'FAK1109150001', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(18, 'FAK1109150001', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(19, 'FAK1109150001', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(20, 'FAK1109150001', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(21, 'FAK1109150002', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(22, 'FAK1109150002', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(23, 'FAK1109150002', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(24, 'FAK1109150002', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(25, 'FAK1109150002', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(26, 'FAK1109150002', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(27, 'FAK1109150002', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(28, 'FAK1109150002', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(29, 'FAK1109150002', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(30, 'FAK1109150002', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(31, 'FAK1109150002', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(32, 'FAK1109150002', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(33, 'FAK1109150002', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(34, 'FAK1109150002', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(35, 'FAK1109150002', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(36, 'FAK1109150002', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(37, 'FAK1109150002', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(38, 'FAK1109150002', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(39, 'FAK1109150002', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(40, 'FAK1109150003', '', '3', 'KPR2808150066', '1', '105000', '84000', '10', '94500'),
(41, 'FAK1109150003', '', '3', 'KPR2808150077', '1', '86000', '68800', '10', '77400'),
(42, 'FAK1109150003', '', '3', 'KPR2808150093', '1', '145000', '109125', '10', '130500'),
(43, 'FAK1109150003', '', '3', 'KPR2808150099', '1', '64500', '48375', '10', '58050'),
(44, 'FAK1109150003', '', '3', 'KPR2808150115', '1', '99000', '74250', '10', '89100'),
(45, 'FAK1109150003', '', '3', 'KPR2808150109', '1', '40500', '30375', '10', '36450'),
(46, 'FAK1109150003', '', '3', 'KPR2508150032', '1', '84000', '67200', '10', '75600'),
(47, 'FAK1109150003', '', '3', 'KPR2808150056', '1', '87000', '68000', '10', '78300'),
(48, 'FAK1109150003', '', '3', 'KPR2808150044', '1', '87000', '57600', '10', '78300'),
(49, 'FAK1109150003', '', '3', 'KPR1109150194', '1', '43500', '43500', '0', '43500'),
(50, 'FAK1109150003', '', '3', 'KPR1109150200', '1', '48000', '48000', '0', '48000'),
(51, 'FAK1109150003', '', '3', 'KPR1109150184', '1', '33000', '33000', '0', '33000'),
(52, 'FAK1109150003', '', '3', 'KPR1109150185', '1', '31000', '31000', '0', '31000'),
(53, 'FAK1109150003', '', '3', 'KPR2808150140', '1', '53000', '0', '15', '45050'),
(54, 'FAK1109150003', '', '3', 'KPR2808150134', '1', '41000', '0', '15', '34850'),
(55, 'FAK1109150003', '', '3', 'KPR3108150148', '1', '58000', '0', '15', '49300'),
(56, 'FAK1109150003', '', '3', 'KPR2808150122', '1', '70000', '56000', '10', '63000'),
(57, 'FAK1109150003', '', '3', 'KPR2808150128', '1', '60000', '48000', '10', '54000'),
(58, 'FAK1109150003', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(59, 'FAK1109150004', '', '3', 'KPR2808150068', '1', '106000', '84800', '10', '95400'),
(60, 'FAK1109150004', '', '3', 'KPR2808150079', '1', '56000', '44800', '10', '50400'),
(61, 'FAK1109150004', '', '3', 'KPR2808150080', '1', '56000', '44800', '10', '50400'),
(62, 'FAK1109150004', '', '3', 'KPR2808150094', '1', '137000', '102750', '10', '123300'),
(63, 'FAK1109150004', '', '3', 'KPR2808150101', '1', '64500', '48375', '10', '58050'),
(64, 'FAK1109150004', '', '3', 'KPR2808150116', '1', '99000', '74250', '10', '89100'),
(65, 'FAK1109150004', '', '3', 'KPR2808150110', '1', '40500', '30375', '10', '36450'),
(66, 'FAK1109150004', '', '3', 'KPR2508150034', '1', '87000', '69600', '10', '78300'),
(67, 'FAK1109150004', '', '3', 'KPR2808150046', '1', '87000', '57600', '10', '78300'),
(68, 'FAK1109150004', '', '3', 'KPR2808150058', '1', '84000', '68000', '10', '75600'),
(69, 'FAK1109150004', '', '3', 'KPR1109150186', '1', '33000', '33000', '0', '33000'),
(70, 'FAK1109150004', '', '3', 'KPR1109150187', '1', '31000', '31000', '0', '31000'),
(71, 'FAK1109150004', '', '3', 'KPR1109150201', '1', '58500', '58500', '0', '58500'),
(72, 'FAK1109150004', '', '3', 'KPR1109150195', '1', '43500', '43500', '0', '43500'),
(73, 'FAK1109150004', '', '3', 'KPR3108150150', '1', '57000', '39900', '15', '48450'),
(74, 'FAK1109150004', '', '3', 'KPR2808150135', '1', '41000', '28700', '15', '34850'),
(75, 'FAK1109150004', '', '3', 'KPR2808150141', '1', '63000', '44100', '15', '53550'),
(76, 'FAK1109150004', '', '3', 'KPR2808150123', '1', '66000', '52800', '10', '59400'),
(77, 'FAK1109150004', '', '3', 'KPR2808150129', '1', '53000', '42400', '10', '47700'),
(78, 'FAK1109150004', '', '3', 'KPR3108150156', '1', '49000', '34300', '15', '41650'),
(79, 'FAK1109150004', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(80, 'FAK2109150005', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(81, 'FAK2109150005', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(82, 'FAK2109150005', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(83, 'FAK2109150005', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(84, 'FAK2109150005', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(85, 'FAK2109150005', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(86, 'FAK2109150005', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(87, 'FAK2109150005', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(88, 'FAK2109150005', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(89, 'FAK2109150005', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(90, 'FAK2109150005', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(91, 'FAK2109150005', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(92, 'FAK2109150005', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(93, 'FAK2109150005', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(94, 'FAK2109150005', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(95, 'FAK2109150005', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(96, 'FAK2109150005', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(97, 'FAK2109150005', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(98, 'FAK2109150005', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(99, 'FAK2109150005', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(100, 'FAK2109150006', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(101, 'FAK2109150006', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(102, 'FAK2109150006', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(103, 'FAK2109150006', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(104, 'FAK2109150006', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(105, 'FAK2109150006', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(106, 'FAK2109150006', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(107, 'FAK2109150006', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(108, 'FAK2109150006', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(109, 'FAK2109150006', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(110, 'FAK2109150006', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(111, 'FAK2109150006', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(112, 'FAK2109150006', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(113, 'FAK2109150006', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(114, 'FAK2109150006', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(115, 'FAK2109150006', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(116, 'FAK2109150006', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(117, 'FAK2109150006', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(118, 'FAK2109150006', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(119, 'FAK2109150006', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(120, 'FAK2109150007', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(121, 'FAK2109150007', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(122, 'FAK2109150007', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(123, 'FAK2109150007', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(124, 'FAK2109150007', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(125, 'FAK2109150007', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(126, 'FAK2109150007', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(127, 'FAK2109150007', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(128, 'FAK2109150007', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(129, 'FAK2109150007', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(130, 'FAK2109150007', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(131, 'FAK2109150007', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(132, 'FAK2109150007', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(133, 'FAK2109150007', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(134, 'FAK2109150007', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(135, 'FAK2109150007', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(136, 'FAK2109150007', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(137, 'FAK2109150007', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(138, 'FAK2109150007', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(139, 'FAK2109150008', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(140, 'FAK2109150008', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(141, 'FAK2109150008', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(142, 'FAK2109150008', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(143, 'FAK2109150008', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(144, 'FAK2109150008', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(145, 'FAK2109150008', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(146, 'FAK2109150008', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(147, 'FAK2109150008', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(148, 'FAK2109150008', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(149, 'FAK2109150008', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(150, 'FAK2109150008', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(151, 'FAK2109150008', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(152, 'FAK2109150008', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(153, 'FAK2109150008', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(154, 'FAK2109150008', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(155, 'FAK2109150008', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(156, 'FAK2109150008', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(157, 'FAK2109150008', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(158, 'FAK2109150008', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(159, 'FAK2109150009', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(160, 'FAK2109150009', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(161, 'FAK2109150009', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(162, 'FAK2109150009', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(163, 'FAK2109150009', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(164, 'FAK2109150009', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(165, 'FAK2109150009', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(166, 'FAK2109150009', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(167, 'FAK2109150009', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(168, 'FAK2109150009', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(169, 'FAK2109150009', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(170, 'FAK2109150009', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(171, 'FAK2109150009', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(172, 'FAK2109150009', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(173, 'FAK2109150009', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(174, 'FAK2109150009', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(175, 'FAK2109150009', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(176, 'FAK2109150009', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(177, 'FAK2109150009', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(178, 'FAK2109150009', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(179, 'FAK2109150010', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(180, 'FAK2109150010', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(181, 'FAK2109150010', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(182, 'FAK2109150010', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(183, 'FAK2109150010', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(184, 'FAK2109150010', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(185, 'FAK2109150010', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(186, 'FAK2109150010', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(187, 'FAK2109150010', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(188, 'FAK2109150010', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(189, 'FAK2109150010', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(190, 'FAK2109150010', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(191, 'FAK2109150010', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(192, 'FAK2109150010', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(193, 'FAK2109150010', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(194, 'FAK2109150010', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(195, 'FAK2109150010', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(196, 'FAK2109150010', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(197, 'FAK2109150010', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(198, 'FAK2109150010', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(199, 'FAK2109150011', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(200, 'FAK2109150011', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(201, 'FAK2109150011', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(202, 'FAK2109150011', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(203, 'FAK2109150011', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(204, 'FAK2109150011', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(205, 'FAK2109150011', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(206, 'FAK2109150011', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(207, 'FAK2109150011', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(208, 'FAK2109150011', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(209, 'FAK2109150011', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(210, 'FAK2109150011', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(211, 'FAK2109150011', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(212, 'FAK2109150011', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(213, 'FAK2109150011', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(214, 'FAK2109150011', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(215, 'FAK2109150011', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(216, 'FAK2109150011', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(217, 'FAK2109150011', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(218, 'FAK2109150011', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(219, 'FAK2109150012', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(220, 'FAK2109150012', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(221, 'FAK2109150012', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(222, 'FAK2109150012', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(223, 'FAK2109150012', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(224, 'FAK2109150012', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(225, 'FAK2109150012', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(226, 'FAK2109150012', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(227, 'FAK2109150012', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(228, 'FAK2109150012', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(229, 'FAK2109150012', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(230, 'FAK2109150012', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(231, 'FAK2109150012', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(232, 'FAK2109150012', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(233, 'FAK2109150012', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(234, 'FAK2109150012', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(235, 'FAK2109150012', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(236, 'FAK2109150012', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(237, 'FAK2109150012', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(238, 'FAK2109150012', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(239, 'FAK2809150001', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(240, 'FAK2809150001', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(241, 'FAK2809150001', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(242, 'FAK2809150001', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(243, 'FAK2809150001', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(244, 'FAK2809150001', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(245, 'FAK2809150001', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(246, 'FAK2809150001', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(247, 'FAK2809150001', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(248, 'FAK2809150001', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(249, 'FAK2809150001', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(250, 'FAK2809150001', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(251, 'FAK2809150001', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(252, 'FAK2809150001', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(253, 'FAK2809150001', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(254, 'FAK2809150001', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(255, 'FAK2809150001', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(256, 'FAK2809150001', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(257, 'FAK2809150001', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(258, 'FAK2809150002', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(259, 'FAK2809150002', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(260, 'FAK2809150002', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(261, 'FAK2809150002', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(262, 'FAK2809150002', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(263, 'FAK2809150002', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(264, 'FAK2809150002', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(265, 'FAK2809150002', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(266, 'FAK2809150002', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(267, 'FAK2809150002', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(268, 'FAK2809150002', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(269, 'FAK2809150002', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(270, 'FAK2809150002', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(271, 'FAK2809150002', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(272, 'FAK2809150002', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(273, 'FAK2809150002', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(274, 'FAK2809150002', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(275, 'FAK2809150002', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(276, 'FAK2809150002', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(277, 'FAK2809150002', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(278, 'FAK2809150003', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(279, 'FAK2809150003', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(280, 'FAK2809150003', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(281, 'FAK2809150003', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(282, 'FAK2809150003', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(283, 'FAK2809150003', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(284, 'FAK2809150003', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(285, 'FAK2809150003', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(286, 'FAK2809150003', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(287, 'FAK2809150003', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(288, 'FAK2809150003', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(289, 'FAK2809150003', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(290, 'FAK2809150003', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(291, 'FAK2809150003', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(292, 'FAK2809150003', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(293, 'FAK2809150003', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(294, 'FAK2809150003', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(295, 'FAK2809150003', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(296, 'FAK2809150003', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(297, 'FAK2809150003', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(298, 'FAK0810150001', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(299, 'FAK0810150001', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(300, 'FAK0810150001', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(301, 'FAK0810150001', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(302, 'FAK0810150001', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(303, 'FAK0810150001', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(304, 'FAK0810150001', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(305, 'FAK0810150001', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(306, 'FAK0810150001', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(307, 'FAK0810150001', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(308, 'FAK0810150001', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(309, 'FAK0810150001', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(310, 'FAK0810150001', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(311, 'FAK0810150001', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(312, 'FAK0810150001', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(313, 'FAK0810150001', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(314, 'FAK0810150001', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(315, 'FAK0810150001', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(316, 'FAK0810150001', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(317, 'FAK0810150001', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(318, 'FAK0810150002', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(319, 'FAK0810150002', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(320, 'FAK0810150002', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(321, 'FAK0810150002', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(322, 'FAK0810150002', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(323, 'FAK0810150002', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(324, 'FAK0810150002', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(325, 'FAK0810150002', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(326, 'FAK0810150002', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(327, 'FAK0810150002', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(328, 'FAK0810150002', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(329, 'FAK0810150002', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(330, 'FAK0810150002', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(331, 'FAK0810150002', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(332, 'FAK0810150002', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(333, 'FAK0810150002', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(334, 'FAK0810150002', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(335, 'FAK0810150002', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(336, 'FAK0810150002', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(337, 'FAK0810150002', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(338, 'FAK0810150003', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(339, 'FAK0810150003', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(340, 'FAK0810150003', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(341, 'FAK0810150003', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(342, 'FAK0810150003', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(343, 'FAK0810150003', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(344, 'FAK0810150003', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(345, 'FAK0810150003', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(346, 'FAK0810150003', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(347, 'FAK0810150003', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(348, 'FAK0810150003', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(349, 'FAK0810150003', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(350, 'FAK0810150003', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(351, 'FAK0810150003', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(352, 'FAK0810150003', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(353, 'FAK0810150003', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(354, 'FAK0810150003', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(355, 'FAK0810150003', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(356, 'FAK0810150003', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(357, 'FAK0810150003', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(358, 'FAK0810150004', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(359, 'FAK0810150004', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(360, 'FAK0810150004', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(361, 'FAK0810150004', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(362, 'FAK0810150004', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(363, 'FAK0810150004', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(364, 'FAK0810150004', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(365, 'FAK0810150004', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(366, 'FAK0810150004', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(367, 'FAK0810150004', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(368, 'FAK0810150004', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(369, 'FAK0810150004', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(370, 'FAK0810150004', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(371, 'FAK0810150004', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(372, 'FAK0810150004', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(373, 'FAK0810150004', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(374, 'FAK0810150004', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(375, 'FAK0810150004', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(376, 'FAK0810150004', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(377, 'FAK0810150004', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(378, 'FAK0810150005', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(379, 'FAK0810150005', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(380, 'FAK0810150005', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(381, 'FAK0810150005', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(382, 'FAK0810150005', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(383, 'FAK0810150005', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(384, 'FAK0810150005', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(385, 'FAK0810150005', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(386, 'FAK0810150005', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(387, 'FAK0810150005', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(388, 'FAK0810150005', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(389, 'FAK0810150005', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(390, 'FAK0810150005', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(391, 'FAK0810150005', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(392, 'FAK0810150005', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(393, 'FAK0810150005', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(394, 'FAK0810150005', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(395, 'FAK0810150005', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(396, 'FAK0810150005', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(397, 'FAK0810150005', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(398, 'FAK0810150006', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(399, 'FAK0810150006', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(400, 'FAK0810150006', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(401, 'FAK0810150006', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(402, 'FAK0810150006', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(403, 'FAK0810150006', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(404, 'FAK0810150006', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(405, 'FAK0810150006', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(406, 'FAK0810150006', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(407, 'FAK0810150006', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(408, 'FAK0810150006', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(409, 'FAK0810150006', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(410, 'FAK0810150006', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(411, 'FAK0810150006', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(412, 'FAK0810150006', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(413, 'FAK0810150006', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(414, 'FAK0810150006', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(415, 'FAK0810150006', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(416, 'FAK0810150006', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(417, 'FAK0810150007', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(418, 'FAK0810150007', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(419, 'FAK0810150007', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(420, 'FAK0810150007', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(421, 'FAK0810150007', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(422, 'FAK0810150007', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(423, 'FAK0810150007', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(424, 'FAK0810150007', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(425, 'FAK0810150007', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(426, 'FAK0810150007', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(427, 'FAK0810150007', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(428, 'FAK0810150007', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(429, 'FAK0810150007', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(430, 'FAK0810150007', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(431, 'FAK0810150007', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(432, 'FAK0810150007', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(433, 'FAK0810150007', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(434, 'FAK0810150007', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(435, 'FAK0810150007', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(436, 'FAK0810150008', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(437, 'FAK0810150008', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(438, 'FAK0810150008', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(439, 'FAK0810150008', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(440, 'FAK0810150008', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(441, 'FAK0810150008', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(442, 'FAK0810150008', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(443, 'FAK0810150008', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(444, 'FAK0810150008', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(445, 'FAK0810150008', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(446, 'FAK0810150008', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(447, 'FAK0810150008', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(448, 'FAK0810150008', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(449, 'FAK0810150008', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(450, 'FAK0810150008', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(451, 'FAK0810150008', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(452, 'FAK0810150008', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(453, 'FAK0810150008', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(454, 'FAK0810150008', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(455, 'FAK0810150009', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(456, 'FAK0810150009', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(457, 'FAK0810150009', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(458, 'FAK0810150009', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(459, 'FAK0810150009', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(460, 'FAK0810150009', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(461, 'FAK0810150009', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(462, 'FAK0810150009', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(463, 'FAK0810150009', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(464, 'FAK0810150009', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(465, 'FAK0810150009', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(466, 'FAK0810150009', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(467, 'FAK0810150009', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(468, 'FAK0810150009', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(469, 'FAK0810150009', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(470, 'FAK0810150009', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(471, 'FAK0810150009', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(472, 'FAK0810150009', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(473, 'FAK0810150009', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(474, 'FAK0810150010', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(475, 'FAK0810150010', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(476, 'FAK0810150010', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(477, 'FAK0810150010', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(478, 'FAK0810150010', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(479, 'FAK0810150010', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(480, 'FAK0810150010', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(481, 'FAK0810150010', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(482, 'FAK0810150010', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(483, 'FAK0810150010', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(484, 'FAK0810150010', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(485, 'FAK0810150010', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(486, 'FAK0810150010', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(487, 'FAK0810150010', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(488, 'FAK0810150010', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(489, 'FAK0810150010', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(490, 'FAK0810150010', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(491, 'FAK0810150010', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(492, 'FAK0810150010', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(493, 'FAK0910150001', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(494, 'FAK0910150001', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(495, 'FAK0910150001', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(496, 'FAK0910150001', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(497, 'FAK0910150001', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(498, 'FAK0910150001', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(499, 'FAK0910150001', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(500, 'FAK0910150001', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(501, 'FAK0910150001', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(502, 'FAK0910150001', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(503, 'FAK0910150001', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(504, 'FAK0910150001', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(505, 'FAK0910150001', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(506, 'FAK0910150001', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(507, 'FAK0910150001', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(508, 'FAK0910150001', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(509, 'FAK0910150001', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(510, 'FAK0910150001', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(511, 'FAK0910150001', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(512, 'FAK0910150002', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(513, 'FAK0910150002', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(514, 'FAK0910150002', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(515, 'FAK0910150002', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(516, 'FAK0910150002', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(517, 'FAK0910150002', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(518, 'FAK0910150002', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(519, 'FAK0910150002', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(520, 'FAK0910150002', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(521, 'FAK0910150002', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(522, 'FAK0910150002', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(523, 'FAK0910150002', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(524, 'FAK0910150002', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(525, 'FAK0910150002', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(526, 'FAK0910150002', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(527, 'FAK0910150002', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(528, 'FAK0910150002', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanjasa`
--

CREATE TABLE IF NOT EXISTS `pos_penjualanjasa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `piutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanjasadetail`
--

CREATE TABLE IF NOT EXISTS `pos_penjualanjasadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodejasa` varchar(50) NOT NULL,
  `jenis` int(4) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanretur`
--

CREATE TABLE IF NOT EXISTS `pos_penjualanretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_penjualanretur`
--

INSERT INTO `pos_penjualanretur` (`id`, `noretur`, `nofaktur`, `tgl`, `kodecustomer`, `carabayar`, `total`, `user`) VALUES
(1, 'RTJ2109150001', 'FAK2109150007', '2015-09-21', '115', 'Tunai', '1337000', 'admin'),
(2, 'RTJ2109150002', 'FAK2109150009', '2015-09-21', '121', 'Tunai', '1379000', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanreturdetail`
--

CREATE TABLE IF NOT EXISTS `pos_penjualanreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `pos_penjualanreturdetail`
--

INSERT INTO `pos_penjualanreturdetail` (`id`, `noretur`, `nofaktur`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150062', '1', '90000', '10', '90000'),
(2, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150073', '1', '78000', '10', '78000'),
(3, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150091', '1', '137000', '10', '137000'),
(4, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150097', '1', '95000', '10', '95000'),
(5, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150113', '1', '99000', '10', '99000'),
(6, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150107', '1', '40500', '10', '40500'),
(7, 'RTJ2109150001', 'FAK2109150007', 'KPR1307150028', '1', '84000', '10', '84000'),
(8, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150040', '1', '84000', '10', '84000'),
(9, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150052', '1', '87000', '10', '87000'),
(10, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150192', '1', '39000', '0', '39000'),
(11, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150198', '1', '46500', '0', '46500'),
(12, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150180', '1', '34500', '0', '34500'),
(13, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150181', '1', '25500', '0', '25500'),
(14, 'RTJ2109150001', 'FAK2109150007', 'KPR3108150144', '1', '63000', '15', '63000'),
(15, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150138', '1', '55000', '15', '55000'),
(16, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150120', '1', '70000', '10', '70000'),
(17, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150126', '1', '60000', '10', '60000'),
(18, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150204', '1', '55000', '0', '55000'),
(19, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150119', '1', '94000', '10', '94000'),
(20, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150062', '1', '90000', '10', '90000'),
(21, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150073', '1', '78000', '10', '78000'),
(22, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150091', '1', '137000', '10', '137000'),
(23, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150097', '1', '95000', '10', '95000'),
(24, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150113', '1', '99000', '10', '99000'),
(25, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150107', '1', '40500', '10', '40500'),
(26, 'RTJ2109150002', 'FAK2109150009', 'KPR1307150028', '1', '84000', '10', '84000'),
(27, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150040', '1', '84000', '10', '84000'),
(28, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150052', '1', '87000', '10', '87000'),
(29, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150192', '1', '39000', '0', '39000'),
(30, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150198', '1', '46500', '0', '46500'),
(31, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150180', '1', '34500', '0', '34500'),
(32, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150181', '1', '25500', '0', '25500'),
(33, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150132', '1', '42000', '15', '42000'),
(34, 'RTJ2109150002', 'FAK2109150009', 'KPR3108150144', '1', '63000', '15', '63000'),
(35, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150138', '1', '55000', '15', '55000'),
(36, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150120', '1', '70000', '10', '70000'),
(37, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150126', '1', '60000', '10', '60000'),
(38, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150119', '1', '94000', '10', '94000'),
(39, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150204', '1', '55000', '0', '55000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_po`
--

CREATE TABLE IF NOT EXISTS `pos_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_podetail`
--

CREATE TABLE IF NOT EXISTS `pos_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_produk`
--

CREATE TABLE IF NOT EXISTS `pos_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` int(10) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=205 ;

--
-- Dumping data for table `pos_produk`
--

INSERT INTO `pos_produk` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `jumlah`, `hargabeli`, `hargajual`) VALUES
(30, 3, 4, 'KPR1307150030', 'MPH ENG-TB 2A', '9', '84000', '84000'),
(140, 3, 4, 'KPR2808150140', 'IPS 3', '20', '53000', '53000'),
(28, 3, 4, 'KPR1307150028', 'MPH ENG TB 1A', '11', '84000', '84000'),
(29, 3, 4, 'KPR1307150029', 'MPH ENG TB 1B', '17', '84000', '84000'),
(31, 3, 4, 'KPR2508150031', 'MPH Eng  TB 2B', '18', '84000', '84000'),
(32, 3, 4, 'KPR2508150032', 'MPH ENG TB 3A', '19', '84000', '84000'),
(33, 3, 4, 'KPR2508150033', 'MPH Eng TB 3B', '19', '84000', '84000'),
(34, 3, 4, 'KPR2508150034', 'MPH ENG TB 4A', '7', '87000', '87000'),
(35, 3, 4, 'KPR2508150035', 'MPH ENG TB 4B', '8', '87000', '87000'),
(36, 3, 4, 'KPR2808150036', 'MPH  ENG TB 5A', '9', '87000', '87000'),
(37, 3, 4, 'KPR2808150037', 'MPH ENG TB 5B', '9', '87000', '87000'),
(38, 3, 4, 'KPR2808150038', 'MPH ENG TB 6A', '2', '87000', '87000'),
(39, 3, 4, 'KPR2808150039', 'MPH ENG TB 6B', '2', '87000', '87000'),
(40, 3, 4, 'KPR2808150040', 'MPH ENG WB 1A', '2', '72000', '84000'),
(41, 3, 4, 'KPR2808150041', 'MPH ENG WB 1B', '17', '72000', '87000'),
(42, 3, 4, 'KPR2808150042', 'MPH ENG WB 2A', '10', '72000', '87000'),
(43, 3, 4, 'KPR2808150043', 'MPH ENG WB 2B', '18', '72000', '87000'),
(44, 3, 4, 'KPR2808150044', 'MPH ENG WB 3A', '19', '87000', '87000'),
(45, 3, 4, 'KPR2808150045', 'MPH ENG WB 3B', '19', '72000', '87000'),
(46, 3, 4, 'KPR2808150046', 'MPH ENG WB 4A', '7', '72000', '87000'),
(47, 3, 4, 'KPR2808150047', 'MPH ENG WB 4B', '8', '72000', '87000'),
(48, 3, 4, 'KPR2808150048', 'MPH ENG WB 5A', '9', '72000', '87000'),
(49, 3, 4, 'KPR2808150049', 'MPH ENG WB 5B', '9', '72000', '87000'),
(50, 3, 4, 'KPR2808150050', 'MPH ENG WB 6A', '2', '72000', '87000'),
(51, 3, 4, 'KPR2808150051', 'MPH ENG WB 6B', '2', '72000', '87000'),
(52, 3, 4, 'KPR2808150052', 'MPH ENG HW 1A', '2', '85000', '87000'),
(53, 3, 4, 'KPR2808150053', 'MPH ENG HW 1B', '17', '85000', '87000'),
(54, 3, 4, 'KPR2808150054', 'MPH ENG HW 2A', '10', '85000', '87000'),
(55, 3, 4, 'KPR2808150055', 'MPH ENG HW 2B', '18', '85000', '87000'),
(56, 3, 4, 'KPR2808150056', 'MPH ENG hW 3A', '19', '87000', '87000'),
(57, 3, 4, 'KPR2808150057', 'MPH ENG HW 3B', '19', '85000', '84000'),
(58, 3, 4, 'KPR2808150058', 'MPH ENG HW 4A', '7', '85000', '84000'),
(59, 3, 4, 'KPR2808150059', 'MPH ENG HW 4B', '8', '85000', '84000'),
(60, 3, 4, 'KPR2808150060', 'MPH  ENG HW 5A', '9', '85000', '84000'),
(61, 3, 4, 'KPR2808150061', 'MPH ENG HW 5B', '9', '85000', '84000'),
(62, 3, 4, 'KPR2808150062', 'SHAPING MATHS TB 1A', '1', '90000', '90000'),
(63, 3, 4, 'KPR2808150063', 'SHAPING MATHS TB 1B', '17', '90000', '90000'),
(64, 3, 4, 'KPR2808150064', 'SHAPING MATHS TB 2A', '10', '100000', '100000'),
(65, 3, 4, 'KPR2808150065', 'SHAPING MATHS TB 2B', '18', '105000', '105000'),
(66, 3, 4, 'KPR2808150066', 'SHAPING MATHS TB 3A', '19', '105000', '105000'),
(67, 3, 4, 'KPR2808150067', 'SHAPING MATHS TB 3B', '19', '105000', '105000'),
(68, 3, 4, 'KPR2808150068', 'SHAPING MATHS TB 4A (2ND EDT)', '7', '106000', '106000'),
(69, 3, 4, 'KPR2808150069', 'SHAPING MATHS TB 4B (2ND EDT)', '8', '106000', '106000'),
(70, 3, 4, 'KPR2808150070', 'SHAPING MATHS TB 5A (2ND EDT)', '9', '106000', '106000'),
(71, 3, 4, 'KPR2808150071', 'SHAPING MATHS TB 5B (2ND EDT)', '9', '106000', '106000'),
(72, 3, 4, 'KPR2808150072', 'SHAPING MATHS TB 6A (2ND EDT)', '2', '106000', '106000'),
(73, 3, 4, 'KPR2808150073', 'SHAPING MATHS ACT BOOK 1A (3RD EDT)', '2', '78000', '78000'),
(74, 3, 4, 'KPR2808150074', 'SHAPING MATHS ACT BOOK 1B (3RD EDT)', '17', '78000', '78000'),
(75, 3, 4, 'KPR2808150075', 'SHAPING MATHS ACT BOOK 2A (3RD EDT)', '10', '83000', '83000'),
(76, 3, 4, 'KPR2808150076', 'SHAPING MATHS ACT BOOK 2B (3RD EDT)', '18', '86000', '86000'),
(77, 3, 4, 'KPR2808150077', 'SHAPING MATHS ACT BOOK 3A (3RD EDT)', '19', '86000', '86000'),
(78, 3, 4, 'KPR2808150078', 'SHAPING MATHS ACT BOOK 3B (3RD EDT)', '19', '86000', '86000'),
(79, 3, 4, 'KPR2808150079', 'SHAPING MATHS ACT BOOK 4A PART 1 (2ND Edt)', '7', '56000', '56000'),
(80, 3, 4, 'KPR2808150080', 'SHAPING MATHS ACT BOOK 4A PART 2 (2ND Edt)', '7', '56000', '56000'),
(81, 3, 4, 'KPR2808150081', 'SHAPING MATHS ACT BOOK 4B PART 1 (2ND Edt)', '8', '56000', '56000'),
(82, 3, 4, 'KPR2808150082', 'SHAPING MATHS ACT BOOK 4B PART 2 (2ND Edt)', '8', '56000', '56000'),
(83, 3, 4, 'KPR2808150083', 'SHAPING MATHS ACT BOOK 5A PART 1 (2ND Edt)', '9', '56000', '56000'),
(84, 3, 4, 'KPR2808150084', 'SHAPING MATHS ACT BOOK 5A PART 2 (2ND Edt)', '9', '56000', '56000'),
(85, 3, 4, 'KPR2808150085', 'SHAPING MATHS ACT BOOK 5B PART 1 (2ND Edt)', '9', '56000', '56000'),
(86, 3, 4, 'KPR2808150086', 'SHAPING MATHS ACT BOOK 5B PART 2 (2ND Edt)', '9', '56000', '56000'),
(87, 3, 4, 'KPR2808150087', 'SHAPING MATHS ACT BOOK 6A PART 1 (2ND Edt)', '2', '56000', '56000'),
(88, 3, 4, 'KPR2808150088', 'SHAPING MATHS ACT BOOK 6A PART 2 (2ND Edt)', '2', '56000', '56000'),
(89, 3, 4, 'KPR2808150089', 'SHAPING MATHS ACT BOOK 6B PART 1 (2ND Edt)', '2', '56000', '56000'),
(90, 3, 4, 'KPR2808150090', 'SHAPING MATHS ACT BOOK 6B PART 2 (2ND Edt)', '3', '56000', '56000'),
(91, 3, 4, 'KPR2808150091', 'I-SCIENCE TB 1 (REVISI COVER)', '3', '137000', '137000'),
(92, 3, 4, 'KPR2808150092', 'I-SCIENCE TB 2 (REVISI COVER)', '9', '137000', '137000'),
(93, 3, 4, 'KPR2808150093', 'I-SCIENCE TB 3 (REVISI COVER)', '19', '145000', '145000'),
(94, 3, 4, 'KPR2808150094', 'I-SCIENCE TB 4 (REVISI COVER)', '7', '137000', '137000'),
(95, 3, 4, 'KPR2808150095', 'I-SCIENCE TB 5 (REVISI COVER)', '9', '137000', '137000'),
(96, 3, 4, 'KPR2808150096', 'I-SCIENCE TB 6 (REVISI COVER)', '2', '116000', '116000'),
(97, 3, 4, 'KPR2808150097', 'I-SCIENCE ACT BOOK 1 (REVISI COVER)', '2', '95000', '95000'),
(98, 3, 4, 'KPR2808150098', 'I-SCIENCE ACT BOOK 2 (REVISI COVER)', '10', '95000', '95000'),
(99, 3, 4, 'KPR2808150099', 'I-SCIENCE ACT BOOK 3A (REVISI COVER)', '19', '64500', '64500'),
(100, 3, 4, 'KPR2808150100', 'I-SCIENCE ACT BOOK 3B (REVISI COVER)', '19', '64500', '64500'),
(101, 3, 4, 'KPR2808150101', 'I-SCIENCE ACT BOOK 4A (REVISI COVER)', '7', '64500', '64500'),
(102, 3, 4, 'KPR2808150102', 'I-SCIENCE ACT BOOK 4B (REVISI COVER)', '8', '64500', '64500'),
(103, 3, 4, 'KPR2808150103', 'I-SCIENCE ACT BOOK 5A ', '9', '64500', '64500'),
(104, 3, 4, 'KPR2808150104', 'I-SCIENCE ACT BOOK 5B', '9', '64500', '64500'),
(105, 3, 4, 'KPR2808150105', 'I-SCIENCE ACT BOOK 6A (REVISI COVER)', '2', '64500', '64500'),
(106, 3, 4, 'KPR2808150106', 'I-SCIENCE ACT BOOK 6B (REVISI COVER)', '2', '64500', '694500'),
(107, 3, 4, 'KPR2808150107', 'HANYU 1 (TB+WB)', '2', '40500', '40500'),
(108, 3, 4, 'KPR2808150108', 'HANYU 2 (TB+WB)', '10', '40500', '40500'),
(109, 3, 4, 'KPR2808150109', 'HANYU 3 (TB+WB)', '19', '40500', '40500'),
(110, 3, 4, 'KPR2808150110', 'HANYU 4 (TB+WB)', '7', '40500', '40500'),
(111, 3, 4, 'KPR2808150111', 'HANYU 5 (TB+WB)', '10', '40500', '40500'),
(112, 3, 4, 'KPR2808150112', 'HANYU 6 (TB+WB)', '2', '40500', '40500'),
(113, 3, 4, 'KPR2808150113', 'NEW CIVIC MORAL EDUCATION CHINESE P1', '2', '99000', '99000'),
(114, 3, 4, 'KPR2808150114', 'NEW CIVIC MORAL EDUCATION CHINESE P2', '11', '99000', '99000'),
(115, 3, 4, 'KPR2808150115', 'NEW CIVIC MORAL EDUCATION CHINESE P3', '19', '99000', '99000'),
(116, 3, 4, 'KPR2808150116', 'NEW CIVIC MORAL EDUCATION CHINESE P4', '2', '99000', '99000'),
(117, 3, 4, 'KPR2808150117', 'NEW CIVIC MORAL EDUCATION CHINESE P5', '10', '99000', '99000'),
(118, 3, 4, 'KPR2808150118', 'NEW CIVIC MORAL EDUCATION CHINESE P6', '2', '99000', '99000'),
(119, 3, 4, 'KPR2808150119', 'DI ZI QUI', '0', '94000', '94000'),
(120, 3, 4, 'KPR2808150120', 'MPH HE TB 1', '1', '70000', '70000'),
(121, 3, 4, 'KPR2808150121', 'MPH HE TB 2', '10', '70000', '70000'),
(122, 3, 4, 'KPR2808150122', 'MPH HE TB 3', '19', '70000', '70000'),
(123, 3, 4, 'KPR2808150123', 'MPH HE TB 4', '7', '66000', '66000'),
(124, 3, 4, 'KPR2808150124', 'MPH HE TB 5', '10', '66000', '66000'),
(125, 3, 4, 'KPR2808150125', 'MPH HE TB 6', '4', '66000', '66000'),
(126, 3, 4, 'KPR2808150126', 'MPH HE ACT BOOK 1', '1', '60000', '60000'),
(127, 3, 4, 'KPR2808150127', 'MPH HE ACT BOOK 2', '10', '60000', '60000'),
(128, 3, 4, 'KPR2808150128', 'MPH HE ACT BOOK 3', '19', '60000', '60000'),
(129, 3, 4, 'KPR2808150129', 'MPH HE ACT BOOK 4', '7', '53000', '53000'),
(130, 3, 4, 'KPR2808150130', 'MPH HE ACT BOOK 5', '10', '53000', '53000'),
(131, 3, 4, 'KPR2808150131', 'MPH HE ACT BOOK 6', '4', '53000', '53000'),
(132, 3, 4, 'KPR2808150132', 'PKN 1', '2', '42000', '42000'),
(133, 3, 4, 'KPR2808150133', 'PKN 2', '10', '42000', '42000'),
(134, 3, 4, 'KPR2808150134', 'PKN 3', '19', '41000', '41000'),
(135, 3, 4, 'KPR2808150135', 'PKN 4', '7', '41000', '41000'),
(136, 3, 4, 'KPR2808150136', 'PKN 5', '9', '41000', ''),
(137, 3, 4, 'KPR2808150137', 'PKN 6', '3', '47000', ''),
(138, 3, 4, 'KPR2808150138', 'IPS 1', '2', '55000', '55000'),
(139, 3, 4, 'KPR2808150139', 'IPS 2', '10', '61000', '61000'),
(141, 3, 4, 'KPR2808150141', 'IPS 4', '7', '63000', '63000'),
(142, 3, 4, 'KPR2808150142', 'IPS 5', '8', '61000', ''),
(143, 3, 4, 'KPR2808150143', 'IPS 6', '4', '57000', ''),
(144, 3, 4, 'KPR3108150144', 'BHS INDONESIA 1A', '2', '63000', '63000'),
(145, 3, 4, 'KPR3108150145', 'BHS INDONESIA 1B', '17', '58000', ''),
(146, 3, 4, 'KPR3108150146', 'BHS INDONESIA 2A', '10', '63000', '63000'),
(147, 3, 4, 'KPR3108150147', 'BHS INDONESIA 2B', '18', '58000', ''),
(148, 3, 4, 'KPR3108150148', 'BHS INDONESIA 3A', '19', '58000', '58000'),
(149, 3, 4, 'KPR3108150149', 'BHS INDONESIA 3B', '19', '51000', ''),
(150, 3, 4, 'KPR3108150150', 'BHS INDONESIA 4A', '7', '57000', '57000'),
(151, 3, 4, 'KPR3108150151', 'BHS INDONESIA 4B', '8', '51000', ''),
(152, 3, 4, 'KPR3108150152', 'BHS INDONESIA 5A', '9', '58000', ''),
(153, 3, 4, 'KPR3108150153', 'BHS INDONESIA 5B', '9', '51000', ''),
(154, 3, 4, 'KPR3108150154', 'BHS INDONESIA 6A', '3', '58000', ''),
(155, 3, 4, 'KPR3108150155', 'BHS INDONESIA 6B', '3', '51000', ''),
(156, 3, 4, 'KPR3108150156', 'WASIS BASA JAWA 4', '7', '49000', '49000'),
(157, 3, 4, 'KPR3108150157', 'WASIS BASA JAWA 5', '10', '53000', ''),
(158, 3, 4, 'KPR3108150158', 'WASIS BASA JAWA 6', '5', '58000', ''),
(159, 3, 5, 'KPR3108150159', 'CAMBRIDGE  CHECKPOINT ENG TB 7', '0', '288000', '288000'),
(160, 3, 5, 'KPR3108150160', 'CAMBRIDGE  CHECKPOINT ENG TB 8', '0', '288000', '288000'),
(161, 3, 5, 'KPR3108150161', 'CAMBRIDGE  CHECKPOINT ENG WB 7', '0', '', ''),
(162, 3, 5, 'KPR3108150162', 'CAMBRIDGE  CHECKPOINT ENG WB 8', '0', '', ''),
(163, 3, 5, 'KPR3108150163', 'CAMBRIDGE  CHECKPOINT SCIENCE TB 7', '0', '', ''),
(164, 3, 5, 'KPR3108150164', 'CAMBRIDGE  CHECKPOINT SCIENCE TB 8', '0', '', ''),
(165, 3, 5, 'KPR3108150165', 'CAMBRIDGE  CHECKPOINT SCIENCE WB 7', '0', '', ''),
(166, 3, 5, 'KPR3108150166', 'CAMBRIDGE  CHECKPOINT SCIENCE WB 8', '0', '', ''),
(167, 3, 5, 'KPR3108150167', 'NEW SYLLABUS  MATHS TB 1', '0', '315000', '315000'),
(168, 3, 5, 'KPR3108150168', 'NEW SYLLABUS  MATHS TB 2', '0', '315000', '315000'),
(169, 3, 5, 'KPR3108150169', 'NEW SYLLABUS  MATHS WB 1 (7 EDT)', '0', '147000', '147000'),
(170, 3, 5, 'KPR3108150170', 'NEW SYLLABUS  MATHS WB 2  (7 EDT)', '0', '147000', '147000'),
(171, 3, 5, 'KPR3108150171', 'EARTH OUR HOME TB 1 (2ND edt)', '0', '178000', '178000'),
(172, 3, 5, 'KPR3108150172', 'EARTH OUR HOME TB 2 (2ND edt)', '0', '178000', '178000'),
(173, 3, 5, 'KPR3108150173', 'EARTH OUR HOME WB 1 NA (2ND edt)', '0', '112000', '112000'),
(174, 3, 5, 'KPR3108150174', 'EARTH OUR HOME WB 2 NA (2ND edt)', '0', '107000', '107000'),
(175, 3, 5, 'KPR3108150175', 'HANYU 7 (TB+WB)', '0', '47000', '47000'),
(176, 3, 5, 'KPR3108150176', 'HANYU 8 (TB+WB)', '0', '47000', '47000'),
(177, 3, 4, 'KPR0409150177', 'MPH ENG HW 6A', '2', '85000', '0'),
(178, 3, 4, 'KPR0409150178', 'MPH ENG HW 6B', '2', '85000', '0'),
(179, 3, 4, 'KPR0409150179', 'SHAPING MATHS TB 6B', '2', '106000', '0'),
(180, 3, 4, 'KPR1109150180', 'SuperKids TB1', '1', '34500', '34500'),
(181, 3, 4, 'KPR1109150181', 'SuperKids WB1', '1', '25500', '25500'),
(182, 3, 4, 'KPR1109150182', 'SuperKids TB2', '10', '32500', '32500'),
(183, 3, 4, 'KPR1109150183', 'SuperKids WB2', '10', '31000', '31000'),
(184, 3, 4, 'KPR1109150184', 'SuperKids TB3', '19', '33000', '33000'),
(185, 3, 4, 'KPR1109150185', 'SuperKids WB3', '19', '31000', '31000'),
(186, 3, 4, 'KPR1109150186', 'SuperKids TB4', '7', '33000', '33000'),
(187, 3, 4, 'KPR1109150187', 'SuperKids WB4', '7', '31000', '31000'),
(188, 3, 4, 'KPR1109150188', 'SuperKids TB5', '10', '33000', '33000'),
(189, 3, 4, 'KPR1109150189', 'SuperKids WB5', '10', '31000', '31000'),
(190, 3, 4, 'KPR1109150190', 'SuperKids TB6', '5', '33000', '33000'),
(191, 3, 4, 'KPR1109150191', 'SuperKids WB6', '5', '31000', '31000'),
(192, 3, 4, 'KPR1109150192', 'Phonis spelling 1A', '1', '39000', '39000'),
(193, 3, 4, 'KPR1109150193', 'Phonis spelling 2A', '10', '45000', '45000'),
(194, 3, 4, 'KPR1109150194', 'Phonis spelling 3A', '19', '43500', '43500'),
(195, 3, 4, 'KPR1109150195', 'Phonis spelling 4A', '7', '43500', '43500'),
(196, 3, 4, 'KPR1109150196', 'Phonis spelling 5A', '10', '37500', '37500'),
(197, 3, 4, 'KPR1109150197', 'Phonis spelling 6A', '5', '50000', '50000'),
(198, 3, 4, 'KPR1109150198', 'Reading 1', '1', '46500', '46500'),
(199, 3, 4, 'KPR1109150199', 'Reading 2', '10', '55000', '55000'),
(200, 3, 4, 'KPR1109150200', 'Reading 3', '19', '48000', '48000'),
(201, 3, 4, 'KPR1109150201', 'Reading 4', '7', '58500', '58500'),
(202, 3, 4, 'KPR1109150202', 'Reading 5', '10', '59500', '59500'),
(203, 3, 4, 'KPR1109150203', 'Reading 6', '5', '59000', '59000'),
(204, 3, 4, 'KPR1109150204', 'MUSIC', '57', '55000', '55000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_produkbiaya`
--

CREATE TABLE IF NOT EXISTS `pos_produkbiaya` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_produkjasa`
--

CREATE TABLE IF NOT EXISTS `pos_produkjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_situs`
--

CREATE TABLE IF NOT EXISTS `pos_situs` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pos_situs`
--

INSERT INTO `pos_situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`) VALUES
(1, 'rekysda@gmail.com', 'Student Service', 'http://localhost/sistermeta/student/', 'Point Of Sales', 'WebDesign dengan sistem Responsive', 'sisfohrd,surabaya,indonesia', 5, 50, 5, 4, 3, 'pos', 'Elyon Christian School', 'Surabaya', 1, 1, 12, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pos_supplier`
--

CREATE TABLE IF NOT EXISTS `pos_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `pos_supplier`
--

INSERT INTO `pos_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`, `carabayar`, `termin`) VALUES
(7, 'SUP1307150007', 'NATHA JAYA', 'SBY', '0', 'Tunai', '0'),
(5, 'SUP1307150004', 'PD PURNAMA RAYA', 'PLAZA GRAHA FAMILY BLOK B-28 MIDDLE RING', '031.7344875', 'Tunai', '0'),
(6, 'SUP1307150006', 'ERLANGGA', 'SBY', '0', 'Tunai', '0'),
(8, 'SUP1109150008', 'fotocopy', 'sby', '0', 'Tunai', '0'),
(9, 'SUP1109150009', 'ms Yuli', 'sby', '0', 'Tunai', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pos_useraura`
--

CREATE TABLE IF NOT EXISTS `pos_useraura` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `pos_useraura`
--

INSERT INTO `pos_useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 0, '2015-10-09 10:44:48', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `po_alur_stok`
--

CREATE TABLE IF NOT EXISTS `po_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `po_alur_stok`
--

INSERT INTO `po_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(1, '2015-05-18', 'Saldo Awal', '-', 'KD001', '50'),
(2, '2015-05-18', 'Pembelian', 'INV1805150001', 'KD001', '5'),
(3, '2015-05-18', 'Pembelian', 'INV1805150001', 'KD001', '5'),
(4, '2015-05-18', 'Pembelian', 'INV1805150002', 'KD001', '1'),
(5, '2015-05-19', 'Retur Pembelian', 'RTB1905150001', 'KD001', '5'),
(9, '2015-05-01', 'Saldo Awal', '-', 'B01', '50'),
(10, '2015-05-07', 'Mutasi Masuk', '-', 'B01', '2'),
(11, '2015-05-25', 'Pembelian', 'INV2505150003', 'B01', '5'),
(12, '2015-06-01', 'Pembelian', 'INV0106150004', 'KD001', '5'),
(13, '2015-06-01', 'Pembelian', 'INV0106150004', 'B01', '4'),
(14, '2015-06-01', 'Retur Pembelian', 'RTB0106150002', 'KD001', '2'),
(15, '2015-06-05', 'Pembelian', 'INV0506150005', 'KD001', '3'),
(16, '2015-06-05', 'Pembelian', 'INV0506150005', 'B01', '1'),
(17, '2015-06-12', 'Pembelian', 'INV1206150006', '123', '1'),
(18, '2015-06-12', 'Pembelian', 'INV1206150001', '3', '1'),
(19, '2015-06-12', 'Pembelian', 'INV1206150001', '10', '1');

-- --------------------------------------------------------

--
-- Table structure for table `po_bulan`
--

CREATE TABLE IF NOT EXISTS `po_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `po_bulan`
--

INSERT INTO `po_bulan` (`id`, `nama`, `bulan`) VALUES
(1, 'Januari', '01'),
(2, 'Februari', '02'),
(3, 'Maret', '03'),
(4, 'April', '04'),
(5, 'Mei', '05'),
(6, 'Juni', '06'),
(7, 'Juli', '07'),
(8, 'Agustus', '08'),
(9, 'September', '09'),
(10, 'Oktober', '10'),
(11, 'Nopember', '11'),
(12, 'Desember', '12');

-- --------------------------------------------------------

--
-- Table structure for table `po_jenisproduk`
--

CREATE TABLE IF NOT EXISTS `po_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `po_jenisproduk`
--

INSERT INTO `po_jenisproduk` (`id`, `nama`) VALUES
(4, 'ALAT SEKOLAH');

-- --------------------------------------------------------

--
-- Table structure for table `po_pembelian`
--

CREATE TABLE IF NOT EXISTS `po_pembelian` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `po_pembelian`
--

INSERT INTO `po_pembelian` (`id`, `noinvoice`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `hutang`, `termin`, `tgltermin`, `user`) VALUES
(7, 'INV1206150001', 'PO1206150001', '2015-06-12', 'SUP01', 'Tunai', '200000', '0', '200000', '200000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `po_pembeliandetail`
--

CREATE TABLE IF NOT EXISTS `po_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `po_pembeliandetail`
--

INSERT INTO `po_pembeliandetail` (`id`, `noinvoice`, `kodebarang`, `jenis`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(9, 'INV1206150001', '3', 0, '1', '0', '0', '0'),
(10, 'INV1206150001', '10', 0, '1', '200000', '0', '200000');

-- --------------------------------------------------------

--
-- Table structure for table `po_pembelianretur`
--

CREATE TABLE IF NOT EXISTS `po_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_pembelianreturdetail`
--

CREATE TABLE IF NOT EXISTS `po_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_po`
--

CREATE TABLE IF NOT EXISTS `po_po` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `po_po`
--

INSERT INTO `po_po` (`id`, `nopo`, `nopr`, `tgl`, `kodesupplier`, `carabayar`, `termin`, `total`, `discount`, `netto`, `user`) VALUES
(13, 'PO1206150001', 'PR1206150001', '2015-06-12', 'SUP01', 'Tunai', '0', '200000', '0', '200000', 'admin'),
(14, 'PO1206150002', 'PR1206150002', '2015-06-12', 'SUP01', 'Tunai', '0', '0', '0', '0', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `po_podetail`
--

CREATE TABLE IF NOT EXISTS `po_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `po_podetail`
--

INSERT INTO `po_podetail` (`id`, `nopo`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(15, 'PO1206150001', '10', '1', '200000', '0', '200000'),
(16, 'PO1206150002', '3', '1', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `po_pr`
--

CREATE TABLE IF NOT EXISTS `po_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `namapr` varchar(512) NOT NULL,
  `departemenpr` varchar(512) NOT NULL,
  `tujuanpr` varchar(512) NOT NULL,
  `kategorianggaran` varchar(5) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `po_pr`
--

INSERT INTO `po_pr` (`id`, `nopr`, `tgl`, `namapr`, `departemenpr`, `tujuanpr`, `kategorianggaran`, `user`) VALUES
(9, 'PR1206150001', '2015-06-12', 'asd', '5', 'asdasd', '16', 'admin'),
(10, 'PR1206150002', '2015-06-12', 'ijkljkl', '10', 'jkljkl', '20', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `po_prdetail`
--

CREATE TABLE IF NOT EXISTS `po_prdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `spesifikasi` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `po_prdetail`
--

INSERT INTO `po_prdetail` (`id`, `nopr`, `kodebarang`, `jumlah`, `spesifikasi`) VALUES
(10, 'PR1206150001', '10', '1', 'yuiyiyi'),
(11, 'PR1206150002', '3', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `po_produk`
--

CREATE TABLE IF NOT EXISTS `po_produk` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `po_produk`
--

INSERT INTO `po_produk` (`id`, `jenis`, `kode`, `nama`, `jumlah`, `hargabeli`, `hargajual`) VALUES
(1, 4, 'KD001', 'KURSI 2', '62', '50000', '0'),
(2, 4, 'B01', 'BANGKU', '62', '60000', '0');

-- --------------------------------------------------------

--
-- Table structure for table `po_situs`
--

CREATE TABLE IF NOT EXISTS `po_situs` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `po_situs`
--

INSERT INTO `po_situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`) VALUES
(1, 'rekysda@gmail.com', 'PO & Pembelian', 'http://localhost/sistermeta/purchaseorder/', 'Purchase Order', 'WebDesign dengan sistem Responsive', 'po,surabaya,indonesia', 5, 50, 5, 4, 3, 'pos', 'Elyon Christian School', 'Surabaya', 1, 1, 12, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `po_supplier`
--

CREATE TABLE IF NOT EXISTS `po_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `po_supplier`
--

INSERT INTO `po_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`) VALUES
(1, 'SUP01', 'CV. MEDIA MANDIRI2', 'SURABAYA', 'SURABAYA');

-- --------------------------------------------------------

--
-- Table structure for table `po_useraura`
--

CREATE TABLE IF NOT EXISTS `po_useraura` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `po_useraura`
--

INSERT INTO `po_useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 0, '2015-07-10 12:32:30', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `privillege`
--

CREATE TABLE IF NOT EXISTS `privillege` (
  `id_privillege` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `psb_agama`
--

CREATE TABLE IF NOT EXISTS `psb_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `psb_agama`
--

INSERT INTO `psb_agama` (`replid`, `agama`, `urutan`) VALUES
(5, 'Budha', 5),
(4, 'Hindu', 4),
(1, 'Islam', 1),
(3, 'Katholik', 3),
(2, 'Protestan', 2);

-- --------------------------------------------------------

--
-- Table structure for table `psb_angsuran`
--

CREATE TABLE IF NOT EXISTS `psb_angsuran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cicilan` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `diskon` float(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`replid`,`cicilan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `psb_angsuran`
--

INSERT INTO `psb_angsuran` (`replid`, `cicilan`, `keterangan`, `diskon`) VALUES
(1, 1, 'in house pertama', 15.00),
(2, 2, 'in house kedua', 12.00),
(3, 3, 'in house ketiga', 10.00),
(4, 4, 'in house keempat', 8.00),
(5, 5, 'in house kelima', 6.00),
(6, 6, 'in house keenam', 4.00),
(7, 7, 'in house ketujuh', 2.00),
(8, 8, 'in house kedelapan', 1.00),
(9, 9, 'in house kesembilan', 0.00),
(10, 10, 'in house kesepuluh', 0.00),
(11, 11, 'in house kesebelas', 0.00),
(12, 12, 'in house keduabelas', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `psb_calonsiswa`
--

CREATE TABLE IF NOT EXISTS `psb_calonsiswa` (
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
  `tingkat` int(10) unsigned NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=200 ;

--
-- Dumping data for table `psb_calonsiswa`
--

INSERT INTO `psb_calonsiswa` (`replid`, `nopendaftaran`, `noformulir`, `nama`, `nis`, `nisn`, `kelas`, `idsiswa`, `panggilan`, `aktif`, `tahunmasuk`, `sekolahasal`, `kelompok`, `tingkat`, `golongan`, `suku`, `agama`, `status`, `kondisi`, `kelamin`, `tmplahir`, `tgllahir`, `warga`, `anakke`, `jsaudara`, `bahasa`, `berat`, `tinggi`, `darah`, `photo`, `alamat`, `kodepos`, `telpon`, `pinbb`, `email`, `kesehatan`, `ketkesehatan`, `ketsekolah`, `diterimadikelas`, `ijazah`, `keterangan`, `discsubsidi`, `discsaudara`, `disctunai`, `setbiaya`, `angkatan`, `namabank`, `rekening`, `grup`, `angsuran`) VALUES
(33, '000009', NULL, 'Aaron William Soemarno', '881501003', '', 0, 0, NULL, 1, 0, '', 1, 1, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2014-02-17', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Indah Asri AF-2,surabaya', NULL, '0317480970,085100711', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 3, 0, '', '', 0, 1),
(34, '000010', NULL, 'Kaylee Weng Okawida', '881501005', '', 0, 0, NULL, 1, 0, '', 1, 1, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2013-11-10', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Kutisari Indah Barat III/74 Surabaya', NULL, '08175089468,08383032', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 3, 0, '', '', 0, 1),
(35, '000011', NULL, 'William Juvandy Yulieanto', '881501001', '', 0, 0, NULL, 1, 0, '', 1, 1, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2014-03-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Raya Menganti Wiyung No.10', NULL, '081944214785', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 3, 0, '', '', 0, 1),
(36, '000012', NULL, 'Carly Rei Chen', '881501002', '', 0, 0, NULL, 1, 0, '', 1, 1, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2013-12-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Dukuh Kupang XI/9-11', NULL, '08156029002', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 3, 0, '', '', 0, 1),
(37, '000013', NULL, 'Adjie Reksa Nugroho', '881502017', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 1, 1, 0, 'L', 'Surabaya', '2013-02-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Ikan Mungsing 8 No 9', NULL, '0313535285,081654343', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(38, '000014', NULL, 'Aldrin Reynard Herdianto', '881502015', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2013-07-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'South Emerald Mansion ', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(39, '000015', NULL, 'William Halim ', '881502012', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2013-06-13', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat XII/XI', NULL, '0317329775,081654059', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(40, '000016', NULL, 'Janice Zhuang', '881502011', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 0, 1, 0, 'P', 'Surabaya', '2013-01-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Perum Graha Family A/35', NULL, '082139226000', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(41, '000017', NULL, 'Axel Oesjady', '881502014', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2013-09-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Palma H11/28 Surabaya', NULL, '08113360539,08123019', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(42, '000018', NULL, 'Archie Oesjady', '881502013', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2013-09-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Palma H11/28 Surabaya', NULL, '08113360539,08123019', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(43, '000019', NULL, 'Eugene Sinclair Sutanto', '881502010', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2013-09-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan 8 No 39', NULL, '0317348171,081333511', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(44, '000020', NULL, 'George Maverick candra', '881502008', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 5, 1, 0, 'L', 'surabaya', '2013-05-31', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Chofa,Alamanda RF 2', NULL, '0317326026,085730908', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(45, '000021', NULL, 'Lindsay Auryn Gunawan ', '881502009', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 3, 1, 0, 'P', 'surabaya', '2013-02-27', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Royal Residence B2-125', NULL, '0818528696', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(46, '000022', NULL, 'Jessica Aurellia Wibowo', '881301006', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-12-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Sulung 4/2,surabaya', NULL, '087853818718', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(47, '000023', NULL, 'Maxon Dhammika Cahyadi', '881301007', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-12-28', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Manyar Jaya Praja IV D96', NULL, '0811547033', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(48, '000024', NULL, 'Cordelia Sucarita Wang', '881502006', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-04-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Darmo Baru Barat 10/17 Surabaya', NULL, '0317314875,083849694', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(49, '000025', NULL, 'Vanisha Aiko Delphine Lesmana', '881502005', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 2, 1, 0, 'P', 'surabaya', '2012-05-04', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Blauran 5/42', NULL, '08123233019', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(50, '000026', NULL, 'Matthew Hasan Soetomo', '881402015', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-08-10', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan V/57', NULL, '0317346247,081230453', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(51, '000027', NULL, 'Mia Lila Chua', '881301003', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-05-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Teuku Umar 37,surabaya', NULL, '0315671868,085815238', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(52, '000028', NULL, 'Royce Rubio Arthawijaya', '881301005', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-09-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Kunir 6,surabaya', NULL, '0313531570,081132218', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(53, '000029', NULL, 'Caitlin Alicia Sudarmo', '881502004', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-01-05', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Babatan Pratama XVI/SS-99,surabaya', NULL, '0317526024,085851442', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(54, '000030', NULL, 'Megan huang wijaya', '881502001', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-08-28', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri sentra raya PS1/47,Citraland', NULL, '081252279997,0811308', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(56, '000032', NULL, 'Natasha Fung Wei Ling', '881502003', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-03-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Timur 7/8,surabaya', NULL, '0317315242,082142900', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(57, '000033', NULL, 'Jane Kioko Siswanto', '881502002', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 2, 1, 0, 'P', 'surabaya', '2012-08-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Sono Indah I/19', NULL, '0317389688,081131915', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(58, '000034', NULL, 'Nicholas Jayden Zein', '181402020', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 3, 1, 0, 'L', 'surabaya', '2011-12-21', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Babatan Pantai VII/24,Surabaya', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(59, '000035', NULL, 'Seraphine Hartanto', '181402019', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-08-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Eastwood EW 9/7 Citraland,Surabaya', NULL, '05240008298', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(60, '000036', NULL, 'Kayleen Alexandra Tjahyono', '181402018', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-02-02', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kupang Indah XXI/28', NULL, '082230010168,0812318', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(61, '000037', NULL, 'Michelle Kaylee Hong', '881402017', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-02-29', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Palma H9/29', NULL, '085852385898', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(62, '000038', NULL, 'Kellynn Valerie Salim', '881402016', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-07-06', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Darmo Permai Selatan 18 No.8,surabaya', NULL, '0317315668,081260769', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(63, '000039', NULL, 'Nediva Ophelia Tantica', '881402014', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-07-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan Indah TT-10', NULL, '0317313761,082231338', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(64, '000040', NULL, 'Sannivia Gesang', '881402013', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-02-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat IX/10', NULL, '0317325286,085852009', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(65, '000041', NULL, 'Carlyn Chen', '881402012', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-10-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Valensia Blok CA5 No.6 Surabaya', NULL, '03151160516,08118358', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(66, '000042', NULL, 'Mikhail Ryu Tan Wiyono', '881402010', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-07-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Perum.Ready Indah Raya,Lilium barat 15,Krian-Sidoarjo', NULL, '081330500099', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(67, '000043', NULL, 'Evan Alvaro Robinson', '881402011', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-01-30', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat 7/45', NULL, '087851309215', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(68, '000044', NULL, 'Clayton Putra Wibowo', '881402007', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 3, 1, 0, 'L', 'surabaya', '2012-01-03', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Wonocolo 4 No 43 Ketegan 35A,Sepanjang-Sidoarjo', NULL, '0317882737,081651212', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(69, '000045', NULL, 'Winston Wibowo Ongko', '881301006', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2012-04-18', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'The Adhiwangsa suite C31,BDG', NULL, '081332268888', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(70, '000046', NULL, 'Devan Dharma Dwiadmodjo', '881402006', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2011-11-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Apt.Puri Matahari No.502 jl. HR Muhammad 181', NULL, '0317345312,081553033', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(71, '000047', NULL, 'Edmund Magnus T', '881402008', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 3, 1, 0, 'L', 'surabaya', '2012-03-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Palma DI No.18,Surabaya', NULL, '081553373780', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(72, '000048', NULL, 'Sophie Eloise Husein', '881301001', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 2, 1, 0, 'P', 'surabaya', '2012-07-06', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan II/EF 29', NULL, '0317317039,085815511', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(73, '000049', NULL, 'Jevon Ethan Tin', '881301002', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 2, 1, 0, 'L', 'surabaya', '2012-03-15', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Stamford BTG TE 5/14,Citraland', NULL, '08175175117', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(74, '000050', NULL, 'Alfred Chandra Gunawan', '881301004', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'surabaya', '2011-12-23', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat VIII/27', NULL, '081216460382', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(75, '000051', NULL, 'Aleena Mudita Pohan', '881402009', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'P', 'surabaya', '2012-04-01', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Wisata Bukit Mas Blok C1-26', NULL, '0317534741,082184484', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(76, '000052', NULL, 'Scarlett Eugene Wijaya', '881503004', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2011-05-12', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Petemon II/20', NULL, '083830694704', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(77, '000053', NULL, 'Clareta Hedia Tanuwijaya', '881503001', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'P', 'surabaya', '2011-07-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Hill Blok K No.3', NULL, '0315673789,082337756', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(78, '000054', NULL, 'Clarinda Hedia Tanuwijaya', '881503002', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'P', 'surabaya', '2011-07-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Hill Blok K No.3', NULL, '0315673789,082337756', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(79, '000055', NULL, 'Felicia Sachiko Kwee', '881502003', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 0, 1, 0, 'P', 'surabaya', '2011-04-15', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Wonocolo No.101 Sepanjang', NULL, '081332313999', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(80, '000056', NULL, 'Kenzie Kalyana Chandra', '881402005', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'L', 'surabaya', '2011-07-21', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Taman Famili Selatan IV/KAV B-51', NULL, '0317329443,081652887', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(81, '000057', NULL, 'Winston Huang', '881402001', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'L', 'surabaya', '2011-09-21', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan XI/56', NULL, '08121769951,08135706', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(82, '000058', NULL, 'Michael Sugiarso', '881402004', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'L', 'surabaya', '2015-04-27', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Sukomanunggal Jaya XI/XL 24', NULL, '0811333960', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(83, '000059', NULL, 'Arleen Warner Ongkojoyo', '881402003', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 3, 1, 0, 'P', 'surabaya', '2011-08-10', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Tanjungsari Baru VI/FF12A', NULL, '0317318626,082231017', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(84, '000060', NULL, 'Fiona Joaquin Agatha', '881402002', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'P', 'Singaraja', '2011-05-18', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Lesti No.45, Surabaya', NULL, '085737678777,0315687', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(85, '000061', NULL, 'Michellepwa Leticia Tuhuteru', '881302004', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2011-10-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kedung Anyar Kuburan Np.10', NULL, '08155024123', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(86, '000062', NULL, 'Michelle Grace Valerie', '881302004', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2011-10-17', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Sentra Raya A4/22', NULL, '0317401190,082141784', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(87, '000063', NULL, 'Lionell Stewart Candra', '881302005', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2011-08-20', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Taman Hunian Satelit I, Saturnus GS 22', NULL, '085730908989', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(88, '000064', NULL, 'Aileena Keiyn Sengkey', '881302003', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2011-05-20', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Apt. Waterplace C 18A08', NULL, '08155262228', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(89, '000065', NULL, 'Jason Akira Lee', '881302002', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 2, 1, 0, 'L', 'Surabaya', '2011-07-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan XI/3B', NULL, '0317314537,081332204', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(90, '000066', NULL, 'Marcell Fredson Kuncoro', '881201001', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2011-07-08', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Telaga Golf TE 4/16', NULL, '085265222649', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(91, '000067', NULL, 'Jaysen Leiv Aripuja', '881201003', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2011-08-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan 3 No.22', NULL, '0317320709,081334242', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(92, '000068', NULL, 'Putranto Liekitasvara', '881201002', '', 0, 0, NULL, 1, 0, '', 1, 3, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2011-02-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Lidah Kulon Indah Blok M/8', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 9, 0, '', '', 0, 1),
(93, '000069', NULL, 'Sarah Aurelia Christian', '881503002', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2010-11-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Taman Gapura E4/14,Citraland', NULL, '08155200701,08155200', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(94, '000070', NULL, 'Justin Howard Limanto', '881503001', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2010-05-02', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Graha Famili YY-33', NULL, '0317329770,081230080', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(96, '000071', NULL, 'Latisa Kaeneshia', '881403002', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2009-12-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Simpang Darmo Permai Selatan III No.32', NULL, '0317318825', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(97, '000072', NULL, 'Chellyn Viona Hartanto', '881302001', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2010-08-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Dian Istana F3-89', NULL, '083830031678', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(98, '000073', NULL, 'Andhika Mahaputra Wibowo', '881202011', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2010-06-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Indah Timur G-55', NULL, '0317311069,081231276', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(99, '000074', NULL, 'Nikita Gunawan', '881101005', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2010-11-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Darmo Golf Regency C-8', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(100, '000075', NULL, 'Jessica Halim', '881202009', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2010-10-18', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan Indah III Blok XX No.16,Surabaya', NULL, '0317316109,081230972', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(101, '000076', NULL, 'Griselda Cordelia Tanesha', '881101004', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2010-01-16', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Manukan Dalam Blok 18F/17', NULL, '0317405376,081231536', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(102, '000077', NULL, 'Claire Susanto', '', '', 0, 0, NULL, 1, 0, '', 4, 6, 3, 0, 3, 0, 0, 'P', 'Surabaya', '2010-02-05', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Valensia PA 5/51', NULL, '0818508617', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(103, '000078', NULL, 'William Theodore Rudikan', '881202006', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2010-07-20', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan I/67', NULL, '08165413101,03173443', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(104, '000079', NULL, 'Alvin Pratama', '881202012', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 1, 1, 0, 'L', 'Surabaya', '2010-09-14', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Putat Gede Timur IV/46', NULL, '081330994950', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(105, '000080', NULL, 'Nicholas Jaden Husein', '881101002', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 2, 1, 0, 'L', 'Surabaya', '2010-09-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan IIEF/29', NULL, '0317317039,081230179', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(106, '000081', NULL, 'Justine Javier Yulieanto', '881101003', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2010-05-18', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Raya Candi Lontar 22A/15', NULL, '081944214785', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(107, '000082', NULL, 'Raoul Davidson', '881202007', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 3, 1, 0, 'L', 'Jakarta', '2009-12-30', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Graha Famili BB-31', NULL, '087851206999', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(108, '000083', NULL, 'Leonard Tan Wiyono', '881202005', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 5, 1, 0, 'L', 'Sidoarjo', '2010-05-05', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Raya Lilium Barat15,Kraton Residence Krian', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(109, '000084', NULL, 'Eowyn Mikhaya Tjiumena', '881202008', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2009-11-16', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Palma D1-18', NULL, '08155131714', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(110, '000085', NULL, 'Aurellia Prasetyo', '881101001', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2011-02-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan ED-4', NULL, '08123090188', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(111, '000086', NULL, 'Claire Susanto', '881202010', '', 0, 0, NULL, 1, 0, '', 1, 6, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2010-02-05', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Valensia PA 5/51', NULL, '0818508617', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(112, '000087', NULL, 'Megan Davis Zheng', '881504001', '0097501755', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2009-09-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Seruni 24,Surabaya', NULL, '0315340522,081330900', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(113, '000088', NULL, 'Keane Jo Wienardi', '881403002', '0099977814', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2009-06-28', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Muria No.25', NULL, '08179333829', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(114, '000089', NULL, 'Richardpwa louis Tuhuteru', '881403001', '0099744824', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2009-11-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kedung Anyar Kuburan No.10', NULL, '08155024123', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(115, '000090', NULL, 'Mikka Amadea Lee', '881102006', '0094354700', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2009-06-17', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan XI/3B', NULL, '081332204745', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(116, '000091', NULL, 'Richie Tanudihardjo', '881303005', '0081852777', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2008-08-20', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kaliwaron No 128A', NULL, '087852362999', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(117, '000092', NULL, 'Sachi Alexandra', '881202001', '0092795964', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2009-06-12', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Citraland,Golf Avenue GV 6/28', NULL, '085881015838', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(118, '000093', NULL, 'Vincent Alexander', '881102008', '0097604036', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2009-05-30', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Indah Barat IV/A-2', NULL, '08123135650', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(119, '000094', NULL, 'Jethro Mustaine Geronimo Purwanto', '881202002', '0095288931', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'L', 'Surabaya', '2009-09-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Alam Hijau F2-23 Citraland', NULL, '08123591974', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(120, '000095', NULL, 'Eugene Halim', '881202004', '0099174425', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2009-06-10', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Valensia PA 10/2', NULL, '081217813444', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(121, '000096', NULL, 'Reyhan Dharma Dwiadmodjo', '881102007', '0093754464', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'L', 'Surabaya', '2009-09-01', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Matahari No.502', NULL, '081553033485', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(122, '000097', NULL, 'Lunabelle Veloxia Taslim', '881102005', '0099229408', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2009-04-30', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Taman Darmo Baru No.3', NULL, '081331685888', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(123, '000098', NULL, 'Jordyn Edward Motanto', '881001001', '0092508111', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2009-06-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Simpang Darmo Permai Selatan XI/73', NULL, '0818307043', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(124, '000099', NULL, 'Justin Ong', '881102004', '0097551938', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2009-01-14', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Satelit Timur 2/JJ-26', NULL, '08123256838', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(125, '000100', NULL, 'Darren Evan Tin', '881001002', '0091799800', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'L', 'Surabaya', '2009-10-23', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Simpang Darmo Permai Selatan X/7', NULL, '08175175117', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(126, '000101', NULL, 'Ryu Adhikumara Chandra', '881202003', '0096324516', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2009-11-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Valensia PA16/16', NULL, '081330340971', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(127, '000102', NULL, 'Purnama Adhi Wijaya', '881202003', '0092221028', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Sidoarjo', '2009-03-11', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Sambikerep No.80', NULL, '085230718699', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(128, '000103', NULL, 'Wyanetta Windiora Widjaja', '881304004', '0085138174', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2008-12-05', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Widya Kencana K5/25,Citraland', NULL, '081553512345', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(129, '000104', NULL, 'Claire Davis Zheng', '881304001', '0089793616', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2008-03-04', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Seruni 24', NULL, '081330900123', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(130, '000105', NULL, 'Darren Alexander Tjahyono', '881304002', '0088487346', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2008-06-18', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kupang Indah XXI/28', NULL, '085733787892', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(131, '000106', NULL, 'Gracelynn Valerie Salim', '881304003', '0089649637', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2008-12-09', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan 18/8', NULL, '08126076989', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(132, '000107', NULL, 'Celine Cahyadi', '881303004', '0085420133', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2008-02-21', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Woodland WL 8/6', NULL, '085708571680', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(133, '000108', NULL, 'Chloe Aurelia Tjan', '881002011', '0082358574', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2008-10-01', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan No.23', NULL, '08179178899', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(134, '000109', NULL, 'Francis Hendry Nathanael', '881203002', '0088057310', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2008-05-08', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat', NULL, '08113568889', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(135, '000110', NULL, 'Juliette Anthoni', '881303003', '0082645145', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2008-10-04', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Graha Family P-115', NULL, '081615000911', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(136, '000111', NULL, 'Hilton Felix Hartanto', '881002011', '0086809752', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2008-10-18', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Addington C1-162,Royal Residence', NULL, '081216212168', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(137, '000112', NULL, 'Austine Keith Setyawan', '881002010', '0088639773', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2008-08-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat III/33', NULL, '08155200300', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(138, '000113', NULL, 'Allyzione Halim', '881102002', '0086846802', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2008-03-03', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Royal Park TL 2/24,Citraland', NULL, '0818500886', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(139, '000114', NULL, 'Angelicia Julianne Hartanto', '881002001', '0084164763', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2008-07-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Dian Istana F3/89', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(140, '000115', NULL, 'Draven Hartanto', '881203001', '0088247837', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2008-10-06', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Eastwood EW 9/7,Citraland', NULL, '085240008298', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(141, '000116', NULL, 'Aileen Kwee', '880901001', '0083365882', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2008-08-08', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Utara XI/G1', NULL, '08123576450', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(142, '000117', NULL, 'Eryn Shelivia T', '881003002', '0085280981', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2008-03-27', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Taman Darmo Permai Utara III/4', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(143, '000118', NULL, 'Vince Hugo Alexis', '881002012', '0089862207', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2008-03-16', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Bukit Permai No.68,Bulu Jaya', NULL, '08155093889', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(144, '000119', NULL, 'Felicia Hanna Thea', '881102003', '0085445167', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2008-08-28', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Utara 7/16', NULL, '08563003381', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(145, '000120', NULL, 'Faustina Leonita', '881102001', '0089668774', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Tangerang', '2008-06-10', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Perum Citra Sentosa Blok D-9', NULL, '08175161980', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(146, '000121', NULL, 'Anasthasia Agatha Sunarta', '880902007', '0074838171', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2007-05-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kutisari Indah Selatan 2/9', NULL, '08123020867', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(147, '000122', NULL, 'Arvind Dharma Dwiadmodjo', '881002006', '0071140471', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2007-05-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Matahari No.502', NULL, '081553033485', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(148, '000123', NULL, 'Arvin Renardi', '880902008', '0078321653', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'L', 'Surabaya', '2007-05-11', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat X/18', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(149, '000124', NULL, 'Chloe Lindsay Wibowo', '881002004', '0074138431', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2007-09-13', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Ketegan 35A,Sepanjang', NULL, '0816512129', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(150, '000125', NULL, 'Darrel Karuna Andoyo', '880801003', '0067776619', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2006-12-02', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Bukit Regency I/PC 2-9,Pakuwon Indah', NULL, '0811333492', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(151, '000126', NULL, 'Felicia Gavriel', '881002010', '0072880238', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2007-09-12', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Sukomanunggal Jaya 2/34', NULL, '085850877778', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(152, '000127', NULL, 'Ferdinand Cahyadi', '881103001', '0079517090', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2007-01-30', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Woodland WL 8/6,Citraland', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(153, '000128', NULL, 'Jeane Prajna Paramita Ong', '880902005', '0074643071', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2007-06-11', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Gunung sari Indah K-9,surabaya', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(154, '000129', NULL, 'Jocelyn Huang Wijaya', '881002011', '0066700105', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2006-12-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Sentra Raya PS1/47,Citraland Surabaya', NULL, '0811308948', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(155, '000130', NULL, 'Jesslyn Aurelia Rudikan', '881002003', '0076925004', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2007-09-12', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan I/67', NULL, '08165413101', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(156, '000131', NULL, 'Kevan Cornelius Tjan', '881103002', '0073266981', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2007-08-23', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Selatan No.23', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(157, '000132', NULL, 'Maitri Liekitasvara', '881002002', '0073168872', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2007-04-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Lidah Kulon Indah Blok M/8', NULL, '08885321986', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(158, '000133', NULL, 'Michael Fredson Kuncoro', '880801002', '0073290131', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'L', 'Malang', '2007-01-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Pakuwon Villa Bukit Indah AAL-64', NULL, '085265222649', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(159, '000134', NULL, 'Michelle Isabelle Kuncoro', '880801001', '0071988129', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Malang', '2007-01-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Pakuwon Villa BUkit Indah AAL-64', NULL, '085265222649', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(160, '000135', NULL, 'Peter Elbert Eistein', '881002007', '0079210176', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2007-03-16', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Bukit Permai kav.68,Surabaya', NULL, '08155093889', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(161, '000136', NULL, 'Reyna Alexandra', '881002009', '0079707186', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2007-09-11', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Indah Barat IV/A-2,Surabaya', NULL, '08123135650', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(162, '000137', NULL, 'Tiffany Claribel Hillary Lesmana', '881002008', '0078996913', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2007-07-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Indah Asri AD-18', NULL, '08123233019', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(163, '000138', NULL, 'Violine Ong', '880902006', '0078143053', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2007-03-14', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Satelit Timur 2/JJ-26', NULL, '08123256838', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(164, '000139', NULL, 'Felicia Aurelia Tanudihardjo', '880902001', '0067796236', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2006-06-15', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kaliwaron No 128 A', NULL, '087852362999', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(165, '000140', NULL, 'Audriana Halim', '880902004', '0067875439', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2006-09-03', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Royal Park TL 2/24,Citraland', NULL, '0818500886', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(166, '000141', NULL, 'Arya Ananda Wangsanegara', '880702007', '0065177653', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2006-10-21', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan Utara VI/EX-12', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(167, '000142', NULL, 'Rayner Nicholous Tan', '880902003', '0069799784', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2006-09-01', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Taman Telaga II TJ 10/7 Surabaya', NULL, '08123028007', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(168, '000143', NULL, 'Jocelyn Revata Santoso', '880702006', '0066227620', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2006-01-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'jl.Tanjungsari Baru VI/FF-17', NULL, '085648181000', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(169, '000144', NULL, 'Rachelle Wibowo Ongko', '880701001', '0062271748', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2006-03-03', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl Gading Pantai V/1', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(170, '000145', NULL, 'Tiffany Jocelyn Irwan', '880902002', '0069319958', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2006-06-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Raffles Garden TB IV No. 2', NULL, '081331047678', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(171, '000146', NULL, 'Wilviana Windeva Widjaja', '881002001', '0064568585', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2006-01-30', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Widya Kencana K5/25,Citraland', NULL, '081553512345', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(172, '000147', NULL, 'Velia Martamulia', '880702001', '0057588530', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2005-05-26', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan ED4,Surabaya', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(173, '000148', NULL, 'Owen Huang Wijaya', '880903001', '0056900569', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2005-02-05', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Sentra Raya PS1/47,Citraland', NULL, '0811308948', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(174, '000149', NULL, 'Arganta', '880702005', '0058563968', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2005-08-01', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat X/18', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(175, '000150', NULL, 'Charlize Fiona Irwan', '880802002', '0057536892', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2005-05-14', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Raffles Garden TB IV/2', NULL, '081331047678', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(176, '000151', NULL, 'Devi Prajna Paramita Ong', '880601002', '0056779796', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2005-02-20', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Gunung Sari Indah K9', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(177, '000152', NULL, 'Evelyn Lianto', '880702004', '0055863705', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2005-06-12', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Baru Barat I/6', NULL, '08165411116', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(178, '000153', NULL, 'Leonard Sariputra Wangsanegara', '880702003', '0051329368', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2005-06-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan Utara G EX/12', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(179, '000154', NULL, 'Nicole Andrea Husein ', '880702002', '0054072585', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 2, 1, 0, 'P', 'Surabaya', '2005-12-16', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Timur II/18', NULL, '08123046045', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(180, '000155', NULL, 'Felicia Ong', '880601001', '0053823934', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2005-03-23', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Satelit Timur 2/JJ-26', NULL, '08123256838', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(181, '000156', NULL, 'Patricia Angelicia Tanudihardjo', '880802001', '0059656729', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2005-01-29', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kaliwaron No.128A', NULL, '0818512800', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(182, '000157', NULL, 'Ashley Karina Andoyo', '880501001', '0045339901', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2004-09-29', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Bukit Regency I/PC2-9,Pakuwon Indah', NULL, '0811333492', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(183, '000158', NULL, 'Catherine Alexandra Husein', '880602002', '0049559570', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2004-05-02', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Timur II/18', NULL, '08123046045', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(184, '000159', NULL, 'Michelle Wibowo Ongko', '880602002', '0048431903', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2004-05-18', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl.Gading Pantai V/1', NULL, '081332268888', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(185, '000160', NULL, 'Vania Martamulia', '880602003', '0048871799', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2004-05-25', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Harapan ED-4', NULL, '08123521699', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(186, '000161', NULL, 'Richie Markus Liadi', '880804002', '0029408817', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Jember', '2003-12-20', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Indah Selatan EE26', NULL, '085102480030', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(187, '000162', NULL, 'Juan Ryan Zen Antonio', '881505001', '2', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2002-04-11', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Taman Pondok Indah XV Blok JJ-18', NULL, '0818371066', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(188, '000163', NULL, 'Kenzie Andrew', '881304001', '0024231453', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Jakarta', '2002-09-03', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Golf Avenue,Blok GV 6/28', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(189, '000164', NULL, 'Maria Imaculata Louisa Sunarta', '880703001', '0037349654', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2003-06-01', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Kutisari Indah Selatan 2/9 Surabaya', NULL, '08123020867', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(190, '000165', NULL, 'Delicia Chrystalyn', '880904001', '0039715587', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2003-11-05', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Taman International I B3-21,Citraland', NULL, '08123028007', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1);
INSERT INTO `psb_calonsiswa` (`replid`, `nopendaftaran`, `noformulir`, `nama`, `nis`, `nisn`, `kelas`, `idsiswa`, `panggilan`, `aktif`, `tahunmasuk`, `sekolahasal`, `kelompok`, `tingkat`, `golongan`, `suku`, `agama`, `status`, `kondisi`, `kelamin`, `tmplahir`, `tgllahir`, `warga`, `anakke`, `jsaudara`, `bahasa`, `berat`, `tinggi`, `darah`, `photo`, `alamat`, `kodepos`, `telpon`, `pinbb`, `email`, `kesehatan`, `ketkesehatan`, `ketsekolah`, `diterimadikelas`, `ijazah`, `keterangan`, `discsubsidi`, `discsaudara`, `disctunai`, `setbiaya`, `angkatan`, `namabank`, `rekening`, `grup`, `angsuran`) VALUES
(191, '000166', NULL, 'Rio ferdinand Felix Liadi', '880804002', '0029408817', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'L', 'Jember', '2002-08-08', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Indah Selatan EE26', NULL, '0818518468', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(192, '000167', NULL, 'Cherrie Wang', '880804001', '1', 0, 0, NULL, 1, 0, '', 1, 4, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2002-10-10', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Pakuwon Villa Bukit Regency 2PD9 No 54', NULL, '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 12, 0, '', '', 0, 1),
(193, '000168', NULL, 'Charlotte Moraya Irawan', '881502018', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 5, 1, 0, 'P', 'Surabaya', '2012-11-29', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Bukit Darmo Golf I/75', NULL, '081232351872', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(194, '000169', NULL, 'Reiji Setiobudi', '881501007', '', 0, 0, NULL, 1, 0, '', 1, 1, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2014-02-02', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Dian Istana C4 No 1', NULL, '087852390985', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 3, 0, '', '', 0, 1),
(195, '000170', NULL, 'Noah Putra Millar', '881501004', '', 0, 0, NULL, 1, 0, '', 1, 1, 1, 0, 0, 1, 0, 'L', 'Australia', '2014-05-07', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Perumahan Babatan Indah Blok B8/19 Surabaya', NULL, '08113534627', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 1, 0, '', '', 0, 1),
(196, '000171', NULL, 'Marcio Widjaja', '881501006', '', 0, 0, NULL, 1, 0, '', 1, 1, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2013-12-19', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Puri Sentra Raya PS1/32', NULL, '081320500388', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 3, 0, '', '', 0, 1),
(197, '000172', NULL, 'Mikhael Oliver Harsono', '881502016', '', 0, 0, NULL, 1, 0, '', 1, 2, 3, 0, 3, 1, 0, 'P', 'Surabaya', '2013-08-20', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Darmo Permai Timur V No.12A Surabaya', NULL, '085730108572', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 6, 0, '', '', 0, 1),
(198, '000173', NULL, 'Richard Alvino', '181502007', '', 0, 0, NULL, 1, 0, 'Margie School', 1, 5, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2012-08-22', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Jl. Kupang baru 1/115', NULL, '087853963092', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1),
(199, '000174', NULL, 'Reizo Edmund Yong ( Evan )', '881502008', '', 0, 0, NULL, 1, 0, '', 1, 5, 3, 0, 5, 1, 0, 'L', 'Surabaya', '2012-04-10', NULL, 0, 0, NULL, '0.0', '0.0', '-', NULL, 'Villa Valensia PA 1/32', NULL, '082331255870', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '0', '0', '0', 0, 0, '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `psb_calonsiswa_ayah`
--

CREATE TABLE IF NOT EXISTS `psb_calonsiswa_ayah` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `psb_calonsiswa_ayah`
--

INSERT INTO `psb_calonsiswa_ayah` (`replid`, `calonsiswa`, `nama`, `tmplahir`, `tgllahir`, `agama`, `warga`, `pendidikan`, `pekerjaan`, `penghasilan`, `telpon`, `pinbb`, `email`) VALUES
(24, 25, 'David Teguh Budainto', '', '0000-00-00', 0, '', '', '', '0', '0315340522', '', ''),
(25, 26, '', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(26, 27, '', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(27, 28, 'Huinto Tin', '', '0000-00-00', 0, '', '', '', '0', '081 75175117', '', ''),
(28, 29, 'David Teguh Budainto', '', '0000-00-00', 0, '', '', '', '0', '0315340522', '', ''),
(29, 30, 'Irwanto', '', '0000-00-00', 0, '', '', '', '0', '031. 7318473', '', ''),
(30, 31, 'Rendy Motanto', '', '0000-00-00', 0, '', '', '', '0', '031. 77556589', '', ''),
(31, 32, 'Triady Taslim', '', '0000-00-00', 0, '', '', '', '0', '031. 77120122', '', ''),
(32, 33, 'Romy Janto Soemarno', '', '0000-00-00', 0, 'Indonesia', '', 'swasta', '0', '', '73ec9792', ''),
(33, 34, 'Ifan Okawida', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(34, 35, 'Zendy Yulieanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(35, 36, 'Andy Prayitno', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(36, 37, 'Prapto Nugroho', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(37, 38, 'Adi Surya Herdianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(38, 39, 'Richy Setyabudi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(39, 40, 'Yohan Tjendra', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(40, 41, 'Echy Oesjady', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(41, 42, 'Echy Oesjady', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(42, 43, 'David Sugianto Sutanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(43, 44, 'Hengky candra', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(44, 45, 'Yohan Gunawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(45, 46, 'Wibowo Sundoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(46, 47, 'Jefri Gunawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(47, 48, 'Chitrahadi Sudirman', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(48, 49, 'Lucky Lesmana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(49, 50, 'Marcus', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(50, 51, 'Dharta Tjahjadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(51, 52, 'Sandy Ongkowijoyo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(52, 53, 'Ali Sofyan G', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(53, 54, 'Hence Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(54, 55, 'Benny Suryadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(55, 56, 'Fung Kon Siong', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(56, 57, 'Burhan Siswanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(57, 58, 'Sandy Zein', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(58, 59, 'Donny Hartanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(59, 60, 'Tjun Tjun', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(60, 61, 'Yulianto Amidjojo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(61, 62, 'Yanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(62, 63, 'Adi Toni', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(63, 64, 'Syaruna Gesang', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(64, 65, 'Loe Riyanto Handy', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(65, 66, 'Ivan Wiyono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(66, 67, 'Robert', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(67, 68, 'Leo Himawan Wibowo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(68, 69, 'Hadi Wibowo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(69, 70, 'Andrian Dwiadmodjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(70, 71, 'Edward Panca', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(71, 72, 'Wirya D Husein', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(72, 73, 'Huinto Tin', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(73, 74, 'Roger Gunawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(74, 75, 'Toni Edra Pohan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(75, 76, 'Jeffry Yono Widjaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(76, 77, 'Henry Samuel Tanuwijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(77, 78, 'Henry Samuel Tanuwijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(78, 79, 'Fransisco Herdianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(79, 80, 'Widarta Chandra', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(80, 81, 'Bambang Swanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(81, 82, 'Ivan Sugiarso', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(82, 83, 'Wellyanto Ongkojoyo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(83, 84, 'Yoshua Jimmy', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(84, 85, 'Hardy Tuhuteru', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(85, 86, 'Fitri Eddy', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(86, 87, 'Hengky Candra', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(87, 88, 'Gilbert Reonaldo Sengkey', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(88, 89, 'Samuel  Lianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(89, 90, 'Freddy Kuncoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(90, 91, 'Riano', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(91, 92, 'Hendra Gunawan Lie', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(92, 93, 'Stanley Christian', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(93, 94, 'L Suhono Limanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(94, 95, 'L Suhono Limanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(95, 96, 'Ang Hong Tjoan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(96, 97, 'Youngky Hartanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(97, 98, 'Edi Wibowo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(98, 99, 'Gregorius Gunawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(99, 100, 'Hedy Santoso Halim', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(100, 101, 'Esan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(101, 102, 'Slamet Susanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(102, 103, 'Sunardi Rudikan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(103, 104, 'Rudi Harianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(104, 105, 'Wirya Dwisapta Husein', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(105, 106, 'Zendy Yulieanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(106, 107, 'Amir Kadir', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(107, 108, 'Ivan Wiyono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(108, 109, 'Edward Panca', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(109, 110, 'Yulianto NP', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(110, 111, 'Slamet Susanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(111, 112, 'David Teguh Budianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(112, 113, 'Eddy Wienardi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(113, 114, 'Hardy Tuhuteru', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(114, 115, 'Samuel Lianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(115, 116, 'Happy Tanudihardjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(116, 117, 'Theng Johan Kusnadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(117, 118, 'Lim Sartono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(118, 119, 'Gunawan Purwanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(119, 120, 'Soegiarto Halim', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(120, 121, 'Andrian Dwiadmodjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(121, 122, 'Triady Taslim', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(122, 123, 'Rendy Motanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(123, 124, 'Irwanto Sukardi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(124, 125, 'Huinto Tin', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(125, 126, 'Rico Satria Chandra', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(126, 127, 'Passadhi Agung N', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(127, 128, 'Edy Wibowo Widjaja', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(128, 129, 'David Teguh Budianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(129, 130, 'Tjun Tjun', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(130, 131, 'Yanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(131, 132, 'Welly Cahyadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(132, 133, 'Steven Johnsons Tjan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(133, 134, 'Hendry faisal Liauw', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(134, 135, 'Anthoni', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(135, 136, 'Juwono Hartanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(136, 137, 'Bambang Setyawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(137, 138, 'Steven Halim', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(138, 139, 'Youngky Hartanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(139, 140, 'Donny Hartanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(140, 141, 'Kwee Tjun Lian', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(141, 142, 'Emil Tandiono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(142, 143, 'Lie Chung Ie', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(143, 144, 'Koestanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(144, 145, 'Giok Cun', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(145, 146, 'Sunaryo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(146, 147, 'Andrian Dwiadmodjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(147, 148, 'Sunarso', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(148, 149, 'Leo Himawan Wibowo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(149, 150, 'Fung Andoyo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(150, 151, 'Richy Setyabudi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(151, 152, 'Welly Cahyadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(152, 153, 'Fredrik', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(153, 154, 'Hence Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(154, 155, 'Sunardi Rudikan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(155, 156, 'Steven Johnsons Tjan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(156, 157, 'Hendra Gunawan Lie', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(157, 158, 'Freddy Kuncoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(158, 159, 'Freddy Kuncoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(159, 160, 'Lie Chung Ie', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(160, 161, 'Lim Sartono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(161, 162, 'Lucky Lesmana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(162, 163, 'Irwanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(163, 164, 'Happy Tanudihardjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(164, 165, 'Steven Halim', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(165, 166, 'Hutomo Wangsanegara', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(166, 167, 'Ratno', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(167, 168, 'Indarto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(168, 169, 'Hadi Wibowo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(169, 170, 'Junaidi Widyanto Irwan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(170, 171, 'Edy Wibowo Widjaja', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(171, 172, 'Anton Martamulia', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(172, 173, 'Hence Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(173, 174, 'Sunarso', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(174, 175, 'Junaidi Widyanto Irwan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(175, 176, 'Fredrik', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(176, 177, 'Robertus Alberth Lie', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(177, 178, 'Hutomo Wangsanegara', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(178, 179, 'Surya Margautama Husein', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(179, 180, 'Irwanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(180, 181, 'Happy Tanudihardjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(181, 182, 'Fung Andoyo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(182, 183, 'Surya Margautama Husein', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(183, 184, 'Hadi Wibowo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(184, 185, 'Anton Martamulia', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(185, 186, 'Rowan Liadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(186, 187, 'Marvis', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(187, 188, 'Johan Kusnadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(188, 189, 'Sunaryo Djojoleksono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(189, 190, 'Ratno', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(190, 191, 'Rowan Liadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(191, 192, 'Kartono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(192, 193, 'Robby Sabastian Irawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(193, 194, 'Hendra Setiobudi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(194, 195, 'Lucas John Millar', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(195, 196, 'Jimmy Widjaja', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(196, 197, 'Vincentius Harsono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(197, 198, 'Amin', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(198, 199, 'Theng Johan Kusnadi', '', '0000-00-00', 0, '', '', '', '0', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `psb_calonsiswa_ibu`
--

CREATE TABLE IF NOT EXISTS `psb_calonsiswa_ibu` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `psb_calonsiswa_ibu`
--

INSERT INTO `psb_calonsiswa_ibu` (`replid`, `calonsiswa`, `nama`, `tmplahir`, `tgllahir`, `agama`, `warga`, `pendidikan`, `pekerjaan`, `penghasilan`, `telpon`, `pinbb`, `email`) VALUES
(24, 25, 'Stephanie', '', '2015-07-02', 0, '', '', '', '0', '03131250123', '', ''),
(25, 26, '', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(26, 27, '', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(27, 28, 'Helen Novalisa Ukorawung', '', '0000-00-00', 0, '', '', '', '0', '03170129088', '', ''),
(28, 29, 'Stephanie', '', '0000-00-00', 0, '', '', '', '0', '03131250123', '', ''),
(29, 30, 'Lince R Wijaya', '', '0000-00-00', 0, '', '', '', '0', '031. 7318473', '', ''),
(30, 31, 'Silvia Kuncoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(31, 32, 'Mia Hapsari', '', '0000-00-00', 0, '', '', '', '0', '031. 70218682', '', ''),
(32, 33, 'Vivi Pratiwi', '', '0000-00-00', 0, 'Indonesia', '', '', '0', '', '', 'renatavivipratiwi@gmail.com'),
(33, 34, 'Selvi Januarini Wibhawa', '', '0000-00-00', 0, '', '', '', '0', '', '', 'okawida_14@yahoo.com'),
(34, 35, 'Vince Pongawa', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(35, 36, 'Yoren Viryamarchyo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(36, 37, 'Romana Thensy Sheilla Dewi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(37, 38, 'Silvia Irene', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(38, 39, 'Silvia', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(39, 40, 'Ayu Trisnawaty', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(40, 41, 'Winda Anggraini Lukito', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(41, 42, 'Winda Anggraini Lukito', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(42, 43, 'Veronica Basuki', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(43, 44, 'Emilia Amsal', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(44, 45, 'Olivia Sulistio', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(45, 46, 'Linda Setiawati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(46, 47, 'Linda', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(47, 48, 'Meliana Kusuma', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(48, 49, 'Lily Indahyani Santoso', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(49, 50, 'Imelda', '', '0000-00-00', 0, '', '', '', '0', '', '', 'chau_su@yahoo.com'),
(50, 51, 'Levina Rahardjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(51, 52, 'Sukmadewi sunaryo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(52, 53, 'Natalia Yuwono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(53, 54, 'Hanny Winarko', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(54, 55, 'Yaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(55, 56, 'Indrawati Pudji Santoso', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(56, 57, 'Irene Sadikin', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(57, 58, 'Monica Evelyn Sugianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(58, 59, 'Amelia Liando', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(59, 60, 'Herna', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(60, 61, 'Catra Ariy Lestari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(61, 62, 'Merry Teja Tio', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(62, 63, 'Erriana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(63, 64, 'Yuliana Agahari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(64, 65, 'Rini Maryani', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(65, 66, 'Meychie Irawati Effendy', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(66, 67, 'Felly Yunita', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(67, 68, 'Helen Kurniawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(68, 69, 'Stephanie Wibisana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(69, 70, 'Horiani Supardi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(70, 71, 'Christina Rose', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(71, 72, 'Evi Ratna', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(72, 73, 'Helen Novalisa Likorawung', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(73, 74, 'Ratna Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(74, 75, 'Novita sari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(75, 76, 'Christine Gunawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(76, 77, 'Dian Juliantine', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(77, 78, 'Dian Juliantine', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(78, 79, 'Selfi Sarbini', '', '0000-00-00', 0, '', '', '', '0', '', '', 'genius.kwee@gmail.com'),
(79, 80, 'Yuniawati Gosal', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(80, 81, 'Fe Fe', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(81, 82, 'Luciana waty S', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(82, 83, 'Theresia Lilyanawati Tanjung', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(83, 84, 'Komang Sutiari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(84, 85, 'Conniepwa Theresia M', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(85, 86, 'Ratnawati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(86, 87, 'Emilia Amsal', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(87, 88, 'Olevia H Suhandi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(88, 89, 'Megumi Halim', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(89, 90, 'Sukma Yenti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(90, 91, 'Felicia Sutanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(91, 92, 'Ellena Lioe', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(92, 93, 'Amelia', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(93, 94, 'Angeline Boedihartono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(94, 95, 'Angeline Boedihartono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(95, 96, 'Bonny Irene', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(96, 97, 'Yunita Sjarif', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(97, 98, 'Fonda Hogiprasetyawati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(98, 99, 'Henny Harianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(99, 100, 'Lustiani', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(100, 101, 'Nanik Hidayat', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(101, 102, 'Imelda Susanti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(102, 103, 'Fonda', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(103, 104, 'Shelvi Dyah Pratiwi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(104, 105, 'Evi Ratna Dihardja', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(105, 106, 'Vince Pongawa', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(106, 107, 'Isyela Larossa', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(107, 108, 'Meychie Irawati Effendy', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(108, 109, 'Christina Rose', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(109, 110, 'Tanty Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(110, 111, 'Imleda Susanti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(111, 112, 'Stephanie', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(112, 113, 'Vera Budianto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(113, 114, 'Conniepwa Theresia Megawati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(114, 115, 'Megumi Halim', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(115, 116, 'Vivi Susilo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(116, 117, 'Selvy Susanti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(117, 118, 'Sri Rumiarsih', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(118, 119, 'Grace Agustin', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(119, 120, 'Fenny', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(120, 121, 'Horiani Supardi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(121, 122, 'Mia Hapsari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(122, 123, 'Silvia Kuncoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(123, 124, 'Lince Ruslim Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(124, 125, 'Helen Novalisa Likorawung', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(125, 126, 'Jenny Natalia Sunyoto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(126, 127, 'Krisnawati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(127, 128, 'Carolina Krishanti Sidharta', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(128, 129, 'Stephanie', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(129, 130, 'Herna', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(130, 131, 'Merry Teja Tio', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(131, 132, 'Merawati Sulistyo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(132, 133, 'Yuliana Kurniawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(133, 134, 'Purnamasari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(134, 135, 'Niken Trikurniawati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(135, 136, 'Yenny Winarko', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(136, 137, 'Anna Lisayani', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(137, 138, 'Melany Susanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(138, 139, 'Yunita Sjarif', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(139, 140, 'Amelia Liando', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(140, 141, 'Surianti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(141, 142, 'Eva Winarko', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(142, 143, 'Siuny Prajugo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(143, 144, 'Ryni Winia', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(144, 145, 'Tjuan Ni', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(145, 146, 'Veronica', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(146, 147, 'Horiani Supardi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(147, 148, 'Tan Tanti Mega Sari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(148, 149, 'Helen Kurniawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(149, 150, 'Shanti Tjahjadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(150, 151, 'Silvia Kuncoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(151, 152, 'Merawati Sulistyo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(152, 153, 'Jaswiati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(153, 154, 'Hanny Winarko', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(154, 155, 'Fonda', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(155, 156, 'Yuliana Kurniawan', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(156, 157, 'Ellena Lioe', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(157, 158, 'Sukma Yenti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(158, 159, 'Sukma Yenti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(159, 160, 'Siuny Prajugo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(160, 161, 'Sri Rumiarsih', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(161, 162, 'Lily Indahyani', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(162, 163, 'Lince Ruslim Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(163, 164, 'Vivi Susilo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(164, 165, 'Melany Susanto', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(165, 166, 'Leony Sinarta', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(166, 167, 'Levy Christiana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(167, 168, 'Fenny', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(168, 169, 'Stephanie Wibisana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(169, 170, 'Dwi Puspito Rini Limbono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(170, 171, 'Carolina Krishanti Sidharta', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(171, 172, 'Lenny Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(172, 173, 'Hanny Winarko', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(173, 174, 'Tan Tanti Mega Sari', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(174, 175, 'Dwi Puspito Rini Limbono', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(175, 176, 'Jaswiati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(176, 177, 'Irine Purwonegoro', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(177, 178, 'Leony Sinarta', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(178, 179, 'Lisawati Subagjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(179, 180, 'Lince Ruslim Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(180, 181, 'Vivi Susilo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(181, 182, 'Shanti Tjahjadi', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(182, 183, 'Lisawati Subagjo', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(183, 184, 'Stephanie Wibisana ', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(184, 185, 'Lenny Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(185, 186, 'Liadikta Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(186, 187, 'Lestiawati', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(187, 188, 'Selvy Susanti', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(188, 189, 'Maria Veronica Mirata', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(189, 190, 'Levy Christiana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(190, 191, 'Liadikta Wijaya', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(191, 192, 'Lusiana', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(192, 193, 'Maggie Astrid Liando', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(193, 194, 'Dian Natalia Prasetio', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(194, 195, 'Wuri Yustikarini', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(195, 196, 'Fenny Yuliawaty', '', '0000-00-00', 0, '', '', '', '0', '', '', 'fenny_yc@hotmail.com'),
(196, 197, 'Yemy Ameliana', '', '0000-00-00', 0, '', '', '', '0', '', '', 'lia_dent@yahoo.com'),
(197, 198, 'Rida', '', '0000-00-00', 0, '', '', '', '0', '', '', ''),
(198, 199, 'Selvy Susanti', '', '0000-00-00', 0, '', '', '', '0', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `psb_calonsiswa_keluarga`
--

CREATE TABLE IF NOT EXISTS `psb_calonsiswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `kakek_nama` varchar(100) NOT NULL DEFAULT '',
  `kakek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `nenek_nama` varchar(100) NOT NULL DEFAULT '',
  `nenek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `psb_calonsiswa_keluarga`
--

INSERT INTO `psb_calonsiswa_keluarga` (`replid`, `calonsiswa`, `kakek_nama`, `kakek_tgllahir`, `nenek_nama`, `nenek_tgllahir`, `tglnikah`) VALUES
(24, 25, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(25, 26, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(26, 27, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(27, 28, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(28, 29, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(29, 30, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(30, 31, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(31, 32, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(32, 33, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(33, 34, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(34, 35, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(35, 36, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(36, 37, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(37, 38, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(38, 39, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(39, 40, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(40, 41, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(41, 42, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(42, 43, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(43, 44, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(44, 45, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(45, 46, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(46, 47, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(47, 48, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(48, 49, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(49, 50, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(50, 51, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(51, 52, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(52, 53, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(53, 54, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(54, 55, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(55, 56, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(56, 57, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(57, 58, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(58, 59, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(59, 60, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(60, 61, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(61, 62, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(62, 63, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(63, 64, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(64, 65, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(65, 66, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(66, 67, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(67, 68, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(68, 69, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(69, 70, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(70, 71, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(71, 72, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(72, 73, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(73, 74, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(74, 75, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(75, 76, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(76, 77, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(77, 78, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(78, 79, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(79, 80, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(80, 81, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(81, 82, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(82, 83, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(83, 84, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(84, 85, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(85, 86, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(86, 87, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(87, 88, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(88, 89, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(89, 90, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(90, 91, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(91, 92, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(92, 93, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(93, 94, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(94, 95, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(95, 96, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(96, 97, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(97, 98, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(98, 99, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(99, 100, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(100, 101, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(101, 102, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(102, 103, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(103, 104, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(104, 105, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(105, 106, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(106, 107, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(107, 108, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(108, 109, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(109, 110, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(110, 111, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(111, 112, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(112, 113, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(113, 114, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(114, 115, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(115, 116, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(116, 117, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(117, 118, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(118, 119, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(119, 120, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(120, 121, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(121, 122, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(122, 123, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(123, 124, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(124, 125, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(125, 126, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(126, 127, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(127, 128, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(128, 129, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(129, 130, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(130, 131, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(131, 132, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(132, 133, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(133, 134, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(134, 135, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(135, 136, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(136, 137, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(137, 138, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(138, 139, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(139, 140, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(140, 141, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(141, 142, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(142, 143, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(143, 144, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(144, 145, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(145, 146, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(146, 147, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(147, 148, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(148, 149, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(149, 150, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(150, 151, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(151, 152, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(152, 153, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(153, 154, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(154, 155, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(155, 156, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(156, 157, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(157, 158, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(158, 159, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(159, 160, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(160, 161, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(161, 162, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(162, 163, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(163, 164, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(164, 165, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(165, 166, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(166, 167, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(167, 168, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(168, 169, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(169, 170, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(170, 171, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(171, 172, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(172, 173, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(173, 174, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(174, 175, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(175, 176, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(176, 177, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(177, 178, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(178, 179, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(179, 180, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(180, 181, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(181, 182, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(182, 183, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(183, 184, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(184, 185, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(185, 186, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(186, 187, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(187, 188, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(188, 189, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(189, 190, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(190, 191, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(191, 192, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(192, 193, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(193, 194, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(194, 195, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(195, 196, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(196, 197, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(197, 198, '', '0000-00-00', '', '0000-00-00', '0000-00-00'),
(198, 199, '', '0000-00-00', '', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `psb_calonsiswa_kontakdarurat`
--

CREATE TABLE IF NOT EXISTS `psb_calonsiswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `psb_calonsiswa_kontakdarurat`
--

INSERT INTO `psb_calonsiswa_kontakdarurat` (`replid`, `calonsiswa`, `nama`, `hubungan`, `telpon`) VALUES
(24, 25, '', '', ''),
(25, 26, '', '', ''),
(26, 27, '', '', ''),
(27, 28, '', '', ''),
(28, 29, '', '', ''),
(29, 30, '', '', ''),
(30, 31, '', '', ''),
(31, 32, '', '', ''),
(32, 33, '', '', ''),
(33, 34, '', '', ''),
(34, 35, '', '', ''),
(35, 36, '', '', ''),
(36, 37, '', '', ''),
(37, 38, '', '', ''),
(38, 39, '', '', ''),
(39, 40, '', '', ''),
(40, 41, '', '', ''),
(41, 42, '', '', ''),
(42, 43, '', '', ''),
(43, 44, '', '', ''),
(44, 45, '', '', ''),
(45, 46, '', '', ''),
(46, 47, '', '', ''),
(47, 48, '', '', ''),
(48, 49, '', '', ''),
(49, 50, '', '', ''),
(50, 51, '', '', ''),
(51, 52, '', '', ''),
(52, 53, '', '', ''),
(53, 54, '', '', ''),
(54, 55, '', '', ''),
(55, 56, '', '', ''),
(56, 57, '', '', ''),
(57, 58, '', '', ''),
(58, 59, '', '', ''),
(59, 60, '', '', ''),
(60, 61, '', '', ''),
(61, 62, '', '', ''),
(62, 63, '', '', ''),
(63, 64, '', '', ''),
(64, 65, '', '', ''),
(65, 66, '', '', ''),
(66, 67, '', '', ''),
(67, 68, '', '', ''),
(68, 69, '', '', ''),
(69, 70, '', '', ''),
(70, 71, '', '', ''),
(71, 72, '', '', ''),
(72, 73, '', '', ''),
(73, 74, '', '', ''),
(74, 75, '', '', ''),
(75, 76, '', '', ''),
(76, 77, '', '', ''),
(77, 78, '', '', ''),
(78, 79, '', '', ''),
(79, 80, '', '', ''),
(80, 81, '', '', ''),
(81, 82, '', '', ''),
(82, 83, '', '', ''),
(83, 84, '', '', ''),
(84, 85, '', '', ''),
(85, 86, '', '', ''),
(86, 87, '', '', ''),
(87, 88, '', '', ''),
(88, 89, '', '', ''),
(89, 90, '', '', ''),
(90, 91, '', '', ''),
(91, 92, '', '', ''),
(92, 93, '', '', ''),
(93, 94, '', '', ''),
(94, 95, '', '', ''),
(95, 96, '', '', ''),
(96, 97, '', '', ''),
(97, 98, '', '', ''),
(98, 99, '', '', ''),
(99, 100, '', '', ''),
(100, 101, '', '', ''),
(101, 102, '', '', ''),
(102, 103, '', '', ''),
(103, 104, '', '', ''),
(104, 105, '', '', ''),
(105, 106, '', '', ''),
(106, 107, '', '', ''),
(107, 108, '', '', ''),
(108, 109, '', '', ''),
(109, 110, '', '', ''),
(110, 111, '', '', ''),
(111, 112, '', '', ''),
(112, 113, '', '', ''),
(113, 114, '', '', ''),
(114, 115, '', '', ''),
(115, 116, '', '', ''),
(116, 117, '', '', ''),
(117, 118, '', '', ''),
(118, 119, '', '', ''),
(119, 120, '', '', ''),
(120, 121, '', '', ''),
(121, 122, '', '', ''),
(122, 123, '', '', ''),
(123, 124, '', '', ''),
(124, 125, '', '', ''),
(125, 126, '', '', ''),
(126, 127, '', '', ''),
(127, 128, '', '', ''),
(128, 129, '', '', ''),
(129, 130, '', '', ''),
(130, 131, '', '', ''),
(131, 132, '', '', ''),
(132, 133, '', '', ''),
(133, 134, '', '', ''),
(134, 135, '', '', ''),
(135, 136, '', '', ''),
(136, 137, '', '', ''),
(137, 138, '', '', ''),
(138, 139, '', '', ''),
(139, 140, '', '', ''),
(140, 141, '', '', ''),
(141, 142, '', '', ''),
(142, 143, '', '', ''),
(143, 144, '', '', ''),
(144, 145, '', '', ''),
(145, 146, '', '', ''),
(146, 147, '', '', ''),
(147, 148, '', '', ''),
(148, 149, '', '', ''),
(149, 150, '', '', ''),
(150, 151, '', '', ''),
(151, 152, '', '', ''),
(152, 153, '', '', ''),
(153, 154, '', '', ''),
(154, 155, '', '', ''),
(155, 156, '', '', ''),
(156, 157, '', '', ''),
(157, 158, '', '', ''),
(158, 159, '', '', ''),
(159, 160, '', '', ''),
(160, 161, '', '', ''),
(161, 162, '', '', ''),
(162, 163, '', '', ''),
(163, 164, '', '', ''),
(164, 165, '', '', ''),
(165, 166, '', '', ''),
(166, 167, '', '', ''),
(167, 168, '', '', ''),
(168, 169, '', '', ''),
(169, 170, '', '', ''),
(170, 171, '', '', ''),
(171, 172, '', '', ''),
(172, 173, '', '', ''),
(173, 174, '', '', ''),
(174, 175, '', '', ''),
(175, 176, '', '', ''),
(176, 177, '', '', ''),
(177, 178, '', '', ''),
(178, 179, '', '', ''),
(179, 180, '', '', ''),
(180, 181, '', '', ''),
(181, 182, '', '', ''),
(182, 183, '', '', ''),
(183, 184, '', '', ''),
(184, 185, '', '', ''),
(185, 186, '', '', ''),
(186, 187, '', '', ''),
(187, 188, '', '', ''),
(188, 189, '', '', ''),
(189, 190, '', '', ''),
(190, 191, '', '', ''),
(191, 192, '', '', ''),
(192, 193, '', '', ''),
(193, 194, '', '', ''),
(194, 195, '', '', ''),
(195, 196, '', '', ''),
(196, 197, '', '', ''),
(197, 198, '', '', ''),
(198, 199, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `psb_calonsiswa_saudara`
--

CREATE TABLE IF NOT EXISTS `psb_calonsiswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `idsaudara` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `psb_calonsiswa_syarat`
--

CREATE TABLE IF NOT EXISTS `psb_calonsiswa_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `syarat` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `psb_disctunai`
--

CREATE TABLE IF NOT EXISTS `psb_disctunai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT '',
  `nilai` decimal(10,0) unsigned NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`,`nilai`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `psb_disctunai`
--

INSERT INTO `psb_disctunai` (`replid`, `nama`, `nilai`, `keterangan`) VALUES
(1, 'diskon xxx', '10', 'diskon untuk xx'),
(7, '', '15', 'prestasi'),
(8, '', '5', 'saudara');

-- --------------------------------------------------------

--
-- Table structure for table `psb_golongan`
--

CREATE TABLE IF NOT EXISTS `psb_golongan` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned DEFAULT '1',
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `psb_golongan`
--

INSERT INTO `psb_golongan` (`replid`, `golongan`, `keterangan`, `urut`) VALUES
(1, 'Anak Guru &amp;amp; Staf', 'Anak Guru &amp;amp; Staf', 1),
(2, 'Jalur Prestasi', 'Akademik, sports, musik', 1),
(3, 'Umum', 'Masyarakat umum', 1);

-- --------------------------------------------------------

--
-- Table structure for table `psb_kelompok`
--

CREATE TABLE IF NOT EXISTS `psb_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(255) DEFAULT NULL,
  `tahunajaran` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `psb_kelompok`
--

INSERT INTO `psb_kelompok` (`replid`, `kelompok`, `departemen`, `tahunajaran`, `tglmulai`, `tglselesai`, `keterangan`, `ts`) VALUES
(1, 'Gelombang 1', '1', 1, '2015-06-01', '2014-10-31', 'oke ', '2015-06-04 01:42:44'),
(2, 'Gelombang 2', '1', 1, '2014-11-01', '2015-02-28', 'gel kedua', '2015-06-04 01:43:24'),
(3, 'Gelombang 3', '1', 1, '2015-03-01', '2015-06-30', '', '2015-06-04 01:44:10'),
(4, 'Gelombang 1', '1', 1, '2014-06-10', '2015-06-01', '', '2015-06-29 22:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `psb_kondisisiswa`
--

CREATE TABLE IF NOT EXISTS `psb_kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `psb_kriteria`
--

CREATE TABLE IF NOT EXISTS `psb_kriteria` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `psb_kriteria`
--

INSERT INTO `psb_kriteria` (`replid`, `kriteria`, `keterangan`, `urut`) VALUES
(1, 'Toddler', 'Usia 1 - 2 Tahun', 1),
(2, 'Playgroup 1', 'Usia 2-3 Tahun', 1),
(3, 'Kindergarten 1', 'Usia 4-5 Tahun', 1),
(4, 'Primary', 'Usia 6 Tahun', 1),
(5, 'Playgroup 2', 'Usia 3-4 tahun', 1),
(6, 'Kindergarten 2', 'Usia 5-6 tahun', 1);

-- --------------------------------------------------------

--
-- Table structure for table `psb_photo`
--

CREATE TABLE IF NOT EXISTS `psb_photo` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `psb_proses`
--

CREATE TABLE IF NOT EXISTS `psb_proses` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodeawalan` varchar(10) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `departemen` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tahunajaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `psb_proses`
--

INSERT INTO `psb_proses` (`replid`, `kodeawalan`, `angkatan`, `departemen`, `aktif`, `keterangan`, `ts`, `tahunajaran`) VALUES
(1, 'PMB2015', 1, 1, '1', '', '2015-06-04 01:40:57', NULL),
(2, 'PMB2014', 17, 1, '0', 'ok', '2015-06-29 22:54:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `psb_setbiaya`
--

CREATE TABLE IF NOT EXISTS `psb_setbiaya` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuition` decimal(10,0) NOT NULL DEFAULT '0',
  `registration` decimal(10,0) NOT NULL DEFAULT '0',
  `material` decimal(10,0) NOT NULL,
  `ting` int(10) unsigned NOT NULL DEFAULT '0',
  `gol` int(10) unsigned NOT NULL DEFAULT '0',
  `kel` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `psb_setbiaya`
--

INSERT INTO `psb_setbiaya` (`replid`, `tuition`, `registration`, `material`, `ting`, `gol`, `kel`) VALUES
(1, '0', '0', '0', 1, 1, 1),
(2, '0', '0', '0', 1, 2, 1),
(3, '557000', '1700000', '738000', 1, 3, 1),
(4, '0', '0', '0', 2, 1, 1),
(5, '0', '0', '0', 2, 2, 1),
(6, '768000', '9440000', '1322000', 2, 3, 1),
(7, '0', '0', '0', 3, 1, 1),
(8, '0', '0', '0', 3, 2, 1),
(9, '971000', '11060000', '1989000', 3, 3, 1),
(10, '0', '0', '0', 4, 1, 1),
(11, '0', '0', '0', 4, 2, 1),
(12, '1286000', '15200000', '2510000', 4, 3, 1),
(13, '4500000', '15000000', '2500000', 1, 1, 2),
(14, '800000', '35000000', '7000000', 1, 2, 2),
(15, '7000000', '6000000', '8000000', 1, 3, 2),
(16, '2500000', '5500000', '1500000', 2, 1, 2),
(17, '15000000', '25000000', '3500000', 2, 2, 2),
(18, '15000000', '25000000', '5500000', 2, 3, 2),
(19, '1500000', '3500000', '1700000', 3, 1, 2),
(20, '0', '0', '0', 3, 2, 2),
(21, '0', '0', '0', 3, 3, 2),
(22, '0', '0', '0', 4, 1, 2),
(23, '0', '0', '0', 4, 2, 2),
(24, '0', '0', '0', 4, 3, 2),
(25, '1000000', '15000000', '500000', 1, 1, 3),
(26, '1000000', '10000000', '500000', 1, 2, 3),
(27, '1000000', '20000000', '500000', 1, 3, 3),
(28, '8000000', '85000000', '90000', 2, 1, 3),
(29, '7000000', '0', '0', 2, 2, 3),
(30, '0', '0', '0', 2, 3, 3),
(31, '0', '0', '0', 3, 1, 3),
(32, '0', '0', '0', 3, 2, 3),
(33, '0', '0', '0', 3, 3, 3),
(34, '0', '0', '0', 4, 1, 3),
(35, '0', '0', '0', 4, 2, 3),
(36, '0', '0', '0', 4, 3, 3),
(37, '0', '0', '0', 1, 1, 4),
(38, '2000000', '45000000', '5500000', 1, 2, 4),
(39, '0', '0', '0', 1, 3, 4),
(40, '0', '0', '0', 2, 1, 4),
(41, '0', '0', '0', 2, 2, 4),
(42, '0', '0', '0', 2, 3, 4),
(43, '0', '0', '0', 3, 1, 4),
(44, '0', '0', '0', 3, 2, 4),
(45, '0', '0', '0', 3, 3, 4),
(46, '0', '0', '0', 4, 1, 4),
(47, '0', '0', '0', 4, 2, 4),
(48, '0', '0', '0', 4, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `psb_statussiswa`
--

CREATE TABLE IF NOT EXISTS `psb_statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `psb_syarat`
--

CREATE TABLE IF NOT EXISTS `psb_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `syarat` varchar(100) NOT NULL,
  `wajib` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `psb_tmp`
--

CREATE TABLE IF NOT EXISTS `psb_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `psb_tmp_saudara`
--

CREATE TABLE IF NOT EXISTS `psb_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pus_bahasa`
--

CREATE TABLE IF NOT EXISTS `pus_bahasa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pus_bahasa`
--

INSERT INTO `pus_bahasa` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(1, 'INA', 'Indonesia', ''),
(2, 'EN', 'English', '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_buku`
--

CREATE TABLE IF NOT EXISTS `pus_buku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katalog` int(10) unsigned NOT NULL,
  `idbuku` varchar(50) NOT NULL,
  `barkode` varchar(50) NOT NULL,
  `urut` int(11) NOT NULL DEFAULT '0',
  `callnumber` varchar(50) NOT NULL,
  `tingkatbuku` int(10) unsigned NOT NULL,
  `lokasi` int(10) unsigned NOT NULL DEFAULT '0',
  `sumber` tinyint(4) NOT NULL DEFAULT '0',
  `harga` decimal(10,2) NOT NULL DEFAULT '0.00',
  `satuan` varchar(4) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `tahun` year(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pus_buku`
--

INSERT INTO `pus_buku` (`replid`, `katalog`, `idbuku`, `barkode`, `urut`, `callnumber`, `tingkatbuku`, `lokasi`, `sumber`, `harga`, `satuan`, `tanggal`, `status`, `tahun`) VALUES
(8, 6, '0005/B/SIADU/2015', '0101201500005', 5, '001 Rio t', 1, 1, 0, '0.00', 'IDR', '2015-07-10', 1, 2015),
(3, 2, '0002/B/SIADU/2015', '0101201500002', 2, '001 Lew t', 1, 1, 0, '0.00', 'IDR', '2015-06-03', 1, 2015),
(4, 3, '0003/B/SIADU/2015', '0101201500003', 3, '001 Bla r', 1, 1, 0, '0.00', 'IDR', '2015-06-03', 1, 2015),
(7, 6, '0004/B/SIADU/2015', '0101201500004', 4, '001 Rio t', 1, 1, 0, '0.00', 'IDR', '2015-07-10', 1, 2015);

-- --------------------------------------------------------

--
-- Table structure for table `pus_detail_setting`
--

CREATE TABLE IF NOT EXISTS `pus_detail_setting` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` int(11) NOT NULL DEFAULT '0',
  `nilai` varchar(200) NOT NULL,
  `nilai2` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  `isEdit` int(1) NOT NULL DEFAULT '0',
  `isActive` int(1) NOT NULL DEFAULT '1',
  `urut` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `pus_detail_setting`
--

INSERT INTO `pus_detail_setting` (`replid`, `kunci`, `nilai`, `nilai2`, `keterangan`, `isEdit`, `isActive`, `urut`) VALUES
(1, 1, 'nomorauto', '4', 'Nomor otomatis (incremental). Panjang digit maksimal 5 karakter dengan penambahan angka 0 di depan. Jika panjang digit tidak diberikan atau 0 maka panjang digit sesuai angka asli tanpa penambahan angka 0 di depan.\r\nContoh:\r\n[nomorauto.5] untuk nomor otomatis dengan panjang digit lima karakter.[nomorauto] untuk nomor otomatis dengan panjang digit sesuai angka asli.', 1, 1, 1),
(2, 1, 'sumber', '', 'Sumber itemSumber dari pembelian berkode B.\r\nSumber dari hibah/pemberian berkode H.', 0, 1, 2),
(3, 1, 'sistem', 'SISTER', 'Sumber itemSumber dari pembelian berkode B.\r\nSumber dari hibah/pemberian berkode H.', 1, 1, 3),
(4, 1, 'tahun', '', 'Tahun ketika buku diterima', 0, 1, 4),
(5, 1, 'tingkatbuku', '', 'Kode lokasi perpustakaan', 0, 1, 5),
(6, 2, 'lokasi', '', 'Kode lokasi.', 0, 1, 1),
(7, 2, 'tingkat', '', 'Kode tingkat koleksi.', 0, 1, 2),
(8, 2, 'tahun', '', 'Tahun.', 0, 1, 3),
(9, 2, 'nomorauto', '5', 'Nomor otomatis (incremental). Panjang digit maksimal 5 karakter dengan penambahan angka 0 di depan. Jika panjang digit tidak diberikan atau 0 maka panjang digit sesuai angka asli tanpa penambahan angka 0 di depan.\r\nContoh:\r\n[nomorauto.5] untuk nomor otomatis dengan panjang digit lima karakter.\r\n[nomorauto] untuk nomor otomatis dengan panjang digit sesuai angka asli.', 1, 1, 4),
(10, 3, 'instansi', 'METTA SCHOOL LIBRARY', 'nama instansi', 1, 1, 1),
(11, 4, 'deskripsi', 'Jl. Puncak Permai Utara, Surabaya 60187', 'deskripsi instansi (lengkap)', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pus_extra`
--

CREATE TABLE IF NOT EXISTS `pus_extra` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pus_jenisbuku`
--

CREATE TABLE IF NOT EXISTS `pus_jenisbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pus_jenisbuku`
--

INSERT INTO `pus_jenisbuku` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(1, 'HC', 'Hard cover', ''),
(2, 'CD R', 'CD R', ''),
(3, 'PB', 'Paperback', ''),
(4, 'DVD', 'DVD', '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_katalog`
--

CREATE TABLE IF NOT EXISTS `pus_katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) NOT NULL,
  `klasifikasi_kode` varchar(10) NOT NULL DEFAULT '',
  `klasifikasi` int(10) unsigned NOT NULL DEFAULT '0',
  `callnumber` varchar(100) NOT NULL,
  `pengarang` int(10) unsigned NOT NULL DEFAULT '0',
  `penerbit` int(10) unsigned NOT NULL DEFAULT '0',
  `isbn` varchar(50) NOT NULL,
  `issn` varchar(50) NOT NULL,
  `penerjemah` varchar(200) NOT NULL,
  `tahunterbit` varchar(4) NOT NULL,
  `editor` varchar(200) NOT NULL,
  `photo` mediumblob NOT NULL,
  `photo2` longtext,
  `kota` varchar(20) NOT NULL,
  `volume` varchar(50) NOT NULL,
  `seri` varchar(100) NOT NULL,
  `edisi` varchar(50) NOT NULL,
  `halaman` int(11) NOT NULL DEFAULT '0',
  `dimensi` varchar(20) NOT NULL,
  `bahasa` int(10) unsigned NOT NULL DEFAULT '0',
  `jenisbuku` int(10) unsigned NOT NULL DEFAULT '0',
  `deskripsi` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pus_katalog`
--

INSERT INTO `pus_katalog` (`replid`, `judul`, `klasifikasi_kode`, `klasifikasi`, `callnumber`, `pengarang`, `penerbit`, `isbn`, `issn`, `penerjemah`, `tahunterbit`, `editor`, `photo`, `photo2`, `kota`, `volume`, `seri`, `edisi`, `halaman`, `dimensi`, `bahasa`, `jenisbuku`, `deskripsi`) VALUES
(2, 'The Cronicle of Narnia The Lion, The Witch`And The Wardrobe', '001', 1, '', 3, 2, '', '', '', '2013', '', 0x2f396a2f34414151536b5a4a5267414241514141415141424141442f2f67413851314a4651565250556a6f675a325174616e426c5a7942324d5334774943683163326c755a79424a536b63670d0a536c4246527942324f4441704c4342786457467361585235494430674d54417743762f6241454d414151454241514542415145424151454241514542415145424151454241514542415145420d0a41514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662f6241454d4241514542415145424151454241514542415145420d0a4151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662f4141424549414d67410d0a69774d4249674143455145444551482f7841416641414142425145424151454241514141414141414141414141514944424155474277674a4367762f784143314541414341514d44416751440d0a42515545424141414158304241674d4142424546456945785151595455574548496e45554d6f47526f51676a5172484246564c523843517a596e4b4343516f574678675a4769556d4a7967700d0a4b6a51314e6a63344f547044524556475230684a536c4e5556565a5857466c615932526c5a6d646f6157707a6448563264336835656f4f456859614869496d4b6b704f556c5a61586d4a6d610d0a6f714f6b7061616e714b6d7173724f3074626133754c6d367773504578636248794d6e4b3074505531646258324e6e6134654c6a354f586d352b6a7036764879382f5431397666342b66722f0d0a7841416641514144415145424151454241514542414141414141414141514944424155474277674a4367762f78414331455141434151494542414d454277554542414142416e6341415149440d0a4551514649544547456b4652423246784579497967516755517047687363454a497a4e53384256696374454b46695130345358784678675a4769596e4b436b714e5459334f446b36513052460d0a526b644953557054564656575631685a576d4e6b5a575a6e61476c7163335231646e64346558714367345346686f6549695971536b3553566c7065596d5a71696f36536c7071656f716171790d0a733753317472653475627243773854467873664979637253303954563174665932647269342b546c3575666f36657279382f5431397666342b66722f3267414d41774541416845444551412f0d0a4150767378737137736f526b6a50544a474d6e6164703577635a7a6b5a4f4d357234322f612b2f61413857664244547642735868434c5452715069652b31474f65363143312b322f5a4c62540d0a6f3752743174414a59346d6c6d6b757346705249416f3442626c66744f4d3754745a666b55344c746c6a31774d4c6b394d5a787878304f44583552663846486278626a7866384a39474f34720d0a44706574583742634535754c3230695277475079735461344c5937595539362f6f54364f58434f573859654c764457545a7a684959334b3534664f38646a4d4e5553634b6c5041354e6a61390d0a4e543931364c45546f746466645732352b5038416a4678466a654875414d327a4c4c63544c4459376e792f44596176475670553559764d4b464b636c5a702f775655576a753033305450432f0d0a4550375a763751626c57732f4769574d5446637062614a6f616746675343686b302b5a6c774d6362324949666b38672b59337637566637516c374a4b6b3378513851716b696c674c646247310d0a5849344a2f774245736f6968366447507a5a484f4d6e7962576e565a504c436b675342695231415548436b3873334f304546526b6e646a4946637537356d6451526b636b735275795766706a0d0a4177636a4b344f434d343477503951636f384950446a4459716e4348436555756e48326c347a77385a573978795637727137394f6a335034517a72784a347a654671785766343958355643550d0a4b386c797079584d6e5a7658527539746d7a3165342b5058786d765864702f695234756650336c54574c3246546e757068654d5a414a36355051634441507a31385a506a4438634e542f73540d0a7772345338632b4950455069587852726d6d364c702f68315069623470384a3635633346394b6f67753766556448316d43384668626f4a4a4c794f534e59456752356d6d3352694e2b7a696a0d0a33375977444a4b386971714b64306b68636c4643647a764a4730454850384f426a487333784d38482f4154396c72344d6144385976326a2f414170714d336a76346a366c4e705867377866380d0a504a6f332b4c48773746746179367834586b30625474597456384c6174704d4e3559576375757a3668647952523332766a5332744e5774376352772f432f5343796e6772677677367a525a520d0a772f772f6738347a536c5677754171797774434477314f6e546336754c756b326f3070716a424b53536c4f744b4e3034325073504154483851385765492b54787a764e3839786553594c45340d0a65706d4e436e5771564869565778464b4377795533464b64536c3961724a78764f446f516b6f745361507a5038496648543971713738532b4f50683770756d6549377a786634416b743762550d0a394a75664731337266684f637378334a2f624776367446724676656168417075724753313133556f3735576d6d4f6c6f73636b744f314c3458667446667445654a49645338642b50394d2b460d0a486857797358686d384f77664567367872646c507055456b3137653276687a544e5367314b53397635676f74357236335733574b534570634e45556b6d39706a6d2b432f7761304c786a38560d0a4e542b49586a337842716e784f316550785665585138465161547138463571317435396a6f7343616a346774496f33736d6c6d695a684155574435496264596f3168506d4869543474364a6f0d0a576a614c7250786e384c614f76694c7842484a503459754c4853627950586233536f72693075394e6975703130386148713555765a79616c62706551324d6a355749695749412f35483537340d0a7a63515a7a677346772f683848517135545171304b475a31634e6861464f726a6378776d4b72566173734a4f464e542b7255614456436235317a74526b336f6d2f774461664266526f38502b0d0a456156585073387a5a3564786a6d644c4535686b5754356c576d7147437954475965717342444e6e4b616a44453475634b474a6975564e533970434d55706370393766424c344d654c7272340d0a652b4339513858654c37652f7458734934626e57745831784c58577454743431614748555246646c354c69346d6b4d635447344d6233633845377449306a4b7a2b302b4b50684e384f7644570d0a6d2f3239725878432f774345653069614d7a70656167397330556472464845743965764c4c6357712b5661796b3779666d4a6b74306a4c7a54787133382f5878462b4e2f6a5434672b4c76420d0a4f706a34735833682f51376e785732703664474c3636305777384936723465617874626657625077377031376632317242626f6b45656e2b56356356355046634971787046634776556632790d0a503275395a2b4a7669623453575769654a343957307a346233656c3669327453575548396d4c7273467a5a6638544f2f74724330737a4d3030756e4c6458466c4f59325249684639676a634a0d0a63584871356e3437654e754e7a58682b6e6c4750796a4a637270344f745157457775563457663154435a645177314c444c4531335458747356576c686163616b354f546335314a58664d322f0d0a35386a34482b456d58596669423576684d797a664e4a31715664596c5a6c57564c45597a4d61746245346834656e476f2f5a3458443038524c3255567970526a42637355724c394178712f680d0a3639686a7664493851616671656e33454b3374766372637832344e684d584d453178464d3653326a7951474f557733516a5a4563622b4d466c3071373076574c52622f53727930314b786d4d0d0a736356355958555631616c726433676d456478424c4a444930637950452b7832434f6a706b63342b567668372b30526f58683734682b45726e34482f4141723054582f6970633652726433720d0a506a57373072563744344e36726458624a4266616c48704776366b7574367244424c6478327478724d6d735736515879326c6c70326d616f4a626153767150777a5a61745936564a4a34676c0d0a303266584e62316e58664647744451394d747446304f4857504647733668723270576d6836565a6757746870567465616a4c42703972486b4c6178784269584c477638415450364c586939780d0a5434767771554d2b344979374c7374795849614e50463851777732456a4c4d4d2f6f31614f486e474e4c324c6349567163616c647077587965692f7a652b6b5a3456354634573469453872340d0a73786d4f782b6235724b7467386c6549727957437969765371346a6d6333563165486d7156434c3572537662336b744e4532343344505656794350765a366c7363456438415a487a64654f640d0a7130316561474d77794d4847394d4d77472f3841646767446365516f79774849794d726b594172506b4148384a444d32474737423456696335475277427a6a414842365a714a6c41414942350d0a775277523934594f636e506f4267345941386367562f5a537732486f4a7547486f725a78554b4e4a4e76546d76616b6d34765274612b522f4c453674537447315372566c665a757055756e710d0a32372b3065376666572b7831526c2b307868694679446e595268636e42593841466765546b446b746a4a5541564461525232743959337978352b7a33734679706a473177385678484b4756690d0a44494438716b357776492b553168704f38525a6432374a424258766c426b6b676b386b6b347a7763353756743273334335507968386873394649544b6a71423930456e627743656736386d4f0d0a775747787544787447705370526461685867326f722f6c376836314f537662574d6e5553747472314d384a69635467735452725172547573525171516c7a5362546a576f793075392f6430620d0a563162727262392b7244566265377462615554676562444733494b7347614e547547526e365a507a422b4f754b757541584a4758427764774f51636745344942347a7742323664713874384b0d0a58497666443268586e412b3061507063374538742b2b73345a574f646f7a6b4d4353446745456e64676d7575337478387a3941506c5a517641413442476366586d7638416e467a4f565442350d0a6e6d57456e4658773250787548613156705966473433447958793968354e587366376859462f5763466771384a7874577765457258582f542f433461745a6431616f762b4166525562664b640d0a754d5a42775655457363344a7a6865446b7351414342676a41417238632f322f4c78727634366544625667416d6e6543594a4e754d727575645531522b777743664b5568324f44386f50796a0d0a46667239754b7351704743427965643247475343443875426b6e6a41342f48386276323262393733343753786d514e46702f68585372654a5859676f5a4675627477764373474c5335497a670d0a6a61446745312f646e304b6376574f385a4a314a576a48416347385459726e6258757572547937424a3675793078456c75724a79617471667a42394a6a4d50715068736b30366a7865665a4a0d0a6834714e377a6e7a347a45526a625737587359374c62587166454f726b4757544368777a455a7753634f4e7973755647656742494f4d63414847526e5277365061325032782f507664586c750d0a5a43316e496867302b307459746d78353551346e755a6271557942595948694555455a5a70784a4b46546b506954385676422f772b654b485774516b756461753541756d65477448674f712b0d0a4939566c6b584351574f6a327a66615752747041755a784261672f4c4a4d484742593048345766485878706f463938525069526466384d7a6643653175725332676e7576436c3734392b4b750d0a74432f614f4b316144773761773356686f7363386b3859563562432b6e675a5a476638416378733766326a34712f53423849764231632f4533464643726d696c376d565a645770596a4756700d0a56464b6e5470536a43704a553235757a35727538625776742f4d2f683134492b4b506978472f442f41413955772b57566f526e4c4d38786856772b466854684b4d6e4b484e425471653747540d0a76464b504b326c4f795a39552f732f6547452b4f2b75613734574465443950313777356f6c35346d7362443465327a65465046386c68593363576a79574f6c2b494c37552f454c61646678610d0a72645733326a58645274645475375259376c394a302b32753068654838752f2b43722f6958346f2b4876464877483044786a34752b4d32766152346567385761746f666854343065434c44520d0a42704a302f774153517070303168346b734e493052666946464e6f386c6a704e357156376252333863576c323933653239704c72666b4a2b78667768314c344b2f7375366234426e317a77720d0a7275676645426644666958546b2f61482b4c58684b38305853467550452f696655622b79307535753948307931302f55727536652f7744375553445672375150733974494e4f74395365326a0d0a6873374c357a2f614b2b4657702f74666545664766677a347436345069333856506762712b75364e34513862654337535451547153664658346632586a5434642b49662b45595855376a54550d0a73726e564e4958772f714f6c36504c635731792b68584678597350745a74442f414a6f2b4c6e30686547754e36654c6f59544e63586a335577324a782b4777314b724f7453792f4b466961470d0a4b78456130373264616a52724f654c6a7970302f5a53336a44582f5162776b384563373455717872314b4f42793135624767716d4c7846476c516e6d576334654657685357466930725272560d0a6f4b4f4573354b64306d3035745038416e722b496637522f6966346f5161545a65493754546b302f53376d43352b7a3654424a59796e7970497053556470726c456e59526c456d614b526f2f0d0a4d6b4f47556c54303276384177352b50507839387a346e65442f677838534e61384b3264705961586f6b756c2b4864613854576161566f3974396a486d366c623666476457757931735a62360d0a2b69677850647463475241654239302f44482f676b4c3436766648767759305478333434305a4c50346e2b4a7454536677396f746c72656d654b4c4c775a345a304f2f3133784672743746340d0a71306e53546f6a774e61324769374c71787552426636335973785a475153667448384a4e5a306e396c6539384966414734734939452b48362b46664676695877713039784e714f703267306e0d0a566243363153777548496b6c754a4a724c554c72784c63694e5846726e554949424a424862562f492f456e475757384e35546c7559634d344b6c6d733639664d7671734530716458443453790d0a7a61705371526a656371556c53684b53556c65556c7a585450366f564469666a334e73797848477566566672744b6c6c5743784478465253784d4b55714e6557564a7839324d4b4c354b69680d0a424b4f38585a585466386c756f65493942314f79307a5250474f6e2b4a74423851364266584e6e4e65616259326966594c4637644c5735304d614666584e68396e5779753764703459566d740d0a3767543375702f6151356b6857446a4e4f38526e5435396662554c4d2b4a55316a54626e54597a7139786577496a6d4977576d715352326c31484a4a65366568576178387961574b4f654e420d0a4b7478435a497050367a5032376632455068562b316638414453372b4b4867474c534e432b4b756961506536316f76696e773942617a61663436733472615337476936384c43525939512b310d0a756f476d6132686d764c47346c4f577562615637592f795957476b58467a72454f68587766543576746a575632397a424a767332686b4d637174454538337a6f3255356a56475a6970514b370d0a4d4662366677393472796e6a6e41316175476a5043597a44316f554d64676137554b6d44713135653054556e5a2b78714f504d7070664374647a34726a5049737934587856436e586c4845590d0a6170546e5577324c704a796a587030345370754d3478625471516870613762756e354c36762f5a49746648336a2b38316e776750467575326d6a6142346476344e424c617463485439416c310d0a6d37744675786236653170664c4e44634a484a4b326e527a61544463756b6a6d3942526c6239693462566261337437554f3067746f496f524b79685866796b574c637758436f65724e7355410d0a4d784334794150472f77426d58396c667850344f3034334877372b476678413851616c72396e597a6170726d7236664234583039594244444e48416b2f6936363850573079655a4f5a4933730d0a5962783967326856496b3833374438566642727874385074426738532f45573938442b4339456d79697a366c34736d7664516d75596f5a727558543748546449304f2b665564544e76424f300d0a4f6e574531784c634e433651757843736639546641627853384576426e68536c6b2b6663655a53754c7336725471356c6c2b447853786361556672465772674b4e4f454b6b4b63612f4a566b0d0a71376a724b584a423335456a2f4e58787838507646377858346f7135726b66427561564f46636e77394b6e6c2b4e7857462b7131616a57486852786c656453644f565357486a5570576f526c0d0a4c6c6a486d6d6c65625a354136664d41414267446a62786e356c7a6e7232354765343659785655425a4f7749444d6f323541342b3767446b676e4a3548555a78774d626575574d46676b39310d0a70563148716b566e66614a627a78704c6243346c737645516d6578314f78695365614b2b74345959576657496f5a6674656c452b546557795368566650634b4747457965546e4f4f5274322b0d0a33555978327a7a3179663753344d343179486a334c4a353577375872346e4255635456776271563645384f3556594a5476434d302b654c6a4b4e7052646e617a64392f3545346f34557a72670d0a7a4d6165565a375270554d5a5577386354474648455571366a54637051744e77643454356c5a786b6b2b71636c666c714c477633736c5341756367345a666c484763636a6366626a506334740d0a774d446c51446a676a4864636b68516552774d67626363396364417874306e7a62634b4779464b735363454435676675344f306a4f51635a35775251704b7353514647534f337a636b3478320d0a4730486b6b45664c774d35483039526373485a4c6d6c467472583358464e3874756d6b585a2b646a35747474612f456d6d746232616b6e303162302b533265682b31587772756a66654150410d0a3977764b763456304a683934444930363256686b6b4e38754f687751527a6e42723076455338454d53414f567867676a494936647364767850552b4f66414f35467a384a50416b724d53446f0d0a6474443875546a374c4a4c6242547a6a4b2b58745076314249475061647050494c41486e676e485050487a44723136443643762b64446a2f41412f314c6a7a6a544279536839563475346f6f0d0a625753564c69444e31474e72394953692f4a4e482b3158422b4971597a6854686245786b30735277316b4e65584b6c4a7556544b4d726266587a763533364876434d7a4c676e4151456a63640d0a784f56586f4f41654d6e4a7a313659504838346e2f425354585069727033787a2b49756f2b47626255592f43576a6545744c754c72556258572f422b697a527a577568693675664a754e53300d0a335664564d592b55736978576431493445566c6449356a6b483948424f454a5972302b376735493478675a35365a3954675937312f4d5a2f77566a38624a6f2b722f457a54347032573538530d0a613534633046444547556d32744e4a737453767554795932466c396d7541675a574d3454473073462f716e36502b5770306646546953706e4f595a4a4468547737786d5978784757316659310d0a385458725a6a51777547774d366e4e48397a6973545577304a4b4c636d34704a6148354a346d593953782f41475277796a425a745069586a664c38756a517a436b7174484455614f4671596e0d0a4659364e4a776c2b39772b47703469635a57736f7433646a7a332f676c4e3843323859664672552f6a5238547446317939316566777a7165742f442f414676553769652b73726b51617550440d0a5775586b306c354863537a5869744f494c4f6157346a7845317930434f71466f2f77426f766a443470384766732f654366483378493853367271476f57756f2b58396a38503678717958466a0d0a6461765062665962445164436776514c65777439536e4b7464622f394574554e3166584d6b4e6e424b30574c2b7864636546376a396d3334525866682b4b43327337623465654862647042450d0a49664a5a6450746d3143496b35436e37616b736c7956646c6b6e6a615269347731666e702b305a344a3854667436654f64586d31665757384266736a66422f564e613077654c6243545069540d0a347436396f716c6645366546684d35734976446c7063577261536d724e484a62537932737430303133436a51325038416c6678546d75622b4a6669586d754b7a6a483432686c6d58593159660d0a48564b7461765771536a684d64566854705965504e556c55786d4f727768795170726d764f704b795558662f414556792f433562774a7756684b5758304d4c7a31384a7a34656c54685370510d0a58316e42305a314a7a355646516f3457457078546c5a4b4b56756c766e4857762b43756e6866777061324877353144776e6f76784b30545474443076772f726c74625730632f6775575731740d0a664a3143474b377631756a724670425046464442396d304f36302b534b4e5a4c62554c6c6474772b6e6f482f414155462b48576d33452f78413848654434374c5439513169333066545044760d0a68723746756a302f516445384b36376f384f71615930746d756c36667076696e777263615a6133457244374234663841454f7669796950326d4b335035332f4348396b763466654e664432720d0a2b4a76457433724670622b496645476f447758702b6d366e413931706e687550556c7374506e76704a4c4b3446316358556c786272484f30666b5357636c6e644d497a63794c4436585a66730d0a482f4333554c58574e52307a786234326d73744a6e7337533967686e30754a76746d71495a4c47304538326b52417953323750644632695a4674344c6c6758645568662b372b46766f6a35310d0a4c4135526e325559584478715a746c316563737678475055635256776d613036754372304d56684b7470553534716e6d464f484a614e6f314b4e3035525676354934692b6b526b554d586d570d0a535a6e6a4d52465a626a7163667264484156353457474b793656504830716c4447553553684f4f486c684a766e30584e5472527661392f3062304839752f7752346d314c78372b30743439300d0a6536384936423458384f614638475044396a59367a48722f41496c66512f4748695456745638592b496247445455695454644f7539533845615034553144566b64594a5037536874493779610d0a6462614e2f7741652f6a2f2b3356385466482f78733076346f2f442f414d582b4b6449736642657379366a34494f72506153334e704e4a434c61346165786a5753776c744c79317a615477760d0a616f6c7a5a6c5972324f513844367038502f73536644617830366376652f45505739507334644d30362b73377a5762537a73316d3169373153344e736a57476e577958566f473061327570480d0a4e784370754c363069654662714a397674612f7368664233773770397a595366447253704946312f56764368754a3131472b754c2f564e4d31794c51486774645575706e6c4e7a657958456d0d0a6f5257367a5730713662426454795277746251777639396b333051385453715a54686378784f555a4d736f7937463546684d426a3636712b7878474d78745846592b55716362714e624756630d0a58536a55715354627078676e6f75552b4f7a4c3653654255637a7832436f5a746e5573317847457a6a4559374c734c374a564d4867384e444434534371565a726d7059574748713159516a460d0a5871546e7272636b2f5a432f344b61664237776e34632b4936664572524e56384658336a573830756150776c385049623639304b33312b3573425a2b4a66454868725262352f374e384e52610d0a3965797272563361515476623231347479717879376f456c356131385266736a2b4c66482b6f654a5950324f506a62346b467a71747a4c48722b733374335a32637a77335a4d6b37437a635a0d0a6c59596369655736756d6b426865534e567a46332f77415076675a384a6643453832703646345338502b4857754e5574724f5455396338755837484774746453324e334864586b6d6f5357460d0a6b317a594c466379675153323839316158643254474a4a5950634c4c54727837692f30353750374a653662396a45304575544a76764c793874776b615249795465585a3238563743305479780d0a33666e2b5662376b437a796655384e6651673447792f475a746d4f66386556736e782b5a797730612b4379666e63595533515477396163314c6c616e52554b6b5a4a755356534f3762532b560d0a346b2b6c39786e69714f42776e446e41367a6642345a59696450485a7536616c556e43724b4f4a68476d2b5a71564f767a55584632693555354a50537837526f5878372b4366686a773350660d0a616638414158784d307a526f747234637455763769374d3773456a68754a4e5a6b30717a744c62474a4c69534b5335696a554d4e724241446979667444654676452b6e2b49724478722b7a370d0a3465384a32647670695847673674593658612f454c55726d38655672653630653373624748543737523777327371533257757250505a7876484a3971745656593162794b3361613874622b520d0a374e6f5673744b74395544764e4556646272784a346430434b444d525a747970726a33636d5638754d3261524b306e327062694d3143322b7a61706f656b4e64364e614857394d625545764e0d0a5131487959494a6d74726c6c67756b697462696131686c6e68533268764c6e793450336a54334b3238416a6c62366866515638414d6f654b7a4846385538535663332b75557350683861366a0d0a6e5777754c6868714f5a7570474471314a536a4c44314b636b3757546c79364f3650694b6e30787648624f4a5962433454686a682b6e6c6e315357497259586c554b646641314d5655792f6b0d0a6e4e553661682f74464f716d74374b36736c72354c34593150783572657253584f746548644b38476545624f7769747445304753356b3172786865334a68736d6c3162784c724d56354a70550d0a636e6d5233535157476e577347785a79626e35346f6966525855376746487a59626154675979647779526e41474f435431423535465947726549426f74386c6e714173726646374e6254534c0d0a71566c4e436a707145646d45676e742f4f6876666b6b457979327269326b436b787a4d683878622b6a616a4c712b6b32577053576a5752753061595730726c7042437a4879474c655847534a0d0a6f776b7744527153484842504e6636462b467544345834527948416344635059764734324f5859465a6a55784f4d6f714e577444477a6f7a565370556853703032334b72546a4743357052680d0a46326374542b4966456248635238533578692b4d4d39774f4377483137475379324748776452657970564d4643764832636163717453724c6c564f6271315a63716e4f313478546969366f620d0a637779537531733973484979443355594f5550484f4f76576f74704b714d727444625438324d35366e6e676745644d676e4a35354f627978756a4d575063484a4a7951547541494f303862630d0a59357a7763647167326a6c5474346b4a77526e4942366e414a34494f376a766a6738562b6b31366a6c46387572536162737271393476766f6d302b75793648353347617533644f334c7473390d0a477676312b58552f576e396d53346166344f6545523937374d4e5667335a4a2f31657233726f6f485546565a65354f4d34414666517043743877575835756546794f6553527a304a354874580d0a79392b795a4d626e3453326145383265756131434143534d47534f3435553534323341495837754d416a4c48503151417741416b4f414d44424f414230413537644b2f35372f4843697344340d0a78654a65467334716e787278484f4b756c70587a46346c4f7a377245786b764a37626e2b787668586a4a5972777a3443784d5a2b395068504a497531332f4477616f39482f774251367632610d0a745a624c334a79436a456c686746634842556465526a474363413842547867486b412f78352f384142512f3467325078482b5033692b4b2b3054576b3847654866462f6953793055624869310d0a4c783771316d2b6e614c664e6f73516a6c6b6830757a754c4b533168767475626769366451736f6a6a582b774335756f6f62536561346352517777537a7a754f504c6a5253306a64434474580d0a4a795152783667672f77417476784d764e4a316e34772f4666346a65476243322b4b487846307a346b654a74492b46476b58566c70756e2f4141762b446569515855396e706d72654c7452620d0a554c342b4b3962302b4e706458587768704e6a41386d76586c35714f767833416d7455742f757547637a347757556352634b634b5a646a4d777163593038426c6d595573445171566174656a0d0a674b2f39715958434f70434c56476e587830714e61724a744a30734c716d74753674672b47566d475538533853347643594c2f56535749786d4172597574436c436a56782b476c674b324c550d0a5a7a69366b36654564576c545355725378476c6d542b472f475837526d6d664454776434433166557250345865444c6a77625a365670337755384650425936316265453959744774375478420d0a38582f6942714f6e3639724868613376625365572b6b3054777270372b4d74513070626935697339507570594a5a75372b4c5077662b4e33777a31474834572f47335656302f7737703968430d0a6e6776774638506d7574462b4432712b43346f5573394f6d306d35747673326f654e39506a745a426261744872557345615831334d4e58384f32383130737433786e682f54353946307555360d0a6c717439346938515872334772654b504532717969545566456575336b537466367671443442557975676a7472564e734e68597832326d32695132747262784a393036373866744a3851654d0d0a2f694a384550326a6a6638416962345057766a57393050776e34737334495a504733774b316a773562572f686d4478443456756f72563539533044645a797234693043654855586b696b765a0d0a496254553761652f304b2f2f414b64344a2b6933773534545a72775878446e33446545347a7a334735526d6e456e46755665786a55772b417259544635664b6466445531422f57712b412f740d0a574d473563796e4f6e5761556b66683346583067633238553872347a79544b732b72634b3554674d33797249654638316452303534333631686366474e4b76506d69735054787a7935754c540d0a556f527155724f4d745434512f7354516a714e69645567314b3330694e375a627074436d4c336d6e57396e4c615043326d614e4a714f6b36626476622f5a316c69744831485455337878465a0d0a30336c6833766a587766702f776d2b495878492b48486776556a722b67365a4c6f756c6174727572574531733369485766374f3050784846714674706831625562697969306d4f35737247790d0a3149617646657a794a716c70633268306d2b754c612b366a34772f4354784e3847745a68306e585a4c445850442b7636644c7250674434686141365866684c34672b485a4959726933316a510d0a4c794f61356757355731754c5a3955305237716135303253574f5347612f306d36303356622b4c78746144552f6a503854724a727931302b4666694472396e66616c7164776957476c5747670d0a775257656f367271463077486b3664704f6e61586358392f4f7750326579744a6e3237593974663139374c672f4d2b4c636a7a6e4c4d54516a6b4f4d3457346b7a6e4830714368532b71346e0d0a4a616d534c443031434d6b38505570564b334e4f6b6f516674714e474d453034332f6c2b6458692f4b2b464d3979504d634c586e6e6d46346a34667962415636765057654c705a33444e35560d0a70777153556f346946576c525549566e4f5671566173366e764a746368652b4666467165484e443853366c5a366a592b4550464f747a614870327032746c5978614a714869667768707339370d0a4a615a76557637786452476d2b4a4c32345178795257742f4659585349486652376d4b4c6f2f446e6854785638522f46756e2b43394e315455745338522b4d3733574c6177686b6c305853620d0a4f3631485774526938515861506678324e685a32647850714e696c317070755a345568764959594e4b614b663750435059666831595166454c5350696e38493450694e3459316b2b4c724b500d0a7846384576446c765034725a644f38662f444f535734384561626f4c617434623037534c47382b494868615478506f506a4f352b30576b32723672346a653474626472675157395a66374c560d0a3344662f4142342b444e3467637833586a58514a31444b7979702b3953646f35596a686f3369473479524f415179736a444f34563432417a584b4d2b794878417a44455a56516f5a376b47480d0a786e4575577646786b366d49796e455946597642564b716e464f6461453844504359707066757131576e4674534f7a4e736f7a6e49633838503844684d35784e6649632f725950686a4d34340d0a5370434e4c445a7451786977754d70556e4279554b4d36654e574c7730584a653270555a75316e6465614c34447676464670347431725339596a3855516546624c553963385370706d7257680d0a76744e3065304d396e726e696544534c714779757462306a5468637979616a346930577a31693330754734572f756279326863585461766854776834703862617975682b475a4e63316658720d0a5051313144526447733955756a666174592b464a726a57313076777a4358623754714f6b32343144574c4c527261573275727532677559744a69764a346f374d3942344e7449492f687238510d0a2f4666776a316a564e523852614a6f586948513961303778446f746e7057723654384a6647576c366e345938552f464451744f306e582f4556767236615059366f624739735a4c71306277710d0a327157666972574c53393032775730752b65384961357150686137764e61384e366c65364e716569654276695a66614c712b6e586b747271576e58746a384c2f4142684a5961685a586b62430d0a5733756261514a6357397972457876454a4649794b3563767839504d75472b4e637857467936726a6548386834667a6a43564b31443265497131336c46484d6356674b744b63597a6e6849780d0a71307350517270546734754d553034575535726c39624b2b4a65423873574e7a476867732f77434a4f494d6d784e476869506130615744686e64544c634e6a366461446349347572555666450d0a316144635a71555a5361664e63354f6179574b4757377432315753526f58744a49594e5275347048747674396a6654325a7435626d474a42486636625a7a50424949796b396a41482f6551720d0a697872756a3265686172704f6b6d2b756458744738503841687a585a6451744e5531786f4e4a74504646704e644c5a474c55445a332f384161476d6164657a4855344c5741787847376b744c0d0a6165346d4e78476e767364786166744152524f306c686f6e78386b6854637a2f4147545350447678356449694435374b747070666876347653416649342b79364c34396457566c734e586b330d0a782b49654b374c55644c313638734e543036393072555966432f68364f38303756624f66547454744a55677637566f4c7579764669754c6156526245464a6f305a51526c56555a723134592f0d0a415a316e57525a585877454d6f7a6a324f66777a7a4c4b314b64535372344c6835347241356a68716b2f64713465704b4e4f6e476f6e64553452707432332b656545782b53354c6e2b6130730d0a64557a6e4a6f346a49336b6d5a3071796776712b50346a574578755859716e4263314c45557163716c565533486c6457704b707970366c2f34682b41312b4848784738572f4452353750565a0d0a66424d6d6c57643572576e43574b78754e55316e524e4f385279322b6e4a64527265545232316872576e69367672685947754e526b76596b6a6b6a67453832706f5877383148784e345238630d0a654a4e4d3154536f64523848614c632b4a6250776e6379467645486a485164416e3079587835662b484c654f56586d486758516458302f577458486b54764a4664576c7462787338727951390d0a6e2b304e615874332b306e385762657a676b753733574e582b48456c6a5a78454757357574562b456677314e766252626945616165615a5934674758655a5647636a4e5933675034672b43660d0a43667847384866455877356f2f6a6a784176673633307a523753376a317277747066682f784c706c6a50714938557a3658624e702b71336a654750486c78712f6943564a4e534a314f38384e0d0a616e706c6c6469305731744c537a3533786a6e636644336847746b4e47474c34737a764b343578695a3457685435364f58356269613835304b697078636f3063565877324779716a7a7457560d0a53724e36786258577544386b6e3469635930732b72537758435752356e2f5a4f4768694d545669712b5a5a6e68634b6f5671637173755756576853784f4b7a6576374f4c54396e53676b6b370d0a5079517435696c34384e47366f79754343434f636e413344424849494f5054414e516950494446736c53435344673873654d3541394e33494142366d76562f696e3441303777483432754c480d0a7732576c2b482f696e5362443467664379376c444d5a66416669677958566c7063374575427150684f2f6a3144776c71554c797663704c6f385631632b573137477038316b745337466a49710d0a7031565659715175357575416344504935366b6a423446667458442f414242672b4a6367774f643447584c537875486a566e53356b366d4778436a4b474a7774614e334b465444346d6e586f0d0a7a556b705870786c5a7153507866694c4a4d58777a6e6d5935466a5534314d42695a306f567556386d4b7737616c68635453646c7a5538546836754872526357342f764774343250306c2f590d0a306e45337732316d41456636503470753277434f664e73624674704c45675949626e4241446463626858324a354d7041494f515143447548635a374874302f446e6d766954396970322f34520d0a76786a625978356574324e795166573473664c33486a417a396e553848473044355431483345694d36717769414248546e6a484863453976556a303478582b4633306d634c4c4365504869580d0a5474464b726e306359727037597a4c63717239453957334a767a767166367365424f4b6a57384965424b737456484a5668393233664459334d635061366a4a32537032317462546535364c720d0a4678474e4d3142517777396e636f5662474372784d75316953514f47415a686e4135554841422f6e543858547753367872553171734d635635725771584f79435062476f7564517572686e5a0d0a6b43376d63746d5669433868473569584f612f667a7856715832447733713138386979665a374b35757634565255675573792f4d78445941596b6b674847334730562f50447139344738764c0d0a444d684572376d47386269546b6a35572b5973573448335377795477503942506f575a5a684b6643504847645638505371567063523552684b47497155616371744746444a713153764368550d0a6c435571616e37654850794f4e306b704838312f536b7874654f64634c355a54784e654e4235526d4e6245304b6453636156575563665268526c556a4753552b574e4f584c7a7039576958520d0a624b77314c56394f306e564e66384f2b4737585537714b336d3166785072656e6146704e6e4137517263584631663670506257365277524f387278724c4e6353425757434353566b52726e780d0a56315452626e34726646475453504550687678505a617a385266486e696a544e56384b363370666948544c72516465385836767175693348327a536271376974705a644f7662565a624b37610d0a4339696c6a6c563446455a592b6461787238476b32384d303856376366615a6d686967734c4b57376c5972424e634f3231442b356957474274377534556b426553655050376e346c615848630d0a4b45307278425046504c4a444464445442485a5454726570703757304e314e634a464a4e4a644d593431566957387553516e5975542f52476435316c5755386134584f4d797a7a43344f6a680d0a4d697847587a7746616c556b3367637a78655779725969552b567755586a4b65416f38306e79786a566a43667870532f494f48386a7a6a4f7543635a6c75565a4269386250473539517863630d0a665378464f4638666c5742783871464b4e4e79553234344b4f593131474e7053644b565350753035535832333848766a646f33683351626e345066476e52702f486e3750757661676c37506f0d0a384a755234692b476d74764e4b353862664436397457476f57556b636c785050726d686165366e55466e764c7a53304e35633676706e6962775834712f456a527276582f41493861687074680d0a59587568655038413471654a702f4350693639316a56644c6a742f44672b4973327457545336515044317931395965493758536247336d6c6d763841546a506f31314e5a6772427145367a2b0d0a5661723851494e4c7539517347306a565a5459327258747a637844546d743074413049567730756f78544e754d6a4b4173586d376f70474b6856526e762b48664569654a49395156744831440d0a5378706873675266697a4a6b4e316243354352765a586c374675534b534979787534614d537148554531387250687667584f654a73326a77356e36776561592f4b3833776a796d6a7a66556f0d0a59326a6d5647654c7863594a4f6e476850465a47364f4b70776879546e526b6d6e72452b736f353978336b7644655456654a75487034724a63426d755634332b3173537161787454413138740d0a6c444359626e6c4f4e52312f716d6430363245717a6271553664614d726539476f646a483852726a3464366834573858525738317266365434683048572f442f414e707339566a463771476b0d0a61685a3672627061437a6861396e496b746f3552396a6a6c62614e7a4c734c4776542f446e786438562b472f6a572f786a30507776344c73486b385361703477673849475058702f44396e720d0a2b737958567a647a57654e537339516a735676723636314348544263684c61366c56497055736f49375376434c6c6c627842384f494755464c5434636170504845546c56463171506874564b0d0a455941486c786c4e796a4f306c6541787a32736378444b5779564c4841334537646f795279657a414139796345676e723833344b5976452b4e5042654b342b34736a68384869736669754c4f0d0a436f59504a6c484330616d54354478466d6555566c69505a7770787253783958424f7647385a4f454a637161546354362f77436b7277396c6e674e34683050446667657469386267637279720d0a676a6a6d726a6337663175764850754a2b454d6d346867734e477056714f682f5a74504d6f596453556c37535557334736356e762b437646486972774672396e346d384d366c61364271756a0d0a58386c333466545437576157333032316d6a6c74726e53727550564c692b4772365864576c314e707433596167737356397030736c72646d5a6e4d67304c667848724d666944576461734e450d0a384157646872476b612f6f3765466f39423854763463303248784a6f2b6f364a72456d6b775034352f744b7845326e36746552324e694e546b3037536a356632433268534333534c7a2b34740d0a724750566b315237614f6535476e6174457775524a505a795132326b616866772b5a6153753174356b567844484a484d734b5341426b6151784d56504f654837714c777a34427437323069610d0a5735476772723930776c64703732386c6874756b73706d565a39513147367472595a5437506269344d71512b56417352797a58697268624a754a2f4544682f504d6f7134504b7541754175470d0a38626a637a7034742b327a724b2b49385858797249737271556b375673525046594e594b6e7a52356f717051702b3875574c38764a504437692f694c67767775347134647a796a6a383838540d0a50456a6a444a38757957726759657979504d2b454d44684d3534697a6a327a643850687165417839544d4b6b6f53744c32474a714e51626e4a656b3238375739684862366c65777a544938670d0a467a7357796a4779566d683874476e6b324e6249466a6a6c2b30504b476a53587a504d49596450727576654a50487572586e6962784e34733144784c7274337075683655645a763173376d370d0a476e654737435054744f69764a6f3441645375446278734c7139767674462f65354c335538302b5a583867736642466a4c46446565494a626e584e556c56477537756138766f34456e5a55610d0a534f30746c6e32573174437a624c635a6b754e6f5133453038784d6a64445a61486232467a436d6e3355397048647a7857746e656d616165373071396e63513263336e544d302b6f616131300d0a59347451307a554a4a3450496b3836304e73386246766f2b4a4f49633634657746486a624e7543714f4a792f497372722f58616d4672382b655a646b746241716a6d4e615670796e586e68730d0a41353161304a516e62325657796a797533782f42764366446e462b633176447a4a4f507132457a6669584f6350527970597643716c772f6d6645464447796e6c6548536c46553850547875590d0a65796f3465616e465364656c647935766539633154346b654e74652b494b2b5074563865577838627061324f6d6d3774504450772b6733663266704b3650707a5461524a34596d3032572b730d0a744a6967733743376e735a4c3232743761313875554e61576a52594f6a36565a36527038646d73397a4e6277422f3331304c614a30684c623068524c4f4331746f4c65326a4f79474f4f33690d0a534f474f4e5647426763434e59306d4452376a784a713268573138386b47725748694854724e30746e754e5330744c364f514a65466779334f6e366c706b6a6166664e74754c56554c704b700d0a636975333072552f736e6b4a63535458576c544f4c5731314b355659376d7a75475658585266456363653562625557336b57643471697831654d787957374c4c4b73636e67384a2b4a76422b0d0a51386631654663526c38636d776d4e794468374538493853527175575459334a2b4a384a587a724c637478466166377242346d724a547255347a6c546a556e4b61316c79732b7034313846650d0a4e3839384c36484732583570557a7a4d7373346934727758486e423770553435396c326463455a6a5479444e383177314343566648594f6a7a55714e61564f4e53644b45594e2b366e46614e0d0a2f77434d5272756a2b454e493172346736787266682f7737654e706e6732306e315658302b796e76726f5855756c36644a6177516c6c76626846613873784f79336d776662456d2b624f77620d0a474e34325246415a692b53547554626c4f7055347947424158494f632f4c6c795278576f327346763474384c52514a4642484c66584e307343786f496a663347683633473879716f775a58680d0a73663841576851775166656263796e7454493459786e614d687a38325750336a674b526b68677a634673484f41534d6976302f777a7832497134586a624c38526773466c37794c6a664e4d6b0d0a7077774d6e4b6a696157477757555a68484776567869385773385656714355587979646e7a58663476347735626738506975414d66674d646d57502f414e5a664433492b4a73524c4d6f70560d0a734e69635a6d47665a5a58774555317a796a6735384f2b7a626d32317a786a37764b306662663746364f683863326847464930613444636b6c67622b496e48384a63424d735267384b4363440d0a4833767449344155674163696261442b4149412f43767a362f5935766776696278586175345979364a6153414d65633239367147516359592f7673456e44715778673767542b686d453579790d0a5a7966764263347a77546e6e6b59502f414e6176386c2f7064594a3066487269376c6c7950465958682f4774704f3739726b754767372b36372b3952657657335a4839382f52757858742f420d0a2f686d39373465766e4f4563573165446f3570576d342b582b384e70646d756d2f6e58786c766a5966432f7872635245724a48346531695259786a414b5755386a6b454141676e4c484338630d0a396346712f4158553577786951676a354e753973664b634c3872664d4468574a4f65413245424f63312b3348375232724c612f434478704b307a516d343048556f55614e797247536254376c0d0a593477647049456a6e612b474749793444444f612f4448555a43375278757733624e325658495572757a6b67716f4a5265426772672f4b4d6a4e6633393945366c3954384a4d776e743965340d0a307a4762733957734c6c755659565866586b64576133306654552f4150704672363578376c394e765443384f59654c696c644a3138646a4b7265373651752b6a6256756c6f723433556d6e580d0a535151696134613363514a4c4d4931647a48746a535359704d497953323765456371574a5643413250494e593850362f646547644d304132656d475a4e5561353142483169376868653358560d0a587642477338476d4e4d4775726157534f6279316a613364676953536b377836386b79424341796267546b416345675a4a4f306a4a584f4141536337732b2b624f3857306b2f4c6a35786b450d0a5a5a4468686c6742794d6a6b6b5a343738667433456e426d556353317174584d66614a346a4b4a354c4a553143504e685a35786b2b654f626b317a4b70395a795843555530303152645343660d0a764e50386f345734377a76684b6e44445a5a43436a527a315a35536c5539704a5178634d697a6a6839523549795558542b715a356a5a754c5454717545354b38564a65523358672f57344a760d0a4546766f31706f3974702b706166465932686d3166564775594e6b30737233546c394c75537253504f7a65556269514b55513778776f366a77466f563734616a31534b61445362474b39614b0d0a5a62485358314761424c794b3253336c75337574516b3337356f594c646673736363554559675a777a79544f316463585639714668386f77655170497a6b5a4249423447665559415548417a0d0a6e6178717a365861656442703933714c537a4a627246596f73306b59634f66505a43385a61464d59625a387861565632684d73766a3462676e686e672f47597a697a437a7869725958435a740d0a586c434d6e556a375047596e4e4d79713061644f50765476697332784c7078626b3779677270526150647866486e4666473244792f673747797764576a6a4d626c46474657644e556d7034500d0a445a526c574772566130727870386d44796e4465306d6c48536e5564727a6264715238654b2f423866614834585768504277486d3143304a4a4a4a3559516b59344f564f46427942316d57330d0a4542696547504f5175477743636b385a565341414f53635a353538753154575a703957306e56394b384e65496c5378384f573368756147396830714864486258537a775855544c726d3765570d0a6b6b696c6a61506c5168473361326271654974586d56386144725a75443869512b56704e72466771567a4a66586d73584169565356334e4870393032506d534b52754b2f6e76364f334771340d0a413848636a79444f73673468686e74504f4f4c73645879326c6c3870566e4c4f4f4b38367a54437976655458744d4e6a6145334b564e38726e313250365a2b6c68774f2f452f782b3469346b0d0a345a346d345871384e31386734437937443574577a474d4d50474f513844634f5a4c6974306c4c324f4b793346552b5656566430315a36744c76626d56326b5749623558617831346f7361740d0a6c69664475724946486467784941786a6e4947634850503655735631344930717a75626b577472716e673644526e765a46334a706c394a44703137706c39635a7955746f6236796a6a754a420d0a67526834356342565a687a2f414964384a366a6158563772476f363371317672657154535863304f6b367063773664615174464862523264734a4d797359374f4f4b4f34766949587635326e0d0a6e6147434b5157304f44706573367a34656c4f6b32506853655366566a64336472593674346d61347862326b62726b4b62563757795756677169306947306d5a476b6550444552786c77336d0d0a6e4547643864356c78586773526b4f562b4b50422f4166446d567a77386e694d666c5765384b5a706d4f655a525045553479546371754e7847422f64636b627a773961484c37746a7a75412b0d0a4e736d34543463384d4d6d344e783248346b7a337758342f38542b4c382b574969734c6c5765384d63635a4c6c58446d6330734c556b6e79776f5a54683830765735327558453465664e486d0d0a546674756d617762714151584157793147425658554c47516c354c65645274646f332b355061534d476133753439304e784330556b54346662533670722b6e61524372586b753872645763790d0a57554365626533556b4d365843573172627179744c64334a694d4e74454d467070413746596f3364506e7138316654627179314d3331745a615472576b53445a6f6c76346a76595250482f5a0d0a4d576f3344577476476f5742466d6d6146545a5779784e46424a4e6a65536a64426f65714a3464317654374a4e4b384e66326e635361624131786661707246377154727156394a61534c706b0d0a6c35444e49695151787138374b3976444937434d7277752f364445654a4f623852634e51344d7a4f74674b574a346979364f53593350634f76614b70683833772b615a6458713038507a4e770d0a7865497732583575315435457164546d623565567550794f47384b75482b442b4d4a6366354e686379713454684c4f6176456d58384f34755873335378325134724a3833776c4370697557440d0a71344c4359764d386b54714b6f2f61556c464c6d7661587156377056387667432b6a756f704876727144784e72742f4245714f734639716c6c726d73586475685153626b744c6d386b6757560d0a4356645644426375724831775731766651706457333257345337302b4b32756f4a774a744d315779635269545439526a413254775038336b334565626979664531732b504f696e35353948300d0a54557046754c2b7a6b6e7549345a4c5435627937675177732f7741386270627a777179732b47506d687433436e35514b3666524e4e30765237434f78306a54346450744935486b6a677479530d0a6d2b6151764c495137733564324f584949475377786a6d763066432b46474678574f346979664e3876775749344e783343484248445754783572356a684a38475a64693875776d4d705659740d0a31614749634d6447564b7442776c435747577255326a387478766a686a73446c664375665a446d575959506a374c4f4e2f4566697a503579692f374c7a4b6e34675a78674d33782b417259640d0a70556354686e5577456f314b4e534e53456c693574576c486d584c336c6e5a61627166686d2f6c31592f32625a6549467449374855334461786f696a777634756e6b747232366263645430360d0a494654707572726d5334745179336250635179534e364e426557657078764a5967373761346d7337704a4970594a344c69334b2b666233454d3652794b355171796b71466b743549706f79300d0a556b5474586253375055486a756e746257532f74456e5854372b65326a754a374b5334686c675a342f4d56694e79537949793558656b6a49325664677965466644532b47744d2b79666137720d0a5562753775704c3355623636415353377532574f454f49496c4545455564744861775739764375794f33676955735a504d6b666f384d4f42654c76447a475a6c6b574e7a622f5748682f4e4d0d0a6678446e6b3831786a627a4f6c4c367277766c6e442b4372532f3565315934504c73625478465279664d734e526d3232376e6d2b4e506958774e34715a5a6b2f454f42794e384c6356354c6c0d0a484448446c484a63436b736f725549347a6a4c4f4f4a386651696c46556f564d646d2b427159616e7978354858723030374b78396766736a685950483271516b4147343850585232376c4a2b0d0a533873334a44453559467475654467636b386b562b6b486b72324c6764687649786e746a42412b674a413763562b6166374c7247503471366341436933576d3674423836594c415772584b370d0a573344686a417049326b35335a322f4b522b6e666b4d65666e2f45427631333867647661763836507071344f474538615a31556d7672764366447465367572756c484d734b3033706470556f0d0a337439782f552f30563852477634565561663841304338515a3152656c3233556c6773527a646574527237726e77622b324872556d6d2f435353316a6644616871746e5a766952555a6f70460d0a6c65546267344f57564268694267344f52302f49485553566b526d55454d752f726869713541557479774b5941556e48707542444376306d2f6269316778654450436c6d4747323738527a4f0d0a774f5156573374446a67414534615656596c6765526a476431666d44663349655643704265504a4731696f7875775479534353574f33507a62635a5055312f646630636161777667316b73620d0a4b4d38566e66454f4b356e707a755759596567704a372f3875464636617550795834313431303369764566477a76614e484b737477386c306a4a554b315672723971736e30617337706145420d0a754c684e53746a4e634a62364c4f3174627a7a77356b75374f346d4f30584d734d6f3871573045705258614a3435596b4a6b654f5245636a43316c664542314c784e70747066326b4a3075370d0a734c577a46375a377062694e37644c79347558614d4b6b4d4e306c796b4671504a756d5237575a3333504a3563562b34455530447853444b534b305567624b4d38626f5132426b4d534d34330d0a413776756e474d3153767274326c304c58705759533345636e672f5833413461397369382b6a586b6d41436f75513977695935662b30344f57565651664d2b4957593537777234772b482b4b0d0a7832665a6e44674c6a36576338493437447172374f686b2f452b4c776e4e6b654a552b666c703038537156536854552b524b753436335a2b7365476d55384f63612b4250696467634277376c0d0a552f456e77322f73506a664c73584b69716d4b7a7268444234716450694c4253676f4f645370684a31635069716a687a5036737036575435635856704e526a3033773164324f707957382b700d0a6130326b6130626932744c694854703753307570354c654c5a4462764b623972574f437a6e6b6c685552585555676938316f6f6d7a596237584c7139307a51376657486d76594566574e66760d0a2f736c714c534454463146375454374f32746a48356b56357271326c374b474e7a4e4861577472396f416b4e7a426e6f58744c58564a6452305338575837467255454e39464a6253434f657a0d0a3166525a5970594c6d4632424353545172434132306a665a786f636877447a50676c38615a643674637571616e72642f6458576f6f6d434c4353316c62543762536868643744534c4b3067300d0a35695143386c724a634664307a452f6e58412b4b3476783369376e6e6854784278486d64576c774a78506d58476d4c7a47726934703531775a6d6d58594f5043325579673553584c537874570d0a725578632f6563616544626b6f4b7047522b6a654a324334487937774e3459385a2b474f466370773158784d34547966772b776d56557343355179446a3349387978302b4d383656525534740d0a54784f57304d4e54792b447370566364506b7536636b64547174392f59307570367871757054706f64686f6b3979624332454555333278487437617a7434726772495a4a64567572684c57470d0a4a6f6a4930376b787532307257646f48696b615a5a364c4872743365336d7161346b756f32364e59544e44464649714e4c42424945567673466f37726178586b2b7870354a514356615151700d0a6754584a3854654a72537844463949304d7072757059436b54366b776d68384d57556832342f30533265353851545250383063326f6150495347694367537968317658727a54627a7a54627a0d0a6542394b696c574764726556494a2f456e6957545a444a437765426e534264785135345844414135395841385263587678527038545a426a6f7a794c7845346c3473345a3459774f4f355a590d0a616e67654375474b3250725a31686f2b7a535650506339776c6244307071584c48423046566a4b536b6d2f6d6330345734476a344e596a68506950415370635365465043584266462f462b5a0d0a3564656e6a4b2b5a654958476d48793268773969702b30636e50687a686e4734657456707463307366695a30704b4c70744c307930385a3658663330646a5a75313571456a737364746179570d0a636b737249727379527869344a6261696c33787967424463456d7557757463734838513265756632784145306d47376a61776967744a70485479706c754e7336616975574d6756306a69676c0d0a597441452b59746c656a30394c54543539476a7334494c644c6539686968534f4a59316a6a6a745a30565235614441434c6748473473426e50567366776448625858676a5137573667696e740d0a37725272574b654e30585a4c484c434e34634b666d4a352b38574947444763735748313259592f78467a336a7a4d65434d566d2b542b313464346534583439772b496868724b706d4e584e380d0a3477474877372f3266536e5172594f645276615372505854543837776d562b46504476686e6c58694867636a7a722f6a4b2b4c2b4d664450475953654b626c53796a4463505a486d574978530d0a6278466e56723063776a53567668644862557233656c3246766f577158462f723041693855506233735538576a4931786934744972555157304a754a4a5a4875556a6a4d65356c63534b364c0d0a45796e79366830315a4a626f54337431346c74347076736b5574314a3462737450456a326b736b6c744c4464336146374f663841667571535150484f4e784b71574141364b7774494a66456c0d0a724b384d535261623455306139303233456549345a64626b762f74456b614350594a49376178744e4f675959386d32676d5350615a4a43336f514d636e376b685a555a646b696851306249780d0a436c57552f4b796247436b6253574a3239474663484376436b4f50736f772f466d54314d4e6b2b4570343748346249634f3465316c5657525a726e2b587878654e61707935616c66483138350d0a6d6f79392b6e68385454584c485130343634756e345a38525972676e506f5976504d6650415a586a65493856375432634b637549386c34627a577267384448326b6561474879355a42546e4a0d0a506c71596a427a66505055316250784c464f3855476e324e33714a2f74442b793771545974734e4f7666384152784662333633573264486e4d366258574e6b4f39575a3157514e58552b474e0d0a646d31372b30324f6c7a3245646a714e7a706b633073304d6b64334a5a536d3375357255785374495949377143347439307355496d6447654550475178355877746f4f6e364b6230777958440d0a485539643033555a2f746b78644c646b2f733679574b466c695230696a677449564335655447344e4978326c656e30426f4e485456644f303354377657345950457669595358554a534f4c7a0d0a5a3965314365574b4933447854534c617a5353327275694f69504132306c52744833574538514f4a736e38544d6b34663473786b49595047654764625038566773426833576775494d4a784c0d0a48497130595367312f733777377059324e6d6d716c586b615350673877384c2b456549764344694c69626733427a715a6a675047436877746763787a4c454c447a6c777a6a2b454a635459640d0a31595457754b6869565777633946656e5363377333323853617a5a326f49384d5333636a3637613646613267314730687572713575593537714363507361336a733374595a376b764a506c560d0a676b686b6a4533377365745232594d5735687363424231335a436771546b5a436c63344c4c7a6c51447942586e4d69334574686258733054366339763478384a534a5a733845306a6f3661350d0a5a65617a706b65584f626e616f5168674974784a44416e30364d69496d523232676a6545354c4e47704459324f526e4149665051486a7143612b7438494f4d63313471786e696a484d7362550d0a786d483465385173566b475378715558517155736f6a6b4f535a74682f61786b35533535314d3378464e7537397a4430326d2b5a6e774830676541736b344c7748673356796e4130634269750d0a4b6643764238545a2b36565a56715662504a635263515a466a56526d7252564e5179624456456b6b34314d525569307248736637505347302b4c48685a6c566c575335767259727a744b334e0d0a6a6452674b725a322f65566d4f376c686759424a7239565168497941366a6e6a4a3435354851642f2f725a484e666b72384864534d4878513843624832412b497243467947776358457767430d0a6c51774a4a45774c4b4d46697049586f442b76346733664d55556b6b386e413479634442556b594848552f55312f426e303763424b50695477766a7266373577664344615674634a6e4f4f700d0a32756e47375561797676706275663050394558457438435a2f684f5a503670784e4b55566433554d566c65456d6e7673355558303354335077352f626f31526d50772f73466b77686c3171370d0a596c514343677349304a554444594f3747656747376a42492f504b346c6b3837594a51784a47535276326f344a775841323752685142777530354f65612b786632324e54387a7870344c74550d0a495977365464796b4f57497a5066624277434649433237664e6c686762634c38326669615734784b535543347a386d3445757747427a6e61656747414d6a314f4e31663256344d72366c34540d0a3843554e705671474f786257717573546d2b595646644a3965534e2b6c6f3376756645654a36654a3439346d63594c3933566f55593956656a6738504379657a7335792b6230544c725844420d0a546a6a4f30484258473835414932344158444138676e503365446735356a2b334c71656865614955385132766d576335484e74722b6c4c3971736269504a344d69787249436e4466594556680d0a387842696d755130617341436f784b797332306c6c323775414d6251546a6b383954386f357a70355a6e51746265584864576b6b56336153466a74382b41724a47724d6f4a564a56557754590d0a444e354d6b674b75535571664733686158483368396e3253344e657a7a7643526f35357735694b646c55777566354a5570356c6c6c536c5556705171564b32486c68704f4d6c654e647074700d0a6e75654166476c4c773438532b48632b783846553466786373546b484665456b6c4b6c692b476339705479724e7164576d37786e476e6838577354474d6f79697059644e4a4e4a6e4c332b700d0a362f636170707476612b646f2b71576c764871327277376b56346f59586b6a73394b636c6d4b77613771554e785049774a6154546448695a396f765933454f72366e2f597a367871747662580d0a446548746473494e66676549484e74716b717061366a6f363478355633716c31396b6973564743327058647952676f7a4e4e47317a456451314c5535595a745a316d2f6e31432f614a354a490d0a6f325a5937657a73376435565751572b6e32454d466f6d55555350484a64655647383743736437653976622b7a746269366850682f547453665734724e424a3538327073692b514a695761460d0a724b306d6d6e314b4646557564514e764b64763259422f35327858686c3468314b7642504865447830384e782f774156504d736b385271376b3148433542785067634a5369716154736e77330d0a51774d59595661636d49784d3551355732332f522b4738592f444b4f45385250446a4d38736a69764454684b65576352654532466c53546c58346f3450782b4d714f6456744e7150466c584d0d0a5a53782b2f5068384a43452b6452567579384e784c346230536166574c71466232376c6e316e5862336673684639647435747a746b6b776673646d766c32566d726636757a746261454445590d0a7246307a78446f38486961306b5856624f524e57384e364c70646f4962684a324e3961366e726c7a4c6250396e4c434b5634395368324b2b304d64344c4b51564746343038595070503248540d0a725079704c375558636c4a444749786151354c43565a794179585567533254594449566156674d6f5374372f4149534b3174745430715733574736302f55394f69314e6261477a6856374b300d0a555278537a6d645276336d576145664d75435a5a564c4c745450366478425879504c4f4a4f414d506c65506f344c4265456c66443461766850594f71716b654b38706e772f7741376c474d760d0a614c44304b4e53574c71516b3530385a6a4f656f2b5a766d2f452b47596351356e776a346c314d34792b726d4f4f38624d4e55785563653638615470562b444d38703855716e79796c616e4c0d0a463173545468684b6453504a504359534d4b63556f7078394d66584c43313162544c6136767265326b615a726c504d6241386c495a31615463564b7351585246484a4a4f423643313442574f0d0a54773170646d4a556c62534c654c547279534e447457387459454c52724a49754a565a576a6c4d697136374f4d38734b3872734e54316d2f6c31467254586f7a42467274706f4e6c4d4c47790d0a346a764773324679344b3538364d584169455a4b786b6f766d706c766d3955696e3165426e305344554c653476726d7a6c6e744c3653306a6a4d62516f58655757336878464971424a517a6e0d0a6143586856426e4972544b4d2b6f567645764f2b4e347a717a77325a354a6b48427363505470786c65634d5278426d3254796a556a423830735a69364f5067357038764a4b6a6579646a697a0d0a76494d5254384a6548764475644b6a52786555635338533865564d624f664a376c6243634e5a4c6e436e43556b6f72425953746c38314379664e477461396a54757035645075374f35574b510d0a2f59556d732f4f435350486461584a4962684c4336574a476b743539506d6b6c61777574723237785347475a6f79355a74545450462b6e586369704244667a54484837694f786d6b497754780d0a494c6458565238682b5a6a7944676b3442724c45562f504c71317246726b735130372b7a4448494c4b795765524c79572f6b7570704338586b7874354671495955516e4473307a71363457760d0a5576435068476278612b68576c6c666a5158316e55622b786a314f2f6d69746f5a45754775346253613357574f4d33456467735346704930416b753437754a335a314b4c3432575a7856344f0d0a6f3574682b483858697372794846596a69664f73506c2b4a704f7373466a4d446e644c445a376838444a5535636c4e356e6a367461455064555a4f627472633976504d6d772f4855386c78760d0a464758344c4e2b4938426865454f4873586d754871716c4c4d634c692b48355976682f4559364c6d6e55714c4b63736f5961705566504b58737161636e734f306561573375376936314637700d0a72545562335459645073496257613775724e4959556c6c754c694f306a7544624c4a4a35796f736a534d71323647625a4a4d4931394c304338303254574e63736f744f7637573147736172710d0a567465334d4579577338476f583575516f6e6c68674b7a7250644f4462694d4841597035694b5747616233532f4375723339685075314a39483167614a4b59544331713055477458466a4e710d0a45307252695232755930566252562b514a45584b6e3569337563486a33775a66584674396c2b484f6b324676613273694f68753951765271647738727943396e5761565262736b4d6b5561770d0a32306157354d617538624757537676654173722f414c64347877764664484d61396570777a6b6d5a384859756c6a6f52717a786b4d5678446a637878324a6c4f704766762f77427034486c6f0d0a744f314f676f513572615038773853632f7163503841356a7752504b614f477063573853355278376738526c38355561655856634c77726c2b553566686f4b6e4b6d6e4635526d69397446330d0a35712f744a745831584f7a6172706136587264746257576f33657032313334587562534f4853727961326e585364546c7537784c6537534d514235374f376b6a676665496d6d415669795a490d0a37574765433874596273785856714a59684c396b756f46697559505056543564776764796b6b4a5a6b594937414e6b427943706270644f38572b48476434313849575167646755534f53574a0d0a67533059584c357a386934525153344c4d353267594464644264365a666e455068324f434d41414b69744b2b426b35643358637a626b583553696b59774f4154583744775477612b474f494f0d0a4e73356a6d4831696e78706e56485073526733434d49595446307372774f5578564c534b355a594c4259614d724c5761636e7237782f503369523469663635385065486e4439664c46684b760d0a682f773758346477324e3971366c544834504535786d476554566138704e536a6a3879785468713755354b4f6c724c442b47747373586a6e7772644c7659776549744a6e62354f4167766f700d0a476b4467414841594537694d714333494a412f5a6a79436348636567394f6d4f5034546a6a486638756c666c5670787339436d6a385248547269473030746265376b4b774e4972794b3458790d0a6c4756486d4d78534f4e79516f4a4474677258367767384956554f724a4777624a4f64364b33557154786e4858484848474b2f687636646b4b4e5869506743716c427a2f414c477a796c4a4f0d0a7a6b6f517a544356494e3261306370315648706f3748394a2f52427231716552635a552f656a5265625a584b6e4f6475567a5741784371785639484a4a306d37644c614838787637586d70690d0a342b4c476b32702b376165484c547a45412b365a4c7a554742786b344a43722f414241344c456b59352b556e6b426b795842414c4d47554b704449464150727a6a6132517a4548626e3777720d0a326a39706e55354c6a3479336d48526c7464473032467472626c424d636a676f6f776d2f644c68697934776f414a7a38767a2f4c645a562b5642366767416873417355494f475545416b42390d0a6f494a4f5351746630747744556a684f4175413850666c645068724156326e5a576466367a586c3166577370644737366f6e69366c4c4663553854563346747a7a58454a50666d644f564f6a0d0a5a62374b6d33703337574d6538312b2f6a74623256394e6a57653276624f3153336e76506d6c74395176545a5739387371524f766b426e506d376c5a3432526b4b7630724e756645657277320d0a706d585372524c6f616c42707073354e5132707375306b6547356b756a4355387151524e456f434b78754d524d70596c715a715472634169566969586154616263794667717046666256676c0d0a556664335731326c744d6a6a6850336a5a58766869397462794f32697635626462713868754e4d75345a334b786a5537575a445a6e496463794a71734d4d63494b417442504b564a566e7a2b0d0a44636363633859384d34766a656b38386d336b4662682f696e4b4b504b6f797a506858473475475835316c394a3879633856677357326f75446b34776c42744a616e394638422b48334266460d0a75423444725279656e476c7848684f4a75443838724a707879726a44425961726d4f53356a577447315042342f425268666e3555357161546230456b3853366864783330304668624d74705a0d0a78684a587533695639514d4d567a5061523568592b56615253684a726a4a5437534a4942686f5a5374665376466e6d616c6457392f4842625755553174706b56346b6b7a4e4e71386b554d6c0d0a33597047455a566a736e7559724f5735636858766439734e7a4b613476554e62585366446d6d5731686954557276626170444d415a5a39576c6e5a627a7a686b372f4e314a355a62343432700d0a6266625a694e69414c77736436383130624732766231394e73375536656c3748424e4e6279616f38386c7a6661786658416a4d58326d5055466a75784b6a6e393638717a62544574546d50690d0a5478446b54794445787a4b706e6e396d38505954473535526f523970547a484d4d3465467a53644b44707553554d6e794a31366b6e5a72323154435535506d6c5938374c2f44546872506e780d0a466771325755736a2f7454695847344c4a4b31642b79725a586c755477786d55303673314e5276557a6a69434748696f32532b723073585553616a7a4873313546704f6e367a726d706176720d0a43745071476b78694e4c69796a4d656c574d636c7a476b30456f526a754573775673736765514a76556e626d373458302f5434376d4c56592f457375705257746a667747316143305242706c0d0a38776e6c694b4349542b51626d4e5752592b72522b54797173726564367a7272616c6f576e58796f37334a466e767452744c50714672722b68787a574c73516f5654655269334f39536f44460d0a6d42413436587778664e4e72327058643546445a663643594c53776a7972624c75577a6c31436551343273397463325564737353444353537a7a62696c796c6474485063737833482b4879360d0a6c67734669634a587a4c43546f5970744f574a772b643542563475566645316667784571474a64436c546f564a53626856634b66774e486b3472686e4e6374384e71755a314d646a4d4c6a710d0a57585939346a425269375958465a4a7848682b4448517731464a536f52784f4368694b74577654696b70306f7a6d337a4b543765307666443652795157757333646a486533734f74784b6c720d0a6c6b32783239765a79493074713568574a72417952504c6d5353595035686b56634430375274517364505357396139754e53754e52564c4366555a576165344673386b4d793279525738614a0d0a61573074784446504a74696a4d6853507a4a48434a6a7937777a5043313334684a555949304b5042507a674e63654b6e4c41597749794364774741474947435772704e5076724f4c5570644c0d0a5355457a5757717974456755374c5a59724a304a4742744b58636f38674d724b6f6e7545423267714e386e7a65766c6d565a52784454774758386d615a6c6d575655735053626277654d79570d0a747864686372786a704e506d70306c6c466555704e5356474f4d557278646d384d37794f686d326435377735567a444d56504a4d70796e4e716c657575565a68677339706344596a4f4d44370d0a523255616c66384174716a4b45497465316c6758465261356b76584e50314c53316b314750375735754c6850736b73736a46457435567574734c4c766953467072517a7a5763556b766d78520d0a4e4e4a4849576c54634f367637327a31433267307566584a4e496b736a4c506254573872695732686e696d5634496f3761336c4e76417a7a7a334d6368574d4e64544f36796a2b447962796c0d0a3169783150545949354574494e663161332b334f49354a6f64466b316d384f6f756f55594573453879527143435569646276353267495033722b792f384a744c3864654f5a76446b643361720d0a6633306476716474444e3562586b6c744470554371436c77593435455634355a7043575a4441444d43337a59303459346b7063517770344c47594442556f347a4c38546934347972542f64300d0a2f7743337374774f663570684842306d3273566a71735a55717969347a5748714c6e54696358472f444658684f474a7a5041342f48316f35646d4f487738384852716330716a79444e6377340d0a62796e46786d707233384c6c644f6361314679765464656d2b56526c637a76674e2b7a6e34692b4a2f696254744867385461726f4e7071326a7a5873766966566a652f594a64485353356b6e0d0a756e6b747242377536434347376e7861785458586c67756a716e7a4c2b6c576766734e6a777a6f7478346c6a314c5176695234633058454f6f7965475a645a6d754e4e525262323972714f6f0d0a36664e59573931465a6d65566f56574b535737655343563549526252764b6632662f59472f595430356266776463367644637932756b52654c72752f3142344962375448767274722b7a73760d0a44746c6643433353534f31307637477434746a4f3056704a353043796b2b586e396b2f4450774e2b462b6b65464e52384f7a6545504348673238314b32736451316132304855684e667a576d0d0a6b724d6b63656f506651475132647644645377334b704a6457572b2b75537237354263792f4d347a787766425763564d4c6c3245704e596970686e6d644842387372537159724d34342b724e0d0a4b436d3673367359346d6b6b37786c6955716e4b704b4c38544d66444c44385a5a5242346a463161396242554d782b703138544a51626e6873506b6c584c734e724f317165427156384a56350d0a553432776b5a577647372f6d7a7476324176444867337768345a385a7a66454c3456616766456d6d7758756d365a61364e712b7258496d59517663575633635867736243475454732b5762740d0a476c65353253786d474e31557532782b47766876544a4e55697666427435347276566a3039374f447742384d64543153346b302b565555616a49386344573168616563317248484b464d39390d0a5063787447306975536636586c6a2b46756866444c77566558656b2b41745a304f43776b69304b556e544a64466b696a68754e516148544c6d34744c7470326b65304143785153504c6552710d0a303278316152654831445850436e7731385678654e497244777a6f467234724d61576b577133734868364339735049742f4f764c457878794a62706270396b6b75495a3745504d78563938470d0a394165584a50704463595659356e54784f45786559346d2b5a724b366b71304d4643705877655a546e4444526a5277337465536a6c39475561386c4764525370755570553474796a2b65635a0d0a654366433244725a4b734e58574570346e485a52484d4a786a4b7455776d427a4c4c384e556461746554546c3966784d59306c7064535556737a2b5a4b2f38416776713378537648384f36480d0a3458385665484e7362366e6578326668362b4f7251614a70582b6e58634f70364f747045454e7949676c7755454c66596674456755694568506664507458625437466769454e5a32707a7a7a0d0a6d434d352f484f6563747a38784c5a4e6631426170715867505337572f4f713674346130694f2f67614b386c753956302f54504f6a75554b2f76626c353764384f4a573274764441506c43430d0a51612f6d39763841546b74722b2b747261657a764c6532766275326775374942374b356974376953474f3473334f5331704d69435332624a7a437945456a6d76774c786738536362347059330d0a4c4d7a783256764c66374e6f2f55735053397256724a30366c474e57712f61314b644f2f5069495371704a58744a4e3333503643384d76444c412b486554346a4b366561553877574d7864580d0a473161314f4d5637376c7955303144583361436a433736702b682f482f7744484c346461376638417844316e57704e51384f77795838656e6930302b587844597071636b457472456c71736c0d0a6c4a4973367a5854354d4d4f337a4a424f6b716f497978586a64532b41766958524c694f78317a784a34473061394d5573715756377236523354525268325a78476c7649785462464b4666430d0a71367164686432436e442b4b2f77415374547666484f7652705a36456b326d617261697931426445303658556f6e306d52445a53793330747539784c4d6e6c494d73374d73544742663351550d0a487a6e58666962347738536174646135724f724334316536676a745776785932456478396e696a614f4e49354674304b62466d6d6a5230326e456a726b6833336632786c6454504d506b57530d0a59576c374e4c4335446b6d4877366263573653793744756f327561796135344b4b74316b756952386c6a384a77355678324e72564a564a7a6e6a4d624c4550765757496e7938746f375855320d0a337070465831625063582f5a473866366a706a5877316a776b62473773704a6f7030763732564a625a34524b6b71474f77494a4d6243534e31624147474241436d76694b2f7348754e5975350d0a4a344a595a7242452b3150494a46573431393468424a65577179424345744c584c525349697138326f7a746779572b5237644e38642f697661366644706b666a545672617774594574594c650d0a46376133696773345950496974314b573673493168534e56424c75434175343546654e6170727431716c316658393279795856396454335679385546746178505063534e4a4f795731716c760d0a61573049643852775739764642444874696869574e41672b597a7268504238525a356b2b625a713531486c6c4c4d4b4662447554644c4755385a47436a517845622b2f68364e6454784d49530d0a76465659776c6136505879376a5445384c38505a746b75515870553834786d41785561396c37584231637671546c395a7737566e54725969672f713153634847546f633057374d38377662570d0a6256745676622b4e70644c653233424a4c694e5a556b316537477a56623231695a304b7747335a6f62615162474c616c714c59566947463753394f6c303351354e482b334361526c764653380d0a38694f4e4646374a4b366e79777a4b327835484a5a324c794d32346b6c7561383932647a357948444267355a75527542626a427757366748626a47427a6972746a4e424d383045736951504e0d0a706576705a4d7a4b694c716a614a7143364968615146555a7458466949325937566b614d73345573566e4b6545736a345479615571644f654f7159544c386668716b36375657646568694a380d0a30344f4d31503334555668634a43537534596643776a464a58547a7a7a6972502b4d7335684f705770344436396d4f58346d4d4d4f6c526868385268615559716f70553342754d3852395a780d0a64534e37547847496e4b53356e637866374276354a4c6c46385171717a334354684937474569433753613076476b684a6b49446d3473344a33424c417962793671586b4a367937303665346c0d0a74487464576d733952696a6a6a6d753434596d45386b6b506b7a544e4577386d4e726744446766753378474e72744770484a2f624c4b476130574576427576556b573374302b5765345733750d0a42454c694a69585952493038696e373675527549444850536e5776446c3770566e642b52653658724d556d69375a5970383248695333382f547257316165335a764e677668617878333872510d0a7a7a326b3074704b38734d4573706466456a6c2b515a4e547739436c67716271314d77793154715573544f63735053792b6868714f437230716954644f5648443170345379646e52703872750d0a6b6b64324b7a5069544f4a31363158485665576e676330697146544477554d52567a48453163546a614e576d33793149316352683459742b362b577455553957323562396e6f6570596a6c540d0a784e64577a5841657a6557433274464e343967576551454d436a54572f774274626474474976507751675a4b3951384865484c56416265337537706236386d6a656255376751586c334b424b0d0a4e717943614e305750475645456361497065516841376c6a794832324766772f34616b695a4349745338654f574242327539723446676b48796e35424a4a59334179785037794751715745620d0a62665766416d6e66326a34736a384a32643344486333567071747a6f57727a33467242703134317270647666614e4d306a4d597842714e39763038744a4c4848484c714e6f4a514a495757760d0a6f4d7672634b35586870556132447131564c475a31517739436c4f70576a52705471566f346a45516a79754d4a346c59334579565252557231716a6a5a79625042783950696a4e63517354390d0a6570556172777555567354694b73595570564b6c476a516c68385055616b75656e686e67634c48326262692f5a556f3239324b587376676e34557753336c3142652b4a4e586e683153366a760d0a31654e594957745a62693856373235524c614e54436a66614a5a35424a35734a4554417074636f66322f3841324566325466446d712b4f2f4175747034332b494c364c6f48695778384e2b4a0d0a6451535077314e7264707157724a4c4e704d326c77332b6d79574e333459744a4a394c74395a532b5335665437643732346e4c516b514a2b596e77723076514e5a38532b4a594e50385353610d0a56704f6e66447278663433304c5739536b733858656e58586865796a306e777a71646977556e555939635339734a6f384c50494c32796b53495952782f544a2f775454304c5276486e6a6d770d0a384c6147336c65447443682b4c576a57476f6849726557376b385358506a4762534e5231654e70704a626e574674495073384a592b524c5a36545a5874724369766b5935686d58447543796e0d0a47564d75793670686e674d6872346568585548375347436f344c46576154676c3758444f314c447a3063597835476e47796a38376d6c486969753038666e4378564c455a7373566a734f70780d0a3558696354694b55616b6c6154626a573072316f4b3858552f65615376492f6172344b2f7370617a344f3050772f346d385666477a343777612f5961486657306e6862537645316a4e6f576a0d0a516169576d6d746262514e4c384e53576b75706933614d6d573274476d53386c6d61305a7949356d396750374c48776731616278446358396e3473756457386261424e59612f72632b71367a0d0a704f7436686f75704f5a4c6a54377256394d69307953316e6b6c5a6e754c534b613376455a326b654e534352394d574d44773273486d2b574c6777514737644d375a62684c654b46337977330d0a4d4435614b43337a464655486741565331477975626f51532b5a6552533246334864774a703270535761336e6c7177613276554d53775432387175516265595352733652754a49585658542b0d0a46386278426d57507a4c47593664645571324b72564a7a6c526a476e464e3170314b6349526a42577077714e754b3162545570536b32322f365a7933494d446c3256344c42657a6c576a526a0d0a666d636d33553972526a5472546d33724b64536e4b4e33647579746f6b7265512b476632632f686c3450384143336844775a346473622b79384e6542566848687253354e51652b53776546700d0a484e794c6a55597271376b764c69576161613575354c687269616161575635544935617567312f34492f432f785872326b654a7646506861793853367a6f55537861586336394e65617444610d0a6f73697a6245302b39754a7450436d5a456c59477a495a306a5a75593078367770636745674b534d37572b38505934794f4f2b43656e553961506d395637663536642f2f414e56635039745a0d0a716e467248596d4d6f4c454b4d6f315a776c4836337a665772536734795831687a6e375a6331716e4e4c6d5475372b705779444a385332362b417739626d6548637565455a633331523035590d0a5a53756e6455585370756d746f386b626249385a385a66414c3455664543336e7466466e686c6456686e786c42714f715743783758446f3058396d58646c3562526c526a414b6c41493244520d0a67495077793148774a4e345931585776445832653668486837587464304a497278764f756b6a306a563733543468504b41424c4a3564757061514143516e654f434b2f6f7a2b6231582f48500d0a2b50537678312b502b676d7a2b4d666a364e456b416d316f582f45544d433270324e70715473436f49495a37746d7a6e4a7a7a6735465a5378646246306e5178465a7a6a47564f70543532320d0a6f75454a3037525854334a706157576771755534616c5469734c53564e71566e6155724f4c752b2f3832702f6d722b4c4c7a3756346e385833786c52496c31712b456b684f3156496e6150490d0a2b584f43716a4242344242476341487a6d35385336666271544c64516b42526c664f4250424f3471694463514f4f75416553534d5a724c2b4957734e426f666957626579795876694b3542590d0a48444f476d63717050796c7639572b4f683543395142587a552b6f752b33644e7a754a7747497837634842414c644d4447656e47542f6f72694d366c683367364e4e726d70594442306b6d390d0a6c52772b4770744e5873722b7a74657a3374325a2f504e484a495969574a714f376a55784e655639627555717335796274663754656d6c7237505539393144786261734356792b343767344f0d0a305a49554652393434444145466956355959363435796678536a674b71685175345979774a474143753445466a6a646e3235474469764e78644d7949437a4d6d7854674d4f526b38484c59770d0a654d34374441507241317a6c534d6762546a50596b38414d63676e424f3439534f4f535749466632687a525652717a6d2b6e4c75303557657173743131386a534753306e704a53646e7061360d0a5374654b3031643761506264393748615071344c686d48796e637a45396d7933484136657554786748714b51617047386543704c416a47534e754d425347354150444d43417537497a7858440d0a79585759796d376e4c48504c4563344a6250555a5a686e41415042795354556158727153706363746c636b344f514f63485030372f644f427a78777a7a486e6334535363484b334c4a4a70780d0a664d704e2f5a744c717250547a32366f3554424a53676e47634a4a7861636b3778626161747337763846366e6170506252353251525963414f324e35775468754842584751434d4141484f520d0a6b31615338746b6b4d7a5252414a48676c6b556c564243384e6762567a6b48474f35506f65495336666b6c7971345973574f654151635a427a6a4a4a354851343646716b53375a31327351360d0a746e3553654748796e4a77636b5a59446b6e706a4863386a713453367468614b61576a35597961646d3471572f75715672335453586f72564c42566458376172326b31556d6e5a37323173350d0a4a4a70505a58577154642f53744e385361556b746f6853475262365352626349735a456336427477644279766d53516c446b594c3757424935723076537648783065547a4c61434d735956680d0a6b49594b64695478584362666c47333534554f4e674149423669766e426e583979385447475347346a75496e695a593252347a772f7741716b4546575a58566c4b7370495a574247453166570d0a39653868707261613075396a79733175747648627954526d475263656447506d6c566d42526971717847306c51514b782f74434f4256577457774e4b72465155315044556b355258736256760d0a646c72666e392b306233543054736a6d725a524c48547030345979745363373035527846567867327169644739534b5546614e6f2b3834704e4a3373336237563033343454576978686247420d0a6c665970447a4750664a4f34334443536f7053526976422b586843434e6f4e6673742f7754322f6238385a2f4444784e445965454c37777a6f7933736b57747a72722b72617066615a6636680d0a7074726632326d69332b7a4179324e335a6e574e53733768475a724b39736269564a74336c49352f6d4462577072314e443065326c57356b6150544c2f554449534462576c764a48496265350d0a345169356153495146454277464a6467434d2f512f6737783366364250597961664b4c4e37534f534d7a5738736b63306f6b6d65534e6e416378376b52764a42514c6d494b705675545862670d0a387a7765657a6c6835303648396e756a5270346d314b463630366b484f746839556b3152396f6c555838303348653976487a624971755759642b3955715975705571314b4b6e556c4a5534510d0a6d71644c45536a655876566553547033752b526379736d6d2f774455412f5a782f7743436b2f6a54346e654d66682f34593854615a38474730487874346676517576366234313137533954300d0a4458394c746d6c686a385161647175697a57706831574b326e6e54374a655268593769316e696d654e70497a394e2b4f2f7742753377313443384e2b4f6233562f446b4772616e34556831710d0a4f336a384f2b4a4c653730765737717867754873526161674c525a596258554853424576456a6e6145793538734f68537638327234482f7454654c4e46312f536452683858367259512b48740d0a757336665a586a7a36787075756178706c756e6c6548645869463562665a394b31473456345a4c69504c573841574231324f585839482f41583765766a4834777936746336395932316e70740d0a39635850687a544e43746275365730304b4731306c4a4c6565336b4d306e6d336c7464584d4b7979794f3064304c4e4a4768696b61516e38727a44775379504d4f4e386c772b56744c4a63630d0a34566356683664586c6c4f4746715372592f324d7565556f38754771306f366138305a4e4a576158324f57386635726c2f426d633173783570356a674b64534f477254684b38616d4b6270340d0a474e54537a7655705659713758754b476d746e2f41476f2f415439747a786a38597645476c364e632f445854644d6831656542625761323175356e6c74725734672b31573031775a624d77540d0a656441564759335178544f717972744c4f6e3651344848796b3844706e47652f2b652f6576356e762b43576a654b50462f7741553946766f6e75376e772f62784e724531334c4f3045544e610d0a326b6c703563414a2f66665a3736575066396d6a595a646650386f426858394d4f663841623942302f4c723965663172386f38632b466367344f34727775545a425270554b4563746a694d540d0a43465772566d71395845565970565a565a79744a553661616a42526a797537764a7533752b4465665a3978466b2b6159335061395374557034326851777a6c427768374c36764f724e7731740d0a4a4f636f336b7569537547462f754e2b762b4e66446e7868384474712f7741527645576f4c436a43342f736e356936444a69304c54494477777a7759694f65754d3139782f7744412f54742f0d0a39663841505034394b2b5a7669426261744a3475316437615333454c665943676b6b6956782f784c4c49506b4d6a45664f47786b394d644f672f4749786c4e326846796156374b3937664c350d0a483750526c434d6d366b597a6a7974576c717233566e7131716c66377a2f484c2b4a45307a36456b6e6d4462636139655362464367672f764370343459465163427563344a774356486836340d0a776e4754687368747647473267416b394d41354a366e6a6b484a3936385a5764326d6c5779586d693668636d4335755a2f496874356b517a506c4d797978526c5341684c4b7649417a7442420d0a334478363473372b365a426261446357667a626478696c354a50335330787742387742796f786b5a77534b2f757a47356867486a5a7a654c7737356252584c566933376b75565753615674450d0a6e727065316a385277654278564b6a7976443157334b565363755271334d306b33706433377061333668447a4743535370554b53414163706b3477636e414a417741422f337a69717a536c7a0d0a674139477963412f3749366e714e32303541794e6f366972456c7065326f614335676c6a6d69646c5942546a64686874794d686970496267675a4863686330704c61386a646d4d457135584b0d0a6b7267454f4e3237714f6f436e474f35794b3676375377764972597568464e51762b2b7033556b6e37713937545356747657784d634c5635366e4e536e645053384a395737665a56377033300d0a37626145456b7a4b754333437142364835694778317a3644707a7a67476f7a4f4474774f673559455979635950314162386363656759367a6b7366496b4a776f4143666577564367454139420d0a6b2b2f6241786d445a4a765565544c3832434d78746e6a377747426734555a4a323965427a6a4844504834586e556f3475685a61667871646d75546f2b64395a4e74394e4c746e58484453740d0a72546b6e5a2f5a61573276325666662b6e6446345844344b6b345253437a5a35494941584858675a786a723348514775547474663146355a456b514c48352b314a52477745615975514d71500d0a76412b564751484a32357954387934364d6c786c4245354a584466757a6b5a4f4759384145413763444f4e336f4d4178527853466a7474354176384141336c45444c44494f37414262412f2b0d0a4b5059655a6a7355716c576d714f5930714c70715471786855684b4e52564f53796b2b5a327330396462637a6656472b486854705172653077617138366a7975616365546c637279587536750d0a5461766652704a617251783439653153524168693875525a494155327564795352534e4a4c6e4932694e6776792f654247786953526953303851333761644a4c4d664c75476c74342f4c65420d0a67465277755858484c42674766635075444b6e6b6336725173474f49484955674d4247784959483551656e515a2b6e5848706e53323932397a444d716c4934585a6b486b45717a62634f72370d0a314b4d6f424446534f6f484f65613471754b71554938367a614e573848536350615531655533434b713335313730464676525762335770307868686174347641307161356f3165626c6b33370d0a6c33374c34473756485a4f396e4664576c5936433531466261305a30745942664a4b3073476f444b7a757277724574684f4379704a617a537041363443795254426d52694a475669792b49560d0a76444e6132757057397a70387a497a5353544b4445484459556f366b4578347a69516a6147484f4363316e545773326f534837624778445272476b55634351777155424963786f465670454a0d0a487a4d57494f4734417a544c76544e4c5749586d7257312f6549596d74326e534b53366d6832493751434e4549324c4a4d56516c5758615a4d6e6748486d314d3078574171564d566c754e770d0a6d4677366d7139656a57713035555a76575665584c47584e423156794a4f4f69316257694d3434484259745538506a734a694d52566b765a5561744745347a687a526170786a4f566f546a440d0a33744a7131306c4852732b6a76416c3170797374786173464530736c77303779764c4747754d79475a77726e6a676e6a48794d636346712b2f7744344b334f6e44346a2b4f76374258554e470d0a30533431375372363138485873736c316465486e6e67557a5332317a4d736330746a64695177576372715a4a6265326a4d2f6d764645772f4c2f344d65474e63746f354c6b576c36526533430d0a5457397538636b7a51575948376d4e7874776b6a686d52776f2b55456767414e742f646a344c2b4459506a6c385262447868345730732b44376651666870384c6f50475547747872707431710d0a666948346465454e50384e2b4d4c7254487545582b3158316d2b74573162534c4e4d7a53526d56516b3875354a503050686650387571356c775a6d74624559584253682f6174577451654a680d0a376b5a594772626d626e4c2b4b6e476f6f744a7632744e57625455666a65494d6d784e4c4b4f4d6375684772693431466c5831656f36545570314959326e654d556c7136664d34536b6d37520d0a684f577a7366317766384559726876375873394d74394f31625572733256787156397174783533396b654874477339456c7462654b786b6a5272627a64586e3165796a6c74703253346c6c520d0a62684156745a435036522b6637693976542f5050622b74667a392f3845767669375a65547050773767766450384457476c3263756f767165716659394d54564c4343395977615a644e654c610d0a726436736b64396432535453536b506272444d456437574a542b3659386638416751503551385a65475864417535553137544a48417751724d467547366c547953446b45312f4e506a706a590d0a357078376a4d6451644f644b76516f2b796a516e4b7531427a71796a4b724a4c6b6a4b706479564f44356163456c4a633870582b2b384d4d45387234596f344f6f72537031587a564a5235460d0a556b71644b4f69615466492b614c6254626233364c73656637672f543866384150623372793778463458302f55745a764c326178754a5a5a76732b36534d79624738753167695847326446340d0a574d4b634b4f5163354f5365697650482f6757776a655337385a65473456544f344e726d6e46386a6b675270634d374d4d48355655747830727a445576326e506778706c375059792b4b70350d0a354c636f7253324768363765326a6c34306b4268757258545a594a674134566d6a6b5a51345a5364796b4438696f717243546170546c644e57733131546662792b382f5275654838306676580d0a2b5a2f6b7a61326b4630725233554d57334c4c764955726c67477a6c67576a7a6b64634d4163354a4a4a386a316277566258424d746f3551484a4144503562597a6b34474e323446536f4f530d0a4354674b51566f6f723676363969366b317a596d763771715358373670767a53333937585a4d374b6c476c436f31476e424b31434e6c474b75765054736b762b44716346715068433674747a0d0a53524e4e6b6874336c38416b67416c686c6742386f4142494943723072466c3062475935495353547777514571472f68334548484a7a3872444b3862653146466350313747796b72347a46610d0a383766372b7033542f6d387675303052304c44554a4b3770553774743335492f596f755353303276393353786b5457554562785274436d356953366f6e544c416c69697268674d685332346a0d0a4f3349566763536e51342f6c486b636268383277636267646f7a6a4977415363453541624233446252525744782b4e6a4a4a597645325472787437617074474e302f6933314b6545772f4d340d0a2b79703254693075534e6c666b30322f767631496a6f364b537074314c4549477847674a2b624459365a79446e50424248336a6970426f716277504b4141634c79435664666d33734d42734e0d0a73774648476335774d3846465a787a484853356d3858694c754b622f414831582b346b766a325639504d786e686350795666334e5033557258684854574c2f6c2f764e44546f6946674768440d0a46564a42325947546b6b7341547444593563676a4f414152676945364e47475652434d644178514b517a42733542414c41344f51666d774749326e6b464654547a44477a684b2b4b784675560d0a75337471756a6a4a78763841483153752f4d547775486261396c42576847656b592f456c46667939622b7654597452364d684a4a6a334d47596443416f2b365267344933664e3870424f646f0d0a4a4f30437437536443527975363344637347486c38446267394d484f517779464f666d4a344a4f43696b38586970586a4c455670526168654d717333467033566d6e4b7a567265747462366a0d0a64436a46586a54676d6d6b6e79713638315a4c58533539632f43665359306b73647345514d633646637175475653474f512b2f494234326e4c4c6e717858422f617a396e697a6a6766545a420d0a436b5474456d346a62387973556b3550415938416a424751532b35677879555670484734745753784e64636d736256716935627052664c61617375564a6157566b6c61794f5046304b456c4b0d0a4c6f30374f634f613849766d35354f2f4e644f397431665a36376e376c664137544c613274724736694b2b65384145724e6854687957625a6852674d2b63754151754d446e4f503045384d610d0a7173617779473275676b695278534d4664315248597134436b676b684679724b647049487a414c6969697658717a6c4f73716c5275704e2b7a546c55626e4b3047374c6d6b354f33765072300d0a566a7a4b6c476c443933434559525535576a424b4b3164396f704c64477871363272574d3073647748587a635075507a427053787942674562515170335a794375534d626a355650637869610d0a514355714e7877446a4948356a4939443347446b39614b4b77785575576a5363556f766d6162696c472b6a75335a4c666c5466532f6f63394e6330705862646e4a4a58305369326b6c386a2f0d0a32513d3d0d0a27, NULL, '', '', '', '', 1, '', 2, 3, '');
INSERT INTO `pus_katalog` (`replid`, `judul`, `klasifikasi_kode`, `klasifikasi`, `callnumber`, `pengarang`, `penerbit`, `isbn`, `issn`, `penerjemah`, `tahunterbit`, `editor`, `photo`, `photo2`, `kota`, `volume`, `seri`, `edisi`, `halaman`, `dimensi`, `bahasa`, `jenisbuku`, `deskripsi`) VALUES
(3, 'Roald Dahl The Wonderful Story of`Henry Sugar and Six More', '001', 1, '', 1, 2, '', '', '', '2013', '', 0x2f396a2f34414151536b5a4a5267414241514141415141424141442f2f67413851314a4651565250556a6f675a325174616e426c5a7942324d5334774943683163326c755a79424a536b63670d0a536c4246527942324f4441704c4342786457467361585235494430674d54417743762f6241454d414151454241514542415145424151454241514542415145424151454241514542415145420d0a41514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662f6241454d4241514542415145424151454241514542415145420d0a4151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241514542415145424151454241662f4141424549414d67410d0a69774d4249674143455145444551482f7841416641414142425145424151454241514141414141414141414141514944424155474277674a4367762f784143314541414341514d44416751440d0a42515545424141414158304241674d4142424546456945785151595455574548496e45554d6f47526f51676a5172484246564c523843517a596e4b4343516f574678675a4769556d4a7967700d0a4b6a51314e6a63344f547044524556475230684a536c4e5556565a5857466c615932526c5a6d646f6157707a6448563264336835656f4f456859614869496d4b6b704f556c5a61586d4a6d610d0a6f714f6b7061616e714b6d7173724f3074626133754c6d367773504578636248794d6e4b3074505531646258324e6e6134654c6a354f586d352b6a7036764879382f5431397666342b66722f0d0a7841416641514144415145424151454241514542414141414141414141514944424155474277674a4367762f78414331455141434151494542414d454277554542414142416e6341415149440d0a4551514649544547456b4652423246784579497967516755517047687363454a497a4e53384256696374454b46695130345358784678675a4769596e4b436b714e5459334f446b36513052460d0a526b644953557054564656575631685a576d4e6b5a575a6e61476c7163335231646e64346558714367345346686f6549695971536b3553566c7065596d5a71696f36536c7071656f716171790d0a733753317472653475627243773854467873664979637253303954563174665932647269342b546c3575666f36657279382f5431397666342b66722f3267414d41774541416845444551412f0d0a4150325a7572684c53797537773450326543346e4a4948796947497556354a34774d396a6874787a7a583839486a4c2f41494b742f74454c71313170576c6152344b30524379505a7a522b480d0a722b57614b47534d53497369366c717478486350355a44656573554d4d72414d6c7569794144393466696e72482f434f66432f346a65494e70387652504176697a56574f436f4b365a6f642f0d0a644d47326e2f6c6f496c4734636c526a424f4b2f6a5074745175645231317863474754615135524d756f69574f4f4a515a4a4764694e696f4979546a42496a4142342f612f444c4a4d747a480d0a435a78557a484351784c6858774e4367366b55315355364f4a71315574476b705235562f32377235663170394744772b7944693650463250346779716a6d56484b336c5644445272653871560d0a58453063585871744a713273595534507238507a2f516e55502b436d503759567867615a34783056586b78736150776a6f6a434c47344d5664374351416c514e725a49444f75426c635667540d0a2f7744425158397579386b517238536f4c574e324a59512b47504338524d59437171674852474978393979337970796934556a487a426248422b574552684151464a4b73716c694778694d350d0a4f4e7138413447636e6b592f526e396b71366b3853614638554c2f784e6161547134384f364e7048396b4738305853476179497339666b64347042614c49485a6253324c753235795934327a0d0a7647612f593872344734667a44474c42777747476f75634a79684a556f7953564b44717a357278364a4f363638327a503233785077584158685477646a2b4d6e77446c655a34544c63526c390d0a4c4559645155616b7175615a766c6d545956556e6f6e4a563879684a782f6c684f78383161763841747366746658486b72716e78753858774e4a475765505454702b6b3232537a634b756e570d0a4e75412f474f6342657934774b3453392f61722f41476a39514c6d352b4e2f78507a3878667976474f7457796a42484f7943386a555a423477702b36654d63474b382b4d2f7741534e4b31530d0a7a6e683852535863494b744a7032733666706d73615263716b6e7a32393770642f617a327478627a527330626f455351787355696c695949792b372f414c5a58777338432b4764492b476e780d0a46384b61545a6545745138643661386d7665464e4e4377616439715853394e314e622f5472445945736a6250655357476f4c417356744d35734a52625258417535626a3071664265527a792f0d0a465972443448445779395533566a4f6a424f554b6c61564f4d6c37757372717a53317448757466736165593849384c38582b4848424f6638413552687356346c2f77427559626837485950430d0a30735454705937683741527a66465966485161714f6c537159467964504553554b667459657a63756153692f6d47352b506e78747632497566693738544c6f4548654a5048506963716364630d0a4c2f61674249353237686a507a34494f4b3532342b4a767843765866376634353858335448446c376a784a72467a75794370475a623654444e7577636b674567396356786b635a78496d31700d0a434154745442493235424f52313245634567456c546763564531753251656e5567454a304a47654f426b59624f4d48674467486e6a2f73664c4647384d74773849705763705965467058584d0d0a6d6e794e62707666564a62575033326e777477647a2b786f354e6b507436644e314a30593458415371714c3931337070536e5a637a5439793057306e7975794c3939347438545472497a61310d0a7138375362575154366a64746c3262424d724e4f79376532536335595a355775573148586454746b534b53396c763736376b3252785354534e676778755a52755937496f77794947357977440d0a6e35754b303770473870796f4c42465971354b6b445970326e63656d356d7965773478314e653966736a364a34613854664772776c34503854654839423852365434686678464a66773674700d0a3172655849625466437574616c62724266537039706767533773595a576768634a49794d57444145566c68637077574d78744443557348684b5573545768526735557158757971546a434c660d0a7562395872315a347647316268766766677a6958692f45384f3444453450686a4a637a7a2f475962443448437872564d426c654571347a457870336f50333455614575534c5475336270592b0d0a57727936314133734d447a79764e656c747742636f6b52424572715363694e417a4b6d34426d49647a6c6a474b644e7146304c5055357a492b5957476e576b536c67696d4667675948712b5a0d0a5378415a6942355955385978716168614330385461744b57387533734875745074305842326933756d55414e364d4274794365535430417272506839724e376f6e69727737446154474731750d0a2f4665675071554a6a686e687672582b307265656532754935555a486a6c4d6b697576792b59727568474d4135306374776a72796f4c44306f526461564a7a703465446a47395432584d37510d0a66567475372b464f793274362b4f70355267386b6c6d754879764c50615179745a6e683850504434476a4b756c67586d61705263715547357a6f303451307661704f4b3670503054396d48340d0a4c796674442f462b332b485633346c69384c36664a3451317278507156386c7648714775547761466168763750384b364235397263654a76454e2f657a324b523650597974656e546871576f0d0a51785369776547544b2f614f2f5a7a2b4b50374e6e6974764448784430786f344c324e3776777a346b73493533304c7848706245504864324e784e4845385633476a6f742f704e37444471650d0a6c7974354e33626a3932386e7066375a6b456e673739706e567455384e462f446c335932336772574e497664455a644c754e4e76375051394e2b7a58756e53324377765a33567464326f75490d0a5a346d53564a304571534b565848365765452f32772f32647632707632575048336850396f772b46664433784238486548764558697a78315954365659324f7166465856374477392f5a76680d0a337876384d74554e78617836563852626a5672665172572b30794e4c694b386e6534676b734c6a526233645a2b586e65437135546e474b6f7770304b2b4577315757456e46556161616c47700d0a474d7171744453366d705730747976587166676d4438514d377865522b486669356c33446c4c4863446364384d5a426963646b644442304b754f794f746d71715659596c53685262715364530d0a536f546b7450614b6e435631654a2f4f667146354d58654e694d424274595a4468777534386b636e447468536543636c69634566542f374450694754515032746667507172534658507842300d0a50544e2b534e6b6573796e513556424941784a447155734a474143736d546764666c532f4f2b376e4b59432b594346556c2f6d43344938773434624c664e3034794d4e587076774c315674410d0a2b4d76776e3177466f2f374c2b49336771393337676a66364e34693032646d4a4a4f416f526d594d514e75534d5a473663786f5563526c2b5070546f302f337542784e4f2f733462797774610d0a3653356439626233566d76492f654f4b7370776d59384d3852344e59584474347a683350634e464b6852356e557847545a70546737716a7a4b536c4b6d6c5a38796154577154503771336c4c0d0a484159484444444c304b6b592f416a5047436534476356455a6743527342397943663177632f6e5869397072463150416b6b4e334d72414865444b57772f414b6b35796551447a6e706b59410d0a347348576452427762687952314a494f54334f63487239667936562f4738616b4c624e367672627131667032746279522f68314c447a7537704e7032562b79623839473948626f63742b31310d0a717638415a58374d58783631426e387059666858343167586a494433756833646b684b3979306c777167416373516f484f522f48703465757251617250647a5354626a48746a4563495643520d0a74326c6a753341416b6768464f42314b35785839592f3841775549314536582b787838634c674e734e783465303354633547357637533853364c594f6f4279435448633754786e6e6b4867480d0a2b535852474a7535634b514273556b345963456b6e634141535733664e754a504277506d782f5648684a68342f7742685a765861316e6d6b494a364b7a6f344b445354386e55752b723133500d0a3948666f575a4c5271384138615a6a5635323852785668384b6b6d307558435a486870754e2f35656646743739486f6577786135626f796b7050674c746668506d7770362f506c7741716b6e0d0a6e64676a41372f70482b786a64573033777638416a747155706e74374b4454596a6658434a484c4a4842622b482f454e784e4a42435a6b382b53474a3359524e4c4348636f6e6d4c755a682b0d0a56535079526b68687436625151666d334d4d67674c387034376b35796367562b6f66374a422b782f73782f7448616874434f326d654a6f67375962656254774c63794134376858764d676a610d0a643068474f4d562b35384c3046444e593147302b54425a684e6538724e66564b6b3172317370617476727464486f66544979796a6850416e4d6156475531587a586a33776e79656e643373730d0a7838537547714d33756d354a586d757434707436487a31344b75663262342f45656d58666a585550694871747261537130615365466449743941456f664b5072647259654b6233577237536f0d0a7a6837757a307a797275346a4c526f7a4957696670503275504276785368385a6144347038632b4a644c385965467646566948384336376f55443664346474644b56495a3130323030746e6d0d0a476b794333757253374d687572303668625378584b366c64795739784461664a4f3943464c6b426d62355176473335515277674879384b4343647a6263394f7636542f744133397634672f590d0a2b2f5a746830744271643363332f684c546259323445386a58756c2b446464304f3973592f764d5a6b314257736d74674e377a776d4d706d4a6b472b45396a6a4d707a58444a52702f5636630d0a4d5854644e38733673767245494f6e555373357835717430745647546273317174504566413437773738592f4144694b6c6938526e6d453475346b7a377733783873346971314468696a6a750d0a4538327a7a4435316c74563839504134697269386f2b72596d704a306e58773858515533666c666876783930725850674c3436307277463448767233773770476c2b452f44657157392f704f0d0a4c4b383853336c3544634c71657436766652714a64516162566f4e51746f3757346d6c73625732746f72614331514a4a75763841785a384b654776694a3844504258782f306254744b304c780d0a616d742f38494c3854624c5372574b773072553959676a6d4e76346b5854624b4b4b30737451753434624f2b7659374f434e5a3474646a335237374143584b38622f4644516669643454384e0d0a2b4676697662613534622b4a7677795736384c77654c6250544c66563474623071306b57326c306e7856704d3135706c2f59367670397a616e5a65577a3371766444554a5a375346745163570d0a2f4e6154347a384c582b6a2b432f67717570367070767732752f69545a654b5048586972556f49624b2f7572693857773047573667736265347634744c306a5264476861574e5a6269396d750d0a4c737958397973533238466f75474971594e317377684755486738585156504451646c4b6869623049306b724c3356536b7169714f375467354d3179624b654f59634d6547474f78734d7a770d0a76486641484675497163645a6a536c5771344c696a67756a68754d367565593644753459756e6e6556564f47387779756c47436e547a46516f7776617861306e344465425047486a585576680d0a5634563861584776654955384c33577236523430303253797566426d70367a5a614842724d326b4e594e6252616c6232675a726a54704e556a314f366b687549737459484d6b4b634c2b787a0d0a6850326c50686835624f6a504e34706a624b4d58595365422f4570436e6151415666626e6e4f4f4d6b6b41665a6667335666432f77752f6147686a6b317a34566544766855713639704868570d0a34734e59384d367064367a59584f6b58454f6a332b7065494c6562553965686e765a476875623637312f55644f30396268354c4b33414c78515038414976374c39704e6f76375476773373350d0a5a7253356b743957314f4f65585372713231617952727a775872723754714e6a4c4c61534e4435793230356a6d6b56626c4a59446b78734b353368734a51782b53346967716172777a7964470d0a7171636c70526f31734a4b6a4c6c6231696c4b737661624e4b37504d7a5869666948694c773638664d737a57575a346e4b4b2f30623842784a6b466648345774537847497a6e4f2b472f454b0d0a6c6e654735584454466637506b4b72594b4d56556f34695849716263316433374f2f775a3054347466744461703459385152334d33687a515a66456e696658724e5250412b7132576a3631620d0a36646261557336684a593472765574547368666556356372574333734e764e424f3063366366612f463755662b453874703966306652377a77513369614c3756344d6a3048534c50544e4e300d0a4e74524146726f49747261476653622f4145717a5654702b6f326b304e2f384161625743572b6e76466b755935397a774c385864512b412f37526d75654c5a4e4c7537765478346c385761500d0a723969794731754c2f774150366872456f6c46673077524775626135746250556256354e6b5539785a433265574f4b655353506b3952742f684470586a4f37385744787842722f672b3331710d0a62584e4e38493257692b494c62786e714e6d4c74722b30384f616b312f704e7434643075526b32616471757152363366787777696139302b307670664a7332387879705571464f47476c546f0d0a346e4435786a4a3474314c4c6d6f2b32684c4453315476536a47465a4e4c64744f396d7266633454445a316a4f4c38387850456548782b593847357834456341595867716e6c38716b3664480d0a694c2b7a737a664675486d715653314c4e635457786d5253773836736639336f75484931546b65712f77444251694e6f506a36306852697437344e384f7a386a494a527452745163646c41740d0a7767423366647a30786a7266324d6632516667313857745574504658375150787138452b436642556b637a365a344e3037783534623037786e3467756b5174472b717664334577384d6153720d0a6273527a78507246374942424262324d624337727948397233347266447a3431654d744f38646544745831497957666862534e436b30652b384f3374745064333970712b71336c784e46646d0d0a58796f5955744e56557173696957513230674b624869632f436c2f664f306a6a6546387552696f5861632f4e6b45794873774a473063384145444a49385869364d735a6d325956734a576a480d0a44347645564b306179546c4372462b79557552745762556c4a7532326e53312b627756345934697a48364e506831774c504d617643664532523849594849732b6f5661644b706d65563171460d0a584f5654684b684c6e6c536c4b4377745368556e4343617536626268702f514c71482f425048396c72784838547834573057505474472b4846344775724c346e36482b305434663132392b790d0a5232374f706c304f2f7742436c6946374e4e354675756e53454c3563706d68314f5a596d7a2b577637557677342b415877462b4c316a34502b426e7850316234714e346176376536385461390d0a6352615a4c6f476e616842657854516154706d72365a7369316d2f7459304a316437573266546247597732734e2f633366323632303734726137756f6d597064544b585141736a4d6f4942330d0a684f446a47345a36597a6738455a714a4a575a3133466d596e4c4d78484f3761446b6c674d38444a49795153447a79666b38446c2b4c6f7971724534795749685539724c6b6c5a744b7042770d0a564e6176334952626a336679302f512b486542654a4d6e7a6642346a4e654c63546d5756594c49336c64624c7554544d4d636c56673879785533475037796447707979696c4a4f63553775390d0a312f61707057712b564842637835386d35686866617033497979496a6f633542497734623342396561374a627546314437674e77795163446b39654f4d63313456384d39554f7366446e77420d0a72426665645638462b46645245685a663368766442734c6e4a7a674574356d57494a37593961394245374141484a78786e42376450345432722b4d4b6c615644485936685a7956484659756b0d0a6f33736f2b7a78574968703253736f32747574442f49664e4d49384e6d4f50776372526544782b4f776a766465396863626a4d4d31706256665632326e31504a502b437032722f32582b78740d0a3439685568527132746543644f5541386b6e785470742b3639654349744f63676e5051416a6f612f6c693041376c6d4373446d5145747462494255374157494a4949566b62482b7a67636b560d0a2f53392f775743314d3258374b5668703564552f7466346e65474c5171796b457242706e6948554375546b46316b74424a747a67424d344a41412f6e702b467677642b4b586a3753353953380d0a4865416646586950543469356655394a30472f7564506a32736f5a47314a5946736a49674b356a4e774877636745562f586e687a6a4d4a6c764356537069385668384843766d324d6e5471590d0a6972436b702b797059616b3146546d6e4b7a356b374a394e542f5272364a756335447776344b596e4835376d32585a54537a546a6650716c4f726a735852777a63634c53796a42586a4770550d0a6a4b6f6f4b4c6975574d6c377a3154526c57466d3137653231716b317443397a637757596b764c7943797459586d6b387350635874334a426157317568624d3178635478775170756b6b64550d0a51735030772b436e6944776834482f5a772b4c3377383133782f3443302f786a34752f3453684e4730364c785870476f517a4c7158685054744b74444c66365863336c704548756f706f32440d0a79674973516158455247666d48776e2b7a4e34757535344c6a78366c393441304f622b31597866334f69586575366d4c3352626137754a745066524c43534f39744a37754f7a6b4f6e6d384e0d0a757438737471316d62684c6d45766b2b502f6839384976446d752b48376651506958725774365864527954334f7361526f756b367062775874696e6c58326e7a326a366e5a58616272746f480d0a745a5867614f347470677077734d6b722f6f5742347777655755616d4c777359356a5671596576536f526f56497a64536c69614d36636e43306e64636b4a754c57713264724338592b4b66440d0a7a786b772b4538504d70346a784f6159764c4d2b346634782b715a42686c696e6a4d78344a7a6568784e6763464c45726d696f56366d584f4e5343737077707a5354504d64523039744e76370d0a6d786136744c317253566f3275644f756f3732786d77464a6b74626d45694b6546773345693835335a775151763642667371364c702f6a58345a66455a726e572f486d6c576e7731744c62780d0a464870656b2b4c624d3652714f7353616434677647314454724337385033453368712f52644a6a68533830793561345a7269536153597343472f5069477a5a705a593763334e3545737372520d0a5379776f732f32587a484d526d697477596c59522f4d7751424649594c6b636a394850324c596b742f68422b30764d754642384d524449354443487731347866484445746b5348636f4142470d0a4f434d352b6a345678744c475a6c54684e4b50744d4869617462444f5363716366713873545370314970364f46534d45334b4b546c432f5378336653787a6a32483066366d6334584530734c0d0a78526c584548686657676c4b6a4c4d4d6e786645584766432b5159795571635a2b32777465706c75633570684f644b6b3759697244336b33462f49542b4c506870504c4c4b2f7775764c677a0d0a5353537a334e3738514e596e764a5a5a585a3570577549644c6868615a324c457a7932736d39675449765556324668384939432b4a666854784e346f2b45452b7366323934517442714869660d0a3462362f5061366e71353061525a43327565464e5a30367873453851576b44493658576d58476c5757715772346a6a6c75356275776976666e7679397370446e35646f427a6b6279633447300d0a634b517171447435353547633139592f7354617063574837514868367a686c4d6161376f33696653727743517276745974496e317452355979474276644673354153785654466b4463426e6b0d0a77654a686a63776f5950465170716c6a6176315a7a6772564b6457747a4b46574c31643155355731315872592f522f463343356e34632b466e46764866434f4f7858397038426350312b4a6c0d0a674d62573974676333797a682b6a68735a6d4f5559696e4a326a44475a56683862516f7a555a657971786f757955577a3554384665457266346a654f76445067362b3854364e3450744e5a750d0a356b75664547737a7870596166464261584e39494765536133686d75626b577074624733653568533576726d32747a4e4835686365342b4166687a6f506a545566696a344c2b4658697a78700d0a3466384146766772524e5a38525765702f7744435132397a34573863512b474e526a30795246476777615a63325032343668444a6f3134732b72774343386435573259457665366c2b7a646f0d0a2f6a5839715834732b423176354e43384965456d31547878714d656a3230553272507064386d6c6176486f50682b7a6b7a46484f4a50454d566c625376464c42613238473379704a6a44432b0d0a742b7866726568613538556648456668543465327668725134666831346974463171652b313357745a547a74573044374c5a617671563365706f61334f6f4c4663584d6c7459364e594f386c0d0a67577468354d456750586c3258657878644c4434716e7a4b706d6550775378484e4a7a714b685472555a5268712f5a7545343070716231637057576d3334783475654c32447a44772b3471340d0a74344b78556f31387038457644376a2b6e773073425170345042552b4c3831796a50634c50484a5559537a436c6d5753596a4e4d7472594b6e4770536f306350567156494c6e61666a7677610d0a74374434692f44333437763432744e4e31375766412f7770314c57764375737970657a363759587358396f33543348323537755635424849734b7771366c594e76414c467933787a4e4579720d0a4a6c30694b79594f3567444753685970492b426c325842624a7951324d59474b2b3176324c4e47314c58374c396f6e545949486135317a34452b4a39503069316b644c5637713475424861570d0a7a47575578775269573575315437544a4a48456d396d4c2b57726d764d76687a384776412f774156745631627744346238573676642b4e344c44574e57306e5744704e6b766776584e5130610d0a334e316361546169533858572f77437a37754c7a49374858376d4747536459786454614c41685742664f786544725976423550476c474c7846582b306144637252715636734d582b36684c560d0a63315251664b7270757a5365702b6b384e2b4947536346654966306859357a6a4b3065474f484834543851595655553852677548386c7a5877356e4c4d635a5454356f596241504d342b336e0d0a476d3471384b6b6c614e4e32335032494e577635666a546265463539546b6e3050552f442f697748534a5a3570744f4e36644b456e327a37492b62567276794c52523534693830526a6143460d0a477976674b395a6b754a55492b5a586b5667774f56614e696d3067644f325142776367484666626e3746303864742b307a344c67445241334558692b304d614b504c554c34523136545a33790d0a2b496a356e4247345942414b313865654a375a62547846727474747a396b31725662556759482b707670347363414435647042794239336e7269765078326e445758533056576e6d6561556d0d0a306c644c3676674b716937576255573557586476736537772f5671552f70482b4b574268566e48435933776c38494d396f306c556e4b67716a346938534d7178474b6f3032334346544552570d0a4639744f6e434c6e476e52353233474675595a797756534278774d67644f75443951666630363867516773427442773364734159783150586a474d38636744327271764333676a78683437750d0a74513037775a34613176785271476b614e7158695455375051744e753955754e503044523434333154574c754b7a676d65445472425a59526358636972464738304b467738694275594554780d0a4f797952454f6a44634742474d4c6b67386b5a41494248384f53446e4a7235796e55626b6d70336c4b45567936585875757a73377656744a666632503132654e7763385a5777437857486e6a0d0a4d50476a5578474756576b38525370563033526c556f715471776a4f4d4a7969355155576c3039322f774457662b7a42716136722b7a723845727663484a2b47506775426d4a77664d744e420d0a73724b55486b38724a6275707a7a6c63456b3137304363636b642b7534642b4f687830366533586d766b623968335644716e374b3377666d59686a613644714f6d456e4249476b2b49395a300d0a31554f4365556a7430553479526a4c6338313961373137524b77374537736e386942783034394b2f69446964547733456d663059516c2b377a6a4d49704a72345869616b37706161586e76720d0a64732f785238514d4f734478337870684a33697350785a784a535353322f3457387a714c30584a576a5a57547459317632763841345665422f69723451384b57336a2b565a4e43384a2b4b340d0a764669365a4e617666577572616c5a36646636645a32747a59495139394367314f5762374d7637755352454d797641727133685635347030447772346469304c773370456d586a6a577851570d0a6957576c3644596f51597a50616d574e6f6f7a73613152764b49646c5a6941463231732f74386674562b485032624e4b3841522b49764231313477735047567872384c57316e505a52584e6b0d0a4e4a683031764f6a4e337445686b4f6f4b6d315a496475334c4f656a666d46662f7744425144774e716a57747a34642b486d764642453863566865584e6e5979737370444346395667764e580d0a75576a42564657434f7a43737a506a475258334e666862694c4f705957764b474f6c6b73453559563038524b6a684974314a66575a31506668424e315953546265716a31745a2f4a317644620d0a7867346d776d5435686c325535746a65424979784e624b716a786a777554717171383435684b716e4f6c535570356a5235616b7075546b36555978765a7066665633385030386132567871580d0a6954787949336c534b326c384e614846627062334832653574376d796b764c53564c3243533630753967697674506d766b453055676d4b71595a6d6a4835312f48663441614c70756a336e690d0a47567244346158756a6174714d434e726b7473756b2b4f6f5a49495a4c6a78463464302b307672375572474668426279616c61794a4b302b7133547936665951543356313970552f744a2f740d0a46336c376178654750687059654872652f5637697a6831697876356d61326b47364b53653731473830654f4a414741575237614954534839337541436a775434304c346d3854367063654f500d0a4833696253376278566532756e686642455633663349734c64536c7330476b4a4e63586b6470616f57612f6d6a4d676761356e767a444e4b2f4c2f62384d35506d4f437875426f787a796e530d0a764e55734c526f5648697659303275626c6d6f4f555952643570536c614b6b326b396a395638457644376a44687a784b34557738754d4d7679624535706965616855796971733378464847550d0a597a704c4359326c5156534e476c693850587874475665724f4d497146323558562b50304834675265434c68592f4264764a645478683533385236674a344463334573467a436f6830584b730d0a4c61474e314e75627934575463726957445938697966636637496b386b3377582f61593143516f5a727a536453755a5446456b434e63532b47664538386a525177716b45455a6156676b554d0d0a5352524c74534e516971712f6d724571695646647052474756576449316c64454751664c526e6a523254444d716d56456473686e554d5748326e384b766a70384c76685034473866654249640d0a4f3865654a4950483172505933756f7957576861484c59323931704e39704c5357384b6178726950496958727a71306a6c4e306171555a527a2f52334232457765535a6c694d7771346962710d0a5971686a4934724556716a6c4b705671596171715368467478684832736c79786a617931315373663250384153463849635a5077707a724a754573466e50465847584650476e68726e4761340d0a757457715670346e423850654976445845475a79634a537155735053772b42776d4a71304b63497136704b46374b783865534f513244746a56647a7551474b6856557143666e2b3654304f650d0a65782b596766566637452b6e4b2f7865765047326f54785748683334642b452f45477436787131302f6c32576e4c655754364e456c784d51456a4d6c7464366a644b57622f553664644d6d640d0a6d42347064366e384549566e4d746c38554c326149445a61445650436c676b724141415065663252666d434e786b35577a6c3242667537774258502b4b506a4666586e684f342b482f6737530d0a4c66774a344375626c627a563947303237754c2f41466a785266516c544264654b74667555697539564542416133734c6533303752376667783663727047363734504534624c385a517831610d0a72547150445646694b464744636e56724b4d35556b3364387366614f4d70646b72646466323778517757662b4b666839784c346135426c574f796958472b57316547637a7a374d716270554d0d0a7079544e4a304d506e654c6f5533464f766a50374c654e772b4570702f774161764354693148536234672f4848784e63664766786a385776424f74616a346476395731335570744e76724f520d0a34627761475a42596164615863442b64466368394b7372424c71306e53533361654e574d4f5956326563366c3865666a4450724f6e2b494c66787472467472316d3838747463325538656e770d0a32706e743268764a44702b6e78576d6d673355547648636c374d2f61674d7a69594251766e6d70797841596c644165576a51626c42797a626979686a6b62515734497777494258414a3557380d0a2f77424a5a67747769493352476152426c767535776a62526737674d6b6e6142797772784b326234366453725557496e47553631584665374b796a694b3870314a79693934336b306e5a36320d0a5365316a3952797a776d344379374a6374797148442b585972443566776e6b6e4255336961455a7978325135426c324779334159504752646f596d4e476c68366e732f61786d3655713152550d0a32726f2f5148396b72552f472f696a57506a6871757433312f6379616e2b7a2f414f4d394c733952645a6d696534733230614454395073486a6946736b7343624937577774424773537842590d0a59414632317a483745747071656d2f4837524a72757776744f306e533762784459616e506432633972485a585631345a314f53336a314b573552425a79544e4569774c4d596d6d6b654a45560d0a773669766975332f414c56534837504434694d567244357377747a7145384673506b64354752664d5746705a4175455664306b306d794e4e7a75694e582b52316e4c3669626c706475344e4c0d0a4971504b507553794e492b5a436e7a664d32514333476338656a68754949306e6b7a644f724f706c574978474d6e377953717a7234696e5861386e7a303143396c37726256747a386e346c380d0a43712f454566483744304d78776d4177666a56775a77317766536a436e7a56636b77334476445762634f5536334d3779717972554d312b754b446b314845554537585a376834453857572f370d0a5076786e742f477669767735346c6b31507778716572334f6b364a456b466a42716d6e36705a61356f68755a622b3844537247347558654353327372694f62796e5579716374586c736d68330d0a76786c2b4a39746f667774384e6549745638532f4548785263786156346263327435647a3674726d703364306c6e6150625132304b575672464d445064335a6a6974726547653875355962610d0a4b53524f4a765946574d4554527973464738525a4a7a6a4f3579783667384571434e6f344f4d592b6c50324d7632672f4433374e587876303334682b4b2f446c2f77434974416e38506549760d0a4365704e6f647a46592b4a3943745046466d7468632b4976436c3763474b4b31317a5434444c44484b5a375352374b367662654737745a4a6c6e5479635a6d31617068366d455549665656570d0a7259326c426647716c524b453779563172546a474c58614b33756653357877632b4635353534685a5a687132623864302f442f42634d55385043707934624d36504471784f4f7976425270330d0a536a624d7352697356657a6b35567173477253752f77436862396a62396a3777312b795634653076346261683435577a2f61632b4b734e6e343338613672345830646458613138412b4364550d0a302f554c3734663652712b7061646361526f75673373397a46704f726135714b3264317264357156314e70714672445232736677392f344b4466455034542b4f6669354444385076416667540d0a777a34763052746274666972346a2b473137633348676e7850346d6d31696437474c52737732316a66546146706151516135346a74624b306931335870395246754a724778733779382b6b2f0d0a3273502b436f4576692f77547150776a2f5a39753965303751746574527065766645585764507464473859663849536c756c76706677313061356975372f574730367874684b4e64385536780d0a72467a726d7333643771635674396d745a33757272386346696556746f6b675975446b4f337a38594b6b4465705a69767a413549474d48674156382f67365661645a5979764f644e7471554b0d0a63576c486c6975564b5375766735704f396e6463756d682f5058675634642b49474b346f7a62785a385238777832477a624e3559694745794c3230345533435874364d4b754b773350374f460d0a44443464786f34476971635842776339584a746630682f384534395646372b7931345674566b7a2f41474e34683859366179746b375662584c6a566b43384447453152646f32384c794f65520d0a39322b59336f4431374a33507577503569767a502f77434358326f65643841746630386d4e687033784b317443715949524c7a5166444e3042674534426470694375647553426e4f422b6c410d0a64434153426b6a6e494a4f65342f4138666830466679463468526c523431346a68647858396f546e464f2b7172553646573661364e797630315034703862384c48422b4c66694668724a522f0d0a316e78324a6a6131725979474378693657752f724d6e33652f632f50582f67736a344c38642b4f4e592b423968344e384a612f346c6a3037542f47467a65746f2b6e335639466250714e7a6f0d0a6b4d4b334c7752794a437a69775a6c38787748413364454f507a392b446e77372f61462b4856764a4a706677676a76356231556c65665839437357767252346c2f647461586b39316133646f0d0a554d6a4d384c46347934336c524c38316676762b3035656d62582f446b55674b6f6c684941514f72656547626a3155624e774f56777749354c4b50454c574b6557323377775479524144664b0d0a736253497059674c766441417565636444324751526a79654a50704635787733696366774c517944433476415a596f554a596970556c4370586a587072474f6255576d6c47654a6b7236586a0d0a46575069592f54427a6e683367616e345072684c4c737a79544a71324a77395845564d52566f346a4654715936706d63716a6c526b7077554b2b4c6e475354584d715354507a41752f4448370d0a57657353586270345675394d6e756d42653674623353494c71474d35796b5574377263367849774156354959684b41506b6457474b354358396d6a396f4857623658554e56384c58563166540d0a6b5063333270654a7444754c6d517169375665656656707043462b35687368526c5146526c46667271736243375731643169627a466a5a32624b524d57436c6e4b686d436f546c79464a35590d0a4b724d414b33626a534c375437752b737034476c4f6e546931757072635050627137536c594a444d6f624d64304148743266615a4664514d76587a47422b6b6c78466c555a504b2b46386f770d0a2f4a4c6b6e555548557138334c4b566e4b616e4b3059776e4a576174797433504a34532b6c336d2f426371754b3454384f4f46737678642f66786b714d735669314f55587a52703171304b6c0d0a536d755345327552786c644e383132322f7741684c58396b6e34315342532f682f5434526a6776346830556b59424a7a3556334a6b416b6b6735334545415a776175502b783938596d32794e0d0a616548376338353837585954673763422f774231464a6b426a786748674f51546b412f7370652b4846696852724755334d3045636b576f787a506251623951673379584e7670614e634766550d0a49375341782f614a456a444c4c76554b774b317a5775614872576c706153332b6d3356714c395448592b62453232596849705757494b446e39336351756e546372426c42475373356a394b720d0a784868436f6f59444c6f386c704f554b4c63494b536a79786b3148663330764e70323056333972582f6144654e664e4a306371794f6d6b3475553434647a6a474d6c424b4c3978326b6d326d0d0a2f4c73666a383337463378656c346c7650434d524f31704e3272336a624e7563674750534a446b372b514d6b6767376a39366c4837446e784d62506d6139344d69326734582b304e576b37440d0a6e41305a51783579783762546a63514d6672394e344f31704a5a426232747a6547337362473731426c67324a70386c37624c6469336e61516747574f43534f61514444786a4c4d67534e6d460d0a725366444e2f5a367757316d3174374744536b75372b36693153347472565a52596958795638716156486d744c725559344c42706f6c654c644b647a37534d2f4d596e3655506972557177700d0a6375416f4f5456506d2b72766c696e7133655556736c4a336536672f4e6e485036663841342f564b6b4952575459654c714b4d5a72434a52696e475433634665316e642f335875666a524e2b0d0a776a34356c596661504666684246436c537747727a4d414e7967465037505162675170474d6371535164334e53663841594438574632576278313464675569504158544e546e645632426b590d0a4d2f6b4668795855676a615076626867312b74743162366a716e694f792b327742593956763950696165325646734a3175376a37494a6f3534737748375162573459796877724d6c772b33350d0a534b776645657174714f7158456b3177743335516a742f7461444d63697770743252626c567a4243786143334c442f6a336a6a55414b4646664f597236556e6971716370527a4443553756490d0a30347236736b7078664d2b5a4a705839336c6c706f377658513862452f54382b6b47347a6c2f612b58554b634a4b4d4644424a4f616c4755755a506c317647484d767536732f4b2b502f676e0d0a39724167325366456253305968515444346575704430584935314f50674d4f4d6b4535783875414b7532502f414154334a6b417550695767414f63772b4743514f43537169545779416341480d0a4a4746436b624d456d76312b74373233306e3465364a716d6e364a6f4f70744a723273366634686d314c543472363445725157556d6a78504b355337736f70625672747263327373556276620d0a7953466a4d72686e324f6c2b4766464d5635714f6a5763656853616634647572692f734a7461746673386d735738316e47723263643749313542707371584a596d646d587a6b4543544b77790d0a32557670472b4c645a4a55382f6f52725663505272714d61435634566156576f347864306d36617053553161366b724f7a4f50452f54652b6b4e694977396a78586859316139476c694955340d0a594f4d584746614d3553744a4e58634643536b756a74644c702b537a6638452b39416a4c47342b493271734346442f5a394173346c59486a475831435167416335413359354f536343482f680d0a6754774647435a2f48486971584743646c6e706351433534487a52536a6e4f574f65514d34484f6631486d384a696147786a75723857477136736b732b6c36624a61794d6b3976424e4c43730d0a743164466c466f62716543654b31566f354664596a4a4b3055556b556a4c652f444b2b733276664d31437a75336930744e5174494c46784c657a4c635773642f594761316261384d56315a6d0d0a643432547a33566f676b797869524b3875586a313478346a6e6c2f7248565335593651696f70526e467a6972632b386f786e5a66345631302b55786e307638413653474d556e4c6a4b756b370d0a61516f71484b3571707970726e58764e4a537331716d666d46442b7762384c397845336966786e49447934536653493242427a38796a536d794d6e6e35514132304849797833626239684c340d0a525262642b72654d35746f78744f7061637041786b4d4d61506e4a47635a4a484a7775427a3936654976446a6144725230565a7864334555476e47556f712b574c7535733765346c67696b440d0a73736b634d303751724b43504e4342674d4535705361654c5777463363534e3530737a52524a484a45792b5845694f386a42574a594d4a5556482b346f427943474148464c787738574f61700d0a437078526a6b36546c47705a4b4b673470536c4834743270704e61367057523835582b6c54342f5478466546666a764d59796f4f4b715269306f783559303778563532766570306537656c7a0d0a552f5a512b4650685834522b472f4648682f777132714e616168724e7271747a2f61643346647966614a4c4557525a476874625655426a745558376a46696f7978434376724d6841546b71440d0a364e31353535342f4c3272776e34517a3566584973735359724752577953515661346a4a35787951774249395238703572334d534541417143653533456b2f552b7672333965612f5765484d0d0a377a4c69484963757a6e4e4d545578755a597147496a6938525057705671554d56586f4b63395872374f46474b665a4a48314f5263553574786c6c39506944694448564d797a6e48314d52500d0a4d4d62583171313631437173504755326d30354b6a436a424f2f7777527a483752386d37784e6f516457594777754d45746853504e69425a65666d596b594a364441417751515049374457540d0a61577277627047457478617945704d38514d4e755a6a4a4157586e39365a4659466c4b2f49666c5049723048396f7138332b4e5044747474775a5044776c514167412b6271327077444763440d0a356a6246636a5033447a6a497268626a52624731314334733435725335754c4c543449587330755a586c625672794b4330437450476774304d477058575441732b4653456f2f5678587948480d0a32437156654e2b4a6e54693034596e4130584a72577a796242536b7464354f4d322b725474716b7a2b6238624364664f633272556d6e4b575a597053652f7831616c46525731332b3462646d0d0a7447746831397231706552784a4670384674496b3873733038597a4a63752b33627664737546546f714b3230746c776f596b563763336a76773170646938516b462f633678346330712b75760d0a7336724c482f776b576e786162445932643776634b557458735a3771355a527931325541596b6d7649374477494c696538746a346d307753324c5764704c3545636c78476453765a4c7547500d0a546f704552524c4f6b6c71533869664973524d6a62536851316e384a542b65747661367062584e323976704d35744172527a5737366f4e504d66326e4a38754b4f4d587a4f307173344168490d0a4b6f7a63664b4f4750776a71546852684f56574d4b546235576c4f6e3959707953685a2b394e564a786233764854593177384d64687661564930597431465a50537963584b6d31792f7741300d0a6f314c5830656a317463315a50474551302b30747a5a62745273317549496452467a4b4e734e39635454537539715977736c3244504e46484d5a43716f557a47576952717536683855376e550d0a5974516976644f686b754c692b533473355463546f644d7434374b3173686157794647784549624b455345744730716d5253344c737a63426f6c37626158346d734c36364c33476a324773700d0a46506669316161334c7137694755787949774a51494c7449435332314364704f516453386e317a56627a5576432b717732463171647377764531695745535836517778764a484648657746500d0a4f7464525765446d39576352695247426a77793138395571597232556b71736f715570345a776c4653553578777a564f393171326c556a4357796e54636e377931796f7978733656566532390d0a6e4b626e526a54354c777153703032346538316f3558664b37327642743747377148784d6e76724f57306543614e54716b65706f59627834496e6c5730302b316d7437324b4f494c65516b610d0a657232796c6f7a42356a72756b42474f4d316a787871476f7a36394c63534c4c4a72636b766d6559383867744935395268314b614b317932314665654748654e764b494e6f42724f742f43320d0a7258756f582b6c78545764764a706a36676a334678493864744d326c704c4e644c424959324c6862654753547a5447735371492f4d614e70457a637350426346356257306d6f366e4c61537a0d0a367670756e54527043694a4262616a59366865766545794d5a6e53312b794a477a694259334a75466965526f736a777356537a5045536357704a7431467a536c7977584a47644b70726f2f640d0a39765553733957394f61786855575a563477546d34726d6c433931474c6e546a4b4532337064726e6c7274727532534a38524c68645073644e545472455236632b6c5845547530374e4c66360d0a5439725343346c4b4f675a5a597232517462734447737a476463504934504d54616a706a366d6c326d6b70487036545179533663627164786352704b7279774e65664a4d697935644e364b480d0a68556a62754944486e2f73326d76713332573331654d61627574576255706f5246356363776857566d67615145766253504a6c46593778457a526b67714b324e5130765162534558455869430d0a485551644d65526f42746a6c6a315552524d31717165644a756968615a537375316650654f614e564255452b485044597176486d6e4f456f304a5153356d6c5a517643466f3239364b53642b0d0a7253562b6a586c315858723037546e47634b44676f74325675524f436365366a47445430664e7a4864326e696a776c6f3047756e524c58573556317a544c75776b304c56545a543652614e4f0d0a43735537334b4f5a74516c3031695a394f6d4e74617a787a4b6a504b50336e6d6335346531364451333146726d794f7057756f324a302b65334d375772594e336258534d6b306153664b73310d0a70454a554334614e334376457852784459503466747643326c61706461532b6f4e663672715668714e33623668635133466939744861506151516f41397245303045737330663269435558440d0a427772447970564573656a366671747a703976706d73584d6d68332b73336472626d65304a75724c796f625a2f744e3362724d6b41566f586a61366b696d3278773237537551414572304a340d0a53744b4f476e476346566853356f516772576a695979616931316a37386b3174486d61386a746c44454e59537043564e546a546971634961572b7352557236765744626e7a4c614e3374617a0d0a30395638663668716c7556756250544876596f726d30683159517a4c66576c6a65334d39784c5a516e7a3274316a6a653675596f4a6d684d304d4570695356564337593941315057396538530d0a2f627265366464516730714b325262587a4645747462574e746f7476627559636c6266794368766e4977317648634d4d45386337346b30464e4e317550514e4f7533316153654330654336680d0a6a55576c2f4a654445626166496b30706d74692b496f70535659796952576a6a4d5a41365437507039686f31354643686b755042577275504547705754795266626c7674506d686e303172710d0a4a684939716236774f6d49697567645a5a4a787a4d78463462443470314a4b744a38744a70314646704f6371634f614d553138546a546c4b5366534e4f396d4643474d71597172444556576f0d0a554f5364546c61536e4b6c475531474e72586359586c652b30477575764e654a4e65754e523853332b705261684276533832326b6b61465934344c497062577977524c7552496f34595979690d0a354b62546a47446b59736c7a647a4b676b763458554e49524745434b717351575655776971473237634159554b4171674147757366513946576138766f4e486c754c4738665272694f314e2b0d0a3859306a54745830324c555a72356e336c6e6a6775504d74626153597952714948535954534652576e592b4776413133724e68703758326f74356d694c71306c6c4730447a33724c703873340d0a737247544b2f365738304f664a5a53574d6f695444526b7631764131717457707a754b6c577165306d6c4b334d363032723632567664684c79696b30545041596976694b7a6c566a7a56616e0d0a4e4b386b7561565370506c6e3062692b564f576c6c464a64626c3334547a686458314750636a6d62545151564879356a7549543877556441486242424949596a726b7239414c7449426152560d0a4a366a423435397550797235752b48303970443433314332736f376d33744869314333746f726c6b6135534b426c654b4f34434b7143554970336c45565379746b48725830487650596a48620d0a41552f7269763643384e6f796e777a53676d7633474f7a4b6c6f744c504530717135566234625454576d7a3748376c34634f482b72634b536c64304d646a715575577a313536556d39656b6d0d0a334b393365392b6a504d2f326b37743750346c65483438536f38486737524a6b57594b6347347574553142576a55676c6f472b30626757444235476335783933786966784664504c657a2b610d0a766d366a6372637a796f6978794e4f4c687268586a5a527569627a4842477a61633952387072785439742f39716e526641333753477265445a4e42316a564a394138456644425a626d4f2b740d0a4959532b7466446a77783468614e465a4a5852597a712b44473054374d4d4d6a41422b54626a397447786468356667712f774163674639626942494f5467676165777975772b6f41786b6e4a0d0a4b2f6338576546664847593855352f6d47467965764c4334764e4a56735056765a564b4d4d44674b464f7072485a78705369744c36743964466c336742347335757637547748444f4b6c67730d0a7871547a4443566e4a526a576f3471706963525171713864464b6c5669345832356c7475666f382f697655786347374f7033516e573467757a4b72694e6d753464346a754e7351434e4f67640d0a694a57587a435a48354c4d7a4855307a78524a6152366a7262367146314b4e4937654a4a5a773131644f365048437949574a6d57326c6a676b4c4f4d51704743754845525838734a2f7742740d0a5a6c5668443448636b535a41665856424247643744627059344a43706e6853546e4a59416a6d376a39747a565a482b54774c6152465357784a7230727367596a44414a70534b7841774d41630d0a4b70594251515438765638472f454f5463345a524f366e4b554f61713765306d70526850345837305a536e55306133747066543666422f526b385a71736e7935412f614a7153705478634f620d0a6d6c6555473472564b3762765a58746f3266715461654b745430397268724c554c6d334e3056655a566c4c4a4d325151386b6268314c6f775a315967536f785a67796c6d44514c346b76444e0d0a4e63432f756f376d3853534b37756a634d4a4a556e42457954795a444e484d47777a506b48674e797648355379667476654a7849797765446449554b32465758553735686e6e623932336a330d0a594a4259594f3553724b526e4659476f66747a2b4f5541387677763461415241337a7a616a4a6b6a4f33422b30786b6b4141672f4d6f42414148337138642b416e69545563464c41556f586e0d0a7a4b4c7232744a707076534b7530707974665a79646d6a306148305166477a45614c4b4b4e4a4f546c46564d556b6c4f4b3162656b72726d6e726671336f6d667362632b4d7237772f5a616c0d0a613347757833393171466e64616261773231794c76597438493472792b754c304c67782f5a5932743449424c6c354a466c5a4545487a656276346a76357053373374773255524756707045440d0a5278445a48486b734152476937496c4a4156573532686d33666b44642f74722f4142536d6e5978614c345551685165626655705375454c645731456267754f5141666c5573436f507935712f0d0a746a66474a334352572f68644d6b6c516d6c33556a6e4b73784369532f644d414b6348595371416b6b594e58552b6a78346b3468714c70596145456e7970346d316c4b584e4e506138704f320d0a2b74724b3239765266304c6647334578687a554d746f5534787461574d62635a4e38303232704b37764a5166666c50324757396c5a73467741783337742b51526b6e4f64754d446c57436e630d0a4f5351654d756b76376547574d732b384a746b436e3577785168734d50756c636c5156594e7548796e4b37675079426a2f61332b4d6431477369366e34626a4a583531476a706863374859490d0a4a4c6d5253634467394f437650436a576c2f61632b4c63746f736b6e69485468634b69757151364a703861504343753549693863685a31514d5170323979344a7a56302f6f786365564936760d0a417764302f77434d374b2b6969317a4c52757a31394772476b666f4c654c7163506156386d7070796b6d6e696d374f366175766157736d6c66585a746454396e4c6a787a424a70756f57466a0d0a70646e7062617974732b70665a6d7548686437656462694d3231724e4c4a623665444c744a4547476a526d696a4555556b6b645a746a7264354862473367314f61325366656a77786e43736c0d0a306b61585374754f63544c48456b714b773370475559344a782b4e326c2f745966454330316178764e527535395530654b626671476d784e704f6b584637444668336854555530585576734f0d0a2f7743556d564c4b365a4f51716b6b4f59726639707a346f3345727a53654a72737867626c6a6754544931794d4664372f77426d626c4f52743271446b6348414b6c76526f2f5269343571310d0a45366d4b7936456c474d5661706131503332314675586461397271316a314639426e7861714e7a715a6c6b744c6c696f526361726168427562635637335236333256347265352b794e2f72380d0a6f74374f49366850494c435551324a4d71774a484e6433495a494c646e4b65574a6279644448766b52566c646e4a554e75504e7833336a7533315458644c31524e4468384f7954474f79476a0d0a2b4a5974543154567279334d544c706c786f6c736b6b6961316133447a373743366b67754a66334d74674c324f55765835372f412f7744614838653635385a666876704e322b70582b6d582b0d0a6f79324f70577470716c756275356e6b7364527545756f76744f6d4e62514e484749597a434c615a67676d654a7650654e552f584c776e70396a643347723674716c703452384e584f6d6d300d0a6e58786234774d567072316e5a777a6d5748523963384e37724c57746475376535553333672f78506179324e3947397a4a43742f484462523239332b6c634766527277574677755a773474710d0a4c453479633656444450435648476c52703161456b7171626c3731586d5571627664386e4c7237316e2b6338572b41755965476d612f32427854694669387a7a444c364f4e777338484b55710d0a63634e5772566350467761556e4f747a59657047535637516d6f366133386a5878414e627364506c2b32334e39427039732b6d77787a52795774785a7262584e784a4c5a334674634c4464770d0a76627a79534b397665527138524f464561414161636b4d3176487039396332656f573172664356744e6e6b523462613653315a557544615845696c4a56685a3057513235506c6c7359484a720d0a3541312f39705834553350784a3852616665542b4f375434563637504672454f7653334f6e616c34753144784c34576b6a744c505868664c444a3467307178386357396e71656b613359336b0d0a307a7961644e6f5638326e36653679334b2b622b427632314c33584e61385265482f6a62632b4d4e572b46666930323064727033677a5562537931543459335668716364377075722b4237530d0a36672b7978665a4c495865693672614a4a6253366e70462f646d65356e755934316c38542f69575846346e4535777147627146476a546a4c4c5a564b622f65314a566e474c717579765470300d0a36636f7556302b5a526c66585830386d2b69747872784467387a7a5843564d5252776d45797a42356a68616549705470346a46304d58586e546a546f516d6b35317350536f346d7456685a740d0a526f77576e744e66314c2b4730724878546150627853344b585a6b4b4c49354343334d6279794d4d68593161534a576469717137416b37696c66556174386f787649786e4956756338352b550d0a676339656739786d767a49384a2f744b617038512f6933384e2f68782b7a666f666a32332b4476684f6534766647327033336e7a336e694377755a4674727656504530737233456b4f6c57720d0a4e4159686433496d754c6d5a70504a6a435178522f704f71544656496151416748414a78794d6e4743426a50516468787a3172716e3463312f447242344c4b612b5977786c66475378574f710d0a314b4d6255345462773946306f57657153707079643365647a74775868336d5868356c7542774f5934716c5046357373566d6b734b3552654a77564c36315042304b654c684676324e6245550d0a71456357715572536a5471787648712f77482f344b4d7a46663231666a4168582f6b47327677313033626c634b326c66434c7742706a717a4135445274615349366c6746787343376f794b380d0a6f38482f41415976395873374457504747733258677a523957384e61703467304f2f31534b646f745557776b57324562584d617061774b6a79773339354239722f74524e4559366a425979520d0a7a51732f6f332f42525055744d7638413976483971654f4c3978706d6c66484c7831345566374f79677062654339657550434535684a44726e47694e747970472f77433868436b4e356634700d0a2f77434655367a38514e492b4833674c787a3437682b436d6f4a34637539653150586e43545161326c6b6d693357734a70736c72623278454e35645178524e4c434678504c4643734e7646620d0a6f763841634d4d54484659656e5835644b304d504b45473146786a56706330564b2b6955494b4b62364e664d2f774246387178754a792f685068444c4b465356437248686e4154723134552b0d0a66326444415a4e6c7453716f4b392f61315062336f713376326e48617859384c2f74432b4376686638564e5a3854654676425a31487768716e682b4851352f43747a635157634b334175644f0d0a76576e3036394d577053756b4678594e486233643147317a6357317a4d626c5138736a48527474512b447678763044556f34624f5877743856496f624b4c77396165666136667074343574640d0a41733954753959316d357a486436647062574f742b494a336e6b5855685933397a5957466f6f30375434377635632b4948777938542b43622f566f62375464526e73644131473730625574570d0a4d506c3241314778756b7364526a676b44754a4c617a3143574c547a64674c43623874613545362b575070663433617a6f58674c34512f7372574f6c2b43504258687234673668345a6e2b4a0d0a2f6958556447304f337439533144536272557a59654176376275726c377139314a395330757876645431574f366c61336e754c6e657345635152453456576d6c56565745464346357a6934360d0a336d3354664c4c6f37336c472b6c3476657836754a78474470347249336c6c6646564d666d316147427059696e586c4b4e4f47553566693830645845303775507335306e5370566e5a4e2f570d0a615365746a354a31354470643365326b643074316277547a6d32767842506177333971736a72625874744664513239796b567a47676d6945304d5575786c453277686858425865714f5a41430d0a5143324363354f534e77594254754141347751534231787a6d7666506a6c3476306a786e592b462f46632b72364c64654a3952302b326a314852394847704d64493068496931724666584e390d0a6558674e394671413145506168346b74724b34302b31734c6132303633743757332b5670377447596c534467746b74786c517a59776651446e50484741536347764e72754e4f704b546c666d0d0a393558747331477957756a5331743033376e36526c6564314d54677156657175537376615571793572785665684b6447733432636b2b626c6276666539306e477875433763754d4d546c6a300d0a495042414944662b50636568794d644b7678616b5943575270433444713247325a6a4b3754486b594f48556c4741474344673542353569336b3878315647514d374461446769526a794678780d0a79324d4c6b344249354857743639306655744c6d573331437a7562473645554d72573937444c6158434a6432384e3361764c444f6b63714a6357317862334d54464e72777978794b53724b540d0a454b6a626175725362747272377174666432546262394e765076656230484f4f466549705045315979725170653067366a685473357955464e7a35597555564b54696b6e4b796b62316e4f410d0a474c4f4932786c577972464d466979347778636b41714477426e6a5055395a44652f384145726b325362456943755a7056797877753143697166764d344345413458647963414138425a32720d0a5463744e474d45664d703348424c5a4a594b774856766d554b4d71526b6e355433467659704261736b6c376d4e7a476b676852694645696955414d77565143796b4f4d344c344b35497856770d0a6c4c32636b303432577236747053355874335365694d38566d634f614b315376446553566e4758764e36374f4b76757459713774737472597450414861353373775a6b6843744758334153460d0a6e6b594e487434556255637578786e61426777323055304a64687661574e33424d52586169483553534647346f474b7143546746696835504f2f70476d5461744a62574f6d7733732b3144490d0a6a74494567573355626e75586679315347326a32675353797971754d664e6b684439712f733665462f77426e507737652f774443626647365650454f6857552b6f51615a3462537a315755580d0a2b73577136612b794c544c43514855644a6a68314553764a7143785773397a43696254464449477a574a6f786e436c4238315678764b7a7571616b704e79714e61704b7a56373365317454350d0a486966784477584465585638584f6a694d307138314346444235656e577131616c6556534e4b6e65446c47504d344f626b354a4b4b636e6f6b7a3547384370343568385236667266676d48570d0a4a4e6330653574622b3276744945346c7370524f7476484c4a4b6755516934655a62664d736b5964726a796c59732b472b6a6648552f37516d72364e5a5733694b587850714f6e334e7250710d0a4774586c767079793232694e4137323332585574634d56784e624a447035686e76306b76493470507445545469584172394876674c385235506a543852664539703444384a2b4176685838460d0a66436d6a76714e353457762f4141525a5336743430306933654f4a64526e6b67746b7472615051356c746451614b487a4462537978524e4c4c49373364747933376265735233507759384c320d0a66686a54726e5164473162346979525838316b69366446722b6e36666f742b39736b326d574b323172444174772f326b325a52316c61474761514b323161776a5478646245777277725531670d0a4b63717a6b6f4a7431366e4a476e4263332f50756e4b6f7063313934575465725838775a37346a344c6937784d345379334d65474d745762777847446f55703479554d544c42554d545378750d0a4a2b723478336e467a772f4a5045657a62616a56644e4e61612f6b47746f69744757733771575243496e5a35555a58436c6c4c42797577726e356b645931344949414f612f536a396d6239690d0a434c786a345466347a2f4833565a766870384962614e5a374a705a4e6d752b4a6b6c63525176617865544b316e5958457531494a54424c64337a45437a6738746c6d723469302f54344932570d0a4b2b6655626552504c4b517a574d6169565a56575349712b2f47783159746c3841686c4b735572393976687838512f676a385376324f7641737678797564556c305034666556346431714e390d0a5475394d764a2f4550685548544e48744a6c30692b7462362b6e314c524c7577314733566849736954504e4e4b4c6d336e49395846304a56634c4b6e68354b4c71553342386a55624e3075570d0a6d6b315a78546b3233745a72717a3772786a34367a2f682f68724b3463472b7a63387778394c4c4d52694d44476e577234616c58773957644a34576c52765a3171304b6c46533559786a4a750d0a337848316c2b7a377050774474766876346b305834496142486f336872526c75374d613148625846722f776c4c72706f6c625656316936555436316143396565787554635373497275796b6a0d0a38744978417a6334497951436f794f674a326738636431504848427a794d48765834742f46663841624838532b4a4e55305034652f434f47352b466677583048566c6a30587735704e3031740d0a716574576e6e777a334678346976493535726d6472713546786353514e65536f544d7a33447a7a6c33503753574c65645a327377634553775279416c55596b4f6f595a4c6253547a7a6b44420d0a34364376784c7856777270777947705553553144473070796a663370503676557431646f70365072712f542b544f4c4f434f4b65474d4c6c57666354346d70567833464d38586949304d54550d0a6e56784f486868593464705969556d2b5770566a69497a396d6c465531377169757638414d582b306e343169316239712f7743506e6a5656743770645a2f61452b4b33697a66654c356c74630d0a6a56666954346a31705450477049614f543757374f71686a73623551514258436674466172646168632b477645576e33734c36526536485961636f737263615042625132727a706f3173756d0d0a53616a66616e6261624e7074686233476b5361306c706561684662507177736f6f3771463565452b4a576f6d3838632b4f4c325849613838576549626c786a6171744e7246334979383941430d0a2b417879634c387859676b782b472f6a5470476d36412f673378726f612b49394862577243344d31307a334c327569325a576138307a5359476c696873727a554a624f7a74447145653663320d0a7a786d667a6b3037546f6f2f3365713430366277696d71564f464f4e4f4d3362535642716e464f323350546a736e5a58665a48396c5372314d4c68736b7234654c726632666c3243774d384e0d0a4633565369737677644771314834584b483165456f717a54696d7462363946384b627a34712f474858644f2b46656a7a5848694c54746376594939595338574f63574f6e61687264316358570d0a725839374a4c44636d303072577465756645716f393031764a71346876627131756e745955547276326d5a64542b4a6e3755766966776a6f6c7448704e6c6f4e3970507730384b32327346740d0a4d734e4c384f6543394f74394173376d575734424e76706c30317063617244496b546565743850733855736b7361796543576b5867453242316931312f554e423132447767646553317374560d0a696869693135764563756d322b675774784e474c733343614d7161314d797a7330596c4675417a5176753050456e785a30447735636178487073762f41416e6572366c6136333464753965310d0a36346b314f505750444537577376686d36315737756e2f74434878486f77674d4c70706b6c765a5041747641374552794b33473669564a787131464a546e43546d355876424b566f6158616c0d0a7a53692b76764e2f4c4b4f4c6c484f36654f7755497059584c3866684d50686b6c474e4c483479706846587874376644395677736143736e2b37536a6f70613972385446385966457a562f680d0a3538436642667762304f447876384e39476c304c564a2f41616e5539523858587a2b535a7462312b2b6a644c594b4c4b3230393769347631696b73726b3353335539744555733766335077680d0a2b7833384e66686a4461617a2b307434743158572f454a68756278766844384c2f4a764c75776873376565376c54785834725a78593665556874324531766153516650766a74372b345a52560d0a662f676e44342f6b7639642b4e2f77386d76354c547844385150412f39726146715676494c62564a4e523043572f69756261432f446964576c6931784c6b5278757259744a4a41774b3768390d0a4836643841764545642f4c7248784b385861503448384757476e366c4663336e697934307566587236435762616b73646a4466693358653068754264617263586b72744d5976736243526c480d0a7a5761347a456532634d4e68336948567077564f4e2b56516171657a536c2f655549516e657a556c4a7439543878347734377a764c38526d6e4332427874544c486c394c445974564b464f640d0a58465a6f383255386269617442786a65464f4f4a71346968474b30692b52665a505076687634352f5a37385061763457316e77522b7935704f6951335776364c6257766950783772563934340d0a6178302b397672614f38314e7250557274645074627933674b53573979566e6a67627a456a5a706d324477542f676f50484a5a6674632f452b515738634d4e34504346375a2b57796d4b57320d0a627756346569696b414446565657696b685645514b69784b6f58614d6e3262784a2b314e2b7978384b3951754c62776c70336933347836376f38736a326c316658466e70586732625672654e0d0a59726534645574316b6c6a7335342f7445486b575032614f52562b796f69674d506e33772f77434a39582f62592f61543076582f414231426f3368625155302b7a5878526557426b74644b300d0a507764345969755a59327672322b6d6b655336766430576c43376e6b79386b397647697146564265416e69344a777864536c5572547278644f4e4f79354b6673704b53623058385355656d690d0a56324842754a7a6a4a38366c78746d737379686b754634667a743432726d6465616e536c695867712b466f3465684a704f664e684a303037536d35596c52585a65752f737a6673626a34732b0d0a4239623859654f76476c2f384e744c62544a7465384e616a2f59503233533733772f595872575771616a7156334c4a417363647865534330305330676c573676477374527556694e7549486e0d0a6f66484c34462b4776674c38524c6a777059654b34666954463462384f575776367574785a7670672f7469376b6e6e7376446b384556314d786d6b73786133747738567848496c74634648380d0a755562522b7a326c3357702f4350346561663841327271336857362b4850676e514e59315458326a73496f497244776a6f756b524c344e3050524c534c39334d7a766265644e6433516553650d0a6155513235646d42662b656678563434316a7878722f69627862713073386d712b4c746531445737786d4c4a4548764a5a5a784769426d625969334432397358796b56756b61685341716a330d0a705268536a54556e4a565770536d33725a636d6b576e3035366b576d31727961396a5067486a6e69376a7a69626954473138645044634d34616e694b4f4877735531374f706a34536f594f450d0a616a6638536868366454477a3564707a693732615a395761783852666733646156345731507868592b4b7669683851745131355069643858726c2f45376544664457742b45626d62777a62650d0a4876677870746c346630477a31725450456570526164727a2b492f4772363238656e576d7277746f4f6b764c703864306e6c4e7463364a70326f6172726830585334745275726936315051660d0a4270753956315877353465303665356e7549724e4c6e554e517672765649644c5353333079776b315455627161555278795839784e63537950586c39346a61745a4c61517757396d393371460d0a6f6c396157397a4b7a5046702b6a364a6278584e325a517a6c7269587a37754f4559696a4d3070686a4b45562b6c32686673502b46745a2b4832686645537a3866586f742f464769364671460d0a775a644753534853446432634d2b6f77587853366959323170644c4c61537a736974626b435334525653526b38444335504e7a566244564b6a7031613870347161664e4b74547053566f61720d0a33564b657253736b70795356306d474b7a5842634b5a546735356a7844565746787562596e442f57617a6c694b6d4a686c3161437077546c7a4f6a7a7771316f4b635a4a78697556576c63350d0a4c396c54786472392f7744474379745a704c6b614871756736774c76544c57497757454e31592b485962432b7670346f6452512b5471556c6e47306968335353394e6935736f6d6b4b522f710d0a4a34692b485067763470326e6766776e726c6a4e632b462f41336a7944576452734c434e46696e6b54534e564b2b464a5955627a5a35745355774735496c53346e764c7133695351746471700d0a2b632f67722b796a7076773531573138516148724639347238523575744a7337466b6c744c5854375455544848507143573973393148644c4c466c6c754463694e3175492f6b5631646c2b770d0a4e543072346461485a7a3654346e31612f774244767044484c6465497248564a4e5031665462367a756c754c65374e7a624c444b74785958554d43327059544b495167416c544456397468730d0a4e474f43723046474e4e4c6b35597956725155456c474c65764e4b70466333583175667a64783778566c6d4d3851715764634a4f72536f6577773657496f6379717978735959696a587278540d0a626c6455713373315052387a63744c486f646c38492f685a3432314b2f77444675763656702b6f6548494c52644c6b384b2b4f50416d6851513650466257342b7a6e54377a55644c6a3150540d0a374b434b534d517262335832634b736c764b47386c5667385338572f735666427a7839666178652f596244777238505774723355447266674478566478715a4c47467353335068322f7439540d0a304f475333566271326e66547269334373676d45663732534750356f503759767861384c2b4b2f4576686e5264597476486e6843783150554c62545976472b6c7758742f65614c444d7a494a0d0a74577357734a4c306d314f59355a784a6d50793264572b37586b76786a2f625731625776416e694c34616546506837702f674758784f595a4e62314c534e57764a494a375a6b44586346705a0d0a50416951432f566c5361574b564743524a45794d49675235745442346d6c516856673234564a526b3470326370747153685a4e4a513939796130736f36655836466c484476694a6a612b46710d0a344c45315a2f57345a4e5479795653763959772b585a66556c5362786c614e52316c44473456565a31597a636f5362353475536c6f6642656f2b486644646e385262725250444f71617271650d0a6b782b4b4c6a54644b6e7537654e72363773307633744c4a74734441506354524350616b63616235484a564d5058394d4868644a5434613041336b4e7862335a30625466744d4532364b61470d0a342b78772b64464c45794b30636953626c654e6747526756623567612f6d563848613571666854786c3457385761556257485576442f694c52645773704a34496271434b36744e52677559700d0a4c693075556d697572637978487a5957696b45694d777743426e2b6d7a7731346a75664665673656346b766f4c4e4c3357374f505562314c4a5a6a5a7264334f587556746373782b7a6963790d0a43454d7a4d49396f596c67545835763470595355737479643871716577784d71547253316c4f56544358664d72627632504d374f313237712b702b6f66534c703568444c4f427164526657610d0a47477035685271597964534d6174584852772b585571696e467652564b4e4832392b737079533250357939462f596438532b4b39556e532b2b4a2f67473761534337315055596644757154610d0a7071456179726c4a5073356841696861366d74316555732f795359526e5a6c592b48654c76324f6f7643476b365a346938572f4561327362625772712b74624731307a515a64526e4c3253330d0a54466379616a5a4149384670497979676555684938386f72627a6c36502b3148385576435770576d7132477032646c5a7754327a616e5a6162704f6c61657570324e765035302b6e33456c720d0a5a527a4e444f71744867794b595766636d30726d767437346a51772f4554344d3247732f446a78443474522f454e707258697677767236586c75326e2b45704c445348314c555042327179780d0a2f4e7039693474623645547a6b744264726961636f464c6673754f715a44576a566c51776d4b725671635a5363485053376e54644f62576c37786e4e543061546357306c7438426d2b5a2b4a0d0a57543472425538626d6d4770346247314b464746576e54626853644e5666617862646c47616f79685573376330616267727930506a4877392b7950344c38534457557450694234686c6b30720d0a7737716e69484d76683630736f51644d76726e5476733178492b70334a74703562713361595153375a4774556558617056315438323535704970705970563250464b305478673774726f78560d0a6c794d2f4d4375446b397570727638415776697238526452467844632b4f66465573647972523355663975583678584b536277367a424a3138324e3063355667512b34466a786765557a6c770d0a476b5a67526e4c664e7a7548566d504a4a4a35796563357a7a6b31385a6d746243536a526543777457673654717972796e4a7456452f5a79704f7a756c374f4b6c66757058746f66704844560d0a4869544c355936746e75615278367230385038415659303463696f636a717972796c377a62352b61455537743267744f70364c344a2b4958697634632b4a744a385a654374566b3058784c6f0d0a736b736d6e58386152536d497a32306c744b736b55365377537879517a797179537850486b71323365716b486937346a2b4f76487571334f73654e66464f742b496452764a476c6e6e31432f0d0a6e6c6a6469564a43516878436966753043704769716f55414b414d56356f4c7441764c484f632b68786a6a384f446e382f7239432f424434486e34755766694c58646131392f4358686e53440d0a62615270476f744643386e6948786c66465a7250773770346d5a55646c744665572b6b51534e624735735155496d626238763841574b6b35796a536c377a657572326976646b3557646b6c660d0a573676644a363250627a504d4d6a77636e6e575955734b3852476c68384d735455703035314842564f576c53392b4c2b4764527958574b356d74457a78754f3856633477442f454165707a360d0a396a3136382f686d76742f396a2f3841616238422f4171353856366634352b4869654c744d38617836625a3668714d4d317539396157466a636934466e396876462b7a58566d303232376c690d0a456b447a537852683263527868652b306a396a723454615643756d2b4b7233783763654d4773594a594c65347559744d3849333272587373554f6e36526236355a61526454545379764b504f0d0a4d454c7445466c4738694d75656a38512f73766673362f442f77414b2b4d66694434716d31632b467643756e3239746244532f464e7a4c6636703472696a4d4770365446486557647448684e0d0a555a4c61315742706e664c79507457496f336667343468564b64565370715547716a356d31474c53715835322b564b4d59786c7a36327331646454356e4f2b4f65477334793745354c6a70560d0a3854684d5736564a55384b327056704b76546a516c536349326b6e576e467869306b2b57584d6c4661653366745366746166444c7839384e2f77446848666739716c3950666646472b3069660d0a783146636d34736d3058527643467248446f2f6834574d782b7a577364357142686c4b32662b6a75734e795a586b57345572386a512b4774576930533276572b7a5453335676464d593437590d0a7a65544338386154794f596c3249715150735a454c74456c764b4d5268636e3456302f7854614c713754327475644f736d6e6b75497261616553345778744933655a59354a6d49613438744d0d0a426d645330306741326c6e56612b68744e2b50656d77572b6e365a5a57554569616642657a3346337159755a7a4e4b46653838315545367246457577724843416563626a49535165743579710d0a376c5754684b6673347153552f6469344a72524e4a387a764b545674565a4c5a5831793341523452796c5a667737374f72437256786550785653744a4b7135756c44367453715753633351700d0a786a52537473705773323066623367333459654b64597562565a59544659797a78574e7471385676434962712b67745935376932303132614e566d73596a3547325578434b47414f514957690d0a4a2f5a76344d2f422f77446147313358504358687677564234523171483470492f6754532f434e3054466f756e335770584a6775645131795333382b48545830794f78762f46457767652b740d0a6f64497362793857324d4452536a38456668352b304e63322b6f36566661734c5933567174302b6e3231784e63374c62543756784e714573566e35365233454d6b6331796b6f54664f304d410d0a654c7a6f344462312b782f374e2f37514f7258396d4e56305348543549377656744831474337306e5637714334305455396530356f5a5a644f754c66587264394e617930693661326e566f6f0d0a317437623756466367785834537652774f4f6f7a77306f55713871574b70346d46476e4632555975733578396f3438793534786d2f614e62535546716a3855346a772b59356a68714f417a700d0a383162433570692f71394343617731543635694b734a4b6b72614f47496163586137564f554532343250335738482f735966466450677a70506969363137775666367a352b743656502f77690d0a4839725136665a57756b366a4c70566c64616c72467a70756b5738463935634d556b566a7059764c795747534f57465753567049766b6278482f77546a2f614b31487842346831627854632b0d0a456646503974777a79364a706c7a347857336e5347784a7572574b35302b4b36463361794331692b314c4e71566a6279584e713976396b4e374a496b636e364b654166474768654d76462f770d0a2f7744432f6944782f632b4574572b77797a61645a57766a652f65396c33364259364e4a71397270476f2b4d6f744e7639583158786a657836704738516b764c692f315039784a44706d6e780d0a696239696668723844724c77354a50726c7634793144585a3953545472714c57722f524e4a665670516c6b7349766262577273366a654d6d6f57726a7a6f70474d5562466b69686851526f6e0d0a6c5933695776677350516c69366b3630716e7433546361664971734a54634b53715356306e54537332396252535375376e344f73426d564c4d7672474635456f4b6a567055366b5a527370560d0a4a7871786c6550616e4a37646e61352f45483853763258664633682f585932313777373459526a4f316a6148773763336c3649486a7554424a49587447676876706265526d4a6e6b5a5473570d0a4a7045574e335266676d5077393445384a6646665339442b4a6c685071766843367633307a7845736b7478706c317055656f4e396c6b75375365325a376d337574446d623763716f484530640d0a715970466b686e654966364a2f774164666754345076504432752b4e6252644b30612f30727739655336784976687252706a727132317a4272426e76445a326c6f5676357275326c457477490d0a5a6f5a46314339575332416b44702f6e346674792b47644d306234762b4a357261347662665478346776625879316a4a2b79584e752b507335685255327046453176645275543571787976430d0a32664c446e33636b7a724435706c6371384931497a6c696c687071556d31547276447a7151677050527570536735786136776b7448592f714877677a664534374d38773464786d4b784d466d0d0a47585044304d565471792f6454354a77704f696d2f7742334f6e4e4f7044613871566b724d3350326b2f3244664576776f744c6e7874384f4c71547833384f594e49746645453931485062530d0a2b496644656e58425a6f626a56624b32574d616a7066794634646130794c5930615353584e70614c46353876365a664157394e35384950413039307053344f6c7a52544c496e6c75487439520d0a7662636b6f30524944655675586e42556772387046664776374e6e78336c38532b452f436b4e37714e7a3468757667356f2b6f654366486e682b364a6b66786a384650476c3770746e496c350d0a62544a4a39726a38463338503253532f52784a70647265614e6658524e694e556c6a2b2b624c34663366773874783451384d5154616a3462307557356d3850336368655233305456376d58570d0a744b6a5a35356d6d4a74374855594c592b595377386e42365972356e6a4b66312f4276427a704e3163466d4e4356724e75644b74673633733679736e654d6d7077625339325555744c3250540d0a38514d5a6e713461795468336937453038586938767a4c467644356c5a5171314a595259764459696869453348337175447235506d4f476e6471746838524f7a626f79356634784e66756c570d0a77644d42354a49314155453433484f543377564a59424e7a41344f666251384a2f476a346f2b4866416e6a6234552b45376a554c7a512f484e6d4c6538737257327562323873346d6b582b300d0a70644d4551643755616e5a68724c5548564756344a4777524b776b726d504571534a6277704d4a496f4a7030576158622b386967624f3931556c555a386650674f75374f475a534458327a2b0d0a7a7038665032592f67787064355970612b494272756f3230493144784c71656977334f703356774449306c764177756e6773394a6959525351576b45534e4c4c75653561637047342b336f300d0a6f65306c55645a555a546a4e6339374a786b6e4678555838546c7339374e4a7071795a396c787a6d454d50673477686c557335723036394b76546f5167704b46536857685032726d745679630d0a7930556c7a704f4c75726f2f4d2f5564483176546e4a31485274587368397774643662655736686a676b4579784b41647047426e6857513947424f48644b466a4b3477534d6e5042786b34330d0a416a75446b666a6d763131384d664537344f5848784e7650456e6962343454654a2f424d2f77426f75763841684776456d6e7a5449303177725278326c2f617932386c6a4a6132355a5a59350d0a7264566d42524555694d4e752b47663270506966384d6669423430654c34532b45644e30447772707a4f50375869302b477a76396576475a2f4e6e6a6868534e4c50535967414c4f323873540d0a534d386c78634f664d6867742f4f78634955384a6961733343456e4b705468546b303556467938716e464a2f424b3937766262794f5442635231735a6a71575879774e5731544c36574e71590d0a745163614f486e55696d384a4e755458746f744e4e616561506b2b64696d384164656e3078313434355062484f63646858306e34642f61372b4b66673377546f50674c775a7033684877316f0d0a33682b4543336d6730524c37554c6d2f655670377256727166554a4c6c583143386d627a7035316a55376a745462454934302b624a69426a4a334138642b2b54315066365a716978493442500d0a4a4242494f506465507078317a6e6b64362f4f4b39657468716c6232552b565650636e654d573272387a55627254577a30364a4a366148546d4744772b4f644b4f4a6771734b552f617770750d0a7a55616c6d6c4c564e4e70546b6c7070652b6a737a36686c2f62502f41476b705343504830634a42556a793944305542574334796d367763717a5a4c466b5a58335a494979632b582b50666a0d0a4e38562f69686232397034383862617272756e576b2f3275445448614332303562734b564679624b7a6868676b754147664573694d344d6a6b4546696138767964793550504a2b36446c73410d0a413950787a79523170797478314142425050767763652f6250512f6a585050483471635a7864656f3431497935347070637974313555743074624e64627437484c5179664b364d34536868610d0a4d5a55584832543559705135487a776153696b7557627572577331667951305437494756354131796a7a4f75344244436b78686858706e4a6c686e6b6345382f7532326a414a7253335538630d0a3855534c497a5346535552537a4d562b5659786a2b2b58323478383341357a7876616841496d30795750427437725362435243534d2b616b586c586934425057365359672f7743336a6738430d0a6f30534844455962352b51655146586a42366a4a787943446e387135384a7a7a702b3068556358556b35505853796e4f4e6b72396b6c7662643276763151707a7847486371565230366a71580d0a636e6472334a763362637a7465316e723164306448483472314b572f307255524956585349394d7437474e6736434f4853306a524a57565755373770316d754a6a38323970354666494a7a330d0a396a38567647576861763479384b61664a6478364864363966704871467463584e736c72714e6c663339785a79794657574553334671736b4d7359426b4d6355616f41734b6266502f444f6d0d0a77367634683050534a57456476714f70324e74637a644667744a626949586c7737414e73697472627a5a3547494f784932596767565a6d3147316a764e58754a4a49545a58336965505655670d0a6237537338615433467974786543574a67504b68735a354958686b4d6a534362355276554d4f3272395a547031616453643661752b56766d636c5554684a326574727a6574326f743939506e0d0a654a386f71564b4747784744702b327865575268694539486553786361366d343671556f79685771367436546e6f307a39752f3250666972385450453369333459487858633631346e2f73560d0a66433269746570665063795774677575334f6e57647662534e634a642b586350425a525433414469335779685a4e736b5559662f41456f50324f50446e6950773738467644493171434333300d0a33563946384f3635345a6753386e7637324453645a30437831613467765a376c35475642713937714d396a612b5a49624b7875594c4553794a625275332b58502b785a346e69316a346765470d0a7266526f5037456b306e574c545649686233624648306253343061652f42754a556b33535878756452654a647262356749493156575566367058374c2f6a6e5266694a38417668583469304f0d0a5179576838462b48744d6b56696a7642633658704e705a5378794651715a59524a634c73415879356b41414f514f6e4e343131777a6836334c375346584d616c437056616235497143784e430d0a55584c574874616b7130585a744e523562492f434d3777764a6a5072737162707a786e7447344b6d3455716475576f6f78546a47312f61536c464c5a4b53376b663754666a6e5366415877630d0a3859616872566e6558397071656b61706f6f743749512b655a6233534c396f6d416b473078744c416b4d685569574e5a764e69445045416638386e39746e5857316e7868663666637641796e0d0a786c71313639346b6f6d2b315433384d4e774a477547534e686d33653246776a7170696d456b4c4a35735575332b76622f67724838657074412f733334573257715157397661364d4e64314b0d0a4f314965396a314c556f74527459526652677138647648703732387470735946354c7559754274674e6678562f7451654a724858504567533331697a316947323066532f746435444635437a0d0a6174505a572b6f616d596f70566a6d515775705458656b6d5542306d467035384c6d43574d48362f68664c46672b486375357272465a706d437a5763573231444334536e586868323161304a0d0a566f56456b74473037363354583674344e5a64566645474478584c704f724375716954664a5177306131334a3752645774586a546974326c4a327365512f4450346a367a384e5047773861650d0a467072643737537269345734302b346a52394c317652372b336c746461304456725a4d7050706572616338316e646f4549574f59795174484c46464a482f514434552f62632b4332722b462f0d0a446c3864503852366675304c536259574e35614a66334e71746859573967734d7439484d467647526259415852416b7546784c4b71797534483832326c524f3576416a68684d384d5a6843730d0a7937704149537a425679646f6b647a744a7a786e356753667450774672625758672f514c4e374f306b6530735262504936544f7a50424c4c45354c4b6d302f4d703448516364712b6d786d520d0a777a4b554a4b717146565534786339457077707962555a5830636f75616358765a7931733266305a346865486d546357596642597246517850743850586a435377386c46314c5956306661560d0a453361556f5268476b7072567763597474516a6238642f6978345138557262574366325264427a35724d434977567746554d523575435175646f4a59397a6756383458486862784b6a4d6a610d0a58645a3667356a6235574734452f4e78317965674235485776306e2b4d4e3842635763594b3756516b6b414b58615461335462686c593751646f44413859357235346b676b75306e6d7434320d0a644c64664d6e6d495668456f56354e70624f474f49704a4e6f487a694e6d777172686677696e346b356c5767347643306c4a387a6a625a4c6d6a645837614e76737454774a5a5a546e4e53710d0a315a7767323474763476336961546c712b717466766673664b7a2b462f4567484f6a586e47774144626b74775641416235736a35766c4445444236436c486844785346542f69535865414d450d0a4b714436413559594942427831775054466654694e67435178426f6c43347a472f77433849794779796873594a4f515133484c353546644a706d6b336d6f784c396c74705a4a42755a3151630d0a375353374835686748596a4e754243454450596b65586d5869466d6361635a5042715570793549517330394975556e7242717974653336485a677368774d337a7a78456f78634975584a4b6d0d0a6d6f786b6e4b3773396f744a583054666d6647747a344f3854374e7a614e644c6b74674d4548626748352b43667a50706d71532b44764578777136526373564a4c594b4541673441423341450d0a3864426b6a6e6a5046665964397074344a46742f7330386b676b6149784c457a73587a35616851697353323472474e6f4a4c6b414173526e4d537875356d564674376e66747874454d6a74490d0a4153515141704a58437948504b35566953647078386c696645444d4a7a55705a644a7a5464315a702b37613931374f326a6131327531366e632b4763706d366b33693679536a486c667471530d0a54546c644e2b34374f79583348796766426e696e7a4357306d65505041444e454f53526a6b73427a3248586b45634d4356506772785249416f30746753534d6d5350307963632f51646565330d0a617671615454373473592f7374774a443931466a646e594c457375306b42694e73624b327a2b454d47594b774e4c486f39374e446454517758442f59626462755a5447417774355a4c65425a0d0a3976384146455a5a346c4444494a59594f3031795334357a5238716a6c39704e744a506e3135584b396c374b3172526b3362346b6e627a4b6e44475651552b6245316d6d756137727754664d0d0a34787537515453764b4b5731723632646a35676b38493631447030556c31626d336d73336b533152325178584e744d375842547a6337595a345a6e6c64466b4b71364d526b455a716d2f682f0d0a56555756696c7675534a41552b30784572353230715468396f33626c4a473749424848703966615834554f70576c7a4c71624e5a57304e3770576c4d4a4942493476645646346252586a646c0d0a4969574b7975336b6c635a49534e5679584443712f77414e6453696e6a682f73534f563231464e4f6861495253435739613676724a455442634658754e4a765642775147686b7979353344700d0a7776476d615573506435664f536e566e4a636e4e6f6d357863576e4736587449747032756e6457563166784b6d525953686971314443346d45614b744e4b7455616b70536263326d6c3779550d0a61696b6e5a58585336757642664366686658494c4f2f766257315358566275786b303354356d75424462324564374539767156774e344453334432556b747444685248474a33664c4d4678420d0a2f77414b313853536834356f374e5659454e7575416367395164716b35494f646f39526b697670654c77687274766133743262494c5a36664f317664734a6f52396d5a4674475a776974755a0d0a4669767261566e436c664b6c334544424233706641327451586b326d6f7345393342716d7261564973637165515a6447733176376b72634d366e354c6664495274556c4549566964796a47480d0a472f45716c4f56504152554b6b7278556c4c5a70786a4257535474797a752b7276756c70363248796a4b4d50536172346831716b3031556271576a793036554c78616132536e643833387a300d0a746f637038437643486a585166462b677932476f57316c637065573678547766615a3555676c62793577596f676b747a474970585a3445594e4b6a4e476f4959592f30332f7744676d562b300d0a42384d74502f5931385036496e6a377735726d7465444c54557a657a365261367659724e62692b577a744c79534c5659576d695a41396f7337764e4c4461744c465a504d58676b632f7743630d0a72384a39416e755045462f6f2b6f334d756a366a6f51545549372b43574a54484a61366a59576369724f5a46694d4c77586a3353795a79786768556c493543796671502b7a7238652f6a46380d0a4c426165482f422f6954567062472f307278482f41476a70467863765a51377258784650702b733663366f7756344e55476e327279573979787a4b7a4835536d5439666c58484761356a6c380d0a4d466e4f466938756c6a595455634f725656696348586854644e704a587570316f53757265394758512b453434345079664f36454d4c684b315042347644526f34754c35597145714e616a4f0d0a6f7075615564485267335a36366e36632f774442536e34752b4b76693738553376724c5739496a2b784750536452316133732f733133716d32465073697a47334b69533369746c6132526e560d0a6e4f774e7541534848346c613538427463314f39533547713255695854376a4d59356d4977363759697063444733766a637733467344433139702b4c376a78523430385461667163743142350d0a6e69725372587855444a4d736346766279365a5a546167345941524e613239314c4c61784f6a623977554d49734671386d316656372f53724c567055754e732b6d32463974554647506e32550d0a4d2f4d5a774933626567415653435849494f77376134754a2f465469624c385255686761644842594f6c4b4e484378396b6e46306f776f754d4957753146554b31475353356275642f54376a0d0a77333464796a4b63746f3063484b4573525377727159687633716a6c536e69597a546b374e4a3138506949704a3276466158536238673050396c33583472474f3662566f59497269535266740d0a503247344e73424736717265612b7856667a433061466e566478437157334b702b70664450374f647a466f576e4b66453877597850493468675a49684a4c4e4c4c4946555338664f375a7a670d0a6c736b6853534236316f476b66455034692f47587758384e4e4330613750776b752f41646c642b4a5048626163593950306e78524666523230576a576d764c73676b756452307255476655740d0a4c784c494448617a73496c6b64322f6f522b43762f425050775644384b2f424d66695078586158757566324f72366c645357316f7a7a334d747a635374495765554d515664647049414b34780d0a7869744d723435385563797035666a4d4669734d364f50796e362b31576f7867714638645877634b54556b6e7a792b7265305461584e4353615453752b544b764766493866504e63466d57470d0a6e517135666a6f7777796f50326a723465634a336e5064526e526c4651714b37664e5057782f42423853644d5a37315675644e314b5178527235594b69474d675955496f6659546a614267440d0a35546b6344466555523363476b4938636e68385377764e44654b7436575a556e68696d6a6a6b5749626c66616c314b4e73684d62456831553741535556793163485377636d714c6b6c3866760d0a576c724f466e75747571586474732f50493857356a69495256576c68704b584c4f5875545635633058306b746e4a74646d376f67314c783147304e78436b476e323565475745724d7361694b0d0a4f667958624252427969327877587a4950506e33456d566958365a3854626254426553584e33704a7562363661366b44766c49524c444e4635635a53554d73537833446a79313558455944660d0a4a754252586a3478566131536b35563578644a38306553464f4f7334386b72364e2f433362315057776e45574a7055352f77437a5961664f765a74533971317971704853796e3135566439620d0a49664a3859476d45527432305a48745447776d525638786a446432313745345a35464a506d5763534d5655767344626d4c4e6c736150346f7644473643665351582f732b507a4e3464346f740d0a505353336969527a4d376f73697a53764b643236526d50497969715556355370564a74743469716e4762696d6f3037745762642f643162627533354c73656c533467727868474b77754761710d0a4e4f5633572b784a4a4c34746e6433586e3642622f4668374a34336a754e4844516c4370614f416c647351684149334535325a4c427374497a2f4e6b4c48747a562b4a6b6b56784c6366624e0d0a4f527272526262772f4973666c416e546265534c79676d63786934587959794a6d566957524163394155566e4b684e537066375256646e64653754547637467865716a73314f6431317672730d0a69337846694a4f56384c68587a4b6e5462627276335a536f79647666306439622b534a6258346857546133714f6f3374786258467471556f6d6c745a4a6f73706357304e7848706c394848680d0a592f74476d79796d5a584b474e775a6f3341575279477866456937745959726144574c54796f4e526931474761526f5775786451584e3764776c70794e7a424c6a5539514a562b4239706d430d0a6a446a42525755595659745534346d74464e56616a61354c3371314655612b47316f796a65466b7557386c7332636c5469437535516e4c435953556e436e4233565672393075574d76692b4a0d0a786b3479623353585a46534c3468547832743561445539502b7a583758506d7842597a752b32773274724b6f504a5654485a327934344d625249513235546d3250695a636d647057316d32610d0a616536753736562f4c684261357564506b3079396b3362666d6134745a47535871727353636b346169696d385055546d7672654a39794b6c44336f2b363774365753745a796b3132753942660d0a367a596d584f70595042506e616c4c334b6d72356f51663274453478696e33736a742f426e6932533831365338585837473075645967476e333131636556464339767467543936504b5941450d0a51514d7a6c4343794b7878795239362b41726e53394b4e673876785a744c76563771336c655038417378764f67684770587a5864374265586a577559354a4c69424c736f4e7750794d4379790d0a4e744b4b39504c734a374f6e64596a454e2b313971727a576c537055684f633170626d6b354f377435327565666a654c4d5a656848366e6750337442516d33536d32366447484c54703335370d0a387349314a5253767174476651756d7961395063365070326c654a337637577974456a744a53516261306975624e4c5672614e6c746c7a42396e327758455a42585a45415663716862336a340d0a632f4337772f63586c7865654e6d4f743238736243537874566e473935585954455362594e786c6956526c416e37715a69437043344b4b654a796644597172435749715636797075556f776e0d0a557643384977684853335345595176767977682f4b6a7a31346935316c385852776d48792b6a7a78634a5649305a71636c4f724f724b3735757336745639462b386d39323266735434532b4f0d0a586833396f6634772f4462773938526a616673332f73792f4365793133584c5434642f446a53725332307a58727930304a644f3069797647302f5333753776584c6d5343325837624e6179780d0a434a5a6f596c676b6e5735484b654e76326e6669664a34723176384134516a5464663033776846654732384e324c5332786b74394874496f37577853556955677a744243727a6c53792b63300d0a6d316d47474a5257644f6c694b4e42554b4f5959326a47704c326a6c54714b4d6f776f7a6e476c683457584c4368546465724e516a46586c4b37765a487775513570444c7377782b496f355a0d0a6c383355705571667336314f645345506131617465724f504e4a7a6453704f4d464b55704e3873556c62572f2f396b3d0d0a27, NULL, '', '', '', '', 1, '', 2, 3, '');
INSERT INTO `pus_katalog` (`replid`, `judul`, `klasifikasi_kode`, `klasifikasi`, `callnumber`, `pengarang`, `penerbit`, `isbn`, `issn`, `penerjemah`, `tahunterbit`, `editor`, `photo`, `photo2`, `kota`, `volume`, `seri`, `edisi`, `halaman`, `dimensi`, `bahasa`, `jenisbuku`, `deskripsi`) VALUES
(6, 'The Lost Hero`', '001', 1, '001 Ric t', 4, 4, '9781423142652', '', '', '2010', '', '', NULL, 'New York', '', '', '', 1, '', 2, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_klasifikasi`
--

CREATE TABLE IF NOT EXISTS `pus_klasifikasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pus_klasifikasi`
--

INSERT INTO `pus_klasifikasi` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(1, '001', 'Cerita', '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_lokasi`
--

CREATE TABLE IF NOT EXISTS `pus_lokasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `utama` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pus_lokasi`
--

INSERT INTO `pus_lokasi` (`replid`, `kode`, `nama`, `alamat`, `keterangan`, `utama`) VALUES
(1, '01', 'Meta', '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pus_member`
--

CREATE TABLE IF NOT EXISTS `pus_member` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kontak` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pus_peminjaman`
--

CREATE TABLE IF NOT EXISTS `pus_peminjaman` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member` int(10) unsigned NOT NULL,
  `buku` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `tanggal3` date NOT NULL DEFAULT '0000-00-00',
  `mtipe` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `telat` int(11) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pus_peminjaman`
--

INSERT INTO `pus_peminjaman` (`replid`, `member`, `buku`, `tanggal1`, `tanggal2`, `tanggal3`, `mtipe`, `status`, `telat`, `keterangan`) VALUES
(1, 0, 7, '2015-07-10', '2015-07-15', '2015-07-10', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_penerbit`
--

CREATE TABLE IF NOT EXISTS `pus_penerbit` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pus_penerbit`
--

INSERT INTO `pus_penerbit` (`replid`, `nama`, `keterangan`) VALUES
(3, 'Annual Books', ''),
(2, 'PUFFIN', ''),
(4, 'Hyperion Books', '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_pengarang`
--

CREATE TABLE IF NOT EXISTS `pus_pengarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nama2` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pus_pengarang`
--

INSERT INTO `pus_pengarang` (`replid`, `nama`, `nama2`, `keterangan`) VALUES
(1, 'Quantin Blake', 'Blake, Quantin', ''),
(2, 'Jeff Kinny', 'Kinny, Jeff', ''),
(3, 'CS Lewis', 'Lewis, CS', ''),
(4, 'Rick Riordan', 'Riordan, Rick', '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_satuan`
--

CREATE TABLE IF NOT EXISTS `pus_satuan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pus_satuan`
--

INSERT INTO `pus_satuan` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(1, 'IDR', 'Rupiah', '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_setting`
--

CREATE TABLE IF NOT EXISTS `pus_setting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  `nilai` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pus_setting`
--

INSERT INTO `pus_setting` (`replid`, `kunci`, `nilai`) VALUES
(1, 'idfmt', '[nomorauto.4]/[sumber]/SIADU/[tahun]'),
(2, 'labelt', 'METTA SCHOOL LIBRARY'),
(3, 'labeld', 'Jl. Puncak Permai Utara, Surabaya 60187'),
(4, 'bkfmt', '[kodelokasi][kodetingkat][tahun][nomorauto.5]');

-- --------------------------------------------------------

--
-- Table structure for table `pus_setting2`
--

CREATE TABLE IF NOT EXISTS `pus_setting2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` char(6) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pus_setting2`
--

INSERT INTO `pus_setting2` (`replid`, `kunci`) VALUES
(1, 'idfmt'),
(2, 'bcfmt'),
(3, 'titfmt'),
(4, 'desfmt');

-- --------------------------------------------------------

--
-- Table structure for table `pus_stockhist`
--

CREATE TABLE IF NOT EXISTS `pus_stockhist` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(200) NOT NULL,
  `tabel` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `nitem` int(10) unsigned NOT NULL DEFAULT '0',
  `nceky` int(10) unsigned NOT NULL DEFAULT '0',
  `nnote` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pus_stockhist`
--

INSERT INTO `pus_stockhist` (`replid`, `nama`, `tanggal1`, `tanggal2`, `keterangan`, `tabel`, `status`, `nitem`, `nceky`, `nnote`) VALUES
(1, 'stok', '2015-07-10', '0000-00-00', '', 'so_1', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pus_tingkatbuku`
--

CREATE TABLE IF NOT EXISTS `pus_tingkatbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pus_tingkatbuku`
--

INSERT INTO `pus_tingkatbuku` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(1, '01', 'Toddler', ''),
(2, '02', 'Playgroup', ''),
(3, '03', 'Kindergarden', ''),
(4, '04', 'Primary', '');

-- --------------------------------------------------------

--
-- Table structure for table `pus_tpjm`
--

CREATE TABLE IF NOT EXISTS `pus_tpjm` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ssid` varchar(100) NOT NULL,
  `buku` int(10) unsigned NOT NULL DEFAULT '0',
  `peminjaman` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `rep_file`
--

CREATE TABLE IF NOT EXISTS `rep_file` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(128) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `ufile` varchar(20) NOT NULL,
  `fname` varchar(128) NOT NULL,
  `tipe` varchar(5) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rep_grup`
--

CREATE TABLE IF NOT EXISTS `rep_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `passwd` varchar(30) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_aktivitas`
--

CREATE TABLE IF NOT EXISTS `sar_aktivitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `aktivitas` text,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_aktivitas_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_barang`
--

CREATE TABLE IF NOT EXISTS `sar_barang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi` int(10) unsigned NOT NULL,
  `grup` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  `tempat` int(255) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `barkode` varchar(50) NOT NULL,
  `urut` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:ada 0:dipinjam',
  `sumber` tinyint(4) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kondisi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `isImport` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `sar_barang`
--

INSERT INTO `sar_barang` (`replid`, `lokasi`, `grup`, `katalog`, `tempat`, `kode`, `barkode`, `urut`, `status`, `sumber`, `harga`, `kondisi`, `keterangan`, `isImport`) VALUES
(1, 0, 0, 1, 1, '', '', 0, 1, 0, '0', 1, '', 0),
(2, 0, 0, 1, 1, '', '', 1, 1, 0, '0', 1, '', 0),
(3, 0, 0, 2, 1, '', '', 2, 1, 0, '0', 1, '', 0),
(4, 0, 0, 2, 1, '', '', 3, 1, 0, '0', 1, '', 0),
(5, 0, 0, 3, 1, '', '', 4, 1, 0, '0', 1, '', 0),
(6, 0, 0, 3, 1, '', '', 5, 1, 0, '0', 1, '', 0),
(7, 0, 0, 4, 1, '', '', 6, 1, 0, '0', 1, '', 0),
(8, 0, 0, 4, 1, '', '', 7, 1, 0, '0', 1, '', 0),
(9, 0, 0, 5, 1, '', '', 8, 1, 0, '0', 1, '', 0),
(10, 0, 0, 5, 1, '', '', 9, 1, 0, '0', 1, '', 0),
(11, 0, 0, 4, 2, '', '', 10, 1, 0, '0', 1, '', 0),
(12, 0, 0, 4, 2, '', '', 11, 1, 0, '0', 1, '', 0),
(13, 0, 0, 4, 3, '', '', 12, 1, 0, '0', 1, '', 0),
(14, 0, 0, 4, 3, '', '', 13, 1, 0, '0', 1, '', 0),
(15, 0, 0, 5, 2, '', '', 14, 1, 1, '0', 2, '', 0),
(16, 0, 0, 5, 3, '', '', 15, 1, 1, '0', 2, '', 0),
(17, 0, 0, 1, 2, '', '', 16, 1, 0, '0', 2, '', 0),
(18, 0, 0, 1, 2, '', '', 17, 1, 0, '0', 2, '', 0),
(19, 0, 0, 1, 3, '', '', 18, 1, 0, '0', 2, '', 0),
(20, 0, 0, 1, 3, '', '', 19, 1, 0, '0', 2, '', 0),
(21, 0, 0, 3, 2, '', '', 20, 1, 0, '0', 2, '', 0),
(22, 0, 0, 3, 2, '', '', 21, 1, 0, '0', 2, '', 0),
(23, 0, 0, 3, 3, '', '', 22, 1, 0, '0', 2, '', 0),
(24, 0, 0, 3, 3, '', '', 23, 1, 0, '0', 2, '', 0),
(25, 0, 0, 2, 2, '', '', 24, 1, 0, '0', 2, '', 0),
(26, 0, 0, 2, 2, '', '', 25, 1, 0, '0', 2, '', 0),
(27, 0, 0, 2, 3, '', '', 26, 1, 0, '0', 2, '', 0),
(28, 0, 0, 2, 3, '', '', 27, 1, 0, '0', 2, '', 0),
(29, 0, 0, 6, 2, '', '', 28, 1, 0, '0', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sar_detailaktivitas`
--

CREATE TABLE IF NOT EXISTS `sar_detailaktivitas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `aktivitas` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL DEFAULT '1',
  `biaya` double(14,0) NOT NULL DEFAULT '0',
  `biaya2` double(14,0) NOT NULL DEFAULT '0',
  `tglbayar` date NOT NULL,
  `tgllunas` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_dftp`
--

CREATE TABLE IF NOT EXISTS `sar_dftp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_distributor`
--

CREATE TABLE IF NOT EXISTS `sar_distributor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(250) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_dpeminjaman`
--

CREATE TABLE IF NOT EXISTS `sar_dpeminjaman` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `peminjaman` int(11) NOT NULL,
  `barang` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_grup`
--

CREATE TABLE IF NOT EXISTS `sar_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sar_grup`
--

INSERT INTO `sar_grup` (`replid`, `kode`, `nama`, `lokasi`, `keterangan`, `ts`) VALUES
(1, '01', 'Furniture', 1, '', '2015-06-02 14:45:27'),
(2, '02', 'Elektronik', 1, '', '2015-06-02 14:45:45'),
(3, '03', 'IT', 1, '', '2015-06-02 14:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `sar_jenis`
--

CREATE TABLE IF NOT EXISTS `sar_jenis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sar_jenis`
--

INSERT INTO `sar_jenis` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(1, '030', 'Habis pakai', ''),
(2, '020', 'Tidak habis pakai', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_katalog`
--

CREATE TABLE IF NOT EXISTS `sar_katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grup` int(10) unsigned NOT NULL,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT '0',
  `harga` decimal(10,0) NOT NULL DEFAULT '0',
  `susut` decimal(3,0) NOT NULL DEFAULT '0',
  `photo2` longtext,
  `photo` mediumblob NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sar_katalog`
--

INSERT INTO `sar_katalog` (`replid`, `grup`, `kode`, `nama`, `jenis`, `harga`, `susut`, `photo2`, `photo`, `keterangan`) VALUES
(1, 3, 'IT', 'Monitor', 2, '0', '0', NULL, '', ''),
(2, 3, 'IT', 'CPU', 2, '0', '0', NULL, '', ''),
(3, 3, 'IT', 'KEYBOARD DAN MOUSE', 2, '0', '0', NULL, '', ''),
(4, 2, 'ELT', 'AC', 2, '0', '0', NULL, '', ''),
(5, 2, 'ELT', 'Speaker', 2, '0', '0', NULL, '', ''),
(6, 1, 'MJ', 'Meja', 2, '0', '0', NULL, '', ''),
(7, 1, 'KR', 'Kursi', 2, '0', '0', NULL, '', ''),
(8, 1, 'LM', 'Lemari', 2, '0', '0', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_kondisi`
--

CREATE TABLE IF NOT EXISTS `sar_kondisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sar_kondisi`
--

INSERT INTO `sar_kondisi` (`replid`, `nama`, `keterangan`) VALUES
(1, 'Sangat baik', 'Baru'),
(2, 'Baik', 'Layak'),
(3, 'Buruk', 'Perlu perbaikan'),
(4, 'Sangat buruk', 'Tidak dapat digunakan');

-- --------------------------------------------------------

--
-- Table structure for table `sar_lokasi`
--

CREATE TABLE IF NOT EXISTS `sar_lokasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penerbit_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sar_lokasi`
--

INSERT INTO `sar_lokasi` (`replid`, `kode`, `nama`, `alamat`, `telpon`, `kontak`, `keterangan`, `ts`) VALUES
(1, '001', 'Meta', 'Jl. Puncak Permai Utara, Surabaya 60187', NULL, '031 7342920', '', '2015-06-02 14:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `sar_peminjaman`
--

CREATE TABLE IF NOT EXISTS `sar_peminjaman` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi` int(10) unsigned NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `barang` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `lokasi_pinjam` int(10) unsigned NOT NULL,
  `lokasi_lain` varchar(250) NOT NULL,
  `tempat` varchar(200) NOT NULL,
  `kondisi` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_peminjaman2`
--

CREATE TABLE IF NOT EXISTS `sar_peminjaman2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` int(11) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_pengembalian`
--

CREATE TABLE IF NOT EXISTS `sar_pengembalian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peminjaman` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_produsen`
--

CREATE TABLE IF NOT EXISTS `sar_produsen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(250) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_tempat`
--

CREATE TABLE IF NOT EXISTS `sar_tempat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL DEFAULT '',
  `lokasi` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sar_tempat`
--

INSERT INTO `sar_tempat` (`replid`, `kode`, `lokasi`, `nama`, `keterangan`) VALUES
(2, 'Lt.1 R.Guru', 1, 'R.Guru lt.1', ''),
(3, 'Lt.2 R.Guru', 1, 'R.Guru lt.2', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_tmp`
--

CREATE TABLE IF NOT EXISTS `sar_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE IF NOT EXISTS `sensor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `situs`
--

CREATE TABLE IF NOT EXISTS `situs` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `situs`
--

INSERT INTO `situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`) VALUES
(1, 'rekysda@gmail.com', 'Sisfo HRD dan Penggajian', 'http://localhost/sistermeta/hrd', 'Sisfo HRD dan Penggajian', 'WebDesign dengan sistem Responsive', 'sisfohrd,surabaya,indonesia', 5, 50, 5, 4, 3, 'sisfohrd', 'SMK BHAKTI SAMUDERA', 'Surabaya', 1, 1, 12, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kalender`
--

CREATE TABLE IF NOT EXISTS `tbl_kalender` (
  `judul` varchar(255) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `waktu_mulai` date NOT NULL DEFAULT '0000-00-00',
  `waktu_akhir` date NOT NULL DEFAULT '0000-00-00',
  `background` varchar(10) NOT NULL DEFAULT '#d1d1d1',
  `color` varchar(10) NOT NULL DEFAULT '',
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_photo`
--

CREATE TABLE IF NOT EXISTS `tmp_photo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `useraura`
--

CREATE TABLE IF NOT EXISTS `useraura` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `useraura`
--

INSERT INTO `useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 0, '2015-10-01 13:37:06', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `usercounter`
--

CREATE TABLE IF NOT EXISTS `usercounter` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useronline`
--

CREATE TABLE IF NOT EXISTS `useronline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useronlineday`
--

CREATE TABLE IF NOT EXISTS `useronlineday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useronlinemonth`
--

CREATE TABLE IF NOT EXISTS `useronlinemonth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aka_detailpelajaran`
--
ALTER TABLE `aka_detailpelajaran`
  ADD CONSTRAINT `aka_detailpelajaran_ibfk_1` FOREIGN KEY (`pelajaran`) REFERENCES `aka_pelajaran` (`replid`),
  ADD CONSTRAINT `aka_detailpelajaran_ibfk_2` FOREIGN KEY (`subtingkat`) REFERENCES `aka_subtingkat` (`replid`);

--
-- Constraints for table `keu_anggarantahunan`
--
ALTER TABLE `keu_anggarantahunan`
  ADD CONSTRAINT `keu_anggarantahunan_ibfk_1` FOREIGN KEY (`detilanggaran`) REFERENCES `keu_detilanggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_levelaksi`
--
ALTER TABLE `kon_levelaksi`
  ADD CONSTRAINT `kon_levelaksi_ibfk_1` FOREIGN KEY (`id_levelkatgrupmenu`) REFERENCES `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kon_levelaksi_ibfk_2` FOREIGN KEY (`id_aksi`) REFERENCES `kon_aksi` (`id_aksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_levelkatgrupmenu`
--
ALTER TABLE `kon_levelkatgrupmenu`
  ADD CONSTRAINT `kon_levelkatgrupmenu_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kon_levelkatgrupmenu_ibfk_2` FOREIGN KEY (`id_katgrupmenu`) REFERENCES `kon_katgrupmenu` (`id_katgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_login`
--
ALTER TABLE `kon_login`
  ADD CONSTRAINT `kon_login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`);

--
-- Constraints for table `kon_logindepartemen`
--
ALTER TABLE `kon_logindepartemen`
  ADD CONSTRAINT `id_login_FK2` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_loginhistory`
--
ALTER TABLE `kon_loginhistory`
  ADD CONSTRAINT `kon_loginhistory_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_privillege`
--
ALTER TABLE `kon_privillege`
  ADD CONSTRAINT `id_login_FK` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_menu_FK` FOREIGN KEY (`id_menu`) REFERENCES `kon_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
