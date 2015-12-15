# Host: localhost  (Version: 5.5.27)
# Date: 2015-12-15 15:52:56
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "psb_agama"
#

DROP TABLE IF EXISTS `psb_agama`;
CREATE TABLE `psb_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "psb_agama"
#

INSERT INTO `psb_agama` VALUES (5,'Budha',5),(4,'Hindu',4),(1,'Islam',1),(3,'Katholik',3),(2,'Protestan',2);

#
# Structure for table "psb_angsuran"
#

DROP TABLE IF EXISTS `psb_angsuran`;
CREATE TABLE `psb_angsuran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cicilan` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `diskon` float(4,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`replid`,`cicilan`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#
# Data for table "psb_angsuran"
#

/*!40000 ALTER TABLE `psb_angsuran` DISABLE KEYS */;
INSERT INTO `psb_angsuran` VALUES (1,1,'in house pertama',15.00),(2,2,'in house kedua',12.00),(3,3,'in house ketiga',10.00),(4,4,'in house keempat',8.00),(5,5,'in house kelima',6.00),(6,6,'in house keenam',4.00),(7,7,'in house ketujuh',2.00),(8,8,'in house kedelapan',1.00),(9,9,'in house kesembilan',0.00),(10,10,'in house kesepuluh',0.00),(11,11,'in house kesebelas',0.00),(12,12,'in house keduabelas',0.00);
/*!40000 ALTER TABLE `psb_angsuran` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa"
#

DROP TABLE IF EXISTS `psb_calonsiswa`;
CREATE TABLE `psb_calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `noformulir` varchar(20) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `nis` varchar(100) NOT NULL DEFAULT '',
  `nisn` varchar(100) NOT NULL DEFAULT '',
  `kelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsiswa` int(10) unsigned NOT NULL DEFAULT '0',
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `sekolahasal` varchar(100) NOT NULL,
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `tingkat` int(10) unsigned NOT NULL DEFAULT '0',
  `golongan` int(10) unsigned NOT NULL DEFAULT '0',
  `suku` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `kondisi` int(10) unsigned NOT NULL DEFAULT '0',
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `photo` longtext,
  `alamat` varchar(255) DEFAULT NULL,
  `kodepos` varchar(8) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `pinbb` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(300) DEFAULT NULL,
  `ketkesehatan` varchar(300) NOT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `diterimadikelas` varchar(25) DEFAULT NULL,
  `ijazah` varchar(55) DEFAULT NULL,
  `keterangan` text,
  `discsubsidi` decimal(10,0) DEFAULT '0',
  `discsaudara` decimal(10,0) DEFAULT '0',
  `disctunai` decimal(10,0) DEFAULT '0',
  `setbiaya` int(10) NOT NULL DEFAULT '0',
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `namabank` varchar(50) NOT NULL DEFAULT '',
  `rekening` varchar(50) NOT NULL DEFAULT '',
  `grup` int(10) unsigned NOT NULL DEFAULT '0',
  `angsuran` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`kelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

#
# Data for table "psb_calonsiswa"
#

INSERT INTO `psb_calonsiswa` VALUES (33,'000009',NULL,'Aaron William Soemarno','881501003','',0,0,NULL,1,0,'',1,1,3,0,3,1,0,'L','Surabaya','2014-02-17',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Asri AF-2,surabaya',NULL,'0317480970,085100711',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(34,'000010',NULL,'Kaylee Weng Okawida','881501005','',0,0,NULL,1,0,'',1,1,3,0,5,1,0,'L','Surabaya','2013-11-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Kutisari Indah Barat III/74 Surabaya',NULL,'08175089468,08383032',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(35,'000011',NULL,'William Juvandy Yulieanto','881501001','',0,0,NULL,1,0,'',1,1,3,0,5,1,0,'L','Surabaya','2014-03-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Raya Menganti Wiyung No.10',NULL,'081944214785',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(36,'000012',NULL,'Carly Rei Chen','881501002','',0,0,NULL,1,0,'',1,1,3,0,3,1,0,'P','Surabaya','2013-12-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Dukuh Kupang XI/9-11',NULL,'08156029002',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(37,'000013',NULL,'Adjie Reksa Nugroho','881502017','',0,0,NULL,1,0,'',1,2,3,0,1,1,0,'L','Surabaya','2013-02-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Ikan Mungsing 8 No 9',NULL,'0313535285,081654343',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(38,'000014',NULL,'Aldrin Reynard Herdianto','881502015','',0,0,NULL,1,0,'',1,2,3,0,5,1,0,'L','Surabaya','2013-07-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'South Emerald Mansion ',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(39,'000015',NULL,'William Halim ','881502012','',0,0,NULL,1,0,'',1,2,3,0,3,1,0,'L','Surabaya','2013-06-13',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat XII/XI',NULL,'0317329775,081654059',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(40,'000016',NULL,'Janice Zhuang','881502011','',0,0,NULL,1,0,'',1,2,3,0,0,1,0,'P','Surabaya','2013-01-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Perum Graha Family A/35',NULL,'082139226000',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(41,'000017',NULL,'Axel Oesjady','881502014','',0,0,NULL,1,0,'',1,2,3,0,5,1,0,'L','Surabaya','2013-09-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Palma H11/28 Surabaya',NULL,'08113360539,08123019',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(42,'000018',NULL,'Archie Oesjady','881502013','',0,0,NULL,1,0,'',1,2,3,0,5,1,0,'L','Surabaya','2013-09-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Palma H11/28 Surabaya',NULL,'08113360539,08123019',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(43,'000019',NULL,'Eugene Sinclair Sutanto','881502010','',0,0,NULL,1,0,'',1,2,3,0,3,1,0,'L','Surabaya','2013-09-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan 8 No 39',NULL,'0317348171,081333511',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(44,'000020',NULL,'George Maverick candra','881502008','',0,0,NULL,1,0,'',1,2,3,0,5,1,0,'L','surabaya','2013-05-31',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Chofa,Alamanda RF 2',NULL,'0317326026,085730908',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(45,'000021',NULL,'Lindsay Auryn Gunawan ','881502009','',0,0,NULL,1,0,'',1,2,3,0,3,1,0,'P','surabaya','2013-02-27',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Royal Residence B2-125',NULL,'0818528696',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(46,'000022',NULL,'Jessica Aurellia Wibowo','881301006','',0,0,NULL,1,0,'',1,2,3,0,5,1,0,'P','surabaya','2012-12-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Sulung 4/2,surabaya',NULL,'087853818718',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(47,'000023',NULL,'Maxon Dhammika Cahyadi','881301007','',0,0,NULL,1,0,'',1,2,3,0,5,1,0,'L','surabaya','2012-12-28',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Manyar Jaya Praja IV D96',NULL,'0811547033',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(48,'000024',NULL,'Cordelia Sucarita Wang','881502006','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-04-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Darmo Baru Barat 10/17 Surabaya',NULL,'0317314875,083849694',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(49,'000025',NULL,'Vanisha Aiko Delphine Lesmana','881502005','',0,0,NULL,1,0,'',1,5,3,0,2,1,0,'P','surabaya','2012-05-04',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Blauran 5/42',NULL,'08123233019',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(50,'000026',NULL,'Matthew Hasan Soetomo','881402015','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2012-08-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan V/57',NULL,'0317346247,081230453',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(51,'000027',NULL,'Mia Lila Chua','881301003','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-05-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Teuku Umar 37,surabaya',NULL,'0315671868,085815238',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(52,'000028',NULL,'Royce Rubio Arthawijaya','881301005','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2012-09-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Kunir 6,surabaya',NULL,'0313531570,081132218',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(53,'000029',NULL,'Caitlin Alicia Sudarmo','881502004','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-01-05',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Babatan Pratama XVI/SS-99,surabaya',NULL,'0317526024,085851442',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(54,'000030',NULL,'Megan huang wijaya','881502001','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-08-28',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri sentra raya PS1/47,Citraland',NULL,'081252279997,0811308',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(56,'000032',NULL,'Natasha Fung Wei Ling','881502003','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2012-03-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Timur 7/8,surabaya',NULL,'0317315242,082142900',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(57,'000033',NULL,'Jane Kioko Siswanto','881502002','',0,0,NULL,1,0,'',1,5,3,0,2,1,0,'P','surabaya','2012-08-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Sono Indah I/19',NULL,'0317389688,081131915',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(58,'000034',NULL,'Nicholas Jayden Zein','181402020','',0,0,NULL,1,0,'',1,5,3,0,3,1,0,'L','surabaya','2011-12-21',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Babatan Pantai VII/24,Surabaya',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(59,'000035',NULL,'Seraphine Hartanto','181402019','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-08-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Eastwood EW 9/7 Citraland,Surabaya',NULL,'05240008298',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(60,'000036',NULL,'Kayleen Alexandra Tjahyono','181402018','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-02-02',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kupang Indah XXI/28',NULL,'082230010168,0812318',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(61,'000037',NULL,'Michelle Kaylee Hong','881402017','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-02-29',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Palma H9/29',NULL,'085852385898',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(62,'000038',NULL,'Kellynn Valerie Salim','881402016','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-07-06',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Darmo Permai Selatan 18 No.8,surabaya',NULL,'0317315668,081260769',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(63,'000039',NULL,'Nediva Ophelia Tantica','881402014','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-07-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan Indah TT-10',NULL,'0317313761,082231338',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(64,'000040',NULL,'Sannivia Gesang','881402013','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2012-02-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat IX/10',NULL,'0317325286,085852009',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(65,'000041',NULL,'Carlyn Chen','881402012','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-10-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Valensia Blok CA5 No.6 Surabaya',NULL,'03151160516,08118358',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(66,'000042',NULL,'Mikhail Ryu Tan Wiyono','881402010','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2012-07-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Perum.Ready Indah Raya,Lilium barat 15,Krian-Sidoarjo',NULL,'081330500099',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(67,'000043',NULL,'Evan Alvaro Robinson','881402011','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2012-01-30',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat 7/45',NULL,'087851309215',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(68,'000044',NULL,'Clayton Putra Wibowo','881402007','',0,0,NULL,1,0,'',1,5,3,0,3,1,0,'L','surabaya','2012-01-03',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Wonocolo 4 No 43 Ketegan 35A,Sepanjang-Sidoarjo',NULL,'0317882737,081651212',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(69,'000045',NULL,'Winston Wibowo Ongko','881301006','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2012-04-18',NULL,0,0,NULL,0.0,0.0,'-',NULL,'The Adhiwangsa suite C31,BDG',NULL,'081332268888',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(70,'000046',NULL,'Devan Dharma Dwiadmodjo','881402006','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2011-11-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Apt.Puri Matahari No.502 jl. HR Muhammad 181',NULL,'0317345312,081553033',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(71,'000047',NULL,'Edmund Magnus T','881402008','',0,0,NULL,1,0,'',1,5,3,0,3,1,0,'L','surabaya','2012-03-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Palma DI No.18,Surabaya',NULL,'081553373780',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(72,'000048',NULL,'Sophie Eloise Husein','881301001','',0,0,NULL,1,0,'',1,5,3,0,2,1,0,'P','surabaya','2012-07-06',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan II/EF 29',NULL,'0317317039,085815511',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(73,'000049',NULL,'Jevon Ethan Tin','881301002','',0,0,NULL,1,0,'',1,5,3,0,2,1,0,'L','surabaya','2012-03-15',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Stamford BTG TE 5/14,Citraland',NULL,'08175175117',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(74,'000050',NULL,'Alfred Chandra Gunawan','881301004','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','surabaya','2011-12-23',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat VIII/27',NULL,'081216460382',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(75,'000051',NULL,'Aleena Mudita Pohan','881402009','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'P','surabaya','2012-04-01',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Wisata Bukit Mas Blok C1-26',NULL,'0317534741,082184484',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(76,'000052',NULL,'Scarlett Eugene Wijaya','881503004','',0,0,NULL,1,0,'',1,3,3,0,2,1,0,'P','Surabaya','2011-05-12',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Petemon II/20',NULL,'083830694704',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(77,'000053',NULL,'Clareta Hedia Tanuwijaya','881503001','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'P','surabaya','2011-07-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Hill Blok K No.3',NULL,'0315673789,082337756',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(78,'000054',NULL,'Clarinda Hedia Tanuwijaya','881503002','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'P','surabaya','2011-07-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Hill Blok K No.3',NULL,'0315673789,082337756',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(79,'000055',NULL,'Felicia Sachiko Kwee','881502003','',0,0,NULL,1,0,'',1,3,3,0,0,1,0,'P','surabaya','2011-04-15',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Wonocolo No.101 Sepanjang',NULL,'081332313999',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(80,'000056',NULL,'Kenzie Kalyana Chandra','881402005','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'L','surabaya','2011-07-21',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Taman Famili Selatan IV/KAV B-51',NULL,'0317329443,081652887',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(81,'000057',NULL,'Winston Huang','881402001','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'L','surabaya','2011-09-21',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan XI/56',NULL,'08121769951,08135706',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(82,'000058',NULL,'Michael Sugiarso','881402004','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'L','surabaya','2015-04-27',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Sukomanunggal Jaya XI/XL 24',NULL,'0811333960',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(83,'000059',NULL,'Arleen Warner Ongkojoyo','881402003','',0,0,NULL,1,0,'',1,3,3,0,3,1,0,'P','surabaya','2011-08-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Tanjungsari Baru VI/FF12A',NULL,'0317318626,082231017',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(84,'000060',NULL,'Fiona Joaquin Agatha','881402002','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'P','Singaraja','2011-05-18',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Lesti No.45, Surabaya',NULL,'085737678777,0315687',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(85,'000061',NULL,'Michellepwa Leticia Tuhuteru','881302004','',0,0,NULL,1,0,'',1,3,3,0,3,1,0,'P','Surabaya','2011-10-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kedung Anyar Kuburan Np.10',NULL,'08155024123',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(86,'000062',NULL,'Michelle Grace Valerie','881302004','',0,0,NULL,1,0,'',1,3,3,0,2,1,0,'P','Surabaya','2011-10-17',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Sentra Raya A4/22',NULL,'0317401190,082141784',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(87,'000063',NULL,'Lionell Stewart Candra','881302005','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'L','Surabaya','2011-08-20',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Taman Hunian Satelit I, Saturnus GS 22',NULL,'085730908989',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(88,'000064',NULL,'Aileena Keiyn Sengkey','881302003','',0,0,NULL,1,0,'',1,3,3,0,2,1,0,'P','Surabaya','2011-05-20',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Apt. Waterplace C 18A08',NULL,'08155262228',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(89,'000065',NULL,'Jason Akira Lee','881302002','',0,0,NULL,1,0,'',1,3,3,0,2,1,0,'L','Surabaya','2011-07-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan XI/3B',NULL,'0317314537,081332204',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(90,'000066',NULL,'Marcell Fredson Kuncoro','881201001','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'L','Surabaya','2011-07-08',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Telaga Golf TE 4/16',NULL,'085265222649',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(91,'000067',NULL,'Jaysen Leiv Aripuja','881201003','',0,0,NULL,1,0,'',1,3,3,0,3,1,0,'L','Surabaya','2011-08-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan 3 No.22',NULL,'0317320709,081334242',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(92,'000068',NULL,'Putranto Liekitasvara','881201002','',0,0,NULL,1,0,'',1,3,3,0,5,1,0,'L','Surabaya','2011-02-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Lidah Kulon Indah Blok M/8',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,9,0,'','',0,1),(93,'000069',NULL,'Sarah Aurelia Christian','881503002','',0,0,NULL,1,0,'',1,6,3,0,3,1,0,'P','Surabaya','2010-11-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Taman Gapura E4/14,Citraland',NULL,'08155200701,08155200',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(94,'000070',NULL,'Justin Howard Limanto','881503001','',0,0,NULL,1,0,'',1,6,3,0,3,1,0,'L','Surabaya','2010-05-02',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Graha Famili YY-33',NULL,'0317329770,081230080',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(96,'000071',NULL,'Latisa Kaeneshia','881403002','',0,0,NULL,1,0,'',1,6,3,0,2,1,0,'P','Surabaya','2009-12-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Simpang Darmo Permai Selatan III No.32',NULL,'0317318825',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(97,'000072',NULL,'Chellyn Viona Hartanto','881302001','',0,0,NULL,1,0,'',1,6,3,0,3,1,0,'P','Surabaya','2010-08-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Dian Istana F3-89',NULL,'083830031678',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(98,'000073',NULL,'Andhika Mahaputra Wibowo','881202011','',0,0,NULL,1,0,'',1,6,3,0,3,1,0,'L','Surabaya','2010-06-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Timur G-55',NULL,'0317311069,081231276',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(99,'000074',NULL,'Nikita Gunawan','881101005','',0,0,NULL,1,0,'',1,6,3,0,2,1,0,'P','Surabaya','2010-11-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Darmo Golf Regency C-8',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(100,'000075',NULL,'Jessica Halim','881202009','',0,0,NULL,1,0,'',1,6,3,0,5,1,0,'P','Surabaya','2010-10-18',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan Indah III Blok XX No.16,Surabaya',NULL,'0317316109,081230972',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(101,'000076',NULL,'Griselda Cordelia Tanesha','881101004','',0,0,NULL,1,0,'',1,6,3,0,5,1,0,'P','Surabaya','2010-01-16',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Manukan Dalam Blok 18F/17',NULL,'0317405376,081231536',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(102,'000077',NULL,'Claire Susanto','','',0,0,NULL,1,0,'',4,6,3,0,3,0,0,'P','Surabaya','2010-02-05',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Valensia PA 5/51',NULL,'0818508617',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(103,'000078',NULL,'William Theodore Rudikan','881202006','',0,0,NULL,1,0,'',1,6,3,0,5,1,0,'L','Surabaya','2010-07-20',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan I/67',NULL,'08165413101,03173443',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(104,'000079',NULL,'Alvin Pratama','881202012','',0,0,NULL,1,0,'',1,6,3,0,1,1,0,'L','Surabaya','2010-09-14',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Putat Gede Timur IV/46',NULL,'081330994950',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(105,'000080',NULL,'Nicholas Jaden Husein','881101002','',0,0,NULL,1,0,'',1,6,3,0,2,1,0,'L','Surabaya','2010-09-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan IIEF/29',NULL,'0317317039,081230179',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(106,'000081',NULL,'Justine Javier Yulieanto','881101003','',0,0,NULL,1,0,'',1,6,3,0,5,1,0,'L','Surabaya','2010-05-18',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Raya Candi Lontar 22A/15',NULL,'081944214785',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(107,'000082',NULL,'Raoul Davidson','881202007','',0,0,NULL,1,0,'',1,6,3,0,3,1,0,'L','Jakarta','2009-12-30',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Graha Famili BB-31',NULL,'087851206999',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(108,'000083',NULL,'Leonard Tan Wiyono','881202005','',0,0,NULL,1,0,'',1,6,3,0,5,1,0,'L','Sidoarjo','2010-05-05',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Raya Lilium Barat15,Kraton Residence Krian',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(109,'000084',NULL,'Eowyn Mikhaya Tjiumena','881202008','',0,0,NULL,1,0,'',1,6,3,0,2,1,0,'P','Surabaya','2009-11-16',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Palma D1-18',NULL,'08155131714',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(110,'000085',NULL,'Aurellia Prasetyo','881101001','',0,0,NULL,1,0,'',1,6,3,0,5,1,0,'P','Surabaya','2011-02-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan ED-4',NULL,'08123090188',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(111,'000086',NULL,'Claire Susanto','881202010','',0,0,NULL,1,0,'',1,6,3,0,3,1,0,'P','Surabaya','2010-02-05',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Valensia PA 5/51',NULL,'0818508617',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(112,'000087',NULL,'Megan Davis Zheng','881504001','0097501755',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2009-09-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Seruni 24,Surabaya',NULL,'0315340522,081330900',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(113,'000088',NULL,'Keane Jo Wienardi','881403002','0099977814',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'L','Surabaya','2009-06-28',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Muria No.25',NULL,'08179333829',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(114,'000089',NULL,'Richardpwa louis Tuhuteru','881403001','0099744824',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'L','Surabaya','2009-11-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kedung Anyar Kuburan No.10',NULL,'08155024123',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(115,'000090',NULL,'Mikka Amadea Lee','881102006','0094354700',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2009-06-17',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan XI/3B',NULL,'081332204745',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(116,'000091',NULL,'Richie Tanudihardjo','881303005','0081852777',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2008-08-20',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kaliwaron No 128A',NULL,'087852362999',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(117,'000092',NULL,'Sachi Alexandra','881202001','0092795964',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2009-06-12',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Citraland,Golf Avenue GV 6/28',NULL,'085881015838',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(118,'000093',NULL,'Vincent Alexander','881102008','0097604036',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2009-05-30',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Barat IV/A-2',NULL,'08123135650',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(119,'000094',NULL,'Jethro Mustaine Geronimo Purwanto','881202002','0095288931',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'L','Surabaya','2009-09-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Alam Hijau F2-23 Citraland',NULL,'08123591974',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(120,'000095',NULL,'Eugene Halim','881202004','0099174425',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2009-06-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Valensia PA 10/2',NULL,'081217813444',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(121,'000096',NULL,'Reyhan Dharma Dwiadmodjo','881102007','0093754464',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'L','Surabaya','2009-09-01',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Matahari No.502',NULL,'081553033485',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(122,'000097',NULL,'Lunabelle Veloxia Taslim','881102005','0099229408',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'P','Surabaya','2009-04-30',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Taman Darmo Baru No.3',NULL,'081331685888',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(123,'000098',NULL,'Jordyn Edward Motanto','881001001','0092508111',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2009-06-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Simpang Darmo Permai Selatan XI/73',NULL,'0818307043',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(124,'000099',NULL,'Justin Ong','881102004','0097551938',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2009-01-14',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Satelit Timur 2/JJ-26',NULL,'08123256838',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(125,'000100',NULL,'Darren Evan Tin','881001002','0091799800',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'L','Surabaya','2009-10-23',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Simpang Darmo Permai Selatan X/7',NULL,'08175175117',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(126,'000101',NULL,'Ryu Adhikumara Chandra','881202003','0096324516',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2009-11-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Valensia PA16/16',NULL,'081330340971',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(127,'000102',NULL,'Purnama Adhi Wijaya','881202003','0092221028',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Sidoarjo','2009-03-11',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Sambikerep No.80',NULL,'085230718699',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(128,'000103',NULL,'Wyanetta Windiora Widjaja','881304004','0085138174',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2008-12-05',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Widya Kencana K5/25,Citraland',NULL,'081553512345',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(129,'000104',NULL,'Claire Davis Zheng','881304001','0089793616',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2008-03-04',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Seruni 24',NULL,'081330900123',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(130,'000105',NULL,'Darren Alexander Tjahyono','881304002','0088487346',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2008-06-18',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kupang Indah XXI/28',NULL,'085733787892',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(131,'000106',NULL,'Gracelynn Valerie Salim','881304003','0089649637',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2008-12-09',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan 18/8',NULL,'08126076989',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(132,'000107',NULL,'Celine Cahyadi','881303004','0085420133',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2008-02-21',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Woodland WL 8/6',NULL,'085708571680',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(133,'000108',NULL,'Chloe Aurelia Tjan','881002011','0082358574',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'P','Surabaya','2008-10-01',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan No.23',NULL,'08179178899',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(134,'000109',NULL,'Francis Hendry Nathanael','881203002','0088057310',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'P','Surabaya','2008-05-08',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat',NULL,'08113568889',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(135,'000110',NULL,'Juliette Anthoni','881303003','0082645145',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2008-10-04',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Graha Family P-115',NULL,'081615000911',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(136,'000111',NULL,'Hilton Felix Hartanto','881002011','0086809752',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2008-10-18',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Addington C1-162,Royal Residence',NULL,'081216212168',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(137,'000112',NULL,'Austine Keith Setyawan','881002010','0088639773',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2008-08-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat III/33',NULL,'08155200300',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(138,'000113',NULL,'Allyzione Halim','881102002','0086846802',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2008-03-03',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Royal Park TL 2/24,Citraland',NULL,'0818500886',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(139,'000114',NULL,'Angelicia Julianne Hartanto','881002001','0084164763',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2008-07-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Dian Istana F3/89',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(140,'000115',NULL,'Draven Hartanto','881203001','0088247837',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2008-10-06',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Eastwood EW 9/7,Citraland',NULL,'085240008298',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(141,'000116',NULL,'Aileen Kwee','880901001','0083365882',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2008-08-08',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Utara XI/G1',NULL,'08123576450',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(142,'000117',NULL,'Eryn Shelivia T','881003002','0085280981',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2008-03-27',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Taman Darmo Permai Utara III/4',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(143,'000118',NULL,'Vince Hugo Alexis','881002012','0089862207',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2008-03-16',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Bukit Permai No.68,Bulu Jaya',NULL,'08155093889',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(144,'000119',NULL,'Felicia Hanna Thea','881102003','0085445167',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2008-08-28',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Utara 7/16',NULL,'08563003381',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(145,'000120',NULL,'Faustina Leonita','881102001','0089668774',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Tangerang','2008-06-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Perum Citra Sentosa Blok D-9',NULL,'08175161980',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(146,'000121',NULL,'Anasthasia Agatha Sunarta','880902007','0074838171',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2007-05-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kutisari Indah Selatan 2/9',NULL,'08123020867',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(147,'000122',NULL,'Arvind Dharma Dwiadmodjo','881002006','0071140471',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2007-05-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Matahari No.502',NULL,'081553033485',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(148,'000123',NULL,'Arvin Renardi','880902008','0078321653',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'L','Surabaya','2007-05-11',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat X/18',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(149,'000124',NULL,'Chloe Lindsay Wibowo','881002004','0074138431',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2007-09-13',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Ketegan 35A,Sepanjang',NULL,'0816512129',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(150,'000125',NULL,'Darrel Karuna Andoyo','880801003','0067776619',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2006-12-02',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Bukit Regency I/PC 2-9,Pakuwon Indah',NULL,'0811333492',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(151,'000126',NULL,'Felicia Gavriel','881002010','0072880238',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2007-09-12',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Sukomanunggal Jaya 2/34',NULL,'085850877778',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(152,'000127',NULL,'Ferdinand Cahyadi','881103001','0079517090',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2007-01-30',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Woodland WL 8/6,Citraland',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(153,'000128',NULL,'Jeane Prajna Paramita Ong','880902005','0074643071',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2007-06-11',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Gunung sari Indah K-9,surabaya',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(154,'000129',NULL,'Jocelyn Huang Wijaya','881002011','0066700105',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2006-12-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Sentra Raya PS1/47,Citraland Surabaya',NULL,'0811308948',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(155,'000130',NULL,'Jesslyn Aurelia Rudikan','881002003','0076925004',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2007-09-12',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan I/67',NULL,'08165413101',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(156,'000131',NULL,'Kevan Cornelius Tjan','881103002','0073266981',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2007-08-23',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Selatan No.23',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(157,'000132',NULL,'Maitri Liekitasvara','881002002','0073168872',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2007-04-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Lidah Kulon Indah Blok M/8',NULL,'08885321986',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(158,'000133',NULL,'Michael Fredson Kuncoro','880801002','0073290131',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'L','Malang','2007-01-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Pakuwon Villa Bukit Indah AAL-64',NULL,'085265222649',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(159,'000134',NULL,'Michelle Isabelle Kuncoro','880801001','0071988129',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Malang','2007-01-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Pakuwon Villa BUkit Indah AAL-64',NULL,'085265222649',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(160,'000135',NULL,'Peter Elbert Eistein','881002007','0079210176',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2007-03-16',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Bukit Permai kav.68,Surabaya',NULL,'08155093889',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(161,'000136',NULL,'Reyna Alexandra','881002009','0079707186',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2007-09-11',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Barat IV/A-2,Surabaya',NULL,'08123135650',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(162,'000137',NULL,'Tiffany Claribel Hillary Lesmana','881002008','0078996913',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'P','Surabaya','2007-07-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Asri AD-18',NULL,'08123233019',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(163,'000138',NULL,'Violine Ong','880902006','0078143053',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2007-03-14',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Satelit Timur 2/JJ-26',NULL,'08123256838',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(164,'000139',NULL,'Felicia Aurelia Tanudihardjo','880902001','0067796236',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2006-06-15',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kaliwaron No 128 A',NULL,'087852362999',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(165,'000140',NULL,'Audriana Halim','880902004','0067875439',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2006-09-03',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Royal Park TL 2/24,Citraland',NULL,'0818500886',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(166,'000141',NULL,'Arya Ananda Wangsanegara','880702007','0065177653',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2006-10-21',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan Utara VI/EX-12',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(167,'000142',NULL,'Rayner Nicholous Tan','880902003','0069799784',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2006-09-01',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Taman Telaga II TJ 10/7 Surabaya',NULL,'08123028007',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(168,'000143',NULL,'Jocelyn Revata Santoso','880702006','0066227620',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2006-01-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'jl.Tanjungsari Baru VI/FF-17',NULL,'085648181000',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(169,'000144',NULL,'Rachelle Wibowo Ongko','880701001','0062271748',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2006-03-03',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl Gading Pantai V/1',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(170,'000145',NULL,'Tiffany Jocelyn Irwan','880902002','0069319958',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2006-06-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Raffles Garden TB IV No. 2',NULL,'081331047678',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(171,'000146',NULL,'Wilviana Windeva Widjaja','881002001','0064568585',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2006-01-30',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Widya Kencana K5/25,Citraland',NULL,'081553512345',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(172,'000147',NULL,'Velia Martamulia','880702001','0057588530',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2005-05-26',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan ED4,Surabaya',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(173,'000148',NULL,'Owen Huang Wijaya','880903001','0056900569',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2005-02-05',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Sentra Raya PS1/47,Citraland',NULL,'0811308948',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(174,'000149',NULL,'Arganta','880702005','0058563968',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2005-08-01',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat X/18',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(175,'000150',NULL,'Charlize Fiona Irwan','880802002','0057536892',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2005-05-14',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Raffles Garden TB IV/2',NULL,'081331047678',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(176,'000151',NULL,'Devi Prajna Paramita Ong','880601002','0056779796',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2005-02-20',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Gunung Sari Indah K9',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(177,'000152',NULL,'Evelyn Lianto','880702004','0055863705',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2005-06-12',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Baru Barat I/6',NULL,'08165411116',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(178,'000153',NULL,'Leonard Sariputra Wangsanegara','880702003','0051329368',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2005-06-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan Utara G EX/12',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(179,'000154',NULL,'Nicole Andrea Husein ','880702002','0054072585',0,0,NULL,1,0,'',1,4,3,0,2,1,0,'P','Surabaya','2005-12-16',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Timur II/18',NULL,'08123046045',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(180,'000155',NULL,'Felicia Ong','880601001','0053823934',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2005-03-23',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Satelit Timur 2/JJ-26',NULL,'08123256838',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(181,'000156',NULL,'Patricia Angelicia Tanudihardjo','880802001','0059656729',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2005-01-29',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kaliwaron No.128A',NULL,'0818512800',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(182,'000157',NULL,'Ashley Karina Andoyo','880501001','0045339901',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2004-09-29',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Bukit Regency I/PC2-9,Pakuwon Indah',NULL,'0811333492',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(183,'000158',NULL,'Catherine Alexandra Husein','880602002','0049559570',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2004-05-02',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Timur II/18',NULL,'08123046045',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(184,'000159',NULL,'Michelle Wibowo Ongko','880602002','0048431903',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2004-05-18',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl.Gading Pantai V/1',NULL,'081332268888',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(185,'000160',NULL,'Vania Martamulia','880602003','0048871799',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2004-05-25',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Harapan ED-4',NULL,'08123521699',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(186,'000161',NULL,'Richie Markus Liadi','880804002','0029408817',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Jember','2003-12-20',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Selatan EE26',NULL,'085102480030',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(187,'000162',NULL,'Juan Ryan Zen Antonio','881505001','2',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Surabaya','2002-04-11',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Taman Pondok Indah XV Blok JJ-18',NULL,'0818371066',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(188,'000163',NULL,'Kenzie Andrew','881304001','0024231453',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Jakarta','2002-09-03',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Golf Avenue,Blok GV 6/28',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(189,'000164',NULL,'Maria Imaculata Louisa Sunarta','880703001','0037349654',0,0,NULL,1,0,'',1,4,3,0,3,1,0,'P','Surabaya','2003-06-01',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Kutisari Indah Selatan 2/9 Surabaya',NULL,'08123020867',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(190,'000165',NULL,'Delicia Chrystalyn','880904001','0039715587',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2003-11-05',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Taman International I B3-21,Citraland',NULL,'08123028007',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(191,'000166',NULL,'Rio ferdinand Felix Liadi','880804002','0029408817',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'L','Jember','2002-08-08',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Indah Selatan EE26',NULL,'0818518468',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(192,'000167',NULL,'Cherrie Wang','880804001','1',0,0,NULL,1,0,'',1,4,3,0,5,1,0,'P','Surabaya','2002-10-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Pakuwon Villa Bukit Regency 2PD9 No 54',NULL,'',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,12,0,'','',0,1),(193,'000168',NULL,'Charlotte Moraya Irawan','881502018','',0,0,NULL,1,0,'',1,2,3,0,5,1,0,'P','Surabaya','2012-11-29',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Bukit Darmo Golf I/75',NULL,'081232351872',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(194,'000169',NULL,'Reiji Setiobudi','881501007','',0,0,NULL,1,0,'',1,1,3,0,5,1,0,'L','Surabaya','2014-02-02',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Dian Istana C4 No 1',NULL,'087852390985',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(195,'000170',NULL,'Noah Putra Millar','881501004','',0,0,NULL,1,0,'',1,1,1,0,0,1,0,'L','Australia','2014-05-07',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Perumahan Babatan Indah Blok B8/19 Surabaya',NULL,'08113534627',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,1,0,'','',0,1),(196,'000171',NULL,'Marcio Widjaja','881501006','',0,0,NULL,1,0,'',1,1,3,0,5,1,0,'L','Surabaya','2013-12-19',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Puri Sentra Raya PS1/32',NULL,'081320500388',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,3,0,'','',0,1),(197,'000172',NULL,'Mikhael Oliver Harsono','881502016','',0,0,NULL,1,0,'',1,2,3,0,3,1,0,'P','Surabaya','2013-08-20',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Darmo Permai Timur V No.12A Surabaya',NULL,'085730108572',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,6,0,'','',0,1),(198,'000173',NULL,'Richard Alvino','181502007','',0,0,NULL,1,0,'Margie School',1,5,3,0,5,1,0,'L','Surabaya','2012-08-22',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Jl. Kupang baru 1/115',NULL,'087853963092',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1),(199,'000174',NULL,'Reizo Edmund Yong ( Evan )','881502008','',0,0,NULL,1,0,'',1,5,3,0,5,1,0,'L','Surabaya','2012-04-10',NULL,0,0,NULL,0.0,0.0,'-',NULL,'Villa Valensia PA 1/32',NULL,'082331255870',NULL,NULL,'','',NULL,NULL,NULL,NULL,0,0,0,0,0,'','',0,1);

#
# Structure for table "psb_calonsiswa_ayah"
#

DROP TABLE IF EXISTS `psb_calonsiswa_ayah`;
CREATE TABLE `psb_calonsiswa_ayah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_ayah"
#

