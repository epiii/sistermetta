<?phpif (!defined('AURACMS_admin')) {	Header("Location: ../../../index.php");	exit;}if (!cek_login ()){   $admin .='<p class="judul">Access Denied !!!!!!</p>';   exit;}$admin  .='<legend>PENGGAJIAN</legend>';if($_GET['aksi']==""){$admin .= '<div align="center"><table width="600px"><tr align="center"><td><a href="admin.php?pilih=penggajian&mod=yes"><img src="images/penggajian.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=laporanbulanan"><img src="images/laporan.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=setting"><img src="images/setting.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=golongan"><img src="images/setting.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=struktural"><img src="images/setting.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=fungsional"><img src="images/setting.jpg" width="50px"><br></a></td></tr><tr align="center"><td><a href="admin.php?pilih=penggajian&mod=yes"><br>Penggajian</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=laporanbulanan"><br>Laporan</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=setting"><br>Setting Asuransi</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=golongan"><br>Golongan</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=struktural"><br>Struktural</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=fungsional"><br>Fungsional</a></td></tr></table></div><br><br>';$admin .= '<div align="center"><table width="600px"><tr align="center"><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=pengabdian"><img src="images/setting.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=istrianak"><img src="images/setting.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=uangtransport"><img src="images/setting.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=bebantugas"><img src="images/setting.jpg" width="50px"><br></a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=walikelas"><img src="images/setting.jpg" width="50px"><br></a></td></tr><tr align="center"><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=pengabdian"><br>Pengabdian</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=istrianak"><br>Istri-Anak</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=uangtransport"><br>Uang Transport</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=bebantugas"><br>Beban Tugas</a></td><td><a href="admin.php?pilih=penggajian&mod=yes&aksi=walikelas"><br>Wali Kelas</a></td></tr></table></div><br><br>';}echo $admin;?>