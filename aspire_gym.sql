-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2025 at 02:21 AM
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
-- Database: `aspire gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `ClassCode` int(11) NOT NULL,
  `ClassName` varchar(50) DEFAULT NULL,
  `InstructorID` int(11) DEFAULT NULL,
  `Day` varchar(20) DEFAULT NULL,
  `Time` varchar(20) DEFAULT NULL,
  `MaxSize` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classbooking`
--

CREATE TABLE `classbooking` (
  `BookingID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `ClassCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `FacilityID` int(11) NOT NULL,
  `FacilityName` varchar(100) DEFAULT NULL,
  `MaxCapacity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facilitybooking`
--

CREATE TABLE `facilitybooking` (
  `BookingID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `TimeSlot` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `FirsName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DOB` varchar(15) DEFAULT NULL,
  `MedicalConditions` varchar(255) DEFAULT NULL,
  `WeeklyCharges` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`ClassCode`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Indexes for table `classbooking`
--
ALTER TABLE `classbooking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `ClassCode` (`ClassCode`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`FacilityID`);

--
-- Indexes for table `facilitybooking`
--
ALTER TABLE `facilitybooking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `FacilityID` (`FacilityID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `staff` (`StaffID`);

--
-- Constraints for table `classbooking`
--
ALTER TABLE `classbooking`
  ADD CONSTRAINT `classbooking_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  ADD CONSTRAINT `classbooking_ibfk_2` FOREIGN KEY (`ClassCode`) REFERENCES `class` (`ClassCode`);

--
-- Constraints for table `facilitybooking`
--
ALTER TABLE `facilitybooking`
  ADD CONSTRAINT `facilitybooking_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  ADD CONSTRAINT `facilitybooking_ibfk_2` FOREIGN KEY (`FacilityID`) REFERENCES `facility` (`FacilityID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
