<?php
if (!defined('AURACMS_admin')) {
    Header("Location: ../index.php");
    exit;
}

if (!cek_login()){
    header("location: index.php");
    exit;
} else{
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#tgl" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$script_include[] = $JS_SCRIPT;
	
//$index_hal=1;	
	$admin  .='<legend>PO PEMBELIAN</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=po&mod=yes">PO PEMBELIAN</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=po&mod=yes&aksi=cetak">CETAK PO PEMBELIAN</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';
$admin .='<div class="panel panel-info">';
$admin .= '<script type="text/javascript" language="javascript">
   function GP_popupConfirmMsg(msg) { //v1.0
  document.MM_returnValue = confirm(msg);
}
</script>';
if ($_GET['aksi'] == ''){
if(isset($_POST['tambah'])){
$kodecari 		= $_POST['kode'];
$totalpo = $_SESSION["totalpo"];
$jumlah 		= '1';
$hasil =  $koneksi_db->sql_query( "SELECT * FROM pos_produk WHERE kode='$kodecari'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$id=$data['id'];
$kode=$data['kode'];
$stok=$data['stok'];
$error 	= '';
//$cekjumlahbeli = cekjumlahbeli($kode);
if (!$kode)  	$error .= "Error:  Kode Barang Tidak di Temukan<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
$admin .= '<div class="sukses">Kode Barang di Temukan </div>';
$PRODUCTID = array ();
foreach ($_SESSION['product_id'] as $k=>$v){
$PRODUCTID[] = $_SESSION['product_id'][$k]['kode'];
}
if (!in_array ($kode, $PRODUCTID)){
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $jumlah);
}else{
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
$_SESSION['product_id'][$k]['jumlah'] = $_SESSION['product_id'][$k]['jumlah']+1;
    }
}
		
}
}
}

if(isset($_POST['submitpo'])){
$nopo 		= $_POST['nopo'];
$tgl 		= $_POST['tgl'];
$kodesupplier 		= $_SESSION["kodesupplier"];
$total 		= $_POST['total'];
$discount 		= '0';
$netto = '0';
$user 		= $_POST['user'];
$carabayar 		= $_POST['carabayar'];
$termin 		= $_POST['termin'];
if (!$_SESSION["kodesupplier"])  	$error .= "Error:  Kode Supplier harus ada <br />";
if (!$_SESSION["product_id"])  	$error .= "Error:  Kode Barang harus ada <br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nopo FROM pos_po WHERE nopo='$nopo'")) > 0) $error .= "Error: Nomor PO ".$nopo." sudah terdaftar<br />";

if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
$hasil  = mysql_query( "INSERT INTO `pos_po` VALUES ('','$nopo','$tgl','$kodesupplier','$carabayar','$total','$discount','$netto','$termin','$user')" );
$idpo = mysql_insert_id();
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$jumlah = $cart_itm["jumlah"];
$harga = $cart_itm["harga"];
$subdiscount = $cart_itm["subdiscount"];
$subtotal = $cart_itm["subtotal"];
$hasil  = mysql_query( "INSERT INTO `pos_podetail` VALUES ('','$nopo','$kode','$jumlah','$harga','$subdiscount','$subtotal')" );
//updatestokbeli($kode,$jumlah);
updatehargabeli($kode,$harga);
}
if($hasil){
$admin .= '<div class="sukses"><b>Berhasil Menambah PO.</b></div>';
pocetak($nopo);
porefresh();
//$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=po&mod=yes" />';
}else{
$admin .= '<div class="error"><b>Gagal Menambah PO.</b></div>';
		}		
}	
}

if(isset($_POST['tambahsupplier'])){
$_SESSION['kodesupplier'] = $_POST['kodesupplier'];
$kodesupplier= $_POST['kodesupplier'];
$carabayar = getcarabayar($kodesupplier);
$termin = gettermin($kodesupplier);
}

if(isset($_POST['deletesupplier'])){
porefresh();
}

if(isset($_GET['hapusbarang'])){
$kode 		= $_GET['kode'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
unset($_SESSION['product_id'][$k]);
    }
}
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=po&mod=yes" />';
}