/*!40000 ALTER TABLE `psb_calonsiswa_ayah` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_ayah` VALUES (24,25,'','','0000-00-00',0,'','','',0,'','',''),(25,26,'','','0000-00-00',0,'','','',0,'','',''),(26,27,'','','0000-00-00',0,'','','',0,'','',''),(27,28,'Huinto Tin','','0000-00-00',0,'','','',0,'081 75175117','',''),(28,29,'David Teguh Budainto','','0000-00-00',0,'','','',0,'0315340522','',''),(29,30,'Irwanto','','0000-00-00',0,'','','',0,'031. 7318473','',''),(30,31,'Rendy Motanto','','0000-00-00',0,'','','',0,'031. 77556589','',''),(31,32,'Triady Taslim','','0000-00-00',0,'','','',0,'031. 77120122','',''),(32,33,'Romy Janto Soemarno','','0000-00-00',0,'Indonesia','','swasta',0,'','73ec9792',''),(33,34,'Ifan Okawida','','0000-00-00',0,'','','',0,'','',''),(34,35,'Zendy Yulieanto','','0000-00-00',0,'','','',0,'','',''),(35,36,'Andy Prayitno','','0000-00-00',0,'','','',0,'','',''),(36,37,'Prapto Nugroho','','0000-00-00',0,'','','',0,'','',''),(37,38,'Adi Surya Herdianto','','0000-00-00',0,'','','',0,'','',''),(38,39,'Richy Setyabudi','','0000-00-00',0,'','','',0,'','',''),(39,40,'Yohan Tjendra','','0000-00-00',0,'','','',0,'','',''),(40,41,'Echy Oesjady','','0000-00-00',0,'','','',0,'','',''),(41,42,'Echy Oesjady','','0000-00-00',0,'','','',0,'','',''),(42,43,'David Sugianto Sutanto','','0000-00-00',0,'','','',0,'','',''),(43,44,'Hengky candra','','0000-00-00',0,'','','',0,'','',''),(44,45,'Yohan Gunawan','','0000-00-00',0,'','','',0,'','',''),(45,46,'Wibowo Sundoro','','0000-00-00',0,'','','',0,'','',''),(46,47,'Jefri Gunawan','','0000-00-00',0,'','','',0,'','',''),(47,48,'Chitrahadi Sudirman','','0000-00-00',0,'','','',0,'','',''),(48,49,'Lucky Lesmana','','0000-00-00',0,'','','',0,'','',''),(49,50,'Marcus','','0000-00-00',0,'','','',0,'','','');
/*!40000 ALTER TABLE `psb_calonsiswa_ayah` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_ibu"
#

DROP TABLE IF EXISTS `psb_calonsiswa_ibu`;
CREATE TABLE `psb_calonsiswa_ibu` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `warga` varchar(50) NOT NULL,
  `pendidikan` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `penghasilan` decimal(10,0) NOT NULL DEFAULT '0',
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_ibu"
#

/*!40000 ALTER TABLE `psb_calonsiswa_ibu` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_ibu` VALUES (24,25,'','','2015-07-02',0,'','','',0,'','',''),(25,26,'','','0000-00-00',0,'','','',0,'','',''),(26,27,'','','0000-00-00',0,'','','',0,'','',''),(27,28,'Helen Novalisa Ukorawung','','0000-00-00',0,'','','',0,'03170129088','',''),(28,29,'Stephanie','','0000-00-00',0,'','','',0,'03131250123','',''),(29,30,'Lince R Wijaya','','0000-00-00',0,'','','',0,'031. 7318473','',''),(30,31,'Silvia Kuncoro','','0000-00-00',0,'','','',0,'','',''),(31,32,'Mia Hapsari','','0000-00-00',0,'','','',0,'031. 70218682','',''),(32,33,'Vivi Pratiwi','','0000-00-00',0,'Indonesia','','',0,'','','renatavivipratiwi@gmail.com'),(33,34,'Selvi Januarini Wibhawa','','0000-00-00',0,'','','',0,'','','okawida_14@yahoo.com'),(34,35,'Vince Pongawa','','0000-00-00',0,'','','',0,'','',''),(35,36,'Yoren Viryamarchyo','','0000-00-00',0,'','','',0,'','',''),(36,37,'Romana Thensy Sheilla Dewi','','0000-00-00',0,'','','',0,'','',''),(37,38,'Silvia Irene','','0000-00-00',0,'','','',0,'','',''),(38,39,'Silvia','','0000-00-00',0,'','','',0,'','',''),(39,40,'Ayu Trisnawaty','','0000-00-00',0,'','','',0,'','',''),(40,41,'Winda Anggraini Lukito','','0000-00-00',0,'','','',0,'','',''),(41,42,'Winda Anggraini Lukito','','0000-00-00',0,'','','',0,'','',''),(42,43,'Veronica Basuki','','0000-00-00',0,'','','',0,'','',''),(43,44,'Emilia Amsal','','0000-00-00',0,'','','',0,'','',''),(44,45,'Olivia Sulistio','','0000-00-00',0,'','','',0,'','',''),(45,46,'Linda Setiawati','','0000-00-00',0,'','','',0,'','',''),(46,47,'Linda','','0000-00-00',0,'','','',0,'','',''),(47,48,'Meliana Kusuma','','0000-00-00',0,'','','',0,'','',''),(48,49,'Lily Indahyani Santoso','','0000-00-00',0,'','','',0,'','',''),(49,50,'Imelda','','0000-00-00',0,'','','',0,'','','chau_su@yahoo.com');
/*!40000 ALTER TABLE `psb_calonsiswa_ibu` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_keluarga"
#

DROP TABLE IF EXISTS `psb_calonsiswa_keluarga`;
CREATE TABLE `psb_calonsiswa_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `kakek_nama` varchar(100) NOT NULL DEFAULT '',
  `kakek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `nenek_nama` varchar(100) NOT NULL DEFAULT '',
  `nenek_tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `tglnikah` date NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_keluarga"
#

/*!40000 ALTER TABLE `psb_calonsiswa_keluarga` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_keluarga` VALUES (24,25,'','0000-00-00','','0000-00-00','0000-00-00'),(25,26,'','0000-00-00','','0000-00-00','0000-00-00'),(26,27,'','0000-00-00','','0000-00-00','0000-00-00'),(27,28,'','0000-00-00','','0000-00-00','0000-00-00'),(28,29,'','0000-00-00','','0000-00-00','0000-00-00'),(29,30,'','0000-00-00','','0000-00-00','0000-00-00'),(30,31,'','0000-00-00','','0000-00-00','0000-00-00'),(31,32,'','0000-00-00','','0000-00-00','0000-00-00'),(32,33,'','0000-00-00','','0000-00-00','0000-00-00'),(33,34,'','0000-00-00','','0000-00-00','0000-00-00'),(34,35,'','0000-00-00','','0000-00-00','0000-00-00'),(35,36,'','0000-00-00','','0000-00-00','0000-00-00'),(36,37,'','0000-00-00','','0000-00-00','0000-00-00'),(37,38,'','0000-00-00','','0000-00-00','0000-00-00'),(38,39,'','0000-00-00','','0000-00-00','0000-00-00'),(39,40,'','0000-00-00','','0000-00-00','0000-00-00'),(40,41,'','0000-00-00','','0000-00-00','0000-00-00'),(41,42,'','0000-00-00','','0000-00-00','0000-00-00'),(42,43,'','0000-00-00','','0000-00-00','0000-00-00'),(43,44,'','0000-00-00','','0000-00-00','0000-00-00'),(44,45,'','0000-00-00','','0000-00-00','0000-00-00'),(45,46,'','0000-00-00','','0000-00-00','0000-00-00'),(46,47,'','0000-00-00','','0000-00-00','0000-00-00'),(47,48,'','0000-00-00','','0000-00-00','0000-00-00'),(48,49,'','0000-00-00','','0000-00-00','0000-00-00'),(49,50,'','0000-00-00','','0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `psb_calonsiswa_keluarga` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_kontakdarurat"
#

DROP TABLE IF EXISTS `psb_calonsiswa_kontakdarurat`;
CREATE TABLE `psb_calonsiswa_kontakdarurat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `hubungan` varchar(30) NOT NULL,
  `telpon` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_kontakdarurat"
#

/*!40000 ALTER TABLE `psb_calonsiswa_kontakdarurat` DISABLE KEYS */;
INSERT INTO `psb_calonsiswa_kontakdarurat` VALUES (24,25,'','',''),(25,26,'','',''),(26,27,'','',''),(27,28,'','',''),(28,29,'','',''),(29,30,'','',''),(30,31,'','',''),(31,32,'','',''),(32,33,'','',''),(33,34,'','',''),(34,35,'','',''),(35,36,'','',''),(36,37,'','',''),(37,38,'','',''),(38,39,'','',''),(39,40,'','',''),(40,41,'','',''),(41,42,'','',''),(42,43,'','',''),(43,44,'','',''),(44,45,'','',''),(45,46,'','',''),(46,47,'','',''),(47,48,'','',''),(48,49,'','',''),(49,50,'','','');
/*!40000 ALTER TABLE `psb_calonsiswa_kontakdarurat` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_saudara"
#

DROP TABLE IF EXISTS `psb_calonsiswa_saudara`;
CREATE TABLE `psb_calonsiswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `idsaudara` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_saudara"
#

/*!40000 ALTER TABLE `psb_calonsiswa_saudara` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_calonsiswa_saudara` ENABLE KEYS */;

