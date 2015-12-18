<link rel="stylesheet" media="screen" href="includes/media/css/jquery.dataTables.css" />
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.dataTables.js"></script>
<link href="js/combobox/jquery-ui.css" rel="stylesheet">

<script src="js/combobox/jquery-ui.js"></script>
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable( {
    "iDisplayLength":50
});
} );
</script>
<script type="text/javascript">
  $(function() {
$( "#tglstok" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
<?php
error_reporting(0);
include "includes/excel_reader2.php";
$admin='';
 if( mysql_connect("localhost","$mysql_user","$mysql_password") ){
   mysql_select_db( "$mysql_database" );
}else{
   $admin .= "database gagal";
}
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{
	

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
 $cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jumlah = $cell->rowcount($sheet_index=0);
 
$i = 2; // dimulai dari ke dua karena baris pertama berisi title
while( $i<=$jumlah ){

   //$cell->val( baris,kolom )
 //  replid	nopendaftaran	namasiswa	nis	nisn	aktif	sukusiswa	agamasiswa	status	jkelaminsiswa	tempatlahirsiswa	tanggallahirsiswa	warganegarasiswa	anakke	beratsiswa	tinggisiswa	darahsiswa	photosiswa	alamatsiswa	kodepossiswa	telponsiswa	pinbbsiswa

$replid = ($cell->val( $i,1 ));
$mopendaftaran  = ($cell->val( $i,2 ));
$namasiswa = ($cell->val( $i,3 ));
$nis = ($cell->val( $i,4 ));
$nisn = ($cell->val( $i,5 ));
$aktif = ($cell->val( $i,6 ));
$sukusiswa = ($cell->val( $i,7 ));
$agamasiswa = ($cell->val( $i,8 ));
$status = ($cell->val( $i,9 ));
$jkelaminsiswa = ($cell->val( $i,10 ));
$tempatlahirsiswa = ($cell->val( $i,11 ));
$tanggallahirsiswa = ($cell->val( $i,12 ));
$warganegarasiswa = ($cell->val( $i,13 ));
$anakke = ($cell->val( $i,14 ));
$beratsiswa = ($cell->val( $i,15 ));
$tinggisiswa = ($cell->val( $i,16 ));
$darahsiswa = ($cell->val( $i,17 ));
$photosiswa = ($cell->val( $i,18 ));
$alamatsiswa = ($cell->val( $i,19 ));
$kodepossiswa = ($cell->val( $i,20 ));
$telponsiswa = ($cell->val( $i,21 ));
$pinbbsiswa = ($cell->val( $i,22 ));
$sql  =  "INSERT INTO `psb_siswa`(replid,nopendaftaran,namasiswa,nis,nisn,aktif,sukusiswa,agamasiswa,status	,jkelaminsiswa,tempatlahirsiswa,tanggallahirsiswa,warganegarasiswa,anakke,beratsiswa,tinggisiswa,darahsiswa,photosiswa,alamatsiswa,kodepossiswa,telponsiswa,pinbbsiswa)VALUES ('$replid','$nopendaftaran','$namasiswa','$nis','$nisn','$aktif','$sukusiswa','$agamasiswa','$status','$jkelaminsiswa','$tempatlahirsiswa','$tanggallahirsiswa','$warganegarasiswa','$anakke','$beratsiswa','$tinggisiswa','$darahsiswa','$photosiswa','$alamatsiswa','$kodepossiswa','$telponsiswa','$pinbbsiswa')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}
   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Siswa </b> Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";


}
$admin .='<div class="panel-heading"><b>Import Siswa</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
 <tr>
	<td>Silakan Pilih File Excel </td>
	<td>:</td>
	<td><input name="upfile" type="file"></td>
 </tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="submit" type="submit" value="import" class="btn btn-success"></td>
 </tr>
 </table>
 </form>';
}



}






echo $admin;

?>