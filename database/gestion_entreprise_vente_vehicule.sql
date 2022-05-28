-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 28 mai 2022 à 09:01
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_entreprise_vente_vehicule`
--

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `num_agent` int(11) NOT NULL AUTO_INCREMENT,
  `nom_agent` varchar(255) NOT NULL,
  PRIMARY KEY (`num_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `num_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(255) NOT NULL,
  `adr_client` text NOT NULL,
  `code_type_client` int(11) NOT NULL,
  PRIMARY KEY (`num_client`),
  KEY `code_type_client` (`code_type_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `num_bon` int(11) NOT NULL AUTO_INCREMENT,
  `date_bon` date NOT NULL,
  `num_agent` int(11) NOT NULL,
  `num_client` int(11) NOT NULL,
  PRIMARY KEY (`num_bon`),
  KEY `num_agent` (`num_agent`),
  KEY `num_client` (`num_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `echeance`
--

DROP TABLE IF EXISTS `echeance`;
CREATE TABLE IF NOT EXISTS `echeance` (
  `Num_ech` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Num_ech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE IF NOT EXISTS `intervention` (
  `Num_int` int(11) NOT NULL AUTO_INCREMENT,
  `desc_Int` text NOT NULL,
  `date_int` date NOT NULL,
  PRIMARY KEY (`Num_int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `Code_Marque` int(11) NOT NULL AUTO_INCREMENT,
  `lib_marque` varchar(255) NOT NULL,
  PRIMARY KEY (`Code_Marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `Code_option` int(11) NOT NULL AUTO_INCREMENT,
  `lib_option` varchar(255) NOT NULL,
  PRIMARY KEY (`Code_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ordrevehicule`
--

DROP TABLE IF EXISTS `ordrevehicule`;
CREATE TABLE IF NOT EXISTS `ordrevehicule` (
  `num_veh` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num_veh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `panne`
--

DROP TABLE IF EXISTS `panne`;
CREATE TABLE IF NOT EXISTS `panne` (
  `Code_panne` int(11) NOT NULL AUTO_INCREMENT,
  `lib_panne` varchar(255) NOT NULL,
  PRIMARY KEY (`Code_panne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

DROP TABLE IF EXISTS `piece`;
CREATE TABLE IF NOT EXISTS `piece` (
  `Code_piece` int(11) NOT NULL AUTO_INCREMENT,
  `lib_piece` varchar(255) NOT NULL,
  PRIMARY KEY (`Code_piece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prixdoption`
--

DROP TABLE IF EXISTS `prixdoption`;
CREATE TABLE IF NOT EXISTS `prixdoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Num_bon` int(11) NOT NULL,
  `Num_veh` int(11) NOT NULL,
  `Code_option` int(11) NOT NULL,
  `Prix_option` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Num_bon` (`Num_bon`),
  KEY `Num_veh` (`Num_veh`),
  KEY `Code_option` (`Code_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
CREATE TABLE IF NOT EXISTS `reglement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Num_ech` int(11) NOT NULL,
  `Num_bon` int(11) NOT NULL,
  `date_ech` date NOT NULL,
  `Montant` int(11) NOT NULL,
  `date_reg` date NOT NULL,
  `Mode_reg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Num_ech` (`Num_ech`),
  KEY `Num_bon` (`Num_bon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

DROP TABLE IF EXISTS `reparation`;
CREATE TABLE IF NOT EXISTS `reparation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Num_int` int(11) NOT NULL,
  `Code_panne` int(11) NOT NULL,
  `Code_pièce` int(11) NOT NULL,
  `Qte_Piece` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Num_int` (`Num_int`),
  KEY `Code_panne` (`Code_panne`),
  KEY `Code_pièce` (`Code_pièce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `Code_Type_veh` int(11) NOT NULL AUTO_INCREMENT,
  `lib_type_veh` varchar(255) NOT NULL,
  PRIMARY KEY (`Code_Type_veh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeclient`
--

DROP TABLE IF EXISTS `typeclient`;
CREATE TABLE IF NOT EXISTS `typeclient` (
  `Cod_type_client` int(11) NOT NULL AUTO_INCREMENT,
  `Lib_type` varchar(255) NOT NULL,
  PRIMARY KEY (`Cod_type_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `date_naissance` date NOT NULL,
  `e_mail` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `nom_utilisateur` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `est_actif` tinyint(1) NOT NULL DEFAULT '0',
  `est_supprimer` tinyint(1) NOT NULL DEFAULT '0',
  `creer_le` tinyint(1) NOT NULL DEFAULT '0',
  `maj_le` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Num_bon` int(11) NOT NULL,
  `Num_veh` int(11) NOT NULL,
  `code_marque` int(11) NOT NULL,
  `code_type_veh` int(11) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Num_bon` (`Num_bon`),
  KEY `Num_veh` (`Num_veh`),
  KEY `code_marque` (`code_marque`),
  KEY `code_type_veh` (`code_type_veh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_typeclient_cod_type_client` FOREIGN KEY (`code_type_client`) REFERENCES `typeclient` (`Cod_type_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_agent_num_agent` FOREIGN KEY (`num_agent`) REFERENCES `agent` (`num_agent`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_client_num_client` FOREIGN KEY (`num_client`) REFERENCES `client` (`num_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `prixdoption`
--
ALTER TABLE `prixdoption`
  ADD CONSTRAINT `prixdoption_commande_Num_bon` FOREIGN KEY (`Num_bon`) REFERENCES `commande` (`num_bon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prixdoption_option_Code_option` FOREIGN KEY (`Code_option`) REFERENCES `option` (`Code_option`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prixdoption_vehicule_Num_veh` FOREIGN KEY (`Num_veh`) REFERENCES `vehicule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD CONSTRAINT `reglement_commande_Num_bon` FOREIGN KEY (`Num_bon`) REFERENCES `commande` (`num_bon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reglement_echeance_Num_ech` FOREIGN KEY (`Num_ech`) REFERENCES `echeance` (`Num_ech`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_intervation_Num_int` FOREIGN KEY (`Num_int`) REFERENCES `intervention` (`Num_int`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparation_panne_Code_panne` FOREIGN KEY (`Code_panne`) REFERENCES `panne` (`Code_panne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparation_piece_Code_piece` FOREIGN KEY (`Code_pièce`) REFERENCES `piece` (`Code_piece`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_commande_Num_bon` FOREIGN KEY (`Num_bon`) REFERENCES `commande` (`num_bon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_marque_code_marque` FOREIGN KEY (`code_marque`) REFERENCES `marque` (`Code_Marque`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_ordrevehicule_Num_veh` FOREIGN KEY (`Num_veh`) REFERENCES `ordrevehicule` (`num_veh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicule_type_code_type_veh` FOREIGN KEY (`code_type_veh`) REFERENCES `type` (`Code_Type_veh`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
