-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2013 at 04:24 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `placementupdates`
--

-- --------------------------------------------------------

--
-- Table structure for table `companydetails`
--

CREATE TABLE IF NOT EXISTS `companydetails` (
  `code` varchar(30) NOT NULL,
  `visitdate` varchar(10) DEFAULT NULL,
  `interviewsdate` varchar(10) DEFAULT NULL,
  `deadline` varchar(10) DEFAULT NULL,
  `mintenth` varchar(3) DEFAULT NULL,
  `mintwelth` varchar(3) DEFAULT NULL,
  `mindiploma` varchar(3) DEFAULT NULL,
  `mincgpa` float(3,2) DEFAULT NULL,
  `maxbacklogs` int(2) DEFAULT NULL,
  `ctc` varchar(10) DEFAULT NULL,
  `procedur` text,
  `documents` text,
  `others` text,
  PRIMARY KEY (`code`),
  KEY `visitdate` (`visitdate`,`deadline`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companydetails`
--

INSERT INTO `companydetails` (`code`, `visitdate`, `interviewsdate`, `deadline`, `mintenth`, `mintwelth`, `mindiploma`, `mincgpa`, `maxbacklogs`, `ctc`, `procedur`, `documents`, `others`) VALUES
('LinkedIN', '21/11/2013', '21/11/2013', '16/11/2013', '75', '75', 'NA', 7.00, 0, '9L + Benef', 'NA ', 'NA ', 'NA '),
('SAP', '23/11/2013', '23/11/2013', '16/11/2013', '75', '75', 'NA', 8.00, 0, '9L + Benef', 'NA ', 'NA ', 'NA ');

-- --------------------------------------------------------

--
-- Table structure for table `placed`
--

CREATE TABLE IF NOT EXISTS `placed` (
  `code` varchar(5) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`usn`,`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered`
--

CREATE TABLE IF NOT EXISTS `registered` (
  `code` varchar(30) NOT NULL,
  `usn` varchar(10) NOT NULL,
  PRIMARY KEY (`usn`,`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered`
--

INSERT INTO `registered` (`code`, `usn`) VALUES
('LinkedIN', '1RV10CS000'),
('LinkedIN', '1RV10CS096'),
('SAP', '1RV10CS000'),
('SAP', '1RV10CS096');

-- --------------------------------------------------------

--
-- Table structure for table `studentdetails`
--

CREATE TABLE IF NOT EXISTS `studentdetails` (
  `usn` varchar(10) NOT NULL,
  `uid` int(11) NOT NULL,
  `fullname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(13) NOT NULL,
  `tenth` varchar(6) NOT NULL,
  `twelth` varchar(6) DEFAULT NULL,
  `diploma` varchar(6) DEFAULT NULL,
  `sem1` float(3,2) DEFAULT NULL,
  `sem2` float(3,2) DEFAULT NULL,
  `sem3` float(3,2) DEFAULT NULL,
  `sem4` float(3,2) DEFAULT NULL,
  `sem5` float(3,2) DEFAULT NULL,
  `sem6` float(3,2) DEFAULT NULL,
  `sem7` float(3,2) DEFAULT NULL,
  `sem8` float(3,2) DEFAULT NULL,
  `cgpa` float(3,2) NOT NULL,
  `backlogs` int(11) DEFAULT NULL,
  `dept` varchar(10) DEFAULT 'CS',
  PRIMARY KEY (`usn`,`uid`),
  KEY `uid` (`uid`),
  KEY `fullname` (`fullname`,`email`,`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentdetails`
--

INSERT INTO `studentdetails` (`usn`, `uid`, `fullname`, `email`, `contact`, `tenth`, `twelth`, `diploma`, `sem1`, `sem2`, `sem3`, `sem4`, `sem5`, `sem6`, `sem7`, `sem8`, `cgpa`, `backlogs`, `dept`) VALUES
('1RV10CS000', 8, 'Somu', 'somu@gmail.com', '8893678457', '90', '95', 'NA', 8.00, 8.00, 8.00, 8.00, 8.00, 8.00, 8.00, 0.00, 8.00, 0, 'CS'),
('1RV10CS096', 7, 'Shashank S Rao', 'coldmixer@gmail.com', '7204905212', '90', '90', 'NA', 9.00, 9.00, 9.33, 9.34, 9.00, 9.00, 9.00, 0.00, 9.28, 0, 'CS');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE IF NOT EXISTS `userlogin` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique user id',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `creds` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user(0) or admin(1)',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`,`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='user credentials table' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`uid`, `username`, `password`, `creds`) VALUES
(7, 'coldmixer@gmail.com', '7855b5d653801bbc991149c8fa47dcddfd95f5f5', 0),
(8, 'someuser@gmail.com', 'aafdc23870ecbcd3d557b6423a8982134e17927e', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `placed`
--
ALTER TABLE `placed`
  ADD CONSTRAINT `placed_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE,
  ADD CONSTRAINT `placed_ibfk_2` FOREIGN KEY (`code`) REFERENCES `companydetails` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `registered`
--
ALTER TABLE `registered`
  ADD CONSTRAINT `registered_ibfk_2` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registered_ibfk_1` FOREIGN KEY (`code`) REFERENCES `companydetails` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentdetails`
--
ALTER TABLE `studentdetails`
  ADD CONSTRAINT `studentdetails_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `userlogin` (`uid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
