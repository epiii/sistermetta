<?php	
	require_once  'keu_func.php';
	require_once  'kon_func.php';
	require_once  'aka_func.php';
	require_once  'psb_func.php';
	require_once  'pus_func.php';
	
	// general function : query data 
	function getField($f,$tb,$w,$k){
		$s = 'SELECT '.$f.' FROM '.$tb.' WHERE '.$w.' = '.$k;
		// var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}
?>