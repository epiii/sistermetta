<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu  = 'calonsiswa';
	$mnu2 = 'siswa';
	$tb   = 'psb_'.$mnu;
	$tb2  = 'aka_'.$mnu2;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$nopendaftaran = isset($_POST['no_pendaftaranS'])?filter($_POST['no_pendaftaranS']):'';
				$kelompok      = isset($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
				$nama          = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$sql = 'SELECT c.nama,
								c.replid,
								c.nopendaftaran,
								c.kelompok,
								c.status,
								c.nis,
								c.nisn
						FROM '.$tb.' c 
						WHERE 
							c.nopendaftaran like "%'.$nopendaftaran.'%" and
							c.nama like "%'.$nama.'%" and
							c.kelompok = '.$kelompok.'
						ORDER 
							BY c.nopendaftaran asc';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 5;
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($r = mysql_fetch_assoc($result)){	
						if($r['aktif']=1){
							$dis  = 'disabled';
							$ico  = 'checkmark';
							$hint = 'telah Aktif';
							$func = '';
						}else{
							$dis  = '';
							$ico  = 'blocked';
							$hint = 'Aktifkan';
							$func = 'onclick="aktifkan('.$r['replid'].');"';
						}

						$btn ='<td>
									<button data-hint="Lihat detail siswa"  onclick="loadModal(\'sudah\','.$r['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						//Tombol Status								 
						if($r['status']==1){
							$btn_terima ='<td>
										<button data-hint="Klik untuk membatalkan penerimaan"  class="bg-darkGreen fg-white" onclick="loadModal(\'sudah\','.$r['replid'].');">
											Diterima
										</button>
									 </td>';
						}else{
							$btn_terima ='<td>
										<button data-hint="Klik untuk melakukan penerimaan"  onclick="loadModal(\'belum\','.$r['replid'].');">
											Blm diterima
										</button>
									 </td>';						
						}
						$out.= '<tr>
									<td>'.getNoPendaftaran($r['replid'],$r['kelompok'])['full'].'</td>
									<td>'.$r['nama'].'</td>
									<td>'.($r['nis']==''?'-':$r['nis']).'</td>
									<td>'.($r['nisn']==''?'-':$r['nisn']).'</td>
									'.$btn_terima.'
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

			// edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'penerimaan':
						// $s = 'SELECT * 
						// 		FROM 
						// 		psb_calonsiswa
						// 		WHERE replid = '.$_POST['idformH_terima'];
						// $e = mysql_query($s);
						// $r = mysql_fetch_assoc($e);

												// var_dump($s2);exit();
						// $e2 =  mysql_query($s2);
						// if ($e2) {
							$s3 = 'UPDATE psb_calonsiswa set status  = 1,
												angkatan      = "'.filter($_POST['idformH_angkatan']).'",
												nis           = "'.filter($_POST['nisTB']).'",
												nisn          = "'.filter($_POST['nisnTB']).'"
										WHERE replid='.$_POST['idformH_terima'];
							$e3 =  mysql_query($s3);
							// print_r($e3);exit();
							// var_dump($s3);exit();
							if ($e3) {
							$stat = 'sukses';
							}else{
							$stat = 'gagal_update_calon_siswa';
								
							}
						
						// $x = mysql_fetch_assoc(mysql_query('select * from psb_calonsiswa where replid= '.$_POST['replid']));
						// var_dump($x);exit();
						// $s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// $e2 = mysql_query($s2) or die(mysql_error());
						// if(!$e2){
						// 	$stat = 'gagal menyimpan';
						// }else{
						// }
						$out  = json_encode(array('status'=>$stat));
					break;

					case 'tidak_terima':
						$s = 'SELECT * 
								FROM 
								psb_calonsiswa
								WHERE replid = '.$_POST['idformH_batal'];
						$e = mysql_query($s);
						$r = mysql_fetch_assoc($e);


						$s2  ='DELETE FROM '. $tb2.' WHERE nopendaftaran = "'.$r['nopendaftaran'].'"'  ;
												
												// var_dump($s2);exit();
						$e2 =  mysql_query($s2);
						if ($e2) {
							$s3 = 'UPDATE psb_calonsiswa set status  = 0 WHERE replid='.$_POST['idformH_batal'];
							$e3 =  mysql_query($s3);
							if ($e3) {
								# code...
							$stat = 'sukses';
							}else{
							$stat = 'gagal_update_calon_siswa';
								
							}
						}else{
							$stat = 'gagal_delete_aka_siswa';
						}
						
						$out  = json_encode(array('status'=>$stat));
					break;
					/*case 'status':
						$s    = $tb.' set 	nama = "'.filter($_POST['namaTB']).'",';
						$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						$e    = mysql_query($s2);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat));
					break;*/
				}
			break;		
					
			// edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'status';
						$s = 'SELECT
								c.nama,
								c.nopendaftaran,
								a.angkatan
							FROM
								psb_calonsiswa c
								JOIN psb_kelompok k ON k.replid = c.kelompok
								JOIN psb_proses p ON p.replid = k.proses
								LEFT JOIN aka_angkatan a ON a.replid = p.angkatan
							WHERE
								c.replid='.$_POST['replid'];
						print_r($s);exit();
						$e    = mysql_query($s);
						$r    = mysql_fetch_assoc($e);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array(
									'status' =>$stat,
									'data'   =>array(
										'nama'          =>$r['nama'],
										'nopendaftaran' =>$r['nopendaftaran'],
										'departemen'    =>$r['departemen'],
										'idangkatan'    =>$r['idangkatan'],
										'angkatan'      =>$r['angkatan']
								)));					
					break;

					case 'batal':
						$s 		= ' SELECT replid,
										   nama nama_batal	
									from '.$tb.'
									WHERE 
										replid='.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
							'status'     =>$stat,
							'nama_batal' =>$r['nama_batal'],
							// 'nopendaftaran' =>$r['nopendaftaran'],
						));
					break;
				}
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}
	echo $out;
?>