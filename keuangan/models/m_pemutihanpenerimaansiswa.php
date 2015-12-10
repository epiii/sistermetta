<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/tglindo.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'pemutihanpenerimaansiswa';
	$tb  = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];
			$biayaArr   = (isset($_GET['biayaArr']) AND $_GET['biayaArr']!='')?' idsiswabiaya NOT IN ('.$_GET['biayaArr'].') AND ':''; 

			if(!$sidx) $sidx =1;

			if($_GET['subaksi']=='siswa'){ // data siswa
				$ss='SELECT
						idsiswa,
						namasiswa,
						nisn,
						nis,
						concat(tingkat,"-",subtingkat," ",kelas)kelas
					FROM
						vw_siswa_kelas
					WHERE
						iddepartemen = '.$_GET['iddepartemen'].' AND
						idtingkat = '.$_GET['idtingkat'].' AND
						idtahunajaran = '.$_GET['idtahunajaran'].' AND	
						idsubtingkat = '.$_GET['idsubtingkat'].' AND (
							nis LIKE "%'.$searchTerm.'%" OR 
							namasiswa LIKE "%'.$searchTerm.'%"
						) and idsiswa NOT IN (
							SELECT p.siswa 
							FROM keu_pemutihanpenerimaansiswa p 
								JOIN keu_subpemutihanpenerimaansiswa s on s.pemutihanpenerimaansiswa = p.replid
								JOIN psb_siswabiaya sb on sb.replid = s.siswabiaya
								JOIN psb_detailbiaya db ON db.replid = sb.detailbiaya
								JOIN psb_detailgelombang dg on dg.replid = db.detailgelombang 
							WHERE
								dg.tahunajaran = '.$_GET['idtahunajaran'].'
						)';
			}else{ // biaya 
				$ss='SELECT
						idsiswabiaya,
						biaya,
						getBiayaNett(idsiswabiaya)biayaNett,
						(getBiayaNett(idsiswabiaya)-getBiayaTerbayar(idsiswabiaya))biayaKurang
					FROM vw_siswa_biaya
					WHERE 	
						'.$biayaArr.'
						idsiswa = '.$_GET['idsiswa'].'
						AND idtahunajaran ='.$_GET['idtahunajaran'].'	
						and biaya LIKE "%'.$searchTerm.'%" 
						AND getBiayaTerbayar(idsiswabiaya)!=getBiayaNett(idsiswabiaya)';
			}
