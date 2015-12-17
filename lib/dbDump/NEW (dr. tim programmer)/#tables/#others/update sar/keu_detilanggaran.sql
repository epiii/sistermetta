/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-12-17 08:49:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_detilanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(11) NOT NULL,
  `detilanggaran` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`),
  KEY `detilanggaran` (`detilanggaran`),
  CONSTRAINT `kategorianggaranFK` FOREIGN KEY (`kategorianggaran`) REFERENCES `keu_kategorianggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('6', '15', 'Kertas HVS', 'untuk printing dokumen dll');
INSERT INTO `keu_detilanggaran` VALUES ('9', '17', 'beras', 'cadangan beras ');
INSERT INTO `keu_detilanggaran` VALUES ('10', '15', 'spidol', 'spidol papan tulis');
INSERT INTO `keu_detilanggaran` VALUES ('11', '15', 'map A4 coklat', 'tempat berkas');
INSERT INTO `keu_detilanggaran` VALUES ('12', '18', 'korek api', '');
INSERT INTO `keu_detilanggaran` VALUES ('13', '18', 'gas LPG', '');
INSERT INTO `keu_detilanggaran` VALUES ('14', '19', 'tagihan PDAM suko primary', '');
INSERT INTO `keu_detilanggaran` VALUES ('15', '20', 'service Komputer', '');
INSERT INTO `keu_detilanggaran` VALUES ('16', '21', 'ATK Std. Exc.', 'Alat Tulis Pelajar (program student exchange)');
INSERT INTO `keu_detilanggaran` VALUES ('17', '22', 'biaya transportasi antar jemput siswa Toddler', '-');
INSERT INTO `keu_detilanggaran` VALUES ('18', '23', 'perbaikan gedung , jalan dan taman', 'renov dan maintenance');
DROP TRIGGER IF EXISTS `ins_keu_detilanggaran`;
DELIMITER ;;
CREATE TRIGGER `ins_keu_detilanggaran` AFTER INSERT ON `keu_detilanggaran` FOR EACH ROW BEGIN

/* tahun ajaran ---------------------------------------------------------------*/
BLOCK1: begin
		declare vTahunajaran int;
		declare rowsHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for  
				SELECT replid FROM aka_tahunajaran ;
		declare continue handler for not found set rowsHabis1 =1;
		open cursor1;
		LOOP1: loop
						fetch cursor1
						into  vTahunajaran;
						if rowsHabis1 then  close cursor1; leave LOOP1;
						end if;
						/*insert saldo rekening ---------------------------------------------------------------*/
						INSERT INTO keu_anggarantahunan SET 
								detilanggaran = NEW.replid, 
								tahunajaran = vTahunajaran;
				end loop LOOP1;
		end BLOCK1;
END
;;
DELIMITER ;
