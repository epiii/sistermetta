<script src="controllers/c_setDiskon.js"></script>

<h4 style="color:white;">Set Diskon</h4>
<div id="loadarea"></div>
<button data-hint="Tambah Data" class="button" id="tambahBC"><i class="icon-plus-2 on-left"></i>Tambah </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-left">No.</th>
            <th class="text-left">Diskon</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="diskon" id="diskonS"name="diskonS"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS"name="keteranganS"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
