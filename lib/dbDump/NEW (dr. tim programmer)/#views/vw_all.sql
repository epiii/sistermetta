CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_kelas`AS 
SELECT
	t.replid idtingkat,
	t.tingkat,
	t.urutan,
	st.replid idsubtingkat,
	st.subtingkat,
	k.replid idkelas,
	k.kelas,
	k.departemen iddepartemen,
	dk.replid iddetailkelas,
	dk.tahunajaran idtahunajaran
FROM
	aka_tingkat t 
	JOIN aka_subtingkat st on st.tingkat = t.replid 
	JOIN aka_kelas k on k.subtingkat = st.replid
	JOIN aka_detailkelas dk on dk.kelas = k.replid 
ORDER BY
	t.urutan ASC,
	st.subtingkat ASC,
	k.kelas ASC ;

CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_psb_siswa_kriteria` AS 
SELECT
	`siswa`.`replid` AS `idsiswa`,
	`siswa`.`nis` AS `nis`,
	`siswa`.`nisn` AS `nisn`,
	`siswa`.`nopendaftaran` AS `nopendaftaran`,
	`siswa`.`namasiswa` AS `namasiswa`,
	`siswa`.`status` AS `status`,
	`tingkat`.`replid` AS `idtingkat`,
	`tingkat`.`tingkat` AS `tingkat`,
	`subtingkat`.`replid` AS `idsubtingkat`,
	`subtingkat`.`subtingkat` AS `subtingkat`,
	`detailgelombang`.`replid` AS `iddetailgelombang`
FROM
	(
		(
			(
				(
					(
						(
							(
								(
									(
										(
											`psb_siswa` `siswa`
											JOIN `psb_siswabiaya` `siswabiaya` ON (
												(
													`siswabiaya`.`siswa` = `siswa`.`replid`
												)
											)
										)
										JOIN `psb_detailbiaya` `detailbiaya` ON (
											(
												`detailbiaya`.`replid` = `siswabiaya`.`detailbiaya`
											)
										)
									)
									JOIN `psb_biaya` `biaya` ON (
										(
											`biaya`.`replid` = `detailbiaya`.`biaya`
										)
									)
								)
								JOIN `aka_subtingkat` `subtingkat` ON (
									(
										`subtingkat`.`replid` = `detailbiaya`.`subtingkat`
									)
								)
							)
							JOIN `aka_tingkat` `tingkat` ON (
								(
									`tingkat`.`replid` = `subtingkat`.`tingkat`
								)
							)
						)
						JOIN `psb_detailgelombang` `detailgelombang` ON (
							(
								`detailgelombang`.`replid` = `detailbiaya`.`detailgelombang`
							)
						)
					)
					JOIN `psb_gelombang` `gelombang` ON (
						(
							`gelombang`.`replid` = `detailgelombang`.`gelombang`
						)
					)
				)
				JOIN `aka_tahunajaran` `tahunajaran` ON (
					(
						`tahunajaran`.`replid` = `detailgelombang`.`tahunajaran`
					)
				)
			)
			JOIN `psb_golongan` `golongan` ON (
				(
					`golongan`.`replid` = `detailbiaya`.`golongan`
				)
			)
		)
		JOIN `departemen` ON (
			(
				`departemen`.`replid` = `detailgelombang`.`departemen`
			)
		)
	)
GROUP BY
	`siswa`.`replid` ;


CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_rekening` AS 
sELECT
	sr.replid idsaldorekening,
	r.replid idrekening,
	kr.replid idkategorirekening,
	kr.nama kategorirekening,
	r.kode,
	r.nama detilrekening,
	kr.jenis,
	IFNULL(sr.nominal,0)saldo,
	getSaldoRekeningSkrg(r.replid)saldo2
FROM
	keu_detilrekening r
	LEFT JOIN keu_saldorekening sr ON sr.detilrekening = r.replid
	LEFT JOIN keu_kategorirekening kr ON kr.replid = r.kategorirekening ;


CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_siswa_biaya` AS 
SELECT
	s.replid idsiswa,
	db.replid iddetailbiaya,
	db.subtingkat idsubtingkat,
	db.biaya idbiaya,
	sb.replid idsiswabiaya,
	dg.replid iddetailgelombang,
	dg.departemen iddepartemen,
	dg.tahunajaran idtahunajaran,
	b.biaya,
	b.ditagih,
	s.namasiswa,
	getBiayaAwal(sb.replid)biayaAwal,
	getBiayaNett(sb.replid)biayaNett,
	getBiayaTerbayar (sb.replid)biayaTerbayar,
	(getBiayaNett(sb.replid) - getBiayaTerbayar (sb.replid))biayaKurang,
	s.nis,
	s.nisn,
	st.tingkat idtingkat,
	s.status,
	s.nopendaftaran,
	sm.replid idsemester,
	sb.angsuran,
	sb.isAngsur2,
	sb.viabayar,
	k.kelas,
	t.tingkat,
	st.subtingkat,
	getStatusBayar(sb.replid)statusBayar,	
	p.bulan
