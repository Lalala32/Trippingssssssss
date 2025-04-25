-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2025 at 02:33 AM
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
-- Database: `tripko_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `fare`
--

CREATE TABLE `fare` (
  `fare_id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `fare_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `festivals`
--

CREATE TABLE `festivals` (
  `festival_id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `town_id` int(11) DEFAULT NULL,
  `image_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route_terminals`
--

CREATE TABLE `route_terminals` (
  `terminal_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `town_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tourism_office`
--

CREATE TABLE `tourism_office` (
  `office_id` int(11) NOT NULL,
  `office_name` varchar(100) DEFAULT NULL,
  `head_name` varchar(100) DEFAULT NULL,
  `town_id` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tourist_spots`
--

CREATE TABLE `tourist_spots` (
  `spot_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `town_id` int(11) DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` enum('active','inactive','maintenance') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `town_id` int(11) NOT NULL,
  `town_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`town_id`, `town_name`) VALUES
(1, 'Agno'),
(2, 'Aguilar'),
(3, 'Alaminos'),
(4, 'Alcala'),
(5, 'Anda'),
(6, 'Asingan'),
(7, 'Balungao'),
(8, 'Bani'),
(9, 'Basista'),
(10, 'Bautista'),
(11, 'Bayambang'),
(12, 'Binalonan'),
(13, 'Binmaley'),
(14, 'Bolinao'),
(15, 'Bugallon'),
(16, 'Burgos'),
(17, 'Calasiao'),
(18, 'Dasol'),
(19, 'Dagupan'),
(20, 'Infanta'),
(21, 'Labrador'),
(22, 'Lingayen'),
(23, 'Mabini'),
(24, 'Malasiqui'),
(25, 'Manaoag'),
(26, 'Mangaldan'),
(27, 'Mangatarem'),
(28, 'Mapandan'),
(29, 'Natividad'),
(30, 'Pozorrubio'),
(31, 'Rosales'),
(32, 'San Carlos'),
(33, 'San Fabian'),
(34, 'San Jacinto'),
(35, 'San Manuel'),
(36, 'San Nicolas'),
(37, 'San Quintin'),
(38, 'Santa Barbara'),
(39, 'Santa Maria'),
(40, 'Santo Tomas'),
(41, 'Sison'),
(42, 'Sual'),
(43, 'Tayug'),
(44, 'Umingan'),
(45, 'Urbiztondo'),
(46, 'Urdaneta'),
(47, 'Villasis');

-- --------------------------------------------------------

--
-- Table structure for table `transportation_type`
--

CREATE TABLE `transportation_type` (
  `transport_type_id` int(11) NOT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `route_id` int(11) NOT NULL,
  `route_name` varchar(100) DEFAULT NULL,
  `origin_terminal_id` int(11) DEFAULT NULL,
  `destination_terminal_id` int(11) DEFAULT NULL,
  `transport_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  `user_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `user_type_id`, `user_status_id`) VALUES
(1, 'admin', '$2y$10$pJSv4LCr02L0ZDSYVEbpwejTjdJweCC051wL2HxKJQlQIOD9Vxgla', 1, 1),
(2, 'user', '$2y$10$fiimXr9EoK73D4M7V8/.p.QUxNiVs2oEg21pSNitH1gbGvuQUl8Da', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profile_id`, `user_id`, `first_name`, `last_name`, `email`, `contact_number`) VALUES
(1, 1, 'System', 'Administrator', 'admin@tripko.com', '09123456789');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `user_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`user_status_id`, `status_name`) VALUES
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `user_type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `type_name`) VALUES
(1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `visitors_tracking`
--

CREATE TABLE `visitors_tracking` (
  `tracking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `visitor_count` int(11) DEFAULT NULL,
  `spot_id` int(11) DEFAULT NULL,
  `festival_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fare`
--
ALTER TABLE `fare`
  ADD PRIMARY KEY (`fare_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `festivals`
--
ALTER TABLE `festivals`
  ADD PRIMARY KEY (`festival_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `route_terminals`
--
ALTER TABLE `route_terminals`
  ADD PRIMARY KEY (`terminal_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `tourism_office`
--
ALTER TABLE `tourism_office`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `tourist_spots`
--
ALTER TABLE `tourist_spots`
  ADD PRIMARY KEY (`spot_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`town_id`);

--
-- Indexes for table `transportation_type`
--
ALTER TABLE `transportation_type`
  ADD PRIMARY KEY (`transport_type_id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `origin_terminal_id` (`origin_terminal_id`),
  ADD KEY `destination_terminal_id` (`destination_terminal_id`),
  ADD KEY `transport_type_id` (`transport_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_type_id` (`user_type_id`),
  ADD KEY `user_status_id` (`user_status_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`user_status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`user_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `visitors_tracking`
--
ALTER TABLE `visitors_tracking`
  ADD PRIMARY KEY (`tracking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `spot_id` (`spot_id`),
  ADD KEY `festival_id` (`festival_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fare`
--
ALTER TABLE `fare`
  MODIFY `fare_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `festivals`
--
ALTER TABLE `festivals`
  MODIFY `festival_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `route_terminals`
--
ALTER TABLE `route_terminals`
  MODIFY `terminal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tourism_office`
--
ALTER TABLE `tourism_office`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tourist_spots`
--
ALTER TABLE `tourist_spots`
  MODIFY `spot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `town_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `transportation_type`
--
ALTER TABLE `transportation_type`
  MODIFY `transport_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `user_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visitors_tracking`
--
ALTER TABLE `visitors_tracking`
  MODIFY `tracking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fare`
--
ALTER TABLE `fare`
  ADD CONSTRAINT `fare_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `transport_route` (`route_id`);

--
-- Constraints for table `festivals`
--
ALTER TABLE `festivals`
  ADD CONSTRAINT `festivals_ibfk_1` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`);

--
-- Constraints for table `route_terminals`
--
ALTER TABLE `route_terminals`
  ADD CONSTRAINT `route_terminals_ibfk_1` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`);

--
-- Constraints for table `tourism_office`
--
ALTER TABLE `tourism_office`
  ADD CONSTRAINT `tourism_office_ibfk_1` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`);

--
-- Constraints for table `tourist_spots`
--
ALTER TABLE `tourist_spots`
  ADD CONSTRAINT `tourist_spots_ibfk_1` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`);

--
-- Constraints for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD CONSTRAINT `transport_route_ibfk_1` FOREIGN KEY (`origin_terminal_id`) REFERENCES `route_terminals` (`terminal_id`),
  ADD CONSTRAINT `transport_route_ibfk_2` FOREIGN KEY (`destination_terminal_id`) REFERENCES `route_terminals` (`terminal_id`),
  ADD CONSTRAINT `transport_route_ibfk_3` FOREIGN KEY (`transport_type_id`) REFERENCES `transportation_type` (`transport_type_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`user_status_id`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `visitors_tracking`
--
ALTER TABLE `visitors_tracking`
  ADD CONSTRAINT `visitors_tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `visitors_tracking_ibfk_2` FOREIGN KEY (`spot_id`) REFERENCES `tourist_spots` (`spot_id`),
  ADD CONSTRAINT `visitors_tracking_ibfk_3` FOREIGN KEY (`festival_id`) REFERENCES `festivals` (`festival_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
