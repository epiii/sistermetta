-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2015 at 05:22 PM
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
-- Table structure for table `pos_alur_stok`
--

DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `pos_alur_stok`
--

INSERT INTO `pos_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(1, '2015-07-11', 'Pembelian', 'INV1107150001', 'CELANA OR', '10'),
(2, '2015-07-11', 'Penjualan', 'FAK1107150001', 'DASI', '5'),
(3, '2015-07-11', 'Penjualan', 'FAK1107150001', 'KEMEJA PUTRA', '1'),
(4, '2015-07-11', 'Penjualan', 'FAK1107150001', 'DASI', '5'),
(5, '2015-07-11', 'Penjualan', 'FAK1107150001', 'KEMEJA PUTRA', '1'),
(6, '2015-07-11', 'Penjualan', 'FAK1107150001', 'DASI', '5'),
(7, '2015-07-11', 'Penjualan', 'FAK1107150001', 'KEMEJA PUTRA', '1'),
(8, '2015-07-11', 'Penjualan', 'FAK1107150002', 'BLOUSE PUTRI', '1'),
(9, '2015-07-11', 'Penjualan', 'FAK1107150002', 'KAOS OR', '2'),
(10, '2015-07-11', 'Penjualan', 'FAK1107150003', 'KAOS OR', '1'),
(11, '2015-07-11', 'Penjualan', 'FAK1107150004', 'BLOUSE PUTRI', '1'),
(12, '2015-07-12', 'Retur Pembelian', 'RTB1207150001', 'CELANA OR', '5'),
(13, '2015-07-12', 'Retur Pembelian', 'RTB1207150002', 'CELANA OR', '5'),
(14, '2015-07-12', 'Retur Pembelian', 'RTB1207150003', 'BLOUSE PUTRI', '1'),
(15, '2015-07-12', 'Retur Penjualan', 'RTJ1207150001', 'BLOUSE PUTRI', '1'),
(16, '2015-07-12', 'Retur Penjualan', 'RTJ1207150002', 'DASI', '5'),
(17, '2015-07-12', 'Retur Penjualan', 'RTJ1207150002', 'BLOUSE PUTRI', '5'),
(18, '2015-07-01', 'stok awal', '-', 'TOPI', '402'),
(19, '2015-07-01', 'stok awal', '-', 'CELANA OR', '562'),
(20, '2015-07-12', 'Saldo Awal', '-', 'KPR1207150026', '25'),
(21, '2015-07-12', 'Penjualan', 'FAK1207150005', 'BLOUSE PUTRI', '5');

-- --------------------------------------------------------

--
-- Table structure for table `pos_biayabulanan`
--

DROP TABLE IF EXISTS `pos_biayabulanan`;
CREATE TABLE `pos_biayabulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pos_biayabulanan`
--

INSERT INTO `pos_biayabulanan` (`id`, `tgl`, `nama`, `subtotal`) VALUES
(1, '2015-07-01', 'LISTRIK', '500000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_customer`
--

DROP TABLE IF EXISTS `pos_customer`;
CREATE TABLE `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_jenisproduk`
--

DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis` enum('BARANG','JASA') NOT NULL DEFAULT 'BARANG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

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

DROP TABLE IF EXISTS `pos_jenjang`;
CREATE TABLE `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `pos_jenjang`
--

INSERT INTO `pos_jenjang` (`id`, `nama`) VALUES
(1, 'Playgroup'),
(2, 'Kindegarden'),
(3, 'Elementary'),
(4, 'Primary');

-- --------------------------------------------------------

--
-- Table structure for table `pos_kelas`
--

DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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

DROP TABLE IF EXISTS `pos_pembelian`;
CREATE TABLE `pos_pembelian` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pos_pembelian`
--

INSERT INTO `pos_pembelian` (`id`, `noinvoice`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `hutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'INV1107150001', '', '2015-07-11', 'SUP1107150001', 'Tunai', '750000', '0', '750000', '750000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembeliandetail`
--

DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pos_pembeliandetail`
--

INSERT INTO `pos_pembeliandetail` (`id`, `noinvoice`, `nopo`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'INV1107150001', '', 'CELANA OR', '10', '75000', '0', '750000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelianretur`
--

