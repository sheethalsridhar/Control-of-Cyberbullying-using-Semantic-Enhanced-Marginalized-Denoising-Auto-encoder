-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.19


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema socialnetwork1
--

CREATE DATABASE IF NOT EXISTS socialnetwork1;
USE socialnetwork1;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `cat` varchar(45) NOT NULL DEFAULT '',
  `word` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `buser`
--

DROP TABLE IF EXISTS `buser`;
CREATE TABLE `buser` (
  `user` varchar(45) NOT NULL DEFAULT '',
  `statusa` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buser`
--

/*!40000 ALTER TABLE `buser` DISABLE KEYS */;
/*!40000 ALTER TABLE `buser` ENABLE KEYS */;


--
-- Definition of table `new_m`
--

DROP TABLE IF EXISTS `new_m`;
CREATE TABLE `new_m` (
  `user` varchar(45) NOT NULL DEFAULT '',
  `statusa` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_m`
--

/*!40000 ALTER TABLE `new_m` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_m` ENABLE KEYS */;


--
-- Definition of table `notific`
--

DROP TABLE IF EXISTS `notific`;
CREATE TABLE `notific` (
  `buser` varchar(50) DEFAULT NULL,
  `cuser` varchar(50) DEFAULT NULL,
  `wor` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notific`
--

/*!40000 ALTER TABLE `notific` DISABLE KEYS */;
/*!40000 ALTER TABLE `notific` ENABLE KEYS */;


--
-- Definition of table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `userid` varchar(30) NOT NULL,
  `photo` blob NOT NULL,
  `filename` varchar(30) NOT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


--
-- Definition of table `reg`
--

DROP TABLE IF EXISTS `reg`;
CREATE TABLE `reg` (
  `id` int(20) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `remail` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `secondary` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `employee` varchar(255) DEFAULT NULL,
  `image` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg`
--

/*!40000 ALTER TABLE `reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `reg` ENABLE KEYS */;


--
-- Definition of table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fid` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `fgroup` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;


--
-- Definition of table `update_`
--

DROP TABLE IF EXISTS `update_`;
CREATE TABLE `update_` (
  `user` varchar(45) NOT NULL DEFAULT '',
  `statusa` varchar(45) NOT NULL DEFAULT '',
  `permission` varchar(25) DEFAULT NULL,
  `dat_` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `update_`
--

/*!40000 ALTER TABLE `update_` DISABLE KEYS */;
/*!40000 ALTER TABLE `update_` ENABLE KEYS */;


--
-- Definition of table `view`
--

DROP TABLE IF EXISTS `view`;
CREATE TABLE `view` (
  `id` int(255) NOT NULL,
  `image` longblob NOT NULL,
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `statusa` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `statusb` varchar(255) DEFAULT NULL,
  `fgroup` varchar(255) DEFAULT NULL,
  `statusc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view`
--

/*!40000 ALTER TABLE `view` DISABLE KEYS */;
/*!40000 ALTER TABLE `view` ENABLE KEYS */;


--
-- Definition of table `view_pri`
--

DROP TABLE IF EXISTS `view_pri`;
CREATE TABLE `view_pri` (
  `user_id` int(11) NOT NULL,
  `view_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `view_pri`
--

/*!40000 ALTER TABLE `view_pri` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pri` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
