<?php
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
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$f];
	}
?>