if(isset($_POST['simpandetail'])){
foreach ($_SESSION['product_id'] as $k=>$v){
$_SESSION['product_id'][$k]['subdiscount']=$_POST['subdiscount'][$k];
$_SESSION['product_id'][$k]['jumlah']=$_POST['jumlahpo'][$k];
$_SESSION['product_id'][$k]['harga']=$_POST['harga'][$k];
$nilaidiscount=cekdiscount($_SESSION['product_id'][$k]['subdiscount'],$_SESSION['product_id'][$k]['harga']);
$_SESSION['product_id'][$k]['subtotal'] =$_SESSION['product_id'][$k]['jumlah']*($_SESSION['product_id'][$k]['harga']-$nilaidiscount);
}
//$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=po&mod=yes" />';
}

if(isset($_POST['tambahbarang'])){
$_SESSION['kodesupplier'] = $_POST['kodesupplier'];	
$kodebarang 		= $_POST['kodebarang'];
$hasil =  $koneksi_db->sql_query( "SELECT * FROM pos_produk WHERE kode='$kodebarang'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$id=$data['id'];
$kode=$data['kode'];
$stok=$data['jumlah'];
$harga=$data['hargabeli'];
$jenjang=$data['jenjang'];
$error 	= '';
if (!$kode)  	$error .= "Error:  Kode Barang Tidak di Temukan<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{

$PRODUCTID = array ();
foreach ($_SESSION['product_id'] as $k=>$v){
$PRODUCTID[] = $_SESSION['product_id'][$k]['kode'];
}
if (!in_array ($kode, $PRODUCTID)){
$subdiscount="0";
$subtotal=$harga;
$jumlah='1';
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $jumlah, 'harga' => $harga, 'jenjang' => $jenjang, 'subdiscount' => $subdiscount, 'subtotal' => $subtotal, 'stok' => $stok);
}else{
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
	$subdiscount="0";
$_SESSION['product_id'][$k]['jumlah'] = $jumlah+1;
$_SESSION['product_id'][$k]['subtotal'] = $_SESSION['product_id'][$k]['jumlah']*$_SESSION['product_id'][$k]['harga'];
    }
}
		
}
}
}

if($_SESSION["kodesupplier"]!=''){
$supplier = '
		<td>Nama Supplier</td>
		<td>:</td>
		<td>'.getnamasupplier($_SESSION['kodesupplier']).'</td>';
}else{
$supplier = '
		<td></td>
		<td></td>
		<td></td>';	
	
}

if(isset($_POST['batalpo'])){
porefresh();
}

$kodesupplier= $_POST['kodesupplier'];	
$kodebarang= $_POST['kodebarang'];
$carabayar= $_POST['carabayar'];
$termin= $_POST['termin'];	
$user = $_SESSION['UserName'];
$tglnow = date("Y-m-d");
$nopo = generatepo();

$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$kodesupplier 		= !isset($kodesupplier) ? '' : $kodesupplier;
$kodebarang 		= !isset($kodebarang) ? '' : $kodebarang;
$discount 		= !isset($discount) ? '0' : $discount; 
$carabayar 		= !isset($carabayar) ? 'Tunai' : $carabayar;
$termin 		= !isset($termin) ? '0' : $termin;

$sel2 = '<select name="carabayar" class="form-control">';
$arr2 = array ('Tunai','Debet Card','Hutang');
foreach ($arr2 as $kk=>$vv){
	if ($carabayar == $vv){
	$sel2 .= '<option value="'.$vv.'" selected="selected">'.$vv.'</option>';
	}else {
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
}
}

$sel2 .= '</select>'; 

$admin .= '
<div class="panel-heading"><b>Transaksi PO Pembelian</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PO</td>
		<td>:</td>
		<td><input type="text" name="nopo" value="'.$nopo.'" class="form-control">  <input type="submit" value="Batal" name="deletesupplier"class="btn btn-danger" ></td>
