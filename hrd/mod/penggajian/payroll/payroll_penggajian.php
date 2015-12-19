<?php

if (!defined('AURACMS_admin')) {
	Header("Location: ../../../index.php");
	exit;
}

if (!cek_login ()){
   $admin .='<p class="judul">Access Denied !!!!!!</p>';
   exit;
}
$style_include[] = '<link rel="stylesheet" media="screen" href="mod/calendar/css/dynCalendar.css" />';
$admin .= '
<script language="javascript" type="text/javascript" src="mod/calendar/js/browserSniffer.js"></script>
<script language="javascript" type="text/javascript" src="mod/calendar/js/dynCalendar.js"></script>';
$tanggal= <<<eof
<script language="JavaScript" type="text/javascript">
    
    /**
    * Example callback function
    */
    /*<![CDATA[*/
    function exampleCallback_ISO3(date, month, year)
    {
        if (String(month).length == 1) {
            month = '0' + month;
        }
    
        if (String(date).length == 1) {
            date = '0' + date;
        }    
        document.forms['posts'].tgl.value = year + '-' + month + '-' + date;
    }
    calendar3 = new dynCalendar('calendar3', 'exampleCallback_ISO3');
    calendar3.setMonthCombo(true);
    calendar3.setYearCombo(true);
/*]]>*/     
</script>
eof;
$JS_SCRIPT = <<<js
<script type=text/javascript>
function  genSEF(from) { 
			var str = from.value;
var tottunjangan = (ntstruktural.value)+(ntfungsional.value)+(ntpengabdian.value)+str;
str2 = 	(document.forms['posts'].jamsostekpersen.value/100)*tottunjangan; 
			str3 = 	(document.forms['posts'].pph21persen.value/100)*str;
			document.forms['posts'].jamsostek.value = parseInt(55);
			document.forms['posts'].pph21.value = parseInt(str3);
			
niltstruktural = document.forms['posts'].ntstruktural.value.split("#");
strstruktural = (niltstruktural[0]*str)+niltstruktural[1];
document.forms['posts'].tstruktural.value = parseInt(strstruktural);

niltfungsional = document.forms['posts'].ntfungsional.value.split("#");
strfungsional = (niltfungsional[0]*str)+niltfungsional[1];
document.forms['posts'].tfungsional.value =parseInt(strfungsional);

niltpengabdian = document.forms['posts'].ntpengabdian.value.split("#");
strpengabdian = (niltpengabdian[0]*str)+niltpengabdian[1];
document.forms['posts'].tpengabdian.value =parseInt(strpengabdian);

niltistrianak = document.forms['posts'].ntistrianak.value.split("#");
stristrianak = (niltistrianak[0]*str)+niltistrianak[1];
document.forms['posts'].tistrianak.value =parseInt(stristrianak);

niltbebantugas = document.forms['posts'].ntbebantugas.value.split("#");
strbebantugas = (niltbebantugas[0]*str)+niltbebantugas[1];
document.forms['posts'].tbebantugas.value =parseInt(strbebantugas);

niltwalikelas = document.forms['posts'].ntwalikelas.value.split("#");
strwalikelas = (niltwalikelas[0]*str)+niltwalikelas[1];
document.forms['posts'].twalikelas.value =parseInt(strwalikelas);

niltuangmakan = document.forms['posts'].ntuangmakan.value.split("#");
struangmakan = (niltuangmakan[0]*str)+niltuangmakan[1];
document.forms['posts'].tuangmakan.value =parseInt(struangmakan);

niltuangtransport = document.forms['posts'].ntuangtransport.value.split("#");
struangtransport = (niltuangtransport[0]*str)+niltuangtransport[1];
document.forms['posts'].tuangtransport.value =parseInt(struangtransport);
}		
</script>
<script type=text/javascript>
function  genSEF2(from,to) { 
			var str = from.value;	
			preward = document.forms['posts'].preward.value;
			pointreward = document.forms['posts'].pointreward.value;
			str=str*preward;
			to.value = parseInt(str);
}		
</script>	
<script type=text/javascript>
function  genSEF3(from,to) { 
			var str = from.value;	
			poterlambat = document.forms['posts'].poterlambat.value;
			pointterlambat = document.forms['posts'].pointterlambat.value;
			str=str*poterlambat;
			to.value = parseInt(str);
}		
</script>
js;
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
global $maxadmindata;

if (isset ($_GET['pg'])) $pg = int_filter ($_GET['pg']); else $pg = 0;
if (isset ($_GET['stg'])) $stg = int_filter ($_GET['stg']); else $stg = 0;
if (isset ($_GET['offset'])) $offset = int_filter ($_GET['offset']); else $offset = 0;
$normal2 = 'mod/karyawan/images/performa/';
$temp2 = 'mod/karyawan/images/temp/';

$admin  .='<legend>Administrasi Penggajian Karyawan</legend>';

$admin .='<ol class="breadcrumb">
<li><a href="?pilih=penggajian&amp;mod=yes">Data Karyawan</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=laporanbulanan">Laporan Bulanan</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=setting">Asuransi</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=golongan">Golongan</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=struktural">Struktural</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=fungsional">Fungsional</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=pengabdian">Pengabdian</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=istrianak">Istri-Anak</a></li>';
$admin .='
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=uangtransport">Uang-Transport</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=bebantugas">Beban Tugas</a></li>
<li><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=walikelas">Wali Kelas</a></li>
</ol>';

