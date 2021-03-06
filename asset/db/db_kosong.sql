-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.8 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-12-06 23:32:29
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for setujudb
DROP DATABASE IF EXISTS `setujudb`;
CREATE DATABASE IF NOT EXISTS `setujudb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `setujudb`;


-- Dumping structure for table setujudb.bayar_transaksi
DROP TABLE IF EXISTS `bayar_transaksi`;
CREATE TABLE IF NOT EXISTS `bayar_transaksi` (
  `no_transaksi` varchar(50) NOT NULL DEFAULT '',
  `total_belanja` double DEFAULT '0',
  `ppn` double DEFAULT '0',
  `total_bayar` double DEFAULT '0',
  `dibayar` double DEFAULT '0',
  `kembalian` double DEFAULT '0',
  `created_by` varchar(125) DEFAULT NULL,
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `terbilang` text,
  PRIMARY KEY (`no_transaksi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table data pembayaran pejualan';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.buku_besar
DROP TABLE IF EXISTS `buku_besar`;
CREATE TABLE IF NOT EXISTS `buku_besar` (
  `ID` int(11) DEFAULT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `NoJurnal` varchar(10) DEFAULT NULL,
  `Keterangan` varchar(50) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Saldo` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.cost_center
DROP TABLE IF EXISTS `cost_center`;
CREATE TABLE IF NOT EXISTS `cost_center` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `nama_cc` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`nama_cc`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.detail_transaksi
DROP TABLE IF EXISTS `detail_transaksi`;
CREATE TABLE IF NOT EXISTS `detail_transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `no_transaksi` varchar(50) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `faktur_transaksi` varchar(100) DEFAULT NULL,
  `jenis_transaksi` varchar(50) DEFAULT NULL,
  `akun_transaksi` varchar(100) DEFAULT NULL,
  `cara_bayar` varchar(50) DEFAULT NULL,
  `nm_produsen` varchar(225) DEFAULT NULL,
  `nm_barang` varchar(225) DEFAULT NULL,
  `nm_satuan` varchar(225) DEFAULT NULL,
  `jml_transaksi` double(10,2) DEFAULT '0.00',
  `expired` date DEFAULT NULL,
  `harga_beli` double DEFAULT '0',
  `ket_transaksi` text,
  `created_by` varchar(50) DEFAULT NULL,
  `doc_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table transaksi keluar masuk obat';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_barang
DROP TABLE IF EXISTS `inv_barang`;
CREATE TABLE IF NOT EXISTS `inv_barang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kode` varchar(15) DEFAULT NULL,
  `ID_Kategori` int(11) DEFAULT NULL,
  `ID_Jenis` tinyint(4) DEFAULT NULL,
  `ID_Pemasok` int(11) DEFAULT NULL,
  `Nama_Barang` varchar(30) NOT NULL DEFAULT '',
  `Harga_Beli` float DEFAULT NULL,
  `Harga_Jual` float DEFAULT NULL,
  `ID_Satuan` int(11) DEFAULT NULL,
  `Status` varchar(11) DEFAULT NULL,
  `minstok` double DEFAULT '0',
  PRIMARY KEY (`Nama_Barang`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_barang_jenis
DROP TABLE IF EXISTS `inv_barang_jenis`;
CREATE TABLE IF NOT EXISTS `inv_barang_jenis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JenisBarang` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`JenisBarang`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_barang_kategori
DROP TABLE IF EXISTS `inv_barang_kategori`;
CREATE TABLE IF NOT EXISTS `inv_barang_kategori` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kategori` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`Kategori`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_barang_satuan
DROP TABLE IF EXISTS `inv_barang_satuan`;
CREATE TABLE IF NOT EXISTS `inv_barang_satuan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Satuan` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`Satuan`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_blacklist
DROP TABLE IF EXISTS `inv_blacklist`;
CREATE TABLE IF NOT EXISTS `inv_blacklist` (
  `ID` int(11) DEFAULT NULL,
  `ID_Agt` int(11) NOT NULL DEFAULT '0',
  `Keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Agt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_golongan
DROP TABLE IF EXISTS `inv_golongan`;
CREATE TABLE IF NOT EXISTS `inv_golongan` (
  `nm_golongan` varchar(225) NOT NULL DEFAULT '',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nm_golongan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='tabel golongan obat';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_konversi
DROP TABLE IF EXISTS `inv_konversi`;
CREATE TABLE IF NOT EXISTS `inv_konversi` (
  `id_barang` varchar(50) NOT NULL DEFAULT '',
  `nm_barang` varchar(225) NOT NULL DEFAULT '',
  `nm_satuan` varchar(50) DEFAULT NULL,
  `sat_beli` varchar(50) NOT NULL DEFAULT '',
  `isi_konversi` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sat_beli`,`id_barang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_material_count
DROP TABLE IF EXISTS `inv_material_count`;
CREATE TABLE IF NOT EXISTS `inv_material_count` (
  `nm_barang` varchar(125) NOT NULL DEFAULT '',
  `nm_satuan` varchar(50) DEFAULT NULL,
  `count1` double DEFAULT '0',
  `count2` double DEFAULT '0',
  `datecount` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nm_barang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_material_stok
DROP TABLE IF EXISTS `inv_material_stok`;
CREATE TABLE IF NOT EXISTS `inv_material_stok` (
  `id_barang` int(50) NOT NULL DEFAULT '0',
  `nm_barang` varchar(125) NOT NULL DEFAULT '',
  `batch` varchar(125) NOT NULL DEFAULT '',
  `expired` date DEFAULT NULL,
  `stock` double DEFAULT '0',
  `blokstok` double DEFAULT '0',
  `nm_satuan` varchar(50) DEFAULT NULL,
  `harga_beli` int(10) unsigned DEFAULT '0',
  `created_by` varchar(50) DEFAULT NULL,
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`batch`,`id_barang`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='data stock material';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_pemasok
DROP TABLE IF EXISTS `inv_pemasok`;
CREATE TABLE IF NOT EXISTS `inv_pemasok` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pemasok` varchar(30) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Kota` varchar(20) DEFAULT NULL,
  `Propinsi` varchar(20) DEFAULT NULL,
  `Telepon` varchar(30) DEFAULT NULL,
  `Faksimili` varchar(15) DEFAULT NULL,
  `Status` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_pembayaran
DROP TABLE IF EXISTS `inv_pembayaran`;
CREATE TABLE IF NOT EXISTS `inv_pembayaran` (
  `no_transaksi` varchar(50) NOT NULL DEFAULT '0',
  `total_belanja` double DEFAULT '0',
  `ppn` double DEFAULT '0',
  `total_bayar` double DEFAULT '0',
  `jml_dibayar` double DEFAULT '0',
  `kembalian` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `ID_Jenis` int(10) DEFAULT NULL,
  PRIMARY KEY (`no_transaksi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_pembelian
DROP TABLE IF EXISTS `inv_pembelian`;
CREATE TABLE IF NOT EXISTS `inv_pembelian` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jenis` tinyint(4) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `Bulan` tinyint(4) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `ID_Pemasok` int(11) DEFAULT NULL,
  `NoUrut` varchar(50) DEFAULT NULL,
  `Nomor` varchar(15) DEFAULT NULL,
  `Deskripsi` varchar(30) DEFAULT NULL,
  `ID_Bayar` int(20) DEFAULT NULL,
  `ID_Post` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_pembelian_detail
DROP TABLE IF EXISTS `inv_pembelian_detail`;
CREATE TABLE IF NOT EXISTS `inv_pembelian_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tanggal` date DEFAULT NULL,
  `Bulan` tinyint(4) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `ID_Beli` int(11) DEFAULT NULL,
  `ID_Barang` int(11) DEFAULT NULL,
  `Jml_Faktur` smallint(6) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Harga_Beli` float DEFAULT NULL,
  `Keterangan` varchar(50) DEFAULT NULL,
  `ID_Satuan` int(11) DEFAULT NULL,
  `Batch` varchar(50) DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_pembelian_jenis
DROP TABLE IF EXISTS `inv_pembelian_jenis`;
CREATE TABLE IF NOT EXISTS `inv_pembelian_jenis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Jenis_Beli` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Jenis_Beli`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_pembelian_rekap
DROP TABLE IF EXISTS `inv_pembelian_rekap`;
CREATE TABLE IF NOT EXISTS `inv_pembelian_rekap` (
  `ID` int(11) DEFAULT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `Bulan` tinyint(4) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `ID_Beli` int(11) DEFAULT NULL,
  `ID_Barang` int(11) DEFAULT NULL,
  `Jml_Faktur` smallint(6) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Harga_Beli` float DEFAULT NULL,
  `Keterangan` varchar(50) DEFAULT NULL,
  `ID_Satuan` int(11) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_pembelian_status
DROP TABLE IF EXISTS `inv_pembelian_status`;
CREATE TABLE IF NOT EXISTS `inv_pembelian_status` (
  `ID` int(11) DEFAULT NULL,
  `Status` varchar(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_penjualan
DROP TABLE IF EXISTS `inv_penjualan`;
CREATE TABLE IF NOT EXISTS `inv_penjualan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jenis` tinyint(4) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `Bulan` tinyint(4) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` varchar(50) NOT NULL DEFAULT '',
  `Nomor` varchar(50) DEFAULT NULL,
  `ID_Anggota` int(11) DEFAULT '0',
  `Deskripsi` varchar(30) DEFAULT NULL,
  `Cicilan` tinyint(4) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Tgl_Cicilan` date DEFAULT NULL,
  `ID_Post` varchar(100) DEFAULT NULL,
  `ID_Close` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_penjualan_bayar
DROP TABLE IF EXISTS `inv_penjualan_bayar`;
CREATE TABLE IF NOT EXISTS `inv_penjualan_bayar` (
  `ID` int(11) DEFAULT NULL,
  `ID_Jual` int(11) DEFAULT NULL,
  `ID_Master` tinyint(4) DEFAULT NULL,
  `Tanggal` varchar(50) DEFAULT NULL,
  `Bayar` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_penjualan_detail
DROP TABLE IF EXISTS `inv_penjualan_detail`;
CREATE TABLE IF NOT EXISTS `inv_penjualan_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jenis` tinyint(4) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `Bulan` tinyint(4) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `ID_Jual` int(11) DEFAULT NULL,
  `ID_Barang` int(11) DEFAULT NULL,
  `Jumlah` smallint(6) DEFAULT NULL,
  `Harga` float DEFAULT NULL,
  `ID_Post` varchar(50) DEFAULT NULL,
  `Keterangan` varchar(50) DEFAULT NULL,
  `ID_Satuan` varchar(50) DEFAULT NULL,
  `Batch` varchar(50) DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_penjualan_jenis
DROP TABLE IF EXISTS `inv_penjualan_jenis`;
CREATE TABLE IF NOT EXISTS `inv_penjualan_jenis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Jenis_Jual` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_penjualan_rekap
DROP TABLE IF EXISTS `inv_penjualan_rekap`;
CREATE TABLE IF NOT EXISTS `inv_penjualan_rekap` (
  `ID` int(11) DEFAULT NULL,
  `ID_Jenis` tinyint(4) DEFAULT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `Bulan` tinyint(4) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `ID_Jual` int(11) DEFAULT NULL,
  `ID_Barang` int(11) DEFAULT NULL,
  `Jumlah` smallint(6) DEFAULT NULL,
  `Harga` double DEFAULT NULL,
  `ID_Post` tinyint(4) DEFAULT NULL,
  `Keterangan` varchar(50) DEFAULT NULL,
  `no_transaksi` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_penjualan_status
DROP TABLE IF EXISTS `inv_penjualan_status`;
CREATE TABLE IF NOT EXISTS `inv_penjualan_status` (
  `ID` int(11) DEFAULT NULL,
  `Status_Jual` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_posting_date
DROP TABLE IF EXISTS `inv_posting_date`;
CREATE TABLE IF NOT EXISTS `inv_posting_date` (
  `ID` int(11) DEFAULT NULL,
  `PostingDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_posting_status
DROP TABLE IF EXISTS `inv_posting_status`;
CREATE TABLE IF NOT EXISTS `inv_posting_status` (
  `ID` int(11) DEFAULT NULL,
  `PostStatus` varchar(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.inv_tagihan
DROP TABLE IF EXISTS `inv_tagihan`;
CREATE TABLE IF NOT EXISTS `inv_tagihan` (
  `ID` int(11) DEFAULT NULL,
  `ID_Jual` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.jenis_simpanan
DROP TABLE IF EXISTS `jenis_simpanan`;
CREATE TABLE IF NOT EXISTS `jenis_simpanan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Jenis` varchar(12) NOT NULL DEFAULT '',
  `ID_Klasifikasi` int(11) DEFAULT NULL,
  `ID_SubKlas` int(11) DEFAULT NULL,
  `ID_Laporan` int(11) DEFAULT NULL,
  `ID_LapDetail` int(11) DEFAULT NULL,
  `ID_Calc` int(11) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`Jenis`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.jurnal
DROP TABLE IF EXISTS `jurnal`;
CREATE TABLE IF NOT EXISTS `jurnal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Tipe` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `ID_Bulan` smallint(6) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `Keterangan` varchar(60) DEFAULT NULL,
  `ID_Mark` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.kas
DROP TABLE IF EXISTS `kas`;
CREATE TABLE IF NOT EXISTS `kas` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Kode` varchar(50) DEFAULT NULL,
  `Nama_Kas` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.kas_sub
DROP TABLE IF EXISTS `kas_sub`;
CREATE TABLE IF NOT EXISTS `kas_sub` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_KAS` int(10) DEFAULT NULL,
  `Nama_SubKas` varchar(150) DEFAULT NULL,
  `ID_Calc` int(10) DEFAULT '0',
  `ID_CC` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.keaktifan
DROP TABLE IF EXISTS `keaktifan`;
CREATE TABLE IF NOT EXISTS `keaktifan` (
  `ID` int(11) DEFAULT NULL,
  `Keaktifan` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.klasifikasi
DROP TABLE IF EXISTS `klasifikasi`;
CREATE TABLE IF NOT EXISTS `klasifikasi` (
  `ID` int(11) DEFAULT NULL,
  `Kode` varchar(2) DEFAULT NULL,
  `Klasifikasi` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.laba_rugi
DROP TABLE IF EXISTS `laba_rugi`;
CREATE TABLE IF NOT EXISTS `laba_rugi` (
  `ID` int(11) DEFAULT NULL,
  `Jenis` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.laporan
DROP TABLE IF EXISTS `laporan`;
CREATE TABLE IF NOT EXISTS `laporan` (
  `ID` int(11) DEFAULT NULL,
  `JenisLaporan` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_head
DROP TABLE IF EXISTS `lap_head`;
CREATE TABLE IF NOT EXISTS `lap_head` (
  `ID` int(11) DEFAULT NULL,
  `Header1` varchar(11) DEFAULT NULL,
  `Header2` varchar(11) DEFAULT NULL,
  `Number1` double DEFAULT NULL,
  `Number2` double DEFAULT NULL,
  `Number3` double DEFAULT NULL,
  `Number4` double DEFAULT NULL,
  `Number5` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_jenis
DROP TABLE IF EXISTS `lap_jenis`;
CREATE TABLE IF NOT EXISTS `lap_jenis` (
  `ID` int(11) DEFAULT NULL,
  `ID_Head` int(11) DEFAULT NULL,
  `ID_KBR` smallint(6) DEFAULT NULL,
  `ID_USP` smallint(6) DEFAULT NULL,
  `ID_Calc` smallint(6) DEFAULT NULL,
  `Jenis` varchar(30) DEFAULT NULL,
  `Jenis1` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_neraca_detail
DROP TABLE IF EXISTS `lap_neraca_detail`;
CREATE TABLE IF NOT EXISTS `lap_neraca_detail` (
  `ID` int(11) DEFAULT NULL,
  `ID_Head` int(11) DEFAULT NULL,
  `ID_KBR` tinyint(4) DEFAULT NULL,
  `ID_USP` tinyint(4) DEFAULT NULL,
  `Detail` varchar(50) DEFAULT NULL,
  `Number1` double DEFAULT NULL,
  `Number2` double DEFAULT NULL,
  `Number3` double DEFAULT NULL,
  `Number4` double DEFAULT NULL,
  `Number5` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_neraca_head
DROP TABLE IF EXISTS `lap_neraca_head`;
CREATE TABLE IF NOT EXISTS `lap_neraca_head` (
  `ID` int(11) DEFAULT NULL,
  `ID_Ledger` int(11) DEFAULT NULL,
  `ID_Head` int(11) DEFAULT NULL,
  `Head` varchar(30) DEFAULT NULL,
  `Number1` double DEFAULT NULL,
  `Number2` double DEFAULT NULL,
  `Number3` double DEFAULT NULL,
  `Number4` double DEFAULT NULL,
  `Number5` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_neraca_ledger
DROP TABLE IF EXISTS `lap_neraca_ledger`;
CREATE TABLE IF NOT EXISTS `lap_neraca_ledger` (
  `ID` int(11) DEFAULT NULL,
  `ID_Ledger` int(11) DEFAULT NULL,
  `Ledger1` varchar(20) DEFAULT NULL,
  `Ledger2` varchar(20) DEFAULT NULL,
  `Number1` double DEFAULT NULL,
  `Number2` double DEFAULT NULL,
  `Number3` double DEFAULT NULL,
  `Number4` double DEFAULT NULL,
  `Number5` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_shu_detail
DROP TABLE IF EXISTS `lap_shu_detail`;
CREATE TABLE IF NOT EXISTS `lap_shu_detail` (
  `ID` int(11) DEFAULT NULL,
  `ID_Head` int(11) DEFAULT NULL,
  `ID_KBR` tinyint(4) DEFAULT NULL,
  `ID_USP` tinyint(4) DEFAULT NULL,
  `Detail` varchar(50) DEFAULT NULL,
  `Number1` double DEFAULT NULL,
  `Number2` double DEFAULT NULL,
  `Number3` double DEFAULT NULL,
  `Number4` double DEFAULT NULL,
  `Number5` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_shu_head
DROP TABLE IF EXISTS `lap_shu_head`;
CREATE TABLE IF NOT EXISTS `lap_shu_head` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Head` int(11) DEFAULT NULL,
  `Head` varchar(50) DEFAULT NULL,
  `Number1` double DEFAULT NULL,
  `Number2` double DEFAULT NULL,
  `Number3` double DEFAULT NULL,
  `Number4` double DEFAULT NULL,
  `Number5` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.lap_subjenis
DROP TABLE IF EXISTS `lap_subjenis`;
CREATE TABLE IF NOT EXISTS `lap_subjenis` (
  `ID` int(11) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `ID_Lap` int(11) DEFAULT NULL,
  `ID_Jenis` int(11) DEFAULT NULL,
  `ID_Calc` int(11) DEFAULT NULL,
  `ID_KBR` smallint(6) DEFAULT NULL,
  `ID_USP` smallint(6) DEFAULT NULL,
  `ID_Post` smallint(6) DEFAULT NULL,
  `SubJenis` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_anggota
DROP TABLE IF EXISTS `mst_anggota`;
CREATE TABLE IF NOT EXISTS `mst_anggota` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jenis` tinyint(4) NOT NULL DEFAULT '0',
  `NoUrut` int(11) NOT NULL DEFAULT '0',
  `ID_Aktif` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `No_Perkiraan` varchar(4) DEFAULT NULL,
  `NIP` varchar(10) DEFAULT NULL,
  `No_Agt` varchar(10) NOT NULL DEFAULT '',
  `Nama` varchar(40) DEFAULT NULL,
  `ID_Check` smallint(6) DEFAULT NULL,
  `ID_Kelamin` int(11) DEFAULT NULL,
  `TanggalMasuk` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TanggalKeluar` date DEFAULT NULL,
  `PhotoLink` varchar(255) DEFAULT NULL,
  `Catatan` mediumtext,
  `Alamat` varchar(50) DEFAULT NULL,
  `Kota` varchar(20) DEFAULT NULL,
  `Propinsi` varchar(20) DEFAULT NULL,
  `Telepon` varchar(50) DEFAULT NULL,
  `Faksimili` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NoUrut`,`ID_Jenis`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table anggota koperasi';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_anggota_copy
DROP TABLE IF EXISTS `mst_anggota_copy`;
CREATE TABLE IF NOT EXISTS `mst_anggota_copy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jenis` tinyint(4) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `ID_Aktif` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `No_Perkiraan` varchar(4) DEFAULT NULL,
  `NIP` varchar(10) DEFAULT NULL,
  `No_Agt` varchar(10) DEFAULT NULL,
  `Nama` varchar(40) DEFAULT NULL,
  `ID_Check` smallint(6) DEFAULT NULL,
  `ID_Kelamin` int(11) DEFAULT NULL,
  `TanggalMasuk` datetime DEFAULT NULL,
  `TanggalKeluar` datetime DEFAULT NULL,
  `PhotoLink` varchar(255) DEFAULT NULL,
  `Catatan` mediumtext,
  `Alamat` varchar(50) DEFAULT NULL,
  `Kota` varchar(20) DEFAULT NULL,
  `Propinsi` varchar(20) DEFAULT NULL,
  `Telepon` varchar(50) DEFAULT NULL,
  `Faksimili` varchar(50) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='table anggota koperasi';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_bank
DROP TABLE IF EXISTS `mst_bank`;
CREATE TABLE IF NOT EXISTS `mst_bank` (
  `NamaBank` varchar(150) NOT NULL DEFAULT '',
  `NoRek` varchar(150) NOT NULL DEFAULT '',
  `Nama` varchar(150) DEFAULT NULL,
  `Saldo` double DEFAULT '0',
  PRIMARY KEY (`NamaBank`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_bulan
DROP TABLE IF EXISTS `mst_bulan`;
CREATE TABLE IF NOT EXISTS `mst_bulan` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Bulan` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_departemen
DROP TABLE IF EXISTS `mst_departemen`;
CREATE TABLE IF NOT EXISTS `mst_departemen` (
  `ID` int(11) DEFAULT NULL,
  `Kode` varchar(2) DEFAULT NULL,
  `Departemen` varchar(40) DEFAULT NULL,
  `Title` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_kas
DROP TABLE IF EXISTS `mst_kas`;
CREATE TABLE IF NOT EXISTS `mst_kas` (
  `id_kas` varchar(100) NOT NULL DEFAULT '',
  `nm_kas` varchar(225) DEFAULT '',
  `sa_kas` double DEFAULT '0',
  `sl_kas` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_kas_harian
DROP TABLE IF EXISTS `mst_kas_harian`;
CREATE TABLE IF NOT EXISTS `mst_kas_harian` (
  `no_trans` varchar(50) NOT NULL DEFAULT '0000-00-00',
  `tgl_kas` date NOT NULL DEFAULT '0000-00-00',
  `id_kas` varchar(50) NOT NULL DEFAULT '',
  `nm_kas` varchar(150) DEFAULT NULL,
  `sa_kas` double DEFAULT '0',
  `created_by` varchar(225) DEFAULT NULL,
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tgl_kas`,`id_kas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_kas_trans
DROP TABLE IF EXISTS `mst_kas_trans`;
CREATE TABLE IF NOT EXISTS `mst_kas_trans` (
  `id_trans` int(10) NOT NULL DEFAULT '0',
  `id_kas` varchar(10) DEFAULT NULL,
  `tgl_trans` date DEFAULT NULL,
  `uraian_trans` text,
  `jumlah` double DEFAULT '0',
  `saldo_kas` double DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_trans`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='transaksi kas harian';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_kota
DROP TABLE IF EXISTS `mst_kota`;
CREATE TABLE IF NOT EXISTS `mst_kota` (
  `kota_anggota` varchar(150) NOT NULL DEFAULT '',
  `created_by` varchar(150) NOT NULL DEFAULT '',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kota_anggota`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_pelanggan
DROP TABLE IF EXISTS `mst_pelanggan`;
CREATE TABLE IF NOT EXISTS `mst_pelanggan` (
  `nm_pelanggan` varchar(125) NOT NULL DEFAULT '',
  `alm_pelanggan` text,
  `telp_pelanggan` varchar(50) DEFAULT NULL,
  `hutang_pelanggan` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nm_pelanggan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_produsen
DROP TABLE IF EXISTS `mst_produsen`;
CREATE TABLE IF NOT EXISTS `mst_produsen` (
  `nm_produsen` varchar(125) NOT NULL DEFAULT '',
  ` alm_produsen` text,
  ` telp_produsen` varchar(50) DEFAULT NULL,
  ` hutang_produsen` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nm_produsen`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_propinsi
DROP TABLE IF EXISTS `mst_propinsi`;
CREATE TABLE IF NOT EXISTS `mst_propinsi` (
  `prop_anggota` varchar(100) NOT NULL DEFAULT '',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`prop_anggota`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='data propinsi';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.mst_status
DROP TABLE IF EXISTS `mst_status`;
CREATE TABLE IF NOT EXISTS `mst_status` (
  `nm_status` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`nm_status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.nomor_transaksi
DROP TABLE IF EXISTS `nomor_transaksi`;
CREATE TABLE IF NOT EXISTS `nomor_transaksi` (
  `nomor` varchar(50) NOT NULL DEFAULT '',
  `jenis_transaksi` varchar(50) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nomor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.perkiraan
DROP TABLE IF EXISTS `perkiraan`;
CREATE TABLE IF NOT EXISTS `perkiraan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Klas` int(11) DEFAULT NULL,
  `ID_SubKlas` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Laporan` int(11) DEFAULT NULL,
  `ID_LapDetail` int(11) DEFAULT NULL,
  `ID_Agt` int(11) NOT NULL DEFAULT '0',
  `ID_Calc` int(11) DEFAULT NULL,
  `ID_Simpanan` int(11) NOT NULL DEFAULT '0',
  `NoUrut` int(11) DEFAULT NULL,
  `Kode` varchar(4) DEFAULT NULL,
  `Perkiraan` varchar(50) DEFAULT NULL,
  `SaldoAwal` double DEFAULT NULL,
  PRIMARY KEY (`ID_Agt`,`ID_Simpanan`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.pinjaman
DROP TABLE IF EXISTS `pinjaman`;
CREATE TABLE IF NOT EXISTS `pinjaman` (
  `ID` varchar(50) NOT NULL DEFAULT '',
  `ID_Unit` int(10) NOT NULL DEFAULT '0',
  `Tanggal` datetime DEFAULT NULL,
  `ID_Agt` int(10) DEFAULT NULL,
  `ID_Bulan` int(10) DEFAULT NULL,
  `Tahun` int(10) DEFAULT NULL,
  `jml_pinjaman` double DEFAULT '0',
  `cicilan` double DEFAULT '0',
  `cicilan_end` double DEFAULT '0',
  `lama_cicilan` double DEFAULT '1',
  `cara_bayar` varchar(50) DEFAULT NULL,
  `keterangan` text,
  `mulai_bayar` date DEFAULT NULL,
  `stat_pinjaman` int(11) DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table daftar pinjaman anggota';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.pinjaman_bayar
DROP TABLE IF EXISTS `pinjaman_bayar`;
CREATE TABLE IF NOT EXISTS `pinjaman_bayar` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_Pinjaman` varchar(50) NOT NULL DEFAULT '0',
  `ID_Agt` int(10) NOT NULL DEFAULT '0',
  `Tanggal` date NOT NULL DEFAULT '0000-00-00',
  `Tahun` int(10) NOT NULL DEFAULT '0',
  `Debet` double NOT NULL DEFAULT '0',
  `Kredit` double NOT NULL DEFAULT '0',
  `saldo` double DEFAULT '0',
  `keterangan` text,
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Pinjaman`,`Tahun`,`Debet`,`Kredit`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table transaksi pembayaran pinjaman';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.pinjaman_limit
DROP TABLE IF EXISTS `pinjaman_limit`;
CREATE TABLE IF NOT EXISTS `pinjaman_limit` (
  `ID_Agt` int(10) NOT NULL DEFAULT '0',
  `Tahun` int(10) NOT NULL DEFAULT '0',
  `max_limit` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Agt`,`Tahun`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table daftar limit maximal anggota dapat meminjam, 0 adalah no limit';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.setup_simpanan
DROP TABLE IF EXISTS `setup_simpanan`;
CREATE TABLE IF NOT EXISTS `setup_simpanan` (
  `id_simpanan` int(10) NOT NULL DEFAULT '0',
  `nm_simpanan` varchar(50) DEFAULT NULL,
  `min_simpanan` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_simpanan`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table pengaturan simpanan anggota';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.set_simpanan_log
DROP TABLE IF EXISTS `set_simpanan_log`;
CREATE TABLE IF NOT EXISTS `set_simpanan_log` (
  `id_simpanan` int(10) NOT NULL DEFAULT '0',
  `nm_simpanan` varchar(50) DEFAULT NULL,
  `min_simpanan` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED COMMENT='table pengaturan simpanan anggota';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.status
DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `ID` int(11) DEFAULT NULL,
  `Status1` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.sub_klasifikasi
DROP TABLE IF EXISTS `sub_klasifikasi`;
CREATE TABLE IF NOT EXISTS `sub_klasifikasi` (
  `ID` int(11) DEFAULT NULL,
  `ID_Klasifikasi` int(11) DEFAULT NULL,
  `ID_Neraca` int(11) DEFAULT NULL,
  `Kode` varchar(2) DEFAULT NULL,
  `SubKlasifikasi` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for procedure setujudb.s_total_pinjaman
DROP PROCEDURE IF EXISTS `s_total_pinjaman`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `s_total_pinjaman`(IN `ID_Pi` INT)
BEGIN
	select p.pinjaman as t_pinjaman from pinjaman as p where ID=ID_Pi;
END//
DELIMITER ;


-- Dumping structure for procedure setujudb.s_total_pinjaman_bayar
DROP PROCEDURE IF EXISTS `s_total_pinjaman_bayar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `s_total_pinjaman_bayar`(IN `ID_Pinjaman` INT)
BEGIN
	select sum(kredit) as t_setoran from pinjaman_bayar where ID_Pinjaman=ID_Pinjaman;
END//
DELIMITER ;


-- Dumping structure for table setujudb.tipe_jurnal
DROP TABLE IF EXISTS `tipe_jurnal`;
CREATE TABLE IF NOT EXISTS `tipe_jurnal` (
  `ID` int(11) DEFAULT NULL,
  `Jenis` varchar(30) DEFAULT NULL,
  `Kode` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.tipe_transaksi
DROP TABLE IF EXISTS `tipe_transaksi`;
CREATE TABLE IF NOT EXISTS `tipe_transaksi` (
  `ID` int(11) DEFAULT NULL,
  `Tipe` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.tmp_kasir_transaksi_rekap
DROP TABLE IF EXISTS `tmp_kasir_transaksi_rekap`;
CREATE TABLE IF NOT EXISTS `tmp_kasir_transaksi_rekap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jurnal` int(11) DEFAULT NULL,
  `ID_Perkiraan` int(11) DEFAULT NULL,
  `ID_Dept_T` int(11) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `ID_P` int(11) DEFAULT NULL,
  `ID_Klas` int(11) DEFAULT NULL,
  `ID_SubKlas` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Laporan` int(11) DEFAULT NULL,
  `ID_LapDetail` int(11) DEFAULT NULL,
  `ID_Agt` int(11) DEFAULT NULL,
  `ID_Calc` int(11) DEFAULT NULL,
  `ID_Simpanan` int(11) DEFAULT NULL,
  `NoUrut_P` int(11) DEFAULT NULL,
  `Kode` varchar(4) DEFAULT NULL,
  `Perkiraan` varchar(50) DEFAULT NULL,
  `SaldoAwal` double DEFAULT NULL,
  `ID_J` int(11) DEFAULT NULL,
  `ID_Unit_J` int(11) DEFAULT NULL,
  `ID_Tipe` int(11) DEFAULT NULL,
  `ID_Dept_J` int(11) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `ID_Bulan` smallint(6) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `Keterangan_J` varchar(60) DEFAULT NULL,
  `ID_Mark` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.tmp_superuser_neraca_balance
DROP TABLE IF EXISTS `tmp_superuser_neraca_balance`;
CREATE TABLE IF NOT EXISTS `tmp_superuser_neraca_balance` (
  `unit` int(10) NOT NULL DEFAULT '0',
  `periode` date NOT NULL DEFAULT '0000-00-00',
  `Aktiva` double DEFAULT '0',
  `Aktiva2` double DEFAULT '0',
  `Pasiva` double DEFAULT '0',
  `Pasiva2` double DEFAULT '0',
  PRIMARY KEY (`periode`,`unit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.tmp_superuser_total_shu
DROP TABLE IF EXISTS `tmp_superuser_total_shu`;
CREATE TABLE IF NOT EXISTS `tmp_superuser_total_shu` (
  `tglAwal` date DEFAULT NULL,
  `tglAkhir` date DEFAULT NULL,
  `saldo` double DEFAULT '0',
  `saldo2` double DEFAULT '0',
  `unit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.tmp_superuser_transaksi_rekap
DROP TABLE IF EXISTS `tmp_superuser_transaksi_rekap`;
CREATE TABLE IF NOT EXISTS `tmp_superuser_transaksi_rekap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jurnal` int(11) DEFAULT NULL,
  `ID_Perkiraan` int(11) DEFAULT NULL,
  `ID_Dept_T` int(11) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `ID_P` int(11) DEFAULT NULL,
  `ID_Klas` int(11) DEFAULT NULL,
  `ID_SubKlas` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Laporan` int(11) DEFAULT NULL,
  `ID_LapDetail` int(11) DEFAULT NULL,
  `ID_Agt` int(11) DEFAULT NULL,
  `ID_Calc` int(11) DEFAULT NULL,
  `ID_Simpanan` int(11) DEFAULT NULL,
  `NoUrut_P` int(11) DEFAULT NULL,
  `Kode` varchar(4) DEFAULT NULL,
  `Perkiraan` varchar(50) DEFAULT NULL,
  `SaldoAwal` double DEFAULT NULL,
  `ID_J` int(11) DEFAULT NULL,
  `ID_Unit_J` int(11) DEFAULT NULL,
  `ID_Tipe` int(11) DEFAULT NULL,
  `ID_Dept_J` int(11) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `ID_Bulan` smallint(6) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `Keterangan_J` varchar(60) DEFAULT NULL,
  `ID_Mark` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.tmp__transaksi_rekap
DROP TABLE IF EXISTS `tmp__transaksi_rekap`;
CREATE TABLE IF NOT EXISTS `tmp__transaksi_rekap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jurnal` int(11) DEFAULT NULL,
  `ID_Perkiraan` int(11) DEFAULT NULL,
  `ID_Dept_T` int(11) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `ID_P` int(11) DEFAULT NULL,
  `ID_Klas` int(11) DEFAULT NULL,
  `ID_SubKlas` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Laporan` int(11) DEFAULT NULL,
  `ID_LapDetail` int(11) DEFAULT NULL,
  `ID_Agt` int(11) DEFAULT NULL,
  `ID_Calc` int(11) DEFAULT NULL,
  `ID_Simpanan` int(11) DEFAULT NULL,
  `NoUrut_P` int(11) DEFAULT NULL,
  `Kode` varchar(4) DEFAULT NULL,
  `Perkiraan` varchar(50) DEFAULT NULL,
  `SaldoAwal` double DEFAULT NULL,
  `ID_J` int(11) DEFAULT NULL,
  `ID_Unit_J` int(11) DEFAULT NULL,
  `ID_Tipe` int(11) DEFAULT NULL,
  `ID_Dept_J` int(11) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `ID_Bulan` smallint(6) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `Keterangan_J` varchar(60) DEFAULT NULL,
  `ID_Mark` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.transaksi
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE IF NOT EXISTS `transaksi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Jurnal` int(11) DEFAULT NULL,
  `ID_Perkiraan` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.transaksi_del
DROP TABLE IF EXISTS `transaksi_del`;
CREATE TABLE IF NOT EXISTS `transaksi_del` (
  `ID` int(11) DEFAULT NULL,
  `ID_Jurnal` int(11) DEFAULT NULL,
  `ID_Perkiraan` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Tipe` int(11) DEFAULT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `ID_Bulan` smallint(6) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `Ket` varchar(60) DEFAULT NULL,
  `ID_Mark` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.transaksi_log
DROP TABLE IF EXISTS `transaksi_log`;
CREATE TABLE IF NOT EXISTS `transaksi_log` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_Trans` varchar(50) DEFAULT NULL,
  `Keterangan` text,
  `old_val` varchar(50) DEFAULT NULL,
  `new_val` varchar(50) DEFAULT NULL,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='log transaksi user';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.transaksi_new
DROP TABLE IF EXISTS `transaksi_new`;
CREATE TABLE IF NOT EXISTS `transaksi_new` (
  `ID` int(11) DEFAULT NULL,
  `ID_Jurnal` int(11) DEFAULT NULL,
  `ID_Perkiraan` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Tipe` int(11) DEFAULT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `ID_Bulan` smallint(6) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `Ket` varchar(60) DEFAULT NULL,
  `ID_Mark` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.transaksi_rekap
DROP TABLE IF EXISTS `transaksi_rekap`;
CREATE TABLE IF NOT EXISTS `transaksi_rekap` (
  `ID` int(11) NOT NULL,
  `ID_Jurnal` int(11) DEFAULT NULL,
  `ID_Perkiraan` int(11) DEFAULT NULL,
  `ID_Dept_T` int(11) DEFAULT NULL,
  `Debet` double DEFAULT NULL,
  `Kredit` double DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL,
  `ID_P` int(11) DEFAULT NULL,
  `ID_Klas` int(11) DEFAULT NULL,
  `ID_SubKlas` int(11) DEFAULT NULL,
  `ID_Dept` int(11) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `ID_Laporan` int(11) DEFAULT NULL,
  `ID_LapDetail` int(11) DEFAULT NULL,
  `ID_Agt` int(11) DEFAULT NULL,
  `ID_Calc` int(11) DEFAULT NULL,
  `ID_Simpanan` int(11) DEFAULT NULL,
  `NoUrut_P` int(11) DEFAULT NULL,
  `Kode` varchar(4) DEFAULT NULL,
  `Perkiraan` varchar(50) DEFAULT NULL,
  `SaldoAwal` double DEFAULT NULL,
  `ID_J` int(11) DEFAULT NULL,
  `ID_Unit_J` int(11) DEFAULT NULL,
  `ID_Tipe` int(11) DEFAULT NULL,
  `ID_Dept_J` int(11) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `ID_Bulan` smallint(6) DEFAULT NULL,
  `Tahun` smallint(6) DEFAULT NULL,
  `NoUrut` int(11) DEFAULT NULL,
  `Nomor` varchar(10) DEFAULT NULL,
  `Keterangan_J` varchar(60) DEFAULT NULL,
  `ID_Mark` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.transaksi_temp
DROP TABLE IF EXISTS `transaksi_temp`;
CREATE TABLE IF NOT EXISTS `transaksi_temp` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ID_Unit` int(10) DEFAULT NULL,
  `ID_Dept` int(10) DEFAULT NULL,
  `ID_Klas` int(10) DEFAULT NULL,
  `ID_SubKlas` int(10) DEFAULT NULL,
  `ID_CC` int(10) DEFAULT NULL,
  `ID_Perkiraan` int(10) NOT NULL DEFAULT '0',
  `Debet` double NOT NULL DEFAULT '0',
  `Kredit` double NOT NULL DEFAULT '0',
  `Keterangan` text,
  `ID_Bulan` varchar(50) NOT NULL DEFAULT '',
  `Tahun` varchar(50) NOT NULL DEFAULT '',
  `Tanggal` date DEFAULT '0000-00-00',
  `created_by` varchar(50) NOT NULL,
  `ID_Stat` int(10) DEFAULT '0',
  PRIMARY KEY (`ID_Perkiraan`,`Debet`,`Kredit`,`ID_Bulan`,`Tahun`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='pencatatan transaksi sebelum posting ke jurnal';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.unit_jurnal
DROP TABLE IF EXISTS `unit_jurnal`;
CREATE TABLE IF NOT EXISTS `unit_jurnal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kode` varchar(2) DEFAULT NULL,
  `Unit` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`Unit`),
  KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.useroto
DROP TABLE IF EXISTS `useroto`;
CREATE TABLE IF NOT EXISTS `useroto` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `idmenu` varchar(50) NOT NULL DEFAULT '',
  `c` enum('Y','N') DEFAULT 'N',
  `e` enum('Y','N') DEFAULT 'N',
  `v` enum('Y','N') DEFAULT 'N',
  `p` enum('Y','N') DEFAULT 'N',
  `d` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`idmenu`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `idlevel` varchar(50) DEFAULT NULL,
  `active` enum('Y','N') DEFAULT 'Y',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.user_level
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE IF NOT EXISTS `user_level` (
  `idlevel` int(50) NOT NULL AUTO_INCREMENT,
  `nmlevel` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idlevel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.v_dept_trans
DROP TABLE IF EXISTS `v_dept_trans`;
CREATE TABLE IF NOT EXISTS `v_dept_trans` (
  `ID_Dept` int(10) NOT NULL DEFAULT '0',
  `ID_Klas` int(10) DEFAULT NULL,
  `ID_SubKlas` int(10) DEFAULT NULL,
  `ID_Perkiraan` int(10) NOT NULL DEFAULT '0',
  `ID_Bulan` int(10) NOT NULL DEFAULT '0',
  `ID_Tahun` int(10) NOT NULL DEFAULT '0',
  `SaldoAwal` double DEFAULT '0',
  `Kredit` double DEFAULT '0',
  `Debet` double DEFAULT '0',
  PRIMARY KEY (`ID_Perkiraan`,`ID_Dept`,`ID_Bulan`,`ID_Tahun`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='summary transaksi by simpanan by departemen';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.v_neraca
DROP TABLE IF EXISTS `v_neraca`;
CREATE TABLE IF NOT EXISTS `v_neraca` (
  `ID_Head` int(10) DEFAULT NULL,
  `ID_Jenis` int(10) DEFAULT NULL,
  `ID_SubJenis` int(10) NOT NULL DEFAULT '0',
  `SubJenis` varchar(200) DEFAULT NULL,
  `ID_Calc` int(10) DEFAULT NULL,
  `ID_KBR` int(10) DEFAULT NULL,
  `ID_USP` int(10) DEFAULT NULL,
  `Debet` double DEFAULT '0',
  `Kredit` double DEFAULT '0',
  `SaldoAwal` double DEFAULT '0',
  `SaldoAkhir` double DEFAULT '0',
  PRIMARY KEY (`ID_SubJenis`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='membentuk laporan neraca';

-- Data exporting was unselected.


-- Dumping structure for table setujudb.v_neraca_lajur
DROP TABLE IF EXISTS `v_neraca_lajur`;
CREATE TABLE IF NOT EXISTS `v_neraca_lajur` (
  `ID_Dept` varchar(250) NOT NULL DEFAULT '',
  `SaldoAwal` double DEFAULT '0',
  `Simp_Pokok` double DEFAULT '0',
  `Simp_Wajib` double DEFAULT '0',
  `Simp_Khusus` double DEFAULT '0',
  `Barang` double DEFAULT '0',
  `Pinjaman` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Dept`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table setujudb.v_superuser_neraca_lajur
DROP TABLE IF EXISTS `v_superuser_neraca_lajur`;
CREATE TABLE IF NOT EXISTS `v_superuser_neraca_lajur` (
  `ID_Dept` varchar(250) NOT NULL DEFAULT '',
  `SaldoAwal` double DEFAULT '0',
  `Simp_Pokok` double DEFAULT '0',
  `Simp_Wajib` double DEFAULT '0',
  `Simp_Khusus` double DEFAULT '0',
  `Barang` double DEFAULT '0',
  `Pinjaman` double DEFAULT '0',
  `doc_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Dept`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for trigger setujudb.mst_kas_t_del
DROP TRIGGER IF EXISTS `mst_kas_t_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `mst_kas_t_del` AFTER DELETE ON `mst_kas_harian` FOR EACH ROW BEGIN
	delete from mst_kas_trans where id_trans=old.no_trans;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.mst_kas_t_new
DROP TRIGGER IF EXISTS `mst_kas_t_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `mst_kas_t_new` AFTER INSERT ON `mst_kas_harian` FOR EACH ROW BEGIN
	insert into mst_kas_trans (id_trans,id_kas,tgl_trans,uraian_trans,saldo_kas)
	values(New.no_trans,new.id_kas,new.tgl_kas,'Saldo Awal hari ini',new.sa_kas);
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.pembelian_del
DROP TRIGGER IF EXISTS `pembelian_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `pembelian_del` AFTER DELETE ON `inv_pembelian_detail` FOR EACH ROW BEGIN
	delete from inv_pembelian_rekap where ID=OLD.ID;
	update inv_pembelian set ID_Bayar=(ID_Bayar-(OLD.Jumlah*OLD.Harga_Beli)) where
	ID=OLD.ID_Beli;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.pembelian_new
DROP TRIGGER IF EXISTS `pembelian_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `pembelian_new` AFTER INSERT ON `inv_pembelian_detail` FOR EACH ROW BEGIN
	insert into inv_pembelian_rekap select * from inv_pembelian_detail where ID=New.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.pembelian_upd
DROP TRIGGER IF EXISTS `pembelian_upd`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `pembelian_upd` AFTER UPDATE ON `inv_pembelian_detail` FOR EACH ROW BEGIN
	update inv_pembelian_rekap set jml_faktur=new.jml_faktur,jumlah=new.jumlah,
	harga_beli=round(new.jumlah/new.jml_faktur,-1)
	where id=Old.ID;
	
	/*otomatis update field ID_Bayar)
	update inv_pembelian set ID_Bayar=(ID_Bayar-OLD.Jumlah) where ID=NEW.ID_Beli;
	*/
	update inv_pembelian set ID_Bayar=(ID_Bayar+NEW.Jumlah) where ID=NEW.ID_Beli;

END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.pembelian_upd_bfr
DROP TRIGGER IF EXISTS `pembelian_upd_bfr`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `pembelian_upd_bfr` BEFORE UPDATE ON `inv_pembelian_detail` FOR EACH ROW BEGIN
 UPDATE inv_pembelian set ID_Bayar=(ID_Bayar-OLD.Jumlah)
 WHERE ID=OLD.ID_Beli;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.penjualan_del
DROP TRIGGER IF EXISTS `penjualan_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `penjualan_del` AFTER DELETE ON `inv_penjualan_detail` FOR EACH ROW BEGIN
	delete from inv_penjualan_rekap where ID=OLD.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.penjualan_del_header
DROP TRIGGER IF EXISTS `penjualan_del_header`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `penjualan_del_header` AFTER DELETE ON `inv_penjualan` FOR EACH ROW BEGIN
	delete from inv_penjualan_detail where ID_Jual=OLD.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.penjualan_new
DROP TRIGGER IF EXISTS `penjualan_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `penjualan_new` AFTER INSERT ON `inv_penjualan_detail` FOR EACH ROW BEGIN
	insert into inv_penjualan_rekap
	(ID,ID_Jenis,Tanggal,Bulan,Tahun,ID_Jual,ID_Barang,Jumlah,Harga,Keterangan,no_transaksi)
	values(  
	(select ID from inv_penjualan_detail where ID=NEW.ID),
	(select ID_Jenis from inv_penjualan_detail where ID=NEW.ID),
	(select Tanggal from inv_penjualan where ID=NEW.ID_Jual),
	(select Bulan from inv_penjualan where ID=NEW.ID_Jual),
	(select Tahun from inv_penjualan where ID=NEW.ID_Jual),
	(select ID_Jual from inv_penjualan_detail where ID=NEW.ID),
	(select ID_Barang from inv_penjualan_detail where ID=NEW.ID),
	(select Jumlah from inv_penjualan_detail where ID=NEW.ID),
	(select Harga from inv_penjualan_detail where ID=NEW.ID),
	(select ID_Jenis from inv_penjualan where ID=NEW.ID_Jual)&
	(select Nomor from inv_penjualan where ID=NEW.ID_Jual),
	(select NoUrut from inv_penjualan where ID=NEW.ID_Jual)
	);

END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.penjualan_upd
DROP TRIGGER IF EXISTS `penjualan_upd`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `penjualan_upd` AFTER UPDATE ON `inv_penjualan_detail` FOR EACH ROW BEGIN
update inv_penjualan_rekap set jumlah=new.jumlah,ID_Jenis=NEW.ID_Jenis
where id=NEW.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.penjualan_upd_header
DROP TRIGGER IF EXISTS `penjualan_upd_header`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `penjualan_upd_header` AFTER UPDATE ON `inv_penjualan` FOR EACH ROW BEGIN
	update inv_penjualan_detail set ID_Jenis=NEW.ID_Jenis
	where ID_Jual=NEW.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.transaksi_tmp_del
DROP TRIGGER IF EXISTS `transaksi_tmp_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `transaksi_tmp_del` AFTER DELETE ON `transaksi_temp` FOR EACH ROW BEGIN
/* data yang di delete akan di simpan secara otomatis ke table transaksi log*/
	INSERT INTO transaksi_log 
	(ID_Trans,Keterangan,old_val,new_val,created_by)
	VALUES
	(OLD.ID_Perkiraan,concat('Delete ', OLD.Keterangan),OLD.Debet,OLD.Kredit,(SELECT UUID_SHORT()));

END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.transaksi_tmp_upd
DROP TRIGGER IF EXISTS `transaksi_tmp_upd`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `transaksi_tmp_upd` AFTER UPDATE ON `transaksi_temp` FOR EACH ROW BEGIN
/* data yang di update akan di simpan secara otomatis ke table transaksi log*/
	INSERT INTO transaksi_log 
	(ID_Trans,Keterangan,old_val,new_val,created_by)
	VALUES
	(NEW.ID_Perkiraan,concat('Update ', OLD.Keterangan),OLD.Debet,OLD.Kredit,NEW.Created_by);

END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_alamat_new
DROP TRIGGER IF EXISTS `t_alamat_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_alamat_new` AFTER INSERT ON `mst_anggota` FOR EACH ROW BEGIN
	replace into mst_kota(kota_anggota) values(New.Kota);
	replace into mst_propinsi(prop_anggota) values(NEW.Propinsi);
	/*buat akun perkiraan
	 akun Simp.Pokok
	*/
	insert into perkiraan
		(ID_Klas,ID_SubKlas,ID_Dept,ID_Unit,ID_Laporan,ID_LapDetail,
		 ID_Agt,ID_Calc,ID_Simpanan,NoUrut,SaldoAwal)
		values(
		(select ID_Klasifikasi from jenis_simpanan where ID='1'),
		(select ID_SubKlas from jenis_simpanan where ID='1'),
		NEW.ID_Dept,
		(select ID_Unit from jenis_simpanan where ID='1'),
		(select ID_Laporan from jenis_simpanan where ID='1'),
		(select ID_LapDetail from jenis_simpanan where ID='1'),
		NEW.ID,
		(select ID_Calc from jenis_simpanan where ID='1'),
		'1','0','0') ;
  /*Simp.Wajib  */
	insert into perkiraan
		(ID_Klas,ID_SubKlas,ID_Dept,ID_Unit,ID_Laporan,ID_LapDetail,
		 ID_Agt,ID_Calc,ID_Simpanan,NoUrut,SaldoAwal)
		values(
		(select ID_Klasifikasi from jenis_simpanan where ID='2'),
		(select ID_SubKlas from jenis_simpanan where ID='2'),
		NEW.ID_Dept,
		(select ID_Unit from jenis_simpanan where ID='2'),
		(select ID_Laporan from jenis_simpanan where ID='2'),
		(select ID_LapDetail from jenis_simpanan where ID='2'),
		NEW.ID,
		(select ID_Calc from jenis_simpanan where ID='2'),
		'2','0','0') ;
  /*Simp.Khusus  */
	insert into perkiraan
		(ID_Klas,ID_SubKlas,ID_Dept,ID_Unit,ID_Laporan,ID_LapDetail,
		 ID_Agt,ID_Calc,ID_Simpanan,NoUrut,SaldoAwal)
		values(
		(select ID_Klasifikasi from jenis_simpanan where ID='3'),
		(select ID_SubKlas from jenis_simpanan where ID='3'),
		NEW.ID_Dept,
		(select ID_Unit from jenis_simpanan where ID='3'),
		(select ID_Laporan from jenis_simpanan where ID='3'),
		(select ID_LapDetail from jenis_simpanan where ID='3'),
		NEW.ID,
		(select ID_Calc from jenis_simpanan where ID='3'),
		'3','0','0') ;
 
  /*Pinjaman,Barang  */
	insert into perkiraan
		(ID_Klas,ID_SubKlas,ID_Dept,ID_Unit,ID_Laporan,ID_LapDetail,
		 ID_Agt,ID_Calc,ID_Simpanan,NoUrut,SaldoAwal)
		values(
		(select ID_Klasifikasi from jenis_simpanan where ID='4'),
		(select ID_SubKlas from jenis_simpanan where ID='4'),
		NEW.ID_Dept,
		(select ID_Unit from jenis_simpanan where ID='4'),
		(select ID_Laporan from jenis_simpanan where ID='4'),
		(select ID_LapDetail from jenis_simpanan where ID='4'),
		NEW.ID,
		(select ID_Calc from jenis_simpanan where ID='4'),
		'4','0','0') ;
 
  /*Barang  */
	insert into perkiraan
		(ID_Klas,ID_SubKlas,ID_Dept,ID_Unit,ID_Laporan,ID_LapDetail,
		 ID_Agt,ID_Calc,ID_Simpanan,NoUrut,SaldoAwal)
		values(
		(select ID_Klasifikasi from jenis_simpanan where ID='5'),
		(select ID_SubKlas from jenis_simpanan where ID='5'),
		NEW.ID_Dept,
		(select ID_Unit from jenis_simpanan where ID='5'),
		(select ID_Laporan from jenis_simpanan where ID='5'),
		(select ID_LapDetail from jenis_simpanan where ID='5'),
		NEW.ID,
		(select ID_Calc from jenis_simpanan where ID='5'),
		'5','0','0') ;

	/*limit pinjaman*/
	replace into pinjaman_limit (ID_Agt,Tahun,max_limit) values(NEW.ID,year(NEW.TanggalMasuk),New.Status);
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_alamat_upd
DROP TRIGGER IF EXISTS `t_alamat_upd`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_alamat_upd` AFTER UPDATE ON `mst_anggota` FOR EACH ROW BEGIN
	update mst_kota set kota_anggota=New.Kota where kota_anggota=OLD.Kota;
	update mst_propinsi set prop_anggota=NEW.Propinsi where prop_anggota=OLD.Propinsi;
	replace into pinjaman_limit (ID_Agt,Tahun,max_limit) values(NEW.ID,year(NEW.TanggalMasuk),New.Status);

END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_barang_del
DROP TRIGGER IF EXISTS `t_barang_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_barang_del` AFTER DELETE ON `inv_barang` FOR EACH ROW BEGIN
	delete from inv_konversi where id_barang=old.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_barang_new
DROP TRIGGER IF EXISTS `t_barang_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_barang_new` AFTER INSERT ON `inv_barang` FOR EACH ROW BEGIN
 insert into inv_konversi (id_barang,nm_barang,nm_satuan,sat_beli,isi_konversi) 
 values(NEW.ID,NEW.Nama_Barang,NEW.ID_Satuan,NEW.ID_Satuan,'1');
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_barang_upd
DROP TRIGGER IF EXISTS `t_barang_upd`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_barang_upd` AFTER UPDATE ON `inv_barang` FOR EACH ROW BEGIN
	update inv_konversi set nm_barang=New.Nama_Barang,nm_satuan=New.ID_Satuan,
	sat_beli=New.ID_Satuan
	where ID_Barang=OLD.ID and
	sat_beli=OLD.ID_Satuan;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_pinjaman_del
DROP TRIGGER IF EXISTS `t_pinjaman_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_pinjaman_del` AFTER DELETE ON `pinjaman` FOR EACH ROW BEGIN
	delete from pinjaman_bayar where ID_pinjaman=OLD.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_pinjaman_new
DROP TRIGGER IF EXISTS `t_pinjaman_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_pinjaman_new` AFTER INSERT ON `pinjaman` FOR EACH ROW BEGIN
insert into pinjaman_bayar (
  ID_pinjaman,ID_Agt,Tanggal,Tahun,Debet,saldo,keterangan) (
	select ID,ID_Agt,Tanggal,Tahun,jml_pinjaman,jml_pinjaman,keterangan
	from pinjaman where ID=NEW.ID);
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_pinjaman_upd
DROP TRIGGER IF EXISTS `t_pinjaman_upd`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_pinjaman_upd` AFTER UPDATE ON `pinjaman` FOR EACH ROW BEGIN
	replace into pinjaman_bayar (
  	ID_pinjaman,ID_Agt,Tanggal,Tahun,Debet,saldo,keterangan) (
	select ID,ID_Agt,Tanggal,Tahun,jml_pinjaman,jml_pinjaman,keterangan
	from pinjaman where ID=OLD.ID);

END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_setup_simpanan_log
DROP TRIGGER IF EXISTS `t_setup_simpanan_log`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_setup_simpanan_log` AFTER UPDATE ON `setup_simpanan` FOR EACH ROW BEGIN
insert into set_simpanan_log  select * from setup_simpanan where id_simpanan=OLD.id_simpanan;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_SimpSumDept_new
DROP TRIGGER IF EXISTS `t_SimpSumDept_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_SimpSumDept_new` AFTER INSERT ON `transaksi_new` FOR EACH ROW begin
	/*update table v_dept_trans (rekap transaksi per departemen)*/
end//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_transaksi_del
DROP TRIGGER IF EXISTS `t_transaksi_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_transaksi_del` AFTER DELETE ON `transaksi` FOR EACH ROW begin
/* 
jika data pada tabel transaksi di hapus otomatis data pada tabel transaksi new 
akan terhapus juga dan data yang di delete akan di simpan secara otomatis ke table transaksi log
dan jika no_perkiraan sesuai dengan di table temp stat akan kembali ke 0*/
delete from transaksi_new where ID=OLD.ID;
insert into transaksi_log (ID_trans,Keterangan,old_val,new_val) values(OLD.ID_Jurnal,concat('Delete ',OLD.Keterangan),OLD.Debet,OLD.Kredit);
update transaksi_temp set ID_stat='0' where ID_Perkiraan=OLD.ID_Perkiraan;
end//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_transaksi_new
DROP TRIGGER IF EXISTS `t_transaksi_new`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_transaksi_new` AFTER INSERT ON `transaksi` FOR EACH ROW begin
/* jika ada data baru di tabel transaksi akan tersimpan juga di table traksaksi new
Tabel transaksi new digunakan untuk mempermudah dan mempersingkat loading data*/

INSERT into transaksi_new 
	(ID,ID_Jurnal,ID_Perkiraan,ID_Dept,Debet,Kredit,Keterangan,
	 ID_Unit,ID_Tipe,Tanggal,ID_Bulan,Tahun,NoUrut,Nomor,Ket,ID_Mark)
	values
	(New.ID,New.ID_Jurnal,New.ID_Perkiraan,New.ID_Dept,
	New.Debet,New.Kredit,New.Keterangan,
	(select ID_Unit from jurnal where ID=new.ID_Jurnal),
	(select ID_Tipe from jurnal where ID=new.ID_Jurnal),
	(select Tanggal from jurnal where ID=new.ID_Jurnal),
	(select ID_Bulan from jurnal where ID=new.ID_Jurnal),
	(select Tahun from jurnal where ID=new.ID_Jurnal),
	(select NoUrut from jurnal where ID=new.ID_Jurnal),
	(select Nomor from jurnal where ID=new.ID_Jurnal),
	(select Keterangan from jurnal where ID=new.ID_Jurnal),
	(select ID_Mark from jurnal where ID=new.ID_Jurnal)
	);
	
end//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_transaksi_new_del
DROP TRIGGER IF EXISTS `t_transaksi_new_del`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_transaksi_new_del` AFTER DELETE ON `transaksi_new` FOR EACH ROW BEGIN
/* data yang di delete akan di simpan secara otomatis ke table transaksi_del
untuk keperluan restore jika diperlukan
*/
insert into transaksi_del select * from transaksi_new where ID=OLD.ID;
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger setujudb.t_transaksi_upd
DROP TRIGGER IF EXISTS `t_transaksi_upd`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_transaksi_upd` AFTER UPDATE ON `transaksi` FOR EACH ROW begin
/* 
	Jika table transaksi mengalami update akan otomatis data yang sama di table
	transaksi_new juga akan otomatis ter update
*/
replace into transaksi_new 
	(ID,ID_Jurnal,ID_Perkiraan,ID_Dept,Debet,Kredit,Keterangan,
	 ID_Unit,ID_Tipe,Tanggal,ID_Bulan,Tahun,NoUrut,Nomor,Ket,ID_Mark)
	values
	(New.ID,New.ID_Jurnal,New.ID_Perkiraan,New.ID_Dept,
	New.Debet,New.Kredit,New.Keterangan,
	(select ID_Unit from jurnal where ID=new.ID_Jurnal),
	(select ID_Tipe from jurnal where ID=new.ID_Jurnal),
	(select Tanggal from jurnal where ID=new.ID_Jurnal),
	(select ID_Bulan from jurnal where ID=new.ID_Jurnal),
	(select Tahun from jurnal where ID=new.ID_Jurnal),
	(select NoUrut from jurnal where ID=new.ID_Jurnal),
	(select Nomor from jurnal where ID=new.ID_Jurnal),
	(select Keterangan from jurnal where ID=new.ID_Jurnal),
	(select ID_Mark from jurnal where ID=new.ID_Jurnal)
	);
insert into transaksi_log (ID_trans,Keterangan,old_val,new_val) values(OLD.ID_Jurnal,'Hapus',OLD.Debet,OLD.Kredit);	
end//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
