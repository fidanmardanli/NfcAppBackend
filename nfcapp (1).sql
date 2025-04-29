-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2025 at 08:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nfcapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_points`
--

CREATE TABLE `access_points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `pointNumber` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `access_points`
--

INSERT INTO `access_points` (`id`, `room_id`, `pointNumber`, `created_at`, `updated_at`) VALUES
(1, 3, 'POINT-0', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(2, 1, 'POINT-1', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(3, 1, 'POINT-2', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(4, 9, 'POINT-3', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(5, 10, 'POINT-4', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(6, 8, 'POINT-5', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(7, 3, 'POINT-6', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(8, 1, 'POINT-7', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(9, 8, 'POINT-8', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(10, 7, 'POINT-9', '2025-04-08 07:41:37', '2025-04-08 07:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `building_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `building_name`, `building_status`, `created_at`, `updated_at`) VALUES
(1, 'B1', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cardNumber` varchar(255) NOT NULL,
  `isActive` int(11) NOT NULL DEFAULT 1,
  `validTo` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `cardNumber`, `isActive`, `validTo`, `created_at`, `updated_at`) VALUES
(1, '12010100', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(2, '12010101', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(3, '12010102', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(4, '12010103', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(5, '12010104', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(6, '12010105', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(7, '12010106', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(8, '12010107', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(9, '12010108', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(10, '12010109', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(11, '120101010', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(12, '120101011', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(13, '120101012', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(14, '120101013', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(15, '120101014', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(16, '120101015', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(17, '120101016', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(18, '120101017', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(19, '120101018', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(20, '120101019', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(21, '120101020', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(22, '120101021', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(23, '120101022', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(24, '120101023', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(25, '120101024', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(26, '120101025', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(27, '120101026', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(28, '120101027', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(29, '120101028', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(30, '120101029', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(31, '120101030', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(32, '120101031', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(33, '120101032', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(34, '120101033', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(35, '120101034', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(36, '120101035', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(37, '120101036', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(38, '120101037', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(39, '120101038', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(40, '120101039', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(41, '120101040', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(42, '120101041', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(43, '120101042', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(44, '120101043', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(45, '120101044', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(46, '120101045', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(47, '120101046', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(48, '120101047', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(49, '120101048', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(50, '120101049', 1, '2025-05-08', '2025-04-08 07:41:37', '2025-04-08 07:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `card_privileges`
--

CREATE TABLE `card_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cards_id` bigint(20) UNSIGNED NOT NULL,
  `privileges_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `group_status`, `created_at`, `updated_at`) VALUES
(1, 'Teachers', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(2, 'Students', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(3, 'Staff', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `group_permissions`
--

CREATE TABLE `group_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `groups_id` bigint(20) UNSIGNED NOT NULL,
  `access_points_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_permissions`
--

INSERT INTO `group_permissions` (`id`, `groups_id`, `access_points_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(2, 3, 1, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(3, 1, 1, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(4, 3, 4, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(5, 1, 8, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(6, 2, 7, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(7, 2, 2, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(8, 3, 10, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(9, 1, 8, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(10, 3, 3, 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `has_exceptions`
--

CREATE TABLE `has_exceptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `access_point_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `access_point_id` bigint(20) UNSIGNED NOT NULL,
  `card_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_10_000000_create_groups_table', 1),
(2, '2014_10_11_000000_create_cards_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2025_02_06_095042_create_personal_informations_table', 1),
(8, '2025_02_06_095226_create_privileges_table', 1),
(9, '2025_02_06_100112_create_card_privileges_table', 1),
(10, '2025_02_06_111153_create_buildings_table', 1),
(11, '2025_02_06_111159_create_rooms_table', 1),
(12, '2025_02_06_111160_create_access_points_table', 1),
(13, '2025_02_06_111161_create_logs_table', 1),
(14, '2025_02_06_115624_create_group_permissions_table', 1),
(15, '2025_02_06_120640_create_has_exceptions_table', 1),
(16, '2025_02_18_062906_add_my_room_i_d_to_personal_informations_table', 1),
(17, '2025_04_08_081906_create_room_reservations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 51, 'auth-token', '7e906941bfa4459069be64ad6bf5b245bb772e92d323d23df048ce1aa087ce01', '[\"*\"]', NULL, NULL, '2025-04-08 07:46:11', '2025-04-08 07:46:11'),
(2, 'App\\Models\\User', 51, 'auth-token', 'cd38cced3a5f614996137bdd62c10ab8b23549cebfc18cd5bf37e64a07fe00d2', '[\"*\"]', NULL, NULL, '2025-04-08 07:46:19', '2025-04-08 07:46:19'),
(3, 'App\\Models\\User', 51, 'auth-token', '2ce704fdbd63fa76517a21a576d786fb2beff94276750f8bf69a99388bd34b95', '[\"*\"]', NULL, NULL, '2025-04-08 08:01:13', '2025-04-08 08:01:13'),
(4, 'App\\Models\\User', 51, 'auth-token', 'f814fae42d08d0d2821527aa347f769372b7c2f27a6cabf15ce19ef4591c3b54', '[\"*\"]', NULL, NULL, '2025-04-08 08:05:00', '2025-04-08 08:05:00'),
(5, 'App\\Models\\User', 51, 'auth-token', 'adeafeca8385b2d93672e632179acc0b967d4a7fe7318b8a14328cdcf010f5b9', '[\"*\"]', NULL, NULL, '2025-04-08 08:08:38', '2025-04-08 08:08:38'),
(6, 'App\\Models\\User', 51, 'auth-token', '1def49437c0c3d1912325778fe8547856dafe40d7ded39553e1de4c049cd98a2', '[\"*\"]', '2025-04-08 08:10:08', NULL, '2025-04-08 08:09:54', '2025-04-08 08:10:08'),
(7, 'App\\Models\\User', 51, 'auth-token', '87632233f48741e58cf43d5a35762163c117485349b000de13247119c6ea2f7a', '[\"*\"]', NULL, NULL, '2025-04-08 08:32:42', '2025-04-08 08:32:42');

-- --------------------------------------------------------

--
-- Table structure for table `personal_informations`
--

CREATE TABLE `personal_informations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `myRoomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_informations`
--

INSERT INTO `personal_informations` (`id`, `user_id`, `uid`, `fullName`, `username`, `birthdate`, `created_at`, `updated_at`, `myRoomID`) VALUES
(1, 51, '1313 1313 1313 1313', 'Orxan Mardanli', 'thirteenthstep', '1999-03-14', '2025-02-18 02:48:00', '2025-02-18 02:48:00', 2),
(2, 52, '1111 1111 1111 1111', 'Fidan Mardanli', 'fifa', '2004-09-13', '2025-02-20 03:52:33', '2025-02-20 03:52:33', 2);

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buildings_id` bigint(20) UNSIGNED NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `room_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `buildings_id`, `room_name`, `room_type`, `room_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'R1', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(2, 1, 'R2', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(3, 1, 'R3', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(4, 1, 'R4', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(5, 1, 'R5', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(6, 1, 'R6', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(7, 1, 'R7', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(8, 1, 'R8', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(9, 1, 'R9', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37'),
(10, 1, 'R10', 'Sinif otağı', 1, '2025-04-08 07:41:37', '2025-04-08 07:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `room_reservations`
--

CREATE TABLE `room_reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `purpose` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_reservations`
--

INSERT INTO `room_reservations` (`id`, `room_id`, `user_id`, `start_time`, `end_time`, `purpose`, `created_at`, `updated_at`) VALUES
(1, 1, 51, '2025-04-08 15:00:00', '2025-04-08 17:00:00', 'Weekly meeting', '2025-04-08 08:10:08', '2025-04-08 08:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `cards_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `hasException` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `group_id`, `cards_id`, `name`, `email`, `email_verified_at`, `password`, `hasException`, `remember_token`, `created_at`, `updated_at`) VALUES
(51, 1, 1, 'Togrul', 'toghrul.guluzadeh01@gmail.com', NULL, '$2y$12$6Q.O9zQ9VlXJ6Ur6P/EhyuHCUn9LPZn.RMTJ0jja7IzYzIt2xYZui', 0, NULL, '2025-02-18 02:48:00', '2025-02-18 02:48:00'),
(52, 2, 1, 'Fidan', 'fidan13@gmail.com', NULL, '$2y$12$6Q.O9zQ9VlXJ6Ur6P/EhyuHCUn9LPZn.RMTJ0jja7IzYzIt2xYZui', 0, NULL, '2025-02-20 03:52:33', '2025-02-20 03:52:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_points`
--
ALTER TABLE `access_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_points_room_id_foreign` (`room_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_privileges`
--
ALTER TABLE `card_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_privileges_cards_id_foreign` (`cards_id`),
  ADD KEY `card_privileges_privileges_id_foreign` (`privileges_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_permissions`
--
ALTER TABLE `group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_permissions_groups_id_foreign` (`groups_id`),
  ADD KEY `group_permissions_access_points_id_foreign` (`access_points_id`);

--
-- Indexes for table `has_exceptions`
--
ALTER TABLE `has_exceptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_exceptions_user_id_foreign` (`user_id`),
  ADD KEY `has_exceptions_access_point_id_foreign` (`access_point_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_user_id_foreign` (`user_id`),
  ADD KEY `logs_access_point_id_foreign` (`access_point_id`),
  ADD KEY `logs_card_id_foreign` (`card_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `personal_informations`
--
ALTER TABLE `personal_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_informations_user_id_foreign` (`user_id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_buildings_id_foreign` (`buildings_id`);

--
-- Indexes for table `room_reservations`
--
ALTER TABLE `room_reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_reservations_room_id_foreign` (`room_id`),
  ADD KEY `room_reservations_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_group_id_foreign` (`group_id`),
  ADD KEY `users_cards_id_foreign` (`cards_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_points`
--
ALTER TABLE `access_points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `card_privileges`
--
ALTER TABLE `card_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_permissions`
--
ALTER TABLE `group_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `has_exceptions`
--
ALTER TABLE `has_exceptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_informations`
--
ALTER TABLE `personal_informations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room_reservations`
--
ALTER TABLE `room_reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_points`
--
ALTER TABLE `access_points`
  ADD CONSTRAINT `access_points_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `card_privileges`
--
ALTER TABLE `card_privileges`
  ADD CONSTRAINT `card_privileges_cards_id_foreign` FOREIGN KEY (`cards_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `card_privileges_privileges_id_foreign` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`);

--
-- Constraints for table `group_permissions`
--
ALTER TABLE `group_permissions`
  ADD CONSTRAINT `group_permissions_access_points_id_foreign` FOREIGN KEY (`access_points_id`) REFERENCES `access_points` (`id`),
  ADD CONSTRAINT `group_permissions_groups_id_foreign` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`);

--
-- Constraints for table `has_exceptions`
--
ALTER TABLE `has_exceptions`
  ADD CONSTRAINT `has_exceptions_access_point_id_foreign` FOREIGN KEY (`access_point_id`) REFERENCES `access_points` (`id`),
  ADD CONSTRAINT `has_exceptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_access_point_id_foreign` FOREIGN KEY (`access_point_id`) REFERENCES `access_points` (`id`),
  ADD CONSTRAINT `logs_card_id_foreign` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `personal_informations`
--
ALTER TABLE `personal_informations`
  ADD CONSTRAINT `personal_informations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_buildings_id_foreign` FOREIGN KEY (`buildings_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `room_reservations`
--
ALTER TABLE `room_reservations`
  ADD CONSTRAINT `room_reservations_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_cards_id_foreign` FOREIGN KEY (`cards_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
