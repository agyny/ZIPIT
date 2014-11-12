-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               5.5.39 - MySQL Community Server (GPL)
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury bazy danych zipit
CREATE DATABASE IF NOT EXISTS `zipit` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;
USE `zipit`;


-- Zrzut struktury tabela zipit.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_polish_ci DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `ID_Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Projects_Statuses` (`ID_Status`),
  CONSTRAINT `FK_Projects_Statuses` FOREIGN KEY (`ID_Status`) REFERENCES `statuses` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela zipit.projects_users
CREATE TABLE IF NOT EXISTS `projects_users` (
  `ID_Projects` int(11) NOT NULL,
  `ID_Users` int(11) NOT NULL,
  PRIMARY KEY (`ID_Projects`,`ID_Users`),
  KEY `FK_Users` (`ID_Users`),
  CONSTRAINT `FK_Projects_Users_Projects` FOREIGN KEY (`ID_Projects`) REFERENCES `projects` (`ID`),
  CONSTRAINT `FK_Projects_Users_Users` FOREIGN KEY (`ID_Users`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela zipit.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `ID` int(11) NOT NULL,
  `Role` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela zipit.statuses
CREATE TABLE IF NOT EXISTS `statuses` (
  `ID` int(11) NOT NULL,
  `Status` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela zipit.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(128) COLLATE utf8_polish_ci NOT NULL DEFAULT '0',
  `Description` varchar(500) COLLATE utf8_polish_ci DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `ID_Project` int(11) DEFAULT NULL,
  `ID_Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Tasks_Projects` (`ID_Project`),
  KEY `FK_Tasks_Statuses` (`ID_Status`),
  CONSTRAINT `FK_Tasks_Statuses` FOREIGN KEY (`ID_Status`) REFERENCES `statuses` (`ID`),
  CONSTRAINT `FK_Tasks_Projects` FOREIGN KEY (`ID_Project`) REFERENCES `projects` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela zipit.tasks_users
CREATE TABLE IF NOT EXISTS `tasks_users` (
  `ID_Task` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  PRIMARY KEY (`ID_Task`,`ID_User`),
  KEY `FK_Tasks_Users_Users` (`ID_User`),
  CONSTRAINT `FK_Tasks_Users_Tasks` FOREIGN KEY (`ID_Task`) REFERENCES `tasks` (`ID`),
  CONSTRAINT `FK_Tasks_Users_Users` FOREIGN KEY (`ID_User`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela zipit.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Password` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Account activates after first log in.',
  `Name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Surname` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela zipit.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `ID_User` int(11) NOT NULL,
  `ID_Role` int(11) NOT NULL,
  PRIMARY KEY (`ID_User`,`ID_Role`),
  KEY `FK_Users_Roles_Roles` (`ID_Role`),
  CONSTRAINT `FK_Users_Roles_Users` FOREIGN KEY (`ID_User`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_Users_Roles_Roles` FOREIGN KEY (`ID_Role`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
