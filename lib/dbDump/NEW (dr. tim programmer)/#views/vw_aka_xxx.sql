CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_siswa_kelas`AS 
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

