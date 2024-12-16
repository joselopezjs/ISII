-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-12-2024 a las 10:37:43
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemaweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(100) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `stock` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` enum('disponible','agotado','en_pedido') DEFAULT 'disponible',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `producto`, `codigo`, `descripcion`, `stock`, `precio`, `fecha_ingreso`, `proveedor`, `ubicacion`, `fecha_actualizacion`, `estado`) VALUES
(1, 'prueba', '123456', 'esta es la prueba de los registros par el control de inventario', 18, 45.00, '2024-11-15', 'prueba', 'hermosillo', '2024-12-16 03:07:36', 'disponible'),
(3, 'Auriculares inalámbricos', 'AUD002', 'Auriculares Bluetooth', 25, 80.00, '2023-12-05', 'Sonido Express', 'Sección Audio', '2024-12-16 03:07:36', 'disponible'),
(4, 'Laptop gaming', 'LAP003', 'Portátil para juegos', 5, 1200.00, '2023-11-18', 'TecnoWorld', 'Sección Computación', '2024-12-16 03:07:36', 'disponible'),
(5, 'Teléfono móvil', 'TEL004', 'Smartphone 5G', 15, 450.00, '2023-12-10', 'MovilMax', 'Sección Telefonía', '2024-12-16 03:07:36', 'disponible'),
(6, 'Tablet', 'TAB005', 'Tablet Android', 20, 300.00, '2023-11-22', 'TecnoWorld', 'Sección Computación', '2024-12-16 03:07:36', 'disponible'),
(7, 'Consola de videojuegos', 'CON006', 'PlayStation 5', 3, 550.00, '2023-11-28', 'Videojuegos Pro', 'Sección Videojuegos', '2024-12-16 03:07:36', 'disponible'),
(8, 'Zapatilla deportiva', ' ZAP007', 'Zapatillas running', 30, 70.00, '2023-12-03', 'Deporte Total', 'Sección Deportes', '2024-12-16 03:07:36', 'disponible'),
(9, 'Reloj inteligente', 'REL008', 'Smartwatch', 18, 200.00, '2023-11-25', 'Electrónica Plus', 'Sección Electrónica', '2024-12-16 03:07:36', 'disponible'),
(10, 'Bicicleta', 'BIC009', 'Bicicleta de montaña', 8, 350.00, '2023-11-27', 'Deporte Total', 'Sección Deportes', '2024-12-16 03:07:36', 'disponible'),
(11, 'Libro', 'LIB010', 'Novela de misterio', 50, 15.00, '2023-12-02', 'Librería Central', 'Sección Libros', '2024-12-16 03:07:36', 'disponible'),
(12, 'DVD', 'DVD011', 'Película de acción', 20, 10.00, '2023-11-29', 'Videoclub', 'Sección Cine', '2024-12-16 03:07:36', 'disponible'),
(13, 'Juego de mesa', 'JUE012', 'Monopoly', 12, 30.00, '2023-12-04', 'Juguetería', 'Sección Juegos', '2024-12-16 03:07:36', 'disponible'),
(14, 'Cafetera', 'CAF013', 'Cafetera express', 15, 180.00, '2023-11-30', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:07:36', 'disponible'),
(15, 'Licuadora', 'LIC014', 'Licuadora profesional', 10, 120.00, '2023-12-01', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:07:36', 'disponible'),
(16, 'Freidora de aire', 'FRI015', 'Freidora sin aceite', 8, 90.00, '2023-12-02', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:07:36', 'disponible'),
(17, 'Impresora 3D', 'IMP031', 'Impresora 3D para hobby', 8, 400.00, '2023-11-28', 'Tecnología 3D', 'Sección Tecnología', '2024-12-16 03:07:36', 'disponible'),
(18, 'Scooter eléctrico', 'SCO032', 'Patinete eléctrico plegable', 12, 300.00, '2023-12-03', 'Movilidad Urbana', 'Sección Deportes', '2024-12-16 03:07:36', 'disponible'),
(19, 'Auriculares con cancelación de ruido', 'AUD033', 'Sony WH-1000XM5', 10, 350.00, '2023-11-29', 'Sonido Express', 'Sección Audio', '2024-12-16 03:07:36', 'disponible'),
(20, 'Cafetera de cápsulas', 'CAF034', 'Nespresso VertuoLine', 15, 120.00, '2023-12-04', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:07:36', 'disponible'),
(21, 'Tostadora', 'TOS035', 'Tostadora de pan con funciones extra', 20, 50.00, '2023-11-25', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:07:36', 'disponible'),
(22, 'Batidora de mano', 'BAT036', 'Batidora eléctrica con accesorios', 18, 40.00, '2023-11-27', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:07:36', 'disponible'),
(23, 'Plancha de ropa', 'PLA037', 'Plancha a vapor con suela cerámica', 12, 60.00, '2023-12-02', 'Electrodomésticos', 'Sección Hogar', '2024-12-16 03:07:36', 'disponible'),
(24, 'Ventilador de techo', 'VEN038', 'Ventilador con luz LED', 10, 100.00, '2023-11-29', 'Iluminación y Ventilación', 'Sección Hogar', '2024-12-16 03:07:36', 'disponible'),
(25, 'Smartwatch para niños', 'REL039', 'Reloj inteligente con GPS', 15, 150.00, '2023-12-04', 'Electrónica Plus', 'Sección Electrónica', '2024-12-16 03:07:36', 'disponible'),
(26, 'Auriculares gaming', 'AUD040', 'Auriculares con micrófono para gaming', 8, 80.00, '2023-11-25', 'Sonido Express', 'Sección Gaming', '2024-12-16 03:07:36', 'disponible'),
(27, 'Consola retro', 'CON041', 'Super Nintendo Mini', 5, 100.00, '2023-11-27', 'Videojuegos Pro', 'Sección Videojuegos', '2024-12-16 03:07:36', 'disponible'),
(28, 'Libro de autoayuda', 'LIB042', 'Desarrollo personal', 20, 12.00, '2023-12-02', 'Librería Central', 'Sección Libros', '2024-12-16 03:07:36', 'disponible'),
(29, 'Bicicleta estática plegable', 'BIC043', 'Bicicleta para espacios reducidos', 8, 180.00, '2023-11-29', 'Deporte Total', 'Sección Deportes', '2024-12-16 03:07:36', 'disponible'),
(30, 'Proyector portátil', 'PRO044', 'Mini proyector para cine en casa', 6, 250.00, '2023-12-04', 'Electrónica Plus', 'Sección Electrónica', '2024-12-16 03:07:36', 'disponible'),
(31, 'Juego de mesa familiar', 'JUE045', 'Carcassonne', 12, 35.00, '2023-11-25', 'Juguetería', 'Sección Juegos', '2024-12-16 03:07:36', 'disponible'),
(32, 'Smartphone Flagship', 'SM01', 'Último modelo de teléfono inteligente', 20, 800.00, '2023-11-25', 'TechCorp', 'Sección Electrónica', '2023-12-16 00:00:00', 'disponible'),
(33, 'Laptop Gamer', 'LP02', 'Portátil para juegos de alta gama', 10, 1200.00, '2023-12-01', 'GamerTech', 'Sección Computación', '2023-12-16 00:00:00', 'disponible'),
(34, 'Smartwatch deportivo', 'SW03', 'Reloj inteligente con GPS', 15, 250.00, '2023-11-20', 'Electrónica Plus', 'Sección Electrónica', '2024-12-16 03:13:58', 'disponible'),
(35, 'Consola retro', 'CN04', 'Nintendo Switch', 5, 300.00, '2023-11-28', 'Videojuegos Pro', 'Sección Videojuegos', '2024-12-16 03:13:58', 'en_pedido'),
(36, 'Auriculares inalámbricos', 'AU05', 'Auriculares con cancelación de ruido', 30, 150.00, '2023-12-03', 'Sonido Express', 'Sección Audio', '2024-12-16 03:13:58', 'disponible'),
(37, 'Tablet de dibujo', 'TB06', 'Tablet gráfica para diseño', 8, 400.00, '2023-11-25', 'Creativo Tech', 'Sección Diseño', '2024-12-16 03:13:58', 'disponible'),
(38, 'Bicicleta eléctrica', 'BC07', 'Bicicleta plegable con asistencia eléctrica', 10, 800.00, '2023-11-27', 'Movilidad Urbana', 'Sección Deportes', '2024-12-16 03:13:58', 'disponible'),
(39, 'Cámara de acción', 'CM08', 'Cámara 4K resistente al agua', 12, 350.00, '2023-11-29', 'FotoMundo', 'Sección Fotografía', '2024-12-16 03:13:58', 'disponible'),
(40, 'Drone con cámara', 'DR09', 'Drone para fotografía aérea', 5, 500.00, '2023-12-02', 'Tecnología Aérea', 'Sección Electrónica', '2024-12-16 03:13:58', 'en_pedido'),
(41, 'Impresora 3D', 'IP3D10', 'Impresora 3D de resina', 8, 600.00, '2023-11-25', 'Tecnología 3D', 'Sección Tecnología', '2024-12-16 03:13:58', 'disponible'),
(42, 'Monitor curvo gaming', 'MN11', 'Monitor 4K con alta tasa de refresco', 10, 500.00, '2023-12-01', 'Electrónica Plus', 'Sección Computación', '2024-12-16 03:13:58', 'disponible'),
(43, 'Teclado mecánico', 'TC12', 'Teclado mecánico RGB con switch azul', 15, 120.00, '2023-11-28', 'Periféricos Gamer', 'Sección Computación', '2024-12-16 03:13:58', 'disponible'),
(44, 'Ratón gaming inalámbrico', 'RT13', 'Ratón gaming con sensor óptico', 12, 60.00, '2023-12-03', 'Periféricos Gamer', 'Sección Computación', '2024-12-16 03:13:58', 'disponible'),
(45, 'Auriculares gaming', 'AG14', 'Auriculares con sonido envolvente 7.1', 20, 150.00, '2023-11-25', 'Sonido Express', 'Sección Gaming', '2024-12-16 03:13:58', 'disponible'),
(46, 'Consola retro', 'CNRT15', 'Super Nintendo Mini', 8, 80.00, '2023-11-27', 'Videojuegos Pro', 'Sección Videojuegos', '2024-12-16 03:13:58', 'disponible'),
(47, 'Libro de programación', 'LB16', 'JavaScript avanzado', 30, 30.00, '2023-12-02', 'Librería Central', 'Sección Libros', '2024-12-16 03:13:58', 'disponible'),
(48, 'Cafetera espresso', 'CF17', 'Cafetera espresso automática', 15, 300.00, '2023-11-29', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:13:58', 'disponible'),
(49, 'Tostadora inteligente', 'TO18', 'Tostadora con control por app', 20, 50.00, '2023-12-04', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:13:58', 'disponible'),
(50, 'Licuadora profesional', 'LC19', 'Licuadora de alta velocidad', 10, 150.00, '2023-11-25', 'Electrodomésticos', 'Sección Cocina', '2024-12-16 03:13:58', 'disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nivel_acceso` enum('admin','estandar') NOT NULL DEFAULT 'estandar',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `nivel_acceso`) VALUES
(1, 'admin', 'admin', 'estandar'),
(2, 'prueba', 'prueba', 'estandar'),
(3, 'usuario', 'usuario', 'estandar'),
(4, 'jose', 'jj', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_ventas` int DEFAULT NULL,
  `total_ventas` decimal(15,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ventas_inventario` (`producto_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `num_ventas`, `total_ventas`, `fecha`, `producto_id`) VALUES
(1, 10, 6790.00, '2020-03-02', NULL),
(6, 159, 123456.00, '2024-12-15', NULL),
(3, 20, 12790.00, '2020-03-04', NULL),
(4, 30, 15790.00, '2024-03-05', NULL),
(5, 40, 21790.00, '2020-03-06', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
