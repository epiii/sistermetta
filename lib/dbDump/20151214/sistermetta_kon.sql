-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2015 at 03:15 AM
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

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `listdept`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listdept`()
BEGIN
	SELECT replid, nama departemen from departemen order by nama asc;
END$$

DROP PROCEDURE IF EXISTS `listTingkatByDept`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listTingkatByDept`(IN `dept` int)
BEGIN
	SELECT t.replid, t.tingkat,t.urutan
	FROM
		aka_tingkat t
		JOIN aka_subtingkat st ON st.tingkat = t.replid
		JOIN aka_kelas k ON k.subtingkat = st.replid
	WHERE k.departemen = dept
	GROUP BY t.replid
	ORDER BY t.urutan ASC;
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `getAnggaranKuota`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getAnggaranKuota`(`idAnggaranTahunan` int) RETURNS decimal(14,0)
BEGIN
	DECLARE anggaranKuota DECIMAL; 
		SELECT 
			SUM(a.hargasatuan * na.jml)INTO anggaranKuota
		FROM 
			keu_nominalanggaran  na
			JOIN keu_anggarantahunan a on a.replid = na.anggarantahunan
		WHERE 
			na.anggarantahunan = idAnggaranTahunan;
	RETURN anggaranKuota;
END$$

DROP FUNCTION IF EXISTS `getAnggaranPerItem`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getAnggaranPerItem`(`idanggarantahunan` int) RETURNS decimal(14,0)
BEGIN
	DECLARE detilanggaranTotal DECIMAL;
	SELECT
		sum((
			SELECT (na.jml * hargasatuan) 
			FROM keu_anggarantahunan 
			WHERE replid=na.anggarantahunan
		)) INTO detilanggaranTotal
	FROM
		keu_nominalanggaran na
	WHERE
		na.anggarantahunan = idanggarantahunan;
	RETURN detilanggaranTotal;
END$$

DROP FUNCTION IF EXISTS `getAnggaranPerKategori`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getAnggaranPerKategori`(`idkategorianggaran` int,`idtahunajaran` int) RETURNS decimal(14,0)
BEGIN
	DECLARE nom DECIMAL(14);
	SELECT 
		sum((getAnggaranPerItem(ath.replid))) INTO nom
	FROM keu_detilanggaran da 
		left JOIN keu_anggarantahunan ath on ath.detilanggaran = da.replid
	WHERE
		ath.tahunajaran = idtahunajaran and 
		da.kategorianggaran = idkategorianggaran;
	RETURN nom;
END$$

DROP FUNCTION IF EXISTS `getBiayaAfterDiskonReg`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getBiayaAfterDiskonReg`(`idsiswabiaya` INT) RETURNS decimal(14,0)
    READS SQL DATA
BEGIN
	declare biayaAfterDR DECIMAL default getBiayaAwal(idsiswabiaya);
	declare vDiskon FLOAT;
	declare rowHabis1 INT DEFAULT 0;  
	declare cursor1 cursor for
		SELECT
			dd.nilai
		FROM
			psb_siswadiskon sd
			JOIN psb_detaildiskon dd on dd.replid = sd.detaildiskon
		WHERE
			sd.siswabiaya = idsiswabiaya;
	declare continue handler for not found set rowHabis1 = 1;
	open cursor1;
	LOOP1: loop
		fetch cursor1
		into  vDiskon;
		if rowHabis1 then close cursor1; leave LOOP1;
		end if;
		
		SET biayaAfterDR=biayaAfterDR-(biayaAfterDR*vDiskon/100);
	END loop LOOP1;
	return biayaAfterDR;
END$$

DROP FUNCTION IF EXISTS `getBiayaAwal`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getBiayaAwal`(`idsiswabiaya` INT) RETURNS decimal(11,0)
BEGIN
	DECLARE hasil int;
		SELECT
			db.nominal INTO hasil
		FROM  psb_siswabiaya sb 
			JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
		WHERE 
			sb.replid = idsiswabiaya;
	RETURN hasil;
END$$

DROP FUNCTION IF EXISTS `getbiayaNett`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getbiayaNett`(`idsiswabiaya` int) RETURNS decimal(14,0)
BEGIN
	DECLARE ret decimal default getBiayaAfterDiskonReg(idsiswabiaya);
		declare r decimal;
        select ifnull(diskonkhusus,0)  into r 
        from psb_siswabiaya 
        where replid=idsiswabiaya;
	set ret=ret-r;
    RETURN ret;
END$$

DROP FUNCTION IF EXISTS `getBiayaTerbayar`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getBiayaTerbayar`(`idsiswabiaya` INT) RETURNS decimal(10,0)
    READS SQL DATA
BEGIN
	declare ret decimal default getBiayaNett(idsiswabiaya);
	declare r decimal;
	SELECT IFNULL(sum(nominal),0) INTO r  from keu_penerimaansiswa where siswabiaya = idsiswabiaya;
	set ret=ret-r;
	RETURN r;
END$$

DROP FUNCTION IF EXISTS `getDiskonKhusus`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getDiskonKhusus`(`idsiswa` int,`idbiaya` int) RETURNS int(11)
BEGIN
	DECLARE hasil int;
		SELECT
			sb.diskonkhusus INTO hasil
		FROM  psb_siswabiaya sb 
			JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
		WHERE
			db.biaya = idbiaya and 
			sb.siswa = idsiswa;
	RETURN hasil;
END$$

DROP FUNCTION IF EXISTS `getKuotaAnggaran2`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getKuotaAnggaran2`(`idDetilAnggaran` int,`idTahunAjaran` int) RETURNS decimal(14,0)
BEGIN
	DECLARE kuotaAnggaran DECIMAL; 
	SELECT (
			SELECT sum(ath.hargasatuan * na.jml) 
			FROM keu_nominalanggaran na 
			WHERE na.anggarantahunan= ath.replid
		)into kuotaAnggaran
	FROM
		keu_anggarantahunan ath 
		JOIN keu_detilanggaran da on da.replid = ath.detilanggaran
	WHERE
		ath.tahunajaran = idTahunAjaran and
		ath.detilanggaran = idDetilAnggaran;	
	RETURN kuotaAnggaran ;
END$$

DROP FUNCTION IF EXISTS `getNamaAnggaran`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getNamaAnggaran`(`idAnggaranTahunan` int) RETURNS varchar(250) CHARSET latin1
BEGIN
	DECLARE nama VARCHAR(250); 
		SELECT
			CONCAT(da.detilanggaran," (",ka.kategorianggaran,")") INTO nama
		FROM
			keu_anggarantahunan ath
			JOIN keu_detilanggaran da ON da.replid = ath.detilanggaran
			JOIN keu_kategorianggaran ka ON ka.replid = da.kategorianggaran
		WHERE
			ath.replid = idAnggaranTahunan;
	RETURN nama;
