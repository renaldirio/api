-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 04:57 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id16443112_db_akb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan_menu`
--

CREATE TABLE `bahan_menu` (
  `id_bahan` int(50) NOT NULL,
  `nama_bahan` varchar(255) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `unit_bahan` varchar(10) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `jml_bahanTersedia` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1256 COLLATE=cp1256_nopad_bin;

--
-- Dumping data for table `bahan_menu`
--

INSERT INTO `bahan_menu` (`id_bahan`, `nama_bahan`, `unit_bahan`, `jml_bahanTersedia`) VALUES
(8, 'Beef Short Plate', 'Plate', 75),
(10, 'Squid', 'Bowl', 300),
(11, 'Tenderloin', 'Plate', 80),
(12, 'Rice', 'Bowl', 825),
(14, 'Saos', 'Mini Bowl', 200),
(15, 'Mineral Water', 'Bottle', 800),
(20, 'Orange Juice', 'Glass', 200),
(21, 'Ocha', 'Glass', 200);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp_customer` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `email_customer`, `telp_customer`) VALUES
(6, 'Rivaldo', 'Rivaldo23@gmail.com', '08987645553'),
(7, 'Rio', 'Rioahmad99@gmail.com', '081245796678'),
(8, 'DamanAdi', 'AdiDamar24@gmail.com', '085986432257'),
(9, 'Usman', 'Usmansantoso5@gmail.com', '089776542187'),
(10, 'Milka Citra', 'Milkacitra88@gmail.com', '081645438498'),
(11, 'Dimas Diponegoro', 'DimasDip66@gmail.com', '089448385464'),
(12, 'Anam Wicaksono', 'AmanWicak77@gmail.com', '0857743437765'),
(13, 'Olive Yudar', 'OliveYudar99@gmail.com', '081266894835');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detailTransaksi` int(11) NOT NULL,
  `nama_pesanan` varchar(255) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `jml_item` int(50) DEFAULT NULL,
  `status_pesanan` varchar(50) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `harga_subtotal` double DEFAULT NULL,
  `id_transaksi` int(50) DEFAULT NULL,
  `id_menu` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1256 COLLATE=cp1256_nopad_bin;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detailTransaksi`, `nama_pesanan`, `jml_item`, `status_pesanan`, `harga_subtotal`, `id_transaksi`, `id_menu`) VALUES
(1, 'bombocar', 2, 'dimasak', 2, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `histori_bahan`
--

CREATE TABLE `histori_bahan` (
  `id_histori` varchar(50) COLLATE cp1256_nopad_bin NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jml_terbuang` int(50) DEFAULT NULL,
  `jml_habis` int(50) DEFAULT NULL,
  `id_bahan` varchar(50) COLLATE cp1256_nopad_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1256 COLLATE=cp1256_nopad_bin;

-- --------------------------------------------------------

--
-- Table structure for table `info_kartu`
--

CREATE TABLE `info_kartu` (
  `no_kartu` varchar(50) COLLATE cp1256_nopad_bin NOT NULL,
  `tipe_kartu` varchar(25) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `nama_pemilik` varchar(255) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `kode_verif` varchar(50) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `exp_kartu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1256 COLLATE=cp1256_nopad_bin;

--
-- Dumping data for table `info_kartu`
--

INSERT INTO `info_kartu` (`no_kartu`, `tipe_kartu`, `nama_pemilik`, `kode_verif`, `exp_kartu`) VALUES
('510812 648487 5102', 'Debit', 'Kiayada', '1447', '2006-01-22'),
('5159035835512884', 'CC', 'Darryl', '7900', '2003-06-20'),
('517093 1568415003', 'Debit', 'Tiger', '2936', '2026-08-21'),
('5183321715927990', 'CC', 'Justina', '4350', '2002-02-22'),
('5246 3716 0673 5601', 'CC', 'Len', '2782', '2005-10-20'),
('5286156576296069', 'Debit', 'Mari', '2416', '2022-04-21'),
('534 55723 38647 564', 'CC', 'Christen', '8091', '2013-12-21'),
('535080 1345293860', 'CC', 'Nathan', '6377', '2013-01-21'),
('5358839391773502', 'CC', 'Shannon', '6525', '2002-03-22'),
('540344 7583579011', 'Debit', 'Elvis', '2382', '2023-01-22'),
('542109 423756 7873', 'CC', 'Kaitlin', '1995', '2025-01-21'),
('546052 101693 3977', 'CC', 'Fuller', '7721', '2015-09-21'),
('547108 0391742799', 'CC', 'Henry', '7251', '2022-01-22'),
('547176 069196 3753', 'Debit', 'Maggie', '4065', '2008-04-21'),
('552338 6257934919', 'CC', 'Blythe', '3338', '2014-06-20'),
('5531 6711 5155 4966', 'CC', 'Carolyn', '2478', '2014-12-21'),
('554434 535369 3840', 'Debit', 'Madeson', '9127', '2021-10-21'),
('555590 929003 3836', 'Debit', 'John', '5614', '2012-11-20'),
('5572 7939 1631 3064', 'Debit', 'Laurel', '4689', '2001-08-20'),
('558061 641803 4575', 'Debit', 'Griffin', '1380', '2015-07-21');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(50) NOT NULL,
  `nama_jabatan` varchar(255) COLLATE cp1256_nopad_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1256 COLLATE=cp1256_nopad_bin;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'Waiter'),
(2, 'Owner'),
(3, 'Operational Manager'),
(4, 'Cashier'),
(5, 'Chef');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk_karyawan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp_karyawan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_karyawan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_bergabung` date NOT NULL,
  `status_karyawan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `jk_karyawan`, `telp_karyawan`, `email_karyawan`, `password`, `tgl_bergabung`, `status_karyawan`, `id_jabatan`) VALUES
