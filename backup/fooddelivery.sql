-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 17, 2026 alle 17:54
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fooddelivery`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `allergene`
--

CREATE TABLE `allergene` (
  `IDallergene` int(2) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(50) NOT NULL,
  `personalizzazioni` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `carta`
--

CREATE TABLE `carta` (
  `Ncarta` int(16) UNSIGNED ZEROFILL NOT NULL,
  `CodiceRetro` int(4) NOT NULL,
  `banca` varchar(50) NOT NULL,
  `FKEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `Email` varchar(50) NOT NULL,
  `nTel` varchar(18) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `ind_fatt_via` varchar(30) NOT NULL,
  `ind_fatt_civ` varchar(30) NOT NULL,
  `ind_fatt_cap` int(5) NOT NULL,
  `ind_fatt_comune` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `FK_IDcomune` int(4) UNSIGNED ZEROFILL NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `comune`
--

CREATE TABLE `comune` (
  `IDcomune` int(4) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `comune`
--

INSERT INTO `comune` (`IDcomune`, `nome`) VALUES
(0001, 'Torino'),
(0002, 'Milano'),
(0003, 'Roma');

-- --------------------------------------------------------

--
-- Struttura della tabella `indirizzo`
--

CREATE TABLE `indirizzo` (
  `IDindirizzo` int(6) UNSIGNED ZEROFILL NOT NULL,
  `ind_via` varchar(30) NOT NULL,
  `ind_civ` varchar(30) NOT NULL,
  `ind_cap` int(5) NOT NULL,
  `ind_comune` varchar(30) NOT NULL,
  `FK_Email` varchar(50) NOT NULL,
  `FK_IDcomune` int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ingrediente`
--

CREATE TABLE `ingrediente` (
  `IDingrediente` int(3) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ingrediente_allergene`
--

CREATE TABLE `ingrediente_allergene` (
  `FK_IDingrediente` int(2) UNSIGNED ZEROFILL NOT NULL,
  `FK_IDallergene` int(2) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ingrediente_piatto`
--

CREATE TABLE `ingrediente_piatto` (
  `FK_IDingrediente` int(3) UNSIGNED ZEROFILL NOT NULL,
  `FK_IDpiatto` int(4) UNSIGNED ZEROFILL NOT NULL,
  `quantita` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `orari_aperture`
--

CREATE TABLE `orari_aperture` (
  `IDgiorno` int(1) UNSIGNED NOT NULL,
  `FKIDristorante` int(2) UNSIGNED ZEROFILL NOT NULL,
  `orarioApertura` time NOT NULL,
  `orarioChiusura` time NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `IDordine` int(6) UNSIGNED ZEROFILL NOT NULL,
  `stato` enum('ricevuto','in preparazione','in consegna','consegnato') NOT NULL,
  `FKEmail` varchar(50) NOT NULL,
  `FKIDindirizzo` int(6) UNSIGNED ZEROFILL NOT NULL,
  `FKRider` varchar(16) DEFAULT NULL,
  `FK_IDmetodo` int(2) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine_promozione`
--

CREATE TABLE `ordine_promozione` (
  `FK_IDordine` int(2) UNSIGNED ZEROFILL NOT NULL,
  `FK_IDpromozione` int(2) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `piatto`
--

CREATE TABLE `piatto` (
  ` varchar(30) NOT NULL,
  `FK_IDrnome` varchar(30) NOT NULL,
  `IDpiatto` int(4) UNSIGNED ZEROFILL NOT NULL,
  `prezzo` decimal(5,2) UNSIGNED NOT NULL,
  `disponibilita` tinyint(1) NOT NULL,
  `image`istorante` int(2) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `piatto`
--

INSERT INTO `piatto` (`nome`, `IDpiatto`, `prezzo`, `disponibilita`, `image`, `FK_IDristorante`) VALUES
('Margherita', 0001, 6.50, 1, 'piatto1-1.jpg', 01),
('Diavola', 0002, 7.50, 1, 'piatto2-1.jpg', 01),
('Quattro Formaggi', 0003, 8.00, 1, 'piatto3-1.jpg', 01),
('Capricciosa', 0004, 8.50, 1, 'piatto4-1.jpg', 01),
('Calzone', 0005, 7.00, 1, 'piatto5-1.jpg', 01),
('Sushi Misto', 0006, 12.00, 1, 'piatto1-2.jpg', 02),
('Nigiri Salmone', 0007, 10.00, 1, 'piatto2-2.jpg', 02),
('Uramaki California', 0008, 11.00, 1, 'piatto3-2.jpg', 02),
('Ramen', 0009, 13.50, 1, 'piatto4-2.jpg', 02),
('Tempura', 0010, 9.50, 1, 'piatto5-2.jpg', 02),
('Carbonara', 0011, 9.00, 1, 'piatto1-3.jpg', 03),
('Amatriciana', 0012, 9.50, 1, 'piatto2-3.jpg', 03),
('Cacio e Pepe', 0013, 8.50, 1, 'piatto3-3.jpg', 03),
('Saltimbocca', 0014, 12.00, 1, 'piatto4-3.jpg', 03),
('Abbacchio', 0015, 14.00, 1, 'piatto5-3.jpg', 03);

-- --------------------------------------------------------

--
-- Struttura della tabella `piatto_ordine`
--

CREATE TABLE `piatto_ordine` (
  `FK_IDpiatto` int(2) UNSIGNED ZEROFILL NOT NULL,
  `FK_IDordine` int(2) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `promozione`
--

CREATE TABLE `promozione` (
  `IDpromozione` int(2) UNSIGNED ZEROFILL NOT NULL,
  `dataInizio` date NOT NULL,
  `dataFine` date NOT NULL,
  `nome` varchar(50) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `promozione_piatto`
--

CREATE TABLE `promozione_piatto` (
  `FK_IDpromozione` int(2) UNSIGNED ZEROFILL NOT NULL,
  `FK_IDpiatto` int(2) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `recensione`
--

CREATE TABLE `recensione` (
  `IDrecensione` int(2) UNSIGNED ZEROFILL NOT NULL,
  `descrizione` varchar(200) NOT NULL,
  `stelle` int(1) NOT NULL,
  `FK_IDordine` int(2) UNSIGNED ZEROFILL NOT NULL
) ;

-- --------------------------------------------------------

--
-- Struttura della tabella `rider`
--

CREATE TABLE `rider` (
  `CF` varchar(16) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `iban` varchar(27) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `rider_zona`
--

CREATE TABLE `rider_zona` (
  `FK_CF` varchar(16) NOT NULL,
  `FK_IDzona` int(2) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ristorante`
--

CREATE TABLE `ristorante` (
  `IDristorante` int(2) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nTel` varchar(18) NOT NULL,
  `ind_fatt_via` varchar(30) NOT NULL,
  `ind_fatt_civ` varchar(30) NOT NULL,
  `ind_fatt_cap` int(5) NOT NULL,
  `ind_fatt_comune` varchar(30) NOT NULL,
  `img` varchar(255) NOT NULL,
  `descrizione` varchar(200) NOT NULL,
  `FK_IDcomune` int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ristorante`
--

INSERT INTO `ristorante` (`IDristorante`, `nome`, `nTel`, `ind_fatt_via`, `ind_fatt_civ`, `ind_fatt_cap`, `ind_fatt_comune`, `img`, `descrizione`, `FK_IDcomune`) VALUES
(01, 'Pizzeria Da Mario', '0111234567', 'Via Roma', '10', 10100, 'Torino', 'ristorante2.jpg', 'Pizzeria tradizionale', 0001),
(02, 'Sushi House', '0223456789', 'Via Milano', '20', 20100, 'Milano', 'ristorante1.jpg', 'Ristorante giapponese', 0002),
(03, 'Trattoria Romana', '0612345678', 'Via Napoli', '5', 100, 'Roma', 'ristorante3.jpg', 'Cucina tipica romana', 0003);

-- --------------------------------------------------------

--
-- Struttura della tabella `zona`
--

CREATE TABLE `zona` (
  `IDzona` int(2) UNSIGNED ZEROFILL NOT NULL,
  `NomeZona` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `zona_comune`
--

CREATE TABLE `zona_comune` (
  `FK_IDzona` int(2) UNSIGNED ZEROFILL NOT NULL,
  `FK_IDcomune` int(4) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `allergene`
--
ALTER TABLE `allergene`
  ADD PRIMARY KEY (`IDallergene`);

--
-- Indici per le tabelle `carta`
--
ALTER TABLE `carta`
  ADD PRIMARY KEY (`Ncarta`),
  ADD KEY `FKEmail` (`FKEmail`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Email`),
  ADD UNIQUE KEY `nTel` (`nTel`),
  ADD KEY `FK_IDcomune` (`FK_IDcomune`);

--
-- Indici per le tabelle `comune`
--
ALTER TABLE `comune`
  ADD PRIMARY KEY (`IDcomune`);

--
-- Indici per le tabelle `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD PRIMARY KEY (`IDindirizzo`),
  ADD KEY `FK_Email` (`FK_Email`),
  ADD KEY `FK_IDcomune` (`FK_IDcomune`);

--
-- Indici per le tabelle `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`IDingrediente`);

--
-- Indici per le tabelle `ingrediente_allergene`
--
ALTER TABLE `ingrediente_allergene`
  ADD PRIMARY KEY (`FK_IDingrediente`,`FK_IDallergene`),
  ADD KEY `FK_IDallergene` (`FK_IDallergene`);

--
-- Indici per le tabelle `ingrediente_piatto`
--
ALTER TABLE `ingrediente_piatto`
  ADD PRIMARY KEY (`FK_IDingrediente`,`FK_IDpiatto`),
  ADD KEY `FK_IDpiatto` (`FK_IDpiatto`);

--
-- Indici per le tabelle `orari_aperture`
--
ALTER TABLE `orari_aperture`
  ADD PRIMARY KEY (`IDgiorno`,`FKIDristorante`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`IDordine`),
  ADD KEY `FKEmail` (`FKEmail`),
  ADD KEY `FKIDindirizzo` (`FKIDindirizzo`);

--
-- Indici per le tabelle `ordine_promozione`
--
ALTER TABLE `ordine_promozione`
  ADD PRIMARY KEY (`FK_IDordine`,`FK_IDpromozione`),
  ADD KEY `FK_IDpromozione` (`FK_IDpromozione`);

--
-- Indici per le tabelle `piatto`
--
ALTER TABLE `piatto`
  ADD PRIMARY KEY (`IDpiatto`),
  ADD KEY `FK_IDristorante` (`FK_IDristorante`);

--
-- Indici per le tabelle `piatto_ordine`
--
ALTER TABLE `piatto_ordine`
  ADD PRIMARY KEY (`FK_IDpiatto`,`FK_IDordine`),
  ADD KEY `FK_IDordine` (`FK_IDordine`);

--
-- Indici per le tabelle `promozione`
--
ALTER TABLE `promozione`
  ADD PRIMARY KEY (`IDpromozione`);

--
-- Indici per le tabelle `promozione_piatto`
--
ALTER TABLE `promozione_piatto`
  ADD PRIMARY KEY (`FK_IDpromozione`,`FK_IDpiatto`),
  ADD KEY `FK_IDpiatto` (`FK_IDpiatto`);

--
-- Indici per le tabelle `recensione`
--
ALTER TABLE `recensione`
  ADD PRIMARY KEY (`IDrecensione`),
  ADD KEY `FK_IDordine` (`FK_IDordine`);

--
-- Indici per le tabelle `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`CF`);

--
-- Indici per le tabelle `rider_zona`
--
ALTER TABLE `rider_zona`
  ADD PRIMARY KEY (`FK_CF`,`FK_IDzona`),
  ADD KEY `FK_IDzona` (`FK_IDzona`);

--
-- Indici per le tabelle `ristorante`
--
ALTER TABLE `ristorante`
  ADD PRIMARY KEY (`IDristorante`),
  ADD UNIQUE KEY `nTel` (`nTel`),
  ADD KEY `FK_IDcomune` (`FK_IDcomune`);

--
-- Indici per le tabelle `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`IDzona`);

--
-- Indici per le tabelle `zona_comune`
--
ALTER TABLE `zona_comune`
  ADD PRIMARY KEY (`FK_IDzona`,`FK_IDcomune`),
  ADD KEY `FK_IDcomune` (`FK_IDcomune`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `allergene`
--
ALTER TABLE `allergene`
  MODIFY `IDallergene` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `carta`
--
ALTER TABLE `carta`
  MODIFY `Ncarta` int(16) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `comune`
--
ALTER TABLE `comune`
  MODIFY `IDcomune` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `indirizzo`
--
ALTER TABLE `indirizzo`
  MODIFY `IDindirizzo` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `IDingrediente` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `IDordine` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `piatto`
--
ALTER TABLE `piatto`
  MODIFY `IDpiatto` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `promozione`
--
ALTER TABLE `promozione`
  MODIFY `IDpromozione` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `recensione`
--
ALTER TABLE `recensione`
  MODIFY `IDrecensione` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ristorante`
--
ALTER TABLE `ristorante`
  MODIFY `IDristorante` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `zona`
--
ALTER TABLE `zona`
  MODIFY `IDzona` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `carta`
--
ALTER TABLE `carta`
  ADD CONSTRAINT `carta_ibfk_1` FOREIGN KEY (`FKEmail`) REFERENCES `cliente` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`FK_IDcomune`) REFERENCES `comune` (`IDcomune`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `indirizzo`
--
ALTER TABLE `indirizzo`
  ADD CONSTRAINT `indirizzo_ibfk_1` FOREIGN KEY (`FK_Email`) REFERENCES `cliente` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `indirizzo_ibfk_2` FOREIGN KEY (`FK_IDcomune`) REFERENCES `comune` (`IDcomune`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `ingrediente_allergene`
--
ALTER TABLE `ingrediente_allergene`
  ADD CONSTRAINT `ingrediente_allergene_ibfk_1` FOREIGN KEY (`FK_IDingrediente`) REFERENCES `ingrediente` (`IDingrediente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingrediente_allergene_ibfk_2` FOREIGN KEY (`FK_IDallergene`) REFERENCES `allergene` (`IDallergene`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ingrediente_piatto`
--
ALTER TABLE `ingrediente_piatto`
  ADD CONSTRAINT `ingrediente_piatto_ibfk_1` FOREIGN KEY (`FK_IDingrediente`) REFERENCES `ingrediente` (`IDingrediente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingrediente_piatto_ibfk_2` FOREIGN KEY (`FK_IDpiatto`) REFERENCES `piatto` (`IDpiatto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`FKEmail`) REFERENCES `cliente` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`FKIDindirizzo`) REFERENCES `indirizzo` (`IDindirizzo`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `ordine_promozione`
--
ALTER TABLE `ordine_promozione`
  ADD CONSTRAINT `ordine_promozione_ibfk_1` FOREIGN KEY (`FK_IDordine`) REFERENCES `ordine` (`IDordine`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordine_promozione_ibfk_2` FOREIGN KEY (`FK_IDpromozione`) REFERENCES `promozione` (`IDpromozione`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `piatto`
--
ALTER TABLE `piatto`
  ADD CONSTRAINT `piatto_ibfk_1` FOREIGN KEY (`FK_IDristorante`) REFERENCES `ristorante` (`IDristorante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `piatto_ordine`
--
ALTER TABLE `piatto_ordine`
  ADD CONSTRAINT `piatto_ordine_ibfk_1` FOREIGN KEY (`FK_IDpiatto`) REFERENCES `piatto` (`IDpiatto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `piatto_ordine_ibfk_2` FOREIGN KEY (`FK_IDordine`) REFERENCES `ordine` (`IDordine`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `promozione_piatto`
--
ALTER TABLE `promozione_piatto`
  ADD CONSTRAINT `promozione_piatto_ibfk_1` FOREIGN KEY (`FK_IDpromozione`) REFERENCES `promozione` (`IDpromozione`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promozione_piatto_ibfk_2` FOREIGN KEY (`FK_IDpiatto`) REFERENCES `piatto` (`IDpiatto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `recensione`
--
ALTER TABLE `recensione`
  ADD CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`FK_IDordine`) REFERENCES `ordine` (`IDordine`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `rider_zona`
--
ALTER TABLE `rider_zona`
  ADD CONSTRAINT `rider_zona_ibfk_1` FOREIGN KEY (`FK_CF`) REFERENCES `rider` (`CF`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rider_zona_ibfk_2` FOREIGN KEY (`FK_IDzona`) REFERENCES `zona` (`IDzona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ristorante`
--
ALTER TABLE `ristorante`
  ADD CONSTRAINT `ristorante_ibfk_1` FOREIGN KEY (`FK_IDcomune`) REFERENCES `comune` (`IDcomune`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `zona_comune`
--
ALTER TABLE `zona_comune`
  ADD CONSTRAINT `zona_comune_ibfk_1` FOREIGN KEY (`FK_IDzona`) REFERENCES `zona` (`IDzona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zona_comune_ibfk_2` FOREIGN KEY (`FK_IDcomune`) REFERENCES `comune` (`IDcomune`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
