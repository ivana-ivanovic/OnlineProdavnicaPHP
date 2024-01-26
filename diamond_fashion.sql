-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2024 at 10:36 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diamond_fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_item`
--

CREATE TABLE `category_item` (
  `id_category_item` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_item`
--

INSERT INTO `category_item` (`id_category_item`, `category`) VALUES
(1, 'Zene'),
(2, 'Muskarci'),
(3, 'Deca');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id_color` int(11) NOT NULL,
  `color` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id_color`, `color`) VALUES
(1, 'crvena'),
(2, 'siva'),
(3, 'zuta'),
(4, 'zelena'),
(5, 'bela'),
(6, 'braon'),
(7, 'roze');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_color` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `id_category_item` int(11) DEFAULT NULL,
  `id_type_item` int(11) DEFAULT NULL,
  `id_sale` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `name`, `price`, `id_color`, `description`, `image`, `id_category_item`, `id_type_item`, `id_sale`) VALUES
(1, 'Zenska majica', '800.00', 2, 'Ovaj majica je jako lepa,ima 90% pamuka,10% elastina i tako. ', 'zm1.jpg', 1, 1, 1),
(3, 'Zenska majica', '800.00', 5, 'Ovaj majica je jako lepa,ima 90% pamuka,10% elastina i tako. ', 'zm3.jpg', 1, 1, 1),
(4, 'Zenska majica', '800.00', 6, 'Ovaj majica je jako lepa,ima 90% pamuka,10% elastina i tako. ', 'zm4.jpg', 1, 1, 1),
(5, 'Zenska majica', '800.00', 2, 'Ovaj majica je jako lepa,ima 90% pamuka,10% elastina i tako. ', 'zm5.jpg', 1, 1, 1),
(6, 'Zenska majica', '700.50', 4, 'Ovaj majica je jako lepa,ima 90% pamuka,10% elastina i tako. ', 'zm6.jpg', 1, 1, 1),
(14, 'Zuta majica', '800.00', 3, 'Opis', 'zm14.jpg', 2, 7, NULL),
(15, 'Zenska majica crvena', '800.00', 1, 'Pamucna majca', 'zm15.jpg', 1, 1, 1),
(18, 'Dukserica', '3000.00', 2, 'Opis', 'zm18.jpg', 2, 8, 7),
(19, 'Crvena decija majica', '500.00', 1, 'Pamuk 100%', 'zm19.jpg', 3, 12, NULL),
(20, 'Decija zuta majica', '500.00', 3, 'Pamuk 100%', 'zm20.jpg', 3, 12, NULL),
(21, 'Decija zuta majica 1', '500.00', 3, 'Pamuk 100%', 'zm21.jpg', 3, 12, NULL),
(22, 'Decija zelena majica ', '500.00', 4, 'Pamuk 100%', 'zm22.jpg', 3, 12, NULL),
(23, 'Decija bela majica ', '500.00', 5, 'Pamuk 100%', 'zm23.jpg', 3, 12, NULL),
(24, 'Muska braon majica', '1000.00', 6, 'Pamuk 100%', 'zm24.jpg', 2, 7, NULL),
(25, 'Muska crvena majica', '1000.00', 1, 'Pamuk 100%', 'zm25.jpg', 2, 7, NULL),
(26, 'Muska crvena majica 1', '1000.00', 1, 'Pamuk 100%', 'zm26.jpg', 2, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_size`
--