'.$supplier.' 
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" name="tgl" id="tgl" value="'.$tgl.'" class="form-control">&nbsp;</td>
<td>Cara Pembayaran</td>
		<td>:</td>
		<td>'.$sel2.'</td>
	</tr>';
	$admin .= '
	<tr>
		<td>Supplier</td>
		<td>:</td>
		<td><select class="form-select" name="kodesupplier"id="combobox">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_supplier" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$pilihan = ($data['kode']==$kodesupplier)?"selected":'';
	$admin .= '
			<option value="'.$data['kode'].'"'.$pilihan.'>'.$data['nama'].'</option>';
}
	$admin .= '</select>
			</td>
		<td>Termin</td>
		<td>:</td>
		<td><input type="text" name="termin" value="'.$termin.'" class="form-control"></td>
		</tr>';
	$admin .= '
	<tr>
		<td>Barang</td>
		<td>:</td>
		<td><select name="kodebarang"  class="form-select"id="combobox2">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_produk ORDER BY nama asc" );
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_produk ORDER BY nama asc");
$admin .= '<option value="">== Barang ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['kode']==$kodebarang)?"selected":'';
$admin .= '<option value="'.$datasj['kode'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select>
			</td>
		<td><input type="submit" value="Tambah Barang" name="tambahbarang"class="btn btn-success" > </td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '	
	<tr><td colspan="5"><div id="Tbayar"></div></td>
		<td>
		</td>
	</tr>
</table></div>';	
if(($_SESSION["product_id"])!=""){
$no=1;
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail Pemesanan</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
<th><b>Jenjang</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></</td>
		<th><b>Harga</b></</th>
<th><b>Discount</b></</th>
<th><b>SubDiscount</b></</th>
<th><b>Subtotal</b></</th>
		<th><b>Aksi</b></</th>
	</tr>';
foreach ($_SESSION['product_id'] as $k=>$v){
$subdiscount = $_SESSION['product_id'][$k]['subdiscount'];
$jumlah = $_SESSION['product_id'][$k]['jumlah'];
$harga = $_SESSION['product_id'][$k]['harga'];
$jenjang = $_SESSION['product_id'][$k]["jenjang"];
$kode = $_SESSION['product_id'][$k]["kode"];
$subtotal=$_SESSION['product_id'][$k]["subtotal"];
$nilaidiscount=cekdiscount($subdiscount,$harga)*$jumlah;
$admin .= '	
	<tr>
			<td>'.$no.'</td>
		<td>'.getjenjang($jenjang).'</td>
			<td>'.$kode.'</td>
		<td>'.getnamabarang($kode).'</td>
		<td><input align="right" type="text" name="jumlahpo['.$k.']" value="'.$jumlah.'"class="form-control"></td>
		<td><input align="right" type="text" name="harga['.$k.']" value="'.$harga.'"class="form-control"></td>
		<td><input align="right" type="text" name="subdiscount['.$k.']" value="'.$subdiscount.'"class="form-control"></td>
	<td>'.$nilaidiscount.'</td>
		<td>'.$subtotal.'</td>
		<td>
		<a href="./admin.php?pilih=po&mod=yes&hapusbarang=ok&kode='.$kode.'" class="btn btn-danger">HAPUS</a></td>
	</tr>';
	$total +=$subtotal;
	$no++;
		}
$admin .= '	
	<tr>
		<td colspan="9" >*Jika melakukan perubahan jumlah atau harga pada detail transaksi klik EDIT DETAIL terlebih dahulu sebelum melakukan SIMPAN </td>
		<td ><input type="submit" value="EDIT DETAIL" name="simpandetail"class="btn btn-warning" ></td>
	</tr>';		
$admin .= '	
	<tr>
		<td></td>
		<td></td>		
		<td colspan="7" align="right"><b>Total</b></td>
		<td ><input type="text" name="total" id="total"   class="form-control"  value="'.$total.'"/></td>
		<td></td>
	</tr>';
$admin .= '<tr><td colspan="8"></td><td align="right"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Batal" name="batalpo"class="btn btn-danger" >
		<input type="submit" value="Simpan" name="submitpo"class="btn btn-success" >
		</td>
		<td></td></tr>';
$admin .= '</table>';	
	}
$admin .= '</form></div>';	
}

