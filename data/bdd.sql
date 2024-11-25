-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 25 nov. 2024 à 10:15
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
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('Cnsf9FBkMJDzbXTFnlCk0Ha54seJKtHo', 1, 'key_dc', '$2y$10$JQX795tizP27PWIg1eSZy.JDd.7zYWU0/W8r7CPUbP3ArxeKKmxhK', NULL, NULL, '2024-11-25 07:27:07'),
('q5jlhfFTlZQseEu8LHJeCXpBWcyQlonl', 1, 'dc', '$2y$10$W0.ijdL64yrWxqSrCvU9M.t9xNUh5Y0PVu00/ZxOmM49MKxKVzQAG', NULL, NULL, '2024-11-25 07:16:09');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `asset`
--

INSERT INTO `asset` (`id`, `owner_id`, `name`, `media_type`, `storage_id`, `extension`, `alt_text`) VALUES
(1, 1, 'download.png', 'image/png', '5630282a52143db3f43e940c0e4d700478807d86', 'png', ''),
(2, 1, 'edecf9c9adfb513e5b10a598a8f24aa5.jpg', 'image/jpeg', 'da0ef1da3df8f92ff71cfcafa1aadb895d85387c', 'jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(8, 'items', 1, 1, 'Utilisateur 1', 'Utilisateur 1\n1\nkrikou noureddine\nkrikounoureddine@gmail.com\nachteur\n32 Grande Rue\n0745553923'),
(9, 'items', 1, 1, 'Utilisateur 2', 'Utilisateur 2\n2\nIslame mokrani\nmokraniislam998@gmail.com\nvendeur\nparis\n0675529561'),
(10, 'items', 1, 1, 'TELEPHONE', 'TELEPHONE\ntelephone portable\nMos\niphone\n001\niphone 12 \n122$\nneuf\nUtilisateur 1\nUtilisateur 2'),
(11, 'items', 1, 1, 'Stock 1', 'Stock 1\n122 produits\nUtilisateur 1\nUtilisateur 2\nTELEPHONE'),
(12, 'items', 1, 1, 'Produit 1', 'Produit 1\n00001\nprotège iphone 12\n12$\naaaaaa\nUtilisateur 8'),
(13, 'items', 1, 1, 'paiement', 'paiement\nPYPAL\nUtilisateur 7'),
(14, 'items', 1, 1, 'livreaison 1', 'livreaison 1\n05/11/2024\nUtilisateur 6'),
(15, 'items', 1, 1, 'Commande', 'Commande\n12/12/2024\nconfermé\n200$\nUtilisateur 1\nUtilisateur 2\nUtilisateur 5'),
(16, 'items', 1, 1, 'Avis 01', 'Avis 01\n5 étoile\nbien service\nUtilisateur 1\nUtilisateur 2');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1);

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'Omeka\\Job\\IndexFulltextSearch', NULL, '2024-10-13T23:11:47+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-13T23:11:47+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-13T23:11:47+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Controller\\Admin\\SettingController.php(20): Omeka\\Job\\Dispatcher->dispatch(\'Omeka\\\\Job\\\\Index...\')\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): Omeka\\Controller\\Admin\\SettingController->browseAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-13 23:11:47', '2024-10-13 23:11:47'),
(2, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Vos coordonn\\u00e9es R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"277\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\omeC3F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"Horodateur\",\"Adresse e-mail\",\"Nom\",\"Pr\\u00e9nom\",\"Adresse\",\"Num\\u00e9ro de t\\u00e9l\\u00e9phone\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-13T23:52:34+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-13T23:52:34+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-13T23:52:34+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-13 23:52:33', '2024-10-13 23:52:34'),
(3, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Vos coordonn\\u00e9es R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"277\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\omeA655.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-13T23:55:46+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-13T23:55:46+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-13T23:55:46+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-13 23:55:46', '2024-10-13 23:55:46'),
(4, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Vos coordonn\\u00e9es R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"277\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\ome7B3A.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"Horodateur\",\"Adresse e-mail\",\"Nom\",\"Pr\\u00e9nom\",\"Adresse\",\"Num\\u00e9ro de t\\u00e9l\\u00e9phone\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T07:17:53+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T07:17:53+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T07:17:53+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 07:17:52', '2024-10-14 07:17:53'),
(5, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Vos coordonn\\u00e9es.csv\",\"filesize\":\"277\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\ome1237.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":[{\"dcterms:date\":7},{\"foaf:mbox\":123},{\"foaf:name\":138},{\"foaf:firstName\":139},{\"dcterms:abstract\":19},{\"bibo:number\":108}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":94},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T07:50:01+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T07:50:01+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T07:50:01+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 07:50:01', '2024-10-14 07:50:01'),
(6, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Vos coordonn\\u00e9es.csv\",\"filesize\":\"277\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\omeA41D.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":[{\"dcterms:date\":7},{\"foaf:mbox\":123},{\"foaf:name\":138},{\"foaf:firstName\":139},{\"bibo:citedBy\":59},{\"bibo:number\":108}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":{\"o:id\":94},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T09:14:14+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 09:14:14', '2024-10-14 09:14:14'),
(7, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Vos coordonn\\u00e9es.csv\",\"filesize\":\"277\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\omeA5C5.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 09:18:06', NULL),
(8, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Vos coordonn\\u00e9es.csv\",\"filesize\":\"277\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\omeAA0E.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":[{\"dcterms:date\":7},{\"foaf:mbox\":123},{\"foaf:lastName\":140},{\"foaf:firstName\":139},{\"bibo:citedBy\":59},{\"bibo:issue\":103}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":94},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-17 17:08:57', NULL),
(9, 1, NULL, 'starting', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":[]},\"action\":\"add\"}', NULL, '2024-10-17 18:56:34', NULL),
(10, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"4677\",\"filepath\":\"C:\\\\Users\\\\Zarko\\\\AppData\\\\Local\\\\Temp\\\\omeC41E.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"newphoneshop:aPourHorodateur\":199},{\"newphoneshop:aPourEmail\":198},{\"newphoneshop:aPourNom\":200},{\"newphoneshop:aPourPrenom\":201},{\"newphoneshop:aPourDateDeNaissance\":202},{\"newphoneshop:aPourSituationPersonnel\":203},{\"newphoneshop:resideDans\":204},{\"newphoneshop:parleLangues\":205},{\"newphoneshop:aUtiliseMobile\":206},{\"newphoneshop:prefereMarques\":207},{\"newphoneshop:aPourBudget\":208},{\"newphoneshop:estInteress\\u00e9ParEcommerce\":209},{\"newphoneshop:aProfilUtilisateur\":210},{\"newphoneshop:desireFonctionnalites\":211}],\"column-multivalue\":[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":5},\"o:resource_class\":{\"o:id\":24},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"o:site\":[\"1\"],\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-27 18:13:33', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.1');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('QK1EWpdFg9fdQGpSA7z888aTNi9PyZHC', 3, '2024-11-25 09:09:44', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(212, 1, 7, 'proposeProduit', 'propose produit', 'Indique qu\'un vendeur propose un produit pour la vente.'),
(213, 1, 7, 'possedePanier', 'possede panier', 'Associe un acheteur a son panier.'),
(214, 1, 7, 'contientProduit', 'contient produit', 'Indique que le panier contient un produit.'),
(215, 1, 7, 'aPourCommande', 'a pour commande', 'Associe un acheteur a une commande specifique.'),
(216, 1, 7, 'appartientAStock', 'appartient a stock', 'Indique qu\'un produit fait partie du stock disponible.'),
(217, 1, 7, 'evalueProduit', 'evalue produit', 'Associe un acheteur a son avis sur un produit.'),
(218, 1, 7, 'laisseAvis', 'laisse avis', 'Associe un avis a un produit specifique.'),
(219, 1, 7, 'aPourLivraison', 'a pour livraison', 'Relie une commande a sa livraison.'),
(220, 1, 7, 'reliePaiement', 'relie paiement', 'Associe un paiement a une commande specifique.'),
(221, 1, 7, 'ID_utilisateur', 'ID utilisateur', 'Identifiant unique pour chaque utilisateur.'),
(222, 1, 7, 'Nom', 'Nom', 'Nom complet de l\'utilisateur.'),
(223, 1, 7, 'Email', 'Email', 'Adresse e-mail de l\'utilisateur.'),
(224, 1, 7, 'Type_utilisateur', 'Type utilisateur', 'Indique si l\'utilisateur est un acheteur ou un vendeur.'),
(225, 1, 7, 'Adresse', 'Adresse', 'Adresse de l\'utilisateur.'),
(226, 1, 7, 'Telephone', 'Telephone', 'Represente un telephone mobile en tant que produit specifique.'),
(227, 1, 7, 'ID_produit', 'ID produit', 'Identifiant unique pour chaque produit.'),
(228, 1, 7, 'Nom_produit', 'Nom produit', 'Nom du produit.'),
(229, 1, 7, 'Marque', 'Marque', 'Marque du telephone.'),
(230, 1, 7, 'Prix', 'Prix', 'Prix du produit.'),
(231, 1, 7, 'Description', 'Description', 'Description du produit.'),
(232, 1, 7, 'Stock_quantite', 'Quantite de stock', 'Quantite de produits disponibles en stock.'),
(233, 1, 7, 'Modele', 'Modele', 'Modele du telephone.'),
(234, 1, 7, 'Systeme_exploitation', 'Systeme d\'exploitation', 'Systeme d\'exploitation du telephone.'),
(235, 1, 7, 'Date_commande', 'Date de commande', 'Date a laquelle la commande a ete passe.'),
(236, 1, 7, 'Statut_commande', 'Statut de commande', 'Statut actuel de la commande.'),
(237, 1, 7, 'Montant_total', 'Montant total', 'Montant total de la commande.'),
(238, 1, 7, 'Date_livraison', 'Date de livraison', 'Date a laquelle la livraison est prevue.'),
(239, 1, 7, 'Commentaire_aavis', 'Commentaire', 'Commentaire ou retour d\'un acheteur sur un produit.'),
(240, 1, 7, 'Note', 'Note', 'Note attribuee par l\'acheteur a un produit, sur une echelle de 1 a 5.'),
(241, 1, 7, 'Mode_de_paiement', 'Mode de paiement', 'Type de paiement effectue pour la commande.');

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
(8, 1, 133, 6, NULL, 'Utilisateur 1', 1, '2024-10-27 13:30:28', '2024-11-04 01:43:59', 'Omeka\\Entity\\Item'),
(9, 1, 133, 6, NULL, 'Utilisateur 2', 1, '2024-10-27 13:34:14', '2024-11-04 01:46:53', 'Omeka\\Entity\\Item'),
(10, 1, 137, 8, NULL, 'TELEPHONE', 1, '2024-10-27 13:38:57', '2024-11-04 01:50:38', 'Omeka\\Entity\\Item'),
(11, 1, 138, 9, NULL, 'Stock 1', 1, '2024-10-27 17:05:17', '2024-11-04 01:51:29', 'Omeka\\Entity\\Item'),
(12, 1, 136, 7, NULL, 'Produit 1', 1, '2024-10-27 18:17:04', '2024-11-04 01:53:02', 'Omeka\\Entity\\Item'),
(13, 1, 141, 10, NULL, 'paiement', 1, '2024-10-27 18:17:36', '2024-11-04 01:54:07', 'Omeka\\Entity\\Item'),
(14, 1, 142, 12, NULL, 'livreaison 1', 1, '2024-10-27 18:18:19', '2024-11-04 01:57:14', 'Omeka\\Entity\\Item'),
(15, 1, 139, 13, NULL, 'Commande', 1, '2024-10-27 18:19:00', '2024-11-04 02:03:35', 'Omeka\\Entity\\Item'),
(16, 1, 143, 11, NULL, 'Avis 01', 1, '2024-10-27 18:31:31', '2024-11-04 02:04:50', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(133, 1, 7, 'Utilisateur', 'Utilisateur', 'Represente une personne utilisant le site, soit acheteur soit vendeur.'),
(134, 1, 7, 'Acheteur', 'Acheteur', 'Utilisateur qui achete des produits sur le site.'),
(135, 1, 7, 'Vendeur', 'Vendeur', 'Utilisateur qui vend des produits sur le site.'),
(136, 1, 7, 'Produit', 'Produit', 'Represente un produit disponible a la vente sur le site.'),
(137, 1, 7, 'Telephone', 'Telephone', 'Represente un telephone mobile en tant que produit specifique.'),
(138, 1, 7, 'Stock', 'Stock', 'Quantite de produits disponibles pour la vente.'),
(139, 1, 7, 'Commande', 'Commande', 'Regroupe les details d\'une transaction d\'achat realisee par un acheteur.'),
(140, 1, 7, 'Panier', 'Panier', 'Contient les produits selectionnes par un acheteur avant la commande.'),
(141, 1, 7, 'Paiement', 'Paiement', 'Represente le paiement effectue pour une commande.'),
(142, 1, 7, 'Livreaison', 'Livraison', 'Informations sur la livraison de la commande.'),
(143, 1, 7, 'Avis', 'Avis', 'Feedback ou evaluation d\'un produit par un acheteur.');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(6, 1, 133, NULL, NULL, 'Utilisateur'),
(7, 1, 136, NULL, NULL, 'Produit'),
(8, 1, 137, NULL, NULL, 'Telephone '),
(9, 1, 138, NULL, NULL, 'Stock'),
(10, 1, 141, NULL, NULL, 'Paiement'),
(11, 1, 143, NULL, NULL, 'Avis'),
(12, 1, 142, NULL, NULL, 'Livreaison'),
(13, 1, 139, NULL, NULL, 'Commande');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(65, 6, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(66, 6, 221, NULL, NULL, 2, NULL, 0, 0, NULL),
(67, 6, 222, NULL, NULL, 3, NULL, 0, 0, NULL),
(68, 6, 223, NULL, NULL, 4, NULL, 0, 0, NULL),
(69, 6, 224, NULL, NULL, 5, NULL, 0, 0, NULL),
(70, 6, 225, NULL, NULL, 6, NULL, 0, 0, NULL),
(71, 6, 226, NULL, NULL, 7, NULL, 0, 0, NULL),
(72, 7, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(73, 7, 227, NULL, NULL, 2, NULL, 0, 0, NULL),
(74, 7, 228, NULL, NULL, 3, NULL, 0, 0, NULL),
(76, 7, 230, NULL, NULL, 4, NULL, 0, 0, NULL),
(77, 7, 231, NULL, NULL, 5, NULL, 0, 0, NULL),
(78, 8, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(79, 8, 233, NULL, NULL, 2, NULL, 0, 0, NULL),
(80, 8, 234, NULL, NULL, 3, NULL, 0, 0, NULL),
(81, 9, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(82, 9, 232, NULL, NULL, 2, NULL, 0, 0, NULL),
(83, 10, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(84, 10, 241, NULL, NULL, 2, NULL, 0, 0, NULL),
(85, 11, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(86, 11, 240, NULL, NULL, 2, NULL, 0, 0, NULL),
(87, 11, 239, NULL, NULL, 3, NULL, 0, 0, NULL),
(88, 12, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(89, 12, 238, NULL, NULL, 2, NULL, 0, 0, NULL),
(90, 13, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(91, 13, 235, NULL, NULL, 2, NULL, 0, 0, NULL),
(92, 13, 236, NULL, NULL, 3, NULL, 0, 0, NULL),
(93, 13, 237, NULL, NULL, 4, NULL, 0, 0, NULL),
(94, 8, 229, NULL, NULL, 4, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('1ec5o0d8pk6nri5s3lgldrrd6j', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323430363132342e3030373230363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316563356f306438706b366e72693573336c676c64727264366a223b7d7d, 1732406130),
('229n61e6km1lajsamu2p84tv3s', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383836353134362e3435383139393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d7472336d673871703770307038617074356136723763627171223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383930373235313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383930373236383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383930373237373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223032663130386330356535363438346262613438323437303765656366646230223b733a33323a223936323135613961633737643762303539643962373332623639613237323734223b733a33323a223936643833356462333065633461323838346661623932653634663866393033223b733a33323a226535323235383733326466666336343238653038663032633137653639613734223b7d733a343a2268617368223b733a36353a2265353232353837333264666663363432386530386630326331376536396137342d3936643833356462333065633461323838346661623932653634663866393033223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223761393937393664666531396237636130643762363238656231316436343536223b733a33323a226531666261336238316566643838393930666231356631353231643338383539223b733a33323a226266306233643037386637623430323130643462613366343162373639303462223b733a33323a226230326235306265343231353731396438386633653966396561313262313561223b733a33323a223337653138663239356166373236613434626635626332396338343839666431223b733a33323a226238623439663066353834376530383262323632633562376237646231316161223b733a33323a223861653731643262613961633066366264646664326635356662646462336335223b733a33323a226561303230666131373230613066373833303937336333383432386361653733223b7d733a343a2268617368223b733a36353a2265613032306661313732306130663738333039373363333834323863616537332d3861653731643262613961633066366264646664326635356662646462336335223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223630303034653263623830633935396137323731366637646266363038613333223b733a33323a226633336437616631626339633663613066333364336231633334646138383938223b7d733a343a2268617368223b733a36353a2266333364376166316263396336636130663333643362316333346461383839382d3630303034653263623830633935396137323731366637646266363038613333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728865146),
('59tjt11ab2tdfj5rj4vda3lph5', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393139343936312e3731373531343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356d6b72696e366f726c6a716c64346e6b767170627530313069223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393233323236343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732393233383030313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393233373835363b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393233373836303b7d733a35303a224c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393233373930353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393233373636353b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223838653734613766393136333030643564383461313137633063316330346533223b733a33323a223835396366633135653637643661323865363866373564316235336536393432223b733a33323a226561396239363830333838313130626166333263383539346339386130393739223b733a33323a223962303436353263333030373939643065666335323666333664316237376236223b7d733a343a2268617368223b733a36353a2239623034363532633330303739396430656663353236663336643162373762362d6561396239363830333838313130626166333263383539346339386130393739223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35343a7b733a33323a226663383862643030646463656531393164346237663536653431306330383839223b733a33323a223964336538336531313834333737666166316464333062303639623332363763223b733a33323a226232643264376638316638396534336332623931396632366530393331356261223b733a33323a223161646530326536653639343139393466366233366138373963363135643634223b733a33323a223134643464643539653336653934306561346637383361383232373331333830223b733a33323a226435356363623536623963346638383032313262313235613132623832313439223b733a33323a226237303463663634313032373031326338643738646536393438656232353964223b733a33323a223135376633633861326665616334613864316530323831656632313366323563223b733a33323a226665666238343036633334316339343438306339666238303364663432643264223b733a33323a223137623634663438363162343364663439623832376565663434623538383734223b733a33323a223134666239656630303565656265323839373834303639653532646162396664223b733a33323a223333393561393362646438643139313165303338323338336138616661386438223b733a33323a226633366366643737306566313738373138303263343764323461653331373537223b733a33323a226165346135623137303732316361656437636166613338613834383633653135223b733a33323a223735653266646135326663623634363662373331363564623331643039386139223b733a33323a223366326264386536336462643832346132373738353339333464376462333939223b733a33323a223063636331313065613866643036396665613835653434346631623866373433223b733a33323a223463313232643335636235343665366538323130646234623462306366336136223b733a33323a223465653235333931363135323034336134353930363065376636323161376331223b733a33323a223864333133663035376263353761363366343334653365376565313463633135223b733a33323a226561646264646130356132313534363530653632343564313232306231353431223b733a33323a223034383663366139366333383334393063306165343736623239343132326137223b733a33323a223765366365363032386439643161633463633433653861323137313931323731223b733a33323a223239393432343466626136613363373637636161626266356231366630353936223b733a33323a226131653236333663373530356661326665396532346231646633346462323165223b733a33323a226637353132653932326339366131653433656464306339376665633530656335223b733a33323a223865306666653365346632343062383638386133333735633464353362633662223b733a33323a226564326332346231666430303835653865366431653531616332343836393833223b733a33323a226535653331643561316235653535633732373635366138626634666138363137223b733a33323a226338653165626163343338666661643231356537613830643737633962663235223b733a33323a226636353165326432323330306337383335376633303530346162343031326334223b733a33323a226633313366656339663261316632663163363663653037353363616266323238223b733a33323a226161656466366337666636613835346531376633323231333465396666336338223b733a33323a223862616533613535393730636537336165373030386261613234333438316532223b733a33323a226139616330353038333438373536653663343536626235326332356639616363223b733a33323a226138336664323436316231643162643330393834636662633739653035326233223b733a33323a223430616263653634356265633331363465656138333232363936333361326434223b733a33323a223365333166366261326132616434623639663865303332656565623562343361223b733a33323a223530643233363235386366316666636232326234653339326261333261333333223b733a33323a226636623630323633303036306161393537383737653339383732373161356135223b733a33323a223263656464646335616162316163643230626339663534653434643863653537223b733a33323a223661633837643935643662666136363062373937383432643836663161316264223b733a33323a223464613363346631323430363333396339353732303239373335623031373539223b733a33323a223362623866636337353764393139633435323865646339343232613638613033223b733a33323a223932383233353239363665626535363134326331346165386263336665646233223b733a33323a223862303837303838396462343336633035373230653437326138326364643930223b733a33323a223163326434396566663737343231336462343438383163633161613263666432223b733a33323a226130373639643766366632306165366336313064353339643235376236633134223b733a33323a223830373735663466373866326533626461376462653561653532346634656538223b733a33323a223331373539613066616164323264643064376336646164343730636433363431223b733a33323a223465313837633463663433623730376532353061373236396336613061353438223b733a33323a226537376137306338373531336437393638643131323838656634303839663061223b733a33323a223736656561636233303935323664353631313130303437303436326434663936223b733a33323a226331336361303164393936336630343064613230366437353962393261346136223b733a33323a223034356530613639663231623335623461666337616633353935336330653535223b733a33323a226133336261646239666139303439323539383366626465393563623832393164223b733a33323a223834393738646162313434663833643064643130376538313333373234613636223b733a33323a223364373763306465313936333164633864636662643439643639343838633763223b733a33323a226638386263326536643132643161323839623437633936333730373261383531223b733a33323a223066323261376635396362666630343762323864363236346431333132306662223b733a33323a223236616337633365303033653637663363326339383664623535623665366663223b733a33323a226437353033396133373766666335303462653864396566613564633561373265223b733a33323a223434373438656537376666316466303032323139306532313732663861376466223b733a33323a223539623936613837663739656363386432623338626363623331383234633230223b733a33323a223636386132383134373232333630373133643336373163333033646634303833223b733a33323a226437643133316464666131663430373730336466376333303934386161323135223b733a33323a223536633534643931353532346332626537613331396561393365626532373935223b733a33323a226462346533383230303233323238616335663533623064636237623565653664223b733a33323a226332386535316239333461646232363235396431323835333233626534336637223b733a33323a223766303965663566643862393763303936353261663237393733653631653463223b733a33323a226231616430333135326664393038396234323830646465316332666533646436223b733a33323a223264353433643130386364316237353336316365316166663965613731313639223b733a33323a223065353764326132383162636336303136636438363338316562306264393766223b733a33323a223332386165386461656530336332643031643332333332303166633262363731223b733a33323a226662646436333336633739626233363835373936653864646531633365633161223b733a33323a226131363666653466393036666164393437613135633663663238383739663964223b733a33323a223139346137643162643735353563653263346335616463366436396333333639223b733a33323a223063643861353932613131393430633731313637343131363936363265376363223b733a33323a226635393264366630326163366132326539303237613661313966326132653163223b733a33323a223737656664656464323138316238643733313462633061333437356331313635223b733a33323a223236663333373665313865353437613730363033306663323730313366636563223b733a33323a226164623134646630386235376261616162383730653838316638643735383664223b733a33323a223663386635633737383637396161626462313835643036643137666663386234223b733a33323a223064656364376630363564393037653831346430343438396133346365333234223b733a33323a226461616134373865646334636162383965393130616337306461323462653834223b733a33323a226138333132393939646330313030623838653565323830323065373133646133223b733a33323a223765333930623236326430353066363834336137666434643535326537353437223b733a33323a223962303339323030366631383763356437323034653530633464303762333436223b733a33323a226439323734366531383633613264663336633437323336333137363439653962223b733a33323a226262626233323865306466663464633732363934643737336339646533643137223b733a33323a226162363730643764373763616361333937643961333861653363613932653339223b733a33323a223531323630346138663835626166303861323731323839663738303037613461223b733a33323a223562376533666564396263323063366530396465363430316631393761616232223b733a33323a226462636365636537353565303462333634653462343137623134623966386237223b733a33323a226639326561616134353761393530613837323530613833653737643839363635223b733a33323a223839643939666438363839613733313162353533366362366538383338633764223b733a33323a226338663864393430616633633238343739396232323830306236356537653939223b733a33323a223064346234666135316438313031613434386532386261373863396166613430223b733a33323a223330666632666363653836383030366531653435313365653063306266623239223b733a33323a226639636161303166653962366333333530653135346533306162333937353766223b733a33323a226666366436376666323135613330613831386534336263646666623639333138223b733a33323a223439656562616435383335303766653636396562333561666362333766353066223b733a33323a223761353039333333343863366338323066666630623033633737613439336233223b733a33323a226432633263383839343732366534366531333839333564643862313032366437223b733a33323a223266653966366236306261313432313437306563623466616339386539373537223b733a33323a226262303437306566306234613736386132353066633966306565366432656130223b733a33323a223763383363383964313062353834353536343635666337343839343732333666223b733a33323a223762353834626534343633326561376463323063306532633364333963303632223b7d733a343a2268617368223b733a36353a2237623538346265343436333265613764633230633065326333643339633036322d3763383363383964313062353834353536343635666337343839343732333666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36383a7b733a33323a226530303561616636313532373130383432356335306663373533313866666661223b733a33323a223232623064323336626462306238623136653637633832336462376337643763223b733a33323a223635653737313365336130373637313130373162623032633035363733396164223b733a33323a223065316165393464356264383037623165346539333664663433306536646562223b733a33323a223363333833613062353037666138396533666362623330623134633930383265223b733a33323a223666353135373235363936633966366233303932666139333035303630313131223b733a33323a223464393434663562393337646232303430393232646330376362396531336130223b733a33323a223732383062643035656337333566316139643439313163396165353136626533223b733a33323a226634663164396362356663373464666237653566353432616364353937346264223b733a33323a226335333230313139666237663962393935663933356238396337383432393633223b733a33323a226162656239643637396638353338656232626465633362643933346565336639223b733a33323a223237363932306562316666616161626563303931393430653663313963646337223b733a33323a226133623934623439616638333665316339613432333663333832303163653337223b733a33323a223130623338663337666463653133633663633532333333366138353637386332223b733a33323a226431643565616534313336633262656231323062306664313237363930376331223b733a33323a223539366261646563346234633535356638653139613261336336373864326566223b733a33323a223561353963346462323333626330633065633234623461636634643631353064223b733a33323a226338356433373433363639303037323332353361656331616134346166363164223b733a33323a223463383531646562366534353435323161333639303530646336663235373631223b733a33323a223637373566646564656464613963633261633765643366313962656531353765223b733a33323a223962386433646234646239613933656135336664303933376438326135393930223b733a33323a226162343535333332636235643361616363363665363838343531386534326330223b733a33323a223232393064646538363131623733653066336133656232323364613838386631223b733a33323a223431363165303636376334666637626365363931343565623531326662663961223b733a33323a226538636638616163626466633534623336323838623935346337316563663830223b733a33323a226362363336343535656531383865353939636235343639393736366663666239223b733a33323a223137643331336361386436613766373233653938396132363262643161336639223b733a33323a223637646538333265343532633734336633336230313464323139353266333464223b733a33323a223837656566396265623234626130383764333234366435653165313838616134223b733a33323a223161386465636334383036646435363638653834633265653337636133666632223b733a33323a226461666232633330326235616332613865393432396432613734626366623761223b733a33323a223735376362333836346265383166656335643230393565363366366563643861223b733a33323a223437663533656234396339313735393031316130363736656234386132616130223b733a33323a226533643536616632663862356234306364373437623432333263323764316636223b733a33323a223439386636623063313862373734323734366162633836363363366461613836223b733a33323a223166633665646363336235373663626533633965643761353430383166373730223b733a33323a223935623135386561353334313762366430306636663264306331626231366135223b733a33323a226433633166363936646264633863666331613662626537653262313031386631223b733a33323a223238613761313533336237346231633964633635376535383463316234313336223b733a33323a223037613537363061613538333030633336323164333166336532393732666263223b733a33323a226436626533376430313331346434626432303935333937393063386535353735223b733a33323a226133643962316131383033333436646634616566306433643163383333363332223b733a33323a226330333631653861616461383730646232303661383730336537623433656339223b733a33323a226438303638623434646538353035313237656233323531346263313837316266223b733a33323a226266373835393438396232656130346330653736366135316638363236333737223b733a33323a226638626165613435336431393131313238383763623939396336333836653132223b733a33323a226530626230303237346231663736663732306364363538326337653332383734223b733a33323a226439383234666133636363613433643535626461363865303835376639363531223b733a33323a226462343233363665623364353166613265373634303235653661336264386533223b733a33323a223866363034326332613930393534333537323431306536383965616638653263223b733a33323a226136316430636430363330363665366564313631343461363337643463366266223b733a33323a226530326664376362633837306531613436643438613932363230356335363066223b733a33323a223839666365663764396262623963373939636133613030333937306461303231223b733a33323a223065386633386262616366623333306237306436653961306264376539653261223b733a33323a223861653132363962353934303465346463303566373634373234646136613164223b733a33323a223134343235323337336532386439326464323235613462316265396664316235223b733a33323a226131646663313334313333376132653362383061623665333236646632383362223b733a33323a223937656538336532363862386131376333356563343733663730633536303131223b733a33323a223835653265626563356463633935316238626639383563353166333232343832223b733a33323a223761613239646166363231393439643563356634353963623833636632326331223b733a33323a226339333934336531356530663432613236303066303066333532663966383634223b733a33323a223739396232376130666131666565643735396163366538663464313638623761223b733a33323a223235396164373331633835313165633138636238356534323732613862376135223b733a33323a223766623639323964303832656462623930306430663361613635346261633438223b733a33323a223766353462613938396464323635363162343865383865613465303839316632223b733a33323a226339373065623463353332316662343930363039313434303036333537636166223b733a33323a226562643638303731303465363833643030653834343161616435353532633538223b733a33323a223232316561323630303236363135643737653433323235353864613866306164223b733a33323a223630353966643335353861376166643665346534643639326232386133343263223b733a33323a223738363534356264643666363738326663643838396266376530623262303532223b733a33323a223639653363323164646162653339353137626462316465623439313564653631223b733a33323a223639643763326636366239613237303435316535336462333265663238306636223b733a33323a226432383666303564353138633938616434316630333732663139613665313430223b733a33323a226335383831643865623830643232313938306430616231333234363466616433223b733a33323a226461343466356633313365336238313661316661633464363866303730666230223b733a33323a226662373663623538326136613437313531336663656239363230646338346539223b733a33323a223831306537396333613637363466636161303433613266666263316133663332223b733a33323a226333366631346330396265373038363139636364656266316431386137663066223b733a33323a226236316235633732313137616631646337383865363439656564363236373930223b733a33323a223036373733303633623137303863366338666536643461383566343736663866223b733a33323a223862376130386137326663666431633366643664666530343138366364316464223b733a33323a223732326533646634313131356331386566326132333537663931616466316637223b733a33323a223533343033396263346538373032393161643264666130313632623239346235223b733a33323a226361656132333731336135336164653133666266313930336366303263653938223b733a33323a223264366338386230663663313764393232396563323266386462633739356265223b733a33323a226561383663623333616563373730663862626664393762356335373762393966223b733a33323a226531323164623236303661656266623137666263323437386261643239353035223b733a33323a223736316635333337333864306631633563313034363737386332643232393638223b733a33323a226236346265303235363061343535633362303039646532396638326230373635223b733a33323a223839346239306635633264386436623463653662343839323961336538636533223b733a33323a226437646537336531326265393132383766343533656536373963356366336166223b733a33323a226262643531656134373563323635636638623134633434363930626463383630223b733a33323a226237336365656530613533396631333530356165623962326239346563376236223b733a33323a223062666662663137373132363832313530393665643838656132633261623332223b733a33323a226131336431663536303333613865663461343931303332313638326131383164223b733a33323a226564326439383533613030366537343163346339386335626130646266353539223b733a33323a223134623961636533343535346661323639633764666538616461353736343432223b733a33323a223435663936303032306464666463656439613230333164666533303064613266223b733a33323a226135363635343663643331323865393363353439366132376665656139323631223b733a33323a223635623731336165313639623162323365656466376533303364336661333065223b733a33323a226266313037663430626232636539393237333037386562646363636436333363223b733a33323a226438383637653935393539646261653831623037336133363263363765396666223b733a33323a226136666263633832383432316564393337373931383431626636336435643966223b733a33323a223635316438393130613131626138633131373430393238376265306463383636223b733a33323a226166663633383166613739356664633261656437383430333062663561363937223b733a33323a223238306632303532363364613832303265396333303464616263396363363264223b733a33323a223930396339313664306634666265613239353937386639643564356236393935223b733a33323a223234626232356233633835656232616534343039656139653064636134313530223b733a33323a223731313537353735393231353462666535363532303233643065653338393934223b733a33323a223039343932626331653732613562653735653938316131346265633463336433223b733a33323a223338656630363133393033323336376464616535623364613665386161306266223b733a33323a226334323666613130366231636636343934363463653739653363373337303635223b733a33323a223838383665356264373862633433303539626366343761366132363662373962223b733a33323a226631636564363365363430386361303433323865376535336564373934353438223b733a33323a226261303163613136353639396336646336356131316666333234626233616134223b733a33323a226236333635636332623733366234303837323364643865353932363034363461223b733a33323a226132336532353665373735303861366237396438353262333866393032363730223b733a33323a226233636337316531373664306262363062313763316132383133663732303731223b733a33323a223264313563386665343162363536633834346335356430663665643433386635223b733a33323a226231623563623138353663396639373565616130616330396137383061386261223b733a33323a223439346232356165393465373933393432343735393762346338616132643536223b733a33323a226666386335663230663933663864633239396438396566623830636461663366223b733a33323a223034633532316265613964663539613537613032653035326233343437353437223b733a33323a223232333462636638333937353632643037333966323033356130643731646163223b733a33323a226339316262653164393633373463643533356235663365623561386438643033223b733a33323a223231383436373162666338323932663437613534363636333030333839663934223b733a33323a226663326636623861666563303639393665643465636436336637333262613633223b733a33323a226232393766653933646566626236663466373939643937356566336535376465223b733a33323a223131356136366139353137656461366331393039623336353234383837613836223b733a33323a223464313232313532396565306635343030663934386261386337353130326565223b733a33323a226264623037633632316534353762376361656161326632326338653735633338223b733a33323a223661633933656661363863316134646131343732356531323034646231336434223b733a33323a226435393966336536633531643064656265353830663965323234636463376261223b733a33323a223539633766663861323466313635316137626430373863396331383666656133223b733a33323a223063303561313939376131633737633938363037336664333937326631346536223b733a33323a226430356666316230366432393635323232653833376338636239643866313935223b7d733a343a2268617368223b733a36353a2264303566663162303664323936353232326538333763386362396438663139352d3063303561313939376131633737633938363037336664333937326631346536223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223536636137396430383335363630633430343631326638653632643031666632223b733a33323a226531363335383936666461666632383935623539326563646563663237396235223b733a33323a223036373765326237383563343564656639313637656164323835663561353338223b733a33323a226631343331616464323832643837643532373234393063616532623865623561223b733a33323a226132643334613264646165323263306534643939363039656636373532663935223b733a33323a226230613430666330383836393532636566393131353364626636643032396566223b733a33323a223236633237326233326638396139643764613266386162306239663062303262223b733a33323a226533663038613234393665663738333137323264373230383630376236666564223b733a33323a223564373631303231623636316630353362623961383661366164653964383636223b733a33323a226339663265356434623837333838306563323239616565383930326565346333223b733a33323a223736333135643362613461623639633866663630363535656338373866393266223b733a33323a223361633638373731643861396438386536393062363237303130343864306462223b733a33323a226135376238333463353762386232656232336262363434643866383732313531223b733a33323a226663623234386361386236313462623339386335643162356230316331323963223b733a33323a223439373665373964363163363565626566623565623533666361313133643139223b733a33323a223734616465313266356637363339336138666665383531626630336535646531223b733a33323a223931663864333163653933623730666166333537616265353866323136383462223b733a33323a223366383331636438366265616431353934393363303631616438623037383265223b733a33323a223937666333663434313139373432386436353533646230616233633666623932223b733a33323a223863316132343733616334646336333336306438313234643264343132653830223b733a33323a223965623237643039653964306463306162663630366466613766643462646164223b733a33323a226431653463663037353034643262616462666265613066656431323264356630223b733a33323a223361333566613365396236616430623065633238633038303666653565626237223b733a33323a226332333662363362633239396233636538643136346638393338313730316265223b733a33323a223266376337323762373262376664363931653566636333383230343864356630223b733a33323a223234613661393935373631343136376632323537323936343930383665313530223b733a33323a226462343962353536333933306466383364346265346462623366336233613661223b733a33323a223731336531383038313731383234393537383062313533623063633462653063223b733a33323a223032336438376337303866613366313061626630656361643238366232313939223b733a33323a223566393131633731303261643234633061303033626531633737306636323234223b733a33323a226536386562313938633034636463623361633836613439623533316364666132223b733a33323a223830333332376133376631633036626666613030626364336361666138663335223b733a33323a226163363466626633646465623639316566633339613935333362663034306336223b733a33323a223133633038333965353364393561383963373238613062313034383762393035223b733a33323a223630366639383936666637636636326135303837373332313463323036373737223b733a33323a226161336432306433656237616637393535623338383436323562333031363438223b733a33323a223035316465653863623162643263316662633137633264623365326336373636223b733a33323a223435366238656464363832306563613063333335633065383766306663626430223b733a33323a226462663134316135306336386339333539393230363665363161613863393136223b733a33323a226565613362373637393763393137333263376561363531653838336633646134223b7d733a343a2268617368223b733a36353a2265656133623736373937633931373332633765613635316538383366336461342d6462663134316135306336386339333539393230363665363161613863393136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f736974657265736f7572636573666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223133366232636330306163646331653632663132363535646334333166353537223b733a33323a223135633733303431306434616661336632343061363966386464643361313830223b733a33323a223735323634386635396564383961373030643035626631393132623236613138223b733a33323a223766643130323232326166666336343732633064343430656262356430353235223b733a33323a223031666235336139623539633139366234636666376432643730653134326238223b733a33323a223638343739626230373533343239643861646239663338343766613031663665223b733a33323a223562306633353933653038333066386332663632343431653937656237613038223b733a33323a226265616333336537366562326665373566666134306166633037643338626436223b733a33323a223462326332306530393134616235366262313761376133663330633736313735223b733a33323a226563396335303934666433656566353034396434336163616234393161356539223b733a33323a223636323564343561636133656335646537393132623063333164623330343733223b733a33323a223435343362666264653935633235623830376332336662373236643961616635223b733a33323a223536306438393337633138653163333735633834326535623463616534326430223b733a33323a223539663831373331653836346131343030383838313537396438613837333439223b7d733a343a2268617368223b733a36353a2235396638313733316538363461313430303838383135373964386138373334392d3536306438393337633138653163333735633834326535623463616534326430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226536353932376532636565353737653834643436613034363335303763346537223b733a33323a226439343462646366663364383763336661393662396532643637326266646661223b733a33323a223234646535376461346466646134646530653762663038613565396361643061223b733a33323a223031626435656566333762626436323861306165363031393037336335383434223b733a33323a223732656133326633613134356630633235386232363161626234366462313261223b733a33323a223936633637356338643136633863646563326262313962656332653331666132223b733a33323a223666313063386432313336656334373331333566356562306332656161623939223b733a33323a223935666563366630623234393337363932336530393263653263393732346666223b733a33323a223266633934663234326631376434373837313636663764336631363462656531223b733a33323a223839393734643136396332383962636434663631376361616462663965633731223b733a33323a226132656533313531623832646533656638363862313430666436356334663238223b733a33323a223363303763636138653932313362356335663966643163376134313861643035223b733a33323a223266663733333131616162663333633932653732626436613133343835623737223b733a33323a226439383739383032306530643563363361363531623464616638396338373437223b7d733a343a2268617368223b733a36353a2264393837393830323065306435633633613635316234646166383963383734372d3266663733333131616162663333633932653732626436613133343835623737223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729194961);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('61ct34o75eifl25pc52b49inc4', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303035363431392e3238303430363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696834687630616e3862737376686f6b38353875696c706c716a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036393735393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303039383730383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303039383836373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303039313037313b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223731643664393335313435653762336664616138376661316235353661633363223b733a33323a223261623339396639343738386539333566633066396637343065353338376563223b7d733a343a2268617368223b733a36353a2232616233393966393437383865393335666330663966373430653533383765632d3731643664393335313435653762336664616138376661316235353661633363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36343a7b733a33323a223862393633323034663035346339643862393761316366663936663761613039223b733a33323a226333343665663638326336386464626337383030633634343631353234396365223b733a33323a226237643631393363633431636236306337323963316538616663613637626230223b733a33323a223365653038326230663930393839636430323931356362653639356666623236223b733a33323a223737613664346531613539653838383334343166313831353363373036643538223b733a33323a223832303634386566316362626433653033366364363739376661336537616532223b733a33323a223438653061396664393634613361623262623434346238343738613036636463223b733a33323a226532613937643734363664303435316234356665653830373262663565333539223b733a33323a226433323736313362666333323563333063623761353839306137616635386263223b733a33323a223135346561663537643663663462323363393634366662333665636363353937223b733a33323a223161646233366362366438623366396561306532316266353763346531393736223b733a33323a226434383262323466643637346638323963663135636661306230313135643466223b733a33323a223365373833663666383338383530613138363739383535386232303132363638223b733a33323a223133656662633333316432363366393864383939626132656363393937356661223b733a33323a226235626631313538303063616638643666346564353237323735393634363064223b733a33323a223962336364363232666465646339376435346533333731613961396632633561223b733a33323a223330656261393933666337326266613266663763636530336437326634373030223b733a33323a223830623262643135663466353062373265373831396163313439316334626664223b733a33323a223036313962323030356334363934633936356538313966383461613935323065223b733a33323a223631316561343138393835666137663763323937656432666463343735326339223b733a33323a223965626565666430336634656165373563333339306630613335643133333739223b733a33323a223466646535353735343035646437353965373038326531346466643465323738223b733a33323a226630393464386161313835636338356363303664613361313365323365383564223b733a33323a226333336366316231343135336638373362666565656461346165326537356164223b733a33323a223664366466313837333633666363613361666432613238363533363036613262223b733a33323a223435343434633237366666663965316463353531656333653362663436353964223b733a33323a226263363738343462646166313730336530663962386531336166386261663365223b733a33323a223939386265316132336136366630323761346138636464646431366161623762223b733a33323a226138373635313134666462383464663038666235336662653730366363323335223b733a33323a223763653262346233626263393730306533353762633166653464653063353436223b733a33323a223866313662353639316666313066366137393761663466633532656163363133223b733a33323a226462646135386335623762383931343162383335363437663038653439346630223b733a33323a226163313065353032353732366431343038626661346366343835316435616638223b733a33323a223065393730336531363139323438353266663031386630363532663935383763223b733a33323a223662613436353264613663376566386635643634646330363662663566383730223b733a33323a223331616365666164643662306130386533643633616233643763316261326238223b733a33323a226265336332623930616565323865353737383432646137363831646531353864223b733a33323a223037636330653436663137616435613931643131366135383233306135613438223b733a33323a223962616532636534363863636337356239376266333666363966346162666563223b733a33323a226636653332386138363135333638626564616433356261623964623830613637223b733a33323a226464353865653263346563333135336535613532626439363866666332313238223b733a33323a223830326536393566323331383533353765366436626233336334393039373536223b733a33323a226466636137396635353338376133376435623530393264326564666633613064223b733a33323a223335363765393464613161353031316533646263613066303765333533326663223b733a33323a226538386466363832313763343463616130343665616339653565656261366138223b733a33323a223333353938616662313265363864313839653862366661393365326336313335223b733a33323a223730633937353035353236646338333532386166343133323533303534663535223b733a33323a226162323237316330373762616135323332306130396537383738336231323561223b733a33323a226364353063666262646430616135633162613639333062343039663737383336223b733a33323a223738616562323239383930393733636563326663666632323765613630373839223b733a33323a226237373136353863613938626265653834666361626630303863636433343663223b733a33323a226561303961336435633266636333666632663338366436653331386339373335223b733a33323a223363303965643465396530383261393433396134353330633138626338316534223b733a33323a223133343533646363633334616163623966393133316532643762633138306265223b733a33323a226264383336373130363331623038663530303163633762386264396530306163223b733a33323a223535383938383638323436653035383137656434393538393735386165656531223b733a33323a226138326439633035316662636436616262326437373862363434376163383266223b733a33323a223431373631393239386632383237383234313765343263323235316531643264223b733a33323a226238393832336535323133643863633435333864633865613864376630326639223b733a33323a223063346366323636383036646631656337633862386234616361383163313735223b733a33323a226564323939303464366164396238326361643036386539633932383339353634223b733a33323a223263373236363337666364623332336632616262373163613137653931623130223b733a33323a226431633264656135356232393532623366626166356330326238666263383536223b733a33323a223936383433643066636462306630333662396636343137663731346266656164223b733a33323a226133386136663637353461336431363238333363336464396134613263643439223b733a33323a226433396535626434333436343065383437346131653235626237646135633335223b733a33323a223532626135323036663962663532643533343162646164663630666135353733223b733a33323a223633363033643465316632626336363230333534643032663763376561633662223b733a33323a226134313638323561653266663463303533326536333830323462396337636236223b733a33323a226362373565653035313535626262366334353937303333623932613338636635223b733a33323a226564636661356431323935363534663061363232636335303439323931613830223b733a33323a223535353638356139343036636635326630643830616231623630393661616539223b733a33323a223036326236353530376239353162333930663563346632393736363036323137223b733a33323a226362613936383137306365393865363733383737383231303830303134643666223b733a33323a226334333231663063643535346434383238363663353331303336386562626563223b733a33323a223562336664303938663338613065373464643664643965373266626565383638223b733a33323a223464643639393364326437333866366166666265336332333833353032343635223b733a33323a226438383535633665663232616531303363663732653233653962613036376566223b733a33323a223437303066356466343833316165623636666636326230663230666266363961223b733a33323a223234343837623639323866313439613432303462656465383836363330333430223b733a33323a226336363464353437663662626234383230366230393663343038356431633738223b733a33323a226463633036383934313538656365303933383965623034383463613463363163223b733a33323a223831383431636231653065343135303731343266306565663032383561303063223b733a33323a223763346331653765636238643131613861363730666361333438636637353564223b733a33323a223538623237336264386265386264376162383137343039353732633566626231223b733a33323a223430353039316661396437633364353238633735346135343638623561623263223b733a33323a223166666636336132323465323165333366303562356138663062343766353766223b733a33323a223438616633376637336330663863393833663864303564626161656263376137223b733a33323a223665323266373736343635646133633937643131376336616266383630616361223b733a33323a223837333634336433306265653936313330313135656237303239303437303462223b733a33323a226536346236396561666230373430353632383236616138663861646530313161223b733a33323a226434383530643730326437613730313265326466616238373233386665643236223b733a33323a223938393632383964313130356536633463366664303630343531323364323235223b733a33323a223062643662646163313534383437316235646364643536323864636161336634223b733a33323a223765336233303930393063393532623932363064313639363564666136623039223b733a33323a226133383130313964343438613261613362376366616439383534336538333666223b733a33323a226661616133333261343034393936643161323939653666613134396137383738223b733a33323a226161353662663762336234656230366439306234303165653535343063663461223b733a33323a223161376132383961393566343134373435323331626263383839386462343063223b733a33323a223038386237613536663761313966643639393134383538656461363131313137223b733a33323a226664376462636535373465353631363138343832666164616266313962613461223b733a33323a226565623465356663386434303233353338613735316166323366356535333661223b733a33323a223136646562643235633031613363656131373839643933376663353532313832223b733a33323a223939626166343663363039333861316530356637356133653564636664653364223b733a33323a223531396663373536613762303462623137353063393436303366363765376438223b733a33323a226261356331393230666237353334653761303232663965353036383661393366223b733a33323a223338616335616464626264343234313866383664373363303133393137656436223b733a33323a223837386463633962343834343561333465376530353561363030623937633633223b733a33323a226238616164333439313039613539633264363633323333316566613566346165223b733a33323a223831356236636161663936306561623164633337343432336631303363306363223b733a33323a223035616334636330333662633064306636343439356663616163393361306132223b733a33323a223335633439656562653166393034333164663566656433643530656261373562223b733a33323a223637643465623030613766383732393836316262653439653138633664653636223b733a33323a226439633131323963393863666432363365396133613935333638653638363666223b733a33323a223164643835623138666334393331653432323366336265323332653862646561223b733a33323a223139663662393336396663356637623433303766323531646238393364623537223b733a33323a226364366562633433323739343738356430633133373161346330373464646261223b733a33323a223266383961313933623665306533343131636165383961323036353436656636223b733a33323a223566383836653462383966633665346234343936303163613066616632633732223b733a33323a226534313862343830646165663566396462666531613134363839336662386136223b733a33323a223462323830336237646439386466353830366164646132323038343966386536223b733a33323a223362303465306235656462663333306139613132333739353630363030333830223b733a33323a223935623362623764393531663231336337386661373562656230323765366435223b733a33323a223831653337303363396131666563376661363434333032323933303932643461223b733a33323a223661393531313533343034336566656538643136363664323133353761386163223b733a33323a223063633030623630396561323636613231316132613164633136633136613862223b733a33323a226530363831386566636664333037333664303233613839653033343938386661223b733a33323a223235326266613762616365663362623533366136326563623865653032346333223b7d733a343a2268617368223b733a36353a2232353262666137626163656633626235333661363265636238656530323463332d6530363831386566636664333037333664303233613839653033343938386661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a39323a7b733a33323a223032336230653734323330396266353766393737646439303636306362636338223b733a33323a223234336133366533336361653733666432366137663932353061316238656334223b733a33323a226465616433396165373863313732656332313166626438636137353134333563223b733a33323a226432353731346433386664396633653331333264616633323666663339333538223b733a33323a223862333463373936646666623733353238663937333632376432653764616131223b733a33323a223466373438303137313638363664666634303763323936323036373263333863223b733a33323a223033623661336162333266353536386161333362646236633030386236323439223b733a33323a223661396432646462313336333631356438366638336361646633356235626231223b733a33323a223038363764396463646234313130656130343839636639383231336435666564223b733a33323a226637623165363833306561316462653364663730613538656663663231613735223b733a33323a226337313737613866336139646364323030626339336461333937343636303562223b733a33323a223262393765613239343864333363363434373235326165306233393334336135223b733a33323a223133633366626562656436373565396130656465656336656436356238653135223b733a33323a223431323139623237366336626432386463353466346439643065343962343961223b733a33323a223065353961623839366638306634346466333635306666626433396235393465223b733a33323a223862636166653839643533386239323130373266613035376362343365616636223b733a33323a223063336633653231333865633333383264663633353537666634623035653235223b733a33323a223933376531323239306130316162633038616437346630373666626361663730223b733a33323a226636386363306363353763346237643761376433336130663663373064373031223b733a33323a223064313265613939643738653965396365363165623938303534613633396136223b733a33323a223737396437363231623264646661633730306133306139363535376332366266223b733a33323a226166336131346238633565653434393039343961623466653536333830353065223b733a33323a223666356138616232373332336132306338366463623035646439333738383335223b733a33323a226330303938346639623534623164336337313161343034373365653336393635223b733a33323a223966646464353363343465643562336337356163656230366334306636306361223b733a33323a226361316433333764343964383362306330336538663031666538656663636262223b733a33323a223566653862643966366539363238653530613133396538386432383534633832223b733a33323a226361343632613531326261663134363137643566396261663935633163393965223b733a33323a223639663336393065636433633834313165643033653035373064346334623735223b733a33323a223663306362613033623965646235643533333538666637386338343037393661223b733a33323a226161643065623232353632343231663266363565386535336130666662393534223b733a33323a226265323465613932643465343664616562623063626634336565663733366664223b733a33323a226236346235656634613837333830383564363233356332316336323039336430223b733a33323a223862656238366637323038663738613564623833323730303632323763343132223b733a33323a226336353565613735613031366431313939623036306662313531313537323538223b733a33323a223339393662346530303662653766353361386661653362346337653366663061223b733a33323a223634353064303362663831323230656363653038343430303039626232343132223b733a33323a223432386332613738373236646664383066613564333235613531333331346530223b733a33323a226264613538356432613830323030353966643734643266303031396161653731223b733a33323a226161633362376538303533303933636233393233626561636462356132653535223b733a33323a226465663163623564366433653030343039653436613630633166316239326339223b733a33323a223561323732376364613037636164613663613063313439663366376262363264223b733a33323a223834303861636636653532306665396335316232383330313266616139313139223b733a33323a223464373131376234386630643363326461376238616233333363626237333938223b733a33323a223838393231313936326233616439653531643836633361313364366262373362223b733a33323a223937373534653864386434653661356565386434626630613135613263656230223b733a33323a226337616632383737366538383631356537323331633930646363663233646430223b733a33323a226161616266633737623965653939363962663763626336373232363333383836223b733a33323a226162303938393062386161393163636464323037363133343935663731613063223b733a33323a226231343633666533333734613134623231336434633533346563316233306333223b733a33323a223338663030643063666561303034346533313837313663363437393864343035223b733a33323a223433646638326139343461373437373933313535656462663461663761653039223b733a33323a226261333261353137396461653236623661353065666233376165383635383339223b733a33323a226666633664646462643335316265313132636135333262356433393536313262223b733a33323a226262313930333237336637353466646639623732306662633235366139653663223b733a33323a226635373961316363386136663938663861366236333366326238633462343931223b733a33323a223866643935653539663630316238316134646666376637333761363834623238223b733a33323a223938336131656339653034386330363765356230646232303832343137643664223b733a33323a223637636363396664383264666231393664393566623563306561623130386232223b733a33323a226439333765333166326639626162613535303036383136653738326539363864223b733a33323a226632356633383332623238646533363538353331666662613336326564363038223b733a33323a223364396263366461653166653032663937346465316432363534376262323266223b733a33323a223731646461363261386137656439636530343934613265316661393133656130223b733a33323a223665336663633265616133343232623262353030386133636532633437373062223b733a33323a223334373761333064663337613565303430663065613162303036323634333137223b733a33323a226463393565336533636139616162616137656164656632656461363538376462223b733a33323a223162356661346631656637633931393761653831656136336436343933353938223b733a33323a226665656638326663316631393534363335646166373762643464316566343661223b733a33323a223561646633383836313039363663633463633939633162353066393430613631223b733a33323a223831323639363437326438666535613337643963373735383065643135326238223b733a33323a226165653963613539313761346635396137643338346263656437346634373066223b733a33323a223536356363636133306133306139363130626263346366353234383861663166223b733a33323a226134643933363962333830623463336136353138326138346536663037633962223b733a33323a223239626263393333343532366637636437313363623039326337376132303631223b733a33323a223530633330323766373761396262373530323066643261303232623866393435223b733a33323a223361323662303438613262396636333438316434633566393538623332333035223b733a33323a226565326565383561316237396362373337363666316432636338616137346265223b733a33323a223838616333633236333734306132356239366636623861626237336333363535223b733a33323a223930613032376634356530326664393939636333323764626637316564303231223b733a33323a223961376666313933363834643864336163366162346462353262636238303132223b733a33323a226465363137336432623032346236323530663961303066353230386537346263223b733a33323a226463346131366166643531343733666530663463633937303833346562643534223b733a33323a226331333561303331303262613537346634656666383561656537666430313438223b733a33323a226536633137663036316564316139316163316337303962663436653832353964223b733a33323a223333633234313034396363656338646565613565333766386133623336646636223b733a33323a226332636432636534373164636635393432663431386665636231303861373039223b733a33323a223934303366393239316632613066626331633263613665306639643531316132223b733a33323a226334326139636661323933613933306238643433323134396664666139303766223b733a33323a226563303463356639333035323436363830393530333363633163343636623633223b733a33323a223263633132663132626239663565633061316661666232663030353163326136223b733a33323a223233313465353865346130363861306563626163623130356461383738376464223b733a33323a223739613738303933326165343961393732356230313736363937333930323634223b733a33323a223066316239373636396666363135316635666332363037386664323530613137223b733a33323a226465633235633139613530366137623736346363636537376535323131626364223b733a33323a226234313238313632326361666531616264393134363964336263373063633961223b733a33323a223961393731336439333138613034333564303935383465636635363137386132223b733a33323a223932663332636665303532636365646262656333393666386330363365613364223b733a33323a223765316139343239666439653535313065323065656332386235383734393037223b733a33323a223865626466356339366334366665663766333831333562623563323865393764223b733a33323a223237336237333263386233313266353637646466366261623134653137386234223b733a33323a223563343338646638663637333763343839663236663833613638393630376634223b733a33323a223262396136633032633935353735323838333438656332613936626166376530223b733a33323a223533633064343366613266333639623638306437613761356437666466323230223b733a33323a223662616139623338356264633366653033613463306638643131306531373464223b733a33323a226364303166383433366636396234666535643833316433313730316430653835223b733a33323a223261363037666331613138616235626161646131363131626636393461376535223b733a33323a226130633736663262666237313238306137303335643137356165663034343735223b733a33323a223830623639353063303864336332383432613566356235643834356161613637223b733a33323a223936373962623865646166303831663964343165323730396561356637373137223b733a33323a223433343163613531333936363737303636613566623563336261646438306432223b733a33323a223231646238373935616330633930626265636233643066353236356539383930223b733a33323a223131316237363265376631386264343231326137633730353062323330633961223b733a33323a223062363031323230376165656137386437633638313531623564376366323564223b733a33323a226434393530303362663539656264356331356232383065396536313335323738223b733a33323a223239613535363033336433376464343036363931666438373665646230383534223b733a33323a223434353139343363663038653664333031306363376436396435636364396136223b733a33323a226535643161623166656465663839353239306365343863636439376665306530223b733a33323a226261333039643361623933323536653538626366333438666463373265633861223b733a33323a223336636362373038323034353830616163353738653761356336623665376539223b733a33323a223761663539363865383533343466363464643333313434363630303933633530223b733a33323a223264323539653135613237333432313864363166346161633261633861383964223b733a33323a223135363466373762373631626138636430323130646237356130376463393765223b733a33323a223266353762653065333132626464666263306536333366376330383935386434223b733a33323a223266633038653965623636353865336665366463343732323735386234393439223b733a33323a223134346230623834363431663139353137373961363033366439643262303762223b733a33323a226565323033383537653063616135306163633337646637656632633037653537223b733a33323a226236396262613264366535663465613965656136396637306234393434316661223b733a33323a223063363037303337383834636163663536613938333130366336613531363932223b733a33323a223961653837353033653430633839313465336266366434306464313732643861223b733a33323a223232366337326563353735363235633161663562646237373939303734346130223b733a33323a223638306337623264386239313436343564363938636436626531376636653832223b733a33323a223632313035313432623234356339313762346635336532643135356563643865223b733a33323a223738323936323537366530623465626138303437623335313164353933613235223b733a33323a223264333435666439363038383935663732313538643230613039303735376338223b733a33323a223232653037613336373562386138303065333161373336323664623031633031223b733a33323a223264323932613832666363663337346437633838363061316564373066613261223b733a33323a223939323964366437383062666463633463303131363362666238633562366330223b733a33323a223231323336666430393663306532396264353365356161323037313330343533223b733a33323a223861636134323138643139626462323233376339356439353732386439303666223b733a33323a226661366662663930323239313661663039666430643231656362636561336531223b733a33323a226261626437376230626230356263336663326431326263666230333939656166223b733a33323a223234636432316535323134316331356232636361656638313763653064626331223b733a33323a223234656539326465396365613334643963303534633639373338623634393166223b733a33323a223430616530313532336536623062393662383632383935333563353330653330223b733a33323a223334663336333166313830333063373534613137313836643365663336393563223b733a33323a223235326366363661636130363139626239616663326336316338383166306462223b733a33323a223062653539356633363236326537653262626664666562653065343632343130223b733a33323a223663393064303237613665646664626437653932356161303231663735346366223b733a33323a226133666530613731353162623066643835656336343932353039346531633332223b733a33323a223731363932313231306331383630323930396236323663393036666336306435223b733a33323a226133333437613061356633383561386530623764346263393666316638316536223b733a33323a223432353563383037336137626134633165643834323133613462313738386363223b733a33323a223162383630363830366365396333313934616333613465356336343231343964223b733a33323a223261373436643632366261343563356539643564303364316634633565323831223b733a33323a226637623837363235663630643334343663333538303765336339333461646439223b733a33323a223166663139623865633832613464323837656563383937373432646231316165223b733a33323a226432306665316238613661353661303734353736396563336133663936303961223b733a33323a223163616632313662366431653037656139373231356430633136623263376532223b733a33323a226362366466666331366332313466313962396566396661363533643036663330223b733a33323a223932616331316431323166333739333236373463383934643063656239343863223b733a33323a223763316366633637623165613334303030346539396463376161656432326535223b733a33323a223761646565623161306330386330623439306162373439653139376433623964223b733a33323a223634656361643237663136656230363864633163633165376634356164303635223b733a33323a226266343430313938383939356335333039653633653966626232376465633732223b733a33323a226665383163646637393764373062316236373964303037333566303832386431223b733a33323a223762646566303665353935343438306361326236633866356133613466666665223b733a33323a226665373938346362666532353465303662386362353464623036383435326431223b733a33323a226139643665666664663436393865363034353335396332663635366434623962223b733a33323a226663303562666438376137313865613832656135383062323835326132346135223b733a33323a226362623431303033626336393231663336303739616261306634633562333162223b733a33323a223536363163633434356330666232333537313535396339636366333234613536223b733a33323a223530623839376366373861636131636464383935643436326638303263663862223b733a33323a223962363236383933623738336333613331326239313565633836333235393761223b733a33323a226231343064393534326362333932396531316364303937653439313765303764223b733a33323a223762396461346236326264643731623032323832643030666365623863643831223b733a33323a223962636139323439356664633034633534356566303063623738383437626332223b733a33323a223263643637393566613437366430353330316631393334643765663834666136223b733a33323a223234333032616539303036326161343833316633623830653133373935303966223b733a33323a223931646165333264313738613666613133643531646263366466333431393034223b733a33323a223430353833666333633764633764346363636333643237383531333233623865223b733a33323a226338623138653763616636393230613261643138346264353633656134633734223b733a33323a226539343432316464663536313262393230623861376234623764393063393765223b733a33323a223461646264666362386439356131343039306330313635316639303263663036223b733a33323a226337383231643465643234343836646139316563663937643037323633396433223b7d733a343a2268617368223b733a36353a2263373832316434656432343438366461393165636639376430373236333964332d3461646264666362386439356131343039306330313635316639303263663036223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223530306166616539393763323835633536653531663031666435316362306264223b733a33323a226135316437623262306137393262303030343364643761623866333364393663223b733a33323a223433313131616364636434613163633135646564393236646338353133393635223b733a33323a223961353065336135613863393330373835623061386661393737373435313234223b733a33323a223832323765613633663666396431643164633863306332653831653135663833223b733a33323a223338623432653737623237386532623434313861616336623866613764666165223b733a33323a223531303662613465346265666232313130373065663033653732336632383433223b733a33323a226638356138376264336233623332656133383262633932373863333934643730223b733a33323a223834633565343865303565646139383632313833366132633561313739316235223b733a33323a223138623634376532356561636232313362656239616630363164333562633263223b733a33323a223634656262623466636636633761633764326430383031366230653261663462223b733a33323a223934393130383131623236623664386634353430623834646365336165366565223b733a33323a226466393165373633623562393034353864363964616261353161613930353437223b733a33323a226335323436653130633135336630343939326138626138623534613630633961223b733a33323a226662346631616432346631376330666431313438323731363334653365633631223b733a33323a223764636634666433623632663935396638336231376362326437333063326335223b733a33323a223635323533316362373032326566633630333863313632383235326334326661223b733a33323a226566633463646435353262653535613938383466333930336364336133393961223b733a33323a223362393966643638303461613663363262333532303636626466666438323965223b733a33323a223465316435313761656133633233313731386231666136663834646562326361223b733a33323a223537343061616334326130323061343161646133343436316461376239653137223b733a33323a223634653731656436323936383530353137316536323235393536363733366232223b7d733a343a2268617368223b733a36353a2236346537316564363239363835303531373165363232353935363637333662322d3537343061616334326130323061343161646133343436316461376239653137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730056419);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('6e3psb0n5vne4j42e07soahb5t', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303638363439312e3638393834393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227672646630656a71766373756e7469356d627572766634347468223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303732303638373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303732393134313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303732393037313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303732373536323b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303732363735303b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223631653739663238316465306332383862366636633961336266353965643363223b733a33323a223439366632373462633631356135363362376136653636313233623163343238223b7d733a343a2268617368223b733a36353a2234393666323734626336313561353633623761366536363132336231633432382d3631653739663238316465306332383862366636633961336266353965643363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a37303a7b733a33323a223364653732326437396562616362363335383239376230343433393764323561223b733a33323a223537383630383335366233323433323137323733326439316665626230363232223b733a33323a223432363030636633616131323564306531383766366363653839303538613664223b733a33323a226532393363623063303133663930353630313932663934363939373463663764223b733a33323a226134626364636462383733643465623033376163653165323632333032356237223b733a33323a226262363564396662653863666564326564656363366433336637666535646634223b733a33323a226132333361623432396364373533353033396566393136393961313735376361223b733a33323a226137383432386530373163663864393230346563346233393763333533376437223b733a33323a223766613132346535636639323165363938343932383865626239316232616233223b733a33323a226236353431663261343961383238376461353164336362366661656139663737223b733a33323a223532303438626635333537666434613863343531393737643638666234336533223b733a33323a223534303734643238653962336336343035346566303464353765666138373862223b733a33323a223934386339363134623435383864656339393432643332323733353963393165223b733a33323a226435666137613963336531613138343463366561383965393230373464623263223b733a33323a226131386130616138623661373034623339353837383638613234653964393864223b733a33323a223838633064653630643062313735343466663734343836663132613661366662223b733a33323a223037336539396135356439333637323032336333353765633265323832613633223b733a33323a223739666237613438646631343335623439626237663963366262366163616662223b733a33323a223965396262643332336666623839636437663836343966643564663038656633223b733a33323a223339316337386564636562383763643131613335383861343534396437303536223b733a33323a226638343035656239353764313865366339313133346564353837353634376632223b733a33323a223733613434396462633339613732643832386537646336383362386433346638223b733a33323a223230376135616534653138393061316565643631626436383065303063393530223b733a33323a223730633136313864643838613838363564343531653236373065363732666234223b733a33323a223261373030633061356133636164383233393137633431666136396130343139223b733a33323a223738333633626530313636303162363237643764353038663431373561373336223b733a33323a226232313032613737613835383634356263623261333665303337303530323136223b733a33323a223361646264373630393662306233396362323736336465626464653832316132223b733a33323a223562616363633765656562393662383136313035643135306662386637313434223b733a33323a226636353934646665653263366365356465373031393434383132353966343230223b733a33323a226139306566396538383839623736383766643931616664336630393563353735223b733a33323a223866653439356138393661356332336463326137333430663461323138356164223b733a33323a223566373131303262346266326262653533316134343130643737353565326331223b733a33323a223032653933646362313930613936346239363162646332313832313339666238223b733a33323a223164393262366566613366633430633131303564656132633263346661623131223b733a33323a226137316337383666353434356561616534363337623937393162313864623533223b733a33323a223437313639356238633633623436383035646165646239636334343334656536223b733a33323a223631626535376564653339366538333132323162643563666137653838363666223b733a33323a223737396365393363363333323338643832343133383030363530346164623662223b733a33323a223634633563353237396563316631363333666261636235616334643937323265223b733a33323a223034616662396661626265633161313734363664633366396430663061363638223b733a33323a223633353735346534356535343032303532363766616361356530373335656265223b733a33323a223063373962363132343966663330333131623636363135323634373034356532223b733a33323a223361663463366538393863343131393239613235363733666264663239616563223b733a33323a226430346234643261356164613130633235356664626231396530373130383436223b733a33323a223663326237646236376165303466376638376162323432626138623731333161223b733a33323a223364326437633635656262386231626463333534343862303535303935393331223b733a33323a226335323533316362366234303038376266323838616130383537633161386333223b733a33323a223538316666366537623932396139336335646230633038326366323631356464223b733a33323a223336323632323963653235626634376234623533383730303039663030303637223b733a33323a226635356361653332313135366636376637306634396434356238306432376435223b733a33323a223163633530353461643532333838643335623430353731393038373939616539223b733a33323a226433623333333534646139623461623362356230343164313531333363343836223b733a33323a223337393439613562393831643731363266623866343462316430356130393733223b733a33323a223032613239626637663534633934663762636230356432356163616436633331223b733a33323a226565373432653564363233316235633961326636336336653035396465313530223b733a33323a226431353261643863386138643833663838666237303530323436616165333932223b733a33323a223334333038306564663337303831306461363566383062336163363265613434223b733a33323a223137666339383034613863623162393937326133663439306562306234346531223b733a33323a223663306433326439636539653331373766323233396339306365353164386231223b733a33323a223730323136326661383561386535663931346136616331386632623362636431223b733a33323a223037333632623061396535373163313337363535353230616130386232316535223b733a33323a223464613330666434353463333132633530343830633564623734326164323332223b733a33323a223465643161333736353833643433623936393662356166663030376336626366223b733a33323a223733653138663366363461343237646536356362366133353262303238386135223b733a33323a223732396338323932383034633335353937653564656436356236376161346561223b733a33323a223332373161316439356534363932656637303737366639306335653461313836223b733a33323a223666613230613062356365333632336536313234646630633636346537646463223b733a33323a223764383539333534336262386165643063306631653936373535303837373365223b733a33323a223665366436613332386662303666356361393530373639656363656262653464223b733a33323a223932313565383362306238303464633764386233643734643336326136326338223b733a33323a226463363435643537653534343930656138636362373135656633376639646432223b733a33323a226139653735646363316664393433646336643030636230303663316231646665223b733a33323a223935653563346361393532663465316338376430363638376662386564633134223b733a33323a226135323066653332303237383562346365313633303839346136326431666238223b733a33323a226264643063646366643437656139333434643362383937356632643030306136223b733a33323a226135666332613632366563613238386131633362356538633131643534386432223b733a33323a223435306334356631653137613133646336323964376465633164646362356433223b733a33323a226332393233636439363735613035343537653466613863613166306138626462223b733a33323a223233313532306461343039353765393930613238666331383865656365643763223b733a33323a226430393738376465613133636165326366396233366638323462353431336139223b733a33323a226230613635313231363736343130663738393837613830323539636333346339223b733a33323a223536333662353766363961383538376635363437336334613266353039346466223b733a33323a226237323861623738336364353736303835303232363963333539663963613066223b733a33323a226565303261323364643661643963663265363531373732323234613534616332223b733a33323a223662636339633639303834353561373232316530613437316266383130396638223b733a33323a223131343933353834666438633739626461353234643166333631383536366461223b733a33323a223730353334306461336539383063613163663735386432396634326663376434223b733a33323a223230626436616337373631616464336262366232396531386130363231663266223b733a33323a226531656361386537616237323234643163353836343330646333653637373632223b733a33323a223563616635656234366638633536363064323435303937376134613766373037223b733a33323a226366663935363932623932383933383430313830633761356234303632303939223b733a33323a223562336530613566316236393363313537326364643961363039373937306634223b733a33323a223035326438323531363532653463373132386262656464663330313466333632223b733a33323a223236323962333961643537396662353531656166646133616162636436353665223b733a33323a226132393662316463376438373166323532386537633935386463643434353764223b733a33323a226537313939313763643766353238373531363065643461623635326332663938223b733a33323a223737373435653661633936646366383965623439363032343561653139626138223b733a33323a223931333031366533386539366331646566353261336661333436663066373431223b733a33323a226130643738626662633530386533663435666661633430643963356662396263223b733a33323a226162666433626537656563373731303038363861303266383536633561393134223b733a33323a226461636434383766393631366561336466666335626261613239393632333734223b733a33323a226632383235323462363335326636353236616565646232343737656636386662223b733a33323a226630663132366666666237653664663037326230636331393839376230326438223b733a33323a226639376263653061356362663666393163313330326138323732353630626566223b733a33323a223164316566383237373566633935323233633366383731333738363234616466223b733a33323a223934636562363830633532373534626632316564623063333663373132316332223b733a33323a223136343534363063333837343564636335373730326233343431323138633363223b733a33323a223437306165313431386338383734636265346162616538623833376631663533223b733a33323a223632626262646561633836666666646664626265373536653734623563316636223b733a33323a223762613431393161326430343963653938336466623266343038663461643339223b733a33323a223831356232363765343432613632353036613332316161313565353635643933223b733a33323a226134643838303239386334666561313437623436663039303966646135393132223b733a33323a223233633265386661343739353838323832373534363835313863373566653334223b733a33323a223664346534363933633965653561623730383062663062626163326139303864223b733a33323a223061303233636333646362386438653965343663333237393565326366336539223b733a33323a223864646233303934303135373733363662663263333265393733333935666138223b733a33323a226633313632633939653766336239333362613366326363333165356136303463223b733a33323a226637303264356237356265333337633465633333326365653861383937626632223b733a33323a226364616664633834313336366363386636316661376538326438386461333632223b733a33323a223765356332633661646532343133316362396465386333633062373966323864223b733a33323a223135336663633833306562373039306362366631343434313839646131613266223b733a33323a223139396537376638363365323634666336373230333863643465373235386636223b733a33323a223539623239633935373163633634326634623861346166633738343362363032223b733a33323a223735333135323264306634326339613065636461643466363139393062616237223b733a33323a223436626537306437343739666432326539616632626337626331353864373134223b733a33323a226337626234616332343933633335396165653336383065636338313164353339223b733a33323a223835306336393132343261366561346530353762353666333735323531333064223b733a33323a226666643730306162643536363664343362613033346434393231633833323134223b733a33323a226434363061616466373535363038363039666132636632616566643333373965223b733a33323a223238336438313639636231373663643635613864646533363134376636663161223b733a33323a223330623665643966663233643661653337323431303666353266306233633636223b733a33323a226161623831343065363766353565383437323635326439613433306134656532223b733a33323a226165363834663534666535336237623565653832396565636339363338396331223b733a33323a223234663033633062613334663131336532656131393731303938363431393131223b733a33323a226132666139366536316134303333393037396431376131313037613030393264223b733a33323a223935643339623963623266656465383236346462363563663066613430626237223b733a33323a226363383738333332346138313262386662376337663863643661656134346332223b733a33323a226464376364663064663938633436343938626438313264353532613965343233223b733a33323a226464393436666563366465393739653831313438323735613563613565313432223b7d733a343a2268617368223b733a36353a2264643934366665633664653937396538313134383237356135636135653134322d6464376364663064663938633436343938626438313264353532613965343233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223639383963396663333938343766663433343532656537373335663862653263223b733a33323a223138366530376362373437616437363239333032363763643664666533626166223b733a33323a223431356138633830353637313431373336653137333132663235353936333162223b733a33323a223861643634306365663661336638653131383366396436346339343937323634223b733a33323a223030376232343538356434386534376133616561353731663338653230343839223b733a33323a223137316536333462313035376261363039643230316332316430313939373861223b733a33323a223061366366643965633763663137643664333238343838663533316266613063223b733a33323a226238626530636338383137626539356231393464366666643337333030313832223b733a33323a223063346662643435323735373138323862343736306365613736663838336432223b733a33323a226635316636636462653239303736356363336337323465393164313862653832223b733a33323a223631396236343533396262626438333836623931376436323764376536303237223b733a33323a226339653637386334313838396531373465393532346364323261336362323531223b733a33323a223936613435616166323237366165636335356664623236313561303930653735223b733a33323a223632303837373833633563653264636335656335353035363763353834363764223b733a33323a223061383735646531356336356637313461643331373334393132333634663638223b733a33323a223865633039653964623934393635303163323132353039646264656332333937223b733a33323a223031393765313936333039383036653066653161393965363037333137653935223b733a33323a223261663038326333336464303031643863646266646666643337333232623939223b733a33323a226536653136346261613639376430663336316162613936376466326232333262223b733a33323a223232306431393632333934353033646662643835623437376236373231663436223b733a33323a226432336161313033323539663165313566383237366164646138306331663134223b733a33323a223735373865666639303530356533623433353938343537323434663236646335223b733a33323a226534653765663362643964386464663539313835346464646465303434623262223b733a33323a223437636534316234333336646138313632336137346135643263353030323261223b733a33323a223131656234376262663561353436653561386438393636633039383234613839223b733a33323a223239323939643065613462373164353934636131396130623562343839396437223b733a33323a226261373836646263623334393533316263343339633464343539383732346438223b733a33323a226230663339316534633731353165616166623332656666396262323730346165223b733a33323a226331623638383138353831653730383765646665653337386632383133636265223b733a33323a223830343562663961383233323538393765383237666263376436623661373139223b733a33323a223137376663373933396538393239386134663133383562623864316532623538223b733a33323a223738636635353138346261336233343964366237613338356366643238363930223b733a33323a226464636432323139316431646538626162383832316635663063666133396532223b733a33323a223339303563326237363664393836336635363534666638383430333934323563223b7d733a343a2268617368223b733a36353a2233393035633262373636643938363366353635346666383834303339343235632d6464636432323139316431646538626162383832316635663063666133396532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31373a7b733a33323a223930656632373034303230346261623638643666383765313232626536343437223b733a33323a223037323234653438623465393932656238303832343566343635313262383231223b733a33323a226465643863646331323830643639666339383164643737326236616337626363223b733a33323a226665653438646665633264366163653034656665633131643262346566393966223b733a33323a223166356538653234356365356466383862366132303563316136643233316261223b733a33323a223663336137666338383562353838343966326630343635323666656366383062223b733a33323a226332633436643533656461353333633433363863656562303236373136306332223b733a33323a226264626366626535326533626539323961393563376163346635386335353838223b733a33323a223661343238373662343731333635303039386562333936353132353961346532223b733a33323a223438646236333531333839653163356236636232653832653637623036636438223b733a33323a223665333631636139356161633762376561333261313836366561373964393837223b733a33323a223739396238373431303862613665323564373761663361666337666164383730223b733a33323a226534663164336663346134363736323364326436396265393332376666336565223b733a33323a226231383963613134646136333366333665613433653865616333623039653466223b733a33323a226631613262643338653562313332393437356632623632383439633739323564223b733a33323a226463373233653634346365333461306536623261613164663564616538383636223b733a33323a226330363965396263663935636134353933323333363563643964336136383065223b733a33323a223631376138383330646164373238663539643764363236636437303935366438223b733a33323a223631633131353331383335616463373561363539626134333139636666356232223b733a33323a226665373864656133646633623636363336353031373063383964363939663331223b733a33323a226539306439613435626633306361653831356666623563323934653663663265223b733a33323a223065613337393463343531393761353239383664363136383036663531393263223b733a33323a223337626166613936383437646136623063396633666230663463633364646230223b733a33323a226663336661386136316165336236363964643333366237656361393438346335223b733a33323a226438326662373235343833646334616235343061346336623733333533646630223b733a33323a226630623730386166633931366131306433316164623930303439336533366439223b733a33323a223434613438376234396364333666623135383964626161343861363633396434223b733a33323a226236373839633262633837323236636136666131343266663264356539666138223b733a33323a223662653633643864663633326239333038396666343638346264313334326630223b733a33323a223130656462376362366336393138633734653263643538356432663465303562223b733a33323a223437343739333166343361356466643362623763616330343766626535323064223b733a33323a223430613663373866373436613535663361626438646335386463356232323338223b733a33323a223235363361666334376136333137623261626561323839663935666332353964223b733a33323a226664643831666461396664656136626539653234363934666233666235633561223b7d733a343a2268617368223b733a36353a2266646438316664613966646561366265396532343639346662336662356335612d3235363361666334376136333137623261626561323839663935666332353964223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223537393233386130396465316335303533656338393666636363653566663532223b733a33323a223632396631643238653536666538303534636239393462393961393435393636223b7d733a343a2268617368223b733a36353a2236323966316432386535366665383035346362393934623939613934353936362d3537393233386130396465316335303533656338393666636363653566663532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730686491),
('98ote93ag92ov6u2dtre6cjs1n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383934313534302e3734393837353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2239386f74653933616739326f763675326474726536636a73316e223b7d7d, 1728941545),
('a81oriu88t26j5qfkah0iuduco', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323532353837362e3039383731393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226839356b6b706e3575696f7276397232326f6f6f636938766b6e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536323130383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323536393035393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536393032303b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223234663337396562303635633038316636323936303766653666616538636233223b733a33323a223730303466356238623034646366386331626661646365653932636233343038223b7d733a343a2268617368223b733a36353a2237303034663562386230346463663863316266616463656539326362333430382d3234663337396562303635633038316636323936303766653666616538636233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223730323661366239626237326663333432663361343436373461363632626539223b733a33323a226162653562653031366239623538336132623962306630373364626566303666223b733a33323a226138663864346439383033626432356131393138653238303534653466386464223b733a33323a223436333735353838666565336334643137373562626266656338306130383737223b733a33323a223237373865633632363164373631323566373037336439333161323438316536223b733a33323a223061383237346563383932656432346635316232653462636538663135373962223b733a33323a226464666139663538373432323832386531663233353364643166313933303165223b733a33323a223137633338366365353936633231396138393765306231343661656131666439223b733a33323a223862666633306635656562313935346430383964303234373033633736303636223b733a33323a223231396438646165646265386661326239353134313832643833353436333861223b733a33323a223334333038313564396330636665663939323034363965656236323232326131223b733a33323a223431633532353633633162646262383732373362353735396263343036613534223b733a33323a223336366235663836396565323164383664613336366636663263396436323335223b733a33323a223063353730346633393066666135383466373065383634386135373039383238223b733a33323a223062623964313838666432336238636233636438316537356639336633616139223b733a33323a223861396165373632363463343439333930363665303463303866346335663130223b733a33323a223966613535336133656637336438663633313239653865363261363137616535223b733a33323a226262396633643833316232353535646366303964333162333033383634646561223b733a33323a226136613632383731353665303539373232333435346232636333343662356361223b733a33323a223635356166326465373165333934633665643238626564383164383936613262223b733a33323a226265616536336233306538316666636230643231663130393739646262306364223b733a33323a223665343966343038613766633539613037373233633537333962633962636532223b733a33323a223530353964623061623735656232306435613263323833313033323263313266223b733a33323a223136646137336364323763623164346231343165313332313335386130633638223b733a33323a226137653033396634653964363439326465396166366234653130396438383133223b733a33323a226266373536303032373262353364303864353032343065633265333634666438223b733a33323a223162303230303065306130613161626166663637626535646234396636306231223b733a33323a223530373936666233353961633063633237343238356535363335363135306166223b733a33323a226538323763326539313561353636306364643834666462663863346664643632223b733a33323a223032303939336430346431336534666239326130613130623463353539353930223b733a33323a226531316534313235666639643138636561353461323263613730383365366163223b733a33323a226539343937303665303965393238316130653533343430643033663333613736223b7d733a343a2268617368223b733a36353a2265393439373036653039653932383161306535333434306430336633336137362d6531316534313235666639643138636561353461323263613730383365366163223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223565333366666237363530313234386166333264616532633366333639353164223b733a33323a223130323230653861366562346166633965616165313065356165383935626130223b733a33323a226432303835303630303435353731626133306266373237633963636136653032223b733a33323a226434663562623130393763333839363666663365656562306264356433653730223b733a33323a226138613934653862393839663738616132613361313130323037623363313833223b733a33323a226466356333656266663466356233613436306361323436663132623437393264223b733a33323a226338323335373930643235356337643539623939613261643561643939643238223b733a33323a223134303434633132613163313037366135373533626534646662373733633838223b733a33323a223839666535343233326261656531643637336230343139313336613830373739223b733a33323a223130643330396335303463343531653637346638623734303431316636363737223b733a33323a226538316435343931343437383939613835643262616130366366363861383833223b733a33323a226538616532666465646436313434653732383561363436643964386636303164223b733a33323a226236613561643836663233316137666461663537393461343537636365643331223b733a33323a223065646131393663316338333130386466346363396461633363306166333535223b733a33323a226465383538393838643465313235326234653330363337326230633266643436223b733a33323a223562313464313038626536383832316636626164643066306233633130646165223b733a33323a223732656433396534346235316630396336663831353636346634613534666462223b733a33323a223935616465633030646139663962396438383330633339613965313530613130223b733a33323a223134383534633733383638663739306663336438303234626466343237336431223b733a33323a223266663137316535306632303832306363393631316239616233326238373334223b7d733a343a2268617368223b733a36353a2232666631373165353066323038323063633936313162396162333262383733342d3134383534633733383638663739306663336438303234626466343237336431223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732525876);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('camfaihisa7m0vc616cbekgrhc', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393237323239392e3435383732313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306136306334677071303465376265373537763631346a636670223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393330393431363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732393331353237383b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393331353134303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393331353439393b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223037623563626161396432303234663336353430383838396239623265333738223b733a33323a226330623464303163373031396236653030356438633561363530636330383738223b7d733a343a2268617368223b733a36353a2263306234643031633730313962366530303564386335613635306363303837382d3037623563626161396432303234663336353430383838396239623265333738223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223262326233363338383537343731376133326465646262363638623835386162223b733a33323a226635366665613034373464623234626633303639336630356464396432343335223b733a33323a226633653631313736643433663561656130333636333166366535646234303530223b733a33323a226365396264376261653535646666656364653533396334643231613366613762223b733a33323a223933316464303961633234396131356263383837643962303065646663333339223b733a33323a223937373931343335353366356266303738363163613339656535633662393939223b733a33323a223461336464626631663530373835393834316438386130656430386334623963223b733a33323a223566363337316136386231363038313462343039353763366436386330383035223b733a33323a226236383134366538323232383031376665643030386631623434313730323438223b733a33323a226163633539373266323634313831336230623963326530313465313736633265223b733a33323a226263306635623239356531393562613365393766366630373262663030636635223b733a33323a226331663866336635633766306164363733656337653330623630366538316430223b733a33323a223332633664343838376131616462616361396532393864653233626533366438223b733a33323a226362636231333730323834356233373765353166663430646164343564613633223b733a33323a223936666535356566653138313961333365333132323861653739376436653230223b733a33323a226661383134306535613665303063373765343637383161383063313135336164223b733a33323a223338353136346133353063326636636337323431306564396135323630366461223b733a33323a223936323566623265613664303232363436666631333539663337636435643831223b733a33323a223735653334613065393930633132306563363766343266393839363164653863223b733a33323a226637626336336533383563356635366539363932306533303564356361663262223b733a33323a223165633231353563623834373134326263353530653632353966663562336664223b733a33323a223436613030333330663666383037393935643930626161313765623636316339223b733a33323a223034373064656634626438643939396335633032316234383464613734346339223b733a33323a223635323932346335363535303436616331313933646238643734643136636339223b7d733a343a2268617368223b733a36353a2236353239323463353635353034366163313139336462386437346431366363392d3034373064656634626438643939396335633032316234383464613734346339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226335363164313930333262663838623836356431343939643831636437633934223b733a33323a223366626536636163313930373532333236303133366235383135306236336334223b733a33323a223532323765643632626135643531336438306131353736326236353330643235223b733a33323a223166326537663537623564653533636662643361356131653533376331333664223b733a33323a226431646339363066646663393030336530346635643664633730646162643036223b733a33323a223739353464363666353864636333343161656336653263386134373664373532223b733a33323a226334386434316536343434333337643465376637643832326431353533363966223b733a33323a226531383662373038623337366666323465353131323061646366333464396434223b7d733a343a2268617368223b733a36353a2265313836623730386233373666663234653531313230616463663334643964342d6334386434316536343434333337643465376637643832326431353533363966223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36303a7b733a33323a223037356366656230306134623732393835366132303866636432333934343132223b733a33323a223638356137653433393165626434646433346464336535323065343636653661223b733a33323a223266383661323963326636333435663637366464363631616465336630353632223b733a33323a223231373035326136636439653164353930633831353334386261663363346639223b733a33323a223730303033626535393533633438396366303462386338343364663230636164223b733a33323a223961353831643438636539326238316664623039653062613232316661323330223b733a33323a223861376163643537366335363933366338663937386466366663316233393131223b733a33323a226435356238306132353662303162373534396337653839376236373039353732223b733a33323a223962656236303938646361663962643637323062393538303963393331316333223b733a33323a226536623430333734343038393165323035373662376264393835363639633234223b733a33323a223035386138643939653462626433626138353339663166316332393062303635223b733a33323a223165393934393062336139636164353530653836303637393331306137353164223b733a33323a226431396538636536613237616332383265316439366131643734376539643534223b733a33323a223938616666613663333066613562663332393665373533373633323335666133223b733a33323a226332663965386330306165623637383565353566366566373336303834353464223b733a33323a223764313735666631303866613563363962323833383136636333396165313536223b733a33323a223030643639363561333962616230383564613231326130653033376563396131223b733a33323a223231303833393631656166643934353663383333666136343864353738346533223b733a33323a226138653834303038643963656164393132366137643165646563663039363265223b733a33323a223661613635383838303934666662643664613166393461616130396132303763223b733a33323a223465366636343830343365393832363330333266383130663137363262303962223b733a33323a226332336634386164333834333361656565653235646666326132386233383465223b733a33323a223432313363656366633163326461373133653633393462386630343936386536223b733a33323a226666313561346538646536366131323530396662366538316532643864656134223b733a33323a223965613334373535393939326637353963356462663139356139663533626531223b733a33323a226131343837636631633164653037653162356336643462363566613031643261223b733a33323a223165373837383764343339323931656234323035386132323466316439303932223b733a33323a223365386439633236333732313233316462373264333937383334393631393038223b733a33323a223435663839613034666636626364323166326462396263383265383337366434223b733a33323a226364313531386137623362653062386537303234636434343236336139616139223b733a33323a223737336365353162333234633130656535623134343435303237613566396130223b733a33323a223264356431313463623430643536613464656639646665656237663930633735223b733a33323a223265646531633337313130333136363031313433666265393437343732656130223b733a33323a223464643734356130613731656537356538333931303861636133303839303839223b733a33323a226636303766376631386264623335666261636238363331386165346462376162223b733a33323a226435353935623864613738386635366466613364613362393739346464643538223b733a33323a226566643636643534613431393631376534376364363831303365326133643133223b733a33323a226238636235313434363265353665343662653063376162653361353732316666223b733a33323a226338333333363332333534666562376264663436623836316238643039383664223b733a33323a223839653961313430373636336131656631636531613764323939666237643065223b733a33323a223066623632623366383735663361373334383538613733666264643633343062223b733a33323a226133643738323566303133653631333265623866663335393538656534653765223b733a33323a223736653935376262663832376437366634306135623265616161383166636131223b733a33323a223563633032636661366565303333623436636539373332356138323630303631223b733a33323a223363646366396663363130343831353233643038663665373663633066656438223b733a33323a223439373565663230393535336433356232373839373863383861323739323333223b733a33323a223066666330613662346362636461343566626332623933646631356135373238223b733a33323a226461326430653338313030383333353136643964636464386165633734333065223b733a33323a226231636163373238396565373261336362376636656131313037663737663362223b733a33323a223730353238323766643832333532626235323965336338666135323164326632223b733a33323a226165653439343162663131366561326562343063633933303964306439313134223b733a33323a226432616364306535656636613565356362656266326666343565656130373734223b733a33323a223663646132383566356430376165323333656238303731393936313663346638223b733a33323a226463356464656562353639356130323637623332623266623865343564653663223b733a33323a226230613636633537336164656538336261316430623765666239303235333262223b733a33323a223331323262613263666561346337633832356637633063636632313366333561223b733a33323a226564343833663935373932323162646437313433313062653832313066393438223b733a33323a226130376564323066616164356365393165316664313064313261656133316565223b733a33323a226364316666346535373532323036623136383962313930663862306131306438223b733a33323a223430386464666635353138353963313030373530656631656533383664613864223b733a33323a226466633363643761313432613663613835376231373630386163616466383139223b733a33323a226264346538313334323632646333363532306339323034316433616531323164223b733a33323a223265326431353361343432306462646263363163396632333039626165333532223b733a33323a226339656136346430663236656231386630346636393332656465336436653739223b733a33323a223666663835376564353134613562636238626235323135366462366639616666223b733a33323a223331633034313034343835323137653039336566613530393461396136343535223b733a33323a223234313038343766616134303661633163663539376562633235646633383937223b733a33323a223062623434393334643332633530313135363639316663336139363464363635223b733a33323a226665333132323432306537303132333766373865613566666339303037663663223b733a33323a223434656632373836373038356165643731646363643562326433333064306536223b733a33323a223031363634313737346266396561363665343337613264346364613835336436223b733a33323a223263323962353666633564303739663039303236633161636437386636386461223b733a33323a226264646562616262336436623830343833333563303065383466613434636662223b733a33323a223836363236653438663762303539356233656234363833636239386538613366223b733a33323a223663336166666335363735306132343334323636303031666562373264623165223b733a33323a223631396435613834313463636234663762653932353131326264323632666262223b733a33323a226336663663396462343264363139316432313462643861363032643030623632223b733a33323a223039336161616162323037306363323961636463386138303839343666626161223b733a33323a226263666138393135313366643863343336383034623631656333366563313162223b733a33323a223335323865323038333539643464626661613035396333373938343066326239223b733a33323a223737366263643337323435643665343161323165646531393331343330303037223b733a33323a226235613061323466633765633632646636646461333065343836343866316332223b733a33323a223334393363313134656339386130366137363630346266613466316465393531223b733a33323a226264306135303632633134653366363264363733366663393234643438393762223b733a33323a223932333063383435386236363265626461346630346332386666663038386463223b733a33323a226336383461333035363562623766663830353231343438303331313830646333223b733a33323a223837303636613636626131666635623166313963396464306465666433333966223b733a33323a223931326564376230643537346137363133363935653762316130373663643064223b733a33323a223133643336663461626564313636613335346539326133653233666163653036223b733a33323a223765346162613133383763313235613032326135366339643635343737663464223b733a33323a226337323236396564323635646432306565633530643061646133633631613832223b733a33323a226234353765353561373761383432633738363738376632613166363861333663223b733a33323a226366653030643339366533663163623663633264656634346335656466373239223b733a33323a223662393432633137623961396233623266613464336135663865336162366231223b733a33323a223031313639626466663338373934663038636432383532646532316265396635223b733a33323a226662373939333836653935663635326337626464353633353134336639363833223b733a33323a226663303465356462343634366230626564306632333232656661626162366634223b733a33323a226139376364343366633364383833396635386431636534646437653935383466223b733a33323a226265386437383230376638653762303965643434626166323332376162616630223b733a33323a223565656438343938633732393937663563633737346637626537343932363930223b733a33323a223666313037316463623333333034373331343731363133653134383434366364223b733a33323a226565653839333032386665366364353332646261396530613864373734316665223b733a33323a223735653039363131616464386536653433383232386364376331666363306638223b733a33323a223865313730333633663165653131633330346662646432386135633634393536223b733a33323a223333633062336537633932666336306436376662393837316233333230306331223b733a33323a223336396332623132663435373062316631663962626232383766643433616530223b733a33323a226562373534343238396432626636366231373166393966326436646236653062223b733a33323a226636323336323165623863336533313536313937366239383731323564386166223b733a33323a223761343665386233326131636530346630363362613638646264343232306432223b733a33323a223166303135376463653164633266316636323862353639343638346430366164223b733a33323a223638653664336266343565383532353533373766393731666261313430656438223b733a33323a223530313266336339623431626266343239383365646639323537363932643466223b733a33323a223265333864303965373062623539356233343734316666663630376633626239223b733a33323a226530323961663436623165633533626237393834386166663239656462393563223b733a33323a223332323639363761313736363232396335393166376234303032653366633330223b733a33323a223165383866663033333138353139353862363230356531643538383865373537223b733a33323a223162326535356465323839353961336537633765326664613832313663666164223b733a33323a223065666662343431656438616130336338316631643663643065353435346262223b733a33323a226638653430356465623435313732656334303663633762383239633832353438223b733a33323a226663306162363063623531636137393864663731616665396165356638333435223b7d733a343a2268617368223b733a36353a2266633061623630636235316361373938646637316166653961653566383334352d6638653430356465623435313732656334303663633762383239633832353438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729272299),
('catkr6i1p0m4n24qaqdgkcts22', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383836343033322e3231393735333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232323136626233686172323772716537656831636e6b756e3234223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383930303839393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383930373032313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383930363836373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223062663163663030643563323533623035633631626534323238386465323334223b733a33323a223831346134383730643937383133653065316337616636623665386336393634223b7d733a343a2268617368223b733a36353a2238313461343837306439373831336530653163376166366236653863363936342d3062663163663030643563323533623035633631626534323238386465323334223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32343a7b733a33323a226238646539333762326462616363353333393833393062393439343738303864223b733a33323a223939653762313131383137646635643935666233663063373365316264636265223b733a33323a223862313030643432646239383431323961653232376137346461633063373036223b733a33323a223734646331653332343534663164643464386431353835323261386535623363223b733a33323a226139376464633063646438386564396439383765666662613332623863303766223b733a33323a226539356234323663313464393430303961333335376664663465376538666239223b733a33323a223432346235356239303663653532343130613333616464356434343938663038223b733a33323a223765363136643230633436346431616163633163613831663639353765326263223b733a33323a223466346262636434313066316235396366666633323530333033643461633037223b733a33323a223066363338653830366436393035366461396361396661613663623238333038223b733a33323a223166343333363333346538373563356139653539623665353465396663323263223b733a33323a223033363833363334663834393831636263386539303832383063633238633631223b733a33323a226161643362616531323638613734313338373565363939396566326663383432223b733a33323a223436656564303065393530326562643464303036363362636532373362666463223b733a33323a226338613134393032616530656162326630313736613461303839653833663462223b733a33323a223830613336303665643337626463663530646263363430363537386636303038223b733a33323a223932316230343035343836353263343464323963393665303837326235653263223b733a33323a223034326163326335353232386630373038393530646166343963616436356261223b733a33323a223166323932363762313131613732353332303236643161333338343762373639223b733a33323a223363633135303332396532353032393862343538666538323462303830633865223b733a33323a223931393265343337653433663233373930376134396433353636393037346461223b733a33323a226337646464313832333334343230313461396633646231353533663039643639223b733a33323a226232326239326431336230663062626264656161653564356237356566336335223b733a33323a223563306666643136303135633937313138666339616139366233386534363433223b733a33323a223465333832663037316265633832653763326334323363306232383038373364223b733a33323a223031396134616437353562363833653436653239303232633836353038623137223b733a33323a223034373330303565356264643339396464333765363861366231343035623237223b733a33323a223261353161343137373063353235366531336565323831643564356363383337223b733a33323a226536396132313530623830363734666638353131303064303962393034653430223b733a33323a226336656339333336623138663435333835356262323063353432316239626366223b733a33323a226336623335396531646132386363663233393637613639326663613966623936223b733a33323a223133653630323035646531633834393339643631373864393033643266343833223b733a33323a226665636334623065383235393763343737613335336237376632643065626431223b733a33323a223637613061343462613632323139383866626535393966663362323561626666223b733a33323a226565616663656231656131333965633430663265383433666137366335636235223b733a33323a223437626331666334386139343336613230643130636264643065313366616237223b733a33323a223830333330383339373239353261393066303961373632323137626430353834223b733a33323a223730383661613965633863643666646165343436323061303338643965353839223b733a33323a223731663839313336356331306362386664666561666463643038656365663362223b733a33323a223634393036366666613866346465653834666234383733656433343638343139223b733a33323a223131333961306566666265323035333534383331323730303862313638633363223b733a33323a223436333537616566376535326364373964646431653963646234363262343965223b733a33323a226133663032653463326365346531353732623661313839623162323564323363223b733a33323a226262346636643832653736663831343536633934333739376634376565326132223b733a33323a223239323837613762633764623638323032386634313836303437663461383465223b733a33323a223238346464666664653336306233316132613261663161653265313061643666223b733a33323a223039386536333363313034373539623635643230663165323731373537616262223b733a33323a223932653837306639303864323135646135373865323361643038653032303166223b7d733a343a2268617368223b733a36353a2239326538373066393038643231356461353738653233616430386530323031662d3039386536333363313034373539623635643230663165323731373537616262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32353a7b733a33323a226139346665386434376364393963376134643833303561623861373438386332223b733a33323a223933323634633762633435633330333232383065323537373264333263623537223b733a33323a223330343833663430393534316630643232336531623064353638663835336134223b733a33323a226563373865623231623662646338353333636639353062376637303430663038223b733a33323a223061313730663839313663346462356135646334386131653831636462326239223b733a33323a226635656334306164653835343238653739313230643536623837356131373137223b733a33323a223635303031633137376632623164376338646630306332643338373732616235223b733a33323a223930663235333936326333663161616635633062656536326636393035396631223b733a33323a226562363865383131376132666232626438363562376333386434383832616463223b733a33323a223235623766636165313538366164626331323263356335373866353933333131223b733a33323a223830393037333865333438386433393364663663376465326236623662323162223b733a33323a226561346136336631363036663562323639366261366131326433313565386433223b733a33323a223334643565366263366465666237303162373937663866366535393235326331223b733a33323a226537323839303635306136366663623261633734323839303061306431623833223b733a33323a226237306564656231313031633634396339323832313832333836383934386336223b733a33323a223538323861396531623664336231376166346534336464623230306331363131223b733a33323a223637343562636535653063653762316563316162366231353865616363626531223b733a33323a226365363737393066393533626236613530633233346133306464623264626463223b733a33323a223739336566336535356138333535336164663430303736616335636562623563223b733a33323a226138363733313331636363626330623861643938363237393038623833363761223b733a33323a223665613165633733393136393630616466636639346366623737326136346436223b733a33323a226266333832306565616637356333353134643530343862363664303834623262223b733a33323a223334633830643166373032613066306561633737303663316237623036346133223b733a33323a223335313564653337623737633530626336386561373933666637346332353562223b733a33323a223261383661393865363862666466346432396232623936666466656466396636223b733a33323a223233633461626635626135653562343635396664636665363263303238353461223b733a33323a223364333434353664303137363339633532333361626632346261616234356664223b733a33323a226234653763376537613038646137623465383739366362396564623637373565223b733a33323a223836353639343536643235656538616130623161653764393430396235326262223b733a33323a223939666532613937653139393461333863333861323961353664343661363531223b733a33323a223966633732663736663838643931653538336438663635393937613635393139223b733a33323a223861363537623262356135326336326363326439313963396134336332366361223b733a33323a223163316232336431616432623265313335653833353132356233643930306566223b733a33323a226636343662383432343236373934313662383932346366326462643134366631223b733a33323a223062643335653033336336653938373739323135373334343261663731333433223b733a33323a223861366566323365633237373336346630373138316464653962656534366333223b733a33323a223463623931633934393135333464343739383764353230663635376664333136223b733a33323a226663306339613636633662383032323037343736333261343937666437323866223b733a33323a226463633064356661343139306637333361636239616561373337633337373733223b733a33323a223934356338343730386338353438626532373536616432383731303864376164223b733a33323a226665383661646565616364306635616131613366333263333933366266656233223b733a33323a223662346439316435623039353361623535663461363465363063663864363961223b733a33323a226466313233333731313439663532653734326132653462336433613234396235223b733a33323a223931663336396634326136313933383039633237303031643332313763633335223b733a33323a223431623534666263613031616562356632323161363536343465316562323066223b733a33323a226637623131323336656661313539633336303562356230643765313633346533223b733a33323a223839383930336333316265656439393938663134306165396131383832613065223b733a33323a223431623539313662353866383936646538616634313139303636313961613334223b733a33323a223734623433386463626337393430393865346536653331663338666235616132223b733a33323a223630663639343233323835363066616635316531346230353065663034333261223b7d733a343a2268617368223b733a36353a2236306636393432333238353630666166353165313462303530656630343332612d3734623433386463626337393430393865346536653331663338666235616132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728864032),
('ep43eqha8vk6dpr4mna95946qm', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303638363531312e3033323238343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22657034336571686138766b36647072346d6e613935393436716d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303732393731313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223163303635646131333262656261343632646665623933376363323062356563223b733a33323a226633626262356163623736643935303633623236616335333937373462656431223b7d733a343a2268617368223b733a36353a2266336262623561636237366439353036336232366163353339373734626564312d3163303635646131333262656261343632646665623933376363323062356563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730686511),
('hib02ks27dms1nu3n34j0adetu', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383839373732332e3436303537313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268696230326b733237646d73316e75336e33346a306164657475223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934303932333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223032333066373234653564303834343164636566353061336361613035396434223b733a33323a226331386431346639343834656261306331396439633664633535356230326261223b7d733a343a2268617368223b733a36353a2263313864313466393438346562613063313964396336646335353562303262612d3032333066373234653564303834343164636566353061336361613035396434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728897723),
('hl397ulgs3klh20m9936uor8t5', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383839373732332e3233343932373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2276353061676667766a6e726a6166693768656f666f3668376233223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383933333339303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383934303638333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383933373038303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934303031343b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223435666331633766653061363439643565336263373864313065643365623866223b733a33323a223632303639653932366534633266346237373864303164366435633964313533223b7d733a343a2268617368223b733a36353a2236323036396539323665346332663462373738643031643664356339643135332d3435666331633766653061363439643565336263373864313065643365623866223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a223362636531636162316233326330383438663038313238663331646534626138223b733a33323a223633353864633236393261323863393038666263326432643131363234653738223b733a33323a226631383033336166656432336535376564356134363237386238393863306637223b733a33323a226332313137656437643637623334316562366232653334343563653762363739223b733a33323a226636343765366133636366343530323162386365643764376238623762396432223b733a33323a226266373863363863653166383634633035356163663937383539653134303362223b733a33323a226333306338313034653763663438653564333837333433376561616166316532223b733a33323a226230353664323032663865323833623065646165393035373839363432363234223b733a33323a223135656664643161633433633037386134663062366430656235616464306131223b733a33323a226130363161373439373264376430316631326430633063386439393630353332223b733a33323a226533336434306265303262313333383362613162356565366237323330373939223b733a33323a223331343865323535326333323062353233336438343037396264323563646338223b733a33323a226338383635313133363138333839346238323264373436613965653631666334223b733a33323a223335623331323263353463336633643566646430333835666436336632303861223b733a33323a226434313735376538646234313238333162323963356239393838383764663763223b733a33323a223061613031623532616565306236393435363062643362356332653635303362223b733a33323a223031616261636333333962386230396634346632363437333935663439623433223b733a33323a223665613033643632303365306137326462376438363763616464626634363035223b733a33323a223334356634653235623932326538363630666433393964666664346531303866223b733a33323a223035373761626133366138613733303836623031666637303136616235336435223b733a33323a226465376461326537383639373466363539383534386364343165373665316537223b733a33323a223762613634313634393563636239346464353765643964316161616130643466223b733a33323a226634623037636634626134663232343937366163343465373333303534376233223b733a33323a223665386539646230623134333439313337626463613830373636626334323635223b733a33323a223265356363623838323539633462656532393035646433353036626136376330223b733a33323a226533356130633531313163386263333230356666636333653765616464626235223b733a33323a223833623866643635343133313563613030333964353636303839623966653331223b733a33323a223438666633616361386165643935343664306161373037643365393831613937223b7d733a343a2268617368223b733a36353a2234386666336163613861656439353436643061613730376433653938316139372d3833623866643635343133313563613030333964353636303839623966653331223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223431363234333062306231626562343161663433363834653134323535363837223b733a33323a223334306132373939653631663330613362313366373435623163353465363862223b733a33323a223936353934383339333761333263396132393462666431653064356138386331223b733a33323a223335393233376431613464363236373431383633646234303537366464366564223b733a33323a223765363638646137326235613565353262333738356364623234346136373764223b733a33323a223735376633653861306333326635663763663466313361623237333561363533223b7d733a343a2268617368223b733a36353a2237353766336538613063333266356637636634663133616232373335613635332d3765363638646137326235613565353262333738356364623234346136373764223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31353a7b733a33323a223238626130356363383135646537373737663936333031343661633239356462223b733a33323a223837633039656264616561303137646331353739613638613962633232306237223b733a33323a223237623932373561626262346534366364346335366534323536383861613939223b733a33323a223165366465323635336261366361613235356362353138343034613033613931223b733a33323a223962363235303837616630383235613061663534376563626534653362663065223b733a33323a226665343739386135613837313334616535353634313636626430623861653133223b733a33323a223566306130356330623165303232626432666131373666306661623634626438223b733a33323a223830653439333936616561653134636630373734643338303832386532346566223b733a33323a226666646161616233643963376235386538613634323762346161623763343562223b733a33323a223132333531393937613861343063383731353166363833646264396464663863223b733a33323a223734373230313530373136343931323763636261653632363232343931646132223b733a33323a226265373465393636343034356333633132616636643730313936396437613833223b733a33323a223534393366666264326363353663636562313136306531366564393332303734223b733a33323a223131633562626338653466313433333336613465363365313261363339376436223b733a33323a223136333333313736346666653531623363616335616435666434646339313864223b733a33323a223638653634656162336664356633336266376330303335353837636466353464223b733a33323a226537346162643762383037303132316337326539616339623135653661363434223b733a33323a223935623465316137323766656465386535396130316637623861396333373836223b733a33323a223266353364666361386635663465373235396164613935306431376634633166223b733a33323a223432336566383235356262376361353466373234333638623239656235303963223b733a33323a223563393065343961313063393230656437656261313832323162376665306538223b733a33323a223930313166653832313835636330363965313562363465653765613637663839223b733a33323a223335616332383536393134623163313862353533343234336130623362393831223b733a33323a223737643262336435643333653363383364343231383330366362373830333566223b733a33323a226430646462383531663035373439353731326461626631646533623662636265223b733a33323a226664346531656162636163643262653133623664666536666161363661303738223b733a33323a226466366362623136653636333130663734653934323734306334326363306632223b733a33323a223762663263336238343336323738643435336231343432383733653066633264223b733a33323a223230653339373162373633643833323965633032373634376537376635383234223b733a33323a226336383462383834393536663530613066336265343639306137653239393033223b7d733a343a2268617368223b733a36353a2263363834623838343935366635306130663362653436393061376532393930332d3230653339373162373633643833323965633032373634376537376635383234223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728897723),
('jb1esrqkpa5ughhsldemm7n0fk', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323032353731382e3139333734323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356d387537736c74626a6272676a6931316436366a6c316a6a74223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323036383636393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323036383735323b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223564323361326261356261626430363635316663623263343263383434306231223b733a33323a226139346335313031653638663834633534356338393661356666623437633463223b7d733a343a2268617368223b733a36353a2261393463353130316536386638346335343563383936613566666234376334632d3564323361326261356261626430363635316663623263343263383434306231223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226332366565373663326236633031363635633231643465633338613864343766223b733a33323a223231313565633835323466393834663765636636353930363066326134366137223b733a33323a223532393536613664326337626230353930313239363236346563386264656133223b733a33323a226637343032623630356562323463396437353537613332383236323935323639223b733a33323a223865363266323531313661383964653834386366396466643038636562336334223b733a33323a226136613662663665323266616664643138333664653936643032353061396264223b733a33323a226539303934623266396239363465666466616435376632633763393165663237223b733a33323a223464393031396134333036666532336537643137643161373561623066653562223b7d733a343a2268617368223b733a36353a2234643930313961343330366665323365376431376431613735616230666535622d6539303934623266396239363465666466616435376632633763393165663237223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732025718),
('kau60afc0dutjlepeqeocus41g', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303032353939342e3034313933393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b61753630616663306475746a6c65706571656f637573343167223b7d7d, 1730026001);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ljm8d917k2n6b0heae3r8s2k3o', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393138383739392e36363538353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223572373376766f6f3368396c3276386b337461726a3367383765223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393232333035353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732393233303737373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393233303339313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226662383133356639643064393262656462656433393436373266353465646332223b733a33323a223334363830663830343366326236636333613766376534376433333163326262223b733a33323a226534376139303566326237663335323762616162313331303133353061396139223b733a33323a226337363133376561396562643762663162663832643362346230346262656366223b7d733a343a2268617368223b733a36353a2263373631333765613965626437626631626638326433623462303462626563662d6534376139303566326237663335323762616162313331303133353061396139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a226364613634333736343235656363623636333362656465623763313165323934223b733a33323a223134393861613966636138393233303662636637353133386263373466623164223b733a33323a226135636130383937643938613533383034326630666136356432316331626563223b733a33323a226437333731616237383462313231323862306438383163363532373839653935223b733a33323a223862626661336330356165343530633662343532666638366361363438303635223b733a33323a223938633563626132623933633461323830666134646232623164363961366663223b733a33323a223662663437306232383662613937313736623637666632313135656431336237223b733a33323a223364636532353137366361313366316433343037303432636631613939613162223b733a33323a226465633365376262646465643530363766366331373132373535386630653834223b733a33323a223438303863383635386163346164313637633832613961353562326661303165223b733a33323a226630333764303337313830316561666235636461626337626562643530376533223b733a33323a223465633733616362333363326464373936383039636632343133326666333031223b733a33323a226364326231613863393766303663326530316533656666353561666661623539223b733a33323a223130363861366631313964656138613138333738346266373032393639666464223b733a33323a223666666539333333373964343631313534616533383137393334313161353139223b733a33323a223633363365323464366532303932623235313239343939313733386464663331223b733a33323a226431653833303932396236633863373938633461623165303132613266373839223b733a33323a226630373433336238373235343538303164656261383639663339323365633734223b733a33323a226163363765626137303464333731336637653938373636656330363132346662223b733a33323a223061373239346364633130653437326335656163646263383630623663616336223b733a33323a226332323261636233356433636637656234336234343664353565363036376639223b733a33323a223932666431633736343133663333633339326238646466656430316337366237223b733a33323a223862363233646361613438353464393935383331623564396137613762333663223b733a33323a223461613337373862363234363833323664643435376534643066303730613464223b733a33323a223962326265303637333135313366376536356465356434366637303330306165223b733a33323a223039396632343062616335653133663032313364373738353037313964663132223b7d733a343a2268617368223b733a36353a2230393966323430626163356531336630323133643737383530373139646631322d3962326265303637333135313366376536356465356434366637303330306165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223763663065636237333462643961313133663061306330363061666535623833223b733a33323a223635373965356438653738626566386539383565643831316130376665663433223b733a33323a226361613464313565343933313565633634323137623538373361336532363863223b733a33323a223234623865623239366263346631316561656336623762303263303830336430223b7d733a343a2268617368223b733a36353a2232346238656232393662633466313165616563366237623032633038303364302d6361613464313565343933313565633634323137623538373361336532363863223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729188799),
('qvrq6gnmtiegog562f107ubuc8', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383836353134362e3832363933313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227176727136676e6d746965676f67353632663130377562756338223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383930383334373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223034656238363164613066666335353439353431643031383163353739383434223b733a33323a226630303837616665396264343634353930656164633364343839303835343165223b7d733a343a2268617368223b733a36353a2266303038376166653962643436343539306561646333643438393038353431652d3034656238363164613066666335353439353431643031383163353739383434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728865148),
('rdervf90flf6jdci3fgcln2oka', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393235393232332e3631333435373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2268666c6a6e746f34656463643865697466753676313171666367223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393330303632313b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226338306266353866333730613164616231366538636530633364643731613039223b733a33323a223466333738616630636138316537623361323331366265383633376434633237223b7d733a343a2268617368223b733a36353a2234663337386166306361383165376233613233313662653836333764346332372d6338306266353866333730613164616231366538636530633364643731613039223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729259223),
('rkr7b8t2qasm3os5f8p2clq9tv', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323532363034372e3537323538363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227673716a66686674747171723368746a63376d70306934317374223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536393037363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323536393131333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536393234373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226339393136613435643733376466343965633538363965663238366432313665223b733a33323a223734646433646563663964653135323165636462396461643438343636383336223b7d733a343a2268617368223b733a36353a2237346464336465636639646531353231656364623964616434383436363833362d6339393136613435643733376466343965633538363965663238366432313665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a333b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223461363037373664313666663964303333373762363336303338386662373164223b733a33323a226233663463383861613365373634376132626431333839373137633739666637223b7d733a343a2268617368223b733a36353a2262336634633838616133653736343761326264313338393731376337396666372d3461363037373664313666663964303333373762363336303338386662373164223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223939653439323336303966303730316361393832393536663132333264373263223b733a33323a223332613964646262346433313438393761666230316435643539653565346235223b733a33323a226132303636353337326266656463623435616566346238396137326262613239223b733a33323a223464353234633734653136363232623831346631386461653435643661326661223b733a33323a223436323337316363333361316562363237643738616636653466316134643639223b733a33323a223966646137336361386138623566623766656531623534643633656463623334223b733a33323a223735666335626462386162326339386366383436643632633632363663326330223b733a33323a226235633265376163366666633833336231376464366137623339343338346166223b733a33323a223635366237353836303065353339373935666562343235373966323162393464223b733a33323a223039643838306265363335626262646365363433633864353533376634303461223b733a33323a223164343863393035643232326237303933616132353432383665323733393366223b733a33323a223763616232333330356563386134663932646566346332616330356564646338223b733a33323a226131306663623935613762636263363134373664626437353235646337343934223b733a33323a223939383034616230663663323033653162396636353062646565643635636630223b733a33323a223135326262636436626236326565313637373836316364373866356338346264223b733a33323a226162333037313934316231666639306538633462633332366433653564613166223b733a33323a223133656563303137353738613231636334366330656466376662373937633138223b733a33323a223732623964633434383033626161393262633037336631663834613266633033223b7d733a343a2268617368223b733a36353a2237326239646334343830336261613932626330373366316638346132666330332d3133656563303137353738613231636334366330656466376662373937633138223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732526047),
('seoo8cfk1s5qtfgm4fchs4vat5', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303638363531302e3731373234373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227364306f3071306d6c3870767636366d366173306e6a616a6567223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303732393639323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223861363463363031616465313839666534356234333639303239356538316432223b733a33323a226663616565636233633462313462616363353537383162646132633462636664223b7d733a343a2268617368223b733a36353a2266636165656362336334623134626163633535373831626461326334626366642d3861363463363031616465313839666534356234333639303239356538316432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1730686510),
('uc0oiufkrn223ev58lqnpf3d5c', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393137393738312e3334363038353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22666c76736867346767683262386239756a6c31716f7237623967223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393231333830373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732393231343239363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393231343930313b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223139656434316265646330373137373038666662633366653062613864613563223b733a33323a223732376531616466373834346364373963373263303638313435663330313036223b7d733a343a2268617368223b733a36353a2237323765316164663738343463643739633732633036383134356633303130362d3139656434316265646330373137373038666662633366653062613864613563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226662303132623831653663333938343063666437316664613535333465656366223b733a33323a223266633735373166663432393138363735386365373637613333643130306566223b733a33323a226637386330373736623062363039616533643939373832623362643330303763223b733a33323a223836336634373533663330396561623865363761613564373132386637306164223b733a33323a223062626465346636636438396235623561333164363161623465636132396439223b733a33323a226665363964316636363035623133373038623533363764343964326430646132223b7d733a343a2268617368223b733a36353a2266653639643166363630356231333730386235333637643439643264306461322d3062626465346636636438396235623561333164363161623465636132396439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223436633135373433396366346431623031303438336433333265656135323065223b733a33323a223864373763623764373335653163643831353332646363366564363562643537223b733a33323a223161356238646637613438323132326363643430323165633033316438616362223b733a33323a223631353235396564663535313464396332366663383566376333316430613030223b7d733a343a2268617368223b733a36353a2236313532353965646635353134643963323666633835663763333164306130302d3161356238646637613438323132326363643430323165633033316438616362223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729179781),
('v78houh3ola0g349f7jcqer8hh', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303130383130332e3133333731383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626e727138356476673637766274703231386334736968726864223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303134373132343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303135313330323b7d7d72656469726563745f75726c7c733a33353a22687474703a2f2f6c6f63616c686f73743a383038302f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223963366337323937336437313430336538366434316233396261663634313466223b733a33323a226364316232323539633334613162633633326439643938323834643266313130223b7d733a343a2268617368223b733a36353a2263643162323235396333346131626336333264396439383238346432663131302d3963366337323937336437313430336538366434316233396261663634313466223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226638373838363534353336326338303961323761376637626133303163366436223b733a33323a223562383935333064343436313163616566306436366236623339316165376262223b7d733a343a2268617368223b733a36353a2235623839353330643434363131636165663064363662366233393161653762622d6638373838363534353336326338303961323761376637626133303163366436223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730108103);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"krikounoureddine@gmail.com\"'),
('default_site', '\"\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('disable_jsonld_reverse', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"csv\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('favicon', '\"\"'),
('installation_title', '\"PhoneShop - Site de Vente de T\\u00e9l\\u00e9phones\"'),
('locale', '\"en_US\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('value_languages', '[]'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `thumbnail_id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, NULL, 1, 'universite', 'default', 'université paris 8', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Parcourir\",\"query\":\"\"},\"links\":[]}]', '[]', '2024-10-17 18:31:31', '2024-10-17 19:51:45', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `layout`, `layout_data`, `created`, `modified`) VALUES
(1, 1, 'welcome', 'Bienvenue', 1, NULL, NULL, '2024-10-17 18:31:31', '2024-10-17 18:31:31');

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `layout_data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"    <p>Welcome to your new site. This is an example page.<\\/p>\\r\\n    <ul>\\r\\n        <li>This is a bullet list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ul>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <ol>\\r\\n        <li>This is an ordered list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ol>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <blockquote>This is a blockquote.<\\/blockquote>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <div><a href=\\\"#\\\">This text is a link, which currently points to nothing.<\\/a><\\/div>\\r\\n    <p><strong>This text is bold, in a &lt;strong&gt; tag.<\\/strong><\\/p>\\r\\n    <p><em>This text is italicized, in an &lt;em&gt; tag.<\\/em><\\/p>\\r\\n    <p><u>This text is underlined, in a &lt;u&gt; tag.<\\/u><\\/p>\\r\\n    <p><s>This text has a strikethrough, in a &lt;s&gt; tag.<\\/s><\\/p>\\r\\n    <p>This text is <sub>subscript<\\/sub> and <sup>superscript<\\/sup> using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.<\\/p>\\r\\n    <hr \\/>\\r\\n    <h1>This is an H1 title. It is bigger than the Page Title, which is rendered in H2.<\\/h1>\\r\\n    <h2>This is an H2 header, the same size as the Page Title.<\\/h2>\\r\\n    <h3>This is an H3 subheader.<\\/h3>\\r\\n    <h4>This is an H4 subheader.<\\/h4>\\r\\n    <h5>This is an H5 subheader.<\\/h5>\\r\\n    <h6>This is an H6 subheader.<\\/h6>\"}', NULL, 1),
(2, 1, 'lineBreak', '{\"break_type\":\"opaque\"}', NULL, 2),
(3, 1, 'html', '{\"html\":\"    <h2 style=\\\"font-style:italic;\\\">This is the \\\"Italic Title\\\" block style.<\\/h2>\\r\\n    <h3 style=\\\"color:#aaaaaa;font-style:italic;\\\">This is the \\\"Subtitle\\\" block style.<\\/h3>\\r\\n    <div style=\\\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\\\">This is the \\\"Special Container\\\" block style.<\\/div>\\r\\n    <p><span class=\\\"marker\\\">This is the \\\"Marker\\\" inline style. <\\/span><\\/p>\\r\\n    <p><big>This is the \\\"Big\\\" inline style.<\\/big> This is normal text.<\\/p>\\r\\n    <p><small>This text is inside a \\\"small\\\" inline style.<\\/small> This is normal text.<\\/p>\\r\\n    <p><code>This is the \\\"Computer Code\\\" inline style.<\\/code><\\/p>\\r\\n    <p><span dir=\\\"rtl\\\">\\u0644\\u0643\\u0646 \\u0644\\u0627 \\u0628\\u062f \\u0623\\u0646 \\u0623\\u0648\\u0636\\u062d \\u0644\\u0643 \\u0623\\u0646 \\u0643\\u0644 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u0641\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0645\\u063a\\u0644\\u0648\\u0637\\u0629 \\u062d\\u0648\\u0644 \\u0627\\u0633\\u062a\\u0646\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0646\\u0634\\u0648\\u0629 \\u0648\\u062a\\u0645\\u062c\\u064a\\u062f \\u0627\\u0644\\u0623\\u0644\\u0645 \\u064a\\u0639\\u0631\\u0636 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u064a\\u0645\\u064a\\u0646 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u064a\\u0633\\u0627\\u0631.<\\/span><\\/p>\"}', NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_setting`
--

INSERT INTO `site_setting` (`id`, `site_id`, `value`) VALUES
('attachment_link_type', 1, '\"item\"'),
('browse_attached_items', 1, '\"0\"'),
('browse_body_property_term', 1, '\"\"'),
('browse_defaults_public_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_heading_property_term', 1, '\"\"'),
('disable_jsonld_embed', 1, '\"0\"'),
('exclude_resources_not_in_site', 1, '\"0\"'),
('favicon', 1, '\"\"'),
('filter_locale_values', 1, '\"0\"'),
('item_media_embed', 1, '\"0\"'),
('locale', 1, '\"\"'),
('property_label_information', 1, '\"none\"'),
('search_resource_names', 1, '[\"site_pages\",\"items\"]'),
('search_restrict_templates', 1, '\"0\"'),
('search_type', 1, '\"sitewide\"'),
('show_attached_pages', 1, '\"1\"'),
('show_locale_label', 1, '\"1\"'),
('show_page_pagination', 1, '\"1\"'),
('show_user_bar', 1, '\"0\"'),
('show_value_annotations', 1, '\"\"'),
('subnav_display', 1, '\"\"'),
('theme_settings_default', 1, '{\"accent_color\":\"#920b0b\",\"nav_depth\":\"0\",\"logo\":\"1\",\"banner\":\"\",\"banner_height\":\"\",\"banner_height_mobile\":\"\",\"banner_position\":\"center\",\"browse_body_truncation\":\"full\",\"footer\":\"Powered by Omeka S\"}'),
('vocabulary_scope', 1, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'krikounoureddine@gmail.com', 'KRIKOU Noureddine', '2024-10-13 22:14:58', '2024-10-13 22:14:58', '$2y$10$VREVy9C8GrCpNqGliBsTWOetF8ZKl1CGPOvsTdSICMeZcSabm5ZxG', 'global_admin', 1),
(3, 'samuel.szoniecky@univ-paris8.fr', 'samuel szoniecky', '2024-11-25 09:09:44', '2024-11-25 09:10:59', '$2y$10$hxsULiUiBRDUgmZbhAU6q.ei9o7Lq4TheDECLV6yRTurLUCG/Xigu', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 3, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 3, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 3, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 3, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 3, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 3, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 3, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 3, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 3, '\"\"'),
('locale', 1, '\"en_US\"'),
('locale', 3, '\"en_US\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(59, 8, 1, NULL, NULL, 'literal', '', 'Utilisateur 1', NULL, 1),
(74, 9, 1, NULL, NULL, 'literal', '', 'Utilisateur 2', NULL, 1),
(89, 9, 221, NULL, NULL, 'literal', '', '2', NULL, 1),
(90, 8, 221, NULL, NULL, 'literal', '', '1', NULL, 1),
(91, 10, 1, NULL, NULL, 'literal', '', 'TELEPHONE', NULL, 1),
(106, 10, 233, NULL, NULL, 'literal', '', 'telephone portable', NULL, 1),
(107, 10, 234, NULL, NULL, 'literal', '', 'Mos', NULL, 1),
(108, 9, 222, NULL, NULL, 'literal', '', 'Islame mokrani', NULL, 1),
(109, 8, 222, NULL, NULL, 'literal', '', 'krikou noureddine', NULL, 1),
(110, 11, 1, NULL, NULL, 'literal', '', 'Stock 1', NULL, 1),
(125, 11, 232, NULL, NULL, 'literal', '', '122 produits', NULL, 1),
(126, 11, 11, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(127, 11, 11, 9, NULL, 'resource', NULL, NULL, NULL, 1),
(128, 12, 1, NULL, NULL, 'literal', '', 'Produit 1', NULL, 1),
(129, 13, 1, NULL, NULL, 'literal', '', 'paiement', NULL, 1),
(130, 14, 1, NULL, NULL, 'literal', '', 'livreaison 1', NULL, 1),
(131, 15, 1, NULL, NULL, 'literal', '', 'Commande', NULL, 1),
(132, 16, 1, NULL, NULL, 'literal', '', 'Avis 01', NULL, 1),
(147, 16, 240, NULL, NULL, 'literal', '', '5 étoile', NULL, 1),
(148, 16, 239, NULL, NULL, 'literal', '', 'bien service', NULL, 1),
(163, 15, 235, NULL, NULL, 'literal', '', '12/12/2024', NULL, 1),
(164, 15, 236, NULL, NULL, 'literal', '', 'confermé', NULL, 1),
(165, 15, 237, NULL, NULL, 'literal', '', '200$', NULL, 1),
(180, 14, 238, NULL, NULL, 'literal', '', '05/11/2024', NULL, 1),
(195, 13, 241, NULL, NULL, 'literal', '', 'PYPAL', NULL, 1),
(210, 12, 227, NULL, NULL, 'literal', '', '00001', NULL, 1),
(211, 8, 223, NULL, NULL, 'literal', '', 'krikounoureddine@gmail.com', NULL, 1),
(212, 8, 224, NULL, NULL, 'literal', '', 'achteur', NULL, 1),
(213, 8, 225, NULL, NULL, 'literal', '', '32 Grande Rue', NULL, 1),
(214, 8, 226, NULL, NULL, 'literal', '', '0745553923', NULL, 1),
(215, 9, 223, NULL, NULL, 'literal', '', 'mokraniislam998@gmail.com', NULL, 1),
(216, 9, 224, NULL, NULL, 'literal', '', 'vendeur', NULL, 1),
(217, 9, 225, NULL, NULL, 'literal', '', 'paris', NULL, 1),
(218, 9, 226, NULL, NULL, 'literal', '', '0675529561', NULL, 1),
(219, 10, 229, NULL, NULL, 'literal', '', 'iphone', NULL, 1),
(220, 10, 227, NULL, NULL, 'literal', '', '001', NULL, 1),
(221, 10, 228, NULL, NULL, 'literal', '', 'iphone 12 ', NULL, 1),
(222, 10, 230, NULL, NULL, 'literal', '', '122$', NULL, 1),
(223, 10, 231, NULL, NULL, 'literal', '', 'neuf', NULL, 1),
(224, 10, 11, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(225, 10, 11, 9, NULL, 'resource', NULL, NULL, NULL, 1),
(226, 11, 11, 10, NULL, 'resource', NULL, NULL, NULL, 1),
(227, 12, 228, NULL, NULL, 'literal', '', 'protège iphone 12', NULL, 1),
(228, 12, 230, NULL, NULL, 'literal', '', '12$', NULL, 1),
(229, 12, 231, NULL, NULL, 'literal', '', 'aaaaaa', NULL, 1),
(230, 12, 11, 13, NULL, 'resource', NULL, NULL, NULL, 1),
(231, 13, 11, 14, NULL, 'resource', NULL, NULL, NULL, 1),
(232, 14, 11, 15, NULL, 'resource', NULL, NULL, NULL, 1),
(233, 15, 11, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(234, 15, 11, 9, NULL, 'resource', NULL, NULL, NULL, 1),
(235, 15, 11, 16, NULL, 'resource', NULL, NULL, NULL, 1),
(236, 16, 11, 8, NULL, 'resource', NULL, NULL, NULL, 1),
(237, 16, 11, 9, NULL, 'resource', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(7, 1, 'https://example.com/phoneshop#', 'ps', 'Ontologie Projet PhoneShop', 'Ontologie pour le site e-commerce PhoneShop dedie a la vente de telephones mobiles.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Index pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

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
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
