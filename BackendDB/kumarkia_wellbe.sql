-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 30, 2023 at 11:00 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kumarkia_wellbe`
--

-- --------------------------------------------------------

--
-- Table structure for table `audio_video`
--

CREATE TABLE `audio_video` (
  `id` int(11) NOT NULL,
  `recommendation_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `audio_video`
--

INSERT INTO `audio_video` (`id`, `recommendation_id`, `type`, `title`, `link`, `created_at`, `updated_at`) VALUES
(3, 1, 'Video', 'Test1', '1690785855.mp4', '2023-07-31 17:21:48', '2023-07-31 06:44:15'),
(1, 1, 'Video', 'Test2', '1690785373.mp4', '2023-07-31 17:21:55', '2023-07-31 06:36:13'),
(4, 1, 'Video', 'Test3', '1690786598.mp4', '2023-07-31 17:22:08', '2023-07-31 06:56:39'),
(5, 1, 'Video', 'Test4', '1690786806.mp4', '2023-07-31 17:22:15', '2023-07-31 07:00:07'),
(7, 1, 'Audio', 'drum', '1691302591.mp3', '2023-08-07 02:28:36', '2023-08-06 06:16:31'),
(8, 1, 'Audio', 'Audio test', '1691375043.mp3', '2023-08-06 20:54:03', '2023-08-07 02:24:03'),
(9, 1, 'Audio', 'AudioTest3', '1691375572.mp3', '2023-08-06 21:02:52', '2023-08-07 02:32:52'),
(10, 3, 'Video', 'Fear Video', '1692952460.mp4', '2023-08-25 03:04:21', '2023-08-25 08:34:21'),
(11, 3, 'Video', 'Fear Video', '1692952491.mp4', '2023-08-25 03:04:52', '2023-08-25 08:34:52'),
(12, 9, 'Audio', 'Title 1', '1692956450.mp3', '2023-08-25 04:10:50', '2023-08-25 09:40:50'),
(13, 9, 'Video', 'Video 1', '1692956495.mp4', '2023-08-25 04:11:35', '2023-08-25 09:41:35'),
(14, 9, 'Audio', 'Audio 1', '1692956537.mp3', '2023-08-25 04:12:17', '2023-08-25 09:42:17'),
(15, 9, 'Audio', 'Audio 2', '1692956553.mp3', '2023-08-25 04:12:33', '2023-08-25 09:42:33'),
(16, 9, 'Audio', 'Audio 1', '1692956651.mp3', '2023-08-25 04:14:11', '2023-08-25 09:44:11'),
(17, 9, 'Video', 'Video 1', '1692956665.mp4', '2023-08-25 04:14:25', '2023-08-25 09:44:25'),
(18, 9, 'Audio', 'Audio 2', '1692956679.mp3', '2023-08-25 04:14:39', '2023-08-25 09:44:39'),
(19, 9, 'Audio', 'Audio 1', '1692956693.mp3', '2023-08-25 04:14:53', '2023-08-25 09:44:53'),
(20, 9, 'Video', 'Video 4', '1692957513.mp4', '2023-08-25 04:28:33', '2023-08-25 09:58:33'),
(21, 9, 'Video', 'VIdeo', '1692957526.mp4', '2023-08-25 04:28:46', '2023-08-25 09:58:46'),
(22, 9, 'Video', 'Video', '1692957537.mp4', '2023-08-25 04:28:57', '2023-08-25 09:58:57'),
(23, 9, 'Video', 'Video', '1692957538.mp4', '2023-08-25 04:28:58', '2023-08-25 09:58:58'),
(24, 9, 'Video', 'Video', '1692957550.mp4', '2023-08-25 04:29:10', '2023-08-25 09:59:10'),
(25, 9, 'Video', 'Video', '1692957562.mp4', '2023-08-25 04:29:22', '2023-08-25 09:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `available_type`
--

CREATE TABLE `available_type` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `available_type`
--

INSERT INTO `available_type` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Video Call', '2023-08-25 09:54:39', NULL),
(2, 'Audio Call', '2023-08-25 09:54:52', NULL),
(3, 'Chat', '2023-08-25 09:55:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consult_doctors`
--

CREATE TABLE `consult_doctors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `profession` varchar(200) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `profile_pic` text DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `availability` text DEFAULT NULL,
  `expertise` text DEFAULT NULL,
  `language` text DEFAULT NULL,
  `available_type` text DEFAULT NULL,
  `conslt_fee` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `consult_doctors`
--

INSERT INTO `consult_doctors` (`id`, `user_id`, `name`, `email`, `mobile`, `profession`, `about`, `profile_pic`, `experience`, `availability`, `expertise`, `language`, `available_type`, `conslt_fee`, `created_at`, `updated_at`) VALUES
(3, 1, 'Doctor 2', 'doctor2@gmail.com', '12345678', NULL, '<p>This description is for second doctor</p>', '1692954556.png', '10 Years', '10 Years', 'Mental Proficiency', 'Hindi', 'Audio Call', '2000', '2023-08-25 03:39:16', '2023-08-25 09:09:16'),
(2, 1, 'Doctor 1', 'doctor1@gmail.com', '123456', NULL, '<p>This description is for first doctor</p>', '1692954477.png', '4 Years', '4 Years', 'Mind Mastery', 'English', 'Video Call', '1000', '2023-08-25 03:37:57', '2023-08-25 09:07:57'),
(4, 1, 'Doctor 3', 'doctor3@gmail.com', '12345689', NULL, '<p>THis description is for third doctor</p>', '1692954652.jpg', '2 Years', '2 Years', 'Behavioral Specialization', 'Urdu', 'Audio Call', '3000', '2023-08-25 03:40:53', '2023-08-25 09:10:53'),
(5, 1, 'Doctor 4', 'doctor4@gmail.com', '12345689101', NULL, '<p>This description is for doctor 4</p>', '1692954740.png', '14 Years', '14 Years', 'Mental Proficiency', 'Hindi', 'Chat', '5000', '2023-08-25 03:42:20', '2023-08-25 09:12:20'),
(6, 1, 'Doctor 5', 'doctor5@gmail.com', '12345689', NULL, '<p>This descritption is for fith doctor</p>', '1692954830.jpg', '1 Years', '1 Years', 'Behavioral Specialization', 'Urdu', 'Audio Call', '1000', '2023-08-25 03:43:51', '2023-08-25 09:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `consult_doctors_appointment`
--

CREATE TABLE `consult_doctors_appointment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `session_mode` varchar(200) DEFAULT NULL,
  `time_slot` varchar(200) DEFAULT NULL,
  `session_duration` varchar(100) DEFAULT NULL,
  `session_price` varchar(200) DEFAULT NULL,
  `under_18` tinyint(1) DEFAULT 0,
  `guardian_name` varchar(200) DEFAULT NULL,
  `guardian_email` varchar(200) DEFAULT NULL,
  `guardian_mobile` varchar(20) DEFAULT NULL,
  `client_details` text DEFAULT NULL,
  `client_mobile` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `consult_doctors_appointment`
--

INSERT INTO `consult_doctors_appointment` (`id`, `user_id`, `doctor_id`, `appointment_date`, `session_mode`, `time_slot`, `session_duration`, `session_price`, `under_18`, `guardian_name`, `guardian_email`, `guardian_mobile`, `client_details`, `client_mobile`, `created_at`, `updated_at`) VALUES
(1, 5, 1, '2023-08-21 00:00:00', 'Video Call', '09:00AM', '30min', '100', 1, 'Test gardian', 'gardian@gmail.com', '98977868688', 'Tetsttt', '987654321', '2023-08-21 06:59:51', '2023-08-21 12:29:51'),
(2, 5, 1, '2023-08-21 00:00:00', 'Video Call', '09:00AM', '30min', '100', 1, 'Test gardian', 'gardian@gmail.com', '98977868688', 'Tetsttt', '987654321', '2023-08-22 00:45:28', '2023-08-22 06:15:28'),
(3, 27, 1, '2023-08-24 00:00:00', 'Voice Call', '01:00 PM', '50', '400', 1, 'Jaseem', 'gardo@gmail.com', '03329645789', 'gardo', NULL, '2023-08-22 03:13:07', '2023-08-22 08:43:07'),
(4, 27, 1, '2023-08-16 00:00:00', 'Voice Call', '04:00 PM', '50', '400', 1, 'chako bhai', 'chalo@gmail.com', '03329634789', 'shyam', NULL, '2023-08-22 03:24:53', '2023-08-22 08:54:53'),
(5, 5, 1, '2023-08-21 00:00:00', 'Video Call', '09:00AM', '30min', '100', 0, NULL, NULL, NULL, 'Tetsttt', '987654321', '2023-08-22 03:28:48', '2023-08-22 08:58:48'),
(6, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'hsyam', '33296334789', '2023-08-22 04:46:28', '2023-08-22 10:16:28'),
(7, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 1, 'hero khan', 'hero@gmail.com', '+923477045304', 'chalo khan', '3329634789', '2023-08-22 04:58:26', '2023-08-22 10:28:26'),
(8, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'hello bhai', '3329634789', '2023-08-22 05:03:46', '2023-08-22 10:33:46'),
(9, 5, 1, '2023-08-21 00:00:00', 'Video Call', '09:00AM', '30min', '100', 0, NULL, NULL, NULL, 'Tetsttt', '987654321', '2023-08-22 05:15:09', '2023-08-22 10:45:09'),
(10, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'chalo', '3329634789', '2023-08-22 05:19:56', '2023-08-22 10:49:56'),
(11, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'gugug', '33297789122', '2023-08-22 05:29:43', '2023-08-22 10:59:43'),
(12, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'hello bhai', '3329634789', '2023-08-22 05:34:00', '2023-08-22 11:04:00'),
(13, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 05:36:27', '2023-08-22 11:06:27'),
(14, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'hyam', '3329634789', '2023-08-22 05:41:28', '2023-08-22 11:11:28'),
(15, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 05:55:06', '2023-08-22 11:25:06'),
(16, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 05:58:59', '2023-08-22 11:28:59'),
(17, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:02:10', '2023-08-22 11:32:10'),
(18, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:03:07', '2023-08-22 11:33:07'),
(19, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:03:49', '2023-08-22 11:33:49'),
(20, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:06:27', '2023-08-22 11:36:27'),
(21, 27, 1, '2023-08-22 00:00:00', 'Video Call', '10:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:09:56', '2023-08-22 11:39:56'),
(22, 27, 1, '2023-08-22 00:00:00', 'Video Call', '10:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:13:52', '2023-08-22 11:43:52'),
(23, 27, 1, '2023-08-22 00:00:00', 'Video Call', '10:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shaym', '3329634789', '2023-08-22 06:15:51', '2023-08-22 11:45:51'),
(24, 27, 1, '2023-08-22 00:00:00', 'Video Call', '10:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:18:22', '2023-08-22 11:48:22'),
(25, 27, 1, '2023-08-22 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 06:21:36', '2023-08-22 11:51:36'),
(26, 27, 1, '2023-08-23 00:00:00', 'Voice Call', '01:00 PM', '50', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 22:59:13', '2023-08-23 04:29:13'),
(27, 27, 1, '2023-08-23 00:00:00', 'Voice Call', '09:00 AM', '30', '400', 1, 'zoro', 'zoro@gmail.com', '3329634789', 'shyam', '3477045304', '2023-08-22 23:30:54', '2023-08-23 05:00:54'),
(28, 27, 1, '2023-08-25 00:00:00', 'Voice Call', '01:00 PM', '50', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 23:39:43', '2023-08-23 05:09:43'),
(29, 27, 1, '2023-08-23 00:00:00', 'Voice Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '3329634789', '2023-08-22 23:46:20', '2023-08-23 05:16:20'),
(30, 14, 1, '2023-08-24 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'shyam', '923329634789', '2023-08-23 23:38:07', '2023-08-24 05:08:07'),
(31, 14, 1, '2023-08-30 00:00:00', 'Voice Call', '01:00 PM', '50', '400', 1, 'chalo', 'chalo@gmail.com', '923329834789', 'dedo', '923329634789', '2023-08-24 23:56:36', '2023-08-25 05:26:36'),
(32, 14, 5, '2023-08-26 00:00:00', 'Video Call', '09:00 AM', '30', '400', 0, NULL, NULL, NULL, 'Shyam', '923329634789', '2023-08-26 05:21:37', '2023-08-26 10:51:37'),
(33, 14, 6, '2023-08-26 00:00:00', 'Voice Call', '03:00 PM', '30', '400', 1, 'Hhg Jhgt', 'xyz1233456@gmail.com', '923329634789', 'Hhtrh', '923329634789', '2023-08-26 06:09:40', '2023-08-26 11:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `expertise`
--

CREATE TABLE `expertise` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `expertise`
--

INSERT INTO `expertise` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Mind Mastery', '2023-08-25 09:31:46', NULL),
(2, 'Mental Proficiency', '2023-08-25 09:31:46', NULL),
(3, 'Behavioral Specialization', '2023-08-25 09:32:48', NULL);

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
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`id`, `user_id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(3, 1, 'This is Journal Title 2', '<p>This is Journal Description 2</p>', '1692955311.png', '2023-08-25 03:51:51', '2023-08-25 09:21:51'),
(2, 1, 'This is Journal Title 1', '<p>This is journal Descritpion1</p>', '1692954913.png', '2023-08-25 03:45:13', '2023-08-25 09:15:13'),
(4, 1, 'Journal Title 3', '<p>This is Journal Description</p>', '1692955336.jpg', '2023-08-25 03:52:16', '2023-08-25 09:22:16'),
(5, 1, 'Journal Title 4', '<p>This is Journal Description 4</p>', '1692955368.png', '2023-08-25 03:52:48', '2023-08-25 09:22:48'),
(6, 1, 'Journal Title 5', '<p>This is Journal Descritpion 5</p>', '1692955399.png', '2023-08-25 03:53:19', '2023-08-25 09:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `journal_question`
--

CREATE TABLE `journal_question` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `journal_question`
--

INSERT INTO `journal_question` (`id`, `journal_id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(5, 2, '<p>This is Jounranl Question 1</p>', '<p>This is Jounranl answer&nbsp;1</p>', '1', '2023-08-25 03:53:51', '2023-08-25 09:23:51'),
(6, 2, '<p>This is Jounranl Question 2</p>', '<p>This is Jounranl answer 2</p>', '1', '2023-08-25 03:54:24', '2023-08-25 09:24:24'),
(7, 3, '<p>This is Jounranl Question 3</p>', '<p>This is Jounranl answer&nbsp;3</p>', '1', '2023-08-25 03:54:50', '2023-08-25 09:24:50'),
(8, 4, '<p>This is Journal&nbsp;Question 4</p>', '<p>This is Journal answer 4</p>', '1', '2023-08-25 03:55:21', '2023-08-25 09:25:21'),
(9, 5, '<p>This is Journal&nbsp;Question 5</p>', '<p>This is Journal answer 5</p>', '1', '2023-08-25 03:55:44', '2023-08-25 09:25:44'),
(10, 6, '<p>This is Journal&nbsp;Question 5</p>', '<p>This is Journal answer 5</p>', '1', '2023-08-25 03:55:59', '2023-08-25 09:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'English', '2023-08-25 09:20:04', NULL),
(2, 'Hindi', '2023-08-25 09:20:04', NULL),
(3, 'Urdu', '2023-08-25 09:20:23', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `moods`
--

CREATE TABLE `moods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `status` enum('E','D') DEFAULT 'E' COMMENT 'E-Enable,D-Disable',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `moods`
--

INSERT INTO `moods` (`id`, `name`, `description`, `image`, `color`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Happy', '<p>Based on the emotion(s) selected, we can recommend activities and exercises to celebrate your happiness and find ways to deepen your experience of joy and fulfilment.</p>', '1689920253.png', '#e2f2ff', 'E', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(3, 'Surprised', '<p>Based on the emotion(s) selected, we can recommend activities and exercises to help you&nbsp;explore any accompanying emotions that you may be feeling.</p>', '1689920653.png', '#daedd9', 'E', '2023-07-21 00:54:13', '2023-07-21 06:24:13'),
(4, 'Sad', '<p>Based on the emotion(s) selected, we can recommend activities and exercises to find ways to cultivate more positive emotions.</p>', '1689920987.png', '#ffffd8', 'E', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(5, 'Disgusted', '<p>Based on the emotion(s) selected, we can recommend activities and exercises to find ways to cultivate more positive emotions.</p>', '1689921248.png', '#fae1d2', 'E', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(6, 'Bad', '<p>Based on the emotion(s) selected, we can recommend activities and exercises to find ways to cultivate more positive emotions.</p>', '1689921505.png', '#ffe9f3', 'E', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(7, 'Anger', '<p>Based on the emotion(s) selected, we can recommend activities and exercises to find ways to manage your anger in a healthy way.</p>', '1689921860.png', '#fedcdc', 'E', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(8, 'Fear', '<p>Based on the emotion(s) selected, we can recommend activities and exercises to explore&nbsp;your fears and find ways to manage them.</p>', '1689922087.png', '#e4e1ff', 'E', '2023-07-21 01:18:07', '2023-07-21 06:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `moods_question`
--

CREATE TABLE `moods_question` (
  `id` int(11) NOT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `moods_question`
--

INSERT INTO `moods_question` (`id`, `mood_id`, `sub_mood_id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 77, '<p>Question1</p>', '<p>Answer1</p>', '1', '2023-08-01 16:56:55', '2023-08-01 16:56:55'),
(3, 8, 79, '<p>The first Question for Mood Fear and sub-mood is Anxious?</p>', '<p>The first Answer&nbsp;for Mood Fear and sub mood is Anxious.</p>', '1', '2023-08-25 03:10:16', '2023-08-25 08:40:16'),
(4, 8, 79, '<p>Second Question for Mood Fear and sub mood is Anxious?</p>', '<p>Second Answer&nbsp;for Mood Fear and sub mood is Anxious</p>', '1', '2023-08-25 03:11:03', '2023-08-25 08:41:03'),
(5, 7, 77, '<p>First Question for Mood Anger&nbsp;and sub mood is Nervous</p>', '<p>First Question for Mood Anger&nbsp;and sub mood is Nervous</p>', '1', '2023-08-25 03:11:54', '2023-08-25 08:41:54'),
(6, 7, 76, '<p>second&nbsp;Question for Mood Anger&nbsp;and sub mood is worried</p>', '<p>Second answer for Mood anger&nbsp;and sub mood is worried</p>', '1', '2023-08-25 03:12:53', '2023-08-25 08:42:53'),
(7, 7, 75, '<p>Third Question for Mood Anger&nbsp;and sub mood is stressed</p>', '<p>Third answer&nbsp;for Mood Anger&nbsp;and sub mood is stressed</p>', '1', '2023-08-25 03:14:33', '2023-08-25 08:44:33'),
(8, 7, 72, '<p>Fourth Question for Mood Anger&nbsp;and sub mood is out of control</p>', '<p>Fourth Question for Mood Anger&nbsp;and sub mood is out of control</p>', '1', '2023-08-25 03:15:46', '2023-08-25 08:45:46'),
(9, 7, 64, '<p>Fifth&nbsp;Question for Mood Anger&nbsp;and sub mood is out of Annoyed</p>', '<p>Fifth Answer&nbsp;for Mood Anger&nbsp;and sub mood is out of Annoyed</p>', '1', '2023-08-25 03:16:31', '2023-08-25 08:46:31'),
(10, 6, 79, '<p>First&nbsp;Question for Bad&nbsp;Anger&nbsp;and sub mood is out of Anxious</p>', '<p>First&nbsp;Question for Bad&nbsp;Anger&nbsp;and sub mood is out of Anxious</p>', '1', '2023-08-25 03:21:46', '2023-08-25 08:51:46'),
(11, 6, 78, '<p>Second Question for Bad&nbsp;Anger&nbsp;and sub mood is out of upset</p>', '<p>Second Question for Bad&nbsp;Anger&nbsp;and sub mood is out of upset</p>', '1', '2023-08-25 03:22:13', '2023-08-25 08:52:13'),
(12, 6, 77, '<p>Third Question for Bad&nbsp;Anger&nbsp;and sub mood is out of Nervous</p>', '<p>Third Question for Bad&nbsp;Anger&nbsp;and sub mood is out of Nervous</p>', '1', '2023-08-25 03:22:43', '2023-08-25 08:52:43'),
(13, 6, 76, '<p>Fourth Question for Bad&nbsp;Anger&nbsp;and sub mood is out of Worried</p>', '<p>Fourth Question for Bad&nbsp;Anger&nbsp;and sub mood is out of Worried</p>', '1', '2023-08-25 03:23:27', '2023-08-25 08:53:27'),
(14, 5, 79, '<p>First&nbsp;Question for Disgusted&nbsp;&nbsp;and sub mood is out of Anxious</p>', '<p>First&nbsp;Question for Disgusted&nbsp;&nbsp;and sub mood is out of Anxious</p>', '1', '2023-08-25 03:24:09', '2023-08-25 08:54:09'),
(15, 5, 78, '<p>Second Question for Disgusted&nbsp;&nbsp;and sub mood is out of Upset</p>', '<p>Second Question for Disgusted&nbsp;&nbsp;and sub mood is out of Upset</p>', '1', '2023-08-25 03:24:34', '2023-08-25 08:54:34'),
(16, 5, 77, '<p>Third&nbsp;Question for Disgusted&nbsp;&nbsp;and sub mood is out of Nervous</p>', '<p>Third&nbsp;Answer&nbsp;for Disgusted&nbsp;&nbsp;and sub mood is out of Nervous</p>', '1', '2023-08-25 03:25:10', '2023-08-25 08:55:10'),
(17, 5, 74, '<p>Fourth Question for Disgusted&nbsp;&nbsp;and sub mood is out of Confused</p>', '<p>Fourth Answer&nbsp;for Disgusted&nbsp;&nbsp;and sub mood is out of Confused</p>', '1', '2023-08-25 03:25:49', '2023-08-25 08:55:49'),
(18, 5, 64, '<p>Five&nbsp;Question for Disgusted&nbsp;&nbsp;and sub mood is out of Annoyed</p>', '<p>Five Answer&nbsp;for Disgusted&nbsp;&nbsp;and sub mood is out of Annoyed</p>', '1', '2023-08-25 03:26:23', '2023-08-25 08:56:23'),
(19, 4, 79, '<p>First&nbsp;Question for Sad Mood&nbsp; and sub mood is out of Anxious</p>', '<p>First&nbsp;answer for Sad Mood&nbsp; and sub mood is out of Anxious</p>', '1', '2023-08-25 03:27:13', '2023-08-25 08:57:13'),
(20, 4, 78, '<p>Second&nbsp;Question for Sad Mood&nbsp; and sub mood is out of upset</p>', '<p>Second Answer&nbsp;for Sad Mood&nbsp; and sub mood is out of upset</p>', '1', '2023-08-25 03:27:48', '2023-08-25 08:57:48'),
(21, 4, 76, '<p>Third Question for Sad Mood&nbsp; and sub mood is out of worried</p>', '<p>Third Answer&nbsp;for Sad Mood&nbsp; and sub mood is out of worried</p>', '1', '2023-08-25 03:28:21', '2023-08-25 08:58:21'),
(22, 4, 70, '<p>Fourth Question for Sad Mood&nbsp; and sub mood is out of Humilated</p>', '<p>Fourth Answer&nbsp;for Sad Mood&nbsp; and sub mood is out of Humilated</p>', '1', '2023-08-25 03:28:59', '2023-08-25 08:58:59'),
(23, 3, 79, '<p>First Question for Surprised&nbsp;Mood&nbsp; and sub mood is out of Anxious</p>', '<p>First Answer&nbsp;for Surprised&nbsp;Mood&nbsp; and sub mood is out of Anxious</p>', '1', '2023-08-25 03:29:40', '2023-08-25 08:59:40'),
(24, 3, 78, '<p>Second&nbsp;Question for Surprised&nbsp;Mood&nbsp; and sub mood is out of Upset</p>', '<p>Second Answer&nbsp;for Surprised&nbsp;Mood&nbsp; and sub mood is out of Upset</p>', '1', '2023-08-25 03:30:14', '2023-08-25 09:00:14'),
(25, 3, 76, '<p>Third Question for Surprised&nbsp;Mood&nbsp; and sub mood is out of Worried</p>', '<p>Third answer for Surprised&nbsp;Mood&nbsp; and sub mood is out of Worried</p>', '1', '2023-08-25 03:30:41', '2023-08-25 09:00:41'),
(26, 3, 71, '<p>Fourth Question for Surprised&nbsp;Mood&nbsp; and sub mood is out of Unfocused</p>', '<p>Fourth Answer for Surprised&nbsp;Mood&nbsp; and sub mood is out of Unfocused</p>', '1', '2023-08-25 03:31:27', '2023-08-25 09:01:27'),
(27, 2, 79, '<p>First Question for Surprised&nbsp;Mood&nbsp; and sub mood is out of Anxious</p>', '<p>First Answer for Surprised&nbsp;Mood&nbsp; and sub mood is out of Anxious</p>', '1', '2023-08-25 03:32:26', '2023-08-25 09:02:26'),
(28, 2, 77, '<p>Second&nbsp;Question for Happy&nbsp;Mood&nbsp; and sub mood is Nervous</p>', '<p>Second&nbsp;Answer for Happy&nbsp;Mood&nbsp; and sub mood is Nervous</p>', '1', '2023-08-25 03:34:05', '2023-08-25 09:04:05'),
(29, 2, 62, '<p>Third Question for Happy&nbsp;Mood&nbsp; and sub mood is Jealous</p>', '<p>Third Answer for Happy&nbsp;Mood&nbsp; and sub mood is Jealous</p>', '1', '2023-08-25 03:34:32', '2023-08-25 09:04:32'),
(30, 2, 68, '<p>Fourth Question for Happy&nbsp;Mood&nbsp; and sub mood is aggresive</p>', '<p>Fourth Question for Happy&nbsp;Mood&nbsp; and sub mood is aggresive</p>', '1', '2023-08-25 03:34:59', '2023-08-25 09:04:59'),
(31, 2, 63, '<p>Fifth&nbsp;Question for Happy&nbsp;Mood&nbsp; and sub mood is disappointed</p>', '<p>Fifth Answer&nbsp;for Happy&nbsp;Mood&nbsp; and sub mood is disappointed</p>', '1', '2023-08-25 03:35:42', '2023-08-25 09:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `moods_recommendation`
--

CREATE TABLE `moods_recommendation` (
  `id` int(11) NOT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `moods_recommendation`
--

INSERT INTO `moods_recommendation` (`id`, `mood_id`, `sub_mood_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 30, '<p>Description&nbsp;</p>', '2023-07-31 05:39:12', '2023-07-31 05:39:12'),
(3, 8, 79, '<p>Description for the Mood Fear and sub mood is Anxious.</p>', '2023-08-25 03:02:12', '2023-08-25 08:32:12'),
(4, 7, 78, '<p>This description for Anger and sub Mood is Upset</p>', '2023-08-25 03:05:42', '2023-08-25 08:35:42'),
(5, 6, 77, '<p>This description for Bad mood and sub mood is nervous</p>', '2023-08-25 03:06:20', '2023-08-25 08:36:20'),
(6, 5, 76, '<p>This description for Disgusted Mood and sub mood is worried</p>', '2023-08-25 03:07:03', '2023-08-25 08:37:03'),
(7, 4, 74, '<p>This description is for sad and sub mood is confused</p>', '2023-08-25 03:07:38', '2023-08-25 08:37:38'),
(8, 3, 76, '<p>This description for surprised mood and sub-mood worried</p>', '2023-08-25 03:08:29', '2023-08-25 08:38:29'),
(9, 2, 64, '<p>This is for Happy mood and sub mood is annoyed</p>', '2023-08-25 03:09:00', '2023-08-25 08:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `moods_sub`
--

CREATE TABLE `moods_sub` (
  `id` int(11) NOT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_name` varchar(100) DEFAULT NULL,
  `sub_mood_color` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `moods_sub`
--

INSERT INTO `moods_sub` (`id`, `mood_id`, `sub_mood_name`, `sub_mood_color`, `created_at`, `updated_at`) VALUES
(7, 2, 'Grateful', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(8, 2, 'Proud', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(9, 2, 'Confident', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(10, 2, 'Hopeful', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(11, 2, 'Excited', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(12, 2, 'Powerful', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(13, 2, 'Relaxed', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(14, 2, 'Contetntful', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(15, 2, 'Optimistic', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(16, 2, 'Courageous', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(17, 2, 'Valued', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(18, 2, 'Respected', '#84ddff', '2023-07-21 00:47:33', '2023-07-21 06:17:33'),
(19, 3, 'Startled', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(20, 3, 'Confused', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(21, 3, 'Amazed', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(22, 3, 'Excited', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(23, 3, 'Shocked', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(24, 3, 'Preplexed', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(25, 3, 'Eager', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(26, 3, 'Energetic', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(27, 3, 'Awe', '#9ad197', '2023-07-21 00:54:14', '2023-07-21 06:24:14'),
(28, 4, 'Guilty', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(29, 4, 'Grief', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(30, 4, 'Helpless', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(31, 4, 'Hopeless', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(32, 4, 'Lonely', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(33, 4, 'Inferior', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(34, 4, 'Vulnerable', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(35, 4, 'Powerless', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(36, 4, 'Embarrassed', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(37, 4, 'Depressed', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(38, 4, 'Hurt', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(39, 4, 'Isolated', '#fee08d', '2023-07-21 00:59:47', '2023-07-21 06:29:47'),
(40, 5, 'Awful', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(41, 5, 'Repelled', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(42, 5, 'Disappointed', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(43, 5, 'Judgemental', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(44, 5, 'Appalled', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(45, 5, 'Horrified', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(46, 5, 'Hesitant', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(47, 5, 'Embarrassed', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(48, 5, 'Detestable', '#fcc292', '2023-07-21 01:04:08', '2023-07-21 06:34:08'),
(49, 6, 'Guilty', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(50, 6, 'Grief', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(51, 6, 'Helpless', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(52, 6, 'Hopeless', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(53, 6, 'Lonely', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(54, 6, 'Inferior', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(55, 6, 'Vulnerable', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(56, 6, 'Powerless', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(57, 6, 'Emarrassed', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(58, 6, 'Depressed', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(59, 6, 'Hurt', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(60, 6, 'Isolated', '#e09bbd', '2023-07-21 01:08:25', '2023-07-21 06:38:25'),
(61, 7, 'Frustrated', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(62, 7, 'Jealous', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(63, 7, 'Disappointed', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(64, 7, 'Annoyed', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(65, 7, 'Ashamed', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(66, 7, 'Disrespected', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(67, 7, 'Embarrassed', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(68, 7, 'Aggressive', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(69, 7, 'Out of Control', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(70, 7, 'Humiliated', '#eaa1a3', '2023-07-21 01:14:20', '2023-07-21 06:44:20'),
(71, 8, 'Unfocused', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(72, 8, 'Out of Control', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(73, 8, 'Overwhelmed', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(74, 8, 'Confused', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(75, 8, 'Stressed', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(76, 8, 'Worried', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(77, 8, 'Nervous', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(78, 8, 'Upset', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07'),
(79, 8, 'Anxious', '#b8b1f5', '2023-07-21 01:18:07', '2023-07-21 06:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `moods_tracker`
--

CREATE TABLE `moods_tracker` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_id` int(11) DEFAULT NULL,
  `journal_it_down` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `moods_tracker`
--

INSERT INTO `moods_tracker` (`id`, `user_id`, `mood_id`, `sub_mood_id`, `journal_it_down`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 5, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '2023-07-13 18:30:00', '2023-07-11 08:16:02'),
(2, 5, 1, 2, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '0000-00-00 00:00:00', '2023-07-12 08:28:25'),
(3, 5, 1, 2, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '2023-07-16 01:41:34', '2023-07-16 07:11:34'),
(4, 5, 1, 2, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '2023-07-17 03:58:55', '2023-07-17 09:28:55'),
(5, 5, 1, 2, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '2023-07-17 04:13:12', '2023-07-17 09:43:12'),
(6, 5, 1, 2, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '2023-07-17 04:50:06', '2023-07-17 10:20:06'),
(7, 5, 1, 2, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '2023-07-17 05:34:48', '2023-07-17 11:04:48'),
(8, 5, 1, 2, 'hello', '2023-07-17 05:43:28', '2023-07-17 11:13:28'),
(9, 5, 1, 2, 'hello', '2023-07-17 05:45:30', '2023-07-17 11:15:30'),
(10, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 06:02:16', '2023-07-17 11:32:16'),
(11, 13, 1, 6, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 06:05:11', '2023-07-17 11:35:11'),
(12, 13, 1, 6, 'hello  how are you', '2023-07-17 06:07:01', '2023-07-17 11:37:01'),
(13, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 06:18:39', '2023-07-17 11:48:39'),
(14, 13, 1, 6, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 06:44:33', '2023-07-17 12:14:33'),
(15, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 06:45:25', '2023-07-17 12:15:25'),
(16, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 06:46:09', '2023-07-17 12:16:09'),
(17, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 06:47:01', '2023-07-17 12:17:01'),
(18, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:00:24', '2023-07-17 12:30:24'),
(19, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:01:12', '2023-07-17 12:31:12'),
(20, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:14:04', '2023-07-17 12:44:04'),
(21, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:15:54', '2023-07-17 12:45:54'),
(22, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:16:49', '2023-07-17 12:46:49'),
(23, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:33:56', '2023-07-17 13:03:56'),
(24, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:36:39', '2023-07-17 13:06:39'),
(25, 13, 1, 5, 'Take a moment to journal your thoughts and\nfeelings about your current experience of\nhappiness..', '2023-07-17 07:37:51', '2023-07-17 13:07:51'),
(26, 13, 1, 5, 'hello', '2023-07-17 07:38:27', '2023-07-17 13:08:27'),
(27, 13, 1, 5, 'very happy', '2023-07-17 07:40:08', '2023-07-17 13:10:08'),
(28, 13, 1, 5, 'Hello', '2023-07-17 07:52:14', '2023-07-17 13:22:14'),
(29, 13, 1, 5, 'hello', '2023-07-19 01:49:50', '2023-07-19 07:19:50'),
(30, 37, 1, 6, 'proud', '2023-07-19 02:42:42', '2023-07-19 08:12:42'),
(31, 37, 1, 5, 'hello', '2023-07-19 02:48:32', '2023-07-19 08:18:32'),
(32, 37, 1, 6, 'Hello', '2023-07-19 03:09:12', '2023-07-19 08:39:12'),
(33, 39, 1, 6, 'Iam Prpud', '2023-07-19 03:23:26', '2023-07-19 08:53:26'),
(34, 39, 1, 6, 'yoyoyo sunny singh', '2023-07-19 04:02:14', '2023-07-19 09:32:14'),
(35, 40, 1, 5, 'Hahaha', '2023-07-19 04:32:03', '2023-07-19 10:02:03'),
(36, 41, 1, 5, 'Ghgg', '2023-07-19 04:54:45', '2023-07-19 10:24:45'),
(37, 41, 1, 5, 'Ghgg', '2023-07-19 04:58:06', '2023-07-19 10:28:06'),
(38, 40, 1, 5, 'hahaha', '2023-07-19 05:00:02', '2023-07-19 10:30:02'),
(39, 39, 1, 5, 'Dgg', '2023-07-19 05:20:57', '2023-07-19 10:50:57'),
(40, 39, 1, 5, 'Dgg', '2023-07-19 05:21:50', '2023-07-19 10:51:50'),
(41, 39, 1, 5, 'Hahha', '2023-07-19 05:22:17', '2023-07-19 10:52:17'),
(42, 39, 1, 5, 'Dgg', '2023-07-19 06:04:19', '2023-07-19 11:34:19'),
(43, 39, 1, 5, 'greateful', '2023-07-19 23:13:10', '2023-07-20 04:43:10'),
(44, 39, 1, 5, 'Hello', '2023-07-20 02:38:20', '2023-07-20 08:08:20'),
(45, 39, 1, 5, 'haha', '2023-07-20 02:39:06', '2023-07-20 08:09:06'),
(46, 39, 1, 5, 'grateful', '2023-07-20 02:41:22', '2023-07-20 08:11:22'),
(47, 39, 1, 5, 'grateful', '2023-07-20 02:45:20', '2023-07-20 08:15:20'),
(48, 39, 1, 5, 'hello', '2023-07-20 02:46:20', '2023-07-20 08:16:20'),
(49, 5, 1, 2, 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface', '2023-07-24 08:03:36', '2023-07-24 13:33:36'),
(50, 46, 4, 39, 'Fvb', '2023-07-28 23:40:25', '2023-07-29 05:10:25'),
(51, 46, 4, 28, 'Ghhh', '2023-07-28 23:44:27', '2023-07-29 05:14:27'),
(52, 46, 4, 36, 'Gnn', '2023-07-28 23:47:49', '2023-07-29 05:17:49'),
(53, 46, 4, 33, 'Fhg', '2023-07-28 23:48:48', '2023-07-29 05:18:48'),
(54, 46, 4, 32, 'Ghh', '2023-07-30 23:18:20', '2023-07-31 04:48:20'),
(55, 39, 5, 40, 'hello', '2023-08-01 01:11:25', '2023-08-01 06:41:25'),
(56, 39, 5, 40, 'hello', '2023-08-01 01:11:40', '2023-08-01 06:41:40'),
(57, 39, 5, 40, 'hello', '2023-08-01 01:13:25', '2023-08-01 06:43:25'),
(58, 39, 6, 49, 'how are you', '2023-08-01 02:07:53', '2023-08-01 07:37:53'),
(59, 39, 2, 7, 'happy', '2023-08-01 02:27:07', '2023-08-01 07:57:07'),
(60, 39, 2, 7, 'happy hour', '2023-08-01 02:32:56', '2023-08-01 08:02:56'),
(61, 39, 3, 23, 'surprised', '2023-08-01 02:36:34', '2023-08-01 08:06:34'),
(62, 39, 3, 19, 'hahaah', '2023-08-01 02:37:43', '2023-08-01 08:07:43'),
(63, 39, 4, 28, 'guilty', '2023-08-01 03:49:17', '2023-08-01 09:19:17'),
(64, 39, 3, 26, 'hello', '2023-08-01 04:00:06', '2023-08-01 09:30:06'),
(65, 39, 3, 19, 'haha', '2023-08-01 04:10:22', '2023-08-01 09:40:22'),
(66, 39, 3, 20, 'hahah', '2023-08-01 04:18:46', '2023-08-01 09:48:46'),
(67, 39, 4, 28, 'ahahaha', '2023-08-01 04:39:38', '2023-08-01 10:09:38'),
(68, 39, 3, 19, 'hahaha', '2023-08-01 05:09:02', '2023-08-01 10:39:02'),
(69, 39, 4, 28, 'ghgh', '2023-08-01 05:29:32', '2023-08-01 10:59:32'),
(70, 39, 4, 28, 'hgggh', '2023-08-01 05:47:26', '2023-08-01 11:17:26'),
(71, 39, 4, 28, 'Vshhsh', '2023-08-01 06:01:26', '2023-08-01 11:31:26'),
(72, 39, 4, 28, 'hahah', '2023-08-01 06:25:36', '2023-08-01 11:55:36'),
(73, 39, 3, 19, 'surprised', '2023-08-01 23:53:19', '2023-08-02 05:23:19'),
(74, 39, 4, 28, 'haha', '2023-08-02 00:22:19', '2023-08-02 05:52:19'),
(75, 39, 4, 28, 'hahahah', '2023-08-02 00:28:47', '2023-08-02 05:58:47'),
(76, 39, 4, 32, 'Hello', '2023-08-02 01:39:27', '2023-08-02 07:09:27'),
(77, 39, 3, 19, 'Haha', '2023-08-02 01:40:18', '2023-08-02 07:10:18'),
(78, 39, 4, 28, 'haha', '2023-08-02 01:43:52', '2023-08-02 07:13:52'),
(79, 39, 4, 28, 'Haha', '2023-08-02 01:50:34', '2023-08-02 07:20:34'),
(80, 49, 4, 28, 'NNan', '2023-08-02 02:06:20', '2023-08-02 07:36:20'),
(81, 49, 4, 28, 'Haha', '2023-08-02 02:14:11', '2023-08-02 07:44:11'),
(82, 27, 4, 28, 'Haha', '2023-08-02 02:24:01', '2023-08-02 07:54:01'),
(83, 27, 5, 40, 'Hahahahh', '2023-08-02 02:43:40', '2023-08-02 08:13:40'),
(84, 27, 3, 40, 'Haa', '2023-08-02 02:47:29', '2023-08-02 08:17:29'),
(85, 27, 4, 28, 'Hahahahaha', '2023-08-02 02:48:34', '2023-08-02 08:18:34'),
(86, 27, 4, 28, 'jajaja', '2023-08-02 03:01:00', '2023-08-02 08:31:00'),
(87, 50, 4, 28, 'Hahha', '2023-08-02 03:06:59', '2023-08-02 08:36:59'),
(88, 50, 4, 28, 'Haha', '2023-08-02 04:00:08', '2023-08-02 09:30:08'),
(89, 27, 4, 28, 'Haha', '2023-08-02 04:14:25', '2023-08-02 09:44:25'),
(90, 27, 4, 28, 'hahahha', '2023-08-02 04:19:45', '2023-08-02 09:49:45'),
(91, 27, 4, 28, 'hahaha', '2023-08-02 04:28:53', '2023-08-02 09:58:53'),
(92, 27, 4, 28, 'hahaha', '2023-08-02 04:46:24', '2023-08-02 10:16:24'),
(93, 27, 4, 28, 'Hahas', '2023-08-02 04:51:02', '2023-08-02 10:21:02'),
(94, 27, 4, 28, 'Hahahah', '2023-08-02 05:06:29', '2023-08-02 10:36:29'),
(95, 27, 4, 28, 'Hahaa', '2023-08-02 05:18:25', '2023-08-02 10:48:25'),
(96, 27, 4, 28, 'Hahh', '2023-08-02 05:19:18', '2023-08-02 10:49:18'),
(97, 27, 4, 28, 'Hahah', '2023-08-02 05:29:38', '2023-08-02 10:59:38'),
(98, 27, 4, 29, 'hahaha', '2023-08-02 05:46:24', '2023-08-02 11:16:24'),
(99, 27, 4, 28, 'Hahaj', '2023-08-02 06:05:56', '2023-08-02 11:35:56'),
(100, 27, 4, 28, 'Hahaj', '2023-08-02 06:07:19', '2023-08-02 11:37:19'),
(101, 27, 4, 28, 'hahaha', '2023-08-02 07:05:06', '2023-08-02 12:35:06'),
(102, 27, 4, 28, 'guilty', '2023-08-03 05:14:20', '2023-08-03 10:44:20'),
(103, 27, 4, 29, 'h', '2023-08-03 06:14:36', '2023-08-03 11:44:36'),
(104, 27, 4, 28, 'jhkj', '2023-08-03 06:20:12', '2023-08-03 11:50:12'),
(105, 27, 4, 28, 'ahah', '2023-08-03 06:28:05', '2023-08-03 11:58:05'),
(106, 27, 4, 28, 'hhahaha', '2023-08-03 06:31:31', '2023-08-03 12:01:31'),
(107, 27, 4, 28, 'hahah', '2023-08-03 06:33:59', '2023-08-03 12:03:59'),
(108, 27, 4, 28, 'ahaha', '2023-08-03 06:42:50', '2023-08-03 12:12:50'),
(109, 27, 4, 28, 'hahha', '2023-08-03 06:52:38', '2023-08-03 12:22:38'),
(110, 27, 4, 28, 'Guilty of what', '2023-08-03 07:07:57', '2023-08-03 12:37:57'),
(111, 27, 4, 28, 'journal', '2023-08-03 07:10:07', '2023-08-03 12:40:07'),
(112, 27, 4, 28, 'ello', '2023-08-03 07:13:04', '2023-08-03 12:43:04'),
(113, 27, 4, 28, 'guilty', '2023-08-03 07:22:02', '2023-08-03 12:52:02'),
(114, 27, 4, 28, 'guilt', '2023-08-03 07:28:45', '2023-08-03 12:58:45'),
(115, 27, 4, 28, 'ahaha', '2023-08-03 07:32:08', '2023-08-03 13:02:08'),
(116, 27, 4, 28, 'hhahaha', '2023-08-03 07:47:53', '2023-08-03 13:17:53'),
(117, 27, 4, 28, 'aha', '2023-08-03 07:52:05', '2023-08-03 13:22:05'),
(118, 27, 4, 28, 'hahah', '2023-08-05 23:00:41', '2023-08-06 04:30:41'),
(119, 27, 4, 28, 'Hahah', '2023-08-06 00:25:09', '2023-08-06 05:55:09'),
(120, 27, 4, 28, 'hahaha', '2023-08-06 00:55:40', '2023-08-06 06:25:40'),
(121, 27, 4, 28, 'hahah', '2023-08-06 01:52:05', '2023-08-06 07:22:05'),
(122, 27, 4, 28, 'hahaha.', '2023-08-07 02:14:54', '2023-08-07 07:44:54'),
(123, 27, 4, 28, 'haha', '2023-08-07 03:13:17', '2023-08-07 08:43:17'),
(124, 27, 4, 28, 'hjgjhghj', '2023-08-07 04:17:28', '2023-08-07 09:47:28'),
(125, 27, 4, 28, 'hahaha', '2023-08-07 04:34:43', '2023-08-07 10:04:43'),
(126, 27, 4, 28, 'hahaha', '2023-08-07 04:48:44', '2023-08-07 10:18:44'),
(127, 27, 4, 28, 'haha', '2023-08-07 08:10:25', '2023-08-07 13:40:25'),
(128, 27, 4, 28, 'haha', '2023-08-07 08:13:37', '2023-08-07 13:43:37'),
(129, 27, 4, 28, 'haha', '2023-08-07 08:33:55', '2023-08-07 14:03:55'),
(130, 27, 4, 28, 'Hello', '2023-08-07 09:05:11', '2023-08-07 14:35:11'),
(131, 51, 4, 32, 'Ghhh', '2023-08-07 21:44:55', '2023-08-08 03:14:55'),
(132, 27, 4, 28, 'hhah', '2023-08-07 23:26:22', '2023-08-08 04:56:22'),
(133, 27, 4, 28, 'hahah', '2023-08-08 00:25:18', '2023-08-08 05:55:18'),
(134, 27, 4, 28, 'hahah', '2023-08-08 00:36:50', '2023-08-08 06:06:50'),
(135, 27, 4, 28, 'hahha', '2023-08-08 01:09:37', '2023-08-08 06:39:37'),
(136, 27, 4, 28, 'hahha', '2023-08-08 01:22:44', '2023-08-08 06:52:44'),
(137, 27, 4, 28, 'hahahah', '2023-08-08 01:54:03', '2023-08-08 07:24:03'),
(138, 27, 4, 28, 'hahA', '2023-08-08 02:21:53', '2023-08-08 07:51:53'),
(139, 27, 4, 28, 'ahhaha', '2023-08-08 02:33:37', '2023-08-08 08:03:37'),
(140, 27, 4, 28, 'ggadf', '2023-08-08 03:06:16', '2023-08-08 08:36:16'),
(141, 27, 4, 28, 'haahha', '2023-08-08 03:13:11', '2023-08-08 08:43:11'),
(142, 27, 4, 28, 'ahha', '2023-08-08 03:25:26', '2023-08-08 08:55:26'),
(143, 27, 4, 28, 'Haha', '2023-08-08 04:27:14', '2023-08-08 09:57:14'),
(144, 52, 4, 29, 'Grief', '2023-08-08 05:17:08', '2023-08-08 10:47:08'),
(145, 52, 4, 28, 'haha', '2023-08-08 07:41:15', '2023-08-08 13:11:15'),
(146, 52, 4, 28, 'Haha', '2023-08-08 08:35:15', '2023-08-08 14:05:15'),
(147, 52, 4, 28, 'Hahha', '2023-08-08 08:39:45', '2023-08-08 14:09:45'),
(148, 52, 4, 28, 'Haha', '2023-08-08 08:40:10', '2023-08-08 14:10:10'),
(149, 52, 4, 28, 'Haja', '2023-08-08 09:57:37', '2023-08-08 15:27:37'),
(150, 51, 4, 32, 'Gghj', '2023-08-08 21:32:09', '2023-08-09 03:02:09'),
(151, 51, 4, 35, 'Hhj', '2023-08-08 21:59:34', '2023-08-09 03:29:34'),
(152, 51, 4, 28, 'Hhh', '2023-08-08 21:59:53', '2023-08-09 03:29:53'),
(153, 52, 4, 28, 'hahah', '2023-08-08 23:01:27', '2023-08-09 04:31:27'),
(154, 52, 4, 28, 'hahah', '2023-08-08 23:05:38', '2023-08-09 04:35:38'),
(155, 52, 4, 28, 'hahah', '2023-08-08 23:14:34', '2023-08-09 04:44:34'),
(156, 52, 4, 28, 'ahha', '2023-08-08 23:24:38', '2023-08-09 04:54:38'),
(157, 52, 4, 28, 'ahha', '2023-08-08 23:30:18', '2023-08-09 05:00:18'),
(158, 52, 4, 28, 'ahha', '2023-08-08 23:31:07', '2023-08-09 05:01:07'),
(159, 52, 4, 28, 'ahha', '2023-08-08 23:31:28', '2023-08-09 05:01:28'),
(160, 52, 4, 28, 'ahha', '2023-08-08 23:33:04', '2023-08-09 05:03:04'),
(161, 52, 4, 28, 'ahha', '2023-08-08 23:34:23', '2023-08-09 05:04:23'),
(162, 52, 4, 28, 'ahha', '2023-08-08 23:34:51', '2023-08-09 05:04:51'),
(163, 52, 4, 28, 'hhahah', '2023-08-08 23:59:09', '2023-08-09 05:29:09'),
(164, 52, 4, 28, 'hhahah', '2023-08-09 00:16:12', '2023-08-09 05:46:12'),
(165, 52, 4, 28, 'hahha', '2023-08-09 00:22:40', '2023-08-09 05:52:40'),
(166, 27, 4, 28, 'hahahah', '2023-08-09 00:39:50', '2023-08-09 06:09:50'),
(167, 27, 4, 28, 'ahhah', '2023-08-09 00:56:39', '2023-08-09 06:26:39'),
(168, 27, 4, 28, 'Hahah', '2023-08-09 01:07:22', '2023-08-09 06:37:22'),
(169, 27, 4, 28, 'Haha', '2023-08-09 01:12:01', '2023-08-09 06:42:01'),
(170, 27, 4, 28, 'Haha', '2023-08-09 01:27:44', '2023-08-09 06:57:44'),
(171, 27, 4, 28, 'hahaahha', '2023-08-09 01:34:57', '2023-08-09 07:04:57'),
(172, 27, 4, 28, 'hhah', '2023-08-09 02:08:57', '2023-08-09 07:38:57'),
(173, 53, 4, 35, 'Fbg Gg', '2023-08-09 02:10:45', '2023-08-09 07:40:45'),
(174, 53, 4, 35, 'Cvv', '2023-08-09 02:19:36', '2023-08-09 07:49:36'),
(175, 27, 4, 28, 'hhhahahaahha', '2023-08-09 03:11:37', '2023-08-09 08:41:37'),
(176, 27, 4, 28, 'hhhahahaahha', '2023-08-09 03:20:07', '2023-08-09 08:50:07'),
(177, 27, 4, 28, 'ahhaha', '2023-08-09 03:22:58', '2023-08-09 08:52:58'),
(178, 27, 4, 28, 'aah', '2023-08-09 03:48:12', '2023-08-09 09:18:12'),
(179, 27, 4, 28, 'ahhaha', '2023-08-09 04:33:12', '2023-08-09 10:03:12'),
(180, 27, 4, 28, 'haahah', '2023-08-09 04:49:55', '2023-08-09 10:19:55'),
(181, 27, 4, 28, 'ahahhahahahahaha', '2023-08-09 04:53:34', '2023-08-09 10:23:34'),
(182, 27, 4, 28, 'play king', '2023-08-09 05:28:08', '2023-08-09 10:58:08'),
(183, 27, 4, 28, 'Hahaha', '2023-08-09 06:36:19', '2023-08-09 12:06:19'),
(184, 53, 4, 36, 'Ggh', '2023-08-09 06:52:14', '2023-08-09 12:22:14'),
(185, 53, 4, 28, 'Fgg', '2023-08-09 07:01:23', '2023-08-09 12:31:23'),
(186, 53, 4, 28, 'Cbbb', '2023-08-22 01:02:18', '2023-08-22 06:32:18'),
(187, 53, 4, 28, 'Ffv', '2023-08-22 01:13:47', '2023-08-22 06:43:47'),
(188, 53, 4, 28, 'Fhhh', '2023-08-22 01:21:31', '2023-08-22 06:51:31'),
(189, 53, 4, 28, 'Yahhah', '2023-08-22 02:08:23', '2023-08-22 07:38:23'),
(190, 53, 4, 28, 'Dhdhd', '2023-08-22 02:14:10', '2023-08-22 07:44:10'),
(191, 53, 4, 28, 'Ggg', '2023-08-22 02:39:24', '2023-08-22 08:09:24'),
(192, 62, 4, 28, 'hahaha', '2023-08-23 05:08:58', '2023-08-23 10:38:58'),
(193, 53, 4, 28, 'Dygxd', '2023-08-25 01:15:56', '2023-08-25 06:45:56'),
(194, 53, 4, 28, 'Dcv', '2023-08-25 01:18:54', '2023-08-25 06:48:54'),
(195, 53, 4, 32, 'Gghh', '2023-08-25 22:37:13', '2023-08-26 04:07:13'),
(196, 27, 4, 28, 'Sed Lyf', '2023-08-26 05:16:41', '2023-08-26 10:46:41'),
(197, 65, 5, 44, 'Fhtg Uyfh', '2023-08-26 05:55:17', '2023-08-26 11:25:17'),
(198, 65, 6, 57, 'Gyuji', '2023-08-26 05:56:26', '2023-08-26 11:26:26'),
(199, 65, 6, 57, 'Hhh', '2023-08-26 05:58:54', '2023-08-26 11:28:54'),
(200, 65, 6, 57, 'Yhhh', '2023-08-26 06:00:18', '2023-08-26 11:30:18'),
(201, 14, 4, 28, 'sad', '2023-08-28 00:04:29', '2023-08-28 05:34:29'),
(202, 14, 4, 28, 'jjsjs', '2023-08-28 00:13:05', '2023-08-28 05:43:05'),
(203, 14, 4, 38, 'hurt', '2023-08-28 02:04:58', '2023-08-28 07:34:58'),
(204, 14, 4, 39, 'jdkjashdk', '2023-08-28 02:13:15', '2023-08-28 07:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'MyAuthApp', 'e17e7eb57d6c93d2f25cc2323c7e2f8931b7d59771ac6f3e03219de4be4abb70', '[\"*\"]', NULL, '2023-06-27 03:54:37', '2023-06-27 03:54:37'),
(2, 'App\\Models\\User', 2, 'MyAuthApp', '62344e59df60103d474f55d856a8f608c372effcf36c49fe2c9af23a7af8f2ca', '[\"*\"]', NULL, '2023-06-27 03:55:44', '2023-06-27 03:55:44'),
(12, 'App\\Models\\User', 7, 'MyAuthApp', 'c73155cd29b98224a5624ff2d6a4b6ed3cdaa6e03d7e612295a562fc7d3b8b76', '[\"*\"]', NULL, '2023-07-12 00:20:43', '2023-07-12 00:20:43'),
(13, 'App\\Models\\User', 8, 'MyAuthApp', 'ac340a117c127225e1258fb6aa41c33f5f2d090948414df13160b5a4aae49412', '[\"*\"]', NULL, '2023-07-12 00:26:39', '2023-07-12 00:26:39'),
(14, 'App\\Models\\User', 9, 'MyAuthApp', 'a789035676976f15b941275d2d2f2962446a540624fe11fea95e0c4792f25243', '[\"*\"]', NULL, '2023-07-12 00:29:08', '2023-07-12 00:29:08'),
(15, 'App\\Models\\User', 10, 'MyAuthApp', 'c76d337693583f53c02d64b5afa54d493c63756953dd1f477f468bb6b5cc8ec8', '[\"*\"]', NULL, '2023-07-12 00:30:06', '2023-07-12 00:30:06'),
(16, 'App\\Models\\User', 11, 'MyAuthApp', '8ba127ba57bdbdadd167c13d559271820312bd22bf2a4cf0a32c0133c51319ce', '[\"*\"]', NULL, '2023-07-12 00:35:12', '2023-07-12 00:35:12'),
(17, 'App\\Models\\User', 12, 'MyAuthApp', '58cb762dde1bcaaa493d5160d7a394169aa35eda1980af3fcbcb31a76239d7f2', '[\"*\"]', NULL, '2023-07-12 00:36:55', '2023-07-12 00:36:55'),
(18, 'App\\Models\\User', 13, 'MyAuthApp', '6bd313ece3f92a78e7ec3320a5774403efad2b8489adca717873e176e2af934d', '[\"*\"]', NULL, '2023-07-12 01:06:49', '2023-07-12 01:06:49'),
(19, 'App\\Models\\User', 14, 'MyAuthApp', '98cf5386a60da89e70d94755b168b6f2c6a8f6268cee23d928ae9ccebb32a1a9', '[\"*\"]', NULL, '2023-07-12 01:10:26', '2023-07-12 01:10:26'),
(20, 'App\\Models\\User', 14, 'MyAuthApp', '5679119f7d1604657f2966c24b5041953b592f19fd3a570dfaa44e50af938792', '[\"*\"]', NULL, '2023-07-12 01:13:58', '2023-07-12 01:13:58'),
(21, 'App\\Models\\User', 15, 'MyAuthApp', 'ec0c7c40f309815ae1b6b0d7eb9b0cc97b5e572ac28e47b63d416f6f3a1af5dd', '[\"*\"]', NULL, '2023-07-12 01:17:23', '2023-07-12 01:17:23'),
(22, 'App\\Models\\User', 15, 'MyAuthApp', 'fa2cdc9944110087111b70f11a93fdff08b3e8e9a280e485a10f8ad910264e57', '[\"*\"]', NULL, '2023-07-12 01:17:42', '2023-07-12 01:17:42'),
(24, 'App\\Models\\User', 16, 'MyAuthApp', '204578524f62c4ceb8499ef56c70f136491891096bb469ffb1359f8ddc991f8d', '[\"*\"]', NULL, '2023-07-12 01:35:51', '2023-07-12 01:35:51'),
(25, 'App\\Models\\User', 13, 'MyAuthApp', '164552ee48087463554bbcf8ef8d8150f8b88bf8bcfa1f0e4d08ac7af5154f2e', '[\"*\"]', NULL, '2023-07-12 01:36:57', '2023-07-12 01:36:57'),
(26, 'App\\Models\\User', 13, 'MyAuthApp', '272f19d2d7091fdd3c53160ec79378886c2fbf2eb4436f82d267ebc72af8097b', '[\"*\"]', NULL, '2023-07-12 01:38:23', '2023-07-12 01:38:23'),
(27, 'App\\Models\\User', 13, 'MyAuthApp', '6b92aebb09a2a584657d199b09dc0b49d5188d5836a29a6fe27a8a8b81f9553e', '[\"*\"]', NULL, '2023-07-12 01:42:14', '2023-07-12 01:42:14'),
(28, 'App\\Models\\User', 17, 'MyAuthApp', 'eca312593a178e2b91ba75764a398b7e4a3b770ca2ff70e9736da479f2a948df', '[\"*\"]', NULL, '2023-07-12 01:51:54', '2023-07-12 01:51:54'),
(29, 'App\\Models\\User', 13, 'MyAuthApp', 'a1b9584ae0d10c968b81f5db4a9dbf451a2b7d23a68a5c2775de6036d9976ac0', '[\"*\"]', NULL, '2023-07-12 01:52:54', '2023-07-12 01:52:54'),
(30, 'App\\Models\\User', 13, 'MyAuthApp', 'a3e53fb55f7844df32abe23350a7d9cf5398269ea0ab2e82845e3c848eb2e9f6', '[\"*\"]', NULL, '2023-07-12 01:53:09', '2023-07-12 01:53:09'),
(31, 'App\\Models\\User', 13, 'MyAuthApp', '847813cf04c15c719c9ae7c98d796e498166cbccbc4d19b6385892aa2285a5b8', '[\"*\"]', NULL, '2023-07-12 01:56:01', '2023-07-12 01:56:01'),
(32, 'App\\Models\\User', 13, 'MyAuthApp', 'd9dd67920811e6a136fe19814a1f41a83a6d3883c4f855a19f4a84e8b148b641', '[\"*\"]', NULL, '2023-07-12 01:58:16', '2023-07-12 01:58:16'),
(33, 'App\\Models\\User', 13, 'MyAuthApp', '0a3e73a0762681dd6bff3a29c7d50ed82499104fcda3c4200401111d75e956fe', '[\"*\"]', NULL, '2023-07-12 02:08:08', '2023-07-12 02:08:08'),
(34, 'App\\Models\\User', 18, 'MyAuthApp', '02420e4d0602cf606d9876dcb603637356dfcb5c5da9bad89b95da9054a78473', '[\"*\"]', NULL, '2023-07-12 02:27:46', '2023-07-12 02:27:46'),
(35, 'App\\Models\\User', 13, 'MyAuthApp', '4d89fa1b2e645b48cffa467174521bb87b7f6fa270eec139a96551217094bcde', '[\"*\"]', NULL, '2023-07-12 02:28:50', '2023-07-12 02:28:50'),
(36, 'App\\Models\\User', 13, 'MyAuthApp', 'fbdbd609b2dce011b067e248eb01d2022fd077b446224122c9502a05b3bced74', '[\"*\"]', NULL, '2023-07-12 02:30:11', '2023-07-12 02:30:11'),
(37, 'App\\Models\\User', 13, 'MyAuthApp', 'cfe7891d07d3cb1c5f2dd9c736efc4124ad006b489fe0bc6bc916b8b595b6104', '[\"*\"]', NULL, '2023-07-12 02:31:47', '2023-07-12 02:31:47'),
(38, 'App\\Models\\User', 13, 'MyAuthApp', '30452a173252fc382d1d8a8a7907215184b6721d0c990bd47026baed05b11540', '[\"*\"]', NULL, '2023-07-12 02:35:49', '2023-07-12 02:35:49'),
(39, 'App\\Models\\User', 13, 'MyAuthApp', '0291eb1c4575113c389f8248aa80540bc17ce2a87e3eefbaa0412eb39521b177', '[\"*\"]', NULL, '2023-07-12 02:36:14', '2023-07-12 02:36:14'),
(40, 'App\\Models\\User', 13, 'MyAuthApp', '793effcf5c07c6a916dd6260638bcbf0a6dfd87605ff504359b5a596a42c9f81', '[\"*\"]', NULL, '2023-07-12 02:37:36', '2023-07-12 02:37:36'),
(41, 'App\\Models\\User', 13, 'MyAuthApp', 'dd85e5aebf1e239aeadf28680ebf35e70f9c7d83c94ac66cba8a146bcd3efa04', '[\"*\"]', NULL, '2023-07-12 02:38:25', '2023-07-12 02:38:25'),
(42, 'App\\Models\\User', 13, 'MyAuthApp', '811a91dbc0b625da906865125f23c4d0de711859f16201e94025381cd6738727', '[\"*\"]', NULL, '2023-07-12 02:39:34', '2023-07-12 02:39:34'),
(43, 'App\\Models\\User', 19, 'MyAuthApp', 'ad51f49cb38083c80db42b183a1dff28ae3d328d450b718bdb2e22f8de8ac1a5', '[\"*\"]', NULL, '2023-07-12 02:42:05', '2023-07-12 02:42:05'),
(44, 'App\\Models\\User', 13, 'MyAuthApp', 'bb2f60af6021b221ae39b11a780ca5dbc4bddfbd8cdc257731814e2caca0df87', '[\"*\"]', NULL, '2023-07-12 02:43:09', '2023-07-12 02:43:09'),
(45, 'App\\Models\\User', 13, 'MyAuthApp', 'a798e14c63eaafa5e53e470c090725499dfb28c4112b90077526ece42d901995', '[\"*\"]', NULL, '2023-07-12 02:44:11', '2023-07-12 02:44:11'),
(46, 'App\\Models\\User', 13, 'MyAuthApp', 'a96eadb4b45db4954ce272682194e146b776629c37a7851087feb515d760eab7', '[\"*\"]', NULL, '2023-07-12 02:45:47', '2023-07-12 02:45:47'),
(47, 'App\\Models\\User', 13, 'MyAuthApp', 'ec05301a144e0d86f8c9e1a7ce59a562937dec818b1426f86de4a2caace08c5d', '[\"*\"]', NULL, '2023-07-12 02:46:26', '2023-07-12 02:46:26'),
(48, 'App\\Models\\User', 20, 'MyAuthApp', 'e2f20e1a1238f6f2560c4ad66c7471fa47804d9d665dcb2bc48192ed54368f2a', '[\"*\"]', NULL, '2023-07-12 02:49:05', '2023-07-12 02:49:05'),
(49, 'App\\Models\\User', 20, 'MyAuthApp', 'f3e4e9901752c384b7d1ee1ae02f983fb922aa290779e3b55f38dc69e12e2fb1', '[\"*\"]', NULL, '2023-07-12 02:50:07', '2023-07-12 02:50:07'),
(59, 'App\\Models\\User', 22, 'MyAuthApp', 'fac409497d4c377a97070b6d65beb1cfa511812c0799437cc10ff4acc89065a1', '[\"*\"]', NULL, '2023-07-12 06:15:27', '2023-07-12 06:15:27'),
(60, 'App\\Models\\User', 25, 'MyAuthApp', 'ec50fe8812ef222999e339ef7c8219ad28eeb4d850aea651e2bed6bc26ff1a00', '[\"*\"]', NULL, '2023-07-12 06:19:22', '2023-07-12 06:19:22'),
(61, 'App\\Models\\User', 25, 'MyAuthApp', 'a53348d0d0952504b075c520d88708e86c3716a69dbbabe7d0881a1a579e344c', '[\"*\"]', NULL, '2023-07-12 06:20:52', '2023-07-12 06:20:52'),
(62, 'App\\Models\\User', 25, 'MyAuthApp', 'bc3390415eb53ae0ebe5d028b81ad81909205fd0a01bdf1ff6905012912fd5dd', '[\"*\"]', NULL, '2023-07-12 06:23:07', '2023-07-12 06:23:07'),
(63, 'App\\Models\\User', 25, 'MyAuthApp', '02598b40aae85e089b7e7f1839f43b55b92023cb15ed19b7f40c6cfb6884bc99', '[\"*\"]', NULL, '2023-07-12 06:25:53', '2023-07-12 06:25:53'),
(64, 'App\\Models\\User', 25, 'MyAuthApp', 'd4a42805df803d786b3a756e9207c5e278d94f4a784620b3d1eecc4f530a61d7', '[\"*\"]', NULL, '2023-07-12 06:26:27', '2023-07-12 06:26:27'),
(65, 'App\\Models\\User', 25, 'MyAuthApp', '493bfb498e45fb57e89bc582adeb143a34d0abdad70e9ae547a195805f9fff79', '[\"*\"]', NULL, '2023-07-12 06:27:54', '2023-07-12 06:27:54'),
(66, 'App\\Models\\User', 25, 'MyAuthApp', 'de0b4e091fda030d7b6f9d7436ec1c7b7350c9e802a77f290e69533db9b4fe0a', '[\"*\"]', NULL, '2023-07-12 06:28:16', '2023-07-12 06:28:16'),
(67, 'App\\Models\\User', 13, 'MyAuthApp', 'f95281d087be60f14a617695417786e2b1caebe1b0016de0966a29cf3b85c052', '[\"*\"]', NULL, '2023-07-12 06:29:14', '2023-07-12 06:29:14'),
(68, 'App\\Models\\User', 13, 'MyAuthApp', '66d744c95aabbc123b2a22bc14d663c73a4760b67b6039708868f506e6805049', '[\"*\"]', NULL, '2023-07-12 06:29:33', '2023-07-12 06:29:33'),
(69, 'App\\Models\\User', 25, 'MyAuthApp', 'eefb7c2bebbc95670937b247ec358e23680f22c77fb8619ee9ca179ade76bdd1', '[\"*\"]', NULL, '2023-07-12 06:29:41', '2023-07-12 06:29:41'),
(70, 'App\\Models\\User', 26, 'MyAuthApp', 'a58a1ddaa840f43aeb188c017e4e47596f32551b8767afb1693f696780a76770', '[\"*\"]', NULL, '2023-07-12 06:46:47', '2023-07-12 06:46:47'),
(71, 'App\\Models\\User', 26, 'MyAuthApp', 'd6c29568e309c3d9d419e4e79f85581f38276ca0c073a2614358be0092b99bc0', '[\"*\"]', NULL, '2023-07-12 06:53:19', '2023-07-12 06:53:19'),
(72, 'App\\Models\\User', 26, 'MyAuthApp', '0292cb26e9fc701d16ba3bb65d5436f442e85cd5d2c2dbe4e9b182206a02823e', '[\"*\"]', NULL, '2023-07-12 06:54:19', '2023-07-12 06:54:19'),
(73, 'App\\Models\\User', 26, 'MyAuthApp', '50db4b3a77020539c644bb656c35cc96209788ef94484d8d6f2ae53c1a914039', '[\"*\"]', NULL, '2023-07-12 06:55:18', '2023-07-12 06:55:18'),
(74, 'App\\Models\\User', 27, 'MyAuthApp', '3fbdc363332300ca59385a662a138062d29103cb1ec27dd6b3060fdf667f37f6', '[\"*\"]', NULL, '2023-07-12 07:02:45', '2023-07-12 07:02:45'),
(75, 'App\\Models\\User', 27, 'MyAuthApp', '0628078d7969d31208ad495de60706c2af146eec40f00b6b7a4e19b3771101b6', '[\"*\"]', NULL, '2023-07-12 07:04:29', '2023-07-12 07:04:29'),
(76, 'App\\Models\\User', 27, 'MyAuthApp', '6aa9cb679fca2768798c39b7d0c5671760bc348bb7a2fcb53747f4d94f5147bb', '[\"*\"]', '2023-07-15 02:33:43', '2023-07-12 07:07:07', '2023-07-15 02:33:43'),
(77, 'App\\Models\\User', 28, 'MyAuthApp', '03d34034217ab3b4e868ca62057e6a0fa921a2a463f59474047c7bc59b0b744d', '[\"*\"]', NULL, '2023-07-13 00:19:39', '2023-07-13 00:19:39'),
(78, 'App\\Models\\User', 29, 'MyAuthApp', '0152be950c7e50816d1cf696a6084841d95ebdb0ebee0fb10fc2048215db302e', '[\"*\"]', NULL, '2023-07-13 00:23:27', '2023-07-13 00:23:27'),
(80, 'App\\Models\\User', 30, 'MyAuthApp', '126d15b5c736a35410ac27839b32957df6a7c41cb6459add15481cb150dc6889', '[\"*\"]', NULL, '2023-07-13 00:29:52', '2023-07-13 00:29:52'),
(81, 'App\\Models\\User', 30, 'MyAuthApp', '44226ac8ad5689b2649c78872234fdde3455fd243c8314b21943f1f0ff42ec0c', '[\"*\"]', NULL, '2023-07-13 00:31:25', '2023-07-13 00:31:25'),
(82, 'App\\Models\\User', 30, 'MyAuthApp', 'd46258adf5bef313f5fe23871ac1f84d266ca8ac21175a1accddff485242b34c', '[\"*\"]', '2023-07-13 00:34:26', '2023-07-13 00:31:33', '2023-07-13 00:34:26'),
(89, 'App\\Models\\User', 5, 'MyAuthApp', 'ec3f0103388da22578c9e3aadb7cac4589a65b5fae75705b1669475b34c52188', '[\"*\"]', '2023-07-14 00:19:09', '2023-07-14 00:02:17', '2023-07-14 00:19:09'),
(90, 'App\\Models\\User', 5, 'MyAuthApp', '1d5c15e8017e23f1f0919df392497e0c0152d3feb9f373cfb523a022ea276beb', '[\"*\"]', '2023-07-16 07:45:44', '2023-07-14 00:40:07', '2023-07-16 07:45:44'),
(91, 'App\\Models\\User', 5, 'MyAuthApp', '9d078de66a970705b44f33125605c06fdfd2acc421e59dd4be84f6f942b420fa', '[\"*\"]', '2023-07-14 01:35:19', '2023-07-14 00:55:38', '2023-07-14 01:35:19'),
(92, 'App\\Models\\User', 5, 'MyAuthApp', '019cfb7c3c10bf5be96d94c26d783c0c2222817b29f2c7b79a26523330d5c3de', '[\"*\"]', '2023-07-14 01:21:26', '2023-07-14 01:11:06', '2023-07-14 01:21:26'),
(93, 'App\\Models\\User', 5, 'MyAuthApp', '9fd8a0a23835075c8d563e60583c23dd62b3d8e2f16facd55125b5fdc0c38f0d', '[\"*\"]', '2023-07-19 02:07:18', '2023-07-14 01:26:49', '2023-07-19 02:07:18'),
(94, 'App\\Models\\User', 5, 'MyAuthApp', '162588fe060fac1a16a44e4407ad30b18df07dd3ba0216c2be5f270ac3e08d3d', '[\"*\"]', '2023-07-16 07:46:21', '2023-07-14 01:35:24', '2023-07-16 07:46:21'),
(95, 'App\\Models\\User', 5, 'MyAuthApp', 'ca4a7c3873ac22a6688b97afaa774be54c69ae6b592094c17a66f9adfefa1199', '[\"*\"]', NULL, '2023-07-14 01:58:44', '2023-07-14 01:58:44'),
(96, 'App\\Models\\User', 5, 'MyAuthApp', 'd91ceaa5b9b0b51be66d1768efd845903f1ca1c446036459bc8044bb4a4691f2', '[\"*\"]', NULL, '2023-07-14 01:59:19', '2023-07-14 01:59:19'),
(97, 'App\\Models\\User', 31, 'MyAuthApp', '7bff597a5e8b7a7245a927d813e3d643fdd9b4a4c83d79776e0c2eaa2d4cc1cc', '[\"*\"]', '2023-07-16 07:30:26', '2023-07-15 02:27:20', '2023-07-16 07:30:26'),
(98, 'App\\Models\\User', 32, 'MyAuthApp', 'c6513d73b15e490ccad8cab943f11c4a4ed0c104da683b1985e599b8d5ce04c0', '[\"*\"]', '2023-07-16 02:43:32', '2023-07-15 02:34:49', '2023-07-16 02:43:32'),
(99, 'App\\Models\\User', 5, 'MyAuthApp', 'e65c288052b416fbb711e8a4453b9ed5817e1cbed8237b5bca3aeff436b66a5d', '[\"*\"]', '2023-07-16 05:51:57', '2023-07-16 01:40:46', '2023-07-16 05:51:57'),
(100, 'App\\Models\\User', 5, 'MyAuthApp', '4fc234e2124308ced673ab814276bf51a2420df42c0d860a48d6664538e5e5af', '[\"*\"]', NULL, '2023-07-16 02:46:06', '2023-07-16 02:46:06'),
(101, 'App\\Models\\User', 33, 'MyAuthApp', '1f9f54f70c834353510ce41c366a540411c79cff009ee1262a32f99fd23487c3', '[\"*\"]', NULL, '2023-07-16 05:49:36', '2023-07-16 05:49:36'),
(102, 'App\\Models\\User', 33, 'MyAuthApp', '5a605e30b4dddccc12247fa7a7bb254cd743d9adc6caa69ac9a7829362b0e1b7', '[\"*\"]', '2023-07-16 07:27:33', '2023-07-16 05:49:49', '2023-07-16 07:27:33'),
(103, 'App\\Models\\User', 5, 'MyAuthApp', '3aa28475b0236c3a95ae83cc67180665073af12ae7dd6841edd58de896639a88', '[\"*\"]', NULL, '2023-07-16 07:35:07', '2023-07-16 07:35:07'),
(104, 'App\\Models\\User', 13, 'MyAuthApp', '09d2d9249561417b43dc9dc5e9fd8447e1cc4a2ad4ca6c1bb42a37aeb6aff602', '[\"*\"]', NULL, '2023-07-17 01:32:51', '2023-07-17 01:32:51'),
(105, 'App\\Models\\User', 5, 'MyAuthApp', 'eb3607b9f6887abcdf3418b4b924fe9d03e5a15778fc32afe9856e049b3e38a7', '[\"*\"]', NULL, '2023-07-17 01:33:37', '2023-07-17 01:33:37'),
(106, 'App\\Models\\User', 13, 'MyAuthApp', '39e7805ee3fe01afe692c47f3142c870c0251a1edbefccc357e410d7df194b5b', '[\"*\"]', '2023-07-17 02:12:54', '2023-07-17 01:34:43', '2023-07-17 02:12:54'),
(107, 'App\\Models\\User', 13, 'MyAuthApp', 'f397ac60ef7268030c37a05ed6b1efcf0c384030081d165528e452749558f03f', '[\"*\"]', NULL, '2023-07-17 01:35:54', '2023-07-17 01:35:54'),
(108, 'App\\Models\\User', 13, 'MyAuthApp', 'b09a792c096234542c852777b9ccbda5d16a9b840d7945706e246a60f3062b79', '[\"*\"]', NULL, '2023-07-17 01:38:24', '2023-07-17 01:38:24'),
(109, 'App\\Models\\User', 13, 'MyAuthApp', 'd9b3e06c1ef13714e70bbf45c1eff8690bd7d69160484cdcc8d1f5847cc246ca', '[\"*\"]', '2023-07-17 01:55:20', '2023-07-17 01:38:39', '2023-07-17 01:55:20'),
(110, 'App\\Models\\User', 13, 'MyAuthApp', 'c366a3ba5c4fef392fa1c780eef9a962f744d25d352bec956d2057bf1d5a4a11', '[\"*\"]', '2023-07-17 02:02:01', '2023-07-17 01:59:09', '2023-07-17 02:02:01'),
(111, 'App\\Models\\User', 13, 'MyAuthApp', '5d34d7f5e0df89ad83011efbf9b683c17787f2ceb16faecd95bd532816126d64', '[\"*\"]', NULL, '2023-07-17 02:02:27', '2023-07-17 02:02:27'),
(112, 'App\\Models\\User', 13, 'MyAuthApp', '1b9447a93f78f2bda042d159cbf24e2cb9f8096657add83b370c5b1be9a12b75', '[\"*\"]', '2023-07-17 02:10:03', '2023-07-17 02:02:35', '2023-07-17 02:10:03'),
(113, 'App\\Models\\User', 13, 'MyAuthApp', '1bb4866ae03b5d68e81938436654f5269bbc76e4d5b9abb8f62bdb5a2b33329c', '[\"*\"]', NULL, '2023-07-17 02:10:39', '2023-07-17 02:10:39'),
(114, 'App\\Models\\User', 13, 'MyAuthApp', '2966ecf4f7656c859a3f11a4506f90232cc0bd11c06d469a22bbc1851e825eca', '[\"*\"]', '2023-07-17 02:11:08', '2023-07-17 02:10:50', '2023-07-17 02:11:08'),
(115, 'App\\Models\\User', 13, 'MyAuthApp', '9be76a7bc5e6e5f2aba87d97fca02088a2f96ff394497f7f9ab3065b10f4ab7d', '[\"*\"]', NULL, '2023-07-17 02:13:23', '2023-07-17 02:13:23'),
(116, 'App\\Models\\User', 13, 'MyAuthApp', 'afdff1b2d604cac540da7bb58e4e4178a85f505b21933538eb4ca8009a132e69', '[\"*\"]', '2023-07-17 04:08:47', '2023-07-17 02:14:20', '2023-07-17 04:08:47'),
(117, 'App\\Models\\User', 13, 'MyAuthApp', '6e18a9832c5c151777379c13ae572dd18d4938c79f5b4ea4372f29b5d0372837', '[\"*\"]', NULL, '2023-07-17 02:14:36', '2023-07-17 02:14:36'),
(118, 'App\\Models\\User', 13, 'MyAuthApp', '5a4986cf2f4846e886f64f7ceeaa6c88e732fbf1fb9c2e6720b13867c51205ec', '[\"*\"]', NULL, '2023-07-17 02:19:09', '2023-07-17 02:19:09'),
(119, 'App\\Models\\User', 13, 'MyAuthApp', 'c94f1821a3aaa32c1705ed1bc6fe94228443dc6019ec15570b3ddea76fd18df0', '[\"*\"]', '2023-07-17 02:25:10', '2023-07-17 02:19:16', '2023-07-17 02:25:10'),
(120, 'App\\Models\\User', 5, 'MyAuthApp', '5789609b78595c78a6505685a3a673402b69f1eddd071ede2b1d349743241106', '[\"*\"]', NULL, '2023-07-17 02:19:43', '2023-07-17 02:19:43'),
(121, 'App\\Models\\User', 13, 'MyAuthApp', '27cdcf681443aee734d21292f31dfb06480e0ec8a288b37d09e3274fb4955281', '[\"*\"]', NULL, '2023-07-17 02:25:32', '2023-07-17 02:25:32'),
(122, 'App\\Models\\User', 13, 'MyAuthApp', '001f9411b01134477e9c1b9686113b44418dc9b10c4a6fc892821b0bc7868a94', '[\"*\"]', '2023-07-17 02:27:41', '2023-07-17 02:27:26', '2023-07-17 02:27:41'),
(123, 'App\\Models\\User', 13, 'MyAuthApp', '8c2fd2de176d60599272244f64782ccd7ac2d2d4a125ca6f7ff4c512e45046e2', '[\"*\"]', NULL, '2023-07-17 02:27:55', '2023-07-17 02:27:55'),
(124, 'App\\Models\\User', 13, 'MyAuthApp', '601133163e697f0c3c979d503ef59f6a4ea7ac22bee1491f587c2650c401d5a1', '[\"*\"]', '2023-07-17 02:28:19', '2023-07-17 02:28:01', '2023-07-17 02:28:19'),
(125, 'App\\Models\\User', 13, 'MyAuthApp', '7c1be0107ea338fc45944627a33a4c6d81ae045f692a53749a1eb183d3ca52cf', '[\"*\"]', '2023-07-17 02:31:49', '2023-07-17 02:28:53', '2023-07-17 02:31:49'),
(126, 'App\\Models\\User', 13, 'MyAuthApp', '2b80918c7a1912eb39a45e992405dde0f76714389ce78131d35b40d7aed5a7ec', '[\"*\"]', '2023-07-17 02:35:43', '2023-07-17 02:32:11', '2023-07-17 02:35:43'),
(127, 'App\\Models\\User', 13, 'MyAuthApp', '3041222d081bea24c20e53ee142ca5a95a831a286224681dab3d02b9f1401f52', '[\"*\"]', '2023-07-17 02:41:14', '2023-07-17 02:36:00', '2023-07-17 02:41:14'),
(128, 'App\\Models\\User', 13, 'MyAuthApp', '1c868b2f39a6064a2a536ff5ac84de1962bfcdc36ed7ac4be37752089c14ed58', '[\"*\"]', '2023-07-27 23:53:09', '2023-07-17 02:41:31', '2023-07-27 23:53:09'),
(129, 'App\\Models\\User', 31, 'MyAuthApp', '2945e47bd4b7be1b7cc934cb28fb5a4de173a7c16a514010b289871a2a63946b', '[\"*\"]', '2023-07-17 07:14:29', '2023-07-17 03:56:23', '2023-07-17 07:14:29'),
(130, 'App\\Models\\User', 34, 'MyAuthApp', '485ad598bd4b110c388e7505c07743fc5d3dfcda19a0501f9e9e9b209c784c3e', '[\"*\"]', NULL, '2023-07-17 04:13:58', '2023-07-17 04:13:58'),
(131, 'App\\Models\\User', 13, 'MyAuthApp', '240baaddeebd2d61f32341384ee126ef59cbc7fdf083cf9781b518cc2c6a4dcf', '[\"*\"]', '2023-07-19 02:17:58', '2023-07-17 07:51:57', '2023-07-19 02:17:58'),
(132, 'App\\Models\\User', 35, 'MyAuthApp', 'd2954a7445198380f94bbbd4f912209a5ff5a23bf6e0de6f539541146e59b234', '[\"*\"]', '2023-07-19 01:56:27', '2023-07-19 01:55:58', '2023-07-19 01:56:27'),
(133, 'App\\Models\\User', 36, 'MyAuthApp', 'c5af58f2bcc5a78d34d715d2a9975dc2531a8ac567cdff72a1aaf00b25be7029', '[\"*\"]', NULL, '2023-07-19 02:19:28', '2023-07-19 02:19:28'),
(134, 'App\\Models\\User', 14, 'MyAuthApp', '814bc672568df41a3a0938f50f94cfab25a144360f4ebd25f413418590f95429', '[\"*\"]', NULL, '2023-07-19 02:20:46', '2023-07-19 02:20:46'),
(135, 'App\\Models\\User', 14, 'MyAuthApp', 'ee3fad9e400ba0172ce1763e2043c0c32e997255dfcff21bb4809f4965a581b2', '[\"*\"]', NULL, '2023-07-19 02:20:49', '2023-07-19 02:20:49'),
(136, 'App\\Models\\User', 14, 'MyAuthApp', '9107ee04dc575f33d0666b116cee8dcb10dbce33a9c2702ac53085a4ee24bc98', '[\"*\"]', NULL, '2023-07-19 02:20:50', '2023-07-19 02:20:50'),
(137, 'App\\Models\\User', 14, 'MyAuthApp', '72908823f646d5bd95a8c8ce8c6e3d7ee2918ef6c54c03b36e28094a7567cc32', '[\"*\"]', NULL, '2023-07-19 02:20:52', '2023-07-19 02:20:52'),
(138, 'App\\Models\\User', 14, 'MyAuthApp', '169f8302f9b254d88aa462a84292f05441bf61cd11a66e7d8d805756c7eecadc', '[\"*\"]', NULL, '2023-07-19 02:20:52', '2023-07-19 02:20:52'),
(139, 'App\\Models\\User', 14, 'MyAuthApp', 'fa9953569397865abff8223ce89cf8dc76e457e190fbd6d2306e3f890595b66e', '[\"*\"]', NULL, '2023-07-19 02:20:53', '2023-07-19 02:20:53'),
(140, 'App\\Models\\User', 14, 'MyAuthApp', '4c4e017730eacaa3d3c4774aca662b9a7bf0566ef6082b78c856020ee8768387', '[\"*\"]', NULL, '2023-07-19 02:20:54', '2023-07-19 02:20:54'),
(141, 'App\\Models\\User', 14, 'MyAuthApp', '6fbe7d76c38edaf2e4ad6bc4b47f817ae084d5fb290d6535039f1e394e50c905', '[\"*\"]', NULL, '2023-07-19 02:20:54', '2023-07-19 02:20:54'),
(142, 'App\\Models\\User', 14, 'MyAuthApp', 'b8e4e20e2fff580a7a3ed3acd917762dcb01d84744e07e8da87ec81e4c778612', '[\"*\"]', NULL, '2023-07-19 02:20:54', '2023-07-19 02:20:54'),
(143, 'App\\Models\\User', 14, 'MyAuthApp', '98ab9c90e51e18f8eca884af507a28d1c9f4d8dbf3efd5e78c2e9bbdb5efdad7', '[\"*\"]', NULL, '2023-07-19 02:20:54', '2023-07-19 02:20:54'),
(144, 'App\\Models\\User', 14, 'MyAuthApp', '8765c3b5cced60d402a9705d7ffffa6efb1c3062fc946ac3c3ca760a75bf38e0', '[\"*\"]', NULL, '2023-07-19 02:20:54', '2023-07-19 02:20:54'),
(145, 'App\\Models\\User', 14, 'MyAuthApp', '1914aedca91deabab2f8c50d7bc7d334bae4476612ed2883b63f3fdb28da23ee', '[\"*\"]', NULL, '2023-07-19 02:20:54', '2023-07-19 02:20:54'),
(146, 'App\\Models\\User', 14, 'MyAuthApp', '5144b4048d6583bb8796fb18bd67e369f6b09b2d0e663a7e60f260f91766a1d0', '[\"*\"]', NULL, '2023-07-19 02:20:55', '2023-07-19 02:20:55'),
(147, 'App\\Models\\User', 14, 'MyAuthApp', '6ad18fb1931e8ce8e687551993953a8826d2a740702aa782df182a7bbab58940', '[\"*\"]', NULL, '2023-07-19 02:20:55', '2023-07-19 02:20:55'),
(148, 'App\\Models\\User', 14, 'MyAuthApp', 'f388267da90dda9b873b395bceb1a6b653429d552d531c0a8919eb978d400487', '[\"*\"]', NULL, '2023-07-19 02:20:56', '2023-07-19 02:20:56'),
(149, 'App\\Models\\User', 14, 'MyAuthApp', 'beb92c6a62ec5b17876c5039943bc619791e27e093280d00c3e1a31fdda79b51', '[\"*\"]', NULL, '2023-07-19 02:20:57', '2023-07-19 02:20:57'),
(150, 'App\\Models\\User', 14, 'MyAuthApp', 'dfc530823cf58074263f226bd4420a5ffc78f3d6d697e2224847ef1a770fcd84', '[\"*\"]', NULL, '2023-07-19 02:20:57', '2023-07-19 02:20:57'),
(151, 'App\\Models\\User', 14, 'MyAuthApp', '119239697185e294299cc627f0c3923f0c25a4d6fcc86cf73ba45fea529309cf', '[\"*\"]', NULL, '2023-07-19 02:20:58', '2023-07-19 02:20:58'),
(152, 'App\\Models\\User', 14, 'MyAuthApp', 'c70851d09c39478c4134caa23a6badc316c3cfea0e5364b0af2dd903756208e0', '[\"*\"]', NULL, '2023-07-19 02:20:58', '2023-07-19 02:20:58'),
(153, 'App\\Models\\User', 14, 'MyAuthApp', '821ebcc4123081b016177c79506d78d416d29b1804d5c5bbc7c60f7d85ae5597', '[\"*\"]', NULL, '2023-07-19 02:20:58', '2023-07-19 02:20:58'),
(154, 'App\\Models\\User', 14, 'MyAuthApp', '64eb2ec145513e742fb4393584c7b2443672dcba56eb195231ad38fd0c580916', '[\"*\"]', NULL, '2023-07-19 02:20:58', '2023-07-19 02:20:58'),
(155, 'App\\Models\\User', 14, 'MyAuthApp', 'ea0ba3fd9bd07d929439408c0ba47b42f9fa871d6eb3f21cae47f6611b62c6e5', '[\"*\"]', NULL, '2023-07-19 02:20:58', '2023-07-19 02:20:58'),
(156, 'App\\Models\\User', 14, 'MyAuthApp', '8ec192329650f76f262783e3bb58712e265aff13d457467735472a6fb8fce688', '[\"*\"]', '2023-07-19 02:24:40', '2023-07-19 02:20:59', '2023-07-19 02:24:40'),
(157, 'App\\Models\\User', 37, 'MyAuthApp', '9767d1120b298d7c380efea3750574c5e1a330133a0f8c6344e4ef32736d0232', '[\"*\"]', NULL, '2023-07-19 02:33:44', '2023-07-19 02:33:44'),
(158, 'App\\Models\\User', 38, 'MyAuthApp', '2c27a0380fd88bc630e90db90c8183856f3b0302cfc4d2d07fcac816baad32e6', '[\"*\"]', NULL, '2023-07-19 02:34:30', '2023-07-19 02:34:30'),
(159, 'App\\Models\\User', 37, 'MyAuthApp', '7f3f99018d3e323cb6e25a17ff7bdeb5b3948eec89a133d3c1f61ec432837634', '[\"*\"]', '2023-07-19 03:17:37', '2023-07-19 02:34:36', '2023-07-19 03:17:37'),
(160, 'App\\Models\\User', 39, 'MyAuthApp', '34a0e64f9271a49f34d50feb2d420f22259c3b760dc26d9c7ee62dc91f736227', '[\"*\"]', NULL, '2023-07-19 03:18:41', '2023-07-19 03:18:41'),
(161, 'App\\Models\\User', 39, 'MyAuthApp', 'c39b9b791963b025f52af83417db2058219ab0b993b3e336d2d8e76f48d07cf7', '[\"*\"]', '2023-07-19 03:21:25', '2023-07-19 03:18:49', '2023-07-19 03:21:25'),
(162, 'App\\Models\\User', 39, 'MyAuthApp', 'd4623efc51b5d2c5651b2ecaef6f09d6beb53b035ac1a8261a8eb196bad41ebf', '[\"*\"]', '2023-07-19 03:21:50', '2023-07-19 03:21:38', '2023-07-19 03:21:50'),
(163, 'App\\Models\\User', 39, 'MyAuthApp', 'e53db035ed160265e62aa3f502ba2d29f185a7c34febdd8354d4e305201b44ef', '[\"*\"]', NULL, '2023-07-19 03:22:07', '2023-07-19 03:22:07'),
(164, 'App\\Models\\User', 39, 'MyAuthApp', '34ef645ebc8abc460071ce07bdce67e30f8f79d3917a6c590d71c3fedf7a15d8', '[\"*\"]', '2023-07-19 03:22:25', '2023-07-19 03:22:13', '2023-07-19 03:22:25'),
(165, 'App\\Models\\User', 39, 'MyAuthApp', 'c6057ab5c382601c35bd3b3f27606a1d3cdfe0bf3a6e879b6e69c5437c549342', '[\"*\"]', '2023-07-19 04:29:15', '2023-07-19 03:22:39', '2023-07-19 04:29:15'),
(166, 'App\\Models\\User', 40, 'MyAuthApp', '4d6b85638965b51b9121ab24ac46429f879d2d7080be66fe8bce3cfa7bb7a0da', '[\"*\"]', NULL, '2023-07-19 04:30:29', '2023-07-19 04:30:29'),
(167, 'App\\Models\\User', 40, 'MyAuthApp', '9a00e4f1b01474397a50f7feb59d29581e0ee67242cc432109f403ceaa731221', '[\"*\"]', NULL, '2023-07-19 04:31:34', '2023-07-19 04:31:34'),
(168, 'App\\Models\\User', 40, 'MyAuthApp', '8ec02ed2e984ff0ce385473b267a399b735d7320ffa47137b16e3ad73b29dd3a', '[\"*\"]', '2023-07-19 04:33:59', '2023-07-19 04:31:40', '2023-07-19 04:33:59'),
(169, 'App\\Models\\User', 40, 'MyAuthApp', '01e046669e096817ee50a5ccfda0ac5b6055181667cf5be71fc1c72894b363cd', '[\"*\"]', '2023-07-19 05:17:36', '2023-07-19 04:34:28', '2023-07-19 05:17:36'),
(170, 'App\\Models\\User', 41, 'MyAuthApp', '2d7856d97ae208d42c2844441558aed680858c212fe16c28a18b25a3f98bbc38', '[\"*\"]', NULL, '2023-07-19 04:54:12', '2023-07-19 04:54:12'),
(171, 'App\\Models\\User', 41, 'MyAuthApp', '3787d1baafdb275ae685de26b2676f4312d0e1e6a907bccbd66302aed05e066e', '[\"*\"]', '2023-07-19 05:00:52', '2023-07-19 04:54:23', '2023-07-19 05:00:52'),
(172, 'App\\Models\\User', 40, 'MyAuthApp', '0c4207e44ca05946fd844401c6f63a93e8a55535ef464ec660f2ab3aff7445f0', '[\"*\"]', NULL, '2023-07-19 05:16:33', '2023-07-19 05:16:33'),
(173, 'App\\Models\\User', 40, 'MyAuthApp', '768af4c07775b7dd80a50028b5be9fdbfd000ac9e9e00137c8855d791c53aa47', '[\"*\"]', '2023-07-19 05:16:52', '2023-07-19 05:16:38', '2023-07-19 05:16:52'),
(174, 'App\\Models\\User', 39, 'MyAuthApp', 'c3a3a269c954600666e02e0f863fac32cfcaff905241a652c837f887509ab31d', '[\"*\"]', '2023-07-19 06:04:19', '2023-07-19 05:18:36', '2023-07-19 06:04:19'),
(175, 'App\\Models\\User', 39, 'MyAuthApp', 'e7d2475213fce3b346353821ce745768a297327b3ea5d185707ae8fcb8dd9ac0', '[\"*\"]', '2023-08-02 01:55:42', '2023-07-19 05:22:01', '2023-08-02 01:55:42'),
(176, 'App\\Models\\User', 42, 'MyAuthApp', '528647cb553e3ccbebfd4d96c907ff16dce17acee1c9f517ed272b56b5934b4a', '[\"*\"]', '2023-07-26 02:49:55', '2023-07-19 05:24:23', '2023-07-26 02:49:55'),
(177, 'App\\Models\\User', 43, 'MyAuthApp', 'be8ca9dbd94c75441a52127938fdc81b49b92d5b6cfe2d34e4b996371841d382', '[\"*\"]', '2023-07-20 06:39:32', '2023-07-20 02:36:23', '2023-07-20 06:39:32'),
(178, 'App\\Models\\User', 44, 'MyAuthApp', 'ee761f20b94918acb6e5e3fe4a8c892d7aef74948bf3e85cfdceaf4f875bba98', '[\"*\"]', NULL, '2023-07-28 00:03:27', '2023-07-28 00:03:27'),
(179, 'App\\Models\\User', 45, 'MyAuthApp', '95e13f3b38b1e9e2d0d5e864314a7f87ad551a4c1affdf53f7db7a6ac0147e58', '[\"*\"]', NULL, '2023-07-28 00:38:02', '2023-07-28 00:38:02'),
(180, 'App\\Models\\User', 45, 'MyAuthApp', '9bf16e08463b57e75d49dd960dcef88fc3c3d2d3efafcc576f232cdb79ea1c2e', '[\"*\"]', '2023-07-28 00:41:43', '2023-07-28 00:39:06', '2023-07-28 00:41:43'),
(181, 'App\\Models\\User', 46, 'MyAuthApp', '6999aec337b83319b458227a7912ddc482d844431e486bebacda1b49efb413d3', '[\"*\"]', NULL, '2023-07-28 00:43:30', '2023-07-28 00:43:30'),
(182, 'App\\Models\\User', 46, 'MyAuthApp', '80f87c2b16e3a0f3607b17ca60f1396e7ba63aad597a0f32b1e08e0859edd4bd', '[\"*\"]', '2023-07-30 23:18:31', '2023-07-28 00:43:34', '2023-07-30 23:18:31'),
(183, 'App\\Models\\User', 5, 'MyAuthApp', '3481cd5f88fdec012a75e0a1bd0175ed5814b99de6b21c54ae098a3c19c11ecc', '[\"*\"]', '2023-07-28 23:25:46', '2023-07-28 02:12:26', '2023-07-28 23:25:46'),
(184, 'App\\Models\\User', 5, 'MyAuthApp', 'a4e8ac36eaaa180b61526aa9956fab083b8c205ef34b4d8f7030f501c06de16e', '[\"*\"]', '2023-08-01 05:22:00', '2023-07-30 22:29:17', '2023-08-01 05:22:00'),
(185, 'App\\Models\\User', 5, 'MyAuthApp', '8562c209593c898ac24785f504e8e55b6f3237b43d3f34b42b15fa99194cbd4d', '[\"*\"]', NULL, '2023-07-31 04:14:16', '2023-07-31 04:14:16'),
(186, 'App\\Models\\User', 47, 'MyAuthApp', '9586ae609cdb3a46328a5e0aa9147d1db4f2d20b7eb0365a9341c692b78a5544', '[\"*\"]', '2023-07-31 23:05:42', '2023-07-31 05:15:18', '2023-07-31 23:05:42'),
(187, 'App\\Models\\User', 5, 'MyAuthApp', '2f94243fe719206981417ae53e5b2c1dc69f7b466d4e23f5a9adb19ee015495c', '[\"*\"]', '2023-08-06 00:48:03', '2023-07-31 12:07:00', '2023-08-06 00:48:03'),
(188, 'App\\Models\\User', 48, 'MyAuthApp', 'f8ba5c6dd8aeb5ee8cc64bfab92a7513594e3ab9de68ea2cc61afb41a620ab18', '[\"*\"]', '2023-07-31 23:09:47', '2023-07-31 23:07:17', '2023-07-31 23:09:47'),
(189, 'App\\Models\\User', 5, 'MyAuthApp', 'aa3ead529b7be31b9762a50602671743fb9edc2f8376f1d82fe9e32426d030cb', '[\"*\"]', '2023-08-05 23:19:50', '2023-07-31 23:14:39', '2023-08-05 23:19:50'),
(190, 'App\\Models\\User', 5, 'MyAuthApp', '925bfc9fc892add43325406fc229566ce14da8ecabb103d245b80cfc8294bc04', '[\"*\"]', '2023-08-03 06:24:10', '2023-08-01 23:32:53', '2023-08-03 06:24:10'),
(191, 'App\\Models\\User', 49, 'MyAuthApp', '6da786080f8ccd38d8e193e88606842107e05b240c36b20170be01696014aaa8', '[\"*\"]', NULL, '2023-08-02 02:05:51', '2023-08-02 02:05:51'),
(192, 'App\\Models\\User', 49, 'MyAuthApp', 'b4714be66b5682d2e44356c03c09aa0c578ecc3430bdba3decfdf5f34f61b2e4', '[\"*\"]', '2023-08-02 02:14:37', '2023-08-02 02:06:00', '2023-08-02 02:14:37'),
(193, 'App\\Models\\User', 27, 'MyAuthApp', '41125b579241b65320ccf34f619aaa4d50dd2f262b048d86bac97079e049edc7', '[\"*\"]', '2023-08-02 02:50:46', '2023-08-02 02:23:23', '2023-08-02 02:50:46'),
(194, 'App\\Models\\User', 27, 'MyAuthApp', '9fc26990065985aa4b05c798718911b55ecc8fb4c7f6242bd2b0cf64635d9021', '[\"*\"]', '2023-08-02 03:01:13', '2023-08-02 02:59:54', '2023-08-02 03:01:13'),
(195, 'App\\Models\\User', 50, 'MyAuthApp', '1aea8719b6325bd393f0582c48be39057783c0d12249bed01a3f803feecfd287', '[\"*\"]', NULL, '2023-08-02 03:06:34', '2023-08-02 03:06:34'),
(196, 'App\\Models\\User', 50, 'MyAuthApp', 'f210b4be54dc0103dfaee03c03480d2a36b3c10fe407b8d2d04e2321dc779c75', '[\"*\"]', '2023-08-02 04:04:14', '2023-08-02 03:06:38', '2023-08-02 04:04:14'),
(197, 'App\\Models\\User', 27, 'MyAuthApp', '68e0ae8c783ab3cec94c2b675ec316f8fa53c29e8456dea261b629812cefca72', '[\"*\"]', '2023-08-02 04:20:06', '2023-08-02 04:14:08', '2023-08-02 04:20:06'),
(198, 'App\\Models\\User', 27, 'MyAuthApp', '08004e9add8842681f1e04f988c89a9150a9621b6383dbc1571b141aab84357b', '[\"*\"]', '2023-08-02 04:30:28', '2023-08-02 04:27:52', '2023-08-02 04:30:28'),
(199, 'App\\Models\\User', 5, 'MyAuthApp', '681b4968bf85706a382be8867a97551e354963b4eedd1787b0957c7300f5da64', '[\"*\"]', '2023-08-02 05:30:29', '2023-08-02 04:34:54', '2023-08-02 05:30:29'),
(200, 'App\\Models\\User', 27, 'MyAuthApp', 'ce08e97afbcc2bb0202c5d21f184902acb888a01bd051120c1a69d42abff9787', '[\"*\"]', '2023-08-02 05:01:39', '2023-08-02 04:45:51', '2023-08-02 05:01:39'),
(201, 'App\\Models\\User', 27, 'MyAuthApp', '64019fb0165da5be2aae1c843d315f8ffd3266e435dc73c1b9f525a364a29784', '[\"*\"]', '2023-08-02 05:57:52', '2023-08-02 05:06:09', '2023-08-02 05:57:52'),
(202, 'App\\Models\\User', 5, 'MyAuthApp', '969e0a567236a2a0690eb4578bd5fcf86b959bf8b97477496aaee8c8176034f5', '[\"*\"]', '2023-08-03 04:39:38', '2023-08-02 05:45:53', '2023-08-03 04:39:38'),
(203, 'App\\Models\\User', 27, 'MyAuthApp', 'f0efa0d61ac2b88156fa0204c2257310b364d2071ce133477b86c4c2231a4625', '[\"*\"]', '2023-08-05 22:30:54', '2023-08-02 06:05:39', '2023-08-05 22:30:54'),
(204, 'App\\Models\\User', 5, 'MyAuthApp', '879c14abb45276642864be7b79dcce2143f189145eb16a14ba5871ab02208674', '[\"*\"]', '2023-08-03 07:20:08', '2023-08-03 04:38:45', '2023-08-03 07:20:08'),
(205, 'App\\Models\\User', 5, 'MyAuthApp', '95497503a294fcda7f44b1dbe25a5d297f26ba5ccde4f8f6df91a4bd4b963098', '[\"*\"]', '2023-08-05 22:59:17', '2023-08-03 06:24:12', '2023-08-05 22:59:17'),
(206, 'App\\Models\\User', 5, 'MyAuthApp', '81f64de76f221fe94962f6fb2a11676c1dd8b1024dbebe6492b90da3a5f0b371', '[\"*\"]', '2023-08-25 08:31:12', '2023-08-04 23:01:04', '2023-08-25 08:31:12'),
(207, 'App\\Models\\User', 27, 'MyAuthApp', '3db351f008d3f3c9291e8bc5451530ce99d0a087db6371e069c5a6e8a7a21476', '[\"*\"]', '2023-08-07 09:09:41', '2023-08-05 23:00:11', '2023-08-07 09:09:41'),
(208, 'App\\Models\\User', 5, 'MyAuthApp', 'a621fbe5dafa77ae5e7cee02fa608e36f630328a421edc8645e80775166f16e2', '[\"*\"]', '2023-08-07 23:51:01', '2023-08-06 00:48:15', '2023-08-07 23:51:01'),
(209, 'App\\Models\\User', 5, 'MyAuthApp', 'fe06c1e3d710da57af0818136e7128e9a8856fc848c7488cdc0fdb5273b45fb3', '[\"*\"]', NULL, '2023-08-06 21:03:20', '2023-08-06 21:03:20'),
(210, 'App\\Models\\User', 5, 'MyAuthApp', '60efaacb56e05cccd4b3a37431bd89ecfc3c245280a8cd6afb9844cb1a176586', '[\"*\"]', '2023-08-25 03:32:39', '2023-08-06 21:13:33', '2023-08-25 03:32:39'),
(211, 'App\\Models\\User', 51, 'MyAuthApp', '1ac8352d683ecd3f75941ac0c53c62a663dbd1a0463929fafb6544ba40ee0258', '[\"*\"]', NULL, '2023-08-07 21:44:16', '2023-08-07 21:44:16'),
(212, 'App\\Models\\User', 51, 'MyAuthApp', '7cbcdd30840242bfd66fb7915ca79d7b86df3eaa31b6802771b170be6554f150', '[\"*\"]', '2023-08-07 21:46:08', '2023-08-07 21:44:21', '2023-08-07 21:46:08'),
(213, 'App\\Models\\User', 27, 'MyAuthApp', '060483e581304d7cd60e9a44b34140c1b5d83c928f23f19c17fe5dac3b8dd6f8', '[\"*\"]', '2023-08-08 04:28:59', '2023-08-07 23:23:53', '2023-08-08 04:28:59'),
(214, 'App\\Models\\User', 52, 'MyAuthApp', '57e724e1f2e8fcc034bf1ff8399e089c71f9bfa89273502f8fa10defdc2926fe', '[\"*\"]', NULL, '2023-08-08 05:15:28', '2023-08-08 05:15:28'),
(215, 'App\\Models\\User', 52, 'MyAuthApp', 'd315490481ae18d86ed57e5857f9dfb1b025db8378b835b5ee030f8b84477e7c', '[\"*\"]', NULL, '2023-08-08 05:16:31', '2023-08-08 05:16:31'),
(216, 'App\\Models\\User', 52, 'MyAuthApp', '1ebf915e5fdf19c83c4a646b7fb9ec313b4d2659939f6621df5f7945e721b763', '[\"*\"]', NULL, '2023-08-08 05:16:39', '2023-08-08 05:16:39'),
(217, 'App\\Models\\User', 52, 'MyAuthApp', '74945ebf7273e225b99bc05eb49da59cf2c2ad29af0328519628ad5dee4fad0b', '[\"*\"]', '2023-08-08 05:22:25', '2023-08-08 05:16:39', '2023-08-08 05:22:25'),
(218, 'App\\Models\\User', 52, 'MyAuthApp', 'ed4885bffda13c49e4d316fa518559dd5487f7556a37aa8c9521ed4097c7e449', '[\"*\"]', '2023-08-08 05:23:03', '2023-08-08 05:22:53', '2023-08-08 05:23:03'),
(219, 'App\\Models\\User', 52, 'MyAuthApp', '3f68f5a13b76843927c35bc02bf64faa59d14ca334650fcad611e19eec37f74f', '[\"*\"]', NULL, '2023-08-08 05:23:22', '2023-08-08 05:23:22'),
(220, 'App\\Models\\User', 52, 'MyAuthApp', '627684e618e814d6d3b67d2ca463deb0cdb3ba7aa3aeddbbf77ef47589ed22b6', '[\"*\"]', '2023-08-08 05:23:47', '2023-08-08 05:23:31', '2023-08-08 05:23:47'),
(221, 'App\\Models\\User', 52, 'MyAuthApp', 'c8c0f26fb836e04c7995b8adba040c0c863146f14a0539247194ccd6bfcd84b7', '[\"*\"]', '2023-08-08 08:37:43', '2023-08-08 05:24:02', '2023-08-08 08:37:43'),
(222, 'App\\Models\\User', 52, 'MyAuthApp', '9fb636c08310fc6ba4f8e99dc223e96b5c75de88f73fd98d27dd7f3ead278e8f', '[\"*\"]', '2023-08-09 00:32:51', '2023-08-08 08:39:27', '2023-08-09 00:32:51'),
(223, 'App\\Models\\User', 51, 'MyAuthApp', 'b23d0a43dac1f9675f1de8ee6332638564266b42735f2644935e5212d709927e', '[\"*\"]', '2023-08-09 02:07:58', '2023-08-08 21:31:54', '2023-08-09 02:07:58'),
(224, 'App\\Models\\User', 27, 'MyAuthApp', '7d99f2ed6922e915c3de98b34a22fbe410d5e466ebf7fc00344e1d4ddafac908', '[\"*\"]', '2023-08-09 00:50:01', '2023-08-09 00:39:21', '2023-08-09 00:50:01'),
(225, 'App\\Models\\User', 27, 'MyAuthApp', 'a6b894bdf0514ca399c74fb1f389f61969f7682fdd7b6fe8571ebf3aeb78d18b', '[\"*\"]', '2023-08-09 01:00:23', '2023-08-09 00:56:14', '2023-08-09 01:00:23'),
(226, 'App\\Models\\User', 27, 'MyAuthApp', 'f023218af3f965fb620b3a8dba6b020dd0be099ce7ebf5e64c0725d7e0c9a209', '[\"*\"]', '2023-08-23 04:03:43', '2023-08-09 01:06:56', '2023-08-23 04:03:43'),
(227, 'App\\Models\\User', 5, 'MyAuthApp', 'ade84aceab44f47e10edb632a8100a801f78d4085ff88e51ae3e05a906346189', '[\"*\"]', '2023-08-09 01:36:11', '2023-08-09 01:35:55', '2023-08-09 01:36:11'),
(228, 'App\\Models\\User', 53, 'MyAuthApp', '2b27c50e77b4bc94d83937c9c1488acaa28ef7c536d59145ccf84acada2de0a7', '[\"*\"]', NULL, '2023-08-09 02:08:58', '2023-08-09 02:08:58'),
(229, 'App\\Models\\User', 53, 'MyAuthApp', '396154144f0379022bead564897098f714f44c491c17d5b4dd516582fe972dad', '[\"*\"]', NULL, '2023-08-09 02:10:01', '2023-08-09 02:10:01'),
(230, 'App\\Models\\User', 53, 'MyAuthApp', '2b84b07c02d3093880e5e3cc80b3c95b43b192d9b5b895499c227007b58a82a6', '[\"*\"]', NULL, '2023-08-09 02:10:02', '2023-08-09 02:10:02'),
(231, 'App\\Models\\User', 53, 'MyAuthApp', 'b96721b45ae9678ab5207911a6d111dec93cd1b01514807f5db054990b4d2a21', '[\"*\"]', '2023-08-21 06:22:09', '2023-08-09 02:10:15', '2023-08-21 06:22:09'),
(232, 'App\\Models\\User', 53, 'MyAuthApp', '57dddccc851b599a4eeaf4cb18863183b808496e6ff567f4faef4d002474fa0e', '[\"*\"]', '2023-08-27 12:40:55', '2023-08-19 04:14:42', '2023-08-27 12:40:55'),
(233, 'App\\Models\\User', 5, 'MyAuthApp', 'c7fcf650df2416753f66e2df88240c3bb7c56790677ea0d401cb801f09e77b0c', '[\"*\"]', '2023-08-25 23:09:39', '2023-08-21 02:23:25', '2023-08-25 23:09:39'),
(234, 'App\\Models\\User', 5, 'MyAuthApp', '70beee57a58f3ab164e5f73119a7f8000029364695cc01c468dc7d0058acdbd5', '[\"*\"]', '2023-08-22 23:32:38', '2023-08-21 06:58:58', '2023-08-22 23:32:38'),
(235, 'App\\Models\\User', 53, 'MyAuthApp', '006b677fdf4f9fc8f7a0d80b246f12c3b2373dc5e7e6e4ceb82a7dcbff035ac5', '[\"*\"]', '2023-08-25 03:14:11', '2023-08-22 00:57:32', '2023-08-25 03:14:11'),
(236, 'App\\Models\\User', 5, 'MyAuthApp', 'a3376d707788fcad458064b1a7946328da61dec4897118de3ced7c392bc6249d', '[\"*\"]', '2023-08-26 04:37:24', '2023-08-22 06:05:04', '2023-08-26 04:37:24'),
(237, 'App\\Models\\User', 5, 'MyAuthApp', '7bafd39c40b315a15b5298ed4194ea7c38587c553748fed7de21a9d84e6d62db', '[\"*\"]', '2023-08-23 01:34:14', '2023-08-22 23:25:21', '2023-08-23 01:34:14'),
(238, 'App\\Models\\User', 54, 'MyAuthApp', '66998f81824073e69c240e61a9d3746b1460928cdee6203eaf119742e7356045', '[\"*\"]', NULL, '2023-08-23 02:47:28', '2023-08-23 02:47:28'),
(239, 'App\\Models\\User', 5, 'MyAuthApp', 'cc3d088578e115a9e7a88b859f259cb17dcd1c1967d567f288ec3e44be7fbfc1', '[\"*\"]', '2023-08-23 04:42:03', '2023-08-23 02:49:59', '2023-08-23 04:42:03'),
(240, 'App\\Models\\User', 14, 'MyAuthApp', '31770f7857ca1e7a049985be1bdaa182d52e347c6b6aca5b686ce0667427549c', '[\"*\"]', NULL, '2023-08-23 04:08:20', '2023-08-23 04:08:20'),
(241, 'App\\Models\\User', 14, 'MyAuthApp', '576a943653b4652d3ee649ad05fadf287bcae80cd3ebd1da3e35656e15f45763', '[\"*\"]', '2023-08-23 04:08:51', '2023-08-23 04:08:28', '2023-08-23 04:08:51'),
(242, 'App\\Models\\User', 55, 'MyAuthApp', '20ac57c366573043221b1cb5f8198ba492b233a51e5613218e387fa2fb86535a', '[\"*\"]', NULL, '2023-08-23 04:11:44', '2023-08-23 04:11:44'),
(243, 'App\\Models\\User', 36, 'MyAuthApp', '5b489dd8419f53c1bcac620e2d532ae8280a6e58fc84801f7dc8983b851af176', '[\"*\"]', '2023-08-23 04:12:36', '2023-08-23 04:12:04', '2023-08-23 04:12:36'),
(244, 'App\\Models\\User', 56, 'MyAuthApp', '38f1866c65791288a22cf6bf4ac6d1b68373da6c18f826a009f362eea7021604', '[\"*\"]', NULL, '2023-08-23 04:17:13', '2023-08-23 04:17:13'),
(245, 'App\\Models\\User', 55, 'MyAuthApp', 'e870310718a829fc40a08cd0134b8ba8ae3473bca07bbd3802957e2bca900d40', '[\"*\"]', '2023-08-23 04:17:26', '2023-08-23 04:17:22', '2023-08-23 04:17:26'),
(246, 'App\\Models\\User', 57, 'MyAuthApp', 'a8ad21a8ca31c8d4a54e8213c13e5ff0266db5540d0fb7c73a7f2d1cccb27f74', '[\"*\"]', NULL, '2023-08-23 04:22:52', '2023-08-23 04:22:52'),
(247, 'App\\Models\\User', 56, 'MyAuthApp', '1d62433af890e9713538e46c695afbf350766cd5806b5925d76a8fb5987e9580', '[\"*\"]', '2023-08-23 04:23:08', '2023-08-23 04:23:00', '2023-08-23 04:23:08'),
(248, 'App\\Models\\User', 58, 'MyAuthApp', 'ce0a630eb2dffb6ae356a6328ad92bd136a06559ca1a976e577e716b48b7f15c', '[\"*\"]', NULL, '2023-08-23 04:27:19', '2023-08-23 04:27:19'),
(249, 'App\\Models\\User', 57, 'MyAuthApp', '9ecaad3a47914af699208950281f1cc322d6ece49d4a6ab334e10e136ed7482c', '[\"*\"]', '2023-08-23 04:29:42', '2023-08-23 04:27:26', '2023-08-23 04:29:42'),
(250, 'App\\Models\\User', 59, 'MyAuthApp', '0c5af01088f74312c82894de01f3f42040bf6a21898e21c8e02ea0692ef71ca3', '[\"*\"]', NULL, '2023-08-23 04:32:16', '2023-08-23 04:32:16'),
(251, 'App\\Models\\User', 58, 'MyAuthApp', 'fa507306ba84c34c72860bbf64a5265cb627e1e8d48eb12e5729b6b9519d451d', '[\"*\"]', '2023-08-23 04:42:53', '2023-08-23 04:32:23', '2023-08-23 04:42:53'),
(252, 'App\\Models\\User', 58, 'MyAuthApp', 'd9a98fb5408f4e92e9dfcdaa68dc5105270b7ea289a521f9dab0f52ff0e4718d', '[\"*\"]', '2023-08-23 04:40:06', '2023-08-23 04:38:44', '2023-08-23 04:40:06'),
(253, 'App\\Models\\User', 60, 'MyAuthApp', '663f840b4885d3859fccd8dc68121d96342853866bcb9521087612a177cd7db3', '[\"*\"]', NULL, '2023-08-23 04:46:26', '2023-08-23 04:46:26'),
(254, 'App\\Models\\User', 59, 'MyAuthApp', 'd61b8514c180ec290b923b14b3d0df69475482d93a3778e7627932c5ab798467', '[\"*\"]', '2023-08-23 04:47:50', '2023-08-23 04:46:40', '2023-08-23 04:47:50'),
(255, 'App\\Models\\User', 61, 'MyAuthApp', 'dde4684decfc9edc81b5587dff79be75307767ec60dec1a8c0fbd48f68420600', '[\"*\"]', NULL, '2023-08-23 04:50:51', '2023-08-23 04:50:51'),
(256, 'App\\Models\\User', 54, 'MyAuthApp', '14da5d9c517c5f348b7184cd2f6c6f589547015015f5448b49898c141fef1c07', '[\"*\"]', NULL, '2023-08-23 04:51:59', '2023-08-23 04:51:59'),
(257, 'App\\Models\\User', 61, 'MyAuthApp', 'd869f037f652f3ba8cd735a02f0e4540981f6aedbf1a244e50d317345b9dbc5a', '[\"*\"]', '2023-08-23 04:53:34', '2023-08-23 04:52:50', '2023-08-23 04:53:34'),
(258, 'App\\Models\\User', 62, 'MyAuthApp', 'f3451906f706769cd36c770dc9c07c9ee1a90f0e79125349842f690dfe5729ef', '[\"*\"]', '2023-08-23 04:56:06', '2023-08-23 04:55:35', '2023-08-23 04:56:06'),
(259, 'App\\Models\\User', 62, 'MyAuthApp', '14ea6c0c5d9618e41e3cd38cf9b5c4c75c2e1b52935a9a11945c14881234fe2e', '[\"*\"]', '2023-08-23 22:51:48', '2023-08-23 04:56:20', '2023-08-23 22:51:48'),
(260, 'App\\Models\\User', 5, 'MyAuthApp', '7b82f327202818c558bfa7b2386cb8ad7565a4cad2edda95a5a6506cef74e0ff', '[\"*\"]', '2023-08-24 02:19:28', '2023-08-23 22:49:11', '2023-08-24 02:19:28'),
(261, 'App\\Models\\User', 14, 'MyAuthApp', '6467240c0e68a44d573008084b9266c69948a44f15c476a6eda16f56a0c5a1ce', '[\"*\"]', NULL, '2023-08-23 23:37:35', '2023-08-23 23:37:35'),
(262, 'App\\Models\\User', 14, 'MyAuthApp', 'b7203ed1a94ba2b7c3233e7654f9afc258cd0a97c15a9d24600046412e4d72da', '[\"*\"]', '2023-08-24 23:50:10', '2023-08-23 23:37:47', '2023-08-24 23:50:10'),
(263, 'App\\Models\\User', 5, 'MyAuthApp', 'f67f9b099f1448b7657fb7b53c1d1f27b38c3c6ad9a69355abb21f9b3c809902', '[\"*\"]', '2023-08-25 08:21:48', '2023-08-24 23:45:26', '2023-08-25 08:21:48'),
(264, 'App\\Models\\User', 14, 'MyAuthApp', 'd0821180b0bc9443d98736c78a95c5c5f5029f906a6ae22e54d33377b6dc85ac', '[\"*\"]', NULL, '2023-08-24 23:56:21', '2023-08-24 23:56:21'),
(265, 'App\\Models\\User', 14, 'MyAuthApp', 'df9268a096f41031af3317eb8a4ef2de6c546f2191cc4afcd3743fe0b89bf618', '[\"*\"]', '2023-08-26 05:01:18', '2023-08-24 23:56:28', '2023-08-26 05:01:18'),
(266, 'App\\Models\\User', 5, 'MyAuthApp', '05aca6ed74de90807e5b3819606bbb2103cd6e6751ce44b11f5320500e391d19', '[\"*\"]', '2023-08-25 01:21:31', '2023-08-25 01:21:05', '2023-08-25 01:21:31'),
(267, 'App\\Models\\User', 5, 'MyAuthApp', '1419d3d9dc413768e8b34435480444af791591eb3382dcfe1c774f7c54f2417e', '[\"*\"]', NULL, '2023-08-25 03:21:43', '2023-08-25 03:21:43'),
(268, 'App\\Models\\User', 53, 'MyAuthApp', 'bcaf6b2c8f8d0f06f7be79d61ed9988f26dfc72ccbc98d9de6b4d774b0d8d468', '[\"*\"]', '2023-08-26 03:41:08', '2023-08-25 22:34:28', '2023-08-26 03:41:08'),
(269, 'App\\Models\\User', 5, 'MyAuthApp', '37038bf0b3b2a676fcbba365877975e6b7f549a84d0be176e697af44288a0e5e', '[\"*\"]', '2023-08-26 03:40:01', '2023-08-25 23:39:06', '2023-08-26 03:40:01'),
(270, 'App\\Models\\User', 5, 'MyAuthApp', '3d4043d98a03b03a8ab627a34c7772de516106abb7beabccf9707f3094ebeb24', '[\"*\"]', '2023-08-26 01:02:41', '2023-08-26 00:56:45', '2023-08-26 01:02:41'),
(271, 'App\\Models\\User', 5, 'MyAuthApp', '6dcb5dec89cc45458db80ecd90c19d69f8cf146d5520c861823c37d9ecdd8128', '[\"*\"]', '2023-08-26 03:39:49', '2023-08-26 02:40:20', '2023-08-26 03:39:49'),
(272, 'App\\Models\\User', 5, 'MyAuthApp', '9d4cc712db48595d1f3da485d88d005f3b22576cec04fda193aaa08d1c2d6b3f', '[\"*\"]', '2023-08-26 02:43:07', '2023-08-26 02:42:53', '2023-08-26 02:43:07'),
(273, 'App\\Models\\User', 5, 'MyAuthApp', '575acdc7a151551844150f86e0570e175f7e899ddfa690b6319f86232530071e', '[\"*\"]', '2023-08-26 04:12:00', '2023-08-26 04:08:03', '2023-08-26 04:12:00'),
(274, 'App\\Models\\User', 27, 'MyAuthApp', '99df4a33b0c2cd1a0ed2f0e861624af54d4cdb269d1e8e8df5ead5aeeaa2de50', '[\"*\"]', '2023-08-26 05:19:45', '2023-08-26 05:16:08', '2023-08-26 05:19:45'),
(275, 'App\\Models\\User', 53, 'MyAuthApp', 'ce4a92e2289522c820f08c749d34516d029c647e61e919947c3d79314f362c91', '[\"*\"]', '2023-08-26 05:19:33', '2023-08-26 05:19:10', '2023-08-26 05:19:33'),
(276, 'App\\Models\\User', 14, 'MyAuthApp', '9ab018f84de8f130e340e20cd13e3597d364c9b485f9b8bc30de9ca21d23cc33', '[\"*\"]', NULL, '2023-08-26 05:20:10', '2023-08-26 05:20:10'),
(277, 'App\\Models\\User', 14, 'MyAuthApp', '845685ea20650d2037a42687ebfebe437d5b8445be8e173135302de7f441ce2a', '[\"*\"]', '2023-08-29 07:20:49', '2023-08-26 05:20:16', '2023-08-29 07:20:49'),
(278, 'App\\Models\\User', 63, 'MyAuthApp', 'e07906bf8a4f6b5cc01b9b32bba01eb426594ede358747828df35d67c321dec9', '[\"*\"]', '2023-08-26 05:41:30', '2023-08-26 05:41:06', '2023-08-26 05:41:30'),
(279, 'App\\Models\\User', 64, 'MyAuthApp', '00098521f746cf43ae714d3d7e09fe8075297b12afe8acc29b340355e6dd1cc5', '[\"*\"]', NULL, '2023-08-26 05:43:35', '2023-08-26 05:43:35'),
(280, 'App\\Models\\User', 64, 'MyAuthApp', '9e2710c872eedb0ed7e2a14dd901335d472648d5ed8014a8c2cb4f57b22bfa7b', '[\"*\"]', '2023-08-26 05:45:33', '2023-08-26 05:44:56', '2023-08-26 05:45:33'),
(281, 'App\\Models\\User', 65, 'MyAuthApp', '1b9bfc5112ebf539733cf9ffc572cbc24fdab97d401b06b6cdbb1f5cc777eb01', '[\"*\"]', NULL, '2023-08-26 05:46:19', '2023-08-26 05:46:19'),
(282, 'App\\Models\\User', 65, 'MyAuthApp', '30bbdcd0ec41142bda97aa1c3efcb30b74b3b4e5dc41a11a8d54fb49bef60fb0', '[\"*\"]', '2023-08-26 06:07:07', '2023-08-26 05:46:24', '2023-08-26 06:07:07'),
(283, 'App\\Models\\User', 14, 'MyAuthApp', '37acef78c2d28ac68c55c298d192cca9bae6212f25d976c8fd376275287cdf7a', '[\"*\"]', NULL, '2023-08-26 06:09:29', '2023-08-26 06:09:29'),
(284, 'App\\Models\\User', 14, 'MyAuthApp', '6d715ddb8c353cc699f828be6b5c2fe646873b437bd4149933de558ebd81fa71', '[\"*\"]', '2023-08-26 06:17:30', '2023-08-26 06:09:34', '2023-08-26 06:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `podcast`
--

CREATE TABLE `podcast` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `podcast`
--

INSERT INTO `podcast` (`id`, `user_id`, `mood_id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(3, NULL, 7, 'Podcast title 2', '<p>Podcast description 2</p>', '1692955644.png', '2023-08-25 03:57:24', '2023-08-25 09:27:24'),
(2, NULL, 8, 'Podcast title 1', '<p>Podcast description&nbsp;1</p>', '1692955603.jpg', '2023-08-25 03:56:43', '2023-08-25 09:26:43'),
(4, NULL, 6, 'Podcast title 3', '<p>Podcast description&nbsp;3</p>', '1692955671.png', '2023-08-25 03:57:51', '2023-08-25 09:27:51'),
(5, NULL, 5, 'Podcast title 4', '<p>Podcast description 4</p>', '1692955695.jpg', '2023-08-25 03:58:15', '2023-08-25 09:28:15'),
(6, NULL, 4, 'Podcast title 5', '<p>Podcast description&nbsp;5</p>', '1692955728.png', '2023-08-25 03:58:48', '2023-08-25 09:28:48'),
(7, NULL, 3, 'Podcast title 6', '<p>Podcast description&nbsp;6</p>', '1692955757.jpg', '2023-08-25 03:59:17', '2023-08-25 09:29:17'),
(8, NULL, 2, 'Podcast title 7', '<p>Podcast description 7</p>', '1692955800.png', '2023-08-25 04:00:00', '2023-08-25 09:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `podcast_audio`
--

CREATE TABLE `podcast_audio` (
  `id` int(11) NOT NULL,
  `podcast_id` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `audio` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `podcast_audio`
--

INSERT INTO `podcast_audio` (`id`, `podcast_id`, `title`, `description`, `audio`, `created_at`, `updated_at`) VALUES
(3, 3, 'Audio 2', '<p>Audio 2&nbsp;Description&nbsp;</p>', '1692955955.mp3', '2023-08-25 04:02:38', '2023-08-25 09:32:38'),
(2, 2, 'Audio 1', '<p>Audio 1&nbsp;Description&nbsp;</p>', '1692955923.mp3', '2023-08-25 04:02:08', '2023-08-25 09:32:08'),
(5, 4, 'Audio 3', '<p>Audio 3&nbsp;Description&nbsp;</p>', '1692955987.mp3', '2023-08-25 04:03:11', '2023-08-25 09:33:11'),
(6, 5, 'Audio 4', '<p>Audio 4&nbsp;Description&nbsp;</p>', '1692956011.mp3', '2023-08-25 04:03:35', '2023-08-25 09:33:35'),
(7, 6, 'Audio 5', '<p>Audio 5&nbsp;Description&nbsp;</p>', '1692956033.mp3', '2023-08-25 04:03:55', '2023-08-25 09:33:55'),
(8, 7, 'Audio 6', '<p>Audio 6&nbsp;Description&nbsp;</p>', '1692956054.mp3', '2023-08-25 04:04:17', '2023-08-25 09:34:17'),
(9, 8, 'Audio 7', '<p>Audio 7&nbsp;Description&nbsp;</p>', '1692956075.mp3', '2023-08-25 04:04:39', '2023-08-25 09:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `thought`
--

CREATE TABLE `thought` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `audio_video` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `thought`
--

INSERT INTO `thought` (`id`, `category_id`, `title`, `description`, `file_type`, `audio_video`, `created_at`, `updated_at`) VALUES
(3, 4, 'Sad Thought', '<p>Sad Thought 1&nbsp;description</p>', 'Video', '1692956304.mp4', '2023-08-25 04:08:27', '2023-08-25 09:38:27'),
(2, 3, 'Happy Thought 1', '<p>Happy Thought 1&nbsp;description</p>', 'Audio', '1692956266.mp3', '2023-08-25 04:07:49', '2023-08-25 09:37:49'),
(4, 5, 'Fear Thought', '<p>Fear Thought 1&nbsp;description</p>', 'Audio', '1692956339.mp3', '2023-08-25 04:09:03', '2023-08-25 09:39:03'),
(5, 4, 'Sad Thought', '<p>Sad Thought 1&nbsp;description</p>', 'Video', '1692956373.mp4', '2023-08-25 04:09:37', '2023-08-25 09:39:37'),
(6, 7, 'Disgusting', '<p>Disgusting&nbsp;Thought 1&nbsp;description</p>', 'Audio', '1692956418.mp3', '2023-08-25 04:10:24', '2023-08-25 09:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `thought_category`
--

CREATE TABLE `thought_category` (
  `id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `thought_category`
--

INSERT INTO `thought_category` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(3, 'Happy', '<p>Happy&nbsp;Audio 1&nbsp;Description description</p>', '1692956126.png', '2023-08-25 04:05:26', '2023-08-25 09:35:26'),
(4, 'Sad', '<p>Thought Category description</p>', '1692956171.png', '2023-08-25 04:06:11', '2023-08-25 09:36:11'),
(5, 'Fear', '<p>Thought Category description</p>', '1692956186.png', '2023-08-25 04:06:26', '2023-08-25 09:36:26'),
(6, 'Angry', '<p>Thought Category description</p>', '1692956202.png', '2023-08-25 04:06:42', '2023-08-25 09:36:42'),
(7, 'Disgusting', '<p>Thought Category description</p>', '1692956218.png', '2023-08-25 04:06:58', '2023-08-25 09:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('admin','customer') DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `mobile_verification_code` int(11) DEFAULT NULL,
  `profile_pic` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `code`, `email`, `mobile`, `mobile_verification_code`, `profile_pic`, `email_verified_at`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', NULL, 'admin@gmail.com', NULL, NULL, NULL, '2022-06-15 07:56:38', '$2y$10$LG8oYZ9P7MYZnggvIYOreeyXVnZx27Porbi7OuXGjfbaRe700yx4O', 'ahRuUzinWSwXutvD9U7ssk1LzGSsDTGgQiuuceCMMFJpuEEZMklP0WXNnd10', '0', '2022-06-15 07:56:38', '2022-06-15 07:56:39'),
(5, 'customer', 'Ram Test', '232323', 'ramtest11@gmail.com', '987654321', NULL, '1689236902.jpg', NULL, '$2y$10$NbgJQ2dN.Sw5/UJKk6O7EOhP0plJDVvygGDDhW2T/O19uQxhHKqSC', NULL, '1', '2023-07-11 01:32:13', '2023-08-23 02:49:59'),
(6, 'customer', 'Ram Test11', '232323', 'abc@gmail.com', '987654450', NULL, NULL, NULL, '$2y$10$gBIWNZ4jq9Uvk8U6w9zGledifvS9EHb4X75/WJsdQ0SvjOEcgyoom', NULL, '1', '2023-07-11 23:04:32', '2023-07-12 00:10:51'),
(7, 'customer', 'Jaseem', '123478', 'kjaseem892@gmail.com', '03477045304', 1234, NULL, NULL, '$2y$10$C/NedjToxzquXISKaE.X1OSeeTPNx3N/NFbRokZrgni67LmEYtMCG', NULL, '0', '2023-07-12 00:20:43', '2023-07-12 00:20:43'),
(8, 'customer', 'JaseemHero', '123478', 'kjaseem893@gmail.com', '92563879', 1234, NULL, NULL, '$2y$10$LgZahNIVGLaDekjIn22vL.OHTGLXY6lj02bRgvVjo5wtdjHog1MLy', NULL, '0', '2023-07-12 00:26:39', '2023-07-12 00:26:39'),
(9, 'customer', 'JaseemHero', '123478', 'kjaseem890@gmail.com', '92563858', 1234, NULL, NULL, '$2y$10$xXyejk1j2jPPAfW9hQCc1OOfNg1CHHiZeFTtq.IQO1MbToVpb.EY.', NULL, '0', '2023-07-12 00:29:08', '2023-07-12 00:29:08'),
(10, 'customer', 'JaseemHero', '123478', 'kjaseem898@gmail.com', '92563859', 1234, NULL, NULL, '$2y$10$Bhk9yawBSH2dSgSgrFrC8.dCAmp.C1tixqBaVMcmq.L.SMYycxbWi', NULL, '0', '2023-07-12 00:30:06', '2023-07-12 00:30:06'),
(11, 'customer', 'zero', '134556', 'zero123@gmail.com', '98456839', 1234, NULL, NULL, '$2y$10$AcPg1RKbZU0p67Q9NranBe2jYb/Tzyh316Zj/6st8h/2G5hJiW2Da', NULL, '0', '2023-07-12 00:35:12', '2023-07-12 00:35:12'),
(12, 'customer', 'zero345', '134556', 'zero345@gmail.com', '98456839', 1234, NULL, NULL, '$2y$10$7vzfb/OFhcYphrrxQ1sDNuYrjqt/4bxtzIwdcivfYvO26kNnc/Q8W', NULL, '0', '2023-07-12 00:36:55', '2023-07-12 00:36:55'),
(13, 'customer', 'Muhammad  Jaseem', '242526', 'bangashhur00@gmail.com', '923477045304', NULL, NULL, NULL, '$2y$10$eeY3QacAdF3fQEcGPq6FBO7bmCpn2fKf1HIkatDYQRw6wjFKzFg8O', NULL, '1', '2023-07-12 01:06:49', '2023-07-17 02:28:19'),
(14, 'customer', 'Muhammad  Jaseem', '123456', 'bangashhur70@gmail.com', '923329634789', NULL, NULL, NULL, '$2y$10$F9jllmJAQwGNh4kTxa2FOO887AKnRwdD.u5em1kh.RXNCD8qMNAdG', NULL, '1', '2023-07-12 01:10:26', '2023-08-26 06:09:34'),
(15, 'customer', 'Muhammad Jaseee', '123456', 'bangashhur20@gmail.com', '923328634789', NULL, NULL, NULL, '$2y$10$aSPxLOt1O9MpYqoEUr/dbONn3gJ3wt2hz6EXq/uaCF3bKv7TPgsHi', NULL, '1', '2023-07-12 01:17:23', '2023-07-12 01:17:42'),
(16, 'customer', 'taybain', '232425', 'taybain@gmail.com', '923477045304', 1234, NULL, NULL, '$2y$10$e4Sf5TBwRYgIZHO0SQG1keBj3rIxlV4p6TdVlWvwIt63lfRxEvVua', NULL, '0', '2023-07-12 01:35:51', '2023-07-12 01:35:51'),
(17, 'customer', 'jaseem', '123455', 'muqibhai36@gmail.com', '923477045304', 1234, NULL, NULL, '$2y$10$0DvCq7dVC9B81tikmnLHhOwIZEb2MMASVuLnEV2wkLwaT6r85uA1G', NULL, '0', '2023-07-12 01:51:54', '2023-07-12 01:51:54'),
(18, 'customer', 'jaseeem', '123445', 'bangashhur60@gmail.com', '923477045304', 1234, NULL, NULL, '$2y$10$j0yNFUsbp8Xtm.OLycn3DuCftPIZ9SbPZZrcSBnwcAqaqBXjzgnYG', NULL, '0', '2023-07-12 02:27:46', '2023-07-12 02:27:46'),
(19, 'customer', 'hero', '123456', 'kjaseem792@gmail.com', '923477045304', 1234, NULL, NULL, '$2y$10$CVszn5NzvQGXWqXw4zVdSeFq0rkK415HpZEXwKfRBLtjGHrMffeQC', NULL, '0', '2023-07-12 02:42:05', '2023-07-12 02:42:05'),
(20, 'customer', 'hro123123456', '123456', 'bangashhur11@gmail.com', '923477045804', 1234, NULL, NULL, '$2y$10$iuIkhUuwoEqfXdHPAl6/k.VLtfWArLiesmZcbcT2PISECpRl4ri5.', NULL, '0', '2023-07-12 02:49:05', '2023-07-12 02:49:05'),
(21, 'customer', 'Ram Test1221', '232323', 'abcd@gmail.com', '987654321', NULL, NULL, NULL, '$2y$10$1wtoYRiwPXkgXfC5n1KLHeYD1x32l7tGgqWNHcgVHhTr5KktxXXE2', NULL, '1', '2023-07-12 03:35:35', '2023-07-12 03:41:39'),
(22, 'customer', 'jaseem gul', '123456', 'jaseemshah@gmail.com', '923477045304', NULL, NULL, NULL, '$2y$10$MjWsCoRGBjOiaWGw3Udv8OPXyhQQ/xkmI8O012bOfiEbtduD3U4vu', NULL, '1', '2023-07-12 04:58:24', '2023-07-12 05:01:56'),
(23, 'customer', 'Ram Test11', '232323', 'abcfd@gmail.com', '987654450', 1234, NULL, NULL, '$2y$10$K4Rs9fWjdlo1tJd.IBN.U.fnZywImtm7NLKTq5THQHNE4m/73a.wu', NULL, '0', '2023-07-12 05:40:39', '2023-07-12 05:40:39'),
(24, 'customer', 'Ram Test11', '232323', 'abcfd@gmail.co', '987654450', 1234, NULL, NULL, '$2y$10$gP2W7m5a4nHqqB/Bpy6jhebqyU27P.2ROm9cFvW4WgbdLAbWm5GPe', NULL, '0', '2023-07-12 05:42:16', '2023-07-12 05:42:16'),
(25, 'customer', 'gul khan', '123456', 'gulkhan@gmail.com', '9234576543', 1234, NULL, NULL, '$2y$10$MR0DxxH.npmpbP74.xoZIOXuTiFmjWi5.o27Ntx8ni6y9VQadtpBS', NULL, '0', '2023-07-12 06:19:22', '2023-07-12 06:19:22'),
(26, 'customer', 'batman', '123456', 'batman@gmail.com', '923477085304', 1234, NULL, NULL, '$2y$10$N97bKqyKCqHXRvnLIPGUnuviqVDLoHl9fNsRyEk60N4cxRq8mESXq', NULL, '0', '2023-07-12 06:46:47', '2023-07-12 06:46:47'),
(27, 'customer', 'zardari king', '123456', 'chalokhan@gmail.com', '345678905', NULL, NULL, NULL, '$2y$10$UYImcOhQHFFR7fcsbE5evehd9qCWjgxKeDoB8ke9CmC865ostcf4G', NULL, '1', '2023-07-12 07:02:45', '2023-08-07 09:09:39'),
(28, 'customer', 'Ram Test11', '232323', 'ramtest12@gmail.com', '987654322', 1234, NULL, NULL, '$2y$10$7bEB4ScDK8WIgJ0745.o9.eaBlUSk2ljW.Qej75P9q6/QICHmYz1C', NULL, '0', '2023-07-13 00:19:39', '2023-07-13 00:19:39'),
(29, 'customer', 'abcs', '232323', 'abc12@gmail.com', '9185423585', 1234, NULL, NULL, '$2y$10$EahalycemIsWRX9R0bwFOeIjRHgJfJQA45.vr0gk6pBmQf2ZU5EaO', NULL, '0', '2023-07-13 00:23:27', '2023-07-13 00:23:27'),
(30, 'customer', 'abcs', '232323', 'abc123@gmail.com', '91854856258', NULL, NULL, NULL, '$2y$10$JprOGnIfO7YfFhKNYz9E2.EsNcMfgWPfFr.BRm71CjTLWhbFAK7pq', NULL, '1', '2023-07-13 00:29:52', '2023-07-13 00:31:33'),
(31, 'customer', 'Ram Test11', '232323', 'ramtest21@gmail.com', '987654321', NULL, NULL, NULL, '$2y$10$.2CRB7CR/3j.K.qVqglpjOCN6KEiVxzWSHd02NUTHNLrxxrOI1Oi.', NULL, '1', '2023-07-15 02:27:20', '2023-07-17 03:56:23'),
(32, 'customer', 'Muhammad', '230450', 'muqibhai6@gmail.com', '0347704560', 1234, NULL, NULL, '$2y$10$GgET5v6fGcXpUeJAUu9SV.QsThPufWc3j0b51wUS4byAp7i9ko6jW', NULL, '0', '2023-07-15 02:34:49', '2023-07-15 02:34:49'),
(33, 'customer', 'TestUser', '134556', 'test12@gmail.com', '92354789888', NULL, NULL, NULL, '$2y$10$vVs8rvh.BnyfnQwI7RRCiet/KDXdw.Mr1LDJTza0jQ147Ogi7vUVW', NULL, '1', '2023-07-16 05:49:36', '2023-07-16 05:49:49'),
(34, 'customer', 'Ram Test11', '232323', 'test11@gmail.com', '9876543211', 1234, NULL, NULL, '$2y$10$YSvyfc03jatgkoWQc92eveUkCf6WCbfaLfj/MvUM4W1tV24oePBli', NULL, '0', '2023-07-17 04:13:58', '2023-07-17 04:13:58'),
(35, 'customer', 'Ram Test11', '232323', 'test1@gmail.com', '9876543211', 1234, NULL, NULL, '$2y$10$IufbNWSBEri.apWuV1XrG.ZsLjhUcMY5BZKVlIBXfIkzGw4kZt8DC', NULL, '0', '2023-07-19 01:55:58', '2023-07-19 01:55:58'),
(36, 'customer', 'Nawazuddin', '123456', 'Nawazuddin@gmail.com', '923329634789', NULL, NULL, NULL, '$2y$10$mxK3iRy97fYUyqNvUU5ESeIBBH.eTy9yuiJkBgz0wY6ZgAX9TTJmG', NULL, '1', '2023-07-19 02:19:28', '2023-08-23 04:12:04'),
(37, 'customer', 'User123', '987655', 'user123@gmail.com', '929635486654', NULL, NULL, NULL, '$2y$10$p919rIVETp2.8LBoSD0.iOItEmcIiHozgzQzyugg5ULZTjFsNRVO.', NULL, '1', '2023-07-19 02:33:44', '2023-07-19 02:34:36'),
(38, 'customer', 'User123', '987655', 'user1234@gmail.com', '929635486654', 1234, NULL, NULL, '$2y$10$52GzGiQJIDrPpw33ZBFS8O3rdYBXxecu1uJqbG10bkBYxO7hxOX6e', NULL, '0', '2023-07-19 02:34:30', '2023-07-19 02:34:30'),
(39, 'customer', 'Jacking', '949495', 'jacking@gmail.com', '9225477045304', NULL, NULL, NULL, '$2y$10$jfo4k93.ZjCf59X2LJ7mPOXvir5DanQDQgdLt1it7WO6FdKbyCZ96', NULL, '1', '2023-07-19 03:18:41', '2023-07-19 04:20:45'),
(40, 'customer', 'salman khan', '234588', 'kingkhan@gmail.com', '9235477045304', NULL, NULL, NULL, '$2y$10$RJ0Hyqjxw.gnOanlvZdAw.gPuENN8hJA.uIdbML4QnH0wgGHsShNa', NULL, '1', '2023-07-19 04:30:29', '2023-07-19 05:16:53'),
(41, 'customer', 'Abc12', '12345', 'abc124@gmail.com', '09565625555', NULL, NULL, NULL, '$2y$10$nJyhQkbJfNDEiJn83xo96.nFmjxsHQw5cNdCb9BdXC082yL8nOrBS', NULL, '1', '2023-07-19 04:54:12', '2023-07-19 05:00:30'),
(42, 'customer', 'Ram Test11', '232323', 'test@gmail.com', '9876543211', 1234, NULL, NULL, '$2y$10$wMY3wmkFk7Nb.ah.8Z079uq1U/Cly.GfO5lmiFgCKs9kENCwqgZ2u', NULL, '0', '2023-07-19 05:24:23', '2023-07-19 05:24:23'),
(43, 'customer', 'Ram Test11', '232323', 'test43@gmail.com', '9876543211', 1234, NULL, NULL, '$2y$10$h468/gsFnZmiOPEcUe4cUOa0o.jnX.Bqw44oNZAW20udwRzoBQmT6', NULL, '0', '2023-07-20 02:36:23', '2023-07-20 02:36:23'),
(44, 'customer', 'Ram Test11', '232323', 'ram21@gmail.com', '987654322', 1234, NULL, NULL, '$2y$10$im03GKZRewPLQA3I85Wame6cGPIG7aD0GQ5SldW6W9kCqKP.5LDvC', NULL, '0', '2023-07-28 00:03:27', '2023-07-28 00:03:27'),
(45, 'customer', 'anc Dg', '323232', 'ksh168517@gmail.com', '9856235484', NULL, NULL, NULL, '$2y$10$Dlkd44HXK6QW.R9t9HSUq.RjSY9R82eqi8wAOmww0pKUigZdO8RNG', NULL, '1', '2023-07-28 00:38:02', '2023-07-28 00:39:06'),
(46, 'customer', 'abc1', '323232', 'abc1245@gmail.com', '98564253258', NULL, NULL, NULL, '$2y$10$k88ysqcH2rOANR5KxecqBOEZxBRThDH/gZhomZlYSGt1rZuS8j6UK', NULL, '1', '2023-07-28 00:43:30', '2023-07-28 00:43:34'),
(47, 'customer', 'Ram Test11', '232323', 'test3@gmail.com', '9876543311', 1234, NULL, NULL, '$2y$10$tIabp.EJvHMGu/7ECrwtcOY0fu1lfZ6gY21IUJeDtdh0W4wlEUuQy', NULL, '0', '2023-07-31 05:15:18', '2023-07-31 05:15:18'),
(48, 'customer', 'Ram Test11', '232323', 'test134@gmail.com', '9876543311', 1234, NULL, NULL, '$2y$10$XSXMhsp0fIDRAiq8Zrg97.wf64aC1FRH55rOUY66pULwQPO3yZKBe', NULL, '0', '2023-07-31 23:07:17', '2023-07-31 23:07:17'),
(49, 'customer', 'Chalokhan250', '123456', 'Chalokhan250@gmail.com', '92347845389', NULL, NULL, NULL, '$2y$10$K33uxr8I.kRX8ihlLNgByeHVs0KxCtOlJqzPjmFesaW/C4vkIigUq', NULL, '1', '2023-08-02 02:05:51', '2023-08-02 02:06:00'),
(50, 'customer', 'Chalokhan', '123456', 'Calokhan@gmail.com', '92356489532', NULL, NULL, NULL, '$2y$10$rjGe.HNzCpaw0iRWLnFGI.Id6RITqHwBfZpc0I5POF46VcDEMXYKa', NULL, '1', '2023-08-02 03:06:34', '2023-08-02 03:06:38'),
(51, 'customer', 'Abc1', '323232', 'abc12456@gmail.com', '9180523518', NULL, NULL, NULL, '$2y$10$feUom7P9SLSDrL7VhmWz5ulU4aBNINFAvQh8yVSeo6bjpiCrNJViu', NULL, '1', '2023-08-07 21:44:16', '2023-08-07 21:44:21'),
(52, 'customer', 'tom123', '1234', 'tom@gmail.com', '923098502274', NULL, NULL, NULL, '$2y$10$jZzVszQ551V6Gp17.7ypk.M9kCySBHbY7d0XmIoJxFtvt7L.eTDfa', NULL, '1', '2023-08-08 05:15:28', '2023-08-08 05:23:47'),
(53, 'customer', 'Abc2', '232323', 'abc124567@gmail.com', '928541235', NULL, NULL, NULL, '$2y$10$1vwaRl2oEcQkEqA/9xpvUuxqNNvEn94qjELia5sL44i25fTMfXokS', NULL, '1', '2023-08-09 02:08:58', '2023-08-09 02:18:01'),
(54, 'customer', 'Ram Test11', '232323', 'ramtest34341@gmail.com', '987654321', NULL, NULL, NULL, '$2y$10$v8NIcdU.2FaoChz..QbA8.IJKmyvwW6PXsB9aisqVzeBqA/kabPlW', NULL, '1', '2023-08-23 02:47:28', '2023-08-23 04:51:59'),
(55, 'customer', 'Zardari khan', '123456', 'zardai@gmail.com', '923329634789', NULL, NULL, NULL, '$2y$10$iZsOUbtx8Alu0LSwHVEPAOSgsfdKLossTqfJTjfPdSAcnGJ/vbXgq', NULL, '1', '2023-08-23 04:11:44', '2023-08-23 04:17:22'),
(56, 'customer', 'suibhai', '123345', 'suibhai@gmail.com', '923329634789', NULL, NULL, NULL, '$2y$10$QoVFHKuS0NpqhJ8JPx2hNe5m8rQ/Xhmzdd4OipiL4Bbz8G1aynK/K', NULL, '1', '2023-08-23 04:17:13', '2023-08-23 04:23:00'),
(57, 'customer', 'zardari', '123456', 'zardariking@gmail.com', '923329634789', NULL, NULL, NULL, '$2y$10$tjJI1vy0oudfnOhtAZ1pvuX6oVBAMjG1D.EkNz3q016mZslLG/siK', NULL, '1', '2023-08-23 04:22:52', '2023-08-23 04:27:26'),
(58, 'customer', 'zardri', '123456', 'zardarking@gmail.com', '923329634789', NULL, NULL, NULL, '$2y$10$87x3GW7l9c.8InvjdJoEGuwFWEZlnLFxWw6wun.xZVJJxIpVh7nAu', NULL, '1', '2023-08-23 04:27:19', '2023-08-23 04:32:23'),
(59, 'customer', 'superman', '123456', 'superman@gmail.com', '923329634789', NULL, NULL, NULL, '$2y$10$xAfTRN/u4B1Scd2uxH38qOrZM.2Eu2Q4uMQBcRYp6k6FeIqyicMMG', NULL, '1', '2023-08-23 04:32:16', '2023-08-23 04:46:40'),
(60, 'customer', 'chak khan', '123456', 'chako@gmail.com', '923329634789', 1234, NULL, NULL, '$2y$10$L8TZkJaO7XZvrEyfotroBemHv0BRFEeJi/lVqt5AUIAMpdNwAbxCG', NULL, '0', '2023-08-23 04:46:26', '2023-08-23 04:46:26'),
(61, 'customer', 'gulkhan', '232323', 'gulkha@gmail.com', '987654321', NULL, NULL, NULL, '$2y$10$HCCPWAIj8qAgaaAYkUHI.O8QJNqf2uO5BcUFJ6zkJ348/I0Sql/Ne', NULL, '1', '2023-08-23 04:50:51', '2023-08-23 04:52:50'),
(62, 'customer', 'sainkhan', '123456', 'sainkhan@gmail.com', '923329644789', NULL, NULL, NULL, '$2y$10$43Xlun9MqZ3/Hfo7ic5nou/L3Lu0G1h2ZJ0Ucnw9i58xe.fKtD.S6', NULL, '1', '2023-08-23 04:55:35', '2023-08-23 04:56:20'),
(63, 'customer', 'abc Xyz', '323232', 'xyz1234@gmail.com', '9185256352', 1234, NULL, NULL, '$2y$10$sF8ouXwFFuWVMw7iuX6vE.71JhNIF2y4GzVwNxNXOYuJ8LwmqML6G', NULL, '0', '2023-08-26 05:41:06', '2023-08-26 05:41:06'),
(64, 'customer', 'xyz Abc', '323232', 'xyz12334@gmail.com', '9185265825', 1234, NULL, NULL, '$2y$10$gfrUYVTDk9uKs/vc7F616.Sy/g4mkRmc8fGOm8iB0OnmzsNDIxqku', NULL, '0', '2023-08-26 05:43:35', '2023-08-26 05:43:35'),
(65, 'customer', 'abc', '3232', 'xyz1233456@gmail.com', '91852563552', NULL, NULL, NULL, '$2y$10$gsEtiPOoKinYmP3aqpL8tuNWFep0ewigvfpy/Oeg13OkfOyba1Z5K', NULL, '1', '2023-08-26 05:46:19', '2023-08-26 05:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `users_academic`
--

CREATE TABLE `users_academic` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `ans` text DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_academic`
--

INSERT INTO `users_academic` (`id`, `user_id`, `mood_id`, `sub_mood_id`, `title`, `question_id`, `ans`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 2, 'test', 1, 'Raj', '0', '2023-07-16 01:59:06', '2023-07-16 07:29:06'),
(2, 5, 1, 2, 'test', 1, 'Raj', '0', '2023-07-19 05:27:32', '2023-07-19 10:57:32'),
(3, 5, 1, 2, 'test', 1, 'hello', '0', '2023-07-20 02:37:25', '2023-07-20 08:07:25'),
(4, 5, 1, 2, 'test', 1, 'Raj', '0', '2023-08-02 05:46:25', '2023-08-02 11:16:25'),
(5, 5, 1, 2, 'test', 1, 'Raj2', '0', '2023-08-02 05:59:32', '2023-08-02 11:29:32'),
(6, 5, 1, 2, 'test', 2, 'Raj3', '0', '2023-08-02 05:59:32', '2023-08-02 11:29:32'),
(7, 5, 1, 2, 'test', 1, 'Raj', '0', '2023-08-03 04:39:37', '2023-08-03 10:09:37'),
(8, 5, 1, 2, 'test', 2, 'Raj2', '0', '2023-08-03 04:39:37', '2023-08-03 10:09:37'),
(9, 5, 1, 2, 'test', 1, 'Raj788', '0', '2023-08-03 04:39:38', '2023-08-03 10:09:38'),
(10, 5, 1, 2, 'test', 1, 'whats is your name,what are you', '0', '2023-08-03 05:12:22', '2023-08-03 10:42:22'),
(11, 5, 1, 2, 'test', 1, 'whats is your name,what are you', '0', '2023-08-03 06:21:52', '2023-08-03 11:51:52'),
(12, 5, 1, 2, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:22:00', '2023-08-03 11:52:00'),
(13, 5, 1, 2, 'test', 3, 'whats is your name,what are you', '0', '2023-08-03 06:22:10', '2023-08-03 11:52:10'),
(14, 5, 1, 2, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:24:10', '2023-08-03 11:54:10'),
(15, 5, 1, 2, 'test', 1, 'Raj', '0', '2023-08-03 06:24:19', '2023-08-03 11:54:19'),
(16, 5, 1, 2, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:24:41', '2023-08-03 11:54:41'),
(17, 5, 1, 2, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:26:21', '2023-08-03 11:56:21'),
(18, 27, 4, 28, 'king speech', 2, 'whats is your name,what are you', '0', '2023-08-03 06:35:24', '2023-08-03 12:05:24'),
(19, 5, 1, 2, 'test', 1, 'Raj', '0', '2023-08-03 07:20:08', '2023-08-03 12:50:08'),
(20, 5, 1, 2, 'test', 2, 'Raj2', '0', '2023-08-03 07:20:08', '2023-08-03 12:50:08'),
(21, 27, 4, 28, 'king speech', 2, 'whats is your name,what are you', '0', '2023-08-03 07:49:43', '2023-08-03 13:19:43'),
(22, 27, 4, 28, 'king speech', 2, '[whats is your name,what are you]', '0', '2023-08-03 07:49:59', '2023-08-03 13:19:59'),
(23, 27, 4, 28, 'jjaj', 2, 'hahah', '0', '2023-08-03 08:00:55', '2023-08-03 13:30:55'),
(24, 27, 4, 28, 'kings speech', 2, 'i am king', '0', '2023-08-03 08:03:08', '2023-08-03 13:33:08'),
(25, 27, 4, 28, 'kings speech', 2, 'i am king', '0', '2023-08-03 08:03:13', '2023-08-03 13:33:13'),
(26, 27, 4, 28, 'kings speech', 2, 'how are you?', '0', '2023-08-03 08:07:07', '2023-08-03 13:37:07'),
(27, 27, 4, 28, 'kings speech', 2, 'how are you?whats your progress?', '0', '2023-08-03 08:08:08', '2023-08-03 13:38:08'),
(28, 27, 4, 28, 'kings speech', 2, 'how are you?', '0', '2023-08-03 08:10:02', '2023-08-03 13:40:02'),
(29, 27, 4, 28, 'kings speech', 1, 'how are you?', '0', '2023-08-03 08:11:30', '2023-08-03 13:41:30'),
(30, 27, 4, 28, 'kings speech', 2, 'whats your progress?', '0', '2023-08-03 08:11:30', '2023-08-03 13:41:30'),
(31, 27, 4, 28, 'kings speech', 2, 'whats your progress?', '0', '2023-08-03 08:28:51', '2023-08-03 13:58:51'),
(32, 27, 4, 28, 'kings speech', 2, 'how are you?', '0', '2023-08-03 08:29:36', '2023-08-03 13:59:36'),
(33, 5, 1, 2, 'test', 1, 'Raj77', '0', '2023-08-04 23:43:37', '2023-08-05 05:13:37'),
(34, 5, 1, 2, 'test', 2, 'Raj77334', '0', '2023-08-04 23:43:37', '2023-08-05 05:13:37'),
(35, 27, 4, 28, 'king speech', 1, 'whats is your name,what are you', '0', '2023-08-05 22:59:17', '2023-08-06 04:29:17'),
(36, 27, 4, 28, 'king speech', 2, 'fine i am', '0', '2023-08-05 22:59:17', '2023-08-06 04:29:17'),
(37, 27, 4, 28, 'My sad life', 2, 'scammer are everywhere', '0', '2023-08-05 23:19:20', '2023-08-06 04:49:20'),
(38, 27, 4, 28, 'Hahah', 2, 'Haahaj', '0', '2023-08-06 00:26:48', '2023-08-06 05:56:48'),
(39, 27, 4, 28, 'title', 2, 'question1', '0', '2023-08-06 00:58:51', '2023-08-06 06:28:51'),
(40, 27, 4, 28, 'Academic 01', 2, 'hello', '0', '2023-08-06 01:00:22', '2023-08-06 06:30:22'),
(41, 27, 4, 28, 'Academic 01', 2, 'hello', '0', '2023-08-06 01:04:18', '2023-08-06 06:34:18'),
(42, 27, 4, 28, 'Academic 01', 2, 'hello', '0', '2023-08-06 01:08:32', '2023-08-06 06:38:32'),
(43, 27, 4, 28, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:08:57', '2023-08-06 06:38:57'),
(44, 27, 4, 28, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:13:20', '2023-08-06 06:43:20'),
(45, 27, 4, 28, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:14:17', '2023-08-06 06:44:17'),
(46, 27, 4, 28, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:15:09', '2023-08-06 06:45:09'),
(47, 27, 4, 28, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:18:22', '2023-08-06 06:48:22'),
(48, 27, 4, 28, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:21:18', '2023-08-06 06:51:18'),
(49, 27, 4, 28, 'saf', 2, 'dsdssd', '0', '2023-08-06 01:22:06', '2023-08-06 06:52:06'),
(50, 27, 4, 28, 'saf', 2, 'dsdssd', '0', '2023-08-06 01:22:57', '2023-08-06 06:52:57'),
(51, 27, 4, 28, 'saf', 2, 'dsdssd', '0', '2023-08-06 01:24:25', '2023-08-06 06:54:25'),
(52, 27, 4, 28, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:24:57', '2023-08-06 06:54:57'),
(53, 27, 4, 28, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:27:37', '2023-08-06 06:57:37'),
(54, 27, 4, 28, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:28:27', '2023-08-06 06:58:27'),
(55, 27, 4, 28, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:31:29', '2023-08-06 07:01:29'),
(56, 27, 4, 28, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:34:11', '2023-08-06 07:04:11'),
(57, 27, 4, 28, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:37:01', '2023-08-06 07:07:01'),
(58, 27, 4, 28, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:41:56', '2023-08-06 07:11:56'),
(59, 27, 4, 28, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:52:51', '2023-08-06 07:22:51'),
(60, 27, 4, 28, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:54:29', '2023-08-06 07:24:29'),
(61, 27, 4, 28, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:57:08', '2023-08-06 07:27:08'),
(62, 27, 4, 28, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:58:50', '2023-08-06 07:28:50'),
(63, 27, 4, 28, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:59:49', '2023-08-06 07:29:49'),
(64, 27, 4, 28, 'hahaha', 2, 'hahaha', '0', '2023-08-06 02:05:36', '2023-08-06 07:35:36'),
(65, 27, 4, 28, 'hahaha', 2, 'hahaha', '0', '2023-08-06 02:08:46', '2023-08-06 07:38:46'),
(66, 27, 4, 28, 'huihukhhl', 2, 'hbhjgj', '0', '2023-08-06 02:09:16', '2023-08-06 07:39:16'),
(67, 27, 4, 28, 'huihukhhl', 2, 'hbhjgj', '0', '2023-08-06 02:13:55', '2023-08-06 07:43:55'),
(68, 27, 4, 28, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:19:00', '2023-08-06 07:49:00'),
(69, 27, 4, 28, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:21:23', '2023-08-06 07:51:23'),
(70, 27, 4, 28, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:23:21', '2023-08-06 07:53:21'),
(71, 27, 4, 28, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:23:28', '2023-08-06 07:53:28'),
(72, 27, 4, 28, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:23:43', '2023-08-06 07:53:43'),
(73, 27, 4, 28, 'Education', 2, 'Education is key', '0', '2023-08-07 04:39:19', '2023-08-07 10:09:19'),
(74, 27, 4, 28, 'Education', 2, 'Education is key', '0', '2023-08-07 04:39:32', '2023-08-07 10:09:32'),
(75, 27, 4, 28, 'Education', 2, 'Education is key', '0', '2023-08-07 04:40:46', '2023-08-07 10:10:46'),
(76, 27, 4, 28, 'king', 2, 'Hahaha', '0', '2023-08-07 04:44:19', '2023-08-07 10:14:19'),
(77, 27, 4, 28, 'king', 2, 'Hahaha', '0', '2023-08-07 04:44:52', '2023-08-07 10:14:52'),
(78, 27, 4, 28, 'king', 2, 'Hahaha', '0', '2023-08-07 04:46:25', '2023-08-07 10:16:25'),
(79, 27, 4, 28, 'ahhaa', 2, 'ahhaha', '0', '2023-08-07 04:47:02', '2023-08-07 10:17:02'),
(80, 27, 4, 28, 'hahah', 2, 'hahaha', '0', '2023-08-07 04:49:20', '2023-08-07 10:19:20'),
(81, 27, 4, 28, 'hahah', 2, 'hahaha', '0', '2023-08-07 04:53:09', '2023-08-07 10:23:09'),
(82, 27, 4, 28, 'hhaha', 2, 'ahahhaa', '0', '2023-08-07 04:53:38', '2023-08-07 10:23:38'),
(83, 27, 4, 28, 'hhaha', 2, 'ahahhaa', '0', '2023-08-07 04:54:29', '2023-08-07 10:24:29'),
(84, 27, 4, 28, 'Education', 2, 'shehabaz sherif', '0', '2023-08-07 08:37:11', '2023-08-07 14:07:11'),
(85, 27, 4, 28, 'Education', 2, 'shehabaz sherif', '0', '2023-08-07 08:40:54', '2023-08-07 14:10:54'),
(86, 27, 4, 28, 'Education', 2, 'shehabaz sherif', '0', '2023-08-07 08:42:39', '2023-08-07 14:12:39'),
(87, 27, 4, 28, 'Haha', 2, 'Hahaking', '0', '2023-08-07 09:07:14', '2023-08-07 14:37:14'),
(88, 51, 4, 32, 'Hhhh', 2, 'Fyuugtc Hh', '0', '2023-08-07 21:45:43', '2023-08-08 03:15:43'),
(89, 27, 4, 28, 'Education', 2, 'Education', '0', '2023-08-08 04:28:04', '2023-08-08 09:58:04'),
(90, 27, 4, 28, 'King', 2, 'Hahahq', '0', '2023-08-08 04:28:55', '2023-08-08 09:58:55'),
(91, 52, 4, 29, 'Education', 2, 'Hahahlag King', '0', '2023-08-08 05:20:46', '2023-08-08 10:50:46'),
(92, 52, 4, 28, 'haha', 2, 'hahahhahaha', '0', '2023-08-08 23:06:52', '2023-08-09 04:36:52'),
(93, 52, 4, 28, 'ahahhaahhaah', 2, 'ahhaha', '0', '2023-08-08 23:11:26', '2023-08-09 04:41:26'),
(94, 52, 4, 28, 'hahah', 2, 'hahaha', '0', '2023-08-08 23:29:03', '2023-08-09 04:59:03'),
(95, 52, 4, 28, 'ahha', 2, 'ahhaahhaa', '0', '2023-08-08 23:29:35', '2023-08-09 04:59:35'),
(96, 52, 4, 28, 'ahhah', 2, 'hahahaha', '0', '2023-08-08 23:41:16', '2023-08-09 05:11:16'),
(97, 52, 4, 28, 'hahaha', 2, 'hahhaahha', '0', '2023-08-08 23:42:20', '2023-08-09 05:12:20'),
(98, 52, 4, 28, 'ahha', 2, 'ahhahahahahha', '0', '2023-08-08 23:45:42', '2023-08-09 05:15:42'),
(99, 52, 4, 28, 'hahah', 2, 'hahhahha', '0', '2023-08-08 23:46:13', '2023-08-09 05:16:13'),
(100, 52, 4, 28, 'hahha', 2, 'hahaha', '0', '2023-08-08 23:49:22', '2023-08-09 05:19:22'),
(101, 52, 4, 28, 'ahahah', 2, 'hahahahhah', '0', '2023-08-08 23:53:22', '2023-08-09 05:23:22'),
(102, 52, 4, 28, 'hhahaha', 2, 'ahhaha', '0', '2023-08-08 23:54:00', '2023-08-09 05:24:00'),
(103, 52, 4, 28, 'agaggagag', 2, 'hahaha', '0', '2023-08-08 23:54:59', '2023-08-09 05:24:59'),
(104, 52, 4, 28, 'ahhaha', 2, 'ahahah', '0', '2023-08-08 23:55:54', '2023-08-09 05:25:54'),
(105, 52, 4, 28, 'ahha', 2, 'hahhhaha', '0', '2023-08-08 23:56:59', '2023-08-09 05:26:59'),
(106, 52, 4, 28, 'haha', 2, 'hahahha', '0', '2023-08-08 23:57:41', '2023-08-09 05:27:41'),
(107, 52, 4, 28, 'hahha', 2, 'ahhaahaha', '0', '2023-08-09 00:03:00', '2023-08-09 05:33:00'),
(108, 52, 4, 28, 'hhaha', 2, 'ahhaha', '0', '2023-08-09 00:11:25', '2023-08-09 05:41:25'),
(109, 52, 4, 28, 'ahha', 2, 'ahhaha', '0', '2023-08-09 00:23:14', '2023-08-09 05:53:14'),
(110, 52, 4, 28, 'ahhah', 2, 'ahahhaahaha', '0', '2023-08-09 00:23:58', '2023-08-09 05:53:58'),
(111, 52, 4, 28, 'ahhaha', 2, 'ahhaha', '0', '2023-08-09 00:24:21', '2023-08-09 05:54:21'),
(112, 52, 4, 28, 'ahhaha', 2, 'ahhaha', '0', '2023-08-09 00:24:23', '2023-08-09 05:54:23'),
(113, 52, 4, 28, 'ahaha', 2, 'ahhahaha', '0', '2023-08-09 00:27:09', '2023-08-09 05:57:09'),
(114, 52, 4, 28, 'ahhaha', 2, 'ahhaha', '0', '2023-08-09 00:28:41', '2023-08-09 05:58:41'),
(115, 52, 4, 28, 'hahaha', 2, 'hahhaha', '0', '2023-08-09 00:29:05', '2023-08-09 05:59:05'),
(116, 52, 4, 28, 'haah', 2, 'ahahhaha', '0', '2023-08-09 00:32:25', '2023-08-09 06:02:25'),
(117, 52, 4, 28, 'hahha', 2, 'ahahha', '0', '2023-08-09 00:32:44', '2023-08-09 06:02:44'),
(118, 27, 4, 28, 'ahhah', 2, 'ahhaha', '0', '2023-08-09 01:00:23', '2023-08-09 06:30:23'),
(119, 27, 4, 28, 'Hhaahha', 2, 'Hahahahahaj', '0', '2023-08-09 01:08:32', '2023-08-09 06:38:32'),
(120, 27, 4, 28, 'Hahaha', 2, 'Hahahahha', '0', '2023-08-09 01:08:46', '2023-08-09 06:38:46'),
(121, 27, 4, 28, 'Hahahha', 2, 'Hahajajaj', '0', '2023-08-09 01:09:46', '2023-08-09 06:39:46'),
(122, 27, 4, 28, 'Jajaa', 2, 'Ahajajja', '0', '2023-08-09 01:10:06', '2023-08-09 06:40:06'),
(123, 27, 4, 28, 'Hhaa', 2, 'Hahajja', '0', '2023-08-09 01:10:20', '2023-08-09 06:40:20'),
(124, 27, 4, 28, 'Bahaha', 2, 'Nahahajaj', '0', '2023-08-09 01:10:30', '2023-08-09 06:40:30'),
(125, 27, 4, 28, 'Jajaja', 2, 'Hajaj', '0', '2023-08-09 01:10:42', '2023-08-09 06:40:42'),
(126, 27, 4, 28, 'Hahaja', 2, 'Hajajaj', '0', '2023-08-09 01:10:56', '2023-08-09 06:40:56'),
(127, 27, 4, 28, 'Hahaha', 2, 'Ahahajaj', '0', '2023-08-09 01:11:09', '2023-08-09 06:41:09'),
(128, 27, 4, 28, 'Bajaja', 2, 'Ajjajqjq', '0', '2023-08-09 01:12:26', '2023-08-09 06:42:26'),
(129, 27, 4, 28, 'Bahaj', 2, 'Quqjjwwjwj', '0', '2023-08-09 01:12:38', '2023-08-09 06:42:38'),
(130, 53, 4, 35, 'Gffg', 2, 'Gnhggju', '0', '2023-08-09 02:15:35', '2023-08-09 07:45:35'),
(131, 53, 4, 35, 'Dfcf', 2, 'Cvvb', '0', '2023-08-09 02:20:17', '2023-08-09 07:50:17'),
(132, 27, 4, 28, 'ahhaha', 2, 'ahhahaha', '0', '2023-08-09 03:21:59', '2023-08-09 08:51:59'),
(133, 27, 4, 28, 'ahaha', 2, 'yes', '0', '2023-08-09 04:54:37', '2023-08-09 10:24:37'),
(134, 27, 4, 28, 'Hjahah', 2, 'Hahlahahaha', '0', '2023-08-09 06:37:15', '2023-08-09 12:07:15'),
(135, 27, 4, 28, 'Hahahajahajahj', 2, 'Nahlajsjj', '0', '2023-08-09 06:37:31', '2023-08-09 12:07:31'),
(136, 53, 4, 36, 'Ghhg', 2, 'Fvgg', '0', '2023-08-09 06:59:50', '2023-08-09 12:29:50'),
(137, 53, 4, 36, 'Ggg', 2, 'Ghhg', '0', '2023-08-09 07:00:28', '2023-08-09 12:30:28'),
(138, 53, 4, 28, 'Dcff', 2, 'Fghhh', '0', '2023-08-22 01:22:09', '2023-08-22 06:52:09'),
(139, 53, 4, 28, 'Shhss', 2, 'Shhss', '0', '2023-08-22 02:16:13', '2023-08-22 07:46:13'),
(140, 5, 1, 2, 'test', 1, 'Raj77', '0', '2023-08-25 08:31:12', '2023-08-25 14:01:12'),
(141, 5, 1, 2, 'test', 2, 'Raj77334', '0', '2023-08-25 08:31:12', '2023-08-25 14:01:12'),
(142, 65, 6, 57, 'Hhhyt', 2, 'Hhhgt', '0', '2023-08-26 06:02:58', '2023-08-26 11:32:58'),
(143, 65, 6, 57, 'Huyhggr', 2, 'Bhhtbj Jyf', '0', '2023-08-26 06:03:52', '2023-08-26 11:33:52'),
(144, 65, 6, 57, 'Hhh', 2, 'Hutt Jhhg', '0', '2023-08-26 06:06:40', '2023-08-26 11:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `users_audio`
--

CREATE TABLE `users_audio` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_id` int(11) DEFAULT NULL,
  `audio_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_audio`
--

INSERT INTO `users_audio` (`id`, `user_id`, `mood_id`, `sub_mood_id`, `audio_id`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 3, 1, '2023-08-26 03:39:49', '2023-08-26 09:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `users_breathin`
--

CREATE TABLE `users_breathin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_id` int(11) DEFAULT NULL,
  `set_time` varchar(100) DEFAULT NULL,
  `end_time` varchar(100) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_breathin`
--

INSERT INTO `users_breathin` (`id`, `user_id`, `mood_id`, `sub_mood_id`, `set_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 2, '12:10', '12:60', '0', '2023-07-13 05:03:41', '2023-07-13 10:33:41'),
(2, 5, 1, 2, '12:10', '12:60', '0', '2023-07-16 01:52:07', '2023-07-16 07:22:07'),
(3, 5, 1, 2, '12:10', '12:60', '0', '2023-07-19 05:28:07', '2023-07-19 10:58:07'),
(4, 5, 1, 2, '12:10', '12:60', '0', '2023-07-24 08:03:23', '2023-07-24 13:33:23'),
(5, 5, 1, 2, '12:10', '12:60', '0', '2023-08-01 23:34:53', '2023-08-02 05:04:53'),
(6, 27, 4, 28, 'TimeOfDay(17:35)', 'TimeOfDay(22:15)', '0', '2023-08-07 08:43:21', '2023-08-07 14:13:21'),
(7, 27, 4, 28, 'TimeOfDay(19:15)', 'TimeOfDay(22:15)', '0', '2023-08-07 08:45:52', '2023-08-07 14:15:52'),
(8, 27, 4, 28, 'TimeOfDay(19:15)', 'TimeOfDay(22:15)', '0', '2023-08-07 08:47:36', '2023-08-07 14:17:36'),
(9, 27, 4, 28, 'TimeOfDay(19:20)', 'TimeOfDay(22:20)', '0', '2023-08-07 08:48:21', '2023-08-07 14:18:21'),
(10, 27, 4, 28, 'TimeOfDay(15:05)', 'TimeOfDay(22:20)', '0', '2023-08-07 08:50:19', '2023-08-07 14:20:19'),
(11, 27, 4, 28, 'TimeOfDay(15:50)', 'TimeOfDay(22:35)', '0', '2023-08-07 09:07:20', '2023-08-07 14:37:20'),
(12, 51, 4, 32, 'TimeOfDay(08:15)', 'TimeOfDay(21:20)', '0', '2023-08-07 21:45:58', '2023-08-08 03:15:58'),
(13, 27, 4, 28, 'TimeOfDay(15:00)', 'TimeOfDay(01:25)', '0', '2023-08-08 04:28:09', '2023-08-08 09:58:09'),
(14, 27, 4, 28, 'TimeOfDay(15:00)', 'TimeOfDay(23:15)', '0', '2023-08-08 04:28:59', '2023-08-08 09:58:59'),
(15, 52, 4, 29, 'TimeOfDay(15:50)', 'TimeOfDay(06:50)', '0', '2023-08-08 05:20:51', '2023-08-08 10:50:51'),
(16, 53, 4, 35, 'TimeOfDay(07:10)', 'TimeOfDay(20:40)', '0', '2023-08-09 02:17:36', '2023-08-09 07:47:36'),
(17, 27, 4, 28, '14:09', '14:10', '0', '2023-08-09 03:39:55', '2023-08-09 09:09:55'),
(18, 27, 4, 28, '14:11', '14:12', '0', '2023-08-09 03:41:46', '2023-08-09 09:11:46'),
(19, 27, 4, 28, '14:12', '14:13', '0', '2023-08-09 03:42:30', '2023-08-09 09:12:30'),
(20, 27, 4, 28, '14:13', '14:14', '0', '2023-08-09 03:43:33', '2023-08-09 09:13:33'),
(21, 27, 4, 28, '14:14', '14:15', '0', '2023-08-09 03:44:37', '2023-08-09 09:14:37'),
(22, 27, 4, 28, '14:18', '14:28', '0', '2023-08-09 03:48:29', '2023-08-09 09:18:29'),
(23, 27, 4, 28, '14:20', '14:30', '0', '2023-08-09 03:50:09', '2023-08-09 09:20:09'),
(24, 27, 4, 28, '14:20', '14:25', '0', '2023-08-09 03:50:26', '2023-08-09 09:20:26'),
(25, 27, 4, 28, '14:20', '14:34', '0', '2023-08-09 03:50:40', '2023-08-09 09:20:40'),
(26, 27, 4, 28, '15:03', '15:05', '0', '2023-08-09 04:33:35', '2023-08-09 10:03:35'),
(27, 27, 4, 28, '15:05', '15:30', '0', '2023-08-09 04:35:10', '2023-08-09 10:05:10'),
(28, 27, 4, 28, '15:05', '15:06', '0', '2023-08-09 04:35:29', '2023-08-09 10:05:29'),
(29, 27, 4, 28, '15:05', '15:08', '0', '2023-08-09 04:35:57', '2023-08-09 10:05:57'),
(30, 27, 4, 28, '15:07', '15:08', '0', '2023-08-09 04:37:13', '2023-08-09 10:07:13'),
(31, 27, 4, 28, '15:07', '15:10', '0', '2023-08-09 04:37:24', '2023-08-09 10:07:24'),
(32, 27, 4, 28, '15:11', '15:14', '0', '2023-08-09 04:41:27', '2023-08-09 10:11:27'),
(33, 27, 4, 28, '15:24', '15:25', '0', '2023-08-09 04:55:18', '2023-08-09 10:25:18'),
(34, 27, 4, 28, '16:05', '2:30', '0', '2023-08-09 05:35:25', '2023-08-09 11:05:25'),
(35, 27, 4, 28, '16:13', '21:20', '0', '2023-08-09 05:43:16', '2023-08-09 11:13:16'),
(36, 27, 4, 28, '16:14', '17:08', '0', '2023-08-09 05:44:54', '2023-08-09 11:14:54'),
(37, 27, 4, 28, '16:24', '16:42', '0', '2023-08-09 05:54:18', '2023-08-09 11:24:18'),
(38, 27, 4, 28, '16:26', '16:28', '0', '2023-08-09 05:56:37', '2023-08-09 11:26:37'),
(39, 27, 4, 28, '16:27', '16:57', '0', '2023-08-09 05:57:11', '2023-08-09 11:27:11'),
(40, 27, 4, 28, '16:28', '17:04', '0', '2023-08-09 05:58:30', '2023-08-09 11:28:30'),
(41, 27, 4, 28, '16:30', '16:30', '0', '2023-08-09 06:00:15', '2023-08-09 11:30:15'),
(42, 27, 4, 28, '16:30', '16:31', '0', '2023-08-09 06:00:52', '2023-08-09 11:30:52'),
(43, 27, 4, 28, '16:31', '16:34', '0', '2023-08-09 06:01:24', '2023-08-09 11:31:24'),
(44, 27, 4, 28, '16:32', '16:33', '0', '2023-08-09 06:02:20', '2023-08-09 11:32:20'),
(45, 27, 4, 28, '16:34', '16:35', '0', '2023-08-09 06:04:47', '2023-08-09 11:34:47'),
(46, 27, 4, 28, '16:35', '16:36', '0', '2023-08-09 06:05:27', '2023-08-09 11:35:27'),
(47, 27, 4, 28, '16:41', '16:42', '0', '2023-08-09 06:11:43', '2023-08-09 11:41:43'),
(48, 27, 4, 28, '16:41', '16:43', '0', '2023-08-09 06:12:00', '2023-08-09 11:42:00'),
(49, 27, 4, 28, '16:42', '16:42', '0', '2023-08-09 06:12:23', '2023-08-09 11:42:23'),
(50, 27, 4, 28, '16:43', '16:44', '0', '2023-08-09 06:13:30', '2023-08-09 11:43:30'),
(51, 27, 4, 28, '16:44', '16:45', '0', '2023-08-09 06:14:42', '2023-08-09 11:44:42'),
(52, 27, 4, 28, '16:45', '16:46', '0', '2023-08-09 06:15:42', '2023-08-09 11:45:42'),
(53, 27, 4, 28, '16:45', '16:47', '0', '2023-08-09 06:15:51', '2023-08-09 11:45:51'),
(54, 27, 4, 28, '16:49', '16:50', '0', '2023-08-09 06:19:49', '2023-08-09 11:49:49'),
(55, 27, 4, 28, '16:53', '16:54', '0', '2023-08-09 06:23:07', '2023-08-09 11:53:07'),
(56, 27, 4, 28, '16:54', '16:55', '0', '2023-08-09 06:24:04', '2023-08-09 11:54:04'),
(57, 27, 4, 28, '16:55', '16:56', '0', '2023-08-09 06:25:26', '2023-08-09 11:55:26'),
(58, 27, 4, 28, '16:56', '16:57', '0', '2023-08-09 06:26:50', '2023-08-09 11:56:50'),
(59, 27, 4, 28, '16:57', '16:58', '0', '2023-08-09 06:27:55', '2023-08-09 11:57:55'),
(60, 27, 4, 28, '16:59', '17:00', '0', '2023-08-09 06:29:55', '2023-08-09 11:59:55'),
(61, 27, 4, 28, '17:06', '17:07', '0', '2023-08-09 06:36:38', '2023-08-09 12:06:38'),
(62, 53, 4, 36, '17:29', '17:30', '0', '2023-08-09 06:59:59', '2023-08-09 12:29:59'),
(63, 53, 4, 36, '17:30', '17:31', '0', '2023-08-09 07:00:49', '2023-08-09 12:30:49'),
(64, 53, 4, 28, '11:52', '11:53', '0', '2023-08-22 01:22:19', '2023-08-22 06:52:19'),
(65, 53, 4, 32, '09:10', '09:11', '0', '2023-08-25 22:40:46', '2023-08-26 04:10:46'),
(66, 65, 6, 57, '16:33', '16:34', '0', '2023-08-26 06:03:11', '2023-08-26 11:33:11'),
(67, 65, 6, 57, '16:33', '16:34', '0', '2023-08-26 06:03:57', '2023-08-26 11:33:57'),
(68, 65, 6, 57, '16:36', '16:37', '0', '2023-08-26 06:06:48', '2023-08-26 11:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `users_journal_question`
--

CREATE TABLE `users_journal_question` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `ans` text DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_journal_question`
--

INSERT INTO `users_journal_question` (`id`, `user_id`, `journal_id`, `title`, `question_id`, `ans`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'test', 1, 'Raj', '0', '2023-07-16 01:59:06', '2023-07-16 07:29:06'),
(2, 5, 1, 'test', 1, 'Raj', '0', '2023-07-19 05:27:32', '2023-07-19 10:57:32'),
(3, 5, 1, 'test', 1, 'hello', '0', '2023-07-20 02:37:25', '2023-07-20 08:07:25'),
(4, 5, 1, 'test', 1, 'Raj', '0', '2023-08-02 05:46:25', '2023-08-02 11:16:25'),
(5, 5, 1, 'test', 1, 'Raj2', '0', '2023-08-02 05:59:32', '2023-08-02 11:29:32'),
(6, 5, 1, 'test', 2, 'Raj3', '0', '2023-08-02 05:59:32', '2023-08-02 11:29:32'),
(7, 5, 1, 'test', 1, 'Raj', '0', '2023-08-03 04:39:37', '2023-08-03 10:09:37'),
(8, 5, 1, 'test', 2, 'Raj2', '0', '2023-08-03 04:39:37', '2023-08-03 10:09:37'),
(9, 5, 1, 'test', 1, 'Raj788', '0', '2023-08-03 04:39:38', '2023-08-03 10:09:38'),
(10, 5, 1, 'test', 1, 'whats is your name,what are you', '0', '2023-08-03 05:12:22', '2023-08-03 10:42:22'),
(11, 5, 1, 'test', 1, 'whats is your name,what are you', '0', '2023-08-03 06:21:52', '2023-08-03 11:51:52'),
(12, 5, 1, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:22:00', '2023-08-03 11:52:00'),
(13, 5, 1, 'test', 3, 'whats is your name,what are you', '0', '2023-08-03 06:22:10', '2023-08-03 11:52:10'),
(14, 5, 1, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:24:10', '2023-08-03 11:54:10'),
(15, 5, 1, 'test', 1, 'Raj', '0', '2023-08-03 06:24:19', '2023-08-03 11:54:19'),
(16, 5, 1, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:24:41', '2023-08-03 11:54:41'),
(17, 5, 1, 'test', 2, 'whats is your name,what are you', '0', '2023-08-03 06:26:21', '2023-08-03 11:56:21'),
(18, 27, 4, 'king speech', 2, 'whats is your name,what are you', '0', '2023-08-03 06:35:24', '2023-08-03 12:05:24'),
(19, 5, 1, 'test', 1, 'Raj', '0', '2023-08-03 07:20:08', '2023-08-03 12:50:08'),
(20, 5, 1, 'test', 2, 'Raj2', '0', '2023-08-03 07:20:08', '2023-08-03 12:50:08'),
(21, 27, 4, 'king speech', 2, 'whats is your name,what are you', '0', '2023-08-03 07:49:43', '2023-08-03 13:19:43'),
(22, 27, 4, 'king speech', 2, '[whats is your name,what are you]', '0', '2023-08-03 07:49:59', '2023-08-03 13:19:59'),
(23, 27, 4, 'jjaj', 2, 'hahah', '0', '2023-08-03 08:00:55', '2023-08-03 13:30:55'),
(24, 27, 4, 'kings speech', 2, 'i am king', '0', '2023-08-03 08:03:08', '2023-08-03 13:33:08'),
(25, 27, 4, 'kings speech', 2, 'i am king', '0', '2023-08-03 08:03:13', '2023-08-03 13:33:13'),
(26, 27, 4, 'kings speech', 2, 'how are you?', '0', '2023-08-03 08:07:07', '2023-08-03 13:37:07'),
(27, 27, 4, 'kings speech', 2, 'how are you?whats your progress?', '0', '2023-08-03 08:08:08', '2023-08-03 13:38:08'),
(28, 27, 4, 'kings speech', 2, 'how are you?', '0', '2023-08-03 08:10:02', '2023-08-03 13:40:02'),
(29, 27, 4, 'kings speech', 1, 'how are you?', '0', '2023-08-03 08:11:30', '2023-08-03 13:41:30'),
(30, 27, 4, 'kings speech', 2, 'whats your progress?', '0', '2023-08-03 08:11:30', '2023-08-03 13:41:30'),
(31, 27, 4, 'kings speech', 2, 'whats your progress?', '0', '2023-08-03 08:28:51', '2023-08-03 13:58:51'),
(32, 27, 4, 'kings speech', 2, 'how are you?', '0', '2023-08-03 08:29:36', '2023-08-03 13:59:36'),
(33, 5, 1, 'test', 1, 'Raj77', '0', '2023-08-04 23:43:37', '2023-08-05 05:13:37'),
(34, 5, 1, 'test', 2, 'Raj77334', '0', '2023-08-04 23:43:37', '2023-08-05 05:13:37'),
(35, 27, 4, 'king speech', 1, 'whats is your name,what are you', '0', '2023-08-05 22:59:17', '2023-08-06 04:29:17'),
(36, 27, 4, 'king speech', 2, 'fine i am', '0', '2023-08-05 22:59:17', '2023-08-06 04:29:17'),
(37, 27, 4, 'My sad life', 2, 'scammer are everywhere', '0', '2023-08-05 23:19:20', '2023-08-06 04:49:20'),
(38, 27, 4, 'Hahah', 2, 'Haahaj', '0', '2023-08-06 00:26:48', '2023-08-06 05:56:48'),
(39, 27, 4, 'title', 2, 'question1', '0', '2023-08-06 00:58:51', '2023-08-06 06:28:51'),
(40, 27, 4, 'Academic 01', 2, 'hello', '0', '2023-08-06 01:00:22', '2023-08-06 06:30:22'),
(41, 27, 4, 'Academic 01', 2, 'hello', '0', '2023-08-06 01:04:18', '2023-08-06 06:34:18'),
(42, 27, 4, 'Academic 01', 2, 'hello', '0', '2023-08-06 01:08:32', '2023-08-06 06:38:32'),
(43, 27, 4, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:08:57', '2023-08-06 06:38:57'),
(44, 27, 4, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:13:20', '2023-08-06 06:43:20'),
(45, 27, 4, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:14:17', '2023-08-06 06:44:17'),
(46, 27, 4, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:15:09', '2023-08-06 06:45:09'),
(47, 27, 4, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:18:22', '2023-08-06 06:48:22'),
(48, 27, 4, 'hahaha', 2, 'hahahah', '0', '2023-08-06 01:21:18', '2023-08-06 06:51:18'),
(49, 27, 4, 'saf', 2, 'dsdssd', '0', '2023-08-06 01:22:06', '2023-08-06 06:52:06'),
(50, 27, 4, 'saf', 2, 'dsdssd', '0', '2023-08-06 01:22:57', '2023-08-06 06:52:57'),
(51, 27, 4, 'saf', 2, 'dsdssd', '0', '2023-08-06 01:24:25', '2023-08-06 06:54:25'),
(52, 27, 4, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:24:57', '2023-08-06 06:54:57'),
(53, 27, 4, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:27:37', '2023-08-06 06:57:37'),
(54, 27, 4, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:28:27', '2023-08-06 06:58:27'),
(55, 27, 4, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:31:29', '2023-08-06 07:01:29'),
(56, 27, 4, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:34:11', '2023-08-06 07:04:11'),
(57, 27, 4, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:37:01', '2023-08-06 07:07:01'),
(58, 27, 4, 'dasfdf', 2, 'fdsdsfsdfds', '0', '2023-08-06 01:41:56', '2023-08-06 07:11:56'),
(59, 27, 4, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:52:51', '2023-08-06 07:22:51'),
(60, 27, 4, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:54:29', '2023-08-06 07:24:29'),
(61, 27, 4, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:57:08', '2023-08-06 07:27:08'),
(62, 27, 4, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:58:50', '2023-08-06 07:28:50'),
(63, 27, 4, 'hahaha', 2, 'hahaha', '0', '2023-08-06 01:59:49', '2023-08-06 07:29:49'),
(64, 27, 4, 'hahaha', 2, 'hahaha', '0', '2023-08-06 02:05:36', '2023-08-06 07:35:36'),
(65, 27, 4, 'hahaha', 2, 'hahaha', '0', '2023-08-06 02:08:46', '2023-08-06 07:38:46'),
(66, 27, 4, 'huihukhhl', 2, 'hbhjgj', '0', '2023-08-06 02:09:16', '2023-08-06 07:39:16'),
(67, 27, 4, 'huihukhhl', 2, 'hbhjgj', '0', '2023-08-06 02:13:55', '2023-08-06 07:43:55'),
(68, 27, 4, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:19:00', '2023-08-06 07:49:00'),
(69, 27, 4, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:21:23', '2023-08-06 07:51:23'),
(70, 27, 4, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:23:21', '2023-08-06 07:53:21'),
(71, 27, 4, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:23:28', '2023-08-06 07:53:28'),
(72, 27, 4, 'hahahha', 2, 'hahahha', '0', '2023-08-06 02:23:43', '2023-08-06 07:53:43'),
(73, 27, 4, 'Education', 2, 'Education is key', '0', '2023-08-07 04:39:19', '2023-08-07 10:09:19'),
(74, 27, 4, 'Education', 2, 'Education is key', '0', '2023-08-07 04:39:32', '2023-08-07 10:09:32'),
(75, 27, 4, 'Education', 2, 'Education is key', '0', '2023-08-07 04:40:46', '2023-08-07 10:10:46'),
(76, 27, 4, 'king', 2, 'Hahaha', '0', '2023-08-07 04:44:19', '2023-08-07 10:14:19'),
(77, 27, 4, 'king', 2, 'Hahaha', '0', '2023-08-07 04:44:52', '2023-08-07 10:14:52'),
(78, 27, 4, 'king', 2, 'Hahaha', '0', '2023-08-07 04:46:25', '2023-08-07 10:16:25'),
(79, 27, 4, 'ahhaa', 2, 'ahhaha', '0', '2023-08-07 04:47:02', '2023-08-07 10:17:02'),
(80, 27, 4, 'hahah', 2, 'hahaha', '0', '2023-08-07 04:49:20', '2023-08-07 10:19:20'),
(81, 27, 4, 'hahah', 2, 'hahaha', '0', '2023-08-07 04:53:09', '2023-08-07 10:23:09'),
(82, 27, 4, 'hhaha', 2, 'ahahhaa', '0', '2023-08-07 04:53:38', '2023-08-07 10:23:38'),
(83, 27, 4, 'hhaha', 2, 'ahahhaa', '0', '2023-08-07 04:54:29', '2023-08-07 10:24:29'),
(84, 27, 4, 'Education', 2, 'shehabaz sherif', '0', '2023-08-07 08:37:11', '2023-08-07 14:07:11'),
(85, 27, 4, 'Education', 2, 'shehabaz sherif', '0', '2023-08-07 08:40:54', '2023-08-07 14:10:54'),
(86, 27, 4, 'Education', 2, 'shehabaz sherif', '0', '2023-08-07 08:42:39', '2023-08-07 14:12:39'),
(87, 27, 4, 'Haha', 2, 'Hahaking', '0', '2023-08-07 09:07:14', '2023-08-07 14:37:14'),
(88, 51, 4, 'Hhhh', 2, 'Fyuugtc Hh', '0', '2023-08-07 21:45:43', '2023-08-08 03:15:43'),
(89, 27, 4, 'Education', 2, 'Education', '0', '2023-08-08 04:28:04', '2023-08-08 09:58:04'),
(90, 27, 4, 'King', 2, 'Hahahq', '0', '2023-08-08 04:28:55', '2023-08-08 09:58:55'),
(91, 52, 4, 'Education', 2, 'Hahahlag King', '0', '2023-08-08 05:20:46', '2023-08-08 10:50:46'),
(92, 52, 4, 'haha', 2, 'hahahhahaha', '0', '2023-08-08 23:06:52', '2023-08-09 04:36:52'),
(93, 52, 4, 'ahahhaahhaah', 2, 'ahhaha', '0', '2023-08-08 23:11:26', '2023-08-09 04:41:26'),
(94, 52, 4, 'hahah', 2, 'hahaha', '0', '2023-08-08 23:29:03', '2023-08-09 04:59:03'),
(95, 52, 4, 'ahha', 2, 'ahhaahhaa', '0', '2023-08-08 23:29:35', '2023-08-09 04:59:35'),
(96, 52, 4, 'ahhah', 2, 'hahahaha', '0', '2023-08-08 23:41:16', '2023-08-09 05:11:16'),
(97, 52, 4, 'hahaha', 2, 'hahhaahha', '0', '2023-08-08 23:42:20', '2023-08-09 05:12:20'),
(98, 52, 4, 'ahha', 2, 'ahhahahahahha', '0', '2023-08-08 23:45:42', '2023-08-09 05:15:42'),
(99, 52, 4, 'hahah', 2, 'hahhahha', '0', '2023-08-08 23:46:13', '2023-08-09 05:16:13'),
(100, 52, 4, 'hahha', 2, 'hahaha', '0', '2023-08-08 23:49:22', '2023-08-09 05:19:22'),
(101, 52, 4, 'ahahah', 2, 'hahahahhah', '0', '2023-08-08 23:53:22', '2023-08-09 05:23:22'),
(102, 52, 4, 'hhahaha', 2, 'ahhaha', '0', '2023-08-08 23:54:00', '2023-08-09 05:24:00'),
(103, 52, 4, 'agaggagag', 2, 'hahaha', '0', '2023-08-08 23:54:59', '2023-08-09 05:24:59'),
(104, 52, 4, 'ahhaha', 2, 'ahahah', '0', '2023-08-08 23:55:54', '2023-08-09 05:25:54'),
(105, 52, 4, 'ahha', 2, 'hahhhaha', '0', '2023-08-08 23:56:59', '2023-08-09 05:26:59'),
(106, 52, 4, 'haha', 2, 'hahahha', '0', '2023-08-08 23:57:41', '2023-08-09 05:27:41'),
(107, 52, 4, 'hahha', 2, 'ahhaahaha', '0', '2023-08-09 00:03:00', '2023-08-09 05:33:00'),
(108, 52, 4, 'hhaha', 2, 'ahhaha', '0', '2023-08-09 00:11:25', '2023-08-09 05:41:25'),
(109, 52, 4, 'ahha', 2, 'ahhaha', '0', '2023-08-09 00:23:14', '2023-08-09 05:53:14'),
(110, 52, 4, 'ahhah', 2, 'ahahhaahaha', '0', '2023-08-09 00:23:58', '2023-08-09 05:53:58'),
(111, 52, 4, 'ahhaha', 2, 'ahhaha', '0', '2023-08-09 00:24:21', '2023-08-09 05:54:21'),
(112, 52, 4, 'ahhaha', 2, 'ahhaha', '0', '2023-08-09 00:24:23', '2023-08-09 05:54:23'),
(113, 52, 4, 'ahaha', 2, 'ahhahaha', '0', '2023-08-09 00:27:09', '2023-08-09 05:57:09'),
(114, 52, 4, 'ahhaha', 2, 'ahhaha', '0', '2023-08-09 00:28:41', '2023-08-09 05:58:41'),
(115, 52, 4, 'hahaha', 2, 'hahhaha', '0', '2023-08-09 00:29:05', '2023-08-09 05:59:05'),
(116, 52, 4, 'haah', 2, 'ahahhaha', '0', '2023-08-09 00:32:25', '2023-08-09 06:02:25'),
(117, 52, 4, 'hahha', 2, 'ahahha', '0', '2023-08-09 00:32:44', '2023-08-09 06:02:44'),
(118, 27, 4, 'ahhah', 2, 'ahhaha', '0', '2023-08-09 01:00:23', '2023-08-09 06:30:23'),
(119, 27, 4, 'Hhaahha', 2, 'Hahahahahaj', '0', '2023-08-09 01:08:32', '2023-08-09 06:38:32'),
(120, 27, 4, 'Hahaha', 2, 'Hahahahha', '0', '2023-08-09 01:08:46', '2023-08-09 06:38:46'),
(121, 27, 4, 'Hahahha', 2, 'Hahajajaj', '0', '2023-08-09 01:09:46', '2023-08-09 06:39:46'),
(122, 27, 4, 'Jajaa', 2, 'Ahajajja', '0', '2023-08-09 01:10:06', '2023-08-09 06:40:06'),
(123, 27, 4, 'Hhaa', 2, 'Hahajja', '0', '2023-08-09 01:10:20', '2023-08-09 06:40:20'),
(124, 27, 4, 'Bahaha', 2, 'Nahahajaj', '0', '2023-08-09 01:10:30', '2023-08-09 06:40:30'),
(125, 27, 4, 'Jajaja', 2, 'Hajaj', '0', '2023-08-09 01:10:42', '2023-08-09 06:40:42'),
(126, 27, 4, 'Hahaja', 2, 'Hajajaj', '0', '2023-08-09 01:10:56', '2023-08-09 06:40:56'),
(127, 27, 4, 'Hahaha', 2, 'Ahahajaj', '0', '2023-08-09 01:11:09', '2023-08-09 06:41:09'),
(128, 27, 4, 'Bajaja', 2, 'Ajjajqjq', '0', '2023-08-09 01:12:26', '2023-08-09 06:42:26'),
(129, 27, 4, 'Bahaj', 2, 'Quqjjwwjwj', '0', '2023-08-09 01:12:38', '2023-08-09 06:42:38'),
(130, 53, 4, 'Gffg', 2, 'Gnhggju', '0', '2023-08-09 02:15:35', '2023-08-09 07:45:35'),
(131, 53, 4, 'Dfcf', 2, 'Cvvb', '0', '2023-08-09 02:20:17', '2023-08-09 07:50:17'),
(132, 27, 4, 'ahhaha', 2, 'ahhahaha', '0', '2023-08-09 03:21:59', '2023-08-09 08:51:59'),
(133, 27, 4, 'ahaha', 2, 'yes', '0', '2023-08-09 04:54:37', '2023-08-09 10:24:37'),
(134, 27, 4, 'Hjahah', 2, 'Hahlahahaha', '0', '2023-08-09 06:37:15', '2023-08-09 12:07:15'),
(135, 27, 4, 'Hahahajahajahj', 2, 'Nahlajsjj', '0', '2023-08-09 06:37:31', '2023-08-09 12:07:31'),
(136, 53, 4, 'Ghhg', 2, 'Fvgg', '0', '2023-08-09 06:59:50', '2023-08-09 12:29:50'),
(137, 53, 4, 'Ggg', 2, 'Ghhg', '0', '2023-08-09 07:00:28', '2023-08-09 12:30:28'),
(138, 53, 4, 'Dcff', 2, 'Fghhh', '0', '2023-08-22 01:22:09', '2023-08-22 06:52:09'),
(139, 53, 4, 'Shhss', 2, 'Shhss', '0', '2023-08-22 02:16:13', '2023-08-22 07:46:13'),
(140, 5, 1, 'test', 1, 'Raj77', '0', '2023-08-22 06:49:52', '2023-08-22 12:19:52'),
(141, 5, 1, 'test', 2, 'Raj77334', '0', '2023-08-22 06:49:52', '2023-08-22 12:19:52'),
(142, 5, 1, 'test', 1, 'Raj77', '0', '2023-08-22 06:50:01', '2023-08-22 12:20:01'),
(143, 5, 1, 'test', 2, 'Raj77334', '0', '2023-08-22 06:50:01', '2023-08-22 12:20:01'),
(144, 5, 1, 'test', 1, 'Raj77', '0', '2023-08-23 02:15:49', '2023-08-23 07:45:49'),
(145, 5, 1, 'test', 2, 'Raj77334', '0', '2023-08-23 02:15:49', '2023-08-23 07:45:49'),
(146, -1, 1, 'sad life', 4, 'feelling sad', '0', '2023-08-23 02:42:50', '2023-08-23 08:12:50'),
(147, -1, 1, 'sad life', 3, 'very good', '0', '2023-08-23 02:42:50', '2023-08-23 08:12:50'),
(148, -1, 1, 'i am king', 4, 'king is me', '0', '2023-08-23 04:02:57', '2023-08-23 09:32:57'),
(149, -1, 1, 'i am king', 3, 'me is king', '0', '2023-08-23 04:02:57', '2023-08-23 09:32:57'),
(150, 58, 1, 'kldjksla', 4, 'hahjhdsjhkasjhdklsajds', '0', '2023-08-23 04:39:30', '2023-08-23 10:09:30'),
(151, 58, 1, 'kldjksla', 3, 'djhashfoidsufpop', '0', '2023-08-23 04:39:30', '2023-08-23 10:09:30'),
(152, 62, 1, 'title', 4, 'hero is my name', '0', '2023-08-23 04:59:53', '2023-08-23 10:29:53'),
(153, 62, 1, 'title', 3, 'name is my hero', '0', '2023-08-23 04:59:53', '2023-08-23 10:29:53'),
(154, 14, 1, 'jkhdkjashkjdhask', 4, 'l;dk;laskld;sa;', '0', '2023-08-24 23:59:40', '2023-08-25 05:29:40'),
(155, 14, 1, 'jkhdkjashkjdhask', 3, 'kljdlkasjdlsajlkdlas', '0', '2023-08-24 23:59:40', '2023-08-25 05:29:40'),
(156, 5, 1, 'test', 1, 'Raj77', '0', '2023-08-25 07:21:57', '2023-08-25 12:51:57'),
(157, 5, 1, 'test', 2, 'Raj77334', '0', '2023-08-25 07:21:57', '2023-08-25 12:51:57'),
(158, 5, 1, 'test', 1, 'Raj77', '0', '2023-08-25 07:27:24', '2023-08-25 12:57:24'),
(159, 5, 1, 'test', 2, 'Raj77334', '0', '2023-08-25 07:27:24', '2023-08-25 12:57:24'),
(160, 5, 1, 'test', 1, 'Raj77', '0', '2023-08-25 07:31:07', '2023-08-25 13:01:07'),
(161, 14, 6, 'ajsklasjkaklajklsja', 10, 'dksakdsopks[pfk', '0', '2023-08-25 08:01:37', '2023-08-25 13:31:37'),
(162, 14, 6, 'Hdjdj', 10, 'Jdjdjdj', '0', '2023-08-25 08:24:54', '2023-08-25 13:54:54'),
(163, 14, 4, 'heelerer', 8, 'sdjkasjdkljas', '0', '2023-08-25 08:53:53', '2023-08-25 14:23:53'),
(164, 14, 2, 'skldjklasjd', 6, 'jsdjsakjdlksajld', '0', '2023-08-25 09:00:20', '2023-08-25 14:30:20'),
(165, 14, 2, 'skldjklasjd', 5, 'skjdklsajdlasj', '0', '2023-08-25 09:00:20', '2023-08-25 14:30:20'),
(166, 14, 4, 'dopsipofasfd', 8, 'kpoasidpoas', '0', '2023-08-25 09:19:29', '2023-08-25 14:49:29'),
(167, 14, 6, 'pdf;sld;lf;sl\'f', 10, 'l;kd;ks;dkl', '0', '2023-08-25 22:15:36', '2023-08-26 03:45:36'),
(168, 53, 6, 'Ghhn', 10, 'Bbb', '0', '2023-08-25 22:41:44', '2023-08-26 04:11:44'),
(169, 14, 6, 'Hello', 10, 'My Life Is Sed', '0', '2023-08-26 05:23:30', '2023-08-26 10:53:30'),
(170, 14, 2, 'Jdjsjsjjdjjjd', 6, 'Jsjsjjsjs', '0', '2023-08-26 05:24:03', '2023-08-26 10:54:03'),
(171, 14, 2, 'Jdjsjsjjdjjjd', 5, 'Jdjdjhdj', '0', '2023-08-26 05:24:03', '2023-08-26 10:54:03'),
(172, 14, 6, 'Ghhhh', 10, 'Hjyyjjyg', '0', '2023-08-26 06:10:29', '2023-08-26 11:40:29'),
(173, 14, 6, 'Hhhu', 10, 'Hhytg Hhg', '0', '2023-08-26 06:11:25', '2023-08-26 11:41:25'),
(174, 14, 6, 'kjklsfjlfk', 10, 'f;dslkf;lkds;lfk;ds', '0', '2023-08-28 07:32:31', '2023-08-28 13:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `users_podcast`
--

CREATE TABLE `users_podcast` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `podcast_audio_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_podcast`
--

INSERT INTO `users_podcast` (`id`, `user_id`, `podcast_audio_id`, `created_at`, `updated_at`) VALUES
(1, 5, 3, '2023-08-26 02:04:49', '2023-08-23 04:57:43'),
(2, 5, 1, '2023-08-23 00:36:22', '2023-08-23 06:06:22'),
(3, 62, 1, '2023-08-23 05:26:33', '2023-08-23 10:56:33'),
(4, 62, 4, '2023-08-23 05:27:02', '2023-08-23 10:57:02'),
(5, 62, 5, '2023-08-23 05:30:24', '2023-08-23 11:00:24'),
(6, 62, 4, '2023-08-23 05:30:40', '2023-08-23 11:00:40'),
(7, 5, 1, '2023-08-25 00:43:54', '2023-08-25 06:13:54'),
(8, 14, 8, '2023-08-25 05:48:23', '2023-08-25 11:18:23'),
(9, 14, 7, '2023-08-25 05:49:21', '2023-08-25 11:19:21'),
(10, 14, 7, '2023-08-25 05:50:26', '2023-08-25 11:20:26'),
(11, 14, 2, '2023-08-25 05:51:54', '2023-08-25 11:21:54'),
(12, 14, 3, '2023-08-25 05:53:48', '2023-08-25 11:23:48'),
(13, 14, 2, '2023-08-25 05:56:43', '2023-08-25 11:26:43'),
(14, 14, 9, '2023-08-25 05:57:34', '2023-08-25 11:27:34'),
(15, 14, 9, '2023-08-25 06:00:33', '2023-08-25 11:30:33'),
(16, 14, 9, '2023-08-25 06:01:57', '2023-08-25 11:31:57'),
(17, 14, 9, '2023-08-25 06:05:21', '2023-08-25 11:35:21'),
(18, 14, 9, '2023-08-25 06:06:05', '2023-08-25 11:36:05'),
(19, 14, 9, '2023-08-25 06:08:08', '2023-08-25 11:38:08'),
(20, 14, 9, '2023-08-25 06:08:38', '2023-08-25 11:38:38'),
(21, 14, 9, '2023-08-25 06:09:53', '2023-08-25 11:39:53'),
(22, 14, 8, '2023-08-25 06:10:31', '2023-08-25 11:40:31'),
(23, 14, 7, '2023-08-25 06:11:55', '2023-08-25 11:41:55'),
(24, 14, 2, '2023-08-25 06:59:27', '2023-08-25 12:29:27'),
(25, 14, 2, '2023-08-25 06:59:46', '2023-08-25 12:29:46'),
(26, 14, 2, '2023-08-25 07:04:52', '2023-08-25 12:34:52'),
(27, 14, 2, '2023-08-25 07:07:02', '2023-08-25 12:37:02'),
(28, 14, 2, '2023-08-25 07:08:27', '2023-08-25 12:38:27'),
(29, 14, 3, '2023-08-25 07:17:26', '2023-08-25 12:47:26'),
(30, 14, 5, '2023-08-25 07:17:40', '2023-08-25 12:47:40'),
(31, 14, 2, '2023-08-25 07:46:26', '2023-08-25 13:16:26'),
(32, 53, 9, '2023-08-25 22:41:58', '2023-08-26 04:11:58'),
(33, 53, 2, '2023-08-25 22:42:06', '2023-08-26 04:12:06'),
(34, 14, 9, '2023-08-26 05:24:24', '2023-08-26 10:54:24'),
(35, 14, 8, '2023-08-26 05:24:57', '2023-08-26 10:54:57'),
(36, 14, 2, '2023-08-26 05:25:19', '2023-08-26 10:55:19'),
(37, 14, 3, '2023-08-26 05:25:49', '2023-08-26 10:55:49'),
(38, 14, 2, '2023-08-26 05:26:35', '2023-08-26 10:56:35'),
(39, 14, 2, '2023-08-26 05:27:36', '2023-08-26 10:57:36'),
(40, 14, 9, '2023-08-26 05:28:12', '2023-08-26 10:58:12'),
(41, 14, 3, '2023-08-26 05:28:27', '2023-08-26 10:58:27'),
(42, 14, 5, '2023-08-26 05:29:16', '2023-08-26 10:59:16'),
(43, 14, 9, '2023-08-26 05:29:26', '2023-08-26 10:59:26'),
(44, 14, 9, '2023-08-26 06:14:14', '2023-08-26 11:44:14'),
(45, 14, 8, '2023-08-26 06:14:22', '2023-08-26 11:44:22'),
(46, 14, 6, '2023-08-26 06:14:50', '2023-08-26 11:44:50'),
(47, 14, 9, '2023-08-28 07:32:52', '2023-08-28 13:02:52'),
(48, 14, 3, '2023-08-28 07:33:12', '2023-08-28 13:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `users_thought`
--

CREATE TABLE `users_thought` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `thought_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_thought`
--

INSERT INTO `users_thought` (`id`, `user_id`, `thought_id`, `created_at`, `updated_at`) VALUES
(1, 5, 1, '2023-08-22 23:27:43', '2023-08-23 04:57:43'),
(2, 5, 1, '2023-08-23 00:36:22', '2023-08-23 06:06:22'),
(3, 62, 1, '2023-08-23 05:26:33', '2023-08-23 10:56:33'),
(4, 62, 4, '2023-08-23 05:27:02', '2023-08-23 10:57:02'),
(5, 62, 5, '2023-08-23 05:30:24', '2023-08-23 11:00:24'),
(6, 62, 4, '2023-08-23 05:30:40', '2023-08-23 11:00:40'),
(7, 5, 6, '2023-08-26 02:31:45', '2023-08-26 08:01:45'),
(8, 14, 4, '2023-08-26 03:00:19', '2023-08-26 08:30:19'),
(9, 14, 4, '2023-08-26 03:02:04', '2023-08-26 08:32:04'),
(10, 14, 4, '2023-08-26 03:04:18', '2023-08-26 08:34:18'),
(11, 14, 4, '2023-08-26 03:04:43', '2023-08-26 08:34:43'),
(12, 14, 4, '2023-08-26 03:04:58', '2023-08-26 08:34:58'),
(13, 14, 6, '2023-08-26 03:06:36', '2023-08-26 08:36:36'),
(14, 14, 6, '2023-08-26 03:07:13', '2023-08-26 08:37:13'),
(15, 14, 6, '2023-08-26 03:08:13', '2023-08-26 08:38:13'),
(16, 14, 5, '2023-08-26 03:08:29', '2023-08-26 08:38:29'),
(17, 14, 6, '2023-08-26 03:46:24', '2023-08-26 09:16:24'),
(18, 14, 6, '2023-08-26 03:46:53', '2023-08-26 09:16:53'),
(19, 14, 6, '2023-08-26 05:30:16', '2023-08-26 11:00:16'),
(20, 14, 4, '2023-08-26 05:30:39', '2023-08-26 11:00:39'),
(21, 14, 5, '2023-08-26 05:30:56', '2023-08-26 11:00:56'),
(22, 14, 6, '2023-08-26 06:15:19', '2023-08-26 11:45:19'),
(23, 14, 5, '2023-08-26 06:15:26', '2023-08-26 11:45:26'),
(24, 14, 5, '2023-08-26 06:15:59', '2023-08-26 11:45:59'),
(25, 14, 6, '2023-08-26 06:17:18', '2023-08-26 11:47:18'),
(26, 14, 6, '2023-08-26 06:17:28', '2023-08-26 11:47:28'),
(27, 14, 6, '2023-08-28 07:33:40', '2023-08-28 13:03:40'),
(28, 14, 4, '2023-08-28 07:33:52', '2023-08-28 13:03:52'),
(29, 14, 5, '2023-08-28 07:34:05', '2023-08-28 13:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `users_video`
--

CREATE TABLE `users_video` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  `sub_mood_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_video`
--

INSERT INTO `users_video` (`id`, `user_id`, `mood_id`, `sub_mood_id`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 3, 1, '2023-08-22 23:27:43', '2023-08-23 04:57:43'),
(2, 5, 1, 3, 1, '2023-08-23 00:36:22', '2023-08-23 06:06:22'),
(3, 62, 4, 28, 1, '2023-08-23 05:26:33', '2023-08-23 10:56:33'),
(4, 62, 4, 28, 4, '2023-08-23 05:27:02', '2023-08-23 10:57:02'),
(5, 62, 4, 28, 5, '2023-08-23 05:30:24', '2023-08-23 11:00:24'),
(6, 62, 4, 28, 4, '2023-08-23 05:30:40', '2023-08-23 11:00:40'),
(7, 53, 4, 32, 1, '2023-08-25 22:40:28', '2023-08-26 04:10:28'),
(8, 65, 6, 57, 1, '2023-08-26 06:02:03', '2023-08-26 11:32:03'),
(9, 65, 6, 57, 4, '2023-08-26 06:02:04', '2023-08-26 11:32:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audio_video`
--
ALTER TABLE `audio_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `available_type`
--
ALTER TABLE `available_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consult_doctors`
--
ALTER TABLE `consult_doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consult_doctors_appointment`
--
ALTER TABLE `consult_doctors_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expertise`
--
ALTER TABLE `expertise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_question`
--
ALTER TABLE `journal_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moods`
--
ALTER TABLE `moods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moods_question`
--
ALTER TABLE `moods_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moods_recommendation`
--
ALTER TABLE `moods_recommendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moods_sub`
--
ALTER TABLE `moods_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moods_tracker`
--
ALTER TABLE `moods_tracker`
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
-- Indexes for table `podcast`
--
ALTER TABLE `podcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `podcast_audio`
--
ALTER TABLE `podcast_audio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thought`
--
ALTER TABLE `thought`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thought_category`
--
ALTER TABLE `thought_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_academic`
--
ALTER TABLE `users_academic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_audio`
--
ALTER TABLE `users_audio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_breathin`
--
ALTER TABLE `users_breathin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_journal_question`
--
ALTER TABLE `users_journal_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_podcast`
--
ALTER TABLE `users_podcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_thought`
--
ALTER TABLE `users_thought`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_video`
--
ALTER TABLE `users_video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audio_video`
--
ALTER TABLE `audio_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `available_type`
--
ALTER TABLE `available_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `consult_doctors`
--
ALTER TABLE `consult_doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `consult_doctors_appointment`
--
ALTER TABLE `consult_doctors_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `expertise`
--
ALTER TABLE `expertise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `journal_question`
--
ALTER TABLE `journal_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moods`
--
ALTER TABLE `moods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `moods_question`
--
ALTER TABLE `moods_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `moods_recommendation`
--
ALTER TABLE `moods_recommendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `moods_sub`
--
ALTER TABLE `moods_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `moods_tracker`
--
ALTER TABLE `moods_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `podcast`
--
ALTER TABLE `podcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `podcast_audio`
--
ALTER TABLE `podcast_audio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `thought`
--
ALTER TABLE `thought`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `thought_category`
--
ALTER TABLE `thought_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users_academic`
--
ALTER TABLE `users_academic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `users_audio`
--
ALTER TABLE `users_audio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_breathin`
--
ALTER TABLE `users_breathin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `users_journal_question`
--
ALTER TABLE `users_journal_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `users_podcast`
--
ALTER TABLE `users_podcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users_thought`
--
ALTER TABLE `users_thought`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users_video`
--
ALTER TABLE `users_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
