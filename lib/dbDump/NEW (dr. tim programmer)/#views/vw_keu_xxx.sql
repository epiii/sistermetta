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
	getOperatorDetRekening(j.replid,j.jenisrekening)operator
FROM
	keu_transaksi t
	JOIN keu_jurnal j on j.transaksi = t.replid ;



CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_siswa_biaya`AS 
SELECT
	s.replid idsiswa,
	db.replid iddetailbiaya,
	db.subtingkat idsubtingkat,
	db.biaya idbiaya,
	sb.replid idsiswabiaya,
	dg.replid iddetailgelombang,
	dg.departemen iddepartemen,
	dg.tahunajaran idtahunajaran,
	b.biaya
FROM
	psb_siswa s 
	JOIN psb_siswabiaya sb on sb.siswa = s.replid
	JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
	JOIN psb_biaya b on b.replid = db.biaya
	JOIN psb_detailgelombang dg on dg.replid = db.detailgelombang ;


CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_rekening`AS 
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

