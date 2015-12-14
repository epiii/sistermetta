-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2015 at 03:19 AM
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
-- Table structure for table `rep_file`
--

DROP TABLE IF EXISTS `rep_file`;
CREATE TABLE IF NOT EXISTS `rep_file` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(128) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `ufile` varchar(20) NOT NULL,
  `fname` varchar(128) NOT NULL,
  `tipe` varchar(5) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rep_grup`
--

DROP TABLE IF EXISTS `rep_grup`;
CREATE TABLE IF NOT EXISTS `rep_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `passwd` varchar(30) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_aktivitas`
--

DROP TABLE IF EXISTS `sar_aktivitas`;
CREATE TABLE IF NOT EXISTS `sar_aktivitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `aktivitas` text,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_aktivitas_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_barang`
--

DROP TABLE IF EXISTS `sar_barang`;
CREATE TABLE IF NOT EXISTS `sar_barang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi` int(10) unsigned NOT NULL,
  `grup` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  `tempat` int(255) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `barkode` varchar(50) NOT NULL,
  `urut` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:ada 0:dipinjam',
  `sumber` tinyint(4) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kondisi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `isImport` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `sar_barang`
--

INSERT INTO `sar_barang` (`replid`, `lokasi`, `grup`, `katalog`, `tempat`, `kode`, `barkode`, `urut`, `status`, `sumber`, `harga`, `kondisi`, `keterangan`, `isImport`) VALUES
(1, 0, 0, 1, 1, '', '', 0, 1, 0, '0', 1, '', 0),
(2, 0, 0, 1, 1, '', '', 1, 1, 0, '0', 1, '', 0),
(3, 0, 0, 2, 1, '', '', 2, 1, 0, '0', 1, '', 0),
(4, 0, 0, 2, 1, '', '', 3, 1, 0, '0', 1, '', 0),
(5, 0, 0, 3, 1, '', '', 4, 1, 0, '0', 1, '', 0),
(6, 0, 0, 3, 1, '', '', 5, 1, 0, '0', 1, '', 0),
(7, 0, 0, 4, 1, '', '', 6, 1, 0, '0', 1, '', 0),
(8, 0, 0, 4, 1, '', '', 7, 1, 0, '0', 1, '', 0),
(9, 0, 0, 5, 1, '', '', 8, 1, 0, '0', 1, '', 0),
(10, 0, 0, 5, 1, '', '', 9, 1, 0, '0', 1, '', 0),
(11, 0, 0, 4, 2, '', '', 10, 1, 0, '0', 1, '', 0),
(12, 0, 0, 4, 2, '', '', 11, 1, 0, '0', 1, '', 0),
(13, 0, 0, 4, 3, '', '', 12, 1, 0, '0', 1, '', 0),
(14, 0, 0, 4, 3, '', '', 13, 1, 0, '0', 1, '', 0),
(15, 0, 0, 5, 2, '', '', 14, 1, 1, '0', 2, '', 0),
(16, 0, 0, 5, 3, '', '', 15, 1, 1, '0', 2, '', 0),
(17, 0, 0, 1, 2, '', '', 16, 1, 0, '0', 2, '', 0),
(18, 0, 0, 1, 2, '', '', 17, 1, 0, '0', 2, '', 0),
(19, 0, 0, 1, 3, '', '', 18, 1, 0, '0', 2, '', 0),
(20, 0, 0, 1, 3, '', '', 19, 1, 0, '0', 2, '', 0),
(21, 0, 0, 3, 2, '', '', 20, 1, 0, '0', 2, '', 0),
(22, 0, 0, 3, 2, '', '', 21, 1, 0, '0', 2, '', 0),
(23, 0, 0, 3, 3, '', '', 22, 1, 0, '0', 2, '', 0),
(24, 0, 0, 3, 3, '', '', 23, 1, 0, '0', 2, '', 0),
(25, 0, 0, 2, 2, '', '', 24, 1, 0, '0', 2, '', 0),
(26, 0, 0, 2, 2, '', '', 25, 1, 0, '0', 2, '', 0),
(27, 0, 0, 2, 3, '', '', 26, 1, 0, '0', 2, '', 0),
(28, 0, 0, 2, 3, '', '', 27, 1, 0, '0', 2, '', 0),
(29, 0, 0, 6, 2, '', '', 28, 1, 0, '0', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sar_detailaktivitas`
--

DROP TABLE IF EXISTS `sar_detailaktivitas`;
CREATE TABLE IF NOT EXISTS `sar_detailaktivitas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `aktivitas` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL DEFAULT '1',
  `biaya` double(14,0) NOT NULL DEFAULT '0',
  `biaya2` double(14,0) NOT NULL DEFAULT '0',
  `tglbayar` date NOT NULL,
  `tgllunas` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_dftp`
--

