<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$tb = 'aka_guru';

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
			if(isset($_GET['subaksi']) && $_GET['subaksi']=='pegawai'){
				$ss.='SELECT *
					 FROM (
							SELECT
								k.nama,
								k.nip,
								k.id
							FROM
								hrd_karyawan k
								LEFT JOIN aka_guru g ON g.pegawai = k.id
							WHERE
								'.(isset($_GET['pegawai']) && $_GET['pegawai']!=''?'k.id='.$_GET['pegawai'].' OR ':'').'
								k.id NOT IN (SELECT gg.pegawai  FROM aka_guru gg WHERE gg.tahunajaran = '.$_GET['tahunajaran'].')
						) tb
					 WHERE
			 			tb.nama LIKE "%'.$searchTerm.'%" OR 
		 				tb.nip LIKE "%'.$searchTerm.'%"
		 				';
			}
// var_dump($ss);exit();
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
				if(isset($_GET['subaksi']) && $_GET['subaksi']=='pegawai'){
					$rows[]= array(
						'replid' =>$row['id'],
						'nip'   =>$row['nip'],
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
				$tahunajaran = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				$nip         = isset($_POST['nipS'])?filter($_POST['nipS']):'';
				$nama        = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$pelajaran   = (isset($_POST['pelajaranS'])and !empty($_POST['pelajaranS']))?' AND g.pelajaran='.$_POST['pelajaranS']:'';
				$sql = 'SELECT 
							g.*,
							t.tahunajaran, 
							j.nama AS pelajaran, 
							k.nip, 
							k.nama
						FROM aka_guru g
							LEFT JOIN hrd_karyawan k  ON k.id=g.pegawai
							LEFT JOIN aka_pelajaran j ON j.replid=g.pelajaran
							LEFT JOIN aka_tahunajaran t ON t.replid=g.tahunajaran
						WHERE 
							k.nama LIKE "%'.$nama.'%" AND
							k.nip LIKE "%'.$nip.'%" AND
							g.tahunajaran ='.$tahunajaran.$pelajaran.'
						ORDER 
							BY g.replid asc';
				// print_r($sql);exit();
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
						$btn ='<td>
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td>'.$res['nip'].'</td>
									<td>'.$res['nama'].'</td>
									<td>'.$res['pelajaran'].'</td>
									<td>'.$res['keterangan'].'</td>
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
				$s 		= $tb.' set 	pegawai 	= "'.$_POST['pegawaiH'].'",
										tahunajaran	= "'.$_POST['tahunajaran'].'",
										pelajaran 	= "'.$_POST['pelajaranTB'].'",
										keterangan  = "'.filter($_POST['keteranganTB']).'"';
				$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e 		= mysql_query($s2);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['tahunajaran']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = ' SELECT
							g.pegawai AS idpegawai,
							k.nip,
							k.nama,
							g.pelajaran,
							g.tahunajaran,
							g.keterangan
						FROM
							aka_guru g 
							LEFT JOIN  hrd_karyawan k on k.id = g.pegawai
							LEFT JOIN aka_pelajaran p on p.replid = g.pelajaran
						WHERE
							g.replid ='.$_POST['replid'];
				// print_r($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'      =>$stat,
							'idpegawai'   =>$r['idpegawai'], 
							'nip'         =>$r['nip'],
							'nama'        =>$r['nama'],
							'pelajaran'   =>$r['pelajaran'],
							'tahunajaran' =>$r['tahunajaran'],
							'keterangan'  =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}
	echo $out;
	// echo json_encode($out);
?>