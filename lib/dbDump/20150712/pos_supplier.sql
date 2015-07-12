-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2015 at 05:09 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pos_supplier`
--

INSERT INTO `pos_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`, `carabayar`, `termin`) VALUES
(1, 'SUP1107150001', 'CV. MAJU BERKAH', 'JAKARTA', '0215469856', 'Hutang', '30'),
(2, 'SUP1107150002', 'CV. ADIPERKASA', 'SIDOARJO', '0312568899', 'Tunai', '0'),
(3, 'SUP1107150003', 'PT. ADI JAYA', 'SURABAYA', '03156895239', 'Tunai', '0'),
(4, 'SUP1107150004', 'CV. MANDIRI', 'JL. SIMO WAU', '12345678', 'Tunai', '0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
