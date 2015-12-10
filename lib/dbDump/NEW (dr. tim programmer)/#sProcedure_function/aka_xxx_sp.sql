
/*listdept*/
DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `listdept`()
BEGIN
	SELECT replid, nama departemen from departemen order by nama asc;
END $$
DELIMITER ;

/*listTingkatByDept*/
DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `listTingkatByDept`(IN `dept` int)
BEGIN
	SELECT t.replid, t.tingkat,t.urutan
	FROM
		aka_tingkat t
		JOIN aka_subtingkat st ON st.tingkat = t.replid
		JOIN aka_kelas k ON k.subtingkat = st.replid
	WHERE k.departemen = dept
	GROUP BY t.replid
	ORDER BY t.urutan ASC;
END $$
DELIMITER ;

/*getSemester*/
DELIMITER $$
CREATE DEFINER = `root`@`localhost` FUNCTION `getSemester`(`tgl` date) RETURNS int(11)
BEGIN
	DECLARE idSemester INT;
		SELECT replid into idSemester
		FROM aka_semester 
		WHERE tgl BETWEEN tglMulai and tglSelesai;
	RETURN idSemester;
END $$
DELIMITER ;


/*getTahunAjaran*/
DELIMITER $$
CREATE DEFINER = `root`@`localhost` FUNCTION `getTahunAjaran`(`tgl` date) RETURNS int(11)
BEGIN
	DECLARE idTahunAjaran INT;
	SELECT tahunajaran into idTahunAjaran
	FROM aka_semester 
	WHERE tgl BETWEEN tglMulai and tglSelesai;
	RETURN idTahunAjaran;
END $$
DELIMITER ;


/*getTglMulaiTahunAjaran*/
DELIMITER $$
CREATE DEFINER = `root`@`localhost` FUNCTION `getTglMulaiTahunAjaran`(idThn INT) RETURNS varchar(10)
BEGIN
	DECLARE tgl VARCHAR(10);
		SELECT MIN(tglMulai) INTO tgl FROM aka_semester WHERE tahunajaran = idThn;
	RETURN tgl;
END $$
DELIMITER ;

