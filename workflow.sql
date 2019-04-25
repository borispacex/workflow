-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2019 a las 19:39:47
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `workflow`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flujousuario`
--

CREATE TABLE IF NOT EXISTS `flujousuario` (
  `codF` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codP` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codT` int(3) NOT NULL,
  `codU` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaIni` datetime NOT NULL,
  `fechaFIN` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `flujousuario`
--

INSERT INTO `flujousuario` (`codF`, `codP`, `codT`, `codU`, `fechaIni`, `fechaFIN`) VALUES
('f1', 'p1', 1, 'scm', '2019-04-01 10:20:00', '2019-04-01 10:40:00'),
('f1', 'p2', 1, 'scm', '2019-04-01 10:40:00', NULL),
('f2', 'p1', 2, 'jpm', '2019-04-01 11:00:00', NULL),
('f2', 'p1', 3, 'jpm', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE IF NOT EXISTS `proceso` (
  `codF` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codP` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codPS` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codR` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`codF`, `codP`, `codPS`, `codR`, `form`, `tipo`) VALUES
('f1', 'p1', 'p2', 'E', 'inicio', 'I'),
('f1', 'p2', 'p3', 'E', 'llena', 'P'),
('f1', 'p3', 'p4', 'K', 'solicitud', 'P'),
('f1', 'p4', 'p5', 'K', 'recepcion', 'P'),
('f1', 'p5', NULL, 'K', 'acepta', 'P'),
('f1', 'p6', 'p7', 'J', 'cuenta', 'P'),
('f1', 'p7', NULL, NULL, 'fin', 'F'),
('f2', 'p1', 'p2', 'K', 'inicio', 'I'),
('f2', 'p2', 'p3', 'K', 'solicitud', 'P'),
('f2', 'p3', 'p4', 'S', 'recepcion', 'P'),
('f2', 'p4', NULL, 'S', 'acepta', 'P'),
('f2', 'p5', 'p6', 'S', 'elabora', 'P'),
('f2', 'p6', 'p7', 'D', 'aceptacion', 'P'),
('f2', 'p7', 'p8', 'E', 'devolucion', 'P'),
('f2', 'p8', NULL, NULL, 'fin', 'F'),
('f3', 'p1', 'p2', 'E', 'inicio', 'I'),
('f3', 'p2', 'p3', 'E', 'requisito', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesocondicion`
--

CREATE TABLE IF NOT EXISTS `procesocondicion` (
  `codF` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codP` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codSi` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codNo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `procesocondicion`
--

INSERT INTO `procesocondicion` (`codF`, `codP`, `codSi`, `codNo`) VALUES
('f1', 'p5', 'p6', 'p3'),
('f2', 'p4', 'p5', 'p2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `codR` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`codR`, `descripcion`) VALUES
('D', 'Decano'),
('E', 'Estudiante'),
('J', 'Jefe Academico'),
('K', 'Kardex'),
('S', 'Secretaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codU` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codR` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usr` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codU`, `codR`, `usr`, `pwd`) VALUES
('jpm', 'K', 'juan', '123456'),
('scm', 'E', 'moises', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `flujousuario`
--
ALTER TABLE `flujousuario`
  ADD PRIMARY KEY (`codF`,`codP`,`codT`), ADD KEY `codU` (`codU`);

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`codF`,`codP`), ADD KEY `codR` (`codR`);

--
-- Indices de la tabla `procesocondicion`
--
ALTER TABLE `procesocondicion`
  ADD PRIMARY KEY (`codF`,`codP`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`codR`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codU`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `flujousuario`
--
ALTER TABLE `flujousuario`
ADD CONSTRAINT `flujoUsuario_ibfk_1` FOREIGN KEY (`codU`) REFERENCES `usuario` (`codU`);

--
-- Filtros para la tabla `proceso`
--
ALTER TABLE `proceso`
ADD CONSTRAINT `proceso_ibfk_1` FOREIGN KEY (`codR`) REFERENCES `rol` (`codR`);

--
-- Filtros para la tabla `procesocondicion`
--
ALTER TABLE `procesocondicion`
ADD CONSTRAINT `procesoCondicion_ibfk_1` FOREIGN KEY (`codF`, `codP`) REFERENCES `proceso` (`codF`, `codP`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
