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
$( "#tglmulai" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#tglakhir" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable( {
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total = api
                .column( 4 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                } );
 
            // Total over this page
            pageTotal = api
                .column( 4, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 4 ).footer() ).html(
                '$'+pageTotal +' ( $'+ total +' total)'
            );
        }
    } );
} );
</script>
js;

$script_include[] = $JS_SCRIPT;
	$admin  .='<legend>PEMBAYARAN PIUTANG</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=piutang&mod=yes">PIUTANG</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=piutang&mod=yes&aksi=cetak">CETAK PIUTANG</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']==""){
$admin .= '
<div align="right">
<a href="admin.php?pilih=piutang&mod=yes&status=semua" class="btn btn-success"> SEMUA </a>&nbsp;<a href="admin.php?pilih=piutang&mod=yes&status=lunas" class="btn btn-primary"> LUNAS </a>&nbsp;<a href="admin.php?pilih=piutang&mod=yes&status=piutang" class="btn btn-danger"> BELUM LUNAS </a>
</div><br>';

$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Daftar Piutang</b></div>';	

$admin.='
<table class="table table-striped table-bordered" cellspacing="0" width="100%"id="example">
    <thead>
        <tr>
            <th>No.Faktur</th>
            <th>Tanggal</th>
            <th>Customer</th>
            <th>Total</th>
            <th>Bayar</th>
            <th>Kekurangan</th>
            <th>Jatuh Tempo</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
	$status 		= $_GET['status'];
if($status=='lunas')
{
         $wherestatus="where piutang='0'";
}elseif($status=='semua')
{
         $wherestatus="";
}elseif($status=='piutang'or !isset($_GET['status'])){
$wherestatus="where bayar='0'";
}
$hasil = $koneksi_db->sql_query( "SELECT * FROM `pos_penjualan` $wherestatus order by tgl desc" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nofaktur = $data['nofaktur'];
$piutang = $data['piutang'];
$tgltermin = tanggalindo($data['tgltermin']);
if($tgltermin=='01/01/1970'){
$tgltermin='';
}
if($piutang>'0'){
$lihatslip = '<a href="cetak_notafaktur.php?kode='.$data['nofaktur'].'&lihat=ok&bayar=ok"target="new">'.$data['nofaktur'].'</a>';
}else{
$lihatslip = '<a href="cetak_notafaktur.php?kode='.$data['nofaktur'].'&lihat=ok"target="new">'.$data['nofaktur'].'</a>';
}
$admin.='<tr>
            <td>'.$lihatslip.'</td>
            <td>'.tanggalindo($data['tgl']).'</td>
            <td>'.getnamacustomer($data['kodecustomer']).'</td>
            <td>'.rupiah_format($data['total']).'</td>
            <td>'.rupiah_format($data['bayar']).'</td>
            <td>'.rupiah_format($data['piutang']).'</td>
            <td>'.$tgltermin.'</td>
        </tr>';
$ttotal += $data['total'];
$tbayar += $data['bayar'];
$tpiutang += $data['piutang'];
}   
$admin.='</tbody>';
$admin.='
</table>';
}

if($_GET['aksi']=="cetak"){
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglawal : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$sel = '<select name="status" class="form-control">';
$arr5 = array ('Semua','Piutang','Lunas');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}
$sel .= '</select>';
$admin .='<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Cetak Daftar Piutang</b></div>';
$admin .= '<form class="form-inline" method="GET" action="cetakpiutang.php" enctype ="multipart/form-data" target="_blank" id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" name="tglmulai" value="'.$tglmulai.'" class="form-control"id="tglmulai"></td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" name="tglakhir" value="'.$tglakhir.'" class="form-control"id="tglakhir"></td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Status Bayar</td>
		<td>'.$sel.'	
		</td>
	</tr>';
$admin .= '<tr>
	<td>Customer </td>
	<td><select name="customer" id="combobox">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM psb_siswa ORDER BY namasiswa asc");
$admin .= '<option value="Semua"> Semua </option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['replid'].'">'.$datasj['namasiswa'].'</option>';
}
$admin .='</select></td>
</tr>';
$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Cetak" name="cetak" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</table>';
}

$admin .='</div>';
echo $admin;
}
?>