END$$

DROP FUNCTION IF EXISTS `getOperatorDetRekening`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getOperatorDetRekening`(`idDetilRekening` int,`jenisRekening` char) RETURNS char(1) CHARSET latin1
BEGIN
	DECLARE operator char(1);
	SELECT 
		t.operator INTO operator
	FROM(
		SELECT
			(kr.jenistambah)jenis,
			if(kr.jenis="","+","+") as operator,
			dr.replid iddetilrekening
		FROM
			keu_detilrekening dr 
			JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening
		UNION
		SELECT
			(kr.jeniskurang)jenis,
			if(kr.jenis="","-","-") as operator,
			dr.replid iddetilrekening
		FROM
			keu_detilrekening dr 
			JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening
	)t
	WHERE	
		t.iddetilrekening= idDetilRekening AND
		t.jenis=jenisRekening;
	RETURN operator;
END$$

DROP FUNCTION IF EXISTS `getSaldoAwalRekening`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getSaldoAwalRekening`(`idDetilRekening` int,`idTahunAjaran` int) RETURNS decimal(14,0)
BEGIN
	DECLARE saldoRekening decimal(14);
	SELECT nominal INTO saldoRekening
	from keu_saldorekening 
	WHERE detilrekening = idDetilRekening and tahunajaran = idTahunAjaran;
	RETURN saldoRekening;
END$$

DROP FUNCTION IF EXISTS `getSaldoRekening`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getSaldoRekening`(`idDetilRekening` int,`idTahunAjaran` int) RETURNS decimal(14,0)
BEGIN
	DECLARE saldoRekening DECIMAL; 
		SELECT sr.nominal into saldoRekening
		FROM keu_saldorekening sr
		WHERE 
			sr.detilrekening = idDetilRekening and 
			sr.tahunajaran = idTahunAjaran;
	RETURN saldoRekening ;
END$$

DROP FUNCTION IF EXISTS `getSaldoRekeningByTgl`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getSaldoRekeningByTgl`(`idDetRek` int,`tgl1` date,`tgl2` date) RETURNS decimal(14,0)
BEGIN
	DECLARE saldoRekening DECIMAL(14);
		SELECT IFNULL(sum(concat(operator,nominal)),0) into saldoRekening
		FROM vw_transaksi
		WHERE 
			(tanggal BETWEEN  tgl1 and tgl2 )
			and iddetilrekening = idDetRek
		ORDER BY tanggal ASC;
	RETURN saldoRekening;
END$$

DROP FUNCTION IF EXISTS `getSaldoRekeningSkrg`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getSaldoRekeningSkrg`(`idDetilRekening` int) RETURNS decimal(14,0)
BEGIN
	declare saldoRekening DECIMAL (14);
	SELECT (
		getSaldoAwalRekening(idDetilRekening,getTahunAjaran(CURDATE()))+
		getSaldoRekeningByTgl(idDetilRekening,getTglMulaiTahunAjaran(getTahunAjaran(CURDATE())),getTglSelesaiTahunAjaran(getTahunAjaran(CURDATE())))
	)INTO saldoRekening;
	RETURN saldoRekening;
END$$

DROP FUNCTION IF EXISTS `getSemester`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getSemester`(`tgl` date) RETURNS int(11)
BEGIN
	DECLARE idSemester INT;
		SELECT replid into idSemester
		FROM aka_semester 
		WHERE tgl BETWEEN tglMulai and tglSelesai;
	RETURN idSemester;
END$$

DROP FUNCTION IF EXISTS `getStatusBayar`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getStatusBayar`(`idsiswabiaya` INT) RETURNS varchar(25) CHARSET latin1
BEGIN
	DECLARE s varchar(25);
	    declare terbayar  decimal default getBiayaTerbayar(idsiswabiaya);
	    declare tagihan decimal default getBiayaNett(idsiswabiaya);
		
	    IF terbayar = tagihan THEN SET s = 'lunas';
		ELSEIF terbayar =0 THEN SET s = 'belum';
		ELSE SET s = 'kurang';
		END IF;
	RETURN s;
END$$

DROP FUNCTION IF EXISTS `getTahunAjaran`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getTahunAjaran`(`tgl` date) RETURNS int(11)
BEGIN
	DECLARE idTahunAjaran INT;
	SELECT tahunajaran into idTahunAjaran
	FROM aka_semester 
	WHERE tgl BETWEEN tglMulai and tglSelesai;
	RETURN idTahunAjaran;
END$$

