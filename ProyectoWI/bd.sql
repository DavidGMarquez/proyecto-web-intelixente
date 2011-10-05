-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-04-2011 a las 17:45:23
-- Versión del servidor: 5.1.36
-- Versión de PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `dawa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `idArticulo` int(10) NOT NULL AUTO_INCREMENT,
  `codigoArticulo` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grupo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `album` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `unidades` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `anho` int(11) NOT NULL,
  PRIMARY KEY (`idArticulo`),
  UNIQUE KEY `codigo` (`codigoArticulo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcar la base de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`idArticulo`, `codigoArticulo`, `grupo`, `album`, `pais`, `precio`, `unidades`, `activo`, `imagen`, `anho`) VALUES
(1, 'd01', 'The Guo Brothers', 'Yuan', 'China', '14.95', 3, 1, '', 0),
(2, 'd02', 'Babatunde Olatunji', 'Drums of Passion', 'Nigeria', '16.95', 0, 1, '', 1982),
(3, 'd03', 'Tounami Diabate', 'Kaira', 'Mali', '16.95', 6, 1, '', 1975),
(4, 'd04', 'Eliades Ochoa', 'The Lion is Loose', 'Cuba', '13.95', 1, 1, '', 0),
(5, 'd05', 'Outback', 'Dance the Devil Away', 'Australia', '14.95', 1, 1, 'Beatles.jpg', 0),
(6, 'd06', 'Samulnori', 'Record of Changes', 'Korea', '12.95', 1, 1, '', 0),
(7, 'd07', 'Tounami Diabate', 'Djelika', 'Mali', '14.95', 1, 1, '', 0),
(8, 'd08', 'Nusrat Fateh Ali Khan', 'Rapture', 'Pakistan', '12.95', 1, 1, '', 0),
(9, 'd09', 'Cesaria Evora', 'Cesaria Evora', 'Cape Verde', '16.95', 7, 1, 'Sabina.jpg', 1954),
(10, 'd10', 'GSTIC', 'DAA', 'Spain', '50.00', 1, 1, '', 0),
(20, 'd11', 'ddd', 'dd', 'ddd', '12.34', 3, 0, '', 1964);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulovendido`
--

CREATE TABLE IF NOT EXISTS `articulovendido` (
  `idArtVendido` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `unidades` int(11) NOT NULL,
  `costeUnidad` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idArtVendido`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Volcar la base de datos para la tabla `articulovendido`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `codigoArticulo` varchar(20) NOT NULL,
  `comentario` text NOT NULL,
  PRIMARY KEY (`idComentario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcar la base de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idComentario`, `idUsuario`, `codigoArticulo`, `comentario`) VALUES
(1, 3, 'd05', 'este es el comentario 1'),
(2, 3, 'd03', 'kaira 1'),
(3, 3, 'd02', 'drums1'),
(4, 4, 'd05', 'este es el comentario2'),
(10, 6, 'd04', 'comentario de dani');



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE IF NOT EXISTS `direcciones` (
  `idDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(500) NOT NULL,
  `localidad` varchar(200) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `cp` varchar(5) NOT NULL,
  PRIMARY KEY (`idDireccion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Volcar la base de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`idDireccion`, `direccion`, `localidad`, `provincia`, `cp`) VALUES
(1, 'calle costa ', 'milladoiro', 'Pontevedra', '15895'),
(2, 'calle', 'localidad', 'provincia', '12345');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE IF NOT EXISTS `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `tipo`) VALUES
(1, 'admin'),
(2, 'basic'),
(3, 'VIP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  `totalCompra` float NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `password`, `telefono`, `email`, `activo`, `idTipoUsuario`, `idDireccion`, `totalCompra`) VALUES
(1, 'Vanesa Garcia2', 'patata', '9818989892', 'vanesagt@info.com', 0, 3, 1, 0),
(3, 'proba', 'proba1', '987656765', 'proba@proba.com', 1, 2, 1, 0),
(4, 'vanesa', '12345678', 'm', 'vanesa@vanesa.com', 1, 3, 1, 246.598),
(6, 'dani', 'dani11', '981292929', 'dani@dani.com', 1, 2, 1, 0),
(10, 'tomas', 'tomas1', '987232323', 'tomas@tomas.com', 1, 2, 1, 0),
(21, 'maria', 'maria1', '981292929', 'maria@maria.com', 0, 2, 2, 0),
(18, 'admin', 'admin1', '---', 'admin@tiendadawa.com', 1, 1, 1, 0),
(19, 'pepe', 'pepe11', '981292929', 'pepe@pepe.com', 1, 2, 1, 15),
(20, 'manuel', 'manuel', '981292929', 'manuel@manuel.com', 1, 2, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoraciones`
--

CREATE TABLE IF NOT EXISTS `valoraciones` (
  `idValoracion` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `codigoArticulo` varchar(20) NOT NULL,
  `valoracion` int(11) NOT NULL,
  PRIMARY KEY (`idValoracion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `valoraciones`
--

INSERT INTO `valoraciones` (`idValoracion`, `idUsuario`, `codigoArticulo`, `valoracion`) VALUES
(1, 4, 'd05', 8),
(6, 6, 'd04', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vender`
--

CREATE TABLE IF NOT EXISTS `vender` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` varchar(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `idDireccion` int(11) NOT NULL,
  PRIMARY KEY (`idVenta`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcar la base de datos para la tabla `vender`
--

