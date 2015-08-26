<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#tglmulai" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#tglakhir" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$script_include[] = $JS_SCRIPT;

if (!cek_login ()){
   $admin .='<h4 class="bg">Access Denied !!!!!!</h4>';
}else{

global $koneksi_db,$PHP_SELF,$theme,$error;

$admin  .='<legend>LAPORAN STOK PRODUK</legend>';
$admin .= '<div class="panel panel-info">';

if($_GET['aksi']==""){ 
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglawal : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$kodebarang 		= !isset($kodebarang) ? '' : $kodebarang;
$admin .='<div class="panel-heading"><b>Laporan Alur Stok Produk</b></div>';
$admin .= '<form class="form-inline" method="get" action="cetakbarang.php" enctype ="multipart/form-data" id="posts" target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
<tr>
	<td>Kode</td>
	<td><select name="kodebarang" class="form-control" required id="combobox">';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_produk ORDER BY nama asc");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['kode']==$kodebarang)?"selected":'';
$admin .= '<option value="'.$datas['kode'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" name="tglmulai" id="tglmulai" value="'.$tglmulai.'" class="form-control"></td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" name="tglakhir" id="tglakhir" value="'.$tglakhir.'" class="form-control"></td>
	</tr>';

$admin .= '<tr>
	<td></td>
	<td>
	<input type="submit" value="Lihat" name="lihat" class="btn btn-primary">
	</td>
	</tr>
</table></form>';
$admin .= '</table>';
}

}
$admin .='</div>';
echo $admin;
?>