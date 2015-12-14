-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2015 at 03:14 AM
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
-- Table structure for table `keu_anggarantahunan`
--

DROP TABLE IF EXISTS `keu_anggarantahunan`;
CREATE TABLE IF NOT EXISTS `keu_anggarantahunan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(11) NOT NULL,
  `hargasatuan` decimal(14,0) NOT NULL DEFAULT '0',
  `tahunajaran` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilanggaran` (`detilanggaran`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `keu_anggarantahunan`
--

INSERT INTO `keu_anggarantahunan` (`replid`, `detilanggaran`, `hargasatuan`, `tahunajaran`) VALUES
(9, 6, '0', 3),
(10, 6, '3000', 5),
(11, 6, '22000', 12),
(18, 9, '0', 3),
(19, 9, '18000', 5),
(20, 9, '20000', 12),
(21, 10, '0', 3),
(22, 10, '1000', 5),
(23, 10, '2000', 12),
(24, 11, '0', 3),
(25, 11, '6000', 5),
(26, 11, '4500', 12),
(27, 12, '0', 3),
(28, 12, '0', 5),
(29, 12, '2000', 12),
(30, 13, '0', 3),
(31, 13, '0', 5),
(32, 13, '110000', 12),
(33, 14, '4000000', 3),
(34, 14, '400000', 5),
(35, 14, '500000', 12),
(36, 15, '0', 3),
(37, 15, '4500000', 5),
(38, 15, '0', 12),
(39, 16, '0', 3),
(40, 16, '200000', 5),
(41, 16, '0', 12),
(42, 17, '0', 3),
(43, 17, '300000', 5),
(44, 17, '0', 12),
(45, 18, '0', 3),
(46, 18, '15000000', 5),
(47, 18, '0', 12);

-- --------------------------------------------------------

--
-- Table structure for table `keu_brg`
--

DROP TABLE IF EXISTS `keu_brg`;
CREATE TABLE IF NOT EXISTS `keu_brg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompokbrg` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `satuan` varchar(10) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_brg`
--

INSERT INTO `keu_brg` (`replid`, `kelompokbrg`, `kode`, `nama`, `unit`, `satuan`, `tanggal`, `keterangan`) VALUES
(1, 1, 'ELKO001', 'Macbook pro 15 inch', 14, 'unit', '2014-01-11', ''),
(2, 4, 'KEMTR0001', 'Supra X 125', 3, '', '2014-01-11', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_budget`
--

DROP TABLE IF EXISTS `keu_budget`;
CREATE TABLE IF NOT EXISTS `keu_budget` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  `departemen` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_budget`
--

INSERT INTO `keu_budget` (`replid`, `tahunbuku`, `nama`, `nominal`, `keterangan`, `departemen`) VALUES
(1, 1, 'Alat Penganggaran', '10000000', '', 1),
(2, 1, 'anggaran', '2000000', '', 1),
(3, 1, 'Angaran Lagi', '100000', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `keu_buktitransaksi`
--

DROP TABLE IF EXISTS `keu_buktitransaksi`;
CREATE TABLE IF NOT EXISTS `keu_buktitransaksi` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `buktitransaksi` varchar(50) NOT NULL,
  `keterangan` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `keu_buktitransaksi`
--

INSERT INTO `keu_buktitransaksi` (`replid`, `buktitransaksi`, `keterangan`) VALUES
(1, 'MMJ', 'xx xx Jurnal'),
(2, 'BKM', 'Bukti Kas Masuk'),
(3, 'BKK', 'Bukti Kas Keluar'),
(4, 'BBM', 'Bukti Bank Masuk'),
(5, 'BBK', 'Bukti Bank Keluar');

-- --------------------------------------------------------

--
-- Table structure for table `keu_detilrekening`
--

DROP TABLE IF EXISTS `keu_detilrekening`;
CREATE TABLE IF NOT EXISTS `keu_detilrekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=351 ;

--
-- Dumping data for table `keu_detilrekening`
--

INSERT INTO `keu_detilrekening` (`replid`, `kategorirekening`, `kode`, `nama`, `keterangan`) VALUES
(342, 1, '100001', 'Kas Kecil', ''),
(6, 2, '111201', 'BCA ', ''),
(343, 1, '100002', 'Kas Masak', ''),
(18, 3, '111900', 'AYAT SILANG KAS DAN BANK', ''),
(19, 3, '112100', 'TABUNGAN', ''),
(20, 3, '112200', 'DEPOSITO BERJANGKA', ''),
(21, 3, '112300', 'SURAT-SURAT BERHARGA', ''),
(22, 3, '113100', 'PIUTANG USAHA', ''),
(23, 3, '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', ''),
(24, 3, '113300', 'PIUTANG CEK/GIRO MUNDUR', ''),
(25, 3, '113400', 'CADANGAN PIUTANG RAGU-RAGU', ''),
(26, 3, '113500', 'PIUTANG DIREKSI', ''),
(27, 3, '113600', 'PIUTANG KARYAWAN', ''),
(28, 3, '113700', 'PIUTANG PIHAK III', ''),
(29, 3, '113999', 'PIUTANG LAIN-LAIN', ''),
(30, 3, '114100', 'UANG MUKA PEMBELIAN', ''),
(31, 3, '114901', 'TANAH', ''),
(32, 3, '114902', 'KENDARAAN', ''),
(33, 3, '114903', 'MESIN DAN PERALATAN', ''),
(34, 3, '114904', 'BANGUNAN', ''),
(35, 3, '114905', 'INVENTARIS', ''),
(36, 3, '114906', 'UANG MUKA PERJALANAN', ''),
(37, 3, '114999', 'LAIN-LAIN', ''),
(38, 3, '116121', 'PPH PASAL 21', ''),
(39, 3, '116122', 'PPH PASAL 22', ''),
(40, 3, '116123', 'PPH PASAL 23', ''),
(41, 3, '116125', 'PPH PASAL 25', ''),
(42, 3, '116126', 'PPH PASAL 26', ''),
(43, 3, '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', ''),
(44, 3, '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', ''),
(45, 3, '116201', 'ASURANSI', ''),
(46, 3, '116202', 'SEWA', ''),
(47, 3, '116203', 'BUNGA LEASING', ''),
(48, 3, '116204', 'ONGKOS ANGKUT', ''),
(49, 3, '116299', 'LAIN-LAIN', ''),
(50, 3, '121000', 'PENYERTAAN DALAM SURAT BERHARGA', ''),
(51, 3, '122000', 'PENYERTAAN DALAM AKTIVA TETAP', ''),
(52, 3, '123000', 'PENYERTAAN LAIN-LAIN', ''),
(53, 3, '141100', 'TANAH KANTOR', ''),
(54, 3, '141251', 'PRASARANA JALAN', ''),
(55, 3, '141252', 'PRASARANA SALURAN AIR', ''),
(56, 3, '141253', 'PRASARANA TAMAN', ''),
(57, 3, '141301', 'INSTALASI LISTRIK', ''),
(58, 3, '141302', 'INSTALASI AIR', ''),
(59, 3, '141303', 'INSTALASI TELEPON', ''),
(60, 3, '141401', 'MESIN-MESIN', ''),
(61, 3, '141451', 'MESIN-MESIN LEASING', ''),
(62, 3, '141501', 'KENDARAAN', ''),
(63, 3, '141551', 'KENDARAAN LEASING KANTOR', ''),
(64, 3, '141601', 'INVENTARIS', ''),
(65, 3, '145201', 'AKUM. PENY. BANGUNAN KANTOR', ''),
(66, 3, '145202', 'AKUM. PENY. BANGUNAN KANTIN', ''),
(67, 3, '145203', 'AKUM. PENY. BANGUNAN MESS', ''),
(68, 3, '145251', 'AKUM. PENY. PRASARANA JALAN', ''),
(69, 3, '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', ''),
(70, 3, '145253', 'AKUM. PENY. PRASARANA TAMAN', ''),
(71, 3, '145301', 'AKUM. PENY. INSTALASI LISTRIK', ''),
(72, 3, '145302', 'AKUM. PENY. INSTALASI AIR', ''),
(73, 3, '145303', 'AKUM. PENY. INSTALASI TELPON', ''),
(74, 3, '145401', 'AKUM. PENY. KENDARAAN KANTOR', ''),
(75, 3, '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', ''),
(76, 3, '145501', 'AKUM. PENY. INVENTARIS KANTOR', ''),
(77, 3, '145502', 'AKUM. PENY. INVENTARIS KANTIN', ''),
(78, 3, '151000', 'GOODWILL', ''),
(79, 3, '152000', 'HAK PATEN', ''),
(80, 3, '153000', 'LISENSI', ''),
(81, 3, '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', ''),
(82, 3, '161101', 'BIAYA PENDIRIAN', ''),
(83, 3, '161102', 'GAJI, TUNJANGAN', ''),
(84, 3, '161103', 'BIAYA PERJALANAN DINAS', ''),
(85, 3, '161104', 'ALAT TULIS & KEPERLUAN KANTOR', ''),
(86, 3, '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', ''),
(87, 3, '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', ''),
(88, 3, '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', ''),
(89, 3, '161108', 'BENSIN, PARKIR, TOL', ''),
(90, 3, '161109', 'BIAYA ADMINISTRASI BANK', ''),
(91, 3, '161110', 'BAHAN PENOLONG', ''),
(92, 3, '161111', 'BIAYA IKLAN', ''),
(93, 3, '161112', 'PAJAK-PAJAK', ''),
(94, 3, '161113', 'REKENING LISTRIK, AIR', ''),
(95, 3, '161114', 'BIAYA STNK, BBN, DLL', ''),
(96, 3, '161115', 'BUNGA, FEE, PROVISI BANK, DLL', ''),
(97, 3, '161116', 'BIAYA PERESMIAN', ''),
(98, 3, '161117', 'BIAYA BAHAN BAKAR', ''),
(99, 3, '161118', 'REPARASI & PEMELIHARAAN KANTOR', ''),
(100, 3, '161119', 'TRAINING, SEMINAR, TEST, DLL', ''),
(101, 3, '161120', 'BIAYA MAKAN DAN MINUM', ''),
(102, 3, '161121', 'PPH PASAL 21', ''),
(103, 3, '161122', 'PPH PASAL 22', ''),
(104, 3, '161123', 'PPH PASAL 23', ''),
(105, 3, '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', ''),
(106, 3, '161125', 'REPARASI & PEMELIHARAAN MESS', ''),
(107, 3, '161126', 'REPARASI & PEMELIHARAAN TANKI', ''),
(108, 3, '161127', 'BIAYA PENGURUSAN LISTRIK', ''),
(109, 3, '161128', 'REPARASI & PEMELIHARAAN BOTOL', ''),
(110, 3, '161129', 'BIAYA SEWA GEDUNG', ''),
(111, 3, '161130', 'BIAYA BUNGA LEASING', ''),
(112, 3, '161143', 'SELISIH KURS', ''),
(113, 3, '161144', 'BIAYA BUNGA PINJAMAN', ''),
(114, 3, '161145', 'IURAN DAN ASURANSI', ''),
(115, 3, '161146', 'BIAYA KEAMANAN', ''),
(116, 3, '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', ''),
(117, 3, '161151', 'PENDAPATAN JASA GIRO', ''),
(118, 3, '161152', 'PENDAPATAN BUNGA DEPOSITO', ''),
(119, 3, '161153', 'PENDAPATAN BUNGA BANK', ''),
(120, 3, '161154', 'PENDAPATAN BUNGA PIHAK III', ''),
(121, 3, '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', ''),
(122, 3, '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', ''),
(123, 3, '162100', 'UANG JAMINAN LISTRIK', ''),
(124, 3, '162200', 'UANG JAMINAN TELEPON', ''),
(125, 3, '163000', 'BIAYA YANG DITANGGUHKAN', ''),
(126, 3, '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', ''),
(127, 3, '165201', 'BANGUNAN ', ''),
(128, 3, '165301', 'INSTALASI LISTRIK', ''),
(129, 3, '165302', 'INSTALASI AIR', ''),
(130, 3, '165303', 'INSTALASI TELEPON', ''),
(131, 3, '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', ''),
(132, 3, '169000', 'AKTIVA LAIN-LAIN', ''),
(133, 4, '211101', 'BANK', ''),
(134, 4, '211201', 'BANK', ''),
(135, 4, '211501', 'BANK', ''),
(136, 4, '211601', 'BANK', ''),
(137, 4, '212100', 'HUTANG USAHA', ''),
(138, 4, '212200', 'HUTANG YANG BELUM DIFAKTURKAN', ''),
(139, 4, '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', ''),
(140, 4, '212901', 'HUTANG PIHAK KETIGA', ''),
(141, 4, '212902', 'HUTANG PERSEDIAAN', ''),
(142, 4, '212903', 'HUTANG KENDARAAN', ''),
(143, 4, '212904', 'HUTANG BANGUNAN', ''),
(144, 4, '212905', 'HUTANG INVENTARIS', ''),
(145, 4, '212906', 'HUTANG VOUCHER', ''),
(146, 4, '212907', 'HUTANG KPD GKA ELYON', ''),
(147, 4, '212999', 'LAIN-LAIN', ''),
(148, 4, '213100', 'UANG MUKA PENJUALAN', ''),
(149, 4, '213900', 'UANG MUKA LAIN-LAIN', ''),
(150, 4, '214104', 'PPH PASAL 4 AYAT 2', ''),
(151, 4, '214121', 'PPH PASAL 21', ''),
(152, 4, '214122', 'PPH PASAL 22', ''),
(153, 4, '214123', 'PPH PASAL 23', ''),
(154, 4, '214125', 'PPH PASAL 25', ''),
(155, 4, '214126', 'PPH PASAL 26', ''),
(156, 4, '214129', 'PPH PASAL 29', ''),
(157, 4, '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', ''),
(158, 4, '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', ''),
(159, 4, '214201', 'BUNGA', ''),
(160, 4, '214202', 'SEWA', ''),
(161, 4, '214203', 'GAJI DAN HONOR', ''),
(162, 4, '214204', 'MAKAN DAN LEMBUR', ''),
(163, 4, '214205', 'LISTRIK', ''),
(164, 4, '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', ''),
(165, 4, '214207', 'TELEPON', ''),
(166, 4, '214208', 'SURAT KABAR/MAJALAH', ''),
(167, 4, '214209', 'KOMISI', ''),
(168, 4, '214210', 'BIAYA ADMINISTRASI BANK', ''),
(169, 4, '214211', 'PAJAK WAPU/WAJIB PUNGUT', ''),
(170, 4, '214212', 'JAMSOSTEK', ''),
(171, 4, '214213', 'PREMI DISTRIBUSI', ''),
(172, 4, '214214', 'ONGKOS ANGKUT', ''),
(173, 4, '214299', 'LAIN-LAIN', ''),
(174, 4, '215121', 'PPH PASAL 21', ''),
(175, 4, '215122', 'PPH PASAL 22', ''),
(176, 4, '215123', 'PPH PASAL 23', ''),
(177, 4, '215125', 'PPH PASAL 25', ''),
(178, 4, '215201', 'PPN KELUARAN', ''),
(179, 4, '215202', 'PPN EKS KEPPRES', ''),
(180, 4, '216101', 'HUTANG LEASING KENDARAAN', ''),
(181, 4, '219101', 'HUTANG DEVIDEN', ''),
(182, 4, '219199', 'LAIN-LAIN', ''),
(183, 4, '221101', 'BANK', ''),
(184, 4, '221201', 'BANK', ''),
(185, 4, '22210', 'HUTANG LEASING KENDARAAN', ''),
(186, 4, '223000', 'HUTANG PADA PEMEGANG SAHAM', ''),
(187, 4, '230000', 'HUTANG LAIN - LAIN', ''),
(188, 4, '240000', 'HUTANG YG. DISUBORDINASI', ''),
(189, 4, '250000', 'KEWAJIBAN BERSYARAT', ''),
(190, 5, '311101', 'TIDAK TERIKAT', ''),
(191, 5, '312101', 'TEMPORER...........', ''),
(192, 5, '312201', 'PERMANEN......', ''),
(194, 6, '400002', 'Tuition  fee', ''),
(195, 6, '400003', 'Material Fee', ''),
(196, 6, '400004', 'Ekskul Fee', ''),
(350, 6, '400005', 'Pendapatan denda', ''),
(204, 6, '400006', 'Penjualan Seragam', ''),
(205, 6, '400007', 'Pendapatan Penjualan Buku', ''),
(207, 6, '412108', 'PENDAPATAN LAIN-LAIN', ''),
(212, 6, '412113', 'PENDAPATAN UJIAN HSK', ''),
(219, 7, '511101', 'GAJI', ''),
(220, 7, '511102', 'HONOR', ''),
(221, 7, '511103', 'LEMBUR', ''),
(222, 7, '511104', 'PESANGON', ''),
(223, 7, '511105', 'UANG MAKAN', ''),
(224, 7, '511106', 'BONUS', ''),
(225, 7, '511107', 'TUNJANGAN HARI RAYA', ''),
(226, 7, '511108', 'PPH PASAL 21', ''),
(227, 7, '511109', 'KESEJAHTERAAN KARYAWAN', ''),
(228, 7, '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', ''),
(229, 7, '511111', 'JAMINAN KEMATIAN ( JKM )', ''),
(230, 7, '511112', 'JAMINAN HARI TUA ( JHT )', ''),
(231, 7, '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', ''),
(232, 7, '511114', 'TUNJANGAN DANA PENSIUN', ''),
(233, 7, '511115', 'TUNJANGAN KESEHATAN', ''),
(234, 7, '511116', 'TUNJANGAN TRANSPORT', ''),
(235, 7, '511117', 'Program sekolah', ''),
(236, 7, '511119', 'PREMI ', ''),
(237, 7, '511199', 'TUNJANGAN LAIN-LAIN', ''),
(238, 7, '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', ''),
(239, 7, '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', ''),
(240, 7, '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', ''),
(241, 7, '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', ''),
(242, 7, '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', ''),
(243, 7, '512202', 'PENYUSUTAN KENDARAAN', ''),
(244, 7, '512203', 'PENYUSUTAN INVENTARIS', ''),
(245, 7, '512204', 'PENYUSUTAN INSTALASI', ''),
(246, 7, '512301', 'TRANSPORTASI ( BENSIN, TIKET )', ''),
(247, 7, '512302', 'MAKANAN & MINUMAN', ''),
(248, 7, '512303', 'PENGINAPAN', ''),
(249, 7, '512304', 'UANG SAKU', ''),
(250, 7, '512399', 'LAIN-LAIN ( PARKIR, TOL )', ''),
(251, 7, '512401', 'SEWA BANGUNAN', ''),
(252, 7, '512402', 'SEWA KENDARAAN', ''),
(253, 7, '512403', 'SEWA INVENTARIS KANTOR', ''),
(254, 7, '512451', 'ASURANSI BANGUNAN', ''),
(255, 7, '512452', 'ASURANSI KENDARAAN', ''),
(256, 7, '512453', 'ASURANSI INVENTARIS', ''),
(257, 7, '512501', 'TELEPON', ''),
(258, 7, '512502', 'TELEX', ''),
(259, 7, '512503', 'TELEGRAM', ''),
(260, 7, '512504', 'INTERLOKAL NON TELEPON INTERN', ''),
(261, 7, '512505', 'FACSIMILE', ''),
(262, 7, '512599', 'LAIN - LAIN', ''),
(263, 7, '512601', 'AIR', ''),
(264, 7, '512602', 'LISTRIK', ''),
(265, 7, '512603', 'ALAT-ALAT LISTRIK', ''),
(266, 7, '512701', 'AKUNTAN', ''),
(267, 7, '512702', 'NOTARIS', ''),
(268, 7, '512703', 'KONSULTAN', ''),
(269, 7, '512704', 'MANAGEMENT FEE', ''),
(270, 7, '512801', 'ADMINISTRASI BANK', ''),
(271, 7, '512802', 'BUKU CEK / BG', ''),
(272, 7, '512803', 'TRANSFER, KIRIM UANG , INKASO', ''),
(273, 7, '512804', 'PAJAK BUNGA BANK', ''),
(274, 7, '512901', 'BIAYA ADMINISTRASI KENDARAAN', ''),
(275, 7, '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', ''),
(276, 7, '512903', 'BIAYA BUNGA KREDIT BANK', ''),
(277, 7, '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', ''),
(278, 7, '513102', 'PERANGKO, MATERAI, KIRIM SURAT', ''),
(279, 7, '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', ''),
(280, 7, '513104', 'ALAT - ALAT PENGAJARAN ', ''),
(281, 7, '513105', 'PERLENGKAPAN KELAS', ''),
(282, 7, '513106', 'JASA PEMBELAJARAN', ''),
(283, 7, '513201', 'PERIJINAN', ''),
(284, 7, '513202', 'PAJAK - PAJAK DAERAH,PBB', ''),
(285, 7, '513203', 'STNK', ''),
(286, 7, '513211', 'RETRIBUSI SAMPAH', ''),
(287, 7, '513301', 'SUMBANGAN', ''),
(288, 7, '513302', 'ENTERTAINMENT', ''),
(289, 7, '513303', 'JAMUAN ', ''),
(290, 7, '513401', 'KEAMANAN', ''),
(291, 7, '513501', 'PENDAFTARAN', ''),
(292, 7, '513502', 'IURAN', ''),
(293, 7, '513601', 'BIAYA PENGOBATAN', ''),
(294, 7, '513701', 'MAKANAN DAN MINUMAN', ''),
(295, 7, '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', ''),
(296, 7, '513703', 'SERAGAM ', ''),
(297, 7, '513704', 'SEWA DISPENSER', ''),
(298, 7, '513705', 'OLAH RAGA DAN KESENIAN', ''),
(299, 7, '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', ''),
(300, 7, '513707', 'BUKU, VCD', ''),
(301, 7, '513708', 'ATRIBUT SEKOLAH', ''),
(302, 7, '513709', 'BIAYA PSIKOTES', ''),
(303, 7, '513710', 'BIAYA ADVERTENSI ( IKLAN )', ''),
(304, 7, '513711', 'BIAYA STUDY TOUR', ''),
(305, 7, '513712', 'BIAYA PERLOMBAAN & PERAYAAN', ''),
(306, 7, '513713', 'STIKER U/ MURID', ''),
(307, 7, '513714', 'BIAYA TES KESEHATAN', ''),
(309, 7, '513716', 'BIAYA PAMERAN', ''),
(310, 7, '513799', 'LAIN - LAIN', ''),
(311, 7, '513801', 'KANTIN', ''),
(312, 7, '513802', 'DAPUR', ''),
(313, 7, '513803', 'BIAYA KEBERSIHAN', ''),
(314, 7, '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', ''),
(315, 7, '513805', 'JASA CLEANING SERVICE', ''),
(317, 7, '513807', 'BIAYA MESS', ''),
(318, 7, '513901', 'SELAMATAN', ''),
(319, 7, '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', ''),
(320, 7, '513903', 'DENDA PAJAK', ''),
(321, 7, '513904', 'KOREKSI TAHUN LALU', ''),
(323, 7, '513999', 'LAIN - LAIN (SELISIH KAS)', ''),
(324, 7, '514001', 'TRANSPORT', ''),
(325, 7, '514002', 'MAKAN & MINUM (RAPAT)', ''),
(326, 7, '514099', 'LAIN-LAIN', ''),
(327, 7, '514101', 'BUKU', ''),
(328, 7, '514102', 'VCD', ''),
(329, 7, '514103', 'SERAGAM ', ''),
(330, 7, '514104', 'ATRIBUT SEKOLAH', ''),
(331, 7, '514105', 'BIAYA PSIKOTES', ''),
(332, 7, '514106', 'BIAYA STUDY TOUR/FIELD TRIP', ''),
(333, 7, '514107', 'BIAYA PERLOMBAAN ', ''),
(334, 7, '514108', 'EKSTRAKURIKULER', ''),
(336, 7, '514110', 'BIAYA CHECK POINT', ''),
(337, 7, '514199', 'LAIN - LAIN', ''),
(341, 2, '111202', 'Bank Permata Sekolah', ''),
(344, 1, '100003', 'Kas Diknas', ''),
(345, 7, '514111', 'Biaya Peralatan Sekolah', ''),
(348, 2, '111203', 'Bank Permata Yayasan', ''),
(349, 6, '400001', 'Registration fee', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_detjenistrans`
--

DROP TABLE IF EXISTS `keu_detjenistrans`;
CREATE TABLE IF NOT EXISTS `keu_detjenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistrans` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `bukti` char(3) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `keu_detjenistrans`
--

INSERT INTO `keu_detjenistrans` (`replid`, `jenistrans`, `nama`, `kode`, `bukti`) VALUES
(1, 2, 'pembayaran siswa aktif', 'in_siswa', 'BKM'),
(2, 2, 'pembayaran calon siswa', 'in_calonsiswa', 'BBM'),
(3, 2, 'pemasukan bank', 'in_bank', 'BBM'),
(4, 2, 'pemasukkan kas', 'in_come', 'BKM'),
(5, 3, 'pengeluaran barang', 'out_barang', 'BKK'),
(6, 3, 'pengeluaran bank', 'out_bank', 'BBK'),
(7, 3, 'pengeluaran kas', 'out_come', 'BKK'),
(8, 1, 'junal umum', 'ju', 'MMJ');

-- --------------------------------------------------------

--
-- Table structure for table `keu_grupbrg`
--

DROP TABLE IF EXISTS `keu_grupbrg`;
CREATE TABLE IF NOT EXISTS `keu_grupbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_grupbrg`
--

INSERT INTO `keu_grupbrg` (`replid`, `nama`, `keterangan`) VALUES
(1, 'Elektronika', ''),
(2, 'Kendaraan', ''),
(3, 'Alat Tulis', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_jenistrans`
--

DROP TABLE IF EXISTS `keu_jenistrans`;
CREATE TABLE IF NOT EXISTS `keu_jenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_jenistrans`
--

INSERT INTO `keu_jenistrans` (`replid`, `nama`, `kode`) VALUES
(1, 'jurnal umum', 'ju'),
(2, 'pemasukkan', 'in'),
(3, 'pengeluaran', 'out');

-- --------------------------------------------------------

--
-- Table structure for table `keu_jurnal`
--

DROP TABLE IF EXISTS `keu_jurnal`;
CREATE TABLE IF NOT EXISTS `keu_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi` int(10) unsigned NOT NULL,
  `rek` int(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `jenis` char(1) NOT NULL,
  `debet` double(14,0) NOT NULL DEFAULT '0',
  `kredit` double(14,0) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1195 ;

--
-- Dumping data for table `keu_jurnal`
--

INSERT INTO `keu_jurnal` (`replid`, `transaksi`, `rek`, `nominal`, `jenis`, `debet`, `kredit`, `ts`) VALUES
(1171, 1, 83, '80000', 'k', 0, 0, '2015-05-25 08:47:11'),
(1172, 1, 1, '80000', 'd', 0, 0, '2015-05-25 08:47:11'),
(1173, 2, 83, '15000', 'd', 0, 0, '2015-05-25 08:47:58'),
(1174, 2, 1, '15000', 'k', 0, 0, '2015-05-25 08:47:58'),
(1175, 3, 222, '35000', 'd', 0, 0, '2015-05-25 08:56:14'),
(1176, 3, 6, '35000', 'k', 0, 0, '2015-05-25 08:56:14'),
(1177, 4, 203, '70000', 'k', 0, 0, '2015-05-25 09:00:10'),
(1178, 4, 1, '70000', 'd', 0, 0, '2015-05-25 09:00:10'),
(1179, 5, 1, '50000', 'd', 0, 0, '2015-05-25 23:08:09'),
(1180, 5, 22, '50000', 'k', 0, 0, '2015-05-25 23:08:09'),
(1181, 5, 25, '5000', 'k', 0, 0, '2015-05-25 23:08:59'),
(1182, 5, 3, '5000', 'd', 0, 0, '2015-05-25 23:09:00'),
(1183, 6, 193, '500000', 'k', 0, 0, '2015-06-04 23:29:17'),
(1184, 6, 1, '500000', 'd', 0, 0, '2015-06-04 23:29:17'),
(1194, 11, 341, '3720000', 'k', 0, 0, '2015-08-24 06:18:37'),
(1193, 11, 345, '3720000', 'd', 0, 0, '2015-08-24 06:18:37'),
(1189, 9, 235, '5500000', 'd', 0, 0, '2015-08-24 05:48:45'),
(1190, 9, 341, '5500000', 'k', 0, 0, '2015-08-24 05:48:45');

-- --------------------------------------------------------

--
-- Table structure for table `keu_kategorianggaran`
--

DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE IF NOT EXISTS `keu_kategorianggaran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(10) NOT NULL,
  `rekening` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `keu_kategorianggaran`
--

INSERT INTO `keu_kategorianggaran` (`replid`, `departemen`, `rekening`, `nama`, `keterangan`) VALUES
(1, 1, 5, 'ATK', 'alat tulis kantor'),
(2, 1, 1, 'lingkungan', 'dana perwatan lingkungan sekolah'),
(3, 1, 2, 'kesiswaan', 'dana kegiatan ekstrakurikuler siswa'),
(4, 1, 345, 'Peralatan Sekolah', ''),
(5, 1, 219, 'Gaji', ''),
(6, 1, 235, 'Program school development', '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_kategorirek`
--

DROP TABLE IF EXISTS `keu_kategorirek`;
CREATE TABLE IF NOT EXISTS `keu_kategorirek` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `keu_kategorirek`
--

INSERT INTO `keu_kategorirek` (`replid`, `kode`, `nama`) VALUES
(1, 1, 'KAS'),
(2, 1, 'BANK'),
(3, 1, 'AKTIVA'),
(4, 2, 'KEWAJIBAN'),
(5, 3, 'MODAL'),
(6, 4, 'PENDAPATAN'),
(7, 5, 'BIAYA');

-- --------------------------------------------------------

--
-- Table structure for table `keu_kategorirekening`
--

DROP TABLE IF EXISTS `keu_kategorirekening`;
CREATE TABLE IF NOT EXISTS `keu_kategorirekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  `jenis` enum('d','k') NOT NULL,
  `jenistambah` enum('d','k') NOT NULL,
  `jeniskurang` enum('d','k') NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `keu_kategorirekening`
--

INSERT INTO `keu_kategorirekening` (`replid`, `kode`, `nama`, `jenis`, `jenistambah`, `jeniskurang`) VALUES
(1, 1, 'KAS', 'd', 'd', 'k'),
(2, 1, 'BANK', 'd', 'd', 'k'),
(3, 1, 'AKTIVA', 'd', 'd', 'k'),
(4, 2, 'KEWAJIBAN', 'k', 'k', 'd'),
(5, 3, 'MODAL', 'k', 'k', 'd'),
(6, 4, 'PENDAPATAN', 'k', 'k', 'd'),
(7, 5, 'BIAYA', 'd', 'd', 'k');

-- --------------------------------------------------------

--
-- Table structure for table `keu_katmodulpembayaran`
--

DROP TABLE IF EXISTS `keu_katmodulpembayaran`;
CREATE TABLE IF NOT EXISTS `keu_katmodulpembayaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `siswa` enum('aktif','calon') DEFAULT NULL,
  `sifat` enum('wajib','sukarela') DEFAULT NULL,
  `keterangan` text NOT NULL,
  `detjenistrans` int(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `keu_katmodulpembayaran`
--

INSERT INTO `keu_katmodulpembayaran` (`replid`, `nama`, `siswa`, `sifat`, `keterangan`, `detjenistrans`) VALUES
(1, 'Tuition Fee', 'aktif', 'wajib', 'uang per semester (spp)', 1),
(2, 'Registration', 'aktif', 'wajib', 'uang pendaftaran (uang gedung)', 1),
(3, 'Material Fee', 'aktif', 'wajib', 'material fee', 1);

-- --------------------------------------------------------

--
-- Table structure for table `keu_kelompokbrg`
--

DROP TABLE IF EXISTS `keu_kelompokbrg`;
CREATE TABLE IF NOT EXISTS `keu_kelompokbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grupbrg` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `keu_kelompokbrg`
--

INSERT INTO `keu_kelompokbrg` (`replid`, `grupbrg`, `nama`) VALUES
(1, 1, 'Komputer'),
(2, 1, 'Proyektor'),
(3, 2, 'Mobil'),
(4, 2, 'Motor'),
(5, 2, 'Sepeda'),
(6, 3, 'bulpoin');

-- --------------------------------------------------------

--
-- Table structure for table `keu_modul`
--

DROP TABLE IF EXISTS `keu_modul`;
CREATE TABLE IF NOT EXISTS `keu_modul` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `keu_modul`
--

INSERT INTO `keu_modul` (`replid`, `kategori`, `reftipe`, `refid`, `nama`, `rek1`, `rek2`, `rek3`, `nominal`, `cicilan`, `keterangan`) VALUES
(2, 3, 2, 2, 'Pendaftaran Tahun Ajaran 2014-2015', 14, 0, 0, '0', '0', ''),
(3, 3, 2, 2, 'Pendaftaran Tahun Ajaran 2014-2015', 6, 194, 0, '0', '0', 'Kaitlynn Tiffany'),
(4, 1, 3, 3, 'Uang pangkal angkatan 2013', 6, 194, 29, '0', '0', 'DPP'),
(5, 1, 1, 1, 'Uang sekolah tahun ajaran 2014-2015 (Aktif)', 1, 203, 29, '0', '0', ''),
(6, 1, 3, 8, 'Uang pangkal angkatan 2016', 3, 4, 3, '0', '0', ''),
(7, 1, 3, 2, 'Uang pangkal angkatan 2014', 1, 1, 1, '0', '0', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `keu_modulpembayaran`
--

DROP TABLE IF EXISTS `keu_modulpembayaran`;
CREATE TABLE IF NOT EXISTS `keu_modulpembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katmodulpembayaran` int(11) NOT NULL DEFAULT '0',
  `angkatan` int(10) NOT NULL DEFAULT '0',
  `semester` int(11) NOT NULL,
  `bulan` int(2) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `keu_modulpembayaran`
--

INSERT INTO `keu_modulpembayaran` (`replid`, `katmodulpembayaran`, `angkatan`, `semester`, `bulan`, `nama`, `rek1`, `rek2`, `rek3`, `keterangan`) VALUES
(41, 2, 1, 0, 0, 'Registration Angkatan 2015', 1, 194, 22, 'keterangan '),
(42, 3, 1, 18, 0, 'Material Fee Semester 1 Th. Ajaran 2015-2016', 1, 203, 0, ''),
(45, 3, 1, 2, 0, 'Material Fee Semester 2 Th. Ajaran 2015-2016', 1, 0, 0, ''),
(44, 1, 1, 18, 7, 'Tuition Fee Semester 1 th. Ajaran 2015-2016', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `keu_nominalanggaran`
--

DROP TABLE IF EXISTS `keu_nominalanggaran`;
CREATE TABLE IF NOT EXISTS `keu_nominalanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(10) NOT NULL,
  `bulan` int(2) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=529 ;

--
-- Dumping data for table `keu_nominalanggaran`
--

INSERT INTO `keu_nominalanggaran` (`replid`, `detilanggaran`, `bulan`, `nominal`) VALUES
(78, 10, 6, 4),
(79, 10, 7, 4),
(80, 10, 8, 4),
(81, 10, 9, 4),
(82, 10, 10, 4),
(83, 10, 11, 4),
(84, 10, 12, 4),
(85, 11, 1, 20),
(86, 11, 2, 10),
(87, 11, 3, 1),
(88, 11, 4, 10),
(89, 11, 5, 10),
(90, 11, 6, 10),
(91, 11, 7, 7),
(92, 11, 8, 5),
(93, 11, 9, 10),
(94, 11, 10, 10),
(95, 11, 11, 55),
(96, 11, 12, 4),
(169, 18, 1, 0),
(170, 18, 2, 0),
(171, 18, 3, 0),
(172, 18, 4, 0),
(173, 18, 5, 0),
(174, 18, 6, 0),
(175, 18, 7, 0),
(176, 18, 8, 0),
(177, 18, 9, 0),
(178, 18, 10, 0),
(179, 18, 11, 0),
(180, 18, 12, 0),
(181, 19, 1, 50),
(182, 19, 2, 50),
(183, 19, 3, 50),
(184, 19, 4, 50),
(185, 19, 5, 50),
(186, 19, 6, 50),
(187, 19, 7, 50),
(188, 19, 8, 50),
(189, 19, 9, 50),
(190, 19, 10, 50),
(191, 19, 11, 50),
(192, 19, 12, 50),
(193, 20, 1, 50),
(194, 20, 2, 50),
(195, 20, 3, 50),
(196, 20, 4, 50),
(197, 20, 5, 50),
(198, 20, 6, 50),
(199, 20, 7, 50),
(200, 20, 8, 50),
(201, 20, 9, 50),
(202, 20, 10, 50),
(203, 37, 1, 10000000000),
(204, 37, 2, 10000000000),
(205, 37, 3, 10000000000),
(206, 37, 4, 10000000000),
(207, 37, 5, 10000000000),
(208, 37, 6, 10000000000),
(209, 37, 7, 10000000000),
(210, 37, 8, 10000000000),
(211, 37, 9, 10000000000),
(212, 37, 10, 10000000000),
(213, 37, 11, 10000000000),
(214, 37, 12, 10000000000),
(231, 39, 1, 46250),
(232, 39, 2, 46250),
(233, 39, 3, 46250),
(234, 39, 4, 46250),
(235, 39, 5, 46250),
(236, 39, 6, 46250),
(237, 39, 7, 46250),
(238, 39, 8, 46250),
(239, 39, 9, 46250),
(240, 39, 10, 46250),
(241, 39, 11, 46250),
(242, 39, 12, 46250),
(243, 40, 1, 10000),
(244, 40, 2, 10000),
(245, 40, 3, 10000),
(246, 40, 4, 10000),
(247, 40, 5, 10000),
(248, 40, 6, 10000),
(249, 40, 7, 10000),
(250, 40, 8, 10000),
(251, 40, 9, 10000),
(252, 40, 10, 10000),
(253, 40, 11, 10000),
(254, 40, 12, 10000),
(255, 41, 1, 30000),
(256, 41, 2, 30000),
(257, 41, 3, 30000),
(258, 41, 4, 30000),
(259, 41, 5, 30000),
(260, 41, 6, 30000),
(261, 41, 7, 30000),
(262, 41, 8, 30000),
(263, 41, 9, 30000),
(264, 41, 10, 30000),
(265, 41, 11, 30000),
(266, 41, 12, 30000),
(267, 42, 1, 1000000),
(268, 42, 2, 1000000),
(269, 42, 3, 1000000),
(270, 42, 4, 1000000),
(271, 42, 5, 1000000),
(272, 42, 6, 1000000),
(273, 42, 7, 1000000),
(274, 42, 8, 1000000),
(275, 42, 9, 1000000),
(276, 42, 10, 1000000),
(277, 42, 11, 1000000),
(278, 42, 12, 1000000),
(279, 43, 1, 20833333),
(280, 43, 2, 20833333),
(281, 43, 3, 20833333),
(282, 43, 4, 20833333),
(283, 43, 5, 20833333),
(284, 43, 6, 20833333),
(285, 43, 7, 20833333),
(286, 43, 8, 20833333),
(287, 43, 9, 20833333),
(288, 43, 10, 20833333),
(289, 43, 11, 20833333),
(290, 43, 12, 20833333),
(291, 44, 1, 416667),
(292, 44, 2, 416667),
(293, 44, 3, 416667),
(294, 44, 4, 416667),
(295, 44, 5, 416667),
(296, 44, 6, 416667),
(297, 44, 7, 416667),
(298, 44, 8, 416667),
(299, 44, 9, 416667),
(300, 44, 10, 416667),
(301, 44, 11, 416667),
(302, 44, 12, 416667),
(303, 45, 1, 10000),
(304, 45, 2, 10000),
(305, 45, 3, 10000),
(306, 45, 4, 10000),
(307, 45, 5, 10000),
(308, 45, 6, 10000),
(309, 45, 7, 10000),
(310, 45, 8, 10000),
(311, 45, 9, 10000),
(312, 45, 10, 10000),
(313, 45, 11, 10000),
(314, 45, 12, 10000),
(315, 0, 1, 0),
(316, 0, 2, 0),
(317, 0, 3, 0),
(318, 0, 4, 0),
(319, 0, 5, 0),
(320, 0, 6, 0),
(321, 0, 7, 0),
(322, 0, 8, 0),
(323, 0, 9, 0),
(324, 0, 10, 0),
(325, 0, 11, 54433360),
(326, 0, 12, 7675540),
(327, 12, 1, 310000),
(328, 12, 2, 310000),
(329, 12, 3, 310000),
(330, 12, 4, 310000),
(331, 12, 5, 310000),
(332, 12, 6, 310000),
(333, 12, 7, 310000),
(334, 12, 8, 310000),
(335, 12, 9, 310000),
(336, 12, 10, 310000),
(337, 12, 11, 310000),
(338, 12, 12, 310000),
(339, 13, 1, 0),
(340, 13, 2, 0),
(341, 13, 3, 0),
(342, 13, 4, 0),
(343, 13, 5, 0),
(344, 13, 6, 0),
(345, 13, 7, 0),
(346, 13, 8, 5500000),
(347, 13, 9, 0),
(348, 13, 10, 0),
(349, 13, 11, 0),
(350, 13, 12, 0),
(450, 41, 6, 0),
(451, 41, 7, 0),
(452, 41, 8, 0),
(453, 41, 9, 0),
(454, 41, 10, 0),
(455, 41, 11, 0),
(456, 41, 12, 0),
(457, 42, 1, 0),
(458, 42, 2, 0),
(459, 42, 3, 0),
(460, 42, 4, 0),
(461, 42, 5, 0),
(462, 42, 6, 0),
(463, 42, 7, 0),
(464, 42, 8, 0),
(465, 42, 9, 0),
(466, 42, 10, 0),
(467, 42, 11, 0),
(468, 42, 12, 0),
(469, 43, 1, 1),
(470, 43, 2, 1),
(471, 43, 3, 1),
(472, 43, 4, 1),
(473, 43, 5, 1),
(474, 43, 6, 1),
(475, 43, 7, 1),
(476, 43, 8, 1),
(477, 43, 9, 1),
(478, 43, 10, 1),
(479, 43, 11, 1),
(480, 43, 12, 1),
(481, 44, 1, 0),
(482, 44, 2, 0),
(483, 44, 3, 0),
(484, 44, 4, 0),
(485, 44, 5, 0),
(486, 44, 6, 0),
(487, 44, 7, 0),
(488, 44, 8, 0),
(489, 44, 9, 0),
(490, 44, 10, 0),
(491, 44, 11, 0),
(492, 44, 12, 0),
(493, 45, 1, 0),
(494, 45, 2, 0),
(495, 45, 3, 0),
(496, 45, 4, 0),
(497, 45, 5, 0),
(498, 45, 6, 0),
(499, 45, 7, 0),
(500, 45, 8, 0),
(501, 45, 9, 0),
(502, 45, 10, 0),
(503, 45, 11, 0),
(504, 45, 12, 0),
(505, 46, 1, 1),
(506, 46, 2, 1),
(507, 46, 3, 1),
(508, 46, 4, 1),
(509, 46, 5, 1),
(510, 46, 6, 1),
(511, 46, 7, 1),
(512, 46, 8, 1),
(513, 46, 9, 1),
(514, 46, 10, 1),
(515, 46, 11, 1),
(516, 46, 12, 1),
(517, 47, 1, 0),
(518, 47, 2, 0),
(519, 47, 3, 0),
(520, 47, 4, 0),
(521, 47, 5, 0),
(522, 47, 6, 0),
(523, 47, 7, 0),
(524, 47, 8, 0),
(525, 47, 9, 0),
(526, 47, 10, 0),
(527, 47, 11, 0),
(528, 47, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keu_pembayaran`
--

DROP TABLE IF EXISTS `keu_pembayaran`;
CREATE TABLE IF NOT EXISTS `keu_pembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modul` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `lunas` enum('0','1') NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3653 ;

-- --------------------------------------------------------

--
-- Table structure for table `keu_pembayaran_copy`
--

DROP TABLE IF EXISTS `keu_pembayaran_copy`;
CREATE TABLE IF NOT EXISTS `keu_pembayaran_copy` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswabiaya` int(11) NOT NULL,
  `nominal` decimal(14,0) NOT NULL DEFAULT '0',
  `viabayar2` int(11) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `idkwitansi` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`replid`),
  KEY `siswabiaya` (`siswabiaya`) USING BTREE,
  KEY `viabayar2` (`viabayar2`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `keu_pembayaran_copy`
--

INSERT INTO `keu_pembayaran_copy` (`replid`, `siswabiaya`, `nominal`, `viabayar2`, `tanggal`, `idkwitansi`, `keterangan`, `ts`) VALUES
(5, 654, '100000', 3, '2015-11-01', 1, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `keu_pemutihanpenerimaansiswa`
--

DROP TABLE IF EXISTS `keu_pemutihanpenerimaansiswa`;
CREATE TABLE IF NOT EXISTS `keu_pemutihanpenerimaansiswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `siswa` int(11) NOT NULL,
  `karyawan` int(11) NOT NULL,
  `nomom` varchar(20) NOT NULL,
  `tglmom` date DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  KEY `karyawan` (`karyawan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keu_penerimaan`
--

DROP TABLE IF EXISTS `keu_penerimaan`;
CREATE TABLE IF NOT EXISTS `keu_penerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keu_penerimaanbrg`
--

DROP TABLE IF EXISTS `keu_penerimaanbrg`;
CREATE TABLE IF NOT EXISTS `keu_penerimaanbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomerbukti` varchar(100) NOT NULL,
  `kodebrg` varchar(50) NOT NULL,
  `namabrg` varchar(100) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `satuan` varchar(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `keu_penerimaanbrg`
--

INSERT INTO `keu_penerimaanbrg` (`replid`, `nomerbukti`, `kodebrg`, `namabrg`, `unit`, `satuan`, `nominal`) VALUES
(1, 'AAA', 'ELKO001', '', 2, 'unit', '0'),
(2, 'BBB', '101', '', 1, 'unit', '20000'),
(3, 'AA001', 'ELKO001', 'Macbook pro 15 inch', 2, 'unit', '12000000'),
(4, 'BB101', 'KEMTR0001', 'Supra X 125', 1, 'unit', '15000000'),
(5, 'AS989', 'ELKO001', 'Macbook pro 15 inch', 1, 'unit', '12000000'),
(6, 'ASD123', 'KEMTR0001', 'Supra X 125', 1, 'unit', '18000000'),
(7, 'ASDW123', 'ELKO001', 'Macbook pro 15 inch', 1, 'unit', '12000000');

-- --------------------------------------------------------

--
-- Table structure for table `keu_penerimaansiswa`
--

DROP TABLE IF EXISTS `keu_penerimaansiswa`;
CREATE TABLE IF NOT EXISTS `keu_penerimaansiswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswabiaya` int(11) NOT NULL,
  `nominal` decimal(14,0) NOT NULL DEFAULT '0',
  `viabayar2` int(11) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `idkwitansi` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`replid`),
  KEY `siswabiaya` (`siswabiaya`) USING BTREE,
  KEY `viabayar2` (`viabayar2`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `keu_penerimaansiswa`
--

INSERT INTO `keu_penerimaansiswa` (`replid`, `siswabiaya`, `nominal`, `viabayar2`, `tanggal`, `idkwitansi`, `keterangan`, `ts`) VALUES
(1, 656, '400000', 3, '2015-12-05', 1, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `keu_rekening`
--

DROP TABLE IF EXISTS `keu_rekening`;
CREATE TABLE IF NOT EXISTS `keu_rekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirek` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=342 ;

--
-- Dumping data for table `keu_rekening`
--

INSERT INTO `keu_rekening` (`replid`, `kategorirek`, `kode`, `nama`, `nominal`, `keterangan`) VALUES
(1, 1, '111101', 'KAS KECIL ', NULL, ''),
(2, 1, '111102', 'KAS SATELIT', NULL, ''),
(3, 1, '111103', 'KAS KERTAJAYA', NULL, ''),
(4, 1, '111104', 'KAS RUNGKUT', NULL, ''),
(5, 1, '111199', 'KAS DALAM PERJALANAN', NULL, ''),
(6, 2, '111201', 'BCA AC NO. 5560060001', NULL, ''),
(7, 2, '111202', 'BANK EKONOMI AC NO. 3031861275', NULL, ''),
(8, 2, '111203', 'BCA AC NO. 4683800000', NULL, ''),
(9, 2, '111204', 'DEPOSITO EKONOMI', NULL, ''),
(10, 2, '111205', 'BANK MAYAPADA AC NO.201.300.17.000', NULL, ''),
(11, 2, '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', NULL, ''),
(12, 2, '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', NULL, ''),
(13, 2, '111208', 'DEPOSITO PANINBANK', NULL, ''),
(14, 2, '111209', 'PANINBANK AC NO.448.50.8888.7', NULL, ''),
(15, 2, '111210', 'MANDARI AC NO. 1420088800098', NULL, ''),
(16, 2, '111211', 'BANK BCA 8290960101', NULL, ''),
(17, 2, '111299', 'BANK DALAM PERJALANAN', NULL, ''),
(18, 3, '111900', 'AYAT SILANG KAS DAN BANK', NULL, ''),
(19, 3, '112100', 'TABUNGAN', NULL, ''),
(20, 3, '112200', 'DEPOSITO BERJANGKA', NULL, ''),
(21, 3, '112300', 'SURAT-SURAT BERHARGA', NULL, ''),
(22, 3, '113100', 'PIUTANG USAHA', NULL, ''),
(23, 3, '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', NULL, ''),
(24, 3, '113300', 'PIUTANG CEK/GIRO MUNDUR', NULL, ''),
(25, 3, '113400', 'CADANGAN PIUTANG RAGU-RAGU', NULL, ''),
(26, 3, '113500', 'PIUTANG DIREKSI', NULL, ''),
(27, 3, '113600', 'PIUTANG KARYAWAN', NULL, ''),
(28, 3, '113700', 'PIUTANG PIHAK III', NULL, ''),
(29, 3, '113999', 'PIUTANG LAIN-LAIN', NULL, ''),
(30, 3, '114100', 'UANG MUKA PEMBELIAN', NULL, ''),
(31, 3, '114901', 'TANAH', NULL, ''),
(32, 3, '114902', 'KENDARAAN', NULL, ''),
(33, 3, '114903', 'MESIN DAN PERALATAN', NULL, ''),
(34, 3, '114904', 'BANGUNAN', NULL, ''),
(35, 3, '114905', 'INVENTARIS', NULL, ''),
(36, 3, '114906', 'UANG MUKA PERJALANAN', NULL, ''),
(37, 3, '114999', 'LAIN-LAIN', NULL, ''),
(38, 3, '116121', 'PPH PASAL 21', NULL, ''),
(39, 3, '116122', 'PPH PASAL 22', NULL, ''),
(40, 3, '116123', 'PPH PASAL 23', NULL, ''),
(41, 3, '116125', 'PPH PASAL 25', NULL, ''),
(42, 3, '116126', 'PPH PASAL 26', NULL, ''),
(43, 3, '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', NULL, ''),
(44, 3, '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', NULL, ''),
(45, 3, '116201', 'ASURANSI', NULL, ''),
(46, 3, '116202', 'SEWA', NULL, ''),
(47, 3, '116203', 'BUNGA LEASING', NULL, ''),
(48, 3, '116204', 'ONGKOS ANGKUT', NULL, ''),
(49, 3, '116299', 'LAIN-LAIN', NULL, ''),
(50, 3, '121000', 'PENYERTAAN DALAM SURAT BERHARGA', NULL, ''),
(51, 3, '122000', 'PENYERTAAN DALAM AKTIVA TETAP', NULL, ''),
(52, 3, '123000', 'PENYERTAAN LAIN-LAIN', NULL, ''),
(53, 3, '141100', 'TANAH KANTOR', NULL, ''),
(54, 3, '141251', 'PRASARANA JALAN', NULL, ''),
(55, 3, '141252', 'PRASARANA SALURAN AIR', NULL, ''),
(56, 3, '141253', 'PRASARANA TAMAN', NULL, ''),
(57, 3, '141301', 'INSTALASI LISTRIK', NULL, ''),
(58, 3, '141302', 'INSTALASI AIR', NULL, ''),
(59, 3, '141303', 'INSTALASI TELEPON', NULL, ''),
(60, 3, '141401', 'MESIN-MESIN', NULL, ''),
(61, 3, '141451', 'MESIN-MESIN LEASING', NULL, ''),
(62, 3, '141501', 'KENDARAAN', NULL, ''),
(63, 3, '141551', 'KENDARAAN LEASING KANTOR', NULL, ''),
(64, 3, '141601', 'INVENTARIS', NULL, ''),
(65, 3, '145201', 'AKUM. PENY. BANGUNAN KANTOR', NULL, ''),
(66, 3, '145202', 'AKUM. PENY. BANGUNAN KANTIN', NULL, ''),
(67, 3, '145203', 'AKUM. PENY. BANGUNAN MESS', NULL, ''),
(68, 3, '145251', 'AKUM. PENY. PRASARANA JALAN', NULL, ''),
(69, 3, '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', NULL, ''),
(70, 3, '145253', 'AKUM. PENY. PRASARANA TAMAN', NULL, ''),
(71, 3, '145301', 'AKUM. PENY. INSTALASI LISTRIK', NULL, ''),
(72, 3, '145302', 'AKUM. PENY. INSTALASI AIR', NULL, ''),
(73, 3, '145303', 'AKUM. PENY. INSTALASI TELPON', NULL, ''),
(74, 3, '145401', 'AKUM. PENY. KENDARAAN KANTOR', NULL, ''),
(75, 3, '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', NULL, ''),
(76, 3, '145501', 'AKUM. PENY. INVENTARIS KANTOR', NULL, ''),
(77, 3, '145502', 'AKUM. PENY. INVENTARIS KANTIN', NULL, ''),
(78, 3, '151000', 'GOODWILL', NULL, ''),
(79, 3, '152000', 'HAK PATEN', NULL, ''),
(80, 3, '153000', 'LISENSI', NULL, ''),
(81, 3, '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', NULL, ''),
(82, 3, '161101', 'BIAYA PENDIRIAN', NULL, ''),
(83, 3, '161102', 'GAJI, TUNJANGAN', NULL, ''),
(84, 3, '161103', 'BIAYA PERJALANAN DINAS', NULL, ''),
(85, 3, '161104', 'ALAT TULIS & KEPERLUAN KANTOR', NULL, ''),
(86, 3, '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', NULL, ''),
(87, 3, '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', NULL, ''),
(88, 3, '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', NULL, ''),
(89, 3, '161108', 'BENSIN, PARKIR, TOL', NULL, ''),
(90, 3, '161109', 'BIAYA ADMINISTRASI BANK', NULL, ''),
(91, 3, '161110', 'BAHAN PENOLONG', NULL, ''),
(92, 3, '161111', 'BIAYA IKLAN', NULL, ''),
(93, 3, '161112', 'PAJAK-PAJAK', NULL, ''),
(94, 3, '161113', 'REKENING LISTRIK, AIR', NULL, ''),
(95, 3, '161114', 'BIAYA STNK, BBN, DLL', NULL, ''),
(96, 3, '161115', 'BUNGA, FEE, PROVISI BANK, DLL', NULL, ''),
(97, 3, '161116', 'BIAYA PERESMIAN', NULL, ''),
(98, 3, '161117', 'BIAYA BAHAN BAKAR', NULL, ''),
(99, 3, '161118', 'REPARASI & PEMELIHARAAN KANTOR', NULL, ''),
(100, 3, '161119', 'TRAINING, SEMINAR, TEST, DLL', NULL, ''),
(101, 3, '161120', 'BIAYA MAKAN DAN MINUM', NULL, ''),
(102, 3, '161121', 'PPH PASAL 21', NULL, ''),
(103, 3, '161122', 'PPH PASAL 22', NULL, ''),
(104, 3, '161123', 'PPH PASAL 23', NULL, ''),
(105, 3, '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', NULL, ''),
(106, 3, '161125', 'REPARASI & PEMELIHARAAN MESS', NULL, ''),
(107, 3, '161126', 'REPARASI & PEMELIHARAAN TANKI', NULL, ''),
(108, 3, '161127', 'BIAYA PENGURUSAN LISTRIK', NULL, ''),
(109, 3, '161128', 'REPARASI & PEMELIHARAAN BOTOL', NULL, ''),
(110, 3, '161129', 'BIAYA SEWA GEDUNG', NULL, ''),
(111, 3, '161130', 'BIAYA BUNGA LEASING', NULL, ''),
(112, 3, '161143', 'SELISIH KURS', NULL, ''),
(113, 3, '161144', 'BIAYA BUNGA PINJAMAN', NULL, ''),
(114, 3, '161145', 'IURAN DAN ASURANSI', NULL, ''),
(115, 3, '161146', 'BIAYA KEAMANAN', NULL, ''),
(116, 3, '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', NULL, ''),
(117, 3, '161151', 'PENDAPATAN JASA GIRO', NULL, ''),
(118, 3, '161152', 'PENDAPATAN BUNGA DEPOSITO', NULL, ''),
(119, 3, '161153', 'PENDAPATAN BUNGA BANK', NULL, ''),
(120, 3, '161154', 'PENDAPATAN BUNGA PIHAK III', NULL, ''),
(121, 3, '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', NULL, ''),
(122, 3, '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', NULL, ''),
(123, 3, '162100', 'UANG JAMINAN LISTRIK', NULL, ''),
(124, 3, '162200', 'UANG JAMINAN TELEPON', NULL, ''),
(125, 3, '163000', 'BIAYA YANG DITANGGUHKAN', NULL, ''),
(126, 3, '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', NULL, ''),
(127, 3, '165201', 'BANGUNAN ', NULL, ''),
(128, 3, '165301', 'INSTALASI LISTRIK', NULL, ''),
(129, 3, '165302', 'INSTALASI AIR', NULL, ''),
(130, 3, '165303', 'INSTALASI TELEPON', NULL, ''),
(131, 3, '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', NULL, ''),
(132, 3, '169000', 'AKTIVA LAIN-LAIN', NULL, ''),
(133, 4, '211101', 'BANK', NULL, ''),
(134, 4, '211201', 'BANK', NULL, ''),
(135, 4, '211501', 'BANK', NULL, ''),
(136, 4, '211601', 'BANK', NULL, ''),
(137, 4, '212100', 'HUTANG USAHA', NULL, ''),
(138, 4, '212200', 'HUTANG YANG BELUM DIFAKTURKAN', NULL, ''),
(139, 4, '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', NULL, ''),
(140, 4, '212901', 'HUTANG PIHAK KETIGA', NULL, ''),
(141, 4, '212902', 'HUTANG PERSEDIAAN', NULL, ''),
(142, 4, '212903', 'HUTANG KENDARAAN', NULL, ''),
(143, 4, '212904', 'HUTANG BANGUNAN', NULL, ''),
(144, 4, '212905', 'HUTANG INVENTARIS', NULL, ''),
(145, 4, '212906', 'HUTANG VOUCHER', NULL, ''),
(146, 4, '212907', 'HUTANG KPD GKA ELYON', NULL, ''),
(147, 4, '212999', 'LAIN-LAIN', NULL, ''),
(148, 4, '213100', 'UANG MUKA PENJUALAN', NULL, ''),
(149, 4, '213900', 'UANG MUKA LAIN-LAIN', NULL, ''),
(150, 4, '214104', 'PPH PASAL 4 AYAT 2', NULL, ''),
(151, 4, '214121', 'PPH PASAL 21', NULL, ''),
(152, 4, '214122', 'PPH PASAL 22', NULL, ''),
(153, 4, '214123', 'PPH PASAL 23', NULL, ''),
(154, 4, '214125', 'PPH PASAL 25', NULL, ''),
(155, 4, '214126', 'PPH PASAL 26', NULL, ''),
(156, 4, '214129', 'PPH PASAL 29', NULL, ''),
(157, 4, '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', NULL, ''),
(158, 4, '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', NULL, ''),
(159, 4, '214201', 'BUNGA', NULL, ''),
(160, 4, '214202', 'SEWA', NULL, ''),
(161, 4, '214203', 'GAJI DAN HONOR', NULL, ''),
(162, 4, '214204', 'MAKAN DAN LEMBUR', NULL, ''),
(163, 4, '214205', 'LISTRIK', NULL, ''),
(164, 4, '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', NULL, ''),
(165, 4, '214207', 'TELEPON', NULL, ''),
(166, 4, '214208', 'SURAT KABAR/MAJALAH', NULL, ''),
(167, 4, '214209', 'KOMISI', NULL, ''),
(168, 4, '214210', 'BIAYA ADMINISTRASI BANK', NULL, ''),
(169, 4, '214211', 'PAJAK WAPU/WAJIB PUNGUT', NULL, ''),
(170, 4, '214212', 'JAMSOSTEK', NULL, ''),
(171, 4, '214213', 'PREMI DISTRIBUSI', NULL, ''),
(172, 4, '214214', 'ONGKOS ANGKUT', NULL, ''),
(173, 4, '214299', 'LAIN-LAIN', NULL, ''),
(174, 4, '215121', 'PPH PASAL 21', NULL, ''),
(175, 4, '215122', 'PPH PASAL 22', NULL, ''),
(176, 4, '215123', 'PPH PASAL 23', NULL, ''),
(177, 4, '215125', 'PPH PASAL 25', NULL, ''),
(178, 4, '215201', 'PPN KELUARAN', NULL, ''),
(179, 4, '215202', 'PPN EKS KEPPRES', NULL, ''),
(180, 4, '216101', 'HUTANG LEASING KENDARAAN', NULL, ''),
(181, 4, '219101', 'HUTANG DEVIDEN', NULL, ''),
(182, 4, '219199', 'LAIN-LAIN', NULL, ''),
(183, 4, '221101', 'BANK', NULL, ''),
(184, 4, '221201', 'BANK', NULL, ''),
(185, 4, '22210', 'HUTANG LEASING KENDARAAN', NULL, ''),
(186, 4, '223000', 'HUTANG PADA PEMEGANG SAHAM', NULL, ''),
(187, 4, '230000', 'HUTANG LAIN - LAIN', NULL, ''),
(188, 4, '240000', 'HUTANG YG. DISUBORDINASI', NULL, ''),
(189, 4, '250000', 'KEWAJIBAN BERSYARAT', NULL, ''),
(190, 5, '311101', 'TIDAK TERIKAT', NULL, ''),
(191, 5, '312101', 'TEMPORER...........', NULL, ''),
(192, 5, '312201', 'PERMANEN......', NULL, ''),
(193, 6, '411101', 'DANA DARI DONATUR', NULL, ''),
(194, 6, '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', NULL, ''),
(195, 6, '411103', 'DANA JOINING', NULL, ''),
(196, 6, '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', NULL, ''),
(197, 6, '411105', 'DANA STUDENT EXCHANGE', NULL, ''),
(198, 6, '411201', 'SUMBANGAN TERIKAT TEMPORER', NULL, ''),
(199, 6, '411202', 'SUMBANGAN TERIKAT PERMANEN', NULL, ''),
(200, 6, '412101', 'PENJUALAN FORMULIR + PSIKOTES', NULL, ''),
(201, 6, '412102', 'UANG KEG. EKSTRAKURIKULER', NULL, ''),
(202, 6, '412103', 'UANG PENDAFTARAN ULANG', NULL, ''),
(203, 6, '412104', 'UANG SEKOLAH', NULL, ''),
(204, 6, '412105', 'PENDAPATAN PENJUALAN SERAGAM', NULL, ''),
(205, 6, '412106', 'PENDAPATAN PENJUALAN BUKU', NULL, ''),
(206, 6, '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', NULL, ''),
(207, 6, '412108', 'PENDAPATAN LAIN-LAIN', NULL, ''),
(208, 6, '412109', 'PENDAPATAN LUNCH', NULL, ''),
(209, 6, '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', NULL, ''),
(210, 6, '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', NULL, ''),
(211, 6, '412112', 'PENDAPATAN CHECK POINT', NULL, ''),
(212, 6, '412113', 'PENDAPATAN UJIAN HSK', NULL, ''),
(213, 6, '412114', 'PENDAPATAN DAY CARE', NULL, ''),
(214, 6, '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', NULL, ''),
(215, 6, '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', NULL, ''),
(216, 6, '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', NULL, ''),
(217, 6, '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', NULL, ''),
(218, 6, '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', NULL, ''),
(219, 7, '511101', 'GAJI', NULL, ''),
(220, 7, '511102', 'HONOR', NULL, ''),
(221, 7, '511103', 'LEMBUR', NULL, ''),
(222, 7, '511104', 'PESANGON', NULL, ''),
(223, 7, '511105', 'UANG MAKAN', NULL, ''),
(224, 7, '511106', 'BONUS', NULL, ''),
(225, 7, '511107', 'TUNJANGAN HARI RAYA', NULL, ''),
(226, 7, '511108', 'PPH PASAL 21', NULL, ''),
(227, 7, '511109', 'KESEJAHTERAAN KARYAWAN', NULL, ''),
(228, 7, '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', NULL, ''),
(229, 7, '511111', 'JAMINAN KEMATIAN ( JKM )', NULL, ''),
(230, 7, '511112', 'JAMINAN HARI TUA ( JHT )', NULL, ''),
(231, 7, '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', NULL, ''),
(232, 7, '511114', 'TUNJANGAN DANA PENSIUN', NULL, ''),
(233, 7, '511115', 'TUNJANGAN KESEHATAN', NULL, ''),
(234, 7, '511116', 'TUNJANGAN TRANSPORT', NULL, ''),
(235, 7, '511117', 'JAMSOSTEK', NULL, ''),
(236, 7, '511119', 'PREMI ', NULL, ''),
(237, 7, '511199', 'TUNJANGAN LAIN-LAIN', NULL, ''),
(238, 7, '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', NULL, ''),
(239, 7, '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', NULL, ''),
(240, 7, '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', NULL, ''),
(241, 7, '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', NULL, ''),
(242, 7, '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', NULL, ''),
(243, 7, '512202', 'PENYUSUTAN KENDARAAN', NULL, ''),
(244, 7, '512203', 'PENYUSUTAN INVENTARIS', NULL, ''),
(245, 7, '512204', 'PENYUSUTAN INSTALASI', NULL, ''),
(246, 7, '512301', 'TRANSPORTASI ( BENSIN, TIKET )', NULL, ''),
(247, 7, '512302', 'MAKANAN & MINUMAN', NULL, ''),
(248, 7, '512303', 'PENGINAPAN', NULL, ''),
(249, 7, '512304', 'UANG SAKU', NULL, ''),
(250, 7, '512399', 'LAIN-LAIN ( PARKIR, TOL )', NULL, ''),
(251, 7, '512401', 'SEWA BANGUNAN', NULL, ''),
(252, 7, '512402', 'SEWA KENDARAAN', NULL, ''),
(253, 7, '512403', 'SEWA INVENTARIS KANTOR', NULL, ''),
(254, 7, '512451', 'ASURANSI BANGUNAN', NULL, ''),
(255, 7, '512452', 'ASURANSI KENDARAAN', NULL, ''),
(256, 7, '512453', 'ASURANSI INVENTARIS', NULL, ''),
(257, 7, '512501', 'TELEPON', NULL, ''),
(258, 7, '512502', 'TELEX', NULL, ''),
(259, 7, '512503', 'TELEGRAM', NULL, ''),
(260, 7, '512504', 'INTERLOKAL NON TELEPON INTERN', NULL, ''),
(261, 7, '512505', 'FACSIMILE', NULL, ''),
(262, 7, '512599', 'LAIN - LAIN', NULL, ''),
(263, 7, '512601', 'AIR', NULL, ''),
(264, 7, '512602', 'LISTRIK', NULL, ''),
(265, 7, '512603', 'ALAT-ALAT LISTRIK', NULL, ''),
(266, 7, '512701', 'AKUNTAN', NULL, ''),
(267, 7, '512702', 'NOTARIS', NULL, ''),
(268, 7, '512703', 'KONSULTAN', NULL, ''),
(269, 7, '512704', 'MANAGEMENT FEE', NULL, ''),
(270, 7, '512801', 'ADMINISTRASI BANK', NULL, ''),
(271, 7, '512802', 'BUKU CEK / BG', NULL, ''),
(272, 7, '512803', 'TRANSFER, KIRIM UANG , INKASO', NULL, ''),
(273, 7, '512804', 'PAJAK BUNGA BANK', NULL, ''),
(274, 7, '512901', 'BIAYA ADMINISTRASI KENDARAAN', NULL, ''),
(275, 7, '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', NULL, ''),
(276, 7, '512903', 'BIAYA BUNGA KREDIT BANK', NULL, ''),
(277, 7, '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', NULL, ''),
(278, 7, '513102', 'PERANGKO, MATERAI, KIRIM SURAT', NULL, ''),
(279, 7, '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', NULL, ''),
(280, 7, '513104', 'ALAT - ALAT PENGAJARAN ', NULL, ''),
(281, 7, '513105', 'PERLENGKAPAN KELAS', NULL, ''),
(282, 7, '513106', 'JASA PEMBELAJARAN', NULL, ''),
(283, 7, '513201', 'PERIJINAN', NULL, ''),
(284, 7, '513202', 'PAJAK - PAJAK DAERAH,PBB', NULL, ''),
(285, 7, '513203', 'STNK', NULL, ''),
(286, 7, '513211', 'RETRIBUSI SAMPAH', NULL, ''),
(287, 7, '513301', 'SUMBANGAN', NULL, ''),
(288, 7, '513302', 'ENTERTAINMENT', NULL, ''),
(289, 7, '513303', 'JAMUAN ', NULL, ''),
(290, 7, '513401', 'KEAMANAN', NULL, ''),
(291, 7, '513501', 'PENDAFTARAN', NULL, ''),
(292, 7, '513502', 'IURAN', NULL, ''),
(293, 7, '513601', 'BIAYA PENGOBATAN', NULL, ''),
(294, 7, '513701', 'MAKANAN DAN MINUMAN', NULL, ''),
(295, 7, '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', NULL, ''),
(296, 7, '513703', 'SERAGAM ', NULL, ''),
(297, 7, '513704', 'SEWA DISPENSER', NULL, ''),
(298, 7, '513705', 'OLAH RAGA DAN KESENIAN', NULL, ''),
(299, 7, '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', NULL, ''),
(300, 7, '513707', 'BUKU, VCD', NULL, ''),
(301, 7, '513708', 'ATRIBUT SEKOLAH', NULL, ''),
(302, 7, '513709', 'BIAYA PSIKOTES', NULL, ''),
(303, 7, '513710', 'BIAYA ADVERTENSI ( IKLAN )', NULL, ''),
(304, 7, '513711', 'BIAYA STUDY TOUR', NULL, ''),
(305, 7, '513712', 'BIAYA PERLOMBAAN & PERAYAAN', NULL, ''),
(306, 7, '513713', 'STIKER U/ MURID', NULL, ''),
(307, 7, '513714', 'BIAYA TES KESEHATAN', NULL, ''),
(308, 7, '513715', 'BIAYA KOMISI PENGEMBANGAN', NULL, ''),
(309, 7, '513716', 'BIAYA PAMERAN', NULL, ''),
(310, 7, '513799', 'LAIN - LAIN', NULL, ''),
(311, 7, '513801', 'KANTIN', NULL, ''),
(312, 7, '513802', 'DAPUR', NULL, ''),
(313, 7, '513803', 'BIAYA KEBERSIHAN', NULL, ''),
(314, 7, '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', NULL, ''),
(315, 7, '513805', 'JASA CLEANING SERVICE', NULL, ''),
(316, 7, '513806', '', NULL, ''),
(317, 7, '513807', 'BIAYA MESS', NULL, ''),
(318, 7, '513901', 'SELAMATAN', NULL, ''),
(319, 7, '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', NULL, ''),
(320, 7, '513903', 'DENDA PAJAK', NULL, ''),
(321, 7, '513904', 'KOREKSI TAHUN LALU', NULL, ''),
(322, 7, '513998', 'LAIN - LAIN (SELISIH KURS)', NULL, ''),
(323, 7, '513999', 'LAIN - LAIN (SELISIH KAS)', NULL, ''),
(324, 7, '514001', 'TRANSPORT', NULL, ''),
(325, 7, '514002', 'MAKAN & MINUM (RAPAT)', NULL, ''),
(326, 7, '514099', 'LAIN-LAIN', NULL, ''),
(327, 7, '514101', 'BUKU', NULL, ''),
(328, 7, '514102', 'VCD', NULL, ''),
(329, 7, '514103', 'SERAGAM ', NULL, ''),
(330, 7, '514104', 'ATRIBUT SEKOLAH', NULL, ''),
(331, 7, '514105', 'BIAYA PSIKOTES', NULL, ''),
(332, 7, '514106', 'BIAYA STUDY TOUR/FIELD TRIP', NULL, ''),
(333, 7, '514107', 'BIAYA PERLOMBAAN ', NULL, ''),
(334, 7, '514108', 'EKSTRAKURIKULER', NULL, ''),
(335, 7, '514109', 'BIAYA STUDENT EXCHANGE', NULL, ''),
(336, 7, '514110', 'BIAYA CHECK POINT', NULL, ''),
(337, 7, '514199', 'LAIN - LAIN', NULL, ''),
(340, 1, '111109', 'test rekening dua x', '5500000', 'keterangan tes dua');

-- --------------------------------------------------------

--
-- Table structure for table `keu_rekeningbiaya`
--

DROP TABLE IF EXISTS `keu_rekeningbiaya`;
CREATE TABLE IF NOT EXISTS `keu_rekeningbiaya` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `biaya` int(11) NOT NULL,
  `departemen` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `biaya` (`biaya`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `departemen` (`departemen`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `keu_rekeningbiaya`
--

INSERT INTO `keu_rekeningbiaya` (`replid`, `biaya`, `departemen`, `tahunajaran`) VALUES
(1, 3, 1, 3),
(2, 3, 1, 5),
(3, 3, 1, 12),
(4, 3, 2, 3),
(5, 3, 2, 5),
(6, 3, 2, 12),
(7, 3, 3, 3),
(8, 3, 3, 5),
(9, 3, 3, 12),
(10, 4, 1, 3),
(11, 4, 1, 5),
(12, 4, 1, 12),
(13, 4, 2, 3),
(14, 4, 2, 5),
(15, 4, 2, 12),
(16, 4, 3, 3),
(17, 4, 3, 5),
(18, 4, 3, 12),
(19, 7, 1, 3),
(20, 7, 1, 5),
(21, 7, 1, 12),
(22, 7, 2, 3),
(23, 7, 2, 5),
(24, 7, 2, 12),
(25, 7, 3, 3),
(26, 7, 3, 5),
(27, 7, 3, 12),
(28, 8, 1, 3),
(29, 8, 1, 5),
(30, 8, 1, 12),
(31, 8, 2, 3),
(32, 8, 2, 5),
(33, 8, 2, 12),
(34, 8, 3, 3),
(35, 8, 3, 5),
(36, 8, 3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `keu_saldorekening`
--

DROP TABLE IF EXISTS `keu_saldorekening`;
CREATE TABLE IF NOT EXISTS `keu_saldorekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilrekening` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2207 ;

--
-- Dumping data for table `keu_saldorekening`
--

INSERT INTO `keu_saldorekening` (`replid`, `detilrekening`, `tahunajaran`, `nominal`) VALUES
(1184, 1, 3, 1000000),
(1185, 1, 5, 1000000),
(1186, 1, 12, 10000009),
(1187, 2, 3, 1000000),
(1188, 2, 5, 1000000),
(1189, 2, 12, 1000000),
(1190, 3, 3, 1000000),
(1191, 3, 5, 1000000),
(1192, 3, 12, 1000000),
(1193, 4, 3, 1000000),
(1194, 4, 5, 1000000),
(1195, 4, 12, 1000000),
(1196, 5, 3, 1000000),
(1197, 5, 5, 1000000),
(1198, 5, 12, 1000000),
(1199, 6, 3, 1000000),
(1200, 6, 5, 1000000),
(1201, 6, 12, 1000000),
(1202, 7, 3, 1000000),
(1203, 7, 5, 1000000),
(1204, 7, 12, 1000000),
(1205, 8, 3, 1000000),
(1206, 8, 5, 1000000),
(1207, 8, 12, 1000000),
(1208, 9, 3, 1000000),
(1209, 9, 5, 1000000),
(1210, 9, 12, 1000000),
(1211, 10, 3, 1000000),
(1212, 10, 5, 1000000),
(1213, 10, 12, 1000000),
(1214, 11, 3, 1000000),
(1215, 11, 5, 1000000),
(1216, 11, 12, 1000000),
(1217, 12, 3, 1000000),
(1218, 12, 5, 1000000),
(1219, 12, 12, 1000000),
(1220, 13, 3, 1000000),
(1221, 13, 5, 1000000),
(1222, 13, 12, 1000000),
(1223, 14, 3, 1000000),
(1224, 14, 5, 1000000),
(1225, 14, 12, 1000000),
(1226, 15, 3, 1000000),
(1227, 15, 5, 1000000),
(1228, 15, 12, 1000000),
(1229, 16, 3, 1000000),
(1230, 16, 5, 1000000),
(1231, 16, 12, 1000000),
(1232, 17, 3, 1000000),
(1233, 17, 5, 1000000),
(1234, 17, 12, 1000000),
(1235, 18, 3, 1000000),
(1236, 18, 5, 1000000),
(1237, 18, 12, 1000000),
(1238, 19, 3, 1000000),
(1239, 19, 5, 1000000),
(1240, 19, 12, 1000000),
(1241, 20, 3, 1000000),
(1242, 20, 5, 1000000),
(1243, 20, 12, 1000000),
(1244, 21, 3, 1000000),
(1245, 21, 5, 1000000),
(1246, 21, 12, 1000000),
(1247, 22, 3, 1000000),
(1248, 22, 5, 1000000),
(1249, 22, 12, 1000000),
(1250, 23, 3, 1000000),
(1251, 23, 5, 1000000),
(1252, 23, 12, 1000000),
(1253, 24, 3, 1000000),
(1254, 24, 5, 1000000),
(1255, 24, 12, 1000000),
(1256, 25, 3, 1000000),
(1257, 25, 5, 1000000),
(1258, 25, 12, 1000000),
(1259, 26, 3, 1000000),
(1260, 26, 5, 1000000),
(1261, 26, 12, 1000000),
(1262, 27, 3, 1000000),
(1263, 27, 5, 1000000),
(1264, 27, 12, 1000000),
(1265, 28, 3, 1000000),
(1266, 28, 5, 1000000),
(1267, 28, 12, 1000000),
(1268, 29, 3, 1000000),
(1269, 29, 5, 1000000),
(1270, 29, 12, 1000000),
(1271, 30, 3, 1000000),
(1272, 30, 5, 1000000),
(1273, 30, 12, 1000000),
(1274, 31, 3, 1000000),
(1275, 31, 5, 1000000),
(1276, 31, 12, 1000000),
(1277, 32, 3, 1000000),
(1278, 32, 5, 1000000),
(1279, 32, 12, 1000000),
(1280, 33, 3, 1000000),
(1281, 33, 5, 1000000),
(1282, 33, 12, 1000000),
(1283, 34, 3, 1000000),
(1284, 34, 5, 1000000),
(1285, 34, 12, 1000000),
(1286, 35, 3, 1000000),
(1287, 35, 5, 1000000),
(1288, 35, 12, 1000000),
(1289, 36, 3, 1000000),
(1290, 36, 5, 1000000),
(1291, 36, 12, 1000000),
(1292, 37, 3, 1000000),
(1293, 37, 5, 1000000),
(1294, 37, 12, 1000000),
(1295, 38, 3, 1000000),
(1296, 38, 5, 1000000),
(1297, 38, 12, 1000000),
(1298, 39, 3, 1000000),
(1299, 39, 5, 1000000),
(1300, 39, 12, 1000000),
(1301, 40, 3, 1000000),
(1302, 40, 5, 1000000),
(1303, 40, 12, 1000000),
(1304, 41, 3, 1000000),
(1305, 41, 5, 1000000),
(1306, 41, 12, 1000000),
(1307, 42, 3, 1000000),
(1308, 42, 5, 1000000),
(1309, 42, 12, 1000000),
(1310, 43, 3, 1000000),
(1311, 43, 5, 1000000),
(1312, 43, 12, 1000000),
(1313, 44, 3, 1000000),
(1314, 44, 5, 1000000),
(1315, 44, 12, 1000000),
(1316, 45, 3, 1000000),
(1317, 45, 5, 1000000),
(1318, 45, 12, 1000000),
(1319, 46, 3, 1000000),
(1320, 46, 5, 1000000),
(1321, 46, 12, 1000000),
(1322, 47, 3, 1000000),
(1323, 47, 5, 1000000),
(1324, 47, 12, 1000000),
(1325, 48, 3, 1000000),
(1326, 48, 5, 1000000),
(1327, 48, 12, 1000000),
(1328, 49, 3, 1000000),
(1329, 49, 5, 1000000),
(1330, 49, 12, 1000000),
(1331, 50, 3, 1000000),
(1332, 50, 5, 1000000),
(1333, 50, 12, 1000000),
(1334, 51, 3, 1000000),
(1335, 51, 5, 1000000),
(1336, 51, 12, 1000000),
(1337, 52, 3, 1000000),
(1338, 52, 5, 1000000),
(1339, 52, 12, 1000000),
(1340, 53, 3, 1000000),
(1341, 53, 5, 1000000),
(1342, 53, 12, 1000000),
(1343, 54, 3, 1000000),
(1344, 54, 5, 1000000),
(1345, 54, 12, 1000000),
(1346, 55, 3, 1000000),
(1347, 55, 5, 1000000),
(1348, 55, 12, 1000000),
(1349, 56, 3, 1000000),
(1350, 56, 5, 1000000),
(1351, 56, 12, 1000000),
(1352, 57, 3, 1000000),
(1353, 57, 5, 1000000),
(1354, 57, 12, 1000000),
(1355, 58, 3, 1000000),
(1356, 58, 5, 1000000),
(1357, 58, 12, 1000000),
(1358, 59, 3, 1000000),
(1359, 59, 5, 1000000),
(1360, 59, 12, 1000000),
(1361, 60, 3, 1000000),
(1362, 60, 5, 1000000),
(1363, 60, 12, 1000000),
(1364, 61, 3, 1000000),
(1365, 61, 5, 1000000),
(1366, 61, 12, 1000000),
(1367, 62, 3, 1000000),
(1368, 62, 5, 1000000),
(1369, 62, 12, 1000000),
(1370, 63, 3, 1000000),
(1371, 63, 5, 1000000),
(1372, 63, 12, 1000000),
(1373, 64, 3, 1000000),
(1374, 64, 5, 1000000),
(1375, 64, 12, 1000000),
(1376, 65, 3, 1000000),
(1377, 65, 5, 1000000),
(1378, 65, 12, 1000000),
(1379, 66, 3, 1000000),
(1380, 66, 5, 1000000),
(1381, 66, 12, 1000000),
(1382, 67, 3, 1000000),
(1383, 67, 5, 1000000),
(1384, 67, 12, 1000000),
(1385, 68, 3, 1000000),
(1386, 68, 5, 1000000),
(1387, 68, 12, 1000000),
(1388, 69, 3, 1000000),
(1389, 69, 5, 1000000),
(1390, 69, 12, 1000000),
(1391, 70, 3, 1000000),
(1392, 70, 5, 1000000),
(1393, 70, 12, 1000000),
(1394, 71, 3, 1000000),
(1395, 71, 5, 1000000),
(1396, 71, 12, 1000000),
(1397, 72, 3, 1000000),
(1398, 72, 5, 1000000),
(1399, 72, 12, 1000000),
(1400, 73, 3, 1000000),
(1401, 73, 5, 1000000),
(1402, 73, 12, 1000000),
(1403, 74, 3, 1000000),
(1404, 74, 5, 1000000),
(1405, 74, 12, 1000000),
(1406, 75, 3, 1000000),
(1407, 75, 5, 1000000),
(1408, 75, 12, 1000000),
(1409, 76, 3, 1000000),
(1410, 76, 5, 1000000),
(1411, 76, 12, 1000000),
(1412, 77, 3, 1000000),
(1413, 77, 5, 1000000),
(1414, 77, 12, 1000000),
(1415, 78, 3, 1000000),
(1416, 78, 5, 1000000),
(1417, 78, 12, 1000000),
(1418, 79, 3, 1000000),
(1419, 79, 5, 1000000),
(1420, 79, 12, 1000000),
(1421, 80, 3, 1000000),
(1422, 80, 5, 1000000),
(1423, 80, 12, 1000000),
(1424, 81, 3, 1000000),
(1425, 81, 5, 1000000),
(1426, 81, 12, 1000000),
(1427, 82, 3, 1000000),
(1428, 82, 5, 1000000),
(1429, 82, 12, 1000000),
(1430, 83, 3, 1000000),
(1431, 83, 5, 1000000),
(1432, 83, 12, 1000000),
(1433, 84, 3, 1000000),
(1434, 84, 5, 1000000),
(1435, 84, 12, 1000000),
(1436, 85, 3, 1000000),
(1437, 85, 5, 1000000),
(1438, 85, 12, 1000000),
(1439, 86, 3, 1000000),
(1440, 86, 5, 1000000),
(1441, 86, 12, 1000000),
(1442, 87, 3, 1000000),
(1443, 87, 5, 1000000),
(1444, 87, 12, 1000000),
(1445, 88, 3, 1000000),
(1446, 88, 5, 1000000),
(1447, 88, 12, 1000000),
(1448, 89, 3, 1000000),
(1449, 89, 5, 1000000),
(1450, 89, 12, 1000000),
(1451, 90, 3, 1000000),
(1452, 90, 5, 1000000),
(1453, 90, 12, 1000000),
(1454, 91, 3, 1000000),
(1455, 91, 5, 1000000),
(1456, 91, 12, 1000000),
(1457, 92, 3, 1000000),
(1458, 92, 5, 1000000),
(1459, 92, 12, 1000000),
(1460, 93, 3, 1000000),
(1461, 93, 5, 1000000),
(1462, 93, 12, 1000000),
(1463, 94, 3, 1000000),
(1464, 94, 5, 1000000),
(1465, 94, 12, 1000000),
(1466, 95, 3, 1000000),
(1467, 95, 5, 1000000),
(1468, 95, 12, 1000000),
(1469, 96, 3, 1000000),
(1470, 96, 5, 1000000),
(1471, 96, 12, 1000000),
(1472, 97, 3, 1000000),
(1473, 97, 5, 1000000),
(1474, 97, 12, 1000000),
(1475, 98, 3, 1000000),
(1476, 98, 5, 1000000),
(1477, 98, 12, 1000000),
(1478, 99, 3, 1000000),
(1479, 99, 5, 1000000),
(1480, 99, 12, 1000000),
(1481, 100, 3, 1000000),
(1482, 100, 5, 1000000),
(1483, 100, 12, 1000000),
(1484, 101, 3, 1000000),
(1485, 101, 5, 1000000),
(1486, 101, 12, 1000000),
(1487, 102, 3, 1000000),
(1488, 102, 5, 1000000),
(1489, 102, 12, 1000000),
(1490, 103, 3, 1000000),
(1491, 103, 5, 1000000),
(1492, 103, 12, 1000000),
(1493, 104, 3, 1000000),
(1494, 104, 5, 1000000),
(1495, 104, 12, 1000000),
(1496, 105, 3, 1000000),
(1497, 105, 5, 1000000),
(1498, 105, 12, 1000000),
(1499, 106, 3, 1000000),
(1500, 106, 5, 1000000),
(1501, 106, 12, 1000000),
(1502, 107, 3, 1000000),
(1503, 107, 5, 1000000),
(1504, 107, 12, 1000000),
(1505, 108, 3, 1000000),
(1506, 108, 5, 1000000),
(1507, 108, 12, 1000000),
(1508, 109, 3, 1000000),
(1509, 109, 5, 1000000),
(1510, 109, 12, 1000000),
(1511, 110, 3, 1000000),
(1512, 110, 5, 1000000),
(1513, 110, 12, 1000000),
(1514, 111, 3, 1000000),
(1515, 111, 5, 1000000),
(1516, 111, 12, 1000000),
(1517, 112, 3, 1000000),
(1518, 112, 5, 1000000),
(1519, 112, 12, 1000000),
(1520, 113, 3, 1000000),
(1521, 113, 5, 1000000),
(1522, 113, 12, 1000000),
(1523, 114, 3, 1000000),
(1524, 114, 5, 1000000),
(1525, 114, 12, 1000000),
(1526, 115, 3, 1000000),
(1527, 115, 5, 1000000),
(1528, 115, 12, 1000000),
(1529, 116, 3, 1000000),
(1530, 116, 5, 1000000),
(1531, 116, 12, 1000000),
(1532, 117, 3, 1000000),
(1533, 117, 5, 1000000),
(1534, 117, 12, 1000000),
(1535, 118, 3, 1000000),
(1536, 118, 5, 1000000),
(1537, 118, 12, 1000000),
(1538, 119, 3, 1000000),
(1539, 119, 5, 1000000),
(1540, 119, 12, 1000000),
(1541, 120, 3, 1000000),
(1542, 120, 5, 1000000),
(1543, 120, 12, 1000000),
(1544, 121, 3, 1000000),
(1545, 121, 5, 1000000),
(1546, 121, 12, 1000000),
(1547, 122, 3, 1000000),
(1548, 122, 5, 1000000),
(1549, 122, 12, 1000000),
(1550, 123, 3, 1000000),
(1551, 123, 5, 1000000),
(1552, 123, 12, 1000000),
(1553, 124, 3, 1000000),
(1554, 124, 5, 1000000),
(1555, 124, 12, 1000000),
(1556, 125, 3, 1000000),
(1557, 125, 5, 1000000),
(1558, 125, 12, 1000000),
(1559, 126, 3, 1000000),
(1560, 126, 5, 1000000),
(1561, 126, 12, 1000000),
(1562, 127, 3, 1000000),
(1563, 127, 5, 1000000),
(1564, 127, 12, 1000000),
(1565, 128, 3, 1000000),
(1566, 128, 5, 1000000),
(1567, 128, 12, 1000000),
(1568, 129, 3, 1000000),
(1569, 129, 5, 1000000),
(1570, 129, 12, 1000000),
(1571, 130, 3, 1000000),
(1572, 130, 5, 1000000),
(1573, 130, 12, 1000000),
(1574, 131, 3, 1000000),
(1575, 131, 5, 1000000),
(1576, 131, 12, 1000000),
(1577, 132, 3, 1000000),
(1578, 132, 5, 1000000),
(1579, 132, 12, 1000000),
(1580, 133, 3, 1000000),
(1581, 133, 5, 1000000),
(1582, 133, 12, 1000000),
(1583, 134, 3, 1000000),
(1584, 134, 5, 1000000),
(1585, 134, 12, 1000000),
(1586, 135, 3, 1000000),
(1587, 135, 5, 1000000),
(1588, 135, 12, 1000000),
(1589, 136, 3, 1000000),
(1590, 136, 5, 1000000),
(1591, 136, 12, 1000000),
(1592, 137, 3, 1000000),
(1593, 137, 5, 1000000),
(1594, 137, 12, 1000000),
(1595, 138, 3, 1000000),
(1596, 138, 5, 1000000),
(1597, 138, 12, 1000000),
(1598, 139, 3, 1000000),
(1599, 139, 5, 1000000),
(1600, 139, 12, 1000000),
(1601, 140, 3, 1000000),
(1602, 140, 5, 1000000),
(1603, 140, 12, 1000000),
(1604, 141, 3, 1000000),
(1605, 141, 5, 1000000),
(1606, 141, 12, 1000000),
(1607, 142, 3, 1000000),
(1608, 142, 5, 1000000),
(1609, 142, 12, 1000000),
(1610, 143, 3, 1000000),
(1611, 143, 5, 1000000),
(1612, 143, 12, 1000000),
(1613, 144, 3, 1000000),
(1614, 144, 5, 1000000),
(1615, 144, 12, 1000000),
(1616, 145, 3, 1000000),
(1617, 145, 5, 1000000),
(1618, 145, 12, 1000000),
(1619, 146, 3, 1000000),
(1620, 146, 5, 1000000),
(1621, 146, 12, 1000000),
(1622, 147, 3, 1000000),
(1623, 147, 5, 1000000),
(1624, 147, 12, 1000000),
(1625, 148, 3, 1000000),
(1626, 148, 5, 1000000),
(1627, 148, 12, 1000000),
(1628, 149, 3, 1000000),
(1629, 149, 5, 1000000),
(1630, 149, 12, 1000000),
(1631, 150, 3, 1000000),
(1632, 150, 5, 1000000),
(1633, 150, 12, 1000000),
(1634, 151, 3, 1000000),
(1635, 151, 5, 1000000),
(1636, 151, 12, 1000000),
(1637, 152, 3, 1000000),
(1638, 152, 5, 1000000),
(1639, 152, 12, 1000000),
(1640, 153, 3, 1000000),
(1641, 153, 5, 1000000),
(1642, 153, 12, 1000000),
(1643, 154, 3, 1000000),
(1644, 154, 5, 1000000),
(1645, 154, 12, 1000000),
(1646, 155, 3, 1000000),
(1647, 155, 5, 1000000),
(1648, 155, 12, 1000000),
(1649, 156, 3, 1000000),
(1650, 156, 5, 1000000),
(1651, 156, 12, 1000000),
(1652, 157, 3, 1000000),
(1653, 157, 5, 1000000),
(1654, 157, 12, 1000000),
(1655, 158, 3, 1000000),
(1656, 158, 5, 1000000),
(1657, 158, 12, 1000000),
(1658, 159, 3, 1000000),
(1659, 159, 5, 1000000),
(1660, 159, 12, 1000000),
(1661, 160, 3, 1000000),
(1662, 160, 5, 1000000),
(1663, 160, 12, 1000000),
(1664, 161, 3, 1000000),
(1665, 161, 5, 1000000),
(1666, 161, 12, 1000000),
(1667, 162, 3, 1000000),
(1668, 162, 5, 1000000),
(1669, 162, 12, 1000000),
(1670, 163, 3, 1000000),
(1671, 163, 5, 1000000),
(1672, 163, 12, 1000000),
(1673, 164, 3, 1000000),
(1674, 164, 5, 1000000),
(1675, 164, 12, 1000000),
(1676, 165, 3, 1000000),
(1677, 165, 5, 1000000),
(1678, 165, 12, 1000000),
(1679, 166, 3, 1000000),
(1680, 166, 5, 1000000),
(1681, 166, 12, 1000000),
(1682, 167, 3, 1000000),
(1683, 167, 5, 1000000),
(1684, 167, 12, 1000000),
(1685, 168, 3, 1000000),
(1686, 168, 5, 1000000),
(1687, 168, 12, 1000000),
(1688, 169, 3, 1000000),
(1689, 169, 5, 1000000),
(1690, 169, 12, 1000000),
(1691, 170, 3, 1000000),
(1692, 170, 5, 1000000),
(1693, 170, 12, 1000000),
(1694, 171, 3, 1000000),
(1695, 171, 5, 1000000),
(1696, 171, 12, 1000000),
(1697, 172, 3, 1000000),
(1698, 172, 5, 1000000),
(1699, 172, 12, 1000000),
(1700, 173, 3, 1000000),
(1701, 173, 5, 1000000),
(1702, 173, 12, 1000000),
(1703, 174, 3, 1000000),
(1704, 174, 5, 1000000),
(1705, 174, 12, 1000000),
(1706, 175, 3, 1000000),
(1707, 175, 5, 1000000),
(1708, 175, 12, 1000000),
(1709, 176, 3, 1000000),
(1710, 176, 5, 1000000),
(1711, 176, 12, 1000000),
(1712, 177, 3, 1000000),
(1713, 177, 5, 1000000),
(1714, 177, 12, 1000000),
(1715, 178, 3, 1000000),
(1716, 178, 5, 1000000),
(1717, 178, 12, 1000000),
(1718, 179, 3, 1000000),
(1719, 179, 5, 1000000),
(1720, 179, 12, 1000000),
(1721, 180, 3, 1000000),
(1722, 180, 5, 1000000),
(1723, 180, 12, 1000000),
(1724, 181, 3, 1000000),
(1725, 181, 5, 1000000),
(1726, 181, 12, 1000000),
(1727, 182, 3, 1000000),
(1728, 182, 5, 1000000),
(1729, 182, 12, 1000000),
(1730, 183, 3, 1000000),
(1731, 183, 5, 1000000),
(1732, 183, 12, 1000000),
(1733, 184, 3, 1000000),
(1734, 184, 5, 1000000),
(1735, 184, 12, 1000000),
(1736, 185, 3, 1000000),
(1737, 185, 5, 1000000),
(1738, 185, 12, 1000000),
(1739, 186, 3, 1000000),
(1740, 186, 5, 1000000),
(1741, 186, 12, 1000000),
(1742, 187, 3, 1000000),
(1743, 187, 5, 1000000),
(1744, 187, 12, 1000000),
(1745, 188, 3, 1000000),
(1746, 188, 5, 1000000),
(1747, 188, 12, 1000000),
(1748, 189, 3, 1000000),
(1749, 189, 5, 1000000),
(1750, 189, 12, 1000000),
(1751, 190, 3, 1000000),
(1752, 190, 5, 1000000),
(1753, 190, 12, 1000000),
(1754, 191, 3, 1000000),
(1755, 191, 5, 1000000),
(1756, 191, 12, 1000000),
(1757, 192, 3, 1000000),
(1758, 192, 5, 1000000),
(1759, 192, 12, 1000000),
(1760, 193, 3, 1000000),
(1761, 193, 5, 1000000),
(1762, 193, 12, 1000000),
(1763, 194, 3, 1000000),
(1764, 194, 5, 1000000),
(1765, 194, 12, 1000000),
(1766, 195, 3, 1000000),
(1767, 195, 5, 1000000),
(1768, 195, 12, 1000000),
(1769, 196, 3, 1000000),
(1770, 196, 5, 1000000),
(1771, 196, 12, 1000000),
(1772, 197, 3, 1000000),
(1773, 197, 5, 1000000),
(1774, 197, 12, 1000000),
(1775, 198, 3, 1000000),
(1776, 198, 5, 1000000),
(1777, 198, 12, 1000000),
(1778, 199, 3, 1000000),
(1779, 199, 5, 1000000),
(1780, 199, 12, 1000000),
(1781, 200, 3, 1000000),
(1782, 200, 5, 1000000),
(1783, 200, 12, 1000000),
(1784, 201, 3, 1000000),
(1785, 201, 5, 1000000),
(1786, 201, 12, 1000000),
(1787, 202, 3, 1000000),
(1788, 202, 5, 1000000),
(1789, 202, 12, 1000000),
(1790, 203, 3, 1000000),
(1791, 203, 5, 1000000),
(1792, 203, 12, 1000000),
(1793, 204, 3, 1000000),
(1794, 204, 5, 1000000),
(1795, 204, 12, 1000000),
(1796, 205, 3, 1000000),
(1797, 205, 5, 1000000),
(1798, 205, 12, 1000000),
(1799, 206, 3, 1000000),
(1800, 206, 5, 1000000),
(1801, 206, 12, 1000000),
(1802, 207, 3, 1000000),
(1803, 207, 5, 1000000),
(1804, 207, 12, 1000000),
(1805, 208, 3, 1000000),
(1806, 208, 5, 1000000),
(1807, 208, 12, 1000000),
(1808, 209, 3, 1000000),
(1809, 209, 5, 1000000),
(1810, 209, 12, 1000000),
(1811, 210, 3, 1000000),
(1812, 210, 5, 1000000),
(1813, 210, 12, 1000000),
(1814, 211, 3, 1000000),
(1815, 211, 5, 1000000),
(1816, 211, 12, 1000000),
(1817, 212, 3, 1000000),
(1818, 212, 5, 1000000),
(1819, 212, 12, 1000000),
(1820, 213, 3, 1000000),
(1821, 213, 5, 1000000),
(1822, 213, 12, 1000000),
(1823, 214, 3, 1000000),
(1824, 214, 5, 1000000),
(1825, 214, 12, 1000000),
(1826, 215, 3, 1000000),
(1827, 215, 5, 1000000),
(1828, 215, 12, 1000000),
(1829, 216, 3, 1000000),
(1830, 216, 5, 1000000),
(1831, 216, 12, 1000000),
(1832, 217, 3, 1000000),
(1833, 217, 5, 1000000),
(1834, 217, 12, 1000000),
(1835, 218, 3, 1000000),
(1836, 218, 5, 1000000),
(1837, 218, 12, 1000000),
(1838, 219, 3, 1000000),
(1839, 219, 5, 1000000),
(1840, 219, 12, 1000000),
(1841, 220, 3, 1000000),
(1842, 220, 5, 1000000),
(1843, 220, 12, 1000000),
(1844, 221, 3, 1000000),
(1845, 221, 5, 1000000),
(1846, 221, 12, 1000000),
(1847, 222, 3, 1000000),
(1848, 222, 5, 1000000),
(1849, 222, 12, 1000000),
(1850, 223, 3, 1000000),
(1851, 223, 5, 1000000),
(1852, 223, 12, 1000000),
(1853, 224, 3, 1000000),
(1854, 224, 5, 1000000),
(1855, 224, 12, 1000000),
(1856, 225, 3, 1000000),
(1857, 225, 5, 1000000),
(1858, 225, 12, 1000000),
(1859, 226, 3, 1000000),
(1860, 226, 5, 1000000),
(1861, 226, 12, 1000000),
(1862, 227, 3, 1000000),
(1863, 227, 5, 1000000),
(1864, 227, 12, 1000000),
(1865, 228, 3, 1000000),
(1866, 228, 5, 1000000),
(1867, 228, 12, 1000000),
(1868, 229, 3, 1000000),
(1869, 229, 5, 1000000),
(1870, 229, 12, 1000000),
(1871, 230, 3, 1000000),
(1872, 230, 5, 1000000),
(1873, 230, 12, 1000000),
(1874, 231, 3, 1000000),
(1875, 231, 5, 1000000),
(1876, 231, 12, 1000000),
(1877, 232, 3, 1000000),
(1878, 232, 5, 1000000),
(1879, 232, 12, 1000000),
(1880, 233, 3, 1000000),
(1881, 233, 5, 1000000),
(1882, 233, 12, 1000000),
(1883, 234, 3, 1000000),
(1884, 234, 5, 1000000),
(1885, 234, 12, 1000000),
(1886, 235, 3, 1000000),
(1887, 235, 5, 1000000),
(1888, 235, 12, 1000000),
(1889, 236, 3, 1000000),
(1890, 236, 5, 1000000),
(1891, 236, 12, 1000000),
(1892, 237, 3, 1000000),
(1893, 237, 5, 1000000),
(1894, 237, 12, 1000000),
(1895, 238, 3, 1000000),
(1896, 238, 5, 1000000),
(1897, 238, 12, 1000000),
(1898, 239, 3, 1000000),
(1899, 239, 5, 1000000),
(1900, 239, 12, 1000000),
(1901, 240, 3, 1000000),
(1902, 240, 5, 1000000),
(1903, 240, 12, 1000000),
(1904, 241, 3, 1000000),
(1905, 241, 5, 1000000),
(1906, 241, 12, 1000000),
(1907, 242, 3, 1000000),
(1908, 242, 5, 1000000),
(1909, 242, 12, 1000000),
(1910, 243, 3, 1000000),
(1911, 243, 5, 1000000),
(1912, 243, 12, 1000000),
(1913, 244, 3, 1000000),
(1914, 244, 5, 1000000),
(1915, 244, 12, 1000000),
(1916, 245, 3, 1000000),
(1917, 245, 5, 1000000),
(1918, 245, 12, 1000000),
(1919, 246, 3, 1000000),
(1920, 246, 5, 1000000),
(1921, 246, 12, 1000000),
(1922, 247, 3, 1000000),
(1923, 247, 5, 1000000),
(1924, 247, 12, 1000000),
(1925, 248, 3, 1000000),
(1926, 248, 5, 1000000),
(1927, 248, 12, 1000000),
(1928, 249, 3, 1000000),
(1929, 249, 5, 1000000),
(1930, 249, 12, 1000000),
(1931, 250, 3, 1000000),
(1932, 250, 5, 1000000),
(1933, 250, 12, 1000000),
(1934, 251, 3, 1000000),
(1935, 251, 5, 1000000),
(1936, 251, 12, 1000000),
(1937, 252, 3, 1000000),
(1938, 252, 5, 1000000),
(1939, 252, 12, 1000000),
(1940, 253, 3, 1000000),
(1941, 253, 5, 1000000),
(1942, 253, 12, 1000000),
(1943, 254, 3, 1000000),
(1944, 254, 5, 1000000),
(1945, 254, 12, 1000000),
(1946, 255, 3, 1000000),
(1947, 255, 5, 1000000),
(1948, 255, 12, 1000000),
(1949, 256, 3, 1000000),
(1950, 256, 5, 1000000),
(1951, 256, 12, 1000000),
(1952, 257, 3, 1000000),
(1953, 257, 5, 1000000),
(1954, 257, 12, 1000000),
(1955, 258, 3, 1000000),
(1956, 258, 5, 1000000),
(1957, 258, 12, 1000000),
(1958, 259, 3, 1000000),
(1959, 259, 5, 1000000),
(1960, 259, 12, 1000000),
(1961, 260, 3, 1000000),
(1962, 260, 5, 1000000),
(1963, 260, 12, 1000000),
(1964, 261, 3, 1000000),
(1965, 261, 5, 1000000),
(1966, 261, 12, 1000000),
(1967, 262, 3, 1000000),
(1968, 262, 5, 1000000),
(1969, 262, 12, 1000000),
(1970, 263, 3, 1000000),
(1971, 263, 5, 1000000),
(1972, 263, 12, 1000000),
(1973, 264, 3, 1000000),
(1974, 264, 5, 1000000),
(1975, 264, 12, 1000000),
(1976, 265, 3, 1000000),
(1977, 265, 5, 1000000),
(1978, 265, 12, 1000000),
(1979, 266, 3, 1000000),
(1980, 266, 5, 1000000),
(1981, 266, 12, 1000000),
(1982, 267, 3, 1000000),
(1983, 267, 5, 1000000),
(1984, 267, 12, 1000000),
(1985, 268, 3, 1000000),
(1986, 268, 5, 1000000),
(1987, 268, 12, 1000000),
(1988, 269, 3, 1000000),
(1989, 269, 5, 1000000),
(1990, 269, 12, 1000000),
(1991, 270, 3, 1000000),
(1992, 270, 5, 1000000),
(1993, 270, 12, 1000000),
(1994, 271, 3, 1000000),
(1995, 271, 5, 1000000),
(1996, 271, 12, 1000000),
(1997, 272, 3, 1000000),
(1998, 272, 5, 1000000),
(1999, 272, 12, 1000000),
(2000, 273, 3, 1000000),
(2001, 273, 5, 1000000),
(2002, 273, 12, 1000000),
(2003, 274, 3, 1000000),
(2004, 274, 5, 1000000),
(2005, 274, 12, 1000000),
(2006, 275, 3, 1000000),
(2007, 275, 5, 1000000),
(2008, 275, 12, 1000000),
(2009, 276, 3, 1000000),
(2010, 276, 5, 1000000),
(2011, 276, 12, 1000000),
(2012, 277, 3, 1000000),
(2013, 277, 5, 1000000),
(2014, 277, 12, 1000000),
(2015, 278, 3, 1000000),
(2016, 278, 5, 1000000),
(2017, 278, 12, 1000000),
(2018, 279, 3, 1000000),
(2019, 279, 5, 1000000),
(2020, 279, 12, 1000000),
(2021, 280, 3, 1000000),
(2022, 280, 5, 1000000),
(2023, 280, 12, 1000000),
(2024, 281, 3, 1000000),
(2025, 281, 5, 1000000),
(2026, 281, 12, 1000000),
(2027, 282, 3, 1000000),
(2028, 282, 5, 1000000),
(2029, 282, 12, 1000000),
(2030, 283, 3, 1000000),
(2031, 283, 5, 1000000),
(2032, 283, 12, 1000000),
(2033, 284, 3, 1000000),
(2034, 284, 5, 1000000),
(2035, 284, 12, 1000000),
(2036, 285, 3, 1000000),
(2037, 285, 5, 1000000),
(2038, 285, 12, 1000000),
(2039, 286, 3, 1000000),
(2040, 286, 5, 1000000),
(2041, 286, 12, 1000000),
(2042, 287, 3, 1000000),
(2043, 287, 5, 1000000),
(2044, 287, 12, 1000000),
(2045, 288, 3, 1000000),
(2046, 288, 5, 1000000),
(2047, 288, 12, 1000000),
(2048, 289, 3, 1000000),
(2049, 289, 5, 1000000),
(2050, 289, 12, 1000000),
(2051, 290, 3, 1000000),
(2052, 290, 5, 1000000),
(2053, 290, 12, 1000000),
(2054, 291, 3, 1000000),
(2055, 291, 5, 1000000),
(2056, 291, 12, 1000000),
(2057, 292, 3, 1000000),
(2058, 292, 5, 1000000),
(2059, 292, 12, 1000000),
(2060, 293, 3, 1000000),
(2061, 293, 5, 1000000),
(2062, 293, 12, 1000000),
(2063, 294, 3, 1000000),
(2064, 294, 5, 1000000),
(2065, 294, 12, 1000000),
(2066, 295, 3, 1000000),
(2067, 295, 5, 1000000),
(2068, 295, 12, 1000000),
(2069, 296, 3, 1000000),
(2070, 296, 5, 1000000),
(2071, 296, 12, 1000000),
(2072, 297, 3, 1000000),
(2073, 297, 5, 1000000),
(2074, 297, 12, 1000000),
(2075, 298, 3, 1000000),
(2076, 298, 5, 1000000),
(2077, 298, 12, 1000000),
(2078, 299, 3, 1000000),
(2079, 299, 5, 1000000),
(2080, 299, 12, 1000000),
(2081, 300, 3, 1000000),
(2082, 300, 5, 1000000),
(2083, 300, 12, 1000000),
(2084, 301, 3, 1000000),
(2085, 301, 5, 1000000),
(2086, 301, 12, 1000000),
(2087, 302, 3, 1000000),
(2088, 302, 5, 1000000),
(2089, 302, 12, 1000000),
(2090, 303, 3, 1000000),
(2091, 303, 5, 1000000),
(2092, 303, 12, 1000000),
(2093, 304, 3, 1000000),
(2094, 304, 5, 1000000),
(2095, 304, 12, 1000000),
(2096, 305, 3, 1000000),
(2097, 305, 5, 1000000),
(2098, 305, 12, 1000000),
(2099, 306, 3, 1000000),
(2100, 306, 5, 1000000),
(2101, 306, 12, 1000000),
(2102, 307, 3, 1000000),
(2103, 307, 5, 1000000),
(2104, 307, 12, 1000000),
(2105, 308, 3, 1000000),
(2106, 308, 5, 1000000),
(2107, 308, 12, 1000000),
(2108, 309, 3, 1000000),
(2109, 309, 5, 1000000),
(2110, 309, 12, 1000000),
(2111, 310, 3, 1000000),
(2112, 310, 5, 1000000),
(2113, 310, 12, 1000000),
(2114, 311, 3, 1000000),
(2115, 311, 5, 1000000),
(2116, 311, 12, 1000000),
(2117, 312, 3, 1000000),
(2118, 312, 5, 1000000),
(2119, 312, 12, 1000000),
(2120, 313, 3, 1000000),
(2121, 313, 5, 1000000),
(2122, 313, 12, 1000000),
(2123, 314, 3, 1000000),
(2124, 314, 5, 1000000),
(2125, 314, 12, 1000000),
(2126, 315, 3, 1000000),
(2127, 315, 5, 1000000),
(2128, 315, 12, 1000000),
(2129, 316, 3, 1000000),
(2130, 316, 5, 1000000),
(2131, 316, 12, 1000000),
(2132, 317, 3, 1000000),
(2133, 317, 5, 1000000),
(2134, 317, 12, 1000000),
(2135, 318, 3, 1000000),
(2136, 318, 5, 1000000),
(2137, 318, 12, 1000000),
(2138, 319, 3, 1000000),
(2139, 319, 5, 1000000),
(2140, 319, 12, 50000),
(2141, 320, 3, 1000000),
(2142, 320, 5, 1000000),
(2143, 320, 12, 50000),
(2144, 321, 3, 1000000),
(2145, 321, 5, 1000000),
(2146, 321, 12, 50000),
(2147, 322, 3, 1000000),
(2148, 322, 5, 1000000),
(2149, 322, 12, 50000),
(2150, 323, 3, 1000000),
(2151, 323, 5, 1000000),
(2152, 323, 12, 50000),
(2153, 324, 3, 1000000),
(2154, 324, 5, 1000000),
(2155, 324, 12, 50000),
(2156, 325, 3, 1000000),
(2157, 325, 5, 1000000),
(2158, 325, 12, 50000),
(2159, 326, 3, 1000000),
(2160, 326, 5, 1000000),
(2161, 326, 12, 50000),
(2162, 327, 3, 1000000),
(2163, 327, 5, 1000000),
(2164, 327, 12, 50000),
(2165, 328, 3, 1000000),
(2166, 328, 5, 1000000),
(2167, 328, 12, 50000),
(2168, 329, 3, 1000000),
(2169, 329, 5, 1000000),
(2170, 329, 12, 50000),
(2171, 330, 3, 1000000),
(2172, 330, 5, 1000000),
(2173, 330, 12, 50000),
(2174, 331, 3, 1000000),
(2175, 331, 5, 1000000),
(2176, 331, 12, 50000),
(2177, 332, 3, 1000000),
(2178, 332, 5, 1000000),
(2179, 332, 12, 50000),
(2180, 333, 3, 1000000),
(2181, 333, 5, 1000000),
(2182, 333, 12, 50000),
(2183, 334, 3, 1000000),
(2184, 334, 5, 0),
(2185, 334, 12, 50000),
(2186, 335, 3, 0),
(2187, 335, 5, 0),
(2188, 335, 12, 50000),
(2189, 336, 3, 0),
(2190, 336, 5, 0),
(2191, 336, 12, 50000),
(2192, 337, 3, 0),
(2193, 337, 5, 0),
(2194, 337, 12, 50000),
(2195, 343, 3, 0),
(2196, 343, 5, 0),
(2197, 343, 12, 50000),
(2198, 344, 3, 0),
(2199, 344, 5, 0),
(2200, 344, 12, 50000),
(2201, 345, 3, 0),
(2202, 345, 5, 0),
(2203, 345, 12, 50000),
(2204, 346, 3, 0),
(2205, 346, 5, 0),
(2206, 346, 12, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `keu_saldorekening_copy`
--

DROP TABLE IF EXISTS `keu_saldorekening_copy`;
CREATE TABLE IF NOT EXISTS `keu_saldorekening_copy` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilrekening` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `nominal2` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `detilrekening` (`detilrekening`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1175 ;

--
-- Dumping data for table `keu_saldorekening_copy`
--

INSERT INTO `keu_saldorekening_copy` (`replid`, `detilrekening`, `tahunajaran`, `nominal`, `nominal2`) VALUES
(1173, 351, 3, 0, 0),
(1174, 351, 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `keu_subjenisreport`
--

DROP TABLE IF EXISTS `keu_subjenisreport`;
CREATE TABLE IF NOT EXISTS `keu_subjenisreport` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenisreport` int(11) NOT NULL,
  `kategorirekening` int(11) NOT NULL,
  `posisi` enum('l','r') DEFAULT 'l',
  PRIMARY KEY (`replid`),
  KEY `jenisreport` (`jenisreport`) USING BTREE,
  KEY `kategorirekening` (`kategorirekening`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `keu_subjenisreport`
--

INSERT INTO `keu_subjenisreport` (`replid`, `jenisreport`, `kategorirekening`, `posisi`) VALUES
(1, 1, 1, 'l'),
(2, 1, 2, 'l'),
(3, 1, 3, 'l'),
(4, 1, 4, 'r'),
(7, 1, 5, 'r'),
(8, 2, 6, 'l'),
(13, 2, 7, 'r');

-- --------------------------------------------------------

--
-- Table structure for table `keu_subpemutihanpenerimaansiswa`
--

DROP TABLE IF EXISTS `keu_subpemutihanpenerimaansiswa`;
CREATE TABLE IF NOT EXISTS `keu_subpemutihanpenerimaansiswa` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `pemutihanpenerimaansiswa` int(11) NOT NULL,
  `siswabiaya` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `pemutihanpenerimaansiswa` (`pemutihanpenerimaansiswa`) USING BTREE,
  KEY `siswabiaya` (`siswabiaya`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keu_tahunbuku`
--

DROP TABLE IF EXISTS `keu_tahunbuku`;
CREATE TABLE IF NOT EXISTS `keu_tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `kode` varchar(20) NOT NULL,
  `saldoawal` decimal(10,0) NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `keu_tahunbuku`
--

INSERT INTO `keu_tahunbuku` (`replid`, `nama`, `tanggal1`, `tanggal2`, `kode`, `saldoawal`, `aktif`, `keterangan`) VALUES
(1, '2014', '2015-01-01', '0000-00-00', '', '649100', '1', 'Kas Satelit'),
(5, '2015', '2014-10-23', '0000-00-00', '', '0', '0', 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `keu_transaksi`
--

DROP TABLE IF EXISTS `keu_transaksi`;
CREATE TABLE IF NOT EXISTS `keu_transaksi` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `idkwitansi` int(11) NOT NULL,
  `nobukti` varchar(50) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `uraian` text NOT NULL,
  `anggarantahunan` int(11) NOT NULL DEFAULT '0',
  `detjenistransaksi` int(11) NOT NULL,
  `idref` int(11) NOT NULL,
  `type` enum('sar','') DEFAULT NULL,
  `departemen` int(11) DEFAULT NULL,
  `tingkat` int(11) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `detjenistransaksi` (`detjenistransaksi`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=194 ;

--
-- Dumping data for table `keu_transaksi`
--

INSERT INTO `keu_transaksi` (`replid`, `idkwitansi`, `nobukti`, `tanggal`, `uraian`, `anggarantahunan`, `detjenistransaksi`, `idref`, `type`, `departemen`, `tingkat`) VALUES
(179, 23, 'woke9', '2015-12-01', 'test jurnal umum 1', 0, 7, 0, NULL, NULL, NULL),
(180, 24, 'kgjlkfdu9', '2015-12-04', 'test jurnal umum 2', 0, 7, 0, NULL, NULL, NULL),
(181, 15, '', '2015-12-04', 'tes income', 0, 1, 0, NULL, 1, 1),
(182, 16, '', '2015-12-05', 'Pembayaran Joining Fee siswa <br> Nama : Cindy Frederricka<br> Kelas :Toddler - 1A', 0, 1, 1, NULL, NULL, NULL),
(183, 17, '', '2015-12-05', 'terlambat bayar', 0, 1, 0, NULL, 1, 1),
(184, 18, '', '2015-12-06', 'bayar uang sekolah', 0, 1, 0, NULL, 1, 2),
(185, 19, 'INV1606150001', '2015-12-05', 'bayar pekerja renovasi 9', 43, 4, 0, 'sar', 1, 1),
(186, 20, '', '2015-12-05', 'stok tepung terigu', 19, 4, 0, '', 1, 1),
(187, 21, '', '2015-12-05', 'beli ATK dan buku siswa student exchange', 40, 6, 0, '', 1, 6),
(190, 25, '', '2015-12-05', 'pol', 10, 6, 0, '', 1, 1),
(191, 26, '', '2015-12-05', 'Bus antar jemput Toddler ', 43, 6, 0, '', 1, 1),
(192, 27, '', '2015-12-05', 'PT. XYZ bayar piutang item ABC', 0, 3, 0, NULL, 1, 1),
(193, 28, 'INV1606150001', '2015-12-05', 'Bahan material (semen, pasir dll)', 46, 4, 0, 'sar', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `keu_viabayar`
--

DROP TABLE IF EXISTS `keu_viabayar`;
CREATE TABLE IF NOT EXISTS `keu_viabayar` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `viabayar` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `keu_viabayar`
--

INSERT INTO `keu_viabayar` (`replid`, `viabayar`, `keterangan`) VALUES
(1, 'Kartu Kredit', 'pembayaran via kartu kredit, misal : paypal, CC bank ABC, dll'),
(2, 'Kartu Debit ', 'pembayaran melalui debt card . misal : ATM/debt card BCA, dll'),
(3, 'Transfer Bank', 'pembayaran via tranfer antar sejenis/beda bank'),
(5, 'Uang Tunai', 'bayar uang dengan uang cash');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keu_anggarantahunan`
--
ALTER TABLE `keu_anggarantahunan`
  ADD CONSTRAINT `keu_anggarantahunan_ibfk_1` FOREIGN KEY (`detilanggaran`) REFERENCES `keu_detilanggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tahunajaranFK4` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_pembayaran_copy`
--
ALTER TABLE `keu_pembayaran_copy`
  ADD CONSTRAINT `keu_pembayaran_copy_ibfk_1` FOREIGN KEY (`siswabiaya`) REFERENCES `psb_siswabiaya` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `keu_pembayaran_copy_ibfk_2` FOREIGN KEY (`viabayar2`) REFERENCES `keu_viabayar` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_pemutihanpenerimaansiswa`
--
ALTER TABLE `keu_pemutihanpenerimaansiswa`
  ADD CONSTRAINT `karyawanFK` FOREIGN KEY (`karyawan`) REFERENCES `hrd_karyawan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswaFK3` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_penerimaansiswa`
--
ALTER TABLE `keu_penerimaansiswa`
  ADD CONSTRAINT `siswabiayaFK2` FOREIGN KEY (`siswabiaya`) REFERENCES `psb_siswabiaya` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `viabayarFK3` FOREIGN KEY (`viabayar2`) REFERENCES `keu_viabayar` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_rekeningbiaya`
--
ALTER TABLE `keu_rekeningbiaya`
  ADD CONSTRAINT `biayaFK2` FOREIGN KEY (`biaya`) REFERENCES `psb_biaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departemenFK2` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tahunajaranFK7` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_saldorekening`
--
ALTER TABLE `keu_saldorekening`
  ADD CONSTRAINT `detilrekeningFK1` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tahunajaranFK6` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_saldorekening_copy`
--
ALTER TABLE `keu_saldorekening_copy`
  ADD CONSTRAINT `keu_saldorekening_copy_ibfk_1` FOREIGN KEY (`detilrekening`) REFERENCES `keu_detilrekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keu_saldorekening_copy_ibfk_2` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_subjenisreport`
--
ALTER TABLE `keu_subjenisreport`
  ADD CONSTRAINT `jenisreportFK` FOREIGN KEY (`jenisreport`) REFERENCES `keu_jenisreport` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategorirekeningFK8` FOREIGN KEY (`kategorirekening`) REFERENCES `keu_kategorirekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_subpemutihanpenerimaansiswa`
--
ALTER TABLE `keu_subpemutihanpenerimaansiswa`
  ADD CONSTRAINT `pemutihanpenerimaansiswaFK` FOREIGN KEY (`pemutihanpenerimaansiswa`) REFERENCES `keu_pemutihanpenerimaansiswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswabiayaFK3` FOREIGN KEY (`siswabiaya`) REFERENCES `psb_siswabiaya` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keu_transaksi`
--
ALTER TABLE `keu_transaksi`
  ADD CONSTRAINT `detjenistransaksiFK` FOREIGN KEY (`detjenistransaksi`) REFERENCES `keu_detjenistransaksi` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
