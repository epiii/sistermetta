<?php
	// function getTahunAjaranByTgl(){
	// 	$s='SELECT nominal FROM keu_saldorekening WHERE detilrekening='.$idRek.' AND tahunajaran='.$idThn;
	// 	$e=mysql_query($s);
	// 	$r=mysql_fetch_assoc($e);
	// 	return $r['nominal'];
	// }
	function getTahunAjaranTrans($tgl)	{
		$s= 'SELECT getTahunAjaran("'.$tgl.'")idtahunajaran';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['idtahunajaran'];
	}
	function getSaldoAwalRek($idRek,$idThn){
		$s='SELECT nominal FROM keu_saldorekening WHERE detilrekening='.$idRek.' AND tahunajaran='.$idThn;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['nominal'];
	}

	function getSaldoRekeningSkrg($idRek){
		$s='SELECT getSaldoRekeningSkrg('.$idRek.') saldoRekening';
		// pr($s);
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['saldoRekening'];
	}	
	// function getSaldoRek($idRek,$idThn){
	// 	$s='SELECT nominal2 FROM keu_saldorekening WHERE detilrekening='.$idRek.' AND tahunajaran='.$idThn;
	// 	$e=mysql_query($s);
	// 	$r=mysql_fetch_assoc($e);
	// 	return $r['nominal2'];
	// }	
	function getTglTransaksi($idTransaksi){
		$s=getField('tanggal','keu_transaksi','replid',$idTransaksi);
		return $s;
	}
	function getOptJurnal($detRek,$jenisRek){
		$s='SELECT if(kr.jenistambah="'.$jenisRek.'","+","-")opt
			FROM
				keu_detilrekening dr
				JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening
			WHERE dr.replid ='.$detRek;
		$e =mysql_query($s);
		$r =mysql_fetch_assoc($e);
		return $r['opt']; 
	}
	function editSaldoRek($idDetRek,$idThn,$jenisRek,$nominal){
		$s='UPDATE keu_saldorekening 
			SET nominal2=nominal2'.getOptJurnal($idDetRek,$jenisRek).$nominal.' 
			WHERE 
				detilrekening='.$idDetRek.' AND 
				tahunajaran='.$idThn;
		$e=mysql_query($s);
		return $e?true:false;
	}
	function addJurnal($idTransaksi,$detRekBiaya,$nominal,$idThn){
		$statSaldo=$statJurnal=true;
		foreach ($detRekBiaya as $i => $v) {
			$idDetRek = $v['detilrekening'];
			$jenisRek = $v['jenisrekening'];
			$s='INSERT INTO keu_jurnal SET 
				transaksi     ='.$idTransaksi.',
				detilrekening ='.$idDetRek.',
				jenisrekening ="'.$jenisRek.'",
				nominal       ='.$nominal;
			$e            =mysql_query($s);
			$statJurnal   =!$e?false:true;
			$editSaldoRek =editSaldoRek($idDetRek,$idThn,$jenisRek,$nominal);
			$statSaldo    =!$editSaldoRek?false:true;
		}return $statJurnal;
	}
	function getRekeningBiaya($dep,$thn,$biaya){
		$s='SELECT replid 
			FROM keu_rekeningbiaya 
			WHERE 
				departemen='.$dep.' AND 
				tahunajaran='.$thn.' AND 
				biaya='.$biaya;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['replid'];
	}
	function getDetRekeningBiayaArr($rekBiaya){
		$s='SELECT detilrekening,jenisrekening 
			FROM keu_detilrekeningbiaya 
			WHERE rekeningbiaya='.$rekBiaya;
		$e=mysql_query($s);
		$arr=array();
		while($r=mysql_fetch_assoc($e)) $arr[]=$r; 
		return $arr;
	}
	function getTahunAjaranByBiaya($idsiswabiaya){
		$r=getField('idtahunajaran','vw_siswa_biaya','idsiswabiaya',$idsiswabiaya);
		return $r;
	}
	function getAllRekeningBiaya($biaya,$dep,$thn){
		$s='SELECT 
				if(drb.jenisrekening="d","Debit","Kredit")jenisrekening,
				if(drb.jenisrekening="d","green","red")color,
				kr.nama kategorirekening,
				concat("[",dr.kode,"] ",dr.nama)detilrekening
			FROM
				keu_rekeningbiaya rb 
				JOIN keu_detilrekeningbiaya drb on drb.rekeningbiaya = rb.replid
				JOIN keu_detilrekening dr on dr.replid = drb.detilrekening
				JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening
			WHERE
				rb.departemen ='.$dep.' AND
				rb.tahunajaran ='.$thn.' AND
				rb.biaya = '.$biaya.'
			ORDER BY 
				drb.jenisrekening ASC ';
				// pr($s);
		$e=mysql_query($s);
		$rekList='';

		while ($r=mysql_fetch_assoc($e)) {
			$rekList.='<b class="fg-'.$r['color'].'">['.$r['jenisrekening'].']  '.$r['kategorirekening'].'</b> : '.$r['detilrekening'].'<br>';
		}return $rekList;
	}	

	function getBiayaNett($idBiaya,$idDiskReg,$diskKhus){
		$biaya = !is_null($idDiskReg)?getBiayaDiskReg($idBiaya,$idDiskReg):getField('nominal','psb_detailbiaya','replid',$idBiaya);
		$biayaNett = ($biaya<$diskKhus?0:(intval($biaya) - intval($diskKhus)) );
		// vd($biayaNett);
		return $biayaNett;
	}


	function getDiskReg($idDetailBiaya,$idDiskReg){
		if(is_array($idDiskReg)){
			$biaya = getField('nominal','psb_detailbiaya','replid',$idDetailBiaya); // biaya awal  Rp.
				// pr($biaya);
			foreach ($idDiskReg as $i => $v) {
				$diskReg = intval(getField('nilai','psb_detaildiskon','replid',$v)); // diskon %
				$biaya-=($biaya*$diskReg/100);
				// pr($biaya);
			}return $biaya;
		}
	}
	function getBiayaDiskReg($idDetailBiaya,$idDiskReg){
		if(is_array($idDiskReg)){
			$biaya = getField('nominal','psb_detailbiaya','replid',$idDetailBiaya); // biaya awal  Rp.
				// pr($biaya);
			foreach ($idDiskReg as $i => $v) {
				$diskReg = intval(getField('nilai','psb_detaildiskon','replid',$v)); // diskon %
				$biaya-=($biaya*$diskReg/100);
				// pr($biaya);
			}return $biaya;
		}
	}

	function getAngsuranNominal($idSiswa,$idBiaya){
				// a.angsuran
				// JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
				// JOIN psb_angsuran a on a.replid = sb.angsuran
		$s='SELECT
				IFNULL(a.angsuran,1)angsuran
			FROM
				psb_siswabiaya sb 
				left JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
				left JOIN psb_angsuran a on a.replid = sb.angsuran
			WHERE
				sb.siswa = '.$idSiswa.' AND 
				db.biaya  = '.$idBiaya;
		$e  = mysql_query($s);
		$ra = mysql_fetch_assoc($e);
		$angsuran  = $ra['angsuran'];
		$biayaNett = getBiayaNett2($idSiswa,$idBiaya);			
		$angsuranNominal = $biayaNett/$angsuran;
		// pr($angsuran);
		return $angsuranNominal;
	}
	function getBiayaNett2($idSiswa,$idBiaya){
		$s1 = ' SELECT db.nominal biaya, sb.diskonkhusus
				FROM psb_siswabiaya sb 
					JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
				WHERE sb.siswa = '.$idSiswa.' and db.biaya = '.$idBiaya;
		$e1 =mysql_query($s1);
		$r1 =mysql_fetch_assoc($e1);

		$s2 = '	SELECT dd.nilai
				FROM psb_siswadiskon sd
					JOIN psb_detaildiskon dd on dd.replid = sd.detaildiskon
					JOIN psb_siswabiaya sb on sb.replid = sd.siswabiaya
					JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
				where  
					sb.siswa = '.$idSiswa.' and  
					db.biaya = '.$idBiaya;
		$e2 =mysql_query($s2);
		$biayaAwal = $r1['biaya'];
		while ($r2 =mysql_fetch_assoc($e2)) {
			$diskReg = intval($r2['nilai']);
			$biayaAwal-=($biayaAwal*$diskReg/100);
		}return $biayaAwal-intval($r1['diskonkhusus']);
	}
	function getBiaya($dgel,$subt,$gol){
		$s = '	SELECT b.replid,db.nominal
				FROM psb_detailbiaya db JOIN psb_biaya b on b.replid = db.biaya 
				WHERE 	db.detailgelombang  ='.$dgel.' AND 
						db.subtingkat ='.$subt.' AND 
						db.golongan  ='.$gol.'
				ORDER BY b.biaya ASC';
		// pr($s);exit();
		$e = mysql_query($s);
		$o=array();
		while ($r=mysql_fetch_assoc($e)) {
			$o[]=$r;
		}return $o;
	}function getBiayaArr($dgel,$subt,$gol){
		$s = '	SELECT b.replid,db.nominal,db.replid iddetailbiaya
				FROM psb_detailbiaya db JOIN psb_biaya b on b.replid = db.biaya 
				WHERE 	db.detailgelombang  ='.$dgel.' AND 
						db.subtingkat ='.$subt.' AND 
						db.golongan  ='.$gol.'
				ORDER BY b.biaya ASC';
		// pr($s);exit();
		$e = mysql_query($s);
		$o=array();
		while ($r=mysql_fetch_assoc($e)) {
			$o[]=$r;
		}return $o;
	}

	function getKatAnggaran($id,$typ){
		$s='SELECT
				k.*, IFNULL(da.kuotaNum, 0) kuotaNum,
				IFNULL(t.totTerpakai, 0) terpakaiNum,
				IFNULL((da.kuotaNum - IFNULL(t.totTerpakai, 0)),0) sisaNum
			FROM
				keu_kategorianggaran k
				LEFT JOIN (
					SELECT
						sum(t.nominal) totTerpakai,
						d.kategorianggaran
					FROM
						keu_transaksi t
					LEFT JOIN keu_detilanggaran d ON d.replid = t.detilanggaran
					GROUP BY
						t.detilanggaran
				) t ON t.kategorianggaran = k.replid
				LEFT JOIN (
					SELECT
						tb.kategorianggaran,
						SUM(tb.totDetAnggaran) kuotaNum
					FROM(
							SELECT (
									SELECT
										(sum(jml) * d.hargasatuan) 
									FROM
										keu_nominalanggaran
									WHERE
										detilanggaran = d.replid
								)totDetAnggaran,
								d.replid,
								d.kategorianggaran
							FROM
								keu_detilanggaran d
							GROUP BY
								d.replid
						) tb
					GROUP BY
						tb.kategorianggaran
				) da ON da.kategorianggaran = k.replid
			WHERE
				k.replid ='.$id;
		// var_dump($s);exit();	
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$typ];
	}
	function getDetAnggaran($id,$typ){
		$s='SELECT
				(SUM(n.jml) * d.hargasatuan)kuotaNum,
				ifnull(t1.terpakaiNum, 0) terpakaiNum,
				ifnull(((SUM(n.jml) * d.hargasatuan) - t1.terpakaiNum),(SUM(n.jml) * d.hargasatuan)) sisaNum,
				ifnull(round(((t1.terpakaiNum) / (SUM(n.jml) * d.hargasatuan) * 100)),0) terpakaiPerc
			FROM
				keu_detilanggaran d
				LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
				LEFT JOIN (
					SELECT
						t.detilanggaran,
						SUM(t.nominal) terpakaiNum
					FROM
						keu_transaksi t
					GROUP BY
						t.detilanggaran
				) t1 ON t1.detilanggaran = d.replid
			WHERE
				d.replid = '.$id;
// pr($s);
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$typ];
	}



	/*keuangan*/
	// transact
	/*pembayaran*/
	function jenisRek2($rek){
		$ret = '<b class="fg-'.($rek=='d'?'green':'red').'">'.jenisRek($rek).'</b>';
		return $ret;
	}function jenisRek($rek){
		$ret = $rek=='d'?'debit':'kredit';
		return $ret;
	}function getTerbilang($angka,$debug){
		// $angka = str_replace('Rp. ','');
	    $angka = str_replace(".",",",'75.900.500');
	    // $angka = str_replace(".",",",$angka);
	    list ($angka, $desimal) = explode(",",$angka);
	    $panjang=strlen($angka);
	    for ($b=0;$b<$panjang;$b++){
	        $myindex=$panjang-$b-1;
	        $a_bil[$b]=substr($angka,$myindex,1);
	    }
	    if ($panjang>9){
	        $bil=$a_bil[9];
	        if ($panjang>10){
	            $bil=$a_bil[10].$bil;
	        }
		    // var_dump($bil);exit();

	        if ($panjang>11){
	            $bil=$a_bil[11].$bil;
	        }
	        if ($bil!="" && $bil!="000"){
	            $terbilang .= rp_satuan($bil,$debug)." milyar";
	        }
	    }

	    if ($panjang>6){
	        $bil=$a_bil[6];
	        if ($panjang>7){
	            $bil=$a_bil[7].$bil;
	        }

	        if ($panjang>8){
	            $bil=$a_bil[8].$bil;
	        }
	        if ($bil!="" && $bil!="000"){
	            $terbilang .= rp_satuan($bil,$debug)." juta";
	        }
	    }
	   
	    if ($panjang>3){
	        $bil=$a_bil[3];
	        if ($panjang>4){
	            $bil=$a_bil[4].$bil;
	        }

	        if ($panjang>5){
	            $bil=$a_bil[5].$bil;
	        }
	        if ($bil!="" && $bil!="000"){
	            $terbilang .= rp_satuan($bil,$debug)." ribu";
	        }
	    }

	    $bil=$a_bil[0];
	    if ($panjang>1){
	        $bil=$a_bil[1].$bil;
	    }

	    if ($panjang>2){
	        $bil=$a_bil[2].$bil;
	    }
	    //die($bil);
	    if ($bil!="" && $bil!="000"){
	        $terbilang .= rp_satuan($bil,$debug);
	    }
	    return trim($terbilang);
	}function rp_satuan($angka,$debug){
    $a_str['1']="satu";
    $a_str['2']="dua";
    $a_str['3']="tiga";
    $a_str['4']="empat";
    $a_str['5']="lima";
    $a_str['6']="enam";
    $a_str['7']="tujuh";
    $a_str['8']="delapan";
    $a_str['9']="sembilan";
   
   
    $panjang=strlen($angka);
    for ($b=0;$b<$panjang;$b++)
    {
        $a_bil[$b]=substr($angka,$panjang-$b-1,1);
    }
   
    if ($panjang>2)
    {
        if ($a_bil[2]=="1")
        {
            $terbilang=" seratus";
        }
        else if ($a_bil[2]!="0")
        {
            $terbilang= " ".$a_str[$a_bil[2]]. " ratus";
        }
    }

    if ($panjang>1)
    {
        if ($a_bil[1]=="1")
        {
            if ($a_bil[0]=="0")
            {
                $terbilang .=" sepuluh";
            }
            else if ($a_bil[0]=="1")
            {
                $terbilang .=" sebelas";
            }
            else
            {
                $terbilang .=" ".$a_str[$a_bil[0]]." belas";
            }
            return $terbilang;
        }
        else if ($a_bil[1]!="0")
        {
            $terbilang .=" ".$a_str[$a_bil[1]]." puluh";
        }
    }
   
    if ($a_bil[0]!="0")
    {
        $terbilang .=" ".$a_str[$a_bil[0]];
    }
    return $terbilang;
  
}
	function getDetAnggaranFull($id){
		$s='SELECT  
				da.detilanggaran,
				ka.kategorianggaran,
				getAnggaranPerItem('.$id.')kuota 
			FROM keu_anggarantahunan ath
				JOIN keu_detilanggaran da on da.replid = ath.detilanggaran
				JOIN keu_kategorianggaran ka on ka.replid = da.kategorianggaran
			WHERE ath.replid='.$id;
		// pr($s);
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['detilanggaran'].' ('.$r['kategorianggaran'].') | kuota : '.setuang($r['kuota']);
	}
	function getNamaAnggaran($ath){
		$s='SELECT getNamaAnggaran('.$ath.')nama';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['nama'];
	}
	// function getNamaKatAnggaran($id){
	// 	$s=getField('kategorianggaran','keu_kategorianggaran','replid',$id);
	// 	$e=mysql_query($s);
	// 	return $r['detilanggaran'];
	// }
	function getKatAnggaran2($f,$id){
		$s='SELECT '.$f.' FROM keu_kategorianggaran WHERE replid='.$id;
		// print_r($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}function getAnggaran($id){
		$s='SELECT * FROM keu_detilanggaran WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['nama'];
	}
	function getAnggaranKuota($idx){
		$s='SELECT getAnggaranKuota('.$idx.')anggaranKuota';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['anggaranKuota'];
	}
	// function getKuotaAnggaran($anggaran){
	// 	$s='SELECT
	// 			SUM(n.nominal)kuotaNum,
	// 			ifnull(t1.terpakaiNum,0)terpakaiNum,
	// 			ifnull((SUM(n.nominal)-t1.terpakaiNum),SUM(n.nominal))sisaNum,
	// 			ifnull(round(((t1.terpakaiNum)/SUM(n.nominal)*100)),0)terpakaiPerc
	// 		FROM
	// 			keu_detilanggaran d
	// 			LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
	// 			LEFT JOIN (
	// 				SELECT t.detilanggaran, SUM(t.nominal) terpakaiNum 
	// 				FROM keu_transaksi t
	// 				GROUP BY t.detilanggaran
	// 			)t1 on t1.detilanggaran = d.replid
	// 		WHERE d.replid='.$anggaran;
	// 	var_dump($s);
	// 	$e=mysql_query($s);
	// 	$r=mysql_fetch_assoc($e);
	// 	return $r;
	// }
	function getPembayaran($siswa,$modul){
		$s ='SELECT max(replid) modul
			FROM keu_pembayaran
			WHERE
				siswa = '.$siswa.' AND 
				modul = '.$modul;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		// return $
	}
	function getTglTrans($siswa,$typ){
		$s='SELECT
				t.replid,
				max(t.tanggal)tgl
			FROM
				keu_transaksi t
				LEFT JOIN keu_penerimaansiswa p ON p.replid = t.pembayaran
				LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
				LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
			WHERE
				p.siswa = '.$siswa.' and (
				k.nama = "'.$typ.'"
			)';
		$e   =mysql_query($s);
		$r   =mysql_fetch_assoc($e);
		$tgl =$r['tgl']!=NULL?tgl_indo5($r['tgl']):'-' ;	
		return $tgl;
	}
	function getAngsur($id){
		$s='SELECT * FROM psb_angsuran WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// return $r[];	
	}
	function getBiayaNet($typ,$siswa){
		$biayaNet = getBiaya($typ,$siswa) - getDiscTotal($typ,$siswa); 		
		return $biayaNet;
	}
	function getStatusBayar($typ,$siswa){
		$biaya = getBiaya($typ,$siswa);
		if($typ=='dpp'){
			$diskonTotal= getDiscTotal($typ,$siswa);
			$biaya-=$diskonTotal; 		
		}$terbayar = getTerbayar($typ,$siswa);			
		// var_dump($biaya);exit();
		if($terbayar<=0){
			$status = 'belum';
		}else{
			if($terbayar==$biaya){
				$status = 'lunas';
			}else{ 
				$status = 'kurang';
			}
		}return $status;
	}
	function getAngsurNom($typ,$siswa){
		$biayaKotor = getBiaya($typ,$siswa);			
		$diskonTotal= getDiscTotal($typ,$siswa);
		$biaya      = $biayaKotor - $diskonTotal; 		
		$angsurkali = getSiswaBy('jmlangsur',$siswa);
		$ret = $biaya/$angsurkali;
		return $ret;
	}
	function akanBayarOpt($typ,$siswa){
		$biayaKotor = getBiaya($typ,$siswa);			// 15.000.000
		$diskonTotal= getDiscTotal($typ,$siswa); 		// 	  900.000
														// __________ -
		$biaya      = $biayaKotor - $diskonTotal; 		// 14.100.000
		$angsurkali = getSiswaBy('jmlangsur',$siswa);	// 3 x  		use
		$terbayar   = getTerbayar($typ,$siswa);			//  4.700.000
		$angsurnom 	= $biaya/$angsurkali;				// @4.700.000	use
		$sisabayar 	= $biaya-$terbayar;					//  9.400.000
		// var_dump($diskonTotal);exit();
		$ret     = array();
		$nominal = 0;
		$count = $sisabayar/$angsurnom; 				// 1 x  
		for ($i=1; $i<=$count; $i++) {
			$nominal+=$angsurnom;
			$ret[] = array(
				'idAngsur'  => $i,
				'nomAngsur' =>'Rp. '.number_format($nominal)
			);
		}
		return $ret;
	}
	function getTerbayar2($idSiswa,$idBiaya){ // to get : nominal yg telah terbayar
		$s ='	SELECT 
					count(*)angsuranke,
					SUM(p.nominal)terbayarTotal,
					p.nominal terbayarBaru
				from  keu_penerimaansiswa p 
					JOIN psb_siswabiaya sb on sb.replid = p.siswabiaya
					JOIN psb_detailbiaya db on db.replid = sb.detailbiaya 
					LEFT JOIN (
						SELECT tt.replid,max(tt.tanggal)tanggal 
						FROM (
							SELECT 
								pp.replid,
								pp.tanggal
							from  keu_penerimaansiswa pp 
								JOIN psb_siswabiaya sb on sb.replid = pp.siswabiaya
								JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
							where 
								sb.siswa = '.$idSiswa.' and 
								db.biaya = '.$idBiaya.' 
							ORDER BY 
								pp.tanggal desc,
								pp.replid desc
						)tt 
					)t on t.replid = p.replid 
				where 
					sb.siswa = '.$idSiswa.' and 
					db.biaya = '.$idBiaya;
					// pr($s);
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r;
	}function getTerbayarTotal($idSiswa,$idBiaya){
		$terbayar =  getTerbayar2($idSiswa,$idBiaya);
		return $terbayar['terbayarTotal'];
	}function getTerbayarAngsuranke($idSiswa,$idBiaya){
		$terbayar =  getTerbayar2($idSiswa,$idBiaya);
		return $terbayar['angsuranke'];
	}function getTerbayarBaru($idSiswa,$idBiaya){
		$terbayar =  getTerbayar2($idSiswa,$idBiaya);
		// pr($terbayar);
		return $terbayar['terbayarBaru'];
	}
	function getTerbayar($typ,$siswa){ // to get : nominal yg telah terbayar
		$s ='SELECT	
				SUM(p.cicilan) terbayar
			FROM
				keu_pembayaran p 
				LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
				LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
			WHERE
				k.nama = "'.($typ=='joiningf' || $typ=='joining fee'?'joining fee':$typ).'" AND 
				p.siswa = '.$siswa.'
			GROUP BY
				p.siswa';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		$rr = $r['terbayar']!=null?$r['terbayar']:0;
		return $rr;
	}
	// function getBiaya($typ,$siswa){ // to get : nominal yg harus dibayar
	// 	if($typ=='pendaftaran'){ // formulir + joining fee
	// 		$f = '(b.daftar + b.joiningf)';
	// 	}elseif($typ=='daftar' || $typ=='formulir'){ // formulir
	// 		$f = 'b.daftar';
	// 	}elseif($typ=='joiningf' || $typ=='joining fee'){ // dpp
	// 		$f = 'b.joiningf';
	// 		$typ='joiningf';
	// 	}elseif($typ=='dpp'){ // dpp
	// 		$f = 'b.nilai';
	// 	}else{ // spp
	// 		$f = 'b.spp';
	// 	}
			
	// 	$s = 'SELECT '.$f.' as '.$typ.'
	// 		  FROM psb_setbiaya b
	// 		  LEFT JOIN psb_calonsiswa c on c.setbiaya = b.replid
	// 		  WHERE c.replid ='.$siswa;
	// 		  // var_dump($s);exit();
	// 	$e = mysql_query($s);
	// 	$r = mysql_fetch_assoc($e);
	// 	return $r[$typ];
	// }function getDiscAngsuran($regNum,$disc){
	// 	$regNum   = getuang($regNum);
	// 	$discPerc = intval(getField('diskon','psb_angsuran','replid',$disc));
	// 	$discNum  = $regNum * $discPerc /100;
	// 	// var_dump($discNum);exit();
	// 	return $discNum;
	// }function getDisc($typ,$siswa){
	// 	if($typ=='disctunai'){ // diskon tunai
	// 		$s     = 'SELECT nilai FROM psb_disctunai WHERE replid ='.getSiswaBy($typ,$siswa);
	// 		$e     = mysql_query($s);
	// 		$r     = mysql_fetch_assoc($e);
	// 		$biaya = getBiaya('registration',$siswa);
	// 		$ret   = $r['nilai'] * $biaya / 100;
	// 	}elseif($typ=='discangsuran'){ // diskon angsuran 
	// 		$angsuran = getSiswaBy('angsuran',$siswa); // suadara || subsisi
	// 		$ret      = getDiscAngsuran(getBiaya('registration',$siswa),$angsuran);
	// 	}else{ // saudara || subsidi
	// 		$ret = getSiswaBy($typ,$siswa);
	// 	}return $ret;
	// }function getDiscTunai($typ,$siswa){
	// 	$s     = 'SELECT nilai FROM psb_disctunai WHERE replid ='.getSiswaBy('disctunai',$siswa);
	// 	$e     = mysql_query($s);
	// 	$r     = mysql_fetch_assoc($e);
	// 	$biaya = getBiaya($typ,$siswa);
	// 	$ret   = $r['nilai'] * $biaya / 100;
	// 	return $ret;
	// }function getDiscTotal($typ,$siswa){
	// 	// var_dump(getSiswaBy('discsaudara',$siswa));exit(); 	150.000
	// 	// var_dump(getSiswaBy('disctb',$siswa));exit(); 		0
	// 	// var_dump(getDiscTunai($typ,$siswa));exit();			750.000
	// 	$ret = getDisc('discangsuran',$siswa)+getDisc('disctunai',$siswa)+getSiswaBy('discsubsidi',$siswa)+getSiswaBy('discsaudara',$siswa);
	// 	// $ret = getDisc('discangsuran',$siswa)+getDisc('disctunai',$siswa)+getDiscTunai($typ,$siswa)+getSiswaBy('disctb',$siswa)+getSiswaBy('discsaudara',$siswa);
	// 	// var_dump($ret);exit();
	// 	return $ret;
	// }
	function getOperator($id){
		$s = '	SELECT k.jenis 
				FROM keu_detilrekening d
					LEFT JOIN keu_kategorirekening k on k.replid = d.kategorirekening  
				WHERE d.replid ='.$id;
		// var_dump($s);exit();		
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		$operator = ($r['jenis']=='debit' OR $r['jenis']=='debit_kredit')?'+':'-';
		return $operator; 
	}function getTahunBuku($x){
		$s = 'SELECT '.$x.' FROM keu_tahunbuku WHERE aktif =1';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$x];
	}

	function getJenisTransaksi($idDetJT){
		$s='SELECT j.kode
			FROM keu_jenistransaksi j
				JOIN keu_detjenistransaksi dj on dj.jenistransaksi = j.replid 
			WHERE dj.replid='.$idDetJT;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['kode'];
	}function getBuktiTrans2($id){
		$s='SELECT * FROM keu_detjenistrans WHERE kode="'.$id.'"';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['bukti'];
	}function getBuktiTrans($id){
		$s='SELECT * FROM keu_detjenistrans WHERE replid="'.$id.'"';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['bukti'];
	}function getDetJenisTransaksi($jTrans,$katTrans){
		$s='SELECT dj.replid
			FROM keu_detjenistransaksi dj
				JOIN keu_kategoritransaksi kt on kt.replid = dj.kategoritransaksi
				JOIN keu_jenistransaksi jt  on jt.replid = dj.jenistransaksi
			WHERE 
				jt.kode = "'.$jTrans.'" AND 
				kt.kategoritransaksi = "'.$katTrans.'"';
		// pr($s);
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['replid'];
	}function getKatModulPemb($nama){
		$s='SELECT * FROM keu_katmodulpembayaran WHERE nama="'.($nama=='joiningf' || $nama=='joining fee'?'joining fee':$nama).'"';
		// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['detjenistrans'];
	}
	function getNoKwitansi($id){
		$s  = '	SELECT 
					b.buktitransaksi,
					CASE j.kode
						when "ju" then "blue" 
						when "in" then "green"
						else "red" 
					end as warna
				FROM keu_transaksi t
					JOIN keu_detjenistransaksi d on d.replid = t.detjenistransaksi
					JOIN keu_buktitransaksi b on b.replid = d.buktitransaksi
					JOIN keu_jenistransaksi j on j.replid = d.jenistransaksi
				WHERE t.replid='.$id;
		// pr($s);
		$tgl = getTglTransaksi($id);
		$y=substr($tgl,0,4);
		$m=substr($tgl,5,2);
		$d=substr($tgl,8,2);
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		$idkwitansi = getField('idkwitansi','keu_transaksi','replid',$id);
		// vd($idkwitansi);
		$nomer = $r['buktitransaksi'].'-'.sprintf("%04d",$idkwitansi).'/'.$d.'/'.$m.'/'.$y;
		$warna =$r['warna'];
		$ret   ='<span style="font-weight:bold;" class="fg-'.$warna.'">'.$nomer.'</span>';
		return $ret;
	}function getNoTrans2($typ){
		$s = 'SELECT LPAD(max(replid),4,0)replid from keu_transaksi';
		$e = mysql_query($s);
		$stat =!$e?'gagal_'.mysql_error():'sukses';
		if(mysql_num_rows($e)>0){
			$r  =mysql_fetch_assoc($e);
			$in =$r['replid']+1;
		}else{
			$in=1;
		}
		$kode=getBuktiTrans2($typ).'-'.sprintf("%04d",$in).'/'.date("m").'/'.date("Y");
		pr($kode);
		return $kode;
	}function getNoTrans($typ){
		$s = 'SELECT LPAD(max(replid),4,0)replid from keu_transaksi';
		$e = mysql_query($s);
		$stat =!$e?'gagal_'.mysql_error():'sukses';
		if(mysql_num_rows($e)>0){
			$r  =mysql_fetch_assoc($e);
			$in =$r['replid']+1;
		}else{
			$in=1;
		}$kode=getBuktiTrans(getKatModulPemb($typ)).'-'.sprintf("%04d",$in).'/'.date("m").'/'.date("Y");
		return $kode;
	}function getRekening($id){
		$s='SELECT concat(kode," - ",nama)rekening FROM keu_detilrekening WHERE replid='.$id;
		// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['rekening'];
	}function getRekBy($f,$id){
		$s='SELECT '.$f.' FROM keu_detilrekening WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}function getKatRekBy($f,$id){
		$s='SELECT '.$f.' FROM keu_kategorirekening WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}

	/*transaksi*/
	function transKode($jt=0){
		$kode=array(0=>'MMJ',3=>'BKM',4=>'BKK');
		return $kode[$jt];
	}function jtrans($i1,$i2,$i3){
		$jArr=array(
				array(
					'kode'  =>'',
					'nama'  =>'jurnal umum',
					'warna' =>'fg-blue',
					'sub'   =>array(
						array('kode'=>1,'nama'=>''),
						array('kode'=>2,'nama'=>'')
					)
				),array(
					'kode'  =>'in',
					'nama'  =>'pemasukkan',
					'warna' =>'fg-lightGreen',
					'sub'   =>array(
						array('kode'=>3,'nama'=>'BKM'),
						array('kode'=>5,'nama'=>'BBM')
					)
				),array(
					'kode'  =>'out',
					'nama'  =>'pengeluaran',
					'warna' =>'fg-lightRed',
					'sub'   =>array(
						array('kode'=>4,'nama'=>'BKK'),
						array('kode'=>6,'nama'=>'BBK')
					)
				),
			);
		// if()
		// $ret=$jArr[$i1];
		// // print_r($ok);
		// return f
	}

	function jenisbukti($a){
		if($a==3) return 'BKM'; //masuk
		else if($a==5) return 'BBM'; //masuk	
		else if($a==4) return 'BKK'; //keluar
		else if($a==6) return 'BBK'; //keluar
		else return ''; //lainnya
	}function ju_nomor($no,$jenis,$bukti){
		#jurnal umum 
		if($jenis==0) $cl='fg-blue'; #umum / JT_UMUM
		#pemasukkan
		else if($jenis==1) $cl='fg-lightGreen'; #siswa /JT_SISWA
		else if($jenis==2) $cl='fg-lightGreen'; #calon siswa /JT_CALONSISWA
		else if($jenis==3) $cl='fg-lightGreen'; #income /JT_INCOME
		else if($jenis==5) $cl='fg-lightGreen'; #inbank /JT_INBANK
		#pengeluaran
		else if($jenis==4) $cl='fg-lightRed'; #outcome /JT_OUTCOME
		else if($jenis==6) $cl='fg-lightRed'; #outbank /JT_OUTBANK
		else if($jenis==7) $cl='fg-lightRed'; #Winbrg /JT_INBRG
		#lainnya
		else $cl=''; # /OTHERS

		$ret='<span style="font-weight:bold;" class="'.$cl.'">'.$no.'</span><br>
			'.jenisbukti($jenis).'<br>
			'.($bukti!=''?$bukti:'');
		return $ret;
	}

	function getuang($str){
		$old = array('-','Rp. ',',','.');
		$new = array('','','','');
		$x   = str_replace($old,$new, $str);
		$y= $x==''?0:$x; 
		return $y;
	}function setuang($str){
		$str = 'Rp. '.str_replace(',','.',number_format($str));
		return $str;
	}
	function getIdKwitansi(){
		$r=getField('max(idkwitansi)','keu_transaksi','','');
		return $r==''?1:($r+1);
	}
	function kwitansiPenerimaanSiswa($idpenerimaansiswa){
		$s='SELECT
                date(p.tanggal)d,
                month(p.tanggal)m,
                year(p.tanggal)y,
                ucase(b.biaya)biaya,	
                lpad(p.idkwitansi,4,0)idkwitansi
              FROM
                keu_penerimaansiswa p
                JOIN psb_siswabiaya sb ON sb.replid = p.siswabiaya
                JOIN psb_detailbiaya db ON db.replid = sb.detailbiaya
                JOIN psb_biaya b ON b.replid = db.biaya
                JOIN psb_siswa s ON s.replid = sb.siswa
              WHERE
                p.replid = '.$idpenerimaansiswa;
        $e=mysql_query($s);
        $r=mysql_fetch_assoc($e);
        $o=$r['biaya'].' - '.$r['idkwitansi'].'/'.substr($keu_penerimaansiswa['d'],8).'/'.$r['m'].'/'.$r['y'];
        return $o;
	}
?>