###################################
# List karyawan
###################################
if($_GET['aksi']==""){

$admin .='<h5 class="bg"><b>Data Karyawan</b></h5>';

$admin.='
<table id="example"class="table table-striped table-bordered" cellspacing="0" width="100%">
<thead>
<tr>
<th width="10%">NIP</th>
<th>Nama</th>
<th>Golongan</th>
<th>Jumlah Penggajian</th>
<th>Lama Kerja</th>
<th width="20%">Aksi</th>
</tr>
</thead>';
$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan where tipe='1'" );
while ($data = $koneksi_db->sql_fetchrow($query)) {
$gambar = $data['foto'];
$id = $data['id'];
$nip=$data['nip'];
$nama=$data['nama'];
$golongan=$data['golongan'];
$date2 = $data['tglditerima'];
$date3 = date("Y-m-d");
$lamakerja =  floor(daysBetween($date2, $date3));
$lamakerja2 = floor($lamakerja/365);
//$lamakerja2 = dateDifference($date2, $date3,'%y Tahun,%m Bulan');
$query2 = mysql_query ("SELECT count(id) AS total_penggajian FROM hrd_penggajian where karyawan=$id");
$get2	= mysql_fetch_assoc($query2);
$jumlah2 = $get2['total_penggajian'];

$admin.='<tr>
<td>'.$nip.'</td>
<td>'.$nama.'</td>
<td>'.getgolongan($golongan).'</td>';
$admin.="<td>$jumlah2 Bulan</td>";
$admin.="<td>$lamakerja2 Tahun</td>";
$admin.='<td>
<a class="text-info" href="?pilih=penggajian&amp;mod=yes&amp;aksi=setting_penggajian&amp;id='.$data['id'].'"><span class="btn btn-warning">Setting</span></a>
<a class="text-info" href="?pilih=penggajian&amp;mod=yes&amp;aksi=list_penggajian&amp;id='.$data['id'].'"><span class="btn btn-success">List</span></a> 
<a class="text-info" href="?pilih=penggajian&amp;mod=yes&amp;aksi=add_penggajian&amp;id='.$data['id'].'"><span class="btn btn-info">Tambah</span></a></td>
</tr>';
}
$admin .= '</tbody></table>';
}
###################################
# Tambah penggajian
###################################
if($_GET['aksi']=="add_penggajian"){

$id     = int_filter($_GET['id']);

$s = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id");
$datas = $koneksi_db->sql_fetchrow($s);
$nama = $datas['nama'];

$admin .='<h5 class="bg">Tambah Penggajian Karyawan dengan nama <strong>'.$nama.'</strong></h5>';

if (isset($_POST['submit'])){
	
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);

include "includes/hft_image.php";
$idkary  			= $_POST['idkary'];
$nip  			= $_POST['nip'];
$bulan  			= $_POST['bulan'];
$tahun  			= $_POST['tahun'];
$tkt  			= $_POST['tkt'];
$gajipokok  			= $_POST['gajipokok'];
$tstruktural  			= $_POST['tstruktural'];
$tfungsional  			= $_POST['tfungsional'];
$tpengabdian  			= $_POST['tpengabdian'];
$tistrianak  			= $_POST['tistrianak'];
$tuangtransport  			= $_POST['tuangtransport'];
$tbebantugas  			= $_POST['tbebantugas'];
$twalikelas  			= $_POST['twalikelas'];
$tkhusus  			= $_POST['tkhusus'];
$tlain  			= $_POST['tlain'];
$ppinjaman  			= $_POST['ppinjaman'];
$jamsostek  			= $_POST['jamsostek'];
$pph21  			= $_POST['pph21'];
$pid  			= $_POST['pid'];
$tglnow = date("Y-m-d");
////////////////////////////////////////////////////////
$gajibruto =  ($gajipokok+$tstruktural+$tfungsional+$tpengabdian+$tistrianak+$tuangtransport+$tbebantugas+$twalikelas+$tkhusus);
$totalgaji = $gajibruto+$tlain;
$gajibersih = $totalgaji-($ppinjaman+$jamsostek+$pph21);
/*******************************************************/
$total = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE nip = '".$_POST['nip']."' and id != '".$id."'");
$jumlah = $koneksi_db->sql_numrows( $total );
$total2 = $koneksi_db->sql_query( "SELECT * FROM hrd_penggajian WHERE bulan = '".$_POST['bulan']."' and karyawan= '".$id."'");
$jumlah2 = $koneksi_db->sql_numrows( $total2 );
$error = '';
if ($jumlah) $error .= "Error: NIP karyawan $nip sudah ada di dalam database!<br />";
if ($jumlah2) $error .= "Error: Bulan dan Tahun sudah ada di dalam database!<br />";
if (!$bulan)  $error .= "Error: bulan wajib diisi!<br />";
if (!$tahun)  $error .= "Error: tahun wajib diisi!<br />";
if ($error){
$admin.='<div class="alert alert-danger">'.$error.'</div>';
}else{
if($ppinjaman>'0'){
$hasil = $koneksi_db->sql_query( "INSERT INTO hrd_bayar (tgl,bayar,karyawan,pid) VALUES ('$tglnow','$ppinjaman','$id','$pid')" );
}
$hasil = $koneksi_db->sql_query( "SELECT MAX(id) as idbayar FROM hrd_bayar where pid='$pid' limit 1");
$data = $koneksi_db->sql_fetchrow($hasil);
$idbayar  			= $data['idbayar'];
$hasil = $koneksi_db->sql_query( "INSERT INTO hrd_penggajian (karyawan,bulan,tahun,tkt,gajipokok,tstruktural,tfungsional,tpengabdian,tistrianak,tuangtransport,tbebantugas,twalikelas,tkhusus,gajibruto,tlain,totalgaji,ppinjaman,jamsostek,pph21,gajibersih,idbayar) VALUES ('$id','$bulan','$tahun','$tkt','$gajipokok','$tstruktural','$tfungsional','$tpengabdian','$tistrianak','$tuangtransport','$tbebantugas','$twalikelas','$tkhusus','$gajibruto','$tlain','$totalgaji','$ppinjaman','$jamsostek','$pph21','$gajibersih','$idbayar')" );

$admin.='<div class="alert alert-success"><strong>Berhasil!</strong> Data  berhasil di Tambah</div>';
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=add_penggajian&id='.$id.'" />'; 
}
}

$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id" );
$data = $koneksi_db->sql_fetchrow($hasil);
$idkary  			= $data['id'];
$nip  			= $data['nip'];
$nama     		= text_filter($data['nama']);
$golongan  			= $data['golongan'];
$struktural  		= $data['struktural'];
$fungsional  		= $data['fungsional'];
$pengabdian  		= $data['pengabdian'];
$istrianak  		= $data['istrianak'];
$uangtransport  	= $data['uangtransport'];
$bebantugas  		= $data['bebantugas'];
$walikelas  		= $data['walikelas'];
$fotolama  			= $data['foto'];
$yearnow = date("Y");
$bulannow = date("n");
$tahun 		= !isset($tahun) ? $yearnow : $tahun;
$bulan		= !isset($bulan) ? $bulannow : $bulan;
///////////////////////////////////////

