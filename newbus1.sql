-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2024 at 06:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newbus1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--
-- create database newbus1;
use `newbus1`;

select * from user;

select * from bus;

select * from route;

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `arrival_time` time(6) DEFAULT NULL,
  `availabe_seats` int(11) DEFAULT NULL,
  `bus_name` varchar(255) DEFAULT NULL,
  `bus_type` varchar(255) DEFAULT NULL,
  `departure_time` time(6) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `route_form` varchar(255) DEFAULT NULL,
  `route_to` varchar(255) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `route_route_id` int(11) DEFAULT NULL,
  `route_from` varchar(255) DEFAULT NULL,
  `available_seats` int(11) DEFAULT NULL,
  `ticket_charges` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_seq`
--

CREATE TABLE `bus_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_seq`
--

INSERT INTO `bus_seq` (`next_val`) VALUES
(401),
(401);

-- --------------------------------------------------------

--
-- Table structure for table `collage`
--

CREATE TABLE `collage` (
  `collageId` bigint(20) NOT NULL,
  `collageAddress` varchar(255) DEFAULT NULL,
  `collageName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collage`
--

INSERT INTO `collage` (`collageId`, `collageAddress`, `collageName`) VALUES
(52, 'Address 1', 'Collage 1'),
(53, 'Address 2', 'Collage 2'),
(102, 'Address 1', 'Collage 1'),
(103, 'Address 2', 'Collage 2'),
(152, 'Address 1', 'Collage 1'),
(153, 'Address 2', 'Collage 2'),
(202, 'Address 1', 'Collage 1'),
(203, 'Address 2', 'Collage 2'),
(252, 'Address 1', 'Collage 1'),
(253, 'Address 2', 'Collage 2');

-- --------------------------------------------------------

--
-- Table structure for table `collage_seq`
--

CREATE TABLE `collage_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collage_seq`
--

INSERT INTO `collage_seq` (`next_val`) VALUES
(351),
(351);

-- --------------------------------------------------------

--
-- Table structure for table `current_user_session`
--

CREATE TABLE `current_user_session` (
  `user_id` int(11) NOT NULL,
  `local_date_time` datetime(6) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empId` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empId`, `address`, `name`, `salary`, `emp_id`, `gender`) VALUES
(1, 'sre', 'raman', 22000, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_address`
--

CREATE TABLE `employee_address` (
  `emp_id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_seq`
--

CREATE TABLE `employee_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_seq`
--

INSERT INTO `employee_seq` (`next_val`) VALUES
(151),
(151);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `driver_rating` int(11) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL,
  `overall_rating` int(11) DEFAULT NULL,
  `service_rating` int(11) DEFAULT NULL,
  `bus_bus_id` int(11) DEFAULT NULL,
  `user_user_login_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_seq`
--

CREATE TABLE `feedback_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback_seq`
--

INSERT INTO `feedback_seq` (`next_val`) VALUES
(1),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `playerId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `skill` varchar(255) DEFAULT NULL,
  `team_teamId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`playerId`, `name`, `price`, `skill`, `team_teamId`) VALUES
