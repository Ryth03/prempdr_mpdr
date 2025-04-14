-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 14, 2025 at 01:43 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mpdr`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'prempdr', 'Create Pre Mpdr Form 25PREMPDR0004 by Admin at 2025-03-10 02:27:27', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Create', 17, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0004\", \"action\": \"created\"}', NULL, '2025-03-09 19:27:27', '2025-03-09 19:27:27'),
(2, 'prempdr', 'Create Pre Mpdr Form 25PREMPDR0005 by Admin at 2025-03-10 03:06:49', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Create', 18, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"created\"}', NULL, '2025-03-09 20:06:49', '2025-03-09 20:06:49'),
(3, 'prempdr', 'Create Pre Mpdr Form 25PREMPDR0005 by Admin at 2025-03-10 03:06:51', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Create', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"created\"}', NULL, '2025-03-09 20:06:51', '2025-03-09 20:06:51'),
(4, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:10:11', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:10:11', '2025-03-09 23:10:11'),
(5, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:11:16', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:11:16', '2025-03-09 23:11:16'),
(6, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:16:35', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:16:35', '2025-03-09 23:16:35'),
(7, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:17:57', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:17:57', '2025-03-09 23:17:57'),
(8, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:18:07', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:18:07', '2025-03-09 23:18:07'),
(9, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:22:28', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:22:28', '2025-03-09 23:22:28'),
(10, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:26:24', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:26:24', '2025-03-09 23:26:24'),
(11, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:27:49', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:27:49', '2025-03-09 23:27:49'),
(12, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:29:08', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:29:08', '2025-03-09 23:29:08'),
(13, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:29:56', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:29:56', '2025-03-09 23:29:56'),
(14, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:34:26', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:34:26', '2025-03-09 23:34:26'),
(15, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:34:33', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:34:33', '2025-03-09 23:34:33'),
(16, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:35:57', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:35:57', '2025-03-09 23:35:57'),
(17, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:37:50', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:37:50', '2025-03-09 23:37:50'),
(18, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:39:33', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:39:33', '2025-03-09 23:39:33'),
(19, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 06:40:58', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-09 23:40:58', '2025-03-09 23:40:58'),
(20, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 14:56:26', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-10 07:56:26', '2025-03-10 07:56:26'),
(21, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 15:06:23', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-10 08:06:23', '2025-03-10 08:06:23'),
(22, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 15:11:59', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-10 08:11:59', '2025-03-10 08:11:59'),
(23, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 15:12:19', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-10 08:12:19', '2025-03-10 08:12:19'),
(24, 'prempdr', 'Create PreMpdr Form 25PREMPDR0006 by Admin at 2025-03-10 15:58:58', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Create', 20, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0006\", \"action\": \"created\"}', NULL, '2025-03-10 08:58:58', '2025-03-10 08:58:58'),
(25, 'prempdr', 'Create PreMpdr Form 25PREMPDR0006 by Admin at 2025-03-10 16:00:30', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Create', 21, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0006\", \"action\": \"created\"}', NULL, '2025-03-10 09:00:30', '2025-03-10 09:00:30'),
(26, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-10 16:01:37', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-10 09:01:37', '2025-03-10 09:01:37'),
(27, 'prempdr', 'Update PreMpdr Form 25PREMPDR0006 by Admin at 2025-03-10 16:02:50', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 21, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0006\", \"action\": \"updated\"}', NULL, '2025-03-10 09:02:50', '2025-03-10 09:02:50'),
(28, 'prempdr', 'Create PreMpdr Form 25PREMPDR0006 by Admin at 2025-03-10 16:32:14', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Create', 22, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0006\", \"action\": \"created\"}', NULL, '2025-03-10 09:32:14', '2025-03-10 09:32:14'),
(29, 'prempdr', 'Update PreMpdr Form 25PREMPDR0006 by Admin at 2025-03-10 16:32:40', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 22, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0006\", \"action\": \"updated\"}', NULL, '2025-03-10 09:32:40', '2025-03-10 09:32:40'),
(30, 'prempdr', 'Deleted PreMpdr Form 25PREMPDR0006 by Admin at 2025-03-10 16:32:48', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Delete', 22, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0006\", \"action\": \"deleted\"}', NULL, '2025-03-10 09:32:48', '2025-03-10 09:32:48'),
(31, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-11 09:22:32', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-11 02:22:32', '2025-03-11 02:22:32'),
(32, 'prempdr', 'Update PreMpdr Form 25PREMPDR0005 by Admin at 2025-03-11 09:41:54', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 19, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-11 02:41:54', '2025-03-11 02:41:54'),
(33, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0005 by Fitriyah Rahayu at 2025-03-11 09:48:15', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 19, 'App\\Models\\User', 985, '{\"no\": \"25PREMPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-11 02:48:15', '2025-03-11 02:48:15'),
(34, 'prempdr', 'Approve with review PreMpdr Form 25PREMPDR0005 by Fitriyah Rahayu at 2025-03-11 09:51:14', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve with review', 19, 'App\\Models\\User', 985, '{\"no\": \"25PREMPDR0005\", \"action\": \"approve with review\"}', NULL, '2025-03-11 02:51:14', '2025-03-11 02:51:14'),
(35, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0005 by Dimas Supriyadi at 2025-03-11 09:52:13', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 19, 'App\\Models\\User', 986, '{\"no\": \"25PREMPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-11 02:52:13', '2025-03-11 02:52:13'),
(36, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0005 by Ronal Katili at 2025-03-11 11:10:08', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 19, 'App\\Models\\User', 1291, '{\"no\": \"25PREMPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-11 04:10:08', '2025-03-11 04:10:08'),
(37, 'prempdr', 'Approve with review PreMpdr Form 25PREMPDR0005 by Edie Hirman at 2025-03-11 11:11:02', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve with review', 19, 'App\\Models\\User', 1290, '{\"no\": \"25PREMPDR0005\", \"action\": \"approve with review\"}', NULL, '2025-03-11 04:11:02', '2025-03-11 04:11:02'),
(38, 'prempdr', 'Delete PreMpdr Form 25PREMPDR0003 by Admin at 2025-03-11 11:21:57', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Delete', 13, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0003\", \"action\": \"deleted\"}', NULL, '2025-03-11 04:21:57', '2025-03-11 04:21:57'),
(39, 'prempdr', 'Update PreMpdr Form 25PREMPDR0004 by Admin at 2025-03-11 11:23:33', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Update', 17, 'App\\Models\\User', 1, '{\"no\": \"25PREMPDR0004\", \"action\": \"update\"}', NULL, '2025-03-11 04:23:33', '2025-03-11 04:23:33'),
(40, 'prempdr', 'Create Mpdr Form 25MPDR0004 by Admin at 2025-03-11 13:23:56', 'App\\Models\\MPDR\\MpdrForm', 'Delete', 21, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"created\"}', NULL, '2025-03-11 06:23:56', '2025-03-11 06:23:56'),
(41, 'prempdr', 'Create Mpdr Form 25MPDR0004 by Admin at 2025-03-11 13:23:57', 'App\\Models\\MPDR\\MpdrForm', 'Delete', 22, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"created\"}', NULL, '2025-03-11 06:23:57', '2025-03-11 06:23:57'),
(42, 'mpdr', 'Update Mpdr Form 25MPDR0004 by Admin at 2025-03-11 15:40:27', 'App\\Models\\MPDR\\MpdrForm', 'Update', 22, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"updated\"}', NULL, '2025-03-11 08:40:27', '2025-03-11 08:40:27'),
(43, 'mpdr', 'Update Mpdr Form 25MPDR0004 by Admin at 2025-03-11 15:41:30', 'App\\Models\\MPDR\\MpdrForm', 'Update', 22, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"updated\"}', NULL, '2025-03-11 08:41:30', '2025-03-11 08:41:30'),
(44, 'mpdr', 'Delete Mpdr Form 25MPDR0004 by Admin at 2025-03-11 15:47:34', 'App\\Models\\MPDR\\MpdrForm', 'Delete', 22, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"deleted\"}', NULL, '2025-03-11 08:47:34', '2025-03-11 08:47:34'),
(45, 'mpdr', 'Create Mpdr Form 25MPDR0004 by Admin at 2025-03-11 15:54:21', 'App\\Models\\MPDR\\MpdrForm', 'Create', 23, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"created\"}', NULL, '2025-03-11 08:54:21', '2025-03-11 08:54:21'),
(46, 'mpdr', 'Create Mpdr Form 25MPDR0004 by Admin at 2025-03-11 15:56:15', 'App\\Models\\MPDR\\MpdrForm', 'Create', 24, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"created\"}', NULL, '2025-03-11 08:56:15', '2025-03-11 08:56:15'),
(47, 'mpdr', 'Update Mpdr Form 25MPDR0004 by Admin at 2025-03-11 15:56:33', 'App\\Models\\MPDR\\MpdrForm', 'Update', 24, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0004\", \"action\": \"updated\"}', NULL, '2025-03-11 08:56:33', '2025-03-11 08:56:33'),
(49, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0004 by Jimmy Ferdinand at 2025-03-13 15:17:32', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 17, 'App\\Models\\User', 980, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve\"}', NULL, '2025-03-13 08:17:32', '2025-03-13 08:17:32'),
(50, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0004 by Djarot Hendrawan at 2025-03-13 15:28:56', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 17, 'App\\Models\\User', 982, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve\"}', NULL, '2025-03-13 08:28:56', '2025-03-13 08:28:56'),
(51, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0004 by Linda Rianty at 2025-03-13 15:32:15', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 17, 'App\\Models\\User', 983, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve\"}', NULL, '2025-03-13 08:32:15', '2025-03-13 08:32:15'),
(52, 'prempdr', 'Not approve PreMpdr Form 25PREMPDR0004 by Linda Rianty at 2025-03-17 10:07:43', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Not approve', 17, 'App\\Models\\User', 983, '{\"no\": \"25PREMPDR0004\", \"action\": \"not approve\"}', NULL, '2025-03-17 03:07:43', '2025-03-17 03:07:43'),
(53, 'prempdr', 'Approve with review PreMpdr Form 25PREMPDR0004 by Linda Rianty at 2025-03-17 13:51:54', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve with review', 17, 'App\\Models\\User', 983, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve with review\"}', NULL, '2025-03-17 06:51:54', '2025-03-17 06:51:54'),
(54, 'prempdr', 'Approve with review PreMpdr Form 25PREMPDR0004 by Linda Rianty at 2025-03-17 13:57:34', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve with review', 17, 'App\\Models\\User', 983, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve with review\"}', NULL, '2025-03-17 06:57:34', '2025-03-17 06:57:34'),
(55, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0004 by Arief Fazry at 2025-03-17 13:58:16', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 17, 'App\\Models\\User', 984, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve\"}', NULL, '2025-03-17 06:58:16', '2025-03-17 06:58:16'),
(56, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0004 by Arief Fazry at 2025-03-17 14:12:13', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 17, 'App\\Models\\User', 984, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve\"}', NULL, '2025-03-17 07:12:13', '2025-03-17 07:12:13'),
(57, 'prempdr', 'Approve PreMpdr Form 25PREMPDR0004 by Arief Fazry at 2025-03-17 14:17:13', 'App\\Models\\PREMPDR\\PreMpdrForm', 'Approve', 17, 'App\\Models\\User', 984, '{\"no\": \"25PREMPDR0004\", \"action\": \"approve\"}', NULL, '2025-03-17 07:17:13', '2025-03-17 07:17:13'),
(58, 'mpdr', 'Create Mpdr Form 25MPDR0005 by test2 at 2025-03-18 11:22:42', 'App\\Models\\MPDR\\MpdrForm', 'Create', 25, 'App\\Models\\User', 1305, '{\"no\": \"25MPDR0005\", \"action\": \"created\"}', NULL, '2025-03-18 04:22:42', '2025-03-18 04:22:42'),
(59, 'mpdr', 'Update Mpdr Form 25MPDR0005 by Admin at 2025-03-18 11:33:15', 'App\\Models\\MPDR\\MpdrForm', 'Update', 25, 'App\\Models\\User', 1, '{\"no\": \"25MPDR0005\", \"action\": \"updated\"}', NULL, '2025-03-18 04:33:15', '2025-03-18 04:33:15'),
(60, 'mpdr', 'Approve Mpdr Form 25MPDR0005 by Arief Fazry at 2025-03-18 13:15:55', 'App\\Models\\MPDR\\MpdrForm', 'Approve', 25, 'App\\Models\\User', 984, '{\"no\": \"25MPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-18 06:15:55', '2025-03-18 06:15:55'),
(61, 'mpdr', 'Approve Mpdr Form 25MPDR0005 by Djarot Hendrawan at 2025-03-18 13:20:25', 'App\\Models\\MPDR\\MpdrForm', 'Approve', 25, 'App\\Models\\User', 982, '{\"no\": \"25MPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-18 06:20:25', '2025-03-18 06:20:25'),
(62, 'mpdr', 'Approve Mpdr Form 25MPDR0005 by Djarot Hendrawan at 2025-03-18 13:25:44', 'App\\Models\\MPDR\\MpdrForm', 'Approve', 25, 'App\\Models\\User', 982, '{\"no\": \"25MPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-18 06:25:44', '2025-03-18 06:25:44'),
(63, 'mpdr', 'Approve Mpdr Form 25MPDR0005 by test2 at 2025-03-18 13:26:15', 'App\\Models\\MPDR\\MpdrForm', 'Approve', 25, 'App\\Models\\User', 1305, '{\"no\": \"25MPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-18 06:26:15', '2025-03-18 06:26:15'),
(65, 'mpdr', 'Approve Mpdr Form 25MPDR0005 by test2 at 2025-03-18 14:11:55', 'App\\Models\\MPDR\\MpdrForm', 'Approve', 25, 'App\\Models\\User', 1305, '{\"no\": \"25MPDR0005\", \"action\": \"approve\"}', NULL, '2025-03-18 07:11:55', '2025-03-18 07:11:55'),
(66, 'mpdr', 'Approve Mpdr Form 25MPDR0004 by Arief Fazry at 2025-03-26 16:05:13', 'App\\Models\\MPDR\\MpdrForm', 'Approve', 24, 'App\\Models\\User', 984, '{\"no\": \"25MPDR0004\", \"action\": \"approved\"}', NULL, '2025-03-26 09:05:13', '2025-03-26 09:05:13'),
(67, 'mpdr', 'Approve Mpdr Form 25MPDR0004 by test2 at 2025-04-08 10:28:34', 'App\\Models\\MPDR\\MpdrForm', 'Approve', 24, 'App\\Models\\User', 1305, '{\"no\": \"25MPDR0004\", \"action\": \"approve\"}', NULL, '2025-04-08 03:28:34', '2025-04-08 03:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Engineering & Maintenance', '2024-10-09 00:39:36', '2024-12-06 00:11:09'),
(2, 'Finance Admin', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(3, 'HCD', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(4, 'Manufacturing', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(5, 'QM & HSE', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(6, 'R&D', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(7, 'Sales & Marketing', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(8, 'Supply Chain', '2024-10-09 00:39:36', '2024-10-09 00:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'I', 'i', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(2, 'II', 'ii', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(3, 'III', 'iii', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(4, 'IV', 'iv', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(5, 'V', 'v', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(6, 'VI', 'vi', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(7, 'VII', 'vii', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(8, 'Developer', 'developer', '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(17, 'VIII', 'viii', '2024-10-31 23:59:47', '2024-10-31 23:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_09_042713_create_permission_tables', 1),
(6, '2024_10_09_043245_create_levels_table', 2),
(7, '2024_10_09_043246_create_departments_table', 2),
(8, '2024_10_09_043247_create_positions_table', 2),
(9, '2024_10_09_043251_create_categories_table', 2),
(10, '2024_10_09_071058_add_manager_and_department_to_users_table', 3),
(11, '2024_10_09_045133_create_ideas_table', 4),
(12, '2024_10_09_064916_create_idea_approvals_table', 4),
(13, '2024_10_09_064933_create_idea_files_table', 4),
(14, '2024_10_09_064944_create_idea_likes_table', 4),
(15, '2024_10_09_075621_add_avatar_to_table_users', 5),
(16, '2024_10_28_061205_add_dynamic_fields_to_ideas_table', 6),
(17, '2024_11_01_030241_create_section_table', 7),
(20, '2024_11_01_030947_add_section_id_to_table_users', 8),
(21, '2024_11_04_064031_add_approval_path_to_ideas_table', 9),
(22, '2024_11_05_095747_create_notifications_table', 10),
(23, '2025_01_12_093208_create_mpdr_revisions', 11),
(24, '2025_01_12_093209_create_pre_mpdr_revisions', 11),
(25, '2025_01_31_030018_create_mpdr_forms_tables', 11),
(26, '2025_01_31_030019_create_pre_mpdr_forms_tables', 11),
(27, '2025_01_31_041902_create_mpdr_approved_details_table', 11),
(28, '2025_01_31_041903_create_pre_mpdr_approved_details_table', 11),
(29, '2025_01_31_042524_create_mpdr_certification_requirements_table', 11),
(30, '2025_01_31_042525_create_pre_mpdr_certification_requirements_table', 11),
(31, '2025_01_31_043142_create_mpdr_channels_table', 11),
(32, '2025_01_31_043143_create_pre_mpdr_channels_table', 11),
(33, '2025_01_31_043250_create_mpdr_competitor_products_table', 11),
(34, '2025_01_31_043251_create_pre_mpdr_competitor_products_table', 11),
(35, '2025_01_31_043424_create_mpdr_detailed_packagings_table', 11),
(36, '2025_01_31_043425_create_pre_mpdr_detailed_packagings_table', 11),
(37, '2025_01_31_071112_create_mpdr_form_details_table', 11),
(38, '2025_01_31_071113_create_pre_mpdr_form_details_table', 11),
(39, '2025_01_31_071311_create_mpdr_market_updates_table', 11),
(40, '2025_01_31_071312_create_pre_mpdr_market_updates_table', 11),
(41, '2025_01_31_071512_create_mpdr_product_descriptions_table', 11),
(42, '2025_01_31_071513_create_pre_mpdr_product_descriptions_table', 11),
(43, '2025_02_12_034558_create_pre_mpdr_product_category_table', 11),
(44, '2025_02_12_034609_create_mpdr_product_category_table', 11),
(45, '2025_02_12_041352_create_pre_mpdr_approver_table', 11),
(46, '2025_02_12_041402_create_mpdr_approver_table', 11),
(47, '2025_03_05_030552_create_mpdr_initiator_approved_details_table', 12),
(48, '2024_08_07_082454_create_activity_log_table', 13),
(49, '2024_08_07_082455_add_event_column_to_activity_log_table', 14),
(50, '2024_08_07_082456_add_batch_uuid_column_to_activity_log_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(13, 'App\\Models\\User', 1),
(15, 'App\\Models\\User', 2),
(18, 'App\\Models\\User', 980),
(18, 'App\\Models\\User', 982),
(18, 'App\\Models\\User', 983),
(18, 'App\\Models\\User', 984),
(18, 'App\\Models\\User', 985),
(18, 'App\\Models\\User', 986),
(18, 'App\\Models\\User', 1206),
(18, 'App\\Models\\User', 1232),
(18, 'App\\Models\\User', 1289),
(18, 'App\\Models\\User', 1290),
(18, 'App\\Models\\User', 1291),
(18, 'App\\Models\\User', 1292),
(18, 'App\\Models\\User', 1293),
(16, 'App\\Models\\User', 1298),
(18, 'App\\Models\\User', 1305),
(20, 'App\\Models\\User', 1305);

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_approved_details`
--

CREATE TABLE `mpdr_approved_details` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `approver_nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `token` text COLLATE utf8mb4_unicode_ci,
  `approved_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_approved_details`
--

INSERT INTO `mpdr_approved_details` (`id`, `form_id`, `approver_nik`, `approver_name`, `status`, `comment`, `token`, `approved_date`, `created_at`, `updated_at`) VALUES
(17, 19, 'T0930', 'Linda Rianty', 'not approve', 'Not approve by GM', NULL, '2025-03-07', '2025-03-04 22:05:22', '2025-03-07 00:58:19'),
(18, 19, 'S0905', 'Jimmy Ferdinand', 'not approve', 'Not approve by GM', NULL, '2025-03-07', '2025-03-04 22:05:22', '2025-03-07 00:58:19'),
(19, 19, 'T0932', 'Arief Fazry', 'approve', NULL, NULL, '2025-03-06', '2025-03-04 22:05:22', '2025-03-06 00:29:25'),
(20, 19, 'Q0881', 'Maria Muyarni', 'not approve', 'Not approve by GM', NULL, '2025-03-07', '2025-03-04 22:05:22', '2025-03-07 00:58:19'),
(21, 19, 'M0812', 'Djarot Hendrawan', 'approve with review', 'bolehh', NULL, '2025-03-07', '2025-03-04 22:05:22', '2025-03-07 00:55:15'),
(22, 19, 'AD1227', 'Andika Suhendar', 'not approve', 'Not approve by GM', NULL, '2025-03-07', '2025-03-04 22:05:22', '2025-03-07 00:58:19'),
(23, 19, 'AE1279', 'Fitriyah Rahayu', 'not approve', 'Not approve by GM', NULL, '2025-03-07', '2025-03-04 22:05:22', '2025-03-07 00:58:19'),
(24, 19, 'test2a', 'test2', 'not approve', 'tidak boleh', NULL, '2025-03-07', '2025-03-04 22:05:22', '2025-03-07 00:58:19'),
(41, 24, 'T0930', 'Linda Rianty', 'approve with review', 'Approve by GM', NULL, '2025-04-08', '2025-03-11 08:56:32', '2025-04-08 03:28:35'),
(42, 24, 'S0905', 'Jimmy Ferdinand', 'approve with review', 'Approve by GM', NULL, '2025-04-08', '2025-03-11 08:56:32', '2025-04-08 03:28:35'),
(43, 24, 'T0932', 'Arief Fazry', 'pending', NULL, '7f98a514-e89a-47e6-9382-ba670e353350', NULL, '2025-03-11 08:56:32', '2025-03-11 08:56:32'),
(44, 24, 'Q0881', 'Maria Muyarni', 'approve with review', 'Approve by GM', NULL, '2025-04-08', '2025-03-11 08:56:32', '2025-04-08 03:28:35'),
(45, 24, 'M0812', 'Djarot Hendrawan', 'pending', NULL, '9e5704d3-942e-4224-9ce9-f1fa05735a61', NULL, '2025-03-11 08:56:33', '2025-03-11 08:56:33'),
(46, 24, 'AD1227', 'Andika Suhendar', 'approve with review', 'Approve by GM', NULL, '2025-04-08', '2025-03-11 08:56:33', '2025-04-08 03:28:35'),
(47, 24, 'AE1279', 'Fitriyah Rahayu', 'approve with review', 'Approve by GM', NULL, '2025-04-08', '2025-03-11 08:56:33', '2025-04-08 03:28:35'),
(48, 24, 'test2a', 'test2', 'approve', NULL, NULL, '2025-04-08', '2025-03-11 08:56:33', '2025-04-08 03:28:34'),
(57, 25, 'T0930', 'Linda Rianty', 'approve with review', 'Approve by GM', NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 07:11:55'),
(58, 25, 'S0905', 'Jimmy Ferdinand', 'approve with review', 'Approve by GM', NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 07:11:55'),
(59, 25, 'T0932', 'Arief Fazry', 'approve', NULL, NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 06:15:55'),
(60, 25, 'Q0881', 'Maria Muyarni', 'approve with review', 'Approve by GM', NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 07:11:55'),
(61, 25, 'M0812', 'Djarot Hendrawan', 'approve', NULL, NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 06:25:44'),
(62, 25, 'AD1227', 'Andika Suhendar', 'approve with review', 'Approve by GM', NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 07:11:55'),
(63, 25, 'AE1279', 'Fitriyah Rahayu', 'approve with review', 'Approve by GM', NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 07:11:55'),
(64, 25, 'test2a', 'test2', 'approve', NULL, NULL, '2025-03-18', '2025-03-18 04:33:04', '2025-03-18 07:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_approvers`
--

