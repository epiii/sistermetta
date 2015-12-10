<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu  = 'saldorekening';
	$tb   = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$kategorirekening = (isset($_POST['kategorirekeningS']) and $_POST['kategorirekeningS']!='')?' kr.replid='.$_POST['kategorirekeningS'].' AND':'';
				$kode             = isset($_POST['kodeS'])?filter($_POST['kodeS']):'';
				$nama             = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$tahunajaran      = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';

				$sql = 'SELECT
							sr.replid,
							r.replid idrekening,
							kr.replid idkategorirekening,
							kr.nama kategorirekening,
							r.kode,
							r.nama,
							kr.jenis,
							IFNULL(sr.nominal,0)saldo
						FROM
							keu_detilrekening r
							LEFT JOIN keu_saldorekening sr ON sr.detilrekening = r.replid
							LEFT JOIN keu_kategorirekening kr ON kr.replid = r.kategorirekening
						WHERE
							'.$kategorirekening.'
							r.nama LIKE "%'.$nama.'%"
							AND r.kode LIKE "%'.$kode.'%"
							AND sr.tahunajaran = "'.$tahunajaran.'"';
							// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage = 10;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;
				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					$curKat = '';
					$ec = mysql_query($sql);
					while($res = mysql_fetch_assoc($result)){	
							if($res['idkategorirekening']!=$curKat){ // kategori rek 
								$ss = 'SELECT replid,nama,RPAD(kode,6,0)kode from keu_kategorirekening where replid='.$res['idkategorirekening'];	
								$ee = mysql_query($ss);
								$rr = mysql_fetch_assoc($ee);
								$out.= '<tr class="bg-lightTeal">
											<td align="right"><b>'.$rr['kode'].'</b></td>
											<td colspan="6"><b>'.$rr['nama'].'</b></td>
										</tr>';
							}
							$btn ='<td align="center">
										<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
											<i class="icon-pencil on-left"></i>
										</button>
								 </td>';
							$saldoAwal   = setuang($res['saldo']);
							$out.= '<tr>
										<td class="text-right">'.$res['kode'].'</td>
										<td>'.$res['nama'].'</td>
										<td class="text-right">'.($res['jenis']=='d'?'debit':'kredit').'</td>
										<td class="text-right">'.$saldoAwal.',-</td>
										'.$btn.'
									</tr>';
							$curKat=$res['idkategorirekening'];
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.='<tr class="info"><td colspan="9">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="9">'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s    =' UPDATE '.$tb.' set nominal = '.getuang(filter($_POST['nominalTB'])).' 
						WHERE replid ='.$_POST['replid'];
								// pr($s);
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			
			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = 'SELECT
						t.tahunajaran,
						kr.nama kategorirekening,
						r.kode,
						r.nama,
						kr.jenis,
						IFNULL(sr.nominal,0)nominal
					FROM
						keu_detilrekening r
						JOIN keu_saldorekening sr ON sr.detilrekening = r.replid
						JOIN keu_kategorirekening kr ON kr.replid = r.kategorirekening
						JOIN aka_tahunajaran t ON t.replid =sr.tahunajaran
					WHERE
						sr.replid ='.$_POST['replid'];
				// vd($s);
				$e   = mysql_query($s);
				$r   = mysql_fetch_assoc($e);
				$out = json_encode(array(
							'tahunajaran'        =>$r['tahunajaran'],
							'kategorirekening' =>$r['kategorirekening'],
							'kode'             =>$r['kode'],
							'nama'             =>$r['nama'],
							'jenis'            =>jenisRek($r['jenis']),
							'nominal'          =>$r['nominal']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmbkategorirek -----------------------------------------------------------------
			case 'cmbkategorirek':
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where '.$mnu.'='.$_POST[$mnu];
					}
				}
				
				$s	= ' SELECT *
						from keu_kategorirek
							'.$w.'		
						ORDER  BY 
							kode asc ,
							nama asc';

				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error'.mysql_error());
				}else{
					if($n=0){ // kosong 
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses','kategorirek'=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbdepartemen -----------------------------------------------------------------

		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>