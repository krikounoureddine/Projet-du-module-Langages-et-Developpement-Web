-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 27 oct. 2024 à 20:09
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka`
--

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(8, 1, 24, 5, NULL, 'Utilisateur 1', 1, '2024-10-27 13:30:28', '2024-10-27 13:39:40', 'Omeka\\Entity\\Item'),
(9, 1, 24, 5, NULL, 'Utilisateur 2', 1, '2024-10-27 13:34:14', '2024-10-27 13:39:20', 'Omeka\\Entity\\Item'),
(10, 1, 24, 5, NULL, 'Utilisateur 3', 1, '2024-10-27 13:38:57', '2024-10-27 13:38:57', 'Omeka\\Entity\\Item'),
(11, 1, 24, 5, NULL, 'Utilisateur 4', 1, '2024-10-27 17:05:17', '2024-10-27 18:16:41', 'Omeka\\Entity\\Item'),
(12, 1, 24, 5, NULL, 'Utilisateur 9', 1, '2024-10-27 18:17:04', '2024-10-27 19:00:39', 'Omeka\\Entity\\Item'),
(13, 1, 24, 5, NULL, 'Utilisateur 8', 1, '2024-10-27 18:17:36', '2024-10-27 18:56:12', 'Omeka\\Entity\\Item'),
(14, 1, 24, 5, NULL, 'Utilisateur 7', 1, '2024-10-27 18:18:19', '2024-10-27 18:40:23', 'Omeka\\Entity\\Item'),
(15, 1, 24, 5, NULL, 'Utilisateur 6', 1, '2024-10-27 18:19:00', '2024-10-27 18:36:46', 'Omeka\\Entity\\Item'),
(16, 1, 24, 5, NULL, 'Utilisateur 5', 1, '2024-10-27 18:31:31', '2024-10-27 18:31:31', 'Omeka\\Entity\\Item');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
