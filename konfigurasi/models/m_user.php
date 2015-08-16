<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'login';
	$tb  = 'kon_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// view -----------------------------------------------------------------
			case 'tampil':
				$username = isset($_POST['usernameS'])?filter($_POST['usernameS']):'';
				$nama     = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$level    = isset($_POST['levelS']) && $_POST['levelS']!=''?' and lg.id_level ='.filter($_POST['levelS']):'';
				$aktif    = isset($_POST['aktifS']) && $_POST['aktifS']!=''?' and lg.aktif ='.filter($_POST['aktifS']):'';
				$sql  = 'SELECT 
							lg.id_login,
							lg.nama,
							lg.username,
							concat(lv.keterangan," (",lv.level,")")level,
							lg.aktif
						FROM '.$tb.' lg 
							JOIN kon_level lv on lv.id_level = lg.id_level 
						WHERE 
							lg.username like "%'.$username.'%" and
							lg.nama like "%'.$nama.'%"
							'.$level.'
							'.$aktif.'
						ORDER BY 
							lg.nama asc,
							lg.username asc
							';
				// print_r($sql);exit();
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
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button '.isDisabled('user','u').'  data-hint="detail"  onclick="viewFR(\'levelaksi\','.$res['id_'.$mnu].');">
										<i class="icon-zoom-in"></i>
									</button>
									<button '.isDisabled('user','u').' data-hint="ubah"  onclick="viewFR(\'level\','.$res['id_'.$mnu].');">
										<i class="icon-pencil"></i>
									</button>
									<button '.isDisabled('user','d').' data-hint="hapus" onclick="del('.$res['id_'.$mnu].');">
										<i class="icon-remove"></i>
									</button>
								 </td>';
						if($res['aktif']==1){ // aktif
							$clr = 'green';
							$hint= 'aktif';
							$icon= 'checkmark';
						}else{ //tidak aktif
							$clr = '';
							$hint= 'tidak aktif';
							$icon= 'disabled';
						}

						$out.= '<tr>
									<td align="center">'.$res['nama'].'</td>
									<td align="center">'.$res['username'].'</td>
									<td align="center">'.$res['level'].'</td>
									<td align="center">
										<button class="fg-white bg-'.$clr.'" data-hint="'.$hint.'"><i class="icon-'.$icon.'"></i></button>
									</td>
									'.$btn.'
								</tr>';
						// $nox++;
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
				switch ($_POST['subaksi']) {
					case 'levelaksi':
						$stat2=true;
						$s1 = '	DELETE 
								from kon_levelaksi 
								WHERE id_levelkatgrupmenu IN (
										SELECT id_levelkatgrupmenu 
										FROM kon_levelkatgrupmenu 
										WHERE id_level = '.$_POST['id_level'].'
									)';	
						$e1 = mysql_query($s1);
						if(!$e1){
							$stat2=false;
						}else{
							if(isset($_POST['aksiTB'])){
								foreach ($_POST['aksiTB'] as $i => $v) {
									foreach ($_POST['aksiTB'][$i] as $ii => $vv) {
										$sl = ' SELECT id_levelkatgrupmenu from kon_levelkatgrupmenu 
												where 
													id_level       ='.$_POST['id_level'].' AND
													id_katgrupmenu ='.$i;
										$el=mysql_query($sl);
										$rl=mysql_fetch_assoc($el);

										$s2= 'INSERT INTO kon_levelaksi SET id_levelkatgrupmenu ='.$rl['id_levelkatgrupmenu'].',
																			 id_aksi             ='.$ii;
										$e2= mysql_query($s2);
										$stat2=!$e2?false:true;
									}
								}
							}
						}
						$stat=!$stat2?'gagal':'sukses';
						$out=json_encode(array('status'=>$stat));
					break;

					case 'level':
						$stat2 =true;
						$s = $tb.' set 	'.$mnu.' 	= "'.filter($_POST[''.$mnu.'TB']).'",
										keterangan 	= "'.filter($_POST['keteranganTB']).'"';
						if(isset($_POST['id_'.$mnu])){
							$s = 'UPDATE '.$s.' WHERE id_'.$mnu.'='.$_POST['id_'.$mnu];
							$e = mysql_query($s);
							if(!$e){
								$stat2 = false;
							}
						}else{
							$s2 ='INSERT INTO '.$s;
							$e  = mysql_query($s2);
							$id =mysql_insert_id();

							if(!$e){
								$stat2=false;
							}else{
								$s1 = 'SELECT * from kon_katgrupmenu ';
								$e1 = mysql_query($s1);
								while ($r1=mysql_fetch_assoc($e1)) {
									$s2 = 'INSERT INTO kon_levelkatgrupmenu set id_level 		= '.$id.',
																				id_katgrupmenu  = '.$r1['id_katgrupmenu'];
									$e2 = mysql_query($s2);
									$stat2=!$e2?false:true;
								}
							}
						}
						$stat = ($stat2)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat));
					break;
					
				}
			break;
			// add / edit -----------------------------------------------------------------
			

			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where id_'.$mnu.'='.$_POST['id_'.$mnu]));
				$s    = 'DELETE from '.$tb.' WHERE id_'.$mnu.'='.$_POST['id_'.$mnu];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 	= ' SELECT *
						from '.$tb.'
						WHERE id_'.$mnu.'='.$_POST['id_'.$mnu];
				// var_dump($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'level'      =>$r[$mnu],
							'keterangan' =>$r['keterangan']
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
				if(isset($_POST['id_'.$mnu])){
					$w.='where id_ .$mnu='.$_POST['id_'.$mnu];
				}else{
					if(isset($_POST[$mnu])){
						$w.='where '.$mnu.'='.$_POST[$mnu];
					}elseif(isset($_POST['departemen'])){
						$w.='where departemen ='.$_POST['departemen'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY 
							aktif desc,
							nama desc';
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
						if(!isset($_POST['id_'.$mnu])){
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

			// urutan -----------------------------------------------------------------
			case 'urutan':
				// 1 = asal
				// 2 = tujuan
				$_1 = mysql_fetch_assoc(mysql_query('SELECT urutan from '.$tb.' WHERE id_level='.$_POST['replid1']));
				$_2 = mysql_fetch_assoc(mysql_query('SELECT id_level from '.$tb.' WHERE urutan='.$_POST['urutan2']));
				$s1		= ' UPDATE '.$tb.' 
							SET urutan = '.$_POST['urutan2'].'  
							WHERE 
								id_level='.$_POST['replid1'];
				$s2		= ' UPDATE '.$tb.' 
							SET urutan = '.$_1['urutan'].'  
							WHERE 
								id_level='.$_2['id_level'];
				// var_dump($s1);exit();
				$e1 	= mysql_query($s1);
				if(!$e1){
					$stat='gagal ubah urutan semula ';
				}else{
					$e2 = mysql_query($s2);
					if(!$e2)
						$stat = 'gagal ubah urutan kedua';
					else
						$stat= 'sukses';
				}
				$out 	= json_encode(array(
							'status'  =>$stat,
						));
			break;
			// urutan ------			

		}
	}echo $out;

?>