-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 18 mars 2025 à 14:46
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
-- Base de données : `gestion_securite`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `Code_classe` varchar(5) NOT NULL,
  `Libelle_classe` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`Code_classe`, `Libelle_classe`) VALUES
('1', 'Classe 1');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `nom_entreprise` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `historiquemdp`
--

CREATE TABLE `historiquemdp` (
  `id_historique` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `ancien_mot_de_passe` char(64) NOT NULL,
  `date_changement` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professeur_classe`
--

CREATE TABLE `professeur_classe` (
  `id_professeur` int(11) NOT NULL,
  `Code_classe` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id_session` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date_connexion` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_deconnexion` timestamp NULL DEFAULT NULL,
  `adresse_ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `is_expired` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE `stage` (
  `id_stage` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `id_tuteur` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `sujet_stage` varchar(255) DEFAULT NULL,
  `rapport_stage` text DEFAULT NULL,
  `evaluation_stage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `suivi`
--

CREATE TABLE `suivi` (
  `id_suivi` int(11) NOT NULL,
  `id_professeur` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_stage` int(11) DEFAULT NULL,
  `date_visite` date DEFAULT NULL,
  `compte_rendu_visite` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tuteur_entreprise`
--

CREATE TABLE `tuteur_entreprise` (
  `id_tuteur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `id_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` char(64) NOT NULL,
  `sel` varbinary(16) NOT NULL,
  `role` enum('eleve','professeur','administrateur') NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `Code_classe` varchar(5) DEFAULT NULL,
  `date_creation_compte` timestamp NOT NULL DEFAULT current_timestamp(),
  `dernier_changement_mdp` date NOT NULL,
  `expiration_mot_de_passe` date NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiration` datetime DEFAULT NULL,
  `double_auth_code` varchar(10) DEFAULT NULL,
  `double_auth_expiration` datetime DEFAULT NULL,
  `double_auth_active` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `email`, `mot_de_passe`, `sel`, `role`, `date_naissance`, `rue`, `code_postal`, `ville`, `Code_classe`, `date_creation_compte`, `dernier_changement_mdp`, `expiration_mot_de_passe`, `reset_token`, `reset_token_expiration`, `double_auth_code`, `double_auth_expiration`, `double_auth_active`, `is_active`) VALUES
(1, 'sara', 'semedo', 'sarasemedo@mail.com', '1234', '', 'eleve', '2017-03-21', 'jhvgughjhgtcyffguyg', '13012', 'marseille', '1', '2025-03-13 13:40:05', '2025-03-13', '2025-03-30', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'sayf', 'idoudi', 'sayfidoudi@gmail.com', '1234', '', 'professeur', '2025-03-11', 'cbqjbdcbqhcbdd', '13012', 'marseille', NULL, '2025-03-13 15:25:01', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Michaud', 'Christian', 'michaudchris@gmail.com', '12345', '', 'administrateur', '1980-03-21', '3 rue jeanne d\'arc', '13005', 'Aubagne', '1', '2025-03-18 12:59:18', '2025-03-18', '2025-11-19', NULL, NULL, NULL, NULL, 0, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`Code_classe`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id_entreprise`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `historiquemdp`
--
ALTER TABLE `historiquemdp`
  ADD PRIMARY KEY (`id_historique`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `professeur_classe`
--
ALTER TABLE `professeur_classe`
  ADD PRIMARY KEY (`id_professeur`,`Code_classe`),
  ADD KEY `Code_classe` (`Code_classe`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id_session`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`id_stage`),
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_entreprise` (`id_entreprise`),
  ADD KEY `id_tuteur` (`id_tuteur`);

--
-- Index pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD PRIMARY KEY (`id_suivi`),
  ADD KEY `id_professeur` (`id_professeur`),
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_stage` (`id_stage`);

--
-- Index pour la table `tuteur_entreprise`
--
ALTER TABLE `tuteur_entreprise`
  ADD PRIMARY KEY (`id_tuteur`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_entreprise` (`id_entreprise`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Code_classe` (`Code_classe`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id_entreprise` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `historiquemdp`
--
ALTER TABLE `historiquemdp`
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
  MODIFY `id_stage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `suivi`
--
ALTER TABLE `suivi`
  MODIFY `id_suivi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tuteur_entreprise`
--
ALTER TABLE `tuteur_entreprise`
  MODIFY `id_tuteur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `historiquemdp`
--
ALTER TABLE `historiquemdp`
  ADD CONSTRAINT `historiquemdp_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `professeur_classe`
--
ALTER TABLE `professeur_classe`
  ADD CONSTRAINT `professeur_classe_ibfk_1` FOREIGN KEY (`id_professeur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `professeur_classe_ibfk_2` FOREIGN KEY (`Code_classe`) REFERENCES `classe` (`Code_classe`);

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `stage_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `stage_ibfk_2` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`),
  ADD CONSTRAINT `stage_ibfk_3` FOREIGN KEY (`id_tuteur`) REFERENCES `tuteur_entreprise` (`id_tuteur`);

--
-- Contraintes pour la table `suivi`
--
ALTER TABLE `suivi`
  ADD CONSTRAINT `suivi_ibfk_1` FOREIGN KEY (`id_professeur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `suivi_ibfk_2` FOREIGN KEY (`id_eleve`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `suivi_ibfk_3` FOREIGN KEY (`id_stage`) REFERENCES `stage` (`id_stage`);

--
-- Contraintes pour la table `tuteur_entreprise`
--
ALTER TABLE `tuteur_entreprise`
  ADD CONSTRAINT `tuteur_entreprise_ibfk_1` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`Code_classe`) REFERENCES `classe` (`Code_classe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
