-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 13, 2018 at 09:40 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `author_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`) VALUES
(100, 'Maridif Angeliko'),
(101, 'Leonardo Carpacio'),
(102, 'Dr Falaffel'),
(103, 'Patrick Reloaded');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `title` varchar(22) DEFAULT NULL,
  `fk_content_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `title`, `fk_content_ID`) VALUES
(123456781, 'The rules', 1),
(678764578, 'Räuber Hotzenplotz', 4),
(978232359, 'Allesfresser', 3),
(1234567890, 'Lord of the Weed', 5),
(2147483647, 'Harry Propper', 2);

-- --------------------------------------------------------

--
-- Table structure for table `books_author`
--

CREATE TABLE `books_author` (
  `fk_books_ISBN` int(11) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books_author`
--

INSERT INTO `books_author` (`fk_books_ISBN`, `fk_author_id`) VALUES
(123456781, 100),
(123456781, 101);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `content_ID` int(11) NOT NULL DEFAULT '0',
  `pages` int(11) DEFAULT NULL,
  `lang` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`content_ID`, `pages`, `lang`) VALUES
(1, 200, 'German'),
(2, 200, 'English'),
(3, 350, 'English'),
(4, 450, 'German'),
(5, 549, 'Hungarien');

-- --------------------------------------------------------

--
-- Table structure for table `publishing`
--

CREATE TABLE `publishing` (
  `publishing_ID` int(11) NOT NULL DEFAULT '0',
  `publisher` varchar(50) DEFAULT NULL,
  `publishing_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_ID` int(11) NOT NULL DEFAULT '0',
  `price` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales_date`
--

CREATE TABLE `sales_date` (
  `sales_date_ID` int(11) NOT NULL DEFAULT '0',
  `sales_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `fk_content_ID` (`fk_content_ID`);

--
-- Indexes for table `books_author`
--
ALTER TABLE `books_author`
  ADD KEY `fk_books_ISBN` (`fk_books_ISBN`),
  ADD KEY `fk_author_id` (`fk_author_id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`content_ID`);

--
-- Indexes for table `publishing`
--
ALTER TABLE `publishing`
  ADD PRIMARY KEY (`publishing_ID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_ID`);

--
-- Indexes for table `sales_date`
--
ALTER TABLE `sales_date`
  ADD PRIMARY KEY (`sales_date_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_content_ID` FOREIGN KEY (`fk_content_ID`) REFERENCES `content` (`content_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `books_author`
--
ALTER TABLE `books_author`
  ADD CONSTRAINT `books_author_ibfk_1` FOREIGN KEY (`fk_books_ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `books_author_ibfk_2` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`);