CREATE TABLE `item_size` (
  `id_item_size` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `on_stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_size`
--

INSERT INTO `item_size` (`id_item_size`, `id_item`, `id_size`, `on_stock`) VALUES
(1, 1, 1, 99),
(2, 1, 2, 99),
(3, 1, 3, 100),
(4, 1, 4, 99),
(5, 1, 5, 99),
(11, 3, 1, 98),
(12, 3, 2, 100),
(13, 3, 3, 98),
(14, 3, 4, 100),
(15, 3, 5, 100),
(16, 4, 1, 100),
(17, 4, 2, 100),
(18, 4, 3, 100),
(19, 4, 4, 100),
(20, 4, 5, 100),
(21, 5, 1, 99),
(22, 5, 2, 100),
(23, 5, 3, 98),
(24, 5, 4, 99),
(25, 5, 5, 100),
(26, 6, 1, 100),
(27, 6, 2, 100),
(28, 6, 3, 97),
(29, 6, 4, 100),
(30, 6, 5, 98),
(31, 1, 6, 99),
(33, 3, 6, 100),
(34, 4, 6, 100),
(35, 5, 6, 94),
(36, 6, 6, 100),
(73, 14, 1, 100),
(74, 14, 2, 100),
(75, 14, 3, 99),
(76, 14, 4, 100),
(77, 14, 5, 97),
(78, 14, 6, 100),
(79, 15, 1, 99),
(80, 15, 2, 100),
(81, 15, 3, 99),
(82, 15, 4, 100),
(83, 15, 5, 97),
(84, 15, 6, 100),
(97, 18, 1, 100),
(98, 18, 2, 100),
(99, 18, 3, 99),
(100, 18, 4, 100),
(101, 18, 5, 94),
(102, 18, 6, 100),
(103, 19, 1, 100),
(104, 19, 2, 100),
(105, 19, 3, 99),
(106, 19, 4, 99),
(107, 19, 5, 100),
(108, 19, 6, 95),
(109, 20, 1, 100),
(110, 20, 2, 97),
(111, 20, 3, 99),
(112, 20, 4, 100),
(113, 20, 5, 100),
(114, 20, 6, 99),
(115, 21, 1, 100),
(116, 21, 2, 100),
(117, 21, 3, 100),
(118, 21, 4, 97),
(119, 21, 5, 100),
(120, 21, 6, 99),
(121, 22, 1, 100),
(122, 22, 2, 96),
(123, 22, 3, 97),
(124, 22, 4, 100),
(125, 22, 5, 100),
(126, 22, 6, 96),
(127, 23, 1, 100),
(128, 23, 2, 100),
(129, 23, 3, 99),
(130, 23, 4, 99),
(131, 23, 5, 100),
(132, 23, 6, 100),
(133, 24, 1, 100),
(134, 24, 2, 99),
(135, 24, 3, 99),
(136, 24, 4, 99),
(137, 24, 5, 99),
(138, 24, 6, 99),
(139, 25, 1, 100),
(140, 25, 2, 100),
(141, 25, 3, 99),
(142, 25, 4, 100),
(143, 25, 5, 97),
(144, 25, 6, 99),
(145, 26, 1, 100),
(146, 26, 2, 100),
(147, 26, 3, 100),
(148, 26, 4, 99),
(149, 26, 5, 98),
(150, 26, 6, 98);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL,
  `for_payment` decimal(10,2) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` time NOT NULL DEFAULT current_timestamp(),
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `for_payment`, `id_user`, `time`, `date`) VALUES
(2, '5600.00', 1, '12:18:33', '2020-10-16'),
(3, '5600.00', 1, '12:18:33', '2020-10-16'),
(4, '800.00', 1, '12:18:33', '2020-10-17'),
(5, '800.00', 1, '12:18:33', '2020-10-18'),
(8, '800.00', 1, '12:18:33', '2020-10-19'),
(16, '1600.00', 1, '12:18:33', '2020-10-20'),
(18, '800.00', 3, '12:18:33', '2020-10-20'),
(19, '2400.00', 3, '12:18:33', '2020-10-21'),
(31, '800.00', 3, '12:18:33', '2020-10-22'),
(32, '3800.00', 3, '22:01:18', '2020-10-23'),
(33, '1600.00', 3, '09:40:40', '2020-10-24'),
(34, '2500.00', 3, '11:21:48', '2020-10-26'),
(35, '1500.00', 1, '15:12:49', '2020-10-29'),
(36, '2000.00', 4, '15:28:49', '2020-10-30'),
(37, '2300.00', 4, '15:29:21', '2020-10-31'),
(38, '5800.00', 2, '15:30:13', '2020-11-01'),
(39, '3000.00', 2, '15:30:38', '2020-11-02'),
(40, '4500.00', 2, '15:32:14', '2020-11-03'),
(41, '3800.00', 2, '15:32:42', '2020-11-05'),
(42, '6701.50', 1, '15:33:40', '2020-11-07'),
(43, '1000.00', 1, '15:34:22', '2020-11-08'),
(44, '2400.00', 3, '15:36:06', '2020-11-10'),
(45, '2000.00', 2, '15:36:36', '2020-11-11'),
(46, '500.00', 1, '15:37:35', '2020-11-13'),
(47, '1000.00', 2, '15:38:18', '2020-11-15'),
(48, '1000.00', 3, '15:38:54', '2020-11-16'),
(49, '4800.00', 3, '15:39:18', '2020-11-17'),
(50, '4500.00', 3, '15:39:54', '2020-11-17'),
(51, '2000.00', 3, '15:40:09', '2020-11-18'),
(52, '9000.00', 1, '15:41:28', '2020-11-18'),
(53, '2400.00', 1, '11:18:29', '2020-11-19'),
(54, '1000.00', 1, '11:20:17', '2020-11-19'),
(55, '500.00', 1, '11:23:50', '2020-11-19'),
(56, '800.00', 1, '11:25:56', '2020-11-19'),
(57, '800.00', 1, '11:28:05', '2020-11-19'),
(58, '800.00', 1, '11:30:39', '2020-11-19'),
(59, '800.00', 1, '11:32:58', '2020-11-19'),
(60, '1000.00', 1, '11:37:02', '2020-11-19'),
(61, '800.00', 1, '11:40:41', '2020-11-19'),
(62, '800.00', 1, '11:43:09', '2020-11-19'),
(63, '800.00', 1, '11:49:28', '2020-11-19'),
(64, '800.00', 1, '11:51:31', '2020-11-19'),
(65, '800.00', 1, '12:32:46', '2020-11-19'),
(66, '800.00', 6, '06:06:14', '2023-08-11'),
(67, '800.00', 6, '01:09:55', '2023-11-01'),
(68, '2401.00', 6, '10:10:17', '2024-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `orders_item`
--

CREATE TABLE `orders_item` (
  `id_orders_item` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `amount_on_orders` int(11) NOT NULL,
  `price_on_orders` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_item`
--

INSERT INTO `orders_item` (`id_orders_item`, `id_orders`, `id_item`, `amount_on_orders`, `price_on_orders`) VALUES
(4, 2, 6, 2, '1600.00'),
(5, 2, 5, 3, '2400.00'),
(6, 2, 4, 1, '800.00'),
(7, 2, 1, 1, '800.00'),
(8, 3, 6, 2, '1600.00'),
(9, 3, 5, 3, '2400.00'),
(10, 3, 4, 1, '800.00'),
(11, 3, 1, 1, '800.00'),
(12, 4, 1, 1, '800.00'),
(13, 5, 1, 1, '800.00'),
(15, 8, 1, 1, '800.00'),
(23, 16, 1, 1, '800.00'),
(24, 16, 6, 1, '800.00'),
(27, 18, 15, 1, '800.00'),
(28, 19, 5, 2, '1600.00'),
(29, 19, 14, 1, '800.00'),
(43, 31, 14, 1, '800.00'),
(44, 32, 18, 1, '3000.00'),
(45, 32, 15, 1, '800.00'),
(46, 33, 3, 1, '800.00'),
(47, 33, 14, 1, '800.00'),
(48, 34, 21, 1, '500.00'),
(49, 34, 22, 1, '500.00'),
(50, 34, 20, 1, '500.00'),
(51, 34, 19, 1, '500.00'),
(52, 34, 23, 1, '500.00'),
(53, 35, 23, 1, '500.00'),
(54, 35, 25, 1, '1000.00'),
(55, 36, 26, 1, '1000.00'),
(56, 36, 24, 1, '1000.00'),
(57, 37, 1, 1, '800.00'),
(58, 37, 20, 1, '500.00'),
(59, 37, 22, 2, '1000.00'),
(60, 38, 14, 1, '800.00'),
(61, 38, 25, 1, '1000.00'),
(62, 38, 26, 1, '1000.00'),
(63, 38, 18, 1, '3000.00'),
(64, 39, 22, 6, '3000.00'),
(65, 40, 19, 5, '2500.00'),
(66, 40, 26, 2, '2000.00'),
(67, 41, 5, 1, '800.00'),
(68, 41, 18, 1, '3000.00'),
(69, 42, 6, 3, '2101.50'),
(70, 42, 14, 2, '1600.00'),
(71, 42, 18, 1, '3000.00'),
(72, 43, 22, 2, '1000.00'),
(73, 44, 3, 1, '800.00'),
(74, 44, 5, 1, '800.00'),
(75, 44, 15, 1, '800.00'),
(76, 45, 25, 2, '2000.00'),
(77, 46, 19, 1, '500.00'),
(78, 47, 24, 1, '1000.00'),
(79, 48, 21, 2, '1000.00'),
(80, 49, 5, 6, '4800.00'),
(81, 50, 18, 1, '3000.00'),
(82, 50, 21, 1, '500.00'),
(83, 50, 24, 1, '1000.00'),
(84, 51, 26, 1, '1000.00'),
(85, 51, 24, 1, '1000.00'),
(86, 52, 18, 3, '9000.00'),
(87, 53, 15, 3, '2400.00'),
(88, 54, 24, 1, '1000.00'),
(89, 55, 20, 1, '500.00'),
(90, 56, 1, 1, '800.00'),
(91, 57, 1, 1, '800.00'),
(92, 58, 15, 1, '800.00'),
(93, 59, 5, 1, '800.00'),
(94, 60, 20, 2, '1000.00'),
(95, 61, 3, 1, '800.00'),
(96, 62, 3, 1, '800.00'),
(97, 63, 5, 1, '800.00'),
(98, 64, 3, 1, '800.00'),
(99, 65, 14, 1, '800.00'),
(100, 66, 1, 1, '800.00'),
(101, 67, 1, 1, '800.00'),
(102, 68, 6, 2, '1401.00'),
(103, 68, 25, 1, '1000.00');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `id_sale` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `active` set('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id_sale`, `name`, `description`, `image`, `active`) VALUES
(1, 'Jesenja akcija majici', 'Majice na popustu 30%', '1sale.jpg', '1'),
(2, 'Jesenja akcija majici', 'Majice na popustu 30%', '1sale.jpg', '1'),
(3, 'Jesenja akcija majici', 'Majice na popustu 30%', '1sale.jpg', '1'),
(4, 'Jesenja akcija majici', 'Majice na popustu 30%', '1sale.jpg', '0'),
(7, 'Snizenje dukserica', 'Opis', '7sale.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id_session` int(11) NOT NULL,
  `session_id_number` varchar(255) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_item` int(11) NOT NULL,
  `time` time NOT NULL DEFAULT current_timestamp(),
  `date` date NOT NULL DEFAULT current_timestamp(),
  `browser` varchar(255) DEFAULT NULL,
  `ip_address` varchar(35) NOT NULL DEFAULT '127.0.0.1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id_session`, `session_id_number`, `id_user`, `id_item`, `time`, `date`, `browser`, `ip_address`) VALUES
(1, 'd430chq8d015l41ablm2b9ldu4', NULL, 15, '17:19:00', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(2, 'd430chq8d015l41ablm2b9ldu4', NULL, 1, '17:19:12', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(3, 'd430chq8d015l41ablm2b9ldu4', 3, 5, '17:20:40', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(4, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:20:44', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(5, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:25:11', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(6, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:25:39', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(7, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:25:58', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(8, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:27:25', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(9, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:27:57', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(10, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:28:51', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(11, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:29:09', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(12, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:29:21', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(13, 'd430chq8d015l41ablm2b9ldu4', 3, 3, '17:29:30', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(14, 'd430chq8d015l41ablm2b9ldu4', 3, 15, '18:02:47', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(15, 'd430chq8d015l41ablm2b9ldu4', 3, 15, '18:03:19', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(16, 'd430chq8d015l41ablm2b9ldu4', 3, 15, '18:04:30', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(17, 'd430chq8d015l41ablm2b9ldu4', 3, 6, '21:04:43', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(18, 'qhfsvupn51b1ht0vckkr943c90', NULL, 1, '21:04:51', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(19, 'qhfsvupn51b1ht0vckkr943c90', NULL, 3, '21:04:56', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(20, 'qhfsvupn51b1ht0vckkr943c90', NULL, 14, '21:05:07', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(21, 'qhfsvupn51b1ht0vckkr943c90', NULL, 15, '21:05:12', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(22, 'qhfsvupn51b1ht0vckkr943c90', NULL, 15, '21:05:16', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(23, 'qhfsvupn51b1ht0vckkr943c90', NULL, 15, '21:07:14', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(24, 'qhfsvupn51b1ht0vckkr943c90', NULL, 14, '21:07:24', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(25, 'qhfsvupn51b1ht0vckkr943c90', NULL, 1, '21:07:27', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(26, 'qhfsvupn51b1ht0vckkr943c90', NULL, 1, '21:08:27', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(27, 'qhfsvupn51b1ht0vckkr943c90', NULL, 14, '21:08:29', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(28, 'qhfsvupn51b1ht0vckkr943c90', NULL, 15, '21:08:32', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(29, 'qhfsvupn51b1ht0vckkr943c90', NULL, 3, '21:08:34', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(30, 'qhfsvupn51b1ht0vckkr943c90', NULL, 1, '21:11:25', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(31, 'qhfsvupn51b1ht0vckkr943c90', NULL, 15, '21:11:29', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(32, 'qhfsvupn51b1ht0vckkr943c90', NULL, 4, '21:11:41', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(33, 'qhfsvupn51b1ht0vckkr943c90', NULL, 6, '21:14:52', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(34, 'qhfsvupn51b1ht0vckkr943c90', NULL, 14, '21:15:04', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(35, 'qhfsvupn51b1ht0vckkr943c90', NULL, 1, '21:15:09', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(36, '', NULL, 1, '21:15:20', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(37, 'nntdno1goc2348tnuq0q6jko4t', NULL, 4, '21:15:25', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(38, 'nntdno1goc2348tnuq0q6jko4t', NULL, 5, '21:15:28', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(39, 'nntdno1goc2348tnuq0q6jko4t', NULL, 6, '21:15:45', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(40, 'nntdno1goc2348tnuq0q6jko4t', NULL, 3, '21:15:50', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(41, 'nntdno1goc2348tnuq0q6jko4t', NULL, 6, '21:15:55', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(42, 'nntdno1goc2348tnuq0q6jko4t', NULL, 4, '21:16:09', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(43, 'nntdno1goc2348tnuq0q6jko4t', NULL, 3, '21:18:10', '2020-11-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(44, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '13:02:40', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(45, 'nntdno1goc2348tnuq0q6jko4t', 3, 3, '13:02:57', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(46, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '13:03:05', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(47, 'nntdno1goc2348tnuq0q6jko4t', 3, 3, '13:03:16', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(48, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '13:03:18', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(49, 'nntdno1goc2348tnuq0q6jko4t', 3, 1, '13:08:12', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(50, 'nntdno1goc2348tnuq0q6jko4t', 3, 3, '13:08:20', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(51, 'nntdno1goc2348tnuq0q6jko4t', 3, 3, '13:09:24', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(52, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '13:25:57', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(53, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '13:25:59', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(54, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '13:26:10', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(55, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '13:27:10', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(56, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '13:31:57', '2020-11-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(57, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '17:19:33', '2020-11-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(58, 'nntdno1goc2348tnuq0q6jko4t', 3, 14, '11:14:15', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(59, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '11:35:51', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(60, 'nntdno1goc2348tnuq0q6jko4t', 3, 14, '11:36:03', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(61, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '11:36:08', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(62, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '13:50:22', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(63, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '13:50:27', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(64, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '14:04:08', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(65, 'nntdno1goc2348tnuq0q6jko4t', 3, 4, '15:25:35', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(66, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '15:25:37', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(67, 'nntdno1goc2348tnuq0q6jko4t', 3, 14, '15:25:39', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(68, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '15:48:25', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(69, 'nntdno1goc2348tnuq0q6jko4t', 3, 3, '17:06:20', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(70, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '17:06:24', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(71, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '17:06:26', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(72, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '17:06:28', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(73, 'nntdno1goc2348tnuq0q6jko4t', 3, 14, '17:06:29', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(74, 'nntdno1goc2348tnuq0q6jko4t', 3, 15, '17:41:45', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(75, 'nntdno1goc2348tnuq0q6jko4t', 3, 18, '17:41:49', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(76, 'nntdno1goc2348tnuq0q6jko4t', 3, 14, '17:41:52', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(77, 'nntdno1goc2348tnuq0q6jko4t', 3, 14, '17:47:45', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(78, 'nntdno1goc2348tnuq0q6jko4t', NULL, 1, '17:48:02', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(79, '3tan0q40a7tdfk5brcd3r7gr94', 3, 15, '17:55:04', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(80, '3tan0q40a7tdfk5brcd3r7gr94', 3, 1, '17:55:10', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(81, '3tan0q40a7tdfk5brcd3r7gr94', 3, 6, '17:55:13', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(82, '3tan0q40a7tdfk5brcd3r7gr94', 3, 4, '17:55:15', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(83, '3tan0q40a7tdfk5brcd3r7gr94', 3, 14, '17:55:23', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(84, '3tan0q40a7tdfk5brcd3r7gr94', 3, 18, '17:55:28', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(85, '3tan0q40a7tdfk5brcd3r7gr94', 3, 5, '18:34:05', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(86, '3tan0q40a7tdfk5brcd3r7gr94', 3, 5, '18:39:28', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(87, '3tan0q40a7tdfk5brcd3r7gr94', 3, 4, '18:39:35', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(88, '3tan0q40a7tdfk5brcd3r7gr94', 3, 18, '18:39:37', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(89, '3tan0q40a7tdfk5brcd3r7gr94', 3, 18, '18:54:20', '2020-11-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(90, '3tan0q40a7tdfk5brcd3r7gr94', 3, 18, '17:38:31', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(91, '3tan0q40a7tdfk5brcd3r7gr94', 3, 18, '17:38:42', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(92, '3tan0q40a7tdfk5brcd3r7gr94', 3, 18, '17:38:48', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(93, '3tan0q40a7tdfk5brcd3r7gr94', 3, 15, '17:49:21', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(94, '3tan0q40a7tdfk5brcd3r7gr94', 3, 3, '17:50:01', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(95, '3tan0q40a7tdfk5brcd3r7gr94', 3, 4, '17:51:06', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(96, '3tan0q40a7tdfk5brcd3r7gr94', 3, 4, '17:51:53', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(97, '3tan0q40a7tdfk5brcd3r7gr94', 3, 4, '17:54:54', '2020-11-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(98, '3tan0q40a7tdfk5brcd3r7gr94', 3, 15, '14:00:40', '2020-11-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(99, '3tan0q40a7tdfk5brcd3r7gr94', 3, 15, '14:00:42', '2020-11-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(100, '3tan0q40a7tdfk5brcd3r7gr94', NULL, 15, '14:01:02', '2020-11-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(101, '3tan0q40a7tdfk5brcd3r7gr94', NULL, 1, '14:01:30', '2020-11-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(102, '3tan0q40a7tdfk5brcd3r7gr94', NULL, 6, '14:01:35', '2020-11-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(103, '3tan0q40a7tdfk5brcd3r7gr94', NULL, 15, '12:12:48', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(104, '3tan0q40a7tdfk5brcd3r7gr94', NULL, 6, '12:12:54', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(105, '3tan0q40a7tdfk5brcd3r7gr94', NULL, 6, '12:12:56', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(106, '3tan0q40a7tdfk5brcd3r7gr94', 3, 1, '12:14:53', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(107, '3tan0q40a7tdfk5brcd3r7gr94', 3, 1, '12:28:30', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(108, '3tan0q40a7tdfk5brcd3r7gr94', 3, 5, '12:49:45', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(109, '3tan0q40a7tdfk5brcd3r7gr94', 3, 15, '12:49:54', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(110, '3tan0q40a7tdfk5brcd3r7gr94', 3, 5, '12:57:01', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(111, '3tan0q40a7tdfk5brcd3r7gr94', 3, 1, '12:58:03', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(112, '3tan0q40a7tdfk5brcd3r7gr94', 3, 15, '12:58:10', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(113, '3tan0q40a7tdfk5brcd3r7gr94', 3, 6, '12:58:15', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(114, '3tan0q40a7tdfk5brcd3r7gr94', 3, 1, '12:58:55', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(115, '3tan0q40a7tdfk5brcd3r7gr94', 3, 6, '12:58:57', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(116, '3tan0q40a7tdfk5brcd3r7gr94', 3, 4, '12:58:58', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(117, '3tan0q40a7tdfk5brcd3r7gr94', 3, 1, '12:59:00', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(118, '3tan0q40a7tdfk5brcd3r7gr94', 3, 5, '12:59:02', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(119, '3tan0q40a7tdfk5brcd3r7gr94', 3, 14, '12:59:04', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(120, '3tan0q40a7tdfk5brcd3r7gr94', 3, 5, '12:59:08', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(121, '3tan0q40a7tdfk5brcd3r7gr94', 3, 15, '13:21:05', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(122, '3tan0q40a7tdfk5brcd3r7gr94', 3, 14, '13:21:10', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(123, '3tan0q40a7tdfk5brcd3r7gr94', 3, 5, '13:21:12', '2020-11-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(124, 'qf3eghk0qpjqco63n61rel8tdb', NULL, 15, '00:29:39', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(125, 'qf3eghk0qpjqco63n61rel8tdb', NULL, 3, '00:29:53', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(126, 'qf3eghk0qpjqco63n61rel8tdb', NULL, 18, '00:30:05', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(127, 'qf3eghk0qpjqco63n61rel8tdb', 3, 3, '02:34:32', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(128, 'fuhddbfnkn521fr3al6fm6cctq', 3, 5, '21:59:01', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(129, 'fuhddbfnkn521fr3al6fm6cctq', 3, 6, '21:59:05', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(130, 'fuhddbfnkn521fr3al6fm6cctq', 3, 1, '21:59:11', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(131, 'fuhddbfnkn521fr3al6fm6cctq', 3, 4, '21:59:13', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(132, 'fuhddbfnkn521fr3al6fm6cctq', 3, 4, '21:59:14', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(133, 'fuhddbfnkn521fr3al6fm6cctq', 3, 1, '21:59:18', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(134, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '21:59:23', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(135, 'fuhddbfnkn521fr3al6fm6cctq', 3, 18, '21:59:32', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(136, 'fuhddbfnkn521fr3al6fm6cctq', 3, 18, '21:59:33', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(137, 'fuhddbfnkn521fr3al6fm6cctq', 3, 18, '21:59:35', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(138, 'fuhddbfnkn521fr3al6fm6cctq', 3, 18, '22:01:04', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(139, 'fuhddbfnkn521fr3al6fm6cctq', 3, 18, '22:01:06', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(140, 'fuhddbfnkn521fr3al6fm6cctq', 3, 15, '22:01:14', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(141, 'fuhddbfnkn521fr3al6fm6cctq', 3, 15, '22:01:16', '2020-11-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(142, 'fuhddbfnkn521fr3al6fm6cctq', 3, 3, '09:38:44', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(143, 'fuhddbfnkn521fr3al6fm6cctq', 3, 3, '09:38:53', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(144, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '09:38:56', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(145, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '09:39:00', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(146, 'fuhddbfnkn521fr3al6fm6cctq', 3, 3, '09:39:41', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(147, 'fuhddbfnkn521fr3al6fm6cctq', 3, 3, '09:39:45', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(148, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '09:39:48', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(149, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '09:39:51', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(150, 'fuhddbfnkn521fr3al6fm6cctq', 3, 3, '09:40:25', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(151, 'fuhddbfnkn521fr3al6fm6cctq', 3, 3, '09:40:29', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(152, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '09:40:32', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(153, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '09:40:36', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(154, 'fuhddbfnkn521fr3al6fm6cctq', 3, 19, '11:04:49', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(155, 'fuhddbfnkn521fr3al6fm6cctq', 3, 22, '11:04:56', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(156, 'fuhddbfnkn521fr3al6fm6cctq', 3, 21, '11:21:20', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(157, 'fuhddbfnkn521fr3al6fm6cctq', 3, 21, '11:21:23', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(158, 'fuhddbfnkn521fr3al6fm6cctq', 3, 22, '11:21:25', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(159, 'fuhddbfnkn521fr3al6fm6cctq', 3, 22, '11:21:27', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(160, 'fuhddbfnkn521fr3al6fm6cctq', 3, 20, '11:21:30', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(161, 'fuhddbfnkn521fr3al6fm6cctq', 3, 20, '11:21:33', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(162, 'fuhddbfnkn521fr3al6fm6cctq', 3, 19, '11:21:34', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(163, 'fuhddbfnkn521fr3al6fm6cctq', 3, 19, '11:21:36', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(164, 'fuhddbfnkn521fr3al6fm6cctq', 3, 23, '11:21:39', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(165, 'fuhddbfnkn521fr3al6fm6cctq', 3, 23, '11:21:41', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(166, 'fuhddbfnkn521fr3al6fm6cctq', 3, 5, '13:38:06', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(167, 'fuhddbfnkn521fr3al6fm6cctq', 3, 14, '13:56:30', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(168, 'fuhddbfnkn521fr3al6fm6cctq', 3, 1, '14:42:24', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(169, 'fuhddbfnkn521fr3al6fm6cctq', 3, 1, '14:45:26', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(170, 'fuhddbfnkn521fr3al6fm6cctq', 1, 23, '15:12:34', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(171, 'fuhddbfnkn521fr3al6fm6cctq', 1, 23, '15:12:37', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(172, 'fuhddbfnkn521fr3al6fm6cctq', 1, 25, '15:12:42', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(173, 'fuhddbfnkn521fr3al6fm6cctq', 1, 25, '15:12:44', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(174, 'h7ef1265jlheq5p2sc5d6gnjhq', NULL, 1, '15:28:04', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(175, 'h7ef1265jlheq5p2sc5d6gnjhq', NULL, 23, '15:28:10', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(176, 'h7ef1265jlheq5p2sc5d6gnjhq', NULL, 14, '15:28:13', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(177, 'h7ef1265jlheq5p2sc5d6gnjhq', NULL, 24, '15:28:15', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(178, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 26, '15:28:36', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(179, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 26, '15:28:40', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(180, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 24, '15:28:42', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(181, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 24, '15:28:45', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(182, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 1, '15:28:53', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(183, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 1, '15:28:56', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(184, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 20, '15:28:59', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(185, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 20, '15:29:04', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(186, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 22, '15:29:11', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(187, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 22, '15:29:14', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(188, 'h7ef1265jlheq5p2sc5d6gnjhq', 4, 22, '15:29:18', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(189, '1j924j65kt95c0pv74dgjpj4sq', 2, 14, '15:29:46', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(190, '1j924j65kt95c0pv74dgjpj4sq', 2, 14, '15:29:49', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(191, '1j924j65kt95c0pv74dgjpj4sq', 2, 25, '15:29:54', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(192, '1j924j65kt95c0pv74dgjpj4sq', 2, 25, '15:29:56', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(193, '1j924j65kt95c0pv74dgjpj4sq', 2, 26, '15:29:59', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(194, '1j924j65kt95c0pv74dgjpj4sq', 2, 26, '15:30:02', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(195, '1j924j65kt95c0pv74dgjpj4sq', 2, 18, '15:30:07', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(196, '1j924j65kt95c0pv74dgjpj4sq', 2, 18, '15:30:09', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(197, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:19', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(198, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:22', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(199, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:23', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(200, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:26', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(201, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:27', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(202, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:28', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(203, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:29', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(204, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:29', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(205, '1j924j65kt95c0pv74dgjpj4sq', 2, 22, '15:30:31', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(206, 's5kithb78dcseubjga1pc26vup', 2, 19, '15:31:55', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(207, 's5kithb78dcseubjga1pc26vup', 2, 19, '15:31:57', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(208, 's5kithb78dcseubjga1pc26vup', 2, 19, '15:31:58', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(209, 's5kithb78dcseubjga1pc26vup', 2, 19, '15:31:59', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(210, 's5kithb78dcseubjga1pc26vup', 2, 19, '15:32:00', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(211, 's5kithb78dcseubjga1pc26vup', 2, 19, '15:32:02', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(212, 's5kithb78dcseubjga1pc26vup', 2, 26, '15:32:07', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(213, 's5kithb78dcseubjga1pc26vup', 2, 26, '15:32:09', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(214, 's5kithb78dcseubjga1pc26vup', 2, 26, '15:32:10', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(215, 's5kithb78dcseubjga1pc26vup', 2, 15, '15:32:23', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(216, 's5kithb78dcseubjga1pc26vup', 2, 5, '15:32:27', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(217, 's5kithb78dcseubjga1pc26vup', 2, 5, '15:32:32', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(218, 's5kithb78dcseubjga1pc26vup', 2, 18, '15:32:36', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(219, 's5kithb78dcseubjga1pc26vup', 2, 18, '15:32:39', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(220, 'g86cl3m4jfl1fiislhd9rcncat', 1, 6, '15:33:12', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(221, 'g86cl3m4jfl1fiislhd9rcncat', 1, 6, '15:33:16', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(222, 'g86cl3m4jfl1fiislhd9rcncat', 1, 6, '15:33:17', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(223, 'g86cl3m4jfl1fiislhd9rcncat', 1, 6, '15:33:19', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(224, 'g86cl3m4jfl1fiislhd9rcncat', 1, 14, '15:33:22', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(225, 'g86cl3m4jfl1fiislhd9rcncat', 1, 14, '15:33:25', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(226, 'g86cl3m4jfl1fiislhd9rcncat', 1, 14, '15:33:27', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(227, 'g86cl3m4jfl1fiislhd9rcncat', 1, 18, '15:33:33', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(228, 'g86cl3m4jfl1fiislhd9rcncat', 1, 18, '15:33:36', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(229, 'odphbhe5q38guggvcgbqf4mkdj', NULL, 6, '15:33:54', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(230, 'odphbhe5q38guggvcgbqf4mkdj', NULL, 22, '15:34:01', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(231, 'odphbhe5q38guggvcgbqf4mkdj', NULL, 22, '15:34:04', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(232, 'odphbhe5q38guggvcgbqf4mkdj', NULL, 22, '15:34:05', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(233, '0lb1s70ukcmc9ojcp6pg94vfkc', 3, 3, '15:35:47', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(234, '0lb1s70ukcmc9ojcp6pg94vfkc', 3, 3, '15:35:51', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(235, '0lb1s70ukcmc9ojcp6pg94vfkc', 3, 5, '15:35:54', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(236, '0lb1s70ukcmc9ojcp6pg94vfkc', 3, 5, '15:35:56', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(237, '0lb1s70ukcmc9ojcp6pg94vfkc', 3, 15, '15:36:00', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(238, '0lb1s70ukcmc9ojcp6pg94vfkc', 3, 15, '15:36:03', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(239, '9833lpe76lhn5olh99tq8tff3p', 2, 25, '15:36:27', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(240, '9833lpe76lhn5olh99tq8tff3p', 2, 25, '15:36:31', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(241, '9833lpe76lhn5olh99tq8tff3p', 2, 25, '15:36:33', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(242, 'c00rs7pmtal1aram70vtqt93h6', 1, 19, '15:37:28', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(243, 'c00rs7pmtal1aram70vtqt93h6', 1, 19, '15:37:31', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(244, '6fi9n47lb3hqncs978l1b95jl8', 2, 24, '15:38:11', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(245, '6fi9n47lb3hqncs978l1b95jl8', 2, 24, '15:38:15', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(246, '0fm3b053ph1jlhnr6uj6i53qut', 3, 21, '15:38:47', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(247, '0fm3b053ph1jlhnr6uj6i53qut', 3, 21, '15:38:49', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(248, '0fm3b053ph1jlhnr6uj6i53qut', 3, 21, '15:38:51', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(249, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:01', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(250, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:04', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(251, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:05', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(252, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:06', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(253, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:08', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(254, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:09', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(255, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:11', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(256, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:12', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(257, '0fm3b053ph1jlhnr6uj6i53qut', 3, 5, '15:39:14', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(258, '0fm3b053ph1jlhnr6uj6i53qut', 3, 18, '15:39:30', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(259, '0fm3b053ph1jlhnr6uj6i53qut', 3, 18, '15:39:33', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(260, '0fm3b053ph1jlhnr6uj6i53qut', 3, 21, '15:39:35', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(261, '0fm3b053ph1jlhnr6uj6i53qut', 3, 21, '15:39:38', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(262, '0fm3b053ph1jlhnr6uj6i53qut', 3, 24, '15:39:46', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(263, '0fm3b053ph1jlhnr6uj6i53qut', 3, 24, '15:39:49', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(264, '0fm3b053ph1jlhnr6uj6i53qut', 3, 26, '15:39:58', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(265, '0fm3b053ph1jlhnr6uj6i53qut', 3, 26, '15:40:01', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(266, '0fm3b053ph1jlhnr6uj6i53qut', 3, 24, '15:40:03', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(267, '0fm3b053ph1jlhnr6uj6i53qut', 3, 24, '15:40:05', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(268, 'rh5ni4va6hca89pav9191kf5b5', 1, 18, '15:41:17', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(269, 'rh5ni4va6hca89pav9191kf5b5', 1, 18, '15:41:20', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(270, 'rh5ni4va6hca89pav9191kf5b5', 1, 18, '15:41:21', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(271, 'rh5ni4va6hca89pav9191kf5b5', 1, 18, '15:41:22', '2020-11-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(272, 'cfr1v8v5g2rrhu7f1drk5dl728', NULL, 15, '11:18:04', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(273, 'cfr1v8v5g2rrhu7f1drk5dl728', NULL, 15, '11:18:08', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(274, 'cfr1v8v5g2rrhu7f1drk5dl728', NULL, 15, '11:18:09', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(275, 'cfr1v8v5g2rrhu7f1drk5dl728', NULL, 15, '11:18:11', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(276, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 24, '11:20:07', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(277, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 24, '11:20:13', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(278, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 20, '11:23:39', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(279, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 20, '11:23:44', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(280, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 1, '11:25:48', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(281, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 1, '11:25:52', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(282, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 1, '11:27:57', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(283, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 1, '11:28:01', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(284, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 15, '11:30:28', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(285, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 15, '11:30:33', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(286, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 5, '11:32:49', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(287, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 5, '11:32:54', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(288, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 20, '11:36:49', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(289, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 20, '11:36:55', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(290, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 20, '11:36:58', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(291, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 3, '11:39:55', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(292, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 3, '11:39:59', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(293, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 3, '11:43:01', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(294, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 3, '11:43:05', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(295, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 5, '11:46:59', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(296, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 5, '11:47:04', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(297, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 3, '11:50:21', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(298, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 3, '11:50:28', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(299, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 14, '12:32:33', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(300, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 14, '12:32:38', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(301, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 1, '15:48:38', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(302, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 20, '15:48:50', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(303, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 1, '15:48:53', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(304, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 20, '15:48:56', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(305, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 19, '15:48:57', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(306, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 26, '15:49:10', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1');
INSERT INTO `session` (`id_session`, `session_id_number`, `id_user`, `id_item`, `time`, `date`, `browser`, `ip_address`) VALUES
(307, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 18, '15:49:13', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(308, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 25, '15:49:36', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(309, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 25, '15:49:40', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(310, 'cfr1v8v5g2rrhu7f1drk5dl728', 1, 25, '15:51:07', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(311, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 1, '17:15:36', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(312, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 1, '17:16:52', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(313, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 3, '17:17:34', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(314, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 25, '17:17:40', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(315, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 1, '17:17:48', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(316, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 3, '17:17:50', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(317, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 25, '17:18:17', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(318, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 1, '17:20:26', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(319, 'cfr1v8v5g2rrhu7f1drk5dl728', 3, 1, '17:44:59', '2020-11-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '127.0.0.1'),
(320, '28qh0elgnjd1g3t8i5oj1a83rl', NULL, 1, '01:24:13', '2021-08-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', '127.0.0.1'),
(321, '28qh0elgnjd1g3t8i5oj1a83rl', NULL, 1, '01:24:21', '2021-08-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', '127.0.0.1'),
(322, 'iq1h43jshviubslmonpt2psm8k', NULL, 1, '05:51:58', '2023-08-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '127.0.0.1'),
(323, 'iq1h43jshviubslmonpt2psm8k', NULL, 22, '05:52:46', '2023-08-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '127.0.0.1'),
(324, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '05:59:14', '2023-08-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '127.0.0.1'),
(325, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '05:59:33', '2023-08-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '127.0.0.1'),
(326, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '06:05:52', '2023-08-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '127.0.0.1'),
(327, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '06:05:57', '2023-08-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '127.0.0.1'),
(328, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '06:34:54', '2023-08-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', '127.0.0.1'),
(329, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '01:09:22', '2023-11-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0', '127.0.0.1'),
(330, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '01:09:26', '2023-11-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0', '127.0.0.1'),
(331, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '23:19:40', '2024-01-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(332, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '23:20:11', '2024-01-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(333, 'iq1h43jshviubslmonpt2psm8k', 6, 20, '23:20:24', '2024-01-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(334, 'iq1h43jshviubslmonpt2psm8k', 6, 23, '23:20:28', '2024-01-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(335, 'iq1h43jshviubslmonpt2psm8k', 6, 22, '23:20:34', '2024-01-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(336, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '23:20:37', '2024-01-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(337, 'iq1h43jshviubslmonpt2psm8k', 6, 4, '23:20:41', '2024-01-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(338, 'iq1h43jshviubslmonpt2psm8k', 6, 1, '09:07:08', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(339, 'iq1h43jshviubslmonpt2psm8k', 6, 6, '10:07:28', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(340, 'iq1h43jshviubslmonpt2psm8k', 6, 6, '10:07:32', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(341, 'iq1h43jshviubslmonpt2psm8k', 6, 25, '10:07:39', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(342, 'iq1h43jshviubslmonpt2psm8k', 6, 25, '10:07:43', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(343, 'iq1h43jshviubslmonpt2psm8k', 6, 6, '10:08:19', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(344, 'iq1h43jshviubslmonpt2psm8k', 6, 6, '10:08:24', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(345, 'iq1h43jshviubslmonpt2psm8k', NULL, 6, '10:14:16', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1'),
(346, 'iq1h43jshviubslmonpt2psm8k', NULL, 6, '10:14:21', '2024-01-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:122.0) Gecko/20100101 Firefox/122.0', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id_size` int(11) NOT NULL,
  `size` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id_size`, `size`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL');

-- --------------------------------------------------------

--
-- Table structure for table `type_item`
--

CREATE TABLE `type_item` (
  `id_type_item` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `id_category_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_item`
--

INSERT INTO `type_item` (`id_type_item`, `type`, `id_category_item`) VALUES
(1, 'Majice', 1),
(2, 'Dukserice', 1),
(3, 'Pantalone', 1),
(4, 'Farmerice', 1),
(5, 'Suknje', 1),
(6, 'Haljine', 1),
(7, 'Majice', 2),
(8, 'Dukserice', 2),
(9, 'Pantalone', 2),
(10, 'Farmerice', 2),
(11, 'Kiltovi', 2),
(12, 'Majice', 3),
(13, 'Dukserice', 3),
(14, 'Pantalone', 3),
(15, 'Farmerice', 3),
(16, 'Suknjice', 3),
(17, 'Haljinice', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` set('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `firstname`, `lastname`, `username`, `email`, `password`, `type`) VALUES
(1, 'Ivana', 'Jevtic', 'ivana', 'ivana.ivanovic.18@singimail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'user'),
(2, 'Filip', 'Otovic', 'filip', 'filip.otovic.18@singimail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'user'),
(3, 'Ivana', 'Jevtic', 'admin1', 'ivana.ivanovic.18@singimail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(4, 'Filip', 'Otovic', 'admin2', 'filip.otovic.18@singimail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(5, 'Petar', 'Petrovic', 'petar', 'petar@p.com', '81dc9bdb52d04dc20036dbd8313ed055', 'admin'),
(6, 'a', 'aaa', 'aaaa', 'a@a.a', '74b87337454200d4d33f80c4663dc5e5', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_item`
--
ALTER TABLE `category_item`
  ADD PRIMARY KEY (`id_category_item`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id_color`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `item_color` (`id_color`),
  ADD KEY `item_category_item` (`id_category_item`),
  ADD KEY `item_type_item` (`id_type_item`),
  ADD KEY `Item_sale` (`id_sale`);

--
-- Indexes for table `item_size`
--
ALTER TABLE `item_size`
  ADD PRIMARY KEY (`id_item_size`),
  ADD KEY `item_size_size` (`id_size`),
  ADD KEY `item_size_item` (`id_item`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`),
  ADD KEY `orders_user` (`id_user`);

--
-- Indexes for table `orders_item`
--
ALTER TABLE `orders_item`
  ADD PRIMARY KEY (`id_orders_item`),
  ADD KEY `orders_item_item` (`id_item`),
  ADD KEY `orders_item_orders` (`id_orders`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id_sale`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id_session`),
  ADD KEY `session_item` (`id_item`),
  ADD KEY `session_user` (`id_user`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id_size`);

--
-- Indexes for table `type_item`
--
ALTER TABLE `type_item`
  ADD PRIMARY KEY (`id_type_item`),
  ADD KEY `type_item_category_item` (`id_category_item`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_item`
--
ALTER TABLE `category_item`
  MODIFY `id_category_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `item_size`
--
ALTER TABLE `item_size`
  MODIFY `id_item_size` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `orders_item`
--
ALTER TABLE `orders_item`
  MODIFY `id_orders_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id_sale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id_size` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type_item`
--
ALTER TABLE `type_item`
  MODIFY `id_type_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `Item_sale` FOREIGN KEY (`id_sale`) REFERENCES `sale` (`id_sale`),
  ADD CONSTRAINT `item_category_item` FOREIGN KEY (`id_category_item`) REFERENCES `category_item` (`id_category_item`),
  ADD CONSTRAINT `item_color` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`),
  ADD CONSTRAINT `item_type_item` FOREIGN KEY (`id_type_item`) REFERENCES `type_item` (`id_type_item`);

--
-- Constraints for table `item_size`
--
ALTER TABLE `item_size`
  ADD CONSTRAINT `item_size_item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_size_size` FOREIGN KEY (`id_size`) REFERENCES `size` (`id_size`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `orders_item`
--
ALTER TABLE `orders_item`
  ADD CONSTRAINT `orders_item_item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `orders_item_orders` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`) ON DELETE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_item` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `session_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `type_item`
--
ALTER TABLE `type_item`
  ADD CONSTRAINT `type_item_category_item` FOREIGN KEY (`id_category_item`) REFERENCES `category_item` (`id_category_item`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
