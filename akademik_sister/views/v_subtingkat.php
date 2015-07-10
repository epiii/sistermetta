<script src="controllers/c_subtingkat.js"></script>

<h4 style="color:white;">Sub Tingkat</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<!-- <button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button> -->

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Subtingkat (Kelas)</th>
            <th class="text-center">Tingkat</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="info">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="subtingkat" id="subtingkatS"></div></th>
            <th>
                <div class="input-control select">
                    <select  class="cari" data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
                </div>
            </th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 