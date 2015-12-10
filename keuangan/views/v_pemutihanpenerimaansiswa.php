<?php isMenu($modul,'pemutihanpenerimaansiswa'); ?>
<script src="controllers/c_pemutihanpenerimaansiswa.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Pemutihan Penerimaan Siswa</h4>
<button <?php echo isAksi('pemutihanpenerimaansiswa','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="tahunajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="subtingkat" name="subtingkatS" id="subtingkatS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tgl. Input</th>
            <th class="text-center">NIS</th>
            <th class="text-center">Siswa</th>
            <th class="text-center">Oleh</th>
            <th class="text-center">No. MOM</th>
            <th class="text-center">Tgl. MOM</th>
            <th class="text-center">Total</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th></th>
            <th class="text-center"><input class="cari" data-transform="input-control" class="cari" placeholder="cari..." id="nisS"></div></th>
            <th class="text-center"><input class="cari" data-transform="input-control" class="cari" placeholder="cari..." id="siswaS"></div></th>
            <th class="text-center">
            <!-- <input class="cari" data-transform="input-control" class="cari" placeholder="cari..." id="karyawanS"></div> -->
            </th>
            <th class="text-center"><input class="cari" data-transform="input-control" class="cari" placeholder="cari..." id="nomomS"></div></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </thead>

    <tbody id="tbody">
    </tbody>
</table>