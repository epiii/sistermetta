-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 25 Nov 2015 pada 08.41
-- Versi Server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sister_siadu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_supplier`
--

DROP TABLE IF EXISTS `po_supplier`;
CREATE TABLE IF NOT EXISTS `po_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(256) NOT NULL,
  `fax` varchar(256) NOT NULL,
  `cp` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data untuk tabel `po_supplier`
--

INSERT INTO `po_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`, `fax`, `cp`, `carabayar`, `termin`) VALUES
(2, 'SUPP01', 'TOKO BUKU KWAN', 'KUPANG JAYA B-6', '7319006, 7342858, 08123046611', '', 'AMY', 'HUTANG', '14'),
(3, 'SUPP02', 'TOKO BUKU KWAN PENELEH', 'JL.PENELEH', '5345168', '5323587', 'BU ATIK', 'HUTANG', '14'),
(4, 'SUPP03', 'TOKO ML JAYA ', 'JL. KEMBANG JEPUN 55 G', '3555634, 3571085', '3576414', 'CIK MEI LING, MBAK DARI', 'HUTANG', '14'),
(5, 'SUPP04', 'TOKO GADING MURNI', 'TANJUNG PERAK TIMUR 540 - 542', '3291155, 3295509, 3299247, 78045978', '3294034', 'MBAK IRA/NONA', 'HUTANG', '14'),
(6, 'SUPP05', 'WAHANA SOLUSINDO', 'JL. LONTAR 89', '7521300, 7521304, 7521324', '', 'MBAK SOFIAH', 'HUTANG', '14'),
(7, 'SUPP06', 'UD. TULUS HARAPAN', 'JL. KEMBANG JEPUN 127 G', '5341405', '', '', 'HUTANG', '14'),
(8, 'SUPP07', 'TOKO BOLA MAS', '', '74139167, 71503390', '', 'CIK LENY', 'HUTANG', '14'),
(9, 'SUPP08', 'LUKMAN STATIONARY', '', '7440308, 70913318', '', 'CIK AMING', 'HUTANG', '14'),
(10, 'SUPP09', 'FABER CASTEL ', 'JEMUR ANDAYANI NO. 50 KOMPLEK RUKO SURYA INTI PERMATA BLOK H6 -11', '085646296855, 08883080564, 8412504', '8412684', 'BP SURYA', 'HUTANG', '14'),
(11, 'SUPP10', 'UD. SURYA MULTI', '', '', '', '', 'HUTANG', '14'),
(12, 'SUPP11', 'PT ALTONINDO', 'TEMBAAN 48-D', '3552508, 3559526, 3538927, 3559524', '3538926', 'IBU ELOK', 'HUTANG', '14'),
(13, 'SUPP12', 'HAPPY HOME (FILLING CABINET)', 'GEMBLONGAN 21', '5323768, 5343951', '', '', 'HUTANG', '14'),
(14, 'SUPP13', 'TOKO BUKU LANCAR JAYA', '', '', '', '', 'HUTANG', '14'),
(15, 'SUPP14', 'TOKOBUKUMURAHONLINE.COM', 'RAYA DHARMAHUSADA INDAH 105/D-22', '5922716, TOKOBUKUMURAHONLINE@GMAIL.COM', '5920801', '', 'HUTANG', '14'),
(16, 'SUPP15', 'PERCETAKAN BERKAT', 'KUTISARI DALAM NO.3', '8480079, 8413615, 0811321426', '', 'BP. SAMUEL', 'HUTANG', '14'),
(17, 'SUPP16', 'PERCETAKAN BINTANG FAJAR', 'JL. KEDUNG TARUKAN GG IV NO.33', '70936800', '3736800', 'BP RUDY HERMANTO', 'HUTANG', '14'),
(18, 'SUPP17', 'PERCETAKAN CHRYSANT OFFSET ', 'PETEMON BARAT 235', '71119288, 5452580, 5350833, 08123039288', '5462885', 'BP ANTONY', 'HUTANG', '14'),
(19, 'SUPP18', 'PERCETAKAN GLORY', 'PANDEGILING 324', '5314575, 5675423, 5631942', '5321988', '', 'HUTANG', '14'),
(20, 'SUPP19', 'PERCETAKAN PELANGI', 'KALILOM LOR BARU II / 24', '3729970 - 3716813 - 3731650 - 3731040', '3760163', '', 'HUTANG', '14'),
(21, 'SUPP20', 'PERCETAKAN PRIMA KUALITA', 'SAMBISARI I/35', '70576776, 0816525747', '', 'BP. SUTRISNO', 'HUTANG', '14'),
(22, 'SUPP21', 'IMAGE PLUS ', 'JL. INDRAGIRI 42', '5611594', '5681709', 'MBAK TANTI', 'HUTANG', '14'),
(23, 'SUPP22', 'DINAR PRATAMA ', '', '705,301,033,760,273', '', 'BP RETNO', 'HUTANG', '14'),
(24, 'SUPP23', 'PT ALTONINDO / KURSI CHITOSE', 'TEMBAAN 48-D', '3552508, 3559526, 3538927, 3559524', '3538926', 'IBU ELOK', 'HUTANG', '14'),
(25, 'SUPP24', 'MEBEL DJAJA ABADI', 'GEMLONGAN NO. 54 A', '5476718, 5343179, 5358413, 70928808, 0818392599', '5326848', 'AI SI', 'HUTANG', '14'),
(26, 'SUPP25', 'CITRA RAKUDA', 'JL. NIAS 80 ', '5039907, 5031661', '5030132', '', 'HUTANG', '14'),
(27, 'SUPP26', 'MASONTECH INDONESIA ', '', '', '', 'YOHANES LIMONGAN', 'HUTANG', '14'),
(28, 'SUPP27', 'CHITOSE', 'RUKO RICH PALACE', '5618552', '', '', 'HUTANG', '14'),
(29, 'SUPP28', 'YURIKO', '', '5341160, 5318509', '', '', 'HUTANG', '14'),
(30, 'SUPP29', 'AC APOLLO MERK HONSHU ', 'MAYJEND SUNGKONO NO. 97', '5667789, 082139067777', '5666677', 'FERRY', 'HUTANG', '14'),
(31, 'SUPP30', 'APOLLO JAYA', 'TANJUNG ANOM 1 NO. 11 - 12', '5343555, 5353794', '5465655', '', 'HUTANG', '14'),
(32, 'SUPP31', 'PERDANA ELECTRONIC', 'PANGLIMA SUDIRMAN', '5312199, 5311608', '', 'VIONA', 'HUTANG', '14'),
(33, 'SUPP32', 'HARTONO ELECTRONIC', 'BUKIT DARMO BOULEVARD 12', '7321212', '', '', 'HUTANG', '14'),
(34, 'SUPP33', 'WISMA MELODIA', 'JL. NGAGEL JAYA', '', '', '', 'HUTANG', '14'),
(35, 'SUPP34', 'GRAHANADA MUSIK ', 'RAYA GUBENG NO.32L', '5011890, 5030712, 087851299770', '5030725', 'BP LUCKY', 'HUTANG', '14'),
(36, 'SUPP35', 'MAESTRO MUSIK', 'RAYA KUPANG JAYA 106', ' 7329303, 7341548, 70132000, 7315674', '', 'BP HARTONO', 'HUTANG', '14'),
(37, 'SUPP36', 'PT SIGMA CIPTA KREASINDO', 'SMARTCARDINDO@GMAIL.COM', '', '', '', 'HUTANG', '14'),
(38, 'SUPP37', 'PRINTERKARTU.COM', 'SALES@PRINTERKARTU.COM', '70045557, 8052559', '', '', 'HUTANG', '14'),
(39, 'SUPP38', 'PAPER THERMAL ROLL (80X80)', '', '77333123', '', '', 'HUTANG', '14'),
(40, 'SUPP39', 'UD. LANCAR JAYA', '', '7342343, 7319201', '', '', 'HUTANG', '14'),
(41, 'SUPP40', 'TOKO SUMBER URIP ', 'KRAMAT GANTUNG ', '5315939', '', '', 'HUTANG', '14'),
(42, 'SUPP41', 'IN HOUSE INTERIOR', 'JL. KUPANG INDAH XII/21', '7314983, 91133455', '', '', 'HUTANG', '14'),
(43, 'SUPP42', 'DUNIA KIMIA', 'JL. TIDAR NO. 154', '5465680, 5314341, 70534227', '5465680', 'BP YONG', 'HUTANG', '14'),
(44, 'SUPP43', 'JAYA MAKMUR ', 'BABATAN PRATAMA XPULUHXV EE/25, SBY ', ' 92101080, 081553441499', '', 'HANDRIYANTO', 'HUTANG', '14'),
(45, 'SUPP44', 'HAKNUSA TAPEKON RAYA', '', '86868686', '', 'IBU HAKSINI, MBAK RIMA', 'HUTANG', '14'),
(46, 'SUPP45', 'ANUGERAH JAYA RAYA', '', '51501087, ', '', 'KO AKAOU', 'HUTANG', '14'),
(47, 'SUPP46', 'UD. ANDHIKA JAYA ', 'JL. BUBUTAN 105', '5343973, 5472589', '5472589,', 'BP EDI', 'HUTANG', '14'),
(48, 'SUPP47', 'UD NORTON', 'JL. DUKUH KUPANG 90', '5667777, 5667888', '5679044', 'MBAK INDRA, BU YULI', 'HUTANG', '14'),
(49, 'SUPP48', 'UD GALAXY II', 'JL. LONTAR', '', '', '', 'HUTANG', '14'),
(50, 'SUPP49', 'TOENG', '', '', '', '', 'HUTANG', '14'),
(51, 'SUPP50', 'CAFÉ GLASS', '', '5951228', '', '', 'HUTANG', '14'),
(52, 'SUPP51', 'ALUMINIUM / RAK PIRING', '', '081331026788', '', 'FONG JIU / JUNAIDI', 'HUTANG', '14'),
(53, 'SUPP52', 'ARLISAH', 'JL URIP SUMOHARJO 86', '5341656', '', '', 'HUTANG', '14'),
(54, 'SUPP53', 'PRIMIERE COMPUTER ', 'KOPI 24-26', '70404500, 08123544842', '7886690', 'BP RUDY TANTO', 'HUTANG', '14'),
(55, 'SUPP54', 'PROCOM', 'PETEMON TIMUR NO. 90', '70717233, 5321375, 70898970', '', 'HALIM SETIAWAN', 'HUTANG', '14'),
(56, 'SUPP55', 'UNI PERSADA COMPUTINDO', 'JL. KUSUMA BANGSA 116-118 HITECH MALL LT IA NO 36', '5483387, 5483390', '5483390', 'HOO VIVA RHUHAY', 'HUTANG', '14'),
(57, 'SUPP56', 'K-GALAXY', 'JL. KUSUMA BANGSA 116-118 HITECH MALL LT 2B / 33-37', '5476614, 5348975, 71369028, 081703653505', '5465769', 'ERNA', 'HUTANG', '14'),
(58, 'SUPP57', 'ALTEK COMPUTER', 'JL. KUSUMA BANGSA 116-118 HITECH MALL LT 2 BLOK A-69', '5480038', '5471578', 'JOHNY PATIRAN', 'HUTANG', '14'),
(59, 'SUPP58', 'JURACOM', 'JL. KUSUMA BANGSA 116-118 HITECH MALL LT DASAR A1-47', '5353690 PABX 2126', '5478690', 'ANDREE LEONARDOO', 'HUTANG', '14'),
(60, 'SUPP59', 'BANDUNG COMPUTER', 'JL. KUSUMA BANGSA 116-118 HITECH MALL LT 2 BLOK A-14, A-30', '5353688, 5322073, 81800022, 5478672, 77650086', '547786', 'LIA, MARIA', 'HUTANG', '14'),
(61, 'SUPP60', 'SMART MEDIA COMPUTER', 'JL. KUSUMA BANGSA 116-118 HITECH MALL LT 1 E-40', '5481235, 70784945, SMARTMEDIACOMP@TELKOM.NET', '', 'CONNY', 'HUTANG', '14'),
(62, 'SUPP61', 'PROTECH SOLUTION', 'KUSUMA BANGSA 116-118', '5329829 - 60112766', '5329829', '', 'HUTANG', '14'),
(63, 'SUPP62', 'ARTA KOMPUTER ', 'MAYJEND SUNGKONO - DARMO PARK 2 BLOK 3 NO.1', '5671410', '5617125', 'BU SIU, LINA', 'HUTANG', '14'),
(64, 'SUPP63', 'SUNRISE COMPUTER', '', '', '', '', 'HUTANG', '14'),
(65, 'SUPP64', 'BEN Q - THR (PENJUALAN)', '', '5347514, 5491877', '', '', 'HUTANG', '14'),
(66, 'SUPP65', 'PRIMIERE COMPUTER ', 'KOPI 24-26', '70404500, 08123544842', '7886690', 'BP RUDY TANTO', 'HUTANG', '14'),
(67, 'SUPP66', 'CCTV ROSA', '', '', '', '', 'HUTANG', '14'),
(68, 'SUPP67', 'HARTONO ELECTRONIC', 'BUKIT DARMO BOULEVARD 12', '7321212', '', '', 'HUTANG', '14'),
(69, 'SUPP68', 'PERDANA ELECTRONIC', 'PANGLIMA SUDIRMAN', '5312199, 5311608', '', 'VIONA', 'HUTANG', '14'),
(70, 'SUPP69', 'UD. MULTI TEKNIK', '', '70732357, 08563005864', '', 'JOSEPH', 'HUTANG', '14');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
