<script src="controllers/c_modulpenerimaansiswa.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Modul Penerimaan Siswa </h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<!-- <button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button> -->

<div class="input-control select span3">
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Angkatan" class="cari" name="angkatanS" id="angkatanS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Kategori Modul Pembayaran" class="cari" name="katmodulpembayaranS" id="katmodulpembayaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Nama Pembayaran</th>
            <th class="text-center">Rekening</th>
            <th class="text-center">Tahun Ajaran</th>
            <th class="text-center">Semester</th>
            <th class="text-center">Bulan</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-right"><div class="input-control text"><input  class="cari" placeholder="nama" id="namaS" name="namaS"></div></th>
            <th class="text-center"></th>
            <th class="text-center"><div class="input-control select">
                <select data-hint="Tahun Ajaran" class="cari" id="tahunajaranS" name="tahunajaranS">
            </div></th>
            <th class="text-center"><div class="input-control select">
                <select data-hint="semester" class="cari" id="semesterS" name="semesterS">
            </div></th>
            <th class="text-center"><div class="input-control select">
                <select data-hint="Bulan" class="cari" id="bulanS" name="bulanS">
            </div></th>
            <th class="text-center"><div class="input-control text"><input  class="cari" placeholder="keterangan" id="keteranganS" name="keteranganS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
