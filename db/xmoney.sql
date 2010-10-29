-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2010 at 07:48 PM
-- Server version: 5.1.40
-- PHP Version: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `xmoney`
--

-- --------------------------------------------------------

--
-- Table structure for table `x_accounts`
--

CREATE TABLE IF NOT EXISTS `x_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` blob NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `x_accounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `x_envelops`
--

CREATE TABLE IF NOT EXISTS `x_envelops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` blob NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `target` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `x_envelops`
--


-- --------------------------------------------------------

--
-- Table structure for table `x_expenses`
--

CREATE TABLE IF NOT EXISTS `x_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `x_expenses`
--


-- --------------------------------------------------------

--
-- Table structure for table `x_images`
--

CREATE TABLE IF NOT EXISTS `x_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `public` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `x_images`
--

INSERT INTO `x_images` (`id`, `file`, `created`, `public`) VALUES
(1, 'x-bel.jpg', '2010-10-29 00:32:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `x_incomes`
--

CREATE TABLE IF NOT EXISTS `x_incomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `x_incomes`
--


-- --------------------------------------------------------

--
-- Table structure for table `x_loan`
--

CREATE TABLE IF NOT EXISTS `x_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` blob NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `x_loan`
--


-- --------------------------------------------------------

--
-- Table structure for table `x_operation`
--

CREATE TABLE IF NOT EXISTS `x_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `first_id` int(11) DEFAULT NULL,
  `second_id` int(11) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `x_operation`
--


-- --------------------------------------------------------

--
-- Table structure for table `x_users`
--

CREATE TABLE IF NOT EXISTS `x_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(11) NOT NULL DEFAULT '1',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `login` (`login`,`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `x_users`
--

INSERT INTO `x_users` (`id`, `login`, `password`, `image_id`, `email`) VALUES
(1, 'x-bel', '0788a16235b103c9fee0e2a602be7413', 1, 'x-bel@x-bel.com');