///////////////////////////////////////
$hasil3 = $koneksi_db->sql_query( "SELECT * FROM hrd_penggajian WHERE karyawan='$id' order by tahun,bulan desc limit 1" );
$data3 = $koneksi_db->sql_fetchrow($hasil3);
$dtkt  			= $data3['tkt'];
$dgajipokok  			= $data3['gajipokok'];
$dtstruktural  			= $data3['tstruktural'];
$dtfungsional  			= $data3['tfungsional'];
$dtpengabdian  			= $data3['tpengabdian'];
$dtistrianak  			= $data3['tistrianak'];
$dtuangmakan  			= $data3['tuangmakan'];
$dtuangtransport  			= $data3['tuangtransport'];
$dtbebantugas  			= $data3['tbebantugas'];
$dtwalikelas  			= $data3['twalikelas'];
$dtkhusus  			= $data3['tkhusus'];
$dtlain  			= $data3['tlain'];
$dppinjaman  			= $data3['ppinjaman'];
$djamsostek  			= $data3['jamsostek'];
$dpph21  			= $data3['pph21'];
//////////////////////////////////////////
$ntstruktural=getntstruktural($struktural);
$ntfungsional=getntfungsional($fungsional);
$ntpengabdian=getntpengabdian($pengabdian);
$ntistrianak=getntistrianak($istrianak);
$ntuangtransport=getntuangtransport($uangtransport);
$ntbebantugas=getntbebantugas($bebantugas);
$ntwalikelas=getntwalikelas($walikelas);
///////////////////////////////////////////
if(!$dgajipokok){
$dgajipokok=getgajipokok($golongan);
$dtstruktural=gettstruktural($struktural,$dgajipokok);
$dtfungsional=gettfungsional($fungsional,$dgajipokok);
$dtpengabdian=gettpengabdian($pengabdian,$dgajipokok);
$dtistrianak=gettistrianak($istrianak,$dgajipokok);
$dtuangtransport=gettuangtransport($uangtransport,$dgajipokok);
$dtbebantugas=gettbebantugas($bebantugas,$dgajipokok);
$dtwalikelas=gettwalikelas($walikelas,$dgajipokok);
$djamsostek  			= getjamsostek($dgajipokok,$dtstruktural,$dtfungsional,$dtpengabdian);
$dpph21  			= getpph21($dgajipokok);
}
$hasil2  = $koneksi_db->sql_query( "SELECT * FROM hrd_setting limit 1" );
$data2 = $koneksi_db->sql_fetchrow($hasil2);
$syaratthr  			= $data2['thr'];
$preward  			= $data2['reward'];
$poterlambat  			= $data2['terlambat'];
/////////////////////////////////////////////////////////////////////
$query2 = mysql_query ("SELECT id,pinjaman AS total_pinjaman FROM hrd_pinjaman where karyawan=$id order by id desc limit 1 ");
$get2	= mysql_fetch_assoc($query2);
$pid = $get2['id'];
$tpinjaman = $get2['total_pinjaman'];
$query3 = mysql_query ("SELECT sum(bayar) AS total_bayar FROM hrd_bayar where pid=$pid");
$get3	= mysql_fetch_assoc($query3);
$tbayar = $get3['total_bayar'];
$tsisabayar=$tpinjaman-$tbayar;
/////////////////////////////////////////////////////////////////////
$tkt		= !isset($tkt) ? $dtkt : $tkt;
$gajipokok 			= !isset($gajipokok) ? $dgajipokok  : $gajipokok;
$tstruktural 			= !isset($tstruktural) ? $dtstruktural  : $tstruktural;
$tfungsional			= !isset($tfungsional) ? $dtfungsional  : $tfungsional;
$tpengabdian			= !isset($tpengabdian) ? $dtpengabdian  : $tpengabdian;
$tistrianak			= !isset($tistrianak) ? $dtistrianak  : $tistrianak;
$tuangtransport		= !isset($tuangtransport) ? $dtuangtransport : $tuangtransport;
$tbebantugas		= !isset($tbebantugas) ? $dtbebantugas : $tbebantugas;
$twalikelas		= !isset($twalikelas) ? $dtwalikelas : $twalikelas;
$tkhusus		= !isset($tkhusus) ? '0' : $tkhusus;
$tlain		= !isset($tlain) ? '0' : $tlain;
$ppinjaman		= !isset($ppinjaman) ? $tsisabayar : $ppinjaman;
$jamsostek		= !isset($jamsostek) ? $djamsostek : $jamsostek;
$pph21		= !isset($pph21) ? $dpph21 : $pph21;

$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table  table-hover">
<tr>
	<td>Foto</td>
	<td></td>
</tr>';
if(!$fotolama){
$fotolama='profile-default.jpg';
}
$admin .='<tr>
	<td></td>
	<td><img src="mod/karyawan/images/normal/'.$fotolama.'" height="120">
	<input type="hidden" name="fotolama" value="'.$fotolama.'"></td>
</tr>
<tr>
	<td>NIP</td>
	<td><input type="hidden" name="nip" value="'.$nip.'">'.$nip.'</td>
</tr>
<tr>
	<td>Nama Lengkap</td>
	<td>
	<input type="hidden" name="nama" value="'.$nama.'">'.$nama.'
	</td>
</tr>
<tr>
	<td>Golongan</td>
	<td><input type="hidden" name="golongan" value="'.$golongan.'">'.getgolongan($golongan).'</td>
</tr>
<tr>
	<td>TKT</td>
	<td><input type="text" name="tkt" size="25" class="form-control" value='.$tkt.'></td>
</tr>
<tr>
	<td>Bulan / Tahun</td>
	<td><select name="bulan" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_bulan ORDER BY id");
$admin .= '<option value="">== Pilih Bulan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$bulan)?"selected":'';
$admin .= '<option value="'.$datas['id'].'"'.$pilihan.'>'.$datas['bulan'].'</option>';
}
$admin .='</select>&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="tahun" size="25" value="'.$tahun.'" class="form-control"></td>
</tr>
<tr>
	<td>Gaji Pokok</td>
	<td>';
$admin .="<input type='text' name='gajipokok' size='25' class='form-control' value='$gajipokok' onkeypress=\"genSEF(this)\">";

$admin.='</td>
</tr>
<tr>
	<td><h4>Tunjangan</h4></td>
	<td></td>
	</tr>
<tr>
	<td>Tunjangan Struktural</td>
	<td><input type="text" name="tstruktural" size="25" class="form-control" value='.$tstruktural.'></td>
</tr>
<tr>
	<td>Tunjangan Fungsional</td>
	<td><input type="text" name="tfungsional" size="25" class="form-control" value='.$tfungsional.'></td>
</tr>
<tr>
	<td>Tunjangan Pengabdian</td>
	<td><input type="text" name="tpengabdian" size="25" class="form-control" value='.$tpengabdian.'></td>
</tr>
<tr>
	<td>Tunjangan Anak</td>
	<td><input type="text" name="tistrianak" size="25" class="form-control" value='.$tistrianak.'></td>
</tr>
<tr>
	<td>Tunjangan Transport</td>
	<td><input type="text" name="tuangtransport" size="25" class="form-control" value='.$tuangtransport.'></td>
</tr>
<tr>
	<td>Tunjangan Beban Tugas</td>
	<td><input type="text" name="tbebantugas" size="25" class="form-control" value='.$tbebantugas.'></td>
</tr>
<tr>
	<td>Tunjangan Wali Kelas</td>
	<td><input type="text" name="twalikelas" size="25" class="form-control" value='.$twalikelas.'></td>
</tr>
<tr>
	<td>Tunjangan Khusus/Keahlian</td>
	<td><input type="text" name="tkhusus" size="25" class="form-control" value='.$tkhusus.'></td>
