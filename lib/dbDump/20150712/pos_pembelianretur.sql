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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pos_pembelianretur`
--

INSERT INTO `pos_pembelianretur` (`id`, `noretur`, `noinvoice`, `tgl`, `kodesupplier`, `carabayar`, `total`, `user`) VALUES
(1, 'RTB1207150001', 'INV1107150001', '2015-07-12', 'SUP1107150001', 'Tunai', '375000', 'admin'),
(2, 'RTB1207150002', 'INV1107150001', '2015-07-12', 'SUP1107150001', 'Tunai', '375000', 'admin'),
(3, 'RTB1207150003', '', '2015-07-12', 'SUP1107150002', 'Tunai', '115000', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
