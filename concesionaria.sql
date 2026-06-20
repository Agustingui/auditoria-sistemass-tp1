-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-06-2026 a las 19:01:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `concesionaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_concesionaria`
--

CREATE TABLE `auditoria_concesionaria` (
  `id` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `accion` varchar(30) NOT NULL,
  `registro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria_concesionaria`
--

INSERT INTO `auditoria_concesionaria` (`id`, `fecha_hora`, `accion`, `registro_id`) VALUES
(1, '2026-06-12 04:04:36', 'INSERT', 1),
(2, '2026-06-12 04:12:49', 'INSERT', 2),
(3, '2026-06-12 04:13:55', 'UPDATE', 1),
(4, '2026-06-12 04:17:07', 'UPDATE', 1),
(5, '2026-06-12 04:17:19', 'UPDATE', 2),
(6, '2026-06-12 04:22:51', 'SOFT DELETE', 2),
(7, '2026-06-12 04:48:37', 'UPDATE', 1),
(8, '2026-06-12 14:24:24', 'SOFT DELETE', 2),
(9, '2026-06-12 15:22:00', 'INSERT', 3),
(10, '2026-06-12 15:57:05', 'UPDATE', 2),
(11, '2026-06-12 17:29:52', 'INSERT', 4),
(12, '2026-06-12 17:30:09', 'SOFT DELETE', 4),
(13, '2026-06-12 17:31:12', 'INSERT', 5),
(14, '2026-06-13 00:49:34', 'UPDATE', 1),
(15, '2026-06-13 00:52:20', 'UPDATE', 1),
(16, '2026-06-13 00:55:03', 'UPDATE', 1),
(17, '2026-06-13 00:59:57', 'UPDATE', 5),
(18, '2026-06-13 01:08:37', 'INSERT', 6),
(19, '2026-06-13 01:13:08', 'UPDATE', 6),
(20, '2026-06-13 01:19:12', 'UPDATE', 6),
(21, '2026-06-13 01:34:52', 'SOFT DELETE', 6),
(22, '2026-06-13 01:34:56', 'SOFT DELETE', 6),
(23, '2026-06-13 01:41:14', 'SOFT DELETE', 6),
(24, '2026-06-13 02:42:58', 'SOFT DELETE', 3),
(25, '2026-06-18 15:52:06', 'UPDATE', 5),
(26, '2026-06-18 16:37:39', 'INSERT', 7),
(27, '2026-06-18 16:47:30', 'UPDATE', 7),
(28, '2026-06-18 16:47:50', 'SOFT DELETE', 7),
(29, '2026-06-18 16:48:37', 'INSERT', 8),
(30, '2026-06-18 18:52:32', 'INSERT', 9),
(31, '2026-06-18 18:52:58', 'UPDATE', 9),
(32, '2026-06-18 18:53:26', 'SOFT DELETE', 9),
(33, '2026-06-18 20:17:57', 'UPDATE', 7),
(34, '2026-06-18 20:18:03', 'UPDATE', 7),
(35, '2026-06-19 16:57:58', 'INSERT', 10),
(36, '2026-06-19 16:58:04', 'UPDATE', 10),
(37, '2026-06-19 16:58:05', 'UPDATE', 10),
(38, '2026-06-19 16:58:10', 'UPDATE', 10),
(39, '2026-06-19 16:58:33', 'SOFT DELETE', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `borrado` tinyint(1) DEFAULT 0,
  `hash` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `telefono`, `borrado`, `hash`) VALUES
(1, 'Agustin', '3436471543', 0, 'd82b8077c72aecabf46c7c07f63870d43c94911806338ca1933b1f66eb865618'),
(2, 'Maximiliano', '3436127154', 0, 'd35f1ce530b302c840c0e12f3bd84cd6317f52b15b10d3f6d22e3139bd73146e'),
(3, 'Mateo', '3436403563', 0, 'ccd184f78955801c64dc3f9ecda40c14754ac498deb005abaed0c544afb83de2'),
(4, 'Alejo', '3436470982', 1, '768e579b142d231f686c8731126a6606e0fa6452cc6ed8d26599dc55a2ba8ec8'),
(5, 'Franco', '3402482571', 0, '488c701d2a32ba1b5aed0872ce4149940c8eb50e8e5bc1f0f1397cd2fe4a0fb6'),
(6, 'Matias', '3436168234', 1, 'a9d77c6c27a9b7da9b6fc0b4fb9825ed68cfdff0697e6e9dd2b949870ebb1862'),
(7, 'Angel', '3436824732', 0, '5f8655f30bfc6591c641f1a1d5bdc3a941a58d3571dbe2476d86d7a2b5ce95b0'),
(9, 'Agustin', '3436471543', 1, 'cd96bd22ae18ada1b6e9edb0dd0f5ba2721f00b244b612685a6319081a6c0bb3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria_concesionaria`
--
ALTER TABLE `auditoria_concesionaria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria_concesionaria`
--
ALTER TABLE `auditoria_concesionaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
