-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 12:31 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alzabh-alhalal`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beneficiary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subervisor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `created_at`, `updated_at`, `name`, `phone`, `role`) VALUES
(1, NULL, NULL, 'olfat', '0123456789', '1'),
(2, NULL, NULL, 'rezk', '0987654321', '2'),
(3, '2023-03-20 06:50:59', '2023-03-20 06:50:59', 'olfat', '012346567', 'subervisor'),
(4, '2023-03-20 06:53:54', '2023-03-20 06:53:54', 'olfat', '012346567', 'subervisor'),
(5, '2023-03-20 06:55:24', '2023-03-20 06:55:24', 'olfat', '012346567', 'subervisor'),
(6, '2023-03-20 06:58:58', '2023-03-20 06:58:58', 'olfat', '012346567', 'subervisor'),
(7, '2023-03-20 07:01:57', '2023-03-20 07:01:57', 'olfat', '012346567', 'subervisor'),
(8, '2023-03-20 07:03:04', '2023-03-20 07:03:04', 'olfat', '012346567', 'subervisor'),
(9, '2023-03-20 07:31:12', '2023-03-20 07:31:12', 'olfat', '012346567', 'subervisor'),
(10, '2023-03-20 08:15:24', '2023-03-20 08:15:24', 'olfat', '012346567', 'subervisor'),
(11, '2023-03-20 08:21:02', '2023-03-20 08:21:02', 'olfat', '012346567', 'subervisor');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `long` decimal(11,8) NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `cart_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `cart_id`, `created_at`, `updated_at`, `product_id`, `user_id`, `quantity`, `deleted_at`) VALUES
(1, '1', '2023-03-01 22:00:00', NULL, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `created_at`, `updated_at`, `name`, `photo`) VALUES
(1, NULL, NULL, 'clothes', NULL),
(2, NULL, NULL, 'shoes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_02_28_135750_create_account_table', 1),
(6, '2023_02_28_135750_create_admins_table', 1),
(7, '2023_02_28_135750_create_branches_table', 1),
(8, '2023_02_28_135750_create_carts_table', 1),
(9, '2023_02_28_135750_create_categories_table', 1),
(10, '2023_02_28_135750_create_contacts_table', 1),
(11, '2023_02_28_135750_create_offers_table', 1),
(12, '2023_02_28_135750_create_orders_table', 1),
(13, '2023_02_28_135750_create_packings_table', 1),
(14, '2023_02_28_135750_create_products_table', 1),
(15, '2023_02_28_135750_create_shredders_table', 1),
(16, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(17, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(18, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(19, '2016_06_01_000004_create_oauth_clients_table', 2),
(20, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0523bd38854025480d833c4a5b199c2a9f30343944f8e2fdfafb981c28dba864a56dfcab9d5488d4', 8, 3, 'passport_token', '[]', 0, '2023-03-20 07:03:05', '2023-03-20 07:03:05', '2024-03-20 09:03:05'),
('1e566a76d1e951cce456f2f82c207bc615d97d795deecead7fa9184a7bd227a86b8b5293f6abb450', 3, 3, 'passport_token', '[]', 0, '2023-03-20 06:51:00', '2023-03-20 06:51:00', '2024-03-20 08:51:00'),
('5913becd6d76a7feb9024a83463a967a8090a1df25332edebc5d4ba98fd771caf7a9e6eb16a0d271', 7, 3, 'passport_token', '[]', 0, '2023-03-20 07:01:57', '2023-03-20 07:01:57', '2024-03-20 09:01:57'),
('5f8763d32a88786a3391f9475f5ac0350aed7be596906a9575c1e7b5362a7ed4aab6981731b9d781', 6, 3, 'passport_token', '[]', 0, '2023-03-20 06:59:01', '2023-03-20 06:59:01', '2024-03-20 08:59:01'),
('65ce5992f4df81433b15fc49cbdbedc7c6230ed0eb57a38a3778730c68503dfb2c7c283c7cc275ac', 7, 3, 'passport_token', '[]', 0, '2023-03-20 07:03:50', '2023-03-20 07:03:50', '2024-03-20 09:03:50'),
('79a1c538fba570536ad93b8a8985d2f72caeed274a580ffc856e704d5cada6ed82f154320522a595', 5, 3, 'passport_token', '[]', 0, '2023-03-20 06:55:24', '2023-03-20 06:55:24', '2024-03-20 08:55:24'),
('bd5eab5e912fae86d8ab5af64c56e20150c0eb96d0291a03cab9770780ab385a559e37858770c600', 6, 1, 'passport_token', '[]', 0, '2023-03-20 06:32:53', '2023-03-20 06:32:53', '2024-03-20 08:32:53'),
('c08ee37926c4708b32fb35e848e2fabdf29723a4b1632aa13afd58743f357173d453d03d09192173', 4, 3, 'passport_token', '[]', 0, '2023-03-20 06:53:54', '2023-03-20 06:53:54', '2024-03-20 08:53:54'),
('df7ce87dd7f7e8c80de57aea9695dbf150dad817181a34d65e29aeb253e2f34aba9c81810b9800e4', 10, 3, 'passport_token', '[]', 0, '2023-03-20 08:15:25', '2023-03-20 08:15:25', '2024-03-20 10:15:25'),
('ee8593119e9268bb293464122089eb7d27d6901d5525f6ab987e7e43039046f788b744a5572dd129', 9, 3, 'passport_token', '[]', 0, '2023-03-20 07:31:13', '2023-03-20 07:31:13', '2024-03-20 09:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, NULL, 'Laravel Personal Access Client', 'KZLG2pMTTo6EPAZzagf2w8b8kaTQcU2tfiaNsvhp', NULL, 'http://localhost', 1, 0, 0, '2023-03-19 10:23:20', '2023-03-19 10:23:20'),
(2, NULL, 'Laravel Password Grant Client', 'WT8ice2idRyG7riL7klRbL16By2Z3yL6dZUxlFb7', 'users', 'http://localhost', 0, 1, 0, '2023-03-19 10:23:24', '2023-03-19 10:23:24'),
(3, NULL, 'Laravel Personal Access Client', 'QatNoKegAqs0BquXjTFZlRw1xjlfJlAGrgfo59UB', NULL, 'http://localhost', 1, 0, 0, '2023-03-20 06:36:43', '2023-03-20 06:36:43'),
(4, NULL, 'Laravel Password Grant Client', '6HgfAvKQk1YAXV4JvxdSZ6RWEIcaIgIKiD6nHmLC', 'users', 'http://localhost', 0, 1, 0, '2023-03-20 06:36:43', '2023-03-20 06:36:43');

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
(1, 1, '2023-03-19 10:23:23', '2023-03-19 10:23:23'),
(2, 3, '2023-03-20 06:36:43', '2023-03-20 06:36:43');

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
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percent` decimal(8,2) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expirationn_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `created_at`, `updated_at`, `percent`, `name`, `expirationn_date`) VALUES
(2, NULL, NULL, '22.00', 'offer 1', '2023-03-21'),
(3, NULL, NULL, '55.00', 'offer 2', '2023-03-24'),
(4, '2023-03-14 09:26:14', '2023-03-14 09:26:14', '22.00', 'offer 8', '2023-03-21'),
(5, '2023-03-19 06:45:33', '2023-03-19 06:45:33', '22.00', 'offer 8', '2023-03-21'),
(6, '2023-03-20 08:08:46', '2023-03-20 08:08:46', '22.00', 'offer 8', '2023-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total-price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `packing_id` bigint(20) UNSIGNED NOT NULL,
  `shredder_id` bigint(20) UNSIGNED NOT NULL,
  `m3_shalota` enum('') COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `payment_on_recieve` enum('') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `quantity`, `total-price`, `discount`, `product_id`, `packing_id`, `shredder_id`, `m3_shalota`, `notes`, `payment_on_recieve`, `deleted_at`) VALUES
(1, NULL, NULL, 2, 0.00, 11.00, 1, 1, 1, '', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packing`
--

CREATE TABLE `packing` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packing`
--

INSERT INTO `packing` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, NULL, NULL, 'packing 1'),
(2, NULL, NULL, 'packing 2');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `name`, `category_id`, `photo`, `price`, `deleted_at`) VALUES
(1, '2023-03-08 22:00:00', '2023-03-09 22:00:00', 't-shirt', 1, '', 200.00, NULL),
(2, '2023-03-01 22:00:00', '2023-03-12 22:00:00', 'skirt', 1, '', 100.00, NULL),
(3, '2023-03-01 22:00:00', '2023-03-13 22:00:00', 'shoes 1', 2, '', 0.00, NULL),
(4, '2023-03-02 22:00:00', '2023-03-15 22:00:00', 'shoes 2', 2, '', 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shredder`
--

CREATE TABLE `shredder` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shredder`
--

INSERT INTO `shredder` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, NULL, NULL, 'shreeder 1'),
(2, NULL, NULL, 'shreader 2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cairo',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cairo',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `district`, `city`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'ooooo', 'oiiooi@gmail.com', NULL, '123456789', '01234567', 'iuikjkj', 'cairo', NULL, '2023-03-19 09:08:02', '2023-03-19 09:08:02'),
(3, 'ooyyooo', 'oii@gmail.com', NULL, '123456789', '012334567', 'iuikjkj', 'cairo', NULL, '2023-03-19 09:15:59', '2023-03-19 09:15:59'),
(4, 'ooyyooo', '222@gmail.com', NULL, '$2y$10$Rj8KsSMUz3gt9YuQNGBzLuaPfdPAo.6Su8ZhjH.N0r9l4dNVRg/yO', '012324567', 'iuikjkj', 'cairo', NULL, '2023-03-19 09:21:42', '2023-03-19 09:21:42'),
(5, 'ooyyooo', '777@gmail.com', NULL, '$2y$10$9ogUd0SgQnQx/Zsg3p3FD.Atr9W6rqjTeFP6NNecbnmHQsD.dxQC.', '01209324567', 'iuikjkj', 'cairo', NULL, '2023-03-19 09:32:52', '2023-03-19 09:32:52'),
(6, 'ooyyooo', '77tt7@gmail.com', NULL, '$2y$10$OVVZ3CD5Uj/n6RxsI0T7L.JkRwYW4u2dHiECsW5WVzEjoKotEhbze', '012409324567', 'iuikjkj', 'cairo', NULL, '2023-03-20 06:32:41', '2023-03-20 06:32:41'),
(7, 'ooyyooo', 'iouou@gmail.com', NULL, '$2y$10$CqIEl1yV.cQvBOnbPYj2L.GDBLOFJpPAWZE0SruyXfY2poR62an/a', '0124024567', 'iuikjkj', 'cairo', NULL, '2023-03-20 07:03:50', '2023-03-20 07:03:50'),
(8, 'ooyyooo', 'iouoioou@gmail.com', NULL, '$2y$10$NCh6f1r4GcRs1nR/IoSPkeG/xM2fadj5.iTKtlDzvd0E.6sM8GqbC', '012467', 'iuikjkj', 'cairo', NULL, '2023-03-20 07:41:25', '2023-03-20 07:41:25'),
(9, 'ooyyooo', 'iokkkoou@gmail.com', NULL, '$2y$10$Y4vsYtZBWYgZkhVxbFcIYOgXcXrlB/qlNcMvQGDGsBmxb.N3xEVpC', '01246700', 'iuikjkj', 'cairo', NULL, '2023-03-20 08:11:57', '2023-03-20 08:11:57'),
(10, 'ooyyooo', 'i2okkkoou@gmail.com', NULL, '$2y$10$D9h/BPsbosi/96v5re0eEu71AQtYaOr7iV0RGsYnCUJij9JSbDWPy', '012467000', 'iuikjkj', 'cairo', NULL, '2023-03-20 09:03:35', '2023-03-20 09:03:35'),
(11, 'ooyyooo', 'i22okkkoou@gmail.com', NULL, '$2y$10$lrR02QhR4zBlukWMcfuhKekVMN5juN779VStIQyRsWz0hyeVmSVCG', '0124670000', 'iuikjkj', 'cairo', NULL, '2023-03-20 09:04:13', '2023-03-20 09:04:13'),
(12, 'ooyyooo', 'i212okkkoou@gmail.com', NULL, '$2y$10$LHf5w9RnHtZZwiqZjjDKSeWBHLYXTJv46VCcnMm9fT72o.XHDQpVu', '01246700001', 'iuikjkj', 'cairo', NULL, '2023-03-20 09:11:52', '2023-03-20 09:11:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing`
--
ALTER TABLE `packing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shredder`
--
ALTER TABLE `shredder`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packing`
--
ALTER TABLE `packing`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shredder`
--
ALTER TABLE `shredder`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
