-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2022 at 06:21 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rikimotor`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_list`
--

CREATE TABLE `brand_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand_list`
--

INSERT INTO `brand_list` (`id`, `name`, `image_path`, `delete_flag`, `status`, `date_created`, `date_updated`) VALUES
(9, 'Mobil', '', 0, 1, '2022-03-22 07:44:53', NULL),
(10, 'Aisin', '', 0, 1, '2022-03-22 07:44:59', NULL),
(11, 'Motul', '', 0, 1, '2022-03-22 07:45:08', NULL),
(12, 'Universal', '', 0, 1, '2022-03-22 07:46:06', NULL),
(13, 'SEMSPEED', '', 0, 1, '2022-03-22 07:46:21', NULL),
(14, 'Domino', '', 0, 1, '2022-03-22 07:46:32', NULL),
(15, 'Shark King', '', 0, 1, '2022-03-22 07:46:46', NULL),
(16, 'No Brand', '', 0, 1, '2022-03-22 07:47:04', NULL),
(17, 'Denso', '', 0, 1, '2022-03-22 07:51:46', NULL),
(18, 'NGK', '', 0, 1, '2022-03-22 07:51:51', NULL),
(19, 'Bosch', '', 0, 1, '2022-03-22 07:51:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `is_origin` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `client_id`, `product_id`, `quantity`, `date_added`, `is_origin`) VALUES
(16, 3, 18, 1, '2022-03-23 01:25:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Accessories', 1, 0, '2021-09-30 09:42:40'),
(2, 'Chassis', 1, 0, '2021-09-30 09:43:00'),
(3, 'Tools', 1, 0, '2021-09-30 09:43:48'),
(5, 'Tires', 1, 0, '2022-01-21 10:33:07'),
(6, 'Mugs', 1, 0, '2022-01-21 10:33:31'),
(7, 'Oils', 1, 0, '2022-01-21 10:33:47'),
(8, 'Machine Parts', 1, 0, '2022-01-21 10:34:07'),
(9, 'Body Parts', 1, 0, '2022-01-21 13:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `status`, `delete_flag`, `date_created`, `date_added`) VALUES
(1, 'John', 'D', 'Smith', 'Male', '09123456897', 'This is my sample address only', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 1, 1, '2022-01-24 13:33:44', '2022-03-29 06:48:02'),
(2, 'James', 'Kenneth', 'Male', '', '09455926038', 'Laguna', 'jklaurinaria@email.com', 'e6fb6de2611a271a2ad8917a81ae3dce', 1, 0, '2022-03-22 08:08:15', NULL),
(3, 'Dennis Adrian ', 'Cruzata', 'Male', '', '09217150550', 'BLK 4 LOT 8 EMERALD ST. CAMELLA ANNEX BARANGAY CUYAB SPL.', 'cabalteadennisadrian@gmail.com', 'b45908343cd49253b1f717f737d57800', 1, 0, '2022-03-23 01:21:13', NULL),
(4, 'sorar', 'sdf', 'Female', '', '12345646546', 'asdasdasdasda', 'sorar384@gmail.com', '1255670d2fb605f951421a42b7ecd2b9', 1, 0, '2022-03-29 04:00:31', '2022-03-29 06:50:43'),
(5, 'sample', 'sample', 'Male', '', 'sample', 'sample', 'sample@sample.com', '202cb962ac59075b964b07152d234b70', 1, 0, '2022-04-07 00:18:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mechanics_list`
--

CREATE TABLE `mechanics_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mechanics_list`
--

INSERT INTO `mechanics_list` (`id`, `name`, `contact`, `email`, `status`, `date_created`) VALUES
(2, 'Luis Manglo', '09112355799', 'luismanglo@email.com', 1, '2021-09-30 10:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `is_origin` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `date_added`, `is_origin`) VALUES
(13, 9, 9, 1, '2022-03-22 08:15:30', 1),
(14, 10, 20, 1, '2022-03-29 04:01:08', 1),
(15, 11, 18, 1, '2022-03-29 06:57:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1 = packed, 2 = for delivery, 3 = on the way, 4 = delivered, 5=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `is_origin` int(1) NOT NULL DEFAULT 1,
  `total_origin` float DEFAULT NULL,
  `total_non` float DEFAULT NULL,
  `attached_payment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `ref_code`, `client_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`, `is_origin`, `total_origin`, `total_non`, `attached_payment`) VALUES
(9, '202203-00001', 2, 130, 'Laguna', 0, '2022-03-22 08:15:30', '2022-03-22 08:15:30', 1, NULL, NULL, NULL),
(10, '202203-00002', 4, 700, 'asdasdasdasda', 0, '2022-03-29 04:01:08', '2022-03-29 04:01:08', 1, NULL, NULL, NULL),
(11, '202203-00003', 2, 170, 'Laguna', 5, '2022-03-29 06:57:34', '2022-04-03 22:17:13', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `models` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `brand_id`, `category_id`, `name`, `models`, `description`, `price`, `status`, `image_path`, `delete_flag`, `date_created`, `date_updated`) VALUES
(8, 10, 7, 'Aisin 10W40 Semi Synthetic', 'All Model', '&lt;p&gt;Semi Synthetic Oil for Motorcycle&lt;/p&gt;', 385, 1, 'uploads/products/8.png?v=1647935610', 0, '2022-03-22 07:53:30', '2022-03-22 07:53:30'),
(9, 19, 8, 'Bosch Spark Plug', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 130, 1, 'uploads/products/9.png?v=1647935763', 0, '2022-03-22 07:56:03', '2022-03-22 07:56:03'),
(10, 11, 7, 'Motul Oil 4T GP Matic 10W/40 ', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 320, 1, 'uploads/products/10.png?v=1647935842', 0, '2022-03-22 07:57:22', '2022-03-22 07:57:22'),
(11, 12, 9, 'Stainless Universal Handlebar ', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 250, 1, 'uploads/products/11.png?v=1647935885', 0, '2022-03-22 07:58:05', '2022-03-22 07:58:05'),
(12, 12, 9, 'Handlebar Fat Bar w/ Riser ', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 800, 1, 'uploads/products/12.png?v=1647935924', 0, '2022-03-22 07:58:44', '2022-03-22 07:58:44'),
(13, 13, 9, 'Clip Ons Handlebar', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 950, 1, 'uploads/products/13.png?v=1647935963', 0, '2022-03-22 07:59:23', '2022-03-22 07:59:23'),
(14, 12, 9, 'Brake Lever', 'Depends on Compatibility of Motorcycle if Measured', '&lt;p&gt;NA&lt;/p&gt;', 200, 1, 'uploads/products/14.png?v=1647936016', 0, '2022-03-22 08:00:16', '2022-03-22 08:00:16'),
(15, 16, 9, '      Racing Boy Brake Lever & Clutch Lever ', 'Depends on Compatibility of Motorcycle if Measured', '&lt;p&gt;NA&lt;/p&gt;', 1000, 1, 'uploads/products/15.png?v=1647936071', 1, '2022-03-22 08:01:11', '2022-03-29 07:29:57'),
(16, 12, 1, 'Universal Classic Handle grip ', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 200, 1, 'uploads/products/16.png?v=1647936117', 0, '2022-03-22 08:01:57', '2022-03-22 08:01:57'),
(17, 12, 9, 'Universal Brake Lever Master ', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 200, 1, 'uploads/products/17.png?v=1647936165', 0, '2022-03-22 08:02:45', '2022-03-22 08:02:45'),
(18, 17, 9, 'Denso Spark plug', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 170, 1, 'uploads/products/18.png?v=1647936201', 0, '2022-03-22 08:03:21', '2022-03-22 08:03:21'),
(19, 18, 9, 'NGK Spark plug ', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 150, 1, 'uploads/products/19.png?v=1647936226', 0, '2022-03-22 08:03:46', '2022-03-22 08:03:46'),
(20, 12, 9, '     Universal Gauge/speedometer ', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 700, 1, 'uploads/products/20.png?v=1647936288', 1, '2022-03-22 08:04:48', '2022-03-29 07:30:44'),
(21, 12, 9, 'Universal Gauge for Classic Motorcycle', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 1500, 1, 'uploads/products/21.png?v=1647936325', 0, '2022-03-22 08:05:25', '2022-03-22 08:05:25'),
(22, 12, 9, 'Universal LCD Digital Gauge', 'All Model', '&lt;p&gt;NA&lt;/p&gt;', 1800, 1, 'uploads/products/22.png?v=1647936368', 0, '2022-03-22 08:06:08', '2022-03-22 08:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `request_meta`
--

CREATE TABLE `request_meta` (
  `request_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_meta`
--

INSERT INTO `request_meta` (`request_id`, `meta_field`, `meta_value`) VALUES
(7, 'vehicle_type', 'Motorcycle'),
(7, 'vehicle_name', 'ADV'),
(7, 'vehicle_registration_number', '9068VIN'),
(7, 'vehicle_model', 'Honda'),
(7, 'service_id', '2'),
(7, 'pickup_address', ''),
(9, 'vehicle_type', 'Motorcycle'),
(9, 'vehicle_name', 'ADV'),
(9, 'vehicle_registration_number', '9068VIN'),
(9, 'vehicle_model', 'Honda'),
(9, 'service_id', '1'),
(9, 'pickup_address', '');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Change Oil', '&lt;p style=&quot;text-align: justify; &quot;&gt;Oil change is very important depends on the mileage of your motorcycle&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;text-align: justify; &quot;&gt;500km&lt;/p&gt;&lt;p style=&quot;text-align: justify; &quot;&gt;1000km&lt;/p&gt;&lt;p style=&quot;text-align: justify; &quot;&gt;1500km and so on...&lt;/p&gt;', 1, 0, '2021-09-30 14:11:21'),
(2, 'Overall Checkup', '&lt;p style=&quot;text-align: justify; &quot;&gt;We check your overall motorcycle condition&lt;/p&gt;', 1, 0, '2021-09-30 14:11:38'),
(3, 'Engine Tune up', '&lt;p style=&quot;text-align: justify; &quot;&gt;We tune your engine for performance&lt;/p&gt;', 1, 0, '2021-09-30 14:12:03'),
(4, 'Tire Replacement', '&lt;p style=&quot;text-align: justify; &quot;&gt;Tire replacements depends on the thread of your motorcycle&lt;/p&gt;', 1, 0, '2021-09-30 14:12:24'),
(5, 'Modification', '&lt;p&gt;We modify your motorcycle that suits your style&lt;/p&gt;', 1, 0, '2022-04-03 22:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `service_type` text NOT NULL,
  `mechanic_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `title` varchar(20) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL,
  `service_amount` float NOT NULL DEFAULT 0,
  `attached_payment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`id`, `client_id`, `service_type`, `mechanic_id`, `status`, `date_created`, `title`, `start_event`, `end_event`, `service_amount`, `attached_payment`) VALUES
(7, 2, 'Drop Off', NULL, 0, '2022-03-22 08:09:45', 'Drop Off', '2022-03-16 00:00:00', '2022-03-17 09:10:51', 0, NULL),
(9, 2, 'Drop Off', NULL, 0, '2022-03-30 19:04:17', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= IN, 2= Out',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `quantity`, `type`, `date_created`) VALUES
(9, 15, 5, 1, '2022-03-22 08:13:42'),
(10, 20, 5, 1, '2022-03-22 08:13:49'),
(11, 8, 5, 1, '2022-03-22 08:13:58'),
(12, 9, 5, 1, '2022-03-22 08:14:05'),
(13, 14, 5, 1, '2022-03-22 08:14:12'),
(14, 13, 5, 1, '2022-03-22 08:14:20'),
(15, 18, 5, 1, '2022-03-22 08:14:27'),
(16, 12, 5, 1, '2022-03-22 08:14:35'),
(17, 10, 5, 1, '2022-03-22 08:14:42'),
(18, 19, 5, 1, '2022-03-22 08:14:50'),
(19, 11, 5, 1, '2022-04-03 22:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'RIKIMOTORWORKZ'),
(6, 'short_name', 'RIKIMOTORWORKZ'),
(11, 'logo', 'uploads/1642728480_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1647934980_repair.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_list`
--
ALTER TABLE `brand_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indexes for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_list`
--
ALTER TABLE `brand_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mechanics_list`
--
ALTER TABLE `mechanics_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `request_meta`
--
ALTER TABLE `request_meta`
  ADD CONSTRAINT `request_meta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `service_requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_requests_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics_list` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `stock_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
