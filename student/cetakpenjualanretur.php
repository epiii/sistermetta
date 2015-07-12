<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$detail 		= $_GET['detail'];
$jenisproduk 		= $_GET['jenisproduk'];
$kodebarang 		= $_GET['kodebarang'];
$jenisproduk 		= $_GET['jenisproduk'];
$kodecustomer 		= $_GET['kodecustomer'];
$namacustomer = getnamacustomer($kodecustomer);
if($jenisproduk!='Semua'){
         $wherekodebarang="";
		 $detail ='ok';
		 $namajenisproduk = getjenis($jenisproduk);
$namakodebarang="Semua";
}
if($kodebarang!='Semua'){
         $jenisproduk="Semua";
		 $detail ='ok';
$wherekodebarang="and kodebarang='$kodebarang'";
$namakodebarang=getnamabarang($kodebarang);
		 $namajenisproduk ="Semua";
}
if($kodecustomer=='Semua'){
         $wherecustomer="";
}else{
         $wherecustomer="and kodecustomer='$kodecustomer'";
}
echo "<html><head><title>Laporan Retur Penjualan </title>";
echo '<style type="text/css">
   table { page-break-inside:auto; 
    font-size: 0.8em; /* 14px/16=0.875em */
font-family: "Times New Roman", Times, serif;
   }
   tr    { page-break-inside:avoid; page-break-after:auto }
	table {
    border-collapse: collapse;}
	th,td {
    padding: 5px;
}
.border{
	border: 1px solid black;
}
.border td{
	border: 1px solid black;
}
body {
	margin		: 0;
	padding		: 0;
    font-size: 1em; /* 14px/16=0.875em */
font-family: "Times New Roman", Times, serif;
    margin			: 2px 0 5px 0;
}
</style>';
echo "</head><body>";
echo'
<table align="center">
<tr><td colspan="7"><img style="margin-right:5px; margin-top:5px; padding:1px; background:#ffffff; float:left;" src="images/logo.png" height="70px"><br></td></tr>';

if($detail!='ok'){
echo'<tr><td colspan="7"><h4>Laporan Retur Penjualan, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).', Customer '.$namacustomer.'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.Retur</td>
<td>Tanggal</td>
<td>No.Faktur</td>
<td>Customer</td>
<td>Total</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `pos_penjualanretur` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus  $wherecustomer   order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$noretur = $datas['noretur'];
$nofaktur = $datas['nofaktur'];
$tgl = $datas['tgl'];
$kodecustomer = $datas['kodecustomer'];
$total = $datas['total'];
$user = $datas['user'];
$urutan = $no + 1;
$lihatslip = '<a href="cetak_notareturjual.php?kode='.$datas['noretur'].'&lihat=ok"target="new">'.$datas['noretur'].'</a>';
$lihatslipfak = '<a href="cetak_notafaktur.php?kode='.$datas['nofaktur'].'&lihat=ok"target="new">'.$datas['nofaktur'].'</a>';
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslip.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$lihatslipfak.'</td>
<td>'.getnamacustomer($kodecustomer).'</td>
<td>'.rupiah_format($total).'</td>
</tr>';
$no++;
$tnetto+=$total;
}
echo '
<tr class="border" align="right">
<td colspan="5"><b>Grand Total :</b></td>
<td>'.rupiah_format($tnetto).'</td>
</tr>';
echo '</table>';
}else{
echo'<tr><td colspan="8"><h4>Laporan Retur Penjualan, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).', Customer '.$namacustomer.' , Jenis / Barang : '.$namajenisproduk.'/'.$namakodebarang.'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.Retur</td>
<td>Tanggal</td>
<td>No.Faktur</td>
<td>Customer</td>
<td>Kode Barang</td>
<td>Nama Barang</td>
<td>Harga</td>
<td>Jumlah</td>
<td>Total</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `pos_penjualanretur` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus $wherecustomer order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$noretur = $datas['noretur'];
$nofaktur = $datas['nofaktur'];
$tgl = $datas['tgl'];
$kodecustomer = $datas['kodecustomer'];
$carabayar = $datas['carabayar'];
$user = $datas['user'];
$discount = $datas['discount'];
$totaldiscount += $discount;
$urutan = $no + 1;
$lihatslip = '<a href="cetak_notareturjual.php?kode='.$datas['noretur'].'&lihat=ok"target="new">'.$datas['noretur'].'</a>';
$lihatslipfak = '<a href="cetak_notafaktur.php?kode='.$datas['nofaktur'].'&lihat=ok"target="new">'.$datas['nofaktur'].'</a>';
$s2 = mysql_query ("SELECT * FROM `pos_penjualanreturdetail` where noretur = '$noretur'$wherekodebarang order by id asc");	
while($datas2 = mysql_fetch_array($s2)){
$kodebarang = $datas2['kodebarang'];
$jumlah = $datas2['jumlah'];
$harga = $datas2['harga'];
$subtotal = $harga*$jumlah;
$jenisbarangid = getjenisbarangid($kodebarang);
if($jenisbarangid==$jenisproduk){
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslip.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$lihatslipfak.'</td>
<td>'.getnamacustomer($kodecustomer).'</td>
<td>'.$kodebarang.'</td>
<td>'.getnamabarang($kodebarang).'</td>
<td>'.rupiah_format($harga).'</td>
<td>'.$jumlah.'</td>
<td>'.rupiah_format($subtotal).'</td>
</tr>';
$no++;
$grandtotal+=$subtotal;
}else
if($jenisproduk=='Semua'){
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslip.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$lihatslipfak.'</td>
<td>'.getnamacustomer($kodecustomer).'</td>
<td>'.$kodebarang.'</td>
<td>'.getnamabarang($kodebarang).'</td>
<td>'.rupiah_format($harga).'</td>
<td>'.$jumlah.'</td>
<td>'.rupiah_format($subtotal).'</td>
</tr>';
$no++;
$grandtotal+=$subtotal;
}
}
}
echo '
<tr class="border" align="right">
<td colspan="9"><b>Grand Total :</b></td>
<td>'.rupiah_format($grandtotal).'</td>
</tr>';
echo '</table>';
}
/****************************/
echo "</body</html>";
/*
if (isset($_GET['tglmulai'])){
echo "<script language=javascript>
window.print();
</script>";
}
*/
?>
