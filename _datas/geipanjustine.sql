-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 02 mars 2022 à 16:52
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `geipan`
--

-- --------------------------------------------------------

--
-- Structure de la table `observations`
--

CREATE TABLE `observations` (
  `id_observation` int(11) NOT NULL,
  `obsDateTime` datetime NOT NULL,
  `obsDuration` time DEFAULT NULL,
  `obsLocation` varchar(255) DEFAULT NULL,
  `obsCardinalPoint` varchar(255) DEFAULT NULL,
  `obsWeather` varchar(255) DEFAULT NULL,
  `obsDescription` text NOT NULL,
  `id_state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `observations`
--

INSERT INTO `observations` (`id_observation`, `obsDateTime`, `obsDuration`, `obsLocation`, `obsCardinalPoint`, `obsWeather`, `obsDescription`, `id_state`) VALUES
(1, '2022-03-01 00:00:00', '01:01:00', 'Eure', 'Nord', 'Soleil', 'ovni observer', 20),
(2, '2022-02-14 00:00:00', '00:00:01', 'Aisne', 'Sud', 'Pluie', 'un ovni !!!!', 0);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `roleLabel` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id_role`, `roleLabel`) VALUES
(1, 'guest'),
(2, 'user'),
(3, 'admin'),
(4, 'super-admin');

-- --------------------------------------------------------

--
-- Structure de la table `states`
--

CREATE TABLE `states` (
  `id_state` int(11) NOT NULL,
  `stateNumber` varchar(3) NOT NULL,
  `stateLabel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `states`
--

INSERT INTO `states` (`id_state`, `stateNumber`, `stateLabel`) VALUES
(0, '01', 'Ain'),
(1, '02', 'Aisne'),
(2, '03', 'Allier'),
(3, '04', 'Alpes-de-Haute-Provence'),
(4, '05', 'Hautes-Alpes'),
(5, '06', 'Alpes-Maritimes'),
(6, '07', 'Ardèche'),
(7, '08', 'Ardennes'),
(8, '09', 'Ariège'),
(9, '10', 'Aube'),
(10, '11', 'Aude'),
(11, '12', 'Aveyron'),
(12, '13', 'Bouches-du-Rhône'),
(13, '14', 'Calvados'),
(14, '15', 'Cantal'),
(15, '16', 'Charente'),
(16, '17', 'Charente-Maritime'),
(17, '18', 'Cher'),
(18, '19', 'Corrèze'),
(19, '21', 'Côte-d\'Or'),
(20, '22', 'Côtes-d\'Armor'),
(21, '23', 'Creuse'),
(22, '24', 'Dordogne'),
(23, '25', 'Doubs'),
(24, '26', 'Drôme'),
(25, '27', 'Eure'),
(26, '28', 'Eure-et-Loir'),
(27, '29', 'Finistère'),
(28, '2A', 'Corse-du-Sud'),
(29, '2B', 'Haute-Corse'),
(30, '30', 'Gard'),
(31, '31', 'Haute-Garonne'),
(32, '32', 'Gers'),
(33, '33', 'Gironde'),
(34, '34', 'Hérault'),
(35, '35', 'Ille-et-Vilaine'),
(36, '36', 'Indre'),
(37, '37', 'Indre-et-Loire'),
(38, '38', 'Isère'),
(39, '39', 'Jura'),
(40, '40', 'Landes'),
(41, '41', 'Loir-et-Cher'),
(42, '42', 'Loire'),
(43, '43', 'Haute-Loire'),
(44, '44', 'Loire-Atlantique'),
(45, '45', 'Loiret'),
(46, '46', 'Lot'),
(47, '47', 'Lot-et-Garonne'),
(48, '48', 'Lozère'),
(49, '49', 'Maine-et-Loire'),
(50, '50', 'Manche'),
(51, '51', 'Marne'),
(52, '52', 'Haute-Marne'),
(53, '53', 'Mayenne'),
(54, '54', 'Meurthe-et-Moselle'),
(55, '55', 'Meuse'),
(56, '56', 'Morbihan'),
(57, '57', 'Moselle'),
(58, '58', 'Nièvre'),
(59, '59', 'Nord'),
(60, '60', 'Oise'),
(61, '61', 'Orne'),
(62, '62', 'Pas-de-Calais'),
(63, '63', 'Puy-de-Dôme'),
(64, '64', 'Pyrénées-Atlantiques'),
(65, '65', 'Hautes-Pyrénées'),
(66, '66', 'Pyrénées-Orientales'),
(67, '67', 'Bas-Rhin'),
(68, '68', 'Haut-Rhin'),
(69, '69', 'Rhône'),
(70, '70', 'Haute-Saône'),
(71, '71', 'Saône-et-Loire'),
(72, '72', 'Sarthe'),
(73, '73', 'Savoie'),
(74, '74', 'Haute-Savoie'),
(75, '75', 'Paris'),
(76, '76', 'Seine-Maritime'),
(77, '77', 'Seine-et-Marne'),
(78, '78', 'Yvelines'),
(79, '79', 'Deux-Sèvres'),
(80, '80', 'Somme'),
(81, '81', 'Tarn'),
(82, '82', 'Tarn-et-Garonne'),
(83, '83', 'Var'),
(84, '84', 'Vaucluse'),
(85, '85', 'Vendée'),
(86, '86', 'Vienne'),
(87, '87', 'Haute-Vienne'),
(88, '88', 'Vosges'),
(89, '89', 'Yonne'),
(90, '90', 'Territoire de Belfort'),
(91, '91', 'Essonne'),
(92, '92', 'Hauts-de-Seine'),
(93, '93', 'Seine-Saint-Denis'),
(94, '94', 'Val-de-Marne'),
(95, '95', 'Val-d\'Oise'),
(96, '971', 'Guadeloupe'),
(97, '972', 'Martinique'),
(98, '973', 'Guyane'),
(99, '974', 'La Réunion'),
(100, '976', 'Mayotte');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userFirstname` varchar(255) DEFAULT NULL,
  `userMail` varchar(255) NOT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `userAvatar` varchar(255) DEFAULT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `userName`, `userFirstname`, `userMail`, `userPassword`, `userAvatar`, `id_role`) VALUES