DROP FUNCTION IF EXISTS `getTglMulaiTahunAjaran`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getTglMulaiTahunAjaran`(idThn INT) RETURNS varchar(10) CHARSET latin1
BEGIN
	DECLARE tgl VARCHAR(10);
		SELECT MIN(tglMulai) INTO tgl FROM aka_semester WHERE tahunajaran = idThn;
	RETURN tgl;
END$$

DROP FUNCTION IF EXISTS `getTgSelesaiTahunAjaran`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getTgSelesaiTahunAjaran`(idThn INT) RETURNS varchar(10) CHARSET latin1
BEGIN
	DECLARE tgl VARCHAR(10);
		SELECT MAX(tglMulai) INTO tgl FROM aka_semester WHERE tahunajaran = idThn;
	RETURN tgl;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kon_aksi`
--

DROP TABLE IF EXISTS `kon_aksi`;
CREATE TABLE IF NOT EXISTS `kon_aksi` (
  `id_aksi` int(11) NOT NULL AUTO_INCREMENT,
  `aksi` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_aksi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `kon_aksi`
--

INSERT INTO `kon_aksi` (`id_aksi`, `aksi`, `keterangan`) VALUES
(1, 'r', 'read'),
(2, 'c', 'create'),
(3, 'u', 'update'),
(4, 'd', 'delete'),
(5, 'p', 'print/report');

-- --------------------------------------------------------

--
-- Table structure for table `kon_grupmenu`
--

DROP TABLE IF EXISTS `kon_grupmenu`;
CREATE TABLE IF NOT EXISTS `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_katgrupmenu` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `kon_grupmenu`
--

INSERT INTO `kon_grupmenu` (`id_grupmenu`, `id_katgrupmenu`, `id_modul`, `grupmenu`, `size`) VALUES
(1, 2, 1, 'Menu Kesiswaan', 'four'),
(2, 2, 1, 'Menu Belajar - Mengajar', 'four'),
(3, 1, 1, 'Menu Master', 'four'),
(4, 2, 2, 'Menu Transaksi', 'four'),
(5, 2, 6, 'Transaksi Keuangan Umum', ''),
(6, 1, 6, 'Master Keuangan Umum', ''),
(7, 1, 9, 'Menu Sistem', 'double'),
(8, 2, 9, 'Menu User', 'double'),
(9, 1, 2, 'Menu Master', 'four'),
(14, 1, 3, 'Menu Master ', 'double double-vertic'),
(15, 2, 3, 'Menu Transaksi', 'double double-vertic'),
(16, 1, 5, 'Master HRD', 'four'),
(17, 2, 5, 'Transaksi HRD', 'four'),
(18, 2, 5, 'Penggajian', 'four'),
(19, 1, 7, 'Master Student Service', 'four'),
(20, 2, 7, 'Pembelian', 'four'),
(21, 2, 7, 'Penjualan', ''),
(24, 2, 7, 'Jasa', 'four'),
(25, 2, 7, 'Hutang / Piutang', 'four'),
(26, 2, 7, 'biaya', 'four'),
(27, 2, 7, 'Laporan', 'four'),
(28, 2, 7, 'Setting', ''),
(29, 1, 13, 'Master PO', 'four'),
(30, 2, 13, 'Permintaan', 'four'),
(31, 1, 13, 'Penawaran', 'four'),
(32, 2, 13, 'Pemesanan', 'four'),
(33, 2, 13, 'Pembelian', 'four'),
(34, 2, 13, 'setting', ''),
(35, 1, 4, 'Transaksi Sarpras', 'four'),
(37, 1, 4, 'Master Sarpras', 'four'),
(38, 1, 14, 'setting', 'four'),
(39, 2, 14, 'transaksi', 'four'),
(40, 2, 6, 'Transaksi Keuangan Siswa ', 'four'),
(41, 1, 6, 'Master Keuangan Siswa', '');

-- --------------------------------------------------------

--
-- Table structure for table `kon_grupmodul`
--

DROP TABLE IF EXISTS `kon_grupmodul`;
CREATE TABLE IF NOT EXISTS `kon_grupmodul` (
  `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmodul`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `kon_grupmodul`
--

INSERT INTO `kon_grupmodul` (`id_grupmodul`, `grupmodul`, `size`) VALUES
(1, 'satu', 'four'),
(2, 'dua', 'four'),
(3, 'tiga', 'four');

-- --------------------------------------------------------

--
-- Table structure for table `kon_icon`
--

DROP TABLE IF EXISTS `kon_icon`;
CREATE TABLE IF NOT EXISTS `kon_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(25) NOT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `kon_icon`
--

INSERT INTO `kon_icon` (`id_icon`, `icon`) VALUES
(1, 'akademik'),
(2, 'sarpras'),
(3, 'hrd'),
(4, 'psb'),
(5, 'keuangan'),
(6, 'student'),
(7, 'perpus'),
(8, 'manajemen'),
(9, 'pencil'),
(10, 'address-book'),
(11, 'book'),
(12, 'copy'),
(13, 'user-3'),
(14, 'user'),
(15, 'grid-view'),
(16, 'tab'),
(17, 'cog'),
(18, 'user-2'),
(20, 'loop');

-- --------------------------------------------------------

--
-- Table structure for table `kon_katgrupmenu`
--

