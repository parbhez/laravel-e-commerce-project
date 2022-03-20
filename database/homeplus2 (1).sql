-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2022 at 04:43 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homeplus2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `full_name`, `email`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Admin', 'masud.affb@gmail.com', '$2y$10$f3DwfUFyRL6vwYdu3C1zYeQD2BrqQgbvdkhnqfjGw9B/5VPP4TKj2', 'Wapvby2JtwtVhundCx2DClymhkTgU68otmwuYQYG64OxQZX1fzcX3vJaQS7k', 1, '2016-08-22 05:59:58', '2021-11-13 15:50:30'),
(4, 'Sazzadur Rahman Sobuj', 'sobuj@gmail.com', '$2y$10$kbPWscjoAFrBKITrzSn7AOimBQSz6mCnjdSrDjjUG4do1ABKZMhPi', 'xRlzTA1Os5PU3jkz1i6UsjdU2iBcIvFYrPhTCUW4QgOtLPw3Ew227zOM9VsH', 1, '2019-07-03 04:11:38', '2019-07-03 04:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `business_types`
--

CREATE TABLE `business_types` (
  `business_type_id` int(11) NOT NULL,
  `business_type_name_lang1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `business_type_name_lang2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name_lang1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_name_lang2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_order` int(11) DEFAULT NULL,
  `is_selected` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name_lang1`, `category_name_lang2`, `icon`, `featured_image`, `view_order`, `is_selected`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '99 Store', '৯৯ স্টোর', '1-1576610713.jpg', '1-1576610713.jpg', 0, 1, 2, '2017-03-08 10:01:32', '2020-02-08 05:39:41', 3, 1),
(2, 'Combo offer', 'কম্বো অফার', '2-1576587284.jpg', '2-1576587284.jpg', 0, 1, 1, '2017-01-31 07:37:06', '2020-01-21 13:28:45', 3, 1),
(3, 'Computer & Laptop', 'Computer & Laptop', '3-1576438732.jpg', '3-1576438732.jpg', 1, 1, 1, '2019-12-15 13:49:53', '2019-12-16 06:14:03', 1, 1),
(4, 'Gadget & Electronics', 'গ্যাজেট ও ইলেকট্রনিক্স', '4-1576587319.jpg', '4-1576587319.jpg', 5, 1, 1, '2017-01-06 14:16:44', '2019-12-17 12:55:19', 3, 1),
(5, 'Home Decor', 'গৃহসজ্জা', '5-1576587354.png', '5-1576587354.jpg', 1, 1, 1, '2017-01-17 05:58:15', '2019-12-23 17:12:33', 3, 1),
(6, 'HouseHold', 'গৃহস্থালী সামগ্রী', '6-1576587391.jpg', '6-1576587391.jpg', 0, 1, 1, '2017-01-17 06:18:02', '2019-12-23 17:12:37', 3, 1),
(7, 'Men\'s Fashion', 'Men\'s Fashion', '1-1576439121.jpg', '1-1576439121.jpg', 1, 1, 1, '2019-12-15 09:25:56', '2019-12-16 06:14:27', 1, 1),
(8, 'Mobile & Tab', 'Mobile & Tab', '4-1576439372.jpg', '4-1576439372.jpg', 1, 1, 1, '2019-12-15 13:51:02', '2019-12-16 06:14:33', 1, 1),
(9, 'Parts & Tools', 'যন্ত্রাংশ ও সরঞ্জাম', '9-1576587431.jpg', '9-1576587431.jpg', 0, 1, 1, '2017-01-24 10:16:23', '2019-12-23 17:12:45', 3, 1),
(10, 'Test', 'test', '10-1576587460.png', '10-1576587460.jpg', 0, 1, 1, '2017-11-18 18:35:28', '2019-12-17 12:57:40', 0, 1),
(11, 'Unique Item ', 'ইউনিক আইটেম', '10-20170115105852.jpg', 'demo.png', 1, 1, 1, '2017-01-06 14:25:14', '2019-12-16 06:20:32', 3, 3),
(12, 'Watches & Clock', 'ঘড়ি', '11-20170117053928.png', 'demo.png', 6, 1, 1, '2017-01-17 05:39:27', '2019-12-16 06:20:28', 3, 3),
(13, 'Whole Sale', 'পাইকারী', '16-20170204105607.jpg', 'demo.png', 1, 1, 1, '2017-02-04 10:56:07', '2019-12-16 06:20:24', 3, 3),
(14, 'Women\'s Fashion', 'Women\'s Fashion', '2-1576439472.jpg', '2-1576439472.jpg', 1, 1, 1, '2019-12-15 09:53:39', '2019-12-16 06:15:06', 1, 1),
(15, 'Meril', 'Meril', '15-20191218010544AED..jpg', '15-20191218010543A8E..jpg', 3, 1, 1, '2019-12-17 19:05:41', '2020-01-21 13:28:49', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name_lang1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city_name_lang2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cost` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city_name_lang1`, `city_name_lang2`, `cost`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Dhaka', 'ঢাকা', 50, 1, '2016-11-30 06:41:14', '0000-00-00 00:00:00', NULL, NULL),
(2, 'Lakhipur', 'লক্ষ্মীপুর', 90, 1, '2016-11-30 06:41:36', '0000-00-00 00:00:00', NULL, NULL),
(3, 'Chittagong', 'চট্টগ্রাম', 90, 1, '2017-01-06 13:15:33', '0000-00-00 00:00:00', NULL, NULL),
(4, 'Noakhali', 'নোয়াখালী', 90, 1, '2017-01-06 13:16:05', '0000-00-00 00:00:00', NULL, NULL),
(5, 'Comila', 'কুমিল্লা', 90, 1, '2017-01-06 13:17:00', '0000-00-00 00:00:00', NULL, NULL),
(6, 'B. Baria', 'ব্রাহ্মনবাড়ীয়া', 90, 1, '2017-01-06 13:17:46', '0000-00-00 00:00:00', NULL, NULL),
(7, 'Chandpur', 'চাঁদপুর', 90, 1, '2017-01-06 13:18:16', '0000-00-00 00:00:00', NULL, NULL),
(8, 'Feni', 'ফেনী', 90, 1, '2017-01-06 13:18:37', '0000-00-00 00:00:00', NULL, NULL),
(9, 'Bandharban', 'বান্দরবন', 90, 1, '2017-01-06 13:21:02', '0000-00-00 00:00:00', NULL, NULL),
(10, 'Khagrachari', 'খাগড়াছড়ি', 90, 1, '2017-01-06 13:21:17', '0000-00-00 00:00:00', NULL, NULL),
(11, 'Rangamati', 'রাঙ্গামাটি', 90, 1, '2017-01-06 13:21:42', '0000-00-00 00:00:00', NULL, NULL),
(12, 'Cox\'s Bazar', 'কক্সবাজার', 90, 1, '2017-01-06 13:22:14', '0000-00-00 00:00:00', NULL, NULL),
(13, 'Maulvi Bazar', 'মৌলভীবাজার', 90, 1, '2017-01-06 13:24:38', '0000-00-00 00:00:00', NULL, NULL),
(14, 'Habiganj', 'হবিগঞ্জ', 90, 1, '2017-01-06 13:25:17', '0000-00-00 00:00:00', NULL, NULL),
(15, 'Sunamganj', 'সুনামগঞ্জ', 90, 1, '2017-01-06 13:25:34', '0000-00-00 00:00:00', NULL, NULL),
(16, 'Sylhet', 'সিলেট', 90, 1, '2017-01-06 13:25:58', '0000-00-00 00:00:00', NULL, NULL),
(17, 'Faridpur', 'ফরিদপুর', 90, 1, '2017-01-06 13:27:16', '0000-00-00 00:00:00', NULL, NULL),
(18, 'Gazipur', 'গাজীপুর', 90, 1, '2017-01-06 13:27:35', '0000-00-00 00:00:00', NULL, NULL),
(19, 'Kishoregonj', 'কিশোরগঞ্জ', 90, 1, '2017-01-06 13:28:19', '0000-00-00 00:00:00', NULL, NULL),
(20, 'Gopalgonj', 'গোপালগঞ্জ', 90, 1, '2017-01-06 13:29:05', '0000-00-00 00:00:00', NULL, NULL),
(21, 'Madaripur', 'মাদারীপুর', 90, 1, '2017-01-06 13:29:24', '0000-00-00 00:00:00', NULL, NULL),
(22, 'Manikgonj', 'মানিকগঞ্জ', 90, 1, '2017-01-06 13:29:47', '0000-00-00 00:00:00', NULL, NULL),
(23, 'Munshigonj', 'মন্সীগঞ্জ', 90, 1, '2017-01-06 13:30:14', '0000-00-00 00:00:00', NULL, NULL),
(24, 'Narayangonj', 'নারায়ণগঞ্জ', 90, 1, '2017-01-06 13:30:41', '0000-00-00 00:00:00', NULL, NULL),
(25, 'Narshingdi', 'নরসিংদী', 90, 1, '2017-01-06 13:31:16', '0000-00-00 00:00:00', NULL, NULL),
(26, 'Shariatpur', 'শরিয়তপুর', 90, 1, '2017-01-06 13:31:40', '0000-00-00 00:00:00', NULL, NULL),
(27, 'Rajbari', 'রাজবাড়ী', 90, 1, '2017-01-06 13:32:02', '0000-00-00 00:00:00', NULL, NULL),
(28, 'Tangail', 'টাঙ্গাইল', 90, 1, '2017-01-06 13:32:26', '0000-00-00 00:00:00', NULL, NULL),
(29, 'Barguna', 'বরগুনা', 90, 1, '2017-01-06 13:34:25', '0000-00-00 00:00:00', NULL, NULL),
(30, 'Barisal', 'বরিশাল', 90, 1, '2017-01-06 13:34:42', '0000-00-00 00:00:00', NULL, NULL),
(31, 'Bhola', 'ভোলা', 90, 1, '2017-01-06 13:35:13', '0000-00-00 00:00:00', NULL, NULL),
(32, 'Jhalokathi', 'ঝালকাঠি', 90, 1, '2017-01-06 13:36:14', '0000-00-00 00:00:00', NULL, NULL),
(33, 'Patuakhali', 'পটুয়াখালী', 90, 1, '2017-01-06 13:36:41', '0000-00-00 00:00:00', NULL, NULL),
(34, 'Pirojpur', 'পিরোজপুর', 90, 1, '2017-01-06 13:37:01', '0000-00-00 00:00:00', NULL, NULL),
(35, 'Bagerhat', 'বাগেরহাট', 90, 1, '2017-01-06 13:40:34', '0000-00-00 00:00:00', NULL, NULL),
(36, 'Chuadanga', 'চুয়াডাঙ্গা', 90, 1, '2017-01-06 13:40:56', '0000-00-00 00:00:00', NULL, NULL),
(37, 'Jessore', 'যশোর', 90, 1, '2017-01-06 13:41:13', '0000-00-00 00:00:00', NULL, NULL),
(38, 'Jhenaidah', 'ঝিনাইদহ', 90, 1, '2017-01-06 13:41:42', '0000-00-00 00:00:00', NULL, NULL),
(39, 'Khulna', 'খুলনা', 90, 1, '2017-01-06 13:42:02', '0000-00-00 00:00:00', NULL, NULL),
(40, 'Kushtia', 'কুষ্টিয়া', 90, 1, '2017-01-06 13:42:20', '0000-00-00 00:00:00', NULL, NULL),
(41, 'Magura', 'মাগুরা', 90, 1, '2017-01-06 13:42:37', '0000-00-00 00:00:00', NULL, NULL),
(42, 'Meherpur', 'মেহেরপুর', 90, 1, '2017-01-06 13:42:50', '0000-00-00 00:00:00', NULL, NULL),
(43, 'Narail', 'নড়াইল', 90, 1, '2017-01-06 13:43:14', '0000-00-00 00:00:00', NULL, NULL),
(44, 'Satkhira', 'সাতক্ষীরা', 90, 1, '2017-01-06 13:43:48', '0000-00-00 00:00:00', NULL, NULL),
(45, 'Bogra', 'বগুড়া', 90, 1, '2017-01-06 13:47:17', '0000-00-00 00:00:00', NULL, NULL),
(46, '	Chapainawabganj', 'চাঁপাইনবাবগঞ্জ', 90, 1, '2017-01-06 13:47:40', '0000-00-00 00:00:00', NULL, NULL),
(47, 'Joypurhat', 'জয়পুরহাট', 90, 1, '2017-01-06 13:47:58', '0000-00-00 00:00:00', NULL, NULL),
(48, 'Naogaon', 'নওগাঁ', 90, 1, '2017-01-06 13:48:15', '0000-00-00 00:00:00', NULL, NULL),
(49, 'Natore', 'নাটোর', 90, 1, '2017-01-06 13:48:30', '0000-00-00 00:00:00', NULL, NULL),
(50, 'Pabna', 'পাবনা', 90, 1, '2017-01-06 13:48:42', '0000-00-00 00:00:00', NULL, NULL),
(51, 'Rajshahi', 'রাজশাহী', 90, 1, '2017-01-06 13:48:56', '0000-00-00 00:00:00', NULL, NULL),
(52, 'Sirajganj', 'সিরাজগঞ্জ', 90, 1, '2017-01-06 13:49:12', '0000-00-00 00:00:00', NULL, NULL),
(53, 'Rangpur', 'রংপুর', 90, 1, '2017-01-06 13:52:12', '0000-00-00 00:00:00', NULL, NULL),
(54, 'Kurigram', 'কুড়িগ্রাম', 90, 1, '2017-01-06 13:52:48', '0000-00-00 00:00:00', NULL, NULL),
(55, 'Gaibandha', 'গাইবান্ধা', 90, 1, '2017-01-06 13:53:10', '0000-00-00 00:00:00', NULL, NULL),
(56, 'Thakurgaon', 'ঠাকুরগাঁও', 90, 1, '2017-01-06 13:53:28', '0000-00-00 00:00:00', NULL, NULL),
(57, 'Dinajpur', 'দিনাজপুর', 90, 1, '2017-01-06 13:53:44', '0000-00-00 00:00:00', NULL, NULL),
(58, 'Nilfamari', 'নীলফামারী', 90, 1, '2017-01-06 13:53:59', '0000-00-00 00:00:00', NULL, NULL),
(59, 'Panchagar', 'পঞ্চগড়', 90, 1, '2017-01-06 13:54:22', '0000-00-00 00:00:00', NULL, NULL),
(60, 'Lalmonirhat', 'লালমনিরহাট', 90, 1, '2017-01-06 13:54:40', '0000-00-00 00:00:00', NULL, NULL),
(61, 'Jamalpur', 'জামালপুর', 90, 1, '2017-01-06 13:54:57', '0000-00-00 00:00:00', NULL, NULL),
(62, 'Netrokona', 'নেত্রকোনা', 90, 1, '2017-01-06 13:55:14', '0000-00-00 00:00:00', NULL, NULL),
(63, 'Mymensingh', 'ময়মনসিংহ', 90, 1, '2017-01-06 13:55:33', '0000-00-00 00:00:00', NULL, NULL),
(64, 'Sherpur', 'শেরপুর', 90, 1, '2017-01-06 13:55:47', '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color_name_lang1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `color_name_lang2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `color_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=inactive,1=active,2=delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `updated_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`color_id`, `color_name_lang1`, `color_name_lang2`, `color_code`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Green', 'সবুজ', '#00ff40', 1, '2019-12-15 15:25:34', '2019-12-15 15:25:34', 1, NULL),
(2, 'Red', 'লাল', '#f4390b', 1, '2019-12-15 15:26:11', '2019-12-15 15:26:11', 1, NULL),
(3, 'Yellow', 'হলুদ', '#ffff00', 1, '2019-12-15 15:26:44', '2019-12-15 15:26:44', 1, NULL),
(4, 'Blue', 'নীল', '#0000a0', 1, '2019-12-15 15:27:11', '2019-12-15 15:27:11', 1, NULL),
(5, 'Violet', 'বেগুনী', '#008040', 1, '2019-12-15 15:27:45', '2019-12-15 15:27:45', 1, NULL),
(6, 'Orange', 'কমলা', '#f5510a', 1, '2019-12-15 15:28:27', '2019-12-15 15:28:27', 1, NULL),
(7, 'Black', 'Black', '#ff8000', 1, '2019-12-15 15:53:00', '2019-12-15 15:53:12', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_profile`
--

CREATE TABLE `company_profile` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `product_test_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `product_test_id`, `path`, `caption`, `updated_at`, `created_at`) VALUES
(1, 11, '', 'Headphone 1', NULL, '2019-12-10 17:02:08'),
(2, 11, '', 'Headphone 2', NULL, '2019-12-10 17:02:08'),
(3, 11, '', 'Headphone 3', NULL, '2019-12-10 17:02:09'),
(4, 13, '130-15760993753928.png', 'Headphone1', NULL, '2019-12-10 17:06:01'),
(5, 13, '131-15760993754509.jpg', 'Loson22', NULL, '2019-12-10 17:06:01'),
(6, 15, '150-15761797401100.PNG', 'html', NULL, '2019-12-11 05:56:51'),
(7, 15, '151-15761312982871.jpg', 'Headphone', NULL, '2019-12-11 05:56:51'),
(9, 13, '132-15760993753845.jpg', 'wer', NULL, '2019-12-11 21:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name_lang1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location_name_lang2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `merchant_id` int(11) NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hidden_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#####***%%',
  `mobile_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `web_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bank_ac_holder_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bank_ac_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `branch_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bank_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `routing_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `business_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '2=deny, 0=pending, 1=approved',
  `remember_token` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_lang` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=en , 2=bn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`merchant_id`, `full_name`, `email`, `password`, `hidden_password`, `mobile_no`, `company_name`, `logo`, `web_address`, `bank_ac_holder_name`, `bank_ac_number`, `branch_name`, `bank_name`, `routing_number`, `business_type`, `address`, `district`, `location`, `status`, `remember_token`, `created_at`, `updated_at`, `last_login_lang`) VALUES
(7, 'A H Rashed', 'ahrashed88@gmail.com', '$2y$10$VRTYXWBIkx60QBS70Uc0iOSw9w2rVqQG9dcK/AmlDKSXxSiF87bLi', '#####***%%', '01921724913', 'Best Fashion', '7-20170105054046c5I5.jpg', '', '', '', '', '', '', '', 'Mirpur-10, Dhaka.', '', '', 1, 'epBsGjR0VDUawojp3vBBWKlpHQqHBosKA6eK6lKhqIIN9stpphmGNXjZmDiM', '2017-01-04 03:25:53', '2017-03-02 04:43:09', 1),
(8, 'Uniko', 'srsumon100@gmail.com', '$2y$10$N0HQPLl3zM4shS/zbQhwvef6GfwxxWvKuZQrN.caTbTjttbl.JfAe', '#####***%%', '01618206020', 'SRS electronics', '8-20170105110644OpU2.png', 'eshoppingbd.com', '', '', '', '', '', 'ইলেকট্রনিক্স', 'Mirpur-10, Dhaka.', '', '', 1, 'N6BfMY86URYDPxpmZhSD1QafEj5pS7KZ2Rkz3JqzLqWDuvFAzgyzz6Ozrr0g', '2017-01-05 21:55:31', '2017-03-15 00:23:18', 1),
(9, 'riyadh', 'riyadh@gmail.com', '$2y$10$X5pXQXfVDlHF/2jzLE6r9.UH7ZfedpMeKFSwh.Ns36vP7WYU9gyBe', '#####***%%', '01672002510', 'RIyadh', '9-20170209061946.jpg', '', '', '', '', '', '', '', 'Dhaka, Mohammadpur\r\n', '', '', 0, 'yS1KGqYU0mVdBBdkzB4QB7miLpPeWSRymbYj1WxM9O1Sy2XkCFEJvte5gDlJ', '2017-01-17 19:53:43', '2017-02-09 00:19:46', 1),
(10, 'Md Tareq Hossain', 'cait1234bd@gmail.com', '$2y$10$sa506rm.XZh7J1IHhamL.Oajon1OfY50.ysKmm12j90wG3x0LtnkC', '#####***%%', '01781435525', 'CAIT', '10-20170221054820.jpg', 'caitbd.com', '', '', '', '', '', 'ইলেকট্রনিক্স', 'Motijheel,Dhaka-1000', '', '', 1, '', '2017-02-21 16:13:59', '2017-02-20 23:48:20', 1),
(11, 'MD. KAMRUL HASSAN', 'hassanjn36@gmail.com', '$2y$10$FyHQFj1JcmxlRctoVHq68euREBIbAcqmhFK5LNyVVYfOrT/lOkF6K', '#####***%%', '01995499097', 'HASSANNI', '11-20170227112733.png', '', '', '', '', '', '', '', 'Mogbazar, Dhaka.', '', '', 1, '4xYfGJb31kOFQHmggDXwNFdyRGruw3v2I5y7VpE4mPbpA0g4ZGyd4ehqWbLE', '2017-02-27 22:00:51', '2017-03-28 22:45:01', 1),
(12, 'MD. MASUDUR RAHMAN', 'masudmsc7@gmail.com', '$2y$10$u0Tf02nyI/efdcBvooGOeOiUNYkPgbYzepDzYwFFXnDzg71THVfCe', '#####***%%', '01881646556', 'Fashion4u.bd', '', '', '', '', '', '', '', '', 'Samorly square shopping mall, level- 4, shop no- 4', '', '', 1, 'YmKkPyRpBO9lBwOsNb9XsC79GkUjd1b5AUTGYvFXtwlhnou7F9jv48H7gUru', '2017-03-02 19:08:34', '2017-03-02 02:11:15', 1),
(13, 'Shamim Reza', 'shamim082008@gmail.com', '$2y$10$e8Ts4A2y6eelBc7rT43ExOmMm5UiD6luedNmXf4fvLJ0F1Zwug8eu', '#####***%%', '01782299826', 'Grameen nakshi', '', '', '', '', '', '', '', '', 'Mirpur-2, Dhaka.', '', '', 1, '', '2017-03-20 17:45:35', '0000-00-00 00:00:00', 1),
(14, 'Watch4u.bd', 'masud_mcom@yahoo.com', '$2y$10$IXfNBJMDJ1dhmMJ2kJmUX.FH6RrTVMv5J4ZzOY5Xq/QDgeYYi7hJ6', '#####***%%', '01743024525', 'Watch4u.bd', '', '', '', '', '', '', '', '', '84 Gojmohol Road, Zigatola, Haharibagh, Dhaka-1209', '', '', 1, '', '2017-03-22 20:35:49', '0000-00-00 00:00:00', 1),
(15, 'Hridoy', 'mdhridoy159222@gmail.com', '$2y$10$tVKCxNsBWMkIQWwyCoUHteUfygl3yiYD0Wyra0BLZFgIiBeOBjyjy', '#####***%%', '1635-163475', 'ewu', '', '', '', '', '', '', '', '', 'Rampora,banasree', '', '', 0, '', '2017-03-28 16:29:55', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `merchant_shipment_info`
--

CREATE TABLE `merchant_shipment_info` (
  `merchant_shipment_info_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `speed` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_master_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `order_condition_id` int(11) UNSIGNED DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `shipping_mobile_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `payable` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `shipping_cost` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `paid` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `payment_way` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 = deny, 1 = panding, 2 = approved, 3 = complete sale,4=cancel by merchant',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_condition`
--

CREATE TABLE `order_condition` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_lang1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_lang2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Order all condition given here , here order cancel.';

--
-- Dumping data for table `order_condition`
--

INSERT INTO `order_condition` (`id`, `title_lang1`, `title_lang2`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Stock Out', 'Stock Out', 1, NULL, NULL),
(2, 'Product Damage', 'Product Damage', 1, NULL, NULL),
(3, 'Size Not Available', 'Size Not Available', 1, NULL, NULL),
(4, 'Color Not Available', 'Color Not Available', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `fk_merchant_id` int(11) DEFAULT '0',
  `fk_order_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `fk_product_wise_size_id` int(11) DEFAULT NULL,
  `fk_product_wise_color_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `purchase_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_invoice_no` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fk_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photo_sliders`
--

CREATE TABLE `photo_sliders` (
  `photo_slider_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(5) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `photo_sliders`
--

INSERT INTO `photo_sliders` (`photo_slider_id`, `category_id`, `image_path`, `image_caption`, `sub_category_id`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 7, '1-1576511295.jpg', 'Men\'s Fashion', 28, 1, '2019-12-16 15:48:15', 1, '2019-12-16 21:48:16', 1),
(2, 14, '2-1576511456.jpg', 'Women\'s Fashion', 42, 1, '2019-12-16 15:50:56', 1, '2019-12-16 21:50:56', 1),
(3, 3, '3-1576511515.jpg', 'Computer laptob', 10, 1, '2019-12-16 15:51:55', 1, '2019-12-16 21:51:55', 1),
(4, 7, '4-1576603074.jpg', 'Men\'s Fashion', 28, 1, '2019-12-17 17:17:53', 1, '2019-12-17 23:17:54', 1),
(5, 14, '5-1576603106.jpg', 'Women\'s Fashion', 57, 1, '2019-12-17 17:18:25', 1, '2019-12-17 23:18:26', 1),
(6, 4, '6-1576603138.jpg', 'Computer laptob', 17, 1, '2019-12-17 17:18:58', 1, '2019-12-17 23:18:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `merchant_id` int(11) DEFAULT '8',
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `sub_sub_category_id` int(11) NOT NULL,
  `product_name_lang1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_name_lang2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` int(11) NOT NULL,
  `details_lang1` text COLLATE utf8_unicode_ci NOT NULL,
  `details_lang2` text COLLATE utf8_unicode_ci NOT NULL,
  `refund_policy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `market_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `commission` int(11) DEFAULT NULL COMMENT 'unit is percentage',
  `placement_type` int(11) NOT NULL COMMENT '1=>Normal Product, 2=>Slider Product, 3=>Selected Product',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=panding, 1=approve, 2=deny',
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `merchant_id`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `product_name_lang1`, `product_name_lang2`, `slug`, `product_code`, `details_lang1`, `details_lang2`, `refund_policy`, `quantity`, `market_price`, `discount`, `sale_price`, `commission`, `placement_type`, `status`, `comments`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 8, 1, 1, 1, 'Jent\'s Gabardine Pant', 'জেন্টস গ্যাবার্ডিন প্যান্ট', 'jents-gabardine-pant', 100001, 'Jent\'s Gabardine Pant', 'জেন্টস গ্যাবার্ডিন প্যান্ট', NULL, 50, 1250, 50, 1200, 5, 2, 1, NULL, '2020-01-30 20:11:20', '2020-01-30 20:11:20', NULL, NULL),
(2, 8, 1, 1, 2, 'Jent\'s Gabardine Pant', 'জেন্টস গ্যাবার্ডিন প্যান্ট', 'jents-gabardine-pant', 100002, 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', NULL, 40, 1050, 50, 1000, 5, 2, 1, NULL, '2019-12-15 15:58:28', '2020-01-21 13:28:27', NULL, NULL),
(57, 7, 1, 4, 5, 'জেন্টস গ্যাবার্ডিন প্যান্ট', 'Jent\'s Gabardine Pant', 'জেন্টস-গ্যাবার্ডিন-প্যান্ট', 100001, 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', '', 50, 750, 260, 490, 10, 2, 1, '', '2017-01-05 13:19:35', '2020-01-21 13:29:08', NULL, NULL),
(58, 7, 3, 4, 5, 'জেন্টস গ্যাবার্ডিন প্যান্ট', 'Jent\'s Gabardine Pant', 'জেন্টস-গ্যাবার্ডিন-প্যান্ট', 100002, 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', '', 50, 750, 260, 490, 25, 2, 1, '', '2017-01-05 13:34:00', '2019-12-23 17:27:27', NULL, NULL),
(59, 7, 4, 4, 5, 'Jent\'s Gabardine Pant', 'Jent\'s Gabardine Pant', 'jent\'s-gabardine-pant', 100003, 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', 'কোয়ালিটিঃ ১০০% এক্সপোর্ট অরিয়েন্টেড গার্মেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#সাইজ: 28, 30, 32, 34', '', 30, 700, 310, 390, 25, 2, 1, '', '2017-01-05 16:49:56', '2019-12-23 17:27:32', NULL, NULL),
(60, 8, 5, 7, 28, 'A4tech USB Mouse', 'A4tech USB মাউস', 'a4tech-usb-মাউস', 100004, 'Original A4tech 3G মাউস\r\n#যে কোন সারফেসে সহজেই কাজ করা যায়\r\n#টেকসই ও মজবুত ও দীর্ঘ্যস্থায়ী\r\n#ওয়্যারড মাইস\r\n#কালার- কালো', 'Original A4tech 3G মাউস\r\n#যে কোন সারফেসে সহজেই কাজ করা যায়\r\n#টেকসই ও মজবুত ও দীর্ঘ্যস্থায়ী\r\n#ওয়্যারড মাইস\r\n#কালার- কালো', '', 30, 550, 270, 280, 10, 3, 1, '', '2017-01-05 17:21:46', '2019-12-23 17:27:37', NULL, NULL),
(61, 8, 6, 7, 28, 'ওয়্যারলেস মাউস', 'Wireless Mouse', 'ওয়্যারলেস-মাউস', 100005, 'USB ইন্টারফেস \r\n#2.4 GHz অপারেশন ফ্রিকুয়েন্সি \r\n#4-key অপটিক্যাল মাউস \r\n#টেকনোলোজিঃ 4D অপটিক্যাল 1600dpi রেজুলেশন \r\n#রেজুলেশনঃ  800 / 1000dpi (বাই বাটন)\r\n#কম্প্যাটিবল উইথঃ Windows® 98 or later,Mac OS® 8.6 or later,Linux® 2.4 or late\r\n#কমপ্যাক্ট, এরগোনমিক অ্যান্ড আরামদায়ক ডিজাইন ', 'USB ইন্টারফেস \r\n#2.4 GHz অপারেশন ফ্রিকুয়েন্সি \r\n#4-key অপটিক্যাল মাউস \r\n#টেকনোলোজিঃ 4D অপটিক্যাল 1600dpi রেজুলেশন \r\n#রেজুলেশনঃ  800 / 1000dpi (বাই বাটন)\r\n#কম্প্যাটিবল উইথঃ Windows® 98 or later,Mac OS® 8.6 or later,Linux® 2.4 or late\r\n#কমপ্যাক্ট, এরগোনমিক অ্যান্ড আরামদায়ক ডিজাইন ', '', 45, 550, 151, 399, 10, 3, 1, '', '2017-01-05 17:47:48', '2019-12-23 17:27:41', NULL, NULL),
(62, 8, 3, 10, 0, 'Cosonic Headphone', 'কসোনিক হেডফোন', 'কসোনিক-হেডফোন', 100006, 'Cosonic CD-650 হেডসেট \r\nড্রাইভার ইউনিট: 30mm \r\nপাওয়ার: Max 30mW \r\nইমপিডেন্স: 32Ω (1kHz) \r\nসেনসিটিভিটি: 120dB/mW \r\nমাইক্রোফোন: 30Hz-16000Hz \r\nকর্ড লেন্থ: 2.2m ৩.৫ এমএম জ্যাক \r\nনয়েজ ০%', 'Cosonic CD-650 হেডসেট \r\nড্রাইভার ইউনিট: 30mm \r\nপাওয়ার: Max 30mW \r\nইমপিডেন্স: 32Ω (1kHz) \r\nসেনসিটিভিটি: 120dB/mW \r\nমাইক্রোফোন: 30Hz-16000Hz \r\nকর্ড লেন্থ: 2.2m ৩.৫ এমএম জ্যাক \r\nনয়েজ ০%', '', 22, 900, 450, 450, 10, 3, 1, '', '2017-01-10 07:50:38', '2019-12-23 17:13:24', NULL, NULL),
(63, 8, 3, 10, 0, 'beats by dr.dre Headphone', 'beats হেডফোন', 'beats-by-dr.dre-headphone', 100007, 'উন্নতমানের সাউন্ড কোয়ালিটি\r\n#পিওর সাউন্ড এবং 0% নয়েজ\r\n#কথা বলার জন্য উপযোগী \r\n#3.5mm অডিও জ্যাক \r\n#স্টাইলিশ ডিজাইন \r\n#সলিড কালার কম্বিনেশন \r\n#আধুনিকতার এক অন্যতম উপহার।', 'উন্নতমানের সাউন্ড কোয়ালিটি\r\n#পিওর সাউন্ড এবং 0% নয়েজ\r\n#কথা বলার জন্য উপযোগী \r\n#3.5mm অডিও জ্যাক \r\n#স্টাইলিশ ডিজাইন \r\n#সলিড কালার কম্বিনেশন \r\n#আধুনিকতার এক অন্যতম উপহার।', '', 10, 750, 360, 390, 10, 3, 1, '', '2017-01-17 13:11:04', '2019-12-23 17:13:29', NULL, NULL),
(64, 8, 3, 9, 37, 'Mini Bluetooth Headset', 'মিনি ব্লুটুথ হেডসেট', 'mini-bluetooth-headset', 100008, 'ব্লুটুথ ভার্সনঃ V4.0 + EDR \r\n#ব্লুটুথ প্রোফাইলঃ হ্যান্ডস ফ্রি/ হেডসেট \r\n#প্লে টাইমঃ আপ টু ৮ ঘন্টা \r\n#টক টাইমঃ আপ টু ৮ ঘন্টা \r\n#রেডিও ফ্রিকুয়েন্সিঃ 2.402-2.480GHz \r\n#স্ট্যান্ডবাই টাইমঃ আপ টু ১৩০ ঘন্টা \r\n#পাওয়ার সোর্সঃ বিল্ট ইন রিচার্জেবল  Li-on ব্যাটারি \r\n#সাপোর্ট A2DP: মিউজিক প্লেব্যাক (অডিও আউটপুট: 35mW, Play / Pause) \r\n#ট্রান্সমিশন রেঞ্জঃ ১০ মিটার ', 'ব্লুটুথ ভার্সনঃ V4.0 + EDR \r\n#ব্লুটুথ প্রোফাইলঃ হ্যান্ডস ফ্রি/ হেডসেট \r\n#প্লে টাইমঃ আপ টু ৮ ঘন্টা \r\n#টক টাইমঃ আপ টু ৮ ঘন্টা \r\n#রেডিও ফ্রিকুয়েন্সিঃ 2.402-2.480GHz \r\n#স্ট্যান্ডবাই টাইমঃ আপ টু ১৩০ ঘন্টা \r\n#পাওয়ার সোর্সঃ বিল্ট ইন রিচার্জেবল  Li-on ব্যাটারি \r\n#সাপোর্ট A2DP: মিউজিক প্লেব্যাক (অডিও আউটপুট: 35mW, Play / Pause) \r\n#ট্রান্সমিশন রেঞ্জঃ ১০ মিটার ', '', 20, 800, 410, 390, 10, 3, 1, '', '2017-01-17 13:46:37', '2019-12-23 17:13:32', NULL, NULL),
(65, 8, 4, 9, 37, 'SAMSUNG ব্লুটুথ হেডসেট', 'Samsung Bluetooth Headset', 'samsung-ব্লুটুথ-হেডসেট', 100009, '\"Bluetooth Version: V4.0 + EDR \r\n#Bluetooth Profiles: Hands free / Headset \r\n#Play time: up to 8 hours.\r\n#Talk time: up to 8 hours.\r\n#Radio Frequency: 2.402-2.480GHz \r\n#Standby time: up to 130 hours.\r\n#Power source: Built in Rechargeable Li-on Battery.\r\n#Support A2DP: Music Playback (Audio Output: 35mW, Play / Pause) \r\n#Transmission Range: 10 m \"', '\"Bluetooth Version: V4.0 + EDR \r\n#Bluetooth Profiles: Hands free / Headset \r\n#Play time: up to 8 hours.\r\n#Talk time: up to 8 hours.\r\n#Radio Frequency: 2.402-2.480GHz \r\n#Standby time: up to 130 hours.\r\n#Power source: Built in Rechargeable Li-on Battery.\r\n#Support A2DP: Music Playback (Audio Output: 35mW, Play / Pause) \r\n#Transmission Range: 10 m \"', '', 50, 900, 401, 499, 10, 3, 1, '', '2017-01-19 12:46:40', '2019-12-23 17:13:37', NULL, NULL),
(68, 8, 4, 55, 0, 'LED Sports Watch', 'LED স্পোর্টস ওয়াচ', 'water-pump', 100010, 'ডিসপ্লেঃ ডিজিটাল\r\n# স্ট্র্যাপ টাইপঃ সিলিকন বেল্ট\r\n# ওয়াচ কালারঃ ব্ল্যাক অ্যান্ড রেড\r\n# ডায়াল শেপঃ Rectangular\r\n# স্লিম ডিজাইন\r\n# অ্যাডজাস্টেবল বেল্ট', 'ডিসপ্লেঃ ডিজিটাল\r\n# স্ট্র্যাপ টাইপঃ সিলিকন বেল্ট\r\n# ওয়াচ কালারঃ ব্ল্যাক অ্যান্ড রেড\r\n# ডায়াল শেপঃ Rectangular\r\n# স্লিম ডিজাইন\r\n# অ্যাডজাস্টেবল বেল্ট', '', 22, 300, 201, 99, 10, 3, 1, '', '2017-01-19 17:14:24', '2019-12-23 17:13:42', NULL, NULL),
(69, 8, 4, 17, 12, 'Water Pump D-2', 'পানির পাম্প ডি-২', 'water-pump-d-2', 100011, 'ওয়াটার জার হ্যান্ড পাম্প\r\n\r\n#পানির জার থেকে পাম্প করে পানি গ্লাসে ঢালা যায়\r\n\r\n#ড্যুর‌্যাবল প্লাস্টিকের তৈরি\r\n\r\n#আপনার বাড়ী, অফিস, স্কুল, ফ্যাক্টরী বা হাসপাতালে ব্যবহারের জন্য প্রযোজ্য\r\n\r\n#ব্যবহার করা খুবই সহজ\r\n', 'ওয়াটার জার হ্যান্ড পাম্প\r\n\r\n#পানির জার থেকে পাম্প করে পানি গ্লাসে ঢালা যায়\r\n\r\n#ড্যুর‌্যাবল প্লাস্টিকের তৈরি\r\n\r\n#আপনার বাড়ী, অফিস, স্কুল, ফ্যাক্টরী বা হাসপাতালে ব্যবহারের জন্য প্রযোজ্য\r\n\r\n#ব্যবহার করা খুবই সহজ\r\n', '', 100, 750, 360, 390, 10, 3, 1, '', '2017-01-19 17:44:06', '2019-12-23 17:13:46', NULL, NULL),
(70, 8, 4, 55, 0, '4 Port USB hub', 'ইউএসবি হাব (৪ পোর্ট)', '4-port-usb-hub', 100012, '\"USB হাব ৪ পোর্ট\r\n#হাই কোয়ালিটি USB হাব\r\n#ভার্সন: 2.0\r\n#ইন্টারফেস: USB\r\n#আউটপুট: USB\r\n#Female কেবল লেন্থ: 1.5’\"', '\"USB হাব ৪ পোর্ট\r\n#হাই কোয়ালিটি USB হাব\r\n#ভার্সন: 2.0\r\n#ইন্টারফেস: USB\r\n#আউটপুট: USB\r\n#Female কেবল লেন্থ: 1.5’\"', '', 20, 300, 201, 99, 10, 3, 1, '', '2017-01-19 11:15:47', '2019-12-23 17:15:03', NULL, NULL),
(71, 8, 5, 7, 7, '4 port USB hub', 'USB হাব (৪ পোর্ট)', '4-port-usb-hub', 100013, '\"\"\"USB 4 Port Hub\r\n#High Quality USB Hub\r\n#Each separate USB switch.\r\n#Interface: USB\r\n#Output: USB\r\n#Female Cable length: 1.5 \"\"\"', '\"USB হাব ৪ পোর্ট\r\n#হাই কোয়ালিটি USB হাব\r\n#প্রতিটি ইউএসবিতে আলাদা সুইচ।\r\n#ইন্টারফেস: USB\r\n#আউটপুট: USB\r\n#Female কেবল লেন্থ: 1.5’\"', '', 90, 400, 201, 199, 10, 3, 1, '', '2017-01-24 12:14:46', '2019-12-23 17:13:55', NULL, NULL),
(72, 8, 5, 55, 0, 'Human USB hub', 'হিউম্যান USB হাব', 'human-usb-hub', 100014, '\"\"\"USB 4 Port Hub\r\n#High Quality USB Hub\r\n#Each separate USB switch.\r\n#Interface: USB\r\n#Output: USB\r\n#Female Cable length: 1.5 \"\"\"', '\"USB হাব ৪ পোর্ট\r\n#হাই কোয়ালিটি USB হাব\r\n#ভার্সন: 2.0\r\n#ইন্টারফেস: USB\r\n#আউটপুট: USB\r\n#Female কেবল লেন্থ: 1.5’\"', '', 50, 300, 201, 99, 10, 3, 1, '', '2017-01-24 12:18:10', '2019-12-23 17:15:08', NULL, NULL),
(73, 8, 5, 55, 0, '4 port Cable USB hub', 'ক্যাবল USB হাব (৪ পোর্ট)', '4-port-USB-hub', 100015, 'USB হাব ৪ পোর্ট\r\n#এতে একসাথে মডেম এবং অন্যান্য হাই ক্যাপাবিলিটি ডিভাইস ব্যবহার করা যাবে\r\n#হাই কোয়ালিটি USB হাব\r\n#ভার্সন: 2.0\r\n#ইন্টারফেস: USB\r\n#আউটপুট: USB\r\n#Female ক্যাবল লেন্থ: 1.5\"\r\n#ডাটা ট্রান্সফার রেট: 480Mbps', 'USB হাব ৪ পোর্ট\r\n#এতে একসাথে মডেম এবং অন্যান্য হাই ক্যাপাবিলিটি ডিভাইস ব্যবহার করা যাবে\r\n#হাই কোয়ালিটি USB হাব\r\n#ভার্সন: 2.0\r\n#ইন্টারফেস: USB\r\n#আউটপুট: USB\r\n#Female ক্যাবল লেন্থ: 1.5\"\r\n#ডাটা ট্রান্সফার রেট: 480Mbps', '', 50, 400, 301, 99, 10, 3, 1, '', '2017-01-24 01:42:45', '2019-12-23 17:14:14', NULL, NULL),
(74, 8, 17, 55, 0, 'One Port Card Reader', 'এক পোর্টের কার্ড রিডার', 'A', 100016, 'হাই এ্যকসেস USB 2.0 কার্ড রিডার।\r\n#টেকসই, মজবুত এবং দীর্ঘ্যস্থায়ী।\r\n#ডাটা ট্রান্সফার স্পীড উচ্চগতি সম্পন্ন।\r\n#কার্ড রিডারের মাইক্রোচীপটি প্রোগ্রামেবল বলে নষ্ট হওয়ার সম্ভাবনা নেই।\r\n#ডাটা ট্রান্সফার নির্ণায়ক এলইডি সংযুক্ত।', 'হাই এ্যকসেস USB 2.0 কার্ড রিডার।\r\n#টেকসই, মজবুত এবং দীর্ঘ্যস্থায়ী।\r\n#ডাটা ট্রান্সফার স্পীড উচ্চগতি সম্পন্ন।\r\n#কার্ড রিডারের মাইক্রোচীপটি প্রোগ্রামেবল বলে নষ্ট হওয়ার সম্ভাবনা নেই।\r\n#ডাটা ট্রান্সফার নির্ণায়ক এলইডি সংযুক্ত।', '', 123, 200, 101, 99, 10, 3, 1, '', '2017-01-25 04:18:57', '2019-12-23 17:15:11', NULL, NULL),
(75, 8, 7, 7, 38, '8 in 1 ল্যাপটপ চার্জার', '8 in 1 Laptop Charger', 's', 100017, 'যে কোন ধরনের এবং যে কোন পোর্টের ল্যাপটপ চার্জ করা যাবে \r\n#ইনপুট পাওয়ার: 100 থেকে 240 ভোল্ট \r\n#আউটপুট পাওয়ার: 12 ভোল্ট থেকে 24 ভোল্ট পর্যন্ত \r\n#12-24 ভোল্টের ল্যাপটপসহ যে কোন ইলেকট্রনিক্স পন্য চার্জ দেওয়া যাবে \r\n#উন্নতমানের হিট সিংক থাকায় গরম, পুড়ে যাওয়া কিংবা নষ্ট হওয়ার সম্ভাবনা নেই', 'যে কোন ধরনের এবং যে কোন পোর্টের ল্যাপটপ চার্জ করা যাবে \r\n#ইনপুট পাওয়ার: 100 থেকে 240 ভোল্ট \r\n#আউটপুট পাওয়ার: 12 ভোল্ট থেকে 24 ভোল্ট পর্যন্ত \r\n#12-24 ভোল্টের ল্যাপটপসহ যে কোন ইলেকট্রনিক্স পন্য চার্জ দেওয়া যাবে \r\n#উন্নতমানের হিট সিংক থাকায় গরম, পুড়ে যাওয়া কিংবা নষ্ট হওয়ার সম্ভাবনা নেই', '', 100, 900, 310, 590, 10, 3, 1, '', '2017-01-25 06:50:45', '0000-00-00 00:00:00', NULL, NULL),
(76, 8, 17, 55, 0, '5 Slot Card Reader', '৫ স্লট কার্ড রিডার', '1', 100018, 'হাই এ্যকসেস USB 2.0 কার্ড রিডার।\r\n#টেকসই, মজবুত এবং দীর্ঘ্যস্থায়ী।\r\n#ডাটা ট্রান্সফার স্পীড উচ্চগতি সম্পন্ন।\r\n#কার্ড রিডারের মাইক্রোচীপটি প্রোগ্রামেবল বলে নষ্ট হওয়ার সম্ভাবনা নেই।\r\n#ডাটা ট্রান্সফার নির্ণায়ক এলইডি সংযুক্ত।', 'হাই এ্যকসেস USB 2.0 কার্ড রিডার।\r\n#টেকসই, মজবুত এবং দীর্ঘ্যস্থায়ী।\r\n#ডাটা ট্রান্সফার স্পীড উচ্চগতি সম্পন্ন।\r\n#কার্ড রিডারের মাইক্রোচীপটি প্রোগ্রামেবল বলে নষ্ট হওয়ার সম্ভাবনা নেই।\r\n#ডাটা ট্রান্সফার নির্ণায়ক এলইডি সংযুক্ত।', '', 100, 300, 201, 99, 10, 1, 1, '', '2017-01-25 11:43:10', '0000-00-00 00:00:00', NULL, NULL),
(77, 8, 17, 55, 0, 'Phone Ring Stand', 'ফোন রিং স্ট্যান্ড', 'q', 100019, 'মোবাইলের সাথে ঝুলিয়ে রাখা যাবে \r\n#চাবির রিং হিসেবেও ব্যবহারযোগ্য \r\n#৩৬০ ডিগ্রি পর্যন্ত রোটেট করা যায়\r\n#এটি ফোনের সাথে লাগালে ফোন হাত থেকে পড়ে যাবে না \r\n#ম্যাটেরিয়াল-মেটাল \r\n#ফোন ছাড়াও অন্যান্য ডিজিটাল ডিভাইসের সাথে লাগানো যাবে \r\n#সাইজ: 35mm*40mm*6.2mm', 'মোবাইলের সাথে ঝুলিয়ে রাখা যাবে \r\n#চাবির রিং হিসেবেও ব্যবহারযোগ্য \r\n#৩৬০ ডিগ্রি পর্যন্ত রোটেট করা যায়\r\n#এটি ফোনের সাথে লাগালে ফোন হাত থেকে পড়ে যাবে না \r\n#ম্যাটেরিয়াল-মেটাল \r\n#ফোন ছাড়াও অন্যান্য ডিজিটাল ডিভাইসের সাথে লাগানো যাবে \r\n#সাইজ: 35mm*40mm*6.2mm', '', 100, 300, 201, 99, 10, 1, 1, '', '2017-01-25 11:58:05', '0000-00-00 00:00:00', NULL, NULL),
(78, 8, 14, 31, 0, '11 in 1 tools set', '11 in 1 টুলস সেট', '1', 100020, '11 items in 1.\r\n#High Quality.\r\n#7 scrow driver.\r\n#2 tuiser.\r\n#1 wear cutter \r\n#1 remove.\r\n#It can be used to repair everything.', '11 items in 1.\r\n#High Quality.\r\n#7 scrow driver.\r\n#2 tuiser.\r\n#1 wear cutter \r\n#1 remove.\r\n#It can be used to repair everything.', '', 55, 700, 310, 390, 10, 3, 1, '', '2017-01-25 12:02:26', '0000-00-00 00:00:00', NULL, NULL),
(79, 8, 7, 7, 29, 'Key Board', 'কী বোর্ড', 'Key-Board', 100021, '#AONE TECH ওয়্যার্ড কী-বোর্ড\r\n#ফ্লাট কী-ডিজাইন\r\n#USB টাইপ: ১২টি মাল্টিমিডিয়া কী\r\n#লেজার প্রিন্ট ক্যারেকটার\r\n#কানেকটিভিটি: USB\r\n#ইন্টার্ফেস ইন্সটলেশন: প্লাগ এন্ড প্লে\r\n#কম্প্যাটিবিলিটি/সিস্টেম রিকোয়ার্মেন্ট: Windows 95, 98, Me, NT 4.0, 2000 and XP, IBM PC\r\n#কী-কাউন্ট: কম্পোজিট 12 ফাংশন-কী, 12 মাল্টিমিডিয়া-কী', '#AONE TECH ওয়্যার্ড কী-বোর্ড\r\n#ফ্লাট কী-ডিজাইন\r\n#USB টাইপ: ১২টি মাল্টিমিডিয়া কী\r\n#লেজার প্রিন্ট ক্যারেকটার\r\n#কানেকটিভিটি: USB\r\n#ইন্টার্ফেস ইন্সটলেশন: প্লাগ এন্ড প্লে\r\n#কম্প্যাটিবিলিটি/সিস্টেম রিকোয়ার্মেন্ট: Windows 95, 98, Me, NT 4.0, 2000 and XP, IBM PC\r\n#কী-কাউন্ট: কম্পোজিট 12 ফাংশন-কী, 12 মাল্টিমিডিয়া-কী', '', 50, 550, 260, 290, 15, 3, 1, '', '2017-01-30 12:45:32', '0000-00-00 00:00:00', NULL, NULL),
(80, 7, 5, 4, 5, 'Casual Gabardine Pant', 'ক্যাজুয়াল গ্যাবার্ডিন প্যান্ট', 'ক্যাজুয়াল-গ্যাবার্ডিন-প্যান্ট', 100022, 'ক্যাজুয়াল গ্যাবার্ডিন প্যান্ট ফর জেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#কালার: ছবিতে যেমন আছে \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#আরামদায়ক \r\n#১০০% এক্সপোর্ট কোয়ালিটি \r\n#সাইজ: 28, 30, 32, 34, 36 \r\n#বিঃদ্রঃ পণ্যের রঙ, ছবির কারণে কিংবা আলোর কারণে অথবা আপনার কম্পিউটারের কারণে সামান্য তারতম্য ঘটতে পারে', 'ক্যাজুয়াল গ্যাবার্ডিন প্যান্ট ফর জেন্টস \r\n#ফেব্রিকঃ ১০০% কটন \r\n#কালার: ছবিতে যেমন আছে \r\n#আকর্ষণীয় ডিজাইন \r\n#পকেট ৪ টি \r\n#আরামদায়ক \r\n#১০০% এক্সপোর্ট কোয়ালিটি \r\n#সাইজ: 28, 30, 32, 34, 36 \r\n#বিঃদ্রঃ পণ্যের রঙ, ছবির কারণে কিংবা আলোর কারণে অথবা আপনার কম্পিউটারের কারণে সামান্য তারতম্য ঘটতে পারে', '', 60, 750, 300, 450, 10, 3, 1, '', '2017-01-31 11:07:22', '0000-00-00 00:00:00', NULL, NULL),
(81, 7, 5, 4, 5, 'Jent\'s Casual Gabardine Pant', 'ক্যাজুয়াল জেন্টস গ্যাবার্ডিন প্যান্ট', 'Jent\'s-Casual-Gabardine-Pant', 100023, 'ক্যাজুয়াল গ্যাবার্ডিন প্যান্ট ফর জেন্টস\r\n#ফেব্রিকঃ ১০০% কটন\r\n#কালার: ছবিতে যেমন আছে\r\n#আকর্ষণীয় ডিজাইন\r\n#পকেট ৪ টি\r\n#আরামদায়ক\r\n#১০০% এক্সপোর্ট কোয়ালিটি\r\n#সাইজ: 28, 30, 32, 34, 36\r\n#বিঃদ্রঃ পণ্যের রঙ, ছবির কারণে কিংবা আলোর কারণে অথবা আপনার কম্পিউটারের কারণে সামান্য তারতম্য ঘটতে পারে।', 'ক্যাজুয়াল গ্যাবার্ডিন প্যান্ট ফর জেন্টস\r\n#ফেব্রিকঃ ১০০% কটন\r\n#কালার: ছবিতে যেমন আছে\r\n#আকর্ষণীয় ডিজাইন\r\n#পকেট ৪ টি\r\n#আরামদায়ক\r\n#১০০% এক্সপোর্ট কোয়ালিটি\r\n#সাইজ: 28, 30, 32, 34, 36\r\n#বিঃদ্রঃ পণ্যের রঙ, ছবির কারণে কিংবা আলোর কারণে অথবা আপনার কম্পিউটারের কারণে সামান্য তারতম্য ঘটতে পারে।', '', 35, 800, 350, 450, 10, 1, 1, '', '2017-01-31 11:36:28', '0000-00-00 00:00:00', NULL, NULL),
(82, 7, 5, 6, 0, 'Police Brand Polo Shirt', 'পুলিশ ব্র্যান্ড পলো শার্ট', 'Police-Brand-Polo-Shirt', 100024, 'এক্সপোর্ট কোয়ালিটি টি-শার্ট \r\n#ফেব্রিক: কটন \r\n#কোয়ালিটি: ১০০% এক্সপোর্ট কোয়ালিটি \r\n#ফেব্রিকেশন: ১৮০ জিএসএম \r\n#সাইজ: M, L, XL \r\n#M:(চেষ্ট-১৯’’, লেন্থ-২৭’’, সোল্ডার- ১৬) \r\n#L:(চেষ্ট-১৯.৫’’, লেন্থ-২৭.৫’’, সোল্ডার- ১৭) \r\n#XL:(চেষ্ট-২০’’, লেন্থ-২৮’’,সোল্ডার- ১৮) \r\n#মেড ইন বাংলাদেশ', 'এক্সপোর্ট কোয়ালিটি টি-শার্ট \r\n#ফেব্রিক: কটন \r\n#কোয়ালিটি: ১০০% এক্সপোর্ট কোয়ালিটি \r\n#ফেব্রিকেশন: ১৮০ জিএসএম \r\n#সাইজ: M, L, XL \r\n#M:(চেষ্ট-১৯’’, লেন্থ-২৭’’, সোল্ডার- ১৬) \r\n#L:(চেষ্ট-১৯.৫’’, লেন্থ-২৭.৫’’, সোল্ডার- ১৭) \r\n#XL:(চেষ্ট-২০’’, লেন্থ-২৮’’,সোল্ডার- ১৮) \r\n#মেড ইন বাংলাদেশ', '', 30, 680, 281, 399, 10, 1, 1, '', '2017-01-31 11:48:30', '0000-00-00 00:00:00', NULL, NULL),
(83, 8, 17, 55, 0, 'Optical USB Mouse', 'অপটিক্যাল USB মাউস', 'টাঙ্গাইল-সিল্ক-শাড়ী', 100025, 'প্লাগ এন্ড প্লে সিস্টেম\r\n#নো- ড্রাইভার নিডেড\r\n#2X বাটন ফর ফাস্ট টাস্ক\r\n#এনহ্যান্স ইফেক্টিভনেস এন্ড সেভ টাইম\r\n#কম্প্যাটিবল উইথ উইন্ডোজ\r\n#ডাইমেনশন: 4.68L x 2.48W x 1.39H inch', 'প্লাগ এন্ড প্লে সিস্টেম\r\n#নো- ড্রাইভার নিডেড\r\n#2X বাটন ফর ফাস্ট টাস্ক\r\n#এনহ্যান্স ইফেক্টিভনেস এন্ড সেভ টাইম\r\n#কম্প্যাটিবল উইথ উইন্ডোজ\r\n#ডাইমেনশন: 4.68L x 2.48W x 1.39H inch', '', 20, 350, 251, 99, 10, 1, 1, '', '2017-02-03 02:48:27', '0000-00-00 00:00:00', NULL, NULL),
(84, 8, 17, 55, 0, '31 in 1 Srcew Driver', '31 in 1 স্ক্র ড্রাইভার', '31-in-1-Srcew-Driver', 100026, '31 in 1 টুলস সেট\r\n#প্রফেশনাল হার্ডওয়্যার টুলস\r\n#হাই কোয়ালিটি ম্যাটেরিয়াল দ্বারা তৈরী\r\n#অনেকগুলো আলাদা আলাদা টুলস এবং টুইজার থাকায় যে কোন ইলেকট্রিক কাজ করা যাবে\r\n#ঘড়ি থেকে কম্পিউটার মেরামত- যে কোন কাজেই ব্যবহার করা যাবে', '31 in 1 টুলস সেট\r\n#প্রফেশনাল হার্ডওয়্যার টুলস\r\n#হাই কোয়ালিটি ম্যাটেরিয়াল দ্বারা তৈরী\r\n#অনেকগুলো আলাদা আলাদা টুলস এবং টুইজার থাকায় যে কোন ইলেকট্রিক কাজ করা যাবে\r\n#ঘড়ি থেকে কম্পিউটার মেরামত- যে কোন কাজেই ব্যবহার করা যাবে', '', 100, 400, 301, 99, 10, 1, 1, '', '2017-02-03 03:04:21', '0000-00-00 00:00:00', NULL, NULL),
(85, 8, 14, 31, 0, 'Hot Melt Glue Gun', 'হট মেল্ট গ্লু গান', 'Hot-Melt-Glue-Gun', 100027, '\"60W হট মেল্ট গ্লু Gun\r\n#কাঠ বা প্লাস্টিকের সরঞ্জাম তৈরী\r\n#সার্কিট বোর্ড নির্দিষ্ট স্থানে শক্তভাবে লাগানো\r\n#আর্টিফিসিয়াল ফ্লাওয়ার, ক্রাফট প্রজেক্টস, ফার্নিচার ও কাঠের কাজের জন্য দরকারী টুলস\r\n#সাথে দুটি Glue স্টিক ফ্রী\r\n#পাওয়ার - 60 ওয়াট\r\n#কালার: ব্ল্যাক \"', '\"60W হট মেল্ট গ্লু Gun\r\n#কাঠ বা প্লাস্টিকের সরঞ্জাম তৈরী\r\n#সার্কিট বোর্ড নির্দিষ্ট স্থানে শক্তভাবে লাগানো\r\n#আর্টিফিসিয়াল ফ্লাওয়ার, ক্রাফট প্রজেক্টস, ফার্নিচার ও কাঠের কাজের জন্য দরকারী টুলস\r\n#সাথে দুটি Glue স্টিক ফ্রী\r\n#পাওয়ার - 60 ওয়াট\r\n#কালার: ব্ল্যাক \"', '', 100, 750, 360, 390, 10, 1, 1, '', '2017-02-03 03:13:29', '0000-00-00 00:00:00', NULL, NULL),
(86, 7, 6, 19, 16, 'Tangail Silk Sharee', 'টাঙ্গাইল সিল্ক শাড়ী', 'Tangail-Silk-Sharee', 100028, 'মিরপুর সিল্ক জামদানি শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'মিরপুর সিল্ক জামদানি শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 25, 2500, 720, 1780, 25, 1, 1, '', '2017-02-04 05:51:13', '0000-00-00 00:00:00', NULL, NULL),
(87, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধুপিয়ান সিল্ক শাড়ি', 'Dupian-Silk-Sharee', 100029, 'ধুপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', 'ধুপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', '', 20, 2900, 600, 2300, 10, 3, 1, '', '2017-02-04 05:55:05', '0000-00-00 00:00:00', NULL, NULL),
(88, 7, 5, 4, 4, 'Semi Narrow Jeans Pant', 'Semi Narrow Jeans Pant', 'Semi-Narrow-Jeans-Pant', 100030, 'স্টাইলিশ জিন্স প্যান্ট \r\n#ফেব্রিক: ১০০% কটন \r\n#সাইজ : ৩০, ৩২, ৩৪, ৩৬ \r\n#সেমি ন্যারো ফিট \r\n#ট্র্যাডিশনাল ৫ পকেট সফট ফেব্রিক \r\n#এক্সপোর্ট কোয়ালিটি ফ্যাশনেবল ও আরামদায়ক', 'স্টাইলিশ জিন্স প্যান্ট \r\n#ফেব্রিক: ১০০% কটন \r\n#সাইজ : ৩০, ৩২, ৩৪, ৩৬ \r\n#সেমি ন্যারো ফিট \r\n#ট্র্যাডিশনাল ৫ পকেট সফট ফেব্রিক \r\n#এক্সপোর্ট কোয়ালিটি ফ্যাশনেবল ও আরামদায়ক', '', 30, 900, 350, 550, 10, 1, 1, '', '2017-02-04 06:09:42', '0000-00-00 00:00:00', NULL, NULL),
(89, 7, 5, 11, 0, 'Cotton Jent\'s Panjabi', 'কটন জেন্টস পাঞ্জাবী', 'Cotton-Jent\'s-Panjabi', 100031, 'জেন্টস কটন শর্ট পাঞ্জাবী \r\nফ্যাশনেবল ও আরামদায়ক পাঞ্জাবী \r\n#ফেব্রিক: ১০০% কটন\r\n#গ্ল্যামারাস লুক \r\n#১ পকেট ডিজাইন \r\n#সাইজঃ XL, XXL \r\n#XL(চেষ্ট - ৪০’’, লেংথ - ৩৪’’) \r\n#XXL(চেষ্ট - ৪০’’, লেংথ - ৩৬’’)', 'জেন্টস কটন শর্ট পাঞ্জাবী \r\nফ্যাশনেবল ও আরামদায়ক পাঞ্জাবী \r\n#ফেব্রিক: ১০০% কটন\r\n#গ্ল্যামারাস লুক \r\n#১ পকেট ডিজাইন \r\n#সাইজঃ XL, XXL \r\n#XL(চেষ্ট - ৪০’’, লেংথ - ৩৪’’) \r\n#XXL(চেষ্ট - ৪০’’, লেংথ - ৩৬’’)', '', 30, 900, 510, 390, 10, 3, 1, '', '2017-02-04 06:13:38', '0000-00-00 00:00:00', NULL, NULL),
(90, 7, 5, 6, 0, 'Men\'s Pholo Shirt', 'Men\'s Pholo Shirt', 'Men\'s-Pholo-Shirt', 100032, 'এক্সপোর্ট কোয়ালিটি টি-শার্ট \r\n#ফেব্রিক: কটন \r\n#কোয়ালিটি: ১০০% এক্সপোর্ট কোয়ালিটি \r\n#ফেব্রিকেশন: ১৮০ জিএসএম \r\n#সাইজ: M, L, XL \r\n#M:(চেষ্ট-১৯’’, লেন্থ-২৭’’, সোল্ডার- ১৬) \r\n#L:(চেষ্ট-১৯.৫’’, লেন্থ-২৭.৫’’, সোল্ডার- ১৭) \r\n#XL:(চেষ্ট-২০’’, লেন্থ-২৮’’,সোল্ডার- ১৮) \r\n#মেড ইন বাংলাদেশ', 'এক্সপোর্ট কোয়ালিটি টি-শার্ট \r\n#ফেব্রিক: কটন \r\n#কোয়ালিটি: ১০০% এক্সপোর্ট কোয়ালিটি \r\n#ফেব্রিকেশন: ১৮০ জিএসএম \r\n#সাইজ: M, L, XL \r\n#M:(চেষ্ট-১৯’’, লেন্থ-২৭’’, সোল্ডার- ১৬) \r\n#L:(চেষ্ট-১৯.৫’’, লেন্থ-২৭.৫’’, সোল্ডার- ১৭) \r\n#XL:(চেষ্ট-২০’’, লেন্থ-২৮’’,সোল্ডার- ১৮) \r\n#মেড ইন বাংলাদেশ', '', 100, 550, 220, 330, 10, 1, 1, '', '2017-02-04 06:48:32', '0000-00-00 00:00:00', NULL, NULL),
(91, 7, 5, 6, 0, 'Men\'s Pholo Shirt', 'Men\'s Pholo Shirt', 'Men\'s-Pholo-Shirt', 100033, 'এক্সপোর্ট কোয়ালিটি টি-শার্ট \r\n#ফেব্রিক: কটন \r\n#কোয়ালিটি: ১০০% এক্সপোর্ট কোয়ালিটি \r\n#ফেব্রিকেশন: ১৮০ জিএসএম \r\n#সাইজ: M, L, XL \r\n#M:(চেষ্ট-১৯’’, লেন্থ-২৭’’, সোল্ডার- ১৬) \r\n#L:(চেষ্ট-১৯.৫’’, লেন্থ-২৭.৫’’, সোল্ডার- ১৭) \r\n#XL:(চেষ্ট-২০’’, লেন্থ-২৮’’,সোল্ডার- ১৮) \r\n#মেড ইন বাংলাদেশ', 'এক্সপোর্ট কোয়ালিটি টি-শার্ট \r\n#ফেব্রিক: কটন \r\n#কোয়ালিটি: ১০০% এক্সপোর্ট কোয়ালিটি \r\n#ফেব্রিকেশন: ১৮০ জিএসএম \r\n#সাইজ: M, L, XL \r\n#M:(চেষ্ট-১৯’’, লেন্থ-২৭’’, সোল্ডার- ১৬) \r\n#L:(চেষ্ট-১৯.৫’’, লেন্থ-২৭.৫’’, সোল্ডার- ১৭) \r\n#XL:(চেষ্ট-২০’’, লেন্থ-২৮’’,সোল্ডার- ১৮) \r\n#মেড ইন বাংলাদেশ', '', 200, 550, 220, 330, 10, 1, 1, '', '2017-02-04 06:50:51', '0000-00-00 00:00:00', NULL, NULL),
(92, 8, 7, 10, 9, 'Heavy Bass Wired Headphone ', 'হেভি বেজ ওয়্যার্ড হেডফোন', 'Heavy-Bass-Wired-Headphone-', 100034, 'মডেল: CONIEEN CT-737 \r\n#হেডসেট ড্রাইভার ইউনিট: 30mm \r\n#পাওয়ার: Max 30mW \r\n#ইমপিডেন্স: 32Ω (1kHz) \r\n#সেনসিটিভিটি: 120dB/mW \r\n#নয়েজ রিডাকশন\r\n#মাইক্রফোন: 30Hz-16000Hz \r\n#কর্ড লেন্থ: 2.2m \r\n#3.5 mm জ্যাক ', 'মডেল: CONIEEN CT-737 \r\n#হেডসেট ড্রাইভার ইউনিট: 30mm \r\n#পাওয়ার: Max 30mW \r\n#ইমপিডেন্স: 32Ω (1kHz) \r\n#সেনসিটিভিটি: 120dB/mW \r\n#নয়েজ রিডাকশন\r\n#মাইক্রফোন: 30Hz-16000Hz \r\n#কর্ড লেন্থ: 2.2m \r\n#3.5 mm জ্যাক ', '', 5, 700, 210, 490, 10, 3, 1, '', '2017-02-16 03:00:59', '0000-00-00 00:00:00', NULL, NULL),
(93, 8, 7, 10, 0, 'Super Strength Headphone', 'সুপার স্ট্রেন্থ হেডফোন', 'Super-Strength-Headphone', 100035, ' মডেল: RAOOP R-310 \r\n#হেডসেট ড্রাইভার ইউনিট: 30mm \r\n#পাওয়ার: Max 30 mW \r\n#ইমপিডেন্স: 32Ω (1kHz) \r\n#সেনসিটিভিটি: 120dB/mW \r\n#নয়েজ রিডাকশন\r\n#মাইক্রফোন: 30Hz-16000Hz \r\n#কর্ড লেন্থ: 2 m \r\n#3.5 mm জ্যাক ', ' মডেল: RAOOP R-310 \r\n#হেডসেট ড্রাইভার ইউনিট: 30mm \r\n#পাওয়ার: Max 30 mW \r\n#ইমপিডেন্স: 32Ω (1kHz) \r\n#সেনসিটিভিটি: 120dB/mW \r\n#নয়েজ রিডাকশন\r\n#মাইক্রফোন: 30Hz-16000Hz \r\n#কর্ড লেন্থ: 2 m \r\n#3.5 mm জ্যাক ', '', 5, 500, 210, 290, 10, 1, 3, '', '2017-02-16 03:11:46', '0000-00-00 00:00:00', NULL, NULL),
(94, 8, 8, 9, 34, 'SAMSUNG 8gb Memory Card', 'SAMSUNG ৮ জিবি মেমোরী কার্ড', 'SAMSUNG-8gb-Memory-Card', 100036, 'ব্র্যান্ডঃ Samsung \r\n#স্টোরেজ ক্যাপাসিটি: ৮ জিবি \r\n#টাইপঃ Micro SD Card\r\n#ক্লাস: 10 \r\n#হাই স্পিড সিরিজ \r\n#24MB রিড স্পিড & 13MB রাইট স্পিড\r\n#১ বছরের ওয়ারেন্টি', 'ব্র্যান্ডঃ Samsung \r\n#স্টোরেজ ক্যাপাসিটি: ৮ জিবি \r\n#টাইপঃ Micro SD Card\r\n#ক্লাস: 10 \r\n#হাই স্পিড সিরিজ \r\n#24MB রিড স্পিড & 13MB রাইট স্পিড\r\n#১ বছরের ওয়ারেন্টি', '', 50, 450, 160, 290, 10, 1, 1, '', '2017-02-16 03:37:34', '0000-00-00 00:00:00', NULL, NULL),
(95, 8, 8, 9, 34, 'SAMSUNG 16gb Memory Card', 'SAMSUNG ১৬ জিবি মেমোরী কার্ড', 'SAMSUNG-16gb-Memory-Card', 100037, 'ব্র্যান্ডঃ Samsung \r\n#স্টোরেজ ক্যাপাসিটি: ১৬ জিবি \r\n#টাইপঃ Micro SD Card\r\n#ক্লাস: 10 \r\n#হাই স্পিড সিরিজ \r\n#24MB রিড স্পিড & 13MB রাইট স্পিড\r\n#১ বছরের ওয়ারেন্টি', 'ব্র্যান্ডঃ Samsung \r\n#স্টোরেজ ক্যাপাসিটি: ১৬ জিবি \r\n#টাইপঃ Micro SD Card\r\n#ক্লাস: 10 \r\n#হাই স্পিড সিরিজ \r\n#24MB রিড স্পিড & 13MB রাইট স্পিড\r\n#১ বছরের ওয়ারেন্টি', '', 50, 600, 150, 450, 10, 3, 1, '', '2017-02-16 03:42:08', '0000-00-00 00:00:00', NULL, NULL),
(96, 8, 8, 9, 34, 'SAMSUNG 32gb Memory Card', 'SAMSUNG ৩২ জিবি মেমোরী কার্ড', 'SAMSUNG-৩২-জিবি-মেমোরী-কার্ড', 100038, 'ব্র্যান্ডঃ Samsung \r\n#স্টোরেজ ক্যাপাসিটি: ৩২ জিবি \r\n#টাইপঃ Micro SD Card\r\n#ক্লাস: 10 \r\n#হাই স্পিড সিরিজ \r\n#24MB রিড স্পিড & 13MB রাইট স্পিড\r\n#১ বছরের ওয়ারেন্টি', 'ব্র্যান্ডঃ Samsung \r\n#স্টোরেজ ক্যাপাসিটি: ৩২ জিবি \r\n#টাইপঃ Micro SD Card\r\n#ক্লাস: 10 \r\n#হাই স্পিড সিরিজ \r\n#24MB রিড স্পিড & 13MB রাইট স্পিড\r\n#১ বছরের ওয়ারেন্টি', '', 20, 950, 170, 780, 10, 1, 1, '', '2017-02-16 03:55:14', '0000-00-00 00:00:00', NULL, NULL),
(97, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধুপিয়ান সিল্ক শাড়ি', 'Dupian-Silk-Sharee', 100039, '#ধুপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', '#ধুপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', '', 33, 2500, 700, 1800, 10, 1, 0, '', '2017-02-17 01:21:09', '0000-00-00 00:00:00', NULL, NULL),
(98, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধুপিয়ান সিল্ক শাড়ি', 'Dupian-Silk-Sharee', 100040, '#ধুপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '#ধুপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 22, 2200, 1210, 990, 10, 1, 1, '', '2017-02-17 01:22:51', '0000-00-00 00:00:00', NULL, NULL),
(99, 7, 6, 19, 19, 'Silk Katan Sharee', 'সিল্ক কাতান শাড়ি', 'Silk-Katan-Sharee', 100041, '#সিল্ক কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '#সিল্ক কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 23, 2500, 950, 1550, 10, 1, 1, '', '2017-02-17 01:24:58', '0000-00-00 00:00:00', NULL, NULL),
(100, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dupian-Silk-Sharee', 100042, '#ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', '#ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', '', 66, 4500, 750, 3750, 10, 1, 1, '', '2017-02-17 01:27:04', '0000-00-00 00:00:00', NULL, NULL),
(101, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি ', 'ধূপিয়ান-সিল্ক-শাড়ি', 100043, '#ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '#ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 22, 4600, 800, 3800, 10, 1, 1, '', '2017-02-17 01:34:03', '0000-00-00 00:00:00', NULL, NULL),
(102, 7, 6, 19, 16, 'Mirpur Silk Jamdani Sharee', 'মিপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Jamdani-Sharee', 100044, '#মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '#মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 25, 2600, 800, 1800, 10, 1, 1, '', '2017-02-17 01:49:34', '0000-00-00 00:00:00', NULL, NULL),
(103, 7, 6, 19, 19, 'Mirpur Opera Katan Sharee', 'মিরপুর ওপেরা কাতান শাড়ি', 'Mirpur-Opera-Katan-Sharee', 100045, '#মিরপুর ওপেরা কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '#মিরপুর ওপেরা কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 22, 3400, 900, 2500, 10, 1, 1, '', '2017-02-17 01:52:52', '0000-00-00 00:00:00', NULL, NULL),
(104, 7, 6, 19, 15, 'Tangail Half Silk Cotton Sharee', 'টাঙ্গাইল হাফ সিল্ক কটন শাড়ি', 'Tangail-Half-Silk-Sharee', 100046, 'টাঙ্গাইল হাফ সিল্ক শাড়ী\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'টাঙ্গাইল হাফ সিল্ক শাড়ী\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 55, 2500, 1050, 1450, 10, 1, 1, '', '2017-02-17 01:55:12', '0000-00-00 00:00:00', NULL, NULL),
(105, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dupian-Silk-Sharee', 100047, 'ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 55, 2800, 647, 2150, 10, 1, 1, '', '2017-02-17 02:00:08', '0000-00-00 00:00:00', NULL, NULL),
(106, 7, 6, 19, 16, 'Silk Katan Sharee', 'সিল্ক কাতান শাড়ী', 'Silk-Katan-Sharee', 100048, 'সিল্ক কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'সিল্ক কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 44, 2400, 950, 1450, 10, 1, 1, '', '2017-02-17 02:15:13', '0000-00-00 00:00:00', NULL, NULL),
(107, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ী', 'Dupian-Silk-Sharee', 100049, 'ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 20, 2800, 610, 2190, 10, 1, 1, '', '2017-02-17 02:17:11', '0000-00-00 00:00:00', NULL, NULL),
(108, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dupian-Silk-Sharee', 100050, 'ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'ধূপিয়ান সিল্ক শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 44, 2800, 1000, 1800, 10, 1, 1, '', '2017-02-17 02:19:46', '0000-00-00 00:00:00', NULL, NULL),
(109, 7, 6, 19, 16, 'Mirpur Silk Jamdani Sharee', 'মিরপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Jamdani-Sharee', 100051, 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 52, 2600, 800, 1800, 10, 1, 1, '', '2017-02-17 02:26:46', '0000-00-00 00:00:00', NULL, NULL),
(110, 7, 6, 19, 17, 'Mirpur Silk jamdani Sharee', 'মিরপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-jamdani-Sharee', 100052, 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 10, 2500, 716, 1780, 10, 1, 1, '', '2017-02-17 02:36:11', '0000-00-00 00:00:00', NULL, NULL),
(111, 7, 6, 19, 16, 'Mirpur Silk Jamdani Sharee', 'মিপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Jamdani-Sharee', 100053, 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 22, 2500, 600, 1900, 10, 1, 1, '', '2017-02-17 02:38:15', '0000-00-00 00:00:00', NULL, NULL),
(112, 7, 6, 19, 17, 'Mirpur Silk Jamdani Sharee', 'মিরপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Jamdani-Sharee', 100054, 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 55, 2500, 750, 1750, 10, 1, 1, '', '2017-02-17 02:45:25', '0000-00-00 00:00:00', NULL, NULL),
(113, 7, 6, 19, 17, 'Mirpur Silk Jamdani Sharee', 'মিরপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Jamdani-Sharee', 100055, 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 44, 2100, 1010, 1090, 10, 1, 1, '', '2017-02-17 02:49:13', '0000-00-00 00:00:00', NULL, NULL),
(114, 7, 6, 19, 17, 'Mirpur Silk Jamdani Sharee', 'মিরপুর সিল্ক জামদানী শাড়ী', 'Mirpur-Silk-Jamdani-Sharee', 100056, 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n#নজরকাড়া ডিজাইন', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 55, 2500, 1310, 1190, 10, 1, 1, '', '2017-02-17 04:40:30', '0000-00-00 00:00:00', NULL, NULL),
(115, 10, 7, 36, 0, 'Desktop computer & monitor', 'Desktop computer & monitor', 'Desktop-computer-&-monitor', 100057, 'Dual core pc processor 2.50GH\r\nRAM 2GB\r\nHDD80GB\r\nNew motherboard\r\nCasing\r\nCuller\r\nPower supply\r\nMonitor 17’’\r\nVGA\r\nAC cot\r\nKeyboard\r\nMouse\r\nSpeaker\r\n', 'Dual core pc processor 2.50GH\r\nRAM 2GB\r\nHDD80GB\r\nNew motherboard\r\nCasing\r\nCuller\r\nPower supply\r\nMonitor 17’’\r\nVGA\r\nAC cot\r\nKeyboard\r\nMouse\r\nSpeaker\r\n', '', 10, 13000, 5, 12000, 0, 1, 1, '', '2017-02-22 07:20:02', '0000-00-00 00:00:00', NULL, NULL),
(116, 10, 7, 38, 0, 'Desktop computer & monitor', 'Desktop computer & monitor', 'Desktop-computer-&-monitor', 100058, 'Intel Processor Core i3, 4th generation\r\n#RAM 4 GB\r\n#HDD 1 TB\r\n#Intel Motherboard\r\n#Power supply\r\n#Monitor 19’’\r\n#VGA\r\n#AC cot\r\n#Keyboard\r\n#Mouse\r\n#Speaker\r\n', 'Intel Processor Core i3, 4th generation\r\n#RAM 4 GB\r\n#HDD 1 TB\r\n#Intel Motherboard\r\n#Power supply\r\n#Monitor 19’’\r\n#VGA\r\n#AC cot\r\n#Keyboard\r\n#Mouse\r\n#Speaker\r\n', '', 10, 35000, 3000, 32000, 5, 1, 1, '', '2017-02-22 07:31:17', '0000-00-00 00:00:00', NULL, NULL),
(117, 10, 14, 41, 0, 'Android TV mother board', 'Android TV mother board', 'Android-TV-mother-board', 100059, 'USB,HDMI,WiFi,broadband connection, External Mamore, Android app, Internet use     ', 'USB,HDMI,WiFi,broadband connection, External Mamore, Android app, Internet use     ', '', 10, 5000, 5, 4500, 0, 1, 1, '', '2017-02-22 07:37:46', '0000-00-00 00:00:00', NULL, NULL),
(118, 10, 14, 41, 0, 'All in one TV mother board', 'All in one TV mother board', 'All-in-one-TV-mother-board', 100060, 'TV mother board \r\n# 19 to 32 tv supported mother board.\r\n# High quality equipment\'s. ', 'TV mother board \r\n# 19 to 32 tv supported mother board.\r\n# High quality equipment\'s. ', '', 10, 3500, 5, 3000, 0, 1, 1, '', '2017-02-22 07:40:59', '0000-00-00 00:00:00', NULL, NULL),
(119, 10, 14, 41, 0, 'TV mother board', 'TV mother board', 'China-sony-samsung-LG-TV-mother-board', 100061, 'TV mother board. \r\n#Sony Samsung LG china \r\n#Original remote supported  ', 'TV mother board. \r\n#Sony Samsung LG china \r\n#Original remote supported  ', '', 20, 1500, 100, 1400, 10, 1, 1, '', '2017-02-22 07:48:46', '0000-00-00 00:00:00', NULL, NULL),
(120, 10, 14, 41, 0, 'TV mother board', 'TV mother board', 'TV-mother-board', 100062, '# Any china/Branded TV supported.\r\n# Update Version.\r\n# High quality components.\r\n# All equipment is strongest adjust.   ', '# Any china/Branded TV supported.\r\n# Update Version.\r\n# High quality components.\r\n# All equipment is strongest adjust.   ', '', 1000, 1000, 150, 850, 10, 1, 1, '', '2017-02-22 07:57:57', '0000-00-00 00:00:00', NULL, NULL),
(121, 10, 14, 41, 0, 'Monitor mother board', 'Monitor mother board', 'monitor-mother-board', 100063, 'monitor mother board \r\n# all panel support\r\n# high quality\r\n', 'monitor mother board \r\n# all panel support\r\n# high quality\r\n', '', 1000, 500, 120, 380, 10, 1, 1, '', '2017-02-22 08:00:58', '0000-00-00 00:00:00', NULL, NULL),
(122, 10, 14, 41, 0, 'TV programmer ', 'TV programmer ', 'TV-programmer-', 100064, 'All IC & TV mother board Programmer ', 'All IC & TV mother board Programmer ', '', 10, 9000, 1500, 7500, 5, 1, 1, '', '2017-02-22 08:02:39', '0000-00-00 00:00:00', NULL, NULL),
(123, 10, 14, 31, 0, 'LED chaker', 'LED chaker', 'LED-chaker', 100065, 'All LED TV chaker  (digital)', 'All LED TV chaker  (digital)', '', 10, 3500, 5, 3000, 0, 1, 0, '', '2017-02-22 08:05:17', '0000-00-00 00:00:00', NULL, NULL),
(124, 10, 14, 41, 0, 'LED inverter', 'LED inverter', 'LED-inverter', 100066, 'TV LED inverter', 'TV LED inverter', '', 1000, 250, 60, 190, 15, 1, 1, '', '2017-02-22 08:07:41', '0000-00-00 00:00:00', NULL, NULL),
(125, 10, 14, 41, 0, 'LCD 4 lamp inverter', 'LCD 4 lamp inverter', 'LCD-4-lamp-inverter', 100067, 'LCD 4 lamp inverter', 'LCD 4 lamp inverter', '', 1000, 350, 60, 290, 15, 1, 1, '', '2017-02-22 08:10:24', '0000-00-00 00:00:00', NULL, NULL),
(126, 10, 14, 41, 0, 'LCD 2 Lamp inverter', 'LCD 2 Lamp inverter', 'LCD-2-Lamp-inverter', 100068, 'LCD 2 Lamp inverter', 'LCD 2 Lamp inverter', '', 1000, 250, 51, 199, 14, 1, 1, '', '2017-02-22 08:11:52', '0000-00-00 00:00:00', NULL, NULL),
(127, 10, 9, 37, 0, '32\'\' LED TV', '32\'\' LED TV', '32\'\'-LED-TV', 100069, '32\'\' LED TV\r\n#Key Features\r\n#Screen Size: 32″\r\n#Display Resolution WXGA\r\n#Motionflow™ Motionflow XR 100Hz (for Philippine XR 120Hz)\r\n#Backlight Module Direct LED\r\n#Dimming Type Frame Dimming\r\n#Live Colour™\r\n# 1 year Service Warranty.', '32\'\' LED TV\r\n#Key Features\r\n#Screen Size: 32″\r\n#Display Resolution WXGA\r\n#Motionflow™ Motionflow XR 100Hz (for Philippine XR 120Hz)\r\n#Backlight Module Direct LED\r\n#Dimming Type Frame Dimming\r\n#Live Colour™\r\n# 1 year Service Warranty.', '', 20, 20000, 5001, 14999, 5, 3, 1, '', '2017-02-22 08:54:26', '0000-00-00 00:00:00', NULL, NULL),
(128, 7, 6, 19, 17, 'Mirpur Silk Jamdani Sharee', 'মিরপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Jamdani-Sharee', 100070, 'Mirpur Silk Jamdani Sharee\r\n# Fabrics: Silk Jamdani\r\n# Attractive design\r\n# Fashionable.\r\n# Smoth & Weightless \r\n# With matching un-stiched blouse piece', '# মিরপুর সিল্ক জামদানী শাড়ি\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# নজরকাড়া ডিজাইন\r\n', '', 50, 2400, 709, 1690, 25, 1, 1, '', '2017-02-27 08:06:43', '0000-00-00 00:00:00', NULL, NULL),
(129, 7, 6, 19, 17, 'Mirpur Silk Jamdani Sharee', 'মিরপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Jamdani-Sharee', 100071, 'Mirpur Silk Jamdani Sharee\r\n# Fabrics: Silk Jamdani\r\n# Attractive design\r\n# Fashionable.\r\n# Smoth & Weightless \r\n# With matching un-stiched blouse piece\r\n', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n# ফেব্রিক: সিল্ক কটন\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 2400, 650, 1750, 25, 1, 1, '', '2017-02-27 09:49:00', '0000-00-00 00:00:00', NULL, NULL),
(130, 7, 6, 19, 16, 'Half Silk Sharee', 'হাফ সিল্ক শাড়ি', 'Half-Silk-Sharee', 100072, 'Half Silk Sharee\r\n# Fabrics: Half Silk\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n# ফেব্রিক: হাফ সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন\r\n', '', 30, 2400, 1150, 1250, 25, 1, 1, '', '2017-02-27 09:54:59', '0000-00-00 00:00:00', NULL, NULL),
(131, 7, 6, 19, 16, 'Half Silk Sharee', 'হাফ সিল্ক শাড়ি', 'Half-Silk-Sharee', 100073, 'Half Silk Sharee\r\n# Fabrics: Half Silk\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n# ফেব্রিক: হাফ সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 2400, 1120, 1280, 25, 1, 1, '', '2017-02-27 09:58:25', '0000-00-00 00:00:00', NULL, NULL),
(132, 7, 6, 19, 19, 'Mirpur Silk Katan Sharee', 'মিরপুর সিল্ক জামদানী শাড়ি', 'Mirpur-Silk-Katan-Sharee', 100074, 'Mirpur Silk Katan Sharee\r\n# Fabrics: Silk Katan\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'মিরপুর সিল্ক জামদানী শাড়ি\r\n# ফেব্রিক: সিল্ক কটন\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 2400, 600, 1800, 25, 1, 1, '', '2017-02-27 10:02:57', '0000-00-00 00:00:00', NULL, NULL),
(133, 7, 6, 19, 16, 'Half Silk Sharee', 'হাফ সিল্ক শাড়ি', 'Half-Silk-Sharee', 100075, 'Half Silk Sharee\r\n# Fabrics: Half Silk\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'হাফ সিল্ক শাড়ি\r\n# ফেব্রিক: হাফ সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 2400, 600, 1800, 25, 1, 1, '', '2017-02-27 10:26:04', '0000-00-00 00:00:00', NULL, NULL),
(134, 10, 9, 37, 0, '17\'\' LED TV', '17\'\' LED TV', '17\'\'-LED-TV', 100076, 'Display Size: 17\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (680x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', 'Display Size: 17\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (680x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', '', 10, 6000, 5, 5500, 0, 1, 1, '', '2017-02-27 03:18:03', '0000-00-00 00:00:00', NULL, NULL),
(135, 10, 9, 37, 0, '19\'\' LED TV', '19\'\' LED TV', '19\'\'-LED-TV', 100077, '19\'\' LED TV, USB, HDMI, Audio IN. Audio out,VGA,AV', '19\'\' LED TV, USB, HDMI, Audio IN. Audio out,VGA,AV', '', 10, 8000, 1500, 6500, 5, 3, 0, '', '2017-02-27 03:21:33', '0000-00-00 00:00:00', NULL, NULL),
(136, 10, 9, 37, 0, '20\'\'LED TV', '20\'\'LED TV', '20\'\'LED-TV', 100078, 'Display Size: 20\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (7800 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', 'Display Size: 20\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (7800 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', '', 10, 8000, 5, 7500, 0, 1, 1, '', '2017-02-27 03:28:53', '0000-00-00 00:00:00', NULL, NULL),
(137, 10, 9, 37, 0, '22\'\' LED TV', '22\'\' LED TV', '22\'\'-LED-TV', 100079, 'Display Size: 22\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (7800 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', 'Display Size: 22\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (7800 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', '', 10, 12000, 3500, 8500, 5, 2, 1, '', '2017-02-27 03:30:50', '0000-00-00 00:00:00', NULL, NULL),
(138, 10, 7, 7, 0, '24\'\' LED TV', '24\'\' LED TV', '24\'\'-LED-TV', 100080, '24\'\'LED TV,HDMI, USB,Audio IN, Audio out,AV ', '24\'\'LED TV,HDMI, USB,Audio IN, Audio out,AV ', '', 10, 10000, 5, 9500, 0, 1, 0, '', '2017-02-27 03:33:01', '0000-00-00 00:00:00', NULL, NULL),
(139, 10, 7, 7, 0, '32\'\' LED TV', '32\'\' LED TV', '32\'\'-LED-TV', 100081, '32\'\'LED TV,HDMI, USB,Audio IN, Audio out,AV', '32\'\'LED TV,HDMI, USB,Audio IN, Audio out,AV', '', 10, 15000, 3, 14500, 0, 1, 0, '', '2017-02-27 03:35:09', '0000-00-00 00:00:00', NULL, NULL),
(140, 10, 9, 37, 0, '40\'\' LED TV', '40\'\' LED TV', '40\'\'-LED-TV', 100082, 'Display Size: 40\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (1920 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', 'Display Size: 40\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (1920 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', '', 10, 27000, 5100, 21900, 5, 1, 1, '', '2017-02-27 03:38:03', '0000-00-00 00:00:00', NULL, NULL),
(141, 10, 9, 37, 0, '42\'\' LED TV', '42\'\' LED TV', '42\'\'-LED-TV', 100083, 'Display Size: 42\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (1920 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', 'Display Size: 42\"\r\n#Display Type: Full HD LED TV\r\n#Integrated Receiver Digital TV DVB- T2\r\n#Resolution: Full HD (1920 x 1080px)\r\n#Brightness / Viewing Angle: 178/178\r\n#Dynamic Frequency MCI 100Hz / 50Hz TrueMotion', '', 10, 30000, 5100, 24900, 5, 1, 1, '', '2017-02-27 03:39:54', '0000-00-00 00:00:00', NULL, NULL),
(142, 10, 9, 37, 0, '50\'\' LED TV', '50\'\' LED TV', '50\'\'-LED-TV', 100084, '50\'\'LED TV,\r\n# HDMI, \r\n# USB,\r\n# Audio IN, \r\n# Audio out,\r\n# AV, \r\n# Internet', '50\'\'LED TV,\r\n# HDMI, \r\n# USB,\r\n# Audio IN, \r\n# Audio out,\r\n# AV, \r\n# Internet', '', 10, 48000, 3010, 44990, 5, 1, 1, '', '2017-02-27 03:42:47', '0000-00-00 00:00:00', NULL, NULL),
(143, 7, 6, 19, 17, 'Cut work Sharee', 'কাটওয়ার্ক শাড়ি', 'Katwork-Sharee', 100085, 'Cut work Sharee\r\n# Fabrics: Net. Aplic Work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'কাটওয়ার্ক শাড়ি\r\n# ফেব্রিক: নেট এপ্লিক ওয়ার্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন\r\n', '', 30, 4100, 600, 3500, 25, 1, 1, '', '2017-02-28 05:17:05', '0000-00-00 00:00:00', NULL, NULL),
(144, 7, 6, 19, 17, 'Cut work Sharee', 'কাটওয়ার্ক শাড়ি', 'Katword-Sharee', 100086, 'Cut work Sharee\r\n# Fabrics: Net. Aplic Work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'কাটওয়ার্ক শাড়ি\r\n# ফেব্রিক: নেট এপ্লিক ওয়ার্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 4100, 600, 3500, 25, 1, 1, '', '2017-02-28 05:23:52', '0000-00-00 00:00:00', NULL, NULL),
(145, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100087, 'Dupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 30, 3300, 600, 2700, 25, 1, 1, '', '2017-02-28 05:33:59', '0000-00-00 00:00:00', NULL, NULL),
(146, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100088, 'Dupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 3300, 600, 2700, 25, 1, 1, '', '2017-02-28 05:47:25', '0000-00-00 00:00:00', NULL, NULL),
(147, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dupian-Silk-Sharee', 100089, 'Dupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 30, 3300, 600, 2700, 25, 1, 1, '', '2017-02-28 05:51:30', '0000-00-00 00:00:00', NULL, NULL),
(148, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100090, 'Dupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 30, 3300, 600, 2700, 25, 1, 1, '', '2017-02-28 05:55:50', '0000-00-00 00:00:00', NULL, NULL),
(149, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100091, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 30, 3300, 600, 2700, 25, 1, 1, '', '2017-02-28 05:59:56', '0000-00-00 00:00:00', NULL, NULL),
(150, 7, 6, 19, 16, 'Dhupian Silk Shareee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Shareee', 100092, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 30, 3300, 600, 2700, 25, 1, 1, '', '2017-02-28 06:03:52', '0000-00-00 00:00:00', NULL, NULL),
(151, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100093, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন\r\n', '', 30, 3300, 600, 2700, 25, 1, 1, '', '2017-02-28 06:16:35', '0000-00-00 00:00:00', NULL, NULL),
(152, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100094, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Embroidery work\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 2900, 600, 2300, 25, 1, 1, '', '2017-02-28 07:04:22', '0000-00-00 00:00:00', NULL, NULL),
(153, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100095, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 2900, 600, 2300, 25, 1, 1, '', '2017-02-28 07:08:57', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO `products` (`product_id`, `merchant_id`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `product_name_lang1`, `product_name_lang2`, `slug`, `product_code`, `details_lang1`, `details_lang2`, `refund_policy`, `quantity`, `market_price`, `discount`, `sale_price`, `commission`, `placement_type`, `status`, `comments`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(154, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100096, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 30, 2900, 600, 2300, 25, 3, 1, '', '2017-02-28 07:14:15', '0000-00-00 00:00:00', NULL, NULL),
(155, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100097, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n# সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 3400, 600, 2800, 25, 1, 1, '', '2017-02-28 07:19:38', '0000-00-00 00:00:00', NULL, NULL),
(156, 7, 6, 19, 16, 'Dhupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ি', 'Dhupian-Silk-Sharee', 100098, 'Dhupian Silk Sharee\r\n# Fabrics: Dupian Silk\r\n# Attractive design\r\n# Fashionable.\r\n# With matching un-stiched blouse piece\r\n', 'ধূপিয়ান সিল্ক শাড়ি\r\n# ফেব্রিক: ধূপিয়ান সিল্ক\r\n সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n# হ্যান্ড এমব্রয়ডারী এবং অ্যাপ্লিক এর কাজ করা\r\n# নজরকাড়া ডিজাইন\r\n', '', 30, 2900, 600, 2300, 25, 1, 1, '', '2017-02-28 07:24:58', '0000-00-00 00:00:00', NULL, NULL),
(300, 8, 17, 55, 0, 'LED Mashroom Light', 'LED মাশরুম লাইট', 'LED-Mashroom-Light', 100242, 'মাশরুম আকৃতির ফ্যাশনেবল ড্রীম লাইট\r\n#রাতের আঁধারে কিছুক্ষন পর পর রংধনুর ৭ টি আলোয় তৈরি হবে এক রোমান্টিক স্বপ্নীল আবেশ \r\n#একদিকে হবে সৌন্দর্য বর্ধন অন্যদিকে হবে ড্রীম লাইটের কাজ \r\n#লাইট সেন্সিং এনার্জিং সেভিং ডিজাইন \r\n#সন্ধ্যা হলে আলো জ্বলবে, ভোর হলে আলো নিভে যাবে\r\n#প্ল্যাগ এন্ড প্লে \r\n#সেন্সর ছাড়াও রয়েছে সুইচিং সিস্টেম যা ইচ্ছামত অন/অফ করা যায় \r\n#সাইজ: ১৬x৫ সে.মি', 'মাশরুম আকৃতির ফ্যাশনেবল ড্রীম লাইট\r\n#রাতের আঁধারে কিছুক্ষন পর পর রংধনুর ৭ টি আলোয় তৈরি হবে এক রোমান্টিক স্বপ্নীল আবেশ \r\n#একদিকে হবে সৌন্দর্য বর্ধন অন্যদিকে হবে ড্রীম লাইটের কাজ \r\n#লাইট সেন্সিং এনার্জিং সেভিং ডিজাইন \r\n#সন্ধ্যা হলে আলো জ্বলবে, ভোর হলে আলো নিভে যাবে\r\n#প্ল্যাগ এন্ড প্লে \r\n#সেন্সর ছাড়াও রয়েছে সুইচিং সিস্টেম যা ইচ্ছামত অন/অফ করা যায় \r\n#সাইজ: ১৬x৫ সে.মি', '', 222, 350, 251, 99, 10, 1, 1, '', '2017-03-05 04:39:15', '0000-00-00 00:00:00', NULL, NULL),
(301, 8, 9, 44, 0, '2 in 1 Solar Lamp Cum Power Bank', '2 in 1 সোলার ল্যাম্প কাম পাওয়ার ব্যাংক', '2-in-1-সোলার-ল্যাম্প-কাম-পাওয়ার-ব্যাংক', 100243, 'LED সোলার ল্যাম্প কাম পাওয়ার ব্যাংক\r\n# টেবিল ল্যাম্প এবং টর্চ লাইট দুভাবেই ব্যবহার করা যাবে\r\n# যে কোন ফোন মিনিমাম একবার চার্জ করা যাবে\r\n# একটানা ৫ ঘন্টা (প্রায়) জ্বলে\r\n# সূর্যের আলো এবং ইলেকট্রিসিটি দিয়ে চার্জ করা যাবে\r\n# রিচার্জেবল চার্জিং টাইমঃ ২ ঘন্টা\r\n# সহজে ব্যবহার এবং বহনযোগ্য', 'LED সোলার ল্যাম্প কাম পাওয়ার ব্যাংক\r\n# টেবিল ল্যাম্প এবং টর্চ লাইট দুভাবেই ব্যবহার করা যাবে\r\n# যে কোন ফোন মিনিমাম একবার চার্জ করা যাবে\r\n# একটানা ৫ ঘন্টা (প্রায়) জ্বলে\r\n# সূর্যের আলো এবং ইলেকট্রিসিটি দিয়ে চার্জ করা যাবে\r\n# রিচার্জেবল চার্জিং টাইমঃ ২ ঘন্টা\r\n# সহজে ব্যবহার এবং বহনযোগ্য', '', 50, 700, 307, 390, 10, 3, 1, '', '2017-03-06 07:26:22', '0000-00-00 00:00:00', NULL, NULL),
(302, 8, 17, 55, 0, 'SONY স্টেরিও হেডফোন', 'SONY স্টেরিও হেডফোন', 'SONY-স্টেরিও-হেডফোন-রেপ্লিকা', 100244, 'রেপ্লিকা প্রোডাক্ট\r\n# মানসম্মত সাউন্ড সিস্টেম ও বীট যা কানের কোন ক্ষতি করে না\r\n# টেকসই ও মজবুত তার, যা অত্যাধিক সফট ও কোমল\r\n# হাই কোয়ালিটি সাউন্ড সিস্টেম\r\n# আকর্ষণীয় ডিজাইন\r\n# কালারঃ সাদা, কালো, নীল\r\n# ১ বছরের ওয়ারেন্টি', 'রেপ্লিকা প্রোডাক্ট\r\n# মানসম্মত সাউন্ড সিস্টেম ও বীট যা কানের কোন ক্ষতি করে না\r\n# টেকসই ও মজবুত তার, যা অত্যাধিক সফট ও কোমল\r\n# হাই কোয়ালিটি সাউন্ড সিস্টেম\r\n# আকর্ষণীয় ডিজাইন\r\n# কালারঃ সাদা, কালো, নীল\r\n# ১ বছরের ওয়ারেন্টি', '', 100, 400, 301, 99, 10, 1, 3, '', '2017-03-06 07:30:33', '0000-00-00 00:00:00', NULL, NULL),
(303, 8, 9, 45, 0, 'High Base Bluetooth Sound System', 'ব্লুটুথ স্পিকার উইথ FM রেডিও', 'ব্লুটুথ-স্পিকার-উইথ-FM-রেডিও', 100245, 'মডেলঃ WS-2517BT\r\n# ব্লুটুথ ভার্সনঃ 3.1\r\n# ট্রান্সমিশন রেটঃ ১০ মিটার\r\n# যে কোন ধরনের ব্লুটুথ ডিভাইসের সাথে কম্প্যাটিবল\r\n# হ্যান্ডস ফ্রি ফোন\r\n# TF কার্ড মিউজিক প্লেব্যাক\r\n# FM রেডিও\r\n# AUX ইন ফাংশন, প্লে মিউজিক ফ্রম MP3,PC অথবা মোবাইল\r\n# ফ্রিকুয়েন্সিঃ FM: 20-20kHZ\r\n# ইউনিট সাইজঃ 21*5.5*8 cm', 'মডেলঃ WS-2517BT\r\n# ব্লুটুথ ভার্সনঃ 3.1\r\n# ট্রান্সমিশন রেটঃ ১০ মিটার\r\n# যে কোন ধরনের ব্লুটুথ ডিভাইসের সাথে কম্প্যাটিবল\r\n# হ্যান্ডস ফ্রি ফোন\r\n# TF কার্ড মিউজিক প্লেব্যাক\r\n# FM রেডিও\r\n# AUX ইন ফাংশন, প্লে মিউজিক ফ্রম MP3,PC অথবা মোবাইল\r\n# ফ্রিকুয়েন্সিঃ FM: 20-20kHZ\r\n# ইউনিট সাইজঃ 21*5.5*8 cm', '', 50, 2200, 1110, 1090, 10, 2, 1, '', '2017-03-06 07:35:47', '0000-00-00 00:00:00', NULL, NULL),
(304, 8, 14, 46, 0, 'Metal Soldering Stand ', 'মেটাল শোল্ডারিং স্ট্যান্ড', 'শোল্ডারিং-স্ট্যান্ডিং-উইথ-ম্যাগনিফায়ার', 100246, 'স্ট্যান্ডার্ড সোল্ডারিং আয়রণ স্ট্যান্ড\r\n#ম্যাটেরিয়াল: মেটাল\r\n#এলিপটিকাল শেপড\r\n#এরগোনমিক ডিজাইন\r\n#সুপার স্লিক এন্ড ডিউর‍্যাবল\r\n#হাই কোয়ালিটি প্রোডাক্ট\"', 'স্ট্যান্ডার্ড সোল্ডারিং আয়রণ স্ট্যান্ড\r\n#ম্যাটেরিয়াল: মেটাল\r\n#এলিপটিকাল শেপড\r\n#এরগোনমিক ডিজাইন\r\n#সুপার স্লিক এন্ড ডিউর‍্যাবল\r\n#হাই কোয়ালিটি প্রোডাক্ট\"', '', 50, 300, 110, 190, 10, 1, 1, '', '2017-03-06 07:40:06', '0000-00-00 00:00:00', NULL, NULL),
(305, 8, 17, 55, 0, 'LED Party Light', 'LED কালার চেঞ্জিং বাল্ব', 'LED-কালার-চেঞ্জিং-বাল্ব', 100247, 'LED কালার চেঞ্জিং বাল্ব\r\n# ডিস্কো, বলরুম, স্টেজ ফাংশন, পার্টির জন্য মানানসই\r\n# ম্যাটেরিয়ালঃ প্লাস্টিক\r\n# এনার্জি সেভিং ও পরিবেশবান্ধব\r\n# LED কালার: RGB (লাল, সবুজ, নীল)\r\n# পাওয়ার: 3W\r\n# ইনপুট ভোল্টেজ: (85-260V) 50/60Hz.', 'LED কালার চেঞ্জিং বাল্ব\r\n# ডিস্কো, বলরুম, স্টেজ ফাংশন, পার্টির জন্য মানানসই\r\n# ম্যাটেরিয়ালঃ প্লাস্টিক\r\n# এনার্জি সেভিং ও পরিবেশবান্ধব\r\n# LED কালার: RGB (লাল, সবুজ, নীল)\r\n# পাওয়ার: 3W\r\n# ইনপুট ভোল্টেজ: (85-260V) 50/60Hz.', '', 100, 300, 201, 99, 10, 1, 1, '', '2017-03-06 07:43:58', '0000-00-00 00:00:00', NULL, NULL),
(306, 8, 9, 35, 0, 'VR & Games Remote', 'VR & Games Remote', 'VR-বক্স-রিমোট', 100248, 'VR রিমোট ফর গেম এন্ড ডিসপ্লে কন্ট্রোলার\r\n# সাপোর্ট: Android/IOS স্মার্টফোন\r\n# গেমস সহ সকল প্রকার মুভি বা গান কন্ট্রোল করা যাবে\r\n# কালার: সাদা', 'VR রিমোট ফর গেম এন্ড ডিসপ্লে কন্ট্রোলার\r\n# সাপোর্ট: Android/IOS স্মার্টফোন\r\n# গেমস সহ সকল প্রকার মুভি বা গান কন্ট্রোল করা যাবে\r\n# কালার: সাদা', '', 50, 500, 150, 350, 10, 3, 1, '', '2017-03-06 07:48:44', '0000-00-00 00:00:00', NULL, NULL),
(307, 8, 17, 55, 0, 'LED Sports Watch', 'LED স্পোর্টস ওয়াচ', 'LED-স্পোর্টস-ওয়াচ-২টি', 100249, 'ডিসপ্লেঃ ডিজিটাল\r\n# স্ট্র্যাপ টাইপঃ সিলিকন বেল্ট\r\n# ওয়াচ কালারঃ ব্ল্যাক অ্যান্ড রেড\r\n# ডায়াল শেপঃ Rectangular\r\n# স্লিম ডিজাইন\r\n# অ্যাডজাস্টেবল বেল্ট', 'ডিসপ্লেঃ ডিজিটাল\r\n# স্ট্র্যাপ টাইপঃ সিলিকন বেল্ট\r\n# ওয়াচ কালারঃ ব্ল্যাক অ্যান্ড রেড\r\n# ডায়াল শেপঃ Rectangular\r\n# স্লিম ডিজাইন\r\n# অ্যাডজাস্টেবল বেল্ট', '', 100, 300, 201, 99, 10, 1, 1, '', '2017-03-06 07:54:50', '0000-00-00 00:00:00', NULL, NULL),
(308, 8, 9, 35, 0, 'Selfie Stand', 'সেলফি স্ট্যান্ড', 'সেলফি-স্ট্যান্ড-উইথ-রিমোট', 100250, 'Yunteng YT-228 মিনি ট্রাইপড স্ট্যান্ড\r\n# ম্যাটেরিয়াল: প্লাস্টিক+মেটাল+সিলিকা\r\n# ক্যামেরা ইন্টারফেস: ইউনিভার্সাল 1/4 স্ক্রু\r\n# সার্পোট ম্যাক্সিমাম ওয়েট: 0.5 কেজি\r\n# সার্পোটেড ডিভাইজ: মোবাইল ফোন, ক্যামো\r\n# লেন্থ: 18.5 সেমি.\r\n# 53mm থেকে 80mm সাইজ মোবাইল ফোনের জন্য প্রযোজ্য\r\n# প্যাকেজে আছে: ট্রাইপড, মোবাইল হোল্ডার এবং ব্লুটুথ ডিভাইস', 'Yunteng YT-228 মিনি ট্রাইপড স্ট্যান্ড\r\n# ম্যাটেরিয়াল: প্লাস্টিক+মেটাল+সিলিকা\r\n# ক্যামেরা ইন্টারফেস: ইউনিভার্সাল 1/4 স্ক্রু\r\n# সার্পোট ম্যাক্সিমাম ওয়েট: 0.5 কেজি\r\n# সার্পোটেড ডিভাইজ: মোবাইল ফোন, ক্যামো\r\n# লেন্থ: 18.5 সেমি.\r\n# 53mm থেকে 80mm সাইজ মোবাইল ফোনের জন্য প্রযোজ্য\r\n# প্যাকেজে আছে: ট্রাইপড, মোবাইল হোল্ডার এবং ব্লুটুথ ডিভাইস', '', 50, 500, 210, 290, 10, 1, 1, '', '2017-03-06 08:07:38', '0000-00-00 00:00:00', NULL, NULL),
(309, 8, 14, 49, 0, '4 Volume Amplifier Circuit', '4 Volume অ্যামপ্লিফায়ার সার্কিট', '4-Volume-অ্যামপ্লিফায়ার-সার্কিট', 100251, 'অধিকতর উন্নতমানের অডিও অ্যামপ্লিফায়ার\r\n# সাউন্ডে কোন প্রকার নয়েজ আসে না\r\n# ভলিয়ম সূক্ষভাবে বেস-ননবেস করা যাবে\r\n# উচ্চ বীটে ননস্টপ চলবে\r\n# উন্নতমানের ট্রানজিস্টর, আই,সি হওয়ায় পুড়ে যাওয়ার সম্ভাবনা নেই\r\n# ষ্ট্যাণ্ডার্ড সাউন্ড কোয়ালিটি\r\n# ভলিউম: 4 (four)', 'অধিকতর উন্নতমানের অডিও অ্যামপ্লিফায়ার\r\n# সাউন্ডে কোন প্রকার নয়েজ আসে না\r\n# ভলিয়ম সূক্ষভাবে বেস-ননবেস করা যাবে\r\n# উচ্চ বীটে ননস্টপ চলবে\r\n# উন্নতমানের ট্রানজিস্টর, আই,সি হওয়ায় পুড়ে যাওয়ার সম্ভাবনা নেই\r\n# ষ্ট্যাণ্ডার্ড সাউন্ড কোয়ালিটি\r\n# ভলিউম: 4 (four)', '', 50, 390, 0, 390, 10, 1, 1, '', '2017-03-06 08:14:54', '0000-00-00 00:00:00', NULL, NULL),
(310, 8, 17, 55, 0, 'জেন্টস ফেব্রিক স্ট্র্যাপ রিস্ট ওয়াচ', 'জেন্টস ফেব্রিক স্ট্র্যাপ রিস্ট ওয়াচ', 'জেন্টস-ফেব্রিক-স্ট্র্যাপ-রিস্ট-ওয়াচ', 100252, 'এনালগ ডিসপ্লে\r\n# বেল্ট ম্যাটেরিয়ালঃ ফেব্রিক\r\n# ডায়াল শেপঃ রাউন্ড\r\n# ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n# ডায়াল উইন্ডোঃ গ্লাস\r\n# ডেট ফাংশন\r\n# স্টাইলিশ ডিজাইন আধুনিকতার সাথে মানানসই', 'এনালগ ডিসপ্লে\r\n# বেল্ট ম্যাটেরিয়ালঃ ফেব্রিক\r\n# ডায়াল শেপঃ রাউন্ড\r\n# ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n# ডায়াল উইন্ডোঃ গ্লাস\r\n# ডেট ফাংশন\r\n# স্টাইলিশ ডিজাইন আধুনিকতার সাথে মানানসই', '', 100, 500, 401, 99, 10, 1, 3, '', '2017-03-06 08:18:23', '0000-00-00 00:00:00', NULL, NULL),
(311, 8, 13, 50, 0, 'NOVA 3 in 1 Electric Blender', '3-in-1 ইলেকট্রিক ব্লেন্ডার', '3-in-1-ইলেকট্রিক-ব্লেন্ডার', 100253, '3-in-1 ইলেকট্রিক ব্লেন্ডার\r\n# ক্যাপাসিটিঃ ১.৫ লিটার\r\n# পাওয়ারঃ ৩০০ ওয়াট\r\n# ব্র্যান্ড নিউ প্রোডাক্ট\r\n# হাই কোয়ালিটি প্রোডাক্ট', '3-in-1 ইলেকট্রিক ব্লেন্ডার\r\n# ক্যাপাসিটিঃ ১.৫ লিটার\r\n# পাওয়ারঃ ৩০০ ওয়াট\r\n# ব্র্যান্ড নিউ প্রোডাক্ট\r\n# হাই কোয়ালিটি প্রোডাক্ট', '', 50, 2000, 810, 1190, 10, 3, 1, '', '2017-03-06 08:21:52', '0000-00-00 00:00:00', NULL, NULL),
(312, 8, 8, 16, 0, 'Ladies Braclet Watch', 'লেডিস ব্রেসলেট ওয়াচ', 'মাশরুম-লাইট-(২-পিস)', 100254, 'লেডিস ব্রেসলেট ওয়াচ \r\n#ডিসপ্লেঃ এনালগ \r\n#ডায়াল শেপঃ রাউন্ড \r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল \r\n#ডায়াল উইন্ডোঃ গ্লাস \r\n#কোয়ার্টজ মুভমেন্ট \r\n#স্টাইলিশ ডিজাইন \r\n#আধুনিকতার সাথে মানানসই', 'লেডিস ব্রেসলেট ওয়াচ \r\n#ডিসপ্লেঃ এনালগ \r\n#ডায়াল শেপঃ রাউন্ড \r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল \r\n#ডায়াল উইন্ডোঃ গ্লাস \r\n#কোয়ার্টজ মুভমেন্ট \r\n#স্টাইলিশ ডিজাইন \r\n#আধুনিকতার সাথে মানানসই', '', 100, 500, 150, 350, 10, 1, 2, '', '2017-03-06 08:32:02', '0000-00-00 00:00:00', NULL, NULL),
(313, 8, 12, 52, 0, 'Sofa Set', 'সোফা সেট', 'Sopha-Set', 100255, '# ৩ পিছের সোফা সেট\r\n# 2 + 2 + 1\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n# কোমল গদি\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n# ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n# ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।', '# ৩ পিছের সোফা সেট\r\n# 2 + 2 + 1\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n# কোমল গদি\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n# ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n# ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।', '', 10, 20000, 8000, 12000, 10, 3, 1, '', '2017-03-06 10:44:07', '0000-00-00 00:00:00', NULL, NULL),
(314, 8, 12, 51, 0, '6 Chair Daining Table', '৬ চেয়ার ডাইনিং টেবিল', 'Daining-Table', 100256, '#টেবিল গ্লাস সাইজ- ৩X৫ ফুট।\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n#চেয়ার- ৬ পিছ।\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n# ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n# ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।\r\n\r\n', '#টেবিল গ্লাস সাইজ- ৩X৫ ফুট।\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n#চেয়ার- ৬ পিছ।\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n# ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n# ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।', '', 10, 23000, 6000, 17000, 10, 1, 1, '', '2017-03-06 10:47:13', '0000-00-00 00:00:00', NULL, NULL),
(315, 8, 12, 52, 0, 'Sofa Set', 'সোফা সেট', 'Sopha-Set', 100257, '# ৩ পিছের সোফা সেট\r\n# 2 + 2 + 1\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n# কোমল গদি\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n# ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n# ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।', '# ৩ পিছের সোফা সেট\r\n# 2 + 2 + 1\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n# কোমল গদি\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n# ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n# ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।', '', 10, 30000, 4000, 26000, 10, 1, 1, '', '2017-03-06 10:52:39', '0000-00-00 00:00:00', NULL, NULL),
(316, 8, 12, 52, 0, 'Standard Double Sofa', 'Standard Double Sofa', 'Sopha', 100258, 'Standard Double Sofa', 'Standard Double Sofa', '', 10, 25000, 6000, 19000, 10, 1, 1, '', '2017-03-06 10:54:16', '0000-00-00 00:00:00', NULL, NULL),
(317, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100259, 'yut', 'yui', '', 10, 14500, 0, 14500, 10, 1, 0, '', '2017-03-06 10:55:58', '0000-00-00 00:00:00', NULL, NULL),
(318, 8, 12, 52, 0, 'Standard Double Sofa', 'Standard Double Sofa', 'Sopha', 100260, 'Standard Double Sofa', 'Standard Double Sofa', '', 10, 25000, 6500, 18500, 10, 1, 1, '', '2017-03-06 10:59:44', '0000-00-00 00:00:00', NULL, NULL),
(319, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100261, 't6yiu', 'tyu', '', 10, 21500, 0, 21500, 10, 1, 0, '', '2017-03-06 11:06:03', '0000-00-00 00:00:00', NULL, NULL),
(320, 8, 13, 50, 0, 'Daining Tabte', 'ডাইনিং টেবিল', 'Daining-Tabte', 100262, 't77r', 'ty', '', 10, 55000, 0, 55000, 10, 1, 0, '', '2017-03-06 11:09:13', '0000-00-00 00:00:00', NULL, NULL),
(321, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100263, 'd', 'gh', '', 10, 12000, 0, 12000, 10, 1, 0, '', '2017-03-06 11:11:36', '0000-00-00 00:00:00', NULL, NULL),
(322, 8, 12, 51, 0, 'Daining Table', 'ডাইনিং টেবিল', 'Daining-Table', 100264, 'Daining Table\r\n#টেবিল গ্লাস সাইজ- ৩X৫ ফুট।\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n#চেয়ার- ৬ পিছ।\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n#ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n#ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।', 'Daining Table\r\n#টেবিল গ্লাস সাইজ- ৩X৫ ফুট।\r\n#মালয়েশিয়ান প্রসেসিং উড।\r\n#চেয়ার- ৬ পিছ।\r\n#গুনে ধরে না এবং কালার নষ্ট হয় না।\r\n#10 বছরের গ্যারান্টি।\r\n#ঢাকার মধ্যে 1000 ডেলিভারী চার্জ।\r\n#ঢাকার বাহিরে 3000 টাকা ডেলিভারী চার্জ।', '', 5, 25000, 7000, 18000, 10, 1, 1, '', '2017-03-06 11:14:00', '0000-00-00 00:00:00', NULL, NULL),
(323, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100265, 'hd', 'gf', '', 10, 18000, 0, 18000, 10, 1, 0, '', '2017-03-06 11:33:42', '0000-00-00 00:00:00', NULL, NULL),
(324, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100266, 'dgh', 'dgt', '', 5, 23500, 0, 23500, 10, 1, 0, '', '2017-03-06 11:35:18', '0000-00-00 00:00:00', NULL, NULL),
(325, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100267, 'fg', 'fh', '', 10, 39000, 0, 39000, 10, 1, 0, '', '2017-03-06 11:37:12', '0000-00-00 00:00:00', NULL, NULL),
(326, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100268, 'f', 'g', '', 10, 14000, 0, 14000, 10, 1, 0, '', '2017-03-06 11:39:18', '0000-00-00 00:00:00', NULL, NULL),
(327, 8, 12, 40, 41, 'MDF Wood Bed', 'MDF Wood Bed', 'Bed', 100269, 'উন্নতমানের ডাবল বেড\r\n#মালয়েশিয়ান প্রসেসিং কাঠ\r\n#গুনে ধরে না\r\n#রং নষ্ট হয় না\r\n#10 বছরের গ্যারান্টি', 'উন্নতমানের ডাবল বেড\r\n#মালয়েশিয়ান প্রসেসিং কাঠ\r\n#গুনে ধরে না\r\n#রং নষ্ট হয় না\r\n#10 বছরের গ্যারান্টি', '', 5, 26000, 4500, 21500, 10, 1, 1, '', '2017-03-06 11:41:48', '0000-00-00 00:00:00', NULL, NULL),
(328, 8, 13, 50, 0, 'Sopha', 'সোফা', 'Sopha', 100270, 'ry', 'r6yryuu', '', 5, 17000, 0, 17000, 10, 1, 0, '', '2017-03-06 11:44:16', '0000-00-00 00:00:00', NULL, NULL),
(329, 8, 12, 40, 41, 'Standard Double Bed', 'Standard Double Bed', 'Bed', 100271, 'উন্নতমানের ডাবল বেড\r\n#মালয়েশিয়ান প্রসেসিং কাঠ\r\n#গুনে ধরে না\r\n#রং নষ্ট হয় না\r\n#10 বছরের গ্যারান্টি', 'উন্নতমানের ডাবল বেড\r\n#মালয়েশিয়ান প্রসেসিং কাঠ\r\n#গুনে ধরে না\r\n#রং নষ্ট হয় না\r\n#10 বছরের গ্যারান্টি', '', 5, 25000, 5500, 19500, 10, 1, 1, '', '2017-03-06 11:46:25', '0000-00-00 00:00:00', NULL, NULL),
(330, 8, 13, 50, 0, 'Wear Drop', 'ওয়্যার ড্রোপ', 'Wear-Drop', 100272, 'd', 'tyf', '', 5, 35000, 0, 35000, 10, 1, 0, '', '2017-03-06 11:48:26', '0000-00-00 00:00:00', NULL, NULL),
(331, 8, 13, 50, 0, 'Bed, Wear Drop, Desing Table', 'বেড, ওয়্যার ড্রোপ, ডেসিং টেবিল', 'Bed,-Wear-Drop,-Desing-Table', 100273, 'ghj', 'gh', '', 5, 48000, 0, 48000, 10, 1, 0, '', '2017-03-06 11:54:03', '0000-00-00 00:00:00', NULL, NULL),
(332, 8, 13, 50, 0, 'Sokej', 'সোকেজ', 'Sokej', 100274, 'khg', 'hkg', '', 5, 31000, 0, 31000, 10, 1, 0, '', '2017-03-06 11:57:03', '0000-00-00 00:00:00', NULL, NULL),
(333, 8, 13, 50, 0, 'Sopha Set', 'সোফা সেট', 'Sopha-Set', 100275, 'uty', 'yu', '', 5, 22000, 0, 22000, 10, 1, 0, '', '2017-03-06 12:19:57', '0000-00-00 00:00:00', NULL, NULL),
(334, 8, 13, 0, 0, 'Sopha', 'সোফা', 'Sopha', 100276, 'ufy', 'yu', '', 5, 10000, 0, 10000, 10, 1, 0, '', '2017-03-06 12:37:17', '0000-00-00 00:00:00', NULL, NULL),
(335, 8, 8, 16, 0, 'Walar Ladies Watch', 'ওয়ালার লেডিস ওয়াচ', 'Walar-Ladies-Watch', 100277, 'লেডিস ব্রেসলেট ওয়াচ \r\n#ডিসপ্লেঃ এনালগ \r\n#ডায়াল শেপঃ রাউন্ড \r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল \r\n#ডায়াল উইন্ডোঃ গ্লাস \r\n#কোয়ার্টজ মুভমেন্ট \r\n#স্টাইলিশ ডিজাইন \r\n#আধুনিকতার সাথে মানানসই', 'লেডিস ব্রেসলেট ওয়াচ \r\n#ডিসপ্লেঃ এনালগ \r\n#ডায়াল শেপঃ রাউন্ড \r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল \r\n#ডায়াল উইন্ডোঃ গ্লাস \r\n#কোয়ার্টজ মুভমেন্ট \r\n#স্টাইলিশ ডিজাইন \r\n#আধুনিকতার সাথে মানানসই', '', 212, 500, 50, 450, 10, 1, 3, '', '2017-03-06 03:17:09', '0000-00-00 00:00:00', NULL, NULL),
(336, 7, 17, 55, 0, 'Men\'s Stylish T-Shirt', 'মেনজ স্টাইলিশ টি-শার্ট', 'মেনজ-স্টাইলিশ-টি-শার্ট', 100278, 'মেনজ স্টাইলিশ টি-শার্ট\r\n# ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৭\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', 'মেনজ স্টাইলিশ টি-শার্ট\r\n# ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৭\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', '', 50, 500, 401, 99, 25, 1, 1, '', '2017-03-07 12:55:07', '0000-00-00 00:00:00', NULL, NULL),
(337, 7, 17, 55, 0, 'Men\'s Stylish T-Shirt', 'মেনজ স্টাইলিশ টি-শার্ট', 'মেনজ-স্টাইলিশ-টি-শার্ট', 100279, 'মেনজ স্টাইলিশ টি-শার্ট\r\n# ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৭\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', 'মেনজ স্টাইলিশ টি-শার্ট\r\n# ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৭\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', '', 50, 400, 301, 99, 25, 1, 1, '', '2017-03-07 01:00:54', '0000-00-00 00:00:00', NULL, NULL),
(338, 7, 17, 55, 0, 'ARMANI Jent\'s T-Shirt', 'ARMANI জেন্টস টি শার্ট (কপি)', 'ARMANI-জেন্টস-টি-শার্ট-(কপি)', 100280, 'ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৬\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', 'ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৬\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', '', 50, 600, 501, 99, 20, 1, 1, '', '2017-03-07 01:05:58', '0000-00-00 00:00:00', NULL, NULL),
(339, 7, 17, 55, 0, 'ARMANI Jent\'s T-Shirt', 'ARMANI জেন্টস টি শার্ট (কপি)', 'ARMANI-জেন্টস-টি-শার্ট-(কপি)', 100281, 'ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৬\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', 'ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৬\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', '', 50, 500, 401, 99, 20, 1, 1, '', '2017-03-07 01:10:51', '0000-00-00 00:00:00', NULL, NULL),
(340, 7, 17, 55, 0, 'ARMANI Jent\'s T-Shirt', 'ARMANI জেন্টস টি শার্ট (কপি)', 'ARMANI-জেন্টস-টি-শার্ট-(কপি)', 100282, 'ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৬\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', 'ফেব্রিক: কটন\r\n# ফেব্রিকেশনঃ ১৬০ (প্রায়) GSM\r\n# স্টাইলিশ ডিজাইন\r\n# সাইজঃ M, L\r\n# M: লেন্থঃ ২৭\", চেস্টঃ ৩৬\"\r\n# L: লেন্থঃ ২৮\", চেস্টঃ ৩৮\"', '', 50, 500, 401, 99, 20, 1, 1, '', '2017-03-07 01:16:19', '0000-00-00 00:00:00', NULL, NULL),
(341, 8, 17, 55, 0, 'লেডিস ব্রেসলেট ওয়াচ', 'Ladies Bracelet Watch', 'লেডিস-ব্রেসলেট-ওয়াচ', 100283, 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 5, 600, 501, 99, 10, 1, 1, '', '2017-03-08 09:03:45', '0000-00-00 00:00:00', NULL, NULL),
(342, 8, 8, 16, 0, 'Digital  & Analog Watch ', 'Digital  & Analog Watch ', 'Digital--&-Analog-Watch-', 100284, 'Digital  & Analog Watch \r\n#ডিসপ্লেঃ এনালগ ও ডিজিটাল\r\n#ডায়াল শেপঃ স্কয়ার\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল ও পিভিসি\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন', 'Digital  & Analog Watch \r\n#ডিসপ্লেঃ এনালগ ও ডিজিটাল\r\n#ডায়াল শেপঃ স্কয়ার\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল ও পিভিসি\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন', '', 5, 600, 110, 490, 10, 1, 2, '', '2017-03-08 09:08:11', '0000-00-00 00:00:00', NULL, NULL),
(343, 8, 17, 55, 0, 'Stylish Jent\'s Watch', 'স্টাইলিশ জেন্টস ওয়াচ', 'Stylish-Jent\'s-Watch', 100285, 'স্টাইলিশ জেন্টস ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ স্কয়ার\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল ও পিভিসি\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন', 'স্টাইলিশ জেন্টস ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ স্কয়ার\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল ও পিভিসি\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন', '', 3, 560, 461, 99, 10, 1, 1, '', '2017-03-08 09:10:49', '0000-00-00 00:00:00', NULL, NULL),
(344, 8, 17, 55, 0, 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস-ব্রেসলেট-ওয়াচ', 100286, 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 3, 660, 561, 99, 10, 1, 3, '', '2017-03-08 09:15:23', '0000-00-00 00:00:00', NULL, NULL),
(345, 8, 8, 16, 0, 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস-ব্রেসলেট-ওয়াচ', 100287, 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 6, 550, 100, 450, 10, 1, 0, '', '2017-03-08 09:16:58', '0000-00-00 00:00:00', NULL, NULL),
(346, 8, 8, 16, 0, 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস-ব্রেসলেট-ওয়াচ', 100288, 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 2, 550, 110, 440, 10, 1, 0, '', '2017-03-08 09:20:29', '0000-00-00 00:00:00', NULL, NULL),
(347, 8, 8, 16, 0, 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস ব্রেসলেট ওয়াচ', 'লেডিস-ব্রেসলেট-ওয়াচ', 100289, 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'লেডিস ব্রেসলেট ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 8, 600, 130, 470, 10, 1, 3, '', '2017-03-08 09:21:44', '0000-00-00 00:00:00', NULL, NULL),
(348, 8, 17, 55, 0, 'Long Belt Ladies Watch', 'লেডিস ওয়াচ', 'Metal-Ladies-Watch', 100290, 'Long Belt Ladies Watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'Long Belt Ladies Watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 0, 700, 601, 99, 10, 1, 1, '', '2017-03-08 09:24:30', '0000-00-00 00:00:00', NULL, NULL),
(349, 8, 8, 16, 0, 'Metal Ladies Watch', 'মেটাল লেডিস ওয়াচ', 'Metal-Ladies-Watch', 100291, 'মেটাল লেডিস ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'মেটাল লেডিস ওয়াচ\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 7, 800, 110, 690, 10, 1, 3, '', '2017-03-08 09:25:15', '0000-00-00 00:00:00', NULL, NULL),
(350, 8, 8, 16, 0, 'Rado Jent\'s watch', 'Rado Jent\'s watch', 'Rado-Jent\'s-watch', 100292, 'Rado Jent\'s watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'Rado Jent\'s watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 2, 800, 210, 590, 10, 1, 0, '', '2017-03-08 09:29:19', '0000-00-00 00:00:00', NULL, NULL),
(351, 8, 8, 16, 0, 'Rado Jent\'s watch', 'Rado Jent\'s watch', 'Rado-Jent\'s-watch', 100293, 'Rado Jent\'s watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'Rado Jent\'s watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 22, 900, 210, 690, 10, 1, 3, '', '2017-03-08 09:30:43', '0000-00-00 00:00:00', NULL, NULL),
(352, 8, 8, 16, 0, 'Stylish Jent\'s watch', 'Stylish Jent\'s watch', 'Stylish-Jent\'s-watch', 100294, 'Stylish Jent\'s watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', 'Stylish Jent\'s watch\r\n#ডিসপ্লেঃ এনালগ\r\n#ডায়াল শেপঃ রাউন্ড\r\n#ডায়াল ম্যাটেরিয়ালঃ স্টেইনলেস স্টিল\r\n#ডায়াল উইন্ডোঃ গ্লাস\r\n#কোয়ার্টজ মুভমেন্ট\r\n#স্টাইলিশ ডিজাইন\r\n#আধুনিকতার সাথে মানানসই', '', 22, 800, 210, 590, 10, 1, 3, '', '2017-03-08 09:31:47', '0000-00-00 00:00:00', NULL, NULL),
(353, 8, 9, 24, 40, 'Mini Fan Cum Power Bank', 'মিনি ফ্যান কাম পাওয়ার ব্যাংক', 'Mini-Fan-Cum-Power-Bank', 100295, 'রিচার্জেবল USB ফ্যান কাম পাওয়ার ব্যাঙ্ক\r\n#টেবিল ল্যাম্প হিসেবে ব্যবহার করার জন্য রয়েছে একটি মিনি এলইডি লাইট\r\n#যে কোন মোবাইল/ট্যাব চার্জ করার জন্য রয়েছে USB পোর্ট\r\n#ফ্যান চালানো এবং মোবাইল চার্জ একসাথে করা যাবে\r\n#তিনটি ধাপে ফ্যানের স্পীড বাড়ানো কমানো যাবে।\r\n#একবার চার্জে ৬ ঘন্টা ব্যাক আপ\r\n#সাইজ: 14.5 x10.5x 4 সে.মি\r\n#ম্যাটেরিয়াল: PVC কেস এবং অ্যালুমিনিয়াম ব্লেড\r\n#সহজে বহনযেোগ্য একটি রিচার্জেবল ফ্যান', 'রিচার্জেবল USB ফ্যান কাম পাওয়ার ব্যাঙ্ক\r\n#টেবিল ল্যাম্প হিসেবে ব্যবহার করার জন্য রয়েছে একটি মিনি এলইডি লাইট\r\n#যে কোন মোবাইল/ট্যাব চার্জ করার জন্য রয়েছে USB পোর্ট\r\n#ফ্যান চালানো এবং মোবাইল চার্জ একসাথে করা যাবে\r\n#তিনটি ধাপে ফ্যানের স্পীড বাড়ানো কমানো যাবে।\r\n#একবার চার্জে ৬ ঘন্টা ব্যাক আপ\r\n#সাইজ: 14.5 x10.5x 4 সে.মি\r\n#ম্যাটেরিয়াল: PVC কেস এবং অ্যালুমিনিয়াম ব্লেড\r\n#সহজে বহনযেোগ্য একটি রিচার্জেবল ফ্যান', '', 22, 700, 310, 390, 10, 1, 1, '', '2017-03-09 03:44:55', '0000-00-00 00:00:00', NULL, NULL),
(354, 7, 6, 19, 17, 'Cutwork Sharee', 'কাটওয়ার্ক শাড়ী', 'Cutwork-Sharee', 100296, 'Cuttwork Sharee\r\n#Fabrics: Net. Aplic Work\r\n#Attractive design\r\n#Fashionable.\r\n#With matching un-stiched blouse piece', 'কাটওয়ার্ক শাড়ি\r\n#ফেব্রিক: নেট এপ্লিক ওয়ার্ক\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 25, 4500, 1000, 3500, 25, 1, 1, '', '2017-03-10 03:18:44', '0000-00-00 00:00:00', NULL, NULL),
(355, 7, 6, 19, 16, 'Tosor Silk Sharee', 'তোসর সিল্ক শাড়ী', 'Tosor-Silk-Sharee', 100297, 'Tosor Silk Sharee\r\n#Fabrics: Net. Aplic Work\r\n#Attractive design\r\n#Fashionable.\r\n#With matching un-stiched blouse piece', 'তোসর সিল্ক শাড়ী\r\n#ফেব্রিক: নেট এপ্লিক ওয়ার্ক\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 22, 3000, 820, 2180, 25, 1, 1, '', '2017-03-10 03:23:03', '0000-00-00 00:00:00', NULL, NULL),
(356, 7, 6, 19, 17, 'Cut Work Sharee', 'কাটওয়ার্ক শাড়ী', 'Cut-Work-Sharee', 100298, 'Cut work Sharee\r\n#Fabrics: Net. Aplic Work\r\n#Attractive design\r\n#Fashionable.\r\n#With matching un-stiched blouse piece', 'কাটওয়ার্ক শাড়ি\r\n#ফেব্রিক: নেট এপ্লিক ওয়ার্ক\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 22, 5000, 1500, 3500, 25, 1, 1, '', '2017-03-10 03:26:40', '0000-00-00 00:00:00', NULL, NULL),
(357, 7, 6, 19, 19, 'Indian Jorjet Sharee', 'ইন্ডিয়ান জর্জেট শাড়ী', 'Indian-Jorjet-Sharee', 100299, 'Indian Jorjet Sharee\r\n#Fabrics: Net. Jorjet\r\n#Attractive design\r\n#Fashionable.', 'জর্জেট শাড়ী\r\n#ফেব্রিক: নেট জর্জেট\r\n#নজরকাড়া ডিজাইন', '', 21, 2280, 700, 1580, 25, 1, 1, '', '2017-03-10 03:32:26', '0000-00-00 00:00:00', NULL, NULL),
(358, 7, 6, 19, 19, 'Fulkoli Katan Sharee', 'ফুলকলি কাতান শাড়ী', 'Fulkoli-Katan-Sharee', 100300, 'Fulkoli Katan Sharee\r\n#Fabrics: ‍Silk Katan\r\n#Attractive design\r\n#Fashionable.\r\n', 'ফুলকলি কাতান শাড়ী\r\n#ফেব্রিক: সিল্ক কাতান\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 40, 4000, 650, 3350, 25, 3, 1, '', '2017-03-10 04:35:14', '0000-00-00 00:00:00', NULL, NULL),
(359, 7, 6, 19, 16, 'Dupian Silk Sharee', 'ধূপিয়ান সিল্ক শাড়ী', 'Dupian-Silk-Sharee', 100301, 'ধূপিয়ান সিল্ক শাড়ি\r\n#ফেব্রিক: ধূপিয়ান সিল্ক\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন\r\n\r\n', 'Dhupian Silk Sharee\r\n#Fabrics: Dupian Silk\r\n#Attractive design\r\n#Fashionable.', '', 30, 3000, 850, 2150, 25, 1, 1, '', '2017-03-10 04:40:37', '0000-00-00 00:00:00', NULL, NULL),
(360, 7, 6, 19, 19, 'Silk Katan Sharee', 'সিল্ক কাতান শাড়ী', 'Silk-Katan-Sharee', 100302, 'সিল্ক কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'সিল্ক কাতান শাড়ি\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 23, 2500, 750, 1750, 25, 3, 1, '', '2017-03-11 12:41:08', '0000-00-00 00:00:00', NULL, NULL),
(361, 7, 6, 19, 16, 'Half Silk Sharee', 'হাফ সিল্ক শাড়ী', 'Pure-Cotton-Sharee', 100303, '  কটন শাড়ী\r\n# ফেব্রিক: 99% কটন + সিল্ক\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন\r\n                    ', '  কটন শাড়ী\r\n# ফেব্রিক: 99% কটন + সিল্ক\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন\r\n                    ', '', 44, 2000, 1010, 990, 25, 1, 1, '', '2017-03-11 01:07:25', '0000-00-00 00:00:00', NULL, NULL),
(362, 7, 6, 19, 15, 'Tangail Cotton Sharee', 'টাঙ্গাইল কটন শাড়ী', 'Tangail-Cotton-Sharee', 100304, '  টাঙ্গাইল কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '  টাঙ্গাইল কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 32, 2000, 820, 1180, 25, 1, 1, '', '2017-03-11 01:24:17', '0000-00-00 00:00:00', NULL, NULL),
(363, 7, 6, 19, 15, 'Pure Cotton Sharee', 'পিউর কটন শাড়ী', 'Pure-Cotton-Sharee', 100305, 'পিউর কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', 'পিউর কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#নজরকাড়া ডিজাইন', '', 20, 2000, 850, 1150, 25, 1, 1, '', '2017-03-11 01:28:45', '0000-00-00 00:00:00', NULL, NULL),
(364, 7, 6, 19, 15, 'Pure Cotton Sharee', 'পিউর কটন শাড়ী', 'Pure-Cotton-Sharee', 100306, 'পিউর কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', 'পিউর কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 23, 2000, 720, 1280, 25, 1, 1, '', '2017-03-11 01:35:30', '0000-00-00 00:00:00', NULL, NULL),
(365, 7, 6, 19, 15, 'Pure Cotton Sharee', 'পিউর কটন শাড়ী', 'Pure-Cotton-Sharee', 100307, 'পিউর কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', 'পিউর কটন শাড়ী\r\n# ফেব্রিক: 100% কটন\r\n#সাথে ম্যাচিং ব্লাউজ পিস\r\n#সাথে ম্যাচিং আনস্টিচড ব্লাউজ পিস\r\n#আকর্ষণীয় ডিজাইন', '', 22, 2000, 701, 1299, 25, 1, 1, '', '2017-03-11 01:48:04', '0000-00-00 00:00:00', NULL, NULL),
(366, 8, 17, 55, 0, 'Smart Mobile Stand', 'স্মার্ট মোবাইল স্ট্যান্ট', 'Smart-Mobile-Stand', 100308, 'যে কোন মোবাইল/ট্যাব সেট করা যায়\r\n#উপর-নিচ সহ চতুর্দিকে ঘুরানো যায়\r\n#যে কোন দিকে ইচ্ছামত ঘুরিয়ে মুভি দেখা যায়\r\n#দীর্ঘ্যস্থায়ী ও ফ্লেক্সিবল ক্লিপ তাই সহজেই সেট করা যায়\r\n#হালকা, সুন্দর ও ফ্যাশনেবল স্টাইল\r\n#সাইজ: ৭৫ সে.মি\r\n#১পিস\r\n#কালারঃ র‍্যান্ডম', 'যে কোন মোবাইল/ট্যাব সেট করা যায়\r\n#উপর-নিচ সহ চতুর্দিকে ঘুরানো যায়\r\n#যে কোন দিকে ইচ্ছামত ঘুরিয়ে মুভি দেখা যায়\r\n#দীর্ঘ্যস্থায়ী ও ফ্লেক্সিবল ক্লিপ তাই সহজেই সেট করা যায়\r\n#হালকা, সুন্দর ও ফ্যাশনেবল স্টাইল\r\n#সাইজ: ৭৫ সে.মি\r\n#১পিস\r\n#কালারঃ র‍্যান্ডম', '', 99, 500, 401, 99, 10, 2, 1, '', '2017-03-14 11:13:04', '0000-00-00 00:00:00', NULL, NULL),
(367, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100309, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.২ ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 999, 200, 799, 25, 1, 1, '', '2017-03-15 06:47:59', '0000-00-00 00:00:00', NULL, NULL),
(368, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100310, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1099, 300, 799, 25, 1, 1, '', '2017-03-15 06:55:09', '0000-00-00 00:00:00', NULL, NULL),
(369, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100311, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', '\r\nকটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 0, '', '2017-03-15 06:59:58', '0000-00-00 00:00:00', NULL, NULL),
(370, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100312, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 0, '', '2017-03-15 07:03:11', '0000-00-00 00:00:00', NULL, NULL),
(371, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100313, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 0, '', '2017-03-15 07:05:37', '0000-00-00 00:00:00', NULL, NULL),
(372, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100314, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 0, '', '2017-03-15 07:09:00', '0000-00-00 00:00:00', NULL, NULL),
(373, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100315, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 0, '', '2017-03-15 07:17:24', '0000-00-00 00:00:00', NULL, NULL),
(374, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100316, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 07:20:32', '0000-00-00 00:00:00', NULL, NULL),
(375, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100317, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 1, '', '2017-03-15 08:25:33', '0000-00-00 00:00:00', NULL, NULL),
(376, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100318, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 1, '', '2017-03-15 08:28:04', '0000-00-00 00:00:00', NULL, NULL),
(377, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100319, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 1, '', '2017-03-15 08:29:52', '0000-00-00 00:00:00', NULL, NULL),
(378, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100320, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1099, 300, 799, 25, 1, 1, '', '2017-03-15 08:31:38', '0000-00-00 00:00:00', NULL, NULL),
(379, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100321, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 1, '', '2017-03-15 08:33:14', '0000-00-00 00:00:00', NULL, NULL),
(380, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100322, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 850, 300, 550, 25, 1, 1, '', '2017-03-15 08:35:11', '0000-00-00 00:00:00', NULL, NULL),
(381, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100323, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:36:56', '0000-00-00 00:00:00', NULL, NULL),
(382, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100324, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:38:19', '0000-00-00 00:00:00', NULL, NULL),
(383, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100325, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:39:53', '0000-00-00 00:00:00', NULL, NULL),
(384, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100326, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:41:51', '0000-00-00 00:00:00', NULL, NULL),
(385, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100327, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1500, 510, 990, 25, 1, 1, '', '2017-03-15 08:43:28', '0000-00-00 00:00:00', NULL, NULL),
(386, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100328, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:45:57', '0000-00-00 00:00:00', NULL, NULL),
(387, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100329, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:47:20', '0000-00-00 00:00:00', NULL, NULL),
(388, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100330, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1299, 300, 999, 25, 1, 1, '', '2017-03-15 08:48:48', '0000-00-00 00:00:00', NULL, NULL),
(389, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100331, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:50:24', '0000-00-00 00:00:00', NULL, NULL),
(390, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100332, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:52:09', '0000-00-00 00:00:00', NULL, NULL),
(391, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100333, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:53:59', '0000-00-00 00:00:00', NULL, NULL),
(392, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100334, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:56:20', '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO `products` (`product_id`, `merchant_id`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `product_name_lang1`, `product_name_lang2`, `slug`, `product_code`, `details_lang1`, `details_lang2`, `refund_policy`, `quantity`, `market_price`, `discount`, `sale_price`, `commission`, `placement_type`, `status`, `comments`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(393, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100335, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 08:58:26', '0000-00-00 00:00:00', NULL, NULL),
(394, 7, 12, 40, 42, 'Cotton Bed Sheet', 'কটন বেড শীট', 'Cotton-Bed-Sheet', 100336, 'Cotton Bed Sheet\r\n# Attractive designs and high quality fabrics.\r\n# Fabrics: 100% Cotton.\r\n# Panel Bed Sheet. (bed sheet = 1 pcs & pillow cover 2 pcs)\r\n# Size: 7.2 X 8 Feet.\r\n# There will be glamorous and beautiful house.', 'কটন বেড শীট\r\n# আকর্ষণীয় ডিজাইন ও উন্নতমানের কাপড়।\r\n# ফেব্রিক্স: ১০০% কটন।\r\n# Panel বেডশীট সেট। (১টা বেডসিট ও ২টা বালিশের কাভার)।\r\n# সাইজঃ ৭.2 ফুট X ৮ ফুট।\r\n# যা ঘরকে করবে মোহনীয় ও সুন্দর।', '', 50, 1199, 300, 899, 25, 1, 1, '', '2017-03-15 09:05:27', '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tests`
--

CREATE TABLE `product_tests` (
  `product_test_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tests`
--

INSERT INTO `product_tests` (`product_test_id`, `product_name`, `created_at`, `updated_at`) VALUES
(1, 'Shirt', '2019-12-10 15:30:01', '2019-12-10 15:30:01'),
(2, 'Pent', '2019-12-10 15:32:00', '2019-12-10 15:32:00'),
(3, 'Shoes', '2019-12-10 15:32:14', '2019-12-10 15:32:14'),
(4, 'Laptob', '2019-12-10 15:32:21', '2019-12-10 15:32:21'),
(5, 'Desktop', '2019-12-10 15:32:28', '2019-12-10 15:32:28'),
(9, 'Mouse', '2019-12-10 16:14:25', '2019-12-10 16:14:25'),
(11, 'Headphone', '2019-12-10 17:02:07', '2019-12-10 17:02:07'),
(13, 'masud', '2019-12-10 17:06:01', '2019-12-11 21:22:55'),
(15, 'Meril', '2019-12-11 05:56:50', '2019-12-12 19:42:20'),
(16, 'Watch', '2019-12-11 06:08:02', '2019-12-11 06:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_wise_color`
--

CREATE TABLE `product_wise_color` (
  `product_wise_color_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_wise_color`
--

INSERT INTO `product_wise_color` (`product_wise_color_id`, `product_id`, `color_id`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 4, 1, '2019-12-15 15:50:54', '2019-12-15 15:50:54', 1, NULL),
(2, 2, 5, 1, '2019-12-15 15:58:28', '2019-12-15 15:58:28', 1, NULL),
(3, 2, 7, 1, '2019-12-15 15:58:28', '2019-12-15 15:58:28', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_wise_image`
--

CREATE TABLE `product_wise_image` (
  `product_wise_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_wise_image`
--

INSERT INTO `product_wise_image` (`product_wise_image_id`, `product_id`, `path`, `caption`, `type`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, '1-20200131021056F7A4.jpg', 'hmm', 1, 1, '2019-12-15 03:50:54', '2020-01-30 20:10:56', 1, 1),
(2, 2, '11-1576425054.jpg', 'Jen\'s Pent 2', 1, 1, '2019-12-15 03:50:54', '2019-12-23 16:08:38', 1, NULL),
(3, 57, '12-1576425054.jpg', 'Jen\'s Pent 3', 1, 1, '2019-12-15 03:50:55', '2019-12-23 17:08:24', 1, NULL),
(4, 58, '13-1576425055.jpg', 'Jen\'s Pent 4', 1, 1, '2019-12-15 03:50:55', '2019-12-23 17:08:30', 1, NULL),
(5, 59, '14-1576425055.jpg', 'Jen\'s Pent 5', 1, 1, '2019-12-15 03:50:55', '2019-12-23 17:08:37', 1, NULL),
(6, 60, '20-1576425508.jpg', 'Gabardine Pent 1', 1, 1, '2019-12-15 03:58:28', '2019-12-23 17:08:42', 1, NULL),
(7, 61, '21-1576425508.jpg', 'Gabardine Pent 2', 1, 1, '2019-12-15 03:58:28', '2019-12-23 17:08:48', 1, NULL),
(8, 62, '22-1576425508.jpg', 'Gabardine Pent 3', 1, 1, '2019-12-15 03:58:28', '2019-12-23 17:08:53', 1, NULL),
(9, 63, '23-1576425508.jpg', 'Gabardine Pent 4', 1, 1, '2019-12-15 03:58:28', '2019-12-23 17:08:59', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_wise_size`
--

CREATE TABLE `product_wise_size` (
  `product_wise_size_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_wise_size`
--

INSERT INTO `product_wise_size` (`product_wise_size_id`, `product_id`, `size_id`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 1, '2019-12-15 15:50:54', '2019-12-15 15:50:54', 1, NULL),
(2, 1, 2, 1, '2019-12-15 15:50:54', '2019-12-15 15:50:54', 1, NULL),
(3, 1, 3, 1, '2019-12-15 15:50:54', '2019-12-15 15:50:54', 1, NULL),
(4, 1, 4, 1, '2019-12-15 15:50:54', '2019-12-15 15:50:54', 1, NULL),
(5, 1, 5, 1, '2019-12-15 15:50:54', '2019-12-15 15:50:54', 1, NULL),
(6, 2, 2, 1, '2019-12-15 15:58:28', '2019-12-15 15:58:28', 1, NULL),
(7, 2, 4, 1, '2019-12-15 15:58:28', '2019-12-15 15:58:28', 1, NULL),
(8, 2, 5, 1, '2019-12-15 15:58:28', '2019-12-15 15:58:28', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `size_id` int(11) NOT NULL,
  `size_title_lang1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `size_title_lang2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`size_id`, `size_title_lang1`, `size_title_lang2`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'S', 'S', 1, '2019-12-15 15:29:48', '2019-12-15 15:29:48', NULL, NULL),
(2, 'M', 'M', 1, '2019-12-15 15:30:24', '2019-12-15 15:30:24', NULL, NULL),
(3, 'L', 'L', 1, '2019-12-15 15:30:36', '2019-12-15 15:30:36', NULL, NULL),
(4, 'XL', 'XL', 1, '2019-12-15 15:30:56', '2019-12-15 15:30:56', NULL, NULL),
(5, 'XXL', 'XXL', 1, '2019-12-15 15:31:07', '2019-12-15 15:31:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `sub_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `view_order` int(11) DEFAULT NULL,
  `sub_category_name_lang1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sub_category_name_lang2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `featured_image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`sub_category_id`, `category_id`, `view_order`, `sub_category_name_lang1`, `sub_category_name_lang2`, `featured_image`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 8, 1, 'Pent\'ss', 'Pent\'ss', '1-1576422712.jpg', 1, '2019-12-15 15:11:52', '2020-01-04 19:47:41', 1, 1),
(2, 1, 1, 'Winter Clothing', 'Winter Clothing', '2-1576422785.jpeg', 0, '2019-12-15 15:13:05', '2020-01-04 21:33:10', 1, 1),
(3, 1, 1, 'T-Shirt\'s', 'T-Shirt\'s', '3-1576422830.jpg', 1, '2019-12-15 15:13:50', '2019-12-15 20:55:03', 1, 1),
(4, 1, 1, 'Shirt', 'Shirt', '4-1576422904.jpg', 1, '2019-12-15 15:15:04', '2019-12-15 15:15:04', 1, 1),
(5, 1, 1, 'T Shirts', 'টি শার্ট', 'demo.png', 1, '2017-01-05 05:33:33', '2019-12-16 09:18:29', NULL, NULL),
(6, 2, 1, 'Polo Shirts', 'পোলো শার্ট', 'demo.png', 1, '2017-01-05 05:35:38', '2019-12-16 09:18:32', NULL, NULL),
(7, 2, 1, 'Accessories', 'এক্সেসরিজ', 'demo.png', 1, '2017-01-05 11:12:54', '2019-12-16 09:18:37', NULL, NULL),
(8, 2, 1, 'Speaker', 'স্পীকার', 'demo.png', 1, '2017-01-06 14:19:13', '2019-12-16 09:18:41', NULL, NULL),
(9, 2, 1, 'Accessories', 'এক্সেসরিজ', 'demo.png', 1, '2017-01-06 14:21:49', '2019-12-16 09:18:44', NULL, NULL),
(10, 3, 1, 'Headphone', 'হেডফোন', 'demo.png', 1, '2017-01-10 13:43:34', '2019-12-16 09:18:47', NULL, NULL),
(11, 3, 1, 'Punjabi', 'পাঞ্জাবী', 'demo.png', 1, '2017-01-15 11:08:18', '2019-12-16 09:18:51', NULL, NULL),
(12, 3, 1, 'Wall Clock', 'দেয়াল ঘড়ি', 'demo.png', 1, '2017-01-17 05:43:18', '2019-12-16 09:18:55', NULL, NULL),
(13, 3, 1, 'Men\'s watches', 'ছেলেদের ঘড়ি', 'demo.png', 1, '2017-01-17 05:44:06', '2019-12-16 09:18:58', NULL, NULL),
(14, 3, 1, 'Ladies watches', 'মেয়েদের ঘড়ি', 'demo.png', 1, '2017-01-17 05:44:34', '2019-12-16 09:19:03', NULL, NULL),
(15, 3, 1, 'Selfie Accessories', 'সেলফি এক্সেসরিজ', 'demo.png', 1, '2017-01-17 07:19:27', '2019-12-16 09:19:07', NULL, NULL),
(16, 4, 1, 'Free Offer', 'ফ্রী অফার', 'demo.png', 1, '2017-01-17 07:19:46', '2019-12-16 09:19:11', NULL, NULL),
(17, 4, 1, 'Unique Item', 'ইউনিক কালেকশন', 'demo.png', 1, '2017-01-19 11:09:21', '2019-12-16 09:19:15', NULL, NULL),
(18, 4, 1, 'Salwar Kameez', 'সালোয়ার কামিজ', 'demo.png', 1, '2017-01-19 13:24:28', '2019-12-16 09:19:19', NULL, NULL),
(19, 5, 0, 'Sharee', 'শাড়ী', 'demo.png', 1, '2017-01-19 13:25:40', '2019-12-16 06:30:05', NULL, NULL),
(20, 5, 0, 'Bags', 'ব্যাগ', 'demo.png', 1, '2017-01-19 13:25:54', '2019-12-16 06:30:09', NULL, NULL),
(21, 5, 0, 'Accessories', 'এক্সেসরিজ', 'demo.png', 1, '2017-01-19 13:27:42', '2019-12-16 06:30:14', NULL, NULL),
(22, 5, 10, 'Shirt', 'শার্ট', 'demo.png', 1, '2017-01-19 13:41:03', '2017-02-04 02:53:32', NULL, NULL),
(23, 6, 9, 'Beauty Care', 'বিউটি কেয়ার', 'demo.png', 1, '2017-01-19 14:49:33', '2019-12-23 20:10:36', NULL, NULL),
(24, 6, 3, 'USB Gadget', 'USB গ্যাজেট', 'demo.png', 1, '2017-01-19 15:09:19', '2019-12-23 20:10:40', NULL, NULL),
(25, 6, 7, 'MP3 Player', 'MP3 প্লেয়ার', 'demo.png', 1, '2017-01-19 15:52:31', '2019-12-23 20:10:44', NULL, NULL),
(26, 7, 6, 'Gift Corner', 'গিফট কর্নার', 'demo.png', 1, '2017-01-19 15:52:48', '2019-12-16 06:30:40', NULL, NULL),
(27, 7, 5, 'Mp3 Player', 'Mp3 প্লেয়ার', 'demo.png', 1, '2017-01-19 16:44:38', '2019-12-16 06:30:47', NULL, NULL),
(28, 7, 4, 'Clothing', 'ফ্যাশন', 'demo.png', 1, '2017-01-31 07:39:15', '2019-12-16 06:30:53', NULL, NULL),
(29, 7, 2, 'Gadget', 'গ্যাজেট', 'demo.png', 1, '2017-01-31 07:40:08', '2019-12-16 06:30:58', NULL, NULL),
(30, 8, 3, 'Random', 'র‌্যান্ডম', 'demo.png', 1, '2017-01-31 07:41:22', '2019-12-16 06:31:02', NULL, NULL),
(31, 8, 1, 'Tools', 'টুলস', 'demo.png', 1, '2017-02-03 15:02:19', '2019-12-16 06:31:07', NULL, NULL),
(32, 8, 1, 'Cloth Item', 'ক্লথ আইটেম', 'demo.png', 1, '2017-02-04 10:57:44', '2019-12-16 06:31:10', NULL, NULL),
(33, 8, 3, 'Gadget Item', 'গ্যাজেট আইটেম', 'demo.png', 1, '2017-02-04 10:58:22', '2019-12-16 06:31:15', NULL, NULL),
(34, 9, 2, 'Accessories', 'এক্সেসরিজ', 'demo.png', 1, '2017-02-04 10:59:08', '2019-12-16 06:31:20', NULL, NULL),
(35, 9, 1, 'Stand & Holder', 'স্ট্যান্ড ও হোল্ডার', 'demo.png', 1, '2017-02-08 16:06:53', '2017-02-08 22:45:30', NULL, NULL),
(36, 9, 8, 'Other accessories', 'অন্যান্য এক্সেসরিজ', 'demo.png', 1, '2017-02-16 13:57:21', '2019-12-16 06:31:25', NULL, NULL),
(37, 9, 0, 'LED & LCD TV', 'LED & LCD টিভি', 'demo.png', 1, '2017-02-23 07:18:10', '2017-02-27 05:36:37', NULL, NULL),
(38, 10, 0, 'Desktop', 'ডেস্কটপ', 'demo.png', 1, '2017-02-23 15:14:30', '2019-12-16 06:31:31', NULL, NULL),
(39, 10, 0, 'Laptop', 'ল্যাপটপ', 'demo.png', 1, '2017-02-23 15:14:47', '2019-12-16 06:31:34', NULL, NULL),
(40, 10, 0, 'Bedding', 'বেডিং', 'demo.png', 1, '2017-02-27 11:40:34', '2019-12-16 06:31:40', NULL, NULL),
(41, 10, 0, 'TV Parts', 'টিভি পার্টস', 'demo.png', 1, '2017-02-27 11:41:33', '2019-12-16 06:31:45', NULL, NULL),
(42, 14, 1, 'Health Care', 'স্বাস্থ্য সেবা', 'demo.png', 1, '2017-03-01 04:54:08', '2019-12-16 06:33:35', NULL, NULL),
(43, 10, 0, 'Mobile Watch', 'মোবাইল ঘড়ি', 'demo.png', 1, '2017-03-01 06:55:41', '0000-00-00 00:00:00', NULL, NULL),
(44, 11, 0, 'Lighting', 'লাইটিং', 'demo.png', 1, '2017-03-01 12:53:48', '2019-12-16 06:31:53', NULL, NULL),
(45, 11, 0, 'Speaker', 'স্পীকার', 'demo.png', 1, '2017-03-01 13:02:46', '2019-12-16 06:31:56', NULL, NULL),
(46, 11, 0, 'Soldering', 'সোল্ডারিং', 'demo.png', 1, '2017-03-02 10:49:30', '2019-12-16 06:32:01', NULL, NULL),
(47, 11, 0, 'Meter', 'মিটার', 'demo.png', 1, '2017-03-02 10:49:58', '2019-12-16 06:32:06', NULL, NULL),
(48, 12, 0, 'Jewelry ', 'জুয়েলারী', 'demo.png', 1, '2017-03-05 14:44:28', '2019-12-16 06:32:12', NULL, NULL),
(49, 12, 0, 'Parts', 'যন্ত্রাংশ', 'demo.png', 1, '2017-03-06 09:25:59', '2019-12-16 06:32:16', NULL, NULL),
(50, 12, 0, 'Kitchen & Dining', 'কিচেন ও ডাইনিং', 'demo.png', 1, '2017-03-06 09:45:48', '2019-12-16 06:32:20', NULL, NULL),
(51, 12, 0, 'Dining Table', 'ডাইনিং টেবিল', 'demo.png', 1, '2017-03-08 06:27:47', '0000-00-00 00:00:00', NULL, NULL),
(52, 12, 0, 'Sofa Set', 'সোফা সেট', 'demo.png', 1, '2017-03-08 06:29:14', '0000-00-00 00:00:00', NULL, NULL),
(53, 13, 0, 'Jent\'s & Ladies Watch', 'পুরুষ ও মহিলাদের ঘড়ি', 'demo.png', 1, '2017-03-08 09:44:14', '2019-12-16 06:32:27', NULL, NULL),
(54, 13, 0, 'Couple Watch', 'কাপল ওয়াচ', 'demo.png', 1, '2017-03-08 09:44:40', '2019-12-16 06:32:31', NULL, NULL),
(55, 13, 0, '99 offer', '৯৯ অফার', 'demo.png', 1, '2017-03-17 13:47:03', '2019-12-16 06:33:08', NULL, NULL),
(56, 13, 0, 'Home Appliances', 'ঘরের দ্রব্যসামগ্রী', 'demo.png', 1, '2017-03-18 12:29:31', '0000-00-00 00:00:00', NULL, NULL),
(57, 14, 0, 'Men\'s Accessories', 'Men\'s Accessories', 'demo.png', 1, '2017-03-28 05:08:52', '2019-12-16 06:33:13', NULL, NULL),
(58, 14, 0, 'Pants', 'প্যান্ট', 'demo.png', 1, '2017-01-03 16:24:00', '2019-12-16 06:33:17', NULL, NULL),
(59, 1, 1, 'Shoes', 'Shoes', '59-1576578501.jpg', 1, '2019-12-17 10:28:21', '2019-12-17 10:28:21', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `sub_sub_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `sub_sub_category_name_lang1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sub_sub_category_name_lang2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`sub_sub_category_id`, `category_id`, `sub_category_id`, `sub_sub_category_name_lang1`, `sub_sub_category_name_lang2`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 'Jeans', 'জিন্স', 1, '2019-12-15 15:19:58', '2019-12-15 15:19:58', 1, NULL),
(2, 1, 1, 'Gabardine', 'গ্যাবার্ডিন', 1, '2019-12-15 15:20:29', '2019-12-15 15:20:29', 1, NULL),
(3, 1, 1, 'Three-qutar', 'Three-qutar', 1, '2019-12-16 05:58:14', '2019-12-16 05:58:53', NULL, NULL),
(4, 5, 4, 'Shirt', 'Shirt', 1, '2017-01-05 06:09:50', '2019-12-16 08:42:49', 3, 1),
(5, 5, 4, 'shirt1', 'shirt 2', 1, '2017-01-05 06:10:20', '2019-12-16 08:29:50', 3, 1),
(6, 7, 7, 'Card Reader', 'কার্ড রিডার', 1, '2017-01-05 11:13:57', '2017-01-18 23:02:57', 3, 3),
(7, 7, 7, 'USB hub', 'USB হাব', 1, '2017-01-05 11:44:49', '2017-01-18 23:04:21', 3, 3),
(8, 7, 10, 'Wireless Headphone', 'ওয়্যারলেস হেডফোন', 1, '2017-01-10 13:45:16', '2019-12-16 06:01:12', 3, NULL),
(9, 7, 10, 'Wired Headphone', 'ওয়্যারড হেডফোন', 1, '2017-01-10 13:46:43', '2019-12-16 06:01:16', 3, NULL),
(10, 8, 15, 'Mini', 'ছোট', 1, '2017-01-17 07:41:50', '2019-12-16 06:01:26', 3, NULL),
(11, 8, 15, 'Large', 'বড়', 1, '2017-01-17 07:42:21', '2019-12-16 06:01:21', 3, NULL),
(12, 10, 17, 'Water Pump', 'পানির পাম্প', 1, '2017-01-19 11:12:26', '0000-00-00 00:00:00', 3, NULL),
(13, 6, 20, 'Vanity Bag', 'ভ্যানিটি ব্যাগ', 1, '2017-01-19 13:29:14', '0000-00-00 00:00:00', 3, NULL),
(14, 6, 20, 'Purse', 'হ্যান্ড ব্যাগ', 1, '2017-01-19 13:29:36', '0000-00-00 00:00:00', 3, NULL),
(15, 6, 19, 'Cotton', 'কটন', 1, '2017-01-19 13:31:41', '0000-00-00 00:00:00', 3, NULL),
(16, 6, 19, 'Silk', 'সিল্ক', 1, '2017-01-19 13:32:17', '0000-00-00 00:00:00', 3, NULL),
(17, 6, 19, 'Jamdani', 'জামদানি', 1, '2017-01-19 13:32:36', '0000-00-00 00:00:00', 3, NULL),
(18, 6, 19, 'Tangail', 'টাঙ্গাইল', 0, '2017-01-19 13:33:07', '0000-00-00 00:00:00', 3, NULL),
(19, 6, 19, 'Katan', 'কাতান', 1, '2017-01-19 13:33:36', '0000-00-00 00:00:00', 3, NULL),
(20, 11, 5, 'Solid Color', 'সলিড কালার', 1, '2017-01-19 13:36:37', '2019-12-16 08:36:52', 3, 1),
(21, 11, 5, 'Multi Color', 'মাল্টি কালার', 1, '2017-01-19 13:37:03', '2019-12-16 08:50:52', 3, 1),
(22, 5, 22, 'Half Sleeve', 'হাফ স্লীভ', 1, '2017-01-19 14:04:30', '0000-00-00 00:00:00', 3, NULL),
(23, 5, 22, 'Full Sleeve', 'ফুল স্লীভ', 1, '2017-01-19 14:04:57', '0000-00-00 00:00:00', 3, NULL),
(24, 6, 18, 'Unstitched', 'আনস্টিচড', 1, '2017-01-19 14:11:08', '0000-00-00 00:00:00', 3, NULL),
(25, 6, 18, 'Readymade', 'রেডিমেড', 1, '2017-01-19 14:11:28', '0000-00-00 00:00:00', 3, NULL),
(26, 6, 18, 'Deshi Boutique', 'দেশী বুটিক', 1, '2017-01-19 14:12:25', '0000-00-00 00:00:00', 3, NULL),
(27, 6, 18, 'Lawn', 'লোন', 1, '2017-01-19 14:12:46', '0000-00-00 00:00:00', 3, NULL),
(28, 7, 7, 'Mouse & Pads', 'মাউস ও প্যাড', 1, '2017-01-19 17:01:04', '0000-00-00 00:00:00', 3, NULL),
(29, 7, 7, 'Key Boards', 'কী বোর্ড', 1, '2017-01-19 17:01:25', '0000-00-00 00:00:00', 3, NULL),
(30, 7, 7, 'Pen Drive', 'পেন ড্রাইভ', 1, '2017-01-19 17:04:44', '0000-00-00 00:00:00', 3, NULL),
(31, 11, 12, 'Digital', 'ডিজিটাল', 1, '2017-01-19 17:07:15', '0000-00-00 00:00:00', 3, NULL),
(32, 11, 12, 'Analoge', 'এ্যানালগ', 1, '2017-01-19 17:07:46', '0000-00-00 00:00:00', 3, NULL),
(33, 8, 9, 'Earphone', 'ইয়ারফোন', 1, '2017-01-24 13:07:00', '0000-00-00 00:00:00', 3, NULL),
(34, 8, 9, 'Memory Card', 'মেমোরী কার্ড', 1, '2017-01-24 13:07:40', '0000-00-00 00:00:00', 3, NULL),
(35, 8, 9, 'Cable & Charger', 'ক্যাবল ও চার্জার', 1, '2017-01-24 13:13:11', '0000-00-00 00:00:00', 3, NULL),
(36, 8, 9, 'Power Bank', 'পাওয়ার ব্যাংক', 1, '2017-01-24 13:13:45', '0000-00-00 00:00:00', 3, NULL),
(37, 8, 9, 'Bluetooth Headset', 'ব্লুটুথ হেডসেট', 1, '2017-01-24 13:31:53', '2017-02-08 22:38:43', 3, 3),
(38, 7, 7, 'Charger & Cable', 'চার্জার ও ক্যাবল', 1, '2017-02-08 16:20:05', '0000-00-00 00:00:00', 3, NULL),
(39, 8, 9, 'Other\'s', 'অন্যান্য', 1, '2017-02-09 04:33:35', '2017-02-08 22:38:19', 3, 3),
(40, 9, 24, 'Mini Fan', 'মিনি ফ্যান', 1, '2017-02-09 04:40:02', '0000-00-00 00:00:00', 3, NULL),
(41, 12, 40, 'Bed/Mattress', 'বিছানা/গদি', 1, '2017-02-27 15:14:29', '2017-02-26 21:23:36', 3, 3),
(42, 12, 40, 'Bed Sheet', 'বেড শীট', 1, '2017-02-27 15:15:06', '0000-00-00 00:00:00', 3, NULL),
(43, 12, 40, 'Pillow Cover', 'বালিশ কভার', 1, '2017-02-27 15:16:29', '0000-00-00 00:00:00', 3, NULL),
(44, 13, 50, 'Blender', 'ব্লেন্ডার', 1, '2017-03-18 12:30:05', '0000-00-00 00:00:00', 3, NULL),
(45, 13, 56, 'Air Condition', 'এয়ার কন্ডিশন', 1, '2017-03-18 12:33:01', '0000-00-00 00:00:00', 3, NULL),
(46, 13, 56, 'Refrigerator ', 'রেফ্রিজারেটর', 1, '2017-03-18 12:33:48', '0000-00-00 00:00:00', 3, NULL),
(47, 13, 56, 'Iron', 'আয়রণ', 1, '2017-03-18 12:34:06', '0000-00-00 00:00:00', 3, NULL),
(48, 13, 56, 'Room Heater', 'রুম হিটার', 1, '2017-03-18 12:34:29', '0000-00-00 00:00:00', 3, NULL),
(49, 13, 56, 'Water Heater', 'ওয়াটার হিটার', 1, '2017-03-18 12:34:48', '0000-00-00 00:00:00', 3, NULL),
(50, 1, 59, 'Lofar', 'Lofar', 1, '2019-12-17 10:29:11', '2019-12-17 10:29:11', 1, NULL),
(51, 1, 59, 'Ked\'\'s', 'ked\'s', 1, '2019-12-17 10:29:33', '2019-12-17 10:29:33', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `mobile_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `last_login_lang` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `full_name`, `mobile_no`, `email`, `password`, `gender`, `address`, `status`, `last_login_lang`, `remember_token`, `created_at`, `updated_at`) VALUES
(140, '0', 'riyadh', '01672-002591', 'riyadh@gmail.com', '$2y$10$olbQIsrO3zxiKaq2Yp7.W.SH/yZN13nMe1dOC2axFxK1X/.8US2Re', 1, 'test', 1, 1, 'velhevmHkSeMNQqMMhYICeu8GPEsP9XubDUuUUmK', '2018-05-14 12:05:25', '0000-00-00 00:00:00'),
(141, '0', 'alauddin', '01855-438383', 'demo@gmail.com', '$2y$10$86hXCdO2IM8TTimmmcSbd.BC3aeF9VEVwwlMWd6UpmvSqUKHhsAwK', 1, 'adfadsf', 1, 1, 'LYqN0yZ1bazblTLJfk1FXEaS2UetIVcmvKsB6Qr2', '2018-05-15 08:05:14', '0000-00-00 00:00:00'),
(142, '0', 'Alauddin', '01855-438383', 'eng.alauddin12@gmail.com', '$2y$10$29pFrs.ahNzesjnKd1/XzOaL32b/XTuDcxvUtfQHgqeDpfKLY5Krm', 1, 'Feni', 1, 1, 'Jy5sjpmMMPCMgZ4fFo2Q40KhYkFbpdTfsdp52tlE', '2018-05-15 03:05:10', '0000-00-00 00:00:00'),
(143, '0', 'masud', '01775635214', 'masud.affb@gmail.com', '$2y$10$Xc05OGi9JIcbSEB5HInA8O1QILuS0TdQsvntEobslk2W76YhYoGOC', 1, 'test', 0, 1, '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `business_types`
--
ALTER TABLE `business_types`
  ADD PRIMARY KEY (`business_type_id`),
  ADD KEY `FK_cities_admins` (`created_by`),
  ADD KEY `FK_cities_admins_2` (`updated_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `company_profile`
--
ALTER TABLE `company_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`merchant_id`),
  ADD UNIQUE KEY `company_name` (`company_name`);

--
-- Indexes for table `merchant_shipment_info`
--
ALTER TABLE `merchant_shipment_info`
  ADD PRIMARY KEY (`merchant_shipment_info_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`);

--
-- Indexes for table `order_condition`
--
ALTER TABLE `order_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order_details_orders` (`fk_order_id`),
  ADD KEY `FK_order_details_products` (`fk_product_id`),
  ADD KEY `FK_order_details_product_wise_size` (`fk_product_wise_size_id`),
  ADD KEY `FK_order_details_product_wise_color` (`fk_product_wise_color_id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `master_invoice` (`master_invoice_no`);

--
-- Indexes for table `photo_sliders`
--
ALTER TABLE `photo_sliders`
  ADD PRIMARY KEY (`photo_slider_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_tests`
--
ALTER TABLE `product_tests`
  ADD PRIMARY KEY (`product_test_id`);

--
-- Indexes for table `product_wise_color`
--
ALTER TABLE `product_wise_color`
  ADD PRIMARY KEY (`product_wise_color_id`);

--
-- Indexes for table `product_wise_image`
--
ALTER TABLE `product_wise_image`
  ADD PRIMARY KEY (`product_wise_image_id`);

--
-- Indexes for table `product_wise_size`
--
ALTER TABLE `product_wise_size`
  ADD PRIMARY KEY (`product_wise_size_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`sub_category_id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`sub_sub_category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_types`
--
ALTER TABLE `business_types`
  MODIFY `business_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company_profile`
--
ALTER TABLE `company_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `merchant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `merchant_shipment_info`
--
ALTER TABLE `merchant_shipment_info`
  MODIFY `merchant_shipment_info_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_condition`
--
ALTER TABLE `order_condition`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_sliders`
--
ALTER TABLE `photo_sliders`
  MODIFY `photo_slider_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT for table `product_tests`
--
ALTER TABLE `product_tests`
  MODIFY `product_test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_wise_color`
--
ALTER TABLE `product_wise_color`
  MODIFY `product_wise_color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_wise_image`
--
ALTER TABLE `product_wise_image`
  MODIFY `product_wise_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_wise_size`
--
ALTER TABLE `product_wise_size`
  MODIFY `product_wise_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `sub_sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_order_details_orders` FOREIGN KEY (`fk_order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `FK_order_details_product_wise_color` FOREIGN KEY (`fk_product_wise_color_id`) REFERENCES `product_wise_color` (`product_wise_color_id`),
  ADD CONSTRAINT `FK_order_details_product_wise_size` FOREIGN KEY (`fk_product_wise_size_id`) REFERENCES `product_wise_size` (`product_wise_size_id`),
  ADD CONSTRAINT `FK_order_details_products` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
