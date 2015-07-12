-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2015 at 05:08 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pos_penjualandetail`
--

INSERT INTO `pos_penjualandetail` (`id`, `nofaktur`, `nopo`, `jenis`, `kodebarang`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FAK1107150001', '', '1', 'DASI', '5', '10000', '50000', '0', '50000'),
(2, 'FAK1107150001', '', '1', 'KEMEJA PUTRA', '1', '120000', '120000', '0', '120000'),
(3, 'FAK1107150002', '', '1', 'BLOUSE PUTRI', '1', '115000', '115000', '0', '115000'),
(4, 'FAK1107150002', '', '1', 'KAOS OR', '2', '75000', '75000', '0', '150000'),
(5, 'FAK1107150003', '', '1', 'KAOS OR', '1', '75000', '75000', '0', '75000'),
(6, 'FAK1107150004', '', '1', 'BLOUSE PUTRI', '1', '10000', '115000', '0', '10000'),
(7, 'FAK1207150005', '', '1', 'BLOUSE PUTRI', '5', '10000', '115000', '0', '50000');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