#
# Structure for table "psb_calonsiswa_syarat"
#

DROP TABLE IF EXISTS `psb_calonsiswa_syarat`;
CREATE TABLE `psb_calonsiswa_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `syarat` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_calonsiswa_syarat"
#

/*!40000 ALTER TABLE `psb_calonsiswa_syarat` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_calonsiswa_syarat` ENABLE KEYS */;

#
# Structure for table "psb_disctunai"
#

DROP TABLE IF EXISTS `psb_disctunai`;
CREATE TABLE `psb_disctunai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT '',
  `nilai` decimal(10,0) unsigned NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`,`nilai`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "psb_disctunai"
#

/*!40000 ALTER TABLE `psb_disctunai` DISABLE KEYS */;
INSERT INTO `psb_disctunai` VALUES (1,'diskon xxx',10,'diskon untuk xx');
/*!40000 ALTER TABLE `psb_disctunai` ENABLE KEYS */;

#
# Structure for table "psb_golongan"
#

DROP TABLE IF EXISTS `psb_golongan`;
CREATE TABLE `psb_golongan` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned DEFAULT '1',
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "psb_golongan"
#

/*!40000 ALTER TABLE `psb_golongan` DISABLE KEYS */;
INSERT INTO `psb_golongan` VALUES (1,'Anak Guru &amp; Staf','Anak Guru &amp; Staf',1),(2,'Jalur Prestasi','Akademik, sports, musik',1),(3,'Umum','Masyarakat umum',1);
/*!40000 ALTER TABLE `psb_golongan` ENABLE KEYS */;

