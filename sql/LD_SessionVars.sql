--
-- Base de datos: `characters`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LD_SessionVars`
--

CREATE TABLE `LD_SessionVars` (
  `LD_PJ` varchar(50) NOT NULL,
  `LD_INDEX` varchar(20) NOT NULL,
  `LD_VALUE` varchar(255) NOT NULL,
  `LD_TYPE` varchar(10) NOT NULL,
  `LD_DATEUP` bigint(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indices de la tabla `LD_SessionVars`
--
ALTER TABLE `LD_SessionVars`
  ADD PRIMARY KEY (`LD_PJ`,`LD_INDEX`);
COMMIT;
