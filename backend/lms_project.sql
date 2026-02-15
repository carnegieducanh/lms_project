-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2025 at 02:26 PM
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
-- Database: `lms_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `is_completed` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_last_watched` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `user_id`, `course_id`, `chapter_id`, `lesson_id`, `is_completed`, `is_last_watched`, `created_at`, `updated_at`) VALUES
(11, 1, 9, 35, 45, 'yes', 'no', '2025-09-07 06:24:53', '2025-09-07 08:01:51'),
(12, 1, 9, 35, 46, 'yes', 'no', NULL, '2025-09-07 08:01:51'),
(13, 1, 9, 36, 47, 'yes', 'yes', NULL, '2025-09-07 08:01:54'),
(14, 1, 8, 33, 41, 'no', 'no', '2025-09-07 08:08:35', '2025-09-07 08:15:48'),
(15, 1, 8, 33, 42, 'yes', 'no', NULL, '2025-09-07 08:15:48'),
(16, 1, 8, 34, 43, 'yes', 'yes', NULL, '2025-09-07 08:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Web Development', 1, NULL, NULL),
(2, 'Financne', 1, NULL, NULL),
(3, 'Marketing', 1, NULL, NULL),
(4, 'Business', 1, NULL, NULL),
(5, 'Music', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Module 1: Introduction to HTML', 4, 0, 1, '2025-05-26 23:19:21', '2025-07-18 03:28:07'),
(3, 'Module 2: HTML Structure & Basic Tags', 4, 1, 1, '2025-05-28 23:25:55', '2025-07-18 03:28:07'),
(15, 'Module 3: Text Formatting and Styling Tags', 4, 2, 1, '2025-05-28 23:27:31', '2025-07-18 03:28:07'),
(22, 'Introduction', 6, 2, 1, '2025-07-27 04:07:14', '2025-07-27 04:16:38'),
(23, 'Basic', 6, 0, 1, '2025-07-27 04:07:52', '2025-07-27 04:16:38'),
(24, 'Test', 6, 1, 1, '2025-07-27 04:15:26', '2025-07-27 04:16:38'),
(26, 'Module 4: Image Tag', 4, 1000, 1, '2025-07-29 10:00:59', '2025-07-29 10:00:59'),
(27, 'Module 5 : Headings', 4, 1000, 1, '2025-07-29 10:03:00', '2025-07-29 10:03:00'),
(28, 'Module 6 : Iframe', 4, 1000, 1, '2025-07-29 10:04:43', '2025-07-29 10:04:43'),
(29, 'Chapter 1 – Introduction to Personal Finance', 3, 1000, 1, '2025-08-14 05:59:01', '2025-08-14 05:59:01'),
(30, 'Chapter 2 – Budgeting & Money Management', 3, 1000, 1, '2025-08-14 05:59:10', '2025-08-14 05:59:10'),
(31, 'Chapter 1 – Introduction to Personal Finance', 7, 1000, 1, '2025-08-14 06:22:37', '2025-08-14 06:22:37'),
(32, 'Chapter 2 – Budgeting & Money Management', 7, 1000, 1, '2025-08-14 06:22:43', '2025-08-14 06:22:43'),
(33, 'Chapter 1 – Introduction to the Guitar', 8, 1000, 1, '2025-08-14 06:32:56', '2025-08-14 06:32:56'),
(34, 'Chapter 2 – Basic Guitar Skills', 8, 1000, 1, '2025-08-14 06:33:03', '2025-08-14 06:33:03'),
(35, 'Chapter 1 – Introduction to the Guitar', 9, 1000, 1, '2025-08-14 06:42:49', '2025-08-14 06:42:49'),
(36, 'Chapter 2 – Basic Guitar Skills', 9, 1000, 1, '2025-08-14 06:42:53', '2025-08-14 06:42:53'),
(37, 'Chapter 1 – Introduction to Photography', 10, 1000, 1, '2025-08-14 06:50:40', '2025-08-14 06:50:40'),
(38, 'Chapter 2 – Camera Settings Mastery', 10, 1000, 1, '2025-08-14 06:50:45', '2025-08-14 06:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `cross_price` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_featured` enum('yes','no') DEFAULT 'no',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES
(3, 'Personal Finance Course', 1, 2, 3, 1, 'The Complete Personal Finance Course is a comprehensive program designed to help individuals master money management, budgeting, saving, investing, debt reduction, and financial planning. It typically covers practical strategies for building wealth, achieving financial independence, and making informed financial decisions for both short-term stability and long-term goals.', 20, 25, 1, 'yes', '1755171823-3.jpg', '2025-04-27 12:22:43', '2025-08-14 06:14:47'),
(4, 'Web Development Course', 1, 1, 2, 1, 'dummy 123', 10, 20, 0, 'yes', '1750611503-4.jpg', '2025-04-27 12:24:28', '2025-07-29 10:12:17'),
(6, 'Python Crash Course', 1, 1, 1, 1, 'Dummy', 10, 20, 0, 'yes', '1753609024-6.jpg', '2025-07-27 04:06:22', '2025-09-12 04:36:58'),
(7, 'Personal Finance Masterclass', 1, 2, 1, 1, 'The Complete Personal Finance Course\" equips you with the tools and knowledge to take control of your money. From budgeting and saving to investing and retirement planning, this step-by-step program helps you build financial confidence and achieve your life goals.', 10, 20, 0, NULL, '1755172344-7.jpg', '2025-07-29 10:06:12', '2025-08-14 06:22:24'),
(8, 'Complete Guitar Lessons System', 3, 5, 1, 1, 'Complete Guitar Lessons System\" takes you from your very first chord to advanced techniques. Learn rhythm, fingerpicking, scales, and solos through step-by-step lessons designed for all skill levels.', 10, 20, 1, 'yes', '1755173208-8.jpg', '2025-08-14 06:32:05', '2025-08-14 06:38:37'),
(9, 'Complete Guitar Lessons', 3, 5, 1, 1, 'Complete Guitar Lessons is your step-by-step guide to mastering the guitar, whether you’re a complete beginner or looking to level up your skills. Learn everything from basic chords and strumming patterns to advanced solos, fingerpicking, and music theory. With structured lessons, practical exercises, and real-song examples, this course will help you play with confidence and develop your own unique style.', 12, 20, 1, 'no', '1755173710-9.jpg', '2025-08-14 06:40:12', '2025-08-14 06:45:13'),
(10, 'Photography Masterclass', 3, 2, 2, 1, 'Photography Masterclass is a complete guide to taking stunning photos, from mastering your camera settings to editing like a pro. Whether you’re a beginner learning the basics or an enthusiast aiming to refine your skills, this course covers composition, lighting, portrait photography, landscapes, and post-processing. By the end, you’ll have the knowledge and confidence to capture professional-quality images in any setting.', 10, 12, 1, 'no', '1755174321-10.jpg', '2025-08-14 06:50:10', '2025-08-14 06:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(2, 1, 9, '2025-08-24 08:48:51', '2025-08-24 08:48:51'),
(3, 1, 4, '2025-08-24 08:51:55', '2025-08-24 08:51:55'),
(4, 1, 8, '2025-09-07 03:04:23', '2025-09-07 03:04:23'),
(5, 3, 9, '2025-09-12 08:08:07', '2025-09-12 08:08:07');

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 1, NULL, NULL),
(2, 'Spanish', 1, NULL, NULL),
(3, 'French', 1, NULL, NULL),
(4, 'Hindi', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `is_free_preview` enum('yes','no') NOT NULL DEFAULT 'no',
  `duration` int(11) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(11, 'HTML Introduction', 2, 'no', NULL, NULL, NULL, 0, 1, '2025-06-29 05:25:35', '2025-07-13 09:29:53'),
(14, 'Dummy', 15, 'no', NULL, NULL, NULL, 1000, 1, '2025-06-29 05:26:28', '2025-06-29 05:26:28'),
(15, 'Heading & Paragraph', 2, 'no', NULL, NULL, NULL, 1, 1, '2025-06-29 06:06:36', '2025-07-13 09:29:53'),
(17, 'Dummy Lesson', 3, 'no', NULL, NULL, NULL, 1000, 1, '2025-06-29 06:07:18', '2025-06-29 06:07:18'),
(25, 'Lesson 1', 23, 'no', NULL, '1757671610-25.mp4', NULL, 1000, 1, '2025-07-27 04:17:00', '2025-09-12 04:36:50'),
(26, 'Lesson 2', 23, 'no', NULL, NULL, NULL, 1000, 1, '2025-07-27 04:17:28', '2025-07-27 04:17:28'),
(29, 'Lesson 3', 23, 'no', NULL, NULL, NULL, 1000, 1, '2025-07-27 04:25:59', '2025-07-27 04:25:59'),
(30, 'Why Personal Finance Matters', 29, 'yes', 25, '1755171908-30.mp4', '<p>The Complete Personal Finance Course\" equips you with the tools and knowledge to take control of your money. From budgeting and saving to investing and retirement planning, this step-by-step program helps you build financial confidence and achieve your life goals.</p>', 1000, 1, '2025-08-14 05:59:32', '2025-08-14 06:16:21'),
(31, 'Understanding Your Current Financial Situation', 29, 'no', 10, '1755171999-31.mp4', '<p>The Complete Personal Finance Course\" equips you with the tools and knowledge to take control of your money. From budgeting and saving to investing and retirement planning, this step-by-step program helps you build financial confidence and achieve your life goals.</p>', 1000, 1, '2025-08-14 06:00:06', '2025-08-14 06:16:57'),
(32, 'Setting SMART Financial Goals', 29, 'no', 25, '1755172050-32.mp4', '<p>The Complete Personal Finance Course\" equips you with the tools and knowledge to take control of your money. From budgeting and saving to investing and retirement planning, this step-by-step program helps you build financial confidence and achieve your life goals.</p>', 1000, 1, '2025-08-14 06:01:07', '2025-08-14 06:17:32'),
(33, 'Creating a Monthly Budget', 30, 'no', 25, '1755172114-33.mp4', '<p>The Complete Personal Finance Course\" equips you with the tools and knowledge to take control of your money. From budgeting and saving to investing and retirement planning, this step-by-step program helps you build financial confidence and achieve your life goals.</p>', 1000, 1, '2025-08-14 06:03:18', '2025-08-14 06:18:36'),
(34, 'Tracking Your Income and Expenses', 30, 'no', 12, '1755172164-34.mp4', '<p>The Complete Personal Finance Course\" equips you with the tools and knowledge to take control of your money. From budgeting and saving to investing and retirement planning, this step-by-step program helps you build financial confidence and achieve your life goals.</p>', 1000, 1, '2025-08-14 06:05:03', '2025-08-14 06:19:28'),
(35, 'The 50/30/20 Rule Explained', 30, 'no', 10, '1755172188-35.mp4', '<p>The Complete Personal Finance Course\" equips you with the tools and knowledge to take control of your money. From budgeting and saving to investing and retirement planning, this step-by-step program helps you build financial confidence and achieve your life goals.</p>', 1000, 1, '2025-08-14 06:05:51', '2025-08-14 06:19:50'),
(37, 'Why Personal Finance Matters', 31, 'yes', 10, '1755172446-37.mp4', '<p>Master your money with \"The Complete Personal Finance Course\" — a practical guide to managing income, reducing debt, growing savings, and investing wisely. Whether you’re a beginner or looking to refine your financial skills, this course offers actionable strategies you can apply immediately.</p>', 1000, 1, '2025-08-14 06:22:54', '2025-08-14 06:24:06'),
(38, 'Understanding Your Current Financial Situation', 31, 'no', 15, '1755172465-38.mp4', '<p>Master your money with \"The Complete Personal Finance Course\" — a practical guide to managing income, reducing debt, growing savings, and investing wisely. Whether you’re a beginner or looking to refine your financial skills, this course offers actionable strategies you can apply immediately.</p>', 1000, 1, '2025-08-14 06:23:03', '2025-08-14 06:24:28'),
(39, 'Creating a Monthly Budget', 32, 'no', 20, '1755172485-39.mp4', '<p>Master your money with \"The Complete Personal Finance Course\" — a practical guide to managing income, reducing debt, growing savings, and investing wisely. Whether you’re a beginner or looking to refine your financial skills, this course offers actionable strategies you can apply immediately.</p>', 1000, 1, '2025-08-14 06:23:11', '2025-08-14 06:24:45'),
(40, 'Tracking Your Income and Expenses', 32, 'no', 20, '1755172505-40.mp4', '<p>Master your money with \"The Complete Personal Finance Course\" — a practical guide to managing income, reducing debt, growing savings, and investing wisely. Whether you’re a beginner or looking to refine your financial skills, this course offers actionable strategies you can apply immediately.</p>', 1000, 1, '2025-08-14 06:23:19', '2025-08-14 06:25:05'),
(41, 'Parts of the Guitar & How It Works', 33, 'yes', 10, '1755173237-41.mp4', '<p>Master the guitar with the \"Complete Guitar Lessons System\" — a structured program covering chords, strumming patterns, lead guitar, and music theory. Perfect for beginners and players looking to sharpen their skills.</p>', 1000, 1, '2025-08-14 06:33:13', '2025-08-14 06:37:17'),
(42, 'Tuning Your Guitar (Standard & Alternate Tunings)', 33, 'no', 10, '1755173263-42.mp4', '<p>Master the guitar with the \"Complete Guitar Lessons System\" — a structured program covering chords, strumming patterns, lead guitar, and music theory. Perfect for beginners and players looking to sharpen their skills.</p>', 1000, 1, '2025-08-14 06:33:22', '2025-08-14 06:37:43'),
(43, 'Understanding Frets, Strings & Finger Positioning', 34, 'no', 10, '1755173290-43.mp4', '<p>Master the guitar with the \"Complete Guitar Lessons System\" — a structured program covering chords, strumming patterns, lead guitar, and music theory. Perfect for beginners and players looking to sharpen their skills.</p>', 1000, 1, '2025-08-14 06:33:33', '2025-08-14 06:38:10'),
(44, 'Playing Your First Notes', 34, 'no', 12, '1755173308-44.mp4', '<p>Master the guitar with the \"Complete Guitar Lessons System\" — a structured program covering chords, strumming patterns, lead guitar, and music theory. Perfect for beginners and players looking to sharpen their skills.</p>', 1000, 1, '2025-08-14 06:33:41', '2025-08-14 06:38:28'),
(45, 'Parts of the Guitar & How It Works', 35, 'yes', 10, '1755173792-45.mp4', '<p>Complete Guitar Lessons is your step-by-step guide to mastering the guitar, whether you’re a complete beginner or looking to improve your skills. You’ll learn chords, strumming, fingerpicking, lead guitar techniques, scales, and essential music theory — all through clear lessons and practical exercises. By the end, you’ll be able to play your favorite songs, create solos, and perform with confidence.</p>', 1000, 1, '2025-08-14 06:43:01', '2025-08-14 06:46:32'),
(46, 'How to Hold the Guitar and Pick Properly', 35, 'no', 10, '1755173814-46.mp4', '<p>Complete Guitar Lessons is your step-by-step guide to mastering the guitar, whether you’re a complete beginner or looking to improve your skills. You’ll learn chords, strumming, fingerpicking, lead guitar techniques, scales, and essential music theory — all through clear lessons and practical exercises. By the end, you’ll be able to play your favorite songs, create solos, and perform with confidence.</p>', 1000, 1, '2025-08-14 06:43:12', '2025-08-17 09:09:06'),
(47, 'Understanding Frets, Strings & Finger Positioning', 36, 'no', 12, '1755173835-47.mp4', '<p>Complete Guitar Lessons is your step-by-step guide to mastering the guitar, whether you’re a complete beginner or looking to improve your skills. You’ll learn chords, strumming, fingerpicking, lead guitar techniques, scales, and essential music theory — all through clear lessons and practical exercises. By the end, you’ll be able to play your favorite songs, create solos, and perform with confidence.</p>', 1000, 1, '2025-08-14 06:43:21', '2025-08-14 06:47:15'),
(48, 'Playing Your First Notes', 36, 'no', NULL, NULL, NULL, 1000, 1, '2025-08-14 06:43:29', '2025-08-14 06:43:29'),
(49, 'Understanding Different Types of Photography', 37, 'yes', 10, '1755174363-49.mp4', '<p>Photography Masterclass is a complete guide to taking stunning photos, from mastering your camera settings to editing like a pro. Whether you’re a beginner learning the basics or an enthusiast aiming to refine your skills, this course covers composition, lighting, portrait photography, landscapes, and post-processing. By the end, you’ll have the knowledge and confidence to capture professional-quality images in any setting.</p>', 1000, 1, '2025-08-14 06:50:55', '2025-08-14 06:56:03'),
(50, 'Choosing the Right Camera and Gear', 37, 'no', 10, '1755174391-50.mp4', '<p>Photography Masterclass is a complete guide to taking stunning photos, from mastering your camera settings to editing like a pro. Whether you’re a beginner learning the basics or an enthusiast aiming to refine your skills, this course covers composition, lighting, portrait photography, landscapes, and post-processing. By the end, you’ll have the knowledge and confidence to capture professional-quality images in any setting.</p>', 1000, 1, '2025-08-14 06:51:10', '2025-08-14 06:56:31'),
(51, 'Aperture, Shutter Speed & ISO Explained', 38, 'no', 10, '1755174419-51.mp4', '<p>Photography Masterclass is a complete guide to taking stunning photos, from mastering your camera settings to editing like a pro. Whether you’re a beginner learning the basics or an enthusiast aiming to refine your skills, this course covers composition, lighting, portrait photography, landscapes, and post-processing. By the end, you’ll have the knowledge and confidence to capture professional-quality images in any setting.</p>', 1000, 1, '2025-08-14 06:51:19', '2025-08-14 06:57:00'),
(52, 'White Balance & Color Temperature', 38, 'no', NULL, NULL, NULL, 1000, 1, '2025-08-14 06:51:27', '2025-08-14 06:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Beginner', 1, NULL, NULL),
(2, 'Intermediate', 1, NULL, NULL),
(3, 'Expert', 1, NULL, NULL);

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_19_042726_create_categories_table', 2),
(5, '2025_04_19_043023_create_languages_table', 3),
(6, '2025_04_19_043142_create_levels_table', 3),
(7, '2025_04_19_043324_create_courses_table', 4),
(8, '2025_04_19_044636_create_outcomes_table', 5),
(9, '2025_04_19_044654_create_requirements_table', 5),
(10, '2025_04_19_044950_create_chapters_table', 6),
(11, '2025_04_19_045017_create_lessons_table', 6),
(12, '2025_04_19_045858_create_enrollments_table', 7),
(13, '2025_04_19_045924_create_activities_table', 7),
(14, '2025_04_19_045937_create_reviews_table', 7),
(15, '2025_04_20_084615_create_personal_access_tokens_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `outcomes`
--

CREATE TABLE `outcomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `outcomes`
--

INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES
(4, 4, 'asda', 2, '2025-04-30 23:13:59', '2025-05-12 23:48:07'),
(5, 4, 'Dummy outcome', 3, '2025-04-30 23:14:19', '2025-05-12 23:48:07'),
(6, 4, 'New outcome', 1, '2025-05-05 13:21:56', '2025-05-12 23:48:07'),
(9, 4, 'one more testing', 0, '2025-05-05 13:32:07', '2025-05-12 23:48:07'),
(11, 6, 'Outcome 1', 1000, '2025-07-27 04:06:46', '2025-07-27 04:06:46'),
(12, 3, 'Create and follow a personalized monthly budget.', 1000, '2025-08-14 06:07:08', '2025-08-14 06:07:08'),
(13, 3, 'Build an emergency fund and set up effective saving habits', 1000, '2025-08-14 06:07:13', '2025-08-14 06:07:13'),
(14, 3, 'Manage and reduce debt using proven strategies.', 1000, '2025-08-14 06:07:22', '2025-08-14 06:07:22'),
(15, 3, 'Understand and start basic investing for long-term wealth.', 1000, '2025-08-14 06:07:27', '2025-08-14 06:07:27'),
(16, 7, 'Create and follow a personalized monthly budget.', 1000, '2025-08-14 06:21:14', '2025-08-14 06:21:14'),
(17, 7, 'Build an emergency fund and set up effective saving habits.', 1000, '2025-08-14 06:21:20', '2025-08-14 06:21:20'),
(18, 7, 'Manage and reduce debt using proven strategies.', 1000, '2025-08-14 06:21:30', '2025-08-14 06:21:30'),
(19, 7, 'Understand and start basic investing for long-term wealth.', 1000, '2025-08-14 06:21:34', '2025-08-14 06:21:34'),
(20, 8, 'Play basic to advanced chords and smooth chord transitions.', 1000, '2025-08-14 06:35:49', '2025-08-14 06:35:49'),
(21, 8, 'Strum and pick with proper timing and rhythm.', 1000, '2025-08-14 06:35:54', '2025-08-14 06:35:54'),
(22, 8, 'Perform popular songs with confidence.', 1000, '2025-08-14 06:35:58', '2025-08-14 06:35:58'),
(23, 9, 'Play open chords, power chords, and barre chords smoothly.', 1000, '2025-08-14 06:41:50', '2025-08-14 06:41:50'),
(24, 9, 'Strum and pick with accurate rhythm and timing.', 1000, '2025-08-14 06:41:54', '2025-08-14 06:41:54'),
(25, 9, 'Perform popular songs and riffs with confidence.', 1000, '2025-08-14 06:41:59', '2025-08-14 06:41:59'),
(26, 10, 'Use your camera in manual mode with full control.', 1000, '2025-08-14 06:57:15', '2025-08-14 06:57:15'),
(27, 10, 'Compose visually appealing and impactful shots.', 1000, '2025-08-14 06:57:19', '2025-08-14 06:57:19'),
(28, 10, 'Master lighting for different scenarios.', 1000, '2025-08-14 06:57:25', '2025-08-14 06:57:25');

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
(1, 'App\\Models\\User', 1, 'token', '2ca302200b68f36aeef21d4fddabf6306ce6959555237cb4293a4af39958426e', '[\"*\"]', NULL, NULL, '2025-04-20 11:37:29', '2025-04-20 11:37:29'),
(2, 'App\\Models\\User', 1, 'token', '6921241628c73080a3dc92838ecc296803c35e87ae8843c853fd221ef98e5ee9', '[\"*\"]', NULL, NULL, '2025-04-20 11:46:24', '2025-04-20 11:46:24'),
(3, 'App\\Models\\User', 1, 'token', 'e22b28050ad97b6b0e5f72e921289211f582922aa692e8b28f7b76f2747da71b', '[\"*\"]', NULL, NULL, '2025-04-20 12:00:37', '2025-04-20 12:00:37'),
(4, 'App\\Models\\User', 1, 'token', '024dbd227ca570d2cc1ac0e1a4d9dd85b5221ce24b24549bfdd884d28bbf1f49', '[\"*\"]', NULL, NULL, '2025-04-20 23:07:52', '2025-04-20 23:07:52'),
(5, 'App\\Models\\User', 1, 'token', '17d71c8b3c3f1f8ba183b7bc7f841f8cf63573864bc4b7db843b227df41cb73e', '[\"*\"]', NULL, NULL, '2025-04-20 23:09:14', '2025-04-20 23:09:14'),
(6, 'App\\Models\\User', 1, 'token', '3bfea5d52b6b792f02ae0726e744d0fd610aeaedda425bbdf8a75907076d4ca1', '[\"*\"]', NULL, NULL, '2025-04-20 23:10:41', '2025-04-20 23:10:41'),
(7, 'App\\Models\\User', 1, 'token', '1b4e788ed138833af30d580c6c8342325db256f02086cec8c3ffa6124f2f4a4b', '[\"*\"]', NULL, NULL, '2025-04-27 11:06:15', '2025-04-27 11:06:15'),
(8, 'App\\Models\\User', 1, 'token', '7043f004c5588375487c4fcf37f5b2a355bb3b6b150ddeeb869e71e4dcb7cb19', '[\"*\"]', '2025-06-29 10:53:18', NULL, '2025-04-27 11:06:17', '2025-06-29 10:53:18'),
(9, 'App\\Models\\User', 1, 'token', 'eb3aaed7477912354ec4316f09b6a5a9df3fb954094c6c29b69b43dc3c2bf402', '[\"*\"]', '2025-09-14 05:56:30', NULL, '2025-04-27 11:55:56', '2025-09-14 05:56:30'),
(10, 'App\\Models\\User', 1, 'token', '05428072dd67e8421e80c16cc90e0ee2645106c8e998f06022768694c484f634', '[\"*\"]', '2025-08-14 06:25:12', NULL, '2025-07-09 08:47:44', '2025-08-14 06:25:12'),
(11, 'App\\Models\\User', 3, 'token', 'f88a42d983417b87042320b88b14994c4bcf1b3dea4b0e07e6c2f7a3b4435c72', '[\"*\"]', '2025-08-18 09:24:21', NULL, '2025-08-14 06:28:57', '2025-08-18 09:24:21'),
(12, 'App\\Models\\User', 1, 'token', 'e11e2962e1173aace812767203c57c7d01d308e6f860feeac5ad2d630baa4168', '[\"*\"]', '2025-08-18 09:26:50', NULL, '2025-08-18 09:26:11', '2025-08-18 09:26:50'),
(13, 'App\\Models\\User', 1, 'token', '01af1351696360721c0ba028e47194703c691b336ca654ad96d600e5d1654751', '[\"*\"]', NULL, NULL, '2025-08-18 09:26:46', '2025-08-18 09:26:46'),
(14, 'App\\Models\\User', 1, 'token', '021e8309cd0ce91783a74edfd636067c846c9c7571c46cb648383350d7b5892f', '[\"*\"]', '2025-08-24 08:52:11', NULL, '2025-08-18 09:36:46', '2025-08-24 08:52:11'),
(15, 'App\\Models\\User', 1, 'token', 'cea021579dfc57173f5ba0a6060e82e052f8808f3c7626f95a87aa31fc339dce', '[\"*\"]', '2025-09-02 22:43:48', NULL, '2025-08-24 08:56:34', '2025-09-02 22:43:48'),
(16, 'App\\Models\\User', 1, 'token', '7d682f3e974fdbfaa0984bb9a204549f2fff0ae7ea9f07e2a8393d905add3ee6', '[\"*\"]', '2025-09-12 07:54:54', NULL, '2025-09-02 22:57:30', '2025-09-12 07:54:54'),
(17, 'App\\Models\\User', 3, 'token', '1421967b7121a6d251f7fdacdb06acadc6da26b203d7c535a2fcb4b65fb26ea6', '[\"*\"]', '2025-09-13 03:42:30', NULL, '2025-09-12 08:07:55', '2025-09-13 03:42:30'),
(18, 'App\\Models\\User', 1, 'token', '343c3c39017e903d1f2ae06ea8a32a5bc5e0934df0994e80a5674a5ec29d2233', '[\"*\"]', NULL, NULL, '2025-09-13 07:19:26', '2025-09-13 07:19:26'),
(19, 'App\\Models\\User', 1, 'token', '913472a0ad8dda8fd3e02f014be98d563a58f938466d264c63a73f0f4725ff36', '[\"*\"]', '2025-09-13 07:20:00', NULL, '2025-09-13 07:19:27', '2025-09-13 07:20:00'),
(20, 'App\\Models\\User', 1, 'token', 'b8c68b5be33a56a956d801c8080cefe79ca0b9a55209331307b7b576387adfda', '[\"*\"]', '2025-09-14 04:50:51', NULL, '2025-09-14 03:40:01', '2025-09-14 04:50:51'),
(21, 'App\\Models\\User', 1, 'token', 'aea656b44763064f7a8e41db419b59cb16c6a9b57e9853e38757080ed7687f63', '[\"*\"]', '2025-09-14 06:02:41', NULL, '2025-09-14 05:27:07', '2025-09-14 06:02:41'),
(22, 'App\\Models\\User', 1, 'token', 'd1cc5012be6b3b4ac10ff2309fc65402b4e4acbc82aac62225ed0b69e8c2118c', '[\"*\"]', NULL, NULL, '2025-09-14 05:55:52', '2025-09-14 05:55:52'),
(23, 'App\\Models\\User', 1, 'token', '2363cc2710d038f66fc037b2ff188d8a79842baa849dffdce82c16c54f2ff981', '[\"*\"]', NULL, NULL, '2025-09-14 05:56:44', '2025-09-14 05:56:44'),
(24, 'App\\Models\\User', 1, 'token', 'b3e4d382fbf588a7b61e2cc2c672d33dd75c75998662a69b9e1655f9e8d057b9', '[\"*\"]', '2025-09-14 08:36:54', NULL, '2025-09-14 06:00:44', '2025-09-14 08:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES
(2, 4, 'Basic Knowledge (update)', 1, '2025-05-05 15:11:42', '2025-05-12 23:57:46'),
(4, 4, 'New Requirement', 0, '2025-05-05 15:28:23', '2025-05-12 23:57:46'),
(7, 6, 'Requirement 1', 1000, '2025-07-27 04:06:52', '2025-07-27 04:06:52'),
(8, 3, 'Basic math skills for handling calculations.', 1000, '2025-08-14 06:07:35', '2025-08-14 06:07:35'),
(9, 3, 'Access to a computer or smartphone with internet connection.', 1000, '2025-08-14 06:07:40', '2025-08-14 06:07:40'),
(10, 3, 'A willingness to track and review personal financial data.', 1000, '2025-08-14 06:07:44', '2025-08-14 06:07:44'),
(11, 3, 'An open mindset to change money habits.', 1000, '2025-08-14 06:07:48', '2025-08-14 06:07:48'),
(12, 7, 'Basic math skills for handling calculations.', 1000, '2025-08-14 06:21:39', '2025-08-14 06:21:39'),
(13, 7, 'Access to a computer or smartphone with internet connection.', 1000, '2025-08-14 06:21:47', '2025-08-14 06:21:47'),
(14, 7, 'A willingness to track and review personal financial data.', 1000, '2025-08-14 06:21:58', '2025-08-14 06:21:58'),
(15, 8, 'A guitar (acoustic or electric).', 1000, '2025-08-14 06:36:07', '2025-08-14 06:36:07'),
(16, 8, 'A guitar pick (optional but recommended).', 1000, '2025-08-14 06:36:11', '2025-08-14 06:36:11'),
(17, 8, 'Access to a tuner or tuning app.', 1000, '2025-08-14 06:36:16', '2025-08-14 06:36:16'),
(18, 8, 'A willingness to practice regularly.', 1000, '2025-08-14 06:36:20', '2025-08-14 06:36:20'),
(19, 9, 'A guitar (acoustic or electric).', 1000, '2025-08-14 06:42:05', '2025-08-14 06:42:05'),
(20, 9, 'A guitar pick (optional but recommended).', 1000, '2025-08-14 06:42:11', '2025-08-14 06:42:11'),
(21, 9, 'Access to a tuner or tuning app.', 1000, '2025-08-14 06:42:16', '2025-08-14 06:42:16'),
(22, 9, 'Willingness to practice regularly.', 1000, '2025-08-14 06:42:20', '2025-08-14 06:42:20'),
(23, 10, 'A DSLR, mirrorless, or good smartphone camera.', 1000, '2025-08-14 06:57:29', '2025-08-14 06:57:29'),
(24, 10, 'Basic computer skills for photo editing.', 1000, '2025-08-14 06:57:33', '2025-08-14 06:57:33'),
(25, 10, 'Willingness to practice regularly.', 1000, '2025-08-14 06:57:45', '2025-08-14 06:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `course_id`, `rating`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 9, 5, 'One more feedback.', 1, '2025-09-12 07:54:54', '2025-09-12 07:54:54'),
(3, 3, 9, 4, 'Overall, I am very satisfied with the course and feel more confident about applying the skills I learned. Thank you for creating such a valuable learning experience!', 1, '2025-09-12 08:09:00', '2025-09-12 08:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0n5GeMnXKPHOUzjDjAalaIG4AMa5cqzDTwg1jaYv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmxhbUdCbHU1b29LNXFBY1BlVjZsU2tSc21FaWtwNDJTZmNJYm5LeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745138978),
('65DfFcsfwGZTmLatixOse4UOhwiuqYkd60vPe1Om', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWndDRkE1cDZ0aENyVklMd2NiRDRCcm5pOVB4MmVUVzd6UFdZWm1HeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744566785),
('q8SfkNHgfN1Ic8CQacACtGQQ1LgBfucWmmmZeVx6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUWVvdWM5aEVsRGVGa1diYW1Td2luWXA4Um1NWUVsOGNoNDFKOVFTViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1745209002);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohit Singh', 'mohit@example.com', NULL, '$2y$12$sQtLDtUUlG6Gs.YlfhHlv.oo/1hVYIJjP1QZicSUM59DI9ZAqM72i', NULL, '2025-04-20 03:43:25', '2025-09-14 06:00:27'),
(2, 'John Doe', 'johndoe@example.com', NULL, '$2y$12$Sq0aqRfkOxY30qerYn1PFOplpCkupMZbm6uXPGvL3KJZ91s1HCeDy', NULL, '2025-04-20 06:10:04', '2025-04-20 06:10:04'),
(3, 'Ravi Singh', 'ravi@example.com', NULL, '$2y$12$8exzd9SnGp7Mx12FZZdjTeIAoNTgtFXiyfOne1cCqvHwikK0Ty1DG', NULL, '2025-04-20 06:12:04', '2025-04-20 06:12:04'),
(4, 'Bauwa', 'bauwa@example.com', NULL, '$2y$12$pLtUUj7QG0Q82sJpDfHMoe1BdtUL9Zz5UiFG1.w1MgGSELek6UMxG', NULL, '2025-04-20 06:22:42', '2025-04-20 06:22:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_user_id_foreign` (`user_id`),
  ADD KEY `activities_course_id_foreign` (`course_id`),
  ADD KEY `activities_chapter_id_foreign` (`chapter_id`),
  ADD KEY `activities_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_course_id_foreign` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_category_id_foreign` (`category_id`),
  ADD KEY `courses_level_id_foreign` (`level_id`),
  ADD KEY `courses_language_id_foreign` (`language_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_chapter_id_foreign` (`chapter_id`);

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
-- Indexes for table `outcomes`
--
ALTER TABLE `outcomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `outcomes_course_id_foreign` (`course_id`);

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
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requirements_course_id_foreign` (`course_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_course_id_foreign` (`course_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `outcomes`
--
ALTER TABLE `outcomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `outcomes`
--
ALTER TABLE `outcomes`
  ADD CONSTRAINT `outcomes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requirements`
--
ALTER TABLE `requirements`
  ADD CONSTRAINT `requirements_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
