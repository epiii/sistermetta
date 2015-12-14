<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	// $mnu  = 'pembayaran';
	$mnu  = 'penerimaansiswa';
	$mnu2 = 'rekening';
	$mnu3 = 'katalog';
	$mnu4 = 'barang';
	$mnu5 = 'jenis';
	
	$tb   = 'keu_'.$mnu;
	$tb2  = 'keu_'.$mnu2;
	$tb3  = 'keu_'.$mnu3;
	$tb4  = 'keu_'.$mnu4;
	$tb5  = 'keu_'.$mnu5;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; // get the requested page
				$limit      = $_GET['rows']; // get how many rows we want to have into the grid
				$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
				$sord       = $_GET['sord']; // get the direction
				$searchTerm = $_GET['searchTerm'];

				if(!$sidx) 
					$sidx =1;
				$ss='SELECT *
					FROM '.$tb2.' 
					WHERE	kode  LIKE "%'.$searchTerm.'%"
							OR nama LIKE "%'.$searchTerm.'%"';
				// print_r($ss);exit();
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
					$rows[]= array(
						'replid' =>$row['replid'],
						'kode'   =>$row['kode'],
						'nama'   =>$row['nama'],
					);
				}$response=array(
					'page'    =>$page,
					'total'   =>$total_pages,
					'records' =>$count,
					'rows'    =>$rows,
				);
			$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));
		}
	}else{
		switch ($_POST['aksi']) {
			// history bayar
			case 'histBayar':
				$s ='SELECT p.replid, p.tanggal,p.nominal,p.idkwitansi
					 FROM '.$tb.' p 
					 WHERE p.siswabiaya = '.$_POST['siswabiaya'].'
					 ORDER BY p.tanggal ASC,p.replid ASC';
				$e   = mysql_query($s);
				$arr = array();
				$totNominal=0;$angsuranKe=1;
				while ($r=mysql_fetch_assoc($e)){
					$arr[]=array(
						'replid'     =>$r['replid'],
						'angsuranKe' =>$angsuranKe,
						'nominal'    =>setuang($r['nominal']),
						'tanggal'    =>tgl_indo5($r['tanggal']),
						'idkwitansi' =>$r['idkwitansi'],
					);$totNominal+=$r['nominal'];$angsuranKe++;
				}$out = json_encode(array('status'=>$e?'sukses':'gagal','datax'=>$arr,'totNominal'=>setuang($totNominal)));
			break;

			// tampil ---------------------------------------------------------------------
			case 'tampil':
				$departemen  = isset($_POST['departemenS'])?filter($_POST['departemenS']):'';
				$tahunajaran = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				$subtingkat  = isset($_POST['subtingkatS'])?filter($_POST['subtingkatS']):'';
				$biaya       = isset($_POST['biayaS'])?filter($_POST['biayaS']):'';
				// opsional 
				$semester    = isset($_POST['semesterS']) && $_POST['semesterS']!='' && $_POST['semesterS']!='null'?' AND idsemester ='.filter($_POST['semesterS']):'';
				$bulan       = isset($_POST['bulanS']) && $_POST['bulanS']!='' && $_POST['bulanS']!='null'?' AND idsemester ='.filter($_POST['bulanS']):'';
				
				$nis           = isset($_POST['nisS'])?filter($_POST['nisS']):'';
				$nisn          = isset($_POST['nisnS'])?filter($_POST['nisnS']):'';
				$namasiswa     = isset($_POST['namasiswaS'])?filter($_POST['namasiswaS']):'';
				$nopendaftaran = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
				$statusbayar   = isset($_POST['statusS']) && $_POST['statusS']!=''?' AND getStatusBayar(idsiswabiaya) ="'.filter($_POST['statusS']).'"':'';

				$sql = 'SELECT
							idsiswa,
							nopendaftaran,
							nis,
							nisn,
							namasiswa,
							idtingkat,
							getBiayaNett(idsiswabiaya)tagihan,
							getBiayaTerbayar(idsiswabiaya)terbayar,
							getStatusBayar(idsiswabiaya)statusBayar
						FROM vw_siswa_biaya 
						WHERE
							status != "2"
							AND nopendaftaran LIKE "%'.$nopendaftaran.'%"
							AND idtahunajaran = '.$tahunajaran.'
							AND iddepartemen= '.$departemen.'
							AND idsubtingkat= '.$subtingkat.'
							AND idbiaya = '.$biaya.'
							AND namasiswa LIKE "%'.$namasiswa.'%" 
							AND nis LIKE "%'.$nis.'%" 
							AND nisn LIKE "%'.$nisn.'%" 
							'.$statusbayar.$semester.'
						GROUP BY
							idsiswa
						ORDER BY
							idsubtingkat asc';
							// pr($sql);
				if(isset($_POST['starting'])){ 
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 10;
				$aksi    ='tampil';
				$subaksi = 'penerimaansiswa';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum = mysql_num_rows($result);
				$out ='';$totaset=0;
				if($jum!=0){	
					$nox = $starting+1;
					while($res = mysql_fetch_assoc($result)){
						$color  = $res['statusBayar']=='lunas'?'green':($res['statusBayar']=='belum'?'red':'yellow');
						$btn ='<td align="center">
									<button style="font-weight:bold;" onclick="viewFR('.$res['idsiswa'].')"; class="fg-white bg-'.$color.'">
										'.$res['statusBayar'].'
									</button>
							   </td>';
					 	$out.= '<tr>
									<td>'.getNoPendaftaran2($res['idsiswa']).'</td>
									<td>'.$res['namasiswa'].'</td>
									<td>'.$res['nisn'].'</td>
									<td>'.$res['nis'].'</td>
									<td>'.setuang($res['tagihan']).'</td>
									<td>'.setuang($res['terbayar']).'</td>
									'.$btn.'
									<td align="center">
										<button style="font-weight:bold;" onclick="viewFR2('.$res['idsiswa'].')"; class="fg-white bg-blue">
											<i class="icon-copy"></i>
										</button>
									</td>
								</tr>';
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
			// tampil ---------------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				// $ditagih = getField('ditagih','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);
				$idkww   = intval(getField('max(idkwitansi)',$tb,'',''));
				$idkw    = $idkww==''?1:($idkww+1);
				$nominal = getuang($_POST['akanBayarJenisTB']=='1'?$_POST['akanBayarNominalTB1']:$_POST['akanBayarNominalTB2']);
						// semester   = '.($ditagih=='12'||$ditagih=='2'?$_POST['semesterH']:'').',
						// bulan      = '.($ditagih=='12'||$ditagih=='2'?$_POST['bulanH']:'').',
				$s = 'INSERT INTO '.$tb.' set 	
						siswabiaya = '.$_POST['idsiswabiayaTB'].',
						nominal    = '.$nominal.',
						viabayar2  = '.$_POST['viaBayarTB'].',
						tanggal    = "'.tgl_indo6($_POST['tanggalTB']).'",
						idkwitansi = '.$idkw;
						// pr($s);

				$e  = mysql_query($s);
				$idPenerimaanSiswa = mysql_insert_id();
				if(!$e) $stat='gagal_insert_pembayaran';
				else{
					// 2. simpan transaksi
					$idsiswa   = getField('idsiswa','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);
					$namasiswa = getField('namasiswa','psb_siswa','replid',$idsiswa);
				//kelas --------
					$sk='SELECT 	
							concat((SELECT tingkat from aka_tingkat WHERE replid = idtingkat)," - ",
							(SELECT subtingkat from aka_subtingkat WHERE replid = idsubtingkat),"",
							(SELECT kelas from aka_kelas WHERE replid = idkelas ))kelas 
						FROM vw_siswa_kelas 
						WHERE 
							idtahunajaran = "'.$_POST['idtahunajaranH'].'" AND 
							idsiswa = "'.$idsiswa.'"';
					$ek=mysql_query($sk);
					$rk=mysql_fetch_assoc($ek);
				// biaya
					$biaya  = getField('(SELECT biaya FROM psb_biaya WHERE replid=idbiaya)','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);
					$uraian = 'Pembayaran '.$biaya.' siswa <br> Nama : '.$namasiswa.'<br> Kelas :'.$rk['kelas'];
					$iddepartemen =getField('iddepartemen','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);
					$idtingkat    =getField('idtingkat','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);

					$s2 = 'INSERT INTO keu_transaksi SET 	
							departemen        ='.$iddepartemen.',
							tingkat           ='.$idtingkat.',
							idref             ='.$idPenerimaanSiswa.',
							idkwitansi        ='.getIdKwitansi().',
							tanggal           ="'.tgl_indo6($_POST['tanggalTB']).'",
							uraian            ="'.$uraian.'",
							detjenistransaksi ='.getDetJenisTransaksi('in','siswa');
					$e2  = mysql_query($s2);
					$idTransaksi = mysql_insert_id();
					if(!$e2) $stat='gagal_insert_transaksi';
					else{
						$iddepartemen  = getField('iddepartemen','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);
						$idtahunajaran = getField('idtahunajaran','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);
						$idbiaya       = getField('idbiaya','vw_siswa_biaya','idsiswabiaya',$_POST['idsiswabiayaTB']);
						$idrekeningbiaya     = getRekeningBiaya($iddepartemen,$idtahunajaran,$idbiaya);
						$detrekeningbiayaArr = getDetRekeningBiayaArr($idrekeningbiaya);
					// insert jurnal + update saldo rekening
						$addJurnal           = addJurnal($idTransaksi,$detrekeningbiayaArr,$nominal,$idtahunajaran);
						$stat=!$addJurnal?'gagal_insert_jurnal':'sukses';
					}
				}$out = json_encode(array('status'=>$stat,'idpembayaran'=>$idPenerimaanSiswa));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				$detjenistransaksi = getDetJenisTransaksi('in','siswa');
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				if(!$e){
					$stat='gagal_hapus_penerimaansiswa';
				}else{
					$del=delRecord('keu_transaksi',array('idref' => $_POST['replid'],'detjenistransaksi'=>$detjenistransaksi));
					// pr($del);
					$stat=!$del?'gagal_hapus_transaksi':'sukses';
				}$out  = json_encode(array('status'=>$stat,'terhapus'=>$mnu));
			break;
			// delete ---------------------------------------------------------------------

			case 'invoiceView':
				$s ='SELECT
						d.nama departemen,
						concat(ta.tahunajaran," - ",ta.tahunajaran+1)tahunajaran,
						s.namasiswa,
						s.nis,
						s.nisn,
						s.nopendaftaran,
						CONCAT(t.tingkat," - ",st.subtingkat,"",k.kelas)kelas
					FROM
						psb_siswa s
						JOIN psb_siswabiaya sb ON sb.siswa = s.replid
						JOIN psb_detailbiaya db ON db.replid = sb.detailbiaya
						JOIN psb_detailgelombang dg ON dg.replid = db.detailgelombang
						JOIN departemen d ON d.replid = dg.departemen
						JOIN aka_tahunajaran ta  ON ta.replid = dg.tahunajaran
						JOIN aka_siswakelas sk ON sk.siswa = s.replid 
						JOIN aka_detailkelas dk ON dk.replid = sk.detailkelas 
						JOIN aka_kelas k ON k.replid = dk.kelas
						JOIN aka_subtingkat st ON st.replid = k.subtingkat
						JOIN aka_tingkat t ON t.replid = st.tingkat
					WHERE
						dg.tahunajaran = '.$_POST['tahunajaran'].'
						AND s.replid = '.$_POST['replid'].' 
						and dk.tahunajaran = '.$_POST['tahunajaran'].'
					GROUP BY
						s.replid';
						// pr($s);
				$e =mysql_query($s);
				$r =mysql_fetch_assoc($e);

				$s2 ='	SELECT
							b.biaya,
							sb.replid idsiswabiaya,
							(getBiayaNett(sb.replid)-getBiayaTerbayar(sb.replid))biayaKurang,
							getStatusBayar(sb.replid)statusBayar
						FROM
							psb_biaya b
							JOIN psb_detailbiaya db on db.biaya = b.replid
							join psb_siswabiaya sb on sb.detailbiaya = db.replid
							JOIN psb_siswa s on s.replid = sb.siswa
							JOIN psb_detailgelombang dg on dg.replid = db.detailgelombang
						WHERE
							s.replid = '.$_POST['replid'].' AND 
							dg.tahunajaran ='.$_POST['tahunajaran'];
				// pr($s2);
				$e2       =mysql_query($s2);
				$biayaArr =array();
				while ($r2=mysql_fetch_assoc($e2)) $biayaArr[]=$r2;
				$out = json_encode(array(
						'status'        =>(!$e?'gagal':'sukses'),
						'namasiswa'     => $r['namasiswa'],
						'departemen'    => $r['departemen'],
						'tahunajaran'   => $r['tahunajaran'],
						'nis'           => $r['nis'],
						'nopendaftaran' => $r['nopendaftaran'],
						'kelas'         => $r['kelas'],
						'biayaArr'      => $biayaArr
				));
			break;

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				$s= '	SELECT
							idsiswa,
							idsiswabiaya,
							namasiswa,
							nopendaftaran,
							nis,
							biaya,
							ditagih,
							isAngsur2,
							angsuran,
							namasiswa,
							concat(tingkat," ",subtingkat," ",kelas)kelas,
							viabayar,
							biayaAwal,
							biayaNett,
							biayaKurang,
							biayaTerbayar,
							idsemester
						FROM vw_siswa_biaya 
						WHERE
							status != "2" and
							idbiaya  ='.$_POST['biaya'].' and 
							idsiswa  ='.$_POST['replid'].' AND 
							idsubtingkat = '.$_POST['subtingkat'].'
						GROUP BY
							idsiswabiaya
						ORDER BY
							idsubtingkat asc,
							namasiswa asc';
				// pr($s); 
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat                 = $e?'sukses':'gagal';
			// awal
				$biayaNett            = getBiayaNett2($_POST['replid'],$_POST['biaya']);
				$angsuranNominal      = getAngsuranNominal($_POST['replid'],$_POST['biaya']);
			// terbayar
				$terbayarAngsurankeReal = getTerbayarAngsuranke($_POST['replid'],$_POST['biaya']);
				$terbayarBaru         = getTerbayarBaru($_POST['replid'],$_POST['biaya']);
				$terbayarTotal        = getTerbayarTotal($_POST['replid'],$_POST['biaya']);
				$terbayarAngsurankeRule = ceil($terbayarTotal/$angsuranNominal);
			// akan bayar
				$akanBayarke          = ($terbayarTotal%$angsuranNominal==0)?($terbayarAngsurankeRule+1):$terbayarAngsurankeRule;
				$lunasPerAngsuran     =($terbayarTotal%$angsuranNominal==0)?true:false;
				$lunasTotalAngsuran   = $terbayarTotal==$biayaNett?true:false;
				$kuranganAngsuran     = $terbayarAngsurankeRule==$akanBayarke?$angsuranNominal-$terbayarBaru:0;
			//belum bayar
				$belumBayarAngsuranke = intval($r['angsuran'])-intval($akanBayarke);
				
				$semester = getField('semester','aka_semester','replid',$r['idsemester']);
				$out  = json_encode(array(
							'status' =>$stat,
							'datax'  =>array(
								// header
								'idsiswabiaya'            =>$r['idsiswabiaya'],
								'ditagih'                 =>$r['ditagih'],
								'idsemester'              =>$r['idsemester'],
								'idsemester'              =>$r['idsemester'],
								'semester'                =>($semester=='1'?'Ganjil':'Genap'),
								'namasiswa'               =>$r['namasiswa'],
								'kelas'                   =>$r['kelas'],
								'biaya'                   =>$r['biaya'],
								'nis'                     =>$r['nis'],
								// harus dibayar
								'biayaAwal'               =>setuang($r['biayaAwal']),
								'biayaNett'               =>setuang($biayaNett),
								'totalDiskon'             =>setuang($r['biayaAwal']-$biayaNett),
								//angsuran
								'kuranganAngsuran'        => $kuranganAngsuran,
								'viabayar'                => $r['viabayar'],
								'isAngsur2'               => $r['isAngsur2'],
								'angsuran'                => $r['angsuran'],
								'angsuranNominal'         => setuang($angsuranNominal),
								'lunasPerAngsuran'        =>$lunasPerAngsuran,
								'lunasTotalAngsuran'      =>$lunasTotalAngsuran,
								//sudah bayar
								'terbayarAngsurankeReal'  => $terbayarAngsurankeReal,
								'terbayarAngsurankeRule'  => $terbayarAngsurankeRule,
								'terbayarBaru'            => setuang($terbayarBaru),
								'terbayarTotal'           => setuang($terbayarTotal),
								//akan bayar
								'akanBayarke'             => $akanBayarke,
								//belum bayar
								// 'belumBayarNominalTot' => setuang($belumBayarNominalTot),
								'belumBayarAngsuranke'    => $belumBayarAngsuranke,
						)));					
			break;
			
			case 'kodegenerate':
				$s='SELECT
						tb1.lokasi,
						tb1.grup,
						tb1.tempat,
						tb1.katalog,
						tb2.barang,
						LPAD(tb2.barang,5,0)barkode	
					FROM (
						SELECT
							l.kode lokasi,
							g.kode grup,
							t.kode tempat,
							k.kode katalog
						FROM
							sar_lokasi l 
							JOIN sar_grup g on g.lokasi = l.replid
							JOIN sar_katalog k on k.grup= g.replid
							JOIN sar_tempat t on t.lokasi = l.replid
						WHERE	
							t.replid = '.$_POST['tempat'].' 
							and k.replid = '.$_POST['katalog'].'
						)tb1,';

				if($_POST['replid']!=''){//edit
					$s.= '(SELECT urut AS barang FROM sar_barang WHERE replid='.$_POST['replid'].')tb2';
				}else{ //add 
					$s.= '(SELECT (MAX(urut) + 1) AS barang FROM sar_barang )tb2';
				}

				// print_r($s);exit();
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat = !$e?'gagal':'sukses';
				$out  = json_encode(array(
							'status' =>$stat,
							'data'   =>array(
										'urut'    =>$r['barang'],
										'lokasi'  =>$r['lokasi'],
										'grup'    =>$r['grup'],
										'tempat'  =>$r['tempat'],
										'katalog' =>$r['katalog'],
										'barang'  =>$r['barang'],
										'barkode' =>$r['barkode']
						)));
			break;
			// generate barcode -----------------------------------------------------------
			}
	}echo $out;
					// $f = '	concat((SELECT tingkat from aka_tingkat WHERE replid = idtingkat)," - ",
					// 		(SELECT subtingkat from aka_subtingkat WHERE replid = idsubtingkat),"",
					// 		(SELECT kelas from aka_kelas WHERE replid = idkelas ))kelas';
					// $w=[];
					// $w[]=['idtahunajaran','=',$_POST['idtahunajaranH']];
					// $w[]=['idsiswa','=',$idsiswa];
					// $kelas = getFieldArr4($f,'vw_siswa_kelas','',$w);
?>