(1, 'John Doe', 10000, 'Batsman', NULL),
(2, 'John Doe', 10000, 'Batsman', NULL),
(3, 'Jane Smith', 8000, 'Bowler', NULL),
(52, 'John Doe', 10000, 'Batsman', NULL),
(53, 'Jane Smith', 8000, 'Bowler', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `player_seq`
--

CREATE TABLE `player_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_seq`
--

INSERT INTO `player_seq` (`next_val`) VALUES
(151),
(151);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `reservation_status` varchar(255) DEFAULT NULL,
  `reservation_time` time(6) DEFAULT NULL,
  `reservation_type` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `bus_bus_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_user_login_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_seq`
--

CREATE TABLE `reservation_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_seq`
--

INSERT INTO `reservation_seq` (`next_val`) VALUES
(801),
(801);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `distance` int(11) DEFAULT NULL,
  `route_from` varchar(255) DEFAULT NULL,
  `route_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route_seq`
--

CREATE TABLE `route_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_seq`
--

INSERT INTO `route_seq` (`next_val`) VALUES
(301),
(301);

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

CREATE TABLE `sport` (
  `sportId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`sportId`, `name`) VALUES
(1, 'Cricket'),
(2, 'Cricket'),
(3, 'Football'),
(52, 'Cricket'),
(53, 'Football');

-- --------------------------------------------------------

--
-- Table structure for table `sport_seq`
--

CREATE TABLE `sport_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sport_seq`
--

INSERT INTO `sport_seq` (`next_val`) VALUES
(151),
(151);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentRoll` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileNumber` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `collage_collageId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentRoll`, `email`, `mobileNumber`, `studentName`, `collage_collageId`) VALUES
(1, 'Email 1', 'Mobile 1', 'Student 1', 52),
(2, 'Email 1', 'Mobile 1', 'Student 1', 53),
(3, 'Email 2', 'Mobile 2', 'Student 2', 52),
(4, 'Email 2', 'Mobile 2', 'Student 2', 53),
(5, 'Email 3', 'Mobile 3', 'Student 3', 52),
(6, 'Email 3', 'Mobile 3', 'Student 3', 53),
(7, 'Email 4', 'Mobile 4', 'Student 4', 52),
(8, 'Email 4', 'Mobile 4', 'Student 4', 53),
(9, 'Email 1', 'Mobile 1', 'Student 1', 102),
(10, 'Email 1', 'Mobile 1', 'Student 1', 103),
(11, 'Email 2', 'Mobile 2', 'Student 2', 102),
(12, 'Email 2', 'Mobile 2', 'Student 2', 103),
(13, 'Email 3', 'Mobile 3', 'Student 3', 102),
(14, 'Email 3', 'Mobile 3', 'Student 3', 103),
(15, 'Email 4', 'Mobile 4', 'Student 4', 102),
(16, 'Email 4', 'Mobile 4', 'Student 4', 103),
(17, 'Email 1', 'Mobile 1', 'Student 1', 152),
(18, 'Email 1', 'Mobile 1', 'Student 1', 153),
(19, 'Email 2', 'Mobile 2', 'Student 2', 152),
(20, 'Email 2', 'Mobile 2', 'Student 2', 153),
(21, 'Email 3', 'Mobile 3', 'Student 3', 152),
(22, 'Email 3', 'Mobile 3', 'Student 3', 153),
(23, 'Email 4', 'Mobile 4', 'Student 4', 152),
(24, 'Email 4', 'Mobile 4', 'Student 4', 153),
(25, 'Email 1', 'Mobile 1', 'Student 1', 202),
(26, 'Email 1', 'Mobile 1', 'Student 1', 203),
(27, 'Email 2', 'Mobile 2', 'Student 2', 202),
(28, 'Email 2', 'Mobile 2', 'Student 2', 203),
(29, 'Email 3', 'Mobile 3', 'Student 3', 202),
(30, 'Email 3', 'Mobile 3', 'Student 3', 203),
(31, 'Email 4', 'Mobile 4', 'Student 4', 202),
(32, 'Email 4', 'Mobile 4', 'Student 4', 203),
(33, 'Email 1', 'Mobile 1', 'Student 1', 252),
(34, 'Email 1', 'Mobile 1', 'Student 1', 253),
(35, 'Email 2', 'Mobile 2', 'Student 2', 252),
(36, 'Email 2', 'Mobile 2', 'Student 2', 253),
(37, 'Email 3', 'Mobile 3', 'Student 3', 252),
(38, 'Email 3', 'Mobile 3', 'Student 3', 253),
(39, 'Email 4', 'Mobile 4', 'Student 4', 252),
(40, 'Email 4', 'Mobile 4', 'Student 4', 253);

-- --------------------------------------------------------

--
-- Table structure for table `student_table`
--

CREATE TABLE `student_table` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_table`
--

INSERT INTO `student_table` (`id`, `address`, `course`, `email`, `level`) VALUES
(2, 'sre', 'sb101', 'rs@gmail.com', 6);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamId` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`teamId`, `country`, `name`) VALUES
(1, 'Country A', 'Team A'),
(2, 'Country B', 'Team B'),
(52, 'Country A', 'Team A'),
(53, 'Country B', 'Team B');

-- --------------------------------------------------------

--
-- Table structure for table `team_seq`
--

CREATE TABLE `team_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_seq`
--

INSERT INTO `team_seq` (`next_val`) VALUES
(151),
(151);

-- --------------------------------------------------------

--
-- Table structure for table `team_sport`
--

CREATE TABLE `team_sport` (
  `teams_teamId` int(11) NOT NULL,
  `sports_sportId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_login_id` int(11) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `reservation_reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(301);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `FK34202857f4x6hu34lxlbh7y69` (`route_route_id`);

--
-- Indexes for table `collage`
--
ALTER TABLE `collage`
  ADD PRIMARY KEY (`collageId`);

--
-- Indexes for table `current_user_session`
--
ALTER TABLE `current_user_session`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD UNIQUE KEY `UK_r88sg8b6tlok026lw3mrwt668` (`bus_bus_id`),
  ADD UNIQUE KEY `UK_7c9bdhspllm9go6dnx9s63p9p` (`user_user_login_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`playerId`),
  ADD KEY `FKpcnvwokx5gf0pi5gkg9k5ifvu` (`team_teamId`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `FK1cwae71jt1ek8y0yhcdshjuta` (`bus_bus_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`sportId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentRoll`),
  ADD KEY `FKl95qutgsd7j6qcubw8k83is0d` (`collage_collageId`);

--
-- Indexes for table `student_table`
--
ALTER TABLE `student_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamId`);

--
-- Indexes for table `team_sport`
--
ALTER TABLE `team_sport`
  ADD KEY `FK7sv9tkvd8uhvp961e1913d39r` (`sports_sportId`),
  ADD KEY `FKp0xkrr5cc2rea2lmbc2q4tvkl` (`teams_teamId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_login_id`),
  ADD UNIQUE KEY `UK_lqjrcobrh9jc8wpcar64q1bfh` (`user_name`),
  ADD UNIQUE KEY `UK_4h7cmhnierc8odmidy9iuincc` (`reservation_reservation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentRoll` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `student_table`
--
ALTER TABLE `student_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `FK34202857f4x6hu34lxlbh7y69` FOREIGN KEY (`route_route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK3cscao38988bj2d3glpvn2c0t` FOREIGN KEY (`user_user_login_id`) REFERENCES `user` (`user_login_id`),
  ADD CONSTRAINT `FKnsyckbsa0g31fueyt4lyr7as9` FOREIGN KEY (`bus_bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `FKpcnvwokx5gf0pi5gkg9k5ifvu` FOREIGN KEY (`team_teamId`) REFERENCES `team` (`teamId`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK1cwae71jt1ek8y0yhcdshjuta` FOREIGN KEY (`bus_bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `FKmxf3clatf7vxwva36tbacswrc` FOREIGN KEY (`user_user_login_id`) REFERENCES `user` (`user_login_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FKl95qutgsd7j6qcubw8k83is0d` FOREIGN KEY (`collage_collageId`) REFERENCES `collage` (`collageId`);

--
-- Constraints for table `team_sport`
--
ALTER TABLE `team_sport`
  ADD CONSTRAINT `FK7sv9tkvd8uhvp961e1913d39r` FOREIGN KEY (`sports_sportId`) REFERENCES `sport` (`sportId`),
  ADD CONSTRAINT `FKp0xkrr5cc2rea2lmbc2q4tvkl` FOREIGN KEY (`teams_teamId`) REFERENCES `team` (`teamId`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK2ngkxieol1mq09cdbvpum6ys8` FOREIGN KEY (`reservation_reservation_id`) REFERENCES `reservation` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
