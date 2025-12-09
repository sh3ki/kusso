-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 07, 2025 at 05:20 PM
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
-- Database: `kusso`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`) VALUES
(1, 'Ricemeal', 'Food'),
(2, 'Combo', NULL),
(3, 'Wings', 'Food'),
(4, 'Pasta', 'Food'),
(5, 'Burgers', 'Food'),
(6, 'Sandwiches', 'Food'),
(7, 'Snacks', 'Food'),
(8, 'Ice Blended', 'Drinks'),
(9, 'Coffee Blended', 'Drinks'),
(10, 'Yogurt Series', 'Drinks'),
(11, 'Add ons', NULL),
(12, 'Coffee', 'Drinks'),
(13, 'Fruit Tea', 'Drinks'),
(14, 'Milk Based', 'Drinks'),
(15, 'Milk Tea', 'Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `category_ingredients`
--

CREATE TABLE `category_ingredients` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity_requirement` decimal(10,2) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `size` varchar(20) DEFAULT '16oz',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category_ingredients`
--

INSERT INTO `category_ingredients` (`id`, `category_id`, `ingredient_id`, `quantity_requirement`, `unit`, `size`, `created_at`, `updated_at`) VALUES
(14, 12, 12, 1.00, 'pcs', '16oz', '2025-11-23 21:30:00', '2025-11-23 21:31:09'),
(15, 9, 12, 1.00, 'pcs', '16oz', '2025-11-23 21:33:16', '2025-11-23 21:38:49'),
(16, 12, 1, 40.00, 'ml', '16oz', '2025-11-23 21:33:31', '2025-11-23 22:07:20'),
(17, 9, 15, 60.00, 'grams', '16oz', '2025-11-23 21:36:15', '2025-11-23 21:38:19'),
(18, 9, 2, 60.00, 'ml', '16oz', '2025-11-23 21:36:49', '2025-11-23 21:39:17'),
(19, 9, 13, 1.00, 'pcs', '16oz', '2025-11-23 21:37:09', '2025-11-23 21:39:41'),
(20, 10, 2, 20.00, 'ml', '16oz', '2025-11-23 21:40:28', '2025-11-23 21:42:24'),
(21, 10, 16, 20.00, 'ml', '16oz', '2025-11-23 21:41:32', '2025-11-23 21:43:12'),
(22, 10, 3, 150.00, 'ml', '16oz', '2025-11-23 21:41:46', '2025-11-23 21:42:47'),
(23, 10, 13, 1.00, 'pcs', '16oz', '2025-11-23 21:44:25', '2025-11-23 21:45:20'),
(24, 10, 12, 1.00, 'pcs', '16oz', '2025-11-23 21:44:40', '2025-11-23 21:45:07'),
(25, 15, 12, 1.00, 'pcs', '16oz', '2025-11-23 21:46:33', '2025-11-23 21:49:09'),
(26, 15, 13, 1.00, 'pcs', '16oz', '2025-11-23 21:46:50', '2025-11-23 21:57:45'),
(27, 15, 9, 20.00, 'ml', '16oz', '2025-11-23 21:47:12', '2025-11-23 21:57:33'),
(28, 15, 10, 60.00, 'ml', '16oz', '2025-11-23 21:47:23', '2025-12-03 12:14:07'),
(29, 15, 2, 20.00, 'ml', '16oz', '2025-11-23 21:47:58', '2025-11-23 21:55:50'),
(30, 15, 5, 20.00, 'ml', '16oz', '2025-11-23 21:48:28', '2025-11-23 21:58:05'),
(31, 15, 11, 150.00, 'ml', '16oz', '2025-11-23 21:48:43', '2025-11-23 21:58:26'),
(32, 8, 2, 60.00, 'ml', '16oz', '2025-11-23 21:59:06', '2025-11-23 22:01:01'),
(33, 8, 10, 60.00, 'ml', '16oz', '2025-11-23 21:59:22', '2025-11-23 22:01:27'),
(34, 8, 5, 30.00, 'ml', '16oz', '2025-11-23 21:59:47', '2025-11-23 22:01:51'),
(35, 8, 12, 1.00, 'pcs', '16oz', '2025-11-23 22:03:09', '2025-11-23 22:03:42'),
(36, 8, 13, 1.00, 'pcs', '16oz', '2025-11-23 22:03:20', '2025-11-23 22:03:57'),
(37, 12, 13, 1.00, 'pcs', '16oz', '2025-11-23 22:05:41', '2025-11-23 22:06:48'),
(38, 12, 3, 150.00, 'ml', '16oz', '2025-11-23 22:06:01', '2025-12-03 12:41:46'),
(39, 14, 4, 20.00, 'ml', '16oz', '2025-11-23 22:08:26', '2025-11-23 22:10:00'),
(40, 14, 12, 1.00, 'pcs', '16oz', '2025-11-23 22:08:37', '2025-11-23 22:09:46'),
(41, 14, 13, 1.00, 'ml', '16oz', '2025-11-23 22:08:50', '2025-11-23 22:10:34'),
(42, 14, 3, 150.00, 'ml', '16oz', '2025-11-23 22:09:03', '2025-11-23 22:10:18'),
(43, 14, 5, 20.00, 'ml', '16oz', '2025-11-23 22:09:22', '2025-11-23 22:10:56'),
(44, 13, 6, 20.00, 'ml', '16oz', '2025-11-23 22:11:36', '2025-11-23 22:13:13'),
(45, 13, 5, 10.00, 'ml', '16oz', '2025-11-23 22:11:49', '2025-11-23 22:13:49'),
(46, 13, 11, 150.00, 'ml', '16oz', '2025-11-23 22:12:04', '2025-11-23 22:14:07'),
(47, 13, 12, 1.00, 'ml', '16oz', '2025-11-23 22:12:21', '2025-11-23 22:12:57'),
(48, 13, 13, 1.00, 'pcs', '16oz', '2025-11-23 22:12:35', '2025-11-23 22:13:26'),
(50, 12, 12, 1.00, 'pcs', '22oz', '2025-12-03 12:27:40', '2025-12-03 12:27:40'),
(51, 12, 1, 60.00, 'ml', '22oz', '2025-12-03 12:28:34', '2025-12-03 12:28:34'),
(52, 12, 13, 1.00, 'pcs', '22oz', '2025-12-03 12:28:48', '2025-12-03 12:28:48'),
(53, 12, 3, 200.00, 'ml', '22oz', '2025-12-03 12:29:26', '2025-12-03 12:29:26'),
(54, 13, 12, 1.00, 'pcs', '22oz', '2025-12-07 16:34:42', '2025-12-07 16:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_users`
--

CREATE TABLE `deleted_users` (
  `id` int NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(99) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `category_id`, `name`, `quantity`, `unit`, `created_at`, `updated_at`) VALUES
