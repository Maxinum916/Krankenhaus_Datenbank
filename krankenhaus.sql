-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Aug 2023 um 10:41
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `krankenhaus`
--
CREATE DATABASE IF NOT EXISTS `krankenhaus` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `krankenhaus`;
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `r_arbeitet_mit`
--

CREATE TABLE `r_arbeitet_mit` (
  `Doc_ID` int(11) NOT NULL,
  `Pfleger_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `r_arbeitet_mit`
--

INSERT INTO `r_arbeitet_mit` (`Doc_ID`, `Pfleger_ID`) VALUES
(1, 9),
(2, 8),
(3, 7),
(4, 6),
(5, 5),
(6, 4),
(6, 3),
(3, 2),
(5, 1),
(1, 6),
(5, 1),
(6, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doc`
--

CREATE TABLE `doc` (
  `Doc_ID` int(11) NOT NULL,
  `Nachname` varchar(255) DEFAULT NULL,
  `Vorname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `doc`
--

INSERT INTO `doc` (`Doc_ID`, `Nachname`, `Vorname`) VALUES
(1, 'Carsten', 'Elotrix'),
(2, 'Monte', 'Eris'),
(3, 'Elias', 'Nerlich'),
(4, 'Sidney', 'Friede'),
(5, 'Willy', 'Sommer'),
(6, 'Drachenlord', 'Winkler');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `r_hat_ein`
--

CREATE TABLE `r_hat_ein` (
  `Patient_ID` int(11) NOT NULL,
  `Doc_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `r_hat_ein`
--

INSERT INTO `r_hat_ein` (`Patient_ID`, `Doc_ID`) VALUES
(1, 6),
(2, 6),
(3, 1),
(4, 2),
(5, 3),
(7, 4),
(8, 5),
(3, 3),
(5, 3),
(7, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `r_liegt_in`
--

CREATE TABLE `r_liegt_in` (
  `Raum_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `r_liegt_in`
--

INSERT INTO `r_liegt_in` (`Raum_ID`, `Patient_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `medikamente`
--

CREATE TABLE `medikamente` (
  `Med_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Menge(L|g)` double DEFAULT NULL,
  `Lagerort` varchar(255) DEFAULT NULL,
  `Preis` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `medikamente`
--

INSERT INTO `medikamente` (`Med_ID`, `Name`, `Menge(L|g)`, `Lagerort`, `Preis`) VALUES
(1, 'Minis', 0.33, 'Unna', '20.00'),
(2, 'Biggis', 1, 'Unna', '200.00'),
(3, 'Tilidin', 500, 'Unna', '40.00'),
(4, 'CBD', 250, 'Unna', '2.00'),
(5, 'ibuprofen', 1000, 'Unna', '12.00'),
(6, 'Kokain', 1000, 'Unna', '80000.00'),
(7, 'Cannabis', 1000, 'Unna', '10.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `r_nimmt`
--

CREATE TABLE `r_nimmt` (
  `Med_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `r_nimmt`
--

INSERT INTO `r_nimmt` (`Med_ID`, `Patient_ID`) VALUES
(1, 2),
(2, 3),
(1, 1),
(5, 4),
(7, 5),
(3, 7),
(6, 2),
(2, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patient`
--

CREATE TABLE `patient` (
  `Patient_ID` int(11) NOT NULL,
  `Geschlecht` varchar(255) DEFAULT NULL,
  `Vorname` varchar(255) DEFAULT NULL,
  `Nachname` varchar(255) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `patient`
--

INSERT INTO `patient` (`Patient_ID`, `Geschlecht`, `Vorname`, `Nachname`, `Adresse`) VALUES
(1, 'Menschlich', 'Melvin Mats', 'Schröter', 'Mattic Str.4 Unna'),
(2, 'Weiblich', 'Karin', 'Ritter', 'Rausmitdeficher Alle.22 Schwerte'),
(3, 'Weiblich', 'Isa', 'Unsympathisch', 'Stuttgarter Str. 11 Stuttgart'),
(4, 'Männlich', 'Nico', 'Inscope', 'Ibuprofaxe Alle 4 Stuttgart'),
(5, 'Weiblich', 'Alexa', 'Breit', 'Ibuprofaxe Alle 4 Stuttgart'),
(7, 'Männlich', 'Tim', 'Gabel', 'Göbel Str. 9 Stuttgart'),
(8, 'Weiblich', 'Madisson', 'Beer', 'Frankfurter Alle 2 Unna');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pfleger`
--

CREATE TABLE `pfleger` (
  `Pfleger_ID` int(11) NOT NULL,
  `Geschlecht` varchar(255) DEFAULT NULL,
  `Vorname` varchar(255) DEFAULT NULL,
  `Nachname` varchar(255) DEFAULT NULL,
  `Ausbildung` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `pfleger`
--

INSERT INTO `pfleger` (`Pfleger_ID`, `Geschlecht`, `Vorname`, `Nachname`, `Ausbildung`) VALUES
(1, 'Männlich', 'Sascha', 'Unsympathisch', 'Altenpflege'),
(2, 'Männlich', 'Stay', 'High', 'Krankenpfleger'),
(3, 'Weiblich', 'Lana', 'Rhoades', 'Kinderkrankenpfleger'),
(4, 'Weiblich', 'Mia', 'Khalifa', 'Altenpflege'),
(5, 'Weiblich', 'Corinna', 'Kopf', 'Krankenpfleger'),
(6, 'Männlich', 'Jonny', 'Sins', 'Altenpfleger'),
(7, 'Weiblich', 'Shaiden', 'Rogue', 'Kinderkrankenpfleger'),
(8, 'Weiblich', 'Madelyn ', 'Cline', 'Gesundheitspfleger'),
(9, 'Männlich', 'Cristiano', 'Ronaldo', 'Kinderkrankenpfleger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `r_pflegt_ein`
--

CREATE TABLE `r_pflegt_ein` (
  `Pfleger_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `r_pflegt_ein`
--

INSERT INTO `r_pflegt_ein` (`Pfleger_ID`, `Patient_ID`) VALUES
(1, 3),
(2, 2),
(3, 1),
(4, 5),
(5, 4),
(6, 7),
(7, 8),
(8, 3),
(9, 1),
(5, 2),
(8, 4),
(6, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `raum`
--

CREATE TABLE `raum` (
  `Raum_ID` int(11) NOT NULL,
  `Ort` varchar(255) DEFAULT NULL,
  `Raumtyp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `raum`
--

INSERT INTO `raum` (`Raum_ID`, `Ort`, `Raumtyp`) VALUES
(1, 'Unna', 'Eckraum'),
(2, 'Unna', 'Sanitärraum'),
(3, 'Unna', 'Schwesternzimmer'),
(4, 'Unna', 'Op-Raum'),
(5, 'Unna', 'Patientenschleuse'),
(6, 'Unna', 'Umkleide'),
(7, 'Unna', 'Dienstraum'),
(8, 'Unna', 'Personalaufenthaltsraum'),
(9, 'Unna', 'Krankenzimmer');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doc`
--
ALTER TABLE `doc`
  ADD PRIMARY KEY (`Doc_ID`);

--
-- Indizes für die Tabelle `medikamente`
--
ALTER TABLE `medikamente`
  ADD PRIMARY KEY (`Med_ID`);

--
-- Indizes für die Tabelle `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Indizes für die Tabelle `pfleger`
--
ALTER TABLE `pfleger`
  ADD PRIMARY KEY (`Pfleger_ID`);

--
-- Indizes für die Tabelle `raum`
--
ALTER TABLE `raum`
  ADD PRIMARY KEY (`Raum_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


ALTER TABLE `r_nimmt`
  ADD FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);
COMMIT;


ALTER TABLE `r_nimmt`
  ADD FOREIGN KEY (`Med_ID`) REFERENCES `medikamente` (`Med_ID`);
COMMIT;

ALTER TABLE `r_arbeitet_mit`
  ADD FOREIGN KEY (`Pfleger_ID`) REFERENCES `pfleger` (`Pfleger_ID`);
COMMIT;

ALTER TABLE `r_arbeitet_mit`
  ADD FOREIGN KEY (`Doc_ID`) REFERENCES `doc` (`Doc_ID`);
COMMIT;

ALTER TABLE `r_hat_ein`
  ADD FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);
COMMIT;

ALTER TABLE `r_hat_ein`
  ADD FOREIGN KEY (`Doc_ID`) REFERENCES `doc` (`Doc_ID`);
COMMIT;

ALTER TABLE `r_liegt_in`
  ADD FOREIGN KEY (`Raum_ID`) REFERENCES `raum` (`Raum_ID`);
COMMIT;

ALTER TABLE `r_liegt_in`
  ADD FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);
COMMIT;

ALTER TABLE `r_pflegt_ein`
  ADD FOREIGN KEY (`Pfleger_ID`) REFERENCES `pfleger` (`Pfleger_ID`);
COMMIT;

ALTER TABLE `r_pflegt_ein`
  ADD FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`);
COMMIT;

/*Alter Table `r_nimmt`
  add foreign key (Patient_ID) references patient (Patient_ID)

Alter Table `Tabelle Name`
  add foreign key (Spaltenname ) references bett (referenz)*/