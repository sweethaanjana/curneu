-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2018 at 09:23 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `train`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(8) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `pass` varchar(6) DEFAULT NULL,
  `author` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `email`, `uname`, `pass`, `author`) VALUES
(1000, 'nabeel@gmail.com', 'NABEEL', '123', 'user'),
(1, 'nabeel7959@gmail.com', 'NABEEL AHMED', 'nab', 'admin'),
(2, 'nikhil4@gmail.com', 'NIKHIL', 'nik', 'admin'),
(1001, 'sweethasekar@gmail.com', 'SWEETHA R', 'sweeth', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `reg_user`
--

CREATE TABLE `reg_user` (
  `user_id` int(8) NOT NULL,
  `name` char(30) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone_no` varchar(13) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `credit_no` varchar(16) DEFAULT NULL,
  `pass_wrd` varchar(8) DEFAULT NULL,
  `addr` varchar(250) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` char(30) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_user`
--

INSERT INTO `reg_user` (`user_id`, `name`, `sex`, `dob`, `phone_no`, `email_id`, `credit_no`, `pass_wrd`, `addr`, `city`, `state`, `pincode`, `country`) VALUES
(1000, 'NABEEL', 'M', '1991-03-18', NULL, 'nabeel@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, 'SWEETHA R', 'F', '1996-10-03', '9655432989', 'sweethasekar@gmail.com', '1231231231231231', 'sweeth', 'TF02 RAINBOW RESIDENCY', 'Bangalore', 'GREEN GLEN LAYOUT,BELLANDHU', '560103', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `station_id` int(4) NOT NULL,
  `station_name` char(30) DEFAULT NULL,
  `km` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`station_id`, `station_name`, `km`) VALUES
(100, 'A', 1),
(101, 'B', 2),
(199, 'C', 10),
(200, 'A', 1),
(201, 'B', 2),
(202, 'C', 3),
(203, 'D', 4),
(204, 'E', 5),
(205, 'F', 6),
(206, 'G', 7),
(207, 'H', 8),
(208, 'I', 9),
(299, 'J', 10);

-- --------------------------------------------------------

--
-- Table structure for table `route_main`
--

CREATE TABLE `route_main` (
  `route_id` int(3) NOT NULL,
  `s_station_id` int(5) DEFAULT NULL,
  `s_station_name` char(30) DEFAULT NULL,
  `d_station_id` int(5) DEFAULT NULL,
  `d_station_name` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route_main`
--

INSERT INTO `route_main` (`route_id`, `s_station_id`, `s_station_name`, `d_station_id`, `d_station_name`) VALUES
(5, 100, 'A', 199, 'C'),
(6, 200, 'A', 299, 'J');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reg_user`
--
ALTER TABLE `reg_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email_id` (`email_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`station_id`),
  ADD UNIQUE KEY `station_id` (`station_id`);

--
-- Indexes for table `route_main`
--
ALTER TABLE `route_main`
  ADD PRIMARY KEY (`route_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reg_user`
--
ALTER TABLE `reg_user`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `station_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `route_main`
--
ALTER TABLE `route_main`
  MODIFY `route_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
