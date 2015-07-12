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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pos_penjualanjasadetail`
--

INSERT INTO `pos_penjualanjasadetail` (`id`, `nofaktur`, `kodejasa`, `jenis`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FKJ1107150001', 'KPR1107150025', 6, '1', '70000', '0', '0', '70000'),
(2, 'FKJ1107150002', 'KPR1107150025', 6, '1', '70000', '0', '0', '70000'),
(3, 'FKJ1107150002', 'KPR1107150026', 6, '1', '150000', '0', '0', '150000');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
