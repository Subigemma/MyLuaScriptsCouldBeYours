--
-- Base de datos: `characters`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LD_PlayerPJ`
--

CREATE TABLE `LD_PlayerPJ` (
  `LD_Player` varchar(50) NOT NULL,
  `LD_PJ` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `LD_PlayerPJ`
  ADD UNIQUE KEY `IDX_PlayerPJ` (`LD_PJ`);
COMMIT;
