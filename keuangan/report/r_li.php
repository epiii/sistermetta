<?php
  // sleep(0);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  $mnu = 'Laporan '.($_GET['li_jenisS']=='out'?'Pengeluaran':'Penerimaan');
  $pre = 'li_';

  $rekArr='';
  foreach ($_GET['jenisLaporanCB'] as $i => $v)  $rekArr.=$v;

  $x = $_SESSION['id_loginS'].$_GET[$pre.'departemenS'].$_GET[$pre.'tingkatS'].$_GET[$pre.'tahunajaranS'].$_GET[$pre.'semesterS'].$_GET[$pre.'bulanS'].$_GET[$pre.'jenisS'].$rekArr;
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - '.$mnu.'</title>
          </head>';
          // pr($_GET);
          $out         = $rekArr = '';
          $departemen  = (isset($_GET['li_departemenS']) && $_GET['li_departemenS']!='')?' AND departemen='.$_GET['li_departemenS']:'';
          $tingkat     = (isset($_GET['li_tingkatS']) && $_GET['li_tingkatS']!='')?' AND tingkat='.$_GET['li_tingkatS']:'';
          $tahunajaran = (isset($_GET['li_tahunajaranS']) && $_GET['li_tahunajaranS']!='')?' AND getTahunAjaran(t.tanggal)='.$_GET['li_tahunajaranS']:'';
          $semester    = (isset($_GET['li_semesterS']) && $_GET['li_semesterS']!='')?' AND getSemester(t.tanggal)='.$_GET['li_semesterS']:'';
          $bulan       = (isset($_GET['li_bulanS']) && $_GET['li_bulanS']!='')?' AND MONTH(t.tanggal)='.$_GET['li_bulanS']:'';

          $dept =getField('nama','departemen','replid',$_GET['li_departemenS']);
          $ting =getField('tingkat','aka_tingkat','replid',$_GET['li_tingkatS']);
          $thn  =getField('tahunajaran','aka_tahunajaran','replid',$_GET['li_tahunajaranS']);
          $sem  =getField('semester','aka_semester','replid',$_GET['li_semesterS']);
          $bln  =getBulan($_GET['li_bulanS']); 
          // pr($bln);
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>'.$mnu.'</b>
                        </td>
                      </tr>
                    </table><br />';
              $out.='<table width="100%" xclass="isi">
                    <tr>
                      <td width="15%">Departemen</td>
                      <td>: '.($dept!=''?$dept:'Semua').'</td>
                      <td  width="15%">Semester</td>
                      <td>: '.($sem==''?'Semua':($sem=='1'?'Ganjil':'Genap')).'</td>
                    </tr>
                    <tr>
                      <td>Tingkat</td>
                      <td>: '.($ting!=''?$ting:'Semua').'</td>
                      <td>Bulan</td>
                      <td>: '.($bln!=''?$bln:'Semua').'</td>
                    </tr>
                    <tr>
                      <td>Tahun Ajaran</td>
                      <td>: '.($thn!=''?($thn.' - '.($thn+1)):'Semua').'</td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr><td colspan="4"><hr /></td></tr>
                    <tr>
                      <td colspan="2" valign="top">
                        <span>Operasional :</span>
                        <ul>';
                          foreach ($_GET['jenisLaporanCB'] as $i => $v) {
                            $kat=getField('kategori','keu_jenislaporan','rekening',$v);
                            if($kat=='o') $out.='<li>'.getRekening($v).'</li>';
                          }
                        $out.='
                        </ul>
                      </td>
                      <td colspan="2" valign="top">
                        <span>Non Operasional :</span>
                        <ul>';
                          foreach ($_GET['jenisLaporanCB'] as $i => $v) {
                            $kat=getField('kategori','keu_jenislaporan','rekening',$v);
                            if($kat=='n') $out.='<li>'.getRekening($v).'</li>';
                          }
                        $out.='</ul>
                      </td>
                    </tr>
                </table>';
                $out.='<table width="100%" class="isi">
                      <tr class="head">
                          <th align="center">Tanggal </th>
                          <th align="center">No. Jurnal/Jenis Bukti/No.Bukti</th>
                          <th align="center">Uraian</th>
                          <th style="display:visible;"class="text-center  uraianCOL">Detil Jurnal</th>
                      </tr>';
          $rekArr1='';
          if(isset($_GET['jenisLaporanCB']) && count($_GET['jenisLaporanCB']>0)){
              $c = count($_GET['jenisLaporanCB'])-1;
              $rekArr1.='j.detilrekening IN ( ';
              foreach ($_GET['jenisLaporanCB'] as $i => $v) {
                if($i==$c) $rekArr1.=$v;
                else $rekArr1.=$v.',';
              }$rekArr1.=')';
            
              $s='  SELECT t.*
                  FROM keu_transaksi t
                    JOIN keu_jurnal j on j.transaksi = t.replid
                  WHERE 
                    '.$rekArr1.$departemen.$tahunajaran.$semester.$bulan.$tingkat.'
                    AND t.departemen is NOT NULL 
                    AND t.tingkat is NOT NULL 
                  ORDER BY t.tanggal DESC';
              $e   = mysql_query($s);
              $jum = mysql_num_rows($e);
              if($jum!=0){  
                while($res = mysql_fetch_assoc($e)){ 
                  $s2 ='SELECT
                      replid,
                      detilrekening,
                      nominal,
                      jenisrekening
                    FROM keu_jurnal
                    WHERE transaksi = '.$res['replid'].'
                    ORDER BY jenisrekening ASC';
                  $e2  = mysql_query($s2);
                  $tb2 ='';
                  $jum2=mysql_num_rows($e2);
                  if($jum2!=0){
                      $tb2.='<table class="isi" width="100%">
                          <tr class="head">
                            <td width="60%">Rekening</td>
                            <td width="20%">Debit</td>
                            <td width="20%">Kredit</td>
                          </tr>';
                      while($r2=mysql_fetch_assoc($e2)){
                        $debit  =$r2['jenisrekening']=='d'?setuang($r2['nominal']):'-';
                        $kredit =$r2['jenisrekening']=='k'?setuang($r2['nominal']):'-';
                        // pr($debit);
                        $tb2.='<tr>
                              <td  width="30%">'.getRekening($r2['detilrekening']).'</td>
                              <td align="right">'.$debit.'</td>
                              <td align="right">'.$kredit.'</td>
                            </tr>';
                      }$tb2.='</table>';
                  }$out.= '<tr>
                        <td width="11%" valign="top">'.tgl_indo5($res['tanggal']).'</td>
                        <td width="13%" valign="top" style="font-weight:bold;">'.getNoKwitansi($res['replid']).'<br>'.$res['nobukti'].'</td>
                        <td  valign="top">'.$res['uraian'].'</td>
                        <td>'.$tb2.'</td>
                      </tr>';
                }
              }else{ #kosong
                $out.= '<tr>
                          <td align="center">-</td>
                          <td align="center">-</td>
                          <td align="center">-</td>
                          <td align="center">-</td>
                        </tr>';
              }
          }else{
              $out.='<tr align="center">
                      <td>
                        <td align="center">-</td>
                        <td align="center">-</td>
                        <td align="center">-</td>
                        <td align="center">-</td>
                      </td>
                    </tr>';
          }$out.='</table>';
        

          // grafik jpgraph & mpdf/
          if($_GET['jenisLaporanCB']!=''){
            $rekArr2='';
            $c = count($_GET['jenisLaporanCB'])-1;
            $rekArr2.='j.detilrekening IN ( ';
            foreach ($_GET['jenisLaporanCB'] as $i => $v) {
              if($i==$c) $rekArr2.=$v;
              else $rekArr2.=$v.',';
            }$rekArr2.=')';

            $sc = 'SELECT
                  dr.replid,
                  concat("(",dr.kode,") ",dr.nama)rekFull,
                  dr.nama rekNama,
                  dr.kode rekKode,
                  sum(j.nominal)subtotal
                FROM
                  keu_detilrekening dr 
                  LEFT JOIN  keu_jurnal j ON j.detilrekening = dr.replid
                  LEFT JOIN keu_transaksi t ON t.replid = j.transaksi
                  LEFT JOIN  keu_jenislaporan jl ON jl.rekening= dr.replid
                WHERE
                  '.$rekArr2.$departemen.$tahunajaran.$semester.$bulan.$tingkat.'
                  AND t.departemen is NOT NULL 
                  AND t.tingkat is NOT NULL 
                GROUP BY
                  dr.replid
                ORDER BY
                      dr.kode asc';
            $ec= mysql_query($sc);
            $out.='<br /><b>Data Akumulatif :</b>';
            $out.='<table width="100%" class="isi" id="grafikTBL">
                    <tr class="head">
                      <td align="center">Kode Akun</td>
                      <td align="center">Nominal</td>
                      <td align="center">Nama Akun</td>
                    </tr>';
            $tot=0;
            while ($rc=mysql_fetch_assoc($ec)) {
              $out.='<tr>
                      <td align="center">'.$rc['rekKode'].'</td>
                      <td align="right">'.$rc['subtotal'].'</td>
                      <td>'.$rc['rekNama'].'</td>
                    </tr>';
                      // <td align="right">'.setuang($rc['subtotal']).'</td>
              $tot+=$rc['subtotal'];
            }
            $out.='<tr class="head">
                    <td  align="right">Total : </td>
                    <td align="right">'.setuang($tot).'</td>
                    <td></td>
                  </tr>';
            $out.='</table><br />';
            
            $out.='<jpgraph 
              title="Grafik '.$mnu.'" 
              table="grafikTBL" 
              type="pie3d" 
              percent="1"
              data-col-begin="2" 
              data-row-begin="2"
              data-col-end="2"
              data-row-end="-1"
              show-values="1" 
              width="700" 
              height="300" 
            />';
          }

          $out.='</body>';
          echo $out;
  
        #generate html -> PDF ------------
          $out2 = ob_get_contents();
          ob_end_clean(); 
          $mpdf=new mPDF('c','A4','');   
          $mpdf->useGraphs = true;
          $mpdf->SetDisplayMode('fullpage');   
          $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
          $mpdf->WriteHTML($stylesheet,1);  
          $mpdf->WriteHTML($out);
          $mpdf->Output();
    }
  }
?>