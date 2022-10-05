-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-10-2022 a las 10:37:33
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

CREATE TABLE `educacion` (
  `id` int(11) NOT NULL,
  `titulo_obtenido` varchar(45) DEFAULT NULL,
  `institucion_edu` varchar(45) DEFAULT NULL,
  `img_logo_edu` varchar(100) DEFAULT NULL,
  `fecha_inicio_edu` date DEFAULT NULL,
  `fecha_fin_edu` date DEFAULT NULL,
  `estado_edu` varchar(45) DEFAULT NULL,
  `info_id` int(11) NOT NULL,
  `estado_educacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_educacion`
--

CREATE TABLE `estado_educacion` (
  `id` int(11) NOT NULL,
  `tipo_estado` varchar(45) DEFAULT NULL,
  `educacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia`
--

CREATE TABLE `experiencia` (
  `id` int(11) NOT NULL,
  `nombre_empresa` varchar(45) DEFAULT NULL,
  `tareas_descripcion` varchar(200) DEFAULT NULL,
  `img_logo_exp` varchar(45) DEFAULT NULL,
  `fecha_inicio_exp` varchar(45) DEFAULT NULL,
  `fecha_fin_exp` varchar(45) DEFAULT NULL,
  `empleo_actual` tinyint(4) DEFAULT NULL,
  `info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `titulo_actividad` varchar(45) DEFAULT NULL,
  `nombre_apellido` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `img_perfil` varchar(100) DEFAULT NULL,
  `acerca_de_mi` varchar(255) DEFAULT NULL,
  `linkedin` varchar(45) DEFAULT NULL,
  `instagram` varchar(45) DEFAULT NULL,
  `github` varchar(45) DEFAULT NULL,
  `behance` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `nombre_pro` varchar(45) DEFAULT NULL,
  `desc_pro` varchar(255) DEFAULT NULL,
  `img_pro` varchar(100) DEFAULT NULL,
  `fecha_pro` varchar(45) DEFAULT NULL,
  `link_pro` varchar(45) DEFAULT NULL,
  `info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `nombre_skill` varchar(45) DEFAULT NULL,
  `desc_skill` varchar(255) DEFAULT NULL,
  `img_skill` varchar(100) DEFAULT NULL,
  `valoracion_skill` int(11) DEFAULT NULL,
  `info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_educacion_info_idx` (`info_id`),
  ADD KEY `fk_educacion_estado_educacion1_idx` (`estado_educacion_id`);

--
-- Indices de la tabla `estado_educacion`
--
ALTER TABLE `estado_educacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `experiencia`
--
ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_experiencia_info1_idx` (`info_id`);

--
-- Indices de la tabla `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proyectos_info1_idx` (`info_id`);

--
-- Indices de la tabla `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_skills_info1_idx` (`info_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD CONSTRAINT `fk_educacion_estado_educacion1` FOREIGN KEY (`estado_educacion_id`) REFERENCES `estado_educacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_educacion_info` FOREIGN KEY (`info_id`) REFERENCES `info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `experiencia`
--
ALTER TABLE `experiencia`
  ADD CONSTRAINT `fk_experiencia_info1` FOREIGN KEY (`info_id`) REFERENCES `info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `fk_proyectos_info1` FOREIGN KEY (`info_id`) REFERENCES `info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `fk_skills_info1` FOREIGN KEY (`info_id`) REFERENCES `info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
