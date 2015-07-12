<script src="controllers/c_pelajaran.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>

<h4 style="color:white;">Pelajaran</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Mata Pelajaran </th>
            <th class="text-center">Singkatan</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="pelajaranS" class="cari"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="singkatanS" class="cari"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="keteranganS"  class="cari"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