</tr>
<tr>
	<td>Tunjangan Lain-Lain</td>
	<td><input type="text" name="tlain" size="25" class="form-control" value='.$tlain.'></td>
</tr>
';
$admin.='
<tr>
	<td><h4>Potongan</h4></td>
	<td></td>
	</tr>';
$admin.='
<tr>
	<td>Potongan Pinjaman</td>
	<td><input type="text" name="ppinjaman" size="25" class="form-control"value="'.$ppinjaman.'"></td>
</tr>

<tr>
	<td>BPJS</td>
	<td><input type="text" name="jamsostek" size="25" class="form-control" value="'.$jamsostek.'"></td>
</tr>
<tr>
	<td>Potongan PPH21</td>
	<td><input type="text" name="pph21" size="25" class="form-control" value="'.$pph21.'"></td>
</tr>
<tr>
	<td></td>
	<td>
	<input type="hidden" name="pid" value="'.$pid.'">
	<input type="hidden" name="ntstruktural" value="'.$ntstruktural.'">
	<input type="hidden" name="ntfungsional" value="'.$ntfungsional.'">
	<input type="hidden" name="ntpengabdian" value="'.$ntpengabdian.'">
	<input type="hidden" name="ntistrianak" value="'.$ntistrianak.'">
	<input type="hidden" name="ntuangtransport" value="'.$ntuangtransport.'">
	<input type="hidden" name="ntbebantugas" value="'.$ntbebantugas.'">
	<input type="hidden" name="ntwalikelas" value="'.$ntwalikelas.'">
	<input type="hidden" name="pph21persen" value="'.$pph21persen.'">
	<input type="hidden" name="jamsostekpersen" value="'.$jamsostekpersen.'">
	<input type="hidden" name="idkary" value="'.$idkary.'">
	<input type="submit" value="Simpan" name="submit" class="btn btn-success"></td>
	</tr>
</table></form>';
}

if($_GET['aksi']=="edit"){

$id     = int_filter($_GET['id']);
$idgaji     = int_filter($_GET['idgaji']);

$s = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id");
$datas = $koneksi_db->sql_fetchrow($s);
$nama = $datas['nama'];

$admin .='<h5 class="bg">Edit Penggajian Karyawan dengan nama <strong>'.$nama.'</strong></strong></h5>';

if (isset($_POST['submit'])){
	
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);

include "includes/hft_image.php";
$idkary  			= $_POST['idkary'];
$nip  			= $_POST['nip'];
$bulan  			= $_POST['bulan'];
$tahun  			= $_POST['tahun'];
$tkt  			= $_POST['tkt'];
$gajipokok  			= $_POST['gajipokok'];
$tstruktural  			= $_POST['tstruktural'];
$tfungsional  			= $_POST['tfungsional'];
$tpengabdian  			= $_POST['tpengabdian'];
$tistrianak  			= $_POST['tistrianak'];
$tuangtransport  			= $_POST['tuangtransport'];
$tbebantugas  			= $_POST['tbebantugas'];
$twalikelas  			= $_POST['twalikelas'];
$tkhusus  			= $_POST['tkhusus'];
$tlain  			= $_POST['tlain'];
$ppinjaman  			= $_POST['ppinjaman'];
$jamsostek  			= $_POST['jamsostek'];
$pph21  			= $_POST['pph21'];
$pid  			= $_POST['pid'];
$tglnow = date("Y-m-d");
////////////////////////////////////////////////////////
$gajibruto =  ($gajipokok+$tstruktural+$tfungsional+$tpengabdian+$tistrianak+$tuangtransport+$tbebantugas+$twalikelas+$tkhusus);
$totalgaji = $gajibruto+$tlain;
$gajibersih = $totalgaji-($ppinjaman+$jamsostek+$pph21);
/*******************************************************/
$error = '';

if ($error){
$admin.='<div class="alert alert-danger">'.$error.'</div>';
}else{
if($ppinjaman>'0'){
$hasil = $koneksi_db->sql_query( "update hrd_bayar set bayar=$ppinjaman where id='$idbayar'" );
}
$hasil = $koneksi_db->sql_query( "update hrd_penggajian set tkt='$tkt',gajipokok='$gajipokok',tstruktural='$tstruktural',tfungsional='$tfungsional',tpengabdian='$tpengabdian',tistrianak='$tistrianak',tuangtransport='$tuangtransport',tbebantugas='$tbebantugas',twalikelas='$twalikelas',tkhusus='$tkhusus',gajibruto='$gajibruto',tlain='$tlain',totalgaji='$totalgaji',ppinjaman='$ppinjaman',jamsostek='$jamsostek',pph21='$pph21',gajibersih='$gajibersih' where id='$idgaji'");
$admin.='<div class="alert alert-success"><strong>Berhasil!</strong> Data  berhasil di Edit</div>';

}
}

$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id" );
$data = $koneksi_db->sql_fetchrow($hasil);
$idkary  			= $data['id'];
$nip  			= $data['nip'];
$nama     		= text_filter($data['nama']);
$golongan  			= $data['golongan'];
$struktural  		= $data['struktural'];
$fungsional  		= $data['fungsional'];
$pengabdian  		= $data['pengabdian'];
$istrianak  		= $data['istrianak'];
$uangtransport  	= $data['uangtransport'];
$bebantugas  		= $data['bebantugas'];
$walikelas  		= $data['walikelas'];
$fotolama  			= $data['foto'];
///////////////////////////////////////

///////////////////////////////////////
$hasil3 = $koneksi_db->sql_query( "SELECT * FROM hrd_penggajian WHERE id='$idgaji'" );
$data3 = $koneksi_db->sql_fetchrow($hasil3);
$idgaji  			= $data3['id'];
$tkt  			= $data3['tkt'];
$dgajipokok  			= $data3['gajipokok'];
$dtstruktural  			= $data3['tstruktural'];
$dtfungsional  			= $data3['tfungsional'];
$dtpengabdian  			= $data3['tpengabdian'];
$dtistrianak  			= $data3['tistrianak'];
$dtuangtransport  			= $data3['tuangtransport'];
$dtbebantugas  			= $data3['tbebantugas'];
$dtwalikelas  			= $data3['twalikelas'];
$dtkhusus  			= $data3['tkhusus'];
$dtlain  			= $data3['tlain'];
$dppinjaman  			= $data3['ppinjaman'];
$djamsostek  			= $data3['jamsostek'];
$dpph21  			= $data3['pph21'];
$dplain  			= $data3['plain'];
$dbulan 			= $data3['bulan'];
$dtahun  			= $data3['tahun'];
$idbayar  			= $data3['idbayar'];
//////////////////////////////////////////
$ntstruktural=getntstruktural($struktural);
$ntfungsional=getntfungsional($fungsional);
$ntpengabdian=getntpengabdian($pengabdian);
$ntistrianak=getntistrianak($istrianak);
$ntuangtransport=getntuangtransport($uangtransport);
$ntbebantugas=getntbebantugas($bebantugas);
$ntwalikelas=getntwalikelas($walikelas);
///////////////////////////////////////////
if(!$dgajipokok){
$dgajipokok=getgajipokok($golongan);
$dtstruktural=gettstruktural($struktural,$dgajipokok);
$dtfungsional=gettfungsional($fungsional,$dgajipokok);
$dtpengabdian=gettpengabdian($pengabdian,$dgajipokok);
$dtistrianak=gettistrianak($istrianak,$dgajipokok);
$dtuangtransport=gettuangtransport($uangtransport,$dgajipokok);
$dtbebantugas=gettbebantugas($bebantugas,$dgajipokok);
$dtwalikelas=gettwalikelas($walikelas,$dgajipokok);
$djamsostek  			= getjamsostek($dgajipokok,$dtstruktural,$dtfungsional,$dtpengabdian);
$dpph21  			= getpph21($dgajipokok);
}
$hasil2  = $koneksi_db->sql_query( "SELECT * FROM hrd_setting limit 1" );
$data2 = $koneksi_db->sql_fetchrow($hasil2);

