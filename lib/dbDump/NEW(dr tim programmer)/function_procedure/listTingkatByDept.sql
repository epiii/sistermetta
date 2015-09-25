;;CREATE DEFINER=`root`@`localhost` PROCEDURE `listTingkatByDept`(IN `dept` int)
BEGIN
    SELECT t.replid, t.tingkat,t.urutan
    FROM
        aka_tingkat t
        JOIN aka_subtingkat st ON st.tingkat = t.replid
        JOIN aka_kelas k ON k.subtingkat = st.replid
    WHERE k.departemen = dept
    GROUP BY t.replid
    ORDER BY t.urutan ASC;
END;;