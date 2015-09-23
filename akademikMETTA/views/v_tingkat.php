<script src="controllers/c_tingkat.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>

<!-- <h4 style="color:white;">Tingkat</h4> -->
<!-- <div id="loadarea"></div> -->
<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
        <li class="active"><a href="#"><b>Tingkat</b></a></li>
        <li><a href="subtingkat">Sub Tingkat</a></li>
        <li><a href="kelas">Kelas</a></li>
        <li><a href="detail-kelas">Detail Kelas</a></li>
    </ul>
</nav>

<!-- <button data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> -->

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Urutan </th>
            <th class="text-center">Tingkat </th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="tingkatS" name="tingkatS"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="keteranganS" name="keteranganS"></div></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>