(1, 'DONNADIEU', 'Justine', 'juju.donnadieu@hotmail.fr', '$2y$10$j4G9FTt5ekcyiSQx7wnBfu6CJY0QqY19EZEjO43LCOhorciq7G5Ha', 'C:/xampp/htdocs/GEIPAN/avatars/20220302043629ovni.png', 4),
(2, 'TOTO', 'Toto', 'toto@toto.com', '$2y$10$K/fsWFbxrfuTcqoffrobKONNXkLy05rE2dtfGeonAR/tFMY4NJoeC', 'C:/xampp/htdocs/GEIPAN/avatars/20220302043814Ovni.jpg', 2);

-- --------------------------------------------------------

--
-- Structure de la table `users_has_observations`
--

CREATE TABLE `users_has_observations` (
  `id_user` int(11) NOT NULL,
  `id_observation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `observations`
--
ALTER TABLE `observations`
  ADD PRIMARY KEY (`id_observation`),
  ADD KEY `fk_observations_states_idx` (`id_state`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id_state`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_users_roles1_idx` (`id_role`);

--
-- Index pour la table `users_has_observations`
--
ALTER TABLE `users_has_observations`
  ADD PRIMARY KEY (`id_user`,`id_observation`),
  ADD KEY `fk_users_has_observations_observations1_idx` (`id_observation`),
  ADD KEY `fk_users_has_observations_users1_idx` (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `observations`
--
ALTER TABLE `observations`
  MODIFY `id_observation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `observations`
--
ALTER TABLE `observations`
  ADD CONSTRAINT `fk_observations_states` FOREIGN KEY (`id_state`) REFERENCES `states` (`id_state`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_roles1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_has_observations`
--
ALTER TABLE `users_has_observations`
  ADD CONSTRAINT `fk_users_has_observations_observations1` FOREIGN KEY (`id_observation`) REFERENCES `observations` (`id_observation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_observations_users1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
