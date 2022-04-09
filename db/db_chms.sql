-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.26 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_chms
CREATE DATABASE IF NOT EXISTS `db_chms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_chms`;

-- Dumping structure for table db_chms.master_status
CREATE TABLE IF NOT EXISTS `master_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table db_chms.master_status: 5 rows
/*!40000 ALTER TABLE `master_status` DISABLE KEYS */;
INSERT INTO `master_status` (`id`, `name_status`) VALUES
	(1, 'Diterima'),
	(2, 'Ditolak'),
	(3, 'Dalam Proses'),
	(4, 'Dalam Antrian'),
	(5, 'Selesai');
/*!40000 ALTER TABLE `master_status` ENABLE KEYS */;

-- Dumping structure for table db_chms.pelaporan
CREATE TABLE IF NOT EXISTS `pelaporan` (
  `ticket` char(15) NOT NULL,
  `rekening` char(10) DEFAULT NULL,
  `nama_pelapor` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telp` char(12) DEFAULT NULL,
  `alamat` text,
  `jenis_keluhan` char(8) DEFAULT NULL,
  `keluhan` text,
  `tanggal_laporan` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `penerima_laporan` varchar(50) DEFAULT NULL,
  `tgl_terima` varchar(50) DEFAULT NULL,
  `otorisator` varchar(50) DEFAULT NULL,
  `tgl_otorisator` varchar(50) DEFAULT NULL,
  `keterangan_penerima` text,
  `keterangan_otorisator` text,
  PRIMARY KEY (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table db_chms.pelaporan: 1 rows
/*!40000 ALTER TABLE `pelaporan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelaporan` ENABLE KEYS */;

-- Dumping structure for table db_chms.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(12) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(36) DEFAULT NULL,
  `role` enum('Officer','Otorisator','Administrator') DEFAULT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table db_chms.user: 3 rows
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `username`, `password`, `role`, `nama_lengkap`) VALUES
	('1', 'dika', 'dika1234', 'Administrator', 'Dika Fahrozy'),
	('2', 'mjcs', 'mjcs1', 'Officer', 'Marisca OFC'),
	('3', 'dcso', 'dcso1', 'Otorisator', 'Andika CSO');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
