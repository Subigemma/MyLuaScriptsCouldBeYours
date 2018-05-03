--
-- Base de datos: `characters`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LD_SystemVars`
--

CREATE TABLE `LD_SystemVars` (
  `LD_NAME` varchar(50) NOT NULL,
  `LD_TYPE` varchar(50) NOT NULL,
  `LD_SUBTYPE` varchar(100) NOT NULL,
  `LD_VALUE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `LD_SystemVars`
  ADD PRIMARY KEY (`LD_NAME`,`LD_TYPE`,`LD_SUBTYPE`);
COMMIT;