DROP TABLE IF EXISTS `sar_dftp`;
CREATE TABLE IF NOT EXISTS `sar_dftp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_distributor`
--

DROP TABLE IF EXISTS `sar_distributor`;
CREATE TABLE IF NOT EXISTS `sar_distributor` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(250) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_dpeminjaman`
--

DROP TABLE IF EXISTS `sar_dpeminjaman`;
CREATE TABLE IF NOT EXISTS `sar_dpeminjaman` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `peminjaman` int(11) NOT NULL,
  `barang` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_grup`
--

DROP TABLE IF EXISTS `sar_grup`;
CREATE TABLE IF NOT EXISTS `sar_grup` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sar_grup`
--

INSERT INTO `sar_grup` (`replid`, `kode`, `nama`, `lokasi`, `keterangan`, `ts`) VALUES
(1, '01', 'Furniture', 1, '', '2015-06-02 14:45:27'),
(2, '02', 'Elektronik', 1, '', '2015-06-02 14:45:45'),
(3, '03', 'IT', 1, '', '2015-06-02 14:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `sar_jenis`
--

DROP TABLE IF EXISTS `sar_jenis`;
CREATE TABLE IF NOT EXISTS `sar_jenis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sar_jenis`
--

INSERT INTO `sar_jenis` (`replid`, `kode`, `nama`, `keterangan`) VALUES
(1, '030', 'Habis pakai', ''),
(2, '020', 'Tidak habis pakai', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_katalog`
--

DROP TABLE IF EXISTS `sar_katalog`;
CREATE TABLE IF NOT EXISTS `sar_katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grup` int(10) unsigned NOT NULL,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT '0',
  `harga` decimal(10,0) NOT NULL DEFAULT '0',
  `susut` decimal(3,0) NOT NULL DEFAULT '0',
  `photo2` longtext,
  `photo` mediumblob NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sar_katalog`
--

INSERT INTO `sar_katalog` (`replid`, `grup`, `kode`, `nama`, `jenis`, `harga`, `susut`, `photo2`, `photo`, `keterangan`) VALUES
(1, 3, 'IT', 'Monitor', 2, '0', '0', NULL, '', ''),
(2, 3, 'IT', 'CPU', 2, '0', '0', NULL, '', ''),
(3, 3, 'IT', 'KEYBOARD DAN MOUSE', 2, '0', '0', NULL, '', ''),
(4, 2, 'ELT', 'AC', 2, '0', '0', NULL, '', ''),
(5, 2, 'ELT', 'Speaker', 2, '0', '0', NULL, '', ''),
(6, 1, 'MJ', 'Meja', 2, '0', '0', NULL, '', ''),
(7, 1, 'KR', 'Kursi', 2, '0', '0', NULL, '', ''),
(8, 1, 'LM', 'Lemari', 2, '0', '0', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_kondisi`
--

DROP TABLE IF EXISTS `sar_kondisi`;
CREATE TABLE IF NOT EXISTS `sar_kondisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sar_kondisi`
--

INSERT INTO `sar_kondisi` (`replid`, `nama`, `keterangan`) VALUES
(1, 'Sangat baik', 'Baru'),
(2, 'Baik', 'Layak'),
(3, 'Buruk', 'Perlu perbaikan'),
(4, 'Sangat buruk', 'Tidak dapat digunakan');

-- --------------------------------------------------------

--
-- Table structure for table `sar_lokasi`
--

