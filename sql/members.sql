-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2018 at 11:50 AM
-- Server version: 5.6.39-83.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brahmana_ftapi`
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
(3, 1, 'Chinna Chennappa', '2018-09-10 14:43:16', '2018-09-10 14:43:16', 'M', 'undefined', 0, 1);

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
  MODIFY `ft_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
