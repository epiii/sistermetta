-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2015 at 06:09 AM
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
-- Table structure for table `hrd_absensi`
--

DROP TABLE IF EXISTS `hrd_absensi`;
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

DROP TABLE IF EXISTS `hrd_agama`;
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

DROP TABLE IF EXISTS `hrd_bayar`;
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

DROP TABLE IF EXISTS `hrd_bebantugas`;
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

DROP TABLE IF EXISTS `hrd_berkas`;
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

DROP TABLE IF EXISTS `hrd_bulan`;
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

DROP TABLE IF EXISTS `hrd_cuti`;
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

DROP TABLE IF EXISTS `hrd_departemen`;
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
(1, 'Meta', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hrd_fungsional`
--

DROP TABLE IF EXISTS `hrd_fungsional`;
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

DROP TABLE IF EXISTS `hrd_golongan`;
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

DROP TABLE IF EXISTS `hrd_history`;
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

DROP TABLE IF EXISTS `hrd_istrianak`;
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

DROP TABLE IF EXISTS `hrd_jabatan`;
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

DROP TABLE IF EXISTS `hrd_karyawan`;
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
(2, '88061701002', '', 'Christine Lovely Halim', 'Jakarta', '1988-06-17', '2', '2', '2', 'Darmo Baru Timur 4/25', 'Surabaya', '', '', '', '', '082140988853', '', '1', '11', '', '2', '-', '2015-06-04', '0000-00-00', '0000-00-00', 0, '4104602490', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(3, '82090801003', '', 'Romana Thensy Sheilla Dewi', 'surabaya', '1982-09-08', '2', '2', '1', 'Ikan Mungsing 8/9', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '', '081515419001', '', '1', '11', '', '1', '9', '2015-06-04', '0000-00-00', '0000-00-00', 0, '4103534491', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(4, '83070201004', '', 'Aulia Rachma', 'surabaya', '1983-07-24', '2', '2', '-', 'Jelidro Indah Blok 3/4', 'Surabaya', '', '', '', '', '08165450503', '9ce1a3962b557e95e3ab023f74ac8ffe.jpg', '1', '11', '', '1', '4', '2015-06-04', '0000-00-00', '0000-00-00', 0, '4107011345', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(5, '88021801005', '', 'Desy Febriyanti', 'surabaya', '1988-02-18', '2', '1', '2', 'Pondok Benowo Indah Blok EN-14', 'Surabaya', '', '', '', '', '085730726173', 'e221dc3d2cd1632230f49a5538de0073.jpg', '1', '11', '', '1', '4', '2015-06-04', '0000-00-00', '0000-00-00', 0, '4108577865', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(10, '78021601007', '', 'Virginia Mustamu', 'Makasar', '1978-02-16', '2', '3', '1', 'Permata Safira A4/8, Lidah Kulon-Lakarsantri', 'surabaya', '60213', 'Jawa Timur', 'Indonesia', '', '087852492300', '96f1a36af6c485fa8515ed8112c0a9b7.jpg', '1', '11', '', '1', '9', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4100246746', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(7, '', '', 'asd', 'ads', '2015-07-22', '1', '6', '2', '', '', '', '', '', '', '', '', '', '', '', '', '3', '0000-00-00', '0000-00-00', '0000-00-00', 0, '', '', '', '0', '0000-00-00', '', '', '2015-07-12', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(9, '87052601006', '', 'Rycha Rany Susanto', 'surabaya', '1987-05-26', '2', '1', '1', 'Lidah Harapan Blok X No.27', 'surabaya', '', '', '', '', '', '896d5f0fef3a1b4e03a18b166eb289e0.jpg', '1', '13', '', '1', '5', '2015-07-24', '0000-00-00', '0000-00-00', 0, '2912687271', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(11, '87012601008', '', 'Agnes Dian Christy', 'Sidoarjo', '1987-01-26', '2', '2', '2', 'Babatan Indah B1-24', '', '', '', '', '', '', '7c927cb609fbf536fcfe1045b34bf350.jpg', '1', '11', '', '1', '4', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4108355358', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(12, '86122801009', '', 'Rima Yosita Prayitno', 'Palembang', '1986-12-28', '2', '1', '2', 'Pondok Mutiara D/1,Sidoarjo', '', '', '', '', '', '', '6e9b38073b06b1b1452be681605b3716.jpg', '1', '11', '', '2', '4', '2015-07-24', '0000-00-00', '0000-00-00', 0, '9807290786', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(13, '65012401010', '', 'Maria Theresia Sri Murni', 'surabaya', '1965-01-24', '2', '3', '1', 'Pondok Benowo Indah AZ/28', '', '', '', '', '', '', '53ae7b78981f2936814f76f43d1918e9.jpg', '1', '11', '', '1', '5', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4105667251', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(14, '91010401011', '', 'Yesicca Irene', 'Malang', '1991-01-04', '2', '7', '2', 'Ratah Tiga No.39, Malang', '', '', '', '', '', '', '', '1', '11', '', '2', '4', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4105667278', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(15, '88042101012', '', 'Gondo Subekti', 'Jayapura', '1988-04-21', '1', '1', '2', 'Dusun Kenanten RT01/RW02,Mojokerto', '', '', '', '', '', '', 'fa68f10e98decc62302da344459fc5b7.jpg', '1', '11', '', '1', '4', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4107011086', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(16, '92061601013', '', 'Yuni Herawati', 'Cirebon', '1992-06-16', '2', '2', '2', 'Jl. KH Ali 2A RT04 RW02 Sekarputih,Bondowoso', '', '', '', '', '', '088210406279', '557bef4264b8e27ba1ce43b2980e86cb.jpg', '1', '11', '', '1', '4', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4110328864', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(17, '86050401014', '', 'Roesanty Eka Taruna', 'surabaya', '1986-05-04', '2', '1', '2', 'Balongsari Madya 7A/29,Surabaya', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '087854510447', '6f117826a056d6eed98ed39ad0aac82f.jpg', '1', '11', '', '1', '4', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4102500879', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(18, '88070802001', '', 'Shelvi Dyah Pratiwi', 'surabaya', '1988-07-08', '2', '1', '1', 'Putat Gede Timur 4/46', 'surabaya', '60189', 'Jawa Timur', 'Indonesia', '', '081330994950', '', '1', '19', '', '1', '3', '2015-07-24', '0000-00-00', '0000-00-00', 0, '2912685589', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(19, '83070202002', '', 'Laily Fitriyah', 'surabaya', '1983-07-02', '2', '1', '1', 'Sumberan Jl.HKSN 1 No.25,Balasklumprik-wiyung Surabaya', 'surabaya', '60222', 'Jawa Timur', 'Indonesia', '', '081515190488', 'c348a668f2eb1af7ea7d561e9f5b32dc.jpg', '1', '19', '', '1', '3', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4100246142', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(20, '67062102003', '', 'Boniyem', 'Ponorogo', '1967-06-21', '2', '1', '1', 'Dukuh Doyong RT 01 RW 01,Ponorogo', '', '', '', '', '', '', '49a742001ad07e5e37458c7a3918725f.jpg', '1', '-', '', '1', '3', '2015-07-24', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(21, '72051002004', '', 'Krisnawati', 'Blitar', '1972-05-10', '2', '1', '1', 'Jl.Kapuas FL7 Wisma Tropodo RT056 RW 006', '', '', '', '', '', '', '461e83d954a663f18fdc88ba13a2d692.jpg', '1', '-', '', '1', '3', '2015-07-24', '0000-00-00', '0000-00-00', 0, '4105667537', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(22, '82021801015', '', 'Julia Agahari', 'surabaya', '1982-02-18', '2', '7', '1', 'Darmo Permai Utara IV No.12', 'surabaya', '60187', 'Jawa Timur', 'Indonesia', '0317314775', '08165409830', 'e20c808827bb2526dc14c44c95bdc594.jpg', '1', '11', '', '1', '4', '2015-07-28', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(23, '66032001016', '', 'Brett Riley Noel', 'Ohio', '1966-03-20', '1', '3', '1', 'Puncak Permai Utara 45-47', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '', '777501c2aaec351cfd2596baa446683c.jpg', '1', '11', '', '1', '5', '2015-07-28', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(24, '82052401016', '', 'Lusiani', 'surabaya', '2015-07-28', '2', '7', '1', '', '', '', '', '', '', '', '5771246b9b3c6d1e7bb57c7a99ed5059.jpg', '1', '11', '', '1', '4', '2015-07-28', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(25, '81090101017', '', 'Sukma Yenti', 'Pekanbaru', '1981-09-01', '2', '7', '1', 'Bukit Telaga Golf TE 4/16,Citraland', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '085265222649', '8728bc84a19d0f79c17a93bd6624c46c.jpg', '1', '11', '', '2', '4', '2005-07-01', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(26, '78082701018', '', 'Dyah Jarmawati', 'surabaya', '1978-08-27', '2', '1', '1', 'Jl.Praja Mukti No.30 Tanggulangin', 'sidoarjo', '', 'Jawa Timur', 'Indonesia', '', '089679684262', '', '1', '11', '', '1', '4', '2015-07-28', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(27, '89090401019', '', 'Yuva Sephany', 'Tarakan', '1989-09-04', '2', '2', '2', 'Simorejo 17/5', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '085731664855', '', '1', '11', '', '1', '4', '2015-08-25', '0000-00-00', '0000-00-00', 0, '4121435557', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(28, '92053101020', '', 'Menik Ida Suryani', 'surabaya', '1992-05-31', '2', '1', '2', 'Griya Surabaya Asri A9/17', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '085733215610', 'c7ca75ebca7a28c95f524f8aff4e8fbd.jpg', '1', '11', '', '1', '4', '2015-08-25', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(29, '93080801021', '', 'Ericko Arifin Bong', 'Kalimantan', '1993-08-08', '1', '7', '2', 'Perumahan Taman Puspa Raya , Citraland', 'surabaya', '', 'Jawa Timur', 'Indonesia', '', '081282621543', 'c73d93e58ca4e7b37872e9e7f4019b4d.jpg', '1', '11', '', '1', '4', '2015-08-25', '0000-00-00', '0000-00-00', 0, '4113531008', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(30, '15151501022', '', 'Michel Habersaat', '', '2015-08-25', '-', '-', '-', '', '', '', '', '', '', '', '087cd17ac957ec3aecaa153c5c367e9a.jpg', '-', '-', '', '-', '-', '2015-08-25', '0000-00-00', '0000-00-00', 0, '9810440004', 'Michel Habersaat', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
(31, '15151501023', '', 'Ida Bagus Kartika Dewi', 'surabaya', '2015-08-25', '2', '7', '1', '', '', '', '', '', '', '', 'fe06ac0999d0b2e15581796ce731bdec.jpg', '1', '11', '', '2', '4', '2015-08-25', '0000-00-00', '0000-00-00', 0, '0', '0', '0', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hrd_kelamin`
--

DROP TABLE IF EXISTS `hrd_kelamin`;
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

DROP TABLE IF EXISTS `hrd_menikah`;
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

DROP TABLE IF EXISTS `hrd_m_agama`;
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

DROP TABLE IF EXISTS `hrd_m_bagian`;
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

DROP TABLE IF EXISTS `hrd_m_dokumen`;
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

DROP TABLE IF EXISTS `hrd_m_jenistraining`;
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

DROP TABLE IF EXISTS `hrd_m_kelompok`;
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

DROP TABLE IF EXISTS `hrd_m_keluarga`;
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

DROP TABLE IF EXISTS `hrd_m_marital`;
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

DROP TABLE IF EXISTS `hrd_m_posisi`;
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

DROP TABLE IF EXISTS `hrd_m_status`;
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

DROP TABLE IF EXISTS `hrd_m_tingkat`;
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

DROP TABLE IF EXISTS `hrd_pegawai`;
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

DROP TABLE IF EXISTS `hrd_pendidikan`;
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

DROP TABLE IF EXISTS `hrd_pengabdian`;
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

DROP TABLE IF EXISTS `hrd_penggajian`;
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

DROP TABLE IF EXISTS `hrd_pinjaman`;
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

DROP TABLE IF EXISTS `hrd_setting`;
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

DROP TABLE IF EXISTS `hrd_statuskaryawan`;
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

DROP TABLE IF EXISTS `hrd_struktural`;
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

DROP TABLE IF EXISTS `hrd_tipe`;
CREATE TABLE IF NOT EXISTS `hrd_tipe` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hrd_training`
--

DROP TABLE IF EXISTS `hrd_training`;
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

DROP TABLE IF EXISTS `hrd_uangmakan`;
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

DROP TABLE IF EXISTS `hrd_uangtransport`;
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

DROP TABLE IF EXISTS `hrd_walikelas`;
CREATE TABLE IF NOT EXISTS `hrd_walikelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `situs`
--

DROP TABLE IF EXISTS `situs`;
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
-- Table structure for table `useraura`
--

DROP TABLE IF EXISTS `useraura`;
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
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 0, '2015-09-10 08:55:57', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
