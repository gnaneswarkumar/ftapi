-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2018 at 08:54 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ftapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `ft_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(225) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `dod` datetime DEFAULT NULL,
  `gender` enum('M','F') NOT NULL,
  `wives` varchar(11) DEFAULT NULL,
  `mother` int(11) DEFAULT NULL,
  `father` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`ft_id`, `family_id`, `name`, `dob`, `dod`, `gender`, `wives`, `mother`, `father`) VALUES
(1, 1, 'Tippa Raju', '2018-09-10 14:28:24', '2018-09-10 14:28:24', 'M', 'undefined', 0, 0),
(2, 1, 'Pedda Chennappa', '2018-09-10 14:30:13', '2018-09-10 14:30:13', 'M', 'undefined', 0, 1),
(3, 1, 'Chinna Chennappa', '2018-09-10 14:43:16', '2018-09-10 14:43:16', 'M', 'undefined', 0, 1),
(4, 1, 'Linga Raju', '2018-09-13 19:28:12', '2018-09-13 19:28:12', 'M', 'undefined', 0, 2),
(5, 1, 'Dasappa', '2018-09-13 19:33:11', '2018-09-13 19:33:11', 'M', 'undefined', 0, 2),
(6, 1, 'Kesavappa', '2018-09-13 19:37:36', '2018-09-13 19:37:36', 'M', 'undefined', 0, 3),
(7, 1, 'Papa Raju', '2018-09-13 19:39:11', '2018-09-13 19:39:11', 'M', 'undefined', 0, 4),
(8, 1, 'Venkata Narasappa', '2018-09-13 19:41:24', '2018-09-13 19:41:24', 'M', 'undefined', 0, 7),
(9, 1, 'Venkata Kesavappa (Adoptation to Venkata Rayappa)', '2018-09-13 19:43:17', '2018-09-13 19:43:17', 'M', 'undefined', 0, 8),
(10, 1, 'Venkata Ramanna', '2018-09-13 19:44:11', '2018-09-13 19:44:11', 'M', 'undefined', 0, 5),
(11, 1, 'Venkata Narayanappa', '2018-09-13 19:44:29', '2018-09-13 19:44:29', 'M', '32', 0, 5),
(12, 1, 'Venkata Rayappa', '2018-09-13 19:45:55', '2018-09-13 19:45:55', 'M', 'undefined', 0, 10),
(13, 1, 'Dasapa -2', '2018-09-13 19:46:31', '2018-09-13 19:46:31', 'M', 'undefined', 0, 10),
(14, 1, 'Dasapa -3', '2018-09-13 19:47:57', '2018-09-13 19:47:57', 'M', 'undefined', 0, 13),
(15, 1, 'Surya Narayana Rao (Adopted Son)', '2018-09-13 19:49:51', '2018-09-13 19:49:51', 'M', '17,18', 0, 14),
(16, 1, 'Billuru Venkatachalam', '2018-09-13 19:50:46', '2018-09-13 19:50:46', 'M', 'undefined', 0, 0),
(17, 1, 'Saraswathamma', '2018-09-13 19:51:11', '2018-09-13 19:51:11', 'F', 'undefined', 0, 16),
(18, 1, 'Lalithamma', '2018-09-13 19:52:51', '2018-09-13 19:52:51', 'F', 'undefined', 0, 16),
(19, 1, 'Padmini', '2018-09-13 19:57:44', '2018-09-13 19:57:44', 'F', 'undefined', 0, 0),
(20, 1, 'Sambasiva Rao', '2018-09-13 19:59:12', '2018-09-13 19:59:12', 'M', '19', 0, 15),
(21, 1, 'Sudhakar', '2018-09-13 20:03:20', '2018-09-13 20:03:20', 'M', '', 0, 15),
(22, 1, 'Ramachandra Rao', '2018-09-13 20:03:48', '2018-09-13 20:03:48', 'M', '', 0, 15),
(23, 1, 'Sakunthalamma', '2018-09-13 20:07:00', '2018-09-13 20:07:00', 'F', '', 0, 15),
(24, 1, 'Saraswathamma', '2018-09-13 20:07:30', '2018-09-13 20:07:30', 'F', '', 0, 15),
(25, 1, 'Lelavathamma', '2018-09-13 20:08:15', '2018-09-13 20:08:15', 'F', '', 0, 15),
(26, 1, 'Sreenivasa Rao', '2018-09-13 20:09:20', '2018-09-13 20:09:20', 'M', '23', 0, 0),
(27, 1, 'Eswar Praveen', '2018-09-16 06:01:45', '2018-09-16 06:01:45', 'M', 'undefined', 0, 20),
(28, 1, 'Surya Prakash', '2018-09-16 06:03:10', '2018-09-16 06:03:10', 'M', 'undefined', 0, 21),
(29, 1, 'Sarat Chandra', '2018-09-16 06:03:32', '2018-09-16 06:03:32', 'M', 'undefined', 0, 21),
(30, 1, 'Praneeth', '2018-09-16 06:35:40', '2018-09-16 06:35:40', 'M', 'undefined', 0, 22),
(31, 1, 'Anoop', '2018-09-16 06:36:10', '2018-09-16 06:36:10', 'M', 'undefined', 0, 22),
(32, 1, 'Nanemma', '2018-09-16 06:36:44', '2018-09-16 06:36:44', 'F', 'undefined', 0, 0),
(33, 1, 'Venkata Narasappa -2', '2018-09-16 06:40:03', '2018-09-16 06:40:03', 'M', '34', 32, 11),
(34, 1, 'Seethama', '2018-09-16 06:40:57', '2018-09-16 06:40:57', 'F', 'undefined', 0, 0),
(35, 1, 'Nallapareddy Palli Jalappa', '2018-09-16 06:47:39', '2018-09-16 06:47:39', 'M', 'undefined', 0, 0),
(36, 1, 'Subbamma', '2018-09-16 06:47:55', '2018-09-16 06:47:55', 'F', 'undefined', 0, 35),
(37, 1, 'Venkata Rayappa -2', '2018-09-16 06:49:19', '2018-09-16 06:49:19', 'M', '36', 34, 33),
(38, 1, 'Krishtrao', '2018-09-16 06:53:23', '2018-09-16 06:53:23', 'M', '', 34, 33),
(39, 1, 'Surya Narayana Rao (Adoption to Dasappa)', '2018-09-16 07:01:18', '2018-09-16 07:01:18', 'M', 'undefined', 34, 33),
(40, 1, 'Ramappa', '2018-09-16 07:02:02', '2018-09-16 07:02:02', 'M', 'undefined', 34, 33),
(41, 1, 'Srinivasa Rao', '2018-09-16 07:02:43', '2018-09-16 07:02:43', 'M', 'undefined', 34, 33),
(42, 1, 'Hatti', '2018-09-16 07:49:31', '2018-09-16 07:49:31', 'M', 'undefined', 0, 0),
(43, 1, 'Vimalamma', '2018-09-16 07:49:53', '2018-09-16 07:49:53', 'F', 'undefined', 0, 42),
(44, 1, 'venkata Subba Rao', '2018-09-16 07:50:54', '2018-09-16 07:50:54', 'M', '43', 36, 37),
(45, 1, 'Venkata Narasappa -3 (Expired before marriage)', '2018-09-16 07:52:26', '2018-09-16 07:52:26', 'M', '', 36, 37),
(46, 1, 'Ramadas', '2018-09-16 07:53:38', '2018-09-16 07:53:38', 'M', '', 36, 37),
(47, 1, ' Hatti Mahadeva Rao', '2018-09-16 07:55:45', '2018-09-16 07:55:45', 'M', '', 0, 0),
(48, 1, 'Suvarnamma', '2018-09-16 07:56:04', '2018-09-16 07:56:04', 'F', '', 0, 47),
(49, 1, 'Krishna Murthy', '2018-09-16 07:57:40', '2018-09-16 07:57:40', 'M', '48', 43, 44),
(50, 1, 'Kattiriguppa Vasantha Rao', '2018-09-16 07:58:22', '2018-09-16 07:58:22', 'M', '', 0, 0),
(51, 1, 'Vijaya Lakshmi', '2018-09-16 07:58:52', '2018-09-16 07:58:52', 'F', '', 0, 50),
(52, 1, 'Ramachandra Rao -2', '2018-09-16 07:59:46', '2018-09-16 07:59:46', 'M', '51', 43, 44),
(53, 1, 'Sree Nath (Expired before marriage)', '2018-09-16 08:03:02', '2018-09-16 08:03:02', 'M', '', 48, 49),
(54, 1, 'Jyothi', '2018-09-16 08:03:22', '2018-09-16 08:03:22', 'F', '', 0, 0),
(55, 1, 'Surendra Nath', '2018-09-16 08:04:08', '2018-09-16 08:04:08', 'M', '54', 48, 49),
(56, 1, 'Sanketh', '2018-09-16 08:06:24', '2018-09-16 08:06:24', 'M', '', 54, 55),
(57, 1, 'Ruthvic', '2018-09-16 08:07:12', '2018-09-16 08:07:12', 'M', '', 54, 55),
(58, 1, 'B. Hanumantha Rao', '2018-09-16 08:07:54', '2018-09-16 08:07:54', 'M', '', 0, 0),
(59, 1, 'Prathima', '2018-09-16 08:08:08', '2018-09-16 08:08:08', 'F', '', 0, 58),
(60, 1, 'Sasidhar', '2018-09-16 08:09:52', '2018-09-16 08:09:52', 'M', '59', 51, 52),
(61, 1, 'Narasamma', '2018-09-16 08:11:00', '2018-09-16 08:11:00', 'F', '', 36, 37),
(62, 1, 'Kanduru Subba Rao', '2018-09-16 08:12:11', '2018-09-16 08:12:11', 'M', '61', 0, 0),
(63, 1, 'Adilakshamma', '2018-09-16 08:13:01', '2018-09-16 08:13:01', 'F', '', 36, 37),
(64, 1, 'Kamalamma', '2018-09-16 08:13:29', '2018-09-16 08:13:29', 'F', '', 36, 37),
(65, 1, 'Lalithamma', '2018-09-16 08:13:52', '2018-09-16 08:13:52', 'F', '', 36, 37),
(66, 1, 'Prabhavathamma', '2018-09-16 08:14:43', '2018-09-16 08:14:43', 'F', '', 36, 37),
(67, 1, 'Nandyala Narrasinga Rao', '2018-09-16 08:17:21', '2018-09-16 08:17:21', 'M', '63', 0, 0),
(68, 1, 'Kalyanadurg Subba Rao', '2018-09-16 08:21:48', '2018-09-16 08:21:48', 'M', '64', 0, 0),
(69, 1, 'Kathiri Guppa Vasantha Rao', '2018-09-16 08:22:05', '2018-09-16 08:22:05', 'M', '65', 0, 0),
(70, 1, 'Kathiri Guppa Krishna Murthy', '2018-09-16 08:22:25', '2018-09-16 08:22:25', 'M', '66', 0, 0),
(71, 1, 'Vijaya Lakshmi', '2018-09-16 08:24:25', '2018-09-16 08:24:25', 'F', '', 43, 44),
(72, 1, 'Uma Devi', '2018-09-16 08:25:04', '2018-09-16 08:25:04', 'F', '', 43, 44),
(73, 1, 'Hatti Ramachandra Murthy', '2018-09-16 08:25:26', '2018-09-16 08:25:26', 'M', '71', 0, 0),
(74, 1, 'Dr. Sree Nath', '2018-09-16 08:25:44', '2018-09-16 08:25:44', 'M', '72', 0, 0),
(75, 1, 'Madhuri', '2018-09-16 08:31:24', '2018-09-16 08:31:24', 'F', '', 48, 49),
(76, 1, 'Aparna', '2018-09-16 08:31:53', '2018-09-16 08:31:53', 'F', '', 48, 49),
(77, 1, 'Chidambar', '2018-09-16 08:32:11', '2018-09-16 08:32:11', 'M', '75', 0, 0),
(78, 1, 'Sreenivas', '2018-09-16 08:32:30', '2018-09-16 08:32:30', 'M', '76', 0, 0),
(79, 1, 'Sandhya', '2018-09-16 08:37:53', '2018-09-16 08:37:53', 'F', 'undefined', 51, 52),
(80, 1, 'Vasumathi', '2018-09-16 08:38:36', '2018-09-16 08:38:36', 'F', 'undefined', 51, 52),
(81, 1, 'Prasad,', '2018-09-16 08:38:53', '2018-09-16 08:38:53', 'M', '79', 0, 0),
(82, 1, 'Anil Kumar', '2018-09-16 08:39:08', '2018-09-16 08:39:08', 'M', '80', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`ft_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `ft_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