$gajipokok 			= !isset($gajipokok) ? $dgajipokok  : $gajipokok;
$tstruktural 			= !isset($tstruktural) ? $dtstruktural  : $tstruktural;
$tfungsional			= !isset($tfungsional) ? $dtfungsional  : $tfungsional;
$tpengabdian			= !isset($tpengabdian) ? $dtpengabdian  : $tpengabdian;
$tistrianak			= !isset($tistrianak) ? $dtistrianak  : $tistrianak;
$tuangtransport		= !isset($tuangtransport) ? $dtuangtransport : $tuangtransport;
$tbebantugas		= !isset($tbebantugas) ? $dtbebantugas : $tbebantugas;
$twalikelas		= !isset($twalikelas) ? $dtwalikelas : $twalikelas;
$tkhusus		= !isset($tkhusus) ? $dtkhusus : $tkhusus;
$tlain		= !isset($tlain) ? $dtlain : $tlain;
$ppinjaman		= !isset($ppinjaman) ? $dppinjaman : $ppinjaman;
$jamsostek		= !isset($jamsostek) ? $djamsostek : $jamsostek;
$pph21		= !isset($pph21) ? $dpph21 : $pph21;
$bulan		= !isset($bulan) ? $dbulan : $bulan;
$tahun		= !isset($tahun) ? $dtahun : $tahun;
$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table  table-hover">
<tr>
	<td>Foto</td>
	<td></td>
</tr>';
if(!$fotolama){
$fotolama='profile-default.jpg';
}
$admin .='<tr>
	<td></td>
	<td><img src="mod/karyawan/images/normal/'.$fotolama.'" height="120">
	<input type="hidden" name="fotolama" value="'.$fotolama.'"></td>
</tr>
<tr>
	<td>NIP</td>
	<td><input type="hidden" name="nip" value="'.$nip.'">'.$nip.'</td>
</tr>
<tr>
	<td>Nama Lengkap</td>
	<td>
	<input type="hidden" name="nama" value="'.$nama.'">'.$nama.'
	</td>
</tr>
<tr>
	<td>Golongan</td>
	<td><input type="hidden" name="golongan" value="'.$golongan.'">'.getgolongan($golongan).'</td>
</tr>
<tr>
	<td>TKT</td>
	<td><input type="text" name="tkt" size="25" class="form-control" value='.$tkt.'></td>
</tr>
<tr>
	<td>Bulan / Tahun</td>
	<td>'.getbulan($bulan).' / '.$tahun.'</td>
</tr>
<tr>
	<td>Gaji Pokok</td>
	<td>';
$admin .="<input type='text' name='gajipokok' size='25' class='form-control' value='$gajipokok' onkeypress=\"genSEF(this)\">";

$admin.='</td>
</tr>
<tr>
	<td><h4>Tunjangan</h4></td>
	<td></td>
	</tr>
<tr>
	<td>Tunjangan Struktural</td>
	<td><input type="text" name="tstruktural" size="25" class="form-control" value='.$tstruktural.'></td>
</tr>
<tr>
	<td>Tunjangan Fungsional</td>
	<td><input type="text" name="tfungsional" size="25" class="form-control" value='.$tfungsional.'></td>
</tr>
<tr>
	<td>Tunjangan Pengabdian</td>
	<td><input type="text" name="tpengabdian" size="25" class="form-control" value='.$tpengabdian.'></td>
</tr>
<tr>
	<td>Tunjangan Istri/Anak</td>
	<td><input type="text" name="tistrianak" size="25" class="form-control" value='.$tistrianak.'></td>
</tr>
<tr>
	<td>Uang Transport</td>
	<td><input type="text" name="tuangtransport" size="25" class="form-control" value='.$tuangtransport.'></td>
</tr>
<tr>
	<td>Tunjangan Beban Tugas</td>
	<td><input type="text" name="tbebantugas" size="25" class="form-control" value='.$tbebantugas.'></td>
</tr>
<tr>
	<td>Tunjangan Wali Kelas</td>
	<td><input type="text" name="twalikelas" size="25" class="form-control" value='.$twalikelas.'></td>
</tr>
<tr>
	<td>Tunjangan Khusus</td>
	<td><input type="text" name="tkhusus" size="25" class="form-control"value="'.$tkhusus.'"></td>
</tr>
<tr>
	<td>Tunjangan Lain Lain</td>
	<td><input type="text" name="tlain" size="25" class="form-control"value="'.$tlain.'"></td>
</tr>';
$admin.='
<tr>
	<td><h4>Potongan</h4></td>
	<td></td>
	</tr>';
$admin.='
<tr>
	<td>Potongan Pinjaman</td>
	<td><input type="text" name="ppinjaman" size="25" class="form-control"value="'.$ppinjaman.'"></td>
</tr>

<tr>
	<td>BPJS</td>
	<td><input type="text" name="jamsostek" size="25" class="form-control" value="'.$jamsostek.'"></td>
</tr>
<tr>
	<td>Potongan PPH21</td>
	<td><input type="text" name="pph21" size="25" class="form-control" value="'.$pph21.'"></td>
</tr>
<tr>
	<td></td>
	<td>
	<input type="hidden" name="idbayar" value="'.$idbayar.'">
	<input type="hidden" name="ntstruktural" value="'.$ntstruktural.'">
	<input type="hidden" name="ntfungsional" value="'.$ntfungsional.'">
	<input type="hidden" name="ntpengabdian" value="'.$ntpengabdian.'">
	<input type="hidden" name="ntistrianak" value="'.$ntistrianak.'">
	<input type="hidden" name="ntuangtransport" value="'.$ntuangtransport.'">
	<input type="hidden" name="ntbebantugas" value="'.$ntbebantugas.'">
	<input type="hidden" name="ntwalikelas" value="'.$ntwalikelas.'">
	<input type="hidden" name="pph21persen" value="'.$pph21persen.'">
	<input type="hidden" name="jamsostekpersen" value="'.$jamsostekpersen.'">
	<input type="hidden" name="idkary" value="'.$idkary.'">
	<input type="submit" value="Simpan" name="submit" class="btn btn-success"></td>
	</tr>
