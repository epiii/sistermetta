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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `pos_produk`
--

INSERT INTO `pos_produk` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `jumlah`, `hargabeli`, `hargajual`) VALUES
(15, 1, 1, 'BLOUSE PUTRI', 'BLOUSE PUTRI ', '98', '115000', '10000'),
(16, 1, 2, 'JUMPER PUTRI', 'JUMPER PUTRI', '126', '130000', '130000'),
(17, 1, 1, 'KEMEJA PUTRA', 'KEMEJA PUTRA', '409', '120000', '120000'),
(18, 1, 2, 'CELANA PUTRA', 'CELANA PUTRA', '347', '125000', '125000'),
(19, 1, 1, 'DASI', 'DASI', '523', '50000', '10000'),
(20, 1, 3, 'KAOS OR', 'KAOS OLAH RAGA', '783', '75000', '75000'),
(21, 1, 2, 'CELANA OR', 'CELANA OLAH RAGA', '562', '75000', '75000'),
(22, 1, 1, 'TOPI', 'TOPI', '402', '55000', '55000'),
(23, 3, 2, 'KPR1107150001', 'asda', '80', '6000', '6000'),
(24, 3, 3, 'KPR1107150024', 'dcz', '70', '66', '66'),
(25, 1, 3, 'KPR1107150025', 'qweqwe', '66', '6000', '5000'),
(26, 1, 3, 'KPR1207150026', 'BAJU BATIK', '25', '50000', '50000');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