#
# Structure for table "psb_kelompok"
#

DROP TABLE IF EXISTS `psb_kelompok`;
CREATE TABLE `psb_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `departemen` varchar(255) DEFAULT NULL,
  `tahunajaran` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "psb_kelompok"
#

INSERT INTO `psb_kelompok` VALUES (1,'Gelombang 1','1',1,'2015-06-01','2014-10-31','oke ','2015-06-04 01:42:44'),(2,'Gelombang 2','1',1,'2014-11-01','2015-02-28','gel kedua','2015-06-04 01:43:24'),(3,'Gelombang 3','1',1,'2015-03-01','2015-06-30','','2015-06-04 01:44:10'),(4,'Gelombang 1','1',1,'2014-06-10','2015-06-01','','2015-06-29 22:59:49');

#
# Structure for table "psb_kondisisiswa"
#

DROP TABLE IF EXISTS `psb_kondisisiswa`;
CREATE TABLE `psb_kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "psb_kondisisiswa"
#


#
# Structure for table "psb_kriteria"
#

DROP TABLE IF EXISTS `psb_kriteria`;
CREATE TABLE `psb_kriteria` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `urut` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `replid` (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "psb_kriteria"
#

/*!40000 ALTER TABLE `psb_kriteria` DISABLE KEYS */;
INSERT INTO `psb_kriteria` VALUES (1,'Toddler','Usia 1 - 2 Tahun',1),(2,'Playgroup 1','Usia 2-3 Tahun',1),(3,'Kindergarten 1','Usia 4-5 Tahun',1),(4,'Primary','Usia 6 Tahun',1),(5,'Playgroup 2','Usia 3-4 tahun',1),(6,'Kindergarten 2','Usia 5-6 tahun',1);
/*!40000 ALTER TABLE `psb_kriteria` ENABLE KEYS */;

#
# Structure for table "psb_photo"
#

DROP TABLE IF EXISTS `psb_photo`;
CREATE TABLE `psb_photo` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_photo"
#

/*!40000 ALTER TABLE `psb_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_photo` ENABLE KEYS */;

#
# Structure for table "psb_proses"
#

DROP TABLE IF EXISTS `psb_proses`;
CREATE TABLE `psb_proses` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodeawalan` varchar(10) NOT NULL,
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
  `departemen` int(10) unsigned NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tahunajaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "psb_proses"
#

INSERT INTO `psb_proses` VALUES (1,'PMB2015',1,1,'1','','2015-06-04 01:40:57',NULL),(2,'PMB2014',17,1,'0','ok','2015-06-29 22:54:50',NULL);

#
# Structure for table "psb_setbiaya"
#

DROP TABLE IF EXISTS `psb_setbiaya`;
CREATE TABLE `psb_setbiaya` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuition` decimal(10,0) NOT NULL DEFAULT '0',
  `registration` decimal(10,0) NOT NULL DEFAULT '0',
  `material` decimal(10,0) NOT NULL,
  `ting` int(10) unsigned NOT NULL DEFAULT '0',
  `gol` int(10) unsigned NOT NULL DEFAULT '0',
  `kel` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

#
# Data for table "psb_setbiaya"
#

INSERT INTO `psb_setbiaya` VALUES (1,1000000,15000000,500000,1,1,1),(2,1000000,10000000,500000,1,2,1),(3,1000000,20000000,500000,1,3,1),(4,0,0,8000000,2,1,1),(5,0,0,0,2,2,1),(6,0,0,0,2,3,1),(7,0,0,0,3,1,1),(8,0,0,0,3,2,1),(9,0,0,0,3,3,1),(10,800000,10000000,500000,4,1,1),(11,800000,10000000,500000,4,2,1),(12,800000,10000000,500000,4,3,1),(13,4500000,15000000,2500000,1,1,2),(14,800000,35000000,7000000,1,2,2),(15,7000000,6000000,8000000,1,3,2),(16,2500000,5500000,1500000,2,1,2),(17,15000000,25000000,3500000,2,2,2),(18,15000000,25000000,5500000,2,3,2),(19,1500000,3500000,1700000,3,1,2),(20,0,0,0,3,2,2),(21,0,0,0,3,3,2),(22,0,0,0,4,1,2),(23,0,0,0,4,2,2),(24,0,0,0,4,3,2),(25,1000000,15000000,500000,1,1,3),(26,1000000,10000000,500000,1,2,3),(27,1000000,20000000,500000,1,3,3),(28,8000000,85000000,90000,2,1,3),(29,7000000,0,0,2,2,3),(30,0,0,0,2,3,3),(31,0,0,0,3,1,3),(32,0,0,0,3,2,3),(33,0,0,0,3,3,3),(34,0,0,0,4,1,3),(35,0,0,0,4,2,3),(36,0,0,0,4,3,3),(37,0,0,0,1,1,4),(38,2000000,45000000,5500000,1,2,4),(39,0,0,0,1,3,4),(40,0,0,0,2,1,4),(41,0,0,0,2,2,4),(42,0,0,0,2,3,4),(43,0,0,0,3,1,4),(44,0,0,0,3,2,4),(45,0,0,0,3,3,4),(46,0,0,0,4,1,4),(47,0,0,0,4,2,4),(48,0,0,0,4,3,4);

#
# Structure for table "psb_statussiswa"
#

DROP TABLE IF EXISTS `psb_statussiswa`;
CREATE TABLE `psb_statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` int(10) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "psb_statussiswa"
#


#
# Structure for table "psb_syarat"
#

DROP TABLE IF EXISTS `psb_syarat`;
CREATE TABLE `psb_syarat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `syarat` varchar(100) NOT NULL,
  `wajib` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_syarat"
#

/*!40000 ALTER TABLE `psb_syarat` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_syarat` ENABLE KEYS */;

#
# Structure for table "psb_tmp"
#

DROP TABLE IF EXISTS `psb_tmp`;
CREATE TABLE `psb_tmp` (
  `dcid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`dcid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_tmp"
#

/*!40000 ALTER TABLE `psb_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_tmp` ENABLE KEYS */;

#
# Structure for table "psb_tmp_saudara"
#

DROP TABLE IF EXISTS `psb_tmp_saudara`;
CREATE TABLE `psb_tmp_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sesid` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `sekolah` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Data for table "psb_tmp_saudara"
#

/*!40000 ALTER TABLE `psb_tmp_saudara` DISABLE KEYS */;
/*!40000 ALTER TABLE `psb_tmp_saudara` ENABLE KEYS */;