</table></form>';
}

if($_GET['aksi']=="list_penggajian"){
$id     = int_filter($_GET['id']);
$s = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id");
$datas = $koneksi_db->sql_fetchrow($s);
$nama = $datas['nama'];

$admin .='<h5 class="bg">List Absensi <strong>'.$nama.'</strong></h5>';

$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id" );
$data = $koneksi_db->sql_fetchrow($hasil);
$idkary  			= $data['id'];
$nip  			= $data['nip'];
$nama     		= text_filter($data['nama']);
$departemen 	= $data['departemen'];
$jabatan		= $data['jabatan'];
$status		= $data['status'];
$fotolama 	= $data['foto'];

$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table  table-hover">
<tr>
	<td>Foto</td>
	<td></td>
</tr>';
if(!$fotolama){
$fotolama='profile-default.jpg';
}
$admin .='<tr>
	<td></td>
	<td><img src="mod/karyawan/images/normal/'.$fotolama.'" height="120">
	<input type="hidden" name="fotolama" value="'.$fotolama.'"></td>
</tr>
<tr>
	<td>NIP</td>
	<td><input type="hidden" name="nip" value="'.$nip.'">'.$nip.'</td>
</tr>
<tr>
	<td>Nama Lengkap</td>
	<td>
	<input type="hidden" name="nama" value="'.$nama.'">'.$nama.'
	</td>
</tr>
</table></form>';
$admin .= '</table>';
}

if(($_GET['aksi']=="list_penggajian")or($_GET['aksi']=="edit")or($_GET['aksi']=="add_penggajian")){
$admin .='<a class="text-info" href="?pilih=penggajian&amp;mod=yes&amp;aksi=add_penggajian&amp;id='.$data['id'].'"><span class="btn btn-info">Tambah Penggajian</span></a>';
$admin .='<legend>Data Penggajian</legend>';
$admin.='
<table id="example"class="table table-striped table-bordered" cellspacing="0" width="100%">
<thead>
<tr>
<th>Tahun</th>
<th>Bulan</th>
<th>Gaji Bersih</th>
<th width="20%">Aksi</th>
</tr>
</thead>';
$admin.='<tbody>';
$s = mysql_query ("SELECT * FROM `hrd_penggajian`where karyawan='$id'");	
while($datas = mysql_fetch_array($s)){
$idphoto = $datas['id'];
$gajibersih = $datas['gajibersih'];
$bulan = $datas['bulan'];
$tahun = $datas['tahun'];
$idbayar = $datas['idbayar'];
$urutan = $no + 1;
$edit = '<a href="admin.php?pilih=penggajian&mod=yes&aksi=edit&id='.$idkary.'&idgaji='.$idphoto.'"onclick="return confirm(\'Apakah Anda Ingin Mengedit Penggajian Ini ?\')" style="color:blue"><span class="btn btn-warning">Edit</span></a>';
$cetak = '<a href="cetak_slip.php?id='.$idphoto.'&idkary='.$idkary.'&idbayar='.$idbayar.'" target="new"onclick="return confirm(\'Apakah Anda Ingin Mencetak Penggajian Ini ?\')" style="color:blue"><span class="btn btn-info">Cetak Slip</span></a>';
$deleted = '<a href="admin.php?pilih=penggajian&mod=yes&aksi=hapus&id='.$idphoto.'&idkary='.$idkary.'&idbayar='.$idbayar.'" onclick="return confirm(\'Apakah Anda Ingin Menghapus Penggajian Ini ?\')" style="color:red"><span class="btn btn-danger">Delete</span></a>';

$admin .= '
<tr align="left">
<td>
'.$tahun.'
</td>
<td>
'.getbulan($bulan).'
</td>
<td>
'.rupiah_format($gajibersih).'
</td>
<td>
'.$deleted.' '.$edit.' '.$cetak.'
</td></tr>';
}
$admin .= '</table>';
}

if($_GET['aksi'] =='hapus'){
$idkary = int_filter ($_GET['idkary']);
$id = int_filter ($_GET['id']);
$idbayar = int_filter ($_GET['idbayar']);
$hapus = mysql_query ("DELETE FROM `hrd_bayar` WHERE `id`='$idbayar'");	
$hapus = mysql_query ("DELETE FROM `hrd_penggajian` WHERE `id`='$id'");	
if ($hapus){
$admin .= '<div class="sukses">Penggajian Berhasil Dihapus</div>';	
$style_include[] ='<meta http-equiv="refresh" content="3; url=admin.php?pilih=penggajian&mod=yes&aksi=add_penggajian&id='.$idkary.'" />';
}else {
$admin .= '<div class="error">Penggajian Gagal dihapus</div>';	
}
}