(1, 'Agung', 'Laki-laki', '081231231414', 'owner@gmail.com', '$2y$10$4.R/V.8KLtx0ecbXPSJImeQjIqEM78Y3AfCo4fWSQFyDzHiEpWWXW', '2018-11-12', 'Aktif', 2),
(3, 'Mardi', 'Laki-laki', '081231231414', 'waiter@gmail.com', '$2y$10$FvYykU1OXZzchQLitV20SOUZkRKtOIhEtnqVgDGyxfOWXT/Z0a5D2', '2018-11-15', 'Aktif', 1),
(4, 'Soleh', 'Laki-laki', '0807986988', 'om@gmail.com', '$2y$10$AEKh/JbOyNJhWkPoh/EE.eD/CW5rtnnb/P5IPgLhhb7HEiz0K6yvS', '2021-04-08', 'Aktif', 3),
(5, 'Agnes', 'Perempuan', '081231231231', 'cashier@gmail.com', '$2y$10$Foxizcdq0lMi/4Ec/Ib/pO5YByHXOGaie3sW8gSTye2xI8pKdaaFG', '2021-04-16', 'Aktif', 4),
(6, 'Putri', 'Perempuan', '087123123123', 'chef@gmail.com', '$2y$10$6GDw90eXmrtzlc053Lnw6u/MLch6K2YY6U0YUeEFZlFMNeyMUf2xq', '2021-04-22', 'Aktif', 5),
(7, 'Fitroh', 'Laki-laki', '081231232322', 'kokom@gmail.com', '$2y$10$K3wkqCxfMAbdc3VQV.n3NOIw7rYlHPa9.mWAvrWsXCEAV3AknJ2xG', '2021-04-29', 'Non-Aktif', 3),
(8, 'as', 'Laki-laki', '08028388399', 'asda@gmail.com', '$2y$10$GbnzA0BagtFJ4QxfNA3TIu9sVltpioUeExIHctKbWgygf5llKVA5G', '2021-06-02', 'Non-Aktif', 1);

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `id_meja` int(50) NOT NULL,
  `no_meja` bigint(255) DEFAULT NULL,
  `status_meja` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id_meja`, `no_meja`, `status_meja`) VALUES
(1, 1, 'Tidak Tersedia'),
(2, 2, 'Tidak Tersedia'),
(3, 3, 'Tersedia'),
(4, 4, 'Tidak Tersedia'),
(5, 5, 'Tidak Tersedia'),
(6, 6, 'Tidak Tersedia'),
(7, 7, 'Tersedia'),
(16, 8, 'Tidak Tersedia'),
(17, 9, 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(50) NOT NULL,
  `nama_menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_menu` int(50) NOT NULL,
  `id_bahan` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `kategori_menu`, `unit_menu`, `deskripsi_menu`, `harga_menu`, `id_bahan`) VALUES
(6, 'Beef Short Plate', 'Menu Utama', 'Plate', 'Potongan daging sapi dengan otot dan lemak yang membandel', 20000, 8),
(7, 'Squid', 'Menu Utama', 'Plate', 'Potongan daging cumi dengan rempah sisa', 20000, 10),
(8, 'Rice', 'Menu Utama', 'Bowl', 'Nasi putih hangat sehangat memakai jaket', 4000, 12),
(10, 'Saos', 'Side Dish', 'Mini Bowl', 'saos pedas manis asem banget', 0, 14),
(11, 'Mineral Water 600 ml', 'Minuman', 'Bottle', 'minuman enak asli pegunungan', 6000, 15);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('017ed2ff3538da992e2061d83dc75eaf29ec21e25754f184c571554369fd0502b7e7e367407bca60', 4, 7, 'Authentication Token', '[]', 0, '2021-05-20 06:11:14', '2021-05-20 06:11:14', '2022-05-20 13:11:14'),
('06e20f785deafa7e330d7a99a611f1618d55bbacadea77318454e33752f2540c87b3487b730fea85', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 05:53:51', '2021-05-20 05:53:51', '2022-05-20 12:53:51'),
('0842a46057b3fffa9173362f546fcd1370a7fb54db695dbb1940f84e6800e54e8d0dbaabc6beefb8', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 23:40:06', '2021-05-19 23:40:06', '2022-05-20 06:40:06'),
('0a3f16cc6eb15a9293a7a8937e4966d713d3e1c7bc6628a674e04246cb01ca213f5e304267b27f4e', 6, 7, 'Authentication Token', '[]', 0, '2021-05-20 05:54:41', '2021-05-20 05:54:41', '2022-05-20 12:54:41'),
('0b692a8569081dff4646b914d1ddbb85d190d9de01b0d7925497bb1a285392352728979b14d4f519', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:37:16', '2021-04-29 08:37:16', '2022-04-29 15:37:16'),
('0b796b0a4fdad03d54837761e09fbcceb4b94e5187151059e09257f3b4a0b0e7553ff8047a071012', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:50:23', '2021-04-29 08:50:23', '2022-04-29 15:50:23'),
('0dc1fc903e42331716ccb089b2c75e707c67b588f5fc222f49fc27e0966d17edef981dee5be1cf58', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:23:24', '2021-05-20 07:23:24', '2022-05-20 14:23:24'),
('111d42784e6ddab79048c183c54319e1ca87458a5428dfba98bfe89eb03a85726a3daa05eb93a53e', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:44:06', '2021-04-29 08:44:06', '2022-04-29 15:44:06'),
('118e736cb3be0dae96ce3b531cc842a7d7758caf74ac8bb42d0d7a2ad6a338ccce0b11e07c21ffc3', 3, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:16:20', '2021-05-20 07:16:20', '2022-05-20 14:16:20'),
('142347141cc89b469fcb7d3d0a97ac03e772af4534d732622e42df4f79493d212509a2dff4256ec0', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:03:13', '2021-04-29 10:03:13', '2022-04-29 17:03:13'),
('180c22492b404b92c8fcb4ca561410773979e523ffe3f50d87f3205ea0575e901d99ef3028ef3aac', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 06:37:10', '2021-05-20 06:37:10', '2022-05-20 13:37:10'),
('1d10c402c3d08cda372e9c18053d5c1d4148ffdb396703e2c2fecf1b9a77f271d0aa3cd267edb13a', 4, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:33:50', '2021-05-20 07:33:50', '2022-05-20 14:33:50'),
('1f3a6fbbcc9f3a093c86a42be7d071223d2cb4f7d60a77a6f9970af6ee5f4922dc9644d8bc8ceac6', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:01:33', '2021-04-29 10:01:33', '2022-04-29 17:01:33'),
('21d803bb1561d109e4b47f2ce714111fee7a38c39aaa064af33c5d40be64c12fddd9772d42d91a1f', 3, 3, 'Authentication Token', '[]', 0, '2021-04-29 06:07:37', '2021-04-29 06:07:37', '2022-04-29 13:07:37'),
('23f1b57cd58855a54a9ff90fdb2245b103dee3073e1df45e8a2c29f8d4d7e2d2071692ca04b5adad', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:50:01', '2021-04-29 09:50:01', '2022-04-29 16:50:01'),
('24ba5389f9b166a713d7b34c58f159da1489dcf764cb1d13b156869c32c9ba09d6b412634680d8d7', 3, 3, 'Authentication Token', '[]', 0, '2021-04-29 06:03:32', '2021-04-29 06:03:32', '2022-04-29 13:03:32'),
('2b0a6868d880723155ff4a81d4728924f5e6c317cdaadf8ea100450ca95fa988048f115010e07fab', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:51:36', '2021-04-29 09:51:36', '2022-04-29 16:51:36'),
('2b1a7bd935e3b5a8a6ba41878b11400f074da3e8294cbd4318dcb00ade187450f7e4ca9de469b976', 3, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:52:15', '2021-04-29 08:52:15', '2022-04-29 15:52:15'),
('2fc0f5a5464fc9f239f6c46a4d89ed092189f37461d000a00352439f85f1cc2a143866af4c5f28b8', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 00:11:19', '2021-04-29 00:11:19', '2022-04-29 07:11:19'),
('3184e42c74c7f621643ae8f2b02da1e89b0e761b3a7a0c9d083256a38936a09c18610cb9ebbb5580', 3, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:02:43', '2021-04-29 10:02:43', '2022-04-29 17:02:43'),
('333b390219a1e1d64a87b946dd62326f7179dac4cbe57de2b750dc1068e1ffc891b4369a287e822b', 6, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:16:52', '2021-05-20 07:16:52', '2022-05-20 14:16:52'),
('36154a9397210d11379ba41019fb1c94d6ae552388efb71986d1abc1f4f649e49f6c6e4590fcb3c8', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:31:51', '2021-05-20 07:31:51', '2022-05-20 14:31:51'),
('3c13a513a433ecb2c30eb2ba94165c5a85cc2312939c2692cb972bf86385c0b2e358fd9cf99cbedb', 4, 3, 'Authentication Token', '[]', 0, '2021-05-20 02:41:49', '2021-05-20 02:41:49', '2022-05-20 09:41:49'),
('3ccf290f1565fbab2afbd3898ff4bce7c37e110622e323709e2eb433229c50dfabe029d0d00c0eda', 1, 3, 'Authentication Token', '[]', 0, '2021-04-28 23:52:26', '2021-04-28 23:52:26', '2022-04-29 06:52:26'),
('3e077818766283c4c49b0b591c96adbe48ce79b4d1fc5340446013275e3096d29190806699ea7ce9', 6, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:32:24', '2021-05-20 07:32:24', '2022-05-20 14:32:24'),
('4192838202e8a9962d04492b8510bab49a054894e986655b9754a6374e1d73bd030bec37359e5001', 4, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:18:12', '2021-05-20 07:18:12', '2022-05-20 14:18:12'),
('4193337ced09306c54f015b3551f729687ed22bc705f4c86f5973582c2378c744d3189e537bde4b0', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:30:20', '2021-05-20 07:30:20', '2022-05-20 14:30:20'),
('4452c57d69756a2e948bd8338c169d5d89ec1a7075ef7c59ab6faa041e6e303c291e9c639034c1d7', 0, 3, 'Authentication Token', '[]', 0, '2021-04-28 18:35:12', '2021-04-28 18:35:12', '2022-04-29 01:35:12'),
('46e8ce527266744335512f37ab9e53c7f0ba82812aa838935c0c3b9197c417c2f5d16ee257233f51', 7, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:31:42', '2021-04-29 10:31:42', '2022-04-29 17:31:42'),
('480b112aadeca4e4cabbc6014465edaa27aa8445abd1ade5ef987fc66daf022fce8369cfa22d9452', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:37:12', '2021-04-29 08:37:12', '2022-04-29 15:37:12'),
('4a5a4f97df9301cca4e76d70ea77caba5cf66e2c8d1f909e9b5c261e33ab03483ac9d8418a69e591', 5, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:52:25', '2021-04-29 09:52:25', '2022-04-29 16:52:25'),
('4aee4ced35f79861e9591feb542ec3834883f63dbf35d392e2a4e9ec7dbd3e2cdb9a942e3215f402', 4, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:08:14', '2021-05-20 07:08:14', '2022-05-20 14:08:14'),
('4c6390fbdd25aaeb704f17954003db978e03683c1f18be06a21b41e1a7795686f2a065f0549f96c6', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:44:07', '2021-04-29 08:44:07', '2022-04-29 15:44:07'),
('4d17226dba89c6967651de19e70af3d37d63c98296e12795a63482a8f205efa979f29d774575e5fe', 5, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:12:05', '2021-04-29 09:12:05', '2022-04-29 16:12:05'),
('551b19173a252559c7c8f9e797d3afcdaefd80882c009894f1019c4bdee486cb8979cd1f3c9bb689', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:58:29', '2021-04-29 09:58:29', '2022-04-29 16:58:29'),
('5ce92eb33d60926916355f7a0e6e4e2e6c3586d7037d20265c670cfa304ab4cc95876bd3f4e8e230', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:32:14', '2021-04-29 10:32:14', '2022-04-29 17:32:14'),
('661fdf6f53317d1bc1df998295fbf0d289b19ba2de2c7d37225f6db609488b7953176d2959b16f08', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:27:14', '2021-04-29 10:27:14', '2022-04-29 17:27:14'),
('66ab4f24166dd153cbf515f52ee8831f96732fd3236ca24b753029d40a6bf21b6b3766f55e46df09', 3, 7, 'Authentication Token', '[]', 0, '2021-05-20 05:54:24', '2021-05-20 05:54:24', '2022-05-20 12:54:24'),
('69cdd0dce9469a0f21799f8056fab2e833cde173deaf011887adf770494cf4a350f3aaff5d321200', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:12:47', '2021-05-20 07:12:47', '2022-05-20 14:12:47'),
('6c887ed1cb6c5aac7d30ca54b7a83b581de714c5d3e485a4ed111c48ff795177d96f2ae02566c0d8', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 02:50:30', '2021-05-19 02:50:30', '2022-05-19 09:50:30'),
('6f5b54a920ed86433623b4384e2606b81732e7e78476c0e97210a649dd11a3912e6ee61f3a9e99b2', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:54:16', '2021-04-29 09:54:16', '2022-04-29 16:54:16'),
('73d0eb7b2e9b2cf54ddf341d839a4e3b098bd122b64836a803fa044ea0f57470074f83bda7223104', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:30:02', '2021-04-29 10:30:02', '2022-04-29 17:30:02'),
('73d639c9df7b1c0dfef4654287e57c02eda3c2944ca88fd724a2fe61e59fd77af9c70751f46e5f2d', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:47:33', '2021-04-29 08:47:33', '2022-04-29 15:47:33'),
('799e0b9f7d9a94120495a6b1656a8c8ac17f7a9cecd8b0438ad31737fa0cf78c1ecc0d014ece386d', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:40:07', '2021-05-20 07:40:07', '2022-05-20 14:40:07'),
('7bd9f3e702e83077fe6a34a6d1b2b95887712f9eb30583708f776508d5819bb0f3d2f284a1f519dc', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:51:54', '2021-04-29 09:51:54', '2022-04-29 16:51:54'),
('7cf5c1fe71604d2b6be9768b038c8dbad2c08490d557642f48be9830e4a83a00ca5b9e4ceaecfaa2', 4, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:43:25', '2021-05-20 07:43:25', '2022-05-20 14:43:25'),
('7f5a3754f1165f927ce0018b641d3f75003467e5b9e2e7708a3f674cebb3c7364690c36404a749bd', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:23:44', '2021-04-29 10:23:44', '2022-04-29 17:23:44'),
('80a3f6622749c1f44e4a3c8d0e8096f65a86e3107c1560af96811417a91cdb65f548e27cfc18ba6b', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 23:36:51', '2021-05-19 23:36:51', '2022-05-20 06:36:51'),
('81ef5bb6361dbb5cc1cc9d3cb68bf4fb912c107ce719f4fd23762927743a21a271795c8575855629', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 03:58:42', '2021-04-29 03:58:42', '2022-04-29 10:58:42'),
('8529a8c7742766a3379ca7898dababa41d9e11e52e2886c804d04f89bec6659b7348cf9bfcb053da', 3, 3, 'Authentication Token', '[]', 0, '2021-04-29 06:02:22', '2021-04-29 06:02:22', '2022-04-29 13:02:22'),
('86dc44ada98fa364ed2fa2eaff23b57008e689acc00cfe957fdf1180c32244ecf277f404878dce3b', 3, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:24:58', '2021-05-20 07:24:58', '2022-05-20 14:24:58'),
('8819b02c3f8d1c0c633f102d9cfd685bb116869df93ad9eb8fa57130d3445caa9ba846214de37685', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:02:01', '2021-04-29 10:02:01', '2022-04-29 17:02:01'),
('8928b9725f9b1e16c2b8bfc13d003cfc2d976081a48da7b1b00220f0426a533fa31aff13818111b2', 4, 7, 'Authentication Token', '[]', 0, '2021-06-02 02:03:42', '2021-06-02 02:03:42', '2022-06-02 09:03:42'),
('8da7b349d54028e9b95a1f0ddd4d0da333619e3ae5b5248ad4aaf22ccaae0853c3e477deac1399b8', 3, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:28:14', '2021-04-29 10:28:14', '2022-04-29 17:28:14'),
('8f1bdd95ffaed6a3e9d8fb1485e7b9d2ee36dec4620ce7e0f1f439eb4a9d6ce2196337817509f5c0', 6, 7, 'Authentication Token', '[]', 0, '2021-05-20 05:56:11', '2021-05-20 05:56:11', '2022-05-20 12:56:11'),
('9062502ee28c740cff512c3cdd5c41ba1dfad8498af82085c12098c8b74173f75096a120cd2e2ccc', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 04:22:52', '2021-05-19 04:22:52', '2022-05-19 11:22:52'),
('94452b0e3634878d858caa5a86601c4be6f8855b1b830be6952679c2933f7ac6b14c35159a8e8326', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 07:03:45', '2021-04-29 07:03:45', '2022-04-29 14:03:45'),
('9579b6e969ea69ab4929bd25c6fc2646d953f4cf430d0d6ecb51fa45c82fede740c9a5d1f156a731', 4, 7, 'Authentication Token', '[]', 0, '2021-05-20 05:47:58', '2021-05-20 05:47:58', '2022-05-20 12:47:58'),
('99f75e482f0b9044e58f780922b1626735a616805ef60928a214baca0caf65f2ebcf7ffa224a454e', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:27:46', '2021-04-29 10:27:46', '2022-04-29 17:27:46'),
('9a11dd39648607e527814874da083bac4141d96af9a9b894d6a3a3b5fc95efa91aa63351b5eaf366', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:08:52', '2021-04-29 09:08:52', '2022-04-29 16:08:52'),
('a2921f0c06b7ee21d6d33b184910ece495bd73fe60c68f5a01840fb1cce8e51d84a92866aa310a16', 3, 7, 'Authentication Token', '[]', 0, '2021-05-20 06:54:22', '2021-05-20 06:54:22', '2022-05-20 13:54:22'),
('a7a222aac64fe9c929d7f02a874c3e18ca05731ab6149995429164781532b57d8250fba591cbee61', 4, 3, 'Authentication Token', '[]', 0, '2021-05-20 01:40:17', '2021-05-20 01:40:17', '2022-05-20 08:40:17'),
('a8dd20d2e63a2bdc5a168e7f5c32956e2fb3e883eda2a377b63cf9bb2221f6e074f51ea8927a78c5', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:06:12', '2021-04-29 09:06:12', '2022-04-29 16:06:12'),
('ac9a969f9b20fe15242449b872a1fd1c4feeaf5e6a3f732b44530d2b09d830e49ce310030a5c7ceb', 4, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:27:04', '2021-05-20 07:27:04', '2022-05-20 14:27:04'),
('b1461dc7ded4b03b82678f0fb91bb30f21634fc76a3b94d058bf08b2e7149cfacd7b4812f9f5249f', 3, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:31:19', '2021-05-20 07:31:19', '2022-05-20 14:31:19'),
('b2466ff8ea3f872bb9c3f3a7dc62115ccd7f4e283d1ae1a5d7fc90844659a79f8fa8d134f6222fb8', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 09:05:22', '2021-04-29 09:05:22', '2022-04-29 16:05:22'),
('bbca8be10469dffb03bb4f1e4b8a28c6f0bdc6aa6050bd983d21cdc925bb8364bae89eb943e016aa', 3, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:58:49', '2021-04-29 08:58:49', '2022-04-29 15:58:49'),
('bbe82863f3aeae76d3cc3d57715050cca4431614339f05dc84d70b968b2741422351afc852a22461', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:47:35', '2021-04-29 08:47:35', '2022-04-29 15:47:35'),
('bc030a27cb7e8963dd8cb342a7a7bce1470c48d94c623f3d655a87f7884c53bf67222a4ea7b5203b', 6, 3, 'Authentication Token', '[]', 0, '2021-05-19 23:19:40', '2021-05-19 23:19:40', '2022-05-20 06:19:40'),
('bfdcb1918fe6ee437e3aa0d1b9f74a20d25ff5ccc4c57987ef7f3e07ae74b214c3332c069301cfa1', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:14:59', '2021-05-20 07:14:59', '2022-05-20 14:14:59'),
('c144743b909bd4bc7a21e33f6577061f3b50f71400262fc1836599822bf3c28e87499d13213aae36', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:41:19', '2021-04-29 08:41:19', '2022-04-29 15:41:19'),
('c274bd73ec004284ea6e126f57be63f8c2d878a03a591482686ff8325a8c2c7fb8129fdccf0ac9e4', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 02:25:29', '2021-05-19 02:25:29', '2022-05-19 09:25:29'),
('c2bc1cb4aaefbb30c042b048bd809ed69295277b53b9cd08acc509a0752ce1adc614479720f54b30', 6, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:25:36', '2021-05-20 07:25:36', '2022-05-20 14:25:36'),
('c54abe9955cd378d391a2f4294f3afd02564b7cff7624874add70522db2ab4d3146181f462b4548b', 4, 3, 'Authentication Token', '[]', 0, '2021-05-20 01:42:32', '2021-05-20 01:42:32', '2022-05-20 08:42:32'),
('c64226232b3f52de84f4572fb6cfdd1cac0a4756b5496af8bc5afe3e4f2f63ac2756f21f18d9560a', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 01:34:34', '2021-05-19 01:34:34', '2022-05-19 08:34:34'),
('c757d9f1f73ea41d4b552d7204ecae1f1051ed035af812aa78ea1f48c5c5844e0badb6c43215ffb5', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:05:41', '2021-04-29 10:05:41', '2022-04-29 17:05:41'),
('c81002868a86568a3ceeeed8f2f1b0695963ae1e6356132bdf297c50cbfe6a16ae63917da0188738', 4, 7, 'Authentication Token', '[]', 0, '2021-06-02 02:03:41', '2021-06-02 02:03:41', '2022-06-02 09:03:41'),
('ce405ff0c56ce296bbf4c694b06ccf952ac257f645922bf02bb82ecc23b51cc6d4d6e5b6e8c4ec73', 0, 3, 'Authentication Token', '[]', 0, '2021-04-28 18:36:15', '2021-04-28 18:36:15', '2022-04-29 01:36:15'),
('cf720b1893eda1bb82b383bf05694048b94e3a33111211e68646d3109f3efcbcdd886b03fbeaf082', 3, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:41:21', '2021-05-20 07:41:21', '2022-05-20 14:41:21'),
('d840560736139cb2a9d8bb48edbcda88878589073ce30fa92e14cb728338d7222cbb575543766d4c', 5, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:02:20', '2021-04-29 10:02:20', '2022-04-29 17:02:20'),
('db399b2e4e2ba45b19645055760bbc6c35f769c74b22e3e83fb2a8fa8c65b9d444e3c30eee17ee04', 6, 7, 'Authentication Token', '[]', 0, '2021-05-20 07:41:56', '2021-05-20 07:41:56', '2022-05-20 14:41:56'),
('e15d3ccbd9c6eb0b6314f4e37e4063b920d8469efa688a6c25c163d898c17b64ed87e8a3418f6453', 0, 3, 'Authentication Token', '[]', 0, '2021-04-28 15:42:05', '2021-04-28 15:42:05', '2022-04-28 22:42:05'),
('e3026c75194df451a18dfe0e4892b751cc80de57643dbb1e342e930aef72d91b55f99ed1d8f11335', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:47:30', '2021-04-29 08:47:30', '2022-04-29 15:47:30'),
('e821d67296dba31d66eea3a0c29b44b337e6bad6c90855024fa00df2a0de0ba64ad9c42fca17e159', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 01:27:15', '2021-05-19 01:27:15', '2022-05-19 08:27:15'),
('ec54caee53ee91c5e1a4548d7440457c153e18d828cf3d6cc40f9fd1480226f3628f291028815dd3', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:47:51', '2021-04-29 08:47:51', '2022-04-29 15:47:51'),
('eda24ff9937bf6ba54c170018067259dd429f8e2ef19c2f50934c05cecf64ce4ca30e6e54a9e6bb1', 5, 7, 'Authentication Token', '[]', 0, '2021-05-20 05:55:51', '2021-05-20 05:55:51', '2022-05-20 12:55:51'),
('f07ecca2830db0d1111db81628342b5d2f8ddbd573544d6f46724a1a43bc3c33212c4fbbc7333c29', 5, 3, 'Authentication Token', '[]', 0, '2021-05-19 23:38:46', '2021-05-19 23:38:46', '2022-05-20 06:38:46'),
('f68dc34805900f8bea69cfcd59e32c1f8e9d7631d87b283f959fbe1a9f1643f7b4f625b6e6568cc4', 1, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:38:48', '2021-04-29 08:38:48', '2022-04-29 15:38:48'),
('f97ed44ffd173300ab481e62241ceb7589b2e583f9c37aa25275e274a3d882000b592f2c9765e92d', 4, 3, 'Authentication Token', '[]', 0, '2021-05-19 23:18:23', '2021-05-19 23:18:23', '2022-05-20 06:18:23'),
('fd0ce87a2b2f1e4f0ba9b9cdd7d9a13d29c4d81a3a988b3247a71e7a28913b7180704d906fe01353', 4, 3, 'Authentication Token', '[]', 0, '2021-04-29 08:44:04', '2021-04-29 08:44:04', '2022-04-29 15:44:04'),
('fd4d89a1e939e10af1d9c2ead55240ca22515d93c98b0aa80db3b49bfa5eaba83bb4d70dd2844dd9', 5, 3, 'Authentication Token', '[]', 0, '2021-04-29 10:29:27', '2021-04-29 10:29:27', '2022-04-29 17:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'yRcFEHS5lHp4WQl9DwsY8TTS0ZAyiH931FbH8cWJ', NULL, 'http://localhost', 1, 0, 0, '2021-04-28 15:25:38', '2021-04-28 15:25:38'),
(2, NULL, 'Laravel Password Grant Client', 'PcmFnKGGkWnzOybCmMjZoEucT4fM9RQAM9iGolbv', 'users', 'http://localhost', 0, 1, 0, '2021-04-28 15:25:38', '2021-04-28 15:25:38'),
(3, NULL, 'Laravel Personal Access Client', 'DIBazTpWRRM4LUxyDYCf7ZYkkE98bQxLZRcMaUog', NULL, 'http://localhost', 1, 0, 0, '2021-04-28 15:27:02', '2021-04-28 15:27:02'),
(4, NULL, 'Laravel Password Grant Client', 'TPZBz2xYmr4zFImUX371VR8hvWOWmNxX6qX8ypyT', 'users', 'http://localhost', 0, 1, 0, '2021-04-28 15:27:02', '2021-04-28 15:27:02'),
(5, NULL, 'Laravel Personal Access Client', 'N1PZOwgiz9jX2VsDyacV9Qs7G6foMTi3FOo3tAMU', NULL, 'http://localhost', 1, 0, 0, '2021-05-20 05:47:46', '2021-05-20 05:47:46'),
(6, NULL, 'Laravel Password Grant Client', 'bRSPN9nBQzbPW8cAnbz8QC5uEoTY4nLeANjkpkTN', 'users', 'http://localhost', 0, 1, 0, '2021-05-20 05:47:46', '2021-05-20 05:47:46'),
(7, NULL, 'Laravel Personal Access Client', 'FgfZsSH9qlqnrFxmrBIUaRW9HzxQmR4uhWTEzmB8', NULL, 'http://localhost', 1, 0, 0, '2021-05-20 05:47:51', '2021-05-20 05:47:51'),
(8, NULL, 'Laravel Password Grant Client', 'IIb0kv3cjufcdJhmNvk9l1w2uHth0qDPd0J1Qcu5', 'users', 'http://localhost', 0, 1, 0, '2021-05-20 05:47:51', '2021-05-20 05:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-28 15:25:38', '2021-04-28 15:25:38'),
(2, 3, '2021-04-28 15:27:02', '2021-04-28 15:27:02'),
(3, 5, '2021-05-20 05:47:46', '2021-05-20 05:47:46'),
(4, 7, '2021-05-20 05:47:51', '2021-05-20 05:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `jam_reservasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_reservasi` date NOT NULL,
  `jml_orgReservasi` int(11) NOT NULL,
  `id_meja` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id_reservasi`, `jam_reservasi`, `tgl_reservasi`, `jml_orgReservasi`, `id_meja`, `id_karyawan`, `id_customer`) VALUES