if ($_GET['aksi'] == 'cetak'){
$kodepo     = $_POST['kodepo'];  
if(isset($_POST['batalcetak'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=po&mod=yes&aksi=cetak" />';
}
$getlastpo=getlastpo();
$admin .= '
<div class="panel-heading"><b>Cetak Nota Purchase Order</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table  class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Kode PO</td>
		<td>:</td>
		<td><select name="kodepo" id="combobox">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_po order by id desc" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
	$admin .= '
			<option value="'.$data['nopo'].'">'.$data['nopo'].' ~ '.getnamasupplier($data['kodesupplier']).' ~ '.rupiah_format($data['total']).' ~ '.tanggalindo($data['tgl']).'</option>';
}
	$admin .= '
	</select>&nbsp;<input type="submit" value="Lihat PO" name="lihatpo"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalcetak"class="btn btn-danger" >&nbsp;
				</td>
		<td>	</td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '</form></table></div>';	

if(isset($_POST['lihatpo'])){

$no=1;
$query 		= mysql_query ("SELECT * FROM `pos_po` WHERE `nopo` like '$kodepo'");
$data 		= mysql_fetch_array($query);
$nopo  			= $data['nopo'];
$tgl  			= $data['tgl'];
$kodesupplier  			= $data['kodesupplier'];
$total  			= $data['total'];
$discount  			= $data['discount'];
$netto  			= $data['netto'];
$carabayar  			= $data['carabayar'];
$termin  			= $data['termin'];
	$error 	= '';
		if (!$nopo) $error .= "Error: kode PO tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';}else{
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><b>Purchase Order</b></div>';
$admin .= '
		<form method="post" action="cetak_notapo.php" class="form-inline"id="posts"target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PO</td>
		<td>:</td>
		<td>'.$nopo.'</td>
		<td><input type="hidden" name="kode" value="'.$nopo.'">
		<input type="submit" value="Cetak" name="cetak_notapo"class="btn btn-warning" >

		</td>
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td>'.tanggalindo($tgl).'</td>
		<td></td>
		</tr>';
$admin .= '
	<tr>
		<td>Supplier</td>
		<td>:</td>
		<td>'.getnamasupplier($kodesupplier).'</td>
			<td></td>
	</tr>';	
$admin .= '
	<tr>
		<td>Cara Pembayaran</td>
		<td>:</td>
		<td>'.($carabayar).'</td>
			<td></td>
	</tr>';	
$admin .= '
	<tr>
		<td>Termin</td>
		<td>:</td>
		<td>'.($termin).'</td>
			<td></td>
	</tr>';	
$admin .= '</table>		</form></div>';	
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail PO</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
<th><b>Jenjang</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></</td>
		<th><b>Harga</b></</th>
<th><b>Discount</b></</th>
<th><b>Subtotal</b></</th>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `pos_podetail` WHERE `nopo` like '$kodepo'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
$admin .= '	
	<tr>
		<td>'.$no.'</td>
		<td>'.getjenjangbarang($datad["kodebarang"]).'</td>
		<td>'.$datad["kodebarang"].'</td>
		<td>'.getnamabarang($datad["kodebarang"]).'</td>
		<td>'.$datad["jumlah"].'</td>
		<td>'.rupiah_format($datad["harga"]).'</td>
		<td>'.cekdiscountpersen($datad["subdiscount"]).'</td>
		<td>'.rupiah_format($datad["subtotal"]).'</td>
	</tr>';
	$no++;
		}
$admin .= '	
	<tr>		
		<td colspan="7" align="right"><b>Total</b></td>
		<td >'.rupiah_format($total).'</td>
	</tr>';
	/*
$admin .= '	
	<tr>	
		<td colspan="7" align="right"><b>Discount</b></td>
		<td >'.cekdiscountpersen($discount).'</td>
	</tr>';
$admin .= '	<tr>	
		<td colspan="7" align="right"><b>Grand Total</b></td>
		<td >'.rupiah_format($netto).'</td>
	</tr>
	';*/
$admin .= '</table></div>';	
		}
	}

	}

}
echo $admin;
?>