(1, 9, 'Espresso', 260.00, 'ml', '2025-05-28 15:45:15', '2025-12-07 17:14:28'),
(2, NULL, 'Flavor', 8560.00, 'ml', '2025-05-28 15:46:19', '2025-12-07 16:42:39'),
(3, NULL, 'Milk', 200.00, 'ml', '2025-05-28 15:46:34', '2025-12-07 17:14:28'),
(4, NULL, 'Jam', 9960.00, 'ml', '2025-05-28 15:50:56', '2025-12-07 16:46:52'),
(5, NULL, 'Sweetener', 9930.00, 'ml', '2025-05-28 15:51:23', '2025-12-07 16:46:52'),
(6, NULL, 'Nata', 10000.00, 'ml', '2025-05-28 15:51:52', '2025-12-07 15:28:00'),
(8, NULL, 'Soda', 10000.00, 'ml', '2025-05-28 15:54:42', '2025-12-07 15:28:08'),
(9, NULL, 'Pearl', 10000.00, 'ml', '2025-05-28 15:57:26', '2025-12-07 15:28:15'),
(10, NULL, 'Milk Essence', 9940.00, 'ml', '2025-05-28 15:57:40', '2025-12-07 15:30:05'),
(11, 14, 'Tea', 10000.00, 'ml', '2025-05-28 15:58:18', '2025-12-07 15:28:29'),
(12, 12, 'Cups', 1.00, 'pcs', '2025-11-23 13:12:16', '2025-12-07 17:14:51'),
(13, NULL, 'Straw', 9971.00, 'pcs', '2025-11-23 13:14:30', '2025-12-07 17:14:28'),
(15, NULL, 'Coffee powder', 8620.00, 'grams', '2025-11-23 21:36:01', '2025-12-07 16:42:39'),
(16, NULL, 'Yogurt', 10000.00, 'ml', '2025-11-23 21:41:03', '2025-12-07 15:29:43'),
(17, NULL, 'Almond Flavor', 9800.00, 'ml', '2025-12-03 13:13:45', '2025-12-07 17:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_categories`
--

CREATE TABLE `ingredient_categories` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `display_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ingredient_categories`
--

INSERT INTO `ingredient_categories` (`id`, `name`, `description`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'FRUIT TEA', NULL, 0, '2025-11-23 19:56:51', '2025-11-23 19:56:51'),
(2, 'FRUIT SODA', NULL, 1, '2025-11-23 19:56:51', '2025-11-23 19:56:51'),
(3, 'ICED COFFEE', NULL, 2, '2025-11-23 19:56:51', '2025-11-23 19:56:51'),
(4, 'MILK BASED', NULL, 3, '2025-11-23 19:56:51', '2025-11-23 19:56:51'),
(5, 'MILK TEA', NULL, 4, '2025-11-23 19:56:51', '2025-11-23 19:56:51'),
(6, 'ICE BLENDED', NULL, 5, '2025-11-23 19:56:51', '2025-11-23 19:56:51'),
(7, 'YOGURT SERIES', NULL, 6, '2025-11-23 19:56:51', '2025-11-23 19:56:51'),
(8, 'COFFEE BLENDED', NULL, 7, '2025-11-23 19:56:51', '2025-11-23 19:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_link`
--

CREATE TABLE `ingredient_link` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `display_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ingredient_link`
--

INSERT INTO `ingredient_link` (`id`, `name`, `description`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'FRUIT TEA', NULL, 0, '2025-11-23 20:05:50', '2025-11-23 20:05:50'),
(2, 'FRUIT SODA', NULL, 1, '2025-11-23 20:05:50', '2025-11-23 20:05:50'),
(3, 'ICED COFFEE', NULL, 2, '2025-11-23 20:05:50', '2025-11-23 20:05:50'),
(4, 'MILK BASED', NULL, 3, '2025-11-23 20:05:50', '2025-11-23 20:05:50'),
(5, 'MILK TEA', NULL, 4, '2025-11-23 20:05:50', '2025-11-23 20:05:50'),
(6, 'ICE BLENDED', NULL, 5, '2025-11-23 20:05:50', '2025-11-23 20:05:50'),
(7, 'YOGURT SERIES', NULL, 6, '2025-11-23 20:05:50', '2025-11-23 20:05:50'),
(8, 'COFFEE BLENDED', NULL, 7, '2025-11-23 20:05:50', '2025-11-23 20:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `order_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payment_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `paymongo_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `amount_tendered` float NOT NULL,
  `payment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'unpaid',
  `kitchen_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `order_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `order_type`, `payment_type`, `paymongo_reference`, `total_amount`, `amount_tendered`, `payment_status`, `kitchen_status`, `created_at`, `note`, `order_status`) VALUES
(14, 'ORD-68c19adb6f2ff', 'dine-in', 'cash', NULL, 315.00, 500, 'completed', 'pending', '2025-09-10 15:35:55', NULL, 'pending'),
(15, 'ORD-68c19d370411e', 'dine-in', 'cash', NULL, 23.00, 100, 'completed', 'pending', '2025-09-10 15:45:59', NULL, 'pending'),
(20, 'ORD-68dc09040ffbd', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-09-30 16:44:52', NULL, 'pending'),
(21, 'ORD-68dc0af156b3e', 'dine-in', 'cash', NULL, 158.00, 200, 'completed', 'pending', '2025-09-30 16:53:05', NULL, 'pending'),
(22, 'ORD-68dc0b1d8cd62', 'dine-in', 'cash', NULL, 158.00, 200, 'completed', 'pending', '2025-09-30 16:53:49', NULL, 'pending'),
(23, 'ORD-68dc0b712b33f', 'dine-in', 'cash', NULL, 316.00, 500, 'completed', 'pending', '2025-09-30 16:55:13', NULL, 'pending'),
(24, 'ORD-68dc0c9a94c92', 'dine-in', 'cash', NULL, 69.00, 100, 'completed', 'pending', '2025-09-30 17:00:10', NULL, 'pending'),
(25, 'ORD-68dcd8a4e1129', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-10-01 07:30:44', NULL, 'pending'),
(26, 'ORD-68dcd93b37526', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-10-01 07:33:15', NULL, 'pending'),
(27, 'ORD-68dcda8f74007', 'dine-in', 'cash', NULL, 79.00, 150, 'completed', 'pending', '2025-10-01 07:38:55', NULL, 'pending'),
(28, 'ORD-68dcdaf813fb1', 'dine-in', 'cash', NULL, 139.00, 200, 'completed', 'pending', '2025-10-01 07:40:40', NULL, 'pending'),
(29, 'ORD-68dcdb619ebd3', 'dine-in', 'cash', NULL, 97.00, 200, 'completed', 'pending', '2025-10-01 07:42:25', NULL, 'pending'),
(30, 'ORD-68dcdcbdd79c0', 'dine-in', 'cash', NULL, 79.00, 150, 'completed', 'pending', '2025-10-01 07:48:13', NULL, 'pending'),
(31, 'ORD-68dcddda1a20e', 'dine-in', 'cash', NULL, 15.00, 100, 'completed', 'pending', '2025-10-01 07:52:58', NULL, 'pending'),
(32, 'ORD-68dcde69841c1', 'dine-in', 'cash', NULL, 15.00, 100, 'completed', 'pending', '2025-10-01 07:55:21', NULL, 'pending'),
(33, 'ORD-68dce142ca192', 'dine-in', 'cash', NULL, 79.00, 200, 'completed', 'pending', '2025-10-01 08:07:30', NULL, 'pending'),
(34, 'ORD-68dce21ccf5b5', 'dine-in', 'cash', NULL, 15.00, 100, 'completed', 'pending', '2025-10-01 08:11:08', NULL, 'pending'),
(35, 'ORD-68dcff52ddf90', 'dine-in', 'cash', NULL, 20.00, 100, 'completed', 'pending', '2025-10-01 10:15:46', NULL, 'pending'),
(36, 'ORD-6914a0c503435', 'take-out', 'cash', NULL, 1260.00, 1500, 'completed', 'pending', '2025-11-12 14:59:17', NULL, 'pending'),
(37, 'ORD-6914a5250d4b6', 'take-out', 'cash', NULL, 15.00, 100, 'completed', 'pending', '2025-11-12 15:17:57', NULL, 'pending'),
(38, 'ORD-6914a6023d01d', 'dine-in', 'pending', NULL, 20.00, 0, 'unpaid', 'pending', '2025-11-12 15:21:38', NULL, 'pending'),
(39, 'ORD-6915466cad8c0', 'dine-in', 'cash', NULL, 20.00, 100, 'completed', 'pending', '2025-11-13 02:46:04', NULL, 'pending'),
(40, 'ORD-69157106df20e', 'dine-in', 'cash', NULL, 20.00, 100, 'completed', 'pending', '2025-11-13 05:47:50', NULL, 'pending'),
(41, 'ORD-691577a337e78', 'dine-in', 'pending', NULL, 100.00, 0, 'unpaid', 'pending', '2025-11-13 06:16:03', NULL, 'pending'),
(42, 'ORD-691577aa63304', 'dine-in', 'pending', NULL, 140.00, 0, 'unpaid', 'pending', '2025-11-13 06:16:10', NULL, 'pending'),
(43, 'ORD-691577b0d67c8', 'dine-in', 'pending', NULL, 120.00, 0, 'unpaid', 'pending', '2025-11-13 06:16:16', NULL, 'pending'),
(44, 'ORD-69157b8725ef3', 'dine-in', 'cash', NULL, 20.00, 200, 'completed', 'pending', '2025-11-13 06:32:39', NULL, 'pending'),
(45, 'ORD-69158217a6479', 'take-out', 'cash', NULL, 834.00, 1000, 'completed', 'pending', '2025-11-13 07:00:39', NULL, 'pending'),
(46, 'ORD-6915854442b9f', 'take-out', 'cash', NULL, 15.00, 100, 'completed', 'pending', '2025-11-13 07:14:12', NULL, 'pending'),
(47, 'ORD-6915904e3a47f', 'dine-in', 'cash', NULL, 238.00, 1000, 'completed', 'pending', '2025-11-13 08:01:18', NULL, 'pending'),
(48, 'ORD-6915922ea9533', 'dine-in', 'cash', NULL, 20.00, 100, 'completed', 'pending', '2025-11-13 08:09:18', NULL, 'pending'),
(49, 'ORD-6915951714f6a', 'dine-in', 'cash', NULL, 20.00, 100, 'completed', 'pending', '2025-11-13 08:21:43', NULL, 'pending'),
(50, 'ORD-691684acc7ef2', 'dine-in', 'cash', NULL, 308.00, 500, 'completed', 'pending', '2025-11-14 01:23:56', NULL, 'pending'),
(51, 'ORD-69168520d90af', 'take-out', 'cash', NULL, 546.00, 1000, 'completed', 'pending', '2025-11-14 01:25:52', NULL, 'pending'),
(52, 'ORD-691685c86c79e', 'dine-in', 'cash', NULL, 437.00, 500, 'completed', 'pending', '2025-11-14 01:28:40', NULL, 'pending'),
(53, 'ORD-691689ea8265c', 'take-out', 'cash', NULL, 437.00, 500, 'completed', 'pending', '2025-11-14 01:46:18', 'dhfxjdhjdhj', 'pending'),
(54, 'ORD-69195a4b478a2', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-16 04:59:55', '', 'pending'),
(55, 'ORD-69195af9c201c', 'dine-in', 'pending', NULL, 79.00, 79, 'completed', 'pending', '2025-11-16 05:02:49', 'pogi ako', 'pending'),
(56, 'ORD-69195c0e91c03', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-16 05:07:26', '', 'pending'),
(57, 'ORD-69195c268ecf2', 'take-out', 'pending', NULL, 158.00, 158, 'completed', 'pending', '2025-11-16 05:07:50', '', 'pending'),
(58, 'ORD-69195c7241ae1', 'take-out', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-16 05:09:06', '', 'pending'),
(59, 'ORD-69197cebd9e8c', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-16 07:27:39', '', 'pending'),
(60, 'ORD-69197e8639e35', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-16 07:34:30', '', 'pending'),
(61, 'ORD-691986120f99d', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-16 08:06:42', '', 'pending'),
(62, 'ORD-691988f203c3f', 'dine-in', 'pending', NULL, 79.00, 79, 'completed', 'pending', '2025-11-16 08:18:58', '', 'pending'),
(63, 'ORD-69198c240504f', 'dine-in', 'cash', NULL, 287.00, 500, 'completed', 'pending', '2025-11-16 08:32:36', 'for mam lou', 'pending'),
(64, 'ORD-1763367626339', 'dine-in', 'paymongo', 'src_ptSzvMRyDPmeAHAi635FTVT2', 69.00, 69, 'completed', 'pending', '2025-11-17 08:20:26', '', 'pending'),
(65, 'ORD-1763367786675', 'dine-in', 'paymongo', 'src_e1pUCtW1a1sWWNcBJTcjWzj9', 69.00, 69, 'completed', 'pending', '2025-11-17 08:23:07', '', 'pending'),
(66, 'ORD-1763368097381', 'dine-in', 'paymongo', 'src_sUPMFh3wPwRWmM8xPqLeoR1i', 79.00, 79, 'completed', 'pending', '2025-11-17 08:28:18', '', 'pending'),
(67, 'ORD-1763368376984', 'dine-in', 'paymongo', 'src_aVzfpBUmvGVk5dMJAEUWPfUB', 148.00, 148, 'completed', 'pending', '2025-11-17 08:32:58', '', 'pending'),
(68, 'ORD-1763368408378', 'dine-in', 'paymongo', 'src_bvfnBDxPCejmJ4BsDZrrMAXr', 118.00, 118, 'completed', 'pending', '2025-11-17 08:33:29', '', 'pending'),
(69, 'ORD-691aede1c9679', 'dine-in', 'cash', NULL, 237.00, 250, 'completed', 'pending', '2025-11-17 09:41:53', '', 'pending'),
(70, 'ORD-691aeeb8118b8', 'dine-in', 'cash', NULL, 237.00, 250, 'completed', 'pending', '2025-11-17 09:45:28', '', 'pending'),
(71, 'ORD-691aef4d99de0', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-17 09:47:57', '', 'pending'),
(72, 'ORD-691af21ef1e2d', 'dine-in', 'cash', NULL, 158.00, 200, 'completed', 'pending', '2025-11-17 09:59:58', '', 'pending'),
(73, 'ORD-691af34dada7c', 'dine-in', 'cash', NULL, 464.00, 500, 'completed', 'pending', '2025-11-17 10:05:01', '', 'pending'),
(74, 'ORD-1763373919921', 'dine-in', 'paymongo', 'src_Gd626B3UvmZ3gnGdkcYKJevr', 79.00, 79, 'completed', 'pending', '2025-11-17 10:05:21', '', 'pending'),
(75, 'ORD-1763386293711', 'dine-in', 'paymongo', 'src_GJop5MSSyfBWt37KpRC4DH6H', 79.00, 79, 'completed', 'pending', '2025-11-17 13:31:35', '', 'pending'),
(76, 'ORD-691b23f2255fe', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-17 13:32:34', '', 'pending'),
(77, 'ORD-691b2584d03fe', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-17 13:39:16', '', 'pending'),
(78, 'ORD-691b25c51fdfa', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-17 13:40:21', '', 'pending'),
(79, 'ORD-1763387598040', 'dine-in', 'paymongo', 'src_tz6o8kFmZKuFn7DVuDRLDVvk', 217.00, 217, 'completed', 'pending', '2025-11-17 13:53:19', '', 'pending'),
(80, 'ORD-691d3cfb9faea', 'take-out', 'cash', NULL, 0.00, 100, 'completed', 'pending', '2025-11-19 03:43:55', '', 'pending'),
(83, 'ORD-691d3f3444188', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-19 03:53:24', 'mark', 'pending'),
(84, 'ORD-691d4074da94c', 'dine-in', 'cash', NULL, 79.00, 100, 'completed', 'pending', '2025-11-19 03:58:44', '', 'pending'),
(85, 'ORD-691d425dd7982', 'dine-in', 'cash', NULL, 69.00, 100, 'completed', 'pending', '2025-11-19 04:06:53', '', 'pending'),
(86, 'ORD-691d58f4ba7de', 'dine-in', 'pending', NULL, 69.00, 69, 'unpaid', 'pending', '2025-11-19 05:43:16', '', 'completed'),
(87, 'ORD-691d643ab609d', 'dine-in', 'pending', NULL, 69.00, 69, 'unpaid', 'pending', '2025-11-19 06:31:22', '', 'pending'),
(88, 'ORD-691d66d409193', 'dine-in', 'pending', NULL, 69.00, 69, 'unpaid', 'pending', '2025-11-19 06:42:28', '', 'pending'),
(89, 'ORD-1763534709259', 'dine-in', 'paymongo', 'src_JTsEfqq5Uh7LH2JrkBwD1WM7', 79.00, 79, 'unpaid', 'pending', '2025-11-19 06:45:22', '', 'pending'),
(90, 'ORD-1763534816675', 'dine-in', 'paymongo', 'src_RKVysLxTScXWzArLn3u559bA', 79.00, 79, 'unpaid', 'pending', '2025-11-19 06:47:02', '', 'pending'),
(91, 'ORD-1763535056192', 'dine-in', 'paymongo', 'src_q41SuwWhoYt8bYtdhKQpdrV5', 69.00, 69, 'unpaid', 'pending', '2025-11-19 06:51:04', '', 'pending'),
(92, 'ORD-1763535135156', 'dine-in', 'paymongo', 'src_AdkNgECEqgbifWh4a6KCtBfL', 148.00, 148, 'unpaid', 'pending', '2025-11-19 06:52:19', '', 'pending'),
(93, 'ORD-691e271e03383', 'take-out', 'cash', NULL, 79.00, 100, 'paid', 'pending', '2025-11-19 20:22:54', '', 'pending'),
(94, 'ORD-691e273a70b60', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-19 20:23:22', '', 'pending'),
(95, 'ORD-1763589661454', 'dine-in', 'paymongo', 'src_SJWPth7axoVhKjMZu7dNS86m', 69.00, 69, 'unpaid', 'pending', '2025-11-19 22:01:03', '', 'pending'),
(96, 'ORD-691ec25004a00', 'dine-in', 'cash', NULL, 148.00, 150, 'paid', 'pending', '2025-11-20 07:25:04', '', 'pending'),
(97, 'ORD-691ee31ac8907', 'dine-in', 'cash', NULL, 69.00, 100, 'completed', 'pending', '2025-11-20 09:44:58', 'less sugar', 'pending'),
(98, 'ORD-6921bb1ac5788', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 13:31:06', '', 'pending'),
(99, 'ORD-6921bc87eefe8', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 13:37:11', '', 'pending'),
(100, 'ORD-6921bcc922787', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 13:38:17', '', 'pending'),
(101, 'ORD-6921be39a94a0', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 13:44:25', '', 'pending'),
(102, 'ORD-6921be50a29cc', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 13:44:48', '', 'pending'),
(103, 'ORD-6921be7e8506d', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 13:45:34', '', 'pending'),
(104, 'ORD-6921bea267d1e', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 13:46:10', '', 'pending'),
(105, 'ORD-6921c274d3feb', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-22 14:02:28', '', 'pending'),
(106, 'ORD-6921d04332cfe', 'dine-in', 'cash', NULL, 276.00, 500, 'paid', 'pending', '2025-11-22 15:01:23', '', 'pending'),
(107, 'ORD-6921d069c7e60', 'dine-in', 'cash', NULL, 207.00, 250, 'paid', 'pending', '2025-11-22 15:02:01', '', 'pending'),
(108, 'ORD-6921d36f8c4f1', 'dine-in', 'pending', NULL, 69.00, 69, 'completed', 'pending', '2025-11-22 15:14:55', '', 'pending'),
(109, 'ORD-6921d5e73bd74', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'done', '2025-11-22 15:25:27', '', 'pending'),
(110, 'ORD-6921d6143d411', 'dine-in', 'cash', NULL, 79.00, 100, 'paid', 'done', '2025-11-22 15:26:12', '', 'pending'),
(111, 'ORD-6921e300b6298', 'dine-in', 'pending', NULL, 69.00, 69, 'paid', 'completed', '2025-11-22 16:21:20', '', 'pending'),
(112, 'ORD-6921e33e5ca7f', 'dine-in', 'cash', NULL, 69.00, 69, 'paid', 'done', '2025-11-22 16:22:22', '', 'completed'),
(113, 'ORD-6921e345aafa3', 'dine-in', 'cash', NULL, 20.00, 20, 'paid', 'done', '2025-11-22 16:22:29', '', 'completed'),
(114, 'ORD-6921e7b02fc15', 'dine-in', 'pending', NULL, 138.00, 138, 'completed', 'pending', '2025-11-22 16:41:20', '', 'pending'),
(115, 'ORD-6921e8b8ba8cb', 'dine-in', 'pending', NULL, 79.00, 79, 'completed', 'pending', '2025-11-22 16:45:44', '', 'pending'),
(116, 'ORD-6921e8ed54e9c', 'take-out', 'pending', NULL, 79.00, 79, 'completed', 'pending', '2025-11-22 16:46:37', '', 'pending'),
(117, 'ORD-6921eafe3eef5', 'dine-in', 'pending', NULL, 69.00, 69, 'completed', 'pending', '2025-11-22 16:55:26', '', 'pending'),
(118, 'ORD-6922d21fe6e21', 'dine-in', 'cash', NULL, 79.00, 100, 'paid', 'pending', '2025-11-23 09:21:35', '', 'completed'),
(119, 'ORD-6922d6f593e03', 'dine-in', 'cash', NULL, 79.00, 79, 'paid', 'pending', '2025-11-23 09:42:13', '', 'completed'),
(120, 'ORD-6922d73567ded', 'dine-in', 'other', NULL, 79.00, 79, 'paid', 'pending', '2025-11-23 09:43:17', '', 'completed'),
(121, 'ORD-1763891036567', 'dine-in', 'other', 'src_Nsg941vG29N5vMY3V9ydtW1M', 69.00, 69, 'paid', 'pending', '2025-11-23 09:43:56', '', 'completed'),
(122, 'ORD-1763891241548', 'dine-in', 'paymongo', 'src_wxsCNcuyvyAEoa3Xww1RPz8u', 69.00, 69, 'unpaid', 'pending', '2025-11-23 09:47:22', '', 'pending'),
(123, 'ORD-1763891532874', 'dine-in', 'paymongo', 'src_J6aZTHKsj5coVD5nMY8Y1AbY', 69.00, 69, 'unpaid', 'pending', '2025-11-23 09:52:13', '', 'pending'),
(124, 'ORD-6922d9d9249ba', 'dine-in', 'cash', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 09:54:33', '', 'completed'),
(125, 'ORD-6922da04baeac', 'dine-in', 'other', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 09:55:16', '', 'completed'),
(126, 'ORD-6922da334c781', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 09:56:03', '', 'completed'),
(127, 'ORD-1763892258685', 'dine-in', 'other', 'src_DYkP3Y8Nmfww1FXyzmb1xR2a', 69.00, 69, 'paid', 'pending', '2025-11-23 10:04:19', '', 'completed'),
(128, 'ORD-6922dc7509d05', 'dine-in', 'cash', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 10:05:41', '', 'completed'),
(129, 'ORD-1763892796109', 'dine-in', 'paymongo', 'src_D4XfFp3DntfaDyo1R868MRLB', 60.00, 60, 'paid', 'pending', '2025-11-23 10:13:17', '', 'completed'),
(130, 'ORD-6922de942d067', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 10:14:44', '', 'completed'),
(131, 'ORD-6922debf53594', 'dine-in', 'other', NULL, 79.00, 79, 'paid', 'pending', '2025-11-23 10:15:27', '', 'completed'),
(132, 'ORD-1763893309512', 'dine-in', 'paymongo', 'src_apVgJMJrwVjDozBJXZewo9PS', 69.00, 69, 'paid', 'pending', '2025-11-23 10:21:49', '', 'pending'),
(133, 'ORD-6922e1467b842', 'dine-in', 'gcash', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 10:26:14', '', 'completed'),
(134, 'ORD-6922e1e7f17a6', 'dine-in', 'gcash', NULL, 79.00, 79, 'paid', 'pending', '2025-11-23 10:28:55', '', 'completed'),
(135, 'ORD-6922e4a5dd0f2', 'dine-in', 'gcash', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 10:40:37', '', 'completed'),
(136, 'ORD-6922e60a490f0', 'dine-in', 'gcash', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 10:46:34', '', 'completed'),
(137, 'ORD-1763894892385', 'dine-in', 'paymongo', 'src_ausERvqDfkLeSTPXvoSq5g5A', 69.00, 69, 'paid', 'pending', '2025-11-23 10:48:13', '', 'pending'),
(138, 'ORD-1763894909180', 'dine-in', 'paymongo', 'src_pTqBYVi69f6pExwwmEdtbeCf', 69.00, 69, 'paid', 'pending', '2025-11-23 10:48:29', '', 'pending'),
(139, 'ORD-1763894933026', 'dine-in', 'paymongo', 'src_32sK2r8v2vrYJYUTKszvEvGe', 138.00, 138, 'paid', 'pending', '2025-11-23 10:48:53', '', 'pending'),
(140, 'ORD-1763894951117', 'dine-in', 'paymongo', 'src_AS5kw5Z4bhCrjDUw3uotFewx', 138.00, 138, 'paid', 'pending', '2025-11-23 10:49:11', '', 'pending'),
(141, 'ORD-1763894983932', 'dine-in', 'paymongo', 'src_r5RLmbfkYZ2BbWMiuUimWYSd', 69.00, 69, 'paid', 'pending', '2025-11-23 10:49:44', '', 'pending'),
(142, 'ORD-6922e6e91a6ae', 'dine-in', 'gcash', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 10:50:17', '', 'completed'),
(143, 'ORD-6922e82062828', 'dine-in', 'gcash', NULL, 59.00, 59, 'paid', 'pending', '2025-11-23 10:55:28', '', 'completed'),
(144, 'ORD-6922e8c879897', 'dine-in', 'gcash', NULL, 79.00, 79, 'paid', 'pending', '2025-11-23 10:58:16', '', 'completed'),
(145, 'ORD-6922e97aa157d', 'take-out', 'gcash', 'src_SRae4CdYtynu2rGWHQiLMMyt', 59.00, 59, 'paid', 'pending', '2025-11-23 11:01:14', '', 'completed'),
(146, 'ORD-6922ea29b9c0f', 'dine-in', 'gcash', 'src_tBof7s9PciEW3TJ53SDuUrq9', 79.00, 79, 'paid', 'pending', '2025-11-23 11:04:09', '', 'completed'),
(147, 'ORD-6922eebb04bbe', 'dine-in', 'gcash', 'src_LXbUcDTJxvHgz3heBDZ6CTop', 69.00, 69, 'paid', 'pending', '2025-11-23 11:23:39', '', 'completed'),
(148, 'ORD-6922ef792c31f', 'dine-in', 'gcash', 'src_XSz72oyzAuXQhaU7ZoJqTdgg', 79.00, 79, 'paid', 'pending', '2025-11-23 11:26:49', '', 'completed'),
(149, 'ORD-6922efb286e5e', 'take-out', 'cash', NULL, 79.00, 79, 'paid', 'pending', '2025-11-23 11:27:46', '', 'completed'),
(150, 'ORD-6922f03093b53', 'dine-in', 'gcash', 'src_nDJdJCgUWD5mnGbhm6wV9mbh', 79.00, 79, 'paid', 'pending', '2025-11-23 11:29:52', '', 'completed'),
(151, 'ORD-6922f088352b6', 'take-out', 'gcash', 'src_hNHbPTTCLdsHGnhRQT1vfxff', 79.00, 79, 'paid', 'pending', '2025-11-23 11:31:20', '', 'completed'),
(152, 'ORD-6922f0b83929d', 'dine-in', 'gcash', 'src_z1baJ3kd7eSMKxkrXKhYUSGe', 69.00, 69, 'paid', 'pending', '2025-11-23 11:32:08', '', 'completed'),
(153, 'ORD-6922f1078aa77', 'take-out', 'gcash', 'src_sChTHPgF55YinTe1pwMxow57', 79.00, 79, 'paid', 'pending', '2025-11-23 11:33:27', '', 'completed'),
(154, 'ORD-6922f1b7f017a', 'take-out', 'gcash', 'src_AY6LmdywfrTYH13hvTk5tAdJ', 79.00, 79, 'paid', 'pending', '2025-11-23 11:36:23', '', 'completed'),
(155, 'ORD-6922f2cb69ad2', 'take-out', 'cash', NULL, 69.00, 69, 'paid', 'pending', '2025-11-23 11:40:59', '', 'completed'),
(156, 'ORD-6922fe512ef8f', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 12:30:09', '', 'pending'),
(157, 'ORD-6922ff1798ff9', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 12:33:27', '', 'pending'),
(158, '20251123-1240-933', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 12:40:49', '', 'pending'),
(159, '20251123-1242-934', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 12:42:32', '', 'pending'),
(160, '20251123-1246-935', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 12:46:20', '', 'pending'),
(161, '20251123-1250-936', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 04:50:23', '', 'pending'),
(162, '20251123-2055-937', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 12:55:56', '', 'pending'),
(163, '20251123-2102-938', 'dine-in', 'cash', NULL, 79.00, 100, 'paid', 'pending', '2025-11-23 13:02:41', '', 'pending'),
(164, '20251123-2117-939', 'dine-in', 'cash', NULL, 621.00, 1000, 'paid', 'pending', '2025-11-23 13:17:13', '', 'pending'),
(165, '20251123-2224-940', 'dine-in', 'cash', NULL, 109.00, 150, 'paid', 'pending', '2025-11-23 14:24:00', '', 'pending'),
(166, '20251124-0240-001', 'dine-in', 'gcash', 'src_ymmihBtFVdbxSqEghJK2Tg9q', 89.00, 89, 'paid', 'pending', '2025-11-23 18:40:41', '', 'completed'),
(167, '20251124-0242-002', 'take-out', 'gcash', 'src_UaohNMcfYrRUc5RFMAJDoj8U', 69.00, 69, 'paid', 'pending', '2025-11-23 18:42:29', '', 'completed'),
(168, '20251124-0441-003', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 20:41:35', '', 'pending'),
(169, '20251124-0442-004', 'dine-in', 'cash', NULL, 89.00, 100, 'paid', 'pending', '2025-11-23 20:42:40', '', 'pending'),
(170, '20251124-0448-005', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 20:48:20', '', 'pending'),
(171, '20251124-0505-006', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 21:05:32', '', 'pending'),
(172, '20251124-0509-007', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 21:09:21', '', 'pending'),
(173, '20251124-0511-008', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 21:11:22', '', 'pending'),
(174, '20251124-0530-009', 'dine-in', 'cash', NULL, 89.00, 100, 'paid', 'pending', '2025-11-23 21:30:34', '', 'pending'),
(175, '20251124-0531-010', 'dine-in', 'cash', NULL, 89.00, 100, 'paid', 'pending', '2025-11-23 21:31:38', '', 'pending'),
(176, '20251124-0617-011', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-11-23 22:17:42', '', 'completed'),
(177, '20251124-1221-012', 'dine-in', 'gcash', 'src_hhXATdTo6N6gWwQtAnjbVpZq', 89.00, 89, 'paid', 'pending', '2025-11-24 04:21:42', '', 'completed'),
(178, '20251124-1230-013', 'dine-in', 'gcash', 'src_5rVfsF2HY6GvSQsZqSjFT28L', 139.00, 139, 'paid', 'pending', '2025-11-24 04:30:25', '', 'completed'),
(179, '20251124-1456-014', 'dine-in', 'cash', NULL, 248.00, 250, 'paid', 'pending', '2025-11-24 06:56:53', '', 'pending'),
(180, '20251203-2056-001', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-12-03 12:56:23', '', 'completed'),
(181, '20251203-2058-002', 'dine-in', 'cash', NULL, 89.00, 100, 'paid', 'pending', '2025-12-03 12:58:04', '', 'pending'),
(182, '20251203-2115-003', 'dine-in', 'paymongo', 'src_H3Gg4CcyRpMKyTQn2YdnM2Rs', 69.00, 69, 'paid', 'pending', '2025-12-03 13:15:01', '', 'pending'),
(183, '20251203-2117-004', 'dine-in', 'cash', NULL, 89.00, 100, 'paid', 'pending', '2025-12-03 13:17:26', '', 'pending'),
(184, '20251203-2119-005', 'dine-in', 'cash', NULL, 89.00, 100, 'paid', 'pending', '2025-12-03 13:19:10', '', 'completed'),
(185, '20251203-2120-006', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-12-03 13:20:03', '', 'completed'),
(186, '20251203-2126-007', 'dine-in', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-12-03 13:26:42', '', 'completed'),
(187, '20251207-2330-001', 'dine-in', 'cash', NULL, 109.00, 150, 'paid', 'pending', '2025-12-07 15:30:24', '', 'pending'),
(188, '20251208-0045-001', 'take-out', 'cash', NULL, 69.00, 100, 'paid', 'pending', '2025-12-07 16:45:23', '', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qty` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `options` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `amount`, `note`, `options`) VALUES
(26, 14, '3', 1, 97.00, 97.00, '', '22oz'),
(27, 14, '1', 1, 79.00, 79.00, 'less ice', '22oz'),
(28, 14, '40', 1, 139.00, 139.00, NULL, 'none'),
(29, 15, '43', 1, 23.00, 23.00, '', 'hot'),
(34, 20, '6', 1, 79.00, 79.00, '', '22oz'),
(35, 21, '6', 2, 79.00, 158.00, '', '22oz'),
(36, 22, '6', 2, 79.00, 158.00, '', '22oz'),
(37, 23, '6', 4, 79.00, 316.00, '', '22oz'),
(38, 24, '6', 1, 69.00, 69.00, '', '16oz'),
(39, 28, '40', 1, 139.00, 139.00, NULL, 'none'),
(40, 33, '6_22oz_', 1, 79.00, 79.00, '', '22oz'),
(41, 34, '7_16oz_less ice', 1, 15.00, 15.00, 'less ice', '16oz'),
(42, 35, '7_22oz_', 1, 20.00, 20.00, '', '22oz'),
(43, 36, '38', 63, 20.00, 1260.00, NULL, 'none'),
(44, 37, '7_16oz_', 1, 15.00, 15.00, '', '16oz'),
(45, 38, '38', 1, 20.00, 20.00, NULL, 'none'),
(46, 39, '38', 1, 20.00, 20.00, NULL, 'none'),
(47, 40, '7_22oz_', 1, 20.00, 20.00, NULL, 'drinks'),
(48, 41, '38', 5, 20.00, 100.00, NULL, 'none'),
(49, 42, '38', 7, 20.00, 140.00, NULL, 'none'),
(50, 43, '38', 6, 20.00, 120.00, NULL, 'none'),
(51, 44, '38', 1, 20.00, 20.00, NULL, 'none'),
(52, 45, '40', 6, 139.00, 834.00, NULL, 'none'),
(53, 46, '7_16oz_', 1, 15.00, 15.00, '', '16oz'),
(54, 47, '6_22oz_', 1, 79.00, 79.00, NULL, 'drinks'),
(55, 47, '41', 1, 129.00, 129.00, NULL, 'none'),
(56, 47, '39', 1, 10.00, 10.00, NULL, 'none'),
(57, 48, '37', 1, 20.00, 20.00, NULL, 'none'),
(58, 49, '7_22oz_for maam lou', 1, 20.00, 20.00, 'for maam lou', '22oz'),
(59, 50, '41', 1, 129.00, 129.00, NULL, 'none'),
(60, 50, '40', 1, 139.00, 139.00, NULL, 'none'),
(61, 50, '38', 1, 20.00, 20.00, NULL, 'none'),
(62, 50, '37', 1, 20.00, 20.00, NULL, 'none'),
(63, 51, '42', 1, 119.00, 119.00, NULL, 'none'),
(64, 51, '41', 2, 129.00, 258.00, NULL, 'none'),
(65, 51, '39', 1, 10.00, 10.00, NULL, 'none'),
(66, 51, '38', 1, 20.00, 20.00, NULL, 'none'),
(67, 51, '40', 1, 139.00, 139.00, NULL, 'none'),
(68, 52, '42', 1, 119.00, 119.00, NULL, 'none'),
(69, 52, '41', 1, 129.00, 129.00, NULL, 'none'),
(70, 52, '40', 1, 139.00, 139.00, NULL, 'none'),
(71, 52, '39', 1, 10.00, 10.00, NULL, 'none'),
(72, 52, '38', 1, 20.00, 20.00, NULL, 'none'),
(73, 52, '37', 1, 20.00, 20.00, NULL, 'none'),
(74, 53, '40', 1, 139.00, 139.00, NULL, 'none'),
(75, 53, '41', 1, 129.00, 129.00, NULL, 'none'),
(76, 53, '42', 1, 119.00, 119.00, NULL, 'none'),
(77, 53, '39', 1, 10.00, 10.00, NULL, 'none'),
(78, 53, '38', 1, 20.00, 20.00, NULL, 'none'),
(79, 53, '37', 1, 20.00, 20.00, NULL, 'none'),
(80, 54, '32_22oz_', 1, 79.00, 79.00, NULL, 'drinks'),
(81, 55, '32_22oz_', 1, 79.00, 79.00, '', '22oz'),
(82, 56, '32_22oz_', 1, 79.00, 79.00, '', '22oz'),
(83, 57, '22_22oz_', 1, 79.00, 79.00, '', '22oz'),
(84, 57, '10_22oz_', 1, 79.00, 79.00, '', '22oz'),
(85, 58, '6_22oz_', 1, 79.00, 79.00, NULL, 'drinks'),
(86, 59, '32_22oz_', 1, 79.00, 79.00, '', '22oz'),
(87, 60, '7_22oz_', 1, 79.00, 79.00, '', '22oz'),
(88, 61, '28_22oz_', 1, 79.00, 79.00, '', '22oz'),
(89, 62, '26_22oz_', 1, 79.00, 79.00, '', '22oz'),
(90, 63, '6_22oz_', 1, 79.00, 79.00, '', '22oz'),
(91, 63, '32_22oz_', 1, 79.00, 79.00, '', '22oz'),
(92, 63, '41', 1, 129.00, 129.00, NULL, 'none'),
(93, 64, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(94, 65, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(95, 66, '26_22oz_', 1, 79.00, 79.00, '', '22oz'),
(96, 67, '14_16oz_', 1, 69.00, 69.00, '', '16oz'),
(97, 67, '10_22oz_', 1, 79.00, 79.00, '', '22oz'),
(98, 68, '26_hot_', 1, 59.00, 59.00, '', 'hot'),
(99, 68, '22_hot_', 1, 59.00, 59.00, '', 'hot'),
(100, 69, '7_22oz_', 3, 79.00, 237.00, '', '22oz'),
(101, 70, '7_22oz_', 3, 79.00, 237.00, '', '22oz'),
(102, 71, '32_22oz_', 1, 79.00, 79.00, '', '22oz'),
(103, 72, '7_22oz_', 2, 79.00, 158.00, '', '22oz'),
(104, 73, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(105, 73, '16_22oz_', 1, 79.00, 79.00, '', '22oz'),
(106, 73, '18_22oz_', 1, 79.00, 79.00, '', '22oz'),
(107, 73, '30_22oz_', 1, 79.00, 79.00, '', '22oz'),
(108, 73, '24_22oz_', 1, 79.00, 79.00, '', '22oz'),
(109, 73, '10_22oz_', 1, 79.00, 79.00, '', '22oz'),
(110, 74, '22_22oz_', 1, 79.00, 79.00, '', '22oz'),
(111, 75, '7_22oz_', 1, 79.00, 79.00, '', '22oz'),
(112, 76, '7_22oz_', 1, 79.00, 79.00, '', '22oz'),
(113, 77, '7_22oz_', 1, 79.00, 79.00, '', '22oz'),
(114, 78, '3_22oz_', 1, 79.00, 79.00, '', '22oz'),
(115, 79, '16_22oz_', 1, 79.00, 79.00, '', '22oz'),
(116, 79, '22_16oz_', 1, 69.00, 69.00, '', '16oz'),
(117, 79, '14_16oz_', 1, 69.00, 69.00, '', '16oz'),
(118, 83, '18_22oz_', 1, 79.00, 79.00, '', '22oz'),
(119, 84, '28_22oz_', 1, 79.00, 79.00, '', '22oz'),
(120, 85, '14_16oz_', 1, 69.00, 69.00, '', '16oz'),
(121, 86, '22_16oz_', 1, 69.00, 69.00, '', '16oz'),
(122, 87, '24_16oz_', 1, 69.00, 69.00, '', '16oz'),
(123, 88, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(124, 89, '24_22oz_', 1, 79.00, 79.00, '', '22oz'),
(125, 90, '24_22oz_', 1, 79.00, 79.00, '', '22oz'),
(126, 91, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(127, 92, '6_16oz_', 1, 69.00, 69.00, '', '16oz'),
(128, 92, '6_22oz_', 1, 79.00, 79.00, '', '22oz'),
(129, 93, '32_22oz_', 1, 79.00, 79.00, '', '22oz'),
(130, 94, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(131, 95, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(132, 96, '10_16oz_', 1, 69.00, 69.00, '', '16oz'),
(133, 96, '18_22oz_', 1, 79.00, 79.00, '', '22oz'),
(134, 97, '32_16oz_', 1, 69.00, 69.00, '', '16oz'),
(135, 98, '32_16oz__no-sugar', 1, 69.00, 69.00, 'No Sugar', '16oz'),
(136, 99, '32_16oz__no-sugar', 1, 69.00, 69.00, 'No Sugar', '16oz'),
(137, 100, '32_16oz__no-sugar', 1, 69.00, 69.00, 'No Sugar', '16oz'),
(138, 101, '32_16oz__no-sugar', 1, 69.00, 69.00, 'No Sugar', '16oz'),
(139, 102, '32_16oz__less-sugar', 1, 69.00, 69.00, 'Less Sugar', '16oz'),
(140, 103, '32_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(141, 104, '32_16oz__more-sugar', 1, 69.00, 69.00, 'More Sugar', '16oz'),
(142, 105, '32_16oz__more-sugar', 1, 69.00, 69.00, 'More Sugar', '16oz'),
(143, 106, '32_16oz__normal-sugar', 3, 69.00, 207.00, 'Normal Sugar', '16oz'),
(144, 106, '7_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(145, 107, '32_16oz__normal-sugar', 2, 69.00, 138.00, 'Normal Sugar', '16oz'),
(146, 107, '32_16oz__more-sugar', 1, 69.00, 69.00, 'More Sugar', '16oz'),
(147, 108, '32_16oz__no-sugar', 1, 69.00, 69.00, 'No Sugar', '16oz'),
(148, 109, '14_16oz__normal-sugar', 1, 69.00, 69.00, NULL, 'drinks'),
(149, 110, '16_22oz__normal-sugar', 1, 79.00, 79.00, NULL, 'drinks'),
(150, 111, '32_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(151, 112, '14_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(152, 113, '37', 1, 20.00, 20.00, NULL, 'none'),
(153, 114, '19_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(154, 114, '32_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(155, 115, '26_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(156, 116, '26_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(157, 117, '32_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(158, 118, '32_22oz__normal-sugar', 1, 79.00, 79.00, NULL, 'drinks'),
(159, 119, '30_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(160, 120, '22_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(161, 121, '14_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(162, 122, '32_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(163, 123, '28_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(164, 124, '24_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(165, 125, '10_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(166, 126, '28_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(167, 127, '28_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(168, 128, '22_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(169, 129, '26_16oz__normal-sugar', 1, 60.00, 60.00, 'Normal Sugar', '16oz'),
(170, 130, '30_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(171, 131, '28_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(172, 132, '28_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(173, 133, '28_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(174, 134, '28_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(175, 135, '30_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(176, 136, '22_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(177, 137, '14_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(178, 138, '14_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(179, 139, '14_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(180, 139, '7_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(181, 140, '14_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(182, 140, '7_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(183, 141, '10_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(184, 142, '14_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(185, 143, '22_hot__normal-sugar', 1, 59.00, 59.00, 'Normal Sugar', 'hot'),
(186, 144, '22_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(187, 145, '18_hot__normal-sugar', 1, 59.00, 59.00, 'Normal Sugar', 'hot'),
(188, 146, '22_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(189, 147, '22_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(190, 148, '22_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(191, 149, '3_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(192, 150, '22_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(193, 151, '32_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(194, 152, '32_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(195, 153, '22_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(196, 154, '16_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(197, 155, '12_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(198, 156, '30_16oz__normal-sugar', 1, 69.00, 69.00, NULL, 'drinks'),
(199, 157, '28_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(200, 158, '30_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(201, 159, '30_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(202, 160, '30_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(203, 161, '10_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(204, 162, '30_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(205, 163, '28_22oz__normal-sugar', 1, 79.00, 79.00, 'Normal Sugar', '22oz'),
(206, 164, '1_16oz__normal-sugar', 9, 69.00, 621.00, 'Normal Sugar', '16oz'),
(207, 165, '45_16oz__normal-sugar', 1, 109.00, 109.00, 'Normal Sugar', '16oz'),
(208, 166, '85_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(209, 167, '85_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(210, 168, '82_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(211, 169, '82_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(212, 170, '82_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(213, 171, '82_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(214, 172, '76_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(215, 173, '84_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(216, 174, '82_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(217, 175, '82_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(218, 176, '79_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(219, 177, '85_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(220, 178, '56_22oz__normal-sugar', 1, 139.00, 139.00, 'Normal Sugar', '22oz'),
(221, 179, '82_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(222, 179, '63_22oz__normal-sugar', 1, 139.00, 139.00, 'Normal Sugar', '22oz'),
(223, 179, '37', 1, 20.00, 20.00, NULL, 'none'),
(224, 180, '82_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(225, 181, '82_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(226, 182, '82_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(227, 183, '82_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(228, 184, '82_22oz__normal-sugar', 1, 89.00, 89.00, 'Normal Sugar', '22oz'),
(229, 185, '82_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(230, 186, '82_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz'),
(231, 187, '47_16oz__normal-sugar', 1, 109.00, 109.00, 'Normal Sugar', '16oz'),
(232, 188, '94_16oz__normal-sugar', 1, 69.00, 69.00, 'Normal Sugar', '16oz');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `product_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `options` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'none',
  `price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` int NOT NULL DEFAULT '1' COMMENT '0=Unavailable,1=Available',
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `category_id`, `options`, `price`, `status`, `image`) VALUES
(1, 'Pearl Milk Tea', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":0}', 1, 'assets/img/pearlmilktea.png'),
(3, 'Java Chip', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/javachip.png'),
(6, 'Red Velvet', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/redvelvet.png'),
(7, 'Cookies & Cream', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/cookiesandcream.png'),
(10, 'Milk Chocolate', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/milkchocolate.png'),
(12, 'Dark Chocolate', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/darkchocolate.png'),
(14, 'Matcha', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/matcha.png'),
(16, 'Okinawa', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/okinawa.png'),
(18, 'Wintermelon', 15, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/wintermelon.png'),
(19, 'Macchiato Blend', 9, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/Macchiato Blend.jpg'),
(22, 'Mocha Blend', 9, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":59}', 1, 'assets/img/Mocha Blend.jpg'),
(24, 'Salted Caramel Blend', 9, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":69}', 1, 'assets/img/Salted Caramel Blend.jpg'),
(28, 'Mango', 13, 'drinks', '{\"16oz\":69,\"22oz\":79,\"hot\":null}', 1, 'assets/img/Mango FT.jpg'),
(37, 'Coffee Jelly', 11, 'none', '20.00', 1, 'assets/img/coffeejelly.png'),
(38, 'Cream cheese', 11, 'none', '20.00', 1, 'assets/img/creamcheese.png'),
(39, 'Pearl', 11, 'none', '10.00', 1, 'assets/img/Pearl.png'),
(40, 'Lechon Kawali', 1, 'none', '139', 1, 'assets/img/Lechon Kawali.png'),
(41, 'Porksilog', 1, 'none', '129', 1, 'assets/img/Porksilog.png'),
(42, 'Tapsilog', 1, 'none', '119', 1, 'assets/img/Tapsilog.png'),
(45, 'Java Chip', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Java Chip.jpg'),
(46, 'Red Velvet', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Red Velvet.jpg'),
(47, 'Cookies and Cream', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Cookies and Cream.jpg'),
(48, 'Milk Chocolate', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Milk Chocolate.jpg'),
(49, 'Dark Chocolate', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Dark Chocolate.jpg'),
(50, 'Matcha', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Matcha.jpg'),
(51, 'Okinawa', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Okinawa.jpg'),
(52, 'Wintermelon', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Wintermelon.jpg'),
(53, 'Hokkaido', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Hokkaido.jpg'),
(54, 'Brown Sugar', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Brown Sugar.jpg'),
(55, 'Taro', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Taro.jpg'),
(56, 'Blueberry', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Blueberry.jpg'),
(57, 'Strawberry', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Strawberry.jpg'),
(58, 'Mango', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Mango.jpg'),
(59, 'Green Apple', 8, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":null}', 1, 'assets/img/Green Apple.jpg'),
(60, 'Spanish Blend', 9, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":69}', 1, 'assets/img/Spanish Blend.jpg'),
(61, 'Butterscotch Blend', 9, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":69}', 1, 'assets/img/Butterscotch Blend.jpg'),
(62, 'Hazelnut Blend', 9, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":69}', 1, 'assets/img/Hazelnut Blend.jpg'),
(63, 'Almond Blend', 9, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":69}', 1, 'assets/img/Almond Blend.jpg'),
(64, 'Caramel Blend', 9, 'drinks', '{\"16oz\":109,\"22oz\":139,\"hot\":69}', 1, 'assets/img/Caramel Blend.jpg'),
(65, 'Strawberry', 13, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Strawberry Fruit Tea.jpg'),
(66, 'Lemon', 13, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Mango FT.jpg'),
(67, 'Lychee', 13, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Lychee FT.jpg'),
(68, 'Green Apple', 13, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Green Apple FT.jpg'),
(69, 'Strawberry', 10, 'drinks', '{\"16oz\":89,\"22oz\":99,\"hot\":null}', 1, 'assets/img/Strawberry YS.jpg'),
(70, 'Blueberry', 10, 'drinks', '{\"16oz\":89,\"22oz\":99,\"hot\":null}', 1, 'assets/img/Blueberry YS.jpg'),
(71, 'Lemon', 10, 'drinks', '{\"16oz\":89,\"22oz\":99,\"hot\":null}', 1, 'assets/img/Lemon YS.jpg'),
(72, 'Mango', 10, 'drinks', '{\"16oz\":89,\"22oz\":99,\"hot\":null}', 1, 'assets/img/Mango YS.jpg'),
(73, 'Green Apple', 10, 'drinks', '{\"16oz\":89,\"22oz\":99,\"hot\":null}', 1, 'assets/img/Green Apple YS.jpg'),
(74, 'Mixed Berries', 10, 'drinks', '{\"16oz\":89,\"22oz\":99,\"hot\":null}', 1, 'assets/img/Mixed Berries YS.jpg'),
(75, 'Spanish Latte', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Spanish Latte CF.jpg'),
(76, 'Mocha', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Mocha.png'),
(77, 'Caramel Macchiato', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Caramel Machiatto.png'),
(78, 'Salted Caramel', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Salted Caramel.png'),
(79, 'Butterscotch', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Butterscotch.png'),
(80, 'Vanilla', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Vanilla.png'),
(81, 'Hazelnut', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Hazelnut.png'),
(82, 'Almond', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Almond coffee.png'),
(83, 'Caramel', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Caramel.png'),
(84, 'Coffee Latte', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Coffee Latte.png'),
(85, 'Americano', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Americano CF.png'),
(86, 'Taro Latte', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Taro Latte CF.png'),
(87, 'Brown Sugar', 12, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":69}', 1, 'assets/img/Brown Sugar.png'),
(88, 'Strawberry', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Strawberry MB.png'),
(89, 'Milk Chocolate', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Milk Chocolate MB.png'),
(90, 'Matcha', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Matcha MB.png'),
(91, 'Mango', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Mango MB.png'),
(92, 'Blueberry', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Blueberry MB.png'),
(93, 'Strawberry Matcha', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Strawberry Matcha MB.png'),
(94, 'Blueberry Matcha', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Blueberry Matcha MB.png'),
(95, 'Taro', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Taro MB.png'),
(96, 'Choco Berry', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Choco berry MB.png'),
(97, 'Red Velvet', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Red Velvet MB.png'),
(98, 'Mixed Berries', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Mixed Berries MB.png'),
(99, 'Mango Berry', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Mango Berry MB.png'),
(100, 'Taro Matcha', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Taro Matcha MB.png'),
(101, 'Matcha Cookies and Cream', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Matcha Cookies n Cream MB.png'),
(102, 'Choco Matcha', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Choco Matcha MB.png'),
(103, 'Dark Chocolate', 14, 'drinks', '{\"16oz\":69,\"22oz\":89,\"hot\":null}', 1, 'assets/img/Dark Chocolate MB.png'),
(104, 'Kali Burger', 5, 'none', '89', 1, 'assets/img/Kali Burger.png'),
(105, 'Deluxe Burger', 5, 'none', '109', 1, 'assets/img/Deluxe Burger.png'),
(106, 'Supreme Burger', 5, 'none', '129', 1, 'assets/img/Supreme Burger.png'),
(107, 'Triple Cheese Burger', 5, 'none', '99', 1, 'assets/img/Triple Cheese Burger.png'),
(108, '2 Viands', 2, 'none', '189', 1, 'assets/img/2 viands.png'),
(109, '3 Viands', 2, 'none', '259', 1, 'assets/img/3 viands.png'),
(110, '4 Viands', 2, 'none', '329', 1, 'assets/img/4 viands.png'),
(113, 'Spaghetti', 4, 'none', '109', 1, 'assets/img/Spaghetti.png'),
(114, 'Carbonara', 4, 'none', '129', 1, 'assets/img/Carbonara.png'),
(115, 'Tuna Pesto', 4, 'none', '129', 1, 'assets/img/Tuna Pesto.png'),
(117, 'Tocilog', 1, 'none', '99', 1, 'assets/img/Tocilog.png'),
(118, 'Clubhouse', 6, 'none', '109', 1, 'assets/img/kalicafe_logo.jpg'),
(119, 'Tuna Melt', 6, 'none', '59', 1, 'assets/img/kalicafe_logo.jpg'),
(120, 'Crispy Chicken Sandwich', 6, 'none', '159', 1, 'assets/img/kalicafe_logo.jpg'),
(121, 'Nachos Overload', 7, 'none', '129', 1, 'assets/img/kalicafe_logo.jpg'),
(123, 'Fries Overload', 7, 'none', '159', 1, 'assets/img/kalicafe_logo.jpg'),
(124, 'Cheese Stick', 7, 'none', '79', 1, 'assets/img/kalicafe_logo.jpg'),
(125, '3pcs with rice', 3, 'none', '108', 1, 'assets/img/kalicafe_logo.jpg'),
(126, '6 pcs Ala Carte 1 flavor', 3, 'none', '178', 1, 'assets/img/kalicafe_logo.jpg'),
(127, '6 pcs Ala Carte 2 flavors', 3, 'none', '198', 1, 'assets/img/kalicafe_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_flavors`
--

CREATE TABLE `product_flavors` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `flavor_id` int NOT NULL,
  `size` varchar(20) DEFAULT '16oz',
  `quantity_required` decimal(10,2) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_flavors`
--

INSERT INTO `product_flavors` (`id`, `product_id`, `flavor_id`, `size`, `quantity_required`, `unit`, `created_at`, `updated_at`) VALUES
(1, 82, 17, '16oz', 100.00, 'ml', '2025-12-03 13:14:07', '2025-12-03 13:14:07'),
(2, 82, 17, '22oz', 200.00, 'ml', '2025-12-03 13:27:08', '2025-12-03 13:27:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_ingredients`
--

CREATE TABLE `product_ingredients` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity_required` decimal(10,2) NOT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'grams'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','cashier','barista') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'Eri', 'eri', '$2y$10$NhrXWekJUagT3BcUpsywsuX4ZgLebxh0A730z5IA94T6Yb6gNXreW', 'cashier', '2024-11-29 12:17:12'),
(31, 'admin', 'admin', '$2y$10$2gakLwOcdbTZTY4Tj.0uE.duMAYBFo5f/uswOBKx0TioLp69nP7Fe', 'admin', '2025-01-31 12:17:41'),
(42, 'cash', 'cash', '$2y$10$9ylsPaXXvpJcagBjXwJQeuFLtHm/b5bvOZ0Ge7h8bz5u3/WIBhcWm', 'cashier', '2025-11-16 08:27:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_ingredients`
--
ALTER TABLE `category_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_category_ingredient_size` (`category_id`,`ingredient_id`,`size`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `deleted_users`
--
ALTER TABLE `deleted_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredients_fk_category` (`category_id`);

--
-- Indexes for table `ingredient_categories`
--
ALTER TABLE `ingredient_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ingredient_link`
--
ALTER TABLE `ingredient_link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `idx_paymongo_reference` (`paymongo_reference`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_flavors`
--
ALTER TABLE `product_flavors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_flavor_size` (`product_id`,`flavor_id`,`size`),
  ADD KEY `flavor_id` (`flavor_id`);

--
-- Indexes for table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category_ingredients`
--
ALTER TABLE `category_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `deleted_users`
--
ALTER TABLE `deleted_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ingredient_categories`
--
ALTER TABLE `ingredient_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ingredient_link`
--
ALTER TABLE `ingredient_link`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `product_flavors`
--
ALTER TABLE `product_flavors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_ingredients`
--
ALTER TABLE `category_ingredients`
  ADD CONSTRAINT `category_ingredients_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_flavors`
--
ALTER TABLE `product_flavors`
  ADD CONSTRAINT `product_flavors_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flavors_ibfk_2` FOREIGN KEY (`flavor_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD CONSTRAINT `product_ingredients_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
