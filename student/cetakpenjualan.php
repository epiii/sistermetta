<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$carabayar 		= $_GET['carabayar'];
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
switch ($carabayar) {
   case 'Semua':
         $wherestatus="";
         break;
   case 'Tunai':
         $wherestatus="and carabayar='Tunai'";
         break;
   case 'Debet Card':
         $wherestatus="and carabayar='Debet Card'";
         break;
   case 'Piutang':
         $wherestatus="and carabayar='Piutang'";
         break;
}
echo "<html><head><title>Laporan Penjualan </title>";
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
<tr><td colspan="7"><img style="margin-right:5px; margin-top:5px; padding:1px; background:#ffffff; float:left;" src="images/logo.png" height="70px"></td></tr>';

if($detail!='ok'){
echo'<tr><td colspan="7"><h4>Laporan Penjualan, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).', Customer '.$namacustomer.'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.Faktur</td>
<td>Tanggal</td>
<td>Customer</td>
<td>Cara Bayar</td>
<td>Total</td>
<td>Bayar</td>
<td>Piutang</td>
<td>Termin</td>
<td>User</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `pos_penjualan` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus $wherecustomer order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$nofaktur = $datas['nofaktur'];
$nopo = $datas['nopo'];
$tgl = $datas['tgl'];
$kodecustomer = $datas['kodecustomer'];
$carabayar = $datas['carabayar'];
$total = $datas['total'];
$discount = $datas['discount'];
$netto = $datas['netto'];
$bayar = $datas['bayar'];
$piutang = $datas['piutang'];
$termin = $datas['termin'];
$user = $datas['user'];
$urutan = $no + 1;
if($termin!=''){
$termin = $termin." Hari";
}
$lihatslip = '<a href="cetak_notafaktur.php?kode='.$datas['nofaktur'].'&lihat=ok"target="new" >'.$nofaktur.'</a>';
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslip.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.getnamacustomer($kodecustomer).'</td>
<td>'.$carabayar.'</td>
<td>'.rupiah_format($total).'</td>
<td>'.rupiah_format($bayar).'</td>
<td>'.rupiah_format($piutang).'</td>
<td>'.$termin.'</td>
<td>'.$user.'</td>
</tr>';
$no++;
$ttotal+=$total;
$tbayar+=$bayar;
$tpiutang+=$piutang;
}
echo '
<tr class="border" align="right">
<td colspan="6"><b>Grand Total :</b></td>
<td>'.rupiah_format($ttotal).'</td>
<td>'.rupiah_format($tbayar).'</td>
<td>'.rupiah_format($tpiutang).'</td>
<td colspan="2"></td>
</tr>';
echo '</table>';
}else{
echo'<tr><td colspan="8"><h4>Laporan Penjualan, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).', Customer '.$namacustomer.'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.Faktur</td>
<td>Tanggal</td>
<td>Customer</td>
<td>Cara Bayar</td>
<td>Jenis</td>
<td>Jenjang</td>
<td>Kode Barang</td>
<td>Nama Barang</td>
<td>Harga Beli</td>
<td>Harga Jual</td>
<td>Jumlah</td>
<td>Sub Discount</td>
<td>Sub Total</td>
<td>Bayar</td>
<td>Laba/Rugi Kotor</td>
<td>User</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `pos_penjualan` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus $wherecustomer order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$nofaktur = $datas['nofaktur'];
$tgl = $datas['tgl'];
$kodecustomer = $datas['kodecustomer'];
$carabayar = $datas['carabayar'];
$user = $datas['user'];
$netto = $datas['netto'];
$tnetto += $netto;
$urutan = $no + 1;
$lihatslip = '<a href="cetak_notafaktur.php?kode='.$datas['nofaktur'].'&lihat=ok"target="new" >'.$nofaktur.'</a>';
$s2 = mysql_query ("SELECT * FROM `pos_penjualandetail` where nofaktur = '$nofaktur'$wherekodebarang order by id asc");	
while($datas2 = mysql_fetch_array($s2)){
$kodebarang = $datas2['kodebarang'];
$jumlah = $datas2['jumlah'];
$harga = $datas2['harga'];
$hargabeli = $datas2['hargabeli'];
$subdiscount = $datas2['subdiscount'];
$subtotal = $datas2['subtotal'];
$subhargabeli = ($hargabeli*$jumlah);
if($carabayar=='Piutang'){
$subtotalbayar ='0';	
$subhargabeli ='0';	
}else{
$subtotalbayar = $subtotal;	
}
$rugilaba = $subtotalbayar-$subhargabeli;
$jenisbarangid = getjenisbarangid($kodebarang);
if($jenisbarangid==$jenisproduk){
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslip.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.getnamacustomer($kodecustomer).'</td>
<td>'.$carabayar.'</td>
<td>'.getjenisbarang($kodebarang).'</td>
<td>'.getjenjangbarang($kodebarang).'</td>
<td>'.$kodebarang.'</td>
<td>'.getnamabarang($kodebarang).'</td>
<td>'.rupiah_format($hargabeli).'</td>
<td>'.rupiah_format($harga).'</td>
<td>'.$jumlah.'</td>
<td>'.cekdiscountpersen($subdiscount).'</td>
<td>'.rupiah_format($subtotal).'</td>
<td>'.rupiah_format($subtotalbayar).'</td>
<td>'.rupiah_format($rugilaba).'</td>
<td>'.$user.'</td>
</tr>';
$no++;
$grandjumlah+=$jumlah;
$grandsubdiscount+=$subdiscount;
$grandtotal+=$subtotal;
$grandrugilaba+=$rugilaba;
$grandsubtotalbayar+=$subtotalbayar;
}else 
if($jenisproduk=='Semua'){
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslip.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.getnamacustomer($kodecustomer).'</td>
<td>'.$carabayar.'</td>
<td>'.getjenisbarang($kodebarang).'</td>
<td>'.getjenjangbarang($kodebarang).'</td>
<td>'.$kodebarang.'</td>
<td>'.getnamabarang($kodebarang).'</td>
<td>'.rupiah_format($hargabeli).'</td>
<td>'.rupiah_format($harga).'</td>
<td>'.$jumlah.'</td>
<td>'.cekdiscountpersen($subdiscount).'</td>
<td>'.rupiah_format($subtotal).'</td>
<td>'.rupiah_format($subtotalbayar).'</td>
<td>'.rupiah_format($rugilaba).'</td>
<td>'.$user.'</td>
</tr>';
$no++;
$grandjumlah+=$jumlah;
$grandsubdiscount+=$subdiscount;
$grandtotal+=$subtotal;
$grandrugilaba+=$rugilaba;
$grandsubtotalbayar+=$subtotalbayar;	
	
}
}
}
echo '
<tr class="border" align="right">
<td colspan="11"><b>Grand Total :</b></td>
<td>'.$grandjumlah.'</td>
<td></td>
<td>'.rupiah_format($grandtotal).'</td>
<td>'.rupiah_format($grandsubtotalbayar).'</td>
<td>'.rupiah_format($grandrugilaba).'</td>
<td></td>
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
