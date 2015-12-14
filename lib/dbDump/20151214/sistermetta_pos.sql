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
-- Table structure for table `mst_agama`
--

DROP TABLE IF EXISTS `mst_agama`;
CREATE TABLE IF NOT EXISTS `mst_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mst_suku`
--

DROP TABLE IF EXISTS `mst_suku`;
CREATE TABLE IF NOT EXISTS `mst_suku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suku` varchar(20) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`suku`),
  UNIQUE KEY `UX_suku` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_alur_stok`
--

DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE IF NOT EXISTS `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=748 ;

--
-- Dumping data for table `pos_alur_stok`
--

INSERT INTO `pos_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(1, '2015-09-03', 'Pembelian', 'INV0309150001', 'KPR1307150028', '13'),
(2, '2015-09-04', 'Pembelian', 'INV0409150002', 'KPR1307150028', '13'),
(3, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR1307150028', '13'),
(4, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR1307150029', '17'),
(5, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR1307150030', '17'),
(6, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150031', '18'),
(7, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150032', '19'),
(8, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150033', '19'),
(9, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150034', '8'),
(10, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2508150035', '8'),
(11, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150036', '9'),
(12, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150037', '9'),
(13, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150038', '2'),
(14, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150039', '2'),
(15, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150040', '17'),
(16, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150041', '17'),
(17, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150042', '18'),
(18, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150043', '18'),
(19, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150044', '19'),
(20, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150045', '19'),
(21, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150046', '8'),
(22, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150047', '8'),
(23, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150048', '9'),
(24, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150049', '9'),
(25, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150050', '2'),
(26, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150051', '2'),
(27, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150052', '17'),
(28, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150053', '17'),
(29, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150054', '18'),
(30, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150055', '18'),
(31, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150056', '19'),
(32, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150057', '19'),
(33, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150058', '8'),
(34, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150059', '8'),
(35, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150060', '9'),
(36, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150061', '9'),
(37, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR0409150177', '2'),
(38, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR0409150178', '2'),
(39, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150073', '17'),
(40, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150074', '17'),
(41, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150075', '18'),
(42, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150076', '18'),
(43, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150077', '19'),
(44, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150078', '19'),
(45, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150079', '8'),
(46, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150080', '8'),
(47, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150081', '8'),
(48, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150082', '8'),
(49, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150083', '9'),
(50, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150084', '9'),
(51, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150085', '9'),
(52, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150086', '9'),
(53, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150087', '2'),
(54, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150088', '2'),
(55, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150089', '2'),
(56, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150090', '3'),
(57, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150062', '16'),
(58, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150063', '17'),
(59, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150064', '18'),
(60, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150065', '18'),
(61, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150066', '19'),
(62, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150067', '19'),
(63, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150068', '8'),
(64, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150069', '8'),
(65, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150070', '9'),
(66, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150071', '9'),
(67, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150072', '2'),
(68, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR0409150179', '2'),
(69, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150091', '17'),
(70, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150092', '16'),
(71, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150093', '19'),
(72, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150094', '8'),
(73, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150095', '9'),
(74, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150096', '2'),
(75, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150097', '17'),
(76, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150098', '18'),
(77, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150099', '19'),
(78, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150100', '19'),
(79, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150101', '8'),
(80, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150102', '8'),
(81, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150103', '9'),
(82, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150104', '9'),
(83, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150105', '2'),
(84, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150106', '2'),
(85, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150107', '17'),
(86, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150108', '18'),
(87, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150109', '19'),
(88, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150110', '8'),
(89, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150111', '10'),
(90, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150112', '2'),
(91, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150113', '17'),
(92, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150114', '18'),
(93, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150115', '19'),
(94, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150116', '3'),
(95, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150117', '10'),
(96, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150118', '2'),
(97, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150120', '16'),
(98, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150121', '18'),
(99, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150122', '19'),
(100, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150123', '8'),
(101, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150124', '10'),
(102, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150125', '4'),
(103, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150126', '16'),
(104, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150127', '18'),
(105, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150128', '19'),
(106, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150129', '8'),
(107, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150130', '10'),
(108, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150131', '4'),
(109, '2015-09-04', 'Pembelian', 'INV0409150003', 'KPR2808150119', '15'),
(110, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150182', '18'),
(111, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150180', '16'),
(112, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150184', '19'),
(113, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150186', '8'),
(114, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150188', '10'),
(115, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150190', '5'),
(116, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150181', '16'),
(117, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150183', '18'),
(118, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150185', '19'),
(119, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150187', '8'),
(120, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150189', '10'),
(121, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150191', '5'),
(122, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150198', '16'),
(123, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150199', '18'),
(124, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150200', '19'),
(125, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150201', '8'),
(126, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150202', '10'),
(127, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150203', '5'),
(128, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150192', '16'),
(129, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150193', '18'),
(130, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150194', '19'),
(131, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150195', '8'),
(132, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150196', '10'),
(133, '2015-09-11', 'Pembelian', 'INV1109150004', 'KPR1109150197', '5'),
(134, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150066', '1'),
(135, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150077', '1'),
(136, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150093', '1'),
(137, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150099', '1'),
(138, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150115', '1'),
(139, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150109', '1'),
(140, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2508150032', '1'),
(141, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150044', '1'),
(142, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150056', '1'),
(143, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150194', '1'),
(144, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150200', '1'),
(145, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150184', '1'),
(146, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150185', '1'),
(147, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150134', '1'),
(148, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150140', '1'),
(149, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150122', '1'),
(150, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR2808150128', '1'),
(151, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR3108150148', '1'),
(152, '2015-09-11', 'Pembelian', 'INV1109150005', 'KPR1109150204', '1'),
(153, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150144', '17'),
(154, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150145', '17'),
(155, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150146', '18'),
(156, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150147', '18'),
(157, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150148', '19'),
(158, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150149', '19'),
(159, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150150', '8'),
(160, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150151', '8'),
(161, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150152', '9'),
(162, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150153', '9'),
(163, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150154', '3'),
(164, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150155', '3'),
(165, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150138', '17'),
(166, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150139', '18'),
(167, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150140', '20'),
(168, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150141', '8'),
(169, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150143', '4'),
(170, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150132', '17'),
(171, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150133', '18'),
(172, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150134', '19'),
(173, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150135', '8'),
(174, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150136', '9'),
(175, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150137', '3'),
(176, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150156', '8'),
(177, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150157', '10'),
(178, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR3108150158', '5'),
(179, '2015-09-11', 'Pembelian', 'INV1109150006', 'KPR2808150142', '8'),
(180, '2015-09-11', 'Pembelian', 'INV1109150007', 'KPR1109150204', '81'),
(181, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150062', '1'),
(182, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150073', '1'),
(183, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150091', '1'),
(184, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150097', '1'),
(185, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150113', '1'),
(186, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150107', '1'),
(187, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1307150028', '1'),
(188, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150040', '1'),
(189, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150052', '1'),
(190, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150180', '1'),
(191, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150181', '1'),
(192, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150198', '1'),
(193, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150192', '1'),
(194, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150138', '1'),
(195, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150132', '1'),
(196, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR3108150144', '1'),
(197, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150120', '1'),
(198, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150126', '1'),
(199, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR1109150204', '1'),
(200, '2015-09-11', 'Penjualan', 'FAK1109150001', 'KPR2808150119', '1'),
(201, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150064', '1'),
(202, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150075', '1'),
(203, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150092', '1'),
(204, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150098', '1'),
(205, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150114', '1'),
(206, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150108', '1'),
(207, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1307150030', '1'),
(208, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150054', '1'),
(209, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150199', '1'),
(210, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150193', '1'),
(211, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150182', '1'),
(212, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150183', '1'),
(213, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR3108150146', '1'),
(214, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150139', '1'),
(215, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150133', '1'),
(216, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150121', '1'),
(217, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150127', '1'),
(218, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR1109150204', '1'),
(219, '2015-09-11', 'Penjualan', 'FAK1109150002', 'KPR2808150042', '1'),
(220, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150066', '1'),
(221, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150077', '1'),
(222, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150093', '1'),
(223, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150099', '1'),
(224, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150115', '1'),
(225, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150109', '1'),
(226, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2508150032', '1'),
(227, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150056', '1'),
(228, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150044', '1'),
(229, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150194', '1'),
(230, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150200', '1'),
(231, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150184', '1'),
(232, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150185', '1'),
(233, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150140', '1'),
(234, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150134', '1'),
(235, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR3108150148', '1'),
(236, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150122', '1'),
(237, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR2808150128', '1'),
(238, '2015-09-11', 'Penjualan', 'FAK1109150003', 'KPR1109150204', '1'),
(239, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150068', '1'),
(240, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150079', '1'),
(241, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150080', '1'),
(242, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150094', '1'),
(243, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150101', '1'),
(244, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150116', '1'),
(245, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150110', '1'),
(246, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2508150034', '1'),
(247, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150046', '1'),
(248, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150058', '1'),
(249, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150186', '1'),
(250, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150187', '1'),
(251, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150201', '1'),
(252, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150195', '1'),
(253, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR3108150150', '1'),
(254, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150135', '1'),
(255, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150141', '1'),
(256, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150123', '1'),
(257, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR2808150129', '1'),
(258, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR3108150156', '1'),
(259, '2015-09-11', 'Penjualan', 'FAK1109150004', 'KPR1109150204', '1'),
(260, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150073', '1'),
(261, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150062', '1'),
(262, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150091', '1'),
(263, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150097', '1'),
(264, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150113', '1'),
(265, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150107', '1'),
(266, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1307150028', '1'),
(267, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150040', '1'),
(268, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150052', '1'),
(269, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150192', '1'),
(270, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150198', '1'),
(271, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150180', '1'),
(272, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150181', '1'),
(273, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150138', '1'),
(274, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150132', '1'),
(275, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR3108150144', '1'),
(276, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150119', '1'),
(277, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR1109150204', '1'),
(278, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150120', '1'),
(279, '2015-09-21', 'Penjualan', 'FAK2109150005', 'KPR2808150126', '1'),
(280, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150062', '1'),
(281, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150073', '1'),
(282, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150091', '1'),
(283, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150097', '1'),
(284, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150113', '1'),
(285, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150107', '1'),
(286, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1307150028', '1'),
(287, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150040', '1'),
(288, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150052', '1'),
(289, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150192', '1'),
(290, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150198', '1'),
(291, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150180', '1'),
(292, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150181', '1'),
(293, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR3108150144', '1'),
(294, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150138', '1'),
(295, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150132', '1'),
(296, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150120', '1'),
(297, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150126', '1'),
(298, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR2808150119', '1'),
(299, '2015-09-21', 'Penjualan', 'FAK2109150006', 'KPR1109150204', '1'),
(300, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150062', '1'),
(301, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150073', '1'),
(302, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150091', '1'),
(303, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150097', '1'),
(304, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150113', '1'),
(305, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150107', '1'),
(306, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1307150028', '1'),
(307, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150040', '1'),
(308, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150052', '1'),
(309, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150192', '1'),
(310, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150198', '1'),
(311, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150180', '1'),
(312, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150181', '1'),
(313, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR3108150144', '1'),
(314, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150138', '1'),
(315, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150120', '1'),
(316, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150126', '1'),
(317, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR1109150204', '1'),
(318, '2015-09-21', 'Penjualan', 'FAK2109150007', 'KPR2808150119', '1'),
(319, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150062', '1'),
(320, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150073', '1'),
(321, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150091', '1'),
(322, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150097', '1'),
(323, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150113', '1'),
(324, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150107', '1'),
(325, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1307150028', '1'),
(326, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150040', '1'),
(327, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150052', '1'),
(328, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150192', '1'),
(329, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150198', '1'),
(330, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150180', '1'),
(331, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150181', '1'),
(332, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150132', '1'),
(333, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR3108150144', '1'),
(334, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150138', '1'),
(335, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150120', '1'),
(336, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150126', '1'),
(337, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR2808150119', '1'),
(338, '2015-09-21', 'Penjualan', 'FAK2109150008', 'KPR1109150204', '1'),
(339, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150062', '1'),
(340, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150073', '1'),
(341, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150091', '1'),
(342, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150097', '1'),
(343, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150113', '1'),
(344, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150107', '1'),
(345, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1307150028', '1'),
(346, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150040', '1'),
(347, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150052', '1'),
(348, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150192', '1'),
(349, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150198', '1'),
(350, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150180', '1'),
(351, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150181', '1'),
(352, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150132', '1'),
(353, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR3108150144', '1'),
(354, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150138', '1'),
(355, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150120', '1'),
(356, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150126', '1'),
(357, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR2808150119', '1'),
(358, '2015-09-21', 'Penjualan', 'FAK2109150009', 'KPR1109150204', '1'),
(359, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150062', '1'),
(360, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150073', '1'),
(361, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150091', '1'),
(362, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150097', '1'),
(363, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150113', '1'),
(364, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150107', '1'),
(365, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1307150028', '1'),
(366, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150040', '1'),
(367, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150052', '1'),
(368, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150192', '1'),
(369, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150198', '1'),
(370, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150180', '1'),
(371, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150181', '1'),
(372, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150132', '1'),
(373, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR3108150144', '1'),
(374, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150138', '1'),
(375, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150120', '1'),
(376, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150126', '1'),
(377, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR2808150119', '1'),
(378, '2015-09-21', 'Penjualan', 'FAK2109150010', 'KPR1109150204', '1'),
(379, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150062', '1'),
(380, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150073', '1'),
(381, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150091', '1'),
(382, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150097', '1'),
(383, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150113', '1'),
(384, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150107', '1'),
(385, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150192', '1'),
(386, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150198', '1'),
(387, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150180', '1'),
(388, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150181', '1'),
(389, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150132', '1'),
(390, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR3108150144', '1'),
(391, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150138', '1'),
(392, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150120', '1'),
(393, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150126', '1'),
(394, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150119', '1'),
(395, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1307150028', '1'),
(396, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150040', '1'),
(397, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR2808150052', '1'),
(398, '2015-09-21', 'Penjualan', 'FAK2109150011', 'KPR1109150204', '1'),
(399, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150062', '1'),
(400, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150073', '1'),
(401, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150091', '1'),
(402, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150097', '1'),
(403, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150113', '1'),
(404, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150107', '1'),
(405, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1307150028', '1'),
(406, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150040', '1'),
(407, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150052', '1'),
(408, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150192', '1'),
(409, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150198', '1'),
(410, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150180', '1'),
(411, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150181', '1'),
(412, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150132', '1'),
(413, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR3108150144', '1'),
(414, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150138', '1'),
(415, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150120', '1'),
(416, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150126', '1'),
(417, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR2808150119', '1'),
(418, '2015-09-21', 'Penjualan', 'FAK2109150012', 'KPR1109150204', '1'),
(419, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150062', '1'),
(420, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150073', '1'),
(421, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150091', '1'),
(422, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150097', '1'),
(423, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150113', '1'),
(424, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150107', '1'),
(425, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1307150028', '1'),
(426, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150040', '1'),
(427, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150052', '1'),
(428, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150192', '1'),
(429, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150198', '1'),
(430, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150180', '1'),
(431, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150181', '1'),
(432, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR3108150144', '1'),
(433, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150138', '1'),
(434, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150120', '1'),
(435, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150126', '1'),
(436, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR1109150204', '1'),
(437, '2015-09-21', 'Retur Penjualan', 'RTJ2109150001', 'KPR2808150119', '1'),
(438, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150062', '1'),
(439, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150073', '1'),
(440, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150091', '1'),
(441, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150097', '1'),
(442, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150113', '1'),
(443, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150107', '1'),
(444, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1307150028', '1'),
(445, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150040', '1'),
(446, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150052', '1'),
(447, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150192', '1'),
(448, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150198', '1'),
(449, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150180', '1'),
(450, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150181', '1'),
(451, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150132', '1'),
(452, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR3108150144', '1'),
(453, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150138', '1'),
(454, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150120', '1'),
(455, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150126', '1'),
(456, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR2808150119', '1'),
(457, '2015-09-21', 'Retur Penjualan', 'RTJ2109150002', 'KPR1109150204', '1'),
(458, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150062', '1'),
(459, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150073', '1'),
(460, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150097', '1'),
(461, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150113', '1'),
(462, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150107', '1'),
(463, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1307150028', '1'),
(464, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150040', '1'),
(465, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150052', '1'),
(466, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150192', '1'),
(467, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150198', '1'),
(468, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150180', '1'),
(469, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150181', '1'),
(470, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150132', '1'),
(471, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR3108150144', '1'),
(472, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150138', '1'),
(473, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150120', '1'),
(474, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150126', '1'),
(475, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR2808150119', '1'),
(476, '2015-09-28', 'Penjualan', 'FAK2809150001', 'KPR1109150204', '1'),
(477, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150062', '1'),
(478, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150073', '1'),
(479, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150091', '1'),
(480, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150097', '1'),
(481, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150113', '1'),
(482, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150107', '1'),
(483, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1307150028', '1'),
(484, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150040', '1'),
(485, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150052', '1'),
(486, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150192', '1'),
(487, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150198', '1'),
(488, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150180', '1'),
(489, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150181', '1'),
(490, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150132', '1'),
(491, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR3108150144', '1'),
(492, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150138', '1'),
(493, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150120', '1'),
(494, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150126', '1'),
(495, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR2808150119', '1'),
(496, '2015-09-28', 'Penjualan', 'FAK2809150002', 'KPR1109150204', '1'),
(497, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150062', '1'),
(498, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150073', '1'),
(499, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150091', '1'),
(500, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150097', '1'),
(501, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150113', '1'),
(502, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150107', '1'),
(503, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1307150028', '1'),
(504, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150040', '1'),
(505, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150052', '1'),
(506, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150192', '1'),
(507, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150198', '1'),
(508, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150132', '1'),
(509, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR3108150144', '1'),
(510, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150138', '1'),
(511, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150120', '1'),
(512, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150126', '1'),
(513, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR2808150119', '1'),
(514, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150180', '1'),
(515, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150181', '1'),
(516, '2015-09-28', 'Penjualan', 'FAK2809150003', 'KPR1109150204', '1'),
(517, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150062', '1'),
(518, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150073', '1'),
(519, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150091', '1'),
(520, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150097', '1'),
(521, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150113', '1'),
(522, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150107', '1'),
(523, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1307150028', '1'),
(524, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150040', '1'),
(525, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150052', '1'),
(526, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150192', '1'),
(527, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150198', '1'),
(528, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150180', '1'),
(529, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150181', '1'),
(530, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150132', '1'),
(531, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR3108150144', '1'),
(532, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150138', '1'),
(533, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150120', '1'),
(534, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150126', '1'),
(535, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR2808150119', '1'),
(536, '2015-10-08', 'Penjualan', 'FAK0810150001', 'KPR1109150204', '1'),
(537, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150062', '1'),
(538, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150073', '1'),
(539, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150091', '1'),
(540, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150097', '1'),
(541, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150113', '1'),
(542, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150107', '1'),
(543, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1307150028', '1'),
(544, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150040', '1'),
(545, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150052', '1'),
(546, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150192', '1'),
(547, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150198', '1'),
(548, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150180', '1'),
(549, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150181', '1'),
(550, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150132', '1'),
(551, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR3108150144', '1'),
(552, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150138', '1'),
(553, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150120', '1'),
(554, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150126', '1'),
(555, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR2808150119', '1'),
(556, '2015-10-08', 'Penjualan', 'FAK0810150002', 'KPR1109150204', '1'),
(557, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150062', '1'),
(558, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150073', '1'),
(559, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150091', '1'),
(560, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150097', '1'),
(561, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150113', '1'),
(562, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150107', '1'),
(563, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1307150028', '1'),
(564, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150040', '1'),
(565, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150052', '1'),
(566, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150192', '1'),
(567, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150198', '1'),
(568, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150180', '1'),
(569, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150181', '1'),
(570, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150132', '1'),
(571, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR3108150144', '1'),
(572, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150138', '1'),
(573, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150120', '1'),
(574, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150126', '1'),
(575, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR2808150119', '1'),
(576, '2015-10-08', 'Penjualan', 'FAK0810150003', 'KPR1109150204', '1'),
(577, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150062', '1'),
(578, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150073', '1'),
(579, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150091', '1'),
(580, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150097', '1'),
(581, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150113', '1'),
(582, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150107', '1'),
(583, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1307150028', '1'),
(584, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150040', '1'),
(585, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150052', '1'),
(586, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150192', '1'),
(587, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150198', '1'),
(588, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150180', '1'),
(589, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150181', '1'),
(590, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150132', '1'),
(591, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR3108150144', '1'),
(592, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150138', '1'),
(593, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150120', '1'),
(594, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150126', '1'),
(595, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR2808150119', '1'),
(596, '2015-10-08', 'Penjualan', 'FAK0810150004', 'KPR1109150204', '1'),
(597, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150062', '1'),
(598, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150073', '1'),
(599, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150091', '1'),
(600, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150097', '1'),
(601, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150113', '1'),
(602, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150107', '1'),
(603, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1307150028', '1'),
(604, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150040', '1'),
(605, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150052', '1'),
(606, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150192', '1'),
(607, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150198', '1'),
(608, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150180', '1'),
(609, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150181', '1'),
(610, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150132', '1'),
(611, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR3108150144', '1'),
(612, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150138', '1'),
(613, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150120', '1'),
(614, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150126', '1'),
(615, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR2808150119', '1'),
(616, '2015-10-08', 'Penjualan', 'FAK0810150005', 'KPR1109150204', '1'),
(617, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150064', '1'),
(618, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150075', '1'),
(619, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150092', '1'),
(620, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150098', '1'),
(621, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150114', '1'),
(622, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150108', '1'),
(623, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1307150030', '1'),
(624, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150042', '1'),
(625, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150054', '1'),
(626, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150193', '1'),
(627, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150199', '1'),
(628, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150182', '1'),
(629, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150183', '1'),
(630, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150133', '1'),
(631, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR3108150146', '1'),
(632, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150139', '1'),
(633, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150121', '1'),
(634, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR2808150127', '1'),
(635, '2015-10-08', 'Penjualan', 'FAK0810150006', 'KPR1109150204', '1'),
(636, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150064', '1'),
(637, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150075', '1'),
(638, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150092', '1'),
(639, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150098', '1'),
(640, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150114', '1'),
(641, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150108', '1'),
(642, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1307150030', '1'),
(643, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150042', '1'),
(644, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150054', '1'),
(645, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150193', '1'),
(646, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150199', '1'),
(647, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150182', '1'),
(648, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150183', '1'),
(649, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150133', '1'),
(650, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR3108150146', '1'),
(651, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150139', '1'),
(652, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150121', '1'),
(653, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR2808150127', '1'),
(654, '2015-10-08', 'Penjualan', 'FAK0810150007', 'KPR1109150204', '1'),
(655, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150064', '1'),
(656, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150075', '1'),
(657, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150092', '1'),
(658, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150098', '1'),
(659, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150114', '1'),
(660, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150108', '1'),
(661, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1307150030', '1'),
(662, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150042', '1'),
(663, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150054', '1'),
(664, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150193', '1'),
(665, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150199', '1'),
(666, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150182', '1'),
(667, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150183', '1'),
(668, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150133', '1'),
(669, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR3108150146', '1'),
(670, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150139', '1'),
(671, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150121', '1'),
(672, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR2808150127', '1'),
(673, '2015-10-08', 'Penjualan', 'FAK0810150008', 'KPR1109150204', '1'),
(674, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150064', '1'),
(675, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150075', '1'),
(676, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150092', '1'),
(677, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150098', '1'),
(678, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150114', '1'),
(679, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150108', '1'),
(680, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1307150030', '1'),
(681, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150042', '1'),
(682, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150054', '1'),
(683, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150193', '1'),
(684, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150199', '1'),
(685, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150182', '1'),
(686, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150183', '1'),
(687, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150133', '1'),
(688, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR3108150146', '1'),
(689, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150139', '1'),
(690, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150121', '1'),
(691, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR2808150127', '1'),
(692, '2015-10-08', 'Penjualan', 'FAK0810150009', 'KPR1109150204', '1'),
(693, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150064', '1'),
(694, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150075', '1'),
(695, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150092', '1'),
(696, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150098', '1'),
(697, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150114', '1'),
(698, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150108', '1'),
(699, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1307150030', '1');
INSERT INTO `pos_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(700, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150042', '1'),
(701, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150054', '1'),
(702, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150193', '1'),
(703, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150199', '1'),
(704, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150182', '1'),
(705, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150183', '1'),
(706, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150133', '1'),
(707, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR3108150146', '1'),
(708, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150139', '1'),
(709, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150121', '1'),
(710, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR2808150127', '1'),
(711, '2015-10-08', 'Penjualan', 'FAK0810150010', 'KPR1109150204', '1'),
(712, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150064', '1'),
(713, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150075', '1'),
(714, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150092', '1'),
(715, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150098', '1'),
(716, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150114', '1'),
(717, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150108', '1'),
(718, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1307150030', '1'),
(719, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150042', '1'),
(720, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150054', '1'),
(721, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150193', '1'),
(722, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150199', '1'),
(723, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150182', '1'),
(724, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150183', '1'),
(725, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150133', '1'),
(726, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR3108150146', '1'),
(727, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150139', '1'),
(728, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150121', '1'),
(729, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR2808150127', '1'),
(730, '2015-10-09', 'Penjualan', 'FAK0910150001', 'KPR1109150204', '1'),
(731, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150064', '1'),
(732, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150075', '1'),
(733, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150098', '1'),
(734, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150108', '1'),
(735, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1307150030', '1'),
(736, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150042', '1'),
(737, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150054', '1'),
(738, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150193', '1'),
(739, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150199', '1'),
(740, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150182', '1'),
(741, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150183', '1'),
(742, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150133', '1'),
(743, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR3108150146', '1'),
(744, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150139', '1'),
(745, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150121', '1'),
(746, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR2808150127', '1'),
(747, '2015-10-09', 'Penjualan', 'FAK0910150002', 'KPR1109150204', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pos_biayabulanan`
--

DROP TABLE IF EXISTS `pos_biayabulanan`;
CREATE TABLE IF NOT EXISTS `pos_biayabulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_customer`
--

DROP TABLE IF EXISTS `pos_customer`;
CREATE TABLE IF NOT EXISTS `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nis` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_jenisproduk`
--

DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE IF NOT EXISTS `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis` enum('BARANG','JASA') NOT NULL DEFAULT 'BARANG',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

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
CREATE TABLE IF NOT EXISTS `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `pos_jenjang`
--

INSERT INTO `pos_jenjang` (`id`, `nama`) VALUES
(1, 'Playgroup'),
(2, 'Kindegarden'),
(3, 'Elementary'),
(4, 'Primary'),
(5, 'Secondary');

-- --------------------------------------------------------

--
-- Table structure for table `pos_kelas`
--

DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE IF NOT EXISTS `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
CREATE TABLE IF NOT EXISTS `pos_pembelian` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pos_pembelian`
--

INSERT INTO `pos_pembelian` (`id`, `noinvoice`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `hutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'INV0309150001', '', '2015-09-03', 'SUP1307150004', 'Tunai', '873600', '0', '873600', '873600', '0', '0', '', 'admin'),
(2, 'INV0409150002', '', '2015-09-04', 'SUP1307150004', 'Tunai', '873600', '0', '873600', '873600', '0', '0', '', 'admin'),
(3, 'INV0409150003', '', '2015-09-04', 'SUP1307150004', 'Tunai', '79926125', '0', '79926125', '79926125', '0', '0', '', 'admin'),
(4, 'INV1109150004', '', '2015-09-11', 'SUP1307150004', 'Tunai', '12028500', '0', '12028500', '12028500', '0', '0', '', 'admin'),
(5, 'INV1109150005', '', '2015-09-11', 'SUP1307150004', 'Tunai', '1083500', '0', '1083500', '1083500', '0', '0', '', 'admin'),
(6, 'INV1109150006', '', '2015-09-11', 'SUP1307150006', 'Tunai', '11963000', '0', '11963000', '11963000', '0', '0', '', 'admin'),
(7, 'INV1109150007', '', '2015-09-11', 'SUP1109150009', 'Tunai', '4455000', '0', '4455000', '4455000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembeliandetail`
--

DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE IF NOT EXISTS `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=181 ;

--
-- Dumping data for table `pos_pembeliandetail`
--

INSERT INTO `pos_pembeliandetail` (`id`, `noinvoice`, `nopo`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'INV0309150001', '', 'KPR1307150028', '13', '84000', '20', '873600'),
(2, 'INV0409150002', '', 'KPR1307150028', '13', '84000', '20', '873600'),
(3, 'INV0409150003', '', 'KPR1307150028', '13', '84000', '20', '873600'),
(4, 'INV0409150003', '', 'KPR1307150029', '17', '84000', '20', '1142400'),
(5, 'INV0409150003', '', 'KPR1307150030', '17', '84000', '20', '1142400'),
(6, 'INV0409150003', '', 'KPR2508150031', '18', '84000', '20', '1209600'),
(7, 'INV0409150003', '', 'KPR2508150032', '19', '84000', '20', '1276800'),
(8, 'INV0409150003', '', 'KPR2508150033', '19', '84000', '20', '1276800'),
(9, 'INV0409150003', '', 'KPR2508150034', '8', '87000', '20', '556800'),
(10, 'INV0409150003', '', 'KPR2508150035', '8', '87000', '20', '556800'),
(11, 'INV0409150003', '', 'KPR2808150036', '9', '87000', '20', '626400'),
(12, 'INV0409150003', '', 'KPR2808150037', '9', '87000', '20', '626400'),
(13, 'INV0409150003', '', 'KPR2808150038', '2', '87000', '20', '139200'),
(14, 'INV0409150003', '', 'KPR2808150039', '2', '87000', '20', '139200'),
(15, 'INV0409150003', '', 'KPR2808150040', '17', '72000', '20', '979200'),
(16, 'INV0409150003', '', 'KPR2808150041', '17', '72000', '20', '979200'),
(17, 'INV0409150003', '', 'KPR2808150042', '18', '72000', '20', '1036800'),
(18, 'INV0409150003', '', 'KPR2808150043', '18', '72000', '20', '1036800'),
(19, 'INV0409150003', '', 'KPR2808150044', '19', '72000', '20', '1094400'),
(20, 'INV0409150003', '', 'KPR2808150045', '19', '72000', '20', '1094400'),
(21, 'INV0409150003', '', 'KPR2808150046', '8', '72000', '20', '460800'),
(22, 'INV0409150003', '', 'KPR2808150047', '8', '72000', '20', '460800'),
(23, 'INV0409150003', '', 'KPR2808150048', '9', '72000', '20', '518400'),
(24, 'INV0409150003', '', 'KPR2808150049', '9', '72000', '20', '518400'),
(25, 'INV0409150003', '', 'KPR2808150050', '2', '72000', '20', '115200'),
(26, 'INV0409150003', '', 'KPR2808150051', '2', '72000', '20', '115200'),
(27, 'INV0409150003', '', 'KPR2808150052', '17', '85000', '20', '1156000'),
(28, 'INV0409150003', '', 'KPR2808150053', '17', '85000', '20', '1156000'),
(29, 'INV0409150003', '', 'KPR2808150054', '18', '85000', '20', '1224000'),
(30, 'INV0409150003', '', 'KPR2808150055', '18', '85000', '20', '1224000'),
(31, 'INV0409150003', '', 'KPR2808150056', '19', '85000', '20', '1292000'),
(32, 'INV0409150003', '', 'KPR2808150057', '19', '85000', '20', '1292000'),
(33, 'INV0409150003', '', 'KPR2808150058', '8', '85000', '20', '544000'),
(34, 'INV0409150003', '', 'KPR2808150059', '8', '85000', '20', '544000'),
(35, 'INV0409150003', '', 'KPR2808150060', '9', '85000', '20', '612000'),
(36, 'INV0409150003', '', 'KPR2808150061', '9', '85000', '20', '612000'),
(37, 'INV0409150003', '', 'KPR0409150177', '2', '85000', '20', '136000'),
(38, 'INV0409150003', '', 'KPR0409150178', '2', '85000', '20', '136000'),
(39, 'INV0409150003', '', 'KPR2808150073', '17', '78000', '20', '1060800'),
(40, 'INV0409150003', '', 'KPR2808150074', '17', '78000', '20', '1060800'),
(41, 'INV0409150003', '', 'KPR2808150075', '18', '83000', '20', '1195200'),
(42, 'INV0409150003', '', 'KPR2808150076', '18', '86000', '20', '1238400'),
(43, 'INV0409150003', '', 'KPR2808150077', '19', '86000', '20', '1307200'),
(44, 'INV0409150003', '', 'KPR2808150078', '19', '86000', '20', '1307200'),
(45, 'INV0409150003', '', 'KPR2808150079', '8', '56000', '20', '358400'),
(46, 'INV0409150003', '', 'KPR2808150080', '8', '56000', '20', '358400'),
(47, 'INV0409150003', '', 'KPR2808150081', '8', '56000', '20', '358400'),
(48, 'INV0409150003', '', 'KPR2808150082', '8', '56000', '20', '358400'),
(49, 'INV0409150003', '', 'KPR2808150083', '9', '56000', '20', '403200'),
(50, 'INV0409150003', '', 'KPR2808150084', '9', '56000', '20', '403200'),
(51, 'INV0409150003', '', 'KPR2808150085', '9', '56000', '20', '403200'),
(52, 'INV0409150003', '', 'KPR2808150086', '9', '56000', '20', '403200'),
(53, 'INV0409150003', '', 'KPR2808150087', '2', '56000', '20', '89600'),
(54, 'INV0409150003', '', 'KPR2808150088', '2', '56000', '20', '89600'),
(55, 'INV0409150003', '', 'KPR2808150089', '2', '56000', '20', '89600'),
(56, 'INV0409150003', '', 'KPR2808150090', '3', '56000', '20', '134400'),
(57, 'INV0409150003', '', 'KPR2808150062', '16', '90000', '20', '1152000'),
(58, 'INV0409150003', '', 'KPR2808150063', '17', '90000', '20', '1224000'),
(59, 'INV0409150003', '', 'KPR2808150064', '18', '100000', '20', '1440000'),
(60, 'INV0409150003', '', 'KPR2808150065', '18', '105000', '20', '1512000'),
(61, 'INV0409150003', '', 'KPR2808150066', '19', '105000', '20', '1596000'),
(62, 'INV0409150003', '', 'KPR2808150067', '19', '105000', '20', '1596000'),
(63, 'INV0409150003', '', 'KPR2808150068', '8', '106000', '20', '678400'),
(64, 'INV0409150003', '', 'KPR2808150069', '8', '106000', '20', '678400'),
(65, 'INV0409150003', '', 'KPR2808150070', '9', '106000', '20', '763200'),
(66, 'INV0409150003', '', 'KPR2808150071', '9', '106000', '20', '763200'),
(67, 'INV0409150003', '', 'KPR2808150072', '2', '106000', '20', '169600'),
(68, 'INV0409150003', '', 'KPR0409150179', '2', '106000', '20', '169600'),
(69, 'INV0409150003', '', 'KPR2808150091', '17', '137000', '25', '1746750'),
(70, 'INV0409150003', '', 'KPR2808150092', '16', '137000', '25', '1644000'),
(71, 'INV0409150003', '', 'KPR2808150093', '19', '145500', '25', '2073375'),
(72, 'INV0409150003', '', 'KPR2808150094', '8', '137000', '25', '822000'),
(73, 'INV0409150003', '', 'KPR2808150095', '9', '137000', '25', '924750'),
(74, 'INV0409150003', '', 'KPR2808150096', '2', '116000', '25', '174000'),
(75, 'INV0409150003', '', 'KPR2808150097', '17', '95000', '25', '1211250'),
(76, 'INV0409150003', '', 'KPR2808150098', '18', '95000', '25', '1282500'),
(77, 'INV0409150003', '', 'KPR2808150099', '19', '64500', '25', '919125'),
(78, 'INV0409150003', '', 'KPR2808150100', '19', '64500', '25', '919125'),
(79, 'INV0409150003', '', 'KPR2808150101', '8', '64500', '25', '387000'),
(80, 'INV0409150003', '', 'KPR2808150102', '8', '64500', '25', '387000'),
(81, 'INV0409150003', '', 'KPR2808150103', '9', '64500', '25', '435375'),
(82, 'INV0409150003', '', 'KPR2808150104', '9', '64500', '25', '435375'),
(83, 'INV0409150003', '', 'KPR2808150105', '2', '64500', '25', '96750'),
(84, 'INV0409150003', '', 'KPR2808150106', '2', '64500', '25', '96750'),
(85, 'INV0409150003', '', 'KPR2808150107', '17', '40500', '25', '516375'),
(86, 'INV0409150003', '', 'KPR2808150108', '18', '40500', '25', '546750'),
(87, 'INV0409150003', '', 'KPR2808150109', '19', '40500', '25', '577125'),
(88, 'INV0409150003', '', 'KPR2808150110', '8', '40500', '25', '243000'),
(89, 'INV0409150003', '', 'KPR2808150111', '10', '40500', '25', '303750'),
(90, 'INV0409150003', '', 'KPR2808150112', '2', '40500', '25', '60750'),
(91, 'INV0409150003', '', 'KPR2808150113', '17', '99000', '25', '1262250'),
(92, 'INV0409150003', '', 'KPR2808150114', '18', '99000', '25', '1336500'),
(93, 'INV0409150003', '', 'KPR2808150115', '19', '99000', '25', '1410750'),
(94, 'INV0409150003', '', 'KPR2808150116', '3', '99000', '25', '222750'),
(95, 'INV0409150003', '', 'KPR2808150117', '10', '99000', '25', '742500'),
(96, 'INV0409150003', '', 'KPR2808150118', '2', '99000', '25', '148500'),
(97, 'INV0409150003', '', 'KPR2808150120', '16', '70000', '20', '896000'),
(98, 'INV0409150003', '', 'KPR2808150121', '18', '70000', '20', '1008000'),
(99, 'INV0409150003', '', 'KPR2808150122', '19', '70000', '20', '1064000'),
(100, 'INV0409150003', '', 'KPR2808150123', '8', '66000', '20', '422400'),
(101, 'INV0409150003', '', 'KPR2808150124', '10', '66000', '20', '528000'),
(102, 'INV0409150003', '', 'KPR2808150125', '4', '66000', '20', '211200'),
(103, 'INV0409150003', '', 'KPR2808150126', '16', '60000', '20', '768000'),
(104, 'INV0409150003', '', 'KPR2808150127', '18', '60000', '20', '864000'),
(105, 'INV0409150003', '', 'KPR2808150128', '19', '60000', '20', '912000'),
(106, 'INV0409150003', '', 'KPR2808150129', '8', '53000', '20', '339200'),
(107, 'INV0409150003', '', 'KPR2808150130', '10', '53000', '20', '424000'),
(108, 'INV0409150003', '', 'KPR2808150131', '4', '53000', '20', '169600'),
(109, 'INV0409150003', '', 'KPR2808150119', '15', '94000', '20', '1128000'),
(110, 'INV1109150004', '', 'KPR1109150182', '18', '32500', '0', '585000'),
(111, 'INV1109150004', '', 'KPR1109150180', '16', '34500', '0', '552000'),
(112, 'INV1109150004', '', 'KPR1109150184', '19', '33000', '0', '627000'),
(113, 'INV1109150004', '', 'KPR1109150186', '8', '33000', '0', '264000'),
(114, 'INV1109150004', '', 'KPR1109150188', '10', '33000', '0', '330000'),
(115, 'INV1109150004', '', 'KPR1109150190', '5', '33000', '0', '165000'),
(116, 'INV1109150004', '', 'KPR1109150181', '16', '25500', '0', '408000'),
(117, 'INV1109150004', '', 'KPR1109150183', '18', '31000', '0', '558000'),
(118, 'INV1109150004', '', 'KPR1109150185', '19', '31000', '0', '589000'),
(119, 'INV1109150004', '', 'KPR1109150187', '8', '31000', '0', '248000'),
(120, 'INV1109150004', '', 'KPR1109150189', '10', '31000', '0', '310000'),
(121, 'INV1109150004', '', 'KPR1109150191', '5', '31000', '0', '155000'),
(122, 'INV1109150004', '', 'KPR1109150198', '16', '46500', '0', '744000'),
(123, 'INV1109150004', '', 'KPR1109150199', '18', '55000', '0', '990000'),
(124, 'INV1109150004', '', 'KPR1109150200', '19', '48000', '0', '912000'),
(125, 'INV1109150004', '', 'KPR1109150201', '8', '58500', '0', '468000'),
(126, 'INV1109150004', '', 'KPR1109150202', '10', '59500', '0', '595000'),
(127, 'INV1109150004', '', 'KPR1109150203', '5', '59000', '0', '295000'),
(128, 'INV1109150004', '', 'KPR1109150192', '16', '39000', '0', '624000'),
(129, 'INV1109150004', '', 'KPR1109150193', '18', '45000', '0', '810000'),
(130, 'INV1109150004', '', 'KPR1109150194', '19', '43500', '0', '826500'),
(131, 'INV1109150004', '', 'KPR1109150195', '8', '43500', '0', '348000'),
(132, 'INV1109150004', '', 'KPR1109150196', '10', '37500', '0', '375000'),
(133, 'INV1109150004', '', 'KPR1109150197', '5', '50000', '0', '250000'),
(134, 'INV1109150005', '', 'KPR2808150066', '1', '105000', '0', '105000'),
(135, 'INV1109150005', '', 'KPR2808150077', '1', '86000', '0', '86000'),
(136, 'INV1109150005', '', 'KPR2808150093', '1', '145000', '0', '145000'),
(137, 'INV1109150005', '', 'KPR2808150099', '1', '64500', '0', '64500'),
(138, 'INV1109150005', '', 'KPR2808150115', '1', '99000', '0', '99000'),
(139, 'INV1109150005', '', 'KPR2808150109', '1', '40500', '0', '40500'),
(140, 'INV1109150005', '', 'KPR2508150032', '1', '84000', '0', '84000'),
(141, 'INV1109150005', '', 'KPR2808150044', '1', '87000', '0', '87000'),
(142, 'INV1109150005', '', 'KPR2808150056', '1', '87000', '0', '87000'),
(143, 'INV1109150005', '', 'KPR1109150194', '1', '43500', '0', '43500'),
(144, 'INV1109150005', '', 'KPR1109150200', '1', '48000', '0', '48000'),
(145, 'INV1109150005', '', 'KPR1109150184', '1', '33000', '0', '33000'),
(146, 'INV1109150005', '', 'KPR1109150185', '1', '31000', '0', '31000'),
(147, 'INV1109150005', '', 'KPR2808150134', '1', '', '0', ''),
(148, 'INV1109150005', '', 'KPR2808150140', '1', '', '0', ''),
(149, 'INV1109150005', '', 'KPR2808150122', '1', '70000', '0', '70000'),
(150, 'INV1109150005', '', 'KPR2808150128', '1', '60000', '0', '60000'),
(151, 'INV1109150005', '', 'KPR3108150148', '1', '', '0', ''),
(152, 'INV1109150005', '', 'KPR1109150204', '1', '0', '0', '0'),
(153, 'INV1109150006', '', 'KPR3108150144', '17', '63000', '30', '749700'),
(154, 'INV1109150006', '', 'KPR3108150145', '17', '58000', '30', '690200'),
(155, 'INV1109150006', '', 'KPR3108150146', '18', '63000', '30', '793800'),
(156, 'INV1109150006', '', 'KPR3108150147', '18', '58000', '30', '730800'),
(157, 'INV1109150006', '', 'KPR3108150148', '19', '58000', '30', '771400'),
(158, 'INV1109150006', '', 'KPR3108150149', '19', '51000', '30', '678300'),
(159, 'INV1109150006', '', 'KPR3108150150', '8', '57000', '30', '319200'),
(160, 'INV1109150006', '', 'KPR3108150151', '8', '51000', '30', '285600'),
(161, 'INV1109150006', '', 'KPR3108150152', '9', '58000', '30', '365400'),
(162, 'INV1109150006', '', 'KPR3108150153', '9', '51000', '30', '321300'),
(163, 'INV1109150006', '', 'KPR3108150154', '3', '58000', '30', '121800'),
(164, 'INV1109150006', '', 'KPR3108150155', '3', '51000', '30', '107100'),
(165, 'INV1109150006', '', 'KPR2808150138', '17', '55000', '30', '654500'),
(166, 'INV1109150006', '', 'KPR2808150139', '18', '61000', '30', '768600'),
(167, 'INV1109150006', '', 'KPR2808150140', '20', '53000', '30', '742000'),
(168, 'INV1109150006', '', 'KPR2808150141', '8', '63000', '30', '352800'),
(169, 'INV1109150006', '', 'KPR2808150143', '4', '57000', '30', '159600'),
(170, 'INV1109150006', '', 'KPR2808150132', '17', '42000', '30', '499800'),
(171, 'INV1109150006', '', 'KPR2808150133', '18', '42000', '30', '529200'),
(172, 'INV1109150006', '', 'KPR2808150134', '19', '41000', '30', '545300'),
(173, 'INV1109150006', '', 'KPR2808150135', '8', '41000', '30', '229600'),
(174, 'INV1109150006', '', 'KPR2808150136', '9', '41000', '30', '258300'),
(175, 'INV1109150006', '', 'KPR2808150137', '3', '47000', '30', '98700'),
(176, 'INV1109150006', '', 'KPR3108150156', '8', '49000', '30', '274400'),
(177, 'INV1109150006', '', 'KPR3108150157', '10', '53000', '30', '371000'),
(178, 'INV1109150006', '', 'KPR3108150158', '5', '58000', '30', '203000'),
(179, 'INV1109150006', '', 'KPR2808150142', '8', '61000', '30', '341600'),
(180, 'INV1109150007', '', 'KPR1109150204', '81', '55000', '0', '4455000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelianretur`
--

DROP TABLE IF EXISTS `pos_pembelianretur`;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_pembelianreturdetail`
--

DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE IF NOT EXISTS `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualan`
--

DROP TABLE IF EXISTS `pos_penjualan`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `nofaktur`, `nopo`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'FAK1109150001', '', '2015-09-11', '114', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(2, 'FAK1109150002', '', '2015-09-11', '145', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(3, 'FAK1109150003', '', '2015-09-11', '146', 'Tunai', '1174900', '0', '1174900', '1174900', '0', '0', '', 'admin'),
(4, 'FAK1109150004', '', '2015-09-11', '169', 'Tunai', '1241900', '0', '1241900', '1241900', '0', '0', '', 'admin'),
(5, 'FAK2109150005', '', '2015-09-21', '124', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(6, 'FAK2109150006', '', '2015-09-21', '125', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(7, 'FAK2109150007', '', '2015-09-21', '115', 'Tunai', '1217450', '0', '1217450', '1217450', '0', '0', '', 'admin'),
(8, 'FAK2109150008', '', '2015-09-21', '115', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(9, 'FAK2109150009', '', '2015-09-21', '121', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(10, 'FAK2109150010', '', '2015-09-21', '120', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(11, 'FAK2109150011', '', '2015-09-21', '117', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(12, 'FAK2109150012', '', '2015-09-21', '123', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(13, 'FAK2809150001', '', '2015-09-28', '118', 'Tunai', '1129850', '0', '1129850', '1129850', '0', '0', '', 'admin'),
(14, 'FAK2809150002', '', '2015-09-28', '119', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(15, 'FAK2809150003', '', '2015-09-28', '127', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(16, 'FAK0810150001', '', '2015-10-08', '122', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(17, 'FAK0810150002', '', '2015-10-08', '126', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(18, 'FAK0810150003', '', '2015-10-08', '112', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(19, 'FAK0810150004', '', '2015-10-08', '113', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(20, 'FAK0810150005', '', '2015-10-08', '116', 'Tunai', '1253150', '0', '1253150', '1253150', '0', '0', '', 'admin'),
(21, 'FAK0810150006', '', '2015-10-08', '144', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(22, 'FAK0810150007', '', '2015-10-08', '141', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(23, 'FAK0810150008', '', '2015-10-08', '135', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(24, 'FAK0810150009', '', '2015-10-08', '142', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(25, 'FAK0810150010', '', '2015-10-08', '134', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(26, 'FAK0910150001', '', '2015-10-09', '133', 'Tunai', '1207850', '0', '1207850', '1207850', '0', '0', '', 'admin'),
(27, 'FAK0910150002', '', '2015-10-09', '138', 'Tunai', '995450', '0', '995450', '995450', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanbiaya`
--

DROP TABLE IF EXISTS `pos_penjualanbiaya`;
CREATE TABLE IF NOT EXISTS `pos_penjualanbiaya` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanbiayadetail`
--

DROP TABLE IF EXISTS `pos_penjualanbiayadetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualanbiayadetail` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualandetail`
--

DROP TABLE IF EXISTS `pos_penjualandetail`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=529 ;

--
-- Dumping data for table `pos_penjualandetail`
--

INSERT INTO `pos_penjualandetail` (`id`, `nofaktur`, `nopo`, `jenis`, `kodebarang`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FAK1109150001', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(2, 'FAK1109150001', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(3, 'FAK1109150001', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(4, 'FAK1109150001', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(5, 'FAK1109150001', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(6, 'FAK1109150001', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(7, 'FAK1109150001', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(8, 'FAK1109150001', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(9, 'FAK1109150001', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(10, 'FAK1109150001', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(11, 'FAK1109150001', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(12, 'FAK1109150001', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(13, 'FAK1109150001', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(14, 'FAK1109150001', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(15, 'FAK1109150001', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(16, 'FAK1109150001', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(17, 'FAK1109150001', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(18, 'FAK1109150001', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(19, 'FAK1109150001', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(20, 'FAK1109150001', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(21, 'FAK1109150002', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(22, 'FAK1109150002', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(23, 'FAK1109150002', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(24, 'FAK1109150002', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(25, 'FAK1109150002', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(26, 'FAK1109150002', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(27, 'FAK1109150002', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(28, 'FAK1109150002', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(29, 'FAK1109150002', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(30, 'FAK1109150002', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(31, 'FAK1109150002', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(32, 'FAK1109150002', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(33, 'FAK1109150002', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(34, 'FAK1109150002', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(35, 'FAK1109150002', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(36, 'FAK1109150002', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(37, 'FAK1109150002', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(38, 'FAK1109150002', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(39, 'FAK1109150002', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(40, 'FAK1109150003', '', '3', 'KPR2808150066', '1', '105000', '84000', '10', '94500'),
(41, 'FAK1109150003', '', '3', 'KPR2808150077', '1', '86000', '68800', '10', '77400'),
(42, 'FAK1109150003', '', '3', 'KPR2808150093', '1', '145000', '109125', '10', '130500'),
(43, 'FAK1109150003', '', '3', 'KPR2808150099', '1', '64500', '48375', '10', '58050'),
(44, 'FAK1109150003', '', '3', 'KPR2808150115', '1', '99000', '74250', '10', '89100'),
(45, 'FAK1109150003', '', '3', 'KPR2808150109', '1', '40500', '30375', '10', '36450'),
(46, 'FAK1109150003', '', '3', 'KPR2508150032', '1', '84000', '67200', '10', '75600'),
(47, 'FAK1109150003', '', '3', 'KPR2808150056', '1', '87000', '68000', '10', '78300'),
(48, 'FAK1109150003', '', '3', 'KPR2808150044', '1', '87000', '57600', '10', '78300'),
(49, 'FAK1109150003', '', '3', 'KPR1109150194', '1', '43500', '43500', '0', '43500'),
(50, 'FAK1109150003', '', '3', 'KPR1109150200', '1', '48000', '48000', '0', '48000'),
(51, 'FAK1109150003', '', '3', 'KPR1109150184', '1', '33000', '33000', '0', '33000'),
(52, 'FAK1109150003', '', '3', 'KPR1109150185', '1', '31000', '31000', '0', '31000'),
(53, 'FAK1109150003', '', '3', 'KPR2808150140', '1', '53000', '0', '15', '45050'),
(54, 'FAK1109150003', '', '3', 'KPR2808150134', '1', '41000', '0', '15', '34850'),
(55, 'FAK1109150003', '', '3', 'KPR3108150148', '1', '58000', '0', '15', '49300'),
(56, 'FAK1109150003', '', '3', 'KPR2808150122', '1', '70000', '56000', '10', '63000'),
(57, 'FAK1109150003', '', '3', 'KPR2808150128', '1', '60000', '48000', '10', '54000'),
(58, 'FAK1109150003', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(59, 'FAK1109150004', '', '3', 'KPR2808150068', '1', '106000', '84800', '10', '95400'),
(60, 'FAK1109150004', '', '3', 'KPR2808150079', '1', '56000', '44800', '10', '50400'),
(61, 'FAK1109150004', '', '3', 'KPR2808150080', '1', '56000', '44800', '10', '50400'),
(62, 'FAK1109150004', '', '3', 'KPR2808150094', '1', '137000', '102750', '10', '123300'),
(63, 'FAK1109150004', '', '3', 'KPR2808150101', '1', '64500', '48375', '10', '58050'),
(64, 'FAK1109150004', '', '3', 'KPR2808150116', '1', '99000', '74250', '10', '89100'),
(65, 'FAK1109150004', '', '3', 'KPR2808150110', '1', '40500', '30375', '10', '36450'),
(66, 'FAK1109150004', '', '3', 'KPR2508150034', '1', '87000', '69600', '10', '78300'),
(67, 'FAK1109150004', '', '3', 'KPR2808150046', '1', '87000', '57600', '10', '78300'),
(68, 'FAK1109150004', '', '3', 'KPR2808150058', '1', '84000', '68000', '10', '75600'),
(69, 'FAK1109150004', '', '3', 'KPR1109150186', '1', '33000', '33000', '0', '33000'),
(70, 'FAK1109150004', '', '3', 'KPR1109150187', '1', '31000', '31000', '0', '31000'),
(71, 'FAK1109150004', '', '3', 'KPR1109150201', '1', '58500', '58500', '0', '58500'),
(72, 'FAK1109150004', '', '3', 'KPR1109150195', '1', '43500', '43500', '0', '43500'),
(73, 'FAK1109150004', '', '3', 'KPR3108150150', '1', '57000', '39900', '15', '48450'),
(74, 'FAK1109150004', '', '3', 'KPR2808150135', '1', '41000', '28700', '15', '34850'),
(75, 'FAK1109150004', '', '3', 'KPR2808150141', '1', '63000', '44100', '15', '53550'),
(76, 'FAK1109150004', '', '3', 'KPR2808150123', '1', '66000', '52800', '10', '59400'),
(77, 'FAK1109150004', '', '3', 'KPR2808150129', '1', '53000', '42400', '10', '47700'),
(78, 'FAK1109150004', '', '3', 'KPR3108150156', '1', '49000', '34300', '15', '41650'),
(79, 'FAK1109150004', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(80, 'FAK2109150005', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(81, 'FAK2109150005', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(82, 'FAK2109150005', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(83, 'FAK2109150005', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(84, 'FAK2109150005', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(85, 'FAK2109150005', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(86, 'FAK2109150005', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(87, 'FAK2109150005', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(88, 'FAK2109150005', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(89, 'FAK2109150005', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(90, 'FAK2109150005', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(91, 'FAK2109150005', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(92, 'FAK2109150005', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(93, 'FAK2109150005', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(94, 'FAK2109150005', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(95, 'FAK2109150005', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(96, 'FAK2109150005', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(97, 'FAK2109150005', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(98, 'FAK2109150005', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(99, 'FAK2109150005', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(100, 'FAK2109150006', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(101, 'FAK2109150006', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(102, 'FAK2109150006', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(103, 'FAK2109150006', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(104, 'FAK2109150006', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(105, 'FAK2109150006', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(106, 'FAK2109150006', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(107, 'FAK2109150006', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(108, 'FAK2109150006', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(109, 'FAK2109150006', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(110, 'FAK2109150006', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(111, 'FAK2109150006', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(112, 'FAK2109150006', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(113, 'FAK2109150006', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(114, 'FAK2109150006', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(115, 'FAK2109150006', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(116, 'FAK2109150006', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(117, 'FAK2109150006', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(118, 'FAK2109150006', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(119, 'FAK2109150006', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(120, 'FAK2109150007', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(121, 'FAK2109150007', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(122, 'FAK2109150007', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(123, 'FAK2109150007', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(124, 'FAK2109150007', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(125, 'FAK2109150007', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(126, 'FAK2109150007', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(127, 'FAK2109150007', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(128, 'FAK2109150007', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(129, 'FAK2109150007', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(130, 'FAK2109150007', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(131, 'FAK2109150007', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(132, 'FAK2109150007', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(133, 'FAK2109150007', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(134, 'FAK2109150007', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(135, 'FAK2109150007', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(136, 'FAK2109150007', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(137, 'FAK2109150007', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(138, 'FAK2109150007', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(139, 'FAK2109150008', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(140, 'FAK2109150008', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(141, 'FAK2109150008', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(142, 'FAK2109150008', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(143, 'FAK2109150008', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(144, 'FAK2109150008', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(145, 'FAK2109150008', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(146, 'FAK2109150008', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(147, 'FAK2109150008', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(148, 'FAK2109150008', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(149, 'FAK2109150008', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(150, 'FAK2109150008', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(151, 'FAK2109150008', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(152, 'FAK2109150008', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(153, 'FAK2109150008', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(154, 'FAK2109150008', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(155, 'FAK2109150008', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(156, 'FAK2109150008', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(157, 'FAK2109150008', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(158, 'FAK2109150008', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(159, 'FAK2109150009', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(160, 'FAK2109150009', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(161, 'FAK2109150009', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(162, 'FAK2109150009', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(163, 'FAK2109150009', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(164, 'FAK2109150009', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(165, 'FAK2109150009', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(166, 'FAK2109150009', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(167, 'FAK2109150009', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(168, 'FAK2109150009', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(169, 'FAK2109150009', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(170, 'FAK2109150009', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(171, 'FAK2109150009', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(172, 'FAK2109150009', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(173, 'FAK2109150009', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(174, 'FAK2109150009', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(175, 'FAK2109150009', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(176, 'FAK2109150009', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(177, 'FAK2109150009', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(178, 'FAK2109150009', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(179, 'FAK2109150010', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(180, 'FAK2109150010', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(181, 'FAK2109150010', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(182, 'FAK2109150010', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(183, 'FAK2109150010', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(184, 'FAK2109150010', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(185, 'FAK2109150010', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(186, 'FAK2109150010', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(187, 'FAK2109150010', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(188, 'FAK2109150010', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(189, 'FAK2109150010', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(190, 'FAK2109150010', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(191, 'FAK2109150010', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(192, 'FAK2109150010', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(193, 'FAK2109150010', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(194, 'FAK2109150010', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(195, 'FAK2109150010', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(196, 'FAK2109150010', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(197, 'FAK2109150010', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(198, 'FAK2109150010', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(199, 'FAK2109150011', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(200, 'FAK2109150011', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(201, 'FAK2109150011', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(202, 'FAK2109150011', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(203, 'FAK2109150011', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(204, 'FAK2109150011', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(205, 'FAK2109150011', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(206, 'FAK2109150011', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(207, 'FAK2109150011', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(208, 'FAK2109150011', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(209, 'FAK2109150011', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(210, 'FAK2109150011', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(211, 'FAK2109150011', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(212, 'FAK2109150011', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(213, 'FAK2109150011', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(214, 'FAK2109150011', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(215, 'FAK2109150011', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(216, 'FAK2109150011', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(217, 'FAK2109150011', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(218, 'FAK2109150011', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(219, 'FAK2109150012', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(220, 'FAK2109150012', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(221, 'FAK2109150012', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(222, 'FAK2109150012', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(223, 'FAK2109150012', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(224, 'FAK2109150012', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(225, 'FAK2109150012', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(226, 'FAK2109150012', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(227, 'FAK2109150012', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(228, 'FAK2109150012', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(229, 'FAK2109150012', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(230, 'FAK2109150012', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(231, 'FAK2109150012', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(232, 'FAK2109150012', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(233, 'FAK2109150012', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(234, 'FAK2109150012', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(235, 'FAK2109150012', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(236, 'FAK2109150012', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(237, 'FAK2109150012', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(238, 'FAK2109150012', '', '3', 'KPR1109150204', '1', '55000', '0', '0', '55000'),
(239, 'FAK2809150001', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(240, 'FAK2809150001', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(241, 'FAK2809150001', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(242, 'FAK2809150001', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(243, 'FAK2809150001', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(244, 'FAK2809150001', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(245, 'FAK2809150001', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(246, 'FAK2809150001', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(247, 'FAK2809150001', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(248, 'FAK2809150001', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(249, 'FAK2809150001', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(250, 'FAK2809150001', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(251, 'FAK2809150001', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(252, 'FAK2809150001', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(253, 'FAK2809150001', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(254, 'FAK2809150001', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(255, 'FAK2809150001', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(256, 'FAK2809150001', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(257, 'FAK2809150001', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(258, 'FAK2809150002', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(259, 'FAK2809150002', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(260, 'FAK2809150002', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(261, 'FAK2809150002', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(262, 'FAK2809150002', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(263, 'FAK2809150002', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(264, 'FAK2809150002', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(265, 'FAK2809150002', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(266, 'FAK2809150002', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(267, 'FAK2809150002', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(268, 'FAK2809150002', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(269, 'FAK2809150002', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(270, 'FAK2809150002', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(271, 'FAK2809150002', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(272, 'FAK2809150002', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(273, 'FAK2809150002', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(274, 'FAK2809150002', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(275, 'FAK2809150002', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(276, 'FAK2809150002', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(277, 'FAK2809150002', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(278, 'FAK2809150003', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(279, 'FAK2809150003', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(280, 'FAK2809150003', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(281, 'FAK2809150003', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(282, 'FAK2809150003', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(283, 'FAK2809150003', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(284, 'FAK2809150003', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(285, 'FAK2809150003', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(286, 'FAK2809150003', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(287, 'FAK2809150003', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(288, 'FAK2809150003', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(289, 'FAK2809150003', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(290, 'FAK2809150003', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(291, 'FAK2809150003', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(292, 'FAK2809150003', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(293, 'FAK2809150003', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(294, 'FAK2809150003', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(295, 'FAK2809150003', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(296, 'FAK2809150003', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(297, 'FAK2809150003', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(298, 'FAK0810150001', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(299, 'FAK0810150001', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(300, 'FAK0810150001', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(301, 'FAK0810150001', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(302, 'FAK0810150001', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(303, 'FAK0810150001', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(304, 'FAK0810150001', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(305, 'FAK0810150001', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(306, 'FAK0810150001', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(307, 'FAK0810150001', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(308, 'FAK0810150001', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(309, 'FAK0810150001', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(310, 'FAK0810150001', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(311, 'FAK0810150001', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(312, 'FAK0810150001', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(313, 'FAK0810150001', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(314, 'FAK0810150001', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(315, 'FAK0810150001', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(316, 'FAK0810150001', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(317, 'FAK0810150001', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(318, 'FAK0810150002', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(319, 'FAK0810150002', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(320, 'FAK0810150002', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(321, 'FAK0810150002', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(322, 'FAK0810150002', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(323, 'FAK0810150002', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(324, 'FAK0810150002', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(325, 'FAK0810150002', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(326, 'FAK0810150002', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(327, 'FAK0810150002', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(328, 'FAK0810150002', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(329, 'FAK0810150002', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(330, 'FAK0810150002', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(331, 'FAK0810150002', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(332, 'FAK0810150002', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(333, 'FAK0810150002', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(334, 'FAK0810150002', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(335, 'FAK0810150002', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(336, 'FAK0810150002', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(337, 'FAK0810150002', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(338, 'FAK0810150003', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(339, 'FAK0810150003', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(340, 'FAK0810150003', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(341, 'FAK0810150003', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(342, 'FAK0810150003', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(343, 'FAK0810150003', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(344, 'FAK0810150003', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(345, 'FAK0810150003', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(346, 'FAK0810150003', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(347, 'FAK0810150003', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(348, 'FAK0810150003', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(349, 'FAK0810150003', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(350, 'FAK0810150003', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(351, 'FAK0810150003', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(352, 'FAK0810150003', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(353, 'FAK0810150003', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(354, 'FAK0810150003', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(355, 'FAK0810150003', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(356, 'FAK0810150003', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(357, 'FAK0810150003', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(358, 'FAK0810150004', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(359, 'FAK0810150004', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(360, 'FAK0810150004', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(361, 'FAK0810150004', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(362, 'FAK0810150004', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(363, 'FAK0810150004', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(364, 'FAK0810150004', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(365, 'FAK0810150004', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(366, 'FAK0810150004', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(367, 'FAK0810150004', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(368, 'FAK0810150004', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(369, 'FAK0810150004', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(370, 'FAK0810150004', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(371, 'FAK0810150004', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(372, 'FAK0810150004', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(373, 'FAK0810150004', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(374, 'FAK0810150004', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(375, 'FAK0810150004', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(376, 'FAK0810150004', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(377, 'FAK0810150004', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(378, 'FAK0810150005', '', '3', 'KPR2808150062', '1', '90000', '72000', '10', '81000'),
(379, 'FAK0810150005', '', '3', 'KPR2808150073', '1', '78000', '62400', '10', '70200'),
(380, 'FAK0810150005', '', '3', 'KPR2808150091', '1', '137000', '102750', '10', '123300'),
(381, 'FAK0810150005', '', '3', 'KPR2808150097', '1', '95000', '71250', '10', '85500'),
(382, 'FAK0810150005', '', '3', 'KPR2808150113', '1', '99000', '74250', '10', '89100'),
(383, 'FAK0810150005', '', '3', 'KPR2808150107', '1', '40500', '30375', '10', '36450'),
(384, 'FAK0810150005', '', '3', 'KPR1307150028', '1', '84000', '67200', '10', '75600'),
(385, 'FAK0810150005', '', '3', 'KPR2808150040', '1', '84000', '57600', '10', '75600'),
(386, 'FAK0810150005', '', '3', 'KPR2808150052', '1', '87000', '68000', '10', '78300'),
(387, 'FAK0810150005', '', '3', 'KPR1109150192', '1', '39000', '39000', '0', '39000'),
(388, 'FAK0810150005', '', '3', 'KPR1109150198', '1', '46500', '46500', '0', '46500'),
(389, 'FAK0810150005', '', '3', 'KPR1109150180', '1', '34500', '34500', '0', '34500'),
(390, 'FAK0810150005', '', '3', 'KPR1109150181', '1', '25500', '25500', '0', '25500'),
(391, 'FAK0810150005', '', '3', 'KPR2808150132', '1', '42000', '29400', '15', '35700'),
(392, 'FAK0810150005', '', '3', 'KPR3108150144', '1', '63000', '44100', '15', '53550'),
(393, 'FAK0810150005', '', '3', 'KPR2808150138', '1', '55000', '38500', '15', '46750'),
(394, 'FAK0810150005', '', '3', 'KPR2808150120', '1', '70000', '56000', '10', '63000'),
(395, 'FAK0810150005', '', '3', 'KPR2808150126', '1', '60000', '48000', '10', '54000'),
(396, 'FAK0810150005', '', '3', 'KPR2808150119', '1', '94000', '75200', '10', '84600'),
(397, 'FAK0810150005', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(398, 'FAK0810150006', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(399, 'FAK0810150006', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(400, 'FAK0810150006', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(401, 'FAK0810150006', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(402, 'FAK0810150006', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(403, 'FAK0810150006', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(404, 'FAK0810150006', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(405, 'FAK0810150006', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(406, 'FAK0810150006', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(407, 'FAK0810150006', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(408, 'FAK0810150006', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(409, 'FAK0810150006', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(410, 'FAK0810150006', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(411, 'FAK0810150006', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(412, 'FAK0810150006', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(413, 'FAK0810150006', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(414, 'FAK0810150006', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(415, 'FAK0810150006', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(416, 'FAK0810150006', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(417, 'FAK0810150007', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(418, 'FAK0810150007', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(419, 'FAK0810150007', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(420, 'FAK0810150007', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(421, 'FAK0810150007', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(422, 'FAK0810150007', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(423, 'FAK0810150007', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(424, 'FAK0810150007', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(425, 'FAK0810150007', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(426, 'FAK0810150007', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(427, 'FAK0810150007', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(428, 'FAK0810150007', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(429, 'FAK0810150007', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(430, 'FAK0810150007', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(431, 'FAK0810150007', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(432, 'FAK0810150007', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(433, 'FAK0810150007', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(434, 'FAK0810150007', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(435, 'FAK0810150007', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(436, 'FAK0810150008', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(437, 'FAK0810150008', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(438, 'FAK0810150008', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(439, 'FAK0810150008', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(440, 'FAK0810150008', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(441, 'FAK0810150008', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(442, 'FAK0810150008', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(443, 'FAK0810150008', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(444, 'FAK0810150008', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(445, 'FAK0810150008', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(446, 'FAK0810150008', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(447, 'FAK0810150008', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(448, 'FAK0810150008', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(449, 'FAK0810150008', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(450, 'FAK0810150008', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(451, 'FAK0810150008', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(452, 'FAK0810150008', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(453, 'FAK0810150008', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(454, 'FAK0810150008', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(455, 'FAK0810150009', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(456, 'FAK0810150009', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(457, 'FAK0810150009', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(458, 'FAK0810150009', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(459, 'FAK0810150009', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(460, 'FAK0810150009', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(461, 'FAK0810150009', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(462, 'FAK0810150009', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(463, 'FAK0810150009', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(464, 'FAK0810150009', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(465, 'FAK0810150009', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(466, 'FAK0810150009', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(467, 'FAK0810150009', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(468, 'FAK0810150009', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(469, 'FAK0810150009', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(470, 'FAK0810150009', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(471, 'FAK0810150009', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(472, 'FAK0810150009', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(473, 'FAK0810150009', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(474, 'FAK0810150010', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(475, 'FAK0810150010', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(476, 'FAK0810150010', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(477, 'FAK0810150010', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(478, 'FAK0810150010', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(479, 'FAK0810150010', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(480, 'FAK0810150010', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(481, 'FAK0810150010', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(482, 'FAK0810150010', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(483, 'FAK0810150010', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(484, 'FAK0810150010', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(485, 'FAK0810150010', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(486, 'FAK0810150010', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(487, 'FAK0810150010', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(488, 'FAK0810150010', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(489, 'FAK0810150010', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(490, 'FAK0810150010', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(491, 'FAK0810150010', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(492, 'FAK0810150010', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(493, 'FAK0910150001', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(494, 'FAK0910150001', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(495, 'FAK0910150001', '', '3', 'KPR2808150092', '1', '137000', '102750', '10', '123300'),
(496, 'FAK0910150001', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(497, 'FAK0910150001', '', '3', 'KPR2808150114', '1', '99000', '74250', '10', '89100'),
(498, 'FAK0910150001', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(499, 'FAK0910150001', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(500, 'FAK0910150001', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(501, 'FAK0910150001', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(502, 'FAK0910150001', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(503, 'FAK0910150001', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(504, 'FAK0910150001', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(505, 'FAK0910150001', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(506, 'FAK0910150001', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(507, 'FAK0910150001', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(508, 'FAK0910150001', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(509, 'FAK0910150001', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(510, 'FAK0910150001', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(511, 'FAK0910150001', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000'),
(512, 'FAK0910150002', '', '3', 'KPR2808150064', '1', '100000', '80000', '10', '90000'),
(513, 'FAK0910150002', '', '3', 'KPR2808150075', '1', '83000', '66400', '10', '74700'),
(514, 'FAK0910150002', '', '3', 'KPR2808150098', '1', '95000', '71250', '10', '85500'),
(515, 'FAK0910150002', '', '3', 'KPR2808150108', '1', '40500', '30375', '10', '36450'),
(516, 'FAK0910150002', '', '3', 'KPR1307150030', '1', '84000', '67200', '10', '75600'),
(517, 'FAK0910150002', '', '3', 'KPR2808150042', '1', '87000', '57600', '10', '78300'),
(518, 'FAK0910150002', '', '3', 'KPR2808150054', '1', '87000', '68000', '10', '78300'),
(519, 'FAK0910150002', '', '3', 'KPR1109150193', '1', '45000', '45000', '0', '45000'),
(520, 'FAK0910150002', '', '3', 'KPR1109150199', '1', '55000', '55000', '0', '55000'),
(521, 'FAK0910150002', '', '3', 'KPR1109150182', '1', '32500', '32500', '0', '32500'),
(522, 'FAK0910150002', '', '3', 'KPR1109150183', '1', '31000', '31000', '0', '31000'),
(523, 'FAK0910150002', '', '3', 'KPR2808150133', '1', '42000', '29400', '15', '35700'),
(524, 'FAK0910150002', '', '3', 'KPR3108150146', '1', '63000', '44100', '15', '53550'),
(525, 'FAK0910150002', '', '3', 'KPR2808150139', '1', '61000', '42700', '15', '51850'),
(526, 'FAK0910150002', '', '3', 'KPR2808150121', '1', '70000', '56000', '10', '63000'),
(527, 'FAK0910150002', '', '3', 'KPR2808150127', '1', '60000', '48000', '10', '54000'),
(528, 'FAK0910150002', '', '3', 'KPR1109150204', '1', '55000', '55000', '0', '55000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanjasa`
--

DROP TABLE IF EXISTS `pos_penjualanjasa`;
CREATE TABLE IF NOT EXISTS `pos_penjualanjasa` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanjasadetail`
--

DROP TABLE IF EXISTS `pos_penjualanjasadetail`;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanretur`
--

DROP TABLE IF EXISTS `pos_penjualanretur`;
CREATE TABLE IF NOT EXISTS `pos_penjualanretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pos_penjualanretur`
--

INSERT INTO `pos_penjualanretur` (`id`, `noretur`, `nofaktur`, `tgl`, `kodecustomer`, `carabayar`, `total`, `user`) VALUES
(1, 'RTJ2109150001', 'FAK2109150007', '2015-09-21', '115', 'Tunai', '1337000', 'admin'),
(2, 'RTJ2109150002', 'FAK2109150009', '2015-09-21', '121', 'Tunai', '1379000', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pos_penjualanreturdetail`
--

DROP TABLE IF EXISTS `pos_penjualanreturdetail`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `pos_penjualanreturdetail`
--

INSERT INTO `pos_penjualanreturdetail` (`id`, `noretur`, `nofaktur`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150062', '1', '90000', '10', '90000'),
(2, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150073', '1', '78000', '10', '78000'),
(3, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150091', '1', '137000', '10', '137000'),
(4, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150097', '1', '95000', '10', '95000'),
(5, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150113', '1', '99000', '10', '99000'),
(6, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150107', '1', '40500', '10', '40500'),
(7, 'RTJ2109150001', 'FAK2109150007', 'KPR1307150028', '1', '84000', '10', '84000'),
(8, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150040', '1', '84000', '10', '84000'),
(9, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150052', '1', '87000', '10', '87000'),
(10, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150192', '1', '39000', '0', '39000'),
(11, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150198', '1', '46500', '0', '46500'),
(12, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150180', '1', '34500', '0', '34500'),
(13, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150181', '1', '25500', '0', '25500'),
(14, 'RTJ2109150001', 'FAK2109150007', 'KPR3108150144', '1', '63000', '15', '63000'),
(15, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150138', '1', '55000', '15', '55000'),
(16, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150120', '1', '70000', '10', '70000'),
(17, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150126', '1', '60000', '10', '60000'),
(18, 'RTJ2109150001', 'FAK2109150007', 'KPR1109150204', '1', '55000', '0', '55000'),
(19, 'RTJ2109150001', 'FAK2109150007', 'KPR2808150119', '1', '94000', '10', '94000'),
(20, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150062', '1', '90000', '10', '90000'),
(21, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150073', '1', '78000', '10', '78000'),
(22, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150091', '1', '137000', '10', '137000'),
(23, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150097', '1', '95000', '10', '95000'),
(24, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150113', '1', '99000', '10', '99000'),
(25, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150107', '1', '40500', '10', '40500'),
(26, 'RTJ2109150002', 'FAK2109150009', 'KPR1307150028', '1', '84000', '10', '84000'),
(27, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150040', '1', '84000', '10', '84000'),
(28, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150052', '1', '87000', '10', '87000'),
(29, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150192', '1', '39000', '0', '39000'),
(30, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150198', '1', '46500', '0', '46500'),
(31, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150180', '1', '34500', '0', '34500'),
(32, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150181', '1', '25500', '0', '25500'),
(33, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150132', '1', '42000', '15', '42000'),
(34, 'RTJ2109150002', 'FAK2109150009', 'KPR3108150144', '1', '63000', '15', '63000'),
(35, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150138', '1', '55000', '15', '55000'),
(36, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150120', '1', '70000', '10', '70000'),
(37, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150126', '1', '60000', '10', '60000'),
(38, 'RTJ2109150002', 'FAK2109150009', 'KPR2808150119', '1', '94000', '10', '94000'),
(39, 'RTJ2109150002', 'FAK2109150009', 'KPR1109150204', '1', '55000', '0', '55000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_po`
--

DROP TABLE IF EXISTS `pos_po`;
CREATE TABLE IF NOT EXISTS `pos_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_podetail`
--

DROP TABLE IF EXISTS `pos_podetail`;
CREATE TABLE IF NOT EXISTS `pos_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_produk`
--

DROP TABLE IF EXISTS `pos_produk`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=205 ;

--
-- Dumping data for table `pos_produk`
--

INSERT INTO `pos_produk` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `jumlah`, `hargabeli`, `hargajual`) VALUES
(30, 3, 4, 'KPR1307150030', 'MPH ENG-TB 2A', '9', '84000', '84000'),
(140, 3, 4, 'KPR2808150140', 'IPS 3', '20', '53000', '53000'),
(28, 3, 4, 'KPR1307150028', 'MPH ENG TB 1A', '11', '84000', '84000'),
(29, 3, 4, 'KPR1307150029', 'MPH ENG TB 1B', '17', '84000', '84000'),
(31, 3, 4, 'KPR2508150031', 'MPH Eng  TB 2B', '18', '84000', '84000'),
(32, 3, 4, 'KPR2508150032', 'MPH ENG TB 3A', '19', '84000', '84000'),
(33, 3, 4, 'KPR2508150033', 'MPH Eng TB 3B', '19', '84000', '84000'),
(34, 3, 4, 'KPR2508150034', 'MPH ENG TB 4A', '7', '87000', '87000'),
(35, 3, 4, 'KPR2508150035', 'MPH ENG TB 4B', '8', '87000', '87000'),
(36, 3, 4, 'KPR2808150036', 'MPH  ENG TB 5A', '9', '87000', '87000'),
(37, 3, 4, 'KPR2808150037', 'MPH ENG TB 5B', '9', '87000', '87000'),
(38, 3, 4, 'KPR2808150038', 'MPH ENG TB 6A', '2', '87000', '87000'),
(39, 3, 4, 'KPR2808150039', 'MPH ENG TB 6B', '2', '87000', '87000'),
(40, 3, 4, 'KPR2808150040', 'MPH ENG WB 1A', '2', '72000', '84000'),
(41, 3, 4, 'KPR2808150041', 'MPH ENG WB 1B', '17', '72000', '87000'),
(42, 3, 4, 'KPR2808150042', 'MPH ENG WB 2A', '10', '72000', '87000'),
(43, 3, 4, 'KPR2808150043', 'MPH ENG WB 2B', '18', '72000', '87000'),
(44, 3, 4, 'KPR2808150044', 'MPH ENG WB 3A', '19', '87000', '87000'),
(45, 3, 4, 'KPR2808150045', 'MPH ENG WB 3B', '19', '72000', '87000'),
(46, 3, 4, 'KPR2808150046', 'MPH ENG WB 4A', '7', '72000', '87000'),
(47, 3, 4, 'KPR2808150047', 'MPH ENG WB 4B', '8', '72000', '87000'),
(48, 3, 4, 'KPR2808150048', 'MPH ENG WB 5A', '9', '72000', '87000'),
(49, 3, 4, 'KPR2808150049', 'MPH ENG WB 5B', '9', '72000', '87000'),
(50, 3, 4, 'KPR2808150050', 'MPH ENG WB 6A', '2', '72000', '87000'),
(51, 3, 4, 'KPR2808150051', 'MPH ENG WB 6B', '2', '72000', '87000'),
(52, 3, 4, 'KPR2808150052', 'MPH ENG HW 1A', '2', '85000', '87000'),
(53, 3, 4, 'KPR2808150053', 'MPH ENG HW 1B', '17', '85000', '87000'),
(54, 3, 4, 'KPR2808150054', 'MPH ENG HW 2A', '10', '85000', '87000'),
(55, 3, 4, 'KPR2808150055', 'MPH ENG HW 2B', '18', '85000', '87000'),
(56, 3, 4, 'KPR2808150056', 'MPH ENG hW 3A', '19', '87000', '87000'),
(57, 3, 4, 'KPR2808150057', 'MPH ENG HW 3B', '19', '85000', '84000'),
(58, 3, 4, 'KPR2808150058', 'MPH ENG HW 4A', '7', '85000', '84000'),
(59, 3, 4, 'KPR2808150059', 'MPH ENG HW 4B', '8', '85000', '84000'),
(60, 3, 4, 'KPR2808150060', 'MPH  ENG HW 5A', '9', '85000', '84000'),
(61, 3, 4, 'KPR2808150061', 'MPH ENG HW 5B', '9', '85000', '84000'),
(62, 3, 4, 'KPR2808150062', 'SHAPING MATHS TB 1A', '1', '90000', '90000'),
(63, 3, 4, 'KPR2808150063', 'SHAPING MATHS TB 1B', '17', '90000', '90000'),
(64, 3, 4, 'KPR2808150064', 'SHAPING MATHS TB 2A', '10', '100000', '100000'),
(65, 3, 4, 'KPR2808150065', 'SHAPING MATHS TB 2B', '18', '105000', '105000'),
(66, 3, 4, 'KPR2808150066', 'SHAPING MATHS TB 3A', '19', '105000', '105000'),
(67, 3, 4, 'KPR2808150067', 'SHAPING MATHS TB 3B', '19', '105000', '105000'),
(68, 3, 4, 'KPR2808150068', 'SHAPING MATHS TB 4A (2ND EDT)', '7', '106000', '106000'),
(69, 3, 4, 'KPR2808150069', 'SHAPING MATHS TB 4B (2ND EDT)', '8', '106000', '106000'),
(70, 3, 4, 'KPR2808150070', 'SHAPING MATHS TB 5A (2ND EDT)', '9', '106000', '106000'),
(71, 3, 4, 'KPR2808150071', 'SHAPING MATHS TB 5B (2ND EDT)', '9', '106000', '106000'),
(72, 3, 4, 'KPR2808150072', 'SHAPING MATHS TB 6A (2ND EDT)', '2', '106000', '106000'),
(73, 3, 4, 'KPR2808150073', 'SHAPING MATHS ACT BOOK 1A (3RD EDT)', '2', '78000', '78000'),
(74, 3, 4, 'KPR2808150074', 'SHAPING MATHS ACT BOOK 1B (3RD EDT)', '17', '78000', '78000'),
(75, 3, 4, 'KPR2808150075', 'SHAPING MATHS ACT BOOK 2A (3RD EDT)', '10', '83000', '83000'),
(76, 3, 4, 'KPR2808150076', 'SHAPING MATHS ACT BOOK 2B (3RD EDT)', '18', '86000', '86000'),
(77, 3, 4, 'KPR2808150077', 'SHAPING MATHS ACT BOOK 3A (3RD EDT)', '19', '86000', '86000'),
(78, 3, 4, 'KPR2808150078', 'SHAPING MATHS ACT BOOK 3B (3RD EDT)', '19', '86000', '86000'),
(79, 3, 4, 'KPR2808150079', 'SHAPING MATHS ACT BOOK 4A PART 1 (2ND Edt)', '7', '56000', '56000'),
(80, 3, 4, 'KPR2808150080', 'SHAPING MATHS ACT BOOK 4A PART 2 (2ND Edt)', '7', '56000', '56000'),
(81, 3, 4, 'KPR2808150081', 'SHAPING MATHS ACT BOOK 4B PART 1 (2ND Edt)', '8', '56000', '56000'),
(82, 3, 4, 'KPR2808150082', 'SHAPING MATHS ACT BOOK 4B PART 2 (2ND Edt)', '8', '56000', '56000'),
(83, 3, 4, 'KPR2808150083', 'SHAPING MATHS ACT BOOK 5A PART 1 (2ND Edt)', '9', '56000', '56000'),
(84, 3, 4, 'KPR2808150084', 'SHAPING MATHS ACT BOOK 5A PART 2 (2ND Edt)', '9', '56000', '56000'),
(85, 3, 4, 'KPR2808150085', 'SHAPING MATHS ACT BOOK 5B PART 1 (2ND Edt)', '9', '56000', '56000'),
(86, 3, 4, 'KPR2808150086', 'SHAPING MATHS ACT BOOK 5B PART 2 (2ND Edt)', '9', '56000', '56000'),
(87, 3, 4, 'KPR2808150087', 'SHAPING MATHS ACT BOOK 6A PART 1 (2ND Edt)', '2', '56000', '56000'),
(88, 3, 4, 'KPR2808150088', 'SHAPING MATHS ACT BOOK 6A PART 2 (2ND Edt)', '2', '56000', '56000'),
(89, 3, 4, 'KPR2808150089', 'SHAPING MATHS ACT BOOK 6B PART 1 (2ND Edt)', '2', '56000', '56000'),
(90, 3, 4, 'KPR2808150090', 'SHAPING MATHS ACT BOOK 6B PART 2 (2ND Edt)', '3', '56000', '56000'),
(91, 3, 4, 'KPR2808150091', 'I-SCIENCE TB 1 (REVISI COVER)', '3', '137000', '137000'),
(92, 3, 4, 'KPR2808150092', 'I-SCIENCE TB 2 (REVISI COVER)', '9', '137000', '137000'),
(93, 3, 4, 'KPR2808150093', 'I-SCIENCE TB 3 (REVISI COVER)', '19', '145000', '145000'),
(94, 3, 4, 'KPR2808150094', 'I-SCIENCE TB 4 (REVISI COVER)', '7', '137000', '137000'),
(95, 3, 4, 'KPR2808150095', 'I-SCIENCE TB 5 (REVISI COVER)', '9', '137000', '137000'),
(96, 3, 4, 'KPR2808150096', 'I-SCIENCE TB 6 (REVISI COVER)', '2', '116000', '116000'),
(97, 3, 4, 'KPR2808150097', 'I-SCIENCE ACT BOOK 1 (REVISI COVER)', '2', '95000', '95000'),
(98, 3, 4, 'KPR2808150098', 'I-SCIENCE ACT BOOK 2 (REVISI COVER)', '10', '95000', '95000'),
(99, 3, 4, 'KPR2808150099', 'I-SCIENCE ACT BOOK 3A (REVISI COVER)', '19', '64500', '64500'),
(100, 3, 4, 'KPR2808150100', 'I-SCIENCE ACT BOOK 3B (REVISI COVER)', '19', '64500', '64500'),
(101, 3, 4, 'KPR2808150101', 'I-SCIENCE ACT BOOK 4A (REVISI COVER)', '7', '64500', '64500'),
(102, 3, 4, 'KPR2808150102', 'I-SCIENCE ACT BOOK 4B (REVISI COVER)', '8', '64500', '64500'),
(103, 3, 4, 'KPR2808150103', 'I-SCIENCE ACT BOOK 5A ', '9', '64500', '64500'),
(104, 3, 4, 'KPR2808150104', 'I-SCIENCE ACT BOOK 5B', '9', '64500', '64500'),
(105, 3, 4, 'KPR2808150105', 'I-SCIENCE ACT BOOK 6A (REVISI COVER)', '2', '64500', '64500'),
(106, 3, 4, 'KPR2808150106', 'I-SCIENCE ACT BOOK 6B (REVISI COVER)', '2', '64500', '694500'),
(107, 3, 4, 'KPR2808150107', 'HANYU 1 (TB+WB)', '2', '40500', '40500'),
(108, 3, 4, 'KPR2808150108', 'HANYU 2 (TB+WB)', '10', '40500', '40500'),
(109, 3, 4, 'KPR2808150109', 'HANYU 3 (TB+WB)', '19', '40500', '40500'),
(110, 3, 4, 'KPR2808150110', 'HANYU 4 (TB+WB)', '7', '40500', '40500'),
(111, 3, 4, 'KPR2808150111', 'HANYU 5 (TB+WB)', '10', '40500', '40500'),
(112, 3, 4, 'KPR2808150112', 'HANYU 6 (TB+WB)', '2', '40500', '40500'),
(113, 3, 4, 'KPR2808150113', 'NEW CIVIC MORAL EDUCATION CHINESE P1', '2', '99000', '99000'),
(114, 3, 4, 'KPR2808150114', 'NEW CIVIC MORAL EDUCATION CHINESE P2', '11', '99000', '99000'),
(115, 3, 4, 'KPR2808150115', 'NEW CIVIC MORAL EDUCATION CHINESE P3', '19', '99000', '99000'),
(116, 3, 4, 'KPR2808150116', 'NEW CIVIC MORAL EDUCATION CHINESE P4', '2', '99000', '99000'),
(117, 3, 4, 'KPR2808150117', 'NEW CIVIC MORAL EDUCATION CHINESE P5', '10', '99000', '99000'),
(118, 3, 4, 'KPR2808150118', 'NEW CIVIC MORAL EDUCATION CHINESE P6', '2', '99000', '99000'),
(119, 3, 4, 'KPR2808150119', 'DI ZI QUI', '0', '94000', '94000'),
(120, 3, 4, 'KPR2808150120', 'MPH HE TB 1', '1', '70000', '70000'),
(121, 3, 4, 'KPR2808150121', 'MPH HE TB 2', '10', '70000', '70000'),
(122, 3, 4, 'KPR2808150122', 'MPH HE TB 3', '19', '70000', '70000'),
(123, 3, 4, 'KPR2808150123', 'MPH HE TB 4', '7', '66000', '66000'),
(124, 3, 4, 'KPR2808150124', 'MPH HE TB 5', '10', '66000', '66000'),
(125, 3, 4, 'KPR2808150125', 'MPH HE TB 6', '4', '66000', '66000'),
(126, 3, 4, 'KPR2808150126', 'MPH HE ACT BOOK 1', '1', '60000', '60000'),
(127, 3, 4, 'KPR2808150127', 'MPH HE ACT BOOK 2', '10', '60000', '60000'),
(128, 3, 4, 'KPR2808150128', 'MPH HE ACT BOOK 3', '19', '60000', '60000'),
(129, 3, 4, 'KPR2808150129', 'MPH HE ACT BOOK 4', '7', '53000', '53000'),
(130, 3, 4, 'KPR2808150130', 'MPH HE ACT BOOK 5', '10', '53000', '53000'),
(131, 3, 4, 'KPR2808150131', 'MPH HE ACT BOOK 6', '4', '53000', '53000'),
(132, 3, 4, 'KPR2808150132', 'PKN 1', '2', '42000', '42000'),
(133, 3, 4, 'KPR2808150133', 'PKN 2', '10', '42000', '42000'),
(134, 3, 4, 'KPR2808150134', 'PKN 3', '19', '41000', '41000'),
(135, 3, 4, 'KPR2808150135', 'PKN 4', '7', '41000', '41000'),
(136, 3, 4, 'KPR2808150136', 'PKN 5', '9', '41000', ''),
(137, 3, 4, 'KPR2808150137', 'PKN 6', '3', '47000', ''),
(138, 3, 4, 'KPR2808150138', 'IPS 1', '2', '55000', '55000'),
(139, 3, 4, 'KPR2808150139', 'IPS 2', '10', '61000', '61000'),
(141, 3, 4, 'KPR2808150141', 'IPS 4', '7', '63000', '63000'),
(142, 3, 4, 'KPR2808150142', 'IPS 5', '8', '61000', ''),
(143, 3, 4, 'KPR2808150143', 'IPS 6', '4', '57000', ''),
(144, 3, 4, 'KPR3108150144', 'BHS INDONESIA 1A', '2', '63000', '63000'),
(145, 3, 4, 'KPR3108150145', 'BHS INDONESIA 1B', '17', '58000', ''),
(146, 3, 4, 'KPR3108150146', 'BHS INDONESIA 2A', '10', '63000', '63000'),
(147, 3, 4, 'KPR3108150147', 'BHS INDONESIA 2B', '18', '58000', ''),
(148, 3, 4, 'KPR3108150148', 'BHS INDONESIA 3A', '19', '58000', '58000'),
(149, 3, 4, 'KPR3108150149', 'BHS INDONESIA 3B', '19', '51000', ''),
(150, 3, 4, 'KPR3108150150', 'BHS INDONESIA 4A', '7', '57000', '57000'),
(151, 3, 4, 'KPR3108150151', 'BHS INDONESIA 4B', '8', '51000', ''),
(152, 3, 4, 'KPR3108150152', 'BHS INDONESIA 5A', '9', '58000', ''),
(153, 3, 4, 'KPR3108150153', 'BHS INDONESIA 5B', '9', '51000', ''),
(154, 3, 4, 'KPR3108150154', 'BHS INDONESIA 6A', '3', '58000', ''),
(155, 3, 4, 'KPR3108150155', 'BHS INDONESIA 6B', '3', '51000', ''),
(156, 3, 4, 'KPR3108150156', 'WASIS BASA JAWA 4', '7', '49000', '49000'),
(157, 3, 4, 'KPR3108150157', 'WASIS BASA JAWA 5', '10', '53000', ''),
(158, 3, 4, 'KPR3108150158', 'WASIS BASA JAWA 6', '5', '58000', ''),
(159, 3, 5, 'KPR3108150159', 'CAMBRIDGE  CHECKPOINT ENG TB 7', '0', '288000', '288000'),
(160, 3, 5, 'KPR3108150160', 'CAMBRIDGE  CHECKPOINT ENG TB 8', '0', '288000', '288000'),
(161, 3, 5, 'KPR3108150161', 'CAMBRIDGE  CHECKPOINT ENG WB 7', '0', '', ''),
(162, 3, 5, 'KPR3108150162', 'CAMBRIDGE  CHECKPOINT ENG WB 8', '0', '', ''),
(163, 3, 5, 'KPR3108150163', 'CAMBRIDGE  CHECKPOINT SCIENCE TB 7', '0', '', ''),
(164, 3, 5, 'KPR3108150164', 'CAMBRIDGE  CHECKPOINT SCIENCE TB 8', '0', '', ''),
(165, 3, 5, 'KPR3108150165', 'CAMBRIDGE  CHECKPOINT SCIENCE WB 7', '0', '', ''),
(166, 3, 5, 'KPR3108150166', 'CAMBRIDGE  CHECKPOINT SCIENCE WB 8', '0', '', ''),
(167, 3, 5, 'KPR3108150167', 'NEW SYLLABUS  MATHS TB 1', '0', '315000', '315000'),
(168, 3, 5, 'KPR3108150168', 'NEW SYLLABUS  MATHS TB 2', '0', '315000', '315000'),
(169, 3, 5, 'KPR3108150169', 'NEW SYLLABUS  MATHS WB 1 (7 EDT)', '0', '147000', '147000'),
(170, 3, 5, 'KPR3108150170', 'NEW SYLLABUS  MATHS WB 2  (7 EDT)', '0', '147000', '147000'),
(171, 3, 5, 'KPR3108150171', 'EARTH OUR HOME TB 1 (2ND edt)', '0', '178000', '178000'),
(172, 3, 5, 'KPR3108150172', 'EARTH OUR HOME TB 2 (2ND edt)', '0', '178000', '178000'),
(173, 3, 5, 'KPR3108150173', 'EARTH OUR HOME WB 1 NA (2ND edt)', '0', '112000', '112000'),
(174, 3, 5, 'KPR3108150174', 'EARTH OUR HOME WB 2 NA (2ND edt)', '0', '107000', '107000'),
(175, 3, 5, 'KPR3108150175', 'HANYU 7 (TB+WB)', '0', '47000', '47000'),
(176, 3, 5, 'KPR3108150176', 'HANYU 8 (TB+WB)', '0', '47000', '47000'),
(177, 3, 4, 'KPR0409150177', 'MPH ENG HW 6A', '2', '85000', '0'),
(178, 3, 4, 'KPR0409150178', 'MPH ENG HW 6B', '2', '85000', '0'),
(179, 3, 4, 'KPR0409150179', 'SHAPING MATHS TB 6B', '2', '106000', '0'),
(180, 3, 4, 'KPR1109150180', 'SuperKids TB1', '1', '34500', '34500'),
(181, 3, 4, 'KPR1109150181', 'SuperKids WB1', '1', '25500', '25500'),
(182, 3, 4, 'KPR1109150182', 'SuperKids TB2', '10', '32500', '32500'),
(183, 3, 4, 'KPR1109150183', 'SuperKids WB2', '10', '31000', '31000'),
(184, 3, 4, 'KPR1109150184', 'SuperKids TB3', '19', '33000', '33000'),
(185, 3, 4, 'KPR1109150185', 'SuperKids WB3', '19', '31000', '31000'),
(186, 3, 4, 'KPR1109150186', 'SuperKids TB4', '7', '33000', '33000'),
(187, 3, 4, 'KPR1109150187', 'SuperKids WB4', '7', '31000', '31000'),
(188, 3, 4, 'KPR1109150188', 'SuperKids TB5', '10', '33000', '33000'),
(189, 3, 4, 'KPR1109150189', 'SuperKids WB5', '10', '31000', '31000'),
(190, 3, 4, 'KPR1109150190', 'SuperKids TB6', '5', '33000', '33000'),
(191, 3, 4, 'KPR1109150191', 'SuperKids WB6', '5', '31000', '31000'),
(192, 3, 4, 'KPR1109150192', 'Phonis spelling 1A', '1', '39000', '39000'),
(193, 3, 4, 'KPR1109150193', 'Phonis spelling 2A', '10', '45000', '45000'),
(194, 3, 4, 'KPR1109150194', 'Phonis spelling 3A', '19', '43500', '43500'),
(195, 3, 4, 'KPR1109150195', 'Phonis spelling 4A', '7', '43500', '43500'),
(196, 3, 4, 'KPR1109150196', 'Phonis spelling 5A', '10', '37500', '37500'),
(197, 3, 4, 'KPR1109150197', 'Phonis spelling 6A', '5', '50000', '50000'),
(198, 3, 4, 'KPR1109150198', 'Reading 1', '1', '46500', '46500'),
(199, 3, 4, 'KPR1109150199', 'Reading 2', '10', '55000', '55000'),
(200, 3, 4, 'KPR1109150200', 'Reading 3', '19', '48000', '48000'),
(201, 3, 4, 'KPR1109150201', 'Reading 4', '7', '58500', '58500'),
(202, 3, 4, 'KPR1109150202', 'Reading 5', '10', '59500', '59500'),
(203, 3, 4, 'KPR1109150203', 'Reading 6', '5', '59000', '59000'),
(204, 3, 4, 'KPR1109150204', 'MUSIC', '57', '55000', '55000');

-- --------------------------------------------------------

--
-- Table structure for table `pos_produkbiaya`
--

DROP TABLE IF EXISTS `pos_produkbiaya`;
CREATE TABLE IF NOT EXISTS `pos_produkbiaya` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_produkjasa`
--

DROP TABLE IF EXISTS `pos_produkjasa`;
CREATE TABLE IF NOT EXISTS `pos_produkjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pos_situs`
--

DROP TABLE IF EXISTS `pos_situs`;
CREATE TABLE IF NOT EXISTS `pos_situs` (
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
CREATE TABLE IF NOT EXISTS `pos_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `pos_supplier`
--

INSERT INTO `pos_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`, `carabayar`, `termin`) VALUES
(7, 'SUP1307150007', 'NATHA JAYA', 'SBY', '0', 'Tunai', '0'),
(5, 'SUP1307150004', 'PD PURNAMA RAYA', 'PLAZA GRAHA FAMILY BLOK B-28 MIDDLE RING', '031.7344875', 'Tunai', '0'),
(6, 'SUP1307150006', 'ERLANGGA', 'SBY', '0', 'Tunai', '0'),
(8, 'SUP1109150008', 'fotocopy', 'sby', '0', 'Tunai', '0'),
(9, 'SUP1109150009', 'ms Yuli', 'sby', '0', 'Tunai', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pos_useraura`
--

DROP TABLE IF EXISTS `pos_useraura`;
CREATE TABLE IF NOT EXISTS `pos_useraura` (
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
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 1, '2015-12-08 15:22:46', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