if($_GET['aksi']=="laporanbulanan"){
$yearnow = date("Y");
$tahun 		= !isset($tahun) ? $yearnow : $tahun;

$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table table-striped table-hover">';
$admin .= '<tr>
	<td>Bulan / Tahun</td>
	<td><select name="bulan" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_bulan ORDER BY id");
$admin .= '<option value="">== Pilih Bulan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'">'.$datas['bulan'].'</option>';
}
$admin .='</select>&nbsp;&nbsp;/&nbsp;&nbsp;<input type="text" name="tahun"value="'.$tahun.'" size="25" class="form-control"></td>
</tr>';
$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Lihat Laporan Bulanan" name="submit" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</table>';
$admin .= "* Apabila tidak dapat melakukan print, klik kanan pilih open link New Tab";
if (isset($_POST['submit'])){
$bulan  			= $_POST['bulan'];
$tahun  			= $_POST['tahun'];
$pbulan= getbulan($bulan);
$error = '';
if (!$bulan)  $error .= "Error: bulan wajib diisi!<br />";
if (!$tahun)  $error .= "Error: tahun wajib diisi!<br />";
if ($error){
$admin.='<div class="alert alert-danger">'.$error.'</div>';
}else{

$cetaklaporan = '<a href="cetak_lpenggajian.php?bulan='.$bulan.'&tahun='.$tahun.'" target="new"onclick="return confirm(\'Apakah Anda Ingin Mencetak Penggajian Bulanan ?\')" style="color:blue"><span class="btn btn-danger">Cetak Laporan</span></a>';
$admin .='<legend><b>Laporan Penggajian, Bulan / Tahun : '.$pbulan.' / '.$tahun.'</b> '.$cetaklaporan.'</legend>';
$admin.='
<table id="example"class="table table-striped table-bordered" cellspacing="0" width="100%">
<thead>
<tr>
<td>NIP</td>
<td>Account</td>
<td>Nama</td>
<td>Golongan</td>
<td>GajiPokok</td>
<td>T.Struktural</td>
<td>T.Fungsional</td>
<td>T.Pengabdian</td>
<td>T.Istri/Anak</td>
<td>T.Transport</td>
<td>Beban Tugas</td>
<td>T.Wali Kelas</td>
<td>T.Khusus</td>
<td>T.Lain-Lain</td>
<td>Pot.Pinjaman</td>
<td>BPJS</td>
<td>PPH21</td>
<td>Gaji Bersih</td>
<th>Aksi</th>
</tr>
</thead>';
$admin.='<tbody>';
$s = mysql_query ("SELECT * FROM `hrd_penggajian`where bulan='$bulan' and tahun='$tahun'");	
while($datas = mysql_fetch_array($s)){
$idphoto = $datas['id'];
$idkary = $datas['karyawan'];
$gajipokok 	= $datas['gajipokok'];
$tstruktural = $datas['tstruktural'];
$tfungsional = $datas['tfungsional'];
$tpengabdian = $datas['tpengabdian'];
$tistrianak = $datas['tistrianak'];
$tbebantugas  	=	 $datas['tbebantugas'];
$twalikelas  	=	 $datas['twalikelas'];
$tkhusus  = $datas['tkhusus'];
$tlain  	=	 $datas['tlain'];
$pph21  	= $datas['pph21'];
$jamsostek  = $datas['jamsostek'];
$ppinjaman  = $datas['ppinjaman'];
$gajibersih = $datas['gajibersih'];
$tuangtransport = $datas['tuangtransport'];
$urutan = $no + 1;
$hasil =  $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan where id='$idkary'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$nip = $data['nip'];
$nama=$data['nama'];
$golongan 	= $data['golongan'];
$tkt 	= $data['tkt'];
$norek 	= $data['norek'];
$cetak = '<a href="cetak_slip.php?id='.$idphoto.'&idkary='.$idkary.'" target="new"onclick="return confirm(\'Apakah Anda Ingin Mencetak Penggajian Ini ?\')" style="color:blue"><span class="btn btn-warning">Slip</span></a>';

$admin .= '
<tr align="left">
<td class="text-center">'.$nip.'</td>
<td>'.$norek.'</td>
<td>'.$nama.'</td>
<td>'.getgolongan($golongan).'</td>
<td>'.$gajipokok.'</td>
<td>'.$tstruktural.'</td>
<td>'.$tfungsional.'</td>
<td>'.$tpengabdian.'</td>
<td>'.$tistrianak.'</td>
<td>'.$tuangtransport.'</td>
<td>'.$tbebantugas.'</td>
<td>'.$twalikelas.'</td>
<td>'.$tkhusus.'</td>
<td>'.$tlain.'</td>
<td>'.$ppinjaman.'</td>
<td>'.$jamsostek.'</td>
<td>'.$pph21.'</td>
<td>'.rupiah_format($gajibersih).'</td>
<td>'.$cetak.'</td></tr>';
$tgajibersih+=$gajibersih;
$no++;
}
$admin .= '</table>';
$admin .= '<div align="right"><b>Total Gaji : '.rupiah_format($tgajibersih).'</b></div>';
}
}
}

if($_GET['aksi']=="setting"){

if (isset($_POST["submit"])) {
$jamsostek = $_POST["jamsostek"];
$error = '';
if ($error) {

$admin .='<div class="alert alert-danger">'.$error.'</div>';

} else {

$password3=md5($password1);
$hasil = $koneksi_db->sql_query( "UPDATE hrd_setting SET  jamsostek='$jamsostek'" );

$admin.='<div class="alert alert-success"> Setting BPJS telah di updated</div>';
}

}

$user =  $_SESSION['UserName'];
$hasil =  $koneksi_db->sql_query( "SELECT * FROM hrd_setting limit 1" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$jamsostek		= $data['jamsostek'];
}

$admin .='<form class="form-horizontal" method="post" action=""><table class="table table-striped" width="80%">
<tr>
	<td>Nama Asuransi</td>
	<td>'.$namaasuransi.'</td>
</tr>
<tr>
	<td>Setting '.$namaasuransi.'</td>
	<td><input type="text" name="jamsostek" size="10" class="form-control" value="'.$jamsostek.'"> % x Jumlah Tunjangan</td>
</tr>
<tr>
    <td></td>
	<td><input type="hidden" name="user" value="'.$user.'"><input type="submit" name="submit" value="Simpan" class="btn btn-success"></td>
</tr>
</table></form>';
}


if($_GET['aksi']=="struktural"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_struktural` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_struktural` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=struktural" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_struktural` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_struktural` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Tunjangan Struktural berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=struktural" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode Struktural</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_struktural" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=struktural&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=struktural&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="fungsional"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_fungsional` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_fungsional` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=fungsional" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_fungsional` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_fungsional` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Tunjangan Fungsional berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=fungsional" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode Fungsional</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_fungsional" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=fungsional&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=fungsional&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="pengabdian"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_pengabdian` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_pengabdian` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=pengabdian" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_pengabdian` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_pengabdian` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Tunjangan Pengabdian berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=pengabdian" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode Pengabdian</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_pengabdian" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=pengabdian&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=pengabdian&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="istrianak"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_istrianak` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_istrianak` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=istrianak" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_istrianak` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_istrianak` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Tunjangan Istri,Anak berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=istrianak" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode Istri-Anak</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_istrianak" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=istrianak&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=istrianak&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="uangmakan"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_uangmakan` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_uangmakan` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=uangmakan" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_uangmakan` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_uangmakan` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Tunjangan Istri,Anak berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=uangmakan" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode Uang Makan</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_uangmakan" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=uangmakan&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=uangmakan&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="uangtransport"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_uangtransport` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_uangtransport` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=uangtransport" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_uangtransport` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_uangtransport` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Uang Transport berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=uangtransport" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode Uang Transport</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_uangtransport" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=uangtransport&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=uangtransport&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="bebantugas"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_bebantugas` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
		unset($nominal);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Beban Tugas<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_bebantugas` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=bebantugas" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_bebantugas` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_bebantugas` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Beban Tugas berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=bebantugas" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_bebantugas" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=bebantugas&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=bebantugas&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="walikelas"){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];	
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_walikelas` (`nama` ,`persen`,`nominal`) VALUES ('$nama','$persen','$nominal')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($persen);
		unset($nominal);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$persen     		= !isset($persen) ? '' : $persen;
$nominal     		= !isset($nominal) ? '' : $nominal;
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah</h3></div>';

$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';
}

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$persen 		= $_POST['persen'];
	$nominal 		= $_POST['nominal'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Beban Tugas<br />";
	if (!$persen)  	$persen ='0';	
	if (!$nominal)  	$nominal ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_walikelas` SET `nama`='$nama',`persen`='$persen',`nominal`='$nominal' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=walikelas" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_walikelas` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit</h3></div>';
$admin .= '<br>
&nbsp;Harap Isi Salah satu Persen atau Nominal
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Persen</td>
		<td>:</td>
		<td><input type="text" name="persen" value="'.$data['persen'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Nominal</td>
		<td>:</td>
		<td><input type="text" name="nominal" value="'.$data['nominal'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_walikelas` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Tunjangan wali kelas berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=walikelas" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode</th>
            <th>Persen</th>
            <th>Nominal</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_walikelas" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$persen=$data['persen'];
$nominal=$data['nominal'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.$persen.'</td>
			<td>'.$nominal.'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=walikelas&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=walikelas&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="golongan"){

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$gajipokok 		= $_POST['gajipokok'];
	$error 	= '';
	if (!$gajipokok)  	$gajipokok ='0';	
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_golongan` SET `gajipokok`='$gajipokok' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&amp;mod=yes&amp;aksi=golongan" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_golongan` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Golongan</h3></div>';
$admin .= '<br>
&nbsp;Golongan akan menentukan Gaji Pokok
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" disabled name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td>Gaji Pokok</td>
		<td>:</td>
		<td><input type="text" name="gajipokok" value="'.$data['gajipokok'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("update `hrd_golongan` set gajipokok='0' WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Tunjangan Golongan berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penggajian&mod=yes&aksi=golongan" />';    
	}
}
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Daftar Golongan</h3></div>';
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode</th>
            <th>Gaji Pokok</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_golongan" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$gajipokok=$data['gajipokok'];
