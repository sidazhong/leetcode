-- phpMyAdmin SQL Dump
-- version 4.4.6
-- http://www.phpmyadmin.net
--
-- Host: 10.240.99.191
-- Generation Time: Nov 18, 2020 at 08:08 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1-log
-- PHP Version: 5.6.33-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `EXERCISE`
--

-- --------------------------------------------------------

--
-- Table structure for table `WORK_OUT`
--

CREATE TABLE IF NOT EXISTS `WORK_OUT` (
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `workout_type` varchar(5) NOT NULL,
  `start-year` int(11) NOT NULL,
  `start-month` int(11) NOT NULL,
  `start-day` int(11) NOT NULL,
  `start-hour` int(11) NOT NULL,
  `start-minutes` int(11) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `WORK_OUT`
--

INSERT INTO `WORK_OUT` (`longitude`, `latitude`, `workout_type`, `start-year`, `start-month`, `start-day`, `start-hour`, `start-minutes`, `duration`) VALUES
(37.3394, 121.895, 'swim', 2020, 11, 30, 23, 10, 60),
(40.7088, 73.9208, 'swim', 2020, 4, 29, 22, 23, 55),
(40.7462, 73.8865, 'swim', 2020, 5, 28, 21, 25, 57),
(40.9052, 74.1488, 'swim', 2021, 6, 27, 20, 52, 34),
(41.1316, 74.0887, 'swim', 2021, 7, 26, 19, 24, 44),
(41.8368, 72.691, 'swim', 2021, 1, 25, 18, 23, 45),
(39.9771, 105.952, 'bike', 2020, 2, 24, 17, 34, 34),
(40.8471, 102.349, 'bike', 2021, 3, 23, 16, 52, 21),
(42.9403, 106.392, 'bike', 2020, 4, 22, 15, 34, 56),
(43.0689, 109.995, 'bike', 2021, 5, 21, 15, 41, 80),
(40.0444, 115.181, 'walk', 2021, 6, 20, 14, 16, 70),
(40.4469, 117.993, 'walk', 2020, 7, 18, 14, 14, 68),
(42.6824, 120.542, 'walk', 2021, 8, 19, 13, 0, 66),
(38.8226, 118.521, 'walk', 2020, 9, 17, 13, 43, 45),
(37.7186, 115.62, 'walk', 2021, 10, 16, 12, 25, 67),
(35.5322, 116.06, 'run', 2020, 11, 15, 12, 52, 45),
(46.0122, 118.608, 'run', 2021, 12, 14, 11, 43, 15),
(44.4652, 121.157, 'run', 2020, 1, 13, 10, 46, 78),
(40.9135, 122.3, 'run', 2021, 2, 12, 9, 48, 89),
(43.1331, 93.4717, 'run', 2021, 3, 11, 8, 37, 77);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