DROP TABLE IF EXISTS `sar_lokasi`;
CREATE TABLE IF NOT EXISTS `sar_lokasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penerbit_ts` (`ts`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sar_lokasi`
--

INSERT INTO `sar_lokasi` (`replid`, `kode`, `nama`, `alamat`, `telpon`, `kontak`, `keterangan`, `ts`) VALUES
(1, '001', 'Meta', 'Jl. Puncak Permai Utara, Surabaya 60187', NULL, '031 7342920', '', '2015-06-02 14:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `sar_peminjaman`
--

DROP TABLE IF EXISTS `sar_peminjaman`;
CREATE TABLE IF NOT EXISTS `sar_peminjaman` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi` int(10) unsigned NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `barang` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `lokasi_pinjam` int(10) unsigned NOT NULL,
  `lokasi_lain` varchar(250) NOT NULL,
  `tempat` varchar(200) NOT NULL,
  `kondisi` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_peminjaman2`
--

DROP TABLE IF EXISTS `sar_peminjaman2`;
CREATE TABLE IF NOT EXISTS `sar_peminjaman2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` int(11) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_pengembalian`
--

DROP TABLE IF EXISTS `sar_pengembalian`;
CREATE TABLE IF NOT EXISTS `sar_pengembalian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peminjaman` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_produsen`
--

DROP TABLE IF EXISTS `sar_produsen`;
CREATE TABLE IF NOT EXISTS `sar_produsen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(250) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sar_tempat`
--

DROP TABLE IF EXISTS `sar_tempat`;
CREATE TABLE IF NOT EXISTS `sar_tempat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL DEFAULT '',
  `lokasi` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sar_tempat`
--

INSERT INTO `sar_tempat` (`replid`, `kode`, `lokasi`, `nama`, `keterangan`) VALUES
(2, 'Lt.1 R.Guru', 1, 'R.Guru lt.1', ''),
(3, 'Lt.2 R.Guru', 1, 'R.Guru lt.2', '');

-- --------------------------------------------------------

--
-- Table structure for table `sar_tmp`
--

DROP TABLE IF EXISTS `sar_tmp`;
CREATE TABLE IF NOT EXISTS `sar_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
CREATE TABLE IF NOT EXISTS `sensor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `situs`
--

DROP TABLE IF EXISTS `situs`;
CREATE TABLE IF NOT EXISTS `situs` (
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
-- Dumping data for table `situs`
--

INSERT INTO `situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`) VALUES
(1, 'rekysda@gmail.com', 'Sisfo HRD dan Penggajian', 'http://localhost/sistermeta/hrd', 'Sisfo HRD dan Penggajian', 'WebDesign dengan sistem Responsive', 'sisfohrd,surabaya,indonesia', 5, 50, 5, 4, 3, 'sisfohrd', 'SMK BHAKTI SAMUDERA', 'Surabaya', 1, 1, 12, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kalender`
--

DROP TABLE IF EXISTS `tbl_kalender`;
CREATE TABLE IF NOT EXISTS `tbl_kalender` (
  `judul` varchar(255) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `waktu_mulai` date NOT NULL DEFAULT '0000-00-00',
  `waktu_akhir` date NOT NULL DEFAULT '0000-00-00',
  `background` varchar(10) NOT NULL DEFAULT '#d1d1d1',
  `color` varchar(10) NOT NULL DEFAULT '',
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_photo`
--

DROP TABLE IF EXISTS `tmp_photo`;
CREATE TABLE IF NOT EXISTS `tmp_photo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `useraura`
--

DROP TABLE IF EXISTS `useraura`;
CREATE TABLE IF NOT EXISTS `useraura` (
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
-- Dumping data for table `useraura`
--

INSERT INTO `useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 0, '2015-12-01 12:10:46', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `usercounter`
--

DROP TABLE IF EXISTS `usercounter`;
CREATE TABLE IF NOT EXISTS `usercounter` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `ip` text NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useronline`
--

DROP TABLE IF EXISTS `useronline`;
CREATE TABLE IF NOT EXISTS `useronline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useronlineday`
--

DROP TABLE IF EXISTS `useronlineday`;
CREATE TABLE IF NOT EXISTS `useronlineday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `useronlinemonth`
--

DROP TABLE IF EXISTS `useronlinemonth`;
CREATE TABLE IF NOT EXISTS `useronlinemonth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_kelas`
--
DROP VIEW IF EXISTS `vw_kelas`;
CREATE TABLE IF NOT EXISTS `vw_kelas` (
`idtingkat` int(11)
,`tingkat` varchar(100)
,`urutan` tinyint(2) unsigned
,`idsubtingkat` int(10)
,`subtingkat` varchar(100)
,`idkelas` int(11)
,`kelas` varchar(100)
,`iddepartemen` int(11)
,`iddetailkelas` int(11)
,`idtahunajaran` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_psb_siswa_kriteria`
--
DROP VIEW IF EXISTS `vw_psb_siswa_kriteria`;
CREATE TABLE IF NOT EXISTS `vw_psb_siswa_kriteria` (
`idsiswa` int(11)
,`nis` varchar(100)
,`nisn` varchar(100)
,`nopendaftaran` int(20)
,`namasiswa` varchar(100)
,`status` enum('0','1','2')
,`idtingkat` int(11)
,`tingkat` varchar(100)
,`idsubtingkat` int(10)
,`subtingkat` varchar(100)
,`iddetailgelombang` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_siswa_kelas`
--
DROP VIEW IF EXISTS `vw_siswa_kelas`;
CREATE TABLE IF NOT EXISTS `vw_siswa_kelas` (
`idsiswa` int(11)
,`idsiswakelas` int(11)
,`iddetailkelas` int(11)
,`idkelas` int(11)
,`idsubtingkat` int(10)
,`idtingkat` int(11)
,`idtahunajaran` int(11)
,`iddepartemen` int(11)
,`namasiswa` varchar(100)
,`nis` varchar(100)
,`nisn` varchar(100)
,`departemen` varchar(50)
,`tahunajaran` varchar(50)
,`subtingkat` varchar(100)
,`tingkat` varchar(100)
,`kelas` varchar(100)
);
-- --------------------------------------------------------

--
-- Structure for view `vw_kelas`
--
DROP TABLE IF EXISTS `vw_kelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_kelas` AS select `t`.`replid` AS `idtingkat`,`t`.`tingkat` AS `tingkat`,`t`.`urutan` AS `urutan`,`st`.`replid` AS `idsubtingkat`,`st`.`subtingkat` AS `subtingkat`,`k`.`replid` AS `idkelas`,`k`.`kelas` AS `kelas`,`k`.`departemen` AS `iddepartemen`,`dk`.`replid` AS `iddetailkelas`,`dk`.`tahunajaran` AS `idtahunajaran` from (((`aka_tingkat` `t` join `aka_subtingkat` `st` on((`st`.`tingkat` = `t`.`replid`))) join `aka_kelas` `k` on((`k`.`subtingkat` = `st`.`replid`))) join `aka_detailkelas` `dk` on((`dk`.`kelas` = `k`.`replid`))) order by `t`.`urutan`,`st`.`subtingkat`,`k`.`kelas`;

-- --------------------------------------------------------

--
-- Structure for view `vw_psb_siswa_kriteria`
--
DROP TABLE IF EXISTS `vw_psb_siswa_kriteria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_psb_siswa_kriteria` AS select `siswa`.`replid` AS `idsiswa`,`siswa`.`nis` AS `nis`,`siswa`.`nisn` AS `nisn`,`siswa`.`nopendaftaran` AS `nopendaftaran`,`siswa`.`namasiswa` AS `namasiswa`,`siswa`.`status` AS `status`,`tingkat`.`replid` AS `idtingkat`,`tingkat`.`tingkat` AS `tingkat`,`subtingkat`.`replid` AS `idsubtingkat`,`subtingkat`.`subtingkat` AS `subtingkat`,`detailgelombang`.`replid` AS `iddetailgelombang` from ((((((((((`psb_siswa` `siswa` join `psb_siswabiaya` `siswabiaya` on((`siswabiaya`.`siswa` = `siswa`.`replid`))) join `psb_detailbiaya` `detailbiaya` on((`detailbiaya`.`replid` = `siswabiaya`.`detailbiaya`))) join `psb_biaya` `biaya` on((`biaya`.`replid` = `detailbiaya`.`biaya`))) join `aka_subtingkat` `subtingkat` on((`subtingkat`.`replid` = `detailbiaya`.`subtingkat`))) join `aka_tingkat` `tingkat` on((`tingkat`.`replid` = `subtingkat`.`tingkat`))) join `psb_detailgelombang` `detailgelombang` on((`detailgelombang`.`replid` = `detailbiaya`.`detailgelombang`))) join `psb_gelombang` `gelombang` on((`gelombang`.`replid` = `detailgelombang`.`gelombang`))) join `aka_tahunajaran` `tahunajaran` on((`tahunajaran`.`replid` = `detailgelombang`.`tahunajaran`))) join `psb_golongan` `golongan` on((`golongan`.`replid` = `detailbiaya`.`golongan`))) join `departemen` on((`departemen`.`replid` = `detailgelombang`.`departemen`))) group by `siswa`.`replid`;

-- --------------------------------------------------------

--
-- Structure for view `vw_siswa_kelas`
--
DROP TABLE IF EXISTS `vw_siswa_kelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_siswa_kelas` AS select `s`.`replid` AS `idsiswa`,`sk`.`replid` AS `idsiswakelas`,`dk`.`replid` AS `iddetailkelas`,`k`.`replid` AS `idkelas`,`st`.`replid` AS `idsubtingkat`,`t`.`replid` AS `idtingkat`,`dk`.`tahunajaran` AS `idtahunajaran`,`k`.`departemen` AS `iddepartemen`,`s`.`namasiswa` AS `namasiswa`,`s`.`nis` AS `nis`,`s`.`nisn` AS `nisn`,`d`.`nama` AS `departemen`,`ta`.`tahunajaran` AS `tahunajaran`,`st`.`subtingkat` AS `subtingkat`,`t`.`tingkat` AS `tingkat`,`k`.`kelas` AS `kelas` from (((((((`psb_siswa` `s` join `aka_siswakelas` `sk` on((`sk`.`siswa` = `s`.`replid`))) join `aka_detailkelas` `dk` on((`dk`.`replid` = `sk`.`detailkelas`))) join `aka_kelas` `k` on((`k`.`replid` = `dk`.`kelas`))) join `aka_subtingkat` `st` on((`st`.`replid` = `k`.`subtingkat`))) join `aka_tingkat` `t` on((`t`.`replid` = `st`.`tingkat`))) join `departemen` `d` on((`d`.`replid` = `k`.`departemen`))) join `aka_tahunajaran` `ta` on((`ta`.`replid` = `dk`.`tahunajaran`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
