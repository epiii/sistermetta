-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2015 at 05:07 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `nofaktur`, `nopo`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(4, 'FAK1107150001', '', '2015-07-11', '30', 'Tunai', '340000', '0', '340000', '340000', '0', '0', '', 'admin'),
(5, 'FAK1107150002', '', '2015-07-11', '32', 'Tunai', '265000', '0', '265000', '265000', '0', '0', '', 'admin'),
(6, 'FAK1107150003', '', '2015-07-11', '29', 'Tunai', '75000', '0', '75000', '75000', '0', '0', '', 'admin'),
(7, 'FAK1107150004', '', '2015-07-11', '31', 'Tunai', '10000', '0', '10000', '10000', '0', '0', '', 'admin'),
(8, 'FAK1207150005', '', '2015-07-12', '33', 'Tunai', '50000', '0', '50000', '50000', '0', '0', '', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
