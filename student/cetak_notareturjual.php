<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
if(isset($_POST['kode'])){
$kode 		= $_POST['kode'];
}else{
$kode 		= $_GET['kode'];	
}

echo "<html><head><title>Nota Retur Penjualan </title>";
echo '<style type="text/css">
   table { page-break-inside:auto; 
    font-size: 0.9em; /* 14px/16=0.875em */
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
img {
    float: left;
	margin : 5px 5px 0 0;
	padding:1px;
}
</style>';
echo "</head><body>";
echo'
<table align="center"><tr><td>';
echo'<table width="100%">
<tr><td><img src="images/logo.png" height="70px"></td></tr></table>';
echo'</td></tr><tr><td>';
$no=1;
$query 		= mysql_query ("SELECT * FROM `pos_penjualanretur` WHERE `noretur` like '$kode'");
$data 		= mysql_fetch_array($query);
$nofaktur  			= $data['nofaktur'];
$noretur  			= $data['noretur'];
$tgl  			= $data['tgl'];
$kodecustomer  			= $data['kodecustomer'];
$total  			= $data['total'];
$lihatslip = '<a href="cetak_notafaktur.php?kode='.$data['nofaktur'].'&lihat=ok"target="new">'.$data['nofaktur'].'</a>';
	$error 	= '';
		if (!$noretur) $error .= "Error: Kode Retur tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		echo '<div class="error">'.$error.'</div>';}else{
		echo '
<table>';
echo '
	<tr>
		<td>Nomor Retur Penjualan</td>
		<td>:</td>
		<td>'.$noretur.'</td>
	</tr>';
echo '
	<tr>
		<td>Nomor Faktur</td>
		<td>:</td>
		<td>'.$lihatslip.'</td>
	</tr>';
echo '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td>'.tanggalindo($tgl).'</td>
	</tr>';
echo '
	<tr>
		<td>Customer</td>
		<td>:</td>
		<td>'.getnamacustomer($kodecustomer).'</td>
	</tr>';		
echo '</table>';	
echo '<b>Detail Retur Penjualan</b>';	
echo '
<table>';
echo '	
<tr>
<th class="border"><b>No</b></</th>
<th class="border"><b>Jenjang</b></</th>
<th class="border"><b>Kode</b></</th>
<th class="border"><b>Nama</b></td>
<th class="border"><b>Jumlah</b></</td>
<th class="border"><b>Harga</b></</th>
<th class="border"><b>Discount</b></</th>
<th class="border"><b>Subtotal</b></</th>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `pos_penjualanreturdetail` WHERE `noretur` like '$kode'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
echo '	
<tr>
<td class="border">'.$no.'</td>
<td class="border">'.getjenjangbarang($datad["kodebarang"]).'</td>
<td class="border">'.$datad["kodebarang"].'</td>
<td class="border">'.getnamabarang($datad["kodebarang"]).'</td>
<td class="border">'.$datad["jumlah"].'</td>
<td class="border">'.rupiah_format($datad["harga"]).'</td>
<td class="border">'.cekdiscountpersen($datad["subdiscount"]).'</td>
<td class="border">'.rupiah_format($datad["subtotal"]).'</td>
</tr>';
	$no++;
		}
echo '	
	<tr class="border">		
		<td colspan="7" align="right"><b>Total</b></td>
		<td >'.rupiah_format($total).'</td>
	</tr>';
echo '</table>';	
		}
		echo'</td></tr></table>';
/****************************/
echo "</body</html>";
/*
if (!isset($_GET['lihat'])){
echo "<script language=javascript>
window.print();
</script>";
}
*/
?>
