<script src="controllers/c_guru.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Guru</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Pencarian" onclick="cariTR();"><span class="icon-search"></span> </button>
<div style="display:none;" class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Pelajaran" name="pelajaranS" id="pelajaranS"></select>
</div>
<!-- <button data-hint="Field Pencarian" class="large" id="cariBC"><span class="icon-search"></span> </button>
 -->
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">NIP</th>
            <th class="text-center">Nama Guru</th>
            <th class="text-center">Mata Pelajaran </th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input onkeypress="cariFC();" placeholder="cari NIP Guru" id="nipS" name="nipS" type="text"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari nama Guru" id="guruS" name="guruS" type="text"></div></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
