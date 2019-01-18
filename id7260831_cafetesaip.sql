-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 18 jan. 2019 à 17:16
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `id7260831_cafetesaip`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `login`, `password`) VALUES
(1, 'Admin', 'Pass123');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCommande` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `prix` float NOT NULL,
  `id_utilisateurs` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `date` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `isChecked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utilisateurs` (`id_utilisateurs`) USING BTREE,
  KEY `id_plat` (`id_plat`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `numeroCommande`, `prix`, `id_utilisateurs`, `id_plat`, `date`, `isChecked`) VALUES
(5, '102-265', 3.3, 2, 3, '24-01-2019', 0),
(8, '780-245', 2, 1, 1, '15-03-2019', 0),
(21, '1101-7558', 3.4, 1, 2, '11-01-19', 1),
(22, '1101-7558', 1.4, 1, 51, '11-01-19', 0),
(23, '102-201', 4.5, 2, 18, '15-01-2019', 0),
(234, '102-345', 3.5, 2, 10, '20-02-2019', 0);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prix` float NOT NULL,
  `id_plat` int(11) NOT NULL,
  `id_boisson` int(11) NOT NULL,
  `id_douceur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_plat` (`id_plat`),
  KEY `id_boisson` (`id_boisson`),
  KEY `id_douceur` (`id_douceur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomPlat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prix` float NOT NULL,
  `prixMenu` float NOT NULL,
  `id_typePlat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_typePlat` (`id_typePlat`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `nomPlat`, `prix`, `prixMenu`, `id_typePlat`) VALUES
(1, 'le Parisien', 1.5, 4, 1),
(2, 'le Poulet', 3.4, 4.9, 1),
(3, 'le Suisse', 2, 4, 1),
(4, 'le Complet', 3.8, 5.4, 1),
(5, 'le Poulet-Mimo', 3.8, 5.4, 1),
(6, 'Chèvre lardons', 3.8, 5.4, 2),
(7, 'Jambon fromage', 3.8, 5.4, 2),
(8, '3 fromages', 3.8, 5.4, 2),
(9, 'Salade de riz', 3.1, 4.7, 3),
(10, 'Salade de pâtes', 3.1, 4.7, 3),
(11, 'Salade fermière', 3.6, 5.2, 3),
(12, 'Assiette complète', 4.8, 6.4, 3),
(13, 'Burger', 3.9, 5.5, 4),
(14, 'Mauricette thon', 2.5, 4.1, 5),
(15, 'Mauricette rosette', 3.3, 4.1, 5),
(16, 'Bagel saumon', 3.3, 4.9, 5),
(17, 'Bagel jambon', 3.3, 4.9, 5),
(18, 'Aquarel', 1, 0, 6),
(19, 'Volvic citron', 1, 0, 6),
(20, 'Perrier', 1, 0, 6),
(21, 'Ice Tea', 1, 0, 6),
(22, 'Orangina', 1, 0, 6),
(23, 'Schweppes agrumes', 1, 0, 6),
(24, 'Oasis tropical', 1, 0, 6),
(25, 'Seven Up', 1, 0, 6),
(26, 'Pepsi', 1, 0, 6),
(27, 'Coca-Cola Zero', 1, 0, 6),
(28, 'Tree-top', 1, 0, 6),
(29, 'Croque-monsieur', 3.9, 5.6, 7),
(30, 'Quiche lorraine', 3.9, 5.6, 7),
(31, 'Panini jambon cru', 3.6, 5.2, 8),
(32, 'Panini sweet cheese', 3.6, 5.2, 8),
(33, 'Panini poulet tomates', 3.6, 5.2, 8),
(34, 'Panini poulet curry', 3.6, 5.2, 8),
(35, 'Pasta thon à la crème', 3.8, 5.5, 9),
(36, 'Pasta jambon fromage', 3.8, 5.5, 9),
(37, 'Pasta poulet à la crème', 3.8, 5.5, 9),
(38, 'Tortellini ricotta épinards', 3.8, 5.5, 9),
(39, 'Fusili saumon', 3.8, 5.5, 9),
(40, 'Fusili fromages italiens', 3.8, 5.5, 9),
(41, 'Fusili carbonara', 3.8, 5.5, 9),
(42, 'Fusili bolognaise', 3.8, 5.5, 9),
(43, 'Fruit', 0.8, 0, 10),
(44, 'Compote', 1.2, 0, 10),
(45, 'Yaourt', 1.2, 0, 10),
(46, 'Petit Gervais', 0.9, 0, 10),
(47, 'Crème dessert', 1.2, 0, 10),
(48, 'Brownie', 1.5, 0, 10),
(49, 'Beignet chocolat', 1.2, 0, 10),
(50, 'Doony\'s', 1.3, 0, 10),
(51, 'Cookie', 1.4, 0, 10),
(52, 'Pâtisserie', 2, 0, 10),
(53, 'Croissant', 0.9, 0, 10),
(54, 'Pain au chocolat', 1, 0, 10),
(55, 'Chips', 0.6, 0, 10);

-- --------------------------------------------------------

--
-- Structure de la table `typeplat`
--

DROP TABLE IF EXISTS `typeplat`;
CREATE TABLE IF NOT EXISTS `typeplat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typePlat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `typeplat`
--

INSERT INTO `typeplat` (`id`, `typePlat`) VALUES
(1, 'Sandwichs'),
(2, 'Pizzas'),
(3, 'Salades'),
(4, 'Burger'),
(5, 'Petites faims'),
(6, 'Boissons fraîches'),
(7, 'Plats chauds'),
(8, 'Panini'),
(9, 'Pasta'),
(10, 'Douceurs');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `login`, `password`) VALUES
(1, 'tsinan.ir2020', 'Azerty'),
(2, 'aaleixo.ir2020', 'Ytreza');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `platC` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id`),
  ADD CONSTRAINT `utilisateurs` FOREIGN KEY (`id_utilisateurs`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `boisson` FOREIGN KEY (`id_boisson`) REFERENCES `plat` (`id`),
  ADD CONSTRAINT `douceur` FOREIGN KEY (`id_douceur`) REFERENCES `plat` (`id`),
  ADD CONSTRAINT `plat` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id`);

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `typePlat` FOREIGN KEY (`id_typePlat`) REFERENCES `typeplat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
