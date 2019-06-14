-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-06-2019 a las 09:58:00
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tutorDEV`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, '12345', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:10:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"b4620e0e-20f3-4f26-89b5-1490db53a44d\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560303572, 0.00871301, '1', 200),
(2, 'TutorService/RegistrarTutor', 'post', 'a:9:{s:6:\"SASSSD\";s:6:\"SDSDSD\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"79f861f2-2232-4755-ac73-f2c7829b011e\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560303576, 0.00776601, '1', 200),
(3, 'TutorService/RegistrarTutor', 'post', 'a:9:{s:6:\"SASSSD\";s:6:\"SDSDSD\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"75d0b0fc-f177-4ca2-9cb1-29a8686dc15e\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560471755, 0.210669, '0', 403),
(4, 'TutorService/RegistrarTutor', 'post', 'a:9:{s:10:\"X-API-KEY\'\";s:5:\"12345\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"d92fc0f1-f88b-450e-8c4d-d00372ad7511\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560472548, 0.0358169, '0', 403),
(5, 'TutorService/RegistrarTutor', 'post', 'a:9:{s:9:\"X-API-KEY\";s:5:\"12345\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"86c489a3-a3a7-4705-b0b4-45d9385d9972\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:14:\"content-length\";s:1:\"0\";s:10:\"Connection\";s:10:\"keep-alive\";}', '12345', '127.0.0.1', 1560472571, 0.0237248, '1', 200),
(6, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:5:\"12345\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"623967a2-99ab-4f56-8565-0791b54b5846\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '12345', '127.0.0.1', 1560472586, 0.0274889, '1', 200),
(7, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:4:\"1234\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"0c4e8f7f-9a8e-4c9b-a1bc-7de23a873d58\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560472591, 0.00987411, '0', 403),
(8, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:4:\"1234\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"45a374f8-8310-487d-8ee2-dc6c1b4bcd5e\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560473500, 0.00982499, '1', 200),
(9, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:4:\"1234\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"49fba392-50d6-428d-80b1-605631ac887f\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560473526, 0.010386, '1', 200),
(10, 'TutorService/ObtenerTutores', 'get', 'a:8:{s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:33:\"application/json, text/plain, */*\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560476155, 0.0132599, '1', 200),
(11, 'TutorService/ObtenerTutores', 'get', 'a:8:{s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:33:\"application/json, text/plain, */*\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560477309, 0.0131619, '1', 200),
(12, 'TutorService/ObtenerTutores', 'get', 'a:8:{s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:33:\"application/json, text/plain, */*\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560477454, 0.0156751, '1', 200),
(13, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:33:\"application/json, text/plain, */*\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560477692, 0.011523, '1', 200),
(14, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:4:\"1234\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"646d8c6a-11c6-4366-8a8a-c321544acac3\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560495801, 0.0191839, '1', 200),
(15, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:4:\"1234\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"7c3f5c75-cd41-4378-ac4c-42ed32536abc\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560495863, 0.010679, '0', 403),
(16, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'option', 'a:12:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:29:\"Access-Control-Request-Method\";s:3:\"GET\";s:30:\"Access-Control-Request-Headers\";s:9:\"x-api-key\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560495914, 0.009444, '0', 0),
(17, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'option', 'a:12:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:29:\"Access-Control-Request-Method\";s:3:\"GET\";s:30:\"Access-Control-Request-Headers\";s:9:\"x-api-key\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560496004, 0.00703502, '0', 0),
(18, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521:', 'get', 'a:10:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:12:\"-74.0524521:\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560496012, 0.08373, '0', 403),
(19, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:5:\"12345\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"4935f4c5-094d-49cd-9a44-4aa07b17c637\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '12345', '127.0.0.1', 1560496317, 0.0256801, '1', 200),
(20, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'option', 'a:12:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:29:\"Access-Control-Request-Method\";s:3:\"GET\";s:30:\"Access-Control-Request-Headers\";s:9:\"x-api-key\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560496442, 0.0065999, '0', 0),
(21, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'option', 'a:12:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:29:\"Access-Control-Request-Method\";s:3:\"GET\";s:30:\"Access-Control-Request-Headers\";s:9:\"x-api-key\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560498275, 0.026021, '0', 0),
(22, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'get', 'a:10:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560498296, 0.0269461, '0', 403),
(23, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'option', 'a:12:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:29:\"Access-Control-Request-Method\";s:3:\"GET\";s:30:\"Access-Control-Request-Headers\";s:9:\"x-api-key\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560498369, 0.0172741, '0', 0),
(24, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'option', 'a:12:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:29:\"Access-Control-Request-Method\";s:3:\"GET\";s:30:\"Access-Control-Request-Headers\";s:9:\"x-api-key\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560498611, 0.018846, '0', 0),
(25, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'option', 'a:12:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:29:\"Access-Control-Request-Method\";s:3:\"GET\";s:30:\"Access-Control-Request-Headers\";s:9:\"x-api-key\";s:7:\"Referer\";s:26:\"http://localhost:8100/home\";s:6:\"Origin\";s:21:\"http://localhost:8100\";s:10:\"Connection\";s:10:\"keep-alive\";}', '', '127.0.0.1', 1560498729, 0.022049, '0', 0),
(26, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0624521', 'get', 'a:11:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0624521\";s:9:\"X-API-KEY\";s:5:\"12345\";s:10:\"User-Agent\";s:21:\"PostmanRuntime/7.13.0\";s:6:\"Accept\";s:3:\"*/*\";s:13:\"Cache-Control\";s:8:\"no-cache\";s:13:\"Postman-Token\";s:36:\"21a90f67-c297-47ed-8be6-72117f68cff7\";s:4:\"Host\";s:14:\"localhost:8080\";s:15:\"accept-encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";i:1;s:1:\"1\";}', '12345', '127.0.0.1', 1560498735, 0.00986004, '1', 200),
(27, 'TutorService/ObtenerTutores/1/1/4.6665578/-74.0524521', 'get', 'a:10:{i:0;s:1:\"1\";s:9:\"4.6665578\";s:11:\"-74.0524521\";s:4:\"Host\";s:14:\"localhost:8080\";s:10:\"User-Agent\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:64.0) Gecko/20100101 Firefox/64.0\";s:6:\"Accept\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:15:\"Accept-Language\";s:35:\"es-MX,es;q=0.8,en-US;q=0.5,en;q=0.3\";s:15:\"Accept-Encoding\";s:13:\"gzip, deflate\";s:10:\"Connection\";s:10:\"keep-alive\";s:25:\"Upgrade-Insecure-Requests\";s:1:\"1\";i:1;s:1:\"1\";}', '', '127.0.0.1', 1560498767, 0.0129151, '0', 403);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idMateria` int(11) NOT NULL,
  `nombreMateria` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idMateria`, `nombreMateria`) VALUES
(1, 'Matemáticas'),
(2, 'Fìsica'),
(3, 'Inglés'),
(4, 'Programación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `idTutor` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(100) COLLATE utf8_bin NOT NULL,
  `correo` varchar(30) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(20) COLLATE utf8_bin NOT NULL,
  `link` varchar(100) COLLATE utf8_bin NOT NULL,
  `latitud` decimal(10,8) DEFAULT NULL,
  `longitud` decimal(10,8) DEFAULT NULL,
  `comentarios` varchar(100) COLLATE utf8_bin NOT NULL,
  `fechaRegistro` date NOT NULL,
  `fechaUltimoPago` date DEFAULT NULL,
  `fechaProximoPago` date DEFAULT NULL,
  `procesado` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`idTutor`, `nombre`, `direccion`, `correo`, `telefono`, `link`, `latitud`, `longitud`, `comentarios`, `fechaRegistro`, `fechaUltimoPago`, `fechaProximoPago`, `procesado`, `activo`) VALUES
(1, 'Centro Comercial Andino', 'Carrera 11 #82-71', '', '', '', '4.66655780', '74.05245210', '', '0000-00-00', NULL, NULL, 0, 0),
(2, 'Centro Comercial el Retiro ', 'Calle 81 #11-94', '', '', '', '4.66562460', '-74.05430600', '', '0000-00-00', NULL, NULL, 0, 0),
(3, 'Centro Comercial Atlantis', 'Calle 81 #13-05', '', '', '', '4.66631790', '-74.05535130', '', '0000-00-00', NULL, NULL, 0, 0),
(4, 'Carulla de la 85 ', 'Calle 85 #15-29', '', '', '', '4.67010160', '-74.05545810', '', '0000-00-00', NULL, NULL, 0, 0),
(5, 'El Corral Parque de la 93', 'Calle 93A #12-57', '', '', '', '4.67667580', '-74.04890440', '', '0000-00-00', NULL, NULL, 0, 0),
(6, 'Centro Comercial AV Chile', 'Calle 73 #10-83', '', '', '', '4.65820170', '-74.05784610', '', '0000-00-00', NULL, NULL, 0, 0),
(7, 'Angel', 'Calle Tulipanes', '', '', '', '7.11100000', '-74.23230000', '', '0000-00-00', NULL, NULL, 0, 0),
(8, 'Fernando', 'Calle Tulipanes', '', '', '', '7.11100000', '-74.23230000', '', '0000-00-00', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutoresMaterias`
--

CREATE TABLE `tutoresMaterias` (
  `id` int(11) NOT NULL,
  `idTutor` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tutoresMaterias`
--

INSERT INTO `tutoresMaterias` (`id`, `idTutor`, `idMateria`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 1),
(5, 4, 3),
(6, 4, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`idTutor`);

--
-- Indices de la tabla `tutoresMaterias`
--
ALTER TABLE `tutoresMaterias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `idTutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
