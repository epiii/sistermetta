<script src="controllers/c_setBiayaCalonSiswa.js"></script>
<h4 style="color:white;">Set Biaya Calon Siswa</h4>
<div id="loadarea"></div>

<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari"  data-hint="Proses" name="prosesS" id="prosesS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="Kelompok" name="kelompokS" id="kelompokS"></select>
</div>

<div  style="overflow:scroll;height:600px;" >
    <form autocomplete="off" onsubmit="simpan();return false;"> 
        <button data-hint="Simpan" id="simpanBC"><span class="icon-floppy"></span> </button>
        <table class="table hovered bordered striped">
            <thead>
                <tr style="color:white;"class="info">
                    <th class="text-center">Kriteria </th>
                    <th class="text-center">Golongan</th>
                    <th class="text-center">Biaya Pendaftaran</th>
                    <th class="text-center">Uang Pangkal</th>
                    <th class="text-center">SPP</th>
                    <th class="text-center">Joining Fee</th>
                </tr>
            </thead>

            <tbody id="tbody"></tbody>
        </table>
    </form>
</div>