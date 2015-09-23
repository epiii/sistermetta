<script src="controllers/c_detailpelajaran.js"></script>
<script src="js/metro/metro-hint.js"></script>

<!-- combogrid -->
    <script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
    <script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
    <!-- --- -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!-- combogrid -->

<div class="input-control select size3">
    <select class="cari" data-hint="Tingkat" id="tingkatS"name="tingkatS"></select>
</div>

<div class="input-control select size3">
    <select class="cari" data-hint="Sub Tingkat" id="subtingkatS"name="subtingkatS"></select>
</div>
<nav class="breadcrumbs">
    <ul>
        <button class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
        <li><a href="pelajaran">Pelajaran</a></li>
        <li class="active"><a href="#"><b>Detail  Pelajaran</b></a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Mata Pelajaran </th>
            <th class="text-center">Status</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xxstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input placeholder="cari ..." id="pelajaranS" class="cari"></div></th>
            <th class="text-center">
                <div class="input-control select">
                    <select class="cari text-center" id="statusS" class="cari">
                        <option value="">-SEMUA-</option>
                        <option class="fg-white bg-green" value="1">Aktif</option>
                        <option class="fg-white bg-red" value="0">Tidak Aktif</option>
                    </select>
                </div>
            </th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
