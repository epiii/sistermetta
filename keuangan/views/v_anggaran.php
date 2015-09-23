<?php isMenu($modul,'anggaran'); ?>
<script src="controllers/c_anggaran.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Anggaran</h4>
<div id="loadarea"></div>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<!-- panel 1 -->
<div title="Kategori Anggaran" class="panelx" id="panel1" style="display:none;">
    <button <?php echo isAksi('anggaran','c')?'onclick="loadFR(\'anggaran\',\'\')"':'disabled';  ?>  data-hint="Tambah Data" id="a_tambahBC"><span class="icon-plus-2"></span> </button>
    <!-- <button data-hint="Field Pencarian" id="a_cariBC"><span class="icon-search"></span> </button> -->
    <button class="fg-white bg-blue" data-hint="Cetak Rencana" id="a_cetakBC"><span class="icon-printer"></span> </button>
    <button class="fg-white bg-orange" data-hint="Cetak Realisasi" id="a_cetak2BC"><span class="icon-printer"></span> </button>
    <div class="input-control select size3">
        <select data-hint="Departemen" class="anggaran_cari" name="a_departemenS" id="a_departemenS" data-hint="Departemen" ></select>
    </div> 
    <!-- <div class="input-control select size3">
         <select data-hint="Tahun Ajaran" class="anggaran_cari" name="a_tahunajaranS" id="a_tahunajaranS" data-hint="Tahun Ajaran" ></select>
     </div> --> 
    <div class="input-control select size3">
        <select data-hint="Tingkat" class="anggaran_cari" name="a_tingkatS" id="a_tingkatS" data-hint="Tingkat" ></select>
    </div> 

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kategori Anggaran </th>
                <th class="text-center">Rekening</th>
                <th class="text-center">Tujuan</th>
                <th class="text-center">Jumlah</th>
                <th class="text-center">Kuota Anggaran</th>
                <th class="text-center">Sisa Anggaran</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr id="a_cariTR" class="info">
                <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="a_namaS" class="anggaran_cari" class="span1"></div></th>
                <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="a_rekeningS" class="anggaran_cari"></div></th>
                <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="a_keteranganS" class="anggaran_cari"></th>
                <th class="text-center"></th>
                <th class="text-center"></th>
                <th class="text-center"></th>
                <th class="text-center"></th>
            </tr>
        </thead>

        <tbody id="anggaran_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 1 -->

<!-- panel 2 -->
<div title="Detil Anggaran" class="panelx" id="panel2" style="display:none;">
    <button data-hint="kembali" id="d_kategorianggaranBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Tambah Data" id="d_tambahBC"><span class="icon-plus-2"></span> </button>
    <!-- <button data-hint="Field Pencarian" id="k_cariBC"><span class="icon-search"></span> </button> -->
    <button data-hint="Cetak " id="k_cetakBC"><span class="icon-printer"></span> </button>
    
    <div class="grid" style="color:white;">
        <input type="hidden" id="d_kategorianggaranH" id="d_kategorianggaranH" class="detilanggaran_cari" >
        <div class="row">
            <!-- <span class="span3"> -->
                <span class="span3">Kategori Anggaran : </span> 
                <span id="d_kategorianggaranDV"></span>
                <!-- <span class="span3">Total Anggaran:</span> -->
                <!-- <span xclass="fg-lightTeal" style="color:yellow;font-weight:boldx;" id="d_katanggkuotanumDV"></span> -->
            <!-- </span> -->
        </div>
        <div class="row">
            <span class="span3">Keterangan:</span>
            <span id="d_keteranganDV"></span>
        </div>
        <div class="row">
            <span class="span3">Tahun Ajaran:</span>
            <span id="d_tahunajaranDV"></span>
        </div>
        <div class="row">
            <span class="span3">Tingkat:</span>
            <span id="d_tingkatDV"></span>
        </div>
        <div class="row">
            <span class="span3">Total Anggaran:</span>
            <h1 xclass="fg-lightTeal" style="color:yellow;font-weight:boldx;" id="d_katanggkuotanumDV"></h1>
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th rowspan="2" class="text-center">Anggaran </th>
                <th colspan="2" class="text-center">Nominal</th>
                <th rowspan="2">Tujuan</th>
                <th rowspan="2" class="text-center">Aksi</th>
            </tr>
            <tr style="color:white;"class="info">
                <th class="text-center">Kuota</th>
                <th class="text-center">Terpakai</th>
                <!-- <th rowspan="2" class="text-center"></th> -->
            </tr>
            <tr style="display:none;" id="k_cariTR" class="info">
                <th class="text-center"><div class="input-control text"><input placeholder="Anggaran" id="d_namaS"  class="detilanggaran_cari" class="span1"></div></th>
                <th class="text-center"></th>
                <th class="text-center"></th>
                <th class="text-center"><div class="input-control text"><input placeholder="cari" id="d_keteranganS" class="detilanggaran_cari"></div></th>
                <th class="text-center"></th>
            </tr>
        </thead>
        <tbody id="detilanggaran_tbody"></tbody>
        <tfoot></tfoot>
    </table>
</div>
<!-- end of panel 2 -->