CREATE TABLE `mpdr_approvers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_nik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approver_nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approver_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_approvers`
--

INSERT INTO `mpdr_approvers` (`id`, `user_nik`, `approver_nik`, `approver_name`, `approver_status`, `created_at`, `updated_at`) VALUES
(89, 'AG1111', 'T0930', 'Linda Rianty', 'Vacant', '2025-03-04 19:34:22', '2025-03-04 19:34:22'),
(90, 'AG1111', 'S0905', 'Jimmy Ferdinand', 'Vacant', '2025-03-04 19:34:22', '2025-03-04 19:34:22'),
(91, 'AG1111', 'T0932', 'Arief Fazry', 'Active', '2025-03-04 19:34:22', '2025-03-04 19:34:22'),
(92, 'AG1111', 'Q0881', 'Maria Muyarni', 'Vacant', '2025-03-04 19:34:22', '2025-03-04 19:34:22'),
(93, 'AG1111', 'M0812', 'Djarot Hendrawan', 'Active', '2025-03-04 19:34:22', '2025-03-04 19:34:22'),
(94, 'AG1111', 'AD1227', 'Andika Suhendar', 'Vacant', '2025-03-04 19:34:22', '2025-03-04 19:34:22'),
(95, 'AG1111', 'AE1279', 'Fitriyah Rahayu', 'Vacant', '2025-03-04 19:34:22', '2025-03-04 19:34:22'),
(96, 'AG1111', 'test2a', 'test2', 'Active', '2025-03-04 19:34:22', '2025-03-04 19:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_certification_requirements`
--

CREATE TABLE `mpdr_certification_requirements` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_certification_requirements`
--

INSERT INTO `mpdr_certification_requirements` (`id`, `form_id`, `category`, `other`, `created_at`, `updated_at`) VALUES
(1, 1, 'BPOM', NULL, '2025-02-28 02:51:55', '2025-02-28 02:51:55'),
(3, 5, 'BPOM', NULL, '2025-02-28 03:16:56', '2025-02-28 03:16:56'),
(17, 19, 'BPOM', NULL, '2025-03-04 22:05:22', '2025-03-04 22:05:22'),
(22, 24, 'HALAL', NULL, '2025-03-11 08:56:15', '2025-03-11 08:56:32'),
(23, 25, 'BPOM', NULL, '2025-03-18 04:22:40', '2025-03-18 04:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_channels`
--

CREATE TABLE `mpdr_channels` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_channels`
--

INSERT INTO `mpdr_channels` (`id`, `form_id`, `category`, `country`, `created_at`, `updated_at`) VALUES
(1, 1, 'Industrial', NULL, '2025-02-28 02:51:55', '2025-02-28 02:51:55'),
(5, 5, 'Industrial', NULL, '2025-02-28 03:16:56', '2025-02-28 03:16:56'),
(19, 19, 'Industrial', 'malaiy', '2025-03-04 22:05:22', '2025-03-04 22:05:22'),
(24, 24, 'FSBC-Direct', NULL, '2025-03-11 08:56:15', '2025-03-11 08:56:32'),
(25, 25, 'FSBC-Direct', NULL, '2025-03-18 04:22:40', '2025-03-18 04:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_competitor_products`
--

CREATE TABLE `mpdr_competitor_products` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packaging` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_detailed_packagings`
--

CREATE TABLE `mpdr_detailed_packagings` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_detailed_packagings`
--

INSERT INTO `mpdr_detailed_packagings` (`id`, `form_id`, `weight`, `category`, `detail`, `product_variation`, `created_at`, `updated_at`) VALUES
(1, 1, '232', 'Existing', '232', '232', '2025-02-28 02:51:55', '2025-02-28 02:51:55'),
(3, 5, '565', 'New', '4343', 'dafacva', '2025-02-28 03:16:56', '2025-02-28 03:16:56'),
(17, 19, '45', 'New', 'new\r\nnew detail packaging', 'produk variasi 1, produk variassi 2', '2025-03-04 22:05:22', '2025-03-04 22:05:22'),
(22, 24, '34', 'Existing', 'axcaz\r\nas', 'asaa', '2025-03-11 08:56:15', '2025-03-11 08:56:32'),
(23, 25, '3728', 'New', 'belom ada\r\nnew', 'variasi 1, variasi 2', '2025-03-18 04:22:40', '2025-03-18 04:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_forms`
--

CREATE TABLE `mpdr_forms` (
  `id` bigint UNSIGNED NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `revision_id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initiator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_forms`
--

INSERT INTO `mpdr_forms` (`id`, `no`, `user_id`, `revision_id`, `product_name`, `level_priority`, `initiator`, `status`, `created_at`, `updated_at`) VALUES
(1, '25MPDR0001', 1, 1, 'producta name', 'A', 'initaoaer', 'In Approval', '2025-02-28 02:51:55', '2025-02-28 02:51:55'),
(5, '25MPDR0002', 2, 1, 'product 2', 'A', 'initiator 2', 'In Approval', '2025-02-28 03:16:56', '2025-02-28 03:16:56'),
(19, '25MPDR0003', 1, 1, 'product 3', 'B', 'Admin', 'Rejected', '2025-03-04 22:05:22', '2025-03-07 00:58:19'),
(24, '25MPDR0004', 1, 1, 'asdwas', 'B', 'Arief Fazry', 'Approved', '2025-03-11 08:56:15', '2025-04-08 03:28:35'),
(25, '25MPDR0005', 1, 1, 'test produk 5', 'B', 'Ade Rusmana', 'Approved', '2025-03-18 04:22:40', '2025-03-18 07:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_form_details`
--

CREATE TABLE `mpdr_form_details` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `rational_for_development` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_launch` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_form_details`
--

INSERT INTO `mpdr_form_details` (`id`, `form_id`, `rational_for_development`, `target_launch`, `created_at`, `updated_at`) VALUES
(1, 1, '1321312', '2131321', '2025-02-28 02:51:55', '2025-02-28 02:51:55'),
(5, 5, '23131', 'ghdghdfg', '2025-02-28 03:16:56', '2025-02-28 03:16:56'),
(19, 19, 'rational developemnt\r\ndevelopemtn3 2', 'akhir januari', '2025-03-04 22:05:22', '2025-03-04 22:05:22'),
(24, 24, 'asdxzqwa', 'awdadawd', '2025-03-11 08:56:15', '2025-03-11 08:56:32'),
(25, 25, 'test rational for development', 'target januari', '2025-03-18 04:22:40', '2025-03-18 04:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_initiator_approved_details`
--

CREATE TABLE `mpdr_initiator_approved_details` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `initiator_nik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initiator_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `token` text COLLATE utf8mb4_unicode_ci,
  `approved_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_initiator_approved_details`
--

INSERT INTO `mpdr_initiator_approved_details` (`id`, `form_id`, `initiator_nik`, `initiator_name`, `status`, `comment`, `token`, `approved_date`, `created_at`, `updated_at`) VALUES
(6, 19, 'AG1111', 'Admin', 'approve with review', 'approved', NULL, '2025-03-06', '2025-03-04 22:05:22', '2025-03-06 00:08:16'),
(9, 24, 'T0932', 'Arief Fazry', 'approve', NULL, NULL, '2025-03-26', '2025-03-11 08:56:15', '2025-03-26 09:04:57'),
(10, 25, 'AG1315', 'Ade Rusmana', 'approve', NULL, NULL, '2025-03-18', '2025-03-18 04:22:42', '2025-03-18 05:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_market_updates`
--

CREATE TABLE `mpdr_market_updates` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `potential_volume` double(8,2) NOT NULL,
  `expected_margin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_estimate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_market_updates`
--

INSERT INTO `mpdr_market_updates` (`id`, `form_id`, `potential_volume`, `expected_margin`, `price_estimate`, `created_at`, `updated_at`) VALUES
(1, 1, 232.00, '21.00', '21.00', '2025-02-28 02:51:55', '2025-02-28 02:51:55'),
(2, 5, 3123.00, 'afafa', 'asa', '2025-02-28 03:16:56', '2025-02-28 03:16:56'),
(16, 19, 128.00, '8-80', '19.000', '2025-03-04 22:05:22', '2025-03-04 22:05:22'),
(21, 24, 43.00, '1-987', '12,.98', '2025-03-11 08:56:15', '2025-03-11 08:56:32'),
(22, 25, 567.00, '7-8', '-', '2025-03-18 04:22:40', '2025-03-18 04:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_product_categories`
--

CREATE TABLE `mpdr_product_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_product_categories`
--

INSERT INTO `mpdr_product_categories` (`id`, `form_id`, `category`, `other`, `created_at`, `updated_at`) VALUES
(1, 1, 'Margarine', NULL, '2025-02-28 02:51:55', '2025-02-28 02:51:55'),
(5, 5, 'Frying Fats', NULL, '2025-02-28 03:16:56', '2025-02-28 03:16:56'),
(19, 19, 'Others', 'Product Lain', '2025-03-04 22:05:22', '2025-03-04 22:05:22'),
(24, 24, 'Frying Fats', NULL, '2025-03-11 08:56:15', '2025-03-11 08:56:32'),
(25, 25, 'Frying Fats', NULL, '2025-03-18 04:22:40', '2025-03-18 04:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_product_descriptions`
--

CREATE TABLE `mpdr_product_descriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `product_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_temperature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_temperature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_product_descriptions`
--

INSERT INTO `mpdr_product_descriptions` (`id`, `form_id`, `product_description`, `usage_description`, `storage_temperature`, `delivery_temperature`, `created_at`, `updated_at`) VALUES
(1, 1, '<ol>\n<li>asdasdaa</li>\n<li><strong>asdada</strong></li>\n<li><strong><em>asdasdada</em></strong></li>\n<li style=\"text-align: center;\"><strong><em>asdada</em></strong></li>\n<li style=\"text-align: right;\"><strong><em>ssdadadada</em></strong></li>\n</ol>', '1231', '1231321', '1231', '2025-02-28 02:51:55', '2025-02-28 02:51:55');
INSERT INTO `mpdr_product_descriptions` (`id`, `form_id`, `product_description`, `usage_description`, `storage_temperature`, `delivery_temperature`, `created_at`, `updated_at`) VALUES
(3, 5, '<ol>\r\n<li>asdada</li>\r\n<li>asdada</li>\r\n</ol>\r\n<p><img src=\"data:image/png;base64,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\" width=\"314\" height=\"196\"></p>', 'qweqwe', 'sadvczvx', 'gfdgd', '2025-02-28 03:16:56', '2025-02-28 03:16:56');
INSERT INTO `mpdr_product_descriptions` (`id`, `form_id`, `product_description`, `usage_description`, `storage_temperature`, `delivery_temperature`, `created_at`, `updated_at`) VALUES
(17, 19, '<p>asdawdasdwa</p>\r\n<p>xcxcczcza</p>\r\n<p>vavadasdasx</p>', 'description', '12* C', '91*C', '2025-03-04 22:05:22', '2025-03-04 22:05:22'),
(22, 24, '<ol>\r\n<li>sxaxcau</li>\r\n<li>hljkhdjg</li>\r\n</ol>', 'asx', 'axca', 'wdsa', '2025-03-11 08:56:15', '2025-03-11 08:56:32');
INSERT INTO `mpdr_product_descriptions` (`id`, `form_id`, `product_description`, `usage_description`, `storage_temperature`, `delivery_temperature`, `created_at`, `updated_at`) VALUES
(23, 25, '<p>asdaxdadwdas</p>\r\n<p><img src=\"data:image/png;base64,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\" width=\"325\" height=\"203\"></p>', 'deskripsi usage', '29oC', '9-C', '2025-03-18 04:22:40', '2025-03-18 04:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `mpdr_revisions`
--

CREATE TABLE `mpdr_revisions` (
  `id` bigint UNSIGNED NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpdr_revisions`
--

INSERT INTO `mpdr_revisions` (`id`, `no`, `revision`, `date`, `created_at`, `updated_at`) VALUES
(1, 'F/S.1.4-02', 1, '2025-02-28', '2025-02-28 09:49:05', '2025-02-28 09:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view permission', 'web', '2025-02-25 18:12:15', '2025-02-25 18:12:15'),
(2, 'create permission', 'web', '2025-02-25 18:12:23', '2025-02-25 18:12:23'),
(3, 'update permission', 'web', '2025-02-25 18:13:56', '2025-02-25 18:13:56'),
(4, 'delete permission', 'web', '2025-02-25 18:14:01', '2025-02-25 18:14:01'),
(5, 'view role', 'web', '2025-02-25 18:14:12', '2025-02-25 18:14:12'),
(6, 'create role', 'web', '2025-02-25 18:14:17', '2025-02-25 18:14:17'),
(7, 'update role', 'web', '2025-02-25 18:14:22', '2025-02-25 18:14:22'),
(8, 'delete role', 'web', '2025-02-25 18:14:27', '2025-02-25 18:14:27'),
(9, 'view user', 'web', '2025-02-25 18:15:58', '2025-02-25 18:15:58'),
(10, 'create user', 'web', '2025-02-25 18:16:07', '2025-02-25 18:16:07'),
(11, 'update user', 'web', '2025-02-25 18:16:17', '2025-02-25 18:16:17'),
(12, 'delete user', 'web', '2025-02-25 18:16:32', '2025-02-25 18:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `slug`, `department_id`, `level_id`, `created_at`, `updated_at`) VALUES
(1, 'Developer', 'developer', 2, 8, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(2, 'General Manager', 'general-manager', 1, 17, '2024-10-09 00:39:36', '2024-10-31 23:59:59'),
(3, 'Department Head Finance', 'department-head-finance', 2, 7, '2024-10-09 00:39:36', '2024-10-31 23:57:05'),
(4, 'Assistant Manager MIS', 'assistant-manager-mis', 2, 5, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(5, 'Manager Accounting & Tax', 'manager-accounting-tax', 2, 5, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(6, 'Manager Bussiness Opr. Control', 'manager-bussiness-opr-control', 2, 5, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(7, 'IT Support', 'it-support', 2, 3, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(8, 'Web Developer', 'web-developer', 2, 3, '2024-10-09 00:39:36', '2024-10-31 23:57:20'),
(10, 'Department Head Supply Chain', 'department-head-supply-chain', 8, 6, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(11, 'Manager - Logistic', 'manager-logistic', 8, 6, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(12, 'Manager - PPIC', 'manager-ppic', 8, 6, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(13, 'Manager - Purchasing', 'manager-purchasing', 2, 6, '2024-10-09 00:39:36', '2024-11-01 01:07:03'),
(14, 'Supervisor - Export', 'supervisor-export', 8, 5, '2024-10-09 00:39:36', '2024-10-09 00:39:36'),
(16, 'Manager - Creative Bussines Tranformation', 'manager-creative-bussines-tranformation', 2, 6, '2024-10-31 23:50:45', '2024-10-31 23:50:45'),
(17, 'Senior Advisor', 'senior-advisor', 4, 7, '2024-10-31 23:55:12', '2024-10-31 23:55:12'),
(18, 'Assistant Manager-Batch Refinery', 'assistant-manager-batch-refinery', 4, 5, '2024-10-31 23:55:35', '2024-10-31 23:55:35'),
(19, 'Manager - Marsho Plant', 'manager-marsho-plant', 4, 6, '2024-10-31 23:55:51', '2024-10-31 23:55:51'),
(20, 'Manager - Business Opr. Control', 'manager-business-opr-control', 2, 6, '2024-11-01 00:01:10', '2024-11-01 00:01:10'),
(21, 'Supervisor - Business Opr. Controll', 'supervisor-business-opr-controll', 2, 4, '2024-11-01 00:01:24', '2024-11-01 00:01:24'),
(22, 'Manager - International Business', 'manager-international-business', 7, 6, '2024-11-01 00:02:54', '2024-11-01 00:02:54'),
(23, 'International Sales Executive', 'international-sales-executive', 7, 5, '2024-11-01 00:03:13', '2024-11-01 00:03:13'),
(24, 'Manager - Industrial & Key Account', 'manager-industrial-key-account', 7, 6, '2024-11-01 00:03:47', '2024-11-01 00:03:47'),
(25, 'Asst. Mgr - Key Account&Industrial', 'asst-mgr-key-accountindustrial', 7, 5, '2024-11-01 00:04:22', '2024-11-01 00:04:22'),
(26, 'Asst. Mgr - Industrial Commercial', 'asst-mgr-industrial-commercial', 7, 5, '2024-11-01 00:04:33', '2024-11-01 00:04:33'),
(27, 'Manager - Technical & Application', 'manager-technical-application', 7, 6, '2024-11-01 00:05:02', '2024-11-01 00:05:02'),
(28, 'Manager - Accounting & Tax', 'manager-accounting-tax', 3, 6, '2024-11-01 00:20:55', '2024-11-01 00:20:55'),
(29, 'Regional Sales Manager - Head of East Zone', 'regional-sales-manager-head-of-east-zone', 7, 6, '2024-11-01 00:22:43', '2024-11-01 00:22:43'),
(30, 'Dept. Head - Sales & Marketing', 'dept-head-sales-marketing', 7, 7, '2024-11-01 00:26:57', '2024-11-01 00:26:57'),
(31, 'Data Analis & Sales Support Specialist Supervisor', 'data-analis-sales-support-specialist-supervisor', 7, 4, '2024-11-01 00:27:16', '2024-11-01 00:27:16'),
(32, 'Staff', 'staff', 2, 3, '2024-11-01 00:32:05', '2024-11-01 00:32:05'),
(33, 'Manager - Engineering & Maintenance', 'manager-engineering-maintenance', 1, 6, '2024-11-01 00:51:55', '2024-11-01 00:51:55'),
(34, 'Manager HCD', 'manager-hcd', 3, 6, '2024-11-01 00:52:47', '2024-11-01 00:52:47'),
(35, 'Asst.Manager HSE', 'asstmanager-hse', 5, 5, '2024-11-01 00:53:28', '2024-11-01 00:53:28'),
(36, 'Dept. Head - Quality Mgmt & HSE', 'dept-head-quality-mgmt-hse', 5, 7, '2024-11-01 00:54:09', '2024-11-01 00:54:09'),
(37, 'Marketing Manager', 'marketing-manager', 7, 6, '2024-11-01 00:56:14', '2024-11-01 00:56:14'),
(38, 'RTM & Channel Development Ass. Manager', 'rtm-channel-development-ass-manager', 7, 5, '2024-11-01 00:56:37', '2024-11-01 00:56:37'),
(39, 'Brand Ambasador Gold Bullion', 'brand-ambasador-gold-bullion', 7, 6, '2024-11-01 00:58:53', '2024-11-01 00:58:53'),
(40, 'Assistant Marketing Manager', 'assistant-marketing-manager', 7, 5, '2024-11-01 00:59:07', '2024-11-01 00:59:07'),
(41, 'QA Supervisor', 'qa-supervisor', 5, 4, '2024-11-01 01:00:39', '2024-11-01 01:00:39'),
(42, 'QA Manager', 'qa-manager', 5, 6, '2024-11-01 01:01:17', '2024-11-01 01:01:17'),
(43, 'R & D Assistant Manager', 'r-d-assistant-manager', 6, 5, '2024-11-01 01:02:04', '2024-11-01 01:02:04'),
(44, 'Supervisor - R & D B', 'supervisor-r-d-b', 6, 4, '2024-11-01 01:02:17', '2024-11-01 01:02:17'),
(45, 'R&D Packaging & Regulatory', 'rd-packaging-regulatory', 6, 3, '2024-11-01 01:02:31', '2024-11-01 01:02:31'),
(46, 'R&D Application & Sensory', 'rd-application-sensory', 6, 3, '2024-11-01 01:02:41', '2024-11-01 01:02:41'),
(47, 'Manager - R & D', 'manager-r-d', 6, 6, '2024-11-01 01:02:58', '2024-11-01 01:02:58'),
(48, 'Supervisor-Tax', 'supervisor-tax', 2, 4, '2024-11-01 01:05:19', '2024-11-01 01:05:19'),
(49, 'Asst. Mgr - Tax', 'asst-mgr-tax', 2, 5, '2024-11-01 01:05:41', '2024-11-01 01:05:41'),
(50, 'Asst. Mgr - Finance & Adm.', 'asst-mgr-finance-adm', 2, 5, '2024-11-01 01:06:03', '2024-11-01 01:06:03'),
(51, 'Supervisor - Account Payable', 'supervisor-account-payable', 2, 4, '2024-11-01 01:06:19', '2024-11-01 01:06:19'),
(52, 'Jr. Secretary', 'jr-secretary', 2, 3, '2024-11-01 01:06:46', '2024-11-01 01:06:46'),
(53, 'Receptionist', 'receptionist', 2, 3, '2024-11-01 01:07:37', '2024-11-01 01:07:37'),
(54, 'Supervisor - Comp. & Benefit', 'supervisor-comp-benefit', 3, 4, '2024-11-01 01:08:03', '2024-11-01 01:08:03'),
(55, 'People & Organization Development Supervisor', 'people-organization-development-supervisor', 3, 4, '2024-11-01 01:08:42', '2024-11-01 01:08:42'),
(56, 'Talent Acquisition Supervisor', 'talent-acquisition-supervisor', 3, 4, '2024-11-01 01:08:53', '2024-11-01 01:08:53'),
(57, 'Chief Security', 'chief-security', 3, 4, '2024-11-01 01:09:39', '2024-11-01 01:09:39'),
(58, 'Manager - Logistic', 'manager-logistic', 8, 6, '2024-11-01 01:13:44', '2024-11-01 01:13:44'),
(59, 'Asst. Mgr - QC', 'asst-mgr-qc', 5, 5, '2024-11-01 01:14:21', '2024-11-01 01:14:21'),
(60, 'Key Account Supervisor', 'key-account-supervisor', 7, 4, '2024-11-01 01:15:35', '2024-11-01 01:15:35'),
(61, 'Regional Sales Manager - Head of West Zone', 'regional-sales-manager-head-of-west-zone', 7, 6, '2024-11-01 01:19:23', '2024-11-01 01:19:23'),
(62, 'Dept. Head - HCD', 'dept-head-hcd', 3, 7, '2024-12-03 19:55:35', '2024-12-03 19:55:53');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_approved_details`
--

CREATE TABLE `pre_mpdr_approved_details` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `approver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_approved_details`
--

INSERT INTO `pre_mpdr_approved_details` (`id`, `form_id`, `approver`, `name`, `level`, `status`, `comment`, `token`, `approved_date`, `created_at`, `updated_at`) VALUES
(21, 10, 'S0905', 'Jimmy Ferdinand', 1, 'approve', NULL, NULL, '2025-03-03', '2025-02-28 02:03:33', '2025-03-02 21:38:38'),
(22, 10, 'M0812', 'Djarot Hendrawan', 2, 'approve with review', 'tst', NULL, '2025-03-03', '2025-02-28 02:03:33', '2025-03-02 21:39:57'),
(23, 10, 'T0930', 'Linda Rianty', 3, NULL, NULL, NULL, NULL, '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(24, 10, 'T0932', 'Arief Fazry', 4, NULL, NULL, NULL, NULL, '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(25, 11, 'AE1279', 'Fitriyah Rahayu', 1, NULL, NULL, NULL, NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(26, 11, 'AC1166', 'Dimas Supriyadi', 2, NULL, NULL, NULL, NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(27, 11, 'AD1227', 'Andika Suhendar', 3, NULL, NULL, NULL, NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(28, 11, 'Q0881', 'Maria Muyarni', 4, NULL, NULL, NULL, NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(49, 17, 'S0905', 'Jimmy Ferdinand', 1, 'approve with review', 'approve nih', NULL, '2025-03-13', '2025-03-09 19:27:27', '2025-03-13 08:17:31'),
(50, 17, 'M0812', 'Djarot Hendrawan', 2, 'approve', NULL, NULL, '2025-03-13', '2025-03-09 19:27:27', '2025-03-13 08:28:56'),
(51, 17, 'T0930', 'Linda Rianty', 3, 'approve with review', 'test approvveee', NULL, '2025-03-17', '2025-03-09 19:27:27', '2025-03-17 06:57:25'),
(52, 17, 'T0932', 'Arief Fazry', 4, 'approve', NULL, NULL, '2025-03-17', '2025-03-09 19:27:27', '2025-03-17 07:17:02'),
(57, 19, 'AE1279', 'Fitriyah Rahayu', 1, 'approve with review', 'test approve review', 'ec138902-85ed-4b01-8eb9-8bbf9fd225b5', '2025-03-11', '2025-03-09 20:06:51', '2025-03-11 02:51:14'),
(58, 19, 'AC1166', 'Dimas Supriyadi', 2, 'approve', NULL, '39a14057-1308-4831-915a-8846c56499cc', '2025-03-11', '2025-03-09 20:06:51', '2025-03-11 02:52:13'),
(59, 19, 'Z1058', 'Ronal Katili', 3, 'approve', NULL, '75dc1b42-eb4e-48b2-822a-46ef323675d7', '2025-03-11', '2025-03-09 20:06:51', '2025-03-11 04:10:07'),
(60, 19, 'X1031', 'Edie Hirman', 4, 'approve with review', 'Sudah di approve', 'f6aaf2d0-e330-4e19-a9eb-66f0ea1365d7', '2025-03-11', '2025-03-09 20:06:51', '2025-03-11 04:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_approvers`
--

CREATE TABLE `pre_mpdr_approvers` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `initiator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing_manager` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_approvers`
--

INSERT INTO `pre_mpdr_approvers` (`id`, `form_id`, `initiator`, `sales_manager`, `marketing_manager`, `department_head`, `created_at`, `updated_at`) VALUES
(8, 10, 'S0905', 'M0812', 'T0930', 'T0932', '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(9, 11, 'AE1279', 'AC1166', 'AD1227', 'Q0881', '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(15, 17, 'S0905', 'M0812', 'T0930', 'T0932', '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(17, 19, 'AE1279', 'AC1166', 'Z1058', 'X1031', '2025-03-09 20:06:51', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_certification_requirements`
--

CREATE TABLE `pre_mpdr_certification_requirements` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_certification_requirements`
--

INSERT INTO `pre_mpdr_certification_requirements` (`id`, `form_id`, `category`, `other`, `created_at`, `updated_at`) VALUES
(10, 10, 'BPOM', NULL, '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(11, 11, 'BPOM', NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(17, 17, 'BPOM', NULL, '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(19, 19, 'Others', 'test percobaan', '2025-03-09 20:06:51', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_channels`
--

CREATE TABLE `pre_mpdr_channels` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_channels`
--

INSERT INTO `pre_mpdr_channels` (`id`, `form_id`, `category`, `country`, `created_at`, `updated_at`) VALUES
(10, 10, 'FSBC-Direct', NULL, '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(11, 11, 'FSBC-Direct', NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(17, 17, 'Industrial', NULL, '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(19, 19, 'Regional', NULL, '2025-03-09 20:06:51', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_competitor_products`
--

CREATE TABLE `pre_mpdr_competitor_products` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packaging` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_competitor_products`
--

INSERT INTO `pre_mpdr_competitor_products` (`id`, `form_id`, `name`, `size`, `packaging`, `price`, `created_at`, `updated_at`) VALUES
(15, 19, 'produk 1', 'L', 'test', '20.000', '2025-03-11 02:41:54', '2025-03-11 02:41:54'),
(16, 17, '1231', '123', 'dfjad', 'qo34', '2025-03-11 04:23:32', '2025-03-11 04:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_detailed_packagings`
--

CREATE TABLE `pre_mpdr_detailed_packagings` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_variation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_detailed_packagings`
--

INSERT INTO `pre_mpdr_detailed_packagings` (`id`, `form_id`, `weight`, `category`, `detail`, `product_variation`, `created_at`, `updated_at`) VALUES
(9, 10, '56', 'Existing', '2', '32', '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(10, 11, '56', 'New', 'zxcz', 'asa', '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(16, 17, '38', 'Existing', 'atesaD', 'list product', '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(18, 19, '31', 'New', 'new\r\ndetails', 'variasi produk', '2025-03-09 20:06:51', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_forms`
--

CREATE TABLE `pre_mpdr_forms` (
  `id` bigint UNSIGNED NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `revision_id` bigint UNSIGNED NOT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_forms`
--

INSERT INTO `pre_mpdr_forms` (`id`, `no`, `user_id`, `revision_id`, `project_name`, `brand_name`, `level_priority`, `status`, `route_to`, `created_at`, `updated_at`) VALUES
(10, '25PREMPDR0001', 1, 1, '1', 'asdad', 'B', 'Approved', NULL, '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(11, '25PREMPDR0002', 1, 1, 'axxzc', 'zxcz', 'C', 'Rejected', NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(17, '25PREMPDR0004', 1, 1, 'test project 10', 'trst projeect', 'B', 'Approved', 'Arief Fazry', '2025-03-09 19:27:27', '2025-03-17 07:17:02'),
(19, '25PREMPDR0005', 1, 1, 'test project 05', 'test brand', 'B', 'Approved', NULL, '2025-03-09 20:06:50', '2025-03-11 04:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_form_details`
--

CREATE TABLE `pre_mpdr_form_details` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `rational_for_development` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_launch` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_form_details`
--

INSERT INTO `pre_mpdr_form_details` (`id`, `form_id`, `rational_for_development`, `target_launch`, `created_at`, `updated_at`) VALUES
(10, 10, 'adsdadwa', 'aefasda', '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(11, 11, 'czxczczx', 'asdazx', '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(17, 17, 'test', 'end of mei', '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(19, 19, 'rational development', 'asdwa', '2025-03-09 20:06:50', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_market_updates`
--

CREATE TABLE `pre_mpdr_market_updates` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `potential_volume` double(8,2) NOT NULL,
  `expected_margin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_estimate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_market_updates`
--

INSERT INTO `pre_mpdr_market_updates` (`id`, `form_id`, `potential_volume`, `expected_margin`, `price_estimate`, `created_at`, `updated_at`) VALUES
(8, 10, 454.00, '2-7', '-', '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(9, 11, 675.00, '6-6765', 'zxcz', '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(15, 17, 35.00, '7-8', '-', '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(17, 19, 10.00, '45', '1231', '2025-03-09 20:06:51', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_product_categories`
--

CREATE TABLE `pre_mpdr_product_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_product_categories`
--

INSERT INTO `pre_mpdr_product_categories` (`id`, `form_id`, `category`, `other`, `created_at`, `updated_at`) VALUES
(10, 10, 'Frying Fats', NULL, '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(11, 11, 'Pastry', NULL, '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(17, 17, 'Pastry', NULL, '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(19, 19, 'Frying Fats', NULL, '2025-03-09 20:06:51', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_product_descriptions`
--

CREATE TABLE `pre_mpdr_product_descriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_temperature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_temperature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_product_descriptions`
--

INSERT INTO `pre_mpdr_product_descriptions` (`id`, `form_id`, `product_description`, `usage_description`, `storage_temperature`, `delivery_temperature`, `created_at`, `updated_at`) VALUES
(10, 10, 'asda', 'xczcx', 'asg', 'fdsf', '2025-02-28 02:03:33', '2025-02-28 02:03:33'),
(11, 11, 'axcaa', 'xczas', 'daas', 'xzcz', '2025-02-28 02:04:18', '2025-02-28 02:04:18'),
(17, 17, 'test\r\ntest\r\nasdada', 'dsasdaw', '13', 'r45', '2025-03-09 19:27:27', '2025-03-11 04:23:32'),
(19, 19, 'ad\r\nasd', 'usag deksiripsi', 'storage', 'delivery', '2025-03-09 20:06:51', '2025-03-11 02:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pre_mpdr_revisions`
--

CREATE TABLE `pre_mpdr_revisions` (
  `id` bigint UNSIGNED NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pre_mpdr_revisions`
--

INSERT INTO `pre_mpdr_revisions` (`id`, `no`, `revision`, `date`, `created_at`, `updated_at`) VALUES
(1, 'F/S.1.4-01', 0, '2025-02-12', '2025-02-12 01:54:08', '2025-02-12 01:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(13, 'super-admin', 'web', '2024-10-09 00:39:35', '2024-10-09 00:39:35'),
(14, 'admin', 'web', '2024-10-09 00:39:35', '2024-10-09 00:39:35'),
(15, 'staff', 'web', '2024-10-09 00:39:35', '2024-10-09 00:39:35'),
(16, 'user', 'web', '2024-10-09 00:39:35', '2024-10-09 00:39:35'),
(18, 'approver', 'web', '2024-11-03 21:49:46', '2024-11-03 21:49:46'),
(19, 'user_idea', 'web', '2024-11-03 22:00:48', '2024-11-03 22:00:57'),
(20, 'gm', 'web', '2025-03-04 19:24:16', '2025-03-04 19:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 13),
(2, 13),
(3, 13),
(4, 13),
(5, 13),
(6, 13),
(7, 13),
(8, 13),
(9, 13),
(10, 13),
(11, 13),
(12, 13);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Engineering & Maintenance', '2024-11-01 03:50:00', '2024-11-01 03:50:11'),
(2, 'HCD', '2024-11-01 03:50:02', '2024-11-01 03:50:11'),
(4, 'Purchasing', '2024-11-01 03:50:03', '2024-11-01 03:50:10'),
(5, 'Creative Business Transformation', '2024-11-01 03:50:04', '2024-11-01 03:50:09'),
(6, 'Export Admin', '2024-11-01 03:50:04', '2024-11-01 03:50:09'),
(7, 'Batch Refinery', '2024-11-01 03:50:06', '2024-11-01 03:50:08'),
(8, 'Business Controller', '2024-11-01 03:50:05', '2024-11-01 03:50:08'),
(9, 'East Region', '2024-11-01 03:50:06', '2024-11-01 03:50:07'),
(10, 'Finance', '2024-11-01 04:21:19', '2024-11-01 04:21:20'),
(11, 'GA', '2024-11-01 04:26:50', '2024-11-01 04:26:51'),
(12, 'HSE', '2024-11-01 04:26:51', '2024-11-01 04:26:52'),
(13, 'Industrial & Key Account', '2024-11-01 04:26:53', '2024-11-01 04:26:53'),
(14, 'International Sales', '2024-11-01 04:26:54', '2024-11-01 04:26:54'),
(15, 'Logistic', '2024-11-01 04:26:56', '2024-11-01 04:26:55'),
(16, 'Marketing', '2024-11-01 04:26:57', '2024-11-01 04:26:56'),
(17, 'Marsho', '2024-11-01 04:26:57', '2024-11-01 04:27:06'),
(18, 'MIS', '2024-11-01 04:26:58', '2024-11-01 04:27:05'),
(19, 'PPIC', '2024-11-01 04:26:59', '2024-11-01 04:27:05'),
(20, 'QA', '2024-11-01 04:26:59', '2024-11-01 04:27:04'),
(21, 'QC', '2024-11-01 04:27:00', '2024-11-01 04:27:04'),
(22, 'R & D', '2024-11-01 04:27:00', '2024-11-01 04:27:03'),
(23, 'RTM', '2024-11-01 04:27:01', '2024-11-01 04:27:03'),
(24, 'Sales Admin', '2024-11-01 04:27:01', '2024-11-01 04:27:02'),
(25, 'Technical', '2024-11-01 04:27:07', '2024-11-01 04:27:09'),
(26, 'West Region', '2024-11-01 04:27:08', '2024-11-01 04:27:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nik` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` int UNSIGNED DEFAULT NULL,
  `position_id` bigint UNSIGNED DEFAULT NULL,
  `section_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `name`, `email`, `password`, `avatar`, `remember_token`, `created_at`, `updated_at`, `department_id`, `position_id`, `section_id`, `status`) VALUES
(1, 'AG1111', 'Admin', 'staff@smii.co.id', '$2y$12$YjBvJTmOwhwIBSsh47YKR.pElE6DgdbaObLysE9IZqN00wlUsBcAa', NULL, NULL, '2024-10-09 00:39:35', '2025-02-27 19:18:49', 2, 32, 18, 'Active'),
(2, 'AG2222', 'Manager', 'staff@smii.co.id', '$2y$12$IKw.O34doXQsTQz.EiDlVeUAVhCsJu6kkwzAGrc10dsyrZkkSnXNK', NULL, NULL, '2024-10-09 00:39:36', '2024-12-03 21:23:43', 3, 32, 1, 'Active'),
(3, 'Ag3333', 'Staff', 'staff@smii.co.id', '$2y$12$jJ.hZlJJBtl2IA/Xy7Lc.uPR/WYdnuIxQvegs/QCIBFjbtHtoDve6', NULL, NULL, '2024-10-09 00:39:36', '2024-10-09 00:39:36', 2, 32, 1, 'Active'),
(4, 'Ag4444', 'Karyawan', 'staff@smii.co.id', '$2y$12$Lk0TaKuvGxvfc1v6g6gawuEEqdWikIzIfAE/T4L7y9XfRqOgdUpE.', NULL, NULL, '2024-10-09 00:39:36', '2024-10-09 00:39:36', 2, 32, 1, 'Active'),
(10, 'AG1315', 'Ade Rusmana', 'ade.rusmana@smii.co.id', '$2y$12$1qqe7LXZPXHcJKQepfUhhuVuJRRAvpeKzt8XYWURN6ow0Sgoo4l0S', 'AG1315.jpg', 'IDP4naAuVOAIsV31YMmHUX4e8naXg0cy3cFxEPKyatknTPb7FTxaS5lc0X7Z', '2024-10-14 21:24:45', '2024-12-20 00:35:38', 2, 1, 18, 'Active'),
(980, 'S0905', 'Jimmy Ferdinand', 'jimmy.ferdinand@smii.co.id', '$2y$12$qVntPsPT7NZOdF.tgN7chupqfTk3KXP1EdKFwlBnuy8Wwf/S/J9jq', '', NULL, '2024-11-03 19:07:47', '2024-12-03 20:38:45', 1, 33, 1, 'Active'),
(982, 'M0812', 'Djarot Hendrawan', 'djarot.hendrawan@smii.co.id', '$2y$12$NY7BuQw9RYFtRpKUcgm06Occfk4DwwzThWEieQgdzABhLA64d3Lmu', '', NULL, '2024-11-03 19:07:48', '2024-12-04 02:03:28', 4, 32, 17, 'Active'),
(983, 'T0930', 'Linda Rianty', 'linda.rianty@smii.co.id', '$2y$12$3ZPDu8gQsaEJMaIu.T1Uvu9qdfql1Y2j2whvHJKkUyC2Zkebq2zqu', '', NULL, '2024-11-03 19:07:48', '2024-12-03 21:08:41', 2, 32, 4, 'Active'),
(984, 'T0932', 'Arief Fazry', 'arief.fazry@smii.co.id', '$2y$12$xnBHdgWD2IpuJblTtL9g4OTmDXRaNOfTluGUMD4us7sTCKwNfmxyW', '', NULL, '2024-11-03 19:07:48', '2025-02-27 22:22:04', 2, 32, 5, 'Active'),
(985, 'AE1279', 'Fitriyah Rahayu', 'fitriyah.rahayu@smii.co.id', '$2y$12$LuRlxysvZuv84oQICqMIMONtkYJG07JQMsmPctzWG.4F3/U5uOYTe', NULL, NULL, '2024-11-03 19:07:48', '2025-03-11 02:36:41', 8, 32, 6, 'Active'),
(986, 'AC1166', 'Dimas Supriyadi', 'staff@smii.co.id', '$2y$12$KlSfcIvF1DkCQK9VYnP62.7JLY0W0qubdi0k0eTn73JENOABC/ddS', '', NULL, '2024-11-03 19:07:49', '2024-12-03 21:12:56', 4, 32, 7, 'Active'),
(987, 'A0121', 'Mujiyono', 'staff@smii.co.id', '$2y$12$uo.OXFp2voBJDnY3uA7gjOsCsyLHPcIaDHOdY8cvNj3I4DRQyD6Ly', '', NULL, '2024-11-03 19:07:49', '2024-12-03 21:10:01', 4, 32, 7, 'Active'),
(988, 'AE1275', 'Ahmad Suryalatif', 'staff@smii.co.id', '$2y$12$/xN1CVHzrr1dci8mqxlDRuuG2uud1AIpUHCnj3MkVHOcHQ7l92xgm', '', NULL, '2024-11-03 19:07:49', '2024-12-03 21:13:34', 4, 32, 7, 'Active'),
(989, 'A0163', 'Sutikno', 'staff@smii.co.id', '$2y$12$XzjXyNhrLrojsrc6v37Z4e1Ju5s/sY2wmMjSosl3hRtXxPFWjEZyu', '', NULL, '2024-11-03 19:07:49', '2024-12-03 21:14:17', 4, 32, 7, 'Active'),
(990, 'F0629', 'Ali Maksum', 'staff@smii.co.id', '$2y$12$tjSywcx05/5rC51VqwYUW.ToAqHNgJv3AV3fsoT6bWgaNcFrP/h0q', '', NULL, '2024-11-03 19:07:49', '2024-12-03 21:35:05', 4, 32, 7, 'Active'),
(991, 'I0726', 'Asep Sopiana', 'staff@smii.co.id', '$2y$12$w5NeFJygz7QWgGIDqmuRceh1bHUxpIoXC4Izn6RlSe9o2X72drhqu', '', NULL, '2024-11-03 19:07:50', '2024-12-04 19:10:58', 4, 32, 7, 'Active'),
(992, 'N0826', 'Ahmad Sanusi', 'staff@smii.co.id', '$2y$12$iFSPh.I00mAsNQTEn4qwwu2kFIsOJpAKjQsL0p2mNHUBuaKmyGU16', '', NULL, '2024-11-03 19:07:50', '2024-12-03 21:33:07', 4, 32, 7, 'Active'),
(993, 'A0150', 'Sumadi', 'staff@smii.co.id', '$2y$12$jECqV.nqzh0n6DBXlj68ce0w6dn707P0UGWkj5MZxYhfG9wfJzpQC', '', NULL, '2024-11-03 19:07:50', '2024-12-03 21:33:35', 4, 32, 7, 'Active'),
(994, 'F0607', 'Sudarmanta', 'staff@smii.co.id', '$2y$12$zZRFVP5.n4paTRqZaymn7e0trGJ4N9JqaZhUhctUlu18sMQmWfqSG', '', NULL, '2024-11-03 19:07:50', '2024-12-03 21:34:05', 4, 32, 7, 'Active'),
(995, 'H0670', 'Endra Komara', 'staff@smii.co.id', '$2y$12$YkFN1ATqOiUZ.q9vYFt33uTkRrBKR8JXy80KHgiOMyC5s.bsGkn9W', '', NULL, '2024-11-03 19:07:51', '2024-12-03 21:34:26', 4, 32, 7, 'Active'),
(996, 'H0674', 'Yulianto', 'staff@smii.co.id', '$2y$12$VIHUmmqXuhTIG16MJse3zeqs6DOTrWmb4VEJQa2vSHrEvdT.nMGNG', '', NULL, '2024-11-03 19:07:51', '2024-12-03 21:35:38', 4, 32, 7, 'Active'),
(997, 'I0729', 'Musyaddad', 'staff@smii.co.id', '$2y$12$HexfS4soCmKP5eMlhg8Fm.SQzyU5adUHrRKGd0UtOqm8SkNOvABeS', '', NULL, '2024-11-03 19:07:51', '2024-12-03 21:37:18', 4, 32, 7, 'Active'),
(998, 'K0781', 'Agus Uminir', 'staff@smii.co.id', '$2y$12$LOA2rrYTm9VHb7EUfBZUM.Kf0xt/fc8lFv1DjB9WSeZEokp9qVl6y', '', NULL, '2024-11-03 19:07:51', '2024-12-03 21:40:05', 4, 32, 7, 'Active'),
(999, 'K0784', 'Juhardani', 'staff@smii.co.id', '$2y$12$37ha/jLVu2nhBXgHznsHcuXG4yMH5cvPVR3IUB13wBYm237lHK.Ja', '', NULL, '2024-11-03 19:07:51', '2024-12-03 21:37:41', 4, 32, 7, 'Active'),
(1000, 'K0785', 'Junaidi', 'staff@smii.co.id', '$2y$12$HOAROwrF1w/vTJFqtltNleNNhhjBMpHgLKZNoS50jqbUPWEcrvBrW', '', NULL, '2024-11-03 19:07:52', '2024-12-03 21:36:45', 4, 32, 7, 'Active'),
(1001, 'U0956', 'Madin', 'staff@smii.co.id', '$2y$12$MJgoVtPeq64O5nBlJZJDpeypp8zmJX/dO3GyD2dKLoEI7gRVpfS0S', '', NULL, '2024-11-03 19:07:52', '2024-11-03 19:07:52', 4, 32, 7, 'Active'),
(1002, 'U0957', 'Dwi Hastono', 'staff@smii.co.id', '$2y$12$5fUfp3zgKqNFiOdz5jcUp.ha8OwBqutGq9CJ/E9sWN3PY2SC7JU3C', '', NULL, '2024-11-03 19:07:52', '2024-11-03 19:07:52', 4, 32, 7, 'Active'),
(1003, 'AC1170', 'Nein', 'staff@smii.co.id', '$2y$12$dItD/xUJwyE4TQIXIcBMYurtY1FtuYqTc3U.gYCT4aGFqS7mv8PRy', '', NULL, '2024-11-03 19:07:52', '2024-12-03 21:32:23', 4, 32, 7, 'Active'),
(1004, 'AC1188', 'Sultan Syahjamawi Ali', 'staff@smii.co.id', '$2y$12$cj7A6QtSs4aJJx9HCvjrGugxyGFKIlb8dRK7vL9jAEZYb6en1mY8K', '', NULL, '2024-11-03 19:07:52', '2024-11-03 19:07:52', 4, 32, 7, 'Active'),
(1005, 'AD1226', 'Ubaidilah', 'staff@smii.co.id', '$2y$12$A2ZrU3GSujvRPUMudvnKDebu9P5cKp0Kqg4jDcYicDbG/Qh6HMjqq', '', NULL, '2024-11-03 19:07:53', '2024-12-03 21:40:36', 4, 32, 7, 'Active'),
(1006, 'AE1254', 'Fikri Irmawan', 'staff@smii.co.id', '$2y$12$/8QBNlEU7oxutiKPgoukKO/ZpoZ94kKWQ5kxJddsxNjGQoOdZ66pC', '', NULL, '2024-11-03 19:07:53', '2024-12-03 21:41:26', 4, 32, 7, 'Active'),
(1007, 'AE1267', 'Dika Vauzan Sobirin', 'staff@smii.co.id', '$2y$12$LbCAJM0zHHYd18vmnhLZ.OmMJoo/tVEi44JmsGBCux0qDUNcUiBx6', '', NULL, '2024-11-03 19:07:53', '2024-12-03 21:46:06', 4, 32, 7, 'Active'),
(1008, 'AG1323', 'Ammar Fauzan', 'staff@smii.co.id', '$2y$12$b.9KJTfa96.0Y04InrPGk.9H6ovmib1TiSY.Oj1ZbS1eyODl1HXTG', 'AG1323.jpg', NULL, '2024-11-03 19:07:53', '2024-12-16 20:52:14', 4, 32, 7, 'Active'),
(1009, 'U0955', 'Danu Purboyo', 'staff@smii.co.id', '$2y$12$/q4j4w7lNp8X0lRgW43XEuumyKH7h44Llvl1FPGhdn3fidFpK5rZG', '', NULL, '2024-11-03 19:07:54', '2024-12-03 21:45:21', 2, 32, 8, 'Active'),
(1010, 'AB1139', 'Ellyza Kusuma Wardani', 'staff@smii.co.id', '$2y$12$TtRX1.7hrTo6pKRQDhA5s.Tq6uanL4Appi5q5A3jN.UnILcElRW2K', '', NULL, '2024-11-03 19:07:54', '2024-12-03 21:44:52', 2, 32, 8, 'Active'),
(1011, 'Z1073', 'Kunto Guritno', 'kunto.guritno@smii.co.id', '$2y$12$Q5.K2flVJFVgUAEPrp.tjuPZhu1HOCY2QbZVqBilrftV7dtUg7Oeq', 'Z1073.png', NULL, '2024-11-03 19:07:54', '2024-12-25 18:18:44', 2, 32, 8, 'Active'),
(1012, 'S0900', 'Syahruzar Syam', 'staff@smii.co.id', '$2y$12$OSAnHAHaV1sdEMGeEl5XfuaC1jGf.uAvHo.bMByuCgdryjYa5yqkC', '', NULL, '2024-11-03 19:07:54', '2024-12-03 21:44:19', 7, 32, 9, 'Active'),
(1013, 'K0769', 'Jack Gembira Sitinjak', 'staff@smii.co.id', '$2y$12$14ukq8WHEYif1fN0aceLyO7QH10wEMr5dpMYMBToMtGMckScxE8hS', '', NULL, '2024-11-03 19:07:54', '2024-12-03 21:43:33', 7, 32, 9, 'Active'),
(1015, 'U0941', 'Aditiawansyah', 'aditiawansyah@smii.co.id', '$2y$12$QBmnYpPm/BvjFy0oP3O9xeB.Yb.uMKPGCktV17O.78k/HtkH8KDnO', '', NULL, '2024-11-03 19:07:55', '2024-12-11 23:22:43', 7, 32, 9, 'Active'),
(1016, 'AC1177', 'Khairudin', 'staff@smii.co.id', '$2y$12$9SeuRZtopVvx7m5obCC70u0ljIy0zIkF96Ad9HgjL1yql8eZDW5H2', '', NULL, '2024-11-03 19:07:55', '2024-12-03 21:50:05', 7, 32, 9, 'Active'),
(1017, 'AF1301', 'Arip Haryanto', 'staff@smii.co.id', '$2y$12$1HcA5AymCd10LShpc1cGMeH9kXjikBRjUFv.uoHCQrL4pTMKTiLii', '', NULL, '2024-11-03 19:07:55', '2024-12-03 21:50:27', 7, 32, 9, 'Active'),
(1018, 'X1030', 'Sapto Yogasmara', 'staff@smii.co.id', '$2y$12$fmopLwZ06MZL8Ob3KxaVMe0wAsFmKqdKMxhD/DDuitPBIpl0eDkP6', '', NULL, '2024-11-03 19:07:55', '2024-12-24 01:41:00', 7, 32, 9, 'Active'),
(1019, 'AF1292', 'Arham Bisma Bahari', 'staff@smii.co.id', '$2y$12$HdlFIIcebrlDvsY0jw.xwODOO.LdpmlqKefNTBQV7BUbH2FUxA35W', '', NULL, '2024-11-03 19:07:56', '2024-12-03 21:50:59', 7, 32, 9, 'Active'),
(1020, 'AF1295', 'Anwar Rusady', 'staff@smii.co.id', '$2y$12$QQtw/KN5E.zhdHlIz4qlmOh8WydOfhhX4TXPuS5ejEVLxuIIOaBIm', '', NULL, '2024-11-03 19:07:56', '2024-12-22 23:47:21', 7, 32, 9, 'Active'),
(1021, 'AF1299', 'Dewi Nurhayati', 'staff@smii.co.id', '$2y$12$b05G3S6zl68rXmkpzczwAe75nDIZ0XT08q8xPcaLu4KSAZ23CQOoK', '', NULL, '2024-11-03 19:07:56', '2024-12-04 19:28:47', 7, 32, 9, 'Active'),
(1022, 'AF1302', 'Andrie Setiadi Putera', 'andrie.putera@smii.co.id', '$2y$12$q/0D4VfbKje4KqzB7oNv9ei9L.Zj/xVOTYwTHrEikmvBfv7LyGkd.', '', NULL, '2024-11-03 19:07:56', '2024-12-11 19:45:55', 7, 32, 9, 'Active'),
(1023, 'AG1319', 'Albet Nego', 'staff@smii.co.id', '$2y$12$1n0qR.Uq9keyhlTDrKECW.oBfRpZIAVxjPjdBON2IIbsa.RS1IO1W', '', NULL, '2024-11-03 19:07:57', '2024-11-03 19:07:57', 7, 32, 9, 'Active'),
(1024, 'AG1322', 'Hery Martono', 'hery.martono@smii.co.id', '$2y$12$6.H5fY2jGTZDInIavejhceth6eyag3qoAvwt0CDdJ3gJqf8jEOEK.', '', NULL, '2024-11-03 19:07:57', '2024-12-11 19:32:13', 7, 32, 9, 'Active'),
(1025, 'Z1079', 'Mifa Miftahul Chair', 'miftahul.choir@smii.co.id', '$2y$12$2EI9PSip7ibprvYqULytP.SRtb0I4NnmV6gK5knV/46vUuO1royXG', '', NULL, '2024-11-03 19:07:57', '2024-12-11 19:55:23', 7, 32, 9, 'Active'),
(1026, 'AA1104', 'Akhmad Sahril', 'staff@smii.co.id', '$2y$12$YkBenj6BikTpLP2KwYJ28.EDGpm1sZYqleY94W0.SYdsZMrfp32Fq', '', NULL, '2024-11-03 19:07:57', '2024-12-04 18:52:14', 7, 32, 9, 'Active'),
(1027, 'AC1165', 'Leri Christian Manafe', 'staff@smii.co.id', '$2y$12$bVyDv02sfael4QTaoJVsJub..8Iwx3Ni/px1qVQHhkmwfPzT2uws6', '', NULL, '2024-11-03 19:07:57', '2024-12-04 19:28:18', 7, 32, 9, 'Active'),
(1028, 'AC1168', 'Sugeng Hariyanto', 'staff@smii.co.id', '$2y$12$uEjLpjZnPTJlPWLH1I2bsOh5ALdqfxk5//x8E8QegTQVnIPXgK4uq', '', NULL, '2024-11-03 19:07:58', '2024-11-03 19:07:58', 7, 32, 9, 'Active'),
(1029, 'AD1234', 'Azwar Munif', 'staff@smii.co.id', '$2y$12$F7es369SPrOhaPe3EPDb5udVHjAQMFQOPcS.oBut6vjopKl.JRI4.', '', NULL, '2024-11-03 19:07:58', '2024-11-03 19:07:58', 7, 32, 9, 'Active'),
(1030, 'AD1237', 'Dendi Heriyanto', 'staff@smii.co.id', '$2y$12$ZmtuuiVFgWUP34LPJXqA..Xl1jJcYb.bSbVGOInYZZJV9VkSZ/wOe', '', NULL, '2024-11-03 19:07:58', '2024-12-04 19:28:25', 7, 32, 9, 'Active'),
(1031, 'AE1272', 'Saeful Safar', 'staff@smii.co.id', '$2y$12$GuGD8ql5NcdTnn8dVUf8GuxkkVy.Ng95FZtqK/RqSxJADkCqsqape', '', NULL, '2024-11-03 19:07:58', '2024-12-04 19:47:49', 7, 32, 9, 'Active'),
(1032, 'AF1297', 'Lopu Satria Nugraha', 'staff@smii.co.id', '$2y$12$6VUYoz5fWf4/JGbj3RuSqOTiLXz2IhzC.CcEDxoOEsfq.7BtiiOs2', '', NULL, '2024-11-03 19:07:59', '2024-12-04 19:47:08', 7, 32, 9, 'Active'),
(1033, 'AF1303', 'Nova Lila Sari', 'staff@smii.co.id', '$2y$12$xb7Avom5SYqjsNJGkSfTnuqdgGLyl2F5UZD7T8IQT1ZK5bstSuD5O', '', NULL, '2024-11-03 19:07:59', '2024-12-04 19:47:28', 7, 32, 9, 'Active'),
(1034, 'AG1310', 'Lepi Candra', 'staff@smii.co.id', '$2y$12$RJd6fgsEoxSAUGImHgC9heXMD6JflgoWzv8XCN91LdC/wRaMq1Y0y', '', NULL, '2024-11-03 19:07:59', '2024-12-04 19:46:47', 7, 32, 9, 'Active'),
(1035, 'AG1316', 'Ali Mahmudi', 'staff@smii.co.id', '$2y$12$DtPU6PkXWW7QvSWzVLS9COtdBOjhxCsc6x5uPc29vQUy2rRnuDUL2', '', NULL, '2024-11-03 19:07:59', '2024-12-11 20:02:00', 7, 32, 9, 'Active'),
(1036, 'AG1321', 'Zuniar Usman', 'staff@smii.co.id', '$2y$12$TqlN/GjCAdtPMDLa3gO0mekgXubDKBr92UdgVZ6GByU47dYxd3nbW', '', NULL, '2024-11-03 19:07:59', '2024-11-03 19:07:59', 7, 32, 9, 'Active'),
(1037, 'AG1330', 'La Ode Saiful, S.Ip', 'staff@smii.co.id', '$2y$12$7YmKb0UHtHlpl21HdjiJ7uotCN4kRuNYgSuYreCDxvfB3kTdHu0O2', '', NULL, '2024-11-03 19:08:00', '2024-12-04 19:48:59', 7, 32, 9, 'Active'),
(1038, 'AG1331', 'Muhammad Taufikurrahman', 'staff@smii.co.id', '$2y$12$PHLL2Yh0ysDEV4E/.EJzIuMGAF6Z8YX1fDh.zUxraLsuPbAkmk4De', '', NULL, '2024-11-03 19:08:00', '2024-12-04 19:49:22', 7, 32, 9, 'Active'),
(1039, 'AG1343', 'Rachman Fernanda', 'staff@smii.co.id', '$2y$12$iUmfdK7sBjcl4yUDqzYlWuqqYDNlNj2rVpO6tkEugZBTwH49uU1IC', '', NULL, '2024-11-03 19:08:00', '2024-12-04 19:50:25', 7, 32, 9, 'Active'),
(1040, 'AG1346', 'Akhmad Naofal', 'staff@smii.co.id', '$2y$12$8RvIlYuL8n/eICP6V4VHBu4foFiB9lLldrk5VTsz06VADGUh55r9q', '', NULL, '2024-11-03 19:08:00', '2024-12-04 18:51:45', 7, 32, 9, 'Active'),
(1041, 'A0044', 'Hartono', 'staff@smii.co.id', '$2y$12$iLAaPHUL1jfqwue83w8vzu7/fza4WRQnEXeULkuJBLgDeVFxUbxDy', '', NULL, '2024-11-03 19:08:00', '2024-11-03 19:08:00', 1, 32, 1, 'Active'),
(1042, 'V0988', 'Muntari', 'staff@smii.co.id', '$2y$12$uGsMtfBCbBol6cEdqtjszO2EhUvBCURLe6WyDk6YpWWBG14azJq9q', '', NULL, '2024-11-03 19:08:01', '2024-12-04 19:51:13', 1, 32, 1, 'Active'),
(1043, 'AG1317', 'Ashar Herrianto', 'staff@smii.co.id', '$2y$12$V2kB6ocqud6HyaFVFzQfdOTF0MwhHQRRF.5RV.Sd/DCor9PXO7ol6', '', NULL, '2024-11-03 19:08:01', '2024-12-04 19:11:36', 1, 32, 1, 'Active'),
(1044, 'AG1350', 'Adi Ardiansyah', 'staff@smii.co.id', '$2y$12$oQPMU57vcjFPUyIT/6Rj5u4TspmOLHvL3zHhRWENjs9yzIQYzu8Tu', '', NULL, '2024-11-03 19:08:01', '2024-12-04 18:39:59', 1, 32, 1, 'Active'),
(1045, 'A0079', 'Suseno', 'staff@smii.co.id', '$2y$12$MyDuUPnaphmRmm9fsAKA6.H.lCgM/RlqcfszUwooeTUxVoDROEZOq', '', NULL, '2024-11-03 19:08:01', '2024-12-04 19:48:24', 1, 32, 1, 'Active'),
(1046, 'N0832', 'Iwan Supriyadi', 'staff@smii.co.id', '$2y$12$kwQ67p4bJtc.Op7jxHzgNeAuvc8OvidcHoLpDlAWFQo7i/LptYS8C', '', NULL, '2024-11-03 19:08:02', '2024-11-03 19:08:02', 1, 32, 1, 'Active'),
(1047, 'AC1191', 'Dwi Hermanto', 'staff@smii.co.id', '$2y$12$DjMO5j.g4a6tH/MRPOG1YO1LYLD4ydhgoeiuEE/QNkxF6oy8LIKku', '', NULL, '2024-11-03 19:08:02', '2024-12-04 19:33:39', 1, 32, 1, 'Active'),
(1048, 'AD1224', 'Muhammad Ilham Mawazi', 'staff@smii.co.id', '$2y$12$IAUl.LdKgtroCiKNFQOFIu4WG0mBNizttsfxRI7.jt1bFJ/BnVRPe', '', NULL, '2024-11-03 19:08:02', '2024-12-04 19:52:23', 1, 32, 1, 'Active'),
(1049, 'AG1327', 'Heribertus Dwie Nugroho', 'staff@smii.co.id', '$2y$12$7Z7ShbowufVmFEi23Wo/G.1XoT.ujvspJ1ZNqE1W0SJ1W8J0s1huG', '', NULL, '2024-11-03 19:08:02', '2024-12-04 19:49:21', 1, 32, 1, 'Active'),
(1050, 'AG1338', 'Bagus Ardiyanto', 'staff@smii.co.id', '$2y$12$kpTaXV1IsjU.PSi.SamERuFLnixR5.Y2GsncNflwMUgCUBFAkV7Fa', '', NULL, '2024-11-03 19:08:02', '2024-12-04 19:14:41', 1, 32, 1, 'Active'),
(1051, 'AG1340', 'Muhamad Aldi', 'staff@smii.co.id', '$2y$12$WQtta7j4nf63mLT9vdkwcO6PhUcSC71IYjzkUO1RoIUwX9Y2533SK', '', NULL, '2024-11-03 19:08:03', '2024-12-04 19:53:31', 1, 32, 1, 'Active'),
(1052, 'AG1344', 'Husni Mubarok', 'staff@smii.co.id', '$2y$12$XAe5mkCW4WD1Pi6TjsAPZ.LkBKku1w22BcxxAVgdMwTUM7yukmKiO', '', NULL, '2024-11-03 19:08:03', '2024-11-03 19:08:03', 1, 32, 1, 'Active'),
(1053, 'C0375', 'Wagiono', 'staff@smii.co.id', '$2y$12$zufn5scYayAL/u/AP19qyettFzgd2FlfYG90adKolxeqb3ZDX19Ga', '', NULL, '2024-11-03 19:08:03', '2024-12-04 19:54:12', 1, 32, 1, 'Active'),
(1054, 'D0428', 'Teguh Suyono', 'staff@smii.co.id', '$2y$12$1T7IS/XbrHH0rP/2HSNnqu1wp8zj3sQRBbxOvy6O9rAQcqrxzI1y.', '', NULL, '2024-11-03 19:08:03', '2024-12-04 19:54:42', 1, 32, 1, 'Active'),
(1055, 'D0438', 'Surip', 'staff@smii.co.id', '$2y$12$A2ffhzVCL2zS1kmRs8nk3utyKhVi8bLdPKFXIJSJ7k1Fn6Knad5zm', '', NULL, '2024-11-03 19:08:03', '2024-12-04 19:55:08', 1, 32, 1, 'Active'),
(1056, 'E0483', 'Hasanudin', 'staff@smii.co.id', '$2y$12$sxGLEAcKzn.UjYMqmyL7IedAt/8k/ThrnRJvqfdIKXgWIwjkE42Qq', '', NULL, '2024-11-03 19:08:04', '2024-12-04 19:44:38', 1, 32, 1, 'Active'),
(1057, 'F0599', 'Ibrahim M. Saleh', 'staff@smii.co.id', '$2y$12$WmGK0YWxVm8Qn1Xi6yUh1.VFR1cDG3VipIVP2sLZdMeM4YLhehzI6', '', NULL, '2024-11-03 19:08:04', '2024-12-04 19:51:58', 1, 32, 1, 'Active'),
(1058, 'G0646', 'Kasmanto', 'staff@smii.co.id', '$2y$12$zMdyygcllg3QT68BCIOfxexalY1jHJPOoYJQoHE8xaKLM5a3FDkHa', '', NULL, '2024-11-03 19:08:04', '2024-11-03 19:08:04', 1, 32, 1, 'Active'),
(1059, 'H0657', 'Yohanes Winarto', 'staff@smii.co.id', '$2y$12$XIVCm4yqALjfTg2XHTLmMe78Tb5reG68wLQ9vMYSLQYt9fv7ColLW', '', NULL, '2024-11-03 19:08:04', '2024-12-04 19:55:42', 1, 32, 1, 'Active'),
(1060, 'H0688', 'Didi Winarko', 'staff@smii.co.id', '$2y$12$quU.z7e61/S004VahSmB3eB1sLhcYBhFr7oiElymEE0DAn5MlHRUC', '', NULL, '2024-11-03 19:08:05', '2024-12-04 19:30:25', 1, 32, 1, 'Active'),
(1061, 'L0796', 'Teguh Waluyo', 'staff@smii.co.id', '$2y$12$tTDJG7YZmjnurMZBT5Gn1OINi1//ZbZPy3e/83ukopg50fTLpwKny', '', NULL, '2024-11-03 19:08:05', '2024-12-04 19:56:05', 1, 32, 1, 'Active'),
(1062, 'P0852', 'Budianto', 'staff@smii.co.id', '$2y$12$HxPXVnIFUVVLA2sZD4taxeeyfTb0BwjRuqtRtZO80Y2/caykYMBPm', '', NULL, '2024-11-03 19:08:05', '2024-12-04 19:16:40', 1, 32, 1, 'Active'),
(1063, 'S0908', 'Heri Riswanto', 'staff@smii.co.id', '$2y$12$t2WxHf5IsdAKOzyv3YnrHuGWNXGuPes.Ycoc5YITYPCBizdB7QI4O', '', NULL, '2024-11-03 19:08:05', '2024-12-04 19:49:01', 1, 32, 1, 'Active'),
(1064, 'T0928', 'Dadang Suhana', 'staff@smii.co.id', '$2y$12$guAUEaqisAZSQCVc9B6FCueYhDZc3t4OgzN4Ykbnv5s8zLiLhhI3C', '', NULL, '2024-11-03 19:08:05', '2024-11-03 19:08:05', 1, 32, 1, 'Active'),
(1065, 'T0929', 'Miplahudin', 'staff@smii.co.id', '$2y$12$yMNCI12u0/s3IFQShcsOd.1eEYLL9hbLqAFZftGtV5i9QNXhidlZS', '', NULL, '2024-11-03 19:08:06', '2024-12-04 19:56:39', 1, 32, 1, 'Active'),
(1066, 'V0973', 'Andi Irawan', 'staff@smii.co.id', '$2y$12$w9jkfjhMoygylLcp1HOgveJNMYueT6aD15NlTLkjFuJsHhRSVcJBy', '', NULL, '2024-11-03 19:08:06', '2024-12-04 18:56:01', 1, 32, 1, 'Active'),
(1067, 'V0980', 'M. Yusuf M', 'staff@smii.co.id', '$2y$12$GzUacOhyClaMN7qqViwOAe4BiUv44N42QYmV/vHi3Nv8PsdLW2bn.', '', NULL, '2024-11-03 19:08:06', '2024-12-04 20:01:55', 1, 32, 1, 'Active'),
(1068, 'Y1051', 'Erik Zulhikman', 'staff@smii.co.id', '$2y$12$XOq2n3ZpGtWK307KAuArseMGjDdgVQslAMjbHXX5dsDrdiQs8bJHa', '', NULL, '2024-11-03 19:08:06', '2024-12-04 19:37:22', 1, 32, 1, 'Active'),
(1069, 'Z1077', 'Mulyadi', 'staff@smii.co.id', '$2y$12$6lycDub38B9r7CdvyBmygO5SjEsyfWA7VjYRbOlOei5RKCoUswBzu', '', NULL, '2024-11-03 19:08:06', '2024-12-04 20:09:05', 1, 32, 1, 'Active'),
(1070, 'AC1189', 'Yogi Dimas Jaya', 'staff@smii.co.id', '$2y$12$otZT7fZrjBn0.DYubm21m..DrITGDGHbdopW7l5mZjJHtkminjmRG', '', NULL, '2024-11-03 19:08:07', '2024-12-04 20:07:42', 1, 32, 1, 'Active'),
(1071, 'AG1324', 'Robi Mardi', 'staff@smii.co.id', '$2y$12$Jkz1Za.jkjEQSr5Ohel4bO0p7Hq7ioB5JCZZnEp3F10zd.dPXpczq', '', NULL, '2024-11-03 19:08:07', '2024-12-04 20:09:54', 1, 32, 1, 'Active'),
(1072, 'AG1328', 'Dias Putra Darmawan', 'staff@smii.co.id', '$2y$12$LtmipK9oknOqwNpuYkGmreJj5xD1MBkt25AOmqFc1Gss7LMjpXDie', '', NULL, '2024-11-03 19:08:07', '2024-12-04 19:27:25', 1, 32, 1, 'Active'),
(1073, 'AG1329', 'Muhammad Rizki', 'staff@smii.co.id', '$2y$12$O6hUoGcg.UxkobZ.SUJgwe9ojfWNqafVMSOgsRqRs0HoBrhTrJaV.', '', NULL, '2024-11-03 19:08:07', '2024-12-04 20:10:41', 1, 32, 1, 'Active'),
(1074, 'B0281', 'Syaiful Amri', 'staff@smii.co.id', '$2y$12$02m5NqJu8vbMg/YcL8/82eK9uz8Oi4.eaHlWaluLr4hQiJk2bSrDq', '', NULL, '2024-11-03 19:08:08', '2024-12-04 20:11:37', 1, 32, 1, 'Active'),
(1075, 'E0528', 'Heru Untung  Noviantoro', 'staff@smii.co.id', '$2y$12$LNOyCBXO3W9R9LrBL0s.f.Uq2cIdzwFBrHFiP3Bq86uCzIBtSMwI6', '', NULL, '2024-11-03 19:08:08', '2024-12-04 19:50:12', 1, 32, 1, 'Active'),
(1076, 'AD1230', 'Muhamad Zen Mustofa', 'staff@smii.co.id', '$2y$12$5.6EukGNmwCk9PFjkzouju1fhOWOepALJiQmTbu42mjmI9ofsNEJC', '', NULL, '2024-11-03 19:08:08', '2024-12-04 20:13:31', 1, 32, 1, 'Active'),
(1077, 'AF1289', 'Aji Nur Wijayanto', 'staff@smii.co.id', '$2y$12$g/aK2v25UjNSPbIiiX1jNO5x9JxoPXrVOLExw7H86iTuLKNE8Nbkq', '', NULL, '2024-11-03 19:08:08', '2024-12-04 18:51:19', 1, 32, 1, 'Active'),
(1078, 'AG1325', 'Sokhihul islam', 'staff@smii.co.id', '$2y$12$NWTiLOYAjsdo3C12EZBp1OhpuJPoJbRatfBDjFyaKvTS7rzOddr.u', '', NULL, '2024-11-03 19:08:08', '2024-12-04 20:27:19', 1, 32, 1, 'Active'),
(1079, 'AD1214', 'Rainita Darmadi', 'staff@smii.co.id', '$2y$12$kKK41YlSCvrFeIXcLATUruR1vUUVK5wOj.7uC8ImcTTg73nDb7eNm', '', NULL, '2024-11-03 19:08:09', '2024-12-04 20:14:39', 2, 32, 10, 'Active'),
(1080, 'R0890', 'Bonny Regina Sandy', 'staff@smii.co.id', '$2y$12$TKkWsqSXZxHELAsodBZ9aOF7JC8vmaVT/KB5vbz9y0uvH.CpMbyTm', '', NULL, '2024-11-03 19:08:09', '2024-12-04 19:15:44', 2, 32, 10, 'Active'),
(1081, 'Y1045', 'Drajat Budiarto', 'staff@smii.co.id', '$2y$12$VAoidqDyIdRCzQxs3Q/OsuBb2LQxuIiPjQRHg41IBk.7rOfMSP7sW', '', NULL, '2024-11-03 19:08:09', '2024-12-04 19:32:41', 2, 32, 10, 'Active'),
(1082, 'I0718', 'Nanik Candra Cahyani', 'staff@smii.co.id', '$2y$12$y/W8hCeXIFpc8QsRFjroz.zmoJATyEnMU57HU0BgpXcbt8D10T202', '', NULL, '2024-11-03 19:08:09', '2024-12-04 20:15:26', 2, 32, 10, 'Active'),
(1083, 'I0722', 'Rita Rahayu', 'staff@smii.co.id', '$2y$12$eQR1B8V4abebMf75SBSI4OGsbbvmyp0.C3tocitP7hRVclbRYQHOa', '', NULL, '2024-11-03 19:08:09', '2024-12-04 20:16:30', 2, 32, 10, 'Active'),
(1084, 'P0854', 'Mirza Purnomo', 'staff@smii.co.id', '$2y$12$MOuO48TFLgKZFByq0DrSU.7BKKo4s1.BBt9YRgNpKUnZ7zcKr8tVS', '', NULL, '2024-11-03 19:08:10', '2024-12-04 20:09:40', 2, 32, 10, 'Active'),
(1085, 'U0946', 'Eko Kusmaryanto', 'staff@smii.co.id', '$2y$12$fNfHh8pHln1sqdI0litHuema7PskSekqTVcaclrsOUtx.3sQEMzGm', '', NULL, '2024-11-03 19:08:10', '2024-11-18 20:27:42', 2, 32, 10, 'Active'),
(1086, 'F0627', 'Moh. Riyad', 'staff@smii.co.id', '$2y$12$tTK/Z3JKEPMxFYQZXYBiBuga3PBU1nso9VaLELNw7/AnPcdSxkFXK', '', NULL, '2024-11-03 19:08:10', '2024-12-04 20:11:07', 2, 32, 10, 'Active'),
(1087, 'T0917', 'Vincensius Rezki', 'staff@smii.co.id', '$2y$12$Unu/eitU195fWoO9Lrb7EOwPvoCbu2IRdHcXbGmgU6W0SoI8ndfka', '', NULL, '2024-11-03 19:08:10', '2024-12-04 20:20:26', 2, 32, 10, 'Active'),
(1088, 'AB1151', 'Ratih Ayu Lestari', 'staff@smii.co.id', '$2y$12$bEozhlVgwtYLWmLHVuV95.JK.nCRjkQ8skv2ALWnHHi3mg2O7C5cC', '', NULL, '2024-11-03 19:08:11', '2024-12-04 20:28:26', 2, 32, 10, 'Active'),
(1089, 'AE1274', 'Shara Cahyanie', 'staff@smii.co.id', '$2y$12$S3rdkwGS4JBEtJ3im/bdLuC4HYArDz1KUtivCDu9hvsbVSBthSExO', '', NULL, '2024-11-03 19:08:11', '2024-12-04 20:18:31', 2, 32, 10, 'Active'),
(1090, 'Y1046', 'Achmad Suheri', 'staff@smii.co.id', '$2y$12$N1lVunKA0kRZ601Guy6TL.Gqy01f0ZvHYWJm8PV340pd2PJkIJY/G', '', NULL, '2024-11-03 19:08:11', '2024-12-04 18:39:24', 2, 32, 10, 'Active'),
(1091, 'AF1294', 'Tamara Julietta', 'staff@smii.co.id', '$2y$12$HQ.Nd5L04c8wAd.UgdWE8eJhbpHqlCWJoOdW73yTYauLadIA5k6tu', '', NULL, '2024-11-03 19:08:11', '2024-12-04 20:45:15', 2, 32, 11, 'Active'),
(1092, 'R0893', 'Intan Wulan Sari', 'staff@smii.co.id', '$2y$12$mzhJ9yjRRtaQ5.L9uCxHuesIP/L4cYyYGgoi/zu97/b7jm4/6X3LC', '', NULL, '2024-11-03 19:08:11', '2024-12-04 19:52:58', 2, 32, 11, 'Active'),
(1093, 'S0903', 'Nahrowi', 'staff@smii.co.id', '$2y$12$qCSLdg3LTS2Z3Kc2aXsNR.V1tLuTXn1gn..oo5EsDIE48kqj2mUCu', '', NULL, '2024-11-03 19:08:12', '2024-12-04 20:21:50', 2, 32, 11, 'Active'),
(1094, 'AF1306', 'Hilmy Fauzan', 'ga.site.service@smii.co.id', '$2y$12$8Y/3Xm82pdmNXd96EsgfsuaFbxzaU/L.9MC9fMyl/EwZZmexpCrEW', '', NULL, '2024-11-03 19:08:12', '2024-12-10 18:11:33', 2, 32, 11, 'Active'),
(1095, 'H0689', 'Suwanto', 'staff@smii.co.id', '$2y$12$TiK0zW7VYD1fd0lLEEiQhOsel2KyhVVADUTaqHTM0gFRfqXh0dgaK', '', NULL, '2024-11-03 19:08:12', '2024-12-04 20:39:49', 3, 32, 2, 'Active'),
(1096, 'K0782', 'Vitria Hartati', 'staff@smii.co.id', '$2y$12$dkgCVAxHFCEZpl852a/qLOFqJ1ZoqmSVhWz3/WymtqOj1c.yTZhAG', '', NULL, '2024-11-03 19:08:12', '2024-12-04 20:40:22', 3, 32, 2, 'Active'),
(1097, 'AG1335', 'Andina Nurmalia', 'staff@smii.co.id', '$2y$12$8tB/zKrN2VdHF1bqzbe9l.1RE8FrD0B8PGqwYfECTaRt8iLKHQLhK', '', NULL, '2024-11-03 19:08:12', '2024-12-04 18:57:07', 3, 32, 2, 'Active'),
(1098, 'AG1339', 'Gatot Widjanarko', 'staff@smii.co.id', '$2y$12$RZV7zCjrV4aDH.6L.jLC3uCqJ/BRh/5j.9MNg7RN.MdeJvl4zTFRe', '', NULL, '2024-11-03 19:08:13', '2024-12-04 19:41:36', 3, 32, 2, 'Active'),
(1099, 'E0499', 'Suparmanto', 'staff@smii.co.id', '$2y$12$mPvXNDR9vzm0YFvUZCNzxu9SoEjcxiiPRQOkrP.eVrkr3dR47UYRK', '', NULL, '2024-11-03 19:08:13', '2024-12-04 20:41:51', 3, 32, 2, 'Active'),
(1100, 'M0809', 'Herry Latif Pujianto', 'staff@smii.co.id', '$2y$12$0cY8qTVXXyAhcPZLmK1vyOIqvr..ZLb0JFvxXGZeuC/caRJ15y8O2', '', NULL, '2024-11-03 19:08:13', '2024-12-04 19:49:50', 3, 32, 2, 'Active'),
(1101, 'X1022', 'Murodih', 'staff@smii.co.id', '$2y$12$q9I613z.BtZyGiY0j/Tp5.Lci7TGm8XUg1crY2bcKHeW/05bzT2/a', '', NULL, '2024-11-03 19:08:13', '2024-12-04 20:19:45', 3, 32, 2, 'Active'),
(1102, 'AG1345', 'Billy Fernando Pasaribu', 'staff@smii.co.id', '$2y$12$1PXdtM4jWd4JacTAFuN2Vu7m6uVfLAmePdKHIqecc/LEM4tB8weie', '', NULL, '2024-11-03 19:08:14', '2024-12-04 19:15:24', 5, 32, 12, 'Active'),
(1103, 'AE1258', 'Maria Uli Fransisca', 'staff@smii.co.id', '$2y$12$Wfnoiz/Y7bQsDiCwxdl0fO8TLptYCovzElQMSlLnlm8SdGj8He1/O', 'AE1258.jpg', NULL, '2024-11-03 19:08:14', '2025-01-01 18:20:42', 5, 32, 12, 'Active'),
(1104, 'U0958', 'Sri Cahyani Dwi Anggoro', 'sri.cahyani@smii.co.id', '$2y$12$WI2EGp8u00GGU10e6MEADOrt4qhysGbzdc09mjJ3ebGIIJjioJqDq', '', NULL, '2024-11-03 19:08:14', '2024-12-23 22:57:06', 7, 24, 13, 'Active'),
(1105, 'U0950', 'Rofika', 'staff@smii.co.id', '$2y$12$uReJr4txIWEOlagNQLtN5.ZshjFh8SgQaCpMYE3DW9c0X9CLHiHWO', '', NULL, '2024-11-03 19:08:14', '2024-12-04 20:30:34', 7, 32, 13, 'Active'),
(1106, 'W1011', 'Mufti Allutfi', 'staff@smii.co.id', '$2y$12$94cxFE3BTj0mla9/j9WuJ.sw5TgU13.JPk3WvZI..DbbGrN/Lwpau', '', NULL, '2024-11-03 19:08:14', '2024-12-04 20:14:16', 7, 32, 13, 'Active'),
(1107, 'AD1231', 'Dinur Yuwidiyanto', 'staff@smii.co.id', '$2y$12$J2s9gmJn7D7mz95nNUJssuHAZ9RJqtAi0Ifl2luLFpzwsQ3na7ahG', '', NULL, '2024-11-03 19:08:15', '2024-12-04 19:31:31', 7, 32, 13, 'Active'),
(1108, 'AB1128', 'Rianto Wibisono', 'staff@smii.co.id', '$2y$12$R5wkEs/q2zhMGzRepDssOe.L5Guex47FWORSCzhPmNsJFRlFrf7Zq', '', NULL, '2024-11-03 19:08:15', '2024-12-04 20:29:39', 7, 32, 13, 'Active'),
(1109, 'AE1249', 'An Nisaa Catur Pekerti', 'nisaa.pekerti@smii.co.id', '$2y$12$g4yTRQuu4Rm4B4Uq12fYQeQRBtUtOGfQcnqIDsNVZtQ3g6l6aw6SK', '', NULL, '2024-11-03 19:08:15', '2024-12-10 01:44:08', 7, 32, 13, 'Active'),
(1110, 'AF1304', 'Amy Rhetorica', 'staff@smii.co.id', '$2y$12$0SD8D5mgNcL7k8RdkH70T.L6CcvL26dzlxXm9eTrbhFT832k2LybS', '', NULL, '2024-11-03 19:08:15', '2024-12-04 18:54:38', 7, 32, 13, 'Active'),
(1111, 'Q0872', 'Novalina Saragih', 'staff@smii.co.id', '$2y$12$GVlDekhc4.LWzng9V5Z.zeS0dhry7qyP/1eB1KrDx6F7hRaHfnZeC', '', NULL, '2024-11-03 19:08:15', '2024-12-04 20:23:22', 7, 32, 14, 'Active'),
(1112, 'AB1149', 'Natasha Tachjadi', 'staff@smii.co.id', '$2y$12$CDW5/i3PJ0EeFIIcxJlOX.QDTHbOH7QCygKQ3zIUI9ezRhB5RV7Li', '', NULL, '2024-11-03 19:08:16', '2024-12-04 20:22:16', 7, 32, 14, 'Active'),
(1113, 'U0947', 'Sangudin', 'sangudin@smii.co.id', '$2y$12$1wByOrnEfJ2lixyOpeCrh.Jfos0t1.CiXtPVNrqYkKoob1Ke17L4K', '', NULL, '2024-11-03 19:08:16', '2024-12-04 18:32:17', 8, 32, 15, 'Active'),
(1114, 'C0393', 'Gusriyanto', 'staff@smii.co.id', '$2y$12$Mku6pX8GNG5q5Cj/nkxpUuZSvxw5py6NrKhhdq2OhH.5zM7n8xl1i', '', NULL, '2024-11-03 19:08:16', '2024-11-03 19:08:16', 8, 32, 15, 'Active'),
(1115, 'G0639', 'Achmad Saefudin', 'staff@smii.co.id', '$2y$12$6TjMZdwEIHQgia0fT2uQo.h07I5zq0ReH87l/cFDZrpqsT/8y8qb.', '', NULL, '2024-11-03 19:08:16', '2024-12-04 18:37:40', 8, 32, 15, 'Active'),
(1116, 'AD1241', 'Prio Pambudi', 'staff@smii.co.id', '$2y$12$.3Am9DT5Uy7IdqU4Lf.Dmur2y/rlY.NZodNvHC51W3AI6Gyy0IjlG', '', NULL, '2024-11-03 19:08:17', '2024-12-04 20:27:36', 8, 32, 15, 'Active'),
(1117, 'F0585', 'Rito\'at', 'staff@smii.co.id', '$2y$12$gQscIgiA.LNfdRFMMIf0/Ofm9RnaHrPUqAlk9rDoo45GufSpbF2A2', '', NULL, '2024-11-03 19:08:17', '2024-11-03 19:08:17', 8, 32, 15, 'Active'),
(1118, 'J0742', 'Nurul Firdaus', 'staff@smii.co.id', '$2y$12$ai8Zjz4uvMbqNBSPIvt/2e6kivIouRP94PESE1QuPJfjah0IKd85e', '', NULL, '2024-11-03 19:08:17', '2024-11-03 19:08:17', 8, 32, 15, 'Active'),
(1119, 'W0999', 'Linia Maulina Sari', 'staff@smii.co.id', '$2y$12$ERplHXBQd4es5Mcx8hO69.9TVdprdYPlvSDqdmApcWTpytt9nJR1C', '', NULL, '2024-11-03 19:08:17', '2024-12-04 20:00:38', 8, 32, 15, 'Active'),
(1120, 'C0297', 'Iyus Suhendar', 'staff@smii.co.id', '$2y$12$dHXs0170H/lG7dUTUrL/kO6WzHWoK.2rye/eeJUv.X6In2vbrallC', '', NULL, '2024-11-03 19:08:17', '2024-12-04 19:55:24', 8, 32, 15, 'Active'),
(1121, 'D0425', 'Mulud', 'staff@smii.co.id', '$2y$12$X/dskLlqcFWqCVMO0aZGL.rByomM3o4NqEavE5xQlb4K.7.TzK45a', '', NULL, '2024-11-03 19:08:18', '2024-12-04 20:18:51', 8, 32, 15, 'Active'),
(1122, 'D0480', 'Tumino', 'staff@smii.co.id', '$2y$12$m7m/562q./uEN7/mA9Smy.5q7vyJ5GIR5FvlDk86H5VSHZq7St7Y6', '', NULL, '2024-11-03 19:08:18', '2024-12-04 20:46:50', 8, 32, 15, 'Active'),
(1123, 'D0481', 'Tajudin', 'staff@smii.co.id', '$2y$12$QbpA7An5BeEbu5yKOdhJkeXSAu5qZAVNHTr2nwt5QxMjhYiiXq0YC', '', NULL, '2024-11-03 19:08:18', '2024-12-04 20:44:58', 8, 32, 15, 'Active'),
(1124, 'G0632', 'Sumedi', 'staff@smii.co.id', '$2y$12$cr0tOWs196aSdpxzjAQbyO9bNMo8vA0FEfzE.IAukmO5p4rbTwZBq', '', NULL, '2024-11-03 19:08:18', '2024-12-04 20:40:34', 8, 32, 15, 'Active'),
(1125, 'J0732', 'Arif Rifa\'i', 'staff@smii.co.id', '$2y$12$1LAFqpxQXkjTp7XaXbOdLeaNJyn.bJHOFndnyvDkdKlTKCKPZT7Fe', '', NULL, '2024-11-03 19:08:19', '2024-12-04 19:09:22', 8, 32, 15, 'Active'),
(1126, 'L0793', 'Mustakim', 'staff@smii.co.id', '$2y$12$4Gw7Z4zDDpBFFEKrg/Wt3.BQpz.ve4h037F//rUQRP3QaiEoXJZXW', '', NULL, '2024-11-03 19:08:19', '2024-11-03 19:08:19', 8, 32, 15, 'Active'),
(1127, 'Y1040', 'Lukman Hakim', 'staff@smii.co.id', '$2y$12$WSPQljxAfrItsRSLQGam9uClV5FUN5Mtx9ERMUqhyX2H2JaKf7cP6', '', NULL, '2024-11-03 19:08:19', '2024-12-04 20:01:11', 8, 32, 15, 'Active'),
(1128, 'Z1072', 'Aris Suhariyanto', 'staff@smii.co.id', '$2y$12$84WqKoxyp1NdSMz1TXcbJO9AbMTS1VkpYAKHAA.wFPHv.it7ugHqG', '', NULL, '2024-11-03 19:08:19', '2024-12-04 19:10:32', 8, 32, 15, 'Active'),
(1129, 'AB1153', 'Sulaeman', 'staff@smii.co.id', '$2y$12$IRkDq6YyG6x68Jv4PgsIYO9Rdn3wkSoUsKr14W7QHfFPyPsoTD7Xe', '', NULL, '2024-11-03 19:08:19', '2024-12-04 20:38:56', 8, 32, 15, 'Active'),
(1130, 'AC1195', 'Bayu Wahyudin', 'staff@smii.co.id', '$2y$12$IVDaAynoHFEXyGgjTSqfhuzcIP68kdAQ5aY/IsBQnbyDISRzi8jt6', '', NULL, '2024-11-03 19:08:20', '2024-11-03 19:08:20', 8, 32, 15, 'Active'),
(1131, 'AD1211', 'Erfan Hermawan', 'staff@smii.co.id', '$2y$12$XtvHjmC9XY5lIl7nw97qoOiLhwurpyWeDX6WOJu4FXvbkeE.EWFvK', '', NULL, '2024-11-03 19:08:20', '2024-11-03 19:08:20', 8, 32, 15, 'Active'),
(1132, 'AD1218', 'Tri Ariyanto', 'staff@smii.co.id', '$2y$12$rMxOAXZM6XnTDnT8EzvHEuKCA0WUBebrrRVT6QBuF30SgIHEVSMu6', '', NULL, '2024-11-03 19:08:20', '2024-12-04 20:46:16', 8, 32, 15, 'Active'),
(1133, 'AD1221', 'M. Anwar Fuadi', 'staff@smii.co.id', '$2y$12$n1ExuMxWzpxMW0xu6ca0MuTGxm.MyiNVurCL79EHv1ySUAz66o1Ly', '', NULL, '2024-11-03 19:08:20', '2024-12-04 20:01:28', 8, 32, 15, 'Active'),
(1134, 'AD1222', 'Zaenal Abidin', 'staff@smii.co.id', '$2y$12$tresTg9j4Coyh5ET60bDm.kyHQ4eiccuq55kKY2aoKi36We0xqlYm', '', NULL, '2024-11-03 19:08:20', '2024-12-04 20:49:18', 8, 32, 15, 'Active'),
(1135, 'AD1229', 'Marsono', 'staff@smii.co.id', '$2y$12$iTzbPj2UFqcihx08ZyG0oOL9zsi2vOmHdEvoylOCTiDp3nVdFINxW', '', NULL, '2024-11-03 19:08:21', '2024-12-04 20:06:41', 8, 32, 15, 'Active'),
(1136, 'AD1232', 'Irsan Rifqi', 'staff@smii.co.id', '$2y$12$BPA/PwtM8ORctx4wZniEKub8J4efe0OFa.ZCYAxgnymfuogxf6XLm', '', NULL, '2024-11-03 19:08:21', '2024-12-04 19:54:18', 8, 32, 15, 'Active'),
(1137, 'AE1250', 'Joko Triwibowo', 'staff@smii.co.id', '$2y$12$hfxKZw/P4gby0i6DGvPK7u8QYS9ORUi6OjShl2RxNLd81zSPXxSFG', '', NULL, '2024-11-03 19:08:21', '2024-12-04 19:56:40', 8, 32, 15, 'Active'),
(1138, 'AF1284', 'Abul Basri', 'staff@smii.co.id', '$2y$12$y7udD.2cZQJm2SyiJrosbO21JMNmBL4hJFBnZHMZbunDDndHSpc7C', '', NULL, '2024-11-03 19:08:21', '2024-12-04 18:36:45', 8, 32, 15, 'Active'),
(1139, 'AG1347', 'Aan Kurniawan', 'staff@smii.co.id', '$2y$12$TWrBmK1uEC4JiV1IXrjenexp5oFB.pulFVgjRGR.symPGzZsqK332', '', NULL, '2024-11-03 19:08:22', '2024-12-04 18:36:20', 8, 32, 15, 'Active'),
(1140, 'AG1349', 'Azzi Muhamad Gustian', 'staff@smii.co.id', '$2y$12$TlIhAIHTwg0ZD2KQyZ1LdOOIt7RksaX9iLvCh25IUyCuhsWzWsY02', '', NULL, '2024-11-03 19:08:22', '2024-12-04 19:12:20', 8, 32, 15, 'Active'),
(1141, 'U0960', 'Ali Ridho', 'ali.ridho@smii.co.id', '$2y$12$774QzPxwZrAxj7HaLHIcYuu9YS405aXIJjI/08pkEzBjZbWkGNDyy', '', NULL, '2024-11-03 19:08:22', '2024-12-25 18:58:09', 8, 32, 19, 'Active'),
(1142, 'Z1078', 'Ibnu Ubaedillah', 'staff@smii.co.id', '$2y$12$PEq8pQDUc9SMMq0jcjdot.ZYzbczjyE2kl0jczJ29NR9jrc.biafS', '', NULL, '2024-11-03 19:08:22', '2024-12-04 19:51:34', 8, 32, 15, 'Active'),
(1143, 'A0192', 'Haryanto Makmoer', 'staff@smii.co.id', '$2y$12$y6ufBoDoz4K6Qcm8Aw0N5e0FHLDoa76TgV8XRgcO6EkZsnO9ATdKi', '', NULL, '2024-11-03 19:08:22', '2024-12-04 19:44:11', 7, 32, 16, 'Active'),
(1144, 'AG1337', 'George Novaro Tarigan', 'staff@smii.co.id', '$2y$12$ME8Fr1GJYTtBSaIinghpLOxruhEB9r4bBsqoN1WUNiPTOT62kvJxC', '', NULL, '2024-11-03 19:08:23', '2024-12-04 19:42:16', 7, 32, 16, 'Active'),
(1145, 'W1005', 'Yovi Susanti', 'staff@smii.co.id', '$2y$12$sG/IxjYfDdWFd8aieugED.f9Dy6yxnpgeItLYvYCvb68V0BVkR9VK', '', NULL, '2024-11-03 19:08:23', '2024-12-04 20:42:08', 7, 32, 16, 'Active'),
(1146, 'AG1313', 'Gabriella Stephanie Gultom', 'staff@smii.co.id', '$2y$12$eiGiVVA.3hueQ2re1.hHdO5UWDNs8F6dg.YH9XOK0HfPAjngJZelG', '', NULL, '2024-11-03 19:08:23', '2024-12-10 02:19:36', 7, 32, 16, 'Active'),
(1147, 'AE1268', 'Dinah Dzakiyyah Rasikhah', 'dinah.rasikhah@smii.co.id', '$2y$12$8.ORnomNJQLK.tw2d5h7SeFsBCGtqO5JkhJZ7I1RyYM6ZnmKlKRM.', 'AE1268.jpeg', NULL, '2024-11-03 19:08:23', '2024-12-24 05:35:44', 7, 32, 16, 'Active'),
(1148, 'AD1228', 'Kelfin Alamanda', 'staff@smii.co.id', '$2y$12$WlRcUs5as7.pMUxVLK4WQeYwgyNOKwUHjnHWXsTKQ.C77QBNgQ2Q2', '', NULL, '2024-11-03 19:08:23', '2024-12-04 19:58:32', 7, 32, 16, 'Active'),
(1149, 'C0291', 'Sari Widodo', 'staff@smii.co.id', '$2y$12$FjPe21iItgB94TWZ2M5N1.r7GN2ouXkP1.5HlzRZrN4n1ykxlx7Bu', '', NULL, '2024-11-03 19:08:24', '2024-12-04 20:31:22', 4, 32, 17, 'Active'),
(1150, 'D0432', 'Kurnaen', 'staff@smii.co.id', '$2y$12$UpviSmbnf5laq/.lId8Tf.YcDtIjY/O0RVb.twvQ45/Pgsv2p037a', '', NULL, '2024-11-03 19:08:24', '2024-12-04 19:59:23', 4, 32, 17, 'Active'),
(1151, 'E0506', 'Anda Lumban Tobing', 'staff@smii.co.id', '$2y$12$1WimaRingDmCEyVKKibMr.dak3t.UpSs/sPWOwj1xDgz9eEe9yxxq', '', NULL, '2024-11-03 19:08:24', '2024-12-04 18:55:34', 4, 32, 17, 'Active'),
(1152, 'E0518', 'Gentur Budhiman', 'staff@smii.co.id', '$2y$12$IdDcKia9t0SelkM747FQOOJd2x43WEWWYD/vkKUS.zfx8sd/J8xt2', '', NULL, '2024-11-03 19:08:24', '2024-12-04 19:41:55', 4, 32, 17, 'Active'),
(1153, 'E0521', 'Muh. Asyrofi', 'staff@smii.co.id', '$2y$12$7OODedOuT2OAVfLxZejNDuG/TBJGnAtmqcGO.KtP7Hn/1cts7lBzy', '', NULL, '2024-11-03 19:08:25', '2024-11-03 19:08:25', 4, 32, 17, 'Active'),
(1154, 'E0522', 'Sugi Hartanto', 'staff@smii.co.id', '$2y$12$/A8q/cNJooXcSw0ccG6.UOIqNa1H3kz1Biaj34hlq/sMOJbjSmwF.', '', NULL, '2024-11-03 19:08:25', '2024-12-04 20:37:57', 4, 32, 17, 'Active'),
(1155, 'E0524', 'Agus Sumardi', 'staff@smii.co.id', '$2y$12$aAWVoZJXuiPMLZisdXdne.ZFZpyUpmdlgGtRFFSn66lay7Radf/X.', '', NULL, '2024-11-03 19:08:25', '2024-12-04 18:44:28', 4, 32, 17, 'Active'),
(1156, 'E0540', 'Paryono', 'staff@smii.co.id', '$2y$12$6qljDVl5dZQAYmmUjmoA8eNSCCPr2LKubC9iFwJ3VdMQm.GtHj8fC', '', NULL, '2024-11-03 19:08:25', '2024-12-04 20:27:10', 4, 32, 17, 'Active'),
(1157, 'H0680', 'Sudiono', 'staff@smii.co.id', '$2y$12$CZIYFU72BJk9JM4QYgm6SeVe0i7SzMvk3pXLOM9Ld9C86D//SvoRe', '', NULL, '2024-11-03 19:08:25', '2024-12-04 20:37:27', 4, 32, 17, 'Active'),
(1158, 'A0063', 'Sunardi', 'staff@smii.co.id', '$2y$12$8sSoM2gyt3mNOq.xtYZgfObNGW6W3toj4shPO6uWYKcErYPUTeP1i', '', NULL, '2024-11-03 19:08:26', '2024-12-04 20:40:50', 4, 32, 17, 'Active'),
(1159, 'A0066', 'Warno', 'staff@smii.co.id', '$2y$12$9jgwnWFK32TQwePWX/mTDOBFhPGrSUEtzfI0UYvb6LtnwG99H55aW', '', NULL, '2024-11-03 19:08:26', '2024-11-03 19:08:26', 4, 32, 17, 'Active'),
(1160, 'B0222', 'Urip', 'staff@smii.co.id', '$2y$12$FiXt4pa4QeKNwQ/OMrWAh.FYp7MTRuf6xtKsIaBGddF4hZauvUKpW', '', NULL, '2024-11-03 19:08:26', '2024-12-04 20:43:32', 4, 32, 17, 'Active'),
(1161, 'C0314', 'Sultan Agung', 'staff@smii.co.id', '$2y$12$gq/WXaTkUEGzCTFHirudju5szhKe4QRLaLgeBMAn3CN02qTf8xCPu', '', NULL, '2024-11-03 19:08:26', '2024-12-04 20:39:27', 4, 32, 17, 'Active'),
(1162, 'C0315', 'Iman Agus Permana', 'staff@smii.co.id', '$2y$12$J2rxkQ9Fs9Ajwt/ku0CgTOFozvF7sgawfn2OSt5BSvkJNx2D8Hgua', '', NULL, '2024-11-03 19:08:27', '2024-12-04 19:52:22', 4, 32, 17, 'Active'),
(1163, 'C0321', 'Wiyono', 'staff@smii.co.id', '$2y$12$cByVEJ82YjDh3yfmLpfSVeAfKqtgtUAe/P6p/8PfSuOfX8LizvE.S', '', NULL, '2024-11-03 19:08:27', '2024-12-04 20:45:28', 4, 32, 17, 'Active'),
(1164, 'C0326', 'Marjuni Akbari', 'staff@smii.co.id', '$2y$12$4AcytMtp12Uw3RMwdupS2eWmz6Hbaak4xxqszCjH71K11WMDayGGO', '', NULL, '2024-11-03 19:08:27', '2024-12-04 20:04:33', 4, 32, 17, 'Active'),
(1165, 'C0332', 'Sumarto', 'staff@smii.co.id', '$2y$12$Ej1mmMYZQYGlsBxuTFTORuxhszWRolXr2pv9BdaDPP2t/1l/BDJ7i', '', NULL, '2024-11-03 19:08:27', '2024-12-04 20:37:32', 4, 32, 17, 'Active'),
(1166, 'C0334', 'Suparman', 'staff@smii.co.id', '$2y$12$m0Bt3turxOyUHpnaNlSMFu1kZiy35yjmTQ2D5xha/V967iE1Iuyrm', '', NULL, '2024-11-03 19:08:27', '2024-12-04 20:41:15', 4, 32, 17, 'Active'),
(1167, 'C0360', 'Cecep Supriadi', 'staff@smii.co.id', '$2y$12$vBZPXNCsjW1qMRiTUbHPGO0vHeA2lPgVsU40r9hlzcQiNq8ahHKhy', '', NULL, '2024-11-03 19:08:28', '2024-12-04 19:23:30', 4, 32, 17, 'Active'),
(1168, 'C0414', 'Mujianto', 'staff@smii.co.id', '$2y$12$1wOiZ1xppbTmfrGL/CkJo.Z5Ew9BcjIV1FyrA6sOkpFdQ.6apmjEW', '', NULL, '2024-11-03 19:08:28', '2024-12-04 20:17:36', 4, 32, 17, 'Active'),
(1169, 'D0470', 'Sujarwo', 'staff@smii.co.id', '$2y$12$QfvE/yj0umFCRxvV1OJBVe7lJ5QdmjBuYXkMNbKZaTeJnpafMPxbi', '', NULL, '2024-11-03 19:08:28', '2024-11-03 19:08:28', 4, 32, 17, 'Active'),
(1170, 'D0471', 'Za\'far Aziz  Budy Andhi', 'staff@smii.co.id', '$2y$12$mwfQkDqDwp8G05cpxZMbYe1mMckliufZNxC8qWvNi/SdEX6.zVmF6', '', NULL, '2024-11-03 19:08:28', '2024-12-04 20:45:22', 4, 32, 17, 'Active'),
(1171, 'E0512', 'Sukamto', 'staff@smii.co.id', '$2y$12$wwoVQps4yeOgP5XLtZTPpetzO1Pr41x3qhLr/DMDYb9HRPwjlN.tK', '', NULL, '2024-11-03 19:08:28', '2024-12-04 20:38:34', 4, 32, 17, 'Active'),
(1172, 'E0519', 'Tito Sumantri', 'staff@smii.co.id', '$2y$12$J3Lx6OLQJPUygheiakZORuaEpgZzOjQFjk8boAoEVdSYrpCmJJJDS', '', NULL, '2024-11-03 19:08:29', '2024-12-04 20:44:41', 4, 32, 17, 'Active'),
(1173, 'E0552', 'Ani Saryanto', 'staff@smii.co.id', '$2y$12$SuRbqvMB9uKY4eYLK4EqWu8oW2m51xGO9pyUgocZ6X0oOPi90F4M2', '', NULL, '2024-11-03 19:08:29', '2024-12-04 19:04:53', 4, 32, 17, 'Active'),
(1174, 'E0554', 'Yudi Supriadi', 'staff@smii.co.id', '$2y$12$z9qwIm3c2Xq65WR9vywvKulrH4.16bmMDGQoR5AD40uKZXGDW4vBG', '', NULL, '2024-11-03 19:08:29', '2024-12-04 20:44:06', 4, 32, 17, 'Active'),
(1175, 'E0557', 'Harbin Tambunan', 'staff@smii.co.id', '$2y$12$rgiWIO6DlD9rlBIpNXLsReEcQ.3Ivq5oUTkuiYuN55FtgyA4yCaRq', '', NULL, '2024-11-03 19:08:29', '2024-12-04 19:43:05', 4, 32, 17, 'Active'),
(1176, 'F0604', 'Kuwatno', 'staff@smii.co.id', '$2y$12$lFOt45p4HEKF7mE2ReNeNuHToCIjZCXIXEllktLCLyIoj.xqvxl0a', '', NULL, '2024-11-03 19:08:30', '2024-12-04 19:59:44', 4, 32, 17, 'Active'),
(1177, 'G0640', 'Yudi Windarto', 'staff@smii.co.id', '$2y$12$xlrbrlklthb86FR8ja7Q5e043J2HzgEiFOsRlCRMrpc0HeXFyZwni', '', NULL, '2024-11-03 19:08:30', '2024-11-03 19:08:30', 4, 32, 17, 'Active'),
(1178, 'G0642', 'Priyadi Setiawan', 'staff@smii.co.id', '$2y$12$/m7utSIlj9u/TMIDFrH3Ru1FH5f4CTucjYa5L3e6YHRYeXLT4Nm/y', '', NULL, '2024-11-03 19:08:30', '2024-12-04 20:27:58', 4, 32, 17, 'Active'),
(1179, 'G0643', 'Suyono', 'staff@smii.co.id', '$2y$12$jLGJOLruA8YqgfTiQOiaGen./GlPMTO0Bpfzi0kJBgrLVi7O.hswK', '', NULL, '2024-11-03 19:08:30', '2024-12-04 20:43:44', 4, 32, 17, 'Active'),
(1180, 'G0648', 'Kartono', 'staff@smii.co.id', '$2y$12$oLZfQ1TJi64IVfnzUZvjDe4iYfwzzBINvl.091xfIClmHmOIf/U/m', '', NULL, '2024-11-03 19:08:30', '2024-12-04 19:58:08', 4, 32, 17, 'Active'),
(1181, 'G0655', 'Ali Imron', 'staff@smii.co.id', '$2y$12$z2ZLo.IDBjd1gbHmB9.aludBlrZaUlVjl13wC2mydbxm3wgnHiLvG', '', NULL, '2024-11-03 19:08:31', '2024-12-04 18:53:07', 4, 32, 17, 'Active'),
(1182, 'H0684', 'Dwi Haryanto', 'staff@smii.co.id', '$2y$12$Xw6H/ETI4KKav98n6HBGZuwMVHtv7av94jA4CXymjtI4rUqDRnNwa', '', NULL, '2024-11-03 19:08:31', '2024-12-04 19:33:07', 4, 32, 17, 'Active'),
(1183, 'H0702', 'Agus Soleh', 'staff@smii.co.id', '$2y$12$IO3BrqIWMXTPBeTt3WpX3efrEJ1anpU.ZqBdruQ9slDInCiXzXGee', '', NULL, '2024-11-03 19:08:31', '2024-12-04 18:42:34', 4, 32, 17, 'Active'),
(1184, 'H0705', 'Sumantri', 'staff@smii.co.id', '$2y$12$SL4PrTne5q/86PoQRS2ageOEEpfMrT/UVIRTFWm/P8E8PB5qAn0SS', '', NULL, '2024-11-03 19:08:31', '2024-12-04 20:40:08', 4, 32, 17, 'Active'),
(1185, 'I0713', 'Muhgofal', 'staff@smii.co.id', '$2y$12$p4KRGv4tVjAyCZjhLN3G/ely1A/c1WU7ggQ7wf8DstkdlHF3tLGdO', '', NULL, '2024-11-03 19:08:31', '2024-12-04 20:16:29', 4, 32, 17, 'Active'),
(1186, 'I0725', 'Endang Wijaya', 'staff@smii.co.id', '$2y$12$EZXJzKe4BYb0yj0rzSfX7OuOLxQ1DDMBE.OF6JlLyd2kt0XsoZU9a', '', NULL, '2024-11-03 19:08:32', '2024-12-04 19:36:46', 4, 32, 17, 'Active'),
(1187, 'J0754', 'Slamet Susanto', 'staff@smii.co.id', '$2y$12$BhOyozlwBj2nJuq7cZ9osOnuNg0Tt9fikZg0xU3Wc7OjgIohFRuwC', '', NULL, '2024-11-03 19:08:32', '2024-12-04 20:33:23', 4, 32, 17, 'Active'),
(1188, 'J0755', 'Hary Supriyatna', 'staff@smii.co.id', '$2y$12$4duINmSky96A0U/TsyzG0e92JSgaN0KxfRnR6x9nFqX9qqnuhKV4m', '', NULL, '2024-11-03 19:08:32', '2024-12-04 19:43:43', 4, 32, 17, 'Active'),
(1189, 'C0295', 'Sartono', 'staff@smii.co.id', '$2y$12$KD3P3Ae573jCV.3qn8lT9edffT4H8MSB17G5ZYj4AdDaM7ctYcRgm', '', NULL, '2024-11-03 19:08:32', '2024-12-04 20:32:10', 4, 32, 17, 'Active'),
(1190, 'C0296', 'Sarimin', 'staff@smii.co.id', '$2y$12$uoHgd7Y1GPlt5wExTRLKoe95GW1bPXqPSMFXG7roowAGR0w.fB6rS', '', NULL, '2024-11-03 19:08:33', '2024-12-04 20:31:38', 4, 32, 17, 'Active'),
(1191, 'D0456', 'Ahmad Zeli', 'staff@smii.co.id', '$2y$12$2paIIULud3/SGdTAJ88ye.hz1B/bGsTL5YXvj5Abhd/PD8H2X6/5O', '', NULL, '2024-11-03 19:08:33', '2024-12-04 18:50:04', 4, 32, 17, 'Active'),
(1192, 'Z1066', 'Muslih', 'staff@smii.co.id', '$2y$12$/cGrvhwUTsZoxP7h9MhJTuXHFImap2xzUk9lVkARNe0YJdc7ulkte', '', NULL, '2024-11-03 19:08:33', '2024-12-04 20:20:12', 4, 32, 17, 'Active'),
(1193, 'AB1142', 'Andi Wijaya', 'staff@smii.co.id', '$2y$12$BIrsC6vIubvFhE3K5Sr0bOEhvQbDM3UUzfhV5esbV78s7XpvYlf1K', '', NULL, '2024-11-03 19:08:33', '2024-11-03 19:08:33', 4, 32, 17, 'Active'),
(1194, 'AB1143', 'Marzuki', 'staff@smii.co.id', '$2y$12$uLqtRPjy16LNqPJ11jejF.YlxoSn6l5CapfyawR4P7vC7GWM9q1hS', '', NULL, '2024-11-03 19:08:33', '2024-12-04 20:07:46', 4, 32, 17, 'Active'),
(1195, 'AC1178', 'Hamzah', 'staff@smii.co.id', '$2y$12$3GI.GnBr4N.99oBkaNYxUu9wIbdeD8Kx5rfOhjSIH0uYurnoJmRwG', '', NULL, '2024-11-03 19:08:34', '2024-12-04 19:42:46', 4, 32, 17, 'Active'),
(1196, 'AC1179', 'Ahmad Fauzi', 'staff@smii.co.id', '$2y$12$/nOG50flY.IxFn6CDM9UTu30hlcXUUEHriyGEdNtS8GxS6wQAC0W2', '', NULL, '2024-11-03 19:08:34', '2024-12-04 18:46:06', 4, 32, 17, 'Active'),
(1197, 'AC1180', 'Bagus Santoso', 'staff@smii.co.id', '$2y$12$8GqWUtJbo77gopaZUsgADOmnHR.vWb6UQd9r2T11dAWrKhzp2VGVm', '', NULL, '2024-11-03 19:08:34', '2024-12-04 19:14:58', 4, 32, 17, 'Active'),
(1198, 'AE1251', 'Muarif', 'staff@smii.co.id', '$2y$12$KGvJbcQ4u6Sps6zhrlkgrewBIyf2YJtCVUDmKjAI8pyepo32EcqTq', '', NULL, '2024-11-03 19:08:34', '2024-12-04 20:11:28', 4, 32, 17, 'Active'),
(1199, 'AE1252', 'Muhamad Sidik', 'staff@smii.co.id', '$2y$12$pnzEI1H9asKuBGevjUz2Le1ArT6GOGhXK3Zrhwk2u1msXBZ869ZYy', '', NULL, '2024-11-03 19:08:35', '2024-12-04 20:15:51', 4, 32, 17, 'Active'),
(1200, 'AE1253', 'Ahmad Danofan Rizki', 'staff@smii.co.id', '$2y$12$8xtGd/B4G7P.hxDMcoD3p.c2RwEwLRukylgtVuYbVYUR1OKwJx2Wa', '', NULL, '2024-11-03 19:08:35', '2024-12-04 18:45:09', 4, 32, 17, 'Active'),
(1201, 'AG1342', 'Raharjo pecikos dyah sutondo', 'staff@smii.co.id', '$2y$12$Zazmmjece1UqM/aGTF6XseWoGgJEPq9AerNZUqDcHlDIhhwkxeBim', '', NULL, '2024-11-03 19:08:35', '2024-12-04 20:28:48', 4, 32, 17, 'Active'),
(1202, 'D0453', 'Soleman Lungan', 'staff@smii.co.id', '$2y$12$CE2DvvV01FS26J/6MibDqeKWw.2VPZtE3GfaJvRkHl.ogJOiD3i2W', '', NULL, '2024-11-03 19:08:35', '2024-12-04 20:33:58', 4, 32, 17, 'Active'),
(1203, 'D0468', 'Slamet Iswanto', 'staff@smii.co.id', '$2y$12$Y5ZwIs/BoviSxteKv0hAGu0XyRSgi3WHmoj6opMABkP6VWeUUZiUm', '', NULL, '2024-11-03 19:08:35', '2024-12-04 20:32:57', 4, 32, 17, 'Active'),
(1204, 'F0606', 'Wawan Sofyan', 'staff@smii.co.id', '$2y$12$mjE94oAL07EeQZDylXO9GeaeJf04gHA3zODMJoFj2phV/WffGOeUS', '', NULL, '2024-11-03 19:08:36', '2024-11-03 19:08:36', 4, 32, 17, 'Active'),
(1205, 'H0686', 'Agus Slamet Riyadi', 'staff@smii.co.id', '$2y$12$MlD23xk7iMnoHWdHRR600O/hBgAB7xq8az7RcRWQYN6yQjqFfT7p.', '', NULL, '2024-11-03 19:08:36', '2024-12-10 09:36:19', 4, 32, 17, 'Active'),
(1206, 'AD1227', 'Andika Suhendar', 'andika.suhendar@smii.co.id', '$2y$12$7NunYrYsgClhjKmMChfAR.QA5nyBJetbp8hELqGiCiHLCe.EEJkJy', 'AD1227.jpg', NULL, '2024-11-03 19:08:36', '2025-01-02 20:43:32', 2, 32, 18, 'Active'),
(1207, 'AE1244', 'Samuel David Christoper', 'samuel.christoper@smii.co.id', '$2y$12$.juZELwbUr1Hc.UHNa0LiuS84ycQ5nHqrlK3XSF0JLyBRU76NvBJ.', 'AE1244.png', NULL, '2024-11-03 19:08:36', '2024-12-20 00:19:36', 2, 32, 18, 'Active'),
(1209, 'U0942', 'Muchammad Arif Fathoni', 'arif.fathoni@smii.co.id', '$2y$12$DQ5BUqx2H6VDUNhy7WLj6uqKcdiwffSC8tWXoxtkn9oZKFGgn5y6i', '', NULL, '2024-11-03 19:08:37', '2024-12-04 18:31:43', 8, 32, 19, 'Active'),
(1210, 'F0569', 'Yudha Satriya', 'staff@smii.co.id', '$2y$12$HZEolR09kFebRDrkLEf/N.gCBqoQ2AL.9aiPkrV9AH81yQTQdgVju', '', NULL, '2024-11-03 19:08:37', '2024-12-04 18:33:50', 8, 32, 19, 'Active'),
(1211, 'F0617', 'Irma Nurbayani', 'irma.nurbayani@smii.co.id', '$2y$12$KceNmA0xYdFVn3UOWD.vbeshaJv6tNyfuRDzE3v6Yi7ATv5JA0v6e', '', NULL, '2024-11-03 19:08:37', '2024-12-05 22:07:28', 8, 32, 19, 'Active'),
(1212, 'J0745', 'Irwan Setiawan', 'irwan.setiawan@smii.co.id', '$2y$12$1fDCOhCHfnhBVtCewV1kue43n5DVfMa8Xg55iBOzk/X9gsBuHepPS', '', NULL, '2024-11-03 19:08:37', '2024-12-20 07:44:36', 8, 32, 19, 'Active'),
(1213, 'T0934', 'Moh. Ainun Naim', 'ainun.naim@smii.co.id', '$2y$12$VMfh30YWBbzf8IPpzEOb7eevmHBPOAie6cUOQzXWQ/HHjjZENnNkS', 'T0934.jpg', NULL, '2024-11-03 19:08:38', '2024-12-10 00:49:04', 8, 32, 19, 'Active'),
(1214, 'Z1054', 'Juni Asliah Batubara', 'staff@smii.co.id', '$2y$12$47ImG8Z6LTsGwJB92rzoK.uEC8N0Av5Oh4GqrbHvcuSJ/lmOOMJBm', '', NULL, '2024-11-03 19:08:38', '2024-11-03 19:08:38', 8, 32, 19, 'Active'),
(1215, 'E0531', 'Rahman', 'staff@smii.co.id', '$2y$12$CpndBVgcmzpl/3pgBQlHdu34BDQVyKHkmqDRgaeKVH0CS37qkNokq', '', NULL, '2024-11-03 19:08:38', '2024-12-04 18:33:16', 8, 32, 4, 'Active'),
(1217, 'AF1305', 'Trie Widyaningsih', 'purchasing@smii.co.id', '$2y$12$Wf0qATqmnQ1OQGm9ZrGltukJDVDDkZF8mi./XEja994b4jliUdrW.', 'AF1305.jpeg', NULL, '2024-11-03 19:08:39', '2024-12-21 06:53:06', 8, 32, 4, 'Active'),
(1218, 'AG1336', 'Djamaludin', 'staff@smii.co.id', '$2y$12$HfcNqfSL3vIwIxslfVML4uTuxGr5NnZ51hrYrS/XbPBbhlDL4r5GK', '', NULL, '2024-11-03 19:08:39', '2024-11-03 19:08:39', 8, 32, 4, 'Active'),
(1219, 'AF1308', 'Millicent Songster', 'millicent.songster@smii.co.id', '$2y$12$g/npiPisu0zK87GWmqYHQ.UCO18ANrOUM2YoyRdKd0QawwwdxrKnm', 'AF1308.jfif', NULL, '2024-11-03 19:08:39', '2024-12-04 20:09:01', 5, 32, 20, 'Active'),
(1220, 'E0539', 'Lensiyani', 'staff@smii.co.id', '$2y$12$Hje/G2DOOMstL78mSnEmxePpe73DQYE1GNR0YGCtj9cSr.aYIh3ky', '', NULL, '2024-11-03 19:08:39', '2024-11-03 19:08:39', 5, 32, 20, 'Active'),
(1221, 'Z1068', 'Vania Deborauli Siregar', 'staff@smii.co.id', '$2y$12$W0ri55TAO46Z05IJ8FejPOHtS7bTDREF9KLGKoS18wCFC2HMm8GMy', '', NULL, '2024-11-03 19:08:39', '2024-12-04 20:40:51', 5, 32, 20, 'Active'),
(1222, 'W1003', 'FX Surya Budi Santosa', 'staff@smii.co.id', '$2y$12$0YQXsyEa9LMON34ApRJ6qOVkWMXze0VdilA0qpTHYnLbIqW20Dv2G', '', NULL, '2024-11-03 19:08:40', '2024-12-04 19:40:47', 5, 32, 20, 'Active'),
(1223, 'AF1296', 'Jeremy Louis Adisurya', 'staff@smii.co.id', '$2y$12$S5nHC0xuPIU9UYdY9JNxDuglmS5GZ4BYoFaEiMvV1lQv/uTTMD7OW', '', NULL, '2024-11-03 19:08:40', '2024-12-04 19:56:14', 5, 32, 20, 'Active'),
(1224, 'D0436', 'Edi Tri Maryanto', 'edi.trimaryanto@smii.co.id', '$2y$12$cOYrsfMki3M/ZAstndJ0iu6aO0csULoy7K36dQ2HgpDfl4JPO4azu', '', NULL, '2024-11-03 19:08:40', '2024-12-10 00:28:34', 5, 32, 21, 'Active'),
(1225, 'E0537', 'Edy Purwanto', 'staff@smii.co.id', '$2y$12$qcMp1.8gZKClWeYFeMI7RuvBCEJgyHyukaxKLyfOnIaGeuBXtq3eq', '', NULL, '2024-11-03 19:08:40', '2024-12-04 19:35:15', 5, 32, 21, 'Active'),
(1226, 'S0907', 'Dian Purwandaka', 'staff@smii.co.id', '$2y$12$V3rL8nVcjghP56mtadZtg.6wf052UaFURG38XGcxPjfHBCklpGB3e', '', NULL, '2024-11-03 19:08:40', '2024-12-04 19:29:27', 5, 32, 21, 'Active'),
(1227, 'T0922', 'Agus Sudarmaji', 'staff@smii.co.id', '$2y$12$HuOEFutgvTFkLaiQ4j.ci.5jYdFKEKAJckKpHVHxdCrFczKE.FQm.', '', NULL, '2024-11-03 19:08:41', '2024-12-04 18:43:33', 5, 32, 21, 'Active'),
(1228, 'T0923', 'Juli Hadiyanto', 'staff@smii.co.id', '$2y$12$LVRQrDpN3zJpxy/nwrqn2uSuA85J0slhA2NsSvxAS82sjW/3e54tC', '', NULL, '2024-11-03 19:08:41', '2024-11-03 19:08:41', 5, 32, 21, 'Active'),
(1229, 'U0938', 'Umar Wira Hadi Kusuma', 'staff@smii.co.id', '$2y$12$wsVNMsWNOwDZlK/kHM0fseqfP2RneKt6rgiA.ct9l5iaLe.fwQBF6', '', NULL, '2024-11-03 19:08:41', '2024-11-03 19:08:41', 5, 32, 21, 'Active'),
(1230, 'AG1348', 'Adiona Eka Saputra', 'staff@smii.co.id', '$2y$12$L2BiZR/e92/MvsbE7iEQGupAf53JW4SCeTbeOxkweiG74Wtn./r/G', '', NULL, '2024-11-03 19:08:41', '2024-12-04 18:40:36', 5, 32, 21, 'Active'),
(1231, 'AC1157', 'Dedy Yuda Tri Artanto', 'staff@smii.co.id', '$2y$12$yzTnmLZw/WDrvZm7d7/2Ru/YMy44zGFsn3l6m5um6mru.CcYehh0u', '', NULL, '2024-11-03 19:08:42', '2024-12-04 19:27:08', 5, 32, 21, 'Active'),
(1232, 'Q0881', 'Maria Muyarni', 'staff@smii.co.id', '$2y$12$BGQQkMuT3swj6g9mH0cV9OVnkwbIVFYP/ZwcJ/v3NcBYroITVd2Ee', '', NULL, '2024-11-03 19:08:42', '2024-12-04 20:20:52', 6, 32, 22, 'Active'),
(1233, 'U0939', 'Trancy Chandra', 'staff@smii.co.id', '$2y$12$ZgjUHv6M.mb3R33TNukeAeUAAv.AkucV74zRRGlm8A6ps9/StmZZ6', 'U0939.jpg', NULL, '2024-11-03 19:08:42', '2024-12-11 00:09:17', 6, 32, 22, 'Active'),
(1234, 'U0954', 'Suroto', 'suroto@smii.co.id', '$2y$12$0ftR5WdLSDTzk0Z0cGpY5OrsXG2w.43.nmnuWFXRhA4RefDsOF59u', '', NULL, '2024-11-03 19:08:42', '2024-12-04 20:40:06', 6, 32, 22, 'Active');
INSERT INTO `users` (`id`, `nik`, `name`, `email`, `password`, `avatar`, `remember_token`, `created_at`, `updated_at`, `department_id`, `position_id`, `section_id`, `status`) VALUES
(1235, 'AE1263', 'Irfan Raditya Hendraputra', 'irfan.raditya@smii.co.id', '$2y$12$iFtFcAiIXeT1cPjtHDX8MO1.ke/YjvcShHk.af5DU3h3anninas3S', '', NULL, '2024-11-03 19:08:42', '2024-12-23 01:51:33', 6, 32, 22, 'Active'),
(1236, 'AE1264', 'Elia Herlina Dwiyanti', 'elia.dwiyanti@smii.co.id', '$2y$12$gPQkgv2.pE1yaShwB6o3vuJxNjtV1qRaDeAr.XD/rnFZKmggoiQkG', 'AE1264.jpg', NULL, '2024-11-03 19:08:43', '2024-12-23 01:16:49', 6, 32, 22, 'Active'),
(1237, 'Y1050', 'Nahason Haria', 'nahason.haria@smii.co.id', '$2y$12$xEBPrad2BrImckh9GLnPDOo31qv512WvYTuOrzNkOIoMB6xgHbxKu', '', NULL, '2024-11-03 19:08:43', '2024-12-10 01:48:12', 7, 32, 23, 'Active'),
(1238, 'A0187', 'Sulis Setianingsih', 'staff@smii.co.id', '$2y$12$QpFN.e/vDSRgsm2UqVQbpuleUMUSKATvbIM453j1K11tPbozxLbSW', '', NULL, '2024-11-03 19:08:43', '2024-12-04 20:37:47', 7, 32, 23, 'Active'),
(1239, 'AB1150', 'Finka Thalia Yosepine', 'staff@smii.co.id', '$2y$12$BuY2F1J7HAh77FHShDxEGepHW7SVdQoXumQOhyL6luDbRY0EwD4Cq', '', NULL, '2024-11-03 19:08:43', '2024-12-04 19:39:06', 7, 32, 23, 'Active'),
(1240, 'AC1156', 'Ayu Untari Putri', 'staff@smii.co.id', '$2y$12$jEE1zWO8uC7PguTmnlSvauB.55yW9E2f2PRlY7wEkt0rtPjUjHOT.', '', NULL, '2024-11-03 19:08:44', '2024-12-04 19:11:59', 7, 32, 24, 'Active'),
(1241, 'X1017', 'Putri Wulandari', 'putri.wulandari@smii.co.id', '$2y$12$Fxtpv60ndQmUc5p.nMGlAO7msaP/4t.v71jFA3oM8of.E1/5m48Gu', '', NULL, '2024-11-03 19:08:44', '2024-12-17 01:12:46', 7, 32, 24, 'Active'),
(1242, 'AE1277', 'Tommy Christian', 'tommy.christian@smii.co.id', '$2y$12$qxK.0sliW9fSn.stNQp4AOa5o.a3C0EvwlszSiod2R4WgQMwBohBi', 'AE1277.jpeg', NULL, '2024-11-03 19:08:44', '2024-12-16 00:28:07', 7, 32, 24, 'Active'),
(1243, 'Q0858', 'Reginald Iskandar', 'reginald.iskandar@smii.co.id', '$2y$12$2chHn56jXVyxMfA8RzH4f.NjV6dS2REG16T2Kf37A4Id40u/dDDDi', '', NULL, '2024-11-03 19:08:44', '2024-12-11 19:25:42', 7, 32, 25, 'Active'),
(1244, 'F0609', 'Rodikin', 'staff@smii.co.id', '$2y$12$WEHkf0roYbl0dCwNmFmw..6laj4FumQoFRvYvQfY1VPrrll2LS9Wq', '', NULL, '2024-11-03 19:08:44', '2024-11-03 19:08:44', 7, 32, 25, 'Active'),
(1245, 'Q0860', 'Munkus Whisnu Dwisaputra', 'munkus.whisnu@smii.co.id', '$2y$12$4G17iH3y5pcYlREsWghC.enzNHZaWnRGku6dX6Ifk3bjGngP8pVSS', 'Q0860.jpg', NULL, '2024-11-03 19:08:45', '2024-12-11 22:37:51', 7, 32, 25, 'Active'),
(1246, 'U0945', 'Chandra Humanita', 'staff@smii.co.id', '$2y$12$DK84CidfXQmZzmuByD21P.aWNGjTj70yOMuPRaR58a8Lu18ie7NdS', '', NULL, '2024-11-03 19:08:45', '2024-12-04 19:23:51', 7, 32, 25, 'Active'),
(1247, 'H0682', 'Nia Maulina', 'staff@smii.co.id', '$2y$12$LGrEW8RnKFVJJm1ezW5QdOicj5g5DtQtwltUOElxQvcTRwVmGK5lO', '', NULL, '2024-11-03 19:08:45', '2024-12-04 20:22:47', 7, 32, 25, 'Active'),
(1248, 'V0961', 'Rury Pratama', 'staff@smii.co.id', '$2y$12$LaiefUFx5Cst4s8AA2yH3eC/sK8Rpr/hleBqdmS9ttfuRDzRUDcai', '', NULL, '2024-11-03 19:08:45', '2024-12-04 20:27:25', 7, 32, 25, 'Active'),
(1249, 'AB1117', 'Dhani Irfantoro', 'staff@smii.co.id', '$2y$12$EXAmoj/g2elT8gIlZpKgPehY225OP5qZlNGOK1D.ZXCl.XGRJmNKi', '', NULL, '2024-11-03 19:08:45', '2024-12-04 19:29:07', 7, 32, 25, 'Active'),
(1250, 'AB1118', 'Martin Paulus Sinaga', 'staff@smii.co.id', '$2y$12$Es580UT38zabpHdPWiqQE.jSxaYuALFM.UUQmecfwZm39AKer2Gwu', '', NULL, '2024-11-03 19:08:46', '2024-12-04 20:07:25', 7, 32, 25, 'Active'),
(1251, 'AA1095', 'Christoforus Kevin', 'christoforus.kevin@smii.co.id', '$2y$12$kOcRjVHuKmNI2H0s6k080e9P2NSxcxwI3NeRBX1AgVfsRlihfMKsq', 'AA1095.jpeg', NULL, '2024-11-03 19:08:46', '2024-12-23 20:46:25', 7, 32, 25, 'Active'),
(1252, 'AB1133', 'Rizal Anwar', 'rizal.anwar@smii.co.id', '$2y$12$jiFzasabA3gfG9uBRY25CuXHD68vcjR.ocXebtivIuOixDle12L72', 'AB1133.jpeg', NULL, '2024-11-03 19:08:46', '2024-12-24 02:45:18', 7, 32, 25, 'Active'),
(1253, 'AB1135', 'Panca Setiawan', 'staff@smii.co.id', '$2y$12$50A5IVx09IPAAme6UidBfehkm.boh/tc6dR9s0qRceQpcbH9EposW', 'AB1135.jpeg', NULL, '2024-11-03 19:08:46', '2024-12-23 07:16:32', 7, 32, 25, 'Active'),
(1254, 'AB1141', 'Nugraha Amrul Fahlevi Lubis', 'Fahlevi.lubis@smii.co.id', '$2y$12$bREZiXIxzJB8KPcnIbBhYejoe.IXQMWw4hxNJ2LPTQZeLUlp4h7n.', 'AB1141.jpg', NULL, '2024-11-03 19:08:47', '2024-12-23 21:37:41', 7, 32, 25, 'Active'),
(1255, 'AB1148', 'Clara Adelina', 'staff@smii.co.id', '$2y$12$xXxGZvWBVblIqqKwaoiT3O7FNEixrvF/cYfLIP/L8degdKJyiwpRu', '', NULL, '2024-11-03 19:08:47', '2024-12-04 19:25:17', 7, 32, 25, 'Active'),
(1256, 'AD1205', 'Zen Ekasari', 'staff@smii.co.id', '$2y$12$866slxlpUzgDI.y0k6yPhuUi6zUVKumT1MOlw8m1Zh4F7lEg.cPxG', '', NULL, '2024-11-03 19:08:47', '2024-12-04 20:28:43', 7, 32, 25, 'Active'),
(1257, 'AE1256', 'Putri Yashi Nabilah', 'staff@smii.co.id', '$2y$12$RF1OfVEKCpkt.XzJiBn.2uZbP5QW/ptOMmsBkssQ559irVDUenSrW', '', NULL, '2024-11-03 19:08:47', '2024-12-23 22:37:03', 7, 32, 25, 'Active'),
(1258, 'AF1287', 'Sonny Pratama Mandira', 'sonny.mandira@smii.co.id', '$2y$12$FCeFwEX.Kea.zH8JBssU5Osn6HK7yquJyUl3/Ns1NJ0PILLbLQmQy', 'AF1287.png', NULL, '2024-11-03 19:08:47', '2024-12-17 01:05:23', 7, 32, 25, 'Active'),
(1259, 'AG1334', 'Jeltrin Kembuan', 'staff@smii.co.id', '$2y$12$5utQudjmCKRKKeSd39V.gOjLdW09I5IzDdDGtdaOKJsraMMpEYieK', '', NULL, '2024-11-03 19:08:48', '2024-12-04 19:55:54', 7, 32, 25, 'Active'),
(1260, 'K0761', 'Soebianto Halim', 'staff@smii.co.id', '$2y$12$tZQzQ4xc7cqcm3670BpKhumJ/UfAXNxQNxCteMDwDDw617YhcMU2u', '', NULL, '2024-11-03 19:08:48', '2024-11-03 19:08:48', 7, 32, 26, 'Active'),
(1261, 'F0590', 'Antony Horianto', 'staff@smii.co.id', '$2y$12$MQ7IfdEcXLJQ8sQ1rAfn0OuVORNS5oM9swYLZUNqVzSBIz49GwQ2.', '', NULL, '2024-11-03 19:08:48', '2024-12-04 19:06:17', 7, 32, 26, 'Active'),
(1262, 'K0778', 'Jumhasrifel', 'staff@smii.co.id', '$2y$12$oFu8EwUie9Dvu3eElOAzD.UOMvK.UcvgJL98P4clz3gRqZm5gu6eO', '', NULL, '2024-11-03 19:08:48', '2024-12-04 19:57:25', 7, 32, 26, 'Active'),
(1264, 'Y1042', 'Chien Siang', 'chen.siang@smii.co.id', '$2y$12$/BDhM1YdB9RQypd3mdPFDeZRcFCirAsChiDenktSCQw0r9.ij3uim', '', NULL, '2024-11-03 19:08:49', '2024-12-11 23:23:45', 7, 32, 26, 'Active'),
(1265, 'AF1291', 'Fredy Salim', 'fredy.salim@smii.co.id', '$2y$12$r.Ab0xdElaWbuB85znAP6.SUnMIpZV./FLlJRgzDUq7Rj4LlTWw2.', '', NULL, '2024-11-03 19:08:49', '2024-12-11 23:20:47', 7, 32, 26, 'Active'),
(1266, 'AF1307', 'Alfons Edward Sugito Palondongan', 'staff@smii.co.id', '$2y$12$ZgPQb69JdFmXyf2jbVu7/uiWDsmRQY3azgHMiFMPuPUcwZhRynFve', '', NULL, '2024-11-03 19:08:49', '2024-12-04 18:52:39', 7, 32, 26, 'Active'),
(1267, 'F0584', 'Budy Kristanto', 'staff@smii.co.id', '$2y$12$LJCfXS6kr8jEyYf7zFyLvekUm.XEaqKCQXT8ezm58sqAwBgii9I4S', '', NULL, '2024-11-03 19:08:49', '2024-12-04 19:23:04', 7, 32, 26, 'Active'),
(1268, 'K0771', 'Santo Salim', 'santo.salim@smii.co.id', '$2y$12$wbWcQiDGKFfTGqxjnWTT7uEPbZ/uOzy9hGouvNo8fd2URPp9AILR6', '', NULL, '2024-11-03 19:08:50', '2024-12-11 23:21:31', 7, 32, 26, 'Active'),
(1269, 'Q0883', 'Molek Susilawati', 'staff@smii.co.id', '$2y$12$Pgtp9078Jon0QItUnQZ9fuc9SSRQHTZCsU19EXIEBiXZ3ByWiI.HW', '', NULL, '2024-11-03 19:08:50', '2024-11-03 19:08:50', 7, 32, 26, 'Active'),
(1270, 'V0981', 'Nyimas Mariam', 'nyimas.mariam@smii.co.id', '$2y$12$RKh1TFfIS68gjzzsQTS0XeHEr94vZzO.0Ch2gilg9b3knUs6zVq3K', '', NULL, '2024-11-03 19:08:50', '2024-12-22 20:26:19', 7, 32, 26, 'Active'),
(1271, 'W1002', 'Agus Sujana', 'staff@smii.co.id', '$2y$12$wcM30HY8URfEu90K/s9mWek8PUWY1mSG6ZpYu9nf2/B6FrP7z6eIq', '', NULL, '2024-11-03 19:08:50', '2024-12-04 19:02:26', 7, 32, 26, 'Active'),
(1272, 'AA1088', 'Yudha Nugraha', 'staff@smii.co.id', '$2y$12$NTGDnnR3pzbuG.zLvTEr6OmKtzqJwUSQ0x7mDa/jQeuUXw7fa2UI6', '', NULL, '2024-11-03 19:08:51', '2024-12-04 20:21:42', 7, 32, 26, 'Active'),
(1273, 'AA1098', 'Siswadi', 'siswadi@smii.co.id', '$2y$12$kYmBU2Et8DPjR2bVlr7pe.PR4opioyqleKG6CXOGzQ24Fmp5YdcK.', '', NULL, '2024-11-03 19:08:51', '2024-12-11 23:21:19', 7, 32, 26, 'Active'),
(1274, 'AA1108', 'Wilson Macmiland', 'staff@smii.co.id', '$2y$12$MIwgZsoa.7i/v88iOOhbwORpAs/q9X7Rd6B4Js0vKQphGfUE0IBq2', '', NULL, '2024-11-03 19:08:51', '2024-12-04 20:24:55', 7, 32, 26, 'Active'),
(1275, 'AC1167', 'Dedi Mangampu Tua', 'staff@smii.co.id', '$2y$12$sOKWE09wkmC5LZzmZevlHORm8pHmGZ28JU113sbHxNT1uNyvg8eA.', '', NULL, '2024-11-03 19:08:51', '2024-12-04 19:26:46', 7, 32, 26, 'Active'),
(1276, 'AC1174', 'Franies Matriyanto Yohakim Tandawuya', 'staff@smii.co.id', '$2y$12$IwzW.IzqTO4f7kqczz2d7eM2Do7Jh8gHk3ga9cJfGDyTiC2LsmGj.', '', NULL, '2024-11-03 19:08:51', '2024-12-04 19:39:41', 7, 32, 26, 'Active'),
(1277, 'AD1235', 'Federich Arswendo Perwira Negara', 'staff@smii.co.id', '$2y$12$dbFbCX1QI562cmKVsI6oDOoi1QS6xYCXee2hy59WzGNP8LGB0YE82', '', NULL, '2024-11-03 19:08:52', '2024-12-04 19:38:39', 7, 32, 26, 'Active'),
(1278, 'AD1239', 'Andrey Hermawan', 'staff@smii.co.id', '$2y$12$imZasc12pCTAyOoHYvabpuutBsNGl2bCr11wGsd6RiCj8r4Vvophi', '', NULL, '2024-11-03 19:08:52', '2024-12-11 20:35:20', 7, 32, 26, 'Active'),
(1279, 'AE1261', 'Noor Kurnia Andrean', 'noor.andrean@smii.co.id', '$2y$12$W8iCqG/CsqCinX6ASpmQg.XcCc/GnmSFPwRQvj6fP2gtRQW6iQI/y', '', NULL, '2024-11-03 19:08:52', '2024-12-11 23:22:16', 7, 32, 26, 'Active'),
(1280, 'AG1312', 'Andrea Aji Asmara', 'andrea.asmara@smii.com', '$2y$12$YXlnU1t0gMJt3dcpDV6lwuszz.B9R1DpLjGziso/6T2EL6az/6zSu', 'AG1312.jpeg', NULL, '2024-11-03 19:08:52', '2024-12-11 23:29:32', 7, 32, 26, 'Active'),
(1281, 'AG1314', 'Achmad Fauzi', 'staff@smii.co.id', '$2y$12$rtTazEQeSoHRmilByTvjP.RQeN2gr5VBfuznhD65YIT76sz1HsjH.', '', NULL, '2024-11-03 19:08:52', '2024-12-04 19:01:50', 7, 32, 26, 'Active'),
(1282, 'AA1100', 'Yandri Fahmi', 'yandri.fahmi@smii.co.id', '$2y$12$as3YwZgsiTG/34f.I0OtC.VUqKZDCbHdGfWGMv35wus/xsxvJtmPO', '', NULL, '2024-11-03 19:08:53', '2024-12-26 21:58:51', 7, 32, 26, 'Active'),
(1283, 'AA1112', 'Kevin Wijaya', 'staff@smii.co.id', '$2y$12$tJMsCegyU92Od1RPlV2OuO2xi9nzwdO4f0ig2qkWxJvGHcP1RLsKK', '', NULL, '2024-11-03 19:08:53', '2024-12-04 19:58:54', 7, 32, 26, 'Active'),
(1284, 'AB1123', 'Suhadi', 'suhadi@smii.co.id', '$2y$12$OUUpvYpSrisrWZo4M8Hn8eQ5bpiNVcKbB0vNHhyVaJsaMgyF03by2', '', NULL, '2024-11-03 19:08:53', '2024-12-11 23:24:18', 7, 32, 26, 'Active'),
(1285, 'AD1236', 'Hendro Prayetno', 'hendro.prayetno@smii.co.id', '$2y$12$uRzz9FelvmIy6rEVGkhQT.KTEfc9AtbpS2Xt7LBqDG6JRicRHL3Hi', '', NULL, '2024-11-03 19:08:53', '2024-12-11 23:25:02', 7, 32, 26, 'Active'),
(1286, 'AF1281', 'Muhamad Faiq Renaldiandadinata', 'muhammad.faiq@smii.co.id', '$2y$12$MoM2rqi5xQqyrRLP6JMGbuktFlFqGuXer36nMxw654y1t2IIoa9C6', '', NULL, '2024-11-03 19:08:54', '2024-12-11 23:45:08', 7, 32, 26, 'Active'),
(1287, 'AF1286', 'Teni Muhamad Rijal', 'staff@smii.co.id', '$2y$12$.U4NLrtMDU8Tu5jGA7vE2ON6Xt7eVzLv2mD.OPqc.vUCMLNOQrXZG', 'AF1286.jpeg', NULL, '2024-11-03 19:08:54', '2024-12-30 23:20:35', 7, 32, 26, 'Active'),
(1288, 'AG1326', 'Dadang Achmad Fadoli', 'staff@smii.co.id', '$2y$12$hKAEVkX4ZRk52Xzl.9U.v..AwNsO8T33bG5h.OSN.1vmjhY.g2Dk2', '', NULL, '2024-11-03 19:08:54', '2024-12-04 20:15:46', 7, 32, 26, 'Active'),
(1289, 'D0437', 'Budi Adimulyo', 'budi.adimulyo@smii.co.id', '$2y$12$HPu3cJNfg17djAqcqt5oBejC87htglbtEEBhL6h4MxV0/bEAgBOGW', NULL, NULL, '2024-11-03 19:24:25', '2024-11-03 19:24:25', 4, 17, 7, 'Active'),
(1290, 'X1031', 'Edie Hirman', 'edie.hirman@smii.co.id', '$2y$12$//W1f3tV.nva5.wjDMTEx.1eNoieNZcKih9n95YznpC7OBzvFtnMK', NULL, NULL, '2024-11-05 07:49:04', '2025-01-02 21:26:54', 2, 3, 18, 'Active'),
(1291, 'Z1058', 'Ronal Katili', 'ronal.katili@smii.co.id', '$2y$12$iYJQ0PKGcAqmA2mgUN6TQuMWDphS1vk/WfIpITgIp5gLQa/l/Scj.', NULL, NULL, '2024-11-05 07:58:58', '2024-12-06 02:12:44', 7, 30, 24, 'Active'),
(1292, 'C0346', 'Payaman Pandiangan', 'payaman.pandiangan@smii.co.id', '$2y$12$wi6E6TEh47ifBsE6HgYK9.ZhKdqGOICHPTfZMv4R5VluAoaH57td.', NULL, NULL, '2024-11-05 08:00:10', '2024-12-06 02:11:45', 5, 36, 12, 'Active'),
(1293, 'AG1356', 'Markus Wibowo', 'markus.wibowo@smii.co.id', '$2y$12$G08Hqm/oaKJxOcv6jKGP5u4Q4SqRi22iH.JZk7kLHXwR9Dv2hL.V6', NULL, NULL, '2024-12-03 19:48:17', '2024-12-03 21:10:39', 3, 62, 2, 'Active'),
(1294, 'AG1354', 'Irma Sulistyo', 'irma.sulistyo@smii.co.id', '$2y$12$e7R8Q0mTAQLaTuLlyEc9HO3Thnb9bMBlMezBtcJ9nAF4.AZOs33K6', NULL, NULL, '2024-12-11 20:16:43', '2024-12-11 20:16:43', 7, 32, 9, 'Active'),
(1295, 'AH1358', 'Fendi', 'fendi@smii.co.id', '$2y$12$AXcEcrnWhJLcy6zxnbune.FPYpEosbKChflIblpTi3FmYlWWTedWi', NULL, NULL, '2025-01-01 20:53:00', '2025-01-01 20:53:00', 8, 10, 19, 'Active'),
(1296, 'AH1359', 'Edi Victara Tinambunan', 'edi.tinambunan@smii.co.id', '$2y$12$RMFU4LESTehpL0ienw0ABOYvGfUJUoesLS/RGpRBKhJMsCQJ0qjFK', NULL, NULL, '2025-01-01 20:53:56', '2025-01-01 20:53:56', 7, 14, 14, 'Active'),
(1305, 'test2a', 'test2', 'test2@gmail.com', '$2y$12$UONY4a2EB3y6fzUBXkV7ZuFi8EXD./MRURA6kxhQyBrWoIx6AwjAC', NULL, NULL, '2025-03-04 00:56:32', '2025-03-04 00:56:32', 1, 1, 1, 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `mpdr_approved_details`
--
ALTER TABLE `mpdr_approved_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_approved_details_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_approvers`
--
ALTER TABLE `mpdr_approvers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpdr_certification_requirements`
--
ALTER TABLE `mpdr_certification_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_certification_requirements_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_channels`
--
ALTER TABLE `mpdr_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_channels_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_competitor_products`
--
ALTER TABLE `mpdr_competitor_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_competitor_products_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_detailed_packagings`
--
ALTER TABLE `mpdr_detailed_packagings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_detailed_packagings_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_forms`
--
ALTER TABLE `mpdr_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_forms_revision_id_foreign` (`revision_id`);

--
-- Indexes for table `mpdr_form_details`
--
ALTER TABLE `mpdr_form_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_form_details_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_initiator_approved_details`
--
ALTER TABLE `mpdr_initiator_approved_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_initiator_approved_details_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_market_updates`
--
ALTER TABLE `mpdr_market_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_market_updates_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_product_categories`
--
ALTER TABLE `mpdr_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_product_categories_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_product_descriptions`
--
ALTER TABLE `mpdr_product_descriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpdr_product_descriptions_form_id_foreign` (`form_id`);

--
-- Indexes for table `mpdr_revisions`
--
ALTER TABLE `mpdr_revisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positions_department_id_foreign` (`department_id`),
  ADD KEY `positions_level_id_foreign` (`level_id`);

--
-- Indexes for table `pre_mpdr_approved_details`
--
ALTER TABLE `pre_mpdr_approved_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_approved_details_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_approvers`
--
ALTER TABLE `pre_mpdr_approvers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_approvers_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_certification_requirements`
--
ALTER TABLE `pre_mpdr_certification_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_certification_requirements_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_channels`
--
ALTER TABLE `pre_mpdr_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_channels_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_competitor_products`
--
ALTER TABLE `pre_mpdr_competitor_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_competitor_products_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_detailed_packagings`
--
ALTER TABLE `pre_mpdr_detailed_packagings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_detailed_packagings_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_forms`
--
ALTER TABLE `pre_mpdr_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_forms_revision_id_foreign` (`revision_id`);

--
-- Indexes for table `pre_mpdr_form_details`
--
ALTER TABLE `pre_mpdr_form_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_form_details_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_market_updates`
--
ALTER TABLE `pre_mpdr_market_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_market_updates_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_product_categories`
--
ALTER TABLE `pre_mpdr_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_product_categories_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_product_descriptions`
--
ALTER TABLE `pre_mpdr_product_descriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_mpdr_product_descriptions_form_id_foreign` (`form_id`);

--
-- Indexes for table `pre_mpdr_revisions`
--
ALTER TABLE `pre_mpdr_revisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`),
  ADD KEY `users_section_id_foreign` (`section_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `mpdr_approved_details`
--
ALTER TABLE `mpdr_approved_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `mpdr_approvers`
--
ALTER TABLE `mpdr_approvers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `mpdr_certification_requirements`
--
ALTER TABLE `mpdr_certification_requirements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mpdr_channels`
--
ALTER TABLE `mpdr_channels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mpdr_competitor_products`
--
ALTER TABLE `mpdr_competitor_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mpdr_detailed_packagings`
--
ALTER TABLE `mpdr_detailed_packagings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mpdr_forms`
--
ALTER TABLE `mpdr_forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mpdr_form_details`
--
ALTER TABLE `mpdr_form_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mpdr_initiator_approved_details`
--
ALTER TABLE `mpdr_initiator_approved_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mpdr_market_updates`
--
ALTER TABLE `mpdr_market_updates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mpdr_product_categories`
--
ALTER TABLE `mpdr_product_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mpdr_product_descriptions`
--
ALTER TABLE `mpdr_product_descriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `mpdr_revisions`
--
ALTER TABLE `mpdr_revisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `pre_mpdr_approved_details`
--
ALTER TABLE `pre_mpdr_approved_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `pre_mpdr_approvers`
--
ALTER TABLE `pre_mpdr_approvers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pre_mpdr_certification_requirements`
--
ALTER TABLE `pre_mpdr_certification_requirements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pre_mpdr_channels`
--
ALTER TABLE `pre_mpdr_channels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pre_mpdr_competitor_products`
--
ALTER TABLE `pre_mpdr_competitor_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pre_mpdr_detailed_packagings`
--
ALTER TABLE `pre_mpdr_detailed_packagings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pre_mpdr_forms`
--
ALTER TABLE `pre_mpdr_forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pre_mpdr_form_details`
--
ALTER TABLE `pre_mpdr_form_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pre_mpdr_market_updates`
--
ALTER TABLE `pre_mpdr_market_updates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pre_mpdr_product_categories`
--
ALTER TABLE `pre_mpdr_product_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pre_mpdr_product_descriptions`
--
ALTER TABLE `pre_mpdr_product_descriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pre_mpdr_revisions`
--
ALTER TABLE `pre_mpdr_revisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1306;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_approved_details`
--
ALTER TABLE `mpdr_approved_details`
  ADD CONSTRAINT `mpdr_approved_details_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_certification_requirements`
--
ALTER TABLE `mpdr_certification_requirements`
  ADD CONSTRAINT `mpdr_certification_requirements_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_channels`
--
ALTER TABLE `mpdr_channels`
  ADD CONSTRAINT `mpdr_channels_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_competitor_products`
--
ALTER TABLE `mpdr_competitor_products`
  ADD CONSTRAINT `mpdr_competitor_products_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_detailed_packagings`
--
ALTER TABLE `mpdr_detailed_packagings`
  ADD CONSTRAINT `mpdr_detailed_packagings_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_forms`
--
ALTER TABLE `mpdr_forms`
  ADD CONSTRAINT `mpdr_forms_revision_id_foreign` FOREIGN KEY (`revision_id`) REFERENCES `mpdr_revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_form_details`
--
ALTER TABLE `mpdr_form_details`
  ADD CONSTRAINT `mpdr_form_details_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_initiator_approved_details`
--
ALTER TABLE `mpdr_initiator_approved_details`
  ADD CONSTRAINT `mpdr_initiator_approved_details_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_market_updates`
--
ALTER TABLE `mpdr_market_updates`
  ADD CONSTRAINT `mpdr_market_updates_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_product_categories`
--
ALTER TABLE `mpdr_product_categories`
  ADD CONSTRAINT `mpdr_product_categories_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpdr_product_descriptions`
--
ALTER TABLE `mpdr_product_descriptions`
  ADD CONSTRAINT `mpdr_product_descriptions_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `positions_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`);

--
-- Constraints for table `pre_mpdr_approved_details`
--
ALTER TABLE `pre_mpdr_approved_details`
  ADD CONSTRAINT `pre_mpdr_approved_details_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_approvers`
--
ALTER TABLE `pre_mpdr_approvers`
  ADD CONSTRAINT `pre_mpdr_approvers_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_certification_requirements`
--
ALTER TABLE `pre_mpdr_certification_requirements`
  ADD CONSTRAINT `pre_mpdr_certification_requirements_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_channels`
--
ALTER TABLE `pre_mpdr_channels`
  ADD CONSTRAINT `pre_mpdr_channels_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_competitor_products`
--
ALTER TABLE `pre_mpdr_competitor_products`
  ADD CONSTRAINT `pre_mpdr_competitor_products_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_detailed_packagings`
--
ALTER TABLE `pre_mpdr_detailed_packagings`
  ADD CONSTRAINT `pre_mpdr_detailed_packagings_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_forms`
--
ALTER TABLE `pre_mpdr_forms`
  ADD CONSTRAINT `pre_mpdr_forms_revision_id_foreign` FOREIGN KEY (`revision_id`) REFERENCES `pre_mpdr_revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_form_details`
--
ALTER TABLE `pre_mpdr_form_details`
  ADD CONSTRAINT `pre_mpdr_form_details_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_market_updates`
--
ALTER TABLE `pre_mpdr_market_updates`
  ADD CONSTRAINT `pre_mpdr_market_updates_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_product_categories`
--
ALTER TABLE `pre_mpdr_product_categories`
  ADD CONSTRAINT `pre_mpdr_product_categories_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pre_mpdr_product_descriptions`
--
ALTER TABLE `pre_mpdr_product_descriptions`
  ADD CONSTRAINT `pre_mpdr_product_descriptions_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `pre_mpdr_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
