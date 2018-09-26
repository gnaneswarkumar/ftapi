-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2018 at 08:11 PM
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
(11, 1, 'Venkata Narayanappa', '2018-09-13 19:44:29', '2018-09-13 19:44:29', 'M', 'undefined', 0, 5),
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
(26, 1, 'Sreenivasa Rao', '2018-09-13 20:09:20', '2018-09-13 20:09:20', 'M', '23', 0, 0);

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
  MODIFY `ft_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
