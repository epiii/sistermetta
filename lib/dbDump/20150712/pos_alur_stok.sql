# Host: localhost  (Version: 5.5.27)
# Date: 2015-07-12 22:47:01
# Generator: MySQL-Front 5.3  (Build 4.128)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "pos_alur_stok"
#

DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

#
# Data for table "pos_alur_stok"
#

/*!40000 ALTER TABLE `pos_alur_stok` DISABLE KEYS */;
INSERT INTO `pos_alur_stok` VALUES (1,'2015-07-11','Pembelian','INV1107150001','CELANA OR','10'),(2,'2015-07-11','Penjualan','FAK1107150001','DASI','5'),(3,'2015-07-11','Penjualan','FAK1107150001','KEMEJA PUTRA','1'),(4,'2015-07-11','Penjualan','FAK1107150001','DASI','5'),(5,'2015-07-11','Penjualan','FAK1107150001','KEMEJA PUTRA','1'),(6,'2015-07-11','Penjualan','FAK1107150001','DASI','5'),(7,'2015-07-11','Penjualan','FAK1107150001','KEMEJA PUTRA','1'),(8,'2015-07-11','Penjualan','FAK1107150002','BLOUSE PUTRI','1'),(9,'2015-07-11','Penjualan','FAK1107150002','KAOS OR','2'),(10,'2015-07-11','Penjualan','FAK1107150003','KAOS OR','1'),(11,'2015-07-11','Penjualan','FAK1107150004','BLOUSE PUTRI','1'),(12,'2015-07-12','Retur Pembelian','RTB1207150001','CELANA OR','5'),(13,'2015-07-12','Retur Pembelian','RTB1207150002','CELANA OR','5'),(14,'2015-07-12','Retur Pembelian','RTB1207150003','BLOUSE PUTRI','1'),(15,'2015-07-12','Retur Penjualan','RTJ1207150001','BLOUSE PUTRI','1'),(16,'2015-07-12','Retur Penjualan','RTJ1207150002','DASI','5'),(17,'2015-07-12','Retur Penjualan','RTJ1207150002','BLOUSE PUTRI','5'),(18,'2015-07-01','stok awal','-','TOPI','402'),(19,'2015-07-01','stok awal','-','CELANA OR','562'),(20,'2015-07-12','Saldo Awal','-','KPR1207150026','25'),(21,'2015-07-12','Penjualan','FAK1207150005','BLOUSE PUTRI','5');
/*!40000 ALTER TABLE `pos_alur_stok` ENABLE KEYS */;
