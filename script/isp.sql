-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2017 a las 18:26:58
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `isp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bajas`
--

CREATE TABLE `bajas` (
  `codigo` int(11) NOT NULL,
  `rut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `codigo` int(11) NOT NULL,
  `rut` varchar(9) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestras`
--

CREATE TABLE `muestras` (
  `codigo` int(11) NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `rut_solicitante` varchar(9) NOT NULL,
  `microtoxinas` smallint(6) DEFAULT '0',
  `metales_pesados` smallint(6) DEFAULT '0',
  `plaguicidas` smallint(6) DEFAULT '0',
  `marea_roja` smallint(6) DEFAULT '0',
  `bacterias` smallint(6) DEFAULT '0',
  `temperatura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestras_pendientes`
--

CREATE TABLE `muestras_pendientes` (
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `codigo` int(11) NOT NULL,
  `codigo_muestra` int(11) NOT NULL,
  `fecha_realizacion` datetime NOT NULL,
  `microtoxinas` smallint(6) DEFAULT '0',
  `metales_pesados` smallint(6) DEFAULT '0',
  `plaguicidas` smallint(6) DEFAULT '0',
  `marea_roja` smallint(6) DEFAULT '0',
  `bacterias` smallint(6) DEFAULT '0',
  `cantidad_microtoxinas` int(11) DEFAULT '0',
  `cantidad_metales_pesados` int(11) DEFAULT '0',
  `cantidad_plaguicidas` int(11) DEFAULT '0',
  `cantidad_marea_roja` int(11) DEFAULT '0',
  `cantidad_bacterias` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_empresas`
--

CREATE TABLE `solicitudes_empresas` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `rut` varchar(9) NOT NULL,
  `contraseña` varchar(10) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `contacto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_particulares`
--

CREATE TABLE `solicitudes_particulares` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `rut` varchar(9) NOT NULL,
  `contraseña` varchar(10) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bajas`
--
ALTER TABLE `bajas`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `rut` (`rut`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `muestras`
--
ALTER TABLE `muestras`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `rut_solicitante` (`rut_solicitante`);

--
-- Indices de la tabla `muestras_pendientes`
--
ALTER TABLE `muestras_pendientes`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `codigo_muestra` (`codigo_muestra`);

--
-- Indices de la tabla `solicitudes_empresas`
--
ALTER TABLE `solicitudes_empresas`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD KEY `contacto` (`contacto`);

--
-- Indices de la tabla `solicitudes_particulares`
--
ALTER TABLE `solicitudes_particulares`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `rut` (`rut`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `muestras`
--
ALTER TABLE `muestras`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes_empresas`
--
ALTER TABLE `solicitudes_empresas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes_particulares`
--
ALTER TABLE `solicitudes_particulares`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bajas`
--
ALTER TABLE `bajas`
  ADD CONSTRAINT `bajas_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `muestras` (`codigo`);

--
-- Filtros para la tabla `muestras`
--
ALTER TABLE `muestras`
  ADD CONSTRAINT `muestras_ibfk_1` FOREIGN KEY (`rut_solicitante`) REFERENCES `solicitudes_empresas` (`rut`),
  ADD CONSTRAINT `muestras_ibfk_2` FOREIGN KEY (`rut_solicitante`) REFERENCES `solicitudes_particulares` (`rut`),
  ADD CONSTRAINT `muestras_ibfk_3` FOREIGN KEY (`codigo`) REFERENCES `resultados` (`codigo_muestra`);

--
-- Filtros para la tabla `muestras_pendientes`
--
ALTER TABLE `muestras_pendientes`
  ADD CONSTRAINT `muestras_pendientes_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `muestras` (`codigo`);

--
-- Filtros para la tabla `solicitudes_empresas`
--
ALTER TABLE `solicitudes_empresas`
  ADD CONSTRAINT `solicitudes_empresas_ibfk_1` FOREIGN KEY (`contacto`) REFERENCES `contactos` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
