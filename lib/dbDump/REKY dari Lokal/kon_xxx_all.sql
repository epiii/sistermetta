# Host: localhost  (Version: 5.5.27)
# Date: 2015-12-15 15:50:03
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "kon_aksi"
#

DROP TABLE IF EXISTS `kon_aksi`;
CREATE TABLE `kon_aksi` (
  `id_aksi` int(11) NOT NULL AUTO_INCREMENT,
  `aksi` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_aksi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "kon_aksi"
#

INSERT INTO `kon_aksi` VALUES (1,'r','read'),(2,'c','create'),(3,'u','update'),(4,'d','delete'),(5,'s','search'),(6,'p','print/report');

#
# Structure for table "kon_grupmenu"
#

DROP TABLE IF EXISTS `kon_grupmenu`;
CREATE TABLE `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_katgrupmenu` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Data for table "kon_grupmenu"
#

INSERT INTO `kon_grupmenu` VALUES (1,2,1,'Menu Kesiswaan','four'),(2,2,1,'Menu Belajar - Mengajar','four'),(3,1,1,'Menu Master','four'),(4,1,2,'Menu Transaksi','four'),(5,2,6,'Menu Transaksi ','double'),(6,1,6,'Menu Master','double'),(7,1,9,'Menu Sistem','double'),(8,2,9,'Menu User','double'),(9,1,2,'Menu Master','four'),(14,1,3,'Menu Master ','double double-vertic'),(15,2,3,'Menu Transaksi','double double-vertic');

#
# Structure for table "kon_grupmodul"
#

DROP TABLE IF EXISTS `kon_grupmodul`;
CREATE TABLE `kon_grupmodul` (
  `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmodul`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "kon_grupmodul"
#

INSERT INTO `kon_grupmodul` VALUES (1,'satu','four'),(2,'dua','four'),(3,'tiga','four');

#
# Structure for table "kon_icon"
#

DROP TABLE IF EXISTS `kon_icon`;
CREATE TABLE `kon_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(25) NOT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Data for table "kon_icon"
#

INSERT INTO `kon_icon` VALUES (1,'akademik'),(2,'sarpras'),(3,'hrd'),(4,'psb'),(5,'keuangan'),(6,'student'),(7,'perpus'),(8,'manajemen'),(9,'pencil'),(10,'address-book'),(11,'book'),(12,'copy'),(13,'user-3'),(14,'user'),(15,'grid-view'),(16,'tab'),(17,'cog'),(18,'user-2'),(20,'loop');

#
# Structure for table "kon_katgrupmenu"
#

DROP TABLE IF EXISTS `kon_katgrupmenu`;
CREATE TABLE `kon_katgrupmenu` (
  `id_katgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `katgrupmenu` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_katgrupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "kon_katgrupmenu"
#

INSERT INTO `kon_katgrupmenu` VALUES (1,'M','Master'),(2,'T','Transaksi');

#
# Structure for table "kon_level"
#

DROP TABLE IF EXISTS `kon_level`;
CREATE TABLE `kon_level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "kon_level"
#

INSERT INTO `kon_level` VALUES (1,'A','Admin'),(2,'G','Guest'),(3,'O','Operator'),(4,'SA','Super Admin');

#
# Structure for table "kon_levelkatgrupmenu"
#

DROP TABLE IF EXISTS `kon_levelkatgrupmenu`;
CREATE TABLE `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  PRIMARY KEY (`id_levelkatgrupmenu`),
  KEY `id_level` (`id_level`),
  KEY `id_katgrupmenu` (`id_katgrupmenu`),
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`),
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_2` FOREIGN KEY (`id_katgrupmenu`) REFERENCES `kon_katgrupmenu` (`id_katgrupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "kon_levelkatgrupmenu"
#

INSERT INTO `kon_levelkatgrupmenu` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,3,2),(7,4,1),(8,4,2);

#
# Structure for table "kon_levelaksi"
#

DROP TABLE IF EXISTS `kon_levelaksi`;
CREATE TABLE `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_levelaksi`),
  KEY `id_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  KEY `id_aksi` (`id_aksi`),
  CONSTRAINT `kon_levelaksi_ibfk_1` FOREIGN KEY (`id_levelkatgrupmenu`) REFERENCES `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  CONSTRAINT `kon_levelaksi_ibfk_2` FOREIGN KEY (`id_aksi`) REFERENCES `kon_aksi` (`id_aksi`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=latin1;

#
# Data for table "kon_levelaksi"
#

INSERT INTO `kon_levelaksi` VALUES (191,7,1),(192,7,2),(193,7,3),(194,7,4),(195,7,5),(196,7,6),(197,8,1),(198,8,2),(199,8,3),(200,8,4),(201,8,5),(202,8,6),(316,6,1),(317,6,2),(318,6,3),(319,6,4),(320,6,5),(321,6,6),(382,1,1),(383,1,2),(384,1,3),(385,1,4),(386,1,5),(387,1,6),(388,2,1),(389,2,2),(390,2,3),(391,2,4),(392,2,5),(393,2,6),(400,3,5),(401,3,6),(402,4,2),(403,4,5),(404,4,6);

#
# Structure for table "kon_login"
#

DROP TABLE IF EXISTS `kon_login`;
CREATE TABLE `kon_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `kon_login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "kon_login"
#

INSERT INTO `kon_login` VALUES (1,'Mr. ABC','admin','MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=',4,0,'1','','2015-07-24 05:27:18');

#
# Structure for table "kon_logindepartemen"
#

DROP TABLE IF EXISTS `kon_logindepartemen`;
CREATE TABLE `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  PRIMARY KEY (`id_logindepartemen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "kon_logindepartemen"
#

INSERT INTO `kon_logindepartemen` VALUES (1,1,1),(2,1,2),(3,1,3);

#
# Structure for table "kon_loginhistory"
#

DROP TABLE IF EXISTS `kon_loginhistory`;
CREATE TABLE `kon_loginhistory` (
  `id_loginhistory` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_loginhistory`),
  KEY `id_login` (`id_login`) USING BTREE,
  CONSTRAINT `kon_loginhistory_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

#
# Data for table "kon_loginhistory"
#

INSERT INTO `kon_loginhistory` VALUES (17,1,'2015-07-24 06:56:50'),(19,1,'2015-07-24 06:59:47'),(20,1,'2015-07-24 06:59:47'),(21,1,'2015-07-24 07:00:35'),(22,1,'2015-07-24 07:00:35'),(23,1,'2015-07-24 07:02:03'),(24,1,'2015-07-24 07:02:03'),(25,1,'2015-07-24 07:03:31'),(26,1,'2015-07-24 07:03:31'),(27,1,'2015-07-24 07:05:11'),(28,1,'2015-07-24 07:05:11'),(29,1,'2015-07-25 17:36:20'),(30,1,'2015-07-25 17:36:20'),(31,1,'2015-07-25 18:04:17'),(32,1,'2015-07-25 18:04:17'),(33,1,'2015-07-25 18:21:27'),(34,1,'2015-07-25 18:21:27'),(35,1,'2015-07-26 07:04:31'),(36,1,'2015-07-26 07:04:31'),(37,1,'2015-07-26 07:53:59'),(38,1,'2015-07-26 07:53:59');

#
# Structure for table "kon_menu"
#

DROP TABLE IF EXISTS `kon_menu`;
CREATE TABLE `kon_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

#
# Data for table "kon_menu"
#

INSERT INTO `kon_menu` VALUES (1,4,'Pendataan Siswa','pendataan-siswa','double',7,9,''),(2,1,'Presensi Siswa','presensi-siswa','double',44,10,''),(3,1,'Rapor Siswa','rapor-siswa','double',3,11,''),(4,1,'Pendataan Alumni','pendataan-alumni','double',4,12,''),(8,5,'Transaksi','transaksi','double',8,16,''),(9,5,'Modul Penerimaan Siswa','modul-penerimaan-siswa','double',9,17,''),(10,5,'Penerimaan Siswa','penerimaan-siswa','double',10,18,''),(12,6,'Tahun Buku','tahun-buku','',12,20,''),(13,6,'Saldo Awal','saldo-rekening','',13,13,''),(14,6,'Kategori COA','kategori-rekening','',14,14,''),(15,6,'COA','detil-rekening','',15,19,''),(16,6,'Anggaran','set-anggaran','',16,16,''),(19,7,'Warna','warna','',4,17,''),(20,8,'level','level','',5,16,''),(21,8,'user','user','',7,15,''),(22,7,'Icon','icon','',4,13,''),(24,2,'Detail Kelas','detail-kelas','double',11,15,''),(25,3,'Departemen','departemen','',3,11,''),(26,3,'Angkatan','angkatan','',11,15,''),(27,3,'Tahun Ajaran','tahun-ajaran','',16,17,''),(28,3,'Tingkat','tingkat','',12,19,''),(29,3,'Sub Tingkat','subtingkat','',14,14,''),(30,3,'Kelas','kelas','',15,13,''),(31,3,'Semester','semester','',13,12,''),(32,3,'Jenis Mutasi','jenis-mutasi','',11,10,''),(33,3,'Guru','guru','',11,14,''),(34,3,'Pelajaran','pelajaran','',12,14,''),(35,2,'Jadwal Pelajaran','jadwal-pelajaran','double',15,15,''),(36,2,'Presensi Guru','presensi-guru','double',18,12,''),(37,2,'Kegiatan Akademik','kegiatan-akademik','double',14,14,''),(38,1,'Mutasi','mutasi','double',6,13,''),(39,3,'Detail Pelajaran','detail-pelajaran','',13,15,''),(40,1,'Pendataan Siswa','pendataan-siswa','double',13,15,''),(41,9,'Set Biaya Calon Siswa','set-biaya-calon-siswa','',14,15,''),(42,9,'set Diskon','set-diskon','',14,15,''),(43,9,'set Angsuran','set-angsuran','',17,13,''),(44,9,'golongan Calon Siswa','golongan-calon-siswa','',13,16,''),(45,7,'menu','menu','',14,16,''),(46,7,'Grup Modul','grup-modul','',13,12,''),(47,7,'Modul','modul','',12,11,''),(48,7,'Grup Menu','grup-menu','',16,13,''),(52,4,'Kelompok Pendaftaran','kelompok','double',16,10,'kelompok pendaftaran  (gelombang)'),(53,4,'Penerimaan Siswa Baru','penerimaan','double',4,10,'penerimaan siswa (pendaftaran NIS dan NISN)'),(54,14,'Perangkat','perangkat','',16,10,'ok'),(55,14,'Lokasi','lokasi','',16,10,''),(56,14,'Jenis Koleksi','jenis-koleksi','',16,10,''),(57,14,'Tingkat Koleksi','tingkat-koleksi','',13,10,''),(58,14,'Klasifikasi','klasifikasi','',41,10,''),(59,14,'Daftar Pengunjung','daftar-pengunjung','',17,10,'\r\n'),(60,14,'Daftar Penerbit','daftar-penerbit','',10,10,''),(61,14,'Daftar-Bahasa','daftar-bahasa','',24,10,''),(62,14,'Satuan Mata Uang','stuan-mata-uang','',8,10,'\r\n'),(63,15,'Katalog','katalog','double',7,10,''),(64,15,'Daftar Koleksi','daftar-koleksi','double',7,20,''),(65,15,'Data Anggota','data-anggota','',13,10,''),(66,15,'Sirkulasi','sirkulasi','double',18,10,''),(67,15,'Stock Opname','stock-opname','double',47,17,''),(68,15,'OPAC','opac','double',19,12,'');

#
# Structure for table "kon_modul"
#

DROP TABLE IF EXISTS `kon_modul`;
CREATE TABLE `kon_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "kon_modul"
#

INSERT INTO `kon_modul` VALUES (1,1,'akademik','akademik',13,9,'double',''),(2,1,'psb','penerimaan siswa baru',14,10,'double',''),(3,1,'perpus','perpustakaan',3,11,'double double-vertical',''),(4,1,'sarpras','sarana dan prasarana',4,12,'double double-vertical',''),(5,2,'hrd','kepegawaian',5,13,'double double-vertical',''),(6,2,'keuangan','keuangan',6,14,'double double-vertical',''),(7,2,'student','student services',7,15,'double',''),(9,2,'konfigurasi','konfigurasi',13,14,'double','');

#
# Structure for table "kon_privillege"
#

DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

#
# Data for table "kon_privillege"
#

INSERT INTO `kon_privillege` VALUES (1,1,12),(2,1,13),(4,1,15),(5,1,16),(7,2,18),(8,1,8),(9,1,9),(10,1,10),(11,2,11),(12,1,20),(13,1,21),(14,1,19),(15,1,22),(17,1,11),(18,1,18),(19,1,23),(20,1,24),(22,1,25),(23,1,26),(24,1,27),(25,1,28),(26,1,29),(27,1,30),(28,1,31),(29,1,32),(30,1,33),(31,1,34),(32,1,35),(33,1,36),(34,1,37),(35,1,1),(36,1,2),(37,1,3),(38,1,4),(39,1,38),(40,1,39),(41,1,40),(42,1,41),(43,1,42),(44,1,43),(45,1,44),(46,1,45),(47,1,46),(48,1,47),(49,1,48),(50,1,52),(51,1,53);

#
# Structure for table "kon_warna"
#

DROP TABLE IF EXISTS `kon_warna`;
CREATE TABLE `kon_warna` (
  `id_warna` int(11) NOT NULL AUTO_INCREMENT,
  `warna` varchar(25) NOT NULL,
  PRIMARY KEY (`id_warna`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

#
# Data for table "kon_warna"
#

INSERT INTO `kon_warna` VALUES (1,'black'),(2,'white'),(3,'lime'),(4,'green'),(5,'emerald'),(6,'teal'),(7,'cyan'),(8,'cobalt'),(9,'indigo'),(10,'violet'),(11,'pink'),(12,'magenta'),(13,'crimson'),(14,'red'),(15,'orange'),(16,'amber'),(17,'yellow'),(18,'brown'),(19,'olive'),(20,'steel'),(21,'mauve'),(22,'taupe'),(23,'gray'),(24,'dark'),(25,'darker'),(26,'transparent'),(27,'darkBrown'),(28,'darkCrimson'),(29,'darkMagenta'),(30,'darkIndigo'),(31,'darkCyan'),(32,'darkCobalt'),(33,'darkTeal'),(34,'darkEmerald'),(35,'darkGreen'),(36,'darkOrange'),(37,'darkRed'),(38,'darkPink'),(39,'darkViolet'),(40,'darkBlue'),(41,'lightBlue'),(42,'lightTeal'),(43,'lightOlive'),(44,'lightOrange'),(45,'lightPink'),(46,'lightRed'),(47,'lightGreen');
