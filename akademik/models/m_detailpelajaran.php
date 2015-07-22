<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'detailpelajaran';
	$tb  = 'aka_'.$mnu;


	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];

			if(!$sidx) 
				$sidx =1;
			$ss='';
			if(isset($_GET['subaksi']) && $_GET['subaksi']=='pelajaran'){
				$ss.='SELECT *
					 FROM (
							SELECT
								p.replid,
								p.nama,
								p.kode
							FROM
								aka_pelajaran p
							WHERE
								'.(isset($_GET['pelajaran']) && $_GET['pelajaran']!=''?'p.replid='.$_GET['pelajaran'].' OR ':'').'
								p.replid NOT IN (
									SELECT d.pelajaran 
									FROM aka_detailpelajaran d 
									WHERE d.subtingkat = '.$_GET['subtingkat'].'
								)	
						) tb
					 WHERE
			 			tb.nama LIKE "%'.$searchTerm.'%" OR 
		 				tb.kode LIKE "%'.$searchTerm.'%"
		 			';
			}
			// pr($ss);
			$result = mysql_query($ss);
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
			// print_r($ss);exit();
			$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
				if(isset($_GET['subaksi']) && $_GET['subaksi']=='pelajaran'){
					$rows[]= array(
						'replid' =>$row['replid'],
						'kode'   =>$row['kode'],
						'nama'   =>$row['nama']
					);
				}
			}$response=array(
				'page'    =>$page,
				'total'   =>$total_pages,
				'records' =>$count,
				'rows'    =>$rows,
			);$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));	
		}
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$subtingkat = isset($_POST['subtingkatS'])?filter($_POST['subtingkatS']):'';
				$pelajaran  = isset($_POST['pelajaranS'])?filter($_POST['pelajaranS']):'';
				$status     = isset($_POST['statusS']) && $_POST['statusS']!=''?' and d.status='.filter($_POST['statusS']):'';
				$sql = 'SELECT 
							d.replid,
							d.status,
							concat(p.nama," (",p.kode,")")pelajaran
						FROM '.$tb.' d 
							LEFT JOIN aka_pelajaran p on p.replid = d.pelajaran
						WHERE 
							d.subtingkat ='.$subtingkat.' and (
								p.nama like "%'.$pelajaran.'%" OR
								p.kode like "%'.$pelajaran.'%" 
							) '.$status.'
						ORDER 
							BY nama asc';
				// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage= 10;//jumlah data per halaman
				$obj 	= new pagination_class($sql,$starting,$recpage,'tampil','');
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button data-hint="ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						if($res['status']=='1'){
							$clr  = 'green';
							$hint = 'Non Aktifkan';
							$stat = 'Aktif';
						}else{
							$clr  ='red';
							$hint = 'Aktifkan';
							$stat = 'Tidak Aktif';
						}
						$out.= '<tr>
									<td>'.$res['pelajaran'].'</td>
									<td align="center"><button onclick="statusFC('.$res['replid'].','.$res['status'].')" data-hint="'.$hint.'" class="fg-white bg-'.$clr.'">'.$stat.'</button></td>
									'.$btn.'
								</tr>';
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
				$s = $tb.' set 	pelajaran = "'.filter($_POST['pelajaranH']).'",
								subtingkat = "'.filter($_POST['subtingkatH']).'"';
				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e2   = mysql_query($s2);
				$stat =!$e2?'gagal menyimpan':'sukses';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':errMsg(mysql_errno(),$d['pelajaran']);
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['replid']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT 
								d.pelajaran idpelajaran,
								concat(p.nama," (",p.kode,")")pelajaran,
								s.tingkat,
								d.subtingkat
							from '.$tb.' d 
								LEFT JOIN aka_pelajaran p on p.replid = d.pelajaran
								LEFT JOIN aka_subtingkat s on s.replid = d.subtingkat 
								LEFT JOIN aka_tingkat t on t.replid = s.tingkat 
							WHERE 
								d.replid='.$_POST['replid'];
								// pr($s);
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'tingkat'     =>$r['tingkat'],
							'subtingkat'  =>$r['subtingkat'],
							'pelajaran'   =>$r['pelajaran'],
							'idpelajaran' =>$r['idpelajaran'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$s    = 'UPDATE  '.$tb.' set status='.($_POST['status']==1?0:1).' WHERE replid = '.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = !$e?'gagal':'sukses';
				$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbpelajaran-----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				// if(isset($_POST['replid'])){
				// 	$w='where replid ='.$_POST['replid'];
				// }else{
					if(isset($_POST[$mnu])){
						$w='where '.$mnu.'='.$_POST[$mnu];
					}elseif (isset($_POST['tahunajaran'])) {
						$w='where tahunajaran='.$_POST['tahunajaran'];
					}
				// }
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY nama asc';
				// print_r($s);exit();
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar = $dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n==0){ // kosong 
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses','pelajaran'=>$dt);
					}
				}
				$out=json_encode($ar);
			break;
			// cmbpelajaran -----------------------------------------------------------------

		}
	}	echo $out;
	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>