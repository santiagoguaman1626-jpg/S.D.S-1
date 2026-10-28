-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2026 a las 15:48:03
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
-- Base de datos: `sds`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Motor', 'Repuestos relacionados con el motor'),
(2, 'Frenos', 'Elementos del sistema de frenado'),
(3, 'Suspension', 'Repuestos para el sistema de suspension'),
(4, 'Electricidad', 'Componentes electricos del vehiculo'),
(5, 'Filtros', 'Filtros para diferentes sistemas'),
(6, 'Lubricantes', 'Aceites y lubricantes'),
(7, 'Transmision', 'Repuestos de transmision'),
(8, 'Direccion', 'Componentes del sistema de direccion'),
(9, 'Refrigeracion', 'Elementos del sistema de refrigeracion'),
(10, 'Carroceria', 'Partes externas del vehiculo'),
(11, 'Iluminacion', 'Luces y elementos de iluminacion'),
(12, 'Escape', 'Componentes del sistema de escape'),
(13, 'Embrague', 'Repuestos del sistema de embrague'),
(14, 'Rodamientos', 'Rodamientos para vehiculos'),
(15, 'Accesorios', 'Accesorios para vehiculos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`) VALUES
(1, 'Juan', 'Perez', 'juan.perez@gmail.com', '3001111111', 'Bogota'),
(2, 'Maria', 'Gomez', 'maria.gomez@gmail.com', '3002222222', 'Bogota'),
(3, 'Carlos', 'Rodriguez', 'carlos.rodriguez@gmail.com', '3003333333', 'Bogota'),
(4, 'Laura', 'Martinez', 'laura.martinez@gmail.com', '3004444444', 'Bogota'),
(5, 'Andres', 'Lopez', 'andres.lopez@gmail.com', '3005555555', 'Bogota'),
(6, 'Sofia', 'Torres', 'sofia.torres@gmail.com', '3006666666', 'Bogota'),
(7, 'Daniel', 'Hernandez', 'daniel.hernandez@gmail.com', '3007777777', 'Bogota'),
(8, 'Valentina', 'Castro', 'valentina.castro@gmail.com', '3008888888', 'Bogota'),
(9, 'Sebastian', 'Moreno', 'sebastian.moreno@gmail.com', '3009999999', 'Bogota'),
(10, 'Camila', 'Ramirez', 'camila.ramirez@gmail.com', '3011111111', 'Bogota'),
(11, 'Nicolas', 'Vargas', 'nicolas.vargas@gmail.com', '3012222222', 'Bogota'),
(12, 'Gabriela', 'Rojas', 'gabriela.rojas@gmail.com', '3013333333', 'Bogota'),
(13, 'Mateo', 'Jimenez', 'mateo.jimenez@gmail.com', '3014444444', 'Bogota'),
(14, 'Isabella', 'Mendoza', 'isabella.mendoza@gmail.com', '3015555555', 'Bogota'),
(15, 'Santiago', 'Nieves', 'santiago.nieves@gmail.com', '3016666666', 'Bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS (`cantidad` * `precio_unitario`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 1, 18000.00),
(2, 2, 2, 1, 85000.00),
(3, 3, 3, 1, 180000.00),
(4, 4, 4, 1, 320000.00),
(5, 5, 5, 1, 25000.00),
(6, 6, 6, 1, 45000.00),
(7, 7, 7, 1, 280000.00),
(8, 8, 8, 1, 75000.00),
(9, 9, 9, 1, 350000.00),
(10, 10, 10, 1, 95000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `fecha_pago` datetime DEFAULT current_timestamp(),
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `estado_pago` varchar(50) DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_pedido`, `fecha_pago`, `monto`, `metodo_pago`, `estado_pago`) VALUES
(11, 11, '2026-08-20 00:00:00', 40000.00, 'Efectivo', 'Pagado'),
(12, 12, '2026-08-21 00:00:00', 225000.00, 'Tarjeta', 'Pagado'),
(13, 13, '2026-08-22 00:00:00', 430000.00, 'Transferencia', 'Pagado'),
(14, 14, '2026-08-23 00:00:00', 70000.00, 'Efectivo', 'Pagado'),
(15, 15, '2026-08-24 00:00:00', 35000.00, 'Tarjeta', 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `estado` varchar(50) DEFAULT 'Pendiente',
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha_pedido`, `estado`, `total`, `id_cliente`) VALUES
(1, '2026-08-01 00:00:00', 'Pendiente', 18000.00, 1),
(2, '2026-08-02 00:00:00', 'Pendiente', 85000.00, 2),
(3, '2026-08-03 00:00:00', 'Pendiente', 180000.00, 3),
(4, '2026-08-04 00:00:00', 'Pendiente', 320000.00, 4),
(5, '2026-08-05 00:00:00', 'Pendiente', 25000.00, 5),
(6, '2026-08-06 00:00:00', 'Pendiente', 45000.00, 6),
(7, '2026-08-07 00:00:00', 'Pendiente', 280000.00, 7),
(8, '2026-08-08 00:00:00', 'Pendiente', 75000.00, 8),
(9, '2026-08-09 00:00:00', 'Pendiente', 350000.00, 9),
(10, '2026-08-10 00:00:00', 'Pendiente', 95000.00, 10),
(11, '2026-08-11 00:00:00', 'Pendiente', 35000.00, 11),
(12, '2026-08-12 00:00:00', 'Pendiente', 220000.00, 12),
(13, '2026-08-13 00:00:00', 'Pendiente', 420000.00, 13),
(14, '2026-08-14 00:00:00', 'Pendiente', 65000.00, 14),
(15, '2026-08-15 00:00:00', 'Pendiente', 30000.00, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `id_categoria`) VALUES
(1, 'Bujia', 'Bujia para motor', 20000.00, 50, 1),
(2, 'Pastillas de freno', 'Pastillas delanteras', 90000.00, 30, 2),
(3, 'Amortiguador', 'Amortiguador delantero', 180000.00, 25, 3),
(4, 'Bateria', 'Bateria para vehiculo', 330000.00, 15, 4),
(5, 'Filtro de aceite', 'Filtro para aceite de motor', 25000.00, 70, 5),
(6, 'Aceite 20W50', 'Aceite para motor', 45000.00, 80, 6),
(7, 'Kit de transmision', 'Kit para transmision', 280000.00, 10, 7),
(8, 'Terminal de direccion', 'Terminal para direccion', 75000.00, 25, 8),
(9, 'Radiador', 'Radiador para vehiculo', 350000.00, 8, 9),
(10, 'Espejo lateral', 'Espejo lateral derecho', 95000.00, 18, 10),
(11, 'Bombillo LED', 'Bombillo LED para farola', 35000.00, 40, 11),
(12, 'Silenciador', 'Silenciador de escape', 220000.00, 12, 12),
(13, 'Kit de embrague', 'Kit completo de embrague', 420000.00, 7, 13),
(14, 'Rodamiento', 'Rodamiento de rueda', 65000.00, 35, 14),
(15, 'Cubrevolante', 'Cubrevolante universal', 30000.00, 45, 15);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
