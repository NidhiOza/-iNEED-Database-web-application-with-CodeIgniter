-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-12-2021 a las 22:31:21
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ineed`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account`
--

CREATE TABLE `account` (
  `id_account` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `account`
--

INSERT INTO `account` (`id_account`, `email`, `password`) VALUES
(1, 'dvaccabu@gmail.com', '$2y$10$.ICn9HPBQBQv6iuSVe0CVOrK8hHb8EYclW.2y86n2R81r0NybsE42'),
(2, 'nidhi@gmail.com', '$2y$10$qgJYDSPxkKilId3iUZBytupS7bOgIIEksea47B7JNo2wXEMqF4dpG'),
(7, 'isabela@gmail.com', '$2y$10$YmxFvZGp7gP1ud8rnDfvQeZ.5AnDjOC3rQNd4RShzkbIVgO/ZVPaO'),
(9, 'sony@gmail.com', '$2y$10$Bqc32D2L3YRxFPhqyAso8u.wnJ/ZotwQCD9TqhxHgezP2LliFZHIq'),
(10, 'nidhi_oza@gmail.com', '$2y$10$eWge8JMbM/WsQfKTqbWiqeKRmcPhBaIq3.tv1DtJvbOxqKMYqiM0a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking`
--

CREATE TABLE `booking` (
  `id_booking` bigint(20) UNSIGNED NOT NULL,
  `id_service_provider_service` bigint(20) UNSIGNED NOT NULL,
  `booking_date` datetime NOT NULL,
  `id_review` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(3) NOT NULL,
  `id_customer` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `booking_comment`
--

CREATE TABLE `booking_comment` (
  `id_booking_comment` bigint(20) UNSIGNED NOT NULL,
  `id_booking` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `stakeholder` varchar(10) NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id_customer` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `telephone` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `status` varchar(3) NOT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `id_account` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id_customer`, `first_name`, `last_name`, `telephone`, `address`, `status`, `lat`, `lon`, `id_account`) VALUES
(1, 'David', 'Vacca', 2147483647, '8632 Louis-Hainault', 'ACT', 45.6452, -73.5858, 1),
(2, 'Nidhi', 'Oza', 2147483647, '4234 gfghdfhhfg', 'ACT', 45.4916, -73.5837, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE `language` (
  `id_language` bigint(20) UNSIGNED NOT NULL,
  `language_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`id_language`, `language_name`) VALUES
(1, 'English'),
(2, 'Française');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `id_payment` bigint(20) UNSIGNED NOT NULL,
  `method` int(10) NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `status` varchar(3) NOT NULL,
  `id_booking` bigint(20) UNSIGNED NOT NULL,
  `payment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `review`
--

CREATE TABLE `review` (
  `id_review` bigint(20) UNSIGNED NOT NULL,
  `rate` int(1) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule_availability`
--

CREATE TABLE `schedule_availability` (
  `id_schedule_availability` bigint(20) UNSIGNED NOT NULL,
  `weekday` varchar(3) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `id_service_provider_service` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE `service` (
  `id_service` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `id_service_type` bigint(20) UNSIGNED NOT NULL,
  `average_time` decimal(10,2) NOT NULL,
  `average_price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `service`
--

INSERT INTO `service` (`id_service`, `service_name`, `id_service_type`, `average_time`, `average_price`) VALUES
(1, 'Waxing', 1, '30.00', '80.00'),
(2, 'Cleaning', 4, '240.00', '20.00'),
(3, 'Locksmith', 5, '45.00', '30.00'),
(4, 'Plumber', 5, '60.00', '60.00'),
(5, 'Tutoring', 2, '60.00', '50.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_budget`
--

CREATE TABLE `service_budget` (
  `id_service_budget` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `id_service_provider_service` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_provider`
--

CREATE TABLE `service_provider` (
  `id_service_provider` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(11) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `telephone` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `status` varchar(3) NOT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `id_account` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `service_provider`
--

INSERT INTO `service_provider` (`id_service_provider`, `first_name`, `last_name`, `telephone`, `address`, `status`, `lat`, `lon`, `id_account`) VALUES
(1, 'Isabela', 'Pamplona', 1234567890, '8575 8e Avenue', 'ACT', 45.5657, -73.6198, 7),
(3, 'Sony', 'Natha', 1234567890, '7999 Bd des Galeries d\'Anjou', 'ACT', 45.6023, -73.5651, 9),
(4, 'Nidhi', 'Oza', 1234567890, '9025 Bd Maurice-Duplessis', 'ACT', 45.6441, -73.5731, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_provider_language`
--

CREATE TABLE `service_provider_language` (
  `id_service_provider_language` bigint(20) UNSIGNED NOT NULL,
  `id_service_provider` bigint(20) UNSIGNED NOT NULL,
  `id_language` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `service_provider_language`
--

INSERT INTO `service_provider_language` (`id_service_provider_language`, `id_service_provider`, `id_language`) VALUES
(2, 3, 2),
(3, 4, 2),
(4, 4, 1),
(5, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_provider_service`
--

CREATE TABLE `service_provider_service` (
  `id_service_provider_service` bigint(20) UNSIGNED NOT NULL,
  `id_service` bigint(20) UNSIGNED NOT NULL,
  `id_service_provider` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `service_provider_service`
--

INSERT INTO `service_provider_service` (`id_service_provider_service`, `id_service`, `id_service_provider`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_type`
--

CREATE TABLE `service_type` (
  `id_service_type` bigint(20) UNSIGNED NOT NULL,
  `service_type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `service_type`
--

INSERT INTO `service_type` (`id_service_type`, `service_type_name`) VALUES
(1, 'Beauty'),
(2, 'Education'),
(3, 'Personal Care'),
(4, 'Cleaning'),
(5, 'Repair');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`),
  ADD UNIQUE KEY `id_account` (`id_account`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `to_booking` (`id_service_provider_service`),
  ADD KEY `to_booking1` (`id_review`),
  ADD KEY `to_booking2` (`id_customer`);

--
-- Indices de la tabla `booking_comment`
--
ALTER TABLE `booking_comment`
  ADD PRIMARY KEY (`id_booking_comment`),
  ADD KEY `to_booking_comment` (`id_booking`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `to_customer_account` (`id_account`);

--
-- Indices de la tabla `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `to_payment` (`id_booking`);

--
-- Indices de la tabla `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_review`);

--
-- Indices de la tabla `schedule_availability`
--
ALTER TABLE `schedule_availability`
  ADD PRIMARY KEY (`id_schedule_availability`),
  ADD KEY `to_schedule_availability` (`id_service_provider_service`);

--
-- Indices de la tabla `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `to_service` (`id_service_type`);

--
-- Indices de la tabla `service_budget`
--
ALTER TABLE `service_budget`
  ADD PRIMARY KEY (`id_service_budget`),
  ADD KEY `to_service_budget` (`id_service_provider_service`);

--
-- Indices de la tabla `service_provider`
--
ALTER TABLE `service_provider`
  ADD PRIMARY KEY (`id_service_provider`),
  ADD KEY `to_service_provider_account` (`id_account`);

--
-- Indices de la tabla `service_provider_language`
--
ALTER TABLE `service_provider_language`
  ADD PRIMARY KEY (`id_service_provider_language`),
  ADD KEY `to_service_provider_language` (`id_language`),
  ADD KEY `to_service_provider_language1` (`id_service_provider`);

--
-- Indices de la tabla `service_provider_service`
--
ALTER TABLE `service_provider_service`
  ADD PRIMARY KEY (`id_service_provider_service`),
  ADD KEY `to_service_provider_service` (`id_service`),
  ADD KEY `to_service_provider_service1` (`id_service_provider`);

--
-- Indices de la tabla `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`id_service_type`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account`
--
ALTER TABLE `account`
  MODIFY `id_account` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `booking_comment`
--
ALTER TABLE `booking_comment`
  MODIFY `id_booking_comment` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `language`
--
ALTER TABLE `language`
  MODIFY `id_language` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `review`
--
ALTER TABLE `review`
  MODIFY `id_review` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `schedule_availability`
--
ALTER TABLE `schedule_availability`
  MODIFY `id_schedule_availability` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `service`
--
ALTER TABLE `service`
  MODIFY `id_service` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `service_budget`
--
ALTER TABLE `service_budget`
  MODIFY `id_service_budget` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `service_provider`
--
ALTER TABLE `service_provider`
  MODIFY `id_service_provider` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `service_provider_language`
--
ALTER TABLE `service_provider_language`
  MODIFY `id_service_provider_language` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `service_provider_service`
--
ALTER TABLE `service_provider_service`
  MODIFY `id_service_provider_service` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `service_type`
--
ALTER TABLE `service_type`
  MODIFY `id_service_type` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `to_booking` FOREIGN KEY (`id_review`) REFERENCES `review` (`id_review`),
  ADD CONSTRAINT `to_booking1` FOREIGN KEY (`id_service_provider_service`) REFERENCES `service_provider_service` (`id_service_provider_service`),
  ADD CONSTRAINT `to_booking3` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Filtros para la tabla `booking_comment`
--
ALTER TABLE `booking_comment`
  ADD CONSTRAINT `to_booking_comment` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`);

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `to_customer` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`);

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `to_payment` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`);

--
-- Filtros para la tabla `schedule_availability`
--
ALTER TABLE `schedule_availability`
  ADD CONSTRAINT `to_schedule_availability` FOREIGN KEY (`id_service_provider_service`) REFERENCES `service_provider_service` (`id_service_provider_service`);

--
-- Filtros para la tabla `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `to_service` FOREIGN KEY (`id_service_type`) REFERENCES `service_type` (`id_service_type`);

--
-- Filtros para la tabla `service_budget`
--
ALTER TABLE `service_budget`
  ADD CONSTRAINT `to_service_budget` FOREIGN KEY (`id_service_provider_service`) REFERENCES `service_provider_service` (`id_service_provider_service`);

--
-- Filtros para la tabla `service_provider`
--
ALTER TABLE `service_provider`
  ADD CONSTRAINT `to_service_provider` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`);

--
-- Filtros para la tabla `service_provider_language`
--
ALTER TABLE `service_provider_language`
  ADD CONSTRAINT `to_service_provider_language` FOREIGN KEY (`id_service_provider`) REFERENCES `service_provider` (`id_service_provider`),
  ADD CONSTRAINT `to_service_provider_language1` FOREIGN KEY (`id_language`) REFERENCES `language` (`id_language`);

--
-- Filtros para la tabla `service_provider_service`
--
ALTER TABLE `service_provider_service`
  ADD CONSTRAINT `to_service_provider_service` FOREIGN KEY (`id_service_provider`) REFERENCES `service_provider` (`id_service_provider`),
  ADD CONSTRAINT `to_service_provider_service1` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