DROP TABLE IF EXISTS `pos_pembelianretur`;
CREATE TABLE `pos_pembelianretur` (
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

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelianreturdetail`
--

DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pos_pembelianreturdetail`
--

INSERT INTO `pos_pembelianreturdetail` (`id`, `noretur`, `noinvoice`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'RTB1207150001', 'INV1107150001', 'CELANA OR', '5', '75000', '0', '375000'),
(2, 'RTB1207150002', 'INV1107150001', 'CELANA OR', '5', '75000', '0', '375000'),
(3, 'RTB1207150003', '', 'BLOUSE PUTRI', '1', '115000', '0', '115000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualan`
--

DROP TABLE IF EXISTS `pos_penjualan`;
CREATE TABLE `pos_penjualan` (
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

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanbiaya`
--

DROP TABLE IF EXISTS `pos_penjualanbiaya`;
CREATE TABLE `pos_penjualanbiaya` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pos_penjualanbiaya`
--

INSERT INTO `pos_penjualanbiaya` (`id`, `nofaktur`, `tgl`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `user`) VALUES
(1, 'FKB1107150001', '2015-07-11', 'Tunai', '45000', '0', '45000', '45000', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanbiayadetail`
--

DROP TABLE IF EXISTS `pos_penjualanbiayadetail`;
CREATE TABLE `pos_penjualanbiayadetail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pos_penjualanbiayadetail`
--

INSERT INTO `pos_penjualanbiayadetail` (`id`, `nofaktur`, `kodebiaya`, `jenis`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FKB1107150001', 'KBB1107150001', 3, '1', '50000', '0', '5000', '45000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualandetail`
--

DROP TABLE IF EXISTS `pos_penjualandetail`;
CREATE TABLE `pos_penjualandetail` (
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

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanjasa`
--

DROP TABLE IF EXISTS `pos_penjualanjasa`;
CREATE TABLE `pos_penjualanjasa` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_penjualanjasa`
--

INSERT INTO `pos_penjualanjasa` (`id`, `nofaktur`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'FKJ1107150001', '2015-07-11', '30', 'Tunai', '70000', '0', '70000', '70000', '0', '0', '', 'admin'),
(2, 'FKJ1107150002', '2015-07-11', '31', 'Tunai', '220000', '0', '220000', '220000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanjasadetail`
--

DROP TABLE IF EXISTS `pos_penjualanjasadetail`;
CREATE TABLE `pos_penjualanjasadetail` (
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

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanretur`
--

DROP TABLE IF EXISTS `pos_penjualanretur`;
CREATE TABLE `pos_penjualanretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_penjualanretur`
--

INSERT INTO `pos_penjualanretur` (`id`, `noretur`, `nofaktur`, `tgl`, `kodecustomer`, `carabayar`, `total`, `user`) VALUES
(1, 'RTJ1207150001', 'FAK1107150004', '2015-07-12', '31', 'Tunai', '10000', 'admin'),
(2, 'RTJ1207150002', '', '2015-07-12', '33', 'Tunai', '100000', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanreturdetail`
--

DROP TABLE IF EXISTS `pos_penjualanreturdetail`;
CREATE TABLE `pos_penjualanreturdetail` (
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

-- --------------------------------------------------------

--
-- Table structure for table `pos_produk`
--

DROP TABLE IF EXISTS `pos_produk`;
CREATE TABLE `pos_produk` (
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

-- --------------------------------------------------------

--
-- Table structure for table `pos_produkbiaya`
--

DROP TABLE IF EXISTS `pos_produkbiaya`;
CREATE TABLE `pos_produkbiaya` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_produkbiaya`
--

INSERT INTO `pos_produkbiaya` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `hargajual`) VALUES
(1, 3, '2', 'KBB1107150001', 'RENOVASI', '50000'),
(2, 6, '3', 'KBB1107150002', 'GAJI PEGAWAI', '50000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_produkjasa`
--

DROP TABLE IF EXISTS `pos_produkjasa`;
CREATE TABLE `pos_produkjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_produkjasa`
--

INSERT INTO `pos_produkjasa` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `hargajual`) VALUES
(1, 6, '1', 'KPR1107150025', 'KURSUS MANDARIN', '70000'),
(2, 6, '3', 'KPR1107150026', 'KURSUS BALET', '150000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_situs`
--

DROP TABLE IF EXISTS `pos_situs`;
CREATE TABLE `pos_situs` (
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

DROP TABLE IF EXISTS `pos_supplier`;
CREATE TABLE `pos_supplier` (
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

-- --------------------------------------------------------

--
-- Table structure for table `pos_useraura`
--

DROP TABLE IF EXISTS `pos_useraura`;
CREATE TABLE `pos_useraura` (
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
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 0, '2015-06-23 06:50:28', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