$admin.='<tr>
            <td>'.$nama.'</td>
			<td>'.rupiah_format($gajipokok).'</td>
            <td><a href="?pilih=penggajian&amp;mod=yes&amp;aksi=golongan&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=penggajian&amp;mod=yes&amp;aksi=golongan&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
$admin.='</div>';
}

###################################
# Edit Karyawan
###################################
if($_GET['aksi']=="setting_penggajian"){

$id     = int_filter($_GET['id']);

$s = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id");
$datas = $koneksi_db->sql_fetchrow($s);
$nama = $datas['nama'];

$admin .='<h5 class="bg">Setting Karyawan dengan nama <strong>'.$nama.'</strong></h5>';

if (isset($_POST['submit'])){
	
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);

include "includes/hft_image.php";

$nip  			= $_POST['nip'];
$nama     		= text_filter($_POST['nama']);
$golongan  			= $_POST['golongan'];
$struktural  			= $_POST['struktural'];
$fungsional  			= $_POST['fungsional'];
$pengabdian  			= $_POST['pengabdian'];
$istrianak  			= $_POST['istrianak'];
$uangmakan  			= $_POST['uangmakan'];
$uangtransport  			= $_POST['uangtransport'];
$bebantugas  			= $_POST['bebantugas'];
$walikelas  			= $_POST['walikelas'];
$error = '';

if (!$golongan)  	$error .= "Error: Silahkan Isi Golongan<br />";

if ($error){
$admin.='<div class="alert alert-danger">'.$error.'</div>';
}else{

//masukkan data
$hasil = $koneksi_db->sql_query( "UPDATE hrd_karyawan SET golongan='$golongan',struktural='$struktural',fungsional='$fungsional',pengabdian='$pengabdian',istrianak='$istrianak',uangmakan='$uangmakan',uangtransport='$uangtransport',bebantugas='$bebantugas',walikelas='$walikelas' WHERE id='$id'" );
if($hasil){
$admin.='<div class="alert alert-success"><strong>Berhasil!</strong> karyawan dengan nama <strong>'.stripslashes ($_POST['nama']).'</strong> berhasil disimpan</div>';
$style_include[] ='<meta http-equiv="refresh" content="1; url=?pilih=penggajian&mod=yes">';
}
}
}

$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id" );
$data = $koneksi_db->sql_fetchrow($hasil);
$nip  			= $data['nip'];
$nama     		= text_filter($data['nama']);
$golongan  			= $data['golongan'];
$struktural  			= $data['struktural'];
$fungsional  			= $data['fungsional'];
$pengabdian  			= $data['pengabdian'];
$istrianak  			= $data['istrianak'];
$uangmakan  			= $data['uangmakan'];
$uangtransport  			= $data['uangtransport'];
$bebantugas  			= $data['bebantugas'];
$walikelas  			= $data['walikelas'];
$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table table-hover">
<tr>
	<td>NIP</td>
	<td><input readonly type="text" name="nip" value="'.$nip.'" size="30" class="form-control"></td>
</tr>
<tr>
	<td>Nama Lengkap</td>
	<td><input  readonly type="text" name="nama" value="'.$nama.'" size="30" class="form-control"></td>
</tr>
<tr>
	<td>Golongan</td>
	<td><select name="golongan" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_golongan ORDER BY id");
$admin .= '<option value="-">== Golongan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$golongan)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['gajipokok'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Tunj.Struktural</td>
	<td><select name="struktural" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_struktural ORDER BY id");
$admin .= '<option value="-">== Tunjangan Struktural ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$struktural)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Tunj.Fungsional</td>
	<td><select name="fungsional" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_fungsional ORDER BY id");
$admin .= '<option value="-">== Tunjangan Fungsional ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$fungsional)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Tunj.Pengabdian</td>
	<td><select name="pengabdian" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_pengabdian ORDER BY id");
$admin .= '<option value="-">== Tunjangan Pengabdian ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$pengabdian)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Tunj.Istri Anak</td>
	<td><select name="istrianak" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_istrianak ORDER BY id");
$admin .= '<option value="-">== Tunjangan Istri Anak ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$istrianak)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Uang Makan</td>
	<td><select name="uangmakan" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_uangmakan ORDER BY id");
$admin .= '<option value="-">== Uang Makan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$uangmakan)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Uang Transport</td>
	<td><select name="uangtransport" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_uangtransport ORDER BY id");
$admin .= '<option value="-">== Uang Transport ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$uangtransport)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Beban Tugas</td>
	<td><select name="bebantugas" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_bebantugas ORDER BY id");
$admin .= '<option value="-">== Beban Tugas ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$bebantugas)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Wali Kelas</td>
	<td><select name="walikelas" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_walikelas ORDER BY id");
$admin .= '<option value="-">== Wali Kelas ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$walikelas)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].' - '.$datas['persen'].' / '.$datas['nominal'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td></td>
	<td><input type="submit" value="Simpan" name="submit" class="btn btn-success"></td>
</table></form>';
}


echo $admin;

?>