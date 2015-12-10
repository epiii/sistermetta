<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  // $countx= isset($_GET['countx'])?filter($_GET['countx']):'';
  $arr=explode(',', $_GET['transArr']);
  $n=count($arr);
  // $x     = $_SESSION['id_loginS'].$_GET['transArr'];
  // $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    // if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
    //   echo 'Token URL tidak sesuai';
    // }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Kwitansi Transaksi '.$mnu.'</title>
          </head>';

      $out.='<body>';

      $idDJTrans=getField('detjenistransaksi','keu_transaksi','replid',$arr[0]);
      $idJTrans = getField('jenistransaksi','keu_detjenistransaksi','replid',$idDJTrans);
      $kodeJTrans= getField('kode','keu_jenistransaksi','replid',$idJTrans);
      $JTrans= getField('jenistransaksi','keu_jenistransaksi','replid',$idJTrans);
      // pr($kodeJTrans);

      if($kodeJTrans=='ju'){
        $s1 = 'SELECT * FROM keu_transaksi WHERE replid='.$arr[0];
        $e1 = mysql_query($s1) or die(mysql_error());
        $r1 = mysql_fetch_assoc($e1);
        $out.='<table width="100%">
                  <tr>
                    <td width="34%">
                      <img width="100" src="../../images/logo.png" alt="" />
                    </td>
                    <td>
                      <b>Kwitansi Transaksi Jurnal Umum</b>
                    </td>
                  </tr>
                </table><br />';
          // start of header
          $out.='<table width="100%">
                    <tr>
                      <td width="20%" >Kode Transaksi </td>
                      <td>: '.getNoKwitansi($r1['replid']).'</td>
                    </tr>
                    <tr>
                      <td>No. Bukti</td>
                      <td>: '.$r1['nobukti'].'</td>
                    </tr>
                    <tr>
                      <td>Tanggal</td>
                      <td>: '.tgl_indo8($r1['tanggal']).'</td>
                    </tr>
                    <tr>
                      <td>Uraian</td>
                      <td>: '.$r1['uraian'].'</td>
                    </tr>';
          $out.='</table>';
          $s2 = ' SELECT replid,detilrekening,nominal,jenisrekening
                  FROM keu_jurnal 
                  WHERE transaksi ='.$r1['replid'].'
                  ORDER BY jenisrekening ASC';
          $e2 = mysql_query($s2);
          $out.='<table class="isi" width="100%">
                <tr class="head">
                  <td align="center">Rekening</td>
                  <td align="center">Debit</td>
                  <td align="center">Kredit</td>
                </tr>';
          $debitTot=$krditTot=0;
          while ($r2 = mysql_fetch_assoc($e2)){
            $debit  =($r2['jenisrekening']=='d'?$r2['nominal']:0);
            $kredit =($r2['jenisrekening']=='k'?$r2['nominal']:0);
            $debitTot+=$debit;
            $kreditTot+=$kredit;
            $out.='<tr>
              <td>'.getRekening($r2['detilrekening']).'</td>
              <td align="right" >'.setuang($debit).'</td>
              <td align="right">'.setuang($kredit).'</td>
            </tr>';
          }
          $out.='<tr class="head">
            <td></td>
            <td align="right">'.setuang($debitTot).'</td>
            <td align="right">'.setuang($kreditTot).'</td>
          </tr>';
          $out.='</table><br>';
          $out.='</table>';

      }else{ // in / out 
        $s1 = 'SELECT * FROM keu_transaksi WHERE replid IN ('.$_GET['transArr'].')';
        $e1 = mysql_query($s1) or die(mysql_error());
        while($r1 = mysql_fetch_assoc($e1)){
          $out.='<table width="100%">
                  <tr>
                    <td width="36%">
                      <img width="100" src="../../images/logo.png" alt="" />
                    </td>
                    <td>
                      <b>Kwitansi Transaksi '.$JTrans.'</b>
                    </td>
                  </tr>
                </table><br />';
          // start of header
          $out.='<table width="100%">
                    <tr>
                      <td width="20%" >No. Kwitansi </td>
                      <td>: '.getNoKwitansi($r1['replid']).'</td>
                    </tr>
                    <tr>
                      <td>No. Bukti</td>
                      <td>: '.($r1['nobukti']==''?'-':$r1['nobukti']).'</td>
                    </tr>
                    <tr>
                      <td>Tanggal</td>
                      <td>: '.tgl_indo8($r1['tanggal']).'</td>
                    </tr>
                    <tr>
                      <td>Uraian</td>
                      <td>: '.$r1['uraian'].'</td>
                    </tr>';
            if($JTrans=='pengeluaran'){
              $out.='<tr>
                      <td>Detail Anggaran</td>
                      <td>: '.getDetAnggaranFull($r1['anggarantahunan']).'</td>
                    </tr>';
            }$out.='</table>';
            // end of header

            // start of detail table
            $out.='<table class="isi" width="100%">
                    <tr class="head">
                      <td align="center">Rekening</td>
                      <td align="center">Debit</td>
                      <td align="center">Kredit</td>
                    </tr>';
            $s2='SELECT * FROM keu_jurnal WHERE transaksi ='.$r1['replid'].' ORDER BY jenisrekening ASC';
            $e2=mysql_query($s2);
            $debitTot=$krditTot=0;
            while($r2=mysql_fetch_assoc($e2)){
              $debit = $r2['jenisrekening']=='d'?$r2['nominal']:0;
              $kredit = $r2['jenisrekening']=='k'?$r2['nominal']:0;
              $debitTot+=$debit;
              $kreditTot+=$kredit;
              $out.='<tr>
                        <td>'.getRekening($r2['detilrekening']).'</td>
                        <td align="right">'.setuang($debit).'</td>
                        <td align="right">'.setuang($kredit).'</td>
                  </tr>';
            }
              
            $out.='<tr class="head">
              <td></td>
              <td align="right">'.setuang($debitTot).'</td>
              <td align="right">'.setuang($kreditTot).'</td>
            </tr>';
            $out.='</table><br>';
          }// end of detail table
        }$out.='</body>';
        echo $out;

        #generate html -> PDF ------------
        $out2 = ob_get_contents();
        ob_end_clean(); 
        $mpdf=new mPDF('c','A4','');   
        $mpdf->SetDisplayMode('fullpage');   
        $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
        $mpdf->WriteHTML($stylesheet,1);  
        $mpdf->WriteHTML($out);
        $mpdf->Output();
      // }
  }
?>