// pr($ss);
			$result = mysql_query($ss) or die(mysql_error());
			$row    = mysql_fetch_array($result,MYSQL_ASSOC);
			$count  = mysql_num_rows($result);

			if( $count >0 ) {
				$total_pages = ceil($count/$limit);
			} else {
				$total_pages = 0;
			}
			if ($page > $total_pages) $page=$total_pages;
			$start 	= $limit*$page - $limit; // do not put $limit*($page - 1)
			if($total_pages!=0) {
				$ss.='ORDER BY '.$sidx.' '.$sord.' LIMIT '.$start.','.$limit;
			}else {
				$ss.='ORDER BY '.$sidx.' '.$sord;
			}

			$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
				if($_GET['subaksi']=='siswa'){
					$rows[]= array(
						'idsiswa'   =>$row['idsiswa'], 
						'namasiswa' =>$row['namasiswa'], 
						'nis'       =>$row['nis'], 
						'nisn'      =>$row['nisn'], 
						'kelas'     =>$row['kelas']
					);
				}else{ // biaya 
					$rows[]= array(
						'idsiswabiaya' =>$row['idsiswabiaya'], 
						'biaya'        =>$row['biaya'], 
						'biayaNett'    =>setuang($row['biayaNett']), 
						'biayaKurang'  =>setuang($row['biayaKurang']), 
					);
				}
			}$response=array(
				'page'    =>$page,
				'total'   =>$total_pages,
				'records' =>$count,
				'rows'    =>$rows,
			);$out=json_encode($response);
		}else $out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// view -----------------------------------------------------------------
			case 'tampil':
				$departemen = (isset($_POST['departemenS']) and filter($_POST['departemenS'])!='')?' v.iddepartemen='.filter($_POST['departemenS']).' AND ':'';
				$tingkat    = (isset($_POST['tingkatS']) and filter($_POST['tingkatS'])!='')?' v.idtingkat='.filter($_POST['tingkatS']).' AND  ':'';
				$tahunajaran = (isset($_POST['tahunajaranS']) and filter($_POST['tahunajaranS'])!='')?' v.idtahunajaran='.filter($_POST['tahunajaranS']).' AND ':'';
				$subtingkat = (isset($_POST['subtingkatS']) and filter($_POST['subtingkatS'])!='')?'  v.idsubtingkat='.filter($_POST['subtingkatS']).' AND ':'';

				$nis       = (isset($_POST['nisS']) and filter($_POST['nisS'])!='')?filter($_POST['nisS']):'';
				$namasiswa = (isset($_POST['siswaS']) and filter($_POST['siswaS'])!='')?filter($_POST['siswaS']):'';
				$nomom     = (isset($_POST['nomomS']) and filter($_POST['nomomS'])!='')?filter($_POST['nomomS']):'';
				$sql  = 'SELECT
							p.replid,
							p.tgl,
							p.tglmom,
							p.nomom,
							s.siswabiaya,
							sum(v.biayaKurang)biayaKurangTot,
							v.namasiswa,
							v.nis
						FROM
							keu_pemutihanpenerimaansiswa p
							JOIN keu_subpemutihanpenerimaansiswa s ON s.pemutihanpenerimaansiswa = p.replid
							JOIN vw_siswa_biaya v on v.idsiswabiaya = s.siswabiaya
						WHERE	
							'.$departemen.$tingkat.$tahunajaran.$subtingkat.' 
							p.nomom LIKE "%'.$nomom.'%" AND
							v.nis LIKE "%'.$nis.'%" AND
							v.namasiswa LIKE "%'.$namasiswa.'%" 
						GROUP BY
							p.replid
						ORDER BY 	
							tglmom desc';
						// pr($sql);	
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 10;
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  = $obj->result;

				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox =$starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button '.(isAksi($mnu,'u')?'onclick="viewFR('.$res['replid'].');"':'disabled').' data-hint="ubah"  >
										<i class="icon-pencil"></i>
									</button>
									<button '.(isAksi($mnu,'d')?'onclick="del('.$res['replid'].');"':'disabled').' data-hint="hapus" >
										<i class="icon-remove"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td>'.tgl_indo5($res['tgl']).'</td>
									<td>'.$res['nis'].'</td>
									<td>'.$res['namasiswa'].'</td>
									<td>-</td>
									<td>'.$res['nomom'].'</td>
									<td>'.tgl_indo5($res['tglmom']).'</td>
									<td align="right">'.setuang($res['biayaKurangTot']).'</td>
									'.$btn.'
								</tr>';
									// <td>'.getTotalPemutihan($res['replid']).'</td>
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9 ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
			break;
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s = $tb.' set 	
						siswa    = "'.filter($_POST['siswaH']).'",
						tgl      = curdate(),
						karyawan ='.$_SESSION['id_loginS'].',
						nomom    = "'.filter($_POST['nomomTB']).'",
						tglmom   = "'.tgl_indo6(filter($_POST['tglmomTB'])).'"';
				$s1 = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e1 = mysql_query($s1);
				$id = (isset($_POST['replid']) &&  $_POST['replid']=='')?$_POST['replid']:mysql_insert_id();
				if(!$e1){
					$stat='gagal_simpan_pemutihan';
				}else{
					$stat2=true;
					foreach ($_POST['biaya'] as $i => $v) {
						$ss ='INSERT INTO keu_subpemutihanpenerimaansiswa SET 
								pemutihanpenerimaansiswa ='.$id.',
								siswabiaya               ='.$v;
						$e2    = mysql_query($ss);
						$stat2 = !$e2?false:true;
					}$stat=!$stat2?'gagal_simpan_sub':'sukses';
				}$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$s    = 'DELETE from '.$tb.' WHERE replid ='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>getField('namasiswa','psb_siswa','replid',$_POST['replid'])));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s1 = '	SELECT * 
						FROM '.$tb.'
						WHERE replid ='.$_POST['replid'];
				$e1   = mysql_query($s1);
				$r1   = mysql_fetch_assoc($e1);
				$stat =!$e1?'gagal':'sukses';
				$out  = json_encode(array(
							'status'     =>$stat,
							'viabayar'   =>$r1['viabayar'],
							'keterangan' =>$r1['keterangan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0"');
				if(!$e1){
					$stat='gagal menonaktifkan';
				}else{
					$s2 = 'UPDATE  '.$tb.' set aktif="1" where id_ .$mnu= '.$_POST['id_'.$mnu];
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat='gagal mengaktifkan';
					}else{
						$stat='sukses';
					}
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbwarna -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w.='where sd.replid='.$_POST['replid'];
				}else{
					if(isset($_POST['tingkat'])){
						$w.='where sd.tingkat = '.$_POST['tingkat'];
					}
				}
				
				$s	= ' SELECT
							sd.replid,	
							d.dokumen,	
							sd.jumlah,
							sj.satuanjumlah
						FROM
							psb_subdokumen sd
							JOIN psb_dokumen d on d.replid = sd.dokumen
							JOIN psb_satuanjumlah sj on sj.replid = sd.satuanjumlah
						'.$w;
				// var_dump($s);exit();
				$e 	= mysql_query($s);
				$n 	= mysql_num_rows($e);
				$ar=$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
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
						}$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbtahunajaran -----------------------------------------------------------------
		}
	}echo $out;

?>