DROP TABLE IF EXISTS `kon_katgrupmenu`;
CREATE TABLE IF NOT EXISTS `kon_katgrupmenu` (
  `id_katgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `katgrupmenu` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_katgrupmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `kon_katgrupmenu`
--

INSERT INTO `kon_katgrupmenu` (`id_katgrupmenu`, `katgrupmenu`, `keterangan`) VALUES
(1, 'M', 'Master'),
(2, 'T', 'Transaksi');

-- --------------------------------------------------------

--
-- Table structure for table `kon_level`
--

DROP TABLE IF EXISTS `kon_level`;
CREATE TABLE IF NOT EXISTS `kon_level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `kon_level`
--

INSERT INTO `kon_level` (`id_level`, `level`, `urutan`, `keterangan`) VALUES
(17, 'SA', 1, 'Super Admin'),
(18, 'A+', 2, 'Admin Plus'),
(19, 'A', 3, 'Admin'),
(20, 'O', 4, 'Operator'),
(21, 'G', 5, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `kon_levelaksi`
--

DROP TABLE IF EXISTS `kon_levelaksi`;
CREATE TABLE IF NOT EXISTS `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_levelaksi`),
  KEY `id_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  KEY `id_aksi` (`id_aksi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=450 ;

--
-- Dumping data for table `kon_levelaksi`
--

INSERT INTO `kon_levelaksi` (`id_levelaksi`, `id_levelkatgrupmenu`, `id_aksi`) VALUES
(221, 53, 1),
(222, 54, 1),
(223, 53, 2),
(224, 54, 2),
(225, 53, 3),
(226, 54, 3),
(227, 53, 4),
(228, 54, 4),
(229, 53, 5),
(230, 54, 5),
(231, 55, 1),
(232, 56, 1),
(233, 55, 2),
(234, 56, 2),
(235, 55, 3),
(236, 56, 3),
(237, 55, 4),
(238, 56, 4),
(239, 55, 5),
(240, 56, 5),
(355, 57, 1),
(356, 58, 1),
(357, 57, 2),
(358, 57, 3),
(359, 57, 4),
(360, 57, 5),
(361, 58, 5),
(362, 59, 1),
(363, 60, 1),
(364, 59, 2),
(365, 59, 3),
(366, 59, 4),
(367, 59, 5),
(368, 60, 5),
(419, 61, 1),
(420, 61, 2),
(421, 61, 3),
(422, 61, 4),
(423, 61, 5),
(424, 63, 1),
(425, 63, 2),
(426, 63, 3),
(427, 63, 4),
(428, 63, 5),
(442, 67, 1),
(443, 67, 2),
(444, 67, 3),
(445, 67, 4),
(446, 67, 5),
(448, 71, 1),
(449, 71, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kon_levelkatgrupmenu`
--

DROP TABLE IF EXISTS `kon_levelkatgrupmenu`;
CREATE TABLE IF NOT EXISTS `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_levelkatgrupmenu`),
  KEY `id_level` (`id_level`),
  KEY `id_katgrupmenu` (`id_katgrupmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `kon_levelkatgrupmenu`
--

INSERT INTO `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`, `id_level`, `id_katgrupmenu`, `isDefault`) VALUES
(53, 17, 1, 1),
(54, 17, 1, 0),
(55, 17, 2, 1),
(56, 17, 2, 0),
(57, 18, 1, 1),
(58, 18, 1, 0),
(59, 18, 2, 1),
(60, 18, 2, 0),
(61, 19, 1, 1),
(62, 19, 1, 0),
(63, 19, 2, 1),
(64, 19, 2, 0),
(65, 20, 1, 1),
(66, 20, 1, 0),
(67, 20, 2, 1),
(68, 20, 2, 0),
(69, 21, 1, 1),
(70, 21, 1, 0),
(71, 21, 2, 1),
(72, 21, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kon_login`
--

DROP TABLE IF EXISTS `kon_login`;
CREATE TABLE IF NOT EXISTS `kon_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  KEY `id_level` (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `kon_login`
--

INSERT INTO `kon_login` (`id_login`, `nama`, `username`, `password`, `id_level`, `pegawai`, `aktif`, `bahasa`, `tlogin`) VALUES
(17, 'Mr. Admin', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', 17, 0, '1', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kon_logindepartemen`
--

DROP TABLE IF EXISTS `kon_logindepartemen`;
CREATE TABLE IF NOT EXISTS `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  PRIMARY KEY (`id_logindepartemen`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_departemen` (`id_departemen`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `kon_logindepartemen`
--

INSERT INTO `kon_logindepartemen` (`id_logindepartemen`, `id_login`, `id_departemen`) VALUES
(10, 17, 1),
(11, 17, 2),
(12, 17, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kon_loginhistory`
--

DROP TABLE IF EXISTS `kon_loginhistory`;
CREATE TABLE IF NOT EXISTS `kon_loginhistory` (
  `id_loginhistory` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_loginhistory`),
  KEY `id_login` (`id_login`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `kon_loginhistory`
--

INSERT INTO `kon_loginhistory` (`id_loginhistory`, `id_login`, `date`) VALUES
(23, 17, '2015-11-02 04:34:36'),
(24, 17, '2015-11-02 04:34:36'),
(25, 17, '2015-11-02 04:40:03'),
(26, 17, '2015-11-02 04:40:03'),
(27, 17, '2015-11-02 05:16:52'),
(28, 17, '2015-11-02 05:16:52'),
(29, 17, '2015-11-02 17:29:56'),
(30, 17, '2015-11-02 17:29:56'),
(31, 17, '2015-11-02 19:58:49'),
(32, 17, '2015-11-02 19:58:49'),
(33, 17, '2015-11-03 17:20:18'),
(34, 17, '2015-11-03 17:20:18'),
(35, 17, '2015-11-03 21:30:44'),
(36, 17, '2015-11-03 21:30:44'),
(37, 17, '2015-11-04 11:15:00'),
(38, 17, '2015-11-04 11:15:00'),
(39, 17, '2015-11-08 12:33:31'),
(40, 17, '2015-11-08 12:33:31'),
(41, 17, '2015-11-09 09:28:29'),
(42, 17, '2015-11-09 09:28:29'),
(43, 17, '2015-11-09 12:40:28'),
(44, 17, '2015-11-09 12:40:28'),
(45, 17, '2015-11-09 14:28:51'),
(46, 17, '2015-11-09 14:28:51'),
(47, 17, '2015-11-10 03:38:29'),
(48, 17, '2015-11-10 03:38:29'),
(49, 17, '2015-11-10 19:00:27'),
(50, 17, '2015-11-10 19:00:27'),
(51, 17, '2015-11-11 16:26:56'),
(52, 17, '2015-11-11 16:26:56'),
(53, 17, '2015-11-12 12:27:39'),
(54, 17, '2015-11-12 12:27:39'),
(55, 17, '2015-11-12 21:56:31'),
(56, 17, '2015-11-12 21:56:31'),
(57, 17, '2015-11-13 11:34:49'),
(58, 17, '2015-11-13 11:34:49'),
(59, 17, '2015-11-13 15:50:28'),
(60, 17, '2015-11-13 15:50:28'),
(61, 17, '2015-11-13 15:50:51'),
(62, 17, '2015-11-13 15:50:52'),
(63, 17, '2015-11-14 00:08:16'),
(64, 17, '2015-11-14 00:08:16'),
(65, 17, '2015-11-14 17:46:51'),
(66, 17, '2015-11-14 17:46:51'),
(67, 17, '2015-11-15 09:06:18'),
(68, 17, '2015-11-15 09:06:18'),
(69, 17, '2015-11-15 09:06:39'),
(70, 17, '2015-11-15 09:06:39'),
(71, 17, '2015-11-15 22:11:56'),
(72, 17, '2015-11-15 22:11:56'),
(73, 17, '2015-11-16 10:02:28'),
(74, 17, '2015-11-16 10:02:28'),
(75, 17, '2015-11-16 14:36:09'),
(76, 17, '2015-11-16 14:36:09'),
(77, 17, '2015-11-17 13:32:59'),
(78, 17, '2015-11-17 13:32:59'),
(79, 17, '2015-11-17 22:48:21'),
(80, 17, '2015-11-17 22:48:21'),
(81, 17, '2015-11-18 02:14:42'),
(82, 17, '2015-11-18 02:14:42'),
(83, 17, '2015-11-18 16:35:28'),
(84, 17, '2015-11-18 16:35:28'),
(85, 17, '2015-11-20 04:52:38'),
(86, 17, '2015-11-20 04:52:38'),
(87, 17, '2015-11-20 21:31:50'),
(88, 17, '2015-11-20 21:31:50'),
(89, 17, '2015-11-21 16:35:53'),
(90, 17, '2015-11-21 20:06:21'),
(91, 17, '2015-11-21 20:06:21'),
(92, 17, '2015-11-21 22:51:06'),
(93, 17, '2015-11-21 22:51:06'),
(94, 17, '2015-11-22 01:51:03'),
(95, 17, '2015-11-22 09:36:46'),
(96, 17, '2015-11-22 09:36:46'),
(97, 17, '2015-11-22 11:37:07'),
(98, 17, '2015-11-22 11:37:07'),
(99, 17, '2015-11-22 13:15:46'),
(100, 17, '2015-11-22 13:15:46'),
(101, 17, '2015-11-22 14:15:26'),
(102, 17, '2015-11-22 14:15:26'),
(103, 17, '2015-11-22 14:27:21'),
(104, 17, '2015-11-22 14:27:21'),
(105, 17, '2015-11-22 15:57:51'),
(106, 17, '2015-11-22 15:57:51'),
(107, 17, '2015-11-22 11:44:47'),
(108, 17, '2015-11-22 11:44:47'),
(109, 17, '2015-11-23 00:32:06'),
(110, 17, '2015-11-23 00:32:06'),
(111, 17, '2015-11-23 01:40:10'),
(112, 17, '2015-11-23 01:40:10'),
(113, 17, '2015-11-23 15:28:10'),
(114, 17, '2015-11-23 15:28:10'),
(115, 17, '2015-11-23 15:45:13'),
(116, 17, '2015-11-23 15:45:13'),
(117, 17, '2015-11-23 23:54:25'),
(118, 17, '2015-11-23 23:54:25'),
(119, 17, '2015-11-24 01:36:00'),
(120, 17, '2015-11-24 01:36:00'),
(121, 17, '2015-11-24 15:16:22'),
(122, 17, '2015-11-24 15:16:22'),
(123, 17, '2015-11-26 00:29:24'),
(124, 17, '2015-11-26 00:29:24'),
(125, 17, '2015-11-26 22:06:43'),
(126, 17, '2015-11-26 22:06:43'),
(127, 17, '2015-11-27 14:43:48'),
(128, 17, '2015-11-27 14:43:48'),
(129, 17, '2015-12-10 16:23:57'),
(130, 17, '2015-12-10 16:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `kon_menu`
--

DROP TABLE IF EXISTS `kon_menu`;
CREATE TABLE IF NOT EXISTS `kon_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `kon_menu`
--

INSERT INTO `kon_menu` (`id_menu`, `id_grupmenu`, `menu`, `link`, `size`, `id_warna`, `id_icon`, `keterangan`) VALUES
(1, 4, 'Siswa', 'siswa', 'double', 7, 9, ''),
(2, 1, 'Presensi Siswa', 'presensi-siswa', 'double', 44, 10, ''),
(3, 1, 'Rapor Siswa', 'rapor-siswa', 'double', 3, 11, ''),
(4, 1, 'Pendataan Alumni', 'pendataan-alumni', 'double', 4, 12, ''),
(8, 5, 'Transaksi', 'transaksi', 'double', 8, 16, ''),
(10, 40, 'Penerimaan Siswa', 'penerimaan-siswa', 'double', 10, 18, ''),
(13, 6, 'Saldo Rekening', 'saldo-rekening', '', 13, 13, ''),
(14, 6, 'Kategori Rekening', 'kategori-rekening', '', 14, 14, ''),
(15, 6, 'Detil Rekening', 'detil-rekening', '', 15, 10, ''),
(16, 5, 'Anggaran Tahunan', 'anggaran-tahunan', 'double', 16, 16, ''),
(19, 7, 'Warna', 'warna', '', 4, 17, ''),
(20, 8, 'level', 'level', '', 5, 16, ''),
(21, 8, 'user', 'user', '', 7, 15, ''),
(22, 7, 'Icon', 'icon', '', 4, 13, ''),
(24, 2, 'Detail Kelas', 'detail-kelas', 'double', 11, 15, ''),
(25, 3, 'Departemen', 'departemen', '', 3, 11, ''),
(26, 3, 'Angkatan', 'angkatan', '', 11, 15, ''),
(27, 3, 'Tahun Ajaran', 'tahun-ajaran', '', 16, 17, ''),
(28, 3, 'Tingkat', 'tingkat', '', 12, 18, ''),
(29, 3, 'Sub Tingkat', 'subtingkat', '', 14, 14, ''),
(30, 3, 'Kelas', 'kelas', '', 15, 13, ''),
(31, 3, 'Semester', 'semester', '', 13, 12, ''),
(32, 3, 'Jenis Mutasi', 'jenis-mutasi', '', 11, 10, ''),
(33, 3, 'Guru', 'guru', '', 11, 14, ''),
(34, 3, 'Pelajaran', 'pelajaran', '', 12, 14, ''),
(35, 2, 'Jadwal Pelajaran', 'jadwal-pelajaran', 'double', 15, 15, ''),
(36, 2, 'Presensi Guru', 'presensi-guru', 'double', 18, 12, ''),
(37, 2, 'Kegiatan Akademik', 'kegiatan-akademik', 'double', 14, 14, ''),
(38, 1, 'Mutasi', 'mutasi', 'double', 6, 13, ''),
(39, 3, 'Detail Pelajaran', 'detail-pelajaran', '', 13, 15, ''),
(40, 1, 'Siswa Kelas', 'siswa-kelas', 'double', 13, 15, ''),
(41, 41, 'Biaya', 'biaya', '', 14, 15, ''),
(42, 9, 'Diskon', 'diskon', '', 14, 15, ''),
(43, 41, 'Angsuran', 'angsuran', '', 17, 13, ''),
(44, 9, 'golongan', 'golongan', '', 13, 16, ''),
(45, 7, 'menu', 'menu', '', 14, 16, ''),
(46, 7, 'Grup Modul', 'grup-modul', '', 13, 12, ''),
(47, 7, 'Modul', 'modul', '', 12, 11, ''),
(48, 7, 'Grup Menu', 'grup-menu', '', 16, 13, ''),
(52, 9, 'Gelombang', 'gelombang', '', 16, 10, 'kelompok pendaftaran  (gelombang)'),
(54, 14, 'Perangkat', 'perangkat', '', 16, 10, 'ok'),
(55, 14, 'Lokasi', 'lokasi', '', 16, 10, ''),
(56, 14, 'Jenis Koleksi', 'jenis-koleksi', '', 16, 10, ''),
(57, 14, 'Tingkat Koleksi', 'tingkat-koleksi', '', 13, 10, ''),
(58, 14, 'Klasifikasi', 'klasifikasi', '', 41, 10, ''),
(59, 14, 'Daftar Pengunjung', 'daftar-pengunjung', '', 17, 10, '\r\n'),
(60, 14, 'Daftar Penerbit', 'daftar-penerbit', '', 10, 10, ''),
(61, 14, 'Daftar-Bahasa', 'daftar-bahasa', '', 24, 10, ''),
(62, 14, 'Satuan Mata Uang', 'stuan-mata-uang', '', 8, 10, '\r\n'),
(63, 15, 'Katalog', 'katalog', 'double', 7, 10, ''),
(64, 15, 'Daftar Koleksi', 'daftar-koleksi', 'double', 7, 20, ''),
(65, 15, 'Data Anggota', 'data-anggota', '', 13, 10, ''),
(66, 15, 'Sirkulasi', 'sirkulasi', 'double', 18, 10, ''),
(67, 15, 'Stock Opname', 'stock-opname', 'double', 47, 17, ''),
(68, 15, 'OPAC', 'opac', 'double', 19, 12, ''),
(69, 16, 'Agama', 'agama', '', 16, 10, 'setting data master agama'),
(70, 16, 'Pendidikan', 'pendidikan', 'double', 16, 10, ''),
(71, 16, 'Departemen', 'departemen', '', 13, 10, ''),
(72, 16, 'Jabatan', 'jabatan', 'double', 16, 1, ''),
(73, 16, 'Status Karyawan', 'status-karyawan', 'double', 16, 10, ''),
(74, 16, 'Golongan', 'golongan', 'double', 16, 10, ''),
(75, 17, 'Berkas', 'berkas', 'double', 34, 10, ''),
(76, 17, 'Absensi', 'absensi', 'double', 16, 10, '\r\n'),
(77, 17, 'Cuti', 'cuti', 'double', 7, 10, ''),
(78, 17, 'Pinjaman', 'pinjaman', 'double', 17, 10, ''),
(79, 17, 'Karyawan', 'karyawan', 'double', 27, 12, ''),
(80, 18, 'Penggajian', 'penggajian', 'double', 8, 10, ''),
(81, 18, 'Laporan', 'laporan', '', 10, 12, ''),
(82, 18, 'Setting BPJS', 'setting-bpjs', 'double', 5, 17, ''),
(83, 18, 'Golongan', 'golongan ', 'double', 22, 11, ''),
(84, 18, 'struktural', 'struktural', '', 41, 17, ''),
(85, 18, 'Fungsional', 'Fungsional', 'double', 16, 1, ''),
(86, 18, 'Pengabdian', 'Pengabdian', '', 24, 17, ''),
(87, 18, 'istri anak', 'istri-anak', 'double', 16, 10, ''),
(88, 18, 'uang transport', 'uang-transport', 'double', 16, 10, ''),
(89, 18, 'beban tugas', 'beban-tugas', 'double', 16, 10, ''),
(90, 18, 'wali kelas', 'wali-kelas', 'double', 13, 11, ''),
(91, 19, 'Jenjang', 'jenjang', 'double', 8, 10, ''),
(92, 19, 'Kategori', 'kategori', 'double', 8, 1, ''),
(93, 19, 'produk', 'produk', 'double', 8, 10, ''),
(94, 19, 'produk jasa', 'produk-jasa', 'double', 1, 11, ''),
(95, 19, 'beban biaya', 'beban-biaya', 'double', 8, 10, ''),
(96, 19, 'supplier', 'supplier', 'double', 16, 10, ''),
(97, 19, 'customer', 'customer', 'double', 8, 11, ''),
(98, 20, 'PO Pembelian', 'PO-Pembelian', 'double', 16, 14, ''),
(99, 20, 'Pembelian', 'Pembelian', 'double', 16, 1, ''),
(100, 20, 'laporan pembelian', 'laporan-pembelian', 'double', 1, 12, ''),
(101, 20, 'retur pembelian', 'retur-pembelian', 'double', 16, 1, ''),
(102, 20, 'laporan retur pembelian', 'laporan-retur-pembelian', 'double', 13, 10, ''),
(103, 21, 'PO Penjualan', 'PO-Penjualan', 'double', 27, 17, ''),
(104, 21, 'Penjualan', 'Penjualan', 'double', 20, 1, ''),
(105, 21, 'Retur Penjualaan', 'Retur-Penjualaan', 'double', 16, 10, ''),
(106, 21, 'Laporan Penjualan', 'Laporan-Penjualan', 'double', 16, 10, ''),
(107, 21, 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', 18, 1, ''),
(108, 24, 'Penjualaan Jasa', 'Penjualaan-Jasa', 'double', 16, 1, '\r\n'),
(109, 24, 'Laporan Penjualaan Jasa', 'Laporan-Penjualaan-Jasa', 'double', 16, 10, ''),
(110, 25, 'Hutang', 'hutang', 'double', 16, 10, ''),
(111, 25, 'pembayaran', 'pembayaran', 'double', 16, 10, ''),
(112, 25, 'laporan hutang', 'laporan-hutang', 'double', 16, 10, ''),
(113, 25, 'laporan pembayaran', 'laporan-pembayaran', 'double', 16, 10, '\r\n'),
(114, 26, 'Transaksi Biaya', 'Transaksi-Biaya', 'double', 16, 10, ''),
(115, 26, 'Laporan Biaya', 'Laporan-Biaya', 'double', 16, 10, ''),
(116, 27, 'Laporan Stok', 'Laporan-Stok', 'double', 16, 10, ''),
(117, 27, 'Laporan Laba/Rugi', 'Laporan-Laba/Rugi', 'double', 16, 1, ''),
(119, 27, 'Laporan Pembelian', 'Laporan-Pembelian', 'double', 7, 10, ''),
(120, 27, 'Laporan Retur Pembelian', 'Laporan-Retur-Pembelian', 'double', 16, 10, ''),
(121, 27, 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', 16, 1, ''),
(122, 27, 'Laporan Penjualan', 'Laporan-Penjualan', 'double', 16, 17, ''),
(123, 28, 'User', 'user', 'double', 16, 10, ''),
(124, 28, 'password', 'password', 'double', 16, 10, ''),
(125, 29, 'supplier', 'supplier', 'double', 16, 10, ''),
(126, 30, 'Purchase Requisition', 'Purchase-Requisition', 'double', 16, 1, ''),
(127, 30, 'Laporan Permintaan', 'Laporan-Perrmintaan', 'double', 18, 10, ''),
(128, 30, 'Batal Purchase Requisition', 'Batal-Purchase-Requisition', 'double', 16, 10, ''),
(129, 31, 'Penawaran', 'Penawaran', 'double', 16, 10, ''),
(130, 31, 'Laporan Penawaran', 'Laporan-Penawaran', 'double', 16, 10, ''),
(131, 31, 'Formulir Fisik Penawaran ', 'Formulir-Fisik-Penawaran ', 'double', 16, 10, ''),
(132, 32, 'Purchase Order', 'Purchase-Order', 'double', 16, 10, ''),
(133, 32, 'Laporan Pemesanan', 'Laporan-Pemesanan', 'double', 16, 10, ''),
(134, 32, 'Batal Purchase Order', 'Batal \\-Purchase-Order', 'double', 16, 10, ''),
(135, 33, 'Pembelian', 'Pembelian', 'double', 1, 10, ''),
(136, 33, 'Laporan Pembelian', 'Laporan-Pembelian', 'double', 16, 10, ''),
(137, 33, 'Retur Pembelian', 'Retur-Pembelian', 'double', 16, 10, ''),
(138, 33, 'Laporan Retur PEmbelian', 'Laporan-Retur-PEmbelian', 'double', 16, 1, ''),
(139, 34, 'User', 'User', 'double', 16, 1, ''),
(140, 34, 'password', 'password', 'double', 16, 1, ''),
(141, 37, 'Lokasi', 'lokasi', 'double', 1, 10, ''),
(142, 37, 'Tempat', 'tempat', 'double', 13, 10, ''),
(143, 37, 'Tempat', 'tempat', 'double', 20, 12, ''),
(144, 35, 'Inventaris', 'inventaris', 'double', 8, 15, ''),
(145, 35, 'Peminjaman', 'peminjaman', 'double', 18, 17, ''),
(146, 35, 'aktivitas', 'aktivitas', 'double', 7, 12, ''),
(147, 38, 'user', 'user', 'double', 16, 10, ''),
(148, 39, 'tahap2', 'tahap2', 'double', 16, 10, '\r\n'),
(149, 38, 'password', 'password', 'double', 16, 10, ''),
(150, 39, 'tahap1', 'tahap1', 'double', 16, 10, ''),
(151, 39, 'tahap3', 'tahap3', 'double', 16, 10, ''),
(152, 4, 'Detail Diskon', 'detail-diskon', 'double', 16, 10, ''),
(153, 4, 'Detail Gelombang', 'detail-gelombang', 'double', 8, 11, ''),
(154, 9, 'dokumen', 'dokumen', '', 8, 10, ''),
(155, 40, 'Detail Biaya', 'detail-biaya', 'double', 16, 10, ''),
(156, 4, 'reminder ultah', 'reminder-ultah', '', 18, 14, ''),
(157, 4, 'Rekapitulasi Siswa', 'rekapitulasi-siswa', '', 10, 18, ''),
(158, 6, 'Kategori Anggaran', 'kategori-anggaran', '', 18, 11, ''),
(159, 6, 'Detil Anggaran', 'detil-anggaran', '', 16, 10, ''),
(160, 40, 'Rekapitulasi Penerimaan Siswa', 'rekapitulasi-penerimaan-siswa', 'double', 8, 10, ''),
(161, 40, 'Pemutihan Penerimaan Siswa', 'pemutihan-penerimaan-siswa', 'double', 16, 10, ''),
(162, 41, 'Via Bayar', 'via-bayar', '', 16, 10, ''),
(163, 40, 'Rekening Biaya', 'rekening-biaya', 'double', 31, 11, '');

-- --------------------------------------------------------

--
-- Table structure for table `kon_modul`
--

DROP TABLE IF EXISTS `kon_modul`;
CREATE TABLE IF NOT EXISTS `kon_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `kon_modul`
--

INSERT INTO `kon_modul` (`id_modul`, `id_grupmodul`, `link`, `modul`, `id_warna`, `id_icon`, `size`, `keterangan`) VALUES
(1, 1, 'akademik', 'akademik', 13, 9, 'double', ''),
(2, 1, 'psb', 'penerimaan siswa baru', 14, 10, 'double', ''),
(3, 1, 'perpus', 'perpustakaan', 3, 11, 'double double-vertical', ''),
(4, 1, 'sarpras', 'sarana dan prasarana', 4, 12, 'double double-vertical', ''),
(5, 2, 'hrd', 'kepegawaian', 5, 13, 'double double-vertical', ''),
(6, 2, 'keuangan', 'keuangan', 6, 14, 'double double-vertical', ''),
(7, 2, 'student', 'student services', 7, 15, 'double', ''),
(9, 3, 'konfigurasi', 'konfigurasi', 13, 14, 'double', ''),
(13, 2, 'purchaseorder', 'purchase order', 32, 20, 'double', ''),
(14, 3, 'marketingpsb', 'marketingpsb', 16, 10, 'double', '');

-- --------------------------------------------------------

--
-- Table structure for table `kon_privillege`
--

DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE IF NOT EXISTS `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_privillege`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_menu` (`id_menu`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=597 ;

--
-- Dumping data for table `kon_privillege`
--

INSERT INTO `kon_privillege` (`id_privillege`, `id_login`, `id_menu`, `isDefault`) VALUES
(448, 17, 1, 1),
(449, 17, 2, 1),
(450, 17, 3, 1),
(451, 17, 4, 1),
(452, 17, 8, 1),
(453, 17, 10, 1),
(454, 17, 13, 1),
(455, 17, 14, 1),
(456, 17, 15, 1),
(457, 17, 16, 1),
(458, 17, 19, 1),
(459, 17, 20, 1),
(460, 17, 21, 1),
(461, 17, 22, 1),
(462, 17, 24, 1),
(463, 17, 25, 1),
(464, 17, 26, 1),
(465, 17, 27, 1),
(466, 17, 28, 1),
(467, 17, 29, 1),
(468, 17, 30, 1),
(469, 17, 31, 1),
(470, 17, 32, 1),
(471, 17, 33, 1),
(472, 17, 34, 1),
(473, 17, 35, 1),
(474, 17, 36, 1),
(475, 17, 37, 1),
(476, 17, 38, 1),
(477, 17, 39, 1),
(478, 17, 40, 1),
(479, 17, 41, 1),
(480, 17, 42, 1),
(481, 17, 43, 1),
(482, 17, 44, 1),
(483, 17, 45, 1),
(484, 17, 46, 1),
(485, 17, 47, 1),
(486, 17, 48, 1),
(487, 17, 52, 1),
(488, 17, 54, 1),
(489, 17, 55, 1),
(490, 17, 56, 1),
(491, 17, 57, 1),
(492, 17, 58, 1),
(493, 17, 59, 1),
(494, 17, 60, 1),
(495, 17, 61, 1),
(496, 17, 62, 1),
(497, 17, 63, 1),
(498, 17, 64, 1),
(499, 17, 65, 1),
(500, 17, 66, 1),
(501, 17, 67, 1),
(502, 17, 68, 1),
(503, 17, 69, 1),
(504, 17, 70, 1),
(505, 17, 71, 1),
(506, 17, 72, 1),
(507, 17, 73, 1),
(508, 17, 74, 1),
(509, 17, 75, 1),
(510, 17, 76, 1),
(511, 17, 77, 1),
(512, 17, 78, 1),
(513, 17, 79, 1),
(514, 17, 80, 1),
(515, 17, 81, 1),
(516, 17, 82, 1),
(517, 17, 83, 1),
(518, 17, 84, 1),
(519, 17, 85, 1),
(520, 17, 86, 1),
(521, 17, 87, 1),
(522, 17, 88, 1),
(523, 17, 89, 1),
(524, 17, 90, 1),
(525, 17, 91, 1),
(526, 17, 92, 1),
(527, 17, 93, 1),
(528, 17, 94, 1),
(529, 17, 95, 1),
(530, 17, 96, 1),
(531, 17, 97, 1),
(532, 17, 98, 1),
(533, 17, 99, 1),
(534, 17, 100, 1),
(535, 17, 101, 1),
(536, 17, 102, 1),
(537, 17, 103, 1),
(538, 17, 104, 1),
(539, 17, 105, 1),
(540, 17, 106, 1),
(541, 17, 107, 1),
(542, 17, 108, 1),
(543, 17, 109, 1),
(544, 17, 110, 1),
(545, 17, 111, 1),
(546, 17, 112, 1),
(547, 17, 113, 1),
(548, 17, 114, 1),
(549, 17, 115, 1),
(550, 17, 116, 1),
(551, 17, 117, 1),
(552, 17, 119, 1),
(553, 17, 120, 1),
(554, 17, 121, 1),
(555, 17, 122, 1),
(556, 17, 123, 1),
(557, 17, 124, 1),
(558, 17, 125, 1),
(559, 17, 126, 1),
(560, 17, 127, 1),
(561, 17, 128, 1),
(562, 17, 129, 1),
(563, 17, 130, 1),
(564, 17, 131, 1),
(565, 17, 132, 1),
(566, 17, 133, 1),
(567, 17, 134, 1),
(568, 17, 135, 1),
(569, 17, 136, 1),
(570, 17, 137, 1),
(571, 17, 138, 1),
(572, 17, 139, 1),
(573, 17, 140, 1),
(574, 17, 141, 1),
(575, 17, 142, 1),
(576, 17, 143, 1),
(577, 17, 144, 1),
(578, 17, 145, 1),
(579, 17, 146, 1),
(580, 17, 147, 1),
(581, 17, 148, 1),
(582, 17, 149, 1),
(583, 17, 150, 1),
(584, 17, 151, 1),
(585, 17, 152, 1),
(586, 17, 153, 1),
(587, 17, 154, 1),
(588, 17, 155, 1),
(589, 17, 156, 1),
(590, 17, 157, 1),
(591, 17, 158, 1),
(592, 17, 159, 1),
(593, 17, 160, 1),
(594, 17, 161, 1),
(595, 17, 162, 1),
(596, 17, 163, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kon_warna`
--

DROP TABLE IF EXISTS `kon_warna`;
CREATE TABLE IF NOT EXISTS `kon_warna` (
  `id_warna` int(11) NOT NULL AUTO_INCREMENT,
  `warna` varchar(25) NOT NULL,
  PRIMARY KEY (`id_warna`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `kon_warna`
--

INSERT INTO `kon_warna` (`id_warna`, `warna`) VALUES
(1, 'black'),
(2, 'white'),
(3, 'lime'),
(4, 'green'),
(5, 'emerald'),
(6, 'teal'),
(7, 'cyan'),
(8, 'cobalt'),
(9, 'indigo'),
(10, 'violet'),
(11, 'pink'),
(12, 'magenta'),
(13, 'crimson'),
(14, 'red'),
(15, 'orange'),
(16, 'amber'),
(17, 'yellow'),
(18, 'brown'),
(19, 'olive'),
(20, 'steel'),
(21, 'mauve'),
(22, 'taupe'),
(23, 'gray'),
(24, 'dark'),
(25, 'darker'),
(26, 'transparent'),
(27, 'darkBrown'),
(28, 'darkCrimson'),
(29, 'darkMagenta'),
(30, 'darkIndigo'),
(31, 'darkCyan'),
(32, 'darkCobalt'),
(33, 'darkTeal'),
(34, 'darkEmerald'),
(35, 'darkGreen'),
(36, 'darkOrange'),
(37, 'darkRed'),
(38, 'darkPink'),
(39, 'darkViolet'),
(40, 'darkBlue'),
(41, 'lightBlue'),
(42, 'lightTeal'),
(43, 'lightOlive'),
(44, 'lightOrange'),
(45, 'lightPink'),
(46, 'lightRed'),
(47, 'lightGreen');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kon_levelaksi`
--
ALTER TABLE `kon_levelaksi`
  ADD CONSTRAINT `kon_levelaksi_ibfk_1` FOREIGN KEY (`id_levelkatgrupmenu`) REFERENCES `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kon_levelaksi_ibfk_2` FOREIGN KEY (`id_aksi`) REFERENCES `kon_aksi` (`id_aksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_levelkatgrupmenu`
--
ALTER TABLE `kon_levelkatgrupmenu`
  ADD CONSTRAINT `kon_levelkatgrupmenu_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kon_levelkatgrupmenu_ibfk_2` FOREIGN KEY (`id_katgrupmenu`) REFERENCES `kon_katgrupmenu` (`id_katgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_login`
--
ALTER TABLE `kon_login`
  ADD CONSTRAINT `kon_login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`);

--
-- Constraints for table `kon_logindepartemen`
--
ALTER TABLE `kon_logindepartemen`
  ADD CONSTRAINT `id_login_FK2` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_loginhistory`
--
ALTER TABLE `kon_loginhistory`
  ADD CONSTRAINT `kon_loginhistory_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_privillege`
--
ALTER TABLE `kon_privillege`
  ADD CONSTRAINT `id_login_FK` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_menu_FK` FOREIGN KEY (`id_menu`) REFERENCES `kon_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
