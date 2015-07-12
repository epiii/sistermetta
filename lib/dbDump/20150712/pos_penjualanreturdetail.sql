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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pos_penjualanreturdetail`
--

INSERT INTO `pos_penjualanreturdetail` (`id`, `noretur`, `nofaktur`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'RTJ1207150001', 'FAK1107150004', 'BLOUSE PUTRI', '1', '10000', '0', '10000'),
(2, 'RTJ1207150002', '', 'DASI', '5', '10000', '0', '50000'),
(3, 'RTJ1207150002', '', 'BLOUSE PUTRI', '5', '10000', '0', '50000');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
