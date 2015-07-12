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
			if(isset($_GET['subaksi']) && $_GET['subaksi']=='karyawan'){
				$ss.='SELECT *
					 FROM (
							SELECT
								k.nama,
								k.nip,
								k.id
							FROM
								hrd_karyawan k
								LEFT JOIN aka_guru g ON g.karyawan = k.id
								LEFT JOIN hrd_jabatan j ON j.id= k.jabatan
							WHERE
								'.(isset($_GET['karyawan']) && $_GET['karyawan']!=''?'k.id='.$_GET['karyawan'].' OR ':'').'
								k.id NOT IN (SELECT gg.karyawan FROM aka_guru gg ) AND
								j.nama LIKE "%guru%"
						) tb
					 WHERE
			 			tb.nama LIKE "%'.$searchTerm.'%" OR 
		 				tb.nip LIKE "%'.$searchTerm.'%"
		 				';
			}
			// vdump($ss);
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
				if(isset($_GET['subaksi']) && $_GET['subaksi']=='karyawan'){
					$rows[]= array(
						'replid' =>$row['id'],
						'nip'    =>$row['nip'],
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
				$nip        = isset($_POST['nipS'])?filter($_POST['nipS']):'';
				$nama       = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$pelajaran  = isset($_POST['pelajaranS'])?filter($_POST['pelajaranS']):'';
				$keterangan = isset($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				$sql = 'SELECT 
							g.replid,
							k.nip,
							k.nama,
							p.nama pelajaran, 
							p.kode, 
							g.keterangan 
						FROM aka_guru g
							LEFT JOIN hrd_karyawan k  ON k.id =g.karyawan
							LEFT JOIN hrd_jabatan j  ON k.id =k.jabatan
							LEFT JOIN aka_pelajaran p ON p.replid =g.pelajaran
						WHERE (
								p.kode LIKE "%'.$nama.'%" AND
								p.nama LIKE "%'.$nama.'%" 
							) 
							AND k.nip LIKE "%'.$nip.'%" 
							AND p.nama LIKE "%'.$pelajaran.'%" 
							AND g.keterangan LIKE "%'.$keterangan.'%" 
						ORDER 
							BY g.replid asc';
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
				$s 		= $tb.' set 	karyawan 	= "'.filter($_POST['karyawanH']).'",
										pelajaran 	= "'.filter($_POST['pelajaranTB']).'",
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
				$e    = mysql_query($s) ;
				$stat = ($e)?'sukses':'gagal_'.mysql_error();
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['tahunajaran']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = ' SELECT
							k.nip,
							k.id idkaryawan,
							k.nama,
							g.pelajaran,
							g.keterangan
						FROM
							aka_guru g 
							LEFT JOIN  hrd_karyawan k on k.id = g.karyawan
							LEFT JOIN aka_pelajaran p on p.replid = g.pelajaran
						WHERE
							g.replid ='.$_POST['replid'];
							// pr($s);
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'idkaryawan' =>$r['idkaryawan'], 
							'nip'        =>$r['nip'],
							'nama'       =>$r['nama'],
							'pelajaran'  =>$r['pelajaran'],
							'keterangan' =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}
	echo $out;
	// echo json_encode($out);
?>