FROM
	psb_siswa s 
	JOIN psb_siswabiaya sb on sb.siswa = s.replid
	JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
	JOIN psb_biaya b on b.replid = db.biaya
	JOIN psb_detailgelombang dg on dg.replid = db.detailgelombang 
	JOIN aka_subtingkat st on st.replid = db.subtingkat 
	JOIN aka_tingkat t on t.replid = st.tingkat
	JOIN aka_kelas k on k.subtingkat = st.replid
	JOIN aka_tahunajaran ta on ta.replid = dg.tahunajaran
	JOIN aka_semester sm on sm.tahunajaran = ta.replid 
	LEFT JOIN keu_penerimaansiswa p on p.siswabiaya = sb.replid ;


CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_siswa_kelas` AS 
SELECT
	s.replid idsiswa,
	sk.replid idsiswakelas,
	dk.replid iddetailkelas,
	k.replid idkelas,
	st.replid idsubtingkat,
	t.replid idtingkat,
	dk.tahunajaran idtahunajaran,
	k.departemen iddepartemen,
	s.namasiswa,
	s.nis,
	s.nisn,
	d.nama departemen,
	ta.tahunajaran,
	st.subtingkat,
	t.tingkat,
	k.kelas
FROM
	psb_siswa s
	JOIN aka_siswakelas sk on sk.siswa = s.replid
	JOIN aka_detailkelas dk on dk.replid = sk.detailkelas
	JOIN aka_kelas k on k.replid = dk.kelas
	JOIN aka_subtingkat st on st.replid = k.subtingkat
	JOIN aka_tingkat t on t.replid = st.tingkat 
	JOIN departemen d on d.replid = k.departemen 
	JOIN aka_tahunajaran ta on ta.replid = dk.tahunajaran ;

CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_transaksi`AS 
SELECT
	t.replid idtransaksi,
	t.tanggal,
	t.uraian,
	t.departemen,
	t.tingkat,
	j.replid idjurnal,	
	j.detilrekening iddetilrekening,
	j.jenisrekening,
	j.nominal,
	t.anggarantahunan idanggarantahunan,
	d.replid iddetilanggaran,
	d.detilanggaran,
	getOperatorDetRekening(j.detilrekening,j.jenisrekening)operator
FROM
	keu_transaksi t
	JOIN keu_jurnal j on j.transaksi = t.replid 
	LEFT JOIN keu_anggarantahunan a on a.replid = t.anggarantahunan
	LEFT JOIN keu_detilanggaran d on d.replid = a.detilanggaran ;


/*getSaldoRekeningByTgl*/
DELIMITER $$
CREATE DEFINER = `root`@`localhost` FUNCTION `getSaldoRekeningByTgl`(`idDetRek` int,`tgl1` date,`tgl2` date) RETURNS decimal(14,0)
BEGIN
	DECLARE saldoRekening DECIMAL(14);
		SELECT IFNULL(sum(concat(operator,nominal)),0) into saldoRekening
		FROM vw_transaksi
		WHERE 
			(tanggal BETWEEN  tgl1 and tgl2 )
			and iddetilrekening = idDetRek
		ORDER BY tanggal ASC;
	RETURN saldoRekening;
END $$
DELIMITER ;

/*getAnggaranTerpakai*/
DELIMITER $$
CREATE DEFINER = `root`@`localhost` FUNCTION `getAnggaranTerpakai`(`idAnggThn` INT) RETURNS decimal(14,0)
BEGIN
	DECLARE nom DECIMAL;
	SELECT IFNULL(sum(nominal),0) INTO nom
	FROM vw_transaksi
	WHERE idanggarantahunan = idAnggThn;
	RETURN nom;
END $$
DELIMITER ;

