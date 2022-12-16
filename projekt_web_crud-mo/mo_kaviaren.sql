-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Pi 16.Dec 2022, 20:14
-- Verzia serveru: 10.4.27-MariaDB
-- Verzia PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `mo_kaviaren`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `alergen`
--

CREATE TABLE `alergen` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `alergen`
--

INSERT INTO `alergen` (`id`, `nazov`) VALUES
(1, 'Obiloviny obsahujúce lepok'),
(2, 'Kôrovce'),
(3, 'Vajcia'),
(4, 'Ryby'),
(5, 'Arašidy'),
(6, 'Sójové bôby'),
(7, 'Mlieko'),
(8, 'Orechy'),
(9, 'Zeler'),
(10, 'Horčica'),
(11, 'Sezamové semeno'),
(12, 'Oxid siričitý a siričitany'),
(13, 'Vlčí bôb'),
(14, 'Mäkkýše');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `zobr_nazov` varchar(255) NOT NULL,
  `sys_nazov` varchar(255) NOT NULL,
  `cesta_path` varchar(255) NOT NULL,
  `vytvorene` date NOT NULL,
  `upravene` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `menu`
--

INSERT INTO `menu` (`id`, `zobr_nazov`, `sys_nazov`, `cesta_path`, `vytvorene`, `upravene`) VALUES
(1, 'Home', 'home', 'index.php', '2022-12-15', '2022-12-15'),
(2, 'Today Special', 'today special', 'today-special.php', '2022-12-15', '2022-12-15'),
(3, 'Menu', 'menu', 'menu.php', '2022-12-15', '2022-12-15'),
(4, 'Contact', 'contact', 'contact.php', '2022-12-15', '2022-12-15');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `napoj`
--

CREATE TABLE `napoj` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) NOT NULL,
  `popis` text NOT NULL,
  `mnozstvo` varchar(255) NOT NULL,
  `cena` decimal(5,2) NOT NULL,
  `napoj_typ_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `napoj`
--

INSERT INTO `napoj` (`id`, `nazov`, `popis`, `mnozstvo`, `cena`, `napoj_typ_id`, `active`) VALUES
(1, 'Espresso', '7,5 g', '1', '2.50', 1, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `napoj_typ`
--

CREATE TABLE `napoj_typ` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `napoj_typ`
--

INSERT INTO `napoj_typ` (`id`, `nazov`) VALUES
(1, 'káva'),
(2, 'čaj'),
(3, 'alko'),
(4, 'nealko');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `snack`
--

CREATE TABLE `snack` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) NOT NULL,
  `popis` text NOT NULL,
  `cena` decimal(5,2) NOT NULL,
  `snack_typ_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `snack_has_alergen`
--

CREATE TABLE `snack_has_alergen` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `snack_id` int(10) UNSIGNED NOT NULL,
  `alergen_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `snack_typ`
--

CREATE TABLE `snack_typ` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazov` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Sťahujem dáta pre tabuľku `snack_typ`
--

INSERT INTO `snack_typ` (`id`, `nazov`) VALUES
(1, 'bageta'),
(2, 'sendvič'),
(3, 'wrap'),
(4, 'dezert');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `alergen`
--
ALTER TABLE `alergen`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `napoj`
--
ALTER TABLE `napoj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_napoj_napoj_typ` (`napoj_typ_id`);

--
-- Indexy pre tabuľku `napoj_typ`
--
ALTER TABLE `napoj_typ`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_snack_snack_typ` (`snack_typ_id`);

--
-- Indexy pre tabuľku `snack_has_alergen`
--
ALTER TABLE `snack_has_alergen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `snack_id` (`snack_id`,`alergen_id`),
  ADD KEY `fk_snack_has_alergen_alergen` (`alergen_id`);

--
-- Indexy pre tabuľku `snack_typ`
--
ALTER TABLE `snack_typ`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `alergen`
--
ALTER TABLE `alergen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pre tabuľku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pre tabuľku `napoj`
--
ALTER TABLE `napoj`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pre tabuľku `napoj_typ`
--
ALTER TABLE `napoj_typ`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `snack`
--
ALTER TABLE `snack`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `snack_has_alergen`
--
ALTER TABLE `snack_has_alergen`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `snack_typ`
--
ALTER TABLE `snack_typ`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `napoj`
--
ALTER TABLE `napoj`
  ADD CONSTRAINT `fk_napoj_napoj_typ` FOREIGN KEY (`napoj_typ_id`) REFERENCES `napoj_typ` (`id`);

--
-- Obmedzenie pre tabuľku `snack`
--
ALTER TABLE `snack`
  ADD CONSTRAINT `fk_snack_snack_typ` FOREIGN KEY (`snack_typ_id`) REFERENCES `snack_typ` (`id`);

--
-- Obmedzenie pre tabuľku `snack_has_alergen`
--
ALTER TABLE `snack_has_alergen`
  ADD CONSTRAINT `fk_snack_has_alergen_alergen` FOREIGN KEY (`alergen_id`) REFERENCES `alergen` (`id`),
  ADD CONSTRAINT `fk_snack_has_alergen_snack` FOREIGN KEY (`snack_id`) REFERENCES `snack` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
