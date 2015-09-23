<script src="controllers/c_setAngsuran.js"></script>

<h4 style="color:white;">Set Angsuran</h4>
<div id="loadarea"></div>
<button data-hint="Tambah Data" class="button" id="tambahBC"><i class="icon-plus-2 on-center"></i> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Jumlah Angsuran (bulan)</th>
            <th class="text-center">Diskon</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="angsuranS"name="angsuranS"></div></th>
            <th class="text-center"></th>
            <th class="text-center"><div class="input-control text"><input class="cari"  placeholder="cari ..." id="keteranganS"name="keteranganS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
