<?php
	// set biaya checking 
	function getSetBiaya($kel,$krit,$gol){
		$s = '	SELECT replid,registration, material,tuition 
				FROM psb_setbiaya 
				WHERE 	kel  ='.$kel.' AND 
						krit ='.$krit.' AND 
						gol  ='.$gol;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r;
	}
	function getNumRows($tb){
		$s='SELECT * FROM psb_'.$tb;
		$e = mysql_query($s);
		$n = mysql_num_rows($e);
		return intval($n);
	}
	function checkSetBiaya($kel){
		$s = 'SELECT * FROM psb_setbiaya WHERE kel ='.$kel;
		$e = mysql_query($s);
		$n = mysql_num_rows($e);
		if($n<=0) addSetBiaya($kel);
	}
	function addSetBiaya($kel){
		$sk = 'SELECT replid FROM psb_kriteria';
		$ek = mysql_query($sk);
		while ($rk=mysql_fetch_assoc($ek)) {
			$sg = 'SELECT replid FROM psb_golongan';
			$eg = mysql_query($sg);
			while ($rg=mysql_fetch_assoc($eg)) {
				$ss='INSERT INTO psb_setbiaya SET 
						kel  ='.$kel.',
						gol  ='.$rg['replid'].',
						krit ='.$rk['replid'];
				$es=mysql_query($ss);
			}
		}
	}
	function getSiswa($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_calonsiswa
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getAngkatan($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_angkatan
			  WHERE replid ='.$id;
		// var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getAngkatan2($f,$w,$id){
		$s = 'SELECT '.$f.'
			  FROM aka_angkatan
			  WHERE '.$w.' ="'.$id.'"';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}function getProses($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_proses
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getKelompok($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_kelompok
			  WHERE replid ='.$id;
			  // var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getSiswaBy($f,$w){
		$s='SELECT '.$f.' FROM psb_calonsiswa WHERE replid ='.$w;
		// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}
?>