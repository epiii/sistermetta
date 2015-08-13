<script src="controllers/c_user.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">User</h4>
<div id="loadarea"></div>

<button <?php isDisabled('level','c');?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<!--<button <?php isDisabled('level','s');?>  data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>-->
<table class="table hovered bordered striped">
    <?php
$xx= isDisabled('user','c');
pr($_SESSION);
?>

    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Nama</th>
            <th class="text-center">Username</th>
            <th class="text-center">Level</th>
            <th class="text-center">Status</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="namaS" name="namaS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="usernameS" name="usernameS"></div></th>
            <th class="text-center"><div class="input-control select">
                <select class="text-center cari" data-hint="level" id="levelS" name="levelS"></select>
            </div></th>
            <th class="text-center"><div class="input-control select">
                <select class="text-center cari" data-hint="status" id="aktifS" name="aktifS">
                    <option value="">- Semua -</option>
                    <option class="fg-white bg-green" value="1">Aktif</option>
                    <option class="fg-white bg-red" value="0">Tidak Aktif</option>
                </select>
            </div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>

