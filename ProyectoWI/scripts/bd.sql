-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-10-2011 a las 21:19:19
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
  `precio` decimal(10,2) NOT NULL,
  `unidades` int(11) NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `idPelicula` int(11) NOT NULL,
  `idCluster` MEDIUMINT(5) NOT NULL DEFAULT '0',
  `tipo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idArticulo`),
  UNIQUE KEY `codigo` (`codigoArticulo`),
  UNIQUE KEY `idPelicula` (`idPelicula`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;



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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `articulovendido`
--

INSERT INTO `articulovendido` (`idArtVendido`, `idVenta`, `codigo`, `unidades`, `costeUnidad`) VALUES
(1, 1, 'pel103d', 2, 25.30);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idComentario`, `idUsuario`, `codigoArticulo`, `comentario`) VALUES
(1, 18, 'pel103d', 'Jumanjiiii');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`idDireccion`, `direccion`, `localidad`, `provincia`, `cp`) VALUES
(1, 'calle costa ', 'milladoiro', 'Pontevedra', '15895'),
(2, 'calle', 'localidad', 'provincia', '12345'),
(3, 'calle costa ', 'milladoiro', 'Pontevedra', '15895');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE IF NOT EXISTS `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipousuario`
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
  `totalCompra` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `usuarios`
--
-- Ids de usuarios existentes no dataset de movielens
INSERT INTO `usuarios` (`idUsuario`, `nombre`, `password`, `telefono`, `email`, `activo`, `idTipoUsuario`, `idDireccion`, `totalCompra`) VALUES
(75, 'Vanesa Garcia2', 'patata', '9818989892', 'vanesagt@info.com', 0, 3, 1, 0),
(78, 'proba', 'proba1', '987656765', 'proba@proba.com', 1, 2, 1, 0),
(1860, 'vanesa', '12345678', 'm', 'vanesa@vanesa.com', 1, 3, 1, 246.598),
(190, 'dani', 'dani11', '981292929', 'dani@dani.com', 1, 2, 1, 0),
(175, 'tomas', 'tomas1', '987232323', 'tomas@tomas.com', 1, 2, 1, 0),
(267, 'maria', 'maria1', '981292929', 'maria@maria.com', 0, 2, 2, 0),
(466, 'admin', 'admin1', '---', 'admin@tiendadawa.com', 1, 1, 1, 50.6),
(7711, 'pepe', 'pepe11', '981292929', 'pepe@pepe.com', 1, 2, 1, 15),
(8114, 'manuel', 'manuel', '981292929', 'manuel@manuel.com', 1, 2, 1, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `valoraciones`
--

INSERT INTO `valoraciones` (`idValoracion`, `idUsuario`, `codigoArticulo`, `valoracion`) VALUES
(1, 18, 'pel103d', 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `vender`
--

INSERT INTO `vender` (`idVenta`, `idUsuario`, `fecha`, `idDireccion`) VALUES
(1, '18', '2011-10-18 20:03:15', 48);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
