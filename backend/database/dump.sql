-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.100.9
-- Tempo de geração: 30/05/2020 às 15:18
-- Versão do servidor: 8.0.20
-- Versão do PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `voting`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1503250034279_user', 1, '2020-05-29 21:01:50'),
(2, '1503250034280_token', 1, '2020-05-29 21:01:54'),
(3, '1542197471684_team_schema', 1, '2020-05-29 21:01:58'),
(4, '1542197472152_project_schema', 1, '2020-05-29 21:02:01'),
(5, '1542197506878_user_team_schema', 1, '2020-05-29 21:02:07'),
(6, '1542197522235_invite_schema', 1, '2020-05-29 21:02:14'),
(7, '1542215526055_create_permissions_table', 1, '2020-05-29 21:02:16'),
(8, '1542215526068_create_roles_table', 1, '2020-05-29 21:02:19'),
(9, '1542215526074_create_permission_role_table', 1, '2020-05-29 21:02:26'),
(10, '1542215526076_create_permission_user_table', 1, '2020-05-29 21:02:34'),
(11, '1542215526077_create_role_user_table', 1, '2020-05-29 21:02:41');

-- --------------------------------------------------------

--
-- Estrutura para tabela `invites`
--

CREATE TABLE `invites` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `team_id` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `invites`
--

INSERT INTO `invites` (`id`, `user_id`, `team_id`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'marcos@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `slug`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'write', 'Escrita', 'Usuário tem permissão de escrita', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED DEFAULT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `permission_user_team`
--

CREATE TABLE `permission_user_team` (
  `id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED DEFAULT NULL,
  `user_team_id` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `permission_user_team`
--

INSERT INTO `permission_user_team` (`id`, `permission_id`, `user_team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `projects`
--

CREATE TABLE `projects` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `team_id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `projects`
--

INSERT INTO `projects` (`id`, `title`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 'Projeto piloto', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrador', 'Regra para o usuário Administrador', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_user_team`
--

CREATE TABLE `role_user_team` (
  `id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `user_team_id` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `role_user_team`
--

INSERT INTO `role_user_team` (`id`, `role_id`, `user_team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `teams`
--

CREATE TABLE `teams` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `teams`
--

INSERT INTO `teams` (`id`, `name`, `user_id`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Timoka', 1, 'timoka', '2020-05-30 00:00:37', '2020-05-30 00:00:37'),
(2, 'zuop', 1, 'zuop', '2020-05-30 00:02:12', '2020-05-30 00:02:12'),
(3, 'xamarin', 3, 'xamarin', '2020-05-30 12:05:21', '2020-05-30 12:05:21'),
(4, 'abobora', 1, 'abobora', '2020-05-30 12:09:32', '2020-05-30 12:09:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tokens`
--

CREATE TABLE `tokens` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Yago Lopes Lázaro', 'yagolopeslazaro@gmail.com', '$2a$10$eTu.Ll/HDDhG/kSUHEjpoec802CLn1U5VeA/xvfjqcJz7RX3aUB0G', '2020-05-29 23:54:13', '2020-05-29 23:54:13'),
(3, 'Marcos', 'marcos@gmail.com', '$2a$10$zApDYwxP3AxzXYZ3vdTmOepNgVHzToXT20id7QpnADEH9eZN3aHL.', '2020-05-30 11:46:58', '2020-05-30 11:46:58');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_teams`
--

CREATE TABLE `user_teams` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `team_id` int UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `user_teams`
--

INSERT INTO `user_teams` (`id`, `user_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-05-30 00:00:38', '2020-05-30 00:00:38'),
(2, 1, 2, '2020-05-30 00:02:13', '2020-05-30 00:02:13'),
(4, 3, 3, '2020-05-30 12:05:21', '2020-05-30 12:05:21'),
(5, 1, 4, '2020-05-30 12:09:32', '2020-05-30 12:09:32');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invites_user_id_foreign` (`user_id`),
  ADD KEY `invites_team_id_foreign` (`team_id`);

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Índices de tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Índices de tabela `permission_user_team`
--
ALTER TABLE `permission_user_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_team_permission_id_index` (`permission_id`),
  ADD KEY `permission_user_team_user_team_id_index` (`user_team_id`);

--
-- Índices de tabela `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_team_id_foreign` (`team_id`);

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Índices de tabela `role_user_team`
--
ALTER TABLE `role_user_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_team_role_id_index` (`role_id`),
  ADD KEY `role_user_team_user_team_id_index` (`user_team_id`);

--
-- Índices de tabela `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teams_slug_unique` (`slug`),
  ADD KEY `teams_user_id_foreign` (`user_id`);

--
-- Índices de tabela `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices de tabela `user_teams`
--
ALTER TABLE `user_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_teams_user_id_foreign` (`user_id`),
  ADD KEY `user_teams_team_id_foreign` (`team_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `invites`
--
ALTER TABLE `invites`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `permission_user_team`
--
ALTER TABLE `permission_user_team`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `role_user_team`
--
ALTER TABLE `role_user_team`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `user_teams`
--
ALTER TABLE `user_teams`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `invites`
--
ALTER TABLE `invites`
  ADD CONSTRAINT `invites_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `permission_user_team`
--
ALTER TABLE `permission_user_team`
  ADD CONSTRAINT `permission_user_team_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_team_user_team_id_foreign` FOREIGN KEY (`user_team_id`) REFERENCES `user_teams` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `role_user_team`
--
ALTER TABLE `role_user_team`
  ADD CONSTRAINT `role_user_team_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_team_user_team_id_foreign` FOREIGN KEY (`user_team_id`) REFERENCES `user_teams` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `user_teams`
--
ALTER TABLE `user_teams`
  ADD CONSTRAINT `user_teams_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