(22, 'Lunch', '2021-05-21', 1, 1, 5, 6),
(24, 'Dinner', '2021-05-21', 2, 2, 5, 8),
(26, 'Lunch', '2021-05-21', 1, 4, 4, 9),
(27, 'Lunch', '2021-05-21', 2, 16, 4, 10);

--
-- Triggers `reservasi`
--
DELIMITER $$
CREATE TRIGGER `meja_reservasi` AFTER INSERT ON `reservasi` FOR EACH ROW BEGIN UPDATE meja SET status_meja = "Tidak Tersedia" WHERE id_meja=new.id_meja;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `meja_reservasi_update` AFTER UPDATE ON `reservasi` FOR EACH ROW BEGIN UPDATE meja SET status_meja = "Tersedia" WHERE id_meja=old.id_meja;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stok_bahan`
--

CREATE TABLE `stok_bahan` (
  `id_stok` int(50) NOT NULL,
  `unit_stok` varchar(10) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `jumlah_stok` int(50) DEFAULT NULL,
  `incoming_stok` varchar(50) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `id_bahan` varchar(50) COLLATE cp1256_nopad_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1256 COLLATE=cp1256_nopad_bin;

--
-- Dumping data for table `stok_bahan`
--

INSERT INTO `stok_bahan` (`id_stok`, `unit_stok`, `harga_beli`, `jumlah_stok`, `incoming_stok`, `id_bahan`) VALUES
(1, 'Gram', 1000, 200, '800', '1'),
(4, 'Mililiter', 1000, 200, '1000', '3'),
(7, 'Gram', 8000, 4500000, '800000', '8'),
(8, 'Mililiter', 2000, 900000, '2000', '21'),
(9, 'Gram', 9500, 6080000, '15000', '9'),
(10, 'Gram', 9800, 200000, '8720000', '10'),
(11, 'Mililiter', 500, 50000, '99000000', '15'),
(12, 'Gram', 4000, 300000, '987000', '13'),
(15, NULL, NULL, NULL, NULL, NULL),
(16, 'Mililiter', 20000, 40000, '70000', '16'),
(17, 'Mililiter', 3000, 20000, '40000', '20');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(50) NOT NULL,
  `no_transaksi` int(50) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `jenis_bayar` varchar(25) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `status_pembayaran` varchar(50) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `jml_seluruhPesanan` int(255) DEFAULT NULL,
  `harga_total` double DEFAULT NULL,
  `no_kartu` varchar(50) COLLATE cp1256_nopad_bin DEFAULT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1256 COLLATE=cp1256_nopad_bin;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `no_transaksi`, `tgl_transaksi`, `jenis_bayar`, `status_pembayaran`, `jml_seluruhPesanan`, `harga_total`, `no_kartu`, `id_karyawan`, `id_reservasi`) VALUES
(3, 123, '2020-01-02', 'cash', 'Lunas', 2, 300000, '5159035835512884', 5, 22);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_menu`
--
ALTER TABLE `bahan_menu`
  ADD PRIMARY KEY (`id_bahan`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detailTransaksi`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histori_bahan`
--
ALTER TABLE `histori_bahan`
  ADD PRIMARY KEY (`id_histori`),
  ADD KEY `id_bahan` (`id_bahan`);

--
-- Indexes for table `info_kartu`
--
ALTER TABLE `info_kartu`
  ADD PRIMARY KEY (`no_kartu`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id_meja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_bahan` (`id_bahan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_meja` (`id_meja`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `id_bahanStock` (`id_bahan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_karyawan` (`id_karyawan`),
  ADD UNIQUE KEY `id_reservasi` (`id_reservasi`),
  ADD KEY `no_kartu` (`no_kartu`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahan_menu`
--
ALTER TABLE `bahan_menu`
  MODIFY `id_bahan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detailTransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `id_meja` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  MODIFY `id_stok` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `id_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `relasi1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `relasi2` FOREIGN KEY (`id_bahan`) REFERENCES `bahan_menu` (`id_bahan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `id_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_meja` FOREIGN KEY (`id_meja`) REFERENCES `meja` (`id_meja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `no_kartu` FOREIGN KEY (`no_kartu`) REFERENCES `info_kartu` (`no_kartu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `relasi233` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
