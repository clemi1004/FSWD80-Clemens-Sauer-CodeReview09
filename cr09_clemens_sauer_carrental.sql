-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Nov 2019 um 20:41
-- Server-Version: 10.4.8-MariaDB
-- PHP-Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_clemens_sauer_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `billing`
--

CREATE TABLE `billing` (
  `pk_billing_id` int(11) NOT NULL,
  `discount` decimal(4,2) NOT NULL,
  `extra_costs` int(11) NOT NULL,
  `type_of_payment` varchar(13) NOT NULL,
  `fk_insurance_id` int(11) DEFAULT NULL,
  `fk_pickup_return_data_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `billing`
--

INSERT INTO `billing` (`pk_billing_id`, `discount`, `extra_costs`, `type_of_payment`, `fk_insurance_id`, `fk_pickup_return_data_id`, `duration`) VALUES
(1, '0.00', 0, 'cash', 1, 1, NULL),
(2, '0.00', 10, 'cash', 2, 2, NULL),
(3, '0.00', 20, 'credit_card', 3, 3, NULL),
(4, '0.00', 30, 'credit_card', 4, 4, NULL),
(5, '0.20', 150, 'debit_card', 5, 5, NULL),
(6, '0.10', 100, 'debit_card', 6, 6, NULL),
(7, '0.05', 20, 'bank_transfer', 7, 7, NULL),
(8, '0.00', 0, 'cash', 8, 8, NULL),
(9, '0.05', 20, 'credit_card', 9, 9, NULL),
(10, '0.00', 0, 'debit_card', 10, 10, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_status`
--

CREATE TABLE `car_status` (
  `pk_car_data_id` int(11) NOT NULL,
  `type_of_car` varchar(7) NOT NULL,
  `name` varchar(7) NOT NULL,
  `ps` int(11) NOT NULL,
  `number_of_seats` int(11) NOT NULL,
  `configuration` varchar(6) NOT NULL,
  `price_per_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car_status`
--

INSERT INTO `car_status` (`pk_car_data_id`, `type_of_car`, `name`, `ps`, `number_of_seats`, `configuration`, `price_per_day`) VALUES
(1, 'skoda', 'octavia', 100, 5, 'normal', 100),
(2, 'audi', 'a6', 120, 5, 'normal', 200),
(3, 'bmw', 'x5', 160, 5, 'normal', 100),
(4, 'bmw', 'x2', 90, 2, 'normal', 100),
(5, 'vw', 'golf', 90, 5, 'normal', 50),
(6, 'toyota', 'super', 75, 5, 'sport', 80),
(7, 'toyota', 'best', 120, 6, 'sport', 90),
(8, 'ford', 'mustang', 180, 2, 'sport', 120),
(9, 'nissan', 'qashqai', 120, 5, 'normal', 120),
(10, 'ferrari', 'spider', 320, 2, 'sport', 300);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `pk_customer_id` int(11) NOT NULL,
  `first_name` varchar(8) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `date_of_birth` varchar(19) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`pk_customer_id`, `first_name`, `last_name`, `date_of_birth`, `gender`) VALUES
(1, 'Ignacius', 'Kenaway', '1985-12-30 12:29:11', 'Male'),
(2, 'Maryjane', 'Leheude', '1968-02-29 06:31:19', 'Female'),
(3, 'Doreen', 'Searson', '1985-01-12 04:44:01', 'Female'),
(4, 'Kimble', 'Denziloe', '1961-06-07 00:58:54', 'Male'),
(5, 'Adolphus', 'Lett', '1973-02-24 09:36:17', 'Male'),
(6, 'Basile', 'Aston', '1987-01-29 22:25:53', 'Male'),
(7, 'Sondra', 'Sandercock', '1980-06-28 03:26:35', 'Female'),
(8, 'Glenda', 'Giraudel', '1968-04-18 07:56:56', 'Female'),
(9, 'Somerset', 'Perez', '1988-09-29 01:45:59', 'Male'),
(10, 'Arlana', 'Wastie', '1983-09-05 08:46:46', 'Female');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driving_license`
--

CREATE TABLE `driving_license` (
  `pk_driving_license_id` int(11) NOT NULL,
  `exhibiton_state` varchar(20) NOT NULL,
  `exhibition_authority` varchar(7) NOT NULL,
  `type_of_driving_lic` varchar(1) NOT NULL,
  `date_of_exhibition` datetime NOT NULL,
  `fk_customer` int(11) DEFAULT NULL,
  `fk_internal_data` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `driving_license`
--

INSERT INTO `driving_license` (`pk_driving_license_id`, `exhibiton_state`, `exhibition_authority`, `type_of_driving_lic`, `date_of_exhibition`, `fk_customer`, `fk_internal_data`) VALUES
(1, 'District of Columbia', 'Vienna', 'b', '1998-04-25 18:26:51', 1, 1),
(2, 'Virginia', 'Vienna', 'b', '1998-11-01 02:51:48', 2, 2),
(3, 'Maryland', 'Vienna', 'b', '2005-05-07 16:35:05', 3, 3),
(4, 'Texas', 'Vienna', 'a', '2011-10-19 08:24:18', 4, 4),
(5, 'Georgia', 'Berlin', 'c', '2017-06-22 06:29:35', 5, 5),
(6, 'Illinois', 'Berlin', 'd', '2011-12-03 22:03:25', 6, 6),
(7, 'Georgia', 'Hamburg', 'a', '2016-11-14 07:46:57', 10, 10),
(8, 'New Mexico', 'Hamburg', 'b', '2015-07-11 03:39:01', 7, 7),
(9, 'Nevada', 'Hamburg', 'a', '2002-02-16 10:16:11', 8, 8),
(10, 'Kentucky', 'Graz', 'b', '2014-01-14 19:35:12', 9, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `pk_insurance_id` int(11) NOT NULL,
  `price_per_day` int(11) NOT NULL,
  `type_of_insurance` varchar(8) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `insurance`
--

INSERT INTO `insurance` (`pk_insurance_id`, `price_per_day`, `type_of_insurance`, `fk_customer_id`) VALUES
(1, 100, 'top_100', NULL),
(2, 200, 'top_200', NULL),
(3, 300, 'top_300', NULL),
(4, 400, 'top_400', NULL),
(5, 500, 'top_500', NULL),
(6, 600, 'top_600', NULL),
(7, 700, 'top_700', NULL),
(8, 800, 'top_800', NULL),
(9, 900, 'top_900', NULL),
(10, 1000, 'top_1000', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `internal_data`
--

CREATE TABLE `internal_data` (
  `pk_internal_data_id` int(11) NOT NULL,
  `status` varchar(9) NOT NULL,
  `first_reservation` date NOT NULL,
  `last_reservation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `internal_data`
--

INSERT INTO `internal_data` (`pk_internal_data_id`, `status`, `first_reservation`, `last_reservation`) VALUES
(1, 'gold', '2018-01-01', '2018-02-25'),
(2, 'gold', '2018-01-02', '2018-02-26'),
(3, 'gold', '2018-01-03', '2018-02-27'),
(4, 'gold', '2018-01-04', '2018-02-28'),
(5, 'bronze', '2018-01-05', '2018-03-01'),
(6, 'bronze', '2018-01-06', '2018-03-02'),
(7, 'silver', '2018-01-07', '2018-03-03'),
(8, 'silver', '2018-01-08', '2018-03-04'),
(9, 'silver', '2018-01-09', '2018-03-05'),
(10, 'no status', '2018-01-10', '2018-03-06');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pickup_return_data`
--

CREATE TABLE `pickup_return_data` (
  `pk_pickup_return_data_id` int(11) NOT NULL,
  `pickup_location` varchar(17) NOT NULL,
  `planned_return_location` datetime NOT NULL,
  `pickup_time` datetime NOT NULL,
  `fk_driving_license_id` int(11) DEFAULT NULL,
  `fk_return_status_id` int(11) DEFAULT NULL,
  `fk_car_data_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `pickup_return_data`
--

INSERT INTO `pickup_return_data` (`pk_pickup_return_data_id`, `pickup_location`, `planned_return_location`, `pickup_time`, `fk_driving_license_id`, `fk_return_status_id`, `fk_car_data_id`) VALUES
(1, 'Huacheng', '0000-00-00 00:00:00', '2006-04-21 13:18:40', 1, 1, 1),
(2, 'Bagansiapiapi', '0000-00-00 00:00:00', '2003-06-24 19:38:24', 2, 2, 2),
(3, 'Araouane', '0000-00-00 00:00:00', '2004-09-01 17:57:14', 3, 3, 3),
(4, 'Dajie', '0000-00-00 00:00:00', '2006-06-24 04:29:23', 4, 4, 4),
(5, 'Santa Catalina', '0000-00-00 00:00:00', '2004-01-24 08:24:35', 5, 5, 5),
(6, 'Yejia', '0000-00-00 00:00:00', '2007-12-11 12:46:28', 6, 6, 6),
(7, 'Taverny', '0000-00-00 00:00:00', '2019-04-03 08:19:06', 7, 7, 7),
(8, 'Th? Tr?n Th? Xu�n', '0000-00-00 00:00:00', '2006-11-18 06:18:46', 8, 8, 8),
(9, 'Meirinhas', '0000-00-00 00:00:00', '1996-11-10 15:03:45', 9, 9, 9),
(10, 'Binhailu', '0000-00-00 00:00:00', '1997-05-03 19:24:55', 10, 10, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `return_status`
--

CREATE TABLE `return_status` (
  `pk_return_status_id` int(11) NOT NULL,
  `cleanliness` varchar(20) NOT NULL,
  `damage` varchar(16) NOT NULL,
  `return_location` varchar(12) NOT NULL,
  `return_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `return_status`
--

INSERT INTO `return_status` (`pk_return_status_id`, `cleanliness`, `damage`, `return_location`, `return_time`) VALUES
(1, 'ok', '2_day_repair', 'Philadelphia', '2008-06-30 13:49:15'),
(2, 'ok', '2_day_repair', 'Babice', '1996-09-24 04:18:04'),
(3, 'full_cleaning_needed', '2_day_repair', 'Ganyi', '2011-07-12 21:06:21'),
(4, 'full_cleaning_needed', 'ok', 'Huertas', '2001-11-10 20:34:22'),
(5, 'cleaning needed', 'total loss', 'Aipe', '2014-11-16 05:03:37'),
(6, 'ok', '2_day_repair', 'Kalanguy', '2005-10-15 16:25:06'),
(7, 'cleaning needed', 'ok', 'Aoshi', '2018-09-24 05:00:27'),
(8, 'ok', '2_day_repair', 'Paola', '1995-11-03 16:41:45'),
(9, 'full_cleaning_needed', 'immediate_repair', 'K�benhavn', '2001-04-03 19:16:00'),
(10, 'cleaning needed', '2_day_repair', 'Umm Sa�?d', '2013-10-12 06:26:05');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`pk_billing_id`),
  ADD KEY `fk_insurance_id` (`fk_insurance_id`),
  ADD KEY `fk_pickup_return_data_id` (`fk_pickup_return_data_id`);

--
-- Indizes für die Tabelle `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`pk_car_data_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`pk_customer_id`);

--
-- Indizes für die Tabelle `driving_license`
--
ALTER TABLE `driving_license`
  ADD PRIMARY KEY (`pk_driving_license_id`),
  ADD KEY `fk_customer` (`fk_customer`),
  ADD KEY `fk_internal_data` (`fk_internal_data`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`pk_insurance_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `internal_data`
--
ALTER TABLE `internal_data`
  ADD PRIMARY KEY (`pk_internal_data_id`);

--
-- Indizes für die Tabelle `pickup_return_data`
--
ALTER TABLE `pickup_return_data`
  ADD PRIMARY KEY (`pk_pickup_return_data_id`),
  ADD KEY `fk_driving_license_id` (`fk_driving_license_id`),
  ADD KEY `fk_return_status_id` (`fk_return_status_id`),
  ADD KEY `fk_car_data_id` (`fk_car_data_id`);

--
-- Indizes für die Tabelle `return_status`
--
ALTER TABLE `return_status`
  ADD PRIMARY KEY (`pk_return_status_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`fk_insurance_id`) REFERENCES `insurance` (`pk_insurance_id`),
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`fk_pickup_return_data_id`) REFERENCES `pickup_return_data` (`pk_pickup_return_data_id`);

--
-- Constraints der Tabelle `driving_license`
--
ALTER TABLE `driving_license`
  ADD CONSTRAINT `driving_license_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`pk_customer_id`),
  ADD CONSTRAINT `driving_license_ibfk_2` FOREIGN KEY (`fk_internal_data`) REFERENCES `internal_data` (`pk_internal_data_id`);

--
-- Constraints der Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`pk_customer_id`);

--
-- Constraints der Tabelle `pickup_return_data`
--
ALTER TABLE `pickup_return_data`
  ADD CONSTRAINT `pickup_return_data_ibfk_1` FOREIGN KEY (`fk_driving_license_id`) REFERENCES `driving_license` (`pk_driving_license_id`),
  ADD CONSTRAINT `pickup_return_data_ibfk_2` FOREIGN KEY (`fk_return_status_id`) REFERENCES `return_status` (`pk_return_status_id`),
  ADD CONSTRAINT `pickup_return_data_ibfk_3` FOREIGN KEY (`fk_car_data_id`) REFERENCES `car_status` (`pk_car_data_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
